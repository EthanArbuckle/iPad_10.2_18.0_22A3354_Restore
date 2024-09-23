uint64_t static ContinuityDisplayProfile.profile.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v0 = sub_2479B7854();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v14 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25444DBF8);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25444DC08);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80);
  v9 = (v8 + 32) & ~v8;
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2479B7AF0;
  v11 = *(int *)(v7 + 48);
  sub_2479B7830();
  *(_QWORD *)(v10 + v9 + v11) = _s26SpringBoardDisplayServices010ContinuityC7ProfileO13sceneRequestsSay13ShellSceneKit0J7RequestVGvgZ_0();
  sub_2479B66F4(v10);
  sub_2479B7848();
  sub_2479B7714();
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v4, v6, v0);
  v12 = sub_2479B7890();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  return v12;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249586858]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2479B66F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25444DC08);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25444DC18);
  v6 = sub_2479B789C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2479B7780(v12, (uint64_t)v5);
    result = sub_2479B693C((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_2479B783C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_2479B690C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2479B693C(uint64_t a1)
{
  uint64_t v2;

  sub_2479B783C();
  sub_2479B77C8(&qword_25444DC00, MEMORY[0x24BE90600]);
  v2 = sub_2479B7860();
  return sub_2479B69A0(a1, v2);
}

unint64_t sub_2479B69A0(uint64_t a1, uint64_t a2)
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
  v5 = sub_2479B783C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
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
      sub_2479B77C8(&qword_2576D1FD8, MEMORY[0x24BE90608]);
      v14 = sub_2479B786C();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

char *sub_2479B6AD8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576D1FE0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_2479B6BD0(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25444DC20);
  v10 = *(_QWORD *)(sub_2479B7824() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_2479B7824() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *_s26SpringBoardDisplayServices010ContinuityC7ProfileO13sceneRequestsSay13ShellSceneKit0J7RequestVGvgZ_0()
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
  void *v22;
  id v23;
  id v24;
  id v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  id v33;
  id v34;
  char *v35;
  char *v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  id v40;
  id v41;
  char *v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  size_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  char *v55;
  void *v56;
  uint64_t v57;
  char *v58;
  id v59;
  char *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double *v70;
  double v71;
  double v72;
  char *v73;
  double v74;
  char *v75;
  char *v76;
  id v77;
  char *v78;
  unint64_t v79;
  unint64_t v80;
  void (*v81)(char *, uint64_t);
  char v82;
  uint64_t v84;
  id v85;
  char *v86;
  char *v87;
  id v88;
  id v89;
  char *v90;
  id v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  void (*v96)(char *, char *, uint64_t);
  unint64_t v97;
  id v98;
  uint64_t v99;

  v0 = sub_2479B7824();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v95 = (char *)&v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v90 = (char *)&v84 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v84 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v87 = (char *)&v84 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v94 = (char *)&v84 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v86 = (char *)&v84 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v93 = (char *)&v84 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v84 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v84 - v20;
  v22 = (void *)sub_2479B7878();
  v89 = (id)objc_opt_self();
  v23 = objc_msgSend(v89, sel_identityForDaemonJobLabel_, v22);

  v88 = (id)objc_opt_self();
  v24 = objc_msgSend(v88, sel_identityForProcessIdentity_, v23);

  v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD778]), sel_init);
  objc_msgSend(v25, sel_setPreferredLevel_, 0.0);
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0F58]), sel_init);
  v91 = v25;
  v98 = v24;
  sub_2479B780C();
  v99 = v1;
  v26 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  v92 = v21;
  v26(v19, v21, v0);
  v27 = (char *)sub_2479B6BD0(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v29 = *((_QWORD *)v27 + 2);
  v28 = *((_QWORD *)v27 + 3);
  v30 = v27;
  if (v29 >= v28 >> 1)
    v30 = (char *)sub_2479B6BD0(v28 > 1, v29 + 1, 1, v27);
  *((_QWORD *)v30 + 2) = v29 + 1;
  v31 = v30;
  v97 = (*(unsigned __int8 *)(v99 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v99 + 80);
  v32 = *(_QWORD *)(v99 + 72);
  v96 = *(void (**)(char *, char *, uint64_t))(v99 + 32);
  v96(&v30[v97 + v32 * v29], v19, v0);
  if (objc_msgSend((id)objc_opt_self(), sel_isSupported))
  {
    v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD778]), sel_init);
    objc_msgSend(v33, sel_setPreferredLevel_, *MEMORY[0x24BEB0FF0]);
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0F90]), sel_init);
    v34 = v98;
    v85 = v33;
    v35 = v93;
    sub_2479B780C();
    v36 = v86;
    v26(v86, v35, v0);
    v38 = *((_QWORD *)v30 + 2);
    v37 = *((_QWORD *)v30 + 3);
    if (v38 >= v37 >> 1)
      v30 = (char *)sub_2479B6BD0(v37 > 1, v38 + 1, 1, v30);
    *((_QWORD *)v30 + 2) = v38 + 1;
    v31 = v30;
    v96(&v30[v97 + v38 * v32], v36, v0);

    (*(void (**)(char *, uint64_t))(v99 + 8))(v93, v0);
  }
  if (objc_msgSend((id)objc_opt_self(), sel_isSupported))
  {
    v39 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD778]), sel_init);
    objc_msgSend(v39, sel_setPreferredLevel_, *MEMORY[0x24BEB0FF8]);
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BEB0F98]), sel_init);
    v40 = v98;
    v41 = v39;
    v42 = v94;
    sub_2479B780C();
    v43 = v87;
    v26(v87, v42, v0);
    v45 = *((_QWORD *)v31 + 2);
    v44 = *((_QWORD *)v31 + 3);
    v46 = (size_t)v31;
    if (v45 >= v44 >> 1)
      v46 = sub_2479B6BD0(v44 > 1, v45 + 1, 1, v31);
    *(_QWORD *)(v46 + 16) = v45 + 1;
    v31 = (char *)v46;
    v96((char *)(v46 + v97 + v45 * v32), v43, v0);

    (*(void (**)(char *, uint64_t))(v99 + 8))(v94, v0);
  }
  v47 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v48 = objc_msgSend(v47, sel_bundleIdentifier);

  if (!v48)
    goto LABEL_46;
  v49 = sub_2479B7884();
  v51 = v50;

  if (v49 == 0xD000000000000015 && v51 == 0x80000002479B7D90
    || (sub_2479B78A8() & 1) != 0
    || v49 == 0xD00000000000001FLL && v51 == 0x80000002479B7DB0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v82 = sub_2479B78A8();
    swift_bridgeObjectRelease();
    if ((v82 & 1) == 0)
    {
LABEL_46:
      (*(void (**)(char *, uint64_t))(v99 + 8))(v92, v0);

      return v31;
    }
  }
  v52 = (void *)sub_2479B7878();
  v53 = objc_msgSend(v89, sel_identityForAngelJobLabel_, v52);

  v54 = objc_msgSend(v88, sel_identityForProcessIdentity_, v53);
  v55 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD778]), sel_init);
  v56 = v55;
  v57 = *((_QWORD *)v31 + 2);
  v94 = v55;
  if (v57)
  {
    v89 = v54;
    v58 = &v31[v97];
    v93 = v31;
    swift_bridgeObjectRetain_n();
    v59 = v56;
    v60 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      v26(v8, v58, v0);
      v61 = (void *)sub_2479B7818();
      if (v61)
      {
        v62 = v61;
        objc_msgSend(v61, sel_preferredLevel);
        v64 = v63;

        (*(void (**)(char *, uint64_t))(v99 + 8))(v8, v0);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v60 = sub_2479B6AD8(0, *((_QWORD *)v60 + 2) + 1, 1, v60);
        v66 = *((_QWORD *)v60 + 2);
        v65 = *((_QWORD *)v60 + 3);
        if (v66 >= v65 >> 1)
          v60 = sub_2479B6AD8((char *)(v65 > 1), v66 + 1, 1, v60);
        *((_QWORD *)v60 + 2) = v66 + 1;
        *(_QWORD *)&v60[8 * v66 + 32] = v64;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v99 + 8))(v8, v0);
      }
      v58 += v32;
      --v57;
    }
    while (v57);
    v31 = v93;
    swift_bridgeObjectRelease_n();
    v54 = v89;
    v67 = *((_QWORD *)v60 + 2);
    if (v67)
      goto LABEL_28;
  }
  else
  {
    v73 = v55;
    v60 = (char *)MEMORY[0x24BEE4AF8];
    v67 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v67)
    {
LABEL_28:
      v68 = *((double *)v60 + 4);
      v69 = v67 - 1;
      if (v67 != 1)
      {
        v70 = (double *)(v60 + 40);
        do
        {
          v71 = *v70++;
          v72 = v71;
          if (v68 < v71)
            v68 = v72;
          --v69;
        }
        while (v69);
      }
      goto LABEL_36;
    }
  }
  v68 = 0.0;
