void sub_1A9CB2A2C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  type metadata accessor for WeekResultsBuilder();
  v0 = swift_bridgeObjectRetain();
  sub_1A9CB2AF0(v0);
  v2 = v1;
  swift_bridgeObjectRelease();
  if (v2)
  {
    objc_msgSend(v2, sel_sleepDuration);

  }
}

uint64_t sub_1A9CB2AF0(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double v20;
  double v21;
  double v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = a1 + 64;
  v3 = *(_BYTE *)(a1 + 32);
  v4 = 1 << v3;
  v5 = -1;
  if (1 << v3 < 64)
    v5 = ~(-1 << (1 << v3));
  v6 = v5 & *(_QWORD *)(a1 + 64);
  if (v6)
  {
    v7 = 0;
    v8 = __clz(__rbit64(v6));
    v9 = (v6 - 1) & v6;
    v10 = (unint64_t)(v4 + 63) >> 6;
    while (2)
    {
      v11 = 8 * v8;
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + v11);
      v12 = *(void **)(*(_QWORD *)(a1 + 56) + v11);
      swift_bridgeObjectRetain();
      v14 = v12;
      if (v9)
      {
LABEL_6:
        v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v16 = v15 | (v7 << 6);
        goto LABEL_7;
      }
      while (1)
      {
        v23 = v7 + 1;
        if (__OFADD__(v7, 1))
          break;
        if (v23 >= v10)
          goto LABEL_27;
        v24 = *(_QWORD *)(v2 + 8 * v23);
        ++v7;
        if (!v24)
        {
          v7 = v23 + 1;
          if (v23 + 1 >= v10)
            goto LABEL_27;
          v24 = *(_QWORD *)(v2 + 8 * v7);
          if (!v24)
          {
            v7 = v23 + 2;
            if (v23 + 2 >= v10)
              goto LABEL_27;
            v24 = *(_QWORD *)(v2 + 8 * v7);
            if (!v24)
            {
              v7 = v23 + 3;
              if (v23 + 3 >= v10)
                goto LABEL_27;
              v24 = *(_QWORD *)(v2 + 8 * v7);
              if (!v24)
              {
                v25 = v23 + 4;
                if (v25 >= v10)
                {
LABEL_27:
                  swift_release();
                  return v31;
                }
                v24 = *(_QWORD *)(v2 + 8 * v25);
                if (!v24)
                {
                  while (1)
                  {
                    v7 = v25 + 1;
                    if (__OFADD__(v25, 1))
                      break;
                    if (v7 >= v10)
                      goto LABEL_27;
                    v24 = *(_QWORD *)(v2 + 8 * v7);
                    ++v25;
                    if (v24)
                      goto LABEL_24;
                  }
                  __break(1u);
LABEL_44:
                  v28 = 0;
                  v29 = 6;
                  if (v10 > 6)
                    v29 = v10;
                  v30 = v29 - 6;
                  while (v30 != v28)
                  {
                    v27 = *(_QWORD *)(a1 + 112 + 8 * v28++);
                    if (v27)
                    {
                      v7 = v28 + 5;
                      goto LABEL_31;
                    }
                  }
                  return 0;
                }
                v7 = v25;
              }
            }
          }
        }
LABEL_24:
        v9 = (v24 - 1) & v24;
        v16 = __clz(__rbit64(v24)) + (v7 << 6);
LABEL_7:
        v17 = 8 * v16;
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + v17);
        v19 = *(id *)(*(_QWORD *)(a1 + 56) + v17);
        objc_msgSend(v14, sel_sleepDuration);
        v21 = v20;
        objc_msgSend(v19, sel_sleepDuration);
        if (v21 < v22)
        {

          v14 = v19;
          v31 = v18;
          if (v9)
            goto LABEL_6;
        }
        else
        {

          if (v9)
            goto LABEL_6;
        }
      }
      __break(1u);
LABEL_38:
      if (v13 >= 9)
      {
        v27 = *(_QWORD *)(a1 + 96);
        if (v27)
        {
          v7 = 4;
        }
        else
        {
          v27 = *(_QWORD *)(a1 + 104);
          if (!v27)
            goto LABEL_44;
          v7 = 5;
        }
LABEL_31:
        v9 = (v27 - 1) & v27;
        v8 = __clz(__rbit64(v27)) + (v7 << 6);
        continue;
      }
      break;
    }
  }
  else
  {
    v13 = v3 & 0x3F;
    if (v13 > 6)
    {
      v10 = (unint64_t)(v4 + 63) >> 6;
      v27 = *(_QWORD *)(a1 + 72);
      if (v27)
      {
        v7 = 1;
        goto LABEL_31;
      }
      if (v13 >= 8)
      {
        v27 = *(_QWORD *)(a1 + 80);
        if (v27)
        {
          v7 = 2;
        }
        else
        {
          v27 = *(_QWORD *)(a1 + 88);
          if (!v27)
            goto LABEL_38;
          v7 = 3;
        }
        goto LABEL_31;
      }
    }
  }
  return 0;
}

void sub_1A9CB2DB0(uint64_t a1@<X0>, uint64_t a2@<X1>, double a3@<X2>, int a4@<W3>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  unint64_t v16;
  char v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _BOOL4 v25;
  double v26;
  uint64_t v27;
  uint64_t *v28;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t *v31;
  double v32;
  int v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a4;
  v31 = a5;
  v32 = a3;
  v8 = sub_1A9CE810C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1A9CE8100();
  v13 = *(_QWORD *)(a2 + *(int *)(type metadata accessor for WeekResultsBuilder() + 36));
  v14 = sub_1A9CE8100();
  v15 = 0.0;
  if (*(_QWORD *)(v13 + 16))
  {
    v16 = sub_1A9BAD7DC(v14);
    if ((v17 & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v13 + 56) + 8 * v16), sel_sleepDuration);
      v15 = v18;
    }
  }
  if (qword_1EEB42E78 != -1)
    swift_once();
  v19 = sub_1A9CE6990();
  __swift_project_value_buffer(v19, (uint64_t)qword_1EEB49440);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  v20 = sub_1A9CE6978();
  v21 = sub_1A9CE864C();
  if (os_log_type_enabled(v20, v21))
  {
    v29[1] = v5;
    v22 = swift_slowAlloc();
    v29[0] = swift_slowAlloc();
    v35 = v29[0];
    *(_DWORD *)v22 = 136446979;
    v34 = sub_1A9B91D6C(0xD000000000000012, 0x80000001A9CF6510, &v35);
    sub_1A9CE888C();
    *(_WORD *)(v22 + 12) = 2048;
    v23 = sub_1A9CE8100();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v34 = v23;
    sub_1A9CE888C();
    *(_WORD *)(v22 + 22) = 2049;
    v34 = *(_QWORD *)&v15;
    sub_1A9CE888C();
    *(_WORD *)(v22 + 32) = 1024;
    v24 = v33;
    if ((v33 & 1) != 0)
    {
      v25 = 0;
      v26 = v32;
    }
    else
    {
      v26 = v32;
      v25 = v32 - *MEMORY[0x1E0DA85A0] <= v15;
    }
    LODWORD(v34) = v25;
    sub_1A9CE888C();
    _os_log_impl(&dword_1A9B87000, v20, v21, "[%{public}s] [Index %ld] duration: %{private}f, met goal: %{BOOL}d", (uint8_t *)v22, 0x26u);
    v27 = v29[0];
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v27, -1, -1);
    MEMORY[0x1AF420344](v22, -1, -1);

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);

    v24 = v33;
    v26 = v32;
  }
  v28 = v31;
  *v31 = v30;
  *((double *)v28 + 1) = v15;
  *((double *)v28 + 2) = v26;
  *((_BYTE *)v28 + 24) = v24 & 1;
}

uint64_t sub_1A9CB30EC(void (*a1)(_QWORD *__return_ptr, char *), uint64_t a2, uint64_t (*a3)(char *, uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
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
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  void (*v48)(char *, char *, uint64_t);
  char *v49;
  char *v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  void (*v60)(char *, uint64_t);
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  char *v80;
  void (*v81)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v82;
  char *v83;
  char *v84;
  void (*v85)(_QWORD *__return_ptr, char *);
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t, uint64_t);
  char *v88;
  uint64_t v89;
  char *v90;
  char *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  void (*v95)(char *, char *, uint64_t);
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD v101[3];
  char v102;
  uint64_t v103;

  v5 = v4;
  v100 = a4;
  v85 = a1;
  v86 = a2;
  sub_1A9CB38DC();
  v92 = v7;
  v9 = MEMORY[0x1E0C80A78](v7, v8);
  v91 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v11);
  v90 = (char *)&v79 - v12;
  sub_1A9CB3940();
  v14 = v13;
  v16 = MEMORY[0x1E0C80A78](v13, v15);
  v89 = (uint64_t)&v79 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v16, v18);
  v88 = (char *)&v79 - v20;
  MEMORY[0x1E0C80A78](v19, v21);
  v23 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)&v79 - v22);
  sub_1A9CB39B8();
  MEMORY[0x1E0C80A78](v24, v25);
  v98 = (char *)&v79 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_1A9CE810C();
  v28 = *(_QWORD *)(v27 - 8);
  v30 = MEMORY[0x1E0C80A78](v27, v29);
  v87 = (void (*)(char *, uint64_t, uint64_t, uint64_t))((char *)&v79 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0));
  v33 = MEMORY[0x1E0C80A78](v30, v32);
  v84 = (char *)&v79 - v34;
  MEMORY[0x1E0C80A78](v33, v35);
  v83 = (char *)&v79 - v36;
  sub_1A9CB3A0C();
  v38 = v37;
  MEMORY[0x1E0C80A78](v37, v39);
  v41 = (char *)&v79 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v103 = MEMORY[0x1E0DEE9D8];
  sub_1A9BE0520(0, 0, 0);
  v42 = v14;
  sub_1A9CE8688();
  v43 = &v41[*(int *)(v38 + 36)];
  v96 = v42;
  v44 = (uint64_t)&v41[*(int *)(v42 + 36)];
  v45 = sub_1A9B92B9C(&qword_1EEB49CB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB44E0], MEMORY[0x1E0CB4500]);
  v97 = v43;
  v82 = v45;
  if ((sub_1A9CE82A4() & 1) != 0)
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v28 + 56);
LABEL_3:
    v46 = (uint64_t)v98;
    v23(v98, 1, 1, v27);
    sub_1A9B97190((uint64_t)v41, (uint64_t (*)(_QWORD))sub_1A9CB3A0C);
    sub_1A9B97190(v46, (uint64_t (*)(_QWORD))sub_1A9CB39B8);
    return v103;
  }
  else
  {
    v81 = v23;
    v48 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
    v94 = v28;
    v95 = v48;
    v49 = v97;
    v80 = v41;
    v79 = v44;
    while (1)
    {
      v50 = v49;
      v51 = v95;
      v95(v98, v50, v27);
      v99 = sub_1A9B92B9C(&qword_1EEB49C88, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB44E0], MEMORY[0x1E0CB44F8]);
      if ((sub_1A9CE8298() & 1) == 0)
        break;
      v100 = v5;
      v52 = v92;
      v53 = v90;
      v54 = &v90[*(int *)(v92 + 48)];
      v51(v90, v41, v27);
      v93 = v54;
      v51(v54, (char *)v44, v27);
      v55 = v91;
      v56 = &v91[*(int *)(v52 + 48)];
      v51(v91, v53, v27);
      v51(v56, v54, v27);
      v57 = v94;
      v58 = *(void (**)(char *, char *, uint64_t))(v94 + 32);
      v59 = v88;
      v58(v88, v55, v27);
      v60 = *(void (**)(char *, uint64_t))(v57 + 8);
      v60(v56, v27);
      v61 = v97;
      v62 = &v55[*(int *)(v52 + 48)];
      v58(v55, v53, v27);
      v58(v62, v93, v27);
      v58(&v59[*(int *)(v96 + 36)], v62, v27);
      a3 = (uint64_t (*)(char *, uint64_t))v60;
      v60(v55, v27);
      v63 = (uint64_t)v59;
      v64 = (uint64_t)v81;
      sub_1A9CB3AEC(v63, (uint64_t)v81);
      LOBYTE(v60) = sub_1A9CE8298();
      v23 = v87;
      v95((char *)v87, v61, v27);
      v44 = v89;
      sub_1A9BA6F90(v64, v89, (uint64_t (*)(_QWORD))sub_1A9CB3940);
      if ((v60 & 1) == 0)
        goto LABEL_17;
      v65 = sub_1A9CE828C();
      sub_1A9B97190(v44, (uint64_t (*)(_QWORD))sub_1A9CB3940);
      result = a3((char *)v23, v27);
      if ((v65 & 1) == 0)
        goto LABEL_18;
      sub_1A9B97190(v64, (uint64_t (*)(_QWORD))sub_1A9CB3940);
      v101[0] = 1;
      sub_1A9B92B9C(&qword_1EEB49CA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB44E0], MEMORY[0x1E0CB4508]);
      v66 = v84;
      sub_1A9CE88A4();
      a3(v61, v27);
      v58(v61, v66, v27);
      v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v94 + 56);
      v67 = v98;
      v23(v98, 0, 1, v27);
      v68 = v83;
      v58(v83, v67, v27);
      v69 = v100;
      v85(v101, v68);
      if (v69)
      {
        a3(v68, v27);
        sub_1A9B97190((uint64_t)v80, (uint64_t (*)(_QWORD))sub_1A9CB3A0C);
        return swift_release();
      }
      v100 = 0;
      a3(v68, v27);
      v70 = v101[0];
      v71 = v101[1];
      v72 = v101[2];
      v73 = v102;
      v74 = v103;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A9BE0520(0, *(_QWORD *)(v74 + 16) + 1, 1);
        v74 = v103;
      }
      v76 = *(_QWORD *)(v74 + 16);
      v75 = *(_QWORD *)(v74 + 24);
      if (v76 >= v75 >> 1)
      {
        sub_1A9BE0520(v75 > 1, v76 + 1, 1);
        v74 = v103;
      }
      *(_QWORD *)(v74 + 16) = v76 + 1;
      v77 = v74 + 32 * v76;
      *(_QWORD *)(v77 + 32) = v70;
      *(_QWORD *)(v77 + 40) = v71;
      *(_QWORD *)(v77 + 48) = v72;
      *(_BYTE *)(v77 + 56) = v73;
      v49 = v97;
      v44 = v79;
      v78 = sub_1A9CE82A4();
      v5 = v100;
      v41 = v80;
      if ((v78 & 1) != 0)
        goto LABEL_3;
    }
    __break(1u);
LABEL_17:
    sub_1A9B97190(v44, (uint64_t (*)(_QWORD))sub_1A9CB3940);
    result = a3((char *)v23, v27);
LABEL_18:
    __break(1u);
  }
  return result;
}

_QWORD *sub_1A9CB37BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  sub_1A9B94CA0(0, (unint64_t *)&qword_1ED262A60, MEMORY[0x1E0DEE9B0] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_1A9CB3B30(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1A9CACF44();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

void sub_1A9CB38BC(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  sub_1A9CB2DB0(a1, *(_QWORD *)(v2 + 16), *(double *)(v2 + 24), *(unsigned __int8 *)(v2 + 32), a2);
}

void sub_1A9CB38DC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EEB49C78)
  {
    sub_1A9CE810C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EEB49C78);
  }
}

void sub_1A9CB3940()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB49C80)
  {
    sub_1A9CE810C();
    sub_1A9B92B9C(&qword_1EEB49C88, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB44E0], MEMORY[0x1E0CB44F8]);
    v0 = sub_1A9CE85A4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB49C80);
  }
}

void sub_1A9CB39B8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB49C90)
  {
    sub_1A9CE810C();
    v0 = sub_1A9CE8880();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB49C90);
  }
}

void sub_1A9CB3A0C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB49C98)
  {
    sub_1A9CB3940();
    sub_1A9CB3A6C();
    v0 = sub_1A9CE8A6C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB49C98);
  }
}

unint64_t sub_1A9CB3A6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB49CA0;
  if (!qword_1EEB49CA0)
  {
    sub_1A9CB3940();
    v2 = v1;
    v3[0] = sub_1A9B92B9C(&qword_1EEB49CA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB44E0], MEMORY[0x1E0CB4508]);
    v3[1] = sub_1A9BA4058();
    result = MEMORY[0x1AF420284](MEMORY[0x1E0DEB8C0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB49CA0);
  }
  return result;
}

uint64_t sub_1A9CB3AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A9CB3940();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_QWORD *sub_1A9CB3B30(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  void *v20;
  id v21;

  v5 = result;
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
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
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
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
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
LABEL_41:
  __break(1u);
  return result;
}

uint64_t FloatingPoint.rounded(_:toNearest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t);
  uint64_t v13;

  v4 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v13 - v9;
  sub_1A9CE822C();
  sub_1A9CE8238();
  v11 = *(void (**)(char *, uint64_t))(v4 + 8);
  v11(v6, a3);
  sub_1A9CE8514();
  return ((uint64_t (*)(char *, uint64_t))v11)(v10, a3);
}

uint64_t static DateComponents.hourAndMinuteComponents.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t v7;

  sub_1A9B92F34(0, &qword_1EEB47BF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v0 = sub_1A9CE642C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1A9CEB530;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E0CB1140], v0);
  v6(v5 + v2, *MEMORY[0x1E0CB1178], v0);
  v7 = sub_1A9C4B104(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

uint64_t DateComponents.timeComponents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v3 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1A9B92F34(0, &qword_1EEB44250, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1470], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v19 - v6;
  sub_1A9B92F34(0, &qword_1ED262DF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11F0], v3);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v19 - v10;
  sub_1A9CE6060();
  if ((v12 & 1) != 0 && (sub_1A9CE606C(), (v13 & 1) != 0) && (sub_1A9CE6030(), (v14 & 1) != 0))
  {
    v18 = sub_1A9CE60C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(a1, v1, v18);
  }
  else
  {
    v15 = sub_1A9CE6444();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v11, 1, 1, v15);
    v16 = sub_1A9CE6498();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v7, 1, 1, v16);
    sub_1A9CE6048();
    sub_1A9CE6084();
    return sub_1A9CE60A8();
  }
}

uint64_t DateComponents.calendarComponents.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x1E0DEE9E8];
  v1 = _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0();
  sub_1A9CB49DC(v1, v0, (uint64_t)&v3);
  swift_bridgeObjectRelease();
  return v3;
}

void static DateComponents.timeComponents(fromHours:)(double a1)
{
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1A9B92F34(0, &qword_1EEB44250, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1470], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v14 - v5;
  sub_1A9B92F34(0, &qword_1ED262DF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11F0], v2);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v14 - v9;
  if (a1 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (a1 >= 9.22337204e18)
  {
LABEL_9:
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((*(_QWORD *)&a1 & 0x7FF0000000000000) == 0x7FF0000000000000)
    goto LABEL_10;
  v11 = round((a1 - (double)(uint64_t)a1) * 60.0);
  if ((*(_QWORD *)&v11 & 0x7FF0000000000000) == 0x7FF0000000000000)
    goto LABEL_10;
  if (v11 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v11 < 9.22337204e18)
  {
    v12 = sub_1A9CE6444();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
    v13 = sub_1A9CE6498();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v6, 1, 1, v13);
    sub_1A9CE60A8();
    return;
  }
LABEL_12:
  __break(1u);
}

uint64_t DateComponents.hourAndMinute.getter()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;

  v0 = sub_1A9CE6048();
  if ((v1 & 1) != 0)
    return 0;
  v2 = v0;
  sub_1A9CE6084();
  if ((v3 & 1) != 0)
    return 0;
  return v2;
}

uint64_t sub_1A9CB4400@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t result;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v3 = sub_1A9CE6048();
  if ((v4 & 1) != 0 || (v5 = v3, result = sub_1A9CE6084(), (v7 & 1) != 0))
  {
    v9 = sub_1A9CE60C0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, v1, v9);
  }
  else if (result == 60 && __OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    v8 = sub_1A9CE60C0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, v1, v8);
    sub_1A9CE6054();
    return sub_1A9CE6090();
  }
  return result;
}

uint64_t sub_1A9CB44C8(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v4;

  if ((a4 & 1) != 0)
  {
    if ((a2 & 1) != 0)
      return 0;
    return 0;
  }
  if ((a2 & 1) != 0)
    return 0;
  v4 = -1;
  if (a3 >= a1)
    v4 = 1;
  if (a3 == a1)
    return 0;
  else
    return v4;
}

uint64_t static DateComponents.floatingCalendarComponents.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t v7;

  sub_1A9B92F34(0, &qword_1EEB47BF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v0 = sub_1A9CE642C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1A9CF3DB0;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E0CB1138], v0);
  v6(v5 + v2, *MEMORY[0x1E0CB1158], v0);
  v6(v5 + 2 * v2, *MEMORY[0x1E0CB1160], v0);
  v6(v5 + 3 * v2, *MEMORY[0x1E0CB1130], v0);
  v6(v5 + 4 * v2, *MEMORY[0x1E0CB1140], v0);
  v6(v5 + 5 * v2, *MEMORY[0x1E0CB1178], v0);
  v6(v5 + 6 * v2, *MEMORY[0x1E0CB1188], v0);
  v7 = sub_1A9C4B104(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

uint64_t static DateComponents.timeComponents.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t v7;

  sub_1A9B92F34(0, &qword_1EEB47BF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v0 = sub_1A9CE642C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1A9CED850;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E0CB1140], v0);
  v6(v5 + v2, *MEMORY[0x1E0CB1178], v0);
  v6(v5 + 2 * v2, *MEMORY[0x1E0CB1188], v0);
  v7 = sub_1A9C4B104(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

uint64_t sub_1A9CB47B0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  unint64_t v16;
  int64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;

  v27 = a3;
  v4 = sub_1A9CE642C();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v4, v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v10);
  v12 = (char *)&v27 - v11;
  v13 = *(_QWORD *)(a1 + 56);
  v28 = a1 + 56;
  v14 = 1 << *(_BYTE *)(a1 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v17 = (unint64_t)(v14 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v19 = 0;
  while (v16)
  {
    v20 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    v21 = v20 | (v19 << 6);
LABEL_21:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v12, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v5 + 72) * v21, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v9, v12, v4);
    v25 = sub_1A9CE6078();
    if ((v26 & 1) == 0 && v25 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (__OFSUB__(0, v25))
      {
        __break(1u);
        return swift_release();
      }
      sub_1A9CE60B4();
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }
  v22 = v19 + 1;
  if (__OFADD__(v19, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v22 >= v17)
    return swift_release();
  v23 = *(_QWORD *)(v28 + 8 * v22);
  ++v19;
  if (v23)
    goto LABEL_20;
  v19 = v22 + 1;
  if (v22 + 1 >= v17)
    return swift_release();
  v23 = *(_QWORD *)(v28 + 8 * v19);
  if (v23)
    goto LABEL_20;
  v19 = v22 + 2;
  if (v22 + 2 >= v17)
    return swift_release();
  v23 = *(_QWORD *)(v28 + 8 * v19);
  if (v23)
  {
LABEL_20:
    v16 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v19 << 6);
    goto LABEL_21;
  }
  v24 = v22 + 3;
  if (v24 >= v17)
    return swift_release();
  v23 = *(_QWORD *)(v28 + 8 * v24);
  if (v23)
  {
    v19 = v24;
    goto LABEL_20;
  }
  while (1)
  {
    v19 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v19 >= v17)
      return swift_release();
    v23 = *(_QWORD *)(v28 + 8 * v19);
    ++v24;
    if (v23)
      goto LABEL_20;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1A9CB49DC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t result;
  int64_t v26;
  unint64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  uint64_t v33;
  char v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;

  v39 = a3;
  v42 = a2;
  v4 = sub_1A9CE642C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v38 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v37 - v10;
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v37 - v14;
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v37 - v18;
  v20 = *(_QWORD *)(a1 + 56);
  v40 = a1 + 56;
  v21 = 1 << *(_BYTE *)(a1 + 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & v20;
  v41 = (unint64_t)(v21 + 63) >> 6;
  v24 = a1;
  result = swift_bridgeObjectRetain();
  v26 = 0;
  while (1)
  {
    if (v23)
    {
      v27 = __clz(__rbit64(v23));
      v23 &= v23 - 1;
      v28 = v27 | (v26 << 6);
      goto LABEL_21;
    }
    v29 = v26 + 1;
    if (__OFADD__(v26, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v29 >= v41)
      return swift_release();
    v30 = *(_QWORD *)(v40 + 8 * v29);
    ++v26;
    if (!v30)
    {
      v26 = v29 + 1;
      if (v29 + 1 >= v41)
        return swift_release();
      v30 = *(_QWORD *)(v40 + 8 * v26);
      if (!v30)
      {
        v26 = v29 + 2;
        if (v29 + 2 >= v41)
          return swift_release();
        v30 = *(_QWORD *)(v40 + 8 * v26);
        if (!v30)
          break;
      }
    }
LABEL_20:
    v23 = (v30 - 1) & v30;
    v28 = __clz(__rbit64(v30)) + (v26 << 6);
LABEL_21:
    v32 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    v32(v19, *(_QWORD *)(v24 + 48) + *(_QWORD *)(v5 + 72) * v28, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v15, v19, v4);
    v33 = sub_1A9CE6078();
    if ((v34 & 1) != 0 || v33 == 0x7FFFFFFFFFFFFFFFLL)
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v15, v4);
    }
    else
    {
      v35 = v38;
      v32(v38, (unint64_t)v15, v4);
      sub_1A9CB51E0((uint64_t)v11, v35);
      v36 = *(void (**)(char *, uint64_t))(v5 + 8);
      v36(v11, v4);
      result = ((uint64_t (*)(char *, uint64_t))v36)(v15, v4);
    }
  }
  v31 = v29 + 3;
  if (v31 >= v41)
    return swift_release();
  v30 = *(_QWORD *)(v40 + 8 * v31);
  if (v30)
  {
    v26 = v31;
    goto LABEL_20;
  }
  while (1)
  {
    v26 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v26 >= v41)
      return swift_release();
    v30 = *(_QWORD *)(v40 + 8 * v26);
    ++v31;
    if (v30)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t DateComponents.enumerate(components:block:)(uint64_t a1, void (*a2)(char *, uint64_t, _QWORD))
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
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;

  v4 = sub_1A9CE642C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v27 - v11;
  v13 = *(_QWORD *)(a1 + 56);
  v28 = a1 + 56;
  v14 = 1 << *(_BYTE *)(a1 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & v13;
  v29 = (unint64_t)(v14 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  while (1)
  {
    if (v16)
    {
      v19 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v20 = v19 | (v18 << 6);
      goto LABEL_5;
    }
    v24 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v24 >= v29)
      return swift_release();
    v25 = *(_QWORD *)(v28 + 8 * v24);
    ++v18;
    if (!v25)
    {
      v18 = v24 + 1;
      if (v24 + 1 >= v29)
        return swift_release();
      v25 = *(_QWORD *)(v28 + 8 * v18);
      if (!v25)
      {
        v18 = v24 + 2;
        if (v24 + 2 >= v29)
          return swift_release();
        v25 = *(_QWORD *)(v28 + 8 * v18);
        if (!v25)
          break;
      }
    }
LABEL_23:
    v16 = (v25 - 1) & v25;
    v20 = __clz(__rbit64(v25)) + (v18 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v12, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v5 + 72) * v20, v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v12, v4);
    v21 = sub_1A9CE6078();
    if ((v22 & 1) == 0 && v21 == 0x7FFFFFFFFFFFFFFFLL)
      v23 = 0;
    else
      v23 = v21;
    a2(v8, v23, v22 & 1 | (v21 == 0x7FFFFFFFFFFFFFFFLL));
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  v26 = v24 + 3;
  if (v26 >= v29)
    return swift_release();
  v25 = *(_QWORD *)(v28 + 8 * v26);
  if (v25)
  {
    v18 = v26;
    goto LABEL_23;
  }
  while (1)
  {
    v18 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v18 >= v29)
      return swift_release();
    v25 = *(_QWORD *)(v28 + 8 * v18);
    ++v26;
    if (v25)
      goto LABEL_23;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1A9CB4ECC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;

  v0 = sub_1A9CE6048();
  if ((v1 & 1) != 0)
    return 0;
  v2 = v0;
  sub_1A9CE6084();
  if ((v3 & 1) != 0)
    return 0;
  return v2;
}

uint64_t sub_1A9CB4F18(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_1A9CE8C4C();
  swift_bridgeObjectRetain();
  sub_1A9CE831C();
  v8 = sub_1A9CE8C7C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1A9CE8BB0() & 1) != 0)
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
      if (v19 || (sub_1A9CE8BB0() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1A9CB5D60(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1A9CB50C4(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_1A9CE8C4C();
  sub_1A9CE8C58();
  v6 = sub_1A9CE8C7C();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_1A9CB5EF8(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_1A9CB51E0(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_1A9CE642C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, MEMORY[0x1E0CB11B8]);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1A9B92B9C(&qword_1EEB47C48, v11, MEMORY[0x1E0CB11D0]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_1A9CE8244();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_1A9B92B9C(&qword_1EEB47C50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D8]);
      v21 = sub_1A9CE82A4();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_1A9CB6044((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_1A9CB543C()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  sub_1A9CB7258();
  v3 = sub_1A9CE8994();
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
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_1A9CE8C4C();
      sub_1A9CE831C();
      result = sub_1A9CE8C7C();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1A9CB5714()
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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  sub_1A9C4C164(0, &qword_1EEB49CB8, (uint64_t (*)(uint64_t))type metadata accessor for HKCategoryValueSleepAnalysis, &qword_1EEB47BD8, (uint64_t)&unk_1A9CECBE4);
  result = sub_1A9CE8994();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
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
                v1 = v0;
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
      sub_1A9CE8C4C();
      sub_1A9CE8C58();
      result = sub_1A9CE8C7C();
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

uint64_t sub_1A9CB59D8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
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
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  _QWORD *v37;
  uint64_t v38;

  v1 = v0;
  v2 = sub_1A9CE642C();
  v38 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  sub_1A9C4C164(0, &qword_1EEB47C40, v7, &qword_1EEB47C48, MEMORY[0x1E0CB11D0]);
  v8 = sub_1A9CE8994();
  v9 = v8;
  if (*(_QWORD *)(v6 + 16))
  {
    v10 = 1 << *(_BYTE *)(v6 + 32);
    v11 = *(_QWORD *)(v6 + 56);
    v37 = (_QWORD *)(v6 + 56);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v35 = v0;
    v36 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 56;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v18 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v19 = v18 | (v16 << 6);
      }
      else
      {
        v20 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v20 >= v36)
          goto LABEL_33;
        v21 = v37[v20];
        ++v16;
        if (!v21)
        {
          v16 = v20 + 1;
          if (v20 + 1 >= v36)
            goto LABEL_33;
          v21 = v37[v16];
          if (!v21)
          {
            v16 = v20 + 2;
            if (v20 + 2 >= v36)
              goto LABEL_33;
            v21 = v37[v16];
            if (!v21)
            {
              v22 = v20 + 3;
              if (v22 >= v36)
              {
LABEL_33:
                swift_release();
                v1 = v35;
                v34 = 1 << *(_BYTE *)(v6 + 32);
                if (v34 > 63)
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v34;
                *(_QWORD *)(v6 + 16) = 0;
                break;
              }
              v21 = v37[v22];
              if (!v21)
              {
                while (1)
                {
                  v16 = v22 + 1;
                  if (__OFADD__(v22, 1))
                    goto LABEL_39;
                  if (v16 >= v36)
                    goto LABEL_33;
                  v21 = v37[v16];
                  ++v22;
                  if (v21)
                    goto LABEL_23;
                }
              }
              v16 = v22;
            }
          }
        }
LABEL_23:
        v13 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v16 << 6);
      }
      v23 = v6;
      v24 = *(_QWORD *)(v6 + 48);
      v25 = *(_QWORD *)(v38 + 72);
      v26 = *(void (**)(char *, unint64_t, uint64_t))(v38 + 32);
      v26(v5, v24 + v25 * v19, v2);
      sub_1A9B92B9C(&qword_1EEB47C48, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D0]);
      result = sub_1A9CE8244();
      v27 = -1 << *(_BYTE *)(v9 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v14 + 8 * (v28 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v14 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v14 + 8 * v29);
        }
        while (v33 == -1);
        v17 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(_QWORD *)(v9 + 48) + v17 * v25, v5, v2);
      ++*(_QWORD *)(v9 + 16);
      v6 = v23;
    }
  }
  result = swift_release();
  *v1 = v9;
  return result;
}

uint64_t sub_1A9CB5D60(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1A9CB543C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1A9CB6248();
      goto LABEL_22;
    }
    sub_1A9CB67E8();
  }
  v11 = *v4;
  sub_1A9CE8C4C();
  sub_1A9CE831C();
  result = sub_1A9CE8C7C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1A9CE8BB0(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1A9CE8BD4();
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
          result = sub_1A9CE8BB0();
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

uint64_t sub_1A9CB5EF8(uint64_t result, unint64_t a2, char a3)
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
    sub_1A9CB5714();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_1A9CB63F4();
      goto LABEL_14;
    }
    sub_1A9CB6A90();
  }
  v8 = *v3;
  sub_1A9CE8C4C();
  sub_1A9CE8C58();
  result = sub_1A9CE8C7C();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for HKCategoryValueSleepAnalysis(0);
      result = sub_1A9CE8BD4();
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

uint64_t sub_1A9CB6044(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __n128 v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v28 = a1;
  v6 = sub_1A9CE642C();
  v7 = *(_QWORD *)(v6 - 8);
  v9.n128_f64[0] = MEMORY[0x1E0C80A78](v6, v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(*v3 + 16);
  v13 = *(_QWORD *)(*v3 + 24);
  v27 = v3;
  if (v13 > v12 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_1A9CB59D8();
  }
  else
  {
    if (v13 > v12)
    {
      sub_1A9CB65A8();
      goto LABEL_12;
    }
    sub_1A9CB6D24();
  }
  v14 = *v3;
  sub_1A9B92B9C(&qword_1EEB47C48, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D0]);
  v15 = sub_1A9CE8244();
  v16 = -1 << *(_BYTE *)(v14 + 32);
  a2 = v15 & ~v16;
  if (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v17 = ~v16;
    v18 = *(_QWORD *)(v7 + 72);
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v19(v11, *(_QWORD *)(v14 + 48) + v18 * a2, v6);
      sub_1A9B92B9C(&qword_1EEB47C50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D8]);
      v20 = sub_1A9CE82A4();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
      if ((v20 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v17;
    }
    while (((*(_QWORD *)(v14 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v21 = v28;
  v22 = *v27;
  *(_QWORD *)(*v27 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, __n128))(v7 + 32))(*(_QWORD *)(v22 + 48) + *(_QWORD *)(v7 + 72) * a2, v21, v6, v9);
  v24 = *(_QWORD *)(v22 + 16);
  v25 = __OFADD__(v24, 1);
  v26 = v24 + 1;
  if (!v25)
  {
    *(_QWORD *)(v22 + 16) = v26;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_1A9CE8BD4();
  __break(1u);
  return result;
}

void *sub_1A9CB6248()
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
  sub_1A9CB7258();
  v2 = *v0;
  v3 = sub_1A9CE8988();
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

void *sub_1A9CB63F4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;

  v1 = v0;
  sub_1A9C4C164(0, &qword_1EEB49CB8, (uint64_t (*)(uint64_t))type metadata accessor for HKCategoryValueSleepAnalysis, &qword_1EEB47BD8, (uint64_t)&unk_1A9CECBE4);
  v2 = *v0;
  v3 = sub_1A9CE8988();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_25:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v6 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v8 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v9 = 1 << *(_BYTE *)(v2 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(v2 + 56);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v8 << 6);
      goto LABEL_9;
    }
    v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v12)
      goto LABEL_25;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v8;
    if (!v16)
    {
      v8 = v15 + 1;
      if (v15 + 1 >= v12)
        goto LABEL_25;
      v16 = *(_QWORD *)(v6 + 8 * v8);
      if (!v16)
      {
        v8 = v15 + 2;
        if (v15 + 2 >= v12)
          goto LABEL_25;
        v16 = *(_QWORD *)(v6 + 8 * v8);
        if (!v16)
          break;
      }
    }
LABEL_24:
    v11 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_9:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v14) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
  }
  v17 = v15 + 3;
  if (v17 >= v12)
    goto LABEL_25;
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v8 = v17;
    goto LABEL_24;
  }
  while (1)
  {
    v8 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v8 >= v12)
      goto LABEL_25;
    v16 = *(_QWORD *)(v6 + 8 * v8);
    ++v17;
    if (v16)
      goto LABEL_24;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1A9CB65A8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  uint64_t v12;
  unint64_t v13;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = sub_1A9CE642C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9C4C164(0, &qword_1EEB47C40, v7, &qword_1EEB47C48, MEMORY[0x1E0CB11D0]);
  v8 = *v0;
  v9 = sub_1A9CE8988();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v10;
    return result;
  }
  v27 = v1;
  result = (void *)(v9 + 56);
  v12 = v8 + 56;
  v13 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 56 + 8 * v13)
    result = memmove(result, (const void *)(v8 + 56), 8 * v13);
  v15 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v16 = 1 << *(_BYTE *)(v8 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & *(_QWORD *)(v8 + 56);
  v19 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      v20 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v21 = v20 | (v15 << 6);
      goto LABEL_12;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v23 >= v19)
      goto LABEL_28;
    v24 = *(_QWORD *)(v12 + 8 * v23);
    ++v15;
    if (!v24)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v19)
        goto LABEL_28;
      v24 = *(_QWORD *)(v12 + 8 * v15);
      if (!v24)
      {
        v15 = v23 + 2;
        if (v23 + 2 >= v19)
          goto LABEL_28;
        v24 = *(_QWORD *)(v12 + 8 * v15);
        if (!v24)
          break;
      }
    }
LABEL_27:
    v18 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_12:
    v22 = *(_QWORD *)(v3 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(_QWORD *)(v8 + 48) + v22, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v22, v6, v2);
  }
  v25 = v23 + 3;
  if (v25 >= v19)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v27;
    goto LABEL_30;
  }
  v24 = *(_QWORD *)(v12 + 8 * v25);
  if (v24)
  {
    v15 = v25;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v15 >= v19)
      goto LABEL_28;
    v24 = *(_QWORD *)(v12 + 8 * v15);
    ++v25;
    if (v24)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1A9CB67E8()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  sub_1A9CB7258();
  v3 = sub_1A9CE8994();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
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
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1A9CE8C4C();
    swift_bridgeObjectRetain();
    sub_1A9CE831C();
    result = sub_1A9CE8C7C();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1A9CB6A90()
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

  v1 = v0;
  v2 = *v0;
  sub_1A9C4C164(0, &qword_1EEB49CB8, (uint64_t (*)(uint64_t))type metadata accessor for HKCategoryValueSleepAnalysis, &qword_1EEB47BD8, (uint64_t)&unk_1A9CECBE4);
  result = sub_1A9CE8994();
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
    sub_1A9CE8C4C();
    sub_1A9CE8C58();
    result = sub_1A9CE8C7C();
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

uint64_t sub_1A9CB6D24()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
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
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;

  v1 = v0;
  v2 = sub_1A9CE642C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v0;
  sub_1A9C4C164(0, &qword_1EEB47C40, v8, &qword_1EEB47C48, MEMORY[0x1E0CB11D0]);
  v9 = sub_1A9CE8994();
  v10 = v9;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v10;
    return result;
  }
  v11 = 1 << *(_BYTE *)(v7 + 32);
  v12 = *(_QWORD *)(v7 + 56);
  v33 = v0;
  v34 = v7 + 56;
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v35 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 56;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }
    v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v21 >= v35)
      goto LABEL_33;
    v22 = *(_QWORD *)(v34 + 8 * v21);
    ++v17;
    if (!v22)
    {
      v17 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v22 = *(_QWORD *)(v34 + 8 * v17);
      if (!v22)
      {
        v17 = v21 + 2;
        if (v21 + 2 >= v35)
          goto LABEL_33;
        v22 = *(_QWORD *)(v34 + 8 * v17);
        if (!v22)
          break;
      }
    }
LABEL_23:
    v14 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_24:
    v24 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(_QWORD *)(v7 + 48) + v24 * v20, v2);
    sub_1A9B92B9C(&qword_1EEB47C48, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D0]);
    result = sub_1A9CE8244();
    v25 = -1 << *(_BYTE *)(v10 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v15 + 8 * (v26 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v15 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v15 + 8 * v27);
      }
      while (v31 == -1);
      v18 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v18 * v24, v6, v2);
    ++*(_QWORD *)(v10 + 16);
  }
  v23 = v21 + 3;
  if (v23 >= v35)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v33;
    goto LABEL_35;
  }
  v22 = *(_QWORD *)(v34 + 8 * v23);
  if (v22)
  {
    v17 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v17 >= v35)
      goto LABEL_33;
    v22 = *(_QWORD *)(v34 + 8 * v17);
    ++v23;
    if (v22)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t _s10Foundation14DateComponentsV13SleepHealthUIE08calendarC0ShyAA8CalendarV9ComponentOGvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);
  uint64_t v7;

  sub_1A9B92F34(0, &qword_1EEB47BF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v0 = sub_1A9CE642C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1A9CF6560;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E0CB1138], v0);
  v6(v5 + v2, *MEMORY[0x1E0CB1158], v0);
  v6(v5 + 2 * v2, *MEMORY[0x1E0CB1160], v0);
  v6(v5 + 3 * v2, *MEMORY[0x1E0CB1130], v0);
  v6(v5 + 4 * v2, *MEMORY[0x1E0CB1140], v0);
  v6(v5 + 5 * v2, *MEMORY[0x1E0CB1178], v0);
  v6(v5 + 6 * v2, *MEMORY[0x1E0CB1188], v0);
  v6(v5 + 7 * v2, *MEMORY[0x1E0CB11A0], v0);
  v6(v5 + 8 * v2, *MEMORY[0x1E0CB11A8], v0);
  v7 = sub_1A9C4B104(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v7;
}

uint64_t dispatch thunk of HourAndMinuteProviding.hourAndMinute.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1A9CB7258()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB49CC0)
  {
    v0 = sub_1A9CE89AC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB49CC0);
  }
}

id LocationModel.__allocating_init(debugIdentifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return LocationModel.init(debugIdentifier:)(a1, a2);
}

uint64_t sub_1A9CB72F4()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1A9CE6E64();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1A9CB7364()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1A9CE6E70();
}

void (*sub_1A9CB73CC(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1A9CE6E58();
  return sub_1A9BAFE14;
}

uint64_t sub_1A9CB7444()
{
  swift_beginAccess();
  sub_1A9B92F34(0, &qword_1EEB45298, (uint64_t (*)(uint64_t))sub_1A9CB7984, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  sub_1A9CE6E40();
  return swift_endAccess();
}

uint64_t sub_1A9CB74BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t, double);
  uint64_t v15;

  sub_1A9B92F34(0, &qword_1EEB49CF0, (uint64_t (*)(uint64_t))sub_1A9CB7984, MEMORY[0x1E0C96180]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8, v9);
  v12 = (char *)&v15 - v11;
  v13 = *(void (**)(char *, uint64_t, uint64_t, double))(v4 + 16);
  v13((char *)&v15 - v11, a1, v3, v10);
  ((void (*)(char *, char *, uint64_t))v13)(v7, v12, v3);
  swift_beginAccess();
  sub_1A9B92F34(0, &qword_1EEB45298, (uint64_t (*)(uint64_t))sub_1A9CB7984, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  sub_1A9CE6E4C();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v12, v3);
}

uint64_t sub_1A9CB75F8()
{
  swift_beginAccess();
  sub_1A9B92F34(0, &qword_1EEB45298, (uint64_t (*)(uint64_t))sub_1A9CB7984, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  sub_1A9CE6E40();
  return swift_endAccess();
}

uint64_t sub_1A9CB766C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v9;

  sub_1A9B92F34(0, &qword_1EEB49CF0, (uint64_t (*)(uint64_t))sub_1A9CB7984, MEMORY[0x1E0C96180]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  v6 = MEMORY[0x1E0C80A78](v2, v5);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v4 + 16))((char *)&v9 - v7, a1, v3, v6);
  swift_beginAccess();
  sub_1A9B92F34(0, &qword_1EEB45298, (uint64_t (*)(uint64_t))sub_1A9CB7984, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  sub_1A9CE6E4C();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
}

void (*sub_1A9CB7764(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  sub_1A9B92F34(0, &qword_1EEB49CF0, (uint64_t (*)(uint64_t))sub_1A9CB7984, MEMORY[0x1E0C96180]);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel__currentLocation;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  sub_1A9B92F34(0, &qword_1EEB45298, (uint64_t (*)(uint64_t))sub_1A9CB7984, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  v3[16] = v9;
  sub_1A9CE6E40();
  swift_endAccess();
  return sub_1A9BB02B4;
}

id LocationModel.init(debugIdentifier:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  objc_class *v14;
  uint64_t v16;
  objc_super v17;
  uint64_t v18;

  sub_1A9B92F34(0, &qword_1EEB45298, (uint64_t (*)(uint64_t))sub_1A9CB7984, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v8);
  v10 = (char *)&v16 - v9;
  *(_QWORD *)&v2[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager] = 0;
  v11 = &v2[OBJC_IVAR____TtC13SleepHealthUI13LocationModel__currentLocation];
  v18 = 0;
  sub_1A9CB7984();
  v12 = v2;
  sub_1A9CE6E34();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v11, v10, v6);
  *(_QWORD *)&v12[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion] = 0;
  v12[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization] = 0;
  v13 = &v12[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_debugIdentifier];
  *(_QWORD *)v13 = a1;
  *((_QWORD *)v13 + 1) = a2;

  v14 = (objc_class *)type metadata accessor for LocationModel();
  v17.receiver = v12;
  v17.super_class = v14;
  return objc_msgSendSuper2(&v17, sel_init);
}

void sub_1A9CB7984()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB49CE0)
  {
    sub_1A9B94A18(255, &qword_1EEB45278);
    v0 = sub_1A9CE8880();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB49CE0);
  }
}

uint64_t type metadata accessor for LocationModel()
{
  uint64_t result;

  result = qword_1EEB49D40;
  if (!qword_1EEB49D40)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1A9CB7A24()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  unint64_t v8;
  void *v9;
  id v10;
  char *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v1 = v0;
  swift_getObjectType();
  v2 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager])
  {
    if (qword_1EEB42E60 != -1)
      swift_once();
    v3 = sub_1A9CE6990();
    __swift_project_value_buffer(v3, (uint64_t)qword_1EEB49410);
    v4 = v0;
    v5 = sub_1A9CE6978();
    v6 = sub_1A9CE867C();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v24 = v21;
      *(_DWORD *)v7 = 136446210;
      v22 = sub_1A9CE8D48();
      v23 = v8;
      sub_1A9CE8340();
      swift_bridgeObjectRetain();
      sub_1A9CE8340();
      swift_bridgeObjectRelease();
      sub_1A9B91D6C(v22, v23, &v24);
      sub_1A9CE888C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v5, v6, "[%{public}s] starting", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v21, -1, -1);
      MEMORY[0x1AF420344](v7, -1, -1);

    }
    else
    {

    }
    sub_1A9B94A18(0, (unint64_t *)&qword_1ED2625C0);
    v9 = (void *)sub_1A9CE870C();
    v10 = objc_allocWithZone(MEMORY[0x1E0C9E3C8]);
    v11 = v4;
    v12 = (void *)sub_1A9CE82B0();
    v13 = objc_msgSend(v10, sel_initWithEffectiveBundleIdentifier_delegate_onQueue_, v12, v11, v9);

    v14 = *(void **)&v1[v2];
    *(_QWORD *)&v1[v2] = v13;

    v15 = *(void **)&v1[v2];
    if (v15)
      objc_msgSend(v15, sel_setDesiredAccuracy_, *MEMORY[0x1E0C9E4B8]);
    v16 = (void *)objc_opt_self();
    v17 = (void *)sub_1A9CE82B0();
    v18 = (void *)sub_1A9CE82B0();
    v19 = objc_msgSend(v16, sel_newAssertionForBundleIdentifier_withReason_, v17, v18);

    v20 = *(void **)&v11[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion];
    *(_QWORD *)&v11[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion] = v19;

  }
}

void sub_1A9CB7D68()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v1 = v0;
  swift_getObjectType();
  v2 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager])
  {
    if (qword_1EEB42E60 != -1)
      swift_once();
    v3 = sub_1A9CE6990();
    __swift_project_value_buffer(v3, (uint64_t)qword_1EEB49410);
    v4 = v0;
    v5 = sub_1A9CE6978();
    v6 = sub_1A9CE867C();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v7 = 136446210;
      v14 = sub_1A9CE8D48();
      v15 = v8;
      sub_1A9CE8340();
      swift_bridgeObjectRetain();
      sub_1A9CE8340();
      swift_bridgeObjectRelease();
      sub_1A9B91D6C(v14, v15, &v16);
      sub_1A9CE888C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v5, v6, "[%{public}s] stopping", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v13, -1, -1);
      MEMORY[0x1AF420344](v7, -1, -1);

    }
    else
    {

    }
    v9 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion;
    v10 = *(void **)&v4[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion];
    if (v10)
    {
      objc_msgSend(v10, sel_invalidate);
      v11 = *(void **)&v4[v9];
    }
    else
    {
      v11 = 0;
    }
    *(_QWORD *)&v4[v9] = 0;

    v12 = *(void **)&v1[v2];
    *(_QWORD *)&v1[v2] = 0;

    v4[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization] = 0;
  }
}

void sub_1A9CB7FBC()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  swift_getObjectType();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1A9CE6E64();
  swift_release();
  swift_release();

  if (v9)
  {
    if (qword_1EEB42E60 != -1)
      swift_once();
    v1 = sub_1A9CE6990();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EEB49410);
    v2 = v0;
    v3 = sub_1A9CE6978();
    v4 = sub_1A9CE867C();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v12 = v6;
      *(_DWORD *)v5 = 136446210;
      v10 = sub_1A9CE8D48();
      v11 = v7;
      sub_1A9CE8340();
      swift_bridgeObjectRetain();
      sub_1A9CE8340();
      swift_bridgeObjectRelease();
      sub_1A9B91D6C(v10, v11, &v12);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1A9B87000, v3, v4, "[%{public}s] resetting location", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v6, -1, -1);
      MEMORY[0x1AF420344](v5, -1, -1);
    }
    else
    {

    }
    swift_getKeyPath();
    swift_getKeyPath();
    v8 = v2;
    sub_1A9CE6E70();
    v8[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization] = 0;
  }
}

id LocationModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void LocationModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id LocationModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LocationModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1A9CB8380@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for LocationModel();
  result = sub_1A9CE6D98();
  *a1 = result;
  return result;
}

void LocationModel.locationManager(_:didFailWithError:)(uint64_t a1, void *a2)
{
  sub_1A9CB9640(a2);
}

Swift::Void __swiftcall LocationModel.locationManager(_:didUpdateLocations:)(CLLocationManager _, Swift::OpaquePointer didUpdateLocations)
{
  sub_1A9CB98E0((unint64_t)_._internal);
}

Swift::Void __swiftcall LocationModel.locationManagerDidChangeAuthorization(_:)(CLLocationManager a1)
{
  void *v1;
  Class isa;
  unsigned int v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  unint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;

  isa = a1.super.isa;
  swift_getObjectType();
  v3 = -[objc_class authorizationStatus](isa, sel_authorizationStatus);
  if (qword_1EEB42E60 != -1)
    swift_once();
  v4 = sub_1A9CE6990();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EEB49410);
  v5 = v1;
  v6 = sub_1A9CE6978();
  v7 = sub_1A9CE867C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v49 = v9;
    *(_DWORD *)v8 = 136446466;
    v39 = sub_1A9CE8D48();
    v44 = v10;
    sub_1A9CE8340();
    swift_bridgeObjectRetain();
    sub_1A9CE8340();
    swift_bridgeObjectRelease();
    sub_1A9B91D6C(v39, v44, &v49);
    sub_1A9CE888C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    type metadata accessor for CLAuthorizationStatus(0);
    v11 = sub_1A9CE82F8();
    sub_1A9B91D6C(v11, v12, &v49);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v6, v7, "[%{public}s] status: %{public}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v9, -1, -1);
    MEMORY[0x1AF420344](v8, -1, -1);

  }
  else
  {

  }
  if (v3 - 1 < 2)
  {
    v19 = v5;
    v20 = sub_1A9CE6978();
    v21 = sub_1A9CE8664();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v49 = v23;
      *(_DWORD *)v22 = 136446210;
      v41 = sub_1A9CE8D48();
      v46 = v24;
      sub_1A9CE8340();
      swift_bridgeObjectRetain();
      sub_1A9CE8340();
      swift_bridgeObjectRelease();
      sub_1A9B91D6C(v41, v46, &v49);
      sub_1A9CE888C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v20, v21, "[%{public}s] doesn't have location permissions", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v23, -1, -1);
      MEMORY[0x1AF420344](v22, -1, -1);

    }
    else
    {

    }
  }
  else if (v3 - 3 >= 2)
  {
    if (!v3)
    {
      v25 = v5;
      v26 = sub_1A9CE6978();
      v27 = sub_1A9CE867C();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = swift_slowAlloc();
        v29 = swift_slowAlloc();
        v49 = v29;
        *(_DWORD *)v28 = 136446466;
        v42 = sub_1A9CE8D48();
        v47 = v30;
        sub_1A9CE8340();
        swift_bridgeObjectRetain();
        sub_1A9CE8340();
        swift_bridgeObjectRelease();
        sub_1A9B91D6C(v42, v47, &v49);
        sub_1A9CE888C();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 1024;

        sub_1A9CE888C();
        _os_log_impl(&dword_1A9B87000, v26, v27, "[%{public}s] has requested authorization? %{BOOL}d", (uint8_t *)v28, 0x12u);
        swift_arrayDestroy();
        MEMORY[0x1AF420344](v29, -1, -1);
        MEMORY[0x1AF420344](v28, -1, -1);

      }
      else
      {

      }
      v31 = OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization;
      if ((*((_BYTE *)v25 + OBJC_IVAR____TtC13SleepHealthUI13LocationModel_hasRequestedAuthorization) & 1) == 0)
      {
        v32 = (char *)v25;
        v33 = sub_1A9CE6978();
        v34 = sub_1A9CE867C();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = (uint8_t *)swift_slowAlloc();
          v38 = swift_slowAlloc();
          v49 = v38;
          *(_DWORD *)v35 = 136446210;
          v37 = v35 + 4;
          v43 = sub_1A9CE8D48();
          v48 = v36;
          sub_1A9CE8340();
          swift_bridgeObjectRetain();
          sub_1A9CE8340();
          swift_bridgeObjectRelease();
          sub_1A9B91D6C(v43, v48, &v49);
          sub_1A9CE888C();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1A9B87000, v33, v34, "[%{public}s] requesting when in use authorization...", v35, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1AF420344](v38, -1, -1);
          MEMORY[0x1AF420344](v35, -1, -1);

        }
        else
        {

        }
        objc_msgSend(*(id *)&v32[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager], sel_requestWhenInUseAuthorization, v37);
        *((_BYTE *)v25 + v31) = 1;
      }
    }
  }
  else
  {
    v13 = (char *)v5;
    v14 = sub_1A9CE6978();
    v15 = sub_1A9CE867C();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v49 = v17;
      *(_DWORD *)v16 = 136446210;
      v40 = sub_1A9CE8D48();
      v45 = v18;
      sub_1A9CE8340();
      swift_bridgeObjectRetain();
      sub_1A9CE8340();
      swift_bridgeObjectRelease();
      sub_1A9B91D6C(v40, v45, &v49);
      sub_1A9CE888C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v14, v15, "[%{public}s] requesting location once...", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v17, -1, -1);
      MEMORY[0x1AF420344](v16, -1, -1);

    }
    else
    {

    }
    objc_msgSend(*(id *)&v13[OBJC_IVAR____TtC13SleepHealthUI13LocationModel_locationManager], sel_requestLocation);
  }
}

uint64_t CLLocation.fetchSolarColors(completion:)(uint64_t a1, uint64_t a2)
{
  void *v2;
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
  char *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v24 = a1;
  v4 = sub_1A9CE8070();
  v27 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1A9CE8094();
  v25 = *(_QWORD *)(v8 - 8);
  v26 = v8;
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A9CE807C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B94A18(0, (unint64_t *)&qword_1ED2625C0);
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v16, *MEMORY[0x1E0DEF530], v12);
  v17 = (void *)sub_1A9CE8724();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  v18 = (_QWORD *)swift_allocObject();
  v19 = v24;
  v18[2] = v2;
  v18[3] = v19;
  v18[4] = a2;
  aBlock[4] = sub_1A9CB9C90;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A9C0A74C;
  aBlock[3] = &block_descriptor_35;
  v20 = _Block_copy(aBlock);
  v21 = v2;
  swift_retain();
  sub_1A9CE8088();
  v28 = MEMORY[0x1E0DEE9D8];
  sub_1A9C04D0C();
  sub_1A9B92F34(0, &qword_1EEB47E30, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A9C04D54();
  sub_1A9CE8904();
  MEMORY[0x1AF41F348](0, v11, v7, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v26);
  return swift_release();
}

uint64_t sub_1A9CB9020(void *a1, uint64_t a2, uint64_t a3)
{
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
  char *v25;
  id v26;
  uint64_t v27;
  void *v28;
  _QWORD *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD aBlock[6];

  v33 = a2;
  v5 = sub_1A9CE8070();
  v39 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1A9CE8094();
  v37 = *(_QWORD *)(v9 - 8);
  v38 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1A9CE6708();
  v35 = *(_QWORD *)(v13 - 8);
  v36 = v13;
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1A9CE62E8();
  v18 = *(_QWORD *)(v17 - 8);
  v34 = v17;
  MEMORY[0x1E0C80A78](v17, v19);
  v21 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22, v23);
  v25 = (char *)&v32 - v24;
  sub_1A9CE62DC();
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v25, v17);
  v26 = a1;
  sub_1A9CE66F0();
  v27 = sub_1A9CE66FC();
  sub_1A9B94A18(0, (unint64_t *)&qword_1ED2625C0);
  v28 = (void *)sub_1A9CE870C();
  v29 = (_QWORD *)swift_allocObject();
  v29[2] = v33;
  v29[3] = a3;
  v29[4] = v27;
  aBlock[4] = sub_1A9CB9F20;
  aBlock[5] = v29;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A9C0A74C;
  aBlock[3] = &block_descriptor_19_0;
  v30 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_1A9CE8088();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1A9C04D0C();
  sub_1A9B92F34(0, &qword_1EEB47E30, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A9C04D54();
  sub_1A9CE8904();
  MEMORY[0x1AF41F348](0, v12, v8, v30);
  _Block_release(v30);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v38);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v25, v34);
}

void CLLocation.fetchCity(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9E390]), sel_init);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v8[4] = sub_1A9CB9CD8;
  v8[5] = v6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1A9CB952C;
  v8[3] = &block_descriptor_8_0;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_reverseGeocodeLocation_completionHandler_, v2, v7);
  _Block_release(v7);

}

uint64_t sub_1A9CB93FC(unint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  if (!a1)
    return a3(0, 0, a2);
  v5 = a1 & 0xFFFFFFFFFFFFFF8;
  if (!(a1 >> 62))
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_4;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  result = sub_1A9CE8AC0();
  v6 = result;
  if (!result)
    goto LABEL_12;
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v8 = (id)MEMORY[0x1AF41F600](0, a1);
    goto LABEL_7;
  }
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = *(id *)(a1 + 32);
LABEL_7:
    v9 = v8;
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v9, sel_locality);

    if (v10)
    {
      v6 = sub_1A9CE82E0();
      v12 = v11;

LABEL_14:
      a3(v6, v12, 0);
      return swift_bridgeObjectRelease();
    }
    v6 = 0;
LABEL_13:
    v12 = 0;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A9CB952C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_1A9B94A18(0, &qword_1EEB49DB8);
    v4 = sub_1A9CE83DC();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

double static LinearGradient.fullScreenGradient(from:)@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  sub_1A9CE8040();
  sub_1A9CE804C();
  v2 = swift_bridgeObjectRetain();
  MEMORY[0x1AF41EBEC](v2);
  sub_1A9CE70D4();
  result = *(double *)&v4;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  return result;
}

void sub_1A9CB9640(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *oslog;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  swift_getObjectType();
  if (qword_1EEB42E60 != -1)
    swift_once();
  v3 = sub_1A9CE6990();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EEB49410);
  v4 = v1;
  v5 = a1;
  v6 = v4;
  v7 = a1;
  oslog = sub_1A9CE6978();
  v8 = sub_1A9CE8664();
  if (os_log_type_enabled(oslog, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v18 = v10;
    *(_DWORD *)v9 = 136446466;
    v16 = sub_1A9CE8D48();
    v17 = v11;
    sub_1A9CE8340();
    swift_bridgeObjectRetain();
    sub_1A9CE8340();
    swift_bridgeObjectRelease();
    sub_1A9B91D6C(v16, v17, &v18);
    sub_1A9CE888C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    v12 = a1;
    sub_1A9BB15F4();
    v13 = sub_1A9CE82F8();
    sub_1A9B91D6C(v13, v14, &v18);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1A9B87000, oslog, v8, "[%{public}s] error fetching current location: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v10, -1, -1);
    MEMORY[0x1AF420344](v9, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1A9CB98E0(unint64_t a1)
{
  void *v1;
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  id v7;
  char *v8;
  id v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  swift_getObjectType();
  if (!(a1 >> 62))
  {
    v3 = *(char **)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v3 = (char *)sub_1A9CE8AC0();
  if (!v3)
    return swift_bridgeObjectRelease();
LABEL_3:
  v4 = v3 - 1;
  if (__OFSUB__(v3, 1))
  {
    __break(1u);
  }
  else if ((a1 & 0xC000000000000001) == 0)
  {
    if (((unint64_t)v4 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if ((unint64_t)v4 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v5 = (char *)*(id *)(a1 + 8 * (_QWORD)v4 + 32);
      goto LABEL_8;
    }
    __break(1u);
    goto LABEL_19;
  }
  v5 = (char *)MEMORY[0x1AF41F600](v4, a1);
LABEL_8:
  v3 = v5;
  swift_bridgeObjectRelease();
  if (qword_1EEB42E60 != -1)
LABEL_19:
    swift_once();
  v6 = sub_1A9CE6990();
  __swift_project_value_buffer(v6, (uint64_t)qword_1EEB49410);
  v7 = v1;
  v8 = v3;
  v9 = v7;
  v10 = v8;
  v11 = sub_1A9CE6978();
  v12 = sub_1A9CE867C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v25 = v22;
    *(_DWORD *)v13 = 136446467;
    v23 = sub_1A9CE8D48();
    v24 = v14;
    sub_1A9CE8340();
    swift_bridgeObjectRetain();
    sub_1A9CE8340();
    swift_bridgeObjectRelease();
    sub_1A9B91D6C(v23, v24, &v25);
    sub_1A9CE888C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2081;
    v15 = v10;
    v16 = objc_msgSend(v15, sel_description);
    v17 = sub_1A9CE82E0();
    v19 = v18;

    sub_1A9B91D6C(v17, v19, &v25);
    sub_1A9CE888C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v11, v12, "[%{public}s] fetched current location: %{private}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v22, -1, -1);
    MEMORY[0x1AF420344](v13, -1, -1);

  }
  else
  {

  }
  swift_getKeyPath();
  swift_getKeyPath();
  v20 = v9;
  return sub_1A9CE6E70();
}

uint64_t sub_1A9CB9C64()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CB9C90()
{
  uint64_t v0;

  return sub_1A9CB9020(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t block_copy_helper_35(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_35()
{
  return swift_release();
}

uint64_t sub_1A9CB9CB4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CB9CD8(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A9CB93FC(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_1A9CB9CF0()
{
  return type metadata accessor for LocationModel();
}

void sub_1A9CB9CF8()
{
  unint64_t v0;

  sub_1A9B92F34(319, &qword_1EEB45298, (uint64_t (*)(uint64_t))sub_1A9CB7984, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for LocationModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LocationModel.currentLocation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of LocationModel.currentLocation.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of LocationModel.currentLocation.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of LocationModel.$currentLocation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of LocationModel.$currentLocation.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of LocationModel.$currentLocation.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of LocationModel.__allocating_init(debugIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of LocationModel.startIfNeeded()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))();
}

uint64_t dispatch thunk of LocationModel.stopIfNeeded()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x108))();
}

uint64_t dispatch thunk of LocationModel.resetLocationIfNeeded()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))();
}

unint64_t sub_1A9CB9EB0()
{
  unint64_t result;

  result = qword_1EEB49DB0;
  if (!qword_1EEB49DB0)
  {
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD93B0], MEMORY[0x1E0CD93C0]);
    atomic_store(result, (unint64_t *)&qword_1EEB49DB0);
  }
  return result;
}

uint64_t sub_1A9CB9EF4()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A9CB9F20()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v0 + 32));
}

id sub_1A9CB9F58()
{
  id result;
  void *v1;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  if (result)
  {
    v1 = result;
    sub_1A9CBA040();
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A9CED850;
    *(_QWORD *)(inited + 32) = 5;
    *(_QWORD *)(inited + 40) = 0x4036000000000000;
    *(_QWORD *)(inited + 48) = 6;
    *(_QWORD *)(inited + 56) = 0x4036000000000000;
    *(_QWORD *)(inited + 64) = 8;
    *(_QWORD *)(inited + 72) = 0x4036000000000000;
    sub_1A9BAE840(inited);
    swift_setDeallocating();
    sub_1A9CE8868();
    v4 = v3;

    result = (id)swift_bridgeObjectRelease();
    qword_1EEB57648 = v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A9CBA024()
{
  uint64_t result;

  result = sub_1A9CE7C68();
  qword_1EEB57650 = result;
  return result;
}

void sub_1A9CBA040()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB49DD0)
  {
    sub_1A9CBA094();
    v0 = sub_1A9CE8B80();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB49DD0);
  }
}

void sub_1A9CBA094()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EEB49DD8)
  {
    type metadata accessor for CLKDeviceSizeClass(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EEB49DD8);
  }
}

char *sub_1A9CBA0F8(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_1A9CBA128(a1);
}

char *sub_1A9CBA128(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *v17;

  v2 = v1;
  if (qword_1ED2626A8 != -1)
    swift_once();
  v4 = (id)qword_1ED264F90;
  v5 = (void *)sub_1A9CE82B0();
  v6 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v5, v4);

  type metadata accessor for ConfirmationOnboardingSection();
  swift_allocObject();
  v7 = swift_retain();
  v8 = sub_1A9BC4370(v7);
  if (qword_1EEB42F08 != -1)
    swift_once();
  v9 = qword_1EEB49DE0;
  v10 = *(_QWORD *)algn_1EEB49DE8;
  v11 = (void *)qword_1ED264F90;
  swift_bridgeObjectRetain();
  v12 = v11;
  v13 = sub_1A9CE6168();
  v15 = v14;

  v16 = (void *)objc_opt_self();
  swift_retain();
  v17 = sub_1A9CC7CD4(v9, v10, v13, v15, a1, 0, v8, v6, 2, 0, objc_msgSend(v16, sel_systemBackgroundColor, 0xE000000000000000), v2);
  swift_release();
  return v17;
}

void sub_1A9CBA330()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = v0;
  v9.super_class = (Class)type metadata accessor for SleepOnboardingConfirmationViewController();
  objc_msgSendSuper2(&v9, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_tableView);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  v2 = v1;
  objc_msgSend(v1, sel_setAllowsSelection_, 0);

  v3 = objc_msgSend(v0, sel_tableView);
  if (!v3)
  {
LABEL_7:
    __break(1u);
    return;
  }
  v4 = v3;
  objc_msgSend(v3, sel_setSeparatorInset_, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  v5 = qword_1ED2626A8;
  v6 = v0;
  if (v5 != -1)
    swift_once();
  v7 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v8 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();

}

void sub_1A9CBA4EC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t ObjectType;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21[3];
  uint64_t v22;

  swift_getObjectType();
  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate);
  swift_beginAccess();
  if (*v1)
  {
    v2 = v1[1];
    v3 = qword_1EEB42E98;
    swift_unknownObjectRetain();
    if (v3 != -1)
      swift_once();
    v4 = sub_1A9CE6990();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EEB49488);
    v5 = sub_1A9CE6978();
    v6 = sub_1A9CE867C();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v21[0] = v8;
      *(_DWORD *)v7 = 136446210;
      v9 = sub_1A9CE8D48();
      v22 = sub_1A9B91D6C(v9, v10, v21);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v5, v6, "[%{public}s] we're done!", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v8, -1, -1);
      MEMORY[0x1AF420344](v7, -1, -1);
    }

    sub_1A9C78920(6, 2);
    ObjectType = swift_getObjectType();
    swift_beginAccess();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    v13 = swift_retain();
    v12(v13, ObjectType, v2);
    swift_unknownObjectRelease();
    swift_release();
  }
  else
  {
    if (qword_1ED262DB8 != -1)
      swift_once();
    v14 = sub_1A9CE6990();
    __swift_project_value_buffer(v14, (uint64_t)qword_1ED2630B8);
    v15 = sub_1A9CE6978();
    v16 = sub_1A9CE8670();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v21[0] = v18;
      *(_DWORD *)v17 = 136446210;
      v19 = sub_1A9CE8D48();
      v22 = sub_1A9B91D6C(v19, v20, v21);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v15, v16, "[%{public}s] No delegate found while attemping to complete onboarding", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v18, -1, -1);
      MEMORY[0x1AF420344](v17, -1, -1);
    }

  }
}

id sub_1A9CBA94C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepOnboardingConfirmationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SleepOnboardingConfirmationViewController()
{
  return objc_opt_self();
}

void sub_1A9CBA99C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v0 = (id)qword_1ED264F90;
  v1 = sub_1A9CE6168();
  v3 = v2;

  qword_1EEB49DE0 = v1;
  *(_QWORD *)algn_1EEB49DE8 = v3;
}

uint64_t sub_1A9CBAA50()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1A9CBAA74()
{
  sub_1A9C78920(6, 1);
}

uint64_t block_copy_helper_36(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_36()
{
  return swift_release();
}

_QWORD *HealthStatusFeatureProvider.__allocating_init(healthStore:)(void *a1)
{
  _QWORD *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (_QWORD *)swift_allocObject();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6730]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x1E0CB50A8], a1);
  v4 = sub_1A9C224D4();
  v5 = MEMORY[0x1E0D2C1E8];
  v2[5] = v4;
  v2[6] = v5;
  v2[2] = v3;
  sub_1A9CE66E4();
  v6 = sub_1A9CE66D8();

  v2[7] = v6;
  return v2;
}

_QWORD *HealthStatusFeatureProvider.init(healthStore:)(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB6730]), sel_initWithFeatureIdentifier_healthStore_, *MEMORY[0x1E0CB50A8], a1);
  v5 = sub_1A9C224D4();
  v6 = MEMORY[0x1E0D2C1E8];
  v2[5] = v5;
  v2[6] = v6;
  v2[2] = v4;
  sub_1A9CE66E4();
  v7 = sub_1A9CE66D8();

  v2[7] = v7;
  return v2;
}

id sub_1A9CBABE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v9;

  v1 = sub_1A9CE6930();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  sub_1A9CE6948();
  v6 = (void *)sub_1A9CE693C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  v7 = objc_msgSend(v6, sel_areAllRequirementsSatisfied);

  return v7;
}

uint64_t sub_1A9CBAEA4()
{
  return sub_1A9CE66C0() & 1;
}

uint64_t sub_1A9CBAEC8()
{
  return sub_1A9CE66CC();
}

uint64_t (*sub_1A9CBAEEC(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 56);
  *(_BYTE *)(a1 + 8) = sub_1A9CE66C0() & 1;
  return sub_1A9CBAF28;
}

uint64_t sub_1A9CBAF28()
{
  return sub_1A9CE66CC();
}

uint64_t HealthStatusFeatureProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  return v0;
}

uint64_t HealthStatusFeatureProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

unint64_t sub_1A9CBAF9C()
{
  return (unint64_t)sub_1A9CBABE4() & 1;
}

uint64_t sub_1A9CBAFC0()
{
  return sub_1A9CE66C0() & 1;
}

uint64_t sub_1A9CBAFE8()
{
  return sub_1A9CE66CC();
}

uint64_t (*sub_1A9CBB010(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_BYTE *)(a1 + 8) = sub_1A9CE66C0() & 1;
  return sub_1A9CBAF28;
}

uint64_t sub_1A9CBB050@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A9CE66C0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A9CBB080()
{
  return sub_1A9CE66CC();
}

uint64_t dispatch thunk of HealthStatusFeatureProviding.isHealthStatusSupported.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of HealthStatusFeatureProviding.healthStatusFeaturesEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of HealthStatusFeatureProviding.healthStatusFeaturesEnabled.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of HealthStatusFeatureProviding.healthStatusFeaturesEnabled.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t type metadata accessor for HealthStatusFeatureProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for HealthStatusFeatureProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.__allocating_init(healthStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.isHealthStatusSupported.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.healthStatusFeaturesEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.healthStatusFeaturesEnabled.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of HealthStatusFeatureProvider.healthStatusFeaturesEnabled.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

double static Double.defaultWindDown.getter()
{
  return *MEMORY[0x1E0DA84A8] * 60.0;
}

double static Double.windDownMinutesStep.getter()
{
  return *MEMORY[0x1E0DA84C8] * 60.0;
}

double static Double.windDownMinutesMinimum.getter()
{
  return *MEMORY[0x1E0DA84B8] * 60.0;
}

double static Double.windDownMinutesMaximum.getter()
{
  return *MEMORY[0x1E0DA84B0] * 60.0;
}

uint64_t static Double.sleepDurationGoalOptions.getter()
{
  double v0;
  uint64_t result;

  v0 = *MEMORY[0x1E0DA8380] * 60.0 * 60.0;
  if (v0 != 0.0)
    return sub_1A9CBB580(*MEMORY[0x1E0DA8378] * 60.0 * 60.0, *MEMORY[0x1E0DA8370] * 60.0 * 60.0, v0);
  __break(1u);
  return result;
}

void static Double.windDownOptions(for:duringOnboarding:)(void *a1, char a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = *MEMORY[0x1E0DA84B8];
  v4 = *MEMORY[0x1E0DA84C0];
  sub_1A9CBB880(a1);
  v6 = v5;
  v7 = *MEMORY[0x1E0DA84C8] * 60.0;
  if (v7 == 0.0)
  {
    __break(1u);
  }
  else
  {
    if ((a2 & 1) != 0)
      v8 = v4;
    else
      v8 = v3;
    sub_1A9CBB30C(v8 * 60.0, v6, v7);
  }
}

double static Double.defaultSleepDurationGoal.getter()
{
  return *MEMORY[0x1E0DA8368] * 60.0 * 60.0;
}

double static Double.windDownMinutesOnboardingMinimum.getter()
{
  return *MEMORY[0x1E0DA84C0] * 60.0;
}

double static Double.sleepDurationGoalMinimum.getter()
{
  return *MEMORY[0x1E0DA8378] * 60.0 * 60.0;
}

double static Double.sleepDurationGoalMaximum.getter()
{
  return *MEMORY[0x1E0DA8370] * 60.0 * 60.0;
}

double static Double.sleepDurationGoalStep.getter()
{
  return *MEMORY[0x1E0DA8380] * 60.0 * 60.0;
}

void sub_1A9CBB30C(double a1, double a2, double a3)
{
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  BOOL v10;
  double *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  double v20;
  BOOL v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  double *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  BOOL v32;
  BOOL v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;

  v6 = a1 <= a2;
  if (a3 > 0.0)
    v6 = a1 >= a2;
  if (!v6)
  {
    v7 = -1;
    do
    {
      v8 = ++v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
        goto LABEL_48;
      }
      v9 = a1 + (double)v8 * a3;
      v10 = v9 <= a2;
      if (a3 > 0.0)
        v10 = v9 >= a2;
    }
    while (!v10);
    if (v8 <= 0)
      goto LABEL_18;
    sub_1A9CBBA8C();
    v11 = (double *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 25;
    v14 = v13 >> 3;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v14;
    v15 = v11 + 4;
    v16 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v8;
    v17 = -1;
    v18 = a1;
    while (1)
    {
      v19 = v18 <= a2;
      if (a3 > 0.0)
        v19 = v18 >= a2;
      if (v19)
        goto LABEL_50;
      v20 = a1 + (double)(v17 + 2) * a3;
      *v15++ = v18;
      ++v17;
      v18 = v20;
      if (v7 == v17)
        goto LABEL_19;
    }
  }
LABEL_18:
  v8 = 0;
  v11 = (double *)MEMORY[0x1E0DEE9D8];
  v15 = (double *)(MEMORY[0x1E0DEE9D8] + 32);
  v16 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 24) >> 1;
  v20 = a1;
LABEL_19:
  v21 = v20 <= a2;
  if (a3 > 0.0)
    v21 = v20 >= a2;
  if (!v21)
  {
    while (!__OFADD__(v8, 1))
    {
      if (!v16)
      {
        v22 = *((_QWORD *)v11 + 3);
        if ((uint64_t)((v22 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_51;
        v23 = v22 & 0xFFFFFFFFFFFFFFFELL;
        if (v23 <= 1)
          v24 = 1;
        else
          v24 = v23;
        sub_1A9CBBA8C();
        v25 = (double *)swift_allocObject();
        v26 = _swift_stdlib_malloc_size(v25);
        v27 = v26 - 32;
        if (v26 < 32)
          v27 = v26 - 25;
        v28 = v27 >> 3;
        *((_QWORD *)v25 + 2) = v24;
        *((_QWORD *)v25 + 3) = 2 * (v27 >> 3);
        v29 = (unint64_t)(v25 + 4);
        v30 = *((_QWORD *)v11 + 3) >> 1;
        if (*((_QWORD *)v11 + 2))
        {
          if (v25 != v11 || v29 >= (unint64_t)&v11[v30 + 4])
            memmove(v25 + 4, v11 + 4, 8 * v30);
          v11[2] = 0.0;
        }
        v15 = (double *)(v29 + 8 * v30);
        v16 = (v28 & 0x7FFFFFFFFFFFFFFFLL) - v30;
        swift_release();
        v11 = v25;
      }
      v32 = __OFSUB__(v16--, 1);
      if (v32)
        goto LABEL_49;
      *v15++ = v20;
      v20 = a1 + (double)(v8 + 1) * a3;
      v33 = v20 <= a2;
      if (a3 > 0.0)
        v33 = v20 >= a2;
      ++v8;
      if (v33)
        goto LABEL_43;
    }
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
LABEL_43:
  v34 = *((_QWORD *)v11 + 3);
  if (v34 >= 2)
  {
    v35 = v34 >> 1;
    v32 = __OFSUB__(v35, v16);
    v36 = v35 - v16;
    if (v32)
    {
LABEL_52:
      __break(1u);
      return;
    }
    *((_QWORD *)v11 + 2) = v36;
  }
}

uint64_t sub_1A9CBB580(double a1, double a2, double a3)
{
  uint64_t result;
  uint64_t v7;
  double *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  double i;
  BOOL v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;
  double v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  double *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  const void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  result = sub_1A9CBB80C(a1, a2, a3);
  v7 = result;
  if (result > 0)
  {
    sub_1A9CBBA8C();
    v8 = (double *)swift_allocObject();
    result = _swift_stdlib_malloc_size(v8);
    v9 = 0;
    v10 = 0;
    v11 = result - 32;
    if (result < 32)
      v11 = result - 25;
    v12 = v11 >> 3;
    *((_QWORD *)v8 + 2) = v7;
    *((_QWORD *)v8 + 3) = 2 * v12;
    v13 = v8 + 4;
    v14 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - v7;
    i = a1;
    while (v7)
    {
      v17 = i;
      v18 = i <= a2;
      if (a3 > 0.0)
        v18 = i >= a2;
      if (v18)
      {
        if (v9 & 1 | (i != a2))
          goto LABEL_47;
        v9 = 1;
      }
      else
      {
        v16 = __OFADD__(v10++, 1);
        if (v16)
          goto LABEL_46;
        i = a1 + (double)v10 * a3;
      }
      *v13++ = v17;
      if (!--v7)
        goto LABEL_16;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (result < 0)
  {
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    return result;
  }
  v9 = 0;
  v10 = 0;
  v8 = (double *)MEMORY[0x1E0DEE9D8];
  v14 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 24) >> 1;
  v13 = (double *)(MEMORY[0x1E0DEE9D8] + 32);
  for (i = a1; ; i = v20)
  {
LABEL_16:
    v19 = i <= a2;
    if (a3 > 0.0)
      v19 = i >= a2;
    if (!v19)
    {
      v16 = __OFADD__(v10++, 1);
      if (v16)
        goto LABEL_43;
      v20 = a1 + (double)v10 * a3;
      if (v14)
        goto LABEL_36;
      goto LABEL_24;
    }
    if ((i != a2) | v9 & 1)
      break;
    v9 = 1;
    v20 = i;
    if (v14)
    {
      v20 = i;
      goto LABEL_36;
    }
LABEL_24:
    v21 = *((_QWORD *)v8 + 3);
    if ((uint64_t)((v21 >> 1) + 0x4000000000000000) < 0)
      goto LABEL_44;
    v22 = v21 & 0xFFFFFFFFFFFFFFFELL;
    if (v22 <= 1)
      v23 = 1;
    else
      v23 = v22;
    sub_1A9CBBA8C();
    v24 = (double *)swift_allocObject();
    v25 = _swift_stdlib_malloc_size(v24);
    v26 = v25 - 32;
    if (v25 < 32)
      v26 = v25 - 25;
    v27 = v26 >> 3;
    *((_QWORD *)v24 + 2) = v23;
    *((_QWORD *)v24 + 3) = 2 * (v26 >> 3);
    v28 = (unint64_t)(v24 + 4);
    v29 = *((_QWORD *)v8 + 3) >> 1;
    if (*((_QWORD *)v8 + 2))
    {
      v30 = v8 + 4;
      if (v24 != v8 || v28 >= (unint64_t)v30 + 8 * v29)
        memmove(v24 + 4, v30, 8 * v29);
      v8[2] = 0.0;
    }
    v13 = (double *)(v28 + 8 * v29);
    v14 = (v27 & 0x7FFFFFFFFFFFFFFFLL) - v29;
    result = swift_release();
    v8 = v24;
LABEL_36:
    v16 = __OFSUB__(v14--, 1);
    if (v16)
    {
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    *v13++ = i;
  }
  v31 = *((_QWORD *)v8 + 3);
  if (v31 >= 2)
  {
    v32 = v31 >> 1;
    v16 = __OFSUB__(v32, v14);
    v33 = v32 - v14;
    if (v16)
      goto LABEL_49;
    *((_QWORD *)v8 + 2) = v33;
  }
  return (uint64_t)v8;
}

uint64_t sub_1A9CBB80C(double a1, double a2, double a3)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  double v6;
  BOOL v7;
  _BOOL4 v8;

  result = 0;
  v4 = 0;
  v5 = 0;
  v6 = a1;
  do
  {
    v8 = v6 <= a2;
    if (a3 > 0.0)
      v8 = v6 >= a2;
    if (v8)
    {
      if ((v6 != a2) | v4 & 1)
        return result;
      v4 = 1;
    }
    else
    {
      v7 = __OFADD__(v5++, 1);
      if (v7)
        goto LABEL_12;
      v6 = a1 + (double)v5 * a3;
    }
    v7 = __OFADD__(result++, 1);
  }
  while (!v7);
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

void sub_1A9CBB880(void *a1)
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = objc_msgSend(a1, sel_occurrences);
  sub_1A9C977A0();
  v3 = sub_1A9CE83DC();

  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    v8 = MEMORY[0x1E0DEE9D8];
    if ((MEMORY[0x1E0DEE9D8] & 0x8000000000000000) != 0)
      goto LABEL_21;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v4 = sub_1A9CE8AC0();
  swift_bridgeObjectRelease();
  if (!v4)
    goto LABEL_15;
LABEL_3:
  if (v4 < 1)
  {
    __break(1u);
    return;
  }
  for (i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x1AF41F600](i, v3);
    else
      v6 = *(id *)(v3 + 8 * i + 32);
    v7 = v6;
    if ((objc_msgSend(v6, sel_isSingleDayOverride) & 1) != 0)
    {

    }
    else
    {
      sub_1A9CE89F4();
      sub_1A9CE8A24();
      sub_1A9CE8A30();
      sub_1A9CE8A00();
    }
  }
  swift_bridgeObjectRelease();
  v8 = v10;
  if (v10 < 0)
    goto LABEL_21;
LABEL_16:
  if ((v8 & 0x4000000000000000) == 0)
  {
    v9 = *(_QWORD *)(v8 + 16);
    goto LABEL_18;
  }
LABEL_21:
  swift_bridgeObjectRetain();
  v9 = sub_1A9CE8AC0();
  swift_release();
LABEL_18:
  swift_release();
  if (v9)
    objc_msgSend(a1, sel_maximumAllowableWindDown);
}

void sub_1A9CBBA8C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED2634A8)
  {
    v0 = sub_1A9CE8B80();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED2634A8);
  }
}

void ScheduledDaysState.init(schedule:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;

  if (!objc_msgSend(a1, sel_weekdaysWithOccurrences))
  {
    v4 = 1;
LABEL_6:
    v5 = 1;
    goto LABEL_7;
  }
  if (!objc_msgSend(a1, sel_weekdaysWithoutOccurrences))
  {
    v4 = 0;
    goto LABEL_6;
  }
  v4 = (uint64_t)objc_msgSend(a1, sel_weekdaysWithOccurrences);
  v5 = 0;
LABEL_7:

  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
}

uint64_t ScheduledDaysState.localizedDetail.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  if (*(_BYTE *)(v0 + 8) == 1 && !*(_QWORD *)v0)
    return 0;
  if (qword_1ED2626A8 != -1)
    swift_once();
  v1 = (id)qword_1ED264F90;
  v2 = sub_1A9CE6168();

  return v2;
}

uint64_t ScheduledDaysState.localizedPrompt.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  if (*(_BYTE *)(v0 + 8) == 1)
  {
    if (*(_QWORD *)v0)
    {
      if (qword_1ED2626A8 != -1)
        swift_once();
    }
    else if (qword_1ED2626A8 != -1)
    {
      swift_once();
    }
  }
  else if (qword_1ED2626A8 != -1)
  {
    swift_once();
  }
  v1 = (id)qword_1ED264F90;
  v2 = sub_1A9CE6168();

  return v2;
}

uint64_t static ScheduledDaysState.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *(unsigned __int8 *)(a2 + 8);
  v3 = (*(_QWORD *)a1 == *(_QWORD *)a2) & ~v2;
  if (*(_QWORD *)a2)
    v4 = *(unsigned __int8 *)(a2 + 8);
  else
    v4 = 0;
  if (*(_QWORD *)a2)
    v2 = 0;
  if (*(_QWORD *)a1)
    v5 = v4;
  else
    v5 = v2;
  if (*(_BYTE *)(a1 + 8) == 1)
    return v5;
  else
    return v3;
}

uint64_t sub_1A9CBBDD0(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;

  v2 = *(unsigned __int8 *)(a2 + 8);
  v3 = (*(_QWORD *)a1 == *(_QWORD *)a2) & ~v2;
  if (*(_QWORD *)a2)
    v4 = *(unsigned __int8 *)(a2 + 8);
  else
    v4 = 0;
  if (*(_QWORD *)a2)
    v2 = 0;
  if (*(_QWORD *)a1)
    v5 = v4;
  else
    v5 = v2;
  if (*(_BYTE *)(a1 + 8) == 1)
    return v5;
  else
    return v3;
}

uint64_t ScheduledDaysState.localizedTitle.getter()
{
  uint64_t v0;
  id v1;
  uint64_t v2;

  if (*(_BYTE *)(v0 + 8) != 1)
  {
    if (qword_1ED2626A8 == -1)
      goto LABEL_6;
LABEL_9:
    swift_once();
    goto LABEL_6;
  }
  if (!*(_QWORD *)v0)
    return 0;
  if (qword_1ED2626A8 != -1)
    goto LABEL_9;
LABEL_6:
  v1 = (id)qword_1ED264F90;
  v2 = sub_1A9CE6168();

  return v2;
}

id ScheduledDaysState.unscheduledDaysFooter.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  id result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;

  if (*(_BYTE *)(v0 + 8) == 1)
  {
    if (!*(_QWORD *)v0)
      return 0;
    if (qword_1ED2626A8 == -1)
      goto LABEL_16;
    goto LABEL_19;
  }
  if (!HKSPWeekdaysIsSingleDay())
    goto LABEL_15;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  objc_msgSend(v2, sel_setFormattingContext_, 5);
  v3 = HKSPDayForWeekdays();
  result = objc_msgSend(v2, sel_standaloneWeekdaySymbols);
  if (result)
  {
    v5 = result;
    v6 = MEMORY[0x1E0DEA968];
    v7 = sub_1A9CE83DC();

    v8 = NSGregorianCalendarDayForHKSPDay();
    if (v8)
    {
      v9 = v8 - 1;
      if (__OFSUB__(v8, 1))
      {
        __break(1u);
      }
      else if ((v9 & 0x8000000000000000) == 0)
      {
        if (v9 < *(_QWORD *)(v7 + 16))
        {
          v10 = v7 + 16 * v9;
          v1 = *(_QWORD *)(v10 + 32);
          v3 = *(_QWORD *)(v10 + 40);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          if (qword_1ED2626A8 == -1)
          {
LABEL_12:
            v11 = (id)qword_1ED264F90;
            sub_1A9CE6168();

            sub_1A9BDD380();
            v12 = swift_allocObject();
            *(_OWORD *)(v12 + 16) = xmmword_1A9CEB520;
            *(_QWORD *)(v12 + 56) = v6;
            *(_QWORD *)(v12 + 64) = sub_1A9BDD3E4();
            *(_QWORD *)(v12 + 32) = v1;
            *(_QWORD *)(v12 + 40) = v3;
            sub_1A9CE82BC();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v13 = (void *)sub_1A9CE82B0();
            swift_bridgeObjectRelease();
            v14 = objc_msgSend(v13, sel_hk_localizedFirstWordCapitalizedString, 0xE000000000000000);

            v15 = sub_1A9CE82E0();
LABEL_17:

            return (id)v15;
          }
LABEL_24:
          swift_once();
          goto LABEL_12;
        }
LABEL_23:
        __break(1u);
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_23;
    }

    swift_bridgeObjectRelease();
LABEL_15:
    if (qword_1ED2626A8 == -1)
    {
LABEL_16:
      v14 = (id)qword_1ED264F90;
      v15 = sub_1A9CE6168();
      goto LABEL_17;
    }
LABEL_19:
    swift_once();
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for ScheduledDaysState(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ScheduledDaysState(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_1A9CBC2C4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1A9CBC2E0(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduledDaysState()
{
  return &type metadata for ScheduledDaysState;
}

void BSDayPeriod.simplified.getter(uint64_t a1@<X0>, char *a2@<X8>)
{
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = 0;
  switch(a1)
  {
    case 0:
    case 1:
      goto LABEL_9;
    case 2:
    case 3:
    case 8:
      v3 = 1;
      goto LABEL_9;
    case 4:
    case 5:
    case 6:
    case 7:
    case 9:
      v3 = 2;
      goto LABEL_9;
    case 10:
      if (qword_1ED2628A0 != -1)
        swift_once();
      v4 = sub_1A9CE6990();
      __swift_project_value_buffer(v4, (uint64_t)qword_1ED262888);
      v5 = sub_1A9CE6978();
      v6 = sub_1A9CE8664();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        v8 = swift_slowAlloc();
        v9 = v8;
        *(_DWORD *)v7 = 136446210;
        sub_1A9B91D6C(0x7265507961445342, 0xEB00000000646F69, &v9);
        sub_1A9CE888C();
        _os_log_impl(&dword_1A9B87000, v5, v6, "[%{public}s] unknown period, using fallback", v7, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AF420344](v8, -1, -1);
        MEMORY[0x1AF420344](v7, -1, -1);
      }

      v3 = 0;
LABEL_9:
      *a2 = v3;
      break;
    default:
      sub_1A9CE8A84();
      __break(1u);
      break;
  }
}

BOOL static BSDayPeriod.Simplified.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t BSDayPeriod.greeting.getter(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  sub_1A9CBC680(&v4, a1);
  if (qword_1ED2626A8 != -1)
    swift_once();
  v1 = (id)qword_1ED264F90;
  v2 = sub_1A9CE6168();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t BSDayPeriod.GreetingOptions.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t BSDayPeriod.GreetingOptions.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static BSDayPeriod.GreetingOptions.headingWithName.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t BSDayPeriod.Simplified.hash(into:)()
{
  return sub_1A9CE8C58();
}

uint64_t BSDayPeriod.Simplified.hashValue.getter()
{
  sub_1A9CE8C4C();
  sub_1A9CE8C58();
  return sub_1A9CE8C7C();
}

uint64_t sub_1A9CBC680(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD v12[2];

  result = 0xD000000000000011;
  v4 = *a1;
  v5 = 0x80000001A9CFF8A0;
  switch(a2)
  {
    case 0:
      goto LABEL_13;
    case 1:
      v6 = "MORNING2_GREETING";
      goto LABEL_9;
    case 2:
      result = 0xD000000000000013;
      v6 = "AFTERNOON1_GREETING";
      goto LABEL_9;
    case 3:
      result = 0xD000000000000013;
      v6 = "AFTERNOON2_GREETING";
      goto LABEL_9;
    case 4:
      v6 = "EVENING1_GREETING";
      goto LABEL_9;
    case 5:
      v6 = "EVENING2_GREETING";
      goto LABEL_9;
    case 6:
      v7 = 0x31544847494ELL;
      goto LABEL_12;
    case 7:
      v7 = 0x32544847494ELL;
LABEL_12:
      result = v7 & 0xFFFFFFFFFFFFLL | 0x475F000000000000;
      v5 = 0xEF474E4954454552;
LABEL_13:
      if ((v4 & 1) != 0)
        goto LABEL_14;
      return result;
    case 8:
      v5 = 0xED0000474E495445;
      result = 0x4552475F4E4F4F4ELL;
      if ((v4 & 1) != 0)
        goto LABEL_14;
      return result;
    case 9:
      v6 = "MIDNIGHT_GREETING";
LABEL_9:
      v5 = (unint64_t)(v6 - 32) | 0x8000000000000000;
      if ((v4 & 1) != 0)
      {
LABEL_14:
        v12[0] = result;
        v12[1] = v5;
        swift_bridgeObjectRetain();
        sub_1A9CE8340();
        swift_bridgeObjectRelease();
        result = v12[0];
      }
      break;
    case 10:
      if (qword_1ED2628A0 != -1)
        swift_once();
      v8 = sub_1A9CE6990();
      __swift_project_value_buffer(v8, (uint64_t)qword_1ED262888);
      v9 = sub_1A9CE6978();
      v10 = sub_1A9CE8664();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A9B87000, v9, v10, "[BSDayPeriod] unknown period, using fallback", v11, 2u);
        MEMORY[0x1AF420344](v11, -1, -1);
      }

      v12[0] = v4;
      result = sub_1A9CBC680(v12, 1);
      break;
    default:
      result = sub_1A9CE8A84();
      __break(1u);
      break;
  }
  return result;
}

Swift::String __swiftcall BSDayPeriod.namedGreeting(name:)(Swift::String name)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  Swift::String result;
  uint64_t v12;

  object = name._object;
  countAndFlagsBits = name._countAndFlagsBits;
  v12 = 1;
  sub_1A9CBC680(&v12, v1);
  if (qword_1ED2626A8 != -1)
    swift_once();
  v4 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A9BDD380();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A9CEB520;
  *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v5 + 64) = sub_1A9BDD3E4();
  *(_QWORD *)(v5 + 32) = countAndFlagsBits;
  *(_QWORD *)(v5 + 40) = object;
  swift_bridgeObjectRetain();
  v6 = sub_1A9CE82BC();
  v8 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v9 = v6;
  v10 = v8;
  result._object = v10;
  result._countAndFlagsBits = v9;
  return result;
}

unint64_t sub_1A9CBCA3C()
{
  unint64_t result;

  result = qword_1EEB49EE0;
  if (!qword_1EEB49EE0)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for BSDayPeriod.GreetingOptions, &type metadata for BSDayPeriod.GreetingOptions);
    atomic_store(result, (unint64_t *)&qword_1EEB49EE0);
  }
  return result;
}

unint64_t sub_1A9CBCA84()
{
  unint64_t result;

  result = qword_1EEB49EE8;
  if (!qword_1EEB49EE8)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for BSDayPeriod.GreetingOptions, &type metadata for BSDayPeriod.GreetingOptions);
    atomic_store(result, (unint64_t *)&qword_1EEB49EE8);
  }
  return result;
}

unint64_t sub_1A9CBCACC()
{
  unint64_t result;

  result = qword_1EEB49EF0;
  if (!qword_1EEB49EF0)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for BSDayPeriod.GreetingOptions, &type metadata for BSDayPeriod.GreetingOptions);
    atomic_store(result, (unint64_t *)&qword_1EEB49EF0);
  }
  return result;
}

unint64_t sub_1A9CBCB14()
{
  unint64_t result;

  result = qword_1EEB49EF8;
  if (!qword_1EEB49EF8)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for BSDayPeriod.GreetingOptions, &type metadata for BSDayPeriod.GreetingOptions);
    atomic_store(result, (unint64_t *)&qword_1EEB49EF8);
  }
  return result;
}

unint64_t sub_1A9CBCB5C()
{
  unint64_t result;

  result = qword_1EEB49F00;
  if (!qword_1EEB49F00)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for BSDayPeriod.Simplified, &type metadata for BSDayPeriod.Simplified);
    atomic_store(result, (unint64_t *)&qword_1EEB49F00);
  }
  return result;
}

ValueMetadata *type metadata accessor for BSDayPeriod.GreetingOptions()
{
  return &type metadata for BSDayPeriod.GreetingOptions;
}

uint64_t _s10SimplifiedOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A9CBCBFC + 4 * byte_1A9CF67BB[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A9CBCC30 + 4 * byte_1A9CF67B6[v4]))();
}

uint64_t sub_1A9CBCC30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9CBCC38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A9CBCC40);
  return result;
}

uint64_t sub_1A9CBCC4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A9CBCC54);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A9CBCC58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9CBCC60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BSDayPeriod.Simplified()
{
  return &type metadata for BSDayPeriod.Simplified;
}

id HKFeatureAvailabilityProviding.isFeatureOnboarded.getter(uint64_t a1)
{
  return sub_1A9CBCD14(a1, (SEL *)&selRef_isCurrentOnboardingVersionCompletedWithError_);
}

id HKFeatureAvailabilityProviding.pairedWatchSupportsSleep.getter(uint64_t a1)
{
  return sub_1A9CBCD14(a1, (SEL *)&selRef_isFeatureCapabilitySupportedOnActivePairedDeviceWithError_);
}

id sub_1A9CBCD14(uint64_t a1, SEL *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v3 = objc_msgSend(v2, *a2, v10);
  if (v3)
  {
    v4 = v3;
    v5 = v10[0];
    v6 = objc_msgSend(v4, sel_BOOLValue);

  }
  else
  {
    v7 = v10[0];
    v8 = (void *)sub_1A9CE61E0();

    swift_willThrow();
    return 0;
  }
  return v6;
}

id sub_1A9CBCDE0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for BriefOneHourIsSixtyMinDateComponentsFormatter()), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1A9CBCE50()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t v11;

  v1 = v0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_durationLabel);
  sub_1A9CBCF78();
  v4 = v3;
  objc_msgSend(v2, sel_setAttributedText_, v3);

  v5 = v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_delegate;
  if (MEMORY[0x1AF4203E0](v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_delegate))
  {
    v6 = *(_QWORD *)(v5 + 8);
    v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex);
    v8 = 0.0;
    if ((v7 & 0x8000000000000000) == 0)
    {
      v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_options);
      if (v7 < *(_QWORD *)(v9 + 16))
        v8 = *(double *)(v9 + 8 * v7 + 32);
    }
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, double))(v6 + 8))(ObjectType, v6, v8);
    swift_unknownObjectRelease();
  }
  v11 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex;
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_minusButton), sel_setEnabled_, *(_QWORD *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex) != 0);
  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_plusButton), sel_setEnabled_, *(_QWORD *)(v1 + v11) != *(_QWORD *)(*(_QWORD *)(v1+ OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_options)+ 16)- 1);
}

void sub_1A9CBCF78()
{
  id v0;
  uint64_t inited;
  void **v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  Class v17;
  id v18;
  Class isa;
  UIFontDescriptor v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  id v32;
  unint64_t v33;

  v0 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E0DC4B58]);
  sub_1A9CBD568(0, &qword_1EEB49F40, &qword_1EEB43F08, type metadata accessor for TraitKey);
  inited = swift_initStackObject();
  v2 = (void **)MEMORY[0x1E0DC1458];
  *(_OWORD *)(inited + 16) = xmmword_1A9CEB520;
  v3 = *v2;
  *(_QWORD *)(inited + 32) = *v2;
  v4 = *MEMORY[0x1E0DC1448];
  type metadata accessor for Weight(0);
  *(_QWORD *)(inited + 64) = v5;
  *(_QWORD *)(inited + 40) = v4;
  v6 = v0;
  v7 = v3;
  v8 = sub_1A9BACA68(inited);
  sub_1A9CBD568(0, &qword_1EEB47F58, (unint64_t *)&qword_1EEB47F60, type metadata accessor for AttributeName);
  v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_1A9CEB520;
  v10 = (void *)*MEMORY[0x1E0DC13C0];
  *(_QWORD *)(v9 + 32) = *MEMORY[0x1E0DC13C0];
  sub_1A9CBD5BC();
  *(_QWORD *)(v9 + 64) = v11;
  *(_QWORD *)(v9 + 40) = v8;
  v12 = v10;
  sub_1A9BAC500(v9);
  type metadata accessor for AttributeName(0);
  sub_1A9B92B9C((unint64_t *)&unk_1EEB47F80, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1A9CEC2A0);
  v13 = (void *)sub_1A9CE8208();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v6, sel_fontDescriptorByAddingAttributes_, v13);

  v15 = objc_msgSend(v14, sel_fontDescriptorWithDesign_, *MEMORY[0x1E0DC13A8]);
  if (v15)
  {

    v16 = (void *)objc_opt_self();
    v17 = (Class)v15;
    v18 = objc_msgSend(v16, sel_fontWithDescriptor_size_, v17, 42.0);
    if ((sub_1A9CE80B8() & 1) != 0)
    {
      isa = UIFontDescriptor.addingLowercaseSmallCapsAttributes()().super.isa;
      v20.super.isa = UIFontDescriptor.addingUppercaseSmallCapsAttributes()().super.isa;

      v17 = isa;
    }
    else
    {
      v20.super.isa = v17;
    }

    v21 = objc_msgSend(v16, sel_fontWithDescriptor_size_, v20.super.isa, 42.0);
    v22 = sub_1A9CBD640();
    if (v23)
    {
      v24 = v22;
      v25 = v23;
      sub_1A9CBD568(0, (unint64_t *)&qword_1EEB477F8, (unint64_t *)&qword_1EEB47800, type metadata accessor for Key);
      v26 = swift_initStackObject();
      *(_OWORD *)(v26 + 16) = xmmword_1A9CEB520;
      v27 = (void *)*MEMORY[0x1E0DC1138];
      *(_QWORD *)(v26 + 32) = *MEMORY[0x1E0DC1138];
      v28 = sub_1A9B94A18(0, (unint64_t *)&qword_1EEB45220);
      *(_QWORD *)(v26 + 64) = v28;
      *(_QWORD *)(v26 + 40) = v21;
      v29 = v27;
      v30 = sub_1A9BACA44(v26);
      v31 = swift_initStackObject();
      *(_OWORD *)(v31 + 16) = xmmword_1A9CEB520;
      *(_QWORD *)(v31 + 64) = v28;
      *(_QWORD *)(v31 + 32) = v29;
      *(_QWORD *)(v31 + 40) = v18;
      v32 = v29;
      v33 = sub_1A9BACA44(v31);
      sub_1A9B94A18(0, (unint64_t *)&unk_1EEB459F0);
      MEMORY[0x1AF41F36C](v24, v25, v33, v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

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

id sub_1A9CBD3F0()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  id result;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex);
  if (v1 != *(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_options) + 16) - 1)
  {
    v2 = __OFADD__(v1, 1);
    v3 = v1 + 1;
    if (v2)
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex) = v3;
      return sub_1A9CBCE50();
    }
  }
  return result;
}

id sub_1A9CBD4A0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TimeDurationPicker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TimeDurationPicker()
{
  return objc_opt_self();
}

void sub_1A9CBD568(uint64_t a1, unint64_t *a2, unint64_t *a3, void (*a4)(uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    sub_1A9BAFA50(255, a3, a4);
    v5 = sub_1A9CE8B80();
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_1A9CBD5BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB49F48)
  {
    type metadata accessor for TraitKey(255);
    sub_1A9B92B9C(&qword_1EEB434E8, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_1A9CEC25C);
    v0 = sub_1A9CE8220();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB49F48);
  }
}

uint64_t sub_1A9CBD640()
{
  uint64_t v0;
  id v1;
  void *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  v1 = sub_1A9CBCDE0();
  v2 = v1;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_selectedIndex);
  v4 = 0.0;
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_options);
    if (v3 < *(_QWORD *)(v5 + 16))
      v4 = *(double *)(v5 + 8 * v3 + 32);
  }
  v6 = objc_msgSend(v1, sel_stringFromTimeInterval_, v4);

  if (!v6)
    return 0;
  v7 = sub_1A9CE82E0();

  return v7;
}

void sub_1A9CBD6E8()
{
  char *v0;
  char *v1;
  objc_class *v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  char *v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;
  __int16 v26;
  objc_super v27;

  v1 = v0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker____lazy_storage___formatter] = 0;
  v2 = (objc_class *)type metadata accessor for PlusMinusButton();
  v3 = (char *)objc_allocWithZone(v2);
  *(_WORD *)&v3[OBJC_IVAR____TtC13SleepHealthUI15PlusMinusButton_type] = 24577;
  v27.receiver = v3;
  v27.super_class = v2;
  v4 = objc_msgSendSuper2(&v27, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1A9B94A18(0, (unint64_t *)&qword_1EEB45220);
  v5 = *MEMORY[0x1E0DC4B50];
  v6 = *MEMORY[0x1E0DC1448];
  v7 = (char *)v4;
  v24 = v6;
  v8 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(v5, 0, 1, 0, 0, 0, 0, v6, 0);
  sub_1A9B94A18(0, &qword_1EEB49F50);
  v26 = *(_WORD *)&v7[OBJC_IVAR____TtC13SleepHealthUI15PlusMinusButton_type];
  Symbol.systemName.getter();
  v9 = (id)*MEMORY[0x1E0DC4A88];
  v10 = (id)sub_1A9CE87FC();
  swift_bridgeObjectRelease();

  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_configurationWithFont_scale_, v8, 3);
  if (v10)
  {
    v13 = v10;
    v10 = objc_msgSend(v13, sel_imageWithConfiguration_, v12);

    v12 = v13;
  }

  v14 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_plusButton;
  objc_msgSend(v7, sel_setImage_forState_, v10, 0);

  *(_QWORD *)&v1[v14] = v7;
  v15 = (char *)objc_allocWithZone(v2);
  *(_WORD *)&v15[OBJC_IVAR____TtC13SleepHealthUI15PlusMinusButton_type] = 20481;
  v25.receiver = v15;
  v25.super_class = v2;
  v16 = (char *)objc_msgSendSuper2(&v25, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v17 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(v5, 0, 1, 0, 0, 0, 0, v24, 0);
  v26 = *(_WORD *)&v16[OBJC_IVAR____TtC13SleepHealthUI15PlusMinusButton_type];
  Symbol.systemName.getter();
  v18 = v9;
  v19 = (id)sub_1A9CE87FC();
  swift_bridgeObjectRelease();

  v20 = objc_msgSend(v11, sel_configurationWithFont_scale_, v17, 3);
  if (v19)
  {
    v21 = v19;
    v19 = objc_msgSend(v21, sel_imageWithConfiguration_, v20);

    v20 = v21;
  }

  v22 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_minusButton;
  objc_msgSend(v16, sel_setImage_forState_, v19, 0);

  *(_QWORD *)&v1[v22] = v16;
  v23 = OBJC_IVAR____TtC13SleepHealthUI18TimeDurationPicker_durationLabel;
  *(_QWORD *)&v1[v23] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);

  sub_1A9CE8A84();
  __break(1u);
}

uint64_t sub_1A9CBDAC4(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  double v17;
  char *v18;
  objc_class *v19;
  id v20;
  char *v21;
  char *v22;
  void *v23;
  char *v24;
  id v25;
  void *v26;
  uint64_t result;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t isEscapingClosureAtFileLocation;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  BOOL v39;
  char *v40;
  uint64_t v41;
  char *v42;
  id v43;
  _QWORD aBlock[5];
  char *v45;
  objc_super v46;

  v7 = (char *)sub_1A9CE6444();
  v8 = (char *)*((_QWORD *)v7 - 1);
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9BE9F04(0);
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_alertPresenter + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days] = MEMORY[0x1E0DEE9D8];
  v16 = &v3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  *(_QWORD *)v16 = a1;
  *((_QWORD *)v16 + 1) = a2;
  *((_QWORD *)v16 + 2) = a3;
  v17 = 22.0;
  if (!a2)
    v17 = 15.0;
  v18 = &v3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration];
  *(_OWORD *)v18 = xmmword_1A9CF6A30;
  *((double *)v18 + 2) = v17;
  *(_OWORD *)(v18 + 24) = xmmword_1A9CF6A40;
  v19 = (objc_class *)type metadata accessor for SleepScheduleDayPicker();
  v46.receiver = v3;
  v46.super_class = v19;
  v20 = a1;
  v21 = (char *)objc_msgSendSuper2(&v46, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v22 = &v21[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  swift_beginAccess();
  v23 = *(void **)v22;
  v24 = v21;
  v25 = objc_msgSend(v23, sel_calendar);
  if (!v25)
  {
LABEL_18:
    result = (*((uint64_t (**)(char *, uint64_t, uint64_t, char *))v8 + 7))(v15, 1, 1, v7);
    goto LABEL_19;
  }
  v26 = v25;
  sub_1A9CE63D8();

  (*((void (**)(char *, char *, char *))v8 + 4))(v15, v11, v7);
  (*((void (**)(char *, _QWORD, uint64_t, char *))v8 + 7))(v15, 0, 1, v7);
  result = (*((uint64_t (**)(char *, uint64_t, char *))v8 + 6))(v15, 1, v7);
  if ((_DWORD)result != 1)
  {
    v28 = (void *)sub_1A9CE63CC();
    (*((void (**)(char *, char *))v8 + 1))(v15, v7);
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = v24;
    v15 = (char *)swift_allocObject();
    *((_QWORD *)v15 + 2) = sub_1A9CBF86C;
    *((_QWORD *)v15 + 3) = v29;
    aBlock[4] = sub_1A9C717C4;
    v45 = v15;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A9CBEBD4;
    aBlock[3] = &block_descriptor_37;
    v30 = _Block_copy(aBlock);
    v8 = v45;
    v7 = v24;
    swift_retain();
    swift_release();
    HKSPEnumerateDaysOfWeekInCalendar();
    _Block_release(v30);

    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v43 = v20;
      sub_1A9CBDF50();
      objc_msgSend(v7, sel_setLayoutMargins_, *(double *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration], *(double *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration + 8], *(double *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration + 16], *(double *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration + 24]);
      v32 = (uint64_t *)&v7[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
      swift_beginAccess();
      isEscapingClosureAtFileLocation = *v32;
      v33 = (unint64_t)*v32 >> 62;
      v42 = v7;
      if (!v33)
      {
        v34 = *(_QWORD *)((isEscapingClosureAtFileLocation & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v34)
        {
LABEL_8:
          if (v34 >= 1)
          {
            v35 = 0;
            do
            {
              if ((isEscapingClosureAtFileLocation & 0xC000000000000001) != 0)
                v36 = (_BYTE *)MEMORY[0x1AF41F600](v35, isEscapingClosureAtFileLocation);
              else
                v36 = *(id *)(isEscapingClosureAtFileLocation + 8 * v35 + 32);
              v37 = v36;
              ++v35;
              objc_msgSend(v36, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((_QWORD *)v22 + 2)) == 0);
              v38 = *((_QWORD *)v22 + 1);
              v39 = (HKSPWeekdaysFromDay() & ~v38) == 0;
              v37[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v39;
              sub_1A9BEBD24();

            }
            while (v34 != v35);
            goto LABEL_16;
          }
          __break(1u);
          goto LABEL_18;
        }
LABEL_16:

        swift_bridgeObjectRelease();
        v40 = v42;

        return (uint64_t)v40;
      }
    }
    swift_bridgeObjectRetain();
    v34 = sub_1A9CE8AC0();
    if (v34)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_19:
  __break(1u);
  return result;
}

void sub_1A9CBDF50()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  double v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  double *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  id v42;
  unint64_t v43;

  v43 = MEMORY[0x1E0DEE9D8];
  v1 = objc_msgSend(v0, sel_layoutMarginsGuide);
  v42 = objc_msgSend(v1, sel_topAnchor);

  v2 = objc_msgSend(v0, sel_layoutMarginsGuide);
  v41 = objc_msgSend(v2, sel_bottomAnchor);

  v3 = objc_msgSend(v0, sel_layoutMarginsGuide);
  v4 = objc_msgSend(v3, sel_leadingAnchor);

  v5 = (id *)&v0[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
  swift_beginAccess();
  v6 = (unint64_t)*v5;
  if ((unint64_t)*v5 >> 62)
  {
LABEL_33:
    swift_bridgeObjectRetain();
    v7 = sub_1A9CE8AC0();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v36 = v0;
  if (v7)
  {
    if (v7 >= 1)
    {
      v8 = 0;
      v9 = 0;
      v37 = (double *)&v0[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration];
      v38 = v7;
      v39 = v6;
      v40 = v6 & 0xC000000000000001;
      v10 = v4;
      while (1)
      {
        if (v40)
          v12 = (id)MEMORY[0x1AF41F600](v9, v6);
        else
          v12 = *(id *)(v6 + 8 * v9 + 32);
        v4 = v12;
        objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
        v13 = objc_msgSend(v4, sel_leadingAnchor);
        v6 = (unint64_t)objc_msgSend(v13, sel_constraintEqualToAnchor_, v10);

        v14 = objc_msgSend(v4, sel_topAnchor);
        v15 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v42);

        v16 = objc_msgSend(v4, sel_bottomAnchor);
        v17 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v16);

        v0 = (char *)v43;
        if (v43 >> 62)
        {
          swift_bridgeObjectRetain();
          v30 = sub_1A9CE8AC0();
          swift_bridgeObjectRelease();
          v19 = v30 + 3;
          if (__OFADD__(v30, 3))
          {
LABEL_32:
            __break(1u);
            goto LABEL_33;
          }
        }
        else
        {
          v18 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
          v19 = v18 + 3;
          if (__OFADD__(v18, 3))
            goto LABEL_32;
        }
        sub_1A9CBF940(v19, 1);
        sub_1A9CE83E8();
        v20 = (id)v6;
        MEMORY[0x1AF41EFF4]();
        if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1A9CE83F4();
        sub_1A9CE8418();
        sub_1A9CE83E8();
        v21 = v15;
        MEMORY[0x1AF41EFF4]();
        if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1A9CE83F4();
        sub_1A9CE8418();
        sub_1A9CE83E8();
        v22 = v17;
        MEMORY[0x1AF41EFF4]();
        if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1A9CE83F4();
        sub_1A9CE8418();
        sub_1A9CE83E8();

        v23 = objc_msgSend(v4, sel_heightAnchor);
        v24 = objc_msgSend(v23, sel_constraintEqualToConstant_, v37[4]);

        LODWORD(v25) = 1144750080;
        objc_msgSend(v24, sel_setPriority_, v25);
        v26 = v24;
        MEMORY[0x1AF41EFF4]();
        if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1A9CE83F4();
        sub_1A9CE8418();
        sub_1A9CE83E8();
        if (v8)
        {
          v27 = v8;
          v28 = objc_msgSend(v4, sel_widthAnchor);
          v29 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v27);

          MEMORY[0x1AF41EFF4]();
          if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1A9CE83F4();
          sub_1A9CE8418();
          sub_1A9CE83E8();

        }
        else
        {
          v8 = objc_msgSend(v4, sel_widthAnchor);
        }
        ++v9;
        v11 = v4;
        v4 = objc_msgSend(v11, sel_trailingAnchor);

        v10 = v4;
        v6 = v39;
        if (v38 == v9)
          goto LABEL_29;
      }
    }
    __break(1u);
  }
  else
  {
    v8 = 0;
LABEL_29:
    swift_bridgeObjectRelease();
    v31 = objc_msgSend(v36, sel_layoutMarginsGuide);
    v32 = objc_msgSend(v31, sel_trailingAnchor);

    v33 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v4);
    MEMORY[0x1AF41EFF4]();
    if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1A9CE83F4();
    sub_1A9CE8418();
    sub_1A9CE83E8();
    v34 = (void *)objc_opt_self();
    sub_1A9B94A18(0, (unint64_t *)&qword_1EEB44570);
    v35 = (void *)sub_1A9CE83D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v34, sel_activateConstraints_, v35);

  }
}

id sub_1A9CBE748()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepScheduleDayPicker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SleepScheduleDayPicker()
{
  return objc_opt_self();
}

id sub_1A9CBE7E0(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  BOOL v14;
  double v15;
  char *v16;
  char *v17;

  v5 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  swift_beginAccess();
  *((_QWORD *)v5 + 1) = a1;
  *((_QWORD *)v5 + 2) = a2;
  v17 = v2;
  v6 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
  swift_beginAccess();
  v7 = *(_QWORD *)v6;
  if (*(_QWORD *)v6 >> 62)
  {
    swift_bridgeObjectRetain();
    result = (id)sub_1A9CE8AC0();
    v8 = (uint64_t)result;
    if (!result)
      goto LABEL_10;
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain();
    if (!v8)
      goto LABEL_10;
  }
  if (v8 < 1)
  {
    __break(1u);
    return result;
  }
  v10 = 0;
  do
  {
    if ((v7 & 0xC000000000000001) != 0)
      v11 = (_BYTE *)MEMORY[0x1AF41F600](v10, v7);
    else
      v11 = *(id *)(v7 + 8 * v10 + 32);
    v12 = v11;
    ++v10;
    objc_msgSend(v11, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((_QWORD *)v5 + 2)) == 0);
    v13 = *((_QWORD *)v5 + 1);
    v14 = (HKSPWeekdaysFromDay() & ~v13) == 0;
    v12[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v14;
    sub_1A9BEBD24();

  }
  while (v8 != v10);
LABEL_10:
  swift_bridgeObjectRelease();
  if (*((_QWORD *)v5 + 1))
    v15 = 22.0;
  else
    v15 = 15.0;
  v16 = &v17[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_configuration];
  *(_OWORD *)v16 = xmmword_1A9CF6A30;
  *((double *)v16 + 2) = v15;
  *(_OWORD *)(v16 + 24) = xmmword_1A9CF6A40;
  return objc_msgSend(v17, sel_setLayoutMargins_, 15.0, 10.0);
}

void sub_1A9CBE9BC(uint64_t a1, uint64_t a2, char *a3)
{
  void **v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char *v10;
  char *v11;
  char *v12;
  _QWORD v13[9];
  __int128 v14;

  v5 = (void **)&a3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  swift_beginAccess();
  v6 = *v5;
  v7 = (void *)objc_opt_self();
  v8 = v6;
  v13[0] = sub_1A9BEC768;
  v13[1] = 0;
  v13[2] = objc_msgSend(v7, sel_clearColor);
  v13[3] = objc_msgSend(v7, sel_labelColor);
  v13[4] = objc_msgSend(v7, sel_clearColor);
  v13[5] = objc_msgSend(v7, sel_labelColor);
  v13[6] = objc_msgSend(v7, sel_systemGray3Color);
  v13[7] = 0x4014000000000000;
  v13[8] = objc_msgSend(v7, sel_systemBackgroundColor);
  v14 = xmmword_1A9CF6A50;
  v9 = objc_allocWithZone((Class)type metadata accessor for SleepScheduleDayPickerDay());
  v10 = sub_1A9BEB078(a1, v8, (uint64_t)v13);
  objc_msgSend(v10, sel_addTarget_action_forControlEvents_, a3, sel_didTapDay_, 64);
  v11 = &a3[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
  swift_beginAccess();
  v12 = v10;
  MEMORY[0x1AF41EFF4]();
  if (*(_QWORD *)((*(_QWORD *)v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v11 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
    sub_1A9CE83F4();
  sub_1A9CE8418();
  sub_1A9CE83E8();
  swift_endAccess();
  objc_msgSend(a3, sel_addSubview_, v12);

}

uint64_t sub_1A9CBEBD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 32))(a2, a3);
}

void sub_1A9CBEBFC(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  _BYTE *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  char *v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  _BYTE *v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  id v45;
  uint64_t v46[3];

  v2 = v1;
  swift_getObjectType();
  if (qword_1ED262DB8 != -1)
    swift_once();
  v4 = sub_1A9CE6990();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED2630B8);
  v5 = a1;
  v6 = sub_1A9CE6978();
  v7 = sub_1A9CE8658();
  v45 = v2;
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v44 = swift_slowAlloc();
    v46[0] = v44;
    *(_DWORD *)v8 = 136446466;
    v9 = sub_1A9CE8D48();
    sub_1A9B91D6C(v9, v10, v46);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    HKSPWeekdaysFromDay();
    v11 = (id)NSStringFromHKSPWeekdays();
    v12 = sub_1A9CE82E0();
    v14 = v13;

    sub_1A9B91D6C(v12, v14, v46);
    sub_1A9CE888C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v6, v7, "[%{public}s] Did tap day: %{public}s", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v44, -1, -1);
    MEMORY[0x1AF420344](v8, -1, -1);

  }
  else
  {

  }
  v15 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
  swift_beginAccess();
  v16 = *((_QWORD *)v15 + 2);
  if ((HKSPWeekdaysFromDay() & ~v16) == 0)
  {
    v17 = *((_QWORD *)v15 + 2);
    if (v17 == HKSPWeekdaysFromDay())
      return;
    swift_beginAccess();
    v18 = HKSPWeekdaysFromDay();
    v19 = *((_QWORD *)v15 + 2);
    if ((v19 & v18) != 0)
      *((_QWORD *)v15 + 2) = v19 & ~v18;
    swift_endAccess();
    v20 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
    swift_beginAccess();
    v21 = *(_QWORD *)v20;
    if (*(_QWORD *)v20 >> 62)
    {
      swift_bridgeObjectRetain();
      v22 = sub_1A9CE8AC0();
      if (v22)
        goto LABEL_12;
    }
    else
    {
      v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v22)
      {
LABEL_12:
        if (v22 >= 1)
        {
          v23 = 0;
          do
          {
            if ((v21 & 0xC000000000000001) != 0)
              v24 = (_BYTE *)MEMORY[0x1AF41F600](v23, v21);
            else
              v24 = *(id *)(v21 + 8 * v23 + 32);
            v25 = v24;
            ++v23;
            objc_msgSend(v24, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((_QWORD *)v15 + 2)) == 0);
            v26 = *((_QWORD *)v15 + 1);
            v27 = (HKSPWeekdaysFromDay() & ~v26) == 0;
            v25[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v27;
            sub_1A9BEBD24();

          }
          while (v22 != v23);
          goto LABEL_35;
        }
        __break(1u);
LABEL_38:
        __break(1u);
        return;
      }
    }
LABEL_35:
    swift_bridgeObjectRelease();
    objc_msgSend(v45, sel_sendActionsForControlEvents_, 4096);
    return;
  }
  v28 = *((_QWORD *)v15 + 1);
  if ((HKSPWeekdaysFromDay() & ~v28) != 0)
  {
    swift_beginAccess();
    v34 = HKSPWeekdaysFromDay();
    v35 = *((_QWORD *)v15 + 2);
    if ((v34 & ~v35) != 0)
      *((_QWORD *)v15 + 2) = v35 | v34;
    swift_endAccess();
    v36 = &v2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
    swift_beginAccess();
    v37 = *(_QWORD *)v36;
    if (*(_QWORD *)v36 >> 62)
    {
      swift_bridgeObjectRetain();
      v38 = sub_1A9CE8AC0();
      if (!v38)
        goto LABEL_35;
    }
    else
    {
      v38 = *(_QWORD *)((v37 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v38)
        goto LABEL_35;
    }
    if (v38 >= 1)
    {
      v39 = 0;
      do
      {
        if ((v37 & 0xC000000000000001) != 0)
          v40 = (_BYTE *)MEMORY[0x1AF41F600](v39, v37);
        else
          v40 = *(id *)(v37 + 8 * v39 + 32);
        v41 = v40;
        ++v39;
        objc_msgSend(v40, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((_QWORD *)v15 + 2)) == 0);
        v42 = *((_QWORD *)v15 + 1);
        v43 = (HKSPWeekdaysFromDay() & ~v42) == 0;
        v41[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v43;
        sub_1A9BEBD24();

      }
      while (v38 != v39);
      goto LABEL_35;
    }
    goto LABEL_38;
  }
  sub_1A9B94A18(0, &qword_1EEB430A8);
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = v2;
  *(_QWORD *)(v29 + 24) = v5;
  v30 = v5;
  v31 = v2;
  v32 = sub_1A9CBF3A4((uint64_t)sub_1A9CBF8CC, v29);
  swift_release();
  v33 = (void *)MEMORY[0x1AF4203E0](&v31[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_alertPresenter]);
  if (v33)
  {
    objc_msgSend(v33, sel_presentViewController_animated_completion_, v32, 1, 0);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

uint64_t sub_1A9CBF1DC(uint64_t result, char *a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  uint64_t v12;
  BOOL v13;

  if ((result & 1) != 0)
  {
    v3 = &a2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model];
    swift_beginAccess();
    v4 = HKSPWeekdaysFromDay();
    v5 = *((_QWORD *)v3 + 2);
    if ((v4 & ~v5) != 0)
      *((_QWORD *)v3 + 2) = v5 | v4;
    swift_endAccess();
    v6 = &a2[OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days];
    swift_beginAccess();
    v7 = *(_QWORD *)v6;
    if (*(_QWORD *)v6 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_1A9CE8AC0();
      v8 = result;
      if (result)
        goto LABEL_6;
    }
    else
    {
      v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_6:
        if (v8 < 1)
        {
          __break(1u);
          return result;
        }
        v9 = 0;
        do
        {
          if ((v7 & 0xC000000000000001) != 0)
            v10 = (_BYTE *)MEMORY[0x1AF41F600](v9, v7);
          else
            v10 = *(id *)(v7 + 8 * v9 + 32);
          v11 = v10;
          ++v9;
          objc_msgSend(v10, sel_setSelected_, (HKSPWeekdaysFromDay() & ~*((_QWORD *)v3 + 2)) == 0);
          v12 = *((_QWORD *)v3 + 1);
          v13 = (HKSPWeekdaysFromDay() & ~v12) == 0;
          v11[OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleDayPickerDay_isSelectedElsewhere] = v13;
          sub_1A9BEBD24();

        }
        while (v8 != v9);
      }
    }
    swift_bridgeObjectRelease();
    return (uint64_t)objc_msgSend(a2, sel_sendActionsForControlEvents_, 4096);
  }
  return result;
}

id sub_1A9CBF3A4(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t aBlock;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  uint64_t (*v25)();
  uint64_t v26;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v4 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v5 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v6 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_alertControllerWithTitle_message_preferredStyle_, v6, v7, 1, 0xE000000000000000);

  v9 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  swift_retain();
  v11 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v25 = sub_1A9CBF8D4;
  v26 = v10;
  aBlock = MEMORY[0x1E0C809B0];
  v22 = 1107296256;
  v23 = sub_1A9C432C8;
  v24 = &block_descriptor_12_4;
  v12 = _Block_copy(&aBlock);
  swift_release();
  v13 = (void *)objc_opt_self();
  v14 = objc_msgSend(v13, sel_actionWithTitle_style_handler_, v11, 1, v12, 0xE000000000000000);
  _Block_release(v12);

  objc_msgSend(v8, sel_addAction_, v14);
  v15 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a2;
  swift_retain();
  v17 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v25 = sub_1A9CBF91C;
  v26 = v16;
  aBlock = MEMORY[0x1E0C809B0];
  v22 = 1107296256;
  v23 = sub_1A9C432C8;
  v24 = &block_descriptor_18_2;
  v18 = _Block_copy(&aBlock);
  swift_release();
  v19 = objc_msgSend(v13, sel_actionWithTitle_style_handler_, v17, 0, v18, 0xE000000000000000);
  _Block_release(v18);

  objc_msgSend(v8, sel_addAction_, v19);
  return v8;
}

uint64_t getEnumTagSinglePayload for SleepScheduleDayPicker.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SleepScheduleDayPicker.Configuration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SleepScheduleDayPicker.Configuration()
{
  return &type metadata for SleepScheduleDayPicker.Configuration;
}

uint64_t sub_1A9CBF848()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1A9CBF86C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A9CBE9BC(a1, a2, *(char **)(v2 + 16));
}

uint64_t sub_1A9CBF874()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_37(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_37()
{
  return swift_release();
}

uint64_t sub_1A9CBF8A0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1A9CBF8CC(uint64_t a1)
{
  uint64_t v1;

  return sub_1A9CBF1DC(a1, *(char **)(v1 + 16));
}

uint64_t sub_1A9CBF8D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

uint64_t sub_1A9CBF8F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CBF91C()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t))(v0 + 16))(1);
}

uint64_t sub_1A9CBF940(uint64_t a1, char a2)
{
  uint64_t *v2;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v5;
  v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
      return result;
    v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_1A9CE8AC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1)
    v9 = a1;
  else
    v9 = v8;
  result = MEMORY[0x1AF41F60C](v7, v9, a2 & 1, v5);
  *v2 = result;
  return result;
}

BOOL static SleepOnboardingContext.EntryPoint.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SleepOnboardingContext.EntryPoint.hash(into:)()
{
  return sub_1A9CE8C58();
}

uint64_t SleepOnboardingContext.EntryPoint.hashValue.getter()
{
  sub_1A9CE8C4C();
  sub_1A9CE8C58();
  return sub_1A9CE8C7C();
}

id SleepOnboardingContext.provenanceInfo.getter()
{
  id *v0;

  return *v0;
}

void SleepOnboardingContext.entryPoint.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 8);
}

uint64_t SleepOnboardingContext.presentationStyle.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SleepOnboardingContext.init(provenanceInfo:entryPoint:presentationStyle:)@<X0>(uint64_t result@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char v4;

  v4 = *a2;
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v4;
  *(_QWORD *)(a4 + 16) = a3;
  return result;
}

unint64_t sub_1A9CBFAC8()
{
  unint64_t result;

  result = qword_1EEB49FA0;
  if (!qword_1EEB49FA0)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for SleepOnboardingContext.EntryPoint, &type metadata for SleepOnboardingContext.EntryPoint);
    atomic_store(result, (unint64_t *)&qword_1EEB49FA0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SleepOnboardingContext(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = v3;
  return a1;
}

uint64_t assignWithCopy for SleepOnboardingContext(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for SleepOnboardingContext(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for SleepOnboardingContext()
{
  return &type metadata for SleepOnboardingContext;
}

uint64_t storeEnumTagSinglePayload for SleepOnboardingContext.EntryPoint(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A9CBFC38 + 4 * byte_1A9CF6AD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A9CBFC6C + 4 * asc_1A9CF6AD0[v4]))();
}

uint64_t sub_1A9CBFC6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9CBFC74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A9CBFC7CLL);
  return result;
}

uint64_t sub_1A9CBFC88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A9CBFC90);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A9CBFC94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9CBFC9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SleepOnboardingContext.EntryPoint()
{
  return &type metadata for SleepOnboardingContext.EntryPoint;
}

uint64_t NSUserActivity.route.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A9B90B94(1);
  if (!v0)
    return 0;
  v1 = sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return v1;
}

id RouteProvenanceProviding.provenanceInfo.getter(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = (id)(*(uint64_t (**)(void))(a2 + 8))();
  if (!v4)
    v4 = (id)*MEMORY[0x1E0DA8340];
  v5 = v4;
  v6 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  if (!v6)
    v6 = (id)*MEMORY[0x1E0DA8310];
  v7 = v6;
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DA8540]), sel_initWithSource_presentation_, v5, v6);

  return v8;
}

void sub_1A9CBFDA0(char a1)
{
  sub_1A9CE82E0();
  sub_1A9CE8340();
  __asm { BR              X10 }
}

uint64_t sub_1A9CBFE0C()
{
  uint64_t v1;

  sub_1A9CE8340();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static NSUserActivity.plugin.getter()
{
  uint64_t v0;

  sub_1A9CE82E0();
  v0 = sub_1A9CE6744();
  swift_bridgeObjectRelease();
  sub_1A9CBFF1C(1, 0);
  return v0;
}

void sub_1A9CBFF1C(uint64_t a1, char a2)
{
  void *v2;
  uint64_t inited;
  void *v5;

  if ((a2 & 1) == 0)
  {
    sub_1A9B92F34(0, (unint64_t *)&qword_1EEB48EA8, (uint64_t (*)(uint64_t))sub_1A9C88B68, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A9CEB520;
    sub_1A9CE82E0();
    sub_1A9CE8340();
    sub_1A9CE8340();
    sub_1A9CE897C();
    *(_QWORD *)(inited + 96) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(inited + 72) = a1;
    sub_1A9BAC754(inited);
    v5 = (void *)sub_1A9CE8208();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_addUserInfoEntriesFromDictionary_, v5);

  }
}

uint64_t sub_1A9CC0058@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_1A9B90B94(1);
  if (v3)
  {
    v4 = sub_1A9CE82B0();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
  return result;
}

void NSUserActivity.route.setter(void *a1)
{
  sub_1A9CC05C0(a1);
}

void (*NSUserActivity.route.modify(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[1] = v1;
  sub_1A9B90B94(1);
  if (v3)
  {
    v4 = sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
  return sub_1A9CC0120;
}

void sub_1A9CC0120(void **a1, char a2)
{
  sub_1A9CC08C0(a1, a2, NSUserActivity.route.setter);
}

uint64_t NSUserActivity.presentWithAnimation.getter()
{
  return sub_1A9B90CC4(2);
}

void NSUserActivity.presentWithAnimation.setter(char a1)
{
  sub_1A9CC01E8(a1);
}

void (*NSUserActivity.presentWithAnimation.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  *((_BYTE *)v3 + 128) = sub_1A9B90CC4(2);
  return sub_1A9CC01A0;
}

void sub_1A9CC01A0(uint64_t a1, char a2)
{
  sub_1A9CC03A4(a1, a2, 0xD000000000000014, 0x80000001A9CFFB60, (void (*)(uint64_t))NSUserActivity.presentWithAnimation.setter);
}

uint64_t NSUserActivity.delayScrollToSchedule.getter()
{
  return sub_1A9B90CC4(3);
}

void NSUserActivity.delayScrollToSchedule.setter(char a1)
{
  sub_1A9CC01E8(a1);
}

void sub_1A9CC01E8(char a1)
{
  void *v1;
  char v2;
  uint64_t inited;
  void *v4;

  if (a1 != 2)
  {
    v2 = a1 & 1;
    sub_1A9B92F34(0, (unint64_t *)&qword_1EEB48EA8, (uint64_t (*)(uint64_t))sub_1A9C88B68, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A9CEB520;
    sub_1A9CE82E0();
    sub_1A9CE8340();
    sub_1A9CE8340();
    sub_1A9CE897C();
    *(_QWORD *)(inited + 96) = MEMORY[0x1E0DEAFA0];
    *(_BYTE *)(inited + 72) = v2;
    sub_1A9BAC754(inited);
    v4 = (void *)sub_1A9CE8208();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_addUserInfoEntriesFromDictionary_, v4);

  }
}

void (*NSUserActivity.delayScrollToSchedule.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[15] = v1;
  *((_BYTE *)v3 + 128) = sub_1A9B90CC4(3);
  return sub_1A9CC0380;
}

void sub_1A9CC0380(uint64_t a1, char a2)
{
  sub_1A9CC03A4(a1, a2, 0xD000000000000015, 0x80000001A9CFFB80, (void (*)(uint64_t))NSUserActivity.delayScrollToSchedule.setter);
}

void sub_1A9CC03A4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t inited;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD **)a1;
  v6 = *(unsigned __int8 *)(*(_QWORD *)a1 + 128);
  if ((a2 & 1) != 0)
  {
    a5(v6);
  }
  else if ((_DWORD)v6 != 2)
  {
    v7 = (void *)v5[15];
    v8 = v6 & 1;
    sub_1A9B92F34(0, (unint64_t *)&qword_1EEB48EA8, (uint64_t (*)(uint64_t))sub_1A9C88B68, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A9CEB520;
    v12 = sub_1A9CE82E0();
    v13 = v10;
    sub_1A9CE8340();
    sub_1A9CE8340();
    v5[13] = v12;
    v5[14] = v13;
    sub_1A9CE897C();
    *(_QWORD *)(inited + 96) = MEMORY[0x1E0DEAFA0];
    *(_BYTE *)(inited + 72) = v8;
    sub_1A9BAC754(inited);
    v11 = (void *)sub_1A9CE8208();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_addUserInfoEntriesFromDictionary_, v11);

  }
  free(v5);
}

uint64_t NSUserActivity.provenanceSource.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A9B90B94(4);
  if (!v0)
    return 0;
  v1 = sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1A9CC0558@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_1A9B90B94(4);
  if (v3)
  {
    v4 = sub_1A9CE82B0();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
  return result;
}

void NSUserActivity.provenanceSource.setter(void *a1)
{
  sub_1A9CC05C0(a1);
}

void sub_1A9CC05C0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  void *v9;

  if (a1)
  {
    v2 = v1;
    v4 = sub_1A9CE82E0();
    v6 = v5;
    sub_1A9B92F34(0, (unint64_t *)&qword_1EEB48EA8, (uint64_t (*)(uint64_t))sub_1A9C88B68, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A9CEB520;
    sub_1A9CE82E0();
    swift_bridgeObjectRetain();
    sub_1A9CE8340();
    sub_1A9CE8340();
    v8 = MEMORY[0x1E0DEA968];
    sub_1A9CE897C();
    *(_QWORD *)(inited + 96) = v8;
    *(_QWORD *)(inited + 72) = v4;
    *(_QWORD *)(inited + 80) = v6;
    swift_bridgeObjectRetain();
    sub_1A9BAC754(inited);
    v9 = (void *)sub_1A9CE8208();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_addUserInfoEntriesFromDictionary_, v9);

    swift_bridgeObjectRelease_n();
  }
}

void (*NSUserActivity.provenanceSource.modify(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[1] = v1;
  sub_1A9B90B94(4);
  if (v3)
  {
    v4 = sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
  return sub_1A9CC0790;
}

void sub_1A9CC0790(void **a1, char a2)
{
  sub_1A9CC08C0(a1, a2, NSUserActivity.provenanceSource.setter);
}

uint64_t NSUserActivity.provenancePresentation.getter()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A9B90B94(5);
  if (!v0)
    return 0;
  v1 = sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1A9CC07E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_1A9B90B94(5);
  if (v3)
  {
    v4 = sub_1A9CE82B0();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
  return result;
}

void NSUserActivity.provenancePresentation.setter(void *a1)
{
  sub_1A9CC05C0(a1);
}

void (*NSUserActivity.provenancePresentation.modify(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  a1[1] = v1;
  sub_1A9B90B94(5);
  if (v3)
  {
    v4 = sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  *a1 = v4;
  return sub_1A9CC08B4;
}

void sub_1A9CC08B4(void **a1, char a2)
{
  sub_1A9CC08C0(a1, a2, NSUserActivity.provenancePresentation.setter);
}

void sub_1A9CC08C0(void **a1, char a2, void (*a3)(void *))
{
  void *v4;
  id v5;

  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = v4;
    a3(v4);

  }
  else
  {
    a3(*a1);
  }
}

char NSUserActivity.articleIdentifier.getter@<W0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1A9B90B94(6);
  if (v3)
    LOBYTE(v2) = ArticleIdentifier.init(rawValue:)(*(Swift::String *)&v2);
  else
    *a1 = 5;
  return v2;
}

char sub_1A9CC0964@<W0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v6;

  v2 = sub_1A9B90B94(6);
  if (v3)
  {
    LOBYTE(v2) = ArticleIdentifier.init(rawValue:)(*(Swift::String *)&v2);
    v4 = v6;
  }
  else
  {
    v4 = 5;
  }
  *a1 = v4;
  return v2;
}

void NSUserActivity.articleIdentifier.setter(uint64_t a1)
{
  __asm { BR              X11 }
}

void sub_1A9CC0A04(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  void *v5;

  v2 = a1 + 21;
  sub_1A9B92F34(0, (unint64_t *)&qword_1EEB48EA8, (uint64_t (*)(uint64_t))sub_1A9C88B68, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A9CEB520;
  sub_1A9CE82E0();
  swift_bridgeObjectRetain();
  sub_1A9CE8340();
  sub_1A9CE8340();
  v4 = MEMORY[0x1E0DEA968];
  sub_1A9CE897C();
  *(_QWORD *)(inited + 96) = v4;
  *(_QWORD *)(inited + 72) = v2;
  *(_QWORD *)(inited + 80) = 0x80000001A9CF7F90;
  swift_bridgeObjectRetain();
  sub_1A9BAC754(inited);
  v5 = (void *)sub_1A9CE8208();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_addUserInfoEntriesFromDictionary_, v5);
  swift_bridgeObjectRelease_n();

}

void (*NSUserActivity.articleIdentifier.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;

  *a1 = v1;
  v2 = a1 + 1;
  v3 = sub_1A9B90B94(6);
  if (v4)
    ArticleIdentifier.init(rawValue:)(*(Swift::String *)&v3);
  else
    *v2 = 5;
  return sub_1A9CC0BC8;
}

void sub_1A9CC0BC8(uint64_t a1, char a2)
{
  char *v2;
  char v3;
  char v4;

  if ((a2 & 1) != 0)
  {
    v3 = *(_BYTE *)(a1 + 8);
    v2 = &v3;
  }
  else
  {
    v4 = *(_BYTE *)(a1 + 8);
    v2 = &v4;
  }
  NSUserActivity.articleIdentifier.setter((uint64_t)v2);
}

uint64_t sub_1A9CC0C0C()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A9B90B94(1);
  if (!v0)
    return 0;
  v1 = sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1A9CC0C54()
{
  return sub_1A9B90CC4(2);
}

uint64_t sub_1A9CC0C78()
{
  return sub_1A9B90CC4(3);
}

uint64_t sub_1A9CC0C9C()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A9B90B94(4);
  if (!v0)
    return 0;
  v1 = sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1A9CC0CE4()
{
  uint64_t v0;
  uint64_t v1;

  sub_1A9B90B94(5);
  if (!v0)
    return 0;
  v1 = sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static URL.sleepRoom(route:presentWithAnimation:provenance:articleIdentifier:)@<X0>(void *a1@<X0>, char a2@<W1>, void *a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t a5@<X8>)
{
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
  id v19;
  unsigned __int8 v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;

  v26 = a5;
  sub_1A9B92F34(0, &qword_1EEB48C00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v26 - v11;
  v13 = sub_1A9CE600C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13, v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a4;
  sub_1A9CE82E0();
  sub_1A9CE6750();
  swift_bridgeObjectRelease();
  v28 = 47;
  v29 = 0xE100000000000000;
  v27 = v13;
  if (a1)
    sub_1A9CE82E0();
  v19 = a1;
  sub_1A9CE8340();
  swift_bridgeObjectRelease();
  sub_1A9CE6000();

  if (a2 == 2)
    v20 = 2;
  else
    v20 = a2 & 1;
  sub_1A9CC2810(v20, 2);
  v21 = objc_msgSend(a3, sel_source);
  sub_1A9CC2D2C(v21, 4);

  v22 = objc_msgSend(a3, sel_presentation);
  sub_1A9CC2D2C(v22, 5);

  sub_1A9CC3268(v18, 6);
  sub_1A9CE5FE8();
  v23 = sub_1A9CE6234();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v12, 1, v23) == 1)
  {
    sub_1A9B93BDC((uint64_t)v12, &qword_1EEB48C00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
    v28 = 0;
    v29 = 0xE000000000000000;
    sub_1A9CE89B8();
    swift_bridgeObjectRelease();
    v28 = 0xD00000000000001ALL;
    v29 = 0x80000001A9CFFBE0;
    sub_1A9CC3D98();
    sub_1A9CE8B74();
    sub_1A9CE8340();
    swift_bridgeObjectRelease();
    result = sub_1A9CE8A84();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v27);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v24 + 32))(v26, v12, v23);
  }
  return result;
}

uint64_t static URLComponents.plugin.getter()
{
  sub_1A9CE82E0();
  sub_1A9CE6750();
  return swift_bridgeObjectRelease();
}

void URLComponents.route.setter(void *a1)
{
  if (a1)
    sub_1A9CE82E0();
  sub_1A9CE8340();
  swift_bridgeObjectRelease();
  sub_1A9CE6000();

}

void URLComponents.presentWithAnimation.setter(char a1)
{
  unsigned __int8 v1;

  if (a1 == 2)
    v1 = 2;
  else
    v1 = a1 & 1;
  sub_1A9CC2810(v1, 2);
}

void URLComponents.provenanceSource.setter(void *a1)
{
  sub_1A9CC2D2C(a1, 4);

}

void URLComponents.provenancePresentation.setter(void *a1)
{
  sub_1A9CC2D2C(a1, 5);

}

void URLComponents.articleIdentifier.setter(unsigned __int8 *a1)
{
  sub_1A9CC3268(*a1, 6);
}

uint64_t URL.route.getter()
{
  return sub_1A9CC15F4(URLComponents.route.getter);
}

uint64_t URLComponents.route.getter()
{
  unint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1A9CE5FF4();
  v0 = sub_1A9BA8EA4();
  v1 = (_QWORD *)MEMORY[0x1AF41F510](47, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x1E0DEA968], v0);
  swift_bridgeObjectRelease();
  if (v1[2])
  {
    v2 = v1[4];
    v3 = v1[5];
    v4 = v1[6];
    v5 = v1[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    MEMORY[0x1AF41EF40](v2, v3, v4, v5);
    swift_bridgeObjectRelease();
    v6 = sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v6;
}

uint64_t URL.presentWithAnimation.getter()
{
  return sub_1A9CC1258(sub_1A9CC2518);
}

uint64_t URLComponents.presentWithAnimation.getter()
{
  char v0;

  v0 = sub_1A9CC2518();
  if (v0 == 2)
    return 2;
  else
    return v0 & 1;
}

uint64_t URL.delayScrollToSchedule.getter()
{
  return sub_1A9CC1258(sub_1A9CC3874);
}

uint64_t sub_1A9CC1258(uint64_t (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v11;

  sub_1A9B92F34(0, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v11 - v4;
  sub_1A9CE5FDC();
  v6 = sub_1A9CE600C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1A9B93BDC((uint64_t)v5, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    return 2;
  }
  else
  {
    v9 = a1();
    if (v9 == 2)
      v8 = 2;
    else
      v8 = v9 & 1;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return v8;
}

uint64_t URLComponents.delayScrollToSchedule.getter()
{
  char v0;

  v0 = sub_1A9CC3874();
  if (v0 == 2)
    return 2;
  else
    return v0 & 1;
}

uint64_t URL.provenanceSource.getter()
{
  return sub_1A9CC15F4(URLComponents.provenanceSource.getter);
}

uint64_t URLComponents.provenanceSource.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char *v23;

  v0 = sub_1A9CE5FB8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B92F34(0, &qword_1EEB49FB8, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v22 - v8;
  v10 = sub_1A9CE5FC4();
  if (!v10)
    return 0;
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v23 = v9;
    v12 = v10 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    v13 = *(_QWORD *)(v1 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    swift_bridgeObjectRetain();
    while (1)
    {
      v14(v4, v12, v0);
      if (sub_1A9CE5FA0() == 0x656372756F73 && v15 == 0xE600000000000000)
        break;
      v16 = sub_1A9CE8BB0();
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
        goto LABEL_11;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
      v12 += v13;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        v17 = 1;
        v9 = v23;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    v9 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v9, v4, v0);
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v9, v17, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v9, 1, v0) == 1)
  {
    sub_1A9B93BDC((uint64_t)v9, &qword_1EEB49FB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
    return 0;
  }
  sub_1A9CE5FAC();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
  if (!v19)
    return 0;
  v20 = sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t URL.provenancePresentation.getter()
{
  return sub_1A9CC15F4((uint64_t (*)(void))URLComponents.provenancePresentation.getter);
}

uint64_t sub_1A9CC15F4(uint64_t (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  sub_1A9B92F34(0, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v10 - v4;
  sub_1A9CE5FDC();
  v6 = sub_1A9CE600C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1A9B93BDC((uint64_t)v5, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    return 0;
  }
  else
  {
    v8 = a1();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return v8;
}

id URLComponents.provenancePresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char *v23;

  v0 = sub_1A9CE5FB8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B92F34(0, &qword_1EEB49FB8, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v22 - v8;
  v10 = sub_1A9CE5FC4();
  if (!v10)
    return (id)*MEMORY[0x1E0DA8308];
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v22 = v10;
    v23 = v9;
    v12 = v10 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    v13 = *(_QWORD *)(v1 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    swift_bridgeObjectRetain();
    while (1)
    {
      v14(v4, v12, v0);
      if (sub_1A9CE5FA0() == 0x61746E6573657270 && v15 == 0xEC0000006E6F6974)
        break;
      v16 = sub_1A9CE8BB0();
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
        goto LABEL_11;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
      v12 += v13;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        v17 = 1;
        v9 = v23;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    v9 = v23;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v23, v4, v0);
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v9, v17, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v9, 1, v0) == 1)
  {
    sub_1A9B93BDC((uint64_t)v9, &qword_1EEB49FB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
    return (id)*MEMORY[0x1E0DA8308];
  }
  sub_1A9CE5FAC();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
  if (!v19)
    return (id)*MEMORY[0x1E0DA8308];
  v20 = sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  return (id)v20;
}

uint64_t URL.articleIdentifier.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  sub_1A9B92F34(0, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)&v9 - v4;
  sub_1A9CE5FDC();
  v6 = sub_1A9CE600C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    result = sub_1A9B93BDC((uint64_t)v5, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    *a1 = 5;
  }
  else
  {
    URLComponents.articleIdentifier.getter(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return result;
}

char URLComponents.articleIdentifier.getter@<W0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  Swift::String v23;
  uint64_t v25;
  char *v26;
  _BYTE *v27;
  unint64_t v28;

  v2 = sub_1A9CE5FB8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B92F34(0, &qword_1EEB49FB8, v7, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v25 - v10;
  v12 = sub_1A9CE5FC4();
  if (!v12)
    goto LABEL_16;
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v26 = v11;
    v27 = a1;
    v14 = v12 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v15 = *(_QWORD *)(v3 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    v25 = v12;
    swift_bridgeObjectRetain();
    v28 = 0x80000001A9CFFBA0;
    while (1)
    {
      v16(v6, v14, v2);
      if (sub_1A9CE5FA0() == 0xD000000000000011 && v17 == v28)
        break;
      v18 = sub_1A9CE8BB0();
      swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
        goto LABEL_11;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      v14 += v15;
      if (!--v13)
      {
        swift_bridgeObjectRelease();
        v19 = 1;
        v11 = v26;
        a1 = v27;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    v11 = v26;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v26, v6, v2);
    v19 = 0;
    a1 = v27;
  }
  else
  {
    v19 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v11, v19, 1, v2);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) == 1)
  {
    LOBYTE(v12) = sub_1A9B93BDC((uint64_t)v11, &qword_1EEB49FB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
LABEL_16:
    *a1 = 5;
    return v12;
  }
  v20 = sub_1A9CE5FAC();
  v22 = v21;
  LOBYTE(v12) = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v11, v2);
  if (!v22)
    goto LABEL_16;
  v23._countAndFlagsBits = v20;
  v23._object = v22;
  LOBYTE(v12) = ArticleIdentifier.init(rawValue:)(v23);
  return v12;
}

uint64_t URL.userActivity.getter()
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  void *v30;
  char v31;
  char v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  uint64_t v39;
  id v40;
  char v41;
  uint64_t v43;
  char *v44;
  char *v45;
  char v46;
  char v47;

  sub_1A9B92F34(0, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v0, v1);
  v45 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3, v4);
  v44 = (char *)&v43 - v5;
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v43 - v8;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v43 - v12;
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v43 - v16;
  MEMORY[0x1E0C80A78](v18, v19);
  v21 = (char *)&v43 - v20;
  MEMORY[0x1E0C80A78](v22, v23);
  v25 = (char *)&v43 - v24;
  sub_1A9CE5FDC();
  sub_1A9CE82E0();
  v26 = sub_1A9CE6744();
  swift_bridgeObjectRelease();
  sub_1A9CBFF1C(1, 0);
  sub_1A9CC3DE0((uint64_t)v25, (uint64_t)v21);
  v27 = sub_1A9CE600C();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  if (v29(v21, 1, v27) == 1)
  {
    sub_1A9B93BDC((uint64_t)v21, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    v30 = 0;
  }
  else
  {
    v30 = (void *)URLComponents.route.getter();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v21, v27);
  }
  NSUserActivity.route.setter(v30);
  sub_1A9CC3DE0((uint64_t)v25, (uint64_t)v17);
  if (v29(v17, 1, v27) == 1)
  {
    sub_1A9B93BDC((uint64_t)v17, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    v31 = 2;
  }
  else
  {
    v32 = sub_1A9CC2518();
    if (v32 == 2)
      v31 = 2;
    else
      v31 = v32 & 1;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v17, v27);
  }
  NSUserActivity.presentWithAnimation.setter(v31);
  sub_1A9CC3DE0((uint64_t)v25, (uint64_t)v13);
  if (v29(v13, 1, v27) == 1)
  {
    sub_1A9B93BDC((uint64_t)v13, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    v33 = 2;
  }
  else
  {
    v34 = sub_1A9CC3874();
    if (v34 == 2)
      v33 = 2;
    else
      v33 = v34 & 1;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v27);
  }
  NSUserActivity.delayScrollToSchedule.setter(v33);
  sub_1A9CC3DE0((uint64_t)v25, (uint64_t)v9);
  v35 = v29(v9, 1, v27);
  v36 = (uint64_t)v44;
  if (v35 == 1)
  {
    sub_1A9B93BDC((uint64_t)v9, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    v37 = 0;
  }
  else
  {
    v37 = (void *)URLComponents.provenanceSource.getter();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v27);
  }
  NSUserActivity.provenanceSource.setter(v37);
  sub_1A9CC3DE0((uint64_t)v25, v36);
  v38 = v29((char *)v36, 1, v27);
  v39 = (uint64_t)v45;
  if (v38 == 1)
  {
    sub_1A9B93BDC(v36, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    v40 = 0;
  }
  else
  {
    v40 = URLComponents.provenancePresentation.getter();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v36, v27);
  }
  NSUserActivity.provenancePresentation.setter(v40);
  sub_1A9CC3DE0((uint64_t)v25, v39);
  if (v29((char *)v39, 1, v27) == 1)
  {
    sub_1A9B93BDC(v39, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    v41 = 5;
  }
  else
  {
    URLComponents.articleIdentifier.getter(&v46);
    v41 = v46;
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v39, v27);
  }
  v47 = v41;
  NSUserActivity.articleIdentifier.setter((uint64_t)&v47);
  sub_1A9B93BDC((uint64_t)v25, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
  return v26;
}

uint64_t sub_1A9CC214C(uint64_t a1, uint64_t a2)
{
  return sub_1A9CC2280(a1, a2, URLComponents.route.getter);
}

uint64_t sub_1A9CC2158(uint64_t a1, uint64_t a2)
{
  return sub_1A9CC2170(a1, a2, sub_1A9CC2518);
}

uint64_t sub_1A9CC2164(uint64_t a1, uint64_t a2)
{
  return sub_1A9CC2170(a1, a2, sub_1A9CC3874);
}

uint64_t sub_1A9CC2170(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v13;

  sub_1A9B92F34(0, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v13 - v6;
  sub_1A9CE5FDC();
  v8 = sub_1A9CE600C();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1A9B93BDC((uint64_t)v7, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    return 2;
  }
  else
  {
    v11 = a3();
    if (v11 == 2)
      v10 = 2;
    else
      v10 = v11 & 1;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  return v10;
}

uint64_t sub_1A9CC2268(uint64_t a1, uint64_t a2)
{
  return sub_1A9CC2280(a1, a2, URLComponents.provenanceSource.getter);
}

uint64_t sub_1A9CC2274(uint64_t a1, uint64_t a2)
{
  return sub_1A9CC2280(a1, a2, (uint64_t (*)(void))URLComponents.provenancePresentation.getter);
}

uint64_t sub_1A9CC2280(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  sub_1A9B92F34(0, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v12 - v6;
  sub_1A9CE5FDC();
  v8 = sub_1A9CE600C();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1A9B93BDC((uint64_t)v7, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890]);
    return 0;
  }
  else
  {
    v10 = a3();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  }
  return v10;
}

void sub_1A9CC236C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  if (*a1)
    sub_1A9CE82E0();
  v2 = v1;
  sub_1A9CE8340();
  swift_bridgeObjectRelease();
  sub_1A9CE6000();

}

void (*URLComponents.route.modify(uint64_t *a1))(id *a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = URLComponents.route.getter();
  return sub_1A9CC242C;
}

void sub_1A9CC242C(id *a1, char a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v5 = v3;
      sub_1A9CE82E0();
      v3 = v5;
    }
    v4 = v3;
    sub_1A9CE8340();
    swift_bridgeObjectRelease();
    sub_1A9CE6000();

  }
  else
  {
    v6 = v3;
    if (v3)
      sub_1A9CE82E0();
    sub_1A9CE8340();
    swift_bridgeObjectRelease();
    sub_1A9CE6000();

  }
}

uint64_t sub_1A9CC2518()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  _QWORD v24[2];
  char *v25;
  unint64_t v26;

  v0 = sub_1A9CE5FB8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B92F34(0, &qword_1EEB49FB8, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v24 - v8;
  v10 = sub_1A9CE5FC4();
  if (!v10)
    return 2;
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v24[1] = v10;
    v25 = v9;
    v12 = v10 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    v13 = *(_QWORD *)(v1 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    swift_bridgeObjectRetain();
    v26 = 0x80000001A9CFFB60;
    while (1)
    {
      v14(v4, v12, v0);
      if (sub_1A9CE5FA0() == 0xD000000000000014 && v15 == v26)
        break;
      v16 = sub_1A9CE8BB0();
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
        goto LABEL_11;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
      v12 += v13;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        v17 = 1;
        v9 = v25;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    v9 = v25;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v25, v4, v0);
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v9, v17, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v9, 1, v0) != 1)
  {
    v19 = sub_1A9CE5FAC();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
    if (v21)
    {
      if (v19 == 48 && v21 == 0xE100000000000000)
      {
        v18 = 0;
LABEL_22:
        swift_bridgeObjectRelease();
        return v18;
      }
      v18 = 0;
      if ((sub_1A9CE8BB0() & 1) != 0)
        goto LABEL_22;
      if (v19 == 49 && v21 == 0xE100000000000000)
      {
        v18 = 1;
        goto LABEL_22;
      }
      v22 = sub_1A9CE8BB0();
      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
        return 1;
    }
    return 2;
  }
  sub_1A9B93BDC((uint64_t)v9, &qword_1EEB49FB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
  return 2;
}

void sub_1A9CC2810(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
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
  _DWORD v17[2];
  char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a1;
  v5 = sub_1A9CE5FB8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v25 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)v17 - v11;
  MEMORY[0x1E0C80A78](v13, v14);
  if (v4 != 2)
  {
    v23 = a2;
    v17[1] = v4;
    v18 = (char *)v17 - v15;
    v19 = v2;
    v16 = sub_1A9CE5FC4();
    if (v16)
    {
      v27 = *(_QWORD *)(v16 + 16);
      v28 = MEMORY[0x1E0DEE9D8];
      if (v27)
      {
        v26 = v23;
        v21 = "presentWithAnimation";
        v22 = "eepScheduleDayPicker.swift";
        v20 = "delayScrollToSchedule";
        v24 = v5;
        if (*(_QWORD *)(v16 + 16))
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v12, v16 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), v5);
          sub_1A9CE5FA0();
          __asm { BR              X8 }
        }
        __break(1u);
        JUMPOUT(0x1A9CC2CB4);
      }
      swift_bridgeObjectRelease();
    }
    __asm { BR              X10 }
  }
}

void sub_1A9CC2D2C(void *a1, uint64_t a2)
{
  uint64_t v2;
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
  _QWORD v17[7];
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = sub_1A9CE5FB8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v21 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)v17 - v11;
  MEMORY[0x1E0C80A78](v13, v14);
  v19 = (char *)v17 - v15;
  if (a1)
  {
    v18 = a2;
    v17[2] = a1;
    v17[1] = a1;
    v17[3] = v2;
    v16 = sub_1A9CE5FC4();
    v20 = v5;
    if (v16)
    {
      v23 = *(_QWORD *)(v16 + 16);
      v24 = MEMORY[0x1E0DEE9D8];
      if (v23)
      {
        v22 = v18;
        v17[5] = "presentWithAnimation";
        v17[6] = "eepScheduleDayPicker.swift";
        v17[4] = "delayScrollToSchedule";
        if (*(_QWORD *)(v16 + 16))
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v12, v16 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), v5);
          sub_1A9CE5FA0();
          __asm { BR              X8 }
        }
        __break(1u);
        JUMPOUT(0x1A9CC31F0);
      }
      swift_bridgeObjectRelease();
    }
    __asm { BR              X10 }
  }
}

void sub_1A9CC3268(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
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
  _QWORD v18[6];
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a1;
  v6 = sub_1A9CE5FB8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v21 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v18 - v12;
  MEMORY[0x1E0C80A78](v14, v15);
  if (v5 != 5)
  {
    v19 = a2;
    v18[0] = a1;
    v18[1] = (char *)v18 - v16;
    v18[2] = v2;
    v17 = sub_1A9CE5FC4();
    if (v17)
    {
      v23 = *(_QWORD *)(v17 + 16);
      v24 = MEMORY[0x1E0DEE9D8];
      if (v23)
      {
        v22 = v19;
        v18[4] = "presentWithAnimation";
        v18[5] = "eepScheduleDayPicker.swift";
        v18[3] = "delayScrollToSchedule";
        v20 = v6;
        if (*(_QWORD *)(v17 + 16))
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v13, v17 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)), v6);
          sub_1A9CE5FA0();
          __asm { BR              X8 }
        }
        __break(1u);
        JUMPOUT(0x1A9CC379CLL);
      }
      swift_bridgeObjectRelease();
    }
    __asm { BR              X10 }
  }
}

void (*URLComponents.presentWithAnimation.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  char v3;
  char v4;

  *(_QWORD *)a1 = v1;
  v3 = sub_1A9CC2518();
  if (v3 == 2)
    v4 = 2;
  else
    v4 = v3 & 1;
  *(_BYTE *)(a1 + 8) = v4;
  return sub_1A9CC386C;
}

void sub_1A9CC386C(uint64_t a1, uint64_t a2)
{
  sub_1A9CC3BD0(a1, a2, 2);
}

uint64_t sub_1A9CC3874()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(char *, unint64_t, uint64_t);
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  _QWORD v24[2];
  char *v25;
  unint64_t v26;

  v0 = sub_1A9CE5FB8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B92F34(0, &qword_1EEB49FB8, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v24 - v8;
  v10 = sub_1A9CE5FC4();
  if (!v10)
    return 2;
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v24[1] = v10;
    v25 = v9;
    v12 = v10 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    v13 = *(_QWORD *)(v1 + 72);
    v14 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    swift_bridgeObjectRetain();
    v26 = 0x80000001A9CFFB80;
    while (1)
    {
      v14(v4, v12, v0);
      if (sub_1A9CE5FA0() == 0xD000000000000015 && v15 == v26)
        break;
      v16 = sub_1A9CE8BB0();
      swift_bridgeObjectRelease();
      if ((v16 & 1) != 0)
        goto LABEL_11;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
      v12 += v13;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        v17 = 1;
        v9 = v25;
        goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    v9 = v25;
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v25, v4, v0);
    v17 = 0;
  }
  else
  {
    v17 = 1;
  }
LABEL_12:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v9, v17, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v9, 1, v0) != 1)
  {
    v19 = sub_1A9CE5FAC();
    v21 = v20;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
    if (v21)
    {
      if (v19 == 48 && v21 == 0xE100000000000000)
      {
        v18 = 0;
LABEL_22:
        swift_bridgeObjectRelease();
        return v18;
      }
      v18 = 0;
      if ((sub_1A9CE8BB0() & 1) != 0)
        goto LABEL_22;
      if (v19 == 49 && v21 == 0xE100000000000000)
      {
        v18 = 1;
        goto LABEL_22;
      }
      v22 = sub_1A9CE8BB0();
      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
        return 1;
    }
    return 2;
  }
  sub_1A9B93BDC((uint64_t)v9, &qword_1EEB49FB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE690]);
  return 2;
}

void URLComponents.delayScrollToSchedule.setter(char a1)
{
  unsigned __int8 v1;

  if (a1 == 2)
    v1 = 2;
  else
    v1 = a1 & 1;
  sub_1A9CC2810(v1, 3);
}

void (*URLComponents.delayScrollToSchedule.modify(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  char v3;
  char v4;

  *(_QWORD *)a1 = v1;
  v3 = sub_1A9CC3874();
  if (v3 == 2)
    v4 = 2;
  else
    v4 = v3 & 1;
  *(_BYTE *)(a1 + 8) = v4;
  return sub_1A9CC3BC8;
}

void sub_1A9CC3BC8(uint64_t a1, uint64_t a2)
{
  sub_1A9CC3BD0(a1, a2, 3);
}

void sub_1A9CC3BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  unsigned __int8 v4;

  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 == 2)
    v4 = 2;
  else
    v4 = v3 & 1;
  sub_1A9CC2810(v4, a3);
}

void (*URLComponents.provenanceSource.modify(uint64_t *a1))(void **a1, char a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = URLComponents.provenanceSource.getter();
  return sub_1A9CC3C38;
}

void sub_1A9CC3C38(void **a1, char a2)
{
  sub_1A9CC3C7C(a1, a2, 4);
}

void (*URLComponents.provenancePresentation.modify(id *a1))(void **a1, char a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = URLComponents.provenancePresentation.getter();
  return sub_1A9CC3C74;
}

void sub_1A9CC3C74(void **a1, char a2)
{
  sub_1A9CC3C7C(a1, a2, 5);
}

void sub_1A9CC3C7C(void **a1, char a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = *a1;
  if ((a2 & 1) != 0)
  {
    v4 = v6;
    sub_1A9CC2D2C(v6, a3);

    v5 = v4;
  }
  else
  {
    sub_1A9CC2D2C(*a1, a3);
    v5 = v6;
  }

}

void (*URLComponents.articleIdentifier.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  URLComponents.articleIdentifier.getter((_BYTE *)(a1 + 8));
  return sub_1A9CC3D1C;
}

void sub_1A9CC3D1C(uint64_t a1)
{
  sub_1A9CC3268(*(unsigned __int8 *)(a1 + 8), 6);
}

uint64_t sub_1A9CC3D48()
{
  char v0;

  v0 = sub_1A9CC2518();
  if (v0 == 2)
    return 2;
  else
    return v0 & 1;
}

uint64_t sub_1A9CC3D6C()
{
  char v0;

  v0 = sub_1A9CC3874();
  if (v0 == 2)
    return 2;
  else
    return v0 & 1;
}

unint64_t sub_1A9CC3D98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEB49FA8;
  if (!qword_1EEB49FA8)
  {
    v1 = sub_1A9CE600C();
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CAE8A0], v1);
    atomic_store(result, (unint64_t *)&qword_1EEB49FA8);
  }
  return result;
}

uint64_t sub_1A9CC3DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A9B92F34(0, &qword_1EEB49FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE890], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1A9CC3E40(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  NSUserActivity.route.setter(v1);
}

uint64_t sub_1A9CC3E6C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A9B90CC4(2);
  *a1 = result;
  return result;
}

void sub_1A9CC3E98(char *a1)
{
  NSUserActivity.presentWithAnimation.setter(*a1);
}

uint64_t sub_1A9CC3EBC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A9B90CC4(3);
  *a1 = result;
  return result;
}

void sub_1A9CC3EE8(char *a1)
{
  NSUserActivity.delayScrollToSchedule.setter(*a1);
}

void sub_1A9CC3F10(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  NSUserActivity.provenanceSource.setter(v1);
}

void sub_1A9CC3F40(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  NSUserActivity.provenancePresentation.setter(v1);
}

void sub_1A9CC3F70(char *a1)
{
  char v1;

  v1 = *a1;
  NSUserActivity.articleIdentifier.setter((uint64_t)&v1);
}

uint64_t sub_1A9CC3FA4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = URLComponents.route.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1A9CC3FD0@<X0>(char *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1A9CC2518();
  if (result == 2)
    v3 = 2;
  else
    v3 = result & 1;
  *a1 = v3;
  return result;
}

void sub_1A9CC4008(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  keypath_set_14Tm(a1, a2, a3, a4, 2);
}

uint64_t sub_1A9CC4010@<X0>(char *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1A9CC3874();
  if (result == 2)
    v3 = 2;
  else
    v3 = result & 1;
  *a1 = v3;
  return result;
}

void sub_1A9CC4048(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  keypath_set_14Tm(a1, a2, a3, a4, 3);
}

void keypath_set_14Tm(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  unsigned __int8 v6;

  v5 = *a1;
  if (v5 == 2)
    v6 = 2;
  else
    v6 = v5 & 1;
  sub_1A9CC2810(v6, a5);
}

uint64_t sub_1A9CC4084@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = URLComponents.provenanceSource.getter();
  *a1 = result;
  return result;
}

void sub_1A9CC40AC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A9CC2D2C(v1, 4);

}

id sub_1A9CC40EC@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = URLComponents.provenancePresentation.getter();
  *a1 = result;
  return result;
}

void sub_1A9CC4114(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_1A9CC2D2C(v1, 5);

}

uint64_t sub_1A9CC4154@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = URLComponents.articleIdentifier.getter(&v3);
  *a1 = v3;
  return result;
}

void sub_1A9CC418C(unsigned __int8 *a1)
{
  sub_1A9CC3268(*a1, 6);
}

uint64_t dispatch thunk of RouteProviding.route.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RouteOptionsProviding.presentWithAnimation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of RouteOptionsProviding.delayScrollToSchedule.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RouteProvenanceProviding.provenancePresentation.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t Collection.subscript.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  char v7;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  _BYTE v15[32];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness, v4);
  v6 = &v15[-v5];
  sub_1A9CE8538();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v7 = sub_1A9CE83A0();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, AssociatedTypeWitness);
  if ((v7 & 1) != 0)
  {
    v8 = (void (*)(_BYTE *, _QWORD))sub_1A9CE858C();
    v10 = v9;
    v11 = swift_getAssociatedTypeWitness();
    v12 = *(_QWORD *)(v11 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(a1, v10, v11);
    v8(v15, 0);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  else
  {
    v14 = swift_getAssociatedTypeWitness();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 1, 1, v14);
  }
}

uint64_t static ScheduleIssue.issues(bedtimeComponents:wakeUpComponents:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t, double);
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t result;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;

  v6 = sub_1A9CE60C0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11, v12);
  v15 = (char *)&v37 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t, double))(v7 + 16);
  v16((char *)&v37 - v14, a1, v6, v13);
  v17 = sub_1A9CE6048();
  if ((v18 & 1) != 0)
    v19 = 0;
  else
    v19 = v17;
  v20 = sub_1A9CE6084();
  v22 = v21;
  v23 = *(void (**)(char *, uint64_t))(v7 + 8);
  v23(v15, v6);
  if ((v22 & 1) != 0)
    v24 = 0;
  else
    v24 = v20;
  ((void (*)(char *, uint64_t, uint64_t))v16)(v10, a2, v6);
  v25 = sub_1A9CE6048();
  if ((v26 & 1) != 0)
    v27 = 0;
  else
    v27 = v25;
  v28 = sub_1A9CE6084();
  v30 = v29;
  v23(v10, v6);
  if ((v30 & 1) != 0)
    v31 = 0;
  else
    v31 = v28;
  result = sub_1A9BD5258(v19, v24, v27, v31);
  v34 = v33;
  if (qword_1EEB42F18 != -1)
    result = swift_once();
  v35 = *(double *)&qword_1EEB49FC8;
  if (qword_1EEB42F10 != -1)
    result = swift_once();
  if (v34 < *(double *)&qword_1EEB49FC0)
    v36 = (8 * (v35 < v34)) | 4;
  else
    v36 = 8 * (v35 < v34);
  *a3 = v36;
  return result;
}

uint64_t ScheduleIssue.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ScheduleIssue.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

SleepHealthUI::ScheduleIssue __swiftcall ScheduleIssue.init(rawValue:)(SleepHealthUI::ScheduleIssue rawValue)
{
  SleepHealthUI::ScheduleIssue *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static ScheduleIssue.bedtimeConflictsWithPreviousDayWakeUp.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static ScheduleIssue.wakeUpConflictsWithNextDayBedtime.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static ScheduleIssue.scheduleIsTooShort.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static ScheduleIssue.scheduleIsTooLong.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static ScheduleIssue.scheduleConflictsWithOverride.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static ScheduleIssue.none.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL ScheduleIssue.isForConflict.getter()
{
  _QWORD *v0;

  return (*v0 & 0x13) != 0;
}

BOOL ScheduleIssue.isCorrectable.getter()
{
  _QWORD *v0;

  return (*v0 & 0x10) != 0;
}

void sub_1A9CC463C()
{
  qword_1EEB49FC0 = 0x40AC200000000000;
}

void sub_1A9CC4650()
{
  qword_1EEB49FC8 = 0x40F1940000000000;
}

unint64_t sub_1A9CC4668()
{
  unint64_t result;

  result = qword_1EEB49FD0;
  if (!qword_1EEB49FD0)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for ScheduleIssue, &type metadata for ScheduleIssue);
    atomic_store(result, (unint64_t *)&qword_1EEB49FD0);
  }
  return result;
}

unint64_t sub_1A9CC46B0()
{
  unint64_t result;

  result = qword_1EEB49FD8;
  if (!qword_1EEB49FD8)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for ScheduleIssue, &type metadata for ScheduleIssue);
    atomic_store(result, (unint64_t *)&qword_1EEB49FD8);
  }
  return result;
}

unint64_t sub_1A9CC46F8()
{
  unint64_t result;

  result = qword_1EEB49FE0;
  if (!qword_1EEB49FE0)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for ScheduleIssue, &type metadata for ScheduleIssue);
    atomic_store(result, (unint64_t *)&qword_1EEB49FE0);
  }
  return result;
}

unint64_t sub_1A9CC4740()
{
  unint64_t result;

  result = qword_1EEB49FE8;
  if (!qword_1EEB49FE8)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for ScheduleIssue, &type metadata for ScheduleIssue);
    atomic_store(result, (unint64_t *)&qword_1EEB49FE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScheduleIssue()
{
  return &type metadata for ScheduleIssue;
}

id UIFontTextStyle.defaultFont.getter(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithPreferredContentSizeCategory_, *MEMORY[0x1E0DC4918]);
  v3 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_compatibleWithTraitCollection_, a1, v2);

  return v3;
}

id static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(uint64_t a1, uint64_t a2, char a3, char a4, char a5, char a6, char a7, uint64_t a8, char a9)
{
  objc_class *v16;
  Class v17;
  objc_class *v18;
  objc_class *v19;
  char **v20;
  uint64_t inited;
  void *v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  void *v27;
  id v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  objc_class *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  objc_class *v40;
  char v41;
  objc_class *v42;
  objc_class *v43;
  id v44;
  objc_class *v45;
  Class isa;
  id v47;
  char v49;

  v16 = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, a1);
  v17 = v16;
  if ((_DWORD)a2)
  {
    v18 = (objc_class *)-[objc_class fontDescriptorWithSymbolicTraits:](v16, sel_fontDescriptorWithSymbolicTraits_, a2);
    if (v18)
    {
      v19 = v18;

      v17 = v19;
    }
  }
  v20 = &selRef_animateWithDuration_animations_;
  v49 = a3;
  if ((a9 & 1) == 0)
  {
    sub_1A9C649F0(0, &qword_1EEB47F58, (unint64_t *)&qword_1EEB47F60, type metadata accessor for AttributeName);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1A9CEB520;
    v22 = (void *)*MEMORY[0x1E0DC13C0];
    *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC13C0];
    sub_1A9B92F34(0, &qword_1EEB49FF0, (uint64_t (*)(uint64_t))sub_1A9CC4D6C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v23 = swift_initStackObject();
    *(_OWORD *)(v23 + 16) = xmmword_1A9CEB520;
    v24 = a7;
    v25 = a5;
    v26 = a6;
    v27 = (void *)*MEMORY[0x1E0DC1458];
    *(_QWORD *)(v23 + 32) = *MEMORY[0x1E0DC1458];
    *(_QWORD *)(v23 + 40) = a8;
    v28 = v22;
    v29 = v27;
    a6 = v26;
    a5 = v25;
    a7 = v24;
    v30 = sub_1A9BAC524(v23);
    sub_1A9CC4DD8();
    *(_QWORD *)(inited + 64) = v31;
    *(_QWORD *)(inited + 40) = v30;
    sub_1A9BAC500(inited);
    type metadata accessor for AttributeName(0);
    sub_1A9B92B9C((unint64_t *)&unk_1EEB47F80, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1A9CEC2A0);
    v20 = &selRef_animateWithDuration_animations_;
    v32 = (void *)sub_1A9CE8208();
    swift_bridgeObjectRelease();
    v33 = (objc_class *)-[objc_class fontDescriptorByAddingAttributes:](v17, sel_fontDescriptorByAddingAttributes_, v32);

    v17 = v33;
  }
  if ((a7 & 1) != 0)
  {
    sub_1A9C649F0(0, &qword_1EEB47F58, (unint64_t *)&qword_1EEB47F60, type metadata accessor for AttributeName);
    v34 = swift_initStackObject();
    *(_OWORD *)(v34 + 16) = xmmword_1A9CEB520;
    v35 = (void *)*MEMORY[0x1E0DC1380];
    *(_QWORD *)(v34 + 32) = *MEMORY[0x1E0DC1380];
    v36 = v35;
    v37 = sub_1A9CC4C3C();
    sub_1A9B92F34(0, &qword_1EEB47F68, (uint64_t (*)(uint64_t))sub_1A9C55160, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    *(_QWORD *)(v34 + 64) = v38;
    *(_QWORD *)(v34 + 40) = v37;
    sub_1A9BAC500(v34);
    type metadata accessor for AttributeName(0);
    sub_1A9B92B9C((unint64_t *)&unk_1EEB47F80, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_1A9CEC2A0);
    v39 = (void *)sub_1A9CE8208();
    swift_bridgeObjectRelease();
    v40 = (objc_class *)objc_msgSend(v17, v20[328], v39);

    v17 = v40;
  }
  if ((v49 & 1) != 0)
  {
    v41 = a4;
    v42 = (objc_class *)-[objc_class fontDescriptorWithDesign:](v17, sel_fontDescriptorWithDesign_, *MEMORY[0x1E0DC13A8]);
    if (v42)
    {
      v43 = v42;

      v17 = v43;
    }
    a4 = v41;
  }
  if ((a4 & 1) != 0)
  {
    v44 = -[objc_class fontDescriptorWithSymbolicTraits:](v17, sel_fontDescriptorWithSymbolicTraits_, 0x8000);
  }
  else
  {
    if ((a5 & 1) == 0)
      goto LABEL_18;
    v44 = -[objc_class fontDescriptorWithSymbolicTraits:](v17, sel_fontDescriptorWithSymbolicTraits_, 0x10000);
  }
  v45 = (objc_class *)v44;
  if (v45)
  {

    v17 = v45;
  }
LABEL_18:
  if ((a6 & 1) != 0)
  {
    isa = UIFontDescriptor.addingUppercaseSmallCapsAttributes()().super.isa;

    v17 = isa;
  }
  v47 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fontWithDescriptor_size_, v17, 0.0);

  return v47;
}

uint64_t sub_1A9CC4C3C()
{
  uint64_t v0;
  uint64_t inited;
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  sub_1A9B92F34(0, &qword_1EEB484B0, (uint64_t (*)(uint64_t))sub_1A9C55160, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1A9CEB530;
  sub_1A9C649F0(0, &qword_1EEB484B8, &qword_1EEB484C0, type metadata accessor for FeatureKey);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A9CEB530;
  v2 = (void *)*MEMORY[0x1E0DC4A60];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC4A60];
  *(_QWORD *)(inited + 40) = 6;
  v3 = (void *)*MEMORY[0x1E0DC4A50];
  *(_QWORD *)(inited + 48) = *MEMORY[0x1E0DC4A50];
  *(_QWORD *)(inited + 56) = 0;
  v4 = v2;
  v5 = v3;
  *(_QWORD *)(v0 + 32) = sub_1A9BAC408(inited);
  v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_1A9CEB530;
  *(_QWORD *)(v6 + 32) = v4;
  *(_QWORD *)(v6 + 40) = 22;
  *(_QWORD *)(v6 + 48) = v5;
  *(_QWORD *)(v6 + 56) = 1;
  v7 = v4;
  v8 = v5;
  *(_QWORD *)(v0 + 40) = sub_1A9BAC408(v6);
  return v0;
}

void sub_1A9CC4D6C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EEB49FF8)
  {
    type metadata accessor for TraitKey(255);
    type metadata accessor for Weight(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EEB49FF8);
  }
}

void sub_1A9CC4DD8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A000)
  {
    type metadata accessor for TraitKey(255);
    type metadata accessor for Weight(255);
    sub_1A9B92B9C(&qword_1EEB434E8, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_1A9CEC25C);
    v0 = sub_1A9CE8220();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A000);
  }
}

unint64_t static ScheduleOccurrenceAlarmSoundTableViewCell.defaultReuseIdentifier.getter()
{
  return 0xD000000000000029;
}

void sub_1A9CC4F74()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD aBlock[6];

  v1 = objc_msgSend(v0, sel_textLabel);
  if (v1)
  {
    v2 = v1;
    if (qword_1ED2626A8 != -1)
      swift_once();
    v3 = (id)qword_1ED264F90;
    sub_1A9CE6168();

    v4 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setText_, v4, 0xE000000000000000);

  }
  objc_msgSend(v0, sel_setAccessoryType_, 1);
  v5 = objc_allocWithZone(MEMORY[0x1E0DC3658]);
  aBlock[4] = sub_1A9C219C0;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A9C21C90;
  aBlock[3] = &block_descriptor_38;
  v6 = _Block_copy(aBlock);
  v7 = objc_msgSend(v5, sel_initWithDynamicProvider_, v6);
  _Block_release(v6);
  swift_release();
  objc_msgSend(v0, sel_setBackgroundColor_, v7);

}

void sub_1A9CC5120()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0;
  sub_1A9BB517C(0, (unint64_t *)&qword_1ED263330, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DED1E8]);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1A9CED850;
  *(_QWORD *)(v2 + 32) = sub_1A9CE82E0();
  *(_QWORD *)(v2 + 40) = v3;
  *(_QWORD *)(v2 + 48) = 0x7065656C53;
  *(_QWORD *)(v2 + 56) = 0xE500000000000000;
  strcpy((char *)(v2 + 64), "ScheduleEditor");
  *(_BYTE *)(v2 + 79) = -18;
  v14 = v2;
  sub_1A9BB35E8((uint64_t)&unk_1E55D2DB8);
  sub_1A9BB517C(0, &qword_1ED2632C0, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DEAEC8]);
  sub_1A9BB51C4();
  v4 = sub_1A9CE8280();
  v6 = v5;
  swift_bridgeObjectRelease();
  swift_arrayDestroy();
  v7 = (void *)sub_1A9CE82B0();
  objc_msgSend(v1, sel_setAccessibilityIdentifier_, v7, v14);

  v8 = objc_msgSend(v1, sel_textLabel);
  if (v8)
  {
    v9 = v8;
    swift_bridgeObjectRetain();
    sub_1A9CE8340();
    v10 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setAccessibilityIdentifier_, v10, v4, v6);

  }
  v11 = objc_msgSend(v1, sel_detailTextLabel);
  if (v11)
  {
    v12 = v11;
    v15 = v6;
    swift_bridgeObjectRetain();
    sub_1A9CE8340();
    swift_bridgeObjectRelease();
    v13 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setAccessibilityIdentifier_, v13, v4, v15);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

id ScheduleOccurrenceAlarmSoundTableViewCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceAlarmSoundTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScheduleOccurrenceAlarmSoundTableViewCell()
{
  return objc_opt_self();
}

void ScheduleOccurrenceAlarmSoundTableViewCell.apply(_:)()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = objc_msgSend(v0, sel_detailTextLabel);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_sharedToneManager);
    if (v3)
    {
      v4 = v3;
      ScheduleOccurrenceEditModel.toneIdentifier.getter();
      if (v5)
      {
        v6 = (void *)sub_1A9CE82B0();
        swift_bridgeObjectRelease();
      }
      else
      {
        v6 = 0;
      }
      v7 = objc_msgSend(v4, sel_nameForToneIdentifier_, v6);

      objc_msgSend(v2, sel_setText_, v7);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_1A9CC54DC()
{
  ScheduleOccurrenceAlarmSoundTableViewCell.apply(_:)();
}

uint64_t method lookup function for ScheduleOccurrenceAlarmSoundTableViewCell()
{
  return swift_lookUpClassMethod();
}

uint64_t block_copy_helper_38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_38()
{
  return swift_release();
}

id static NSDateIntervalFormatter.dateIntervalWithYear.getter()
{
  return sub_1A9CC553C((SEL *)&selRef_hk_dayIntervalFormatter);
}

id static NSDateIntervalFormatter.dateIntervalWithoutYear.getter()
{
  return sub_1A9CC553C((SEL *)&selRef_hk_mediumMonthDayDateIntervalFormatter);
}

id sub_1A9CC553C(SEL *a1)
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), *a1);
  if (!result)
    __break(1u);
  return result;
}

uint64_t static NSDateIntervalFormatter.eventDateRangeString(from:endDate:)()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3590]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 3);
  objc_msgSend(v0, sel_setTimeStyle_, 0);
  v1 = (void *)sub_1A9CE6258();
  v2 = (void *)sub_1A9CE6258();
  v3 = objc_msgSend(v0, sel_stringFromDate_toDate_, v1, v2);

  v4 = sub_1A9CE82E0();
  return v4;
}

id _sSo23NSDateIntervalFormatterC13SleepHealthUIE15weeklyChartAxisABvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  void (*v11)(char *, uint64_t);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;

  sub_1A9CC5854();
  MEMORY[0x1E0C80A78](v0, v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1A9CE6360();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3590]), sel_init);
  sub_1A9CE6348();
  v10 = (void *)sub_1A9CE6330();
  v11 = *(void (**)(char *, uint64_t))(v5 + 8);
  v11(v8, v4);
  objc_msgSend(v9, sel_setLocale_, v10);

  v12 = (void *)sub_1A9CE82B0();
  v13 = objc_msgSend(v9, sel_locale);
  if (v13)
  {
    v14 = v13;
    sub_1A9CE633C();

    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v3, v8, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    {
      v15 = 0;
    }
    else
    {
      v15 = (void *)sub_1A9CE6330();
      v11(v3, v4);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    v15 = 0;
  }
  v16 = objc_msgSend((id)objc_opt_self(), sel_dateFormatFromTemplate_options_locale_, v12, 0, v15);

  objc_msgSend(v9, sel_setDateTemplate_, v16);
  return v9;
}

void sub_1A9CC5854()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED262D60)
  {
    sub_1A9CE6360();
    v0 = sub_1A9CE8880();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED262D60);
  }
}

id ScheduleOccurrenceAlarmEnabledTableViewCell.apply(_:)(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceEditModel_mutableOccurrence), sel_alarmConfiguration);
  objc_msgSend(v2, sel_mutableCopy);

  sub_1A9CE88EC();
  swift_unknownObjectRelease();
  sub_1A9BEAD34();
  swift_dynamicCast();
  v3 = objc_msgSend(v5, sel_isEnabled);

  return objc_msgSend(v1, sel_setOn_animated_, v3, 1);
}

unint64_t static ScheduleOccurrenceAlarmEnabledTableViewCell.defaultReuseIdentifier.getter()
{
  return 0xD00000000000002BLL;
}

void sub_1A9CC5A7C()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD aBlock[6];

  if (qword_1ED2626A8 != -1)
    swift_once();
  v1 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v2 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setDisplayText_, v2, 0xE000000000000000);

  v3 = objc_allocWithZone(MEMORY[0x1E0DC3658]);
  aBlock[4] = sub_1A9C219C0;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A9C21C90;
  aBlock[3] = &block_descriptor_39;
  v4 = _Block_copy(aBlock);
  v5 = objc_msgSend(v3, sel_initWithDynamicProvider_, v4);
  _Block_release(v4);
  swift_release();
  objc_msgSend(v0, sel_setBackgroundColor_, v5);

}

id ScheduleOccurrenceAlarmEnabledTableViewCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceAlarmEnabledTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScheduleOccurrenceAlarmEnabledTableViewCell()
{
  return objc_opt_self();
}

id sub_1A9CC5C3C(uint64_t a1)
{
  return ScheduleOccurrenceAlarmEnabledTableViewCell.apply(_:)(a1);
}

uint64_t method lookup function for ScheduleOccurrenceAlarmEnabledTableViewCell()
{
  return swift_lookUpClassMethod();
}

uint64_t block_copy_helper_39(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_39()
{
  return swift_release();
}

char *sub_1A9CC5C80(uint64_t a1)
{
  id v2;

  v2 = objc_allocWithZone((Class)type metadata accessor for SleepOnboardingScheduleViewController());
  return sub_1A9CC5CB4(a1, 0);
}

char *sub_1A9CC5CB4(uint64_t a1, uint64_t a2)
{
  char *v2;
  id *v5;
  void *v6;
  char *v7;
  id v8;
  double v9;
  double v10;
  double v11;
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

  *(_QWORD *)&v2[OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton] = 0;
  v5 = (id *)(a1 + 40);
  swift_beginAccess();
  v6 = *(void **)(a1 + 40);
  v7 = v2;
  v8 = v6;
  objc_msgSend(v8, sel_sleepDurationGoal);
  if (v9 <= 0.0)
  {
    v11 = *MEMORY[0x1E0DA8368] * 60.0 * 60.0;
  }
  else
  {
    objc_msgSend(*v5, sel_sleepDurationGoal);
    v11 = v10;
  }
  type metadata accessor for ScheduleOnboardingSection(0);
  swift_allocObject();
  v12 = sub_1A9C1572C(v8, a2, v11);
  v13 = OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_scheduleDataSource;
  *(_QWORD *)&v7[OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_scheduleDataSource] = v12;

  v14 = sub_1A9CC5EB0();
  v16 = v15;
  sub_1A9CC6058();
  v18 = v17;
  v20 = v19;
  v21 = *(_QWORD *)&v7[v13];
  swift_retain();
  swift_retain();
  v22 = sub_1A9CC7D1C(v14, v16, v18, v20, a1, a2, v21, 0, 2, 1, 0, (uint64_t)v7, (uint64_t (*)(char *, uint64_t, _QWORD, void *, uint64_t))sub_1A9CC80D4);
  swift_retain();
  v23 = sub_1A9C155DC();
  swift_beginAccess();
  *(_QWORD *)(v23 + 112) = &off_1E55DE340;
  swift_unknownObjectWeakAssign();
  sub_1A9BBAFB0();
  swift_release();

  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_1A9CC5EB0()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  id v8;
  uint64_t v9;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_source);
  v2 = sub_1A9CE82E0();
  v4 = v3;
  if (v2 == sub_1A9CE82E0() && v4 == v5)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v7 = sub_1A9CE8BB0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
    {
      if (qword_1ED2626A8 == -1)
        goto LABEL_10;
      goto LABEL_11;
    }
  }
  if (qword_1ED2626A8 != -1)
LABEL_11:
    swift_once();
LABEL_10:
  v8 = (id)qword_1ED264F90;
  v9 = sub_1A9CE6168();

  return v9;
}

void sub_1A9CC6058()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
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
  id v22;
  id v23;
  void *v24;
  id v25;
  unsigned int v26;

  v1 = (_QWORD *)v0;
  v2 = objc_msgSend(*(id *)(v0 + 16), sel_source);
  v3 = sub_1A9CE82E0();
  v5 = v4;
  if (v3 == sub_1A9CE82E0() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_9;
  }
  v8 = sub_1A9CE8BB0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
    goto LABEL_9;
  v9 = v1[14];
  v10 = v1[15];
  __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v9);
  v11 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 80);
  swift_retain();
  if ((v11(v9, v10) & 1) != 0)
  {
    v12 = v1[14];
    v13 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 96))(v12, v13);
    v14 = v1[14];
    v15 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v14);
    (*(void (**)(uint64_t, uint64_t))(v15 + 112))(v14, v15);
    v16 = v1[14];
    v17 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v16);
    (*(void (**)(uint64_t, uint64_t))(v17 + 120))(v16, v17);
    v18 = v1[14];
    v19 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v18);
    (*(void (**)(uint64_t, uint64_t))(v19 + 128))(v18, v19);
    v20 = v1[14];
    v21 = v1[15];
    __swift_project_boxed_opaque_existential_1Tm(v1 + 11, v20);
    (*(void (**)(uint64_t, uint64_t))(v21 + 136))(v20, v21);
    swift_release();
    goto LABEL_9;
  }
  swift_release();
  v23 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
  if (v23)
  {
    v24 = v23;
    v25 = objc_msgSend(v23, sel_features);

    if (v25)
    {
      v26 = objc_msgSend(v25, sel_timeInBedTracking);

      if (!v26)
      {
        if (qword_1ED2626A8 == -1)
          goto LABEL_10;
        goto LABEL_16;
      }
LABEL_9:
      if (qword_1ED2626A8 == -1)
      {
LABEL_10:
        v22 = (id)qword_1ED264F90;
        sub_1A9CE6168();

        return;
      }
LABEL_16:
      swift_once();
      goto LABEL_10;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_1A9CC636C()
{
  char *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  id result;
  objc_super v19;

  v1 = v0;
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for SleepOnboardingScheduleViewController();
  objc_msgSendSuper2(&v19, sel_viewDidLoad);
  v2 = &v0[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  v3 = *(_QWORD *)v2;
  swift_beginAccess();
  v4 = objc_msgSend(*(id *)(v3 + 40), sel_occurrences);
  sub_1A9B94A18(0, (unint64_t *)&qword_1EEB43540);
  v5 = sub_1A9CE83DC();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1A9CE8AC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v6)
    sub_1A9CC65C8();
  swift_retain();
  sub_1A9CC6A48();
  swift_release();
  v7 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v1, sel_hksp_addNextButtonWithTitle_, v7);

  v9 = *(void **)&v1[OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton];
  *(_QWORD *)&v1[OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton] = v8;

  sub_1A9CC6C20();
  v10 = *(void **)(*(_QWORD *)v2 + 16);
  swift_retain();
  v11 = objc_msgSend(v10, sel_source);
  v12 = sub_1A9CE82E0();
  v14 = v13;
  if (v12 == sub_1A9CE82E0() && v14 == v15)
  {
    swift_release();

    return (id)swift_bridgeObjectRelease_n();
  }
  else
  {
    v17 = sub_1A9CE8BB0();
    swift_release();

    swift_bridgeObjectRelease();
    result = (id)swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
      return objc_msgSend(v1, sel_hksp_addCancelButton);
  }
  return result;
}

void sub_1A9CC65C8()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  char v30;
  id v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  objc_class *v38;
  id v39;
  char *v40;
  char *v41;
  void *v42;
  id v43;
  uint64_t v44;
  id v45;
  id v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  _OWORD v52[2];
  uint64_t v53;

  v1 = v0;
  v2 = sub_1A9CE6444();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v47 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v44 - v8;
  v10 = &v0[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  v11 = *(_QWORD *)v10;
  swift_beginAccess();
  v12 = *(void **)(v11 + 40);
  swift_beginAccess();
  v13 = *(void **)(v11 + 56);
  if (v13)
  {
    v14 = v12;
    v15 = v13;
    sub_1A9CC7614();
    if ((v16 & 1) != 0)
      goto LABEL_6;

  }
  else
  {
    v17 = v12;
  }
  v15 = objc_msgSend(v12, sel_mutableOccurrenceTemplate);
LABEL_6:
  v18 = *(_QWORD *)v10;
  swift_beginAccess();
  v19 = *(void **)(v18 + 40);
  swift_retain();
  objc_msgSend(v19, sel_sleepDurationGoal);
  v21 = v20;
  v50 = v2;
  v51 = v1;
  v49 = v3;
  v48 = v9;
  if (v20 > 0.0)
  {
    objc_msgSend(*(id *)(v18 + 40), sel_sleepDurationGoal);
    v22 = v23;
    swift_release();
  }
  else
  {
    swift_release();
    v22 = 0;
  }
  *(_QWORD *)&v52[0] = v22;
  BYTE8(v52[0]) = v21 <= 0.0;
  sub_1A9CC7C78(0, (unint64_t *)&qword_1ED2628C0, (void (*)(uint64_t))sub_1A9C142BC);
  swift_allocObject();
  v24 = sub_1A9CE6DF8();
  v25 = v15;
  v45 = objc_msgSend(v12, sel_weekdaysWithOccurrences);
  *(_QWORD *)&v52[0] = v12;
  sub_1A9CC7C78(0, (unint64_t *)&qword_1ED2628D0, (void (*)(uint64_t))sub_1A9CA5FFC);
  swift_allocObject();
  v46 = v12;
  v26 = sub_1A9CE6DF8();
  v27 = *(_QWORD *)(*(_QWORD *)v10 + 112);
  v28 = *(_QWORD *)(*(_QWORD *)v10 + 120);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(*(_QWORD *)v10 + 88), v27);
  v29 = *(uint64_t (**)(uint64_t, uint64_t))(v28 + 104);
  swift_retain();
  swift_retain();
  v30 = v29(v27, v28);
  swift_release();
  v31 = objc_msgSend(*(id *)(*(_QWORD *)v10 + 72), sel_currentCalendar);
  v32 = v48;
  sub_1A9CE63D8();

  v33 = v49;
  v34 = (uint64_t)v47;
  v35 = v50;
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v47, v32, v50);
  type metadata accessor for ScheduleOccurrenceEditModel();
  swift_allocObject();
  v36 = v25;
  swift_retain();
  swift_retain();
  v37 = sub_1A9BD5470(v36, 1, 0, (uint64_t)v45, v24, v26, v30 & 1, v34);

  swift_release();
  swift_release();
  v38 = (objc_class *)type metadata accessor for ScheduleOccurrenceViewController();
  memset(v52, 0, sizeof(v52));
  v53 = 0;
  v39 = objc_allocWithZone(v38);
  v40 = (char *)sub_1A9B92438(v37, 0, (uint64_t)v52);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v32, v35);
  v41 = &v40[OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_delegate];
  swift_beginAccess();
  *((_QWORD *)v41 + 1) = &off_1E55DE350;
  v42 = v51;
  swift_unknownObjectWeakAssign();
  v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F7B8]), sel_initWithRootViewController_, v40);
  sub_1A9C78920(2, 2);
  objc_msgSend(v42, sel_presentViewController_animated_completion_, v43, 1, 0);

  swift_release();
}

uint64_t sub_1A9CC6A48()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  id v8;
  uint64_t v9;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_source);
  v2 = sub_1A9CE82E0();
  v4 = v3;
  if (v2 == sub_1A9CE82E0() && v4 == v5)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v7 = sub_1A9CE8BB0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
    {
      if (qword_1ED2626A8 == -1)
        goto LABEL_10;
      goto LABEL_11;
    }
  }
  if (qword_1ED2626A8 != -1)
LABEL_11:
    swift_once();
LABEL_10:
  v8 = (id)qword_1ED264F90;
  v9 = sub_1A9CE6168();

  return v9;
}

void sub_1A9CC6C20()
{
  uint64_t v0;
  void *v1;
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC13SleepHealthUI37SleepOnboardingScheduleViewController_nextButton);
  if (v1)
  {
    v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo);
    swift_beginAccess();
    v3 = *v2;
    swift_beginAccess();
    v4 = *(void **)(v3 + 40);
    v5 = v1;
    v6 = objc_msgSend(v4, sel_occurrences);
    sub_1A9B94A18(0, (unint64_t *)&qword_1EEB43540);
    v7 = sub_1A9CE83DC();

    v14 = MEMORY[0x1E0DEE9D8];
    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1A9CE8AC0();
      swift_bridgeObjectRelease();
      if (v8)
      {
LABEL_4:
        if (v8 < 1)
        {
          __break(1u);
          return;
        }
        for (i = 0; i != v8; ++i)
        {
          if ((v7 & 0xC000000000000001) != 0)
            v10 = (id)MEMORY[0x1AF41F600](i, v7);
          else
            v10 = *(id *)(v7 + 8 * i + 32);
          v11 = v10;
          if ((objc_msgSend(v10, sel_isSingleDayOverride) & 1) != 0)
          {

          }
          else
          {
            sub_1A9CE89F4();
            sub_1A9CE8A24();
            sub_1A9CE8A30();
            sub_1A9CE8A00();
          }
        }
        swift_bridgeObjectRelease();
        v12 = v14;
        if (v14 < 0)
          goto LABEL_21;
LABEL_17:
        if ((v12 & 0x4000000000000000) == 0)
        {
          v13 = *(_QWORD *)(v12 + 16);
LABEL_19:
          swift_release();
          objc_msgSend(v5, sel_setEnabled_, v13 > 0);

          return;
        }
LABEL_21:
        swift_bridgeObjectRetain();
        v13 = sub_1A9CE8AC0();
        swift_release();
        goto LABEL_19;
      }
    }
    else
    {
      v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v8)
        goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x1E0DEE9D8];
    if ((MEMORY[0x1E0DEE9D8] & 0x8000000000000000) != 0)
      goto LABEL_21;
    goto LABEL_17;
  }
}

id sub_1A9CC6E8C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  uint64_t v16;
  uint64_t v17;
  id *v18;
  void *v19;
  double *v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  double v26;
  uint64_t v28;
  double v29;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo);
  swift_beginAccess();
  v2 = *v1;
  swift_beginAccess();
  v3 = *(unsigned __int8 *)(v2 + 80);
  swift_beginAccess();
  v4 = objc_msgSend(*(id *)(v2 + 40), sel_isDefaultSchedule);
  v5 = 2;
  if (v4)
    v5 = 3;
  if (v3 == 1)
    v6 = 4;
  else
    v6 = v5;
  sub_1A9C78920(3, v6);
  v7 = *v1;
  swift_beginAccess();
  v8 = *(void **)(v7 + 40);
  swift_retain();
  objc_msgSend(v8, sel_sleepDurationGoal);
  v10 = v9;
  if (v9 <= 0.0)
  {
    swift_release();
    v13 = 0.0;
  }
  else
  {
    objc_msgSend(*(id *)(v7 + 40), sel_sleepDurationGoal);
    v12 = v11;
    swift_release();
    v13 = v12 / 60.0 / 60.0;
  }
  v14 = (double *)MEMORY[0x1E0DA8368];
  if (v13 != *MEMORY[0x1E0DA8368] || v10 <= 0.0)
    v16 = 2;
  else
    v16 = 3;
  sub_1A9C78920(4, v16);
  v17 = *v1;
  v18 = (id *)(*v1 + 40);
  swift_beginAccess();
  v19 = *(void **)(v17 + 40);
  swift_retain();
  objc_msgSend(v19, sel_windDownTime);
  v20 = (double *)MEMORY[0x1E0DA84A8];
  if (v21 == 0.0)
    objc_msgSend(*v18, sel_setWindDownTime_, *MEMORY[0x1E0DA84A8] * 60.0);
  swift_release();
  v22 = *v1;
  v23 = *v20 * 60.0;
  swift_beginAccess();
  objc_msgSend(*(id *)(v22 + 40), sel_setWindDownTime_, v23);
  v24 = *v1;
  swift_beginAccess();
  v25 = *(void **)(v24 + 40);
  swift_retain();
  objc_msgSend(v25, sel_sleepDurationGoal);
  if (v26 <= 0.0)
  {
    swift_release();
    v28 = *v1;
    v29 = *v14 * 60.0 * 60.0;
    swift_beginAccess();
    return objc_msgSend(*(id *)(v28 + 40), sel_setSleepDurationGoal_, v29);
  }
  else
  {
    objc_msgSend(*(id *)(v24 + 40), sel_sleepDurationGoal);
    return (id)swift_release();
  }
}

void sub_1A9CC7130()
{
  char *v0;
  char *v1;
  char *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t ObjectType;
  void (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30[3];

  v1 = v0;
  swift_getObjectType();
  v2 = &v0[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  v3 = *(void **)(*(_QWORD *)v2 + 16);
  swift_retain();
  v4 = objc_msgSend(v3, sel_source);
  v5 = sub_1A9CE82E0();
  v7 = v6;
  if (v5 == sub_1A9CE82E0() && v7 == v8)
  {
    swift_release();

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v10 = sub_1A9CE8BB0();
    swift_release();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      v11 = objc_allocWithZone((Class)type metadata accessor for SleepOnboardingConfirmationViewController());
      v12 = swift_retain();
      v13 = sub_1A9CBA128(v12);
      v14 = &v1[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate];
      swift_beginAccess();
      v15 = *(_QWORD *)v14;
      v16 = *((_QWORD *)v14 + 1);
      v17 = &v13[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate];
      swift_beginAccess();
      *(_QWORD *)v17 = v15;
      *((_QWORD *)v17 + 1) = v16;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
      objc_msgSend(v1, sel_showViewController_sender_, v13, 0);

      return;
    }
  }
  if (qword_1EEB42E98 != -1)
    swift_once();
  v18 = sub_1A9CE6990();
  __swift_project_value_buffer(v18, (uint64_t)qword_1EEB49488);
  v19 = sub_1A9CE6978();
  v20 = sub_1A9CE867C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v30[0] = v22;
    *(_DWORD *)v21 = 136446210;
    v23 = sub_1A9CE8D48();
    sub_1A9B91D6C(v23, v24, v30);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v19, v20, "[%{public}s] we're done!", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v22, -1, -1);
    MEMORY[0x1AF420344](v21, -1, -1);
  }

  v25 = &v1[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate];
  swift_beginAccess();
  if (*(_QWORD *)v25)
  {
    v26 = *((_QWORD *)v25 + 1);
    ObjectType = swift_getObjectType();
    v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
    swift_unknownObjectRetain();
    v29 = swift_retain();
    v28(v29, ObjectType, v26);
    swift_release();
    swift_unknownObjectRelease();
  }
}

uint64_t sub_1A9CC7560()
{
  uint64_t v0;

  return swift_release();
}

id sub_1A9CC758C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SleepOnboardingScheduleViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SleepOnboardingScheduleViewController()
{
  return objc_opt_self();
}

void sub_1A9CC7614()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = objc_msgSend(v0, sel_occurrences);
  sub_1A9B94A18(0, (unint64_t *)&qword_1EEB43540);
  v2 = sub_1A9CE83DC();

  v8 = MEMORY[0x1E0DEE9D8];
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x1E0DEE9D8];
    if ((MEMORY[0x1E0DEE9D8] & 0x8000000000000000) != 0)
      goto LABEL_18;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v3 = sub_1A9CE8AC0();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_15;
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1AF41F600](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      if (objc_msgSend(v5, sel_isRepeating))
      {
        sub_1A9CE89F4();
        sub_1A9CE8A24();
        sub_1A9CE8A30();
        sub_1A9CE8A00();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    v7 = v8;
    if (v8 < 0)
      goto LABEL_18;
LABEL_16:
    if ((v7 & 0x4000000000000000) == 0)
    {
LABEL_17:
      swift_release();
      return;
    }
LABEL_18:
    swift_bridgeObjectRetain();
    sub_1A9CE8AC0();
    swift_release();
    goto LABEL_17;
  }
  __break(1u);
}

void sub_1A9CC77D0(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  char v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  objc_class *v29;
  id v30;
  char *v31;
  char *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _OWORD v41[2];
  uint64_t v42;
  void *v43;

  v39 = sub_1A9CE6444();
  v38 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39, v3);
  v37 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v35 - v7;
  v40 = v1;
  v9 = &v1[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  v10 = *(_QWORD *)v9;
  swift_beginAccess();
  v11 = *(id *)(v10 + 40);
  swift_retain();
  objc_msgSend(v11, sel_sleepDurationGoal);
  v13 = v12;
  if (v12 > 0.0)
  {
    objc_msgSend(*(id *)(v10 + 40), sel_sleepDurationGoal);
    v14 = v15;
    swift_release();
  }
  else
  {
    swift_release();
    v14 = 0;
  }
  *(_QWORD *)&v41[0] = v14;
  BYTE8(v41[0]) = v13 <= 0.0;
  sub_1A9CC7C78(0, (unint64_t *)&qword_1ED2628C0, (void (*)(uint64_t))sub_1A9C142BC);
  swift_allocObject();
  v16 = sub_1A9CE6DF8();
  objc_msgSend(a1, sel_mutableCopy);
  sub_1A9CE88EC();
  swift_unknownObjectRelease();
  sub_1A9B94A18(0, (unint64_t *)&unk_1EEB4A1D0);
  swift_dynamicCast();
  v17 = v43;
  v35 = objc_msgSend(v11, sel_weekdaysWithOccurrences);
  *(_QWORD *)&v41[0] = v11;
  sub_1A9CC7C78(0, (unint64_t *)&qword_1ED2628D0, (void (*)(uint64_t))sub_1A9CA5FFC);
  swift_allocObject();
  v36 = v11;
  v18 = sub_1A9CE6DF8();
  v19 = *(_QWORD *)(*(_QWORD *)v9 + 112);
  v20 = *(_QWORD *)(*(_QWORD *)v9 + 120);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(*(_QWORD *)v9 + 88), v19);
  v21 = *(uint64_t (**)(uint64_t, uint64_t))(v20 + 104);
  swift_retain();
  swift_retain();
  v22 = v21(v19, v20);
  swift_release();
  v23 = objc_msgSend(*(id *)(*(_QWORD *)v9 + 72), sel_currentCalendar);
  sub_1A9CE63D8();

  v24 = v38;
  v25 = (uint64_t)v37;
  v26 = v39;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v37, v8, v39);
  type metadata accessor for ScheduleOccurrenceEditModel();
  swift_allocObject();
  swift_retain();
  v27 = v17;
  swift_retain();
  v28 = sub_1A9BD5470(v27, 0, 0, (uint64_t)v35, v16, v18, v22 & 1, v25);

  swift_release();
  swift_release();
  v29 = (objc_class *)type metadata accessor for ScheduleOccurrenceViewController();
  memset(v41, 0, sizeof(v41));
  v42 = 0;
  v30 = objc_allocWithZone(v29);
  v31 = (char *)sub_1A9B92438(v28, 1, (uint64_t)v41);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v26);
  v32 = &v31[OBJC_IVAR____TtC13SleepHealthUI32ScheduleOccurrenceViewController_delegate];
  swift_beginAccess();
  *((_QWORD *)v32 + 1) = &off_1E55DE350;
  v33 = v40;
  swift_unknownObjectWeakAssign();
  v34 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D2F7B8]), sel_initWithRootViewController_, v31);
  objc_msgSend(v33, sel_presentViewController_animated_completion_, v34, 1, 0);

  swift_release();
}

void sub_1A9CC7C18()
{
  sub_1A9CC65C8();
}

void sub_1A9CC7C38(void *a1)
{
  sub_1A9CC77D0(a1);
}

void sub_1A9CC7C58(uint64_t a1, uint64_t a2, char a3)
{
  sub_1A9CC8454(a2, a3);
}

void sub_1A9CC7C64(uint64_t a1, uint64_t a2)
{
  sub_1A9CC883C(a2);
}

void sub_1A9CC7C70(char a1, double a2)
{
  sub_1A9CC8C60(a1 & 1, a2);
}

void sub_1A9CC7C78(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1A9CE6DEC();
    if (!v5)
      atomic_store(v4, a2);
  }
}

char *sub_1A9CC7CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, char a10, void *a11, uint64_t a12)
{
  return sub_1A9CC7D1C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, (uint64_t (*)(char *, uint64_t, _QWORD, void *, uint64_t))sub_1A9CC8294);
}

char *sub_1A9CC7D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, char a10, void *a11, uint64_t a12, uint64_t (*a13)(char *, uint64_t, _QWORD, void *, uint64_t))
{
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  char *result;
  char *v24;
  char *v25;
  uint64_t v26;
  id v27;
  char *v28;
  id v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  id v35;
  __int128 v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[4];

  v19 = (_QWORD *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_delegate);
  *v19 = 0;
  v19[1] = 0;
  *(_QWORD *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_dataSourceAdaptor) = 0;
  *(_QWORD *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_sleepChangeObserver) = 0;
  *(_QWORD *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo) = a5;
  *(_QWORD *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_presentationStyle) = a6;
  v20 = (_QWORD *)(a12 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_dataSource);
  v21 = MEMORY[0x1E0D2B148];
  *v20 = a7;
  v20[1] = v21;
  v35 = a8;
  swift_retain();
  swift_retain();
  v22 = (char *)SleepTableWelcomeController.init(title:detailText:icon:tableViewStyle:hasSystemMargins:)(a1, a2, a3, a4, a8, a9, 0);
  result = (char *)objc_msgSend(v22, sel_tableView);
  if (!result)
  {
    __break(1u);
    goto LABEL_9;
  }
  v24 = result;
  objc_msgSend(result, sel_setDelegate_, v22);

  result = (char *)objc_msgSend(v22, sel_tableView);
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v25 = result;
  type metadata accessor for SleepDiffableTableViewAdaptor();
  v26 = swift_allocObject();
  v27 = a11;
  swift_retain();
  *(_QWORD *)&v22[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_dataSourceAdaptor] = a13(v25, a7, a10 & 1, a11, v26);
  swift_release();
  v38 = a7;
  v39 = MEMORY[0x1E0D2B148];
  sub_1A9BF9A0C(0, &qword_1EEB4A0A0);
  sub_1A9BF9A0C(0, &qword_1EEB4A0A8);
  swift_retain();
  if (!swift_dynamicCast())
  {
    v37 = 0;
    memset(v36, 0, sizeof(v36));
    sub_1A9CC8D6C((uint64_t)v36);
    goto LABEL_7;
  }
  sub_1A9B949B8(v36, (uint64_t)v40);
  __swift_project_boxed_opaque_existential_1Tm(v40, v40[3]);
  result = (char *)objc_msgSend(v22, sel_tableView);
  if (result)
  {
    v28 = result;
    sub_1A9CE68C4();

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v40);
LABEL_7:
    objc_msgSend(v22, sel_setModalInPresentation_, 1);
    v29 = objc_msgSend(v22, sel_headerView);
    LODWORD(v30) = 0;
    objc_msgSend(v29, sel_setTitleHyphenationFactor_, v30);

    sub_1A9BC09A4();
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1A9CEB520;
    v32 = sub_1A9CE6AB0();
    v33 = MEMORY[0x1E0DC29B0];
    *(_QWORD *)(v31 + 32) = v32;
    *(_QWORD *)(v31 + 40) = v33;
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1A9B92FDC();
    v34 = v22;
    sub_1A9CE86E8();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    swift_release();
    swift_release();

    return v34;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t *sub_1A9CC80D4(void *a1, uint64_t a2, char a3, void *a4, uint64_t *a5)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;

  v9 = *a5;
  *(_WORD *)((char *)a5 + 49) = 0;
  v10 = (_QWORD *)swift_allocObject();
  v11 = MEMORY[0x1E0D2B148];
  v10[2] = a2;
  v10[3] = v11;
  v10[4] = a4;
  v10[5] = v9;
  v12 = (char *)objc_allocWithZone((Class)type metadata accessor for SleepDiffableTableViewDataSource());
  *(_QWORD *)&v12[qword_1EEB45BD8 + 8] = 0;
  swift_unknownObjectWeakInit();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1A9CC8E40;
  *(_QWORD *)(v13 + 24) = v10;
  v14 = a4;
  v15 = a1;
  swift_retain();
  swift_retain();
  v16 = (void *)sub_1A9CE6A68();
  a5[4] = v11;
  a5[5] = (uint64_t)v16;
  *((_BYTE *)a5 + 48) = a3;
  a5[2] = (uint64_t)a4;
  a5[3] = a2;
  swift_retain();
  v17 = v14;
  v18 = v16;
  sub_1A9CE6A80();

  *(_QWORD *)(a5[5] + qword_1EEB45BD8 + 8) = v11;
  swift_unknownObjectWeakAssign();
  type metadata accessor for ScheduleOnboardingSection(0);
  v19 = (void *)sub_1A9CE67A4();
  swift_retain();
  objc_msgSend(v19, sel_registerObserver_, a5);
  swift_release();

  swift_release();
  swift_release();

  return a5;
}

uint64_t *sub_1A9CC8294(void *a1, uint64_t a2, char a3, void *a4, uint64_t *a5)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;

  v9 = *a5;
  *(_WORD *)((char *)a5 + 49) = 0;
  v10 = (_QWORD *)swift_allocObject();
  v11 = MEMORY[0x1E0D2B148];
  v10[2] = a2;
  v10[3] = v11;
  v10[4] = a4;
  v10[5] = v9;
  v12 = (char *)objc_allocWithZone((Class)type metadata accessor for SleepDiffableTableViewDataSource());
  *(_QWORD *)&v12[qword_1EEB45BD8 + 8] = 0;
  swift_unknownObjectWeakInit();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1A9CC8F2C;
  *(_QWORD *)(v13 + 24) = v10;
  v14 = a4;
  v15 = a1;
  swift_retain();
  swift_retain();
  v16 = (void *)sub_1A9CE6A68();
  a5[4] = v11;
  a5[5] = (uint64_t)v16;
  *((_BYTE *)a5 + 48) = a3;
  a5[2] = (uint64_t)a4;
  a5[3] = a2;
  swift_retain();
  v17 = v14;
  v18 = v16;
  sub_1A9CE6A80();

  *(_QWORD *)(a5[5] + qword_1EEB45BD8 + 8) = v11;
  swift_unknownObjectWeakAssign();
  type metadata accessor for ConfirmationOnboardingSection();
  v19 = (void *)sub_1A9CE67A4();
  swift_retain();
  objc_msgSend(v19, sel_registerObserver_, a5);
  swift_release();

  swift_release();
  swift_release();

  return a5;
}

void sub_1A9CC8454(uint64_t a1, char a2)
{
  char *v2;
  void *v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint8_t *v31;
  char v32;
  uint64_t v33[6];
  uint64_t v34[3];

  v3 = v2;
  swift_getObjectType();
  if (qword_1ED262DB8 != -1)
    swift_once();
  v6 = sub_1A9CE6990();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED2630B8);
  v7 = sub_1A9CE6978();
  v8 = sub_1A9CE867C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v32 = a2;
    v10 = swift_slowAlloc();
    v34[0] = v10;
    *(_DWORD *)v9 = 136446210;
    v11 = sub_1A9CE8D48();
    v33[3] = sub_1A9B91D6C(v11, v12, v34);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v7, v8, "[%{public}s] Schedule occurrence was modified", v9, 0xCu);
    swift_arrayDestroy();
    v13 = v10;
    a2 = v32;
    MEMORY[0x1AF420344](v13, -1, -1);
    MEMORY[0x1AF420344](v9, -1, -1);
  }

  v14 = &v2[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  v15 = *(_QWORD *)v14;
  swift_beginAccess();
  v16 = *(id *)(v15 + 40);
  v17 = v16;
  if ((a2 & 1) != 0)
  {
    v18 = objc_msgSend(v16, sel_overrideOccurrence);
    if (v18)
    {
      v19 = v18;
      v20 = sub_1A9CE6978();
      v21 = sub_1A9CE867C();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v33[0] = v23;
        *(_DWORD *)v22 = 136446210;
        v31 = v22 + 4;
        v24 = sub_1A9CE8D48();
        sub_1A9B91D6C(v24, v25, v33);
        sub_1A9CE888C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1A9B87000, v20, v21, "[%{public}s] Removing override", v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1AF420344](v23, -1, -1);
        MEMORY[0x1AF420344](v22, -1, -1);
      }

      objc_msgSend(v17, sel_removeOccurrence_, v19);
    }
  }
  objc_msgSend(v17, sel_saveOccurrence_, a1, v31);
  v26 = *(_QWORD *)v14;
  swift_beginAccess();
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v17;
  v28 = v17;

  v29 = *(_QWORD *)v14;
  swift_beginAccess();
  *(_BYTE *)(v29 + 80) = 4;
  v30 = v28;
  sub_1A9CE6DE0();
  sub_1A9C148CC();
  sub_1A9CC6C20();
  objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

void sub_1A9CC883C(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19[3];

  v2 = v1;
  swift_getObjectType();
  if (qword_1ED262DB8 != -1)
    swift_once();
  v4 = sub_1A9CE6990();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED2630B8);
  v5 = sub_1A9CE6978();
  v6 = sub_1A9CE867C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v19[0] = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_1A9CE8D48();
    sub_1A9B91D6C(v9, v10, v19);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v5, v6, "[%{public}s] Schedule occurrence was deleted", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v8, -1, -1);
    MEMORY[0x1AF420344](v7, -1, -1);
  }

  v11 = &v2[OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo];
  swift_beginAccess();
  v12 = *(_QWORD *)v11;
  swift_beginAccess();
  v13 = *(id *)(v12 + 40);
  objc_msgSend(v13, sel_removeOccurrence_, a1);
  v14 = *(_QWORD *)v11;
  swift_beginAccess();
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;
  v16 = v13;

  v17 = *(_QWORD *)v11;
  swift_beginAccess();
  *(_BYTE *)(v17 + 80) = 4;
  v18 = v16;
  sub_1A9CE6DE0();
  sub_1A9C148CC();
  sub_1A9CC6C20();
  objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

id sub_1A9CC8AC8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v1 = v0;
  swift_getObjectType();
  if (qword_1ED262DB8 != -1)
    swift_once();
  v2 = sub_1A9CE6990();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED2630B8);
  v3 = sub_1A9CE6978();
  v4 = sub_1A9CE867C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10 = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = sub_1A9CE8D48();
    sub_1A9B91D6C(v7, v8, &v10);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v3, v4, "[%{public}s] Schedule occurrence edits were cancelled", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v6, -1, -1);
    MEMORY[0x1AF420344](v5, -1, -1);
  }

  return objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

void sub_1A9CC8C60(char a1, double a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  void *v8;
  char **v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC13SleepHealthUI38SleepOnboardingFlowTableViewController_userInfo);
  swift_beginAccess();
  v6 = *v5;
  swift_beginAccess();
  v7 = *(id *)(v6 + 40);
  v8 = v7;
  v9 = &selRef_setSleepDurationGoal_;
  if ((a1 & 1) != 0)
    v9 = &selRef_setWindDownTime_;
  objc_msgSend(v7, *v9, a2);
  v10 = *v5;
  swift_beginAccess();
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v12 = v8;

  v13 = v12;
  sub_1A9CE6DE0();
  sub_1A9C148CC();

}

uint64_t sub_1A9CC8D6C(uint64_t a1)
{
  uint64_t v2;

  sub_1A9CC8DA8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A9CC8DA8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A0B0)
  {
    sub_1A9BF9A0C(255, &qword_1EEB4A0A8);
    v0 = sub_1A9CE8880();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A0B0);
  }
}

uint64_t sub_1A9CC8E10()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1A9CC8E34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A9C58D1C(a1, a2, v2);
}

id sub_1A9CC8E40(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t *v4;

  return sub_1A9C06940(a1, a2, a3, a4, v4[2], v4[3], v4[4], v4[5]);
}

uint64_t sub_1A9CC8E4C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v3 + 16))(a1, a2, *a3, a3[1]);
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1A9CC8EA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CC8EC8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1A9CC8EEC()
{
  sub_1A9C78920(3, 1);
}

uint64_t block_copy_helper_40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_40()
{
  return swift_release();
}

void sub_1A9CC8F38(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1A9CC8F40()
{
  sub_1A9CC9114();
  return sub_1A9CE70B0();
}

BOOL static DiagramVariant.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DiagramVariant.hash(into:)()
{
  return sub_1A9CE8C58();
}

uint64_t DiagramVariant.hashValue.getter()
{
  sub_1A9CE8C4C();
  sub_1A9CE8C58();
  return sub_1A9CE8C7C();
}

uint64_t EnvironmentValues.diagramVariant.getter()
{
  sub_1A9BC7D48();
  return sub_1A9CE7368();
}

uint64_t EnvironmentValues.diagramVariant.setter()
{
  sub_1A9BC7D48();
  return sub_1A9CE7374();
}

uint64_t (*EnvironmentValues.diagramVariant.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;

  *a1 = v1;
  a1[1] = sub_1A9BC7D48();
  sub_1A9CE7368();
  return sub_1A9CC90DC;
}

uint64_t sub_1A9CC90DC(uint64_t a1)
{
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a1 + 16);
  return sub_1A9CE7374();
}

unint64_t sub_1A9CC9114()
{
  unint64_t result;

  result = qword_1EEB4A0B8;
  if (!qword_1EEB4A0B8)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for DiagramVariant, &type metadata for DiagramVariant);
    atomic_store(result, (unint64_t *)&qword_1EEB4A0B8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DiagramVariant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A9CC91AC + 4 * byte_1A9CF6FB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A9CC91E0 + 4 * byte_1A9CF6FB0[v4]))();
}

uint64_t sub_1A9CC91E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9CC91E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A9CC91F0);
  return result;
}

uint64_t sub_1A9CC91FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A9CC9204);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A9CC9208(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9CC9210(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DiagramVariant()
{
  return &type metadata for DiagramVariant;
}

ValueMetadata *type metadata accessor for DiagramVariantKey()
{
  return &type metadata for DiagramVariantKey;
}

void sub_1A9CC9240(char a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(v1, sel_presentedViewController);
  if (v3)
  {
    v5 = v3;
    objc_opt_self();
    v4 = (void *)swift_dynamicCastObjCClass();
    if (v4)
      objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, a1 & 1, 0);

  }
}

id sub_1A9CC92C8(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  os_log_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  char *v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  id v42;
  os_log_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  BOOL v57;
  uint8_t *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  char **v66;
  uint64_t v67;
  _QWORD *v68;
  id v69;
  id v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t, uint64_t);
  void (*v82)(char *, uint64_t);
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87[5];

  v3 = v2;
  v80 = a2;
  v87[4] = *MEMORY[0x1E0C80C00];
  v5 = sub_1A9CE62E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v83 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v74 - v11;
  swift_retain();
  sub_1A9CE6DD4();
  swift_release();
  v13 = (id)v87[0];
  if (!v87[0])
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DA8568]), sel_init);
  if (qword_1ED2628A0 != -1)
    swift_once();
  v14 = sub_1A9CE6990();
  v15 = __swift_project_value_buffer(v14, (uint64_t)qword_1ED262888);
  v81 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v81(v12, a1, v5);
  v16 = v13;
  v85 = v15;
  v17 = sub_1A9CE6978();
  v18 = sub_1A9CE867C();
  v19 = os_log_type_enabled(v17, v18);
  v84 = a1;
  if (v19)
  {
    v20 = swift_slowAlloc();
    v77 = v17;
    v21 = v20;
    v22 = swift_slowAlloc();
    v79 = v3;
    v23 = (_QWORD *)v22;
    v78 = swift_slowAlloc();
    v87[0] = v78;
    *(_DWORD *)v21 = 136446722;
    v86 = sub_1A9B91D6C(0xD000000000000015, 0x80000001A9D002C0, v87);
    v24 = v5;
    sub_1A9CE888C();
    *(_WORD *)(v21 + 12) = 2114;
    v25 = v16;
    v26 = sub_1A9CE6258();
    v86 = v26;
    sub_1A9CE888C();
    *v23 = v26;
    v82 = *(void (**)(char *, uint64_t))(v6 + 8);
    v82(v12, v5);
    *(_WORD *)(v21 + 22) = 2114;
    v86 = (uint64_t)v16;
    v27 = v16;
    sub_1A9CE888C();
    v23[1] = v25;

    v16 = v25;
    a1 = v84;
    v28 = v77;
    _os_log_impl(&dword_1A9B87000, v77, v18, "[%{public}s] generating editable override occcurence for current date: %{public}@ and schedule: %{public}@", (uint8_t *)v21, 0x20u);
    sub_1A9BEFFB8();
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v23, -1, -1);
    v29 = v78;
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v29, -1, -1);
    MEMORY[0x1AF420344](v21, -1, -1);

    v30 = v24;
  }
  else
  {
    v82 = *(void (**)(char *, uint64_t))(v6 + 8);
    v82(v12, v5);

    v30 = v5;
  }
  v31 = sub_1A9C6DAC4();
  v32 = (void *)sub_1A9CE6258();
  v33 = objc_msgSend(v31, sel_upcomingResolvedOccurrenceAfterDate_, v32);

  v34 = v83;
  v81(v83, a1, v30);
  v35 = v33;
  v36 = sub_1A9CE6978();
  v37 = sub_1A9CE867C();
  if (os_log_type_enabled(v36, v37))
  {
    v77 = v36;
    v78 = (uint64_t)v31;
    v79 = v16;
    v38 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v75 = v30;
    v40 = (_QWORD *)v39;
    v76 = swift_slowAlloc();
    v87[0] = v76;
    *(_DWORD *)v38 = 136446722;
    v86 = sub_1A9B91D6C(0xD000000000000015, 0x80000001A9D002C0, v87);
    sub_1A9CE888C();
    *(_WORD *)(v38 + 12) = 2114;
    v41 = sub_1A9CE6258();
    v86 = v41;
    sub_1A9CE888C();
    *v40 = v41;
    v82(v34, v75);
    *(_WORD *)(v38 + 22) = 2114;
    if (v35)
    {
      v86 = (uint64_t)v35;
      v42 = v35;
      sub_1A9CE888C();
    }
    else
    {
      v86 = 0;
      sub_1A9CE888C();
      v33 = 0;
    }
    v16 = v79;
    v40[1] = v33;

    v43 = v77;
    _os_log_impl(&dword_1A9B87000, v77, v37, "[%{public}s] upcoming resolved occurrence after date: %{public}@ is: %{public}@", (uint8_t *)v38, 0x20u);
    sub_1A9BEFFB8();
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v40, -1, -1);
    v44 = v76;
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v44, -1, -1);
    MEMORY[0x1AF420344](v38, -1, -1);

    v31 = (id)v78;
    if (!v35)
      goto LABEL_21;
  }
  else
  {
    v82(v34, v30);

    if (!v35)
      goto LABEL_21;
  }
  v45 = objc_msgSend(v35, sel_occurrence);
  if (v45)
  {
    v46 = v45;
    if (objc_msgSend(v45, sel_isSingleDayOverride))
    {
      v47 = v31;
      v48 = sub_1A9CE6978();
      v49 = sub_1A9CE867C();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = (uint8_t *)swift_slowAlloc();
        v51 = v35;
        v52 = swift_slowAlloc();
        v87[0] = v52;
        *(_DWORD *)v50 = 136446210;
        v86 = sub_1A9B91D6C(0xD000000000000015, 0x80000001A9D002C0, v87);
        sub_1A9CE888C();
        _os_log_impl(&dword_1A9B87000, v48, v49, "[%{public}s] upcoming resolved occurrence is single day override, returning", v50, 0xCu);
        swift_arrayDestroy();
        v53 = v52;
        v35 = v51;
        MEMORY[0x1AF420344](v53, -1, -1);
        MEMORY[0x1AF420344](v50, -1, -1);
      }

      objc_msgSend(v46, sel_mutableCopy);
      sub_1A9CE88EC();

      swift_unknownObjectRelease();
      sub_1A9B94A18(0, (unint64_t *)&unk_1EEB4A1D0);
      swift_dynamicCast();
      return (id)v86;
    }

  }
LABEL_21:
  v55 = sub_1A9CE6978();
  v56 = sub_1A9CE867C();
  v57 = os_log_type_enabled(v55, v56);
  v81 = (void (*)(char *, uint64_t, uint64_t))v35;
  if (v57)
  {
    v58 = (uint8_t *)swift_slowAlloc();
    v59 = swift_slowAlloc();
    v87[0] = v59;
    *(_DWORD *)v58 = 136446210;
    v86 = sub_1A9B91D6C(0xD000000000000015, 0x80000001A9D002C0, v87);
    sub_1A9CE888C();
    _os_log_impl(&dword_1A9B87000, v55, v56, "[%{public}s] upcoming resolved occurrence is not a single day override, generating a new one", v58, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v59, -1, -1);
    MEMORY[0x1AF420344](v58, -1, -1);
  }

  v60 = (void *)sub_1A9CE6258();
  v61 = (void *)sub_1A9CE63CC();
  v62 = objc_msgSend(v31, sel_overrideOccurrenceGenerationResultForCurrentDate_gregorianCalendar_schedule_, v60, v61, v16);

  v63 = v62;
  v64 = sub_1A9CE6978();
  v65 = sub_1A9CE867C();
  v66 = &off_1E55E8000;
  if (os_log_type_enabled(v64, v65))
  {
    v67 = swift_slowAlloc();
    v68 = (_QWORD *)swift_slowAlloc();
    v85 = swift_slowAlloc();
    v87[0] = v85;
    *(_DWORD *)v67 = 136446722;
    v86 = sub_1A9B91D6C(0xD000000000000015, 0x80000001A9D002C0, v87);
    sub_1A9CE888C();
    *(_WORD *)(v67 + 12) = 2114;
    v69 = v16;
    v70 = objc_msgSend(v63, sel_overrideOccurrence);
    v86 = (uint64_t)v70;
    sub_1A9CE888C();
    *v68 = v70;
    v16 = v69;
    v66 = &off_1E55E8000;
    *(_WORD *)(v67 + 22) = 1024;
    LODWORD(v86) = objc_msgSend(v63, sel_wasGeneratedFromTemplate);
    sub_1A9CE888C();

    _os_log_impl(&dword_1A9B87000, v64, v65, "[%{public}s] generated override %{public}@ (from template: %{BOOL}d)", (uint8_t *)v67, 0x1Cu);
    sub_1A9BEFFB8();
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v68, -1, -1);
    v71 = v85;
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v71, -1, -1);
    MEMORY[0x1AF420344](v67, -1, -1);

  }
  else
  {

  }
  v72 = v81;
  v54 = objc_msgSend(v63, v66[408]);
  objc_msgSend(v63, sel_wasGeneratedFromTemplate);

  return v54;
}

char *QuickScheduleManagementViewController.__allocating_init(sleepStore:provenanceSource:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return QuickScheduleManagementViewController.init(sleepStore:provenanceSource:)(a1, a2);
}

id sub_1A9CC9E30()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  v8[0] = 0;
  v1 = objc_msgSend(v0, sel_isFeatureCapabilitySupportedOnActivePairedDeviceWithError_, v8);
  if (v1)
  {
    v2 = v1;
    v3 = v8[0];
    v4 = objc_msgSend(v2, sel_BOOLValue);

  }
  else
  {
    v5 = v8[0];
    v6 = (void *)sub_1A9CE61E0();

    swift_willThrow();
    return 0;
  }
  return v4;
}

void sub_1A9CC9F00(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = sub_1A9CE6444();
  MEMORY[0x1E0C80A78](v5, v6);
  v7 = sub_1A9CE62E8();
  MEMORY[0x1E0C80A78](v7, v8);
  __asm { BR              X10 }
}

id sub_1A9CC9FBC()
{
  char v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  _BYTE *v12;
  id v13;

  sub_1A9CE62DC();
  *(_QWORD *)(v9 - 88) = sub_1A9CC92C8(v5, v4);
  v11 = v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v3, v4, v6);
  v12 = objc_allocWithZone((Class)type metadata accessor for QuickScheduleOverrideViewController());
  v13 = sub_1A9CCE0B8(*(void **)(v9 - 88), v11 & 1, (uint64_t)v1, v0 & 1, v3, v12);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v2);
  return v13;
}

id QuickScheduleManagementViewController.sleepStore.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore);
}

uint64_t sub_1A9CCA10C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  return MEMORY[0x1AF4203E0](v1);
}

uint64_t sub_1A9CCA1A4()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_1A9CCA1FC(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x1AF4203E0](v5);
  return sub_1A9CCA26C;
}

void sub_1A9CCA26C(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

char *QuickScheduleManagementViewController.init(sleepStore:provenanceSource:)(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  objc_class *v27;
  id v28;
  uint64_t v29;
  _UNKNOWN **v30;
  uint64_t *v31;
  char *v32;
  char *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t ObjectType;
  void *v38;
  char *v39;
  void *v40;
  objc_super v42;

  v5 = sub_1A9CE6378();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v10 = (uint64_t)v2 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_gregorianCalendar;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E0CB0EF8], v5);
  v11 = v2;
  sub_1A9CE6384();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(_QWORD *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver] = 0;
  *(_QWORD *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore] = a1;
  type metadata accessor for SleepScheduleProvider();
  v12 = a1;
  v13 = SleepScheduleProvider.__allocating_init(sleepStore:)(v12);
  v14 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider;
  *(_QWORD *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider] = v13;
  *(_QWORD *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_provenanceSource] = a2;
  v15 = *MEMORY[0x1E0CB5098];
  v16 = objc_allocWithZone(MEMORY[0x1E0DA8510]);
  v17 = a2;
  v18 = objc_msgSend(v16, sel_initWithFeatureIdentifier_sleepStore_, v15, v12);
  v19 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability;
  *(_QWORD *)&v11[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability] = v18;
  v20 = v18;
  LOBYTE(v16) = sub_1A9CC9E30();

  v21 = *(_QWORD *)&v11[v19];
  v22 = *(void **)&v11[v14];
  swift_unknownObjectRetain();
  v23 = v22;
  LOBYTE(v21) = sub_1A9CCE838(v21, v23);
  v24 = v23;
  sub_1A9CC9F00((uint64_t)v24, v16 & 1, v10, v21);
  v26 = v25;

  v27 = (objc_class *)type metadata accessor for QuickScheduleManagementViewController();
  v42.receiver = v11;
  v42.super_class = v27;
  v28 = objc_msgSendSuper2(&v42, sel_initWithRootViewController_, v26);
  type metadata accessor for QuickScheduleOverrideViewController();
  v29 = swift_dynamicCastClass();
  if (v29)
  {
    v30 = &off_1E55DE610;
    v31 = &OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate;
  }
  else
  {
    type metadata accessor for EnableSchedulePromptViewController();
    v29 = swift_dynamicCastClass();
    if (v29)
    {
      v30 = &off_1E55DE648;
      v31 = &OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate;
    }
    else
    {
      type metadata accessor for OnboardPromptViewController();
      v29 = swift_dynamicCastClass();
      if (!v29)
        goto LABEL_8;
      v30 = &off_1E55DE630;
      v31 = &OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate;
    }
  }
  *(_QWORD *)(v29 + *v31 + 8) = v30;
  swift_unknownObjectWeakAssign();
LABEL_8:
  v32 = (char *)v28;
  v33 = v26;
  v34 = objc_msgSend(v33, sel_navigationItem);
  v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v32, sel_cancelWithAnimated_);
  objc_msgSend(v34, sel_setLeftBarButtonItem_, v35);

  v36 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability;
  ObjectType = swift_getObjectType();
  swift_unknownObjectRetain();
  LOBYTE(ObjectType) = HKFeatureAvailabilityProviding.isFeatureOnboarded.getter(ObjectType);
  swift_unknownObjectRelease();
  if ((ObjectType & 1) == 0)
  {
    v38 = *(void **)&v32[v36];
    sub_1A9B94A18(0, (unint64_t *)&qword_1ED2625C0);
    v39 = v32;
    swift_unknownObjectRetain();
    v40 = (void *)sub_1A9CE870C();
    objc_msgSend(v38, sel_registerObserver_queue_, v39, v40);
    swift_unknownObjectRelease();

    v33 = v39;
  }

  return v32;
}

void sub_1A9CCA6C0()
{
  objc_class *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  v1 = sub_1A9CE6378();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)objc_allocWithZone(v0);
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x1E0CB0EF8], v1);
  sub_1A9CE6384();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  *(_QWORD *)&v6[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver] = 0;

  sub_1A9CE8A84();
  __break(1u);
}

uint64_t sub_1A9CCA7D4(char a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  objc_super v14;

  v2 = v1;
  v4 = sub_1A9CE8778();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1F30];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (objc_class *)type metadata accessor for QuickScheduleManagementViewController();
  v14.receiver = v2;
  v14.super_class = v10;
  objc_msgSendSuper2(&v14, sel_viewDidAppear_, a1 & 1);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_1A9CE8784();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1A9B92B9C(&qword_1ED2632E0, v5, MEMORY[0x1E0CB1F20]);
  v12 = sub_1A9CE6EC4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  *(_QWORD *)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver] = v12;
  return swift_release();
}

id QuickScheduleManagementViewController.__allocating_init(navigationBarClass:toolbarClass:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;

  v3 = a2;
  if (!a1)
  {
    ObjCClassFromMetadata = 0;
    if (!a2)
      return objc_msgSend(objc_allocWithZone(v2), sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
    goto LABEL_3;
  }
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  if (v3)
LABEL_3:
    v3 = swift_getObjCClassFromMetadata();
  return objc_msgSend(objc_allocWithZone(v2), sel_initWithNavigationBarClass_toolbarClass_, ObjCClassFromMetadata, v3);
}

void QuickScheduleManagementViewController.init(navigationBarClass:toolbarClass:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id QuickScheduleManagementViewController.__allocating_init(rootViewController:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithRootViewController_, a1);

  return v3;
}

void QuickScheduleManagementViewController.init(rootViewController:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id QuickScheduleManagementViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void QuickScheduleManagementViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id QuickScheduleManagementViewController.__deallocating_deinit()
{
  return sub_1A9CCE070((uint64_t (*)(_QWORD))type metadata accessor for QuickScheduleManagementViewController);
}

void sub_1A9CCAC58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1AF4203E0](v2);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_cancelWithAnimated_, 0);

  }
}

void *sub_1A9CCACB4(char a1)
{
  char *v1;
  id v2;
  uint64_t v3;
  char *v4;
  id v6;
  unint64_t v7;
  id v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t ObjectType;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  void *result;
  _QWORD *v31;
  os_log_type_t type;
  uint64_t v33;
  id v34;
  uint64_t v35[3];

  v4 = v1;
  swift_getObjectType();
  v6 = objc_msgSend(v1, sel_viewControllers);
  sub_1A9B94A18(0, &qword_1EEB43070);
  v7 = sub_1A9CE83DC();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = (id)sub_1A9CE8AC0();
    swift_bridgeObjectRelease();
    v9 = &unk_1ED262000;
    if (v8)
    {
LABEL_3:
      if ((v7 & 0xC000000000000001) != 0)
      {
        v10 = (id)MEMORY[0x1AF41F600](0, v7);
      }
      else
      {
        if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_32;
        }
        v10 = *(id *)(v7 + 32);
      }
      v8 = v10;
      swift_bridgeObjectRelease();
      swift_getObjectType();
      v11 = swift_conformsToProtocol2();
      if (v11)
        v3 = v11;
      else
        v3 = 0;
      if (v11)
        v2 = v8;
      else
        v2 = 0;
      if (!v2)
        goto LABEL_18;
      if (qword_1ED2628A0 == -1)
      {
LABEL_14:
        v12 = sub_1A9CE6990();
        __swift_project_value_buffer(v12, (uint64_t)qword_1ED262888);
        v8 = v8;
        v13 = sub_1A9CE6978();
        v14 = sub_1A9CE867C();
        if (os_log_type_enabled(v13, v14))
        {
          type = v14;
          v15 = swift_slowAlloc();
          v31 = (_QWORD *)swift_slowAlloc();
          v33 = swift_slowAlloc();
          v35[0] = v33;
          *(_DWORD *)v15 = 136446466;
          v16 = sub_1A9CE8D48();
          sub_1A9B91D6C(v16, v17, v35);
          sub_1A9CE888C();
          swift_bridgeObjectRelease();
          *(_WORD *)(v15 + 12) = 2114;
          v34 = v2;
          v18 = v3;
          v19 = v8;
          v9 = (_QWORD *)&unk_1ED262000;
          sub_1A9CE888C();
          *v31 = v34;

          v3 = v18;
          _os_log_impl(&dword_1A9B87000, v13, type, "[%{public}s] prepareForCancel: [%{public}@]", (uint8_t *)v15, 0x16u);
          sub_1A9BEFFB8();
          swift_arrayDestroy();
          MEMORY[0x1AF420344](v31, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x1AF420344](v33, -1, -1);
          MEMORY[0x1AF420344](v15, -1, -1);

        }
        else
        {

        }
        ObjectType = swift_getObjectType();
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 8))(a1 & 1, ObjectType, v3);
LABEL_18:

        goto LABEL_21;
      }
LABEL_32:
      swift_once();
      goto LABEL_14;
    }
  }
  else
  {
    v8 = *(id *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = &unk_1ED262000;
    if (v8)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
LABEL_21:
  if (v9[276] != -1)
    swift_once();
  v21 = sub_1A9CE6990();
  __swift_project_value_buffer(v21, (uint64_t)qword_1ED262888);
  v22 = sub_1A9CE6978();
  v23 = sub_1A9CE867C();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v35[0] = v25;
    *(_DWORD *)v24 = 136446210;
    v26 = sub_1A9CE8D48();
    sub_1A9B91D6C(v26, v27, v35);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v22, v23, "[%{public}s] Did cancel", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v25, -1, -1);
    MEMORY[0x1AF420344](v24, -1, -1);
  }

  v28 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver;
  if (*(_QWORD *)&v4[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver])
  {
    swift_retain();
    sub_1A9CE6D80();
    swift_release();
  }
  *(_QWORD *)&v4[v28] = 0;
  swift_release();
  v29 = &v4[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate];
  swift_beginAccess();
  result = (void *)MEMORY[0x1AF4203E0](v29);
  if (result)
  {
    objc_msgSend(result, sel_quickScheduleManagementViewControllerDidCancel_, v4);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_1A9CCB214()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *result;
  uint64_t v11[3];

  v1 = v0;
  swift_getObjectType();
  if (qword_1ED2628A0 != -1)
    swift_once();
  v2 = sub_1A9CE6990();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED262888);
  v3 = sub_1A9CE6978();
  v4 = sub_1A9CE867C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v11[0] = v6;
    *(_DWORD *)v5 = 136446210;
    v7 = sub_1A9CE8D48();
    sub_1A9B91D6C(v7, v8, v11);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v3, v4, "[%{public}s] Will save schedule", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v6, -1, -1);
    MEMORY[0x1AF420344](v5, -1, -1);
  }

  v9 = v1 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  result = (void *)MEMORY[0x1AF4203E0](v9);
  if (result)
  {
    objc_msgSend(result, sel_quickScheduleManagementViewControllerWillSave_, v1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_1A9CCB3DC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *result;
  uint64_t v18[3];

  v2 = v1;
  swift_getObjectType();
  if (qword_1ED2628A0 != -1)
    swift_once();
  v4 = sub_1A9CE6990();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED262888);
  v5 = a1;
  v6 = sub_1A9CE6978();
  v7 = sub_1A9CE867C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v18[0] = v9;
    *(_DWORD *)v8 = 136446466;
    v10 = sub_1A9CE8D48();
    sub_1A9B91D6C(v10, v11, v18);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2082;
    if (a1)
    {
      sub_1A9B94A18(0, (unint64_t *)&qword_1ED262900);
      v12 = v5;
      v13 = sub_1A9CE82F8();
      v15 = v14;
    }
    else
    {
      v15 = 0xE300000000000000;
      v13 = 7104878;
    }
    sub_1A9B91D6C(v13, v15, v18);
    sub_1A9CE888C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v6, v7, "[%{public}s] Did save schedule %{public}s...", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v9, -1, -1);
    MEMORY[0x1AF420344](v8, -1, -1);

  }
  else
  {

  }
  v16 = v2 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  result = (void *)MEMORY[0x1AF4203E0](v16);
  if (result)
  {
    objc_msgSend(result, sel_quickScheduleManagementViewController_didSave_, v2, v5);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_1A9CCB654(void *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t (*v27)(void);
  uint64_t v28[3];

  v4 = v3;
  swift_getObjectType();
  if (qword_1ED2628A0 != -1)
    swift_once();
  v8 = sub_1A9CE6990();
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED262888);
  v9 = a1;
  v10 = a1;
  v11 = sub_1A9CE6978();
  v12 = sub_1A9CE867C();
  if (os_log_type_enabled(v11, v12))
  {
    v27 = a2;
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v28[0] = v14;
    *(_DWORD *)v13 = 136446466;
    v15 = sub_1A9CE8D48();
    sub_1A9B91D6C(v15, v16, v28);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    if (a1)
    {
      v17 = a1;
      sub_1A9BB15F4();
      v18 = sub_1A9CE82F8();
      v20 = v19;
    }
    else
    {
      v20 = 0xE300000000000000;
      v18 = 7104878;
    }
    sub_1A9B91D6C(v18, v20, v28);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1A9B87000, v11, v12, "[%{public}s] Presenting alert for error %{public}s...", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v14, -1, -1);
    MEMORY[0x1AF420344](v13, -1, -1);

    a2 = v27;
  }
  else
  {

  }
  v21 = v4 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  v22 = MEMORY[0x1AF4203E0](v21);
  if (!v22)
    return a2();
  v23 = (void *)v22;
  sub_1A9B94A18(0, &qword_1EEB430A8);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = a2;
  *(_QWORD *)(v24 + 24) = a3;
  swift_retain();
  v25 = static UIAlertController.internalOnlyAlert(for:dismissHandler:)(a1, (uint64_t)sub_1A9C717C4, v24);
  swift_release();
  objc_msgSend(v23, sel_quickScheduleManagementViewController_shouldPresent_, v4, v25);

  return swift_unknownObjectRelease();
}

uint64_t sub_1A9CCB954()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  id v15;

  v1 = *(void **)(v0 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_provenanceSource);
  v2 = sub_1A9CE82E0();
  v4 = v3;
  if (v2 == sub_1A9CE82E0() && v4 == v5)
  {
    v15 = v1;
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  v7 = sub_1A9CE8BB0();
  v8 = v1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v7 & 1) != 0)
  {
LABEL_14:

    return 1;
  }
  v9 = sub_1A9CE82E0();
  v11 = v10;
  if (v9 == sub_1A9CE82E0() && v11 == v12)
  {
    v14 = 4;
  }
  else if ((sub_1A9CE8BB0() & 1) != 0)
  {
    v14 = 4;
  }
  else
  {
    v14 = 0;
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1A9CCBA80(int a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8)
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
  _BYTE *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  _BYTE *v34;
  uint64_t (*v35)(uint64_t);
  uint64_t v36;
  _BYTE *v37;
  void *v38;
  _BYTE v40[12];
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD aBlock[7];

  v48 = a8;
  v45 = a6;
  v46 = a7;
  v43 = a2;
  v44 = a5;
  v42 = a4;
  v41 = a1;
  v51 = sub_1A9CE8070();
  v54 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51, v9);
  v50 = &v40[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_1A9CE8094();
  v52 = *(_QWORD *)(v11 - 8);
  v53 = v11;
  MEMORY[0x1E0C80A78](v11, v12);
  v47 = &v40[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = sub_1A9CE6990();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x1E0C80A78](v14, v17);
  v18 = &v40[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1A9B94A18(0, (unint64_t *)&qword_1ED2625C0);
  v49 = sub_1A9CE870C();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 16))(v18, a3, v14);
  v19 = (*(unsigned __int8 *)(v15 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v20 = (v16 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  v24 = swift_allocObject();
  *(_BYTE *)(v24 + 16) = v41;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v15 + 32))(v24 + v19, v18, v14);
  v25 = v42;
  *(_QWORD *)(v24 + v20) = v42;
  v26 = (_QWORD *)(v24 + v21);
  v27 = v45;
  *v26 = v44;
  v26[1] = v27;
  v28 = v43;
  *(_QWORD *)(v24 + v22) = v43;
  v29 = v46;
  *(_QWORD *)(v24 + v23) = v46;
  *(_QWORD *)(v24 + ((v23 + 15) & 0xFFFFFFFFFFFFFFF8)) = v48;
  aBlock[4] = sub_1A9CCF650;
  aBlock[5] = v24;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A9C0A74C;
  aBlock[3] = &block_descriptor_27;
  v30 = _Block_copy(aBlock);
  v31 = v25;
  swift_retain();
  v32 = v28;
  v33 = v29;
  swift_release();
  v34 = v47;
  sub_1A9CE8088();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  v35 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1A9B92B9C((unint64_t *)&qword_1EEB45820, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  sub_1A9B92F34(0, &qword_1EEB47E30, v35, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A9C04D54();
  v37 = v50;
  v36 = v51;
  sub_1A9CE8904();
  v38 = (void *)v49;
  MEMORY[0x1AF41F348](0, v34, v37, v30);
  _Block_release(v30);

  (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v37, v36);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v52 + 8))(v34, v53);
}

uint64_t sub_1A9CCBD90(char a1, uint64_t a2, void *a3, uint64_t (*a4)(void), uint64_t a5, void *a6)
{
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  void *v40;
  unsigned int v41;
  uint64_t (*v43)(void);
  uint64_t v44;

  if ((a1 & 1) != 0)
  {
    v9 = a3;
    v10 = sub_1A9CE6978();
    v11 = sub_1A9CE867C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v44 = v13;
      *(_DWORD *)v12 = 136446466;
      v14 = sub_1A9CE8D48();
      sub_1A9B91D6C(v14, v15, &v44);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2082;
      if (a3)
      {
        sub_1A9B94A18(0, (unint64_t *)&qword_1EEB45698);
        v16 = v9;
        v17 = sub_1A9CE82F8();
        v19 = v18;
      }
      else
      {
        v17 = 7104878;
        v19 = 0xE300000000000000;
      }
      sub_1A9B91D6C(v17, v19, &v44);
      sub_1A9CE888C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v10, v11, "[%{public}s] Successfully saved sleep schedule %{public}s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v13, -1, -1);
      MEMORY[0x1AF420344](v12, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v21 = a3;
    v22 = a6;
    v23 = v21;
    v24 = a6;
    v25 = sub_1A9CE6978();
    v26 = sub_1A9CE8664();
    if (os_log_type_enabled(v25, v26))
    {
      v43 = a4;
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v44 = v28;
      *(_DWORD *)v27 = 136446722;
      v29 = sub_1A9CE8D48();
      sub_1A9B91D6C(v29, v30, &v44);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v27 + 12) = 2082;
      if (a6)
      {
        v31 = a6;
        sub_1A9BB15F4();
        v32 = sub_1A9CE82F8();
        v34 = v33;
      }
      else
      {
        v34 = 0xE300000000000000;
        v32 = 7104878;
      }
      sub_1A9B91D6C(v32, v34, &v44);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();

      *(_WORD *)(v27 + 22) = 2082;
      if (a3)
      {
        sub_1A9B94A18(0, (unint64_t *)&qword_1EEB45698);
        v35 = v23;
        v36 = sub_1A9CE82F8();
        v38 = v37;
      }
      else
      {
        v38 = 0xE300000000000000;
        v36 = 7104878;
      }
      sub_1A9B91D6C(v36, v38, &v44);
      sub_1A9CE888C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v25, v26, "[%{public}s] Failed to save sleep schedule with error: %{public}s, %{public}s", (uint8_t *)v27, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v28, -1, -1);
      MEMORY[0x1AF420344](v27, -1, -1);

      a4 = v43;
    }
    else
    {

    }
    v39 = objc_msgSend((id)objc_opt_self(), sel_sharedBehavior);
    if (v39)
    {
      v40 = v39;
      v41 = objc_msgSend(v39, sel_isAppleInternalInstall);

      if (v41)
        return sub_1A9CCB654(a6, a4, a5);
    }
  }
  return a4();
}

uint64_t sub_1A9CCC248(_QWORD *a1, char a2, id a3, uint64_t a4)
{
  char *v4;
  char *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint8_t *v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  char *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  id v48;
  char *v49;
  void *v50;
  _QWORD v52[2];
  os_log_t v53;
  uint64_t v54;
  id v55;
  char *v56;
  id v57;
  _QWORD *v58;
  uint64_t v59;
  char *v60;
  uint64_t ObjectType;
  uint64_t v62;
  uint64_t aBlock[6];

  v5 = v4;
  v58 = a1;
  ObjectType = swift_getObjectType();
  v9 = sub_1A9CE6990();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v9, v11);
  v59 = v13;
  v60 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12, v14);
  v16 = (char *)v52 - v15;
  v17 = *(id *)&v4[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider];
  v18 = sub_1A9C6E00C();

  if ((a2 & 1) != 0)
  {
    v19 = objc_msgSend(v18, sel_overrideOccurrence);
    if (v19)
    {
      v20 = v19;
      if (qword_1ED2628A0 != -1)
        swift_once();
      __swift_project_value_buffer(v9, (uint64_t)qword_1ED262888);
      v21 = sub_1A9CE6978();
      v22 = sub_1A9CE867C();
      v23 = v22;
      if (os_log_type_enabled(v21, v22))
      {
        v57 = a3;
        v24 = swift_slowAlloc();
        LODWORD(v55) = v23;
        v25 = (uint8_t *)v24;
        v54 = swift_slowAlloc();
        aBlock[0] = v54;
        v53 = v21;
        v26 = v25;
        *(_DWORD *)v25 = 136446210;
        v52[0] = v25;
        v52[1] = v25 + 4;
        v27 = sub_1A9CE8D48();
        v62 = sub_1A9B91D6C(v27, v28, aBlock);
        sub_1A9CE888C();
        a3 = v57;
        swift_bridgeObjectRelease();
        v29 = v53;
        _os_log_impl(&dword_1A9B87000, v53, (os_log_type_t)v55, "[%{public}s] removing override", v26, 0xCu);
        v30 = v54;
        swift_arrayDestroy();
        MEMORY[0x1AF420344](v30, -1, -1);
        MEMORY[0x1AF420344](v52[0], -1, -1);

      }
      else
      {

      }
      objc_msgSend(v18, sel_removeOccurrence_, v20);

    }
  }
  objc_msgSend(v18, sel_saveOccurrence_, v58);
  v31 = (_QWORD *)swift_allocObject();
  v31[2] = a3;
  v31[3] = a4;
  v58 = v31;
  v31[4] = v18;
  v32 = qword_1ED2628A0;
  v57 = v18;
  swift_retain();
  if (v32 != -1)
    swift_once();
  v33 = __swift_project_value_buffer(v9, (uint64_t)qword_1ED262888);
  v53 = *(os_log_t *)(v10 + 16);
  v56 = v16;
  ((void (*)(char *, uint64_t, uint64_t))v53)(v16, v33, v9);
  v34 = objc_msgSend((id)objc_opt_self(), sel_unknownProvenance);
  sub_1A9CCB954();
  v35 = (id)HKSPAnalyticsScheduleChangeContext();

  sub_1A9CE8214();
  v36 = v10;

  v55 = *(id *)&v5[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore];
  v54 = sub_1A9CE8208();
  swift_bridgeObjectRelease();
  v37 = v60;
  ((void (*)(char *, char *, uint64_t))v53)(v60, v16, v9);
  v38 = (*(unsigned __int8 *)(v36 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  v39 = (v59 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
  v40 = (v39 + 15) & 0xFFFFFFFFFFFFFFF8;
  v41 = (v40 + 23) & 0xFFFFFFFFFFFFFFF8;
  v42 = v9;
  v43 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v43 + v38, v37, v9);
  v45 = v57;
  v44 = v58;
  *(_QWORD *)(v43 + v39) = v57;
  v46 = (_QWORD *)(v43 + v40);
  *v46 = sub_1A9CCFDB0;
  v46[1] = v44;
  *(_QWORD *)(v43 + v41) = v5;
  *(_QWORD *)(v43 + ((v41 + 15) & 0xFFFFFFFFFFFFFFF8)) = ObjectType;
  aBlock[4] = (uint64_t)sub_1A9CCF58C;
  aBlock[5] = v43;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A9BE4D94;
  aBlock[3] = (uint64_t)&block_descriptor_56;
  v47 = _Block_copy(aBlock);
  v48 = v45;
  swift_retain();
  v49 = v5;
  swift_release();
  v50 = (void *)v54;
  objc_msgSend(v55, sel_saveCurrentSleepSchedule_options_context_completion_, v48, 0, v54, v47);
  _Block_release(v47);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v56, v42);
  return swift_release();
}

void sub_1A9CCC764(void (*a1)(), int a2, id a3)
{
  void *v4;

  objc_msgSend(a3, sel_copy);
  sub_1A9CE88EC();
  swift_unknownObjectRelease();
  sub_1A9B94A18(0, (unint64_t *)&qword_1ED262900);
  swift_dynamicCast();
  a1();

}

void sub_1A9CCC800(void *a1)
{
  void *v1;
  void *v2;
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
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = v1;
  swift_getObjectType();
  sub_1A9B92F34(0, &qword_1EEB48C00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v31 - v6;
  v8 = sub_1A9CE6234();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11, v14);
  v16 = (char *)&v31 - v15;
  v17 = (id)HKSPSleepURL();
  if (v17)
  {
    v18 = v17;
    sub_1A9CE621C();

    v19 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v19(v7, v13, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      v19(v16, v7, v8);
      DeepLinkOpener.open(url:completion:)((uint64_t)v16, 0, 0);
      objc_msgSend(v2, sel_cancelWithAnimated_, 0);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_1A9C9CAD8((uint64_t)v7);
  if (qword_1ED2628A0 != -1)
    swift_once();
  v20 = sub_1A9CE6990();
  __swift_project_value_buffer(v20, (uint64_t)qword_1ED262888);
  v21 = a1;
  v22 = sub_1A9CE6978();
  v23 = sub_1A9CE8664();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v32 = v25;
    *(_DWORD *)v24 = 136446466;
    v26 = sub_1A9CE8D48();
    v31 = sub_1A9B91D6C(v26, v27, &v32);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 12) = 2082;
    v31 = (uint64_t)v21;
    type metadata accessor for HKSPSleepLaunchURLRoute(0);
    v28 = v21;
    v29 = sub_1A9CE82F8();
    v31 = sub_1A9B91D6C(v29, v30, &v32);
    sub_1A9CE888C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v22, v23, "[%{public}s] Unable to create URL for route %{public}s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v25, -1, -1);
    MEMORY[0x1AF420344](v24, -1, -1);

  }
  else
  {

  }
}

void QuickScheduleManagementViewController.featureAvailabilityProvidingDidUpdateOnboardingCompletion(_:)(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  unint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t ObjectType;
  unsigned __int8 v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  id v34;
  char v35;
  unsigned __int8 v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  _UNKNOWN **v43;
  uint64_t *v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  _QWORD v59[4];
  uint64_t v60;
  uint64_t v61;

  v2 = v1;
  v59[3] = swift_getObjectType();
  v4 = sub_1A9CE80A0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (_QWORD *)((char *)v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1A9B94A18(0, (unint64_t *)&qword_1ED2625C0);
  *v8 = sub_1A9CE870C();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x1E0DEF740], v4);
  v9 = sub_1A9CE80AC();
  (*(void (**)(uint64_t *, uint64_t))(v5 + 8))(v8, v4);
  if ((v9 & 1) != 0)
  {
    if (qword_1ED2628A0 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v10 = sub_1A9CE6990();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED262888);
  v11 = sub_1A9CE6978();
  v12 = sub_1A9CE867C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v61 = v14;
    *(_DWORD *)v13 = 136446210;
    v15 = sub_1A9CE8D48();
    v60 = sub_1A9B91D6C(v15, v16, &v61);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v11, v12, "[%{public}s] Observed onboarding completion update", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v14, -1, -1);
    MEMORY[0x1AF420344](v13, -1, -1);
  }

  v17 = objc_msgSend(v2, sel_viewControllers);
  sub_1A9B94A18(0, &qword_1EEB43070);
  v18 = sub_1A9CE83DC();

  if (!(v18 >> 62))
  {
    if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_7;
LABEL_28:
    swift_bridgeObjectRelease();
LABEL_29:
    v53 = sub_1A9CE6978();
    v54 = sub_1A9CE867C();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      v56 = swift_slowAlloc();
      v61 = v56;
      *(_DWORD *)v55 = 136446210;
      v57 = sub_1A9CE8D48();
      v60 = sub_1A9B91D6C(v57, v58, &v61);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v53, v54, "[%{public}s] Onboarding view not displayed - skipping update", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v56, -1, -1);
      MEMORY[0x1AF420344](v55, -1, -1);
    }

    objc_msgSend(*(id *)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability], sel_unregisterObserver_, v2);
    return;
  }
  swift_bridgeObjectRetain();
  v52 = sub_1A9CE8AC0();
  swift_bridgeObjectRelease();
  if (!v52)
    goto LABEL_28;
LABEL_7:
  if ((v18 & 0xC000000000000001) != 0)
  {
    v19 = (id)MEMORY[0x1AF41F600](0, v18);
  }
  else
  {
    if (!*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v19 = *(id *)(v18 + 32);
  }
  v20 = v19;
  swift_bridgeObjectRelease();
  v21 = type metadata accessor for OnboardPromptViewController();
  v22 = swift_dynamicCastClass();

  if (!v22)
    goto LABEL_29;
  ObjectType = swift_getObjectType();
  v24 = HKFeatureAvailabilityProviding.isFeatureOnboarded.getter(ObjectType);
  v25 = sub_1A9CE6978();
  v26 = sub_1A9CE867C();
  v27 = os_log_type_enabled(v25, v26);
  if ((v24 & 1) != 0)
  {
    if (v27)
    {
      v28 = swift_slowAlloc();
      v59[2] = v21;
      v29 = (uint8_t *)v28;
      v30 = swift_slowAlloc();
      v61 = v30;
      *(_DWORD *)v29 = 136446210;
      v59[1] = v29 + 4;
      v31 = sub_1A9CE8D48();
      v60 = sub_1A9B91D6C(v31, v32, &v61);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A9B87000, v25, v26, "[%{public}s] Onboarded - setting new root view controller", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v30, -1, -1);
      MEMORY[0x1AF420344](v29, -1, -1);
    }

    v33 = *(void **)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider];
    swift_unknownObjectRetain();
    v34 = v33;
    v35 = sub_1A9CCE838(a1, v34);
    v36 = HKFeatureAvailabilityProviding.pairedWatchSupportsSleep.getter(ObjectType);
    sub_1A9CC9F00((uint64_t)v34, v36 & 1, (uint64_t)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_gregorianCalendar], v35);
    v38 = v37;
    sub_1A9BB7420();
    v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = xmmword_1A9CEF8A0;
    *(_QWORD *)(v39 + 32) = v38;
    v61 = v39;
    sub_1A9CE83E8();
    v40 = v38;
    v41 = (void *)sub_1A9CE83D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setViewControllers_animated_, v41, 0);

    type metadata accessor for QuickScheduleOverrideViewController();
    v42 = swift_dynamicCastClass();
    if (v42)
    {
      v43 = &off_1E55DE610;
      v44 = &OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate;
    }
    else
    {
      type metadata accessor for EnableSchedulePromptViewController();
      v42 = swift_dynamicCastClass();
      if (v42)
      {
        v43 = &off_1E55DE648;
        v44 = &OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate;
      }
      else
      {
        v42 = swift_dynamicCastClass();
        if (!v42)
        {
LABEL_24:
          v49 = v40;
          v50 = objc_msgSend(v49, sel_navigationItem);
          v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_cancelWithAnimated_);
          objc_msgSend(v50, sel_setLeftBarButtonItem_, v51);

          objc_msgSend(*(id *)&v2[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_featureAvailability], sel_unregisterObserver_, v2);
          return;
        }
        v43 = &off_1E55DE630;
        v44 = &OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate;
      }
    }
    *(_QWORD *)(v42 + *v44 + 8) = v43;
    swift_unknownObjectWeakAssign();
    goto LABEL_24;
  }
  if (v27)
  {
    v45 = (uint8_t *)swift_slowAlloc();
    v46 = swift_slowAlloc();
    v61 = v46;
    *(_DWORD *)v45 = 136446210;
    v47 = sub_1A9CE8D48();
    v60 = sub_1A9B91D6C(v47, v48, &v61);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v25, v26, "[%{public}s] Not onboarded - skipping update", v45, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v46, -1, -1);
    MEMORY[0x1AF420344](v45, -1, -1);
  }

}

void sub_1A9CCD3FC()
{
  id v0;
  void *v1;
  id v2;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v0 = (id)qword_1ED264F90;
  v1 = (void *)sub_1A9CE82B0();
  v2 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v1, v0);

  if (v2)
    qword_1EEB4A0C0 = (uint64_t)v2;
  else
    __break(1u);
}

void sub_1A9CCD4B8()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for TintedTitleTrayButton();
  objc_msgSendSuper2(&v5, sel_tintColorDidChange);
  v1 = objc_msgSend(v0, sel_tintColor);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v0, sel_setTitleColor_forState_, v1, 0);
    v3 = objc_msgSend(v2, sel_colorWithAlphaComponent_, 0.5);
    objc_msgSend(v0, sel_setTitleColor_forState_, v3, 1);

    v4 = objc_msgSend(v2, sel_colorWithAlphaComponent_, 0.3);
    objc_msgSend(v0, sel_setTitleColor_forState_, v4, 2);

  }
  else
  {
    __break(1u);
  }
}

id sub_1A9CCD6A4()
{
  return sub_1A9CCE070((uint64_t (*)(_QWORD))type metadata accessor for TintedTitleTrayButton);
}

id sub_1A9CCD748()
{
  return sub_1A9CCE070((uint64_t (*)(_QWORD))type metadata accessor for EnableSchedulePromptViewController);
}

id sub_1A9CCD764(char a1)
{
  char *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  objc_super v22;

  *(_QWORD *)&v1[OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate
               + 8] = 0;
  swift_unknownObjectWeakInit();
  if (qword_1ED2626A8 != -1)
    swift_once();
  v2 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v3 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v4 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v5 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  if (qword_1EEB42F20 != -1)
    swift_once();
  v6 = qword_1EEB4A0C0;
  v22.receiver = v1;
  v22.super_class = (Class)type metadata accessor for OnboardPromptViewController();
  v7 = objc_msgSendSuper2(&v22, sel_initWithTitle_detailText_icon_contentLayout_, v3, v5, v6, 2, 0xE000000000000000);

  v8 = (void *)qword_1ED264F90;
  v9 = v7;
  v10 = v8;
  sub_1A9CE6168();

  v11 = objc_msgSend((id)objc_opt_self(), sel_boldButton, 0xE000000000000000);
  objc_msgSend(v11, sel_addTarget_action_forControlEvents_, v9, sel_beginButtonAction, 64);
  v12 = (void *)sub_1A9CE82B0();
  objc_msgSend(v11, sel_setTitle_forState_, v12, 0);

  v13 = objc_msgSend(v9, sel_buttonTray);
  objc_msgSend(v13, sel_addButton_, v11);

  swift_bridgeObjectRelease();
  v14 = v9;
  if ((a1 & 1) != 0)
  {
    v15 = (void *)qword_1ED264F90;
    v16 = v9;
    v17 = v15;
    sub_1A9CE6168();

    type metadata accessor for TintedTitleTrayButton();
    v18 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init, 0xE000000000000000);
    objc_msgSend(v18, sel_addTarget_action_forControlEvents_, v16, sel_removeButtonAction, 64);
    v19 = (void *)sub_1A9CE82B0();
    objc_msgSend(v18, sel_setTitle_forState_, v19, 0);

    v14 = objc_msgSend(v16, sel_buttonTray);
    objc_msgSend(v14, sel_addButton_, v18);

    swift_bridgeObjectRelease();
  }

  return v9;
}

uint64_t sub_1A9CCDBB0(uint64_t result, uint64_t a2)
{
  if ((result & 1) != 0)
  {
    result = MEMORY[0x1AF4203E0](a2+ OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0627OnboardPromptViewController_delegate);
    if (result)
    {
      sub_1A9CCF0FC();
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void sub_1A9CCDC5C(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t aBlock;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v4 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v5 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, 0, v5, 0, 0xE000000000000000);

  v7 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain();
  v9 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v23 = sub_1A9CBF91C;
  v24 = v8;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A9C432C8;
  v22 = &block_descriptor_41;
  v10 = _Block_copy(&aBlock);
  swift_release();
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_actionWithTitle_style_handler_, v9, 2, v10, 0xE000000000000000);
  _Block_release(v10);

  objc_msgSend(v6, sel_addAction_, v12);
  v13 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  swift_retain();
  v15 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v23 = sub_1A9CBF8D4;
  v24 = v14;
  aBlock = MEMORY[0x1E0C809B0];
  v20 = 1107296256;
  v21 = sub_1A9C432C8;
  v22 = &block_descriptor_9_0;
  v16 = _Block_copy(&aBlock);
  swift_release();
  v17 = objc_msgSend(v11, sel_actionWithTitle_style_handler_, v15, 1, v16, 0xE000000000000000);
  _Block_release(v16);

  objc_msgSend(v6, sel_addAction_, v17);
  objc_msgSend(v18, sel_presentViewController_animated_completion_, v6, 1, 0);

}

void sub_1A9CCE02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;

  v5 = a5;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1A9CCE064()
{
  return sub_1A9CCE070((uint64_t (*)(_QWORD))type metadata accessor for OnboardPromptViewController);
}

id sub_1A9CCE070(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_1A9CCE0B8(void *a1, int a2, uint64_t a3, int a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t ObjectType;
  id v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  objc_super v48;
  _QWORD v49[5];

  v45 = a5;
  v41 = a2;
  LODWORD(v42) = a4;
  v40 = a1;
  ObjectType = swift_getObjectType();
  v8 = sub_1A9CE6444();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&ObjectType - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SleepScheduleProvider();
  *(_QWORD *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_alarmConfigurationObserver] = 0;
  *(_QWORD *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_modelEditObserver] = 0;
  *(_QWORD *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_significantTimeChangeObserver] = 0;
  *(_QWORD *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_nextOccurrenceChangeObserver] = 0;
  *(_QWORD *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_scheduleChangeObserver] = 0;
  *(_QWORD *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_sleepDurationGoalObserver] = 0;
  v49[3] = v13;
  v49[4] = &protocol witness table for SleepScheduleProvider;
  *(_QWORD *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_validScheduleRangeObserver] = 0;
  v49[0] = a3;
  *(_QWORD *)&a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_willResignActiveObserver] = 0;
  a6[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_modelHasChanged] = 0;
  v14 = OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_tonePickerStyleProvider;
  v15 = (objc_class *)type metadata accessor for TonePickerStyleProvider();
  v16 = objc_allocWithZone(v15);
  v17 = a6;
  *(_QWORD *)&a6[v14] = objc_msgSend(v16, sel_init);
  v18 = OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_vibrationPickerStyleProvider;
  *(_QWORD *)&v17[v18] = objc_msgSend(objc_allocWithZone(v15), sel_init);
  *(_QWORD *)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_dataSource] = 0;
  v19 = *(_QWORD *)(a3 + OBJC_IVAR____TtC13SleepHealthUI21SleepScheduleProvider_currentGoalPublisher);
  v20 = *(_QWORD *)(a3 + OBJC_IVAR____TtC13SleepHealthUI21SleepScheduleProvider_currentSchedulePublisher);
  v43 = v9;
  v44 = v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v45, v8);
  type metadata accessor for ScheduleOccurrenceEditModel();
  swift_allocObject();
  v21 = v40;
  swift_retain();
  swift_retain();
  v22 = sub_1A9BD5470(v21, v41, 1, 0, v19, v20, v42, (uint64_t)v12);

  swift_release();
  swift_release();
  *(_QWORD *)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_model] = v22;
  sub_1A9B923D4((uint64_t)v49, (uint64_t)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_sleepScheduleProvider]);
  type metadata accessor for AlarmPreviewPlayer();
  swift_allocObject();
  v23 = swift_retain();
  *(_QWORD *)&v17[OBJC_IVAR____TtC13SleepHealthUI35QuickScheduleOverrideViewController_alarmPreviewPlayer] = AlarmPreviewPlayer.init(model:)(v23);

  v24 = (objc_class *)type metadata accessor for QuickScheduleOverrideViewController();
  v48.receiver = v17;
  v48.super_class = v24;
  v25 = objc_msgSendSuper2(&v48, sel_initWithStyle_, 2);
  v26 = qword_1ED2628A0;
  v27 = v25;
  if (v26 != -1)
    swift_once();
  v28 = sub_1A9CE6990();
  __swift_project_value_buffer(v28, (uint64_t)qword_1ED262888);
  v29 = v21;
  v30 = sub_1A9CE6978();
  v31 = sub_1A9CE867C();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    v42 = swift_slowAlloc();
    v47 = v42;
    *(_DWORD *)v32 = 136446466;
    nullsub_1(ObjectType);
    v34 = sub_1A9CE8D48();
    v46 = sub_1A9B91D6C(v34, v35, &v47);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2114;
    v46 = (uint64_t)v29;
    v36 = v29;
    sub_1A9CE888C();
    *v33 = v29;

    _os_log_impl(&dword_1A9B87000, v30, v31, "[%{public}s] initializing with override occurrence %{public}@", (uint8_t *)v32, 0x16u);
    sub_1A9BEFFB8();
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v33, -1, -1);
    v37 = v42;
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v37, -1, -1);
    MEMORY[0x1AF420344](v32, -1, -1);

  }
  else
  {

  }
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v45, v44);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v49);
  return v27;
}

void sub_1A9CCE578()
{
  sub_1A9CCEF64("[%{public}s] Opening Health > Sleep > Manage Schedule...", MEMORY[0x1E0DA83A8]);
}

uint64_t sub_1A9CCE58C(void *a1, char a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  swift_getObjectType();
  if (qword_1ED2628A0 != -1)
    swift_once();
  v6 = sub_1A9CE6990();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED262888);
  v7 = a1;
  v8 = sub_1A9CE6978();
  v9 = sub_1A9CE867C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v18 = (_QWORD *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v20 = v19;
    *(_DWORD *)v10 = 136446466;
    v11 = sub_1A9CE8D48();
    sub_1A9B91D6C(v11, v12, &v20);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2114;
    v13 = v7;
    sub_1A9CE888C();
    *v18 = v7;

    _os_log_impl(&dword_1A9B87000, v8, v9, "[%{public}s] Schedule occurrence was modified: %{public}@", (uint8_t *)v10, 0x16u);
    sub_1A9BEFFB8();
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v19, -1, -1);
    MEMORY[0x1AF420344](v10, -1, -1);

  }
  else
  {

  }
  v14 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver;
  if (*(_QWORD *)&v3[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver])
  {
    swift_retain();
    sub_1A9CE6D80();
    swift_release();
  }
  *(_QWORD *)&v3[v14] = 0;
  swift_release();
  sub_1A9CCB214();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v3;
  v16 = v3;
  sub_1A9CCC248(v7, a2 & 1, sub_1A9CCFBF0, v15);
  return swift_release();
}

uint64_t sub_1A9CCE838(uint64_t a1, void *a2)
{
  uint64_t ObjectType;
  unsigned __int8 v4;
  id v5;
  id v6;
  unsigned int v7;
  void *v9;

  ObjectType = swift_getObjectType();
  v4 = HKFeatureAvailabilityProviding.isFeatureOnboarded.getter(ObjectType);
  v5 = a2;
  swift_retain();
  sub_1A9CE6DD4();

  swift_release();
  if (v9)
  {
    v6 = v9;
    v7 = objc_msgSend(v6, sel_isEnabled);

    swift_unknownObjectRelease();
    if ((v4 & 1) != 0)
      return v7 ^ 1;
    else
      return 2;
  }
  else
  {
    swift_unknownObjectRelease();

    if ((v4 & 1) != 0)
      return 0;
    else
      return 3;
  }
}

uint64_t type metadata accessor for QuickScheduleManagementViewController()
{
  uint64_t result;

  result = qword_1EEB4A148;
  if (!qword_1EEB4A148)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for EnableSchedulePromptViewController()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for OnboardPromptViewController()
{
  return objc_opt_self();
}

uint64_t sub_1A9CCE990()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1A9CCE9B4(uint64_t a1)
{
  uint64_t v1;

  sub_1A9CCAC58(a1, v1);
}

uint64_t sub_1A9CCE9BC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepDelegate;
  swift_beginAccess();
  result = MEMORY[0x1AF4203E0](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1A9CCEA10()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1A9CCEA64()
{
  return type metadata accessor for QuickScheduleManagementViewController();
}

uint64_t sub_1A9CCEA6C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A9CE6444();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for QuickScheduleManagementViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QuickScheduleManagementViewController.sleepDelegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewController.sleepDelegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewController.sleepDelegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of QuickScheduleManagementViewController.__allocating_init(sleepStore:provenanceSource:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t type metadata accessor for TintedTitleTrayButton()
{
  return objc_opt_self();
}

uint64_t sub_1A9CCEB90()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t block_copy_helper_41(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_41()
{
  return swift_release();
}

uint64_t sub_1A9CCEBCC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1A9CCEBF0(uint64_t a1)
{
  uint64_t v1;

  return sub_1A9CCDBB0(a1, *(_QWORD *)(v1 + 16));
}

id sub_1A9CCEBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  char *v7;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  objc_super v18;

  *(_QWORD *)&v7[OBJC_IVAR____TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0634EnableSchedulePromptViewController_delegate
               + 8] = 0;
  swift_unknownObjectWeakInit();
  v9 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  v18.receiver = v7;
  v18.super_class = (Class)type metadata accessor for EnableSchedulePromptViewController();
  v11 = objc_msgSendSuper2(&v18, sel_initWithTitle_detailText_icon_contentLayout_, v9, v10, a7, 2);

  v12 = (void *)objc_opt_self();
  v13 = v11;
  v14 = objc_msgSend(v12, sel_boldButton);
  objc_msgSend(v14, sel_addTarget_action_forControlEvents_, v13, sel_enableButtonAction, 64);
  v15 = (void *)sub_1A9CE82B0();
  objc_msgSend(v14, sel_setTitle_forState_, v15, 0);

  v16 = objc_msgSend(v13, sel_buttonTray);
  objc_msgSend(v16, sel_addButton_, v14);

  return v13;
}

id sub_1A9CCED94()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v0 = (id)qword_1ED264F90;
  v1 = sub_1A9CE6168();
  v3 = v2;

  v4 = (id)qword_1ED264F90;
  v5 = sub_1A9CE6168();
  v7 = v6;

  v8 = (id)qword_1ED264F90;
  v9 = sub_1A9CE6168();
  v11 = v10;

  if (qword_1EEB42F20 != -1)
    swift_once();
  v12 = (void *)qword_1EEB4A0C0;
  v13 = objc_allocWithZone((Class)type metadata accessor for EnableSchedulePromptViewController());
  v14 = sub_1A9CCEBF8(v1, v3, v5, v7, v9, v11, v12);
  swift_bridgeObjectRelease();
  return v14;
}

void sub_1A9CCEF64(const char *a1, void **a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  swift_getObjectType();
  if (qword_1ED2628A0 != -1)
    swift_once();
  v4 = sub_1A9CE6990();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED262888);
  v5 = sub_1A9CE6978();
  v6 = sub_1A9CE867C();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v11 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = sub_1A9CE8D48();
    sub_1A9B91D6C(v9, v10, &v11);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v5, v6, a1, v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v8, -1, -1);
    MEMORY[0x1AF420344](v7, -1, -1);
  }

  sub_1A9CCC800(*a2);
}

uint64_t sub_1A9CCF0FC()
{
  char *v0;
  char *v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  id v25;
  id v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *(**v35)();
  uint64_t v36;
  void *v37;
  char *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t aBlock[6];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v48 = sub_1A9CE6990();
  v3 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48, v4);
  v45 = v5;
  v46 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6, v7);
  v49 = (char *)&v41 - v8;
  if (qword_1ED2628A0 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v48, (uint64_t)qword_1ED262888);
  v10 = sub_1A9CE6978();
  v11 = sub_1A9CE867C();
  v12 = os_log_type_enabled(v10, v11);
  v47 = ObjectType;
  if (v12)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v44 = v9;
    v15 = v14;
    aBlock[0] = v14;
    *(_DWORD *)v13 = 136446210;
    v16 = sub_1A9CE8D48();
    v50 = sub_1A9B91D6C(v16, v17, aBlock);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v10, v11, "[%{public}s] Removing existing sleep schedule...", v13, 0xCu);
    swift_arrayDestroy();
    v18 = v15;
    v9 = v44;
    MEMORY[0x1AF420344](v18, -1, -1);
    MEMORY[0x1AF420344](v13, -1, -1);
  }

  v19 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver;
  if (*(_QWORD *)&v1[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver])
  {
    swift_retain();
    sub_1A9CE6D80();
    swift_release();
  }
  *(_QWORD *)&v1[v19] = 0;
  swift_release();
  sub_1A9CCB214();
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = v1;
  v42 = v3;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v21 = v48;
  v22 = v49;
  v20(v49, v9, v48);
  v23 = (void *)objc_opt_self();
  v24 = v1;
  v25 = objc_msgSend(v23, sel_unknownProvenance);
  sub_1A9CCB954();
  v26 = (id)HKSPAnalyticsScheduleChangeContext();

  sub_1A9CE8214();
  v43 = *(id *)&v24[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore];
  v41 = sub_1A9CE8208();
  swift_bridgeObjectRelease();
  v27 = v46;
  v20(v46, (uint64_t)v22, v21);
  v28 = v42;
  v29 = (*(unsigned __int8 *)(v42 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v30 = (v45 + v29 + 7) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
  v33 = v21;
  v34 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v28 + 32))(v34 + v29, v27, v21);
  *(_QWORD *)(v34 + v30) = 0;
  v35 = (void *(**)())(v34 + v31);
  v36 = v44;
  *v35 = sub_1A9CCF564;
  v35[1] = (void *(*)())v36;
  *(_QWORD *)(v34 + v32) = v24;
  *(_QWORD *)(v34 + ((v32 + 15) & 0xFFFFFFFFFFFFFFF8)) = v47;
  aBlock[4] = (uint64_t)sub_1A9CCF58C;
  aBlock[5] = v34;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A9BE4D94;
  aBlock[3] = (uint64_t)&block_descriptor_21;
  v37 = _Block_copy(aBlock);
  v38 = v24;
  swift_retain();
  swift_release();
  v39 = (void *)v41;
  objc_msgSend(v43, sel_saveCurrentSleepSchedule_options_context_completion_, 0, 0, v41, v37);
  _Block_release(v37);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v49, v33);
  return swift_release();
}

void *sub_1A9CCF564()
{
  return sub_1A9CCB3DC(0);
}

uint64_t sub_1A9CCF590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = sub_1A9CE6990();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CCF650()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_1A9CE6990() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1A9CCBD90(*(_BYTE *)(v0 + 16), v0 + v2, *(void **)(v0 + v3), *(uint64_t (**)(void))(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(void **)(v0 + ((((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_1A9CCF6C8()
{
  char *v0;
  char *v1;
  uint64_t ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  id v21;
  id v22;
  void (*v23)();
  char *v24;
  void (*v25)(char *, id, uint64_t);
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(unint64_t, char *, uint64_t);
  uint64_t v38;
  void (**v39)();
  char *v40;
  void *v41;
  char *v42;
  id v43;
  void *v44;
  char *v46;
  uint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t aBlock[6];

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = sub_1A9CE6990();
  v56 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v4);
  v53 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = v5;
  MEMORY[0x1E0C80A78](v6, v7);
  v55 = (char *)&v46 - v8;
  if (qword_1ED2628A0 != -1)
    swift_once();
  v52 = (id)__swift_project_value_buffer(v3, (uint64_t)qword_1ED262888);
  v9 = sub_1A9CE6978();
  v10 = sub_1A9CE867C();
  v11 = os_log_type_enabled(v9, v10);
  v54 = ObjectType;
  if (v11)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)v12 = 136446210;
    v14 = sub_1A9CE8D48();
    v57 = sub_1A9B91D6C(v14, v15, aBlock);
    sub_1A9CE888C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A9B87000, v9, v10, "[%{public}s] Enabling sleep schedule...", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v13, -1, -1);
    MEMORY[0x1AF420344](v12, -1, -1);
  }

  v16 = OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver;
  if (*(_QWORD *)&v1[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_appStateObserver])
  {
    swift_retain();
    sub_1A9CE6D80();
    swift_release();
  }
  *(_QWORD *)&v1[v16] = 0;
  swift_release();
  sub_1A9CCB214();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v1;
  v18 = v17;
  v19 = *(void **)&v1[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepScheduleProvider];
  v20 = v1;
  v21 = v19;
  v22 = sub_1A9C6E00C();

  objc_msgSend(v22, sel_setEnabled_, 1);
  v23 = (void (*)())swift_allocObject();
  *((_QWORD *)v23 + 2) = sub_1A9CCFDB4;
  *((_QWORD *)v23 + 3) = v18;
  v51 = v18;
  *((_QWORD *)v23 + 4) = v22;
  v49 = v22;
  v24 = v55;
  v25 = *(void (**)(char *, id, uint64_t))(v56 + 16);
  v25(v55, v52, v3);
  v26 = (void *)objc_opt_self();
  v52 = v22;
  swift_retain();
  v27 = objc_msgSend(v26, sel_unknownProvenance);
  v46 = v20;
  sub_1A9CCB954();
  v28 = (id)HKSPAnalyticsScheduleChangeContext();

  v29 = v3;
  sub_1A9CE8214();

  v48 = *(id *)&v20[OBJC_IVAR___HKSHQuickScheduleManagementViewControllerInternal_sleepStore];
  v47 = sub_1A9CE8208();
  swift_bridgeObjectRelease();
  v30 = v53;
  v25(v53, v24, v3);
  v31 = v56;
  v32 = (*(unsigned __int8 *)(v56 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
  v33 = (v50 + v32 + 7) & 0xFFFFFFFFFFFFFFF8;
  v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  v36 = swift_allocObject();
  v37 = *(void (**)(unint64_t, char *, uint64_t))(v31 + 32);
  v38 = v29;
  v37(v36 + v32, v30, v29);
  *(_QWORD *)(v36 + v33) = v49;
  v39 = (void (**)())(v36 + v34);
  *v39 = sub_1A9CCFBD0;
  v39[1] = v23;
  v40 = v46;
  *(_QWORD *)(v36 + v35) = v46;
  *(_QWORD *)(v36 + ((v35 + 15) & 0xFFFFFFFFFFFFFFF8)) = v54;
  aBlock[4] = (uint64_t)sub_1A9CCF58C;
  aBlock[5] = v36;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1A9BE4D94;
  aBlock[3] = (uint64_t)&block_descriptor_43_0;
  v41 = _Block_copy(aBlock);
  v42 = v40;
  v43 = v52;
  swift_retain();
  swift_release();
  v44 = (void *)v47;
  objc_msgSend(v48, sel_saveCurrentSleepSchedule_options_context_completion_, v43, 0, v47, v41);
  _Block_release(v41);

  (*(void (**)(char *, uint64_t))(v56 + 8))(v55, v38);
  swift_release();

  return swift_release();
}

void sub_1A9CCFBD0()
{
  uint64_t v0;

  sub_1A9CCC764(*(void (**)())(v0 + 16), *(_QWORD *)(v0 + 24), *(id *)(v0 + 32));
}

void *sub_1A9CCFBF0(void *a1)
{
  return sub_1A9CCB3DC(a1);
}

uint64_t objectdestroy_35Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_1A9CE6990();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CCFCEC(int a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v5 = *(_QWORD *)(sub_1A9CE6990() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_1A9CCBA80(a1, a2, v2 + v6, *(void **)(v2 + v7), *(_QWORD *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(void **)(v2 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v2+ ((((((v7 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

id SleepTreatmentRowViewProvider.view.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *v1;
  type metadata accessor for SleepSettingsModel();
  sub_1A9B92B9C(&qword_1EEB46650, (uint64_t (*)(uint64_t))type metadata accessor for SleepSettingsModel, (uint64_t)&protocol conformance descriptor for SleepSettingsModel);
  v4 = sub_1A9CE7200();
  v13 = v5;
  v14 = v4;
  type metadata accessor for WatchAppInstalledProvider();
  sub_1A9B92B9C(&qword_1EEB49A88, (uint64_t (*)(uint64_t))type metadata accessor for WatchAppInstalledProvider, (uint64_t)&protocol conformance descriptor for WatchAppInstalledProvider);
  v6 = sub_1A9CE7200();
  v8 = v7;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1A9CE6E64();
  swift_release();
  swift_release();
  v9 = sub_1A9CE6D8C();
  v12 = *(id *)(v3 + OBJC_IVAR____TtC13SleepHealthUI31SleepActivityConfigurationModel_watchAppInstalledProvider);
  v10 = sub_1A9CE6D8C();
  *a1 = v14;
  a1[1] = v13;
  a1[2] = v6;
  a1[3] = v8;
  a1[4] = v9;
  a1[5] = v15;
  a1[6] = v10;
  a1[7] = (uint64_t)v12;
  return v12;
}

ValueMetadata *type metadata accessor for SleepTreatmentRowViewProvider()
{
  return &type metadata for SleepTreatmentRowViewProvider;
}

uint64_t sub_1A9CCFF30()
{
  return sub_1A9BC2784(&qword_1EEB49AB0, (uint64_t (*)(uint64_t))sub_1A9CAAC64, sub_1A9CAAD78, sub_1A9CAADE0);
}

ValueMetadata *type metadata accessor for SleepTreatmentRowView()
{
  return &type metadata for SleepTreatmentRowView;
}

uint64_t sub_1A9CCFF74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CCFF84@<X0>(void *a1@<X0>, void *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
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
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  char *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;

  v23 = a3;
  v29 = a4;
  sub_1A9CD03B0();
  v27 = *(_QWORD *)(v6 - 8);
  v28 = v6;
  MEMORY[0x1E0C80A78](v6, v7);
  v26 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SleepSettingsModel();
  sub_1A9B92B9C(&qword_1EEB46650, (uint64_t (*)(uint64_t))type metadata accessor for SleepSettingsModel, (uint64_t)&protocol conformance descriptor for SleepSettingsModel);
  v9 = sub_1A9CE7200();
  v24 = v10;
  v25 = v9;
  type metadata accessor for WatchAppInstalledProvider();
  sub_1A9B92B9C(&qword_1EEB49A88, (uint64_t (*)(uint64_t))type metadata accessor for WatchAppInstalledProvider, (uint64_t)&protocol conformance descriptor for WatchAppInstalledProvider);
  v11 = sub_1A9CE7200();
  v13 = v12;
  LOBYTE(v30) = 0;
  sub_1A9CE7DC4();
  if (a1)
  {
    v14 = v32;
    v15 = v33;
    v16 = a1;
    v17 = sub_1A9CE6D8C();
    if (a2)
    {
      v18 = v17;
      v19 = a2;
      v20 = sub_1A9CE6D8C();
      v32 = v25;
      v33 = v24;
      v34 = v11;
      v35 = v13;
      v36 = v14;
      v37 = v15;
      v38 = v18;
      v39 = a1;
      v40 = v20;
      v41 = a2;
      sub_1A9CD0488();
      sub_1A9CD04F4(0);
      v30 = MEMORY[0x1E0CDDD78];
      v31 = MEMORY[0x1E0CDDD58];
      swift_getOpaqueTypeConformance2();
      sub_1A9BC2784(&qword_1EEB4A200, (uint64_t (*)(uint64_t))sub_1A9CD04F4, sub_1A9CD05DC, sub_1A9CAADE0);
      v21 = v26;
      sub_1A9CE70E0();
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v27 + 32))(v29, v21, v28);
    }
  }
  else
  {
    sub_1A9CE71F4();
    __break(1u);
  }
  result = sub_1A9CE71F4();
  __break(1u);
  return result;
}

uint64_t sub_1A9CD01E0()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v15;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v0 = (id)qword_1ED264F90;
  v1 = sub_1A9CE6168();
  v3 = v2;

  swift_bridgeObjectRelease();
  v15 = v3;
  sub_1A9BA8EA4();
  v4 = sub_1A9CE79C8();
  v6 = v5;
  LOBYTE(v3) = v7 & 1;
  v8 = objc_msgSend((id)objc_opt_self(), sel_labelColor, 0xE000000000000000, v1, v15);
  MEMORY[0x1AF41E85C](v8);
  v9 = sub_1A9CE7968();
  v11 = v10;
  v13 = v12;
  swift_release();
  sub_1A9BAA670(v4, v6, v3);
  swift_bridgeObjectRelease();
  sub_1A9CE7B24();
  sub_1A9BAA670(v9, v11, v13 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A9CD03A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A9CCFF84(*(void **)v1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

void sub_1A9CD03B0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A1E0)
  {
    sub_1A9CD0488();
    sub_1A9CD04F4(255);
    swift_getOpaqueTypeConformance2();
    sub_1A9BC2784(&qword_1EEB4A200, (uint64_t (*)(uint64_t))sub_1A9CD04F4, sub_1A9CD05DC, sub_1A9CAADE0);
    v0 = sub_1A9CE70EC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A1E0);
  }
}

void sub_1A9CD0488()
{
  unint64_t v0;
  uint64_t v1;
  _QWORD v2[2];

  if (!qword_1EEB4A1E8)
  {
    v2[0] = MEMORY[0x1E0CDDD78];
    v2[1] = MEMORY[0x1E0CDDD58];
    v0 = MEMORY[0x1AF420248](0, v2, MEMORY[0x1E0CDE6F8], 0);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A1E8);
  }
}

void sub_1A9CD04F4(uint64_t a1)
{
  sub_1A9CD0508(a1, &qword_1EEB4A1F0, sub_1A9CD056C);
}

void sub_1A9CD0508(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    sub_1A9CAAD40(255);
    v4 = sub_1A9CE7164();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1A9CD056C(uint64_t a1)
{
  sub_1A9CD0580(a1, &qword_1EEB4A1F8);
}

void sub_1A9CD0580(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    sub_1A9CAAD24(255);
    v3 = sub_1A9CE7164();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_1A9CD05DC()
{
  return sub_1A9BC2784(&qword_1EEB4A208, (uint64_t (*)(uint64_t))sub_1A9CD056C, (uint64_t (*)(void))sub_1A9CD0600, sub_1A9C2D9F8);
}

unint64_t sub_1A9CD0600()
{
  unint64_t result;

  result = qword_1EEB4A210;
  if (!qword_1EEB4A210)
  {
    result = MEMORY[0x1AF420284](&unk_1A9CF739C, &type metadata for SleepTreatmentOptionsView);
    atomic_store(result, (unint64_t *)&qword_1EEB4A210);
  }
  return result;
}

uint64_t destroy for SleepTreatmentOptionsView(id *a1)
{

  return swift_release();
}

uint64_t initializeWithCopy for SleepTreatmentOptionsView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = *(void **)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v7 = v3;
  v8 = v6;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SleepTreatmentOptionsView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v7 = *(void **)(a1 + 16);
  v8 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  v9 = v8;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SleepTreatmentOptionsView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(void **)(a1 + 16);
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SleepTreatmentOptionsView(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 48))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SleepTreatmentOptionsView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SleepTreatmentOptionsView()
{
  return &type metadata for SleepTreatmentOptionsView;
}

uint64_t sub_1A9CD0880()
{
  return sub_1A9B92B9C(&qword_1EEB4A218, (uint64_t (*)(uint64_t))sub_1A9CD03B0, MEMORY[0x1E0CD9468]);
}

uint64_t sub_1A9CD08AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CD08BC@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  _OWORD *v2;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t (*v22)();
  __int128 v23;
  uint64_t v24;
  uint64_t (**v25)();
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  _OWORD *v33;
  __int128 v34;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  _OWORD *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v2 = v1;
  v39 = a1;
  sub_1A9CD1BCC();
  v4 = v3;
  v36 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CD1D4C(0);
  v9 = v8;
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v11);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CD1DF4();
  v37 = v14;
  MEMORY[0x1E0C80A78](v14, v15);
  v38 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v2;
  sub_1A9CD1C44(0);
  sub_1A9B92B9C(&qword_1EEB4A248, (uint64_t (*)(uint64_t))sub_1A9CD1C44, MEMORY[0x1E0CE0680]);
  sub_1A9CE78E4();
  if (qword_1ED2626A8 != -1)
    swift_once();
  v17 = (id)qword_1ED264F90;
  v18 = sub_1A9CE6168();
  v20 = v19;

  swift_bridgeObjectRelease();
  v42 = v18;
  v43 = v20;
  sub_1A9B92B9C(&qword_1EEB4A258, (uint64_t (*)(uint64_t))sub_1A9CD1BCC, MEMORY[0x1E0CDD898]);
  sub_1A9BA8EA4();
  sub_1A9CE7B0C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v4);
  v21 = *v2;
  v45 = v2[1];
  v46 = v21;
  v44 = v2[2];
  v22 = (uint64_t (*)())swift_allocObject();
  v23 = v2[1];
  *((_OWORD *)v22 + 1) = *v2;
  *((_OWORD *)v22 + 2) = v23;
  *((_OWORD *)v22 + 3) = v2[2];
  v24 = (uint64_t)v38;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v38, v13, v9);
  v25 = (uint64_t (**)())(v24 + *(int *)(v37 + 36));
  *v25 = sub_1A9CD1E5C;
  v25[1] = v22;
  v25[2] = 0;
  v25[3] = 0;
  sub_1A9BBE1C0((id *)&v46);
  sub_1A9BBE1C0((id *)&v45);
  sub_1A9C7224C((uint64_t)&v44);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  sub_1A9CE8478();
  sub_1A9BBE1C0((id *)&v46);
  sub_1A9BBE1C0((id *)&v45);
  sub_1A9C7224C((uint64_t)&v44);
  v26 = sub_1A9CE846C();
  v27 = swift_allocObject();
  v28 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v27 + 16) = v26;
  *(_QWORD *)(v27 + 24) = v28;
  v29 = v2[1];
  *(_OWORD *)(v27 + 32) = *v2;
  *(_OWORD *)(v27 + 48) = v29;
  *(_OWORD *)(v27 + 64) = v2[2];
  sub_1A9BBE1C0((id *)&v46);
  sub_1A9BBE1C0((id *)&v45);
  sub_1A9C7224C((uint64_t)&v44);
  v30 = sub_1A9CE846C();
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = v30;
  *(_QWORD *)(v31 + 24) = v28;
  v32 = v2[1];
  *(_OWORD *)(v31 + 32) = *v2;
  *(_OWORD *)(v31 + 48) = v32;
  *(_OWORD *)(v31 + 64) = v2[2];
  sub_1A9CE7F08();
  sub_1A9C22D00(0, (unint64_t *)&qword_1EEB446D8, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0CDFDB8]);
  MEMORY[0x1AF41EB14](&v41);
  swift_release();
  swift_release();
  LOBYTE(v42) = v41;
  v33 = (_OWORD *)swift_allocObject();
  v34 = v2[1];
  v33[1] = *v2;
  v33[2] = v34;
  v33[3] = v2[2];
  sub_1A9BBE1C0((id *)&v46);
  sub_1A9BBE1C0((id *)&v45);
  sub_1A9C7224C((uint64_t)&v44);
  sub_1A9CD1EC4();
  sub_1A9CE7C08();
  swift_release();
  return sub_1A9B97190(v24, (uint64_t (*)(_QWORD))sub_1A9CD1DF4);
}

uint64_t sub_1A9CD0D48@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  char v38;
  uint64_t v39;

  v34 = a2;
  sub_1A9CD1D30(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v33 - v9;
  sub_1A9CD1CCC();
  v12 = v11;
  v13 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v14);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v33 - v19;
  *(_QWORD *)&v37 = sub_1A9CD1FF0(*(void **)(a1 + 16));
  *((_QWORD *)&v37 + 1) = v21;
  v38 = v22 & 1;
  v39 = v23;
  v35 = a1;
  sub_1A9C560D8();
  sub_1A9B92B9C(&qword_1EEB47FD0, (uint64_t (*)(uint64_t))sub_1A9C560D8, MEMORY[0x1E0CDFC78]);
  sub_1A9CE7F8C();
  v37 = *(_OWORD *)(a1 + 32);
  sub_1A9C22D00(0, (unint64_t *)&qword_1EEB446A0, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0CDF9A8]);
  sub_1A9CE7DD0();
  if (v36 == 1)
  {
    *(_QWORD *)&v37 = sub_1A9CD11E4();
    *((_QWORD *)&v37 + 1) = v24;
    v38 = v25 & 1;
    v39 = v26;
    MEMORY[0x1E0C80A78](v37, v24);
    *(&v33 - 2) = a1;
    sub_1A9CE7F8C();
    v27 = 0;
  }
  else
  {
    v27 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v10, v27, 1, v12);
  v28 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v28(v16, v20, v12);
  sub_1A9CD228C((uint64_t)v10, (uint64_t)v6);
  v29 = v34;
  v28(v34, v16, v12);
  sub_1A9CD1C60();
  sub_1A9CD228C((uint64_t)v6, (uint64_t)&v29[*(int *)(v30 + 48)]);
  sub_1A9B97190((uint64_t)v10, (uint64_t (*)(_QWORD))sub_1A9CD1D30);
  v31 = *(void (**)(char *, uint64_t))(v13 + 8);
  v31(v20, v12);
  sub_1A9B97190((uint64_t)v6, (uint64_t (*)(_QWORD))sub_1A9CD1D30);
  return ((uint64_t (*)(char *, uint64_t))v31)(v16, v12);
}

uint64_t sub_1A9CD0FF8(__int128 *a1)
{
  id v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v2 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  swift_bridgeObjectRelease();
  sub_1A9CE8478();
  v3 = a1[1];
  v14 = *a1;
  v12 = a1[2];
  v13 = v3;
  sub_1A9BBE1C0((id *)&v14);
  sub_1A9BBE1C0((id *)&v13);
  sub_1A9C7224C((uint64_t)&v12);
  v4 = sub_1A9CE846C();
  v5 = swift_allocObject();
  v6 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v6;
  v7 = a1[1];
  *(_OWORD *)(v5 + 32) = *a1;
  *(_OWORD *)(v5 + 48) = v7;
  *(_OWORD *)(v5 + 64) = a1[2];
  sub_1A9BBE1C0((id *)&v14);
  sub_1A9BBE1C0((id *)&v13);
  sub_1A9C7224C((uint64_t)&v12);
  v8 = sub_1A9CE846C();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v6;
  v10 = a1[1];
  *(_OWORD *)(v9 + 32) = *a1;
  *(_OWORD *)(v9 + 48) = v10;
  *(_OWORD *)(v9 + 64) = a1[2];
  sub_1A9CE7F08();
  sub_1A9BA8EA4();
  return sub_1A9CE7E90();
}

uint64_t sub_1A9CD11E4()
{
  uint64_t *v0;
  void *v1;
  id v2;
  uint64_t v3;
  unsigned __int8 v4;
  BOOL v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t result;
  uint64_t (*v14)();
  unint64_t *v15;
  void *v16;
  char v17;

  v1 = (void *)v0[2];
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = v1;
    sub_1A9CE6E64();

    swift_release();
    swift_release();
    v3 = *v0;
    if ((v17 & 1) != 0)
    {
      if (v3)
      {
        v4 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC13SleepHealthUI18SleepSettingsModel_sleepSettings), sel_sleepModeOptions);
        v5 = qword_1ED2626A8 == -1;
        if ((v4 & 8) == 0)
        {
          if (qword_1ED2626A8 != -1)
            swift_once();
LABEL_14:
          v10 = (id)qword_1ED264F90;
          sub_1A9CE6168();

          swift_bridgeObjectRelease();
LABEL_19:
          sub_1A9BA8EA4();
          return sub_1A9CE79C8();
        }
LABEL_12:
        if (!v5)
          swift_once();
        goto LABEL_14;
      }
      goto LABEL_22;
    }
    if (!v3)
    {
LABEL_22:
      type metadata accessor for SleepSettingsModel();
      v14 = type metadata accessor for SleepSettingsModel;
      v15 = &qword_1EEB46650;
      v16 = &protocol conformance descriptor for SleepSettingsModel;
      goto LABEL_23;
    }
    v6 = objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC13SleepHealthUI18SleepSettingsModel_sleepSettings), sel_sleepModeOptions);
    v7 = (void *)objc_opt_self();
    if ((v6 & 8) == 0)
    {
      v8 = (void *)sub_1A9CE82B0();
      v9 = objc_msgSend(v7, sel_modelSpecificLocalizedStringKeyForKey_, v8);

      if (!v9)
      {
        __break(1u);
        goto LABEL_12;
      }
LABEL_16:
      sub_1A9CE82E0();

      if (qword_1ED2626A8 != -1)
        swift_once();
      v12 = (id)qword_1ED264F90;
      sub_1A9CE6168();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    v11 = (void *)sub_1A9CE82B0();
    v9 = objc_msgSend(v7, sel_modelSpecificLocalizedStringKeyForKey_, v11);

    if (v9)
      goto LABEL_16;
    __break(1u);
  }
  type metadata accessor for WatchAppInstalledProvider();
  v14 = type metadata accessor for WatchAppInstalledProvider;
  v15 = &qword_1EEB49A88;
  v16 = &protocol conformance descriptor for WatchAppInstalledProvider;
LABEL_23:
  sub_1A9B92B9C(v15, (uint64_t (*)(uint64_t))v14, (uint64_t)v16);
  result = sub_1A9CE71F4();
  __break(1u);
  return result;
}

uint64_t sub_1A9CD1584(__int128 *a1)
{
  id v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v2 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  swift_bridgeObjectRelease();
  sub_1A9CE8478();
  v3 = a1[1];
  v14 = *a1;
  v12 = a1[2];
  v13 = v3;
  sub_1A9BBE1C0((id *)&v14);
  sub_1A9BBE1C0((id *)&v13);
  sub_1A9C7224C((uint64_t)&v12);
  v4 = sub_1A9CE846C();
  v5 = swift_allocObject();
  v6 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v6;
  v7 = a1[1];
  *(_OWORD *)(v5 + 32) = *a1;
  *(_OWORD *)(v5 + 48) = v7;
  *(_OWORD *)(v5 + 64) = a1[2];
  sub_1A9BBE1C0((id *)&v14);
  sub_1A9BBE1C0((id *)&v13);
  sub_1A9C7224C((uint64_t)&v12);
  v8 = sub_1A9CE846C();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v6;
  v10 = a1[1];
  *(_OWORD *)(v9 + 32) = *a1;
  *(_OWORD *)(v9 + 48) = v10;
  *(_OWORD *)(v9 + 64) = a1[2];
  sub_1A9CE7F08();
  sub_1A9BA8EA4();
  return sub_1A9CE7E90();
}

uint64_t sub_1A9CD1770(__int128 *a1)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  sub_1A9CE8478();
  v2 = a1[1];
  v15 = *a1;
  v13 = a1[2];
  v14 = v2;
  sub_1A9BBE1C0((id *)&v15);
  sub_1A9BBE1C0((id *)&v14);
  sub_1A9C7224C((uint64_t)&v13);
  v3 = sub_1A9CE846C();
  v4 = swift_allocObject();
  v5 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v5;
  v6 = a1[1];
  *(_OWORD *)(v4 + 32) = *a1;
  *(_OWORD *)(v4 + 48) = v6;
  *(_OWORD *)(v4 + 64) = a1[2];
  sub_1A9BBE1C0((id *)&v15);
  sub_1A9BBE1C0((id *)&v14);
  sub_1A9C7224C((uint64_t)&v13);
  v7 = sub_1A9CE846C();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = v5;
  v9 = a1[1];
  *(_OWORD *)(v8 + 32) = *a1;
  *(_OWORD *)(v8 + 48) = v9;
  *(_OWORD *)(v8 + 64) = a1[2];
  sub_1A9CE7F08();
  sub_1A9C22D00(0, (unint64_t *)&qword_1EEB446D8, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0CDFDB8]);
  MEMORY[0x1AF41EB14](&v11);
  swift_release();
  swift_release();
  v12 = v13;
  sub_1A9C22D00(0, (unint64_t *)&qword_1EEB446A0, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0CDF9A8]);
  return sub_1A9CE7DDC();
}

uint64_t sub_1A9CD1900()
{
  sub_1A9CE8004();
  sub_1A9CE70A4();
  return swift_release();
}

uint64_t sub_1A9CD1964@<X0>(_QWORD *a1@<X2>, BOOL *a2@<X8>)
{
  uint64_t result;

  if (*a1)
  {
    result = (uint64_t)objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC13SleepHealthUI18SleepSettingsModel_sleepSettings), sel_sleepModeOptions);
    *a2 = (result & 0x4000) != 0;
  }
  else
  {
    type metadata accessor for SleepSettingsModel();
    sub_1A9B92B9C(&qword_1EEB46650, (uint64_t (*)(uint64_t))type metadata accessor for SleepSettingsModel, (uint64_t)&protocol conformance descriptor for SleepSettingsModel);
    result = sub_1A9CE71F4();
    __break(1u);
  }
  return result;
}

void sub_1A9CD19EC(char *a1, uint64_t a2, uint64_t a3, id *a4)
{
  char v4;
  id v5;

  if (*a4)
  {
    v4 = *a1;
    v5 = *a4;
    sub_1A9C0F504(v4);

  }
  else
  {
    type metadata accessor for SleepSettingsModel();
    sub_1A9B92B9C(&qword_1EEB46650, (uint64_t (*)(uint64_t))type metadata accessor for SleepSettingsModel, (uint64_t)&protocol conformance descriptor for SleepSettingsModel);
    sub_1A9CE71F4();
    __break(1u);
  }
}

uint64_t sub_1A9CD1A78@<X0>(_QWORD *a1@<X2>, BOOL *a2@<X8>)
{
  uint64_t result;

  if (*a1)
  {
    result = (uint64_t)objc_msgSend(*(id *)(*a1 + OBJC_IVAR____TtC13SleepHealthUI18SleepSettingsModel_sleepSettings), sel_sleepModeOptions);
    *a2 = (result & 8) == 0;
  }
  else
  {
    type metadata accessor for SleepSettingsModel();
    sub_1A9B92B9C(&qword_1EEB46650, (uint64_t (*)(uint64_t))type metadata accessor for SleepSettingsModel, (uint64_t)&protocol conformance descriptor for SleepSettingsModel);
    result = sub_1A9CE71F4();
    __break(1u);
  }
  return result;
}

void sub_1A9CD1B04(char *a1, uint64_t a2, uint64_t a3, id *a4)
{
  char v4;
  id v5;

  if (*a4)
  {
    v4 = *a1;
    v5 = *a4;
    sub_1A9C0F82C((v4 & 1) == 0);

  }
  else
  {
    type metadata accessor for SleepSettingsModel();
    sub_1A9B92B9C(&qword_1EEB46650, (uint64_t (*)(uint64_t))type metadata accessor for SleepSettingsModel, (uint64_t)&protocol conformance descriptor for SleepSettingsModel);
    sub_1A9CE71F4();
    __break(1u);
  }
}

uint64_t sub_1A9CD1B94@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9CD08BC(a1);
}

void sub_1A9CD1BCC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A220)
  {
    sub_1A9CD1C44(255);
    sub_1A9B92B9C(&qword_1EEB4A248, (uint64_t (*)(uint64_t))sub_1A9CD1C44, MEMORY[0x1E0CE0680]);
    v0 = sub_1A9CE78F0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A220);
  }
}

void sub_1A9CD1C44(uint64_t a1)
{
  sub_1A9B92F34(a1, &qword_1EEB4A228, (uint64_t (*)(uint64_t))sub_1A9CD1C60, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CE0648]);
}

void sub_1A9CD1C60()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EEB4A230)
  {
    sub_1A9CD1CCC();
    sub_1A9CD1D30(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EEB4A230);
  }
}

void sub_1A9CD1CCC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A238)
  {
    sub_1A9C560D8();
    v0 = sub_1A9CE7F98();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A238);
  }
}

void sub_1A9CD1D30(uint64_t a1)
{
  sub_1A9B92F34(a1, &qword_1EEB4A240, (uint64_t (*)(uint64_t))sub_1A9CD1CCC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

void sub_1A9CD1D4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  if (!qword_1EEB4A250)
  {
    sub_1A9CD1BCC();
    v3 = v2;
    v4 = sub_1A9B92B9C(&qword_1EEB4A258, (uint64_t (*)(uint64_t))sub_1A9CD1BCC, MEMORY[0x1E0CDD898]);
    v5 = sub_1A9BA8EA4();
    v8[0] = v3;
    v8[1] = MEMORY[0x1E0DEA968];
    v8[2] = v4;
    v8[3] = v5;
    v6 = MEMORY[0x1AF420248](a1, v8, MEMORY[0x1E0CDE598], 0);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_1EEB4A250);
  }
}

void sub_1A9CD1DF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A260)
  {
    sub_1A9CD1D4C(255);
    v0 = sub_1A9CE7164();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A260);
  }
}

uint64_t sub_1A9CD1E50@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_1A9CD0D48(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1A9CD1E5C()
{
  uint64_t v0;

  return sub_1A9CD1770((__int128 *)(v0 + 16));
}

uint64_t sub_1A9CD1E68@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;

  return sub_1A9CD1964((_QWORD *)(v1 + 32), a1);
}

void sub_1A9CD1E78(char *a1)
{
  uint64_t v1;

  sub_1A9CD19EC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (id *)(v1 + 32));
}

uint64_t objectdestroyTm_10()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CD1EBC()
{
  return sub_1A9CD1900();
}

unint64_t sub_1A9CD1EC4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[6];

  result = qword_1EEB4A268;
  if (!qword_1EEB4A268)
  {
    sub_1A9CD1DF4();
    v2 = v1;
    sub_1A9CD1BCC();
    v4 = v3;
    v5 = sub_1A9B92B9C(&qword_1EEB4A258, (uint64_t (*)(uint64_t))sub_1A9CD1BCC, MEMORY[0x1E0CDD898]);
    v6 = sub_1A9BA8EA4();
    v7[2] = v4;
    v7[3] = MEMORY[0x1E0DEA968];
    v7[4] = v5;
    v7[5] = v6;
    v7[0] = swift_getOpaqueTypeConformance2();
    v7[1] = MEMORY[0x1E0CDC8B0];
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD9C20], v2, v7);
    atomic_store(result, (unint64_t *)&qword_1EEB4A268);
  }
  return result;
}

uint64_t sub_1A9CD1F84()
{
  sub_1A9C22D00(0, (unint64_t *)&qword_1EEB446A0, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0CDF9A8]);
  return sub_1A9CE7DDC();
}

uint64_t sub_1A9CD1FF0(void *a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t result;
  char v9;

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v2 = a1;
    sub_1A9CE6E64();

    swift_release();
    swift_release();
    if ((v9 & 1) != 0)
    {
      if (qword_1ED2626A8 != -1)
        swift_once();
      v3 = (id)qword_1ED264F90;
      sub_1A9CE6168();

      swift_bridgeObjectRelease();
LABEL_10:
      sub_1A9BA8EA4();
      return sub_1A9CE79C8();
    }
    v4 = (void *)objc_opt_self();
    v5 = (void *)sub_1A9CE82B0();
    v6 = objc_msgSend(v4, sel_modelSpecificLocalizedStringKeyForKey_, v5);

    if (v6)
    {
      sub_1A9CE82E0();

      if (qword_1ED2626A8 != -1)
        swift_once();
      v7 = (id)qword_1ED264F90;
      sub_1A9CE6168();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_10;
    }
    __break(1u);
  }
  type metadata accessor for WatchAppInstalledProvider();
  sub_1A9B92B9C(&qword_1EEB49A88, (uint64_t (*)(uint64_t))type metadata accessor for WatchAppInstalledProvider, (uint64_t)&protocol conformance descriptor for WatchAppInstalledProvider);
  result = sub_1A9CE71F4();
  __break(1u);
  return result;
}

uint64_t sub_1A9CD2284()
{
  uint64_t v0;

  return sub_1A9CD0FF8(*(__int128 **)(v0 + 16));
}

uint64_t sub_1A9CD228C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A9CD1D30(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A9CD22D0()
{
  uint64_t v0;

  return sub_1A9CD1584(*(__int128 **)(v0 + 16));
}

uint64_t sub_1A9CD22DC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;

  return sub_1A9CD1A78((_QWORD *)(v1 + 32), a1);
}

void sub_1A9CD22EC(char *a1)
{
  uint64_t v1;

  sub_1A9CD1B04(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), (id *)(v1 + 32));
}

uint64_t objectdestroy_6Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CD2344()
{
  sub_1A9CD1DF4();
  sub_1A9CD1EC4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CD23A8@<X0>(uint64_t *a1@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t result;

  if (qword_1ED2626A8 != -1)
    swift_once();
  v2 = (id)qword_1ED264F90;
  v3 = sub_1A9CE6168();
  v5 = v4;

  swift_bridgeObjectRelease();
  v6 = (id)qword_1ED264F90;
  v7 = sub_1A9CE6168();
  v9 = v8;

  swift_bridgeObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_quaternarySystemFillColor, 0xE000000000000000);
  result = MEMORY[0x1AF41E85C](v10);
  *a1 = v3;
  a1[1] = v5;
  a1[2] = v7;
  a1[3] = v9;
  a1[4] = result;
  return result;
}

uint64_t TrailingDetailViewModel.titleText.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrailingDetailViewModel.detailText.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TrailingDetailViewModel.backgroundColor.getter()
{
  return swift_retain();
}

uint64_t TrailingDetailViewModel.init(titleText:detailText:backgroundColor:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t result;

  result = MEMORY[0x1AF41E85C](a5);
  *a6 = a1;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = result;
  return result;
}

uint64_t sub_1A9CD25C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  sub_1A9BA8EA4();
  swift_bridgeObjectRetain();
  v2 = sub_1A9CE79C8();
  v4 = v3;
  v6 = v5 & 1;
  v7 = (void *)objc_opt_self();
  MEMORY[0x1AF41E85C](objc_msgSend(v7, sel_labelColor));
  v8 = sub_1A9CE7968();
  v25 = v9;
  v26 = v8;
  v11 = v10;
  v27 = v12;
  swift_release();
  sub_1A9BAA670(v2, v4, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v13 = sub_1A9CE79C8();
  v15 = v14;
  v17 = v16 & 1;
  MEMORY[0x1AF41E85C](objc_msgSend(v7, sel_secondaryLabelColor));
  v18 = sub_1A9CE7968();
  v20 = v19;
  LOBYTE(v2) = v21;
  v23 = v22;
  swift_release();
  sub_1A9BAA670(v13, v15, v17);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v26;
  *(_QWORD *)(a1 + 8) = v25;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v27;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v18;
  *(_QWORD *)(a1 + 56) = v20;
  *(_BYTE *)(a1 + 64) = v2 & 1;
  *(_QWORD *)(a1 + 72) = v23;
  sub_1A9BAA680(v26, v25, v11 & 1);
  swift_bridgeObjectRetain();
  sub_1A9BAA680(v18, v20, v2 & 1);
  swift_bridgeObjectRetain();
  sub_1A9BAA670(v18, v20, v2 & 1);
  swift_bridgeObjectRelease();
  sub_1A9BAA670(v26, v25, v11 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A9CD27E8@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v3 = v1[1];
  v25 = *v1;
  v26 = v3;
  v27 = *((_QWORD *)v1 + 4);
  v15 = sub_1A9CE7398();
  sub_1A9CD25C4((uint64_t)v16);
  v4 = v16[0];
  v5 = v16[1];
  v6 = v17;
  v7 = v18;
  v8 = v19;
  v9 = v20;
  v10 = v21;
  v11 = v22;
  v12 = v23;
  v14 = v24;
  v16[0] = v27;
  swift_retain();
  result = sub_1A9CE7ED8();
  *(_QWORD *)a1 = v15;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v10;
  *(_QWORD *)(a1 + 80) = v11;
  *(_BYTE *)(a1 + 88) = v12;
  *(_QWORD *)(a1 + 96) = v14;
  *(_QWORD *)(a1 + 104) = result;
  return result;
}

uint64_t _s13SleepHealthUI23TrailingDetailViewModelV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if ((v6 || (sub_1A9CE8BB0() & 1) != 0) && (v2 == v4 ? (v7 = v3 == v5) : (v7 = 0), v7 || (sub_1A9CE8BB0() & 1) != 0))
    return sub_1A9CE7C44();
  else
    return 0;
}

ValueMetadata *type metadata accessor for TrailingDetailViewModel()
{
  return &type metadata for TrailingDetailViewModel;
}

_QWORD *_s13SleepHealthUI23TrailingDetailViewModelVwcp_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *_s13SleepHealthUI23TrailingDetailViewModelVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t _s13SleepHealthUI23TrailingDetailViewModelVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t _s13SleepHealthUI23TrailingDetailViewModelVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1A9CD2B04(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TrailingDetailRow()
{
  return &type metadata for TrailingDetailRow;
}

uint64_t sub_1A9CD2B5C()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1A9CD2B70()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB4A270;
  if (!qword_1EEB4A270)
  {
    sub_1A9CD2BD8();
    v2 = v1;
    v3[0] = sub_1A9CD2CEC();
    v3[1] = sub_1A9CD2D54();
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD9C20], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A270);
  }
  return result;
}

void sub_1A9CD2BD8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A278)
  {
    sub_1A9C9EC8C(255, (unint64_t *)&qword_1EEB46A48, (uint64_t (*)(uint64_t))sub_1A9CD2C7C, (uint64_t (*)(void))sub_1A9C1B9B0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CDFAF0]);
    sub_1A9C9EC8C(255, (unint64_t *)&qword_1EEB45F48, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC800], sub_1A9CD2CD0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CDBED0]);
    v0 = sub_1A9CE7164();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A278);
  }
}

void sub_1A9CD2C7C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB46A50)
  {
    sub_1A9C1B948();
    v0 = sub_1A9CE8010();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB46A50);
  }
}

uint64_t sub_1A9CD2CD0()
{
  return sub_1A9B92B9C(&qword_1EEB45F50, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC800], MEMORY[0x1E0CDC7F8]);
}

unint64_t sub_1A9CD2CEC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEB46A68;
  if (!qword_1EEB46A68)
  {
    sub_1A9C9EC8C(255, (unint64_t *)&qword_1EEB46A48, (uint64_t (*)(uint64_t))sub_1A9CD2C7C, (uint64_t (*)(void))sub_1A9C1B9B0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CDFAF0]);
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CDFB10], v1);
    atomic_store(result, (unint64_t *)&qword_1EEB46A68);
  }
  return result;
}

unint64_t sub_1A9CD2D54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEB45F68;
  if (!qword_1EEB45F68)
  {
    sub_1A9C9EC8C(255, (unint64_t *)&qword_1EEB45F48, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDC800], sub_1A9CD2CD0, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CDBED0]);
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CDBEF0], v1);
    atomic_store(result, (unint64_t *)&qword_1EEB45F68);
  }
  return result;
}

uint64_t sub_1A9CD2DBC(void (*a1)(uint64_t *__return_ptr, char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  char *v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v6)
  {
    v13 = MEMORY[0x1E0DEE9D8];
    sub_1A9CE8A18();
    v9 = (char *)(a3 + 32);
    while (1)
    {
      v10 = *v9++;
      v11 = v10;
      a1(&v12, &v11);
      if (v4)
        break;
      v4 = 0;
      sub_1A9CE89F4();
      sub_1A9CE8A24();
      sub_1A9CE8A30();
      sub_1A9CE8A00();
      if (!--v6)
        return v13;
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1A9CD2EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  _BYTE *i;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v20[2];
  _QWORD v21[3];
  char v22;
  uint64_t v23;

  v4 = v3;
  v20[0] = a1;
  v20[1] = a2;
  v6 = type metadata accessor for DayRelativeDuration(0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a3 + 16);
  v12 = MEMORY[0x1E0DEE9D8];
  if (v11)
  {
    v23 = MEMORY[0x1E0DEE9D8];
    sub_1A9BE0558(0, v11, 0);
    v12 = v23;
    for (i = (_BYTE *)(a3 + 56); ; i += 32)
    {
      v14 = *((_QWORD *)i - 2);
      v15 = *((_QWORD *)i - 1);
      v16 = *i;
      v21[0] = *((_QWORD *)i - 3);
      v21[1] = v14;
      v21[2] = v15;
      v22 = v16;
      ((void (*)(_QWORD *))v20[0])(v21);
      if (v4)
        break;
      v4 = 0;
      v23 = v12;
      v18 = *(_QWORD *)(v12 + 16);
      v17 = *(_QWORD *)(v12 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_1A9BE0558(v17 > 1, v18 + 1, 1);
        v12 = v23;
      }
      *(_QWORD *)(v12 + 16) = v18 + 1;
      sub_1A9CD46A8((uint64_t)v10, v12+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v18);
      if (!--v11)
        return v12;
    }
    swift_release();
  }
  return v12;
}

uint64_t sub_1A9CD300C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = a4 - a3;
  if (__OFSUB__(a4, a3))
    goto LABEL_19;
  v6 = v4;
  v7 = (void (*)(uint64_t *__return_ptr, uint64_t *))result;
  result = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    result = sub_1A9CE8A18();
    if (v5 < 0)
    {
LABEL_20:
      __break(1u);
      return result;
    }
    if (a4 <= a3)
      v10 = a3;
    else
      v10 = a4;
    v11 = a3;
    while (a4 != v11)
    {
      v12 = v11;
      v7(&v13, &v12);
      if (v6)
        return swift_release();
      v6 = 0;
      sub_1A9CE89F4();
      sub_1A9CE8A24();
      sub_1A9CE8A30();
      result = sub_1A9CE8A00();
      if (a4 < a3)
        goto LABEL_17;
      if (v10 == v11)
        goto LABEL_18;
      if (a4 == ++v11)
        return v14;
    }
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  return result;
}

id HKSleepDaySummary.sleepDurationGoalInterval.getter()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(v0, sel_sleepDurationGoal);
  v2 = result;
  if (result)
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_secondUnit);
    objc_msgSend(v2, sel_doubleValueForUnit_, v3);
    v5 = v4;

    return (id)v5;
  }
  return result;
}

uint64_t static HKSleepDaySummary.demoSummaries(in:calendar:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[10];

  result = sub_1A9CD3568();
  v9 = *(_QWORD *)(result + 16);
  if (!v9)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (__OFSUB__(v9, a2 % v9))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if ((a2 & 0x8000000000000000) == 0)
  {
    MEMORY[0x1E0C80A78](result, v8);
    v13[2] = v11;
    v13[3] = v10;
    v13[4] = a1;
    v13[5] = a2;
    v13[6] = &unk_1E55D2DE8;
    v13[7] = a3;
    v13[8] = v3;
    v12 = sub_1A9CD300C((uint64_t)sub_1A9CD3D98, (uint64_t)v13, 0, a2);
    swift_bridgeObjectRelease();
    return v12;
  }
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *sub_1A9CD3298@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t *a7@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;

  v8 = *result;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(a3 + 16);
  if (!v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v10 = a4 + v8;
  if (__OFADD__(a4, v8))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v11 = (*result + a2) % v9;
  if ((v11 & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v11 < *(_QWORD *)(a5 + 16))
  {
    v13 = 8 * v11;
    v14 = *(_QWORD *)(a3 + v13 + 32);
    v15 = *(void (**)(char *, uint64_t))(a5 + v13 + 32);
    swift_bridgeObjectRetain();
    v16 = sub_1A9CD3F5C(v10, v14, v15, a6);
    result = (_QWORD *)swift_bridgeObjectRelease();
    *a7 = v16;
    return result;
  }
LABEL_11:
  __break(1u);
  return result;
}

id sub_1A9CD3358(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t v18;

  v4 = sub_1A9CE62E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1A9CE5F64();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x1E0C80A78](v9, v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16))(v8, a2, v4, v12);
  sub_1A9CE5F28();
  v15 = (void *)sub_1A9CE5EEC();
  v16 = objc_msgSend((id)objc_opt_self(), sel_sleepPeriodSegmentWithDateInterval_category_, v15, a1);

  sub_1A9CE5F10();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(a2, v8, v4);
  return v16;
}

uint64_t sub_1A9CD34A4(uint64_t a1, void (*a2)(uint64_t, double))
{
  uint64_t v3;
  uint64_t result;
  double *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1A9CE8A18();
    v6 = (double *)(a1 + 40);
    do
    {
      v7 = *((_QWORD *)v6 - 1);
      v8 = *v6;
      v6 += 2;
      a2(v7, v8);
      sub_1A9CE89F4();
      sub_1A9CE8A24();
      sub_1A9CE8A30();
      sub_1A9CE8A00();
      --v3;
    }
    while (v3);
    return v9;
  }
  return result;
}

uint64_t sub_1A9CD3568()
{
  uint64_t (*v0)(uint64_t, uint64_t);
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

  v0 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8];
  sub_1A9B92F34(0, &qword_1EEB4A288, (uint64_t (*)(uint64_t))sub_1A9CD4628, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1A9CF7510;
  sub_1A9B92F34(0, qword_1EEB4A2A0, (uint64_t (*)(uint64_t))sub_1A9CD4644, v0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1A9CF7520;
  *(_QWORD *)(v2 + 32) = 5;
  *(_QWORD *)(v2 + 40) = 0x4076800000000000;
  *(_QWORD *)(v2 + 48) = 4;
  *(_QWORD *)(v2 + 56) = 0x4076800000000000;
  *(_QWORD *)(v2 + 64) = 2;
  *(_QWORD *)(v2 + 72) = 0x4086800000000000;
  *(_QWORD *)(v2 + 80) = 3;
  *(_QWORD *)(v2 + 88) = 0x4096800000000000;
  *(_QWORD *)(v2 + 96) = 4;
  *(_QWORD *)(v2 + 104) = 0x4076800000000000;
  *(_QWORD *)(v2 + 112) = 3;
  *(_QWORD *)(v2 + 120) = 0x4090E00000000000;
  *(_QWORD *)(v2 + 128) = 4;
  *(_QWORD *)(v2 + 136) = 0x4076800000000000;
  *(_QWORD *)(v2 + 144) = 3;
  *(_QWORD *)(v2 + 152) = 0x40A9500000000000;
  *(_QWORD *)(v2 + 160) = 5;
  *(_QWORD *)(v2 + 168) = 0x409C200000000000;
  *(_QWORD *)(v2 + 176) = 3;
  *(_QWORD *)(v2 + 184) = 0x40B3B00000000000;
  *(_QWORD *)(v2 + 192) = 5;
  *(_QWORD *)(v2 + 200) = 0x409C200000000000;
  *(_QWORD *)(v2 + 208) = 3;
  *(_QWORD *)(v2 + 216) = 0x40AC200000000000;
  *(_QWORD *)(v2 + 224) = 5;
  *(_QWORD *)(v2 + 232) = 0x409C200000000000;
  *(_QWORD *)(v2 + 240) = 3;
  *(_QWORD *)(v2 + 248) = 0x40A6800000000000;
  *(_QWORD *)(v2 + 256) = 5;
  *(_QWORD *)(v2 + 264) = 0x4096800000000000;
  *(_QWORD *)(v1 + 32) = v2;
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A9CF7530;
  *(_QWORD *)(v3 + 32) = 4;
  *(_QWORD *)(v3 + 40) = 0x4076800000000000;
  *(_QWORD *)(v3 + 48) = 5;
  *(_QWORD *)(v3 + 56) = 0x4086800000000000;
  *(_QWORD *)(v3 + 64) = 3;
  *(_QWORD *)(v3 + 72) = 0x40A9500000000000;
  *(_QWORD *)(v3 + 80) = 4;
  *(_QWORD *)(v3 + 88) = 0x4076800000000000;
  *(_QWORD *)(v3 + 96) = 3;
  *(_QWORD *)(v3 + 104) = 0x40B0E00000000000;
  *(_QWORD *)(v3 + 112) = 5;
  *(_QWORD *)(v3 + 120) = 0x4076800000000000;
  *(_QWORD *)(v3 + 128) = 3;
  *(_QWORD *)(v3 + 136) = 0x40B0E00000000000;
  *(_QWORD *)(v3 + 144) = 5;
  *(_QWORD *)(v3 + 152) = 0x40AC200000000000;
  *(_QWORD *)(v3 + 160) = 3;
  *(_QWORD *)(v3 + 168) = 0x40AEF00000000000;
  *(_QWORD *)(v3 + 176) = 5;
  *(_QWORD *)(v3 + 184) = 0x40A0E00000000000;
  *(_QWORD *)(v3 + 192) = 3;
  *(_QWORD *)(v3 + 200) = 0x4090E00000000000;
  *(_QWORD *)(v1 + 40) = v3;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1A9CF7540;
  *(_QWORD *)(v4 + 32) = 5;
  *(_QWORD *)(v4 + 40) = 0x4076800000000000;
  *(_QWORD *)(v4 + 48) = 2;
  *(_QWORD *)(v4 + 56) = 0x4076800000000000;
  *(_QWORD *)(v4 + 64) = 5;
  *(_QWORD *)(v4 + 72) = 0x4076800000000000;
  *(_QWORD *)(v4 + 80) = 3;
  *(_QWORD *)(v4 + 88) = 0x4090E00000000000;
  *(_QWORD *)(v4 + 96) = 2;
  *(_QWORD *)(v4 + 104) = 0x409C200000000000;
  *(_QWORD *)(v4 + 112) = 5;
  *(_QWORD *)(v4 + 120) = 0x4076800000000000;
  *(_QWORD *)(v4 + 128) = 3;
  *(_QWORD *)(v4 + 136) = 0x409C200000000000;
  *(_QWORD *)(v4 + 144) = 4;
  *(_QWORD *)(v4 + 152) = 0x4076800000000000;
  *(_QWORD *)(v4 + 160) = 3;
  *(_QWORD *)(v4 + 168) = 0x40B0E00000000000;
  *(_QWORD *)(v4 + 176) = 4;
  *(_QWORD *)(v4 + 184) = 0x4076800000000000;
  *(_QWORD *)(v4 + 192) = 3;
  *(_QWORD *)(v4 + 200) = 0x4096800000000000;
  *(_QWORD *)(v4 + 208) = 5;
  *(_QWORD *)(v4 + 216) = 0x40AC200000000000;
  *(_QWORD *)(v4 + 224) = 3;
  *(_QWORD *)(v4 + 232) = 0x40A0E00000000000;
  *(_QWORD *)(v4 + 240) = 4;
  *(_QWORD *)(v4 + 248) = 0x4076800000000000;
  *(_QWORD *)(v4 + 256) = 3;
  *(_QWORD *)(v4 + 264) = 0x4096800000000000;
  *(_QWORD *)(v4 + 272) = 5;
  *(_QWORD *)(v4 + 280) = 0x4096800000000000;
  *(_QWORD *)(v4 + 288) = 3;
  *(_QWORD *)(v4 + 296) = 0x409C200000000000;
  *(_QWORD *)(v4 + 304) = 5;
  *(_QWORD *)(v4 + 312) = 0x40A6800000000000;
  *(_QWORD *)(v1 + 48) = v4;
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A9CF7550;
  *(_QWORD *)(v5 + 32) = 3;
  *(_QWORD *)(v5 + 40) = 0x4076800000000000;
  *(_QWORD *)(v5 + 48) = 5;
  *(_QWORD *)(v5 + 56) = 0x4076800000000000;
  *(_QWORD *)(v5 + 64) = 3;
  *(_QWORD *)(v5 + 72) = 0x40B0E00000000000;
  *(_QWORD *)(v5 + 80) = 5;
  *(_QWORD *)(v5 + 88) = 0x4086800000000000;
  *(_QWORD *)(v5 + 96) = 3;
  *(_QWORD *)(v5 + 104) = 0x40AC200000000000;
  *(_QWORD *)(v5 + 112) = 5;
  *(_QWORD *)(v5 + 120) = 0x409C200000000000;
  *(_QWORD *)(v5 + 128) = 3;
  *(_QWORD *)(v5 + 136) = 0x40A3B00000000000;
  *(_QWORD *)(v5 + 144) = 4;
  *(_QWORD *)(v5 + 152) = 0x4086800000000000;
  *(_QWORD *)(v5 + 160) = 3;
  *(_QWORD *)(v5 + 168) = 0x408A400000000000;
  *(_QWORD *)(v5 + 176) = 5;
  *(_QWORD *)(v5 + 184) = 0x4096800000000000;
  *(_QWORD *)(v5 + 192) = 3;
  *(_QWORD *)(v5 + 200) = 0x40A6800000000000;
  *(_QWORD *)(v5 + 208) = 5;
  *(_QWORD *)(v5 + 216) = 0x40A6800000000000;
  *(_QWORD *)(v5 + 224) = 3;
  *(_QWORD *)(v5 + 232) = 0x40AC200000000000;
  *(_QWORD *)(v1 + 56) = v5;
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1A9CF7550;
  *(_QWORD *)(v6 + 32) = 3;
  *(_QWORD *)(v6 + 40) = 0x409C200000000000;
  *(_QWORD *)(v6 + 48) = 4;
  *(_QWORD *)(v6 + 56) = 0x4090E00000000000;
  *(_QWORD *)(v6 + 64) = 3;
  *(_QWORD *)(v6 + 72) = 0x4090E00000000000;
  *(_QWORD *)(v6 + 80) = 5;
  *(_QWORD *)(v6 + 88) = 0x4090E00000000000;
  *(_QWORD *)(v6 + 96) = 3;
  *(_QWORD *)(v6 + 104) = 0x40B2480000000000;
  *(_QWORD *)(v6 + 112) = 5;
  *(_QWORD *)(v6 + 120) = 0x409C200000000000;
  *(_QWORD *)(v6 + 128) = 3;
  *(_QWORD *)(v6 + 136) = 0x40AEF00000000000;
  *(_QWORD *)(v6 + 144) = 5;
  *(_QWORD *)(v6 + 152) = 0x40A3B00000000000;
  *(_QWORD *)(v6 + 160) = 3;
  *(_QWORD *)(v6 + 168) = 0x40A9500000000000;
  *(_QWORD *)(v6 + 176) = 5;
  *(_QWORD *)(v6 + 184) = 0x40B0E00000000000;
  *(_QWORD *)(v6 + 192) = 3;
  *(_QWORD *)(v6 + 200) = 0x4076800000000000;
  *(_QWORD *)(v6 + 208) = 2;
  *(_QWORD *)(v6 + 216) = 0x4076800000000000;
  *(_QWORD *)(v6 + 224) = 3;
  *(_QWORD *)(v6 + 232) = 0x4066800000000000;
  *(_QWORD *)(v1 + 64) = v6;
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A9CF7550;
  *(_QWORD *)(v7 + 32) = 5;
  *(_QWORD *)(v7 + 40) = 0x4076800000000000;
  *(_QWORD *)(v7 + 48) = 3;
  *(_QWORD *)(v7 + 56) = 0x40AEF00000000000;
  *(_QWORD *)(v7 + 64) = 5;
  *(_QWORD *)(v7 + 72) = 0x4090E00000000000;
  *(_QWORD *)(v7 + 80) = 3;
  *(_QWORD *)(v7 + 88) = 0x40B3B00000000000;
  *(_QWORD *)(v7 + 96) = 5;
  *(_QWORD *)(v7 + 104) = 0x40A0E00000000000;
  *(_QWORD *)(v7 + 112) = 3;
  *(_QWORD *)(v7 + 120) = 0x40B6800000000000;
  *(_QWORD *)(v7 + 128) = 5;
  *(_QWORD *)(v7 + 136) = 0x4076800000000000;
  *(_QWORD *)(v7 + 144) = 2;
  *(_QWORD *)(v7 + 152) = 0x4076800000000000;
  *(_QWORD *)(v7 + 160) = 5;
  *(_QWORD *)(v7 + 168) = 0x4076800000000000;
  *(_QWORD *)(v7 + 176) = 3;
  *(_QWORD *)(v7 + 184) = 0x40A3B00000000000;
  *(_QWORD *)(v7 + 192) = 5;
  *(_QWORD *)(v7 + 200) = 0x4096800000000000;
  *(_QWORD *)(v7 + 208) = 3;
  *(_QWORD *)(v7 + 216) = 0x40A0E00000000000;
  *(_QWORD *)(v7 + 224) = 5;
  *(_QWORD *)(v7 + 232) = 0x408A400000000000;
  *(_QWORD *)(v1 + 72) = v7;
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1A9CF7560;
  *(_QWORD *)(v8 + 32) = 3;
  *(_QWORD *)(v8 + 40) = 0x4096800000000000;
  *(_QWORD *)(v8 + 48) = 4;
  *(_QWORD *)(v8 + 56) = 0x4076800000000000;
  *(_QWORD *)(v8 + 64) = 3;
  *(_QWORD *)(v8 + 72) = 0x4086800000000000;
  *(_QWORD *)(v8 + 80) = 2;
  *(_QWORD *)(v8 + 88) = 0x4076800000000000;
  *(_QWORD *)(v8 + 96) = 3;
  *(_QWORD *)(v8 + 104) = 0x4086800000000000;
  *(_QWORD *)(v8 + 112) = 5;
  *(_QWORD *)(v8 + 120) = 0x40A0E00000000000;
  *(_QWORD *)(v8 + 128) = 3;
  *(_QWORD *)(v8 + 136) = 0x4090E00000000000;
  *(_QWORD *)(v8 + 144) = 4;
  *(_QWORD *)(v8 + 152) = 0x4090E00000000000;
  *(_QWORD *)(v8 + 160) = 3;
  *(_QWORD *)(v8 + 168) = 0x40A0E00000000000;
  *(_QWORD *)(v8 + 176) = 5;
  *(_QWORD *)(v8 + 184) = 0x4090E00000000000;
  *(_QWORD *)(v8 + 192) = 3;
  *(_QWORD *)(v8 + 200) = 0x4076800000000000;
  *(_QWORD *)(v8 + 208) = 5;
  *(_QWORD *)(v8 + 216) = 0x4076800000000000;
  *(_QWORD *)(v8 + 224) = 3;
  *(_QWORD *)(v8 + 232) = 0x40B5180000000000;
  *(_QWORD *)(v8 + 240) = 5;
  *(_QWORD *)(v8 + 248) = 0x40B0E00000000000;
  *(_QWORD *)(v8 + 256) = 3;
  *(_QWORD *)(v8 + 264) = 0x40A6800000000000;
  *(_QWORD *)(v8 + 272) = 5;
  *(_QWORD *)(v8 + 280) = 0x4086800000000000;
  *(_QWORD *)(v1 + 80) = v8;
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1A9CF7560;
  *(_QWORD *)(v9 + 32) = 5;
  *(_QWORD *)(v9 + 40) = 0x4076800000000000;
  *(_QWORD *)(v9 + 48) = 4;
  *(_QWORD *)(v9 + 56) = 0x4076800000000000;
  *(_QWORD *)(v9 + 64) = 2;
  *(_QWORD *)(v9 + 72) = 0x4086800000000000;
  *(_QWORD *)(v9 + 80) = 3;
  *(_QWORD *)(v9 + 88) = 0x4096800000000000;
  *(_QWORD *)(v9 + 96) = 4;
  *(_QWORD *)(v9 + 104) = 0x4076800000000000;
  *(_QWORD *)(v9 + 112) = 3;
  *(_QWORD *)(v9 + 120) = 0x4090E00000000000;
  *(_QWORD *)(v9 + 128) = 4;
  *(_QWORD *)(v9 + 136) = 0x4076800000000000;
  *(_QWORD *)(v9 + 144) = 3;
  *(_QWORD *)(v9 + 152) = 0x40A9500000000000;
  *(_QWORD *)(v9 + 160) = 5;
  *(_QWORD *)(v9 + 168) = 0x409C200000000000;
  *(_QWORD *)(v9 + 176) = 3;
  *(_QWORD *)(v9 + 184) = 0x40B3B00000000000;
  *(_QWORD *)(v9 + 192) = 5;
  *(_QWORD *)(v9 + 200) = 0x409C200000000000;
  *(_QWORD *)(v9 + 208) = 3;
  *(_QWORD *)(v9 + 216) = 0x40AC200000000000;
  *(_QWORD *)(v9 + 224) = 5;
  *(_QWORD *)(v9 + 232) = 0x409C200000000000;
  *(_QWORD *)(v9 + 240) = 3;
  *(_QWORD *)(v9 + 248) = 0x40A6800000000000;
  *(_QWORD *)(v9 + 256) = 5;
  *(_QWORD *)(v9 + 264) = 0x4096800000000000;
  *(_QWORD *)(v9 + 272) = 3;
  *(_QWORD *)(v9 + 280) = 0x40A6800000000000;
  *(_QWORD *)(v1 + 88) = v9;
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1A9CF7550;
  *(_QWORD *)(v10 + 32) = 4;
  *(_QWORD *)(v10 + 40) = 0x4076800000000000;
  *(_QWORD *)(v10 + 48) = 5;
  *(_QWORD *)(v10 + 56) = 0x4086800000000000;
  *(_QWORD *)(v10 + 64) = 3;
  *(_QWORD *)(v10 + 72) = 0x40A9500000000000;
  *(_QWORD *)(v10 + 80) = 4;
  *(_QWORD *)(v10 + 88) = 0x4076800000000000;
  *(_QWORD *)(v10 + 96) = 3;
  *(_QWORD *)(v10 + 104) = 0x40B0E00000000000;
  *(_QWORD *)(v10 + 112) = 5;
  *(_QWORD *)(v10 + 120) = 0x4076800000000000;
  *(_QWORD *)(v10 + 128) = 3;
  *(_QWORD *)(v10 + 136) = 0x40B0E00000000000;
  *(_QWORD *)(v10 + 144) = 5;
  *(_QWORD *)(v10 + 152) = 0x40AC200000000000;
  *(_QWORD *)(v10 + 160) = 3;
  *(_QWORD *)(v10 + 168) = 0x40AEF00000000000;
  *(_QWORD *)(v10 + 176) = 5;
  *(_QWORD *)(v10 + 184) = 0x40A0E00000000000;
  *(_QWORD *)(v10 + 192) = 3;
  *(_QWORD *)(v10 + 200) = 0x40AC200000000000;
  *(_QWORD *)(v10 + 208) = 5;
  *(_QWORD *)(v10 + 216) = 0x4090E00000000000;
  *(_QWORD *)(v10 + 224) = 3;
  *(_QWORD *)(v10 + 232) = 0x40A0E00000000000;
  *(_QWORD *)(v1 + 96) = v10;
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1A9CF7540;
  *(_QWORD *)(v11 + 32) = 5;
  *(_QWORD *)(v11 + 40) = 0x4076800000000000;
  *(_QWORD *)(v11 + 48) = 2;
  *(_QWORD *)(v11 + 56) = 0x4076800000000000;
  *(_QWORD *)(v11 + 64) = 5;
  *(_QWORD *)(v11 + 72) = 0x4076800000000000;
  *(_QWORD *)(v11 + 80) = 3;
  *(_QWORD *)(v11 + 88) = 0x4090E00000000000;
  *(_QWORD *)(v11 + 96) = 2;
  *(_QWORD *)(v11 + 104) = 0x409C200000000000;
  *(_QWORD *)(v11 + 112) = 5;
  *(_QWORD *)(v11 + 120) = 0x4076800000000000;
  *(_QWORD *)(v11 + 128) = 3;
  *(_QWORD *)(v11 + 136) = 0x409C200000000000;
  *(_QWORD *)(v11 + 144) = 4;
  *(_QWORD *)(v11 + 152) = 0x4076800000000000;
  *(_QWORD *)(v11 + 160) = 3;
  *(_QWORD *)(v11 + 168) = 0x40B0E00000000000;
  *(_QWORD *)(v11 + 176) = 4;
  *(_QWORD *)(v11 + 184) = 0x4076800000000000;
  *(_QWORD *)(v11 + 192) = 3;
  *(_QWORD *)(v11 + 200) = 0x40B3B00000000000;
  *(_QWORD *)(v11 + 208) = 5;
  *(_QWORD *)(v11 + 216) = 0x40AC200000000000;
  *(_QWORD *)(v11 + 224) = 3;
  *(_QWORD *)(v11 + 232) = 0x40A0E00000000000;
  *(_QWORD *)(v11 + 240) = 4;
  *(_QWORD *)(v11 + 248) = 0x4076800000000000;
  *(_QWORD *)(v11 + 256) = 3;
  *(_QWORD *)(v11 + 264) = 0x4096800000000000;
  *(_QWORD *)(v11 + 272) = 5;
  *(_QWORD *)(v11 + 280) = 0x4096800000000000;
  *(_QWORD *)(v11 + 288) = 3;
  *(_QWORD *)(v11 + 296) = 0x409C200000000000;
  *(_QWORD *)(v11 + 304) = 5;
  *(_QWORD *)(v11 + 312) = 0x40A6800000000000;
  *(_QWORD *)(v1 + 104) = v11;
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1A9CF7510;
  *(_QWORD *)(v12 + 32) = 3;
  *(_QWORD *)(v12 + 40) = 0x4076800000000000;
  *(_QWORD *)(v12 + 48) = 5;
  *(_QWORD *)(v12 + 56) = 0x4076800000000000;
  *(_QWORD *)(v12 + 64) = 3;
  *(_QWORD *)(v12 + 72) = 0x40B0E00000000000;
  *(_QWORD *)(v12 + 80) = 5;
  *(_QWORD *)(v12 + 88) = 0x4086800000000000;
  *(_QWORD *)(v12 + 96) = 3;
  *(_QWORD *)(v12 + 104) = 0x40AC200000000000;
  *(_QWORD *)(v12 + 112) = 5;
  *(_QWORD *)(v12 + 120) = 0x409C200000000000;
  *(_QWORD *)(v12 + 128) = 3;
  *(_QWORD *)(v12 + 136) = 0x40A3B00000000000;
  *(_QWORD *)(v12 + 144) = 4;
  *(_QWORD *)(v12 + 152) = 0x4086800000000000;
  *(_QWORD *)(v12 + 160) = 3;
  *(_QWORD *)(v12 + 168) = 0x40B1580000000000;
  *(_QWORD *)(v12 + 176) = 5;
  *(_QWORD *)(v12 + 184) = 0x4096800000000000;
  *(_QWORD *)(v12 + 192) = 3;
  *(_QWORD *)(v12 + 200) = 0x40A6800000000000;
  *(_QWORD *)(v12 + 208) = 5;
  *(_QWORD *)(v12 + 216) = 0x40A6800000000000;
  *(_QWORD *)(v12 + 224) = 3;
  *(_QWORD *)(v12 + 232) = 0x40AC200000000000;
  *(_QWORD *)(v12 + 240) = 5;
  *(_QWORD *)(v12 + 248) = 0x4076800000000000;
  *(_QWORD *)(v1 + 112) = v12;
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1A9CF7510;
  *(_QWORD *)(v13 + 32) = 3;
  *(_QWORD *)(v13 + 40) = 0x409C200000000000;
  *(_QWORD *)(v13 + 48) = 4;
  *(_QWORD *)(v13 + 56) = 0x4090E00000000000;
  *(_QWORD *)(v13 + 64) = 3;
  *(_QWORD *)(v13 + 72) = 0x4090E00000000000;
  *(_QWORD *)(v13 + 80) = 5;
  *(_QWORD *)(v13 + 88) = 0x4090E00000000000;
  *(_QWORD *)(v13 + 96) = 3;
  *(_QWORD *)(v13 + 104) = 0x40B2480000000000;
  *(_QWORD *)(v13 + 112) = 5;
  *(_QWORD *)(v13 + 120) = 0x409C200000000000;
  *(_QWORD *)(v13 + 128) = 3;
  *(_QWORD *)(v13 + 136) = 0x40AEF00000000000;
  *(_QWORD *)(v13 + 144) = 5;
  *(_QWORD *)(v13 + 152) = 0x40A3B00000000000;
  *(_QWORD *)(v13 + 160) = 3;
  *(_QWORD *)(v13 + 168) = 0x40A9500000000000;
  *(_QWORD *)(v13 + 176) = 5;
  *(_QWORD *)(v13 + 184) = 0x40B0E00000000000;
  *(_QWORD *)(v13 + 192) = 3;
  *(_QWORD *)(v13 + 200) = 0x4076800000000000;
  *(_QWORD *)(v13 + 208) = 2;
  *(_QWORD *)(v13 + 216) = 0x4076800000000000;
  *(_QWORD *)(v13 + 224) = 3;
  *(_QWORD *)(v13 + 232) = 0x4096800000000000;
  *(_QWORD *)(v13 + 240) = 5;
  *(_QWORD *)(v13 + 248) = 0x4090E00000000000;
  *(_QWORD *)(v1 + 120) = v13;
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1A9CF7550;
  *(_QWORD *)(v14 + 32) = 5;
  *(_QWORD *)(v14 + 40) = 0x4076800000000000;
  *(_QWORD *)(v14 + 48) = 3;
  *(_QWORD *)(v14 + 56) = 0x40AEF00000000000;
  *(_QWORD *)(v14 + 64) = 5;
  *(_QWORD *)(v14 + 72) = 0x4090E00000000000;
  *(_QWORD *)(v14 + 80) = 3;
  *(_QWORD *)(v14 + 88) = 0x40B3B00000000000;
  *(_QWORD *)(v14 + 96) = 5;
  *(_QWORD *)(v14 + 104) = 0x40A0E00000000000;
  *(_QWORD *)(v14 + 112) = 3;
  *(_QWORD *)(v14 + 120) = 0x40B6800000000000;
  *(_QWORD *)(v14 + 128) = 5;
  *(_QWORD *)(v14 + 136) = 0x4076800000000000;
  *(_QWORD *)(v14 + 144) = 2;
  *(_QWORD *)(v14 + 152) = 0x4076800000000000;
  *(_QWORD *)(v14 + 160) = 5;
  *(_QWORD *)(v14 + 168) = 0x4076800000000000;
  *(_QWORD *)(v14 + 176) = 3;
  *(_QWORD *)(v14 + 184) = 0x40A3B00000000000;
  *(_QWORD *)(v14 + 192) = 5;
  *(_QWORD *)(v14 + 200) = 0x4096800000000000;
  *(_QWORD *)(v14 + 208) = 3;
  *(_QWORD *)(v14 + 216) = 0x40AEF00000000000;
  *(_QWORD *)(v14 + 224) = 5;
  *(_QWORD *)(v14 + 232) = 0x408A400000000000;
  *(_QWORD *)(v1 + 128) = v14;
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_1A9CF7570;
  *(_QWORD *)(v15 + 32) = 3;
  *(_QWORD *)(v15 + 40) = 0x4096800000000000;
  *(_QWORD *)(v15 + 48) = 4;
  *(_QWORD *)(v15 + 56) = 0x4076800000000000;
  *(_QWORD *)(v15 + 64) = 3;
  *(_QWORD *)(v15 + 72) = 0x4086800000000000;
  *(_QWORD *)(v15 + 80) = 2;
  *(_QWORD *)(v15 + 88) = 0x4076800000000000;
  *(_QWORD *)(v15 + 96) = 3;
  *(_QWORD *)(v15 + 104) = 0x4086800000000000;
  *(_QWORD *)(v15 + 112) = 5;
  *(_QWORD *)(v15 + 120) = 0x40A0E00000000000;
  *(_QWORD *)(v15 + 128) = 3;
  *(_QWORD *)(v15 + 136) = 0x4090E00000000000;
  *(_QWORD *)(v15 + 144) = 4;
  *(_QWORD *)(v15 + 152) = 0x4090E00000000000;
  *(_QWORD *)(v15 + 160) = 3;
  *(_QWORD *)(v15 + 168) = 0x40A0E00000000000;
  *(_QWORD *)(v15 + 176) = 5;
  *(_QWORD *)(v15 + 184) = 0x4090E00000000000;
  *(_QWORD *)(v15 + 192) = 3;
  *(_QWORD *)(v15 + 200) = 0x4076800000000000;
  *(_QWORD *)(v15 + 208) = 5;
  *(_QWORD *)(v15 + 216) = 0x4076800000000000;
  *(_QWORD *)(v15 + 224) = 3;
  *(_QWORD *)(v15 + 232) = 0x40B5180000000000;
  *(_QWORD *)(v15 + 240) = 5;
  *(_QWORD *)(v15 + 248) = 0x40B0E00000000000;
  *(_QWORD *)(v15 + 256) = 3;
  *(_QWORD *)(v15 + 264) = 0x40A6800000000000;
  *(_QWORD *)(v15 + 272) = 5;
  *(_QWORD *)(v15 + 280) = 0x4086800000000000;
  *(_QWORD *)(v15 + 288) = 2;
  *(_QWORD *)(v15 + 296) = 0x4076800000000000;
  *(_QWORD *)(v15 + 304) = 5;
  *(_QWORD *)(v15 + 312) = 0x4086800000000000;
  *(_QWORD *)(v15 + 320) = 3;
  *(_QWORD *)(v15 + 328) = 0x40A0E00000000000;
  *(_QWORD *)(v1 + 136) = v15;
  return v1;
}

_QWORD *sub_1A9CD3D98@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A9CD3298(a1, v2[2], v2[3], v2[4], v2[6], v2[7], a2);
}

id sub_1A9CD3DCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v20;

  v10 = (void *)sub_1A9CE5EEC();
  v11 = (void *)sub_1A9CE63CC();
  sub_1A9B94A18(0, &qword_1ED263340);
  v12 = (void *)sub_1A9CE83D0();
  swift_bridgeObjectRelease();
  sub_1A9B94A18(0, &qword_1EEB4A280);
  v13 = (void *)sub_1A9CE83D0();
  swift_bridgeObjectRelease();
  v14 = sub_1A9CE5F64();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a7, 1, v14) != 1)
  {
    v16 = (void *)sub_1A9CE5EEC();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a7, v14);
  }
  v17 = objc_msgSend(v20, sel_initWithMorningIndex_dateInterval_calendar_periods_schedules_sleepDurationGoal_creationInterval_, a1, v10, v11, v12, v13, a6, v16);

  v18 = sub_1A9CE6444();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(a3, v18);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a2, v14);
  return v17;
}

uint64_t sub_1A9CD3F5C(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t), uint64_t a4)
{
  uint64_t (*v5)(uint64_t, uint64_t);
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  void *v47;
  void *v48;
  id v49;
  void (*v50)(char *, _QWORD, uint64_t);
  void (*v51)(char *, uint64_t);
  uint64_t (*v52)(char *, uint64_t, uint64_t);
  uint64_t result;
  void (*v54)(char *, char *, uint64_t);
  char *v55;
  char *v56;
  char *v57;
  void (*v58)(char *, char *, uint64_t);
  char *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  id v79;
  id v80;
  void (*v81)(char *, uint64_t);
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  void (*v95)(char *, uint64_t);
  char *v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;

  v95 = a3;
  v84 = a2;
  v99 = a1;
  v5 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1A9B92F34(0, &qword_1ED263400, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE5D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6, v7);
  v92 = (char *)&v82 - v8;
  v9 = sub_1A9CE6444();
  v85 = *(_QWORD *)(v9 - 8);
  v86 = v9;
  MEMORY[0x1E0C80A78](v9, v10);
  v91 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A9CE5F64();
  v88 = *(_QWORD *)(v12 - 8);
  v89 = v12;
  MEMORY[0x1E0C80A78](v12, v13);
  v90 = (char *)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1A9CE642C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15, v17);
  v93 = (char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19, v20);
  v22 = (char *)&v82 - v21;
  sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], v5);
  MEMORY[0x1E0C80A78](v23, v24);
  v94 = (char *)&v82 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26, v27);
  v29 = (char *)&v82 - v28;
  v30 = sub_1A9CE62E8();
  v31 = *(_QWORD **)(v30 - 8);
  MEMORY[0x1E0C80A78](v30, v32);
  v83 = (char *)&v82 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v34, v35);
  v82 = (char *)&v82 - v36;
  MEMORY[0x1E0C80A78](v37, v38);
  v96 = (char *)&v82 - v39;
  MEMORY[0x1E0C80A78](v40, v41);
  v98 = (char *)&v82 - v42;
  MEMORY[0x1E0C80A78](v43, v44);
  v46 = (char *)&v82 - v45;
  v47 = (void *)objc_opt_self();
  v48 = (void *)sub_1A9CE63CC();
  v49 = objc_msgSend(v47, sel_hk_noonWithDayIndex_calendar_, v99, v48);

  sub_1A9CE62C4();
  v50 = *(void (**)(char *, _QWORD, uint64_t))(v16 + 104);
  v50(v22, *MEMORY[0x1E0CB1140], v15);
  sub_1A9CE63C0();
  v87 = v46;
  v97 = a4;
  sub_1A9CE63FC();
  v51 = *(void (**)(char *, uint64_t))(v16 + 8);
  v51(v22, v15);
  v52 = (uint64_t (*)(char *, uint64_t, uint64_t))v31[6];
  result = v52(v29, 1, v30);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v54 = (void (*)(char *, char *, uint64_t))v31[4];
    v54(v98, v29, v30);
    v55 = v93;
    v50(v93, *MEMORY[0x1E0CB1178], v15);
    v56 = v94;
    sub_1A9CE63FC();
    v51(v55, v15);
    result = v52(v56, 1, v30);
    if ((_DWORD)result != 1)
    {
      v95 = (void (*)(char *, uint64_t))v31[1];
      v57 = v98;
      v95(v98, v30);
      v54(v57, v56, v30);
      v58 = (void (*)(char *, char *, uint64_t))v31[2];
      v59 = v96;
      v58(v96, v57, v30);
      v60 = (void *)objc_opt_self();
      v61 = v97;
      v62 = (void *)sub_1A9CE63CC();
      v94 = (char *)objc_msgSend(v60, sel_hk_sleepDayIntervalForMorningIndex_calendar_, v99, v62);

      MEMORY[0x1E0C80A78](v63, v64);
      *(&v82 - 2) = v59;
      sub_1A9CD34A4(v84, (void (*)(uint64_t, double))sub_1A9CD4620);
      v58(v82, v57, v30);
      v58(v83, v59, v30);
      v65 = (uint64_t)v90;
      sub_1A9CE5F1C();
      v66 = (void *)sub_1A9CE5EEC();
      sub_1A9B94A18(0, &qword_1ED263348);
      v67 = (void *)sub_1A9CE83D0();
      swift_bridgeObjectRelease();
      v68 = objc_msgSend((id)objc_opt_self(), sel_sleepPeriodWithDateInterval_segments_, v66, v67);

      v69 = v88;
      v70 = v89;
      (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v65, v89);
      sub_1A9CE5F04();
      v71 = (uint64_t)v91;
      (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v91, v61, v86);
      sub_1A9BB7420();
      v72 = swift_allocObject();
      *(_OWORD *)(v72 + 16) = xmmword_1A9CEF8A0;
      *(_QWORD *)(v72 + 32) = v68;
      v100 = v72;
      sub_1A9CE83E8();
      v73 = v100;
      v74 = (void *)objc_opt_self();
      v75 = v68;
      v76 = objc_msgSend(v74, sel_hourUnit);
      v77 = objc_msgSend((id)objc_opt_self(), sel_quantityWithUnit_doubleValue_, v76, 8.0);

      v78 = (uint64_t)v92;
      sub_1A9CE5F58();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v69 + 56))(v78, 0, 1, v70);
      v79 = objc_allocWithZone(MEMORY[0x1E0CB6BE0]);
      v80 = sub_1A9CD3DCC(v99, v65, v71, v73, MEMORY[0x1E0DEE9D8], (uint64_t)v77, v78);

      v81 = v95;
      v95(v98, v30);
      v81(v87, v30);
      v81(v96, v30);
      return (uint64_t)v80;
    }
  }
  __break(1u);
  return result;
}

id sub_1A9CD4620(uint64_t a1)
{
  uint64_t v1;

  return sub_1A9CD3358(a1, *(_QWORD *)(v1 + 16));
}

void sub_1A9CD4628(uint64_t a1)
{
  sub_1A9B92F34(a1, &qword_1EEB4A290, (uint64_t (*)(uint64_t))sub_1A9CD4644, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
}

void sub_1A9CD4644()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EEB4A298)
  {
    type metadata accessor for HKCategoryValueSleepAnalysis(255);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EEB4A298);
  }
}

uint64_t sub_1A9CD46A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DayRelativeDuration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id CALayer.center.setter(double a1, double a2)
{
  void *v2;
  double v5;
  double v6;

  objc_msgSend(v2, sel_frame);
  return objc_msgSend(v2, sel_setFrame_, a1 - v5 * 0.5, a2 - v6 * 0.5);
}

id static CALayer.performWithoutAnimation(_:)(void (*a1)(id))
{
  void *v2;

  v2 = (void *)objc_opt_self();
  objc_msgSend(v2, sel_begin);
  a1(objc_msgSend(v2, sel_setDisableActions_, 1));
  return objc_msgSend(v2, sel_commit);
}

double CALayer.center.getter()
{
  void *v0;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGRect v7;
  CGRect v8;

  objc_msgSend(v0, sel_frame);
  x = v7.origin.x;
  y = v7.origin.y;
  width = v7.size.width;
  height = v7.size.height;
  MidX = CGRectGetMidX(v7);
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  CGRectGetMidY(v8);
  return MidX;
}

void sub_1A9CD4810(id *a1@<X0>, CGFloat *a2@<X8>)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  CGRect v9;
  CGRect v10;

  objc_msgSend(*a1, sel_frame);
  x = v9.origin.x;
  y = v9.origin.y;
  width = v9.size.width;
  height = v9.size.height;
  MidX = CGRectGetMidX(v9);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  MidY = CGRectGetMidY(v10);
  *a2 = MidX;
  a2[1] = MidY;
}

id (*CALayer.center.modify(uint64_t a1))(uint64_t a1)
{
  void *v1;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  CGRect v10;
  CGRect v11;

  *(_QWORD *)(a1 + 16) = v1;
  objc_msgSend(v1, sel_frame);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  *(CGFloat *)a1 = MidX;
  *(CGFloat *)(a1 + 8) = MidY;
  return sub_1A9CD4908;
}

id sub_1A9CD4908(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = *(void **)(a1 + 16);
  v2 = *(double *)a1;
  v3 = *(double *)(a1 + 8);
  objc_msgSend(v1, sel_frame);
  return objc_msgSend(v1, sel_setFrame_, v2 - v4 * 0.5, v3 - v5 * 0.5);
}

id sub_1A9CD4964(double *a1, id *a2)
{
  double v2;
  double v3;
  id v4;
  double v5;
  double v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  objc_msgSend(*a2, sel_frame);
  return objc_msgSend(v4, sel_setFrame_, v2 - v5 * 0.5, v3 - v6 * 0.5);
}

uint64_t sub_1A9CD49BC()
{
  swift_release();
  return swift_release();
}

uint64_t sub_1A9CD49E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_1A9CD4A2C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1A9CD4A88(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

void type metadata accessor for GetSubviews()
{
  JUMPOUT(0x1AF4201F4);
}

uint64_t sub_1A9CD4AD8()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1A9CD4B0C()
{
  type metadata accessor for GetSubviews.SubviewGetter();
}

uint64_t sub_1A9CD4B5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  void (*v15)(_BYTE *, uint64_t);
  _BYTE v17[96];

  MEMORY[0x1AF420284](&unk_1A9CF76C0, a1);
  v6 = sub_1A9CE708C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = &v17[-v13];
  *(_QWORD *)(v4 - 128) = v3;
  *(_QWORD *)(v4 - 120) = v2;
  swift_retain();
  sub_1A9CE7098();
  *(_QWORD *)(v4 - 144) = MEMORY[0x1AF420284](&unk_1A9CF7668, a1);
  *(_QWORD *)(v4 - 136) = v1;
  MEMORY[0x1AF420284](MEMORY[0x1E0CD91E0], v6, v4 - 144);
  sub_1A9C3C998((uint64_t)v10, v6, (uint64_t)v14);
  v15 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  v15(v10, v6);
  sub_1A9C3899C((uint64_t)v14, v6, *(_QWORD *)(v4 - 152));
  return ((uint64_t (*)(_BYTE *, uint64_t))v15)(v14, v6);
}

uint64_t sub_1A9CD4C8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X5>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  void (*v14)(double);
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v6 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1, a2);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9, v10);
  v13 = (char *)&v17 - v12;
  v14(v11);
  sub_1A9C3C998((uint64_t)v8, a3, (uint64_t)v13);
  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v8, a3);
  sub_1A9C3899C((uint64_t)v13, a3, a4);
  return ((uint64_t (*)(char *, uint64_t))v15)(v13, a3);
}

uint64_t sub_1A9CD4D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  MEMORY[0x1AF420284](&unk_1A9CF7640, a5);
  return sub_1A9CE6EDC();
}

uint64_t sub_1A9CD4DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x1AF420284](&unk_1A9CF7640, a4);
  return sub_1A9CE6EE8();
}

uint64_t sub_1A9CD4E40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;

  return sub_1A9CD4C8C(a1, *v3, *(_QWORD *)(a2 + 32), a3);
}

void sub_1A9CD4E74()
{
  sub_1A9CD4B0C();
}

void type metadata accessor for GetSubviews.SubviewGetter()
{
  JUMPOUT(0x1AF4201F4);
}

uint64_t sub_1A9CD4E98()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *initializeBufferWithCopyOfBuffer for OneDayDiagram(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for OneDayChart()
{
  return swift_release();
}

_QWORD *sub_1A9CD4ED4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_1A9CD4F0C(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

void sub_1A9CD4F3C()
{
  type metadata accessor for GetSubviews.SubviewGetter();
}

uint64_t sub_1A9CD4F70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x1AF420284](&unk_1A9CF76C0, a1);
  v3 = sub_1A9CE708C();
  v5 = MEMORY[0x1AF420284](&unk_1A9CF7668, a1);
  v6 = v1;
  return MEMORY[0x1AF420284](MEMORY[0x1E0CD91E0], v3, &v5);
}

void sub_1A9CD4FD8()
{
  JUMPOUT(0x1AF420284);
}

void sub_1A9CD4FE8()
{
  JUMPOUT(0x1AF420284);
}

uint64_t sub_1A9CD4FF8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CD5034(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t ScheduleOccurrenceView.init(viewModel:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A9BA0D6C(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleOccurrenceViewModel);
}

uint64_t ScheduleOccurrenceView.viewModel.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A9BA6F90(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleOccurrenceViewModel);
}

uint64_t ScheduleOccurrenceView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;

  sub_1A9CD51F8(0);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CD53A4(0);
  v8 = v7;
  MEMORY[0x1E0C80A78](v7, v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = sub_1A9CE7404();
  *((_QWORD *)v6 + 1) = 0x4018000000000000;
  v6[16] = 0;
  sub_1A9CD5550();
  sub_1A9CD53C0(v1, (uint64_t)&v6[*(int *)(v12 + 44)]);
  v13 = sub_1A9CE7758();
  type metadata accessor for ScheduleOccurrenceViewModel();
  sub_1A9CE6F24();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  sub_1A9BA6F90((uint64_t)v6, (uint64_t)v11, (uint64_t (*)(_QWORD))sub_1A9CD51F8);
  v22 = &v11[*(int *)(v8 + 36)];
  *v22 = v13;
  *((_QWORD *)v22 + 1) = v15;
  *((_QWORD *)v22 + 2) = v17;
  *((_QWORD *)v22 + 3) = v19;
  *((_QWORD *)v22 + 4) = v21;
  v22[40] = 0;
  sub_1A9B97190((uint64_t)v6, (uint64_t (*)(_QWORD))sub_1A9CD51F8);
  return sub_1A9BA0D6C((uint64_t)v11, a1, (uint64_t (*)(_QWORD))sub_1A9CD53A4);
}

void sub_1A9CD51F8(uint64_t a1)
{
  sub_1A9CD7F10(a1, &qword_1EEB4A3A8, &qword_1EEB4A3B0, (uint64_t (*)(uint64_t))sub_1A9CD521C, &qword_1EEB4A3F8);
}

void sub_1A9CD521C(uint64_t a1)
{
  sub_1A9BAAA78(a1, &qword_1EEB4A3B8, (void (*)(uint64_t))sub_1A9CD5238, (void (*)(uint64_t))sub_1A9CD52AC);
}

void sub_1A9CD5238()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A3C0)
  {
    sub_1A9CD7D60(255, &qword_1EEB4A3C8, (uint64_t (*)(uint64_t, _QWORD, uint64_t))MEMORY[0x1E0CDB880]);
    sub_1A9CE76BC();
    v0 = sub_1A9CE7164();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A3C0);
  }
}

void sub_1A9CD52AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A3D0)
  {
    sub_1A9B92F34(255, &qword_1EEB4A3D8, (uint64_t (*)(uint64_t))sub_1A9CD5344, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CE0648]);
    sub_1A9BCC5EC(&qword_1EEB4A3F0, &qword_1EEB4A3D8, (uint64_t (*)(uint64_t))sub_1A9CD5344);
    v0 = sub_1A9CE6FD8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A3D0);
  }
}

void sub_1A9CD5344(uint64_t a1)
{
  sub_1A9BAAA78(a1, &qword_1EEB4A3E0, (void (*)(uint64_t))type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView, sub_1A9CD5374);
}

uint64_t type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView(uint64_t a1)
{
  return sub_1A9BA3C2C(a1, qword_1EEB4A598);
}

void sub_1A9CD5374(uint64_t a1)
{
  sub_1A9BCC414(a1, &qword_1EEB4A3E8, (void (*)(uint64_t))type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView);
}

uint64_t type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView(uint64_t a1)
{
  return sub_1A9BA3C2C(a1, qword_1EEB4A508);
}

void sub_1A9CD53A4(uint64_t a1)
{
  sub_1A9BCC414(a1, &qword_1EEB4A400, sub_1A9CD51F8);
}

uint64_t sub_1A9CD53C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  sub_1A9CD52AC();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8, v9);
  v11 = (char *)&v23 - v10;
  sub_1A9CD5238();
  MEMORY[0x1E0C80A78](v12, v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16, v17);
  v19 = (char *)&v23 - v18;
  sub_1A9CD55DC((uint64_t)&v23 - v18);
  *v11 = sub_1A9CE7704();
  sub_1A9CD7CE0();
  sub_1A9CD5890(a1, (uint64_t)&v11[*(int *)(v20 + 44)]);
  sub_1A9BA6F90((uint64_t)v19, (uint64_t)v15, (uint64_t (*)(_QWORD))sub_1A9CD5238);
  sub_1A9BA6F90((uint64_t)v11, (uint64_t)v7, (uint64_t (*)(_QWORD))sub_1A9CD52AC);
  sub_1A9BA6F90((uint64_t)v15, a2, (uint64_t (*)(_QWORD))sub_1A9CD5238);
  sub_1A9CD521C(0);
  sub_1A9BA6F90((uint64_t)v7, a2 + *(int *)(v21 + 48), (uint64_t (*)(_QWORD))sub_1A9CD52AC);
  sub_1A9B97190((uint64_t)v11, (uint64_t (*)(_QWORD))sub_1A9CD52AC);
  sub_1A9B97190((uint64_t)v19, (uint64_t (*)(_QWORD))sub_1A9CD5238);
  sub_1A9B97190((uint64_t)v7, (uint64_t (*)(_QWORD))sub_1A9CD52AC);
  return sub_1A9B97190((uint64_t)v15, (uint64_t (*)(_QWORD))sub_1A9CD5238);
}

void sub_1A9CD5550()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A408)
  {
    sub_1A9B92F34(255, &qword_1EEB4A3B0, (uint64_t (*)(uint64_t))sub_1A9CD521C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CE0648]);
    v0 = sub_1A9CE708C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A408);
  }
}

uint64_t sub_1A9CD55CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CD55DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[4];
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;

  v24[3] = a1;
  sub_1A9CD7D60(0, &qword_1EEB4A5D8, (uint64_t (*)(uint64_t, _QWORD, uint64_t))MEMORY[0x1E0CDB848]);
  v24[0] = v2;
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)v24 - v4;
  sub_1A9C63DFC(0);
  v24[1] = v6;
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CD7D60(0, &qword_1EEB4A3C8, (uint64_t (*)(uint64_t, _QWORD, uint64_t))MEMORY[0x1E0CDB880]);
  v24[2] = v10;
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v24 - v12;
  v14 = ScheduleOccurrenceViewModel.localizedHeaderString.getter();
  v16 = v15;
  v17 = (uint64_t *)(v1 + *(int *)(type metadata accessor for ScheduleOccurrenceViewModel() + 40));
  v18 = *v17;
  v19 = v17[2];
  v20 = *((_BYTE *)v17 + 25);
  swift_retain();
  swift_retain();
  v21 = ScheduleOccurrenceViewModel.localizedHeaderAccessibilityString.getter();
  LOWORD(v25) = -772;
  *((_QWORD *)&v25 + 1) = v14;
  v26 = v16;
  v27 = v18;
  v28 = v19;
  v29 = v20;
  v30 = v21;
  v31 = v22;
  static Text.create(_:)(&v25, (uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  ScheduleOccurrenceViewModel.localizedHeaderString.getter();
  swift_retain();
  swift_retain();
  ScheduleOccurrenceViewModel.localizedHeaderAccessibilityString.getter();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) == 0)
    sub_1A9BA6F90((uint64_t)v9, (uint64_t)v5, (uint64_t (*)(_QWORD))sub_1A9C63DFC);
  swift_storeEnumTagMultiPayload();
  sub_1A9BA409C(&qword_1EEB48458, (uint64_t (*)(uint64_t))sub_1A9C63DFC, (uint64_t (*)(void))sub_1A9C641CC, MEMORY[0x1E0CE0798]);
  sub_1A9CE74E8();
  sub_1A9B97190((uint64_t)v9, (uint64_t (*)(_QWORD))sub_1A9C63DFC);
  LOBYTE(v25) = 3;
  static String.healthAccessibilityIdentifier(_:_:)((unsigned __int8 *)&v25, (uint64_t)&unk_1E55D2E78);
  swift_arrayDestroy();
  sub_1A9CD7DC0();
  sub_1A9CE7B78();
  swift_bridgeObjectRelease();
  return sub_1A9CD7E58((uint64_t)v13);
}

uint64_t sub_1A9CD5890@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;

  v4 = type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView(0);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CD5374(0);
  v9 = v8;
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v27 - v15;
  v17 = type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView(0);
  MEMORY[0x1E0C80A78](v17, v18);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21, v22);
  v24 = (char *)&v27 - v23;
  sub_1A9BA6F90(a1, (uint64_t)&v27 - v23, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleOccurrenceViewModel);
  sub_1A9BA6F90(a1, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleOccurrenceViewModel);
  sub_1A9BA6F90((uint64_t)v7, (uint64_t)v12, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView);
  *(_WORD *)&v12[*(int *)(v9 + 36)] = 256;
  sub_1A9B97190((uint64_t)v7, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceVerticalView);
  sub_1A9BA0D6C((uint64_t)v12, (uint64_t)v16, (uint64_t (*)(_QWORD))sub_1A9CD5374);
  sub_1A9BA6F90((uint64_t)v24, (uint64_t)v20, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView);
  sub_1A9BA6F90((uint64_t)v16, (uint64_t)v12, (uint64_t (*)(_QWORD))sub_1A9CD5374);
  sub_1A9BA6F90((uint64_t)v20, a2, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView);
  sub_1A9CD5344(0);
  sub_1A9BA6F90((uint64_t)v12, a2 + *(int *)(v25 + 48), (uint64_t (*)(_QWORD))sub_1A9CD5374);
  sub_1A9B97190((uint64_t)v16, (uint64_t (*)(_QWORD))sub_1A9CD5374);
  sub_1A9B97190((uint64_t)v24, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView);
  sub_1A9B97190((uint64_t)v12, (uint64_t (*)(_QWORD))sub_1A9CD5374);
  return sub_1A9B97190((uint64_t)v20, type metadata accessor for ScheduleOccurrenceView.ScheduleOccurrenceHorizontalView);
}

void *sub_1A9CD5AA0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  _BYTE __src[488];

  sub_1A9CD5AEC(v1, __src);
  *a1 = xmmword_1A9CF76F0;
  return memcpy(a1 + 1, __src, 0x1E0uLL);
}

uint64_t sub_1A9CD5AEC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(_QWORD);
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _BYTE v33[7];
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  _BYTE v63[7];
  char v64;
  _OWORD v65[13];
  __int128 v66;
  __int128 v67;
  _OWORD v68[13];
  __int128 v69;
  __int128 v70;
  _OWORD v71[30];
  _OWORD v72[13];
  uint64_t v73;
  uint64_t v74;
  char v75;
  _BYTE v76[7];
  uint64_t v77;
  _OWORD v78[13];
  uint64_t v79;
  uint64_t v80;
  char v81;
  _BYTE v82[7];
  uint64_t v83;
  _OWORD v84[13];
  uint64_t v85;

  v4 = type metadata accessor for ScheduleOccurrenceViewModel();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + *(int *)(v8 + 40) + 192);
  sub_1A9BA6F90(a1, (uint64_t)v7, v10);
  if ((v9 & 2) == 0)
  {
    sub_1A9B97190((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleOccurrenceViewModel);
LABEL_5:
    sub_1A9C9086C((uint64_t)v84);
    goto LABEL_6;
  }
  v11 = sub_1A9C8E6E4();
  sub_1A9B97190((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for ScheduleOccurrenceViewModel);
  if ((v11 & 1) == 0)
    goto LABEL_5;
  sub_1A9C90480((uint64_t)v84);
LABEL_6:
  v29 = v84[10];
  v30 = v84[11];
  v31 = v84[12];
  v32 = v85;
  v25 = v84[6];
  v26 = v84[7];
  v27 = v84[8];
  v28 = v84[9];
  v21 = v84[2];
  v22 = v84[3];
  v23 = v84[4];
  v24 = v84[5];
  v19 = v84[0];
  v20 = v84[1];
  *(_QWORD *)&v78[0] = 0;
  BYTE8(v78[0]) = 1;
  sub_1A9BBA658(0, &qword_1EEB48308);
  sub_1A9CE7DC4();
  v12 = *(_QWORD *)&v71[0];
  v13 = *(_QWORD *)&v71[1];
  v45 = v29;
  v46 = v30;
  v47 = v31;
  v48 = v32;
  v41 = v25;
  v42 = v26;
  v43 = v27;
  v44 = v28;
  v37 = v21;
  v38 = v22;
  v39 = v23;
  v40 = v24;
  v35 = v19;
  v36 = v20;
  v34 = BYTE8(v71[0]);
  sub_1A9C90AC4((uint64_t)&v49);
  *(_QWORD *)&v78[0] = 0;
  BYTE8(v78[0]) = 1;
  sub_1A9CE7DC4();
  v72[10] = v59;
  v72[11] = v60;
  v72[12] = v61;
  v72[6] = v55;
  v72[7] = v56;
  v72[8] = v57;
  v72[9] = v58;
  v72[2] = v51;
  v72[3] = v52;
  v72[4] = v53;
  v72[5] = v54;
  v72[0] = v49;
  v72[1] = v50;
  v65[10] = v45;
  v65[11] = v46;
  v65[12] = v47;
  v65[6] = v41;
  v65[7] = v42;
  v65[8] = v43;
  v65[9] = v44;
  v65[2] = v37;
  v65[3] = v38;
  v65[4] = v39;
  v65[5] = v40;
  v65[0] = v35;
  v65[1] = v36;
  v68[10] = v59;
  v68[11] = v60;
  v68[12] = v61;
  v68[6] = v55;
  v68[7] = v56;
  v68[8] = v57;
  v68[9] = v58;
  v14 = *(_QWORD *)&v71[0];
  v15 = BYTE8(v71[0]);
  v16 = *(_QWORD *)&v71[1];
  v17 = v34;
  *(_QWORD *)&v66 = v48;
  *((_QWORD *)&v66 + 1) = v12;
  LOBYTE(v67) = v34;
  *(_DWORD *)((char *)&v67 + 1) = *(_DWORD *)v33;
  DWORD1(v67) = *(_DWORD *)&v33[3];
  *((_QWORD *)&v67 + 1) = v13;
  *(_DWORD *)((char *)&v70 + 1) = *(_DWORD *)v63;
  DWORD1(v70) = *(_DWORD *)&v63[3];
  v68[2] = v51;
  v68[3] = v52;
  v68[4] = v53;
  v68[5] = v54;
  v68[0] = v49;
  v68[1] = v50;
  *(_QWORD *)&v69 = v62;
  *((_QWORD *)&v69 + 1) = *(_QWORD *)&v71[0];
  LOBYTE(v70) = BYTE8(v71[0]);
  *((_QWORD *)&v70 + 1) = *(_QWORD *)&v71[1];
  v71[12] = v47;
  v71[13] = v66;
  v71[8] = v43;
  v71[9] = v44;
  v71[11] = v46;
  v71[10] = v45;
  v71[4] = v39;
  v71[5] = v40;
  v71[7] = v42;
  v71[6] = v41;
  v71[0] = v35;
  v71[1] = v36;
  v71[3] = v38;
  v71[2] = v37;
  v71[26] = v60;
  v71[27] = v61;
  v71[28] = v69;
  v71[29] = v70;
  v71[22] = v56;
  v71[23] = v57;
  v71[24] = v58;
  v71[25] = v59;
  v71[18] = v52;
  v71[19] = v53;
  v71[20] = v54;
  v71[21] = v55;
  v71[14] = v67;
  v71[15] = v49;
  v73 = v62;
  v64 = v70;
  *(_DWORD *)v76 = *(_DWORD *)v63;
  *(_DWORD *)&v76[3] = *(_DWORD *)&v63[3];
  v71[16] = v50;
  v71[17] = v51;
  memcpy(a2, v71, 0x1E0uLL);
  v74 = v14;
  v75 = v15;
  v77 = v16;
  sub_1A9C62D60((uint64_t)v65);
  sub_1A9C62D60((uint64_t)v68);
  sub_1A9CD7BF8((uint64_t)v72);
  v78[10] = v45;
  v78[11] = v46;
  v78[12] = v47;
  v78[6] = v41;
  v78[7] = v42;
  v78[8] = v43;
  v78[9] = v44;
  v78[2] = v37;
  v78[3] = v38;
  v78[4] = v39;
  v78[5] = v40;
  v78[0] = v35;
  v78[1] = v36;
  v79 = v48;
  v80 = v12;
  v81 = v17;
  *(_DWORD *)v82 = *(_DWORD *)v33;
  *(_DWORD *)&v82[3] = *(_DWORD *)&v33[3];
  v83 = v13;
  return sub_1A9CD7BF8((uint64_t)v78);
}

void *sub_1A9CD5FAC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[480];
  _BYTE __src[487];

  v3 = sub_1A9CE7404();
  sub_1A9CD5AEC(v1, v5);
  memcpy(&__src[7], v5, 0x1E0uLL);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0x4018000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  return memcpy((void *)(a1 + 17), __src, 0x1E7uLL);
}

uint64_t getEnumTagSinglePayload for ScheduleOccurrenceView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for ScheduleOccurrenceView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t type metadata accessor for ScheduleOccurrenceView(uint64_t a1)
{
  return sub_1A9BA3C2C(a1, qword_1EEB4A468);
}

unint64_t sub_1A9CD607C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB4A4A0;
  if (!qword_1EEB4A4A0)
  {
    sub_1A9CD53A4(255);
    v2 = v1;
    v3[0] = sub_1A9B92B9C(qword_1EEB4A4A8, (uint64_t (*)(uint64_t))sub_1A9CD51F8, MEMORY[0x1E0CDFCC0]);
    v3[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD9C20], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A4A0);
  }
  return result;
}

char *_s13SleepHealthUI22ScheduleOccurrenceViewVwcp_0(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(char *, uint64_t, uint64_t);
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  char *v36;
  char *__dst;

  v4 = sub_1A9CE60C0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v6(a2, 1, v4))
  {
    sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  v8 = (int *)type metadata accessor for ScheduleOccurrenceViewModel();
  v9 = v8[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  if (v6(&a2[v9], 1, v4))
  {
    sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v10, v11, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  }
  v13 = v8[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  *(_QWORD *)&a1[v8[7]] = *(_QWORD *)&a2[v8[7]];
  a1[v8[8]] = a2[v8[8]];
  a1[v8[9]] = a2[v8[9]];
  v16 = v8[10];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)v17 = *(_QWORD *)v18;
  v17[8] = v18[8];
  *((_QWORD *)v17 + 2) = *((_QWORD *)v18 + 2);
  v17[24] = v18[24];
  v17[25] = v18[25];
  *((_QWORD *)v17 + 4) = *((_QWORD *)v18 + 4);
  v17[40] = v18[40];
  *((_QWORD *)v17 + 6) = *((_QWORD *)v18 + 6);
  v17[56] = v18[56];
  v17[57] = v18[57];
  *((_QWORD *)v17 + 8) = *((_QWORD *)v18 + 8);
  v17[72] = v18[72];
  *((_QWORD *)v17 + 10) = *((_QWORD *)v18 + 10);
  v17[88] = v18[88];
  v17[89] = v18[89];
  *((_QWORD *)v17 + 12) = *((_QWORD *)v18 + 12);
  v17[104] = v18[104];
  *((_QWORD *)v17 + 14) = *((_QWORD *)v18 + 14);
  v17[120] = v18[120];
  v17[121] = v18[121];
  *((_QWORD *)v17 + 16) = *((_QWORD *)v18 + 16);
  v17[136] = v18[136];
  *((_QWORD *)v17 + 18) = *((_QWORD *)v18 + 18);
  v17[152] = v18[152];
  v17[153] = v18[153];
  *((_QWORD *)v17 + 20) = *((_QWORD *)v18 + 20);
  v17[168] = v18[168];
  *((_QWORD *)v17 + 22) = *((_QWORD *)v18 + 22);
  v17[184] = v18[184];
  v17[185] = v18[185];
  *((_QWORD *)v17 + 24) = *((_QWORD *)v18 + 24);
  v19 = v8[11];
  __dst = &a1[v19];
  v36 = &a2[v19];
  v20 = sub_1A9CE62E8();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v22(v36, 1, v20))
  {
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(__dst, v36, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(__dst, v36, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(__dst, 0, 1, v20);
  }
  v24 = v8[12];
  v25 = &a1[v24];
  v26 = &a2[v24];
  if (v22(&a2[v24], 1, v20))
  {
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v25, v26, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v25, 0, 1, v20);
  }
  v28 = v8[13];
  v29 = &a1[v28];
  v30 = &a2[v28];
  if (v22(&a2[v28], 1, v20))
  {
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v29, v30, v20);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v29, 0, 1, v20);
  }
  v32 = v8[14];
  v33 = *(void **)&a2[v32];
  *(_QWORD *)&a1[v32] = v33;
  v34 = v33;
  return a1;
}

char *_s13SleepHealthUI22ScheduleOccurrenceViewVwta_0(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(char *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;

  v4 = sub_1A9CE60C0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
LABEL_6:
    sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(a1, a2, v4);
LABEL_7:
  v10 = (int *)type metadata accessor for ScheduleOccurrenceViewModel();
  v11 = v10[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = v6(&a1[v11], 1, v4);
  v15 = v6(v13, 1, v4);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v12, v13, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v12, 0, 1, v4);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
LABEL_12:
    sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v12, v13, v4);
LABEL_13:
  v17 = v10[6];
  v18 = &a1[v17];
  v19 = &a2[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  *(_QWORD *)&a1[v10[7]] = *(_QWORD *)&a2[v10[7]];
  a1[v10[8]] = a2[v10[8]];
  a1[v10[9]] = a2[v10[9]];
  v20 = v10[10];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)&a1[v20] = *(_QWORD *)&a2[v20];
  swift_release();
  v21[8] = v22[8];
  *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
  swift_release();
  v21[24] = v22[24];
  v21[25] = v22[25];
  *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
  swift_release();
  v21[40] = v22[40];
  *((_QWORD *)v21 + 6) = *((_QWORD *)v22 + 6);
  swift_release();
  v21[56] = v22[56];
  v21[57] = v22[57];
  *((_QWORD *)v21 + 8) = *((_QWORD *)v22 + 8);
  swift_release();
  v21[72] = v22[72];
  *((_QWORD *)v21 + 10) = *((_QWORD *)v22 + 10);
  swift_release();
  v21[88] = v22[88];
  v21[89] = v22[89];
  *((_QWORD *)v21 + 12) = *((_QWORD *)v22 + 12);
  swift_release();
  v21[104] = v22[104];
  *((_QWORD *)v21 + 14) = *((_QWORD *)v22 + 14);
  swift_release();
  v21[120] = v22[120];
  v21[121] = v22[121];
  *((_QWORD *)v21 + 16) = *((_QWORD *)v22 + 16);
  swift_release();
  v21[136] = v22[136];
  *((_QWORD *)v21 + 18) = *((_QWORD *)v22 + 18);
  swift_release();
  v21[152] = v22[152];
  v21[153] = v22[153];
  *((_QWORD *)v21 + 20) = *((_QWORD *)v22 + 20);
  swift_release();
  v21[168] = v22[168];
  *((_QWORD *)v21 + 22) = *((_QWORD *)v22 + 22);
  swift_release();
  v21[184] = v22[184];
  v21[185] = v22[185];
  *((_QWORD *)v21 + 24) = *((_QWORD *)v22 + 24);
  v23 = v10[11];
  v24 = &a1[v23];
  v25 = &a2[v23];
  v26 = sub_1A9CE62E8();
  v27 = *(_QWORD *)(v26 - 8);
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  v29 = v28(v24, 1, v26);
  v30 = v28(v25, 1, v26);
  if (v29)
  {
    if (!v30)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v24, v25, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v30)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v26);
LABEL_18:
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v24, v25, v26);
LABEL_19:
  v32 = v10[12];
  v33 = &a1[v32];
  v34 = &a2[v32];
  v35 = v28(&a1[v32], 1, v26);
  v36 = v28(v34, 1, v26);
  if (v35)
  {
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v33, v34, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v33, 0, 1, v26);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v36)
  {
    (*(void (**)(char *, uint64_t))(v27 + 8))(v33, v26);
LABEL_24:
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v33, v34, v26);
LABEL_25:
  v38 = v10[13];
  v39 = &a1[v38];
  v40 = &a2[v38];
  v41 = v28(&a1[v38], 1, v26);
  v42 = v28(v40, 1, v26);
  if (!v41)
  {
    if (!v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 40))(v39, v40, v26);
      goto LABEL_31;
    }
    (*(void (**)(char *, uint64_t))(v27 + 8))(v39, v26);
    goto LABEL_30;
  }
  if (v42)
  {
LABEL_30:
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v39, v40, v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v39, 0, 1, v26);
LABEL_31:
  v44 = v10[14];
  v45 = *(void **)&a1[v44];
  *(_QWORD *)&a1[v44] = *(_QWORD *)&a2[v44];

  return a1;
}

uint64_t sub_1A9CD6C04()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A9CD6C14()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t *_s13SleepHealthUI22ScheduleOccurrenceViewVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  char *v39;
  uint64_t v40;
  char *__dst;

  v4 = type metadata accessor for ScheduleOccurrenceViewModel();
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = (int *)v4;
    v7 = sub_1A9CE60C0();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 1, v7))
    {
      sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v12 = v6[5];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    if (v9((uint64_t *)((char *)a2 + v12), 1, v7))
    {
      sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v13, v14, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v13, 0, 1, v7);
    }
    v16 = v6[6];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    *(_QWORD *)v17 = *(_QWORD *)v18;
    v17[8] = v18[8];
    *(uint64_t *)((char *)a1 + v6[7]) = *(uint64_t *)((char *)a2 + v6[7]);
    *((_BYTE *)a1 + v6[8]) = *((_BYTE *)a2 + v6[8]);
    *((_BYTE *)a1 + v6[9]) = *((_BYTE *)a2 + v6[9]);
    v19 = v6[10];
    v20 = (char *)a1 + v19;
    v21 = (char *)a2 + v19;
    *(_QWORD *)v20 = *(_QWORD *)v21;
    v20[8] = v21[8];
    *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
    v20[24] = v21[24];
    v20[25] = v21[25];
    *((_QWORD *)v20 + 4) = *((_QWORD *)v21 + 4);
    v20[40] = v21[40];
    *((_QWORD *)v20 + 6) = *((_QWORD *)v21 + 6);
    v20[56] = v21[56];
    v20[57] = v21[57];
    *((_QWORD *)v20 + 8) = *((_QWORD *)v21 + 8);
    v20[72] = v21[72];
    *((_QWORD *)v20 + 10) = *((_QWORD *)v21 + 10);
    v20[88] = v21[88];
    v20[89] = v21[89];
    *((_QWORD *)v20 + 12) = *((_QWORD *)v21 + 12);
    v20[104] = v21[104];
    *((_QWORD *)v20 + 14) = *((_QWORD *)v21 + 14);
    v20[120] = v21[120];
    v20[121] = v21[121];
    *((_QWORD *)v20 + 16) = *((_QWORD *)v21 + 16);
    v20[136] = v21[136];
    *((_QWORD *)v20 + 18) = *((_QWORD *)v21 + 18);
    v20[152] = v21[152];
    v20[153] = v21[153];
    *((_QWORD *)v20 + 20) = *((_QWORD *)v21 + 20);
    v20[168] = v21[168];
    *((_QWORD *)v20 + 22) = *((_QWORD *)v21 + 22);
    v20[184] = v21[184];
    v20[185] = v21[185];
    *((_QWORD *)v20 + 24) = *((_QWORD *)v21 + 24);
    v22 = v6[11];
    __dst = (char *)a1 + v22;
    v39 = (char *)a2 + v22;
    v23 = sub_1A9CE62E8();
    v40 = *(_QWORD *)(v23 - 8);
    v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    if (v24(v39, 1, v23))
    {
      sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      memcpy(__dst, v39, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
      v26 = v40;
    }
    else
    {
      v26 = v40;
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(__dst, v39, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(__dst, 0, 1, v23);
    }
    v27 = v6[12];
    v28 = (char *)a1 + v27;
    v29 = (char *)a2 + v27;
    if (v24((char *)a2 + v27, 1, v23))
    {
      sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v28, v29, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v28, 0, 1, v23);
    }
    v31 = v6[13];
    v32 = (char *)a1 + v31;
    v33 = (char *)a2 + v31;
    if (v24((char *)a2 + v31, 1, v23))
    {
      sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v32, v33, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v32, 0, 1, v23);
    }
    v35 = v6[14];
    v36 = *(void **)((char *)a2 + v35);
    *(uint64_t *)((char *)a1 + v35) = (uint64_t)v36;
    v37 = v36;
  }
  return a1;
}

char *_s13SleepHealthUI22ScheduleOccurrenceViewVwca_0(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(char *, uint64_t, uint64_t);
  int v7;
  int v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;

  v4 = sub_1A9CE60C0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 1, v4);
  v8 = v6(a2, 1, v4);
  if (v7)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(a1, a2, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(a1, v4);
LABEL_6:
    sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(a1, a2, v4);
LABEL_7:
  v10 = (int *)type metadata accessor for ScheduleOccurrenceViewModel();
  v11 = v10[5];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = v6(&a1[v11], 1, v4);
  v15 = v6(v13, 1, v4);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v12, v13, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v12, 0, 1, v4);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
LABEL_12:
    sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(v12, v13, v4);
LABEL_13:
  v17 = v10[6];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = *(_QWORD *)v19;
  v18[8] = v19[8];
  *(_QWORD *)v18 = v20;
  *(_QWORD *)&a1[v10[7]] = *(_QWORD *)&a2[v10[7]];
  a1[v10[8]] = a2[v10[8]];
  a1[v10[9]] = a2[v10[9]];
  v21 = v10[10];
  v22 = &a1[v21];
  v23 = &a2[v21];
  *(_QWORD *)&a1[v21] = *(_QWORD *)&a2[v21];
  swift_retain();
  swift_release();
  v22[8] = v23[8];
  *((_QWORD *)v22 + 2) = *((_QWORD *)v23 + 2);
  swift_retain();
  swift_release();
  v22[24] = v23[24];
  v22[25] = v23[25];
  *((_QWORD *)v22 + 4) = *((_QWORD *)v23 + 4);
  swift_retain();
  swift_release();
  v22[40] = v23[40];
  *((_QWORD *)v22 + 6) = *((_QWORD *)v23 + 6);
  swift_retain();
  swift_release();
  v22[56] = v23[56];
  v22[57] = v23[57];
  *((_QWORD *)v22 + 8) = *((_QWORD *)v23 + 8);
  swift_retain();
  swift_release();
  v22[72] = v23[72];
  *((_QWORD *)v22 + 10) = *((_QWORD *)v23 + 10);
  swift_retain();
  swift_release();
  v22[88] = v23[88];
  v22[89] = v23[89];
  *((_QWORD *)v22 + 12) = *((_QWORD *)v23 + 12);
  swift_retain();
  swift_release();
  v22[104] = v23[104];
  *((_QWORD *)v22 + 14) = *((_QWORD *)v23 + 14);
  swift_retain();
  swift_release();
  v22[120] = v23[120];
  v22[121] = v23[121];
  *((_QWORD *)v22 + 16) = *((_QWORD *)v23 + 16);
  swift_retain();
  swift_release();
  v22[136] = v23[136];
  *((_QWORD *)v22 + 18) = *((_QWORD *)v23 + 18);
  swift_retain();
  swift_release();
  v22[152] = v23[152];
  v22[153] = v23[153];
  *((_QWORD *)v22 + 20) = *((_QWORD *)v23 + 20);
  swift_retain();
  swift_release();
  v22[168] = v23[168];
  *((_QWORD *)v22 + 22) = *((_QWORD *)v23 + 22);
  swift_retain();
  swift_release();
  v22[184] = v23[184];
  v22[185] = v23[185];
  *((_QWORD *)v22 + 24) = *((_QWORD *)v23 + 24);
  v24 = v10[11];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = sub_1A9CE62E8();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v25, v26, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v25, v27);
LABEL_18:
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_19;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v25, v26, v27);
LABEL_19:
  v33 = v10[12];
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = v29(&a1[v33], 1, v27);
  v37 = v29(v35, 1, v27);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v34, v35, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v34, 0, 1, v27);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v37)
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v34, v27);
LABEL_24:
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_25;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v34, v35, v27);
LABEL_25:
  v39 = v10[13];
  v40 = &a1[v39];
  v41 = &a2[v39];
  v42 = v29(&a1[v39], 1, v27);
  v43 = v29(v41, 1, v27);
  if (!v42)
  {
    if (!v43)
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 24))(v40, v41, v27);
      goto LABEL_31;
    }
    (*(void (**)(char *, uint64_t))(v28 + 8))(v40, v27);
    goto LABEL_30;
  }
  if (v43)
  {
LABEL_30:
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
    goto LABEL_31;
  }
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v40, v41, v27);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v40, 0, 1, v27);
LABEL_31:
  v45 = v10[14];
  v46 = *(void **)&a1[v45];
  v47 = *(void **)&a2[v45];
  *(_QWORD *)&a1[v45] = v47;
  v48 = v47;

  return a1;
}

char *_s13SleepHealthUI22ScheduleOccurrenceViewVwtk_0(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(char *, uint64_t, uint64_t);
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;

  v4 = sub_1A9CE60C0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  if (v6(a2, 1, v4))
  {
    sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(a1, a2, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(a1, 0, 1, v4);
  }
  v8 = (int *)type metadata accessor for ScheduleOccurrenceViewModel();
  v9 = v8[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  if (v6(&a2[v9], 1, v4))
  {
    sub_1A9B92F34(0, &qword_1EEB44248, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAEAB0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v11, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
  }
  v13 = v8[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  *(_QWORD *)&a1[v8[7]] = *(_QWORD *)&a2[v8[7]];
  a1[v8[8]] = a2[v8[8]];
  a1[v8[9]] = a2[v8[9]];
  v16 = v8[10];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = *((_OWORD *)v18 + 3);
  *((_OWORD *)v17 + 2) = *((_OWORD *)v18 + 2);
  *((_OWORD *)v17 + 3) = v19;
  v20 = *((_OWORD *)v18 + 1);
  *(_OWORD *)v17 = *(_OWORD *)v18;
  *((_OWORD *)v17 + 1) = v20;
  v21 = *((_OWORD *)v18 + 7);
  *((_OWORD *)v17 + 6) = *((_OWORD *)v18 + 6);
  *((_OWORD *)v17 + 7) = v21;
  v22 = *((_OWORD *)v18 + 5);
  *((_OWORD *)v17 + 4) = *((_OWORD *)v18 + 4);
  *((_OWORD *)v17 + 5) = v22;
  *((_QWORD *)v17 + 24) = *((_QWORD *)v18 + 24);
  v23 = *((_OWORD *)v18 + 11);
  *((_OWORD *)v17 + 10) = *((_OWORD *)v18 + 10);
  *((_OWORD *)v17 + 11) = v23;
  v24 = *((_OWORD *)v18 + 9);
  *((_OWORD *)v17 + 8) = *((_OWORD *)v18 + 8);
  *((_OWORD *)v17 + 9) = v24;
  v25 = v8[11];
  v26 = &a1[v25];
  v27 = &a2[v25];
  v28 = sub_1A9CE62E8();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  if (v30(v27, 1, v28))
  {
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v26, v27, v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
  }
  v32 = v8[12];
  v33 = &a1[v32];
  v34 = &a2[v32];
  if (v30(&a2[v32], 1, v28))
  {
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v33, v34, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v33, v34, v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v33, 0, 1, v28);
  }
  v36 = v8[13];
  v37 = &a1[v36];
  v38 = &a2[v36];
  if (v30(&a2[v36], 1, v28))
  {
    sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    memcpy(v37, v38, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v37, v38, v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v37, 0, 1, v28);
  }
  *(_QWORD *)&a1[v8[14]] = *(_QWORD *)&a2[v8[14]];
  return a1;
}

uint64_t sub_1A9CD7B3C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ScheduleOccurrenceViewModel();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1A9CD7B88()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm_1(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ScheduleOccurrenceViewModel();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1A9CD7BD8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CD7BE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CD7BF8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

void sub_1A9CD7CE0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A5D0)
  {
    sub_1A9B92F34(255, &qword_1EEB4A3D8, (uint64_t (*)(uint64_t))sub_1A9CD5344, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CE0648]);
    sub_1A9BA6F4C();
    v0 = sub_1A9CE708C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A5D0);
  }
}

void sub_1A9CD7D60(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, _QWORD, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_1A9C63DFC(255);
    v7 = a3(a1, MEMORY[0x1E0CE0428], v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

unint64_t sub_1A9CD7DC0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1EEB4A5E0;
  if (!qword_1EEB4A5E0)
  {
    sub_1A9CD7D60(255, &qword_1EEB4A3C8, (uint64_t (*)(uint64_t, _QWORD, uint64_t))MEMORY[0x1E0CDB880]);
    v2 = v1;
    v3 = sub_1A9BA409C(&qword_1EEB48458, (uint64_t (*)(uint64_t))sub_1A9C63DFC, (uint64_t (*)(void))sub_1A9C641CC, MEMORY[0x1E0CE0798]);
    v4[0] = MEMORY[0x1E0CE0400];
    v4[1] = v3;
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CDB8A0], v2, v4);
    atomic_store(result, (unint64_t *)&qword_1EEB4A5E0);
  }
  return result;
}

uint64_t sub_1A9CD7E58(uint64_t a1)
{
  uint64_t v2;

  sub_1A9CD7D60(0, &qword_1EEB4A3C8, (uint64_t (*)(uint64_t, _QWORD, uint64_t))MEMORY[0x1E0CDB880]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1A9CD7EA8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEB4A5E8;
  if (!qword_1EEB4A5E8)
  {
    sub_1A9CD7F10(255, &qword_1EEB4A5F0, &qword_1EEB4A5F8, (uint64_t (*)(uint64_t))sub_1A9CD7FA0, &qword_1EEB4A608);
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CDFCC0], v1);
    atomic_store(result, (unint64_t *)&qword_1EEB4A5E8);
  }
  return result;
}

void sub_1A9CD7F10(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t (*a4)(uint64_t), unint64_t *a5)
{
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1A9B92F34(255, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CE0648]);
    sub_1A9BCC5EC(a5, a3, a4);
    v9 = sub_1A9CE7EB4();
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_1A9CD7FA0()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1EEB4A600)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1EEB4A600);
  }
}

unint64_t sub_1A9CD8004()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB4A610;
  if (!qword_1EEB4A610)
  {
    sub_1A9CD809C();
    v2 = v1;
    v3[0] = sub_1A9B92B9C(&qword_1EEB4A638, (uint64_t (*)(uint64_t))sub_1A9CD8148, MEMORY[0x1E0CD8A20]);
    v3[1] = sub_1A9BCC5EC(&qword_1EEB4A608, &qword_1EEB4A5F8, (uint64_t (*)(uint64_t))sub_1A9CD7FA0);
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD91E0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A610);
  }
  return result;
}

void sub_1A9CD809C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A618)
  {
    sub_1A9CD8148();
    sub_1A9B92F34(255, &qword_1EEB4A5F8, (uint64_t (*)(uint64_t))sub_1A9CD7FA0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CE0648]);
    sub_1A9B92B9C(&qword_1EEB4A630, (uint64_t (*)(uint64_t))sub_1A9CD8148, MEMORY[0x1E0CD8A18]);
    v0 = sub_1A9CE708C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A618);
  }
}

void sub_1A9CD8148()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A620)
  {
    sub_1A9CD81A0();
    v0 = sub_1A9CE6F9C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A620);
  }
}

unint64_t sub_1A9CD81A0()
{
  unint64_t result;

  result = qword_1EEB4A628;
  if (!qword_1EEB4A628)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for ProportionalHStack, &type metadata for ProportionalHStack);
    atomic_store(result, (unint64_t *)&qword_1EEB4A628);
  }
  return result;
}

uint64_t ScheduleOccurrenceTitleView.__allocating_init(titleText:subtitleText:screenSize:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return ScheduleOccurrenceTitleView.init(titleText:subtitleText:screenSize:)(a5, a6, a1, a2, a3, a4);
}

uint64_t ScheduleOccurrenceTitleView.init(titleText:subtitleText:screenSize:)(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
  uint64_t v11;
  void *v12;
  id v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t result;
  void *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  char **v49;
  id v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  double v67;
  id v68;
  id v69;
  id v70;
  id v71;
  objc_super v72;

  v7 = v6;
  v11 = OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title;
  v12 = (void *)*MEMORY[0x1E0DC4AE8];
  v13 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v14 = v7;
  v15 = v12;
  v16 = objc_msgSend(v13, sel_init);
  sub_1A9B94A18(0, (unint64_t *)&qword_1EEB45220);
  v17 = v16;
  v18 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)((uint64_t)v15, 0, 0, 0, 0, 0, 0, 0, 1);
  objc_msgSend(v17, sel_setFont_, v18);

  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v17, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v17, sel_setLineBreakMode_, 0);
  objc_msgSend(v17, sel_setNumberOfLines_, 0);
  objc_msgSend(v17, sel_setTextAlignment_, 1);
  *(_QWORD *)&v7[v11] = v17;
  *(_QWORD *)&v14[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint] = 0;
  v19 = v17;
  v20 = (void *)sub_1A9CE82B0();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setText_, v20);

  if (a6)
  {
    v21 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ScheduleOccurrenceHeaderView()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v22 = sub_1A9CA87A0();
    v23 = (void *)sub_1A9CE82B0();
    objc_msgSend(v22, sel_setText_, v23);
    swift_bridgeObjectRelease();

  }
  else
  {
    v21 = 0;
  }
  *(_QWORD *)&v14[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_subtitle] = v21;

  v72.receiver = v14;
  v72.super_class = (Class)type metadata accessor for ScheduleOccurrenceTitleView();
  v24 = (char *)objc_msgSendSuper2(&v72, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v25 = OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title;
  v26 = *(void **)&v24[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title];
  v27 = v24;
  objc_msgSend(v27, sel_addSubview_, v26);
  v28 = objc_msgSend(v26, sel_topAnchor);
  v29 = objc_msgSend(v27, sel_topAnchor);
  v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

  v31 = OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint;
  v32 = *(void **)&v27[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint];
  *(_QWORD *)&v27[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint] = v30;

  sub_1A9BB7420();
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_1A9CEF0F0;
  v34 = *(void **)&v27[v31];
  if (v34)
  {
    v35 = (_QWORD *)result;
    v36 = (void *)objc_opt_self();
    v35[4] = v34;
    v37 = *(void **)&v24[v25];
    v38 = v34;
    v39 = objc_msgSend(v37, sel_leadingAnchor);
    v40 = objc_msgSend(v27, sel_leadingAnchor);
    v41 = objc_msgSend(v39, (SEL)&selRef_centerXAnchor + 6, v40);

    v35[5] = v41;
    v42 = objc_msgSend(v27, sel_trailingAnchor);
    v43 = objc_msgSend(*(id *)&v24[v25], sel_trailingAnchor);
    v44 = objc_msgSend(v42, (SEL)&selRef_centerXAnchor + 6, v43);

    v35[6] = v44;
    sub_1A9CE83E8();
    sub_1A9B94A18(0, (unint64_t *)&qword_1EEB44570);
    v45 = (void *)sub_1A9CE83D0();
    swift_bridgeObjectRelease();
    v71 = v36;
    objc_msgSend(v36, sel_activateConstraints_, v45);

    v46 = qword_1EEB42F30;
    v47 = *(id *)&v24[v25];
    if (v46 != -1)
      swift_once();
    v48 = *(void **)&v27[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_subtitle];
    v49 = &off_1E55E8000;
    if (v48)
    {
      v50 = v48;
      objc_msgSend(v27, sel_addSubview_, v50);
      v51 = *(void **)&v24[v25];
      LODWORD(v52) = 1148829696;
      objc_msgSend(v51, sel_setContentHuggingPriority_forAxis_, 1, v52);
      LODWORD(v53) = 1148846080;
      objc_msgSend(v51, sel_setContentCompressionResistancePriority_forAxis_, 1, v53);
      LODWORD(v54) = 1144750080;
      objc_msgSend(v50, sel_setContentHuggingPriority_forAxis_, 1, v54);
      LODWORD(v55) = 1148846080;
      objc_msgSend(v50, sel_setContentCompressionResistancePriority_forAxis_, 1, v55);
      objc_msgSend(v50, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v56 = swift_allocObject();
      *(_OWORD *)(v56 + 16) = xmmword_1A9CEF0F0;
      v57 = objc_msgSend(v50, sel_topAnchor);
      v58 = objc_msgSend(v51, sel_bottomAnchor);
      if (qword_1EEB42F28 != -1)
        swift_once();
      v59 = objc_msgSend(v57, sel_constraintEqualToAnchor_constant_, v58, *(double *)&qword_1EEB4A640);

      *(_QWORD *)(v56 + 32) = v59;
      v60 = objc_msgSend(v50, sel_leadingAnchor);
      v61 = objc_msgSend(v27, sel_leadingAnchor);
      v62 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v61);

      *(_QWORD *)(v56 + 40) = v62;
      v63 = objc_msgSend(v27, sel_trailingAnchor);
      v64 = objc_msgSend(v50, sel_trailingAnchor);
      v65 = objc_msgSend(v63, sel_constraintEqualToAnchor_, v64);

      *(_QWORD *)(v56 + 48) = v65;
      sub_1A9CE83E8();
      v66 = (void *)sub_1A9CE83D0();
      swift_bridgeObjectRelease();
      objc_msgSend(v71, sel_activateConstraints_, v66);

      v67 = 0.0;
      v49 = &off_1E55E8000;
    }
    else
    {
      v67 = *(double *)&qword_1EEB4A648;
      v50 = v47;
    }
    v68 = objc_msgSend(v27, v49[464]);
    v69 = objc_msgSend(v50, v49[464]);
    v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_constant_, v69, v67);

    objc_msgSend(v70, sel_setActive_, 1);
    sub_1A9CD8A28(a1, a2);

    return (uint64_t)v27;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A9CD8A28(double a1, double a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;

  v5 = sub_1A9CE8B8C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)&v2[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint];
  if (v10)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x1E0DED508], v5);
    v11 = v10;
    v12 = objc_msgSend(v2, sel_traitCollection);
    objc_msgSend(v12, sel_displayScale);
    v14 = CGFloat.rounded(_:toScale:)((uint64_t)v9, v13, a2 * 0.09);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    objc_msgSend(v11, sel_setConstant_, fmax(v14 + -58.0, 8.0));

    v15 = *(void **)&v2[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title];
    sub_1A9B94A18(0, (unint64_t *)&qword_1EEB45220);
    v16 = (uint64_t *)MEMORY[0x1E0DC4AE8];
    if (a1 <= 320.0)
      v16 = (uint64_t *)MEMORY[0x1E0DC4B50];
    v17 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)(*v16, (a1 <= 320.0) << 15, 0, 0, 0, 0, 0, *MEMORY[0x1E0DC1420], 0);
    objc_msgSend(v15, sel_setFont_, v17);

  }
  else
  {
    __break(1u);
  }
}

id ScheduleOccurrenceTitleView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void ScheduleOccurrenceTitleView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ScheduleOccurrenceTitleView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceTitleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1A9CD8D94()
{
  qword_1EEB4A640 = 0x402E000000000000;
}

void sub_1A9CD8DA4()
{
  qword_1EEB4A648 = 0x4042000000000000;
}

uint64_t type metadata accessor for ScheduleOccurrenceTitleView()
{
  return objc_opt_self();
}

uint64_t method lookup function for ScheduleOccurrenceTitleView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ScheduleOccurrenceTitleView.__allocating_init(titleText:subtitleText:screenSize:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

void sub_1A9CD8DE8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v1 = v0;
  v2 = OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_title;
  v3 = (void *)*MEMORY[0x1E0DC4AE8];
  v4 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v5 = v3;
  v6 = objc_msgSend(v4, sel_init);
  sub_1A9B94A18(0, (unint64_t *)&qword_1EEB45220);
  v7 = v6;
  v8 = static UIFont.preferredFont(for:traits:rounded:short:loose:smallCaps:monospaced:weight:)((uint64_t)v5, 0, 0, 0, 0, 0, 0, 0, 1);
  objc_msgSend(v7, sel_setFont_, v8);

  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v7, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v7, sel_setLineBreakMode_, 0);
  objc_msgSend(v7, sel_setNumberOfLines_, 0);
  objc_msgSend(v7, sel_setTextAlignment_, 1);
  *(_QWORD *)&v1[v2] = v7;
  *(_QWORD *)&v1[OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceTitleView_topConstraint] = 0;

  sub_1A9CE8A84();
  __break(1u);
}

uint64_t String.init<A>(describingOptional:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];
  _QWORD v10[2];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  v9[2] = a2;
  v9[3] = sub_1A9CD90DC;
  v9[4] = v4;
  v5 = sub_1A9CE8880();
  sub_1A9CD911C((void (*)(char *, char *))sub_1A9CD90E4, (uint64_t)v9, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEA968], v6, (uint64_t)v10);
  swift_release();
  if (v10[1])
    v7 = v10[0];
  else
    v7 = 7104878;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v7;
}

uint64_t sub_1A9CD9060(uint64_t a1)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = MEMORY[0x1E0C80A78](a1, a1);
  (*(void (**)(char *, double))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  return sub_1A9CE82F8();
}

uint64_t sub_1A9CD90CC()
{
  return swift_deallocObject();
}

uint64_t sub_1A9CD90DC(uint64_t a1)
{
  return sub_1A9CD9060(a1);
}

uint64_t sub_1A9CD90E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(v1 + 24))();
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1A9CD911C@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *);
  uint64_t v31;

  v28 = a5;
  v29 = a2;
  v30 = a1;
  v31 = a6;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x1E0C80A78](a1, a2);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v17 = MEMORY[0x1E0C80A78](v10, v16);
  v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17, v20);
  v22 = (char *)&v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v23 + 16))(v22, v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v22, 1, v14) == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(v31, 1, 1, a4);
  v27 = a3;
  v26 = v28;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v19, v22, v14);
  v30(v19, v12);
  result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v19, v14);
  if (v6)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v26, v12, v27);
  return result;
}

void sub_1A9CD92B4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  _QWORD v6[6];

  v1 = objc_allocWithZone(MEMORY[0x1E0DC3658]);
  v6[4] = sub_1A9C219C0;
  v6[5] = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1A9C21C90;
  v6[3] = &block_descriptor_42;
  v2 = _Block_copy(v6);
  v3 = objc_msgSend(v1, sel_initWithDynamicProvider_, v2);
  _Block_release(v2);
  swift_release();
  objc_msgSend(v0, sel_setBackgroundColor_, v3);

  v4 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v4, sel_setPreservesSuperviewLayoutMargins_, 0);

  v5 = objc_msgSend(v0, sel_contentView);
  objc_msgSend(v5, sel_setLayoutMargins_, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

}

id sub_1A9CD9444()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScheduleOccurrenceDayPickerTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ScheduleOccurrenceDayPickerTableViewCell()
{
  return objc_opt_self();
}

id sub_1A9CD94A4(uint64_t a1)
{
  swift_beginAccess();
  return sub_1A9CBE7E0(*(_QWORD *)(a1 + 56), (uint64_t)objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC13SleepHealthUI27ScheduleOccurrenceEditModel_mutableOccurrence), sel_weekdays));
}

char *sub_1A9CD951C(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  id v6;
  char *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;

  v3 = v2;
  v5 = OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker;
  v6 = objc_allocWithZone(MEMORY[0x1E0CB3578]);
  v7 = v3;
  v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setFormattingContext_, 2);
  v9 = objc_allocWithZone((Class)type metadata accessor for SleepScheduleDayPicker());
  *(_QWORD *)&v3[v5] = sub_1A9CBDAC4(v8, 0, 0);

  if (a2)
  {
    v10 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for ScheduleOccurrenceDayPickerTableViewCell();
  v11 = objc_msgSendSuper2(&v17, sel_initWithStyle_reuseIdentifier_, 0, v10);

  v12 = (char *)v11;
  v13 = objc_msgSend(v12, sel_contentView);
  objc_msgSend(v13, sel_addSubview_, *(_QWORD *)&v12[OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker]);

  sub_1A9CD92B4();
  v14 = objc_msgSend(v12, sel_contentView);
  v15 = objc_msgSend(v14, sel_layoutMarginsGuide);

  UIView.alignConstraints(to:)((UILayoutGuide)v15);
  return v12;
}

void sub_1A9CD96A8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  id v4;

  v1 = v0;
  v2 = OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  objc_msgSend(v3, sel_setFormattingContext_, 2);
  v4 = objc_allocWithZone((Class)type metadata accessor for SleepScheduleDayPicker());
  *(_QWORD *)&v1[v2] = sub_1A9CBDAC4(v3, 0, 0);

  sub_1A9CE8A84();
  __break(1u);
}

uint64_t block_copy_helper_42(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_42()
{
  return swift_release();
}

uint64_t dispatch thunk of SleepTimeDurationPickerDelegate.didUpdate(topic:duration:completion:)(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(_QWORD))(a5 + 8))(a1 & 1);
}

uint64_t sub_1A9CD9790@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  uint64_t v17;
  void (*v18)(uint64_t, char *, uint64_t);
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v22 = a2;
  sub_1A9CDE7A0();
  v4 = v3;
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1A9CE6AD4();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 16))(v7, *a1, v8);
  v10 = sub_1A9CE6C9C();
  v11 = &v7[*(int *)(v4 + 48)];
  v12 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 16))(v11, a1[1], v10);
  sub_1A9CDDE7C(0);
  v14 = v13;
  sub_1A9BAAB64(255, &qword_1EEB4A7E8, MEMORY[0x1E0CDDD78], MEMORY[0x1E0CDDD58], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0C93720]);
  sub_1A9CDDF10();
  v15 = &v7[*(int *)(v4 + 64)];
  v16 = a1[2];
  v17 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, v16, v14);
  v18 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v19 = v22;
  v18(v22, v7, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v19 + *(int *)(v4 + 48), v11, v10);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v19 + *(int *)(v4 + 64), v15, v14);
}

uint64_t OneDayDiagram.init(model:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  type metadata accessor for SleepDayModel(0);
  sub_1A9B92B9C(&qword_1ED262FC0, type metadata accessor for SleepDayModel, (uint64_t)&protocol conformance descriptor for SleepDayModel);
  result = sub_1A9CE70F8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t OneDayDiagram.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t KeyPath;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  BOOL v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v17[1] = a1;
  v2 = sub_1A9CE7620();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2, v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 8) + 32) + 16);
  if (qword_1EEB42D50 != -1)
    swift_once();
  v8 = (void *)qword_1EEB48198;
  KeyPath = swift_getKeyPath();
  v10 = v8;
  v11 = sub_1A9CE6168();
  v13 = v12;

  swift_bridgeObjectRelease();
  type metadata accessor for SleepDayModel(0);
  sub_1A9B92B9C(&qword_1ED262FC0, type metadata accessor for SleepDayModel, (uint64_t)&protocol conformance descriptor for SleepDayModel);
  swift_retain();
  v14 = sub_1A9CE70F8();
  v18 = v7 != 0;
  v19 = KeyPath;
  v20 = 0;
  v21 = v11;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  v25 = 1;
  sub_1A9CE7614();
  sub_1A9CD9BF8();
  sub_1A9B92B9C(&qword_1EEB4A700, (uint64_t (*)(uint64_t))sub_1A9CD9BF8, (uint64_t)&protocol conformance descriptor for OptionalContentGroup<A, B>);
  sub_1A9CE7B54();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  sub_1A9BAAED8(v19, v20);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t OneDayChart.init(model:showDurationText:)@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  type metadata accessor for SleepDayModel(0);
  sub_1A9B92B9C(&qword_1ED262FC0, type metadata accessor for SleepDayModel, (uint64_t)&protocol conformance descriptor for SleepDayModel);
  result = sub_1A9CE70F8();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = a1;
  return result;
}

uint64_t sub_1A9CD9BF8()
{
  uint64_t result;

  result = qword_1EEB4A6E0;
  if (!qword_1EEB4A6E0)
  {
    sub_1A9C38680(255, &qword_1EEB4A6E8, (uint64_t (*)(void))sub_1A9CD9C94, (uint64_t)&type metadata for OneDayChart, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for DiagramHeader);
    sub_1A9CD9CD8();
    type metadata accessor for OptionalContentGroup();
  }
  return result;
}

unint64_t sub_1A9CD9C94()
{
  unint64_t result;

  result = qword_1EEB4A6F0;
  if (!qword_1EEB4A6F0)
  {
    result = MEMORY[0x1AF420284](&protocol conformance descriptor for OneDayChart, &type metadata for OneDayChart);
    atomic_store(result, (unint64_t *)&qword_1EEB4A6F0);
  }
  return result;
}

unint64_t sub_1A9CD9CD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEB4A6F8;
  if (!qword_1EEB4A6F8)
  {
    sub_1A9C38680(255, &qword_1EEB4A6E8, (uint64_t (*)(void))sub_1A9CD9C94, (uint64_t)&type metadata for OneDayChart, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for DiagramHeader);
    result = MEMORY[0x1AF420284](&unk_1A9CF4900, v1);
    atomic_store(result, (unint64_t *)&qword_1EEB4A6F8);
  }
  return result;
}

void *OneDayChart.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  _OWORD v6[16];
  _BYTE __src[263];

  v3 = *(_BYTE *)(v1 + 16);
  v4 = sub_1A9CE7404();
  sub_1A9CD9E2C(v3, (uint64_t)v6);
  *(_OWORD *)&__src[199] = v6[12];
  *(_OWORD *)&__src[215] = v6[13];
  *(_OWORD *)&__src[231] = v6[14];
  *(_OWORD *)&__src[247] = v6[15];
  *(_OWORD *)&__src[135] = v6[8];
  *(_OWORD *)&__src[151] = v6[9];
  *(_OWORD *)&__src[167] = v6[10];
  *(_OWORD *)&__src[183] = v6[11];
  *(_OWORD *)&__src[71] = v6[4];
  *(_OWORD *)&__src[87] = v6[5];
  *(_OWORD *)&__src[103] = v6[6];
  *(_OWORD *)&__src[119] = v6[7];
  *(_OWORD *)&__src[7] = v6[0];
  *(_OWORD *)&__src[23] = v6[1];
  *(_OWORD *)&__src[39] = v6[2];
  *(_OWORD *)&__src[55] = v6[3];
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x107uLL);
}

uint64_t sub_1A9CD9E2C@<X0>(char a1@<W2>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  char v41;
  uint64_t v42;
  char v45;
  char v46;
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
  _BYTE v57[7];
  char v58;
  _BYTE v59[7];
  char v60;
  _BYTE v61[7];
  _BYTE v62[7];
  _BYTE v63[7];
  int v64;
  __int16 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int16 v71;
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
  char v82;
  char v83;

  v3 = sub_1A9CE6150();
  MEMORY[0x1E0C80A78](v3, v4);
  swift_retain();
  sub_1A9C67308();
  swift_release();
  v5 = sub_1A9CE79BC();
  v7 = v6;
  v9 = v8;
  if (qword_1EEB42EB8 != -1)
    swift_once();
  v10 = v9 & 1;
  v11 = sub_1A9CE7998();
  v13 = v12;
  v15 = v14;
  v17 = v16 & 1;
  sub_1A9BAA670(v5, v7, v10);
  swift_bridgeObjectRelease();
  v18 = sub_1A9CE774C();
  sub_1A9CE6F24();
  if ((a1 & 1) != 0)
  {
    *(_QWORD *)&v66 = v11;
    *((_QWORD *)&v66 + 1) = v13;
    *(_QWORD *)&v67 = v17;
    *((_QWORD *)&v67 + 1) = v15;
    *(_QWORD *)&v68 = 256;
    *((_QWORD *)&v68 + 1) = v18;
    *(_QWORD *)&v69 = v19;
    *((_QWORD *)&v69 + 1) = v20;
    *(_QWORD *)&v70 = v21;
    *((_QWORD *)&v70 + 1) = v22;
    v71 = 256;
    sub_1A9B92F34(0, &qword_1EEB4A730, (uint64_t (*)(uint64_t))sub_1A9CDB994, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CDF678]);
    sub_1A9CDEF00();
    sub_1A9CE74E8();
  }
  else
  {
    sub_1A9B92F34(0, &qword_1EEB4A730, (uint64_t (*)(uint64_t))sub_1A9CDB994, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CDF678]);
    sub_1A9CDEF00();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0;
    sub_1A9CE74E8();
    sub_1A9BAA670(v11, v13, v17);
    swift_bridgeObjectRelease();
  }
  v56 = v72;
  v55 = v73;
  v54 = v74;
  v53 = v75;
  v52 = v76;
  v51 = v77;
  v50 = v78;
  v49 = v79;
  v48 = v80;
  v47 = v81;
  v46 = v82;
  v45 = v83;
  type metadata accessor for SleepDayModel(0);
  sub_1A9B92B9C(&qword_1ED262FC0, type metadata accessor for SleepDayModel, (uint64_t)&protocol conformance descriptor for SleepDayModel);
  swift_retain();
  v23 = sub_1A9CE70F8();
  v25 = v24;
  v26 = sub_1A9CE774C();
  sub_1A9CE6F24();
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v35 = sub_1A9CE7398();
  sub_1A9CDA4BC((uint64_t)&v66);
  v36 = v66;
  v37 = v67;
  v60 = BYTE8(v68);
  *(_DWORD *)(a2 + 82) = v64;
  *(_WORD *)(a2 + 86) = v65;
  *(_DWORD *)(a2 + 105) = v66;
  *(_DWORD *)(a2 + 108) = *(_DWORD *)((char *)&v66 + 3);
  *(_DWORD *)(a2 + 148) = *(_DWORD *)&v63[3];
  *(_DWORD *)(a2 + 145) = *(_DWORD *)v63;
  *(_DWORD *)(a2 + 172) = *(_DWORD *)&v62[3];
  *(_DWORD *)(a2 + 169) = *(_DWORD *)v62;
  *(_DWORD *)(a2 + 196) = *(_DWORD *)&v61[3];
  *(_DWORD *)(a2 + 193) = *(_DWORD *)v61;
  *(_DWORD *)(a2 + 220) = *(_DWORD *)&v59[3];
  *(_DWORD *)(a2 + 217) = *(_DWORD *)v59;
  *(_DWORD *)(a2 + 244) = *(_DWORD *)&v57[3];
  *(_DWORD *)(a2 + 241) = *(_DWORD *)v57;
  v38 = *((_QWORD *)&v67 + 1);
  v39 = v68;
  *(_QWORD *)(a2 + 88) = v23;
  *(_BYTE *)(a2 + 104) = v26;
  v40 = v69;
  *(_QWORD *)(a2 + 152) = v35;
  *(_BYTE *)(a2 + 168) = 1;
  *(_BYTE *)(a2 + 192) = v37;
  v41 = v70;
  v58 = v70;
  *(_QWORD *)(a2 + 200) = v38;
  *(_QWORD *)(a2 + 208) = v39;
  *(_BYTE *)(a2 + 216) = v60;
  *(_BYTE *)(a2 + 240) = v58;
  v42 = *((_QWORD *)&v70 + 1);
  *(_QWORD *)a2 = v56;
  *(_QWORD *)(a2 + 8) = v55;
  *(_QWORD *)(a2 + 16) = v54;
  *(_QWORD *)(a2 + 24) = v53;
  *(_QWORD *)(a2 + 32) = v52;
  *(_QWORD *)(a2 + 40) = v51;
  *(_QWORD *)(a2 + 48) = v50;
  *(_QWORD *)(a2 + 56) = v49;
  *(_QWORD *)(a2 + 64) = v48;
  *(_QWORD *)(a2 + 72) = v47;
  *(_BYTE *)(a2 + 80) = v46;
  *(_BYTE *)(a2 + 81) = v45;
  *(_QWORD *)(a2 + 96) = v25;
  *(_QWORD *)(a2 + 112) = v28;
  *(_QWORD *)(a2 + 120) = v30;
  *(_QWORD *)(a2 + 128) = v32;
  *(_QWORD *)(a2 + 136) = v34;
  *(_BYTE *)(a2 + 144) = 0;
  *(_QWORD *)(a2 + 160) = 0;
  *(_OWORD *)(a2 + 176) = v36;
  *(_OWORD *)(a2 + 224) = v40;
  *(_QWORD *)(a2 + 248) = v42;
  sub_1A9CDEFE0(v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45);
  swift_retain();
  sub_1A9BAA680(v36, *((uint64_t *)&v36 + 1), v37);
  swift_bridgeObjectRetain();
  sub_1A9BAA680(v40, *((uint64_t *)&v40 + 1), v41);
  swift_bridgeObjectRetain();
  sub_1A9BAA670(v36, *((uint64_t *)&v36 + 1), v37);
  swift_bridgeObjectRelease();
  sub_1A9BAA670(v40, *((uint64_t *)&v40 + 1), v41);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1A9CDF01C(v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45);
}

uint64_t sub_1A9CDA4BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;

  v2 = sub_1A9CE6150();
  MEMORY[0x1E0C80A78](v2, v3);
  v5 = (char *)v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_1A9C66ABC();
  v6 = sub_1A9C667F8();
  sub_1A9CE8364();
  swift_release();
  swift_bridgeObjectRelease();

  v47[1] = v5;
  v7 = sub_1A9CE79BC();
  v9 = v8;
  v11 = v10;
  if (qword_1EEB42CE8 != -1)
    swift_once();
  v12 = v11 & 1;
  v13 = sub_1A9CE7968();
  v15 = v14;
  v17 = v16;
  sub_1A9BAA670(v7, v9, v12);
  swift_bridgeObjectRelease();
  if (qword_1EEB42EC0 != -1)
    swift_once();
  v18 = v17 & 1;
  v19 = sub_1A9CE7998();
  v48 = v20;
  v49 = v19;
  v22 = v21;
  v50 = v23;
  sub_1A9BAA670(v13, v15, v18);
  swift_bridgeObjectRelease();
  swift_retain();
  sub_1A9C66AD4();
  v24 = sub_1A9C667F8();
  sub_1A9CE8364();
  swift_release();
  swift_bridgeObjectRelease();

  v25 = sub_1A9CE79BC();
  v27 = v26;
  v29 = v28;
  if (qword_1ED262D40 != -1)
    swift_once();
  v30 = v29 & 1;
  v31 = v22 & 1;
  v32 = sub_1A9CE7968();
  v34 = v33;
  v36 = v35 & 1;
  sub_1A9BAA670(v25, v27, v30);
  swift_bridgeObjectRelease();
  v37 = sub_1A9CE7998();
  v39 = v38;
  v41 = v40;
  v43 = v42 & 1;
  sub_1A9BAA670(v32, v34, v36);
  swift_bridgeObjectRelease();
  v51 = v31;
  v45 = v48;
  v44 = v49;
  *(_QWORD *)a1 = v49;
  *(_QWORD *)(a1 + 8) = v45;
  *(_BYTE *)(a1 + 16) = v31;
  *(_QWORD *)(a1 + 24) = v50;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = v37;
  *(_QWORD *)(a1 + 56) = v39;
  *(_BYTE *)(a1 + 64) = v43;
  *(_QWORD *)(a1 + 72) = v41;
  sub_1A9BAA680(v44, v45, v31);
  swift_bridgeObjectRetain();
  sub_1A9BAA680(v37, v39, v43);
  swift_bridgeObjectRetain();
  sub_1A9BAA670(v37, v39, v43);
  swift_bridgeObjectRelease();
  sub_1A9BAA670(v44, v45, v51);
  return swift_bridgeObjectRelease();
}

void *sub_1A9CDA810@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t v4;
  _OWORD v6[16];
  _BYTE __src[263];

  v3 = *(_BYTE *)(v1 + 16);
  v4 = sub_1A9CE7404();
  sub_1A9CD9E2C(v3, (uint64_t)v6);
  *(_OWORD *)&__src[199] = v6[12];
  *(_OWORD *)&__src[215] = v6[13];
  *(_OWORD *)&__src[231] = v6[14];
  *(_OWORD *)&__src[247] = v6[15];
  *(_OWORD *)&__src[135] = v6[8];
  *(_OWORD *)&__src[151] = v6[9];
  *(_OWORD *)&__src[167] = v6[10];
  *(_OWORD *)&__src[183] = v6[11];
  *(_OWORD *)&__src[71] = v6[4];
  *(_OWORD *)&__src[87] = v6[5];
  *(_OWORD *)&__src[103] = v6[6];
  *(_OWORD *)&__src[119] = v6[7];
  *(_OWORD *)&__src[7] = v6[0];
  *(_OWORD *)&__src[23] = v6[1];
  *(_OWORD *)&__src[39] = v6[2];
  *(_OWORD *)&__src[55] = v6[3];
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x107uLL);
}

uint64_t sub_1A9CDA8F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  sub_1A9B94CA0(0, &qword_1ED263318, MEMORY[0x1E0CDF5D0], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1A9CEB530;
  if (qword_1EEB42CE8 != -1)
    swift_once();
  *(_QWORD *)(v6 + 32) = qword_1EEB45938;
  v7 = qword_1ED262D40;
  swift_retain();
  if (v7 != -1)
    swift_once();
  *(_QWORD *)(v6 + 40) = qword_1ED262D68;
  sub_1A9CE83E8();
  swift_retain();
  MEMORY[0x1AF41EBEC](v6);
  sub_1A9CE8058();
  sub_1A9CE8064();
  sub_1A9CE70D4();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_QWORD *)a3 = v6;
  *(_OWORD *)(a3 + 8) = v10;
  *(_QWORD *)(a3 + 24) = v11;
  *(_QWORD *)(a3 + 32) = v12;
  *(_WORD *)(a3 + 40) = 256;
  *(_QWORD *)(a3 + 48) = sub_1A9CDE940;
  *(_QWORD *)(a3 + 56) = v8;
  *(_WORD *)(a3 + 64) = 256;
  return swift_retain();
}

uint64_t sub_1A9CDAA88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v6 = sub_1A9CE7008();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6, v9);
  *(_QWORD *)a3 = sub_1A9CE7398();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  sub_1A9CDE948();
  v13[1] = *(_QWORD *)(a2 + 32);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  sub_1A9B92F34(0, &qword_1EEB4A788, type metadata accessor for SleepDayModel.SegmentModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A9CE6318();
  sub_1A9CDEA94();
  sub_1A9CDDA20();
  sub_1A9BC2784(&qword_1EEB4A870, (uint64_t (*)(uint64_t))sub_1A9CDEA94, (uint64_t (*)(void))sub_1A9CDEBC4, sub_1A9BC2D1C);
  sub_1A9B92B9C(&qword_1EEB4A848, type metadata accessor for SleepDayModel.SegmentModel, (uint64_t)&protocol conformance descriptor for SleepDayModel.SegmentModel);
  swift_bridgeObjectRetain();
  return sub_1A9CE7F5C();
}

uint64_t sub_1A9CDAC48@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(void);
  char *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v51 = a1;
  v50 = sub_1A9CE71AC();
  MEMORY[0x1E0C80A78](v50, v1);
  v3 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1A9CE7F20();
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9C9DF30(0);
  v9 = v8;
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B95370(0, &qword_1EEB4A868, v13, MEMORY[0x1E0CD9778], (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CD9BF0]);
  v49 = v14;
  MEMORY[0x1E0C80A78](v14, v15);
  v17 = (char *)&v46 - v16;
  v48 = *MEMORY[0x1E0CDB0C0];
  v18 = v48;
  v19 = sub_1A9CE73B0();
  v47 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104);
  v47(v7, v18, v19);
  sub_1A9CE6FFC();
  type metadata accessor for SleepDayModel.SegmentModel(0);
  sub_1A9CE7FEC();
  sub_1A9CE6FE4();
  v20 = MEMORY[0x1E0CDFE18];
  sub_1A9BA6F90((uint64_t)v7, (uint64_t)v12, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDFE18]);
  v21 = &v12[*(int *)(v9 + 36)];
  v22 = v53;
  *(_OWORD *)v21 = v52;
  *((_OWORD *)v21 + 1) = v22;
  *((_OWORD *)v21 + 2) = v54;
  sub_1A9B97190((uint64_t)v7, (uint64_t (*)(_QWORD))v20);
  LOBYTE(v9) = sub_1A9CE7758();
  sub_1A9CE6FFC();
  sub_1A9CE6F24();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  sub_1A9BA6F90((uint64_t)v12, (uint64_t)v17, (uint64_t (*)(_QWORD))sub_1A9C9DF30);
  v31 = &v17[*(int *)(v49 + 36)];
  *v31 = v9;
  *((_QWORD *)v31 + 1) = v24;
  *((_QWORD *)v31 + 2) = v26;
  *((_QWORD *)v31 + 3) = v28;
  *((_QWORD *)v31 + 4) = v30;
  v31[40] = 0;
  sub_1A9B97190((uint64_t)v12, (uint64_t (*)(_QWORD))sub_1A9C9DF30);
  v47(&v3[*(int *)(v50 + 20)], v48, v19);
  __asm { FMOV            V0.2D, #1.5 }
  *(_OWORD *)v3 = _Q0;
  sub_1A9CDEA94();
  v38 = v51;
  v39 = v51 + *(int *)(v37 + 36);
  v40 = MEMORY[0x1E0CDA088];
  sub_1A9BA6F90((uint64_t)v3, v39, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDA088]);
  sub_1A9BC2B90();
  *(_WORD *)(v39 + *(int *)(v41 + 36)) = 256;
  v42 = v38;
  v43 = MEMORY[0x1E0CD9778];
  v44 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CD9BF0];
  sub_1A9CDEC4C((uint64_t)v17, v42, &qword_1EEB4A868, (uint64_t (*)(uint64_t))sub_1A9C9DF30, MEMORY[0x1E0CD9778], (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CD9BF0]);
  sub_1A9B97190((uint64_t)v3, (uint64_t (*)(_QWORD))v40);
  return sub_1A9CDECA0((uint64_t)v17, &qword_1EEB4A868, (uint64_t (*)(uint64_t))sub_1A9C9DF30, v43, v44);
}

uint64_t sub_1A9CDAF8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1A9CDA8F8(*v1, v1[1], a1);
}

uint64_t OneDayBarGraph.init(model:isLoading:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v6;

  if (!a1)
  {
    type metadata accessor for SleepDayModel(0);
    swift_allocObject();
    SleepDayModel.init(segmentModels:sleepMetrics:)(MEMORY[0x1E0DEE9D8], 0);
  }
  type metadata accessor for SleepDayModel(0);
  sub_1A9B92B9C(&qword_1ED262FC0, type metadata accessor for SleepDayModel, (uint64_t)&protocol conformance descriptor for SleepDayModel);
  result = sub_1A9CE70F8();
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = v6;
  *(_BYTE *)(a3 + 16) = a2 & 1;
  return result;
}

uint64_t OneDayBarGraph.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = *v1;
  v3 = v1[1];
  v5 = *((_BYTE *)v1 + 16);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v3;
  *(_BYTE *)(v6 + 32) = v5;
  v14 = v3;
  swift_retain();
  v7 = sub_1A9CDB2B4();
  if (qword_1EEB42D70 != -1)
    swift_once();
  v8 = qword_1EEB485E0;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  sub_1A9CE7DC4();
  if (qword_1EEB42D88 != -1)
    swift_once();
  v10 = qword_1EEB485F8;
  v11 = qword_1EEB42D90;
  swift_retain();
  if (v11 != -1)
    swift_once();
  v12 = qword_1EEB48600;
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = v8;
  *(_QWORD *)(a1 + 16) = sub_1A9CDB2A8;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = sub_1A9C84A6C;
  *(_QWORD *)(a1 + 40) = v9;
  *(_BYTE *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = v14;
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v12;
  return swift_retain();
}

double sub_1A9CDB1B8@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  double result;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  char v8;
  __int128 v9;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v3 = swift_bridgeObjectRetain();
    sub_1A9CDED5C(v3, 0, 1, (uint64_t)&v9);
  }
  sub_1A9CDBB68();
  sub_1A9BA3D00();
  sub_1A9CE74E8();
  result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_OWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 32) = v7;
  *(_BYTE *)(a2 + 40) = v8;
  return result;
}

uint64_t sub_1A9CDB284()
{
  swift_release();
  return swift_deallocObject();
}

double sub_1A9CDB2A8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A9CDB1B8(*(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1A9CDB2B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*v19)(uint64_t);
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  id v24;

  sub_1A9B95370(0, &qword_1EEB4A880, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF240], (uint64_t)&off_1E55DAD90, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InfographicAccessibleTextWrapper);
  v2 = v1;
  MEMORY[0x1E0C80A78](v1, v3);
  v5 = (char *)&v23 - v4;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 8) + 32) + 16))
  {
    swift_retain();
    v6 = sub_1A9C66EA0();
    v8 = v7;
    swift_release();
  }
  else
  {
    if (qword_1ED2626A8 != -1)
      swift_once();
    v9 = (id)qword_1ED264F90;
    v6 = sub_1A9CE6168();
    v8 = v10;

    swift_bridgeObjectRelease();
  }
  swift_retain();
  sub_1A9C67308();
  swift_release();
  v11 = &v5[*(int *)(v2 + 36)];
  *(_QWORD *)v11 = 0xD00000000000002FLL;
  *((_QWORD *)v11 + 1) = 0x80000001A9D00820;
  swift_retain();
  v12 = sub_1A9C66D04();
  v23 = v13;
  v24 = v12;
  swift_release();
  sub_1A9B92F34(0, &qword_1EEB48E68, (uint64_t (*)(uint64_t))sub_1A9CDECDC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_1A9CED850;
  sub_1A9BAAB64(0, (unint64_t *)&qword_1EEB48E78, MEMORY[0x1E0DEA968], (uint64_t)&off_1E55DADA0, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for InfographicAccessibleTextWrapper);
  v16 = v15;
  *(_QWORD *)(v14 + 56) = v15;
  *(_QWORD *)(v14 + 64) = &off_1E55DAF98;
  v17 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v14 + 32) = v17;
  v17[2] = v6;
  v17[3] = v8;
  v17[4] = 0xD000000000000030;
  v17[5] = 0x80000001A9D007E0;
  *(_QWORD *)(v14 + 96) = v2;
  *(_QWORD *)(v14 + 104) = &off_1E55DAF98;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v14 + 72));
  v19 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF240];
  sub_1A9CDEC4C((uint64_t)v5, (uint64_t)boxed_opaque_existential_1, &qword_1EEB4A880, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF240], (uint64_t)&off_1E55DAD90, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InfographicAccessibleTextWrapper);
  *(_QWORD *)(v14 + 136) = v16;
  *(_QWORD *)(v14 + 144) = &off_1E55DAF98;
  v20 = (_QWORD *)swift_allocObject();
  *(_QWORD *)(v14 + 112) = v20;
  v21 = v23;
  v20[2] = v24;
  v20[3] = v21;
  v20[4] = 0xD000000000000030;
  v20[5] = 0x80000001A9D00850;
  sub_1A9CDECA0((uint64_t)v5, &qword_1EEB4A880, v19, (uint64_t)&off_1E55DAD90, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for InfographicAccessibleTextWrapper);
  return v14;
}

uint64_t sub_1A9CDB5C4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A9CDB5E8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CDB5F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CDB608()
{
  return swift_getOpaqueTypeConformance2();
}

_QWORD *assignWithTake for OneDayDiagram(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for OneDayDiagram()
{
  return &type metadata for OneDayDiagram;
}

ValueMetadata *type metadata accessor for OneDayChart()
{
  return &type metadata for OneDayChart;
}

uint64_t _s13SleepHealthUI11OneDayChartVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t _s13SleepHealthUI11OneDayChartVwca_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t _s13SleepHealthUI11OneDayChartVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for OneDayBarGraph()
{
  return &type metadata for OneDayBarGraph;
}

uint64_t sub_1A9CDB758()
{
  sub_1A9CD9BF8();
  sub_1A9B92B9C(&qword_1EEB4A700, (uint64_t (*)(uint64_t))sub_1A9CD9BF8, (uint64_t)&protocol conformance descriptor for OptionalContentGroup<A, B>);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CDB7B8()
{
  return sub_1A9B92B9C(&qword_1EEB4A708, (uint64_t (*)(uint64_t))sub_1A9CDB7E4, MEMORY[0x1E0CDFCC0]);
}

void sub_1A9CDB7E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A710)
  {
    sub_1A9B92F34(255, &qword_1EEB4A718, (uint64_t (*)(uint64_t))sub_1A9CDB87C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CE0648]);
    sub_1A9BCC5EC(&qword_1EEB4A740, &qword_1EEB4A718, (uint64_t (*)(uint64_t))sub_1A9CDB87C);
    v0 = sub_1A9CE7EB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A710);
  }
}

void sub_1A9CDB87C()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_1EEB4A720)
  {
    sub_1A9CDB920();
    sub_1A9BAAB64(255, &qword_1EEB4A738, (uint64_t)&type metadata for OneDayDurationGraph, MEMORY[0x1E0CD9778], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0CD9BF0]);
    sub_1A9C1B8D0();
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EEB4A720);
  }
}

void sub_1A9CDB920()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A728)
  {
    sub_1A9B92F34(255, &qword_1EEB4A730, (uint64_t (*)(uint64_t))sub_1A9CDB994, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CDF678]);
    v0 = sub_1A9CE74F4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A728);
  }
}

void sub_1A9CDB994()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB44B90)
  {
    sub_1A9BAAB64(255, (unint64_t *)&qword_1EEB43898, MEMORY[0x1E0CDDD78], MEMORY[0x1E0CDA208], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0CD9BF0]);
    v0 = sub_1A9CE7164();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB44B90);
  }
}

uint64_t sub_1A9CDBA10()
{
  return sub_1A9B92B9C(&qword_1EEB4A748, (uint64_t (*)(uint64_t))sub_1A9CDBA3C, (uint64_t)&protocol conformance descriptor for InfographicGrid<A, B>);
}

uint64_t sub_1A9CDBA3C()
{
  uint64_t result;

  result = qword_1EEB4A750;
  if (!qword_1EEB4A750)
  {
    sub_1A9BAAB64(255, &qword_1EEB4A758, (uint64_t)&type metadata for OneDayBarChart, (uint64_t)&type metadata for SleepDataUnavailable, (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0CDB880]);
    sub_1A9CDBAE0();
    sub_1A9C86AC4();
    type metadata accessor for InfographicGrid();
  }
  return result;
}

unint64_t sub_1A9CDBAE0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB4A760;
  if (!qword_1EEB4A760)
  {
    sub_1A9BAAB64(255, &qword_1EEB4A758, (uint64_t)&type metadata for OneDayBarChart, (uint64_t)&type metadata for SleepDataUnavailable, (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0CDB880]);
    v2 = v1;
    v3[0] = sub_1A9CDBB68();
    v3[1] = sub_1A9BA3D00();
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CDB8A0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A760);
  }
  return result;
}

unint64_t sub_1A9CDBB68()
{
  unint64_t result;

  result = qword_1EEB4A768;
  if (!qword_1EEB4A768)
  {
    result = MEMORY[0x1AF420284](&unk_1A9CF7AD4, &type metadata for OneDayBarChart);
    atomic_store(result, (unint64_t *)&qword_1EEB4A768);
  }
  return result;
}

uint64_t destroy for OneDayBarChart(uint64_t a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for OneDayBarChart(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  v4 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for OneDayBarChart(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for OneDayBarChart(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for OneDayBarChart()
{
  return &type metadata for OneDayBarChart;
}

_QWORD *_s13SleepHealthUI13OneDayDiagramVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for OneDayDurationGraph()
{
  return &type metadata for OneDayDurationGraph;
}

uint64_t sub_1A9CDBD70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1A9CDBD80()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_1A9CDBD90(uint64_t a1)
{
  return sub_1A9CDBDD8(a1, &qword_1EEB4A698);
}

id sub_1A9CDBDA0(uint64_t a1)
{
  return sub_1A9CDBDD8(a1, &qword_1EEB4A6A0);
}

id sub_1A9CDBDB0(uint64_t a1)
{
  return sub_1A9CDBDD8(a1, &qword_1EEB4A6A8);
}

id sub_1A9CDBDC8(uint64_t a1)
{
  return sub_1A9CDBDD8(a1, &qword_1EEB4A6B0);
}

id sub_1A9CDBDD8(uint64_t a1, _QWORD *a2)
{
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  if (result)
  {
    v4 = result;
    sub_1A9CDE824(MEMORY[0x1E0DEE9D8]);
    sub_1A9CE8868();
    v6 = v5;

    result = (id)swift_bridgeObjectRelease();
    *a2 = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A9CDBE60@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
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
  uint64_t OpaqueTypeConformance2;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  char *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t KeyPath;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t);
  uint64_t v64;
  uint64_t result;
  _QWORD v66[3];
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;

  v2 = v1;
  v66[2] = a1;
  sub_1A9BA93F0();
  v66[1] = v3;
  MEMORY[0x1E0C80A78](v3, v4);
  v81 = (char *)v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B92F34(0, &qword_1ED263168, (uint64_t (*)(uint64_t))MEMORY[0x1E0C93C30], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v66 - v8;
  v10 = sub_1A9CE6BC4();
  v70 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CDD8C4();
  v15 = v14;
  v68 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = (char *)v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CDDB14(0);
  v20 = v19;
  v71 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19, v21);
  v23 = (char *)v66 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CDDBC4(0);
  v73 = v24;
  v74 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24, v25);
  v67 = (char *)v66 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CDDCA0(0);
  v75 = v27;
  v76 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27, v28);
  v69 = (char *)v66 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CDE038(0);
  v78 = v30;
  v77 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30, v31);
  v72 = (char *)v66 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CDE26C();
  v80 = v33;
  MEMORY[0x1E0C80A78](v33, v34);
  v79 = (char *)v66 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = v2;
  sub_1A9CDD93C();
  sub_1A9B92B9C(&qword_1EEB4A7A8, (uint64_t (*)(uint64_t))sub_1A9CDD93C, MEMORY[0x1E0C93978]);
  sub_1A9CE6C24();
  sub_1A9CE6ABC();
  v36 = sub_1A9CE6CF0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v9, 1, 1, v36);
  v37 = sub_1A9B92B9C(&qword_1EEB4A7B8, (uint64_t (*)(uint64_t))sub_1A9CDD8C4, MEMORY[0x1E0C939B0]);
  v38 = MEMORY[0x1E0C93870];
  sub_1A9CE7A28();
  sub_1A9B93BDC((uint64_t)v9, &qword_1ED263168, (uint64_t (*)(uint64_t))MEMORY[0x1E0C93C30]);
  (*(void (**)(char *, uint64_t))(v70 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v18, v15);
  v84 = v15;
  v85 = v10;
  v86 = v37;
  v87 = v38;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v40 = v67;
  sub_1A9CE79F8();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v23, v20);
  v82 = v2;
  sub_1A9CDDDDC(0);
  v42 = v41;
  v84 = v20;
  v85 = OpaqueTypeConformance2;
  v43 = swift_getOpaqueTypeConformance2();
  v44 = sub_1A9B92B9C(&qword_1EEB4A800, (uint64_t (*)(uint64_t))sub_1A9CDDDDC, MEMORY[0x1E0C93BA0]);
  v45 = v69;
  v46 = v73;
  sub_1A9CE79EC();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v40, v46);
  v47 = (void *)v2[1];
  v90 = *v2;
  v88 = *((_OWORD *)v2 + 1);
  v89 = v2[4];
  v48 = swift_allocObject();
  v49 = *((_OWORD *)v2 + 1);
  *(_OWORD *)(v48 + 16) = *(_OWORD *)v2;
  *(_OWORD *)(v48 + 32) = v49;
  v50 = v2[4];
  v51 = v72;
  *(_QWORD *)(v48 + 48) = v50;
  sub_1A9C72224((uint64_t)&v90);
  v52 = v47;
  sub_1A9CDE378((uint64_t)&v88);
  sub_1A9CDE1D8(0);
  v84 = v46;
  v85 = v42;
  v86 = v43;
  v87 = v44;
  swift_getOpaqueTypeConformance2();
  sub_1A9BC2784(&qword_1EEB4A820, (uint64_t (*)(uint64_t))sub_1A9CDE1D8, sub_1A9CDE210, sub_1A9CDE250);
  v53 = v75;
  sub_1A9CE7A40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v45, v53);
  if (qword_1ED262D40 != -1)
    swift_once();
  v54 = qword_1ED262D68;
  KeyPath = swift_getKeyPath();
  v56 = v77;
  v57 = v78;
  v58 = (uint64_t)v79;
  (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v79, v51, v78);
  v59 = (uint64_t *)(v58 + *(int *)(v80 + 36));
  *v59 = KeyPath;
  v59[1] = v54;
  v60 = *(void (**)(char *, uint64_t))(v56 + 8);
  swift_retain();
  v60(v51, v57);
  v61 = *MEMORY[0x1E0CD9908];
  v62 = sub_1A9CE7110();
  v63 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CD9958];
  v64 = (uint64_t)v81;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 104))(v81, v61, v62);
  sub_1A9B92B9C(&qword_1ED263188, v63, MEMORY[0x1E0CD9990]);
  result = sub_1A9CE82A4();
  if ((result & 1) != 0)
  {
    sub_1A9CDE524();
    sub_1A9B92B9C(&qword_1ED2632F0, (uint64_t (*)(uint64_t))sub_1A9BA93F0, MEMORY[0x1E0DECD88]);
    sub_1A9CE7AF4();
    sub_1A9B97190(v64, (uint64_t (*)(_QWORD))sub_1A9BA93F0);
    return sub_1A9B97190(v58, (uint64_t (*)(_QWORD))sub_1A9CDE26C);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A9CDC578()
{
  sub_1A9CDE9BC(0, &qword_1EEB4A780, sub_1A9CDD9AC);
  sub_1A9CDDA80();
  return sub_1A9CE6C0C();
}

uint64_t sub_1A9CDC5DC(uint64_t *a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  id v5;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)a1[1];
  v7 = *a1;
  v8 = *((_OWORD *)a1 + 1);
  v9 = a1[4];
  v10 = v7;
  v3 = swift_allocObject();
  v4 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 48) = a1[4];
  swift_bridgeObjectRetain();
  sub_1A9C72224((uint64_t)&v10);
  v5 = v2;
  sub_1A9CDE378((uint64_t)&v8);
  sub_1A9B92F34(0, &qword_1EEB4A788, type metadata accessor for SleepDayModel.SegmentModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A9CE6318();
  sub_1A9CDD9AC(0);
  sub_1A9CDDA20();
  sub_1A9CE6C48();
  swift_getOpaqueTypeConformance2();
  sub_1A9B92B9C(&qword_1EEB4A848, type metadata accessor for SleepDayModel.SegmentModel, (uint64_t)&protocol conformance descriptor for SleepDayModel.SegmentModel);
  return sub_1A9CE7F44();
}

uint64_t sub_1A9CDC734@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t (*v10)(uint64_t);
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
  void (*v23)(char *, uint64_t);
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;

  v42 = a2;
  v3 = sub_1A9CE73B0();
  v40 = *(_QWORD *)(v3 - 8);
  v41 = v3;
  MEMORY[0x1E0C80A78](v3, v4);
  v39 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1A9CE62E8();
  v31 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9B95370(0, &qword_1ED263118, v10, MEMORY[0x1E0C93350], MEMORY[0x1E0C93770]);
  MEMORY[0x1E0C80A78](v11, v12);
  MEMORY[0x1E0C80A78](v13, v14);
  v16 = (char *)&v31 - v15;
  v17 = sub_1A9CE6C48();
  v37 = *(_QWORD *)(v17 - 8);
  v38 = v17;
  MEMORY[0x1E0C80A78](v17, v18);
  v32 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CDD9AC(0);
  v35 = *(_QWORD *)(v20 - 8);
  v36 = v20;
  MEMORY[0x1E0C80A78](v20, v21);
  v34 = (char *)&v31 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE73A4();
  type metadata accessor for SleepDayModel.SegmentModel(0);
  sub_1A9CE5F34();
  v33 = v16;
  sub_1A9CE6B94();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23 = *(void (**)(char *, uint64_t))(v31 + 8);
  v23(v9, v6);
  sub_1A9CE73A4();
  sub_1A9CE5F10();
  sub_1A9CE6B94();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23(v9, v6);
  v45 = *(_OWORD *)(a1 + 16);
  v46 = *(_QWORD *)(a1 + 32);
  v43 = *(_OWORD *)(a1 + 16);
  v44 = *(_QWORD *)(a1 + 32);
  sub_1A9CDE2F0(0, &qword_1EEB48300, &qword_1EEB48308, MEMORY[0x1E0DEF040], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CDF9A8]);
  sub_1A9CE7DD0();
  if (qword_1EEB42F48 != -1)
    swift_once();
  v43 = v45;
  v44 = v46;
  sub_1A9CE7DD0();
  v24 = v32;
  sub_1A9CE6C3C();
  if (qword_1EEB42F50 != -1)
    swift_once();
  v26 = v39;
  v25 = v40;
  v27 = v41;
  (*(void (**)(char *, _QWORD, uint64_t))(v40 + 104))(v39, *MEMORY[0x1E0CDB0C0], v41);
  v28 = v34;
  v29 = v38;
  sub_1A9CE6AEC();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v27);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v29);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v35 + 32))(v42, v28, v36);
}

uint64_t sub_1A9CDCBD8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v27[2];
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v27[1] = a2;
  v3 = sub_1A9CE6BAC();
  MEMORY[0x1E0C80A78](v3, v4);
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11F0];
  sub_1A9B92F34(0, &qword_1ED262DF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11F0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)v27 - v8;
  v10 = sub_1A9CE642C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1A9CE6B70();
  MEMORY[0x1E0C80A78](v15, v16);
  v17 = sub_1A9CE6B4C();
  MEMORY[0x1E0C80A78](v17, v18);
  sub_1A9CE6B40();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v14, *MEMORY[0x1E0CB1140], v10);
  v19 = sub_1A9CE6444();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v9, 1, 1, v19);
  sub_1A9CE6B58();
  sub_1A9B93BDC((uint64_t)v9, &qword_1ED262DF0, v5);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  v20 = swift_allocObject();
  v21 = *((_OWORD *)a1 + 1);
  *(_OWORD *)(v20 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v20 + 32) = v21;
  v22 = a1[4];
  *(_QWORD *)(v20 + 48) = v22;
  v23 = *a1;
  v24 = (void *)a1[1];
  v29 = v22;
  v30 = v23;
  v28 = v21;
  sub_1A9C72224((uint64_t)&v30);
  v25 = v24;
  sub_1A9CDE378((uint64_t)&v28);
  sub_1A9CE6BA0();
  sub_1A9CDDE00();
  sub_1A9CDDF78();
  return sub_1A9CE6CA8();
}

uint64_t sub_1A9CDCE50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v14;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  void (*v48)(char *, uint64_t);
  void (*v49)(char *, uint64_t);
  _QWORD v51[4];
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD v66[3];
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v58 = a1;
  v65 = a2;
  v2 = sub_1A9CE6BDC();
  MEMORY[0x1E0C80A78](v2, v3);
  v55 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1A9CE6C00();
  MEMORY[0x1E0C80A78](v5, v6);
  sub_1A9BAAB64(0, &qword_1EEB4A7E8, MEMORY[0x1E0CDDD78], MEMORY[0x1E0CDDD58], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0C93720]);
  v61 = *(_QWORD *)(v7 - 8);
  v62 = v7;
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v52 - v9;
  sub_1A9CDDE7C(0);
  v59 = v11;
  v64 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15, v16);
  v63 = (char *)&v52 - v17;
  v18 = sub_1A9CE6C78();
  MEMORY[0x1E0C80A78](v18, v19);
  v60 = sub_1A9CE6C9C();
  v57 = *(_QWORD *)(v60 - 8);
  MEMORY[0x1E0C80A78](v60, v20);
  v56 = (char *)&v52 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22, v23);
  v25 = (char *)&v52 - v24;
  v54 = sub_1A9CE6AD4();
  v26 = *(_QWORD *)(v54 - 8);
  MEMORY[0x1E0C80A78](v54, v27);
  v29 = (char *)&v52 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30, v31);
  v33 = (char *)&v52 - v32;
  if (qword_1EEB42F58 != -1)
    swift_once();
  v71 = xmmword_1EEB4A6B8;
  v72 = qword_1EEB4A6C8;
  v73 = unk_1EEB4A6D0;
  v74 = qword_1EEB4A6D8;
  swift_bridgeObjectRetain();
  v34 = v33;
  sub_1A9CE6AC8();
  if (qword_1EEB42F40 != -1)
    swift_once();
  sub_1A9CE6C60();
  v67 = xmmword_1EEB4A6B8;
  v68 = qword_1EEB4A6C8;
  v69 = unk_1EEB4A6D0;
  v70 = qword_1EEB4A6D8;
  swift_bridgeObjectRetain();
  sub_1A9CE6C90();
  v35 = sub_1A9CE6BE8();
  MEMORY[0x1E0C80A78](v35, v36);
  sub_1A9CE6BD0();
  v51[3] = MEMORY[0x1E0CDDD58];
  v51[1] = v51;
  v51[2] = MEMORY[0x1E0CDDD78];
  v51[0] = sub_1A9CDE798;
  sub_1A9CE6B7C();
  if (qword_1EEB42F38 != -1)
    swift_once();
  sub_1A9CDDF10();
  v37 = v62;
  sub_1A9CE6C54();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v10, v37);
  v39 = v63;
  v38 = v64;
  v40 = v59;
  (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v63, v14, v59);
  v53 = v26;
  v41 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v52 = v34;
  v42 = v34;
  v43 = v54;
  v41(v29, v42, v54);
  v66[0] = v29;
  v44 = v57;
  v45 = v56;
  v46 = v60;
  (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v56, v25, v60);
  v66[1] = v45;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v14, v39, v40);
  v66[2] = v14;
  sub_1A9CD9790(v66, v65);
  v47 = *(void (**)(char *, uint64_t))(v38 + 8);
  v47(v39, v40);
  v48 = *(void (**)(char *, uint64_t))(v44 + 8);
  v48(v25, v46);
  v49 = *(void (**)(char *, uint64_t))(v53 + 8);
  v49(v52, v43);
  v47(v14, v40);
  v48(v45, v46);
  return ((uint64_t (*)(char *, uint64_t))v49)(v29, v43);
}

uint64_t sub_1A9CDD3C4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  id v15;
  uint64_t v16;
  uint64_t (*v17)@<X0>(uint64_t@<X8>);
  uint64_t (*v18)@<X0>(uint64_t@<X8>);
  uint64_t v19;
  uint64_t (**v20)@<X0>(uint64_t@<X8>);
  uint64_t v21;
  uint64_t v22;
  uint64_t (**v23)(uint64_t);
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  sub_1A9CDE1F4(0);
  v7 = v6;
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a2;
  v12 = (void *)a2[1];
  v25 = *((_OWORD *)a2 + 1);
  v26 = a2[4];
  v27 = v11;
  v13 = swift_allocObject();
  v14 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v13 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 48) = a2[4];
  sub_1A9C72224((uint64_t)&v27);
  v15 = v12;
  sub_1A9CDE378((uint64_t)&v25);
  v16 = sub_1A9CE7FEC();
  v18 = v17;
  v19 = sub_1A9CE6BB8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v10, a1, v19);
  v20 = (uint64_t (**)@<X0>(uint64_t@<X8>))&v10[*(int *)(v7 + 36)];
  *v20 = sub_1A9C9ED18;
  v20[1] = 0;
  v20[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))v16;
  v20[3] = v18;
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = sub_1A9CDE6E0;
  *(_QWORD *)(v21 + 24) = v13;
  sub_1A9BA6F90((uint64_t)v10, a3, (uint64_t (*)(_QWORD))sub_1A9CDE1F4);
  sub_1A9CDE1D8(0);
  v23 = (uint64_t (**)(uint64_t))(a3 + *(int *)(v22 + 36));
  *v23 = sub_1A9C62E6C;
  v23[1] = (uint64_t (*)(uint64_t))v21;
  return sub_1A9B97190((uint64_t)v10, (uint64_t (*)(_QWORD))sub_1A9CDE1F4);
}

uint64_t sub_1A9CDD538@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t (*v4)(uint64_t, uint64_t);
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
  uint64_t result;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
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
  uint64_t (*v30)(uint64_t);
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52[2];
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1A9B92F34(0, (unint64_t *)&qword_1ED263210, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDD560], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)v52 - v7;
  sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], v4);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)v52 - v11;
  v13 = sub_1A9CE62E8();
  sub_1A9CE6CC0();
  v14 = *(_QWORD *)(v13 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v53 = a2;
    v16 = *(void **)(a1 + 8);
    v17 = (void *)sub_1A9CE6258();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v18 = objc_msgSend(v16, sel_stringFromDate_, v17);

    v19 = sub_1A9CE82E0();
    v21 = v20;

    v54 = v19;
    v55 = v21;
    sub_1A9BA8EA4();
    v22 = sub_1A9CE79C8();
    v24 = v23;
    v26 = v25;
    v28 = v27;
    if (qword_1EEB42EF8 != -1)
      swift_once();
    v29 = sub_1A9CE7800();
    v30 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CDD560];
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v8, 1, 1, v29);
    sub_1A9CE7830();
    sub_1A9B93BDC((uint64_t)v8, (unint64_t *)&qword_1ED263210, v30);
    v31 = v26 & 1;
    v32 = sub_1A9CE7998();
    v52[0] = v22;
    v52[1] = v28;
    v34 = v33;
    v36 = v35;
    v37 = v24;
    swift_release();
    v38 = sub_1A9CE79A4();
    v40 = v39;
    v42 = v41;
    sub_1A9BAA670(v32, v34, v36 & 1);
    swift_bridgeObjectRelease();
    if (qword_1EEB42F00 != -1)
      swift_once();
    v43 = v42 & 1;
    v44 = sub_1A9CE7968();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    sub_1A9BAA670(v38, v40, v43);
    swift_bridgeObjectRelease();
    sub_1A9BAA670(v52[0], v37, v31);
    result = swift_bridgeObjectRelease();
    v51 = v53;
    *v53 = v44;
    v51[1] = v46;
    *((_BYTE *)v51 + 16) = v48 & 1;
    v51[3] = v50;
  }
  return result;
}

uint64_t sub_1A9CDD88C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A9CDBE60(a1);
}

void sub_1A9CDD8C4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A770)
  {
    sub_1A9CDD93C();
    sub_1A9B92B9C(&qword_1EEB4A7A8, (uint64_t (*)(uint64_t))sub_1A9CDD93C, MEMORY[0x1E0C93978]);
    v0 = sub_1A9CE6C30();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A770);
  }
}

void sub_1A9CDD93C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A778)
  {
    sub_1A9CDE9BC(255, &qword_1EEB4A780, sub_1A9CDD9AC);
    sub_1A9CDDA80();
    v0 = sub_1A9CE6C18();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A778);
  }
}

void sub_1A9CDD9AC(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  if (!qword_1EEB4A790)
  {
    v4[0] = sub_1A9CE6C48();
    v4[1] = MEMORY[0x1E0C939E0];
    v2 = MEMORY[0x1AF420248](a1, v4, MEMORY[0x1E0C934E8], 0);
    if (!v3)
      atomic_store(v2, (unint64_t *)&qword_1EEB4A790);
  }
}

unint64_t sub_1A9CDDA20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEB4A798;
  if (!qword_1EEB4A798)
  {
    sub_1A9B92F34(255, &qword_1EEB4A788, type metadata accessor for SleepDayModel.SegmentModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1AF420284](MEMORY[0x1E0DEAF48], v1);
    atomic_store(result, (unint64_t *)&qword_1EEB4A798);
  }
  return result;
}

unint64_t sub_1A9CDDA80()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[3];

  result = qword_1EEB4A7A0;
  if (!qword_1EEB4A7A0)
  {
    sub_1A9CDE9BC(255, &qword_1EEB4A780, sub_1A9CDD9AC);
    v2 = v1;
    v3[1] = sub_1A9CE6C48();
    v3[2] = MEMORY[0x1E0C939E0];
    v3[0] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x1AF420284](MEMORY[0x1E0C93DA0], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A7A0);
  }
  return result;
}

void sub_1A9CDDB14(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[4];

  if (!qword_1EEB4A7B0)
  {
    sub_1A9CDD8C4();
    v5[0] = v2;
    v5[1] = sub_1A9CE6BC4();
    v5[2] = sub_1A9B92B9C(&qword_1EEB4A7B8, (uint64_t (*)(uint64_t))sub_1A9CDD8C4, MEMORY[0x1E0C939B0]);
    v5[3] = MEMORY[0x1E0C93870];
    v3 = MEMORY[0x1AF420248](a1, v5, MEMORY[0x1E0C93CF0], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1EEB4A7B0);
  }
}

void sub_1A9CDDBC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[4];

  if (!qword_1EEB4A7C0)
  {
    sub_1A9CDDB14(255);
    v3 = v2;
    sub_1A9CDD8C4();
    sub_1A9CE6BC4();
    v6[2] = sub_1A9B92B9C(&qword_1EEB4A7B8, (uint64_t (*)(uint64_t))sub_1A9CDD8C4, MEMORY[0x1E0C939B0]);
    v6[3] = MEMORY[0x1E0C93870];
    v6[0] = v3;
    v6[1] = swift_getOpaqueTypeConformance2();
    v4 = MEMORY[0x1AF420248](a1, v6, MEMORY[0x1E0C93C80], 0);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1EEB4A7C0);
  }
}

void sub_1A9CDDCA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  if (!qword_1EEB4A7C8)
  {
    sub_1A9CDDBC4(255);
    v3 = v2;
    sub_1A9CDDDDC(255);
    v5 = v4;
    sub_1A9CDDB14(255);
    sub_1A9CDD8C4();
    sub_1A9CE6BC4();
    sub_1A9B92B9C(&qword_1EEB4A7B8, (uint64_t (*)(uint64_t))sub_1A9CDD8C4, MEMORY[0x1E0C939B0]);
    swift_getOpaqueTypeConformance2();
    v8[0] = v3;
    v8[1] = v5;
    v8[2] = swift_getOpaqueTypeConformance2();
    v8[3] = sub_1A9B92B9C(&qword_1EEB4A800, (uint64_t (*)(uint64_t))sub_1A9CDDDDC, MEMORY[0x1E0C93BA0]);
    v6 = MEMORY[0x1AF420248](a1, v8, MEMORY[0x1E0C93C60], 0);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_1EEB4A7C8);
  }
}

void sub_1A9CDDDDC(uint64_t a1)
{
  sub_1A9C9EC8C(a1, &qword_1EEB4A7D0, (uint64_t (*)(uint64_t))sub_1A9CDDE00, (uint64_t (*)(void))sub_1A9CDDF78, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C93B80]);
}

void sub_1A9CDDE00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A7D8)
  {
    sub_1A9CE6AD4();
    sub_1A9CE6C9C();
    sub_1A9CDDE7C(255);
    v0 = sub_1A9CE6AE0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A7D8);
  }
}

void sub_1A9CDDE7C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  if (!qword_1EEB4A7E0)
  {
    sub_1A9BAAB64(255, &qword_1EEB4A7E8, MEMORY[0x1E0CDDD78], MEMORY[0x1E0CDDD58], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0C93720]);
    v5[0] = v2;
    v5[1] = sub_1A9CDDF10();
    v3 = MEMORY[0x1AF420248](a1, v5, MEMORY[0x1E0C93A60], 0);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1EEB4A7E0);
  }
}

unint64_t sub_1A9CDDF10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEB4A7F0;
  if (!qword_1EEB4A7F0)
  {
    sub_1A9BAAB64(255, &qword_1EEB4A7E8, MEMORY[0x1E0CDDD78], MEMORY[0x1E0CDDD58], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0C93720]);
    result = MEMORY[0x1AF420284](MEMORY[0x1E0C93748], v1);
    atomic_store(result, (unint64_t *)&qword_1EEB4A7F0);
  }
  return result;
}

unint64_t sub_1A9CDDF78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];
  _QWORD v5[3];

  result = qword_1EEB4A7F8;
  if (!qword_1EEB4A7F8)
  {
    sub_1A9CDDE00();
    v2 = v1;
    v5[0] = MEMORY[0x1E0C933E8];
    v5[1] = MEMORY[0x1E0C93A98];
    sub_1A9BAAB64(255, &qword_1EEB4A7E8, MEMORY[0x1E0CDDD78], MEMORY[0x1E0CDDD58], (uint64_t (*)(_QWORD, uint64_t, uint64_t))MEMORY[0x1E0C93720]);
    v4[1] = v3;
    v4[2] = sub_1A9CDDF10();
    v5[2] = swift_getOpaqueTypeConformance2();
    v4[0] = v5;
    result = MEMORY[0x1AF420284](MEMORY[0x1E0C93450], v2, v4);
    atomic_store(result, (unint64_t *)&qword_1EEB4A7F8);
  }
  return result;
}

void sub_1A9CDE038(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[4];

  if (!qword_1EEB4A808)
  {
    sub_1A9CDDCA0(255);
    v3 = v2;
    sub_1A9CDE1D8(255);
    v5 = v4;
    sub_1A9CDDBC4(255);
    sub_1A9CDDDDC(255);
    sub_1A9CDDB14(255);
    sub_1A9CDD8C4();
    sub_1A9CE6BC4();
    sub_1A9B92B9C(&qword_1EEB4A7B8, (uint64_t (*)(uint64_t))sub_1A9CDD8C4, MEMORY[0x1E0C939B0]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1A9B92B9C(&qword_1EEB4A800, (uint64_t (*)(uint64_t))sub_1A9CDDDDC, MEMORY[0x1E0C93BA0]);
    v8[0] = v3;
    v8[1] = v5;
    v8[2] = swift_getOpaqueTypeConformance2();
    v8[3] = sub_1A9BC2784(&qword_1EEB4A820, (uint64_t (*)(uint64_t))sub_1A9CDE1D8, sub_1A9CDE210, sub_1A9CDE250);
    v6 = MEMORY[0x1AF420248](a1, v8, MEMORY[0x1E0C93D60], 0);
    if (!v7)
      atomic_store(v6, (unint64_t *)&qword_1EEB4A808);
  }
}

void sub_1A9CDE1D8(uint64_t a1)
{
  sub_1A9BC2A70(a1, &qword_1EEB4A810, sub_1A9CDE1F4, (void (*)(uint64_t))sub_1A9C63B08);
}

void sub_1A9CDE1F4(uint64_t a1)
{
  sub_1A9BC2A70(a1, &qword_1EEB4A818, (void (*)(uint64_t))MEMORY[0x1E0C937B0], (void (*)(uint64_t))sub_1A9C638E4);
}

uint64_t sub_1A9CDE210()
{
  return sub_1A9BC2784(&qword_1EEB4A828, (uint64_t (*)(uint64_t))sub_1A9CDE1F4, sub_1A9CDE234, (uint64_t (*)(void))sub_1A9C9EDD4);
}

uint64_t sub_1A9CDE234()
{
  return sub_1A9B92B9C(&qword_1ED263128, (uint64_t (*)(uint64_t))MEMORY[0x1E0C937B0], MEMORY[0x1E0C937A8]);
}

uint64_t sub_1A9CDE250()
{
  return sub_1A9B92B9C(&qword_1EEB49408, (uint64_t (*)(uint64_t))sub_1A9C63B08, MEMORY[0x1E0CDC940]);
}

void sub_1A9CDE26C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A830)
  {
    sub_1A9CDE038(255);
    sub_1A9CDE2F0(255, (unint64_t *)&qword_1ED263358, &qword_1ED263360, MEMORY[0x1E0CDF5D0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CDCF68]);
    v0 = sub_1A9CE7164();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A830);
  }
}

void sub_1A9CDE2F0(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    sub_1A9B94CA0(255, a3, a4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

uint64_t sub_1A9CDE35C()
{
  return sub_1A9CDC578();
}

uint64_t sub_1A9CDE364@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A9CDCBD8(*(uint64_t **)(v1 + 16), a1);
}

uint64_t sub_1A9CDE370@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1A9CDD3C4(a1, (uint64_t *)(v2 + 16), a2);
}

uint64_t sub_1A9CDE378(uint64_t a1)
{
  swift_retain();
  return a1;
}

double sub_1A9CDE3A0()
{
  double result;
  __int128 v1;
  __int128 v2;
  uint64_t v3;

  sub_1A9CE6F84();
  result = *(double *)&v1;
  xmmword_1EEB4A6B8 = v1;
  *(_OWORD *)&qword_1EEB4A6C8 = v2;
  qword_1EEB4A6D8 = v3;
  return result;
}

unint64_t sub_1A9CDE3F8(uint64_t a1)
{
  uint64_t v2;

  sub_1A9CE8C4C();
  sub_1A9CE8C58();
  v2 = sub_1A9CE8C7C();
  return sub_1A9CDE450(a1, v2);
}

unint64_t sub_1A9CDE450(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      result = (result + 1) & v8;
      if (((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0
        && *(_QWORD *)(v7 + 8 * result) != a1)
      {
        for (result = (result + 1) & v8;
              ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
              result = (result + 1) & v8)
        {
          if (*(_QWORD *)(v7 + 8 * result) == a1)
            break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1A9CDE524()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  result = qword_1EEB4A838;
  if (!qword_1EEB4A838)
  {
    sub_1A9CDE26C();
    v2 = v1;
    sub_1A9CDDCA0(255);
    v4 = v3;
    sub_1A9CDE1D8(255);
    v6 = v5;
    sub_1A9CDDBC4(255);
    sub_1A9CDDDDC(255);
    sub_1A9CDDB14(255);
    sub_1A9CDD8C4();
    sub_1A9CE6BC4();
    sub_1A9B92B9C(&qword_1EEB4A7B8, (uint64_t (*)(uint64_t))sub_1A9CDD8C4, MEMORY[0x1E0C939B0]);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_1A9B92B9C(&qword_1EEB4A800, (uint64_t (*)(uint64_t))sub_1A9CDDDDC, MEMORY[0x1E0C93BA0]);
    v7[2] = v4;
    v7[3] = v6;
    v7[4] = swift_getOpaqueTypeConformance2();
    v7[5] = sub_1A9BC2784(&qword_1EEB4A820, (uint64_t (*)(uint64_t))sub_1A9CDE1D8, sub_1A9CDE210, sub_1A9CDE250);
    v7[0] = swift_getOpaqueTypeConformance2();
    v7[1] = sub_1A9BC2994();
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD9C20], v2, v7);
    atomic_store(result, (unint64_t *)&qword_1EEB4A838);
  }
  return result;
}

uint64_t sub_1A9CDE6E0()
{
  sub_1A9CDE2F0(0, &qword_1EEB48300, &qword_1EEB48308, MEMORY[0x1E0DEF040], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CDF9A8]);
  return sub_1A9CE7DDC();
}

uint64_t sub_1A9CDE750()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CDE778@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A9CDCE50(a1, a2);
}

uint64_t sub_1A9CDE798@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1A9CDD538(*(_QWORD *)(v1 + 16), a1);
}

void sub_1A9CDE7A0()
{
  unint64_t TupleTypeMetadata3;
  uint64_t v1;

  if (!qword_1EEB4A840)
  {
    sub_1A9CE6AD4();
    sub_1A9CE6C9C();
    sub_1A9CDDE7C(255);
    TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
    if (!v1)
      atomic_store(TupleTypeMetadata3, (unint64_t *)&qword_1EEB4A840);
  }
}

unint64_t sub_1A9CDE824(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_1A9BAF570();
    v3 = (_QWORD *)sub_1A9CE8AE4();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_1A9CDE3F8(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = 8 * result;
      *(_QWORD *)(v3[6] + v9) = v5;
      *(_QWORD *)(v3[7] + v9) = v6;
      v10 = v3[2];
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (v11)
        goto LABEL_10;
      v3[2] = v12;
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

uint64_t sub_1A9CDE8F8()
{
  uint64_t v0;

  return sub_1A9CDC5DC(*(uint64_t **)(v0 + 16));
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A9CDE938@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A9CDC734(v1 + 16, a1);
}

uint64_t sub_1A9CDE940@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1A9CDAA88(a1, *(_QWORD *)(v2 + 24), a2);
}

void sub_1A9CDE948()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A850)
  {
    sub_1A9CDE9BC(255, &qword_1EEB4A858, (void (*)(uint64_t))sub_1A9CDEA94);
    v0 = sub_1A9CE708C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A850);
  }
}

void sub_1A9CDE9BC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  uint64_t (*v5)(uint64_t);
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    sub_1A9B92F34(255, &qword_1EEB4A788, type metadata accessor for SleepDayModel.SegmentModel, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1A9CE6318();
    v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
    a3(255);
    sub_1A9CDDA20();
    sub_1A9B92B9C(&qword_1EEB484F0, v5, MEMORY[0x1E0CB09C8]);
    v6 = sub_1A9CE7F68();
    if (!v7)
      atomic_store(v6, a2);
  }
}

void sub_1A9CDEA94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A860)
  {
    sub_1A9B95370(255, &qword_1EEB4A868, (uint64_t (*)(uint64_t))sub_1A9C9DF30, MEMORY[0x1E0CD9778], (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CD9BF0]);
    sub_1A9BC2B90();
    v0 = sub_1A9CE7164();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A860);
  }
}

uint64_t sub_1A9CDEB18()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1A9CE7008();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1A9CDEB78@<X0>(uint64_t a1@<X8>)
{
  sub_1A9CE7008();
  return sub_1A9CDAC48(a1);
}

unint64_t sub_1A9CDEBC4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB4A878;
  if (!qword_1EEB4A878)
  {
    sub_1A9B95370(255, &qword_1EEB4A868, (uint64_t (*)(uint64_t))sub_1A9C9DF30, MEMORY[0x1E0CD9778], (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CD9BF0]);
    v2 = v1;
    v3[0] = sub_1A9C9E070();
    v3[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD9C20], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A878);
  }
  return result;
}

uint64_t sub_1A9CDEC4C(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t), uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;

  sub_1A9B95370(0, a3, a4, a5, a6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a2, a1, v8);
  return a2;
}

uint64_t sub_1A9CDECA0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;

  sub_1A9B95370(0, a2, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

unint64_t sub_1A9CDECDC()
{
  unint64_t result;

  result = qword_1EEB48E70;
  if (!qword_1EEB48E70)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEB48E70);
  }
  return result;
}

uint64_t sub_1A9CDED30()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A9CDED5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t result;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;

  v25 = a3;
  v26 = a1;
  v6 = sub_1A9CE6360();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE6348();
  v11 = HKSPIsRemoveSpacesForTimeFormatEnabled();
  v12 = (void *)objc_opt_self();
  v13 = (void *)sub_1A9CE82B0();
  v14 = (void *)sub_1A9CE6330();
  v15 = objc_msgSend(v12, sel_dateFormatFromTemplate_options_locale_, v13, 0, v14);

  if (v15)
  {
    v16 = sub_1A9CE82E0();
    v18 = v17;

  }
  else
  {
    v18 = 0xE200000000000000;
    v16 = 24936;
  }
  v19 = sub_1A9CAE664(v16, v18, (uint64_t)v10, v11);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v27 = a2;
  v28 = v25 & 1;
  sub_1A9B94CA0(0, &qword_1EEB48308, MEMORY[0x1E0DEF040], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
  result = sub_1A9CE7DC4();
  v21 = v29;
  v22 = v30;
  v23 = v31;
  *(_QWORD *)a4 = v26;
  *(_QWORD *)(a4 + 8) = v19;
  *(_QWORD *)(a4 + 16) = v21;
  *(_BYTE *)(a4 + 24) = v22;
  *(_QWORD *)(a4 + 32) = v23;
  return result;
}

unint64_t sub_1A9CDEF00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  result = qword_1EEB4A888;
  if (!qword_1EEB4A888)
  {
    sub_1A9B92F34(255, &qword_1EEB4A730, (uint64_t (*)(uint64_t))sub_1A9CDB994, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CDF678]);
    v2 = v1;
    v3 = sub_1A9CDEF78();
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CDF690], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A888);
  }
  return result;
}

unint64_t sub_1A9CDEF78()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB4A890;
  if (!qword_1EEB4A890)
  {
    sub_1A9CDB994();
    v2 = v1;
    v3[0] = sub_1A9BD1E9C();
    v3[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD9C20], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A890);
  }
  return result;
}

uint64_t sub_1A9CDEFE0(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if ((a12 & 1) != 0)
  {
    sub_1A9BAA680(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1A9CDF01C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if ((a12 & 1) != 0)
  {
    sub_1A9BAA670(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A9CDF058()
{
  sub_1A9CDE26C();
  sub_1A9BA93F0();
  sub_1A9CDE524();
  sub_1A9B92B9C(&qword_1ED2632F0, (uint64_t (*)(uint64_t))sub_1A9BA93F0, MEMORY[0x1E0DECD88]);
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1A9CDF0E0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EEB4A898;
  if (!qword_1EEB4A898)
  {
    sub_1A9B95370(255, &qword_1EEB4A8A0, (uint64_t (*)(uint64_t))sub_1A9CDF188, MEMORY[0x1E0CDA208], (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0CD9BF0]);
    v2 = v1;
    v3[0] = sub_1A9BC2784(&qword_1EEB4A8F0, (uint64_t (*)(uint64_t))sub_1A9CDF188, sub_1A9CDF450, sub_1A9CDF46C);
    v3[1] = MEMORY[0x1E0CDA1F0];
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CD9C20], v2, v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A898);
  }
  return result;
}

void sub_1A9CDF188(uint64_t a1)
{
  sub_1A9BC2A70(a1, &qword_1EEB4A8A8, (void (*)(uint64_t))sub_1A9CDF1A4, (void (*)(uint64_t))sub_1A9CDF260);
}

void sub_1A9CDF1A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A8B0)
  {
    sub_1A9CDF21C();
    v0 = sub_1A9CE6F54();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A8B0);
  }
}

unint64_t sub_1A9CDF21C()
{
  unint64_t result;

  result = qword_1EEB4A8B8;
  if (!qword_1EEB4A8B8)
  {
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CE0560], MEMORY[0x1E0CE0580]);
    atomic_store(result, (unint64_t *)&qword_1EEB4A8B8);
  }
  return result;
}

void sub_1A9CDF260()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A8C0)
  {
    sub_1A9CDF2D8();
    sub_1A9B92B9C(&qword_1EEB4A8E8, (uint64_t (*)(uint64_t))sub_1A9CDF2D8, MEMORY[0x1E0CD9318]);
    v0 = sub_1A9CE6FA8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A8C0);
  }
}

void sub_1A9CDF2D8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A8C8)
  {
    sub_1A9CDF350();
    sub_1A9B92B9C(&qword_1EEB4A8E0, (uint64_t (*)(uint64_t))sub_1A9CDF350, MEMORY[0x1E0CDFB10]);
    v0 = sub_1A9CE70BC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A8C8);
  }
}

void sub_1A9CDF350()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEB4A8D0)
  {
    sub_1A9CDE9BC(255, &qword_1EEB4A858, (void (*)(uint64_t))sub_1A9CDEA94);
    sub_1A9CDF3C0();
    v0 = sub_1A9CE7E3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEB4A8D0);
  }
}

unint64_t sub_1A9CDF3C0()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_1EEB4A8D8;
  if (!qword_1EEB4A8D8)
  {
    sub_1A9CDE9BC(255, &qword_1EEB4A858, (void (*)(uint64_t))sub_1A9CDEA94);
    v2 = v1;
    v3 = sub_1A9BC2784(&qword_1EEB4A870, (uint64_t (*)(uint64_t))sub_1A9CDEA94, (uint64_t (*)(void))sub_1A9CDEBC4, sub_1A9BC2D1C);
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CDFEE8], v2, &v3);
    atomic_store(result, (unint64_t *)&qword_1EEB4A8D8);
  }
  return result;
}

uint64_t sub_1A9CDF450()
{
  return sub_1A9B92B9C(&qword_1EEB4A8F8, (uint64_t (*)(uint64_t))sub_1A9CDF1A4, MEMORY[0x1E0CD8668]);
}

uint64_t sub_1A9CDF46C()
{
  return sub_1A9B92B9C(&qword_1EEB4A900, (uint64_t (*)(uint64_t))sub_1A9CDF260, MEMORY[0x1E0CD8A38]);
}

uint64_t getEnumTagSinglePayload for TimeIntervalPickerViewConfiguration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TimeIntervalPickerViewConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimeIntervalPickerViewConfiguration()
{
  return &type metadata for TimeIntervalPickerViewConfiguration;
}

uint64_t sub_1A9CDF530(double a1, double a2, uint64_t a3, char a4)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  double v10;

  if ((a4 & 1) == 0)
    return 59;
  result = Double.hoursAndMinutes.getter(a2);
  if ((v6 & 1) != 0)
    goto LABEL_15;
  v7 = 60 * result;
  if ((unsigned __int128)(result * (__int128)60) >> 64 != (60 * result) >> 63)
  {
    __break(1u);
    goto LABEL_11;
  }
  v8 = __OFADD__(v7, v5);
  v9 = v7 + v5;
  if (v8)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v10 = (double)v9;
  if ((~COERCE__INT64((double)v9) & 0x7FF0000000000000) == 0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v10 > -9.22337204e18)
  {
    if (v10 < 9.22337204e18)
      return (uint64_t)v10;
    goto LABEL_14;
  }
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1A9CDF5CC(uint64_t a1, uint64_t a2)
{
  if (*(double *)a1 == *(double *)a2
    && *(double *)(a1 + 8) == *(double *)(a2 + 8)
    && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    return (*(unsigned __int8 *)(a2 + 24) ^ *(unsigned __int8 *)(a1 + 24) ^ 1) & 1;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_1A9CDF610()
{
  double v0;
  uint64_t result;

  v0 = floor(*MEMORY[0x1E0DA8380] * 60.0 * 60.0 / 60.0);
  if ((~*(_QWORD *)&v0 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v0 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v0 < 9.22337204e18)
    return (uint64_t)v0;
LABEL_7:
  __break(1u);
  return result;
}

uint64_t storeEnumTagSinglePayload for TimeIntervalPickerViewConfiguration.IntervalCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A9CDF6FC + 4 * byte_1A9CF7B65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A9CDF730 + 4 * byte_1A9CF7B60[v4]))();
}

uint64_t sub_1A9CDF730(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9CDF738(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A9CDF740);
  return result;
}

uint64_t sub_1A9CDF74C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A9CDF754);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A9CDF758(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9CDF760(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TimeIntervalPickerViewConfiguration.IntervalCategory()
{
  return &type metadata for TimeIntervalPickerViewConfiguration.IntervalCategory;
}

unint64_t sub_1A9CDF780()
{
  unint64_t result;

  result = qword_1EEB4A908;
  if (!qword_1EEB4A908)
  {
    result = MEMORY[0x1AF420284](&unk_1A9CF7BD4, &type metadata for TimeIntervalPickerViewConfiguration.IntervalCategory);
    atomic_store(result, (unint64_t *)&qword_1EEB4A908);
  }
  return result;
}

uint64_t sub_1A9CDF7C4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t ObjCClassFromMetadata;
  id v30;
  id v31;
  void *v32;
  void (*v33)(_QWORD, _QWORD);
  char v34;
  void (*v35)(_BYTE *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v57;
  void (*v58)(_BYTE *, _BYTE *, uint64_t);
  NSObject *v59;
  os_log_type_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  void (*v65)(_BYTE *, uint64_t);
  uint64_t v66;
  os_log_t v67;
  uint64_t v68;
  void (*v69)(_BYTE *, uint64_t);
  _BYTE v70[12];
  int v71;
  os_log_t v72;
  uint64_t v73;
  void (*v74)(_BYTE *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  sub_1A9B92F34(0, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4, v5);
  v7 = &v70[-v6];
  v8 = sub_1A9CE62E8();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v8, v10);
  v13 = &v70[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x1E0C80A78](v11, v14);
  v17 = &v70[-v16];
  v19 = MEMORY[0x1E0C80A78](v15, v18);
  v21 = &v70[-v20];
  MEMORY[0x1E0C80A78](v19, v22);
  v24 = &v70[-v23];
  v25 = type metadata accessor for Alarm();
  v76 = *(_QWORD *)(v25 - 8);
  v77 = v25;
  MEMORY[0x1E0C80A78](v25, v26);
  v28 = &v70[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!a1)
  {
    if (qword_1EEB42E60 != -1)
      swift_once();
    v38 = sub_1A9CE6990();
    __swift_project_value_buffer(v38, (uint64_t)qword_1EEB49410);
    v39 = sub_1A9CE6978();
    v40 = sub_1A9CE864C();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = a2;
      v43 = swift_slowAlloc();
      v79 = v43;
      *(_DWORD *)v41 = 136446210;
      v78 = sub_1A9B91D6C(0x6D72616C41, 0xE500000000000000, &v79);
      sub_1A9CE888C();
      _os_log_impl(&dword_1A9B87000, v39, v40, "[%{public}s] ignoring nil alarm", v41, 0xCu);
      v37 = 1;
      swift_arrayDestroy();
      v44 = v43;
      a2 = v42;
      MEMORY[0x1AF420344](v44, -1, -1);
      MEMORY[0x1AF420344](v41, -1, -1);

    }
    else
    {

      v37 = 1;
    }
    goto LABEL_30;
  }
  v75 = a2;
  sub_1A9CE0B80();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v30 = a1;
  if ((objc_msgSend(v30, sel_isKindOfClass_, ObjCClassFromMetadata) & 1) == 0)
  {
    if (qword_1EEB42E60 != -1)
      swift_once();
    v45 = sub_1A9CE6990();
    __swift_project_value_buffer(v45, (uint64_t)qword_1EEB49410);
    v46 = sub_1A9CE6978();
    v47 = sub_1A9CE864C();
    if (!os_log_type_enabled(v46, v47))
      goto LABEL_27;
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v79 = v49;
    *(_DWORD *)v48 = 136446210;
    v78 = sub_1A9B91D6C(0x6D72616C41, 0xE500000000000000, &v79);
    sub_1A9CE888C();
    v50 = "[%{public}s] ignoring alarm of wrong class";
    goto LABEL_21;
  }
  if (!objc_msgSend(v30, sel_isEnabled))
  {
    if (qword_1EEB42E60 != -1)
      swift_once();
    v51 = sub_1A9CE6990();
    __swift_project_value_buffer(v51, (uint64_t)qword_1EEB49410);
    v46 = sub_1A9CE6978();
    v47 = sub_1A9CE864C();
    if (!os_log_type_enabled(v46, v47))
      goto LABEL_27;
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v79 = v49;
    *(_DWORD *)v48 = 136446210;
    v78 = sub_1A9B91D6C(0x6D72616C41, 0xE500000000000000, &v79);
    sub_1A9CE888C();
    v50 = "[%{public}s] ignoring disabled alarm";
LABEL_21:
    _os_log_impl(&dword_1A9B87000, v46, v47, v50, v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF420344](v49, -1, -1);
    MEMORY[0x1AF420344](v48, -1, -1);

    v37 = 1;
LABEL_29:
    a2 = v75;
LABEL_30:
    v36 = v77;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v76 + 56))(a2, v37, 1, v36);
  }
  v31 = objc_msgSend(v30, sel_nextFireDate);
  if (!v31)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
LABEL_23:
    sub_1A9B93BDC((uint64_t)v7, &qword_1ED2625E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870]);
    if (qword_1EEB42E60 != -1)
      swift_once();
    v52 = sub_1A9CE6990();
    __swift_project_value_buffer(v52, (uint64_t)qword_1EEB49410);
    v46 = sub_1A9CE6978();
    v53 = sub_1A9CE864C();
    if (os_log_type_enabled(v46, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = swift_slowAlloc();
      v79 = v55;
      *(_DWORD *)v54 = 136446210;
      v78 = sub_1A9B91D6C(0x6D72616C41, 0xE500000000000000, &v79);
      sub_1A9CE888C();
      _os_log_impl(&dword_1A9B87000, v46, v53, "[%{public}s] ignoring alarm with no fire date", v54, 0xCu);
      v37 = 1;
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v55, -1, -1);
      MEMORY[0x1AF420344](v54, -1, -1);

      goto LABEL_29;
    }
LABEL_27:

LABEL_28:
    v37 = 1;
    goto LABEL_29;
  }
  v32 = v31;
  sub_1A9CE62C4();

  v33 = *(void (**)(_QWORD, _QWORD))(v9 + 32);
  ((void (*)(_BYTE *, _BYTE *, uint64_t))v33)(v7, v21, v8);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    goto LABEL_23;
  v74 = (void (*)(_BYTE *, uint64_t))v33;
  ((void (*)(_BYTE *, _BYTE *, uint64_t))v33)(v24, v7, v8);
  sub_1A9CE627C();
  v34 = sub_1A9CE6270();
  v35 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v35(v21, v8);
  if ((v34 & 1) == 0)
  {
    v74 = v35;
    if (qword_1EEB42E60 != -1)
      swift_once();
    v57 = sub_1A9CE6990();
    __swift_project_value_buffer(v57, (uint64_t)qword_1EEB49410);
    v58 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 16);
    v58(v17, v24, v8);
    v58(v13, v24, v8);
    v59 = sub_1A9CE6978();
    v60 = sub_1A9CE864C();
    v61 = v60;
    if (os_log_type_enabled(v59, v60))
    {
      v62 = swift_slowAlloc();
      v73 = swift_slowAlloc();
      v79 = v73;
      *(_DWORD *)v62 = 136446722;
      v72 = v59;
      v78 = sub_1A9B91D6C(0x6D72616C41, 0xE500000000000000, &v79);
      sub_1A9CE888C();
      *(_WORD *)(v62 + 12) = 2082;
      sub_1A9CE0BBC();
      v71 = v61;
      v63 = sub_1A9CE8B74();
      v78 = sub_1A9B91D6C(v63, v64, &v79);
      sub_1A9CE888C();
      swift_bridgeObjectRelease();
      v65 = v74;
      v74(v17, v8);
      *(_WORD *)(v62 + 22) = 2050;
      sub_1A9CE6288();
      v78 = v66;
      sub_1A9CE888C();
      v65(v13, v8);
      v67 = v72;
      _os_log_impl(&dword_1A9B87000, v72, (os_log_type_t)v71, "[%{public}s] ignoring alarm with fire date: %{public}s (%{public}fs from now)", (uint8_t *)v62, 0x20u);
      v68 = v73;
      swift_arrayDestroy();
      MEMORY[0x1AF420344](v68, -1, -1);
      MEMORY[0x1AF420344](v62, -1, -1);

      v65(v24, v8);
    }
    else
    {

      v69 = v74;
      v74(v13, v8);
      v69(v17, v8);
      v69(v24, v8);
    }
    goto LABEL_28;
  }

  ((void (*)(_BYTE *, _BYTE *, uint64_t))v74)(v28, v24, v8);
  v36 = v77;
  *(_QWORD *)&v28[*(int *)(v77 + 20)] = v30;
  a2 = v75;
  sub_1A9BE9FBC((uint64_t)v28, v75);
  v37 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v76 + 56))(a2, v37, 1, v36);
}

uint64_t Alarm.fireDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1A9CE62E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id Alarm.isSleepAlarm.getter()
{
  return sub_1A9CE0254((SEL *)&selRef_isSleepAlarm);
}

uint64_t type metadata accessor for Alarm()
{
  uint64_t result;

  result = qword_1EEB4A968;
  if (!qword_1EEB4A968)
    return swift_getSingletonMetadata();
  return result;
}

id Alarm.isSnoozed.getter()
{
  return sub_1A9CE0254((SEL *)&selRef_isSnoozed);
}

id Alarm.isFiring.getter()
{
  return sub_1A9CE0254((SEL *)&selRef_isFiring);
}

id sub_1A9CE0254(SEL *a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + *(int *)(type metadata accessor for Alarm() + 20)), *a1);
}

uint64_t Alarm.isActive.getter()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for Alarm() + 20));
  if ((objc_msgSend(v1, sel_isFiring) & 1) != 0)
    return 1;
  else
    return (uint64_t)objc_msgSend(v1, sel_isSnoozed);
}

void static Alarm.statusText(for:includeTime:allowSnoozeCountdown:isShortFormat:)(uint64_t a1, char a2, char a3)
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
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;

  sub_1A9B92F34(0, (unint64_t *)&unk_1EEB45770, (uint64_t (*)(uint64_t))type metadata accessor for Alarm, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v29 - v8;
  v10 = type metadata accessor for Alarm();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CAA974(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1A9B93BDC((uint64_t)v9, (unint64_t *)&unk_1EEB45770, (uint64_t (*)(uint64_t))type metadata accessor for Alarm);
    return;
  }
  sub_1A9BE9FBC((uint64_t)v9, (uint64_t)v14);
  v15 = *(void **)&v14[*(int *)(v10 + 20)];
  if (objc_msgSend(v15, sel_isSnoozed) && (a3 & 1) != 0)
  {
    if (qword_1EEB42F60 != -1)
      swift_once();
    v16 = (void *)qword_1EEB57658;
    sub_1A9CE6288();
    v17 = objc_msgSend(v16, sel_stringFromTimeInterval_);
    if (v17)
    {
      v18 = v17;
      sub_1A9CE82E0();

LABEL_19:
      sub_1A9CAA938((uint64_t)v14);
      return;
    }
    __break(1u);
    goto LABEL_21;
  }
  if ((a2 & 1) == 0)
  {
    if (qword_1ED2626A8 != -1)
      swift_once();
    v28 = (id)qword_1ED264F90;
    sub_1A9CE6168();

    goto LABEL_18;
  }
  objc_msgSend(v15, sel_isSnoozed);
  if (qword_1ED2626A8 != -1)
    swift_once();
  v19 = (id)qword_1ED264F90;
  sub_1A9CE6168();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A9B92F34(0, (unint64_t *)&qword_1EEB452D8, (uint64_t (*)(uint64_t))sub_1A9C01B2C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1A9CEB520;
  v21 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (!v21)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v22 = v21;
  v23 = (void *)sub_1A9CE6258();
  v24 = objc_msgSend(v22, sel_formatDateAsTimeStyle_, v23);

  if (v24)
  {
    v25 = sub_1A9CE82E0();
    v27 = v26;

    *(_QWORD *)(v20 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v20 + 64) = sub_1A9BDD3E4();
    *(_QWORD *)(v20 + 32) = v25;
    *(_QWORD *)(v20 + 40) = v27;
    sub_1A9CE82EC();
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
LABEL_22:
  __break(1u);
}

id sub_1A9CE0734()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3570]), sel_init);
  objc_msgSend(v0, sel_setAllowedUnits_, 192);
  objc_msgSend(v0, sel_setUnitsStyle_, 0);
  result = objc_msgSend(v0, sel_setIncludesTimeRemainingPhrase_, 1);
  qword_1EEB57658 = (uint64_t)v0;
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Alarm(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1A9CE62E8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void destroy for Alarm(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1A9CE62E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t initializeWithCopy for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = sub_1A9CE62E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_1A9CE62E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  return a1;
}

uint64_t initializeWithTake for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1A9CE62E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for Alarm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_1A9CE62E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for Alarm()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A9CE0A0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_1A9CE62E8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for Alarm()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1A9CE0A94(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1A9CE62E8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_1A9CE0B0C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A9CE62E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1A9CE0B80()
{
  unint64_t result;

  result = qword_1EEB49A80;
  if (!qword_1EEB49A80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEB49A80);
  }
  return result;
}

unint64_t sub_1A9CE0BBC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED262A68;
  if (!qword_1ED262A68)
  {
    v1 = sub_1A9CE62E8();
    result = MEMORY[0x1AF420284](MEMORY[0x1E0CB08F0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED262A68);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id HKSHLocalizedTimeForComponents(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v35 = a5;
  v9 = a4;
  objc_msgSend(a2, "nextDateAfterDate:matchingComponents:options:", a3, a1, 512);
  v10 = objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v12, "setLocalizedDateFormatFromTemplate:", CFSTR("a"));
  v34 = (void *)v10;
  objc_msgSend(v12, "stringFromDate:", v10);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "rangeOfString:");
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0DC1138];
  v18 = *MEMORY[0x1E0DC1140];
  v39[0] = *MEMORY[0x1E0DC1138];
  v39[1] = v18;
  v40[0] = v9;
  v40[1] = v16;
  v19 = (void *)MEMORY[0x1E0C99D80];
  v20 = v16;
  v21 = v9;
  v22 = v11;
  objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc(MEMORY[0x1E0CB3498]);

  v25 = (void *)objc_msgSend(v24, "initWithString:attributes:", v22, v23);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = v35;
    v27 = v25;
  }
  else
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v25);
    v33 = v15;
    v26 = v35;
    v37[1] = v18;
    v38[0] = v35;
    v37[0] = v17;
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setAttributes:range:", v29, v13, v33);
    v30 = objc_msgSend(v22, "rangeOfString:", CFSTR(" "));
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v27, "setAttributes:range:", v29, v30, v31);

  }
  return v27;
}

void _LayoutConstants(_OWORD *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  void *v24;
  _OWORD *v25;
  id obj;
  _QWORD v27[7];
  _QWORD v28[7];
  _QWORD v29[7];
  _QWORD v30[7];
  _QWORD v31[7];
  _QWORD v32[7];
  _QWORD v33[7];
  _QWORD v34[7];
  _QWORD v35[7];
  _QWORD v36[7];
  _QWORD v37[7];
  _QWORD v38[9];

  v38[7] = *MEMORY[0x1E0C80C00];
  obj = a2;
  if (!obj)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "const LayoutConstants _LayoutConstants(CLKDevice *__strong)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("HKSHUIWatchMetrics.m"), 104, CFSTR("device cannot be nil"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_0);
  WeakRetained = objc_loadWeakRetained(&qword_1EEB571D8);
  if (!WeakRetained)
    goto LABEL_7;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained(&qword_1EEB571D8);
  if (v5 != obj)
  {

LABEL_7:
    v8 = objc_storeWeak(&qword_1EEB571D8, obj);
    qword_1EEB571E0 = objc_msgSend(obj, "version");

    objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", obj, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = &unk_1E55EA118;
    v37[1] = &unk_1E55EA130;
    v38[0] = &unk_1E55EA1C0;
    v38[1] = &unk_1E55EA1D0;
    v37[2] = &unk_1E55EA148;
    v37[3] = &unk_1E55EA160;
    v38[2] = &unk_1E55EA1E0;
    v38[3] = &unk_1E55EA1F0;
    v37[4] = &unk_1E55EA178;
    v37[5] = &unk_1E55EA190;
    v38[4] = &unk_1E55EA200;
    v38[5] = &unk_1E55EA210;
    v37[6] = &unk_1E55EA1A8;
    v38[6] = &unk_1E55EA220;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 7);
    v25 = a1;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constantValue:withOverrides:", v10, 21.0);
    qword_1EEB571E8 = v11;

    v35[0] = &unk_1E55EA118;
    v35[1] = &unk_1E55EA130;
    v36[0] = &unk_1E55EA230;
    v36[1] = &unk_1E55EA240;
    v35[2] = &unk_1E55EA148;
    v35[3] = &unk_1E55EA160;
    v36[2] = &unk_1E55EA230;
    v36[3] = &unk_1E55EA240;
    v35[4] = &unk_1E55EA178;
    v35[5] = &unk_1E55EA190;
    v35[6] = &unk_1E55EA1A8;
    v36[4] = &unk_1E55EA230;
    v36[5] = &unk_1E55EA240;
    v36[6] = &unk_1E55EA240;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constantValue:withOverrides:", v12, 19.0);
    qword_1EEB571F0 = v13;

    v33[0] = &unk_1E55EA118;
    v33[1] = &unk_1E55EA130;
    v34[0] = &unk_1E55EA250;
    v34[1] = &unk_1E55EA260;
    v33[2] = &unk_1E55EA148;
    v33[3] = &unk_1E55EA160;
    v34[2] = &unk_1E55EA270;
    v34[3] = &unk_1E55EA280;
    v33[4] = &unk_1E55EA178;
    v33[5] = &unk_1E55EA190;
    v34[4] = &unk_1E55EA290;
    v34[5] = &unk_1E55EA2A0;
    v33[6] = &unk_1E55EA1A8;
    v34[6] = &unk_1E55EA2B0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constantValue:withOverrides:", v14, 47.5);
    qword_1EEB571F8 = v15;

    v31[0] = &unk_1E55EA118;
    v31[1] = &unk_1E55EA130;
    v32[0] = &unk_1E55EA2C0;
    v32[1] = &unk_1E55EA2D0;
    v31[2] = &unk_1E55EA148;
    v31[3] = &unk_1E55EA160;
    v32[2] = &unk_1E55EA2E0;
    v32[3] = &unk_1E55EA2F0;
    v31[4] = &unk_1E55EA178;
    v31[5] = &unk_1E55EA190;
    v32[4] = &unk_1E55EA300;
    v32[5] = &unk_1E55EA2F0;
    v31[6] = &unk_1E55EA1A8;
    v32[6] = &unk_1E55EA310;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constantValue:withOverrides:", v16, 177.0);
    qword_1EEB57200 = v17;

    v29[0] = &unk_1E55EA118;
    v29[1] = &unk_1E55EA130;
    v30[0] = &unk_1E55EA320;
    v30[1] = &unk_1E55EA330;
    v29[2] = &unk_1E55EA148;
    v29[3] = &unk_1E55EA160;
    v30[2] = &unk_1E55EA340;
    v30[3] = &unk_1E55EA350;
    v29[4] = &unk_1E55EA178;
    v29[5] = &unk_1E55EA190;
    v30[4] = &unk_1E55EA360;
    v30[5] = &unk_1E55EA370;
    v29[6] = &unk_1E55EA1A8;
    v30[6] = &unk_1E55EA380;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constantValue:withOverrides:", v18, 143.0);
    qword_1EEB57208 = v19;

    v27[0] = &unk_1E55EA118;
    v27[1] = &unk_1E55EA130;
    v28[0] = &unk_1E55EA390;
    v28[1] = &unk_1E55EA3A0;
    v27[2] = &unk_1E55EA148;
    v27[3] = &unk_1E55EA160;
    v28[2] = &unk_1E55EA3B0;
    v28[3] = &unk_1E55EA3C0;
    v27[4] = &unk_1E55EA178;
    v27[5] = &unk_1E55EA190;
    v28[4] = &unk_1E55EA3B0;
    v28[5] = &unk_1E55EA3D0;
    v27[6] = &unk_1E55EA1A8;
    v28[6] = &unk_1E55EA3C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constantValue:withOverrides:", v20, 30.0);
    qword_1EEB57210 = v21;

    a1 = v25;
    goto LABEL_8;
  }
  v6 = objc_msgSend(obj, "version");
  v7 = qword_1EEB571E0;

  if (v6 != v7)
    goto LABEL_7;
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_0);
  v22 = *(_OWORD *)&qword_1EEB571F8;
  *a1 = *(_OWORD *)&qword_1EEB571E8;
  a1[1] = v22;
  a1[2] = *(_OWORD *)&qword_1EEB57208;

}

id HKSHUICurrentDevice()
{
  if (qword_1EEB57238 != -1)
    dispatch_once(&qword_1EEB57238, &__block_literal_global_1);
  return (id)_MergedGlobals_2;
}

uint64_t HKSHUIBundle()
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

id HKSHUILocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E55DF628, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t sub_1A9CE5E80()
{
  return MEMORY[0x1E0CADF90]();
}

uint64_t sub_1A9CE5E8C()
{
  return MEMORY[0x1E0CADFE0]();
}

uint64_t sub_1A9CE5E98()
{
  return MEMORY[0x1E0CAE250]();
}

uint64_t sub_1A9CE5EA4()
{
  return MEMORY[0x1E0DCC750]();
}

uint64_t sub_1A9CE5EB0()
{
  return MEMORY[0x1E0DCC758]();
}

uint64_t sub_1A9CE5EBC()
{
  return MEMORY[0x1E0CAE390]();
}

uint64_t sub_1A9CE5EC8()
{
  return MEMORY[0x1E0CAE3B8]();
}

uint64_t sub_1A9CE5ED4()
{
  return MEMORY[0x1E0CAE490]();
}

uint64_t sub_1A9CE5EE0()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1A9CE5EEC()
{
  return MEMORY[0x1E0CAE568]();
}

uint64_t sub_1A9CE5EF8()
{
  return MEMORY[0x1E0CAE570]();
}

uint64_t sub_1A9CE5F04()
{
  return MEMORY[0x1E0CAE578]();
}

uint64_t sub_1A9CE5F10()
{
  return MEMORY[0x1E0CAE580]();
}

uint64_t sub_1A9CE5F1C()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1A9CE5F28()
{
  return MEMORY[0x1E0CAE598]();
}

uint64_t sub_1A9CE5F34()
{
  return MEMORY[0x1E0CAE5A0]();
}

uint64_t sub_1A9CE5F40()
{
  return MEMORY[0x1E0CAE5B0]();
}

uint64_t sub_1A9CE5F4C()
{
  return MEMORY[0x1E0CAE5C0]();
}

uint64_t sub_1A9CE5F58()
{
  return MEMORY[0x1E0CAE5C8]();
}

uint64_t sub_1A9CE5F64()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1A9CE5F70()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1A9CE5F7C()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1A9CE5F88()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1A9CE5F94()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1A9CE5FA0()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_1A9CE5FAC()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_1A9CE5FB8()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1A9CE5FC4()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_1A9CE5FD0()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1A9CE5FDC()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1A9CE5FE8()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1A9CE5FF4()
{
  return MEMORY[0x1E0CAE800]();
}

uint64_t sub_1A9CE6000()
{
  return MEMORY[0x1E0CAE808]();
}

uint64_t sub_1A9CE600C()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1A9CE6018()
{
  return MEMORY[0x1E0CAE9A0]();
}

uint64_t sub_1A9CE6024()
{
  return MEMORY[0x1E0CAE9B8]();
}

uint64_t sub_1A9CE6030()
{
  return MEMORY[0x1E0CAE9C8]();
}

uint64_t sub_1A9CE603C()
{
  return MEMORY[0x1E0CAE9F0]();
}

uint64_t sub_1A9CE6048()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_1A9CE6054()
{
  return MEMORY[0x1E0CAEA00]();
}

uint64_t sub_1A9CE6060()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_1A9CE606C()
{
  return MEMORY[0x1E0CAEA20]();
}

uint64_t sub_1A9CE6078()
{
  return MEMORY[0x1E0CAEA30]();
}

uint64_t sub_1A9CE6084()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1A9CE6090()
{
  return MEMORY[0x1E0CAEA40]();
}

uint64_t sub_1A9CE609C()
{
  return MEMORY[0x1E0CAEA50]();
}

uint64_t sub_1A9CE60A8()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1A9CE60B4()
{
  return MEMORY[0x1E0CAEA98]();
}

uint64_t sub_1A9CE60C0()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1A9CE60CC()
{
  return MEMORY[0x1E0CAEEE0]();
}

uint64_t sub_1A9CE60D8()
{
  return MEMORY[0x1E0CAEF10]();
}

uint64_t sub_1A9CE60E4()
{
  return MEMORY[0x1E0CAEF60]();
}

uint64_t sub_1A9CE60F0()
{
  return MEMORY[0x1E0CAEF80]();
}

uint64_t sub_1A9CE60FC()
{
  return MEMORY[0x1E0CAF030]();
}

uint64_t sub_1A9CE6108()
{
  return MEMORY[0x1E0CAF060]();
}

uint64_t sub_1A9CE6114()
{
  return MEMORY[0x1E0CAF070]();
}

uint64_t sub_1A9CE6120()
{
  return MEMORY[0x1E0CAF078]();
}

uint64_t sub_1A9CE612C()
{
  return MEMORY[0x1E0CAF1B0]();
}

uint64_t sub_1A9CE6138()
{
  return MEMORY[0x1E0D2F308]();
}

uint64_t sub_1A9CE6144()
{
  return MEMORY[0x1E0CAF1F0]();
}

uint64_t sub_1A9CE6150()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_1A9CE615C()
{
  return MEMORY[0x1E0CAF2B8]();
}

uint64_t sub_1A9CE6168()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1A9CE6174()
{
  return MEMORY[0x1E0CAF588]();
}

uint64_t sub_1A9CE6180()
{
  return MEMORY[0x1E0CAF8D8]();
}

uint64_t sub_1A9CE618C()
{
  return MEMORY[0x1E0CAF8E8]();
}

uint64_t sub_1A9CE6198()
{
  return MEMORY[0x1E0CAF8F8]();
}

uint64_t sub_1A9CE61A4()
{
  return MEMORY[0x1E0CAF900]();
}

uint64_t sub_1A9CE61B0()
{
  return MEMORY[0x1E0CAF920]();
}

uint64_t sub_1A9CE61BC()
{
  return MEMORY[0x1E0CAF930]();
}

uint64_t sub_1A9CE61C8()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1A9CE61D4()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1A9CE61E0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1A9CE61EC()
{
  return MEMORY[0x1E0CAFA58]();
}

uint64_t sub_1A9CE61F8()
{
  return MEMORY[0x1E0CAFD38]();
}

uint64_t sub_1A9CE6204()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1A9CE6210()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1A9CE621C()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1A9CE6228()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1A9CE6234()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A9CE6240()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1A9CE624C()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1A9CE6258()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1A9CE6264()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1A9CE6270()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1A9CE627C()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1A9CE6288()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1A9CE6294()
{
  return MEMORY[0x1E0CB0718]();
}

uint64_t sub_1A9CE62A0()
{
  return MEMORY[0x1E0CB0738]();
}

uint64_t sub_1A9CE62AC()
{
  return MEMORY[0x1E0CB07A8]();
}

uint64_t sub_1A9CE62B8()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1A9CE62C4()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1A9CE62D0()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1A9CE62DC()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1A9CE62E8()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A9CE62F4()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1A9CE6300()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1A9CE630C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1A9CE6318()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A9CE6324()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1A9CE6330()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1A9CE633C()
{
  return MEMORY[0x1E0CB0C30]();
}

uint64_t sub_1A9CE6348()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1A9CE6354()
{
  return MEMORY[0x1E0D2F310]();
}

uint64_t sub_1A9CE6360()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1A9CE636C()
{
  return MEMORY[0x1E0CB0EA8]();
}

uint64_t sub_1A9CE6378()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1A9CE6384()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1A9CE6390()
{
  return MEMORY[0x1E0CB0F28]();
}

uint64_t sub_1A9CE639C()
{
  return MEMORY[0x1E0CB0F80]();
}

uint64_t sub_1A9CE63A8()
{
  return MEMORY[0x1E0CB0FB0]();
}

uint64_t sub_1A9CE63B4()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1A9CE63C0()
{
  return MEMORY[0x1E0CB0FF8]();
}

uint64_t sub_1A9CE63CC()
{
  return MEMORY[0x1E0CB1028]();
}

uint64_t sub_1A9CE63D8()
{
  return MEMORY[0x1E0CB1050]();
}

uint64_t sub_1A9CE63E4()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1A9CE63F0()
{
  return MEMORY[0x1E0CB1068]();
}

uint64_t sub_1A9CE63FC()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1A9CE6408()
{
  return MEMORY[0x1E0CB10A8]();
}

uint64_t sub_1A9CE6414()
{
  return MEMORY[0x1E0CB10B8]();
}

uint64_t sub_1A9CE6420()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1A9CE642C()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1A9CE6438()
{
  return MEMORY[0x1E0CB11E0]();
}

uint64_t sub_1A9CE6444()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1A9CE6450()
{
  return MEMORY[0x1E0CB12C0]();
}

uint64_t sub_1A9CE645C()
{
  return MEMORY[0x1E0CB12C8]();
}

uint64_t sub_1A9CE6468()
{
  return MEMORY[0x1E0CB12D0]();
}

uint64_t sub_1A9CE6474()
{
  return MEMORY[0x1E0CB12D8]();
}

uint64_t sub_1A9CE6480()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_1A9CE648C()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_1A9CE6498()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1A9CE64A4()
{
  return MEMORY[0x1E0CB15E0]();
}

uint64_t sub_1A9CE64B0()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1A9CE64BC()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1A9CE64C8()
{
  return MEMORY[0x1E0DC1A38]();
}

uint64_t sub_1A9CE64D4()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_1A9CE64E0()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1A9CE64EC()
{
  return MEMORY[0x1E0CEE5D0]();
}

uint64_t sub_1A9CE64F8()
{
  return MEMORY[0x1E0CEE5E0]();
}

uint64_t sub_1A9CE6504()
{
  return MEMORY[0x1E0CEE608]();
}

uint64_t sub_1A9CE6510()
{
  return MEMORY[0x1E0CEE668]();
}

uint64_t sub_1A9CE651C()
{
  return MEMORY[0x1E0CEE6B0]();
}

uint64_t sub_1A9CE6528()
{
  return MEMORY[0x1E0CEE6B8]();
}

uint64_t sub_1A9CE6534()
{
  return MEMORY[0x1E0CEE6C8]();
}

uint64_t sub_1A9CE6540()
{
  return MEMORY[0x1E0CEE6F0]();
}

uint64_t sub_1A9CE654C()
{
  return MEMORY[0x1E0CEE708]();
}

uint64_t sub_1A9CE6558()
{
  return MEMORY[0x1E0CEE720]();
}

uint64_t sub_1A9CE6564()
{
  return MEMORY[0x1E0CEE728]();
}

uint64_t sub_1A9CE6570()
{
  return MEMORY[0x1E0CEE8C8]();
}

uint64_t sub_1A9CE657C()
{
  return MEMORY[0x1E0CEE8D0]();
}

uint64_t sub_1A9CE6588()
{
  return MEMORY[0x1E0CEE8E0]();
}

uint64_t sub_1A9CE6594()
{
  return MEMORY[0x1E0CEE960]();
}

uint64_t sub_1A9CE65A0()
{
  return MEMORY[0x1E0CEE9B0]();
}

uint64_t sub_1A9CE65AC()
{
  return MEMORY[0x1E0CEE9B8]();
}

uint64_t sub_1A9CE65B8()
{
  return MEMORY[0x1E0DCC7A8]();
}

uint64_t sub_1A9CE65C4()
{
  return MEMORY[0x1E0CEEA90]();
}

uint64_t sub_1A9CE65D0()
{
  return MEMORY[0x1E0CEEB98]();
}

uint64_t sub_1A9CE65DC()
{
  return MEMORY[0x1E0CEF2B0]();
}

uint64_t sub_1A9CE65E8()
{
  return MEMORY[0x1E0CEF2B8]();
}

uint64_t sub_1A9CE65F4()
{
  return MEMORY[0x1E0CEF2C0]();
}

uint64_t sub_1A9CE6600()
{
  return MEMORY[0x1E0CEF2C8]();
}

uint64_t sub_1A9CE660C()
{
  return MEMORY[0x1E0CEF4F8]();
}

uint64_t sub_1A9CE6618()
{
  return MEMORY[0x1E0CEF518]();
}

uint64_t sub_1A9CE6624()
{
  return MEMORY[0x1E0DC8C78]();
}

uint64_t sub_1A9CE6630()
{
  return MEMORY[0x1E0DC8CA0]();
}

uint64_t sub_1A9CE663C()
{
  return MEMORY[0x1E0DC9238]();
}

uint64_t sub_1A9CE6648()
{
  return MEMORY[0x1E0DC9268]();
}

uint64_t sub_1A9CE6654()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_1A9CE6660()
{
  return MEMORY[0x1E0CB1720]();
}

uint64_t sub_1A9CE666C()
{
  return MEMORY[0x1E0CB1728]();
}

uint64_t sub_1A9CE6678()
{
  return MEMORY[0x1E0CB1738]();
}

uint64_t sub_1A9CE6684()
{
  return MEMORY[0x1E0D28F28]();
}

uint64_t sub_1A9CE6690()
{
  return MEMORY[0x1E0D28F38]();
}

uint64_t sub_1A9CE669C()
{
  return MEMORY[0x1E0D28F48]();
}

uint64_t sub_1A9CE66A8()
{
  return MEMORY[0x1E0D28F50]();
}

uint64_t sub_1A9CE66B4()
{
  return MEMORY[0x1E0D28F58]();
}

uint64_t sub_1A9CE66C0()
{
  return MEMORY[0x1E0D29198]();
}

uint64_t sub_1A9CE66CC()
{
  return MEMORY[0x1E0D291A0]();
}

uint64_t sub_1A9CE66D8()
{
  return MEMORY[0x1E0D291A8]();
}

uint64_t sub_1A9CE66E4()
{
  return MEMORY[0x1E0D291B0]();
}

uint64_t sub_1A9CE66F0()
{
  return MEMORY[0x1E0D515E0]();
}

uint64_t sub_1A9CE66FC()
{
  return MEMORY[0x1E0D515E8]();
}

uint64_t sub_1A9CE6708()
{
  return MEMORY[0x1E0D515F0]();
}

uint64_t sub_1A9CE6714()
{
  return MEMORY[0x1E0D2DFE0]();
}

uint64_t sub_1A9CE6720()
{
  return MEMORY[0x1E0D2DFF0]();
}

uint64_t sub_1A9CE672C()
{
  return MEMORY[0x1E0D29DA0]();
}

uint64_t sub_1A9CE6738()
{
  return MEMORY[0x1E0D2A068]();
}

uint64_t sub_1A9CE6744()
{
  return MEMORY[0x1E0D28AE8]();
}

uint64_t sub_1A9CE6750()
{
  return MEMORY[0x1E0D28D60]();
}

uint64_t sub_1A9CE675C()
{
  return MEMORY[0x1E0D2A9A8]();
}

uint64_t sub_1A9CE6768()
{
  return MEMORY[0x1E0D2A9F0]();
}

uint64_t sub_1A9CE6774()
{
  return MEMORY[0x1E0D2AA08]();
}

uint64_t sub_1A9CE6780()
{
  return MEMORY[0x1E0D2AA10]();
}

uint64_t sub_1A9CE678C()
{
  return MEMORY[0x1E0D2AA18]();
}

uint64_t sub_1A9CE6798()
{
  return MEMORY[0x1E0D2AA20]();
}

uint64_t sub_1A9CE67A4()
{
  return MEMORY[0x1E0D2AD78]();
}

uint64_t sub_1A9CE67B0()
{
  return MEMORY[0x1E0D2AD88]();
}

uint64_t sub_1A9CE67BC()
{
  return MEMORY[0x1E0D2AD90]();
}

uint64_t sub_1A9CE67C8()
{
  return MEMORY[0x1E0D2AF90]();
}

uint64_t sub_1A9CE67D4()
{
  return MEMORY[0x1E0D2AFC8]();
}

uint64_t sub_1A9CE67E0()
{
  return MEMORY[0x1E0D2AFD8]();
}

uint64_t sub_1A9CE67EC()
{
  return MEMORY[0x1E0D2AFE0]();
}

uint64_t sub_1A9CE67F8()
{
  return MEMORY[0x1E0D2AFE8]();
}

uint64_t sub_1A9CE6804()
{
  return MEMORY[0x1E0D2AFF0]();
}

uint64_t sub_1A9CE6810()
{
  return MEMORY[0x1E0D2AFF8]();
}

uint64_t sub_1A9CE681C()
{
  return MEMORY[0x1E0D2B060]();
}

uint64_t sub_1A9CE6828()
{
  return MEMORY[0x1E0D2B068]();
}

uint64_t sub_1A9CE6834()
{
  return MEMORY[0x1E0D2B080]();
}

uint64_t sub_1A9CE6840()
{
  return MEMORY[0x1E0D2B090]();
}

uint64_t sub_1A9CE684C()
{
  return MEMORY[0x1E0D2B0F0]();
}

uint64_t sub_1A9CE6858()
{
  return MEMORY[0x1E0D2B0F8]();
}

uint64_t sub_1A9CE6864()
{
  return MEMORY[0x1E0D2B100]();
}

uint64_t sub_1A9CE6870()
{
  return MEMORY[0x1E0D2B110]();
}

uint64_t sub_1A9CE687C()
{
  return MEMORY[0x1E0D2B138]();
}

uint64_t sub_1A9CE6888()
{
  return MEMORY[0x1E0D2B140]();
}

uint64_t sub_1A9CE6894()
{
  return MEMORY[0x1E0D2B160]();
}

uint64_t sub_1A9CE68A0()
{
  return MEMORY[0x1E0D2B178]();
}

uint64_t sub_1A9CE68AC()
{
  return MEMORY[0x1E0D2B348]();
}

uint64_t sub_1A9CE68B8()
{
  return MEMORY[0x1E0D2B350]();
}

uint64_t sub_1A9CE68C4()
{
  return MEMORY[0x1E0D2B418]();
}

uint64_t sub_1A9CE68D0()
{
  return MEMORY[0x1E0D2B530]();
}

uint64_t sub_1A9CE68DC()
{
  return MEMORY[0x1E0D2B840]();
}

uint64_t sub_1A9CE68E8()
{
  return MEMORY[0x1E0D2B8D0]();
}

uint64_t sub_1A9CE68F4()
{
  return MEMORY[0x1E0D2B8F8]();
}

uint64_t sub_1A9CE6900()
{
  return MEMORY[0x1E0D2B948]();
}

uint64_t sub_1A9CE690C()
{
  return MEMORY[0x1E0D2B958]();
}

uint64_t sub_1A9CE6918()
{
  return MEMORY[0x1E0D2B960]();
}

uint64_t sub_1A9CE6924()
{
  return MEMORY[0x1E0D2B968]();
}

uint64_t sub_1A9CE6930()
{
  return MEMORY[0x1E0D2BD30]();
}

uint64_t sub_1A9CE693C()
{
  return MEMORY[0x1E0D2BD50]();
}

uint64_t sub_1A9CE6948()
{
  return MEMORY[0x1E0D2BDB0]();
}

uint64_t sub_1A9CE6954()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1A9CE6960()
{
  return MEMORY[0x1E0DF2158]();
}

uint64_t sub_1A9CE696C()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1A9CE6978()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A9CE6984()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1A9CE6990()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A9CE699C()
{
  return MEMORY[0x1E0DC1F58]();
}

uint64_t sub_1A9CE69A8()
{
  return MEMORY[0x1E0DC1F98]();
}

uint64_t sub_1A9CE69B4()
{
  return MEMORY[0x1E0DC2130]();
}

uint64_t sub_1A9CE69C0()
{
  return MEMORY[0x1E0DC2168]();
}

uint64_t sub_1A9CE69CC()
{
  return MEMORY[0x1E0DC21B0]();
}

uint64_t sub_1A9CE69D8()
{
  return MEMORY[0x1E0DC2220]();
}

uint64_t sub_1A9CE69E4()
{
  return MEMORY[0x1E0DC22E0]();
}

uint64_t sub_1A9CE69F0()
{
  return MEMORY[0x1E0DC2360]();
}

uint64_t sub_1A9CE69FC()
{
  return MEMORY[0x1E0DC2390]();
}

uint64_t sub_1A9CE6A08()
{
  return MEMORY[0x1E0DC23A0]();
}

uint64_t sub_1A9CE6A14()
{
  return MEMORY[0x1E0DC23E0]();
}

uint64_t sub_1A9CE6A20()
{
  return MEMORY[0x1E0DC2430]();
}

uint64_t sub_1A9CE6A2C()
{
  return MEMORY[0x1E0DC2460]();
}

uint64_t sub_1A9CE6A38()
{
  return MEMORY[0x1E0DC2490]();
}

uint64_t sub_1A9CE6A44()
{
  return MEMORY[0x1E0DC24B8]();
}

uint64_t sub_1A9CE6A50()
{
  return MEMORY[0x1E0DC24D0]();
}

uint64_t sub_1A9CE6A5C()
{
  return MEMORY[0x1E0DC24D8]();
}

uint64_t sub_1A9CE6A68()
{
  return MEMORY[0x1E0DC2598]();
}

uint64_t sub_1A9CE6A74()
{
  return MEMORY[0x1E0DC25A8]();
}

uint64_t sub_1A9CE6A80()
{
  return MEMORY[0x1E0DC25B0]();
}

uint64_t sub_1A9CE6A8C()
{
  return MEMORY[0x1E0DC25B8]();
}

uint64_t sub_1A9CE6A98()
{
  return MEMORY[0x1E0DC25C8]();
}

uint64_t sub_1A9CE6AA4()
{
  return MEMORY[0x1E0DC25E0]();
}

uint64_t sub_1A9CE6AB0()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1A9CE6ABC()
{
  return MEMORY[0x1E0C933C8]();
}

uint64_t sub_1A9CE6AC8()
{
  return MEMORY[0x1E0C933D8]();
}

uint64_t sub_1A9CE6AD4()
{
  return MEMORY[0x1E0C933F0]();
}

uint64_t sub_1A9CE6AE0()
{
  return MEMORY[0x1E0C93428]();
}

uint64_t sub_1A9CE6AEC()
{
  return MEMORY[0x1E0C934E0]();
}

uint64_t sub_1A9CE6AF8()
{
  return MEMORY[0x1E0C934F0]();
}

uint64_t sub_1A9CE6B04()
{
  return MEMORY[0x1E0C93550]();
}

uint64_t sub_1A9CE6B10()
{
  return MEMORY[0x1E0C93580]();
}

uint64_t sub_1A9CE6B1C()
{
  return MEMORY[0x1E0C93600]();
}

uint64_t sub_1A9CE6B28()
{
  return MEMORY[0x1E0C93678]();
}

uint64_t sub_1A9CE6B34()
{
  return MEMORY[0x1E0C93690]();
}

uint64_t sub_1A9CE6B40()
{
  return MEMORY[0x1E0C936B8]();
}

uint64_t sub_1A9CE6B4C()
{
  return MEMORY[0x1E0C936D0]();
}

uint64_t sub_1A9CE6B58()
{
  return MEMORY[0x1E0C936E0]();
}

uint64_t sub_1A9CE6B64()
{
  return MEMORY[0x1E0C936F0]();
}

uint64_t sub_1A9CE6B70()
{
  return MEMORY[0x1E0C936F8]();
}

uint64_t sub_1A9CE6B7C()
{
  return MEMORY[0x1E0C93710]();
}

uint64_t sub_1A9CE6B88()
{
  return MEMORY[0x1E0C93720]();
}

uint64_t sub_1A9CE6B94()
{
  return MEMORY[0x1E0C93758]();
}

uint64_t sub_1A9CE6BA0()
{
  return MEMORY[0x1E0C93790]();
}

uint64_t sub_1A9CE6BAC()
{
  return MEMORY[0x1E0C93798]();
}

uint64_t sub_1A9CE6BB8()
{
  return MEMORY[0x1E0C937B0]();
}

uint64_t sub_1A9CE6BC4()
{
  return MEMORY[0x1E0C93878]();
}

uint64_t sub_1A9CE6BD0()
{
  return MEMORY[0x1E0C938D0]();
}

uint64_t sub_1A9CE6BDC()
{
  return MEMORY[0x1E0C938E0]();
}

uint64_t sub_1A9CE6BE8()
{
  return MEMORY[0x1E0C93928]();
}

uint64_t sub_1A9CE6BF4()
{
  return MEMORY[0x1E0C93930]();
}

uint64_t sub_1A9CE6C00()
{
  return MEMORY[0x1E0C93938]();
}

uint64_t sub_1A9CE6C0C()
{
  return MEMORY[0x1E0C93950]();
}

uint64_t sub_1A9CE6C18()
{
  return MEMORY[0x1E0C93958]();
}

uint64_t sub_1A9CE6C24()
{
  return MEMORY[0x1E0C93988]();
}

uint64_t sub_1A9CE6C30()
{
  return MEMORY[0x1E0C93990]();
}

uint64_t sub_1A9CE6C3C()
{
  return MEMORY[0x1E0C939D0]();
}

uint64_t sub_1A9CE6C48()
{
  return MEMORY[0x1E0C939F0]();
}

uint64_t sub_1A9CE6C54()
{
  return MEMORY[0x1E0C93A58]();
}

uint64_t sub_1A9CE6C60()
{
  return MEMORY[0x1E0C93A68]();
}

uint64_t sub_1A9CE6C6C()
{
  return MEMORY[0x1E0C93A70]();
}

uint64_t sub_1A9CE6C78()
{
  return MEMORY[0x1E0C93A78]();
}

uint64_t sub_1A9CE6C84()
{
  return MEMORY[0x1E0C93A80]();
}

uint64_t sub_1A9CE6C90()
{
  return MEMORY[0x1E0C93A90]();
}

uint64_t sub_1A9CE6C9C()
{
  return MEMORY[0x1E0C93AA8]();
}

uint64_t sub_1A9CE6CA8()
{
  return MEMORY[0x1E0C93B58]();
}

uint64_t sub_1A9CE6CB4()
{
  return MEMORY[0x1E0C93B80]();
}

uint64_t sub_1A9CE6CC0()
{
  return MEMORY[0x1E0C93BB0]();
}

uint64_t sub_1A9CE6CCC()
{
  return MEMORY[0x1E0C93BB8]();
}

uint64_t sub_1A9CE6CD8()
{
  return MEMORY[0x1E0C93BD0]();
}

uint64_t sub_1A9CE6CE4()
{
  return MEMORY[0x1E0C93BE0]();
}

uint64_t sub_1A9CE6CF0()
{
  return MEMORY[0x1E0C93C30]();
}

uint64_t sub_1A9CE6CFC()
{
  return MEMORY[0x1E0C95750]();
}

uint64_t sub_1A9CE6D08()
{
  return MEMORY[0x1E0C95758]();
}

uint64_t sub_1A9CE6D14()
{
  return MEMORY[0x1E0C95940]();
}

uint64_t sub_1A9CE6D20()
{
  return MEMORY[0x1E0C95978]();
}

uint64_t sub_1A9CE6D2C()
{
  return MEMORY[0x1E0C95A48]();
}

uint64_t sub_1A9CE6D38()
{
  return MEMORY[0x1E0C95A58]();
}

uint64_t sub_1A9CE6D44()
{
  return MEMORY[0x1E0C95C60]();
}

uint64_t sub_1A9CE6D50()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t sub_1A9CE6D5C()
{
  return MEMORY[0x1E0C95D08]();
}

uint64_t sub_1A9CE6D68()
{
  return MEMORY[0x1E0C95D78]();
}

uint64_t sub_1A9CE6D74()
{
  return MEMORY[0x1E0C95DD8]();
}

uint64_t sub_1A9CE6D80()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1A9CE6D8C()
{
  return MEMORY[0x1E0CD8238]();
}

uint64_t sub_1A9CE6D98()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1A9CE6DA4()
{
  return MEMORY[0x1E0C95F08]();
}

uint64_t sub_1A9CE6DB0()
{
  return MEMORY[0x1E0C95F20]();
}

uint64_t sub_1A9CE6DBC()
{
  return MEMORY[0x1E0C95F28]();
}

uint64_t sub_1A9CE6DC8()
{
  return MEMORY[0x1E0C95F60]();
}

uint64_t sub_1A9CE6DD4()
{
  return MEMORY[0x1E0C95F70]();
}

uint64_t sub_1A9CE6DE0()
{
  return MEMORY[0x1E0C95F78]();
}

uint64_t sub_1A9CE6DEC()
{
  return MEMORY[0x1E0C95F88]();
}

uint64_t sub_1A9CE6DF8()
{
  return MEMORY[0x1E0C95FA8]();
}

uint64_t sub_1A9CE6E04()
{
  return MEMORY[0x1E0C95FC0]();
}

uint64_t sub_1A9CE6E10()
{
  return MEMORY[0x1E0C96018]();
}

uint64_t sub_1A9CE6E1C()
{
  return MEMORY[0x1E0C96030]();
}

uint64_t sub_1A9CE6E28()
{
  return MEMORY[0x1E0C96128]();
}

uint64_t sub_1A9CE6E34()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1A9CE6E40()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1A9CE6E4C()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1A9CE6E58()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1A9CE6E64()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1A9CE6E70()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1A9CE6E7C()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1A9CE6E88()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1A9CE6E94()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1A9CE6EA0()
{
  return MEMORY[0x1E0C962C8]();
}

uint64_t sub_1A9CE6EAC()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1A9CE6EB8()
{
  return MEMORY[0x1E0C963B0]();
}

uint64_t sub_1A9CE6EC4()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1A9CE6ED0()
{
  return MEMORY[0x1E0CD8250]();
}

uint64_t sub_1A9CE6EDC()
{
  return MEMORY[0x1E0CD8258]();
}

uint64_t sub_1A9CE6EE8()
{
  return MEMORY[0x1E0CD8260]();
}

uint64_t sub_1A9CE6EF4()
{
  return MEMORY[0x1E0CD8268]();
}

uint64_t sub_1A9CE6F00()
{
  return MEMORY[0x1E0CD8280]();
}

uint64_t sub_1A9CE6F0C()
{
  return MEMORY[0x1E0CD8328]();
}

uint64_t sub_1A9CE6F18()
{
  return MEMORY[0x1E0CD8338]();
}

uint64_t sub_1A9CE6F24()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_1A9CE6F30()
{
  return MEMORY[0x1E0CD8530]();
}

uint64_t sub_1A9CE6F3C()
{
  return MEMORY[0x1E0CD8550]();
}

uint64_t sub_1A9CE6F48()
{
  return MEMORY[0x1E0CD8648]();
}

uint64_t sub_1A9CE6F54()
{
  return MEMORY[0x1E0CD8650]();
}

uint64_t sub_1A9CE6F60()
{
  return MEMORY[0x1E0CD86C0]();
}

uint64_t sub_1A9CE6F6C()
{
  return MEMORY[0x1E0CD86F8]();
}

uint64_t sub_1A9CE6F78()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_1A9CE6F84()
{
  return MEMORY[0x1E0CD88C0]();
}

uint64_t sub_1A9CE6F90()
{
  return MEMORY[0x1E0CD89D8]();
}

uint64_t sub_1A9CE6F9C()
{
  return MEMORY[0x1E0CD8A00]();
}

uint64_t sub_1A9CE6FA8()
{
  return MEMORY[0x1E0CD8A28]();
}

uint64_t sub_1A9CE6FB4()
{
  return MEMORY[0x1E0CD8C70]();
}

uint64_t sub_1A9CE6FC0()
{
  return MEMORY[0x1E0CD8C80]();
}

uint64_t sub_1A9CE6FCC()
{
  return MEMORY[0x1E0CD8C90]();
}

uint64_t sub_1A9CE6FD8()
{
  return MEMORY[0x1E0CD8CB0]();
}

uint64_t sub_1A9CE6FE4()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1A9CE6FF0()
{
  return MEMORY[0x1E0CD8DE8]();
}

uint64_t sub_1A9CE6FFC()
{
  return MEMORY[0x1E0CD8EF0]();
}

uint64_t sub_1A9CE7008()
{
  return MEMORY[0x1E0CD8F18]();
}

uint64_t sub_1A9CE7014()
{
  return MEMORY[0x1E0CD8FC8]();
}

uint64_t sub_1A9CE7020()
{
  return MEMORY[0x1E0CD8FD0]();
}

uint64_t sub_1A9CE702C()
{
  return MEMORY[0x1E0CD8FE0]();
}

uint64_t sub_1A9CE7038()
{
  return MEMORY[0x1E0CD9010]();
}

uint64_t sub_1A9CE7044()
{
  return MEMORY[0x1E0CD9020]();
}

uint64_t sub_1A9CE7050()
{
  return MEMORY[0x1E0CD9030]();
}

uint64_t sub_1A9CE705C()
{
  return MEMORY[0x1E0CD9048]();
}

uint64_t sub_1A9CE7068()
{
  return MEMORY[0x1E0CD9050]();
}

uint64_t sub_1A9CE7074()
{
  return MEMORY[0x1E0CD9120]();
}

uint64_t sub_1A9CE7080()
{
  return MEMORY[0x1E0CD9128]();
}

uint64_t sub_1A9CE708C()
{
  return MEMORY[0x1E0CD91C0]();
}

uint64_t sub_1A9CE7098()
{
  return MEMORY[0x1E0CD91D8]();
}

uint64_t sub_1A9CE70A4()
{
  return MEMORY[0x1E0CD9210]();
}

uint64_t sub_1A9CE70B0()
{
  return MEMORY[0x1E0CD9240]();
}

uint64_t sub_1A9CE70BC()
{
  return MEMORY[0x1E0CD92F8]();
}

uint64_t sub_1A9CE70C8()
{
  return MEMORY[0x1E0CD9370]();
}

uint64_t sub_1A9CE70D4()
{
  return MEMORY[0x1E0CD93A0]();
}

uint64_t sub_1A9CE70E0()
{
  return MEMORY[0x1E0CD9408]();
}

uint64_t sub_1A9CE70EC()
{
  return MEMORY[0x1E0CD9450]();
}

uint64_t sub_1A9CE70F8()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_1A9CE7104()
{
  return MEMORY[0x1E0CD94F8]();
}

uint64_t sub_1A9CE7110()
{
  return MEMORY[0x1E0CD9958]();
}

uint64_t sub_1A9CE711C()
{
  return MEMORY[0x1E0CD9A80]();
}

uint64_t sub_1A9CE7128()
{
  return MEMORY[0x1E0CD9B18]();
}

uint64_t sub_1A9CE7134()
{
  return MEMORY[0x1E0CD9B30]();
}

uint64_t sub_1A9CE7140()
{
  return MEMORY[0x1E0CD9B38]();
}

uint64_t sub_1A9CE714C()
{
  return MEMORY[0x1E0CD9B88]();
}

uint64_t sub_1A9CE7158()
{
  return MEMORY[0x1E0CD9BA8]();
}

uint64_t sub_1A9CE7164()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1A9CE7170()
{
  return MEMORY[0x1E0CD9EC0]();
}

uint64_t sub_1A9CE717C()
{
  return MEMORY[0x1E0CD9EC8]();
}

uint64_t sub_1A9CE7188()
{
  return MEMORY[0x1E0CD9F70]();
}

uint64_t sub_1A9CE7194()
{
  return MEMORY[0x1E0CD9F78]();
}

uint64_t sub_1A9CE71A0()
{
  return MEMORY[0x1E0CD9FB8]();
}

uint64_t sub_1A9CE71AC()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_1A9CE71B8()
{
  return MEMORY[0x1E0CDA0F0]();
}

uint64_t sub_1A9CE71C4()
{
  return MEMORY[0x1E0CDA218]();
}

uint64_t sub_1A9CE71D0()
{
  return MEMORY[0x1E0CDA268]();
}

uint64_t sub_1A9CE71DC()
{
  return MEMORY[0x1E0CDA358]();
}

uint64_t sub_1A9CE71E8()
{
  return MEMORY[0x1E0CDA400]();
}

uint64_t sub_1A9CE71F4()
{
  return MEMORY[0x1E0CDA458]();
}

uint64_t sub_1A9CE7200()
{
  return MEMORY[0x1E0CDA478]();
}

uint64_t sub_1A9CE720C()
{
  return MEMORY[0x1E0CDA4A8]();
}

uint64_t sub_1A9CE7218()
{
  return MEMORY[0x1E0CDA4B0]();
}

uint64_t sub_1A9CE7224()
{
  return MEMORY[0x1E0CDA4E0]();
}

uint64_t sub_1A9CE7230()
{
  return MEMORY[0x1E0CDA590]();
}

uint64_t sub_1A9CE723C()
{
  return MEMORY[0x1E0CDA5A0]();
}

uint64_t sub_1A9CE7248()
{
  return MEMORY[0x1E0CDA618]();
}

uint64_t sub_1A9CE7254()
{
  return MEMORY[0x1E0CDA620]();
}

uint64_t sub_1A9CE7260()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_1A9CE726C()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_1A9CE7278()
{
  return MEMORY[0x1E0CDA6D0]();
}

uint64_t sub_1A9CE7284()
{
  return MEMORY[0x1E0CDA720]();
}

uint64_t sub_1A9CE7290()
{
  return MEMORY[0x1E0CDA728]();
}

uint64_t sub_1A9CE729C()
{
  return MEMORY[0x1E0CDA750]();
}

uint64_t sub_1A9CE72A8()
{
  return MEMORY[0x1E0CDA758]();
}

uint64_t sub_1A9CE72B4()
{
  return MEMORY[0x1E0CDA760]();
}

uint64_t sub_1A9CE72C0()
{
  return MEMORY[0x1E0CDA7E8]();
}

uint64_t sub_1A9CE72CC()
{
  return MEMORY[0x1E0CDA7F8]();
}

uint64_t sub_1A9CE72D8()
{
  return MEMORY[0x1E0CDA810]();
}

uint64_t sub_1A9CE72E4()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_1A9CE72F0()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_1A9CE72FC()
{
  return MEMORY[0x1E0CDA940]();
}

uint64_t sub_1A9CE7308()
{
  return MEMORY[0x1E0CDA948]();
}

uint64_t sub_1A9CE7314()
{
  return MEMORY[0x1E0CDA990]();
}

uint64_t sub_1A9CE7320()
{
  return MEMORY[0x1E0CDA9A0]();
}

uint64_t sub_1A9CE732C()
{
  return MEMORY[0x1E0CEF8C8]();
}

uint64_t sub_1A9CE7338()
{
  return MEMORY[0x1E0CDA9D0]();
}

uint64_t sub_1A9CE7344()
{
  return MEMORY[0x1E0CDA9E0]();
}

uint64_t sub_1A9CE7350()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_1A9CE735C()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_1A9CE7368()
{
  return MEMORY[0x1E0CDAA68]();
}

uint64_t sub_1A9CE7374()
{
  return MEMORY[0x1E0CDAA78]();
}

uint64_t sub_1A9CE7380()
{
  return MEMORY[0x1E0CDABA0]();
}

uint64_t sub_1A9CE738C()
{
  return MEMORY[0x1E0CDACB8]();
}

uint64_t sub_1A9CE7398()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1A9CE73A4()
{
  return MEMORY[0x1E0CDAFF8]();
}

uint64_t sub_1A9CE73B0()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_1A9CE73BC()
{
  return MEMORY[0x1E0CDB1E8]();
}

uint64_t sub_1A9CE73C8()
{
  return MEMORY[0x1E0CDB248]();
}

uint64_t sub_1A9CE73D4()
{
  return MEMORY[0x1E0CDB288]();
}

uint64_t sub_1A9CE73E0()
{
  return MEMORY[0x1E0CDB2C8]();
}

uint64_t sub_1A9CE73EC()
{
  return MEMORY[0x1E0CDB2E0]();
}

uint64_t sub_1A9CE73F8()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_1A9CE7404()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1A9CE7410()
{
  return MEMORY[0x1E0CDB5D0]();
}

uint64_t sub_1A9CE741C()
{
  return MEMORY[0x1E0CDB5F8]();
}

uint64_t sub_1A9CE7428()
{
  return MEMORY[0x1E0CDB630]();
}

uint64_t sub_1A9CE7434()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t sub_1A9CE7440()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_1A9CE744C()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t sub_1A9CE7458()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_1A9CE7464()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_1A9CE7470()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_1A9CE747C()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_1A9CE7488()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_1A9CE7494()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_1A9CE74A0()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_1A9CE74AC()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_1A9CE74B8()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_1A9CE74C4()
{
  return MEMORY[0x1E0CDB818]();
}

uint64_t sub_1A9CE74D0()
{
  return MEMORY[0x1E0CDB820]();
}

uint64_t sub_1A9CE74DC()
{
  return MEMORY[0x1E0CDB848]();
}

uint64_t sub_1A9CE74E8()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1A9CE74F4()
{
  return MEMORY[0x1E0CDB880]();
}

uint64_t sub_1A9CE7500()
{
  return MEMORY[0x1E0CDBA08]();
}

uint64_t sub_1A9CE750C()
{
  return MEMORY[0x1E0CDBA18]();
}

uint64_t sub_1A9CE7518()
{
  return MEMORY[0x1E0CDBD90]();
}

uint64_t sub_1A9CE7524()
{
  return MEMORY[0x1E0CDBDE8]();
}

uint64_t sub_1A9CE7530()
{
  return MEMORY[0x1E0CDBEB8]();
}

uint64_t sub_1A9CE753C()
{
  return MEMORY[0x1E0CDBED0]();
}

uint64_t sub_1A9CE7548()
{
  return MEMORY[0x1E0CDBEF8]();
}

uint64_t sub_1A9CE7554()
{
  return MEMORY[0x1E0CDBFA8]();
}

uint64_t sub_1A9CE7560()
{
  return MEMORY[0x1E0CDBFF0]();
}

uint64_t sub_1A9CE756C()
{
  return MEMORY[0x1E0CDC108]();
}

uint64_t sub_1A9CE7578()
{
  return MEMORY[0x1E0CDC110]();
}

uint64_t sub_1A9CE7584()
{
  return MEMORY[0x1E0CDC280]();
}

uint64_t sub_1A9CE7590()
{
  return MEMORY[0x1E0CDC290]();
}

uint64_t sub_1A9CE759C()
{
  return MEMORY[0x1E0CDC2A8]();
}

uint64_t sub_1A9CE75A8()
{
  return MEMORY[0x1E0CDC2B8]();
}

uint64_t sub_1A9CE75B4()
{
  return MEMORY[0x1E0CDC2C8]();
}

uint64_t sub_1A9CE75C0()
{
  return MEMORY[0x1E0CDC350]();
}

uint64_t sub_1A9CE75CC()
{
  return MEMORY[0x1E0CDC368]();
}

uint64_t sub_1A9CE75D8()
{
  return MEMORY[0x1E0CDC388]();
}

uint64_t sub_1A9CE75E4()
{
  return MEMORY[0x1E0CDC3A8]();
}

uint64_t sub_1A9CE75F0()
{
  return MEMORY[0x1E0CDC800]();
}

uint64_t sub_1A9CE75FC()
{
  return MEMORY[0x1E0CDC928]();
}

uint64_t sub_1A9CE7608()
{
  return MEMORY[0x1E0CDC968]();
}

uint64_t sub_1A9CE7614()
{
  return MEMORY[0x1E0CDC978]();
}

uint64_t sub_1A9CE7620()
{
  return MEMORY[0x1E0CDC990]();
}

uint64_t sub_1A9CE762C()
{
  return MEMORY[0x1E0CDCA38]();
}

uint64_t sub_1A9CE7638()
{
  return MEMORY[0x1E0CDCA50]();
}

uint64_t sub_1A9CE7644()
{
  return MEMORY[0x1E0CDCAB8]();
}

uint64_t sub_1A9CE7650()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_1A9CE765C()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_1A9CE7668()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_1A9CE7674()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_1A9CE7680()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_1A9CE768C()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_1A9CE7698()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_1A9CE76A4()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_1A9CE76B0()
{
  return MEMORY[0x1E0CDCF68]();
}

uint64_t sub_1A9CE76BC()
{
  return MEMORY[0x1E0CDCFD0]();
}

uint64_t sub_1A9CE76C8()
{
  return MEMORY[0x1E0CDD0A0]();
}

uint64_t sub_1A9CE76D4()
{
  return MEMORY[0x1E0CDD0B0]();
}

uint64_t sub_1A9CE76E0()
{
  return MEMORY[0x1E0CDD218]();
}

uint64_t sub_1A9CE76EC()
{
  return MEMORY[0x1E0CDD230]();
}

uint64_t sub_1A9CE76F8()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_1A9CE7704()
{
  return MEMORY[0x1E0CDD300]();
}

uint64_t sub_1A9CE7710()
{
  return MEMORY[0x1E0CDD310]();
}

uint64_t sub_1A9CE771C()
{
  return MEMORY[0x1E0CDD320]();
}

uint64_t sub_1A9CE7728()
{
  return MEMORY[0x1E0CDD348]();
}

uint64_t sub_1A9CE7734()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1A9CE7740()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_1A9CE774C()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1A9CE7758()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_1A9CE7764()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_1A9CE7770()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_1A9CE777C()
{
  return MEMORY[0x1E0DCC7D8]();
}

uint64_t sub_1A9CE7788()
{
  return MEMORY[0x1E0DCC7E8]();
}

uint64_t sub_1A9CE7794()
{
  return MEMORY[0x1E0CDD418]();
}

uint64_t sub_1A9CE77A0()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_1A9CE77AC()
{
  return MEMORY[0x1E0CDD488]();
}

uint64_t sub_1A9CE77B8()
{
  return MEMORY[0x1E0CDD490]();
}

uint64_t sub_1A9CE77C4()
{
  return MEMORY[0x1E0CDD498]();
}

uint64_t sub_1A9CE77D0()
{
  return MEMORY[0x1E0CDD4C8]();
}

uint64_t sub_1A9CE77DC()
{
  return MEMORY[0x1E0CDD4D8]();
}

uint64_t sub_1A9CE77E8()
{
  return MEMORY[0x1E0CDD4E0]();
}

uint64_t sub_1A9CE77F4()
{
  return MEMORY[0x1E0CDD4F0]();
}

uint64_t sub_1A9CE7800()
{
  return MEMORY[0x1E0CDD560]();
}

uint64_t sub_1A9CE780C()
{
  return MEMORY[0x1E0CDD5C0]();
}

uint64_t sub_1A9CE7818()
{
  return MEMORY[0x1E0CDD5E0]();
}

uint64_t sub_1A9CE7824()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_1A9CE7830()
{
  return MEMORY[0x1E0CDD638]();
}

uint64_t sub_1A9CE783C()
{
  return MEMORY[0x1E0CDD648]();
}

uint64_t sub_1A9CE7848()
{
  return MEMORY[0x1E0CDD658]();
}

uint64_t sub_1A9CE7854()
{
  return MEMORY[0x1E0CDD668]();
}

uint64_t sub_1A9CE7860()
{
  return MEMORY[0x1E0CDD678]();
}

uint64_t sub_1A9CE786C()
{
  return MEMORY[0x1E0CDD688]();
}

uint64_t sub_1A9CE7878()
{
  return MEMORY[0x1E0CDD6B0]();
}

uint64_t sub_1A9CE7884()
{
  return MEMORY[0x1E0CDD6F8]();
}

uint64_t sub_1A9CE7890()
{
  return MEMORY[0x1E0CDD718]();
}

uint64_t sub_1A9CE789C()
{
  return MEMORY[0x1E0CDD728]();
}

uint64_t sub_1A9CE78A8()
{
  return MEMORY[0x1E0CDD740]();
}

uint64_t sub_1A9CE78B4()
{
  return MEMORY[0x1E0CDD750]();
}

uint64_t sub_1A9CE78C0()
{
  return MEMORY[0x1E0CDD770]();
}

uint64_t sub_1A9CE78CC()
{
  return MEMORY[0x1E0CDD7F0]();
}

uint64_t sub_1A9CE78D8()
{
  return MEMORY[0x1E0CDD810]();
}

uint64_t sub_1A9CE78E4()
{
  return MEMORY[0x1E0CDD878]();
}

uint64_t sub_1A9CE78F0()
{
  return MEMORY[0x1E0CDD880]();
}

uint64_t sub_1A9CE78FC()
{
  return MEMORY[0x1E0CDD928]();
}

uint64_t sub_1A9CE7908()
{
  return MEMORY[0x1E0CDD938]();
}

uint64_t sub_1A9CE7914()
{
  return MEMORY[0x1E0CDD9A8]();
}

uint64_t sub_1A9CE7920()
{
  return MEMORY[0x1E0CDD9E8]();
}

uint64_t sub_1A9CE792C()
{
  return MEMORY[0x1E0CDDA10]();
}

uint64_t sub_1A9CE7938()
{
  return MEMORY[0x1E0CDDA40]();
}

uint64_t sub_1A9CE7944()
{
  return MEMORY[0x1E0CDDA70]();
}

uint64_t sub_1A9CE7950()
{
  return MEMORY[0x1E0CDDA78]();
}

uint64_t sub_1A9CE795C()
{
  return MEMORY[0x1E0CDDAA0]();
}

uint64_t sub_1A9CE7968()
{
  return MEMORY[0x1E0CDDB88]();
}

uint64_t sub_1A9CE7974()
{
  return MEMORY[0x1E0CDDBC0]();
}

uint64_t sub_1A9CE7980()
{
  return MEMORY[0x1E0CDDBE0]();
}

uint64_t sub_1A9CE798C()
{
  return MEMORY[0x1E0CDDC18]();
}

uint64_t sub_1A9CE7998()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_1A9CE79A4()
{
  return MEMORY[0x1E0CDDCE8]();
}

uint64_t sub_1A9CE79B0()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_1A9CE79BC()
{
  return MEMORY[0x1E0CDDDC0]();
}

uint64_t sub_1A9CE79C8()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1A9CE79D4()
{
  return MEMORY[0x1E0CDDDE8]();
}

uint64_t sub_1A9CE79E0()
{
  return MEMORY[0x1E0D2BAC0]();
}

uint64_t sub_1A9CE79EC()
{
  return MEMORY[0x1E0C93C50]();
}

uint64_t sub_1A9CE79F8()
{
  return MEMORY[0x1E0C93C70]();
}

uint64_t sub_1A9CE7A04()
{
  return MEMORY[0x1E0C93C88]();
}

uint64_t sub_1A9CE7A10()
{
  return MEMORY[0x1E0C93CA8]();
}

uint64_t sub_1A9CE7A1C()
{
  return MEMORY[0x1E0C93CC8]();
}

uint64_t sub_1A9CE7A28()
{
  return MEMORY[0x1E0C93CE0]();
}

uint64_t sub_1A9CE7A34()
{
  return MEMORY[0x1E0C93D08]();
}

uint64_t sub_1A9CE7A40()
{
  return MEMORY[0x1E0C93D58]();
}

uint64_t sub_1A9CE7A4C()
{
  return MEMORY[0x1E0C93D68]();
}

uint64_t sub_1A9CE7A58()
{
  return MEMORY[0x1E0CEFAF8]();
}

uint64_t sub_1A9CE7A64()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1A9CE7A70()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1A9CE7A7C()
{
  return MEMORY[0x1E0CDDEB0]();
}

uint64_t sub_1A9CE7A88()
{
  return MEMORY[0x1E0CDDEE0]();
}

uint64_t sub_1A9CE7A94()
{
  return MEMORY[0x1E0CDDF08]();
}

uint64_t sub_1A9CE7AA0()
{
  return MEMORY[0x1E0CDDFD0]();
}

uint64_t sub_1A9CE7AAC()
{
  return MEMORY[0x1E0CDE050]();
}

uint64_t sub_1A9CE7AB8()
{
  return MEMORY[0x1E0CDE230]();
}

uint64_t sub_1A9CE7AC4()
{
  return MEMORY[0x1E0CDE2B8]();
}

uint64_t sub_1A9CE7AD0()
{
  return MEMORY[0x1E0CDE2C8]();
}

uint64_t sub_1A9CE7ADC()
{
  return MEMORY[0x1E0CDE2E0]();
}

uint64_t sub_1A9CE7AE8()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1A9CE7AF4()
{
  return MEMORY[0x1E0CDE4B8]();
}

uint64_t sub_1A9CE7B00()
{
  return MEMORY[0x1E0CDE570]();
}

uint64_t sub_1A9CE7B0C()
{
  return MEMORY[0x1E0CDE590]();
}

uint64_t sub_1A9CE7B18()
{
  return MEMORY[0x1E0CDE5E0]();
}

uint64_t sub_1A9CE7B24()
{
  return MEMORY[0x1E0CDE6F0]();
}

uint64_t sub_1A9CE7B30()
{
  return MEMORY[0x1E0CDE788]();
}

uint64_t sub_1A9CE7B3C()
{
  return MEMORY[0x1E0CDE8F0]();
}

uint64_t sub_1A9CE7B48()
{
  return MEMORY[0x1E0CDE900]();
}

uint64_t sub_1A9CE7B54()
{
  return MEMORY[0x1E0CDEA88]();
}

uint64_t sub_1A9CE7B60()
{
  return MEMORY[0x1E0CDEAE8]();
}

uint64_t sub_1A9CE7B6C()
{
  return MEMORY[0x1E0CDEBA8]();
}

uint64_t sub_1A9CE7B78()
{
  return MEMORY[0x1E0CDEC40]();
}

uint64_t sub_1A9CE7B84()
{
  return MEMORY[0x1E0CDED90]();
}

uint64_t sub_1A9CE7B90()
{
  return MEMORY[0x1E0CDEE80]();
}

uint64_t sub_1A9CE7B9C()
{
  return MEMORY[0x1E0CDEF10]();
}

uint64_t sub_1A9CE7BA8()
{
  return MEMORY[0x1E0CDEF40]();
}

uint64_t sub_1A9CE7BB4()
{
  return MEMORY[0x1E0CDEF58]();
}

uint64_t sub_1A9CE7BC0()
{
  return MEMORY[0x1E0CDEFA0]();
}

uint64_t sub_1A9CE7BCC()
{
  return MEMORY[0x1E0CDF048]();
}

uint64_t sub_1A9CE7BD8()
{
  return MEMORY[0x1E0CDF060]();
}

uint64_t sub_1A9CE7BE4()
{
  return MEMORY[0x1E0CDF068]();
}

uint64_t sub_1A9CE7BF0()
{
  return MEMORY[0x1E0CDF088]();
}

uint64_t sub_1A9CE7BFC()
{
  return MEMORY[0x1E0CDF128]();
}

uint64_t sub_1A9CE7C08()
{
  return MEMORY[0x1E0CDF138]();
}

uint64_t sub_1A9CE7C14()
{
  return MEMORY[0x1E0CDF208]();
}

uint64_t sub_1A9CE7C20()
{
  return MEMORY[0x1E0CDF300]();
}

uint64_t sub_1A9CE7C2C()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_1A9CE7C38()
{
  return MEMORY[0x1E0CDF3F0]();
}

uint64_t sub_1A9CE7C44()
{
  return MEMORY[0x1E0CDF420]();
}

uint64_t sub_1A9CE7C50()
{
  return MEMORY[0x1E0CDF438]();
}

uint64_t sub_1A9CE7C5C()
{
  return MEMORY[0x1E0CDF440]();
}

uint64_t sub_1A9CE7C68()
{
  return MEMORY[0x1E0CDF458]();
}

uint64_t sub_1A9CE7C74()
{
  return MEMORY[0x1E0CDF470]();
}

uint64_t sub_1A9CE7C80()
{
  return MEMORY[0x1E0CDF490]();
}

uint64_t sub_1A9CE7C8C()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_1A9CE7C98()
{
  return MEMORY[0x1E0CDF4B8]();
}

uint64_t sub_1A9CE7CA4()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_1A9CE7CB0()
{
  return MEMORY[0x1E0CDF4F8]();
}

uint64_t sub_1A9CE7CBC()
{
  return MEMORY[0x1E0CDF508]();
}

uint64_t sub_1A9CE7CC8()
{
  return MEMORY[0x1E0CDF520]();
}

uint64_t sub_1A9CE7CD4()
{
  return MEMORY[0x1E0CDF530]();
}

uint64_t sub_1A9CE7CE0()
{
  return MEMORY[0x1E0CDF588]();
}

uint64_t sub_1A9CE7CEC()
{
  return MEMORY[0x1E0CDF5F8]();
}

uint64_t sub_1A9CE7CF8()
{
  return MEMORY[0x1E0CDF678]();
}

uint64_t sub_1A9CE7D04()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_1A9CE7D10()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_1A9CE7D1C()
{
  return MEMORY[0x1E0CDF730]();
}

uint64_t sub_1A9CE7D28()
{
  return MEMORY[0x1E0CDF748]();
}

uint64_t sub_1A9CE7D34()
{
  return MEMORY[0x1E0CDF788]();
}

uint64_t sub_1A9CE7D40()
{
  return MEMORY[0x1E0CDF7E8]();
}

uint64_t sub_1A9CE7D4C()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_1A9CE7D58()
{
  return MEMORY[0x1E0CDF858]();
}

uint64_t sub_1A9CE7D64()
{
  return MEMORY[0x1E0CDF878]();
}

uint64_t sub_1A9CE7D70()
{
  return MEMORY[0x1E0CDF8B0]();
}

uint64_t sub_1A9CE7D7C()
{
  return MEMORY[0x1E0CDF900]();
}

uint64_t sub_1A9CE7D88()
{
  return MEMORY[0x1E0CDF908]();
}

uint64_t sub_1A9CE7D94()
{
  return MEMORY[0x1E0CDF918]();
}

uint64_t sub_1A9CE7DA0()
{
  return MEMORY[0x1E0CDF928]();
}

uint64_t sub_1A9CE7DAC()
{
  return MEMORY[0x1E0CDF938]();
}

uint64_t sub_1A9CE7DB8()
{
  return MEMORY[0x1E0CDF950]();
}

uint64_t sub_1A9CE7DC4()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1A9CE7DD0()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1A9CE7DDC()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_1A9CE7DE8()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_1A9CE7DF4()
{
  return MEMORY[0x1E0CDF9A8]();
}

uint64_t sub_1A9CE7E00()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_1A9CE7E0C()
{
  return MEMORY[0x1E0CDFA10]();
}

uint64_t sub_1A9CE7E18()
{
  return MEMORY[0x1E0CDFA28]();
}

uint64_t sub_1A9CE7E24()
{
  return MEMORY[0x1E0CDFA38]();
}

uint64_t sub_1A9CE7E30()
{
  return MEMORY[0x1E0CDFAE0]();
}

uint64_t sub_1A9CE7E3C()
{
  return MEMORY[0x1E0CDFAF0]();
}

uint64_t sub_1A9CE7E48()
{
  return MEMORY[0x1E0CDFB18]();
}

uint64_t sub_1A9CE7E54()
{
  return MEMORY[0x1E0CDFB40]();
}

uint64_t sub_1A9CE7E60()
{
  return MEMORY[0x1E0CDFB48]();
}

uint64_t sub_1A9CE7E6C()
{
  return MEMORY[0x1E0CDFB50]();
}

uint64_t sub_1A9CE7E78()
{
  return MEMORY[0x1E0CDFB68]();
}

uint64_t sub_1A9CE7E84()
{
  return MEMORY[0x1E0CDFB70]();
}

uint64_t sub_1A9CE7E90()
{
  return MEMORY[0x1E0CDFC58]();
}

uint64_t sub_1A9CE7E9C()
{
  return MEMORY[0x1E0CDFC60]();
}

uint64_t sub_1A9CE7EA8()
{
  return MEMORY[0x1E0CDFC88]();
}

uint64_t sub_1A9CE7EB4()
{
  return MEMORY[0x1E0CDFCA0]();
}

uint64_t sub_1A9CE7EC0()
{
  return MEMORY[0x1E0CDFCD8]();
}

uint64_t sub_1A9CE7ECC()
{
  return MEMORY[0x1E0CDFCE0]();
}

uint64_t sub_1A9CE7ED8()
{
  return MEMORY[0x1E0CDFD20]();
}

uint64_t sub_1A9CE7EE4()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1A9CE7EF0()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_1A9CE7EFC()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_1A9CE7F08()
{
  return MEMORY[0x1E0CDFD80]();
}

uint64_t sub_1A9CE7F14()
{
  return MEMORY[0x1E0CDFDB8]();
}

uint64_t sub_1A9CE7F20()
{
  return MEMORY[0x1E0CDFE18]();
}

uint64_t sub_1A9CE7F2C()
{
  return MEMORY[0x1E0CDFE48]();
}

uint64_t sub_1A9CE7F38()
{
  return MEMORY[0x1E0CDFE58]();
}

uint64_t sub_1A9CE7F44()
{
  return MEMORY[0x1E0C93D80]();
}

uint64_t sub_1A9CE7F50()
{
  return MEMORY[0x1E0CDFE98]();
}

uint64_t sub_1A9CE7F5C()
{
  return MEMORY[0x1E0CDFEA8]();
}

uint64_t sub_1A9CE7F68()
{
  return MEMORY[0x1E0CDFEC0]();
}

uint64_t sub_1A9CE7F74()
{
  return MEMORY[0x1E0CDFF48]();
}

uint64_t sub_1A9CE7F80()
{
  return MEMORY[0x1E0CDFF60]();
}

uint64_t sub_1A9CE7F8C()
{
  return MEMORY[0x1E0CDFF78]();
}

uint64_t sub_1A9CE7F98()
{
  return MEMORY[0x1E0CDFF80]();
}

uint64_t sub_1A9CE7FA4()
{
  return MEMORY[0x1E0CE00C0]();
}

uint64_t sub_1A9CE7FB0()
{
  return MEMORY[0x1E0CE00D8]();
}

uint64_t sub_1A9CE7FBC()
{
  return MEMORY[0x1E0CE00E0]();
}

uint64_t sub_1A9CE7FC8()
{
  return MEMORY[0x1E0CE0190]();
}

uint64_t sub_1A9CE7FD4()
{
  return MEMORY[0x1E0CE01B0]();
}

uint64_t sub_1A9CE7FE0()
{
  return MEMORY[0x1E0CE0208]();
}

uint64_t sub_1A9CE7FEC()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1A9CE7FF8()
{
  return MEMORY[0x1E0CE02C8]();
}

uint64_t sub_1A9CE8004()
{
  return MEMORY[0x1E0CE02D8]();
}

uint64_t sub_1A9CE8010()
{
  return MEMORY[0x1E0CE0648]();
}

uint64_t sub_1A9CE801C()
{
  return MEMORY[0x1E0CE0670]();
}

uint64_t sub_1A9CE8028()
{
  return MEMORY[0x1E0CE0698]();
}

uint64_t sub_1A9CE8034()
{
  return MEMORY[0x1E0CE06A0]();
}

uint64_t sub_1A9CE8040()
{
  return MEMORY[0x1E0CE06B8]();
}

uint64_t sub_1A9CE804C()
{
  return MEMORY[0x1E0CE06C8]();
}

uint64_t sub_1A9CE8058()
{
  return MEMORY[0x1E0CE06E0]();
}

uint64_t sub_1A9CE8064()
{
  return MEMORY[0x1E0CE06E8]();
}

uint64_t sub_1A9CE8070()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A9CE807C()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1A9CE8088()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A9CE8094()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A9CE80A0()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1A9CE80AC()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1A9CE80B8()
{
  return MEMORY[0x1E0D2F338]();
}

uint64_t sub_1A9CE80C4()
{
  return MEMORY[0x1E0CB4328]();
}

uint64_t sub_1A9CE80D0()
{
  return MEMORY[0x1E0CB4338]();
}

uint64_t sub_1A9CE80DC()
{
  return MEMORY[0x1E0CB4340]();
}

uint64_t sub_1A9CE80E8()
{
  return MEMORY[0x1E0CB4350]();
}

uint64_t sub_1A9CE80F4()
{
  return MEMORY[0x1E0CB44C0]();
}

uint64_t sub_1A9CE8100()
{
  return MEMORY[0x1E0CB44D0]();
}

uint64_t sub_1A9CE810C()
{
  return MEMORY[0x1E0CB44E0]();
}

uint64_t sub_1A9CE8118()
{
  return MEMORY[0x1E0DCC828]();
}

uint64_t sub_1A9CE8124()
{
  return MEMORY[0x1E0DCC838]();
}

uint64_t sub_1A9CE8130()
{
  return MEMORY[0x1E0DCC848]();
}

uint64_t sub_1A9CE813C()
{
  return MEMORY[0x1E0DCC868]();
}

uint64_t sub_1A9CE8148()
{
  return MEMORY[0x1E0DCC870]();
}

uint64_t sub_1A9CE8154()
{
  return MEMORY[0x1E0DCC888]();
}

uint64_t sub_1A9CE8160()
{
  return MEMORY[0x1E0DCC8A8]();
}

uint64_t sub_1A9CE816C()
{
  return MEMORY[0x1E0DCC8B0]();
}

uint64_t sub_1A9CE8178()
{
  return MEMORY[0x1E0DCC8B8]();
}

uint64_t sub_1A9CE8184()
{
  return MEMORY[0x1E0DCC8C0]();
}

uint64_t sub_1A9CE8190()
{
  return MEMORY[0x1E0DCC8C8]();
}

uint64_t sub_1A9CE819C()
{
  return MEMORY[0x1E0DCC938]();
}

uint64_t sub_1A9CE81A8()
{
  return MEMORY[0x1E0DCC960]();
}

uint64_t sub_1A9CE81B4()
{
  return MEMORY[0x1E0DCC970]();
}

uint64_t sub_1A9CE81C0()
{
  return MEMORY[0x1E0DCC988]();
}

uint64_t sub_1A9CE81CC()
{
  return MEMORY[0x1E0DCC990]();
}

uint64_t sub_1A9CE81D8()
{
  return MEMORY[0x1E0DCC9A0]();
}

uint64_t sub_1A9CE81E4()
{
  return MEMORY[0x1E0DCC9A8]();
}

uint64_t sub_1A9CE81F0()
{
  return MEMORY[0x1E0DCC9B0]();
}

uint64_t sub_1A9CE81FC()
{
  return MEMORY[0x1E0DCC9C0]();
}

uint64_t sub_1A9CE8208()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1A9CE8214()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1A9CE8220()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1A9CE822C()
{
  return MEMORY[0x1E0DEA108]();
}

uint64_t sub_1A9CE8238()
{
  return MEMORY[0x1E0DEA158]();
}

uint64_t sub_1A9CE8244()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1A9CE8250()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1A9CE825C()
{
  return MEMORY[0x1E0DEA258]();
}

uint64_t sub_1A9CE8268()
{
  return MEMORY[0x1E0DEA2B8]();
}

uint64_t sub_1A9CE8274()
{
  return MEMORY[0x1E0DEA318]();
}

uint64_t sub_1A9CE8280()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1A9CE828C()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1A9CE8298()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1A9CE82A4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A9CE82B0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A9CE82BC()
{
  return MEMORY[0x1E0CB1950]();
}

uint64_t sub_1A9CE82C8()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1A9CE82D4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1A9CE82E0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A9CE82EC()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1A9CE82F8()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1A9CE8304()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1A9CE8310()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1A9CE831C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A9CE8328()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1A9CE8334()
{
  return MEMORY[0x1E0DEA7F8]();
}

uint64_t sub_1A9CE8340()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A9CE834C()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1A9CE8358()
{
  return MEMORY[0x1E0D2F350]();
}

uint64_t sub_1A9CE8364()
{
  return MEMORY[0x1E0D2F358]();
}

uint64_t sub_1A9CE8370()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1A9CE837C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1A9CE8388()
{
  return MEMORY[0x1E0DEAA38]();
}

uint64_t sub_1A9CE8394()
{
  return MEMORY[0x1E0DEAAB0]();
}

uint64_t sub_1A9CE83A0()
{
  return MEMORY[0x1E0DEABA0]();
}

uint64_t sub_1A9CE83AC()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1A9CE83B8()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1A9CE83C4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1A9CE83D0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A9CE83DC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A9CE83E8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A9CE83F4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1A9CE8400()
{
  return MEMORY[0x1E0DEAE08]();
}

uint64_t sub_1A9CE840C()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A9CE8418()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1A9CE8424()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1A9CE8430()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A9CE843C()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t sub_1A9CE8448()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1A9CE8454()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1A9CE8460()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1A9CE846C()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1A9CE8478()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1A9CE8484()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1A9CE8490()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1A9CE849C()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1A9CE84A8()
{
  return MEMORY[0x1E0DEAFF8]();
}

uint64_t sub_1A9CE84B4()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1A9CE84C0()
{
  return MEMORY[0x1E0DEB060]();
}

uint64_t sub_1A9CE84CC()
{
  return MEMORY[0x1E0DEB130]();
}

uint64_t sub_1A9CE84D8()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1A9CE84E4()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1A9CE84F0()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1A9CE84FC()
{
  return MEMORY[0x1E0DEB2B0]();
}

uint64_t sub_1A9CE8508()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1A9CE8514()
{
  return MEMORY[0x1E0DEB498]();
}

uint64_t sub_1A9CE8520()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1A9CE852C()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1A9CE8538()
{
  return MEMORY[0x1E0DEB590]();
}

uint64_t sub_1A9CE8544()
{
  return MEMORY[0x1E0DEB598]();
}

uint64_t sub_1A9CE8550()
{
  return MEMORY[0x1E0DEB5A0]();
}

uint64_t sub_1A9CE855C()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_1A9CE8568()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1A9CE8574()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1A9CE8580()
{
  return MEMORY[0x1E0DEB6A8]();
}

uint64_t sub_1A9CE858C()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1A9CE8598()
{
  return MEMORY[0x1E0CB1C50]();
}

uint64_t sub_1A9CE85A4()
{
  return MEMORY[0x1E0DEB848]();
}

uint64_t sub_1A9CE85B0()
{
  return MEMORY[0x1E0C9B8C8]();
}

uint64_t sub_1A9CE85BC()
{
  return MEMORY[0x1E0D2BB18]();
}

uint64_t sub_1A9CE85C8()
{
  return MEMORY[0x1E0D2BB20]();
}

uint64_t sub_1A9CE85D4()
{
  return MEMORY[0x1E0D2BB28]();
}

uint64_t sub_1A9CE85E0()
{
  return MEMORY[0x1E0D2BB50]();
}

uint64_t sub_1A9CE85EC()
{
  return MEMORY[0x1E0D2BB58]();
}

uint64_t sub_1A9CE85F8()
{
  return MEMORY[0x1E0D2BB60]();
}

uint64_t sub_1A9CE8604()
{
  return MEMORY[0x1E0D2BB68]();
}

uint64_t sub_1A9CE8610()
{
  return MEMORY[0x1E0D2BB78]();
}

uint64_t sub_1A9CE861C()
{
  return MEMORY[0x1E0D2BB80]();
}

uint64_t sub_1A9CE8628()
{
  return MEMORY[0x1E0D2BB88]();
}

uint64_t sub_1A9CE8634()
{
  return MEMORY[0x1E0D2BB98]();
}

uint64_t sub_1A9CE8640()
{
  return MEMORY[0x1E0D2BBA0]();
}

uint64_t sub_1A9CE864C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1A9CE8658()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1A9CE8664()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1A9CE8670()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1A9CE867C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1A9CE8688()
{
  return MEMORY[0x1E0CB4548]();
}

uint64_t sub_1A9CE8694()
{
  return MEMORY[0x1E0CB4550]();
}

uint64_t sub_1A9CE86A0()
{
  return MEMORY[0x1E0CB4558]();
}

uint64_t sub_1A9CE86AC()
{
  return MEMORY[0x1E0DC2B20]();
}

uint64_t sub_1A9CE86B8()
{
  return MEMORY[0x1E0DC2B38]();
}

uint64_t sub_1A9CE86C4()
{
  return MEMORY[0x1E0D2E908]();
}

uint64_t sub_1A9CE86D0()
{
  return MEMORY[0x1E0D2BBB8]();
}

uint64_t sub_1A9CE86DC()
{
  return MEMORY[0x1E0D2BBF8]();
}

uint64_t sub_1A9CE86E8()
{
  return MEMORY[0x1E0DC2BF8]();
}

uint64_t sub_1A9CE86F4()
{
  return MEMORY[0x1E0DCCAA0]();
}

uint64_t sub_1A9CE8700()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1A9CE870C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1A9CE8718()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A9CE8724()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1A9CE8730()
{
  return MEMORY[0x1E0D2F388]();
}

uint64_t sub_1A9CE873C()
{
  return MEMORY[0x1E0D2F390]();
}

uint64_t sub_1A9CE8748()
{
  return MEMORY[0x1E0D2F398]();
}

uint64_t sub_1A9CE8754()
{
  return MEMORY[0x1E0D2F3A8]();
}

uint64_t sub_1A9CE8760()
{
  return MEMORY[0x1E0DC2C90]();
}

uint64_t sub_1A9CE876C()
{
  return MEMORY[0x1E0D2BC20]();
}

uint64_t sub_1A9CE8778()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1A9CE8784()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1A9CE8790()
{
  return MEMORY[0x1E0DC2D40]();
}

uint64_t sub_1A9CE879C()
{
  return MEMORY[0x1E0DC2D58]();
}

uint64_t sub_1A9CE87A8()
{
  return MEMORY[0x1E0D2F3B8]();
}

uint64_t sub_1A9CE87B4()
{
  return MEMORY[0x1E0D2BC40]();
}

uint64_t sub_1A9CE87C0()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1A9CE87CC()
{
  return MEMORY[0x1E0CB2098]();
}

uint64_t sub_1A9CE87D8()
{
  return MEMORY[0x1E0CB20A0]();
}

uint64_t sub_1A9CE87E4()
{
  return MEMORY[0x1E0CB20B0]();
}

uint64_t sub_1A9CE87F0()
{
  return MEMORY[0x1E0CE0758]();
}

uint64_t sub_1A9CE87FC()
{
  return MEMORY[0x1E0D2BC88]();
}

uint64_t sub_1A9CE8808()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1A9CE8814()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1A9CE8820()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1A9CE882C()
{
  return MEMORY[0x1E0DEFCF0]();
}

uint64_t sub_1A9CE8838()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1A9CE8844()
{
  return MEMORY[0x1E0DC31C0]();
}

uint64_t sub_1A9CE8850()
{
  return MEMORY[0x1E0DC3228]();
}

uint64_t sub_1A9CE885C()
{
  return MEMORY[0x1E0DC3248]();
}

uint64_t sub_1A9CE8868()
{
  return MEMORY[0x1E0D2F3D8]();
}

uint64_t sub_1A9CE8874()
{
  return MEMORY[0x1E0CB22E8]();
}

uint64_t sub_1A9CE8880()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A9CE888C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1A9CE8898()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1A9CE88A4()
{
  return MEMORY[0x1E0DEBCB0]();
}

uint64_t sub_1A9CE88B0()
{
  return MEMORY[0x1E0CB2400]();
}

uint64_t sub_1A9CE88BC()
{
  return MEMORY[0x1E0CB2478]();
}

uint64_t sub_1A9CE88C8()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1A9CE88D4()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1A9CE88E0()
{
  return MEMORY[0x1E0DEFF58]();
}

uint64_t sub_1A9CE88EC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A9CE88F8()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1A9CE8904()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A9CE8910()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1A9CE891C()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1A9CE8928()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1A9CE8934()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1A9CE8940()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1A9CE894C()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1A9CE8958()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1A9CE8964()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1A9CE8970()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1A9CE897C()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1A9CE8988()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1A9CE8994()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1A9CE89A0()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1A9CE89AC()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1A9CE89B8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A9CE89C4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1A9CE89D0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A9CE89DC()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1A9CE89E8()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A9CE89F4()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1A9CE8A00()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1A9CE8A0C()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1A9CE8A18()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1A9CE8A24()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1A9CE8A30()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1A9CE8A3C()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1A9CE8A48()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1A9CE8A54()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1A9CE8A60()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1A9CE8A6C()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_1A9CE8A78()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A9CE8A84()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1A9CE8A90()
{
  return MEMORY[0x1E0DECC38]();
}

uint64_t sub_1A9CE8A9C()
{
  return MEMORY[0x1E0DECC40]();
}

uint64_t sub_1A9CE8AA8()
{
  return MEMORY[0x1E0DECC48]();
}

uint64_t sub_1A9CE8AB4()
{
  return MEMORY[0x1E0DECC58]();
}

uint64_t sub_1A9CE8AC0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A9CE8ACC()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1A9CE8AD8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1A9CE8AE4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1A9CE8AF0()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1A9CE8AFC()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A9CE8B08()
{
  return MEMORY[0x1E0DECD78]();
}

uint64_t sub_1A9CE8B14()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1A9CE8B20()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A9CE8B2C()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1A9CE8B38()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1A9CE8B44()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1A9CE8B50()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1A9CE8B5C()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1A9CE8B68()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1A9CE8B74()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1A9CE8B80()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1A9CE8B8C()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t sub_1A9CE8B98()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1A9CE8BA4()
{
  return MEMORY[0x1E0DED5F8]();
}

uint64_t sub_1A9CE8BB0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A9CE8BBC()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1A9CE8BC8()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1A9CE8BD4()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1A9CE8BE0()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A9CE8BEC()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1A9CE8BF8()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1A9CE8C04()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1A9CE8C10()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A9CE8C1C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A9CE8C28()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A9CE8C34()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A9CE8C40()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1A9CE8C4C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A9CE8C58()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A9CE8C64()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1A9CE8C70()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1A9CE8C7C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A9CE8C88()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1A9CE8C94()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1A9CE8CA0()
{
  return MEMORY[0x1E0CB2780]();
}

uint64_t sub_1A9CE8CAC()
{
  return MEMORY[0x1E0CB2788]();
}

uint64_t sub_1A9CE8CB8()
{
  return MEMORY[0x1E0CB27B8]();
}

uint64_t sub_1A9CE8CC4()
{
  return MEMORY[0x1E0CB27C0]();
}

uint64_t sub_1A9CE8CD0()
{
  return MEMORY[0x1E0CB27D0]();
}

uint64_t sub_1A9CE8CDC()
{
  return MEMORY[0x1E0CB27E0]();
}

uint64_t sub_1A9CE8CE8()
{
  return MEMORY[0x1E0CB27F0]();
}

uint64_t sub_1A9CE8CF4()
{
  return MEMORY[0x1E0CB2828]();
}

uint64_t sub_1A9CE8D00()
{
  return MEMORY[0x1E0CB2830]();
}

uint64_t sub_1A9CE8D0C()
{
  return MEMORY[0x1E0CB2840]();
}

uint64_t sub_1A9CE8D18()
{
  return MEMORY[0x1E0CB2848]();
}

uint64_t sub_1A9CE8D24()
{
  return MEMORY[0x1E0DEE7C8]();
}

uint64_t sub_1A9CE8D30()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1A9CE8D3C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1A9CE8D48()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t BPSBridgeTintColor()
{
  return MEMORY[0x1E0D03568]();
}

uint64_t BPSPillSelectedColor()
{
  return MEMORY[0x1E0D03598]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x1E0C9BFB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
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

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x1E0C9D520](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
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

NSSet *HKCategoryValueSleepAnalysisAsleepValues(void)
{
  return (NSSet *)MEMORY[0x1E0CB49B0]();
}

uint64_t HKDateFormatterFromTemplate()
{
  return MEMORY[0x1E0D2F400]();
}

uint64_t HKHealthTintColor()
{
  return MEMORY[0x1E0D2F480]();
}

uint64_t HKLocalizedStringForDateAndTemplate()
{
  return MEMORY[0x1E0D2F4A8]();
}

uint64_t HKSPActivePairedDeviceApplicationsInstalledDistributedNotification()
{
  return MEMORY[0x1E0DA8280]();
}

uint64_t HKSPActivePairedDeviceApplicationsUninstalledDistributedNotification()
{
  return MEMORY[0x1E0DA8288]();
}

uint64_t HKSPAnalyticsScheduleChangeContext()
{
  return MEMORY[0x1E0DA8298]();
}

uint64_t HKSPCurrentDateProvider()
{
  return MEMORY[0x1E0DA82B8]();
}

uint64_t HKSPDayForWeekdays()
{
  return MEMORY[0x1E0DA82C0]();
}

uint64_t HKSPDaysForWeekdaysInCalendar()
{
  return MEMORY[0x1E0DA82E0]();
}

uint64_t HKSPDefaultScheduleProvider()
{
  return MEMORY[0x1E0DA82E8]();
}

uint64_t HKSPEnumerateDaysOfWeekInCalendar()
{
  return MEMORY[0x1E0DA82F0]();
}

uint64_t HKSPIdentifierStringForWeekdays()
{
  return MEMORY[0x1E0DA82F8]();
}

uint64_t HKSPIsRemoveSpacesForTimeFormatEnabled()
{
  return MEMORY[0x1E0DA8300]();
}

uint64_t HKSPScreenTimeURL()
{
  return MEMORY[0x1E0DA8348]();
}

uint64_t HKSPSleepURL()
{
  return MEMORY[0x1E0DA8438]();
}

uint64_t HKSPSleepURLWithProvenanceInfo()
{
  return MEMORY[0x1E0DA8440]();
}

uint64_t HKSPWeekdayDaysInCalendar()
{
  return MEMORY[0x1E0DA8468]();
}

uint64_t HKSPWeekdaysAreConsecutiveInCalendar()
{
  return MEMORY[0x1E0DA8470]();
}

uint64_t HKSPWeekdaysFromDay()
{
  return MEMORY[0x1E0DA8480]();
}

uint64_t HKSPWeekdaysIsSingleDay()
{
  return MEMORY[0x1E0DA8488]();
}

uint64_t HKSPWeekdaysShiftBackOneDay()
{
  return MEMORY[0x1E0DA8490]();
}

uint64_t HKSPWeekendDaysInCalendar()
{
  return MEMORY[0x1E0DA84A0]();
}

uint64_t HKTimePeriodString()
{
  return MEMORY[0x1E0D2F508]();
}

uint64_t HKTimePeriodStringWithFonts()
{
  return MEMORY[0x1E0D2F510]();
}

uint64_t NSGregorianCalendarDayForHKSPDay()
{
  return MEMORY[0x1E0DA84D0]();
}

uint64_t NSStringForHKSPDay()
{
  return MEMORY[0x1E0DA84D8]();
}

uint64_t NSStringFromHKSPSleepScheduleState()
{
  return MEMORY[0x1E0DA84E0]();
}

uint64_t NSStringFromHKSPWeekdays()
{
  return MEMORY[0x1E0DA84E8]();
}

uint64_t NSStringFromTLAlertPlaybackCompletionType()
{
  return MEMORY[0x1E0DBF728]();
}

uint64_t ResetLocaleDependentFormatters()
{
  return MEMORY[0x1E0D2F8F0]();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _HKCategoryValueSleepAnalysisDefaultAsleepValue()
{
  return MEMORY[0x1E0CB7108]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1E0CB7190]();
}

uint64_t _UIBarsApplyChromelessEverywhere()
{
  return MEMORY[0x1E0DC5768]();
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

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1E0DEE9F8]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

uint64_t lrint(long double __x)
{
  return MEMORY[0x1E0C83C18](__x);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x1E0DEED18]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x1E0DEED28]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
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

