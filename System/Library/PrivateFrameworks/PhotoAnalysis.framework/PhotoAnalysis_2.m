uint64_t sub_1CAD4229C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  _QWORD *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 536) + 136) + 16);
  *(_QWORD *)(v0 + 600) = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v11 = sub_1CADC3F98();
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 608) = v11;
    if (v11)
      goto LABEL_3;
LABEL_9:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x1E0DEE9E0]);
  }
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 608) = v2;
  if (!v2)
    goto LABEL_9;
LABEL_3:
  *(_QWORD *)(v0 + 616) = 0xC000000000000000;
  *(_QWORD *)(v0 + 624) = MEMORY[0x1E0DEE9E0];
  v4 = *(_QWORD *)(v0 + 600);
  if ((v4 & 0xC000000000000001) != 0)
  {
    v5 = MEMORY[0x1D1797A7C](0);
LABEL_7:
    *(_QWORD *)(v0 + 632) = v5;
    *(_QWORD *)(v0 + 640) = 1;
    v6 = *(_QWORD *)(v5 + 40);
    v7 = *(_QWORD *)(v5 + 48);
    v8 = *(_QWORD *)(*(_QWORD *)(v0 + 536) + 120);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
    *(_QWORD *)(v0 + 40) = v6;
    *(_QWORD *)(v0 + 48) = v7;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    swift_retain();
    v9(v8, v6, v7);
    v12 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v7 + 40) + *(_QWORD *)(v7 + 40));
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 648) = v10;
    *v10 = v0;
    v10[1] = sub_1CAD42474;
    return v12(v6, v7);
  }
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v5 = swift_retain();
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CAD42474(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 656) = a1;
  *(_QWORD *)(v3 + 664) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1CAD42518()
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
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
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
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t, uint64_t);
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  uint64_t v57;

  v1 = *(_QWORD *)(v0 + 656);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 672) = v2;
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 656);
    *(_QWORD *)(v0 + 696) = 0;
    v4 = MEMORY[0x1E0DEE9E0];
    *(_QWORD *)(v0 + 688) = MEMORY[0x1E0DEE9E0];
    *(_QWORD *)(v0 + 680) = v4;
    v5 = v3 + 32;
    swift_bridgeObjectRetain();
    sub_1CAC1F9EC(v5, v0 + 56);
    v6 = *(_QWORD *)(v0 + 80);
    v7 = *(_QWORD *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v6);
    (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v6, v7);
    v8 = *(_QWORD *)(v0 + 120);
    v9 = *(_QWORD *)(v0 + 128);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), v8);
    *(_QWORD *)(v0 + 704) = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 56))(v8, v9);
    *(_QWORD *)(v0 + 712) = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0) - 8)
                                      + 64);
    *(_QWORD *)(v0 + 720) = swift_task_alloc();
    v10 = *(_QWORD *)(v0 + 80);
    v11 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 728) = v10;
    *(_QWORD *)(v0 + 736) = v11;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v10);
    *(_QWORD *)(v0 + 160) = v10;
    *(_QWORD *)(v0 + 168) = v11;
    *(_QWORD *)(v0 + 744) = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
    (*(void (**)(void))(*(_QWORD *)(v10 - 8) + 16))();
    return swift_task_switch();
  }
  v52 = *(_QWORD *)(v0 + 632);
  v53 = *(_QWORD *)(v0 + 624);
  v54 = *(_QWORD *)(v0 + 608);
  v55 = *(_QWORD *)(v0 + 640);
  v13 = MEMORY[0x1E0DEE9E0];
  v14 = *(_QWORD *)(MEMORY[0x1E0DEE9E0] + 16);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED855630);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1CADCAB00;
  v16 = MEMORY[0x1E0DEB100];
  *(_QWORD *)(v15 + 56) = MEMORY[0x1E0DEB070];
  *(_QWORD *)(v15 + 64) = v16;
  *(double *)(v15 + 32) = (double)-v14 / 0.0 * 100.0;
  *(_QWORD *)(v0 + 472) = sub_1CADC38F0();
  *(_QWORD *)(v0 + 480) = v17;
  sub_1CADC3920();
  v18 = *(_QWORD *)(v0 + 472);
  v19 = *(_QWORD *)(v0 + 480);
  *(_QWORD *)(v0 + 272) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v0 + 248) = v18;
  *(_QWORD *)(v0 + 256) = v19;
  sub_1CAC47240((_OWORD *)(v0 + 248), (_OWORD *)(v0 + 312));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v57 = v13;
  v21 = v13;
  v22 = *(_QWORD *)(v0 + 336);
  v23 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 312, v22);
  v24 = *(_QWORD *)(v22 - 8);
  v25 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v24 + 16))(v25, v23, v22);
  sub_1CAD50B14(*v25, v25[1], 0xD000000000000010, 0x80000001CADD6340, isUniquelyReferenced_nonNull_native, &v57);
  __swift_destroy_boxed_opaque_existential_1(v0 + 312);
  swift_task_dealloc();
  v26 = v57;
  swift_bridgeObjectRelease();
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981E38);
  *(_QWORD *)(v0 + 216) = v21;
  *(_QWORD *)(v0 + 240) = v27;
  sub_1CAC47240((_OWORD *)(v0 + 216), (_OWORD *)(v0 + 376));
  LOBYTE(v24) = swift_isUniquelyReferenced_nonNull_native();
  v57 = v26;
  v28 = *(_QWORD *)(v0 + 400);
  v29 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 376, v28);
  v30 = *(_QWORD *)(v28 - 8);
  v31 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v30 + 16))(v31, v29, v28);
  sub_1CAD50CDC(*v31, 0xD00000000000001ALL, 0x80000001CADD6360, v24, &v57, &qword_1EF981E38);
  __swift_destroy_boxed_opaque_existential_1(v0 + 376);
  swift_task_dealloc();
  v32 = v57;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 432) = v27;
  *(_QWORD *)(v0 + 408) = MEMORY[0x1E0DEE9E0];
  sub_1CAC47240((_OWORD *)(v0 + 408), (_OWORD *)(v0 + 440));
  LOBYTE(v24) = swift_isUniquelyReferenced_nonNull_native();
  v57 = v32;
  v33 = *(_QWORD *)(v0 + 464);
  v34 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 440, v33);
  v35 = *(_QWORD *)(v33 - 8);
  v36 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v35 + 16))(v36, v34, v33);
  sub_1CAD50CDC(*v36, 0x206575647265764FLL, 0xED0000736B736174, v24, &v57, &qword_1EF981E38);
  __swift_destroy_boxed_opaque_existential_1(v0 + 440);
  swift_task_dealloc();
  v37 = v57;
  swift_bridgeObjectRelease();
  v38 = *(_QWORD *)(v52 + 24);
  v39 = *(_QWORD *)(v52 + 32);
  *(_QWORD *)(v0 + 368) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8555A0);
  *(_QWORD *)(v0 + 344) = v37;
  sub_1CAC47240((_OWORD *)(v0 + 344), (_OWORD *)(v0 + 280));
  swift_bridgeObjectRetain();
  LOBYTE(v37) = swift_isUniquelyReferenced_nonNull_native();
  v57 = v53;
  v40 = *(_QWORD *)(v0 + 304);
  v41 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 280, v40);
  v42 = *(_QWORD *)(v40 - 8);
  v43 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v42 + 16))(v43, v41, v40);
  sub_1CAD50CDC(*v43, v38, v39, v37, &v57, (uint64_t *)&unk_1ED8555A0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 280);
  swift_task_dealloc();
  v44 = v57;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_release();
  if (v55 == v54)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v44);
  }
  v45 = *(_QWORD *)(v0 + 640);
  *(_QWORD *)(v0 + 624) = v44;
  v46 = *(_QWORD *)(v0 + 600);
  if ((v46 & 0xC000000000000001) != 0)
  {
    result = MEMORY[0x1D1797A7C](v45);
  }
  else
  {
    if (v45 >= *(_QWORD *)((v46 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_12;
    result = swift_retain();
  }
  *(_QWORD *)(v0 + 632) = result;
  *(_QWORD *)(v0 + 640) = v45 + 1;
  if (!__OFADD__(v45, 1))
  {
    v47 = *(_QWORD *)(result + 40);
    v48 = *(_QWORD *)(result + 48);
    v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 32);
    *(_QWORD *)(v0 + 40) = v47;
    *(_QWORD *)(v0 + 48) = v48;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    v50 = swift_retain();
    v49(v50, v47, v48);
    v56 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v48 + 40) + *(_QWORD *)(v48 + 40));
    v51 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 648) = v51;
    *v51 = v0;
    v51[1] = sub_1CAD42474;
    return v56(v47, v48);
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_1CAD42BCC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
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

  v1 = v0[92];
  v2 = v0[91];
  v3 = (uint64_t *)v0[68];
  sub_1CAD0C9E8(v3);
  v4 = *v3;
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v2, v1);
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = sub_1CAC5C38C(v5, v6);
    v8 = v0[72];
    v9 = v0[71];
    v10 = v0[69];
    if ((v11 & 1) != 0)
    {
      sub_1CAC614B0(*(_QWORD *)(v4 + 56) + *(_QWORD *)(v8 + 72) * v7, v0[69], type metadata accessor for TaskRecord);
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
      v12(v10, 0, 1, v9);
    }
    else
    {
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
      v12(v0[69], 1, 1, v9);
    }
  }
  else
  {
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[72] + 56);
    v12(v0[69], 1, 1, v0[71]);
  }
  v13 = v0[72];
  v14 = v0[71];
  v15 = v0[69];
  v16 = v0[68];
  swift_bridgeObjectRelease();
  sub_1CAD05E80(v16, type metadata accessor for TaskRecords);
  v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (v17(v15, 1, v14) == 1)
  {
    v18 = v0[71];
    v19 = v0[70];
    sub_1CAC199B4(v0[69], qword_1ED856A20);
    v12(v19, 1, 1, v18);
  }
  else
  {
    v20 = v0[92];
    v21 = v0[91];
    v22 = (uint64_t *)v0[73];
    sub_1CAC3815C(v0[69], (uint64_t)v22, type metadata accessor for TaskRecord);
    v23 = *v22;
    v24 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 48))(v21, v20);
    v25 = v0[73];
    if (v23 == v24)
    {
      sub_1CAC3815C(v25, v0[70], type metadata accessor for TaskRecord);
      v26 = 0;
    }
    else
    {
      sub_1CAD05E80(v25, type metadata accessor for TaskRecord);
      v26 = 1;
    }
    v27 = v0[71];
    v28 = v0[70];
    v12(v28, v26, 1, v27);
    if (v17(v28, 1, v27) != 1)
    {
      v31 = v0[90];
      v32 = v0[74];
      v33 = v0[71];
      sub_1CAC3815C(v0[70], v32, type metadata accessor for TaskRecord);
      v34 = v32 + *(int *)(v33 + 20);
      v35 = sub_1CADC2BF4();
      v36 = *(_QWORD *)(v35 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v31, v34, v35);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v36 + 56))(v31, 0, 1, v35);
      goto LABEL_15;
    }
  }
  v29 = v0[90];
  sub_1CAC199B4(v0[70], qword_1ED856A20);
  v30 = sub_1CADC2BF4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 1, 1, v30);
LABEL_15:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  return swift_task_switch();
}

uint64_t sub_1CAD42E88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[10];
  v2 = v0[11];
  v0[94] = v1;
  v0[95] = v2;
  __swift_project_boxed_opaque_existential_1(v0 + 7, v1);
  v0[25] = v1;
  v0[26] = v2;
  v0[96] = __swift_allocate_boxed_opaque_existential_1(v0 + 22);
  (*(void (**)(void))(*(_QWORD *)(v1 - 8) + 16))();
  return swift_task_switch();
}

uint64_t sub_1CAD42F14()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 776) = sub_1CAD101AC(*(_QWORD *)(v0 + 768), *(_BYTE **)(v0 + 704), *(_QWORD *)(v0 + 752), *(_QWORD *)(v0 + 760)) & 1;
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  return swift_task_switch();
}

uint64_t sub_1CAD42F74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  void (*v14)(uint64_t, uint64_t);
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t result;
  char v27;
  _QWORD *v28;
  unint64_t *v29;
  uint64_t *v30;
  unint64_t *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  _QWORD *v51;
  unint64_t *v52;
  uint64_t *v53;
  unint64_t *v54;
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
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t, uint64_t, uint64_t);
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  uint64_t v115;

  v112 = (_QWORD *)(v0 + 56);
  if ((*(_BYTE *)(v0 + 776) & 1) == 0)
  {
    v111 = *(_QWORD **)(v0 + 680);
    goto LABEL_18;
  }
  v1 = *(_QWORD *)(v0 + 720);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v2);
  v4 = (*(double (**)(uint64_t, uint64_t))(v3 + 56))(v2, v3);
  v5 = sub_1CADC2BF4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = swift_task_alloc();
  v8 = swift_task_alloc();
  sub_1CAC471FC(v1, v8, &qword_1ED8562D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v5) == 1)
  {
    sub_1CAC199B4(v8, &qword_1ED8562D0);
    swift_task_dealloc();
    v9 = 0xEA00000000002E6ELL;
    v10 = 0x617220726576654ELL;
  }
  else
  {
    v11 = *(double *)(v0 + 616);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v7, v8, v5);
    swift_task_dealloc();
    if (v4 == v11)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v5);
      v9 = 0xEA00000000002E79;
      v10 = 0x61646F7420657544;
    }
    else
    {
      LOBYTE(v8) = v0 - 8;
      v12 = swift_task_alloc();
      sub_1CADC2B7C();
      *(_QWORD *)(v0 + 504) = 0x636E697320657544;
      *(_QWORD *)(v0 + 512) = 0xEA00000000002065;
      sub_1CADC2BB8();
      sub_1CAD13F6C(fabs(v13));
      sub_1CADC3920();
      swift_bridgeObjectRelease();
      sub_1CADC3920();
      v10 = *(_QWORD *)(v0 + 504);
      v14 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
      v9 = *(_QWORD *)(v0 + 512);
      v14(v12, v5);
      v14(v7, v5);
      swift_task_dealloc();
    }
  }
  v15 = *(_QWORD **)(v0 + 680);
  swift_task_dealloc();
  v16 = *(_QWORD *)(v0 + 80);
  v17 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v16);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 32))(v16, v17);
  v20 = v19;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v0 + 528) = v15;
  v23 = sub_1CAC5C38C(v18, v20);
  v24 = v15[2];
  v25 = (v22 & 1) == 0;
  result = v24 + v25;
  if (__OFADD__(v24, v25))
    goto LABEL_43;
  LOBYTE(v8) = v22;
  v15 = (_QWORD *)(v0 + 528);
  if (*(_QWORD *)(*(_QWORD *)(v0 + 680) + 24) < result)
  {
    sub_1CAD475C8(result, isUniquelyReferenced_nonNull_native);
    result = sub_1CAC5C38C(v18, v20);
    if ((v8 & 1) == (v27 & 1))
    {
      v23 = result;
      goto LABEL_13;
    }
    return sub_1CADC4130();
  }
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_45;
  while (1)
  {
LABEL_13:
    v28 = (_QWORD *)*v15;
    v111 = (_QWORD *)*v15;
    if ((v8 & 1) != 0)
    {
      v29 = (unint64_t *)(v28[7] + 16 * v23);
      swift_bridgeObjectRelease();
      *v29 = v10;
      v29[1] = v9;
    }
    else
    {
      v28[(v23 >> 6) + 8] |= 1 << v23;
      v30 = (uint64_t *)(v28[6] + 16 * v23);
      *v30 = v18;
      v30[1] = v20;
      v31 = (unint64_t *)(v28[7] + 16 * v23);
      *v31 = v10;
      v31[1] = v9;
      v32 = v28[2];
      v33 = __OFADD__(v32, 1);
      v34 = v32 + 1;
      if (v33)
      {
        __break(1u);
        goto LABEL_47;
      }
      v28[2] = v34;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_18:
    v8 = *(_QWORD *)(v0 + 720);
    v35 = sub_1CADC2BF4();
    v36 = *(_QWORD *)(v35 - 8);
    v37 = swift_task_alloc();
    v38 = swift_task_alloc();
    sub_1CAC471FC(v8, v38, &qword_1ED8562D0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v38, 1, v35) == 1)
    {
      sub_1CAC199B4(v38, &qword_1ED8562D0);
      swift_task_dealloc();
      v10 = 0xE500000000000000;
      v9 = 0x726576654ELL;
    }
    else
    {
      LOBYTE(v8) = v0 - 24;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v37, v38, v35);
      swift_task_dealloc();
      sub_1CADC2BB8();
      sub_1CAD13F6C(fabs(v39));
      sub_1CACAA1E4();
      *(_QWORD *)(v0 + 488) = sub_1CADC40AC();
      *(_QWORD *)(v0 + 496) = v40;
      sub_1CADC3920();
      sub_1CADC3920();
      swift_bridgeObjectRelease();
      sub_1CADC3920();
      v9 = *(_QWORD *)(v0 + 488);
      v10 = *(_QWORD *)(v0 + 496);
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v35);
    }
    v15 = *(_QWORD **)(v0 + 688);
    swift_task_dealloc();
    v41 = *(_QWORD *)(v0 + 80);
    v42 = *(_QWORD *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1(v112, v41);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 32))(v41, v42);
    v20 = v43;
    v44 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v0 + 520) = v15;
    v23 = sub_1CAC5C38C(v18, v20);
    v46 = v15[2];
    v47 = (v45 & 1) == 0;
    v48 = v46 + v47;
    if (__OFADD__(v46, v47))
    {
      __break(1u);
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    LOBYTE(v8) = v45;
    v15 = (_QWORD *)(v0 + 520);
    if (*(_QWORD *)(*(_QWORD *)(v0 + 688) + 24) >= v48)
    {
      if ((v44 & 1) == 0)
        sub_1CAD4C820();
    }
    else
    {
      sub_1CAD475C8(v48, v44);
      v49 = sub_1CAC5C38C(v18, v20);
      if ((v8 & 1) != (v50 & 1))
        return sub_1CADC4130();
      v23 = v49;
    }
    v51 = (_QWORD *)*v15;
    if ((v8 & 1) != 0)
    {
      v52 = (unint64_t *)(v51[7] + 16 * v23);
      swift_bridgeObjectRelease();
      *v52 = v9;
      v52[1] = v10;
      goto LABEL_32;
    }
    v51[(v23 >> 6) + 8] |= 1 << v23;
    v53 = (uint64_t *)(v51[6] + 16 * v23);
    *v53 = v18;
    v53[1] = v20;
    v54 = (unint64_t *)(v51[7] + 16 * v23);
    *v54 = v9;
    v54[1] = v10;
    v55 = v51[2];
    v33 = __OFADD__(v55, 1);
    v56 = v55 + 1;
    if (!v33)
      break;
LABEL_44:
    __break(1u);
LABEL_45:
    result = (uint64_t)sub_1CAD4C820();
  }
  v51[2] = v56;
  swift_bridgeObjectRetain();
LABEL_32:
  v57 = *(_QWORD *)(v0 + 720);
  v58 = *(_QWORD *)(v0 + 696);
  v59 = *(_QWORD *)(v0 + 672);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1CAC199B4(v57, &qword_1ED8562D0);
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
  if (v58 + 1 != v59)
  {
    v94 = *(_QWORD *)(v0 + 696) + 1;
    *(_QWORD *)(v0 + 696) = v94;
    *(_QWORD *)(v0 + 688) = v51;
    *(_QWORD *)(v0 + 680) = v111;
    sub_1CAC1F9EC(*(_QWORD *)(v0 + 656) + 40 * v94 + 32, (uint64_t)v112);
    v95 = *(_QWORD *)(v0 + 80);
    v96 = *(_QWORD *)(v0 + 88);
    __swift_project_boxed_opaque_existential_1(v112, v95);
    (*(void (**)(uint64_t, uint64_t))(v96 + 24))(v95, v96);
    v97 = *(_QWORD *)(v0 + 120);
    v98 = *(_QWORD *)(v0 + 128);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), v97);
    *(_QWORD *)(v0 + 704) = (*(uint64_t (**)(uint64_t, uint64_t))(v98 + 56))(v97, v98);
    *(_QWORD *)(v0 + 712) = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0) - 8)
                                      + 64);
    *(_QWORD *)(v0 + 720) = swift_task_alloc();
    v99 = *(_QWORD *)(v0 + 80);
    v100 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 728) = v99;
    *(_QWORD *)(v0 + 736) = v100;
    __swift_project_boxed_opaque_existential_1(v112, v99);
    *(_QWORD *)(v0 + 160) = v99;
    *(_QWORD *)(v0 + 168) = v100;
    *(_QWORD *)(v0 + 744) = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
    (*(void (**)(void))(*(_QWORD *)(v99 - 8) + 16))();
    return swift_task_switch();
  }
  v60 = *(_QWORD *)(v0 + 656);
  swift_bridgeObjectRelease();
  v61 = *(_QWORD *)(v60 + 16);
  v113 = *(_QWORD *)(v0 + 640);
  v108 = *(_QWORD *)(v0 + 632);
  v109 = *(_QWORD *)(v0 + 624);
  v110 = *(_QWORD *)(v0 + 608);
  v62 = v111[2];
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED855630);
  v63 = swift_allocObject();
  *(_OWORD *)(v63 + 16) = xmmword_1CADCAB00;
  v64 = MEMORY[0x1E0DEB100];
  *(_QWORD *)(v63 + 56) = MEMORY[0x1E0DEB070];
  *(_QWORD *)(v63 + 64) = v64;
  *(double *)(v63 + 32) = (double)(v61 - v62) / (double)v61 * 100.0;
  *(_QWORD *)(v0 + 472) = sub_1CADC38F0();
  *(_QWORD *)(v0 + 480) = v65;
  sub_1CADC3920();
  v66 = *(_QWORD *)(v0 + 472);
  v67 = *(_QWORD *)(v0 + 480);
  *(_QWORD *)(v0 + 272) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v0 + 248) = v66;
  *(_QWORD *)(v0 + 256) = v67;
  sub_1CAC47240((_OWORD *)(v0 + 248), (_OWORD *)(v0 + 312));
  v68 = MEMORY[0x1E0DEE9E0];
  v69 = swift_isUniquelyReferenced_nonNull_native();
  v115 = v68;
  v70 = *(_QWORD *)(v0 + 336);
  v71 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 312, v70);
  v72 = *(_QWORD *)(v70 - 8);
  v73 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v72 + 16))(v73, v71, v70);
  sub_1CAD50B14(*v73, v73[1], 0xD000000000000010, 0x80000001CADD6340, v69, &v115);
  __swift_destroy_boxed_opaque_existential_1(v0 + 312);
  swift_task_dealloc();
  v74 = v115;
  swift_bridgeObjectRelease();
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981E38);
  *(_QWORD *)(v0 + 240) = v75;
  *(_QWORD *)(v0 + 216) = v51;
  sub_1CAC47240((_OWORD *)(v0 + 216), (_OWORD *)(v0 + 376));
  v76 = swift_isUniquelyReferenced_nonNull_native();
  v115 = v74;
  v77 = *(_QWORD *)(v0 + 400);
  v78 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 376, v77);
  v79 = *(_QWORD *)(v77 - 8);
  v80 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v79 + 16))(v80, v78, v77);
  sub_1CAD50CDC(*v80, 0xD00000000000001ALL, 0x80000001CADD6360, v76, &v115, &qword_1EF981E38);
  __swift_destroy_boxed_opaque_existential_1(v0 + 376);
  swift_task_dealloc();
  v81 = v115;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 432) = v75;
  *(_QWORD *)(v0 + 408) = v111;
  sub_1CAC47240((_OWORD *)(v0 + 408), (_OWORD *)(v0 + 440));
  LOBYTE(v75) = swift_isUniquelyReferenced_nonNull_native();
  v115 = v81;
  v82 = *(_QWORD *)(v0 + 464);
  v83 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 440, v82);
  v84 = *(_QWORD *)(v82 - 8);
  v85 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v84 + 16))(v85, v83, v82);
  sub_1CAD50CDC(*v85, 0x206575647265764FLL, 0xED0000736B736174, v75, &v115, &qword_1EF981E38);
  __swift_destroy_boxed_opaque_existential_1(v0 + 440);
  swift_task_dealloc();
  v86 = v115;
  swift_bridgeObjectRelease();
  v87 = *(_QWORD *)(v108 + 24);
  v88 = *(_QWORD *)(v108 + 32);
  *(_QWORD *)(v0 + 368) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8555A0);
  *(_QWORD *)(v0 + 344) = v86;
  sub_1CAC47240((_OWORD *)(v0 + 344), (_OWORD *)(v0 + 280));
  swift_bridgeObjectRetain();
  LOBYTE(v86) = swift_isUniquelyReferenced_nonNull_native();
  v115 = v109;
  v89 = *(_QWORD *)(v0 + 304);
  v90 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 280, v89);
  v91 = *(_QWORD *)(v89 - 8);
  v92 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v91 + 16))(v92, v90, v89);
  sub_1CAD50CDC(*v92, v87, v88, v86, &v115, (uint64_t *)&unk_1ED8555A0);
  __swift_destroy_boxed_opaque_existential_1(v0 + 280);
  swift_task_dealloc();
  v93 = v115;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_release();
  if (v113 == v110)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v93);
  }
  v101 = *(_QWORD *)(v0 + 640);
  *(_QWORD *)(v0 + 624) = v93;
  v102 = *(_QWORD *)(v0 + 600);
  if ((v102 & 0xC000000000000001) != 0)
  {
    result = MEMORY[0x1D1797A7C](v101);
  }
  else
  {
    if (v101 >= *(_QWORD *)((v102 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_48;
    result = swift_retain();
  }
  *(_QWORD *)(v0 + 632) = result;
  *(_QWORD *)(v0 + 640) = v101 + 1;
  if (!__OFADD__(v101, 1))
  {
    v103 = *(_QWORD *)(result + 40);
    v104 = *(_QWORD *)(result + 48);
    v105 = *(_QWORD *)(*(_QWORD *)(v0 + 536) + 120);
    v106 = *(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32);
    *(_QWORD *)(v0 + 40) = v103;
    *(_QWORD *)(v0 + 48) = v104;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    swift_retain();
    v106(v105, v103, v104);
    v114 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v104 + 40) + *(_QWORD *)(v104 + 40));
    v107 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 648) = v107;
    *v107 = v0;
    v107[1] = sub_1CAD42474;
    return v114(v103, v104);
  }
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_1CAD43C54()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAD43CE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_1CAD43CF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13PhotoAnalysis9Executive_stateHolder);
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC13PhotoAnalysis11StateHolder_state) == 2)
  {
    swift_beginAccess();
    v3 = swift_retain();
    MEMORY[0x1D1797554](v3);
    if (*(_QWORD *)((*(_QWORD *)(v1 + 152) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 152) & 0xFFFFFFFFFFFFFF8)
                                                                                        + 0x18) >> 1)
      sub_1CADC39F8();
    sub_1CADC3A10();
    sub_1CADC39EC();
    swift_endAccess();
    return swift_task_switch();
  }
  else
  {
    v6 = *(_QWORD *)(v2 + 16);
    v5 = *(_QWORD *)(v2 + 24);
    sub_1CAC46384();
    swift_allocError();
    *(_QWORD *)v7 = v6;
    *(_QWORD *)(v7 + 8) = v5;
    *(_BYTE *)(v7 + 16) = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD43E34()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC13PhotoAnalysis15ServiceProvider_stateHolder);
  v4 = (uint64_t (*)(uint64_t))((char *)&dword_1EF9828C8 + dword_1EF9828C8);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_1CAD43EA4;
  return v4(v1);
}

