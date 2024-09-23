void sub_1DA658444(uint64_t a1, void *a2)
{
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
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
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
  void *v36;
  id v37;

  v4 = sub_1DA670480();
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  MEMORY[0x1E0C80A78](v4);
  v33 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v29 - v7;
  v9 = sub_1DA66ECC8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DA66CBE0();
  v14 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D7DA28];
  (*(void (**)(char *, void *, uint64_t))(v10 + 16))(v12, a2, v9);
  MEMORY[0x1DF09E188](v12);
  sub_1DA47E32C(&qword_1F026AB60, v14, MEMORY[0x1E0D7DA48]);
  v15 = a1;
  v32 = v13;
  v16 = v36;
  sub_1DA66EBF0();
  if (v16)
  {
    v30 = v10;
    v31 = v9;
    v36 = a2;
    swift_bridgeObjectRelease();
    v37 = v16;
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE53C0);
    v18 = v35;
    if (swift_dynamicCast())
    {

      v19 = v33;
      v20 = v34;
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v33, v8, v18);
      v21 = sub_1DA66F6DC();
      sub_1DA47E32C((unint64_t *)&qword_1EDAE1F70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
      swift_allocError();
      v23 = v22;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE2230);
      v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_1DA678510;
      *(_QWORD *)(v24 + 32) = swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v25, v19, v18);
      *v23 = v32;
      v23[1] = v24;
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v23, *MEMORY[0x1E0D414F0], v21);
      swift_willThrow();
      (*(void (**)(void *, uint64_t))(v30 + 8))(v36, v31);
      v26 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v15, v26);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v19, v18);
    }
    else
    {
      (*(void (**)(void *, uint64_t))(v30 + 8))(v36, v31);
      v28 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v15, v28);
    }

  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v10 + 8))(a2, v9);
    v27 = sub_1DA66EC20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(a1, v27);
  }
}

void sub_1DA658780(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  void (*v23)(uint64_t, char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;

  v7 = sub_1DA670480();
  v46 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v37 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v36 - v10;
  v12 = sub_1DA66ECC8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v13 + 16))(v16, a2, v12, v14);
  MEMORY[0x1DF09E188](v16);
  sub_1DA65AFC0();
  sub_1DA66EBF0();
  if (v3)
  {
    v36 = a2;
    swift_bridgeObjectRelease();
    v38 = v3;
    v17 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE53C0);
    if (swift_dynamicCast())
    {

      v18 = v46;
      (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v37, v11, v7);
      v19 = sub_1DA66F6DC();
      sub_1DA47E32C((unint64_t *)&qword_1EDAE1F70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
      swift_allocError();
      v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE2230);
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1DA678510;
      *(_QWORD *)(v22 + 32) = swift_allocError();
      v23 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 16);
      v24 = v37;
      v23(v25, v37, v7);
      *v21 = MEMORY[0x1E0D7E1F8];
      v21[1] = v22;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x1E0D414F0], v19);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v36, v12);
      v26 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(a1, v26);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v7);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v36, v12);
      v35 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(a1, v35);
    }

  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a2, v12);
    v27 = sub_1DA66EC20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(a1, v27);
    v28 = v39;
    v29 = v40;
    v30 = v41;
    v31 = v42;
    v32 = v43;
    v33 = v44;
    v34 = v45;
    *(_QWORD *)a3 = v38;
    *(_BYTE *)(a3 + 8) = v28;
    *(_QWORD *)(a3 + 16) = v29;
    *(_BYTE *)(a3 + 24) = v30;
    *(_QWORD *)(a3 + 32) = v31;
    *(_BYTE *)(a3 + 40) = v32;
    *(_QWORD *)(a3 + 48) = v33;
    *(_BYTE *)(a3 + 56) = v34;
  }
}

_QWORD *sub_1DA658AD8(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, _QWORD *);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  id v32;

  v5 = (_QWORD *)sub_1DA670480();
  v31 = *(v5 - 1);
  MEMORY[0x1E0C80A78](v5);
  v30 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v28 - v8;
  v10 = sub_1DA66ECC8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v11 + 16))(v14, a2, v10, v12);
  MEMORY[0x1DF09E188](v14);
  sub_1DA65AF7C();
  sub_1DA66EBF0();
  if (v2)
  {
    v28 = a2;
    v29 = a1;
    swift_bridgeObjectRelease();
    v32 = v2;
    v15 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE53C0);
    if (swift_dynamicCast())
    {

      v16 = v31;
      (*(void (**)(char *, char *, _QWORD *))(v31 + 32))(v30, v9, v5);
      v17 = sub_1DA66F6DC();
      sub_1DA47E32C((unint64_t *)&qword_1EDAE1F70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
      swift_allocError();
      v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE2230);
      v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_1DA678510;
      *(_QWORD *)(v20 + 32) = swift_allocError();
      v21 = *(void (**)(uint64_t, char *, _QWORD *))(v16 + 16);
      v22 = v30;
      v21(v23, v30, v5);
      *v19 = &type metadata for LazyDate;
      v19[1] = v20;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x1E0D414F0], v17);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v28, v10);
      v24 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v29, v24);
      (*(void (**)(char *, _QWORD *))(v31 + 8))(v22, v5);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v28, v10);
      v26 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v29, v26);
    }

  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = v32;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
    v25 = sub_1DA66EC20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(a1, v25);
  }
  return v5;
}

uint64_t sub_1DA658DEC(uint64_t a1, uint64_t a2)
{
  return sub_1DA657460(a1, a2, (void (*)(void))sub_1DA65AF38, MEMORY[0x1E0D7D788]);
}

id sub_1DA658E10(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  v5 = sub_1DA670480();
  v35 = *(_QWORD *)(v5 - 8);
  v36 = v5;
  MEMORY[0x1E0C80A78](v5);
  v34 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v29 - v8;
  v10 = sub_1DA66ECC8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MTPodcastEpisodeLimit(0);
  v15 = v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
  MEMORY[0x1DF09E188](v13);
  sub_1DA47E32C(&qword_1EDAE28A0, (uint64_t (*)(uint64_t))type metadata accessor for MTPodcastEpisodeLimit, MEMORY[0x1E0D7F0D0]);
  sub_1DA66EBF0();
  if (v2)
  {
    v30 = v11;
    v31 = v10;
    v32 = a2;
    v33 = a1;
    swift_bridgeObjectRelease();
    v37 = v2;
    v16 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE53C0);
    v17 = v36;
    if (swift_dynamicCast())
    {

      v19 = v34;
      v18 = v35;
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v34, v9, v17);
      v20 = sub_1DA66F6DC();
      sub_1DA47E32C((unint64_t *)&qword_1EDAE1F70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
      swift_allocError();
      v22 = v21;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE2230);
      v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_1DA678510;
      *(_QWORD *)(v23 + 32) = swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v18 + 16))(v24, v19, v17);
      *v22 = v15;
      v22[1] = v23;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x1E0D414F0], v20);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v31);
      v25 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v33, v25);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v17);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v31);
      v27 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v33, v27);
    }

  }
  else
  {
    swift_bridgeObjectRelease();
    v15 = v37;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
    v26 = sub_1DA66EC20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(a1, v26);
  }
  return v15;
}

void sub_1DA659144(_BYTE *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  void (*v22)(uint64_t, char *, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  id v33;
  char v34;

  v30 = a3;
  v6 = sub_1DA670480();
  v32 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v31 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v28 - v9;
  v11 = sub_1DA66ECC8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v12 + 16))(v15, a2, v11, v13);
  MEMORY[0x1DF09E188](v15);
  sub_1DA65A724();
  sub_1DA66EBF0();
  if (v3)
  {
    v29 = a2;
    v30 = a1;
    swift_bridgeObjectRelease();
    v33 = v3;
    v16 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE53C0);
    if (swift_dynamicCast())
    {

      v17 = v32;
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v31, v10, v6);
      v18 = sub_1DA66F6DC();
      sub_1DA47E32C((unint64_t *)&qword_1EDAE1F70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
      swift_allocError();
      v20 = v19;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE2230);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1DA678510;
      *(_QWORD *)(v21 + 32) = swift_allocError();
      v22 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 16);
      v23 = v31;
      v22(v24, v31, v6);
      *v20 = &type metadata for EpisodeLimitSuggestion.DisplayCondition;
      v20[1] = v21;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x1E0D414F0], v18);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v29, v11);
      v25 = sub_1DA66EC20();
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v30, v25);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v23, v6);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v29, v11);
      v27 = sub_1DA66EC20();
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v30, v27);
    }

  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a2, v11);
    v26 = sub_1DA66EC20();
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(a1, v26);
    *v30 = v34;
  }
}

void sub_1DA659460(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  void (*v23)(uint64_t, char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  char v33;
  uint64_t v34;

  v7 = sub_1DA670480();
  v34 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v31 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v30 - v10;
  v12 = sub_1DA66ECC8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v13 + 16))(v16, a2, v12, v14);
  MEMORY[0x1DF09E188](v16);
  sub_1DA65AEB0();
  sub_1DA66EBF0();
  if (v3)
  {
    v30 = a2;
    swift_bridgeObjectRelease();
    v32 = v3;
    v17 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE53C0);
    if (swift_dynamicCast())
    {

      v18 = v34;
      (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v31, v11, v7);
      v19 = sub_1DA66F6DC();
      sub_1DA47E32C((unint64_t *)&qword_1EDAE1F70, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41500], MEMORY[0x1E0D41508]);
      swift_allocError();
      v21 = v20;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE2230);
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_1DA678510;
      *(_QWORD *)(v22 + 32) = swift_allocError();
      v23 = *(void (**)(uint64_t, char *, uint64_t))(v18 + 16);
      v24 = v31;
      v23(v25, v31, v7);
      *v21 = &type metadata for EpisodeLimitSuggestion;
      v21[1] = v22;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x1E0D414F0], v19);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v30, v12);
      v26 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(a1, v26);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v24, v7);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v30, v12);
      v29 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(a1, v29);
    }

  }
  else
  {
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a2, v12);
    v27 = sub_1DA66EC20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(a1, v27);
    v28 = v33;
    *(_QWORD *)a3 = v32;
    *(_BYTE *)(a3 + 8) = v28;
  }
}

BOOL sub_1DA659788(char a1, char a2)
{
  return dbl_1DA6865E0[a1] == dbl_1DA6865E0[a2];
}

void sub_1DA6597AC(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1DA6597FC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1DA6598B0 + 4 * byte_1DA68621A[a2]))(0x657469726F766166);
}

uint64_t sub_1DA6598B0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x657469726F766166 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_1DA6706D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1DA6599E4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1DA659A2C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1DA659A88 + 4 * byte_1DA686228[a2]))(0x737961776C61);
}

uint64_t sub_1DA659A88(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x737961776C61 && v1 == 0xE600000000000000)
    v2 = 1;
  else
    v2 = sub_1DA6706D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1DA659B2C(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x7565755174666F73;
  else
    v2 = 0x7565755164726168;
  if ((a2 & 1) != 0)
    v3 = 0x7565755174666F73;
  else
    v3 = 0x7565755164726168;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_1DA6706D8();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

void sub_1DA659BB4(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1DA659C04(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1DA659C8C + 4 * byte_1DA686231[a2]))(0x617461646174656DLL);
}

uint64_t sub_1DA659C8C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x617461646174656DLL && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_1DA6706D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1DA659D5C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1DA659DAC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1DA659E0C + 4 * byte_1DA68623A[a2]))(0x65646F73697065);
}

uint64_t sub_1DA659E0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 0x65646F73697065 && v1 == v2)
    v3 = 1;
  else
    v3 = sub_1DA6706D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t EpisodeLimitSuggestion.init(retentionPolicy:condition:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  char v3;

  v3 = *a2;
  *(_QWORD *)a3 = result;
  *(_BYTE *)(a3 + 8) = v3;
  return result;
}

PodcastsUI::EpisodeLimitSuggestion::DisplayCondition_optional __swiftcall EpisodeLimitSuggestion.DisplayCondition.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PodcastsUI::EpisodeLimitSuggestion::DisplayCondition_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1DA670600();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t EpisodeLimitSuggestion.retentionPolicy.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void EpisodeLimitSuggestion.condition.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

uint64_t EpisodeLimitSuggestion.DisplayCondition.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1DA659F58 + 4 * byte_1DA68623E[*v0]))(0x726576656ELL, 0xE500000000000000);
}

uint64_t sub_1DA659F58()
{
  return 0x737961776C61;
}

uint64_t sub_1DA659F6C()
{
  return 0x65726F74736572;
}

uint64_t sub_1DA659F84()
{
  return 0x65646172677075;
}

void sub_1DA659F9C(char *a1)
{
  sub_1DA6599E4(*a1);
}

void sub_1DA659FA8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1DA670798();
  __asm { BR              X9 }
}

uint64_t sub_1DA659FF0()
{
  sub_1DA66F94C();
  swift_bridgeObjectRelease();
  return sub_1DA6707C8();
}

void sub_1DA65A058()
{
  __asm { BR              X10 }
}

uint64_t sub_1DA65A090()
{
  sub_1DA66F94C();
  return swift_bridgeObjectRelease();
}

void sub_1DA65A0E4()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1DA670798();
  __asm { BR              X9 }
}

uint64_t sub_1DA65A128()
{
  sub_1DA66F94C();
  swift_bridgeObjectRelease();
  return sub_1DA6707C8();
}

PodcastsUI::EpisodeLimitSuggestion::DisplayCondition_optional sub_1DA65A190(Swift::String *a1)
{
  return EpisodeLimitSuggestion.DisplayCondition.init(rawValue:)(*a1);
}

uint64_t sub_1DA65A19C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1DA65A1C8 + 4 * byte_1DA68624E[*v0]))();
}

void sub_1DA65A1C8(_QWORD *a1@<X8>)
{
  *a1 = 0x737961776C61;
  a1[1] = 0xE600000000000000;
}

void sub_1DA65A1E0(_QWORD *a1@<X8>)
{
  *a1 = 0x65726F74736572;
  a1[1] = 0xE700000000000000;
}

uint64_t sub_1DA65A210()
{
  sub_1DA65AEF4();
  return sub_1DA66FA78();
}

uint64_t sub_1DA65A26C()
{
  sub_1DA65AEF4();
  return sub_1DA66FA6C();
}

void sub_1DA65A2B8(_BYTE *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  sub_1DA659144(a1, a2, a3);
}

uint64_t sub_1DA65A2CC()
{
  _BYTE *v0;

  if (*v0)
    return 0x6F697469646E6F63;
  else
    return 0x6F69746E65746572;
}

uint64_t sub_1DA65A318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DA65AD90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DA65A33C()
{
  sub_1DA65A4FC();
  return sub_1DA670810();
}

uint64_t sub_1DA65A364()
{
  sub_1DA65A4FC();
  return sub_1DA67081C();
}

uint64_t EpisodeLimitSuggestion.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  int v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E918);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v11 = *((unsigned __int8 *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DA65A4FC();
  sub_1DA670804();
  v15 = v8;
  v14 = 0;
  type metadata accessor for MTPodcastEpisodeLimit(0);
  sub_1DA47E32C(&qword_1EDAE2898, (uint64_t (*)(uint64_t))type metadata accessor for MTPodcastEpisodeLimit, MEMORY[0x1E0D7F0C8]);
  sub_1DA670660();
  if (!v2)
  {
    v13 = v11;
    v12 = 1;
    sub_1DA65A540();
    sub_1DA670660();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_1DA65A4FC()
{
  unint64_t result;

  result = qword_1EDAE3D28;
  if (!qword_1EDAE3D28)
  {
    result = MEMORY[0x1DF0A039C](&unk_1DA686588, &type metadata for EpisodeLimitSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAE3D28);
  }
  return result;
}

unint64_t sub_1DA65A540()
{
  unint64_t result;

  result = qword_1F026E920;
  if (!qword_1F026E920)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for EpisodeLimitSuggestion.DisplayCondition, &type metadata for EpisodeLimitSuggestion.DisplayCondition);
    atomic_store(result, (unint64_t *)&qword_1F026E920);
  }
  return result;
}

uint64_t EpisodeLimitSuggestion.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  char v10;
  _BYTE v12[16];
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4CF8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DA65A4FC();
  sub_1DA6707EC();
  if (!v2)
  {
    type metadata accessor for MTPodcastEpisodeLimit(0);
    v12[15] = 0;
    sub_1DA47E32C(&qword_1EDAE28A0, (uint64_t (*)(uint64_t))type metadata accessor for MTPodcastEpisodeLimit, MEMORY[0x1E0D7F0D0]);
    sub_1DA670630();
    v9 = v13;
    v12[13] = 1;
    sub_1DA65A724();
    sub_1DA670630();
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    v10 = v12[14];
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v10;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

unint64_t sub_1DA65A724()
{
  unint64_t result;

  result = qword_1EDAE3D48;
  if (!qword_1EDAE3D48)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for EpisodeLimitSuggestion.DisplayCondition, &type metadata for EpisodeLimitSuggestion.DisplayCondition);
    atomic_store(result, (unint64_t *)&qword_1EDAE3D48);
  }
  return result;
}

uint64_t sub_1DA65A768@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return EpisodeLimitSuggestion.init(from:)(a1, a2);
}

uint64_t sub_1DA65A77C(_QWORD *a1)
{
  return EpisodeLimitSuggestion.encode(to:)(a1);
}

void sub_1DA65A790(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1DA659460(a1, a2, a3);
}

void EpisodeLimitSuggestion.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_1DA670444();
  sub_1DA66F988();
  type metadata accessor for MTPodcastEpisodeLimit(0);
  sub_1DA670528();
  sub_1DA66F988();
  __asm { BR              X9 }
}

uint64_t sub_1DA65A878()
{
  uint64_t v1;

  sub_1DA66F988();
  swift_bridgeObjectRelease();
  sub_1DA66F988();
  return v1;
}

void EpisodeLimitSuggestion.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_1DA670444();
  sub_1DA66F988();
  type metadata accessor for MTPodcastEpisodeLimit(0);
  sub_1DA670528();
  sub_1DA66F988();
  __asm { BR              X9 }
}

uint64_t sub_1DA65A9C4()
{
  uint64_t v1;

  sub_1DA66F988();
  swift_bridgeObjectRelease();
  sub_1DA66F988();
  return v1;
}

unint64_t sub_1DA65AA40()
{
  unint64_t result;

  result = qword_1F026E928;
  if (!qword_1F026E928)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for EpisodeLimitSuggestion.DisplayCondition, &type metadata for EpisodeLimitSuggestion.DisplayCondition);
    atomic_store(result, (unint64_t *)&qword_1F026E928);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EpisodeLimitSuggestion(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for EpisodeLimitSuggestion(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for EpisodeLimitSuggestion()
{
  return &type metadata for EpisodeLimitSuggestion;
}

uint64_t storeEnumTagSinglePayload for EpisodeLimitSuggestion.DisplayCondition(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DA65AB6C + 4 * byte_1DA68625F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1DA65ABA0 + 4 * byte_1DA68625A[v4]))();
}

uint64_t sub_1DA65ABA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA65ABA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DA65ABB0);
  return result;
}

uint64_t sub_1DA65ABBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DA65ABC4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1DA65ABC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA65ABD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EpisodeLimitSuggestion.DisplayCondition()
{
  return &type metadata for EpisodeLimitSuggestion.DisplayCondition;
}

uint64_t storeEnumTagSinglePayload for EpisodeLimitSuggestion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DA65AC38 + 4 * byte_1DA686269[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DA65AC6C + 4 * byte_1DA686264[v4]))();
}

uint64_t sub_1DA65AC6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA65AC74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DA65AC7CLL);
  return result;
}

uint64_t sub_1DA65AC88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DA65AC90);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DA65AC94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA65AC9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EpisodeLimitSuggestion.CodingKeys()
{
  return &type metadata for EpisodeLimitSuggestion.CodingKeys;
}

unint64_t sub_1DA65ACBC()
{
  unint64_t result;

  result = qword_1F026E930;
  if (!qword_1F026E930)
  {
    result = MEMORY[0x1DF0A039C](&unk_1DA686560, &type metadata for EpisodeLimitSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F026E930);
  }
  return result;
}

unint64_t sub_1DA65AD04()
{
  unint64_t result;

  result = qword_1EDAE3D38;
  if (!qword_1EDAE3D38)
  {
    result = MEMORY[0x1DF0A039C](&unk_1DA6864D0, &type metadata for EpisodeLimitSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAE3D38);
  }
  return result;
}

unint64_t sub_1DA65AD4C()
{
  unint64_t result;

  result = qword_1EDAE3D30;
  if (!qword_1EDAE3D30)
  {
    result = MEMORY[0x1DF0A039C](&unk_1DA6864F8, &type metadata for EpisodeLimitSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAE3D30);
  }
  return result;
}

uint64_t sub_1DA65AD90(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6F69746E65746572 && a2 == 0xEF7963696C6F506ELL;
  if (v2 || (sub_1DA6706D8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6F697469646E6F63 && a2 == 0xE90000000000006ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1DA6706D8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_1DA65AEB0()
{
  unint64_t result;

  result = qword_1EDAE2780;
  if (!qword_1EDAE2780)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for EpisodeLimitSuggestion, &type metadata for EpisodeLimitSuggestion);
    atomic_store(result, (unint64_t *)&qword_1EDAE2780);
  }
  return result;
}

unint64_t sub_1DA65AEF4()
{
  unint64_t result;

  result = qword_1EDAE3D40;
  if (!qword_1EDAE3D40)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for EpisodeLimitSuggestion.DisplayCondition, &type metadata for EpisodeLimitSuggestion.DisplayCondition);
    atomic_store(result, (unint64_t *)&qword_1EDAE3D40);
  }
  return result;
}

unint64_t sub_1DA65AF38()
{
  unint64_t result;

  result = qword_1EDADFC10;
  if (!qword_1EDADFC10)
  {
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7D790], MEMORY[0x1E0D7D788]);
    atomic_store(result, (unint64_t *)&qword_1EDADFC10);
  }
  return result;
}

unint64_t sub_1DA65AF7C()
{
  unint64_t result;

  result = qword_1EDADFC08;
  if (!qword_1EDADFC08)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for LazyDate, &type metadata for LazyDate);
    atomic_store(result, (unint64_t *)&qword_1EDADFC08);
  }
  return result;
}

unint64_t sub_1DA65AFC0()
{
  unint64_t result;

  result = qword_1F026E938;
  if (!qword_1F026E938)
  {
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7E200], MEMORY[0x1E0D7E1F8]);
    atomic_store(result, (unint64_t *)&qword_1F026E938);
  }
  return result;
}

unint64_t sub_1DA65B004()
{
  unint64_t result;

  result = qword_1F026E940;
  if (!qword_1F026E940)
  {
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7EDB0], MEMORY[0x1E0D7EDA8]);
    atomic_store(result, (unint64_t *)&qword_1F026E940);
  }
  return result;
}

unint64_t sub_1DA65B048()
{
  unint64_t result;

  result = qword_1EDAE1A08;
  if (!qword_1EDAE1A08)
  {
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7EDD0], MEMORY[0x1E0D7EDC8]);
    atomic_store(result, (unint64_t *)&qword_1EDAE1A08);
  }
  return result;
}

unint64_t sub_1DA65B08C()
{
  unint64_t result;

  result = qword_1EDAE19A0;
  if (!qword_1EDAE19A0)
  {
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7DAE8], MEMORY[0x1E0D7DAE0]);
    atomic_store(result, (unint64_t *)&qword_1EDAE19A0);
  }
  return result;
}

unint64_t sub_1DA65B0D0()
{
  unint64_t result;

  result = qword_1EDAE4340;
  if (!qword_1EDAE4340)
  {
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7ED08], MEMORY[0x1E0D7ED00]);
    atomic_store(result, (unint64_t *)&qword_1EDAE4340);
  }
  return result;
}

unint64_t sub_1DA65B114()
{
  unint64_t result;

  result = qword_1EDAE19B8;
  if (!qword_1EDAE19B8)
  {
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7E150], MEMORY[0x1E0D7E148]);
    atomic_store(result, (unint64_t *)&qword_1EDAE19B8);
  }
  return result;
}

unint64_t sub_1DA65B158()
{
  unint64_t result;

  result = qword_1EDAE1998;
  if (!qword_1EDAE1998)
  {
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7D7A8], MEMORY[0x1E0D7D7A0]);
    atomic_store(result, (unint64_t *)&qword_1EDAE1998);
  }
  return result;
}

uint64_t RemoveAbandonedDownloadsTipProvider.__allocating_init(asPartOf:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  RemoveAbandonedDownloadsTipProvider.init(asPartOf:)(a1);
  return v2;
}

void sub_1DA65B1D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD v5[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE44C0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v0 + 32))
  {
    v5[1] = *(_QWORD *)(v0 + 32);
    sub_1DA66BE60();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE4798);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4AC0);
    sub_1DA4841D4((unint64_t *)&unk_1EDAE4788, (uint64_t *)&unk_1EDAE4798, MEMORY[0x1E0C95D90]);
    sub_1DA66E17C();
    swift_release();
    sub_1DA4841D4((unint64_t *)&unk_1EDAE44B0, &qword_1EDAE44C0, MEMORY[0x1E0C95950]);
    sub_1DA66E11C();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DA65B310@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t inited;
  unint64_t v5;
  uint64_t result;

  v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4D30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DA678510;
  *(_BYTE *)(inited + 32) = 0;
  *(_QWORD *)(inited + 40) = v3;
  v5 = sub_1DA640834(inited);
  swift_setDeallocating();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4098);
  result = swift_arrayDestroy();
  *a2 = v5;
  return result;
}

_QWORD *RemoveAbandonedDownloadsTipProvider.init(asPartOf:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  void *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  id v50;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE20A0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE46D0);
  v8 = *(_QWORD *)(v7 - 8);
  v39 = v7;
  v40 = v8;
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4568);
  v12 = *(_QWORD *)(v11 - 8);
  v41 = (void *)v11;
  v42 = v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE48A0);
  v16 = *(_QWORD *)(v15 - 8);
  v44 = v15;
  v45 = v16;
  MEMORY[0x1E0C80A78](v15);
  v38 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4428);
  v19 = *(_QWORD *)(v18 - 8);
  v46 = v18;
  v47 = v19;
  MEMORY[0x1E0C80A78](v18);
  v43 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE42E0);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[4] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE47C8);
  swift_allocObject();
  v24 = (void *)sub_1DA66DFD8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE0050);
  sub_1DA66EDDC();
  v25 = objc_msgSend(v48, sel_privateQueueContext);
  swift_unknownObjectRelease();
  *(_QWORD *)((char *)v2 + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_objectGraph) = a1;
  sub_1DA47D774(0, &qword_1EDADEC00);
  sub_1DA66BE60();
  sub_1DA670048();
  sub_1DA4A686C((uint64_t)v23, (uint64_t)v2 + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_coreDataObserver, (uint64_t *)&unk_1EDAE42E0);
  v2[5] = v25;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE4C60);
  v26 = swift_allocObject();
  *(_DWORD *)(v26 + 24) = 0;
  *(_QWORD *)(v26 + 16) = 0;
  *(_QWORD *)((char *)v2 + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_observerSink) = v26;
  v2[2] = v24;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F026E950);
  swift_allocObject();
  v37 = v25;
  sub_1DA66BE60();
  v2[3] = sub_1DA66DFD8();
  v48 = v24;
  sub_1DA47D774(0, (unint64_t *)&qword_1EDAE5050);
  v50 = (id)sub_1DA66FE5C();
  v27 = sub_1DA66FE8C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v6, 1, 1, v27);
  sub_1DA4841D4(&qword_1EDAE47C0, &qword_1EDAE47C8, MEMORY[0x1E0C95F48]);
  sub_1DA4A89F0();
  sub_1DA66E248();
  sub_1DA47E2F0((uint64_t)v6, (uint64_t *)&unk_1EDAE20A0);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE4B00);
  sub_1DA4841D4(&qword_1EDAE46C8, &qword_1EDAE46D0, MEMORY[0x1E0C95CB8]);
  v28 = v39;
  sub_1DA66E17C();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v28);
  v29 = sub_1DA4841D4(&qword_1EDAE4560, &qword_1EDAE4568, MEMORY[0x1E0C95950]);
  v30 = v38;
  v31 = v41;
  sub_1DA66E104();
  (*(void (**)(char *, void *))(v42 + 8))(v14, v31);
  swift_allocObject();
  swift_weakInit();
  sub_1DA66BE60();
  v48 = v31;
  v49 = v29;
  swift_getOpaqueTypeConformance2();
  v32 = v44;
  v33 = v43;
  sub_1DA66E134();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v30, v32);
  swift_release();
  sub_1DA4841D4((unint64_t *)&unk_1EDAE4418, &qword_1EDAE4428, MEMORY[0x1E0C957C0]);
  v34 = v46;
  v35 = sub_1DA66E11C();

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v33, v34);
  v2[4] = v35;
  swift_release();
  return v2;
}

uint64_t sub_1DA65B924@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  __int128 v13;
  uint64_t v14;
  __int128 v15[2];
  _BYTE v16[40];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _UNKNOWN **v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F026EA08);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = xmmword_1DA678510;
  sub_1DA49CC94(a1, (uint64_t)v6, (uint64_t *)&unk_1F026EA08);
  v7 = type metadata accessor for RemoveAbandonedDownloadsTip();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    sub_1DA47E2F0((uint64_t)v6, (uint64_t *)&unk_1F026EA08);
    v18 = 0u;
    v19 = 0u;
    v20 = 0;
  }
  else
  {
    *((_QWORD *)&v19 + 1) = v7;
    v20 = &protocol witness table for RemoveAbandonedDownloadsTip;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
    sub_1DA65EAF8((uint64_t)v6, (uint64_t)boxed_opaque_existential_1);
  }
  sub_1DA49CC94((uint64_t)&v18, (uint64_t)v16, &qword_1EDAE4078);
  sub_1DA4A686C((uint64_t)v16, (uint64_t)&v13, &qword_1EDAE4078);
  if (v14)
  {
    sub_1DA4841BC(&v13, (uint64_t)v15);
    sub_1DA4841BC(v15, (uint64_t)&v13);
    v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_1DA53FE50(0, v9[2] + 1, 1, v9);
    v11 = v9[2];
    v10 = v9[3];
    if (v11 >= v10 >> 1)
      v9 = sub_1DA53FE50((_QWORD *)(v10 > 1), v11 + 1, 1, v9);
    v9[2] = v11 + 1;
    sub_1DA4841BC(&v13, (uint64_t)&v9[5 * v11 + 4]);
  }
  else
  {
    sub_1DA47E2F0((uint64_t)&v13, &qword_1EDAE4078);
    v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4078);
  result = swift_arrayDestroy();
  *a2 = v9;
  return result;
}

uint64_t sub_1DA65BB2C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DA65BB50()
{
  uint64_t result;
  uint64_t v1;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = *(_QWORD *)(result + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_observerSink);
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
    if (!*(_QWORD *)(v1 + 16))
      *(_QWORD *)(v1 + 16) = sub_1DA65BC3C();
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
    return swift_release();
  }
  return result;
}

uint64_t sub_1DA65BBD8()
{
  return sub_1DA65BB50();
}

uint64_t sub_1DA65BBE0()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F026E950);
  sub_1DA4841D4(&qword_1F026E960, (uint64_t *)&unk_1F026E950, MEMORY[0x1E0C95F40]);
  return sub_1DA66E080();
}

uint64_t sub_1DA65BC3C()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4850);
  v21 = *(_QWORD *)(v2 - 8);
  v22 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DA66DEF4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE42E0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DA66D9A8();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA49CC94(v1 + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_coreDataObserver, (uint64_t)v11, (uint64_t *)&unk_1EDAE42E0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_1DA47E2F0((uint64_t)v11, (uint64_t *)&unk_1EDAE42E0);
    sub_1DA66DED0();
    v16 = sub_1DA66DEDC();
    v17 = sub_1DA66FDA8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DA478000, v16, v17, "Unable to attach to core data observer, entity may be invalid. Only updating tip based on defaults data", v18, 2u);
      MEMORY[0x1DF0A0474](v18, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E968);
    sub_1DA66E038();
    v19 = sub_1DA65CA64((uint64_t)v4);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v22);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    v19 = sub_1DA65BEB4((uint64_t)v15);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  return v19;
}

uint64_t sub_1DA65BEB4(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  char *v13;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  char *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v113;

  v84 = a1;
  v101 = *v1;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE20A0);
  MEMORY[0x1E0C80A78](v2);
  v106 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E970);
  v5 = *(_QWORD *)(v4 - 8);
  v107 = v4;
  v108 = v5;
  MEMORY[0x1E0C80A78](v4);
  v104 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E978);
  v8 = *(_QWORD *)(v7 - 8);
  v109 = v7;
  v110 = v8;
  MEMORY[0x1E0C80A78](v7);
  v105 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_1DA66FEB0();
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x1E0C80A78](v76);
  v11 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4680);
  v79 = *(_QWORD *)(v77 - 8);
  MEMORY[0x1E0C80A78](v77);
  v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE43C8);
  v82 = *(_QWORD *)(v81 - 8);
  MEMORY[0x1E0C80A78](v81);
  v15 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E980);
  v87 = *(_QWORD *)(v86 - 8);
  MEMORY[0x1E0C80A78](v86);
  v17 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E988);
  v91 = *(_QWORD *)(v88 - 8);
  MEMORY[0x1E0C80A78](v88);
  v80 = (char *)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E990);
  v93 = *(_QWORD *)(v92 - 8);
  MEMORY[0x1E0C80A78](v92);
  v83 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E998);
  v21 = *(_QWORD *)(v20 - 8);
  v95 = v20;
  v96 = v21;
  MEMORY[0x1E0C80A78](v20);
  v85 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E9A0);
  v24 = *(_QWORD *)(v23 - 8);
  v97 = v23;
  v98 = v24;
  MEMORY[0x1E0C80A78](v23);
  v90 = (char *)&v72 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026E9A8);
  v103 = *(_QWORD *)(v100 - 8);
  MEMORY[0x1E0C80A78](v100);
  v94 = (char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE43E0);
  v102 = *(_QWORD *)(v112 - 8);
  MEMORY[0x1E0C80A78](v112);
  v28 = (char *)&v72 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_1DA66FDF0();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = MEMORY[0x1E0C80A78](v29);
  v33 = (char *)&v72 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = *(uint64_t *)((char *)v1 + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_objectGraph);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v30 + 104))(v33, *MEMORY[0x1E0D7EF98], v29, v31);
  v34 = (void *)sub_1DA4EAF00((uint64_t)v33);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v29);
  v35 = *MEMORY[0x1E0D7F368];
  sub_1DA66F8BC();
  v99 = v34;
  v36 = (void *)sub_1DA66FDCC();
  swift_bridgeObjectRelease();
  v113 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2218);
  v37 = swift_allocObject();
  v72 = xmmword_1DA678510;
  *(_OWORD *)(v37 + 16) = xmmword_1DA678510;
  *(_QWORD *)(v37 + 32) = objc_msgSend(v34, sel_integerForKey_, v35);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE1C60);
  sub_1DA4841D4(&qword_1EDAE1C58, (uint64_t *)&unk_1EDAE1C60, MEMORY[0x1E0C95D90]);
  v73 = v28;
  sub_1DA66E23C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1DA66FE98();
  v74 = sub_1DA47D774(0, (unint64_t *)&qword_1EDAE5050);
  v38 = (void *)sub_1DA66FE5C();
  v113 = v38;
  sub_1DA66D9A8();
  sub_1DA47E32C((unint64_t *)&unk_1EDAE42D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D7EA08], MEMORY[0x1E0D7EA00]);
  v78 = sub_1DA4A89F0();
  sub_1DA66E260();

  (*(void (**)(char *, uint64_t))(v75 + 8))(v11, v76);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4D78);
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v72;
  *(_QWORD *)(v39 + 32) = MEMORY[0x1E0DEE9D8];
  sub_1DA4841D4((unint64_t *)&unk_1EDAE4670, &qword_1EDAE4680, MEMORY[0x1E0C95C28]);
  v40 = v77;
  sub_1DA66E23C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v13, v40);
  v41 = MEMORY[0x1E0C95788];
  sub_1DA4841D4((unint64_t *)&unk_1EDAE43B8, (uint64_t *)&unk_1EDAE43C8, MEMORY[0x1E0C95788]);
  v42 = v81;
  sub_1DA66E17C();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v15, v42);
  v43 = v111;
  v113 = *(id *)(v111 + 24);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F026E950);
  sub_1DA4841D4(&qword_1F026E9B0, &qword_1F026E980, MEMORY[0x1E0C95950]);
  sub_1DA4841D4(&qword_1F026E9B8, (uint64_t *)&unk_1F026E950, MEMORY[0x1E0C95F48]);
  v44 = v80;
  v45 = v86;
  sub_1DA66E1D0();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v17, v45);
  sub_1DA4841D4((unint64_t *)&unk_1F026E9C0, &qword_1F026E988, MEMORY[0x1E0C95A60]);
  sub_1DA4841D4(&qword_1EDAE43D8, &qword_1EDAE43E0, v41);
  v46 = v83;
  v47 = v88;
  sub_1DA66E158();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v44, v47);
  sub_1DA4841D4((unint64_t *)&unk_1F026E9D0, &qword_1F026E990, MEMORY[0x1E0C95698]);
  v48 = v85;
  v49 = v92;
  sub_1DA66E128();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v46, v49);
  v50 = *(void **)(v43 + 40);
  v51 = swift_allocObject();
  v52 = v101;
  *(_QWORD *)(v51 + 16) = v50;
  *(_QWORD *)(v51 + 24) = v52;
  v53 = v50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4468);
  v54 = v90;
  v55 = v95;
  sub_1DA66DF0C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v48, v55);
  sub_1DA4841D4(&qword_1F026E9E0, &qword_1F026E9A0, MEMORY[0x1E0C95708]);
  v56 = MEMORY[0x1E0C957E8];
  sub_1DA4841D4((unint64_t *)&unk_1EDAE4458, &qword_1EDAE4468, MEMORY[0x1E0C957E8]);
  v57 = v94;
  v58 = v97;
  sub_1DA66E2B4();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v54, v58);
  v59 = (_QWORD *)swift_allocObject();
  v60 = v89;
  v59[2] = v53;
  v59[3] = v60;
  v59[4] = v52;
  v61 = v53;
  sub_1DA66BE60();
  sub_1DA66DF78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4450);
  v62 = MEMORY[0x1E0C95B78];
  sub_1DA4841D4((unint64_t *)&unk_1F026E9E8, &qword_1F026E9A8, MEMORY[0x1E0C95B78]);
  sub_1DA4841D4((unint64_t *)&unk_1EDAE4440, &qword_1EDAE4450, v56);
  v63 = v104;
  v64 = v100;
  sub_1DA66E2B4();
  swift_release();
  v113 = (id)sub_1DA66FE5C();
  v65 = sub_1DA66FE8C();
  v66 = (uint64_t)v106;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v106, 1, 1, v65);
  sub_1DA4841D4(&qword_1F026E9F8, &qword_1F026E970, v62);
  v67 = v105;
  v68 = v107;
  sub_1DA66E248();
  sub_1DA47E2F0(v66, (uint64_t *)&unk_1EDAE20A0);

  (*(void (**)(char *, uint64_t))(v108 + 8))(v63, v68);
  swift_allocObject();
  swift_weakInit();
  sub_1DA4841D4(&qword_1F026EA00, &qword_1F026E978, MEMORY[0x1E0C95CB8]);
  v69 = v109;
  v70 = sub_1DA66E284();

  swift_release();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v67, v69);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v57, v64);
  (*(void (**)(char *, uint64_t))(v102 + 8))(v73, v112);
  return v70;
}

