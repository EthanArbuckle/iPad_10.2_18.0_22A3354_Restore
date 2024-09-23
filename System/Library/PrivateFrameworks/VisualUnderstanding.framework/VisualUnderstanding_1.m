uint64_t sub_249FE5AB0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t result;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  char v34;
  _QWORD *v35;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
  sub_24A01F180();
  swift_release();

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD28);
  sub_24A01F180();
  swift_release();

  if (v34 != 1)
  {
    v8 = (uint64_t)v32;
LABEL_5:
    v9 = v8;
    v10 = sub_249FA3AE0(v8, (uint64_t)v32);
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
    {
      v11 = 1;
      v12 = v32;
      v13 = v9;
      v14 = v32[2];
      if (!v14)
        goto LABEL_22;
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        v12 = v32;
      else
        v12 = sub_249F89B7C(0, v32[2] + 1, 1, v32);
      v16 = v12[2];
      v15 = v12[3];
      if (v16 >= v15 >> 1)
        v12 = sub_249F89B7C((_QWORD *)(v15 > 1), v16 + 1, 1, v12);
      v13 = v9;
      v12[2] = v16 + 1;
      v12[v16 + 4] = v9;
      v11 = 1;
      v14 = v12[2];
      if (!v14)
        goto LABEL_22;
    }
    goto LABEL_13;
  }
  if (v32[2])
  {
    v8 = v32[4];
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  v12 = v32;
  v13 = 0;
  v11 = 0;
  v14 = v32[2];
  if (!v14)
  {
LABEL_22:
    result = swift_bridgeObjectRelease();
    v20 = MEMORY[0x24BEE4AF8];
    goto LABEL_23;
  }
LABEL_13:
  v30 = a2;
  v33 = MEMORY[0x24BEE4AF8];
  v35 = v12;
  v31 = v13;
  swift_bridgeObjectRetain();
  sub_249F8CD6C(0, v14, 0);
  v17 = v31;
  v18 = v35;
  v19 = 0;
  v20 = v33;
  v21 = *(_QWORD *)(v33 + 16);
  v22 = 16 * v21;
  do
  {
    v23 = v21 + v19;
    v24 = v18[v19 + 4];
    if (v24 == v17)
      v25 = v11;
    else
      v25 = 0;
    v26 = *(_QWORD *)(v33 + 24);
    v27 = v23 + 1;
    if (v23 >= v26 >> 1)
    {
      sub_249F8CD6C(v26 > 1, v23 + 1, 1);
      v17 = v31;
      v18 = v35;
    }
    ++v19;
    *(_QWORD *)(v33 + 16) = v27;
    v28 = v33 + v22;
    *(_QWORD *)(v28 + 32) = v24;
    *(_BYTE *)(v28 + 40) = v25;
    v22 += 16;
  }
  while (v14 != v19);
  result = swift_bridgeObjectRelease_n();
  a2 = v30;
LABEL_23:
  *a2 = v20;
  return result;
}

uint64_t VUGallery.selectedModalities(for:client:)(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = v2;
  v7 = sub_24A01EBA4();
  v32 = *(_QWORD *)(v7 - 8);
  v33 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC08);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a2;
  v34 = v4;
  v31 = v13;
  v35 = v13;
  v36 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CA248);
  sub_24A01F138();
  v30 = v3;
  v14 = v38;
  v15 = *(_QWORD *)(v38 + 16);
  v16 = type metadata accessor for VUGallery.TagView(0);
  v17 = *(_QWORD *)(v16 - 8);
  if (v15)
  {
    sub_249FEEED8(v14 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)), (uint64_t)v12);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v12, v18, 1, v16);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v12, 1, v16) == 1)
  {
    sub_249F990A0((uint64_t)v12, (uint64_t *)&unk_2544CAC08);
  }
  else
  {
    v19 = *(_QWORD *)&v12[*(int *)(v16 + 28)];
    v20 = sub_249FEEF1C((uint64_t)v12);
    if (v19 != -1)
    {
      MEMORY[0x24BDAC7A8](v20);
      *(&v30 - 2) = v4;
      *(&v30 - 1) = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
      sub_24A01F138();
      return v38;
    }
  }
  v23 = v32;
  v22 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v9, a1, v33);
  v24 = sub_24A01ED90();
  v25 = sub_24A01F0E4();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v38 = swift_slowAlloc();
    *(_DWORD *)v26 = 136315394;
    v27 = sub_24A01EB74();
    v37 = sub_249F8AAE8(v27, v28, &v38);
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v22);
    *(_WORD *)(v26 + 12) = 2080;
    __asm { BR              X9 }
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v22);
  sub_249F74AF4();
  swift_allocError();
  *v29 = 3;
  return swift_willThrow();
}

uint64_t sub_249FE61D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  void *v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  char v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD28);
  sub_24A01F180();
  swift_release();

  if ((v7 & 1) != 0)
  {
    result = MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC38);
    result = swift_allocObject();
    *(_OWORD *)(result + 16) = xmmword_24A0208B0;
    *(_QWORD *)(result + 32) = v6;
  }
  *a2 = result;
  return result;
}

uint64_t VUGallery.setModalities(_:for:client:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_signpost_type_t v33;
  char v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint8_t *v39;
  os_signpost_id_t v40;
  os_signpost_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  uint64_t v47;
  const char *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void (*v54)(char *, uint64_t);
  char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  char *v59;
  int v60;
  void (*v61)(char *, uint64_t);
  char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  _BYTE *v66;
  void (*v68)(char *, uint64_t);
  os_signpost_type_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint8_t *v73;
  os_signpost_id_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  v5 = v3;
  v87 = a1;
  v8 = sub_24A01EBA4();
  v91 = *(const char **)(v8 - 8);
  v92 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_24A01ED54();
  v78 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v77 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24A01EDCC();
  v83 = *(_QWORD *)(v12 - 8);
  v84 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v86 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_24A01ED24();
  v82 = *(_QWORD *)(v90 - 8);
  v14 = MEMORY[0x24BDAC7A8](v90);
  v80 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v89 = (char *)&v75 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v75 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC08);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *a3;
  v24 = *(_QWORD *)(v5 + 24);
  v93 = v5;
  v88 = v23;
  v94 = v23;
  v95 = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CA248);
  v81 = v24;
  sub_24A01F138();
  v85 = v4;
  v25 = v97;
  v26 = *(_QWORD *)(v97 + 16);
  v27 = type metadata accessor for VUGallery.TagView(0);
  v28 = *(_QWORD *)(v27 - 8);
  if (v26)
  {
    sub_249FEEED8(v25 + ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80)), (uint64_t)v22);
    v29 = 0;
  }
  else
  {
    v29 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v22, v29, 1, v27);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v22, 1, v27) == 1)
  {
    sub_249F990A0((uint64_t)v22, (uint64_t *)&unk_2544CAC08);
LABEL_9:
    v48 = v91;
    v47 = v92;
    (*((void (**)(char *, uint64_t, uint64_t))v91 + 2))(v10, a2, v92);
    v49 = sub_24A01ED90();
    v50 = sub_24A01F0E4();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = swift_slowAlloc();
      v97 = swift_slowAlloc();
      *(_DWORD *)v51 = 136315394;
      v52 = sub_24A01EB74();
      v96 = sub_249F8AAE8(v52, v53, &v97);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      (*((void (**)(char *, uint64_t))v48 + 1))(v10, v47);
      *(_WORD *)(v51 + 12) = 2080;
      __asm { BR              X9 }
    }

    (*((void (**)(char *, uint64_t))v48 + 1))(v10, v47);
    sub_249F74AF4();
    swift_allocError();
    *v66 = 3;
    return swift_willThrow();
  }
  v30 = *(_QWORD *)&v22[*(int *)(v27 + 28)];
  sub_249FEEF1C((uint64_t)v22);
  if (v30 == -1)
    goto LABEL_9;
  v31 = v5 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_signposter;
  sub_24A01ED30();
  sub_24A01ED0C();
  v32 = sub_24A01ED30();
  v33 = sub_24A01F174();
  v34 = sub_24A01F1E0();
  v92 = v31;
  v76 = v30;
  if ((v34 & 1) != 0)
  {
    v35 = v82;
    v36 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
    v37 = v89;
    v38 = v90;
    v36(v89, v19, v90);
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    v40 = sub_24A01ED18();
    v41 = v33;
    v42 = v38;
    _os_signpost_emit_with_name_impl(&dword_249F70000, v32, v41, v40, "setModalities", "", v39, 2u);
    v43 = v39;
    v44 = v35;
    MEMORY[0x24BD07950](v43, -1, -1);

    v45 = v37;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v38);
    v46 = v36;
  }
  else
  {

    v44 = v82;
    v46 = *(void (**)(char *, char *, uint64_t))(v82 + 16);
    v45 = v89;
    v42 = v90;
  }
  v46(v45, v19, v42);
  sub_24A01ED78();
  swift_allocObject();
  sub_24A01ED6C();
  v54 = *(void (**)(char *, uint64_t))(v44 + 8);
  v54(v19, v42);
  v55 = v86;
  v56 = sub_24A01EDC0();
  MEMORY[0x24BDAC7A8](v56);
  *(&v75 - 4) = v87;
  *(&v75 - 3) = v5;
  *(&v75 - 2) = v76;
  v57 = v85;
  sub_24A01F12C();
  if (v57)
  {
    (*(void (**)(char *, uint64_t))(v83 + 8))(v55, v84);
    return swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v83 + 8))(v55, v84);
    v58 = sub_24A01ED30();
    v59 = v80;
    sub_24A01ED60();
    v60 = sub_24A01F168();
    if ((sub_24A01F1E0() & 1) != 0)
    {
      LODWORD(v92) = v60;
      v61 = v54;
      swift_retain();
      v62 = v77;
      sub_24A01ED84();
      swift_release();
      v63 = v78;
      v64 = v79;
      if ((*(unsigned int (**)(char *, uint64_t))(v78 + 88))(v62, v79) == *MEMORY[0x24BEE7810])
      {
        v65 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v63 + 8))(v62, v64);
        v65 = "";
      }
      v91 = v65;
      v68 = v61;
      v69 = v92;
      v70 = v89;
      v71 = v90;
      v46(v89, v59, v90);
      v72 = v59;
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      v74 = sub_24A01ED18();
      _os_signpost_emit_with_name_impl(&dword_249F70000, v58, v69, v74, "setModalities", v91, v73, 2u);
      MEMORY[0x24BD07950](v73, -1, -1);

      v68(v72, v71);
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v68)(v70, v71);
    }
    else
    {

      v54(v59, v90);
      return swift_release();
    }
  }
}

void sub_249FE6AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;

  if (*(_QWORD *)(a1 + 16))
  {
    v5 = *(_QWORD *)(a1 + 32);
    swift_retain();
    v6 = sub_249FCBEF8(v5, 0, a3, 0);
    v7 = swift_release();
    if (v6)
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a2 + 16) + 16) + 16);
      MEMORY[0x24BDAC7A8](v7);
      swift_retain();
      v9 = v8;
LABEL_6:
      sub_24A01F180();
      swift_release();

      return;
    }
    v14 = sub_24A01ED90();
    v15 = sub_24A01F0E4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      *(_DWORD *)v16 = 134218240;
      sub_24A01F1F8();
      *(_WORD *)(v16 + 12) = 2048;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v14, v15, "Observation %ld is not an observation of entity %ld", (uint8_t *)v16, 0x16u);
      MEMORY[0x24BD07950](v16, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v17 = 2;
    swift_willThrow();
  }
  else
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a2 + 16) + 16) + 16);
    MEMORY[0x24BDAC7A8](a1);
    swift_retain();
    v11 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
    sub_24A01F180();
    swift_release();

    if (*(_QWORD *)(v18 + 16))
    {
      v12 = swift_bridgeObjectRelease();
      v13 = *(void **)(*(_QWORD *)(*(_QWORD *)(a2 + 16) + 16) + 16);
      MEMORY[0x24BDAC7A8](v12);
      swift_retain();
      v9 = v13;
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t VUGallery.keyAssets(for:client:)(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = v2;
  v7 = sub_24A01EBA4();
  v33 = *(_QWORD *)(v7 - 8);
  v34 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC08);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a2;
  v35 = v4;
  v32 = v13;
  v36 = v13;
  v37 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CA248);
  sub_24A01F138();
  v31 = v3;
  v14 = v39;
  v15 = *(_QWORD *)(v39 + 16);
  v16 = type metadata accessor for VUGallery.TagView(0);
  v17 = *(_QWORD *)(v16 - 8);
  if (v15)
  {
    sub_249FEEED8(v14 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)), (uint64_t)v12);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v12, v18, 1, v16);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v12, 1, v16) == 1)
  {
    sub_249F990A0((uint64_t)v12, (uint64_t *)&unk_2544CAC08);
LABEL_9:
    v24 = v33;
    v23 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v9, a1, v34);
    v25 = sub_24A01ED90();
    v26 = sub_24A01F0E4();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v39 = swift_slowAlloc();
      *(_DWORD *)v27 = 136315394;
      v28 = sub_24A01EB74();
      v38 = sub_249F8AAE8(v28, v29, &v39);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v23);
      *(_WORD *)(v27 + 12) = 2080;
      __asm { BR              X9 }
    }

    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v23);
    sub_249F74AF4();
    swift_allocError();
    *v30 = 3;
    return swift_willThrow();
  }
  v19 = *(_QWORD *)&v12[*(int *)(v16 + 28)];
  v20 = sub_249FEEF1C((uint64_t)v12);
  if (v19 == -1)
    goto LABEL_9;
  MEMORY[0x24BDAC7A8](v20);
  *(&v31 - 2) = v4;
  *(&v31 - 1) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAB70);
  v21 = v31;
  result = sub_24A01F138();
  if (!v21)
    return v39;
  return result;
}

uint64_t sub_249FE7234@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t result;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v7 = v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
  sub_24A01F180();
  swift_release();

  v9 = v15;
  v16 = MEMORY[0x24BEE4AF8];
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_24A0208B0;
  *(_QWORD *)(v11 + 56) = v8;
  *(_QWORD *)(v11 + 64) = sub_249F98C68((unint64_t *)&qword_2544CA2D8, &qword_2544CA2D0, MEMORY[0x24BDCFBF8]);
  *(_QWORD *)(v11 + 32) = v9;
  swift_retain();
  v14 = (void *)sub_24A01F09C();
  v12 = *(id *)(v10 + 16);
  sub_24A01F180();
  swift_release();

  result = v16;
  if (v3)
    return swift_bridgeObjectRelease();
  *a2 = v16;
  return result;
}

uint64_t sub_249FE7424(void *a1, unint64_t *a2)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  void (*v19)(char *, char *, uint64_t);
  unint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24A01EBA4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v25 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v25 - v15;
  v17 = objc_msgSend(a1, sel_asset);
  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    return sub_249F990A0((uint64_t)v6, &qword_2544CAD70);
  }
  v18 = v17;
  sub_24A01EB98();

  v19 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v19(v6, v14, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    return sub_249F990A0((uint64_t)v6, &qword_2544CAD70);
  v19(v16, v6, v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v16, v7);
  v20 = *a2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a2 = v20;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v20 = sub_249F89B68(0, *(_QWORD *)(v20 + 16) + 1, 1, v20);
    *a2 = v20;
  }
  v23 = *(_QWORD *)(v20 + 16);
  v22 = *(_QWORD *)(v20 + 24);
  if (v23 >= v22 >> 1)
  {
    v20 = sub_249F89B68(v22 > 1, v23 + 1, 1, v20);
    *a2 = v20;
  }
  *(_QWORD *)(v20 + 16) = v23 + 1;
  v19((char *)(v20+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v23), v11, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v16, v7);
}

uint64_t sub_249FE7678(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
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
  NSObject *v16;
  os_signpost_type_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint8_t *v19;
  os_signpost_id_t v20;
  uint8_t *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t);
  uint64_t result;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  const char *v51;
  char *v52;
  char *v53;
  uint8_t *v54;
  os_signpost_id_t v55;
  char *v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;

  v72 = a2;
  v69 = a1;
  v4 = sub_24A01ED54();
  v63 = *(_QWORD *)(v4 - 8);
  v64 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v62 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A01ED24();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v68 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v59 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v59 - v13;
  v70 = v2;
  v15 = v2 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_signposter;
  sub_24A01ED30();
  sub_24A01ED0C();
  v67 = v15;
  v16 = sub_24A01ED30();
  v17 = sub_24A01F174();
  if ((sub_24A01F1E0() & 1) != 0)
  {
    v18 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v18(v12, v14, v6);
    v3 = v6;
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    v20 = sub_24A01ED18();
    _os_signpost_emit_with_name_impl(&dword_249F70000, v16, v17, v20, "faceprintsInputArray", "", v19, 2u);
    v21 = v19;
    v6 = v3;
    MEMORY[0x24BD07950](v21, -1, -1);

    v22 = v18;
    (*(void (**)(char *, unint64_t))(v7 + 8))(v12, v3);
  }
  else
  {

    v22 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  }
  v22(v12, v14, v6);
  sub_24A01ED78();
  swift_allocObject();
  v23 = sub_24A01ED6C();
  v24 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  result = v24(v14, v6);
  v26 = v72;
  if (!(v72 >> 62))
  {
    v27 = *(_QWORD *)((v72 & 0xFFFFFFFFFFFFF8) + 0x10);
    v28 = v27 - 2;
    if (!__OFSUB__(v27, 2))
      goto LABEL_6;
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  v58 = sub_24A01F3CC();
  result = swift_bridgeObjectRelease();
  v28 = v58 - 2;
  if (__OFSUB__(v58, 2))
    goto LABEL_24;
LABEL_6:
  v3 = v26 & 0xC000000000000001;
  v65 = (void (*)(char *, uint64_t))v24;
  v66 = v6;
  v60 = v22;
  v61 = v12;
  if ((v26 & 0xC000000000000001) != 0)
  {
LABEL_25:
    v29 = (id)MEMORY[0x24BD071F4](v28, v26);
    goto LABEL_10;
  }
  if ((v28 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  if (v28 >= *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_27:
    __break(1u);
    return result;
  }
  v29 = *(id *)(v26 + 8 * v28 + 32);
LABEL_10:
  v30 = v29;
  v31 = objc_msgSend(v29, sel_integerValue);

  MEMORY[0x24BDAC7A8](v32);
  v33 = v69;
  *(&v59 - 4) = v34;
  *(&v59 - 3) = v33;
  *(&v59 - 2) = (uint64_t)v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD38);
  v35 = v71;
  sub_24A01F138();
  if (v35)
  {
    swift_release();
  }
  else
  {
    v36 = v73;
    v37 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
    v38 = swift_bridgeObjectRetain();
    v31 = sub_249FA3438(v38, 65568);
    if (v3)
      v39 = (id)MEMORY[0x24BD071F4](v28, v72);
    else
      v39 = *(id *)(v72 + 8 * v28 + 32);
    v40 = v39;
    v41 = objc_msgSend(v39, sel_integerValue);

    MEMORY[0x24BDAC7A8](v42);
    *(&v59 - 2) = (uint64_t)v41;
    *(&v59 - 1) = v36;
    sub_24A01F0B4();
    swift_bridgeObjectRelease();
    v43 = sub_24A01ED30();
    sub_24A01ED60();
    v44 = sub_24A01F168();
    if ((sub_24A01F1E0() & 1) != 0)
    {
      swift_retain();
      v45 = v62;
      sub_24A01ED84();
      swift_release();
      v47 = v63;
      v46 = v64;
      v48 = (*(uint64_t (**)(char *, uint64_t))(v63 + 88))(v45, v64);
      v49 = *MEMORY[0x24BEE7810];
      v50 = v66;
      v59 = v23;
      LODWORD(v72) = v44;
      if (v48 == v49)
      {
        v51 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v46);
        v51 = "";
      }
      v52 = v61;
      v53 = v68;
      v60(v61, v68, v50);
      v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v54 = 0;
      v55 = sub_24A01ED18();
      _os_signpost_emit_with_name_impl(&dword_249F70000, v43, (os_signpost_type_t)v72, v55, "faceprintsInputArray", v51, v54, 2u);
      MEMORY[0x24BD07950](v54, -1, -1);

      v56 = v53;
      v57 = v65;
      v65(v56, v50);
      swift_release();
      v57(v52, v50);
    }
    else
    {

      v65(v68, v66);
      swift_release();
    }
  }
  return (uint64_t)v31;
}

uint64_t sub_249FE7BF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t inited;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t result;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v47;
  uint64_t v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  uint64_t v51;

  v5 = v4;
  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD28);
  sub_24A01F180();
  v47 = v5;
  swift_release();

  v10 = v48;
  v11 = v49;
  if ((v49 & 1) == 0)
  {
    v12 = v50;
    v13 = sub_24A01ED90();
    v14 = sub_24A01F0D8();
    if (os_log_type_enabled(v13, v14))
    {
      v44 = a2;
      v15 = swift_slowAlloc();
      v43 = swift_slowAlloc();
      v48 = v43;
      *(_DWORD *)v15 = 136315650;
      if (v12)
        v16 = 1919251317;
      else
        v16 = 0x6974616D6F747561;
      if (v12)
        v17 = 0xE400000000000000;
      else
        v17 = 0xED0000796C6C6163;
      v51 = sub_249F8AAE8(v16, v17, &v48);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2048;
      v51 = v10;
      sub_24A01F1F8();
      *(_WORD *)(v15 + 22) = 2048;
      v51 = v44;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v13, v14, "Using %s selected modality observation %ld for entity %ld", (uint8_t *)v15, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24BD07950](v43, -1, -1);
      v18 = v15;
      a2 = v44;
      MEMORY[0x24BD07950](v18, -1, -1);
    }

  }
  swift_retain();
  v19 = sub_249FCBEF8(v10, v11, 0, 1);
  v20 = swift_release();
  if (v19)
  {
    if (v11)
      goto LABEL_26;
  }
  else
  {
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
    MEMORY[0x24BDAC7A8](v20);
    swift_retain();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA1F8);
    sub_24A01F180();
    if (v47)
    {

      result = swift_unexpectedError();
      __break(1u);
      return result;
    }
    swift_release();

    if (!*(_QWORD *)(v48 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_26:
      v39 = sub_24A01ED90();
      v40 = sub_24A01F0E4();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v41 = 134217984;
        v48 = a2;
        sub_24A01F1F8();
        _os_log_impl(&dword_249F70000, v39, v40, "Cannot find personalization observations for entity %ld", v41, 0xCu);
        MEMORY[0x24BD07950](v41, -1, -1);
      }

      sub_249F74AF4();
      swift_allocError();
      *v42 = 5;
      return swift_willThrow();
    }
    v47 = 0;
    v10 = *(_QWORD *)(v48 + 32);
    swift_bridgeObjectRelease();
    v23 = sub_24A01ED90();
    v24 = sub_24A01F0E4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      *(_DWORD *)v25 = 134218240;
      v48 = v10;
      sub_24A01F1F8();
      *(_WORD *)(v25 + 12) = 2048;
      v48 = a2;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v23, v24, "Cannot find selected observation, using fallback observation %ld for entity %ld", (uint8_t *)v25, 0x16u);
      MEMORY[0x24BD07950](v25, -1, -1);
    }

  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC38);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A0208B0;
  *(_QWORD *)(inited + 32) = v10;
  MEMORY[0x24BDAC7A8](inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
  sub_24A01F138();
  v51 = inited;
  sub_249FB7B20(v48);
  v27 = v51;
  swift_bridgeObjectRetain();
  v28 = sub_24A01ED90();
  v29 = sub_24A01F0CC();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc();
    *(_DWORD *)v30 = 134218240;
    v48 = *(_QWORD *)(v27 + 16) - 1;
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2048;
    v48 = a2;
    sub_24A01F1F8();
    _os_log_impl(&dword_249F70000, v28, v29, "Using %ld similar observations for entity %ld", (uint8_t *)v30, 0x16u);
    MEMORY[0x24BD07950](v30, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v31 = sub_249F9FCA0(a3, v27);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v36 = sub_249FEF820(v32, v33, v34, v35, sub_249FF0DC4);
  if (v47)
    return swift_unknownObjectRelease();
  v38 = v36;
  result = swift_unknownObjectRelease();
  *a4 = v38;
  return result;
}

uint64_t sub_249FE82F8@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (__OFSUB__(a3, 1))
  {
    __break(1u);
  }
  else
  {
    if (a3 - 1 >= a4)
      v8 = a4;
    else
      v8 = a3 - 1;
    swift_retain();
    v9 = sub_249FF9AE8(a1, a2, v8, 0);
    result = swift_release();
    *a5 = v9;
  }
  return result;
}

uint64_t sub_249FE837C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  _BYTE *v40;
  _OWORD *v41;
  uint64_t v42;
  _OWORD *v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  os_log_t v57;
  uint64_t v58;
  uint64_t v60;
  int v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  _OWORD *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v5 = v4;
  v66 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v8);
  v63 = (uint64_t)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFBC0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v67 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v68 = (_OWORD *)((char *)&v60 - v14);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)&v60 - v16);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (uint64_t *)((char *)&v60 - v19);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (uint64_t *)((char *)&v60 - v22);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (uint64_t *)((char *)&v60 - v25);
  v27 = (char *)&v60 + *(int *)(v24 + 48) - v25;
  v69 = a3;
  v28 = *(_QWORD *)(*(_QWORD *)(a3 + 16) + 16);
  v29 = *(void **)(v28 + 16);
  v64 = a2;
  v70 = a2;
  v71 = v28;
  swift_retain();
  v30 = v29;
  sub_24A01F180();
  v65 = v5;

  v31 = *v23;
  v32 = v23[1];
  v33 = (uint64_t)v23 + *(int *)(v10 + 48);
  v34 = v26;
  v35 = v31;
  sub_249F98C10(v33, (uint64_t)v27, &qword_2544CAD70);
  swift_release();
  *v34 = v35;
  v34[1] = v32;
  v36 = (uint64_t)v20 + *(int *)(v10 + 48);
  *v20 = v35;
  v20[1] = v32;
  sub_249F99498((uint64_t)v27, v36);
  if (v32 >> 60 == 15)
  {
    sub_249F990A0(v36, &qword_2544CAD70);
    v37 = sub_24A01ED90();
    v38 = sub_24A01F0E4();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = swift_slowAlloc();
      *(_DWORD *)v39 = 134218240;
      v73 = v64;
      sub_24A01F1F8();
      *(_WORD *)(v39 + 12) = 2048;
      v73 = v66;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v37, v38, "Cannot get faceprint %ld for entity %ld", (uint8_t *)v39, 0x16u);
      MEMORY[0x24BD07950](v39, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v40 = 5;
    swift_willThrow();
    sub_249F990A0((uint64_t)v34, &qword_2578FFBC0);
  }
  else
  {
    v41 = v67;
    sub_249F93CE0(v35, v32);
    sub_249F93CE0(v35, v32);
    sub_249F990A0(v36, &qword_2544CAD70);
    v42 = (uint64_t)v17 + *(int *)(v10 + 48);
    *v17 = v35;
    v17[1] = v32;
    sub_249F99498((uint64_t)v27, v42);
    v43 = v68;
    sub_249F98C10((uint64_t)v17, (uint64_t)v68, &qword_2578FFBC0);
    v44 = sub_24A01ED90();
    v45 = sub_24A01F0D8();
    if (os_log_type_enabled(v44, (os_log_type_t)v45))
    {
      v61 = v45;
      v62 = v44;
      v69 = v32;
      v46 = swift_slowAlloc();
      v60 = swift_slowAlloc();
      v73 = v60;
      *(_DWORD *)v46 = 134218498;
      v72 = v64;
      sub_24A01F1F8();
      *(_WORD *)(v46 + 12) = 2080;
      v47 = *(int *)(v10 + 48);
      v48 = v41;
      v49 = (uint64_t)v41 + v47;
      v50 = (uint64_t)v43;
      *v48 = *v43;
      sub_249F99498((uint64_t)v43 + v47, v49);
      v51 = v63;
      sub_249F98C10(v49, v63, &qword_2544CAD70);
      v52 = sub_24A01EBA4();
      v53 = *(_QWORD *)(v52 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v51, 1, v52) == 1)
      {
        sub_249F990A0(v51, &qword_2544CAD70);
        v54 = 0xE300000000000000;
        v55 = 4935253;
      }
      else
      {
        v55 = sub_24A01EB74();
        v54 = v56;
        (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v51, v52);
      }
      v72 = sub_249F8AAE8(v55, v54, &v73);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      sub_249F990A0(v50, &qword_2578FFBC0);
      *(_WORD *)(v46 + 22) = 2048;
      v72 = v66;
      sub_24A01F1F8();
      v57 = v62;
      _os_log_impl(&dword_249F70000, v62, (os_log_type_t)v61, "Using observation %ld from asset %s for entity %ld", (uint8_t *)v46, 0x20u);
      v58 = v60;
      swift_arrayDestroy();
      MEMORY[0x24BD07950](v58, -1, -1);
      MEMORY[0x24BD07950](v46, -1, -1);

      sub_249F990A0((uint64_t)v34, &qword_2578FFBC0);
    }
    else
    {
      sub_249F990A0((uint64_t)v43, &qword_2578FFBC0);

      sub_249F990A0((uint64_t)v34, &qword_2578FFBC0);
    }
  }
  return v35;
}

void sub_249FE8964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (a4)
  {
    if (*(_QWORD *)(a5 + 16))
      __asm { BR              X9 }
LABEL_7:
    __break(1u);
    JUMPOUT(0x249FE8C30);
  }
}

void *static VUGallery.TokenEmbeddingType.cachedTypes.getter()
{
  return &unk_251B68240;
}

uint64_t VUGallery.TokenEmbeddingType.init(rawValue:)@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = result;
  if ((unsigned __int16)result >= 6u)
    v2 = 6;
  *a2 = v2;
  return result;
}

uint64_t VUGallery.TokenEmbeddingType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_249FE8C84@<X0>(unsigned __int16 *a1@<X0>, char *a2@<X8>)
{
  return VUGallery.TokenEmbeddingType.init(rawValue:)(*a1, a2);
}

uint64_t VUGallery.tokenEmbeddings(for:client:type:)(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  os_signpost_type_t v35;
  char v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint8_t *v40;
  os_signpost_id_t v41;
  os_signpost_type_t v42;
  char *v43;
  void (*v44)(char *, char *, uint64_t);
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  char *v70;
  int v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  int v76;
  const char *v77;
  _BYTE *v78;
  uint64_t result;
  uint64_t v80;
  id v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  uint8_t *v89;
  os_signpost_id_t v90;
  _QWORD v91[2];
  unint64_t v92;
  void (*v93)(char *, char *, uint64_t);
  char *v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  int v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v5 = v3;
  v9 = sub_24A01ED54();
  v95 = *(_QWORD *)(v9 - 8);
  v96 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v94 = (char *)v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24A01EBA4();
  v106 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v91 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v98 = (char *)v91 - v15;
  v103 = sub_24A01ED24();
  v99 = *(_QWORD *)(v103 - 8);
  v16 = MEMORY[0x24BDAC7A8](v103);
  v97 = (char *)v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v101 = (char *)v91 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v91 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC08);
  MEMORY[0x24BDAC7A8](v22);
  v24 = ((char *)v91 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = *a2;
  v102 = *a3;
  v107 = v5;
  v108 = v5;
  v104 = v25;
  v105 = a1;
  v109 = v25;
  v110 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CA248);
  sub_24A01F138();
  v100 = v4;
  v26 = v112;
  v27 = *(_QWORD *)(v112 + 16);
  v28 = type metadata accessor for VUGallery.TagView(0);
  v29 = *(_QWORD *)(v28 - 8);
  if (v27)
  {
    sub_249FEEED8(v26 + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80)), (uint64_t)v24);
    v30 = 0;
  }
  else
  {
    v30 = 1;
  }
  (*(void (**)(NSObject *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v24, v30, 1, v28);
  swift_bridgeObjectRelease();
  v31 = v11;
  if ((*(unsigned int (**)(NSObject *, uint64_t, uint64_t))(v29 + 48))(v24, 1, v28) == 1)
  {
    sub_249F990A0((uint64_t)v24, (uint64_t *)&unk_2544CAC08);
    v32 = v106;
LABEL_9:
    (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v14, v105, v11);
    v45 = sub_24A01ED90();
    v46 = sub_24A01F0E4();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = swift_slowAlloc();
      v112 = swift_slowAlloc();
      *(_DWORD *)v47 = 136315394;
      v48 = sub_24A01EB74();
      v111 = sub_249F8AAE8(v48, v49, &v112);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v11);
      *(_WORD *)(v47 + 12) = 2080;
      __asm { BR              X9 }
    }

    (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v11);
    sub_249F74AF4();
    swift_allocError();
    *v78 = 3;
    swift_willThrow();
    return (uint64_t)v24;
  }
  v33 = *(unint64_t *)((char *)&v24->isa + *(int *)(v28 + 28));
  sub_249FEEF1C((uint64_t)v24);
  v32 = v106;
  if (v33 == -1)
    goto LABEL_9;
  v92 = v33;
  v34 = v107 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_signposter;
  sub_24A01ED30();
  sub_24A01ED0C();
  v24 = sub_24A01ED30();
  v35 = sub_24A01F174();
  v36 = sub_24A01F1E0();
  v91[1] = v34;
  if ((v36 & 1) != 0)
  {
    v37 = v99;
    v93 = *(void (**)(char *, char *, uint64_t))(v99 + 16);
    v38 = v101;
    v39 = v103;
    v93(v101, v21, v103);
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    v41 = sub_24A01ED18();
    v42 = v35;
    v43 = v38;
    _os_signpost_emit_with_name_impl(&dword_249F70000, v24, v42, v41, "tokenEmbeddings", "", v40, 2u);
    MEMORY[0x24BD07950](v40, -1, -1);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v39);
    v44 = v93;
  }
  else
  {

    v37 = v99;
    v44 = *(void (**)(char *, char *, uint64_t))(v99 + 16);
    v39 = v103;
    v43 = v101;
  }
  v93 = v44;
  v44(v43, v21, v39);
  sub_24A01ED78();
  swift_allocObject();
  v50 = sub_24A01ED6C();
  v51 = *(void (**)(char *, uint64_t))(v37 + 8);
  v51(v21, v39);
  v52 = v102;
  if (v102 != 4 && v102 != 3)
    goto LABEL_18;
  LOBYTE(v112) = v102;
  swift_retain();
  v53 = _s19VisualUnderstanding9VUGalleryC21tokenEmbeddingVersion3forSSSgAC05TokenE4TypeO_tF_0(&v112);
  v24 = v54;
  v55 = sub_249FD59B0(v105, v104, v52, v53, v54);
  v104 = v56;
  v58 = v57;
  swift_release();
  swift_bridgeObjectRelease();
  if (!v58)
  {
LABEL_18:
    LOBYTE(v112) = v52;
    v67 = v100;
    VUGallery.tokenEmbeddingInference(for:type:)(v92, (char *)&v112);
    if (v67)
    {
      swift_release();
    }
    else
    {
      v24 = v68;
      v69 = sub_24A01ED30();
      v70 = v97;
      sub_24A01ED60();
      v71 = sub_24A01F168();
      if ((sub_24A01F1E0() & 1) != 0)
      {
        LODWORD(v107) = v71;
        swift_retain();
        v72 = v94;
        sub_24A01ED84();
        swift_release();
        v74 = v95;
        v73 = v96;
        v75 = (*(uint64_t (**)(char *, uint64_t))(v95 + 88))(v72, v96);
        v76 = *MEMORY[0x24BEE7810];
        v99 = v50;
        if (v75 == v76)
        {
          v77 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v74 + 8))(v72, v73);
          v77 = "";
        }
        v86 = v101;
        v87 = v103;
        v93(v101, v70, v103);
        v88 = v70;
        v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v89 = 0;
        v90 = sub_24A01ED18();
        _os_signpost_emit_with_name_impl(&dword_249F70000, v69, (os_signpost_type_t)v107, v90, "tokenEmbeddings", v77, v89, 2u);
        MEMORY[0x24BD07950](v89, -1, -1);

        v51(v88, v87);
        swift_release();
        v51(v86, v87);
      }
      else
      {

        v51(v70, v103);
        swift_release();
      }
    }
    return (uint64_t)v24;
  }
  v103 = v55;
  v59 = v98;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v98, v105, v31);
  v60 = sub_24A01ED90();
  v61 = sub_24A01F0CC();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = v59;
    v63 = swift_slowAlloc();
    v107 = swift_slowAlloc();
    v112 = v107;
    *(_DWORD *)v63 = 136315394;
    v99 = v50;
    sub_249FEFBD4();
    v64 = sub_24A01F444();
    v111 = sub_249F8AAE8(v64, v65, &v112);
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v62, v31);
    *(_WORD *)(v63 + 12) = 512;
    LOWORD(v111) = v102;
    sub_24A01F1F8();
    _os_log_impl(&dword_249F70000, v60, v61, "Using cached token embedding for tag %s with token embedding of type %hd", (uint8_t *)v63, 0x10u);
    v66 = v107;
    swift_arrayDestroy();
    MEMORY[0x24BD07950](v66, -1, -1);
    MEMORY[0x24BD07950](v63, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v32 + 8))(v59, v31);
  }
  v80 = v100;
  v81 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
  v82 = swift_bridgeObjectRetain();
  v83 = sub_249FA3438(v82, 65568);
  if (!v80)
  {
    v24 = v83;
    MEMORY[0x24BDAC7A8](v83);
    v84 = v103;
    v85 = v104;
    v91[-4] = v103;
    v91[-3] = v85;
    v91[-2] = v58;
    v91[-1] = 4;
    sub_24A01F0B4();
    sub_249FCA428(v84, v85, v58);
    swift_release();
    return (uint64_t)v24;
  }
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

void VUGallery.tokenEmbeddingInference(for:type:)(unint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  char v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27[4];
  uint64_t v28;

  v3 = v2;
  v5 = *a2;
  v6 = sub_24A01ED90();
  v7 = sub_24A01F0CC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v27[0] = v9;
    *(_DWORD *)v8 = 134218242;
    v28 = a1;
    sub_24A01F1F8();
    *(_WORD *)(v8 + 12) = 2080;
    LOBYTE(v28) = v5;
    v10 = sub_24A01EE74();
    v28 = sub_249F8AAE8(v10, v11, v27);
    v3 = v2;
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_249F70000, v6, v7, "Computing personalized token embedding for entity %ld using %s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BD07950](v9, -1, -1);
    MEMORY[0x24BD07950](v8, -1, -1);
  }

  v27[3] = (uint64_t)&type metadata for VUGallery.TokenEmbeddingType;
  LOBYTE(v27[0]) = v5;
  v12 = HIBYTE(a1);
  if (HIBYTE(a1) == 63)
    v13 = 2;
  else
    v13 = 0;
  if ((_DWORD)v12 == 6)
    v14 = 3;
  else
    v14 = v13;
  if ((_DWORD)v12 == 2)
    v15 = 1;
  else
    v15 = v14;
  LOBYTE(v28) = v15;
  v16 = (void *)sub_249FE4B50((uint64_t)v27, (unsigned __int8 *)&v28);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v27);
  if (!v3)
  {
    v17 = objc_msgSend(v16, sel_modelDescription);
    v18 = objc_msgSend(v17, sel_inputDescriptionsByName);

    sub_249F990DC(0, &qword_2578FFCA8);
    v19 = sub_24A01EDFC();

    if (*(_QWORD *)(v19 + 16) && (v20 = sub_249F8B0F8(0xD000000000000011, 0x800000024A021CF0), (v21 & 1) != 0))
    {
      v22 = *(id *)(*(_QWORD *)(v19 + 56) + 8 * v20);
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v22, sel_multiArrayConstraint);

      if (v23)
      {
        v24 = objc_msgSend(v23, sel_shape);

        sub_249F990DC(0, (unint64_t *)&qword_2544CAD40);
        v25 = sub_24A01EF88();

        v26 = (void (*)(char *, uint64_t))sub_249FE7678(a1, v25);
        swift_bridgeObjectRelease();
        sub_249FEA53C(v26, v16);

        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      __break(1u);
    }
    __break(1u);
  }
}

void VUGallery.tokenEmbeddings(for:type:)(uint64_t a1, char *a2)
{
  uint64_t v2;
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
  char *v14;
  char v15;
  id v16;
  unint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  os_signpost_type_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  uint8_t *v32;
  os_signpost_id_t v33;
  os_signpost_type_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  void *v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  uint64_t inited;
  uint64_t v53;
  id v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  unint64_t v58;
  void (*v59)(char *, uint64_t);
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  NSObject *v64;
  char *v65;
  int v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  char *v71;
  uint64_t v72;
  uint8_t *v73;
  os_signpost_id_t v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  void (*v79)(char *, char *, uint64_t);
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  char *v91;
  _BYTE v92[24];
  ValueMetadata *v93;
  unsigned __int8 v94;

  v4 = sub_24A01ED54();
  v87 = *(_QWORD *)(v4 - 8);
  v88 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v86 = (char *)&v77 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A01ED24();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v91 = (char *)&v77 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v77 - v13;
  v15 = *a2;
  v16 = sub_249FEA394();
  if (v17 >> 60 == 15)
  {
LABEL_2:
    v18 = sub_24A01ED90();
    v19 = sub_24A01F0E4();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_249F70000, v18, v19, "Cannot extract embedding data from observation!", v20, 2u);
      MEMORY[0x24BD07950](v20, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v21 = 8;
    swift_willThrow();
    return;
  }
  v22 = (uint64_t)v16;
  v23 = v17;
  v89 = v2;
  objc_opt_self();
  v24 = swift_dynamicCastObjCClass();
  v84 = v22;
  v85 = v23;
  if (v24)
  {
    v81 = v10;
    v25 = v6;
    v26 = 1;
  }
  else
  {
    objc_opt_self();
    if (!swift_dynamicCastObjCClass())
    {
      sub_249F92438(v22, v23);
      goto LABEL_2;
    }
    v81 = v10;
    v25 = v6;
    v26 = 2;
  }
  LODWORD(v83) = v26;
  v27 = v89 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_signposter;
  sub_24A01ED30();
  sub_24A01ED0C();
  v82 = v27;
  v28 = sub_24A01ED30();
  v29 = sub_24A01F174();
  if ((sub_24A01F1E0() & 1) != 0)
  {
    v30 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v31 = v91;
    v30(v91, v14, v25);
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    v33 = sub_24A01ED18();
    v34 = v29;
    v35 = v31;
    _os_signpost_emit_with_name_impl(&dword_249F70000, v28, v34, v33, "tokenEmbeddings", "", v32, 2u);
    MEMORY[0x24BD07950](v32, -1, -1);

    v36 = v25;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v31, v25);
  }
  else
  {

    v30 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v36 = v25;
    v35 = v91;
  }
  v30(v35, v14, v36);
  sub_24A01ED78();
  swift_allocObject();
  v37 = sub_24A01ED6C();
  v38 = *(void (**)(char *, uint64_t))(v7 + 8);
  v38(v14, v36);
  v93 = &type metadata for VUGallery.TokenEmbeddingType;
  v92[0] = v15;
  v94 = v83;
  v39 = v90;
  v40 = sub_249FE4B50((uint64_t)v92, &v94);
  v41 = v85;
  if (v39)
  {
    sub_249F92438(v84, v85);
    swift_release();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v92);
    return;
  }
  v42 = (void *)v40;
  v79 = v30;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v92);
  v43 = objc_msgSend(v42, sel_modelDescription);
  v44 = objc_msgSend(v43, sel_inputDescriptionsByName);

  sub_249F990DC(0, &qword_2578FFCA8);
  v45 = sub_24A01EDFC();

  if (!*(_QWORD *)(v45 + 16) || (v46 = sub_249F8B0F8(0xD000000000000011, 0x800000024A021CF0), (v47 & 1) == 0))
  {
LABEL_37:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_38;
  }
  v90 = v42;
  v83 = v37;
  v80 = v36;
  v48 = *(id *)(*(_QWORD *)(v45 + 56) + 8 * v46);
  swift_bridgeObjectRelease();
  v49 = objc_msgSend(v48, sel_multiArrayConstraint);

  if (!v49)
  {
LABEL_38:
    __break(1u);
    return;
  }
  v50 = objc_msgSend(v49, sel_shape);

  sub_249F990DC(0, (unint64_t *)&qword_2544CAD40);
  v51 = sub_24A01EF88();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578FF748);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A0208B0;
  v53 = v84;
  *(_QWORD *)(inited + 32) = v84;
  *(_QWORD *)(inited + 40) = v41;
  v54 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
  sub_249F93CCC(v53, v41);
  v55 = swift_bridgeObjectRetain();
  v56 = (void (*)(char *, uint64_t))sub_249FA3438(v55, 65568);
  if (!(v51 >> 62))
  {
    v57 = *(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10);
    v58 = v57 - 2;
    if (!__OFSUB__(v57, 2))
      goto LABEL_21;
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  swift_bridgeObjectRetain();
  v76 = sub_24A01F3CC();
  swift_bridgeObjectRelease();
  v58 = v76 - 2;
  if (__OFSUB__(v76, 2))
    goto LABEL_33;
LABEL_21:
  v78 = v38;
  if ((v51 & 0xC000000000000001) == 0)
  {
    if ((v58 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v58 < *(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v59 = v56;
      v60 = *(id *)(v51 + 8 * v58 + 32);
      goto LABEL_25;
    }
    __break(1u);
    goto LABEL_37;
  }
LABEL_34:
  v59 = v56;
  v60 = (id)MEMORY[0x24BD071F4](v58, v51);
LABEL_25:
  v61 = v60;
  v62 = objc_msgSend(v60, sel_integerValue);

  MEMORY[0x24BDAC7A8](v63);
  *(&v77 - 2) = (uint64_t)v62;
  *(&v77 - 1) = inited;
  sub_24A01F0B4();
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  sub_249FEA53C(v59, v90);
  v64 = sub_24A01ED30();
  v65 = v81;
  sub_24A01ED60();
  v66 = sub_24A01F168();
  if ((sub_24A01F1E0() & 1) != 0)
  {
    LODWORD(v89) = v66;
    swift_retain();
    v67 = v86;
    sub_24A01ED84();
    swift_release();
    v69 = v87;
    v68 = v88;
    if ((*(unsigned int (**)(char *, uint64_t))(v87 + 88))(v67, v88) == *MEMORY[0x24BEE7810])
    {
      v70 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v69 + 8))(v67, v68);
      v70 = "";
    }
    v71 = v91;
    v72 = v80;
    v79(v91, v65, v80);
    v73 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v73 = 0;
    v74 = sub_24A01ED18();
    _os_signpost_emit_with_name_impl(&dword_249F70000, v64, (os_signpost_type_t)v89, v74, "tokenEmbeddings", v70, v73, 2u);
    MEMORY[0x24BD07950](v73, -1, -1);

    sub_249F92438(v84, v85);
    v75 = v78;
    v78(v65, v72);
    swift_release();
    v75(v71, v72);
  }
  else
  {
    sub_249F92438(v84, v85);

    v78(v65, v80);
    swift_release();
  }
}

id sub_249FEA394()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v1 = v0;
  objc_opt_self();
  v2 = swift_dynamicCastObjCClass();
  if (!v2)
  {
    objc_opt_self();
    v8 = (id)swift_dynamicCastObjCClass();
    if (!v8)
      return v8;
    v4 = v1;
    v9 = objc_msgSend(v8, sel_animalprint);
    v8 = v9;
    if (v9)
    {
      v10 = objc_msgSend(v9, sel_descriptorData);
      goto LABEL_11;
    }
LABEL_14:

    return v8;
  }
  v3 = (void *)v2;
  v4 = v1;
  v5 = objc_msgSend(v3, sel_faceprint);
  if (!v5
    || (v6 = v5, v7 = objc_msgSend(v5, sel_descriptorData), v6, !v7))
  {
    v11 = objc_msgSend(v3, sel_faceTorsoprint);
    if (!v11)
      goto LABEL_13;
    v12 = v11;
    v8 = objc_msgSend(v11, sel_faceprint);

    if (v8)
    {
      v10 = objc_msgSend(v8, sel_descriptorData);
LABEL_11:
      v13 = v10;

      if (v13)
      {
        v8 = (id)sub_24A01EAFC();

        return v8;
      }
LABEL_13:

      return 0;
    }
    goto LABEL_14;
  }
  v8 = (id)sub_24A01EAFC();

  return v8;
}

id sub_249FEA53C(void (*a1)(char *, uint64_t), void *a2)
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
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_type_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint8_t *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t inited;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  char *v34;
  os_signpost_type_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  const char *v41;
  id v42;
  char *v43;
  uint8_t *v44;
  os_signpost_id_t v45;
  void (*v46)(char *, uint64_t);
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  _BYTE *v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  id v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  id v62[13];

  v60 = a1;
  v59 = a2;
  v62[11] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = sub_24A01ED54();
  v55 = *(_QWORD *)(v3 - 8);
  v56 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v54 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24A01ED24();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v58 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v51 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v51 - v12;
  v53 = v2;
  v14 = v2 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_signposter;
  sub_24A01ED30();
  sub_24A01ED0C();
  v57 = v14;
  v15 = sub_24A01ED30();
  v16 = sub_24A01F174();
  if ((sub_24A01F1E0() & 1) != 0)
  {
    v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v17(v11, v13, v5);
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    v19 = sub_24A01ED18();
    _os_signpost_emit_with_name_impl(&dword_249F70000, v15, v16, v19, "tokenEmbeddingInference", "", v18, 2u);
    MEMORY[0x24BD07950](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  else
  {

    v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  }
  v17(v11, v13, v5);
  sub_24A01ED78();
  swift_allocObject();
  v20 = sub_24A01ED6C();
  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v13, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24A0208B0;
  *(_QWORD *)(inited + 32) = 0xD000000000000011;
  *(_QWORD *)(inited + 40) = 0x800000024A021CF0;
  v23 = objc_msgSend((id)objc_opt_self(), sel_featureValueWithMultiArray_, v60);
  *(_QWORD *)(inited + 72) = sub_249F990DC(0, &qword_2578FFD20);
  *(_QWORD *)(inited + 48) = v23;
  sub_249F76514(inited);
  v24 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
  v25 = v61;
  v26 = sub_249FEE800();
  if (v25)
  {
    swift_release();
  }
  else
  {
    v23 = v26;
    v60 = v21;
    v52 = v17;
    v61 = v20;
    v62[0] = 0;
    v28 = objc_msgSend(v59, sel_predictionFromFeatures_error_, v26, v62);
    if (v28)
    {
      v29 = v28;
      v51 = 0;
      v59 = v23;
      v30 = v62[0];
      v31 = (void *)sub_24A01EE44();
      v32 = objc_msgSend(v29, sel_featureValueForName_, v31);

      swift_unknownObjectRelease();
      v23 = objc_msgSend(v32, sel_multiArrayValue);

      v33 = sub_24A01ED30();
      v34 = v58;
      sub_24A01ED60();
      v35 = sub_24A01F168();
      if ((sub_24A01F1E0() & 1) != 0)
      {
        swift_retain();
        v36 = v54;
        sub_24A01ED84();
        v37 = v36;
        swift_release();
        v38 = v55;
        v39 = v36;
        v40 = v56;
        if ((*(unsigned int (**)(char *, uint64_t))(v55 + 88))(v39, v56) == *MEMORY[0x24BEE7810])
        {
          v41 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v40);
          v41 = "";
        }
        v52(v11, v34, v5);
        v43 = v34;
        v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v44 = 0;
        v45 = sub_24A01ED18();
        _os_signpost_emit_with_name_impl(&dword_249F70000, v33, v35, v45, "tokenEmbeddingInference", v41, v44, 2u);
        MEMORY[0x24BD07950](v44, -1, -1);

        v46 = v60;
        v60(v43, v5);
        v46(v11, v5);
      }
      else
      {

        v60(v34, v5);
      }
      if (v23)
      {
        swift_release();

      }
      else
      {
        v47 = sub_24A01ED90();
        v48 = sub_24A01F0E4();
        if (os_log_type_enabled(v47, v48))
        {
          v49 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v49 = 0;
          _os_log_impl(&dword_249F70000, v47, v48, "Cannot get the personalized embedding from the model", v49, 2u);
          MEMORY[0x24BD07950](v49, -1, -1);
        }

        sub_249F74AF4();
        swift_allocError();
        *v50 = 5;
        swift_willThrow();
        swift_release();

      }
    }
    else
    {
      v42 = v62[0];
      sub_24A01EA00();

      swift_willThrow();
      swift_release();

    }
  }
  return v23;
}

Swift::Bool __swiftcall VUGallery.personalizationReady(for:)(Swift::Int a1)
{
  Swift::Bool v2;

  sub_24A01F138();
  return v2;
}

void sub_249FEABC0(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  void *v3;
  id v4;
  char v5;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v4 = v3;
  sub_24A01F180();
  swift_release();

  *a2 = v5;
}

Swift::Void __swiftcall VUGallery.saveSnapshotDate(for:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v2 = v1;
  v4 = *(NSObject **)(v2 + 24);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = a1;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_249FEFC70;
  *(_QWORD *)(v6 + 24) = v5;
  v8[4] = sub_249FC76E4;
  v8[5] = v6;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_249F87210;
  v8[3] = &block_descriptor_4;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v2 & 1) != 0)
    __break(1u);
}

uint64_t sub_249FEAD78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t result;
  _QWORD v10[6];

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  v4 = *(void **)(v3 + 16);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = v3;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_249FF0D58;
  *(_QWORD *)(v6 + 24) = v5;
  v10[4] = sub_249FCA5C8;
  v10[5] = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_249F87210;
  v10[3] = &block_descriptor_28;
  v7 = _Block_copy(v10);
  swift_retain_n();
  v8 = v4;
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_performBlockAndWait_, v7);

  _Block_release(v7);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  result = swift_release();
  if ((v7 & 1) != 0)
    __break(1u);
  return result;
}

unint64_t VUGallery.tokenEmbeddingsData(for:type:)(unint64_t a1, _BYTE *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t result;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[2];

  LOBYTE(v10[0]) = *a2;
  VUGallery.tokenEmbeddingInference(for:type:)(a1, (char *)v10);
  if (v3)
    return v2;
  v5 = v4;
  result = (unint64_t)objc_msgSend(v4, sel_count);
  if ((result - 0x2000000000000000) >> 62 == 3)
  {
    v10[0] = sub_249FEFCA0(4 * result);
    v10[1] = v7;
    v8 = v5;
    sub_249FEEFBC((uint64_t)v10);
    v2 = v10[0];
    v9 = objc_msgSend(v8, sel_shape);
    sub_249F990DC(0, (unint64_t *)&qword_2544CAD40);
    sub_24A01EF88();

    return v2;
  }
  __break(1u);
  return result;
}

uint64_t VUGallery.cachedTokenEmbeddingsCount(for:)()
{
  uint64_t v1;

  sub_24A01F138();
  return v1;
}

uint64_t sub_249FEB028@<X0>(unsigned __int8 a1@<W1>, uint64_t *a2@<X8>)
{
  int v3;
  unsigned __int8 v4;
  int v5;
  uint64_t v6;
  uint64_t result;

  v3 = a1 == 6;
  if (a1 == 6)
    v4 = 0;
  else
    v4 = a1;
  v5 = v4;
  swift_retain();
  v6 = sub_249FD6488(v5 | (v3 << 16));
  result = swift_release();
  *a2 = v6;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> VUGallery.save(keyObservations:selected:for:)(Swift::OpaquePointer keyObservations, Swift::Int selected, Swift::Int a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE v11[16];
  uint64_t v12;
  void *rawValue;
  Swift::Int v14;
  Swift::Int v15;

  v7 = sub_24A01EDCC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v11[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_24A01EDC0();
  v12 = v3;
  rawValue = keyObservations._rawValue;
  v14 = a3;
  v15 = selected;
  sub_24A01F12C();
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_249FEB174(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  char v12;

  v2 = v1;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v5 = v4;
  sub_24A01F180();
  swift_release();

  if (!v2)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
    MEMORY[0x24BDAC7A8](v6);
    swift_retain();
    v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD28);
    sub_24A01F180();
    swift_release();

    if ((v12 & 1) == 0)
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
      MEMORY[0x24BDAC7A8](v9);
      swift_retain();
      v11 = v10;
      sub_24A01F180();
      swift_release();

    }
  }
}

uint64_t VUGallery.save(tokenEmbedding:for:client:type:shape:)(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;

  v17 = a3;
  v18 = a6;
  v11 = sub_24A01EDCC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a4) = *a4;
  v15 = *a5;
  sub_24A01EDC0();
  v19 = v6;
  v20 = a1;
  v21 = a2;
  v22 = v17;
  v23 = (char)a4;
  v24 = v15;
  v25 = v18;
  sub_24A01F12C();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_249FEB420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, unsigned __int8 a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v16;

  v16 = a6;
  swift_retain();
  v13 = _s19VisualUnderstanding9VUGalleryC21tokenEmbeddingVersion3forSSSgAC05TokenE4TypeO_tF_0(&v16);
  sub_249FD6B24(a2, a3, a4, a5, a6, v13, v14, a7);
  swift_release();
  return swift_bridgeObjectRelease();
}

BOOL static VUGallery.TokenEmbeddingPersonalizationType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t VUGallery.TokenEmbeddingPersonalizationType.hash(into:)()
{
  return sub_24A01F4F8();
}

uint64_t VUGallery.TokenEmbeddingPersonalizationType.hashValue.getter()
{
  sub_24A01F4EC();
  sub_24A01F4F8();
  return sub_24A01F528();
}

void VUGallery.personalize(embeddingLayer:at:for:client:type:randomizeWithSeed:)(id *a1, NSObject *a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, void *a6, int a7)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_signpost_type_t v38;
  char v39;
  void *v40;
  void (*v41)(char *, uint64_t);
  id *v42;
  uint64_t v43;
  char *v44;
  uint8_t *v45;
  os_signpost_id_t v46;
  os_signpost_type_t v47;
  void (*v48)(char *, uint64_t);
  uint8_t *v49;
  id *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  void *v69;
  id v70;
  id v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  id v75;
  id v76;
  char *v77;
  uint64_t v78;
  id v79;
  unint64_t v80;
  _BYTE *v81;
  void *v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  os_log_type_t v87;
  int v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  os_log_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  void (*v100)(char *, uint64_t);
  NSObject *v101;
  os_signpost_type_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  const char *v106;
  uint64_t v107;
  char *v108;
  uint8_t *v109;
  os_signpost_id_t v110;
  void (*v111)(char *, uint64_t);
  _QWORD v112[3];
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  int v118;
  id *v119;
  id v120;
  os_log_t v121;
  char *v122;
  void (*v123)(char *, uint64_t);
  int v124;
  char *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char v133;
  uint64_t v134;
  uint64_t v135[5];
  os_log_t v136;

  v9 = v7;
  v118 = a7;
  v120 = a6;
  v121 = a2;
  v119 = a1;
  v115 = sub_24A01ED54();
  v114 = *(_QWORD *)(v115 - 8);
  MEMORY[0x24BDAC7A8](v115);
  v116 = (char *)v112 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_24A01EBA4();
  v129 = *(_QWORD *)(v14 - 8);
  v130 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v112 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v122 = (char *)v112 - v18;
  v126 = sub_24A01ED24();
  v123 = *(void (**)(char *, uint64_t))(v126 - 8);
  v19 = MEMORY[0x24BDAC7A8](v126);
  v117 = (char *)v112 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v125 = (char *)v112 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v112 - v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC08);
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)v112 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = *a4;
  v124 = *a5;
  v131 = v9;
  v132 = v9;
  v133 = v28;
  v128 = a3;
  v134 = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CA248);
  sub_24A01F138();
  v127 = v8;
  v29 = v135[0];
  v30 = *(_QWORD *)(v135[0] + 16);
  v31 = type metadata accessor for VUGallery.TagView(0);
  v32 = *(_QWORD *)(v31 - 8);
  if (v30)
  {
    sub_249FEEED8(v29 + ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80)), (uint64_t)v27);
    v33 = 0;
  }
  else
  {
    v33 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v32 + 56))(v27, v33, 1, v31);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v27, 1, v31) == 1)
  {
    sub_249F990A0((uint64_t)v27, (uint64_t *)&unk_2544CAC08);
LABEL_10:
    v52 = v129;
    v53 = v130;
    (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))(v17, v128, v130);
    v54 = sub_24A01ED90();
    v55 = sub_24A01F0E4();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = swift_slowAlloc();
      v131 = swift_slowAlloc();
      v135[0] = v131;
      *(_DWORD *)v56 = 136315394;
      v57 = sub_24A01EB74();
      v136 = (os_log_t)sub_249F8AAE8(v57, v58, v135);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v17, v53);
      *(_WORD *)(v56 + 12) = 2080;
      __asm { BR              X9 }
    }

    (*(void (**)(char *, uint64_t))(v52 + 8))(v17, v53);
    sub_249F74AF4();
    swift_allocError();
    *v81 = 3;
    swift_willThrow();
    return;
  }
  v34 = *(_QWORD *)&v27[*(int *)(v31 + 28)];
  sub_249FEEF1C((uint64_t)v27);
  if (v34 == -1)
    goto LABEL_10;
  v35 = HIBYTE(v34);
  if (HIBYTE(v34) == 2)
  {
    v36 = v131 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_signposter;
    sub_24A01ED30();
    sub_24A01ED0C();
    v112[2] = v36;
    v37 = sub_24A01ED30();
    v38 = sub_24A01F174();
    v39 = sub_24A01F1E0();
    v40 = v127;
    v113 = v34;
    if ((v39 & 1) != 0)
    {
      v41 = v123;
      v42 = (id *)*((_QWORD *)v123 + 2);
      v44 = v125;
      v43 = v126;
      ((void (*)(char *, char *, uint64_t))v42)(v125, v24, v126);
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      v46 = sub_24A01ED18();
      v47 = v38;
      v48 = v41;
      _os_signpost_emit_with_name_impl(&dword_249F70000, v37, v47, v46, "personalizeEmbeddingLayer", "", v45, 2u);
      v49 = v45;
      v50 = v42;
      v40 = v127;
      MEMORY[0x24BD07950](v49, -1, -1);

      v51 = v43;
      (*((void (**)(char *, uint64_t))v41 + 1))(v44, v43);
    }
    else
    {

      v48 = v123;
      v50 = (id *)*((_QWORD *)v123 + 2);
      v44 = v125;
      v51 = v126;
    }
    ((void (*)(char *, char *, uint64_t))v50)(v44, v24, v51);
    sub_24A01ED78();
    swift_allocObject();
    v66 = sub_24A01ED6C();
    v67 = (void (*)(char *, uint64_t))*((_QWORD *)v48 + 1);
    v67(v24, v51);
    v135[3] = (uint64_t)&type metadata for VUGallery.TokenEmbeddingPersonalizationType;
    LOBYTE(v135[0]) = v124;
    LOBYTE(v136) = 1;
    v68 = sub_249FE4B50((uint64_t)v135, (unsigned __int8 *)&v136);
    if (v40)
    {
      swift_release();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v135);
      return;
    }
    v69 = (void *)v68;
    v123 = v67;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v135);
    v70 = objc_msgSend(v69, sel_modelDescription);
    v71 = objc_msgSend(v70, sel_inputDescriptionsByName);

    sub_249F990DC(0, &qword_2578FFCA8);
    v72 = sub_24A01EDFC();

    if (*(_QWORD *)(v72 + 16) && (v73 = sub_249F8B0F8(0xD000000000000011, 0x800000024A021CF0), (v74 & 1) != 0))
    {
      v127 = v69;
      v75 = *(id *)(*(_QWORD *)(v72 + 56) + 8 * v73);
      swift_bridgeObjectRelease();
      v76 = objc_msgSend(v75, sel_multiArrayConstraint);

      v77 = v122;
      if (v76)
      {
        v78 = v66;
        v79 = objc_msgSend(v76, sel_shape);

        sub_249F990DC(0, (unint64_t *)&qword_2544CAD40);
        v80 = sub_24A01EF88();

        v82 = (void *)sub_249FE7678(v113, v80);
        v83 = v118 & 1;
        swift_bridgeObjectRelease();
        sub_249FEC2B4(v119, (uint64_t)v121, (uint64_t)v82, (uint64_t)v120, v83, v127);
        v120 = v82;
        v119 = v50;
        v84 = v129;
        v85 = v130;
        (*(void (**)(char *, uint64_t, uint64_t))(v129 + 16))(v77, v128, v130);
        v86 = sub_24A01ED90();
        v87 = sub_24A01F0CC();
        v88 = v87;
        if (os_log_type_enabled(v86, v87))
        {
          v89 = swift_slowAlloc();
          v131 = swift_slowAlloc();
          v135[0] = v131;
          *(_DWORD *)v89 = 134218498;
          v136 = v121;
          sub_24A01F1F8();
          *(_WORD *)(v89 + 12) = 2080;
          LODWORD(v128) = v88;
          sub_249FEFBD4();
          v121 = v86;
          v90 = v122;
          v91 = sub_24A01F444();
          v136 = (os_log_t)sub_249F8AAE8(v91, v92, v135);
          sub_24A01F1F8();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v84 + 8))(v90, v85);
          *(_WORD *)(v89 + 22) = 2080;
          LOBYTE(v136) = v124;
          v93 = sub_24A01EE74();
          v136 = (os_log_t)sub_249F8AAE8(v93, v94, v135);
          sub_24A01F1F8();
          swift_bridgeObjectRelease();
          v95 = v121;
          _os_log_impl(&dword_249F70000, v121, (os_log_type_t)v128, "Personalizing embedding layer at position %ld for %s type %s", (uint8_t *)v89, 0x20u);
          v96 = v131;
          swift_arrayDestroy();
          MEMORY[0x24BD07950](v96, -1, -1);
          MEMORY[0x24BD07950](v89, -1, -1);

        }
        else
        {

          (*(void (**)(char *, uint64_t))(v84 + 8))(v77, v85);
        }
        v97 = v126;
        v98 = v117;
        v99 = v116;
        v100 = v123;
        v101 = sub_24A01ED30();
        sub_24A01ED60();
        v102 = sub_24A01F168();
        if ((sub_24A01F1E0() & 1) != 0)
        {
          swift_retain();
          sub_24A01ED84();
          swift_release();
          v103 = v114;
          v104 = v115;
          v105 = (*(unsigned int (**)(char *, uint64_t))(v114 + 88))(v99, v115) == *MEMORY[0x24BEE7810];
          v112[1] = v78;
          if (v105)
          {
            v106 = "[Error] Interval already ended";
          }
          else
          {
            (*(void (**)(char *, uint64_t))(v103 + 8))(v99, v104);
            v106 = "";
          }
          v108 = v125;
          v107 = v126;
          ((void (*)(char *, char *, uint64_t))v119)(v125, v98, v126);
          v109 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v109 = 0;
          v110 = sub_24A01ED18();
          _os_signpost_emit_with_name_impl(&dword_249F70000, v101, v102, v110, "personalizeEmbeddingLayer", v106, v109, 2u);
          MEMORY[0x24BD07950](v109, -1, -1);

          v111 = v123;
          v123(v98, v107);
          swift_release();
          v111(v108, v107);
        }
        else
        {

          v100(v98, v97);
          swift_release();
        }
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      __break(1u);
    }
    __break(1u);
    JUMPOUT(0x249FEC29CLL);
  }
  v59 = sub_24A01ED90();
  v60 = sub_24A01F0CC();
  if (os_log_type_enabled(v59, v60))
  {
    v61 = (uint8_t *)swift_slowAlloc();
    v62 = swift_slowAlloc();
    v135[0] = v62;
    *(_DWORD *)v61 = 136315138;
    if ((_DWORD)v35 == 6)
      v63 = 3;
    else
      v63 = 0;
    if ((_DWORD)v35 == 63)
      v63 = 2;
    LOBYTE(v136) = v63;
    v64 = sub_24A01EE74();
    v136 = (os_log_t)sub_249F8AAE8(v64, v65, v135);
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_249F70000, v59, v60, "Skipping personalization for entity of type %s", v61, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD07950](v62, -1, -1);
    MEMORY[0x24BD07950](v61, -1, -1);
  }

}

void sub_249FEC2B4(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  unint64_t v6;
  void *v7;
  id v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  unint64_t v22;
  _WORD *v23;
  unint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  unint64_t v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;
  char v39;
  id v40;
  unint64_t v41;
  _WORD *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  _BYTE *v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  objc_class *v58;
  objc_class *v59;
  char v60;
  id v61;
  char *v62;
  char *v63;
  NSObject *v64;
  os_signpost_type_t v65;
  char v66;
  uint64_t v67;
  void (*v68)(char *, char *, unint64_t);
  char *v69;
  unint64_t v70;
  uint8_t *v71;
  os_signpost_id_t v72;
  uint8_t *v73;
  char *v74;
  void (*v75)(char *, char *, unint64_t);
  id v76;
  id v77;
  id v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t (*v85)(char *, unint64_t);
  uint64_t v86;
  char *v87;
  id v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  void *v96;
  _BYTE *v97;
  id v98;
  id v99;
  uint64_t v100;
  unint64_t v101;
  id v102;
  uint64_t v103;
  _BYTE *v104;
  void (*v105)(char *, unint64_t);
  NSObject *v106;
  char *v107;
  int v108;
  char *v109;
  char *v110;
  uint64_t v111;
  _QWORD *v112;
  const char *v113;
  char *v114;
  char *v115;
  unint64_t v116;
  uint8_t *v117;
  os_signpost_id_t v118;
  char *v119;
  char *v120;
  char *v121;
  char *v122;
  _QWORD *v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  id *v128;
  uint64_t v129;
  uint64_t v130;
  int v131;
  void *v132;
  id v133;
  id v134;
  unint64_t v135;
  uint64_t v136;
  NSObject *v137;
  id v138;
  id v139;
  uint64_t v140;

  v8 = v7;
  v134 = a6;
  v131 = a5;
  v129 = a3;
  v130 = a4;
  v136 = a2;
  v10 = sub_24A01ED54();
  v11 = *(_QWORD **)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v125 = (char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24A01ED24();
  v127 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v119 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v119 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v126 = (char *)&v119 - v20;
  v128 = a1;
  v133 = *a1;
  v21 = objc_msgSend(v133, sel_shape);
  v138 = (id)sub_249F990DC(0, (unint64_t *)&qword_2544CAD40);
  v22 = sub_24A01EF88();

  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    v23 = (_WORD *)sub_24A01F3CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v23 = *(_WORD **)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v132 = v7;
  if (v23 == (_WORD *)3)
  {
    v123 = v11;
    v124 = v10;
    v137 = v6;
    v135 = v22 & 0xC000000000000001;
    if ((v22 & 0xC000000000000001) != 0)
      goto LABEL_71;
    if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v25 = v19;
      v26 = v16;
      v27 = v13;
      v28 = *(id *)(v22 + 32);
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_73;
  }
  if (v23 != (_WORD *)2)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v43 = sub_24A01ED90();
    v44 = sub_24A01F0E4();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v140 = v46;
      *(_DWORD *)v45 = 136315138;
      v47 = swift_bridgeObjectRetain();
      v48 = MEMORY[0x24BD06E64](v47, v138);
      v50 = v49;
      swift_bridgeObjectRelease();
      v139 = (id)sub_249F8AAE8(v48, v50, &v140);
      sub_24A01F1F8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249F70000, v43, v44, "Cannot personalize layer of shape %s", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD07950](v46, -1, -1);
      MEMORY[0x24BD07950](v45, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

LABEL_27:
    sub_249F74AF4();
    swift_allocError();
    *v54 = 8;
    swift_willThrow();
    return;
  }
  v24 = v22 & 0xC000000000000001;
  while (1)
  {
    v32 = (unint64_t)(v23 - 1);
    v135 = v24;
    v137 = v6;
    v122 = v19;
    if (v24)
      break;
    if (v32 < *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v33 = *(id *)(v22 + 8 * v32 + 32);
      goto LABEL_13;
    }
    __break(1u);
LABEL_71:
    v25 = v19;
    v26 = v16;
    v27 = v13;
    v28 = (id)MEMORY[0x24BD071F4](0, v22);
LABEL_9:
    v29 = v28;
    v30 = (void *)sub_24A01F1BC();
    v31 = sub_24A01F1D4();

    v13 = v27;
    v16 = v26;
    v19 = v25;
    v11 = v123;
    v10 = v124;
    v6 = (unint64_t)v137;
    v24 = v135;
    if ((v31 & 1) == 0)
      goto LABEL_20;
  }
  v33 = (id)MEMORY[0x24BD071F4](v32, v22);
LABEL_13:
  v34 = v33;
  v35 = objc_msgSend(v33, sel_integerValue);

  if (v136 < 0 || (uint64_t)v35 <= v136)
  {
    swift_bridgeObjectRelease();
    v51 = sub_24A01ED90();
    v52 = sub_24A01F0E4();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = swift_slowAlloc();
      *(_DWORD *)v53 = 134218240;
      v140 = v136;
      sub_24A01F1F8();
      *(_WORD *)(v53 + 12) = 2048;
      v140 = (uint64_t)v35;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v51, v52, "Cannot personalize embedding at position %ld as input layer has %ld tokens", (uint8_t *)v53, 0x16u);
      MEMORY[0x24BD07950](v53, -1, -1);
    }

    goto LABEL_27;
  }
  v36 = objc_msgSend(v134, sel_modelDescription);
  v37 = objc_msgSend(v36, sel_outputDescriptionsByName);

  sub_249F990DC(0, &qword_2578FFCA8);
  v6 = sub_24A01EDFC();

  if (!*(_QWORD *)(v6 + 16) || (v38 = sub_249F8B0F8(0xD000000000000016, 0x800000024A023A90), (v39 & 1) == 0))
  {
LABEL_86:
    swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_87;
  }
  v40 = *(id *)(*(_QWORD *)(v6 + 56) + 8 * v38);
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v40, sel_multiArrayConstraint);

  if (!v8)
  {
LABEL_87:
    __break(1u);
    return;
  }
  v41 = (unint64_t)v23 - 1;
  v121 = (char *)v23 - 1;
  if (v135)
  {
    v42 = (_WORD *)MEMORY[0x24BD071F4]();
  }
  else
  {
    if (v41 >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_79;
    v42 = *(id *)(v22 + 8 * v41 + 32);
  }
  v23 = v42;
  v55 = objc_msgSend(v8, sel_shape);
  v6 = sub_24A01EF88();

  if (!(v6 >> 62))
  {
    v56 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v56)
      goto LABEL_32;
LABEL_74:
    v57 = swift_bridgeObjectRelease();
    __break(1u);
    goto LABEL_75;
  }
LABEL_73:
  swift_bridgeObjectRetain();
  v56 = sub_24A01F3CC();
  swift_bridgeObjectRelease();
  if (!v56)
    goto LABEL_74;
LABEL_32:
  v57 = v56 - 1;
  if (__OFSUB__(v56, 1))
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  if ((v6 & 0xC000000000000001) == 0)
  {
    if ((v57 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v57 < *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v58 = (objc_class *)*(id *)(v6 + 8 * v57 + 32);
      goto LABEL_37;
    }
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
LABEL_76:
  v58 = (objc_class *)MEMORY[0x24BD071F4](v57, v6);
LABEL_37:
  v59 = v58;
  swift_bridgeObjectRelease();
  v60 = sub_24A01F1D4();

  if ((v60 & 1) == 0)
  {
    v76 = v8;
    swift_bridgeObjectRetain();
    v16 = (char *)v76;
    v6 = sub_24A01ED90();
    LOBYTE(v10) = sub_24A01F0E4();
    if (!os_log_type_enabled((os_log_t)v6, (os_log_type_t)v10))
    {

      swift_bridgeObjectRelease_n();
LABEL_61:

      sub_249F74AF4();
      swift_allocError();
      *v104 = 8;
      swift_willThrow();

      return;
    }
    v23 = (_WORD *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v23 = 138412546;
    if (v135)
      v77 = (id)MEMORY[0x24BD071F4](v121, v22);
    else
      v77 = *(id *)(v22 + 8 * (_QWORD)v121 + 32);
    v98 = v77;
    v140 = (uint64_t)v77;
    sub_24A01F1F8();
    *v11 = v98;
    swift_bridgeObjectRelease_n();
    v23[6] = 2112;
    v99 = objc_msgSend(v16, sel_shape);
    v22 = sub_24A01EF88();

    if (!(v22 >> 62))
    {
      v100 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v100)
        goto LABEL_55;
      goto LABEL_81;
    }
LABEL_80:
    swift_bridgeObjectRetain();
    v100 = sub_24A01F3CC();
    swift_bridgeObjectRelease();
    if (v100)
    {
LABEL_55:
      v101 = v100 - 1;
      if (!__OFSUB__(v100, 1))
      {
        if ((v22 & 0xC000000000000001) == 0)
        {
          if ((v101 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v101 < *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v102 = *(id *)(v22 + 8 * v101 + 32);
LABEL_60:
            v103 = (uint64_t)v102;
            swift_bridgeObjectRelease();
            v140 = v103;
            sub_24A01F1F8();
            v11[1] = v103;

            _os_log_impl(&dword_249F70000, (os_log_t)v6, (os_log_type_t)v10, "Cannot personalize layer of embedding size %@, expected %@", (uint8_t *)v23, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF530);
            swift_arrayDestroy();
            MEMORY[0x24BD07950](v11, -1, -1);
            MEMORY[0x24BD07950](v23, -1, -1);
            goto LABEL_61;
          }
          __break(1u);
          goto LABEL_86;
        }
LABEL_83:
        v102 = (id)MEMORY[0x24BD071F4](v101, v22);
        goto LABEL_60;
      }
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
LABEL_81:
    swift_bridgeObjectRelease();

    __break(1u);
    goto LABEL_82;
  }
  v61 = objc_msgSend(v133, sel_dataType);
  if (v61 == objc_msgSend(v8, sel_dataType))
  {
    v138 = v8;
    v123 = v11;
    v124 = v10;
    v135 = v13;
    v62 = (char *)v137 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_signposter;
    sub_24A01ED30();
    v63 = v126;
    sub_24A01ED0C();
    v64 = sub_24A01ED30();
    v65 = sub_24A01F174();
    v66 = sub_24A01F1E0();
    v119 = v62;
    v120 = v16;
    if ((v66 & 1) != 0)
    {
      v67 = v127;
      v68 = *(void (**)(char *, char *, unint64_t))(v127 + 16);
      v69 = v122;
      v70 = v135;
      v68(v122, v63, v135);
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      v72 = sub_24A01ED18();
      _os_signpost_emit_with_name_impl(&dword_249F70000, v64, v65, v72, "personalizeEmbeddingLayerInference", "", v71, 2u);
      v73 = v71;
      v74 = v69;
      MEMORY[0x24BD07950](v73, -1, -1);

      (*(void (**)(char *, unint64_t))(v67 + 8))(v69, v70);
      v75 = v68;
      v68(v69, v63, v70);
    }
    else
    {

      v67 = v127;
      v75 = *(void (**)(char *, char *, unint64_t))(v127 + 16);
      v70 = v135;
      v74 = v122;
      v75(v122, v63, v135);
    }
    sub_24A01ED78();
    swift_allocObject();
    v133 = (id)sub_24A01ED6C();
    v85 = *(uint64_t (**)(char *, unint64_t))(v67 + 8);
    v86 = v85(v63, v70);
    v87 = v74;
    MEMORY[0x24BDAC7A8](v86);
    v88 = v138;
    v89 = v136;
    *(&v119 - 10) = (char *)v138;
    *(&v119 - 9) = (char *)v89;
    v90 = v121;
    *(&v119 - 8) = (char *)v22;
    *(&v119 - 7) = v90;
    v91 = v129;
    *(&v119 - 6) = (char *)v92;
    *(&v119 - 5) = (char *)v91;
    v93 = v130;
    *(&v119 - 4) = (char *)v134;
    *(&v119 - 3) = (char *)v93;
    *((_BYTE *)&v119 - 16) = v131 & 1;
    *(&v119 - 1) = (char *)v137;
    v95 = v94;
    v96 = v132;
    sub_24A01F0B4();

    swift_bridgeObjectRelease();
    if (v96)
    {

      swift_release();
    }
    else
    {
      v105 = (void (*)(char *, unint64_t))v85;
      v106 = sub_24A01ED30();
      v107 = v120;
      sub_24A01ED60();
      v108 = sub_24A01F168();
      if ((sub_24A01F1E0() & 1) != 0)
      {
        LODWORD(v137) = v108;
        v109 = v107;
        swift_retain();
        v110 = v125;
        sub_24A01ED84();
        swift_release();
        v112 = v123;
        v111 = v124;
        if (((unsigned int (*)(char *, uint64_t))v123[11])(v110, v124) == *MEMORY[0x24BEE7810])
        {
          v113 = "[Error] Interval already ended";
        }
        else
        {
          ((void (*)(char *, uint64_t))v112[1])(v110, v111);
          v113 = "";
        }
        v114 = v87;
        v115 = v87;
        v116 = v135;
        v75(v115, v109, v135);
        v117 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v117 = 0;
        v118 = sub_24A01ED18();
        _os_signpost_emit_with_name_impl(&dword_249F70000, v106, (os_signpost_type_t)v137, v118, "personalizeEmbeddingLayerInference", v113, v117, 2u);
        MEMORY[0x24BD07950](v117, -1, -1);

        v105(v109, v116);
        swift_release();
        v105(v114, v116);
      }
      else
      {

        v85(v107, v135);
        swift_release();
      }
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v78 = v8;
    v79 = sub_24A01ED90();
    v80 = sub_24A01F0E4();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = (uint8_t *)swift_slowAlloc();
      v82 = swift_slowAlloc();
      v140 = v82;
      *(_DWORD *)v81 = 136315138;
      v139 = objc_msgSend(v78, sel_dataType);
      type metadata accessor for MLMultiArrayDataType(0);
      v83 = sub_24A01EE74();
      v139 = (id)sub_249F8AAE8(v83, v84, &v140);
      sub_24A01F1F8();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249F70000, v79, v80, "Cannot personalize layer, expected type %s", v81, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD07950](v82, -1, -1);
      MEMORY[0x24BD07950](v81, -1, -1);
    }
    else
    {

    }
    sub_249F74AF4();
    swift_allocError();
    *v97 = 8;
    swift_willThrow();

  }
}

void VUGallery.personalize(embeddingLayer:at:for:with:type:randomizeWithSeed:)(id *a1, uint64_t a2, void *a3, uint64_t a4, unsigned __int8 *a5, uint64_t a6, char a7)
{
  sub_249FEFD9C(a1, a2, a3, a5, a6, a7 & 1);
}

void sub_249FED1A4(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, double *a6, uint8_t *a7, id *a8, uint64_t a9, id *a10, uint64_t a11, char a12, uint64_t a13)
{
  _OWORD *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id i;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id *v32;
  uint64_t inited;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  char v38;
  char v39;
  double v40;
  uint64_t j;
  double v42;
  uint64_t v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  int64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t *v64;
  uint64_t v65;
  unint64_t v66;
  _BYTE *v67;
  double v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint8_t *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  id v105;
  uint64_t v106;
  id v107;
  uint8_t *v108;
  uint8_t *v109;
  void *v110;
  id v111;
  unint64_t v112;
  _OWORD *v113;
  uint8_t *v114;
  uint64_t v115;
  __int128 v116;
  _OWORD *v117;
  id *v118;
  uint8_t *v119;
  BOOL v120;
  uint64_t v121;
  unint64_t v122;
  _BYTE v123[32];
  _QWORD v124[10];
  uint64_t v125[4];
  id v126[4];
  uint64_t v127;
  uint64_t v128;

  v118 = a8;
  v119 = a7;
  v128 = *MEMORY[0x24BDAC8D0];
  v18 = (_OWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCE8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (unint64_t)&v108 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)(a3 + 16);
  v22 = objc_msgSend(a4, sel_dataType);
  v23 = 2;
  if (v22 == (id)65568)
    v23 = 4;
  v117 = a1;
  if (!a1)
    goto LABEL_99;
  if (v21 < 2)
    goto LABEL_92;
  v21 -= 2;
  a1 = (_QWORD *)(a3 + 32);
  v24 = *(_QWORD *)(a3 + 32 + 8 * v21);
  v25 = a5 * v24;
  if ((unsigned __int128)(a5 * (__int128)v24) >> 64 != (a5 * v24) >> 63)
    goto LABEL_93;
  v114 = (uint8_t *)v20;
  v20 = v25 * v23;
  if ((unsigned __int128)(v25 * (__int128)v23) >> 64 != (v25 * v23) >> 63)
    goto LABEL_94;
  v113 = v18;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAF30);
  v18 = (_OWORD *)swift_allocObject();
  v116 = xmmword_24A020920;
  v18[1] = xmmword_24A020920;
  sub_249F990DC(0, (unint64_t *)&qword_2544CAD40);
  *((_QWORD *)v18 + 4) = sub_24A01F1BC();
  if (((unint64_t)a6 & 0xC000000000000001) != 0)
    goto LABEL_95;
  if (((unint64_t)v119 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
  }
  if (*(_QWORD *)(((unint64_t)a6 & 0xFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)v119)
    goto LABEL_97;
  for (i = *(id *)&a6[(_QWORD)v119 + 4]; ; i = (id)MEMORY[0x24BD071F4](v119, a6))
  {
    v119 = (uint8_t *)v117 + v20;
    *((_QWORD *)v18 + 5) = i;
    v126[0] = v18;
    sub_24A01EFA0();
    v118 = (id *)objc_msgSend(*v118, sel_dataType);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = v116;
    *(_QWORD *)(v27 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a1[v21]);
    *(_QWORD *)(v27 + 40) = sub_24A01F1BC();
    v126[0] = (id)v27;
    sub_24A01EFA0();
    v28 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
    v29 = (void *)sub_24A01EF70();
    swift_bridgeObjectRelease();
    v30 = (void *)sub_24A01EF70();
    swift_bridgeObjectRelease();
    v126[0] = 0;
    v18 = objc_msgSend(v28, sel_initWithDataPointer_shape_dataType_strides_deallocator_error_, v119, v29, v118, v30, 0, v126);

    v31 = v126[0];
    if (!v18)
    {
      v47 = v126[0];
      sub_24A01EA00();

      swift_willThrow();
      return;
    }
    v32 = a10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCF0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24A0208C0;
    *(_QWORD *)(inited + 32) = 0xD000000000000011;
    *(_QWORD *)(inited + 40) = 0x800000024A021CF0;
    a1 = (_QWORD *)objc_opt_self();
    v34 = v31;
    *(_QWORD *)(inited + 48) = objc_msgSend(a1, sel_featureValueWithMultiArray_, a9);
    *(_QWORD *)(inited + 56) = 0x6D655F6E656B6F74;
    *(_QWORD *)(inited + 64) = 0xEF676E6964646562;
    *(_QWORD *)(inited + 72) = objc_msgSend(a1, sel_featureValueWithMultiArray_, v18);
    v122 = sub_249F76648(inited);
    v35 = objc_msgSend(a10, sel_modelDescription);
    v36 = objc_msgSend(v35, sel_inputDescriptionsByName);

    sub_249F990DC(0, &qword_2578FFCA8);
    v37 = sub_24A01EDFC();

    if (!*(_QWORD *)(v37 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_27:
      v48 = v115;
      goto LABEL_82;
    }
    sub_249F8B0F8(0xD000000000000010, 0x800000024A023AE0);
    v39 = v38;
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
      goto LABEL_27;
    v112 = (unint64_t)"dingLayerInference";
    v118 = a10;
    v127 = 0;
    v117 = v18;
    if ((a12 & 1) != 0)
      break;
    v124[0] = 0x3FDCCCCCCCCCCCCDLL;
    v124[1] = &unk_251B68070;
    v124[2] = 0x3FD0000000000000;
    v124[3] = &unk_251B67F40;
    v124[4] = 0x3FB999999999999ALL;
    v124[5] = &unk_251B67F80;
    v124[6] = 0x3FB999999999999ALL;
    v124[7] = &unk_251B67FC0;
    v124[8] = 0x3FB999999999999ALL;
    v124[9] = &unk_251B68000;
    srand48(a11);
    v21 = MEMORY[0x24BEE4AF8];
    v40 = drand48();
    for (j = 0; j != 80; j += 16)
    {
      v42 = *(double *)&v123[j + 32];
      v43 = *(_QWORD *)(v21 + 16);
      if (v43)
        v44 = v42 + *(double *)(v21 + 8 * v43 + 24);
      else
        v44 = v42 + 0.0;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v21 = (unint64_t)sub_249F8A428(0, *(_QWORD *)(v21 + 16) + 1, 1, (_QWORD *)v21);
      v46 = *(_QWORD *)(v21 + 16);
      v45 = *(_QWORD *)(v21 + 24);
      if (v46 >= v45 >> 1)
        v21 = (unint64_t)sub_249F8A428((_QWORD *)(v45 > 1), v46 + 1, 1, (_QWORD *)v21);
      *(_QWORD *)(v21 + 16) = v46 + 1;
      a6 = (double *)(v21 + 32);
      *(double *)(v21 + 32 + 8 * v46) = v44;
      swift_bridgeObjectRelease();
    }
    v49 = *(_QWORD *)(v21 + 16);
    v18 = v117;
    if (!v49 || (v40 >= *a6 ? (v50 = v49 == 1) : (v50 = 1), v50))
    {
LABEL_37:
      swift_bridgeObjectRelease();
      v20 = 0;
LABEL_38:
      v53 = v124[2 * v20 + 1];
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD18);
      swift_arrayDestroy();
      v127 = v53;
      break;
    }
    v51 = 5;
    while (1)
    {
      v20 = v51 - 4;
      v52 = v51 - 3;
      if (__OFADD__(v51 - 4, 1))
        goto LABEL_98;
      if (v40 < *(double *)(v21 + 8 * v51))
        break;
      ++v51;
      if (v52 == v49)
        goto LABEL_37;
    }
    swift_bridgeObjectRelease();
    if (v20 <= 4)
      goto LABEL_38;
    __break(1u);
LABEL_92:
    __break(1u);
LABEL_93:
    __break(1u);
LABEL_94:
    __break(1u);
LABEL_95:
    ;
  }
  *(_QWORD *)&v116 = a13;
  v54 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v55 = (void *)sub_24A01EE44();
  v56 = objc_msgSend(v54, sel_initWithSuiteName_, v55);

  if (!v56)
    goto LABEL_74;
  v57 = v56;
  v58 = (void *)sub_24A01EE44();
  v59 = objc_msgSend(v57, sel_objectForKey_, v58);

  if (v59)
  {
    sub_24A01F21C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v125, 0, sizeof(v125));
  }
  sub_249F98C10((uint64_t)v125, (uint64_t)v126, &qword_2544CAF40);
  if (!v126[3])
  {

    sub_249F990A0((uint64_t)v126, &qword_2544CAF40);
    goto LABEL_74;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAE88);
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_74;
  }
  v111 = v57;
  v60 = *(_QWORD *)(v121 + 16);
  v61 = MEMORY[0x24BEE4AF8];
  if (!v60)
    goto LABEL_70;
  v125[0] = MEMORY[0x24BEE4AF8];
  v62 = (uint64_t *)v121;
  isUniquelyReferenced_nonNull_native = sub_249F8CDAC(0, v60, 0);
  v110 = v62;
  v64 = v62 + 5;
  do
  {
    v66 = *(v64 - 1);
    v65 = *v64;
    v121 = 0;
    MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
    *(&v108 - 2) = (uint8_t *)&v121;
    if ((v65 & 0x1000000000000000) != 0)
      goto LABEL_67;
    if ((v65 & 0x2000000000000000) == 0)
    {
      if ((v66 & 0x1000000000000000) != 0)
      {
        switch(*(_BYTE *)(v65 + 32))
        {
          case 0:
          case 9:
          case 0xA:
          case 0xB:
          case 0xC:
          case 0xD:
          case 0x20:
            goto LABEL_54;
          default:
            swift_bridgeObjectRetain();
            v67 = (_BYTE *)_swift_stdlib_strtod_clocale();
            if (!v67)
              goto LABEL_55;
            goto LABEL_66;
        }
      }
LABEL_67:
      swift_bridgeObjectRetain();
      v71 = v115;
      sub_24A01F2E8();
      v115 = v71;
      goto LABEL_56;
    }
    v126[0] = (id)v66;
    v126[1] = (id)(v65 & 0xFFFFFFFFFFFFFFLL);
    switch((char)v66)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 32:
LABEL_54:
        swift_bridgeObjectRetain();
        goto LABEL_55;
      default:
        swift_bridgeObjectRetain();
        v67 = (_BYTE *)_swift_stdlib_strtod_clocale();
        if (v67)
LABEL_66:
          v120 = *v67 == 0;
        else
LABEL_55:
          v120 = 0;
        break;
    }
LABEL_56:
    swift_bridgeObjectRelease();
    if (v120)
      v68 = *(double *)&v121;
    else
      v68 = 0.0;
    v61 = v125[0];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      isUniquelyReferenced_nonNull_native = sub_249F8CDAC(0, *(_QWORD *)(v61 + 16) + 1, 1);
      v61 = v125[0];
    }
    v70 = *(_QWORD *)(v61 + 16);
    v69 = *(_QWORD *)(v61 + 24);
    if (v70 >= v69 >> 1)
    {
      isUniquelyReferenced_nonNull_native = sub_249F8CDAC(v69 > 1, v70 + 1, 1);
      v61 = v125[0];
    }
    v64 += 2;
    *(_QWORD *)(v61 + 16) = v70 + 1;
    *(double *)(v61 + 8 * v70 + 32) = v68;
    --v60;
  }
  while (v60);
  v18 = v117;
LABEL_70:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v127 = v61;
  swift_bridgeObjectRetain_n();
  v72 = sub_24A01ED90();
  v73 = sub_24A01F0E4();
  if (os_log_type_enabled(v72, v73))
  {
    v74 = (uint8_t *)swift_slowAlloc();
    v110 = (void *)swift_slowAlloc();
    v126[0] = v110;
    *(_DWORD *)v74 = 136315138;
    v108 = v74 + 4;
    v109 = v74;
    v75 = swift_bridgeObjectRetain();
    v76 = MEMORY[0x24BD06E64](v75, MEMORY[0x24BEE13C8]);
    v78 = v77;
    swift_bridgeObjectRelease();
    v125[0] = sub_249F8AAE8(v76, v78, (uint64_t *)v126);
    sub_24A01F1F8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v79 = v109;
    _os_log_impl(&dword_249F70000, v72, v73, "Overriding bounding box to %s", v109, 0xCu);
    v80 = v110;
    swift_arrayDestroy();
    MEMORY[0x24BD07950](v80, -1, -1);
    MEMORY[0x24BD07950](v79, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

LABEL_74:
  swift_beginAccess();
  v81 = v127;
  if (v127)
  {
    sub_249F990DC(0, &qword_2578FFCF8);
    v125[0] = v81;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD00);
    sub_249F98C68(&qword_2578FFD08, &qword_2578FFD00, MEMORY[0x24BEE12C8]);
    sub_24A01EDB4();
    sub_249F98C68(&qword_2578FFD10, &qword_2578FFCE8, MEMORY[0x24BDBFCD0]);
    v82 = (void *)sub_24A01F0C0();
    v83 = objc_msgSend(a1, sel_featureValueWithMultiArray_, v82);
    if (v83)
    {
      v84 = (uint64_t)v83;
      v85 = v122;
      v86 = swift_isUniquelyReferenced_nonNull_native();
      v125[0] = v85;
      sub_249FC0700(v84, 0xD000000000000010, v112 | 0x8000000000000000, v86);
      v122 = v125[0];
      swift_bridgeObjectRelease();
    }
    else
    {

    }
    swift_bridgeObjectRetain();
    v87 = sub_24A01ED90();
    v88 = sub_24A01F0CC();
    if (os_log_type_enabled(v87, v88))
    {
      *(_QWORD *)&v116 = v82;
      v89 = (uint8_t *)swift_slowAlloc();
      v90 = swift_slowAlloc();
      v125[0] = v90;
      *(_DWORD *)v89 = 136315138;
      v114 = v89 + 4;
      v91 = swift_bridgeObjectRetain();
      v92 = MEMORY[0x24BD06E64](v91, MEMORY[0x24BEE13C8]);
      v94 = v93;
      swift_bridgeObjectRelease();
      v121 = sub_249F8AAE8(v92, v94, v125);
      sub_24A01F1F8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249F70000, v87, v88, "Using bounding box to ground face to %s", v89, 0xCu);
      swift_arrayDestroy();
      v95 = v90;
      v18 = v117;
      MEMORY[0x24BD07950](v95, -1, -1);
      MEMORY[0x24BD07950](v89, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n();

    }
  }
  v48 = v115;
  v32 = v118;
LABEL_82:
  v96 = swift_bridgeObjectRetain();
  sub_249FE3D90(v96);
  swift_bridgeObjectRelease();
  v97 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
  v98 = sub_249FEE800();
  if (v48)
  {

    goto LABEL_88;
  }
  v99 = v98;
  v125[0] = 0;
  v100 = objc_msgSend(v32, sel_predictionFromFeatures_error_, v98, v125);
  if (!v100)
  {
    v107 = (id)v125[0];
    swift_bridgeObjectRelease();
    sub_24A01EA00();

    swift_willThrow();
    return;
  }
  v101 = v100;
  v102 = (id)v125[0];
  v103 = (void *)sub_24A01EE44();
  v104 = objc_msgSend(v101, sel_featureValueForName_, v103);

  swift_unknownObjectRelease();
  if (!v104)
  {
    __break(1u);
    goto LABEL_101;
  }
  v105 = objc_msgSend(v104, sel_multiArrayValue);

  if (!v105)
  {
LABEL_101:
    __break(1u);
    JUMPOUT(0x249FEE17CLL);
  }
  MEMORY[0x24BDAC7A8](v106);
  *(&v108 - 2) = v119;
  sub_24A01F0A8();

LABEL_88:
  swift_bridgeObjectRelease();
}

void VUGallery.personalize(tokenEmbedding:for:client:type:)(id *a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;

  v4 = *a4;
  v6 = *a3;
  v5 = v4;
  VUGallery.personalize(embeddingLayer:at:for:client:type:randomizeWithSeed:)(a1, 0, a2, &v6, &v5, 0, 1);
}

uint64_t VUGallery.isTokenEmbeddingAvailable(for:)(_BYTE *a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char *v17;
  id v18;
  uint64_t v19;
  char *v20;
  void *v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];

  v2 = sub_24A01EAA8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A01EC10();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCB0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCB8);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  if (*a1 != 3)
    return 1;
  v23 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v7;
  v25 = v6;
  v26 = v5;
  v27 = v3;
  v28 = v2;
  sub_24A01EBBC();
  __swift_project_boxed_opaque_existential_1Tm(v29, v29[3]);
  sub_24A01EBF8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v29);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_249F990A0((uint64_t)v12, &qword_2578FFCB0);
    return 0;
  }
  else
  {
    v17 = v23;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v23, v12, v13);
    v18 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v19 = sub_24A01EBD4();
    v20 = v26;
    MEMORY[0x24BD06AD4](v19);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v25);
    sub_24A01EA78();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v28);
    v21 = (void *)sub_24A01EE44();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v18, sel_fileExistsAtPath_, v21);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  return (uint64_t)v16;
}

uint64_t VUGallery.personalizationVersion(for:)(_BYTE *a1)
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
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v18[3];
  _QWORD v19[3];
  unint64_t v20;

  v2 = sub_24A01EBEC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCB8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  if (*a1 == 2)
  {
    sub_24A01EBB0();
    __swift_project_boxed_opaque_existential_1Tm(v19, v20);
    sub_24A01EBF8();
    sub_24A01EBC8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v11 = sub_24A01EBE0();
    v13 = v12;
    v14 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v18[0] = 46;
    v18[1] = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v14);
    v18[-2] = v18;
    swift_bridgeObjectRetain();
    v15 = sub_249FEE8E4(0x7FFFFFFFFFFFFFFFLL, 1, sub_249FF093C, (uint64_t)&v18[-4], v11, v13);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
    v16 = *(_QWORD *)(v15 + 16);
    if (v16 >= 3)
      v16 = 3;
    v19[0] = v15;
    v19[1] = v15 + 32;
    v19[2] = 0;
    v20 = (2 * v16) | 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCC0);
    sub_249F98C68(&qword_2578FFCC8, &qword_2578FFCC0, MEMORY[0x24BEE2180]);
    sub_249FF0954();
    v10 = sub_24A01EF4C();
    swift_bridgeObjectRelease();
  }
  return v10;
}

id sub_249FEE800()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_24A01EDF0();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithDictionary_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_24A01EA00();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_249FEE8E4(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
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
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_249FEED80(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_24A01EF1C();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_24A01EEA4();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_24A01EEA4();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_24A01EF34();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_249F89B88(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_249F89B88((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_24A01EEA4();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_24A01EF34();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_249F89B88(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_249F89B88((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_24A01F3B4();
  __break(1u);
LABEL_42:
  result = sub_24A01F3B4();
  __break(1u);
  return result;
}

uint64_t sub_249FEED80(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_24A01EF34();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_249F89B88(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_249F89B88((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_24A01F3B4();
  __break(1u);
  return result;
}

uint64_t sub_249FEEED8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VUGallery.TagView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249FEEF1C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for VUGallery.TagView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_249FEEF58@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_249FE5AB0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_249FEEF70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_249FE61D0(*(_QWORD *)(v1 + 16), a1);
}

void sub_249FEEF88()
{
  uint64_t *v0;

  sub_249FE6AEC(v0[2], v0[3], v0[4]);
}

uint64_t sub_249FEEFA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_249FE7234(*(_QWORD *)(v1 + 16), a1);
}

void sub_249FEEFBC(uint64_t a1)
{
  __asm { BR              X12 }
}

void sub_249FEF020(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v5 - 104) = v2;
  *(_WORD *)(v5 - 96) = a2;
  *(_BYTE *)(v5 - 94) = BYTE2(a2);
  *(_BYTE *)(v5 - 93) = BYTE3(a2);
  *(_BYTE *)(v5 - 92) = BYTE4(a2);
  *(_BYTE *)(v5 - 91) = BYTE5(a2);
  *(_BYTE *)(v5 - 90) = BYTE6(a2);
  MEMORY[0x24BDAC7A8](a1);
  sub_24A01F0A8();
  v6 = *(_QWORD *)(v5 - 104);
  v7 = *(unsigned int *)(v5 - 96);
  v8 = *(unsigned __int8 *)(v5 - 92);
  v9 = *(unsigned __int8 *)(v5 - 91);
  v10 = *(unsigned __int8 *)(v5 - 90);

  *v4 = v6;
  v4[1] = v7 | (v8 << 32) | (v9 << 40) | (v10 << 48);
}

void sub_249FEF2E8(int *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_24A01EAC0();
  v4 = *a1;
  if (a1[1] < (int)v4)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (sub_24A01E9AC())
  {
    if (!__OFSUB__(v4, sub_24A01E9D0()))
    {
      v5 = sub_24A01E9C4();
      MEMORY[0x24BDAC7A8](v5);
      sub_24A01F0A8();

      return;
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_249FEF3DC(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_24A01F45C() & 1;
}

uint64_t _s19VisualUnderstanding9VUGalleryC26isPersonalizationAvailable3forSbAC014TokenEmbeddingE4TypeO_tF_0(_BYTE *a1)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char *v17;
  id v18;
  uint64_t v19;
  char *v20;
  void *v21;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];

  v2 = sub_24A01EAA8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A01EC10();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCB0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCB8);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  if (*a1 != 2)
    return 1;
  v23 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v7;
  v25 = v6;
  v26 = v5;
  v27 = v3;
  v28 = v2;
  sub_24A01EBB0();
  __swift_project_boxed_opaque_existential_1Tm(v29, v29[3]);
  sub_24A01EBF8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v29);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_249F990A0((uint64_t)v12, &qword_2578FFCB0);
    return 0;
  }
  else
  {
    v17 = v23;
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v23, v12, v13);
    v18 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v19 = sub_24A01EBD4();
    v20 = v26;
    MEMORY[0x24BD06AD4](v19);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v9, v25);
    sub_24A01EA78();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v28);
    v21 = (void *)sub_24A01EE44();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v18, sel_fileExistsAtPath_, v21);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  return (uint64_t)v16;
}

id sub_249FEF704(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_24A01EA30();
  v13[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_modelWithContentsOfURL_configuration_error_, v4, a2, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_24A01EAA8();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_24A01EA00();

    swift_willThrow();
    v11 = sub_24A01EAA8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_249FEF820(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(uint64_t, _QWORD))
{
  uint64_t v5;
  int64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v22 = MEMORY[0x24BEE4AF8];
  sub_249F8CD90(0, 0, 0);
  v9 = a4 >> 1;
  result = swift_unknownObjectRetain();
  if (v9 == a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
    return v22;
  }
  else
  {
    v11 = 0;
    v19 = v9;
    v20 = a2 + 8 * a3;
    v18 = a3 - v9;
    while (a3 + v11 < v9)
    {
      if (__OFADD__(v11, 1))
        goto LABEL_13;
      result = a5(v11, *(_QWORD *)(v20 + 8 * v11));
      if (v5)
      {
        swift_release();
        goto LABEL_11;
      }
      v13 = result;
      v14 = v12;
      v16 = *(_QWORD *)(v22 + 16);
      v15 = *(_QWORD *)(v22 + 24);
      if (v16 >= v15 >> 1)
        result = sub_249F8CD90(v15 > 1, v16 + 1, 1);
      *(_QWORD *)(v22 + 16) = v16 + 1;
      v17 = v22 + 16 * v16;
      *(_QWORD *)(v17 + 32) = v13;
      *(_QWORD *)(v17 + 40) = v14;
      ++v11;
      v9 = v19;
      if (!(v18 + v11))
        goto LABEL_11;
    }
    __break(1u);
LABEL_13:
    __break(1u);
  }
  return result;
}

uint64_t _s19VisualUnderstanding9VUGalleryC21tokenEmbeddingVersion3forSSSgAC05TokenE4TypeO_tF_0(_BYTE *a1)
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
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v18[3];
  _QWORD v19[3];
  unint64_t v20;

  v2 = sub_24A01EBEC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCB8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  if (*a1 == 3)
  {
    sub_24A01EBBC();
    __swift_project_boxed_opaque_existential_1Tm(v19, v20);
    sub_24A01EBF8();
    sub_24A01EBC8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v11 = sub_24A01EBE0();
    v13 = v12;
    v14 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v18[0] = 46;
    v18[1] = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v14);
    v18[-2] = v18;
    swift_bridgeObjectRetain();
    v15 = sub_249FEE8E4(0x7FFFFFFFFFFFFFFFLL, 1, sub_249FF093C, (uint64_t)&v18[-4], v11, v13);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
    v16 = *(_QWORD *)(v15 + 16);
    if (v16 >= 3)
      v16 = 3;
    v19[0] = v15;
    v19[1] = v15 + 32;
    v19[2] = 0;
    v20 = (2 * v16) | 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFCC0);
    sub_249F98C68(&qword_2578FFCC8, &qword_2578FFCC0, MEMORY[0x24BEE2180]);
    sub_249FF0954();
    v10 = sub_24A01EF4C();
    swift_bridgeObjectRelease();
  }
  return v10;
}

unint64_t sub_249FEFBD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578FFCA0;
  if (!qword_2578FFCA0)
  {
    v1 = sub_24A01EBA4();
    result = MEMORY[0x24BD078A8](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_2578FFCA0);
  }
  return result;
}

void sub_249FEFC1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_249FE8964(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

void sub_249FEFC34(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_249FEABC0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_249FEFC4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_249FEFC70()
{
  uint64_t v0;

  return sub_249FEAD78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_249FEFC78()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_249FEFCA0(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_24A01E9E8();
      swift_allocObject();
      sub_24A01E9B8();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_24A01EACC();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_249FEFD3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_249FEB028(*(_BYTE *)(v1 + 24), a1);
}

void sub_249FEFD58()
{
  uint64_t v0;

  sub_249FEB174(*(_QWORD *)(v0 + 16));
}

uint64_t sub_249FEFD74()
{
  uint64_t v0;

  return sub_249FEB420(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48), *(_BYTE *)(v0 + 49), *(_QWORD *)(v0 + 56));
}

void sub_249FEFD9C(id *a1, uint64_t a2, void *a3, unsigned __int8 *a4, uint64_t a5, int a6)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  unint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  char *v32;
  NSObject *v33;
  os_signpost_type_t v34;
  char v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  uint8_t *v39;
  os_signpost_id_t v40;
  uint8_t *v41;
  void (*v42)(char *, char *, uint64_t);
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  id v60;
  id v61;
  id v62;
  unint64_t v63;
  uint64_t inited;
  uint64_t v65;
  unint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  id v74;
  void *v75;
  int v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  NSObject *v81;
  os_log_type_t v82;
  void *v83;
  uint64_t v84;
  _QWORD *v85;
  id v86;
  unint64_t v87;
  void (*v88)(char *, uint64_t);
  NSObject *v89;
  char *v90;
  os_signpost_type_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  char *v96;
  uint64_t v97;
  uint8_t *v98;
  os_signpost_id_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, char *, uint64_t);
  void (*v103)(char *, uint64_t);
  char *v104;
  char *v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  id *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120[5];
  uint64_t v121;

  v7 = v6;
  v113 = a6;
  v114 = a1;
  v115 = a5;
  v11 = sub_24A01ED54();
  v111 = *(_QWORD *)(v11 - 8);
  v112 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v110 = (char *)&v101 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24A01ED24();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v101 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v117 = (char *)&v101 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v101 - v20;
  LODWORD(v116) = *a4;
  v22 = sub_249FEA394();
  if (v23 >> 60 == 15)
  {
LABEL_2:
    v24 = sub_24A01ED90();
    v25 = sub_24A01F0E4();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_249F70000, v24, v25, "Cannot extract embedding data from observation!", v26, 2u);
      MEMORY[0x24BD07950](v26, -1, -1);
    }

    sub_249F74AF4();
    v27 = swift_allocError();
    *v28 = 8;
    v119 = v27;
    swift_willThrow();
    return;
  }
  v29 = (uint64_t)v22;
  v30 = v23;
  v118 = v7;
  objc_opt_self();
  v31 = a3;
  if (swift_dynamicCastObjCClass())
  {
    v106 = a2;
    v108 = v29;
    v109 = v30;
    v32 = (char *)v118 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_signposter;
    sub_24A01ED30();
    sub_24A01ED0C();
    v104 = v32;
    v33 = sub_24A01ED30();
    v34 = sub_24A01F174();
    v35 = sub_24A01F1E0();
    v105 = v17;
    if ((v35 & 1) != 0)
    {
      v107 = v31;
      v36 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
      v37 = v117;
      v36(v117, v21, v13);
      v38 = v13;
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      v40 = sub_24A01ED18();
      _os_signpost_emit_with_name_impl(&dword_249F70000, v33, v34, v40, "personalizeEmbeddingLayer", "", v39, 2u);
      v41 = v39;
      v13 = v38;
      MEMORY[0x24BD07950](v41, -1, -1);

      (*(void (**)(char *, uint64_t))(v14 + 8))(v37, v38);
      v42 = v36;
      v31 = v107;
      v42(v37, v21, v13);
    }
    else
    {

      v42 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
      v42(v117, v21, v13);
    }
    sub_24A01ED78();
    swift_allocObject();
    v49 = sub_24A01ED6C();
    v50 = v13;
    v51 = *(void (**)(char *, uint64_t))(v14 + 8);
    v51(v21, v50);
    v120[3] = (uint64_t)&type metadata for VUGallery.TokenEmbeddingPersonalizationType;
    LOBYTE(v120[0]) = v116;
    LOBYTE(v121) = 1;
    v52 = v119;
    v53 = sub_249FE4B50((uint64_t)v120, (unsigned __int8 *)&v121);
    v119 = v52;
    if (v52)
    {
      sub_249F92438(v108, v109);
      swift_release();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v120);
      return;
    }
    v54 = (void *)v53;
    v102 = v42;
    v116 = v50;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v120);
    v55 = objc_msgSend(v54, sel_modelDescription);
    v56 = objc_msgSend(v55, sel_inputDescriptionsByName);

    sub_249F990DC(0, &qword_2578FFCA8);
    v57 = sub_24A01EDFC();

    if (!*(_QWORD *)(v57 + 16) || (v58 = sub_249F8B0F8(0xD000000000000011, 0x800000024A021CF0), (v59 & 1) == 0))
    {
LABEL_44:
      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_45;
    }
    v103 = v51;
    v107 = v31;
    v60 = *(id *)(*(_QWORD *)(v57 + 56) + 8 * v58);
    swift_bridgeObjectRelease();
    v61 = objc_msgSend(v60, sel_multiArrayConstraint);

    if (!v61)
    {
LABEL_45:
      __break(1u);
      return;
    }
    v62 = objc_msgSend(v61, sel_shape);

    sub_249F990DC(0, (unint64_t *)&qword_2544CAD40);
    v63 = sub_24A01EF88();

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578FF748);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24A0208B0;
    v65 = v108;
    *(_QWORD *)(inited + 32) = v108;
    v66 = v109;
    *(_QWORD *)(inited + 40) = v109;
    v67 = objc_allocWithZone(MEMORY[0x24BDBFFF0]);
    sub_249F93CCC(v65, v66);
    v68 = swift_bridgeObjectRetain();
    v69 = v119;
    v70 = sub_249FA3438(v68, 65568);
    v119 = v69;
    if (v69)
    {
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_release();

      swift_bridgeObjectRelease();
      sub_249F92438(v65, v66);
      return;
    }
    v71 = v70;
    v101 = inited + 32;
    if (v63 >> 62)
    {
      swift_bridgeObjectRetain();
      v100 = sub_24A01F3CC();
      swift_bridgeObjectRelease();
      v73 = v100 - 2;
      if (!__OFSUB__(v100, 2))
      {
LABEL_23:
        if ((v63 & 0xC000000000000001) == 0)
        {
          if ((v73 & 0x8000000000000000) != 0)
          {
            __break(1u);
          }
          else if (v73 < *(_QWORD *)((v63 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            v74 = *(id *)(v63 + 8 * v73 + 32);
            goto LABEL_27;
          }
          __break(1u);
          goto LABEL_44;
        }
LABEL_41:
        v74 = (id)MEMORY[0x24BD071F4](v73, v63);
LABEL_27:
        v75 = v74;
        v76 = v113 & 1;
        v77 = objc_msgSend(v74, sel_integerValue, v101);

        MEMORY[0x24BDAC7A8](v78);
        *(&v101 - 2) = (uint64_t)v77;
        *(&v101 - 1) = inited;
        v79 = v119;
        sub_24A01F0B4();
        swift_bridgeObjectRelease();
        swift_setDeallocating();
        swift_arrayDestroy();
        sub_249FEC2B4(v114, v106, (uint64_t)v71, v115, v76, v54);
        v119 = v79;
        if (v79)
        {
          swift_release();

          sub_249F92438(v108, v109);
        }
        else
        {
          v114 = (id *)v71;
          v115 = v49;
          v80 = v107;
          v81 = sub_24A01ED90();
          v82 = sub_24A01F0CC();
          v118 = v81;
          v83 = v54;
          if (os_log_type_enabled(v81, v82))
          {
            v84 = swift_slowAlloc();
            v85 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v84 = 134218242;
            v120[0] = v106;
            sub_24A01F1F8();
            *(_WORD *)(v84 + 12) = 2112;
            v120[0] = (uint64_t)v80;
            v86 = v80;
            sub_24A01F1F8();
            *v85 = v80;

            _os_log_impl(&dword_249F70000, v118, v82, "Personalizing embedding layer at position %ld for %@", (uint8_t *)v84, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF530);
            swift_arrayDestroy();
            MEMORY[0x24BD07950](v85, -1, -1);
            MEMORY[0x24BD07950](v84, -1, -1);
          }
          else
          {

          }
          v87 = v109;
          v88 = v103;

          v89 = sub_24A01ED30();
          v90 = v105;
          sub_24A01ED60();
          v91 = sub_24A01F168();
          if ((sub_24A01F1E0() & 1) != 0)
          {
            swift_retain();
            v92 = v110;
            sub_24A01ED84();
            swift_release();
            v94 = v111;
            v93 = v112;
            if ((*(unsigned int (**)(char *, uint64_t))(v111 + 88))(v92, v112) == *MEMORY[0x24BEE7810])
            {
              v95 = "[Error] Interval already ended";
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v94 + 8))(v92, v93);
              v95 = "";
            }
            v97 = v116;
            v96 = v117;
            v102(v117, v90, v116);
            v98 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v98 = 0;
            v99 = sub_24A01ED18();
            _os_signpost_emit_with_name_impl(&dword_249F70000, v89, v91, v99, "personalizeEmbeddingLayer", v95, v98, 2u);
            MEMORY[0x24BD07950](v98, -1, -1);

            sub_249F92438(v108, v109);
            v88(v90, v97);
            swift_release();
            v88(v96, v97);
          }
          else
          {
            sub_249F92438(v108, v87);

            v88(v90, v116);
            swift_release();
          }
        }
        return;
      }
    }
    else
    {
      v72 = *(_QWORD *)((v63 & 0xFFFFFFFFFFFFF8) + 0x10);
      v73 = v72 - 2;
      if (!__OFSUB__(v72, 2))
        goto LABEL_23;
    }
    __break(1u);
    goto LABEL_41;
  }
  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {
    sub_249F92438(v29, v30);
    goto LABEL_2;
  }
  v43 = sub_24A01ED90();
  v44 = sub_24A01F0CC();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = swift_slowAlloc();
    v120[0] = v46;
    *(_DWORD *)v45 = 136315138;
    LOBYTE(v121) = 2;
    v47 = sub_24A01EE74();
    v121 = sub_249F8AAE8(v47, v48, v120);
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_249F70000, v43, v44, "Skipping personalization for entity of type %s", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD07950](v46, -1, -1);
    MEMORY[0x24BD07950](v45, -1, -1);
  }
  sub_249F92438(v29, v30);

}

uint64_t sub_249FF093C(_QWORD *a1)
{
  return sub_249FF0DF4(a1) & 1;
}

unint64_t sub_249FF0954()
{
  unint64_t result;

  result = qword_2578FFCD0;
  if (!qword_2578FFCD0)
  {
    result = MEMORY[0x24BD078A8](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_2578FFCD0);
  }
  return result;
}

unint64_t sub_249FF099C()
{
  unint64_t result;

  result = qword_2578FFCD8;
  if (!qword_2578FFCD8)
  {
    result = MEMORY[0x24BD078A8](&protocol conformance descriptor for VUGallery.TokenEmbeddingType, &type metadata for VUGallery.TokenEmbeddingType);
    atomic_store(result, (unint64_t *)&qword_2578FFCD8);
  }
  return result;
}

unint64_t sub_249FF09E4()
{
  unint64_t result;

  result = qword_2578FFCE0;
  if (!qword_2578FFCE0)
  {
    result = MEMORY[0x24BD078A8](&protocol conformance descriptor for VUGallery.TokenEmbeddingPersonalizationType, &type metadata for VUGallery.TokenEmbeddingPersonalizationType);
    atomic_store(result, (unint64_t *)&qword_2578FFCE0);
  }
  return result;
}

uint64_t _s18TokenEmbeddingTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249FF0A74 + 4 * byte_24A0212F3[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_249FF0AA8 + 4 * byte_24A0212EE[v4]))();
}

uint64_t sub_249FF0AA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249FF0AB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249FF0AB8);
  return result;
}

uint64_t sub_249FF0AC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249FF0ACCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_249FF0AD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249FF0AD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VUGallery.TokenEmbeddingType()
{
  return &type metadata for VUGallery.TokenEmbeddingType;
}

uint64_t _s33TokenEmbeddingPersonalizationTypeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_249FF0B40 + 4 * byte_24A0212FD[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_249FF0B74 + 4 * byte_24A0212F8[v4]))();
}

uint64_t sub_249FF0B74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_249FF0B7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x249FF0B84);
  return result;
}

uint64_t sub_249FF0B90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x249FF0B98);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_249FF0B9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_249FF0BA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VUGallery.TokenEmbeddingPersonalizationType()
{
  return &type metadata for VUGallery.TokenEmbeddingPersonalizationType;
}

uint64_t sub_249FF0BC0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_249FF0BE4()
{
  return swift_deallocObject();
}

void sub_249FF0BF4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_249FED1A4(a1, a2, a3, *(void **)(v3 + 16), *(_QWORD *)(v3 + 24), *(double **)(v3 + 32), *(uint8_t **)(v3 + 40), *(id **)(v3 + 48), *(_QWORD *)(v3 + 56), *(id **)(v3 + 64), *(_QWORD *)(v3 + 72), *(_BYTE *)(v3 + 80), *(_QWORD *)(v3 + 88));
}

void *sub_249FF0C3C(void *__src, uint64_t a2)
{
  uint64_t v2;

  if (__src)
    return memmove(*(void **)(v2 + 16), __src, a2 - (_QWORD)__src);
  __break(1u);
  return __src;
}

_BYTE *sub_249FF0C58@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void sub_249FF0CC4()
{
  uint64_t *v0;

  sub_249FD677C(v0[2], v0[3], v0[4]);
}

void sub_249FF0CE0(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_249FD530C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

void sub_249FF0CF8()
{
  uint64_t v0;

  sub_249FD5624(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
}

void sub_249FF0D18(uint64_t a1, int a2)
{
  uint64_t v2;

  sub_249FF7AE8(a1, a2, *(id *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_249FF0D34()
{
  swift_release();
  return swift_deallocObject();
}

void sub_249FF0D58()
{
  uint64_t v0;

  sub_249FD4E00(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_249FF0D60()
{
  return swift_deallocObject();
}

void sub_249FF0D70(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_249FD473C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_249FF0D88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return sub_249FE7BF0(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_249FF0DA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_249FE82F8(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), a1);
}

uint64_t sub_249FF0DC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_249FE837C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_249FF0DDC(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_249FDBA58(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_249FF0DF4(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_24A01F45C() & 1;
}

void sub_249FF0E48(unint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_249FD42D0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_249FF0E60(void *a1)
{
  uint64_t v1;

  return sub_249FE7424(a1, *(unint64_t **)(v1 + 16));
}

void sub_249FF0E68(uint64_t a1, int a2)
{
  sub_249FF0D18(a1, a2);
}

void sub_249FF0E80()
{
  sub_249FF0CF8();
}

void sub_249FF0E94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_249FEFC1C(a1, a2, a3);
}

void sub_249FF0EAC(uint64_t a1@<X8>)
{
  sub_249FF0CE0(a1);
}

void sub_249FF0EC0(unint64_t *a1@<X8>)
{
  sub_249FF0E48(a1);
}

uint64_t sub_249FF0ED4@<X0>(uint64_t *a1@<X8>)
{
  return sub_249F93BDC(a1);
}

uint64_t sub_249FF0EE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_24A01F360();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_249F93A3C(i, (uint64_t)v5);
    type metadata accessor for VUIndexTag();
    if (!swift_dynamicCast())
      break;
    sub_24A01F33C();
    sub_24A01F36C();
    sub_24A01F378();
    sub_24A01F348();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

uint64_t sub_249FF0FE0(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  sub_249F8CD90(0, v2, 0);
  v3 = v9;
  if (v2)
  {
    v4 = (unint64_t *)(a1 + 40);
    while (1)
    {
      sub_249F93CCC(*(v4 - 1), *v4);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CA278);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249F8CD90(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v9;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_249F8CD90(v5 > 1, v6 + 1, 1);
        v3 = v9;
      }
      v4 += 2;
      *(_QWORD *)(v3 + 16) = v6 + 1;
      *(_OWORD *)(v3 + 16 * v6 + 32) = v8;
      if (!--v2)
        return v3;
    }
    swift_release();
    sub_249F92438(0, 0xF000000000000000);
    return 0;
  }
  return v3;
}

uint64_t sub_249FF1130(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_249F8CD00(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249F8CD00(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_249F8CD00(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_249F989B0(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_249FF1254(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_249F8CDF4(0, v1, 0);
    v2 = v9;
    v4 = (unint64_t *)(a1 + 40);
    do
    {
      sub_249F93CE0(*(v4 - 1), *v4);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CA278);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249F8CDF4(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_249F8CDF4(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 2;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      *(_OWORD *)(v2 + 16 * v6 + 32) = v8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_249FF1380(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
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
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  uint64_t v31;
  char v32;
  char v33;
  unint64_t v34;
  unsigned __int8 *v35;
  char *v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  unsigned __int8 *v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  unsigned __int8 *v46;
  unsigned int v47;
  uint64_t v48;
  char v49;
  char v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  char *v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t);
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;

  v2 = v1;
  v4 = sub_24A01EAA8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v71 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v67 - v8;
  v10 = sub_24A01ECA0();
  v11 = *(_QWORD *)(v10 - 8);
  v72 = v10;
  v73 = v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v67 - v15;
  v17 = v1 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_logger;
  sub_24A01ED9C();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore__identifiersMapping) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_secondaryIdentifiers) = MEMORY[0x24BEE4AF8];
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v83 = a1;
  v18(v9, (uint64_t)a1, v4);
  v19 = v74;
  sub_24A01EC7C();
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v83, v4);
    v20 = sub_24A01EDA8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v17, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for VUVectorSearchStore();
    swift_deallocPartialClassInstance();
    return v2;
  }
  v69 = v18;
  v70 = v5;
  v67 = v14;
  v74 = v4;
  v21 = v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_vdbConfig;
  v22 = v72;
  (*(void (**)(uint64_t, char *, uint64_t))(v73 + 32))(v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_vdbConfig, v16, v72);
  v79 = sub_24A01EC88();
  v80 = v23;
  v77 = 46;
  v78 = 0xE100000000000000;
  v75 = 0;
  v76 = 0xE000000000000000;
  sub_249FF79F0();
  sub_249FF7A34();
  sub_24A01F090();
  swift_bridgeObjectRelease();
  result = v81;
  v25 = HIBYTE(v82) & 0xF;
  v26 = v81 & 0xFFFFFFFFFFFFLL;
  if ((v82 & 0x2000000000000000) != 0)
    v27 = HIBYTE(v82) & 0xF;
  else
    v27 = v81 & 0xFFFFFFFFFFFFLL;
  v28 = v22;
  if (!v27)
  {
    v68 = 0;
    swift_bridgeObjectRelease();
LABEL_59:
    v36 = v67;
    goto LABEL_60;
  }
  if ((v82 & 0x1000000000000000) != 0)
  {
    v68 = 0;
    v31 = (uint64_t)sub_249FF4170(v81, v82, 10);
    v50 = v49;
    swift_bridgeObjectRelease();
    if ((v50 & 1) == 0)
    {
      v29 = v70;
      v36 = v67;
      goto LABEL_48;
    }
    goto LABEL_59;
  }
  if ((v82 & 0x2000000000000000) == 0)
  {
    v29 = v70;
    if ((v81 & 0x1000000000000000) != 0)
      v30 = (unsigned __int8 *)((v82 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v30 = (unsigned __int8 *)sub_24A01F330();
    v31 = (uint64_t)sub_249FF4334(v30, v26, 10);
    v68 = 0;
    v33 = v32 & 1;
    goto LABEL_46;
  }
  v79 = v81;
  v80 = v82 & 0xFFFFFFFFFFFFFFLL;
  v29 = v70;
  v68 = 0;
  if (v81 == 43)
  {
    if (!v25)
      goto LABEL_73;
    if (v25 == 1 || (BYTE1(v81) - 48) > 9u)
      goto LABEL_33;
    v31 = (BYTE1(v81) - 48);
    if (v25 != 2)
    {
      if ((BYTE2(v81) - 48) > 9u)
        goto LABEL_33;
      v31 = 10 * (BYTE1(v81) - 48) + (BYTE2(v81) - 48);
      v34 = v25 - 3;
      if (v34)
      {
        v35 = (unsigned __int8 *)&v79 + 3;
        v36 = v67;
        while (1)
        {
          v37 = *v35 - 48;
          if (v37 > 9)
            goto LABEL_55;
          v38 = 10 * v31;
          if ((unsigned __int128)(v31 * (__int128)10) >> 64 != (10 * v31) >> 63)
            goto LABEL_55;
          v31 = v38 + v37;
          if (__OFADD__(v38, v37))
            goto LABEL_55;
          v33 = 0;
          ++v35;
          if (!--v34)
            goto LABEL_47;
        }
      }
    }
LABEL_45:
    v33 = 0;
    goto LABEL_46;
  }
  if (v81 != 45)
  {
    if (!v25 || (v81 - 48) > 9u)
      goto LABEL_33;
    v31 = (v81 - 48);
    if (v25 != 1)
    {
      if ((BYTE1(v81) - 48) > 9u)
        goto LABEL_33;
      v31 = 10 * (v81 - 48) + (BYTE1(v81) - 48);
      v39 = v25 - 2;
      if (v39)
      {
        v40 = (unsigned __int8 *)&v79 + 2;
        v36 = v67;
        while (1)
        {
          v41 = *v40 - 48;
          if (v41 > 9)
            goto LABEL_55;
          v42 = 10 * v31;
          if ((unsigned __int128)(v31 * (__int128)10) >> 64 != (10 * v31) >> 63)
            goto LABEL_55;
          v31 = v42 + v41;
          if (__OFADD__(v42, v41))
            goto LABEL_55;
          v33 = 0;
          ++v40;
          if (!--v39)
            goto LABEL_47;
        }
      }
    }
    goto LABEL_45;
  }
  if (v25)
  {
    if (v25 != 1 && (BYTE1(v81) - 48) <= 9u)
    {
      if (v25 == 2)
      {
        v33 = 0;
        v31 = -(uint64_t)(BYTE1(v81) - 48);
LABEL_46:
        v36 = v67;
        goto LABEL_47;
      }
      if ((BYTE2(v81) - 48) <= 9u)
      {
        v31 = -10 * (BYTE1(v81) - 48) - (BYTE2(v81) - 48);
        v43 = v25 - 3;
        if (!v43)
          goto LABEL_45;
        v46 = (unsigned __int8 *)&v79 + 3;
        v36 = v67;
        while (1)
        {
          v47 = *v46 - 48;
          if (v47 > 9)
            break;
          v48 = 10 * v31;
          if ((unsigned __int128)(v31 * (__int128)10) >> 64 != (10 * v31) >> 63)
            break;
          v31 = v48 - v47;
          if (__OFSUB__(v48, v47))
            break;
          v33 = 0;
          ++v46;
          if (!--v43)
            goto LABEL_47;
        }
LABEL_55:
        v31 = 0;
        v33 = 1;
LABEL_47:
        swift_bridgeObjectRelease();
        if ((v33 & 1) == 0)
        {
LABEL_48:
          *(_QWORD *)(v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_embeddingRevision) = v31;
          v44 = v73;
          v45 = v69;
LABEL_66:
          (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v36, v21, v28);
          sub_24A01EC70();
          swift_allocObject();
          *(_QWORD *)(v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_vdbClient) = sub_24A01EC40();
          v57 = v71;
          v58 = v74;
          v45(v71, (uint64_t)v83, v74);
          swift_retain_n();
          v59 = sub_24A01ED90();
          v60 = sub_24A01F0CC();
          if (os_log_type_enabled(v59, v60))
          {
            v61 = swift_slowAlloc();
            v73 = swift_slowAlloc();
            v81 = v73;
            *(_DWORD *)v61 = 136315394;
            sub_249FA2B24(&qword_2578FF930, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
            v62 = sub_24A01F444();
            v79 = sub_249F8AAE8(v62, v63, &v81);
            sub_24A01F1F8();
            swift_bridgeObjectRelease();
            v64 = *(void (**)(char *, uint64_t))(v29 + 8);
            v64(v57, v74);
            *(_WORD *)(v61 + 12) = 2048;
            v65 = *(_QWORD *)(v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_embeddingRevision);
            swift_release();
            v79 = v65;
            sub_24A01F1F8();
            swift_release();
            _os_log_impl(&dword_249F70000, v59, v60, "Initialized VectorDB client at path %s with revision %ld", (uint8_t *)v61, 0x16u);
            v66 = v73;
            swift_arrayDestroy();
            MEMORY[0x24BD07950](v66, -1, -1);
            v58 = v74;
            MEMORY[0x24BD07950](v61, -1, -1);

          }
          else
          {

            swift_release();
            v64 = *(void (**)(char *, uint64_t))(v29 + 8);
            v64(v57, v58);
            swift_release();
          }
          sub_24A01EC58();
          v64(v83, v58);
          return v2;
        }
LABEL_60:
        v81 = sub_24A01EA24();
        v82 = v51;
        v79 = 3425357;
        v80 = 0xE300000000000000;
        sub_249F8AAA4();
        v52 = sub_24A01F210();
        swift_bridgeObjectRelease();
        if ((v52 & 1) != 0)
        {
          v53 = OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_embeddingRevision;
          v54 = 4;
        }
        else
        {
          v81 = sub_24A01EA24();
          v82 = v55;
          v79 = 3359821;
          v80 = 0xE300000000000000;
          v56 = sub_24A01F210();
          swift_bridgeObjectRelease();
          v53 = OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_embeddingRevision;
          if ((v56 & 1) != 0)
            v54 = 3;
          else
            v54 = 2;
        }
        *(_QWORD *)(v2 + v53) = v54;
        v45 = v69;
        v29 = v70;
        v44 = v73;
        goto LABEL_66;
      }
    }
LABEL_33:
    v31 = 0;
    v33 = 1;
    goto LABEL_46;
  }
  __break(1u);
LABEL_73:
  __break(1u);
  return result;
}

uint64_t sub_249FF1C44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0;
  sub_24A01EC64();
  v2 = v0 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_vdbConfig;
  v3 = sub_24A01ECA0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  v4 = v1 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_logger;
  v5 = sub_24A01EDA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_249FF1D00()
{
  return type metadata accessor for VUVectorSearchStore();
}

uint64_t type metadata accessor for VUVectorSearchStore()
{
  uint64_t result;

  result = qword_2578FFD60;
  if (!qword_2578FFD60)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_249FF1D44()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24A01ECA0();
  if (v1 <= 0x3F)
  {
    result = sub_24A01EDA8();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_249FF1DF8(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *@<X8>);
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void (*v45)(uint64_t, char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  int v48;
  char v49;
  unint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  char v54;
  unint64_t v55;
  char v56;
  _QWORD *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t result;
  uint64_t v64;
  double Current;
  double v66;
  uint64_t v67;
  int v68;
  _BOOL4 v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  void (*v74)(uint64_t, unint64_t, uint64_t);
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v83;
  _QWORD *v84;
  char v85;
  unint64_t v86;
  uint64_t v87;
  _BOOL8 v88;
  uint64_t v89;
  char v90;
  unint64_t v91;
  char v92;
  _QWORD *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  double v98;
  uint64_t v100;
  void (*v101)(void);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  char *v106;
  char *v107;
  void *v108;
  _BOOL4 v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(_QWORD *@<X8>);
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(uint64_t, unint64_t, uint64_t);
  _QWORD *v119;
  uint64_t v120[4];

  v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v6);
  v114 = (char *)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24A01EBA4();
  v115 = *(_QWORD *)(v8 - 8);
  v116 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v107 = (char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v106 = (char *)&v100 - v11;
  v12 = sub_24A01ED00();
  v13 = *(void (**)(_QWORD *@<X8>))(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v100 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (_QWORD *)(v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore__identifiersMapping);
  swift_beginAccess();
  if (!*(_QWORD *)(*v16 + 16))
  {
    v113 = (uint64_t)v15;
    v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_vdbClient);
    v64 = sub_24A01EC1C();
    Current = CFAbsoluteTimeGetCurrent();
    if (v64 >= 1)
    {
      v66 = Current;
      v67 = 0;
      v102 = a2;
      v101 = a1;
      v112 = v13;
      v100 = v17;
      v103 = v64;
      v111 = v12;
      while (1)
      {
        v110 = v67 + 256;
        v69 = __OFADD__(v67, 256);
        v109 = v69;
        v108 = (void *)MEMORY[0x24BD07458]();
        v70 = sub_24A01EC28();
        if (!v5)
          break;

        v5 = 0;
LABEL_70:
        objc_autoreleasePoolPop(v108);
        v97 = CFAbsoluteTimeGetCurrent();
        v98 = v97 - v66;
        if (v97 - v66 > 1.0)
          v66 = v97;
        if (v98 > 1.0 && a1 != 0)
        {
          a1();
          v66 = v97;
        }
        v67 = v110;
        v68 = v109;
        if (v110 >= v64)
          v68 = 1;
        if (v68 == 1)
          goto LABEL_3;
      }
      v71 = *(_QWORD *)(v70 + 16);
      if (!v71)
      {
        swift_bridgeObjectRelease();
LABEL_69:
        v64 = v103;
        goto LABEL_70;
      }
      v105 = 0;
      v72 = (*((unsigned __int8 *)v13 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v13 + 80);
      v104 = v70;
      v73 = v70 + v72;
      v74 = (void (*)(uint64_t, unint64_t, uint64_t))*((_QWORD *)v13 + 2);
      v117 = *((_QWORD *)v13 + 9);
      v118 = v74;
      v75 = v113;
      v74(v113, v73, v12);
      while (1)
      {
        v77 = sub_24A01ECE8();
        if (v78)
          break;
LABEL_53:
        (*((void (**)(uint64_t, uint64_t))v13 + 1))(v75, v12);
        v73 += v117;
        if (!--v71)
        {
          swift_bridgeObjectRelease();
          a1 = v101;
          v5 = v105;
          goto LABEL_69;
        }
        v118(v75, v73, v12);
      }
      v79 = v78;
      v80 = v77;
      v81 = sub_24A01ECDC();
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v119 = (_QWORD *)*v16;
      v83 = v119;
      v84 = v16;
      *v16 = 0x8000000000000000;
      v86 = sub_249F8B27C(v81);
      v87 = v83[2];
      v88 = (v85 & 1) == 0;
      v89 = v87 + v88;
      if (__OFADD__(v87, v88))
      {
LABEL_78:
        __break(1u);
LABEL_79:
        __break(1u);
        goto LABEL_80;
      }
      v90 = v85;
      if (v83[3] < v89)
      {
        sub_249FB93B8(v89, isUniquelyReferenced_nonNull_native);
        v91 = sub_249F8B27C(v81);
        if ((v90 & 1) != (v92 & 1))
          goto LABEL_83;
        v86 = v91;
        v93 = v119;
        if ((v90 & 1) == 0)
          goto LABEL_63;
LABEL_51:
        v76 = (uint64_t *)(v93[7] + 16 * v86);
        swift_bridgeObjectRelease();
        *v76 = v80;
        v76[1] = v79;
LABEL_52:
        v16 = v84;
        *v84 = v93;
        swift_bridgeObjectRelease();
        swift_endAccess();
        v12 = v111;
        v13 = v112;
        v75 = v113;
        goto LABEL_53;
      }
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v93 = v119;
        if ((v85 & 1) != 0)
          goto LABEL_51;
      }
      else
      {
        sub_249FC1710();
        v93 = v119;
        if ((v90 & 1) != 0)
          goto LABEL_51;
      }
LABEL_63:
      v93[(v86 >> 6) + 8] |= 1 << v86;
      *(_QWORD *)(v93[6] + 8 * v86) = v81;
      v94 = (uint64_t *)(v93[7] + 16 * v86);
      *v94 = v80;
      v94[1] = v79;
      v95 = v93[2];
      v27 = __OFADD__(v95, 1);
      v96 = v95 + 1;
      if (v27)
        goto LABEL_79;
      v93[2] = v96;
      goto LABEL_52;
    }
  }
LABEL_3:
  v18 = *v16;
  v19 = *(_QWORD *)(*v16 + 64);
  v117 = *v16 + 64;
  v20 = 1 << *(_BYTE *)(v18 + 32);
  v21 = -1;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  v22 = v21 & v19;
  v118 = (void (*)(uint64_t, unint64_t, uint64_t))((unint64_t)(v20 + 63) >> 6);
  v23 = swift_bridgeObjectRetain();
  v112 = 0;
  v24 = 0;
  v113 = MEMORY[0x24BEE4B00];
  while (v22)
  {
    v25 = __clz(__rbit64(v22));
    v22 &= v22 - 1;
    v26 = v25 | (v24 << 6);
LABEL_20:
    v31 = *(_QWORD *)(*(_QWORD *)(v18 + 48) + 8 * v26);
    v32 = (uint64_t *)(*(_QWORD *)(v18 + 56) + 16 * v26);
    v33 = *v32;
    v34 = v32[1];
    v120[0] = 47;
    v120[1] = 0xE100000000000000;
    MEMORY[0x24BDAC7A8](v23);
    *(&v100 - 2) = (uint64_t)v120;
    swift_bridgeObjectRetain_n();
    v35 = (_QWORD *)sub_249FEE8E4(0x7FFFFFFFFFFFFFFFLL, 1, sub_249FF790C, (uint64_t)(&v100 - 4), v33, v34);
    swift_bridgeObjectRelease();
    if (v35[2])
    {
      v36 = v35[4];
      v37 = v35[5];
      v39 = v35[6];
      v38 = v35[7];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v40 = v37;
      v41 = (uint64_t)v114;
      MEMORY[0x24BD06D50](v36, v40, v39, v38);
      swift_bridgeObjectRelease();
      sub_24A01EB68();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v115 + 48))(v41, 1, v116) == 1)
      {
        v23 = sub_249FF7928(v41);
      }
      else
      {
        v43 = v115;
        v42 = v116;
        v44 = v106;
        (*(void (**)(char *, uint64_t, uint64_t))(v115 + 32))(v106, v41, v116);
        v45 = *(void (**)(uint64_t, char *, uint64_t))(v43 + 16);
        v46 = (uint64_t)v107;
        v45((uint64_t)v107, v44, v42);
        sub_249FC7728((uint64_t)v112);
        v47 = v113;
        v48 = swift_isUniquelyReferenced_nonNull_native();
        v120[0] = v47;
        v50 = sub_249F8B20C(v46);
        v51 = *(_QWORD *)(v47 + 16);
        v52 = (v49 & 1) == 0;
        v53 = v51 + v52;
        if (__OFADD__(v51, v52))
          goto LABEL_81;
        v54 = v49;
        if (*(_QWORD *)(v47 + 24) >= v53)
        {
          if ((v48 & 1) == 0)
          {
            sub_249FC14E0();
            v113 = v120[0];
          }
        }
        else
        {
          sub_249FB9024(v53, v48);
          v113 = v120[0];
          v55 = sub_249F8B20C((uint64_t)v107);
          if ((v54 & 1) != (v56 & 1))
            goto LABEL_84;
          v50 = v55;
        }
        swift_bridgeObjectRelease();
        if ((v54 & 1) != 0)
        {
          swift_bridgeObjectRetain();
        }
        else
        {
          v57 = (_QWORD *)v113;
          *(_QWORD *)(v113 + 8 * (v50 >> 6) + 64) |= 1 << v50;
          v58 = v57[6] + *(_QWORD *)(v115 + 72) * v50;
          swift_bridgeObjectRetain();
          v45(v58, v107, v116);
          *(_QWORD *)(v57[7] + 8 * v50) = MEMORY[0x24BEE4B08];
          v59 = v57[2];
          v27 = __OFADD__(v59, 1);
          v60 = v59 + 1;
          if (v27)
            goto LABEL_82;
          v57[2] = v60;
        }
        swift_bridgeObjectRelease();
        sub_249F8BD0C(v120, v31);
        v61 = v116;
        v62 = *(void (**)(uint64_t, uint64_t))(v115 + 8);
        v62((uint64_t)v107, v116);
        v23 = ((uint64_t (*)(char *, uint64_t))v62)(v106, v61);
        v112 = sub_249FCEB3C;
      }
    }
    else
    {
      v23 = swift_bridgeObjectRelease();
    }
  }
  v27 = __OFADD__(v24++, 1);
  if (v27)
  {
    __break(1u);
    goto LABEL_78;
  }
  v28 = v113;
  if (v24 >= (uint64_t)v118)
    goto LABEL_38;
  v29 = *(_QWORD *)(v117 + 8 * v24);
  if (v29)
  {
LABEL_19:
    v22 = (v29 - 1) & v29;
    v26 = __clz(__rbit64(v29)) + (v24 << 6);
    goto LABEL_20;
  }
  v30 = v24 + 1;
  if (v24 + 1 >= (uint64_t)v118)
    goto LABEL_38;
  v29 = *(_QWORD *)(v117 + 8 * v30);
  if (v29)
    goto LABEL_18;
  v30 = v24 + 2;
  if (v24 + 2 >= (uint64_t)v118)
    goto LABEL_38;
  v29 = *(_QWORD *)(v117 + 8 * v30);
  if (v29)
    goto LABEL_18;
  v30 = v24 + 3;
  if (v24 + 3 >= (uint64_t)v118)
  {
LABEL_38:
    swift_release();
    sub_249FC7728((uint64_t)v112);
    return v28;
  }
  v29 = *(_QWORD *)(v117 + 8 * v30);
  if (v29)
  {
LABEL_18:
    v24 = v30;
    goto LABEL_19;
  }
  while (1)
  {
    v24 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v24 >= (uint64_t)v118)
      goto LABEL_38;
    v29 = *(_QWORD *)(v117 + 8 * v24);
    ++v30;
    if (v29)
      goto LABEL_19;
  }
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  sub_24A01F48C();
  __break(1u);
LABEL_84:
  result = sub_24A01F48C();
  __break(1u);
  return result;
}

uint64_t sub_249FF26BC(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(_QWORD, uint64_t, uint64_t), uint64_t a12)
{
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t result;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  _BYTE *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t);
  void (*v63)(char *, unint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;

  v57 = a3;
  v58 = a5;
  v14 = sub_24A01ED00();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v53 - v19;
  result = sub_24A01EC34();
  v22 = v12;
  if (v12)
    return result;
  v59 = v18;
  v60 = v15;
  v61 = v14;
  v23 = *(_QWORD *)(result + 16);
  v24 = MEMORY[0x24BEE4AF8];
  if (v23)
  {
    v54 = 0;
    v55 = a1;
    v65 = MEMORY[0x24BEE4AF8];
    v25 = result;
    sub_249F8C9C8(0, v23, 0);
    v26 = v60;
    v27 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v56 = v25;
    v28 = v25 + v27;
    v29 = *(_QWORD *)(v60 + 72);
    v63 = *(void (**)(char *, unint64_t, uint64_t))(v60 + 16);
    v64 = v29;
    v30 = v25 + v27;
    do
    {
      v31 = v61;
      v63(v20, v30, v61);
      v32 = sub_24A01ECDC();
      v62 = *(void (**)(char *, uint64_t))(v26 + 8);
      v62(v20, v31);
      v24 = v65;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249F8C9C8(0, *(_QWORD *)(v24 + 16) + 1, 1);
        v24 = v65;
      }
      v34 = *(_QWORD *)(v24 + 16);
      v33 = *(_QWORD *)(v24 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_249F8C9C8(v33 > 1, v34 + 1, 1);
        v24 = v65;
      }
      *(_QWORD *)(v24 + 16) = v34 + 1;
      *(_QWORD *)(v24 + 8 * v34 + 32) = v32;
      v30 += v64;
      --v23;
      v26 = v60;
    }
    while (v23);
    v35 = *(_QWORD *)(v56 + 16);
    v36 = v61;
    v37 = v59;
    if (v35)
    {
      swift_bridgeObjectRetain();
      v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v63(v37, v28, v36);
        v39 = (_QWORD *)sub_24A01ECF4();
        if (v39[2])
        {
          v40 = v39[4];
          v41 = v39[5];
          sub_249F93CE0(v40, v41);
          swift_bridgeObjectRelease();
          v62(v37, v36);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v38 = sub_249F8A534(0, v38[2] + 1, 1, v38);
          v43 = v38[2];
          v42 = v38[3];
          if (v43 >= v42 >> 1)
            v38 = sub_249F8A534((_QWORD *)(v42 > 1), v43 + 1, 1, v38);
          v38[2] = v43 + 1;
          v44 = &v38[2 * v43];
          v44[4] = v40;
          v44[5] = v41;
          v37 = v59;
        }
        else
        {
          swift_bridgeObjectRelease();
          v62(v37, v36);
        }
        v28 += v64;
        --v35;
      }
      while (v35);
      swift_bridgeObjectRelease_n();
      v22 = v54;
      v45 = v58;
      goto LABEL_23;
    }
    v22 = v54;
    v45 = v58;
  }
  else
  {
    v45 = v58;
  }
  swift_bridgeObjectRelease();
  v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_23:
  if (v38[2] == *(_QWORD *)(v24 + 16))
  {
    v46 = sub_249FF1254((uint64_t)v38);
    swift_bridgeObjectRelease();
    v47 = sub_249FF6F70(v24, v46, v45, a11, a12);
    if (v22)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    else
    {
      v52 = v47;
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *v57 = v52 & 1;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v48 = sub_24A01ED90();
    v49 = sub_24A01F0E4();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      _os_log_impl(&dword_249F70000, v48, v49, "Vector store is missing embedding!", v50, 2u);
      MEMORY[0x24BD07950](v50, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v51 = 5;
    return swift_willThrow();
  }
  return result;
}

void sub_249FF2B40(unsigned int a1, uint64_t a2, unsigned int a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(_QWORD, uint64_t, uint64_t), uint64_t a11)
{
  sub_249FF7368(a1, a2, a3, a4, a5 & 1, a6, a7, a8, a10, a11);
}

_QWORD *sub_249FF2B74(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD10);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_249FF2BD8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_24A01EF10();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x24BD06DBC](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void *sub_249FF2C50()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2E8);
  v2 = *v0;
  v3 = sub_24A01F2C4();
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

void *sub_249FF2DE4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_24A01EBA4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDA0);
  v6 = *v0;
  v7 = sub_24A01F2C4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_249FF3008()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = type metadata accessor for VUStreamingGallery.Label(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD98);
  v6 = *v0;
  v7 = sub_24A01F2C4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v8;
    return result;
  }
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    sub_249FF7968(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5);
    result = (void *)sub_249FF79AC((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
    goto LABEL_28;
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_249FF3200()
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
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD90);
  v2 = *v0;
  v3 = sub_24A01F2C4();
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
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v18 = *(_QWORD *)v17;
    LOBYTE(v17) = *(_BYTE *)(v17 + 8);
    v19 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v19 = v18;
    *(_BYTE *)(v19 + 8) = v17;
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

void *sub_249FF33A4()
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
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD80);
  v2 = *v0;
  v3 = sub_24A01F2C4();
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
    v16 = 16 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v18 = *(_WORD *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(_QWORD *)(v4 + 48) + v16;
    *(_WORD *)v20 = v18;
    *(_QWORD *)(v20 + 8) = v19;
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

void *sub_249FF3548()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD88);
  v2 = *v0;
  v3 = sub_24A01F2C4();
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
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
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

uint64_t sub_249FF36D8(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_249FF3858((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_249FF3858((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x24BD07950](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_249FF3858(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  unint64_t v26;
  BOOL v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t *v45;
  int64_t v46;

  v45 = (unint64_t *)result;
  v6 = 0;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v7 = 0;
    v8 = a4 + 56;
    v9 = 1 << *(_BYTE *)(a4 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(a4 + 56);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = a3 + 56;
    while (1)
    {
LABEL_6:
      if (v11)
      {
        v14 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v15 = v14 | (v7 << 6);
      }
      else
      {
        v16 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
          __break(1u);
LABEL_62:
          __break(1u);
          goto LABEL_63;
        }
        if (v16 >= v12)
          goto LABEL_60;
        v17 = *(_QWORD *)(v8 + 8 * v16);
        ++v7;
        if (!v17)
        {
          v7 = v16 + 1;
          if (v16 + 1 >= v12)
            goto LABEL_60;
          v17 = *(_QWORD *)(v8 + 8 * v7);
          if (!v17)
          {
            v7 = v16 + 2;
            if (v16 + 2 >= v12)
              goto LABEL_60;
            v17 = *(_QWORD *)(v8 + 8 * v7);
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v12)
              {
LABEL_60:
                swift_retain();
                return sub_249FF3C18(v45, a2, v6, a3);
              }
              v17 = *(_QWORD *)(v8 + 8 * v18);
              if (!v17)
              {
                while (1)
                {
                  v7 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    break;
                  if (v7 >= v12)
                    goto LABEL_60;
                  v17 = *(_QWORD *)(v8 + 8 * v7);
                  ++v18;
                  if (v17)
                    goto LABEL_21;
                }
LABEL_63:
                __break(1u);
                goto LABEL_64;
              }
              v7 = v18;
            }
          }
        }
LABEL_21:
        v11 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v7 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v15);
      result = sub_24A01F4E0();
      v20 = -1 << *(_BYTE *)(a3 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      v23 = 1 << v21;
      if (((1 << v21) & *(_QWORD *)(v13 + 8 * (v21 >> 6))) != 0)
      {
        v24 = *(_QWORD *)(a3 + 48);
        if (*(_QWORD *)(v24 + 8 * v21) != v19)
        {
          for (i = v21 + 1; ; i = v26 + 1)
          {
            v26 = i & ~v20;
            if (((*(_QWORD *)(v13 + ((v26 >> 3) & 0xFFFFFFFFFFFFF8)) >> v26) & 1) == 0)
              goto LABEL_6;
            if (*(_QWORD *)(v24 + 8 * v26) == v19)
              break;
          }
          v22 = v26 >> 6;
          v23 = 1 << v26;
        }
        v45[v22] |= v23;
        v27 = __OFADD__(v6++, 1);
        if (v27)
          break;
      }
    }
    __break(1u);
  }
  v28 = 0;
  v29 = a3 + 56;
  v30 = 1 << *(_BYTE *)(a3 + 32);
  if (v30 < 64)
    v31 = ~(-1 << v30);
  else
    v31 = -1;
  v32 = v31 & *(_QWORD *)(a3 + 56);
  v46 = (unint64_t)(v30 + 63) >> 6;
  v33 = a4 + 56;
  while (v32)
  {
    v34 = __clz(__rbit64(v32));
    v32 &= v32 - 1;
    v35 = v34 | (v28 << 6);
LABEL_52:
    v39 = *(_QWORD *)(*(_QWORD *)(a3 + 48) + 8 * v35);
    result = sub_24A01F4E0();
    v40 = -1 << *(_BYTE *)(a4 + 32);
    v41 = result & ~v40;
    if (((*(_QWORD *)(v33 + ((v41 >> 3) & 0xFFFFFFFFFFFFF8)) >> v41) & 1) != 0)
    {
      v42 = *(_QWORD *)(a4 + 48);
      if (*(_QWORD *)(v42 + 8 * v41) == v39)
      {
LABEL_57:
        *(unint64_t *)((char *)v45 + ((v35 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v35;
        v27 = __OFADD__(v6++, 1);
        if (v27)
        {
          __break(1u);
          goto LABEL_60;
        }
      }
      else
      {
        v43 = ~v40;
        while (1)
        {
          v41 = (v41 + 1) & v43;
          if (((*(_QWORD *)(v33 + ((v41 >> 3) & 0xFFFFFFFFFFFFF8)) >> v41) & 1) == 0)
            break;
          if (*(_QWORD *)(v42 + 8 * v41) == v39)
            goto LABEL_57;
        }
      }
    }
  }
  v36 = v28 + 1;
  if (__OFADD__(v28, 1))
    goto LABEL_62;
  if (v36 >= v46)
    goto LABEL_60;
  v37 = *(_QWORD *)(v29 + 8 * v36);
  ++v28;
  if (v37)
    goto LABEL_51;
  v28 = v36 + 1;
  if (v36 + 1 >= v46)
    goto LABEL_60;
  v37 = *(_QWORD *)(v29 + 8 * v28);
  if (v37)
    goto LABEL_51;
  v28 = v36 + 2;
  if (v36 + 2 >= v46)
    goto LABEL_60;
  v37 = *(_QWORD *)(v29 + 8 * v28);
  if (v37)
  {
LABEL_51:
    v32 = (v37 - 1) & v37;
    v35 = __clz(__rbit64(v37)) + (v28 << 6);
    goto LABEL_52;
  }
  v38 = v36 + 3;
  if (v38 >= v46)
    goto LABEL_60;
  v37 = *(_QWORD *)(v29 + 8 * v38);
  if (v37)
  {
    v28 = v38;
    goto LABEL_51;
  }
  while (1)
  {
    v28 = v38 + 1;
    if (__OFADD__(v38, 1))
      break;
    if (v28 >= v46)
      goto LABEL_60;
    v37 = *(_QWORD *)(v29 + 8 * v28);
    ++v38;
    if (v37)
      goto LABEL_51;
  }
LABEL_64:
  __break(1u);
  return result;
}

uint64_t sub_249FF3C18(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2E8);
  result = sub_24A01F2DC();
  v9 = result;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = a1[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = a1[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = a1[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = sub_24A01F4E0();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = a1[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = a1[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_249FF3E5C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v8 = sub_24A01EBA4();
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  if (*(_QWORD *)(a4 + 16) == a3)
    return a4;
  v38 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDA0);
  result = sub_24A01F2DC();
  v12 = result;
  v36 = a1;
  v37 = a2;
  if (a2 < 1)
    v14 = 0;
  else
    v14 = *a1;
  v15 = 0;
  v16 = result + 56;
  v17 = v38;
  while (1)
  {
    if (v14)
    {
      v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v19 = v18 | (v15 << 6);
    }
    else
    {
      v20 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_40;
      if (v20 >= v37)
      {
LABEL_37:
        swift_release();
        return v12;
      }
      v21 = v36[v20];
      ++v15;
      if (!v21)
      {
        v15 = v20 + 1;
        if (v20 + 1 >= v37)
          goto LABEL_37;
        v21 = v36[v15];
        if (!v21)
        {
          v15 = v20 + 2;
          if (v20 + 2 >= v37)
            goto LABEL_37;
          v21 = v36[v15];
          if (!v21)
          {
            v22 = v20 + 3;
            if (v22 >= v37)
              goto LABEL_37;
            v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                v15 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v15 >= v37)
                  goto LABEL_37;
                v21 = v36[v15];
                ++v22;
                if (v21)
                  goto LABEL_24;
              }
            }
            v15 = v22;
          }
        }
      }
LABEL_24:
      v14 = (v21 - 1) & v21;
      v19 = __clz(__rbit64(v21)) + (v15 << 6);
    }
    v23 = a4;
    v24 = *(_QWORD *)(a4 + 48);
    v25 = *(_QWORD *)(v17 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v11, v24 + v25 * v19, v8);
    sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24A01EE14();
    v26 = -1 << *(_BYTE *)(v12 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6))) != 0)
    {
      v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v16 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      v17 = v38;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      v17 = v38;
      do
      {
        if (++v28 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v16 + 8 * v28);
      }
      while (v33 == -1);
      v29 = __clz(__rbit64(~v33)) + (v28 << 6);
    }
    *(_QWORD *)(v16 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v17 + 32))(*(_QWORD *)(v12 + 48) + v29 * v25, v11, v8);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      break;
    a4 = v23;
    if (!a3)
      goto LABEL_37;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

unsigned __int8 *sub_249FF415C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_249FF45B0(a1, a2, a3);
}

unsigned __int8 *sub_249FF4170(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = sub_24A01EF28();
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
  v5 = sub_249FF4858();
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
    v7 = (unsigned __int8 *)sub_24A01F330();
  }
LABEL_7:
  v11 = sub_249FF4334(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_249FF4254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int16 v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_24A01EF28();
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
  v5 = sub_249FF4858();
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
    v7 = (unsigned __int8 *)sub_24A01F330();
  }
LABEL_7:
  v11 = (unsigned __int16)sub_249FF45B0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 & 0x1FF;
}

unsigned __int8 *sub_249FF4334(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
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
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
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
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
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
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

unsigned __int8 *sub_249FF45B0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned int v25;
  char v26;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v14 = a2 - 1;
      if (a2 != 1)
      {
        v15 = a3 + 87;
        if (a3 > 10)
        {
          v16 = a3 + 55;
        }
        else
        {
          v15 = 97;
          v16 = 65;
        }
        if (a3 <= 10)
          v17 = a3 + 48;
        else
          v17 = 58;
        if (result)
        {
          LOBYTE(v8) = 0;
          v18 = result + 1;
          do
          {
            v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                v12 = 0;
                v13 = 1;
                if (v19 < 0x61 || v19 >= v15)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v20 = -87;
              }
              else
              {
                v20 = -55;
              }
            }
            else
            {
              v20 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v8 = (v8 * a3) + (v19 + v20);
            if (((v8 >> 8) & 1) != 0)
              goto LABEL_72;
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 8));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v21 = a3 + 87;
        if (a3 > 10)
        {
          v22 = a3 + 55;
        }
        else
        {
          v21 = 97;
          v22 = 65;
        }
        if (a3 <= 10)
          v23 = a3 + 48;
        else
          v23 = 58;
        if (result)
        {
          LOBYTE(v24) = 0;
          do
          {
            v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                v12 = 0;
                v13 = 1;
                if (v25 < 0x61 || v25 >= v21)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v26 = -87;
              }
              else
              {
                v26 = -55;
              }
            }
            else
            {
              v26 = -48;
            }
            if (((v24 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v24 = (v24 * a3) + (v25 + v26);
            if (((v24 >> 8) & 1) != 0)
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          LOBYTE(v8) = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v8 = (v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFFFF00) != 0)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 8));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_249FF4858()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_24A01EF34();
  v4 = sub_249FF48D4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_249FF48D4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_249FF4A18(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_249FF2B74(v9, 0);
      v12 = sub_249FF4B04((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x24BD06D5C](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24BD06D5CLL);
LABEL_9:
      sub_24A01F330();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24BD06D5C]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_249FF4A18(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_249FF2BD8(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_249FF2BD8(a2, a3, a4);
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
    return sub_24A01EEF8();
  }
  __break(1u);
  return result;
}

unint64_t sub_249FF4B04(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
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
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_249FF2BD8(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_24A01EF04();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_24A01F330();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_249FF2BD8(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_24A01EEE0();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_249FF4D14(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v3 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v3 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v3 + 8 * v8);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    result = sub_249FF5A70(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v10));
  }
  v13 = v11 + 4;
  if (v13 >= v7)
    return swift_release();
  v12 = *(_QWORD *)(v3 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_249FF4E74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  int64_t v25;

  v3 = sub_24A01EBA4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v24 - v12;
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v14 = a1 + 56;
  v15 = 1 << *(_BYTE *)(a1 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(a1 + 56);
  v25 = (unint64_t)(v15 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  if (!v17)
    goto LABEL_6;
LABEL_5:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v18 << 6); ; i = __clz(__rbit64(v22)) + (v18 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v13, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v4 + 72) * i, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v13, 1, v3) == 1)
      return swift_release();
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v13, v3);
    sub_249FF5B78((uint64_t)v6, (uint64_t)v10);
    sub_249FF7928((uint64_t)v10);
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (v17)
      goto LABEL_5;
LABEL_6:
    v21 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v21 >= v25)
      goto LABEL_25;
    v22 = *(_QWORD *)(v14 + 8 * v21);
    ++v18;
    if (!v22)
    {
      v18 = v21 + 1;
      if (v21 + 1 >= v25)
        goto LABEL_25;
      v22 = *(_QWORD *)(v14 + 8 * v18);
      if (!v22)
      {
        v18 = v21 + 2;
        if (v21 + 2 >= v25)
          goto LABEL_25;
        v22 = *(_QWORD *)(v14 + 8 * v18);
        if (!v22)
        {
          v18 = v21 + 3;
          if (v21 + 3 >= v25)
            goto LABEL_25;
          v22 = *(_QWORD *)(v14 + 8 * v18);
          if (!v22)
            break;
        }
      }
    }
LABEL_21:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 4;
  if (v23 >= v25)
  {
LABEL_25:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v13, 1, 1, v3);
    return swift_release();
  }
  v22 = *(_QWORD *)(v14 + 8 * v23);
  if (v22)
  {
    v18 = v23;
    goto LABEL_21;
  }
  while (1)
  {
    v18 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v18 >= v25)
      goto LABEL_25;
    v22 = *(_QWORD *)(v14 + 8 * v18);
    ++v23;
    if (v22)
      goto LABEL_21;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_249FF5120(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  size_t v24;
  uint64_t isStackAllocationSafe;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v32[2];
  _QWORD v33[6];

  v2 = a2;
  v33[5] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = 0;
    v6 = a1 + 56;
    v5 = *(_QWORD *)(a1 + 56);
    v7 = -1 << *(_BYTE *)(a1 + 32);
    v32[0] = ~v7;
    if (-v7 < 64)
      v8 = ~(-1 << -(char)v7);
    else
      v8 = -1;
    v9 = v8 & v5;
    v10 = (unint64_t)(63 - v7) >> 6;
    v11 = a2 + 56;
    while (1)
    {
      do
      {
        if (v9)
        {
          v12 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v13 = v12 | (v4 << 6);
        }
        else
        {
          v14 = v4 + 1;
          if (__OFADD__(v4, 1))
          {
            __break(1u);
            goto LABEL_36;
          }
          if (v14 >= v10)
            goto LABEL_33;
          v15 = *(_QWORD *)(v6 + 8 * v14);
          v16 = v4 + 1;
          if (!v15)
          {
            v16 = v4 + 2;
            if (v4 + 2 >= v10)
              goto LABEL_33;
            v15 = *(_QWORD *)(v6 + 8 * v16);
            if (!v15)
            {
              v16 = v4 + 3;
              if (v4 + 3 >= v10)
                goto LABEL_33;
              v15 = *(_QWORD *)(v6 + 8 * v16);
              if (!v15)
              {
                v16 = v4 + 4;
                if (v4 + 4 >= v10)
                  goto LABEL_33;
                v15 = *(_QWORD *)(v6 + 8 * v16);
                if (!v15)
                {
                  v17 = v4 + 5;
                  if (v4 + 5 >= v10)
                  {
LABEL_33:
                    swift_bridgeObjectRetain();
                    sub_249FCA5CC();
                    return v2;
                  }
                  v15 = *(_QWORD *)(v6 + 8 * v17);
                  if (!v15)
                  {
                    while (1)
                    {
                      v16 = v17 + 1;
                      if (__OFADD__(v17, 1))
                        break;
                      if (v16 >= v10)
                        goto LABEL_33;
                      v15 = *(_QWORD *)(v6 + 8 * v16);
                      ++v17;
                      if (v15)
                        goto LABEL_23;
                    }
LABEL_36:
                    __break(1u);
                  }
                  v16 = v4 + 5;
                }
              }
            }
          }
LABEL_23:
          v9 = (v15 - 1) & v15;
          v13 = __clz(__rbit64(v15)) + (v16 << 6);
          v4 = v16;
        }
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v13);
        v19 = sub_24A01F4E0();
        v20 = -1 << *(_BYTE *)(v2 + 32);
        v21 = v19 & ~v20;
      }
      while (((*(_QWORD *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0);
      v22 = *(_QWORD *)(v2 + 48);
      if (*(_QWORD *)(v22 + 8 * v21) == v18)
        break;
      while (1)
      {
        v21 = (v21 + 1) & ~v20;
        if (((*(_QWORD *)(v11 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          break;
        if (*(_QWORD *)(v22 + 8 * v21) == v18)
          goto LABEL_28;
      }
    }
LABEL_28:
    v33[0] = a1;
    v33[1] = v6;
    v33[2] = v32[0];
    v33[3] = v4;
    v33[4] = v9;
    v23 = (unint64_t)(63 - v20) >> 6;
    v24 = 8 * v23;
    isStackAllocationSafe = swift_bridgeObjectRetain();
    if (v23 < 0x81 || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x24BDAC7A8](isStackAllocationSafe);
      v27 = (char *)v32 - v26;
      memcpy((char *)v32 - v26, (const void *)(v2 + 56), v24);
      v28 = sub_249FF5DB4((uint64_t)v27, v23, v2, v21, v33);
      swift_release();
      sub_249FCA5CC();
      return v28;
    }
    else
    {
      v29 = (void *)swift_slowAlloc();
      memcpy(v29, (const void *)(v2 + 56), v24);
      v30 = sub_249FF5DB4((uint64_t)v29, v23, v2, v21, v33);
      swift_release();
      sub_249FCA5CC();
      MEMORY[0x24BD07950](v29, -1, -1);
      return v30;
    }
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_249FF54BC(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, unint64_t, uint64_t);
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t isStackAllocationSafe;
  char v43;
  unint64_t v44;
  size_t v45;
  uint64_t v46;
  void *v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  int64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  unint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24A01EBA4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v55 = (char *)&v49 - v12;
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  v13 = -1 << *(_BYTE *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = ~v13;
  v16 = -v13;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v56 = a1;
  v57 = a1 + 56;
  v18 = a1;
  v19 = a1 + 56;
  v20 = v17 & v14;
  v21 = v15;
  v58 = v15;
  v59 = 0;
  v60 = v17 & v14;
  v54 = (char *)(a2 + 56);
  v22 = v18;
  swift_bridgeObjectRetain();
  v23 = 0;
  v50 = v6;
  v53 = a2;
  v51 = v20;
  v52 = 0;
  if (!v20)
    goto LABEL_8;
LABEL_6:
  v24 = (v20 - 1) & v20;
  v25 = __clz(__rbit64(v20)) | (v23 << 6);
  v26 = v23;
  v27 = v19;
LABEL_7:
  (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, *(_QWORD *)(v22 + 48) + *(_QWORD *)(v8 + 72) * v25, v7);
  v28 = 0;
  while (1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v28, 1, v7);
    v56 = v22;
    v57 = v27;
    v58 = v21;
    v59 = v26;
    v60 = v24;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_249FCA5CC();
      sub_249FF7928((uint64_t)v6);
      return v53;
    }
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v55, v6, v7);
    v32 = v53;
    sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    v33 = sub_24A01EE14();
    v34 = -1 << *(_BYTE *)(v32 + 32);
    v35 = v33 & ~v34;
    if (((*(_QWORD *)&v54[(v35 >> 3) & 0xFFFFFFFFFFFFF8] >> v35) & 1) != 0)
      break;
    v41 = *(void (**)(char *, uint64_t))(v8 + 8);
LABEL_34:
    v41(v55, v7);
    v23 = v59;
    v20 = v60;
    v22 = v56;
    v19 = v57;
    v21 = v58;
    v6 = v50;
    v51 = v60;
    v52 = v59;
    if (v60)
      goto LABEL_6;
LABEL_8:
    v26 = v23 + 1;
    if (__OFADD__(v23, 1))
      __break(1u);
    v27 = v19;
    v29 = (unint64_t)(v21 + 64) >> 6;
    if (v26 >= v29)
      goto LABEL_26;
    v30 = *(_QWORD *)(v19 + 8 * v26);
    if (v30)
      goto LABEL_11;
    v23 += 2;
    if (v26 + 1 >= v29)
      goto LABEL_36;
    v30 = *(_QWORD *)(v19 + 8 * v23);
    if (v30)
      goto LABEL_14;
    if (v26 + 2 >= v29)
    {
LABEL_26:
      v24 = 0;
      v28 = 1;
      v26 = v23;
    }
    else
    {
      v30 = *(_QWORD *)(v19 + 8 * (v26 + 2));
      if (v30)
      {
        v26 += 2;
        goto LABEL_11;
      }
      v23 = v26 + 3;
      if (v26 + 3 >= v29)
      {
        v24 = 0;
        v28 = 1;
        v26 += 2;
      }
      else
      {
        v30 = *(_QWORD *)(v19 + 8 * v23);
        if (v30)
        {
LABEL_14:
          v26 = v23;
LABEL_11:
          v24 = (v30 - 1) & v30;
          v25 = __clz(__rbit64(v30)) + (v26 << 6);
          goto LABEL_7;
        }
        v26 += 4;
        if (v26 >= v29)
          goto LABEL_26;
        v30 = *(_QWORD *)(v19 + 8 * v26);
        if (v30)
          goto LABEL_11;
        v26 = v29 - 1;
        v31 = v52 + 6;
        while (v29 != v31)
        {
          v30 = *(_QWORD *)(v19 + 8 * v31++);
          if (v30)
          {
            v26 = v31 - 1;
            goto LABEL_11;
          }
        }
LABEL_36:
        v24 = 0;
        v28 = 1;
      }
    }
  }
  v36 = v32;
  v37 = ~v34;
  v38 = *(_QWORD *)(v8 + 72);
  v39 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  while (1)
  {
    v39(v11, *(_QWORD *)(v36 + 48) + v38 * v35, v7);
    sub_249FA2B24(&qword_2578FF760, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
    v40 = sub_24A01EE38();
    v41 = *(void (**)(char *, uint64_t))(v8 + 8);
    v41(v11, v7);
    if ((v40 & 1) != 0)
      break;
    v35 = (v35 + 1) & v37;
    if (((*(_QWORD *)&v54[(v35 >> 3) & 0xFFFFFFFFFFFFF8] >> v35) & 1) == 0)
      goto LABEL_34;
  }
  isStackAllocationSafe = ((uint64_t (*)(char *, uint64_t))v41)(v55, v7);
  v43 = *(_BYTE *)(v36 + 32);
  v44 = (unint64_t)((1 << v43) + 63) >> 6;
  v45 = 8 * v44;
  if ((v43 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    memcpy((char *)&v49 - ((v45 + 15) & 0x3FFFFFFFFFFFFFF0), v54, v45);
    v46 = sub_249FF600C((unint64_t *)((char *)&v49 - ((v45 + 15) & 0x3FFFFFFFFFFFFFF0)), v44, v36, v35, &v56);
    swift_release();
    sub_249FCA5CC();
  }
  else
  {
    v48 = (void *)swift_slowAlloc();
    memcpy(v48, v54, v45);
    v46 = sub_249FF600C((unint64_t *)v48, v44, v36, v35, &v56);
    swift_release();
    sub_249FCA5CC();
    MEMORY[0x24BD07950](v48, -1, -1);
  }
  return v46;
}

uint64_t sub_249FF5A70(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = v1;
  v4 = *v2;
  v5 = sub_24A01F4E0();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(v4 + 48);
  if (*(_QWORD *)(v8 + 8 * v7) != a1)
  {
    v9 = ~v6;
    do
    {
      v7 = (v7 + 1) & v9;
      if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)(v8 + 8 * v7) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v2;
  v14 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_249FF2C50();
    v11 = v14;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 48) + 8 * v7);
  sub_249FF645C(v7);
  *v2 = v14;
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_249FF5B78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_24A01EBA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_249FA2B24(&qword_2578FF758, v11, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  v29 = a1;
  v12 = sub_24A01EE14();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a2;
    v15 = ~v13;
    v16 = *(_QWORD *)(v7 + 72);
    v30 = v7;
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    while (1)
    {
      v18 = v16 * v14;
      v17(v9, *(_QWORD *)(v10 + 48) + v16 * v14, v6);
      sub_249FA2B24(&qword_2578FF760, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v19 = sub_24A01EE38();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        break;
      v14 = (v14 + 1) & v15;
      if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v20 = 1;
        a2 = v28;
        v7 = v30;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v20, 1, v6);
      }
    }
    swift_bridgeObjectRelease();
    v21 = v27;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v23 = *v21;
    v31 = *v21;
    *v21 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_249FF2DE4();
      v23 = v31;
    }
    v24 = *(_QWORD *)(v23 + 48) + v18;
    v7 = v30;
    a2 = v28;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v30 + 32))(v28, v24, v6);
    sub_249FF65E0(v14);
    *v21 = v31;
    swift_bridgeObjectRelease();
    v20 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v20 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v20, 1, v6);
}

uint64_t sub_249FF5DB4(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  unint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t i;
  unint64_t v31;
  int64_t v32;

  v8 = (unint64_t *)result;
  v9 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v10 = v9 - 1;
  v11 = a3 + 56;
  while (1)
  {
    v16 = a5[3];
    v17 = a5[4];
    if (!v17)
      break;
    v18 = (v17 - 1) & v17;
    v19 = __clz(__rbit64(v17)) | (v16 << 6);
LABEL_16:
    v26 = *(_QWORD *)(*(_QWORD *)(*a5 + 48) + 8 * v19);
    a5[3] = v16;
    a5[4] = v18;
    result = sub_24A01F4E0();
    v27 = -1 << *(_BYTE *)(a3 + 32);
    v28 = result & ~v27;
    v12 = v28 >> 6;
    v13 = 1 << v28;
    if (((1 << v28) & *(_QWORD *)(v11 + 8 * (v28 >> 6))) != 0)
    {
      v29 = *(_QWORD *)(a3 + 48);
      if (*(_QWORD *)(v29 + 8 * v28) == v26)
      {
LABEL_3:
        v14 = v12;
        v15 = v8[v12];
        v8[v14] = v15 & ~v13;
        if ((v13 & v15) != 0)
        {
          if (__OFSUB__(v10--, 1))
            goto LABEL_35;
          if (!v10)
            return MEMORY[0x24BEE4B08];
        }
      }
      else
      {
        for (i = v28 + 1; ; i = v31 + 1)
        {
          v31 = i & ~v27;
          if (((*(_QWORD *)(v11 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) == 0)
            break;
          if (*(_QWORD *)(v29 + 8 * v31) == v26)
          {
            v12 = v31 >> 6;
            v13 = 1 << v31;
            goto LABEL_3;
          }
        }
      }
    }
  }
  v20 = v16 + 1;
  if (!__OFADD__(v16, 1))
  {
    v21 = (unint64_t)(a5[2] + 64) >> 6;
    v22 = a5[3];
    if (v20 >= v21)
      goto LABEL_33;
    v23 = a5[1];
    v24 = *(_QWORD *)(v23 + 8 * v20);
    if (v24)
      goto LABEL_15;
    v25 = v16 + 2;
    v22 = v16 + 1;
    if (v16 + 2 >= v21)
      goto LABEL_33;
    v24 = *(_QWORD *)(v23 + 8 * v25);
    if (!v24)
    {
      v22 = v16 + 2;
      if (v16 + 3 >= v21)
        goto LABEL_33;
      v24 = *(_QWORD *)(v23 + 8 * (v16 + 3));
      if (v24)
      {
        v20 = v16 + 3;
        goto LABEL_15;
      }
      v25 = v16 + 4;
      v22 = v16 + 3;
      if (v16 + 4 >= v21)
        goto LABEL_33;
      v24 = *(_QWORD *)(v23 + 8 * v25);
      if (!v24)
      {
        v20 = v16 + 5;
        v22 = v16 + 4;
        if (v16 + 5 >= v21)
          goto LABEL_33;
        v24 = *(_QWORD *)(v23 + 8 * v20);
        if (!v24)
        {
          v22 = v21 - 1;
          v32 = v16 + 6;
          while (v21 != v32)
          {
            v24 = *(_QWORD *)(v23 + 8 * v32++);
            if (v24)
            {
              v20 = v32 - 1;
              goto LABEL_15;
            }
          }
LABEL_33:
          a5[3] = v22;
          a5[4] = 0;
          swift_retain();
          return sub_249FF3C18(v8, a2, v10, a3);
        }
        goto LABEL_15;
      }
    }
    v20 = v25;
LABEL_15:
    v18 = (v24 - 1) & v24;
    v19 = __clz(__rbit64(v24)) + (v20 << 6);
    v16 = v20;
    goto LABEL_16;
  }
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_249FF600C(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, unint64_t, uint64_t);
  char v39;
  int64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t *v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;

  v49 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24A01EBA4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v14);
  v57 = (char *)&v48 - v18;
  v19 = *(_QWORD *)(a3 + 16);
  v20 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  v21 = *(unint64_t *)((char *)a1 + v20) & ((-1 << a4) - 1);
  v51 = a1;
  v52 = v11;
  *(unint64_t *)((char *)a1 + v20) = v21;
  v22 = v19 - 1;
  v55 = a3 + 56;
  v56 = a3;
  v53 = a5;
  while (2)
  {
    v50 = v22;
    do
    {
      while (1)
      {
        v25 = *a5;
        v24 = a5[1];
        v27 = a5[2];
        v26 = a5[3];
        v28 = a5[4];
        v54 = v27;
        if (v28)
        {
          v29 = (v28 - 1) & v28;
          v30 = __clz(__rbit64(v28)) | (v26 << 6);
LABEL_7:
          (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v11, *(_QWORD *)(v25 + 48) + *(_QWORD *)(v13 + 72) * v30, v12);
          v31 = 0;
          goto LABEL_8;
        }
        v40 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          goto LABEL_44;
        }
        v41 = (unint64_t)(v27 + 64) >> 6;
        if (v40 >= v41)
        {
          v29 = 0;
          v31 = 1;
          goto LABEL_8;
        }
        v42 = *(_QWORD *)(v24 + 8 * v40);
        if (v42)
          goto LABEL_17;
        v45 = v26 + 2;
        if (v26 + 2 >= v41)
          goto LABEL_35;
        v42 = *(_QWORD *)(v24 + 8 * v45);
        if (v42)
          goto LABEL_23;
        if (v26 + 3 >= v41)
          goto LABEL_36;
        v42 = *(_QWORD *)(v24 + 8 * (v26 + 3));
        if (v42)
        {
          v40 = v26 + 3;
          goto LABEL_17;
        }
        v45 = v26 + 4;
        if (v26 + 4 < v41)
        {
          v42 = *(_QWORD *)(v24 + 8 * v45);
          if (v42)
          {
LABEL_23:
            v40 = v45;
LABEL_17:
            v29 = (v42 - 1) & v42;
            v30 = __clz(__rbit64(v42)) + (v40 << 6);
            v26 = v40;
            goto LABEL_7;
          }
          v40 = v26 + 5;
          if (v26 + 5 < v41)
          {
            v42 = *(_QWORD *)(v24 + 8 * v40);
            if (v42)
              goto LABEL_17;
            v40 = v41 - 1;
            v46 = v26 + 6;
            while (v41 != v46)
            {
              v42 = *(_QWORD *)(v24 + 8 * v46++);
              if (v42)
              {
                v40 = v46 - 1;
                goto LABEL_17;
              }
            }
LABEL_35:
            v29 = 0;
            v31 = 1;
            v26 = v40;
            goto LABEL_8;
          }
LABEL_36:
          v29 = 0;
          v31 = 1;
          v26 = v45;
          goto LABEL_8;
        }
        v29 = 0;
        v31 = 1;
        v26 += 3;
LABEL_8:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v31, 1, v12);
        *a5 = v25;
        a5[1] = v24;
        a5[2] = v54;
        a5[3] = v26;
        a5[4] = v29;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
        {
          sub_249FF7928((uint64_t)v11);
          v47 = v56;
          swift_retain();
          return sub_249FF3E5C(v51, v49, v50, v47);
        }
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v57, v11, v12);
        v32 = v56;
        sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v33 = sub_24A01EE14();
        v34 = -1 << *(_BYTE *)(v32 + 32);
        v35 = v33 & ~v34;
        if (((*(_QWORD *)(v55 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) != 0)
          break;
        v23 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
LABEL_4:
        result = v23(v57, v12);
        v11 = v52;
        a5 = v53;
      }
      v36 = ~v34;
      v37 = *(_QWORD *)(v13 + 72);
      v38 = *(void (**)(char *, unint64_t, uint64_t))(v13 + 16);
      while (1)
      {
        v38(v16, *(_QWORD *)(v56 + 48) + v37 * v35, v12);
        sub_249FA2B24(&qword_2578FF760, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
        v39 = sub_24A01EE38();
        v23 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
        v23(v16, v12);
        if ((v39 & 1) != 0)
          break;
        v35 = (v35 + 1) & v36;
        if (((*(_QWORD *)(v55 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
          goto LABEL_4;
      }
      result = v23(v57, v12);
      v43 = (v35 >> 3) & 0x1FFFFFFFFFFFFFF8;
      v11 = v52;
      v44 = *(unint64_t *)((char *)v51 + v43);
      *(unint64_t *)((char *)v51 + v43) = v44 & ~(1 << v35);
      a5 = v53;
    }
    while ((v44 & (1 << v35)) == 0);
    v22 = v50 - 1;
    if (__OFSUB__(v50, 1))
    {
LABEL_44:
      __break(1u);
      return result;
    }
    if (v50 != 1)
      continue;
    return MEMORY[0x24BEE4B08];
  }
}

unint64_t sub_249FF645C(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_24A01F234();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(_QWORD *)(v3 + 48);
        v11 = (_QWORD *)(v10 + 8 * v6);
        v12 = sub_24A01F4E0() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            v15 = (_QWORD *)(v10 + 8 * v2);
            if (v2 != v6 || (v2 = v6, v15 >= v11 + 1))
            {
              *v15 = *v11;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v16 = *(_QWORD *)(v3 + 16);
  v17 = __OFSUB__(v16, 1);
  v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_249FF65E0(int64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;

  v3 = sub_24A01EBA4();
  v28 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *v1 + 56;
  v9 = -1 << *(_BYTE *)(*v1 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    v25 = v1;
    v11 = ~v9;
    swift_retain();
    v12 = sub_24A01F234();
    v27 = v8;
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v13 = (v12 + 1) & v11;
      v14 = *(_QWORD *)(v28 + 72);
      v26 = *(void (**)(char *, unint64_t, uint64_t))(v28 + 16);
      do
      {
        v15 = v14 * v10;
        v26(v6, *(_QWORD *)(v7 + 48) + v14 * v10, v3);
        sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v16 = sub_24A01EE14();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v3);
        v17 = v16 & v11;
        if (a1 >= (uint64_t)v13)
        {
          if (v17 < v13 || a1 < (uint64_t)v17)
            goto LABEL_6;
        }
        else if (v17 < v13 && a1 < (uint64_t)v17)
        {
          goto LABEL_6;
        }
        v20 = v14 * a1;
        if (v14 * a1 < v15 || *(_QWORD *)(v7 + 48) + v14 * a1 >= (unint64_t)(*(_QWORD *)(v7 + 48) + v15 + v14))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v20 == v15)
            goto LABEL_6;
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        v10 = (v10 + 1) & v11;
      }
      while (((*(_QWORD *)(v27 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(_QWORD *)(v27 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release();
    v1 = v25;
  }
  else
  {
    *(_QWORD *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v21 = *v1;
  v22 = *(_QWORD *)(*v1 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v21 + 16) = v24;
    ++*(_DWORD *)(v21 + 36);
  }
  return result;
}

unint64_t sub_249FF685C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t result;
  int64_t v11;
  int64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v5 = a1 + 56;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a1 + 56);
  v9 = (uint64_t *)(a2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore__identifiersMapping);
  swift_bridgeObjectRetain();
  result = swift_beginAccess();
  v11 = 0;
  v12 = (unint64_t)(v6 + 63) >> 6;
  v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v11 >= v12)
      goto LABEL_30;
    v17 = *(_QWORD *)(v5 + 8 * v11);
    if (!v17)
      break;
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_19:
    v19 = *v9;
    if (*(_QWORD *)(*v9 + 16))
    {
      result = sub_249F8B27C(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v15));
      if ((v20 & 1) != 0)
      {
        v21 = (uint64_t *)(*(_QWORD *)(v19 + 56) + 16 * result);
        v22 = v21[1];
        v27 = *v21;
        swift_bridgeObjectRetain();
        result = swift_isUniquelyReferenced_nonNull_native();
        v28 = v3;
        if ((result & 1) == 0)
        {
          result = (unint64_t)sub_249F89C94(0, v13[2] + 1, 1, v13);
          v13 = (_QWORD *)result;
        }
        v24 = v13[2];
        v23 = v13[3];
        v25 = v13;
        if (v24 >= v23 >> 1)
        {
          result = (unint64_t)sub_249F89C94((_QWORD *)(v23 > 1), v24 + 1, 1, v13);
          v25 = (_QWORD *)result;
        }
        v25[2] = v24 + 1;
        v13 = v25;
        v26 = &v25[2 * v24];
        v26[4] = v27;
        v26[5] = v22;
        v3 = v28;
      }
    }
  }
  v18 = v11 + 1;
  if (v11 + 1 >= v12)
    goto LABEL_30;
  v17 = *(_QWORD *)(v5 + 8 * v18);
  if (v17)
    goto LABEL_17;
  v18 = v11 + 2;
  if (v11 + 2 >= v12)
    goto LABEL_30;
  v17 = *(_QWORD *)(v5 + 8 * v18);
  if (v17)
    goto LABEL_17;
  v18 = v11 + 3;
  if (v11 + 3 >= v12)
    goto LABEL_30;
  v17 = *(_QWORD *)(v5 + 8 * v18);
  if (v17)
    goto LABEL_17;
  v18 = v11 + 4;
  if (v11 + 4 >= v12)
  {
LABEL_30:
    swift_release();
    return (unint64_t)v13;
  }
  v17 = *(_QWORD *)(v5 + 8 * v18);
  if (v17)
  {
LABEL_17:
    v11 = v18;
    goto LABEL_18;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v12)
      goto LABEL_30;
    v17 = *(_QWORD *)(v5 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_18;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_249FF6A88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  void (*v18)(char *, uint64_t);
  char v19;
  void (*v20)(char *, uint64_t);
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD v26[2];
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v5 = sub_24A01ECAC();
  v29 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v26 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  if (v11)
  {
    v26[1] = v2;
    v34 = MEMORY[0x24BEE4AF8];
    sub_249F8CC30(0, v11, 0);
    v13 = *(_QWORD *)(sub_24A01ECD0() - 8);
    v14 = a1 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v28 = a2 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_vdbConfig;
    v15 = *(_QWORD *)(v13 + 72);
    v27 = *MEMORY[0x24BEBFD60];
    do
    {
      sub_24A01ECC4();
      if ((~v16 & 0x7FF0000000000000) == 0)
      {
        v17 = 0.0;
        if ((v16 & 0xFFFFFFFFFFFFFLL) != 0)
          goto LABEL_12;
      }
      sub_24A01EC94();
      (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v8, v27, v5);
      sub_249FA2B24(&qword_2578FFD78, (uint64_t (*)(uint64_t))MEMORY[0x24BEBFD70], MEMORY[0x24BEBFD78]);
      sub_24A01EF58();
      sub_24A01EF58();
      if (v32 == v30 && v33 == v31)
      {
        swift_bridgeObjectRelease_n();
        v18 = *(void (**)(char *, uint64_t))(v29 + 8);
        v18(v8, v5);
        v18(v10, v5);
      }
      else
      {
        v19 = sub_24A01F45C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v20 = *(void (**)(char *, uint64_t))(v29 + 8);
        v20(v8, v5);
        v20(v10, v5);
        if ((v19 & 1) == 0)
        {
          sub_24A01ECC4();
          goto LABEL_11;
        }
      }
      sub_24A01ECC4();
      v22 = v21 * v21 * -0.5 + 1.0;
LABEL_11:
      v17 = v22;
LABEL_12:
      v12 = v34;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_249F8CC30(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v34;
      }
      v24 = *(_QWORD *)(v12 + 16);
      v23 = *(_QWORD *)(v12 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_249F8CC30(v23 > 1, v24 + 1, 1);
        v12 = v34;
      }
      *(_QWORD *)(v12 + 16) = v24 + 1;
      *(float *)(v12 + 4 * v24 + 32) = v17;
      v14 += v15;
      --v11;
    }
    while (v11);
  }
  return v12;
}

uint64_t sub_249FF6D78(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  char *v30;
  uint64_t v31;

  v7 = sub_24A01ECD0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v30 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - v11;
  result = MEMORY[0x24BEE4AF8];
  v31 = MEMORY[0x24BEE4AF8];
  v14 = *(_QWORD *)(a1 + 16);
  if (v14)
  {
    v23 = v3;
    v15 = *(_QWORD *)(v8 + 72);
    v25 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v26 = v8;
    v16 = a1 + v25;
    v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v28 = a2 + 32;
    v29 = v17;
    v27 = a2;
    v24 = v15;
    v17(v12, a1 + v25, v7);
    while (1)
    {
      result = sub_24A01ECB8();
      if ((a3 & 0x8000000000000000) != 0)
        break;
      if (*(_QWORD *)(a2 + 16) <= a3)
        goto LABEL_17;
      if (result == *(_QWORD *)(v28 + 8 * a3))
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
      }
      else
      {
        v18 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v18(v30, v12, v7);
        v19 = v31;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_249F8CDC8(0, *(_QWORD *)(v19 + 16) + 1, 1);
          v19 = v31;
        }
        v21 = *(_QWORD *)(v19 + 16);
        v20 = *(_QWORD *)(v19 + 24);
        if (v21 >= v20 >> 1)
        {
          sub_249F8CDC8(v20 > 1, v21 + 1, 1);
          v19 = v31;
        }
        *(_QWORD *)(v19 + 16) = v21 + 1;
        v22 = v24;
        v18((char *)(v19 + v25 + v21 * v24), v30, v7);
        v15 = v22;
        v31 = v19;
        v8 = v26;
        a2 = v27;
      }
      v16 += v15;
      if (!--v14)
        return v31;
      v29(v12, v16, v7);
    }
    __break(1u);
LABEL_17:
    __break(1u);
  }
  return result;
}

uint64_t sub_249FF6F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t), uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  char v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(_QWORD, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v7 = v6;
  v8 = v5;
  v51 = a5;
  v49 = a4;
  v11 = sub_24A01ECD0();
  v12 = *(_QWORD *)(v11 - 8);
  v55 = v11;
  v56 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = *(_QWORD *)(a1 + 16);
  if (!v50)
    goto LABEL_20;
  v46 = a1;
  if (!sub_249FF0FE0(a2))
  {
    v36 = sub_24A01ED90();
    v37 = sub_24A01F0E4();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_249F70000, v36, v37, "Embeddings cannot be converted to data!", v38, 2u);
      MEMORY[0x24BD07950](v38, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v39 = 5;
    swift_willThrow();
    return v18 & 1;
  }
  v15 = MEMORY[0x24BEE4AF8];
  v16 = sub_24A01EC4C();
  result = swift_bridgeObjectRelease();
  if (v6)
    return v18 & 1;
  v45 = *(_QWORD *)(v16 + 16);
  if (!v45)
  {
LABEL_19:
    swift_bridgeObjectRelease();
LABEL_20:
    v18 = 1;
    return v18 & 1;
  }
  v19 = 0;
  v20 = v46;
  v43 = v46 + 32;
  v44 = v16 + 32;
  v41 = v8;
  v42 = v16;
  while (v19 < *(_QWORD *)(v16 + 16))
  {
    swift_bridgeObjectRetain();
    v21 = swift_bridgeObjectRetain();
    v53 = v19;
    v22 = v19;
    v23 = v7;
    v24 = sub_249FF6D78(v21, v20, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    v52 = sub_249FF6A88(v24, v8);
    v25 = v23;
    swift_release();
    v26 = *(_QWORD *)(v24 + 16);
    if (v26)
    {
      v48 = v23;
      v57 = v15;
      sub_249F8C9C8(0, v26, 0);
      v27 = *(unsigned __int8 *)(v56 + 80);
      v47 = v24;
      v28 = v24 + ((v27 + 32) & ~v27);
      v54 = *(_QWORD *)(v56 + 72);
      v29 = *(void (**)(char *, uint64_t, uint64_t))(v56 + 16);
      do
      {
        v30 = v55;
        v29(v14, v28, v55);
        v31 = sub_24A01ECB8();
        (*(void (**)(char *, uint64_t))(v56 + 8))(v14, v30);
        v15 = v57;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_249F8C9C8(0, *(_QWORD *)(v15 + 16) + 1, 1);
          v15 = v57;
        }
        v33 = *(_QWORD *)(v15 + 16);
        v32 = *(_QWORD *)(v15 + 24);
        if (v33 >= v32 >> 1)
        {
          sub_249F8C9C8(v32 > 1, v33 + 1, 1);
          v15 = v57;
        }
        *(_QWORD *)(v15 + 16) = v33 + 1;
        *(_QWORD *)(v15 + 8 * v33 + 32) = v31;
        v28 += v54;
        --v26;
      }
      while (v26);
      result = swift_bridgeObjectRelease();
      v25 = v48;
      v8 = v41;
      v20 = v46;
    }
    else
    {
      result = swift_bridgeObjectRelease();
    }
    v34 = v53;
    if (v53 == v50)
      goto LABEL_27;
    v7 = v25;
    v35 = v49(*(_QWORD *)(v43 + 8 * v53), v52, v15);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v35 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      v18 = 0;
      return v18 & 1;
    }
    v15 = MEMORY[0x24BEE4AF8];
    v16 = v42;
    v19 = v34 + 1;
    if (v34 + 1 == v45)
      goto LABEL_19;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void sub_249FF7368(unsigned int a1, uint64_t a2, unsigned int a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(_QWORD, uint64_t, uint64_t), uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  char v29;
  uint8_t *v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v61;
  char v63;
  char v64;
  char v65;

  v12 = v11;
  v13 = v10;
  v63 = 1;
  swift_beginAccess();
  v16 = swift_bridgeObjectRetain();
  v17 = sub_249FA49A4(v16);
  sub_249FF78C4(a2, (uint64_t)&v64);
  sub_249FF78C4((uint64_t)&v64, (uint64_t)&v65);
  v18 = v65;
  if (v65 == 2)
  {
LABEL_7:
    v22 = *(_QWORD *)(a2 + 8);
    if (!v22)
      goto LABEL_10;
    goto LABEL_8;
  }
  v19 = swift_bridgeObjectRetain();
  v20 = sub_249FC6B8C(v19);
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
  {
    v21 = sub_249FF36D8(v20, v17);
LABEL_6:
    v17 = v21;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (*(_QWORD *)(v20 + 16) > *(_QWORD *)(v17 + 16) >> 3)
  {
    v21 = sub_249FF5120(v20, v17);
    goto LABEL_6;
  }
  sub_249FF4D14(v20);
  swift_bridgeObjectRelease();
  v22 = *(_QWORD *)(a2 + 8);
  if (!v22)
    goto LABEL_10;
LABEL_8:
  if (*(_QWORD *)(v22 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v17 = sub_249FC6B8C(v22);
    swift_bridgeObjectRelease();
  }
LABEL_10:
  v23 = *(_QWORD *)(a2 + 16);
  if (!v23 || !*(_QWORD *)(v23 + 16))
  {
LABEL_14:
    if (*(_QWORD *)(v17 + 16))
      goto LABEL_15;
LABEL_48:
    swift_bridgeObjectRelease();
    return;
  }
  v24 = swift_bridgeObjectRetain();
  v25 = sub_249FC6B8C(v24);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v25 + 16) > *(_QWORD *)(v17 + 16) >> 3)
  {
    v17 = sub_249FF5120(v25, v17);
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  sub_249FF4D14(v25);
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v17 + 16))
    goto LABEL_48;
LABEL_15:
  swift_retain();
  v26 = sub_249FF685C(v17, v13);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRetain();
  v27 = sub_24A01ED90();
  v28 = sub_24A01F0D8();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = a5;
    v30 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v30 = 134217984;
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_249F70000, v27, v28, "Looking for neighbors of %ld embeddings", v30, 0xCu);
    v31 = v30;
    a5 = v29;
    MEMORY[0x24BD07950](v31, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v32 = v26;

  v33 = *(_QWORD *)(v26 + 16);
  if (!v33)
    goto LABEL_48;
  v34 = 0;
  v61 = 0;
  v53 = a5 & 1;
  v51 = v26 + 32;
  v35 = 256;
  v54 = v32;
  v55 = v13;
  v52 = v33;
  while (1)
  {
    v36 = v33 >= v35 ? v35 : v33;
    v37 = v34 + 256;
    if (__OFADD__(v34, 256))
      break;
    if (v37 >= v33)
      v38 = v33;
    else
      v38 = v34 + 256;
    if (v38 < v34)
      goto LABEL_52;
    v39 = *(_QWORD *)(v32 + 16);
    if (v39 < v34 || (uint64_t)v39 < v38)
      goto LABEL_53;
    sub_24A01F468();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain_n();
    v41 = swift_dynamicCastClass();
    if (!v41)
    {
      swift_bridgeObjectRelease();
      v41 = MEMORY[0x24BEE4AF8];
    }
    v42 = *(_QWORD *)(v41 + 16);
    swift_release();
    if (v36 + v61 == v42)
    {
      v43 = swift_dynamicCastClass();
      if (!v43)
      {
        swift_bridgeObjectRelease();
        v43 = MEMORY[0x24BEE4AF8];
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v43 = sub_249FB5314(v32, v51, v34, (2 * v38) | 1);
    }
    swift_bridgeObjectRelease();
    if ((v63 & 1) == 0)
      goto LABEL_47;
    v44 = sub_24A01ED90();
    v45 = sub_24A01F0D8();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = v12;
      v47 = swift_slowAlloc();
      *(_DWORD *)v47 = 134218240;
      *(_QWORD *)(v47 + 4) = v34;
      *(_WORD *)(v47 + 12) = 2048;
      *(_QWORD *)(v47 + 14) = v38;
      _os_log_impl(&dword_249F70000, v44, v45, "Searching embeddings %ld..%ld", (uint8_t *)v47, 0x16u);
      v48 = v47;
      v12 = v46;
      MEMORY[0x24BD07950](v48, -1, -1);
    }

    v49 = (void *)MEMORY[0x24BD07458]();
    LOBYTE(v50) = v53;
    sub_249FF26BC(v55, v43, &v63, a1, a6, a7, a8, a3, a4, v50, a9, a10);
    v32 = v54;
    if (v12)
    {
      objc_autoreleasePoolPop(v49);
LABEL_47:
      swift_release();
      goto LABEL_48;
    }
    objc_autoreleasePoolPop(v49);
    swift_release();
    v35 += 256;
    v61 -= 256;
    v34 += 256;
    v33 = v52;
    if (v37 >= v52)
      goto LABEL_48;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
}

uint64_t sub_249FF78C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_249FF790C(_QWORD *a1)
{
  uint64_t v1;

  return sub_249FEF3DC(a1, *(_QWORD **)(v1 + 16)) & 1;
}

uint64_t sub_249FF7928(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_249FF7968(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VUStreamingGallery.Label(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_249FF79AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for VUStreamingGallery.Label(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_249FF79F0()
{
  unint64_t result;

  result = qword_2578FFDA8;
  if (!qword_2578FFDA8)
  {
    result = MEMORY[0x24BD078A8](MEMORY[0x24BEE0D48], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2578FFDA8);
  }
  return result;
}

unint64_t sub_249FF7A34()
{
  unint64_t result;

  result = qword_2578FFDB0;
  if (!qword_2578FFDB0)
  {
    result = MEMORY[0x24BD078A8](MEMORY[0x24BEE0D40], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2578FFDB0);
  }
  return result;
}

unint64_t MLMultiArray.data.getter()
{
  void *v0;
  unint64_t result;
  uint64_t v2;
  id v3;
  _QWORD v4[2];

  result = (unint64_t)objc_msgSend(v0, sel_count);
  if ((result - 0x2000000000000000) >> 62 == 3)
  {
    v4[0] = sub_249FEFCA0(4 * result);
    v4[1] = v2;
    v3 = v0;
    sub_249FEEFBC((uint64_t)v4);
    return v4[0];
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_249FF7AE8(uint64_t a1, int a2, id a3, uint64_t a4, uint64_t a5)
{
  id v9;
  uint64_t v10;
  id i;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  int64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;

  v9 = objc_msgSend(a3, sel_shape);
  sub_249FA3620();
  v10 = sub_24A01EF88();

  if ((v10 & 0xC000000000000001) != 0)
    goto LABEL_33;
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    for (i = *(id *)(v10 + 32); ; i = (id)MEMORY[0x24BD071F4](0, v10))
    {
      v12 = i;
      swift_bridgeObjectRelease();
      v10 = (uint64_t)objc_msgSend(v12, sel_integerValue);

      if (v10 < 0)
        break;
      if (!v10)
        return;
      v13 = 0;
      v25 = a5;
      while (v10 != v13)
      {
        v14 = objc_msgSend(a3, sel_shape);
        v15 = sub_24A01EF88();

        if ((v15 & 0xC000000000000001) != 0)
        {
          v16 = (id *)MEMORY[0x24BD071F4](1, v15);
        }
        else
        {
          if (*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
            goto LABEL_28;
          v16 = (id *)*(id *)(v15 + 40);
        }
        a5 = (uint64_t)v16;
        swift_bridgeObjectRelease();
        v17 = (uint64_t)objc_msgSend((id)a5, sel_integerValue);

        v18 = v17 * a4;
        if ((unsigned __int128)(v17 * (__int128)a4) >> 64 != (v17 * a4) >> 63)
          goto LABEL_27;
        if (!a1)
          goto LABEL_36;
        v19 = objc_msgSend(a3, sel_strides);
        a5 = sub_24A01EF88();

        if ((a5 & 0xC000000000000001) != 0)
        {
          v20 = (id)MEMORY[0x24BD071F4](0, a5);
        }
        else
        {
          if (!*(_QWORD *)((a5 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_30;
          v20 = *(id *)(a5 + 32);
        }
        v21 = v20;
        swift_bridgeObjectRelease();
        a5 = (uint64_t)objc_msgSend(v21, sel_integerValue);

        v22 = v13 * a5;
        if ((unsigned __int128)(v13 * (__int128)a5) >> 64 != (v13 * a5) >> 63)
          goto LABEL_29;
        v23 = v22 * a4;
        if ((unsigned __int128)(v22 * (__int128)a4) >> 64 != (v22 * a4) >> 63)
          goto LABEL_31;
        if (!v25)
          goto LABEL_37;
        v24 = v13 * v18;
        if ((unsigned __int128)(v13 * (__int128)v18) >> 64 != (v13 * v18) >> 63)
          goto LABEL_32;
        if (v18 < 0)
          goto LABEL_38;
        ++v13;
        memmove((void *)(v25 + v24), (const void *)(a1 + v23), v18);
        if (v10 == v13)
          return;
      }
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
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
      ;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  sub_24A01F408();
  __break(1u);
}

uint64_t sub_249FF7DC4()
{
  return sub_249FCBC58(0, 0, 1);
}

uint64_t sub_249FF7DF0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  _BYTE v29[4];
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;

  v30 = a2;
  v36 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAD60);
  MEMORY[0x24BDAC7A8](v3);
  v37 = &v29[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_24A01F120();
  v34 = *(_QWORD *)(v5 - 8);
  v35 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v29[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_24A01F108();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v8);
  v10 = sub_24A01EDE4();
  MEMORY[0x24BDAC7A8](v10);
  *(_BYTE *)(v2 + 24) = 0;
  v31 = v2 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_signposter;
  sub_24A01ED3C();
  v32 = v2 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_logger;
  sub_24A01ED9C();
  v11 = OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_callbackQueue;
  v33 = sub_249F990DC(0, (unint64_t *)&unk_2544CAEC0);
  sub_24A01EDD8();
  v39 = MEMORY[0x24BEE4AF8];
  sub_249FA2B24((unint64_t *)&unk_2544CAEB0, v9, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAE90);
  v12 = v11;
  v13 = v2;
  sub_249F98C68(&qword_2544CAE98, &qword_2544CAE90, MEMORY[0x24BEE12C8]);
  v14 = v36;
  sub_24A01F228();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v34 + 104))(v7, *MEMORY[0x24BEE5750], v35);
  *(_QWORD *)(v2 + v12) = sub_24A01F150();
  v15 = v37;
  sub_249F9905C(v14, (uint64_t)v37, (uint64_t *)&unk_2544CAD60);
  type metadata accessor for VUIndexStore();
  swift_allocObject();
  v16 = v38;
  v17 = sub_249FCEDEC((uint64_t)v15);
  if (v16)
  {
    sub_249F990A0(v14, (uint64_t *)&unk_2544CAD60);
    v18 = sub_24A01ED48();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v31, v18);
    v19 = sub_24A01EDA8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v32, v19);

    type metadata accessor for VUIndex();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v20 = v17;
    *(_QWORD *)(v2 + 16) = v17;
    v21 = v30 & 1;
    *(_BYTE *)(v2 + 24) = v30 & 1;
    type metadata accessor for VUIndexQuantizer();
    swift_allocObject();
    v22 = swift_retain();
    v23 = sub_249F9C764(v22, 100);
    *(_QWORD *)(v13 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_quantizer) = v23;
    type metadata accessor for VUIndexScanner();
    swift_allocObject();
    swift_retain();
    swift_retain();
    *(_QWORD *)(v13 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_scanner) = sub_24A0013A4(v20, v23, v21);
    type metadata accessor for VUIndexClusterer(0);
    swift_allocObject();
    v24 = swift_retain();
    *(_QWORD *)(v13 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_clusterer) = sub_24A007E30(v24);
    swift_retain();
    v25 = sub_249FD379C(256);
    v27 = v26;
    swift_release();
    if ((v27 & 1) == 0 && v25 <= 8)
      sub_249FF8258();
    sub_249F990A0(v14, (uint64_t *)&unk_2544CAD60);
  }
  return v13;
}

void sub_249FF8258()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  v1 = sub_24A01ED90();
  v2 = sub_24A01F0CC();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_249F70000, v1, v2, "Starting mapping migration...", v3, 2u);
    MEMORY[0x24BD07950](v3, -1, -1);
  }

  CFAbsoluteTimeGetCurrent();
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  v4 = (void *)sub_24A01F09C();
  MEMORY[0x24BDAC7A8](v4);
  v6 = v5;
  sub_24A01F180();

  if (!v0)
  {
    sub_249FDF3A0();
    CFAbsoluteTimeGetCurrent();
    v7 = sub_24A01ED90();
    v8 = sub_24A01F0CC();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v9 = 134217984;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v7, v8, "Mapping migration took %fs", v9, 0xCu);
      MEMORY[0x24BD07950](v9, -1, -1);
    }

  }
}

void sub_249FF84B8(void *a1, uint64_t a2)
{
  id v4;

  type metadata accessor for VUIndexMapping();
  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithContext_, *(_QWORD *)(*(_QWORD *)(a2 + 16) + 16));
  objc_msgSend(v4, sel_setLabel_, objc_msgSend(a1, sel_legacyLabel));
  objc_msgSend(v4, sel_setPartition_, objc_msgSend(a1, sel_legacyPartition));
  objc_msgSend(a1, sel_setMapping_, v4);

}

uint64_t sub_249FF856C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, unsigned __int8 a6, uint64_t *a7)
{
  uint64_t v7;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;

  v7 = *(_QWORD *)(a2 + 16);
  if (!v7)
    return 1;
  v11 = a3 + 32;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  while (1)
  {
    v14 = a2 + 4 * v13;
    if ((a4 & 1) != 0)
    {
      v15 = *(float *)(v14 + 32);
      v16 = (uint64_t *)(*(_QWORD *)(a5 + 16) + OBJC_IVAR____TtC19VisualUnderstanding12VUIndexStore_parameters);
      result = swift_beginAccess();
      v17 = *v16;
      if (!*(_QWORD *)(v17 + 16))
        goto LABEL_16;
      result = sub_249F8B0C4(a6);
      if ((v18 & 1) == 0)
        goto LABEL_17;
      if (v15 < *(float *)(*(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * result) + 56))
        goto LABEL_13;
    }
    if (v13 >= *(_QWORD *)(a3 + 16))
      break;
    v19 = *(_QWORD *)(v11 + 8 * v13);
    v20 = *(_DWORD *)(v14 + 32);
    v21 = (_QWORD *)*a7;
    result = swift_isUniquelyReferenced_nonNull_native();
    *a7 = (uint64_t)v21;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_249F8A640(0, v21[2] + 1, 1, v21);
      v21 = (_QWORD *)result;
      *a7 = result;
    }
    v23 = v21[2];
    v22 = v21[3];
    if (v23 >= v22 >> 1)
    {
      result = (uint64_t)sub_249F8A640((_QWORD *)(v22 > 1), v23 + 1, 1, v21);
      v21 = (_QWORD *)result;
    }
    v21[2] = v23 + 1;
    v24 = &v21[2 * v23];
    v24[4] = v19;
    ++v13;
    *((_DWORD *)v24 + 10) = v20;
    *a7 = (uint64_t)v21;
    if (v7 == v13)
    {
LABEL_13:
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_249FF8704(unsigned int a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unsigned int v50;
  _QWORD *v51;
  uint64_t aBlock;
  uint64_t v53;
  uint64_t (*v54)(uint64_t);
  void *v55;
  uint64_t (*v56)();
  uint64_t v57;
  _QWORD v58[4];
  __int16 v59;

  v48 = a3;
  v49 = a4;
  v46 = a2;
  v50 = a1;
  v4 = sub_24A01F120();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24A01F108();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v8);
  v10 = sub_24A01EDE4();
  MEMORY[0x24BDAC7A8](v10);
  sub_249F990DC(0, (unint64_t *)&unk_2544CAEC0);
  sub_24A01EDD8();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_249FA2B24((unint64_t *)&unk_2544CAEB0, v9, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAE90);
  sub_249F98C68(&qword_2544CAE98, &qword_2544CAE90, MEMORY[0x24BEE12C8]);
  sub_24A01F228();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5750], v4);
  v45 = sub_24A01F150();
  v11 = *(_QWORD *)(v47 + 16);
  v12 = MEMORY[0x24BEE4B00];
  v58[0] = MEMORY[0x24BEE4B00];
  v13 = *(void **)(v11 + 16);
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = v50;
  *(_BYTE *)(v14 + 17) = 0;
  *(_WORD *)(v14 + 18) = 0;
  *(_BYTE *)(v14 + 20) = 1;
  *(_QWORD *)(v14 + 24) = v48;
  v15 = v49;
  *(_BYTE *)(v14 + 32) = v49 & 1;
  *(_QWORD *)(v14 + 40) = v11;
  *(_QWORD *)(v14 + 48) = v58;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_249F98E74;
  *(_QWORD *)(v16 + 24) = v14;
  v56 = sub_249FC76E4;
  v57 = v16;
  aBlock = MEMORY[0x24BDAC760];
  v53 = 1107296256;
  v54 = sub_249F87210;
  v55 = &block_descriptor_15;
  v17 = _Block_copy(&aBlock);
  v18 = v13;
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_performBlockAndWait_, v17);

  _Block_release(v17);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v17 & 1) != 0)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  swift_release();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v12;
  v20 = (uint64_t *)(v19 + 16);
  v21 = v46;
  if ((v15 & 1) == 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    aBlock = v12;
    *v20 = 0x8000000000000000;
    sub_249FBFB60(v21, isUniquelyReferenced_nonNull_native, 0.0);
    *v20 = aBlock;
    swift_bridgeObjectRelease();
  }
  LOBYTE(v58[0]) = 1;
  v58[1] = 0;
  v58[2] = 0;
  v58[3] = v21;
  v59 = 512;
  v23 = (uint64_t *)(v11 + OBJC_IVAR____TtC19VisualUnderstanding12VUIndexStore_parameters);
  swift_beginAccess();
  v24 = *v23;
  v25 = v50;
  if (!*(_QWORD *)(v24 + 16))
    goto LABEL_16;
  v26 = sub_249F8B0C4(v50);
  if ((v27 & 1) == 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v28 = *(_QWORD *)(*(_QWORD *)(v24 + 56) + 8 * v26);
  MEMORY[0x24BDAC7A8](v26);
  v29 = v45;
  swift_retain();
  sub_24A0014C0(v25, (uint64_t)v58, 2, 0, 1, 128, 16, v28, 1, (uint64_t)sub_249FFB4F8, (uint64_t)(&v45 - 6));
  swift_release();
  swift_bridgeObjectRelease();
  v56 = (uint64_t (*)())nullsub_1;
  v57 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v53 = 1107296256;
  v54 = sub_249F87210;
  v55 = &block_descriptor_21;
  v30 = _Block_copy(&aBlock);
  swift_release();
  dispatch_sync(v29, v30);
  _Block_release(v30);
  if ((swift_isEscapingClosureAtFileLocation() & 1) != 0)
  {
LABEL_18:
    __break(1u);
    result = swift_release();
    __break(1u);
    return result;
  }
  swift_beginAccess();
  v31 = *v20;
  swift_bridgeObjectRetain_n();
  v32 = sub_249FB579C(v31);
  swift_bridgeObjectRelease();
  v51 = v32;
  sub_249F89568((uint64_t *)&v51, sub_24A012F4C, sub_249FFBBE8);
  swift_bridgeObjectRelease();
  v33 = (uint64_t)v51;
  v34 = v51[2];
  if (v34)
  {
    v51 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_249F8CB48(0, v34, 0);
    v35 = 0;
    v36 = (uint64_t)v51;
    v37 = v51[2];
    v38 = 16 * v37;
    do
    {
      v39 = *(_QWORD *)(v33 + v35 + 32);
      v40 = *(_DWORD *)(v33 + v35 + 40);
      v51 = (_QWORD *)v36;
      v41 = *(_QWORD *)(v36 + 24);
      v42 = v37 + 1;
      if (v37 >= v41 >> 1)
      {
        sub_249F8CB48(v41 > 1, v37 + 1, 1);
        v36 = (uint64_t)v51;
      }
      *(_QWORD *)(v36 + 16) = v42;
      v43 = v36 + v38 + v35;
      *(_QWORD *)(v43 + 32) = v39;
      *(_DWORD *)(v43 + 40) = v40;
      v35 += 16;
      v37 = v42;
      --v34;
    }
    while (v34);
    swift_release();
    swift_release();

  }
  else
  {
    swift_release();
    swift_release();

    return MEMORY[0x24BEE4AF8];
  }
  return v36;
}

uint64_t sub_249FF8D98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  int v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  const void *v27;
  char *v28;
  char *v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t aBlock[8];

  v40 = a5;
  v41 = a6;
  v9 = sub_24A01EDCC();
  v38 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v37 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24A01EDE4();
  v35 = *(_QWORD *)(v11 - 8);
  v36 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v34 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[6] = MEMORY[0x24BEE4B08];
  v13 = *(_QWORD *)(a3 + 16);
  if (v13)
  {
    v14 = *(_QWORD *)(a2 + 16);
    if (v14)
    {
      v15 = *(_QWORD *)(a3 + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = 0;
      v17 = v13 - 1;
      v32 = v14;
      v18 = v39;
      do
      {
        if (*(_QWORD *)(a4 + 16))
        {
          v19 = *(_DWORD *)(a2 + 4 * v16 + 32);
          v20 = sub_249F8B27C(v15);
          if ((v21 & 1) != 0)
          {
            v22 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v20);
            if ((sub_249F8BD0C(aBlock, v22) & 1) != 0)
            {
              v23 = swift_allocObject();
              *(_QWORD *)(v23 + 16) = v41;
              *(_QWORD *)(v23 + 24) = v22;
              *(_DWORD *)(v23 + 32) = v19;
              aBlock[4] = (uint64_t)sub_249FFC574;
              aBlock[5] = v23;
              aBlock[0] = MEMORY[0x24BDAC760];
              aBlock[1] = 1107296256;
              aBlock[2] = (uint64_t)sub_24A007D98;
              aBlock[3] = (uint64_t)&block_descriptor_27;
              v33 = _Block_copy(aBlock);
              swift_retain();
              v24 = v34;
              sub_24A01EDD8();
              v42 = MEMORY[0x24BEE4AF8];
              sub_249FA2B24((unint64_t *)&qword_2544CA290, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
              __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA298);
              sub_249F98C68((unint64_t *)&qword_2544CA2A0, &qword_2544CA298, MEMORY[0x24BEE12C8]);
              v25 = a2;
              v26 = v37;
              sub_24A01F228();
              v27 = v33;
              MEMORY[0x24BD07014](0, v24, v26, v33);
              _Block_release(v27);
              v28 = v26;
              a2 = v25;
              (*(void (**)(char *, uint64_t))(v38 + 8))(v28, v18);
              v29 = v24;
              v14 = v32;
              (*(void (**)(char *, uint64_t))(v35 + 8))(v29, v36);
              swift_release();
            }
          }
        }
        if (v17 == v16)
          break;
        v15 = *(_QWORD *)(a3 + 8 * v16++ + 40);
      }
      while (v14 != v16);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_249FF907C(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t *v6;
  uint64_t v7;
  float v8;
  unint64_t v9;
  char v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v6 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  v7 = *(_QWORD *)(a1 + 16);
  v8 = 0.0;
  if (*(_QWORD *)(v7 + 16))
  {
    v9 = sub_249F8B27C(a2);
    if ((v10 & 1) != 0)
      v8 = *(float *)(*(_QWORD *)(v7 + 56) + 4 * v9);
  }
  swift_endAccess();
  if (v8 > a3)
    a3 = v8;
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v6;
  *v6 = 0x8000000000000000;
  sub_249FBFB60(a2, isUniquelyReferenced_nonNull_native, a3);
  *v6 = v13;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

unint64_t sub_249FF915C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  void *v29;
  unint64_t result;
  char v31;
  uint64_t v32;
  uint64_t (*v33)(void *);
  uint64_t v34;
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[6];
  __int16 v39;
  char v40[8];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int16 v44;

  v5 = sub_24A01F120();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24A01F108();
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_24A01EDE4();
  MEMORY[0x24BDAC7A8](v10);
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_11;
  v11 = 1;
  if (!*(_QWORD *)(a2 + 16))
  {
    v22 = 0;
LABEL_12:
    v40[0] = v11;
    return v22 | ((unint64_t)v11 << 32);
  }
  v35[1] = a2;
  v35[2] = sub_249F990DC(0, (unint64_t *)&unk_2544CAEC0);
  sub_24A01EDD8();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_249FA2B24((unint64_t *)&unk_2544CAEB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  v36 = v2;
  v37 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAE90);
  sub_249F98C68(&qword_2544CAE98, &qword_2544CAE90, MEMORY[0x24BEE12C8]);
  sub_24A01F228();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5750], v5);
  v12 = sub_24A01F150();
  v13 = swift_allocObject();
  *(_DWORD *)(v13 + 16) = 0;
  v39 = 256;
  v14 = *(_QWORD *)(v36 + 16);
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_24A0208B0;
  v16 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v15 + 64) = v16;
  *(_QWORD *)(v15 + 32) = *(_QWORD *)(v37 + 32);
  v17 = (void *)sub_24A01F09C();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v35[-10] = MEMORY[0x24BDAC7A8](v18);
  v35[-9] = 0;
  v35[-8] = &unk_251B67E58;
  v35[-7] = 1;
  LOBYTE(v35[-6]) = 0;
  v35[-5] = 0;
  v31 = 1;
  v32 = v14;
  v33 = sub_249FFB444;
  v34 = v19;
  v21 = v20;
  sub_24A01F180();

  if ((v39 & 0x100) != 0
    || (v23 = v39,
        v24 = (uint64_t *)(v14 + OBJC_IVAR____TtC19VisualUnderstanding12VUIndexStore_parameters),
        swift_beginAccess(),
        v25 = *v24,
        !*(_QWORD *)(v25 + 16))
    || (v26 = sub_249F8B0C4(v23), (v27 & 1) == 0))
  {
    swift_release();

LABEL_11:
    v22 = 0;
    v11 = 1;
    goto LABEL_12;
  }
  v28 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v26);
  v40[0] = 2;
  v42 = 0;
  v43 = 0;
  v41 = v37;
  v44 = 513;
  MEMORY[0x24BDAC7A8](v26);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_24A0014C0(v23, (uint64_t)v40, 2, 0, 1, 128, 16, v28, 0, (uint64_t)sub_249FFB44C, (uint64_t)&v35[-6]);
  swift_bridgeObjectRelease();
  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_249F87210;
  aBlock[3] = &block_descriptor_5;
  v29 = _Block_copy(aBlock);
  swift_release();
  dispatch_sync(v12, v29);
  swift_release();

  _Block_release(v29);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) == 0)
  {
    swift_beginAccess();
    v22 = *(unsigned int *)(v13 + 16);
    swift_release();
    v11 = 0;
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_249FF96C0(void *a1, _BYTE *a2)
{
  uint64_t result;

  result = (uint64_t)objc_msgSend(a1, sel_type);
  if ((result & 0x80000000) != 0 || result >= 0x100)
  {
    result = sub_24A01F3B4();
    __break(1u);
  }
  else
  {
    *a2 = result;
    a2[1] = 0;
  }
  return result;
}

uint64_t sub_249FF9788(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
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
  _QWORD aBlock[7];

  v37 = a5;
  v38 = a6;
  v33 = sub_24A01EDCC();
  v36 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24A01EDE4();
  v34 = *(_QWORD *)(v11 - 8);
  v35 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(a3 + 16);
  if (!v14)
    return 1;
  v15 = *(_QWORD *)(a2 + 16);
  if (!v15)
    return 1;
  v16 = *(_QWORD *)(a3 + 32);
  v17 = a4[2];
  v39 = a2 + 32;
  v30[2] = a3;
  v31 = v14;
  v32 = v15;
  swift_bridgeObjectRetain();
  v30[1] = a2;
  result = swift_bridgeObjectRetain();
  v20 = v31;
  v19 = v32;
  v21 = 0;
  v22 = 1;
  while (1)
  {
    if (!v17)
      goto LABEL_9;
    v23 = *(_DWORD *)(v39 + 4 * v21);
    if (a4[4] == v16)
      goto LABEL_8;
    if (v17 == 1)
      goto LABEL_9;
    if (a4[5] == v16)
    {
LABEL_8:
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = v38;
      *(_DWORD *)(v24 + 24) = v23;
      aBlock[4] = sub_249FFB494;
      aBlock[5] = v24;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_24A007D98;
      aBlock[3] = &block_descriptor_6_0;
      v25 = _Block_copy(aBlock);
      swift_retain();
      sub_24A01EDD8();
      v40 = MEMORY[0x24BEE4AF8];
      sub_249FA2B24((unint64_t *)&qword_2544CA290, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA298);
      sub_249F98C68((unint64_t *)&qword_2544CA2A0, &qword_2544CA298, MEMORY[0x24BEE12C8]);
      v26 = v33;
      sub_24A01F228();
      MEMORY[0x24BD07014](0, v13, v10, v25);
      _Block_release(v25);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v26);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v35);
      result = swift_release();
      v20 = v31;
      v19 = v32;
      goto LABEL_9;
    }
    if (v17 != 2)
      break;
LABEL_9:
    if (v22 != v20)
    {
      v16 = *(_QWORD *)(a3 + 32 + 8 * v22);
      v21 = v22;
      if (v22++ != v19)
        continue;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
  v28 = 6;
  while (1)
  {
    v29 = v28 - 3;
    if (__OFADD__(v28 - 4, 1))
      break;
    if (a4[v28] == v16)
      goto LABEL_8;
    ++v28;
    if (v29 == v17)
      goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_249FF9A7C(uint64_t a1, float a2)
{
  uint64_t result;

  swift_beginAccess();
  if (*(float *)(a1 + 16) > a2)
    a2 = *(float *)(a1 + 16);
  result = swift_beginAccess();
  *(float *)(a1 + 16) = a2;
  return result;
}

uint64_t sub_249FF9AE8(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint8_t *v5;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  double v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  double v28;
  void *v29;
  id v30;
  float v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  void *v35;
  id v36;
  float v37;
  NSObject *v38;
  os_log_type_t v39;
  char v40;
  uint8_t *v41;
  uint64_t result;
  uint64_t v43;
  _QWORD v44[3];
  char v45;
  int *v46;
  uint64_t *v47;
  double *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  __int128 v53;
  __int128 v54;
  double v55;
  int v56;
  int v57;
  uint64_t v58;
  double v59[3];
  uint64_t v60;
  __int16 v61;

  LODWORD(v5) = a4;
  v9 = HIBYTE(a2);
  v58 = MEMORY[0x24BEE4AF8];
  if (HIBYTE(a2) > 0x3F || ((1 << SHIBYTE(a2)) & 0x8000000000000044) == 0)
    LODWORD(v9) = 0;
  v10 = (uint64_t *)(*(_QWORD *)(v4 + 16) + OBJC_IVAR____TtC19VisualUnderstanding12VUIndexStore_parameters);
  swift_beginAccess();
  v11 = *v10;
  if (!*(_QWORD *)(v11 + 16) || (v12 = sub_249F8B0C4(v9), (v13 & 1) == 0))
  {
    v20 = sub_24A01ED90();
    v21 = sub_24A01F0E4();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v22 = 16777472;
      LOBYTE(v59[0]) = v9;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v20, v21, "Cannot obtain parameters for type %hhu", v22, 5u);
      MEMORY[0x24BD07950](v22, -1, -1);
    }

    v23 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    return v23;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v12);
  v57 = 1065336439;
  v56 = 1064346583;
  v51 = a3;
  v55 = *(double *)&a3;
  v15 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v50 = v14;
  swift_retain();
  v16 = (void *)sub_24A01EE44();
  v17 = objc_msgSend(v15, sel_initWithSuiteName_, v16);

  if (v17)
  {
    v18 = (void *)sub_24A01EE44();
    v19 = objc_msgSend(v17, sel_objectForKey_, v18);

    if (v19)
    {
      sub_24A01F21C();
      swift_unknownObjectRelease();
    }
    else
    {
      v53 = 0u;
      v54 = 0u;
    }
    sub_249F98C10((uint64_t)&v53, (uint64_t)v59, &qword_2544CAF40);
    v49 = (int)v5;
    if (v60)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v24 = v52;
        v25 = sub_24A01ED90();
        v26 = sub_24A01F0E4();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v27 = 134217984;
          v59[0] = v24;
          sub_24A01F1F8();
          _os_log_impl(&dword_249F70000, v25, v26, "Overriding number of neighbors to %ld", v27, 0xCu);
          MEMORY[0x24BD07950](v27, -1, -1);
        }

        v28 = *(double *)&v51;
        if (*(uint64_t *)&v24 < v51)
          v28 = v24;
        *(double *)&v51 = v28;
        v55 = v28;
      }
    }
    else
    {
      sub_249F990A0((uint64_t)v59, &qword_2544CAF40);
    }
    v29 = (void *)sub_24A01EE44();
    v30 = objc_msgSend(v17, sel_objectForKey_, v29);

    if (v30)
    {
      sub_24A01F21C();
      swift_unknownObjectRelease();
    }
    else
    {
      v53 = 0u;
      v54 = 0u;
    }
    sub_249F98C10((uint64_t)&v53, (uint64_t)v59, &qword_2544CAF40);
    if (v60)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v31 = *(float *)&v52;
        v32 = sub_24A01ED90();
        v33 = sub_24A01F0E4();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v34 = 134217984;
          v59[0] = v31;
          sub_24A01F1F8();
          _os_log_impl(&dword_249F70000, v32, v33, "Overriding duplicate threshold to %f", v34, 0xCu);
          MEMORY[0x24BD07950](v34, -1, -1);
        }

        v57 = LODWORD(v31);
      }
    }
    else
    {
      sub_249F990A0((uint64_t)v59, &qword_2544CAF40);
    }
    v35 = (void *)sub_24A01EE44();
    v36 = objc_msgSend(v17, sel_objectForKey_, v35);

    if (v36)
    {
      sub_24A01F21C();
      swift_unknownObjectRelease();
    }
    else
    {
      v53 = 0u;
      v54 = 0u;
    }
    LOBYTE(v5) = v49;
    sub_249F98C10((uint64_t)&v53, (uint64_t)v59, &qword_2544CAF40);
    if (v60)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v37 = *(float *)&v52;
        v38 = sub_24A01ED90();
        v39 = sub_24A01F0E4();
        if (os_log_type_enabled(v38, v39))
        {
          v40 = v49;
          v5 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v5 = 134217984;
          v59[0] = v37;
          sub_24A01F1F8();
          _os_log_impl(&dword_249F70000, v38, v39, "Overriding modality threshold to %f", v5, 0xCu);
          v41 = v5;
          LOBYTE(v5) = v40;
          MEMORY[0x24BD07950](v41, -1, -1);
        }

        v56 = LODWORD(v37);
      }
      else
      {

      }
    }
    else
    {

      sub_249F990A0((uint64_t)v59, &qword_2544CAF40);
    }
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC38);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_24A0208B0;
  *(_QWORD *)(result + 32) = a1;
  LOBYTE(v59[0]) = 2;
  v59[2] = 0.0;
  v60 = 0;
  *(_QWORD *)&v59[1] = result;
  v61 = 513;
  if ((unint64_t)(v51 - 0x2000000000000000) >> 62 == 3)
  {
    MEMORY[0x24BDAC7A8](result);
    v44[2] = &v56;
    v45 = v5 & 1;
    v46 = &v57;
    v47 = &v58;
    v48 = &v55;
    sub_24A0014C0(v9, (uint64_t)v59, 1, a2, 0, v43, 4, v50, 1, (uint64_t)sub_249FFB420, (uint64_t)v44);
    swift_bridgeObjectRelease();
    swift_release();
    return v58;
  }
  __break(1u);
  return result;
}

uint64_t sub_249FFA298(uint64_t a1, uint64_t a2, uint64_t a3, float *a4, char a5, float *a6, _QWORD **a7, _QWORD *a8)
{
  uint64_t v8;
  uint64_t v10;
  float v12;
  uint64_t v17;
  uint64_t v18;
  float v19;
  _QWORD *v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;

  v8 = *(_QWORD *)(a3 + 16);
  if (v8)
  {
    v10 = *(_QWORD *)(a2 + 16);
    if (v10)
    {
      v12 = *(float *)(a2 + 32);
      if (v12 >= *a4)
      {
        v17 = *(_QWORD *)(a3 + 32);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v18 = 0;
        v26 = v10 - 1;
        v27 = v8 - 1;
        v19 = 1.0;
        v25 = a8;
        while ((a5 & 1) == 0)
        {
          v20 = *a7;
          if (v12 < (float)(v19 * *a6))
            goto LABEL_8;
LABEL_13:
          if (v20[2] != *a8 && v27 != v18 && v26 != v18)
          {
            v17 = *(_QWORD *)(a3 + 8 * v18 + 40);
            v19 = v12;
            v12 = *(float *)(a2 + 4 * v18++ + 36);
            if (v12 >= *a4)
              continue;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 1;
        }
        v20 = *a7;
LABEL_8:
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *a7 = v20;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v20 = sub_249F89B7C(0, v20[2] + 1, 1, v20);
          *a7 = v20;
        }
        v23 = v20[2];
        v22 = v20[3];
        if (v23 >= v22 >> 1)
          v20 = sub_249F89B7C((_QWORD *)(v22 > 1), v23 + 1, 1, v20);
        v20[2] = v23 + 1;
        v20[v23 + 4] = v17;
        *a7 = v20;
        a8 = v25;
        goto LABEL_13;
      }
    }
  }
  return 1;
}

id sub_249FFA448(void *a1)
{
  return objc_msgSend(a1, sel_setUsingVectorStore_, 1);
}

uint64_t sub_249FFA458(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t i;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;

  v4 = sub_24A01EBA4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v25 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  result = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = 0;
  v16 = a1 + 56;
  v17 = 1 << *(_BYTE *)(a1 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(a1 + 56);
  v25 = (unint64_t)(v17 + 63) >> 6;
  v26 = a2;
  if (!v19)
    goto LABEL_5;
LABEL_4:
  v20 = __clz(__rbit64(v19));
  v19 &= v19 - 1;
  for (i = v20 | (v15 << 6); ; i = __clz(__rbit64(v23)) + (v15 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v14, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v5 + 72) * i, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v14, 1, v4) == 1)
      goto LABEL_25;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v14, v4);
    sub_249F8BE04((uint64_t)v10, v8);
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    if (v19)
      goto LABEL_4;
LABEL_5:
    v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v22 >= v25)
      goto LABEL_24;
    v23 = *(_QWORD *)(v16 + 8 * v22);
    ++v15;
    if (!v23)
    {
      v15 = v22 + 1;
      if (v22 + 1 >= v25)
        goto LABEL_24;
      v23 = *(_QWORD *)(v16 + 8 * v15);
      if (!v23)
      {
        v15 = v22 + 2;
        if (v22 + 2 >= v25)
          goto LABEL_24;
        v23 = *(_QWORD *)(v16 + 8 * v15);
        if (!v23)
        {
          v15 = v22 + 3;
          if (v22 + 3 >= v25)
            goto LABEL_24;
          v23 = *(_QWORD *)(v16 + 8 * v15);
          if (!v23)
            break;
        }
      }
    }
LABEL_20:
    v19 = (v23 - 1) & v23;
  }
  v24 = v22 + 4;
  if (v24 >= v25)
  {
LABEL_24:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v14, 1, 1, v4);
LABEL_25:
    swift_release();
    return v26;
  }
  v23 = *(_QWORD *)(v16 + 8 * v24);
  if (v23)
  {
    v15 = v24;
    goto LABEL_20;
  }
  while (1)
  {
    v15 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v15 >= v25)
      goto LABEL_24;
    v23 = *(_QWORD *)(v16 + 8 * v15);
    ++v24;
    if (v23)
      goto LABEL_20;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_249FFA6F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, _BYTE *a8, _QWORD *a9, void (*a10)(float))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t, uint64_t);
  char v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  BOOL v44;
  int64_t v45;
  unint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t, uint64_t);
  void (*v75)(uint64_t, uint64_t, uint64_t, uint64_t);
  int v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  int64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;

  v11 = v10;
  v63 = a8;
  v77 = a7;
  v76 = a6;
  v64 = a4;
  v16 = sub_24A01EBA4();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v83 = (char *)&v59 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v82 = (uint64_t)&v59 - v24;
  result = MEMORY[0x24BDAC7A8](v23);
  if (__OFADD__(a2, a3))
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (*(_QWORD *)(a1 + 16) >= a2 + a3)
    v27 = a2 + a3;
  else
    v27 = *(_QWORD *)(a1 + 16);
  if (v27 < a2)
    goto LABEL_53;
  if (a2 < 0)
    goto LABEL_54;
  v66 = (char *)&v59 - v26;
  v62 = v27 - a2;
  if (v27 != a2)
  {
    v60 = a1 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    v72 = OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_embeddingRevision;
    v61 = v27;
    result = swift_bridgeObjectRetain_n();
    v32 = v61;
    v71 = xmmword_24A020F20;
    v70 = MEMORY[0x24BEE4AE0] + 8;
    v67 = v17;
    v78 = v19;
    v59 = a1;
    while (a2 < v32)
    {
      v33 = *(_QWORD *)(v17 + 72);
      v65 = a2;
      v34 = v66;
      v74 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
      v74(v66, v60 + v33 * a2, v16);
      v75 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
      v75((uint64_t)v34, 0, 1, v16);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v34, 1, v16) == 1)
        goto LABEL_10;
      result = (*(uint64_t (**)(char *, char *, uint64_t))(v17 + 32))(v19, v34, v16);
      if (*(_QWORD *)(v64 + 16))
      {
        result = sub_249F8B20C((uint64_t)v19);
        v35 = MEMORY[0x24BEE4B08];
        v36 = v75;
        if ((v37 & 1) != 0)
        {
          v35 = *(_QWORD *)(*(_QWORD *)(v64 + 56) + 8 * result);
          result = swift_bridgeObjectRetain();
        }
      }
      else
      {
        v35 = MEMORY[0x24BEE4B08];
        v36 = v75;
      }
      v38 = 0;
      ++v65;
      v39 = *(_QWORD *)(v35 + 56);
      v68 = v35 + 56;
      v40 = 1 << *(_BYTE *)(v35 + 32);
      if (v40 < 64)
        v41 = ~(-1 << v40);
      else
        v41 = -1;
      v42 = v41 & v39;
      v69 = (unint64_t)(v40 + 63) >> 6;
      v73 = v35;
      if (v42)
      {
LABEL_27:
        v80 = v38;
        v81 = v11;
        v79 = (v42 - 1) & v42;
        v43 = __clz(__rbit64(v42)) | (v38 << 6);
        goto LABEL_39;
      }
      while (1)
      {
        v44 = __OFADD__(v38, 1);
        v45 = v38 + 1;
        if (v44)
        {
          __break(1u);
          goto LABEL_52;
        }
        if (v45 >= v69)
          break;
        v46 = *(_QWORD *)(v68 + 8 * v45);
        v17 = v67;
        v19 = v78;
        if (!v46)
        {
          v47 = v45 + 1;
          if (v45 + 1 >= v69)
            goto LABEL_47;
          v46 = *(_QWORD *)(v68 + 8 * v47);
          if (!v46)
          {
            v47 = v45 + 2;
            if (v45 + 2 >= v69)
              goto LABEL_47;
            v46 = *(_QWORD *)(v68 + 8 * v47);
            if (!v46)
            {
              v47 = v45 + 3;
              if (v45 + 3 >= v69)
                goto LABEL_47;
              v46 = *(_QWORD *)(v68 + 8 * v47);
              if (!v46)
              {
                while (1)
                {
                  v45 = v47 + 1;
                  if (__OFADD__(v47, 1))
                    goto LABEL_55;
                  if (v45 >= v69)
                    goto LABEL_47;
                  v46 = *(_QWORD *)(v68 + 8 * v45);
                  ++v47;
                  if (v46)
                    goto LABEL_38;
                }
              }
            }
          }
          v45 = v47;
        }
LABEL_38:
        v80 = v45;
        v81 = v11;
        v79 = (v46 - 1) & v46;
        v43 = __clz(__rbit64(v46)) + (v45 << 6);
LABEL_39:
        v48 = *(_QWORD *)(*(_QWORD *)(v35 + 48) + 8 * v43);
        v49 = *(_QWORD *)(a5 + 16);
        v50 = *(_QWORD *)(v77 + v72);
        v51 = v82;
        v36(v82, 1, 1, v16);
        v52 = (uint64_t)v83;
        v74(v83, (uint64_t)v78, v16);
        v53 = ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v36)(v52, 0, 1, v16);
        MEMORY[0x24BDAC7A8](v53);
        *(&v59 - 20) = 0;
        *((_BYTE *)&v59 - 152) = 1;
        *((_WORD *)&v59 - 75) = -1;
        *(&v59 - 18) = v49;
        *(&v59 - 17) = v48;
        *((_BYTE *)&v59 - 128) = 0;
        v54 = v71;
        *(_OWORD *)(&v59 - 15) = v71;
        *(_OWORD *)(&v59 - 13) = v54;
        *((_BYTE *)&v59 - 88) = v76;
        *(&v59 - 10) = v51;
        *(&v59 - 9) = v52;
        *((_BYTE *)&v59 - 64) = 3;
        *((_DWORD *)&v59 - 15) = 0;
        *((_BYTE *)&v59 - 56) = 1;
        *((_DWORD *)&v59 - 13) = 0;
        *((_WORD *)&v59 - 24) = 257;
        *(&v59 - 5) = v50;
        *((_BYTE *)&v59 - 32) = 0;
        *(&v59 - 3) = 0;
        *((_BYTE *)&v59 - 16) = 1;
        v56 = v55;
        v57 = v81;
        sub_24A01F180();
        v11 = v57;
        if (v57)
        {
          swift_bridgeObjectRelease();

          sub_249F990A0((uint64_t)v83, &qword_2544CAD70);
          sub_249F990A0(v82, &qword_2544CAD70);
          swift_release();
          (*(void (**)(char *, uint64_t))(v67 + 8))(v78, v16);
          return swift_bridgeObjectRelease();
        }

        v58 = *(id *)(v49 + 16);
        sub_24A01F180();

        sub_249F990A0((uint64_t)v83, &qword_2544CAD70);
        result = sub_249F990A0(v82, &qword_2544CAD70);
        v36 = v75;
        v35 = v73;
        v42 = v79;
        v38 = v80;
        if (v79)
          goto LABEL_27;
      }
      v17 = v67;
      v19 = v78;
LABEL_47:
      swift_release();
      result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      a2 = v65;
      v32 = v61;
      v28 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v75;
      if (v65 == v61)
        goto LABEL_9;
    }
    goto LABEL_56;
  }
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  swift_bridgeObjectRetain_n();
LABEL_9:
  v28(v66, 1, 1, v16);
LABEL_10:
  swift_bridgeObjectRelease();
  *v63 = 1;
  sub_249FDF3A0();
  if (v11)
    return swift_bridgeObjectRelease();
  result = swift_beginAccess();
  if (!__OFADD__(*a9, v62))
  {
    *a9 += v62;
    v29 = sub_24A01ED90();
    v30 = sub_24A01F0CC();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v31 = 134217984;
      swift_beginAccess();
      v84 = *a9;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v29, v30, "Added %ld assets, flushing...", v31, 0xCu);
      MEMORY[0x24BD07950](v31, -1, -1);
    }

    if (a10)
      a10(0.0);
    return swift_bridgeObjectRelease();
  }
LABEL_57:
  __break(1u);
  return result;
}

id sub_249FFAEFC(void *a1)
{
  return objc_msgSend(a1, sel_setStaleObservations_, 1);
}

uint64_t sub_249FFAF0C@<X0>(float *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, double *a4@<X3>, _BYTE *a5@<X4>, uint64_t (*a6)(uint64_t, float)@<X5>, _BYTE *a7@<X8>, double a8@<D0>)
{
  float v15;
  float v16;
  double Current;
  char v18;
  uint64_t v19;
  uint64_t result;

  v15 = (float)a2 * 0.5;
  swift_beginAccess();
  v16 = (float)(v15 / (float)*a3) * 0.95;
  swift_beginAccess();
  *a1 = *a1 + v16;
  Current = CFAbsoluteTimeGetCurrent();
  swift_beginAccess();
  if (Current - *a4 > a8)
  {
    v18 = 1;
    swift_beginAccess();
    *a4 = Current;
    if (a6)
    {
      v19 = swift_beginAccess();
      v18 = a6(v19, fminf(*a1, 1.0));
    }
    swift_beginAccess();
    *a5 = v18 & 1;
  }
  result = swift_beginAccess();
  *a7 = *a5;
  return result;
}

id sub_249FFB084(void *a1)
{
  return objc_msgSend(a1, sel_setVersion_, 10);
}

uint64_t sub_249FFB094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_signposter;
  v2 = sub_24A01ED48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  swift_release();
  v3 = v0 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_logger;
  v4 = sub_24A01EDA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_249FFB154()
{
  return type metadata accessor for VUIndex();
}

uint64_t type metadata accessor for VUIndex()
{
  uint64_t result;

  result = qword_2544CC1A0;
  if (!qword_2544CC1A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_249FFB198()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24A01ED48();
  if (v1 <= 0x3F)
  {
    result = sub_24A01EDA8();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_249FFB248(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 56;
  v6 = 1 << *(_BYTE *)(result + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(result + 56);
  v9 = (unint64_t)(v6 + 63) >> 6;
  v10 = a2 + 56;
  do
  {
LABEL_7:
    if (v8)
    {
      v11 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v12 = v11 | (v4 << 6);
      goto LABEL_25;
    }
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
LABEL_34:
      __break(1u);
      return result;
    }
    if (v13 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v13);
    ++v4;
    if (v14)
      goto LABEL_24;
    v4 = v13 + 1;
    if (v13 + 1 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v4);
    if (v14)
      goto LABEL_24;
    v4 = v13 + 2;
    if (v13 + 2 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v4);
    if (v14)
      goto LABEL_24;
    v4 = v13 + 3;
    if (v13 + 3 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v4);
    if (v14)
      goto LABEL_24;
    v15 = v13 + 4;
    if (v15 >= v9)
      return 1;
    v14 = *(_QWORD *)(v5 + 8 * v15);
    if (!v14)
    {
      while (1)
      {
        v4 = v15 + 1;
        if (__OFADD__(v15, 1))
          goto LABEL_34;
        if (v4 >= v9)
          return 1;
        v14 = *(_QWORD *)(v5 + 8 * v4);
        ++v15;
        if (v14)
          goto LABEL_24;
      }
    }
    v4 = v15;
LABEL_24:
    v8 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v4 << 6);
LABEL_25:
    v16 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v12);
    result = sub_24A01F4E0();
    v17 = -1 << *(_BYTE *)(a2 + 32);
    v18 = result & ~v17;
    if (((*(_QWORD *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
      return 0;
    v19 = *(_QWORD *)(a2 + 48);
  }
  while (*(_QWORD *)(v19 + 8 * v18) == v16);
  v20 = ~v17;
  while (1)
  {
    v18 = (v18 + 1) & v20;
    if (((*(_QWORD *)(v10 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
      return 0;
    if (*(_QWORD *)(v19 + 8 * v18) == v16)
      goto LABEL_7;
  }
}

uint64_t sub_249FFB420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_249FFA298(a1, a2, a3, *(float **)(v3 + 16), *(_BYTE *)(v3 + 24), *(float **)(v3 + 32), *(_QWORD ***)(v3 + 40), *(_QWORD **)(v3 + 48));
}

uint64_t sub_249FFB434()
{
  return swift_deallocObject();
}

uint64_t sub_249FFB444(void *a1)
{
  uint64_t v1;

  return sub_249FF96C0(a1, *(_BYTE **)(v1 + 16));
}

uint64_t sub_249FFB44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_249FF9788(a1, a2, a3, *(_QWORD **)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_249FFB470()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_249FFB494()
{
  uint64_t v0;

  return sub_249FF9A7C(*(_QWORD *)(v0 + 16), *(float *)(v0 + 24));
}

uint64_t sub_249FFB4A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_249FFB4C4()
{
  return swift_deallocObject();
}

uint64_t sub_249FFB4D4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_249FFB4F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_249FF8D98(a1, a2, a3, v3[2], v3[3], v3[4]);
}

uint64_t sub_249FFB504(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned __int8 *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned int v30;
  uint64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  char v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  unsigned int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unsigned __int8 *__dst;

  v3 = a1[1];
  result = sub_24A01F438();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_136;
    if ((unint64_t)v3 >= 2)
    {
      v85 = 0;
      v86 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v88 = *(unsigned __int8 *)(v86 + 16 * i);
        v89 = v85;
        do
        {
          if (v88 >= *(unsigned __int8 *)(v86 + v89))
            break;
          if (!v86)
            goto LABEL_140;
          v90 = v86 + v89;
          v91 = *(_QWORD *)(v86 + v89 + 24);
          *(_OWORD *)(v86 + v89 + 16) = *(_OWORD *)(v86 + v89);
          *(_BYTE *)v90 = v88;
          *(_QWORD *)(v90 + 8) = v91;
          v89 -= 16;
        }
        while (v89 != -16);
        v85 += 16;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_145;
  v6 = result;
  v101 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (unsigned __int8 *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_102:
      v92 = v12;
      v103 = v9;
      if (v13 >= 2)
      {
        v93 = *v101;
        do
        {
          v94 = v13 - 2;
          if (v13 < 2)
            goto LABEL_131;
          if (!v93)
            goto LABEL_144;
          v95 = v92;
          v96 = *(_QWORD *)&v92[16 * v94 + 32];
          v97 = *(_QWORD *)&v92[16 * v13 + 24];
          sub_249FFC2D8((unsigned __int8 *)(v93 + 16 * v96), (unsigned __int8 *)(v93 + 16 * *(_QWORD *)&v92[16 * v13 + 16]), v93 + 16 * v97, __dst);
          if (v1)
            break;
          if (v97 < v96)
            goto LABEL_132;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v95 = sub_24A012ED4((uint64_t)v95);
          if (v94 >= *((_QWORD *)v95 + 2))
            goto LABEL_133;
          v98 = &v95[16 * v94 + 32];
          *(_QWORD *)v98 = v96;
          *((_QWORD *)v98 + 1) = v97;
          v99 = *((_QWORD *)v95 + 2);
          if (v13 > v99)
            goto LABEL_134;
          memmove(&v95[16 * v13 + 16], &v95[16 * v13 + 32], 16 * (v99 - v13));
          v92 = v95;
          *((_QWORD *)v95 + 2) = v99 - 1;
          v13 = v99 - 1;
        }
        while (v99 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v103 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF880);
    v8 = sub_24A01EFC4();
    *(_QWORD *)(v8 + 16) = v7;
    v103 = v8;
    __dst = (unsigned __int8 *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v102 = *a1 + 32;
  v100 = *a1 - 16;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v104 = v6;
  v105 = v3;
  v106 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(unsigned __int8 *)(v11 + 16 * v10);
      v16 = 16 * v14;
      v17 = *(unsigned __int8 *)(v11 + 16 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v18 = (unsigned __int8 *)(v102 + 16 * v14);
        v19 = v15;
        while (1)
        {
          v21 = *v18;
          v18 += 16;
          v20 = v21;
          if (v15 < v17 == v21 >= v19)
            break;
          ++v10;
          v19 = v20;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14)
          goto LABEL_137;
        if (v14 < v10)
        {
          v22 = 16 * v10;
          v23 = v10;
          v24 = v14;
          do
          {
            if (v24 != --v23)
            {
              if (!v11)
                goto LABEL_143;
              v25 = v11 + v22;
              v26 = *(_BYTE *)(v11 + v16);
              v27 = *(_QWORD *)(v11 + v16 + 8);
              *(_OWORD *)(v11 + v16) = *(_OWORD *)(v11 + v22 - 16);
              *(_BYTE *)(v25 - 16) = v26;
              *(_QWORD *)(v25 - 8) = v27;
            }
            ++v24;
            v22 -= 16;
            v16 += 16;
          }
          while (v24 < v23);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_135;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v28 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_138;
    if (v28 >= v3)
      v28 = v3;
    if (v28 < v14)
      break;
    if (v10 != v28)
    {
      v29 = (unsigned __int8 *)(v100 + 16 * v10);
      do
      {
        v30 = *(unsigned __int8 *)(v11 + 16 * v10);
        v31 = v14;
        v32 = v29;
        do
        {
          if (v30 >= *v32)
            break;
          if (!v11)
            goto LABEL_141;
          v33 = *((_QWORD *)v32 + 3);
          *((_OWORD *)v32 + 1) = *(_OWORD *)v32;
          *v32 = v30;
          *((_QWORD *)v32 + 1) = v33;
          v32 -= 16;
          ++v31;
        }
        while (v10 != v31);
        ++v10;
        v29 += 16;
      }
      while (v10 != v28);
      v10 = v28;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_130;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_24A012ABC(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v35 = *((_QWORD *)v12 + 2);
    v34 = *((_QWORD *)v12 + 3);
    v13 = v35 + 1;
    v11 = v106;
    if (v35 >= v34 >> 1)
    {
      v84 = sub_24A012ABC((char *)(v34 > 1), v35 + 1, 1, v12);
      v11 = v106;
      v12 = v84;
    }
    *((_QWORD *)v12 + 2) = v13;
    v36 = v12 + 32;
    v37 = &v12[16 * v35 + 32];
    *(_QWORD *)v37 = v14;
    *((_QWORD *)v37 + 1) = v10;
    if (v35)
    {
      while (1)
      {
        v38 = v13 - 1;
        if (v13 >= 4)
        {
          v43 = &v36[16 * v13];
          v44 = *((_QWORD *)v43 - 8);
          v45 = *((_QWORD *)v43 - 7);
          v49 = __OFSUB__(v45, v44);
          v46 = v45 - v44;
          if (v49)
            goto LABEL_119;
          v48 = *((_QWORD *)v43 - 6);
          v47 = *((_QWORD *)v43 - 5);
          v49 = __OFSUB__(v47, v48);
          v41 = v47 - v48;
          v42 = v49;
          if (v49)
            goto LABEL_120;
          v50 = v13 - 2;
          v51 = &v36[16 * v13 - 32];
          v53 = *(_QWORD *)v51;
          v52 = *((_QWORD *)v51 + 1);
          v49 = __OFSUB__(v52, v53);
          v54 = v52 - v53;
          if (v49)
            goto LABEL_122;
          v49 = __OFADD__(v41, v54);
          v55 = v41 + v54;
          if (v49)
            goto LABEL_125;
          if (v55 >= v46)
          {
            v73 = &v36[16 * v38];
            v75 = *(_QWORD *)v73;
            v74 = *((_QWORD *)v73 + 1);
            v49 = __OFSUB__(v74, v75);
            v76 = v74 - v75;
            if (v49)
              goto LABEL_129;
            v66 = v41 < v76;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v67 = *((_QWORD *)v12 + 4);
            v68 = *((_QWORD *)v12 + 5);
            v49 = __OFSUB__(v68, v67);
            v60 = v68 - v67;
            v61 = v49;
            goto LABEL_77;
          }
          v40 = *((_QWORD *)v12 + 4);
          v39 = *((_QWORD *)v12 + 5);
          v49 = __OFSUB__(v39, v40);
          v41 = v39 - v40;
          v42 = v49;
        }
        if ((v42 & 1) != 0)
          goto LABEL_121;
        v50 = v13 - 2;
        v56 = &v36[16 * v13 - 32];
        v58 = *(_QWORD *)v56;
        v57 = *((_QWORD *)v56 + 1);
        v59 = __OFSUB__(v57, v58);
        v60 = v57 - v58;
        v61 = v59;
        if (v59)
          goto LABEL_124;
        v62 = &v36[16 * v38];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v49 = __OFSUB__(v63, v64);
        v65 = v63 - v64;
        if (v49)
          goto LABEL_127;
        if (__OFADD__(v60, v65))
          goto LABEL_128;
        if (v60 + v65 >= v41)
        {
          v66 = v41 < v65;
LABEL_83:
          if (v66)
            v38 = v50;
          goto LABEL_85;
        }
LABEL_77:
        if ((v61 & 1) != 0)
          goto LABEL_123;
        v69 = &v36[16 * v38];
        v71 = *(_QWORD *)v69;
        v70 = *((_QWORD *)v69 + 1);
        v49 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v49)
          goto LABEL_126;
        if (v72 < v60)
          goto LABEL_15;
LABEL_85:
        v77 = v38 - 1;
        if (v38 - 1 >= v13)
        {
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
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v11)
          goto LABEL_142;
        v78 = v12;
        v79 = &v36[16 * v77];
        v80 = *(_QWORD *)v79;
        v81 = &v36[16 * v38];
        v82 = *((_QWORD *)v81 + 1);
        sub_249FFC2D8((unsigned __int8 *)(v11 + 16 * *(_QWORD *)v79), (unsigned __int8 *)(v11 + 16 * *(_QWORD *)v81), v11 + 16 * v82, __dst);
        if (v1)
          goto LABEL_93;
        if (v82 < v80)
          goto LABEL_116;
        if (v38 > *((_QWORD *)v78 + 2))
          goto LABEL_117;
        *(_QWORD *)v79 = v80;
        *(_QWORD *)&v36[16 * v77 + 8] = v82;
        v83 = *((_QWORD *)v78 + 2);
        if (v38 >= v83)
          goto LABEL_118;
        v12 = v78;
        v13 = v83 - 1;
        memmove(&v36[16 * v38], v81 + 16, 16 * (v83 - 1 - v38));
        *((_QWORD *)v78 + 2) = v83 - 1;
        v11 = v106;
        if (v83 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v104;
    v3 = v105;
    if (v10 >= v105)
    {
      v9 = v103;
      goto LABEL_102;
    }
  }
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
  result = sub_24A01F3B4();
  __break(1u);
  return result;
}

uint64_t sub_249FFBBE8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  float v17;
  float *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  float *v28;
  float *v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  char v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  uint64_t v89;
  float v90;
  uint64_t v91;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_24A01F438();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_141;
    if ((unint64_t)v3 >= 2)
    {
      v84 = *a1;
      v85 = *a1 + 16;
      v86 = -1;
      for (i = 1; i != v3; ++i)
      {
        v88 = v86;
        v89 = v85;
        do
        {
          v90 = *(float *)(v89 + 8);
          if (*(float *)(v89 - 8) >= v90)
            break;
          if (!v84)
            goto LABEL_145;
          v91 = *(_QWORD *)v89;
          *(_OWORD *)v89 = *(_OWORD *)(v89 - 16);
          *(float *)(v89 - 8) = v90;
          *(_QWORD *)(v89 - 16) = v91;
          v89 -= 16;
        }
        while (!__CFADD__(v88++, 1));
        v85 += 16;
        --v86;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_150;
  v6 = result;
  v101 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_107:
      v93 = v12;
      v104 = v9;
      if (v13 >= 2)
      {
        v94 = *v101;
        do
        {
          v95 = v13 - 2;
          if (v13 < 2)
            goto LABEL_136;
          if (!v94)
            goto LABEL_149;
          v96 = v93;
          v97 = *(_QWORD *)&v93[16 * v95 + 32];
          v98 = *(_QWORD *)&v93[16 * v13 + 24];
          sub_249F90E3C((char *)(v94 + 16 * v97), (char *)(v94 + 16 * *(_QWORD *)&v93[16 * v13 + 16]), v94 + 16 * v98, __dst);
          if (v1)
            break;
          if (v98 < v97)
            goto LABEL_137;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v96 = sub_24A012ED4((uint64_t)v96);
          if (v95 >= *((_QWORD *)v96 + 2))
            goto LABEL_138;
          v99 = &v96[16 * v95 + 32];
          *(_QWORD *)v99 = v97;
          *((_QWORD *)v99 + 1) = v98;
          v100 = *((_QWORD *)v96 + 2);
          if (v13 > v100)
            goto LABEL_139;
          memmove(&v96[16 * v13 + 16], &v96[16 * v13 + 32], 16 * (v100 - v13));
          v93 = v96;
          *((_QWORD *)v96 + 2) = v100 - 1;
          v13 = v100 - 1;
        }
        while (v100 > 2);
      }
LABEL_97:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFB38);
    v8 = sub_24A01EFC4();
    *(_QWORD *)(v8 + 16) = v7;
    v104 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v102 = *a1 + 40;
  v103 = *a1 + 8;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v105 = v6;
  v106 = v3;
  v107 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(float *)(v103 + 16 * v10);
      v16 = 16 * v14;
      v17 = *(float *)(v103 + 16 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v18 = (float *)(v102 + 16 * v14);
        while (v17 < v15 != *(v18 - 4) >= *v18)
        {
          ++v10;
          v18 += 4;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v17 < v15)
      {
        if (v10 < v14)
          goto LABEL_142;
        if (v14 < v10)
        {
          v19 = 16 * v10 - 16;
          v20 = v10;
          v21 = v14;
          do
          {
            if (v21 != --v20)
            {
              if (!v11)
                goto LABEL_148;
              v23 = (_OWORD *)(v11 + v16);
              v24 = (_OWORD *)(v11 + v19);
              v25 = *(_QWORD *)(v11 + v16);
              v26 = *(_DWORD *)(v11 + v16 + 8);
              if (v16 != v19 || v23 >= v24 + 1)
                *v23 = *v24;
              v22 = v11 + v19;
              *(_QWORD *)v22 = v25;
              *(_DWORD *)(v22 + 8) = v26;
            }
            ++v21;
            v19 -= 16;
            v16 += 16;
          }
          while (v21 < v20);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_50;
    if (__OFSUB__(v10, v14))
      goto LABEL_140;
    if (v10 - v14 >= v6)
      goto LABEL_50;
    v27 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_143;
    if (v27 >= v3)
      v27 = v3;
    if (v27 < v14)
      break;
    if (v10 != v27)
    {
      v28 = (float *)(v11 + 16 * v10);
      do
      {
        v29 = v28;
        v30 = v14;
        do
        {
          v31 = v29[2];
          if (*(v29 - 2) >= v31)
            break;
          if (!v11)
            goto LABEL_146;
          v32 = *(_QWORD *)v29;
          *(_OWORD *)v29 = *((_OWORD *)v29 - 1);
          *(v29 - 2) = v31;
          *((_QWORD *)v29 - 2) = v32;
          v29 -= 4;
          ++v30;
        }
        while (v10 != v30);
        ++v10;
        v28 += 4;
      }
      while (v10 != v27);
      v10 = v27;
    }
LABEL_50:
    if (v10 < v14)
      goto LABEL_135;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_24A012ABC(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v34 = *((_QWORD *)v12 + 2);
    v33 = *((_QWORD *)v12 + 3);
    v13 = v34 + 1;
    v11 = v107;
    if (v34 >= v33 >> 1)
    {
      v83 = sub_24A012ABC((char *)(v33 > 1), v34 + 1, 1, v12);
      v11 = v107;
      v12 = v83;
    }
    *((_QWORD *)v12 + 2) = v13;
    v35 = v12 + 32;
    v36 = &v12[16 * v34 + 32];
    *(_QWORD *)v36 = v14;
    *((_QWORD *)v36 + 1) = v10;
    if (v34)
    {
      while (1)
      {
        v37 = v13 - 1;
        if (v13 >= 4)
        {
          v42 = &v35[16 * v13];
          v43 = *((_QWORD *)v42 - 8);
          v44 = *((_QWORD *)v42 - 7);
          v48 = __OFSUB__(v44, v43);
          v45 = v44 - v43;
          if (v48)
            goto LABEL_124;
          v47 = *((_QWORD *)v42 - 6);
          v46 = *((_QWORD *)v42 - 5);
          v48 = __OFSUB__(v46, v47);
          v40 = v46 - v47;
          v41 = v48;
          if (v48)
            goto LABEL_125;
          v49 = v13 - 2;
          v50 = &v35[16 * v13 - 32];
          v52 = *(_QWORD *)v50;
          v51 = *((_QWORD *)v50 + 1);
          v48 = __OFSUB__(v51, v52);
          v53 = v51 - v52;
          if (v48)
            goto LABEL_127;
          v48 = __OFADD__(v40, v53);
          v54 = v40 + v53;
          if (v48)
            goto LABEL_130;
          if (v54 >= v45)
          {
            v72 = &v35[16 * v37];
            v74 = *(_QWORD *)v72;
            v73 = *((_QWORD *)v72 + 1);
            v48 = __OFSUB__(v73, v74);
            v75 = v73 - v74;
            if (v48)
              goto LABEL_134;
            v65 = v40 < v75;
            goto LABEL_87;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v66 = *((_QWORD *)v12 + 4);
            v67 = *((_QWORD *)v12 + 5);
            v48 = __OFSUB__(v67, v66);
            v59 = v67 - v66;
            v60 = v48;
            goto LABEL_81;
          }
          v39 = *((_QWORD *)v12 + 4);
          v38 = *((_QWORD *)v12 + 5);
          v48 = __OFSUB__(v38, v39);
          v40 = v38 - v39;
          v41 = v48;
        }
        if ((v41 & 1) != 0)
          goto LABEL_126;
        v49 = v13 - 2;
        v55 = &v35[16 * v13 - 32];
        v57 = *(_QWORD *)v55;
        v56 = *((_QWORD *)v55 + 1);
        v58 = __OFSUB__(v56, v57);
        v59 = v56 - v57;
        v60 = v58;
        if (v58)
          goto LABEL_129;
        v61 = &v35[16 * v37];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        v48 = __OFSUB__(v62, v63);
        v64 = v62 - v63;
        if (v48)
          goto LABEL_132;
        if (__OFADD__(v59, v64))
          goto LABEL_133;
        if (v59 + v64 >= v40)
        {
          v65 = v40 < v64;
LABEL_87:
          if (v65)
            v37 = v49;
          goto LABEL_89;
        }
LABEL_81:
        if ((v60 & 1) != 0)
          goto LABEL_128;
        v68 = &v35[16 * v37];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v48 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v48)
          goto LABEL_131;
        if (v71 < v59)
          goto LABEL_15;
LABEL_89:
        v76 = v37 - 1;
        if (v37 - 1 >= v13)
        {
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
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
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
          goto LABEL_144;
        }
        if (!v11)
          goto LABEL_147;
        v77 = v12;
        v78 = &v35[16 * v76];
        v79 = *(_QWORD *)v78;
        v80 = &v35[16 * v37];
        v81 = *((_QWORD *)v80 + 1);
        sub_249F90E3C((char *)(v11 + 16 * *(_QWORD *)v78), (char *)(v11 + 16 * *(_QWORD *)v80), v11 + 16 * v81, __dst);
        if (v1)
          goto LABEL_97;
        if (v81 < v79)
          goto LABEL_121;
        if (v37 > *((_QWORD *)v77 + 2))
          goto LABEL_122;
        *(_QWORD *)v78 = v79;
        *(_QWORD *)&v35[16 * v76 + 8] = v81;
        v82 = *((_QWORD *)v77 + 2);
        if (v37 >= v82)
          goto LABEL_123;
        v12 = v77;
        v13 = v82 - 1;
        memmove(&v35[16 * v37], v80 + 16, 16 * (v82 - 1 - v37));
        *((_QWORD *)v77 + 2) = v82 - 1;
        v11 = v107;
        if (v82 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v105;
    v3 = v106;
    if (v10 >= v106)
    {
      v9 = v104;
      goto LABEL_107;
    }
  }
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
  result = sub_24A01F3B4();
  __break(1u);
  return result;
}

uint64_t sub_249FFC2D8(unsigned __int8 *__src, unsigned __int8 *a2, unint64_t a3, unsigned __int8 *__dst)
{
  unsigned __int8 *v4;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t result;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v16 = &v4[16 * v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v17 = (unsigned __int8 *)(a3 - 16);
        v18 = v6;
        while (1)
        {
          v19 = v17 + 16;
          v20 = *(v18 - 16);
          v18 -= 16;
          if (*(v16 - 16) >= v20)
          {
            v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16)
              *(_OWORD *)v17 = *((_OWORD *)v16 - 1);
            v18 = v6;
            v16 -= 16;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v19 != v6 || v17 >= v6)
              *(_OWORD *)v17 = *(_OWORD *)v18;
            v24 = v18;
            if (v18 <= v7)
              goto LABEL_42;
          }
          v17 -= 16;
          v6 = v18;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*v6 >= *v4)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v23 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_24A012C60((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_24A01F408();
  __break(1u);
  return result;
}

uint64_t sub_249FFC550()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_249FFC574()
{
  uint64_t v0;

  return sub_249FF907C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(float *)(v0 + 32));
}

void sub_249FFC580(void *a1)
{
  uint64_t v1;

  sub_249FF84B8(a1, v1);
}

uint64_t sub_249FFC588(unsigned __int8 a1, uint64_t a2, unint64_t a3, uint64_t a4, char a5, uint64_t a6, unint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  _QWORD v46[12];
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;

  v10 = v9;
  v52 = a7;
  v49 = a6;
  v51 = a3;
  v50 = a2;
  v47 = sub_24A01ED54();
  v46[11] = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v46[10] = (char *)v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_24A01ED24();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v48 = (char *)v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  MEMORY[0x24BDAC7A8](v19);
  if ((a5 & 1) != 0
    || (v20 = *(_QWORD *)(v10 + 16) + OBJC_IVAR____TtC19VisualUnderstanding12VUIndexStore_parameters,
        swift_beginAccess(),
        v21 = *(_QWORD *)v20,
        *(_QWORD *)(*(_QWORD *)v20 + 16))
    && (v22 = sub_249F8B0C4(a1), (v23 & 1) != 0)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v21 + 56) + 8 * v22) + 24) == a4)
  {
    if ((a9 & 1) != 0
      || (v24 = *(_QWORD *)(v10 + 16) + OBJC_IVAR____TtC19VisualUnderstanding12VUIndexStore_parameters,
          swift_beginAccess(),
          v25 = *(_QWORD *)v24,
          *(_QWORD *)(*(_QWORD *)v24 + 16))
      && (v26 = sub_249F8B0C4(a1), (v27 & 1) != 0)
      && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v26) + 32) == a8)
    {
      if (v51 >> 60 != 15)
        __asm { BR              X10 }
      if (v52 >> 60 != 15)
        __asm { BR              X11 }
      v28 = sub_24A01ED90();
      v29 = sub_24A01F0E4();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_249F70000, v28, v29, "Missing either an embedding or contextual embedding", v30, 2u);
        MEMORY[0x24BD07950](v30, -1, -1);
      }

    }
    else
    {
      swift_retain();
      v38 = sub_24A01ED90();
      v39 = sub_24A01F0E4();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = swift_slowAlloc();
        *(_DWORD *)v40 = 134218240;
        v53 = a8;
        sub_24A01F1F8();
        *(_WORD *)(v40 + 12) = 2048;
        v41 = *(_QWORD *)v24;
        v42 = *(_QWORD *)(*(_QWORD *)v24 + 16);
        if (v42)
        {
          v43 = sub_249F8B0C4(a1);
          if ((v44 & 1) != 0)
            v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v41 + 56) + 8 * v43) + 32);
          else
            v42 = 0;
        }
        v53 = v42;
        sub_24A01F1F8();
        swift_release();
        _os_log_impl(&dword_249F70000, v38, v39, "Contextual embedding revision %ld is different from index revision %ld", (uint8_t *)v40, 0x16u);
        MEMORY[0x24BD07950](v40, -1, -1);
      }
      else
      {
        swift_release();
      }

    }
  }
  else
  {
    swift_retain();
    v31 = sub_24A01ED90();
    v32 = sub_24A01F0E4();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      *(_DWORD *)v33 = 134218240;
      v53 = a4;
      sub_24A01F1F8();
      *(_WORD *)(v33 + 12) = 2048;
      v34 = *(_QWORD *)v20;
      v35 = *(_QWORD *)(*(_QWORD *)v20 + 16);
      if (v35)
      {
        v36 = sub_249F8B0C4(a1);
        if ((v37 & 1) != 0)
          v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v34 + 56) + 8 * v36) + 24);
        else
          v35 = 0;
      }
      v53 = v35;
      sub_24A01F1F8();
      swift_release();
      _os_log_impl(&dword_249F70000, v31, v32, "Embedding revision %ld is different from index revision %ld", (uint8_t *)v33, 0x16u);
      MEMORY[0x24BD07950](v33, -1, -1);
    }
    else
    {
      swift_release();
    }

  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_249FFD198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_249FF856C(a1, a2, a3, *(_BYTE *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32), *(uint64_t **)(v3 + 40));
}

uint64_t sub_249FFD1AC(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void (*a6)(float), uint64_t a7)
{
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
  char *v35;
  uint64_t v36;
  NSObject *v37;
  os_signpost_type_t v38;
  char v39;
  void (*v40)(char *, char *, uint64_t);
  uint8_t *v41;
  os_signpost_id_t v42;
  char *v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id *v55;
  _QWORD *v56;
  double v57;
  id v58;
  double v59;
  uint64_t v60;
  __int128 v61;
  unint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  unsigned __int8 *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  _BOOL4 v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  _QWORD *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  id v82;
  id v83;
  char isEscapingClosureAtFileLocation;
  uint64_t v85;
  int v86;
  int v87;
  uint64_t v88;
  id v89;
  id v90;
  id v91;
  double Current;
  uint64_t v93;
  void (*v94)(float);
  uint64_t v95;
  id v96;
  double v97;
  NSObject *v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint8_t *v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  void (*v110)(float);
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  NSObject *v121;
  os_log_type_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void (*v130)(char *, char *);
  char *v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  char *v136;
  NSObject *v137;
  os_log_type_t v138;
  uint8_t *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void (*v148)(char *, uint64_t);
  NSObject *v149;
  os_log_type_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  id v154;
  id v155;
  id v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  void (*v160)(float);
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  id v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  uint64_t v175;
  void (*v176)(uint64_t, uint64_t);
  uint64_t v177;
  unint64_t v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  int64_t v183;
  unint64_t v184;
  int64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  unint64_t v191;
  char v192;
  char v193;
  void (*v194)(char *, uint64_t, uint64_t);
  char *v195;
  uint64_t v196;
  char *v197;
  char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  id v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  size_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  id v218;
  id v219;
  id v220;
  id v221;
  uint64_t v222;
  NSObject *v223;
  os_log_type_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  void *v230;
  id v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  NSObject *v235;
  os_log_type_t v236;
  uint8_t *v237;
  id v238;
  id v239;
  id v240;
  uint64_t v241;
  void *v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  uint64_t v246;
  NSObject *v247;
  os_log_type_t v248;
  _BOOL4 v249;
  uint64_t v250;
  uint8_t *v251;
  id v252;
  id v253;
  id v254;
  uint64_t v255;
  char *v256;
  NSObject *v257;
  os_signpost_type_t v258;
  char *v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  id v263;
  void (*v264)(char *, uint64_t);
  uint64_t v265;
  char *v266;
  char *v267;
  uint64_t v268;
  uint8_t *v269;
  os_signpost_id_t v270;
  void (*v271)(char *, uint64_t);
  uint64_t result;
  int64_t v273;
  uint64_t v274;
  unint64_t v275;
  const char *v276;
  __int128 v277;
  unint64_t v278;
  __int128 v279;
  uint64_t v280;
  char *v281;
  __int128 v282;
  uint64_t v283;
  __int128 v284;
  uint64_t v285;
  char *v286;
  uint64_t v287;
  __int128 *v288;
  _QWORD *v289;
  __int128 v290;
  int v291;
  void (*v292)(char *, char *, uint64_t);
  char *v293;
  uint64_t v294;
  uint64_t v295;
  _QWORD *v296;
  uint64_t v297;
  uint64_t v298;
  char *v299;
  uint64_t v300;
  __int128 v301;
  uint64_t v302;
  _QWORD *v303;
  _QWORD *v304;
  uint64_t v305;
  char *v306;
  uint64_t v307;
  uint64_t v308;
  char *v309;
  uint64_t v310;
  int64_t v311;
  char *v312;
  char *v313;
  double v314;
  char *v315;
  int v316;
  NSObject *v317;
  uint64_t v318;
  uint64_t v319;
  char *v320;
  int v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t (*v324)(uint64_t, uint64_t, uint64_t);
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  unint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  char *v334;
  int64_t v335;
  uint64_t v336;
  char *v337;
  uint64_t v338;
  void (*v339)(float);
  char *v340;
  uint64_t v341;
  _QWORD *v342;
  char *v343;
  uint64_t v344;
  id v345;
  uint64_t v346;
  char v347;
  uint64_t v348;
  __int128 v349;
  uint64_t v350;
  _UNKNOWN **v351;
  double aBlock;
  _QWORD v353[2];
  void *v354;
  uint64_t (*v355)();
  uint64_t v356;

  v332 = a7;
  v339 = a6;
  v328 = a5;
  v321 = a4;
  v316 = a3;
  v336 = a2;
  v329 = a1;
  v308 = sub_24A01ED54();
  v8 = *(_QWORD *)(v308 - 8);
  MEMORY[0x24BDAC7A8](v308);
  v10 = (char *)&v273 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v344 = sub_24A01EBA4();
  v322 = *(_QWORD *)(v344 - 8);
  v11 = MEMORY[0x24BDAC7A8](v344);
  v334 = (char *)&v273 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v333 = (uint64_t)&v273 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v340 = (char *)&v273 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA3D8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v337 = (char *)&v273 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v343 = (char *)&v273 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAD60);
  MEMORY[0x24BDAC7A8](v20);
  v320 = (char *)&v273 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v341 = sub_24A01EAA8();
  v323 = *(_QWORD *)(v341 - 8);
  v22 = MEMORY[0x24BDAC7A8](v341);
  v309 = (char *)&v273 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v312 = (char *)&v273 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v315 = (char *)&v273 - v26;
  v27 = sub_24A01ED24();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = MEMORY[0x24BDAC7A8](v27);
  v313 = (char *)&v273 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v273 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v273 - v34;
  v338 = v7;
  v36 = v7 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_signposter;
  sub_24A01ED30();
  sub_24A01ED0C();
  v310 = v36;
  v37 = sub_24A01ED30();
  v38 = sub_24A01F174();
  v39 = sub_24A01F1E0();
  v325 = v28;
  v307 = v8;
  v306 = v10;
  if ((v39 & 1) != 0)
  {
    v40 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
    v40(v33, v35, v27);
    v41 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v41 = 0;
    v42 = sub_24A01ED18();
    _os_signpost_emit_with_name_impl(&dword_249F70000, v37, v38, v42, "update", "", v41, 2u);
    MEMORY[0x24BD07950](v41, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v33, v27);
  }
  else
  {

    v40 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  }
  v43 = v33;
  v40(v33, v35, v27);
  sub_24A01ED78();
  swift_allocObject();
  v44 = v40;
  v45 = sub_24A01ED6C();
  v46 = *(_QWORD *)(v338 + 16);
  v47 = v345;
  sub_249FDF3A0();
  v345 = v47;
  if (v47)
  {
    (*(void (**)(char *, uint64_t))(v325 + 8))(v35, v27);
    return swift_release();
  }
  v292 = v44;
  v299 = v35;
  v300 = v27;
  v48 = swift_allocObject();
  v49 = sub_249FCBC58(0, 0, 1);
  v305 = v48;
  *(_QWORD *)(v48 + 16) = v49;
  v296 = (_QWORD *)(v48 + 16);
  v50 = swift_allocObject();
  *(_DWORD *)(v50 + 16) = 0;
  v51 = swift_allocObject();
  *(_BYTE *)(v51 + 16) = 1;
  v52 = v341;
  v324 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v323 + 48);
  v53 = v324(v336, 1, v341);
  v293 = v43;
  if ((_DWORD)v53 == 1)
  {
    v54 = v338;
  }
  else
  {
    MEMORY[0x24BDAC7A8](v53);
    v253 = v252;
    v254 = v345;
    sub_24A01F180();
    v54 = v338;
    v345 = v254;
    if (v254
      || (v253, v253 = *(id *)(v46 + 16), v263 = v345, sub_24A01F180(), (v345 = v263) != 0))
    {

      (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
      swift_release();
      swift_release();
      goto LABEL_202;
    }

    v52 = v341;
  }
  v342 = (_QWORD *)v46;
  v55 = (id *)(v46 + OBJC_IVAR____TtC19VisualUnderstanding12VUIndexStore_parameters);
  swift_beginAccess();
  v56 = *v55;
  swift_bridgeObjectRetain_n();
  v57 = COERCE_DOUBLE(sub_249FB5594((uint64_t)v56));
  swift_bridgeObjectRelease();
  aBlock = v57;
  v58 = v345;
  sub_249F89568((uint64_t *)&aBlock, (uint64_t (*)(uint64_t))sub_24A012F24, sub_249FFB504);
  v345 = v58;
  if (v58)
    goto LABEL_209;
  swift_bridgeObjectRelease();
  v59 = aBlock;
  v60 = *(_QWORD *)(*(_QWORD *)&aBlock + 16);
  v298 = v50;
  v327 = v60;
  if (!v60)
  {
LABEL_171:
    swift_release();
    v255 = sub_249FD0B90();
    v256 = v313;
    if (v339)
      ((void (*)(uint64_t, float))v339)(v255, 1.0);
    v257 = sub_24A01ED30();
    sub_24A01ED60();
    v258 = sub_24A01F168();
    if ((sub_24A01F1E0() & 1) != 0)
    {
      swift_retain();
      v259 = v306;
      sub_24A01ED84();
      swift_release();
      v260 = v307;
      v261 = v308;
      if ((*(unsigned int (**)(char *, uint64_t))(v307 + 88))(v259, v308) == *MEMORY[0x24BEE7810])
      {
        v262 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v260 + 8))(v259, v261);
        v262 = "";
      }
      v266 = v293;
      v267 = v313;
      v268 = v300;
      v292(v293, v313, v300);
      v269 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v269 = 0;
      v270 = sub_24A01ED18();
      _os_signpost_emit_with_name_impl(&dword_249F70000, v257, v258, v270, "update", v262, v269, 2u);
      MEMORY[0x24BD07950](v269, -1, -1);

      v271 = *(void (**)(char *, uint64_t))(v325 + 8);
      v271(v267, v268);
      v271(v299, v268);
      swift_release();
      v271(v266, v268);
    }
    else
    {

      v264 = *(void (**)(char *, uint64_t))(v325 + 8);
      v265 = v300;
      v264(v256, v300);
      v264(v299, v265);
      swift_release();
    }
    goto LABEL_201;
  }
  v295 = OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_quantizer;
  v304 = (_QWORD *)(v54 + OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_logger);
  v302 = OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_scanner;
  v294 = OBJC_IVAR____TtC19VisualUnderstanding7VUIndex_clusterer;
  v326 = *(_QWORD *)&aBlock + 32;
  swift_beginAccess();
  v62 = 0;
  v289 = v353;
  v286 = (char *)&v348 + 1;
  v63 = 1819047270;
  if ((v316 & 1) != 0)
    v63 = 1953718630;
  v285 = v63;
  v288 = &v349;
  v281 = (char *)&v349 + 8;
  *(_QWORD *)&v61 = 16777986;
  v284 = v61;
  v283 = MEMORY[0x24BEE4AD8] + 8;
  *(_QWORD *)&v61 = 134218496;
  v279 = v61;
  *((_QWORD *)&v64 + 1) = 2;
  v301 = xmmword_24A0208B0;
  *(_QWORD *)&v64 = 134217984;
  v290 = v64;
  *(_QWORD *)&v64 = 134218240;
  v277 = v64;
  *(_QWORD *)&v64 = 136315138;
  v282 = v64;
  v275 = 0x800000024A023D90;
  v280 = MEMORY[0x24BEE4AE0] + 8;
  v276 = "Swift/UnsafeBufferPointer.swift";
  v278 = 0x800000024A022DC0;
  v303 = (_QWORD *)v51;
  v318 = v45;
  v65 = v329;
  v314 = v59;
  while (1)
  {
    if (v62 >= *(_QWORD *)(*(_QWORD *)&v59 + 16))
    {
      __break(1u);
LABEL_193:
      swift_release();
      swift_release_n();
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_195;
    }
    v66 = (unsigned __int8 *)(v326 + 16 * v62);
    v67 = *v66;
    v68 = *((_QWORD *)v66 + 1);
    if (v65)
    {
      v69 = *(_QWORD *)(v65 + 16);
      if (!v69)
        goto LABEL_16;
      if (*(unsigned __int8 *)(v65 + 32) != (_DWORD)v67)
      {
        if (v69 == 1)
          goto LABEL_16;
        if (*(unsigned __int8 *)(v65 + 33) != (_DWORD)v67)
        {
          if (v69 == 2)
            goto LABEL_16;
          v118 = 34;
          while (1)
          {
            v119 = v118 - 31;
            if (__OFADD__(v118 - 32, 1))
              break;
            if (*(unsigned __int8 *)(v65 + v118) == (_DWORD)v67)
              goto LABEL_21;
            ++v118;
            if (v119 == v69)
              goto LABEL_16;
          }
LABEL_205:
          __break(1u);
LABEL_206:
          __break(1u);
LABEL_207:
          __break(1u);
LABEL_208:
          __break(1u);
LABEL_209:
          result = swift_release();
          __break(1u);
          return result;
        }
      }
    }
LABEL_21:
    v330 = v62;
    v70 = v324(v336, 1, v52) != 1 && (_DWORD)v67 == 6;
    v71 = v70;
    LODWORD(v335) = v71;
    if (v70)
      break;
    sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
    v74 = swift_allocObject();
    *(_OWORD *)(v74 + 16) = v301;
    *(_QWORD *)(v74 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v74 + 64) = MEMORY[0x24BEE17F0];
    v75 = v67;
    *(_QWORD *)(v74 + 32) = v67;
    v76 = v68;
    swift_retain();
    v77 = (void *)sub_24A01F09C();
    *(_QWORD *)&v349 = 0;
    BYTE8(v349) = 1;
    v78 = v342;
    v79 = (void *)v342[2];
    v56 = (_QWORD *)swift_allocObject();
    v56[2] = v77;
    v56[3] = 1;
    *((_BYTE *)v56 + 32) = 0;
    v56[5] = &v349;
    v56[6] = v78;
    v80 = swift_allocObject();
    *(_QWORD *)(v80 + 16) = sub_249FE29B0;
    *(_QWORD *)(v80 + 24) = v56;
    v355 = sub_249FCA5C8;
    v356 = v80;
    aBlock = MEMORY[0x24BDAC760];
    v353[0] = 1107296256;
    v353[1] = sub_249F87210;
    v354 = &block_descriptor_45_0;
    v81 = _Block_copy(&aBlock);
    v82 = v79;
    swift_retain();
    swift_retain();
    v83 = v77;
    swift_release();
    objc_msgSend(v82, sel_performBlockAndWait_, v81);

    _Block_release(v81);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      goto LABEL_206;
    v85 = v349;
    v86 = BYTE8(v349);

    v72 = swift_release();
    if (v86 != 1)
    {
      v56 = v303;
      v54 = v338;
      v59 = v314;
      v68 = v76;
      if (!v85)
      {
        swift_release();
        v52 = v341;
        v65 = v329;
        v62 = v330;
        v51 = (uint64_t)v56;
        goto LABEL_16;
      }
      v51 = (uint64_t)v303;
      v67 = v75;
      if ((v321 & 1) == 0)
        goto LABEL_35;
LABEL_30:
      v73 = 1;
      goto LABEL_36;
    }
    swift_release();
    v51 = (uint64_t)v303;
    v52 = v341;
    v54 = v338;
LABEL_14:
    v65 = v329;
    v59 = v314;
LABEL_15:
    v62 = v330;
LABEL_16:
    if (++v62 == v327)
      goto LABEL_171;
  }
  v72 = swift_retain();
  if ((v321 & 1) != 0)
    goto LABEL_30;
LABEL_35:
  v72 = sub_249FD379C((__int16)v67);
  v73 = v87 | (v72 != 10);
LABEL_36:
  v88 = v54;
  if ((v328 & 0x100000000) == 0)
    *(_DWORD *)(v68 + 56) = v328;
  MEMORY[0x24BDAC7A8](v72);
  v317 = v67;
  v90 = v89;
  v91 = v345;
  sub_24A01F180();
  v345 = v91;

  if (LOBYTE(aBlock) == 1)
  {
    if ((v335 & 1) != 0)
      goto LABEL_46;
  }
  else if (v335 & 1 | ((v73 & 1) == 0))
  {
    goto LABEL_46;
  }
  Current = CFAbsoluteTimeGetCurrent();
  v93 = swift_allocObject();
  v94 = v339;
  v95 = v332;
  *(_QWORD *)(v93 + 16) = v339;
  *(_QWORD *)(v93 + 24) = v95;
  sub_249F9900C((uint64_t)v94);
  v96 = v345;
  sub_249F9C9C0(v317, sub_24A00024C, v93);
  v345 = v96;
  if (v96)
  {
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
    goto LABEL_201;
  }
  swift_release();
  v97 = CFAbsoluteTimeGetCurrent();
  v98 = sub_24A01ED90();
  v99 = sub_24A01F0D8();
  if (os_log_type_enabled(v98, v99))
  {
    v100 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v100 = v290;
    aBlock = v97 - Current;
    sub_24A01F1F8();
    _os_log_impl(&dword_249F70000, v98, v99, "Updating partitions took %fs", v100, 0xCu);
    v101 = v100;
    v54 = v88;
    MEMORY[0x24BD07950](v101, -1, -1);
  }

LABEL_46:
  v102 = (uint64_t)v320;
  if (v339)
    v339(0.0);
  v103 = *(double *)(v54 + v302);
  v354 = (void *)type metadata accessor for VUIndexScanner();
  v355 = (uint64_t (*)())&off_251B67BC8;
  aBlock = v103;
  v319 = v68;
  if (!(_DWORD)v335)
  {
    swift_retain();
    v105 = 1;
    goto LABEL_52;
  }
  sub_249F9905C(v336, v102, (uint64_t *)&unk_2544CAD60);
  v104 = v341;
  if (v324(v102, 1, v341) == 1)
  {
    swift_retain();
    sub_249F990A0(v102, (uint64_t *)&unk_2544CAD60);
    v105 = 1;
    v68 = v319;
LABEL_52:
    v106 = swift_allocObject();
    *(CFAbsoluteTime *)(v106 + 16) = CFAbsoluteTimeGetCurrent();
    if ((v105 & 1) != 0)
    {
      sub_24A000088((uint64_t)&aBlock, (uint64_t)&v349);
      v107 = v54;
      v108 = (_QWORD *)swift_allocObject();
      v109 = v298;
      v108[2] = v107;
      v108[3] = v109;
      v108[4] = v305;
      v108[5] = v106;
      v108[6] = 0x4000000000000000;
      v108[7] = v51;
      v110 = v339;
      v111 = v332;
      v108[8] = v339;
      v108[9] = v111;
      sub_249F9900C((uint64_t)v110);
      swift_retain();
      v112 = v345;
      sub_24A008080((uint64_t)v317, v68, &v349, 0, v316 & 1, v73 & 1, (void (*)(uint64_t))sub_24A000120, (uint64_t)v108);
      v345 = v112;
      if (v112)
      {
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_release();
        swift_release();
        swift_release();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v349);
        swift_release();
        (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
        swift_release();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&aBlock);
        swift_release();
        swift_release();
        return swift_release();
      }
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v349);
      v113 = swift_release();
      MEMORY[0x24BDAC7A8](v113);
      v115 = v114;
      v116 = v345;
      sub_24A01F180();
      v345 = v116;
      if (v116)
      {
        swift_release();
        swift_release();
        swift_release();

        (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
        swift_release();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&aBlock);
        swift_release();
        swift_release();
        return swift_release();
      }

      v59 = v314;
      v54 = v107;
    }
    v56 = v342;
    v117 = v345;
    sub_249FDF3A0();
    v52 = v341;
    v345 = v117;
    if (v117)
    {
      swift_release();
      swift_release();
      swift_release();
      (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
      swift_release();
      goto LABEL_200;
    }
    swift_release();
    swift_release();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&aBlock);
    v65 = v329;
    goto LABEL_15;
  }
  v291 = v73;
  v120 = v315;
  (*(void (**)(char *, uint64_t, uint64_t))(v323 + 32))(v315, v102, v104);
  swift_retain();
  v121 = sub_24A01ED90();
  v122 = sub_24A01F0CC();
  if (os_log_type_enabled(v121, v122))
  {
    v123 = swift_slowAlloc();
    v124 = swift_slowAlloc();
    *(_QWORD *)&v349 = v124;
    *(_DWORD *)v123 = v284;
    LOBYTE(v348) = 6;
    sub_24A01F1F8();
    *(_WORD *)(v123 + 5) = 2080;
    v348 = sub_249F8AAE8(v285, 0xE400000000000000, (uint64_t *)&v349);
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    *(_WORD *)(v123 + 15) = 2080;
    if ((v291 & 1) != 0)
      v125 = 0x646563726F662820;
    else
      v125 = 0;
    if ((v291 & 1) != 0)
      v126 = 0xE900000000000029;
    else
      v126 = 0xE000000000000000;
    v348 = sub_249F8AAE8(v125, v126, (uint64_t *)&v349);
    v120 = v315;
    sub_24A01F1F8();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_249F70000, v121, v122, "Using vector store to update type %hhu in %s mode%s", (uint8_t *)v123, 0x19u);
    swift_arrayDestroy();
    MEMORY[0x24BD07950](v124, -1, -1);
    MEMORY[0x24BD07950](v123, -1, -1);
  }

  v127 = v322;
  v128 = (uint64_t)v343;
  v129 = (uint64_t)v337;
  v130 = *(void (**)(char *, char *))(v323 + 16);
  v131 = v312;
  v132 = v341;
  v130(v312, v120);
  v133 = type metadata accessor for VUVectorSearchStore();
  swift_allocObject();
  v134 = v345;
  v135 = sub_249FF1380(v131);
  v345 = v134;
  if (v134)
  {

    v136 = v309;
    ((void (*)(char *, char *, uint64_t))v130)(v309, v120, v132);
    v56 = v304;
    v137 = sub_24A01ED90();
    v138 = sub_24A01F0E4();
    if (os_log_type_enabled(v137, v138))
    {
      v139 = (uint8_t *)swift_slowAlloc();
      v140 = swift_slowAlloc();
      *(_QWORD *)&v349 = v140;
      *(_DWORD *)v139 = v282;
      v345 = v139 + 4;
      v141 = sub_24A01EA0C();
      v348 = sub_249F8AAE8(v141, v142, (uint64_t *)&v349);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      v56 = *(_QWORD **)(v323 + 8);
      ((void (*)(char *, uint64_t))v56)(v136, v132);
      _os_log_impl(&dword_249F70000, v137, v138, "Cannot open the vector store at %s!", v139, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD07950](v140, -1, -1);
      MEMORY[0x24BD07950](v139, -1, -1);
      swift_release();

      ((void (*)(char *, uint64_t))v56)(v120, v132);
    }
    else
    {
      swift_release();
      v148 = *(void (**)(char *, uint64_t))(v323 + 8);
      v148(v136, v132);

      v148(v120, v132);
    }
    v51 = (uint64_t)v303;
    v54 = v338;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&aBlock);
    v345 = 0;
    v52 = v341;
    goto LABEL_14;
  }
  v143 = v135;
  v274 = v133;
  v347 = 0;
  v144 = v319;
  v145 = *(_QWORD *)(v319 + 24);
  v146 = OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_embeddingRevision;
  v147 = *(_QWORD *)(v135 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_embeddingRevision);
  v287 = swift_retain();
  if (v145 == v147)
    goto LABEL_90;
  swift_retain();
  swift_retain();
  v149 = sub_24A01ED90();
  v150 = sub_24A01F0F0();
  if (os_log_type_enabled(v149, v150))
  {
    v151 = swift_slowAlloc();
    *(_DWORD *)v151 = v277;
    *(_QWORD *)&v349 = *(_QWORD *)(v144 + 24);
    sub_24A01F1F8();
    swift_release();
    *(_WORD *)(v151 + 12) = 2048;
    *(_QWORD *)&v349 = *(_QWORD *)(v143 + v146);
    sub_24A01F1F8();
    swift_release();
    _os_log_impl(&dword_249F70000, v149, v150, "Resetting index as a new embedding revision is available: %ld -> %ld", (uint8_t *)v151, 0x16u);
    MEMORY[0x24BD07950](v151, -1, -1);
  }
  else
  {
    swift_release();
    swift_release();
  }

  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v152 = swift_allocObject();
  *(_OWORD *)(v152 + 16) = v301;
  *(_QWORD *)(v152 + 56) = MEMORY[0x24BEE4260];
  *(_QWORD *)(v152 + 64) = MEMORY[0x24BEE42B0];
  *(_BYTE *)(v152 + 32) = 6;
  v153 = (void *)sub_24A01F09C();
  MEMORY[0x24BDAC7A8](v153);
  v155 = v154;
  v156 = v345;
  sub_24A01F180();
  v345 = v156;
  if (v156)
  {
    swift_release();
    swift_release_n();
    swift_release();

LABEL_191:
    (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v341);
    swift_release();
    (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&aBlock);
    swift_release();
    swift_release();
    return swift_release();
  }

  v347 = 1;
  v157 = v345;
  v158 = sub_249FDF3A0();
  v345 = v157;
  if (v157)
  {
    swift_release();
    swift_release_n();
    swift_release();
    goto LABEL_191;
  }
  if (v339)
    ((void (*)(uint64_t, float))v339)(v158, 0.0);
  v127 = v322;
  v128 = (uint64_t)v343;
LABEL_90:
  v159 = swift_allocObject();
  v160 = v339;
  v161 = v332;
  *(_QWORD *)(v159 + 16) = v339;
  *(_QWORD *)(v159 + 24) = v161;
  sub_249F9900C((uint64_t)v160);
  v162 = sub_249FF1DF8((void (*)(void))sub_24A0001D8, v159);
  v163 = swift_release();
  MEMORY[0x24BDAC7A8](v163);
  v165 = v164;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAB68);
  v166 = v345;
  sub_24A01F180();
  v345 = v166;

  v167 = v349;
  v348 = MEMORY[0x24BEE4B08];
  v346 = MEMORY[0x24BEE4B08];
  v168 = *(_QWORD *)(v162 + 64);
  v297 = v162 + 64;
  v169 = 1 << *(_BYTE *)(v162 + 32);
  if (v169 < 64)
    v170 = ~(-1 << v169);
  else
    v170 = -1;
  v171 = v170 & v168;
  v311 = (unint64_t)(v169 + 63) >> 6;
  v273 = v311 - 1;
  v331 = v162;
  swift_bridgeObjectRetain();
  v335 = 0;
  v172 = (uint64_t)v340;
  while (2)
  {
    if (v171)
    {
      v178 = __clz(__rbit64(v171));
      v171 &= v171 - 1;
      v179 = v178 | (v335 << 6);
      goto LABEL_99;
    }
    v183 = v335 + 1;
    if (__OFADD__(v335, 1))
    {
      __break(1u);
      goto LABEL_205;
    }
    if (v183 >= v311)
      goto LABEL_117;
    v184 = *(_QWORD *)(v297 + 8 * v183);
    if (!v184)
    {
      v185 = v335 + 2;
      ++v335;
      if (v183 + 1 < v311)
      {
        v184 = *(_QWORD *)(v297 + 8 * v185);
        if (v184)
          goto LABEL_106;
        v335 = v183 + 1;
        if (v183 + 2 < v311)
        {
          v184 = *(_QWORD *)(v297 + 8 * (v183 + 2));
          if (v184)
          {
            v183 += 2;
            goto LABEL_103;
          }
          v185 = v183 + 3;
          v335 = v183 + 2;
          if (v183 + 3 < v311)
          {
            v184 = *(_QWORD *)(v297 + 8 * v185);
            if (!v184)
            {
              while (1)
              {
                v183 = v185 + 1;
                if (__OFADD__(v185, 1))
                  goto LABEL_208;
                if (v183 >= v311)
                {
                  v335 = v273;
                  goto LABEL_117;
                }
                v184 = *(_QWORD *)(v297 + 8 * v183);
                ++v185;
                if (v184)
                  goto LABEL_103;
              }
            }
LABEL_106:
            v183 = v185;
            goto LABEL_103;
          }
        }
      }
LABEL_117:
      v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDB8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v186 - 8) + 56))(v129, 1, 1, v186);
      v171 = 0;
      goto LABEL_118;
    }
LABEL_103:
    v171 = (v184 - 1) & v184;
    v179 = __clz(__rbit64(v184)) + (v183 << 6);
    v335 = v183;
LABEL_99:
    v180 = v331;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v127 + 16))(v129, *(_QWORD *)(v331 + 48) + *(_QWORD *)(v127 + 72) * v179, v344);
    v181 = *(_QWORD *)(v180 + 56);
    v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDB8);
    *(_QWORD *)(v129 + *(int *)(v182 + 48)) = *(_QWORD *)(v181 + 8 * v179);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v182 - 8) + 56))(v129, 0, 1, v182);
    swift_bridgeObjectRetain();
    v128 = (uint64_t)v343;
LABEL_118:
    sub_249F98C10(v129, v128, &qword_2544CA3D8);
    v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDB8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v187 - 8) + 48))(v128, 1, v187) != 1)
    {
      v188 = v128;
      v189 = *(_QWORD *)(v128 + *(int *)(v187 + 48));
      v190 = v344;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v127 + 32))(v172, v188, v344);
      if (*(_QWORD *)(v167 + 16) && (v191 = sub_249F8B20C(v172), v190 = v344, (v192 & 1) != 0))
      {
        v193 = sub_249FFB248(*(_QWORD *)(*(_QWORD *)(v167 + 56) + 8 * v191), v189);
        swift_bridgeObjectRelease();
        if ((v193 & 1) != 0)
        {
          (*(void (**)(uint64_t, uint64_t))(v127 + 8))(v172, v344);
          goto LABEL_96;
        }
        v194 = *(void (**)(char *, uint64_t, uint64_t))(v127 + 16);
        v195 = v334;
        v196 = v344;
        v194(v334, v172, v344);
        swift_beginAccess();
        v174 = v333;
        sub_249F8BE04(v333, v195);
        swift_endAccess();
        v176 = *(void (**)(uint64_t, uint64_t))(v322 + 8);
        v176(v174, v196);
        v194(v195, (uint64_t)v340, v196);
        swift_beginAccess();
        v197 = v195;
        v198 = v337;
        sub_249F8BE04(v174, v197);
        v175 = v196;
        v129 = (uint64_t)v198;
        v127 = v322;
        swift_endAccess();
      }
      else
      {
        swift_bridgeObjectRelease();
        v173 = v334;
        (*(void (**)(char *, uint64_t, uint64_t))(v127 + 16))(v334, v172, v190);
        swift_beginAccess();
        v174 = v333;
        v129 = (uint64_t)v337;
        sub_249F8BE04(v333, v173);
        v175 = v344;
        swift_endAccess();
        v176 = *(void (**)(uint64_t, uint64_t))(v127 + 8);
      }
      v177 = v174;
      v172 = (uint64_t)v340;
      v176(v177, v175);
      v176(v172, v175);
LABEL_96:
      v128 = (uint64_t)v343;
      continue;
    }
    break;
  }
  swift_release();
  v199 = sub_249FA4C88(v167);
  v200 = swift_bridgeObjectRetain();
  v201 = sub_249FA4C88(v200);
  if (*(_QWORD *)(v201 + 16) <= *(_QWORD *)(v199 + 16) >> 3)
  {
    *(_QWORD *)&v349 = v199;
    sub_249FF4E74(v201);
    swift_bridgeObjectRelease();
    v202 = v349;
  }
  else
  {
    v202 = sub_249FF54BC(v201, v199);
    swift_bridgeObjectRelease();
  }
  v51 = (uint64_t)v303;
  v203 = v341;
  v204 = v338;
  v59 = v314;
  v205 = v287;
  swift_beginAccess();
  v206 = v346;
  swift_bridgeObjectRetain();
  v207 = sub_249FFA458(v202, v206);
  v346 = v207;
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v207 + 16))
    goto LABEL_132;
  v350 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDC0);
  v351 = (_UNKNOWN **)sub_249F98C68(&qword_2578FFDC8, &qword_2578FFDC0, MEMORY[0x24BEE1728]);
  *(_QWORD *)&v349 = v207;
  swift_bridgeObjectRetain();
  v208 = v345;
  sub_249FDBEB8(&v349, 6, 0xFFFF);
  v345 = v208;
  if (v208)
  {
    swift_release();
    swift_release_n();
    swift_bridgeObjectRelease();
    swift_release();
    (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v203);
    swift_release();
    (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v349);
    goto LABEL_199;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v349);
  v347 = 1;
  v209 = v345;
  v210 = sub_249FDF3A0();
  v345 = v209;
  if (v209)
  {
    swift_release();
    swift_release_n();
    swift_bridgeObjectRelease();
    swift_release();
    (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v203);
LABEL_198:
    swift_release();
    (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
    goto LABEL_199;
  }
  if (v339)
    ((void (*)(uint64_t, float))v339)(v210, 0.0);
LABEL_132:
  v211 = swift_beginAccess();
  if (!*(_QWORD *)(v348 + 16))
    goto LABEL_144;
  *(_QWORD *)&v349 = 0;
  v212 = swift_bridgeObjectRetain();
  v213 = sub_249FB549C(v212);
  v214 = swift_bridgeObjectRelease();
  v215 = *(_QWORD *)(v213 + 16);
  if (!v215)
  {
    swift_release();
LABEL_142:
    v211 = swift_beginAccess();
    if (__OFADD__(*v296, (_QWORD)v349))
      goto LABEL_207;
    *v296 += v349;
LABEL_144:
    if (v347 == 1)
    {
      MEMORY[0x24BDAC7A8](v211);
      v56 = v219;
      v220 = v345;
      sub_24A01F180();
      v345 = v220;
      if (v220)
        goto LABEL_193;

      v221 = v345;
      sub_249FDF3A0();
      v345 = v221;
      if (v221)
      {
        swift_release();
        swift_release_n();
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_197;
      }
    }
    v222 = v331;
    swift_bridgeObjectRetain();
    v223 = sub_24A01ED90();
    v224 = sub_24A01F0F0();
    if (os_log_type_enabled(v223, v224))
    {
      v225 = swift_slowAlloc();
      *(_DWORD *)v225 = v279;
      *(_QWORD *)&v349 = *(_QWORD *)(v346 + 16);
      sub_24A01F1F8();
      *(_WORD *)(v225 + 12) = 2048;
      *(_QWORD *)&v349 = *(_QWORD *)(v348 + 16);
      sub_24A01F1F8();
      *(_WORD *)(v225 + 22) = 2048;
      v226 = *(_QWORD *)(v222 + 16);
      swift_bridgeObjectRelease();
      *(_QWORD *)&v349 = v226;
      v51 = (uint64_t)v303;
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_249F70000, v223, v224, "Removed %ld assets from the index and added %ld, total is %ld assets", (uint8_t *)v225, 0x20u);
      v227 = v225;
      v59 = v314;
      MEMORY[0x24BD07950](v227, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    LOBYTE(v73) = v291;
    v350 = v274;
    v351 = &off_251B67DE0;
    *(_QWORD *)&v349 = v287;
    swift_retain();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&aBlock);
    v228 = sub_24A000204(&v349, (uint64_t)&aBlock);
    if ((v316 & 1) == 0)
    {
      MEMORY[0x24BDAC7A8](v228);
      v239 = v238;
      v240 = v345;
      sub_24A01F180();
      v345 = v240;

      if ((v349 & 1) != 0)
        goto LABEL_158;
      sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
      v241 = swift_allocObject();
      *(_OWORD *)(v241 + 16) = v301;
      *(_QWORD *)(v241 + 56) = MEMORY[0x24BEE4260];
      *(_QWORD *)(v241 + 64) = MEMORY[0x24BEE42B0];
      *(_BYTE *)(v241 + 32) = 6;
      v242 = (void *)sub_24A01F09C();
      v243 = sub_249FCBC58(v242, 0, 1);

      v59 = v314;
      if (v243)
        goto LABEL_158;
      v244 = swift_allocObject();
      *(_OWORD *)(v244 + 16) = v301;
      *(_QWORD *)(v244 + 56) = MEMORY[0x24BEE4260];
      *(_QWORD *)(v244 + 64) = MEMORY[0x24BEE42B0];
      *(_BYTE *)(v244 + 32) = 6;
      v245 = (void *)sub_24A01F09C();
      v246 = sub_249FCBC58(v245, 0, 1);

      if (v246)
      {
LABEL_158:
        v247 = sub_24A01ED90();
        v248 = sub_24A01F0F0();
        v249 = os_log_type_enabled(v247, v248);
        v250 = v341;
        if (v249)
        {
          v251 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v251 = 0;
          _os_log_impl(&dword_249F70000, v247, v248, "Re-clustering as index is stale", v251, 2u);
          MEMORY[0x24BD07950](v251, -1, -1);
          swift_release_n();

        }
        else
        {

          swift_release_n();
        }
        (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v250);
        v105 = 1;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v341);
        swift_release_n();
        v105 = v73;
      }
      v68 = v319;
      goto LABEL_164;
    }
    sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
    v229 = swift_allocObject();
    *(_OWORD *)(v229 + 16) = v301;
    *(_QWORD *)(v229 + 56) = MEMORY[0x24BEE4260];
    *(_QWORD *)(v229 + 64) = MEMORY[0x24BEE42B0];
    *(_BYTE *)(v229 + 32) = 6;
    v230 = (void *)sub_24A01F09C();
    MEMORY[0x24BDAC7A8](v230);
    v56 = v231;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
    v232 = v345;
    sub_24A01F180();
    v68 = v319;
    v345 = v232;
    if (!v232)
    {

      if (*(_QWORD *)(v349 + 16))
      {
        v233 = OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_secondaryIdentifiers;
        v234 = v287;
        *(_QWORD *)(v287 + OBJC_IVAR____TtC19VisualUnderstanding19VUVectorSearchStore_secondaryIdentifiers) = v349;
        swift_bridgeObjectRelease();
        swift_retain();
        v235 = sub_24A01ED90();
        v236 = sub_24A01F0F0();
        if (os_log_type_enabled(v235, v236))
        {
          v237 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v237 = v290;
          *(_QWORD *)&v349 = *(_QWORD *)(*(_QWORD *)(v234 + v233) + 16);
          sub_24A01F1F8();
          swift_release();
          _os_log_impl(&dword_249F70000, v235, v236, "Queuing %ld for fast clustering", v237, 0xCu);
          MEMORY[0x24BD07950](v237, -1, -1);
          swift_release_n();

        }
        else
        {

          swift_release_n();
        }
        (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v341);
        v105 = 1;
        v54 = v338;
        v68 = v319;
        goto LABEL_167;
      }
      (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v341);
      swift_bridgeObjectRelease();
      swift_release_n();
      v105 = v73;
LABEL_164:
      v54 = v338;
LABEL_167:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    swift_release();
    swift_release_n();
    swift_release();

LABEL_195:
LABEL_197:
    (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v341);
    goto LABEL_198;
  }
  v216 = 0;
  while (1)
  {
    v217 = (void *)MEMORY[0x24BD07458](v214);
    v218 = v345;
    sub_249FFA6F4(v213, v216, 1024, v331, v204, 6, v205, &v347, &v349, v339);
    v345 = v218;
    if (v218)
      break;
    if (__OFADD__(v216, 1024))
      v216 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v216 += 1024;
    objc_autoreleasePoolPop(v217);
    if (v216 >= v215)
    {
      swift_release();
      v59 = v314;
      goto LABEL_142;
    }
  }
  objc_autoreleasePoolPop(v217);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v323 + 8))(v315, v341);
  swift_release();
  (*(void (**)(char *, uint64_t))(v325 + 8))(v299, v300);
  swift_release();
LABEL_199:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_200:
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&aBlock);
LABEL_201:
  swift_release();
LABEL_202:
  swift_release();
  return swift_release();
}

uint64_t sub_24A00002C()
{
  return swift_deallocObject();
}

uint64_t sub_24A00003C()
{
  return swift_deallocObject();
}

uint64_t sub_24A00004C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A000078()
{
  return swift_deallocObject();
}

uint64_t sub_24A000088(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24A0000CC()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 64))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A000120()
{
  unsigned __int8 v1;

  sub_24A01F138();
  return v1;
}

void sub_24A0001B4()
{
  uint64_t v0;

  sub_249FD2F98(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), *(void (**)(id))(v0 + 32));
}

uint64_t sub_24A0001D8()
{
  uint64_t v0;
  uint64_t (*v1)(float);
  uint64_t result;

  v1 = *(uint64_t (**)(float))(v0 + 16);
  if (v1)
    return v1(0.0);
  return result;
}

uint64_t sub_24A000204(__int128 *a1, uint64_t a2)
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

uint64_t objectdestroy_51Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A00024C()
{
  uint64_t v0;
  uint64_t (*v1)(float);

  v1 = *(uint64_t (**)(float))(v0 + 16);
  if (v1)
    return v1(0.0) & 1;
  else
    return 1;
}

uint64_t sub_24A000284@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_249FFAF0C(*(float **)(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t **)(v1 + 32), *(double **)(v1 + 40), *(_BYTE **)(v1 + 56), *(uint64_t (**)(uint64_t, float))(v1 + 64), a1, *(double *)(v1 + 48));
}

void sub_24A0002C0()
{
  sub_24A0001B4();
}

void sub_24A0002E8(unsigned __int8 *a1@<X8>)
{
  sub_249F99148(a1);
}

_QWORD *sub_24A0002FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v4 = a1;
  v5 = swift_bridgeObjectRetain();
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v7 = 32;
  v19 = v5;
  do
  {
    v9 = *a2;
    if (*(_QWORD *)(*a2 + 16))
    {
      v10 = sub_249F8B27C(*(_QWORD *)(v4 + v7));
      if ((v11 & 1) != 0)
      {
        v12 = (uint64_t *)(*(_QWORD *)(v9 + 56) + 24 * v10);
        v13 = *v12;
        v14 = v12[1];
        v15 = v12[2];
        swift_bridgeObjectRetain();
        sub_249F93CE0(v14, v15);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_249F8A874(0, v6[2] + 1, 1, v6);
        v17 = v6[2];
        v16 = v6[3];
        if (v17 >= v16 >> 1)
          v6 = sub_249F8A874((_QWORD *)(v16 > 1), v17 + 1, 1, v6);
        v6[2] = v17 + 1;
        v8 = &v6[3 * v17];
        v8[4] = v13;
        v8[5] = v14;
        v8[6] = v15;
        v4 = v19;
      }
    }
    v7 += 16;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_24A000444(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24A012EE8(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_24A005DE8(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_24A0004AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v2 = sub_24A01F120();
  v3 = *(_QWORD *)(v2 - 8);
  v13[0] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A01EDE4();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_24A01F108();
  MEMORY[0x24BDAC7A8](v7);
  v8 = MEMORY[0x24BEE4AF8];
  v1[3] = MEMORY[0x24BEE4B00];
  v1[4] = v8;
  v13[1] = sub_249F990DC(0, (unint64_t *)&unk_2544CAEC0);
  sub_24A01F0FC();
  sub_24A01EDD8();
  v9 = *MEMORY[0x24BEE5750];
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v10(v5, v9, v2);
  v11 = sub_24A01F150();
  v1[6] = 0;
  v1[7] = 0;
  v1[5] = v11;
  sub_24A01EDD8();
  v15 = v8;
  sub_249FA2B24((unint64_t *)&unk_2544CAEB0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAE90);
  sub_249F98C68(&qword_2544CAE98, &qword_2544CAE90, MEMORY[0x24BEE12C8]);
  sub_24A01F228();
  v10(v5, v9, v13[0]);
  v1[8] = sub_24A01F150();
  v1[2] = v14;
  return v1;
}

uint64_t sub_24A0006FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t result;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD v35[2];
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 aBlock;
  uint64_t (*v50)(uint64_t);
  void *v51;
  void *v52;
  uint64_t v53;

  v5 = v4;
  v35[1] = a3;
  *(_QWORD *)&v36 = a2;
  v39 = a4;
  v38 = sub_24A01EBA4();
  v7 = *(_QWORD *)(v38 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v38);
  v9 = sub_24A01EDCC();
  v42 = *(_QWORD *)(v9 - 8);
  v43 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v40 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_24A01EDE4();
  v41 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  v14 = *(_QWORD *)(v4 + 40);
  v46 = v4;
  v47 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CA2C0);
  v44 = (uint64_t *)(v13 + 16);
  v37 = v14;
  v15 = sub_24A01F138();
  if (*(_QWORD *)(v13 + 16))
  {
    v52 = sub_24A006E1C;
    v53 = v4;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v50 = sub_24A007D98;
    v51 = &block_descriptor_9_0;
    v16 = _Block_copy(&aBlock);
    swift_retain();
    sub_24A01EDD8();
    v48 = MEMORY[0x24BEE4AF8];
    sub_249FA2B24((unint64_t *)&qword_2544CA290, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA298);
    sub_249F98C68((unint64_t *)&qword_2544CA2A0, &qword_2544CA298, MEMORY[0x24BEE12C8]);
    v17 = v40;
    v18 = v43;
    sub_24A01F228();
    MEMORY[0x24BD07014](0, v12, v17, v16);
    _Block_release(v16);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v17, v18);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v12, v45);
  }
  else
  {
    ((void (*)(__int128 *__return_ptr, uint64_t))v36)(&aBlock, v15);
    v36 = aBlock;
    v19 = v50;
    sub_249FCA398(*(_QWORD *)(v13 + 16), *(_QWORD *)(v13 + 24), *(_QWORD *)(v13 + 32));
    *(_OWORD *)(v13 + 16) = v36;
    *(_QWORD *)(v13 + 32) = v19;
    v20 = v40;
    sub_24A01EDC0();
    v21 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v38);
    v22 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v5;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v23 + v22, (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v21);
    *(_QWORD *)(v23 + ((v8 + v22 + 7) & 0xFFFFFFFFFFFFFFF8)) = v13;
    v52 = sub_24A006DA8;
    v53 = v23;
    v24 = MEMORY[0x24BDAC760];
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v50 = sub_24A007D98;
    v51 = &block_descriptor_6;
    v25 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    sub_24A01EDD8();
    MEMORY[0x24BD07014](0, v12, v20, v25);
    _Block_release(v25);
    v41 = *(_QWORD *)(v41 + 8);
    ((void (*)(char *, uint64_t))v41)(v12, v45);
    v26 = v43;
    v27 = *(void (**)(char *, uint64_t))(v42 + 8);
    v27(v20, v43);
    swift_release();
    v42 = *(_QWORD *)(v5 + 64);
    v52 = sub_24A006E04;
    v53 = v5;
    *(_QWORD *)&aBlock = v24;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v50 = sub_24A007D98;
    v51 = &block_descriptor_6_1;
    v28 = _Block_copy(&aBlock);
    swift_retain();
    sub_24A01EDD8();
    v48 = MEMORY[0x24BEE4AF8];
    sub_249FA2B24((unint64_t *)&qword_2544CA290, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA298);
    sub_249F98C68((unint64_t *)&qword_2544CA2A0, &qword_2544CA298, MEMORY[0x24BEE12C8]);
    sub_24A01F228();
    MEMORY[0x24BD07014](0, v12, v20, v28);
    _Block_release(v28);
    v27(v20, v26);
    ((void (*)(char *, uint64_t))v41)(v12, v45);
  }
  swift_release();
  v29 = v44;
  result = swift_beginAccess();
  v31 = *v29;
  if (v31)
  {
    v33 = *(_QWORD *)(v13 + 24);
    v32 = *(_QWORD *)(v13 + 32);
    swift_bridgeObjectRetain();
    sub_249F93CE0(v33, v32);
    result = swift_release();
    v34 = v39;
    *v39 = v31;
    v34[1] = v33;
    v34[2] = v32;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24A000C60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  char v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;

  result = swift_beginAccess();
  v7 = *(_QWORD *)(a1 + 24);
  if (*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    v8 = sub_249F8B20C(a2);
    if ((v9 & 1) != 0)
    {
      v10 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 24 * v8);
      v11 = v10[1];
      v12 = v10[2];
      *a3 = *v10;
      a3[1] = v11;
      a3[2] = v12;
      swift_bridgeObjectRetain();
      sub_249F93CE0(v11, v12);
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return result;
}

uint64_t sub_24A000D18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  char v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;

  result = swift_beginAccess();
  v7 = *(_QWORD *)(a1 + 24);
  if (*(_QWORD *)(v7 + 16) && (result = sub_249F8B27C(a2), (v8 & 1) != 0))
  {
    v9 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 24 * result);
    v10 = v9[1];
    v11 = v9[2];
    *a3 = *v9;
    a3[1] = v10;
    a3[2] = v11;
    swift_bridgeObjectRetain();
    return sub_249F93CE0(v10, v11);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  return result;
}

uint64_t sub_24A000DB8(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  uint64_t result;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t *v27;
  char *v28;
  _QWORD v29[3];

  v6 = sub_24A01EBA4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v28 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - v10;
  swift_beginAccess();
  if (!*(_QWORD *)(a1[3] + 16)
    || (swift_bridgeObjectRetain(), sub_249F8B20C(a2), v13 = v12, result = swift_bridgeObjectRelease(), (v13 & 1) == 0))
  {
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v15(v11, a2, v6);
    swift_beginAccess();
    v16 = a3[2];
    v17 = a3[3];
    v18 = a3[4];
    swift_beginAccess();
    sub_24A006E34(v16, v17, v18);
    sub_249FA4058(v16, v17, v18, (uint64_t)v11);
    swift_endAccess();
    v15(v28, a2, v6);
    v27 = a1 + 4;
    swift_beginAccess();
    v19 = a1[4];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    a1[4] = v19;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v19 = sub_249F89B68(0, *(_QWORD *)(v19 + 16) + 1, 1, v19);
      *v27 = v19;
    }
    v22 = *(_QWORD *)(v19 + 16);
    v21 = *(_QWORD *)(v19 + 24);
    if (v22 >= v21 >> 1)
    {
      v19 = sub_249F89B68(v21 > 1, v22 + 1, 1, v19);
      *v27 = v19;
    }
    *(_QWORD *)(v19 + 16) = v22 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v19+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v22, v28, v6);
    v23 = a1[4];
    result = swift_endAccess();
    if (a1[2] < *(_QWORD *)(v23 + 16))
    {
      swift_beginAccess();
      sub_24A001268((uint64_t)v11);
      swift_endAccess();
      swift_beginAccess();
      sub_249FB7ECC((uint64_t)v11, (uint64_t)v29);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
      v24 = v29[0];
      v25 = v29[1];
      v26 = v29[2];
      swift_endAccess();
      return sub_249FCA398(v24, v25, v26);
    }
  }
  return result;
}

uint64_t sub_24A001080(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  unint64_t v5;
  uint64_t *v6;
  uint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;

  v5 = a1;
  v6 = (uint64_t *)(a1 + 24);
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v5 + 24) + 16) || (result = sub_249F8B27C(a2), (v8 & 1) == 0))
  {
    swift_beginAccess();
    v9 = a3[2];
    v10 = a3[3];
    v11 = a3[4];
    swift_beginAccess();
    sub_24A006E34(v9, v10, v11);
    sub_249FA3F44(v9, v10, v11, a2);
    swift_endAccess();
    v12 = v5 + 32;
    swift_beginAccess();
    sub_249FA3A04(a2);
    result = swift_endAccess();
    if (*(_QWORD *)(v5 + 16) < *(_QWORD *)(*(_QWORD *)(v5 + 32) + 16))
    {
      swift_beginAccess();
      if (*(_QWORD *)(*(_QWORD *)v12 + 16))
      {
        v13 = *(_QWORD *)(*(_QWORD *)v12 + 32);
        sub_24A007070(0, 1);
        swift_endAccess();
        swift_beginAccess();
        v14 = sub_249F8B27C(v13);
        v15 = 0;
        v16 = 0;
        v17 = 0;
        if ((v18 & 1) == 0)
        {
LABEL_8:
          swift_endAccess();
          return sub_249FCA398(v15, v16, v17);
        }
        v5 = v14;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v20 = *v6;
        v22 = *v6;
        *v6 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
LABEL_7:
          v21 = (uint64_t *)(*(_QWORD *)(v20 + 56) + 24 * v5);
          v15 = *v21;
          v16 = v21[1];
          v17 = v21[2];
          sub_249FBDFD4(v5, v20);
          *v6 = v20;
          swift_bridgeObjectRelease();
          goto LABEL_8;
        }
      }
      else
      {
        __break(1u);
      }
      sub_249FC1160();
      v20 = v22;
      goto LABEL_7;
    }
  }
  return result;
}

uint64_t sub_24A001268@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  result = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  if (!*(_QWORD *)(*v1 + 16))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v8 = sub_24A01EBA4();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v6, v7 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8);
  if ((_DWORD)result != 1)
  {
    result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a1, v6, v8);
    if (*(_QWORD *)(v7 + 16))
      return sub_24A006E68(0, 1);
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_24A001374(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 48);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
    __break(1u);
  else
    *(_QWORD *)(result + 48) = v3;
  return result;
}

uint64_t sub_24A00138C(uint64_t result)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 56);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
    __break(1u);
  else
    *(_QWORD *)(result + 56) = v3;
  return result;
}

uint64_t sub_24A0013A4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_24A01ED9C();
  v7 = OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_partitionCache;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAE38);
  swift_allocObject();
  *(_QWORD *)(v3 + v7) = sub_24A0004AC(1024);
  v8 = OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_contextCache;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAE30);
  swift_allocObject();
  *(_QWORD *)(v3 + v8) = sub_24A0004AC(1024);
  v9 = v3 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingPartition;
  v10 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)v9 = MEMORY[0x24BEE4AF8];
  *(_OWORD *)(v9 + 8) = xmmword_24A020BC0;
  v11 = v3 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingContext;
  *(_QWORD *)v11 = v10;
  *(_OWORD *)(v11 + 8) = xmmword_24A020BC0;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  *(_BYTE *)(v3 + 32) = a3;
  return v3;
}

void sub_24A0014C0(unsigned int a1, uint64_t a2, int a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  unint64_t v69;
  uint64_t v74;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[16];
  uint64_t v80;
  char v81;
  int v82;
  char v83;
  char v84;
  char v85;

  v13 = v12;
  v82 = a3;
  if (a6 >= 1 && a7 >= 1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAF30);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_24A0208F0;
    sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
    v16 = swift_allocObject();
    v76 = xmmword_24A0208B0;
    *(_OWORD *)(v16 + 16) = xmmword_24A0208B0;
    v17 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v16 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v16 + 64) = v17;
    *(_QWORD *)(v16 + 32) = a1;
    *(_QWORD *)(v15 + 32) = sub_24A01F09C();
    sub_24A01EFA0();
    v78 = v15;
    sub_249F98C10(a2, (uint64_t)&v84, &qword_2578FFD70);
    sub_249F98C10((uint64_t)&v84, (uint64_t)&v85, &qword_2578FFD70);
    v74 = v11;
    if (v85 != 2)
    {
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_24A0208B0;
      v19 = sub_249F990DC(0, (unint64_t *)&qword_2544CAD40);
      v20 = sub_24A01F1B0();
      *(_QWORD *)(v18 + 56) = v19;
      *(_QWORD *)(v18 + 64) = sub_24A007010(&qword_2578FFDE8, (unint64_t *)&qword_2544CAD40);
      *(_QWORD *)(v18 + 32) = v20;
      v21 = (uint64_t)(id)sub_24A01F09C();
      MEMORY[0x24BD06E34]();
      if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
LABEL_62:
        sub_24A01EFAC();
      sub_24A01EFD0();
      sub_24A01EFA0();

    }
    v22 = *(_QWORD *)(a2 + 8);
    if (v22 && *(_QWORD *)(v22 + 16))
    {
      v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = v76;
      *(_QWORD *)(v23 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
      *(_QWORD *)(v23 + 64) = sub_249F98C68((unint64_t *)&qword_2544CA2D8, &qword_2544CA2D0, MEMORY[0x24BDCFBF8]);
      *(_QWORD *)(v23 + 32) = v22;
      swift_bridgeObjectRetain();
      v24 = (id)sub_24A01F09C();
      MEMORY[0x24BD06E34]();
      if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24A01EFAC();
      sub_24A01EFD0();
      sub_24A01EFA0();

    }
    v25 = *(_QWORD *)(a2 + 16);
    if (v25 && *(_QWORD *)(v25 + 16))
    {
      v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = v76;
      *(_QWORD *)(v26 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
      *(_QWORD *)(v26 + 64) = sub_249F98C68((unint64_t *)&qword_2544CA2D8, &qword_2544CA2D0, MEMORY[0x24BDCFBF8]);
      *(_QWORD *)(v26 + 32) = v25;
      swift_bridgeObjectRetain();
      v27 = (id)sub_24A01F09C();
      MEMORY[0x24BD06E34]();
      if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24A01EFAC();
      sub_24A01EFD0();
      sub_24A01EFA0();

    }
    v21 = v13;
    sub_249F98C10(a2 + 24, (uint64_t)v79, &qword_2578FF560);
    sub_249F98C10((uint64_t)v79, (uint64_t)&v80, &qword_2578FF560);
    if ((v81 & 1) == 0)
    {
      v28 = v80;
      v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = v76;
      *(_QWORD *)(v29 + 56) = MEMORY[0x24BEE1768];
      *(_QWORD *)(v29 + 64) = MEMORY[0x24BEE17F0];
      *(_QWORD *)(v29 + 32) = v28;
      v30 = (id)sub_24A01F09C();
      MEMORY[0x24BD06E34]();
      if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v78 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24A01EFAC();
      sub_24A01EFD0();
      sub_24A01EFA0();

    }
    swift_bridgeObjectRetain();
    v31 = (void *)sub_24A01EF70();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v31);

    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_24A020920;
    v34 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
    v35 = (void *)sub_24A01EE44();
    v36 = objc_msgSend(v34, sel_initWithKey_ascending_, v35, 1);

    *(_QWORD *)(v33 + 32) = v36;
    v37 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
    v38 = (void *)sub_24A01EE44();
    v39 = objc_msgSend(v37, sel_initWithKey_ascending_, v38, 1);

    *(_QWORD *)(v33 + 40) = v39;
    v77 = v33;
    v40 = sub_24A01EFA0();
    MEMORY[0x24BDAC7A8](v40);
    v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
    sub_24A01F180();
    if (v21)
    {

      swift_bridgeObjectRelease();
LABEL_22:
      swift_bridgeObjectRelease();
      return;
    }
    swift_bridgeObjectRelease();

    v43 = *(_QWORD *)(v77 + 16);
    if (!v43)
    {

      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
    v67 = v32;
    *(_QWORD *)&v76 = 0;
    v44 = 0;
    v45 = 0;
    a5 &= 1u;
    v83 = 1;
    v46 = 64;
    v69 = v43;
    do
    {
      if (v43 >= v46)
        a2 = v46;
      else
        a2 = v43;
      v13 = v44 + 64;
      if (__OFADD__(v44, 64))
      {
        __break(1u);
LABEL_60:
        __break(1u);
LABEL_61:
        __break(1u);
        goto LABEL_62;
      }
      if (v13 >= v43)
        v21 = v43;
      else
        v21 = v44 + 64;
      if (v21 < v44)
        goto LABEL_60;
      v47 = *(_QWORD *)(v77 + 16);
      if (v47 < (unint64_t)v44 || v47 < v21)
        goto LABEL_61;
      sub_24A01F468();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain_n();
      v49 = swift_dynamicCastClass();
      if (!v49)
      {
        swift_bridgeObjectRelease();
        v49 = MEMORY[0x24BEE4AF8];
      }
      v50 = *(_QWORD *)(v49 + 16);
      swift_release();
      if (a2 + v45 == v50)
      {
        v51 = swift_dynamicCastClass();
        if (!v51)
        {
          swift_bridgeObjectRelease();
          v51 = MEMORY[0x24BEE4AF8];
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        v51 = sub_249FB51AC(v77, v77 + 32, v44, (2 * v21) | 1);
      }
      v52 = swift_bridgeObjectRelease();
      if ((v83 & 1) == 0)
      {

        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return;
      }
      v21 = MEMORY[0x24BD07458](v52);
      sub_24A0020F4(v74, v51, &v83, a1, a6, a7, a8, a9 & 1, v82, a4, a5, a10, a11);
      objc_autoreleasePoolPop((void *)v21);
      swift_release();
      v46 += 64;
      v45 -= 64;
      v44 += 64;
      v43 = v69;
    }
    while (v13 < (uint64_t)v69);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v69 < 0x3E9)
    {
      v53 = v74;
    }
    else
    {
      v53 = v74;
      swift_retain_n();
      v54 = sub_24A01ED90();
      v55 = sub_24A01F0D8();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v56 = 134217984;
        sub_24A01F138();
        sub_24A01F1F8();
        swift_release_n();
        _os_log_impl(&dword_249F70000, v54, v55, "Search partition cache hit rate: %f", v56, 0xCu);
        MEMORY[0x24BD07950](v56, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      swift_retain_n();
      v57 = sub_24A01ED90();
      v58 = sub_24A01F0D8();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v59 = 134217984;
        sub_24A01F138();
        sub_24A01F1F8();
        swift_release_n();
        _os_log_impl(&dword_249F70000, v57, v58, "Search context cache hit rate: %f", v59, 0xCu);
        MEMORY[0x24BD07950](v59, -1, -1);
      }
      else
      {
        swift_release_n();
      }

    }
    sub_249FB4868();
    sub_249FB488C();
    v60 = (_QWORD *)(v53 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingPartition);
    swift_beginAccess();
    v61 = MEMORY[0x24BEE4AF8];
    *v60 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    v62 = v60[1];
    v63 = v60[2];
    *(_OWORD *)(v60 + 1) = xmmword_24A020BC0;
    sub_249F92358(v62, v63);
    v64 = (_QWORD *)(v53 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingContext);
    swift_beginAccess();
    *v64 = v61;
    swift_bridgeObjectRelease();
    v65 = v64[1];
    v66 = v64[2];
    *(_OWORD *)(v64 + 1) = xmmword_24A020BC0;
    sub_249F92358(v65, v66);

  }
}

uint64_t sub_24A0020F4(uint64_t a1, uint64_t a2, _BYTE *a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, unsigned __int8 a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char v20;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = MEMORY[0x24BEE4AF8];
  v28 = MEMORY[0x24BEE4AF8];
  v29 = MEMORY[0x24BEE4AF8];
  v27 = MEMORY[0x24BEE4AF8];
  v17 = *(_QWORD *)(a1 + 16);
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_24A0208B0;
  *(_QWORD *)(v18 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
  *(_QWORD *)(v18 + 64) = sub_249F98C68((unint64_t *)&qword_2544CA2D8, &qword_2544CA2D0, MEMORY[0x24BDCFBF8]);
  *(_QWORD *)(v18 + 32) = a2;
  swift_bridgeObjectRetain();
  v26 = (void *)sub_24A01F09C();
  v19 = *(id *)(v17 + 16);
  sub_24A01F180();

  if (!v13)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = sub_24A00275C(a4, v30, v29, v28, v27, a5, a6, a7, a8 & 1, a9, a10, a11 & 1, a12, a13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a3 = v20 & 1;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A0023D0(void *a1, _QWORD **a2, _QWORD **a3, _QWORD **a4, unint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  id v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v47;
  uint64_t v48;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v48 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(a1, sel_identifier);
  v14 = *a2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a2 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v14 = sub_249F89B7C(0, v14[2] + 1, 1, v14);
    *a2 = v14;
  }
  v17 = v14[2];
  v16 = v14[3];
  if (v17 >= v16 >> 1)
    v14 = sub_249F89B7C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
  v14[2] = v17 + 1;
  v14[v17 + 4] = v13;
  *a2 = v14;
  v18 = objc_msgSend(a1, sel_embedding);
  if (v18)
  {
    v19 = v18;
    v20 = sub_24A01EAFC();
    v22 = v21;

  }
  else
  {
    v20 = 0;
    v22 = 0xF000000000000000;
  }
  v23 = *a3;
  v24 = swift_isUniquelyReferenced_nonNull_native();
  *a3 = v23;
  if ((v24 & 1) == 0)
  {
    v23 = sub_249F8A768(0, v23[2] + 1, 1, v23);
    *a3 = v23;
  }
  v26 = v23[2];
  v25 = v23[3];
  if (v26 >= v25 >> 1)
    v23 = sub_249F8A768((_QWORD *)(v25 > 1), v26 + 1, 1, v23);
  v23[2] = v26 + 1;
  v27 = &v23[2 * v26];
  v27[4] = v20;
  v27[5] = v22;
  *a3 = v23;
  v28 = objc_msgSend(a1, sel_contextualEmbedding);
  if (v28)
  {
    v29 = v28;
    v30 = sub_24A01EAFC();
    v32 = v31;

  }
  else
  {
    v30 = 0;
    v32 = 0xF000000000000000;
  }
  v33 = *a4;
  v34 = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v33;
  if ((v34 & 1) == 0)
  {
    v33 = sub_249F8A768(0, v33[2] + 1, 1, v33);
    *a4 = v33;
  }
  v36 = v33[2];
  v35 = v33[3];
  if (v36 >= v35 >> 1)
    v33 = sub_249F8A768((_QWORD *)(v35 > 1), v36 + 1, 1, v33);
  v33[2] = v36 + 1;
  v37 = &v33[2 * v36];
  v37[4] = v30;
  v37[5] = v32;
  *a4 = v33;
  v38 = objc_msgSend(a1, sel_moment);
  if (v38)
  {
    v39 = v38;
    sub_24A01EB98();

    v40 = sub_24A01EBA4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v12, 0, 1, v40);
  }
  else
  {
    v41 = sub_24A01EBA4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v12, 1, 1, v41);
  }
  v42 = *a5;
  v43 = swift_isUniquelyReferenced_nonNull_native();
  *a5 = v42;
  if ((v43 & 1) == 0)
  {
    v42 = sub_249F8A754(0, *(_QWORD *)(v42 + 16) + 1, 1, v42);
    *a5 = v42;
  }
  v45 = *(_QWORD *)(v42 + 16);
  v44 = *(_QWORD *)(v42 + 24);
  if (v45 >= v44 >> 1)
  {
    v42 = sub_249F8A754(v44 > 1, v45 + 1, 1, v42);
    *a5 = v42;
  }
  *(_QWORD *)(v42 + 16) = v45 + 1;
  return sub_249F98C10((uint64_t)v12, v42+ ((*(unsigned __int8 *)(v48 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v48 + 80))+ *(_QWORD *)(v48 + 72) * v45, &qword_2544CAD70);
}

uint64_t sub_24A00275C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, unsigned __int8 a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  int64_t v55;
  _QWORD *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  int64_t v62;
  int64_t v63;
  uint64_t isUniquelyReferenced_nonNull_native;
  int64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  unint64_t v74;
  uint64_t *v75;
  _QWORD *v76;
  _QWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  char v86;
  unint64_t v87;
  uint64_t v88;
  _BOOL8 v89;
  uint64_t v90;
  char v91;
  unint64_t v92;
  char v93;
  _QWORD *v94;
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
  void (*v105)(char *, uint64_t, uint64_t);
  char v106;
  uint64_t v107;
  uint64_t (*v108)(uint64_t, uint64_t, uint64_t);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD *v112;
  unint64_t v113;
  int v114;
  char v115;
  unint64_t v116;
  uint64_t v117;
  _BOOL8 v118;
  uint64_t v119;
  char v120;
  unint64_t v121;
  char v122;
  _QWORD *v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  unint64_t v128;
  void (*v129)(uint64_t, uint64_t);
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  uint64_t result;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD *v141;
  _QWORD *v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  _QWORD *v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  _QWORD *v158;
  uint64_t v159;
  uint64_t v160;
  unsigned int v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  _QWORD *v166;
  uint64_t v167;
  unint64_t v168;
  uint64_t v169;
  unint64_t v170;
  _QWORD *v171;

  v15 = v14;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v149 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v151 = (char *)&v140 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v153 = sub_24A01EBA4();
  v156 = *(_QWORD *)(v153 - 8);
  v26 = MEMORY[0x24BDAC7A8](v153);
  v160 = (uint64_t)&v140 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v155 = (char *)&v140 - v28;
  v29 = *(_QWORD *)(a2 + 16);
  if (!v29)
  {
    LOBYTE(v30) = 1;
    return v30 & 1;
  }
  v144 = a4;
  v145 = a6;
  v147 = a5;
  v146 = a8;
  v30 = v29;
  v169 = sub_24A006BCC(v29);
  v170 = v31;
  v32 = *(_QWORD *)(a3 + 16);
  v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v162 = v15;
  v161 = a1;
  v152 = a2;
  v148 = a3;
  v143 = v30;
  if (v32)
  {
    v159 = a7;
    v34 = *(_QWORD *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35 = 0;
    v36 = (unint64_t *)(a3 + 40);
    v37 = v30 - 1;
    v38 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v163 = v30 - 1;
    do
    {
      v39 = *v36;
      if (*v36 >> 60 != 15)
      {
        v40 = *(v36 - 1);
        sub_249F93CE0(v40, *v36);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v38 = sub_249F89B7C(0, v38[2] + 1, 1, v38);
        v30 = v38[2];
        v41 = v38[3];
        v42 = v38;
        if (v30 >= v41 >> 1)
          v42 = sub_249F89B7C((_QWORD *)(v41 > 1), v30 + 1, 1, v38);
        v38 = v42;
        v42[2] = v30 + 1;
        v42[v30 + 4] = v34;
        sub_24A01EB08();
        sub_249F92438(v40, v39);
        a2 = v152;
        v37 = v163;
      }
      if (v37 == v35)
        break;
      v36 += 2;
      v34 = *(_QWORD *)(a2 + 8 * v35++ + 40);
    }
    while (v32 != v35);
    v158 = v38;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v15 = v162;
    a1 = v161;
    v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v158 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v43 = v169;
  v44 = v170;
  sub_249F93CE0(v169, v170);
  v45 = v150;
  v46 = sub_249F9FE2C(a1, v43, v44);
  if (v45)
  {
    sub_249F92358(v43, v44);
    sub_249F92358(v43, v44);
    swift_bridgeObjectRelease();
    return v30 & 1;
  }
  v47 = v46;
  sub_249F92358(v43, v44);
  if (*(_QWORD *)(v47 + 16) >= v158[2])
    v48 = v158[2];
  else
    v48 = *(_QWORD *)(v47 + 16);
  v49 = (_QWORD *)MEMORY[0x24BEE4B00];
  if (v48)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2F0);
    v50 = sub_24A01F3FC();
  }
  else
  {
    v50 = MEMORY[0x24BEE4B00];
  }
  v166 = (_QWORD *)v50;
  v51 = (uint64_t)v158;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  sub_24A0064D8(v51, v47, 1, &v166);
  v150 = 0;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v141 = v166;
  v163 = *(_QWORD *)(v47 + 16);
  if (v163)
  {
    v159 = v47 + 32;
    v157 = v47;
    swift_bridgeObjectRetain();
    v52 = 0;
    v53 = v33;
    while (1)
    {
      v54 = *(_QWORD *)(v159 + 8 * v52);
      v55 = *(_QWORD *)(v54 + 16);
      if (v55)
      {
        v166 = v33;
        swift_bridgeObjectRetain();
        sub_249F8C9C8(0, v55, 0);
        v56 = v166;
        v57 = v166[2];
        v58 = 32;
        do
        {
          v59 = *(_QWORD *)(v54 + v58);
          v166 = v56;
          v60 = v56[3];
          if (v57 >= v60 >> 1)
          {
            sub_249F8C9C8(v60 > 1, v57 + 1, 1);
            v56 = v166;
          }
          v56[2] = v57 + 1;
          v56[v57 + 4] = v59;
          v58 += 16;
          ++v57;
          --v55;
        }
        while (v55);
        swift_bridgeObjectRelease();
        v33 = (_QWORD *)MEMORY[0x24BEE4AF8];
      }
      else
      {
        v56 = v33;
      }
      v61 = v56[2];
      v62 = v53[2];
      v63 = v62 + v61;
      if (__OFADD__(v62, v61))
      {
        __break(1u);
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
LABEL_97:
        LODWORD(v138) = 0;
        v137 = 1092;
        LOBYTE(v136) = 2;
        sub_24A01F408();
        __break(1u);
LABEL_98:
        sub_24A01F48C();
        __break(1u);
LABEL_99:
        sub_24A01F48C();
        __break(1u);
        result = swift_unexpectedError();
        __break(1u);
        return result;
      }
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) != 0 && v63 <= v53[3] >> 1)
      {
        if (v56[2])
          goto LABEL_43;
      }
      else
      {
        if (v62 <= v63)
          v65 = v62 + v61;
        else
          v65 = v62;
        v53 = sub_249F89B7C((_QWORD *)isUniquelyReferenced_nonNull_native, v65, 1, v53);
        if (v56[2])
        {
LABEL_43:
          v66 = v53[2];
          if ((v53[3] >> 1) - v66 < v61)
            goto LABEL_92;
          v67 = &v53[v66 + 4];
          if (v56 + 4 < &v67[v61] && v67 < &v56[v61 + 4])
            goto LABEL_97;
          memcpy(v67, v56 + 4, 8 * v61);
          if (v61)
          {
            v69 = v53[2];
            v70 = __OFADD__(v69, v61);
            v71 = v69 + v61;
            if (v70)
              goto LABEL_95;
            v53[2] = v71;
          }
          goto LABEL_26;
        }
      }
      if (v61)
        goto LABEL_90;
LABEL_26:
      ++v52;
      swift_bridgeObjectRelease();
      if (v52 == v163)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v15 = v162;
        LODWORD(a1) = v161;
        v49 = (_QWORD *)MEMORY[0x24BEE4B00];
        goto LABEL_54;
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v53 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_54:
  LODWORD(v159) = a12 & 1;
  v158 = (_QWORD *)a11;
  LODWORD(v157) = a10;
  v72 = sub_249FC6B8C((uint64_t)v53);
  swift_bridgeObjectRelease();
  v73 = sub_249FB50B4(v72);
  swift_bridgeObjectRelease();
  v171 = v49;
  v142 = v73;
  v74 = v73[2];
  if (v74)
  {
    v154 = *(_QWORD **)(v15 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_partitionCache);
    v75 = v142 + 4;
    v76 = (_QWORD *)MEMORY[0x24BEE4B00];
    do
    {
      v163 = v74;
      v81 = *v75++;
      v80 = v81;
      swift_retain();
      sub_249FE3488(v80, v154, a1, v80, v157, (uint64_t)v158, v159, v15, &v166);
      v82 = v166;
      v83 = v167;
      v84 = v168;
      v85 = swift_isUniquelyReferenced_nonNull_native();
      v165 = (unint64_t)v76;
      v87 = sub_249F8B27C(v81);
      v88 = v76[2];
      v89 = (v86 & 1) == 0;
      v90 = v88 + v89;
      if (__OFADD__(v88, v89))
        goto LABEL_91;
      v91 = v86;
      if (v76[3] >= v90)
      {
        if ((v85 & 1) != 0)
        {
          v76 = (_QWORD *)v165;
          if ((v86 & 1) != 0)
            goto LABEL_56;
        }
        else
        {
          sub_249FC1160();
          v76 = (_QWORD *)v165;
          if ((v91 & 1) != 0)
            goto LABEL_56;
        }
      }
      else
      {
        sub_249FB8A64(v90, v85);
        v92 = sub_249F8B27C(v80);
        if ((v91 & 1) != (v93 & 1))
          goto LABEL_98;
        v87 = v92;
        v76 = (_QWORD *)v165;
        if ((v91 & 1) != 0)
        {
LABEL_56:
          v77 = (_QWORD *)(v76[7] + 24 * v87);
          v78 = v77[1];
          v79 = v77[2];
          swift_bridgeObjectRelease();
          sub_249F92358(v78, v79);
          *v77 = v82;
          v77[1] = v83;
          v77[2] = v84;
          goto LABEL_57;
        }
      }
      v76[(v87 >> 6) + 8] |= 1 << v87;
      *(_QWORD *)(v76[6] + 8 * v87) = v80;
      v94 = (_QWORD *)(v76[7] + 24 * v87);
      *v94 = v82;
      v94[1] = v83;
      v94[2] = v84;
      v95 = v76[2];
      v70 = __OFADD__(v95, 1);
      v96 = v95 + 1;
      if (v70)
        goto LABEL_93;
      v76[2] = v96;
LABEL_57:
      v171 = v76;
      swift_bridgeObjectRelease();
      v15 = v162;
      v74 = v163 - 1;
      LODWORD(a1) = v161;
    }
    while (v163 != 1);
  }
  swift_release();
  v165 = MEMORY[0x24BEE4B00];
  v97 = v147;
  v98 = *(_QWORD *)(v147 + 16);
  if (!v98)
    goto LABEL_87;
  v154 = (_QWORD *)OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_contextCache;
  v99 = v147 + ((*(unsigned __int8 *)(v149 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v149 + 80));
  v100 = *(_QWORD *)(v149 + 72);
  swift_bridgeObjectRetain();
  v101 = (uint64_t)v151;
  v102 = v153;
  v103 = v156;
  v149 = v100;
  do
  {
    sub_249F99498(v99, v101);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v103 + 48))(v101, 1, v102) == 1)
    {
      sub_249FF7928(v101);
      goto LABEL_72;
    }
    v104 = v103;
    LODWORD(v163) = v159 != 0;
    v105 = *(void (**)(char *, uint64_t, uint64_t))(v103 + 32);
    v106 = a1;
    v107 = (uint64_t)v155;
    v105(v155, v101, v102);
    v108 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v104 + 16);
    v109 = v160;
    v110 = v108(v160, v107, v102);
    MEMORY[0x24BDAC7A8](v110);
    *((_BYTE *)&v140 - 48) = v106;
    *(&v140 - 5) = v107;
    LOBYTE(v136) = v157;
    v137 = (uint64_t)v158;
    LOBYTE(v138) = v163;
    v139 = v15;
    sub_24A0006FC(v107, (uint64_t)sub_24A006CB4, (uint64_t)(&v140 - 8), &v166);
    v112 = v166;
    v111 = v167;
    v163 = v168;
    v113 = v165;
    v114 = swift_isUniquelyReferenced_nonNull_native();
    v164 = v113;
    v165 = 0x8000000000000000;
    v116 = sub_249F8B20C(v109);
    v117 = *(_QWORD *)(v113 + 16);
    v118 = (v115 & 1) == 0;
    v119 = v117 + v118;
    if (__OFADD__(v117, v118))
      goto LABEL_94;
    v120 = v115;
    if (*(_QWORD *)(v113 + 24) >= v119)
    {
      if ((v114 & 1) != 0)
      {
        a1 = v164;
        if ((v115 & 1) == 0)
          goto LABEL_78;
      }
      else
      {
        sub_249FC0EC4();
        a1 = v164;
        if ((v120 & 1) == 0)
          goto LABEL_78;
      }
    }
    else
    {
      sub_249FB8684(v119, v114);
      v121 = sub_249F8B20C(v160);
      if ((v120 & 1) != (v122 & 1))
        goto LABEL_99;
      v116 = v121;
      a1 = v164;
      if ((v120 & 1) == 0)
      {
LABEL_78:
        *(_QWORD *)(a1 + 8 * (v116 >> 6) + 64) |= 1 << v116;
        v108(*(_QWORD *)(a1 + 48) + *(_QWORD *)(v156 + 72) * v116, v160, v153);
        v123 = (_QWORD *)(*(_QWORD *)(a1 + 56) + 24 * v116);
        *v123 = v112;
        v123[1] = v111;
        v123[2] = v163;
        v124 = *(_QWORD *)(a1 + 16);
        v70 = __OFADD__(v124, 1);
        v125 = v124 + 1;
        if (v70)
          goto LABEL_96;
        *(_QWORD *)(a1 + 16) = v125;
        goto LABEL_83;
      }
    }
    v126 = (_QWORD *)(*(_QWORD *)(a1 + 56) + 24 * v116);
    v127 = v126[1];
    v128 = v126[2];
    swift_bridgeObjectRelease();
    sub_249F92358(v127, v128);
    *v126 = v112;
    v126[1] = v111;
    v126[2] = v163;
LABEL_83:
    v165 = a1;
    swift_bridgeObjectRelease();
    v129 = *(void (**)(uint64_t, uint64_t))(v156 + 8);
    v102 = v153;
    v129(v160, v153);
    v129((uint64_t)v155, v102);
    v103 = v156;
    v15 = v162;
    LOBYTE(a1) = v161;
    v101 = (uint64_t)v151;
    v100 = v149;
LABEL_72:
    v99 += v100;
    --v98;
  }
  while (v98);
  v97 = v147;
  swift_bridgeObjectRelease();
LABEL_87:
  LOBYTE(v166) = 1;
  v130 = sub_249F990DC(0, (unint64_t *)&unk_2544CAEC0);
  MEMORY[0x24BDAC7A8](v130);
  *(&v140 - 14) = (uint64_t)&v166;
  v131 = v144;
  *(&v140 - 13) = v145;
  *(&v140 - 12) = v131;
  *(&v140 - 11) = v97;
  *(&v140 - 10) = (uint64_t)&v165;
  v132 = v152;
  *(&v140 - 9) = v15;
  *(&v140 - 8) = v132;
  v133 = v148;
  *(&v140 - 7) = v146;
  *(&v140 - 6) = v133;
  *(&v140 - 5) = (uint64_t)v141;
  v136 = &v171;
  LOBYTE(v137) = v134;
  BYTE1(v137) = a9 & 1;
  v138 = a13;
  v139 = a14;
  sub_24A01F114();
  sub_249F92358(v169, v170);
  swift_release();
  LOBYTE(v30) = (_BYTE)v166;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v30 & 1;
}

uint64_t sub_24A003378@<X0>(unsigned __int8 a1@<W0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v25;

  v25 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAF30);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24A0208F0;
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_24A0208C0;
  v12 = MEMORY[0x24BEE1768];
  v13 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v11 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v11 + 64) = v13;
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 96) = v12;
  *(_QWORD *)(v11 + 104) = v13;
  *(_QWORD *)(v11 + 72) = a2;
  *(_QWORD *)(v10 + 32) = sub_24A01F09C();
  sub_24A01EFA0();
  if ((a3 & 1) != 0)
  {
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_24A0208B0;
    *(_QWORD *)(v14 + 56) = v12;
    *(_QWORD *)(v14 + 64) = v13;
    *(_QWORD *)(v14 + 32) = 2;
    sub_24A01F09C();
    MEMORY[0x24BD06E34]();
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24A01EFAC();
    sub_24A01EFD0();
    sub_24A01EFA0();
  }
  if ((a5 & 1) == 0)
  {
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_24A0208B0;
    *(_QWORD *)(v15 + 56) = v12;
    *(_QWORD *)(v15 + 64) = v13;
    *(_QWORD *)(v15 + 32) = a4;
    sub_24A01F09C();
    MEMORY[0x24BD06E34]();
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24A01EFAC();
    sub_24A01EFD0();
    sub_24A01EFA0();
  }
  swift_bridgeObjectRetain();
  v16 = (void *)sub_24A01EF70();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v16);

  v19 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  v21 = v20;
  sub_24A01F180();

  swift_bridgeObjectRelease();
  *(_QWORD *)a6 = v25;
  *(_OWORD *)(a6 + 8) = xmmword_24A020BC0;
  swift_bridgeObjectRetain();
  sub_249F93CE0(0, 0xC000000000000000);
  swift_bridgeObjectRelease();
  return sub_249F92358(0, 0xC000000000000000);
}

uint64_t sub_24A003760@<X0>(unsigned __int8 a1@<W0>, char a2@<W2>, uint64_t a3@<X3>, char a4@<W4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v23;

  v23 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAF30);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_24A0208F0;
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_24A0208C0;
  v11 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v10 + 64) = v11;
  *(_QWORD *)(v10 + 32) = a1;
  v12 = sub_24A01EB80();
  *(_QWORD *)(v10 + 96) = sub_249F990DC(0, &qword_2578FFDD0);
  *(_QWORD *)(v10 + 104) = sub_24A007010(&qword_2578FFDD8, &qword_2578FFDD0);
  *(_QWORD *)(v10 + 72) = v12;
  *(_QWORD *)(v9 + 32) = sub_24A01F09C();
  sub_24A01EFA0();
  if ((a2 & 1) != 0)
  {
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_24A0208B0;
    *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v13 + 64) = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v13 + 32) = 2;
    sub_24A01F09C();
    MEMORY[0x24BD06E34]();
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24A01EFAC();
    sub_24A01EFD0();
    sub_24A01EFA0();
  }
  if ((a4 & 1) == 0)
  {
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_24A0208B0;
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v14 + 64) = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v14 + 32) = a3;
    sub_24A01F09C();
    MEMORY[0x24BD06E34]();
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_24A01EFAC();
    sub_24A01EFD0();
    sub_24A01EFA0();
  }
  swift_bridgeObjectRetain();
  v15 = (void *)sub_24A01EF70();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v15);

  v18 = MEMORY[0x24BDAC7A8](v17);
  MEMORY[0x24BDAC7A8](v18);
  v20 = v19;
  sub_24A01F180();

  swift_bridgeObjectRelease();
  *(_QWORD *)a5 = v23;
  *(_OWORD *)(a5 + 8) = xmmword_24A020BC0;
  swift_bridgeObjectRetain();
  sub_249F93CE0(0, 0xC000000000000000);
  swift_bridgeObjectRelease();
  return sub_249F92358(0, 0xC000000000000000);
}

id sub_24A003BB4(void *a1, _QWORD **a2, SEL *a3)
{
  id result;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;

  result = objc_msgSend(a1, *a3);
  if (result)
  {
    v6 = result;
    v7 = sub_24A01EAFC();
    v9 = v8;

    v10 = objc_msgSend(a1, sel_identifier);
    v11 = *a2;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_249F89B7C(0, v11[2] + 1, 1, v11);
      *a2 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
      v11 = sub_249F89B7C((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
    v11[2] = v14 + 1;
    v11[v14 + 4] = v10;
    *a2 = v11;
    sub_24A01EB08();
    return (id)sub_249F92358(v7, v9);
  }
  return result;
}

uint64_t sub_24A003CCC(unint64_t a1, _BYTE *a2, int64_t a3, uint64_t a4, unint64_t *a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t *a9, uint64_t a10, uint64_t a11, uint64_t *a12, char a13, unsigned __int8 a14, char *a15, unint64_t *a16)
{
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t result;
  uint64_t v28;
  unint64_t v29;
  uint64_t inited;
  unint64_t *v31;
  _QWORD *v32;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  void (*v52)(unint64_t, uint64_t);
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t **v60;
  unint64_t v61;
  char *v62;
  unint64_t *v63;
  float v64;
  char *v65;
  char *v66;
  float v67;
  char v68;
  char v69;
  uint64_t v70;
  _BOOL8 v71;
  uint64_t v72;
  char v73;
  unint64_t v74;
  char v75;
  float v76;
  uint64_t v77;
  BOOL v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  int64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  float v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t *v99;
  unint64_t v100;
  char v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  _QWORD *v109;
  uint64_t v110;
  unint64_t *v111;
  uint64_t *v112;
  char *v113;
  unint64_t v114;
  float v115;
  uint64_t v116;
  unint64_t v117;
  char v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  unint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t v125;
  char v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  unint64_t v135;
  char *v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  int v143;
  char *v144;
  uint64_t v145;
  int v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t v149;
  int64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  int64_t v155;
  int v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  char v163;
  char v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  unint64_t *v168;
  _BYTE *v169;
  uint64_t v170;
  _QWORD *v171;
  _QWORD *v172;
  uint64_t v173;
  unint64_t v174;
  unint64_t v175;
  unint64_t v176;
  _QWORD *v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t *v183;
  unint64_t v184;
  char *v185;
  uint64_t *v186;
  unint64_t *v187;
  uint64_t v188[3];

  v176 = a8;
  v170 = a7;
  v175 = a1;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (uint64_t *)((char *)&v165 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = sub_24A01EBA4();
  v26 = *(_QWORD **)(v25 - 8);
  result = MEMORY[0x24BDAC7A8](v25);
  v29 = (unint64_t)&v165 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v169 = a2;
  if (*a2 != 1)
    return result;
  type metadata accessor for MinHeap();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = MEMORY[0x24BEE4AF8];
  v31 = (unint64_t *)(inited + 16);
  v186 = (uint64_t *)inited;
  *(_QWORD *)(inited + 24) = a3;
  swift_beginAccess();
  v187 = v31;
  v32 = (_QWORD *)*v31;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || a3 > v32[3] >> 1)
  {
    if (v32[2] <= a3)
      v34 = a3;
    else
      v34 = v32[2];
    v32 = sub_249F89A50(isUniquelyReferenced_nonNull_native, v34, 0, v32);
  }
  *v187 = (unint64_t)v32;
  swift_endAccess();
  v35 = v175;
  if ((v175 & 0x8000000000000000) != 0)
    goto LABEL_201;
  if (*(_QWORD *)(a4 + 16) <= v175)
    goto LABEL_202;
  v36 = a4 + 16 * v175;
  v174 = *(_QWORD *)(v36 + 40);
  if (v174 >> 60 != 15)
  {
    if (a5[2] <= v175)
      goto LABEL_205;
    a4 = *(_QWORD *)(v36 + 32);
    sub_249F99498((uint64_t)a5+ ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))+ *(_QWORD *)(v22 + 72) * v175, (uint64_t)v24);
    v38 = ((uint64_t (*)(uint64_t *, uint64_t, uint64_t))v26[6])(v24, 1, v25);
    v173 = a4;
    if (v38 == 1)
    {
      v22 = v174;
      sub_249F93CE0(a4, v174);
      sub_249FF7928((uint64_t)v24);
      v26 = (_QWORD *)MEMORY[0x24BEE4AF8];
      goto LABEL_24;
    }
    ((void (*)(unint64_t, uint64_t *, uint64_t))v26[4])(v29, v24, v25);
    v39 = *(_QWORD *)a6;
    v40 = *(_QWORD *)(*(_QWORD *)a6 + 16);
    v22 = v174;
    sub_249F93CE0(a4, v174);
    if (v40 && (v41 = sub_249F8B20C(v29), (v42 & 1) != 0))
    {
      v43 = (uint64_t *)(*(_QWORD *)(v39 + 56) + 24 * v41);
      v44 = *v43;
      a6 = v43[1];
      v24 = (uint64_t *)v43[2];
      swift_bridgeObjectRetain();
      sub_249F93CE0(a6, (unint64_t)v24);
      swift_bridgeObjectRetain();
      sub_249F93CE0(a6, (unint64_t)v24);
      sub_249F92358(a6, (unint64_t)v24);
      v45 = *(_QWORD *)(v44 + 16);
      swift_bridgeObjectRelease();
      if (v45 >= 2)
      {
        swift_bridgeObjectRetain();
        sub_249F93CE0(a6, (unint64_t)v24);
        v46 = sub_249F8A874(0, 1, 1, MEMORY[0x24BEE4AF8]);
        v48 = v46[2];
        v47 = v46[3];
        v49 = v46;
        if (v48 >= v47 >> 1)
          v49 = sub_249F8A874((_QWORD *)(v47 > 1), v48 + 1, 1, v46);
        v50 = v49;
        v49[2] = v48 + 1;
        v51 = &v49[3 * v48];
        v51[4] = v44;
        v51[5] = a6;
        v51[6] = v24;
        swift_bridgeObjectRelease();
        sub_249F92358(a6, (unint64_t)v24);
        v52 = (void (*)(unint64_t, uint64_t))v26[1];
        v26 = v50;
        v52(v29, v25);
        goto LABEL_23;
      }
LABEL_187:
      ((void (*)(unint64_t, uint64_t))v26[1])(v29, v25);
      swift_bridgeObjectRelease();
      sub_249F92358(a6, (unint64_t)v24);
    }
    else
    {
      ((void (*)(unint64_t, uint64_t))v26[1])(v29, v25);
    }
    v26 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_23:
    a4 = v173;
LABEL_24:
    a5 = (unint64_t *)(v170 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingContext);
    swift_beginAccess();
    a6 = *a5;
    v53 = a5[1];
    v54 = a5[2];
    swift_bridgeObjectRetain();
    sub_249F93CE0(v53, v54);
    sub_249F92358(v53, v54);
    v24 = *(uint64_t **)(a6 + 16);
    swift_bridgeObjectRelease();
    v29 = v176;
    if (!v24)
    {
      v179 = v26[2];
      if (!v179)
        goto LABEL_181;
      goto LABEL_30;
    }
    a6 = *a5;
    v24 = (uint64_t *)a5[1];
    a5 = (unint64_t *)a5[2];
    swift_bridgeObjectRetain();
    sub_249F93CE0((uint64_t)v24, (unint64_t)a5);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
LABEL_26:
      v56 = v26[2];
      v55 = v26[3];
      v179 = v56 + 1;
      if (v56 >= v55 >> 1)
        v26 = sub_249F8A874((_QWORD *)(v55 > 1), v179, 1, v26);
      v26[2] = v179;
      v57 = &v26[3 * v56];
      v57[4] = a6;
      v57[5] = v24;
      v57[6] = a5;
LABEL_30:
      v58 = 0;
      v183 = a9;
      v178 = *(_QWORD *)(v170 + 16);
      v177 = v26 + 4;
      v172 = (_QWORD *)(v29 + 32);
      v37 = MEMORY[0x24BEE4B00];
      v171 = v26;
      do
      {
        if (v58 >= v26[2])
          goto LABEL_193;
        v60 = (unint64_t **)&v177[3 * v58];
        a5 = *v60;
        v59 = (uint64_t)v60[1];
        v61 = (unint64_t)v60[2];
        a6 = *(_QWORD *)(v178 + 24);
        swift_bridgeObjectRetain();
        sub_249F93CE0(v59, v61);
        v182 = (uint64_t *)v61;
        sub_24A0155B4(a4, v22);
        v24 = (uint64_t *)*((_QWORD *)v62 + 2);
        if (v24)
        {
          v180 = v59;
          v181 = v58;
          a6 = a5[2];
          v63 = a5;
          if (a6)
          {
            if (*(_QWORD *)(v29 + 16) <= (int64_t)v175)
              goto LABEL_198;
            v64 = *((float *)v62 + 8);
            v26 = (_QWORD *)v172[v175];
            v185 = v62;
            swift_bridgeObjectRetain();
            v65 = v185;
            v22 = 0;
            v66 = v185 + 36;
            a5 = (unint64_t *)((char *)v24 - 1);
            v184 = (unint64_t)v63;
            while (v22 < v63[2])
            {
              a4 = v63[v22 + 4];
              if ((_QWORD *)a4 != v26)
              {
                v67 = *((float *)v183 + 15);
                v24 = (uint64_t *)v37;
                v68 = swift_isUniquelyReferenced_nonNull_native();
                v188[0] = (uint64_t)v24;
                v29 = sub_249F8B27C(a4);
                v70 = v24[2];
                v71 = (v69 & 1) == 0;
                v72 = v70 + v71;
                if (__OFADD__(v70, v71))
                  goto LABEL_190;
                v73 = v69;
                if (v24[3] >= v72)
                {
                  if ((v68 & 1) == 0)
                  {
                    v24 = v188;
                    sub_249FC226C();
                  }
                }
                else
                {
                  sub_249FBA62C(v72, v68);
                  v24 = (uint64_t *)v188[0];
                  v74 = sub_249F8B27C(a4);
                  if ((v73 & 1) != (v75 & 1))
                  {
                    sub_24A01F48C();
                    __break(1u);
                    goto LABEL_209;
                  }
                  v29 = v74;
                }
                v76 = v64 * v67;
                v37 = v188[0];
                if ((v73 & 1) != 0)
                {
                  *(float *)(*(_QWORD *)(v188[0] + 56) + 4 * v29) = v76;
                }
                else
                {
                  *(_QWORD *)(v188[0] + 8 * (v29 >> 6) + 64) |= 1 << v29;
                  *(_QWORD *)(*(_QWORD *)(v37 + 48) + 8 * v29) = a4;
                  *(float *)(*(_QWORD *)(v37 + 56) + 4 * v29) = v76;
                  v77 = *(_QWORD *)(v37 + 16);
                  v78 = __OFADD__(v77, 1);
                  v79 = v77 + 1;
                  if (v78)
                    goto LABEL_192;
                  *(_QWORD *)(v37 + 16) = v79;
                }
                swift_bridgeObjectRelease();
                v65 = v185;
                v63 = (unint64_t *)v184;
              }
              if (a5 == (unint64_t *)v22)
                goto LABEL_31;
              if (v22 + 1 >= *((_QWORD *)v65 + 2))
                goto LABEL_189;
              v64 = *(float *)&v66[4 * v22++];
              if (a6 == v22)
              {
LABEL_31:
                swift_bridgeObjectRelease();
                v29 = v176;
                v22 = v174;
                a4 = v173;
                v26 = v171;
                a5 = v63;
                goto LABEL_32;
              }
            }
            __break(1u);
LABEL_189:
            __break(1u);
LABEL_190:
            __break(1u);
            goto LABEL_191;
          }
LABEL_32:
          v58 = v181;
          v59 = v180;
        }
        ++v58;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_249F92358(v59, (unint64_t)v182);
      }
      while (v58 != v179);
      swift_bridgeObjectRelease();
      goto LABEL_58;
    }
LABEL_207:
    v26 = sub_249F8A874(0, v26[2] + 1, 1, v26);
    goto LABEL_26;
  }
  v37 = MEMORY[0x24BEE4B00];
  v29 = v176;
  while (1)
  {
    if (*(_QWORD *)(a10 + 16) <= v35)
      goto LABEL_203;
    v80 = a14;
    v81 = a10 + 16 * v35;
    a4 = *(_QWORD *)(v81 + 32);
    v82 = *(_QWORD *)(v81 + 40);
    v83 = v81 + 32;
    v178 = v82;
    if (v82 >> 60 == 15)
    {
      v168 = 0;
      if ((a14 & 1) != 0)
        goto LABEL_161;
      goto LABEL_62;
    }
LABEL_95:
    if (*(_QWORD *)(v29 + 16) <= v35)
      goto LABEL_206;
    v166 = v83;
    v167 = v80;
    v22 = *(_QWORD *)(v29 + 8 * v35 + 32);
    if (*(_QWORD *)(a11 + 16) && (v100 = sub_249F8B27C(*(_QWORD *)(v29 + 8 * v35 + 32)), (v101 & 1) != 0))
    {
      v102 = *(_QWORD *)(*(_QWORD *)(a11 + 56) + 8 * v100);
      swift_bridgeObjectRetain();
    }
    else
    {
      v102 = MEMORY[0x24BEE4AF8];
    }
    sub_249F93CE0(a4, v178);
    v103 = sub_24A0002FC(v102, a12);
    v168 = 0;
    swift_bridgeObjectRelease();
    a5 = (unint64_t *)(v170 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingPartition);
    swift_beginAccess();
    a6 = *a5;
    v104 = a5[1];
    v105 = a5[2];
    swift_bridgeObjectRetain();
    sub_249F93CE0(v104, v105);
    sub_249F92358(v104, v105);
    v24 = *(uint64_t **)(a6 + 16);
    swift_bridgeObjectRelease();
    if (!v24)
      break;
    v106 = *a5;
    v24 = (uint64_t *)a5[1];
    a5 = (unint64_t *)a5[2];
    swift_bridgeObjectRetain();
    sub_249F93CE0((uint64_t)v24, (unint64_t)a5);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v103 = sub_249F8A874(0, v103[2] + 1, 1, v103);
    v108 = v103[2];
    v107 = v103[3];
    v177 = (_QWORD *)(v108 + 1);
    if (v108 >= v107 >> 1)
      v103 = sub_249F8A874((_QWORD *)(v107 > 1), (int64_t)v177, 1, v103);
    v103[2] = v177;
    v109 = &v103[3 * v108];
    v109[4] = v106;
    v109[5] = v24;
    v109[6] = a5;
LABEL_107:
    a6 = 0;
    v174 = (unint64_t)(v103 + 4);
    v110 = 128;
    if (a13 == 6)
      v110 = 768;
    v173 = v110;
    v180 = v22;
    v171 = (_QWORD *)a4;
    v172 = v103;
    while (1)
    {
      if (a6 >= v103[2])
        goto LABEL_199;
      v179 = a6;
      v111 = (unint64_t *)(v174 + 24 * a6);
      a6 = *v111;
      a5 = (unint64_t *)v111[1];
      v26 = (_QWORD *)v111[2];
      swift_bridgeObjectRetain();
      sub_249F93CE0((uint64_t)a5, (unint64_t)v26);
      sub_24A0155B4(a4, v178);
      v24 = v112;
      swift_bridgeObjectRetain();
      sub_249F93CE0((uint64_t)a5, (unint64_t)v26);
      sub_249F92358((uint64_t)a5, (unint64_t)v26);
      v113 = *(char **)(a6 + 16);
      swift_bridgeObjectRelease();
      v185 = v113;
      if (v113)
        break;
      swift_bridgeObjectRelease();
LABEL_111:
      a6 = v179 + 1;
      swift_bridgeObjectRelease();
      sub_249F92358((uint64_t)a5, (unint64_t)v26);
      v29 = v176;
      v103 = v172;
      if ((_QWORD *)a6 == v177)
        goto LABEL_176;
    }
    a4 = 0;
    v114 = a6 + 32;
    v183 = v24;
    v182 = v24 + 4;
    v29 = (unint64_t)v187;
    v184 = a6 + 32;
    while (1)
    {
      swift_bridgeObjectRetain();
      sub_249F93CE0((uint64_t)a5, (unint64_t)v26);
      sub_249F92358((uint64_t)a5, (unint64_t)v26);
      v24 = *(uint64_t **)(v114 + 8 * a4);
      swift_bridgeObjectRelease();
      if (v24 == (uint64_t *)v22)
        goto LABEL_116;
      if (a4 >= (unint64_t)v183[2])
      {
LABEL_191:
        __break(1u);
LABEL_192:
        __break(1u);
LABEL_193:
        __break(1u);
LABEL_194:
        __break(1u);
        goto LABEL_195;
      }
      v115 = *((float *)v182 + a4);
      swift_bridgeObjectRetain();
      sub_249F93CE0((uint64_t)a5, (unint64_t)v26);
      sub_249F92358((uint64_t)a5, (unint64_t)v26);
      v116 = *(_QWORD *)(v114 + 8 * a4);
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v37 + 16))
      {
        v24 = (uint64_t *)v37;
        v117 = sub_249F8B27C(v116);
        if ((v118 & 1) != 0)
        {
          v119 = *(_QWORD *)(v37 + 56);
          if (v115 <= (float)((float)(v115 + *(float *)(v119 + 4 * v117)) * 0.5))
            v115 = (float)(v115 + *(float *)(v119 + 4 * v117)) * 0.5;
          v24 = (uint64_t *)v37;
          v120 = sub_249F8B27C(v116);
          if ((v121 & 1) != 0)
          {
            v122 = v120;
            v123 = swift_isUniquelyReferenced_nonNull_native();
            v188[0] = v37;
            if ((v123 & 1) == 0)
            {
              v24 = v188;
              sub_249FC226C();
              v37 = v188[0];
            }
            sub_249FBE860(v122, v37);
            swift_bridgeObjectRelease();
          }
        }
      }
      swift_bridgeObjectRetain();
      sub_249F93CE0((uint64_t)a5, (unint64_t)v26);
      sub_249F92358((uint64_t)a5, (unint64_t)v26);
      v114 = v184;
      v22 = *(_QWORD *)(v184 + 8 * a4);
      swift_bridgeObjectRelease();
      v124 = v186[2];
      v125 = *(_QWORD *)(v124 + 16);
      if (v125 < v186[3])
        break;
      if (!v125)
        goto LABEL_194;
      if (*(float *)(v124 + 40) < v115)
      {
        swift_beginAccess();
        v147 = *(uint64_t **)v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        {
          if (!v147[2])
            goto LABEL_196;
        }
        else
        {
          v147 = sub_24A006B90(v147);
          if (!v147[2])
            goto LABEL_196;
        }
        v147[4] = v22;
        *((float *)v147 + 10) = v115;
        v186[2] = (uint64_t)v147;
        swift_endAccess();
        sub_249FE322C();
        goto LABEL_155;
      }
      v22 = v180;
LABEL_116:
      if ((char *)++a4 == v185)
      {
        swift_bridgeObjectRelease();
        a4 = (uint64_t)v171;
        v24 = v183;
        goto LABEL_111;
      }
    }
    swift_beginAccess();
    v24 = *(uint64_t **)v29;
    v126 = swift_isUniquelyReferenced_nonNull_native();
    v181 = v37;
    if ((v126 & 1) == 0)
      v24 = sub_249F89A50(0, v24[2] + 1, 1, v24);
    v128 = v24[2];
    v127 = v24[3];
    if (v128 >= v127 >> 1)
      v24 = sub_249F89A50((_QWORD *)(v127 > 1), v128 + 1, 1, v24);
    v24[2] = v128 + 1;
    v129 = &v24[2 * v128];
    v129[4] = v22;
    *((float *)v129 + 10) = v115;
    *(_QWORD *)v29 = v24;
    swift_endAccess();
    v130 = v24[2];
    if (!v130)
    {
LABEL_154:
      v37 = v181;
LABEL_155:
      v22 = v180;
      v114 = v184;
      goto LABEL_116;
    }
    v131 = v130 - 1;
    if (v130 >= 2)
      v132 = v130 - 2;
    else
      v132 = v130 - 1;
    v133 = v132 >> 1;
    v134 = *(uint64_t **)v29;
    v135 = *(_QWORD *)(*(_QWORD *)v29 + 16);
    if (v133 < v135)
    {
      while (v131 < v135)
      {
        v139 = v133;
        v22 = 16 * v133;
        v25 = 16 * v131;
        if (*(float *)&v134[2 * v131 + 5] >= *(float *)&v134[2 * v133 + 5])
          goto LABEL_154;
        swift_beginAccess();
        if (v139 != v131)
        {
          v24 = *(uint64_t **)v29;
          v140 = *(_QWORD *)(*(_QWORD *)v29 + 16);
          if (v139 >= v140)
          {
            __break(1u);
LABEL_186:
            __break(1u);
            goto LABEL_187;
          }
          if (v131 >= v140)
            goto LABEL_186;
          v141 = (char *)v24 + v22 + 32;
          v142 = *(_QWORD *)v141;
          v143 = *((_DWORD *)v141 + 2);
          v144 = (char *)v24 + v25 + 32;
          v145 = *(_QWORD *)v144;
          v146 = *((_DWORD *)v144 + 2);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v24 = sub_24A006B90(v24);
          v136 = (char *)v24 + v22 + 32;
          *(_QWORD *)v136 = v145;
          *((_DWORD *)v136 + 2) = v146;
          v137 = (char *)v24 + v25 + 32;
          *(_QWORD *)v137 = v142;
          *((_DWORD *)v137 + 2) = v143;
          v29 = (unint64_t)v187;
          *v187 = (unint64_t)v24;
        }
        swift_endAccess();
        v138 = v139 - 1;
        if (v139 < 1)
          v138 = v139;
        v133 = v138 >> 1;
        v134 = *(uint64_t **)v29;
        v135 = *(_QWORD *)(*(_QWORD *)v29 + 16);
        v131 = v139;
        if (v133 >= (uint64_t)v135)
          goto LABEL_179;
      }
    }
    else
    {
LABEL_179:
      __break(1u);
    }
    __break(1u);
LABEL_181:
    swift_bridgeObjectRelease();
    v37 = MEMORY[0x24BEE4B00];
LABEL_58:
    sub_249F92438(a4, v22);
    v35 = v175;
  }
  v177 = (_QWORD *)v103[2];
  if (v177)
    goto LABEL_107;
LABEL_176:
  swift_bridgeObjectRelease();
  sub_249F92438(a4, v178);
  if (*(_QWORD *)(v166 + 8) >> 60 == 15)
  {
    if ((v167 & 1) != 0)
      goto LABEL_161;
  }
  else if ((v167 & 1) != 0 || !*(_BYTE *)(v170 + 32))
  {
    goto LABEL_161;
  }
LABEL_62:
  a5 = (unint64_t *)(v37 + 64);
  v84 = 1 << *(_BYTE *)(v37 + 32);
  v85 = -1;
  if (v84 < 64)
    v85 = ~(-1 << v84);
  v86 = (_QWORD *)v37;
  v37 = v85 & *(_QWORD *)(v37 + 64);
  v87 = (unint64_t)(v84 + 63) >> 6;
  v26 = v86;
  swift_bridgeObjectRetain();
  a4 = 0;
  while (v37)
  {
    v88 = __clz(__rbit64(v37));
    v37 &= v37 - 1;
    v89 = v88 | (a4 << 6);
LABEL_78:
    v22 = *(_QWORD *)(v26[6] + 8 * v89);
    v92 = *(float *)(v26[7] + 4 * v89);
    v93 = v186[2];
    v94 = *(_QWORD *)(v93 + 16);
    if (v94 >= v186[3])
    {
      if (!v94)
      {
LABEL_195:
        __break(1u);
LABEL_196:
        __break(1u);
LABEL_197:
        __break(1u);
LABEL_198:
        __break(1u);
LABEL_199:
        __break(1u);
LABEL_200:
        __break(1u);
LABEL_201:
        __break(1u);
LABEL_202:
        __break(1u);
LABEL_203:
        __break(1u);
        goto LABEL_204;
      }
      if (*(float *)(v93 + 40) < v92)
      {
        v99 = v187;
        swift_beginAccess();
        a6 = *v99;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          a6 = (unint64_t)sub_24A006B90((_QWORD *)a6);
          if (*(_QWORD *)(a6 + 16))
            goto LABEL_88;
LABEL_94:
          __break(1u);
          goto LABEL_95;
        }
        if (!*(_QWORD *)(a6 + 16))
          goto LABEL_94;
LABEL_88:
        *(_QWORD *)(a6 + 32) = v22;
        *(float *)(a6 + 40) = v92;
        v24 = v186;
        v186[2] = a6;
        swift_endAccess();
        sub_249FE322C();
      }
    }
    else
    {
      v95 = v187;
      swift_beginAccess();
      a6 = *v95;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        a6 = (unint64_t)sub_249F89A50(0, *(_QWORD *)(a6 + 16) + 1, 1, (_QWORD *)a6);
      v97 = *(_QWORD *)(a6 + 16);
      v96 = *(_QWORD *)(a6 + 24);
      if (v97 >= v96 >> 1)
        a6 = (unint64_t)sub_249F89A50((_QWORD *)(v96 > 1), v97 + 1, 1, (_QWORD *)a6);
      *(_QWORD *)(a6 + 16) = v97 + 1;
      v98 = a6 + 16 * v97;
      *(_QWORD *)(v98 + 32) = v22;
      *(float *)(v98 + 40) = v92;
      v24 = v186;
      v186[2] = a6;
      swift_endAccess();
      sub_249FE30B8();
    }
  }
  v78 = __OFADD__(a4++, 1);
  if (v78)
    goto LABEL_197;
  if (a4 < v87)
  {
    v90 = a5[a4];
    if (!v90)
    {
      v37 = (uint64_t)v26;
      v91 = a4 + 1;
      if (a4 + 1 >= v87)
        goto LABEL_160;
      v90 = a5[v91];
      if (!v90)
      {
        v91 = a4 + 2;
        if (a4 + 2 >= v87)
          goto LABEL_160;
        v90 = a5[v91];
        if (!v90)
        {
          v91 = a4 + 3;
          if (a4 + 3 >= v87)
            goto LABEL_160;
          v90 = a5[v91];
          if (!v90)
          {
            while (1)
            {
              a4 = v91 + 1;
              if (__OFADD__(v91, 1))
                goto LABEL_200;
              if (a4 >= v87)
                goto LABEL_160;
              v90 = a5[a4];
              ++v91;
              if (v90)
                goto LABEL_77;
            }
          }
        }
      }
      a4 = v91;
    }
LABEL_77:
    v37 = (v90 - 1) & v90;
    v89 = __clz(__rbit64(v90)) + (a4 << 6);
    goto LABEL_78;
  }
  v37 = (uint64_t)v26;
LABEL_160:
  swift_release();
LABEL_161:
  a6 = *v187;
  v188[0] = *v187;
  swift_bridgeObjectRetain_n();
  a5 = v168;
  sub_24A000444(v188);
  if (a5)
  {
LABEL_209:
    result = swift_release();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v29 + 16) <= (int64_t)v175)
  {
LABEL_204:
    __break(1u);
LABEL_205:
    __break(1u);
LABEL_206:
    __break(1u);
    goto LABEL_207;
  }
  v181 = v37;
  v148 = v188[0];
  v149 = *(_QWORD *)(v29 + 8 * v175 + 32);
  v150 = *(_QWORD *)(v188[0] + 16);
  if (v150)
  {
    v185 = a15;
    v187 = a16;
    v151 = MEMORY[0x24BEE4AF8];
    v188[0] = MEMORY[0x24BEE4AF8];
    sub_249F8CC30(0, v150, 0);
    v152 = v188[0];
    v153 = *(_QWORD *)(v188[0] + 16);
    v154 = 40;
    v155 = v150;
    do
    {
      v156 = *(_DWORD *)(v148 + v154);
      v188[0] = v152;
      v157 = *(_QWORD *)(v152 + 24);
      if (v153 >= v157 >> 1)
      {
        sub_249F8CC30(v157 > 1, v153 + 1, 1);
        v152 = v188[0];
      }
      *(_QWORD *)(v152 + 16) = v153 + 1;
      *(_DWORD *)(v152 + 4 * v153 + 32) = v156;
      v154 += 16;
      ++v153;
      --v155;
    }
    while (v155);
    v188[0] = v151;
    sub_249F8C9C8(0, v150, 0);
    v158 = v188[0];
    v159 = *(_QWORD *)(v188[0] + 16);
    v160 = 32;
    do
    {
      v161 = *(_QWORD *)(v148 + v160);
      v188[0] = v158;
      v162 = *(_QWORD *)(v158 + 24);
      if (v159 >= v162 >> 1)
      {
        sub_249F8C9C8(v162 > 1, v159 + 1, 1);
        v158 = v188[0];
      }
      *(_QWORD *)(v158 + 16) = v159 + 1;
      *(_QWORD *)(v158 + 8 * v159 + 32) = v161;
      v160 += 16;
      ++v159;
      --v150;
    }
    while (v150);
    swift_release();
    v163 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v185)(v149, v152, v158);
  }
  else
  {
    swift_release();
    v163 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD))a15)(v149, MEMORY[0x24BEE4AF8], MEMORY[0x24BEE4AF8]);
  }
  v164 = v163;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  *v169 = v164 & 1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A005098(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char v32;
  unint64_t v33;
  unint64_t v34;

  v7 = a4;
  v8 = result;
  if (a3 >> 60 != 15)
  {
    v11 = (_QWORD *)(v5 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingPartition);
    swift_beginAccess();
    v12 = (_QWORD *)*v11;
    v13 = v11[1];
    v14 = v11[2];
    sub_249F93CCC(a2, a3);
    swift_bridgeObjectRetain();
    sub_249F93CE0(v13, v14);
    sub_249F92358(v13, v14);
    v15 = v12[2];
    if (v15)
    {
      if (v12[4] == v8)
      {
LABEL_7:
        swift_bridgeObjectRelease();
        __asm { BR              X11 }
      }
      v16 = 0;
      v17 = v15 - 1;
      while (v17 != v16)
      {
        v18 = v12[v16++ + 5];
        if (v18 == v8)
          goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v19 = (_QWORD *)*v11;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v11 = v19;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v19 = sub_249F89B7C(0, v19[2] + 1, 1, v19);
      *v11 = v19;
    }
    v22 = v19[2];
    v21 = v19[3];
    if (v22 >= v21 >> 1)
    {
      v19 = sub_249F89B7C((_QWORD *)(v21 > 1), v22 + 1, 1, v19);
      *v11 = v19;
    }
    v7 = a4;
    v19[2] = v22 + 1;
    v19[v22 + 4] = v8;
    sub_24A01EB08();
    swift_endAccess();
    result = sub_249F92438(a2, a3);
  }
  if (a5 >> 60 != 15)
  {
    v23 = (_QWORD *)(v5 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingContext);
    swift_beginAccess();
    v24 = (_QWORD *)*v23;
    v25 = v23[1];
    v26 = v23[2];
    sub_249F93CCC(v7, a5);
    swift_bridgeObjectRetain();
    sub_249F93CE0(v25, v26);
    sub_249F92358(v25, v26);
    v27 = v24[2];
    if (v27)
    {
      if (v24[4] == v8)
      {
LABEL_19:
        swift_bridgeObjectRelease();
        __asm { BR              X11 }
      }
      v28 = 0;
      v29 = v27 - 1;
      while (v29 != v28)
      {
        v30 = v24[v28++ + 5];
        if (v30 == v8)
          goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v31 = (_QWORD *)*v23;
    v32 = swift_isUniquelyReferenced_nonNull_native();
    *v23 = v31;
    if ((v32 & 1) == 0)
    {
      v31 = sub_249F89B7C(0, v31[2] + 1, 1, v31);
      *v23 = v31;
    }
    v34 = v31[2];
    v33 = v31[3];
    if (v34 >= v33 >> 1)
    {
      v31 = sub_249F89B7C((_QWORD *)(v33 > 1), v34 + 1, 1, v31);
      *v23 = v31;
    }
    v31[2] = v34 + 1;
    v31[v34 + 4] = v8;
    sub_24A01EB08();
    swift_endAccess();
    return sub_249F92438(v7, a5);
  }
  return result;
}

uint64_t sub_24A005630(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingPartition);
    v4 = (_QWORD *)(v1 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingContext);
    v5 = result + 32;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    swift_beginAccess();
    for (i = 0; i != v2; ++i)
    {
      v7 = *(_QWORD *)(v5 + 8 * i);
      v8 = (_QWORD *)*v3;
      v9 = v3[1];
      v10 = v3[2];
      swift_bridgeObjectRetain();
      sub_249F93CE0(v9, v10);
      sub_249F92358(v9, v10);
      v11 = v8[2];
      if (v11)
      {
        if (v8[4] == v7)
          goto LABEL_6;
        if (v11 != 1)
        {
          if (v8[5] == v7)
          {
LABEL_6:
            swift_bridgeObjectRelease();
            v12 = v3[1];
            v13 = v3[2];
            swift_bridgeObjectRetain();
            sub_249F93CE0(v12, v13);
            swift_bridgeObjectRelease();
            __asm { BR              X8 }
          }
          v20 = 0;
          v21 = v11 - 2;
          while (v21 != v20)
          {
            v22 = v8[v20++ + 6];
            if (v22 == v7)
              goto LABEL_6;
          }
        }
      }
      swift_bridgeObjectRelease();
      v14 = (_QWORD *)*v4;
      v15 = v4[1];
      v16 = v4[2];
      swift_bridgeObjectRetain();
      sub_249F93CE0(v15, v16);
      sub_249F92358(v15, v16);
      v17 = v14[2];
      if (v17)
      {
        if (v14[4] == v7)
          goto LABEL_13;
        if (v17 != 1)
        {
          if (v14[5] == v7)
          {
LABEL_13:
            swift_bridgeObjectRelease();
            v18 = v4[1];
            v19 = v4[2];
            swift_bridgeObjectRetain();
            sub_249F93CE0(v18, v19);
            swift_bridgeObjectRelease();
            __asm { BR              X8 }
          }
          v23 = 0;
          v24 = v17 - 2;
          while (v24 != v23)
          {
            v25 = v14[v23++ + 6];
            if (v25 == v7)
              goto LABEL_13;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A005C00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  swift_release();
  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_logger;
  v2 = sub_24A01EDA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingPartition + 8);
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingPartition + 16);
  swift_bridgeObjectRelease();
  sub_249F92358(v3, v4);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingContext + 8);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC19VisualUnderstanding14VUIndexScanner_streamingContext + 16);
  swift_bridgeObjectRelease();
  sub_249F92358(v5, v6);
  return swift_deallocClassInstance();
}

uint64_t sub_24A005CD0()
{
  return type metadata accessor for VUIndexScanner();
}

uint64_t type metadata accessor for VUIndexScanner()
{
  uint64_t result;

  result = qword_2544CADA0;
  if (!qword_2544CADA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24A005D14()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24A01EDA8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_24A005DAC(unsigned int a1, uint64_t a2, int a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11)
{
  sub_24A0014C0(a1, a2, a3, a4, a5 & 1, a6, a7, a8, a9, a10, a11);
}

uint64_t sub_24A005DE8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  float v17;
  float *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  float *v28;
  float *v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  char v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  uint64_t v89;
  float v90;
  uint64_t v91;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_24A01F438();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_141;
    if ((unint64_t)v3 >= 2)
    {
      v84 = *a1;
      v85 = *a1 + 16;
      v86 = -1;
      for (i = 1; i != v3; ++i)
      {
        v88 = v86;
        v89 = v85;
        do
        {
          v90 = *(float *)(v89 + 8);
          if (*(float *)(v89 - 8) >= v90)
            break;
          if (!v84)
            goto LABEL_145;
          v91 = *(_QWORD *)v89;
          *(_OWORD *)v89 = *(_OWORD *)(v89 - 16);
          *(float *)(v89 - 8) = v90;
          *(_QWORD *)(v89 - 16) = v91;
          v89 -= 16;
        }
        while (!__CFADD__(v88++, 1));
        v85 += 16;
        --v86;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_150;
  v6 = result;
  v101 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_107:
      v93 = v12;
      v104 = v9;
      if (v13 >= 2)
      {
        v94 = *v101;
        do
        {
          v95 = v13 - 2;
          if (v13 < 2)
            goto LABEL_136;
          if (!v94)
            goto LABEL_149;
          v96 = v93;
          v97 = *(_QWORD *)&v93[16 * v95 + 32];
          v98 = *(_QWORD *)&v93[16 * v13 + 24];
          sub_249F90E3C((char *)(v94 + 16 * v97), (char *)(v94 + 16 * *(_QWORD *)&v93[16 * v13 + 16]), v94 + 16 * v98, __dst);
          if (v1)
            break;
          if (v98 < v97)
            goto LABEL_137;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v96 = sub_24A012ED4((uint64_t)v96);
          if (v95 >= *((_QWORD *)v96 + 2))
            goto LABEL_138;
          v99 = &v96[16 * v95 + 32];
          *(_QWORD *)v99 = v97;
          *((_QWORD *)v99 + 1) = v98;
          v100 = *((_QWORD *)v96 + 2);
          if (v13 > v100)
            goto LABEL_139;
          memmove(&v96[16 * v13 + 16], &v96[16 * v13 + 32], 16 * (v100 - v13));
          v93 = v96;
          *((_QWORD *)v96 + 2) = v100 - 1;
          v13 = v100 - 1;
        }
        while (v100 > 2);
      }
LABEL_97:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDE0);
    v8 = sub_24A01EFC4();
    *(_QWORD *)(v8 + 16) = v7;
    v104 = v8;
    __dst = (char *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v102 = *a1 + 40;
  v103 = *a1 + 8;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v105 = v6;
  v106 = v3;
  v107 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(float *)(v103 + 16 * v10);
      v16 = 16 * v14;
      v17 = *(float *)(v103 + 16 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v18 = (float *)(v102 + 16 * v14);
        while (v17 < v15 != *(v18 - 4) >= *v18)
        {
          ++v10;
          v18 += 4;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v17 < v15)
      {
        if (v10 < v14)
          goto LABEL_142;
        if (v14 < v10)
        {
          v19 = 16 * v10 - 16;
          v20 = v10;
          v21 = v14;
          do
          {
            if (v21 != --v20)
            {
              if (!v11)
                goto LABEL_148;
              v23 = (_OWORD *)(v11 + v16);
              v24 = (_OWORD *)(v11 + v19);
              v25 = *(_QWORD *)(v11 + v16);
              v26 = *(_DWORD *)(v11 + v16 + 8);
              if (v16 != v19 || v23 >= v24 + 1)
                *v23 = *v24;
              v22 = v11 + v19;
              *(_QWORD *)v22 = v25;
              *(_DWORD *)(v22 + 8) = v26;
            }
            ++v21;
            v19 -= 16;
            v16 += 16;
          }
          while (v21 < v20);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_50;
    if (__OFSUB__(v10, v14))
      goto LABEL_140;
    if (v10 - v14 >= v6)
      goto LABEL_50;
    v27 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_143;
    if (v27 >= v3)
      v27 = v3;
    if (v27 < v14)
      break;
    if (v10 != v27)
    {
      v28 = (float *)(v11 + 16 * v10);
      do
      {
        v29 = v28;
        v30 = v14;
        do
        {
          v31 = v29[2];
          if (*(v29 - 2) >= v31)
            break;
          if (!v11)
            goto LABEL_146;
          v32 = *(_QWORD *)v29;
          *(_OWORD *)v29 = *((_OWORD *)v29 - 1);
          *(v29 - 2) = v31;
          *((_QWORD *)v29 - 2) = v32;
          v29 -= 4;
          ++v30;
        }
        while (v10 != v30);
        ++v10;
        v28 += 4;
      }
      while (v10 != v27);
      v10 = v27;
    }
LABEL_50:
    if (v10 < v14)
      goto LABEL_135;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_24A012ABC(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v34 = *((_QWORD *)v12 + 2);
    v33 = *((_QWORD *)v12 + 3);
    v13 = v34 + 1;
    v11 = v107;
    if (v34 >= v33 >> 1)
    {
      v83 = sub_24A012ABC((char *)(v33 > 1), v34 + 1, 1, v12);
      v11 = v107;
      v12 = v83;
    }
    *((_QWORD *)v12 + 2) = v13;
    v35 = v12 + 32;
    v36 = &v12[16 * v34 + 32];
    *(_QWORD *)v36 = v14;
    *((_QWORD *)v36 + 1) = v10;
    if (v34)
    {
      while (1)
      {
        v37 = v13 - 1;
        if (v13 >= 4)
        {
          v42 = &v35[16 * v13];
          v43 = *((_QWORD *)v42 - 8);
          v44 = *((_QWORD *)v42 - 7);
          v48 = __OFSUB__(v44, v43);
          v45 = v44 - v43;
          if (v48)
            goto LABEL_124;
          v47 = *((_QWORD *)v42 - 6);
          v46 = *((_QWORD *)v42 - 5);
          v48 = __OFSUB__(v46, v47);
          v40 = v46 - v47;
          v41 = v48;
          if (v48)
            goto LABEL_125;
          v49 = v13 - 2;
          v50 = &v35[16 * v13 - 32];
          v52 = *(_QWORD *)v50;
          v51 = *((_QWORD *)v50 + 1);
          v48 = __OFSUB__(v51, v52);
          v53 = v51 - v52;
          if (v48)
            goto LABEL_127;
          v48 = __OFADD__(v40, v53);
          v54 = v40 + v53;
          if (v48)
            goto LABEL_130;
          if (v54 >= v45)
          {
            v72 = &v35[16 * v37];
            v74 = *(_QWORD *)v72;
            v73 = *((_QWORD *)v72 + 1);
            v48 = __OFSUB__(v73, v74);
            v75 = v73 - v74;
            if (v48)
              goto LABEL_134;
            v65 = v40 < v75;
            goto LABEL_87;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v66 = *((_QWORD *)v12 + 4);
            v67 = *((_QWORD *)v12 + 5);
            v48 = __OFSUB__(v67, v66);
            v59 = v67 - v66;
            v60 = v48;
            goto LABEL_81;
          }
          v39 = *((_QWORD *)v12 + 4);
          v38 = *((_QWORD *)v12 + 5);
          v48 = __OFSUB__(v38, v39);
          v40 = v38 - v39;
          v41 = v48;
        }
        if ((v41 & 1) != 0)
          goto LABEL_126;
        v49 = v13 - 2;
        v55 = &v35[16 * v13 - 32];
        v57 = *(_QWORD *)v55;
        v56 = *((_QWORD *)v55 + 1);
        v58 = __OFSUB__(v56, v57);
        v59 = v56 - v57;
        v60 = v58;
        if (v58)
          goto LABEL_129;
        v61 = &v35[16 * v37];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        v48 = __OFSUB__(v62, v63);
        v64 = v62 - v63;
        if (v48)
          goto LABEL_132;
        if (__OFADD__(v59, v64))
          goto LABEL_133;
        if (v59 + v64 >= v40)
        {
          v65 = v40 < v64;
LABEL_87:
          if (v65)
            v37 = v49;
          goto LABEL_89;
        }
LABEL_81:
        if ((v60 & 1) != 0)
          goto LABEL_128;
        v68 = &v35[16 * v37];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v48 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v48)
          goto LABEL_131;
        if (v71 < v59)
          goto LABEL_15;
LABEL_89:
        v76 = v37 - 1;
        if (v37 - 1 >= v13)
        {
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
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
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
          goto LABEL_144;
        }
        if (!v11)
          goto LABEL_147;
        v77 = v12;
        v78 = &v35[16 * v76];
        v79 = *(_QWORD *)v78;
        v80 = &v35[16 * v37];
        v81 = *((_QWORD *)v80 + 1);
        sub_249F90E3C((char *)(v11 + 16 * *(_QWORD *)v78), (char *)(v11 + 16 * *(_QWORD *)v80), v11 + 16 * v81, __dst);
        if (v1)
          goto LABEL_97;
        if (v81 < v79)
          goto LABEL_121;
        if (v37 > *((_QWORD *)v77 + 2))
          goto LABEL_122;
        *(_QWORD *)v78 = v79;
        *(_QWORD *)&v35[16 * v76 + 8] = v81;
        v82 = *((_QWORD *)v77 + 2);
        if (v37 >= v82)
          goto LABEL_123;
        v12 = v77;
        v13 = v82 - 1;
        memmove(&v35[16 * v37], v80 + 16, 16 * (v82 - 1 - v37));
        *((_QWORD *)v77 + 2) = v82 - 1;
        v11 = v107;
        if (v82 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v105;
    v3 = v106;
    if (v10 >= v106)
    {
      v9 = v104;
      goto LABEL_107;
    }
  }
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
  result = sub_24A01F3B4();
  __break(1u);
  return result;
}

void sub_24A0064D8(uint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void *v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v5 = *(_QWORD *)(a1 + 16);
  if (!v5 || !*(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v48 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a1 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v50 = a2;
  v10 = *(_QWORD *)(a2 + 32);
  v11 = (_QWORD *)*a4;
  v12 = sub_249F8B27C(v8);
  v14 = v11[2];
  v15 = (v13 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
    goto LABEL_30;
  v17 = v12;
  v18 = v13;
  v19 = v11[3];
  swift_bridgeObjectRetain();
  if (v19 >= v16)
  {
    if ((a3 & 1) != 0)
    {
      if ((v18 & 1) == 0)
        goto LABEL_14;
    }
    else
    {
      sub_249FC132C();
      if ((v18 & 1) == 0)
        goto LABEL_14;
    }
LABEL_11:
    v22 = (void *)swift_allocError();
    swift_willThrow();
    v23 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF8A0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_34;
  }
  sub_249FB8D50(v16, a3 & 1);
  v20 = sub_249F8B27C(v8);
  if ((v18 & 1) != (v21 & 1))
  {
LABEL_33:
    sub_24A01F48C();
    __break(1u);
LABEL_34:
    sub_24A01F2F4();
    sub_24A01EEBC();
    sub_24A01F3A8();
    sub_24A01EEBC();
    sub_24A01F3C0();
    __break(1u);
    return;
  }
  v17 = v20;
  if ((v18 & 1) != 0)
    goto LABEL_11;
LABEL_14:
  v24 = (_QWORD *)*a4;
  *(_QWORD *)(*a4 + 8 * (v17 >> 6) + 64) |= 1 << v17;
  v25 = 8 * v17;
  *(_QWORD *)(v24[6] + v25) = v8;
  *(_QWORD *)(v24[7] + v25) = v10;
  v26 = v24[2];
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v24[2] = v28;
  if (v5 != 1)
  {
    if (*(_QWORD *)(a1 + 16) < 2uLL)
    {
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    v49 = v48 - 1;
    if (v49)
    {
      v29 = 0;
      v30 = v5 - 2;
      while (1)
      {
        v31 = *(_QWORD *)(a1 + 40 + 8 * v29);
        v32 = *(_QWORD *)(v50 + 40 + 8 * v29);
        v33 = (_QWORD *)*a4;
        v34 = sub_249F8B27C(v31);
        v36 = v33[2];
        v37 = (v35 & 1) == 0;
        v38 = v36 + v37;
        if (__OFADD__(v36, v37))
          break;
        v39 = v34;
        v40 = v35;
        v41 = v33[3];
        swift_bridgeObjectRetain();
        if (v41 < v38)
        {
          sub_249FB8D50(v38, 1);
          v42 = sub_249F8B27C(v31);
          if ((v40 & 1) != (v43 & 1))
            goto LABEL_33;
          v39 = v42;
        }
        if ((v40 & 1) != 0)
          goto LABEL_11;
        v44 = (_QWORD *)*a4;
        *(_QWORD *)(*a4 + 8 * (v39 >> 6) + 64) |= 1 << v39;
        v45 = 8 * v39;
        *(_QWORD *)(v44[6] + v45) = v31;
        *(_QWORD *)(v44[7] + v45) = v32;
        v46 = v44[2];
        v27 = __OFADD__(v46, 1);
        v47 = v46 + 1;
        if (v27)
          goto LABEL_31;
        v44[2] = v47;
        if (v30 != v29)
        {
          if ((unint64_t)(v29 + 2) >= *(_QWORD *)(a1 + 16))
            goto LABEL_32;
          if (v49 != ++v29)
            continue;
        }
        goto LABEL_28;
      }
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
  }
LABEL_28:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
}

void sub_24A0068F0(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24A006958()
{
  return sub_24A01EAD8();
}

uint64_t sub_24A006AEC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_24A01E9AC();
  if (!result || (result = sub_24A01E9D0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_24A01E9C4();
      return sub_24A01EAD8();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

_QWORD *sub_24A006B90(_QWORD *a1)
{
  return sub_249F89A50(0, a1[2], 0, a1);
}

_QWORD *sub_24A006BA4(_QWORD *a1)
{
  return sub_249F89B7C(0, a1[2], 0, a1);
}

uint64_t sub_24A006BB8(unint64_t a1)
{
  return sub_249F89FC0(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_24A006BCC(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result < 15)
    {
      return 0;
    }
    else
    {
      sub_24A01E9E8();
      swift_allocObject();
      sub_24A01E9DC();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_24A01EACC();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_24A006C60(unint64_t a1)
{
  uint64_t v1;

  return sub_24A003CCC(a1, *(_BYTE **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(unint64_t **)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(uint64_t **)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(uint64_t **)(v1 + 96), *(_BYTE *)(v1 + 104), *(_BYTE *)(v1 + 105), *(char **)(v1 + 112), *(unint64_t **)(v1 + 120));
}

uint64_t sub_24A006CB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24A003760(*(_BYTE *)(v1 + 16), *(_BYTE *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_BYTE *)(v1 + 48), a1);
}

uint64_t sub_24A006CD0()
{
  _QWORD *v0;

  if (v0[2])
  {
    swift_bridgeObjectRelease();
    sub_249F92358(v0[3], v0[4]);
  }
  return swift_deallocObject();
}

uint64_t sub_24A006D00@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_24A000C60(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_24A006D18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_24A01EBA4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A006DA8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(sub_24A01EBA4() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_24A000DB8(*(_QWORD **)(v0 + 16), v0 + v2, *(_QWORD **)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

void sub_24A006E04()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
    __break(1u);
  else
    *(_QWORD *)(v0 + 48) = v3;
}

void sub_24A006E1C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
    __break(1u);
  else
    *(_QWORD *)(v0 + 56) = v3;
}

uint64_t sub_24A006E34(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    return sub_249F93CE0(a2, a3);
  }
  return result;
}

uint64_t sub_24A006E68(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_249F89B68(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = *(_QWORD *)(sub_24A01EBA4() - 8);
  v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v14 * a1;
  v16 = v13 + v14 * a1;
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_25;
  v18 = *(_QWORD *)(v4 + 16);
  v19 = v18 - a2;
  if (__OFSUB__(v18, a2))
    goto LABEL_31;
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v21 = *(_QWORD *)(v4 + 16);
    v22 = __OFADD__(v21, v8);
    v23 = v21 - v7;
    if (!v22)
    {
      *(_QWORD *)(v4 + 16) = v23;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  result = sub_24A01F408();
  __break(1u);
  return result;
}

uint64_t sub_24A007010(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_249F990DC(255, a2);
    result = MEMORY[0x24BD078A8](MEMORY[0x24BEE5BE8], v4);
    atomic_store(result, a1);
  }
  return result;
}

id sub_24A007050(void *a1)
{
  uint64_t v1;

  return sub_24A003BB4(a1, *(_QWORD ***)(v1 + 16), (SEL *)&selRef_contextualEmbedding);
}

char *sub_24A007070(uint64_t a1, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  char *result;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v9 <= *((_QWORD *)v4 + 3) >> 1)
  {
    if (!v8)
      goto LABEL_21;
  }
  else
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    result = (char *)sub_249F89B7C(result, v11, 1, v4);
    v4 = result;
    if (!v8)
      goto LABEL_21;
  }
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_27;
  if ((v14 & 0x8000000000000000) == 0)
  {
    result = &v4[8 * a1 + 32];
    v15 = &v4[8 * a2 + 32];
    if (a1 != a2 || result >= &v15[8 * v14])
      result = (char *)memmove(result, v15, 8 * v14);
    v16 = *((_QWORD *)v4 + 2);
    v13 = __OFADD__(v16, v8);
    v17 = v16 + v8;
    if (!v13)
    {
      *((_QWORD *)v4 + 2) = v17;
LABEL_21:
      *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  result = (char *)sub_24A01F408();
  __break(1u);
  return result;
}

id sub_24A0071C8(void *a1)
{
  uint64_t v1;

  return sub_24A003BB4(a1, *(_QWORD ***)(v1 + 16), (SEL *)&selRef_embedding);
}

void sub_24A0071E8(float *a1@<X8>)
{
  sub_24A0071FC(a1);
}

void sub_24A0071FC(float *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 48);
  v2 = *(_QWORD *)(v1 + 56);
  v4 = __OFADD__(v2, v3);
  v5 = v2 + v3;
  if (v4)
    __break(1u);
  else
    *a1 = (float)v2 / fmaxf((float)v5, 1.0);
}

uint64_t sub_24A007228(void *a1)
{
  uint64_t v1;

  return sub_24A0023D0(a1, *(_QWORD ***)(v1 + 16), *(_QWORD ***)(v1 + 24), *(_QWORD ***)(v1 + 32), *(unint64_t **)(v1 + 40));
}

uint64_t sub_24A007244(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v28 = MEMORY[0x24BEE4AF8];
  sub_249F8CA8C(0, v1, 0);
  v4 = v28;
  result = sub_249FC6870(a1);
  v7 = result;
  v8 = 0;
  v9 = a1 + 64;
  v24 = v1;
  v25 = v6;
  v26 = a1 + 64;
  while ((v7 & 0x8000000000000000) == 0 && v7 < 1 << *(_BYTE *)(a1 + 32))
  {
    v12 = (unint64_t)v7 >> 6;
    if ((*(_QWORD *)(v9 + 8 * ((unint64_t)v7 >> 6)) & (1 << v7)) == 0)
      goto LABEL_27;
    if (*(_DWORD *)(a1 + 36) != v6)
      goto LABEL_28;
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v7);
    type metadata accessor for VUIndexClusterer.NodeTags(0);
    v13 = swift_allocObject();
    v14 = v13
        + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTag;
    v15 = sub_24A01EBA4();
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
    *(_DWORD *)(v13
              + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagScore) = 0;
    *(_BYTE *)(v13
             + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed) = 0;
    *(_QWORD *)(v13
              + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_rejectionTagScores) = MEMORY[0x24BEE4B00];
    *(_QWORD *)(v13
              + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_localRejectionTags) = v2;
    v17 = *(_QWORD *)(v28 + 16);
    v16 = *(_QWORD *)(v28 + 24);
    if (v17 >= v16 >> 1)
      result = sub_249F8CA8C(v16 > 1, v17 + 1, 1);
    *(_QWORD *)(v28 + 16) = v17 + 1;
    v18 = v28 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v27;
    *(_QWORD *)(v18 + 40) = v13;
    v10 = 1 << *(_BYTE *)(a1 + 32);
    if (v7 >= v10)
      goto LABEL_29;
    v9 = a1 + 64;
    v19 = *(_QWORD *)(v26 + 8 * v12);
    if ((v19 & (1 << v7)) == 0)
      goto LABEL_30;
    v6 = v25;
    if (*(_DWORD *)(a1 + 36) != v25)
      goto LABEL_31;
    v20 = v19 & (-2 << (v7 & 0x3F));
    if (v20)
    {
      v10 = __clz(__rbit64(v20)) | v7 & 0xFFFFFFFFFFFFFFC0;
      v2 = MEMORY[0x24BEE4AF8];
      v11 = v24;
    }
    else
    {
      v21 = v12 + 1;
      v22 = (unint64_t)(v10 + 63) >> 6;
      v2 = MEMORY[0x24BEE4AF8];
      v11 = v24;
      if (v12 + 1 < v22)
      {
        v23 = *(_QWORD *)(v26 + 8 * v21);
        if (!v23)
        {
          v21 = v12 + 2;
          if (v12 + 2 >= v22)
            goto LABEL_4;
          v23 = *(_QWORD *)(v26 + 8 * v21);
          if (!v23)
          {
            while (v22 - 3 != v12)
            {
              v23 = *(_QWORD *)(a1 + 88 + 8 * v12++);
              if (v23)
              {
                v21 = v12 + 2;
                goto LABEL_17;
              }
            }
            goto LABEL_4;
          }
        }
LABEL_17:
        v10 = __clz(__rbit64(v23)) + (v21 << 6);
      }
    }
LABEL_4:
    ++v8;
    v7 = v10;
    if (v8 == v11)
      return v4;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_24A0074F4(uint64_t a1, uint64_t *a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v18 = MEMORY[0x24BEE4AF8];
    sub_249F8CA3C(0, v2, 0);
    v3 = v18;
    v6 = 0;
    v17 = *(_QWORD *)(sub_24A01EBA4() - 8);
    v16 = a1 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    do
    {
      v7 = *a2;
      if (*(_QWORD *)(*a2 + 16) && (v8 = sub_249F8B20C(v16 + *(_QWORD *)(v17 + 72) * v6), (v9 & 1) != 0))
      {
        v10 = 0;
        v11 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v8);
      }
      else
      {
        v11 = 0;
        v10 = 1;
      }
      v13 = *(_QWORD *)(v18 + 16);
      v12 = *(_QWORD *)(v18 + 24);
      if (v13 >= v12 >> 1)
        sub_249F8CA3C(v12 > 1, v13 + 1, 1);
      ++v6;
      *(_QWORD *)(v18 + 16) = v13 + 1;
      v14 = v18 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v11;
      *(_BYTE *)(v14 + 40) = v10;
    }
    while (v2 != v6);
  }
  return v3;
}

void (*sub_24A007628(_QWORD *a1, uint64_t a2))(_QWORD *a1)
{
  _QWORD *v4;

  v4 = malloc(0x28uLL);
  *a1 = v4;
  v4[4] = sub_24A013844(v4, a2);
  return sub_24A007674;
}

void sub_24A007674(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

void (*sub_24A0076A4(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_24A0138FC(v6, a2, a3);
  return sub_24A007710;
}

void sub_24A007710(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

BOOL sub_24A007748(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = sub_24A01F4E0();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_QWORD *)(v8 + 8 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_24A007810(uint64_t a1, uint64_t a2)
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

  v3 = sub_24A01EBA4();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]),
        v6 = sub_24A01EE14(),
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
      sub_249FA2B24(&qword_2578FF760, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v12 = sub_24A01EE38();
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

uint64_t sub_24A007994(uint64_t a1, uint64_t a2)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  int EnumCaseMultiPayload;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  _QWORD v51[2];
  _QWORD *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF858);
  MEMORY[0x24BDAC7A8](v61);
  v5 = (char *)v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24A01EBA4();
  v57 = *(_QWORD *)(v6 - 8);
  v58 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v53 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v55 = (char *)v51 - v9;
  v10 = type metadata accessor for VUStreamingGallery.Label(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (_QWORD *)((char *)v51 - v16);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v51 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v51 - v21;
  if (*(_QWORD *)(a2 + 16))
  {
    sub_24A01F4EC();
    sub_249FF7968(a1, (uint64_t)v22);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v60 = a1;
    v52 = v17;
    if (EnumCaseMultiPayload == 1)
    {
      v24 = v57;
      v25 = v55;
      v26 = v14;
      v27 = v58;
      (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v55, v22, v58);
      sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_24A01EE20();
      v28 = v27;
      v14 = v26;
      v17 = v52;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v28);
    }
    else
    {
      sub_24A01F4F8();
    }
    v29 = sub_24A01F528();
    v30 = -1 << *(_BYTE *)(a2 + 32);
    v31 = v29 & ~v30;
    v54 = a2 + 56;
    if (((*(_QWORD *)(a2 + 56 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) != 0)
    {
      v32 = ~v30;
      v59 = *(_QWORD *)(v11 + 72);
      v56 = a2;
      v33 = v54;
      v51[0] = v14;
      v51[1] = v10;
      do
      {
        sub_249FF7968(*(_QWORD *)(a2 + 48) + v59 * v31, (uint64_t)v20);
        v34 = &v5[*(int *)(v61 + 48)];
        sub_249FF7968((uint64_t)v20, (uint64_t)v5);
        sub_249FF7968(v60, (uint64_t)v34);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          sub_249FF7968((uint64_t)v5, (uint64_t)v14);
          if (swift_getEnumCaseMultiPayload() != 1)
          {
            (*(void (**)(char *, uint64_t))(v57 + 8))(v14, v58);
LABEL_8:
            sub_249F990A0((uint64_t)v5, &qword_2578FF858);
            sub_24A014DD4((uint64_t)v20);
            goto LABEL_9;
          }
          v35 = v57;
          v36 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
          v37 = v55;
          v38 = v14;
          v39 = v58;
          v36(v55, v38, v58);
          v40 = v32;
          v41 = v53;
          v36(v53, v34, v39);
          v42 = sub_24A01EB8C();
          v43 = *(void (**)(char *, uint64_t))(v35 + 8);
          v17 = v52;
          v44 = v41;
          v32 = v40;
          v43(v44, v39);
          v45 = v37;
          v33 = v54;
          v46 = v39;
          v14 = (char *)v51[0];
          v43(v45, v46);
          a2 = v56;
          sub_24A014DD4((uint64_t)v5);
          sub_24A014DD4((uint64_t)v20);
          if ((v42 & 1) != 0)
            return 1;
        }
        else
        {
          sub_249FF7968((uint64_t)v5, (uint64_t)v17);
          if (swift_getEnumCaseMultiPayload() == 1)
            goto LABEL_8;
          v47 = *v17;
          v48 = *(_QWORD *)v34;
          sub_24A014DD4((uint64_t)v5);
          sub_24A014DD4((uint64_t)v20);
          v49 = v47 == v48;
          a2 = v56;
          if (v49)
            return 1;
        }
LABEL_9:
        v31 = (v31 + 1) & v32;
      }
      while (((*(_QWORD *)(v33 + ((v31 >> 3) & 0xFFFFFFFFFFFFF8)) >> v31) & 1) != 0);
    }
  }
  return 0;
}

uint64_t sub_24A007D98(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24A007DC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t result;
  _BYTE *i;
  char v6;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  result = *a2;
  for (i = (_BYTE *)(a1 + 40); (*i & 1) == 0; i += 16)
  {
    if (*((_QWORD *)i - 1) == result)
      v6 = *((_BYTE *)a2 + 8);
    else
      v6 = 1;
    if ((v6 & 1) == 0)
      return result;
LABEL_7:
    if (!--v2)
      return 0;
  }
  if (!*((_BYTE *)a2 + 8))
    goto LABEL_7;
  return *((_QWORD *)i - 1);
}

uint64_t sub_24A007E30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v11 = a1;
  v10 = sub_24A01F120();
  v2 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24A01F108();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_24A01EDE4();
  MEMORY[0x24BDAC7A8](v7);
  sub_24A01ED9C();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_numProbes) = 35;
  v9 = OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_lockQueue;
  sub_249F990DC(0, (unint64_t *)&unk_2544CAEC0);
  sub_24A01EDD8();
  v12 = MEMORY[0x24BEE4AF8];
  sub_249FA2B24((unint64_t *)&unk_2544CAEB0, v6, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAE90);
  sub_249F98C68(&qword_2544CAE98, &qword_2544CAE90, MEMORY[0x24BEE12C8]);
  sub_24A01F228();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v10);
  *(_QWORD *)(v1 + v9) = sub_24A01F150();
  *(_QWORD *)(v1 + 16) = v11;
  return v1;
}

uint64_t sub_24A008080(uint64_t a1, uint64_t a2, _QWORD *a3, int a4, char a5, char a6, void (*a7)(uint64_t), uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  double v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  float v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  char v46;
  _QWORD *v47;
  char v48;
  unint64_t v49;
  uint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  char v55;
  double v56;
  float v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unsigned int v72;
  double Current;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  unint64_t v94;
  float v95;
  char v96;
  unint64_t v97;
  char v98;
  _BOOL4 v99;
  unint64_t v100;
  char v101;
  float v102;
  unint64_t v103;
  char v104;
  char v105;
  char v106;
  char v107;
  double v108;
  char v109;
  unint64_t v110;
  uint64_t v111;
  _BOOL8 v112;
  uint64_t v113;
  char v114;
  unint64_t v115;
  char v116;
  double v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char v121;
  char v122;
  unint64_t v123;
  uint64_t v124;
  _BOOL8 v125;
  uint64_t v126;
  char v127;
  unint64_t v128;
  char v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t result;
  uint64_t v143;
  uint64_t v144;
  double v145;
  double v146;
  NSObject *v147;
  os_log_type_t v148;
  uint64_t v149;
  char v150;
  double v151;
  char v152;
  double v153;
  NSObject *v154;
  os_log_type_t v155;
  uint64_t v156;
  char isUniquelyReferenced_nonNull_native;
  double v158;
  char v159;
  _QWORD *v160;
  uint64_t v161;
  uint64_t v162;
  id v163;
  id v164;
  double v165;
  uint64_t v166;
  uint64_t v167;
  int v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  _QWORD *v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  id v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  double v187;
  NSObject *v188;
  os_log_type_t v189;
  uint64_t v190;
  _QWORD *v191;
  uint64_t v192;
  void *v193;
  uint64_t v194;
  uint64_t (*v195)(uint64_t);
  uint64_t v196;
  uint64_t v197;
  void *v198;
  uint64_t v199;
  uint64_t v200;
  id v201;
  uint64_t v202;
  uint64_t v203;
  _QWORD *v204;
  id v205;
  id v206;
  double v207;
  NSObject *v208;
  os_log_type_t v209;
  uint64_t v210;
  uint64_t v211;
  id v212;
  _QWORD v213[4];
  uint64_t v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  uint64_t v219;
  _QWORD v220[4];
  double *v221;
  double *v222;
  unint64_t *v223;
  uint64_t v224;
  _QWORD v225[2];
  uint64_t v226;
  int v227;
  uint64_t v228;
  _QWORD *v229;
  uint64_t v230;
  uint64_t v231;
  void (*v232)(uint64_t);
  _QWORD *v233;
  _QWORD *v234;
  id v235;
  _QWORD *v236;
  double v237;
  double v238[3];
  double v239[3];
  double v240[3];
  double v241;
  double v242;
  unint64_t v243;
  char v244[8];
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  char v248;
  char v249;
  char v250[8];
  uint64_t v251;
  _QWORD *v252;
  uint64_t v253;
  __int16 v254;
  char v255[8];
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  __int16 v259;

  v231 = a8;
  v232 = a7;
  v227 = a4;
  v12 = a1;
  *(double *)&v243 = MEMORY[0x24BEE4B00];
  v241 = MEMORY[0x24BEE4B00];
  v242 = MEMORY[0x24BEE4B00];
  v229 = a3;
  v230 = a2;
  if ((a5 & 1) != 0)
  {
    v13 = a3;
    v14 = a2;
    if ((a6 & 1) == 0)
    {
LABEL_46:
      v236 = v9;
      v66 = sub_24A01ED90();
      v67 = sub_24A01F0F0();
      if (os_log_type_enabled(v66, v67))
      {
        v68 = swift_slowAlloc();
        *(double *)&v69 = COERCE_DOUBLE(swift_slowAlloc());
        v240[0] = *(double *)&v69;
        *(_DWORD *)v68 = 16777730;
        LOBYTE(v239[0]) = v12;
        sub_24A01F1F8();
        *(_WORD *)(v68 + 5) = 2080;
        if ((a5 & 1) != 0)
          v70 = 0xD000000000000023;
        else
          v70 = 0xD000000000000013;
        if ((a5 & 1) != 0)
          v71 = 0x800000024A0241F0;
        else
          v71 = 0x800000024A0241D0;
        *(_QWORD *)&v239[0] = sub_249F8AAE8(v70, v71, (uint64_t *)v240);
        sub_24A01F1F8();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_249F70000, v66, v67, "Skipping primary partners for type %hhu as %s", (uint8_t *)v68, 0xFu);
        swift_arrayDestroy();
        MEMORY[0x24BD07950](v69, -1, -1);
        MEMORY[0x24BD07950](v68, -1, -1);
      }

      v72 = 0;
LABEL_55:
      Current = CFAbsoluteTimeGetCurrent();
      v244[0] = 0;
      v245 = 0;
      v246 = 0;
      v247 = v72 - 1;
      v248 = v72;
      v249 = 2;
      v74 = swift_allocObject();
      v76 = v231;
      v75 = (uint64_t)v232;
      *(_QWORD *)(v74 + 16) = v232;
      *(_QWORD *)(v74 + 24) = v76;
      sub_249F9900C(v75);
      v77 = sub_24A00AC78(v12, (uint64_t)v244, v230, v229, (uint64_t)sub_24A01440C, v74);
      if (v236)
      {
        swift_release();
        goto LABEL_121;
      }
      v143 = v77;
      v144 = v78;
      v228 = v12;
      swift_release();
      v145 = CFAbsoluteTimeGetCurrent();
      if (*(_QWORD *)(v143 + 16))
      {
        v146 = v145;
        v226 = 0;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v147 = sub_24A01ED90();
        v148 = sub_24A01F0F0();
        if (os_log_type_enabled(v147, v148))
        {
          v149 = swift_slowAlloc();
          *(_DWORD *)v149 = 134218496;
          v239[0] = *(double *)(v143 + 16);
          sub_24A01F1F8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(_WORD *)(v149 + 12) = 256;
          LOBYTE(v239[0]) = v228;
          sub_24A01F1F8();
          *(_WORD *)(v149 + 15) = 2048;
          v239[0] = v146 - Current;
          sub_24A01F1F8();
          _os_log_impl(&dword_249F70000, v147, v148, "Updating %ld secondary partners for type %hhu took %fs", (uint8_t *)v149, 0x19u);
          MEMORY[0x24BD07950](v149, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }

        swift_beginAccess();
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v238[0] = v242;
        v242 = -0.0;
        sub_24A0135C0(v143, (uint64_t)sub_24A014294, 0, isUniquelyReferenced_nonNull_native, v238);
        if (v226)
          goto LABEL_169;
        v242 = v238[0];
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_bridgeObjectRelease();
        v158 = v241;
        v159 = swift_isUniquelyReferenced_nonNull_native();
        v239[0] = v158;
        v241 = -0.0;
        sub_24A013344(v144, (uint64_t)sub_24A013FA8, 0, v159, v239);
        v241 = v239[0];
        swift_bridgeObjectRelease();
        if (v232)
          v232(1);
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v160 = v233;
      v161 = swift_beginAccess();
      if (*(_QWORD *)(*(_QWORD *)&v242 + 16))
      {
        v226 = 0;
      }
      else
      {
        MEMORY[0x24BDAC7A8](v161);
        LOBYTE(v223) = v228;
        v224 = v162;
        v164 = v163;
        sub_24A01F180();

        if ((LOBYTE(v238[0]) & 1) == 0)
          goto LABEL_121;
        v226 = 0;
        v160 = v233;
      }
      v165 = CFAbsoluteTimeGetCurrent();
      v166 = MEMORY[0x24BEE1768];
      v167 = MEMORY[0x24BEE17F0];
      if ((v72 & 1) != 0)
      {
        v168 = v228;
        v169 = v230;
      }
      else
      {
        v170 = v160[2];
        sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
        v171 = swift_allocObject();
        *(_OWORD *)(v171 + 16) = xmmword_24A0208C0;
        *(_QWORD *)(v171 + 56) = v166;
        *(_QWORD *)(v171 + 64) = v167;
        *(_QWORD *)(v171 + 32) = v228;
        v172 = swift_bridgeObjectRetain();
        v173 = sub_249FB5488(v172);
        swift_bridgeObjectRelease();
        *(_QWORD *)(v171 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
        *(_QWORD *)(v171 + 104) = sub_249F98C68((unint64_t *)&qword_2544CA2D8, &qword_2544CA2D0, MEMORY[0x24BDCFBF8]);
        *(_QWORD *)(v171 + 72) = v173;
        v174 = (void *)sub_24A01F09C();
        v175 = MEMORY[0x24BDAC7A8](v174);
        v221 = &v242;
        v222 = &v241;
        v223 = &v243;
        v214 = MEMORY[0x24BDAC7A8](v175);
        v215 = &unk_251B67C10;
        v216 = 1024;
        v217 = v170;
        v218 = sub_24A014450;
        v219 = v176;
        v220[0] = 0;
        v220[1] = 0;
        v178 = v177;
        sub_24A01F180();
        if (v226)
        {

          goto LABEL_121;
        }

        v169 = v230;
        if (v232)
          v232(1);
        v168 = v228;
      }
      v179 = *(unsigned int *)(v169 + 56);
      v181 = *(_QWORD *)&v241;
      v180 = *(_QWORD *)&v242;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      LOBYTE(v238[0]) = 0;
      v182 = sub_24A00B4B0(v168, v179, v180, v181, v227 & 1, 0);
      swift_bridgeObjectRelease();
      v183 = v182;
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v184 = v243;
      v185 = *(_QWORD *)&v241;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v186 = sub_24A01445C(v183, v184, v185);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v232)
        v232(1);
      v187 = CFAbsoluteTimeGetCurrent();
      v229 = (_QWORD *)((char *)v233 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_logger);
      v188 = sub_24A01ED90();
      v189 = sub_24A01F0F0();
      if (os_log_type_enabled(v188, v189))
      {
        v190 = swift_slowAlloc();
        *(_DWORD *)v190 = 134218496;
        sub_24A01F1F8();
        *(_WORD *)(v190 + 12) = 256;
        sub_24A01F1F8();
        *(_WORD *)(v190 + 15) = 2048;
        v237 = v187 - v165;
        sub_24A01F1F8();
        _os_log_impl(&dword_249F70000, v188, v189, "Labeling %ld pairs for type %hhu took %fs", (uint8_t *)v190, 0x19u);
        MEMORY[0x24BD07950](v190, -1, -1);
      }
      v230 = v183;

      v191 = (_QWORD *)v233[2];
      sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
      v192 = swift_allocObject();
      *(_OWORD *)(v192 + 16) = xmmword_24A0208B0;
      *(_QWORD *)(v192 + 56) = v166;
      *(_QWORD *)(v192 + 64) = MEMORY[0x24BEE17F0];
      *(_QWORD *)(v192 + 32) = v228;
      v193 = (void *)sub_24A01F09C();
      v194 = swift_allocObject();
      v236 = v225;
      v196 = v231;
      v195 = (uint64_t (*)(uint64_t))v232;
      *(_QWORD *)(v194 + 16) = v232;
      *(_QWORD *)(v194 + 24) = v196;
      v197 = MEMORY[0x24BDAC7A8](v194);
      v234 = v220;
      v220[2] = &v243;
      v220[3] = &v242;
      v221 = &v241;
      v222 = (double *)v183;
      v223 = (unint64_t *)v186;
      v198 = (void *)v191[2];
      v199 = MEMORY[0x24BDAC7A8](v197);
      v235 = v193;
      v213[2] = v193;
      v213[3] = &unk_251B67BE0;
      v214 = 1024;
      v215 = v191;
      v216 = (uint64_t)sub_24A014DA8;
      v217 = v200;
      v218 = sub_24A014D7C;
      v219 = v199;
      sub_249F9900C((uint64_t)v195);
      v201 = v198;
      v202 = v226;
      sub_24A01F180();
      if (v202)
      {

        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_121;
      }
      v233 = v191;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      v203 = swift_release();
      if (v195)
        v203 = v195(1);
      v204 = v233;
      MEMORY[0x24BDAC7A8](v203);
      LOBYTE(v213[-2]) = v228;
      v213[-1] = v204;
      v206 = v205;
      sub_24A01F180();

      v207 = v237;
      if (v195)
        v195(1);
      v208 = sub_24A01ED90();
      v209 = sub_24A01F0F0();
      if (os_log_type_enabled(v208, v209))
      {
        v210 = swift_slowAlloc();
        *(_DWORD *)v210 = 134218240;
        v237 = v207;
        sub_24A01F1F8();
        *(_WORD *)(v210 + 12) = 256;
        LOBYTE(v237) = v228;
        sub_24A01F1F8();
        _os_log_impl(&dword_249F70000, v208, v209, "Resolved %ld tags for type %hhu", (uint8_t *)v210, 0xFu);
        MEMORY[0x24BD07950](v210, -1, -1);
      }

      MEMORY[0x24BDAC7A8](v211);
      v213[-4] = v204;
      LOBYTE(v213[-3]) = v228;
      v213[-2] = sub_24A009D0C;
      v213[-1] = 0;
      v47 = v212;
      sub_24A01F180();
LABEL_158:

      sub_249FDF3A0();
      goto LABEL_121;
    }
  }
  else
  {
    v15 = v8[2];
    MEMORY[0x24BDAC7A8](a1);
    LOBYTE(v223) = v12;
    v224 = v15;
    v17 = v16;
    sub_24A01F180();

    if ((LOBYTE(v240[0]) & 1) != 0)
      goto LABEL_5;
    sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
    v61 = swift_allocObject();
    v62 = MEMORY[0x24BEE4260];
    v63 = MEMORY[0x24BEE42B0];
    *(_OWORD *)(v61 + 16) = xmmword_24A0208B0;
    *(_QWORD *)(v61 + 56) = v62;
    *(_QWORD *)(v61 + 64) = v63;
    *(_BYTE *)(v61 + 32) = v12;
    v64 = (void *)sub_24A01F09C();
    v65 = sub_249FCBC58(v64, 0, 1);

    if (v65)
    {
LABEL_5:
      v8 = v233;
      v13 = v229;
      v14 = v230;
    }
    else
    {
      v8 = v233;
      v13 = v229;
      v14 = v230;
      if ((a6 & 1) == 0)
        goto LABEL_46;
    }
  }
  v18 = CFAbsoluteTimeGetCurrent();
  v255[0] = 1;
  v257 = 0;
  v258 = 0;
  v256 = 0;
  v259 = 513;
  v19 = swift_allocObject();
  v21 = v231;
  v20 = (uint64_t)v232;
  *(_QWORD *)(v19 + 16) = v232;
  *(_QWORD *)(v19 + 24) = v21;
  sub_249F9900C(v20);
  v22 = sub_24A009DD4(v12, (uint64_t)v255, v14, v13, (uint64_t)sub_24A01440C, v19);
  v24 = v23;
  swift_release();
  if (v9)
    goto LABEL_121;
  v236 = v24;
  v226 = 0;
  v228 = v12;
  v243 = v22;
  swift_bridgeObjectRelease();
  v25 = CFAbsoluteTimeGetCurrent();
  v225[1] = (char *)v8 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_logger;
  v26 = sub_24A01ED90();
  v27 = sub_24A01F0F0();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = swift_slowAlloc();
    *(_DWORD *)v28 = 134218496;
    swift_beginAccess();
    sub_24A01F1F8();
    *(_WORD *)(v28 + 12) = 256;
    sub_24A01F1F8();
    *(_WORD *)(v28 + 15) = 2048;
    v240[0] = v25 - v18;
    sub_24A01F1F8();
    _os_log_impl(&dword_249F70000, v26, v27, "Updating %ld primary densities for type %hhu took %fs", (uint8_t *)v28, 0x19u);
    MEMORY[0x24BD07950](v28, -1, -1);
  }

  swift_beginAccess();
  v29 = v243;
  v30 = swift_bridgeObjectRetain();
  v31 = sub_249FA525C(v30);
  swift_bridgeObjectRelease();
  v32 = *(float *)&v31;
  if ((v31 & 0x100000000) != 0)
    v32 = 1.0;
  v33 = *(_QWORD *)(v243 + 64);
  v234 = (_QWORD *)(v243 + 64);
  v34 = 1 << *(_BYTE *)(v243 + 32);
  v35 = -1;
  if (v34 < 64)
    v35 = ~(-1 << v34);
  v36 = v35 & v33;
  v235 = (id)((unint64_t)(v34 + 63) >> 6);
  if (v32 > 1.0)
    v37 = v32;
  else
    v37 = 1.0;
  swift_bridgeObjectRetain();
  v38 = 0;
  while (1)
  {
    if (v36)
    {
      v39 = __clz(__rbit64(v36));
      v36 &= v36 - 1;
      v40 = v39 | (v38 << 6);
      goto LABEL_35;
    }
    v41 = v38 + 1;
    if (__OFADD__(v38, 1))
      goto LABEL_162;
    if (v41 >= (uint64_t)v235)
      break;
    v42 = v234[v41];
    ++v38;
    if (!v42)
    {
      v38 = v41 + 1;
      if (v41 + 1 >= (uint64_t)v235)
        break;
      v42 = v234[v38];
      if (!v42)
      {
        v38 = v41 + 2;
        if (v41 + 2 >= (uint64_t)v235)
          break;
        v42 = v234[v38];
        if (!v42)
        {
          v43 = v41 + 3;
          if (v43 >= (uint64_t)v235)
            break;
          v42 = v234[v43];
          if (!v42)
          {
            while (1)
            {
              v38 = v43 + 1;
              if (__OFADD__(v43, 1))
                break;
              if (v38 >= (uint64_t)v235)
                goto LABEL_57;
              v42 = v234[v38];
              ++v43;
              if (v42)
                goto LABEL_34;
            }
LABEL_166:
            __break(1u);
LABEL_167:
            __break(1u);
LABEL_168:
            sub_24A01F48C();
            __break(1u);
            swift_bridgeObjectRelease();
            __break(1u);
LABEL_169:
            v242 = v238[0];
            result = swift_bridgeObjectRelease();
            __break(1u);
            return result;
          }
          v38 = v43;
        }
      }
    }
LABEL_34:
    v36 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v38 << 6);
LABEL_35:
    v44 = *(_QWORD *)(*(_QWORD *)(v29 + 48) + 8 * v40);
    v45 = *(float *)(*(_QWORD *)(v29 + 56) + 4 * v40);
    swift_beginAccess();
    v46 = swift_isUniquelyReferenced_nonNull_native();
    v47 = (_QWORD *)v243;
    v238[0] = *(double *)&v243;
    *(double *)&v243 = -0.0;
    v49 = sub_249F8B27C(v44);
    v50 = v47[2];
    v51 = (v48 & 1) == 0;
    v52 = v50 + v51;
    if (__OFADD__(v50, v51))
    {
      __break(1u);
      goto LABEL_158;
    }
    v53 = v48;
    if (v47[3] >= v52)
    {
      if ((v46 & 1) == 0)
        sub_249FC226C();
    }
    else
    {
      sub_249FBA62C(v52, v46);
      v54 = sub_249F8B27C(v44);
      if ((v53 & 1) != (v55 & 1))
        goto LABEL_168;
      v49 = v54;
    }
    v56 = v238[0];
    v57 = v45 / v37;
    if ((v53 & 1) != 0)
    {
      *(float *)(*(_QWORD *)(*(_QWORD *)&v238[0] + 56) + 4 * v49) = v57;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)&v238[0] + 8 * (v49 >> 6) + 64) |= 1 << v49;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v56 + 48) + 8 * v49) = v44;
      *(float *)(*(_QWORD *)(*(_QWORD *)&v56 + 56) + 4 * v49) = v57;
      v58 = *(_QWORD *)(*(_QWORD *)&v56 + 16);
      v59 = __OFADD__(v58, 1);
      v60 = v58 + 1;
      if (v59)
      {
        __break(1u);
LABEL_160:
        __break(1u);
LABEL_161:
        __break(1u);
LABEL_162:
        __break(1u);
LABEL_163:
        __break(1u);
LABEL_164:
        __break(1u);
LABEL_165:
        __break(1u);
        goto LABEL_166;
      }
      *(_QWORD *)(*(_QWORD *)&v56 + 16) = v60;
    }
    *(double *)&v243 = v56;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
LABEL_57:
  swift_release();
  v79 = 0;
  v80 = v236[8];
  v234 = v236 + 8;
  v81 = 1 << *((_BYTE *)v236 + 32);
  v82 = -1;
  if (v81 < 64)
    v82 = ~(-1 << v81);
  v83 = v82 & v80;
  v235 = (id)((unint64_t)(v81 + 63) >> 6);
  while (v83)
  {
    v84 = __clz(__rbit64(v83));
    v83 &= v83 - 1;
    v85 = v84 | (v79 << 6);
    v86 = v236;
LABEL_78:
    v90 = *(_QWORD *)(v86[6] + 8 * v85);
    v91 = v86[7] + 16 * v85;
    v92 = *(_QWORD *)v91;
    v93 = *(_DWORD *)(v91 + 8);
    swift_beginAccess();
    if (*(_QWORD *)(v243 + 16))
    {
      v94 = sub_249F8B27C(v92);
      v95 = 0.0;
      if ((v96 & 1) != 0)
        v95 = *(float *)(*(_QWORD *)(v243 + 56) + 4 * v94);
      swift_endAccess();
      v97 = sub_249F8B27C(v90);
      if ((v98 & 1) != 0)
        v99 = *(float *)(*(_QWORD *)(v243 + 56) + 4 * v97) < v95;
      else
        v99 = v95 > 0.0;
      v100 = sub_249F8B27C(v92);
      if ((v101 & 1) != 0)
      {
        v102 = *(float *)(*(_QWORD *)(v243 + 56) + 4 * v100);
        v103 = sub_249F8B27C(v90);
        if ((v104 & 1) != 0 && v102 == *(float *)(*(_QWORD *)(v243 + 56) + 4 * v103))
        {
LABEL_89:
          v105 = v90 < v92 || v99;
          if ((v105 & 1) == 0)
            continue;
LABEL_96:
          v107 = swift_isUniquelyReferenced_nonNull_native();
          v108 = v242;
          v239[0] = v242;
          v242 = -0.0;
          v110 = sub_249F8B27C(v90);
          v111 = *(_QWORD *)(*(_QWORD *)&v108 + 16);
          v112 = (v109 & 1) == 0;
          v113 = v111 + v112;
          if (__OFADD__(v111, v112))
            goto LABEL_160;
          v114 = v109;
          if (*(_QWORD *)(*(_QWORD *)&v108 + 24) < v113)
          {
            sub_249FBA388(v113, v107);
            v115 = sub_249F8B27C(v90);
            if ((v114 & 1) != (v116 & 1))
              goto LABEL_168;
            v110 = v115;
            v117 = v239[0];
            if ((v114 & 1) == 0)
              goto LABEL_105;
LABEL_103:
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v117 + 56) + 8 * v110) = v92;
            goto LABEL_107;
          }
          if ((v107 & 1) != 0)
          {
            v117 = v239[0];
            if ((v109 & 1) != 0)
              goto LABEL_103;
          }
          else
          {
            sub_249FC20E0();
            v117 = v239[0];
            if ((v114 & 1) != 0)
              goto LABEL_103;
          }
LABEL_105:
          *(_QWORD *)(*(_QWORD *)&v117 + 8 * (v110 >> 6) + 64) |= 1 << v110;
          v118 = 8 * v110;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v117 + 48) + v118) = v90;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v117 + 56) + v118) = v92;
          v119 = *(_QWORD *)(*(_QWORD *)&v117 + 16);
          v59 = __OFADD__(v119, 1);
          v120 = v119 + 1;
          if (v59)
            goto LABEL_164;
          *(_QWORD *)(*(_QWORD *)&v117 + 16) = v120;
LABEL_107:
          v242 = v117;
          swift_bridgeObjectRelease();
          v121 = swift_isUniquelyReferenced_nonNull_native();
          v239[0] = v241;
          v123 = sub_249F8B27C(v90);
          v124 = *(_QWORD *)(*(_QWORD *)&v241 + 16);
          v125 = (v122 & 1) == 0;
          v126 = v124 + v125;
          if (__OFADD__(v124, v125))
            goto LABEL_161;
          v127 = v122;
          if (*(_QWORD *)(*(_QWORD *)&v241 + 24) < v126)
          {
            sub_249FBA62C(v126, v121);
            v128 = sub_249F8B27C(v90);
            if ((v127 & 1) != (v129 & 1))
              goto LABEL_168;
            v123 = v128;
            v130 = v239[0];
            if ((v127 & 1) == 0)
              goto LABEL_114;
LABEL_60:
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)&v130 + 56) + 4 * v123) = v93;
LABEL_61:
            v241 = v130;
            swift_bridgeObjectRelease();
            continue;
          }
          if ((v121 & 1) != 0)
          {
            v130 = v239[0];
            if ((v122 & 1) != 0)
              goto LABEL_60;
          }
          else
          {
            sub_249FC226C();
            v130 = v239[0];
            if ((v127 & 1) != 0)
              goto LABEL_60;
          }
LABEL_114:
          *(_QWORD *)(*(_QWORD *)&v130 + 8 * (v123 >> 6) + 64) |= 1 << v123;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v130 + 48) + 8 * v123) = v90;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)&v130 + 56) + 4 * v123) = v93;
          v131 = *(_QWORD *)(*(_QWORD *)&v130 + 16);
          v59 = __OFADD__(v131, 1);
          v132 = v131 + 1;
          if (v59)
            goto LABEL_165;
          *(_QWORD *)(*(_QWORD *)&v130 + 16) = v132;
          goto LABEL_61;
        }
      }
      else
      {
        sub_249F8B27C(v90);
        if ((v106 & 1) == 0)
          goto LABEL_89;
      }
      if (v99)
        goto LABEL_96;
    }
    else
    {
      swift_endAccess();
      if (v90 < v92)
        goto LABEL_96;
    }
  }
  v87 = v79 + 1;
  if (__OFADD__(v79, 1))
    goto LABEL_163;
  v86 = v236;
  if (v87 < (uint64_t)v235)
  {
    v88 = v234[v87];
    ++v79;
    if (!v88)
    {
      v79 = v87 + 1;
      if (v87 + 1 >= (uint64_t)v235)
        goto LABEL_118;
      v88 = v234[v79];
      if (!v88)
      {
        v79 = v87 + 2;
        if (v87 + 2 >= (uint64_t)v235)
          goto LABEL_118;
        v88 = v234[v79];
        if (!v88)
        {
          v89 = v87 + 3;
          if (v89 >= (uint64_t)v235)
            goto LABEL_118;
          v88 = v234[v89];
          if (!v88)
          {
            while (1)
            {
              v79 = v89 + 1;
              if (__OFADD__(v89, 1))
                goto LABEL_167;
              if (v79 >= (uint64_t)v235)
                goto LABEL_118;
              v88 = v234[v79];
              ++v89;
              if (v88)
                goto LABEL_77;
            }
          }
          v79 = v89;
        }
      }
    }
LABEL_77:
    v83 = (v88 - 1) & v88;
    v85 = __clz(__rbit64(v88)) + (v79 << 6);
    goto LABEL_78;
  }
LABEL_118:
  swift_release();
  v134 = v231;
  v133 = (uint64_t)v232;
  if (v232)
    v232(*(_QWORD *)(*(_QWORD *)&v242 + 16));
  v135 = swift_bridgeObjectRetain();
  v136 = sub_249FB5488(v135);
  swift_bridgeObjectRelease();
  v250[0] = 1;
  v251 = 0;
  v252 = v136;
  v253 = 0;
  v254 = 513;
  v137 = v243;
  v138 = swift_allocObject();
  *(_QWORD *)(v138 + 16) = v232;
  *(_QWORD *)(v138 + 24) = v134;
  sub_249F9900C(v133);
  swift_bridgeObjectRetain();
  v139 = sub_24A00A5D8(v228, (uint64_t)v250, v230, v229, v137, (uint64_t)sub_24A01440C, v138);
  v141 = v140;
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  if (!v226)
  {
    swift_bridgeObjectRetain();
    v150 = swift_isUniquelyReferenced_nonNull_native();
    v239[0] = v242;
    v242 = -0.0;
    sub_24A0135C0(v139, (uint64_t)sub_24A014294, 0, v150, v239);
    v242 = v239[0];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v151 = v241;
    v152 = swift_isUniquelyReferenced_nonNull_native();
    v239[0] = v151;
    v241 = -0.0;
    sub_24A013344(v141, (uint64_t)sub_24A013FA8, 0, v152, v239);
    v236 = 0;
    v241 = v239[0];
    swift_bridgeObjectRelease();
    v153 = CFAbsoluteTimeGetCurrent();
    v154 = sub_24A01ED90();
    v155 = sub_24A01F0F0();
    if (os_log_type_enabled(v154, v155))
    {
      v156 = swift_slowAlloc();
      *(_DWORD *)v156 = 134218240;
      swift_beginAccess();
      v239[0] = *(double *)(*(_QWORD *)&v242 + 16);
      sub_24A01F1F8();
      *(_WORD *)(v156 + 12) = 2048;
      v239[0] = v153 - v18;
      sub_24A01F1F8();
      _os_log_impl(&dword_249F70000, v154, v155, "Updating %ld primary partners took %fs", (uint8_t *)v156, 0x16u);
      MEMORY[0x24BD07950](v156, -1, -1);
    }

    v72 = 1;
    v12 = v228;
    goto LABEL_55;
  }
LABEL_121:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A009970(uint64_t a1, id a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  id v10;
  char isUniquelyReferenced_nonNull_native;
  float v12;
  float v13;
  char v14;
  float v15;
  float v16;
  char v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v10 = objc_msgSend(a2, sel_partner);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *a3;
  *a3 = 0x8000000000000000;
  sub_249FBFA34((uint64_t)v10, a1, isUniquelyReferenced_nonNull_native);
  *a3 = v19;
  swift_bridgeObjectRelease();
  swift_endAccess();
  objc_msgSend(a2, sel_similarity);
  v13 = v12;
  v14 = swift_isUniquelyReferenced_nonNull_native();
  v21 = *a4;
  *a4 = 0x8000000000000000;
  sub_249FBFB60(a1, v14, v13);
  *a4 = v21;
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_density);
  v16 = v15;
  swift_beginAccess();
  v17 = swift_isUniquelyReferenced_nonNull_native();
  v20 = *a5;
  *a5 = 0x8000000000000000;
  sub_249FBFB60(a1, v17, v16);
  *a5 = v20;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

unint64_t sub_24A009AE4(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  unint64_t v15;
  char v16;
  float v17;
  double v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t result;
  uint64_t v24;
  char v25;
  float v26;
  double v27;
  char v28;
  uint64_t v29;
  char v30;
  float v31;
  double v32;

  swift_beginAccess();
  v14 = *a3;
  if (*(_QWORD *)(v14 + 16) && (v15 = sub_249F8B27C(a1), (v16 & 1) != 0))
  {
    v17 = *(float *)(*(_QWORD *)(v14 + 56) + 4 * v15);
    swift_endAccess();
    objc_msgSend(a2, sel_density);
    if (v17 != *(float *)&v18)
    {
      *(float *)&v18 = v17;
      objc_msgSend(a2, sel_setDensity_, v18);
    }
  }
  else
  {
    swift_endAccess();
  }
  swift_beginAccess();
  v19 = *a4;
  if (*(_QWORD *)(*a4 + 16) && (v20 = sub_249F8B27C(a1), (v21 & 1) != 0))
  {
    v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
    swift_endAccess();
    result = (unint64_t)objc_msgSend(a2, sel_partner);
    if (v22 != result)
      result = (unint64_t)objc_msgSend(a2, sel_setPartner_, v22);
  }
  else
  {
    result = swift_endAccess();
  }
  v24 = *a5;
  if (*(_QWORD *)(*a5 + 16))
  {
    result = sub_249F8B27C(a1);
    if ((v25 & 1) != 0)
    {
      v26 = *(float *)(*(_QWORD *)(v24 + 56) + 4 * result);
      result = (unint64_t)objc_msgSend(a2, sel_similarity);
      if (v26 != *(float *)&v27)
      {
        *(float *)&v27 = v26;
        result = (unint64_t)objc_msgSend(a2, sel_setSimilarity_, v27);
      }
    }
  }
  if (*(_QWORD *)(a6 + 16))
  {
    result = sub_249F8B27C(a1);
    if ((v28 & 1) != 0)
    {
      v29 = *(_QWORD *)(*(_QWORD *)(a6 + 56) + 8 * result);
      result = (unint64_t)objc_msgSend(a2, sel_label);
      if (v29 != result)
        result = (unint64_t)objc_msgSend(a2, sel_setLabel_, v29);
    }
  }
  if (*(_QWORD *)(a7 + 16))
  {
    result = sub_249F8B27C(a1);
    if ((v30 & 1) != 0)
    {
      v31 = *(float *)(*(_QWORD *)(a7 + 56) + 4 * result);
      result = (unint64_t)objc_msgSend(a2, sel_diversity);
      if (v31 != *(float *)&v32)
      {
        *(float *)&v32 = v31;
        return (unint64_t)objc_msgSend(a2, sel_setDiversity_, v32);
      }
    }
  }
  return result;
}

void sub_24A009D0C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;

  v2 = sub_24A01EB5C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a1, sel_setStaleObservations_, 0);
  objc_msgSend(a1, sel_setStaleTags_, 0);
  sub_24A01EB50();
  v6 = (void *)sub_24A01EB2C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(a1, sel_setLastUpdated_, v6);

}

uint64_t sub_24A009DD4(unsigned int a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t result;
  char v27[16];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD aBlock[9];

  v10 = swift_allocObject();
  v11 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4B00];
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v14 = a4[3];
  v13 = a4[4];
  v15 = a4;
  v16 = v10;
  v17 = v12;
  __swift_project_boxed_opaque_existential_1Tm(v15, v14);
  v18 = *(_QWORD *)(a3 + 48);
  v28 = a3;
  v29 = v6;
  v30 = v17;
  v31 = v16;
  v32 = a5;
  v33 = a6;
  v19 = aBlock[8];
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE, uint64_t (*)(uint64_t, uint64_t, uint64_t), char *, uint64_t, uint64_t))(v13 + 8))(a1, a2, 2, 0, 1, v18, 35, a3, 0, sub_24A013F68, v27, v14, v13);
  if (v19)
  {
    swift_release();
    swift_release();
    return v16;
  }
  v20 = v16;
  v21 = *(NSObject **)(v6 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_lockQueue);
  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_249F87210;
  aBlock[3] = &block_descriptor_51;
  v22 = _Block_copy(aBlock);
  swift_release();
  dispatch_sync(v21, v22);
  _Block_release(v22);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) == 0)
  {
    swift_beginAccess();
    v16 = *(_QWORD *)(v20 + 16);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    return v16;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A00A00C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t), uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t result;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  float v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float *v31;
  unint64_t v32;
  unint64_t v33;
  float v34;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v36;
  uint64_t v37;
  float v38;
  float *v39;
  uint64_t v40;
  uint64_t v41;
  float *v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  _QWORD v51[3];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  uint64_t v61;
  _QWORD aBlock[6];

  v60 = a8;
  v54 = a6;
  v55 = a7;
  v51[2] = a5;
  v52 = a1;
  v53 = a3;
  v51[1] = a9;
  v11 = sub_24A01EDCC();
  v58 = *(_QWORD *)(v11 - 8);
  v59 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_24A01EDE4();
  v56 = *(_QWORD *)(v14 - 8);
  v57 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(a2 + 16);
  swift_retain();
  result = swift_bridgeObjectRetain();
  v19 = 0;
  v20 = MEMORY[0x24BEE4AF8];
LABEL_2:
  if (v19 <= v17)
    v21 = v17;
  else
    v21 = v19;
  while (v17 != v19)
  {
    v22 = v19;
    if (v21 == v19)
    {
      __break(1u);
      return result;
    }
    v23 = *(float *)(a2 + 32 + 4 * v19);
    if (*(_BYTE *)(a4 + 68) == 1)
    {
      ++v19;
      if (*(float *)(a4 + 56) > v23)
        continue;
    }
    result = swift_isUniquelyReferenced_nonNull_native();
    aBlock[0] = v20;
    if ((result & 1) == 0)
    {
      result = sub_249F8CA18(0, *(_QWORD *)(v20 + 16) + 1, 1);
      v20 = aBlock[0];
    }
    v25 = *(_QWORD *)(v20 + 16);
    v24 = *(_QWORD *)(v20 + 24);
    if (v25 >= v24 >> 1)
    {
      result = sub_249F8CA18(v24 > 1, v25 + 1, 1);
      v20 = aBlock[0];
    }
    v19 = v22 + 1;
    *(_QWORD *)(v20 + 16) = v25 + 1;
    v26 = v20 + 16 * v25;
    *(_QWORD *)(v26 + 32) = v22;
    *(float *)(v26 + 40) = v23;
    goto LABEL_2;
  }
  swift_bridgeObjectRelease();
  swift_release();
  swift_retain();
  sub_24A0142A0(v20, a4);
  v28 = v27;
  swift_release();
  swift_release();
  v29 = *(_QWORD *)(v28 + 16);
  v30 = MEMORY[0x24BEE4AF8];
  if (v29)
  {
    v31 = (float *)(v28 + 32);
    do
    {
      v34 = *v31;
      if (*v31 >= 0.0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        aBlock[0] = v30;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_249F8CC30(0, *(_QWORD *)(v30 + 16) + 1, 1);
          v30 = aBlock[0];
        }
        v33 = *(_QWORD *)(v30 + 16);
        v32 = *(_QWORD *)(v30 + 24);
        if (v33 >= v32 >> 1)
        {
          sub_249F8CC30(v32 > 1, v33 + 1, 1);
          v30 = aBlock[0];
        }
        *(_QWORD *)(v30 + 16) = v33 + 1;
        *(float *)(v30 + 4 * v33 + 32) = v34;
      }
      ++v31;
      --v29;
    }
    while (v29);
  }
  swift_bridgeObjectRelease();
  v36 = *(_QWORD *)(v30 + 16);
  if (!v36)
  {
    v38 = 0.0;
    goto LABEL_32;
  }
  if (v36 == 1)
  {
    v37 = 0;
    v38 = 0.0;
LABEL_30:
    v41 = v36 - v37;
    v42 = (float *)(v30 + 4 * v37 + 32);
    do
    {
      v43 = *v42++;
      v38 = v38 + v43;
      --v41;
    }
    while (v41);
    goto LABEL_32;
  }
  v37 = v36 & 0x7FFFFFFFFFFFFFFELL;
  v39 = (float *)(v30 + 36);
  v38 = 0.0;
  v40 = v36 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    v38 = (float)(v38 + *(v39 - 1)) + *v39;
    v39 += 2;
    v40 -= 2;
  }
  while (v40);
  if (v36 != v37)
    goto LABEL_30;
LABEL_32:
  swift_release();
  v44 = swift_allocObject();
  v45 = v53;
  *(_QWORD *)(v44 + 16) = v52;
  *(_QWORD *)(v44 + 24) = a2;
  *(_QWORD *)(v44 + 32) = v45;
  *(_QWORD *)(v44 + 40) = a4;
  v46 = v55;
  *(_QWORD *)(v44 + 48) = v54;
  *(_QWORD *)(v44 + 56) = v46;
  *(float *)(v44 + 64) = v38;
  aBlock[4] = sub_24A0143E4;
  aBlock[5] = v44;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24A007D98;
  aBlock[3] = &block_descriptor_57;
  v47 = _Block_copy(aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_24A01EDD8();
  v61 = MEMORY[0x24BEE4AF8];
  sub_249FA2B24((unint64_t *)&qword_2544CA290, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA298);
  sub_249F98C68((unint64_t *)&qword_2544CA2A0, &qword_2544CA298, MEMORY[0x24BEE12C8]);
  v48 = v59;
  sub_24A01F228();
  MEMORY[0x24BD07014](0, v16, v13, v47);
  _Block_release(v47);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v13, v48);
  (*(void (**)(char *, uint64_t))(v56 + 8))(v16, v57);
  v49 = swift_release();
  if (v60)
    v50 = v60(v49);
  else
    v50 = 1;
  return v50 & 1;
}

uint64_t sub_24A00A4B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, float a7)
{
  uint64_t v9;
  float v10;
  uint64_t *v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  char v14;
  uint64_t v15;
  uint64_t v16;

  v9 = result;
  if (!*(_QWORD *)(a3 + 16))
    goto LABEL_5;
  if (*(_QWORD *)(a2 + 16))
  {
    v10 = *(float *)(a2 + 32);
    if (*(float *)(a4 + 56) <= v10)
    {
      v11 = (uint64_t *)(a5 + 16);
      v12 = *(_QWORD *)(a3 + 32);
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v15 = *v11;
      *v11 = 0x8000000000000000;
      sub_249FC070C(v12, v9, isUniquelyReferenced_nonNull_native, v10);
      *v11 = v15;
      swift_bridgeObjectRelease();
      swift_endAccess();
    }
LABEL_5:
    swift_beginAccess();
    v14 = swift_isUniquelyReferenced_nonNull_native();
    v16 = *(_QWORD *)(a6 + 16);
    *(_QWORD *)(a6 + 16) = 0x8000000000000000;
    sub_249FBFB60(v9, v14, a7);
    *(_QWORD *)(a6 + 16) = v16;
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  __break(1u);
  return result;
}

uint64_t sub_24A00A5D8(unsigned int a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t result;
  char v29[16];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[9];

  v8 = v7;
  v12 = swift_allocObject();
  v13 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v12 + 16) = MEMORY[0x24BEE4B00];
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = a4[3];
  v16 = a4[4];
  v17 = a4;
  v18 = v12;
  v19 = v14;
  __swift_project_boxed_opaque_existential_1Tm(v17, v15);
  v20 = *(_QWORD *)(a3 + 48);
  v30 = a5;
  v31 = v8;
  v32 = v18;
  v33 = v19;
  v34 = a6;
  v35 = a7;
  v21 = aBlock[8];
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE, uint64_t (*)(uint64_t, uint64_t, uint64_t), char *, uint64_t, uint64_t))(v16 + 8))(a1, a2, 2, 0, 1, v20, 35, a3, 0, sub_24A013F14, v29, v15, v16);
  if (v21)
  {
    swift_release();
    swift_release();
    return a5;
  }
  v22 = *(NSObject **)(v8 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_lockQueue);
  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_249F87210;
  aBlock[3] = &block_descriptor_38;
  v23 = _Block_copy(aBlock);
  swift_release();
  dispatch_sync(v22, v23);
  _Block_release(v23);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) == 0)
  {
    swift_beginAccess();
    a5 = *(_QWORD *)(v18 + 16);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    return a5;
  }
  __break(1u);
  return result;
}

unint64_t sub_24A00A804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t))
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t result;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  float v27;
  char v28;
  unint64_t v29;
  char v30;
  BOOL v31;
  unint64_t v32;
  char v33;
  float v34;
  char v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  char *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD aBlock[7];

  v49 = a6;
  v50 = a7;
  v54 = a2;
  v13 = sub_24A01EDCC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_24A01EDE4();
  v51 = *(_QWORD *)(v17 - 8);
  v52 = v17;
  result = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)(a3 + 16);
  v22 = 0;
  v53 = v16;
  if (!v21)
  {
    v25 = -1;
    v38 = v54;
LABEL_26:
    v54 = *(_QWORD *)(a5 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_lockQueue);
    v39 = swift_allocObject();
    v40 = v50;
    *(_QWORD *)(v39 + 16) = v49;
    *(_QWORD *)(v39 + 24) = a1;
    *(_QWORD *)(v39 + 32) = v38;
    *(_QWORD *)(v39 + 40) = a3;
    *(_QWORD *)(v39 + 48) = v25;
    *(_QWORD *)(v39 + 56) = v40;
    *(_DWORD *)(v39 + 64) = v22;
    aBlock[4] = sub_24A013F5C;
    aBlock[5] = v39;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24A007D98;
    aBlock[3] = &block_descriptor_44;
    v41 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_24A01EDD8();
    v55 = MEMORY[0x24BEE4AF8];
    sub_249FA2B24((unint64_t *)&qword_2544CA290, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA298);
    sub_249F98C68((unint64_t *)&qword_2544CA2A0, &qword_2544CA298, MEMORY[0x24BEE12C8]);
    v42 = v53;
    sub_24A01F228();
    MEMORY[0x24BD07014](0, v20, v42, v41);
    _Block_release(v41);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v42, v13);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v20, v52);
    v43 = swift_release();
    if (a8)
      v44 = a8(v43);
    else
      v44 = 1;
    return v44 & 1;
  }
  v45 = a5;
  v46 = v14;
  v47 = v13;
  v48 = a8;
  v23 = 0;
  v24 = *(_QWORD *)(a4 + 16);
  while (1)
  {
    v25 = *(_QWORD *)(a3 + 32 + 8 * v23);
    if (!v24)
    {
      if (v25 > a1)
        break;
      goto LABEL_4;
    }
    v26 = sub_249F8B27C(*(_QWORD *)(a3 + 32 + 8 * v23));
    v27 = 0.0;
    if ((v28 & 1) != 0)
      v27 = *(float *)(*(_QWORD *)(a4 + 56) + 4 * v26);
    v29 = sub_249F8B27C(a1);
    v31 = (v30 & 1) != 0 ? *(float *)(*(_QWORD *)(a4 + 56) + 4 * v29) < v27 : v27 > 0.0;
    v32 = sub_249F8B27C(v25);
    if ((v33 & 1) != 0)
    {
      v34 = *(float *)(*(_QWORD *)(a4 + 56) + 4 * v32);
      result = sub_249F8B27C(a1);
      if ((v35 & 1) == 0 || v34 != *(float *)(*(_QWORD *)(a4 + 56) + 4 * result))
      {
LABEL_20:
        if (v31)
          break;
        goto LABEL_4;
      }
    }
    else
    {
      result = sub_249F8B27C(a1);
      if ((v37 & 1) != 0)
        goto LABEL_20;
    }
    v36 = v25 > a1 || v31;
    if ((v36 & 1) != 0)
      break;
LABEL_4:
    if (v21 == ++v23)
    {
      v25 = -1;
      v13 = v47;
      a8 = v48;
      v14 = v46;
      v38 = v54;
      goto LABEL_25;
    }
  }
  v38 = v54;
  if (v23 < *(_QWORD *)(v54 + 16))
  {
    v22 = *(_DWORD *)(v54 + 4 * v23 + 32);
    v13 = v47;
    a8 = v48;
    v14 = v46;
LABEL_25:
    a5 = v45;
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A00AB74(uint64_t a1, uint64_t a2, float a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char isUniquelyReferenced_nonNull_native;
  char v13;
  uint64_t v15;
  uint64_t v16;

  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0x8000000000000000;
  sub_249FBFA34(a6, a2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a1 + 16) = v15;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  v13 = swift_isUniquelyReferenced_nonNull_native();
  v16 = *(_QWORD *)(a7 + 16);
  *(_QWORD *)(a7 + 16) = 0x8000000000000000;
  sub_249FBFB60(a2, v13, a3);
  *(_QWORD *)(a7 + 16) = v16;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_24A00AC78(unsigned int a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t result;
  _BYTE v23[16];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[9];

  v7 = v6;
  v10 = swift_allocObject();
  v11 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4B00];
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v11;
  v13 = a4[3];
  v14 = a4[4];
  __swift_project_boxed_opaque_existential_1Tm(a4, v13);
  v24 = v7;
  v25 = v10;
  v26 = v12;
  v27 = a5;
  v28 = a6;
  v15 = aBlock[8];
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE, uint64_t (*)(uint64_t, uint64_t, uint64_t), _BYTE *, uint64_t, uint64_t))(v14 + 8))(a1, a2, 2, 0, 1, 1, 5, a3, 0, sub_24A013E38, v23, v13, v14);
  if (v15)
  {
    swift_release();
    swift_release();
    return v13;
  }
  v16 = *(NSObject **)(v7 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_lockQueue);
  aBlock[4] = nullsub_1;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_249F87210;
  aBlock[3] = &block_descriptor_15_0;
  v17 = _Block_copy(aBlock);
  swift_release();
  dispatch_sync(v16, v17);
  _Block_release(v17);
  result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) == 0)
  {
    swift_beginAccess();
    v13 = *(_QWORD *)(v10 + 16);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_release();
    swift_release();
    return v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A00AE98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t), uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  const void *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t aBlock;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  void *v45;
  uint64_t (*v46)();
  _QWORD *v47;

  v33 = a8;
  v35 = a6;
  v36 = a7;
  v37 = a1;
  v12 = sub_24A01EDCC();
  v40 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24A01EDE4();
  v38 = *(_QWORD *)(v15 - 8);
  v39 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = -1;
  v19 = swift_allocObject();
  *(_DWORD *)(v19 + 16) = 0;
  if (*(_QWORD *)(a2 + 16))
  {
    v30[1] = *(_QWORD *)(a4 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_lockQueue);
    v20 = (_QWORD *)swift_allocObject();
    v21 = v37;
    v20[2] = v18;
    v20[3] = v21;
    v20[4] = a2;
    v20[5] = a3;
    v20[6] = v19;
    v46 = sub_24A013EA4;
    v47 = v20;
    aBlock = MEMORY[0x24BDAC760];
    v43 = 1107296256;
    v44 = sub_24A007D98;
    v45 = &block_descriptor_27_0;
    v30[0] = _Block_copy(&aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_24A01EDD8();
    v41 = MEMORY[0x24BEE4AF8];
    sub_249FA2B24((unint64_t *)&qword_2544CA290, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    v31 = a4;
    v32 = a5;
    v34 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA298);
    sub_249F98C68((unint64_t *)&qword_2544CA2A0, &qword_2544CA298, MEMORY[0x24BEE12C8]);
    a4 = v31;
    sub_24A01F228();
    v22 = (const void *)v30[0];
    MEMORY[0x24BD07014](0, v17, v14, v30[0]);
    a5 = v32;
    v19 = v34;
    _Block_release(v22);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v12);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v39);
    swift_release();
  }
  v34 = *(_QWORD *)(a4 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_lockQueue);
  v23 = (_QWORD *)swift_allocObject();
  v24 = v37;
  v23[2] = a5;
  v23[3] = v24;
  v23[4] = a2;
  v23[5] = a3;
  v25 = v35;
  v23[6] = v18;
  v23[7] = v25;
  v23[8] = v19;
  v46 = sub_24A013F00;
  v47 = v23;
  aBlock = MEMORY[0x24BDAC760];
  v43 = 1107296256;
  v44 = sub_24A007D98;
  v45 = &block_descriptor_33_1;
  v26 = _Block_copy(&aBlock);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24A01EDD8();
  v41 = MEMORY[0x24BEE4AF8];
  sub_249FA2B24((unint64_t *)&qword_2544CA290, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA298);
  sub_249F98C68((unint64_t *)&qword_2544CA2A0, &qword_2544CA298, MEMORY[0x24BEE12C8]);
  sub_24A01F228();
  MEMORY[0x24BD07014](0, v17, v14, v26);
  _Block_release(v26);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v12);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v17, v39);
  v27 = swift_release();
  if (v36)
    v28 = v36(v27);
  else
    v28 = 1;
  swift_release();
  swift_release();
  return v28 & 1;
}

uint64_t sub_24A00B2E0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  int v9;

  if (*(_QWORD *)(a4 + 16))
  {
    v7 = result;
    v8 = *(_QWORD *)(a4 + 32);
    result = swift_beginAccess();
    *(_QWORD *)(v7 + 16) = v8;
    if (*(_QWORD *)(a3 + 16))
    {
      v9 = *(_DWORD *)(a3 + 32);
      result = swift_beginAccess();
      *(_DWORD *)(a5 + 16) = v9;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24A00B36C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  float v14;
  char v15;
  uint64_t v17;
  uint64_t v18;

  swift_beginAccess();
  v12 = *(_QWORD *)(a5 + 16);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v18 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0x8000000000000000;
  sub_249FBFA34(v12, a2, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a1 + 16) = v18;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  v14 = *(float *)(a7 + 16);
  swift_beginAccess();
  v15 = swift_isUniquelyReferenced_nonNull_native();
  v17 = *(_QWORD *)(a6 + 16);
  *(_QWORD *)(a6 + 16) = 0x8000000000000000;
  sub_249FBFB60(a2, v15, v14);
  *(_QWORD *)(a6 + 16) = v17;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_24A00B4B0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, char a6)
{
  uint64_t *v6;
  uint64_t *v7;
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
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t isEscapingClosureAtFileLocation;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  int64_t v65;
  float v66;
  int64_t v67;
  float v68;
  unint64_t v69;
  unint64_t i;
  int64_t v71;
  unint64_t v72;
  int64_t v73;
  uint64_t v74;
  float v75;
  uint64_t *v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  uint64_t v80;
  char isUniquelyReferenced_nonNull_native;
  char v82;
  unint64_t v83;
  uint64_t v84;
  _BOOL8 v85;
  uint64_t v86;
  char v87;
  unint64_t v88;
  char v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  BOOL v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  unsigned __int8 v112;
  uint64_t v113;
  int v114;
  uint64_t v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(_QWORD);
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  char v135;
  uint64_t v136;
  char v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  char v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void (*v149)(uint64_t, uint64_t);
  char v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  char *v157;
  void (*v158)(_QWORD);
  uint64_t v159;
  void (*v160)(_QWORD);
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
  char *v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  uint64_t v175;
  int v176;
  uint64_t v177;
  uint64_t v178;
  char v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t v187;
  char v188;
  char v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void (*v199)(uint64_t, uint64_t);
  uint64_t v200;
  uint64_t v201;
  char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v210;
  unint64_t v211;
  _QWORD *v212;
  uint64_t v213;
  unint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void (*v217)(char *, uint64_t, uint64_t);
  uint64_t v218;
  unint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  _QWORD *v233;
  char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  char v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  unint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  unint64_t v249;
  uint64_t v250;
  uint64_t v251;
  unint64_t v252;
  uint64_t v253;
  uint64_t v254;
  char v255;
  uint64_t v256;
  char v257;
  uint64_t v258;
  unint64_t v259;
  unint64_t v260;
  float v261;
  unint64_t v262;
  char v263;
  char v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  unint64_t v268;
  uint64_t v269;
  unint64_t v270;
  unint64_t v271;
  uint64_t v272;
  unint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  char v278;
  uint64_t inited;
  uint64_t v280;
  uint64_t v281;
  unint64_t v282;
  uint64_t v283;
  _BOOL8 v284;
  uint64_t v285;
  unint64_t v286;
  char v287;
  uint64_t v288;
  uint64_t v289;
  char v290;
  char v291;
  unint64_t v292;
  uint64_t v293;
  _BOOL8 v294;
  uint64_t v295;
  char v296;
  unint64_t v297;
  char v298;
  uint64_t v299;
  uint64_t v300;
  void (*v301)(_QWORD);
  char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  char v306;
  uint64_t v307;
  uint64_t v308;
  char v309;
  char v310;
  uint64_t v311;
  int64_t v312;
  uint64_t v313;
  unint64_t v314;
  uint64_t v315;
  char v316;
  char v317;
  uint64_t v318;
  char *v319;
  uint64_t v320;
  __int16 v321;
  __int16 v322;
  uint64_t v323;
  char v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  char v330;
  uint64_t v331;
  uint64_t v332;
  char v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  char v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t *v342;
  uint64_t v343;
  uint64_t v344;
  char v345;
  uint64_t v346;
  uint64_t v347;
  char v348;
  uint64_t v349;
  uint64_t v350;
  char v351;
  char v352;
  uint64_t v353;
  char v354;
  BOOL v355;
  uint64_t v356;
  char v357;
  uint64_t v358;
  char v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  unint64_t v367;
  unint64_t v368;
  uint64_t v369;
  char v370;
  uint64_t v371;
  uint64_t v372;
  char v373;
  uint64_t v374;
  char v375;
  uint64_t v376;
  uint64_t result;
  uint64_t v378;
  char *v379;
  uint64_t v380;
  char *v381;
  uint64_t v382;
  char *v383;
  char *v384;
  uint64_t v385;
  char *v386;
  uint64_t (*v387)(uint64_t, uint64_t, uint64_t);
  char *v388;
  uint64_t v389;
  void (*v390)(char *, uint64_t, uint64_t);
  uint64_t v391;
  uint64_t v392;
  char *v393;
  char *v394;
  uint64_t v395;
  uint64_t *v396;
  uint64_t *v397;
  uint64_t v398;
  uint64_t *v399;
  void (*v400)(_QWORD);
  uint64_t *v401;
  uint64_t *v402;
  char *v403;
  uint64_t v404;
  uint64_t *v405;
  char *v406;
  int v407;
  __int128 v408;
  uint64_t v409;
  uint64_t v410;
  char *v411;
  uint64_t v412;
  unint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418[3];
  uint64_t v419[3];
  uint64_t v420[6];
  uint64_t v421;
  uint64_t v422;
  char v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  _QWORD aBlock[7];

  v7 = v6;
  LODWORD(v400) = a5;
  v407 = a1;
  v12 = sub_24A01EBA4();
  v413 = *(_QWORD *)(v12 - 8);
  v414 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v410 = (uint64_t)&v378 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v403 = (char *)&v378 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF8D0);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v411 = (char *)&v378 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v399 = (uint64_t *)((char *)&v378 - v19);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v389 = (uint64_t)&v378 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v378 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v383 = (char *)&v378 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v382 = (uint64_t)&v378 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v385 = (uint64_t)&v378 - v30;
  v412 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578FFB78);
  v31 = MEMORY[0x24BDAC7A8](v412);
  v384 = (char *)&v378 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v386 = (char *)&v378 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v388 = (char *)&v378 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v387 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&v378 - v38);
  v39 = MEMORY[0x24BDAC7A8](v37);
  v409 = (uint64_t)&v378 - v40;
  MEMORY[0x24BDAC7A8](v39);
  v379 = (char *)&v378 - v41;
  v380 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF778);
  *(_QWORD *)&v408 = *(_QWORD *)(v380 - 8);
  v42 = MEMORY[0x24BDAC7A8](v380);
  v401 = (uint64_t *)((char *)&v378 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  v44 = MEMORY[0x24BDAC7A8](v42);
  v405 = (uint64_t *)((char *)&v378 - v45);
  v46 = MEMORY[0x24BDAC7A8](v44);
  v391 = (uint64_t)&v378 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v396 = (uint64_t *)((char *)&v378 - v49);
  v50 = MEMORY[0x24BDAC7A8](v48);
  v390 = (void (*)(char *, uint64_t, uint64_t))((char *)&v378 - v51);
  MEMORY[0x24BDAC7A8](v50);
  v397 = (uint64_t *)((char *)&v378 - v52);
  v53 = MEMORY[0x24BEE4B00];
  v417 = a4;
  v402 = v7;
  v404 = a2;
  if ((a6 & 1) == 0)
  {
    v54 = v7[2];
    v419[0] = MEMORY[0x24BEE4B00];
    v55 = *(void **)(v54 + 16);
    v56 = swift_allocObject();
    *(_DWORD *)(v56 + 16) = 256;
    *(_BYTE *)(v56 + 20) = 1;
    *(_QWORD *)(v56 + 24) = 0;
    *(_BYTE *)(v56 + 32) = 1;
    *(_QWORD *)(v56 + 40) = v54;
    *(_QWORD *)(v56 + 48) = v419;
    v57 = swift_allocObject();
    *(_QWORD *)(v57 + 16) = sub_249F98E74;
    *(_QWORD *)(v57 + 24) = v56;
    aBlock[4] = sub_249FC76E4;
    aBlock[5] = v57;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_249F87210;
    aBlock[3] = &block_descriptor_7;
    v58 = _Block_copy(aBlock);
    v59 = v55;
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v59, sel_performBlockAndWait_, v58);

    _Block_release(v58);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
    {
LABEL_323:
      __break(1u);
      goto LABEL_324;
    }
    v61 = v419[0];
    swift_release();
    v53 = v61;
    a4 = v417;
    v7 = v402;
    a2 = v404;
  }
  v415 = a3;
  v416 = v53;
  v406 = v25;
  isEscapingClosureAtFileLocation = a4 + 64;
  v62 = 1 << *(_BYTE *)(a4 + 32);
  if (v62 < 64)
    v63 = ~(-1 << v62);
  else
    v63 = -1;
  v64 = v63 & *(_QWORD *)(a4 + 64);
  v65 = (unint64_t)(v62 + 63) >> 6;
  v66 = *(float *)&a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v67 = 0;
  if (v64)
    goto LABEL_12;
LABEL_13:
  v71 = v67 + 1;
  if (__OFADD__(v67, 1))
    goto LABEL_309;
  if (v71 >= v65)
    goto LABEL_43;
  v72 = *(_QWORD *)(isEscapingClosureAtFileLocation + 8 * v71);
  ++v67;
  if (v72)
    goto LABEL_26;
  v67 = v71 + 1;
  if (v71 + 1 < v65)
  {
    v72 = *(_QWORD *)(isEscapingClosureAtFileLocation + 8 * v67);
    if (v72)
      goto LABEL_26;
    v67 = v71 + 2;
    if (v71 + 2 < v65)
    {
      v72 = *(_QWORD *)(isEscapingClosureAtFileLocation + 8 * v67);
      if (!v72)
      {
        v73 = v71 + 3;
        if (v73 < v65)
        {
          v72 = *(_QWORD *)(isEscapingClosureAtFileLocation + 8 * v73);
          if (v72)
          {
            v67 = v73;
            goto LABEL_26;
          }
          while (1)
          {
            v67 = v73 + 1;
            if (__OFADD__(v73, 1))
              goto LABEL_316;
            if (v67 >= v65)
              goto LABEL_43;
            v72 = *(_QWORD *)(isEscapingClosureAtFileLocation + 8 * v67);
            ++v73;
            if (v72)
              goto LABEL_26;
          }
        }
        goto LABEL_43;
      }
LABEL_26:
      v64 = (v72 - 1) & v72;
      for (i = __clz(__rbit64(v72)) + (v67 << 6); ; i = v69 | (v67 << 6))
      {
        v74 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * i);
        v75 = *(float *)(*(_QWORD *)(a4 + 56) + 4 * i);
        v68 = v66;
        if ((a2 & 0x100000000) == 0)
          goto LABEL_10;
        v76 = (uint64_t *)(v7[2] + OBJC_IVAR____TtC19VisualUnderstanding12VUIndexStore_parameters);
        swift_beginAccess();
        v77 = *v76;
        if (*(_QWORD *)(v77 + 16))
        {
          v78 = sub_249F8B0C4(v407);
          if ((v79 & 1) != 0)
            break;
        }
        if (v75 >= 0.0)
        {
LABEL_11:
          if (!v64)
            goto LABEL_13;
          goto LABEL_12;
        }
LABEL_31:
        v80 = v415;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v419[0] = v80;
        v83 = sub_249F8B27C(v74);
        v84 = *(_QWORD *)(v80 + 16);
        v85 = (v82 & 1) == 0;
        v86 = v84 + v85;
        if (__OFADD__(v84, v85))
          goto LABEL_319;
        v87 = v82;
        if (*(_QWORD *)(v80 + 24) >= v86)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_249FC20E0();
        }
        else
        {
          sub_249FBA388(v86, isUniquelyReferenced_nonNull_native);
          v88 = sub_249F8B27C(v74);
          if ((v87 & 1) != (v89 & 1))
            goto LABEL_334;
          v83 = v88;
        }
        a2 = v404;
        v90 = (_QWORD *)v419[0];
        v415 = v419[0];
        if ((v87 & 1) != 0)
        {
          *(_QWORD *)(*(_QWORD *)(v419[0] + 56) + 8 * v83) = -1;
        }
        else
        {
          *(_QWORD *)(v419[0] + 8 * (v83 >> 6) + 64) |= 1 << v83;
          v91 = 8 * v83;
          *(_QWORD *)(v90[6] + v91) = v74;
          *(_QWORD *)(v90[7] + v91) = -1;
          v92 = v90[2];
          v93 = __OFADD__(v92, 1);
          v94 = v92 + 1;
          if (v93)
            goto LABEL_322;
          v90[2] = v94;
        }
        swift_bridgeObjectRelease();
        a4 = v417;
        v7 = v402;
        if (!v64)
          goto LABEL_13;
LABEL_12:
        v69 = __clz(__rbit64(v64));
        v64 &= v64 - 1;
      }
      v68 = *(float *)(*(_QWORD *)(*(_QWORD *)(v77 + 56) + 8 * v78) + 56);
LABEL_10:
      if (v75 >= v68)
        goto LABEL_11;
      goto LABEL_31;
    }
  }
LABEL_43:
  swift_release();
  v95 = MEMORY[0x24BEE4B00];
  isEscapingClosureAtFileLocation = v400;
  if ((v400 & 1) != 0)
  {
    v381 = 0;
    v96 = MEMORY[0x24BEE4B00];
    v97 = v415;
  }
  else
  {
    v97 = v415;
    v98 = swift_bridgeObjectRetain();
    v99 = sub_24A007244(v98);
    swift_bridgeObjectRelease();
    if (sub_249FA4940(v99))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFAC0);
      v100 = sub_24A01F3FC();
    }
    else
    {
      v100 = MEMORY[0x24BEE4B00];
    }
    v419[0] = v100;
    v101 = (_QWORD *)swift_bridgeObjectRetain();
    sub_24A012FD8(v101, 1, v419);
    v381 = 0;
    swift_bridgeObjectRelease();
    v96 = v419[0];
  }
  v427 = v95;
  v102 = MEMORY[0x24BEE4B08];
  v425 = MEMORY[0x24BEE4B08];
  v426 = MEMORY[0x24BEE4B08];
  v103 = swift_allocObject();
  v404 = v103;
  *(_QWORD *)(v103 + 16) = v102;
  v104 = (uint64_t *)(v103 + 16);
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v105 = sub_249FD8AF8(v407);
    v106 = sub_249FCA5D0(v105);
    v402 = v104;
    v398 = v105;
    v400 = (void (*)(_QWORD))v106;
    if (v106)
    {
      if (v106 < 1)
      {
LABEL_324:
        __break(1u);
LABEL_325:
        __break(1u);
LABEL_326:
        __break(1u);
LABEL_327:
        __break(1u);
LABEL_328:
        __break(1u);
LABEL_329:
        __break(1u);
LABEL_330:
        __break(1u);
LABEL_331:
        __break(1u);
LABEL_332:
        __break(1u);
LABEL_333:
        __break(1u);
LABEL_334:
        sub_24A01F48C();
        __break(1u);
LABEL_335:
        sub_249F990A0(isEscapingClosureAtFileLocation, &qword_2578FF778);
        swift_bridgeObjectRelease();
        swift_release();
        __break(1u);
LABEL_336:
        swift_release();
        __break(1u);
        result = swift_unexpectedError();
        __break(1u);
        return result;
      }
      v107 = (uint64_t)v379;
      v393 = (char *)v397 + *(int *)(v380 + 48);
      v108 = *(int *)(v412 + 48);
      v394 = (char *)*(int *)(v412 + 64);
      v395 = v108;
      v109 = v105 + ((*(unsigned __int8 *)(v408 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v408 + 80));
      v392 = *(_QWORD *)(v408 + 72);
      v110 = v106;
      do
      {
        v111 = v397;
        sub_249F9905C(v109, (uint64_t)v397, &qword_2578FF778);
        v112 = v393[v395];
        v113 = *v111;
        v114 = v394[(_QWORD)v393];
        v115 = *(int *)(v412 + 48);
        v116 = *(int *)(v412 + 64);
        (*(void (**)(uint64_t))(v413 + 32))(v107);
        *(_BYTE *)(v107 + v115) = v112;
        *(_BYTE *)(v107 + v116) = v114;
        if (*(_QWORD *)(v96 + 16))
        {
          sub_249F8B27C(v113);
          if ((v117 & 1) != 0)
          {
            swift_retain();
            sub_24A00DB2C(v107, v112, v114);
            swift_release();
          }
        }
        sub_249F990A0(v107, (uint64_t *)&unk_2578FFB78);
        v109 += v392;
        --v110;
      }
      while (v110);
    }
    v118 = sub_249FB4D9C();
    v419[0] = v118;
    v119 = v398;
    swift_bridgeObjectRetain();
    if (v400)
    {
      v120 = 0;
      v121 = v401;
      v122 = v380;
      isEscapingClosureAtFileLocation = (uint64_t)v405;
      v123 = (uint64_t)v390;
      do
      {
        sub_249FB4F2C(v120, 1, v119);
        v124 = (void (*)(_QWORD))(v120 + 1);
        if (__OFADD__(v120, 1))
          goto LABEL_312;
        sub_249F9905C(v119+ ((*(unsigned __int8 *)(v408 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v408 + 80))+ *(_QWORD *)(v408 + 72) * v120, v123, &qword_2578FF778);
        if (*(_BYTE *)(v123 + *(int *)(v122 + 48) + *(int *)(v412 + 48)))
        {
          sub_249F990A0(v123, &qword_2578FF778);
        }
        else
        {
          v125 = v391;
          sub_249F98C10(v123, v391, &qword_2578FF778);
          sub_249FB4F50();
          v126 = *(_QWORD *)(v419[0] + 16);
          sub_249FB4FB8(v126);
          v127 = v126;
          isEscapingClosureAtFileLocation = (uint64_t)v405;
          v128 = v125;
          v119 = v398;
          v129 = sub_249FB4FE0(v127, v128);
          nullsub_1(v129);
          v123 = (uint64_t)v390;
        }
        ++v120;
      }
      while (v124 != v400);
      v118 = v419[0];
    }
    else
    {
      v121 = v401;
      isEscapingClosureAtFileLocation = (uint64_t)v405;
    }
    swift_bridgeObjectRelease();
    v130 = sub_249FCA5D0(v118);
    v379 = (char *)v118;
    if (v130)
    {
      v131 = v130;
      if (v130 < 1)
        goto LABEL_325;
      v397 = (uint64_t *)((char *)v396 + *(int *)(v380 + 48));
      v132 = *(int *)(v412 + 48);
      v394 = (char *)*(int *)(v412 + 64);
      v395 = v132;
      v133 = v118 + ((*(unsigned __int8 *)(v408 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v408 + 80));
      v393 = *(char **)(v408 + 72);
      while (1)
      {
        v134 = v396;
        sub_249F9905C(v133, (uint64_t)v396, &qword_2578FF778);
        v135 = *((_BYTE *)v397 + v395);
        v136 = *v134;
        v137 = v394[(_QWORD)v397];
        v138 = *(int *)(v412 + 48);
        v139 = *(int *)(v412 + 64);
        v140 = v409;
        (*(void (**)(uint64_t))(v413 + 32))(v409);
        *(_BYTE *)(v140 + v138) = v135;
        *(_BYTE *)(v140 + v139) = v137;
        if (*(_QWORD *)(v416 + 16))
        {
          v141 = sub_249F8B27C(v136);
          if ((v142 & 1) != 0)
            break;
        }
        sub_249F990A0(v409, (uint64_t *)&unk_2578FFB78);
        v121 = v401;
        isEscapingClosureAtFileLocation = (uint64_t)v405;
LABEL_70:
        v133 += (uint64_t)v393;
        if (!--v131)
          goto LABEL_81;
      }
      v392 = *(_QWORD *)(*(_QWORD *)(v416 + 56) + 8 * v141);
      v143 = v413;
      v144 = *(int *)(v412 + 48);
      v145 = *(int *)(v412 + 64);
      v146 = (uint64_t)v387;
      v390 = *(void (**)(char *, uint64_t, uint64_t))(v413 + 16);
      v390((char *)v387, v409, v414);
      v147 = v146;
      *(_BYTE *)(v146 + v144) = v135;
      *(_BYTE *)(v146 + v145) = v137;
      if (*(_QWORD *)(v427 + 16))
      {
        v148 = v146;
        sub_249F8B20C(v146);
        v149 = *(void (**)(uint64_t, uint64_t))(v143 + 8);
        v121 = v401;
        isEscapingClosureAtFileLocation = (uint64_t)v405;
        if ((v150 & 1) != 0)
        {
          v149(v148, v414);
LABEL_80:
          sub_249F990A0(v409, (uint64_t *)&unk_2578FFB78);
          goto LABEL_70;
        }
        v151 = v414;
        v149(v148, v414);
      }
      else
      {
        v151 = v414;
        v121 = v401;
        isEscapingClosureAtFileLocation = (uint64_t)v405;
        (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v147, v414);
      }
      v152 = v392;
      if (!sub_24A007748(v392, *v402))
      {
        v153 = (uint64_t)v388;
        v390(v388, v409, v151);
        sub_249FA4214(v152, 0, v153);
        sub_249F78138(v419, v152);
        sub_249F78138(v419, v152);
      }
      goto LABEL_80;
    }
LABEL_81:
    swift_release();
    v419[0] = MEMORY[0x24BEE4B00];
    v154 = sub_249FB4D9C();
    v418[0] = v154;
    if (v400)
    {
      v155 = 0;
      v156 = v413;
      v157 = v381;
      v158 = v400;
      do
      {
        v159 = v398;
        sub_249FB4F2C(v155, 1, v398);
        v160 = (void (*)(_QWORD))(v155 + 1);
        if (__OFADD__(v155, 1))
          goto LABEL_313;
        sub_249F9905C(v159+ ((*(unsigned __int8 *)(v408 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v408 + 80))+ *(_QWORD *)(v408 + 72) * v155, isEscapingClosureAtFileLocation, &qword_2578FF778);
        if (v157)
          goto LABEL_335;
        v161 = isEscapingClosureAtFileLocation
             + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578FF778) + 48);
        if (*(_BYTE *)(v161 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578FFB78) + 48)) == 2)
        {
          v162 = v391;
          sub_249F98C10(isEscapingClosureAtFileLocation, v391, &qword_2578FF778);
          sub_249FB4F50();
          v163 = *(_QWORD *)(v418[0] + 16);
          sub_249FB4FB8(v163);
          v164 = v163;
          isEscapingClosureAtFileLocation = (uint64_t)v405;
          v165 = v162;
          v158 = v400;
          v166 = sub_249FB4FE0(v164, v165);
          nullsub_1(v166);
        }
        else
        {
          sub_249F990A0(isEscapingClosureAtFileLocation, &qword_2578FF778);
        }
        ++v155;
      }
      while (v160 != v158);
      v167 = v418[0];
      v121 = v401;
    }
    else
    {
      v167 = v154;
      v156 = v413;
      v157 = v381;
    }
    v381 = v157;
    swift_bridgeObjectRelease();
    v168 = sub_249FCA5D0(v167);
    v169 = (uint64_t)v386;
    v395 = v168;
    if (v168)
    {
      v170 = 0;
      v394 = (char *)v121 + *(int *)(v380 + 48);
      v171 = (char *)*(int *)(v412 + 48);
      v392 = *(int *)(v412 + 64);
      v393 = v171;
      v172 = *(unsigned __int8 *)(v408 + 80);
      v380 = v167;
      v173 = v167 + ((v172 + 32) & ~v172);
      v391 = *(_QWORD *)(v408 + 72);
      while (1)
      {
        sub_249F9905C(v173, (uint64_t)v121, &qword_2578FF778);
        if (__OFADD__(v170, 1))
          goto LABEL_314;
        v405 = (uint64_t *)v173;
        *(_QWORD *)&v408 = v170;
        v409 = v170 + 1;
        v174 = v393[(_QWORD)v394];
        v175 = *v121;
        v176 = v394[v392];
        isEscapingClosureAtFileLocation = *(int *)(v412 + 48);
        v177 = *(int *)(v412 + 64);
        v400 = *(void (**)(_QWORD))(v156 + 32);
        v400(v169);
        *(_BYTE *)(v169 + isEscapingClosureAtFileLocation) = v174;
        *(_BYTE *)(v169 + v177) = v176;
        v178 = sub_249FA369C(v175, v416);
        if ((v179 & 1) != 0)
          goto LABEL_94;
        v180 = v385;
        isEscapingClosureAtFileLocation = v178;
        sub_249FA3724(v178, v419[0], v385);
        v181 = v169;
        v182 = v414;
        v387 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v156 + 48);
        LODWORD(v390) = v387(v180, 1, v414);
        sub_249F990A0(v180, &qword_2544CAD70);
        v183 = *(int *)(v412 + 48);
        v184 = *(int *)(v412 + 64);
        v185 = *(uint64_t **)(v156 + 16);
        v186 = (uint64_t)v384;
        v396 = v185;
        ((void (*)(char *, uint64_t, uint64_t))v185)(v384, v181, v182);
        LODWORD(v398) = v174;
        *(_BYTE *)(v186 + v183) = v174;
        *(_BYTE *)(v186 + v184) = v176;
        LODWORD(v397) = v176;
        if ((_DWORD)v390 == 1)
          break;
        v195 = v382;
        v390 = (void (*)(char *, uint64_t, uint64_t))isEscapingClosureAtFileLocation;
        sub_249FA3724(isEscapingClosureAtFileLocation, v419[0], v382);
        if (v387(v195, 1, v182) == 1)
          goto LABEL_332;
        v196 = sub_24A01EB74();
        v198 = v197;
        v199 = *(void (**)(uint64_t, uint64_t))(v413 + 8);
        v199(v195, v182);
        v200 = *(int *)(v412 + 48);
        v201 = *(int *)(v412 + 64);
        v202 = v388;
        ((void (*)(char *, uint64_t, uint64_t))v396)(v388, v186, v182);
        v202[v200] = v398;
        v202[v201] = (char)v397;
        isEscapingClosureAtFileLocation = sub_24A01EB74();
        v204 = v203;
        v199((uint64_t)v202, v182);
        if (isEscapingClosureAtFileLocation != v196 || v204 != v198)
        {
          isEscapingClosureAtFileLocation = sub_24A01F45C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_249F990A0(v186, (uint64_t *)&unk_2578FFB78);
          v156 = v413;
          v169 = (uint64_t)v386;
          v121 = v401;
          v188 = v398;
          v187 = (uint64_t)v390;
          if ((isEscapingClosureAtFileLocation & 1) == 0)
            goto LABEL_94;
          goto LABEL_99;
        }
        swift_bridgeObjectRelease_n();
        sub_249F990A0(v186, (uint64_t *)&unk_2578FFB78);
        v156 = v413;
        v169 = (uint64_t)v386;
        v121 = v401;
LABEL_94:
        sub_249F990A0(v169, (uint64_t *)&unk_2578FFB78);
        v170 = v408 + 1;
        v173 = (uint64_t)v405 + v391;
        if (v409 == v395)
        {
          swift_release();
          v205 = v419[0];
          goto LABEL_107;
        }
      }
      sub_249F990A0(v186, (uint64_t *)&unk_2578FFB78);
      v156 = v413;
      v169 = (uint64_t)v386;
      v187 = isEscapingClosureAtFileLocation;
      v188 = v398;
LABEL_99:
      v189 = v188;
      v190 = *(int *)(v412 + 48);
      v191 = *(int *)(v412 + 64);
      v192 = v388;
      isEscapingClosureAtFileLocation = v414;
      ((void (*)(char *, uint64_t, uint64_t))v396)(v388, v169, v414);
      v192[v190] = v189;
      v192[v191] = (char)v397;
      v193 = (uint64_t)v383;
      v194 = v192;
      v121 = v401;
      ((void (*)(char *, char *, uint64_t))v400)(v383, v194, isEscapingClosureAtFileLocation);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v156 + 56))(v193, 0, 1, isEscapingClosureAtFileLocation);
      sub_249FA4338(v193, v187);
      goto LABEL_94;
    }
    swift_release();
    v205 = MEMORY[0x24BEE4B00];
LABEL_107:
    v206 = *(_QWORD *)(v205 + 64);
    v409 = v205 + 64;
    v207 = 1 << *(_BYTE *)(v205 + 32);
    v208 = -1;
    if (v207 < 64)
      v208 = ~(-1 << v207);
    isEscapingClosureAtFileLocation = v208 & v206;
    v412 = (unint64_t)(v207 + 63) >> 6;
    *(_QWORD *)&v408 = v412 - 1;
    swift_bridgeObjectRetain();
    v209 = 0;
    if (!isEscapingClosureAtFileLocation)
      goto LABEL_112;
LABEL_110:
    v210 = __clz(__rbit64(isEscapingClosureAtFileLocation));
    isEscapingClosureAtFileLocation &= isEscapingClosureAtFileLocation - 1;
    v211 = v210 | (v209 << 6);
    v212 = v411;
LABEL_111:
    v213 = *(_QWORD *)(v205 + 56);
    *v212 = *(_QWORD *)(*(_QWORD *)(v205 + 48) + 8 * v211);
    v214 = v413;
    v215 = v213 + *(_QWORD *)(v413 + 72) * v211;
    v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF8E0);
    v217 = *(void (**)(char *, uint64_t, uint64_t))(v214 + 16);
    v212 = v411;
    v217(&v411[*(int *)(v216 + 48)], v215, v414);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v216 - 8) + 56))(v212, 0, 1, v216);
    while (1)
    {
      v221 = (uint64_t)v212;
      v222 = v399;
      sub_249F98C10(v221, (uint64_t)v399, &qword_2578FF8D0);
      v223 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF8E0);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v223 - 8) + 48))(v222, 1, v223) == 1)
        break;
      v224 = *v222;
      v225 = (char *)v222 + *(int *)(v223 + 48);
      v226 = (uint64_t)v403;
      (*(void (**)(char *, char *, uint64_t))(v413 + 32))(v403, v225, v414);
      sub_249FA4214(v224, 0, v226);
      sub_249F78138(v418, v224);
      if (isEscapingClosureAtFileLocation)
        goto LABEL_110;
LABEL_112:
      v218 = v209 + 1;
      if (__OFADD__(v209, 1))
        goto LABEL_315;
      v212 = v411;
      if (v218 < v412)
      {
        v219 = *(_QWORD *)(v409 + 8 * v218);
        if (v219)
          goto LABEL_115;
        v209 += 2;
        if (v218 + 1 >= v412)
        {
          v209 = v218;
        }
        else
        {
          v219 = *(_QWORD *)(v409 + 8 * v209);
          if (v219)
          {
            ++v218;
            goto LABEL_115;
          }
          if (v218 + 2 < v412)
          {
            v219 = *(_QWORD *)(v409 + 8 * (v218 + 2));
            if (v219)
            {
              v218 += 2;
              goto LABEL_115;
            }
            v227 = v218 + 3;
            if (v218 + 3 < v412)
            {
              v219 = *(_QWORD *)(v409 + 8 * v227);
              if (!v219)
              {
                while (1)
                {
                  v218 = v227 + 1;
                  if (__OFADD__(v227, 1))
                    goto LABEL_326;
                  if (v218 >= v412)
                  {
                    v209 = v408;
                    goto LABEL_120;
                  }
                  v219 = *(_QWORD *)(v409 + 8 * v218);
                  ++v227;
                  if (v219)
                    goto LABEL_115;
                }
              }
              v218 += 3;
LABEL_115:
              isEscapingClosureAtFileLocation = (v219 - 1) & v219;
              v211 = __clz(__rbit64(v219)) + (v218 << 6);
              v209 = v218;
              goto LABEL_111;
            }
            v209 = v218 + 2;
          }
        }
      }
LABEL_120:
      v220 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF8E0);
      (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v220 - 8) + 56))(v212, 1, 1, v220);
      isEscapingClosureAtFileLocation = 0;
    }
    swift_release();
    swift_bridgeObjectRelease();
    v97 = v415;
  }
  v424 = sub_24A01EE08();
  v228 = swift_bridgeObjectRetain();
  v229 = sub_249FA49A4(v228);
  v230 = swift_bridgeObjectRetain();
  v231 = sub_249FA4B18(v230);
  if (*(_QWORD *)(v231 + 16) <= *(_QWORD *)(v229 + 16) >> 3)
  {
    v419[0] = v229;
    sub_249FF4D14(v231);
  }
  else
  {
    sub_249FF5120(v231, v229);
  }
  swift_bridgeObjectRelease();
  v232 = swift_bridgeObjectRetain();
  v233 = sub_249FB50B4(v232);
  swift_bridgeObjectRelease();
  v419[0] = (uint64_t)v233;
  v234 = v381;
  sub_249FA0130(v419);
  v411 = v234;
  if (v234)
    goto LABEL_336;
  swift_bridgeObjectRelease();
  v412 = v419[0];
  v409 = sub_249FCA5D0(v419[0]);
  if (v409)
  {
    v235 = 0;
    *(_QWORD *)&v408 = v412 + 32;
    while (1)
    {
      sub_249FB4F2C(v235, 1, v412);
      isEscapingClosureAtFileLocation = v235 + 1;
      if (__OFADD__(v235, 1))
        goto LABEL_308;
      v239 = *(_QWORD *)(v408 + 8 * v235);
      if (v239 != -1)
        break;
      v236 = -1;
      v242 = -1;
LABEL_144:
      swift_bridgeObjectRelease();
      v237 = v424;
      v238 = swift_isUniquelyReferenced_nonNull_native();
      v419[0] = v237;
      sub_249FBFA34(v242, v236, v238);
      v424 = v419[0];
      swift_bridgeObjectRelease();
      v235 = isEscapingClosureAtFileLocation;
      v97 = v415;
      if (isEscapingClosureAtFileLocation == v409)
        goto LABEL_177;
    }
    v240 = -1;
    v241 = MEMORY[0x24BEE4B08];
    v242 = -1;
    while (1)
    {
      v236 = v239;
      if (*(_QWORD *)(v241 + 16))
      {
        v243 = sub_24A01F4E0();
        v244 = -1 << *(_BYTE *)(v241 + 32);
        v245 = v243 & ~v244;
        v246 = v241 + 56;
        if (((*(_QWORD *)(v241 + 56 + ((v245 >> 3) & 0xFFFFFFFFFFFFF8)) >> v245) & 1) != 0)
        {
          v247 = *(_QWORD *)(v241 + 48);
          if (*(_QWORD *)(v247 + 8 * v245) == v236)
            goto LABEL_143;
          v248 = ~v244;
          v249 = (v245 + 1) & v248;
          if (((*(_QWORD *)(v246 + ((v249 >> 3) & 0xFFFFFFFFFFFFF8)) >> v249) & 1) != 0)
          {
            if (*(_QWORD *)(v247 + 8 * v249) == v236)
            {
LABEL_143:
              v236 = v240;
              goto LABEL_144;
            }
            while (1)
            {
              v249 = (v249 + 1) & v248;
              if (((*(_QWORD *)(v246 + ((v249 >> 3) & 0xFFFFFFFFFFFFF8)) >> v249) & 1) == 0)
                break;
              if (*(_QWORD *)(v247 + 8 * v249) == v236)
                goto LABEL_143;
            }
          }
        }
      }
      v250 = sub_24A01F4E0();
      v251 = -1 << *(_BYTE *)(v241 + 32);
      v252 = v250 & ~v251;
      if (((*(_QWORD *)(v241 + 56 + ((v252 >> 3) & 0xFFFFFFFFFFFFF8)) >> v252) & 1) == 0)
        goto LABEL_162;
      v253 = *(_QWORD *)(v241 + 48);
      if (*(_QWORD *)(v253 + 8 * v252) != v236)
        break;
LABEL_163:
      v256 = v416;
      if (v240 != -1 && *(_QWORD *)(v96 + 16))
      {
        sub_249F8B27C(v236);
        if ((v257 & 1) != 0)
        {
          v258 = sub_249FA365C(v240, v96);
          if (!v258)
            goto LABEL_328;
          v259 = v258;
          v260 = sub_249FA37CC(v240, v417);
          if ((v260 & 0x100000000) != 0)
            goto LABEL_329;
          v261 = *(float *)&v260;
          swift_retain();
          sub_24A00DE30(v259, v261);
          swift_release();
          swift_release();
        }
        v256 = v416;
      }
      if (*(_QWORD *)(v256 + 16))
      {
        v262 = sub_249F8B27C(v236);
        if ((v263 & 1) != 0)
          v242 = *(_QWORD *)(*(_QWORD *)(v416 + 56) + 8 * v262);
      }
      v239 = sub_249FA369C(v236, v415);
      if ((v264 & 1) == 0)
      {
        v240 = v236;
        if (v239 != -1)
          continue;
      }
      goto LABEL_144;
    }
    v254 = ~v251;
    while (1)
    {
      v252 = (v252 + 1) & v254;
      if (((*(_QWORD *)(v241 + 56 + ((v252 >> 3) & 0xFFFFFFFFFFFFF8)) >> v252) & 1) == 0)
        break;
      if (*(_QWORD *)(v253 + 8 * v252) == v236)
        goto LABEL_163;
    }
LABEL_162:
    v255 = swift_isUniquelyReferenced_nonNull_native();
    v419[0] = v241;
    sub_24A010A14(v236, v252, v255);
    v241 = v419[0];
    swift_bridgeObjectRelease();
    goto LABEL_163;
  }
LABEL_177:
  swift_release();
  v265 = *(_QWORD *)(v97 + 64);
  v405 = (uint64_t *)(v97 + 64);
  v266 = 1 << *(_BYTE *)(v97 + 32);
  v267 = -1;
  if (v266 < 64)
    v267 = ~(-1 << v266);
  v268 = v267 & v265;
  v412 = (unint64_t)(v266 + 63) >> 6;
  swift_bridgeObjectRetain();
  isEscapingClosureAtFileLocation = 0;
  v269 = MEMORY[0x24BEE4B00];
  v408 = xmmword_24A0208B0;
  while (1)
  {
    while (1)
    {
      if (v268)
      {
        v270 = __clz(__rbit64(v268));
        v268 &= v268 - 1;
        v271 = v270 | (isEscapingClosureAtFileLocation << 6);
      }
      else
      {
        v272 = isEscapingClosureAtFileLocation + 1;
        if (__OFADD__(isEscapingClosureAtFileLocation, 1))
          goto LABEL_310;
        v268 = v413;
        if (v272 >= v412)
          goto LABEL_223;
        v273 = v405[v272];
        ++isEscapingClosureAtFileLocation;
        if (!v273)
        {
          isEscapingClosureAtFileLocation = v272 + 1;
          if (v272 + 1 >= v412)
            goto LABEL_223;
          v273 = v405[isEscapingClosureAtFileLocation];
          if (!v273)
          {
            isEscapingClosureAtFileLocation = v272 + 2;
            if (v272 + 2 >= v412)
              goto LABEL_223;
            v273 = v405[isEscapingClosureAtFileLocation];
            if (!v273)
            {
              v274 = v272 + 3;
              if (v274 >= v412)
                goto LABEL_223;
              v273 = v405[v274];
              if (!v273)
              {
                while (1)
                {
                  isEscapingClosureAtFileLocation = v274 + 1;
                  if (__OFADD__(v274, 1))
                    goto LABEL_317;
                  if (isEscapingClosureAtFileLocation >= v412)
                    goto LABEL_223;
                  v273 = v405[isEscapingClosureAtFileLocation];
                  ++v274;
                  if (v273)
                    goto LABEL_197;
                }
              }
              isEscapingClosureAtFileLocation = v274;
            }
          }
        }
LABEL_197:
        v268 = (v273 - 1) & v273;
        v271 = __clz(__rbit64(v273)) + (isEscapingClosureAtFileLocation << 6);
      }
      v275 = 8 * v271;
      v276 = *(_QWORD *)(*(_QWORD *)(v97 + 48) + v275);
      v277 = *(_QWORD *)(*(_QWORD *)(v97 + 56) + v275);
      if (*(_QWORD *)(v269 + 16))
      {
        sub_249F8B27C(v277);
        if ((v278 & 1) != 0)
          break;
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC38);
      v288 = swift_allocObject();
      *(_OWORD *)(v288 + 16) = v408;
      *(_QWORD *)(v288 + 32) = v276;
      v289 = v269;
      v290 = swift_isUniquelyReferenced_nonNull_native();
      v419[0] = v289;
      v292 = sub_249F8B27C(v277);
      v293 = *(_QWORD *)(v289 + 16);
      v294 = (v291 & 1) == 0;
      v295 = v293 + v294;
      if (__OFADD__(v293, v294))
      {
        __break(1u);
LABEL_308:
        __break(1u);
LABEL_309:
        __break(1u);
LABEL_310:
        __break(1u);
LABEL_311:
        __break(1u);
LABEL_312:
        __break(1u);
LABEL_313:
        __break(1u);
LABEL_314:
        __break(1u);
LABEL_315:
        __break(1u);
LABEL_316:
        __break(1u);
LABEL_317:
        __break(1u);
LABEL_318:
        __break(1u);
LABEL_319:
        __break(1u);
LABEL_320:
        __break(1u);
LABEL_321:
        __break(1u);
LABEL_322:
        __break(1u);
        goto LABEL_323;
      }
      v296 = v291;
      if (*(_QWORD *)(v289 + 24) >= v295)
      {
        if ((v290 & 1) != 0)
        {
          v269 = v419[0];
          if ((v291 & 1) == 0)
            goto LABEL_180;
        }
        else
        {
          sub_249FC1AF0();
          v269 = v419[0];
          if ((v296 & 1) == 0)
            goto LABEL_180;
        }
      }
      else
      {
        sub_249FB99FC(v295, v290);
        v297 = sub_249F8B27C(v277);
        if ((v296 & 1) != (v298 & 1))
          goto LABEL_334;
        v292 = v297;
        v269 = v419[0];
        if ((v296 & 1) == 0)
        {
LABEL_180:
          sub_249FC0A04(v292, v277, v288, (_QWORD *)v269);
          goto LABEL_181;
        }
      }
      v299 = *(_QWORD *)(v269 + 56);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v299 + 8 * v292) = v288;
LABEL_181:
      swift_bridgeObjectRelease();
      v97 = v415;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC38);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = v408;
    *(_QWORD *)(inited + 32) = v276;
    v280 = v269;
    v269 = swift_isUniquelyReferenced_nonNull_native();
    v419[0] = v280;
    v282 = sub_249F8B27C(v277);
    v283 = *(_QWORD *)(v280 + 16);
    v284 = (v281 & 1) == 0;
    v285 = v283 + v284;
    if (__OFADD__(v283, v284))
      goto LABEL_311;
    v97 = v281;
    if (*(_QWORD *)(v280 + 24) < v285)
      break;
    if ((v269 & 1) != 0)
    {
      if ((v281 & 1) == 0)
        goto LABEL_222;
    }
    else
    {
      sub_249FC1AF0();
      if ((v97 & 1) == 0)
        goto LABEL_222;
    }
LABEL_215:
    v269 = v419[0];
    v418[0] = *(_QWORD *)(*(_QWORD *)(v419[0] + 56) + 8 * v282);
    sub_249FA5204((uint64_t)v418, inited);
    swift_bridgeObjectRelease();
    if (v418[0])
      *(_QWORD *)(*(_QWORD *)(v269 + 56) + 8 * v282) = v418[0];
    else
      sub_249FBE41C(v282, v269);
    v97 = v415;
  }
  sub_249FB99FC(v285, v269);
  v286 = sub_249F8B27C(v277);
  if ((v97 & 1) != (v287 & 1))
    goto LABEL_334;
  v282 = v286;
  if ((v97 & 1) != 0)
    goto LABEL_215;
LABEL_222:
  __break(1u);
LABEL_223:
  swift_release();
  v300 = sub_249FA3824(-1, v269);
  if (!v300)
    v300 = sub_249FB4E0C(0);
  v301 = (void (*)(_QWORD))v300;
  v401 = (uint64_t *)sub_249FCA5D0(v300);
  if (!v401)
    goto LABEL_306;
  v302 = 0;
  v402 = (uint64_t *)((char *)v301 + 32);
  v409 = v269;
  v400 = v301;
  while (1)
  {
    sub_249FB4F2C(v302, 1, v301);
    if (__OFADD__(v302, 1))
      goto LABEL_318;
    v405 = (uint64_t *)(v302 + 1);
    v303 = v402[(_QWORD)v302];
    v422 = 0;
    v423 = 1;
    v304 = v424;
    v305 = sub_249FA369C(v303, v424);
    if ((v306 & 1) != 0 || v305 != -1)
    {
      v307 = v426;
      v308 = sub_249FA369C(v303, v304);
      if ((v309 & 1) != 0)
        goto LABEL_333;
      if (!sub_24A007748(v308, v307))
      {
        v422 = sub_249FA369C(v303, v304);
        v423 = v310 & 1;
      }
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAC38);
    v311 = swift_initStackObject();
    *(_OWORD *)(v311 + 16) = v408;
    *(_QWORD *)(v311 + 32) = v303;
    v421 = v311;
    if (sub_249FCA5D0(v311) >= 1)
      break;
LABEL_227:
    swift_bridgeObjectRelease();
    v302 = (char *)v405;
    v301 = v400;
    if (v405 == v401)
      goto LABEL_306;
  }
  v312 = 0;
  while (2)
  {
    v412 = v312;
    v314 = sub_249FA5234(v312, v311);
    v315 = sub_249FA369C(v314, v97);
    if ((v316 & 1) == 0 && v315 != -1)
    {
      v422 = sub_249FA369C(v315, v424);
      v423 = v317 & 1;
    }
    if (sub_249FA365C(v314, v96))
    {
      v318 = sub_24A00DA90();
      swift_release();
      v319 = v411;
      isEscapingClosureAtFileLocation = sub_24A0074F4(v318, &v427);
      swift_bridgeObjectRelease();
      v320 = sub_24A007DC4(isEscapingClosureAtFileLocation, &v422);
      v322 = v321;
      v411 = v319;
      swift_bridgeObjectRelease();
      if ((v322 & 0x100) == 0)
      {
        v422 = 0;
        v423 = 1;
        v323 = sub_249FA369C(v314, v416);
        if ((v324 & 1) == 0 && ((v322 & 1) != 0 || v323 != v320))
        {
          v422 = v323;
          v423 = 0;
        }
      }
    }
    v325 = sub_249FA365C(v314, v96);
    if (!v325)
    {
LABEL_250:
      v329 = sub_249FA369C(v314, v97);
      if ((v330 & 1) == 0)
      {
        v331 = v329;
        v332 = sub_249FA369C(v314, v97);
        if ((v333 & 1) != 0 || v332 != -1)
        {
          v334 = sub_249FA365C(v331, v96);
          if (v334)
          {
            v335 = v334
                 + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTag;
            swift_beginAccess();
            v336 = v335;
            v337 = v389;
            sub_249F9905C(v336, v389, &qword_2544CAD70);
            swift_release();
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v268 + 48))(v337, 1, v414) != 1)
            {
              sub_249F990A0(v337, &qword_2544CAD70);
              v338 = sub_249FA369C(v314, v416);
              if ((v339 & 1) == 0)
              {
                v340 = v338;
                if (!sub_24A007748(v338, v426))
                  goto LABEL_280;
              }
              goto LABEL_278;
            }
          }
          else
          {
            v337 = v389;
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v268 + 56))(v389, 1, 1, v414);
          }
          sub_249F990A0(v337, &qword_2544CAD70);
        }
      }
      if (v423 != 1)
      {
        v340 = v422;
        goto LABEL_280;
      }
LABEL_278:
      v340 = sub_24A00D7D8(v404, v407);
LABEL_280:
      v422 = v340;
      v423 = 0;
      sub_249FA4148(v340, 0, v314);
      goto LABEL_281;
    }
    v326 = v325;
    v327 = v325
         + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTag;
    swift_beginAccess();
    isEscapingClosureAtFileLocation = (uint64_t)v406;
    sub_249F9905C(v327, (uint64_t)v406, &qword_2544CAD70);
    v328 = v414;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v268 + 48))(isEscapingClosureAtFileLocation, 1, v414) == 1)
    {
      swift_release();
      sub_249F990A0(isEscapingClosureAtFileLocation, &qword_2544CAD70);
      goto LABEL_250;
    }
    v341 = v410;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v268 + 32))(v410, isEscapingClosureAtFileLocation, v328);
    v342 = (uint64_t *)(v326
                     + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_localRejectionTags);
    swift_beginAccess();
    v343 = *v342;
    swift_bridgeObjectRetain();
    LOBYTE(v341) = sub_249FA3AA0(v341, v343);
    swift_bridgeObjectRelease();
    if ((v341 & 1) != 0)
    {
      v344 = sub_249FA369C(v314, v416);
      if ((v345 & 1) != 0 || (v346 = v344, v347 = sub_249FA36E0(v410, v427), (v348 & 1) == 0) && v346 == v347)
        v349 = sub_24A00D7D8(v404, v407);
      else
        v349 = v346;
      sub_249FA4148(v349, 0, v314);
    }
    else
    {
      v350 = v422;
      v351 = v423;
      sub_249FA369C(v314, v97);
      if ((v352 & 1) == 0)
      {
        v353 = sub_249FA369C(v314, v97);
        if ((v354 & 1) != 0)
          goto LABEL_331;
        if (sub_249FA365C(v353, v96))
        {
          isEscapingClosureAtFileLocation = sub_24A00DA90();
          swift_release();
          v355 = sub_249FA3AA0(v410, isEscapingClosureAtFileLocation);
          swift_bridgeObjectRelease();
          if (v355)
            v350 = 0;
          v351 |= v355;
        }
      }
      v356 = v427;
      sub_249FA36E0(v410, v427);
      if ((v357 & 1) != 0 && (v351 & 1) == 0)
      {
        if (*(_BYTE *)(v326
                      + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed) == 1)
        {
          v351 = sub_24A007748(v350, v425);
          if ((v351 & 1) != 0)
            v350 = 0;
        }
        else
        {
          v351 = 0;
        }
      }
      v369 = sub_249FA36E0(v410, v356);
      if ((v370 & 1) != 0)
      {
        v369 = v350;
        if ((v351 & 1) != 0)
          v369 = sub_24A00D7D8(v404, v407);
      }
      sub_249FA4148(v369, 0, v314);
      v371 = (uint64_t)v403;
      (*(void (**)(char *, uint64_t, uint64_t))(v268 + 16))(v403, v410, v414);
      v372 = sub_249FA369C(v314, v424);
      sub_249FA4214(v372, v373 & 1, v371);
    }
    if (*(_BYTE *)(v326
                  + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed) == 1)
    {
      v374 = sub_249FA369C(v314, v424);
      if ((v375 & 1) != 0)
        goto LABEL_330;
      sub_249F78138(v420, v374);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v268 + 8))(v410, v414);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v268 + 8))(v410, v414);
      swift_release();
    }
LABEL_281:
    v358 = sub_249FA369C(v314, v424);
    if ((v359 & 1) != 0)
      goto LABEL_327;
    sub_249F78138(v420, v358);
    v360 = sub_249FA3824(v314, v409);
    if (!v360)
      v360 = sub_249FB4E0C(0);
    v361 = v360;
    v362 = sub_249FCA5D0(v360);
    if (!v362)
    {
LABEL_237:
      sub_249FA5204((uint64_t)&v421, v361);
      swift_bridgeObjectRelease();
      v312 = v412 + 1;
      v311 = v421;
      v313 = sub_249FCA5D0(v421);
      v97 = v415;
      if (v312 >= v313)
        goto LABEL_227;
      continue;
    }
    break;
  }
  v363 = v362;
  swift_bridgeObjectRetain();
  v364 = 0;
  while (1)
  {
    v365 = v364 + 1;
    if (__OFADD__(v364, 1))
      break;
    isEscapingClosureAtFileLocation = *(_QWORD *)(v361 + 8 * v364 + 32);
    if (sub_249FA365C(isEscapingClosureAtFileLocation, v96))
    {
      v366 = sub_249FA365C(v314, v96);
      if (!v366)
        goto LABEL_320;
      v367 = v366;
      v368 = sub_249FA37CC(isEscapingClosureAtFileLocation, v417);
      if ((v368 & 0x100000000) != 0)
        goto LABEL_321;
      sub_24A00DE30(v367, *(float *)&v368);
      swift_release();
      swift_release();
    }
    ++v364;
    if (v365 == v363)
    {
      swift_bridgeObjectRelease();
      v268 = v413;
      goto LABEL_237;
    }
  }
  __break(1u);
LABEL_306:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v376 = v424;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v376;
}

uint64_t sub_24A00D7D8(uint64_t a1, unsigned __int8 a2)
{
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;

  v3 = (uint64_t *)(a1 + 16);
  result = swift_beginAccess();
LABEL_8:
  while (a2 <= 5u)
  {
    v10 = a2;
    if (a2)
    {
      if (a2 != 2)
        goto LABEL_20;
      v10 = 1;
    }
    do
    {
LABEL_16:
      v12[0] = 0;
      result = MEMORY[0x24BD07968](v12, 8);
    }
    while (((0xFFFFFFFFFFFFFFLL * v12[0]) & 0xFFFFFFFFFFFFFF00) == 0);
    v11 = qword_24A0215D8[v10] | (((v12[0] * (unsigned __int128)0xFFFFFFFFFFFFFFuLL) >> 64) + 1);
    if (v11 != -1)
    {
      v5 = *v3;
      if (!*(_QWORD *)(*v3 + 16))
        goto LABEL_19;
      result = sub_24A01F4E0();
      v6 = -1 << *(_BYTE *)(v5 + 32);
      v7 = result & ~v6;
      if (((*(_QWORD *)(v5 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
        goto LABEL_19;
      v8 = *(_QWORD *)(v5 + 48);
      if (*(_QWORD *)(v8 + 8 * v7) != v11)
      {
        v9 = ~v6;
        while (1)
        {
          v7 = (v7 + 1) & v9;
          if (((*(_QWORD *)(v5 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
            break;
          if (*(_QWORD *)(v8 + 8 * v7) == v11)
            goto LABEL_8;
        }
LABEL_19:
        swift_beginAccess();
        sub_249F8BD0C(&v13, v11);
        swift_endAccess();
        return v11;
      }
    }
  }
  if (a2 == 63)
  {
    v10 = 2;
    goto LABEL_16;
  }
  if (a2 == 6)
  {
    v10 = 3;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_24A00D974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19VisualUnderstanding16VUIndexClusterer_logger;
  v2 = sub_24A01EDA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_24A00D9DC()
{
  return type metadata accessor for VUIndexClusterer(0);
}

uint64_t type metadata accessor for VUIndexClusterer(uint64_t a1)
{
  return sub_249F93C98(a1, (uint64_t *)&unk_2544CAE40);
}

uint64_t sub_24A00D9F8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24A01EDA8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_24A00DA90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  v0 = swift_bridgeObjectRetain();
  v1 = sub_249FB5484(v0);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  sub_249FB7C68(v2);
  return v1;
}

uint64_t sub_24A00DB2C(uint64_t a1, unsigned __int8 a2, int a3)
{
  uint64_t v3;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t result;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  void (*v22)(_BYTE *, uint64_t, uint64_t);
  uint64_t *v23;
  char isUniquelyReferenced_nonNull_native;
  unint64_t *v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  unint64_t v29;
  _BYTE v30[12];
  int v31;
  uint64_t v32;

  v31 = a3;
  v6 = a2;
  v7 = sub_24A01EBA4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v30[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v30[-v12];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = &v30[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = MEMORY[0x24BDAC7A8](v15);
  v20 = &v30[-v19];
  if (!v6)
  {
LABEL_4:
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(&v30[-v19], a1, v7);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v20, 0, 1, v7);
    sub_249F98C10((uint64_t)v20, (uint64_t)v17, &qword_2544CAD70);
    v21 = v3
        + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTag;
    swift_beginAccess();
    sub_24A012A00((uint64_t)v17, v21);
    result = swift_endAccess();
    *(_DWORD *)(v3
              + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagScore) = 1065353216;
    *(_BYTE *)(v3
             + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed) = a2 == 0;
    return result;
  }
  if (v6 != 1)
  {
    if (v6 != 2)
      return result;
    goto LABEL_4;
  }
  v22 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16);
  if ((v31 & 1) != 0)
  {
    v22(v13, a1, v7);
    v23 = (uint64_t *)(v3
                    + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_rejectionTagScores);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v32 = *v23;
    *v23 = 0x8000000000000000;
    sub_249FBF668((uint64_t)v13, isUniquelyReferenced_nonNull_native, 1.0);
    *v23 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
  }
  else
  {
    v22(v11, a1, v7);
    v25 = (unint64_t *)(v3
                             + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_localRejectionTags);
    swift_beginAccess();
    v26 = *v25;
    v27 = swift_isUniquelyReferenced_nonNull_native();
    *v25 = v26;
    if ((v27 & 1) == 0)
    {
      v26 = sub_249F89B68(0, *(_QWORD *)(v26 + 16) + 1, 1, v26);
      *v25 = v26;
    }
    v29 = *(_QWORD *)(v26 + 16);
    v28 = *(_QWORD *)(v26 + 24);
    if (v29 >= v28 >> 1)
    {
      v26 = sub_249F89B68(v28 > 1, v29 + 1, 1, v26);
      *v25 = v26;
    }
    *(_QWORD *)(v26 + 16) = v29 + 1;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v8 + 32))(v26+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v29, v11, v7);
  }
  return swift_endAccess();
}

uint64_t sub_24A00DE30(unint64_t a1, float a2)
{
  uint64_t v2;
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
  uint64_t v17;
  char *v18;
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
  char *v43;
  uint64_t v44;
  float v45;
  float v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(char *, uint64_t, uint64_t);
  unint64_t v51;
  unint64_t v52;
  float v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  float v58;
  char v59;
  char v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  float v64;
  char *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  void (*v71)(char *, uint64_t);
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  float v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t);
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  float v107;
  void (*v108)(uint64_t, uint64_t, uint64_t);
  __n128 v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  float v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v125;
  char v126;
  unint64_t v127;
  uint64_t v128;
  _BOOL8 v129;
  uint64_t v130;
  char v131;
  unint64_t v132;
  char v133;
  float v134;
  _QWORD *v135;
  uint64_t v136;
  BOOL v137;
  uint64_t v138;
  char *v139;
  char v140;
  char *v141;
  uint64_t v142;
  uint64_t result;
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
  char *v154;
  void (*v155)(char *, char *, uint64_t);
  uint64_t v156;
  uint64_t v157;
  char *v158;
  char *v159;
  uint64_t (*v160)(char *, uint64_t, uint64_t);
  char *v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  char *v165;
  char *v166;
  char *v167;
  uint64_t v168;
  char *v169;
  unint64_t v170;
  uint64_t v171;
  _QWORD *v172;

  v3 = v2;
  v153 = 0;
  v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFBE0);
  MEMORY[0x24BDAC7A8](v162);
  v158 = (char *)&v150 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE28);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v165 = (char *)&v150 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v164 = (char *)&v150 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v156 = (uint64_t)&v150 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v168 = (uint64_t)&v150 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v150 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v163 = (uint64_t)&v150 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v161 = (char *)&v150 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v157 = (uint64_t)&v150 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v150 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v150 - v28;
  v30 = sub_24A01EBA4();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v167 = (char *)&v150 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v32);
  v154 = (char *)&v150 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v159 = (char *)&v150 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v169 = (char *)&v150 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v166 = (char *)&v150 - v41;
  MEMORY[0x24BDAC7A8](v40);
  v43 = (char *)&v150 - v42;
  v44 = OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagScore;
  v45 = *(float *)(a1
                 + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagScore);
  if (a2 <= 0.9999)
    v46 = a2;
  else
    v46 = 0.9999;
  v170 = a1;
  v47 = a1
      + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTag;
  swift_beginAccess();
  sub_249F9905C(v47, (uint64_t)v29, &qword_2544CAD70);
  v171 = v31;
  v160 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
  if (v160(v29, 1, v30) == 1)
  {
    sub_249F990A0((uint64_t)v29, &qword_2544CAD70);
    v48 = (uint64_t)v158;
    v49 = (uint64_t)v159;
    v50 = v160;
    v51 = v170;
    v52 = 0x2578FF000;
    goto LABEL_29;
  }
  v53 = v46 * v45;
  v155 = *(void (**)(char *, char *, uint64_t))(v171 + 32);
  v155(v43, v29, v30);
  v54 = (uint64_t *)(v2
                  + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_rejectionTagScores);
  swift_beginAccess();
  v55 = *v54;
  v52 = 0x2578FF000uLL;
  if (*(_QWORD *)(*v54 + 16))
  {
    swift_bridgeObjectRetain();
    v56 = sub_249F8B20C((uint64_t)v43);
    if ((v57 & 1) != 0)
    {
      v58 = *(float *)(*(_QWORD *)(v55 + 56) + 4 * v56);
      swift_bridgeObjectRelease();
      if (v58 < v53)
      {
        swift_beginAccess();
        sub_249FB7FD4((uint64_t)v43);
        swift_endAccess();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  if (*(_QWORD *)(*v54 + 16))
  {
    swift_bridgeObjectRetain();
    sub_249F8B20C((uint64_t)v43);
    v60 = v59;
    swift_bridgeObjectRelease();
    if ((v60 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v171 + 8))(v43, v30);
      v48 = (uint64_t)v158;
      v49 = (uint64_t)v159;
      v50 = v160;
      v51 = v170;
      goto LABEL_29;
    }
  }
  v61 = v3
      + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTag;
  swift_beginAccess();
  v152 = v61;
  sub_249F9905C(v61, (uint64_t)v27, &qword_2544CAD70);
  v62 = 1;
  v63 = v160(v27, 1, v30);
  sub_249F990A0((uint64_t)v27, &qword_2544CAD70);
  v51 = v170;
  if (v63 != 1)
  {
    if (*(_BYTE *)(v170
                  + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed) == 1)
    {
      if (*(_BYTE *)(v3
                    + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed))
        v62 = *(float *)(v3
                       + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagScore) < v53;
    }
    else if ((*(_BYTE *)(v3
                        + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed) & 1) != 0)
    {
      v62 = 0;
    }
    else
    {
      v144 = sub_24A01EB74();
      v151 = v145;
      v146 = v157;
      sub_249F9905C(v152, v157, &qword_2544CAD70);
      if (v160((char *)v146, 1, v30) == 1)
        goto LABEL_105;
      v147 = sub_24A01EB74();
      v149 = v148;
      (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v146, v30);
      if (v144 == v147 && v151 == v149)
      {
        swift_bridgeObjectRelease_n();
        v62 = 0;
      }
      else
      {
        v62 = sub_24A01F45C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v51 = v170;
    }
  }
  LODWORD(v157) = v62;
  v64 = *(float *)(v51 + v44);
  v65 = v166;
  (*(void (**)(char *, char *, uint64_t))(v171 + 16))(v166, v43, v30);
  if (v64 != 1.0)
  {
    v71 = *(void (**)(char *, uint64_t))(v171 + 8);
    v71(v65, v30);
    v72 = v158;
    v50 = v160;
    if ((v157 & 1) != 0)
      goto LABEL_23;
LABEL_27:
    v71(v43, v30);
    goto LABEL_28;
  }
  v151 = v3;
  v66 = (uint64_t *)(v3
                  + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_localRejectionTags);
  v67 = swift_beginAccess();
  v68 = *v66;
  MEMORY[0x24BDAC7A8](v67);
  *(&v150 - 2) = (uint64_t)v65;
  swift_bridgeObjectRetain();
  v69 = v153;
  v70 = sub_24A0127D8((uint64_t (*)(char *))sub_24A012A48, (_BOOL8)(&v150 - 4), v68);
  v153 = v69;
  swift_bridgeObjectRelease();
  v71 = *(void (**)(char *, uint64_t))(v171 + 8);
  v71(v65, v30);
  v72 = v158;
  v50 = v160;
  if (v70)
  {
    v3 = v151;
    v51 = v170;
    goto LABEL_27;
  }
  v3 = v151;
  v51 = v170;
  if (((v157 ^ 1) & 1) != 0)
    goto LABEL_27;
LABEL_23:
  v73 = (uint64_t)v161;
  v155(v161, v43, v30);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v171 + 56))(v73, 0, 1, v30);
  v74 = v163;
  sub_249F98C10(v73, v163, &qword_2544CAD70);
  v75 = v152;
  swift_beginAccess();
  v76 = v74;
  v52 = 0x2578FF000;
  sub_24A012A00(v76, v75);
  swift_endAccess();
  *(float *)(v3
           + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagScore) = v53;
  *(_BYTE *)(v3
           + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed) = *(_BYTE *)(v51 + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagIsConfirmed);
LABEL_28:
  v49 = (uint64_t)v159;
  v48 = (uint64_t)v72;
LABEL_29:
  v77 = v3 + *(_QWORD *)(v52 + 3568);
  swift_beginAccess();
  v163 = v77;
  sub_249F9905C(v77, (uint64_t)v18, &qword_2544CAD70);
  v78 = v50(v18, 1, v30);
  v79 = (uint64_t)v169;
  if (v78 == 1)
  {
    sub_249F990A0((uint64_t)v18, &qword_2544CAD70);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v171 + 32))(v169, v18, v30);
    v80 = (uint64_t *)(v51
                    + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_rejectionTagScores);
    swift_beginAccess();
    v81 = *v80;
    if (*(_QWORD *)(v81 + 16))
    {
      swift_bridgeObjectRetain();
      v82 = sub_249F8B20C(v79);
      if ((v83 & 1) != 0)
      {
        v84 = *(float *)(*(_QWORD *)(v81 + 56) + 4 * v82);
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v79, v30);
        v85 = OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagScore;
        if (*(float *)(v3
                      + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTagScore) <= (float)(v46 * v84))
        {
          v86 = (uint64_t)v161;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v171 + 56))(v161, 1, 1, v30);
          v87 = v163;
          swift_beginAccess();
          sub_24A012A00(v86, v87);
          swift_endAccess();
          *(_DWORD *)(v3 + v85) = 0;
        }
        goto LABEL_37;
      }
      swift_bridgeObjectRelease();
    }
    (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v79, v30);
  }
LABEL_37:
  v88 = v51
      + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_rejectionTagScores;
  swift_beginAccess();
  v89 = *(char **)v88;
  v90 = *(_QWORD *)(*(_QWORD *)v88 + 64);
  v155 = (void (*)(char *, char *, uint64_t))(*(_QWORD *)v88 + 64);
  v91 = 1 << v89[32];
  v92 = -1;
  if (v91 < 64)
    v92 = ~(-1 << v91);
  v170 = v92 & v90;
  v93 = (char *)(v3
               + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_rejectionTagScores);
  v161 = v89;
  swift_bridgeObjectRetain();
  v169 = v93;
  swift_beginAccess();
  v94 = 0;
  v157 = (unint64_t)(v91 + 63) >> 6;
  v152 = v157 - 1;
  while (1)
  {
    if (v170)
    {
      v96 = __clz(__rbit64(v170));
      v170 &= v170 - 1;
      v97 = v96 | (v94 << 6);
      v98 = (uint64_t)v164;
      goto LABEL_45;
    }
    v103 = v94 + 1;
    v98 = (uint64_t)v164;
    if (__OFADD__(v94, 1))
      goto LABEL_102;
    if (v103 >= v157)
    {
      v100 = (uint64_t)v165;
      goto LABEL_51;
    }
    v104 = *((_QWORD *)v155 + v103);
    v100 = (uint64_t)v165;
    if (v104)
      goto LABEL_49;
    v94 += 2;
    if (v103 + 1 >= v157)
    {
      v94 = v103;
      goto LABEL_51;
    }
    v104 = *((_QWORD *)v155 + v94);
    if (v104)
    {
      ++v103;
      goto LABEL_49;
    }
    if (v103 + 2 < v157)
      break;
LABEL_51:
    v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE30);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 56))(v100, 1, 1, v105);
    v170 = 0;
LABEL_52:
    sub_249F98C10(v100, v98, &qword_2578FFE28);
    v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE30);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v106 - 8) + 48))(v98, 1, v106) == 1)
      return swift_release();
    v107 = *(float *)(v98 + *(int *)(v106 + 48));
    v108 = *(void (**)(uint64_t, uint64_t, uint64_t))(v171 + 32);
    v108(v49, v98, v30);
    v110 = *(_QWORD *)v169;
    if (!*(_QWORD *)(*(_QWORD *)v169 + 16))
      goto LABEL_59;
    swift_bridgeObjectRetain();
    v111 = sub_249F8B20C(v49);
    if ((v112 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
    v113 = *(float *)(*(_QWORD *)(v110 + 56) + 4 * v111);
    swift_bridgeObjectRelease();
    if (a2 <= 0.9999)
    {
      v109.n128_f32[0] = v107 * a2;
      if ((float)(v107 * a2) < v113)
        goto LABEL_77;
LABEL_59:
      v114 = v94;
      v115 = v171;
      v116 = v168;
      v166 = *(char **)(v171 + 16);
      ((void (*)(uint64_t, uint64_t, uint64_t, __n128))v166)(v168, v49, v30, v109);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v115 + 56))(v116, 0, 1, v30);
      v117 = v48 + *(int *)(v162 + 48);
      sub_249F9905C(v163, v48, &qword_2544CAD70);
      sub_249F9905C(v116, v117, &qword_2544CAD70);
      if (v50((char *)v48, 1, v30) == 1)
      {
        sub_249F990A0(v168, &qword_2544CAD70);
        if (v50((char *)v117, 1, v30) == 1)
        {
          sub_249F990A0(v48, &qword_2544CAD70);
          goto LABEL_77;
        }
      }
      else
      {
        v118 = v171;
        v119 = v168;
        v120 = v156;
        sub_249F9905C(v48, v156, &qword_2544CAD70);
        if (v50((char *)v117, 1, v30) != 1)
        {
          v139 = v154;
          v108((uint64_t)v154, v117, v30);
          sub_249FA2B24(&qword_2578FF760, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
          v140 = sub_24A01EE38();
          v95 = *(void (**)(char *, uint64_t))(v118 + 8);
          v141 = v139;
          v49 = (uint64_t)v159;
          v95(v141, v30);
          sub_249F990A0(v119, &qword_2544CAD70);
          v95((char *)v120, v30);
          sub_249F990A0(v48, &qword_2544CAD70);
          v50 = v160;
          v94 = v114;
          if ((v140 & 1) != 0)
            goto LABEL_42;
          goto LABEL_65;
        }
        sub_249F990A0(v119, &qword_2544CAD70);
        (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v120, v30);
        v94 = v114;
      }
      sub_249F990A0(v48, &qword_2578FFBE0);
LABEL_65:
      v121 = (uint64_t)v167;
      v122 = v166;
      ((void (*)(char *, uint64_t, uint64_t))v166)(v167, v49, v30);
      v123 = v169;
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v172 = *(_QWORD **)v123;
      v125 = v172;
      *(_QWORD *)v123 = 0x8000000000000000;
      v127 = sub_249F8B20C(v121);
      v128 = v125[2];
      v129 = (v126 & 1) == 0;
      v130 = v128 + v129;
      if (__OFADD__(v128, v129))
      {
        __break(1u);
LABEL_102:
        __break(1u);
LABEL_103:
        __break(1u);
        goto LABEL_104;
      }
      v131 = v126;
      if (v125[3] >= v130)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_249FC18BC();
      }
      else
      {
        sub_249FB966C(v130, isUniquelyReferenced_nonNull_native);
        v132 = sub_249F8B20C((uint64_t)v167);
        if ((v131 & 1) != (v133 & 1))
          goto LABEL_106;
        v127 = v132;
      }
      v49 = (uint64_t)v159;
      v134 = v46 * v107;
      v135 = v172;
      if ((v131 & 1) != 0)
      {
        *(float *)(v172[7] + 4 * v127) = v134;
      }
      else
      {
        v172[(v127 >> 6) + 8] |= 1 << v127;
        ((void (*)(unint64_t, char *, uint64_t))v122)(v135[6] + *(_QWORD *)(v171 + 72) * v127, v167, v30);
        *(float *)(v135[7] + 4 * v127) = v134;
        v136 = v135[2];
        v137 = __OFADD__(v136, 1);
        v138 = v136 + 1;
        if (v137)
          goto LABEL_103;
        v135[2] = v138;
      }
      *(_QWORD *)v169 = v135;
      swift_bridgeObjectRelease();
      v95 = *(void (**)(char *, uint64_t))(v171 + 8);
      v95(v167, v30);
      swift_endAccess();
      v48 = (uint64_t)v158;
      v50 = v160;
LABEL_42:
      v95((char *)v49, v30);
    }
    else
    {
      v109.n128_f32[0] = v107 * 0.9999;
      if ((float)(v107 * 0.9999) >= v113)
        goto LABEL_59;
LABEL_77:
      (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v49, v30);
    }
  }
  v104 = *((_QWORD *)v155 + v103 + 2);
  if (v104)
  {
    v103 += 2;
    goto LABEL_49;
  }
  v142 = v103 + 3;
  if (v103 + 3 >= v157)
  {
    v94 = v103 + 2;
    goto LABEL_51;
  }
  v104 = *((_QWORD *)v155 + v142);
  if (v104)
  {
    v103 += 3;
LABEL_49:
    v170 = (v104 - 1) & v104;
    v97 = __clz(__rbit64(v104)) + (v103 << 6);
    v94 = v103;
LABEL_45:
    v99 = v161;
    v100 = (uint64_t)v165;
    (*(void (**)(char *, unint64_t, uint64_t))(v171 + 16))(v165, *((_QWORD *)v161 + 6) + *(_QWORD *)(v171 + 72) * v97, v30);
    v101 = *((_QWORD *)v99 + 7);
    v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE30);
    *(_DWORD *)(v100 + *(int *)(v102 + 48)) = *(_DWORD *)(v101 + 4 * v97);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v102 - 8) + 56))(v100, 0, 1, v102);
    goto LABEL_52;
  }
  while (1)
  {
    v103 = v142 + 1;
    if (__OFADD__(v142, 1))
      break;
    if (v103 >= v157)
    {
      v94 = v152;
      goto LABEL_51;
    }
    v104 = *((_QWORD *)v155 + v103);
    ++v142;
    if (v104)
      goto LABEL_49;
  }
LABEL_104:
  __break(1u);
LABEL_105:
  __break(1u);
LABEL_106:
  result = sub_24A01F48C();
  __break(1u);
  return result;
}

uint64_t sub_24A00EFF4()
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t result;
  int64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE28);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v37 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24A01EBA4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v37 - v16;
  v45 = 40;
  v46 = 0xE100000000000000;
  v18 = v1
      + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTag;
  swift_beginAccess();
  sub_249F9905C(v18, (uint64_t)v10, &qword_2544CAD70);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_249F990A0((uint64_t)v10, &qword_2544CAD70);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v10, v11);
    v43 = 0;
    v44 = 0xE000000000000000;
    sub_24A01F2F4();
    sub_24A01EEBC();
    sub_249FA2B24((unint64_t *)&qword_2578FFCA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    sub_24A01F444();
    sub_24A01EEBC();
    swift_bridgeObjectRelease();
    sub_24A01EEBC();
    sub_24A01F00C();
    sub_24A01EEBC();
    sub_24A01EEBC();
    swift_bridgeObjectRelease();
    sub_24A01EEBC();
    sub_24A01EEBC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
  }
  v19 = (uint64_t *)(v1
                  + OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_rejectionTagScores);
  swift_beginAccess();
  v20 = *v19;
  v21 = *(_QWORD *)(*v19 + 64);
  v38 = *v19 + 64;
  v22 = 1 << *(_BYTE *)(v20 + 32);
  v23 = -1;
  if (v22 < 64)
    v23 = ~(-1 << v22);
  v24 = v23 & v21;
  v39 = (unint64_t)(v22 + 63) >> 6;
  v40 = v20;
  v37 = v39 - 1;
  result = swift_bridgeObjectRetain();
  v26 = 0;
  if (!v24)
    goto LABEL_11;
LABEL_9:
  v27 = __clz(__rbit64(v24));
  v24 &= v24 - 1;
  v28 = v27 | (v26 << 6);
  while (2)
  {
    v29 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v5, *(_QWORD *)(v40 + 48) + *(_QWORD *)(v12 + 72) * v28, v11);
    v30 = *(_QWORD *)(v29 + 56);
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE30);
    *(_DWORD *)&v5[*(int *)(v31 + 48)] = *(_DWORD *)(v30 + 4 * v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v5, 0, 1, v31);
    while (1)
    {
      sub_249F98C10((uint64_t)v5, (uint64_t)v7, &qword_2578FFE28);
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE30);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 48))(v7, 1, v36) == 1)
      {
        swift_release();
        sub_24A01EEBC();
        return v45;
      }
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v7, v11);
      v41 = 0;
      v42 = 0xE000000000000000;
      sub_24A01F2F4();
      sub_24A01EEBC();
      sub_249FA2B24((unint64_t *)&qword_2578FFCA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      sub_24A01F444();
      sub_24A01EEBC();
      swift_bridgeObjectRelease();
      sub_24A01EEBC();
      sub_24A01F00C();
      sub_24A01EEBC();
      sub_24A01EEBC();
      swift_bridgeObjectRelease();
      result = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
      if (v24)
        goto LABEL_9;
LABEL_11:
      v32 = v26 + 1;
      if (__OFADD__(v26, 1))
      {
        __break(1u);
        goto LABEL_32;
      }
      if (v32 < v39)
      {
        v33 = *(_QWORD *)(v38 + 8 * v32);
        if (v33)
          goto LABEL_14;
        v34 = v26 + 2;
        ++v26;
        if (v32 + 1 < v39)
        {
          v33 = *(_QWORD *)(v38 + 8 * v34);
          if (v33)
            goto LABEL_17;
          v26 = v32 + 1;
          if (v32 + 2 < v39)
          {
            v33 = *(_QWORD *)(v38 + 8 * (v32 + 2));
            if (v33)
            {
              v32 += 2;
              goto LABEL_14;
            }
            v34 = v32 + 3;
            v26 = v32 + 2;
            if (v32 + 3 < v39)
              break;
          }
        }
      }
LABEL_28:
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE30);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v5, 1, 1, v35);
      v24 = 0;
    }
    v33 = *(_QWORD *)(v38 + 8 * v34);
    if (v33)
    {
LABEL_17:
      v32 = v34;
LABEL_14:
      v24 = (v33 - 1) & v33;
      v28 = __clz(__rbit64(v33)) + (v32 << 6);
      v26 = v32;
      continue;
    }
    break;
  }
  while (1)
  {
    v32 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v32 >= v39)
    {
      v26 = v37;
      goto LABEL_28;
    }
    v33 = *(_QWORD *)(v38 + 8 * v32);
    ++v34;
    if (v33)
      goto LABEL_14;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_24A00F63C()
{
  uint64_t v0;

  sub_249F990A0(v0+ OBJC_IVAR____TtCFC19VisualUnderstanding16VUIndexClusterer15propagateLabelsFT4typeVs5UInt89thresholdGSqSf_8partnersGVs10DictionarySiSi_12similaritiesGS2_SiSf_10ignoreTagsSb19ignorePreviousLabelSb_GS2_SiSi_L_8NodeTags_bestTag, &qword_2544CAD70);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24A00F694()
{
  return type metadata accessor for VUIndexClusterer.NodeTags(0);
}

uint64_t type metadata accessor for VUIndexClusterer.NodeTags(uint64_t a1)
{
  return sub_249F93C98(a1, (uint64_t *)&unk_2578FFE18);
}

void sub_24A00F6B0()
{
  unint64_t v0;

  sub_249F9547C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_24A00F744()
{
  return sub_24A00EFF4();
}

uint64_t sub_24A00F764()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2E8);
  result = sub_24A01F2D0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = sub_24A01F4E0();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24A00F9E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_24A01EBA4();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDA0);
  v6 = sub_24A01F2D0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      result = sub_24A01EE14();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_24A00FD50()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;

  v1 = v0;
  v2 = sub_24A01EBA4();
  v52 = *(_QWORD *)(v2 - 8);
  v53 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v51 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for VUStreamingGallery.Label(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v50 - v9;
  v11 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD98);
  v12 = sub_24A01F2D0();
  v13 = v12;
  if (*(_QWORD *)(v11 + 16))
  {
    v50 = v0;
    v14 = 1 << *(_BYTE *)(v11 + 32);
    v15 = *(_QWORD *)(v11 + 56);
    v55 = (_QWORD *)(v11 + 56);
    if (v14 < 64)
      v16 = ~(-1 << v14);
    else
      v16 = -1;
    v17 = v16 & v15;
    v54 = (unint64_t)(v14 + 63) >> 6;
    v18 = v12 + 56;
    result = swift_retain();
    v20 = 0;
    v56 = v11;
    while (1)
    {
      if (v17)
      {
        v22 = __clz(__rbit64(v17));
        v23 = (v17 - 1) & v17;
        v58 = v20;
        v24 = v22 | (v20 << 6);
      }
      else
      {
        v25 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v25 >= v54)
          goto LABEL_36;
        v26 = v55[v25];
        v27 = v20 + 1;
        if (!v26)
        {
          v27 = v20 + 2;
          if (v20 + 2 >= v54)
            goto LABEL_36;
          v26 = v55[v27];
          if (!v26)
          {
            v27 = v20 + 3;
            if (v20 + 3 >= v54)
              goto LABEL_36;
            v26 = v55[v27];
            if (!v26)
            {
              v28 = v20 + 4;
              if (v20 + 4 >= v54)
              {
LABEL_36:
                swift_release();
                v1 = v50;
                v49 = 1 << *(_BYTE *)(v11 + 32);
                if (v49 > 63)
                  bzero(v55, ((unint64_t)(v49 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v55 = -1 << v49;
                *(_QWORD *)(v11 + 16) = 0;
                break;
              }
              v26 = v55[v28];
              if (!v26)
              {
                while (1)
                {
                  v27 = v28 + 1;
                  if (__OFADD__(v28, 1))
                    goto LABEL_42;
                  if (v27 >= v54)
                    goto LABEL_36;
                  v26 = v55[v27];
                  ++v28;
                  if (v26)
                    goto LABEL_23;
                }
              }
              v27 = v20 + 4;
            }
          }
        }
LABEL_23:
        v23 = (v26 - 1) & v26;
        v58 = v27;
        v24 = __clz(__rbit64(v26)) + (v27 << 6);
      }
      v29 = *(_QWORD *)(v11 + 48);
      v57 = *(_QWORD *)(v5 + 72);
      sub_249FF79AC(v29 + v57 * v24, (uint64_t)v10);
      sub_24A01F4EC();
      sub_249FF7968((uint64_t)v10, (uint64_t)v8);
      v30 = v23;
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v31 = v13;
        v32 = v10;
        v33 = v5;
        v34 = v51;
        v35 = v52;
        v36 = v8;
        v37 = v8;
        v38 = v4;
        v39 = v53;
        (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v51, v36, v53);
        sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        sub_24A01EE20();
        v40 = *(void (**)(char *, uint64_t))(v35 + 8);
        v5 = v33;
        v10 = v32;
        v13 = v31;
        v41 = v39;
        v4 = v38;
        v8 = v37;
        v40(v34, v41);
      }
      else
      {
        sub_24A01F4F8();
      }
      result = sub_24A01F528();
      v42 = -1 << *(_BYTE *)(v13 + 32);
      v43 = result & ~v42;
      v44 = v43 >> 6;
      if (((-1 << v43) & ~*(_QWORD *)(v18 + 8 * (v43 >> 6))) != 0)
      {
        v21 = __clz(__rbit64((-1 << v43) & ~*(_QWORD *)(v18 + 8 * (v43 >> 6)))) | v43 & 0x7FFFFFFFFFFFFFC0;
        v17 = v30;
      }
      else
      {
        v45 = 0;
        v46 = (unint64_t)(63 - v42) >> 6;
        v17 = v30;
        do
        {
          if (++v44 == v46 && (v45 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v47 = v44 == v46;
          if (v44 == v46)
            v44 = 0;
          v45 |= v47;
          v48 = *(_QWORD *)(v18 + 8 * v44);
        }
        while (v48 == -1);
        v21 = __clz(__rbit64(~v48)) + (v44 << 6);
      }
      *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      result = sub_249FF79AC((uint64_t)v10, *(_QWORD *)(v13 + 48) + v21 * v57);
      ++*(_QWORD *)(v13 + 16);
      v11 = v56;
      v20 = v58;
    }
  }
  result = swift_release();
  *v1 = v13;
  return result;
}

uint64_t sub_24A0101B0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD90);
  result = sub_24A01F2D0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v29 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v6 + 63) >> 6;
    v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v15 >= v9)
          goto LABEL_35;
        v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v9)
            goto LABEL_35;
          v16 = v29[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v9)
              goto LABEL_35;
            v16 = v29[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_35:
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v28;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_41;
                  if (v5 >= v9)
                    goto LABEL_35;
                  v16 = v29[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v8 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(v2 + 48) + 16 * v14;
      v19 = *(_QWORD *)v18;
      v20 = *(unsigned __int8 *)(v18 + 8);
      sub_24A01F4EC();
      sub_24A01F504();
      if (v20 != 1)
        sub_24A01F51C();
      result = sub_24A01F528();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 16 * v11;
      *(_QWORD *)v12 = v19;
      *(_BYTE *)(v12 + 8) = v20;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24A0104A4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD80);
  result = sub_24A01F2D0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v29 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v6 + 63) >> 6;
    v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v9)
          goto LABEL_33;
        v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v9)
            goto LABEL_33;
          v16 = v29[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v9)
              goto LABEL_33;
            v16 = v29[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v28;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v9)
                    goto LABEL_33;
                  v16 = v29[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v8 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(v2 + 48) + 16 * v14;
      v19 = *(_WORD *)v18;
      v20 = *(_QWORD *)(v18 + 8);
      sub_24A01F4EC();
      sub_24A01F510();
      sub_24A01F4F8();
      result = sub_24A01F528();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 16 * v11;
      *(_WORD *)v12 = v19;
      *(_QWORD *)(v12 + 8) = v20;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24A010780()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD88);
  result = sub_24A01F2D0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v27 = v1;
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v14);
      result = MEMORY[0x24BD073A4](*(_QWORD *)(v4 + 40), v18, 1);
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_BYTE *)(*(_QWORD *)(v4 + 48) + v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24A010A14(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_24A00F764();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_249FF2C50();
      goto LABEL_14;
    }
    sub_24A0115F0();
  }
  v8 = *v3;
  result = sub_24A01F4E0();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_24A01F480();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_24A010B34(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_24A01EBA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_24A00F9E4();
  }
  else
  {
    if (v11 > v10)
    {
      sub_249FF2DE4();
      goto LABEL_12;
    }
    sub_24A011850();
  }
  v12 = *v3;
  sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v13 = sub_24A01EE14();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_249FA2B24(&qword_2578FF760, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v18 = sub_24A01EE38();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_24A01F480();
  __break(1u);
  return result;
}

uint64_t sub_24A010D38(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int EnumCaseMultiPayload;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t result;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF858);
  MEMORY[0x24BDAC7A8](v72);
  v8 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24A01EBA4();
  v68 = *(_QWORD *)(v9 - 8);
  v69 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v64 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v65 = (char *)&v59 - v12;
  v13 = type metadata accessor for VUStreamingGallery.Label(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (uint64_t *)((char *)&v59 - v19);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v66 = (char *)&v59 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v59 - v23;
  v25 = *(_QWORD *)(*v3 + 16);
  v26 = *(_QWORD *)(*v3 + 24);
  v60 = v3;
  v59 = v14;
  if (v26 > v25 && (a3 & 1) != 0)
    goto LABEL_24;
  if ((a3 & 1) != 0)
  {
    sub_24A00FD50();
  }
  else
  {
    if (v26 > v25)
    {
      sub_249FF3008();
      goto LABEL_24;
    }
    sub_24A011B78();
  }
  v27 = *v3;
  sub_24A01F4EC();
  sub_249FF7968(a1, (uint64_t)v24);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v62 = v27;
  if (EnumCaseMultiPayload == 1)
  {
    v29 = v68;
    v30 = v65;
    v31 = v24;
    v32 = v69;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v65, v31, v69);
    sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_24A01EE20();
    v33 = *(void (**)(char *, uint64_t))(v29 + 8);
    v27 = v62;
    v33(v30, v32);
  }
  else
  {
    sub_24A01F4F8();
  }
  v34 = sub_24A01F528();
  v35 = -1 << *(_BYTE *)(v27 + 32);
  a2 = v34 & ~v35;
  v63 = v27 + 56;
  if (((*(_QWORD *)(v27 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v71 = ~v35;
    v70 = *(_QWORD *)(v14 + 72);
    v67 = a1;
    v36 = (uint64_t)v66;
    v37 = v63;
    v61 = v20;
    do
    {
      sub_249FF7968(*(_QWORD *)(v27 + 48) + v70 * a2, v36);
      v38 = &v8[*(int *)(v72 + 48)];
      sub_249FF7968(v36, (uint64_t)v8);
      sub_249FF7968(a1, (uint64_t)v38);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_249FF7968((uint64_t)v8, (uint64_t)v17);
        if (swift_getEnumCaseMultiPayload() != 1)
        {
          (*(void (**)(char *, uint64_t))(v68 + 8))(v17, v69);
LABEL_14:
          sub_249F990A0((uint64_t)v8, &qword_2578FF858);
          sub_24A014DD4(v36);
          goto LABEL_15;
        }
        v40 = v68;
        v39 = v69;
        v41 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
        v42 = v65;
        v41(v65, v17, v69);
        v43 = v13;
        v44 = v17;
        v45 = v64;
        v41(v64, v38, v39);
        v46 = sub_24A01EB8C();
        v47 = *(void (**)(char *, uint64_t))(v40 + 8);
        v36 = (uint64_t)v66;
        v48 = v45;
        v17 = v44;
        v13 = v43;
        v20 = v61;
        v47(v48, v39);
        v49 = v42;
        v50 = v39;
        v27 = v62;
        v37 = v63;
        v47(v49, v50);
        a1 = v67;
        sub_24A014DD4((uint64_t)v8);
        sub_24A014DD4(v36);
        if ((v46 & 1) != 0)
          goto LABEL_23;
      }
      else
      {
        sub_249FF7968((uint64_t)v8, (uint64_t)v20);
        if (swift_getEnumCaseMultiPayload() == 1)
          goto LABEL_14;
        v51 = *v20;
        v52 = *(_QWORD *)v38;
        sub_24A014DD4((uint64_t)v8);
        sub_24A014DD4(v36);
        v53 = v51 == v52;
        a1 = v67;
        if (v53)
        {
LABEL_23:
          sub_24A01F480();
          __break(1u);
          break;
        }
      }
LABEL_15:
      a2 = (a2 + 1) & v71;
    }
    while (((*(_QWORD *)(v37 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_24:
  v54 = *v60;
  *(_QWORD *)(*v60 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = sub_249FF79AC(a1, *(_QWORD *)(v54 + 48) + *(_QWORD *)(v59 + 72) * a2);
  v56 = *(_QWORD *)(v54 + 16);
  v57 = __OFADD__(v56, 1);
  v58 = v56 + 1;
  if (v57)
    __break(1u);
  else
    *(_QWORD *)(v54 + 16) = v58;
  return result;
}

uint64_t sub_24A0111E0(uint64_t result, char a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v7 = result;
  v8 = *(_QWORD *)(*v4 + 16);
  v9 = *(_QWORD *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0)
    goto LABEL_18;
  if ((a4 & 1) != 0)
  {
    sub_24A0101B0();
  }
  else
  {
    if (v9 > v8)
    {
      result = (uint64_t)sub_249FF3200();
      goto LABEL_18;
    }
    sub_24A011F98();
  }
  v10 = *v4;
  sub_24A01F4EC();
  sub_24A01F504();
  if ((a2 & 1) == 0)
    sub_24A01F51C();
  result = sub_24A01F528();
  v11 = -1 << *(_BYTE *)(v10 + 32);
  a3 = result & ~v11;
  if (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v12 = ~v11;
    do
    {
      v13 = *(_QWORD *)(v10 + 48) + 16 * a3;
      if ((*(_BYTE *)(v13 + 8) & 1) != 0)
      {
        if ((a2 & 1) != 0)
          goto LABEL_17;
      }
      else if ((a2 & 1) == 0 && *(_QWORD *)v13 == v7)
      {
LABEL_17:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFAF0);
        result = sub_24A01F480();
        __break(1u);
        break;
      }
      a3 = (a3 + 1) & v12;
    }
    while (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_18:
  v14 = *v4;
  *(_QWORD *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v15 = *(_QWORD *)(v14 + 48) + 16 * a3;
  *(_QWORD *)v15 = v7;
  *(_BYTE *)(v15 + 8) = a2 & 1;
  v16 = *(_QWORD *)(v14 + 16);
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    *(_QWORD *)(v14 + 16) = v18;
  return result;
}

uint64_t sub_24A011368(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  unsigned __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 *v13;
  int v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v7 = result;
  v8 = *(_QWORD *)(*v4 + 16);
  v9 = *(_QWORD *)(*v4 + 24);
  if (v9 > v8 && (a4 & 1) != 0)
    goto LABEL_15;
  if ((a4 & 1) != 0)
  {
    sub_24A0104A4();
  }
  else
  {
    if (v9 > v8)
    {
      result = (uint64_t)sub_249FF33A4();
      goto LABEL_15;
    }
    sub_24A012258();
  }
  v10 = *v4;
  sub_24A01F4EC();
  sub_24A01F510();
  sub_24A01F4F8();
  result = sub_24A01F528();
  v11 = -1 << *(_BYTE *)(v10 + 32);
  a3 = result & ~v11;
  if (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v12 = ~v11;
    do
    {
      v13 = (unsigned __int16 *)(*(_QWORD *)(v10 + 48) + 16 * a3);
      v14 = *v13;
      v15 = *((_QWORD *)v13 + 1);
      if (v14 == v7 && v15 == a2)
        goto LABEL_18;
      a3 = (a3 + 1) & v12;
    }
    while (((*(_QWORD *)(v10 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_15:
  v17 = *v4;
  *(_QWORD *)(*v4 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v18 = *(_QWORD *)(v17 + 48) + 16 * a3;
  *(_WORD *)v18 = v7;
  *(_QWORD *)(v18 + 8) = a2;
  v19 = *(_QWORD *)(v17 + 16);
  v20 = __OFADD__(v19, 1);
  v21 = v19 + 1;
  if (!v20)
  {
    *(_QWORD *)(v17 + 16) = v21;
    return result;
  }
  __break(1u);
LABEL_18:
  result = sub_24A01F480();
  __break(1u);
  return result;
}

uint64_t sub_24A0114CC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_24A010780();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_249FF3548();
      goto LABEL_14;
    }
    sub_24A012500();
  }
  v8 = *v3;
  result = MEMORY[0x24BD073A4](*(_QWORD *)(*v3 + 40), v5, 1);
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(unsigned __int8 *)(v10 + a2) == (_DWORD)v5)
    {
LABEL_13:
      result = sub_24A01F480();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(unsigned __int8 *)(v10 + a2) == (_DWORD)v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v12 + 48) + a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_24A0115F0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2E8);
  result = sub_24A01F2D0();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = sub_24A01F4E0();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A011850()
{
  uint64_t *v0;
  uint64_t *v1;
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
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_24A01EBA4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFDA0);
  v7 = sub_24A01F2D0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_24A01EE14();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A011B78()
{
  uint64_t *v0;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  uint64_t v55;
  int64_t v56;

  v1 = v0;
  v2 = sub_24A01EBA4();
  v3 = *(_QWORD *)(v2 - 8);
  v51 = v2;
  v52 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v50 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for VUStreamingGallery.Label(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v48 - v10;
  v12 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD98);
  v13 = sub_24A01F2D0();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
  {
    result = swift_release();
LABEL_38:
    *v1 = v14;
    return result;
  }
  v48 = v0;
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 56);
  v53 = v12 + 56;
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v54 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 56;
  result = swift_retain();
  v21 = 0;
  v49 = v11;
  while (1)
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v56 = v21;
      v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v25 >= v54)
      goto LABEL_36;
    v26 = *(_QWORD *)(v53 + 8 * v25);
    v27 = v21 + 1;
    if (!v26)
    {
      v27 = v21 + 2;
      if (v21 + 2 >= v54)
        goto LABEL_36;
      v26 = *(_QWORD *)(v53 + 8 * v27);
      if (!v26)
      {
        v27 = v21 + 3;
        if (v21 + 3 >= v54)
          goto LABEL_36;
        v26 = *(_QWORD *)(v53 + 8 * v27);
        if (!v26)
          break;
      }
    }
LABEL_23:
    v18 = (v26 - 1) & v26;
    v56 = v27;
    v24 = __clz(__rbit64(v26)) + (v27 << 6);
LABEL_24:
    v29 = *(_QWORD *)(v12 + 48);
    v55 = *(_QWORD *)(v6 + 72);
    sub_249FF7968(v29 + v55 * v24, (uint64_t)v11);
    sub_24A01F4EC();
    sub_249FF7968((uint64_t)v11, (uint64_t)v9);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v30 = v12;
      v31 = v5;
      v32 = v52;
      v33 = v50;
      v34 = v9;
      v35 = v14;
      v36 = v9;
      v37 = v6;
      v38 = v51;
      (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v50, v34, v51);
      sub_249FA2B24(&qword_2578FF758, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_24A01EE20();
      v39 = *(void (**)(char *, uint64_t))(v32 + 8);
      v5 = v31;
      v12 = v30;
      v11 = v49;
      v40 = v38;
      v6 = v37;
      v9 = v36;
      v14 = v35;
      v39(v33, v40);
    }
    else
    {
      sub_24A01F4F8();
    }
    result = sub_24A01F528();
    v41 = -1 << *(_BYTE *)(v14 + 32);
    v42 = result & ~v41;
    v43 = v42 >> 6;
    if (((-1 << v42) & ~*(_QWORD *)(v19 + 8 * (v42 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v42) & ~*(_QWORD *)(v19 + 8 * (v42 >> 6)))) | v42 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v44 = 0;
      v45 = (unint64_t)(63 - v41) >> 6;
      do
      {
        if (++v43 == v45 && (v44 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v46 = v43 == v45;
        if (v43 == v45)
          v43 = 0;
        v44 |= v46;
        v47 = *(_QWORD *)(v19 + 8 * v43);
      }
      while (v47 == -1);
      v22 = __clz(__rbit64(~v47)) + (v43 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    result = sub_249FF79AC((uint64_t)v11, *(_QWORD *)(v14 + 48) + v22 * v55);
    ++*(_QWORD *)(v14 + 16);
    v21 = v56;
  }
  v28 = v21 + 4;
  if (v21 + 4 >= v54)
  {
LABEL_36:
    result = swift_release_n();
    v1 = v48;
    goto LABEL_38;
  }
  v26 = *(_QWORD *)(v53 + 8 * v28);
  if (v26)
  {
    v27 = v21 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v27 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v27 >= v54)
      goto LABEL_36;
    v26 = *(_QWORD *)(v53 + 8 * v27);
    ++v28;
    if (v26)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_24A011F98()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD90);
  result = sub_24A01F2D0();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_37:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v28 = (unint64_t)(v7 + 63) >> 6;
  v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v15 >= v28)
      goto LABEL_35;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v28)
        goto LABEL_35;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v28)
          goto LABEL_35;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(v2 + 48) + 16 * v14;
    v19 = *(_QWORD *)v18;
    v20 = *(unsigned __int8 *)(v18 + 8);
    sub_24A01F4EC();
    sub_24A01F504();
    if (v20 != 1)
      sub_24A01F51C();
    result = sub_24A01F528();
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 16 * v11;
    *(_QWORD *)v12 = v19;
    *(_BYTE *)(v12 + 8) = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_35:
    result = swift_release();
    v1 = v0;
    goto LABEL_37;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v28)
      goto LABEL_35;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_24A012258()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD80);
  result = sub_24A01F2D0();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v28 = (unint64_t)(v7 + 63) >> 6;
  v10 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v28)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v28)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(v2 + 48) + 16 * v14;
    v19 = *(_WORD *)v18;
    v20 = *(_QWORD *)(v18 + 8);
    sub_24A01F4EC();
    sub_24A01F510();
    sub_24A01F4F8();
    result = sub_24A01F528();
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 16 * v11;
    *(_WORD *)v12 = v19;
    *(_QWORD *)(v12 + 8) = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v28)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A012500()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFD88);
  result = sub_24A01F2D0();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v14);
    result = MEMORY[0x24BD073A4](*(_QWORD *)(v4 + 40), v18, 1);
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24A012764()
{
  sub_24A01EBA4();
  sub_249FA2B24(&qword_2578FF760, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  return sub_24A01EE38() & 1;
}

BOOL sub_24A0127D8(uint64_t (*a1)(char *), _BOOL8 a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  int v16;
  BOOL v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char v21;
  char v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v25[2];
  int v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, uint64_t, uint64_t);
  _BOOL8 v30;
  uint64_t (*v31)(char *);
  uint64_t v32;

  v4 = v3;
  v30 = a2;
  v31 = a1;
  v32 = sub_24A01EBA4();
  v6 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a3 + 16);
  if (v12)
  {
    v13 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v27 = *(_QWORD *)(v6 + 72);
    v28 = v8;
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v25[1] = a3;
    swift_bridgeObjectRetain();
    while (1)
    {
      v14 = v32;
      v29(v11, v13, v32);
      v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v15(v11, 0, 1, v14);
      v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v14);
      v17 = v16 != 1;
      if (v16 == 1)
        break;
      v26 = 1;
      v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v19 = v6;
      v20 = v28;
      v18(v28, v11, v14);
      v17 = v30;
      v21 = v31(v20);
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v14);
        swift_bridgeObjectRelease();
        return v17;
      }
      v22 = v21;
      v23 = v15;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v14);
      if ((v22 & 1) != 0)
      {
        v17 = v26;
        break;
      }
      v13 += v27;
      --v12;
      v4 = 0;
      v6 = v19;
      if (!v12)
        goto LABEL_9;
    }
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
LABEL_9:
    v23(v11, 1, 1, v32);
    v17 = 0;
  }
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_24A012A00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24A012A48()
{
  sub_24A01EBA4();
  sub_249FA2B24(&qword_2578FF760, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  return sub_24A01EE38() & 1;
}

char *sub_24A012ABC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFE38);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24A012BB8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_24A01F408();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_24A012C60(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_24A01F408();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_24A012D08(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  char *result;
  size_t v6;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_24A01F408();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v6 = (v4 + (v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0;
    if (result != v3 || result >= &v3[v6])
      return (char *)memmove(result, v3, v6);
  }
  return result;
}

uint64_t sub_24A012DB0(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_24A012DC8(a1, a2, a3, &qword_2578FF8C8);
}

uint64_t sub_24A012DBC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_24A012DC8(a1, a2, a3, &qword_2578FF830);
}

uint64_t sub_24A012DC8(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = *a2;
  v6 = *a3;
  result = __swift_instantiateConcreteTypeFromMangledName(a4);
  v8 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1)
    goto LABEL_14;
  if (v9 / v8 < 0)
  {
LABEL_15:
    result = sub_24A01F408();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
    return swift_arrayInitWithTakeFrontToBack();
  if (v4 != v5)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_24A012ED4(uint64_t a1)
{
  return sub_24A012ABC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A012EE8(uint64_t a1)
{
  return sub_249F8CF78(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A012EFC(uint64_t a1)
{
  return sub_249F8CF90(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A012F10(uint64_t a1)
{
  return sub_249F8CF84(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A012F24(_QWORD *a1)
{
  return sub_249F8D124(0, a1[2], 0, a1);
}

void sub_24A012F38()
{
  JUMPOUT(0x24BD072FCLL);
}

uint64_t sub_24A012F4C(uint64_t a1)
{
  return sub_249F8D5E4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A012F60(uint64_t a1)
{
  return sub_249F8D5D8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A012F74(_QWORD *a1)
{
  return sub_249F8D5F0(0, a1[2], 0, a1);
}

uint64_t sub_24A012F88(_QWORD *a1)
{
  return sub_249F8D604(0, a1[2], 0, a1);
}

uint64_t sub_24A012F9C(_QWORD *a1)
{
  return sub_249F8D774(0, a1[2], 0, a1);
}

uint64_t sub_24A012FB0(uint64_t a1)
{
  return sub_249F8DA6C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A012FC4(_QWORD *a1)
{
  return sub_249F8DBC8(0, a1[2], 0, a1);
}

void sub_24A012FD8(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void *v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a1[2];
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v8 = a1[4];
  v7 = a1[5];
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  v10 = sub_249F8B27C(v8);
  v12 = v9[2];
  v13 = (v11 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_24;
  v15 = v10;
  v16 = v11;
  v17 = v9[3];
  swift_retain();
  if (v17 >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_249FC1F40();
      if ((v16 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v22 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v15 >> 6) + 64) |= 1 << v15;
    v23 = 8 * v15;
    *(_QWORD *)(v22[6] + v23) = v8;
    *(_QWORD *)(v22[7] + v23) = v7;
    v24 = v22[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v22[2] = v26;
    v27 = v4 - 1;
    if (v4 == 1)
    {
LABEL_23:
      swift_bridgeObjectRelease_n();
      return;
    }
    v28 = a1 + 7;
    while (1)
    {
      v30 = *(v28 - 1);
      v29 = *v28;
      v31 = (_QWORD *)*a3;
      v32 = sub_249F8B27C(v30);
      v34 = v31[2];
      v35 = (v33 & 1) == 0;
      v36 = v34 + v35;
      if (__OFADD__(v34, v35))
        break;
      v37 = v32;
      v38 = v33;
      v39 = v31[3];
      swift_retain();
      if (v39 < v36)
      {
        sub_249FBA0D4(v36, 1);
        v40 = sub_249F8B27C(v30);
        if ((v38 & 1) != (v41 & 1))
          goto LABEL_26;
        v37 = v40;
      }
      if ((v38 & 1) != 0)
        goto LABEL_10;
      v42 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v37 >> 6) + 64) |= 1 << v37;
      v43 = 8 * v37;
      *(_QWORD *)(v42[6] + v43) = v30;
      *(_QWORD *)(v42[7] + v43) = v29;
      v44 = v42[2];
      v25 = __OFADD__(v44, 1);
      v45 = v44 + 1;
      if (v25)
        goto LABEL_25;
      v42[2] = v45;
      v28 += 2;
      if (!--v27)
        goto LABEL_23;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  sub_249FBA0D4(v14, a2 & 1);
  v18 = sub_249F8B27C(v8);
  if ((v16 & 1) == (v19 & 1))
  {
    v15 = v18;
    if ((v16 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v20 = (void *)swift_allocError();
    swift_willThrow();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578FF8A0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_release();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_27;
  }
LABEL_26:
  sub_24A01F48C();
  __break(1u);
LABEL_27:
  sub_24A01F2F4();
  sub_24A01EEBC();
  sub_24A01F3A8();
  sub_24A01EEBC();
  sub_24A01F3C0();
  __break(1u);
}

uint64_t sub_24A013344(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  char v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _QWORD *v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  _BOOL8 v16;
  BOOL v17;
  uint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v36;

  swift_bridgeObjectRetain();
  swift_retain();
  v8 = sub_24A013FBC();
  if ((v9 & 0x100000000) != 0)
    goto LABEL_19;
  v10 = v8;
  v11 = v9;
  v12 = (_QWORD *)*a5;
  v13 = sub_249F8B27C(v8);
  v15 = v12[2];
  v16 = (v14 & 1) == 0;
  v17 = __OFADD__(v15, v16);
  v18 = v15 + v16;
  if (v17)
    goto LABEL_20;
  v5 = v14;
  if (v12[3] >= v18)
    goto LABEL_6;
  sub_249FBA62C(v18, a4 & 1);
  v13 = sub_249F8B27C(v10);
  if ((v5 & 1) != (v19 & 1))
  {
LABEL_5:
    v13 = sub_24A01F48C();
    __break(1u);
LABEL_6:
    if ((a4 & 1) == 0)
      goto LABEL_22;
  }
  if ((v5 & 1) == 0)
    goto LABEL_8;
LABEL_10:
  while (1)
  {
    v23 = sub_24A013FBC();
    if ((v24 & 0x100000000) != 0)
      break;
    v10 = v23;
    v11 = v24;
    v5 = 1;
    while (1)
    {
      v26 = (_QWORD *)*a5;
      v13 = sub_249F8B27C(v10);
      v28 = v26[2];
      v29 = (v27 & 1) == 0;
      v17 = __OFADD__(v28, v29);
      v30 = v28 + v29;
      if (v17)
        break;
      a4 = v27;
      if (v26[3] < v30)
      {
        sub_249FBA62C(v30, 1);
        v13 = sub_249F8B27C(v10);
        if ((a4 & 1) != (v31 & 1))
          goto LABEL_5;
      }
      if ((a4 & 1) == 0)
      {
        v32 = (_QWORD *)*a5;
        *(_QWORD *)(*a5 + 8 * (v13 >> 6) + 64) |= 1 << v13;
        *(_QWORD *)(v32[6] + 8 * v13) = v10;
        *(_DWORD *)(v32[7] + 4 * v13) = v11;
        v33 = v32[2];
        v17 = __OFADD__(v33, 1);
        v34 = v33 + 1;
        if (v17)
          goto LABEL_21;
        v32[2] = v34;
      }
      v10 = sub_24A013FBC();
      v11 = v25;
      if ((v25 & 0x100000000) != 0)
        goto LABEL_19;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    while (1)
    {
      __break(1u);
LABEL_22:
      v36 = v13;
      sub_249FC226C();
      v13 = v36;
      if ((v5 & 1) != 0)
        break;
LABEL_8:
      v20 = (_QWORD *)*a5;
      *(_QWORD *)(*a5 + 8 * (v13 >> 6) + 64) |= 1 << v13;
      *(_QWORD *)(v20[6] + 8 * v13) = v10;
      *(_DWORD *)(v20[7] + 4 * v13) = v11;
      v21 = v20[2];
      v17 = __OFADD__(v21, 1);
      v22 = v21 + 1;
      if (!v17)
      {
        v20[2] = v22;
        goto LABEL_10;
      }
    }
  }
LABEL_19:
  swift_release();
  swift_bridgeObjectRelease();
  sub_249FCA390();
  return swift_release();
}

uint64_t sub_24A0135C0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  char v5;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  _BOOL8 v17;
  BOOL v18;
  uint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  _QWORD *v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v41;

  swift_bridgeObjectRetain();
  swift_retain();
  v8 = sub_24A014130();
  if ((v10 & 1) != 0)
    goto LABEL_19;
  v11 = v8;
  v12 = v9;
  v13 = (_QWORD *)*a5;
  v14 = sub_249F8B27C(v8);
  v16 = v13[2];
  v17 = (v15 & 1) == 0;
  v18 = __OFADD__(v16, v17);
  v19 = v16 + v17;
  if (v18)
    goto LABEL_20;
  v5 = v15;
  if (v13[3] >= v19)
    goto LABEL_6;
  sub_249FBA388(v19, a4 & 1);
  v14 = sub_249F8B27C(v11);
  if ((v5 & 1) != (v20 & 1))
  {
LABEL_5:
    v14 = sub_24A01F48C();
    __break(1u);
LABEL_6:
    if ((a4 & 1) == 0)
      goto LABEL_22;
  }
  if ((v5 & 1) == 0)
    goto LABEL_8;
LABEL_10:
  while (1)
  {
    v25 = sub_24A014130();
    if ((v27 & 1) != 0)
      break;
    v11 = v25;
    v12 = v26;
    v5 = 1;
    while (1)
    {
      v30 = (_QWORD *)*a5;
      v14 = sub_249F8B27C(v11);
      v32 = v30[2];
      v33 = (v31 & 1) == 0;
      v18 = __OFADD__(v32, v33);
      v34 = v32 + v33;
      if (v18)
        break;
      a4 = v31;
      if (v30[3] < v34)
      {
        sub_249FBA388(v34, 1);
        v14 = sub_249F8B27C(v11);
        if ((a4 & 1) != (v35 & 1))
          goto LABEL_5;
      }
      if ((a4 & 1) == 0)
      {
        v36 = (_QWORD *)*a5;
        *(_QWORD *)(*a5 + 8 * (v14 >> 6) + 64) |= 1 << v14;
        v37 = 8 * v14;
        *(_QWORD *)(v36[6] + v37) = v11;
        *(_QWORD *)(v36[7] + v37) = v12;
        v38 = v36[2];
        v18 = __OFADD__(v38, 1);
        v39 = v38 + 1;
        if (v18)
          goto LABEL_21;
        v36[2] = v39;
      }
      v11 = sub_24A014130();
      v12 = v28;
      if ((v29 & 1) != 0)
        goto LABEL_19;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    while (1)
    {
      __break(1u);
LABEL_22:
      v41 = v14;
      sub_249FC20E0();
      v14 = v41;
      if ((v5 & 1) != 0)
        break;
LABEL_8:
      v21 = (_QWORD *)*a5;
      *(_QWORD *)(*a5 + 8 * (v14 >> 6) + 64) |= 1 << v14;
      v22 = 8 * v14;
      *(_QWORD *)(v21[6] + v22) = v11;
      *(_QWORD *)(v21[7] + v22) = v12;
      v23 = v21[2];
      v18 = __OFADD__(v23, 1);
      v24 = v23 + 1;
      if (!v18)
      {
        v21[2] = v24;
        goto LABEL_10;
      }
    }
  }
LABEL_19:
  swift_release();
  swift_bridgeObjectRelease();
  sub_249FCA390();
  return swift_release();
}

void (*sub_24A013844(_QWORD *a1, uint64_t a2))(uint64_t a1)
{
  _QWORD *v4;
  char isUniquelyReferenced_nonNull_native;

  v4 = malloc(0x50uLL);
  *a1 = v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v4[8] = sub_24A013D2C(v4);
  v4[9] = sub_24A0139DC(v4 + 4, a2, isUniquelyReferenced_nonNull_native);
  return sub_24A0138C0;
}

void sub_24A0138C0(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 72))(*(_QWORD *)a1 + 32, 0);
  v2(v1, 0);
  free(v1);
}

void (*sub_24A0138FC(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_24A013D4C(v6);
  v6[10] = sub_24A013BC4(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_24A01398C;
}

void sub_24A01398C(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_24A0139DC(_QWORD *a1, uint64_t a2, char a3))(uint64_t **a1)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void (*result)(uint64_t **);

  v4 = v3;
  v8 = malloc(0x28uLL);
  *a1 = v8;
  v8[1] = a2;
  v8[2] = v4;
  v9 = *v4;
  v11 = sub_249F8B27C(a2);
  *((_BYTE *)v8 + 32) = v10 & 1;
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
  }
  else
  {
    v15 = v10;
    v16 = *(_QWORD *)(v9 + 24);
    if (v16 >= v14 && (a3 & 1) != 0)
    {
LABEL_7:
      v8[3] = v11;
      if ((v15 & 1) != 0)
      {
LABEL_8:
        v17 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v11);
LABEL_12:
        *v8 = v17;
        return sub_24A013AF8;
      }
LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
    if (v16 >= v14 && (a3 & 1) == 0)
    {
      sub_249FC1AF0();
      goto LABEL_7;
    }
    sub_249FB99FC(v14, a3 & 1);
    v18 = sub_249F8B27C(a2);
    if ((v15 & 1) == (v19 & 1))
    {
      v11 = v18;
      v8[3] = v18;
      if ((v15 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **))sub_24A01F48C();
  __break(1u);
  return result;
}

void sub_24A013AF8(uint64_t **a1)
{
  uint64_t *v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  _QWORD *v5;

  v1 = *a1;
  v2 = **a1;
  v3 = *((_BYTE *)*a1 + 32);
  if (v2)
  {
    v4 = v1[3];
    v5 = *(_QWORD **)v1[2];
    if ((v3 & 1) != 0)
      *(_QWORD *)(v5[7] + 8 * v4) = v2;
    else
      sub_249FC0A04(v4, v1[1], v2, v5);
  }
  else if (((*a1)[4] & 1) != 0)
  {
    sub_249FBE41C(v1[3], *(_QWORD *)v1[2]);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_24A013B78()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A013B9C()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

void (*sub_24A013BC4(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_249F8B0F8(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_24A013CF0;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_249FC342C();
      goto LABEL_7;
    }
    sub_249FBBEE4(v16, a4 & 1);
    v20 = sub_249F8B0F8(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **))sub_24A01F48C();
  __break(1u);
  return result;
}

void sub_24A013CF0(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_24A013D78(*a1, *((_BYTE *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_24A013D2C(_QWORD *a1))()
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_24A014E10;
}

uint64_t (*sub_24A013D4C(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_24A013D6C;
}

uint64_t sub_24A013D6C(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_24A013D78(uint64_t *a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;

  v8 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(*a3 + 56) + 8 * a4) = v8;
    }
    else
    {
      sub_249FC0C98(a4, a5, a6, v8, (_QWORD *)*a3);
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    sub_249FBEF2C(a4, *a3);
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_24A013E14()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24A013E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_24A00AE98(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(uint64_t (**)(uint64_t))(v3 + 40), *(_QWORD *)(v3 + 48));
}

uint64_t sub_24A013E48()
{
  return swift_deallocObject();
}

uint64_t sub_24A013E58()
{
  return swift_deallocObject();
}

uint64_t sub_24A013E68()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A013EA4()
{
  uint64_t *v0;

  return sub_24A00B2E0(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_24A013EB4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A013F00()
{
  uint64_t *v0;

  return sub_24A00B36C(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8]);
}

uint64_t sub_24A013F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24A013F74(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A00A804);
}

uint64_t sub_24A013F20()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A013F5C()
{
  return sub_24A0143F0((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float))sub_24A00AB74);
}

uint64_t sub_24A013F68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24A013F74(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24A00A00C);
}

uint64_t sub_24A013F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v4;

  return a4(a1, a2, a3, v4[2], v4[3], v4[4], v4[5], v4[6], v4[7]) & 1;
}

float sub_24A013FA8@<S0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  float result;

  result = *(float *)(a1 + 8);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(float *)(a2 + 8) = result;
  return result;
}

uint64_t sub_24A013FBC()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  void (*v9)(uint64_t *__return_ptr, uint64_t *);
  char v10;
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v6);
    v8 = *(_DWORD *)(*(_QWORD *)(v1 + 56) + 4 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v9 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    v19 = v7;
    v20 = v8;
    v9(&v18, &v19);
    v10 = 0;
    result = v18;
LABEL_23:
    LOBYTE(v19) = v10;
    return result;
  }
  v12 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      v14 = v0[1];
      v15 = *(_QWORD *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        v5 = (v15 - 1) & v15;
        v6 = __clz(__rbit64(v15)) + (v12 << 6);
        v4 = v12;
        goto LABEL_3;
      }
      v16 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        v15 = *(_QWORD *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          v12 = v16;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          v15 = *(_QWORD *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            v12 = v3 + 3;
            goto LABEL_7;
          }
          v16 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            v15 = *(_QWORD *)(v14 + 8 * v16);
            if (v15)
              goto LABEL_10;
            v12 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              v15 = *(_QWORD *)(v14 + 8 * v12);
              if (v15)
                goto LABEL_7;
              v4 = v13 - 1;
              v17 = v3 + 6;
              while (v13 != v17)
              {
                v15 = *(_QWORD *)(v14 + 8 * v17++);
                if (v15)
                {
                  v12 = v17 - 1;
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
    v10 = 1;
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A014130()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = 8 * v6;
    v8 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v6);
    v9 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + v7);
    v0[3] = v4;
    v0[4] = v5;
    v10 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v19[0] = v8;
    v19[1] = v9;
    v10(&v18, v19);
    return v18;
  }
  v12 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      v14 = v0[1];
      v15 = *(_QWORD *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        v5 = (v15 - 1) & v15;
        v6 = __clz(__rbit64(v15)) + (v12 << 6);
        v4 = v12;
        goto LABEL_3;
      }
      v16 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        v15 = *(_QWORD *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          v12 = v16;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          v15 = *(_QWORD *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            v12 = v3 + 3;
            goto LABEL_7;
          }
          v16 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            v15 = *(_QWORD *)(v14 + 8 * v16);
            if (v15)
              goto LABEL_10;
            v12 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              v15 = *(_QWORD *)(v14 + 8 * v12);
              if (v15)
                goto LABEL_7;
              v4 = v13 - 1;
              v17 = v3 + 6;
              while (v13 != v17)
              {
                v15 = *(_QWORD *)(v14 + 8 * v17++);
                if (v15)
                {
                  v12 = v17 - 1;
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

__n128 sub_24A014294@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

void sub_24A0142A0(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v5;
  float *v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  unint64_t v11;
  unint64_t v12;
  float v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_249F8CC30(0, v2, 0);
    v5 = *(_QWORD *)(a2 + 48);
    v6 = (float *)(a1 + 40);
    v7 = *(float *)(a2 + 64);
    while (1)
    {
      v8 = *((_QWORD *)v6 - 1);
      v9 = v5 - v8;
      if (__OFSUB__(v5, v8))
        break;
      v10 = *v6;
      v12 = *(_QWORD *)(v14 + 16);
      v11 = *(_QWORD *)(v14 + 24);
      if (v12 >= v11 >> 1)
        sub_249F8CC30(v11 > 1, v12 + 1, 1);
      v6 += 4;
      v13 = powf((float)v9, v7);
      *(_QWORD *)(v14 + 16) = v12 + 1;
      *(float *)(v14 + 4 * v12 + 32) = v10 * v13;
      if (!--v2)
        return;
    }
    __break(1u);
  }
}

uint64_t sub_24A0143A0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A0143E4()
{
  return sub_24A0143F0(sub_24A00A4B4);
}

uint64_t sub_24A0143F0(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, float))
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(float *)(v1 + 64));
}

uint64_t sub_24A014418()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  if (v1)
    return v1(1) & 1;
  else
    return 1;
}

uint64_t sub_24A014450(uint64_t a1, void *a2)
{
  uint64_t **v2;

  return sub_24A009970(a1, a2, v2[2], v2[3], v2[4]);
}

uint64_t sub_24A01445C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void (*v9)(_QWORD *@<X8>);
  int64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  _QWORD *v41;
  char v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char v47;
  float v48;
  unint64_t v49;
  char v50;
  float v51;
  float v52;
  char v53;
  unint64_t v54;
  char v55;
  float v56;
  float v57;
  char v58;
  unint64_t v59;
  char v60;
  float v61;
  unint64_t v62;
  char v63;
  float v64;
  char v65;
  int64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  _QWORD *v78;
  float v79;
  float v80;
  uint64_t v81;
  uint64_t v82;
  float v83;
  unint64_t v84;
  char v85;
  float v86;
  unint64_t v87;
  char v88;
  char isUniquelyReferenced_nonNull_native;
  char v90;
  unint64_t v91;
  uint64_t v92;
  _BOOL8 v93;
  uint64_t v94;
  char v95;
  unint64_t v96;
  char v97;
  float v98;
  uint64_t v99;
  BOOL v100;
  uint64_t v101;
  int64_t v102;
  unint64_t v103;
  int64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  float v108;
  unint64_t v109;
  char v110;
  unint64_t v111;
  char v112;
  float v113;
  float v114;
  unint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t result;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;
  unint64_t v124;
  int64_t v125;
  int64_t v126;
  int64_t v127;
  _QWORD *v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD *v132;

  v5 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a1 + 64);
  v126 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = 0;
  v10 = 0;
  v121 = MEMORY[0x24BEE4B00];
  v122 = MEMORY[0x24BEE4B00];
  v11 = MEMORY[0x24BEE4B00];
  v12 = (_QWORD *)MEMORY[0x24BEE4B00];
  v131 = a2;
  while (2)
  {
    v119 = v11;
LABEL_5:
    v120 = (uint64_t)v9;
    v129 = v12;
    do
    {
      do
      {
        while (v8)
        {
          v13 = __clz(__rbit64(v8));
          v8 &= v8 - 1;
          v14 = v13 | (v10 << 6);
          if (*(_QWORD *)(a2 + 16))
            goto LABEL_23;
        }
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_125:
          __break(1u);
          goto LABEL_126;
        }
        v17 = v121;
        v16 = v122;
        if (v15 >= v126)
          goto LABEL_69;
        v18 = *(_QWORD *)(v5 + 8 * v15);
        ++v10;
        if (!v18)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v126)
            goto LABEL_69;
          v18 = *(_QWORD *)(v5 + 8 * v10);
          if (!v18)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v126)
              goto LABEL_69;
            v18 = *(_QWORD *)(v5 + 8 * v10);
            if (!v18)
            {
              v19 = v15 + 3;
              if (v19 < v126)
              {
                v18 = *(_QWORD *)(v5 + 8 * v19);
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
                  if (v10 >= v126)
                    goto LABEL_69;
                  v18 = *(_QWORD *)(v5 + 8 * v10);
                  ++v19;
                  if (v18)
                    goto LABEL_22;
                }
LABEL_127:
                __break(1u);
LABEL_128:
                __break(1u);
                goto LABEL_129;
              }
LABEL_69:
              swift_release();
              v66 = 0;
              v69 = v12[8];
              v68 = v12 + 8;
              v67 = v69;
              v70 = 1 << *((_BYTE *)v68 - 32);
              v71 = -1;
              if (v70 < 64)
                v71 = ~(-1 << v70);
              v72 = v71 & v67;
              v123 = v68;
              v125 = (unint64_t)(v70 + 63) >> 6;
              v73 = (_QWORD *)MEMORY[0x24BEE4B00];
              if ((v71 & v67) != 0)
                goto LABEL_76;
LABEL_96:
              while (1)
              {
                v102 = v66 + 1;
                v78 = v129;
                if (__OFADD__(v66, 1))
                  break;
                if (v102 >= v125)
                  goto LABEL_122;
                v103 = v123[v102];
                ++v66;
                if (!v103)
                {
                  v66 = v102 + 1;
                  if (v102 + 1 >= v125)
                    goto LABEL_122;
                  v103 = v123[v66];
                  if (!v103)
                  {
                    v66 = v102 + 2;
                    if (v102 + 2 >= v125)
                      goto LABEL_122;
                    v103 = v123[v66];
                    if (!v103)
                    {
                      v104 = v102 + 3;
                      if (v104 >= v125)
                      {
LABEL_122:
                        swift_bridgeObjectRelease();
                        swift_release();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        sub_249FC7728(v120);
                        return (uint64_t)v73;
                      }
                      v103 = v123[v104];
                      if (!v103)
                      {
                        while (1)
                        {
                          v66 = v104 + 1;
                          if (__OFADD__(v104, 1))
                            goto LABEL_128;
                          if (v66 >= v125)
                            goto LABEL_122;
                          v103 = v123[v66];
                          ++v104;
                          if (v103)
                            goto LABEL_109;
                        }
                      }
                      v66 = v104;
                    }
                  }
                }
LABEL_109:
                v72 = (v103 - 1) & v103;
                v77 = __clz(__rbit64(v103)) + (v66 << 6);
                while (1)
                {
                  v105 = 8 * v77;
                  v106 = *(_QWORD *)(v78[6] + v105);
                  v107 = *(_QWORD *)(v78[7] + v105);
                  v108 = 1.0;
                  if (*(_QWORD *)(v11 + 16))
                  {
                    v109 = sub_249F8B27C(v106);
                    if ((v110 & 1) != 0)
                      v108 = *(float *)(*(_QWORD *)(v11 + 56) + 4 * v109);
                  }
                  if (*(_QWORD *)(v16 + 16) && (v111 = sub_249F8B27C(v106), (v112 & 1) != 0))
                    v113 = fmaxf(*(float *)(*(_QWORD *)(v16 + 56) + 4 * v111), 0.8);
                  else
                    v113 = 0.8;
                  v114 = 1.0;
                  if (*(_QWORD *)(v17 + 16))
                  {
                    v115 = sub_249F8B27C(v106);
                    v74 = v131;
                    if ((v116 & 1) != 0)
                    {
                      v117 = *(_QWORD *)(v17 + 56);
                      if (*(float *)(v117 + 4 * v115) == 0.0)
                        v114 = 1.0;
                      else
                        v114 = *(float *)(v117 + 4 * v115);
                    }
                  }
                  else
                  {
                    v74 = v131;
                  }
                  v75 = *(_QWORD *)(v107 + 16);
                  if (v75)
                    break;
                  if (!v72)
                    goto LABEL_96;
LABEL_76:
                  v76 = __clz(__rbit64(v72));
                  v72 &= v72 - 1;
                  v77 = v76 | (v66 << 6);
                  v78 = v129;
                }
                v79 = v114 - v113;
                v80 = v108 + 0.00001;
                swift_bridgeObjectRetain();
                v81 = 0;
                v127 = v66;
                do
                {
                  v82 = *(_QWORD *)(v107 + 8 * v81 + 32);
                  v83 = 0.0;
                  if (*(_QWORD *)(v74 + 16))
                  {
                    v84 = sub_249F8B27C(*(_QWORD *)(v107 + 8 * v81 + 32));
                    if ((v85 & 1) != 0)
                      v83 = *(float *)(*(_QWORD *)(v74 + 56) + 4 * v84);
                  }
                  v86 = 1.0;
                  if (*(_QWORD *)(a3 + 16))
                  {
                    v87 = sub_249F8B27C(v82);
                    if ((v88 & 1) != 0)
                      v86 = *(float *)(*(_QWORD *)(a3 + 56) + 4 * v87);
                  }
                  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                  v91 = sub_249F8B27C(v82);
                  v92 = v73[2];
                  v93 = (v90 & 1) == 0;
                  v94 = v92 + v93;
                  if (__OFADD__(v92, v93))
                  {
                    __break(1u);
LABEL_124:
                    __break(1u);
                    goto LABEL_125;
                  }
                  v95 = v90;
                  if (v73[3] >= v94)
                  {
                    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                      sub_249FC226C();
                  }
                  else
                  {
                    sub_249FBA62C(v94, isUniquelyReferenced_nonNull_native);
                    v96 = sub_249F8B27C(v82);
                    if ((v95 & 1) != (v97 & 1))
                      goto LABEL_131;
                    v91 = v96;
                  }
                  v98 = (float)-v86 / (float)((float)(v113 + (float)((float)(v79 * v83) / v80)) + 0.00001);
                  if ((v95 & 1) != 0)
                  {
                    *(float *)(v73[7] + 4 * v91) = v98;
                  }
                  else
                  {
                    v73[(v91 >> 6) + 8] |= 1 << v91;
                    *(_QWORD *)(v73[6] + 8 * v91) = v82;
                    *(float *)(v73[7] + 4 * v91) = v98;
                    v99 = v73[2];
                    v100 = __OFADD__(v99, 1);
                    v101 = v99 + 1;
                    if (v100)
                      goto LABEL_124;
                    v73[2] = v101;
                  }
                  ++v81;
                  swift_bridgeObjectRelease();
                  v74 = v131;
                  v66 = v127;
                }
                while (v75 != v81);
                swift_bridgeObjectRelease();
                v11 = v119;
                v17 = v121;
                v16 = v122;
                if (v72)
                  goto LABEL_76;
              }
LABEL_126:
              __break(1u);
              goto LABEL_127;
            }
          }
        }
LABEL_22:
        v8 = (v18 - 1) & v18;
        v14 = __clz(__rbit64(v18)) + (v10 << 6);
      }
      while (!*(_QWORD *)(a2 + 16));
LABEL_23:
      v20 = 8 * v14;
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v20);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + v20);
      sub_249F8B27C(v22);
    }
    while ((v23 & 1) == 0);
    sub_249FC7728(v120);
    v24 = swift_isUniquelyReferenced_nonNull_native();
    v132 = v12;
    v26 = sub_249F8B27C(v21);
    v27 = v12[2];
    v28 = (v25 & 1) == 0;
    v29 = v27 + v28;
    if (__OFADD__(v27, v28))
    {
LABEL_129:
      __break(1u);
      break;
    }
    v30 = v12;
    v31 = v25;
    if (v30[3] >= v29)
    {
      if ((v24 & 1) == 0)
      {
        sub_249FC1AF0();
        v129 = v132;
      }
    }
    else
    {
      sub_249FB99FC(v29, v24);
      v129 = v132;
      v32 = sub_249F8B27C(v21);
      if ((v31 & 1) != (v33 & 1))
        goto LABEL_131;
      v26 = v32;
    }
    swift_bridgeObjectRelease();
    v34 = v26;
    v35 = 8 * v26;
    v124 = v34;
    if ((v31 & 1) != 0)
    {
      v36 = v129;
      swift_bridgeObjectRetain();
      goto LABEL_37;
    }
    v36 = v129;
    v129[(v34 >> 6) + 8] |= 1 << v34;
    *(_QWORD *)(v129[6] + v35) = v21;
    *(_QWORD *)(v129[7] + v35) = MEMORY[0x24BEE4AF8];
    v37 = v129[2];
    v38 = v37 + 1;
    v39 = __OFADD__(v37, 1);
    swift_bridgeObjectRetain();
    if (!v39)
    {
      v129[2] = v38;
LABEL_37:
      v130 = v5;
      v40 = v36[7];
      swift_bridgeObjectRelease();
      v41 = *(_QWORD **)(v40 + v35);
      v42 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v40 + v35) = v41;
      v43 = v36;
      if ((v42 & 1) == 0)
      {
        v41 = sub_249F89B7C(0, v41[2] + 1, 1, v41);
        *(_QWORD *)(v40 + 8 * v124) = v41;
      }
      v45 = v41[2];
      v44 = v41[3];
      if (v45 >= v44 >> 1)
      {
        v41 = sub_249F89B7C((_QWORD *)(v44 > 1), v45 + 1, 1, v41);
        *(_QWORD *)(v40 + 8 * v124) = v41;
      }
      v11 = v119;
      v41[2] = v45 + 1;
      v41[v45 + 4] = v22;
      if (*(_QWORD *)(a3 + 16))
      {
        v46 = sub_249F8B27C(v22);
        a2 = v131;
        v12 = v43;
        if ((v47 & 1) != 0)
        {
          v48 = *(float *)(*(_QWORD *)(a3 + 56) + 4 * v46);
          v5 = v130;
          if (*(_QWORD *)(v122 + 16) && (v49 = sub_249F8B27C(v21), (v50 & 1) != 0))
            v51 = *(float *)(*(_QWORD *)(v122 + 56) + 4 * v49);
          else
            v51 = INFINITY;
          if (v48 >= v51)
            v52 = v51;
          else
            v52 = v48;
          v53 = swift_isUniquelyReferenced_nonNull_native();
          sub_249FBFB60(v21, v53, v52);
          swift_bridgeObjectRelease();
          if (*(_QWORD *)(v121 + 16) && (v54 = sub_249F8B27C(v21), (v55 & 1) != 0))
            v56 = *(float *)(*(_QWORD *)(v121 + 56) + 4 * v54);
          else
            v56 = -INFINITY;
          if (v56 > v48)
            v57 = v56;
          else
            v57 = v48;
          v58 = swift_isUniquelyReferenced_nonNull_native();
          sub_249FBFB60(v21, v58, v57);
          swift_bridgeObjectRelease();
          a2 = v131;
        }
        else
        {
          v5 = v130;
        }
      }
      else
      {
        v12 = v43;
        v5 = v130;
        a2 = v131;
      }
      v9 = sub_249FA3E60;
      if (*(_QWORD *)(a2 + 16))
      {
        v59 = sub_249F8B27C(v22);
        v9 = sub_249FA3E60;
        if ((v60 & 1) != 0)
        {
          v61 = *(float *)(*(_QWORD *)(a2 + 56) + 4 * v59);
          if (*(_QWORD *)(v119 + 16) && (v62 = sub_249F8B27C(v21), (v63 & 1) != 0))
            v64 = *(float *)(*(_QWORD *)(v119 + 56) + 4 * v62);
          else
            v64 = -INFINITY;
          if (v64 > v61)
            v61 = v64;
          v65 = swift_isUniquelyReferenced_nonNull_native();
          sub_249FBFB60(v21, v65, v61);
          swift_bridgeObjectRelease();
          v9 = sub_249FA3E60;
          continue;
        }
      }
      goto LABEL_5;
    }
    break;
  }
  __break(1u);
LABEL_131:
  result = sub_24A01F48C();
  __break(1u);
  return result;
}

uint64_t sub_24A014D7C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t result;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  if (v1)
    return v1(1);
  return result;
}

unint64_t sub_24A014DA8(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_24A009AE4(a1, a2, *(uint64_t **)(v2 + 16), *(uint64_t **)(v2 + 24), *(uint64_t **)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

void sub_24A014DB8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_249FD855C(*(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_24A014DD4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for VUStreamingGallery.Label(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A014E58(unint64_t a1, int32x2_t a2)
{
  uint64_t result;
  __int32 *v4;
  unint64_t v5;
  __int32 v6;
  int32x4_t v7;
  int32x4_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a1 & 0x8000000000000000) != 0)
  {
    result = sub_24A01F3B4();
    __break(1u);
    return result;
  }
  if (!a1)
    return MEMORY[0x24BEE4AF8];
  result = sub_24A01EFC4();
  *(_QWORD *)(result + 16) = a1;
  v4 = (__int32 *)(result + 32);
  if (a1 < 8)
  {
    v5 = 0;
    v6 = a2.i32[0];
LABEL_9:
    v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  v5 = a1 & 0xFFFFFFFFFFFFFFF8;
  v4 += a1 & 0xFFFFFFFFFFFFFFF8;
  v6 = a2.i32[0];
  v7 = vdupq_lane_s32(a2, 0);
  v8 = (int32x4_t *)(result + 48);
  v9 = a1 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 8;
  }
  while (v9);
  if (v5 != a1)
    goto LABEL_9;
  return result;
}

uint64_t sub_24A014F48(unint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_24A01F3B4();
    __break(1u);
    return result;
  }
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  result = sub_24A01EFC4();
  *(_QWORD *)(result + 16) = a2;
  v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    v6 = 0;
LABEL_9:
    v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  v7 = vdupq_n_s64(a1);
  v8 = (int64x2_t *)(result + 48);
  v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2)
    goto LABEL_9;
  return result;
}

void sub_24A015030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_24A0150A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int16 v15;
  char v16;
  char v17;
  char v18;
  char v19;

  v14 = v9;
  v15 = v12;
  v16 = BYTE2(v12);
  v17 = BYTE3(v12);
  v18 = BYTE4(v12);
  v19 = BYTE5(v12);
  return sub_24A0152B0((uint64_t)&v14, (uint64_t)&v14 + BYTE6(v12), v11, v7, a7, a6, v8, v10);
}

uint64_t sub_24A0152B0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char **a8)
{
  char *v9;
  char isUniquelyReferenced_nonNull_native;

  if (a3 > 0x7FFFFFFF)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (a4 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (a3 < (uint64_t)0xFFFFFFFF80000000 || a4 < (uint64_t)0xFFFFFFFF80000000 || a5 < (uint64_t)0xFFFFFFFF80000000)
    goto LABEL_14;
  if (a5 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (!a6)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (!result)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  v9 = *a8;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a8 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v9 = sub_249F8A998(0, *((_QWORD *)v9 + 2), 0, v9);
  *a8 = v9;
  return cblas_sgemm_NEWLAPACK();
}

uint64_t type metadata accessor for Vector()
{
  return objc_opt_self();
}

uint64_t sub_24A0153F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_24A01E9AC();
  v10 = result;
  if (result)
  {
    result = sub_24A01E9D0();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v10 += a1 - result;
  }
  v11 = __OFSUB__(a2, a1);
  v12 = a2 - a1;
  if (v11)
  {
    __break(1u);
    goto LABEL_13;
  }
  v13 = sub_24A01E9C4();
  if (v13 >= v12)
    v14 = v12;
  else
    v14 = v13;
  v15 = v10 + v14;
  if (v10)
    v16 = v15;
  else
    v16 = 0;
  sub_24A015030(v10, v16, a4, a5);
  return sub_249F92358(a4, a5);
}

uint64_t sub_24A0154E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char **a9)
{
  uint64_t result;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  result = sub_24A01E9AC();
  v16 = result;
  if (result)
  {
    result = sub_24A01E9D0();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v16 += a1 - result;
  }
  v17 = __OFSUB__(a2, a1);
  v18 = a2 - a1;
  if (v17)
  {
    __break(1u);
    goto LABEL_13;
  }
  v19 = sub_24A01E9C4();
  if (v19 >= v18)
    v20 = v18;
  else
    v20 = v19;
  v21 = v16 + v20;
  if (v16)
    v22 = v21;
  else
    v22 = 0;
  return sub_24A0152B0(v16, v22, a4, a5, a6, a7, a8, a9);
}

void sub_24A0155B4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

void sub_24A01561C()
{
  uint64_t v1;

  if (BYTE6(v1))
    __asm { BR              X9 }
}

id sub_24A015AAC(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  objc_super v14;
  unsigned __int8 v15;

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAD60);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24A01EAA8();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  v15 = 5;
  type metadata accessor for VUGallery(0);
  swift_allocObject();
  v10 = v1;
  v11 = VUGallery.init(for:at:)(&v15, (uint64_t)v7);
  if (v2)
  {

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    type metadata accessor for VUWGallery();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)&v10[OBJC_IVAR___VUWGallery_gallery] = v11;

    v14.receiver = v10;
    v14.super_class = (Class)VUWGallery;
    v3 = objc_msgSendSuper2(&v14, sel_init);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  }
  return v3;
}

uint64_t sub_24A015CDC()
{
  uint64_t v0;
  uint64_t result;
  void *v2;
  _BYTE v3[24];
  ValueMetadata *v4;
  unsigned __int8 v5;

  v3[0] = 2;
  result = _s19VisualUnderstanding9VUGalleryC26isPersonalizationAvailable3forSbAC014TokenEmbeddingE4TypeO_tF_0(v3);
  if ((result & 1) != 0)
  {
    v4 = &type metadata for VUGallery.TokenEmbeddingPersonalizationType;
    v3[0] = 2;
    v5 = 1;
    v2 = (void *)sub_249FE4B50((uint64_t)v3, &v5);
    if (!v0)

    return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
  }
  return result;
}

void sub_24A015EF4(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) < 6 && ((0x39u >> v2) & 1) != 0)
  {
    v3 = 0x30504040403uLL >> (8 * v2);
    VUGallery.tokenEmbeddings(for:type:)(a1, &v3);
  }
  else
  {
    sub_24A01F3C0();
    __break(1u);
  }
}

uint64_t sub_24A016430(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  char v17;
  unsigned __int8 v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAD60);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    v11 = &unk_251B68538;
LABEL_5:
    v12 = sub_24A01EAA8();
    v13 = *(_QWORD *)(v12 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v10, a2, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a3;
    *(_QWORD *)(v14 + 24) = a4;
    v18 = 0;
    swift_retain();
    v17 = 1;
    sub_249F79B20((uint64_t)v11, (uint64_t)v10, &v18, 0, 0x100000000, (uint64_t)sub_24A017258, v14);
    sub_24A0171F4((uint64_t)v10);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  if (a1 == 1)
  {
    v11 = &unk_251B68510;
    goto LABEL_5;
  }
  result = sub_24A01F3C0();
  __break(1u);
  return result;
}

uint64_t sub_24A016738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t result;
  _BYTE v19[31];
  unsigned __int8 v20;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAD60);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v19[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    if (a1 != 1)
      goto LABEL_9;
    v13 = &unk_251B68560;
  }
  else
  {
    v13 = &unk_251B68588;
  }
  v14 = sub_24A01EAA8();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v12, a2, v14);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  v16 = 0;
  if (!a3)
  {
LABEL_8:
    v20 = v16;
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a4;
    *(_QWORD *)(v17 + 24) = a5;
    swift_retain();
    v19[28] = 1;
    sub_249F79B20((uint64_t)v13, (uint64_t)v12, &v20, 0, 0x100000000, (uint64_t)sub_24A017718, v17);
    sub_24A0171F4((uint64_t)v12);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  if (a3 == 1)
  {
    v16 = 1;
    goto LABEL_8;
  }
LABEL_9:
  result = sub_24A01F3C0();
  __break(1u);
  return result;
}

uint64_t sub_24A016A78(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  _QWORD v20[2];
  char v21;
  unsigned __int8 v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAD60);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(_QWORD *)(v5 + OBJC_IVAR___VUWGallery_gallery);
  if (!a1)
  {
    v14 = a3;
    v15 = &unk_251B685D8;
LABEL_5:
    v16 = sub_24A01EAA8();
    v17 = *(_QWORD *)(v16 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v13, a2, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v13, 0, 1, v16);
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = a4;
    *(_QWORD *)(v18 + 24) = a5;
    v22 = 0;
    swift_retain();
    v21 = 1;
    sub_249F79B20((uint64_t)v15, (uint64_t)v13, &v22, v14 & 1, 0x100000000, (uint64_t)sub_24A017718, v18);
    sub_24A0171F4((uint64_t)v13);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  if (a1 == 1)
  {
    v14 = a3;
    v15 = &unk_251B685B0;
    goto LABEL_5;
  }
  result = sub_24A01F3C0();
  __break(1u);
  return result;
}

uint64_t sub_24A016DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t result;
  unsigned __int8 v8;

  if (!a1)
  {
    v5 = 0;
LABEL_5:
    v8 = v5;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a2;
    *(_QWORD *)(v6 + 24) = a3;
    swift_retain();
    sub_249F7A594(&v8, (uint64_t)sub_24A017718, v6);
    return swift_release();
  }
  if (a1 == 1)
  {
    v5 = 1;
    goto LABEL_5;
  }
  result = sub_24A01F3C0();
  __break(1u);
  return result;
}

uint64_t sub_24A016F5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t result;
  uint64_t v6;

  if (a1)
  {
    if (a1 != 1)
      goto LABEL_10;
    v1 = 2;
  }
  else
  {
    v1 = 1;
  }
  v2 = 0;
  v3 = 0;
  while (1)
  {
    MEMORY[0x24BDAC7A8](a1);
    a1 = sub_24A01F138();
    v4 = __OFADD__(v2, v6);
    v2 += v6;
    if (v4)
      break;
    if (v1 == ++v3)
    {
      swift_bridgeObjectRelease();
      return v2;
    }
  }
  __break(1u);
LABEL_10:
  result = sub_24A01F3C0();
  __break(1u);
  return result;
}

void __swiftcall VUWGallery.init()(VUWGallery *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void VUWGallery.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for VUWGallery()
{
  unint64_t result;

  result = qword_2578FFE48;
  if (!qword_2578FFE48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2578FFE48);
  }
  return result;
}

uint64_t sub_24A0171B4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_24A0171D8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_24A0171F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2544CAD60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24A017234()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24A017258(float *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(float))(v1 + 16))(*a1) & 1;
}

uint64_t sub_24A017280(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t result;
  unsigned __int8 v4;
  unsigned __int8 v5;

  v5 = 0;
  v2 = a2 - 1;
  if ((unint64_t)(a2 - 1) < 6 && ((0x39u >> v2) & 1) != 0)
  {
    v4 = 0x30504040403uLL >> (8 * v2);
    return VUGallery.tokenEmbeddings(for:client:type:)(a1, &v5, &v4);
  }
  else
  {
    result = sub_24A01F3C0();
    __break(1u);
  }
  return result;
}

id sub_24A017338(void **a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id result;
  id v9;
  unsigned __int8 v10;
  unsigned __int8 v11;

  v11 = 0;
  if ((unint64_t)(a4 - 1) >= 3)
  {
    result = (id)sub_24A01F3C0();
    __break(1u);
  }
  else
  {
    v10 = 2;
    v7 = *a1;
    if (*a1)
      swift_unknownObjectRetain();
    v9 = v7;
    VUGallery.personalize(embeddingLayer:at:for:client:type:randomizeWithSeed:)(&v9, a2, a3, &v11, &v10, 0, 1);
    result = v7;
    *a1 = v7;
  }
  return result;
}

id sub_24A01742C(void **a1, NSObject *a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  id result;
  id v11;
  unsigned __int8 v12;
  unsigned __int8 v13;

  v13 = 0;
  if ((unint64_t)(a4 - 1) >= 3)
  {
    result = (id)sub_24A01F3C0();
    __break(1u);
  }
  else
  {
    v12 = 2;
    v9 = *a1;
    if (*a1)
      swift_unknownObjectRetain();
    v11 = v9;
    VUGallery.personalize(embeddingLayer:at:for:client:type:randomizeWithSeed:)(&v11, a2, a3, &v13, &v12, a5, 0);
    result = v9;
    *a1 = v9;
  }
  return result;
}

id sub_24A017524(void **a1, uint64_t a2, void *a3, uint64_t a4)
{
  void *v7;
  id result;
  id v9;
  unsigned __int8 v10;

  if ((unint64_t)(a4 - 1) >= 3)
  {
    result = (id)sub_24A01F3C0();
    __break(1u);
  }
  else
  {
    v10 = 2;
    v7 = *a1;
    if (*a1)
      swift_unknownObjectRetain();
    v9 = v7;
    sub_249FEFD9C(&v9, a2, a3, &v10, 0, 1);
    result = v7;
    *a1 = v7;
  }
  return result;
}

id sub_24A017610(void **a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  id result;
  id v11;
  unsigned __int8 v12;

  if ((unint64_t)(a4 - 1) >= 3)
  {
    result = (id)sub_24A01F3C0();
    __break(1u);
  }
  else
  {
    v12 = 2;
    v9 = *a1;
    if (*a1)
      swift_unknownObjectRetain();
    v11 = v9;
    sub_249FEFD9C(&v11, a2, a3, &v12, a5, 0);
    result = v9;
    *a1 = v9;
  }
  return result;
}

BOOL static VUGalleryTransaction.Priority.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t VUGalleryTransaction.Priority.hash(into:)()
{
  return sub_24A01F4F8();
}

uint64_t VUGalleryTransaction.Priority.hashValue.getter()
{
  sub_24A01F4EC();
  sub_24A01F4F8();
  return sub_24A01F528();
}

void sub_24A0177A4(void *a1, uint64_t a2, char *a3, uint64_t a4, int a5)
{
  uint64_t v5;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
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
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  id v62;
  void *v63;
  unint64_t v64;
  id v65;
  void *v66;
  char *v67;
  uint64_t v68;
  _BOOL4 v69;
  unint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  _BYTE *v74;
  uint64_t v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  id v103;
  uint64_t v104;
  unint64_t v105;
  NSObject *v106;
  unint64_t v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t, uint64_t);
  int v122;
  id v123;
  NSObject *v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  NSObject *v132;
  unint64_t v133;
  uint64_t v134;
  id v135;
  void *v136;
  NSObject *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  NSObject *v143;
  os_log_type_t v144;
  uint8_t *v145;
  _BYTE *v146;
  uint64_t v147;
  os_log_type_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  NSObject *v154;
  os_log_type_t v155;
  uint8_t *v156;
  _BYTE *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  uint64_t (*v165)(uint64_t, uint64_t, uint64_t);
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unsigned int v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  NSObject *v178;
  os_log_type_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  BOOL v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  uint64_t v197;
  NSObject *v198;
  os_log_type_t v199;
  uint8_t *v200;
  _BYTE *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  char *v209;
  uint64_t v210;
  NSObject *v211;
  uint64_t v212;
  uint64_t v213;
  NSObject *v214;
  uint64_t v215;
  char *v216;
  uint64_t v217;
  int v218;
  unint64_t v219;
  os_log_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226[3];
  uint64_t v227;
  char v228;
  int v229;
  char v230;
  char v231;

  v218 = a5;
  v217 = a4;
  v9 = sub_24A01EDCC();
  v220 = *(os_log_t *)(v9 - 8);
  v221 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v214 = ((char *)&v202 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = MEMORY[0x24BDAC7A8](v10);
  v216 = (char *)&v202 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v202 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v211 = ((char *)&v202 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = MEMORY[0x24BDAC7A8](v17);
  v212 = (uint64_t)&v202 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v215 = (uint64_t)&v202 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v202 - v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA288);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v27 = MEMORY[0x24BDAC7A8](v26);
  MEMORY[0x24BDAC7A8](v27);
  v29 = MEMORY[0x24BDAC7A8]((char *)&v202 - v28);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v35 = (char *)&v202 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33);
  v38 = (char *)&v202 - v37;
  v39 = MEMORY[0x24BDAC7A8](v36);
  v47 = (char *)&v202 - v43;
  v48 = *(_QWORD *)(v5 + 24);
  if (!v48)
  {
    v51 = sub_24A01ED90();
    v52 = sub_24A01F0E4();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_249F70000, v51, v52, "Bad internal state: gallery is not available", v53, 2u);
      MEMORY[0x24BD07950](v53, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v54 = 4;
    swift_willThrow();
    return;
  }
  v203 = v42;
  v206 = v41;
  v204 = v40;
  v205 = v39;
  v209 = v35;
  v207 = v46;
  v210 = v45;
  v208 = v44;
  v222 = v5;
  v231 = *a3;
  v49 = *(unsigned __int8 *)(v48 + OBJC_IVAR____TtC19VisualUnderstanding9VUGallery_client);
  v213 = a2;
  sub_249F9905C(a2, (uint64_t)&v202 - v43, &qword_2544CA288);
  v223 = v48;
  if (v49)
  {
    swift_retain();
    sub_249F990A0((uint64_t)v47, &qword_2544CA288);
    v50 = v222;
    goto LABEL_12;
  }
  sub_24A01B6FC((uint64_t)v47, (uint64_t)v38);
  v55 = type metadata accessor for VUGallery.Context(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 48))(v38, 1, v55) == 1)
  {
    swift_retain();
    sub_249F990A0((uint64_t)v38, &qword_2544CA288);
    v56 = sub_24A01EBA4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v24, 1, 1, v56);
    v50 = v222;
LABEL_10:
    sub_249F990A0((uint64_t)v24, &qword_2544CAD70);
    v231 = 1;
    goto LABEL_12;
  }
  sub_249F9905C((uint64_t)&v38[*(int *)(v55 + 20)], (uint64_t)v24, &qword_2544CAD70);
  swift_retain();
  sub_24A01B664((uint64_t)v38);
  v57 = sub_24A01EBA4();
  v58 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 48))(v24, 1, v57);
  v50 = v222;
  if (v58 == 1)
    goto LABEL_10;
  sub_249F990A0((uint64_t)v24, &qword_2544CAD70);
LABEL_12:
  v227 = 0;
  v228 = 1;
  objc_opt_self();
  v59 = swift_dynamicCastObjCClass();
  if (!v59)
  {
    objc_opt_self();
    v75 = swift_dynamicCastObjCClass();
    if (v75)
    {
      v76 = (void *)v75;
      v77 = a1;
      v78 = objc_msgSend(v76, sel_animalprint);
      if (v78)
      {
        v79 = v78;
        LODWORD(v224) = 0;
        v80 = (uint64_t)objc_msgSend(v76, sel_labels);
        sub_249F990DC(0, &qword_2578FFE58);
        v81 = sub_24A01EF88();

        v214 = v79;
        if (v81 >> 62)
          goto LABEL_124;
        v82 = *(_QWORD *)((v81 & 0xFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_27;
      }
      v143 = sub_24A01ED90();
      v144 = sub_24A01F0E4();
      if (os_log_type_enabled(v143, v144))
      {
        v145 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v145 = 0;
        _os_log_impl(&dword_249F70000, v143, v144, "Unable to add observation: observation has no animalprint", v145, 2u);
        MEMORY[0x24BD07950](v145, -1, -1);
      }

      sub_249F74AF4();
      swift_allocError();
      *v146 = 1;
      swift_willThrow();

    }
    else
    {
      objc_opt_self();
      v134 = swift_dynamicCastObjCClass();
      if (v134)
      {
        v82 = v134;
        v80 = a1;
        v135 = objc_msgSend((id)v82, sel_sceneprints);
        if (v135)
        {
          v136 = v135;
          sub_249F990DC(0, &qword_2578FFE50);
          v81 = sub_24A01EF88();

          if (v81 >> 62)
            goto LABEL_126;
          if (*(_QWORD *)((v81 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_78;
LABEL_127:
          swift_bridgeObjectRelease();
        }
        v198 = sub_24A01ED90();
        v199 = sub_24A01F0E4();
        if (os_log_type_enabled(v198, v199))
        {
          v200 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v200 = 0;
          _os_log_impl(&dword_249F70000, v198, v199, "Unable to add observation: observation has no sceneprint", v200, 2u);
          MEMORY[0x24BD07950](v200, -1, -1);
        }

        sub_249F74AF4();
        swift_allocError();
        *v201 = 1;
        swift_willThrow();

      }
      else
      {
        v154 = sub_24A01ED90();
        v155 = sub_24A01F0E4();
        if (os_log_type_enabled(v154, v155))
        {
          v156 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v156 = 0;
          _os_log_impl(&dword_249F70000, v154, v155, "Unable to add the observation: given observation is not of type VNAnimalObservation, VNFaceObservation or VNSceneObservation", v156, 2u);
          MEMORY[0x24BD07950](v156, -1, -1);
        }

        sub_249F74AF4();
        swift_allocError();
        *v157 = 1;
        swift_willThrow();
      }
    }
    goto LABEL_116;
  }
  v60 = (void *)v59;
  v61 = a1;
  v62 = objc_msgSend(v60, sel_faceTorsoprint);
  if (!v62
    || (v63 = v62,
        v64 = (unint64_t)objc_msgSend(v62, sel_faceprint),
        v63,
        !v64))
  {
    v64 = (unint64_t)objc_msgSend(v60, sel_faceprint);
  }
  v65 = objc_msgSend(v60, sel_faceTorsoprint);
  if (v65)
  {
    v66 = v65;
    v67 = (char *)objc_msgSend(v65, sel_torsoprint);

    if (v67)
    {
      v216 = v67;
      v68 = v50;
      v214 = v61;
      v69 = 0;
      LODWORD(v212) = v64 == 0;
      goto LABEL_49;
    }
  }
  v70 = (unint64_t)objc_msgSend(v60, sel_torsoprint);
  v69 = v70 == 0;
  if (!(v64 | v70))
  {
    v71 = sub_24A01ED90();
    v72 = sub_24A01F0E4();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_249F70000, v71, v72, "Unable to add observation: observation is missing at least a faceprint or a torsoprint", v73, 2u);
      MEMORY[0x24BD07950](v73, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v74 = 1;
    swift_willThrow();

LABEL_116:
    swift_release();
    return;
  }
  LODWORD(v212) = v64 == 0;
  v216 = (char *)v70;
  v68 = v50;
  v214 = v61;
LABEL_49:
  v99 = sub_24A01F15C();
  v229 = v99;
  v230 = BYTE4(v99) & 1;
  v100 = v223;
  v101 = sub_24A01EDC0();
  MEMORY[0x24BDAC7A8](v101);
  *(&v202 - 10) = v100;
  *(&v202 - 9) = v68;
  *(&v202 - 8) = v64;
  v102 = v64;
  v103 = v216;
  v104 = v213;
  *(&v202 - 7) = (uint64_t)v216;
  *(&v202 - 6) = v104;
  *(&v202 - 5) = (uint64_t)&v229;
  *(&v202 - 4) = (uint64_t)&v231;
  *(&v202 - 3) = v217;
  *((_BYTE *)&v202 - 16) = v218 & 1;
  v105 = v219;
  sub_24A01F12C();
  if (v105)
  {
    ((void (*)(char *, uint64_t))v220[1].isa)(v15, v221);
    swift_release();

    v106 = v214;
LABEL_73:

    return;
  }
  v211 = v102;
  v219 = 0;
  ((void (*)(char *, uint64_t))v220[1].isa)(v15, v221);
  v221 = v226[0];
  v227 = v226[0];
  v228 = 0;
  if (v69)
    v107 = 0xE900000000000079;
  else
    v107 = 0xEA00000000006F73;
  v108 = v212;
  if ((_DWORD)v212)
    v80 = 0xEA0000000000796CLL;
  else
    v80 = v107;
  v109 = v68;
  v110 = (uint64_t)v209;
  sub_249F9905C(v104, (uint64_t)v209, &qword_2544CA288);
  v111 = v104;
  v112 = v210;
  sub_249F9905C(v111, v210, &qword_2544CA288);
  swift_bridgeObjectRetain();
  v77 = sub_24A01ED90();
  v113 = sub_24A01F0D8();
  if (!os_log_type_enabled(v77, (os_log_type_t)v113))
  {
    sub_249F990A0(v112, &qword_2544CA288);
    swift_bridgeObjectRelease_n();

    sub_249F990A0(v110, &qword_2544CA288);
    v130 = v109;
    goto LABEL_114;
  }
  v218 = v113;
  v220 = v77;
  v114 = 0x726F742B65636166;
  if (v69)
    v114 = 0x6C6E6F2D65636166;
  if (v108)
    v115 = 0x6E6F2D6F73726F74;
  else
    v115 = v114;
  v116 = swift_slowAlloc();
  v217 = swift_slowAlloc();
  v226[0] = v217;
  *(_DWORD *)v116 = 136316162;
  swift_beginAccess();
  if (v231)
    v117 = 0x7261646E6F636573;
  else
    v117 = 0x7972616D697270;
  if (v231)
    v118 = 0xE900000000000079;
  else
    v118 = 0xE700000000000000;
  v224 = sub_249F8AAE8(v117, v118, v226);
  sub_24A01F1F8();
  swift_bridgeObjectRelease();
  *(_WORD *)(v116 + 12) = 2080;
  swift_bridgeObjectRetain();
  v224 = sub_249F8AAE8(v115, v80, v226);
  sub_24A01F1F8();
  swift_bridgeObjectRelease_n();
  *(_WORD *)(v116 + 22) = 2048;
  v224 = v221;
  sub_24A01F1F8();
  *(_WORD *)(v116 + 32) = 2080;
  v119 = v206;
  sub_249F9905C(v110, v206, &qword_2544CA288);
  v120 = type metadata accessor for VUGallery.Context(0);
  v121 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v120 - 8) + 48);
  v122 = v121(v119, 1, v120);
  v123 = v216;
  v124 = v211;
  if (v122 == 1)
  {
    v125 = &qword_2544CA288;
    v126 = v119;
  }
  else
  {
    v158 = v215;
    sub_249F9905C(v119 + *(int *)(v120 + 20), v215, &qword_2544CAD70);
    sub_24A01B664(v119);
    v159 = sub_24A01EBA4();
    v160 = *(_QWORD *)(v159 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v160 + 48))(v158, 1, v159) != 1)
    {
      v164 = v123;
      v165 = v121;
      v166 = v158;
      v162 = sub_24A01EB74();
      v161 = v167;
      v168 = v166;
      v121 = v165;
      v123 = v164;
      v124 = v211;
      (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v168, v159);
      goto LABEL_99;
    }
    v125 = &qword_2544CAD70;
    v126 = v158;
  }
  sub_249F990A0(v126, v125);
  v161 = 0xE200000000000000;
  v162 = 16718;
LABEL_99:
  v224 = sub_249F8AAE8(v162, v161, v226);
  sub_24A01F1F8();
  swift_bridgeObjectRelease();
  sub_249F990A0((uint64_t)v209, &qword_2544CA288);
  *(_WORD *)(v116 + 42) = 2048;
  v169 = v207;
  sub_249F9905C(v210, v207, &qword_2544CA288);
  if (v121(v169, 1, v120) == 1)
  {
    sub_249F990A0(v169, &qword_2544CA288);
    v170 = 2;
  }
  else
  {
    v171 = *(unsigned __int8 *)(v169 + *(int *)(v120 + 24));
    sub_24A01B664(v169);
    if (v171 == 3)
      v170 = 2;
    else
      v170 = v171;
  }
  v130 = v222;
  v77 = v214;
  sub_249F990A0(v210, &qword_2544CA288);
  v224 = v170;
  sub_24A01F1F8();
  v80 = (uint64_t)v220;
  _os_log_impl(&dword_249F70000, v220, (os_log_type_t)v218, "Added %s %s observation %ld for asset %s, source %ld", (uint8_t *)v116, 0x34u);
  v172 = v217;
  swift_arrayDestroy();
  MEMORY[0x24BD07950](v172, -1, -1);
  MEMORY[0x24BD07950](v116, -1, -1);

  while (1)
  {
    while (1)
    {
LABEL_114:
      v186 = *(_QWORD *)(v130 + 32);
      v187 = __OFADD__(v186, 1);
      v188 = v186 + 1;
      v81 = v219;
      if (!v187)
      {
        *(_QWORD *)(v130 + 32) = v188;
        swift_beginAccess();
        if ((v228 & 1) != 0)
          goto LABEL_133;
        goto LABEL_116;
      }
      __break(1u);
LABEL_124:
      swift_bridgeObjectRetain();
      v82 = sub_24A01F3CC();
      swift_bridgeObjectRelease();
LABEL_27:
      v211 = v77;
      if (v82)
        break;
LABEL_71:
      swift_bridgeObjectRelease();
      v127 = v223;
      v128 = v216;
      v129 = sub_24A01EDC0();
      MEMORY[0x24BDAC7A8](v129);
      v130 = v222;
      *(&v202 - 8) = v127;
      *(&v202 - 7) = v130;
      v131 = v213;
      v132 = v214;
      *(&v202 - 6) = (uint64_t)v214;
      *(&v202 - 5) = v131;
      *(&v202 - 4) = (uint64_t)&v224;
      *(&v202 - 3) = (uint64_t)&v231;
      *(&v202 - 2) = v217;
      *((_BYTE *)&v202 - 8) = v218 & 1;
      v133 = v219;
      sub_24A01F12C();
      if (v133)
      {
        ((void (*)(char *, uint64_t))v220[1].isa)(v128, v221);
        swift_release();

        v106 = v211;
        goto LABEL_73;
      }
      v219 = 0;
      ((void (*)(char *, uint64_t))v220[1].isa)(v128, v221);
      v80 = v226[0];
      v227 = v226[0];
      v228 = 0;
      v147 = v208;
      sub_249F9905C(v131, v208, &qword_2544CA288);
      v77 = sub_24A01ED90();
      v148 = sub_24A01F0D8();
      if (!os_log_type_enabled(v77, v148))
      {

        v163 = v147;
        goto LABEL_97;
      }
      v149 = swift_slowAlloc();
      v150 = swift_slowAlloc();
      v226[0] = v150;
      *(_DWORD *)v149 = 134218242;
      v225 = v80;
      sub_24A01F1F8();
      *(_WORD *)(v149 + 12) = 2080;
      v151 = v205;
      sub_249F9905C(v147, v205, &qword_2544CA288);
      v152 = type metadata accessor for VUGallery.Context(0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v152 - 8) + 48))(v151, 1, v152) == 1)
      {
        sub_249F990A0(v151, &qword_2544CA288);
        v153 = 0xE200000000000000;
        v80 = 16718;
      }
      else
      {
        v173 = v212;
        sub_249F9905C(v151 + *(int *)(v152 + 20), v212, &qword_2544CAD70);
        sub_24A01B664(v151);
        v174 = sub_24A01EBA4();
        v175 = *(_QWORD *)(v174 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v175 + 48))(v173, 1, v174) == 1)
        {
          sub_249F990A0(v173, &qword_2544CAD70);
          v153 = 0xE200000000000000;
          v80 = 16718;
        }
        else
        {
          v80 = sub_24A01EB74();
          v153 = v185;
          (*(void (**)(uint64_t, uint64_t))(v175 + 8))(v173, v174);
        }
        v132 = v214;
      }
      v225 = sub_249F8AAE8(v80, v153, v226);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      sub_249F990A0(v208, &qword_2544CA288);
      _os_log_impl(&dword_249F70000, v77, v148, "Added animal observation %ld for asset %s", (uint8_t *)v149, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24BD07950](v150, -1, -1);
      MEMORY[0x24BD07950](v149, -1, -1);

LABEL_113:
      v130 = v222;
    }
    if (v82 >= 1)
    {
      v83 = 0;
      v215 = *MEMORY[0x24BDF9D80];
      while (1)
      {
        if ((v81 & 0xC000000000000001) != 0)
          v84 = (id)MEMORY[0x24BD071F4](v83, v81);
        else
          v84 = *(id *)(v81 + 8 * v83 + 32);
        v85 = v84;
        v86 = objc_msgSend(v84, sel_identifier);
        v87 = sub_24A01EE68();
        v89 = v88;

        if (v87 == sub_24A01EE68() && v89 == v90)
        {

          swift_bridgeObjectRelease_n();
        }
        else
        {
          v92 = sub_24A01F45C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v92 & 1) != 0)
          {

          }
          else
          {
            v93 = objc_msgSend(v85, sel_identifier);
            v94 = sub_24A01EE68();
            v96 = v95;

            if (v94 == sub_24A01EE68() && v96 == v97)
            {
              swift_bridgeObjectRelease_n();

            }
            else
            {
              v98 = sub_24A01F45C();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();

              if ((v98 & 1) == 0)
                goto LABEL_41;
            }
          }
        }
        LODWORD(v224) = 1065353216;
LABEL_41:
        if (v82 == ++v83)
          goto LABEL_71;
      }
    }
    __break(1u);
LABEL_126:
    swift_bridgeObjectRetain();
    v197 = sub_24A01F3CC();
    swift_bridgeObjectRelease();
    if (!v197)
      goto LABEL_127;
LABEL_78:
    if ((v81 & 0xC000000000000001) != 0)
    {
      v77 = MEMORY[0x24BD071F4](0, v81);
      v137 = v214;
      goto LABEL_81;
    }
    v137 = v214;
    if (!*(_QWORD *)((v81 & 0xFFFFFFFFFFFFF8) + 0x10))
      break;
    v77 = *(id *)(v81 + 32);
LABEL_81:
    swift_bridgeObjectRelease();
    v138 = v223;
    v139 = sub_24A01EDC0();
    MEMORY[0x24BDAC7A8](v139);
    v140 = v222;
    *(&v202 - 8) = v138;
    *(&v202 - 7) = v140;
    v141 = v213;
    *(&v202 - 6) = (uint64_t)v77;
    *(&v202 - 5) = v141;
    *(&v202 - 4) = v82;
    *(&v202 - 3) = (uint64_t)&v231;
    *(&v202 - 2) = v217;
    *((_BYTE *)&v202 - 8) = v218 & 1;
    v142 = v219;
    sub_24A01F12C();
    if (v142)
    {
      ((void (*)(NSObject *, uint64_t))v220[1].isa)(v137, v221);
      swift_release();

      return;
    }
    v219 = 0;
    ((void (*)(NSObject *, uint64_t))v220[1].isa)(v137, v221);
    v176 = v226[0];
    v227 = v226[0];
    v228 = 0;
    v177 = v204;
    sub_249F9905C(v141, v204, &qword_2544CA288);
    v178 = sub_24A01ED90();
    v179 = sub_24A01F0D8();
    if (os_log_type_enabled(v178, v179))
    {
      v180 = swift_slowAlloc();
      v221 = swift_slowAlloc();
      v226[0] = v221;
      *(_DWORD *)v180 = 134218242;
      v225 = v176;
      sub_24A01F1F8();
      *(_WORD *)(v180 + 12) = 2080;
      v181 = v203;
      sub_249F9905C(v177, v203, &qword_2544CA288);
      v182 = type metadata accessor for VUGallery.Context(0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v182 - 8) + 48))(v181, 1, v182) == 1)
      {
        v183 = &qword_2544CA288;
        v184 = v181;
        goto LABEL_120;
      }
      v189 = v181 + *(int *)(v182 + 20);
      v190 = (char *)v211;
      sub_249F9905C(v189, (uint64_t)v211, &qword_2544CAD70);
      sub_24A01B664(v181);
      v191 = sub_24A01EBA4();
      v192 = *(_QWORD *)(v191 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v192 + 48))(v190, 1, v191) == 1)
      {
        v183 = &qword_2544CAD70;
        v184 = (uint64_t)v190;
LABEL_120:
        sub_249F990A0(v184, v183);
        v193 = 0xE200000000000000;
        v194 = 16718;
      }
      else
      {
        v194 = sub_24A01EB74();
        v193 = v195;
        (*(void (**)(NSObject *, uint64_t))(v192 + 8))(v211, v191);
      }
      v225 = sub_249F8AAE8(v194, v193, v226);
      sub_24A01F1F8();
      swift_bridgeObjectRelease();
      sub_249F990A0(v204, &qword_2544CA288);
      _os_log_impl(&dword_249F70000, v178, v179, "Added scene observation %ld for asset %s", (uint8_t *)v180, 0x16u);
      v196 = v221;
      swift_arrayDestroy();
      MEMORY[0x24BD07950](v196, -1, -1);
      MEMORY[0x24BD07950](v180, -1, -1);

      goto LABEL_113;
    }
    v130 = v140;

    v163 = v177;
LABEL_97:
    sub_249F990A0(v163, &qword_2544CA288);
  }
  __break(1u);
LABEL_133:
  __break(1u);
}

uint64_t sub_24A01909C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t **a9@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  unsigned int v28;
  id v29;
  void *v30;
  uint64_t *v31;
  unint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unsigned int (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  uint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t result;
  unint64_t v53;
  uint64_t **v54;
  uint64_t *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t *v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  char v68;
  char v69;
  char v70;

  v64 = a8;
  v62 = a6;
  v63 = a7;
  v67 = a4;
  v54 = a9;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA288);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v54 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v54 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v54 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v54 - v26;
  v28 = *(unsigned __int8 *)(a2 + 16);
  v66 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  v61 = v28;
  if (a3)
  {
    swift_retain();
    v29 = objc_msgSend(a3, sel_descriptorData);
    if (v29)
    {
      v30 = v29;
      v31 = (uint64_t *)sub_24A01EAFC();
      v59 = v32;
      v60 = v31;

    }
    else
    {
      v59 = 0xF000000000000000;
      v60 = 0;
    }
    v33 = objc_msgSend(a3, sel_requestRevision, v54);
  }
  else
  {
    swift_retain();
    v33 = 0;
    v59 = 0xF000000000000000;
    v60 = 0;
  }
  v58 = (uint64_t)v33;
  if (v67)
  {
    v34 = objc_msgSend(v67, sel_descriptorData);
    if (v34)
    {
      v35 = v34;
      v36 = sub_24A01EAFC();
      v56 = v37;
      v57 = v36;

    }
    else
    {
      v56 = 0xF000000000000000;
      v57 = 0;
    }
    v55 = (uint64_t *)objc_msgSend(v67, sel_requestRevision, v54);
  }
  else
  {
    v57 = 0;
    v55 = 0;
    v56 = 0xF000000000000000;
  }
  sub_249F9905C(a5, (uint64_t)v21, &qword_2544CA288);
  v38 = type metadata accessor for VUGallery.Context(0);
  v39 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 48);
  if (v39(v21, 1, v38) == 1)
  {
    sub_249F990A0((uint64_t)v21, &qword_2544CA288);
    v40 = sub_24A01EBA4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v27, 1, 1, v40);
  }
  else
  {
    sub_249F9905C((uint64_t)v21, (uint64_t)v27, &qword_2544CAD70);
    sub_24A01B664((uint64_t)v21);
  }
  sub_249F9905C(a5, (uint64_t)v19, &qword_2544CA288);
  if (v39(v19, 1, v38) == 1)
  {
    sub_249F990A0((uint64_t)v19, &qword_2544CA288);
    v41 = sub_24A01EBA4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v25, 1, 1, v41);
  }
  else
  {
    sub_249F9905C((uint64_t)&v19[*(int *)(v38 + 20)], (uint64_t)v25, &qword_2544CAD70);
    sub_24A01B664((uint64_t)v19);
  }
  sub_249F9905C(a5, (uint64_t)v16, &qword_2544CA288);
  if (v39(v16, 1, v38) == 1)
  {
    sub_249F990A0((uint64_t)v16, &qword_2544CA288);
    v70 = 3;
    if (a3)
    {
LABEL_21:
      objc_msgSend(a3, sel_confidence, v54);
      v43 = v42;
      goto LABEL_24;
    }
  }
  else
  {
    v44 = v16[*(int *)(v38 + 24)];
    sub_24A01B664((uint64_t)v16);
    v70 = v44;
    if (a3)
      goto LABEL_21;
  }
  v43 = 0;
LABEL_24:
  v45 = v65;
  v46 = *(_BYTE *)(v62 + 4);
  v69 = a3 == 0;
  v68 = v46;
  v53 = v43 | ((unint64_t)(a3 == 0) << 32);
  v48 = v59;
  v47 = v60;
  v50 = v56;
  v49 = v57;
  v51 = sub_249FE1C30(2u, v61, v60, v59, v58, v69, v57, v56, v55, v67 == 0, (uint64_t)v27, (uint64_t)v25, (uint64_t)&v70, v53);
  swift_release();
  sub_249F92438(v49, v50);
  sub_249F92438((uint64_t)v47, v48);
  sub_249F990A0((uint64_t)v25, &qword_2544CAD70);
  result = sub_249F990A0((uint64_t)v27, &qword_2544CAD70);
  if (!v45)
    *v54 = v51;
  return result;
}

id sub_24A019540@<X0>(uint64_t a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, int a7@<W7>, uint64_t **a8@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  id result;
  void *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t **v40;
  id v41;
  unint64_t v42;
  uint64_t *v43;
  id v44;
  int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  char v53;

  v49 = a6;
  v45 = a7;
  v47 = a4;
  v48 = a5;
  v40 = a8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA288);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v40 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v40 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v40 - v24;
  v46 = *(unsigned __int8 *)(a1 + 16);
  swift_retain();
  result = objc_msgSend(a2, sel_descriptorData);
  if (result)
  {
    v27 = result;
    v28 = (uint64_t *)sub_24A01EAFC();
    v42 = v29;
    v43 = v28;

    v44 = a2;
    v41 = objc_msgSend(a2, sel_requestRevision);
    sub_249F9905C(a3, (uint64_t)v19, &qword_2544CA288);
    v30 = type metadata accessor for VUGallery.Context(0);
    v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48);
    if (v31(v19, 1, v30) == 1)
    {
      sub_249F990A0((uint64_t)v19, &qword_2544CA288);
      v32 = sub_24A01EBA4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v25, 1, 1, v32);
    }
    else
    {
      sub_249F9905C((uint64_t)v19, (uint64_t)v25, &qword_2544CAD70);
      sub_24A01B664((uint64_t)v19);
    }
    sub_249F9905C(a3, (uint64_t)v17, &qword_2544CA288);
    if (v31(v17, 1, v30) == 1)
    {
      sub_249F990A0((uint64_t)v17, &qword_2544CA288);
      v33 = sub_24A01EBA4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v23, 1, 1, v33);
    }
    else
    {
      sub_249F9905C((uint64_t)&v17[*(int *)(v30 + 20)], (uint64_t)v23, &qword_2544CAD70);
      sub_24A01B664((uint64_t)v17);
    }
    sub_249F9905C(a3, (uint64_t)v14, &qword_2544CA288);
    if (v31(v14, 1, v30) == 1)
    {
      sub_249F990A0((uint64_t)v14, &qword_2544CA288);
      v34 = 3;
    }
    else
    {
      v34 = v14[*(int *)(v30 + 24)];
      sub_24A01B664((uint64_t)v14);
    }
    v35 = v50;
    v53 = v34;
    objc_msgSend(v44, sel_confidence, v40);
    v52 = 0;
    v51 = 0;
    v38 = v42;
    v37 = v43;
    v39 = sub_249FE1C30(0x3Fu, v46, v43, v42, (uint64_t)v41, 0, 0, 0xF000000000000000, 0, 1, (uint64_t)v25, (uint64_t)v23, (uint64_t)&v53, v36);
    swift_release();
    sub_249F92358((uint64_t)v37, v38);
    sub_249F990A0((uint64_t)v23, &qword_2544CAD70);
    result = (id)sub_249F990A0((uint64_t)v25, &qword_2544CAD70);
    if (!v35)
      *v40 = v39;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_24A019930@<X0>(uint64_t a1@<X1>, void *a2@<X2>, uint64_t a3@<X3>, void *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, int a7@<W7>, uint64_t **a8@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  id result;
  void *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t **v41;
  id v42;
  unint64_t v43;
  uint64_t *v44;
  int v45;
  unsigned int v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  char v53;

  v49 = a6;
  v45 = a7;
  v47 = a4;
  v48 = a5;
  v41 = a8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA288);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v40 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v40 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v40 - v24;
  v46 = *(unsigned __int8 *)(a1 + 16);
  swift_retain();
  result = objc_msgSend(a2, sel_descriptorData);
  if (result)
  {
    v27 = result;
    v28 = (uint64_t *)sub_24A01EAFC();
    v43 = v29;
    v44 = v28;

    v42 = objc_msgSend(a2, sel_requestRevision);
    sub_249F9905C(a3, (uint64_t)v19, &qword_2544CA288);
    v30 = type metadata accessor for VUGallery.Context(0);
    v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48);
    if (v31(v19, 1, v30) == 1)
    {
      sub_249F990A0((uint64_t)v19, &qword_2544CA288);
      v32 = sub_24A01EBA4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v25, 1, 1, v32);
    }
    else
    {
      sub_249F9905C((uint64_t)v19, (uint64_t)v25, &qword_2544CAD70);
      sub_24A01B664((uint64_t)v19);
    }
    sub_249F9905C(a3, (uint64_t)v17, &qword_2544CA288);
    if (v31(v17, 1, v30) == 1)
    {
      sub_249F990A0((uint64_t)v17, &qword_2544CA288);
      v33 = sub_24A01EBA4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v23, 1, 1, v33);
    }
    else
    {
      sub_249F9905C((uint64_t)&v17[*(int *)(v30 + 20)], (uint64_t)v23, &qword_2544CAD70);
      sub_24A01B664((uint64_t)v17);
    }
    sub_249F9905C(a3, (uint64_t)v14, &qword_2544CA288);
    if (v31(v14, 1, v30) == 1)
    {
      sub_249F990A0((uint64_t)v14, &qword_2544CA288);
      v34 = 3;
    }
    else
    {
      v34 = v14[*(int *)(v30 + 24)];
      sub_24A01B664((uint64_t)v14);
    }
    v35 = v50;
    v53 = v34;
    objc_msgSend(v47, sel_confidence);
    v52 = 0;
    v51 = 0;
    v38 = v43;
    v37 = v44;
    v39 = sub_249FE1C30(6u, v46, v44, v43, (uint64_t)v42, 0, 0, 0xF000000000000000, 0, 1, (uint64_t)v25, (uint64_t)v23, (uint64_t)&v53, v36);
    swift_release();
    sub_249F92358((uint64_t)v37, v38);
    sub_249F990A0((uint64_t)v23, &qword_2544CAD70);
    result = (id)sub_249F990A0((uint64_t)v25, &qword_2544CAD70);
    if (!v35)
      *v41 = v39;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_24A019D20(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v4;

  v4 = 0;
  sub_24A0177A4(a1, a2, &v4, a3, a4 & 1);
}

void sub_24A019D50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _BYTE *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD v20[2];

  v4 = sub_24A01EDCC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 24);
  if (v8)
  {
    swift_retain();
    v9 = sub_24A01EDC0();
    MEMORY[0x24BDAC7A8](v9);
    v20[-2] = v8;
    v20[-1] = a1;
    sub_24A01F12C();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v14 = *(_QWORD *)(v1 + 40);
      v15 = __OFADD__(v14, 1);
      v16 = v14 + 1;
      if (v15)
      {
        __break(1u);
      }
      else
      {
        *(_QWORD *)(v1 + 40) = v16;
        v17 = sub_24A01ED90();
        v18 = sub_24A01F0D8();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v19 = 134217984;
          v20[1] = a1;
          sub_24A01F1F8();
          _os_log_impl(&dword_249F70000, v17, v18, "Removed observation %ld", v19, 0xCu);
          MEMORY[0x24BD07950](v19, -1, -1);
        }
        swift_release();

      }
    }
  }
  else
  {
    v10 = sub_24A01ED90();
    v11 = sub_24A01F0E4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_249F70000, v10, v11, "Bad internal state: gallery is not available", v12, 2u);
      MEMORY[0x24BD07950](v12, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v13 = 4;
    swift_willThrow();
  }
}

void sub_24A019FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE1768];
  *(_OWORD *)(v4 + 16) = xmmword_24A0208B0;
  v6 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 32) = a2;
  swift_retain();
  v8 = (void *)sub_24A01F09C();
  v7 = *(id *)(v3 + 16);
  sub_24A01F180();
  swift_release();

}

void sub_24A01A0E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD v21[2];

  v4 = sub_24A01EDCC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 24);
  if (v8)
  {
    swift_retain();
    v9 = sub_24A01EDC0();
    MEMORY[0x24BDAC7A8](v9);
    v21[-2] = v8;
    v21[-1] = a1;
    sub_24A01F12C();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v14 = *(_QWORD *)(a1 + 16);
      v15 = *(_QWORD *)(v1 + 40);
      v16 = __OFADD__(v15, v14);
      v17 = v15 + v14;
      if (v16)
      {
        __break(1u);
      }
      else
      {
        *(_QWORD *)(v1 + 40) = v17;
        swift_bridgeObjectRetain();
        v18 = sub_24A01ED90();
        v19 = sub_24A01F0D8();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v20 = 134217984;
          v21[1] = v14;
          sub_24A01F1F8();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_249F70000, v18, v19, "Removed %ld observations", v20, 0xCu);
          MEMORY[0x24BD07950](v20, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        swift_release();

      }
    }
  }
  else
  {
    v10 = sub_24A01ED90();
    v11 = sub_24A01F0E4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_249F70000, v10, v11, "Bad internal state: gallery is not available", v12, 2u);
      MEMORY[0x24BD07950](v12, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v13 = 4;
    swift_willThrow();
  }
}

void sub_24A01A38C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_24A0208B0;
  *(_QWORD *)(v4 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA2D0);
  *(_QWORD *)(v4 + 64) = sub_24A01BC28();
  *(_QWORD *)(v4 + 32) = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_24A01F09C();
  v5 = *(id *)(v3 + 16);
  sub_24A01F180();
  swift_release();

}

void sub_24A01A4AC(NSObject *a1)
{
  sub_24A01A638(a1, (uint64_t)sub_24A01B774, "Removed observations for asset %s");
}

void sub_24A01A4D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 16);
  v4 = *(unsigned __int8 *)(a3 + 16);
  sub_249F990DC(0, (unint64_t *)&qword_2544CACD0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544CACE0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_24A0208C0;
  swift_retain();
  v6 = sub_24A01EB74();
  v8 = v7;
  *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v5 + 64) = sub_249FE1970();
  v9 = MEMORY[0x24BEE3F30];
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v8;
  v10 = MEMORY[0x24BEE3F78];
  *(_QWORD *)(v5 + 96) = v9;
  *(_QWORD *)(v5 + 104) = v10;
  *(_WORD *)(v5 + 72) = v4;
  v12 = (void *)sub_24A01F09C();
  v11 = *(id *)(v3 + 16);
  sub_24A01F180();
  swift_release();

}

void sub_24A01A614(NSObject *a1)
{
  sub_24A01A638(a1, (uint64_t)sub_24A01B790, "Removed all tags with UUID %s and all tagged observations without an associated asset");
}

void sub_24A01A638(NSObject *a1, uint64_t a2, const char *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint8_t *v13;
  uint64_t v14;
  os_log_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _BYTE *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  os_log_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;

  v6 = v3;
  v36 = a1;
  v35 = sub_24A01EBA4();
  v7 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v34 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24A01EDCC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(uint8_t **)(v6 + 24);
  if (v13)
  {
    v32 = a3;
    v33 = v7;
    swift_retain();
    v14 = sub_24A01EDC0();
    MEMORY[0x24BDAC7A8](v14);
    v15 = v36;
    *(&v30 - 4) = v13;
    *(&v30 - 3) = (uint8_t *)v15;
    *(&v30 - 2) = (uint8_t *)v6;
    sub_24A01F12C();
    if (v4)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      v21 = v33;
      v20 = v34;
      v22 = v35;
      (*(void (**)(char *, os_log_t, uint64_t))(v33 + 16))(v34, v36, v35);
      v23 = sub_24A01ED90();
      v24 = sub_24A01F0CC();
      if (os_log_type_enabled(v23, v24))
      {
        v36 = v23;
        v25 = (uint8_t *)swift_slowAlloc();
        v31 = swift_slowAlloc();
        v38 = v31;
        *(_DWORD *)v25 = 136315138;
        v30 = v25 + 4;
        v26 = sub_24A01EB74();
        v37 = sub_249F8AAE8(v26, v27, &v38);
        sub_24A01F1F8();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v21 + 8))(v20, v22);
        v28 = v36;
        _os_log_impl(&dword_249F70000, v36, v24, v32, v25, 0xCu);
        v29 = v31;
        swift_arrayDestroy();
        MEMORY[0x24BD07950](v29, -1, -1);
        MEMORY[0x24BD07950](v25, -1, -1);
        swift_release();

      }
      else
      {
        swift_release();

        (*(void (**)(char *, uint64_t))(v21 + 8))(v20, v22);
      }
    }
  }
  else
  {
    v16 = sub_24A01ED90();
    v17 = sub_24A01F0E4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_249F70000, v16, v17, "Bad internal state: gallery is not available", v18, 2u);
      MEMORY[0x24BD07950](v18, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v19 = 4;
    swift_willThrow();
  }
}

void sub_24A01A9B0(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v2 = v1;
  sub_24A01F180();
  swift_release();

}

BOOL static VUGalleryTransaction.TagType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t VUGalleryTransaction.TagType.hash(into:)()
{
  return sub_24A01F4F8();
}

uint64_t VUGalleryTransaction.TagType.hashValue.getter()
{
  sub_24A01F4EC();
  sub_24A01F4F8();
  return sub_24A01F528();
}

void sub_24A01AABC(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  BOOL v4;
  char v5;
  char v6;
  unsigned __int8 v7;

  v7 = *a3;
  if (*(_BYTE *)(v3 + 16))
    v4 = *(_BYTE *)(v3 + 16) == 5;
  else
    v4 = 1;
  v5 = !v4;
  v6 = v5;
  sub_24A01AAFC(a1, a2, &v7, &v6);
}

void sub_24A01AAFC(uint64_t a1, uint64_t a2, unsigned __int8 *a3, char *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  char v17;
  char v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  char v52;

  v48 = a1;
  v5 = v4;
  v9 = sub_24A01EBA4();
  v46 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24A01EDCC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v5 + 24);
  if (v15)
  {
    v16 = *a3;
    v17 = *a4;
    if ((*a4 & 1) != 0 || !*(_BYTE *)(v5 + 16) || *(_BYTE *)(v5 + 16) == 5)
    {
      v44 = v9;
      v51 = v16;
      if (v16)
      {
        if (v16 == 1)
          v18 = 1;
        else
          v18 = 2;
        v52 = v18;
      }
      else
      {
        v52 = 0;
      }
      swift_retain();
      v23 = sub_24A01EDC0();
      MEMORY[0x24BDAC7A8](v23);
      v25 = v47;
      v24 = v48;
      *(&v43 - 6) = v15;
      *(&v43 - 5) = v24;
      *(&v43 - 4) = a2;
      *(&v43 - 3) = (uint64_t)&v52;
      *((_BYTE *)&v43 - 16) = v17;
      sub_24A01F12C();
      if (v25)
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        swift_release();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        v27 = v45;
        v26 = v46;
        v28 = a2;
        v29 = v44;
        (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v45, v28, v44);
        v30 = sub_24A01ED90();
        v31 = sub_24A01F0CC();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = swift_slowAlloc();
          v33 = swift_slowAlloc();
          v47 = v33;
          *(_DWORD *)v32 = 134218498;
          v49 = v48;
          v50 = v33;
          sub_24A01F1F8();
          *(_WORD *)(v32 + 12) = 2080;
          LOBYTE(v49) = v51;
          v34 = sub_24A01EE74();
          v49 = sub_249F8AAE8(v34, v35, &v50);
          sub_24A01F1F8();
          swift_bridgeObjectRelease();
          *(_WORD *)(v32 + 22) = 2080;
          v36 = sub_24A01EB74();
          v49 = sub_249F8AAE8(v36, v37, &v50);
          sub_24A01F1F8();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v27, v44);
          _os_log_impl(&dword_249F70000, v30, v31, "Tagged observation %ld with %s tag %s", (uint8_t *)v32, 0x20u);
          v38 = v47;
          swift_arrayDestroy();
          MEMORY[0x24BD07950](v38, -1, -1);
          MEMORY[0x24BD07950](v32, -1, -1);
          swift_release();

        }
        else
        {
          swift_release();

          (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v29);
        }
      }
    }
    else
    {
      swift_retain();
      v39 = sub_24A01ED90();
      v40 = sub_24A01F0E4();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_249F70000, v39, v40, "Unable to tag observation: primary tags are currently only supported for Photos", v41, 2u);
        MEMORY[0x24BD07950](v41, -1, -1);
      }

      sub_249F74AF4();
      swift_allocError();
      *v42 = 6;
      swift_willThrow();
      swift_release();
    }
  }
  else
  {
    v19 = sub_24A01ED90();
    v20 = sub_24A01F0E4();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_249F70000, v19, v20, "Bad internal state: gallery is not available", v21, 2u);
      MEMORY[0x24BD07950](v21, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v22 = 4;
    swift_willThrow();
  }
}

void sub_24A01AFF4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v2 = v1;
  sub_24A01F180();
  swift_release();

}

void sub_24A01B08C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _BYTE *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD v17[2];

  v4 = sub_24A01EDCC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + 24);
  if (v8)
  {
    swift_retain();
    v9 = sub_24A01EDC0();
    MEMORY[0x24BDAC7A8](v9);
    v17[-2] = v8;
    v17[-1] = a1;
    sub_24A01F12C();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v14 = sub_24A01ED90();
      v15 = sub_24A01F0CC();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v16 = 134217984;
        v17[1] = a1;
        sub_24A01F1F8();
        _os_log_impl(&dword_249F70000, v14, v15, "Untagged observation %ld", v16, 0xCu);
        MEMORY[0x24BD07950](v16, -1, -1);
      }
      swift_release();

    }
  }
  else
  {
    v10 = sub_24A01ED90();
    v11 = sub_24A01F0E4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_249F70000, v10, v11, "Bad internal state: gallery is not available", v12, 2u);
      MEMORY[0x24BD07950](v12, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v13 = 4;
    swift_willThrow();
  }
}

void sub_24A01B300(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 16) + 16);
  swift_retain();
  v2 = v1;
  sub_24A01F180();
  swift_release();

}

void sub_24A01B380()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _BYTE *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;

  v2 = sub_24A01EDCC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v0 + 24))
  {
    swift_retain();
    sub_24A01EDC0();
    sub_24A01F12C();
    if (v1)
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v10 = sub_24A01ED90();
      v11 = sub_24A01F0CC();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_249F70000, v10, v11, "Persisted the gallery state", v12, 2u);
        MEMORY[0x24BD07950](v12, -1, -1);
      }
      swift_release();

    }
  }
  else
  {
    v6 = sub_24A01ED90();
    v7 = sub_24A01F0E4();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_249F70000, v6, v7, "Bad internal state: gallery is not available", v8, 2u);
      MEMORY[0x24BD07950](v8, -1, -1);
    }

    sub_249F74AF4();
    swift_allocError();
    *v9 = 4;
    swift_willThrow();
  }
}

uint64_t VUGalleryTransaction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19VisualUnderstanding20VUGalleryTransaction_logger;
  v2 = sub_24A01EDA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t VUGalleryTransaction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC19VisualUnderstanding20VUGalleryTransaction_logger;
  v2 = sub_24A01EDA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

id sub_24A01B63C@<X0>(uint64_t **a1@<X8>)
{
  uint64_t v1;

  return sub_24A019930(*(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(unsigned __int8 *)(v1 + 72), a1);
}

uint64_t sub_24A01B664(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for VUGallery.Context(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_24A01B6A0@<X0>(uint64_t **a1@<X8>)
{
  uint64_t v1;

  return sub_24A019540(*(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(unsigned __int8 *)(v1 + 72), a1);
}

uint64_t sub_24A01B6C8@<X0>(uint64_t **a1@<X8>)
{
  uint64_t v1;

  return sub_24A01909C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), a1);
}

uint64_t sub_24A01B6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CA288);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24A01B744()
{
  uint64_t v0;

  sub_24A019FD8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_24A01B75C()
{
  uint64_t v0;

  sub_24A01A38C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_24A01B774()
{
  uint64_t *v0;

  sub_24A01A4D0(v0[2], v0[3], v0[4]);
}

void sub_24A01B790()
{
  uint64_t v0;

  sub_24A01A9B0(*(_QWORD *)(v0 + 16));
}

void sub_24A01B7AC()
{
  uint64_t v0;

  sub_24A01AFF4(*(_QWORD *)(v0 + 16));
}

void sub_24A01B7CC()
{
  uint64_t v0;

  sub_24A01B300(*(_QWORD *)(v0 + 16));
}

unint64_t sub_24A01B7E8()
{
  unint64_t result;

  result = qword_2578FFE60;
  if (!qword_2578FFE60)
  {
    result = MEMORY[0x24BD078A8](&protocol conformance descriptor for VUGalleryTransaction.Priority, &type metadata for VUGalleryTransaction.Priority);
    atomic_store(result, (unint64_t *)&qword_2578FFE60);
  }
  return result;
}

unint64_t sub_24A01B830()
{
  unint64_t result;

  result = qword_2578FFE68;
  if (!qword_2578FFE68)
  {
    result = MEMORY[0x24BD078A8](&protocol conformance descriptor for VUGalleryTransaction.TagType, &type metadata for VUGalleryTransaction.TagType);
    atomic_store(result, (unint64_t *)&qword_2578FFE68);
  }
  return result;
}

uint64_t sub_24A01B874()
{
  return type metadata accessor for VUGalleryTransaction();
}

uint64_t type metadata accessor for VUGalleryTransaction()
{
  uint64_t result;

  result = qword_2544CA200;
  if (!qword_2544CA200)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24A01B8B8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24A01EDA8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for VUGalleryTransaction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VUGalleryTransaction.add(observation:context:priority:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v5 + 200))(a1, a2, a3, a4, a5 & 1);
}

uint64_t dispatch thunk of VUGalleryTransaction.add(observation:context:at:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v4 + 208))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of VUGalleryTransaction.remove(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of VUGalleryTransaction.remove(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of VUGalleryTransaction.removeAll(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of VUGalleryTransaction.tag(_:with:type:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of VUGalleryTransaction.tag(_:with:type:priority:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of VUGalleryTransaction.untag(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t storeEnumTagSinglePayload for VUGalleryTransaction.Priority(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A01BAA4 + 4 * byte_24A021625[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24A01BAD8 + 4 * byte_24A021620[v4]))();
}

uint64_t sub_24A01BAD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A01BAE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A01BAE8);
  return result;
}

uint64_t sub_24A01BAF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A01BAFCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24A01BB00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A01BB08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VUGalleryTransaction.Priority()
{
  return &type metadata for VUGalleryTransaction.Priority;
}

uint64_t storeEnumTagSinglePayload for VUGalleryTransaction.TagType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A01BB70 + 4 * byte_24A02162F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24A01BBA4 + 4 * byte_24A02162A[v4]))();
}

uint64_t sub_24A01BBA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A01BBAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A01BBB4);
  return result;
}

uint64_t sub_24A01BBC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A01BBC8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24A01BBCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A01BBD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for VUGalleryTransaction.TagType()
{
  return &type metadata for VUGalleryTransaction.TagType;
}

void sub_24A01BBF0()
{
  uint64_t v0;

  sub_249FDDFE4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_24A01BC08()
{
  uint64_t v0;

  sub_249FDCB1C(*(_QWORD *)(v0 + 16), *(_WORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

unint64_t sub_24A01BC28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544CA2D8;
  if (!qword_2544CA2D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544CA2D0);
    result = MEMORY[0x24BD078A8](MEMORY[0x24BDCFBF8], v1);
    atomic_store(result, (unint64_t *)&qword_2544CA2D8);
  }
  return result;
}

uint64_t sub_24A01BC74()
{
  swift_retain();
  sub_249FDF3A0();
  return swift_release();
}

uint64_t type metadata accessor for pet2word_pf4dt5d4p3_10000Input()
{
  return objc_opt_self();
}

uint64_t sub_24A01BF2C()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for pet2word_pf4dt5d4p3_10000Output()
{
  return objc_opt_self();
}

uint64_t sub_24A01BF70()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for pet2word_pf4dt5d4p3_10000()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for face2word_bu5gm8qf98_10000Input()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for face2word_bu5gm8qf98_10000Output()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for face2word_bu5gm8qf98_10000()
{
  return objc_opt_self();
}

uint64_t sub_24A01C274(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2578FFE70);
    v3 = sub_24A01F2DC();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_24A01F4EC();
      swift_bridgeObjectRetain();
      sub_24A01EE98();
      result = sub_24A01F528();
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
        if (v17 || (result = sub_24A01F45C(), (result & 1) != 0))
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
            result = sub_24A01F45C();
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

id VUIndexCachedEntity.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id VUIndexCachedEntity.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for VUIndexCachedEntity();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for VUIndexCachedEntity()
{
  return objc_opt_self();
}

id VUIndexCachedEntity.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VUIndexCachedEntity();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static VUIndexCachedEntity.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24A01EE44();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_24A01C5D4()
{
  return MEMORY[0x24BEE0948];
}

uint64_t sub_24A01C5E0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_snapshotDate);
  if (v3)
  {
    v4 = v3;
    sub_24A01EB44();

    v5 = sub_24A01EB5C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_24A01EB5C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_24A01C664(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFBA8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A01C8DC(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_24A01EB5C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_24A01EB2C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setSnapshotDate_, v10);

}

uint64_t sub_24A01C740@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for VUIndexCachedEntity();
  result = sub_24A01F30C();
  *a1 = result;
  return result;
}

char *keypath_get_selector_isOverridden()
{
  return sel_isOverridden;
}

id sub_24A01C78C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isOverridden);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24A01C7BC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsOverridden_, *a1);
}

char *keypath_get_selector_keyObservations()
{
  return sel_keyObservations;
}

id sub_24A01C7DC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_keyObservations);
  *a2 = result;
  return result;
}

id sub_24A01C814(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKeyObservations_, *a1);
}

char *keypath_get_selector_label()
{
  return sel_label;
}

id sub_24A01C834@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_label);
  *a2 = result;
  return result;
}

id sub_24A01C864(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLabel_, *a1);
}

char *keypath_get_selector_selectedObservation()
{
  return sel_selectedObservation;
}

id sub_24A01C884@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_selectedObservation);
  *a2 = result;
  return result;
}

id sub_24A01C8B4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSelectedObservation_, *a1);
}

char *keypath_get_selector_snapshotDate()
{
  return sel_snapshotDate;
}

uint64_t sub_24A01C8DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFBA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id VUIndexMapping.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id VUIndexMapping.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for VUIndexMapping();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for VUIndexMapping()
{
  return objc_opt_self();
}

id VUIndexMapping.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VUIndexMapping();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static VUIndexMapping.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24A01EE44();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_24A01CAEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for VUIndexMapping();
  result = sub_24A01F30C();
  *a1 = result;
  return result;
}

char *keypath_get_selector_density()
{
  return sel_density;
}

id sub_24A01CB38@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_density);
  *a2 = v4;
  return result;
}

id sub_24A01CB68(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setDensity_, a3);
}

char *keypath_get_selector_diversity()
{
  return sel_diversity;
}

id sub_24A01CB88@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_diversity);
  *a2 = v4;
  return result;
}

id sub_24A01CBB8(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setDiversity_, a3);
}

id sub_24A01CBCC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_label);
  *a2 = result;
  return result;
}

id sub_24A01CBFC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLabel_, *a1);
}

char *keypath_get_selector_partition()
{
  return sel_partition;
}

id sub_24A01CC1C@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_partition);
  *a2 = (_DWORD)result;
  return result;
}

id sub_24A01CC4C(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPartition_, *a1);
}

char *keypath_get_selector_partner()
{
  return sel_partner;
}

id sub_24A01CC6C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_partner);
  *a2 = result;
  return result;
}

id sub_24A01CC9C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPartner_, *a1);
}

char *keypath_get_selector_similarity()
{
  return sel_similarity;
}

id sub_24A01CCBC@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_similarity);
  *a2 = v4;
  return result;
}

id sub_24A01CCEC(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setSimilarity_, a3);
}

char *keypath_get_selector_observation()
{
  return sel_observation;
}

id sub_24A01CD0C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_observation);
  *a2 = result;
  return result;
}

id sub_24A01CD44(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setObservation_, *a1);
}

id VUIndexObservation.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id VUIndexObservation.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for VUIndexObservation();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for VUIndexObservation()
{
  return objc_opt_self();
}

id VUIndexObservation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VUIndexObservation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static VUIndexObservation.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24A01EE44();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_24A01CF18(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_24A01EAFC();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_24A01CF78(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v7 = 0;
  else
    v7 = sub_24A01EAF0();
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

uint64_t sub_24A01CFDC@<X0>(id *a1@<X0>, SEL *a2@<X3>, uint64_t a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    sub_24A01EB98();

    v6 = sub_24A01EBA4();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a3;
    v9 = 0;
  }
  else
  {
    v6 = sub_24A01EBA4();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a3;
    v9 = 1;
  }
  return v7(v8, v9, 1, v6);
}

void sub_24A01D05C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249F99498(a1, (uint64_t)v10);
  v11 = *a2;
  v12 = sub_24A01EBA4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
  {
    v14 = (void *)sub_24A01EB80();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
  }
  objc_msgSend(v11, *a5, v14);

}

uint64_t sub_24A01D138@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for VUIndexObservation();
  result = sub_24A01F30C();
  *a1 = result;
  return result;
}

char *keypath_get_selector_asset()
{
  return sel_asset;
}

uint64_t sub_24A01D184@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A01CFDC(a1, (SEL *)&selRef_asset, a2);
}

void sub_24A01D1A0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_24A01D05C(a1, a2, a3, a4, (SEL *)&selRef_setAsset_);
}

char *keypath_get_selector_client()
{
  return sel_client;
}

id sub_24A01D1C8@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_client);
  *a2 = (_WORD)result;
  return result;
}

id sub_24A01D1F8(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setClient_, *a1);
}

char *keypath_get_selector_confidence()
{
  return sel_confidence;
}

id sub_24A01D218@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_confidence);
  *a2 = v4;
  return result;
}

id sub_24A01D248(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setConfidence_, a3);
}

char *keypath_get_selector_contextualEmbedding()
{
  return sel_contextualEmbedding;
}

void sub_24A01D268(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24A01CF18(a1, (SEL *)&selRef_contextualEmbedding, a2);
}

void sub_24A01D284(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_24A01CF78(a1, a2, a3, a4, (SEL *)&selRef_setContextualEmbedding_);
}

char *keypath_get_selector_embedding()
{
  return sel_embedding;
}

void sub_24A01D2AC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24A01CF18(a1, (SEL *)&selRef_embedding, a2);
}

void sub_24A01D2C8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_24A01CF78(a1, a2, a3, a4, (SEL *)&selRef_setEmbedding_);
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

id sub_24A01D2F0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_identifier);
  *a2 = result;
  return result;
}

id sub_24A01D320(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIdentifier_, *a1);
}

char *keypath_get_selector_isPrimary()
{
  return sel_isPrimary;
}

id sub_24A01D340@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isPrimary);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24A01D370(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsPrimary_, *a1);
}

char *keypath_get_selector_legacyLabel()
{
  return sel_legacyLabel;
}

id sub_24A01D390@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_legacyLabel);
  *a2 = result;
  return result;
}

id sub_24A01D3C0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLegacyLabel_, *a1);
}

char *keypath_get_selector_legacyPartition()
{
  return sel_legacyPartition;
}

id sub_24A01D3E0@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_legacyPartition);
  *a2 = (_DWORD)result;
  return result;
}

id sub_24A01D410(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLegacyPartition_, *a1);
}

char *keypath_get_selector_moment()
{
  return sel_moment;
}

uint64_t sub_24A01D430@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_24A01CFDC(a1, (SEL *)&selRef_moment, a2);
}

void sub_24A01D44C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_24A01D05C(a1, a2, a3, a4, (SEL *)&selRef_setMoment_);
}

char *keypath_get_selector_quality()
{
  return sel_quality;
}

id sub_24A01D474@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_quality);
  *a2 = v4;
  return result;
}

id sub_24A01D4A4(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setQuality_, a3);
}

char *keypath_get_selector_source()
{
  return sel_source;
}

id sub_24A01D4C4@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_source);
  *a2 = (_WORD)result;
  return result;
}

id sub_24A01D4F4(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSource_, *a1);
}

char *keypath_get_selector_type()
{
  return sel_type;
}

id sub_24A01D514@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_type);
  *a2 = (_WORD)result;
  return result;
}

id sub_24A01D544(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

char *keypath_get_selector_mapping()
{
  return sel_mapping;
}

id sub_24A01D564@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_mapping);
  *a2 = result;
  return result;
}

id sub_24A01D59C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setMapping_, *a1);
}

char *keypath_get_selector_tags()
{
  return sel_tags;
}

id sub_24A01D5BC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_tags);
  *a2 = result;
  return result;
}

id sub_24A01D5F4(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTags_, *a1);
}

id VUIndexPartition.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id VUIndexPartition.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for VUIndexPartition();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for VUIndexPartition()
{
  return objc_opt_self();
}

id VUIndexPartition.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VUIndexPartition();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static VUIndexPartition.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24A01EE44();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_24A01D7C8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_centroid);
  if (v3)
  {
    v4 = v3;
    v5 = sub_24A01EAFC();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_24A01D82C(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_24A01EAF0();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setCentroid_);

}

uint64_t sub_24A01D890@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for VUIndexPartition();
  result = sub_24A01F30C();
  *a1 = result;
  return result;
}

char *keypath_get_selector_centroid()
{
  return sel_centroid;
}

id sub_24A01D8E4@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_partition);
  *a2 = (_DWORD)result;
  return result;
}

id sub_24A01D914(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setPartition_, *a1);
}

id sub_24A01D928@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_type);
  *a2 = (_WORD)result;
  return result;
}

id sub_24A01D958(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

id VUIndexSubset.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id VUIndexSubset.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for VUIndexSubset();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for VUIndexSubset()
{
  return objc_opt_self();
}

id VUIndexSubset.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VUIndexSubset();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static VUIndexSubset.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24A01EE44();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_24A01DB34@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_lastUpdated);
  if (v3)
  {
    v4 = v3;
    sub_24A01EB44();

    v5 = sub_24A01EB5C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_24A01EB5C();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_24A01DBB8(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578FFBA8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24A01C8DC(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_24A01EB5C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_24A01EB2C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setLastUpdated_, v10);

}

uint64_t sub_24A01DC94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for VUIndexSubset();
  result = sub_24A01F30C();
  *a1 = result;
  return result;
}

char *keypath_get_selector_contextualEmbeddingRevision()
{
  return sel_contextualEmbeddingRevision;
}

id sub_24A01DCE0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_contextualEmbeddingRevision);
  *a2 = result;
  return result;
}

id sub_24A01DD10(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContextualEmbeddingRevision_, *a1);
}

char *keypath_get_selector_embeddingRevision()
{
  return sel_embeddingRevision;
}

id sub_24A01DD30@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_embeddingRevision);
  *a2 = result;
  return result;
}

id sub_24A01DD60(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEmbeddingRevision_, *a1);
}

char *keypath_get_selector_lastUpdated()
{
  return sel_lastUpdated;
}

char *keypath_get_selector_staleObservations()
{
  return sel_staleObservations;
}

id sub_24A01DD94@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_staleObservations);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24A01DDC4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStaleObservations_, *a1);
}

char *keypath_get_selector_staleTags()
{
  return sel_staleTags;
}

id sub_24A01DDE4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_staleTags);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24A01DE14(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStaleTags_, *a1);
}

id sub_24A01DE28@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_type);
  *a2 = (_WORD)result;
  return result;
}

id sub_24A01DE58(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

char *keypath_get_selector_usingVectorStore()
{
  return sel_usingVectorStore;
}

id sub_24A01DE78@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_usingVectorStore);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24A01DEA8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUsingVectorStore_, *a1);
}

char *keypath_get_selector_version()
{
  return sel_version;
}

id sub_24A01DEC8@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_version);
  *a2 = (_DWORD)result;
  return result;
}

id sub_24A01DEF8(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVersion_, *a1);
}

id VUIndexTag.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id VUIndexTag.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for VUIndexTag();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for VUIndexTag()
{
  return objc_opt_self();
}

id VUIndexTag.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VUIndexTag();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static VUIndexTag.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24A01EE44();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_24A01E0CC@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_uuid);
  if (v3)
  {
    v4 = v3;
    sub_24A01EB98();

    v5 = sub_24A01EBA4();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_24A01EBA4();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_24A01E150(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249F99498(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_24A01EBA4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_24A01EB80();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setUuid_, v10);

}

uint64_t sub_24A01E22C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for VUIndexTag();
  result = sub_24A01F30C();
  *a1 = result;
  return result;
}

id sub_24A01E26C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isPrimary);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24A01E29C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsPrimary_, *a1);
}

char *keypath_get_selector_resolved()
{
  return sel_resolved;
}

id sub_24A01E2BC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_resolved);
  *a2 = (_BYTE)result;
  return result;
}

id sub_24A01E2EC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setResolved_, *a1);
}

id sub_24A01E300@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_type);
  *a2 = (_WORD)result;
  return result;
}

id sub_24A01E330(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setType_, *a1);
}

char *keypath_get_selector_uuid()
{
  return sel_uuid;
}

id sub_24A01E358@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_observation);
  *a2 = result;
  return result;
}

id sub_24A01E390(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setObservation_, *a1);
}

id VUIndexToken.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id VUIndexToken.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for VUIndexToken();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for VUIndexToken()
{
  return objc_opt_self();
}

id VUIndexToken.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VUIndexToken();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static VUIndexToken.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24A01EE44();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_24A01E568(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_embedding);
  if (v3)
  {
    v4 = v3;
    v5 = sub_24A01EAFC();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_24A01E5CC(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_24A01EAF0();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setEmbedding_);

}

void sub_24A01E630(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_revision);
  if (v3)
  {
    v4 = v3;
    v5 = sub_24A01EE68();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_24A01E694(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_24A01EE44();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setRevision_);

}

uint64_t sub_24A01E6F0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;

  v3 = objc_msgSend(*a1, sel_tag);
  if (v3)
  {
    v4 = v3;
    sub_24A01EB98();

    v5 = sub_24A01EBA4();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 0;
  }
  else
  {
    v5 = sub_24A01EBA4();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
    v7 = a2;
    v8 = 1;
  }
  return v6(v7, v8, 1, v5);
}

void sub_24A01E774(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544CAD70);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_249F99498(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_24A01EBA4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_24A01EB80();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setTag_, v10);

}

uint64_t sub_24A01E850@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for VUIndexToken();
  result = sub_24A01F30C();
  *a1 = result;
  return result;
}

id sub_24A01E890@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_client);
  *a2 = (_WORD)result;
  return result;
}

id sub_24A01E8C0(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setClient_, *a1);
}

char *keypath_get_selector_revision()
{
  return sel_revision;
}

char *keypath_get_selector_shape()
{
  return sel_shape;
}

id sub_24A01E8FC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shape);
  *a2 = result;
  return result;
}

id sub_24A01E934(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShape_, *a1);
}

char *keypath_get_selector_tag()
{
  return sel_tag;
}

id sub_24A01E95C@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_version);
  *a2 = (_WORD)result;
  return result;
}

id sub_24A01E98C(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setVersion_, *a1);
}

uint64_t sub_24A01E9A0()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_24A01E9AC()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_24A01E9B8()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_24A01E9C4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_24A01E9D0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_24A01E9DC()
{
  return MEMORY[0x24BDCBBF8]();
}

uint64_t sub_24A01E9E8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_24A01E9F4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_24A01EA00()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24A01EA0C()
{
  return MEMORY[0x24BDCD770]();
}

uint64_t sub_24A01EA18()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_24A01EA24()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_24A01EA30()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_24A01EA3C()
{
  return MEMORY[0x24BDCD940]();
}

uint64_t sub_24A01EA48()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_24A01EA54()
{
  return MEMORY[0x24BDCD9B0]();
}

uint64_t sub_24A01EA60()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_24A01EA6C()
{
  return MEMORY[0x24BDCD9C8]();
}

uint64_t sub_24A01EA78()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_24A01EA84()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_24A01EA90()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_24A01EA9C()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_24A01EAA8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24A01EAB4()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_24A01EAC0()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_24A01EACC()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_24A01EAD8()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_24A01EAE4()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_24A01EAF0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24A01EAFC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24A01EB08()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_24A01EB14()
{
  return MEMORY[0x24BDCDD68]();
}

uint64_t sub_24A01EB20()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_24A01EB2C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_24A01EB38()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_24A01EB44()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_24A01EB50()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_24A01EB5C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24A01EB68()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_24A01EB74()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_24A01EB80()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_24A01EB8C()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_24A01EB98()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_24A01EBA4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24A01EBB0()
{
  return MEMORY[0x24BE68028]();
}

uint64_t sub_24A01EBBC()
{
  return MEMORY[0x24BE68038]();
}

uint64_t sub_24A01EBC8()
{
  return MEMORY[0x24BE68218]();
}

uint64_t sub_24A01EBD4()
{
  return MEMORY[0x24BE68220]();
}

uint64_t sub_24A01EBE0()
{
  return MEMORY[0x24BE68388]();
}

uint64_t sub_24A01EBEC()
{
  return MEMORY[0x24BE68390]();
}

uint64_t sub_24A01EBF8()
{
  return MEMORY[0x24BE68508]();
}

uint64_t sub_24A01EC04()
{
  return MEMORY[0x24BE68668]();
}

uint64_t sub_24A01EC10()
{
  return MEMORY[0x24BE68670]();
}

uint64_t sub_24A01EC1C()
{
  return MEMORY[0x24BEBFC50]();
}

uint64_t sub_24A01EC28()
{
  return MEMORY[0x24BEBFC68]();
}

uint64_t sub_24A01EC34()
{
  return MEMORY[0x24BEBFC70]();
}

uint64_t sub_24A01EC40()
{
  return MEMORY[0x24BEBFC88]();
}

uint64_t sub_24A01EC4C()
{
  return MEMORY[0x24BEBFCB8]();
}

uint64_t sub_24A01EC58()
{
  return MEMORY[0x24BEBFCC0]();
}

uint64_t sub_24A01EC64()
{
  return MEMORY[0x24BEBFCC8]();
}

uint64_t sub_24A01EC70()
{
  return MEMORY[0x24BEBFCE8]();
}

uint64_t sub_24A01EC7C()
{
  return MEMORY[0x24BEBFD20]();
}

uint64_t sub_24A01EC88()
{
  return MEMORY[0x24BEBFD28]();
}

uint64_t sub_24A01EC94()
{
  return MEMORY[0x24BEBFD30]();
}

uint64_t sub_24A01ECA0()
{
  return MEMORY[0x24BEBFD38]();
}

uint64_t sub_24A01ECAC()
{
  return MEMORY[0x24BEBFD70]();
}

uint64_t sub_24A01ECB8()
{
  return MEMORY[0x24BEBFD88]();
}

uint64_t sub_24A01ECC4()
{
  return MEMORY[0x24BEBFD90]();
}

uint64_t sub_24A01ECD0()
{
  return MEMORY[0x24BEBFDA0]();
}

uint64_t sub_24A01ECDC()
{
  return MEMORY[0x24BEBFE78]();
}

uint64_t sub_24A01ECE8()
{
  return MEMORY[0x24BEBFE88]();
}

uint64_t sub_24A01ECF4()
{
  return MEMORY[0x24BEBFE98]();
}

uint64_t sub_24A01ED00()
{
  return MEMORY[0x24BEBFEA0]();
}

uint64_t sub_24A01ED0C()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_24A01ED18()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_24A01ED24()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_24A01ED30()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_24A01ED3C()
{
  return MEMORY[0x24BEE77E0]();
}

uint64_t sub_24A01ED48()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_24A01ED54()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_24A01ED60()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_24A01ED6C()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_24A01ED78()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_24A01ED84()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_24A01ED90()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24A01ED9C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24A01EDA8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24A01EDB4()
{
  return MEMORY[0x24BDBFC50]();
}

uint64_t sub_24A01EDC0()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_24A01EDCC()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24A01EDD8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24A01EDE4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24A01EDF0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24A01EDFC()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24A01EE08()
{
  return MEMORY[0x24BEE0290]();
}

uint64_t sub_24A01EE14()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24A01EE20()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24A01EE2C()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_24A01EE38()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24A01EE44()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24A01EE50()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_24A01EE5C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_24A01EE68()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24A01EE74()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24A01EE80()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_24A01EE8C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_24A01EE98()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24A01EEA4()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_24A01EEB0()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_24A01EEBC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24A01EEC8()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_24A01EED4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24A01EEE0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_24A01EEEC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_24A01EEF8()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_24A01EF04()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_24A01EF10()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_24A01EF1C()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_24A01EF28()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_24A01EF34()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_24A01EF40()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_24A01EF4C()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_24A01EF58()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_24A01EF64()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24A01EF70()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24A01EF7C()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_24A01EF88()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24A01EF94()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24A01EFA0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24A01EFAC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24A01EFB8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_24A01EFC4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24A01EFD0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24A01EFDC()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_24A01EFE8()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_24A01EFF4()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_24A01F000()
{
  return MEMORY[0x24BDCFC98]();
}

uint64_t sub_24A01F00C()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_24A01F018()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_24A01F024()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_24A01F030()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_24A01F03C()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_24A01F048()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_24A01F054()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_24A01F060()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_24A01F06C()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_24A01F078()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_24A01F084()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_24A01F090()
{
  return MEMORY[0x24BEE7648]();
}

uint64_t sub_24A01F09C()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_24A01F0A8()
{
  return MEMORY[0x24BDBFE58]();
}

uint64_t sub_24A01F0B4()
{
  return MEMORY[0x24BDBFE60]();
}

uint64_t sub_24A01F0C0()
{
  return MEMORY[0x24BDBFE88]();
}

uint64_t sub_24A01F0CC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24A01F0D8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24A01F0E4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24A01F0F0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24A01F0FC()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_24A01F108()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_24A01F114()
{
  return MEMORY[0x24BEE5740]();
}

uint64_t sub_24A01F120()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24A01F12C()
{
  return MEMORY[0x24BEE5778]();
}

uint64_t sub_24A01F138()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_24A01F144()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_24A01F150()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24A01F15C()
{
  return MEMORY[0x24BDF9AC0]();
}

uint64_t sub_24A01F168()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_24A01F174()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_24A01F180()
{
  return MEMORY[0x24BDBB360]();
}

uint64_t sub_24A01F18C()
{
  return MEMORY[0x24BDBB388]();
}

uint64_t sub_24A01F198()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_24A01F1A4()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_24A01F1B0()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_24A01F1BC()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_24A01F1C8()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_24A01F1D4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24A01F1E0()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_24A01F1EC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24A01F1F8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24A01F204()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24A01F210()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_24A01F21C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24A01F228()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24A01F234()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_24A01F240()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_24A01F24C()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_24A01F258()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_24A01F264()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_24A01F270()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_24A01F27C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_24A01F288()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_24A01F294()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_24A01F2A0()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_24A01F2AC()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_24A01F2B8()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_24A01F2C4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24A01F2D0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24A01F2DC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24A01F2E8()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_24A01F2F4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24A01F300()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24A01F30C()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_24A01F318()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_24A01F324()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24A01F330()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24A01F33C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24A01F348()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24A01F354()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_24A01F360()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_24A01F36C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24A01F378()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24A01F384()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_24A01F390()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_24A01F39C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_24A01F3A8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24A01F3B4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24A01F3C0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24A01F3CC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24A01F3D8()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_24A01F3E4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24A01F3F0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24A01F3FC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24A01F408()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24A01F414()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_24A01F420()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24A01F42C()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_24A01F438()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_24A01F444()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24A01F450()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_24A01F45C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24A01F468()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_24A01F474()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_24A01F480()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_24A01F48C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24A01F498()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24A01F4A4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24A01F4B0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24A01F4BC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24A01F4C8()
{
  return MEMORY[0x24BDD0758]();
}

uint64_t sub_24A01F4D4()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_24A01F4E0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_24A01F4EC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24A01F4F8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24A01F504()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_24A01F510()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_24A01F51C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_24A01F528()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x24BDB2BD0]();
}

uint64_t cblas_snrm2_NEWLAPACK()
{
  return MEMORY[0x24BDB2C10]();
}

uint64_t cblas_sscal_NEWLAPACK()
{
  return MEMORY[0x24BDB2C20]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

double drand48(void)
{
  double result;

  MEMORY[0x24BDAE0B0]();
  return result;
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

void srand48(uint64_t a1)
{
  MEMORY[0x24BDAFE88](a1);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