uint64_t sub_1CAD43EA4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAD43EF0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 + 80) = a4;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_1CAD43F10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13PhotoAnalysis9Executive_stateHolder);
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC13PhotoAnalysis11StateHolder_state) == 2)
  {
    *(_QWORD *)(v0 + 48) = *(_QWORD *)(v1 + 120);
    return swift_task_switch();
  }
  else
  {
    v5 = *(_QWORD *)(v2 + 16);
    v4 = *(_QWORD *)(v2 + 24);
    sub_1CAC46384();
    swift_allocError();
    *(_QWORD *)v6 = v5;
    *(_QWORD *)(v6 + 8) = v4;
    *(_BYTE *)(v6 + 16) = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD43FD0()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = sub_1CAC37E98(v0[2]);
  v0[7] = v1;
  v4 = (uint64_t (*)(uint64_t))((char *)&dword_1EF982B58 + dword_1EF982B58);
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_1CAD44044;
  return v4(v1);
}

uint64_t sub_1CAD44044(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1CAD440C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t *v6;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 128);
  v5 = *(unsigned __int8 *)(v0 + 80);
  type metadata accessor for LegacyStorytellingService();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  v6 = sub_1CACF4C8C(v3, v2, v1, v4, v5);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t *))(v0 + 8))(v6);
}

uint64_t sub_1CAD44174(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 + 64) = a4;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_1CAD44194()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC13PhotoAnalysis9Executive_stateHolder);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13PhotoAnalysis11StateHolder_state) == 2)
  {
    v7 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985050 + dword_1EF985050);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v2;
    *v2 = v0;
    v2[1] = sub_1CAD44280;
    return v7(*(_QWORD *)(v0 + 16));
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 16);
    v4 = *(_QWORD *)(v1 + 24);
    sub_1CAC46384();
    swift_allocError();
    *(_QWORD *)v6 = v5;
    *(_QWORD *)(v6 + 8) = v4;
    *(_BYTE *)(v6 + 16) = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD44280(uint64_t a1)
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
  *(_QWORD *)(v4 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_1CAD442FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t *v6;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 128);
  v5 = *(unsigned __int8 *)(v0 + 64);
  type metadata accessor for PhotoLibraryService();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  v6 = sub_1CAC2D2A8(v3, v2, v1, v4, v5);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t *))(v0 + 8))(v6);
}

uint64_t sub_1CAD443A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 + 80) = a4;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_1CAD443C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13PhotoAnalysis9Executive_stateHolder);
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC13PhotoAnalysis11StateHolder_state) == 2)
  {
    *(_QWORD *)(v0 + 48) = *(_QWORD *)(v1 + 120);
    return swift_task_switch();
  }
  else
  {
    v5 = *(_QWORD *)(v2 + 16);
    v4 = *(_QWORD *)(v2 + 24);
    sub_1CAC46384();
    swift_allocError();
    *(_QWORD *)v6 = v5;
    *(_QWORD *)(v6 + 8) = v4;
    *(_BYTE *)(v6 + 16) = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD44488()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(uint64_t);

  v1 = sub_1CAC37E98(v0[2]);
  v0[7] = v1;
  v4 = (uint64_t (*)(uint64_t))((char *)&dword_1EF982AB0 + dword_1EF982AB0);
  v2 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_1CAD444FC;
  return v4(v1);
}

uint64_t sub_1CAD444FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1CAD44580()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t *v6;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 128);
  v5 = *(unsigned __int8 *)(v0 + 80);
  type metadata accessor for MomentGraphService();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  v6 = sub_1CACCAFD8(v3, v2, v1, v4, v5);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t *))(v0 + 8))(v6);
}

uint64_t sub_1CAD4462C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v5 + 64) = a4;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = v4;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_1CAD4464C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC13PhotoAnalysis9Executive_stateHolder);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC13PhotoAnalysis11StateHolder_state) == 2)
  {
    v7 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985048 + dword_1EF985048);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v2;
    *v2 = v0;
    v2[1] = sub_1CAD44738;
    return v7(*(_QWORD *)(v0 + 16));
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 16);
    v4 = *(_QWORD *)(v1 + 24);
    sub_1CAC46384();
    swift_allocError();
    *(_QWORD *)v6 = v5;
    *(_QWORD *)(v6 + 8) = v4;
    *(_BYTE *)(v6 + 16) = 0;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD44738(uint64_t a1)
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
  *(_QWORD *)(v4 + 56) = a1;
  return swift_task_switch();
}

uint64_t sub_1CAD447B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t *v6;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 128);
  v5 = *(unsigned __int8 *)(v0 + 64);
  type metadata accessor for TestService();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  v6 = sub_1CACAC054(v3, v2, v1, v4, v5);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t *))(v0 + 8))(v6);
}

uint64_t sub_1CAD44860()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 648) = v0;
  return swift_task_switch();
}

uint64_t sub_1CAD44878()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v1 = v0[81];
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 152);
  v0[82] = v2;
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    v0[83] = v3;
    if (v3)
      goto LABEL_3;
LABEL_9:
    v0[89] = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRelease();
    v8 = (_QWORD *)swift_task_alloc();
    v0[90] = v8;
    *v8 = v0;
    v8[1] = sub_1CAD44BA0;
    return sub_1CAD421D8();
  }
  swift_bridgeObjectRetain();
  result = sub_1CADC3F98();
  v3 = result;
  v0[83] = result;
  if (!result)
    goto LABEL_9;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    v0[85] = MEMORY[0x1E0DEE9D8];
    v0[84] = 0;
    v5 = v0[82];
    if ((v5 & 0xC000000000000001) != 0)
    {
      v6 = MEMORY[0x1D1797A7C](0);
    }
    else
    {
      v6 = *(_QWORD *)(v5 + 32);
      swift_retain();
    }
    v0[86] = v6;
    v7 = (_QWORD *)swift_task_alloc();
    v0[87] = v7;
    *v7 = v0;
    v7[1] = sub_1CAD449AC;
    return sub_1CAC39A34();
  }
  return result;
}

uint64_t sub_1CAD449AC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 704) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAD44A0C()
{
  uint64_t v0;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v2 = *(_QWORD **)(v0 + 680);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v2 = sub_1CAC5BA98(0, v2[2] + 1, 1, *(_QWORD **)(v0 + 680));
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_1CAC5BA98((_QWORD *)(v3 > 1), v4 + 1, 1, v2);
  v5 = *(_QWORD *)(v0 + 704);
  v6 = *(_QWORD *)(v0 + 664);
  v7 = *(_QWORD *)(v0 + 672) + 1;
  *(_QWORD *)(v0 + 584) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8555A0);
  *(_QWORD *)(v0 + 560) = v5;
  v2[2] = v4 + 1;
  sub_1CAC47240((_OWORD *)(v0 + 560), &v2[4 * v4 + 4]);
  swift_release();
  if (v7 == v6)
  {
    *(_QWORD *)(v0 + 712) = v2;
    swift_bridgeObjectRelease();
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 720) = v8;
    *v8 = v0;
    v8[1] = sub_1CAD44BA0;
    return sub_1CAD421D8();
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 672) + 1;
    *(_QWORD *)(v0 + 680) = v2;
    *(_QWORD *)(v0 + 672) = v10;
    v11 = *(_QWORD *)(v0 + 656);
    if ((v11 & 0xC000000000000001) != 0)
    {
      v12 = MEMORY[0x1D1797A7C]();
    }
    else
    {
      v12 = *(_QWORD *)(v11 + 8 * v10 + 32);
      swift_retain();
    }
    *(_QWORD *)(v0 + 688) = v12;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 696) = v13;
    *v13 = v0;
    v13[1] = sub_1CAD449AC;
    return sub_1CAC39A34();
  }
}

uint64_t sub_1CAD44BA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 728) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 736) = a1;
  return swift_task_switch();
}

void sub_1CAD44C14()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t inited;

  v0[93] = v0[92];
  v1 = v0[81];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED855620);
  inited = swift_initStackObject();
  v0[94] = inited;
  *(_OWORD *)(inited + 16) = xmmword_1CADD0180;
  *(_QWORD *)(inited + 32) = 0x6574617453;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  __asm { BR              X10 }
}

uint64_t sub_1CAD44CD4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;

  sub_1CADC3920();
  swift_bridgeObjectRelease();
  v2 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v0 + 48) = v12;
  *(_QWORD *)(v0 + 56) = v13;
  *(_QWORD *)(v0 + 72) = v2;
  *(_QWORD *)(v0 + 80) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 88) = 0x80000001CADD6380;
  if (qword_1ED855240 != -1)
    swift_once();
  v3 = v1[81];
  v4 = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(v0 + 96) = byte_1ED85CCC1;
  *(_QWORD *)(v0 + 120) = v4;
  *(_QWORD *)(v0 + 128) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 136) = 0x80000001CADD63A0;
  v5 = *(_QWORD *)(v3 + 152);
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1CADC3F98();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = v1[89];
  v8 = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v0 + 144) = v6;
  *(_QWORD *)(v0 + 168) = v8;
  *(_QWORD *)(v0 + 176) = 0xD000000000000011;
  *(_QWORD *)(v0 + 184) = 0x80000001CADD63C0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981738);
  *(_QWORD *)(v0 + 192) = v7;
  *(_QWORD *)(v0 + 216) = v9;
  *(_QWORD *)(v0 + 224) = 0xD000000000000010;
  *(_QWORD *)(v0 + 232) = 0x80000001CADD63E0;
  v10 = (_QWORD *)swift_task_alloc();
  v1[95] = v10;
  *v10 = v1;
  v10[1] = sub_1CAD44EB8;
  return sub_1CAC7D178();
}

uint64_t sub_1CAD44EB8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 768) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAD44F18()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[96];
  v2 = (_QWORD *)v0[94];
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8555A0);
  v0[97] = v3;
  v2[30] = v1;
  v2[33] = v3;
  v2[34] = 0xD000000000000012;
  v2[35] = 0x80000001CADD6400;
  v4 = (_QWORD *)swift_task_alloc();
  v0[98] = v4;
  *v4 = v0;
  v4[1] = sub_1CAD44FA8;
  return sub_1CACFC688();
}

uint64_t sub_1CAD44FA8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 792) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAD45008()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[97];
  v2 = v0[94];
  *(_QWORD *)(v2 + 288) = v0[99];
  *(_QWORD *)(v2 + 312) = v1;
  strcpy((char *)(v2 + 320), "Worker Factory");
  *(_BYTE *)(v2 + 335) = -18;
  v3 = (_QWORD *)swift_task_alloc();
  v0[100] = v3;
  *v3 = v0;
  v3[1] = sub_1CAD4508C;
  return sub_1CACA18CC();
}

uint64_t sub_1CAD4508C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 808) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAD450EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[97];
  v2 = v0[94];
  *(_QWORD *)(v2 + 336) = v0[101];
  *(_QWORD *)(v2 + 360) = v1;
  strcpy((char *)(v2 + 368), "Task Scheduler");
  *(_BYTE *)(v2 + 383) = -18;
  v3 = (_QWORD *)swift_task_alloc();
  v0[102] = v3;
  *v3 = v0;
  v3[1] = sub_1CAD45170;
  return sub_1CACA6158();
}

uint64_t sub_1CAD45170(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 824) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAD451D0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(v0 + 776);
  v2 = *(_QWORD **)(v0 + 752);
  v3 = *(_QWORD *)(v0 + 744);
  v2[48] = *(_QWORD *)(v0 + 824);
  v2[51] = v1;
  v2[52] = 0x7974697669746341;
  v2[57] = v1;
  v2[53] = 0xEF73757461745320;
  v2[54] = v3;
  v4 = sub_1CAC47A54((uint64_t)v2);
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v4);
}

void sub_1CAD4523C()
{
  _QWORD *v0;
  void *v1;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)v0[91];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED855620);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CADCAB00;
  *(_QWORD *)(inited + 32) = 0x726F727245;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  swift_getErrorValue();
  v3 = sub_1CADC4154();
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = v3;
  *(_QWORD *)(inited + 56) = v4;
  v5 = sub_1CAC47A54(inited);

  v0[93] = v5;
  v6 = v0[81];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED855620);
  v7 = swift_initStackObject();
  v0[94] = v7;
  *(_OWORD *)(v7 + 16) = xmmword_1CADD0180;
  *(_QWORD *)(v7 + 32) = 0x6574617453;
  *(_QWORD *)(v7 + 40) = 0xE500000000000000;
  __asm { BR              X10 }
}

uint64_t sub_1CAD45388()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;

  sub_1CADC3920();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 48) = v12;
  *(_QWORD *)(v0 + 56) = v13;
  *(_QWORD *)(v0 + 72) = v2;
  *(_QWORD *)(v0 + 80) = 0xD00000000000001CLL;
  *(_QWORD *)(v0 + 88) = 0x80000001CADD6380;
  if (qword_1ED855240 != -1)
    swift_once();
  v3 = v1[81];
  v4 = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(v0 + 96) = byte_1ED85CCC1;
  *(_QWORD *)(v0 + 120) = v4;
  *(_QWORD *)(v0 + 128) = 0xD00000000000001BLL;
  *(_QWORD *)(v0 + 136) = 0x80000001CADD63A0;
  v5 = *(_QWORD *)(v3 + 152);
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1CADC3F98();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v7 = v1[89];
  v8 = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v0 + 144) = v6;
  *(_QWORD *)(v0 + 168) = v8;
  *(_QWORD *)(v0 + 176) = 0xD000000000000011;
  *(_QWORD *)(v0 + 184) = 0x80000001CADD63C0;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981738);
  *(_QWORD *)(v0 + 192) = v7;
  *(_QWORD *)(v0 + 216) = v9;
  *(_QWORD *)(v0 + 224) = 0xD000000000000010;
  *(_QWORD *)(v0 + 232) = 0x80000001CADD63E0;
  v10 = (_QWORD *)swift_task_alloc();
  v1[95] = v10;
  *v10 = v1;
  v10[1] = sub_1CAD44EB8;
  return sub_1CAC7D178();
}

uint64_t Executive.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC13PhotoAnalysis9Executive_logger;
  v2 = sub_1CADC3644();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t Executive.__deallocating_deinit()
{
  Executive.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t Executive.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1CAD45614()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAC6C990;
  v3[81] = v2;
  return swift_task_switch();
}