uint64_t sub_1DA65CA64(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  char *v13;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  char *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  id v113;

  v84 = a1;
  v101 = *v1;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE20A0);
  MEMORY[0x1E0C80A78](v2);
  v106 = (char *)&v72 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA58);
  v5 = *(_QWORD *)(v4 - 8);
  v107 = v4;
  v108 = v5;
  MEMORY[0x1E0C80A78](v4);
  v104 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA60);
  v8 = *(_QWORD *)(v7 - 8);
  v109 = v7;
  v110 = v8;
  MEMORY[0x1E0C80A78](v7);
  v105 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_1DA66FEB0();
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x1E0C80A78](v76);
  v11 = (char *)&v72 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA68);
  v79 = *(_QWORD *)(v77 - 8);
  MEMORY[0x1E0C80A78](v77);
  v13 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA70);
  v82 = *(_QWORD *)(v81 - 8);
  MEMORY[0x1E0C80A78](v81);
  v15 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA78);
  v87 = *(_QWORD *)(v86 - 8);
  MEMORY[0x1E0C80A78](v86);
  v17 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA80);
  v91 = *(_QWORD *)(v88 - 8);
  MEMORY[0x1E0C80A78](v88);
  v80 = (char *)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA88);
  v93 = *(_QWORD *)(v92 - 8);
  MEMORY[0x1E0C80A78](v92);
  v83 = (char *)&v72 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA90);
  v21 = *(_QWORD *)(v20 - 8);
  v95 = v20;
  v96 = v21;
  MEMORY[0x1E0C80A78](v20);
  v85 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA98);
  v24 = *(_QWORD *)(v23 - 8);
  v97 = v23;
  v98 = v24;
  MEMORY[0x1E0C80A78](v23);
  v90 = (char *)&v72 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EAA0);
  v103 = *(_QWORD *)(v100 - 8);
  MEMORY[0x1E0C80A78](v100);
  v94 = (char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE43E0);
  v102 = *(_QWORD *)(v112 - 8);
  MEMORY[0x1E0C80A78](v112);
  v28 = (char *)&v72 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_1DA66FDF0();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = MEMORY[0x1E0C80A78](v29);
  v33 = (char *)&v72 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = *(uint64_t *)((char *)v1 + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_objectGraph);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v30 + 104))(v33, *MEMORY[0x1E0D7EF98], v29, v31);
  v34 = (void *)sub_1DA4EAF00((uint64_t)v33);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v29);
  v35 = *MEMORY[0x1E0D7F368];
  sub_1DA66F8BC();
  v99 = v34;
  v36 = (void *)sub_1DA66FDCC();
  swift_bridgeObjectRelease();
  v113 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2218);
  v37 = swift_allocObject();
  v72 = xmmword_1DA678510;
  *(_OWORD *)(v37 + 16) = xmmword_1DA678510;
  *(_QWORD *)(v37 + 32) = objc_msgSend(v34, sel_integerForKey_, v35);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE1C60);
  sub_1DA4841D4(&qword_1EDAE1C58, (uint64_t *)&unk_1EDAE1C60, MEMORY[0x1E0C95D90]);
  v73 = v28;
  sub_1DA66E23C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1DA66FE98();
  v74 = sub_1DA47D774(0, (unint64_t *)&qword_1EDAE5050);
  v38 = (void *)sub_1DA66FE5C();
  v113 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4850);
  sub_1DA4841D4(&qword_1F026EAA8, &qword_1EDAE4850, MEMORY[0x1E0C960D0]);
  v78 = sub_1DA4A89F0();
  sub_1DA66E260();

  (*(void (**)(char *, uint64_t))(v75 + 8))(v11, v76);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4D78);
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = v72;
  *(_QWORD *)(v39 + 32) = MEMORY[0x1E0DEE9D8];
  sub_1DA4841D4(&qword_1F026EAB0, &qword_1F026EA68, MEMORY[0x1E0C95C28]);
  v40 = v77;
  sub_1DA66E23C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v13, v40);
  v41 = MEMORY[0x1E0C95788];
  sub_1DA4841D4(&qword_1F026EAB8, &qword_1F026EA70, MEMORY[0x1E0C95788]);
  v42 = v81;
  sub_1DA66E17C();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v15, v42);
  v43 = v111;
  v113 = *(id *)(v111 + 24);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F026E950);
  sub_1DA4841D4(&qword_1F026EAC0, &qword_1F026EA78, MEMORY[0x1E0C95950]);
  sub_1DA4841D4(&qword_1F026E9B8, (uint64_t *)&unk_1F026E950, MEMORY[0x1E0C95F48]);
  v44 = v80;
  v45 = v86;
  sub_1DA66E1D0();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v17, v45);
  sub_1DA4841D4(&qword_1F026EAC8, &qword_1F026EA80, MEMORY[0x1E0C95A60]);
  sub_1DA4841D4(&qword_1EDAE43D8, &qword_1EDAE43E0, v41);
  v46 = v83;
  v47 = v88;
  sub_1DA66E158();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v44, v47);
  sub_1DA4841D4(&qword_1F026EAD0, &qword_1F026EA88, MEMORY[0x1E0C95698]);
  v48 = v85;
  v49 = v92;
  sub_1DA66E128();
  (*(void (**)(char *, uint64_t))(v93 + 8))(v46, v49);
  v50 = *(void **)(v43 + 40);
  v51 = swift_allocObject();
  v52 = v101;
  *(_QWORD *)(v51 + 16) = v50;
  *(_QWORD *)(v51 + 24) = v52;
  v53 = v50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4468);
  v54 = v90;
  v55 = v95;
  sub_1DA66DF0C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v96 + 8))(v48, v55);
  sub_1DA4841D4(&qword_1F026EAD8, &qword_1F026EA98, MEMORY[0x1E0C95708]);
  v56 = MEMORY[0x1E0C957E8];
  sub_1DA4841D4((unint64_t *)&unk_1EDAE4458, &qword_1EDAE4468, MEMORY[0x1E0C957E8]);
  v57 = v94;
  v58 = v97;
  sub_1DA66E2B4();
  (*(void (**)(char *, uint64_t))(v98 + 8))(v54, v58);
  v59 = (_QWORD *)swift_allocObject();
  v60 = v89;
  v59[2] = v53;
  v59[3] = v60;
  v59[4] = v52;
  v61 = v53;
  sub_1DA66BE60();
  sub_1DA66DF78();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4450);
  v62 = MEMORY[0x1E0C95B78];
  sub_1DA4841D4(&qword_1F026EAE0, &qword_1F026EAA0, MEMORY[0x1E0C95B78]);
  sub_1DA4841D4((unint64_t *)&unk_1EDAE4440, &qword_1EDAE4450, v56);
  v63 = v104;
  v64 = v100;
  sub_1DA66E2B4();
  swift_release();
  v113 = (id)sub_1DA66FE5C();
  v65 = sub_1DA66FE8C();
  v66 = (uint64_t)v106;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v106, 1, 1, v65);
  sub_1DA4841D4(&qword_1F026EAE8, &qword_1F026EA58, v62);
  v67 = v105;
  v68 = v107;
  sub_1DA66E248();
  sub_1DA47E2F0(v66, (uint64_t *)&unk_1EDAE20A0);

  (*(void (**)(char *, uint64_t))(v108 + 8))(v63, v68);
  swift_allocObject();
  swift_weakInit();
  sub_1DA4841D4(&qword_1F026EAF0, &qword_1F026EA60, MEMORY[0x1E0C95CB8]);
  v69 = v109;
  v70 = sub_1DA66E284();

  swift_release();
  (*(void (**)(char *, uint64_t))(v110 + 8))(v67, v69);
  (*(void (**)(char *, uint64_t))(v103 + 8))(v57, v64);
  (*(void (**)(char *, uint64_t))(v102 + 8))(v73, v112);
  return v70;
}

_QWORD *sub_1DA65D618@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 0x100000000;
  *(_QWORD *)a2 = (unint64_t)(*result == 0x100000000) << 32;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_1DA65D63C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE4B30);
  sub_1DA670060();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA40);
  sub_1DA4841D4((unint64_t *)&unk_1F026EA48, &qword_1F026EA40, MEMORY[0x1E0C96108]);
  sub_1DA66E140();
  swift_release();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4468);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

uint64_t sub_1DA65D714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4468);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_1DA65D754(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F026EA08);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  sub_1DA47D774(0, &qword_1EDAE4BE0);
  sub_1DA66EDDC();
  v11 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EA18);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v10;
  v12[3] = a4;
  v12[4] = a2;
  v12[5] = v11;
  swift_bridgeObjectRetain();
  v13 = a2;
  v17 = sub_1DA66E044();
  v14 = type metadata accessor for RemoveAbandonedDownloadsTip();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  sub_1DA4841D4(&qword_1F026EA30, &qword_1F026EA18, MEMORY[0x1E0C96108]);
  sub_1DA66E140();
  sub_1DA47E2F0((uint64_t)v9, (uint64_t *)&unk_1F026EA08);
  return swift_release();
}

uint64_t sub_1DA65D8D0()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1DA66BE60();
    swift_release();
    sub_1DA66DFCC();
    return swift_release();
  }
  return result;
}

uint64_t sub_1DA65D94C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a1;
  v5[4] = a2;
  v6 = sub_1DA66CBE0();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  v5[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DA65D9C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 32);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE4B30);
  sub_1DA4841D4(&qword_1EDAE4B40, (uint64_t *)&unk_1EDAE4B30, MEMORY[0x1E0DEAF50]);
  if ((sub_1DA66FCDC() & 1) != 0 && !sub_1DA65E480())
  {
    sub_1DA66D660();
    if (objc_msgSend((id)objc_opt_self(), sel_isRunningOnDesktop))
    {
      v4 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 88) = v4;
      *v4 = v0;
      v4[1] = sub_1DA65DB2C;
      return sub_1DA55E26C(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
    }
    else
    {
      v5 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v5;
      *v5 = v0;
      v5[1] = sub_1DA65DB90;
      return sub_1DA55E714(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
    }
  }
  else
  {
    v1 = *(_QWORD *)(v0 + 24);
    v2 = type metadata accessor for RemoveAbandonedDownloadsTip();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1DA65DB2C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DA65DB90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DA65DBF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 32))(v1, *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  swift_bridgeObjectRetain();
  RemoveAbandonedDownloadsTip.init(reclaimedSpace:episodesToDelete:)(v1, v2, v3);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = type metadata accessor for RemoveAbandonedDownloadsTip();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 0, 1, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DA65DC94()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DA65DCD0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1DA65DD0C(_QWORD *a1@<X8>)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;

  sub_1DA66F8BC();
  v3 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v4 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithEntityName_, v4);

  objc_msgSend(v5, sel_setResultType_, 1);
  sub_1DA47D774(0, &qword_1EDADEC00);
  v6 = (void *)MEMORY[0x1DF09EBD8]();
  objc_msgSend(v5, sel_setPredicate_, v6);

  sub_1DA47D774(0, (unint64_t *)&qword_1EDAE4C00);
  v7 = sub_1DA670090();
  if (v1)
  {

    return;
  }
  v8 = v7;
  if (!(v7 >> 62))
  {
    v9 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9)
      goto LABEL_5;
LABEL_18:
    swift_bridgeObjectRelease();

    v10 = MEMORY[0x1E0DEE9D8];
LABEL_19:
    *a1 = v10;
    return;
  }
  swift_bridgeObjectRetain();
  v9 = sub_1DA6705A0();
  swift_bridgeObjectRelease();
  if (!v9)
    goto LABEL_18;
LABEL_5:
  v23 = MEMORY[0x1E0DEE9D8];
  sub_1DA509D34(0, v9 & ~(v9 >> 63), 0);
  if ((v9 & 0x8000000000000000) == 0)
  {
    v21 = v5;
    v22 = a1;
    v10 = v23;
    if ((v8 & 0xC000000000000001) != 0)
    {
      v11 = 0;
      do
      {
        v12 = MEMORY[0x1DF09EE48](v11, v8);
        v14 = *(_QWORD *)(v23 + 16);
        v13 = *(_QWORD *)(v23 + 24);
        if (v14 >= v13 >> 1)
          sub_1DA509D34(v13 > 1, v14 + 1, 1);
        ++v11;
        *(_QWORD *)(v23 + 16) = v14 + 1;
        v15 = v23 + 24 * v14;
        *(_QWORD *)(v15 + 32) = v12;
        *(_QWORD *)(v15 + 40) = 0;
        *(_BYTE *)(v15 + 48) = 2;
      }
      while (v9 != v11);
    }
    else
    {
      v16 = 0;
      do
      {
        v18 = *(_QWORD *)(v23 + 16);
        v17 = *(_QWORD *)(v23 + 24);
        v19 = *(id *)(v8 + 8 * v16 + 32);
        if (v18 >= v17 >> 1)
          sub_1DA509D34(v17 > 1, v18 + 1, 1);
        ++v16;
        *(_QWORD *)(v23 + 16) = v18 + 1;
        v20 = v23 + 24 * v18;
        *(_QWORD *)(v20 + 32) = v19;
        *(_QWORD *)(v20 + 40) = 0;
        *(_BYTE *)(v20 + 48) = 2;
      }
      while (v9 != v16);
    }
    swift_bridgeObjectRelease();

    a1 = v22;
    goto LABEL_19;
  }
  __break(1u);
}

uint64_t RemoveAbandonedDownloadsTipProvider.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();

  sub_1DA47E2F0(v0 + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_coreDataObserver, (uint64_t *)&unk_1EDAE42E0);
  swift_release();
  swift_release();
  return v0;
}

uint64_t RemoveAbandonedDownloadsTipProvider.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();

  sub_1DA47E2F0(v0 + OBJC_IVAR____TtC10PodcastsUI35RemoveAbandonedDownloadsTipProvider_coreDataObserver, (uint64_t *)&unk_1EDAE42E0);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

void sub_1DA65E0BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD v5[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE44C0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(*(_QWORD *)v0 + 32))
  {
    v5[1] = *(_QWORD *)(*(_QWORD *)v0 + 32);
    sub_1DA66BE60();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE4798);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4AC0);
    sub_1DA4841D4((unint64_t *)&unk_1EDAE4788, (uint64_t *)&unk_1EDAE4798, MEMORY[0x1E0C95D90]);
    sub_1DA66E17C();
    swift_release();
    sub_1DA4841D4((unint64_t *)&unk_1EDAE44B0, &qword_1EDAE44C0, MEMORY[0x1E0C95950]);
    sub_1DA66E11C();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DA65E1F8()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F026E950);
  sub_1DA4841D4(&qword_1F026E960, (uint64_t *)&unk_1F026E950, MEMORY[0x1E0C95F40]);
  return sub_1DA66E080();
}

uint64_t sub_1DA65E258()
{
  return type metadata accessor for RemoveAbandonedDownloadsTipProvider();
}

uint64_t type metadata accessor for RemoveAbandonedDownloadsTipProvider()
{
  uint64_t result;

  result = qword_1EDAE3F90;
  if (!qword_1EDAE3F90)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1DA65E29C()
{
  unint64_t v0;

  sub_1DA65E360();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for RemoveAbandonedDownloadsTipProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RemoveAbandonedDownloadsTipProvider.tips.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of RemoveAbandonedDownloadsTipProvider.__allocating_init(asPartOf:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of RemoveAbandonedDownloadsTipProvider.requestRefresh()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

void sub_1DA65E360()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDAE42F0)
  {
    sub_1DA66D9A8();
    v0 = sub_1DA670294();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDAE42F0);
  }
}

uint64_t sub_1DA65E3B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA65D63C(a1);
}

uint64_t sub_1DA65E3C0(uint64_t *a1)
{
  uint64_t v1;

  return sub_1DA65D754(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1DA65E3CC()
{
  return sub_1DA65D8D0();
}

uint64_t sub_1DA65E3D4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1DA65E408(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1DA4AD77C;
  return sub_1DA65D94C(a1, v4, v5, v7, v6);
}

BOOL sub_1DA65E480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char *v21;
  id v22;
  uint64_t v23;
  void (*v24)(char *, _QWORD, _QWORD *);
  _QWORD *v25;
  void (*v26)(char *, _QWORD *);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void (*v40)(char *, uint64_t);
  void (*v41)(char *, uint64_t);
  char *v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  _QWORD *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  _BOOL8 v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  _OWORD v72[2];

  v0 = sub_1DA66DEF4();
  v63 = *(_QWORD *)(v0 - 8);
  v64 = v0;
  MEMORY[0x1E0C80A78](v0);
  v66 = (uint64_t)&v58 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = (_QWORD *)sub_1DA66C538();
  v2 = *(v67 - 1);
  MEMORY[0x1E0C80A78](v67);
  v4 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v58 - v9;
  v70 = sub_1DA66C430();
  v68 = *(_QWORD *)(v70 - 8);
  MEMORY[0x1E0C80A78](v70);
  v62 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v60 = (char *)&v58 - v13;
  MEMORY[0x1E0C80A78](v14);
  v61 = (char *)&v58 - v15;
  MEMORY[0x1E0C80A78](v16);
  v69 = (char *)&v58 - v17;
  v18 = sub_1DA66C544();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = objc_msgSend((id)objc_opt_self(), sel__applePodcastsFoundationSharedUserDefaults);
  sub_1DA66C52C();
  v23 = *MEMORY[0x1E0D7F300];
  if (!objc_msgSend(v22, sel_objectForKey_, *MEMORY[0x1E0D7F300]))
  {
    memset(v72, 0, sizeof(v72));

    sub_1DA47E2F0((uint64_t)v72, &qword_1EDAE5130);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
    return 0;
  }
  v65 = v19;
  v59 = v18;
  sub_1DA670360();
  swift_unknownObjectRelease();
  sub_1DA47E2F0((uint64_t)v72, &qword_1EDAE5130);
  objc_msgSend(v22, sel_doubleForKey_, v23);
  sub_1DA66C3AC();
  v24 = *(void (**)(char *, _QWORD, _QWORD *))(v2 + 104);
  v25 = v67;
  v24(v4, *MEMORY[0x1E0CB1160], v67);
  sub_1DA66C514();
  v26 = *(void (**)(char *, _QWORD *))(v2 + 8);
  v26(v4, v25);
  sub_1DA49CC94((uint64_t)v10, (uint64_t)v7, &qword_1EDADE6C8);
  v27 = (uint64_t)v10;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v7, 1, v70) == 1)
  {
    v67 = v22;
    sub_1DA47E2F0((uint64_t)v7, &qword_1EDADE6C8);
    v28 = v66;
    sub_1DA66DED0();
    v29 = v62;
    (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v62, v69, v70);
    v30 = sub_1DA66DEDC();
    v31 = sub_1DA66FDA8();
    v32 = os_log_type_enabled(v30, v31);
    v33 = v65;
    if (v32)
    {
      v34 = swift_slowAlloc();
      v61 = v21;
      v35 = (uint8_t *)v34;
      v36 = swift_slowAlloc();
      *(_QWORD *)&v72[0] = v36;
      *(_DWORD *)v35 = 136315138;
      sub_1DA47E32C(&qword_1F026EA38, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
      v37 = v70;
      v38 = sub_1DA670684();
      v71 = sub_1DA49AD00(v38, v39, (uint64_t *)v72);
      sub_1DA6702C4();
      swift_bridgeObjectRelease();
      v40 = *(void (**)(char *, uint64_t))(v68 + 8);
      v40(v29, v37);
      _os_log_impl(&dword_1DA478000, v30, v31, "Unable to compute next date for the tip to be throttled after an accept. Hiding by default, last presentation date: %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0A0474](v36, -1, -1);
      MEMORY[0x1DF0A0474](v35, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v66, v64);
      sub_1DA47E2F0(v27, &qword_1EDADE6C8);
      v40(v69, v37);
      v41 = *(void (**)(char *, uint64_t))(v65 + 8);
      v42 = v61;
    }
    else
    {

      v55 = *(void (**)(char *, uint64_t))(v68 + 8);
      v56 = v70;
      v55(v29, v70);
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v28, v64);
      sub_1DA47E2F0((uint64_t)v10, &qword_1EDADE6C8);
      v55(v69, v56);
      v41 = *(void (**)(char *, uint64_t))(v33 + 8);
      v42 = v21;
    }
    v41(v42, v59);
    return 0;
  }
  v43 = v68;
  v44 = *(void (**)(char *, char *, uint64_t))(v68 + 32);
  v66 = v27;
  v45 = v61;
  v46 = v7;
  v47 = v70;
  v44(v61, v46, v70);
  v48 = v60;
  sub_1DA66C418();
  v49 = v21;
  v50 = v67;
  v24(v4, *MEMORY[0x1E0CB1130], v67);
  v51 = v49;
  v52 = sub_1DA66C520();

  v26(v4, v50);
  v53 = *(void (**)(char *, uint64_t))(v43 + 8);
  v53(v48, v47);
  v54 = v52 == -1;
  v53(v45, v47);
  sub_1DA47E2F0(v66, &qword_1EDADE6C8);
  v53(v69, v47);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v51, v59);
  return v54;
}

uint64_t sub_1DA65EAA4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t objectdestroy_5Tm_0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DA65EAF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RemoveAbandonedDownloadsTip();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t ShelfIDBuilder.components.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*ShelfIDBuilder.components.modify())()
{
  return nullsub_1;
}

PodcastsUI::ShelfIDBuilder __swiftcall ShelfIDBuilder.init(named:)(Swift::String named)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE53E0);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1DA678510;
  sub_1DA66F988();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = 0xD000000000000019;
  *(_QWORD *)(v1 + 40) = 0x80000001DA691E40;
  return (PodcastsUI::ShelfIDBuilder)v1;
}

Swift::String __swiftcall ShelfIDBuilder.build()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  Swift::String result;

  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5340);
  sub_1DA539538();
  v0 = sub_1DA66F838();
  v2 = v1;
  swift_bridgeObjectRelease();
  v3 = v0;
  v4 = v2;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

Swift::Void __swiftcall ShelfIDBuilder.addAttribute(_:named:)(Swift::String _, Swift::String named)
{
  _QWORD **v2;
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;

  v3 = v2;
  sub_1DA66F988();
  sub_1DA66F988();
  sub_1DA66F988();
  sub_1DA66F988();
  v4 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_1DA4981C8(0, v4[2] + 1, 1, v4);
  v6 = v4[2];
  v5 = v4[3];
  if (v6 >= v5 >> 1)
    v4 = sub_1DA4981C8((_QWORD *)(v5 > 1), v6 + 1, 1, v4);
  v4[2] = v6 + 1;
  v7 = &v4[2 * v6];
  v7[4] = 91;
  v7[5] = 0xE100000000000000;
  *v3 = v4;
}

PodcastsUI::ShelfIDBuilder __swiftcall ShelfIDBuilder.addingAttribute(_:named:)(Swift::String _, Swift::String named)
{
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;
  void *v5;
  uint64_t v6;
  Swift::String v7;
  Swift::String v8;
  PodcastsUI::ShelfIDBuilder v10;

  object = named._object;
  countAndFlagsBits = named._countAndFlagsBits;
  v5 = _._object;
  v6 = _._countAndFlagsBits;
  v10.components._rawValue = v2;
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v6;
  v7._object = v5;
  v8._countAndFlagsBits = countAndFlagsBits;
  v8._object = object;
  ShelfIDBuilder.addAttribute(_:named:)(v7, v8);
  return v10;
}

uint64_t ShelfIDBuilder.addingAttribute<A>(_:named:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;

  v7 = sub_1DA670684();
  v9 = v8;
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = v7;
  v10._object = v9;
  v11._countAndFlagsBits = a2;
  v11._object = a3;
  ShelfIDBuilder.addAttribute(_:named:)(v10, v11);
  swift_bridgeObjectRelease();
  return a4;
}

{
  Swift::String v7;
  Swift::String v9;

  sub_1DA66FA54();
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = a2;
  v7._object = a3;
  ShelfIDBuilder.addAttribute(_:named:)(v9, v7);
  swift_bridgeObjectRelease();
  return a4;
}

ValueMetadata *type metadata accessor for ShelfIDBuilder()
{
  return &type metadata for ShelfIDBuilder;
}

uint64_t sub_1DA65EF14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1DA4981C8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA65F064(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_1DA53FE64(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[3 * v9 + 4];
  if (a1 + 32 < v10 + 24 * v8 && v10 < a1 + 32 + 24 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA65F1C0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_1DA540098(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE4BC0);
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA65F32C(unint64_t a1)
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
    v3 = sub_1DA6705A0();
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
    v5 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
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
    v4 = MEMORY[0x1DF09EE54](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1DA660478(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1DA66FAB4();
  }
  __break(1u);
  return result;
}

uint64_t sub_1DA65F4E4(uint64_t a1)
{
  return sub_1DA65F518(a1, (uint64_t (*)(void))sub_1DA5408BC, (uint64_t (*)(_QWORD))MEMORY[0x1E0D7E070]);
}

uint64_t sub_1DA65F4F8(unint64_t a1)
{
  return sub_1DA65F988(a1, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_1DA660694);
}

uint64_t sub_1DA65F504(uint64_t a1)
{
  return sub_1DA65F518(a1, (uint64_t (*)(void))sub_1DA5409E4, (uint64_t (*)(_QWORD))type metadata accessor for EpisodeEntity);
}

uint64_t sub_1DA65F518(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(_QWORD))
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (swift_isUniquelyReferenced_nonNull_native() && v6 + v4 <= *(_QWORD *)(v5 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_15;
  }
  v5 = a2();
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_15:
    if (!v4)
      goto LABEL_16;
    goto LABEL_18;
  }
LABEL_5:
  v10 = *(_QWORD *)(v5 + 16);
  v11 = (*(_QWORD *)(v5 + 24) >> 1) - v10;
  v12 = a3(0);
  if (v11 < v4)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v13 = *(_QWORD *)(v12 - 8);
  v14 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v15 = *(_QWORD *)(v13 + 72);
  v16 = v5 + v14 + v15 * v10;
  v17 = a1 + v14;
  v18 = v15 * v4;
  v19 = v16 + v18;
  v20 = v17 + v18;
  if (v17 < v19 && v16 < v20)
    goto LABEL_21;
  swift_arrayInitWithCopy();
  if (!v4)
  {
LABEL_16:
    result = swift_bridgeObjectRelease();
    *v3 = v5;
    return result;
  }
  v22 = *(_QWORD *)(v5 + 16);
  v23 = __OFADD__(v22, v4);
  v24 = v22 + v4;
  if (!v23)
  {
    *(_QWORD *)(v5 + 16) = v24;
    goto LABEL_16;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA65F690(uint64_t a1)
{
  return sub_1DA65F6B8(a1, (uint64_t (*)(void))sub_1DA540A0C, (uint64_t (*)(_QWORD))type metadata accessor for ChannelEntity);
}

uint64_t sub_1DA65F6A4(uint64_t a1)
{
  return sub_1DA65F6B8(a1, (uint64_t (*)(void))sub_1DA540A20, (uint64_t (*)(_QWORD))type metadata accessor for ShowEntity);
}

uint64_t sub_1DA65F6B8(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(_QWORD))
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (__OFADD__(v6, v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  if (swift_isUniquelyReferenced_nonNull_native()
    && (int64_t)(v6 + v4) <= *(_QWORD *)(v5 + 24) >> 1)
  {
    v10 = *(_QWORD *)(a1 + 16);
    if (v10)
      goto LABEL_5;
LABEL_15:
    if (!v4)
      goto LABEL_16;
    goto LABEL_18;
  }
  v5 = a2();
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
    goto LABEL_15;
LABEL_5:
  v11 = *(_QWORD *)(v5 + 16);
  v12 = (*(_QWORD *)(v5 + 24) >> 1) - v11;
  v13 = a3(0);
  if (v12 < (uint64_t)v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v14 = *(_QWORD *)(v13 - 8);
  v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v16 = *(_QWORD *)(v14 + 72);
  v17 = v5 + v15 + v16 * v11;
  v18 = a1 + v15;
  v19 = v16 * v10;
  v20 = v17 + v19;
  v21 = v18 + v19;
  if (v18 < v20 && v17 < v21)
    goto LABEL_21;
  swift_arrayInitWithCopy();
  if (v10 < v4)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v23 = *(_QWORD *)(v5 + 16);
  v24 = __OFADD__(v23, v10);
  v25 = v23 + v10;
  if (!v24)
  {
    *(_QWORD *)(v5 + 16) = v25;
LABEL_16:
    result = swift_bridgeObjectRelease();
    *v3 = v5;
    return result;
  }
LABEL_20:
  __break(1u);
LABEL_21:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA65F834(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_1DA540B84(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[8 * v9 + 4];
  if (a1 + 32 < v10 + (v8 << 6) && v10 < a1 + 32 + (v8 << 6))
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA65F988(unint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, unint64_t))
{
  unint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_23;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if (v6 >> 62)
    goto LABEL_25;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain();
    v6 = MEMORY[0x1DF09EE54](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v11 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1DA66FAB4();
  }
  __break(1u);
  return result;
}

uint64_t sub_1DA65FB44()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DA65FB68()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_weakInit();
  sub_1DA66BE60();
  sub_1DA660ACC((uint64_t)sub_1DA65FDC4, v0);
  return swift_release_n();
}

void sub_1DA65FBC8(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[6];

  v4 = sub_1DA66E9C8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DA66EA04();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    sub_1DA47D774(0, (unint64_t *)&qword_1EDAE5050);
    v15 = sub_1DA66FEC8();
    aBlock[4] = sub_1DA660FD0;
    aBlock[5] = a2;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DA4A9194;
    aBlock[3] = &block_descriptor_22_0;
    v12 = _Block_copy(aBlock);
    sub_1DA66BE60();
    swift_release();
    sub_1DA66E9EC();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1DA47E32C((unint64_t *)&qword_1EDADE6D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDADE6E0);
    sub_1DA4841D4((unint64_t *)&qword_1EDADE6F0, (uint64_t *)&unk_1EDADE6E0, MEMORY[0x1E0DEAF38]);
    sub_1DA670378();
    v13 = (void *)v15;
    MEMORY[0x1DF09E8CC](0, v11, v7, v12);
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void sub_1DA65FDC4(char a1)
{
  uint64_t v1;

  sub_1DA65FBC8(a1, v1);
}

uint64_t sub_1DA65FDCC()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    *(_BYTE *)(result + 24) = 1;
    return swift_release();
  }
  return result;
}

void sub_1DA65FE1C(char a1, void (*a2)(_QWORD), uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  if ((a1 & 1) != 0)
  {
    v5 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CFDC28]), sel_initWithBag_, v5);

    v7 = objc_msgSend(v6, sel_shouldAttemptReview);
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a2;
    *(_QWORD *)(v8 + 24) = a3;
    v10[4] = sub_1DA660FC8;
    v10[5] = v8;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 1107296256;
    v10[2] = sub_1DA529310;
    v10[3] = &block_descriptor_19_0;
    v9 = _Block_copy(v10);
    sub_1DA66BE60();
    swift_release();
    objc_msgSend(v7, sel_addFinishBlock_, v9);
    _Block_release(v9);

  }
  else
  {
    a2(0);
  }
}

void sub_1DA65FF5C(void *a1, uint64_t a2, void (*a3)(_QWORD))
{
  void *v5;
  char v6;
  id v7;

  if (a1)
  {
    sub_1DA47D774(0, (unint64_t *)&qword_1EDADE760);
    v7 = a1;
    v5 = (void *)sub_1DA67018C();
    v6 = sub_1DA6701A4();

    a3(v6 & 1);
  }
}

uint64_t sub_1DA65FFEC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v6 = sub_1DA66E9C8();
  v20 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1DA66EA04();
  v9 = *(_QWORD *)(v19 - 8);
  *(_QWORD *)&v10 = MEMORY[0x1E0C80A78](v19).n128_u64[0];
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(a1, sel_countOfSubscribedAndNotHiddenPodcasts, v10);
  v14 = sub_1DA660C6C();
  sub_1DA47D774(0, (unint64_t *)&qword_1EDAE5050);
  v15 = (void *)sub_1DA66FEC8();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = v13;
  v16[5] = v14;
  aBlock[4] = sub_1DA660F70;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DA4A9194;
  aBlock[3] = &block_descriptor_13_0;
  v17 = _Block_copy(aBlock);
  sub_1DA66BE60();
  swift_release();
  sub_1DA66E9EC();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1DA47E32C((unint64_t *)&qword_1EDADE6D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDADE6E0);
  sub_1DA4841D4((unint64_t *)&qword_1EDADE6F0, (uint64_t *)&unk_1EDADE6E0, MEMORY[0x1E0DEAF38]);
  sub_1DA670378();
  MEMORY[0x1DF09E8CC](0, v12, v8, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v19);
}

uint64_t StoreReviewPromptController.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t StoreReviewPromptController.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1DA66026C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1DA4841D4(&qword_1F026EB10, &qword_1F026EB08, MEMORY[0x1E0DEAF50]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EB08);
          v12 = sub_1DA5BCE80(v16, i, a3);
          v14 = *v13;
          sub_1DA66BE60();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for ModalSheet.Action();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA660478(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1DA4841D4(qword_1F026C508, &qword_1F026C500, MEMORY[0x1E0DEAF50]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F026C500);
          v12 = sub_1DA5BCED8(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1DA47D774(0, &qword_1F026C4E8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA660694(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1DA4841D4(&qword_1F026EB18, &qword_1F026D718, MEMORY[0x1E0DEAF50]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F026D718);
          v12 = sub_1DA5BCED8(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1DA47D774(0, &qword_1F026D710);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

uint64_t sub_1DA6608B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1DA6705A0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1DA4841D4(&qword_1F026EB00, &qword_1F026EAF8, MEMORY[0x1E0DEAF50]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F026EAF8);
          v12 = sub_1DA5BCF2C(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1DA47D774(0, &qword_1EDADE798);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1DA6705DC();
  __break(1u);
  return result;
}

void sub_1DA660ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = (void *)objc_opt_self();
  sub_1DA66BE60();
  v6 = objc_msgSend(v5, sel_sharedInstance);
  v7 = objc_msgSend(v6, sel_privateQueueContext);

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v7;
  v8[3] = sub_1DA660C2C;
  v8[4] = v4;
  v11[4] = sub_1DA660C60;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1DA4A9194;
  v11[3] = &block_descriptor_31;
  v9 = _Block_copy(v11);
  v10 = v7;
  sub_1DA66BE60();
  swift_release();
  objc_msgSend(v10, sel_performBlock_, v9);
  _Block_release(v9);
  swift_release();

}

uint64_t method lookup function for StoreReviewPromptController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StoreReviewPromptController.didFollowShow()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

void sub_1DA660C2C(char a1)
{
  uint64_t v1;

  sub_1DA65FE1C(a1, *(void (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1DA660C34()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DA660C60()
{
  uint64_t v0;

  return sub_1DA65FFEC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1DA660C6C()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;

  v0 = sub_1DA66DEF4();
  MEMORY[0x1E0C80A78](v0);
  sub_1DA66F8BC();
  v1 = objc_allocWithZone(MEMORY[0x1E0C97B48]);
  v2 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithEntityName_, v2);

  v4 = objc_msgSend((id)objc_opt_self(), sel_predicateForPreviouslyPlayedHidingFutureTimestamps);
  objc_msgSend(v3, sel_setPredicate_, v4);

  sub_1DA47D774(0, &qword_1EDADEC00);
  v5 = sub_1DA670084();

  return v5;
}

uint64_t sub_1DA660F4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DA660F70()
{
  uint64_t v0;
  _BOOL8 v2;

  v2 = *(uint64_t *)(v0 + 32) > 0 && *(_QWORD *)(v0 + 40) > 2;
  return (*(uint64_t (**)(_BOOL8))(v0 + 16))(v2);
}

uint64_t sub_1DA660FA4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1DA660FC8(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_1DA65FF5C(a1, a2, *(void (**)(_QWORD))(v2 + 16));
}

uint64_t sub_1DA660FD0()
{
  return sub_1DA65FDCC();
}

uint64_t sub_1DA660FF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

id AssetDownloaders.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static AssetDownloaders.shared.getter()
{
  if (qword_1EDAE0888 != -1)
    swift_once();
  return (id)qword_1EDAE0880;
}

uint64_t AssetDownloaders.backgroundArtworkDownloader.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA4B00AC(&OBJC_IVAR___PUIAssetDownloaders_backgroundArtworkDownloader, &qword_1EDAE19E8, a1);
}

uint64_t AssetDownloaders.backgroundArtworkSource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA4B00AC(&OBJC_IVAR___PUIAssetDownloaders_backgroundArtworkSource, &qword_1EDAE4200, a1);
}

uint64_t AssetDownloaders.storeArtworkSource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA4B00AC(&OBJC_IVAR___PUIAssetDownloaders_storeArtworkSource, (uint64_t *)&unk_1EDAE27D0, a1);
}

uint64_t AssetDownloaders.libraryArtworkSource.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA4B00AC(&OBJC_IVAR___PUIAssetDownloaders_libraryArtworkSource, (uint64_t *)&unk_1EDAE27D0, a1);
}

unint64_t sub_1DA6610EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDAE1648;
  if (!qword_1EDAE1648)
  {
    v1 = type metadata accessor for ArtworkBackgroundSessionDescriptor();
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for ArtworkBackgroundSessionDescriptor, v1);
    atomic_store(result, (unint64_t *)&qword_1EDAE1648);
  }
  return result;
}

unint64_t sub_1DA661134()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDAE19E0;
  if (!qword_1EDAE19E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDAE19E8);
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0D7E780], v1);
    atomic_store(result, (unint64_t *)&qword_1EDAE19E0);
  }
  return result;
}