LABEL_36:
  swift_bridgeObjectRelease();
  v74 = 1.0;
  if (v67)
    v74 = v68 + 1.0;
  v75 = v94;
  objc_msgSend(v94, sel_setPreferredLevel_, v74);

  objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification()), sel_init);
  v76 = v75;
  v77 = v54;
  v78 = v90;
  sub_2479B780C();
  v26(v95, v78, v0);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v31 = (char *)sub_2479B6BD0(0, *((_QWORD *)v31 + 2) + 1, 1, v31);
  v80 = *((_QWORD *)v31 + 2);
  v79 = *((_QWORD *)v31 + 3);
  if (v80 >= v79 >> 1)
    v31 = (char *)sub_2479B6BD0(v79 > 1, v80 + 1, 1, v31);
  *((_QWORD *)v31 + 2) = v80 + 1;
  v96(&v31[v97 + v80 * v32], v95, v0);

  v81 = *(void (**)(char *, uint64_t))(v99 + 8);
  v81(v78, v0);
  v81(v92, v0);
  return v31;
}

unint64_t sub_2479B7714()
{
  unint64_t result;

  result = qword_25444DC10;
  if (!qword_25444DC10)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25444DC10);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContinuityDisplayProfile()
{
  return &type metadata for ContinuityDisplayProfile;
}

uint64_t type metadata accessor for ContinuityDisplayProfile.ContinuityDragAndDropSceneSpecification()
{
  return objc_opt_self();
}

uint64_t sub_2479B7780(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25444DC08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2479B77C8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2479B783C();
    result = MEMORY[0x249586864](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2479B780C()
{
  return MEMORY[0x24BE905C8]();
}

uint64_t sub_2479B7818()
{
  return MEMORY[0x24BE905D0]();
}

uint64_t sub_2479B7824()
{
  return MEMORY[0x24BE905D8]();
}

uint64_t sub_2479B7830()
{
  return MEMORY[0x24BE905E8]();
}

uint64_t sub_2479B783C()
{
  return MEMORY[0x24BE905F0]();
}

uint64_t sub_2479B7848()
{
  return MEMORY[0x24BE90610]();
}

uint64_t sub_2479B7854()
{
  return MEMORY[0x24BE90618]();
}

uint64_t sub_2479B7860()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2479B786C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2479B7878()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2479B7884()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2479B7890()
{
  return MEMORY[0x24BE90620]();
}

uint64_t sub_2479B789C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2479B78A8()
{
  return MEMORY[0x24BEE3A30]();
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