uint64_t sub_1CAD45674()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1CAD45684(uint64_t a1, char a2)
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
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  _QWORD *v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED856278);
  v6 = sub_1CADC3FBC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v36 = v2;
  v37 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_22;
    }
    v20 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v20 >= v37)
      break;
    v21 = (_QWORD *)(v5 + 64);
    v22 = *(_QWORD *)(v38 + 8 * v20);
    ++v13;
    if (!v22)
    {
      v13 = v20 + 1;
      if (v20 + 1 >= v37)
        goto LABEL_34;
      v22 = *(_QWORD *)(v38 + 8 * v13);
      if (!v22)
      {
        v23 = v20 + 2;
        if (v23 >= v37)
        {
LABEL_34:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v22 = *(_QWORD *)(v38 + 8 * v23);
        if (!v22)
        {
          while (1)
          {
            v13 = v23 + 1;
            if (__OFADD__(v23, 1))
              goto LABEL_43;
            if (v13 >= v37)
              goto LABEL_34;
            v22 = *(_QWORD *)(v38 + 8 * v13);
            ++v23;
            if (v22)
              goto LABEL_21;
          }
        }
        v13 = v23;
      }
    }
LABEL_21:
    v10 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_22:
    v24 = *(_QWORD *)(v5 + 48) + 40 * v19;
    if ((a2 & 1) != 0)
    {
      v25 = *(_OWORD *)v24;
      v26 = *(_OWORD *)(v24 + 16);
      v41 = *(_QWORD *)(v24 + 32);
      v39 = v25;
      v40 = v26;
      v27 = *(id *)(*(_QWORD *)(v5 + 56) + 8 * v19);
    }
    else
    {
      sub_1CAC1C6E8(v24, (uint64_t)&v39);
      v27 = *(id *)(*(_QWORD *)(v5 + 56) + 8 * v19);
    }
    result = sub_1CADC3E78();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v11 + 8 * (v29 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v11 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v11 + 8 * v30);
      }
      while (v34 == -1);
      v14 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = *(_QWORD *)(v7 + 48) + 40 * v14;
    v16 = v39;
    v17 = v40;
    *(_QWORD *)(v15 + 32) = v41;
    *(_OWORD *)v15 = v16;
    *(_OWORD *)(v15 + 16) = v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v14) = v27;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v21 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v21, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v21 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CAD45994(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int64_t v52;
  unint64_t v53;
  int64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  _QWORD *v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
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
  unint64_t v86;
  int64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[32];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint64_t v99;

  v4 = sub_1CADC34B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = v2;
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9853C0);
  v69 = a2;
  v70 = sub_1CADC3FBC();
  if (*(_QWORD *)(v8 + 16))
  {
    v9 = 1 << *(_BYTE *)(v8 + 32);
    v10 = *(_QWORD *)(v8 + 64);
    v62 = (_QWORD *)(v8 + 64);
    if (v9 < 64)
      v11 = ~(-1 << v9);
    else
      v11 = -1;
    v12 = v11 & v10;
    v63 = (unint64_t)(v9 + 63) >> 6;
    v67 = v70 + 64;
    result = swift_retain();
    v14 = 0;
    v68 = v8;
    v15 = v4;
    v66 = v7;
    v65 = v5;
    v64 = v4;
    while (1)
    {
      if (v12)
      {
        v49 = __clz(__rbit64(v12));
        v50 = (v12 - 1) & v12;
        v51 = v49 | (v14 << 6);
      }
      else
      {
        v52 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }
        if (v52 >= v63)
          goto LABEL_24;
        v53 = v62[v52];
        ++v14;
        if (!v53)
        {
          v14 = v52 + 1;
          if (v52 + 1 >= v63)
            goto LABEL_24;
          v53 = v62[v14];
          if (!v53)
          {
            v54 = v52 + 2;
            if (v54 >= v63)
            {
LABEL_24:
              swift_release();
              if ((v69 & 1) != 0)
              {
                v59 = 1 << *(_BYTE *)(v8 + 32);
                if (v59 >= 64)
                  bzero(v62, ((unint64_t)(v59 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v62 = -1 << v59;
                *(_QWORD *)(v8 + 16) = 0;
              }
              break;
            }
            v53 = v62[v54];
            if (!v53)
            {
              while (1)
              {
                v14 = v54 + 1;
                if (__OFADD__(v54, 1))
                  goto LABEL_31;
                if (v14 >= v63)
                  goto LABEL_24;
                v53 = v62[v14];
                ++v54;
                if (v53)
                  goto LABEL_21;
              }
            }
            v14 = v54;
          }
        }
LABEL_21:
        v50 = (v53 - 1) & v53;
        v51 = __clz(__rbit64(v53)) + (v14 << 6);
      }
      v87 = v14;
      v86 = v50;
      if ((v69 & 1) != 0)
      {
        v55 = *(_QWORD *)(v8 + 56);
        v56 = *(_QWORD *)(v8 + 48) + 152 * v51;
        v30 = *(_QWORD *)v56;
        v28 = *(_QWORD *)(v56 + 8);
        v29 = *(_QWORD *)(v56 + 16);
        v90 = *(_OWORD *)(v56 + 24);
        v27 = *(_QWORD *)(v56 + 40);
        v26 = *(_QWORD *)(v56 + 48);
        v25 = *(_QWORD *)(v56 + 56);
        v24 = *(_QWORD *)(v56 + 64);
        v89 = *(_QWORD *)(v56 + 72);
        v88 = *(_QWORD *)(v56 + 80);
        v75 = *(_QWORD *)(v56 + 88);
        v78 = *(_QWORD *)(v56 + 96);
        v74 = *(_QWORD *)(v56 + 104);
        v73 = *(_QWORD *)(v56 + 112);
        v72 = *(_QWORD *)(v56 + 120);
        v71 = *(_QWORD *)(v56 + 128);
        v58 = *(_QWORD *)(v56 + 136);
        v57 = *(_QWORD *)(v56 + 144);
        v77 = v58;
        v76 = v57;
        (*(void (**)(char *, unint64_t, uint64_t))(v5 + 32))(v7, v55 + *(_QWORD *)(v5 + 72) * v51, v15);
      }
      else
      {
        v16 = *(_QWORD *)(v8 + 48) + 152 * v51;
        v17 = *(_OWORD *)(v16 + 32);
        v18 = *(_OWORD *)(v16 + 48);
        v19 = *(_OWORD *)(v16 + 80);
        v94 = *(_OWORD *)(v16 + 64);
        v95 = v19;
        v93 = v18;
        v20 = *(_OWORD *)(v16 + 96);
        v21 = *(_OWORD *)(v16 + 112);
        v22 = *(_OWORD *)(v16 + 128);
        v99 = *(_QWORD *)(v16 + 144);
        v97 = v21;
        v98 = v22;
        v96 = v20;
        v23 = *(_OWORD *)(v16 + 16);
        v91 = *(_OWORD *)v16;
        *(_OWORD *)v92 = v23;
        *(_OWORD *)&v92[16] = v17;
        (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 56) + *(_QWORD *)(v5 + 72) * v51, v15);
        v75 = *((_QWORD *)&v95 + 1);
        v74 = *((_QWORD *)&v96 + 1);
        v78 = v96;
        v72 = *((_QWORD *)&v97 + 1);
        v73 = v97;
        v77 = *((_QWORD *)&v98 + 1);
        v71 = v98;
        v76 = v99;
        v89 = *((_QWORD *)&v94 + 1);
        v24 = v94;
        v88 = v95;
        v25 = *((_QWORD *)&v93 + 1);
        v26 = v93;
        v27 = *(_QWORD *)&v92[24];
        v28 = *((_QWORD *)&v91 + 1);
        v29 = *(_QWORD *)v92;
        v90 = *(_OWORD *)&v92[8];
        v30 = v91;
        sub_1CAC601E8((uint64_t)&v91);
      }
      v79 = v24;
      v31 = (_QWORD *)v70;
      v82 = v30;
      *(_QWORD *)&v91 = v30;
      *((_QWORD *)&v91 + 1) = v28;
      v81 = v28;
      v83 = v29;
      *(_QWORD *)v92 = v29;
      *(_OWORD *)&v92[8] = v90;
      v84 = v27;
      *(_QWORD *)&v92[24] = v27;
      *(_QWORD *)&v93 = v26;
      v85 = v26;
      v80 = v25;
      *((_QWORD *)&v93 + 1) = v25;
      *(_QWORD *)&v94 = v24;
      *((_QWORD *)&v94 + 1) = v89;
      *(_QWORD *)&v95 = v88;
      v32 = v75;
      v33 = v78;
      *((_QWORD *)&v95 + 1) = v75;
      *(_QWORD *)&v96 = v78;
      v34 = v74;
      v35 = v73;
      *((_QWORD *)&v96 + 1) = v74;
      *(_QWORD *)&v97 = v73;
      v36 = v72;
      v37 = v71;
      *((_QWORD *)&v97 + 1) = v72;
      *(_QWORD *)&v98 = v71;
      v38 = v77;
      v39 = v76;
      *((_QWORD *)&v98 + 1) = v77;
      v99 = v76;
      sub_1CADC41A8();
      PromptSuggestionFetcher.MCSuggestion.Prompt.hash(into:)();
      sub_1CADC41D8();
      v40 = v31;
      v41 = v67;
      v42 = sub_1CADC3E6C();
      *(_QWORD *)(v41 + ((v42 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v42;
      v43 = v40[6] + 152 * v42;
      v44 = v81;
      *(_QWORD *)v43 = v82;
      *(_QWORD *)(v43 + 8) = v44;
      *(_QWORD *)(v43 + 16) = v83;
      *(_OWORD *)(v43 + 24) = v90;
      v45 = v85;
      *(_QWORD *)(v43 + 40) = v84;
      *(_QWORD *)(v43 + 48) = v45;
      v46 = v79;
      *(_QWORD *)(v43 + 56) = v80;
      *(_QWORD *)(v43 + 64) = v46;
      v47 = v88;
      *(_QWORD *)(v43 + 72) = v89;
      *(_QWORD *)(v43 + 80) = v47;
      *(_QWORD *)(v43 + 88) = v32;
      *(_QWORD *)(v43 + 96) = v33;
      *(_QWORD *)(v43 + 104) = v34;
      *(_QWORD *)(v43 + 112) = v35;
      *(_QWORD *)(v43 + 120) = v36;
      *(_QWORD *)(v43 + 128) = v37;
      *(_QWORD *)(v43 + 136) = v38;
      *(_QWORD *)(v43 + 144) = v39;
      v5 = v65;
      v7 = v66;
      v48 = v64;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v65 + 32))(v40[7] + *(_QWORD *)(v65 + 72) * v42, v66, v64);
      ++v40[2];
      v8 = v68;
      v15 = v48;
      v14 = v87;
      v12 = v86;
    }
  }
  result = swift_release();
  *v61 = v70;
  return result;
}

unint64_t sub_1CAD46008(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t result;
  int64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  int64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[48];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9853C8);
  v43 = a2;
  v5 = sub_1CADC3FBC();
  v6 = (_QWORD *)v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v39 = (_QWORD *)(v4 + 64);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v4 + 64);
    v40 = (unint64_t)(v7 + 63) >> 6;
    v41 = v5 + 64;
    result = swift_retain();
    v11 = 0;
    v42 = v4;
    while (1)
    {
      if (v9)
      {
        v29 = __clz(__rbit64(v9));
        v30 = (v9 - 1) & v9;
        v31 = v29 | (v11 << 6);
      }
      else
      {
        v32 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }
        if (v32 >= v40)
          goto LABEL_24;
        v33 = v39[v32];
        ++v11;
        if (!v33)
        {
          v11 = v32 + 1;
          if (v32 + 1 >= v40)
            goto LABEL_24;
          v33 = v39[v11];
          if (!v33)
          {
            v34 = v32 + 2;
            if (v34 >= v40)
            {
LABEL_24:
              swift_release();
              if ((v43 & 1) != 0)
              {
                v37 = 1 << *(_BYTE *)(v4 + 32);
                if (v37 >= 64)
                  bzero(v39, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v39 = -1 << v37;
                *(_QWORD *)(v4 + 16) = 0;
              }
              break;
            }
            v33 = v39[v34];
            if (!v33)
            {
              while (1)
              {
                v11 = v34 + 1;
                if (__OFADD__(v34, 1))
                  goto LABEL_31;
                if (v11 >= v40)
                  goto LABEL_24;
                v33 = v39[v11];
                ++v34;
                if (v33)
                  goto LABEL_21;
              }
            }
            v11 = v34;
          }
        }
LABEL_21:
        v30 = (v33 - 1) & v33;
        v31 = __clz(__rbit64(v33)) + (v11 << 6);
      }
      v53 = v30;
      v54 = v11;
      if ((v43 & 1) != 0)
      {
        v35 = *(_QWORD *)(v4 + 56);
        v36 = *(_QWORD *)(v4 + 48) + 152 * v31;
        v27 = *(_QWORD *)v36;
        v26 = *(_QWORD *)(v36 + 8);
        v25 = *(_QWORD *)(v36 + 16);
        v55 = *(_OWORD *)(v36 + 24);
        v56 = *(_OWORD *)(v36 + 40);
        v24 = *(_QWORD *)(v36 + 56);
        v23 = *(_QWORD *)(v36 + 64);
        v22 = *(_QWORD *)(v36 + 72);
        v21 = *(_QWORD *)(v36 + 80);
        v51 = *(_QWORD *)(v36 + 88);
        v50 = *(_QWORD *)(v36 + 96);
        v49 = *(_QWORD *)(v36 + 104);
        v48 = *(_QWORD *)(v36 + 112);
        v47 = *(_QWORD *)(v36 + 120);
        v46 = *(_QWORD *)(v36 + 128);
        v44 = *(_QWORD *)(v36 + 144);
        v45 = *(_QWORD *)(v36 + 136);
        v52 = *(_QWORD *)(v35 + 8 * v31);
      }
      else
      {
        v12 = *(_QWORD *)(v4 + 48) + 152 * v31;
        v13 = *(_OWORD *)(v12 + 32);
        v14 = *(_OWORD *)(v12 + 48);
        v15 = *(_OWORD *)(v12 + 80);
        v59 = *(_OWORD *)(v12 + 64);
        v60 = v15;
        *(_OWORD *)&v58[32] = v14;
        v16 = *(_OWORD *)(v12 + 96);
        v17 = *(_OWORD *)(v12 + 112);
        v18 = *(_OWORD *)(v12 + 128);
        v64 = *(_QWORD *)(v12 + 144);
        v62 = v17;
        v63 = v18;
        v61 = v16;
        v19 = *(_OWORD *)(v12 + 16);
        v57 = *(_OWORD *)v12;
        *(_OWORD *)v58 = v19;
        *(_OWORD *)&v58[16] = v13;
        v20 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v31);
        v21 = v60;
        v50 = v61;
        v51 = *((_QWORD *)&v60 + 1);
        v48 = v17;
        v49 = *((_QWORD *)&v61 + 1);
        v46 = v18;
        v47 = *((_QWORD *)&v17 + 1);
        v44 = v64;
        v45 = *((_QWORD *)&v18 + 1);
        v22 = *((_QWORD *)&v59 + 1);
        v23 = v59;
        v24 = *(_QWORD *)&v58[40];
        v26 = *((_QWORD *)&v57 + 1);
        v25 = v19;
        v55 = *(_OWORD *)&v58[8];
        v56 = *(_OWORD *)&v58[24];
        v27 = v57;
        sub_1CAC601E8((uint64_t)&v57);
        v52 = v20;
        swift_bridgeObjectRetain();
      }
      *(_QWORD *)&v57 = v27;
      *((_QWORD *)&v57 + 1) = v26;
      *(_QWORD *)v58 = v25;
      *(_OWORD *)&v58[8] = v55;
      *(_OWORD *)&v58[24] = v56;
      *(_QWORD *)&v58[40] = v24;
      *(_QWORD *)&v59 = v23;
      *((_QWORD *)&v59 + 1) = v22;
      *(_QWORD *)&v60 = v21;
      *((_QWORD *)&v60 + 1) = v51;
      *(_QWORD *)&v61 = v50;
      *((_QWORD *)&v61 + 1) = v49;
      *(_QWORD *)&v62 = v48;
      *((_QWORD *)&v62 + 1) = v47;
      *(_QWORD *)&v63 = v46;
      *((_QWORD *)&v63 + 1) = v45;
      v64 = v44;
      sub_1CADC41A8();
      PromptSuggestionFetcher.MCSuggestion.Prompt.hash(into:)();
      sub_1CADC41D8();
      result = sub_1CADC3E6C();
      *(_QWORD *)(v41 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
      v28 = v6[6] + 152 * result;
      *(_QWORD *)v28 = v27;
      *(_QWORD *)(v28 + 8) = v26;
      *(_QWORD *)(v28 + 16) = v25;
      *(_OWORD *)(v28 + 24) = v55;
      *(_OWORD *)(v28 + 40) = v56;
      *(_QWORD *)(v28 + 56) = v24;
      *(_QWORD *)(v28 + 64) = v23;
      *(_QWORD *)(v28 + 72) = v22;
      *(_QWORD *)(v28 + 80) = v21;
      *(_QWORD *)(v28 + 88) = v51;
      *(_QWORD *)(v28 + 96) = v50;
      *(_QWORD *)(v28 + 104) = v49;
      *(_QWORD *)(v28 + 112) = v48;
      *(_QWORD *)(v28 + 120) = v47;
      *(_QWORD *)(v28 + 128) = v46;
      *(_QWORD *)(v28 + 136) = v45;
      *(_QWORD *)(v28 + 144) = v44;
      *(_QWORD *)(v6[7] + 8 * result) = v52;
      ++v6[2];
      v4 = v42;
      v9 = v53;
      v11 = v54;
    }
  }
  result = swift_release();
  *v38 = v6;
  return result;
}

unint64_t sub_1CAD46444(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t result;
  int64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t *v18;
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
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  int64_t v44;
  uint64_t v45;
  char v46;
  _QWORD *v47;
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
  unint64_t v58;
  int64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[48];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9853B8);
  v46 = a2;
  v47 = (_QWORD *)sub_1CADC3FBC();
  if (*(_QWORD *)(v4 + 16))
  {
    v5 = 1 << *(_BYTE *)(v4 + 32);
    v43 = (_QWORD *)(v4 + 64);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v4 + 64);
    v44 = (unint64_t)(v5 + 63) >> 6;
    result = swift_retain();
    v9 = 0;
    v45 = v4;
    while (1)
    {
      if (v7)
      {
        v32 = __clz(__rbit64(v7));
        v33 = (v7 - 1) & v7;
        v34 = v32 | (v9 << 6);
      }
      else
      {
        v35 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
LABEL_31:
          __break(1u);
          return result;
        }
        if (v35 >= v44)
          goto LABEL_24;
        v36 = v43[v35];
        ++v9;
        if (!v36)
        {
          v9 = v35 + 1;
          if (v35 + 1 >= v44)
            goto LABEL_24;
          v36 = v43[v9];
          if (!v36)
          {
            v37 = v35 + 2;
            if (v37 >= v44)
            {
LABEL_24:
              swift_release();
              if ((v46 & 1) != 0)
              {
                v41 = 1 << *(_BYTE *)(v4 + 32);
                if (v41 >= 64)
                  bzero(v43, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v43 = -1 << v41;
                *(_QWORD *)(v4 + 16) = 0;
              }
              break;
            }
            v36 = v43[v37];
            if (!v36)
            {
              while (1)
              {
                v9 = v37 + 1;
                if (__OFADD__(v37, 1))
                  goto LABEL_31;
                if (v9 >= v44)
                  goto LABEL_24;
                v36 = v43[v9];
                ++v37;
                if (v36)
                  goto LABEL_21;
              }
            }
            v9 = v37;
          }
        }
LABEL_21:
        v33 = (v36 - 1) & v36;
        v34 = __clz(__rbit64(v36)) + (v9 << 6);
      }
      v58 = v33;
      v59 = v9;
      if ((v46 & 1) != 0)
      {
        v38 = *(_QWORD *)(v4 + 56);
        v39 = *(_QWORD *)(v4 + 48) + 152 * v34;
        v28 = *(_QWORD *)v39;
        v26 = *(_QWORD *)(v39 + 8);
        v27 = *(_QWORD *)(v39 + 16);
        v60 = *(_OWORD *)(v39 + 24);
        v61 = *(_OWORD *)(v39 + 40);
        v24 = *(_QWORD *)(v39 + 56);
        v25 = *(_QWORD *)(v39 + 64);
        v22 = *(_QWORD *)(v39 + 72);
        v23 = *(_QWORD *)(v39 + 80);
        v29 = *(_QWORD *)(v39 + 88);
        v54 = *(_QWORD *)(v39 + 96);
        v53 = *(_QWORD *)(v39 + 104);
        v52 = *(_QWORD *)(v39 + 112);
        v51 = *(_QWORD *)(v39 + 120);
        v50 = *(_QWORD *)(v39 + 128);
        v48 = *(_QWORD *)(v39 + 144);
        v49 = *(_QWORD *)(v39 + 136);
        v40 = (uint64_t *)(v38 + 24 * v34);
        v56 = v40[1];
        v57 = *v40;
        v55 = v40[2];
      }
      else
      {
        v10 = *(_QWORD *)(v4 + 48) + 152 * v34;
        v11 = *(_OWORD *)(v10 + 32);
        v12 = *(_OWORD *)(v10 + 48);
        v13 = *(_OWORD *)(v10 + 80);
        v64 = *(_OWORD *)(v10 + 64);
        v65 = v13;
        *(_OWORD *)&v63[32] = v12;
        v14 = *(_OWORD *)(v10 + 96);
        v15 = *(_OWORD *)(v10 + 112);
        v16 = *(_OWORD *)(v10 + 128);
        v69 = *(_QWORD *)(v10 + 144);
        v67 = v15;
        v68 = v16;
        v66 = v14;
        v17 = *(_OWORD *)(v10 + 16);
        v62 = *(_OWORD *)v10;
        *(_OWORD *)v63 = v17;
        *(_OWORD *)&v63[16] = v11;
        v18 = (uint64_t *)(*(_QWORD *)(v4 + 56) + 24 * v34);
        v19 = v18[1];
        v57 = *v18;
        v20 = v18[2];
        v21 = *((_QWORD *)&v65 + 1);
        v53 = *((_QWORD *)&v66 + 1);
        v54 = v66;
        v51 = *((_QWORD *)&v15 + 1);
        v52 = v15;
        v49 = *((_QWORD *)&v16 + 1);
        v50 = v16;
        v48 = v69;
        v22 = *((_QWORD *)&v64 + 1);
        v23 = v65;
        v24 = *(_QWORD *)&v63[40];
        v25 = v64;
        v26 = *((_QWORD *)&v62 + 1);
        v27 = v17;
        v60 = *(_OWORD *)&v63[8];
        v61 = *(_OWORD *)&v63[24];
        v28 = v62;
        sub_1CAC601E8((uint64_t)&v62);
        v56 = v19;
        swift_bridgeObjectRetain();
        v55 = v20;
        v29 = v21;
        swift_bridgeObjectRetain();
      }
      *(_QWORD *)&v62 = v28;
      *((_QWORD *)&v62 + 1) = v26;
      *(_QWORD *)v63 = v27;
      *(_OWORD *)&v63[8] = v60;
      *(_OWORD *)&v63[24] = v61;
      *(_QWORD *)&v63[40] = v24;
      *(_QWORD *)&v64 = v25;
      *((_QWORD *)&v64 + 1) = v22;
      *(_QWORD *)&v65 = v23;
      *((_QWORD *)&v65 + 1) = v29;
      *(_QWORD *)&v66 = v54;
      *((_QWORD *)&v66 + 1) = v53;
      *(_QWORD *)&v67 = v52;
      *((_QWORD *)&v67 + 1) = v51;
      *(_QWORD *)&v68 = v50;
      *((_QWORD *)&v68 + 1) = v49;
      v69 = v48;
      sub_1CADC41A8();
      PromptSuggestionFetcher.MCSuggestion.Prompt.hash(into:)();
      sub_1CADC41D8();
      result = sub_1CADC3E6C();
      *(_QWORD *)((char *)v47 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v30 = v47[6] + 152 * result;
      *(_QWORD *)v30 = v28;
      *(_QWORD *)(v30 + 8) = v26;
      *(_QWORD *)(v30 + 16) = v27;
      *(_OWORD *)(v30 + 24) = v60;
      *(_OWORD *)(v30 + 40) = v61;
      *(_QWORD *)(v30 + 56) = v24;
      *(_QWORD *)(v30 + 64) = v25;
      *(_QWORD *)(v30 + 72) = v22;
      *(_QWORD *)(v30 + 80) = v23;
      *(_QWORD *)(v30 + 88) = v29;
      *(_QWORD *)(v30 + 96) = v54;
      *(_QWORD *)(v30 + 104) = v53;
      *(_QWORD *)(v30 + 112) = v52;
      *(_QWORD *)(v30 + 120) = v51;
      *(_QWORD *)(v30 + 128) = v50;
      *(_QWORD *)(v30 + 136) = v49;
      *(_QWORD *)(v30 + 144) = v48;
      v31 = (_QWORD *)(v47[7] + 24 * result);
      *v31 = v57;
      v31[1] = v56;
      v31[2] = v55;
      ++v47[2];
      v4 = v45;
      v7 = v58;
      v9 = v59;
    }
  }
  result = swift_release();
  *v42 = v47;
  return result;
}

uint64_t sub_1CAD468C0(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_1CADC311C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985388);
  v42 = a2;
  v10 = sub_1CADC3FBC();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_bridgeObjectRetain();
    }
    sub_1CAC1CA60(&qword_1EF981E18, (uint64_t (*)(uint64_t))MEMORY[0x1E0D76CA0], MEMORY[0x1E0D76CB0]);
    result = sub_1CADC3890();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_1CAD46C54(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858C80);
  v37 = a2;
  v6 = sub_1CADC3FBC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CAD46F58(uint64_t a1, char a2)
{
  return sub_1CAD4728C(a1, a2, &qword_1ED858C58, (void (*)(uint64_t, _BYTE *))sub_1CAC25FBC);
}

uint64_t sub_1CAD46F6C(uint64_t a1, char a2)
{
  return sub_1CAD49AF4(a1, a2, &qword_1ED858C90);
}

uint64_t sub_1CAD46F78(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858C48);
  v36 = a2;
  v6 = sub_1CADC3FBC();
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
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
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

uint64_t sub_1CAD4728C(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, _BYTE *))
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  char v38;
  _BYTE v39[40];

  v6 = v4;
  v8 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v38 = a2;
  v9 = sub_1CADC3FBC();
  v10 = v9;
  if (*(_QWORD *)(v8 + 16))
  {
    v11 = 1 << *(_BYTE *)(v8 + 32);
    v37 = (_QWORD *)(v8 + 64);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v8 + 64);
    v36 = (unint64_t)(v11 + 63) >> 6;
    v14 = v9 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v36)
          goto LABEL_34;
        v22 = v37[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v36)
            goto LABEL_34;
          v22 = v37[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_34:
              swift_release();
              v6 = v4;
              if ((v38 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v8 + 32);
                if (v35 >= 64)
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v35;
                *(_QWORD *)(v8 + 16) = 0;
              }
              break;
            }
            v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v36)
                  goto LABEL_34;
                v22 = v37[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v20);
      v26 = *v24;
      v25 = v24[1];
      v27 = *(_QWORD *)(v8 + 56) + 40 * v20;
      if ((v38 & 1) != 0)
      {
        a4(v27, v39);
      }
      else
      {
        sub_1CAC1F9EC(v27, (uint64_t)v39);
        swift_bridgeObjectRetain();
      }
      sub_1CADC41A8();
      sub_1CADC3908();
      result = sub_1CADC41D8();
      v28 = -1 << *(_BYTE *)(v10 + 32);
      v29 = result & ~v28;
      v30 = v29 >> 6;
      if (((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v31 = 0;
        v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v33 = v30 == v32;
          if (v30 == v32)
            v30 = 0;
          v31 |= v33;
          v34 = *(_QWORD *)(v14 + 8 * v30);
        }
        while (v34 == -1);
        v17 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v17);
      *v18 = v26;
      v18[1] = v25;
      result = ((uint64_t (*)(_BYTE *, unint64_t))a4)(v39, *(_QWORD *)(v10 + 56) + 40 * v17);
      ++*(_QWORD *)(v10 + 16);
    }
  }
  result = swift_release();
  *v6 = v10;
  return result;
}

uint64_t sub_1CAD475A0(uint64_t a1, char a2)
{
  return sub_1CAD497E4(a1, a2, &qword_1ED8555F0);
}

uint64_t sub_1CAD475AC(uint64_t a1, char a2)
{
  return sub_1CAD4858C(a1, a2, &qword_1ED855610, (void (*)(uint64_t, _BYTE *))sub_1CAC47240, (void (*)(uint64_t, _BYTE *))sub_1CAC27E30);
}