void sub_1DA661180(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
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
  uint64_t v19;
  uint64_t v20;
  char v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v38 = a1;
  v39 = a2;
  v7 = sub_1DA66DEF4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v34 - v12;
  v14 = type metadata accessor for ArtworkBackgroundSessionDescriptor();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v4 + OBJC_IVAR___PUIAssetDownloaders_backgroundArtworkDownloader;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19E8);
  v37 = v17;
  sub_1DA66D738();
  sub_1DA6610EC();
  v18 = sub_1DA66DBB8();
  v20 = v19;
  sub_1DA6615A4((uint64_t)v16);
  if (v18 == a3 && v20 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = sub_1DA6706D8();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {
      sub_1DA66DED0();
      swift_bridgeObjectRetain_n();
      v23 = sub_1DA66DEDC();
      v24 = sub_1DA66FDC0();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc();
        v26 = swift_slowAlloc();
        v36 = v7;
        v27 = v26;
        v41 = v26;
        *(_DWORD *)v25 = 136315138;
        swift_bridgeObjectRetain();
        v40 = sub_1DA49AD00(a3, a4, &v41);
        sub_1DA6702C4();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1DA478000, v23, v24, "Asset downloaders ignoring background session not owned: %s", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1DF0A0474](v27, -1, -1);
        MEMORY[0x1DF0A0474](v25, -1, -1);

        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v36);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
      return;
    }
  }
  sub_1DA66DED0();
  swift_bridgeObjectRetain_n();
  v28 = sub_1DA66DEDC();
  v29 = sub_1DA66FDC0();
  if (os_log_type_enabled(v28, v29))
  {
    v35 = v8;
    v30 = swift_slowAlloc();
    v36 = v7;
    v31 = (uint8_t *)v30;
    v32 = swift_slowAlloc();
    v41 = v32;
    *(_DWORD *)v31 = 136315138;
    swift_bridgeObjectRetain();
    v40 = sub_1DA49AD00(a3, a4, &v41);
    sub_1DA6702C4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DA478000, v28, v29, "Registering artwork background completion handler for session: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0A0474](v32, -1, -1);
    MEMORY[0x1DF0A0474](v31, -1, -1);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v36);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
  v33 = (void *)sub_1DA66D744();
  sub_1DA66D7D4();

}

uint64_t sub_1DA6615A4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ArtworkBackgroundSessionDescriptor();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id AssetDownloaders.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssetDownloaders();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DA661774()
{
  return type metadata accessor for AssetDownloaders();
}

uint64_t method lookup function for AssetDownloaders()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssetDownloaders.register(backgroundCompletion:for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

void sub_1DA6617A4(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1DA66CEBC();
    v7 = a3(a1, v6, MEMORY[0x1E0D7DD18]);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1DA661804()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DA661828()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

double sub_1DA661834(void *a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  double v6;
  double v7;

  v1 = a1;
  v2 = objc_msgSend(v1, sel_window);
  if (v2
    && (v3 = v2, v4 = objc_msgSend(v2, sel_windowScene), v3, v4)
    && (v5 = objc_msgSend(v4, sel_statusBarManager), v4, v5))
  {
    objc_msgSend(v5, sel_statusBarFrame);
    v7 = v6;

  }
  else
  {

    return 0.0;
  }
  return v7;
}

double UIView.mt_statusBarFrame.getter()
{
  void *v0;
  id v1;
  double v2;
  void *v3;
  id v4;
  id v5;
  double v6;

  v1 = objc_msgSend(v0, sel_window);
  v2 = 0.0;
  if (v1)
  {
    v3 = v1;
    v4 = objc_msgSend(v1, sel_windowScene);

    if (v4)
    {
      v5 = objc_msgSend(v4, sel_statusBarManager);

      if (v5)
      {
        objc_msgSend(v5, sel_statusBarFrame);
        v2 = v6;

      }
    }
  }
  return v2;
}

uint64_t URL.init(systemImage:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5020);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[0] = 0;
  v9[1] = 0xE000000000000000;
  sub_1DA670444();
  swift_bridgeObjectRelease();
  strcpy((char *)v9, "systemimage://");
  HIBYTE(v9[1]) = -18;
  sub_1DA66F988();
  swift_bridgeObjectRelease();
  sub_1DA66C334();
  swift_bridgeObjectRelease();
  v5 = sub_1DA66C358();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
  {
    sub_1DA4ED9D4((uint64_t)v4);
    v7 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
    v7 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v7, 1, v5);
}

BOOL sub_1DA661B44(double a1, double a2)
{
  double v2;
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;

  v2 = fabs(a1);
  v3 = fabs(a2);
  if (v3 < v2)
    v2 = v3;
  v4 = (*(_QWORD *)&v2 >> 52) & 0x7FFLL;
  if (!v4)
  {
    v6 = 1;
LABEL_7:
    v5 = *(double *)&v6;
    return vabdd_f64(a1, a2) >= v5;
  }
  if (v4 == 2047)
  {
    v6 = 0x7FF8000000000000;
    goto LABEL_7;
  }
  v5 = COERCE_DOUBLE(*(_QWORD *)&v2 & 0x7FF0000000000000) * 2.22044605e-16;
  return vabdd_f64(a1, a2) >= v5;
}

BOOL sub_1DA661BA0(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  v4 = fabs(a1);
  v5 = fabs(a3);
  if (v5 < v4)
    v4 = v5;
  v6 = (*(_QWORD *)&v4 >> 52) & 0x7FFLL;
  if (v6)
  {
    if (v6 == 2047)
      return 1;
    v7 = COERCE_DOUBLE(*(_QWORD *)&v4 & 0x7FF0000000000000) * 2.22044605e-16;
  }
  else
  {
    *(_QWORD *)&v7 = 1;
  }
  if (vabdd_f64(a1, a3) < v7)
    return !_s12CoreGraphics7CGFloatV10PodcastsUIE3eetoiySbAC_ACtFZ_0(a2, a4);
  return 1;
}

BOOL sub_1DA661C20(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v12;
  double v13;
  uint64_t v14;
  double v15;

  v12 = fabs(a1);
  v13 = fabs(a5);
  if (v13 < v12)
    v12 = v13;
  v14 = (*(_QWORD *)&v12 >> 52) & 0x7FFLL;
  if (v14)
  {
    if (v14 == 2047)
      return 1;
    v15 = COERCE_DOUBLE(*(_QWORD *)&v12 & 0x7FF0000000000000) * 2.22044605e-16;
  }
  else
  {
    *(_QWORD *)&v15 = 1;
  }
  if (vabdd_f64(a1, a5) >= v15 || !_s12CoreGraphics7CGFloatV10PodcastsUIE3eetoiySbAC_ACtFZ_0(a2, a6))
    return 1;
  return !_sSo6CGSizeV10PodcastsUIE3eetoiySbAB_ABtFZ_0(a3, a4, a7, a8);
}

BOOL sub_1DA661CD8(double *a1, double *a2)
{
  return _sSo6CGRectV10PodcastsUIE3eetoiySbAB_ABtFZ_0(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

uint64_t CGRect.LayoutAxis.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t CGRect.LayoutAxis.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static CGRect.LayoutAxis.horizontal.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static CGRect.LayoutAxis.vertical.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void sub_1DA661D14()
{
  qword_1F026EB20 = 3;
}

uint64_t static CGRect.LayoutAxis.allAxes.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  if (qword_1F0268820 != -1)
    result = swift_once();
  *a1 = qword_1F026EB20;
  return result;
}

CGFloat CGRect.applyingLayoutDirection(_:inBounds:)(uint64_t a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double MaxX;
  double v15;
  uint64_t v16;
  _QWORD v18[4];
  CGRect v19;
  CGRect v20;

  if (a1)
  {
    if (a1 == 1)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&a2);
      v19.origin.x = a6;
      v19.origin.y = a7;
      v19.size.width = a8;
      v19.size.height = a9;
      v15 = MaxX - CGRectGetMinX(v19);
      v20.origin.x = a6;
      v20.origin.y = a7;
      v20.size.width = a8;
      v20.size.height = a9;
      return v15 - CGRectGetWidth(v20);
    }
    else
    {
      type metadata accessor for UIUserInterfaceLayoutDirection(0);
      v18[3] = v16;
      v18[0] = a1;
      unrecognizedEnumValueEncountered(_:)((uint64_t)v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
    }
  }
  return a6;
}

CGFloat CGRect.aspectFit(in:scale:)(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v24 = fabs(CGRectGetWidth(*(CGRect *)&a1));
  v25 = 0.0;
  if (v24 <= 0.0)
    v25 = v24;
  v26 = (*(_QWORD *)&v25 >> 52) & 0x7FFLL;
  if (!v26)
  {
    if (v24 < COERCE_DOUBLE(1))
      return a6;
LABEL_8:
    v32.origin.x = a1;
    v32.origin.y = a2;
    v32.size.width = a3;
    v32.size.height = a4;
    v27 = fabs(CGRectGetHeight(v32));
    v28 = 0.0;
    if (v27 <= 0.0)
      v28 = v27;
    v29 = (*(_QWORD *)&v28 >> 52) & 0x7FFLL;
    if (v29)
    {
      if (v29 != 2047 && v27 < COERCE_DOUBLE(*(_QWORD *)&v28 & 0x7FF0000000000000) * 2.22044605e-16)
        return a6;
    }
    else if (v27 < COERCE_DOUBLE(1))
    {
      return a6;
    }
    v33.origin.x = a1;
    v33.origin.y = a2;
    v33.size.width = a3;
    v33.size.height = a4;
    CGRectGetWidth(v33);
    v34.origin.x = a6;
    v34.origin.y = a7;
    v34.size.width = a8;
    v34.size.height = a9;
    CGRectGetWidth(v34);
    v35.origin.x = a1;
    v35.origin.y = a2;
    v35.size.width = a3;
    v35.size.height = a4;
    CGRectGetHeight(v35);
    v36.origin.x = a6;
    v36.origin.y = a7;
    v36.size.width = a8;
    v36.size.height = a9;
    CGRectGetHeight(v36);
    UIRectCenteredXInRectScale();
    UIRectCenteredYInRectScale();
    return v30;
  }
  if (v26 == 2047 || v24 >= COERCE_DOUBLE(*(_QWORD *)&v25 & 0x7FF0000000000000) * 2.22044605e-16)
    goto LABEL_8;
  return a6;
}

double CGRect.centeringAlong(axes:bounds:scale:)(uint64_t *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v7;
  double v8;
  double v9;

  v7 = *a1;
  if ((*a1 & 1) != 0)
  {
    UIRectCenteredXInRectScale();
    a7 = v8;
  }
  if ((v7 & 2) != 0)
  {
    UIRectCenteredYInRectScale();
    return v9;
  }
  return a7;
}

CGFloat CGRect.removingLayoutDirection(_:inBounds:)(uint64_t a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double MaxX;
  uint64_t v15;
  _QWORD v17[4];
  CGRect v18;

  if (a1)
  {
    if (a1 == 1)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&a2);
      v18.origin.x = a6;
      v18.origin.y = a7;
      v18.size.width = a8;
      v18.size.height = a9;
      return MaxX - CGRectGetMaxX(v18);
    }
    else
    {
      type metadata accessor for UIUserInterfaceLayoutDirection(0);
      v17[3] = v15;
      v17[0] = a1;
      unrecognizedEnumValueEncountered(_:)((uint64_t)v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v17);
    }
  }
  return a6;
}

BOOL _sSo6CGRectV10PodcastsUIE3eetoiySbAB_ABtFZ_0(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v12;
  double v13;
  uint64_t v14;
  double v15;

  v12 = fabs(a1);
  v13 = fabs(a5);
  if (v13 < v12)
    v12 = v13;
  v14 = (*(_QWORD *)&v12 >> 52) & 0x7FFLL;
  if (v14)
  {
    if (v14 == 2047)
      return 0;
    v15 = COERCE_DOUBLE(*(_QWORD *)&v12 & 0x7FF0000000000000) * 2.22044605e-16;
  }
  else
  {
    *(_QWORD *)&v15 = 1;
  }
  if (vabdd_f64(a1, a5) < v15 && _s12CoreGraphics7CGFloatV10PodcastsUIE3eetoiySbAC_ACtFZ_0(a2, a6))
    return _sSo6CGSizeV10PodcastsUIE3eetoiySbAB_ABtFZ_0(a3, a4, a7, a8);
  return 0;
}

unint64_t sub_1DA6622DC(uint64_t a1)
{
  unint64_t result;

  result = sub_1DA662300();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1DA662300()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F026EB28;
  if (!qword_1F026EB28)
  {
    type metadata accessor for CGRect(255);
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0C9B9D0], v1);
    atomic_store(result, (unint64_t *)&qword_1F026EB28);
  }
  return result;
}

unint64_t sub_1DA66234C()
{
  unint64_t result;

  result = qword_1F026EB30;
  if (!qword_1F026EB30)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for CGRect.LayoutAxis, &type metadata for CGRect.LayoutAxis);
    atomic_store(result, (unint64_t *)&qword_1F026EB30);
  }
  return result;
}

unint64_t sub_1DA662394()
{
  unint64_t result;

  result = qword_1F026EB38;
  if (!qword_1F026EB38)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for CGRect.LayoutAxis, &type metadata for CGRect.LayoutAxis);
    atomic_store(result, (unint64_t *)&qword_1F026EB38);
  }
  return result;
}

unint64_t sub_1DA6623DC()
{
  unint64_t result;

  result = qword_1EDAE5080;
  if (!qword_1EDAE5080)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for CGRect.LayoutAxis, &type metadata for CGRect.LayoutAxis);
    atomic_store(result, (unint64_t *)&qword_1EDAE5080);
  }
  return result;
}

unint64_t sub_1DA662424()
{
  unint64_t result;

  result = qword_1EDAE5088;
  if (!qword_1EDAE5088)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for CGRect.LayoutAxis, &type metadata for CGRect.LayoutAxis);
    atomic_store(result, (unint64_t *)&qword_1EDAE5088);
  }
  return result;
}

ValueMetadata *type metadata accessor for CGRect.LayoutAxis()
{
  return &type metadata for CGRect.LayoutAxis;
}

uint64_t sub_1DA662478()
{
  uint64_t result;

  result = sub_1DA66F88C();
  qword_1F026EB40 = result;
  return result;
}

id static NSNotificationName.VolumeLevelDidChange.getter()
{
  if (qword_1F0268828 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_1F026EB40;
}

void static NSNotificationName.VolumeLevelDidChange.setter(uint64_t a1)
{
  void *v2;

  if (qword_1F0268828 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_1F026EB40;
  qword_1F026EB40 = a1;

}

uint64_t (*static NSNotificationName.VolumeLevelDidChange.modify())()
{
  if (qword_1F0268828 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1DA6625F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void (*v3)(_BYTE *, _QWORD);
  float *v4;
  id v5;
  _BYTE v6[32];

  v1 = *(_QWORD *)(v0 + 24);
  ObjectType = swift_getObjectType();
  v3 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v1 + 24))(v6, ObjectType, v1);
  *v4 = *v4 + 0.05;
  v3(v6, 0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1F0268828 != -1)
    swift_once();
  swift_beginAccess();
  objc_msgSend(v5, sel_postNotificationName_object_, qword_1F026EB40, 0);

}

float sub_1DA6626EC()
{
  return 0.05;
}

void sub_1DA6626FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  void (*v3)(_BYTE *, _QWORD);
  float *v4;
  id v5;
  _BYTE v6[32];

  v1 = *(_QWORD *)(v0 + 24);
  ObjectType = swift_getObjectType();
  v3 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v1 + 24))(v6, ObjectType, v1);
  *v4 = *v4 + -0.05;
  v3(v6, 0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1F0268828 != -1)
    swift_once();
  swift_beginAccess();
  objc_msgSend(v5, sel_postNotificationName_object_, qword_1F026EB40, 0);

}

uint64_t sub_1DA6627F4()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

void sub_1DA662818()
{
  sub_1DA6625F4();
}

void sub_1DA662838()
{
  sub_1DA6626FC();
}

uint64_t sub_1DA662858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
}

uint64_t sub_1DA66288C(float a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, float))(v3 + 16))(ObjectType, v3, a1);
}

id sub_1DA6628D0()
{
  id *v0;

  return objc_msgSend(*v0, sel_increaseVolume);
}

id sub_1DA6628E0()
{
  id *v0;

  return objc_msgSend(*v0, sel_decreaseVolume);
}

id sub_1DA6628F0()
{
  id *v0;

  return objc_msgSend(*v0, sel_volumeValue);
}

id sub_1DA662900()
{
  id *v0;

  return objc_msgSend(*v0, sel_setVolumeValue_);
}

id sub_1DA662910()
{
  id *v0;

  return objc_msgSend(*v0, sel_isVolumeControlAvailable);
}

uint64_t sub_1DA662930(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t _s22PlayerVolumeControllerCMa()
{
  return objc_opt_self();
}

uint64_t sub_1DA662958(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  *(_QWORD *)(swift_allocObject() + 16) = a2;
  v11 = MEMORY[0x1E0DEE9D8];
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = a2;
    swift_bridgeObjectRetain();
    for (i = 0; i != v4; ++i)
    {
      v7 = *(_QWORD *)(a1 + 8 * i + 32);
      if (objc_msgSend(v5, sel_itemExistsWithPersistentID_, v7)
        && objc_msgSend(v5, sel_itemWithPersistentID_, v7))
      {
        MEMORY[0x1DF09E464]();
        if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1DA66FAC0();
        sub_1DA66FB14();
        sub_1DA66FAB4();
      }
    }
    swift_bridgeObjectRelease();
    v8 = v11;
  }
  else
  {
    v9 = a2;
    v8 = MEMORY[0x1E0DEE9D8];
  }

  swift_release();
  return v8;
}

id MPMediaLibrary.podcastsAssetsAsPercentageOfTotalVolumeSpace.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  id result;
  void *v8;
  uint64_t v9;

  v1 = v0;
  v2 = sub_1DA66C358();
  v3 = *(_QWORD *)(v2 - 8);
  *(_QWORD *)&v4 = MEMORY[0x1E0C80A78](v2).n128_u64[0];
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(v1, sel_databasePath, v4);
  if (result)
  {
    v8 = result;
    sub_1DA66F8BC();

    sub_1DA66C2B0();
    swift_bridgeObjectRelease();
    _sSo14MPMediaLibraryC10PodcastsUIE05totalC14AssetsFileSizeSivg_0();
    sub_1DA66C268();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MPMediaLibrary.checkSizeOfEpisodesToBeDeleted(for:completion:)(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1DA66DEF4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA66DED0();
  v15 = sub_1DA66DEDC();
  v16 = sub_1DA66FD90();
  v17 = os_log_type_enabled(v15, v16);
  v36 = a1;
  if (v17)
  {
    v33 = v10;
    v18 = swift_slowAlloc();
    v34 = v4;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    v35 = a3;
    v21 = v20;
    v37 = a1;
    v38 = v20;
    v32 = v11;
    *(_DWORD *)v19 = 136315138;
    type metadata accessor for MTPodcastEpisodeLimit(0);
    v22 = sub_1DA66F904();
    v37 = sub_1DA49AD00(v22, v23, &v38);
    v10 = v33;
    sub_1DA6702C4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DA478000, v15, v16, "Checking the size of episodes to be deleted for episode limit: %s", v19, 0xCu);
    swift_arrayDestroy();
    v24 = v21;
    a3 = v35;
    MEMORY[0x1DF0A0474](v24, -1, -1);
    v25 = v19;
    v4 = v34;
    MEMORY[0x1DF0A0474](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v32);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  if ((sub_1DA663888() & 1) == 0)
    return a2(0);
  sub_1DA66FB80();
  v26 = sub_1DA66FB98();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v10, 0, 1, v26);
  v27 = (_QWORD *)swift_allocObject();
  v27[2] = 0;
  v27[3] = 0;
  v28 = v36;
  v27[4] = v4;
  v27[5] = v28;
  v27[6] = a2;
  v27[7] = a3;
  v29 = v4;
  sub_1DA66BE60();
  sub_1DA569804((uint64_t)v10, (uint64_t)&unk_1F026EC20, (uint64_t)v27);
  return swift_release();
}

uint64_t sub_1DA662E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v7[11] = a6;
  v7[12] = a7;
  v9 = sub_1DA66E9C8();
  v7[13] = v9;
  v7[14] = *(_QWORD *)(v9 - 8);
  v7[15] = swift_task_alloc();
  v10 = sub_1DA66EA04();
  v7[16] = v10;
  v7[17] = *(_QWORD *)(v10 - 8);
  v7[18] = swift_task_alloc();
  v11 = sub_1DA66DEF4();
  v7[19] = v11;
  v7[20] = *(_QWORD *)(v11 - 8);
  v7[21] = swift_task_alloc();
  v12 = (_QWORD *)swift_task_alloc();
  v7[22] = v12;
  *v12 = v7;
  v12[1] = sub_1DA662F40;
  v12[88] = a5;
  return swift_task_switch();
}

uint64_t sub_1DA662F40(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 184) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 192) = a1;
  return swift_task_switch();
}

uint64_t sub_1DA662FB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;

  v1 = v0[24];
  v2 = v0[18];
  v12 = v0[17];
  v3 = v0[15];
  v13 = v0[16];
  v5 = v0[13];
  v4 = v0[14];
  v7 = v0[11];
  v6 = v0[12];
  sub_1DA47D774(0, (unint64_t *)&qword_1EDAE5050);
  v8 = (void *)sub_1DA66FE5C();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v6;
  v9[4] = v1;
  v0[6] = sub_1DA664154;
  v0[7] = v9;
  v0[2] = MEMORY[0x1E0C809B0];
  v0[3] = 1107296256;
  v0[4] = sub_1DA4A9194;
  v0[5] = &block_descriptor_32;
  v10 = _Block_copy(v0 + 2);
  sub_1DA66BE60();
  sub_1DA66E9EC();
  v0[8] = MEMORY[0x1E0DEE9D8];
  sub_1DA4F719C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDADE6E0);
  sub_1DA529778();
  sub_1DA670378();
  MEMORY[0x1DF09E8CC](0, v2, v3, v10);
  _Block_release(v10);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v2, v13);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_1DA663160()
{
  _QWORD *v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = (void *)v0[23];
  sub_1DA66DED0();
  v2 = v1;
  v3 = v1;
  v4 = sub_1DA66DEDC();
  v5 = sub_1DA66FDA8();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (void *)v0[23];
    v7 = v0[20];
    v28 = v0[19];
    v30 = v0[21];
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_DWORD *)v8 = 136315138;
    v31 = v9;
    v0[9] = v6;
    v10 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE53C0);
    v11 = sub_1DA66F904();
    v0[10] = sub_1DA49AD00(v11, v12, &v31);
    sub_1DA6702C4();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1DA478000, v4, v5, "Encountered a critical error while computing the size of episodes to be deleted. Returning 0 bytes reclaimed: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0A0474](v9, -1, -1);
    MEMORY[0x1DF0A0474](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v30, v28);
  }
  else
  {
    v13 = (void *)v0[23];
    v15 = v0[20];
    v14 = v0[21];
    v16 = v0[19];

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  }
  v17 = v0[18];
  v27 = v0[17];
  v18 = v0[15];
  v29 = v0[16];
  v20 = v0[13];
  v19 = v0[14];
  v21 = v0[11];
  v22 = v0[12];
  sub_1DA47D774(0, (unint64_t *)&qword_1EDAE5050);
  v23 = (void *)sub_1DA66FE5C();
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = v21;
  v24[3] = v22;
  v24[4] = 0;
  v0[6] = sub_1DA664154;
  v0[7] = v24;
  v0[2] = MEMORY[0x1E0C809B0];
  v0[3] = 1107296256;
  v0[4] = sub_1DA4A9194;
  v0[5] = &block_descriptor_32;
  v25 = _Block_copy(v0 + 2);
  sub_1DA66BE60();
  sub_1DA66E9EC();
  v0[8] = MEMORY[0x1E0DEE9D8];
  sub_1DA4F719C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDADE6E0);
  sub_1DA529778();
  sub_1DA670378();
  MEMORY[0x1DF09E8CC](0, v17, v18, v25);
  _Block_release(v25);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v17, v29);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_1DA6634AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_1DA663508;
  return sub_1DA66FFA0();
}

uint64_t sub_1DA663508(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_1DA663584()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sSo14MPMediaLibraryC10PodcastsUIE4size2ofSiSaySo0A4ItemCG_tF_0(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  _OWORD v11[2];
  _BYTE v12[24];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1DA6705A0();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_20:
    swift_bridgeObjectRelease();
    return 0;
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_20;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  v4 = 0;
  v5 = 0;
  v6 = *MEMORY[0x1E0CC1E00];
  while (1)
  {
    v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1DF09EE48](v5, a1) : *(id *)(a1 + 8 * v5 + 32);
    v8 = v7;
    if (objc_msgSend(v7, sel_valueForProperty_, v6))
    {
      sub_1DA670360();

      swift_unknownObjectRelease();
    }
    else
    {

      memset(v11, 0, sizeof(v11));
    }
    sub_1DA480EC4((uint64_t)v11, (uint64_t)v12);
    if (v13)
      break;
    sub_1DA480E84((uint64_t)v12);
LABEL_6:
    if (v2 == ++v5)
      goto LABEL_18;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_6;
  v9 = __OFADD__(v4, v10);
  v4 += v10;
  if (!v9)
    goto LABEL_6;
  __break(1u);
LABEL_18:
  swift_bridgeObjectRelease();
  return v4;
}

id _sSo14MPMediaLibraryC10PodcastsUIE05totalC14AssetsFileSizeSivg_0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  unint64_t v5;

  sub_1DA66F8BC();
  v0 = sub_1DA67072C();
  v1 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)objc_opt_self(), sel_predicateWithValue_forProperty_, v0, v1);
  swift_unknownObjectRelease();

  v3 = objc_msgSend((id)objc_opt_self(), sel_podcastsQuery);
  objc_msgSend(v3, sel_setFilterPropertyPredicate_, v2);
  v4 = objc_msgSend(v3, sel_items);
  if (v4)
  {
    sub_1DA47D774(0, &qword_1EDAE2010);
    v5 = sub_1DA66FA9C();

    v4 = (id)_sSo14MPMediaLibraryC10PodcastsUIE4size2ofSiSaySo0A4ItemCG_tF_0(v5);
    swift_bridgeObjectRelease();
  }
  else
  {

  }
  return v4;
}

uint64_t sub_1DA663888()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;

  v0 = sub_1DA66DEF4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend((id)objc_opt_self(), sel_isPodcastsApp) & 1) != 0
    || (objc_msgSend((id)objc_opt_self(), sel_canExtensionOpenDatabase) & 1) != 0)
  {
    return 1;
  }
  sub_1DA66DED0();
  v5 = sub_1DA66DEDC();
  v6 = sub_1DA66FDA8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DA478000, v5, v6, "Cannot open Podcasts database, outstanding questions are undefined", v7, 2u);
    MEMORY[0x1DF0A0474](v7, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

uint64_t sub_1DA6639B8(uint64_t a1)
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
  v10[1] = sub_1DA4A9520;
  return sub_1DA662E64(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1DA663A44(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, char a8, double a9)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v46 = a2;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2000);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1DA66DEF4();
  v47 = *(_QWORD *)(v20 - 8);
  v48 = v20;
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = swift_allocObject();
  v43 = a3;
  v44 = a4;
  *(_QWORD *)(v23 + 16) = a3;
  *(_QWORD *)(v23 + 24) = a4;
  *(_QWORD *)(v23 + 32) = a5;
  *(_QWORD *)(v23 + 40) = a6;
  *(double *)(v23 + 48) = a9;
  *(_QWORD *)(v23 + 56) = a7;
  *(_BYTE *)(v23 + 64) = a8 & 1;
  sub_1DA66BE60();
  v24 = a6;
  sub_1DA66DED0();
  v25 = sub_1DA66DEDC();
  v26 = sub_1DA66FD90();
  v27 = os_log_type_enabled(v25, v26);
  v45 = a1;
  if (v27)
  {
    v28 = swift_slowAlloc();
    v42 = v19;
    v29 = (uint8_t *)v28;
    v30 = swift_slowAlloc();
    v49 = a1;
    v50 = v30;
    *(_DWORD *)v29 = 136315138;
    type metadata accessor for MTPodcastEpisodeLimit(0);
    v31 = sub_1DA66F904();
    v49 = sub_1DA49AD00(v31, v32, &v50);
    sub_1DA6702C4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DA478000, v25, v26, "Checking the size of episodes to be deleted for episode limit: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0A0474](v30, -1, -1);
    v33 = v29;
    v19 = v42;
    MEMORY[0x1DF0A0474](v33, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v47 + 8))(v22, v48);
  if ((sub_1DA663888() & 1) != 0)
  {
    sub_1DA66FB80();
    v34 = sub_1DA66FB98();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v19, 0, 1, v34);
    v35 = (_QWORD *)swift_allocObject();
    v35[2] = 0;
    v35[3] = 0;
    v36 = v45;
    v37 = v46;
    v35[4] = v46;
    v35[5] = v36;
    v35[6] = sub_1DA663D74;
    v35[7] = v23;
    v38 = v37;
    sub_1DA66BE60();
    sub_1DA569804((uint64_t)v19, (uint64_t)&unk_1F026EC28, (uint64_t)v35);
  }
  else
  {
    v39 = swift_allocObject();
    *(_BYTE *)(v39 + 16) = 0;
    sub_1DA601F6C(v43, v44, v39);
  }
  swift_release();
  return swift_release();
}

uint64_t sub_1DA663D48()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1DA663D74(uint64_t a1)
{
  uint64_t v1;

  return sub_1DA601F60(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(double *)(v1 + 48), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 56), *(_BYTE *)(v1 + 64));
}

uint64_t sub_1DA663D8C()
{
  return swift_deallocObject();
}

uint64_t sub_1DA663DA0(uint64_t a1)
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
  v10[1] = sub_1DA4AD77C;
  return sub_1DA662E64(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_1DA663E2C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 704) = a1;
  return swift_task_switch();
}

uint64_t sub_1DA663E44()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;

  v1 = v0[88];
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_privateQueueContext);
  v0[89] = v3;

  v4 = swift_allocObject();
  v0[90] = v4;
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = v3;
  v5 = v3;
  sub_1DA66BE60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F0269F10);
  swift_asyncLet_begin();
  v0[91] = objc_msgSend((id)objc_opt_self(), sel_defaultMediaLibrary);
  return swift_asyncLet_get_throwing();
}

uint64_t sub_1DA663F5C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 736) = v0;
  return swift_task_switch();
}

uint64_t sub_1DA663F84()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(id *)(v0 + 728);
  v2 = swift_bridgeObjectRetain();
  v3 = sub_1DA662958(v2, v1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 744) = _sSo14MPMediaLibraryC10PodcastsUIE4size2ofSiSaySo0A4ItemCG_tF_0(v3);
  swift_bridgeObjectRelease();

  return swift_asyncLet_finish();
}

uint64_t sub_1DA664028()
{
  return swift_task_switch();
}

uint64_t sub_1DA66403C()
{
  uint64_t v0;

  swift_release_n();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 744));
}

uint64_t sub_1DA664084()
{
  uint64_t v0;

  return swift_asyncLet_finish();
}

uint64_t sub_1DA6640D8()
{
  return swift_task_switch();
}

uint64_t sub_1DA6640EC()
{
  uint64_t v0;

  swift_release_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DA664130()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DA664154()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32));
}

uint64_t sub_1DA66417C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1DA6641A0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DA4AD77C;
  v3[2] = a1;
  v4 = (_QWORD *)swift_task_alloc();
  v3[3] = v4;
  *v4 = v3;
  v4[1] = sub_1DA663508;
  return sub_1DA66FFA0();
}

uint64_t sub_1DA664224()
{
  uint64_t v0;

  return swift_deallocObject();
}

ValueMetadata *type metadata accessor for FairPlayEpisodeViewModel()
{
  return &type metadata for FairPlayEpisodeViewModel;
}

uint64_t sub_1DA664258()
{
  return MEMORY[0x1E0DEB428];
}

uint64_t sub_1DA664264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _BYTE v19[8];
  id v20;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v19[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v4);
  v6 = &v19[-v5];
  v7 = sub_1DA66C430();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DA4A686C(v0 + 48, (uint64_t)v19, &qword_1F026A0E0);
  sub_1DA4A686C((uint64_t)v19, (uint64_t)&v20, &qword_1F026A0E0);
  if (v20)
  {
    v11 = objc_msgSend(v20, sel_renewalDate);
    if (v11)
    {
      v12 = v11;
      sub_1DA66C40C();

      v13 = 0;
    }
    else
    {
      v13 = 1;
    }
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v3, v13, 1, v7);
    sub_1DA4A686C((uint64_t)v3, (uint64_t)v6, &qword_1EDADE6C8);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v10, v6, v7);
      v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
      objc_msgSend(v15, sel_setDateStyle_, 1);
      objc_msgSend(v15, sel_setTimeStyle_, 2);
      v16 = (void *)sub_1DA66C3F4();
      v17 = objc_msgSend(v15, sel_stringFromDate_, v16);

      v14 = sub_1DA66F8BC();
      (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
      return v14;
    }
  }
  else
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  }
  sub_1DA5BADA0((uint64_t)v6);
  return 0;
}

uint64_t sub_1DA6644B4(double *a1, double *a2)
{
  return sub_1DA661B40(*a1, a1[1], *a2, a2[1]);
}

BOOL static ApproximatelyEquatable.!=~ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return ((*(uint64_t (**)(void))(a4 + 16))() & 1) == 0;
}

uint64_t dispatch thunk of static ApproximatelyEquatable.==~ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static ApproximatelyEquatable.!=~ infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

BOOL sub_1DA6644FC(double *a1, double *a2)
{
  return sub_1DA661B44(*a1, *a2);
}

BOOL sub_1DA664508(double *a1, double *a2)
{
  return sub_1DA661C20(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

BOOL sub_1DA66451C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static ApproximatelyEquatable.!=~ infix(_:_:)(a1, a2, a3, a4);
}

uint64_t *sub_1DA664534(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *__dst;

  v4 = type metadata accessor for FairPlayKeyViewModel();
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    sub_1DA66BE60();
  }
  else
  {
    v6 = v4;
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = *(int *)(v4 + 28);
    __dst = (char *)a1 + v10;
    v11 = (char *)a2 + v10;
    v12 = sub_1DA66C430();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
      memcpy(__dst, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(__dst, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(__dst, 0, 1, v12);
    }
    v17 = *(int *)(v6 + 32);
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_1DA66C358();
    v21 = *(_QWORD *)(v20 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5020);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    }
  }
  return a1;
}

uint64_t sub_1DA6646F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = type metadata accessor for FairPlayKeyViewModel();
  v3 = a1 + *(int *)(v2 + 28);
  v4 = sub_1DA66C430();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  v6 = a1 + *(int *)(v2 + 32);
  v7 = sub_1DA66C358();
  v8 = *(_QWORD *)(v7 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  return result;
}

_QWORD *sub_1DA6647D8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *__dst;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = type metadata accessor for FairPlayKeyViewModel();
  v8 = *(int *)(v7 + 28);
  __dst = (char *)a1 + v8;
  v9 = (char *)a2 + v8;
  v10 = sub_1DA66C430();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
    memcpy(__dst, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  v14 = *(int *)(v7 + 32);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_1DA66C358();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5020);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  return a1;
}

_QWORD *sub_1DA664970(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(char *, uint64_t, uint64_t);
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;

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
  v4 = type metadata accessor for FairPlayKeyViewModel();
  v5 = *(int *)(v4 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1DA66C430();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48);
  v11 = v10(v6, 1, v8);
  v12 = v10(v7, 1, v8);
  if (v11)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(v6, v7, v8);
LABEL_7:
  v14 = *(int *)(v4 + 32);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  v17 = sub_1DA66C358();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (!v20)
  {
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_12;
  }
  if (v21)
  {
LABEL_12:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5020);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  return a1;
}

_OWORD *sub_1DA664BB0(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = type metadata accessor for FairPlayKeyViewModel();
  v6 = *(int *)(v5 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DA66C430();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = *(int *)(v5 + 32);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_1DA66C358();
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5020);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

_QWORD *sub_1DA664D10(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;

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
  v7 = type metadata accessor for FairPlayKeyViewModel();
  v8 = *(int *)(v7 + 28);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_1DA66C430();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  v17 = *(int *)(v7 + 32);
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  v20 = sub_1DA66C358();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 40))(v18, v19, v20);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_12;
  }
  if (v24)
  {
LABEL_12:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5020);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v18, v19, v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
  return a1;
}