uint64_t sub_1CAD475C8(uint64_t a1, char a2)
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981B80);
  v42 = a2;
  v6 = sub_1CADC3FBC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CAD478EC(uint64_t a1, char a2)
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
  uint8x8_t v13;
  int64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  int64_t v27;
  _QWORD *v28;
  unint64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  int64_t v51;
  _QWORD *v52;
  uint64_t i;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  int16x8_t v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9853D0);
  v54 = a2;
  v6 = sub_1CADC3FBC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v52 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v50 = v2;
  v51 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  for (i = v5; ; v5 = i)
  {
    if (v10)
    {
      v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v19 = v18 | (v14 << 6);
      if ((v54 & 1) != 0)
        goto LABEL_10;
      goto LABEL_23;
    }
    v27 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v27 >= v51)
      break;
    v28 = v52;
    v29 = v52[v27];
    ++v14;
    if (!v29)
    {
      v14 = v27 + 1;
      if (v27 + 1 >= v51)
        goto LABEL_33;
      v29 = v52[v14];
      if (!v29)
      {
        v30 = v27 + 2;
        if (v30 >= v51)
        {
LABEL_33:
          swift_release();
          v3 = v50;
          if ((v54 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v29 = v52[v30];
        if (!v29)
        {
          while (1)
          {
            v14 = v30 + 1;
            if (__OFADD__(v30, 1))
              goto LABEL_42;
            if (v14 >= v51)
              goto LABEL_33;
            v29 = v52[v14];
            ++v30;
            if (v29)
              goto LABEL_22;
          }
        }
        v14 = v30;
      }
    }
LABEL_22:
    v10 = (v29 - 1) & v29;
    v19 = __clz(__rbit64(v29)) + (v14 << 6);
    if ((v54 & 1) != 0)
    {
LABEL_10:
      v20 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v19);
      v21 = *v20;
      v22 = v20[1];
      v23 = *(_QWORD *)(v5 + 56) + 200 * v19;
      v59 = *(_QWORD *)(v23 + 8);
      v60 = *(_QWORD *)(v23 + 24);
      v61 = *(_QWORD *)v23;
      v62 = *(_BYTE *)(v23 + 32);
      v63 = *(_QWORD *)(v23 + 16);
      v64 = *(_QWORD *)(v23 + 40);
      v65 = *(_BYTE *)(v23 + 48);
      v66 = *(_BYTE *)(v23 + 49);
      v67 = *(_QWORD *)(v23 + 56);
      v68 = *(_QWORD *)(v23 + 64);
      v24 = *(_BYTE *)(v23 + 72);
      v25 = *(_BYTE *)(v23 + 88);
      v69 = *(_QWORD *)(v23 + 80);
      v70 = *(_QWORD *)(v23 + 96);
      v26 = *(_BYTE *)(v23 + 104);
      v71 = *(_DWORD *)(v23 + 108);
      v72 = *(_DWORD *)(v23 + 116);
      v55 = *(_BYTE *)(v23 + 112);
      v56 = *(_BYTE *)(v23 + 120);
      v73 = *(_QWORD *)(v23 + 128);
      v57 = *(_BYTE *)(v23 + 136);
      v13.i32[0] = *(_DWORD *)(v23 + 137);
      v77 = (int16x8_t)vmovl_u8(v13);
      v74 = *(_OWORD *)(v23 + 144);
      v58 = *(_BYTE *)(v23 + 160);
      v78 = *(_QWORD *)(v23 + 168);
      v79 = *(_QWORD *)(v23 + 184);
      v75 = *(_QWORD *)(v23 + 176);
      v76 = *(_QWORD *)(v23 + 192);
      goto LABEL_24;
    }
LABEL_23:
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v19);
    v21 = *v31;
    v22 = v31[1];
    v32 = *(_QWORD *)(v5 + 56) + 200 * v19;
    v80 = *(_OWORD *)v32;
    v33 = *(_OWORD *)(v32 + 64);
    v35 = *(_OWORD *)(v32 + 16);
    v34 = *(_OWORD *)(v32 + 32);
    v83 = *(_OWORD *)(v32 + 48);
    v84 = v33;
    v81 = v35;
    v82 = v34;
    v36 = *(_OWORD *)(v32 + 128);
    v38 = *(_OWORD *)(v32 + 80);
    v37 = *(_OWORD *)(v32 + 96);
    v87 = *(_OWORD *)(v32 + 112);
    v88 = v36;
    v85 = v38;
    v86 = v37;
    v40 = *(_OWORD *)(v32 + 160);
    v39 = *(_OWORD *)(v32 + 176);
    v41 = *(_OWORD *)(v32 + 144);
    v92 = *(_QWORD *)(v32 + 192);
    v90 = v40;
    v91 = v39;
    v89 = v41;
    v76 = v92;
    v78 = *((_QWORD *)&v40 + 1);
    v79 = *((_QWORD *)&v39 + 1);
    v58 = v40;
    v75 = v39;
    v74 = v41;
    LODWORD(v39) = *(_DWORD *)((char *)&v88 + 9);
    v77 = (int16x8_t)vmovl_u8(*(uint8x8_t *)&v39);
    v73 = v88;
    v56 = BYTE8(v87);
    v57 = BYTE8(v88);
    v71 = HIDWORD(v86);
    v72 = DWORD1(v87);
    v55 = v87;
    v26 = BYTE8(v86);
    v69 = v38;
    v70 = v86;
    v25 = BYTE8(v38);
    v24 = BYTE8(v84);
    v67 = *((_QWORD *)&v83 + 1);
    v68 = v84;
    v65 = v83;
    v66 = BYTE1(v83);
    v62 = v82;
    v63 = v81;
    v64 = *((_QWORD *)&v82 + 1);
    v60 = *((_QWORD *)&v81 + 1);
    v59 = *((_QWORD *)&v80 + 1);
    v61 = v80;
    swift_bridgeObjectRetain();
    sub_1CAC36C48((uint64_t)&v80);
LABEL_24:
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
    v42 = -1 << *(_BYTE *)(v7 + 32);
    v43 = result & ~v42;
    v44 = v43 >> 6;
    if (((-1 << v43) & ~*(_QWORD *)(v11 + 8 * (v43 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v43) & ~*(_QWORD *)(v11 + 8 * (v43 >> 6)))) | v43 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v45 = 0;
      v46 = (unint64_t)(63 - v42) >> 6;
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
        v48 = *(_QWORD *)(v11 + 8 * v44);
      }
      while (v48 == -1);
      v15 = __clz(__rbit64(~v48)) + (v44 << 6);
    }
    LOBYTE(v80) = v24;
    *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v15);
    *v16 = v21;
    v16[1] = v22;
    v17 = *(_QWORD *)(v7 + 56) + 200 * v15;
    *(_QWORD *)v17 = v61;
    *(_QWORD *)(v17 + 8) = v59;
    *(_QWORD *)(v17 + 16) = v63;
    *(_QWORD *)(v17 + 24) = v60;
    *(_BYTE *)(v17 + 32) = v62;
    *(_QWORD *)(v17 + 40) = v64;
    *(_BYTE *)(v17 + 48) = v65;
    *(_BYTE *)(v17 + 49) = v66;
    *(_QWORD *)(v17 + 56) = v67;
    *(_QWORD *)(v17 + 64) = v68;
    *(_BYTE *)(v17 + 72) = v80;
    *(_QWORD *)(v17 + 80) = v69;
    *(_BYTE *)(v17 + 88) = v25;
    *(_QWORD *)(v17 + 96) = v70;
    *(_BYTE *)(v17 + 104) = v26;
    *(_DWORD *)(v17 + 108) = v71;
    *(_BYTE *)(v17 + 112) = v55;
    *(_DWORD *)(v17 + 116) = v72;
    *(_BYTE *)(v17 + 120) = v56;
    *(_QWORD *)(v17 + 128) = v73;
    *(_BYTE *)(v17 + 136) = v57;
    *(_OWORD *)(v17 + 144) = v74;
    *(_BYTE *)(v17 + 160) = v58;
    *(_QWORD *)(v17 + 168) = v78;
    *(_QWORD *)(v17 + 176) = v75;
    *(_QWORD *)(v17 + 184) = v79;
    *(_QWORD *)(v17 + 192) = v76;
    v13 = (uint8x8_t)vmovn_s16(v77);
    *(_DWORD *)(v17 + 137) = v13.i32[0];
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v50;
  v28 = v52;
  if ((v54 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v49 = 1 << *(_BYTE *)(v5 + 32);
  if (v49 >= 64)
    bzero(v28, ((unint64_t)(v49 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v28 = -1 << v49;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CAD47ED8(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v37 = a2;
  v7 = sub_1CADC3FBC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v35)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_1CAD481E8(uint64_t a1, int a2)
{
  return sub_1CAD481FC(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for PersonalTraitsGenerationHelper.PersonalTraitInfo, &qword_1EF981BB0);
}

uint64_t sub_1CAD481FC(uint64_t a1, int a2, uint64_t (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v8;
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
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t v46;
  int v47;
  uint64_t (*v48)(_QWORD);

  v6 = v4;
  v48 = a3;
  v8 = a3(0);
  v46 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v42 - v9;
  v11 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  v47 = a2;
  v12 = sub_1CADC3FBC();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v45 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v43 = v4;
  v44 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain();
  v20 = 0;
  while (1)
  {
    if (v17)
    {
      v23 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v24 = v23 | (v20 << 6);
      goto LABEL_22;
    }
    v25 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v44)
      break;
    v26 = v45;
    v27 = v45[v25];
    ++v20;
    if (!v27)
    {
      v20 = v25 + 1;
      if (v25 + 1 >= v44)
        goto LABEL_34;
      v27 = v45[v20];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_34:
          swift_release();
          v6 = v43;
          if ((v47 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            v20 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v20 >= v44)
              goto LABEL_34;
            v27 = v45[v20];
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v20 = v28;
      }
    }
LABEL_21:
    v17 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_22:
    v29 = (uint64_t *)(*(_QWORD *)(v11 + 48) + 16 * v24);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(v46 + 72);
    v33 = *(_QWORD *)(v11 + 56) + v32 * v24;
    if ((v47 & 1) != 0)
    {
      sub_1CAC3815C(v33, (uint64_t)v10, v48);
    }
    else
    {
      sub_1CAC614B0(v33, (uint64_t)v10, v48);
      swift_bridgeObjectRetain();
    }
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
    v34 = -1 << *(_BYTE *)(v13 + 32);
    v35 = result & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v18 + 8 * (v35 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v18 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v18 + 8 * v36);
      }
      while (v40 == -1);
      v21 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v22 = (_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v21);
    *v22 = v31;
    v22[1] = v30;
    result = sub_1CAC3815C((uint64_t)v10, *(_QWORD *)(v13 + 56) + v32 * v21, v48);
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v6 = v43;
  v26 = v45;
  if ((v47 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v11 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v11 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v6 = v13;
  return result;
}

uint64_t sub_1CAD48570(uint64_t a1, char a2)
{
  return sub_1CAD4858C(a1, a2, &qword_1ED858C98, (void (*)(uint64_t, _BYTE *))sub_1CAC47240, (void (*)(uint64_t, _BYTE *))sub_1CAC27E30);
}

uint64_t sub_1CAD4858C(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, _BYTE *), void (*a5)(uint64_t, _BYTE *))
{
  uint64_t *v5;
  uint64_t *v7;
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
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  uint64_t v40;
  char v42;
  _BYTE v43[32];

  v7 = v5;
  v9 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v42 = a2;
  v10 = sub_1CADC3FBC();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v40 = v9 + 64;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  else
    v13 = -1;
  v14 = v13 & *(_QWORD *)(v9 + 64);
  v38 = v5;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v15 = v10 + 64;
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
    if (v22 >= v39)
      break;
    v23 = (_QWORD *)(v9 + 64);
    v24 = *(_QWORD *)(v40 + 8 * v22);
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = *(_QWORD *)(v40 + 8 * v17);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v7 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = *(_QWORD *)(v40 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v39)
              goto LABEL_34;
            v24 = *(_QWORD *)(v40 + 8 * v17);
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
    v26 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v9 + 56) + 32 * v21;
    if ((v42 & 1) != 0)
    {
      a4(v29, v43);
    }
    else
    {
      a5(v29, v43);
      swift_bridgeObjectRetain();
    }
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
    v30 = -1 << *(_BYTE *)(v11 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v35 = v32 == v34;
        if (v32 == v34)
          v32 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v15 + 8 * v32);
      }
      while (v36 == -1);
      v18 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = ((uint64_t (*)(_BYTE *, unint64_t))a4)(v43, *(_QWORD *)(v11 + 56) + 32 * v18);
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v7 = v38;
  v23 = (_QWORD *)(v9 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v37 = 1 << *(_BYTE *)(v9 + 32);
  if (v37 >= 64)
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v37;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v7 = v11;
  return result;
}

uint64_t sub_1CAD488B4(uint64_t a1, char a2)
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
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t i;
  char v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981B78);
  v43 = a2;
  v6 = sub_1CADC3FBC();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v41 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v40 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v44 = v13;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v40)
          goto LABEL_33;
        v23 = v41[v22];
        v24 = v13 + 1;
        if (!v23)
        {
          v24 = v13 + 2;
          if (v13 + 2 >= v40)
            goto LABEL_33;
          v23 = v41[v24];
          if (!v23)
          {
            v25 = v13 + 3;
            if (v13 + 3 >= v40)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v43 & 1) != 0)
              {
                v39 = 1 << *(_BYTE *)(v5 + 32);
                if (v39 >= 64)
                  bzero(v41, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v41 = -1 << v39;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v41[v25];
            if (!v23)
            {
              while (1)
              {
                v24 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v24 >= v40)
                  goto LABEL_33;
                v23 = v41[v24];
                ++v25;
                if (v23)
                  goto LABEL_30;
              }
            }
            v24 = v13 + 3;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v44 = v24;
        v21 = __clz(__rbit64(v23)) + (v24 << 6);
      }
      v30 = *(_QWORD *)(v5 + 56);
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v33 = *v31;
      v32 = v31[1];
      v34 = (uint64_t *)(v30 + (v21 << 6));
      v35 = v34[1];
      v36 = v34[3];
      v37 = v34[5];
      v47 = v34[4];
      v48 = v34[2];
      v38 = v34[7];
      v45 = *v34;
      v46 = v34[6];
      if ((v43 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_1CADC41A8();
      sub_1CADC3908();
      result = sub_1CADC41D8();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v16 == v27;
          if (v16 == v27)
            v16 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v29 == -1);
        v17 = __clz(__rbit64(~v29)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      *v18 = v33;
      v18[1] = v32;
      v19 = (_QWORD *)(*(_QWORD *)(v7 + 56) + (v17 << 6));
      v13 = v44;
      *v19 = v45;
      v19[1] = v35;
      v19[2] = v48;
      v19[3] = v36;
      v19[4] = v47;
      v19[5] = v37;
      v19[6] = v46;
      v19[7] = v38;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CAD48C10(uint64_t a1, char a2)
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
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8555F8);
  v37 = a2;
  v6 = sub_1CADC3FBC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
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
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
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
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
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

uint64_t sub_1CAD48F18(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985040);
  result = sub_1CADC3FBC();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v32 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v32)
          goto LABEL_33;
        v21 = v33[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v32)
            goto LABEL_33;
          v21 = v33[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v32)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v33[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v32)
                  goto LABEL_33;
                v21 = v33[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = 8 * v19;
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v27);
      v29 = *(void **)(*(_QWORD *)(v5 + 56) + v27);
      if ((a2 & 1) == 0)
        v30 = v29;
      sub_1CADC41A8();
      sub_1CADC41B4();
      result = sub_1CADC41D8();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = 8 * v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v17) = v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v17) = v29;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_1CAD491E8(uint64_t a1, char a2)
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
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985198);
  v37 = a2;
  v6 = sub_1CADC3FBC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
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
    v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v20);
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v20);
    v31 = *v30;
    v32 = v30[1];
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1CADC41A8();
    sub_1CADC3D40();
    result = sub_1CADC41D8();
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
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v17) = v29;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v17);
    *v18 = v31;
    v18[1] = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
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

uint64_t sub_1CAD494EC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985190);
  v36 = a2;
  v6 = sub_1CADC3FBC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v2;
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v35 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v35 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v35 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v35 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((v36 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1CADC41A8();
    sub_1CADC3D40();
    result = sub_1CADC41D8();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v23 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v23, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CAD497E4(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v37 = a2;
  v7 = sub_1CADC3FBC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v36 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_33:
          swift_release();
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v35)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v6 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_1CAD49AF4(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_1CADC3FBC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_1CADC41A8();
    sub_1CADC3908();
    result = sub_1CADC41D8();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

void sub_1CAD49DFC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _OWORD v27[2];
  uint64_t v28;

  v4 = v3;
  v8 = *v3;
  v10 = sub_1CAC5C35C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1CAD4B774();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      v18 = 8 * v10;

      *(_QWORD *)(v17 + v18) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_1CAD45684(v13, a3 & 1);
  v19 = sub_1CAC5C35C(a2);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_16:
    sub_1CADC4130();
    __break(1u);
    return;
  }
  v10 = v19;
  v16 = (_QWORD *)*v4;
  if ((v14 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  sub_1CAC1C6E8(a2, (uint64_t)v27);
  v16[(v10 >> 6) + 8] |= 1 << v10;
  v21 = v16[6] + 40 * v10;
  v22 = v28;
  v23 = v27[1];
  *(_OWORD *)v21 = v27[0];
  *(_OWORD *)(v21 + 16) = v23;
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v16[7] + 8 * v10) = a1;
  v24 = v16[2];
  v25 = __OFADD__(v24, 1);
  v26 = v24 + 1;
  if (v25)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v16[2] = v26;
}

uint64_t sub_1CAD49F5C(uint64_t a1, uint64_t *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1CAC5C3F0(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = sub_1CADC34B8();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1CAD4B94C();
      goto LABEL_7;
    }
    sub_1CAD45994(v13, a3 & 1);
    v20 = sub_1CAC5C3F0(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CAD4B494(v10, (uint64_t)a2, a1, v16);
      return sub_1CAC601E8((uint64_t)a2);
    }
  }
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4A088(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  char v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v4 = v3;
  v8 = *v3;
  v10 = sub_1CAC5C3F0((uint64_t *)a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_1CAD4BBE8();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v21 = v16[6] + 152 * v10;
    v23 = *(_OWORD *)(a2 + 64);
    v22 = *(_OWORD *)(a2 + 80);
    v24 = *(_OWORD *)(a2 + 48);
    *(_OWORD *)(v21 + 32) = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(v21 + 48) = v24;
    *(_OWORD *)(v21 + 64) = v23;
    *(_OWORD *)(v21 + 80) = v22;
    v25 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)v21 = *(_OWORD *)a2;
    *(_OWORD *)(v21 + 16) = v25;
    v26 = *(_OWORD *)(a2 + 96);
    v27 = *(_OWORD *)(a2 + 112);
    v28 = *(_OWORD *)(a2 + 128);
    *(_QWORD *)(v21 + 144) = *(_QWORD *)(a2 + 144);
    *(_OWORD *)(v21 + 112) = v27;
    *(_OWORD *)(v21 + 128) = v28;
    *(_OWORD *)(v21 + 96) = v26;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v29 = v16[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v16[2] = v31;
      return sub_1CAC601E8(a2);
    }
    goto LABEL_14;
  }
  sub_1CAD46008(v13, a3 & 1);
  v19 = sub_1CAC5C3F0((uint64_t *)a2);
  if ((v14 & 1) == (v20 & 1))
  {
    v10 = v19;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4A208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t result;
  unint64_t v23;
  char v24;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_1CAC5C3F0(a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = (uint64_t *)(v20[7] + 24 * v14);
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        *v21 = a1;
        v21[1] = a2;
        v21[2] = a3;
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_1CAD4BDEC();
      goto LABEL_7;
    }
    sub_1CAD46444(v17, a5 & 1);
    v23 = sub_1CAC5C3F0(a4);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CAD4B554(v14, (uint64_t)a4, a1, a2, a3, v20);
      return sub_1CAC601E8((uint64_t)a4);
    }
  }
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4A350(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_1CADC311C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_1CAC5C448(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_1CAD4C020();
    goto LABEL_7;
  }
  sub_1CAD468C0(v17, a3 & 1);
  v23 = sub_1CAC5C448(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_1CADC4130();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_1CAD4B5D8(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_1CAD4A4AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1CAD4A948(a1, a2, a3, a4, &qword_1ED855600);
}

void sub_1CAD4A4B8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_1CAD4B1A8(a1, a2, a3, a4, &qword_1ED858C90);
}

uint64_t sub_1CAD4A4C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1CAC5C38C(a2, a3);
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
    sub_1CAD4C41C();
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
  sub_1CAD46F78(v15, a4 & 1);
  v21 = sub_1CAC5C38C(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4A620(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1CAD4B330(a1, a2, a3, a4, type metadata accessor for TaskRecord, &qword_1ED858C50);
}

uint64_t sub_1CAD4A634(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1CAD4A65C(a1, a2, a3, a4, &qword_1ED858C68, (uint64_t (*)(uint64_t, uint64_t))sub_1CAC25FBC);
}

uint64_t sub_1CAD4A648(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1CAD4A65C(a1, a2, a3, a4, &qword_1ED858C60, (uint64_t (*)(uint64_t, uint64_t))sub_1CAC25FBC);
}

uint64_t sub_1CAD4A65C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  _QWORD *v6;
  _QWORD **v8;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;

  v8 = (_QWORD **)v6;
  v13 = (_QWORD *)*v6;
  v15 = sub_1CAC5C38C(a2, a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
  }
  else
  {
    v19 = v14;
    v20 = v13[3];
    if (v20 >= v18 && (a4 & 1) != 0)
    {
LABEL_7:
      v21 = *v8;
      if ((v19 & 1) != 0)
      {
LABEL_8:
        v22 = v21[7] + 40 * v15;
        __swift_destroy_boxed_opaque_existential_1(v22);
        return a6(a1, v22);
      }
      goto LABEL_11;
    }
    if (v20 >= v18 && (a4 & 1) == 0)
    {
      sub_1CAD4C5F8(a5, (void (*)(_BYTE *, uint64_t))a6);
      goto LABEL_7;
    }
    sub_1CAD4728C(v18, a4 & 1, a5, (void (*)(uint64_t, _BYTE *))a6);
    v24 = sub_1CAC5C38C(a2, a3);
    if ((v19 & 1) == (v25 & 1))
    {
      v15 = v24;
      v21 = *v8;
      if ((v19 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CAD4B670(v15, a2, a3, a1, v21, a6);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4A7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1CAC5C38C(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1CAD4C820();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CAD475C8(v17, a5 & 1);
  v23 = sub_1CAC5C38C(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4A93C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1CAD4A948(a1, a2, a3, a4, &qword_1ED858C78);
}

uint64_t sub_1CAD4A948(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v7 = v5;
  v12 = *v5;
  v14 = sub_1CAC5C38C(a2, a3);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_1CAD4CC20(a5);
LABEL_7:
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_release();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a2;
    v25[1] = a3;
    *(_QWORD *)(v20[7] + 8 * v14) = a1;
    v26 = v20[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (!v27)
    {
      v20[2] = v28;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CAD47ED8(v17, a4 & 1, a5);
  v23 = sub_1CAC5C38C(a2, a3);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4AABC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CAC5C38C(a2, a3);
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
    sub_1CAD4C9D8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_1CAD52654(a1, v18[7] + 200 * v12);
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    v23 = v18[7] + 200 * v12;
    *(_OWORD *)v23 = *(_OWORD *)a1;
    v24 = *(_OWORD *)(a1 + 16);
    v25 = *(_OWORD *)(a1 + 32);
    v26 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v23 + 48) = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v23 + 64) = v26;
    *(_OWORD *)(v23 + 16) = v24;
    *(_OWORD *)(v23 + 32) = v25;
    v27 = *(_OWORD *)(a1 + 80);
    v28 = *(_OWORD *)(a1 + 96);
    v29 = *(_OWORD *)(a1 + 128);
    *(_OWORD *)(v23 + 112) = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(v23 + 128) = v29;
    *(_OWORD *)(v23 + 80) = v27;
    *(_OWORD *)(v23 + 96) = v28;
    v30 = *(_OWORD *)(a1 + 144);
    v31 = *(_OWORD *)(a1 + 160);
    v32 = *(_OWORD *)(a1 + 176);
    *(_QWORD *)(v23 + 192) = *(_QWORD *)(a1 + 192);
    *(_OWORD *)(v23 + 160) = v31;
    *(_OWORD *)(v23 + 176) = v32;
    *(_OWORD *)(v23 + 144) = v30;
    v33 = v18[2];
    v34 = __OFADD__(v33, 1);
    v35 = v33 + 1;
    if (!v34)
    {
      v18[2] = v35;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CAD478EC(v15, a4 & 1);
  v20 = sub_1CAC5C38C(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_1CAD52654(a1, v18[7] + 200 * v12);
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4AC58(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1CAD4A948(a1, a2, a3, a4, &qword_1ED855608);
}

uint64_t sub_1CAD4AC64(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CAC5C38C(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1CAD4D420();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v18[7] + v12) = a1 & 1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_BYTE *)(v18[7] + v12) = a1 & 1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1CAD48C10(result, a4 & 1);
  result = sub_1CAC5C38C(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4ADBC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1CAC5C58C(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1CAD4D768();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_bridgeObjectRelease();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_QWORD *)(v18[6] + 8 * v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_1CAD491E8(result, a4 & 1);
  result = sub_1CAC5C58C(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for KGElementIdentifier(0);
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4AEF8(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_1CAC5C58C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_1CAD4D914();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_1CAD494EC(result, a3 & 1);
  result = sub_1CAC5C58C(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  type metadata accessor for KGElementIdentifier(0);
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4B030(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1CAC5C38C(a2, a3);
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
    sub_1CAD4DAB4(&qword_1EF985188);
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
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
  sub_1CAD497E4(v15, a4 & 1, &qword_1EF985188);
  v21 = sub_1CAC5C38C(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

void sub_1CAD4B19C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_1CAD4B1A8(a1, a2, a3, a4, &qword_1ED858C88);
}

void sub_1CAD4B1A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v7 = v5;
  v12 = *v5;
  v14 = sub_1CAC5C38C(a2, a3);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_1CAD4DC6C(a5);
LABEL_7:
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];

      *(_QWORD *)(v21 + 8 * v14) = a1;
      return;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v24 = (uint64_t *)(v20[6] + 16 * v14);
    *v24 = a2;
    v24[1] = a3;
    *(_QWORD *)(v20[7] + 8 * v14) = a1;
    v25 = v20[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (!v26)
    {
      v20[2] = v27;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_1CAD49AF4(v17, a4 & 1, a5);
  v22 = sub_1CAC5C38C(a2, a3);
  if ((v18 & 1) == (v23 & 1))
  {
    v14 = v22;
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1CADC4130();
  __break(1u);
}

uint64_t sub_1CAD4B31C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1CAD4B330(a1, a2, a3, a4, type metadata accessor for UserAnalyticsOutputSample, &qword_1ED858C70);
}

uint64_t sub_1CAD4B330(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(_QWORD), uint64_t *a6)
{
  _QWORD *v6;
  _QWORD **v9;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;

  v9 = (_QWORD **)v6;
  v14 = (_QWORD *)*v6;
  v16 = sub_1CAC5C38C(a2, a3);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
  }
  else
  {
    v20 = v15;
    v21 = v14[3];
    if (v21 >= v19 && (a4 & 1) != 0)
    {
LABEL_7:
      v22 = *v9;
      if ((v20 & 1) != 0)
      {
LABEL_8:
        v23 = v22[7];
        v24 = a5(0);
        return sub_1CAD51D20(a1, v23 + *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72) * v16, a5);
      }
      goto LABEL_11;
    }
    if (v21 >= v19 && (a4 & 1) == 0)
    {
      sub_1CAD4CDE0(a5, a6);
      goto LABEL_7;
    }
    sub_1CAD481FC(v19, a4 & 1, a5, a6);
    v26 = sub_1CAC5C38C(a2, a3);
    if ((v20 & 1) == (v27 & 1))
    {
      v16 = v26;
      v22 = *v9;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CAD4B6DC(v16, a2, a3, a1, v22, a5);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1CADC4130();
  __break(1u);
  return result;
}

uint64_t sub_1CAD4B494(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v7 = *(_OWORD *)(a2 + 112);
  v8 = a4[6] + 152 * a1;
  *(_OWORD *)(v8 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(v8 + 112) = v7;
  *(_OWORD *)(v8 + 128) = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(v8 + 144) = *(_QWORD *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v8 + 48) = v9;
  v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v8 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v8 + 80) = v10;
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v11;
  v12 = a4[7];
  v13 = sub_1CADC34B8();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12 + *(_QWORD *)(*(_QWORD *)(v13 - 8) + 72) * a1, a3, v13);
  v15 = a4[2];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    a4[2] = v17;
  return result;
}

unint64_t sub_1CAD4B554(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = a6[6] + 152 * result;
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(v6 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(v6 + 112) = v7;
  *(_OWORD *)(v6 + 128) = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(v6 + 144) = *(_QWORD *)(a2 + 144);
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v6 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v6 + 48) = v8;
  v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(v6 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(v6 + 80) = v9;
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v6 = *(_OWORD *)a2;
  *(_OWORD *)(v6 + 16) = v10;
  v11 = (_QWORD *)(a6[7] + 24 * result);
  *v11 = a3;
  v11[1] = a4;
  v11[2] = a5;
  v12 = a6[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a6[2] = v14;
  return result;
}

uint64_t sub_1CAD4B5D8(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1CADC311C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_1CAD4B670(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  _QWORD *v7;
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v7 = (_QWORD *)(a5[6] + 16 * a1);
  *v7 = a2;
  v7[1] = a3;
  result = a6(a4, a5[7] + 40 * a1);
  v9 = a5[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a5[2] = v11;
  return result;
}

uint64_t sub_1CAD4B6DC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(_QWORD))
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v10 = (_QWORD *)(a5[6] + 16 * a1);
  *v10 = a2;
  v10[1] = a3;
  v11 = a5[7];
  v12 = a6(0);
  result = sub_1CAC3815C(a4, v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * a1, a6);
  v14 = a5[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a5[2] = v16;
  return result;
}

id sub_1CAD4B774()
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
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED856278);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    sub_1CAC1C6E8(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    v16 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v15);
    v17 = *(_QWORD *)(v4 + 48) + 40 * v15;
    v18 = v23[0];
    v19 = v23[1];
    *(_QWORD *)(v17 + 32) = v24;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = v16;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4B94C()
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
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int64_t v37;
  unint64_t v38;
  int64_t v39;
  uint64_t *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v1 = v0;
  v2 = sub_1CADC34B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9853C0);
  v6 = *v0;
  v7 = sub_1CADC3FB0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v8;
    return result;
  }
  v40 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v41 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v37 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v37 >= v16)
      goto LABEL_26;
    v38 = *(_QWORD *)(v41 + 8 * v37);
    ++v12;
    if (!v38)
    {
      v12 = v37 + 1;
      if (v37 + 1 >= v16)
        goto LABEL_26;
      v38 = *(_QWORD *)(v41 + 8 * v12);
      if (!v38)
        break;
    }
LABEL_25:
    v15 = (v38 - 1) & v38;
    v18 = __clz(__rbit64(v38)) + (v12 << 6);
LABEL_12:
    v19 = 152 * v18;
    v20 = *(_QWORD *)(v6 + 48) + 152 * v18;
    v21 = *(_OWORD *)(v20 + 32);
    v22 = *(_OWORD *)(v20 + 48);
    v23 = *(_OWORD *)(v20 + 80);
    v46 = *(_OWORD *)(v20 + 64);
    v47 = v23;
    v45 = v22;
    v24 = *(_OWORD *)(v20 + 96);
    v25 = *(_OWORD *)(v20 + 112);
    v26 = *(_OWORD *)(v20 + 128);
    v51 = *(_QWORD *)(v20 + 144);
    v49 = v25;
    v50 = v26;
    v48 = v24;
    v27 = *(_OWORD *)(v20 + 16);
    v42 = *(_OWORD *)v20;
    v43 = v27;
    v44 = v21;
    v28 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 56) + v28, v2);
    v29 = *(_QWORD *)(v8 + 48) + v19;
    v30 = v48;
    v31 = v49;
    v32 = v50;
    *(_QWORD *)(v29 + 144) = v51;
    *(_OWORD *)(v29 + 112) = v31;
    *(_OWORD *)(v29 + 128) = v32;
    *(_OWORD *)(v29 + 96) = v30;
    v33 = v44;
    v34 = v45;
    v35 = v47;
    *(_OWORD *)(v29 + 64) = v46;
    *(_OWORD *)(v29 + 80) = v35;
    *(_OWORD *)(v29 + 32) = v33;
    *(_OWORD *)(v29 + 48) = v34;
    v36 = v43;
    *(_OWORD *)v29 = v42;
    *(_OWORD *)(v29 + 16) = v36;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 56) + v28, v5, v2);
    result = (void *)sub_1CAC601E8((uint64_t)&v42);
  }
  v39 = v37 + 2;
  if (v39 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v40;
    goto LABEL_28;
  }
  v38 = *(_QWORD *)(v41 + 8 * v39);
  if (v38)
  {
    v12 = v39;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v39 + 1;
    if (__OFADD__(v39, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v38 = *(_QWORD *)(v41 + 8 * v12);
    ++v39;
    if (v38)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1CAD4BBE8()
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
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  _OWORD v29[9];
  uint64_t v30;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9853C8);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = (_OWORD *)(*(_QWORD *)(v2 + 48) + 152 * v15);
    v17 = v16[2];
    v18 = v16[3];
    v19 = v16[5];
    v29[4] = v16[4];
    v29[5] = v19;
    v29[3] = v18;
    v20 = v16[6];
    v21 = v16[7];
    v22 = v16[8];
    v30 = *((_QWORD *)v16 + 18);
    v29[7] = v21;
    v29[8] = v22;
    v29[6] = v20;
    v23 = v16[1];
    v29[0] = *v16;
    v29[1] = v23;
    v29[2] = v17;
    v24 = 8 * v15;
    v25 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    memmove((void *)(*(_QWORD *)(v4 + 48) + 152 * v15), v16, 0x98uLL);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v24) = v25;
    sub_1CAC601E8((uint64_t)v29);
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4BDEC()
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
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t *v34;
  _OWORD v35[9];
  uint64_t v36;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9853B8);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v34 = v1;
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
    v31 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v31 >= v13)
      goto LABEL_26;
    v32 = *(_QWORD *)(v6 + 8 * v31);
    ++v9;
    if (!v32)
    {
      v9 = v31 + 1;
      if (v31 + 1 >= v13)
        goto LABEL_26;
      v32 = *(_QWORD *)(v6 + 8 * v9);
      if (!v32)
        break;
    }
LABEL_25:
    v12 = (v32 - 1) & v32;
    v15 = __clz(__rbit64(v32)) + (v9 << 6);
LABEL_12:
    v16 = 152 * v15;
    v17 = (_OWORD *)(*(_QWORD *)(v2 + 48) + 152 * v15);
    v18 = v17[2];
    v19 = v17[3];
    v20 = v17[5];
    v35[4] = v17[4];
    v35[5] = v20;
    v35[3] = v19;
    v21 = v17[6];
    v22 = v17[7];
    v23 = v17[8];
    v36 = *((_QWORD *)v17 + 18);
    v35[7] = v22;
    v35[8] = v23;
    v35[6] = v21;
    v24 = v17[1];
    v35[0] = *v17;
    v35[1] = v24;
    v35[2] = v18;
    v25 = 24 * v15;
    v26 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 24 * v15);
    v28 = *v26;
    v27 = v26[1];
    v29 = v26[2];
    memmove((void *)(*(_QWORD *)(v4 + 48) + v16), v17, 0x98uLL);
    v30 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v25);
    *v30 = v28;
    v30[1] = v27;
    v30[2] = v29;
    sub_1CAC601E8((uint64_t)v35);
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v33 = v31 + 2;
  if (v33 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v34;
    goto LABEL_28;
  }
  v32 = *(_QWORD *)(v6 + 8 * v33);
  if (v32)
  {
    v9 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v32 = *(_QWORD *)(v6 + 8 * v9);
    ++v33;
    if (v32)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1CAD4C020()
{
  uint64_t *v0;
  uint64_t v1;
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
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_1CADC311C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985388);
  v24 = v0;
  v5 = *v0;
  v6 = sub_1CADC3FB0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4C250()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858C80);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_1CAD4C3FC()
{
  return sub_1CAD4C5F8(&qword_1ED858C58, (void (*)(_BYTE *, uint64_t))sub_1CAC25FBC);
}

id sub_1CAD4C410()
{
  return sub_1CAD4DC6C(&qword_1ED858C90);
}

void *sub_1CAD4C41C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858C48);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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

void *sub_1CAD4C5D0()
{
  return sub_1CAD4CDE0(type metadata accessor for TaskRecord, &qword_1ED858C50);
}

void *sub_1CAD4C5E4()
{
  return sub_1CAD4C5F8(&qword_1ED858C68, (void (*)(_BYTE *, uint64_t))sub_1CAC25FBC);
}

void *sub_1CAD4C5F8(uint64_t *a1, void (*a2)(_BYTE *, uint64_t))
{
  uint64_t *v2;
  uint64_t *v4;
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
  uint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t *v27;
  uint64_t v28;
  _BYTE v29[40];

  v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v5 = *v2;
  v6 = sub_1CADC3FB0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v4 = v7;
    return result;
  }
  v27 = v4;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v28 = v5 + 64;
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
    v25 = *(_QWORD *)(v28 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v28 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v20 = *v19;
    v21 = v19[1];
    v22 = 40 * v17;
    sub_1CAC1F9EC(*(_QWORD *)(v5 + 56) + 40 * v17, (uint64_t)v29);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v20;
    v23[1] = v21;
    a2(v29, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v4 = v27;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v28 + 8 * v26);
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
    v25 = *(_QWORD *)(v28 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1CAD4C7E4()
{
  return sub_1CAD4DAB4(&qword_1ED8555F0);
}

void *sub_1CAD4C7F0()
{
  return sub_1CAD4C5F8(&qword_1ED858C60, (void (*)(_BYTE *, uint64_t))sub_1CAC25FBC);
}

void *sub_1CAD4C804()
{
  return sub_1CAD4D02C(&qword_1ED855610, (void (*)(unint64_t, _BYTE *))sub_1CAC27E30, (void (*)(_BYTE *, uint64_t))sub_1CAC47240);
}

void *sub_1CAD4C820()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981B80);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4C9D8()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int64_t v42;
  unint64_t v43;
  int64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9853D0);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    v42 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v42 >= v13)
      goto LABEL_26;
    v43 = *(_QWORD *)(v6 + 8 * v42);
    ++v9;
    if (!v43)
    {
      v9 = v42 + 1;
      if (v42 + 1 >= v13)
        goto LABEL_26;
      v43 = *(_QWORD *)(v6 + 8 * v9);
      if (!v43)
        break;
    }
LABEL_25:
    v12 = (v43 - 1) & v43;
    v15 = __clz(__rbit64(v43)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 200 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v23 = *(_OWORD *)(v21 + 16);
    v22 = *(_OWORD *)(v21 + 32);
    v24 = *(_OWORD *)(v21 + 64);
    v48 = *(_OWORD *)(v21 + 48);
    v49 = v24;
    v25 = *(_OWORD *)(v21 + 128);
    v27 = *(_OWORD *)(v21 + 80);
    v26 = *(_OWORD *)(v21 + 96);
    v52 = *(_OWORD *)(v21 + 112);
    v53 = v25;
    v50 = v27;
    v51 = v26;
    v29 = *(_OWORD *)(v21 + 160);
    v28 = *(_OWORD *)(v21 + 176);
    v30 = *(_OWORD *)(v21 + 144);
    v57 = *(_QWORD *)(v21 + 192);
    v55 = v29;
    v56 = v28;
    v54 = v30;
    v45 = *(_OWORD *)v21;
    v46 = v23;
    v47 = v22;
    v31 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v31 = v19;
    v31[1] = v18;
    v32 = *(_QWORD *)(v4 + 56) + v20;
    *(_OWORD *)v32 = v45;
    v33 = v46;
    v34 = v47;
    v35 = v49;
    *(_OWORD *)(v32 + 48) = v48;
    *(_OWORD *)(v32 + 64) = v35;
    *(_OWORD *)(v32 + 16) = v33;
    *(_OWORD *)(v32 + 32) = v34;
    v36 = v50;
    v37 = v51;
    v38 = v53;
    *(_OWORD *)(v32 + 112) = v52;
    *(_OWORD *)(v32 + 128) = v38;
    *(_OWORD *)(v32 + 80) = v36;
    *(_OWORD *)(v32 + 96) = v37;
    v39 = v54;
    v40 = v55;
    v41 = v56;
    *(_QWORD *)(v32 + 192) = v57;
    *(_OWORD *)(v32 + 160) = v40;
    *(_OWORD *)(v32 + 176) = v41;
    *(_OWORD *)(v32 + 144) = v39;
    swift_bridgeObjectRetain();
    result = (void *)sub_1CAC36C48((uint64_t)&v45);
  }
  v44 = v42 + 2;
  if (v44 >= v13)
    goto LABEL_26;
  v43 = *(_QWORD *)(v6 + 8 * v44);
  if (v43)
  {
    v9 = v44;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v44 + 1;
    if (__OFADD__(v44, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v43 = *(_QWORD *)(v6 + 8 * v9);
    ++v44;
    if (v43)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4CC20(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1CADC3FB0();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4CDCC()
{
  return sub_1CAD4CDE0((uint64_t (*)(_QWORD))type metadata accessor for PersonalTraitsGenerationHelper.PersonalTraitInfo, &qword_1EF981BB0);
}

void *sub_1CAD4CDE0(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t *v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;

  v5 = a1(0);
  v32 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v29 - v6;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v29 = v2;
  v8 = *v2;
  v9 = sub_1CADC3FB0();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v29 = v10;
    return result;
  }
  result = (void *)(v9 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12)
    result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  v30 = v8 + 64;
  v14 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v15 = 1 << *(_BYTE *)(v8 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v8 + 64);
  v31 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v18 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v19 = v18 | (v14 << 6);
      goto LABEL_12;
    }
    v26 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v31)
      goto LABEL_26;
    v27 = *(_QWORD *)(v30 + 8 * v26);
    ++v14;
    if (!v27)
    {
      v14 = v26 + 1;
      if (v26 + 1 >= v31)
        goto LABEL_26;
      v27 = *(_QWORD *)(v30 + 8 * v14);
      if (!v27)
        break;
    }
LABEL_25:
    v17 = (v27 - 1) & v27;
    v19 = __clz(__rbit64(v27)) + (v14 << 6);
LABEL_12:
    v20 = 16 * v19;
    v21 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v19);
    v23 = *v21;
    v22 = v21[1];
    v24 = *(_QWORD *)(v32 + 72) * v19;
    sub_1CAC614B0(*(_QWORD *)(v8 + 56) + v24, (uint64_t)v7, a1);
    v25 = (_QWORD *)(*(_QWORD *)(v10 + 48) + v20);
    *v25 = v23;
    v25[1] = v22;
    sub_1CAC3815C((uint64_t)v7, *(_QWORD *)(v10 + 56) + v24, a1);
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v31)
    goto LABEL_26;
  v27 = *(_QWORD *)(v30 + 8 * v28);
  if (v27)
  {
    v14 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v14 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v14 >= v31)
      goto LABEL_26;
    v27 = *(_QWORD *)(v30 + 8 * v14);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4D010()
{
  return sub_1CAD4D02C(&qword_1ED858C98, (void (*)(unint64_t, _BYTE *))sub_1CAC27E30, (void (*)(_BYTE *, uint64_t))sub_1CAC47240);
}

void *sub_1CAD4D02C(uint64_t *a1, void (*a2)(unint64_t, _BYTE *), void (*a3)(_BYTE *, uint64_t))
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  _BYTE v31[32];

  v5 = v3;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v6 = *v3;
  v7 = sub_1CADC3FB0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v5 = v8;
    return result;
  }
  v28 = v5;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v29 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v25 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v16)
      goto LABEL_26;
    v26 = *(_QWORD *)(v29 + 8 * v25);
    ++v12;
    if (!v26)
    {
      v12 = v25 + 1;
      if (v25 + 1 >= v16)
        goto LABEL_26;
      v26 = *(_QWORD *)(v29 + 8 * v12);
      if (!v26)
        break;
    }
LABEL_25:
    v15 = (v26 - 1) & v26;
    v18 = __clz(__rbit64(v26)) + (v12 << 6);
LABEL_12:
    v19 = 16 * v18;
    v20 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v18);
    v21 = *v20;
    v22 = v20[1];
    v23 = 32 * v18;
    a2(*(_QWORD *)(v6 + 56) + 32 * v18, v31);
    v24 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v24 = v21;
    v24[1] = v22;
    a3(v31, *(_QWORD *)(v8 + 56) + v23);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v5 = v28;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v29 + 8 * v27);
  if (v26)
  {
    v12 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v26 = *(_QWORD *)(v29 + 8 * v12);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1CAD4D21C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  uint64_t v5;
  unint64_t v6;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t *v34;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF981B78);
  v34 = v0;
  v1 = *v0;
  v2 = sub_1CADC3FB0();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v34 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = v1 + 64;
  v6 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v6)
    result = memmove(result, (const void *)(v1 + 64), 8 * v6);
  v8 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v9 = 1 << *(_BYTE *)(v1 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(v1 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    v31 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v31 >= v12)
      goto LABEL_26;
    v32 = *(_QWORD *)(v5 + 8 * v31);
    ++v8;
    if (!v32)
    {
      v8 = v31 + 1;
      if (v31 + 1 >= v12)
        goto LABEL_26;
      v32 = *(_QWORD *)(v5 + 8 * v8);
      if (!v32)
        break;
    }
LABEL_25:
    v11 = (v32 - 1) & v32;
    v14 = __clz(__rbit64(v32)) + (v8 << 6);
LABEL_12:
    v15 = 16 * v14;
    v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v14);
    v18 = *v16;
    v17 = v16[1];
    v19 = v14 << 6;
    v20 = (uint64_t *)(*(_QWORD *)(v1 + 56) + v19);
    v21 = *v20;
    v22 = v20[1];
    v23 = v20[2];
    v24 = v20[3];
    v25 = v20[4];
    v26 = v20[5];
    v27 = v20[6];
    v28 = v20[7];
    v29 = (_QWORD *)(*(_QWORD *)(v3 + 48) + v15);
    *v29 = v18;
    v29[1] = v17;
    v30 = (_QWORD *)(*(_QWORD *)(v3 + 56) + v19);
    *v30 = v21;
    v30[1] = v22;
    v30[2] = v23;
    v30[3] = v24;
    v30[4] = v25;
    v30[5] = v26;
    v30[6] = v27;
    v30[7] = v28;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v33 = v31 + 2;
  if (v33 >= v12)
    goto LABEL_26;
  v32 = *(_QWORD *)(v5 + 8 * v33);
  if (v32)
  {
    v8 = v33;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v33 + 1;
    if (__OFADD__(v33, 1))
      break;
    if (v8 >= v12)
      goto LABEL_26;
    v32 = *(_QWORD *)(v5 + 8 * v8);
    ++v33;
    if (v32)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4D420()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8555F8);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1CAD4D5C8()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985040);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4D768()
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
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985198);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v21 = *v19;
    v20 = v19[1];
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v22 = v21;
    v22[1] = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4D914()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985190);
  v2 = *v0;
  v3 = sub_1CADC3FB0();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4DAB4(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1CADC3FB0();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1CAD4DC60()
{
  return sub_1CAD4DC6C(&qword_1ED858C88);
}

id sub_1CAD4DC6C(uint64_t *a1)
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
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1CADC3FB0();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
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
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAD4DE14()
{
  return sub_1CAD4CDE0(type metadata accessor for UserAnalyticsOutputSample, &qword_1ED858C70);
}

uint64_t sub_1CAD4DE28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(qword_1ED856F80);
  v3[6] = sub_1CAD5253C((unint64_t *)&unk_1EF980780, qword_1ED856F80);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4DEA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF9853A0 + dword_1EF9853A0);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4E1D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985310);
  v3[6] = sub_1CAD5253C(&qword_1EF985318, &qword_1EF985310);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4E250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985330 + dword_1EF985330);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4E578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985350);
  v3[6] = sub_1CAD5253C(&qword_1EF985358, &qword_1EF985350);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4E5F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985370 + dword_1EF985370);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4E920(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9852D0);
  v3[6] = sub_1CAD5253C(&qword_1EF9852D8, &qword_1EF9852D0);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4E9A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF9852F0 + dword_1EF9852F0);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4ECC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8560F8);
  v3[6] = sub_1CAD5253C(&qword_1EF985298, &qword_1ED8560F8);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4ED48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF9852B0 + dword_1EF9852B0);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4F070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985258);
  v3[6] = sub_1CAD5253C(&qword_1EF985260, &qword_1EF985258);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4F0F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985278 + dword_1EF985278);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4F418(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8560F0);
  v3[6] = sub_1CAD5253C(&qword_1EF985220, &qword_1ED8560F0);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4F498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985238 + dword_1EF985238);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4F7C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8560E8);
  v3[6] = sub_1CAD5253C(&qword_1EF9851E8, &qword_1ED8560E8);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4F840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985200 + dword_1EF985200);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4FB68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9851A8);
  v3[6] = sub_1CAD5253C(&qword_1EF9851B0, &qword_1EF9851A8);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4FBE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF9851C8 + dword_1EF9851C8);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD4FF10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985110);
  v3[6] = sub_1CAD5253C(&qword_1EF985118, &qword_1EF985110);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD4FF90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985130 + dword_1EF985130);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD502B8;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD502B8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *v0 + 16;
  v3 = *v0;
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_1CAD5030C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF985150);
  v3[6] = sub_1CAD5253C(&qword_1EF985158, &qword_1EF985150);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD5038C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF985170 + dword_1EF985170);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD506B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  v3[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9850D0);
  v3[6] = sub_1CAD5253C(&qword_1EF9850D8, &qword_1EF9850D0);
  v3[2] = a1;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAD50734()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v1 = *(_QWORD *)(v0 + 128);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8562D0);
  v2 = swift_task_alloc();
  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_1CAC471FC(v3, v2, &qword_1ED8562D0);
  v4 = sub_1CADC2BF4();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4);
  sub_1CAC199B4(v2, &qword_1ED8562D0);
  swift_task_dealloc();
  if (v5 == 1)
  {
    v20 = (uint64_t (*)(uint64_t))((char *)&dword_1EF9850F0 + dword_1EF9850F0);
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v6;
    *v6 = v0;
    v6[1] = sub_1CAD5274C;
    return v20(*(_QWORD *)(v0 + 136));
  }
  else
  {
    v8 = v0 + 16;
    sub_1CAC1F9EC(v0 + 16, v0 + 56);
    v9 = sub_1CADC362C();
    v10 = sub_1CADC3C2C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 136315138;
      v12 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
      v13 = (_QWORD *)*v12;
      v14 = *(_QWORD *)(*v12 + 40);
      v15 = *(_QWORD *)(*v12 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v12 + 16), v14);
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
      v23 = v16;
      sub_1CADC3920();
      v17 = v13[5];
      v18 = v13[6];
      __swift_project_boxed_opaque_existential_1(v13 + 2, v17);
      (*(void (**)(uint64_t, uint64_t))(v18 + 40))(v17, v18);
      sub_1CADC3920();
      v8 = v0 + 16;
      swift_bridgeObjectRelease();
      *(_QWORD *)(v0 + 120) = sub_1CAC9CC44(v22, v23, &v21);
      sub_1CADC3E00();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
      _os_log_impl(&dword_1CAC16000, v9, v10, "Task %s already completed, bailing", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D1798B14](v19, -1, -1);
      MEMORY[0x1D1798B14](v11, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1(v0 + 56);
    }
    __swift_destroy_boxed_opaque_existential_1(v8);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAD50A5C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_1CAD50AC4;
  return v5(v2 + 16);
}

uint64_t sub_1CAD50AC4()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