uint64_t sub_1DA664F20()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DA664F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FairPlayKeyViewModel();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1DA664F68()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DA664F74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FairPlayKeyViewModel();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for FairPlayDebugKeyCell()
{
  uint64_t result;

  result = qword_1F026ECA0;
  if (!qword_1F026ECA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DA664FF0()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for FairPlayKeyViewModel();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1DA665058()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DA665068@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  uint64_t v62;
  char v63;
  char v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v86;
  int v87;
  int v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  int v95;
  int v96;
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
  char v115;
  char v116;
  char v117;
  char v118;
  char v119;
  _BYTE v120[7];
  char v121;
  _BYTE v122[7];
  char v123;
  _BYTE v124[7];
  char v125;
  _BYTE v126[7];
  char v127;
  _BYTE v128[7];
  char v129;
  char v130;
  unint64_t v131;
  unint64_t v132;

  v4 = 0xD000000000000018;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADE6C8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA66E6D4();
  v106 = sub_1DA66E710();
  v105 = v8;
  LODWORD(v101) = v9;
  v107 = v10;
  swift_release();
  if (*(_QWORD *)(a1 + 40))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v11 = 0xD000000000000019;
    v12 = 0x80000001DA6920F0;
  }
  v131 = v11;
  v132 = v12;
  sub_1DA498918();
  swift_bridgeObjectRetain();
  v13 = sub_1DA66E734();
  v15 = v14;
  v17 = v16 & 1;
  sub_1DA66E650();
  v114 = sub_1DA66E710();
  v103 = v18;
  LODWORD(v100) = v19;
  v104 = v20;
  swift_release();
  sub_1DA5251EC(v13, v15, v17);
  swift_bridgeObjectRelease();
  sub_1DA66E6D4();
  v112 = sub_1DA66E710();
  v111 = v21;
  LODWORD(v99) = v22;
  v113 = v23;
  swift_release();
  v24 = sub_1DA5BAB4C();
  if (v25)
  {
    v131 = v24;
    v132 = v25;
    v26 = sub_1DA66E734();
    v28 = v27;
    v30 = v29 & 1;
    sub_1DA66E650();
    v110 = sub_1DA66E710();
    v109 = v31;
    v33 = v32;
    v102 = v34;
    v4 = 0xD000000000000018;
    swift_release();
    v35 = v33 & 1;
    sub_1DA5251EC(v26, v28, v30);
    swift_bridgeObjectRelease();
  }
  else
  {
    v110 = 0;
    v109 = 0;
    v35 = 0;
    v102 = 0;
  }
  v36 = type metadata accessor for FairPlayKeyViewModel();
  v37 = a1;
  sub_1DA5BAD58(a1 + *(int *)(v36 + 28), (uint64_t)v7);
  v38 = sub_1DA66C430();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v39 + 48))(v7, 1, v38);
  v108 = v35;
  if (v40 == 1)
  {
    sub_1DA5BADA0((uint64_t)v7);
    v41 = 0x80000001DA692110;
  }
  else
  {
    v4 = sub_1DA66C3DC();
    v41 = v42;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v38);
  }
  v96 = v99 & 1;
  v95 = v100 & 1;
  v94 = v101 & 1;
  v131 = v4;
  v132 = v41;
  v43 = sub_1DA66E734();
  v45 = v44;
  v47 = v46 & 1;
  sub_1DA66E650();
  v101 = sub_1DA66E710();
  v93 = v48;
  v50 = v49;
  v92 = v51;
  swift_release();
  v52 = v50 & 1;
  sub_1DA5251EC(v43, v45, v47);
  swift_bridgeObjectRelease();
  sub_1DA66E6D4();
  v91 = sub_1DA66E710();
  v90 = v53;
  LOBYTE(v43) = v54;
  v98 = v55;
  swift_release();
  v56 = *(_QWORD *)(v37 + 24);
  v131 = *(_QWORD *)(v37 + 16);
  v132 = v56;
  swift_bridgeObjectRetain();
  v57 = sub_1DA66E734();
  v59 = v58;
  v61 = v60 & 1;
  sub_1DA66E650();
  v97 = sub_1DA66E710();
  v99 = v62;
  v64 = v63;
  v100 = v65;
  swift_release();
  v89 = v64 & 1;
  sub_1DA5251EC(v57, v59, v61);
  swift_bridgeObjectRelease();
  v66 = v52;
  v87 = v52;
  v125 = v52;
  v67 = v43 & 1;
  v88 = v43 & 1;
  v123 = v43 & 1;
  v121 = v64 & 1;
  *(_DWORD *)(a2 + 17) = v131;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v131 + 3);
  *(_DWORD *)(a2 + 49) = *(_DWORD *)v128;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v128[3];
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v126[3];
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v126;
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v124[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v124;
  *(_DWORD *)(a2 + 180) = *(_DWORD *)&v122[3];
  *(_DWORD *)(a2 + 177) = *(_DWORD *)v122;
  *(_DWORD *)(a2 + 212) = *(_DWORD *)&v120[3];
  *(_DWORD *)(a2 + 209) = *(_DWORD *)v120;
  *(_BYTE *)(a2 + 144) = v125;
  *(_BYTE *)(a2 + 176) = v123;
  *(_BYTE *)(a2 + 208) = v121;
  v68 = v106;
  *(_QWORD *)a2 = v106;
  v69 = v68;
  v70 = v105;
  *(_QWORD *)(a2 + 8) = v105;
  v71 = v70;
  v72 = v94;
  *(_BYTE *)(a2 + 16) = v94;
  v73 = v114;
  *(_QWORD *)(a2 + 24) = v107;
  *(_QWORD *)(a2 + 32) = v73;
  v74 = v103;
  *(_QWORD *)(a2 + 40) = v103;
  v75 = v95;
  *(_BYTE *)(a2 + 48) = v95;
  v76 = v112;
  *(_QWORD *)(a2 + 56) = v104;
  *(_QWORD *)(a2 + 64) = v76;
  *(_QWORD *)(a2 + 72) = v111;
  LOBYTE(v76) = v96;
  *(_BYTE *)(a2 + 80) = v96;
  *(_QWORD *)(a2 + 88) = v113;
  *(_QWORD *)(a2 + 96) = v110;
  *(_QWORD *)(a2 + 104) = v109;
  *(_QWORD *)(a2 + 112) = v108;
  *(_QWORD *)(a2 + 120) = v102;
  v77 = v101;
  v78 = v93;
  *(_QWORD *)(a2 + 128) = v101;
  *(_QWORD *)(a2 + 136) = v78;
  v79 = v91;
  *(_QWORD *)(a2 + 152) = v92;
  *(_QWORD *)(a2 + 160) = v79;
  v80 = v90;
  *(_QWORD *)(a2 + 168) = v90;
  *(_QWORD *)(a2 + 184) = v98;
  *(_QWORD *)(a2 + 192) = v97;
  *(_QWORD *)(a2 + 200) = v99;
  *(_QWORD *)(a2 + 216) = v100;
  v119 = v72;
  v118 = v75;
  v117 = v76;
  v116 = v66;
  v115 = v67;
  v130 = v72;
  v129 = v75;
  v127 = v76;
  v81 = v76;
  sub_1DA525244(v69, v71, v72);
  swift_bridgeObjectRetain();
  sub_1DA525244(v114, v74, v75);
  swift_bridgeObjectRetain();
  sub_1DA525244(v112, v111, v81);
  swift_bridgeObjectRetain();
  v82 = v102;
  sub_1DA5FE280(v110, v109, v108, v102);
  sub_1DA525244(v77, v78, v87);
  swift_bridgeObjectRetain();
  sub_1DA525244(v79, v80, v88);
  swift_bridgeObjectRetain();
  v83 = v97;
  v84 = v99;
  LOBYTE(v57) = v89;
  sub_1DA525244(v97, v99, v89);
  swift_bridgeObjectRetain();
  sub_1DA5251EC(v83, v84, v57);
  swift_bridgeObjectRelease();
  sub_1DA5251EC(v79, v80, v115);
  swift_bridgeObjectRelease();
  sub_1DA5251EC(v101, v78, v116);
  swift_bridgeObjectRelease();
  sub_1DA5FE2B0(v110, v109, v108, v82);
  sub_1DA5251EC(v112, v111, v117);
  swift_bridgeObjectRelease();
  sub_1DA5251EC(v114, v103, v118);
  swift_bridgeObjectRelease();
  sub_1DA5251EC(v106, v105, v119);
  return swift_bridgeObjectRelease();
}

double sub_1DA665910@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  double result;
  __int128 v12;
  _OWORD v13[14];
  _BYTE v14[231];

  v2 = v1;
  v4 = sub_1DA66E53C();
  sub_1DA665068(v2, (uint64_t)v13);
  *(_OWORD *)&v14[167] = v13[10];
  *(_OWORD *)&v14[183] = v13[11];
  *(_OWORD *)&v14[199] = v13[12];
  *(_OWORD *)&v14[215] = v13[13];
  *(_OWORD *)&v14[103] = v13[6];
  *(_OWORD *)&v14[119] = v13[7];
  *(_OWORD *)&v14[135] = v13[8];
  *(_OWORD *)&v14[151] = v13[9];
  *(_OWORD *)&v14[39] = v13[2];
  *(_OWORD *)&v14[55] = v13[3];
  *(_OWORD *)&v14[71] = v13[4];
  *(_OWORD *)&v14[87] = v13[5];
  *(_OWORD *)&v14[7] = v13[0];
  *(_OWORD *)&v14[23] = v13[1];
  v5 = *(_OWORD *)&v14[160];
  *(_OWORD *)(a1 + 193) = *(_OWORD *)&v14[176];
  v6 = *(_OWORD *)&v14[208];
  *(_OWORD *)(a1 + 209) = *(_OWORD *)&v14[192];
  *(_OWORD *)(a1 + 225) = v6;
  v7 = *(_OWORD *)&v14[96];
  *(_OWORD *)(a1 + 129) = *(_OWORD *)&v14[112];
  v8 = *(_OWORD *)&v14[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v14[128];
  *(_OWORD *)(a1 + 161) = v8;
  *(_OWORD *)(a1 + 177) = v5;
  v9 = *(_OWORD *)&v14[32];
  *(_OWORD *)(a1 + 65) = *(_OWORD *)&v14[48];
  v10 = *(_OWORD *)&v14[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v14[64];
  *(_OWORD *)(a1 + 97) = v10;
  *(_OWORD *)(a1 + 113) = v7;
  result = *(double *)v14;
  v12 = *(_OWORD *)&v14[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v14;
  *(_OWORD *)(a1 + 33) = v12;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 240) = *(_QWORD *)&v14[223];
  *(_OWORD *)(a1 + 49) = v9;
  return result;
}

unint64_t sub_1DA665A28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F026ECD8;
  if (!qword_1F026ECD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F026ECE0);
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0CDFCC0], v1);
    atomic_store(result, (unint64_t *)&qword_1F026ECD8);
  }
  return result;
}

uint64_t OSSignposter.init(subsystem:category:)(uint64_t a1)
{
  uint64_t v2;

  sub_1DA66F694();
  sub_1DA66DDBC();
  v2 = sub_1DA66F6A0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t OSSignposter.init(subsystem:category:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_1DA67024C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA66F694();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  sub_1DA66DDC8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  v8 = sub_1DA66F6A0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
}

uint64_t sub_1DA665BA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_1DA66F6A0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DA66DDD4();
  __swift_allocate_value_buffer(v4, qword_1EDADED90);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EDADED90);
  if (qword_1EDADFFC8 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_1EDADEDC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  sub_1DA66F694();
  sub_1DA66DDBC();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t static OSSignposter.js.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DA48AF68(qword_1EDADEDA8, (uint64_t)qword_1EDADED90, a1);
}

uint64_t AdamID.jsRepresentation(in:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  sub_1DA4F726C();
  result = sub_1DA670354();
  v3 = MEMORY[0x1E0D41668];
  a1[3] = MEMORY[0x1E0DEA968];
  a1[4] = v3;
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1DA665D34@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  sub_1DA4F726C();
  result = sub_1DA670354();
  v3 = MEMORY[0x1E0D41668];
  a1[3] = MEMORY[0x1E0DEA968];
  a1[4] = v3;
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t AdamID.init(deserializing:using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_1DA66EC08();
  if (v6)
  {
    v7 = sub_1DA66DCCC();
    if (!v2)
    {
      v3 = v7;
      swift_bridgeObjectRelease();
      v12 = sub_1DA66ECC8();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a2, v12);
      v13 = sub_1DA66EC20();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
      return v3;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = sub_1DA66F6DC();
    sub_1DA59A0CC();
    swift_allocError();
    v8 = MEMORY[0x1E0DEE9D8];
    *v9 = MEMORY[0x1E0D7ED60];
    v9[1] = v8;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v9, *MEMORY[0x1E0D414F0], v3);
    swift_willThrow();
  }
  v10 = sub_1DA66ECC8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a2, v10);
  v11 = sub_1DA66EC20();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  return v3;
}

uint64_t sub_1DA665EE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = AdamID.init(deserializing:using:)(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

id PodcastsMetricsEventRecorder.init(metrics:defaultTopic:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  id result;

  result = objc_msgSend(a1, sel_setFlushTimerEnabled_, 1);
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t PodcastsMetricsEventRecorder.init(bag:defaultTopic:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  v8 = sub_1DA66F4E4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA66F4F0();
  sub_1DA66F4D8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = sub_1DA66F490();
  v13 = objc_allocWithZone(MEMORY[0x1E0CFDB60]);
  v14 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithContainerID_bag_, v14, v12);

  swift_unknownObjectRelease();
  v16 = (void *)sub_1DA66FD3C();

  objc_msgSend(v16, sel_setFlushTimerEnabled_, 1);
  v17 = sub_1DA66F4FC();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a1, v17);
  *a4 = v16;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

void PodcastsMetricsEventRecorder.record(_:on:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void **v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *v3;
  if (!a3)
    swift_bridgeObjectRetain();
  v5 = objc_allocWithZone(MEMORY[0x1E0CFDB68]);
  swift_bridgeObjectRetain();
  v6 = (void *)sub_1DA66F88C();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_initWithTopic_, v6);

  objc_msgSend(v8, sel_setAnonymous_, 1);
  sub_1DA66F01C();
  v7 = (void *)sub_1DA66F748();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_addPropertiesWithDictionary_, v7);

  objc_msgSend(v4, sel_enqueueEvent_, v8);
}

uint64_t PodcastsMetricsEventRecorder.flush()()
{
  void **v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAE2818);
  v2 = objc_msgSend(v1, sel_flush);
  sub_1DA66F64C();
  v3 = sub_1DA47D774(0, (unint64_t *)&qword_1EDAE5050);
  v4 = sub_1DA66FEC8();
  v8 = v3;
  v9 = MEMORY[0x1E0D416D8];
  v7[0] = v4;
  sub_1DA66F61C();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  v8 = sub_1DA66F010();
  v9 = MEMORY[0x1E0D40248];
  __swift_allocate_boxed_opaque_existential_1(v7);
  sub_1DA66F004();
  v5 = sub_1DA66F610();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

uint64_t sub_1DA6662CC(void **a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];

  v2 = sub_1DA66EC74();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1DA66F6B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *a1;
  if (qword_1EDAE2878 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_1EDAE2858);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2208);
  sub_1DA66EC8C();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1DA678510;
  sub_1DA66EC68();
  sub_1DA66EC5C();
  v11[3] = sub_1DA47D774(0, (unint64_t *)&qword_1EDADE760);
  v11[0] = v7;
  v9 = v7;
  sub_1DA66EC50();
  sub_1DA480E84((uint64_t)v11);
  sub_1DA66EC5C();
  sub_1DA66EC80();
  sub_1DA66F544();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1DA6664C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12[4];

  v0 = sub_1DA66EC74();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DA66F6B8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDAE2878 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v1, (uint64_t)qword_1EDAE2858);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE2208);
  sub_1DA66EC8C();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1DA678510;
  sub_1DA66EC68();
  sub_1DA66EC5C();
  swift_getErrorValue();
  v6 = v10;
  v7 = v11;
  v12[3] = v11;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(boxed_opaque_existential_1, v6, v7);
  sub_1DA66EC44();
  sub_1DA480E84((uint64_t)v12);
  sub_1DA66EC5C();
  sub_1DA66EC80();
  sub_1DA66F550();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

id sub_1DA6666C4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_integerValue);
  *a2 = result;
  return result;
}

uint64_t destroy for PodcastsMetricsEventRecorder(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *_s10PodcastsUI28PodcastsMetricsEventRecorderVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PodcastsMetricsEventRecorder(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PodcastsMetricsEventRecorder(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PodcastsMetricsEventRecorder()
{
  return &type metadata for PodcastsMetricsEventRecorder;
}

uint64_t MTImageStore.publisher<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v16[2];

  v7 = sub_1DA66CEBC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDAE5020);
  v10 = sub_1DA66E05C();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v12 + v11, (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  *(_QWORD *)(v12 + ((v9 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v3;
  v13 = v3;
  v16[1] = sub_1DA66E068();
  MEMORY[0x1DF0A039C](MEMORY[0x1E0C96108], v10);
  v14 = sub_1DA66E11C();
  swift_release();
  return v14;
}

uint64_t sub_1DA66697C(void (*a1)(char *), uint64_t a2, uint64_t a3, void *a4)
{
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];

  v26[1] = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE5020);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DA6707D4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v26 - v14;
  v16 = sub_1DA66CA0C();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA66CE68();
  v19 = *(_QWORD *)&v18[*(int *)(v16 + 64) + 8];
  swift_bridgeObjectRetain();
  sub_1DA4E8990((uint64_t)v18);
  if (v19)
  {
    v20 = (void *)sub_1DA66F88C();
    swift_bridgeObjectRelease();
    v21 = objc_msgSend(a4, sel_imageUrlForKey_, v20);

    if (v21)
    {
      sub_1DA66C304();

      v22 = sub_1DA66C358();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v8, 0, 1, v22);
    }
    else
    {
      v24 = sub_1DA66C358();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v8, 1, 1, v24);
    }
    sub_1DA49B0AC((uint64_t)v8, (uint64_t)v12);
  }
  else
  {
    v23 = sub_1DA66C358();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 1, 1, v23);
    v12 = v15;
  }
  swift_storeEnumTagMultiPayload();
  a1(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1DA666BC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1DA66CEBC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  return swift_deallocObject();
}

uint64_t sub_1DA666C3C(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(sub_1DA66CEBC() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_1DA66697C(a1, a2, v2 + v6, *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t InteractionContext.View.episodeCellType.getter(uint64_t result)
{
  if (result - 5 >= 3)
    return result;
  else
    return 5;
}

BOOL static InteractionContext.View.== infix(_:_:)(char a1, unsigned __int8 a2)
{
  switch(a1)
  {
    case 5:
      return a2 == 5;
    case 6:
      return a2 == 6;
    case 7:
      return a2 == 7;
  }
  if (a2 - 5 < 3)
    return 0;
  switch(a1)
  {
    case 2:
      return a2 == 2;
    case 3:
      return a2 == 3;
    case 4:
      return a2 == 4;
    default:
      return a2 - 2 >= 3 && ((((a1 & 1) == 0) ^ a2) & 1) != 0;
  }
}

BOOL static InteractionContext.EpisodeCellType.== infix(_:_:)(char a1, unsigned __int8 a2)
{
  switch(a1)
  {
    case 2:
      return a2 == 2;
    case 3:
      return a2 == 3;
    case 4:
      return a2 == 4;
  }
  if (a2 - 2 < 3)
    return 0;
  return (((a1 & 1) == 0) ^ a2) & 1;
}

uint64_t sub_1DA666E14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  switch(v2)
  {
    case 5:
      return v3 == 5;
    case 6:
      return v3 == 6;
    case 7:
      return v3 == 7;
  }
  if ((v3 - 5) < 3)
    return 0;
  switch(v2)
  {
    case 2:
      if (v3 != 2)
        return 0;
      break;
    case 3:
      if (v3 != 3)
        return 0;
      break;
    case 4:
      if (v3 != 4)
        return 0;
      break;
    default:
      if ((v3 - 2) < 3 || ((v2 & 1) == 0) == (v3 & 1))
        return 0;
      break;
  }
  return 1;
}

BOOL InteractionContext.EpisodeCellType.showsEpisodeControls.getter(char a1)
{
  return a1 != 3;
}

BOOL sub_1DA666EE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  switch(v2)
  {
    case 2:
      return v3 == 2;
    case 3:
      return v3 == 3;
    case 4:
      return v3 == 4;
  }
  if ((v3 - 2) < 3)
    return 0;
  return (((v2 & 1) == 0) ^ v3) & 1;
}

BOOL static InteractionContext.Origin.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t InteractionContext.Origin.hash(into:)()
{
  return sub_1DA6707A4();
}

uint64_t InteractionContext.Origin.hashValue.getter()
{
  sub_1DA670798();
  sub_1DA6707A4();
  return sub_1DA6707C8();
}

uint64_t InteractionContext.page.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DA492DD4(v1, a1);
}

uint64_t InteractionContext.origin.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for InteractionContext(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t InteractionContext.init(page:view:origin:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v6;
  uint64_t result;

  v6 = *a3;
  sub_1DA49CCD8(a1, a4);
  result = type metadata accessor for InteractionContext(0);
  *(_BYTE *)(a4 + *(int *)(result + 20)) = a2;
  *(_BYTE *)(a4 + *(int *)(result + 24)) = v6;
  return result;
}

uint64_t static InteractionContext.none.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  type metadata accessor for InteractionContext.Page(0);
  swift_storeEnumTagMultiPayload();
  result = type metadata accessor for InteractionContext(0);
  *(_BYTE *)(a1 + *(int *)(result + 20)) = 7;
  *(_BYTE *)(a1 + *(int *)(result + 24)) = 2;
  return result;
}

uint64_t InteractionContext.Page.init(rawString:adamID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (!a2)
    goto LABEL_66;
  if ((a1 != 0x65676150776F6873 || a2 != 0xE800000000000000) && (sub_1DA6706D8() & 1) == 0)
  {
    if (a1 == 0x5065646F73697065 && a2 == 0xEB00000000656761 || (sub_1DA6706D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)a5 = a3;
      *(_BYTE *)(a5 + 8) = a4 & 1;
      type metadata accessor for InteractionContext.Page(0);
      *(_QWORD *)(a5 + 16) = 0;
      *(_QWORD *)(a5 + 24) = 0;
      return swift_storeEnumTagMultiPayload();
    }
    if (a1 == 0x506C656E6E616863 && a2 == 0xEB00000000656761 || (sub_1DA6706D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)a5 = a3;
      *(_BYTE *)(a5 + 8) = a4 & 1;
      type metadata accessor for InteractionContext.Page(0);
      return swift_storeEnumTagMultiPayload();
    }
    if (a1 == 0x4C6C656E6E616863 && a2 == 0xEB00000000747369
      || (sub_1DA6706D8() & 1) != 0
      || a1 == 0x79726F6765746163 && a2 == 0xEC0000007473694CLL
      || (sub_1DA6706D8() & 1) != 0)
    {
      goto LABEL_57;
    }
    if (a1 == 0x4C65646F73697065 && a2 == 0xEB00000000747369 || (sub_1DA6706D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v12 = sub_1DA66D564();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a5, 1, 1, v12);
      type metadata accessor for InteractionContext.Page(0);
      return swift_storeEnumTagMultiPayload();
    }
    if (a1 == 0x6573776F7262 && a2 == 0xE600000000000000
      || (sub_1DA6706D8() & 1) != 0
      || a1 == 0x6867696C68676968 && a2 == 0xEA00000000007374
      || (sub_1DA6706D8() & 1) != 0
      || a1 == 0x7972617262696CLL && a2 == 0xE700000000000000
      || (sub_1DA6706D8() & 1) != 0
      || a1 == 0x6F4E6E657473696CLL && a2 == 0xE900000000000077
      || (sub_1DA6706D8() & 1) != 0
      || a1 == 0x6979616C50776F6ELL && a2 == 0xEA0000000000676ELL
      || (sub_1DA6706D8() & 1) != 0
      || a1 == 0xD000000000000012 && a2 == 0x80000001DA689DE0
      || (sub_1DA6706D8() & 1) != 0
      || a1 == 0x686372616573 && a2 == 0xE600000000000000
      || (sub_1DA6706D8() & 1) != 0
      || a1 == 0x7473694C776F6873 && a2 == 0xE800000000000000
      || (sub_1DA6706D8() & 1) != 0)
    {
LABEL_57:
      swift_bridgeObjectRelease();
      type metadata accessor for InteractionContext.Page(0);
      return swift_storeEnumTagMultiPayload();
    }
    if (a1 == 0x6E6F6974617473 && a2 == 0xE700000000000000 || (sub_1DA6706D8() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      *(_BYTE *)a5 = 2;
      type metadata accessor for InteractionContext.Page(0);
      return swift_storeEnumTagMultiPayload();
    }
    if (a1 == 0x7472616843706F74 && a2 == 0xE900000000000073)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1DA6706D8();
      swift_bridgeObjectRelease();
    }
LABEL_66:
    type metadata accessor for InteractionContext.Page(0);
    return swift_storeEnumTagMultiPayload();
  }
  swift_bridgeObjectRelease();
  v10 = a5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
  *(_QWORD *)a5 = a3;
  *(_BYTE *)(a5 + 8) = a4 & 1;
  v11 = sub_1DA66D564();
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  type metadata accessor for InteractionContext.Page(0);
  return swift_storeEnumTagMultiPayload();
}

BOOL InteractionContext.Page.isEpisodePage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _BOOL8 v4;
  uint64_t v6;

  v1 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA492DD4(v0, (uint64_t)v3);
  v4 = swift_getEnumCaseMultiPayload() == 2;
  sub_1DA492FFC((uint64_t)v3);
  return v4;
}

BOOL InteractionContext.Page.isEpisodeDetailTranscriptsPage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int EnumCaseMultiPayload;
  uint64_t v6;

  v1 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA492DD4(v0, (uint64_t)v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload != 5)
    sub_1DA492FFC((uint64_t)v3);
  return EnumCaseMultiPayload == 5;
}

BOOL InteractionContext.Page.isShowPage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v7;

  v1 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA492DD4(v0, (uint64_t)v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    swift_bridgeObjectRelease();
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88);
    sub_1DA47E2F0((uint64_t)&v3[*(int *)(v5 + 64)], &qword_1EDAE19C0);
  }
  else
  {
    sub_1DA492FFC((uint64_t)v3);
  }
  return EnumCaseMultiPayload == 3;
}

BOOL InteractionContext.Page.isRecentlyUnfollowedPage.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _BOOL8 v4;
  uint64_t v6;

  v1 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA492DD4(v0, (uint64_t)v3);
  v4 = swift_getEnumCaseMultiPayload() == 14;
  sub_1DA492FFC((uint64_t)v3);
  return v4;
}

BOOL InteractionContext.Page.isUnfollowedLibraryShow.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  _BYTE v15[72];
  _BYTE v16[72];

  v1 = v0;
  v2 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DA492DD4(v1, (uint64_t)v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    swift_bridgeObjectRelease();
    v9 = (uint64_t)&v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64)];
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    v9 = (uint64_t)v4;
LABEL_5:
    sub_1DA6692D8(v9, (uint64_t)v7);
    goto LABEL_7;
  }
  v10 = sub_1DA66D564();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_1DA492FFC((uint64_t)v4);
LABEL_7:
  v11 = sub_1DA66D564();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_1DA47E2F0((uint64_t)v7, &qword_1EDAE19C0);
    return 0;
  }
  else
  {
    sub_1DA66D558();
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v7, v11);
    sub_1DA669198((uint64_t)v15, (uint64_t)v16);
    v13 = v16[64] == 8;
    sub_1DA6691D4((uint64_t)v15);
  }
  return v13;
}

uint64_t InteractionContext.Page.episodeListSettings.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  v4 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA492DD4(v2, (uint64_t)v6);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    swift_bridgeObjectRelease();
    v8 = (uint64_t)&v6[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64)];
    return sub_1DA6692D8(v8, a1);
  }
  if (EnumCaseMultiPayload == 1)
  {
    v8 = (uint64_t)v6;
    return sub_1DA6692D8(v8, a1);
  }
  v10 = sub_1DA66D564();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a1, 1, 1, v10);
  return sub_1DA492FFC((uint64_t)v6);
}

uint64_t InteractionContext.Page.uuid.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA492DD4(v0, (uint64_t)v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    v5 = *((_QWORD *)v3 + 2);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88);
    sub_1DA47E2F0((uint64_t)&v3[*(int *)(v6 + 64)], &qword_1EDAE19C0);
  }
  else if (EnumCaseMultiPayload == 2)
  {
    return *((_QWORD *)v3 + 2);
  }
  else
  {
    sub_1DA492FFC((uint64_t)v3);
    return 0;
  }
  return v5;
}

uint64_t InteractionContext.Page.isRecentlyPlayedSeeAll.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int8x16_t v13;
  _BYTE v15[72];
  _QWORD v16[4];
  int8x16_t v17;
  int8x16_t v18;
  char v19;

  v1 = v0;
  v2 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DA492DD4(v1, (uint64_t)v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    swift_bridgeObjectRelease();
    v9 = (uint64_t)&v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64)];
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    v9 = (uint64_t)v4;
LABEL_5:
    sub_1DA6692D8(v9, (uint64_t)v7);
    goto LABEL_7;
  }
  v10 = sub_1DA66D564();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_1DA492FFC((uint64_t)v4);
LABEL_7:
  v11 = sub_1DA66D564();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_1DA47E2F0((uint64_t)v7, &qword_1EDAE19C0);
  }
  else
  {
    sub_1DA66D558();
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v7, v11);
    sub_1DA669198((uint64_t)v15, (uint64_t)v16);
    if (v19 == 9 && v16[0] == 1)
    {
      v13 = vorrq_s8(v17, v18);
      if (!(*(_QWORD *)&vorr_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)) | v16[3] | v16[2] | v16[1]))
        return 1;
    }
    sub_1DA6691D4((uint64_t)v15);
  }
  return 0;
}

uint64_t InteractionContext.Page.isUpNextSeeAll.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v14[72];
  _BYTE v15[72];

  v1 = v0;
  v2 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v14[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
  MEMORY[0x1E0C80A78](v5);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DA492DD4(v1, (uint64_t)v4);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    swift_bridgeObjectRelease();
    v9 = (uint64_t)&v4[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64)];
    goto LABEL_5;
  }
  if (EnumCaseMultiPayload == 1)
  {
    v9 = (uint64_t)v4;
LABEL_5:
    sub_1DA6692D8(v9, (uint64_t)v7);
    goto LABEL_7;
  }
  v10 = sub_1DA66D564();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  sub_1DA492FFC((uint64_t)v4);
LABEL_7:
  v11 = sub_1DA66D564();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_1DA47E2F0((uint64_t)v7, &qword_1EDAE19C0);
  }
  else
  {
    sub_1DA66D558();
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v7, v11);
    sub_1DA669198((uint64_t)v14, (uint64_t)v15);
    if (v15[64] == 5)
      return 1;
    sub_1DA6691D4((uint64_t)v14);
  }
  return 0;
}

uint64_t InteractionContext.Page.isTranscriptView.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int EnumCaseMultiPayload;
  uint64_t v7;

  v1 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA492DD4(v0, (uint64_t)v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 5 || EnumCaseMultiPayload == 18)
    return 1;
  sub_1DA492FFC((uint64_t)v3);
  return 0;
}

uint64_t InteractionContext.Page.entityAnnotation()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int EnumCaseMultiPayload;
  uint64_t v6;

  v1 = sub_1DA66BCE0();
  MEMORY[0x1E0C80A78](v1);
  v2 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v2);
  sub_1DA492DD4(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if ((EnumCaseMultiPayload - 4) >= 0x10)
    __asm { BR              X10 }
  return 0;
}

void sub_1DA668354()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
  {
    *(_QWORD *)(v1 - 80) = *(_QWORD *)v0;
    sub_1DA4F726C();
    v2 = sub_1DA670354();
    v4 = v3;
    *(_QWORD *)(v1 - 80) = MEMORY[0x1E0DEE9D8];
    sub_1DA47E32C(&qword_1EDAE3AA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0C90498], MEMORY[0x1E0C904C0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE4AF0);
    sub_1DA669368();
    sub_1DA670378();
    type metadata accessor for ChannelEntity();
    *(_QWORD *)(v1 - 80) = v2;
    *(_QWORD *)(v1 - 72) = v4;
    objc_allocWithZone((Class)sub_1DA66C6A0());
    sub_1DA47E32C(&qword_1F026D870, (uint64_t (*)(uint64_t))type metadata accessor for ChannelEntity, (uint64_t)&protocol conformance descriptor for ChannelEntity);
    sub_1DA66C694();
  }
  JUMPOUT(0x1DA668318);
}

void _s10PodcastsUI18InteractionContextV4PageO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
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
  char *v28;
  char *v29;
  _QWORD v30[7];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;

  v4 = sub_1DA66D564();
  v32 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  MEMORY[0x1E0C80A78](v4);
  v30[3] = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19D0);
  MEMORY[0x1E0C80A78](v31);
  v30[2] = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v30[6] = (char *)v30 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
  MEMORY[0x1E0C80A78](v9);
  v30[1] = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v34 = (char *)v30 - v12;
  MEMORY[0x1E0C80A78](v13);
  v35 = (char *)v30 - v14;
  MEMORY[0x1E0C80A78](v15);
  v30[4] = (char *)v30 - v16;
  MEMORY[0x1E0C80A78](v17);
  v30[5] = (char *)v30 - v18;
  v19 = type metadata accessor for InteractionContext.Page(0);
  MEMORY[0x1E0C80A78](v19);
  MEMORY[0x1E0C80A78](v20);
  MEMORY[0x1E0C80A78](v21);
  MEMORY[0x1E0C80A78](v22);
  MEMORY[0x1E0C80A78](v23);
  MEMORY[0x1E0C80A78](v24);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE0A70);
  MEMORY[0x1E0C80A78](v25);
  v28 = (char *)v30 + *(int *)(v27 + 48) - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA492DD4(a1, (uint64_t)v30 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DA492DD4(a2, (uint64_t)v28);
  v29 = (char *)sub_1DA668950 + 4 * byte_1DA686C38[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1DA668950()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;

  sub_1DA492DD4(v2, v0);
  v3 = *(_QWORD *)v0;
  if (swift_getEnumCaseMultiPayload())
  {
    sub_1DA47E2F0(v2, &qword_1EDAE0A70);
LABEL_6:
    v5 = 0;
    return v5 & 1;
  }
  v4 = *(_BYTE *)(v1 + 8);
  if ((*(_BYTE *)(v0 + 8) & 1) == 0)
  {
    if (v3 != *(_QWORD *)v1)
      v4 = 1;
    if ((v4 & 1) == 0)
      goto LABEL_4;
    goto LABEL_11;
  }
  if (!*(_BYTE *)(v1 + 8))
  {
LABEL_11:
    sub_1DA492FFC(v2);
    goto LABEL_6;
  }
LABEL_4:
  sub_1DA492FFC(v2);
  v5 = 1;
  return v5 & 1;
}

uint64_t sub_1DA669198(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0D7DF08] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t sub_1DA6691D4(uint64_t a1)
{
  sub_1DA66921C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
  return a1;
}

void sub_1DA66921C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  switch(a9)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 6:
    case 8:
      goto LABEL_2;
    case 4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_2:
      swift_bridgeObjectRelease();
      break;
    case 7:
      swift_bridgeObjectRelease();
      sub_1DA6692C4(a3, a4);
      break;
    default:
      return;
  }
}

uint64_t sub_1DA6692C4(uint64_t a1, char a2)
{
  uint64_t result;

  if (a2 == 1)
    return swift_release();
  return result;
}

uint64_t sub_1DA6692D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DA669320()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DA669344()
{
  uint64_t v0;

  return swift_deallocObject();
}

unint64_t sub_1DA669368()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDAE4AF8;
  if (!qword_1EDAE4AF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDAE4AF0);
    result = MEMORY[0x1DF0A039C](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EDAE4AF8);
  }
  return result;
}