_OWORD *sub_1CAD50B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6)
{
  uint64_t v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _OWORD *v20;
  _OWORD *result;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  v10 = MEMORY[0x1E0DEA968];
  v29 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v28 = a1;
  *((_QWORD *)&v28 + 1) = a2;
  v11 = (_QWORD *)*a6;
  v13 = sub_1CAC5C38C(a3, a4);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  v17 = v12;
  v18 = v11[3];
  if (v18 >= v16 && (a5 & 1) != 0)
  {
LABEL_7:
    v19 = (_QWORD *)*a6;
    if ((v17 & 1) != 0)
    {
LABEL_8:
      v20 = (_OWORD *)(v19[7] + 32 * v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      return sub_1CAC47240(&v28, v20);
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a5 & 1) == 0)
  {
    sub_1CAD4D02C(&qword_1ED855610, (void (*)(unint64_t, _BYTE *))sub_1CAC27E30, (void (*)(_BYTE *, uint64_t))sub_1CAC47240);
    goto LABEL_7;
  }
  sub_1CAD4858C(v16, a5 & 1, &qword_1ED855610, (void (*)(uint64_t, _BYTE *))sub_1CAC47240, (void (*)(uint64_t, _BYTE *))sub_1CAC27E30);
  v22 = sub_1CAC5C38C(a3, a4);
  if ((v17 & 1) != (v23 & 1))
  {
LABEL_14:
    result = (_OWORD *)sub_1CADC4130();
    __break(1u);
    return result;
  }
  v13 = v22;
  v19 = (_QWORD *)*a6;
  if ((v17 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v28, v10);
  MEMORY[0x1E0C80A78](v24);
  v26 = (uint64_t *)((char *)&v28 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v27 + 16))(v26);
  sub_1CAD50EBC(v13, a3, a4, *v26, v26[1], v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1CAD50CDC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, uint64_t *a6)
{
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _OWORD *v22;
  _OWORD *result;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v12 = __swift_instantiateConcreteTypeFromMangledName(a6);
  v31 = v12;
  *(_QWORD *)&v30 = a1;
  v13 = (_QWORD *)*a5;
  v15 = sub_1CAC5C38C(a2, a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    v21 = (_QWORD *)*a5;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = (_OWORD *)(v21[7] + 32 * v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      return sub_1CAC47240(&v30, v22);
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_1CAD4D02C(&qword_1ED855610, (void (*)(unint64_t, _BYTE *))sub_1CAC27E30, (void (*)(_BYTE *, uint64_t))sub_1CAC47240);
    goto LABEL_7;
  }
  sub_1CAD4858C(v18, a4 & 1, &qword_1ED855610, (void (*)(uint64_t, _BYTE *))sub_1CAC47240, (void (*)(uint64_t, _BYTE *))sub_1CAC27E30);
  v24 = sub_1CAC5C38C(a2, a3);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    result = (_OWORD *)sub_1CADC4130();
    __break(1u);
    return result;
  }
  v15 = v24;
  v21 = (_QWORD *)*a5;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v30, v12);
  MEMORY[0x1E0C80A78](v26);
  v28 = (uint64_t *)((char *)&v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v29 + 16))(v28);
  sub_1CAD50F3C(v15, a2, a3, *v28, v21, a6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1CAD50EBC(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v7;
  _OWORD *result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v13 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v12 = a4;
  *((_QWORD *)&v12 + 1) = a5;
  a6[(a1 >> 6) + 8] |= 1 << a1;
  v7 = (_QWORD *)(a6[6] + 16 * a1);
  *v7 = a2;
  v7[1] = a3;
  result = sub_1CAC47240(&v12, (_OWORD *)(a6[7] + 32 * a1));
  v9 = a6[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a6[2] = v11;
  return result;
}

_OWORD *sub_1CAD50F3C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t *a6)
{
  _QWORD *v11;
  _OWORD *result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = __swift_instantiateConcreteTypeFromMangledName(a6);
  *(_QWORD *)&v16 = a4;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v11 = (_QWORD *)(a5[6] + 16 * a1);
  *v11 = a2;
  v11[1] = a3;
  result = sub_1CAC47240(&v16, (_OWORD *)(a5[7] + 32 * a1));
  v13 = a5[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a5[2] = v15;
  return result;
}

uint64_t sub_1CAD50FDC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_1CAD51044;
  return v5(v2 + 32);
}

uint64_t sub_1CAD51044()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_1CAD51094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17[2];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  result = MEMORY[0x1E0DEE9D8];
  v21 = MEMORY[0x1E0DEE9D8];
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    for (i = a1 + 32; ; i += 40)
    {
      sub_1CAC1F9EC(i, (uint64_t)&v18);
      v9 = v19;
      v10 = v20;
      __swift_project_boxed_opaque_existential_1(&v18, v19);
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 32))(v9, v10) == a2 && v11 == a3)
        break;
      v13 = sub_1CADC40DC();
      swift_bridgeObjectRelease();
      if ((v13 & 1) != 0)
        goto LABEL_12;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
LABEL_4:
      if (!--v5)
        return v21;
    }
    swift_bridgeObjectRelease();
LABEL_12:
    sub_1CAC25FBC(&v18, (uint64_t)v17);
    v14 = v21;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_1CAC34B4C(0, *(_QWORD *)(v14 + 16) + 1, 1);
      v14 = v21;
    }
    v16 = *(_QWORD *)(v14 + 16);
    v15 = *(_QWORD *)(v14 + 24);
    if (v16 >= v15 >> 1)
    {
      sub_1CAC34B4C(v15 > 1, v16 + 1, 1);
      v14 = v21;
    }
    *(_QWORD *)(v14 + 16) = v16 + 1;
    sub_1CAC25FBC(v17, v14 + 40 * v16 + 32);
    goto LABEL_4;
  }
  return result;
}

uint64_t sub_1CAD5120C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED858D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for Executive.SendableShouldAcceptConnection()
{
  return objc_opt_self();
}

uint64_t sub_1CAD51274()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1CAD512B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int8x16_t *v5;
  int8x16_t v7;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = (_QWORD *)swift_task_alloc();
  v7 = *(int8x16_t *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1CAC262E4;
  v4[5] = v3;
  v4[4] = v7.i64[0];
  v4[3] = v2;
  v5 = (int8x16_t *)swift_task_alloc();
  v4[6] = v5;
  v5->i64[0] = (uint64_t)v4;
  v5->i64[1] = (uint64_t)sub_1CAD40B20;
  v5[2] = vextq_s8(v7, v7, 8uLL);
  return swift_task_switch();
}

unint64_t sub_1CAD51370()
{
  unint64_t result;

  result = qword_1EF984FB8;
  if (!qword_1EF984FB8)
  {
    result = MEMORY[0x1D1798A3C](&protocol conformance descriptor for Executive.Environment, &type metadata for Executive.Environment);
    atomic_store(result, (unint64_t *)&qword_1EF984FB8);
  }
  return result;
}

uint64_t sub_1CAD513B4(uint64_t a1)
{
  uint64_t result;

  result = sub_1CAC1CA60(&qword_1EF984FC8, (uint64_t (*)(uint64_t))type metadata accessor for Executive, (uint64_t)&protocol conformance descriptor for Executive);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for Executive()
{
  uint64_t result;

  result = qword_1ED855588;
  if (!qword_1ED855588)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CAD5142C()
{
  return type metadata accessor for Executive();
}

uint64_t sub_1CAD51434()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CADC3644();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for Executive()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Executive.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of Executive.__allocating_init(environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of Executive.startup()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 224) + *(_QWORD *)(*(_QWORD *)v0 + 224));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CAC262E4;
  return v4();
}

uint64_t dispatch thunk of Executive.shutdown()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 240) + *(_QWORD *)(*(_QWORD *)v0 + 240));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CAC262E4;
  return v4();
}

uint64_t dispatch thunk of Executive.listener(_:shouldAcceptNewConnection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of Executive.runOnDemand(taskName:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 288) + *(_QWORD *)(*(_QWORD *)v2 + 288));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1CAC46B2C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of Executive.activityStatus()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 296) + *(_QWORD *)(*(_QWORD *)v0 + 296));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CAC46B2C;
  return v4();
}

uint64_t dispatch thunk of Executive.status()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 376) + *(_QWORD *)(*(_QWORD *)v0 + 376));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CAC1F22C;
  return v4();
}

uint64_t storeEnumTagSinglePayload for Executive.Environment(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CAD5172C + 4 * byte_1CADD01FC[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CAD51760 + 4 * byte_1CADD01F7[v4]))();
}

uint64_t sub_1CAD51760(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAD51768(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAD51770);
  return result;
}

uint64_t sub_1CAD5177C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAD51784);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CAD51788(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAD51790(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Executive.Environment()
{
  return &type metadata for Executive.Environment;
}

uint64_t sub_1CAD517AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 >= 3u && a5 != 4)
  {
    if (a5 != 3)
      return result;
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

uint64_t destroy for PhotoAnalysisError(uint64_t a1)
{
  return sub_1CAD51814(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_1CAD51814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  if (a5 >= 3u && a5 != 4)
  {
    if (a5 != 3)
      return result;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PhotoAnalysisError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1CAD517AC(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for PhotoAnalysisError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1CAD517AC(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1CAD51814(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for PhotoAnalysisError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned __int8 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_1CAD51814(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoAnalysisError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoAnalysisError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_1CAD51A10(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_1CAD51A18(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PhotoAnalysisError()
{
  return &type metadata for PhotoAnalysisError;
}

unint64_t sub_1CAD51A34()
{
  unint64_t result;

  result = qword_1EF985038;
  if (!qword_1EF985038)
  {
    result = MEMORY[0x1D1798A3C](&unk_1CADD03C4, &type metadata for PhotoAnalysisError);
    atomic_store(result, (unint64_t *)&qword_1EF985038);
  }
  return result;
}

uint64_t sub_1CAD51A78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CAC262E4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF985058 + dword_1EF985058))(a1, v4);
}

uint64_t sub_1CAD51AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1CAC262E4;
  return sub_1CAD3FEDC(a1, a2, v2);
}

uint64_t sub_1CAD51B50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAC262E4;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_1CAD51BB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAC262E4;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_1CAD51C14()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CAD51C38(void *a1)
{
  return sub_1CAD40D6C(a1);
}

uint64_t block_copy_helper_24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_24()
{
  return swift_release();
}

uint64_t sub_1CAD51C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAC262E4;
  v3[3] = v2;
  return swift_task_switch();
}

uint64_t sub_1CAD51CC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAC1F184;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_1CAD51D20(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1CAD51D64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CAC262E4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF9850B8 + dword_1EF9850B8))(a1, v4);
}

uint64_t sub_1CAD51DD8(BOOL *a1)
{
  uint64_t v1;

  return sub_1CACA413C(a1, *(uint64_t (**)(double))(v1 + 16));
}

uint64_t sub_1CAD51DE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1F998(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD51E78(uint64_t a1)
{
  destroy for TaskScheduler.Error(a1);
  return a1;
}

uint64_t objectdestroy_90Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_1CAD51EE4(double a1)
{
  uint64_t *v1;

  return sub_1CAD3E9A4(v1[2], v1[3], v1 + 4, a1) & 1;
}

uint64_t sub_1CAD51F04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAD51F2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC1F184;
  return sub_1CAD20AEC(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD51FC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1F998(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD52064(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1F998(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD52100(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1FEF8(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD5219C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1F998(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD52238(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1F998(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD522D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1F998(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD52370(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1F998(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD5240C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1EA54(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD524A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1F310(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD5253C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D1798A3C](&unk_1CADCB5AC, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t objectdestroy_104Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAD525C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  v9 = *(_QWORD *)(v1 + 64);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAC262E4;
  return sub_1CAD1DE10(a1, v4, v5, v6, v7, v8, v10, v9);
}

uint64_t sub_1CAD52654(uint64_t a1, uint64_t a2)
{
  assignWithTake for PhotoStyleOutputSample(a2, a1);
  return a2;
}

void sub_1CAD58AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD58E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD5A590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD5D510(_Unwind_Exception *exception_object, int a2)
{
  const void *v2;
  id v3;

  if (a2 == 1)
  {
    v3 = objc_begin_catch(exception_object);
    if (v2)
      CFRelease(v2);

    objc_end_catch();
    JUMPOUT(0x1CAD5D438);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CAD5D6F8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1CAD5D718(void *a1, int a2)
{
  uint64_t v2;

  objc_begin_catch(a1);
  if (a2 == 2)
    objc_end_catch();
  if (!v2)
    JUMPOUT(0x1CAD5D640);
  JUMPOUT(0x1CAD5D634);
}

void sub_1CAD5DE4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a2)
  {
    if (a2 == 2)
    {
      v9 = objc_begin_catch(exception_object);
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "reason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("PVFaceCropUtils:newFaceCropFromImageData - %@"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorForPhotoVisionUnexpectedCondition:", v12);
      objc_claimAutoreleasedReturnValue();

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    JUMPOUT(0x1CAD5DC28);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CAD5E0F8(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_1CAD5E340(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_1CAD5E644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14)
{
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (a2 == 1)
  {
    v16 = objc_begin_catch(exception_object);
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "reason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("PVFaceCropUtils:faceBoundsFromFaceCrop -- %@"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorForPhotoVisionUnexpectedCondition:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    objc_autoreleasePoolPop(v15);
    if (v14)
    {
      if (v20)
        *v14 = objc_retainAutorelease(v20);
    }
    JUMPOUT(0x1CAD5E5E4);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CAD5E800(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 a11, __int128 a12, __int128 a13, __int128 a14)
{
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (a2 == 1)
  {
    v16 = objc_begin_catch(exception_object);
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "reason");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("PVFaceCropUtils:cropBoundsInOriginalImageFromFaceCrop -- %@"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorForPhotoVisionUnexpectedCondition:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    objc_autoreleasePoolPop(v15);
    if (v14)
    {
      if (v20)
        *v14 = objc_retainAutorelease(v20);
    }
    JUMPOUT(0x1CAD5E7A0);
  }
  _Unwind_Resume(exception_object);
}

void sub_1CAD5EBD4(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_1CAD5EBF4(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a2 == 2)
  {
    v10 = objc_begin_catch(exc_buf);
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v10, "reason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("PVFaceCropUtils:faceCropDimensionsFromFaceCrop -- %@"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorForPhotoVisionUnexpectedCondition:", v13);
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
  }
  else
  {
    objc_begin_catch(exc_buf);
  }
  if (!v9)
    JUMPOUT(0x1CAD5EB04);
  JUMPOUT(0x1CAD5EAFCLL);
}

uint64_t getImagePropertiesFromCGImageSource(CGImageSource *a1, int *a2, size_t *a3, size_t *a4)
{
  uint64_t result;
  CGImage *ImageAtIndex;
  CFDictionaryRef v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  size_t Height;
  size_t Width;
  size_t v16;
  id v17;
  void *context;

  result = 0;
  if (a1 && a2 && a3 && a4)
  {
    context = (void *)MEMORY[0x1D1798448](0);
    ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, 0, 0);
    if (!ImageAtIndex)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("could not create image ref"), 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
    v9 = CGImageSourceCopyPropertiesAtIndex(a1, 0, 0);
    v10 = 1;
    -[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v10 = objc_msgSend(v11, "intValue");
    if ((v10 - 9) < 0xFFFFFFF8)
      v13 = 1;
    else
      v13 = v10;
    if (v13 > 4)
    {
      Height = CGImageGetHeight(ImageAtIndex);
      Width = CGImageGetWidth(ImageAtIndex);
    }
    else
    {
      Height = CGImageGetWidth(ImageAtIndex);
      Width = CGImageGetHeight(ImageAtIndex);
    }
    v16 = Width;

    CGImageRelease(ImageAtIndex);
    objc_autoreleasePoolPop(context);
    *a2 = v13;
    *a3 = Height;
    result = 1;
    *a4 = v16;
  }
  return result;
}

void sub_1CAD5EE60(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_1CAD5EE8C()
{
  JUMPOUT(0x1CAD5EE98);
}

void sub_1CAD5EEA0()
{
  JUMPOUT(0x1CAD5EEA8);
}

double makeRectWithAllIntegers(double a1)
{
  if (a1 > 0.0)
    a1 = a1 + 0.5;
  return (double)(int)a1;
}

CGImageRef createOrientedCroppedAndScaledImageFromCGImageSource(CGImageSource *a1, double a2, double a3, double a4, double a5, double a6)
{
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  CGImageRef v16;
  CFDictionaryRef v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const __CFDictionary *v24;
  CGImage *ImageAtIndex;
  CGImage *v26;
  size_t Width;
  size_t Height;
  size_t v29;
  size_t v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  CGFloat x;
  double y;
  double v37;
  double v38;
  void *v39;
  CGColorSpace *v40;
  CGImage *v41;
  CGContext *v42;
  CGImageRef v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  const __CFDictionary *v50;
  CFDictionaryRef v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *context;
  CGImage *image;
  CGAffineTransform v58;
  CGAffineTransform transform;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  _QWORD v63[2];
  _QWORD v64[4];
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;

  v64[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = a4 * a6 + 0.5;
  v12 = a5 * a6 + 0.5;
  v13 = (double)(unint64_t)v12;
  v54 = a5 / v13;
  v55 = a4 / (double)(unint64_t)v11;
  v14 = fmin(v55, a5 / v13);
  if (v14 <= 0.125)
  {
    v15 = 8;
  }
  else if (v14 <= 0.25)
  {
    v15 = 4;
  }
  else if (v14 <= 0.5)
  {
    v15 = 2;
  }
  else
  {
    v15 = 1;
  }
  context = (void *)MEMORY[0x1D1798448]();
  v17 = CGImageSourceCopyPropertiesAtIndex(a1, 0, 0);
  -[__CFDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    v20 = objc_msgSend(v18, "intValue");
  else
    v20 = 1;
  v51 = v17;
  v52 = v19;
  if (v20 - 9 < 0xFFFFFFF8)
    v21 = 1;
  else
    v21 = v20;
  v22 = *MEMORY[0x1E0CBD290];
  v63[0] = *MEMORY[0x1E0CBD240];
  v63[1] = v22;
  v64[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v24 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, 0, v24);
  v26 = ImageAtIndex;
  if (!ImageAtIndex)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create image for rendering"), 0);
    v45 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v45);
  }
  image = ImageAtIndex;
  Width = CGImageGetWidth(ImageAtIndex);
  v50 = v24;
  v53 = (double)(unint64_t)v11;
  Height = CGImageGetHeight(v26);
  v29 = (unint64_t)v11;
  v30 = (unint64_t)v12;
  v31 = (double)(int)(a2 / (double)(int)v15);
  v32 = (double)(int)(a3 / (double)(int)v15);
  v33 = (double)(int)(a4 / (double)(int)v15);
  v34 = (double)(int)(a5 / (double)(int)v15);
  memset(&v62, 0, sizeof(v62));
  makeOrientationTransform(v21, Width, Height, (uint64_t)&v61);
  CGAffineTransformInvert(&v62, &v61);
  v60 = v62;
  v65.origin.x = v31;
  v65.origin.y = v32;
  v65.size.width = v33;
  v65.size.height = v34;
  v66 = CGRectApplyAffineTransform(v65, &v60);
  x = v66.origin.x;
  y = v66.origin.y;
  v37 = v66.size.width;
  v38 = v66.size.height;
  v39 = malloc_type_malloc(4 * v29 * v30, 0x2F10BD27uLL);
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create buffer for rendering"), 0, v24, v51, v52);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v46);
  }
  v40 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  if (!v40)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create srgb colorspace"), 0, v24, v51, v52);
    v47 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v47);
  }
  v67.origin.y = (double)Height - (y + v38);
  v67.origin.x = x;
  v67.size.width = v37;
  v67.size.height = v38;
  v41 = CGImageCreateWithImageInRect(image, v67);
  if (!v41)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create cropped and subsampled image"), 0, v24, v51, v52);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v48);
  }
  v42 = CGBitmapContextCreate(v39, v29, v30, 8uLL, 4 * v29, v40, 0x2002u);
  if (!v42)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Could not create bitmap context"), 0, v24, v51, v52);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v49);
  }
  memset(&v60, 0, sizeof(v60));
  CGAffineTransformMakeScale(&v60, v55 * (double)(int)v15, v54 * (double)(int)v15);
  if (v33 != v53 || v34 != v13)
  {
    CGAffineTransformMakeScale(&transform, v53 / v33, v13 / v34);
    v60 = transform;
  }
  transform = v60;
  CGContextConcatCTM(v42, &transform);
  memset(&transform, 0, sizeof(transform));
  makeOrientationTransform(v21, (unint64_t)v37, (unint64_t)v38, (uint64_t)&transform);
  v58 = transform;
  CGContextConcatCTM(v42, &v58);
  CGContextSetInterpolationQuality(v42, kCGInterpolationMedium);
  CGContextSetShouldAntialias(v42, 0);
  CGContextSetBlendMode(v42, kCGBlendModeCopy);
  v68.origin.x = 0.0;
  v68.origin.y = 0.0;
  v68.size.width = v37;
  v68.size.height = v38;
  CGContextDrawImage(v42, v68, v41);
  v43 = CGBitmapContextCreateImage(v42);

  free(v39);
  v16 = v43;
  CGColorSpaceRelease(v40);
  CGContextRelease(v42);
  CGImageRelease(v41);
  CGImageRelease(image);
  objc_autoreleasePoolPop(context);
  return v16;
}

void sub_1CAD5F55C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    if (a2 == 2)
      objc_end_catch();
    JUMPOUT(0x1CAD5F360);
  }
  _Unwind_Resume(exc_buf);
}

uint64_t makeOrientationTransform@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  __int128 v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = MEMORY[0x1E0C9BAA8];
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a4 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a4 + 16) = v5;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)(v4 + 32);
  switch((int)result)
  {
    case 1:
      *(_QWORD *)a4 = 0x3FF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0x3FF0000000000000;
      goto LABEL_11;
    case 2:
      v6 = (double)a2;
      *(_QWORD *)a4 = 0xBFF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0x3FF0000000000000;
      goto LABEL_13;
    case 3:
      v7 = (double)a2;
      v8 = (double)a3;
      *(_QWORD *)a4 = 0xBFF0000000000000;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)(a4 + 24) = 0xBFF0000000000000;
      goto LABEL_7;
    case 4:
      v9 = (double)a3;
      *(_QWORD *)(a4 + 8) = 0;
      *(_QWORD *)(a4 + 16) = 0;
      *(_QWORD *)a4 = 0x3FF0000000000000;
      *(_OWORD *)(a4 + 24) = xmmword_1CADD05C0;
      goto LABEL_9;
    case 5:
      v7 = (double)a3;
      v8 = (double)a2;
      *(_OWORD *)a4 = xmmword_1CADD05D0;
      *(_OWORD *)(a4 + 16) = xmmword_1CADD05C0;
LABEL_7:
      *(double *)(a4 + 32) = v7;
      *(double *)(a4 + 40) = v8;
      break;
    case 6:
      v9 = (double)a2;
      *(_OWORD *)a4 = xmmword_1CADD05D0;
      *(_QWORD *)(a4 + 24) = 0;
      *(_QWORD *)(a4 + 32) = 0;
      *(_QWORD *)(a4 + 16) = 0x3FF0000000000000;
LABEL_9:
      *(double *)(a4 + 40) = v9;
      break;
    case 7:
      *(_OWORD *)a4 = xmmword_1CADD05B0;
      *(_QWORD *)(a4 + 16) = 0x3FF0000000000000;
      *(_QWORD *)(a4 + 24) = 0;
LABEL_11:
      *(_QWORD *)(a4 + 32) = 0;
      *(_QWORD *)(a4 + 40) = 0;
      break;
    case 8:
      v6 = (double)a3;
      *(_OWORD *)a4 = xmmword_1CADD05B0;
      *(_OWORD *)(a4 + 16) = xmmword_1CADD05C0;
LABEL_13:
      *(double *)(a4 + 32) = v6;
      *(_QWORD *)(a4 + 40) = 0;
      break;
    default:
      return result;
  }
  return result;
}

double makeScaledRect(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a3 * 0.5 - a3 * a5 * 0.5;
}

double makeRectClippedAgainstImageBounds(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  double result;
  CGRect v7;

  v7.size.width = (double)a1;
  v7.size.height = (double)a2;
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  *(_QWORD *)&result = (unint64_t)CGRectIntersection(*(CGRect *)&a3, v7);
  return result;
}

void sub_1CAD60400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1CAD636C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CAD639C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__530(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__531(uint64_t a1)
{

}

void sub_1CAD65C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void AddDASBackloggedToCriteria(BOOL a1, void *a2)
{
  id v3;
  xpc_object_t xdict;

  v3 = a2;
  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(xdict, (const char *)objc_msgSend((id)*MEMORY[0x1E0D1D9B0], "UTF8String"), a1);
  xpc_dictionary_set_value(v3, (const char *)*MEMORY[0x1E0C80778], xdict);

}

id NSExecuteCatchingObjCException(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  v1[2]();

  return 0;
}

void sub_1CAD660D4(void *a1)
{
  id v1;

  v1 = objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1CAD660C0);
}

void sub_1CAD6669C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD68BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1014(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1015(uint64_t a1)
{

}

void sub_1CAD6BA60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1166(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1167(uint64_t a1)
{

}

void sub_1CAD6D2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD6D470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1253(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1254(uint64_t a1)
{

}

void sub_1CAD6DBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD6E1B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD6E888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD6EB94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD6F348(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CAD72C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD72E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD73200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD73460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD73624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD74040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD744FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD74704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD7490C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD74AE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1688(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1689(uint64_t a1)
{

}

void sub_1CAD760B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1CAD77334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1910(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1911(uint64_t a1)
{

}

void sub_1CAD77EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CAD7867C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2151(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2152(uint64_t a1)
{

}

void ___reportCancellationOfRemainingFaceCropSourceDescriptors_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1D1798448]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v3);

}

void sub_1CAD80930(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x360], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2664(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2665(uint64_t a1)
{

}

void sub_1CAD86594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CAD87584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD8CC58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAD8DB78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1CAD8E3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id GroupingIdentifierFromDate(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = GroupingIdentifierFromDate_dateFormatterCreationToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&GroupingIdentifierFromDate_dateFormatterCreationToken, &__block_literal_global_3710);
  objc_msgSend((id)GroupingIdentifierFromDate_dateFormatterToStripTime, "stringFromDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __PXLog_genericSetupOSLog()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __PXLoggraph_workerSetupOSLog()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __PXLogvision_workerSetupOSLog()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.vision", "worker");
  v1 = (void *)__PXLogvision_workerOSLog;
  __PXLogvision_workerOSLog = (uint64_t)v0;

}

void __PXLoggraph_monitoringSetupOSLog()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "monitoring");
  v1 = (void *)__PXLoggraph_monitoringOSLog;
  __PXLoggraph_monitoringOSLog = (uint64_t)v0;

}

void __PXLogjob_coordinatorSetupOSLog()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.job", "coordinator");
  v1 = (void *)__PXLogjob_coordinatorOSLog;
  __PXLogjob_coordinatorOSLog = (uint64_t)v0;

}

void __PXLogjob_activitySetupOSLog()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.job", "activity");
  v1 = (void *)__PXLogjob_activityOSLog;
  __PXLogjob_activityOSLog = (uint64_t)v0;

}

void __PXLog_automationSetupOSLog()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "automation");
  v1 = (void *)__PXLog_automationOSLog;
  __PXLog_automationOSLog = (uint64_t)v0;

}

void sub_1CAD8FF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3835(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3836(uint64_t a1)
{

}

void sub_1CAD95FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD96EE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CAD96FA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id musicPersistentStorageDirectoryURLForLibrary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "urlForApplicationDataFolderIdentifier:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

  }
  else
  {
    if (__PXLog_genericOnceToken != -1)
      dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_4711);
    v4 = __PXLog_genericOSLog;
    if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v1;
      _os_log_error_impl(&dword_1CAC16000, v4, OS_LOG_TYPE_ERROR, "Error: no persistentStorageDirectoryURL for music activity. photoLibrary = %@", (uint8_t *)&v6, 0xCu);
    }
  }

  return v2;
}

void __musicPersistentStorageDirectoryURLForLibrary_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

BOOL didExceedMusicTimeInterval(void *a1, uint64_t a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  int v16;
  id v17;
  __int16 v18;
  double v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  +[PHAMusicJobReadWriteApplicationPreferences libraryScopedMusicWorkerPreferencesForLibrary:](PHAMusicJobReadWriteApplicationPreferences, "libraryScopedMusicWorkerPreferencesForLibrary:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  v13 = v12;

  if (v13 > a3)
  {
    if (__PXLoggraph_workerOnceToken != -1)
      dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_4);
    v14 = __PXLoggraph_workerOSLog;
    if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
    {
      v16 = 138412802;
      v17 = v5;
      v18 = 2048;
      v19 = v13;
      v20 = 1024;
      v21 = 1;
      _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "Last %@ job generation %.0fs ago, job is due = %d", (uint8_t *)&v16, 0x1Cu);
    }
  }

  return v13 > a3;
}

void __didExceedMusicTimeInterval_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void setLibraryScopedMusicWorkerPreferencesValue(void *a1, void *a2, void *a3)
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v16 = a2;
    v17 = a1;
    v6 = (void *)MEMORY[0x1E0C99D80];
    v7 = a3;
    v8 = a2;
    v9 = a1;
    objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 0;
  }
  else
  {
    v15 = a2;
    v13 = (void *)MEMORY[0x1E0C99D20];
    v7 = a3;
    v14 = a2;
    objc_msgSend(v13, "arrayWithObjects:count:", &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = v10;
  }
  +[PHAMusicJobReadWriteApplicationPreferences updateLibraryScopedMusicWorkerPreferencesWithEntriesFromDictionary:keysToRemove:photoLibrary:](PHAMusicJobReadWriteApplicationPreferences, "updateLibraryScopedMusicWorkerPreferencesWithEntriesFromDictionary:keysToRemove:photoLibrary:", v11, v12, v7, v15, v16, v17, v18);

}

void sub_1CAD9847C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4946(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4947(uint64_t a1)
{

}

void sub_1CAD9B6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1CAD9B96C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1CAD9BC70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1CAD9C5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  uint64_t v15;

  if (*(char *)(v15 - 145) < 0)
    operator delete(*(void **)(v15 - 168));

  _Unwind_Resume(a1);
}

void sub_1CAD9C930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void std::vector<unsigned long>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E85154B0, MEMORY[0x1E0DE42D0]);
}

void sub_1CAD9CA98(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

const __CFString *PHADescriptionForQoS(int a1)
{
  if (a1 > 20)
  {
    switch(a1)
    {
      case 21:
        return CFSTR("QOS_CLASS_DEFAULT");
      case 33:
        return CFSTR("QOS_CLASS_USER_INTERACTIVE");
      case 25:
        return CFSTR("QOS_CLASS_USER_INITIATED");
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return CFSTR("QOS_CLASS_UNSPECIFIED");
      case 9:
        return CFSTR("QOS_CLASS_BACKGROUND");
      case 17:
        return CFSTR("QOS_CLASS_UTILITY");
    }
  }
  return CFSTR("UNKNOWN");
}

uint64_t PHAProcessIsPhotoAnalysisd()
{
  if (PHAProcessIsPhotoAnalysisd_onceToken != -1)
    dispatch_once(&PHAProcessIsPhotoAnalysisd_onceToken, &__block_literal_global_5499);
  return objc_msgSend((id)PHAProcessIsPhotoAnalysisd_processName, "isEqualToString:", CFSTR("photoanalysisd"));
}

void sub_1CAD9FAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAD9FCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CADA0048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6148(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6149(uint64_t a1)
{

}

void sub_1CADA30F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CADA3398(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CADA4F88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CADA5628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1CADA5CC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1CADA6BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6580(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6581(uint64_t a1)
{

}

void sub_1CADADAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6942(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6943(uint64_t a1)
{

}

uint64_t PVFaceGetCenterAndSizeForNormalizedRect(unint64_t a1, unint64_t a2, CGFloat *a3, CGFloat *a4, double *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double v17;
  double v18;
  unint64_t v19;
  CGRect v21;

  *a3 = CGRectGetMidX(*(CGRect *)&a6);
  v21.origin.x = a6;
  v21.origin.y = a7;
  v21.size.width = a8;
  v21.size.height = a9;
  *a4 = CGRectGetMidY(v21);
  v17 = 0.0;
  if (a1 && a2)
  {
    v18 = a8 * (double)a1;
    if (v18 < a9 * (double)a2)
      v18 = a9 * (double)a2;
    if (a1 <= a2)
      v19 = a2;
    else
      v19 = a1;
    v17 = v18 / (double)v19;
  }
  *a5 = v17;
  return 1;
}

double PVFaceGetAbsoluteRectForImageSize(unint64_t a1, unint64_t a2, double a3, double a4, double a5)
{
  unint64_t v5;

  if (a1 <= a2)
    v5 = a2;
  else
    v5 = a1;
  return -((double)v5 * a5 * 0.5 - a3 * (double)a1);
}

void sub_1CADB4FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

id PHAFullMethodName(void *a1, const char *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a1;
  v4 = objc_opt_class();

  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 45;
  if ((id)v4 == v3)
    v7 = 43;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%c[%@ %@]"), v7, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PHAMethodNotImplentedException(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  PHAFullMethodName(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:  must override selector sent to %p"), v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PHAAbstractMethodException(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  PHAFullMethodName(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:  method not implemented sent to %p"), v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1CADB7974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CADB83A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1CADBF45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1CADC290C()
{
  return MEMORY[0x1E0CADD80]();
}

uint64_t sub_1CADC2918()
{
  return MEMORY[0x1E0CADE28]();
}

uint64_t sub_1CADC2924()
{
  return MEMORY[0x1E0CAE6D8]();
}

uint64_t sub_1CADC2930()
{
  return MEMORY[0x1E0CAE6E8]();
}

uint64_t sub_1CADC293C()
{
  return MEMORY[0x1E0CAE6F0]();
}

uint64_t sub_1CADC2948()
{
  return MEMORY[0x1E0CAE8B0]();
}

uint64_t sub_1CADC2954()
{
  return MEMORY[0x1E0CAE8C0]();
}

uint64_t sub_1CADC2960()
{
  return MEMORY[0x1E0CAE8C8]();
}

uint64_t sub_1CADC296C()
{
  return MEMORY[0x1E0CAE8E0]();
}

uint64_t sub_1CADC2978()
{
  return MEMORY[0x1E0CAE8E8]();
}

uint64_t sub_1CADC2984()
{
  return MEMORY[0x1E0CAE900]();
}

uint64_t sub_1CADC2990()
{
  return MEMORY[0x1E0CAE918]();
}

uint64_t sub_1CADC299C()
{
  return MEMORY[0x1E0CAE9A8]();
}

uint64_t sub_1CADC29A8()
{
  return MEMORY[0x1E0CAEA78]();
}

uint64_t sub_1CADC29B4()
{
  return MEMORY[0x1E0CAEAB8]();
}

uint64_t sub_1CADC29C0()
{
  return MEMORY[0x1E0CAEE58]();
}

uint64_t sub_1CADC29CC()
{
  return MEMORY[0x1E0CAF550]();
}

uint64_t sub_1CADC29D8()
{
  return MEMORY[0x1E0CAF5D0]();
}

uint64_t sub_1CADC29E4()
{
  return MEMORY[0x1E0CAF5E8]();
}

uint64_t sub_1CADC29F0()
{
  return MEMORY[0x1E0CAF600]();
}

uint64_t sub_1CADC29FC()
{
  return MEMORY[0x1E0CAF610]();
}

uint64_t sub_1CADC2A08()
{
  return MEMORY[0x1E0CAF630]();
}

uint64_t sub_1CADC2A14()
{
  return MEMORY[0x1E0CAF640]();
}

uint64_t sub_1CADC2A20()
{
  return MEMORY[0x1E0CAF660]();
}

uint64_t sub_1CADC2A2C()
{
  return MEMORY[0x1E0CAF678]();
}

uint64_t sub_1CADC2A38()
{
  return MEMORY[0x1E0CAF978]();
}

uint64_t sub_1CADC2A44()
{
  return MEMORY[0x1E0CAF988]();
}

uint64_t sub_1CADC2A50()
{
  return MEMORY[0x1E0CAFD88]();
}

uint64_t sub_1CADC2A5C()
{
  return MEMORY[0x1E0CAFDD0]();
}

uint64_t sub_1CADC2A68()
{
  return MEMORY[0x1E0CAFE40]();
}

uint64_t sub_1CADC2A74()
{
  return MEMORY[0x1E0CAFE88]();
}

uint64_t sub_1CADC2A80()
{
  return MEMORY[0x1E0CAFEB0]();
}

uint64_t sub_1CADC2A8C()
{
  return MEMORY[0x1E0CAFEF8]();
}

uint64_t sub_1CADC2A98()
{
  return MEMORY[0x1E0CAFF28]();
}

uint64_t sub_1CADC2AA4()
{
  return MEMORY[0x1E0CAFF38]();
}

uint64_t sub_1CADC2AB0()
{
  return MEMORY[0x1E0CAFFA0]();
}

uint64_t sub_1CADC2ABC()
{
  return MEMORY[0x1E0CAFFC8]();
}

uint64_t sub_1CADC2AC8()
{
  return MEMORY[0x1E0CAFFD8]();
}

uint64_t sub_1CADC2AD4()
{
  return MEMORY[0x1E0CAFFF0]();
}

uint64_t sub_1CADC2AE0()
{
  return MEMORY[0x1E0CB0090]();
}

uint64_t sub_1CADC2AEC()
{
  return MEMORY[0x1E0CB00A8]();
}

uint64_t sub_1CADC2AF8()
{
  return MEMORY[0x1E0CB0148]();
}

uint64_t sub_1CADC2B04()
{
  return MEMORY[0x1E0CB0168]();
}

uint64_t sub_1CADC2B10()
{
  return MEMORY[0x1E0CB0190]();
}

uint64_t sub_1CADC2B1C()
{
  return MEMORY[0x1E0CB01E8]();
}

uint64_t sub_1CADC2B28()
{
  return MEMORY[0x1E0CB0230]();
}

uint64_t sub_1CADC2B34()
{
  return MEMORY[0x1E0CB0278]();
}

uint64_t sub_1CADC2B40()
{
  return MEMORY[0x1E0CB0290]();
}

uint64_t sub_1CADC2B4C()
{
  return MEMORY[0x1E0CB03B0]();
}

uint64_t sub_1CADC2B58()
{
  return MEMORY[0x1E0CB03C8]();
}

uint64_t sub_1CADC2B64()
{
  return MEMORY[0x1E0CB0590]();
}

uint64_t sub_1CADC2B70()
{
  return MEMORY[0x1E0CB05D0]();
}

uint64_t sub_1CADC2B7C()
{
  return MEMORY[0x1E0CB0678]();
}

uint64_t sub_1CADC2B88()
{
  return MEMORY[0x1E0CB06C0]();
}

uint64_t sub_1CADC2B94()
{
  return MEMORY[0x1E0CB06C8]();
}

uint64_t sub_1CADC2BA0()
{
  return MEMORY[0x1E0CB06E0]();
}

uint64_t sub_1CADC2BAC()
{
  return MEMORY[0x1E0CB06F8]();
}

uint64_t sub_1CADC2BB8()
{
  return MEMORY[0x1E0CB0710]();
}

uint64_t sub_1CADC2BC4()
{
  return MEMORY[0x1E0CB07D0]();
}

uint64_t sub_1CADC2BD0()
{
  return MEMORY[0x1E0CB07F0]();
}

uint64_t sub_1CADC2BDC()
{
  return MEMORY[0x1E0CB0800]();
}

uint64_t sub_1CADC2BE8()
{
  return MEMORY[0x1E0CB0868]();
}

uint64_t sub_1CADC2BF4()
{
  return MEMORY[0x1E0CB0878]();
}

uint64_t sub_1CADC2C00()
{
  return MEMORY[0x1E0CB0908]();
}

uint64_t sub_1CADC2C0C()
{
  return MEMORY[0x1E0CB0950]();
}

uint64_t sub_1CADC2C18()
{
  return MEMORY[0x1E0CB0990]();
}

uint64_t sub_1CADC2C24()
{
  return MEMORY[0x1E0CB09A0]();
}

uint64_t sub_1CADC2C30()
{
  return MEMORY[0x1E0CB0BF0]();
}

uint64_t sub_1CADC2C3C()
{
  return MEMORY[0x1E0CB0E30]();
}

uint64_t sub_1CADC2C48()
{
  return MEMORY[0x1E0CB0F78]();
}

uint64_t sub_1CADC2C54()
{
  return MEMORY[0x1E0CB10C0]();
}

uint64_t sub_1CADC2C60()
{
  return MEMORY[0x1E0CB11E8]();
}

uint64_t sub_1CADC2C6C()
{
  return MEMORY[0x1E0CB1468]();
}

uint64_t sub_1CADC2C78()
{
  return MEMORY[0x1E0DEFC98]();
}

uint64_t sub_1CADC2C84()
{
  return MEMORY[0x1E0D75AA0]();
}

uint64_t sub_1CADC2C90()
{
  return MEMORY[0x1E0D75AA8]();
}

uint64_t sub_1CADC2C9C()
{
  return MEMORY[0x1E0D75AB0]();
}

uint64_t sub_1CADC2CA8()
{
  return MEMORY[0x1E0D75AB8]();
}

uint64_t sub_1CADC2CB4()
{
  return MEMORY[0x1E0D75AC0]();
}

uint64_t sub_1CADC2CC0()
{
  return MEMORY[0x1E0D75AC8]();
}

uint64_t sub_1CADC2CCC()
{
  return MEMORY[0x1E0D75AD0]();
}

uint64_t sub_1CADC2CD8()
{
  return MEMORY[0x1E0D75AD8]();
}

uint64_t sub_1CADC2CE4()
{
  return MEMORY[0x1E0D75AE0]();
}

uint64_t sub_1CADC2CF0()
{
  return MEMORY[0x1E0D75AE8]();
}

uint64_t sub_1CADC2CFC()
{
  return MEMORY[0x1E0D75AF0]();
}

uint64_t sub_1CADC2D08()
{
  return MEMORY[0x1E0D75AF8]();
}

uint64_t sub_1CADC2D14()
{
  return MEMORY[0x1E0D75B00]();
}

uint64_t sub_1CADC2D20()
{
  return MEMORY[0x1E0D75B08]();
}

uint64_t sub_1CADC2D2C()
{
  return MEMORY[0x1E0D75B18]();
}

uint64_t sub_1CADC2D38()
{
  return MEMORY[0x1E0D75B20]();
}

uint64_t sub_1CADC2D44()
{
  return MEMORY[0x1E0D75B28]();
}

uint64_t sub_1CADC2D50()
{
  return MEMORY[0x1E0D75B30]();
}

uint64_t sub_1CADC2D5C()
{
  return MEMORY[0x1E0D75B38]();
}

uint64_t sub_1CADC2D68()
{
  return MEMORY[0x1E0D75B40]();
}

uint64_t sub_1CADC2D74()
{
  return MEMORY[0x1E0D75B48]();
}

uint64_t sub_1CADC2D80()
{
  return MEMORY[0x1E0D75B50]();
}

uint64_t sub_1CADC2D8C()
{
  return MEMORY[0x1E0D75B58]();
}

uint64_t sub_1CADC2D98()
{
  return MEMORY[0x1E0D75B68]();
}

uint64_t sub_1CADC2DA4()
{
  return MEMORY[0x1E0D75B70]();
}

uint64_t sub_1CADC2DB0()
{
  return MEMORY[0x1E0D75B78]();
}

uint64_t sub_1CADC2DBC()
{
  return MEMORY[0x1E0D75B80]();
}

uint64_t sub_1CADC2DC8()
{
  return MEMORY[0x1E0D75B88]();
}

uint64_t sub_1CADC2DD4()
{
  return MEMORY[0x1E0D75B90]();
}

uint64_t sub_1CADC2DE0()
{
  return MEMORY[0x1E0D75BA0]();
}

uint64_t sub_1CADC2DEC()
{
  return MEMORY[0x1E0D75BA8]();
}

uint64_t sub_1CADC2DF8()
{
  return MEMORY[0x1E0D75BB0]();
}

uint64_t sub_1CADC2E04()
{
  return MEMORY[0x1E0D75BB8]();
}

uint64_t sub_1CADC2E10()
{
  return MEMORY[0x1E0D75BC0]();
}

uint64_t sub_1CADC2E1C()
{
  return MEMORY[0x1E0D75BC8]();
}

uint64_t sub_1CADC2E28()
{
  return MEMORY[0x1E0D75BD0]();
}

uint64_t sub_1CADC2E34()
{
  return MEMORY[0x1E0D75BD8]();
}

uint64_t sub_1CADC2E40()
{
  return MEMORY[0x1E0D75BE0]();
}

uint64_t sub_1CADC2E4C()
{
  return MEMORY[0x1E0D75BE8]();
}

uint64_t sub_1CADC2E58()
{
  return MEMORY[0x1E0D75BF0]();
}

uint64_t sub_1CADC2E64()
{
  return MEMORY[0x1E0D75BF8]();
}

uint64_t sub_1CADC2E70()
{
  return MEMORY[0x1E0D75C00]();
}

uint64_t sub_1CADC2E7C()
{
  return MEMORY[0x1E0D75C10]();
}

uint64_t sub_1CADC2E88()
{
  return MEMORY[0x1E0D75C18]();
}

uint64_t sub_1CADC2E94()
{
  return MEMORY[0x1E0D75C20]();
}

uint64_t sub_1CADC2EA0()
{
  return MEMORY[0x1E0D75C28]();
}

uint64_t sub_1CADC2EAC()
{
  return MEMORY[0x1E0D75C30]();
}

uint64_t sub_1CADC2EB8()
{
  return MEMORY[0x1E0D75C38]();
}

uint64_t sub_1CADC2EC4()
{
  return MEMORY[0x1E0CB1710]();
}

uint64_t sub_1CADC2ED0()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1CADC2EDC()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_1CADC2EE8()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_1CADC2EF4()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_1CADC2F00()
{
  return MEMORY[0x1E0D650C8]();
}

uint64_t sub_1CADC2F0C()
{
  return MEMORY[0x1E0D650D0]();
}

uint64_t sub_1CADC2F18()
{
  return MEMORY[0x1E0D650D8]();
}

uint64_t sub_1CADC2F24()
{
  return MEMORY[0x1E0D650E0]();
}

uint64_t sub_1CADC2F30()
{
  return MEMORY[0x1E0D650E8]();
}

uint64_t sub_1CADC2F3C()
{
  return MEMORY[0x1E0D650F0]();
}

uint64_t sub_1CADC2F48()
{
  return MEMORY[0x1E0D650F8]();
}

uint64_t sub_1CADC2F54()
{
  return MEMORY[0x1E0D65100]();
}

uint64_t sub_1CADC2F60()
{
  return MEMORY[0x1E0D65108]();
}

uint64_t sub_1CADC2F6C()
{
  return MEMORY[0x1E0D65110]();
}

uint64_t sub_1CADC2F78()
{
  return MEMORY[0x1E0D65118]();
}

uint64_t sub_1CADC2F84()
{
  return MEMORY[0x1E0D42838]();
}

uint64_t sub_1CADC2F90()
{
  return MEMORY[0x1E0D42840]();
}

uint64_t sub_1CADC2F9C()
{
  return MEMORY[0x1E0D42850]();
}

uint64_t sub_1CADC2FA8()
{
  return MEMORY[0x1E0D766B0]();
}

uint64_t sub_1CADC2FB4()
{
  return MEMORY[0x1E0D76758]();
}

uint64_t sub_1CADC2FC0()
{
  return MEMORY[0x1E0D76890]();
}

uint64_t sub_1CADC2FCC()
{
  return MEMORY[0x1E0D768A0]();
}

uint64_t sub_1CADC2FD8()
{
  return MEMORY[0x1E0D76900]();
}

uint64_t sub_1CADC2FE4()
{
  return MEMORY[0x1E0D76908]();
}

uint64_t sub_1CADC2FF0()
{
  return MEMORY[0x1E0D76978]();
}

uint64_t sub_1CADC2FFC()
{
  return MEMORY[0x1E0D76988]();
}

uint64_t sub_1CADC3008()
{
  return MEMORY[0x1E0D76998]();
}

uint64_t sub_1CADC3014()
{
  return MEMORY[0x1E0D769A8]();
}

uint64_t sub_1CADC3020()
{
  return MEMORY[0x1E0D769B8]();
}

uint64_t sub_1CADC302C()
{
  return MEMORY[0x1E0D769C0]();
}

uint64_t sub_1CADC3038()
{
  return MEMORY[0x1E0D769D8]();
}

uint64_t sub_1CADC3044()
{
  return MEMORY[0x1E0D76A08]();
}

uint64_t sub_1CADC3050()
{
  return MEMORY[0x1E0D76A28]();
}

uint64_t sub_1CADC305C()
{
  return MEMORY[0x1E0D76A30]();
}

uint64_t sub_1CADC3068()
{
  return MEMORY[0x1E0D76A78]();
}

uint64_t sub_1CADC3074()
{
  return MEMORY[0x1E0D76A80]();
}

uint64_t sub_1CADC3080()
{
  return MEMORY[0x1E0D76AC8]();
}

uint64_t sub_1CADC308C()
{
  return MEMORY[0x1E0D76AD0]();
}

uint64_t sub_1CADC3098()
{
  return MEMORY[0x1E0D76AD8]();
}

uint64_t sub_1CADC30A4()
{
  return MEMORY[0x1E0D76AE0]();
}

uint64_t sub_1CADC30B0()
{
  return MEMORY[0x1E0D76BF8]();
}

uint64_t sub_1CADC30BC()
{
  return MEMORY[0x1E0D76C00]();
}

uint64_t sub_1CADC30C8()
{
  return MEMORY[0x1E0D76C18]();
}

uint64_t sub_1CADC30D4()
{
  return MEMORY[0x1E0D76C30]();
}

uint64_t sub_1CADC30E0()
{
  return MEMORY[0x1E0D76C38]();
}

uint64_t sub_1CADC30EC()
{
  return MEMORY[0x1E0D76C40]();
}

uint64_t sub_1CADC30F8()
{
  return MEMORY[0x1E0D76C48]();
}

uint64_t sub_1CADC3104()
{
  return MEMORY[0x1E0D76C70]();
}

uint64_t sub_1CADC3110()
{
  return MEMORY[0x1E0D76C78]();
}

uint64_t sub_1CADC311C()
{
  return MEMORY[0x1E0D76CA0]();
}

uint64_t sub_1CADC3128()
{
  return MEMORY[0x1E0D76CC8]();
}

uint64_t sub_1CADC3134()
{
  return MEMORY[0x1E0D76CD0]();
}

uint64_t sub_1CADC3140()
{
  return MEMORY[0x1E0D76D68]();
}

uint64_t sub_1CADC314C()
{
  return MEMORY[0x1E0D76D90]();
}

uint64_t sub_1CADC3158()
{
  return MEMORY[0x1E0D76EE0]();
}

uint64_t sub_1CADC3164()
{
  return MEMORY[0x1E0D76EF0]();
}

uint64_t sub_1CADC3170()
{
  return MEMORY[0x1E0D76EF8]();
}

uint64_t sub_1CADC317C()
{
  return MEMORY[0x1E0D76F00]();
}

uint64_t sub_1CADC3188()
{
  return MEMORY[0x1E0D76F08]();
}

uint64_t sub_1CADC3194()
{
  return MEMORY[0x1E0D76F28]();
}

uint64_t sub_1CADC31A0()
{
  return MEMORY[0x1E0D76F30]();
}

uint64_t sub_1CADC31AC()
{
  return MEMORY[0x1E0D77038]();
}

uint64_t sub_1CADC31B8()
{
  return MEMORY[0x1E0D77078]();
}

uint64_t sub_1CADC31C4()
{
  return MEMORY[0x1E0D77080]();
}

uint64_t sub_1CADC31D0()
{
  return MEMORY[0x1E0D770A0]();
}

uint64_t sub_1CADC31DC()
{
  return MEMORY[0x1E0D770A8]();
}

uint64_t sub_1CADC31E8()
{
  return MEMORY[0x1E0D770B0]();
}

uint64_t sub_1CADC31F4()
{
  return MEMORY[0x1E0D77170]();
}

uint64_t sub_1CADC3200()
{
  return MEMORY[0x1E0D77178]();
}

uint64_t sub_1CADC320C()
{
  return MEMORY[0x1E0D77188]();
}

uint64_t sub_1CADC3218()
{
  return MEMORY[0x1E0D77190]();
}

uint64_t sub_1CADC3224()
{
  return MEMORY[0x1E0D77198]();
}

uint64_t sub_1CADC3230()
{
  return MEMORY[0x1E0D771A0]();
}

uint64_t sub_1CADC323C()
{
  return MEMORY[0x1E0D77228]();
}

uint64_t sub_1CADC3248()
{
  return MEMORY[0x1E0D77270]();
}

uint64_t sub_1CADC3254()
{
  return MEMORY[0x1E0D77278]();
}

uint64_t sub_1CADC3260()
{
  return MEMORY[0x1E0D77280]();
}

uint64_t sub_1CADC326C()
{
  return MEMORY[0x1E0D77288]();
}

uint64_t sub_1CADC3278()
{
  return MEMORY[0x1E0D77290]();
}

uint64_t sub_1CADC3284()
{
  return MEMORY[0x1E0D77298]();
}

uint64_t sub_1CADC3290()
{
  return MEMORY[0x1E0D772A0]();
}

uint64_t sub_1CADC329C()
{
  return MEMORY[0x1E0D77368]();
}

uint64_t sub_1CADC32A8()
{
  return MEMORY[0x1E0D77430]();
}

uint64_t sub_1CADC32B4()
{
  return MEMORY[0x1E0D77438]();
}

uint64_t sub_1CADC32C0()
{
  return MEMORY[0x1E0D77448]();
}

uint64_t sub_1CADC32CC()
{
  return MEMORY[0x1E0D77478]();
}

uint64_t sub_1CADC32D8()
{
  return MEMORY[0x1E0D774A0]();
}

uint64_t sub_1CADC32E4()
{
  return MEMORY[0x1E0D77568]();
}

uint64_t sub_1CADC32F0()
{
  return MEMORY[0x1E0D77588]();
}

uint64_t sub_1CADC32FC()
{
  return MEMORY[0x1E0D77598]();
}

uint64_t sub_1CADC3308()
{
  return MEMORY[0x1E0D775A8]();
}

uint64_t sub_1CADC3314()
{
  return MEMORY[0x1E0D775B0]();
}

uint64_t sub_1CADC3320()
{
  return MEMORY[0x1E0D775B8]();
}

uint64_t sub_1CADC332C()
{
  return MEMORY[0x1E0D775C0]();
}

uint64_t sub_1CADC3338()
{
  return MEMORY[0x1E0D775C8]();
}

uint64_t sub_1CADC3344()
{
  return MEMORY[0x1E0D775D0]();
}

uint64_t sub_1CADC3350()
{
  return MEMORY[0x1E0D775E0]();
}

uint64_t sub_1CADC335C()
{
  return MEMORY[0x1E0D77668]();
}

uint64_t sub_1CADC3368()
{
  return MEMORY[0x1E0D77678]();
}

uint64_t sub_1CADC3374()
{
  return MEMORY[0x1E0D77688]();
}

uint64_t sub_1CADC3380()
{
  return MEMORY[0x1E0D77698]();
}

uint64_t sub_1CADC338C()
{
  return MEMORY[0x1E0D776A0]();
}

uint64_t sub_1CADC3398()
{
  return MEMORY[0x1E0D776B0]();
}

uint64_t sub_1CADC33A4()
{
  return MEMORY[0x1E0D77740]();
}

uint64_t sub_1CADC33B0()
{
  return MEMORY[0x1E0D77848]();
}

uint64_t sub_1CADC33BC()
{
  return MEMORY[0x1E0D77850]();
}

uint64_t sub_1CADC33C8()
{
  return MEMORY[0x1E0D77860]();
}

uint64_t sub_1CADC33D4()
{
  return MEMORY[0x1E0D77888]();
}

uint64_t sub_1CADC33E0()
{
  return MEMORY[0x1E0D77890]();
}

uint64_t sub_1CADC33EC()
{
  return MEMORY[0x1E0D778E8]();
}

uint64_t sub_1CADC33F8()
{
  return MEMORY[0x1E0D778F0]();
}

uint64_t sub_1CADC3404()
{
  return MEMORY[0x1E0D77950]();
}

uint64_t sub_1CADC3410()
{
  return MEMORY[0x1E0D77960]();
}

uint64_t sub_1CADC341C()
{
  return MEMORY[0x1E0D77998]();
}

uint64_t sub_1CADC3428()
{
  return MEMORY[0x1E0D779A0]();
}

uint64_t sub_1CADC3434()
{
  return MEMORY[0x1E0D779B0]();
}

uint64_t sub_1CADC3440()
{
  return MEMORY[0x1E0D779F8]();
}

uint64_t sub_1CADC344C()
{
  return MEMORY[0x1E0D77A08]();
}

uint64_t sub_1CADC3458()
{
  return MEMORY[0x1E0D77A10]();
}

uint64_t sub_1CADC3464()
{
  return MEMORY[0x1E0D77A20]();
}

uint64_t sub_1CADC3470()
{
  return MEMORY[0x1E0D77A30]();
}

uint64_t sub_1CADC347C()
{
  return MEMORY[0x1E0D77A38]();
}

uint64_t sub_1CADC3488()
{
  return MEMORY[0x1E0D77A40]();
}

uint64_t sub_1CADC3494()
{
  return MEMORY[0x1E0D77A48]();
}

uint64_t sub_1CADC34A0()
{
  return MEMORY[0x1E0D77A50]();
}

uint64_t sub_1CADC34AC()
{
  return MEMORY[0x1E0D77A58]();
}

uint64_t sub_1CADC34B8()
{
  return MEMORY[0x1E0D77A60]();
}

uint64_t sub_1CADC34C4()
{
  return MEMORY[0x1E0D77AC0]();
}

uint64_t sub_1CADC34D0()
{
  return MEMORY[0x1E0D77AE0]();
}

uint64_t sub_1CADC34DC()
{
  return MEMORY[0x1E0D77AF8]();
}

uint64_t sub_1CADC34E8()
{
  return MEMORY[0x1E0D77B08]();
}

uint64_t sub_1CADC34F4()
{
  return MEMORY[0x1E0D77B98]();
}

uint64_t sub_1CADC3500()
{
  return MEMORY[0x1E0D77BB0]();
}

uint64_t sub_1CADC350C()
{
  return MEMORY[0x1E0D77BB8]();
}

uint64_t sub_1CADC3518()
{
  return MEMORY[0x1E0D77BC0]();
}

uint64_t sub_1CADC3524()
{
  return MEMORY[0x1E0D77BC8]();
}

uint64_t sub_1CADC3530()
{
  return MEMORY[0x1E0D77BD0]();
}

uint64_t sub_1CADC353C()
{
  return MEMORY[0x1E0D77BE0]();
}

uint64_t sub_1CADC3548()
{
  return MEMORY[0x1E0D77BE8]();
}

uint64_t sub_1CADC3554()
{
  return MEMORY[0x1E0D77C10]();
}

uint64_t sub_1CADC3560()
{
  return MEMORY[0x1E0D781D0]();
}

uint64_t sub_1CADC356C()
{
  return MEMORY[0x1E0D781E0]();
}

uint64_t sub_1CADC3578()
{
  return MEMORY[0x1E0D781E8]();
}

uint64_t sub_1CADC3584()
{
  return MEMORY[0x1E0DF01F8]();
}

uint64_t sub_1CADC3590()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1CADC359C()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1CADC35A8()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1CADC35B4()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1CADC35C0()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1CADC35CC()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_1CADC35D8()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1CADC35E4()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1CADC35F0()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1CADC35FC()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1CADC3608()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1CADC3614()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1CADC3620()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1CADC362C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CADC3638()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1CADC3644()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CADC3650()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1CADC365C()
{
  return MEMORY[0x1E0DF0400]();
}

uint64_t sub_1CADC3668()
{
  return MEMORY[0x1E0DBF8F8]();
}

uint64_t sub_1CADC3674()
{
  return MEMORY[0x1E0DBF918]();
}

uint64_t sub_1CADC3680()
{
  return MEMORY[0x1E0DBF938]();
}

uint64_t sub_1CADC368C()
{
  return MEMORY[0x1E0DBFA00]();
}

uint64_t sub_1CADC3698()
{
  return MEMORY[0x1E0DBFA08]();
}

uint64_t sub_1CADC36A4()
{
  return MEMORY[0x1E0DBFA10]();
}

uint64_t sub_1CADC36B0()
{
  return MEMORY[0x1E0DBFA20]();
}

uint64_t sub_1CADC36BC()
{
  return MEMORY[0x1E0DBFB00]();
}

uint64_t sub_1CADC36C8()
{
  return MEMORY[0x1E0DBFC40]();
}

uint64_t sub_1CADC36D4()
{
  return MEMORY[0x1E0DBFC90]();
}

uint64_t sub_1CADC36E0()
{
  return MEMORY[0x1E0DBFC98]();
}

uint64_t sub_1CADC36EC()
{
  return MEMORY[0x1E0DBFCB0]();
}

uint64_t sub_1CADC36F8()
{
  return MEMORY[0x1E0DBFCC8]();
}

uint64_t sub_1CADC3704()
{
  return MEMORY[0x1E0DBFD20]();
}

uint64_t sub_1CADC3710()
{
  return MEMORY[0x1E0DBFD28]();
}

uint64_t sub_1CADC371C()
{
  return MEMORY[0x1E0DBFD30]();
}

uint64_t sub_1CADC3728()
{
  return MEMORY[0x1E0DBFD98]();
}

uint64_t sub_1CADC3734()
{
  return MEMORY[0x1E0DBFDA8]();
}

uint64_t sub_1CADC3740()
{
  return MEMORY[0x1E0DBFE90]();
}

uint64_t sub_1CADC374C()
{
  return MEMORY[0x1E0DBFE98]();
}

uint64_t sub_1CADC3758()
{
  return MEMORY[0x1E0DBFF80]();
}

uint64_t sub_1CADC3764()
{
  return MEMORY[0x1E0DBFFC8]();
}

uint64_t sub_1CADC3770()
{
  return MEMORY[0x1E0DBFFE0]();
}

uint64_t sub_1CADC377C()
{
  return MEMORY[0x1E0DC0028]();
}

uint64_t sub_1CADC3788()
{
  return MEMORY[0x1E0DC01A8]();
}

uint64_t sub_1CADC3794()
{
  return MEMORY[0x1E0DC01D0]();
}

uint64_t sub_1CADC37A0()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1CADC37AC()
{
  return MEMORY[0x1E0DEF4B8]();
}

uint64_t sub_1CADC37B8()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CADC37C4()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1CADC37D0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CADC37DC()
{
  return MEMORY[0x1E0DEF598]();
}

uint64_t sub_1CADC37E8()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CADC37F4()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1CADC3800()
{
  return MEMORY[0x1E0DEF6A0]();
}

uint64_t sub_1CADC380C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1CADC3818()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1CADC3824()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1CADC3830()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t sub_1CADC383C()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t sub_1CADC3848()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1CADC3854()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1CADC3860()
{
  return MEMORY[0x1E0DF05B0]();
}

uint64_t sub_1CADC386C()
{
  return MEMORY[0x1E0CB17E0]();
}

uint64_t sub_1CADC3878()
{
  return MEMORY[0x1E0CB1800]();
}

uint64_t sub_1CADC3884()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1CADC3890()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1CADC389C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1CADC38A8()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1CADC38B4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CADC38C0()
{
  return MEMORY[0x1E0CB1938]();
}

uint64_t sub_1CADC38CC()
{
  return MEMORY[0x1E0CB1958]();
}

uint64_t sub_1CADC38D8()
{
  return MEMORY[0x1E0CB1968]();
}

uint64_t sub_1CADC38E4()
{
  return MEMORY[0x1E0CB1978]();
}

uint64_t sub_1CADC38F0()
{
  return MEMORY[0x1E0CB19B8]();
}

uint64_t sub_1CADC38FC()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1CADC3908()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CADC3914()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t sub_1CADC3920()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CADC392C()
{
  return MEMORY[0x1E0DEA820]();
}

uint64_t sub_1CADC3938()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1CADC3944()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CADC3950()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1CADC395C()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1CADC3968()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1CADC3974()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1CADC3980()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1CADC398C()
{
  return MEMORY[0x1E0DEA958]();
}

uint64_t sub_1CADC3998()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1CADC39A4()
{
  return MEMORY[0x1E0DEAA68]();
}

uint64_t sub_1CADC39B0()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CADC39BC()
{
  return MEMORY[0x1E0CB1AC8]();
}

uint64_t sub_1CADC39C8()
{
  return MEMORY[0x1E0CB1AD8]();
}

uint64_t sub_1CADC39D4()
{
  return MEMORY[0x1E0CB1AF0]();
}

uint64_t sub_1CADC39E0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1CADC39EC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CADC39F8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CADC3A04()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1CADC3A10()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CADC3A1C()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1CADC3A28()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1CADC3A34()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1CADC3A40()
{
  return MEMORY[0x1E0CB1B30]();
}

uint64_t sub_1CADC3A4C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CADC3A58()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1CADC3A64()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1CADC3A70()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1CADC3A7C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CADC3A88()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CADC3A94()
{
  return MEMORY[0x1E0DF0770]();
}

uint64_t sub_1CADC3AA0()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1CADC3AAC()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_1CADC3AB8()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_1CADC3AC4()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1CADC3AD0()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1CADC3ADC()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1CADC3AE8()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1CADC3AF4()
{
  return MEMORY[0x1E0DF0878]();
}

uint64_t sub_1CADC3B00()
{
  return MEMORY[0x1E0DF0888]();
}

uint64_t sub_1CADC3B0C()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t sub_1CADC3B18()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1CADC3B24()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1CADC3B30()
{
  return MEMORY[0x1E0CB1B58]();
}

uint64_t sub_1CADC3B3C()
{
  return MEMORY[0x1E0D77D88]();
}

uint64_t sub_1CADC3B48()
{
  return MEMORY[0x1E0D77D90]();
}

uint64_t sub_1CADC3B54()
{
  return MEMORY[0x1E0D77D98]();
}

uint64_t sub_1CADC3B60()
{
  return MEMORY[0x1E0D77DA0]();
}

uint64_t sub_1CADC3B6C()
{
  return MEMORY[0x1E0D77DA8]();
}

uint64_t sub_1CADC3B78()
{
  return MEMORY[0x1E0D77DB0]();
}

uint64_t sub_1CADC3B84()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1CADC3B90()
{
  return MEMORY[0x1E0CB1B80]();
}

uint64_t sub_1CADC3B9C()
{
  return MEMORY[0x1E0CB1BA8]();
}

uint64_t sub_1CADC3BA8()
{
  return MEMORY[0x1E0CB1BC8]();
}

uint64_t sub_1CADC3BB4()
{
  return MEMORY[0x1E0CB1BD0]();
}

uint64_t sub_1CADC3BC0()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1CADC3BCC()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1CADC3BD8()
{
  return MEMORY[0x1E0CB1BF8]();
}

uint64_t sub_1CADC3BE4()
{
  return MEMORY[0x1E0CB1C08]();
}

uint64_t sub_1CADC3BF0()
{
  return MEMORY[0x1E0CB1C88]();
}

uint64_t sub_1CADC3BFC()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1CADC3C08()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CADC3C14()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CADC3C20()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1CADC3C2C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CADC3C38()
{
  return MEMORY[0x1E0CB1E60]();
}

uint64_t sub_1CADC3C44()
{
  return MEMORY[0x1E0CB1E78]();
}

uint64_t sub_1CADC3C50()
{
  return MEMORY[0x1E0DEF7D8]();
}

uint64_t sub_1CADC3C5C()
{
  return MEMORY[0x1E0DEF7E0]();
}

uint64_t sub_1CADC3C68()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CADC3C74()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CADC3C80()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CADC3C8C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CADC3C98()
{
  return MEMORY[0x1E0D428F0]();
}

uint64_t sub_1CADC3CA4()
{
  return MEMORY[0x1E0D428F8]();
}

uint64_t sub_1CADC3CB0()
{
  return MEMORY[0x1E0D42900]();
}

uint64_t sub_1CADC3CBC()
{
  return MEMORY[0x1E0D42908]();
}

uint64_t sub_1CADC3CC8()
{
  return MEMORY[0x1E0D42910]();
}

uint64_t sub_1CADC3CD4()
{
  return MEMORY[0x1E0D42920]();
}

uint64_t sub_1CADC3CE0()
{
  return MEMORY[0x1E0D42928]();
}

uint64_t sub_1CADC3CEC()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1CADC3CF8()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1CADC3D04()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1CADC3D10()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1CADC3D1C()
{
  return MEMORY[0x1E0DEFA30]();
}

uint64_t sub_1CADC3D28()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1CADC3D34()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1CADC3D40()
{
  return MEMORY[0x1E0D42958]();
}

uint64_t sub_1CADC3D4C()
{
  return MEMORY[0x1E0D42960]();
}

uint64_t sub_1CADC3D58()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1CADC3D64()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1CADC3D70()
{
  return MEMORY[0x1E0D75C40]();
}

uint64_t sub_1CADC3D7C()
{
  return MEMORY[0x1E0D75C48]();
}

uint64_t sub_1CADC3D88()
{
  return MEMORY[0x1E0DEFAB0]();
}

uint64_t sub_1CADC3D94()
{
  return MEMORY[0x1E0CB20E8]();
}

uint64_t sub_1CADC3DA0()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1CADC3DAC()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CADC3DB8()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1CADC3DC4()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1CADC3DD0()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1CADC3DDC()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1CADC3DE8()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1CADC3DF4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CADC3E00()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CADC3E0C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CADC3E18()
{
  return MEMORY[0x1E0CB24A0]();
}

uint64_t sub_1CADC3E24()
{
  return MEMORY[0x1E0CB2580]();
}

uint64_t sub_1CADC3E30()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CADC3E3C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1CADC3E48()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CADC3E54()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CADC3E60()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1CADC3E6C()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1CADC3E78()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1CADC3E84()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1CADC3E90()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1CADC3E9C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1CADC3EA8()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1CADC3EB4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1CADC3EC0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CADC3ECC()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1CADC3ED8()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CADC3EE4()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CADC3EF0()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CADC3EFC()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_1CADC3F08()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1CADC3F14()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1CADC3F20()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1CADC3F2C()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1CADC3F38()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1CADC3F44()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1CADC3F50()
{
  return MEMORY[0x1E0DEC990]();
}

uint64_t sub_1CADC3F5C()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1CADC3F68()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1CADC3F74()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CADC3F80()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CADC3F8C()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1CADC3F98()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CADC3FA4()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1CADC3FB0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CADC3FBC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CADC3FC8()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CADC3FD4()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CADC3FE0()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1CADC3FEC()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1CADC3FF8()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_1CADC4004()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_1CADC4010()
{
  return MEMORY[0x1E0DECF80]();
}

uint64_t sub_1CADC401C()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1CADC4028()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1CADC4034()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1CADC4040()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1CADC404C()
{
  return MEMORY[0x1E0DED0A0]();
}

uint64_t sub_1CADC4058()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_1CADC4064()
{
  return MEMORY[0x1E0DED0B8]();
}

uint64_t sub_1CADC4070()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1CADC407C()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1CADC4088()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1CADC4094()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1CADC40A0()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1CADC40AC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CADC40B8()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1CADC40C4()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_1CADC40D0()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1CADC40DC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CADC40E8()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1CADC40F4()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1CADC4100()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1CADC410C()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1CADC4118()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1CADC4124()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1CADC4130()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CADC413C()
{
  return MEMORY[0x1E0CB2630]();
}

uint64_t sub_1CADC4148()
{
  return MEMORY[0x1E0CB2638]();
}

uint64_t sub_1CADC4154()
{
  return MEMORY[0x1E0CB2648]();
}

uint64_t sub_1CADC4160()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CADC416C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CADC4178()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CADC4184()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CADC4190()
{
  return MEMORY[0x1E0CB2678]();
}

uint64_t sub_1CADC419C()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1CADC41A8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CADC41B4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CADC41C0()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1CADC41CC()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1CADC41D8()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1CADC41E4()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1CADC41F0()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1CADC41FC()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1CADC4208()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1CADC4214()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
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

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImageAndMetadata(CGImageDestinationRef idst, CGImageRef image, CGImageMetadataRef metadata, CFDictionaryRef options)
{
  MEMORY[0x1E0CBC310](idst, image, metadata, options);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CFStringRef CGImageMetadataCopyStringValueWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CFStringRef)MEMORY[0x1E0CBC388](metadata, parent, path);
}

CGMutableImageMetadataRef CGImageMetadataCreateMutable(void)
{
  return (CGMutableImageMetadataRef)MEMORY[0x1E0CBC3C0]();
}

BOOL CGImageMetadataRegisterNamespaceForPrefix(CGMutableImageMetadataRef metadata, CFStringRef xmlns, CFStringRef prefix, CFErrorRef *err)
{
  return MEMORY[0x1E0CBC408](metadata, xmlns, prefix, err);
}

BOOL CGImageMetadataSetValueWithPath(CGMutableImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path, CFTypeRef value)
{
  return MEMORY[0x1E0CBC428](metadata, parent, path, value);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x1E0CBC510](isrc, index, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
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

uint64_t PFAdjustmentStyleCastFromString()
{
  return MEMORY[0x1E0D75360]();
}

uint64_t PFLCCurationScoreForAsset()
{
  return MEMORY[0x1E0D75068]();
}

uint64_t PFMutableArrayShuffleWithRandomNumberGenerator()
{
  return MEMORY[0x1E0D75540]();
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  return MEMORY[0x1E0D710D8]();
}

uint64_t PFParallaxStyleFrequencyTable()
{
  return MEMORY[0x1E0D756C8]();
}

uint64_t PFPosterWantsLowLuminanceContent()
{
  return MEMORY[0x1E0D75880]();
}

uint64_t PGStringFromSuggestionNotificationUserType()
{
  return MEMORY[0x1E0D764C0]();
}

uint64_t PHMemoryMoodForString()
{
  return MEMORY[0x1E0CD1D00]();
}

uint64_t PHMemoryValidatedMemoryCategory()
{
  return MEMORY[0x1E0CD1D38]();
}

uint64_t PHStringFromPHAdjustmentStyleCastShort()
{
  return MEMORY[0x1E0CD1E28]();
}

uint64_t PHSuggestionStringWithSubtype()
{
  return MEMORY[0x1E0CD1E40]();
}

uint64_t PLGetOrientationAndUntransformedSizeFromImageURL()
{
  return MEMORY[0x1E0D71E08]();
}

uint64_t PLIsFeaturedContentAllowed()
{
  return MEMORY[0x1E0D741C0]();
}

uint64_t PLIsSharedLibrarySuggestionsEnabled()
{
  return MEMORY[0x1E0D74288]();
}

uint64_t PLMemoriesAlgorithmsVersionFromPhotosGraphVersion()
{
  return MEMORY[0x1E0D71FB8]();
}

uint64_t PLWallpaperGetLog()
{
  return MEMORY[0x1E0D74978]();
}

uint64_t PNAmbientPhotoFrameEnabled()
{
  return MEMORY[0x1E0D77F30]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
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

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x1E0D71160]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

void operator delete(void *__p)
{
  off_1E85154C0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E85154C8(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x1E0D1FF00]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_get_input_blob_name()
{
  return MEMORY[0x1E0D1FF90]();
}

uint64_t espresso_get_output_blob_name()
{
  return MEMORY[0x1E0D1FFA8]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1E0D20040]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
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

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExtendedExistentialTypeMetadata_unique()
{
  return MEMORY[0x1E0DEEC70]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x1E0DF1020]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
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

uint64_t swift_unknownObjectUnownedAssign()
{
  return MEMORY[0x1E0DEEEE0]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x1E0DEEEF8]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x1E0DEEF00]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x1E0DEEF08]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1E0DEEF60]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1E0DEEF68]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1E0DEEF70]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
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

int uname(utsname *a1)
{
  return MEMORY[0x1E0C859A0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1C0](__A, __IA, __C, __I, __N);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