unint64_t sub_1DA6693B8()
{
  unint64_t result;

  result = qword_1F026ECE8;
  if (!qword_1F026ECE8)
  {
    result = MEMORY[0x1DF0A039C](&protocol conformance descriptor for InteractionContext.Origin, &type metadata for InteractionContext.Origin);
    atomic_store(result, (unint64_t *)&qword_1F026ECE8);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for InteractionContext(char *a1, char *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    v7 = type metadata accessor for InteractionContext.Page(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 3:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        a1[8] = a2[8];
        v13 = *((_QWORD *)a2 + 3);
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = v13;
        swift_bridgeObjectRetain();
        v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
        v15 = &a1[v14];
        v16 = &a2[v14];
        v17 = sub_1DA66D564();
        v18 = *(_QWORD *)(v17 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
        {
          v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
          memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
        }
        break;
      case 2:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        a1[8] = a2[8];
        v20 = *((_QWORD *)a2 + 3);
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = v20;
        swift_bridgeObjectRetain();
        break;
      case 1:
        v9 = sub_1DA66D564();
        v10 = *(_QWORD *)(v9 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(a2, 1, v9))
        {
          v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v10 + 16))(a1, a2, v9);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(a1, 0, 1, v9);
        }
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
LABEL_16:
        v21 = *(int *)(a3 + 24);
        a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
        a1[v21] = a2[v21];
        return a1;
    }
    swift_storeEnumTagMultiPayload();
    goto LABEL_16;
  }
  v12 = *(_QWORD *)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  a1 = (char *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
  sub_1DA66BE60();
  return a1;
}

char *initializeWithCopy for InteractionContext(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
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

  v6 = type metadata accessor for InteractionContext.Page(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 3:
      *(_QWORD *)a1 = *(_QWORD *)a2;
      a1[8] = a2[8];
      v11 = *((_QWORD *)a2 + 3);
      *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
      *((_QWORD *)a1 + 3) = v11;
      swift_bridgeObjectRetain();
      v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
      v13 = &a1[v12];
      v14 = &a2[v12];
      v15 = sub_1DA66D564();
      v16 = *(_QWORD *)(v15 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
      {
        v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      }
      goto LABEL_13;
    case 2:
      *(_QWORD *)a1 = *(_QWORD *)a2;
      a1[8] = a2[8];
      v18 = *((_QWORD *)a2 + 3);
      *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
      *((_QWORD *)a1 + 3) = v18;
      swift_bridgeObjectRetain();
LABEL_13:
      swift_storeEnumTagMultiPayload();
      goto LABEL_14;
    case 1:
      v8 = sub_1DA66D564();
      v9 = *(_QWORD *)(v8 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 16))(a1, a2, v8);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      }
      goto LABEL_13;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
LABEL_14:
  v19 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  a1[v19] = a2[v19];
  return a1;
}

char *assignWithCopy for InteractionContext(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 != a2)
  {
    sub_1DA492FFC((uint64_t)a1);
    v6 = type metadata accessor for InteractionContext.Page(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 3:
        v11 = *(_QWORD *)a2;
        a1[8] = a2[8];
        *(_QWORD *)a1 = v11;
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
        swift_bridgeObjectRetain();
        v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
        v13 = &a1[v12];
        v14 = &a2[v12];
        v15 = sub_1DA66D564();
        v16 = *(_QWORD *)(v15 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
        {
          v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
          memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
        }
        goto LABEL_14;
      case 2:
        v18 = *(_QWORD *)a2;
        a1[8] = a2[8];
        *(_QWORD *)a1 = v18;
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
        swift_bridgeObjectRetain();
LABEL_14:
        swift_storeEnumTagMultiPayload();
        goto LABEL_15;
      case 1:
        v8 = sub_1DA66D564();
        v9 = *(_QWORD *)(v8 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
        {
          v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v9 + 16))(a1, a2, v8);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
        }
        goto LABEL_14;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
LABEL_15:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

char *initializeWithTake for InteractionContext(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = type metadata accessor for InteractionContext.Page(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1[8] = a2[8];
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = sub_1DA66D564();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
    goto LABEL_11;
  }
  if (EnumCaseMultiPayload == 1)
  {
    v8 = sub_1DA66D564();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(a1, a2, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
LABEL_11:
    swift_storeEnumTagMultiPayload();
    goto LABEL_12;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
LABEL_12:
  v17 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  a1[v17] = a2[v17];
  return a1;
}

char *assignWithTake for InteractionContext(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 != a2)
  {
    sub_1DA492FFC((uint64_t)a1);
    v6 = type metadata accessor for InteractionContext.Page(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      a1[8] = a2[8];
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
      v12 = &a1[v11];
      v13 = &a2[v11];
      v14 = sub_1DA66D564();
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
      goto LABEL_12;
    }
    if (EnumCaseMultiPayload == 1)
    {
      v8 = sub_1DA66D564();
      v9 = *(_QWORD *)(v8 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
      {
        v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v9 + 32))(a1, a2, v8);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
      }
LABEL_12:
      swift_storeEnumTagMultiPayload();
      goto LABEL_13;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
LABEL_13:
  v17 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  a1[v17] = a2[v17];
  return a1;
}

uint64_t getEnumTagSinglePayload for InteractionContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DA669E34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = type metadata accessor for InteractionContext.Page(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 3)
    return v9 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InteractionContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DA669EB8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for InteractionContext.Page(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 2;
  return result;
}

char *initializeBufferWithCopyOfBuffer for InteractionContext.Page(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v11 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v11 + ((v6 + 16) & ~(unint64_t)v6));
    sub_1DA66BE60();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 3:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        a1[8] = a2[8];
        v13 = *((_QWORD *)a2 + 3);
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = v13;
        swift_bridgeObjectRetain();
        v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
        v15 = &a1[v14];
        v16 = &a2[v14];
        v17 = sub_1DA66D564();
        v18 = *(_QWORD *)(v17 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
        {
          v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
          memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
        }
        goto LABEL_14;
      case 2:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        a1[8] = a2[8];
        v20 = *((_QWORD *)a2 + 3);
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = v20;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1:
        v8 = sub_1DA66D564();
        v9 = *(_QWORD *)(v8 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
        {
          v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v9 + 16))(a1, a2, v8);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
        }
LABEL_14:
        swift_storeEnumTagMultiPayload();
        return a1;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

char *assignWithCopy for InteractionContext.Page(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 != a2)
  {
    sub_1DA492FFC((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    switch(EnumCaseMultiPayload)
    {
      case 3:
        v10 = *(_QWORD *)a2;
        a1[8] = a2[8];
        *(_QWORD *)a1 = v10;
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
        swift_bridgeObjectRetain();
        v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
        v12 = &a1[v11];
        v13 = &a2[v11];
        v14 = sub_1DA66D564();
        v15 = *(_QWORD *)(v14 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
        {
          v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
          memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
        }
        goto LABEL_14;
      case 2:
        v17 = *(_QWORD *)a2;
        a1[8] = a2[8];
        *(_QWORD *)a1 = v17;
        *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
        *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
        swift_bridgeObjectRetain();
LABEL_14:
        swift_storeEnumTagMultiPayload();
        return a1;
      case 1:
        v7 = sub_1DA66D564();
        v8 = *(_QWORD *)(v7 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
        {
          v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v8 + 16))(a1, a2, v7);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
        }
        goto LABEL_14;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

char *initializeWithTake for InteractionContext.Page(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1[8] = a2[8];
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDADED88) + 64);
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = sub_1DA66D564();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    goto LABEL_11;
  }
  if (EnumCaseMultiPayload == 1)
  {
    v7 = sub_1DA66D564();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE19C0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(a1, a2, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
LABEL_11:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

uint64_t getEnumTagSinglePayload for InteractionContext.View(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
  {
    v6 = *a1;
    v8 = v6 >= 2;
    v7 = (v6 + 2147483646) & 0x7FFFFFFF;
    v8 = v8 && v7 >= 3;
    if (v8 && v7 - 2 > 3)
      return v7 - 5;
    return 0;
  }
  v2 = a2 + 7;
  if (a2 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if (v2 >> 8 < 0xFF)
    v3 = 1;
  if (v2 >= 0x100)
    v4 = v3;
  else
    v4 = 0;
  return ((uint64_t (*)(void))((char *)&loc_1DA66A544 + 4 * byte_1DA686C55[v4]))();
}

uint64_t storeEnumTagSinglePayload for InteractionContext.View(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 7;
  if (a3 + 7 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xF9)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1DA66A600 + 4 * byte_1DA686C5F[v5]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1DA66A634 + 4 * byte_1DA686C5A[v5]))();
}

uint64_t sub_1DA66A634(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA66A63C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DA66A644);
  return result;
}

uint64_t sub_1DA66A650(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DA66A658);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1DA66A65C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA66A664(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA66A670(unsigned __int8 *a1)
{
  unsigned int v1;
  unsigned int v2;
  uint64_t result;

  v1 = *a1;
  if (v1 < 2)
    return 0;
  v2 = (v1 + 2147483646) & 0x7FFFFFFF;
  result = v2 - 2;
  if (v2 <= 2)
    return 0;
  return result;
}

_BYTE *sub_1DA66A698(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 4;
  return result;
}

uint64_t getEnumTagSinglePayload for InteractionContext.EpisodeCellType(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t result;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
  {
    v6 = *a1;
    if (v6 >= 2)
    {
      v7 = (v6 + 2147483646) & 0x7FFFFFFF;
      result = v7 - 2;
      if (v7 > 2)
        return result;
    }
    return 0;
  }
  v2 = a2 + 4;
  if (a2 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if (v2 >> 8 < 0xFF)
    v3 = 1;
  if (v2 >= 0x100)
    v4 = v3;
  else
    v4 = 0;
  return ((uint64_t (*)(void))((char *)&loc_1DA66A700 + 4 * byte_1DA686C64[v4]))();
}

uint64_t storeEnumTagSinglePayload for InteractionContext.EpisodeCellType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 4;
  if (a3 + 4 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFC)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1DA66A7AC + 4 * byte_1DA686C6E[v5]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1DA66A7E0 + 4 * byte_1DA686C69[v5]))();
}

uint64_t sub_1DA66A7E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA66A7E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DA66A7F0);
  return result;
}

uint64_t sub_1DA66A7FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DA66A804);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1DA66A808(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA66A810(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA66A81C(unsigned __int8 *a1)
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

_BYTE *sub_1DA66A838(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for InteractionContext.EpisodeCellType()
{
  return &type metadata for InteractionContext.EpisodeCellType;
}

uint64_t storeEnumTagSinglePayload for InteractionContext.Origin(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DA66A8AC + 4 * byte_1DA686C78[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DA66A8E0 + 4 * byte_1DA686C73[v4]))();
}

uint64_t sub_1DA66A8E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA66A8E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DA66A8F0);
  return result;
}

uint64_t sub_1DA66A8FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DA66A904);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DA66A908(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DA66A910(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t dispatch thunk of InteractionContextPageProviding.interactionContextPage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of InteractionContextPageProviding.interactionContextOrigin.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of InteractionContextViewProviding.interactionContextView.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t Dependency.init<A, B>(aliasing:with:)()
{
  return sub_1DA66EBC0();
}

uint64_t sub_1DA66A960(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = *(_QWORD *)(*a1 + *MEMORY[0x1E0DEE2A8]);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v4 = (char *)&v6 - v3;
  sub_1DA66EE30();
  sub_1DA66EE24();
  sub_1DA66EDDC();
  swift_release();
  swift_getAtKeyPath();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_1DA66AA1C()
{
  _QWORD *v0;

  return sub_1DA66A960(v0);
}

uint64_t Dependency.init<A>(injecting:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = (_QWORD *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a3;
  v6[4] = a1;
  return sub_1DA66EBC0();
}

uint64_t sub_1DA66AA88()
{
  swift_getAssociatedTypeWitness();
  sub_1DA66EE24();
  return sub_1DA66EBE4();
}

uint64_t sub_1DA66AAFC()
{
  return swift_deallocObject();
}

uint64_t sub_1DA66AB0C()
{
  return sub_1DA66AA88();
}

uint64_t NowPlayingArtwork.Data.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void **v7;
  int EnumCaseMultiPayload;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v14;
  unint64_t v15;

  v1 = v0;
  v2 = sub_1DA66CA0C();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for NowPlayingArtwork.Data();
  MEMORY[0x1E0C80A78](v5);
  v7 = (void **)((char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DA525A18(v1, (uint64_t)v7);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
  {
    v10 = *v7;
    v14 = 0x3D6567616D49;
    v15 = 0xE600000000000000;
    v11 = objc_msgSend(v10, sel_description);
LABEL_6:
    v12 = v11;
    sub_1DA66F8BC();

    sub_1DA66F988();
    swift_bridgeObjectRelease();
    return v14;
  }
  if (EnumCaseMultiPayload != 1)
  {
    v10 = *v7;
    v14 = 0x3D676F6C61746143;
    v15 = 0xE800000000000000;
    v11 = objc_msgSend(v10, sel_description);
    goto LABEL_6;
  }
  sub_1DA51C1BC((uint64_t)v7, (uint64_t)v4);
  v14 = 0x3D6C65646F4DLL;
  v15 = 0xE600000000000000;
  swift_bridgeObjectRetain();
  sub_1DA66F988();
  swift_bridgeObjectRelease();
  v9 = v14;
  sub_1DA47F880((uint64_t)v4, (uint64_t (*)(_QWORD))MEMORY[0x1E0D7D7F0]);
  return v9;
}

char *_s4DataOwCP(char *a1, char **a2, uint64_t a3)
{
  int v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  id v12;
  id *v13;
  int v14;
  id v15;
  id *v16;
  int v17;
  id v18;
  id *v19;
  int v20;
  id v21;
  id *v22;
  int v23;
  id v24;
  id *v25;
  int v26;
  id v27;
  int *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v10[(v5 + 16) & ~(unint64_t)v5];
    sub_1DA66BE60();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = a2[1];
      *(_QWORD *)a1 = *a2;
      *((_QWORD *)a1 + 1) = v6;
      v7 = *((unsigned __int8 *)a2 + 32);
      swift_bridgeObjectRetain();
      if (v7 == 255)
      {
        *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
        a1[32] = *((_BYTE *)a2 + 32);
      }
      else
      {
        v8 = (uint64_t)a2[2];
        v9 = (uint64_t)a2[3];
        sub_1DA481390(v8, v9, v7);
        *((_QWORD *)a1 + 2) = v8;
        *((_QWORD *)a1 + 3) = v9;
        a1[32] = v7;
      }
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
      v13 = (id *)(a2 + 7);
      v14 = *((unsigned __int8 *)a2 + 64);
      if (v14 == 255)
      {
        *((_QWORD *)a1 + 7) = *v13;
        a1[64] = *((_BYTE *)a2 + 64);
      }
      else
      {
        v15 = *v13;
        sub_1DA4E762C(*v13, *((_BYTE *)a2 + 64));
        *((_QWORD *)a1 + 7) = v15;
        a1[64] = v14;
      }
      v16 = (id *)(a2 + 9);
      v17 = *((unsigned __int8 *)a2 + 80);
      if (v17 == 255)
      {
        *((_QWORD *)a1 + 9) = *v16;
        a1[80] = *((_BYTE *)a2 + 80);
      }
      else
      {
        v18 = *v16;
        sub_1DA4E762C(*v16, *((_BYTE *)a2 + 80));
        *((_QWORD *)a1 + 9) = v18;
        a1[80] = v17;
      }
      v19 = (id *)(a2 + 11);
      v20 = *((unsigned __int8 *)a2 + 96);
      if (v20 == 255)
      {
        *((_QWORD *)a1 + 11) = *v19;
        a1[96] = *((_BYTE *)a2 + 96);
      }
      else
      {
        v21 = *v19;
        sub_1DA4E762C(*v19, *((_BYTE *)a2 + 96));
        *((_QWORD *)a1 + 11) = v21;
        a1[96] = v20;
      }
      v22 = (id *)(a2 + 13);
      v23 = *((unsigned __int8 *)a2 + 112);
      if (v23 == 255)
      {
        *((_QWORD *)a1 + 13) = *v22;
        a1[112] = *((_BYTE *)a2 + 112);
      }
      else
      {
        v24 = *v22;
        sub_1DA4E762C(*v22, *((_BYTE *)a2 + 112));
        *((_QWORD *)a1 + 13) = v24;
        a1[112] = v23;
      }
      v25 = (id *)(a2 + 15);
      v26 = *((unsigned __int8 *)a2 + 128);
      if (v26 == 255)
      {
        *((_QWORD *)a1 + 15) = *v25;
        a1[128] = *((_BYTE *)a2 + 128);
      }
      else
      {
        v27 = *v25;
        sub_1DA4E762C(*v25, *((_BYTE *)a2 + 128));
        *((_QWORD *)a1 + 15) = v27;
        a1[128] = v26;
      }
      a1[129] = *((_BYTE *)a2 + 129);
      v28 = (int *)sub_1DA66CA0C();
      v29 = v28[11];
      v30 = &a1[v29];
      v31 = (uint64_t)a2 + v29;
      v32 = sub_1DA66C928();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v30, v31, v32);
      v33 = v28[12];
      v34 = &a1[v33];
      v35 = (char **)((char *)a2 + v33);
      v36 = v35[1];
      *(_QWORD *)v34 = *v35;
      *((_QWORD *)v34 + 1) = v36;
      a1[v28[13]] = *((_BYTE *)a2 + v28[13]);
      a1[v28[14]] = *((_BYTE *)a2 + v28[14]);
      a1[v28[15]] = *((_BYTE *)a2 + v28[15]);
      v37 = v28[16];
      v38 = &a1[v37];
      v39 = (char **)((char *)a2 + v37);
      v40 = v39[1];
      *(_QWORD *)v38 = *v39;
      *((_QWORD *)v38 + 1) = v40;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v11 = *a2;
      *(_QWORD *)a1 = *a2;
      v12 = v11;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *_s4DataOwtk(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    *((_BYTE *)a1 + 32) = *((_BYTE *)a2 + 32);
    *(_OWORD *)((char *)a1 + 40) = *(_OWORD *)((char *)a2 + 40);
    *((_QWORD *)a1 + 7) = *((_QWORD *)a2 + 7);
    *((_BYTE *)a1 + 64) = *((_BYTE *)a2 + 64);
    *(_OWORD *)((char *)a1 + 113) = *(_OWORD *)((char *)a2 + 113);
    *(_OWORD *)((char *)a1 + 104) = *(_OWORD *)((char *)a2 + 104);
    *(_OWORD *)((char *)a1 + 88) = *(_OWORD *)((char *)a2 + 88);
    *(_OWORD *)((char *)a1 + 72) = *(_OWORD *)((char *)a2 + 72);
    *((_BYTE *)a1 + 129) = *((_BYTE *)a2 + 129);
    v7 = (int *)sub_1DA66CA0C();
    v8 = v7[11];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1DA66C928();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    *(_OWORD *)((char *)a1 + v7[12]) = *(_OWORD *)((char *)a2 + v7[12]);
    *((_BYTE *)a1 + v7[13]) = *((_BYTE *)a2 + v7[13]);
    *((_BYTE *)a1 + v7[14]) = *((_BYTE *)a2 + v7[14]);
    *((_BYTE *)a1 + v7[15]) = *((_BYTE *)a2 + v7[15]);
    *(_OWORD *)((char *)a1 + v7[16]) = *(_OWORD *)((char *)a2 + v7[16]);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *_s4DataOwta(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_1DA47F880((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for NowPlayingArtwork.Data);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      *((_BYTE *)a1 + 32) = *((_BYTE *)a2 + 32);
      *(_OWORD *)((char *)a1 + 40) = *(_OWORD *)((char *)a2 + 40);
      *((_QWORD *)a1 + 7) = *((_QWORD *)a2 + 7);
      *((_BYTE *)a1 + 64) = *((_BYTE *)a2 + 64);
      *(_OWORD *)((char *)a1 + 113) = *(_OWORD *)((char *)a2 + 113);
      *(_OWORD *)((char *)a1 + 104) = *(_OWORD *)((char *)a2 + 104);
      *(_OWORD *)((char *)a1 + 88) = *(_OWORD *)((char *)a2 + 88);
      *(_OWORD *)((char *)a1 + 72) = *(_OWORD *)((char *)a2 + 72);
      *((_BYTE *)a1 + 129) = *((_BYTE *)a2 + 129);
      v7 = (int *)sub_1DA66CA0C();
      v8 = v7[11];
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_1DA66C928();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      *(_OWORD *)((char *)a1 + v7[12]) = *(_OWORD *)((char *)a2 + v7[12]);
      *((_BYTE *)a1 + v7[13]) = *((_BYTE *)a2 + v7[13]);
      *((_BYTE *)a1 + v7[14]) = *((_BYTE *)a2 + v7[14]);
      *((_BYTE *)a1 + v7[15]) = *((_BYTE *)a2 + v7[15]);
      *(_OWORD *)((char *)a1 + v7[16]) = *(_OWORD *)((char *)a2 + v7[16]);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1DA66B258()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DA66CA0C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_1DA66B2CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAE0A60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DA66B30C(uint64_t a1)
{
  int64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    sub_1DA498794(0, v2, 0);
    __asm { BR              X9 }
  }
  return result;
}

void sub_1DA66B8D8(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v6 = objc_msgSend((id)objc_opt_self(), sel__applePodcastsFoundationSharedUserDefaults);
  if (a1 == 7104878 && a2 == 0xE300000000000000 || (sub_1DA6706D8() & 1) != 0)
  {
    v4 = (void *)sub_1DA66F88C();
    objc_msgSend(v6, sel_setURL_forKey_, 0, v4);
  }
  else
  {
    v5 = (void *)sub_1DA66F88C();
    v4 = (void *)sub_1DA66F88C();
    objc_msgSend(v6, sel_setObject_forKey_, v5, v4);

  }
}

uint64_t _s10PodcastsUI4GridO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*((_BYTE *)a1 + 8) == 1)
    return ((uint64_t (*)(void))((char *)&loc_1DA66BA20 + 4 * byte_1DA686F7E[v2]))();
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return v2 == *(_QWORD *)a2;
}

uint64_t sub_1DA66BA4C@<X0>(char a1@<W8>)
{
  uint64_t v1;

  if (v1 != 1)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x1DA66BA38);
  return 1;
}

uint64_t sub_1DA66BA60@<X0>(char a1@<W8>)
{
  uint64_t v1;

  if (v1 != 2)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x1DA66BA38);
  return 1;
}

uint64_t sub_1DA66BA74@<X0>(char a1@<W8>)
{
  uint64_t v1;

  if (v1 != 3)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x1DA66BA38);
  return 1;
}

uint64_t sub_1DA66BA88@<X0>(char a1@<W8>)
{
  uint64_t v1;

  if (v1 != 4)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x1DA66BA38);
  return 1;
}

uint64_t sub_1DA66BA9C@<X0>(char a1@<W8>)
{
  unint64_t v1;

  if (v1 <= 4)
    a1 = 0;
  if ((a1 & 1) == 0)
    JUMPOUT(0x1DA66BA38);
  return 1;
}

uint64_t initializeBufferWithCopyOfBuffer for TranscriptSentenceSplittingBehavior(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = v3;
  return a1;
}

void destroy for TranscriptSentenceSplittingBehavior(uint64_t a1)
{

}

_QWORD *assignWithCopy for TranscriptSentenceSplittingBehavior(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  a1[1] = a2[1];
  v3 = (void *)a2[2];
  v4 = (void *)a1[2];
  a1[2] = v3;
  v5 = v3;

  return a1;
}

uint64_t assignWithTake for TranscriptSentenceSplittingBehavior(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for TranscriptSentenceSplittingBehavior(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TranscriptSentenceSplittingBehavior(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

uint64_t sub_1DA66BC10(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1DA66BC28(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    result[1] = 0;
    result[2] = 0;
    *result = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    result[2] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for TranscriptSentenceSplittingBehavior()
{
  return &type metadata for TranscriptSentenceSplittingBehavior;
}

uint64_t sub_1DA66BC80()
{
  return MEMORY[0x1E0C902C8]();
}

uint64_t sub_1DA66BC8C()
{
  return MEMORY[0x1E0C90350]();
}

uint64_t sub_1DA66BC98()
{
  return MEMORY[0x1E0C90360]();
}

uint64_t sub_1DA66BCA4()
{
  return MEMORY[0x1E0C90368]();
}

uint64_t sub_1DA66BCB0()
{
  return MEMORY[0x1E0C90378]();
}

uint64_t sub_1DA66BCBC()
{
  return MEMORY[0x1E0C90380]();
}

uint64_t sub_1DA66BCC8()
{
  return MEMORY[0x1E0C90428]();
}

uint64_t sub_1DA66BCD4()
{
  return MEMORY[0x1E0C90438]();
}

uint64_t sub_1DA66BCE0()
{
  return MEMORY[0x1E0C90498]();
}

uint64_t sub_1DA66BCEC()
{
  return MEMORY[0x1E0C90518]();
}

uint64_t sub_1DA66BCF8()
{
  return MEMORY[0x1E0C905A0]();
}

uint64_t sub_1DA66BD04()
{
  return MEMORY[0x1E0C905C0]();
}

uint64_t sub_1DA66BD10()
{
  return MEMORY[0x1E0C90640]();
}

uint64_t sub_1DA66BD1C()
{
  return MEMORY[0x1E0C90650]();
}

uint64_t sub_1DA66BD28()
{
  return MEMORY[0x1E0C90760]();
}

uint64_t sub_1DA66BD34()
{
  return MEMORY[0x1E0C90778]();
}

uint64_t sub_1DA66BD40()
{
  return MEMORY[0x1E0C907A8]();
}

uint64_t sub_1DA66BD4C()
{
  return MEMORY[0x1E0C907B8]();
}

uint64_t sub_1DA66BD58()
{
  return MEMORY[0x1E0C907D0]();
}

uint64_t sub_1DA66BD64()
{
  return MEMORY[0x1E0C909F0]();
}

uint64_t sub_1DA66BD70()
{
  return MEMORY[0x1E0C909F8]();
}

uint64_t sub_1DA66BD7C()
{
  return MEMORY[0x1E0C90A08]();
}

uint64_t sub_1DA66BD88()
{
  return MEMORY[0x1E0C90A30]();
}

uint64_t sub_1DA66BD94()
{
  return MEMORY[0x1E0C90AC8]();
}

uint64_t sub_1DA66BDA0()
{
  return MEMORY[0x1E0C90AD8]();
}

uint64_t sub_1DA66BDAC()
{
  return MEMORY[0x1E0C90AE8]();
}

uint64_t sub_1DA66BDB8()
{
  return MEMORY[0x1E0C90AF8]();
}

uint64_t sub_1DA66BDC4()
{
  return MEMORY[0x1E0C90B78]();
}

uint64_t sub_1DA66BDD0()
{
  return MEMORY[0x1E0C90B80]();
}

uint64_t sub_1DA66BDDC()
{
  return MEMORY[0x1E0C90B98]();
}

uint64_t sub_1DA66BDE8()
{
  return MEMORY[0x1E0C90BB0]();
}

uint64_t sub_1DA66BDF4()
{
  return MEMORY[0x1E0C90CA0]();
}

uint64_t sub_1DA66BE00()
{
  return MEMORY[0x1E0C90CB0]();
}

uint64_t sub_1DA66BE0C()
{
  return MEMORY[0x1E0C90CF0]();
}

uint64_t sub_1DA66BE18()
{
  return MEMORY[0x1E0C90D00]();
}

uint64_t sub_1DA66BE24()
{
  return MEMORY[0x1E0C90D10]();
}

uint64_t sub_1DA66BE30()
{
  return MEMORY[0x1E0C90D20]();
}

uint64_t sub_1DA66BE3C()
{
  return MEMORY[0x1E0C90DC8]();
}

uint64_t sub_1DA66BE48()
{
  return MEMORY[0x1E0C90E30]();
}

uint64_t sub_1DA66BE54()
{
  return MEMORY[0x1E0C90E80]();
}

uint64_t sub_1DA66BE60()
{
  return MEMORY[0x1E0C90F60]();
}

uint64_t sub_1DA66BE6C()
{
  return MEMORY[0x1E0C90F78]();
}

uint64_t sub_1DA66BE78()
{
  return MEMORY[0x1E0C90F90]();
}

uint64_t sub_1DA66BE84()
{
  return MEMORY[0x1E0C90FA0]();
}

uint64_t sub_1DA66BE90()
{
  return MEMORY[0x1E0C90FB0]();
}

uint64_t sub_1DA66BE9C()
{
  return MEMORY[0x1E0C90FC0]();
}

uint64_t sub_1DA66BEA8()
{
  return MEMORY[0x1E0C90FD0]();
}

uint64_t sub_1DA66BEB4()
{
  return MEMORY[0x1E0C90FD8]();
}

uint64_t sub_1DA66BEC0()
{
  return MEMORY[0x1E0C90FF0]();
}

uint64_t sub_1DA66BECC()
{
  return MEMORY[0x1E0C91000]();
}

uint64_t sub_1DA66BED8()
{
  return MEMORY[0x1E0C91008]();
}

uint64_t sub_1DA66BEE4()
{
  return MEMORY[0x1E0C91030]();
}

uint64_t sub_1DA66BEF0()
{
  return MEMORY[0x1E0C91040]();
}

uint64_t sub_1DA66BEFC()
{
  return MEMORY[0x1E0C91048]();
}

uint64_t sub_1DA66BF08()
{
  return MEMORY[0x1E0C91058]();
}

uint64_t sub_1DA66BF14()
{
  return MEMORY[0x1E0C91068]();
}

uint64_t sub_1DA66BF20()
{
  return MEMORY[0x1E0C91090]();
}

uint64_t sub_1DA66BF2C()
{
  return MEMORY[0x1E0C910B8]();
}

uint64_t sub_1DA66BF38()
{
  return MEMORY[0x1E0C910D0]();
}

uint64_t sub_1DA66BF44()
{
  return MEMORY[0x1E0C910D8]();
}

uint64_t sub_1DA66BF50()
{
  return MEMORY[0x1E0C91100]();
}

uint64_t sub_1DA66BF5C()
{
  return MEMORY[0x1E0C91120]();
}

uint64_t sub_1DA66BF68()
{
  return MEMORY[0x1E0C91128]();
}

uint64_t sub_1DA66BF74()
{
  return MEMORY[0x1E0C91450]();
}

uint64_t sub_1DA66BF80()
{
  return MEMORY[0x1E0C91478]();
}

uint64_t sub_1DA66BF8C()
{
  return MEMORY[0x1E0C91480]();
}

uint64_t sub_1DA66BF98()
{
  return MEMORY[0x1E0C914B0]();
}

uint64_t sub_1DA66BFA4()
{
  return MEMORY[0x1E0C91620]();
}

uint64_t sub_1DA66BFB0()
{
  return MEMORY[0x1E0C91640]();
}

uint64_t sub_1DA66BFBC()
{
  return MEMORY[0x1E0C91690]();
}

uint64_t sub_1DA66BFC8()
{
  return MEMORY[0x1E0C916C0]();
}

uint64_t sub_1DA66BFD4()
{
  return MEMORY[0x1E0C916C8]();
}

uint64_t sub_1DA66BFE0()
{
  return MEMORY[0x1E0C916D0]();
}

uint64_t sub_1DA66BFEC()
{
  return MEMORY[0x1E0C916E8]();
}

uint64_t sub_1DA66BFF8()
{
  return MEMORY[0x1E0C916F8]();
}

uint64_t sub_1DA66C004()
{
  return MEMORY[0x1E0C91750]();
}

uint64_t sub_1DA66C010()
{
  return MEMORY[0x1E0C91820]();
}

uint64_t sub_1DA66C01C()
{
  return MEMORY[0x1E0C91920]();
}

uint64_t sub_1DA66C028()
{
  return MEMORY[0x1E0C91A38]();
}

uint64_t sub_1DA66C034()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1DA66C040()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1DA66C04C()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1DA66C058()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1DA66C064()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1DA66C070()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1DA66C07C()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1DA66C088()
{
  return MEMORY[0x1E0CAE390]();
}

uint64_t sub_1DA66C094()
{
  return MEMORY[0x1E0CAE410]();
}

uint64_t sub_1DA66C0A0()
{
  return MEMORY[0x1E0CAE418]();
}

uint64_t sub_1DA66C0AC()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1DA66C0B8()
{
  return MEMORY[0x1E0CAE438]();
}

uint64_t sub_1DA66C0C4()
{
  return MEMORY[0x1E0CAE480]();
}

uint64_t sub_1DA66C0D0()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1DA66C0DC()
{
  return MEMORY[0x1E0CAE628]();
}

uint64_t sub_1DA66C0E8()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1DA66C0F4()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1DA66C100()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_1DA66C10C()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1DA66C118()
{
  return MEMORY[0x1E0CAE760]();
}

uint64_t sub_1DA66C124()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1DA66C130()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1DA66C13C()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1DA66C148()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1DA66C154()
{
  return MEMORY[0x1E0CAE9F0]();
}

uint64_t sub_1DA66C160()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1DA66C16C()
{
  return MEMORY[0x1E0CAEE08]();
}

uint64_t sub_1DA66C178()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1DA66C184()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_1DA66C190()
{
  return MEMORY[0x1E0CAF2B8]();
}

uint64_t sub_1DA66C19C()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1DA66C1A8()
{
  return MEMORY[0x1E0CAF350]();
}

uint64_t sub_1DA66C1B4()
{
  return MEMORY[0x1E0CAF3D8]();
}

uint64_t sub_1DA66C1C0()
{
  return MEMORY[0x1E0CAF458]();
}

uint64_t sub_1DA66C1CC()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_1DA66C1D8()
{
  return MEMORY[0x1E0CAF578]();
}

uint64_t sub_1DA66C1E4()
{
  return MEMORY[0x1E0CAF960]();
}

uint64_t sub_1DA66C1F0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DA66C1FC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DA66C208()
{
  return MEMORY[0x1E0CAF9B0]();
}

uint64_t sub_1DA66C214()
{
  return MEMORY[0x1E0CAF9D8]();
}

uint64_t sub_1DA66C220()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_1DA66C22C()
{
  return MEMORY[0x1E0CAFA58]();
}

uint64_t sub_1DA66C238()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_1DA66C244()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1DA66C250()
{
  return MEMORY[0x1E0CAFD30]();
}

uint64_t sub_1DA66C25C()
{
  return MEMORY[0x1E0D7D4D0]();
}

uint64_t sub_1DA66C268()
{
  return MEMORY[0x1E0D7D4D8]();
}

uint64_t sub_1DA66C274()
{
  return MEMORY[0x1E0D7D4E0]();
}

uint64_t sub_1DA66C280()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1DA66C28C()
{
  return MEMORY[0x1E0CAFD98]();
}

uint64_t sub_1DA66C298()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1DA66C2A4()
{
  return MEMORY[0x1E0CAFDC0]();
}

uint64_t sub_1DA66C2B0()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1DA66C2BC()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1DA66C2C8()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DA66C2D4()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1DA66C2E0()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1DA66C2EC()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1DA66C2F8()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1DA66C304()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1DA66C310()
{
  return MEMORY[0x1E0CAFF18]();
}

uint64_t sub_1DA66C31C()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1DA66C328()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1DA66C334()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1DA66C340()
{
  return MEMORY[0x1E0CAFFC0]();
}

uint64_t sub_1DA66C34C()
{
  return MEMORY[0x1E0CAFFE0]();
}

uint64_t sub_1DA66C358()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DA66C364()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1DA66C370()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_1DA66C37C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DA66C388()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1DA66C394()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DA66C3A0()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1DA66C3AC()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1DA66C3B8()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1DA66C3C4()
{
  return MEMORY[0x1E0CB03D0]();
}

uint64_t sub_1DA66C3D0()
{
  return MEMORY[0x1E0D7D4E8]();
}

uint64_t sub_1DA66C3DC()
{
  return MEMORY[0x1E0CB0580]();
}

uint64_t sub_1DA66C3E8()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1DA66C3F4()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1DA66C400()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1DA66C40C()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1DA66C418()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1DA66C424()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1DA66C430()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1DA66C43C()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1DA66C448()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1DA66C454()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1DA66C460()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1DA66C46C()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1DA66C478()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1DA66C484()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1DA66C490()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1DA66C49C()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DA66C4A8()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1DA66C4B4()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1DA66C4C0()
{
  return MEMORY[0x1E0CB0DD8]();
}

uint64_t sub_1DA66C4CC()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1DA66C4D8()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DA66C4E4()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1DA66C4F0()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1DA66C4FC()
{
  return MEMORY[0x1E0CB0F28]();
}

uint64_t sub_1DA66C508()
{
  return MEMORY[0x1E0CB1028]();
}

uint64_t sub_1DA66C514()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1DA66C520()
{
  return MEMORY[0x1E0CB10B8]();
}

uint64_t sub_1DA66C52C()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1DA66C538()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1DA66C544()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1DA66C550()
{
  return MEMORY[0x1E0CB12D8]();
}

uint64_t sub_1DA66C55C()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1DA66C568()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_1DA66C574()
{
  return MEMORY[0x1E0CB1610]();
}

uint64_t sub_1DA66C580()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1DA66C58C()
{
  return MEMORY[0x1E0D47DC0]();
}

uint64_t sub_1DA66C598()
{
  return MEMORY[0x1E0D47DD0]();
}

uint64_t sub_1DA66C5A4()
{
  return MEMORY[0x1E0D47DD8]();
}

uint64_t sub_1DA66C5B0()
{
  return MEMORY[0x1E0D47DE0]();
}

uint64_t sub_1DA66C5BC()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_1DA66C5C8()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_1DA66C5D4()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_1DA66C5E0()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_1DA66C5EC()
{
  return MEMORY[0x1E0DE94C0]();
}

uint64_t sub_1DA66C5F8()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1DA66C604()
{
  return MEMORY[0x1E0DEFDD0]();
}

uint64_t sub_1DA66C610()
{
  return MEMORY[0x1E0DEFDD8]();
}

uint64_t sub_1DA66C61C()
{
  return MEMORY[0x1E0DEFDE8]();
}

uint64_t sub_1DA66C628()
{
  return MEMORY[0x1E0DEFE28]();
}

uint64_t sub_1DA66C634()
{
  return MEMORY[0x1E0DEFE40]();
}

uint64_t sub_1DA66C640()
{
  return MEMORY[0x1E0DEFE60]();
}

uint64_t sub_1DA66C64C()
{
  return MEMORY[0x1E0DEFEA8]();
}

uint64_t sub_1DA66C658()
{
  return MEMORY[0x1E0DEFEE0]();
}

uint64_t sub_1DA66C664()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_1DA66C670()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_1DA66C67C()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_1DA66C688()
{
  return MEMORY[0x1E0CA87B0]();
}

uint64_t sub_1DA66C694()
{
  return MEMORY[0x1E0CF0C58]();
}

uint64_t sub_1DA66C6A0()
{
  return MEMORY[0x1E0CF0C80]();
}

uint64_t sub_1DA66C6AC()
{
  return MEMORY[0x1E0DF1DE0]();
}

uint64_t sub_1DA66C6B8()
{
  return MEMORY[0x1E0DF1E00]();
}

uint64_t sub_1DA66C6C4()
{
  return MEMORY[0x1E0DF1E08]();
}

uint64_t sub_1DA66C6D0()
{
  return MEMORY[0x1E0DF1E18]();
}

uint64_t sub_1DA66C6DC()
{
  return MEMORY[0x1E0DF1E28]();
}

uint64_t sub_1DA66C6E8()
{
  return MEMORY[0x1E0DF1E30]();
}

uint64_t sub_1DA66C6F4()
{
  return MEMORY[0x1E0DEFF18]();
}

uint64_t sub_1DA66C700()
{
  return MEMORY[0x1E0DEFF28]();
}

uint64_t sub_1DA66C70C()
{
  return MEMORY[0x1E0DF1EA0]();
}

uint64_t sub_1DA66C718()
{
  return MEMORY[0x1E0DEFF38]();
}

uint64_t sub_1DA66C724()
{
  return MEMORY[0x1E0DF1F20]();
}

uint64_t sub_1DA66C730()
{
  return MEMORY[0x1E0DF1F28]();
}

uint64_t sub_1DA66C73C()
{
  return MEMORY[0x1E0D7D508]();
}

uint64_t sub_1DA66C748()
{
  return MEMORY[0x1E0D7D510]();
}

uint64_t sub_1DA66C754()
{
  return MEMORY[0x1E0D7D518]();
}

uint64_t sub_1DA66C760()
{
  return MEMORY[0x1E0D7D530]();
}

uint64_t sub_1DA66C76C()
{
  return MEMORY[0x1E0D7D540]();
}

uint64_t sub_1DA66C778()
{
  return MEMORY[0x1E0D7D550]();
}

uint64_t sub_1DA66C784()
{
  return MEMORY[0x1E0D7D588]();
}

uint64_t sub_1DA66C790()
{
  return MEMORY[0x1E0D7D590]();
}

uint64_t sub_1DA66C79C()
{
  return MEMORY[0x1E0D7D598]();
}

uint64_t sub_1DA66C7A8()
{
  return MEMORY[0x1E0D7D5A0]();
}

uint64_t sub_1DA66C7B4()
{
  return MEMORY[0x1E0D7D5A8]();
}

uint64_t sub_1DA66C7C0()
{
  return MEMORY[0x1E0D7D5B8]();
}

uint64_t sub_1DA66C7CC()
{
  return MEMORY[0x1E0D7D5C0]();
}

uint64_t sub_1DA66C7D8()
{
  return MEMORY[0x1E0D7D5C8]();
}

uint64_t sub_1DA66C7E4()
{
  return MEMORY[0x1E0D7D5D8]();
}

uint64_t sub_1DA66C7F0()
{
  return MEMORY[0x1E0D7D5E8]();
}

uint64_t sub_1DA66C7FC()
{
  return MEMORY[0x1E0D7D5F0]();
}

uint64_t sub_1DA66C808()
{
  return MEMORY[0x1E0D7D5F8]();
}

uint64_t sub_1DA66C814()
{
  return MEMORY[0x1E0D7D608]();
}

uint64_t sub_1DA66C820()
{
  return MEMORY[0x1E0D7D618]();
}

uint64_t sub_1DA66C82C()
{
  return MEMORY[0x1E0D7D620]();
}

uint64_t sub_1DA66C838()
{
  return MEMORY[0x1E0D7D630]();
}

uint64_t sub_1DA66C844()
{
  return MEMORY[0x1E0D7D638]();
}

uint64_t sub_1DA66C850()
{
  return MEMORY[0x1E0D7D640]();
}

uint64_t sub_1DA66C85C()
{
  return MEMORY[0x1E0D7D650]();
}

uint64_t sub_1DA66C868()
{
  return MEMORY[0x1E0D7D658]();
}

uint64_t sub_1DA66C874()
{
  return MEMORY[0x1E0D7D668]();
}

uint64_t sub_1DA66C880()
{
  return MEMORY[0x1E0D7D670]();
}

uint64_t sub_1DA66C88C()
{
  return MEMORY[0x1E0D7D680]();
}

uint64_t sub_1DA66C898()
{
  return MEMORY[0x1E0D7D688]();
}

uint64_t sub_1DA66C8A4()
{
  return MEMORY[0x1E0D7D690]();
}

uint64_t sub_1DA66C8B0()
{
  return MEMORY[0x1E0D7D6A0]();
}

uint64_t sub_1DA66C8BC()
{
  return MEMORY[0x1E0D7D6A8]();
}

uint64_t sub_1DA66C8C8()
{
  return MEMORY[0x1E0D7D6B0]();
}

uint64_t sub_1DA66C8D4()
{
  return MEMORY[0x1E0D7D6B8]();
}

uint64_t sub_1DA66C8E0()
{
  return MEMORY[0x1E0D7D6C8]();
}

uint64_t sub_1DA66C8EC()
{
  return MEMORY[0x1E0D7D6D0]();
}

uint64_t sub_1DA66C8F8()
{
  return MEMORY[0x1E0D7D6D8]();
}

uint64_t sub_1DA66C904()
{
  return MEMORY[0x1E0D7D6E0]();
}

uint64_t sub_1DA66C910()
{
  return MEMORY[0x1E0D7D6E8]();
}

uint64_t sub_1DA66C91C()
{
  return MEMORY[0x1E0D7D6F0]();
}

uint64_t sub_1DA66C928()
{
  return MEMORY[0x1E0D7D6F8]();
}

uint64_t sub_1DA66C934()
{
  return MEMORY[0x1E0D7D708]();
}

uint64_t sub_1DA66C940()
{
  return MEMORY[0x1E0D7D710]();
}

uint64_t sub_1DA66C94C()
{
  return MEMORY[0x1E0D7D718]();
}

uint64_t sub_1DA66C958()
{
  return MEMORY[0x1E0D7D720]();
}

uint64_t sub_1DA66C964()
{
  return MEMORY[0x1E0D7D728]();
}

uint64_t sub_1DA66C970()
{
  return MEMORY[0x1E0D7D740]();
}

uint64_t sub_1DA66C97C()
{
  return MEMORY[0x1E0D7D748]();
}

uint64_t sub_1DA66C988()
{
  return MEMORY[0x1E0D7D750]();
}

uint64_t sub_1DA66C994()
{
  return MEMORY[0x1E0D7D758]();
}

uint64_t sub_1DA66C9A0()
{
  return MEMORY[0x1E0D7D768]();
}

uint64_t sub_1DA66C9AC()
{
  return MEMORY[0x1E0D7D770]();
}

uint64_t sub_1DA66C9B8()
{
  return MEMORY[0x1E0D7D7B8]();
}

uint64_t sub_1DA66C9C4()
{
  return MEMORY[0x1E0D7D7C0]();
}

uint64_t sub_1DA66C9D0()
{
  return MEMORY[0x1E0D7D7C8]();
}

uint64_t sub_1DA66C9DC()
{
  return MEMORY[0x1E0D7D7D0]();
}

uint64_t sub_1DA66C9E8()
{
  return MEMORY[0x1E0D7D7D8]();
}

uint64_t sub_1DA66C9F4()
{
  return MEMORY[0x1E0D7D7E0]();
}

uint64_t sub_1DA66CA00()
{
  return MEMORY[0x1E0D7D7E8]();
}

uint64_t sub_1DA66CA0C()
{
  return MEMORY[0x1E0D7D7F0]();
}

uint64_t sub_1DA66CA18()
{
  return MEMORY[0x1E0D7D800]();
}

uint64_t sub_1DA66CA24()
{
  return MEMORY[0x1E0D7D810]();
}

uint64_t sub_1DA66CA30()
{
  return MEMORY[0x1E0D7D828]();
}

uint64_t sub_1DA66CA3C()
{
  return MEMORY[0x1E0D7D848]();
}

uint64_t sub_1DA66CA48()
{
  return MEMORY[0x1E0D7D868]();
}

uint64_t sub_1DA66CA54()
{
  return MEMORY[0x1E0D7D878]();
}

uint64_t sub_1DA66CA60()
{
  return MEMORY[0x1E0D7D8C8]();
}

uint64_t sub_1DA66CA6C()
{
  return MEMORY[0x1E0D7D900]();
}

uint64_t sub_1DA66CA78()
{
  return MEMORY[0x1E0D7D910]();
}

uint64_t sub_1DA66CA84()
{
  return MEMORY[0x1E0D7D930]();
}

uint64_t sub_1DA66CA90()
{
  return MEMORY[0x1E0D7D938]();
}

uint64_t sub_1DA66CA9C()
{
  return MEMORY[0x1E0D7D940]();
}

uint64_t sub_1DA66CAA8()
{
  return MEMORY[0x1E0D7D950]();
}

uint64_t sub_1DA66CAB4()
{
  return MEMORY[0x1E0D7D958]();
}

uint64_t sub_1DA66CAC0()
{
  return MEMORY[0x1E0D7D960]();
}

uint64_t sub_1DA66CACC()
{
  return MEMORY[0x1E0D7D968]();
}

uint64_t sub_1DA66CAD8()
{
  return MEMORY[0x1E0D7D970]();
}

uint64_t sub_1DA66CAE4()
{
  return MEMORY[0x1E0D7D978]();
}

uint64_t sub_1DA66CAF0()
{
  return MEMORY[0x1E0D7D980]();
}

uint64_t sub_1DA66CAFC()
{
  return MEMORY[0x1E0D7D988]();
}

uint64_t sub_1DA66CB08()
{
  return MEMORY[0x1E0D7D990]();
}

uint64_t sub_1DA66CB14()
{
  return MEMORY[0x1E0D7D998]();
}

uint64_t sub_1DA66CB20()
{
  return MEMORY[0x1E0D7D9A0]();
}

uint64_t sub_1DA66CB2C()
{
  return MEMORY[0x1E0D7D9A8]();
}

uint64_t sub_1DA66CB38()
{
  return MEMORY[0x1E0D7D9B0]();
}

uint64_t sub_1DA66CB44()
{
  return MEMORY[0x1E0D7D9B8]();
}

uint64_t sub_1DA66CB50()
{
  return MEMORY[0x1E0D7D9C0]();
}

uint64_t sub_1DA66CB5C()
{
  return MEMORY[0x1E0D7D9C8]();
}

uint64_t sub_1DA66CB68()
{
  return MEMORY[0x1E0D7D9D0]();
}

uint64_t sub_1DA66CB74()
{
  return MEMORY[0x1E0D7D9D8]();
}

uint64_t sub_1DA66CB80()
{
  return MEMORY[0x1E0D7D9E0]();
}

uint64_t sub_1DA66CB8C()
{
  return MEMORY[0x1E0D7D9E8]();
}

uint64_t sub_1DA66CB98()
{
  return MEMORY[0x1E0D7D9F0]();
}

uint64_t sub_1DA66CBA4()
{
  return MEMORY[0x1E0D7D9F8]();
}

uint64_t sub_1DA66CBB0()
{
  return MEMORY[0x1E0D7DA08]();
}

uint64_t sub_1DA66CBBC()
{
  return MEMORY[0x1E0D7DA10]();
}

uint64_t sub_1DA66CBC8()
{
  return MEMORY[0x1E0D7DA18]();
}

uint64_t sub_1DA66CBD4()
{
  return MEMORY[0x1E0D7DA20]();
}

uint64_t sub_1DA66CBE0()
{
  return MEMORY[0x1E0D7DA28]();
}

uint64_t sub_1DA66CBEC()
{
  return MEMORY[0x1E0D7DA50]();
}

uint64_t sub_1DA66CBF8()
{
  return MEMORY[0x1E0D7DA58]();
}

uint64_t sub_1DA66CC04()
{
  return MEMORY[0x1E0D7DA60]();
}

uint64_t sub_1DA66CC10()
{
  return MEMORY[0x1E0D7DA70]();
}

uint64_t sub_1DA66CC1C()
{
  return MEMORY[0x1E0D7DA80]();
}

uint64_t sub_1DA66CC28()
{
  return MEMORY[0x1E0D7DA88]();
}

uint64_t sub_1DA66CC34()
{
  return MEMORY[0x1E0D7DA90]();
}

uint64_t sub_1DA66CC40()
{
  return MEMORY[0x1E0D7DA98]();
}

uint64_t sub_1DA66CC4C()
{
  return MEMORY[0x1E0D7DAC0]();
}

uint64_t sub_1DA66CC58()
{
  return MEMORY[0x1E0D7DAD0]();
}

uint64_t sub_1DA66CC64()
{
  return MEMORY[0x1E0D7DAF0]();
}

uint64_t sub_1DA66CC70()
{
  return MEMORY[0x1E0D7DAF8]();
}

uint64_t sub_1DA66CC7C()
{
  return MEMORY[0x1E0D7DB10]();
}

uint64_t sub_1DA66CC88()
{
  return MEMORY[0x1E0D7DB18]();
}

uint64_t sub_1DA66CC94()
{
  return MEMORY[0x1E0D7DB20]();
}

uint64_t sub_1DA66CCA0()
{
  return MEMORY[0x1E0D7DB30]();
}

uint64_t sub_1DA66CCAC()
{
  return MEMORY[0x1E0D7DB50]();
}

uint64_t sub_1DA66CCB8()
{
  return MEMORY[0x1E0D7DB58]();
}

uint64_t sub_1DA66CCC4()
{
  return MEMORY[0x1E0D7DB60]();
}

uint64_t sub_1DA66CCD0()
{
  return MEMORY[0x1E0D7DB68]();
}

uint64_t sub_1DA66CCDC()
{
  return MEMORY[0x1E0D7DB70]();
}

uint64_t sub_1DA66CCE8()
{
  return MEMORY[0x1E0D7DB78]();
}

uint64_t sub_1DA66CCF4()
{
  return MEMORY[0x1E0D7DB80]();
}

uint64_t sub_1DA66CD00()
{
  return MEMORY[0x1E0D7DB88]();
}

uint64_t sub_1DA66CD0C()
{
  return MEMORY[0x1E0D7DB90]();
}

uint64_t sub_1DA66CD18()
{
  return MEMORY[0x1E0D7DB98]();
}

uint64_t sub_1DA66CD24()
{
  return MEMORY[0x1E0D7DBA0]();
}

uint64_t sub_1DA66CD30()
{
  return MEMORY[0x1E0D7DBB0]();
}

uint64_t sub_1DA66CD3C()
{
  return MEMORY[0x1E0D7DBB8]();
}

uint64_t sub_1DA66CD48()
{
  return MEMORY[0x1E0D7DBC0]();
}

uint64_t sub_1DA66CD54()
{
  return MEMORY[0x1E0D7DBC8]();
}

uint64_t sub_1DA66CD60()
{
  return MEMORY[0x1E0D7DBD0]();
}

uint64_t sub_1DA66CD6C()
{
  return MEMORY[0x1E0D7DBD8]();
}

uint64_t sub_1DA66CD78()
{
  return MEMORY[0x1E0D7DBE8]();
}

uint64_t sub_1DA66CD84()
{
  return MEMORY[0x1E0D7DC00]();
}

uint64_t sub_1DA66CD90()
{
  return MEMORY[0x1E0D7DC08]();
}

uint64_t sub_1DA66CD9C()
{
  return MEMORY[0x1E0D7DC10]();
}

uint64_t sub_1DA66CDA8()
{
  return MEMORY[0x1E0D7DC30]();
}

uint64_t _s10PodcastsUI22PreparedArtworkRequestV10fileFormat0A10Foundation04FileG0Ovg_0()
{
  return MEMORY[0x1E0D7DC40]();
}

uint64_t sub_1DA66CDC0()
{
  return MEMORY[0x1E0D7DC48]();
}

uint64_t sub_1DA66CDCC()
{
  return MEMORY[0x1E0D7DC50]();
}

uint64_t sub_1DA66CDD8()
{
  return MEMORY[0x1E0D7DC58]();
}

uint64_t sub_1DA66CDE4()
{
  return MEMORY[0x1E0D7DC60]();
}

uint64_t sub_1DA66CDF0()
{
  return MEMORY[0x1E0D7DC68]();
}

uint64_t sub_1DA66CDFC()
{
  return MEMORY[0x1E0D7DC70]();
}

uint64_t sub_1DA66CE08()
{
  return MEMORY[0x1E0D7DC78]();
}

uint64_t sub_1DA66CE14()
{
  return MEMORY[0x1E0D7DC80]();
}

uint64_t sub_1DA66CE20()
{
  return MEMORY[0x1E0D7DC88]();
}

uint64_t sub_1DA66CE2C()
{
  return MEMORY[0x1E0D7DC90]();
}

uint64_t sub_1DA66CE38()
{
  return MEMORY[0x1E0D7DC98]();
}

uint64_t _s10PodcastsUI22PreparedArtworkRequestV3keySo8NSStringCvg_0()
{
  return MEMORY[0x1E0D7DCA0]();
}

uint64_t _s10PodcastsUI22PreparedArtworkRequestV4with6formatAC0A10Foundation0D6FormatO_tF_0()
{
  return MEMORY[0x1E0D7DCA8]();
}

uint64_t sub_1DA66CE5C()
{
  return MEMORY[0x1E0D7DCB0]();
}

uint64_t sub_1DA66CE68()
{
  return MEMORY[0x1E0D7DCB8]();
}

uint64_t sub_1DA66CE74()
{
  return MEMORY[0x1E0D7DCC0]();
}

uint64_t sub_1DA66CE80()
{
  return MEMORY[0x1E0D7DCC8]();
}

uint64_t sub_1DA66CE8C()
{
  return MEMORY[0x1E0D7DCD8]();
}

uint64_t sub_1DA66CE98()
{
  return MEMORY[0x1E0D7DCE0]();
}

uint64_t _s10PodcastsUI22PreparedArtworkRequestV8fileNameSSvg_0()
{
  return MEMORY[0x1E0D7DCE8]();
}

uint64_t sub_1DA66CEB0()
{
  return MEMORY[0x1E0D7DCF0]();
}

uint64_t sub_1DA66CEBC()
{
  return MEMORY[0x1E0D7DD28]();
}

uint64_t sub_1DA66CEC8()
{
  return MEMORY[0x1E0D7DD60]();
}

uint64_t sub_1DA66CED4()
{
  return MEMORY[0x1E0D7DD68]();
}

uint64_t sub_1DA66CEE0()
{
  return MEMORY[0x1E0D7DD70]();
}

uint64_t sub_1DA66CEEC()
{
  return MEMORY[0x1E0D7DD78]();
}

uint64_t sub_1DA66CEF8()
{
  return MEMORY[0x1E0D7DD80]();
}

uint64_t sub_1DA66CF04()
{
  return MEMORY[0x1E0D7DD88]();
}

uint64_t sub_1DA66CF10()
{
  return MEMORY[0x1E0D7DD90]();
}

uint64_t sub_1DA66CF1C()
{
  return MEMORY[0x1E0D7DDA8]();
}

uint64_t sub_1DA66CF28()
{
  return MEMORY[0x1E0D7DDB0]();
}

uint64_t sub_1DA66CF34()
{
  return MEMORY[0x1E0D7DDC0]();
}

uint64_t sub_1DA66CF40()
{
  return MEMORY[0x1E0D7DDC8]();
}

uint64_t sub_1DA66CF4C()
{
  return MEMORY[0x1E0D7DDD0]();
}

uint64_t sub_1DA66CF58()
{
  return MEMORY[0x1E0D7DE08]();
}

uint64_t sub_1DA66CF64()
{
  return MEMORY[0x1E0D7DE30]();
}

uint64_t sub_1DA66CF70()
{
  return MEMORY[0x1E0D7DE40]();
}

uint64_t sub_1DA66CF7C()
{
  return MEMORY[0x1E0D7DE48]();
}

uint64_t sub_1DA66CF88()
{
  return MEMORY[0x1E0D7DE50]();
}

uint64_t sub_1DA66CF94()
{
  return MEMORY[0x1E0D7DE58]();
}

uint64_t sub_1DA66CFA0()
{
  return MEMORY[0x1E0D7DE60]();
}

uint64_t sub_1DA66CFAC()
{
  return MEMORY[0x1E0D7DE68]();
}

uint64_t sub_1DA66CFB8()
{
  return MEMORY[0x1E0D7DE88]();
}

uint64_t sub_1DA66CFC4()
{
  return MEMORY[0x1E0D7DEA8]();
}

uint64_t sub_1DA66CFD0()
{
  return MEMORY[0x1E0D7DEB0]();
}

uint64_t sub_1DA66CFDC()
{
  return MEMORY[0x1E0D7DEC0]();
}

uint64_t sub_1DA66CFE8()
{
  return MEMORY[0x1E0D7DEC8]();
}

uint64_t sub_1DA66CFF4()
{
  return MEMORY[0x1E0D7DEF8]();
}

uint64_t sub_1DA66D000()
{
  return MEMORY[0x1E0D7DF00]();
}

uint64_t sub_1DA66D00C()
{
  return MEMORY[0x1E0D7DF38]();
}

uint64_t sub_1DA66D018()
{
  return MEMORY[0x1E0D7DF68]();
}

uint64_t sub_1DA66D024()
{
  return MEMORY[0x1E0D7DF78]();
}

uint64_t sub_1DA66D030()
{
  return MEMORY[0x1E0D7DFB0]();
}

uint64_t sub_1DA66D03C()
{
  return MEMORY[0x1E0D7DFC8]();
}

uint64_t sub_1DA66D048()
{
  return MEMORY[0x1E0D7DFD0]();
}

uint64_t sub_1DA66D054()
{
  return MEMORY[0x1E0D7DFD8]();
}

uint64_t sub_1DA66D060()
{
  return MEMORY[0x1E0D7DFE0]();
}

uint64_t sub_1DA66D06C()
{
  return MEMORY[0x1E0D7DFE8]();
}

uint64_t sub_1DA66D078()
{
  return MEMORY[0x1E0D7DFF0]();
}

uint64_t sub_1DA66D084()
{
  return MEMORY[0x1E0D7DFF8]();
}

uint64_t sub_1DA66D090()
{
  return MEMORY[0x1E0D7E000]();
}

uint64_t sub_1DA66D09C()
{
  return MEMORY[0x1E0D7E008]();
}

uint64_t sub_1DA66D0A8()
{
  return MEMORY[0x1E0D7E010]();
}

uint64_t sub_1DA66D0B4()
{
  return MEMORY[0x1E0D7E048]();
}

uint64_t sub_1DA66D0C0()
{
  return MEMORY[0x1E0D7E050]();
}

uint64_t sub_1DA66D0CC()
{
  return MEMORY[0x1E0D7E058]();
}

uint64_t sub_1DA66D0D8()
{
  return MEMORY[0x1E0D7E060]();
}

uint64_t sub_1DA66D0E4()
{
  return MEMORY[0x1E0D7E068]();
}

uint64_t sub_1DA66D0F0()
{
  return MEMORY[0x1E0D7E070]();
}

uint64_t sub_1DA66D0FC()
{
  return MEMORY[0x1E0D7E088]();
}

uint64_t sub_1DA66D108()
{
  return MEMORY[0x1E0D7E090]();
}

uint64_t sub_1DA66D114()
{
  return MEMORY[0x1E0D7E098]();
}

uint64_t sub_1DA66D120()
{
  return MEMORY[0x1E0D7E0A0]();
}

uint64_t sub_1DA66D12C()
{
  return MEMORY[0x1E0D7E0A8]();
}

uint64_t sub_1DA66D138()
{
  return MEMORY[0x1E0D7E0B0]();
}

uint64_t sub_1DA66D144()
{
  return MEMORY[0x1E0D7E0B8]();
}

uint64_t sub_1DA66D150()
{
  return MEMORY[0x1E0D7E0C8]();
}

uint64_t sub_1DA66D15C()
{
  return MEMORY[0x1E0D7E0E8]();
}

uint64_t sub_1DA66D168()
{
  return MEMORY[0x1E0D7E108]();
}

uint64_t sub_1DA66D174()
{
  return MEMORY[0x1E0D7E110]();
}

uint64_t sub_1DA66D180()
{
  return MEMORY[0x1E0D7E118]();
}

uint64_t sub_1DA66D18C()
{
  return MEMORY[0x1E0D7E120]();
}

uint64_t sub_1DA66D198()
{
  return MEMORY[0x1E0D7E128]();
}

uint64_t sub_1DA66D1A4()
{
  return MEMORY[0x1E0D7E130]();
}

uint64_t sub_1DA66D1B0()
{
  return MEMORY[0x1E0D7E158]();
}

uint64_t sub_1DA66D1BC()
{
  return MEMORY[0x1E0D7E168]();
}

uint64_t sub_1DA66D1C8()
{
  return MEMORY[0x1E0D7E178]();
}

uint64_t sub_1DA66D1D4()
{
  return MEMORY[0x1E0D7E180]();
}

uint64_t sub_1DA66D1E0()
{
  return MEMORY[0x1E0D7E1B0]();
}

uint64_t sub_1DA66D1EC()
{
  return MEMORY[0x1E0D7E1B8]();
}

uint64_t sub_1DA66D1F8()
{
  return MEMORY[0x1E0D7E1D8]();
}

uint64_t sub_1DA66D204()
{
  return MEMORY[0x1E0D7E1E0]();
}

uint64_t sub_1DA66D210()
{
  return MEMORY[0x1E0D7E1E8]();
}

uint64_t sub_1DA66D21C()
{
  return MEMORY[0x1E0D7E208]();
}

uint64_t sub_1DA66D228()
{
  return MEMORY[0x1E0D7E210]();
}

uint64_t sub_1DA66D234()
{
  return MEMORY[0x1E0D7E218]();
}

uint64_t sub_1DA66D240()
{
  return MEMORY[0x1E0D7E220]();
}

uint64_t sub_1DA66D24C()
{
  return MEMORY[0x1E0D7E230]();
}

uint64_t sub_1DA66D258()
{
  return MEMORY[0x1E0D7E238]();
}

uint64_t sub_1DA66D264()
{
  return MEMORY[0x1E0D7E240]();
}

uint64_t sub_1DA66D270()
{
  return MEMORY[0x1E0D7E250]();
}

uint64_t sub_1DA66D27C()
{
  return MEMORY[0x1E0D7E258]();
}

uint64_t sub_1DA66D288()
{
  return MEMORY[0x1E0D7E260]();
}

uint64_t sub_1DA66D294()
{
  return MEMORY[0x1E0D7E270]();
}

uint64_t sub_1DA66D2A0()
{
  return MEMORY[0x1E0D7E278]();
}

uint64_t sub_1DA66D2AC()
{
  return MEMORY[0x1E0D7E288]();
}

uint64_t sub_1DA66D2B8()
{
  return MEMORY[0x1E0D7E290]();
}

uint64_t sub_1DA66D2C4()
{
  return MEMORY[0x1E0D7E298]();
}

uint64_t sub_1DA66D2D0()
{
  return MEMORY[0x1E0D7E2A0]();
}

uint64_t sub_1DA66D2DC()
{
  return MEMORY[0x1E0D7E2A8]();
}

uint64_t sub_1DA66D2E8()
{
  return MEMORY[0x1E0D7E2B0]();
}

uint64_t sub_1DA66D2F4()
{
  return MEMORY[0x1E0D7E2B8]();
}

uint64_t sub_1DA66D300()
{
  return MEMORY[0x1E0D7E2C0]();
}

uint64_t sub_1DA66D30C()
{
  return MEMORY[0x1E0D7E2C8]();
}

uint64_t sub_1DA66D318()
{
  return MEMORY[0x1E0D7E2D8]();
}

uint64_t sub_1DA66D324()
{
  return MEMORY[0x1E0D7E2F8]();
}

uint64_t sub_1DA66D330()
{
  return MEMORY[0x1E0D7E300]();
}

uint64_t sub_1DA66D33C()
{
  return MEMORY[0x1E0D7E310]();
}

uint64_t sub_1DA66D348()
{
  return MEMORY[0x1E0D7E318]();
}

uint64_t sub_1DA66D354()
{
  return MEMORY[0x1E0D7E320]();
}

uint64_t sub_1DA66D360()
{
  return MEMORY[0x1E0D7E328]();
}

uint64_t sub_1DA66D36C()
{
  return MEMORY[0x1E0D7E330]();
}

uint64_t sub_1DA66D378()
{
  return MEMORY[0x1E0D7E338]();
}

uint64_t sub_1DA66D384()
{
  return MEMORY[0x1E0D7E348]();
}

uint64_t sub_1DA66D390()
{
  return MEMORY[0x1E0D7E350]();
}

uint64_t sub_1DA66D39C()
{
  return MEMORY[0x1E0D7E358]();
}

uint64_t sub_1DA66D3A8()
{
  return MEMORY[0x1E0D7E390]();
}

uint64_t sub_1DA66D3B4()
{
  return MEMORY[0x1E0D7E3A0]();
}

uint64_t sub_1DA66D3C0()
{
  return MEMORY[0x1E0D7E3B8]();
}

uint64_t sub_1DA66D3CC()
{
  return MEMORY[0x1E0D7E3C0]();
}

uint64_t sub_1DA66D3D8()
{
  return MEMORY[0x1E0D7E3D8]();
}

uint64_t sub_1DA66D3E4()
{
  return MEMORY[0x1E0D7E3E0]();
}

uint64_t sub_1DA66D3F0()
{
  return MEMORY[0x1E0D7E3E8]();
}

uint64_t sub_1DA66D3FC()
{
  return MEMORY[0x1E0D7E3F8]();
}

uint64_t sub_1DA66D408()
{
  return MEMORY[0x1E0D7E400]();
}

uint64_t sub_1DA66D414()
{
  return MEMORY[0x1E0D7E410]();
}

uint64_t sub_1DA66D420()
{
  return MEMORY[0x1E0D7E418]();
}

uint64_t sub_1DA66D42C()
{
  return MEMORY[0x1E0D7E420]();
}

uint64_t sub_1DA66D438()
{
  return MEMORY[0x1E0D7E428]();
}

uint64_t sub_1DA66D444()
{
  return MEMORY[0x1E0D7E458]();
}

uint64_t sub_1DA66D450()
{
  return MEMORY[0x1E0D7E460]();
}

uint64_t sub_1DA66D45C()
{
  return MEMORY[0x1E0D7E468]();
}

uint64_t sub_1DA66D468()
{
  return MEMORY[0x1E0D7E470]();
}

uint64_t sub_1DA66D474()
{
  return MEMORY[0x1E0D7E480]();
}

uint64_t sub_1DA66D480()
{
  return MEMORY[0x1E0D7E488]();
}

uint64_t sub_1DA66D48C()
{
  return MEMORY[0x1E0D7E490]();
}

uint64_t sub_1DA66D498()
{
  return MEMORY[0x1E0D7E498]();
}

uint64_t sub_1DA66D4A4()
{
  return MEMORY[0x1E0D7E4B8]();
}

uint64_t sub_1DA66D4B0()
{
  return MEMORY[0x1E0D7E4C0]();
}

uint64_t sub_1DA66D4BC()
{
  return MEMORY[0x1E0D7E4C8]();
}

uint64_t sub_1DA66D4C8()
{
  return MEMORY[0x1E0D7E4D0]();
}

uint64_t sub_1DA66D4D4()
{
  return MEMORY[0x1E0D7E4D8]();
}

uint64_t sub_1DA66D4E0()
{
  return MEMORY[0x1E0D7E4E0]();
}

uint64_t sub_1DA66D4EC()
{
  return MEMORY[0x1E0D7E4E8]();
}

uint64_t sub_1DA66D4F8()
{
  return MEMORY[0x1E0D7E4F0]();
}

uint64_t sub_1DA66D504()
{
  return MEMORY[0x1E0D7E4F8]();
}

uint64_t sub_1DA66D510()
{
  return MEMORY[0x1E0D7E500]();
}

uint64_t sub_1DA66D51C()
{
  return MEMORY[0x1E0D7E518]();
}

uint64_t sub_1DA66D528()
{
  return MEMORY[0x1E0D7E528]();
}

uint64_t sub_1DA66D534()
{
  return MEMORY[0x1E0D7E530]();
}

uint64_t sub_1DA66D540()
{
  return MEMORY[0x1E0D7E538]();
}

uint64_t sub_1DA66D54C()
{
  return MEMORY[0x1E0D7E540]();
}

uint64_t sub_1DA66D558()
{
  return MEMORY[0x1E0D7E550]();
}

uint64_t sub_1DA66D564()
{
  return MEMORY[0x1E0D7E558]();
}

uint64_t sub_1DA66D570()
{
  return MEMORY[0x1E0D7E570]();
}

uint64_t sub_1DA66D57C()
{
  return MEMORY[0x1E0D7E578]();
}

uint64_t sub_1DA66D588()
{
  return MEMORY[0x1E0D7E580]();
}

uint64_t sub_1DA66D594()
{
  return MEMORY[0x1E0D7E588]();
}

uint64_t sub_1DA66D5A0()
{
  return MEMORY[0x1E0D7E590]();
}

uint64_t sub_1DA66D5AC()
{
  return MEMORY[0x1E0D7E5A0]();
}

uint64_t sub_1DA66D5B8()
{
  return MEMORY[0x1E0D7E5C8]();
}

uint64_t sub_1DA66D5C4()
{
  return MEMORY[0x1E0D7E5D0]();
}

uint64_t sub_1DA66D5D0()
{
  return MEMORY[0x1E0D7E5F8]();
}

uint64_t sub_1DA66D5DC()
{
  return MEMORY[0x1E0D7E600]();
}

uint64_t sub_1DA66D5E8()
{
  return MEMORY[0x1E0D7E608]();
}

uint64_t sub_1DA66D5F4()
{
  return MEMORY[0x1E0D7E610]();
}

uint64_t sub_1DA66D600()
{
  return MEMORY[0x1E0D7E620]();
}

uint64_t sub_1DA66D60C()
{
  return MEMORY[0x1E0D7E638]();
}

uint64_t sub_1DA66D618()
{
  return MEMORY[0x1E0D7E640]();
}

uint64_t sub_1DA66D624()
{
  return MEMORY[0x1E0D7E648]();
}

uint64_t sub_1DA66D630()
{
  return MEMORY[0x1E0D7E650]();
}

uint64_t sub_1DA66D63C()
{
  return MEMORY[0x1E0D7E658]();
}

uint64_t sub_1DA66D648()
{
  return MEMORY[0x1E0D7E678]();
}

uint64_t sub_1DA66D654()
{
  return MEMORY[0x1E0D7E680]();
}

uint64_t sub_1DA66D660()
{
  return MEMORY[0x1E0D7E688]();
}

uint64_t sub_1DA66D66C()
{
  return MEMORY[0x1E0D7E6A0]();
}

uint64_t sub_1DA66D678()
{
  return MEMORY[0x1E0D7E6A8]();
}

uint64_t sub_1DA66D684()
{
  return MEMORY[0x1E0D7E6B0]();
}

uint64_t sub_1DA66D690()
{
  return MEMORY[0x1E0D7E6B8]();
}

uint64_t sub_1DA66D69C()
{
  return MEMORY[0x1E0D7E6C8]();
}

uint64_t sub_1DA66D6A8()
{
  return MEMORY[0x1E0D7E6D0]();
}

uint64_t sub_1DA66D6B4()
{
  return MEMORY[0x1E0D7E6D8]();
}

uint64_t sub_1DA66D6C0()
{
  return MEMORY[0x1E0D7E6E0]();
}

uint64_t sub_1DA66D6CC()
{
  return MEMORY[0x1E0D7E6E8]();
}

uint64_t sub_1DA66D6D8()
{
  return MEMORY[0x1E0D7E700]();
}

uint64_t sub_1DA66D6E4()
{
  return MEMORY[0x1E0D7E708]();
}

uint64_t sub_1DA66D6F0()
{
  return MEMORY[0x1E0D7E718]();
}

uint64_t sub_1DA66D6FC()
{
  return MEMORY[0x1E0D7E720]();
}

uint64_t sub_1DA66D708()
{
  return MEMORY[0x1E0D7E728]();
}

uint64_t sub_1DA66D714()
{
  return MEMORY[0x1E0D7E730]();
}

uint64_t sub_1DA66D720()
{
  return MEMORY[0x1E0D7E740]();
}

uint64_t sub_1DA66D72C()
{
  return MEMORY[0x1E0D7E758]();
}

uint64_t sub_1DA66D738()
{
  return MEMORY[0x1E0D7E760]();
}

uint64_t sub_1DA66D744()
{
  return MEMORY[0x1E0D7E768]();
}

uint64_t sub_1DA66D750()
{
  return MEMORY[0x1E0D7E770]();
}

uint64_t sub_1DA66D75C()
{
  return MEMORY[0x1E0D7E788]();
}

uint64_t sub_1DA66D768()
{
  return MEMORY[0x1E0D7E790]();
}

uint64_t sub_1DA66D774()
{
  return MEMORY[0x1E0D7E798]();
}

uint64_t sub_1DA66D780()
{
  return MEMORY[0x1E0D7E7D0]();
}

uint64_t sub_1DA66D78C()
{
  return MEMORY[0x1E0D7E7D8]();
}

uint64_t sub_1DA66D798()
{
  return MEMORY[0x1E0D7E7E0]();
}

uint64_t sub_1DA66D7A4()
{
  return MEMORY[0x1E0D7E7E8]();
}

uint64_t sub_1DA66D7B0()
{
  return MEMORY[0x1E0D7E7F8]();
}

uint64_t sub_1DA66D7BC()
{
  return MEMORY[0x1E0D7E808]();
}

uint64_t sub_1DA66D7C8()
{
  return MEMORY[0x1E0D7E818]();
}

uint64_t sub_1DA66D7D4()
{
  return MEMORY[0x1E0D7E820]();
}

uint64_t sub_1DA66D7E0()
{
  return MEMORY[0x1E0D7E830]();
}

uint64_t sub_1DA66D7EC()
{
  return MEMORY[0x1E0D7E838]();
}

uint64_t sub_1DA66D7F8()
{
  return MEMORY[0x1E0D7E840]();
}

uint64_t sub_1DA66D804()
{
  return MEMORY[0x1E0D7E860]();
}

uint64_t sub_1DA66D810()
{
  return MEMORY[0x1E0D7E868]();
}

uint64_t sub_1DA66D81C()
{
  return MEMORY[0x1E0D7E870]();
}

uint64_t sub_1DA66D828()
{
  return MEMORY[0x1E0D7E880]();
}

uint64_t sub_1DA66D834()
{
  return MEMORY[0x1E0D7E888]();
}

uint64_t sub_1DA66D840()
{
  return MEMORY[0x1E0D7E890]();
}

uint64_t sub_1DA66D84C()
{
  return MEMORY[0x1E0D7E898]();
}

uint64_t sub_1DA66D858()
{
  return MEMORY[0x1E0D7E8A0]();
}

uint64_t sub_1DA66D864()
{
  return MEMORY[0x1E0D7E8A8]();
}

uint64_t sub_1DA66D870()
{
  return MEMORY[0x1E0D7E8B0]();
}

uint64_t sub_1DA66D87C()
{
  return MEMORY[0x1E0D7E8B8]();
}

uint64_t sub_1DA66D888()
{
  return MEMORY[0x1E0D7E8C0]();
}

uint64_t sub_1DA66D894()
{
  return MEMORY[0x1E0D7E8C8]();
}

uint64_t sub_1DA66D8A0()
{
  return MEMORY[0x1E0D7E8D0]();
}

uint64_t sub_1DA66D8AC()
{
  return MEMORY[0x1E0D7E8D8]();
}

uint64_t sub_1DA66D8B8()
{
  return MEMORY[0x1E0D7E8E8]();
}

uint64_t sub_1DA66D8C4()
{
  return MEMORY[0x1E0D7E908]();
}

uint64_t sub_1DA66D8D0()
{
  return MEMORY[0x1E0D7E910]();
}

uint64_t sub_1DA66D8DC()
{
  return MEMORY[0x1E0D7E918]();
}

uint64_t sub_1DA66D8E8()
{
  return MEMORY[0x1E0D7E920]();
}

uint64_t sub_1DA66D8F4()
{
  return MEMORY[0x1E0D7E930]();
}

uint64_t sub_1DA66D900()
{
  return MEMORY[0x1E0D7E940]();
}

uint64_t sub_1DA66D90C()
{
  return MEMORY[0x1E0D7E950]();
}

uint64_t sub_1DA66D918()
{
  return MEMORY[0x1E0D7E958]();
}

uint64_t sub_1DA66D924()
{
  return MEMORY[0x1E0D7E960]();
}

uint64_t sub_1DA66D930()
{
  return MEMORY[0x1E0D7E968]();
}

uint64_t sub_1DA66D93C()
{
  return MEMORY[0x1E0D7E970]();
}

uint64_t sub_1DA66D948()
{
  return MEMORY[0x1E0D7E978]();
}

uint64_t sub_1DA66D954()
{
  return MEMORY[0x1E0D7E988]();
}

uint64_t sub_1DA66D960()
{
  return MEMORY[0x1E0D7E998]();
}

uint64_t sub_1DA66D96C()
{
  return MEMORY[0x1E0D7E9A0]();
}

uint64_t sub_1DA66D978()
{
  return MEMORY[0x1E0D7E9A8]();
}

uint64_t sub_1DA66D984()
{
  return MEMORY[0x1E0D7E9D8]();
}

uint64_t sub_1DA66D990()
{
  return MEMORY[0x1E0D7E9E8]();
}

uint64_t sub_1DA66D99C()
{
  return MEMORY[0x1E0D7E9F0]();
}

uint64_t sub_1DA66D9A8()
{
  return MEMORY[0x1E0D7EA08]();
}

uint64_t sub_1DA66D9B4()
{
  return MEMORY[0x1E0D7EA18]();
}

uint64_t sub_1DA66D9C0()
{
  return MEMORY[0x1E0D7EA20]();
}

uint64_t sub_1DA66D9CC()
{
  return MEMORY[0x1E0D7EA28]();
}

uint64_t sub_1DA66D9D8()
{
  return MEMORY[0x1E0D7EA30]();
}

uint64_t sub_1DA66D9E4()
{
  return MEMORY[0x1E0D7EA38]();
}

uint64_t sub_1DA66D9F0()
{
  return MEMORY[0x1E0D7EA40]();
}

uint64_t sub_1DA66D9FC()
{
  return MEMORY[0x1E0D7EA48]();
}

uint64_t sub_1DA66DA08()
{
  return MEMORY[0x1E0D7EA50]();
}

uint64_t sub_1DA66DA14()
{
  return MEMORY[0x1E0D7EA58]();
}

uint64_t sub_1DA66DA20()
{
  return MEMORY[0x1E0D7EA60]();
}

uint64_t sub_1DA66DA2C()
{
  return MEMORY[0x1E0D7EA70]();
}

uint64_t sub_1DA66DA38()
{
  return MEMORY[0x1E0D7EA80]();
}

uint64_t sub_1DA66DA44()
{
  return MEMORY[0x1E0D7EA90]();
}

uint64_t sub_1DA66DA50()
{
  return MEMORY[0x1E0D7EAA0]();
}

uint64_t sub_1DA66DA5C()
{
  return MEMORY[0x1E0D7EAA8]();
}

uint64_t sub_1DA66DA68()
{
  return MEMORY[0x1E0D7EAB0]();
}

uint64_t sub_1DA66DA74()
{
  return MEMORY[0x1E0D7EAC8]();
}

uint64_t sub_1DA66DA80()
{
  return MEMORY[0x1E0D7EAD0]();
}

uint64_t sub_1DA66DA8C()
{
  return MEMORY[0x1E0D7EAD8]();
}

uint64_t sub_1DA66DA98()
{
  return MEMORY[0x1E0D7EAE0]();
}

uint64_t sub_1DA66DAA4()
{
  return MEMORY[0x1E0D7EAE8]();
}

uint64_t sub_1DA66DAB0()
{
  return MEMORY[0x1E0D7EAF0]();
}

uint64_t sub_1DA66DABC()
{
  return MEMORY[0x1E0D7EB08]();
}

uint64_t sub_1DA66DAC8()
{
  return MEMORY[0x1E0D7EB18]();
}

uint64_t sub_1DA66DAD4()
{
  return MEMORY[0x1E0D7EB28]();
}

uint64_t sub_1DA66DAE0()
{
  return MEMORY[0x1E0D7EB40]();
}

uint64_t sub_1DA66DAEC()
{
  return MEMORY[0x1E0D7EB48]();
}

uint64_t sub_1DA66DAF8()
{
  return MEMORY[0x1E0D7EB50]();
}

uint64_t sub_1DA66DB04()
{
  return MEMORY[0x1E0D7EB58]();
}

uint64_t sub_1DA66DB10()
{
  return MEMORY[0x1E0D7EB60]();
}

uint64_t sub_1DA66DB1C()
{
  return MEMORY[0x1E0D7EB68]();
}

uint64_t sub_1DA66DB28()
{
  return MEMORY[0x1E0D7EB70]();
}

uint64_t sub_1DA66DB34()
{
  return MEMORY[0x1E0D7EB78]();
}

uint64_t sub_1DA66DB40()
{
  return MEMORY[0x1E0D7EB88]();
}

uint64_t sub_1DA66DB4C()
{
  return MEMORY[0x1E0D7EB90]();
}

uint64_t sub_1DA66DB58()
{
  return MEMORY[0x1E0D7EB98]();
}

uint64_t sub_1DA66DB64()
{
  return MEMORY[0x1E0D7EBA8]();
}

uint64_t sub_1DA66DB70()
{
  return MEMORY[0x1E0D7EBB0]();
}

uint64_t sub_1DA66DB7C()
{
  return MEMORY[0x1E0D7EBB8]();
}

uint64_t sub_1DA66DB88()
{
  return MEMORY[0x1E0D7EBD8]();
}

uint64_t sub_1DA66DB94()
{
  return MEMORY[0x1E0D7EBE8]();
}

uint64_t sub_1DA66DBA0()
{
  return MEMORY[0x1E0D7EBF8]();
}

uint64_t sub_1DA66DBAC()
{
  return MEMORY[0x1E0D7EC00]();
}

uint64_t sub_1DA66DBB8()
{
  return MEMORY[0x1E0D7EC20]();
}

uint64_t sub_1DA66DBC4()
{
  return MEMORY[0x1E0D7EC28]();
}

uint64_t sub_1DA66DBD0()
{
  return MEMORY[0x1E0D7EC30]();
}

uint64_t sub_1DA66DBDC()
{
  return MEMORY[0x1E0D7EC38]();
}

uint64_t sub_1DA66DBE8()
{
  return MEMORY[0x1E0D7EC40]();
}

uint64_t sub_1DA66DBF4()
{
  return MEMORY[0x1E0D7EC50]();
}

uint64_t sub_1DA66DC00()
{
  return MEMORY[0x1E0D7EC58]();
}

uint64_t sub_1DA66DC0C()
{
  return MEMORY[0x1E0D7EC78]();
}

uint64_t sub_1DA66DC18()
{
  return MEMORY[0x1E0D7EC80]();
}

uint64_t sub_1DA66DC24()
{
  return MEMORY[0x1E0D7EC88]();
}

uint64_t sub_1DA66DC30()
{
  return MEMORY[0x1E0D7EC90]();
}

uint64_t sub_1DA66DC3C()
{
  return MEMORY[0x1E0D7EC98]();
}

uint64_t sub_1DA66DC48()
{
  return MEMORY[0x1E0D7ECB0]();
}

uint64_t sub_1DA66DC54()
{
  return MEMORY[0x1E0D7ECC8]();
}

uint64_t sub_1DA66DC60()
{
  return MEMORY[0x1E0D7ECD0]();
}

uint64_t sub_1DA66DC6C()
{
  return MEMORY[0x1E0D7ECE0]();
}

uint64_t sub_1DA66DC78()
{
  return MEMORY[0x1E0D7ECE8]();
}

uint64_t sub_1DA66DC84()
{
  return MEMORY[0x1E0D7ECF0]();
}

uint64_t sub_1DA66DC90()
{
  return MEMORY[0x1E0D7ED18]();
}

uint64_t sub_1DA66DC9C()
{
  return MEMORY[0x1E0D7ED20]();
}

uint64_t sub_1DA66DCA8()
{
  return MEMORY[0x1E0D7ED28]();
}

uint64_t sub_1DA66DCB4()
{
  return MEMORY[0x1E0D7ED30]();
}

uint64_t sub_1DA66DCC0()
{
  return MEMORY[0x1E0D7ED38]();
}

uint64_t sub_1DA66DCCC()
{
  return MEMORY[0x1E0D7ED40]();
}

uint64_t sub_1DA66DCD8()
{
  return MEMORY[0x1E0D7ED48]();
}

uint64_t sub_1DA66DCE4()
{
  return MEMORY[0x1E0D7ED50]();
}

uint64_t sub_1DA66DCF0()
{
  return MEMORY[0x1E0D7ED68]();
}

uint64_t sub_1DA66DCFC()
{
  return MEMORY[0x1E0D7ED70]();
}

uint64_t sub_1DA66DD08()
{
  return MEMORY[0x1E0D7ED78]();
}

uint64_t sub_1DA66DD14()
{
  return MEMORY[0x1E0D7ED80]();
}

uint64_t sub_1DA66DD20()
{
  return MEMORY[0x1E0D7ED98]();
}

uint64_t sub_1DA66DD2C()
{
  return MEMORY[0x1E0D7EDB8]();
}

uint64_t sub_1DA66DD38()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1DA66DD44()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t sub_1DA66DD50()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1DA66DD5C()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1DA66DD68()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1DA66DD74()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1DA66DD80()
{
  return MEMORY[0x1E0D7EDF0]();
}

uint64_t sub_1DA66DD8C()
{
  return MEMORY[0x1E0D7EDF8]();
}

uint64_t sub_1DA66DD98()
{
  return MEMORY[0x1E0D7EE00]();
}

uint64_t sub_1DA66DDA4()
{
  return MEMORY[0x1E0D7EE08]();
}

uint64_t sub_1DA66DDB0()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1DA66DDBC()
{
  return MEMORY[0x1E0DF2158]();
}

uint64_t sub_1DA66DDC8()
{
  return MEMORY[0x1E0DF2160]();
}

uint64_t sub_1DA66DDD4()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1DA66DDE0()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1DA66DDEC()
{
  return MEMORY[0x1E0D7EE10]();
}

uint64_t sub_1DA66DDF8()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1DA66DE04()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1DA66DE10()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1DA66DE1C()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1DA66DE28()
{
  return MEMORY[0x1E0D7EE18]();
}

uint64_t sub_1DA66DE34()
{
  return MEMORY[0x1E0D7EE20]();
}

uint64_t sub_1DA66DE40()
{
  return MEMORY[0x1E0D7EE28]();
}

uint64_t sub_1DA66DE4C()
{
  return MEMORY[0x1E0D7EE30]();
}

uint64_t sub_1DA66DE58()
{
  return MEMORY[0x1E0D7EE38]();
}

uint64_t sub_1DA66DE64()
{
  return MEMORY[0x1E0D7EE40]();
}

uint64_t sub_1DA66DE70()
{
  return MEMORY[0x1E0D7EE48]();
}

uint64_t sub_1DA66DE7C()
{
  return MEMORY[0x1E0D7EE50]();
}

uint64_t sub_1DA66DE88()
{
  return MEMORY[0x1E0D7EE58]();
}

uint64_t sub_1DA66DE94()
{
  return MEMORY[0x1E0D7EE60]();
}

uint64_t sub_1DA66DEA0()
{
  return MEMORY[0x1E0D7EE68]();
}

uint64_t sub_1DA66DEAC()
{
  return MEMORY[0x1E0D7EE70]();
}

uint64_t sub_1DA66DEB8()
{
  return MEMORY[0x1E0D7EE78]();
}

uint64_t sub_1DA66DEC4()
{
  return MEMORY[0x1E0D7EE80]();
}

uint64_t sub_1DA66DED0()
{
  return MEMORY[0x1E0D7EE88]();
}

uint64_t sub_1DA66DEDC()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DA66DEE8()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DA66DEF4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DA66DF00()
{
  return MEMORY[0x1E0DC1EE8]();
}

uint64_t sub_1DA66DF0C()
{
  return MEMORY[0x1E0C956E0]();
}

uint64_t sub_1DA66DF18()
{
  return MEMORY[0x1E0C956E8]();
}

uint64_t sub_1DA66DF24()
{
  return MEMORY[0x1E0C956F8]();
}

uint64_t sub_1DA66DF30()
{
  return MEMORY[0x1E0C957B0]();
}

uint64_t sub_1DA66DF3C()
{
  return MEMORY[0x1E0C95930]();
}

uint64_t sub_1DA66DF48()
{
  return MEMORY[0x1E0C95B38]();
}

uint64_t sub_1DA66DF54()
{
  return MEMORY[0x1E0C95BF0]();
}

uint64_t sub_1DA66DF60()
{
  return MEMORY[0x1E0D7EEA0]();
}

uint64_t sub_1DA66DF6C()
{
  return MEMORY[0x1E0C95D20]();
}

uint64_t sub_1DA66DF78()
{
  return MEMORY[0x1E0C95D50]();
}

uint64_t sub_1DA66DF84()
{
  return MEMORY[0x1E0C95DD8]();
}

uint64_t sub_1DA66DF90()
{
  return MEMORY[0x1E0C95DE0]();
}

uint64_t sub_1DA66DF9C()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1DA66DFA8()
{
  return MEMORY[0x1E0C95E00]();
}

uint64_t sub_1DA66DFB4()
{
  return MEMORY[0x1E0C95E50]();
}

uint64_t sub_1DA66DFC0()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1DA66DFCC()
{
  return MEMORY[0x1E0C95F08]();
}

uint64_t sub_1DA66DFD8()
{
  return MEMORY[0x1E0C95F20]();
}

uint64_t sub_1DA66DFE4()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1DA66DFF0()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1DA66DFFC()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1DA66E008()
{
  return MEMORY[0x1E0C95FC0]();
}

uint64_t sub_1DA66E014()
{
  return MEMORY[0x1E0C96050]();
}

uint64_t sub_1DA66E020()
{
  return MEMORY[0x1E0C96078]();
}

uint64_t sub_1DA66E02C()
{
  return MEMORY[0x1E0C960A8]();
}

uint64_t sub_1DA66E038()
{
  return MEMORY[0x1E0C960B8]();
}

uint64_t sub_1DA66E044()
{
  return MEMORY[0x1E0D7EEA8]();
}

uint64_t sub_1DA66E050()
{
  return MEMORY[0x1E0D7EEB0]();
}

uint64_t sub_1DA66E05C()
{
  return MEMORY[0x1E0C960D8]();
}

uint64_t sub_1DA66E068()
{
  return MEMORY[0x1E0C960F0]();
}

uint64_t sub_1DA66E074()
{
  return MEMORY[0x1E0C96100]();
}

uint64_t sub_1DA66E080()
{
  return MEMORY[0x1E0C96128]();
}

uint64_t sub_1DA66E08C()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1DA66E098()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1DA66E0A4()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1DA66E0B0()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1DA66E0BC()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1DA66E0C8()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1DA66E0D4()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1DA66E0E0()
{
  return MEMORY[0x1E0D7EEB8]();
}

uint64_t sub_1DA66E0EC()
{
  return MEMORY[0x1E0D7EEC0]();
}

uint64_t sub_1DA66E0F8()
{
  return MEMORY[0x1E0D7EEC8]();
}

uint64_t sub_1DA66E104()
{
  return MEMORY[0x1E0D7EED0]();
}

uint64_t sub_1DA66E110()
{
  return MEMORY[0x1E0C961C8]();
}

uint64_t sub_1DA66E11C()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1DA66E128()
{
  return MEMORY[0x1E0C961D8]();
}

uint64_t sub_1DA66E134()
{
  return MEMORY[0x1E0C961E0]();
}

uint64_t sub_1DA66E140()
{
  return MEMORY[0x1E0C961F0]();
}

uint64_t sub_1DA66E14C()
{
  return MEMORY[0x1E0C961F8]();
}

uint64_t sub_1DA66E158()
{
  return MEMORY[0x1E0C96208]();
}

uint64_t sub_1DA66E164()
{
  return MEMORY[0x1E0C96238]();
}

uint64_t sub_1DA66E170()
{
  return MEMORY[0x1E0C96240]();
}

uint64_t sub_1DA66E17C()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1DA66E188()
{
  return MEMORY[0x1E0C96268]();
}

uint64_t sub_1DA66E194()
{
  return MEMORY[0x1E0C96280]();
}

uint64_t sub_1DA66E1A0()
{
  return MEMORY[0x1E0C96288]();
}

uint64_t sub_1DA66E1AC()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1DA66E1B8()
{
  return MEMORY[0x1E0C96298]();
}

uint64_t sub_1DA66E1C4()
{
  return MEMORY[0x1E0C962A8]();
}

uint64_t sub_1DA66E1D0()
{
  return MEMORY[0x1E0C962C0]();
}

uint64_t sub_1DA66E1DC()
{
  return MEMORY[0x1E0C962C8]();
}

uint64_t sub_1DA66E1E8()
{
  return MEMORY[0x1E0C96308]();
}

uint64_t sub_1DA66E1F4()
{
  return MEMORY[0x1E0C96318]();
}

uint64_t sub_1DA66E200()
{
  return MEMORY[0x1E0C96328]();
}

uint64_t sub_1DA66E20C()
{
  return MEMORY[0x1E0C96330]();
}

uint64_t sub_1DA66E218()
{
  return MEMORY[0x1E0C96338]();
}

uint64_t sub_1DA66E224()
{
  return MEMORY[0x1E0C96350]();
}

uint64_t sub_1DA66E230()
{
  return MEMORY[0x1E0C96358]();
}

uint64_t sub_1DA66E23C()
{
  return MEMORY[0x1E0C96360]();
}

uint64_t sub_1DA66E248()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1DA66E254()
{
  return MEMORY[0x1E0C96380]();
}

uint64_t sub_1DA66E260()
{
  return MEMORY[0x1E0C96398]();
}

uint64_t sub_1DA66E26C()
{
  return MEMORY[0x1E0C963E8]();
}

uint64_t sub_1DA66E278()
{
  return MEMORY[0x1E0C963F0]();
}

uint64_t sub_1DA66E284()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1DA66E290()
{
  return MEMORY[0x1E0C96420]();
}

uint64_t sub_1DA66E29C()
{
  return MEMORY[0x1E0C96428]();
}

uint64_t sub_1DA66E2A8()
{
  return MEMORY[0x1E0C96430]();
}

uint64_t sub_1DA66E2B4()
{
  return MEMORY[0x1E0C96438]();
}

uint64_t sub_1DA66E2C0()
{
  return MEMORY[0x1E0CD8298]();
}

uint64_t sub_1DA66E2CC()
{
  return MEMORY[0x1E0CD82A8]();
}

uint64_t sub_1DA66E2D8()
{
  return MEMORY[0x1E0CD82B0]();
}

uint64_t sub_1DA66E2E4()
{
  return MEMORY[0x1E0CD82B8]();
}

uint64_t sub_1DA66E2F0()
{
  return MEMORY[0x1E0CD82C0]();
}

uint64_t sub_1DA66E2FC()
{
  return MEMORY[0x1E0CD82C8]();
}

uint64_t sub_1DA66E308()
{
  return MEMORY[0x1E0CD82D0]();
}

uint64_t sub_1DA66E314()
{
  return MEMORY[0x1E0CD82D8]();
}

uint64_t sub_1DA66E320()
{
  return MEMORY[0x1E0CD8318]();
}

uint64_t sub_1DA66E32C()
{
  return MEMORY[0x1E0CD8320]();
}

uint64_t sub_1DA66E338()
{
  return MEMORY[0x1E0CD8338]();
}

uint64_t sub_1DA66E344()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_1DA66E350()
{
  return MEMORY[0x1E0CD8678]();
}

uint64_t sub_1DA66E35C()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_1DA66E368()
{
  return MEMORY[0x1E0CD88A0]();
}

uint64_t sub_1DA66E374()
{
  return MEMORY[0x1E0CD88F0]();
}

uint64_t sub_1DA66E380()
{
  return MEMORY[0x1E0CD8B48]();
}

uint64_t sub_1DA66E38C()
{
  return MEMORY[0x1E0CD8B88]();
}

uint64_t sub_1DA66E398()
{
  return MEMORY[0x1E0CD8E78]();
}

uint64_t sub_1DA66E3A4()
{
  return MEMORY[0x1E0CD8E80]();
}

uint64_t sub_1DA66E3B0()
{
  return MEMORY[0x1E0CD8EF0]();
}

uint64_t sub_1DA66E3BC()
{
  return MEMORY[0x1E0CD9008]();
}

uint64_t sub_1DA66E3C8()
{
  return MEMORY[0x1E0CD9010]();
}

uint64_t sub_1DA66E3D4()
{
  return MEMORY[0x1E0CD9020]();
}

uint64_t sub_1DA66E3E0()
{
  return MEMORY[0x1E0CD9030]();
}

uint64_t sub_1DA66E3EC()
{
  return MEMORY[0x1E0CD9210]();
}

uint64_t sub_1DA66E3F8()
{
  return MEMORY[0x1E0CD9230]();
}

uint64_t sub_1DA66E404()
{
  return MEMORY[0x1E0CD9240]();
}

uint64_t sub_1DA66E410()
{
  return MEMORY[0x1E0CD9408]();
}

uint64_t sub_1DA66E41C()
{
  return MEMORY[0x1E0CD94A8]();
}

uint64_t sub_1DA66E428()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1DA66E434()
{
  return MEMORY[0x1E0CD9C90]();
}

uint64_t sub_1DA66E440()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_1DA66E44C()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_1DA66E458()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_1DA66E464()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_1DA66E470()
{
  return MEMORY[0x1E0CDA768]();
}

uint64_t sub_1DA66E47C()
{
  return MEMORY[0x1E0CDA780]();
}

uint64_t sub_1DA66E488()
{
  return MEMORY[0x1E0CDA7F8]();
}

uint64_t sub_1DA66E494()
{
  return MEMORY[0x1E0CDA810]();
}

uint64_t sub_1DA66E4A0()
{
  return MEMORY[0x1E0CDA938]();
}

uint64_t sub_1DA66E4AC()
{
  return MEMORY[0x1E0CDA940]();
}

uint64_t sub_1DA66E4B8()
{
  return MEMORY[0x1E0CDA948]();
}

uint64_t sub_1DA66E4C4()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_1DA66E4D0()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_1DA66E4DC()
{
  return MEMORY[0x1E0CDAA68]();
}

uint64_t sub_1DA66E4E8()
{
  return MEMORY[0x1E0CDAA78]();
}

uint64_t sub_1DA66E4F4()
{
  return MEMORY[0x1E0CDAAA0]();
}

uint64_t sub_1DA66E500()
{
  return MEMORY[0x1E0CDAAA8]();
}

uint64_t sub_1DA66E50C()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1DA66E518()
{
  return MEMORY[0x1E0CDAFF8]();
}

uint64_t sub_1DA66E524()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_1DA66E530()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_1DA66E53C()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1DA66E548()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1DA66E554()
{
  return MEMORY[0x1E0CDB610]();
}

uint64_t sub_1DA66E560()
{
  return MEMORY[0x1E0CDB848]();
}

uint64_t sub_1DA66E56C()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1DA66E578()
{
  return MEMORY[0x1E0CDB880]();
}

uint64_t sub_1DA66E584()
{
  return MEMORY[0x1E0CDBA90]();
}

uint64_t sub_1DA66E590()
{
  return MEMORY[0x1E0CDBAD0]();
}

uint64_t sub_1DA66E59C()
{
  return MEMORY[0x1E0CDBB10]();
}

uint64_t sub_1DA66E5A8()
{
  return MEMORY[0x1E0CDBE08]();
}

uint64_t sub_1DA66E5B4()
{
  return MEMORY[0x1E0CDC170]();
}

uint64_t sub_1DA66E5C0()
{
  return MEMORY[0x1E0CDC2B8]();
}

uint64_t sub_1DA66E5CC()
{
  return MEMORY[0x1E0CDC2C8]();
}

uint64_t sub_1DA66E5D8()
{
  return MEMORY[0x1E0CDC7A0]();
}

uint64_t sub_1DA66E5E4()
{
  return MEMORY[0x1E0CDC7A8]();
}

uint64_t sub_1DA66E5F0()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_1DA66E5FC()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1DA66E608()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_1DA66E614()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1DA66E620()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_1DA66E62C()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_1DA66E638()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_1DA66E644()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_1DA66E650()
{
  return MEMORY[0x1E0CDD4D8]();
}

uint64_t sub_1DA66E65C()
{
  return MEMORY[0x1E0CDD560]();
}

uint64_t sub_1DA66E668()
{
  return MEMORY[0x1E0CDD580]();
}

uint64_t sub_1DA66E674()
{
  return MEMORY[0x1E0CDD590]();
}

uint64_t sub_1DA66E680()
{
  return MEMORY[0x1E0CDD598]();
}

uint64_t sub_1DA66E68C()
{
  return MEMORY[0x1E0CDD5E8]();
}

uint64_t sub_1DA66E698()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_1DA66E6A4()
{
  return MEMORY[0x1E0CDD658]();
}

uint64_t sub_1DA66E6B0()
{
  return MEMORY[0x1E0CDD688]();
}

uint64_t sub_1DA66E6BC()
{
  return MEMORY[0x1E0CDD6F8]();
}

uint64_t sub_1DA66E6C8()
{
  return MEMORY[0x1E0CDD740]();
}

uint64_t sub_1DA66E6D4()
{
  return MEMORY[0x1E0CDD780]();
}

uint64_t sub_1DA66E6E0()
{
  return MEMORY[0x1E0CDD798]();
}

uint64_t sub_1DA66E6EC()
{
  return MEMORY[0x1E0CDD7F0]();
}

uint64_t sub_1DA66E6F8()
{
  return MEMORY[0x1E0CDD928]();
}

uint64_t sub_1DA66E704()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_1DA66E710()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1DA66E71C()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_1DA66E728()
{
  return MEMORY[0x1E0CDDDC0]();
}

uint64_t sub_1DA66E734()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1DA66E740()
{
  return MEMORY[0x1E0D8D610]();
}

uint64_t sub_1DA66E74C()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1DA66E758()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1DA66E764()
{
  return MEMORY[0x1E0CDDE78]();
}

uint64_t sub_1DA66E770()
{
  return MEMORY[0x1E0CDE0F8]();
}

uint64_t sub_1DA66E77C()
{
  return MEMORY[0x1E0CDE108]();
}

uint64_t sub_1DA66E788()
{
  return MEMORY[0x1E0CDE210]();
}

uint64_t sub_1DA66E794()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1DA66E7A0()
{
  return MEMORY[0x1E0CDE570]();
}

uint64_t sub_1DA66E7AC()
{
  return MEMORY[0x1E0CDE8D8]();
}

uint64_t sub_1DA66E7B8()
{
  return MEMORY[0x1E0CDE950]();
}

uint64_t sub_1DA66E7C4()
{
  return MEMORY[0x1E0CDEE48]();
}

uint64_t sub_1DA66E7D0()
{
  return MEMORY[0x1E0CDF0D8]();
}

uint64_t sub_1DA66E7DC()
{
  return MEMORY[0x1E0CDF138]();
}

uint64_t sub_1DA66E7E8()
{
  return MEMORY[0x1E0CDF330]();
}

uint64_t sub_1DA66E7F4()
{
  return MEMORY[0x1E0CDF338]();
}

uint64_t sub_1DA66E800()
{
  return MEMORY[0x1E0CDF348]();
}

uint64_t sub_1DA66E80C()
{
  return MEMORY[0x1E0CDF350]();
}

uint64_t sub_1DA66E818()
{
  return MEMORY[0x1E0CDF358]();
}

uint64_t sub_1DA66E824()
{
  return MEMORY[0x1E0CDF3F0]();
}

uint64_t sub_1DA66E830()
{
  return MEMORY[0x1E0CDF438]();
}

uint64_t sub_1DA66E83C()
{
  return MEMORY[0x1E0CDF458]();
}

uint64_t sub_1DA66E848()
{
  return MEMORY[0x1E0CDF4B8]();
}

uint64_t sub_1DA66E854()
{
  return MEMORY[0x1E0CDF520]();
}

uint64_t sub_1DA66E860()
{
  return MEMORY[0x1E0CDF588]();
}

uint64_t sub_1DA66E86C()
{
  return MEMORY[0x1E0CDF5F8]();
}

uint64_t sub_1DA66E878()
{
  return MEMORY[0x1E0CDF628]();
}

uint64_t sub_1DA66E884()
{
  return MEMORY[0x1E0CDF670]();
}

uint64_t sub_1DA66E890()
{
  return MEMORY[0x1E0CDF678]();
}

uint64_t sub_1DA66E89C()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_1DA66E8A8()
{
  return MEMORY[0x1E0CDF858]();
}

uint64_t sub_1DA66E8B4()
{
  return MEMORY[0x1E0CDF878]();
}

uint64_t sub_1DA66E8C0()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1DA66E8CC()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1DA66E8D8()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_1DA66E8E4()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_1DA66E8F0()
{
  return MEMORY[0x1E0CDF9A8]();
}

uint64_t sub_1DA66E8FC()
{
  return MEMORY[0x1E0CDF9E8]();
}

uint64_t sub_1DA66E908()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_1DA66E914()
{
  return MEMORY[0x1E0CDFB80]();
}

uint64_t sub_1DA66E920()
{
  return MEMORY[0x1E0CDFB90]();
}

uint64_t sub_1DA66E92C()
{
  return MEMORY[0x1E0CDFB98]();
}

uint64_t sub_1DA66E938()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1DA66E944()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_1DA66E950()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_1DA66E95C()
{
  return MEMORY[0x1E0CDFDB8]();
}

uint64_t sub_1DA66E968()
{
  return MEMORY[0x1E0CDFEA8]();
}

uint64_t sub_1DA66E974()
{
  return MEMORY[0x1E0CDFF48]();
}

uint64_t sub_1DA66E980()
{
  return MEMORY[0x1E0CDFF58]();
}

uint64_t sub_1DA66E98C()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1DA66E998()
{
  return MEMORY[0x1E0CE02F8]();
}

uint64_t sub_1DA66E9A4()
{
  return MEMORY[0x1E0CE05B0]();
}

uint64_t sub_1DA66E9B0()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1DA66E9BC()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_1DA66E9C8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1DA66E9D4()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1DA66E9E0()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1DA66E9EC()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1DA66E9F8()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1DA66EA04()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1DA66EA10()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1DA66EA1C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1DA66EA28()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1DA66EA34()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1DA66EA40()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1DA66EA4C()
{
  return MEMORY[0x1E0D3F120]();
}

uint64_t sub_1DA66EA58()
{
  return MEMORY[0x1E0D3F128]();
}

uint64_t sub_1DA66EA64()
{
  return MEMORY[0x1E0D3F138]();
}

uint64_t sub_1DA66EA70()
{
  return MEMORY[0x1E0D3F160]();
}

uint64_t sub_1DA66EA7C()
{
  return MEMORY[0x1E0D3F178]();
}

uint64_t sub_1DA66EA88()
{
  return MEMORY[0x1E0D3F188]();
}

uint64_t sub_1DA66EA94()
{
  return MEMORY[0x1E0D3F198]();
}

uint64_t sub_1DA66EAA0()
{
  return MEMORY[0x1E0D3F1A8]();
}

uint64_t sub_1DA66EAAC()
{
  return MEMORY[0x1E0D3F1C0]();
}

uint64_t sub_1DA66EAB8()
{
  return MEMORY[0x1E0D3F1D8]();
}

uint64_t sub_1DA66EAC4()
{
  return MEMORY[0x1E0D3F1E0]();
}

uint64_t sub_1DA66EAD0()
{
  return MEMORY[0x1E0D3F1F0]();
}

uint64_t sub_1DA66EADC()
{
  return MEMORY[0x1E0D3F200]();
}

uint64_t sub_1DA66EAE8()
{
  return MEMORY[0x1E0D3F208]();
}

uint64_t sub_1DA66EAF4()
{
  return MEMORY[0x1E0D3F238]();
}

uint64_t sub_1DA66EB00()
{
  return MEMORY[0x1E0D3F240]();
}

uint64_t sub_1DA66EB0C()
{
  return MEMORY[0x1E0D3F248]();
}

uint64_t sub_1DA66EB18()
{
  return MEMORY[0x1E0D3F260]();
}

uint64_t sub_1DA66EB24()
{
  return MEMORY[0x1E0D3F288]();
}

uint64_t sub_1DA66EB30()
{
  return MEMORY[0x1E0D3F298]();
}

uint64_t sub_1DA66EB3C()
{
  return MEMORY[0x1E0D3F2A0]();
}

uint64_t sub_1DA66EB48()
{
  return MEMORY[0x1E0D3F2B0]();
}

uint64_t sub_1DA66EB54()
{
  return MEMORY[0x1E0D3F2B8]();
}

uint64_t sub_1DA66EB60()
{
  return MEMORY[0x1E0D3F2F8]();
}

uint64_t sub_1DA66EB6C()
{
  return MEMORY[0x1E0D3F300]();
}

uint64_t sub_1DA66EB78()
{
  return MEMORY[0x1E0D3F308]();
}

uint64_t sub_1DA66EB84()
{
  return MEMORY[0x1E0D3F320]();
}

uint64_t sub_1DA66EB90()
{
  return MEMORY[0x1E0D3F340]();
}

uint64_t sub_1DA66EB9C()
{
  return MEMORY[0x1E0D3F350]();
}

uint64_t sub_1DA66EBA8()
{
  return MEMORY[0x1E0D3F358]();
}

uint64_t sub_1DA66EBB4()
{
  return MEMORY[0x1E0D3F3E0]();
}

uint64_t sub_1DA66EBC0()
{
  return MEMORY[0x1E0D3F3E8]();
}

uint64_t sub_1DA66EBCC()
{
  return MEMORY[0x1E0D3F3F0]();
}

uint64_t sub_1DA66EBD8()
{
  return MEMORY[0x1E0D3F400]();
}

uint64_t sub_1DA66EBE4()
{
  return MEMORY[0x1E0D3F410]();
}

uint64_t sub_1DA66EBF0()
{
  return MEMORY[0x1E0D3F4C8]();
}

uint64_t sub_1DA66EBFC()
{
  return MEMORY[0x1E0D3F4D0]();
}

uint64_t sub_1DA66EC08()
{
  return MEMORY[0x1E0D3F4E8]();
}

uint64_t sub_1DA66EC14()
{
  return MEMORY[0x1E0D3F4F8]();
}

uint64_t sub_1DA66EC20()
{
  return MEMORY[0x1E0D3F500]();
}

uint64_t sub_1DA66EC2C()
{
  return MEMORY[0x1E0D3F518]();
}

uint64_t sub_1DA66EC38()
{
  return MEMORY[0x1E0D3F528]();
}

uint64_t sub_1DA66EC44()
{
  return MEMORY[0x1E0D3F548]();
}

uint64_t sub_1DA66EC50()
{
  return MEMORY[0x1E0D3F558]();
}

uint64_t sub_1DA66EC5C()
{
  return MEMORY[0x1E0D3F560]();
}

uint64_t sub_1DA66EC68()
{
  return MEMORY[0x1E0D3F568]();
}

uint64_t sub_1DA66EC74()
{
  return MEMORY[0x1E0D3F570]();
}

uint64_t sub_1DA66EC80()
{
  return MEMORY[0x1E0D3F578]();
}

uint64_t sub_1DA66EC8C()
{
  return MEMORY[0x1E0D3F5A0]();
}

uint64_t sub_1DA66EC98()
{
  return MEMORY[0x1E0D3F5E8]();
}

uint64_t sub_1DA66ECA4()
{
  return MEMORY[0x1E0D3F5F8]();
}

uint64_t sub_1DA66ECB0()
{
  return MEMORY[0x1E0D3F600]();
}

uint64_t sub_1DA66ECBC()
{
  return MEMORY[0x1E0D3F608]();
}

uint64_t sub_1DA66ECC8()
{
  return MEMORY[0x1E0D3F660]();
}

uint64_t sub_1DA66ECD4()
{
  return MEMORY[0x1E0D3F690]();
}

uint64_t sub_1DA66ECE0()
{
  return MEMORY[0x1E0D3F698]();
}

uint64_t sub_1DA66ECEC()
{
  return MEMORY[0x1E0D3F6A8]();
}

uint64_t sub_1DA66ECF8()
{
  return MEMORY[0x1E0D3F6B0]();
}

uint64_t sub_1DA66ED04()
{
  return MEMORY[0x1E0D3F700]();
}

uint64_t sub_1DA66ED10()
{
  return MEMORY[0x1E0D3F720]();
}

uint64_t sub_1DA66ED1C()
{
  return MEMORY[0x1E0D3F730]();
}

uint64_t sub_1DA66ED28()
{
  return MEMORY[0x1E0D3F7F8]();
}

uint64_t sub_1DA66ED34()
{
  return MEMORY[0x1E0D3F828]();
}

uint64_t sub_1DA66ED40()
{
  return MEMORY[0x1E0D3F8E0]();
}

uint64_t sub_1DA66ED4C()
{
  return MEMORY[0x1E0D3F948]();
}

uint64_t sub_1DA66ED58()
{
  return MEMORY[0x1E0D3F950]();
}

uint64_t sub_1DA66ED64()
{
  return MEMORY[0x1E0D3F970]();
}

uint64_t sub_1DA66ED70()
{
  return MEMORY[0x1E0D3F998]();
}

uint64_t sub_1DA66ED7C()
{
  return MEMORY[0x1E0D3FAB0]();
}

uint64_t sub_1DA66ED88()
{
  return MEMORY[0x1E0D3FAC8]();
}

uint64_t sub_1DA66ED94()
{
  return MEMORY[0x1E0D3FBA8]();
}

uint64_t sub_1DA66EDA0()
{
  return MEMORY[0x1E0D3FBB0]();
}

uint64_t sub_1DA66EDAC()
{
  return MEMORY[0x1E0D3FBB8]();
}

uint64_t sub_1DA66EDB8()
{
  return MEMORY[0x1E0D3FBC0]();
}

uint64_t sub_1DA66EDC4()
{
  return MEMORY[0x1E0D3FCA8]();
}

uint64_t sub_1DA66EDD0()
{
  return MEMORY[0x1E0D3FCB8]();
}

uint64_t sub_1DA66EDDC()
{
  return MEMORY[0x1E0D3FCC8]();
}

uint64_t sub_1DA66EDE8()
{
  return MEMORY[0x1E0D3FCD0]();
}

uint64_t sub_1DA66EDF4()
{
  return MEMORY[0x1E0D3FCF8]();
}

uint64_t sub_1DA66EE00()
{
  return MEMORY[0x1E0D3FD00]();
}

uint64_t sub_1DA66EE0C()
{
  return MEMORY[0x1E0D3FD10]();
}

uint64_t sub_1DA66EE18()
{
  return MEMORY[0x1E0D3FD18]();
}

uint64_t sub_1DA66EE24()
{
  return MEMORY[0x1E0D3FD28]();
}

uint64_t sub_1DA66EE30()
{
  return MEMORY[0x1E0D3FD38]();
}

uint64_t sub_1DA66EE3C()
{
  return MEMORY[0x1E0D3FD50]();
}

uint64_t sub_1DA66EE48()
{
  return MEMORY[0x1E0D3FD80]();
}

uint64_t sub_1DA66EE54()
{
  return MEMORY[0x1E0D3FE78]();
}

uint64_t sub_1DA66EE60()
{
  return MEMORY[0x1E0D3FED0]();
}

uint64_t sub_1DA66EE6C()
{
  return MEMORY[0x1E0D3FEF8]();
}

uint64_t sub_1DA66EE78()
{
  return MEMORY[0x1E0D3FF20]();
}

uint64_t sub_1DA66EE84()
{
  return MEMORY[0x1E0D3FF30]();
}

uint64_t sub_1DA66EE90()
{
  return MEMORY[0x1E0D3FF38]();
}

uint64_t sub_1DA66EE9C()
{
  return MEMORY[0x1E0D3FF48]();
}

uint64_t sub_1DA66EEA8()
{
  return MEMORY[0x1E0D3FF58]();
}

uint64_t sub_1DA66EEB4()
{
  return MEMORY[0x1E0D3FFD0]();
}

uint64_t sub_1DA66EEC0()
{
  return MEMORY[0x1E0D3FFD8]();
}

uint64_t sub_1DA66EECC()
{
  return MEMORY[0x1E0D3FFF0]();
}

uint64_t sub_1DA66EED8()
{
  return MEMORY[0x1E0D3FFF8]();
}

uint64_t sub_1DA66EEE4()
{
  return MEMORY[0x1E0D40008]();
}

uint64_t sub_1DA66EEF0()
{
  return MEMORY[0x1E0D40010]();
}

uint64_t sub_1DA66EEFC()
{
  return MEMORY[0x1E0D40020]();
}

uint64_t sub_1DA66EF08()
{
  return MEMORY[0x1E0D40028]();
}

uint64_t sub_1DA66EF14()
{
  return MEMORY[0x1E0D40048]();
}

uint64_t sub_1DA66EF20()
{
  return MEMORY[0x1E0D400F0]();
}

uint64_t sub_1DA66EF2C()
{
  return MEMORY[0x1E0D400F8]();
}

uint64_t sub_1DA66EF38()
{
  return MEMORY[0x1E0D40108]();
}

uint64_t sub_1DA66EF44()
{
  return MEMORY[0x1E0D40118]();
}

uint64_t sub_1DA66EF50()
{
  return MEMORY[0x1E0D40140]();
}

uint64_t sub_1DA66EF5C()
{
  return MEMORY[0x1E0D40150]();
}

uint64_t sub_1DA66EF68()
{
  return MEMORY[0x1E0D40158]();
}

uint64_t sub_1DA66EF74()
{
  return MEMORY[0x1E0D40160]();
}

uint64_t sub_1DA66EF80()
{
  return MEMORY[0x1E0D40168]();
}

uint64_t sub_1DA66EF8C()
{
  return MEMORY[0x1E0D40178]();
}

uint64_t sub_1DA66EF98()
{
  return MEMORY[0x1E0D40180]();
}

uint64_t sub_1DA66EFA4()
{
  return MEMORY[0x1E0D40188]();
}

uint64_t sub_1DA66EFB0()
{
  return MEMORY[0x1E0D40198]();
}

uint64_t sub_1DA66EFBC()
{
  return MEMORY[0x1E0D401B8]();
}

uint64_t sub_1DA66EFC8()
{
  return MEMORY[0x1E0D401C0]();
}

uint64_t sub_1DA66EFD4()
{
  return MEMORY[0x1E0D401C8]();
}

uint64_t sub_1DA66EFE0()
{
  return MEMORY[0x1E0D401D8]();
}

uint64_t sub_1DA66EFEC()
{
  return MEMORY[0x1E0D401F0]();
}

uint64_t sub_1DA66EFF8()
{
  return MEMORY[0x1E0D40210]();
}

uint64_t sub_1DA66F004()
{
  return MEMORY[0x1E0D40250]();
}

uint64_t sub_1DA66F010()
{
  return MEMORY[0x1E0D40258]();
}

uint64_t sub_1DA66F01C()
{
  return MEMORY[0x1E0D402F8]();
}

uint64_t sub_1DA66F028()
{
  return MEMORY[0x1E0D40310]();
}

uint64_t sub_1DA66F034()
{
  return MEMORY[0x1E0D40430]();
}

uint64_t sub_1DA66F040()
{
  return MEMORY[0x1E0D40438]();
}

uint64_t sub_1DA66F04C()
{
  return MEMORY[0x1E0D40440]();
}

uint64_t sub_1DA66F058()
{
  return MEMORY[0x1E0D40448]();
}

uint64_t sub_1DA66F064()
{
  return MEMORY[0x1E0D40450]();
}

uint64_t sub_1DA66F070()
{
  return MEMORY[0x1E0D40458]();
}

uint64_t sub_1DA66F07C()
{
  return MEMORY[0x1E0D40460]();
}

uint64_t sub_1DA66F088()
{
  return MEMORY[0x1E0D40470]();
}

uint64_t sub_1DA66F094()
{
  return MEMORY[0x1E0D40478]();
}

uint64_t sub_1DA66F0A0()
{
  return MEMORY[0x1E0D40488]();
}

uint64_t sub_1DA66F0AC()
{
  return MEMORY[0x1E0D40490]();
}

uint64_t sub_1DA66F0B8()
{
  return MEMORY[0x1E0D404A0]();
}

uint64_t sub_1DA66F0C4()
{
  return MEMORY[0x1E0D404F0]();
}

uint64_t sub_1DA66F0D0()
{
  return MEMORY[0x1E0D404F8]();
}

uint64_t sub_1DA66F0DC()
{
  return MEMORY[0x1E0D40500]();
}

uint64_t sub_1DA66F0E8()
{
  return MEMORY[0x1E0D40518]();
}

uint64_t sub_1DA66F0F4()
{
  return MEMORY[0x1E0D40540]();
}

uint64_t sub_1DA66F100()
{
  return MEMORY[0x1E0D40558]();
}

uint64_t sub_1DA66F10C()
{
  return MEMORY[0x1E0D40560]();
}

uint64_t sub_1DA66F118()
{
  return MEMORY[0x1E0D40568]();
}

uint64_t sub_1DA66F124()
{
  return MEMORY[0x1E0D40570]();
}

uint64_t sub_1DA66F130()
{
  return MEMORY[0x1E0D40588]();
}

uint64_t sub_1DA66F13C()
{
  return MEMORY[0x1E0D405D0]();
}

uint64_t sub_1DA66F148()
{
  return MEMORY[0x1E0D405E0]();
}

uint64_t sub_1DA66F154()
{
  return MEMORY[0x1E0D405F8]();
}

uint64_t sub_1DA66F160()
{
  return MEMORY[0x1E0D40600]();
}

uint64_t sub_1DA66F16C()
{
  return MEMORY[0x1E0D40620]();
}

uint64_t sub_1DA66F178()
{
  return MEMORY[0x1E0D40630]();
}

uint64_t sub_1DA66F184()
{
  return MEMORY[0x1E0D40638]();
}

uint64_t sub_1DA66F190()
{
  return MEMORY[0x1E0D40640]();
}

uint64_t sub_1DA66F19C()
{
  return MEMORY[0x1E0D40650]();
}

uint64_t sub_1DA66F1A8()
{
  return MEMORY[0x1E0D40658]();
}

uint64_t sub_1DA66F1B4()
{
  return MEMORY[0x1E0D40660]();
}

uint64_t sub_1DA66F1C0()
{
  return MEMORY[0x1E0D40668]();
}

uint64_t sub_1DA66F1CC()
{
  return MEMORY[0x1E0D40670]();
}

uint64_t sub_1DA66F1D8()
{
  return MEMORY[0x1E0D40680]();
}

uint64_t sub_1DA66F1E4()
{
  return MEMORY[0x1E0D40688]();
}

uint64_t sub_1DA66F1F0()
{
  return MEMORY[0x1E0D406B0]();
}

uint64_t sub_1DA66F1FC()
{
  return MEMORY[0x1E0D406B8]();
}

uint64_t sub_1DA66F208()
{
  return MEMORY[0x1E0D406D8]();
}

uint64_t sub_1DA66F214()
{
  return MEMORY[0x1E0D40708]();
}

uint64_t sub_1DA66F220()
{
  return MEMORY[0x1E0D40720]();
}

uint64_t sub_1DA66F22C()
{
  return MEMORY[0x1E0D40728]();
}

uint64_t sub_1DA66F238()
{
  return MEMORY[0x1E0D40748]();
}

uint64_t sub_1DA66F244()
{
  return MEMORY[0x1E0D40758]();
}

uint64_t sub_1DA66F250()
{
  return MEMORY[0x1E0D40760]();
}

uint64_t sub_1DA66F25C()
{
  return MEMORY[0x1E0D40768]();
}

uint64_t sub_1DA66F268()
{
  return MEMORY[0x1E0D40780]();
}

uint64_t sub_1DA66F274()
{
  return MEMORY[0x1E0D407B0]();
}

uint64_t sub_1DA66F280()
{
  return MEMORY[0x1E0D407C0]();
}

uint64_t sub_1DA66F28C()
{
  return MEMORY[0x1E0D407D8]();
}

uint64_t sub_1DA66F298()
{
  return MEMORY[0x1E0D407E0]();
}

uint64_t sub_1DA66F2A4()
{
  return MEMORY[0x1E0D407E8]();
}

uint64_t sub_1DA66F2B0()
{
  return MEMORY[0x1E0D407F8]();
}

uint64_t sub_1DA66F2BC()
{
  return MEMORY[0x1E0D40800]();
}

uint64_t sub_1DA66F2C8()
{
  return MEMORY[0x1E0D40960]();
}

uint64_t sub_1DA66F2D4()
{
  return MEMORY[0x1E0D40A68]();
}

uint64_t sub_1DA66F2E0()
{
  return MEMORY[0x1E0D40A80]();
}

uint64_t sub_1DA66F2EC()
{
  return MEMORY[0x1E0D40A88]();
}

uint64_t sub_1DA66F2F8()
{
  return MEMORY[0x1E0D40A90]();
}

uint64_t sub_1DA66F304()
{
  return MEMORY[0x1E0D40AC0]();
}

uint64_t sub_1DA66F310()
{
  return MEMORY[0x1E0D40B00]();
}

uint64_t sub_1DA66F31C()
{
  return MEMORY[0x1E0D40B18]();
}

uint64_t sub_1DA66F328()
{
  return MEMORY[0x1E0D40B20]();
}

uint64_t sub_1DA66F334()
{
  return MEMORY[0x1E0D40B28]();
}

uint64_t sub_1DA66F340()
{
  return MEMORY[0x1E0D40B30]();
}

uint64_t sub_1DA66F34C()
{
  return MEMORY[0x1E0D40B40]();
}

uint64_t sub_1DA66F358()
{
  return MEMORY[0x1E0D40B50]();
}

uint64_t sub_1DA66F364()
{
  return MEMORY[0x1E0D40B68]();
}

uint64_t sub_1DA66F370()
{
  return MEMORY[0x1E0D40BB0]();
}

uint64_t sub_1DA66F37C()
{
  return MEMORY[0x1E0D40BC0]();
}

uint64_t sub_1DA66F388()
{
  return MEMORY[0x1E0D40BD8]();
}

uint64_t sub_1DA66F394()
{
  return MEMORY[0x1E0D40BE8]();
}

uint64_t sub_1DA66F3A0()
{
  return MEMORY[0x1E0D40BF0]();
}

uint64_t sub_1DA66F3AC()
{
  return MEMORY[0x1E0D40BF8]();
}

uint64_t sub_1DA66F3B8()
{
  return MEMORY[0x1E0D40C00]();
}

uint64_t sub_1DA66F3C4()
{
  return MEMORY[0x1E0D40C08]();
}

uint64_t sub_1DA66F3D0()
{
  return MEMORY[0x1E0D40C10]();
}

uint64_t sub_1DA66F3DC()
{
  return MEMORY[0x1E0D40C18]();
}

uint64_t sub_1DA66F3E8()
{
  return MEMORY[0x1E0D40C20]();
}

uint64_t sub_1DA66F3F4()
{
  return MEMORY[0x1E0D40C38]();
}

uint64_t sub_1DA66F400()
{
  return MEMORY[0x1E0D40D68]();
}

uint64_t sub_1DA66F40C()
{
  return MEMORY[0x1E0D40D80]();
}

uint64_t sub_1DA66F418()
{
  return MEMORY[0x1E0D40DA0]();
}

uint64_t sub_1DA66F424()
{
  return MEMORY[0x1E0D40DA8]();
}

uint64_t sub_1DA66F430()
{
  return MEMORY[0x1E0D40DB0]();
}

uint64_t sub_1DA66F43C()
{
  return MEMORY[0x1E0D40DB8]();
}

uint64_t sub_1DA66F448()
{
  return MEMORY[0x1E0D40DC0]();
}

uint64_t sub_1DA66F454()
{
  return MEMORY[0x1E0D40DC8]();
}

uint64_t sub_1DA66F460()
{
  return MEMORY[0x1E0D40DD8]();
}

uint64_t sub_1DA66F46C()
{
  return MEMORY[0x1E0D40DE8]();
}

uint64_t sub_1DA66F478()
{
  return MEMORY[0x1E0D40E48]();
}

uint64_t sub_1DA66F484()
{
  return MEMORY[0x1E0D40E58]();
}

uint64_t sub_1DA66F490()
{
  return MEMORY[0x1E0D40E78]();
}

uint64_t sub_1DA66F49C()
{
  return MEMORY[0x1E0D40E90]();
}

uint64_t sub_1DA66F4A8()
{
  return MEMORY[0x1E0D40ED0]();
}

uint64_t sub_1DA66F4B4()
{
  return MEMORY[0x1E0D40ED8]();
}

uint64_t sub_1DA66F4C0()
{
  return MEMORY[0x1E0D40EE8]();
}

uint64_t sub_1DA66F4CC()
{
  return MEMORY[0x1E0D40F18]();
}

uint64_t sub_1DA66F4D8()
{
  return MEMORY[0x1E0D40F28]();
}

uint64_t sub_1DA66F4E4()
{
  return MEMORY[0x1E0D40F38]();
}

uint64_t sub_1DA66F4F0()
{
  return MEMORY[0x1E0D40F48]();
}

uint64_t sub_1DA66F4FC()
{
  return MEMORY[0x1E0D40F60]();
}

uint64_t sub_1DA66F508()
{
  return MEMORY[0x1E0D40F70]();
}

uint64_t sub_1DA66F514()
{
  return MEMORY[0x1E0D40F80]();
}

uint64_t sub_1DA66F520()
{
  return MEMORY[0x1E0D40FD0]();
}

uint64_t sub_1DA66F52C()
{
  return MEMORY[0x1E0D40FE0]();
}

uint64_t sub_1DA66F538()
{
  return MEMORY[0x1E0D41018]();
}

uint64_t sub_1DA66F544()
{
  return MEMORY[0x1E0D41020]();
}

uint64_t sub_1DA66F550()
{
  return MEMORY[0x1E0D41028]();
}

uint64_t sub_1DA66F55C()
{
  return MEMORY[0x1E0D41030]();
}

uint64_t sub_1DA66F568()
{
  return MEMORY[0x1E0D41128]();
}

uint64_t sub_1DA66F574()
{
  return MEMORY[0x1E0D41130]();
}

uint64_t sub_1DA66F580()
{
  return MEMORY[0x1E0D41168]();
}

uint64_t sub_1DA66F58C()
{
  return MEMORY[0x1E0D411B8]();
}

uint64_t sub_1DA66F598()
{
  return MEMORY[0x1E0D411D0]();
}

uint64_t sub_1DA66F5A4()
{
  return MEMORY[0x1E0D41220]();
}

uint64_t sub_1DA66F5B0()
{
  return MEMORY[0x1E0D41228]();
}

uint64_t sub_1DA66F5BC()
{
  return MEMORY[0x1E0D41260]();
}

uint64_t sub_1DA66F5C8()
{
  return MEMORY[0x1E0D41270]();
}

uint64_t sub_1DA66F5D4()
{
  return MEMORY[0x1E0D41278]();
}

uint64_t sub_1DA66F5E0()
{
  return MEMORY[0x1E0D41280]();
}

uint64_t sub_1DA66F5EC()
{
  return MEMORY[0x1E0D412A0]();
}

uint64_t sub_1DA66F5F8()
{
  return MEMORY[0x1E0D412B8]();
}

uint64_t sub_1DA66F604()
{
  return MEMORY[0x1E0D412D8]();
}

uint64_t sub_1DA66F610()
{
  return MEMORY[0x1E0D412E0]();
}

uint64_t sub_1DA66F61C()
{
  return MEMORY[0x1E0D412F0]();
}

uint64_t sub_1DA66F628()
{
  return MEMORY[0x1E0D41320]();
}

uint64_t sub_1DA66F634()
{
  return MEMORY[0x1E0D41328]();
}

uint64_t sub_1DA66F640()
{
  return MEMORY[0x1E0D41330]();
}

uint64_t sub_1DA66F64C()
{
  return MEMORY[0x1E0D41348]();
}

uint64_t sub_1DA66F658()
{
  return MEMORY[0x1E0D41358]();
}

uint64_t sub_1DA66F664()
{
  return MEMORY[0x1E0D41360]();
}

uint64_t sub_1DA66F670()
{
  return MEMORY[0x1E0D41388]();
}

uint64_t sub_1DA66F67C()
{
  return MEMORY[0x1E0D41398]();
}

uint64_t sub_1DA66F688()
{
  return MEMORY[0x1E0D413C0]();
}

uint64_t sub_1DA66F694()
{
  return MEMORY[0x1E0D413C8]();
}

uint64_t sub_1DA66F6A0()
{
  return MEMORY[0x1E0D413D0]();
}

uint64_t sub_1DA66F6AC()
{
  return MEMORY[0x1E0D413E0]();
}

uint64_t sub_1DA66F6B8()
{
  return MEMORY[0x1E0D413F0]();
}

uint64_t sub_1DA66F6C4()
{
  return MEMORY[0x1E0D41490]();
}

uint64_t sub_1DA66F6D0()
{
  return MEMORY[0x1E0D414A0]();
}

uint64_t sub_1DA66F6DC()
{
  return MEMORY[0x1E0D41500]();
}

uint64_t sub_1DA66F6E8()
{
  return MEMORY[0x1E0D41550]();
}

uint64_t sub_1DA66F6F4()
{
  return MEMORY[0x1E0D41558]();
}

uint64_t sub_1DA66F700()
{
  return MEMORY[0x1E0D41560]();
}

uint64_t sub_1DA66F70C()
{
  return MEMORY[0x1E0D41568]();
}

uint64_t sub_1DA66F718()
{
  return MEMORY[0x1E0D41570]();
}

uint64_t sub_1DA66F724()
{
  return MEMORY[0x1E0D41578]();
}

uint64_t sub_1DA66F730()
{
  return MEMORY[0x1E0D41580]();
}

uint64_t sub_1DA66F73C()
{
  return MEMORY[0x1E0D41588]();
}

uint64_t sub_1DA66F748()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DA66F754()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1DA66F760()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1DA66F76C()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1DA66F778()
{
  return MEMORY[0x1E0D7EEF8]();
}

uint64_t sub_1DA66F784()
{
  return MEMORY[0x1E0D7EF00]();
}

uint64_t sub_1DA66F790()
{
  return MEMORY[0x1E0DE9E90]();
}

uint64_t sub_1DA66F79C()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_1DA66F7A8()
{
  return MEMORY[0x1E0D41658]();
}

uint64_t sub_1DA66F7B4()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1DA66F7C0()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1DA66F7CC()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1DA66F7D8()
{
  return MEMORY[0x1E0DEA108]();
}

uint64_t sub_1DA66F7E4()
{
  return MEMORY[0x1E0DEA198]();
}

uint64_t sub_1DA66F7F0()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1DA66F7FC()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1DA66F808()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_1DA66F814()
{
  return MEMORY[0x1E0DF1FA0]();
}

uint64_t sub_1DA66F820()
{
  return MEMORY[0x1E0DF1FA8]();
}

uint64_t sub_1DA66F82C()
{
  return MEMORY[0x1E0DF1FB0]();
}

uint64_t sub_1DA66F838()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1DA66F844()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1DA66F850()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1DA66F85C()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_1DA66F868()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_1DA66F874()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_1DA66F880()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_1DA66F88C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DA66F898()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1DA66F8A4()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1DA66F8B0()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1DA66F8BC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DA66F8C8()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1DA66F8D4()
{
  return MEMORY[0x1E0CB19A0]();
}

uint64_t sub_1DA66F8E0()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1DA66F8EC()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1DA66F8F8()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1DA66F904()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1DA66F910()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1DA66F91C()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1DA66F928()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_1DA66F934()
{
  return MEMORY[0x1E0D7EF10]();
}

uint64_t sub_1DA66F940()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1DA66F94C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DA66F958()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1DA66F964()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1DA66F970()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1DA66F97C()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1DA66F988()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DA66F994()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DA66F9A0()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1DA66F9AC()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1DA66F9B8()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1DA66F9C4()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1DA66F9D0()
{
  return MEMORY[0x1E0DEA8C0]();
}

uint64_t sub_1DA66F9DC()
{
  return MEMORY[0x1E0DEA8F8]();
}

uint64_t sub_1DA66F9E8()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1DA66F9F4()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1DA66FA00()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1DA66FA0C()
{
  return MEMORY[0x1E0DEA958]();
}

uint64_t sub_1DA66FA18()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1DA66FA24()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1DA66FA30()
{
  return MEMORY[0x1E0C96490]();
}

uint64_t sub_1DA66FA3C()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1DA66FA48()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t sub_1DA66FA54()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1DA66FA60()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t sub_1DA66FA6C()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1DA66FA78()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1DA66FA84()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1DA66FA90()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DA66FA9C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DA66FAA8()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1DA66FAB4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DA66FAC0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1DA66FACC()
{
  return MEMORY[0x1E0D7EF18]();
}

uint64_t sub_1DA66FAD8()
{
  return MEMORY[0x1E0D7EF20]();
}

uint64_t sub_1DA66FAE4()
{
  return MEMORY[0x1E0DEADF8]();
}

uint64_t sub_1DA66FAF0()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_1DA66FAFC()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1DA66FB08()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1DA66FB14()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1DA66FB20()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1DA66FB2C()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1DA66FB38()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DA66FB44()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1DA66FB50()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1DA66FB5C()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1DA66FB68()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1DA66FB74()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1DA66FB80()
{
  return MEMORY[0x1E0DF0738]();
}

uint64_t sub_1DA66FB8C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DA66FB98()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DA66FBA4()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1DA66FBB0()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1DA66FBBC()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1DA66FBC8()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1DA66FBD4()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1DA66FBE0()
{
  return MEMORY[0x1E0DF08C0]();
}

uint64_t sub_1DA66FBEC()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1DA66FBF8()
{
  return MEMORY[0x1E0DF08D0]();
}

uint64_t sub_1DA66FC04()
{
  return MEMORY[0x1E0DF0900]();
}

uint64_t sub_1DA66FC10()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1DA66FC1C()
{
  return MEMORY[0x1E0D7EF38]();
}

uint64_t sub_1DA66FC28()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1DA66FC34()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1DA66FC40()
{
  return MEMORY[0x1E0DEB110]();
}

uint64_t sub_1DA66FC4C()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1DA66FC58()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1DA66FC64()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1DA66FC70()
{
  return MEMORY[0x1E0DEB230]();
}

uint64_t sub_1DA66FC7C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1DA66FC88()
{
  return MEMORY[0x1E0D7EF48]();
}

uint64_t sub_1DA66FC94()
{
  return MEMORY[0x1E0DEB300]();
}

uint64_t sub_1DA66FCA0()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1DA66FCAC()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_1DA66FCB8()
{
  return MEMORY[0x1E0DEB498]();
}

uint64_t sub_1DA66FCC4()
{
  return MEMORY[0x1E0DEB518]();
}

uint64_t sub_1DA66FCD0()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1DA66FCDC()
{
  return MEMORY[0x1E0D7EF50]();
}

uint64_t sub_1DA66FCE8()
{
  return MEMORY[0x1E0D7EF58]();
}

uint64_t sub_1DA66FCF4()
{
  return MEMORY[0x1E0D7EF68]();
}

uint64_t sub_1DA66FD00()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1DA66FD0C()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_1DA66FD18()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1DA66FD24()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1DA66FD30()
{
  return MEMORY[0x1E0DF1FF8]();
}

uint64_t sub_1DA66FD3C()
{
  return MEMORY[0x1E0D416B0]();
}

uint64_t sub_1DA66FD48()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1DA66FD54()
{
  return MEMORY[0x1E0CB1CB0]();
}

uint64_t sub_1DA66FD60()
{
  return MEMORY[0x1E0CB1CD0]();
}

uint64_t sub_1DA66FD6C()
{
  return MEMORY[0x1E0CB1D20]();
}

uint64_t sub_1DA66FD78()
{
  return MEMORY[0x1E0D416C0]();
}

uint64_t sub_1DA66FD84()
{
  return MEMORY[0x1E0CB1DB8]();
}

uint64_t sub_1DA66FD90()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1DA66FD9C()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1DA66FDA8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DA66FDB4()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1DA66FDC0()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DA66FDCC()
{
  return MEMORY[0x1E0D7EF80]();
}

uint64_t sub_1DA66FDD8()
{
  return MEMORY[0x1E0D7EF88]();
}

uint64_t sub_1DA66FDE4()
{
  return MEMORY[0x1E0D7EF90]();
}

uint64_t sub_1DA66FDF0()
{
  return MEMORY[0x1E0D7EFB0]();
}

uint64_t sub_1DA66FDFC()
{
  return MEMORY[0x1E0D7EFD0]();
}

uint64_t sub_1DA66FE08()
{
  return MEMORY[0x1E0D7EFE0]();
}

uint64_t sub_1DA66FE14()
{
  return MEMORY[0x1E0D7EFE8]();
}

uint64_t sub_1DA66FE20()
{
  return MEMORY[0x1E0D7EFF0]();
}

uint64_t sub_1DA66FE2C()
{
  return MEMORY[0x1E0D7EFF8]();
}

uint64_t sub_1DA66FE38()
{
  return MEMORY[0x1E0D7F000]();
}

uint64_t sub_1DA66FE44()
{
  return MEMORY[0x1E0D7F008]();
}

uint64_t sub_1DA66FE50()
{
  return MEMORY[0x1E0D7F010]();
}

uint64_t sub_1DA66FE5C()
{
  return MEMORY[0x1E0D7F018]();
}

uint64_t sub_1DA66FE68()
{
  return MEMORY[0x1E0D7F020]();
}

uint64_t sub_1DA66FE74()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1DA66FE80()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1DA66FE8C()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1DA66FE98()
{
  return MEMORY[0x1E0DEF880]();
}

uint64_t sub_1DA66FEA4()
{
  return MEMORY[0x1E0DEF890]();
}

uint64_t sub_1DA66FEB0()
{
  return MEMORY[0x1E0DEF8A0]();
}

uint64_t sub_1DA66FEBC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1DA66FEC8()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1DA66FED4()
{
  return MEMORY[0x1E0DEF8F0]();
}

uint64_t sub_1DA66FEE0()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1DA66FEEC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1DA66FEF8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1DA66FF04()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1DA66FF10()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1DA66FF1C()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1DA66FF28()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1DA66FF34()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1DA66FF40()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1DA66FF4C()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1DA66FF58()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1DA66FF64()
{
  return MEMORY[0x1E0CB1F10]();
}

uint64_t sub_1DA66FF70()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1DA66FF7C()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1DA66FF88()
{
  return MEMORY[0x1E0D7F028]();
}

uint64_t sub_1DA66FF94()
{
  return MEMORY[0x1E0D7F038]();
}

uint64_t sub_1DA66FFA0()
{
  return MEMORY[0x1E0D7F048]();
}

uint64_t sub_1DA66FFAC()
{
  return MEMORY[0x1E0D7F058]();
}

uint64_t sub_1DA66FFB8()
{
  return MEMORY[0x1E0D7F060]();
}

uint64_t sub_1DA66FFC4()
{
  return MEMORY[0x1E0D7F068]();
}

uint64_t sub_1DA66FFD0()
{
  return MEMORY[0x1E0D7F070]();
}

uint64_t sub_1DA66FFDC()
{
  return MEMORY[0x1E0D7F078]();
}

uint64_t sub_1DA66FFE8()
{
  return MEMORY[0x1E0D7F088]();
}

uint64_t sub_1DA66FFF4()
{
  return MEMORY[0x1E0D7F090]();
}

uint64_t sub_1DA670000()
{
  return MEMORY[0x1E0D7F0A0]();
}

uint64_t sub_1DA67000C()
{
  return MEMORY[0x1E0D7F0A8]();
}

uint64_t sub_1DA670018()
{
  return MEMORY[0x1E0D7F0B0]();
}

uint64_t sub_1DA670024()
{
  return MEMORY[0x1E0D7F0B8]();
}

uint64_t sub_1DA670030()
{
  return MEMORY[0x1E0D7F0C0]();
}

uint64_t sub_1DA67003C()
{
  return MEMORY[0x1E0DC2D50]();
}

uint64_t sub_1DA670048()
{
  return MEMORY[0x1E0D7F0E0]();
}

uint64_t sub_1DA670054()
{
  return MEMORY[0x1E0D7F0E8]();
}

uint64_t sub_1DA670060()
{
  return MEMORY[0x1E0D7F0F0]();
}

uint64_t sub_1DA67006C()
{
  return MEMORY[0x1E0D7F0F8]();
}

uint64_t sub_1DA670078()
{
  return MEMORY[0x1E0C977C8]();
}

uint64_t sub_1DA670084()
{
  return MEMORY[0x1E0C977D0]();
}

uint64_t sub_1DA670090()
{
  return MEMORY[0x1E0C977D8]();
}

uint64_t sub_1DA67009C()
{
  return MEMORY[0x1E0C977E0]();
}

uint64_t sub_1DA6700A8()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1DA6700B4()
{
  return MEMORY[0x1E0DE94F0]();
}

uint64_t sub_1DA6700C0()
{
  return MEMORY[0x1E0D7F100]();
}

uint64_t sub_1DA6700CC()
{
  return MEMORY[0x1E0D47E18]();
}

uint64_t sub_1DA6700D8()
{
  return MEMORY[0x1E0C9B9E8]();
}

uint64_t sub_1DA6700E4()
{
  return MEMORY[0x1E0D7F110]();
}

uint64_t sub_1DA6700F0()
{
  return MEMORY[0x1E0DEF340]();
}

uint64_t sub_1DA6700FC()
{
  return MEMORY[0x1E0DC2FB0]();
}

uint64_t sub_1DA670108()
{
  return MEMORY[0x1E0D41700]();
}

uint64_t sub_1DA670114()
{
  return MEMORY[0x1E0D41708]();
}

uint64_t sub_1DA670120()
{
  return MEMORY[0x1E0D41718]();
}

uint64_t sub_1DA67012C()
{
  return MEMORY[0x1E0D41720]();
}

uint64_t sub_1DA670138()
{
  return MEMORY[0x1E0D41728]();
}

uint64_t sub_1DA670144()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1DA670150()
{
  return MEMORY[0x1E0CB20A0]();
}

uint64_t sub_1DA67015C()
{
  return MEMORY[0x1E0CB20B0]();
}

uint64_t sub_1DA670168()
{
  return MEMORY[0x1E0D41748]();
}

uint64_t sub_1DA670174()
{
  return MEMORY[0x1E0D7F118]();
}

uint64_t sub_1DA670180()
{
  return MEMORY[0x1E0D41750]();
}

uint64_t sub_1DA67018C()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1DA670198()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1DA6701A4()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1DA6701B0()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1DA6701BC()
{
  return MEMORY[0x1E0CB2168]();
}

uint64_t sub_1DA6701C8()
{
  return MEMORY[0x1E0CB2190]();
}

uint64_t sub_1DA6701D4()
{
  return MEMORY[0x1E0D41758]();
}

uint64_t sub_1DA6701E0()
{
  return MEMORY[0x1E0D41760]();
}

uint64_t sub_1DA6701EC()
{
  return MEMORY[0x1E0D7F120]();
}

uint64_t sub_1DA6701F8()
{
  return MEMORY[0x1E0D7F128]();
}

uint64_t sub_1DA670204()
{
  return MEMORY[0x1E0D7F130]();
}

uint64_t sub_1DA670210()
{
  return MEMORY[0x1E0D7F138]();
}

uint64_t sub_1DA67021C()
{
  return MEMORY[0x1E0D7F140]();
}

uint64_t sub_1DA670228()
{
  return MEMORY[0x1E0D7F148]();
}

uint64_t sub_1DA670234()
{
  return MEMORY[0x1E0CB22E8]();
}

uint64_t sub_1DA670240()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1DA67024C()
{
  return MEMORY[0x1E0DF22C8]();
}

uint64_t sub_1DA670258()
{
  return MEMORY[0x1E0D7F150]();
}

uint64_t sub_1DA670264()
{
  return MEMORY[0x1E0D7F158]();
}

uint64_t sub_1DA670270()
{
  return MEMORY[0x1E0D7F160]();
}

uint64_t sub_1DA67027C()
{
  return MEMORY[0x1E0D47E30]();
}

uint64_t sub_1DA670288()
{
  return MEMORY[0x1E0D7F168]();
}

uint64_t sub_1DA670294()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DA6702A0()
{
  return MEMORY[0x1E0DEBA00]();
}

uint64_t sub_1DA6702AC()
{
  return MEMORY[0x1E0DEBB60]();
}

uint64_t sub_1DA6702B8()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1DA6702C4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DA6702D0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DA6702DC()
{
  return MEMORY[0x1E0CB2400]();
}

uint64_t sub_1DA6702E8()
{
  return MEMORY[0x1E0CB2458]();
}

uint64_t sub_1DA6702F4()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1DA670300()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1DA67030C()
{
  return MEMORY[0x1E0CB2500]();
}

uint64_t sub_1DA670318()
{
  return MEMORY[0x1E0CB2528]();
}

uint64_t sub_1DA670324()
{
  return MEMORY[0x1E0CB2538]();
}

uint64_t sub_1DA670330()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1DA67033C()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1DA670348()
{
  return MEMORY[0x1E0DEFF58]();
}

uint64_t sub_1DA670354()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1DA670360()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1DA67036C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1DA670378()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DA670384()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1DA670390()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1DA67039C()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1DA6703A8()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1DA6703B4()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1DA6703C0()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1DA6703CC()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1DA6703D8()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1DA6703E4()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1DA6703F0()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1DA6703FC()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1DA670408()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1DA670414()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1DA670420()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1DA67042C()
{
  return MEMORY[0x1E0DEC290]();
}

uint64_t sub_1DA670438()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_1DA670444()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DA670450()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DA67045C()
{
  return MEMORY[0x1E0DEC2D0]();
}

uint64_t sub_1DA670468()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DA670474()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1DA670480()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1DA67048C()
{
  return MEMORY[0x1E0DEC508]();
}

uint64_t sub_1DA670498()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1DA6704A4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DA6704B0()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_1DA6704BC()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1DA6704C8()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1DA6704D4()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1DA6704E0()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1DA6704EC()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1DA6704F8()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1DA670504()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1DA670510()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1DA67051C()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1DA670528()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1DA670534()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1DA670540()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1DA67054C()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1DA670558()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1DA670564()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DA670570()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1DA67057C()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1DA670588()
{
  return MEMORY[0x1E0DECC10]();
}

uint64_t sub_1DA670594()
{
  return MEMORY[0x1E0DECC18]();
}

uint64_t sub_1DA6705A0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DA6705AC()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1DA6705B8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1DA6705C4()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1DA6705D0()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DA6705DC()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DA6705E8()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_1DA6705F4()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1DA670600()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1DA67060C()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1DA670618()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1DA670624()
{
  return MEMORY[0x1E0DECFE8]();
}

uint64_t sub_1DA670630()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1DA67063C()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1DA670648()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1DA670654()
{
  return MEMORY[0x1E0DED118]();
}

uint64_t sub_1DA670660()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1DA67066C()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1DA670678()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1DA670684()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DA670690()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1DA67069C()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1DA6706A8()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_1DA6706B4()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t sub_1DA6706C0()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1DA6706CC()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_1DA6706D8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DA6706E4()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1DA6706F0()
{
  return MEMORY[0x1E0DED6C8]();
}

uint64_t sub_1DA6706FC()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1DA670708()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1DA670714()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1DA670720()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t sub_1DA67072C()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1DA670738()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1DA670744()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1DA670750()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1DA67075C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DA670768()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DA670774()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DA670780()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DA67078C()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1DA670798()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DA6707A4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DA6707B0()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1DA6707BC()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1DA6707C8()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1DA6707D4()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1DA6707E0()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1DA6707EC()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1DA6707F8()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1DA670804()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1DA670810()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1DA67081C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1DA670828()
{
  return MEMORY[0x1E0DEE978]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFStringTokenizerCopyBestStringLanguage(CFStringRef string, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99210](string, range.location, range.length);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x1E0C9C030](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x1E0C9C470](c, lengths, count, phase);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA80](space, components, locations, count);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC318](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9CC38](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5A0](provider, options);
}

uint64_t CGImageSourceCreateWithFile()
{
  return MEMORY[0x1E0CBC5A8]();
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC5F0](isrc);
}

CGImageSourceStatus CGImageSourceGetStatus(CGImageSourceRef isrc)
{
  return MEMORY[0x1E0CBC600](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x1E0CBC618](isrc);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x1E0C9D288](path, m, x1, y1, x2, y2, radius);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x1E0C9D810]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

uint64_t IMAccessibilityLocalizedNumber()
{
  return MEMORY[0x1E0D7F170]();
}

uint64_t JECountFormatterMakeStringFromNumber()
{
  return MEMORY[0x1E0D41778]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MTPodcastHidesPlayedEpisodesResolved()
{
  return MEMORY[0x1E0D7F1B8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0DC44E8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0DC4BB8]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0DC4C00]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0DC4C08](context);
}

NSData *__cdecl UIImageHEICRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C50](image);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0DC4C58](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo)
{
  MEMORY[0x1E0DC4CE8](image, completionTarget, completionSelector, contextInfo);
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0DC5268]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x1E0DC52A0](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UISColorLuminance()
{
  return MEMORY[0x1E0DC5CA8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _MTLogCategoryArtworkDownload()
{
  return MEMORY[0x1E0D7F2A0]();
}

uint64_t _MTLogCategoryDefault()
{
  return MEMORY[0x1E0D7F2A8]();
}

uint64_t _MTLogCategoryDownload()
{
  return MEMORY[0x1E0D7F2B0]();
}

uint64_t _MTLogCategoryNetwork()
{
  return MEMORY[0x1E0D7F2B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1EA0C4078(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA0C4080(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x1E0DE7A50](cls, name, imp, types);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

IMP imp_implementationWithBlock(id block)
{
  return (IMP)MEMORY[0x1E0DE7B10](block);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t lrintf(float a1)
{
  return MEMORY[0x1E0C83C20](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x1E0DE7B40](m, *(_QWORD *)&index);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

unsigned int method_getNumberOfArguments(Method m)
{
  return MEMORY[0x1E0DE7B78](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x1E0DE7B88](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

uint64_t os_feature_enabled_bluemoon()
{
  return MEMORY[0x1E0D7F3E8]();
}

uint64_t os_feature_enabled_red_sun()
{
  return MEMORY[0x1E0D7F3F0]();
}

uint64_t os_feature_enabled_rewind_on_interruption()
{
  return MEMORY[0x1E0D7F3F8]();
}

uint64_t os_feature_enabled_serial_sort_auto_downloads()
{
  return MEMORY[0x1E0D7F400]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get()
{
  return MEMORY[0x1E0DF0F78]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x1E0DF0F80]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x1E0DEECF0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x1E0DEED80]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

UCharDirection u_charDirection(UChar32 c)
{
  return MEMORY[0x1E0DE5960](*(_QWORD *)&c);
}

int uname(utsname *a1)
{
  return MEMORY[0x1E0C859A0](a1);
}

