unint64_t sub_244AF6BCC()
{
  return 0xD000000000000025;
}

uint64_t Constraints.toTMLConstraints(logger:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
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
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  void (*v24)(char *, uint64_t, uint64_t);
  int v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  char *v29;
  uint8_t *v30;
  uint8_t *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  char *v35;
  uint8_t *v36;
  uint8_t *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t *v68;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  _QWORD v92[2];
  uint64_t v93;
  char *v94;
  char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;

  v103 = a1;
  v102 = a2;
  v3 = sub_244B171F4();
  MEMORY[0x24BDAC7A8](v3);
  v92[1] = (char *)v92 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244B16F0C();
  v100 = *(_QWORD *)(v5 - 8);
  v101 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v99 = (char *)v92 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244B17074();
  v97 = *(_QWORD *)(v7 - 8);
  v98 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v95 = (char *)v92 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v96 = (char *)v92 - v10;
  v11 = sub_244B1705C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v94 = (char *)v92 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v92 - v15;
  v17 = sub_244B16B4C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v92 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (_QWORD *)((char *)v92 - v22);
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v93 = v2;
  v24((char *)v92 - v22, v2, v17);
  v25 = (*(uint64_t (**)(uint64_t *, uint64_t))(v18 + 88))(v23, v17);
  if (v25 == *MEMORY[0x24BEB80C8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v18 + 96))(v23, v17);
    (*(void (**)(char *, uint64_t *, uint64_t))(v12 + 32))(v16, v23, v11);
    v26 = sub_244B17110();
    v27 = sub_244B172D8();
    v28 = v12;
    if (os_log_type_enabled(v26, v27))
    {
      v29 = v16;
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_244AF5000, v26, v27, "toTMLConstraints schema", v30, 2u);
      v31 = v30;
      v16 = v29;
      MEMORY[0x24951F40C](v31, -1, -1);
    }

    sub_244AF75AC();
    if ((sub_244B17314() & 1) != 0)
    {
      if (qword_2573DAEF0 != -1)
        swift_once();
      v32 = sub_244B17128();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573DBA20);
      v33 = sub_244B17110();
      v34 = sub_244B172B4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = v16;
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_244AF5000, v33, v34, "Converting schema into grammar", v36, 2u);
        v37 = v36;
        v16 = v35;
        MEMORY[0x24951F40C](v37, -1, -1);
      }

      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v94, v16, v11);
      v103 = v11;
      v38 = v12;
      v39 = v96;
      sub_244B17068();
      v41 = v97;
      v40 = v98;
      (*(void (**)(char *, char *, uint64_t))(v97 + 16))(v95, v39, v98);
      v42 = v99;
      sub_244B16F00();
      sub_244AF7684(&qword_2573DAF30, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8C50], MEMORY[0x24BEB8C60]);
      v43 = v101;
      v44 = sub_244B17410();
      v46 = v45;
      (*(void (**)(char *, uint64_t))(v100 + 8))(v42, v43);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v39, v40);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v16, v103);
      v47 = v102;
      *v102 = v44;
      v47[1] = v46;
      v48 = *MEMORY[0x24BE78D38];
      v49 = sub_244B16978();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 104))(v47, v48, v49);
      v50 = *MEMORY[0x24BE78D48];
      v51 = sub_244B16984();
      v52 = *(_QWORD *)(v51 - 8);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v52 + 104))(v47, v50, v51);
      return (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v47, 0, 1, v51);
    }
    sub_244B166D8();
    swift_allocObject();
    sub_244B166CC();
    sub_244AF7684(&qword_2573DAF20, (uint64_t (*)(uint64_t))MEMORY[0x24BE3B648], MEMORY[0x24BE3B658]);
    v62 = v104;
    v63 = sub_244B166C0();
    if (v62)
    {
      swift_release();
      v65 = v62;
LABEL_16:
      v105 = 0;
      v106 = 0xE000000000000000;
      sub_244B17374();
      sub_244B17218();
      v107 = v65;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF28);
      sub_244B173C8();
      v66 = v105;
      v67 = v106;
      sub_244AF7558();
      swift_allocError();
      *v68 = v66;
      v68[1] = v67;
      swift_willThrow();
      MEMORY[0x24951F334](v65);
      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v16, v11);
    }
    v81 = v63;
    v82 = v64;
    swift_release();
    sub_244B171E8();
    v83 = sub_244B171DC();
    if (!v84)
    {
      sub_244AF7558();
      v65 = swift_allocError();
      *v91 = 0xD00000000000002BLL;
      v91[1] = 0x8000000244B17D60;
      swift_willThrow();
      sub_244AF7628(v81, v82);
      goto LABEL_16;
    }
    v85 = v83;
    v86 = v84;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v16, v11);
    sub_244AF7628(v81, v82);
    v87 = v102;
    *v102 = v85;
    v87[1] = v86;
    v47 = v87;
    v88 = *MEMORY[0x24BE78D80];
    v89 = sub_244B1699C();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 104))(v47, v88, v89);
    v61 = (unsigned int *)MEMORY[0x24BE78D58];
  }
  else if (v25 == *MEMORY[0x24BEB80D0])
  {
    (*(void (**)(uint64_t *, uint64_t))(v18 + 96))(v23, v17);
    v53 = *v23;
    v54 = v23[1];
    v55 = sub_244B17110();
    v56 = sub_244B172D8();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_244AF5000, v55, v56, "toTMLConstraints grammar", v57, 2u);
      MEMORY[0x24951F40C](v57, -1, -1);
    }

    v58 = v102;
    *v102 = v53;
    v58[1] = v54;
    v47 = v58;
    v59 = *MEMORY[0x24BE78D38];
    v60 = sub_244B16978();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 104))(v47, v59, v60);
    v61 = (unsigned int *)MEMORY[0x24BE78D48];
  }
  else
  {
    if (v25 != *MEMORY[0x24BEB80C0])
    {
      v105 = 0;
      v106 = 0xE000000000000000;
      sub_244B17374();
      swift_bridgeObjectRelease();
      v105 = 0xD00000000000002FLL;
      v106 = 0x8000000244B17D00;
      v24(v21, v93, v17);
      sub_244B17200();
      sub_244B17218();
      swift_bridgeObjectRelease();
      sub_244B17218();
      v78 = v105;
      v79 = v106;
      sub_244AF7558();
      swift_allocError();
      *v80 = v78;
      v80[1] = v79;
      swift_willThrow();
      return (*(uint64_t (**)(uint64_t *, uint64_t))(v18 + 8))(v23, v17);
    }
    (*(void (**)(uint64_t *, uint64_t))(v18 + 96))(v23, v17);
    v70 = *v23;
    v71 = v23[1];
    v72 = sub_244B17110();
    v73 = sub_244B172D8();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_244AF5000, v72, v73, "toTMLConstraints partialGrammar", v74, 2u);
      MEMORY[0x24951F40C](v74, -1, -1);
    }

    v75 = v102;
    *v102 = v70;
    v75[1] = v71;
    v47 = v75;
    v76 = *MEMORY[0x24BE78D70];
    v77 = sub_244B16990();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 104))(v47, v76, v77);
    v61 = (unsigned int *)MEMORY[0x24BE78D50];
  }
  v90 = *v61;
  v51 = sub_244B16984();
  v52 = *(_QWORD *)(v51 - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v52 + 104))(v47, v90, v51);
  return (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v47, 0, 1, v51);
}

unint64_t sub_244AF7558()
{
  unint64_t result;

  result = qword_2573DAF10;
  if (!qword_2573DAF10)
  {
    result = MEMORY[0x24951F394](&unk_244B17884, &_s16ConstraintsErrorON);
    atomic_store(result, (unint64_t *)&qword_2573DAF10);
  }
  return result;
}

uint64_t sub_244AF759C(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_244AF75AC()
{
  unint64_t result;

  result = qword_2573DAF18;
  if (!qword_2573DAF18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2573DAF18);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24951F37C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_244AF7628(uint64_t a1, unint64_t a2)
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

uint64_t sub_244AF7684(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24951F394](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *_s16ConstraintsErrorOwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s16ConstraintsErrorOwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s16ConstraintsErrorOwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *_s16ConstraintsErrorOwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s16ConstraintsErrorOwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s16ConstraintsErrorOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_244AF77F8()
{
  return 0;
}

ValueMetadata *_s16ConstraintsErrorOMa()
{
  return &_s16ConstraintsErrorON;
}

uint64_t dispatch thunk of InferenceProviderWithPrewarm.prewarmHint(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_244AF7894;
  return v9(a1, a2, a3);
}

uint64_t sub_244AF7894()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244AF78DC@<X0>(uint64_t a1@<X8>)
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
  char *v15;
  uint64_t v16;
  int *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _BYTE v28[40];

  v2 = v1;
  v27 = a1;
  sub_244B16918();
  MEMORY[0x24BDAC7A8]();
  v26 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244B173BC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_244B16720();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244B17128();
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v16 + 16))(v15, v2);
  v17 = (int *)_s18InstrumentedTokensVMa(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v2 + v17[5], v10);
  v18 = (uint64_t *)(v2 + v17[6]);
  v19 = v18[1];
  v25 = *v18;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v2 + v17[8], v6);
  v20 = sub_244B17158();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v5, 1, 1, v20);
  v21 = v2 + v17[9];
  swift_bridgeObjectRetain();
  v22 = (uint64_t)v26;
  sub_244B16924();
  sub_244AF7B54(v21, (uint64_t)v28);
  return sub_244AF7B98((uint64_t)v15, (uint64_t)v13, v25, v19, (uint64_t)v9, (uint64_t)v5, 0, v22, v27, (uint64_t)v28, *(unsigned int *)(v2 + v17[10]) | ((unint64_t)*(unsigned __int8 *)(v2 + v17[10] + 4) << 32));
}

uint64_t _s18InstrumentedTokensVMa(uint64_t a1)
{
  return sub_244AF7E7C(a1, qword_2573DAFD0);
}

uint64_t sub_244AF7B54(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_244AF7B98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, unint64_t a11)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
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
  uint64_t v54;
  char v55;

  v51 = a7;
  v52 = a8;
  v50 = a6;
  v36[0] = a5;
  v36[1] = a3;
  v39 = a2;
  v44 = a4;
  v45 = a10;
  v53 = a11;
  v54 = HIDWORD(a11) & 1;
  v16 = sub_244B17128();
  v41 = *(_QWORD *)(v16 - 8);
  v17 = v41;
  MEMORY[0x24BDAC7A8]();
  v43 = (char *)v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_244B1717C();
  v48 = *(_QWORD *)(v19 - 8);
  v49 = v19;
  MEMORY[0x24BDAC7A8]();
  v42 = (char *)v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (int *)_s18InstrumentedTokensV13AsyncIteratorVMa(0);
  v47 = a9 + v21[9];
  v22 = v47;
  v23 = sub_244B17158();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  v46 = v21[13];
  *(_QWORD *)(a9 + v46) = 0;
  v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v37(a9, a1, v16);
  v24 = a9 + v21[5];
  v38 = sub_244B16720();
  v40 = *(_QWORD *)(v38 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v24, a2, v38);
  v25 = (_QWORD *)(a9 + v21[6]);
  v26 = v44;
  *v25 = a3;
  v25[1] = v26;
  v27 = a9 + v21[7];
  v28 = sub_244B173BC();
  v29 = *(_QWORD *)(v28 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 16))(v27, a5, v28);
  v30 = v45;
  sub_244AF7B54(v45, a9 + v21[11]);
  v37((uint64_t)v43, a1, v16);
  swift_bridgeObjectRetain();
  v55 = v54;
  v31 = v42;
  sub_244B17164();
  __swift_destroy_boxed_opaque_existential_1(v30);
  (*(void (**)(_QWORD, uint64_t))(v29 + 8))(v36[0], v28);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v38);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(a1, v16);
  (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(a9 + v21[8], v31, v49);
  sub_244AF7ED0(v50, v47);
  *(_QWORD *)(a9 + v46) = v51;
  v32 = a9 + v21[10];
  v33 = sub_244B16918();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v32, v52, v33);
  v35 = a9 + v21[12];
  *(_DWORD *)v35 = v53;
  *(_BYTE *)(v35 + 4) = v54;
  return result;
}

uint64_t _s18InstrumentedTokensV13AsyncIteratorVMa(uint64_t a1)
{
  return sub_244AF7E7C(a1, (uint64_t *)&unk_2573DB078);
}

uint64_t sub_244AF7E7C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
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

uint64_t sub_244AF7ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_244AF7F18(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[6] = a1;
  v2[7] = v1;
  v3 = sub_244B17158();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF50);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v4 = sub_244B17128();
  v2[17] = v4;
  v2[18] = *(_QWORD *)(v4 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF58);
  v2[22] = swift_task_alloc();
  v5 = sub_244B16930();
  v2[23] = v5;
  v2[24] = *(_QWORD *)(v5 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  v6 = sub_244B16720();
  v2[27] = v6;
  v2[28] = *(_QWORD *)(v6 - 8);
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244AF80D4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  _QWORD *v8;

  v1 = v0[31];
  v2 = v0[27];
  v3 = v0[28];
  v4 = v0[7];
  v5 = _s18InstrumentedTokensV13AsyncIteratorVMa(0);
  v0[32] = v5;
  v6 = v4 + *(int *)(v5 + 20);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[33] = v7;
  v7(v1, v6, v2);
  v8 = (_QWORD *)swift_task_alloc();
  v0[34] = v8;
  *v8 = v0;
  v8[1] = sub_244AF8174;
  return sub_244B1690C();
}

uint64_t sub_244AF8174()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244AF81D8()
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
  void (*v12)(uint64_t, uint64_t, uint64_t);
  int v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(uint64_t, uint64_t);
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
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t result;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  BOOL v83;
  uint64_t v84;
  void (*v85)(uint64_t, uint64_t);
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  os_log_type_t type;
  uint64_t typea;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(uint64_t, uint64_t, uint64_t);
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(uint64_t, uint64_t, uint64_t);
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(uint64_t, uint64_t);
  uint64_t v110;
  void (*v111)(uint64_t, uint64_t, uint64_t);
  uint64_t v112;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 176);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = *(_QWORD *)(v0 + 256);
    v5 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 64);
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 56);
    sub_244AF8EA0(v3, &qword_2573DAF58);
    v9 = v8 + *(int *)(v4 + 36);
    sub_244AF8E5C(v9, v5, &qword_2573DAF40);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 120), &qword_2573DAF40);
    }
    else
    {
      v39 = *(_QWORD *)(v0 + 72);
      v38 = *(_QWORD *)(v0 + 80);
      v40 = *(_QWORD *)(v0 + 64);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v39 + 32))(v38, *(_QWORD *)(v0 + 120), v40);
      sub_244B17140();
      sub_244B1714C();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
      sub_244AF8EA0(v9, &qword_2573DAF40);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56))(v9, 1, 1, v40);
    }
    v41 = *(_QWORD *)(v0 + 248);
    v42 = *(_QWORD *)(v0 + 216);
    v43 = *(_QWORD *)(v0 + 224);
    v44 = *(_QWORD *)(v0 + 184);
    v45 = *(_QWORD *)(v0 + 192);
    v46 = *(_QWORD *)(v0 + 48);
    logMetric(logger:name:startInstant:)(*(_QWORD *)(v0 + 56), 0xD000000000000019, 0x8000000244B17DC0);
    (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v41, v42);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v46, 1, 1, v44);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v0 + 200);
  v10 = *(_QWORD *)(v0 + 208);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
  v12(v10, v3, v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v11, v10, v1);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v11, v1);
  if (v13 != *MEMORY[0x24BE78CE8])
  {
    if (v13 != *MEMORY[0x24BE78CE0])
    {
      v77 = *(_QWORD *)(v0 + 192);
      v76 = *(_QWORD *)(v0 + 200);
      v78 = *(_QWORD *)(v0 + 184);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 216));
      (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v78);
LABEL_22:
      v88 = *(_QWORD *)(v0 + 184);
      v89 = *(_QWORD *)(v0 + 192);
      v90 = *(_QWORD *)(v0 + 48);
      v12(v90, *(_QWORD *)(v0 + 208), v88);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v89 + 56))(v90, 0, 1, v88);
LABEL_23:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v111 = v12;
    v101 = *(_QWORD *)(v0 + 248);
    v104 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
    v47 = *(_QWORD *)(v0 + 232);
    v48 = *(_QWORD *)(v0 + 216);
    v49 = *(_QWORD *)(v0 + 200);
    v50 = *(_QWORD *)(v0 + 144);
    v51 = *(_QWORD *)(v0 + 152);
    v52 = *(_QWORD *)(v0 + 136);
    v54 = *(_QWORD *)(v0 + 104);
    v53 = *(_QWORD *)(v0 + 112);
    v55 = *(_QWORD *)(v0 + 56);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 96))(v49, *(_QWORD *)(v0 + 184));
    v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF60);
    sub_244AF8E14(v49 + *(int *)(v108 + 48), v53);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v51, v55, v52);
    v104(v47, v101, v48);
    sub_244AF8E5C(v53, v54, &qword_2573DAF50);
    v56 = sub_244B17110();
    v57 = sub_244B172C0();
    v58 = os_log_type_enabled(v56, v57);
    v59 = *(_QWORD *)(v0 + 248);
    v61 = *(_QWORD *)(v0 + 224);
    v60 = *(_QWORD *)(v0 + 232);
    v62 = *(_QWORD *)(v0 + 216);
    v96 = *(_QWORD *)(v0 + 144);
    v98 = *(_QWORD *)(v0 + 136);
    v102 = *(_QWORD *)(v0 + 152);
    v63 = *(_QWORD *)(v0 + 104);
    v105 = *(_QWORD *)(v0 + 112);
    if (v58)
    {
      v91 = *(_QWORD *)(v0 + 96);
      v95 = *(_QWORD *)(v0 + 248);
      v64 = swift_slowAlloc();
      typea = swift_slowAlloc();
      v112 = typea;
      *(_DWORD *)v64 = 136315394;
      sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v65 = sub_244B17410();
      *(_QWORD *)(v0 + 16) = sub_244B139EC(v65, v66, &v112);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v67 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
      v67(v60, v62);
      *(_WORD *)(v64 + 12) = 2082;
      sub_244AF8E5C(v63, v91, &qword_2573DAF50);
      v68 = sub_244B17200();
      *(_QWORD *)(v0 + 24) = sub_244B139EC(v68, v69, &v112);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      sub_244AF8EA0(v63, &qword_2573DAF50);
      _os_log_impl(&dword_244AF5000, v56, v57, "%s received environment. Server environment %{public}s", (uint8_t *)v64, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](typea, -1, -1);
      MEMORY[0x24951F40C](v64, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v102, v98);
      sub_244AF8EA0(v105, &qword_2573DAF50);
      v67(v95, v62);
    }
    else
    {

      sub_244AF8EA0(v63, &qword_2573DAF50);
      v85 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
      v85(v60, v62);
      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v102, v98);
      sub_244AF8EA0(v105, &qword_2573DAF50);
      v85(v59, v62);
    }
    v86 = *(_QWORD *)(v0 + 200);
    sub_244AF8EA0(v86 + *(int *)(v108 + 64), &qword_2573DAF68);
    v87 = sub_244B1696C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 8))(v86, v87);
LABEL_21:
    v12 = v111;
    goto LABEL_22;
  }
  v111 = v12;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
  v15 = *(_QWORD *)(v0 + 240);
  v16 = *(_QWORD *)(v0 + 248);
  v17 = *(_QWORD *)(v0 + 216);
  v18 = *(uint64_t **)(v0 + 200);
  v19 = *(_QWORD *)(v0 + 168);
  v21 = *(_QWORD *)(v0 + 136);
  v20 = *(_QWORD *)(v0 + 144);
  v22 = *(_QWORD *)(v0 + 56);
  (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v0 + 192) + 96))(v18, *(_QWORD *)(v0 + 184));
  v23 = *v18;
  v24 = v18[1];
  v100 = *(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16);
  v103 = v23;
  v100(v19, v22, v21);
  v14(v15, v16, v17);
  v25 = v24;
  swift_bridgeObjectRetain();
  v26 = sub_244B17110();
  v27 = sub_244B172C0();
  v28 = os_log_type_enabled(v26, v27);
  v29 = *(_QWORD *)(v0 + 240);
  v31 = *(_QWORD *)(v0 + 216);
  v30 = *(_QWORD *)(v0 + 224);
  v32 = *(_QWORD *)(v0 + 168);
  v33 = *(_QWORD *)(v0 + 136);
  v107 = *(_QWORD *)(v0 + 144);
  if (v28)
  {
    v97 = *(_QWORD *)(v0 + 136);
    v34 = swift_slowAlloc();
    v94 = swift_slowAlloc();
    v112 = v94;
    *(_DWORD *)v34 = 136315395;
    type = v27;
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v35 = sub_244B17410();
    *(_QWORD *)(v0 + 32) = sub_244B139EC(v35, v36, &v112);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v37 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v37(v29, v31);
    *(_WORD *)(v34 + 12) = 2081;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_244B139EC(v103, v25, &v112);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_244AF5000, v26, type, "%s received token %{private}s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v94, -1, -1);
    MEMORY[0x24951F40C](v34, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v32, v97);
  }
  else
  {
    v37 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
    v37(v29, v31);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v32, v33);
  }
  v70 = *(_QWORD *)(v0 + 56);
  v71 = *(_QWORD *)(v0 + 248);
  v72 = *(int **)(v0 + 256);
  v73 = v72[13];
  v74 = *(_QWORD *)(v0 + 216);
  if (*(_QWORD *)(v70 + v73))
  {
    result = ((uint64_t (*)(_QWORD, _QWORD))v37)(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 216));
  }
  else
  {
    v109 = v37;
    v79 = *(_QWORD *)(v0 + 160);
    v80 = *(_QWORD *)(v0 + 136);
    v99 = *(_QWORD *)(v0 + 128);
    v106 = *(_QWORD *)(v0 + 72);
    v110 = *(_QWORD *)(v0 + 64);
    sub_244B17170();
    v100(v79, v70, v80);
    v81 = *(_BYTE *)(v70 + v72[12] + 4);
    swift_bridgeObjectRetain();
    LOBYTE(v112) = v81;
    sub_244B17134();
    v109(v71, v74);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v106 + 56))(v99, 0, 1, v110);
    result = sub_244AF7ED0(v99, v70 + v72[9]);
  }
  v82 = *(_QWORD *)(v70 + v73);
  v83 = __OFADD__(v82, 1);
  v84 = v82 + 1;
  if (!v83)
  {
    *(_QWORD *)(v70 + v73) = v84;
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_244AF8B48()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 216));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244AF8C54(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_244AF7894;
  return sub_244AF7F18(a1);
}

uint64_t sub_244AF8CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v6;

  v4[4] = a3;
  v4[5] = a4;
  v4[3] = a2;
  v6 = (_QWORD *)swift_task_alloc();
  v4[6] = v6;
  *v6 = v4;
  v6[1] = sub_244AF8CFC;
  return sub_244AF7F18(a1);
}

uint64_t sub_244AF8CFC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  if (*(_QWORD *)(v2 + 24))
  {
    swift_getObjectType();
    sub_244B17230();
  }
  return swift_task_switch();
}

uint64_t sub_244AF8D94()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD **)(v0 + 40);
  *(_QWORD *)(v0 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF28);
  swift_willThrowTypedImpl();
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244AF8DFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_244AF78DC(a1);
  return sub_244AFAA00(v1);
}

uint64_t sub_244AF8E14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244AF8E5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_244AF8EA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_244AF8EDC(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v30 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v30 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244B17128();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_244B16720();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = a3[7];
    v14 = (uint64_t *)((char *)a1 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = (char *)a1 + v13;
    v18 = (char *)a2 + v13;
    v19 = sub_244B1693C();
    v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
    swift_bridgeObjectRetain();
    v20(v17, v18, v19);
    v21 = a3[8];
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    v24 = sub_244B173BC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
    v25 = a3[9];
    v26 = *(_OWORD *)((char *)a2 + v25 + 24);
    *(_OWORD *)((char *)a1 + v25 + 24) = v26;
    (**(void (***)(void))(v26 - 8))();
    v27 = a3[10];
    v28 = (char *)a1 + v27;
    v29 = (char *)a2 + v27;
    *(_DWORD *)v28 = *(_DWORD *)v29;
    v28[4] = v29[4];
  }
  return a1;
}

uint64_t sub_244AF9048(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = a1 + a2[7];
  v8 = sub_244B1693C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + a2[8];
  v10 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return __swift_destroy_boxed_opaque_existential_1(a1 + a2[9]);
}

uint64_t sub_244AF9110(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (_QWORD *)(a1 + v11);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a1 + v12;
  v17 = a2 + v12;
  v18 = sub_244B1693C();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
  v24 = a3[9];
  v25 = *(_OWORD *)(a2 + v24 + 24);
  *(_OWORD *)(a1 + v24 + 24) = v25;
  (**(void (***)(void))(v25 - 8))();
  v26 = a3[10];
  v27 = a1 + v26;
  v28 = a2 + v26;
  *(_DWORD *)v27 = *(_DWORD *)v28;
  *(_BYTE *)(v27 + 4) = *(_BYTE *)(v28 + 4);
  return a1;
}

uint64_t sub_244AF9250(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  int v25;

  v6 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[7];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_244B1693C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v18 = a3[8];
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[9]), (uint64_t *)(a2 + a3[9]));
  v22 = a3[10];
  v23 = a1 + v22;
  v24 = (int *)(a2 + v22);
  v25 = *v24;
  *(_BYTE *)(v23 + 4) = *((_BYTE *)v24 + 4);
  *(_DWORD *)v23 = v25;
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

uint64_t sub_244AF94EC(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v6 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_244B1693C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  v19 = a3[9];
  v20 = a3[10];
  v21 = a1 + v19;
  v22 = a2 + v19;
  v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + 16) = v23;
  *(_QWORD *)(v21 + 32) = *(_QWORD *)(v22 + 32);
  v24 = a1 + v20;
  v25 = a2 + v20;
  *(_DWORD *)v24 = *(_DWORD *)v25;
  *(_BYTE *)(v24 + 4) = *(_BYTE *)(v25 + 4);
  return a1;
}

uint64_t sub_244AF9604(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
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
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_244B1693C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v21, v22, v23);
  v24 = a3[9];
  v25 = a1 + v24;
  v26 = a2 + v24;
  __swift_destroy_boxed_opaque_existential_1(a1 + v24);
  v27 = *(_OWORD *)(v26 + 16);
  *(_OWORD *)v25 = *(_OWORD *)v26;
  *(_OWORD *)(v25 + 16) = v27;
  *(_QWORD *)(v25 + 32) = *(_QWORD *)(v26 + 32);
  v28 = a3[10];
  v29 = a1 + v28;
  v30 = a2 + v28;
  *(_DWORD *)v29 = *(_DWORD *)v30;
  *(_BYTE *)(v29 + 4) = *(_BYTE *)(v30 + 4);
  return a1;
}

uint64_t sub_244AF973C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244AF9748(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;

  v6 = sub_244B17128();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_244B16720();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_12:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v16 = sub_244B1693C();
    v12 = *(_QWORD *)(v16 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v16;
      v13 = a3[7];
    }
    else
    {
      v8 = sub_244B173BC();
      v12 = *(_QWORD *)(v8 - 8);
      v13 = a3[8];
    }
    goto LABEL_12;
  }
  v14 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_244AF983C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244AF9848(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = sub_244B17128();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_244B16720();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(_QWORD *)(a1 + a4[6] + 8) = (a2 - 1);
        return result;
      }
      v16 = sub_244B1693C();
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[7];
      }
      else
      {
        v10 = sub_244B173BC();
        v14 = *(_QWORD *)(v10 - 8);
        v15 = a4[8];
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_244AF9938()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  result = sub_244B17128();
  if (v1 <= 0x3F)
  {
    result = sub_244B16720();
    if (v2 <= 0x3F)
    {
      result = sub_244B1693C();
      if (v3 <= 0x3F)
      {
        result = sub_244B173BC();
        if (v4 <= 0x3F)
        {
          swift_initStructMetadata();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_244AF9A10(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v31 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v31 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_244B17128();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_244B16720();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = a3[7];
    v14 = (uint64_t *)((char *)a1 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = (char *)a1 + v13;
    v18 = (char *)a2 + v13;
    v19 = sub_244B173BC();
    v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
    swift_bridgeObjectRetain();
    v20(v17, v18, v19);
    v21 = a3[8];
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    v24 = sub_244B1717C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
    v25 = a3[9];
    v26 = (char *)a1 + v25;
    v27 = (char *)a2 + v25;
    v28 = sub_244B17158();
    v29 = *(_QWORD *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    v32 = a3[10];
    v33 = (char *)a1 + v32;
    v34 = (char *)a2 + v32;
    v35 = sub_244B16918();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v33, v34, v35);
    v36 = a3[11];
    v37 = *(_OWORD *)((char *)a2 + v36 + 24);
    *(_OWORD *)((char *)a1 + v36 + 24) = v37;
    (**(void (***)(void))(v37 - 8))();
    v38 = a3[12];
    v39 = a3[13];
    v40 = (char *)a1 + v38;
    v41 = (char *)a2 + v38;
    *(_DWORD *)v40 = *(_DWORD *)v41;
    v40[4] = v41[4];
    *(uint64_t *)((char *)a1 + v39) = *(uint64_t *)((char *)a2 + v39);
  }
  return a1;
}

uint64_t sub_244AF9C34(uint64_t a1, int *a2)
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

  v4 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = a1 + a2[7];
  v8 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = a1 + a2[8];
  v10 = sub_244B1717C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = a1 + a2[9];
  v12 = sub_244B17158();
  v13 = *(_QWORD *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  v14 = a1 + a2[10];
  v15 = sub_244B16918();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  return __swift_destroy_boxed_opaque_existential_1(a1 + a2[11]);
}

uint64_t sub_244AF9D68(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v6 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (_QWORD *)(a1 + v11);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = a1 + v12;
  v17 = a2 + v12;
  v18 = sub_244B173BC();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = sub_244B1717C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
  v24 = a3[9];
  v25 = (void *)(a1 + v24);
  v26 = (const void *)(a2 + v24);
  v27 = sub_244B17158();
  v28 = *(_QWORD *)(v27 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v28 + 16))(v25, v26, v27);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  v30 = a3[10];
  v31 = a1 + v30;
  v32 = a2 + v30;
  v33 = sub_244B16918();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
  v34 = a3[11];
  v35 = *(_OWORD *)(a2 + v34 + 24);
  *(_OWORD *)(a1 + v34 + 24) = v35;
  (**(void (***)(void))(v35 - 8))();
  v36 = a3[12];
  v37 = a3[13];
  v38 = a1 + v36;
  v39 = a2 + v36;
  *(_DWORD *)v38 = *(_DWORD *)v39;
  *(_BYTE *)(v38 + 4) = *(_BYTE *)(v39 + 4);
  *(_QWORD *)(a1 + v37) = *(_QWORD *)(a2 + v37);
  return a1;
}

uint64_t sub_244AF9F60(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(void *, uint64_t, uint64_t);
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  int v38;

  v6 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[7];
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v18 = a3[8];
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = sub_244B1717C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  v22 = a3[9];
  v23 = (void *)(a1 + v22);
  v24 = (void *)(a2 + v22);
  v25 = sub_244B17158();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v26 + 48);
  v28 = v27(v23, 1, v25);
  v29 = v27(v24, 1, v25);
  if (!v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, void *, uint64_t))(v26 + 24))(v23, v24, v25);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v26 + 8))(v23, v25);
    goto LABEL_6;
  }
  if (v29)
  {
LABEL_6:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v26 + 16))(v23, v24, v25);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
LABEL_7:
  v31 = a3[10];
  v32 = a1 + v31;
  v33 = a2 + v31;
  v34 = sub_244B16918();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 24))(v32, v33, v34);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[11]), (uint64_t *)(a2 + a3[11]));
  v35 = a3[12];
  v36 = a1 + v35;
  v37 = (int *)(a2 + v35);
  v38 = *v37;
  *(_BYTE *)(v36 + 4) = *((_BYTE *)v37 + 4);
  *(_DWORD *)v36 = v38;
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_244AFA1A4(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
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
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v6 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[8];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = sub_244B1717C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  v19 = a3[9];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  v22 = sub_244B17158();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  v25 = a3[10];
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = sub_244B16918();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
  v29 = a3[11];
  v30 = a3[12];
  v31 = a1 + v29;
  v32 = a2 + v29;
  v33 = *(_OWORD *)(v32 + 16);
  *(_OWORD *)v31 = *(_OWORD *)v32;
  *(_OWORD *)(v31 + 16) = v33;
  *(_QWORD *)(v31 + 32) = *(_QWORD *)(v32 + 32);
  v34 = a1 + v30;
  v35 = a2 + v30;
  *(_DWORD *)v34 = *(_DWORD *)v35;
  *(_BYTE *)(v34 + 4) = *(_BYTE *)(v35 + 4);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_244AFA380(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
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
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(void *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v6 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_244B16720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[7];
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v20 = a3[8];
  v21 = a1 + v20;
  v22 = a2 + v20;
  v23 = sub_244B1717C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 40))(v21, v22, v23);
  v24 = a3[9];
  v25 = (void *)(a1 + v24);
  v26 = (void *)(a2 + v24);
  v27 = sub_244B17158();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (!v30)
  {
    if (!v31)
    {
      (*(void (**)(void *, void *, uint64_t))(v28 + 40))(v25, v26, v27);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v28 + 8))(v25, v27);
    goto LABEL_6;
  }
  if (v31)
  {
LABEL_6:
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v28 + 32))(v25, v26, v27);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
LABEL_7:
  v33 = a3[10];
  v34 = a1 + v33;
  v35 = a2 + v33;
  v36 = sub_244B16918();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 40))(v34, v35, v36);
  v37 = a3[11];
  v38 = a1 + v37;
  v39 = a2 + v37;
  __swift_destroy_boxed_opaque_existential_1(a1 + v37);
  v40 = *(_OWORD *)(v39 + 16);
  *(_OWORD *)v38 = *(_OWORD *)v39;
  *(_OWORD *)(v38 + 16) = v40;
  *(_QWORD *)(v38 + 32) = *(_QWORD *)(v39 + 32);
  v41 = a3[12];
  v42 = a3[13];
  v43 = a1 + v41;
  v44 = a2 + v41;
  *(_DWORD *)v43 = *(_DWORD *)v44;
  *(_BYTE *)(v43 + 4) = *(_BYTE *)(v44 + 4);
  *(_QWORD *)(a1 + v42) = *(_QWORD *)(a2 + v42);
  return a1;
}

uint64_t sub_244AFA5C4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244AFA5D0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_244B17128();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_244B16720();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_16:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v16 = sub_244B173BC();
    v12 = *(_QWORD *)(v16 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v16;
      v13 = a3[7];
    }
    else
    {
      v17 = sub_244B1717C();
      v12 = *(_QWORD *)(v17 - 8);
      if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
      {
        v8 = v17;
        v13 = a3[8];
      }
      else
      {
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
        v12 = *(_QWORD *)(v18 - 8);
        if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
        {
          v8 = v18;
          v13 = a3[9];
        }
        else
        {
          v8 = sub_244B16918();
          v12 = *(_QWORD *)(v8 - 8);
          v13 = a3[10];
        }
      }
    }
    goto LABEL_16;
  }
  v14 = *(_QWORD *)(a1 + a3[6] + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_244AFA710()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244AFA71C(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = sub_244B17128();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_244B16720();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(_QWORD *)(a1 + a4[6] + 8) = (a2 - 1);
        return result;
      }
      v16 = sub_244B173BC();
      v14 = *(_QWORD *)(v16 - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = v16;
        v15 = a4[7];
      }
      else
      {
        v17 = sub_244B1717C();
        v14 = *(_QWORD *)(v17 - 8);
        if (*(_DWORD *)(v14 + 84) == a3)
        {
          v10 = v17;
          v15 = a4[8];
        }
        else
        {
          v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
          v14 = *(_QWORD *)(v18 - 8);
          if (*(_DWORD *)(v14 + 84) == a3)
          {
            v10 = v18;
            v15 = a4[9];
          }
          else
          {
            v10 = sub_244B16918();
            v14 = *(_QWORD *)(v10 - 8);
            v15 = a4[10];
          }
        }
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_244AFA858()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  sub_244B17128();
  if (v0 <= 0x3F)
  {
    sub_244B16720();
    if (v1 <= 0x3F)
    {
      sub_244B173BC();
      if (v2 <= 0x3F)
      {
        sub_244B1717C();
        if (v3 <= 0x3F)
        {
          sub_244AFA974();
          if (v4 <= 0x3F)
          {
            sub_244B16918();
            if (v5 <= 0x3F)
              swift_initStructMetadata();
          }
        }
      }
    }
  }
}

void sub_244AFA974()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2573DB088[0])
  {
    sub_244B17158();
    v0 = sub_244B17350();
    if (!v1)
      atomic_store(v0, qword_2573DB088);
  }
}

uint64_t sub_244AFA9C8()
{
  return MEMORY[0x24BEE3F20];
}

uint64_t sub_244AFA9D4()
{
  return sub_244AF7684(&qword_2573DB0E8, _s18InstrumentedTokensV13AsyncIteratorVMa, (uint64_t)&unk_244B179A0);
}

uint64_t sub_244AFAA00(uint64_t a1)
{
  uint64_t v2;

  v2 = _s18InstrumentedTokensVMa(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void logMetric(logger:name:startInstant:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_244B173BC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244AF75AC();
  if ((sub_244B172FC() & 1) != 0)
  {
    sub_244B173A4();
    sub_244B173B0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    swift_bridgeObjectRetain_n();
    v9 = sub_244B17110();
    v10 = sub_244B172D8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = swift_slowAlloc();
      v16 = v12;
      *(_DWORD *)v11 = 136315394;
      swift_bridgeObjectRetain();
      v15 = sub_244B139EC(a2, a3, &v16);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v11 + 12) = 2080;
      v13 = sub_244B1747C();
      v15 = sub_244B139EC(v13, v14, &v16);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_244AF5000, v9, v10, "performance metric: %s %s", (uint8_t *)v11, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v12, -1, -1);
      MEMORY[0x24951F40C](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
}

uint64_t sub_244AFAC60()
{
  uint64_t v0;

  v0 = sub_244B17128();
  __swift_allocate_value_buffer(v0, qword_2573DBA20);
  __swift_project_value_buffer(v0, (uint64_t)qword_2573DBA20);
  swift_bridgeObjectRetain();
  return sub_244B1711C();
}

uint64_t sub_244AFACE4()
{
  uint64_t v0;

  v0 = qword_2573DB100;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t NewInferenceProvider.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v0 = sub_244B17128();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = swift_allocObject();
  v5 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  if (qword_2573DAEF0 != -1)
    swift_once();
  v6 = v4 + v5;
  v7 = __swift_project_value_buffer(v0, (uint64_t)qword_2573DBA20);
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  v8(v6, v7, v0);
  sub_244B17398();
  v8((uint64_t)v3, v6, v0);
  sub_244B170B0();
  return v4;
}

uint64_t NewInferenceProvider.init()()
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
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  v1 = sub_244B17128();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244B170C8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  if (qword_2573DAEF0 != -1)
    swift_once();
  v10 = v0 + v9;
  v11 = __swift_project_value_buffer(v1, (uint64_t)qword_2573DBA20);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v12(v10, v11, v1);
  sub_244B17398();
  v12((uint64_t)v4, v10, v1);
  sub_244B170B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster, v8, v5);
  return v0;
}

uint64_t NewInferenceProvider.loadIn(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_244AFAF88()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  unint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8;

  swift_bridgeObjectRetain_n();
  v1 = sub_244B17110();
  v2 = sub_244B172D8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 32);
    v4 = *(_QWORD *)(v0 + 24);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v8 = v6;
    *(_DWORD *)v5 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_244B139EC(v4, v3, &v8);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_244AF5000, v1, v2, "%s load in", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v6, -1, -1);
    MEMORY[0x24951F40C](v5, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t NewInferenceProvider.loadOut(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_244AFB128()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  unint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8;

  swift_bridgeObjectRetain_n();
  v1 = sub_244B17110();
  v2 = sub_244B172D8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 32);
    v4 = *(_QWORD *)(v0 + 24);
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v8 = v6;
    *(_DWORD *)v5 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_244B139EC(v4, v3, &v8);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_244AF5000, v1, v2, "%s load out", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v6, -1, -1);
    MEMORY[0x24951F40C](v5, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t NewInferenceProvider.prewarmHint(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[117] = v1;
  v2[116] = a1;
  v3 = sub_244B170D4();
  v2[118] = v3;
  v2[119] = *(_QWORD *)(v3 - 8);
  v2[120] = swift_task_alloc();
  v2[121] = swift_task_alloc();
  v2[122] = swift_task_alloc();
  v2[123] = swift_task_alloc();
  v4 = sub_244B16FF0();
  v2[124] = v4;
  v2[125] = *(_QWORD *)(v4 - 8);
  v2[126] = swift_task_alloc();
  v2[127] = swift_task_alloc();
  v2[128] = swift_task_alloc();
  v2[129] = swift_task_alloc();
  v2[130] = swift_task_alloc();
  v2[131] = swift_task_alloc();
  v2[132] = swift_task_alloc();
  v2[133] = swift_task_alloc();
  v2[134] = swift_task_alloc();
  v2[135] = swift_task_alloc();
  v2[136] = swift_task_alloc();
  v2[137] = swift_task_alloc();
  v2[138] = swift_task_alloc();
  v2[139] = swift_task_alloc();
  v2[140] = swift_task_alloc();
  v2[141] = swift_task_alloc();
  v2[142] = swift_task_alloc();
  v2[143] = swift_task_alloc();
  v5 = sub_244B16720();
  v2[144] = v5;
  v2[145] = *(_QWORD *)(v5 - 8);
  v2[146] = swift_task_alloc();
  v2[147] = swift_task_alloc();
  v6 = sub_244B16F30();
  v2[148] = v6;
  v2[149] = *(_QWORD *)(v6 - 8);
  v2[150] = swift_task_alloc();
  v7 = sub_244B16EC4();
  v2[151] = v7;
  v2[152] = *(_QWORD *)(v7 - 8);
  v2[153] = swift_task_alloc();
  v2[154] = swift_task_alloc();
  v8 = sub_244B170A4();
  v2[155] = v8;
  v2[156] = *(_QWORD *)(v8 - 8);
  v2[157] = swift_task_alloc();
  v2[158] = swift_task_alloc();
  v2[159] = swift_task_alloc();
  v2[160] = swift_task_alloc();
  v2[161] = swift_task_alloc();
  v2[162] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244AFB530()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint8_t *v7;
  os_signpost_id_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD);
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  unint64_t v39;
  unint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  void (*v52)(uint64_t, uint64_t);
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t, uint64_t);
  NSObject *v69;
  os_log_type_t v70;
  _BOOL4 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t, uint64_t);
  NSObject *v97;
  os_signpost_type_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
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
  void (*v114)(uint64_t, uint64_t, uint64_t);
  uint64_t v115;
  unint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  void (*v127)(uint64_t, uint64_t);
  void (*v128)(uint64_t, uint64_t);
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void (*v148)(uint64_t, uint64_t, uint64_t);
  NSObject *v149;
  os_log_type_t v150;
  _BOOL4 v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  void (*v161)(uint64_t, uint64_t);
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  uint64_t v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void (*v172)(uint64_t, uint64_t);
  uint64_t v173;
  _QWORD *v174;
  _QWORD *v175;
  uint64_t v177;
  NSObject *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void (*v185)(uint64_t, uint64_t);
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void (*v189)(uint64_t, uint64_t, uint64_t);
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  NSObject *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void (*v200)(uint64_t, uint64_t);
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint8_t *v205;
  os_signpost_id_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  os_log_type_t v226[8];
  os_log_type_t v227;
  os_log_type_t v228;
  os_log_type_t v229;
  NSObject *v230;
  NSObject *log;
  NSObject *loga;
  os_log_t logb;
  os_log_t logc;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  _QWORD *type;
  unint64_t v240;
  uint64_t v241;
  uint64_t v242;
  void (*v243)(uint64_t, uint64_t);
  uint64_t v244;
  void (*v245)(uint64_t, uint64_t, uint64_t);
  unint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  void (*v253)(uint64_t, uint64_t);
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  NSObject *v260;
  uint64_t v261;
  _OWORD *v262;
  void (*v263)(uint64_t, uint64_t);
  _OWORD *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  os_log_type_t v268;
  uint64_t v269;
  void (*v270)(uint64_t, uint64_t);
  _QWORD *v271;
  uint64_t v272;
  unint64_t v273;
  unint64_t v274;
  __int128 *v275;
  _QWORD *v276;
  uint64_t v277;
  _QWORD *v278;
  uint64_t v279[3];

  *(_QWORD *)(v0 + 1304) = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  sub_244B17098();
  v1 = sub_244B170BC();
  v2 = sub_244B1732C();
  v275 = (__int128 *)(v0 + 56);
  if ((sub_244B17344() & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 1288);
    v4 = *(_QWORD *)(v0 + 1248);
    v5 = *(_QWORD *)(v0 + 1240);
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v6(v3, *(_QWORD *)(v0 + 1296), v5);
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    v8 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v1, v2, v8, "prewarmHint", "", v7, 2u);
    MEMORY[0x24951F40C](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    v9 = v6;
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 1248);

    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  }
  *(_QWORD *)(v0 + 1312) = v9;
  v11 = *(_QWORD *)(v0 + 1296);
  v12 = *(_QWORD *)(v0 + 1248);
  v13 = *(_QWORD *)(v0 + 1240);
  v14 = *(_QWORD *)(v0 + 1200);
  v15 = *(_QWORD *)(v0 + 1192);
  v272 = *(_QWORD *)(v0 + 1184);
  v16 = *(void (***)(_QWORD, _QWORD))(v0 + 1176);
  v245 = v9;
  v9(*(_QWORD *)(v0 + 1288), v11, v13);
  sub_244B170F8();
  swift_allocObject();
  *(_QWORD *)(v0 + 1320) = sub_244B170EC();
  v17 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  *(_QWORD *)(v0 + 1328) = v17;
  v270 = v17;
  v17(v11, v13);
  sub_244B16EB8();
  sub_244B16FD8();
  sub_244B16F24();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v272);
  LOBYTE(v279[0]) = 0;
  sub_244B16EAC();
  sub_244B16714();
  v18 = sub_244B16708();
  v20 = v19;
  *(_QWORD *)(v0 + 1336) = v18;
  *(_QWORD *)(v0 + 1344) = v19;
  v21 = sub_244B16FC0();
  v22 = sub_244AFE810(v16, v21);
  v24 = v23;
  *(_QWORD *)(v0 + 1352) = v22;
  *(_QWORD *)(v0 + 1360) = v23;
  sub_244B16768();
  swift_allocObject();
  sub_244B1675C();
  sub_244B16FE4();
  sub_244B16750();
  swift_bridgeObjectRelease();
  swift_release();
  v25 = v20;
  v26 = v24;
  v242 = v18;
  if (!*(_QWORD *)(v0 + 80))
  {
    v32 = *(_QWORD *)(v0 + 1048);
    v33 = *(_QWORD *)(v0 + 1040);
    v256 = *(_QWORD *)(v0 + 1032);
    v34 = *(_QWORD *)(v0 + 1000);
    v35 = *(_QWORD *)(v0 + 992);
    v36 = v25;
    v37 = *(_QWORD *)(v0 + 928);
    sub_244AF8EA0((uint64_t)v275, &qword_2573DB150);
    v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16);
    v38(v32, v37, v35);
    v38(v33, v37, v35);
    v39 = v36;
    v38(v256, v37, v35);
    swift_bridgeObjectRetain();
    v40 = v26;
    swift_bridgeObjectRetain();
    v41 = sub_244B17110();
    v42 = sub_244B172CC();
    v43 = os_log_type_enabled(v41, v42);
    v277 = *(_QWORD *)(v0 + 1208);
    v257 = *(_QWORD *)(v0 + 1232);
    if (v43)
    {
      log = v41;
      v44 = *(_QWORD *)(v0 + 1168);
      v274 = v40;
      v45 = *(_QWORD *)(v0 + 1152);
      v228 = v42;
      v46 = *(_QWORD *)(v0 + 1048);
      v214 = *(_QWORD *)(v0 + 1040);
      v219 = *(_QWORD *)(v0 + 1032);
      v207 = *(_QWORD *)(v0 + 1160);
      v208 = *(_QWORD *)(v0 + 1000);
      v212 = *(_QWORD *)(v0 + 992);
      v248 = *(_QWORD *)(v0 + 1216);
      v235 = *(_QWORD *)(v0 + 1176);
      v47 = swift_slowAlloc();
      v222 = swift_slowAlloc();
      v279[0] = v222;
      *(_DWORD *)v47 = 136316162;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 728) = sub_244B139EC(v242, v39, v279);
      sub_244B1735C();
      v48 = swift_bridgeObjectRelease_n();
      *(_WORD *)(v47 + 12) = 2080;
      MEMORY[0x24951ECA4](v48);
      v49 = sub_244B16708();
      v51 = v50;
      v263 = *(void (**)(uint64_t, uint64_t))(v207 + 8);
      v263(v44, v45);
      *(_QWORD *)(v0 + 720) = sub_244B139EC(v49, v51, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v52 = *(void (**)(uint64_t, uint64_t))(v208 + 8);
      v52(v46, v212);
      *(_WORD *)(v47 + 22) = 2080;
      v53 = sub_244B16FE4();
      *(_QWORD *)(v0 + 712) = sub_244B139EC(v53, v54, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v55 = ((uint64_t (*)(uint64_t, uint64_t))v52)(v214, v212);
      *(_WORD *)(v47 + 32) = 2080;
      v56 = MEMORY[0x24951ECBC](v55);
      *(_QWORD *)(v0 + 704) = sub_244B139EC(v56, v57, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v52(v219, v212);
      *(_WORD *)(v47 + 42) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 656) = sub_244B139EC(v22, v274, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, log, v228, "%s prewarm for unknown bundle. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s", (uint8_t *)v47, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v222, -1, -1);
      MEMORY[0x24951F40C](v47, -1, -1);

      v263(v235, v45);
      (*(void (**)(uint64_t, uint64_t))(v248 + 8))(v257, v277);
    }
    else
    {
      v250 = *(_QWORD *)(v0 + 1160);
      v266 = *(_QWORD *)(v0 + 1152);
      v87 = *(_QWORD *)(v0 + 1048);
      v88 = v41;
      v89 = *(_QWORD *)(v0 + 1040);
      v90 = *(_QWORD *)(v0 + 1032);
      v91 = *(_QWORD *)(v0 + 1000);
      v92 = *(_QWORD *)(v0 + 992);
      v93 = *(_QWORD *)(v0 + 1216);
      v94 = *(_QWORD *)(v0 + 1176);

      swift_bridgeObjectRelease_n();
      v95 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
      v95(v90, v92);
      v95(v89, v92);
      v95(v87, v92);
      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v250 + 8))(v94, v266);
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v257, v277);
    }
    v96 = v270;
    v97 = sub_244B170BC();
    sub_244B170E0();
    v98 = sub_244B17320();
    if ((sub_244B17344() & 1) != 0)
    {
      v99 = *(_QWORD *)(v0 + 968);
      v100 = *(_QWORD *)(v0 + 952);
      v101 = *(_QWORD *)(v0 + 944);
      swift_retain();
      sub_244B17104();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v100 + 88))(v99, v101) == *MEMORY[0x24BEE7810])
      {
        v102 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 952) + 8))(*(_QWORD *)(v0 + 968), *(_QWORD *)(v0 + 944));
        v102 = "";
      }
      v189 = v245;
      v190 = *(_QWORD *)(v0 + 1288);
      v191 = *(_QWORD *)(v0 + 1264);
      goto LABEL_51;
    }
    v103 = *(_QWORD *)(v0 + 1264);
    goto LABEL_10;
  }
  v240 = v20;
  v241 = v22;
  v273 = v24;
  v262 = (_OWORD *)(v0 + 536);
  sub_244B13AE0(v275, v0 + 16);
  v276 = (_QWORD *)(v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v27 = sub_244B16780();
  v28 = *(_QWORD *)(v27 + 16);
  if (v28)
  {
    v29 = v27 + 32;
    while (1)
    {
      sub_244AF7B54(v29, v0 + 576);
      sub_244AF7B54(v0 + 576, v0 + 616);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB158);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB160);
      if (swift_dynamicCast())
        break;
      __swift_destroy_boxed_opaque_existential_1(v0 + 576);
      v29 += 40;
      if (!--v28)
        goto LABEL_9;
    }
    __swift_destroy_boxed_opaque_existential_1(v0 + 456);
    v30 = (__int128 *)(v0 + 536);
    sub_244B13AE0((__int128 *)(v0 + 576), (uint64_t)v262);
  }
  else
  {
LABEL_9:
    v30 = (__int128 *)(v0 + 536);
    *(_QWORD *)(v0 + 568) = 0;
    *v262 = 0u;
    *(_OWORD *)(v0 + 552) = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v0 + 560))
  {
    v62 = *(_QWORD *)(v0 + 1072);
    v63 = *(_QWORD *)(v0 + 1064);
    v64 = *(_QWORD *)(v0 + 1056);
    v65 = *(_QWORD *)(v0 + 1000);
    v66 = *(_QWORD *)(v0 + 992);
    v67 = *(_QWORD *)(v0 + 928);
    sub_244AF8EA0((uint64_t)v30, &qword_2573DB168);
    v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(v65 + 16);
    v68(v62, v67, v66);
    v68(v63, v67, v66);
    v68(v64, v67, v66);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v69 = sub_244B17110();
    v70 = sub_244B172CC();
    v71 = os_log_type_enabled(v69, v70);
    v258 = *(_QWORD *)(v0 + 1232);
    v265 = *(_QWORD *)(v0 + 1208);
    if (v71)
    {
      loga = v69;
      v229 = v70;
      v72 = *(_QWORD *)(v0 + 1168);
      v73 = *(_QWORD *)(v0 + 1160);
      v74 = *(_QWORD *)(v0 + 1152);
      v75 = *(_QWORD *)(v0 + 1072);
      v216 = *(_QWORD *)(v0 + 1064);
      v220 = *(_QWORD *)(v0 + 1056);
      v210 = *(_QWORD *)(v0 + 1000);
      v213 = *(_QWORD *)(v0 + 992);
      v249 = *(_QWORD *)(v0 + 1216);
      v236 = *(_QWORD *)(v0 + 1176);
      v76 = swift_slowAlloc();
      v225 = swift_slowAlloc();
      v279[0] = v225;
      *(_DWORD *)v76 = 136316162;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 664) = sub_244B139EC(v242, v240, v279);
      sub_244B1735C();
      v77 = swift_bridgeObjectRelease_n();
      *(_WORD *)(v76 + 12) = 2080;
      MEMORY[0x24951ECA4](v77);
      v78 = sub_244B16708();
      v80 = v79;
      v243 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
      v243(v72, v74);
      *(_QWORD *)(v0 + 672) = sub_244B139EC(v78, v80, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v81 = *(void (**)(uint64_t, uint64_t))(v210 + 8);
      v81(v75, v213);
      *(_WORD *)(v76 + 22) = 2080;
      v82 = sub_244B16FE4();
      *(_QWORD *)(v0 + 680) = sub_244B139EC(v82, v83, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v84 = ((uint64_t (*)(uint64_t, uint64_t))v81)(v216, v213);
      *(_WORD *)(v76 + 32) = 2080;
      v85 = MEMORY[0x24951ECBC](v84);
      *(_QWORD *)(v0 + 688) = sub_244B139EC(v85, v86, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v81(v220, v213);
      *(_WORD *)(v76 + 42) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 696) = sub_244B139EC(v241, v273, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, loga, v229, "%s prewarm with no LLModel called. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s", (uint8_t *)v76, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v225, -1, -1);
      MEMORY[0x24951F40C](v76, -1, -1);

      v243(v236, v74);
      (*(void (**)(uint64_t, uint64_t))(v249 + 8))(v258, v265);
    }
    else
    {
      v244 = *(_QWORD *)(v0 + 1160);
      v254 = *(_QWORD *)(v0 + 1152);
      v177 = *(_QWORD *)(v0 + 1072);
      v178 = v69;
      v179 = *(_QWORD *)(v0 + 1064);
      v180 = *(_QWORD *)(v0 + 1056);
      v181 = *(_QWORD *)(v0 + 1000);
      v182 = *(_QWORD *)(v0 + 992);
      v183 = *(_QWORD *)(v0 + 1216);
      v184 = *(_QWORD *)(v0 + 1176);

      swift_bridgeObjectRelease_n();
      v185 = *(void (**)(uint64_t, uint64_t))(v181 + 8);
      v185(v180, v182);
      v185(v179, v182);
      v185(v177, v182);
      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v244 + 8))(v184, v254);
      (*(void (**)(uint64_t, uint64_t))(v183 + 8))(v258, v265);
    }
    v96 = v270;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v276);
    v97 = sub_244B170BC();
    sub_244B170E0();
    v98 = sub_244B17320();
    if ((sub_244B17344() & 1) != 0)
    {
      v186 = *(_QWORD *)(v0 + 976);
      v187 = *(_QWORD *)(v0 + 952);
      v188 = *(_QWORD *)(v0 + 944);
      swift_retain();
      sub_244B17104();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v187 + 88))(v186, v188) == *MEMORY[0x24BEE7810])
      {
        v102 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 952) + 8))(*(_QWORD *)(v0 + 976), *(_QWORD *)(v0 + 944));
        v102 = "";
      }
      v189 = v245;
      v190 = *(_QWORD *)(v0 + 1288);
      v191 = *(_QWORD *)(v0 + 1272);
      goto LABEL_51;
    }
    v103 = *(_QWORD *)(v0 + 1272);
LABEL_10:
    v31 = *(_QWORD *)(v0 + 1240);

    v96(v103, v31);
LABEL_52:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v264 = (_OWORD *)(v0 + 376);
  type = (_QWORD *)(v0 + 496);
  sub_244B13AE0(v30, v0 + 496);
  __swift_project_boxed_opaque_existential_1(v276, *(_QWORD *)(v0 + 40));
  v58 = sub_244B16780();
  v59 = *(_QWORD *)(v58 + 16);
  if (v59)
  {
    v60 = v58 + 32;
    while (1)
    {
      sub_244AF7B54(v60, v0 + 336);
      sub_244AF7B54(v0 + 336, v0 + 296);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB158);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB170);
      if (swift_dynamicCast())
        break;
      __swift_destroy_boxed_opaque_existential_1(v0 + 336);
      v60 += 40;
      if (!--v59)
        goto LABEL_19;
    }
    __swift_destroy_boxed_opaque_existential_1(v0 + 256);
    v61 = (__int128 *)(v0 + 376);
    sub_244B13AE0((__int128 *)(v0 + 336), (uint64_t)v264);
  }
  else
  {
LABEL_19:
    v61 = (__int128 *)(v0 + 376);
    *(_QWORD *)(v0 + 408) = 0;
    *v264 = 0u;
    *(_OWORD *)(v0 + 392) = 0u;
  }
  swift_bridgeObjectRelease();
  v104 = *(_QWORD *)(v0 + 1000);
  v105 = *(_QWORD *)(v0 + 992);
  v106 = *(_QWORD *)(v0 + 928);
  if (!*(_QWORD *)(v0 + 400))
  {
    v145 = *(_QWORD *)(v0 + 1096);
    v146 = *(_QWORD *)(v0 + 1088);
    v147 = *(_QWORD *)(v0 + 1080);
    sub_244AF8EA0((uint64_t)v61, &qword_2573DB168);
    v148 = *(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 16);
    v148(v145, v106, v105);
    v148(v146, v106, v105);
    v148(v147, v106, v105);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v149 = sub_244B17110();
    v150 = sub_244B172CC();
    v151 = os_log_type_enabled(v149, v150);
    v269 = *(_QWORD *)(v0 + 1208);
    v238 = *(_QWORD *)(v0 + 1232);
    if (v151)
    {
      v230 = v149;
      v152 = *(_QWORD *)(v0 + 1168);
      v153 = *(_QWORD *)(v0 + 1160);
      v154 = *(_QWORD *)(v0 + 1152);
      v227 = v150;
      v155 = *(_QWORD *)(v0 + 1096);
      v215 = *(_QWORD *)(v0 + 1088);
      v218 = *(_QWORD *)(v0 + 1080);
      v209 = *(_QWORD *)(v0 + 1000);
      v211 = *(_QWORD *)(v0 + 992);
      logc = *(os_log_t *)(v0 + 1176);
      v237 = *(_QWORD *)(v0 + 1216);
      v156 = swift_slowAlloc();
      v224 = swift_slowAlloc();
      v279[0] = v224;
      *(_DWORD *)v156 = 136316162;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 744) = sub_244B139EC(v242, v240, v279);
      sub_244B1735C();
      v157 = swift_bridgeObjectRelease_n();
      *(_WORD *)(v156 + 12) = 2080;
      MEMORY[0x24951ECA4](v157);
      v158 = sub_244B16708();
      v160 = v159;
      v253 = *(void (**)(uint64_t, uint64_t))(v153 + 8);
      v253(v152, v154);
      *(_QWORD *)(v0 + 752) = sub_244B139EC(v158, v160, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v161 = *(void (**)(uint64_t, uint64_t))(v209 + 8);
      v161(v155, v211);
      *(_WORD *)(v156 + 22) = 2080;
      v162 = sub_244B16FE4();
      *(_QWORD *)(v0 + 760) = sub_244B139EC(v162, v163, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v164 = ((uint64_t (*)(uint64_t, uint64_t))v161)(v215, v211);
      *(_WORD *)(v156 + 32) = 2080;
      v165 = MEMORY[0x24951ECBC](v164);
      *(_QWORD *)(v0 + 768) = sub_244B139EC(v165, v166, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v161(v218, v211);
      *(_WORD *)(v156 + 42) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 776) = sub_244B139EC(v241, v273, v279);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, v230, v227, "%s prewarm with no LLMAdapter called. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s", (uint8_t *)v156, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v224, -1, -1);
      MEMORY[0x24951F40C](v156, -1, -1);

      v253((uint64_t)logc, v154);
      (*(void (**)(uint64_t, uint64_t))(v237 + 8))(v238, v269);
    }
    else
    {
      v255 = *(_QWORD *)(v0 + 1160);
      v261 = *(_QWORD *)(v0 + 1152);
      v192 = *(_QWORD *)(v0 + 1096);
      v193 = v149;
      v194 = *(_QWORD *)(v0 + 1088);
      v195 = *(_QWORD *)(v0 + 1080);
      v196 = *(_QWORD *)(v0 + 1000);
      v197 = *(_QWORD *)(v0 + 992);
      v198 = *(_QWORD *)(v0 + 1216);
      v199 = *(_QWORD *)(v0 + 1176);

      swift_bridgeObjectRelease_n();
      v200 = *(void (**)(uint64_t, uint64_t))(v196 + 8);
      v200(v195, v197);
      v200(v194, v197);
      v200(v192, v197);
      swift_bridgeObjectRelease_n();
      (*(void (**)(uint64_t, uint64_t))(v255 + 8))(v199, v261);
      (*(void (**)(uint64_t, uint64_t))(v198 + 8))(v238, v269);
    }
    v96 = v270;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)type);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v276);
    v97 = sub_244B170BC();
    sub_244B170E0();
    v98 = sub_244B17320();
    if ((sub_244B17344() & 1) != 0)
    {
      v201 = *(_QWORD *)(v0 + 984);
      v202 = *(_QWORD *)(v0 + 952);
      v203 = *(_QWORD *)(v0 + 944);
      swift_retain();
      sub_244B17104();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v202 + 88))(v201, v203) == *MEMORY[0x24BEE7810])
      {
        v102 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 952) + 8))(*(_QWORD *)(v0 + 984), *(_QWORD *)(v0 + 944));
        v102 = "";
      }
      v189 = v245;
      v190 = *(_QWORD *)(v0 + 1288);
      v191 = *(_QWORD *)(v0 + 1280);
LABEL_51:
      v204 = *(_QWORD *)(v0 + 1240);
      v189(v190, v191, v204);
      v205 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v205 = 0;
      v206 = sub_244B1708C();
      _os_signpost_emit_with_name_impl(&dword_244AF5000, v97, v98, v206, "prewarmHint", v102, v205, 2u);
      MEMORY[0x24951F40C](v205, -1, -1);

      v270(v191, v204);
      v270(v190, v204);
      goto LABEL_52;
    }
    v103 = *(_QWORD *)(v0 + 1280);
    goto LABEL_10;
  }
  v278 = (_QWORD *)(v0 + 176);
  v251 = *(_QWORD *)(v0 + 1144);
  v259 = *(_QWORD *)(v0 + 1136);
  v267 = *(_QWORD *)(v0 + 1128);
  v271 = (_QWORD *)(v0 + 216);
  sub_244B13AE0(v61, v0 + 416);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB178);
  v107 = swift_allocObject();
  *(_OWORD *)(v107 + 16) = xmmword_244B17A60;
  *(_QWORD *)(v107 + 32) = 0x6C65646F6DLL;
  *(_QWORD *)(v107 + 40) = 0xE500000000000000;
  v108 = *(_QWORD *)(v0 + 520);
  v247 = v104;
  v109 = *(_QWORD *)(v0 + 528);
  __swift_project_boxed_opaque_existential_1(type, v108);
  *(_QWORD *)(v107 + 48) = MEMORY[0x24951E464](v108, v109);
  *(_QWORD *)(v107 + 56) = v110;
  *(_QWORD *)(v107 + 64) = 0x72657470616461;
  *(_QWORD *)(v107 + 72) = 0xE700000000000000;
  v111 = *(_QWORD *)(v0 + 440);
  v112 = *(_QWORD *)(v0 + 448);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 416), v111);
  *(_QWORD *)(v107 + 80) = MEMORY[0x24951E464](v111, v112);
  *(_QWORD *)(v107 + 88) = v113;
  v246 = sub_244AFFC88(v107);
  *(_QWORD *)(v0 + 1368) = v246;
  *(_QWORD *)(v0 + 1376) = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v247 + 16);
  *(_QWORD *)(v0 + 1384) = v114;
  v114(v251, v106, v105);
  v114(v259, v106, v105);
  v114(v267, v106, v105);
  sub_244AF7B54((uint64_t)type, v0 + 216);
  sub_244AF7B54(v0 + 416, v0 + 176);
  v115 = v240;
  swift_bridgeObjectRetain_n();
  v116 = v273;
  swift_bridgeObjectRetain_n();
  v117 = sub_244B17110();
  v118 = sub_244B172D8();
  if (os_log_type_enabled(v117, v118))
  {
    v268 = v118;
    v260 = v117;
    v119 = *(_QWORD *)(v0 + 1168);
    v120 = *(_QWORD *)(v0 + 1160);
    v217 = *(_QWORD *)(v0 + 1152);
    v121 = *(_QWORD *)(v0 + 1144);
    logb = *(os_log_t *)(v0 + 1128);
    v221 = *(_QWORD *)(v0 + 1000);
    v223 = *(_QWORD *)(v0 + 992);
    *(_QWORD *)v226 = *(_QWORD *)(v0 + 1136);
    v122 = swift_slowAlloc();
    v252 = swift_slowAlloc();
    v279[0] = v252;
    *(_DWORD *)v122 = 136316674;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 872) = sub_244B139EC(v242, v240, v279);
    sub_244B1735C();
    v123 = swift_bridgeObjectRelease_n();
    *(_WORD *)(v122 + 12) = 2080;
    MEMORY[0x24951ECA4](v123);
    v124 = sub_244B16708();
    v126 = v125;
    v127 = *(void (**)(uint64_t, uint64_t))(v120 + 8);
    v116 = v273;
    v127(v119, v217);
    *(_QWORD *)(v0 + 880) = sub_244B139EC(v124, v126, v279);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v128 = *(void (**)(uint64_t, uint64_t))(v221 + 8);
    v128(v121, v223);
    *(_WORD *)(v122 + 22) = 2080;
    v129 = sub_244B16FE4();
    *(_QWORD *)(v0 + 888) = sub_244B139EC(v129, v130, v279);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v131 = ((uint64_t (*)(_QWORD, uint64_t))v128)(*(_QWORD *)v226, v223);
    *(_WORD *)(v122 + 32) = 2080;
    v132 = MEMORY[0x24951ECBC](v131);
    *(_QWORD *)(v0 + 896) = sub_244B139EC(v132, v133, v279);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v128((uint64_t)logb, v223);
    *(_WORD *)(v122 + 42) = 2080;
    swift_bridgeObjectRetain();
    v134 = v241;
    *(_QWORD *)(v0 + 904) = sub_244B139EC(v241, v273, v279);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v122 + 52) = 2080;
    v135 = *(_QWORD *)(v0 + 240);
    v136 = *(_QWORD *)(v0 + 248);
    __swift_project_boxed_opaque_existential_1(v271, v135);
    v137 = MEMORY[0x24951E464](v135, v136);
    *(_QWORD *)(v0 + 912) = sub_244B139EC(v137, v138, v279);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v271);
    *(_WORD *)(v122 + 62) = 2080;
    v139 = *(_QWORD *)(v0 + 200);
    v140 = *(_QWORD *)(v0 + 208);
    __swift_project_boxed_opaque_existential_1(v278, v139);
    v141 = v140;
    v142 = v242;
    v143 = MEMORY[0x24951E464](v139, v141);
    *(_QWORD *)(v0 + 920) = sub_244B139EC(v143, v144, v279);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v115 = v240;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v278);
    _os_log_impl(&dword_244AF5000, v260, v268, "%s Initiating prewarm. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s\nmodel=%s adapter=%s", (uint8_t *)v122, 0x48u);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v252, -1, -1);
    MEMORY[0x24951F40C](v122, -1, -1);

  }
  else
  {
    v167 = *(_QWORD *)(v0 + 1144);
    v168 = *(_QWORD *)(v0 + 1136);
    v169 = *(_QWORD *)(v0 + 1128);
    v170 = *(_QWORD *)(v0 + 1000);
    v171 = *(_QWORD *)(v0 + 992);

    swift_bridgeObjectRelease_n();
    v172 = *(void (**)(uint64_t, uint64_t))(v170 + 8);
    v172(v167, v171);
    v172(v168, v171);
    v172(v169, v171);
    swift_bridgeObjectRelease_n();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v271);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v278);
    v134 = v241;
    v142 = v242;
  }
  v173 = *(_QWORD *)(v0 + 928);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 1216) + 16))(*(_QWORD *)(v0 + 1224), *(_QWORD *)(v0 + 1232), *(_QWORD *)(v0 + 1208));
  v174 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1392) = v174;
  v174[2] = v142;
  v174[3] = v115;
  v174[4] = v246;
  v174[5] = v173;
  v174[6] = v134;
  v174[7] = v116;
  v175 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1400) = v175;
  *v175 = v0;
  v175[1] = sub_244AFD6BC;
  return sub_244AFFEC8((uint64_t)v175, v142, v115, 1, *(_QWORD *)(v0 + 1224), (uint64_t)&unk_2573DB188, (uint64_t)v174);
}

uint64_t sub_244AFD6BC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 1408) = v0;
  swift_task_dealloc();
  v3 = v2[153];
  v4 = v2[151];
  v5 = *(void (**)(uint64_t, uint64_t))(v2[152] + 8);
  if (!v0)
    v2[177] = v5;
  v5(v3, v4);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244AFD76C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  NSObject *v44;
  os_signpost_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  os_signpost_id_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  os_log_type_t type;
  uint64_t v69;
  NSObject *log;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81[2];

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1384);
  v2 = *(_QWORD *)(v0 + 1112);
  v3 = *(_QWORD *)(v0 + 1104);
  v4 = *(_QWORD *)(v0 + 992);
  v5 = *(_QWORD *)(v0 + 928);
  v1(*(_QWORD *)(v0 + 1120), v5, v4);
  v1(v2, v5, v4);
  v1(v3, v5, v4);
  v73 = (_QWORD *)(v0 + 136);
  sub_244AF7B54(v0 + 496, v0 + 136);
  v74 = (_QWORD *)(v0 + 96);
  sub_244AF7B54(v0 + 416, v0 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_244B17110();
  v7 = sub_244B172D8();
  if (os_log_type_enabled(v6, v7))
  {
    v79 = *(void (**)(uint64_t, uint64_t))(v0 + 1416);
    v65 = *(_QWORD *)(v0 + 1360);
    v66 = *(_QWORD *)(v0 + 1352);
    log = v6;
    v8 = *(_QWORD *)(v0 + 1344);
    v9 = *(_QWORD *)(v0 + 1336);
    v75 = *(_QWORD *)(v0 + 1208);
    v77 = *(_QWORD *)(v0 + 1232);
    v71 = *(_QWORD *)(v0 + 1176);
    v10 = *(_QWORD *)(v0 + 1168);
    v11 = *(_QWORD *)(v0 + 1152);
    v67 = v11;
    v12 = *(_QWORD *)(v0 + 1120);
    v64 = *(_QWORD *)(v0 + 1104);
    v60 = *(_QWORD *)(v0 + 1160);
    v61 = *(_QWORD *)(v0 + 1000);
    v62 = *(_QWORD *)(v0 + 992);
    v63 = *(_QWORD *)(v0 + 1112);
    type = v7;
    v13 = swift_slowAlloc();
    v69 = swift_slowAlloc();
    v81[0] = v69;
    *(_DWORD *)v13 = 136316674;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 816) = sub_244B139EC(v9, v8, v81);
    sub_244B1735C();
    v14 = swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    v15 = v12;
    MEMORY[0x24951ECA4](v14);
    v16 = sub_244B16708();
    v18 = v17;
    v19 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
    v19(v10, v11);
    *(_QWORD *)(v0 + 824) = sub_244B139EC(v16, v18, v81);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v20 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
    v20(v15, v62);
    *(_WORD *)(v13 + 22) = 2080;
    v21 = sub_244B16FE4();
    *(_QWORD *)(v0 + 832) = sub_244B139EC(v21, v22, v81);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v23 = ((uint64_t (*)(uint64_t, uint64_t))v20)(v63, v62);
    *(_WORD *)(v13 + 32) = 2080;
    v24 = MEMORY[0x24951ECBC](v23);
    *(_QWORD *)(v0 + 840) = sub_244B139EC(v24, v25, v81);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v20(v64, v62);
    *(_WORD *)(v13 + 42) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 848) = sub_244B139EC(v66, v65, v81);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 52) = 2080;
    v26 = *(_QWORD *)(v0 + 160);
    v27 = *(_QWORD *)(v0 + 168);
    __swift_project_boxed_opaque_existential_1(v73, v26);
    v28 = MEMORY[0x24951E464](v26, v27);
    *(_QWORD *)(v0 + 856) = sub_244B139EC(v28, v29, v81);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
    *(_WORD *)(v13 + 62) = 2080;
    v30 = v0 + 16;
    v31 = *(_QWORD *)(v0 + 120);
    v32 = *(_QWORD *)(v0 + 128);
    __swift_project_boxed_opaque_existential_1(v74, v31);
    v33 = MEMORY[0x24951E464](v31, v32);
    *(_QWORD *)(v0 + 864) = sub_244B139EC(v33, v34, v81);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
    _os_log_impl(&dword_244AF5000, log, type, "%s prewarm complete. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s model=%s adapter=%s", (uint8_t *)v13, 0x48u);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v69, -1, -1);
    MEMORY[0x24951F40C](v13, -1, -1);

    v19(v71, v67);
    v79(v77, v75);
  }
  else
  {
    v35 = *(void (**)(uint64_t, uint64_t))(v0 + 1416);
    v78 = *(_QWORD *)(v0 + 1208);
    v80 = *(_QWORD *)(v0 + 1232);
    v76 = *(_QWORD *)(v0 + 1176);
    v36 = *(_QWORD *)(v0 + 1160);
    v72 = *(_QWORD *)(v0 + 1152);
    v37 = *(_QWORD *)(v0 + 1120);
    v38 = *(_QWORD *)(v0 + 1112);
    v39 = *(_QWORD *)(v0 + 1104);
    v40 = *(_QWORD *)(v0 + 1000);
    v41 = *(_QWORD *)(v0 + 992);

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v74);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v73);
    swift_bridgeObjectRelease_n();
    v42 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
    v43 = v39;
    v30 = v0 + 16;
    v42(v43, v41);
    v42(v38, v41);
    v42(v37, v41);
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v76, v72);
    v35(v80, v78);
  }
  __swift_destroy_boxed_opaque_existential_1(v0 + 416);
  __swift_destroy_boxed_opaque_existential_1(v0 + 496);
  __swift_destroy_boxed_opaque_existential_1(v30);
  v44 = sub_244B170BC();
  sub_244B170E0();
  v45 = sub_244B17320();
  if ((sub_244B17344() & 1) != 0)
  {
    v46 = *(_QWORD *)(v0 + 960);
    v47 = *(_QWORD *)(v0 + 952);
    v48 = *(_QWORD *)(v0 + 944);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v47 + 88))(v46, v48) == *MEMORY[0x24BEE7810])
    {
      v49 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 952) + 8))(*(_QWORD *)(v0 + 960), *(_QWORD *)(v0 + 944));
      v49 = "";
    }
    v53 = *(void (**)(uint64_t, uint64_t))(v0 + 1328);
    v54 = *(_QWORD *)(v0 + 1288);
    v55 = *(_QWORD *)(v0 + 1256);
    v56 = *(_QWORD *)(v0 + 1240);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1312))(v54, v55, v56);
    v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v57 = 0;
    v58 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v44, v45, v58, "prewarmHint", v49, v57, 2u);
    MEMORY[0x24951F40C](v57, -1, -1);

    v53(v55, v56);
    v53(v54, v56);
  }
  else
  {
    v50 = *(void (**)(uint64_t, uint64_t))(v0 + 1328);
    v51 = *(_QWORD *)(v0 + 1256);
    v52 = *(_QWORD *)(v0 + 1240);

    v50(v51, v52);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244AFE048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  NSObject *v34;
  os_signpost_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t *v47;
  os_signpost_id_t v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  os_log_type_t type;
  NSObject *log;
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
  uint64_t v70[2];

  __swift_destroy_boxed_opaque_existential_1(v0 + 416);
  __swift_destroy_boxed_opaque_existential_1(v0 + 496);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v1 = *(_QWORD *)(v0 + 1408);
  v2 = *(_QWORD *)(v0 + 1016);
  v3 = *(_QWORD *)(v0 + 1008);
  v4 = *(_QWORD *)(v0 + 992);
  v5 = *(_QWORD *)(v0 + 928);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 1000) + 16);
  v6(*(_QWORD *)(v0 + 1024), v5, v4);
  v6(v2, v5, v4);
  v6(v3, v5, v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_244B17110();
  v8 = sub_244B172D8();
  if (os_log_type_enabled(v7, v8))
  {
    v54 = *(_QWORD *)(v0 + 1360);
    v55 = *(_QWORD *)(v0 + 1352);
    log = v7;
    v9 = *(_QWORD *)(v0 + 1344);
    v10 = *(_QWORD *)(v0 + 1336);
    v64 = *(_QWORD *)(v0 + 1208);
    v66 = *(_QWORD *)(v0 + 1232);
    v60 = *(_QWORD *)(v0 + 1176);
    v62 = *(_QWORD *)(v0 + 1216);
    v11 = *(_QWORD *)(v0 + 1168);
    v12 = *(_QWORD *)(v0 + 1160);
    v68 = *(_QWORD *)(v0 + 1152);
    v13 = *(_QWORD *)(v0 + 1024);
    v51 = *(_QWORD *)(v0 + 1016);
    v52 = *(_QWORD *)(v0 + 1008);
    v50 = *(_QWORD *)(v0 + 1000);
    type = v8;
    v14 = *(_QWORD *)(v0 + 992);
    v59 = v1;
    v15 = swift_slowAlloc();
    v56 = swift_slowAlloc();
    v70[0] = v56;
    *(_DWORD *)v15 = 136316162;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 808) = sub_244B139EC(v10, v9, v70);
    sub_244B1735C();
    v16 = swift_bridgeObjectRelease_n();
    *(_WORD *)(v15 + 12) = 2080;
    MEMORY[0x24951ECA4](v16);
    v17 = sub_244B16708();
    v19 = v18;
    v53 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v53(v11, v68);
    *(_QWORD *)(v0 + 800) = sub_244B139EC(v17, v19, v70);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v20 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
    v20(v13, v14);
    *(_WORD *)(v15 + 22) = 2080;
    v21 = sub_244B16FE4();
    *(_QWORD *)(v0 + 792) = sub_244B139EC(v21, v22, v70);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v23 = ((uint64_t (*)(uint64_t, uint64_t))v20)(v51, v14);
    *(_WORD *)(v15 + 32) = 2080;
    v24 = MEMORY[0x24951ECBC](v23);
    *(_QWORD *)(v0 + 784) = sub_244B139EC(v24, v25, v70);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v20(v52, v14);
    *(_WORD *)(v15 + 42) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 736) = sub_244B139EC(v55, v54, v70);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_244AF5000, log, type, "%s prewarm failed. sessionUUID=%s modelBundleIdentifier=%s featureIdentifier=%s bundleIdentifier=%s", (uint8_t *)v15, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v56, -1, -1);
    MEMORY[0x24951F40C](v15, -1, -1);
    MEMORY[0x24951F334](v59);

    v53(v60, v68);
    (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v66, v64);
  }
  else
  {
    v67 = *(_QWORD *)(v0 + 1208);
    v69 = *(_QWORD *)(v0 + 1232);
    v63 = *(_QWORD *)(v0 + 1176);
    v65 = *(_QWORD *)(v0 + 1216);
    v26 = *(_QWORD *)(v0 + 1160);
    v61 = *(_QWORD *)(v0 + 1152);
    v27 = *(_QWORD *)(v0 + 1024);
    v28 = v1;
    v29 = *(_QWORD *)(v0 + 1016);
    v30 = *(_QWORD *)(v0 + 1008);
    v31 = *(_QWORD *)(v0 + 1000);
    v32 = *(_QWORD *)(v0 + 992);
    MEMORY[0x24951F334](v28);

    swift_bridgeObjectRelease_n();
    v33 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
    v33(v30, v32);
    v33(v29, v32);
    v33(v27, v32);
    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v63, v61);
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v69, v67);
  }
  v34 = sub_244B170BC();
  sub_244B170E0();
  v35 = sub_244B17320();
  if ((sub_244B17344() & 1) != 0)
  {
    v36 = *(_QWORD *)(v0 + 960);
    v37 = *(_QWORD *)(v0 + 952);
    v38 = *(_QWORD *)(v0 + 944);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v37 + 88))(v36, v38) == *MEMORY[0x24BEE7810])
    {
      v39 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 952) + 8))(*(_QWORD *)(v0 + 960), *(_QWORD *)(v0 + 944));
      v39 = "";
    }
    v43 = *(void (**)(uint64_t, uint64_t))(v0 + 1328);
    v44 = *(_QWORD *)(v0 + 1288);
    v45 = *(_QWORD *)(v0 + 1256);
    v46 = *(_QWORD *)(v0 + 1240);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1312))(v44, v45, v46);
    v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v47 = 0;
    v48 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v34, v35, v48, "prewarmHint", v39, v47, 2u);
    MEMORY[0x24951F40C](v47, -1, -1);

    v43(v45, v46);
    v43(v44, v46);
  }
  else
  {
    v40 = *(void (**)(uint64_t, uint64_t))(v0 + 1328);
    v41 = *(_QWORD *)(v0 + 1256);
    v42 = *(_QWORD *)(v0 + 1240);

    v40(v41, v42);
  }
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_244AFE810(void (**a1)(_QWORD, _QWORD), uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  _BYTE *v32;
  id v33;
  id v34;
  void *v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  char *v65;
  _BYTE *v66;
  NSObject *v67;
  os_log_type_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  os_log_t v75;
  void (**v76)(_QWORD, _QWORD);
  uint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  void *v81;
  uint64_t v82;
  _BYTE *v83;
  NSObject *v84;
  os_log_type_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  os_log_t v94;
  void *v95;
  unint64_t v96;
  unint64_t v97;
  NSObject *v98;
  os_log_type_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  unint64_t v104;
  _BYTE *v105;
  NSObject *v106;
  os_log_type_t v107;
  uint8_t *v108;
  void *v109;
  uint64_t v110;
  unint64_t v111;
  uint8_t *v112;
  uint64_t v113;
  uint64_t v114;
  os_log_t v116;
  NSObject *v117;
  os_log_type_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  void (*v124)(_BYTE *, void (**)(_QWORD, _QWORD), uint64_t);
  _BYTE *v125;
  _BYTE *v126;
  NSObject *v127;
  os_log_type_t v128;
  uint64_t v129;
  uint8_t *v130;
  void *v131;
  uint64_t v132;
  unint64_t v133;
  void *v134;
  uint8_t *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  _BYTE v140[12];
  int v141;
  _BYTE *v142;
  os_log_t v143;
  _BYTE *v144;
  char *v145;
  id v146;
  void (**v147)(_QWORD, _QWORD);
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _BYTE *v151;
  uint64_t v152;
  unint64_t v153;
  id v154[3];

  v147 = a1;
  v154[2] = *(id *)MEMORY[0x24BDAC8D0];
  v148 = sub_244B16720();
  v3 = *(_QWORD *)(v148 - 8);
  v4 = MEMORY[0x24BDAC7A8](v148);
  v6 = &v140[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = &v140[-v8];
  v10 = MEMORY[0x24BDAC7A8](v7);
  v144 = &v140[-v11];
  v12 = MEMORY[0x24BDAC7A8](v10);
  v143 = (os_log_t)&v140[-v13];
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = &v140[-v15];
  v17 = MEMORY[0x24BDAC7A8](v14);
  v145 = &v140[-v18];
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = &v140[-v20];
  MEMORY[0x24BDAC7A8](v19);
  v23 = (unint64_t)&v140[-v22];
  v24 = sub_244B17128();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = &v140[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2573DAEF0 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v24, (uint64_t)qword_2573DBA20);
  v150 = v25;
  v151 = v27;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v25 + 16))(v27, v28, v24);
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else
  {
    v25 = a2;
    if (a2 <= 0x7FFFFFFF)
    {
      v149 = v24;
      v29 = objc_msgSend((id)objc_opt_self(), sel_identifierWithPid_, a2);
      if (!v29)
      {
        v37 = v3;
        v38 = v148;
        (*(void (**)(_BYTE *, void (**)(_QWORD, _QWORD), uint64_t))(v3 + 16))(v6, v147, v148);
        v39 = v151;
        v40 = sub_244B17110();
        v41 = sub_244B172C0();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = swift_slowAlloc();
          v144 = (_BYTE *)v25;
          v43 = v42;
          v44 = (void *)swift_slowAlloc();
          v154[0] = v44;
          *(_DWORD *)v43 = 136315394;
          sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          v45 = sub_244B17410();
          v152 = sub_244B139EC(v45, v46, (uint64_t *)v154);
          sub_244B1735C();
          swift_bridgeObjectRelease();
          (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v6, v38);
          *(_WORD *)(v43 + 12) = 2048;
          v152 = (uint64_t)v144;
          sub_244B1735C();
          _os_log_impl(&dword_244AF5000, v40, v41, "%s could not get identifier for pid %ld", (uint8_t *)v43, 0x16u);
          swift_arrayDestroy();
          v39 = v151;
          MEMORY[0x24951F40C](v44, -1, -1);
          MEMORY[0x24951F40C](v43, -1, -1);

        }
        else
        {

          (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v38);
        }
        v23 = 0xD000000000000012;
        (*(void (**)(_BYTE *, uint64_t))(v150 + 8))(v39, v149);
        return v23;
      }
      v30 = v29;
      v31 = (void *)objc_opt_self();
      v154[0] = 0;
      v146 = v30;
      v32 = objc_msgSend(v31, sel_handleForIdentifier_error_);
      v27 = (_BYTE *)v3;
      if (!v32)
      {
        v144 = (_BYTE *)a2;
        v47 = v154[0];
        v48 = sub_244B166E4();

        swift_willThrow();
        v49 = v148;
        (*(void (**)(unint64_t, void (**)(_QWORD, _QWORD), uint64_t))(v3 + 16))(v23, v147, v148);
        v50 = v151;
        v51 = sub_244B17110();
        v52 = sub_244B172C0();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = swift_slowAlloc();
          v54 = (void *)swift_slowAlloc();
          v147 = (void (**)(_QWORD, _QWORD))v27;
          v55 = v54;
          v154[0] = v54;
          *(_DWORD *)v53 = 136315394;
          sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          v56 = sub_244B17410();
          v152 = sub_244B139EC(v56, v57, (uint64_t *)v154);
          v50 = v151;
          sub_244B1735C();
          swift_bridgeObjectRelease();
          v147[1](v23, v49);
          *(_WORD *)(v53 + 12) = 2048;
          v152 = (uint64_t)v144;
          sub_244B1735C();
          _os_log_impl(&dword_244AF5000, v51, v52, "%s could not get handle for pid %ld", (uint8_t *)v53, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24951F40C](v55, -1, -1);
          MEMORY[0x24951F40C](v53, -1, -1);

        }
        else
        {

          (*((void (**)(unint64_t, uint64_t))v27 + 1))(v23, v49);
        }
        v77 = v149;
        v23 = 0xD000000000000012;
        MEMORY[0x24951F334](v48);

        (*(void (**)(_BYTE *, uint64_t))(v150 + 8))(v50, v77);
        return v23;
      }
      v6 = v32;
      v33 = v154[0];

      if ((objc_msgSend(v6, sel_isDaemon) & 1) != 0)
      {
        v34 = objc_msgSend(v6, sel_name);
        if (v34)
        {
          v35 = v34;
          v23 = sub_244B171D0();
          v9 = v36;

        }
        else
        {
          v9 = (_BYTE *)0xEE006E6F6D656164;
          v23 = 0x2E6E776F6E6B6E75;
        }
        if (qword_2573DAEF8 == -1)
          goto LABEL_25;
        goto LABEL_63;
      }
      v58 = (char *)objc_msgSend(v6, sel_bundle);
      v59 = v148;
      if (v58)
      {
        v60 = v58;
        v61 = objc_msgSend(v58, sel_identifier);
        if (v61)
        {
          v62 = v61;
          v144 = (_BYTE *)v25;
          v23 = sub_244B171D0();
          v64 = v63;

          v154[0] = (id)v23;
          v154[1] = v64;
          v152 = 0x6C7070612E6D6F63;
          v153 = 0xEA00000000002E65;
          sub_244B1571C();
          sub_244B15760();
          if ((sub_244B171C4() & 1) == 0)
          {
            v145 = v60;
            swift_bridgeObjectRelease();
            (*(void (**)(_BYTE *, void (**)(_QWORD, _QWORD), uint64_t))(v3 + 16))(v16, v147, v59);
            v105 = v151;
            v106 = sub_244B17110();
            v107 = sub_244B172C0();
            if (os_log_type_enabled(v106, v107))
            {
              v108 = (uint8_t *)swift_slowAlloc();
              v109 = (void *)swift_slowAlloc();
              v154[0] = v109;
              *(_DWORD *)v108 = 136315138;
              v142 = v6;
              v147 = (void (**)(_QWORD, _QWORD))v27;
              sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
              v110 = sub_244B17410();
              v152 = sub_244B139EC(v110, v111, (uint64_t *)v154);
              v6 = v142;
              sub_244B1735C();
              swift_bridgeObjectRelease();
              ((void (**)(_BYTE *, uint64_t))v147)[1](v16, v59);
              _os_log_impl(&dword_244AF5000, v106, v107, "%s is third party bundle-id", v108, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x24951F40C](v109, -1, -1);
              v112 = v108;
              v105 = v151;
              MEMORY[0x24951F40C](v112, -1, -1);

            }
            else
            {

              (*((void (**)(_BYTE *, uint64_t))v27 + 1))(v16, v59);
            }
            v136 = v149;
            v137 = v150;

            (*(void (**)(_BYTE *, uint64_t))(v137 + 8))(v105, v136);
            return 0xD000000000000017;
          }
          v65 = v145;
          (*(void (**)(char *, void (**)(_QWORD, _QWORD), uint64_t))(v3 + 16))(v145, v147, v59);
          swift_bridgeObjectRetain_n();
          v66 = v151;
          v67 = sub_244B17110();
          v68 = sub_244B172C0();
          v69 = v68;
          if (os_log_type_enabled(v67, v68))
          {
            v70 = swift_slowAlloc();
            v143 = v67;
            v71 = v70;
            v147 = (void (**)(_QWORD, _QWORD))swift_slowAlloc();
            v154[0] = v147;
            *(_DWORD *)v71 = 136315650;
            v141 = v69;
            sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
            v72 = sub_244B17410();
            v152 = sub_244B139EC(v72, v73, (uint64_t *)v154);
            v142 = v6;
            sub_244B1735C();
            swift_bridgeObjectRelease();
            (*((void (**)(char *, uint64_t))v27 + 1))(v65, v59);
            *(_WORD *)(v71 + 12) = 2080;
            v74 = v60;
            swift_bridgeObjectRetain();
            v152 = sub_244B139EC(v23, (unint64_t)v64, (uint64_t *)v154);
            sub_244B1735C();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v71 + 22) = 2048;
            v152 = (uint64_t)v144;
            sub_244B1735C();
            v75 = v143;
            _os_log_impl(&dword_244AF5000, v143, (os_log_type_t)v141, "%s is first party bundle-id %s for pid %ld", (uint8_t *)v71, 0x20u);
            v76 = v147;
            swift_arrayDestroy();
            MEMORY[0x24951F40C](v76, -1, -1);
            MEMORY[0x24951F40C](v71, -1, -1);

LABEL_50:
            (*(void (**)(_BYTE *, uint64_t))(v150 + 8))(v151, v149);
            return v23;
          }

          (*((void (**)(char *, uint64_t))v27 + 1))(v65, v59);
          goto LABEL_57;
        }

      }
      v23 = 0xD000000000000012;
      if ((sub_244B16AC8() & 1) == 0)
      {
        (*(void (**)(_BYTE *, void (**)(_QWORD, _QWORD), uint64_t))(v3 + 16))(v9, v147, v59);
        v98 = sub_244B17110();
        v99 = sub_244B172C0();
        if (os_log_type_enabled(v98, v99))
        {
          v100 = swift_slowAlloc();
          v144 = (_BYTE *)v25;
          v101 = v100;
          v102 = (void *)swift_slowAlloc();
          v154[0] = v102;
          *(_DWORD *)v101 = 136315394;
          v147 = (void (**)(_QWORD, _QWORD))(v101 + 4);
          sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          v103 = sub_244B17410();
          v152 = sub_244B139EC(v103, v104, (uint64_t *)v154);
          sub_244B1735C();
          swift_bridgeObjectRelease();
          v23 = 0xD000000000000012;
          (*((void (**)(_BYTE *, uint64_t))v27 + 1))(v9, v59);
          *(_WORD *)(v101 + 12) = 2048;
          v152 = (uint64_t)v144;
          sub_244B1735C();
          _os_log_impl(&dword_244AF5000, v98, v99, "%s could not get process bundle for pid=%ld", (uint8_t *)v101, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x24951F40C](v102, -1, -1);
          MEMORY[0x24951F40C](v101, -1, -1);

        }
        else
        {

          (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v9, v59);
        }
        v113 = v149;
        v114 = v150;

        (*(void (**)(_BYTE *, uint64_t))(v114 + 8))(v151, v113);
        return v23;
      }
      v93 = objc_msgSend(v6, sel_name);
      v94 = (os_log_t)0xD000000000000010;
      if (v93)
      {
        v95 = v93;
        v23 = sub_244B171D0();
        v97 = v96;

      }
      else
      {
        v97 = 0x8000000244B18180;
        v23 = 0xD000000000000010;
      }
      if (qword_2573DAF00 != -1)
        swift_once();
      if ((sub_244B135D4(v23, v97, (_QWORD *)qword_2573DB118) & 1) == 0)
      {
        v145 = "com.unknown.bundle";
        swift_bridgeObjectRelease();
        v124 = *(void (**)(_BYTE *, void (**)(_QWORD, _QWORD), uint64_t))(v3 + 16);
        v125 = v144;
        v124(v144, v147, v59);
        v126 = v151;
        v127 = sub_244B17110();
        v128 = sub_244B172C0();
        if (os_log_type_enabled(v127, v128))
        {
          v129 = swift_slowAlloc();
          v143 = (os_log_t)0xD000000000000010;
          v130 = (uint8_t *)v129;
          v131 = (void *)swift_slowAlloc();
          v154[0] = v131;
          *(_DWORD *)v130 = 136315138;
          v142 = v6;
          v147 = (void (**)(_QWORD, _QWORD))v27;
          sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          v132 = sub_244B17410();
          v152 = sub_244B139EC(v132, v133, (uint64_t *)v154);
          v6 = v142;
          sub_244B1735C();
          swift_bridgeObjectRelease();
          ((void (**)(_BYTE *, uint64_t))v147)[1](v125, v59);
          _os_log_impl(&dword_244AF5000, v127, v128, "%s bundle identifier is an unknown cli tool", v130, 0xCu);
          swift_arrayDestroy();
          v134 = v131;
          v126 = v151;
          MEMORY[0x24951F40C](v134, -1, -1);
          v135 = v130;
          v94 = v143;
          MEMORY[0x24951F40C](v135, -1, -1);

        }
        else
        {

          (*((void (**)(_BYTE *, uint64_t))v27 + 1))(v125, v59);
        }
        v138 = v149;
        v139 = v150;

        (*(void (**)(_BYTE *, uint64_t))(v139 + 8))(v126, v138);
        return (unint64_t)v94;
      }
      v142 = v6;
      v116 = v143;
      (*(void (**)(os_log_t, void (**)(_QWORD, _QWORD), uint64_t))(v3 + 16))(v143, v147, v59);
      swift_bridgeObjectRetain_n();
      v66 = v151;
      v117 = sub_244B17110();
      v118 = sub_244B172C0();
      if (os_log_type_enabled(v117, v118))
      {
        v119 = swift_slowAlloc();
        v120 = (char *)swift_slowAlloc();
        v147 = (void (**)(_QWORD, _QWORD))v23;
        v145 = v120;
        v154[0] = v120;
        *(_DWORD *)v119 = 136315394;
        sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v121 = sub_244B17410();
        v152 = sub_244B139EC(v121, v122, (uint64_t *)v154);
        sub_244B1735C();
        swift_bridgeObjectRelease();
        (*((void (**)(os_log_t, uint64_t))v27 + 1))(v116, v59);
        *(_WORD *)(v119 + 12) = 2080;
        swift_bridgeObjectRetain();
        v152 = sub_244B139EC((uint64_t)v147, v97, (uint64_t *)v154);
        sub_244B1735C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_244AF5000, v117, v118, "%s bundle identifier is cli tool %s", (uint8_t *)v119, 0x16u);
        v123 = v145;
        swift_arrayDestroy();
        v23 = (unint64_t)v147;
        MEMORY[0x24951F40C](v123, -1, -1);
        MEMORY[0x24951F40C](v119, -1, -1);

        goto LABEL_50;
      }

      (*((void (**)(os_log_t, uint64_t))v27 + 1))(v116, v59);
LABEL_57:
      swift_bridgeObjectRelease_n();
LABEL_58:
      (*(void (**)(_BYTE *, uint64_t))(v150 + 8))(v66, v149);
      return v23;
    }
  }
  __break(1u);
LABEL_63:
  swift_once();
LABEL_25:
  if ((sub_244B135D4(v23, (uint64_t)v9, (_QWORD *)qword_2573DB110) & 1) != 0)
  {
    swift_bridgeObjectRetain_n();
    v66 = v151;
    v78 = sub_244B17110();
    v79 = sub_244B172C0();
    if (os_log_type_enabled(v78, v79))
    {
      v80 = (uint8_t *)swift_slowAlloc();
      v81 = (void *)swift_slowAlloc();
      v154[0] = v81;
      *(_DWORD *)v80 = 136315138;
      swift_bridgeObjectRetain();
      v152 = sub_244B139EC(v23, (unint64_t)v9, (uint64_t *)v154);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, v78, v79, "allowing daemon %s", v80, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v81, -1, -1);
      MEMORY[0x24951F40C](v80, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_58;
  }
  swift_bridgeObjectRelease();
  v82 = v148;
  (*((void (**)(_BYTE *, void (**)(_QWORD, _QWORD), uint64_t))v27 + 2))(v21, v147, v148);
  v83 = v151;
  v84 = sub_244B17110();
  v85 = sub_244B172C0();
  if (os_log_type_enabled(v84, v85))
  {
    v86 = swift_slowAlloc();
    v144 = (_BYTE *)v25;
    v87 = v86;
    v88 = (void *)swift_slowAlloc();
    v154[0] = v88;
    *(_DWORD *)v87 = 136315394;
    v147 = (void (**)(_QWORD, _QWORD))(v87 + 4);
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v89 = sub_244B17410();
    v152 = sub_244B139EC(v89, v90, (uint64_t *)v154);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    (*((void (**)(_BYTE *, uint64_t))v27 + 1))(v21, v82);
    *(_WORD *)(v87 + 12) = 2048;
    v152 = (uint64_t)v144;
    v83 = v151;
    sub_244B1735C();
    _os_log_impl(&dword_244AF5000, v84, v85, "%s daemon for pid=%ld is not allowed", (uint8_t *)v87, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v88, -1, -1);
    MEMORY[0x24951F40C](v87, -1, -1);

  }
  else
  {

    (*((void (**)(_BYTE *, uint64_t))v27 + 1))(v21, v82);
  }
  v91 = v149;
  v92 = v150;
  v23 = 0xD000000000000012;

  (*(void (**)(_BYTE *, uint64_t))(v92 + 8))(v83, v91);
  return v23;
}

unint64_t sub_244AFFC88(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB2F0);
  v2 = (_QWORD *)sub_244B173F8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_244B14CB0(v5, v6, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

uint64_t sub_244AFFDC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[7] = a8;
  v8[8] = v10;
  v8[5] = a6;
  v8[6] = a7;
  v8[3] = a4;
  v8[4] = a5;
  v8[2] = a2;
  return swift_task_switch();
}

uint64_t sub_244AFFDF0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  MEMORY[0x24951ECBC]();
  *(_QWORD *)(v0 + 72) = v1;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v2;
  *v2 = v0;
  v2[1] = sub_244AFFE74;
  return sub_244B16B1C();
}

uint64_t sub_244AFFE74()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_244AFFEC8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
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

  *(_QWORD *)(v8 + 408) = a7;
  *(_QWORD *)(v8 + 416) = v7;
  *(_QWORD *)(v8 + 392) = a5;
  *(_QWORD *)(v8 + 400) = a6;
  *(_BYTE *)(v8 + 672) = a4;
  *(_QWORD *)(v8 + 376) = a2;
  *(_QWORD *)(v8 + 384) = a3;
  *(_QWORD *)(v8 + 368) = a1;
  v9 = sub_244B166FC();
  *(_QWORD *)(v8 + 424) = v9;
  *(_QWORD *)(v8 + 432) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 440) = swift_task_alloc();
  v10 = sub_244B16E88();
  *(_QWORD *)(v8 + 448) = v10;
  *(_QWORD *)(v8 + 456) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 464) = swift_task_alloc();
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  v11 = sub_244B16E94();
  *(_QWORD *)(v8 + 480) = v11;
  *(_QWORD *)(v8 + 488) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 496) = swift_task_alloc();
  v12 = sub_244B17128();
  *(_QWORD *)(v8 + 504) = v12;
  *(_QWORD *)(v8 + 512) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v8 + 520) = swift_task_alloc();
  v13 = sub_244B171B8();
  *(_QWORD *)(v8 + 528) = v13;
  *(_QWORD *)(v8 + 536) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v8 + 544) = swift_task_alloc();
  v14 = sub_244B170A4();
  *(_QWORD *)(v8 + 552) = v14;
  *(_QWORD *)(v8 + 560) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v8 + 568) = swift_task_alloc();
  *(_QWORD *)(v8 + 576) = swift_task_alloc();
  v15 = sub_244B16EC4();
  *(_QWORD *)(v8 + 584) = v15;
  *(_QWORD *)(v8 + 592) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 600) = swift_task_alloc();
  v16 = sub_244B16AEC();
  *(_QWORD *)(v8 + 608) = v16;
  *(_QWORD *)(v8 + 616) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v8 + 624) = swift_task_alloc();
  sub_244B16B04();
  *(_QWORD *)(v8 + 632) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B00090()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_signpost_type_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  os_signpost_id_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  _QWORD *v28;
  os_signpost_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;

  v1 = v0[78];
  v2 = v0[77];
  v3 = v0[76];
  v4 = v0[75];
  v5 = v0[74];
  v6 = v0[73];
  v7 = v0[49];
  sub_244B16B28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  sub_244AFFC88(MEMORY[0x24BEE4AF8]);
  sub_244B16AE0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE78EB0], v3);
  sub_244B16AF8();
  v8 = sub_244B16B10();
  v0[80] = v8;
  v9 = v8;
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v10 = sub_244B170BC();
  v11 = sub_244B17338();
  v12 = sub_244B17344();
  v13 = v0[72];
  if ((v12 & 1) != 0)
  {
    v31 = v0[71];
    v32 = v0[69];
    v33 = v0[70];
    v14 = v0[47];
    v15 = v0[48];
    (*(void (**)(void))(v33 + 16))();
    v30 = v11;
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v35 = v17;
    *(_DWORD *)v16 = 136446210;
    swift_bridgeObjectRetain();
    v0[45] = sub_244B139EC(v14, v15, &v35);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v18 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v10, v30, v18, "executeWithPrivateMLClient", "PrivateMLClient created requestIdentifier=%{public, signpost.description=attribute,public}s)", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v17, -1, -1);
    MEMORY[0x24951F40C](v16, -1, -1);

    v19 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v19(v13, v32);
    v19(v31, v32);
  }
  else
  {
    v20 = v0[70];
    v21 = v0[69];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v13, v21);
  }
  v22 = v0[65];
  v23 = v0[63];
  v24 = v0[64];
  v25 = v0[52];
  v26 = (int *)v0[50];
  v27 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  v0[81] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v25 + v27, v23);
  swift_bridgeObjectRetain();
  sub_244B16EA0();
  sub_244B17194();
  v34 = (int *)((char *)v26 + *v26);
  v28 = (_QWORD *)swift_task_alloc();
  v0[82] = v28;
  *v28 = v0;
  v28[1] = sub_244B00498;
  return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v34)(v0[46], v9, v0[68]);
}

uint64_t sub_244B00498()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 664) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B004FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
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

  *(_QWORD *)(v8 + 408) = a7;
  *(_QWORD *)(v8 + 416) = v7;
  *(_QWORD *)(v8 + 392) = a5;
  *(_QWORD *)(v8 + 400) = a6;
  *(_BYTE *)(v8 + 672) = a4;
  *(_QWORD *)(v8 + 376) = a2;
  *(_QWORD *)(v8 + 384) = a3;
  *(_QWORD *)(v8 + 368) = a1;
  v9 = sub_244B166FC();
  *(_QWORD *)(v8 + 424) = v9;
  *(_QWORD *)(v8 + 432) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 440) = swift_task_alloc();
  v10 = sub_244B16E88();
  *(_QWORD *)(v8 + 448) = v10;
  *(_QWORD *)(v8 + 456) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 464) = swift_task_alloc();
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  v11 = sub_244B16E94();
  *(_QWORD *)(v8 + 480) = v11;
  *(_QWORD *)(v8 + 488) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 496) = swift_task_alloc();
  v12 = sub_244B17128();
  *(_QWORD *)(v8 + 504) = v12;
  *(_QWORD *)(v8 + 512) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v8 + 520) = swift_task_alloc();
  v13 = sub_244B171B8();
  *(_QWORD *)(v8 + 528) = v13;
  *(_QWORD *)(v8 + 536) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v8 + 544) = swift_task_alloc();
  v14 = sub_244B170A4();
  *(_QWORD *)(v8 + 552) = v14;
  *(_QWORD *)(v8 + 560) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v8 + 568) = swift_task_alloc();
  *(_QWORD *)(v8 + 576) = swift_task_alloc();
  v15 = sub_244B16EC4();
  *(_QWORD *)(v8 + 584) = v15;
  *(_QWORD *)(v8 + 592) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 600) = swift_task_alloc();
  v16 = sub_244B16AEC();
  *(_QWORD *)(v8 + 608) = v16;
  *(_QWORD *)(v8 + 616) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v8 + 624) = swift_task_alloc();
  sub_244B16B04();
  *(_QWORD *)(v8 + 632) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B006C4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_signpost_type_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  os_signpost_id_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  _QWORD *v28;
  os_signpost_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;

  v1 = v0[78];
  v2 = v0[77];
  v3 = v0[76];
  v4 = v0[75];
  v5 = v0[74];
  v6 = v0[73];
  v7 = v0[49];
  sub_244B16B28();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v7, v6);
  sub_244AFFC88(MEMORY[0x24BEE4AF8]);
  sub_244B16AE0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE78EB0], v3);
  sub_244B16AF8();
  v8 = sub_244B16B10();
  v0[80] = v8;
  v9 = v8;
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v10 = sub_244B170BC();
  v11 = sub_244B17338();
  v12 = sub_244B17344();
  v13 = v0[72];
  if ((v12 & 1) != 0)
  {
    v31 = v0[71];
    v32 = v0[69];
    v33 = v0[70];
    v14 = v0[47];
    v15 = v0[48];
    (*(void (**)(void))(v33 + 16))();
    v30 = v11;
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v35 = v17;
    *(_DWORD *)v16 = 136446210;
    swift_bridgeObjectRetain();
    v0[45] = sub_244B139EC(v14, v15, &v35);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v18 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v10, v30, v18, "executeWithPrivateMLClient", "PrivateMLClient created requestIdentifier=%{public, signpost.description=attribute,public}s)", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v17, -1, -1);
    MEMORY[0x24951F40C](v16, -1, -1);

    v19 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v19(v13, v32);
    v19(v31, v32);
  }
  else
  {
    v20 = v0[70];
    v21 = v0[69];
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v13, v21);
  }
  v22 = v0[65];
  v23 = v0[63];
  v24 = v0[64];
  v25 = v0[52];
  v26 = (int *)v0[50];
  v27 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  v0[81] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v25 + v27, v23);
  swift_bridgeObjectRetain();
  sub_244B16EA0();
  sub_244B17194();
  v34 = (int *)((char *)v26 + *v26);
  v28 = (_QWORD *)swift_task_alloc();
  v0[82] = v28;
  *v28 = v0;
  v28[1] = sub_244B00ACC;
  return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))v34)(v0[46], v9, v0[68]);
}

uint64_t sub_244B00ACC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 664) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B00B30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 544);
  v2 = *(_QWORD *)(v0 + 536);
  v3 = *(_QWORD *)(v0 + 528);
  sub_244B171AC();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B00C34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  BOOL v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t inited;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v61;
  void (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70[2];

  *(_QWORD *)(v0 + 336) = *(_QWORD *)(v0 + 664);
  MEMORY[0x24951F340]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF28);
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 488) + 88))(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 480)) == *MEMORY[0x24BE78910])
    {
      v2 = *(_QWORD *)(v0 + 488);
      v1 = *(_QWORD *)(v0 + 496);
      v4 = *(_QWORD *)(v0 + 472);
      v3 = *(_QWORD *)(v0 + 480);
      v6 = *(_QWORD *)(v0 + 456);
      v5 = *(_QWORD *)(v0 + 464);
      v7 = *(_QWORD *)(v0 + 448);
      MEMORY[0x24951F334](*(_QWORD *)(v0 + 664));
      (*(void (**)(uint64_t, uint64_t))(v2 + 96))(v1, v3);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v4, v1, v7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v4, v7);
      swift_bridgeObjectRetain_n();
      v8 = sub_244B17110();
      v9 = sub_244B172CC();
      v10 = os_log_type_enabled(v8, v9);
      v12 = *(_QWORD *)(v0 + 456);
      v11 = *(_QWORD *)(v0 + 464);
      v13 = *(_QWORD *)(v0 + 448);
      v14 = *(_QWORD *)(v0 + 384);
      if (v10)
      {
        v15 = *(_QWORD *)(v0 + 376);
        v65 = *(_QWORD *)(v0 + 456);
        v16 = swift_slowAlloc();
        v68 = swift_slowAlloc();
        v70[0] = v68;
        *(_DWORD *)v16 = 136315394;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 344) = sub_244B139EC(v15, v14, v70);
        sub_244B1735C();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v16 + 12) = 2080;
        sub_244AF7684(&qword_2573DB308, (uint64_t (*)(uint64_t))MEMORY[0x24BE788F8], MEMORY[0x24BE78908]);
        v17 = sub_244B17410();
        *(_QWORD *)(v0 + 352) = sub_244B139EC(v17, v18, v70);
        sub_244B1735C();
        swift_bridgeObjectRelease();
        v19 = *(void (**)(uint64_t, uint64_t))(v65 + 8);
        v19(v11, v13);
        _os_log_impl(&dword_244AF5000, v8, v9, "%s denied request due to rate limit. rateLimitInfo: %s", (uint8_t *)v16, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24951F40C](v68, -1, -1);
        MEMORY[0x24951F40C](v16, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        v19 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
        v19(v11, v13);
      }
      v64 = *(_QWORD *)(v0 + 544);
      v66 = *(_QWORD *)(v0 + 536);
      v69 = *(_QWORD *)(v0 + 528);
      v34 = *(_QWORD *)(v0 + 472);
      v35 = *(_QWORD *)(v0 + 440);
      v62 = v19;
      v63 = *(_QWORD *)(v0 + 448);
      v36 = *(_QWORD *)(v0 + 424);
      v61 = *(_QWORD *)(v0 + 432);
      logMetric(logger:name:startInstant:)(*(_QWORD *)(v0 + 416) + *(_QWORD *)(v0 + 648), 0xD000000000000015, 0x8000000244B17F60);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB178);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_244B17A70;
      *(_QWORD *)(inited + 32) = 0x4449656C646E7562;
      *(_QWORD *)(inited + 40) = 0xE800000000000000;
      v38 = sub_244B16E64();
      if (v39)
        v40 = v38;
      else
        v40 = 0;
      if (v39)
        v41 = v39;
      else
        v41 = 0xE000000000000000;
      *(_QWORD *)(inited + 48) = v40;
      *(_QWORD *)(inited + 56) = v41;
      *(_QWORD *)(inited + 64) = 0x4965727574616566;
      *(_QWORD *)(inited + 72) = 0xE900000000000044;
      v42 = sub_244B16E7C();
      if (v43)
        v44 = v42;
      else
        v44 = 0;
      if (v43)
        v45 = v43;
      else
        v45 = 0xE000000000000000;
      *(_QWORD *)(inited + 80) = v44;
      *(_QWORD *)(inited + 88) = v45;
      strcpy((char *)(inited + 96), "workloadType");
      *(_BYTE *)(inited + 109) = 0;
      *(_WORD *)(inited + 110) = -5120;
      v46 = sub_244B16E40();
      if (v47)
        v48 = v46;
      else
        v48 = 0;
      if (v47)
        v49 = v47;
      else
        v49 = 0xE000000000000000;
      *(_QWORD *)(inited + 112) = v48;
      *(_QWORD *)(inited + 120) = v49;
      *(_QWORD *)(inited + 128) = 0x746E756F63;
      *(_QWORD *)(inited + 136) = 0xE500000000000000;
      *(_QWORD *)(v0 + 320) = sub_244B16E58();
      *(_QWORD *)(inited + 144) = sub_244B17410();
      *(_QWORD *)(inited + 152) = v50;
      *(_QWORD *)(inited + 160) = 0x6E6F697461727564;
      *(_QWORD *)(inited + 168) = 0xE800000000000000;
      *(_QWORD *)(v0 + 288) = 0;
      *(_QWORD *)(v0 + 296) = 0xE000000000000000;
      sub_244B16E70();
      sub_244B1729C();
      v51 = *(_QWORD *)(v0 + 296);
      *(_QWORD *)(inited + 176) = *(_QWORD *)(v0 + 288);
      *(_QWORD *)(inited + 184) = v51;
      strcpy((char *)(inited + 192), "retryAfterDate");
      *(_BYTE *)(inited + 207) = -18;
      sub_244B16E4C();
      sub_244AF7684(&qword_2573DB300, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v52 = sub_244B17410();
      v54 = v53;
      v55 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
      v55(v35, v36);
      *(_QWORD *)(inited + 208) = v52;
      *(_QWORD *)(inited + 216) = v54;
      *(_QWORD *)(inited + 224) = 0xD00000000000001ELL;
      *(_QWORD *)(inited + 232) = 0x8000000244B17F80;
      *(_QWORD *)(v0 + 272) = 0;
      *(_QWORD *)(v0 + 280) = 0xE000000000000000;
      sub_244B16E4C();
      sub_244B166F0();
      v55(v35, v36);
      sub_244B1729C();
      v56 = *(_QWORD *)(v0 + 280);
      *(_QWORD *)(inited + 240) = *(_QWORD *)(v0 + 272);
      *(_QWORD *)(inited + 248) = v56;
      sub_244AFFC88(inited);
      v57 = sub_244B16F48();
      sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
      swift_allocError();
      v59 = v58;
      sub_244B16F3C();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v57 - 8) + 104))(v59, *MEMORY[0x24BE68950], v57);
      swift_willThrow();
      v62(v34, v63);
      MEMORY[0x24951F334](*(_QWORD *)(v0 + 336));
      sub_244B171AC();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v64, v69);
      goto LABEL_30;
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 488) + 8))(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 480));
  }
  v20 = *(_QWORD *)(v0 + 664);
  MEMORY[0x24951F334](*(_QWORD *)(v0 + 336));
  swift_bridgeObjectRetain();
  MEMORY[0x24951F340](v20);
  swift_bridgeObjectRetain();
  MEMORY[0x24951F340](v20);
  v21 = sub_244B17110();
  v22 = sub_244B172CC();
  v23 = os_log_type_enabled(v21, v22);
  v24 = *(_QWORD *)(v0 + 664);
  v25 = *(_QWORD *)(v0 + 384);
  if (v23)
  {
    v26 = *(_QWORD *)(v0 + 376);
    v27 = swift_slowAlloc();
    v28 = (_QWORD *)swift_slowAlloc();
    v67 = swift_slowAlloc();
    v70[0] = v67;
    *(_DWORD *)v27 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 312) = sub_244B139EC(v26, v25, v70);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2112;
    MEMORY[0x24951F340](v24);
    v29 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 304) = v29;
    sub_244B1735C();
    *v28 = v29;
    MEMORY[0x24951F334](v24);
    MEMORY[0x24951F334](v24);
    _os_log_impl(&dword_244AF5000, v21, v22, "%s failed to execute private ML request error: %@", (uint8_t *)v27, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB2F8);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v28, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v67, -1, -1);
    MEMORY[0x24951F40C](v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    MEMORY[0x24951F334](v24);
    MEMORY[0x24951F334](v24);
  }
  v30 = *(_QWORD *)(v0 + 664);
  v31 = *(_QWORD *)(v0 + 544);
  v32 = *(_QWORD *)(v0 + 536);
  v33 = *(_QWORD *)(v0 + 528);
  logMetric(logger:name:startInstant:)(*(_QWORD *)(v0 + 416) + *(_QWORD *)(v0 + 648), 0xD000000000000015, 0x8000000244B17F60);
  *(_QWORD *)(v0 + 328) = v30;
  MEMORY[0x24951F340](v30);
  sub_244B17200();
  sub_244B17188();
  swift_willThrow();
  sub_244B171AC();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
LABEL_30:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t NewInferenceProvider.requestStream(clientData:configuration:)@<X0>(uint8_t *a1@<X0>, uint8_t *a2@<X1>, uint8_t *a3@<X2>, uint64_t *a4@<X8>)
{
  uint8_t *v4;
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
  NSObject *v23;
  os_signpost_type_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint8_t *v26;
  uint64_t v27;
  uint8_t *v28;
  os_signpost_id_t v29;
  uint8_t *v30;
  char *v31;
  uint8_t *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint8_t *v54;
  uint64_t v55;
  uint8_t *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint8_t *v67;
  uint8_t *v68;
  uint64_t v69;
  char *v70;
  uint64_t *v71;
  char *v72;
  uint8_t *v73;
  uint8_t *v74;
  uint64_t v75;
  uint64_t v76;

  v74 = a3;
  v67 = a1;
  v68 = a2;
  v71 = a4;
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB198);
  v66 = *(_QWORD *)(v69 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v70 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB1A0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v63 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244B17128();
  v61 = *(_QWORD *)(v7 - 8);
  v62 = v7;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v65 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244B16720();
  v58 = *(_QWORD *)(v9 - 8);
  v59 = v9;
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v64 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v57 = (char *)&v54 - v12;
  v13 = sub_244B17050();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v72 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_244B170A4();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v54 - v21;
  v73 = v4;
  sub_244B170BC();
  sub_244B17080();
  v23 = sub_244B170BC();
  v24 = sub_244B1732C();
  if ((sub_244B17344() & 1) != 0)
  {
    v25 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v25(v20, v22, v16);
    v26 = (uint8_t *)swift_slowAlloc();
    v60 = v14;
    v27 = v13;
    v28 = v26;
    *(_WORD *)v26 = 0;
    v29 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v23, v24, v29, "requestStream", "full request", v28, 2u);
    v30 = v28;
    v13 = v27;
    v14 = v60;
    MEMORY[0x24951F40C](v30, -1, -1);

    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
  }
  else
  {

    v25 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
  }
  v25(v20, v22, v16);
  sub_244B170F8();
  swift_allocObject();
  v60 = sub_244B170EC();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v22, v16);
  v31 = v72;
  v32 = &v73[OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger];
  (*(void (**)(char *, uint8_t *, uint64_t))(v14 + 16))(v72, v74, v13);
  v33 = sub_244B17110();
  v34 = sub_244B172D8();
  if (os_log_type_enabled(v33, v34))
  {
    v56 = v32;
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    v76 = v36;
    v55 = v13;
    *(_DWORD *)v35 = 136315138;
    v54 = v35 + 4;
    v37 = v57;
    sub_244B17008();
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v38 = v59;
    v39 = sub_244B17410();
    v41 = v40;
    (*(void (**)(char *, uint64_t))(v58 + 8))(v37, v38);
    v75 = sub_244B139EC(v39, v41, &v76);
    sub_244B1735C();
    v32 = v56;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v72, v55);
    _os_log_impl(&dword_244AF5000, v33, v34, "%s executing stream request", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v36, -1, -1);
    MEMORY[0x24951F40C](v35, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v14 + 8))(v31, v13);
  }
  (*(void (**)(char *, uint8_t *, uint64_t))(v61 + 16))(v65, v32, v62);
  sub_244B17008();
  sub_244B17044();
  sub_244B17020();
  v42 = (uint64_t)v63;
  sub_244B16FFC();
  v43 = sub_244B16F30();
  v44 = *(_QWORD *)(v43 - 8);
  v45 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v42, 1, v43);
  if (v45 == 1)
  {
    sub_244AF8EA0(v42, &qword_2573DB1A0);
  }
  else
  {
    sub_244B16F18();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v42, v43);
  }
  sub_244B16AB0();
  swift_allocObject();
  LOBYTE(v76) = v45 == 1;
  v46 = sub_244B16A98();
  v47 = MEMORY[0x24BDAC7A8](v46);
  v48 = v60;
  *(&v54 - 6) = v73;
  *(&v54 - 5) = (uint8_t *)v48;
  v49 = v67;
  *(&v54 - 4) = v74;
  *(&v54 - 3) = v49;
  v50 = v69;
  *(&v54 - 2) = v68;
  *(&v54 - 1) = (uint8_t *)v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v66 + 104))(v70, *MEMORY[0x24BEE6CA0], v50);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB1A8);
  v52 = v71;
  v71[3] = v51;
  v52[4] = sub_244B13B98();
  __swift_allocate_boxed_opaque_existential_1(v52);
  sub_244B17290();
  swift_release();
  return swift_release();
}

uint64_t sub_244B01C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
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
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v37 = a6;
  v38 = a7;
  v35 = a3;
  v36 = a5;
  v31 = a4;
  v33 = a1;
  v34 = a2;
  v8 = sub_244B17050();
  v9 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8]();
  v30 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
  v12 = *(_QWORD *)(v11 - 8);
  v28 = v11;
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3F0);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v16;
  v17 = sub_244B17248();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v31, v8);
  v18 = (*(unsigned __int8 *)(v12 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v19 = (v13 + *(unsigned __int8 *)(v9 + 80) + v18) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v20 = (v10 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (char *)swift_allocObject();
  *((_QWORD *)v21 + 2) = 0;
  *((_QWORD *)v21 + 3) = 0;
  v22 = v35;
  *((_QWORD *)v21 + 4) = v34;
  *((_QWORD *)v21 + 5) = v22;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v21[v18], v14, v28);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v21[v19], v30, v29);
  v23 = (uint64_t *)&v21[v20];
  v25 = v36;
  v24 = v37;
  *v23 = v36;
  v23[1] = v24;
  *(_QWORD *)&v21[(v20 + 23) & 0xFFFFFFFFFFFFFFF8] = v38;
  swift_retain();
  swift_retain();
  sub_244B14D30(v25, v24);
  swift_retain();
  sub_244B05F90((uint64_t)v32, (uint64_t)&unk_2573DB400, (uint64_t)v21);
  return sub_244B1726C();
}

uint64_t sub_244B01E6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v8[51] = v14;
  v8[52] = v15;
  v8[49] = a7;
  v8[50] = a8;
  v8[47] = a5;
  v8[48] = a6;
  v8[46] = a4;
  v9 = sub_244B16F48();
  v8[53] = v9;
  v8[54] = *(_QWORD *)(v9 - 8);
  v8[55] = swift_task_alloc();
  v8[56] = swift_task_alloc();
  v8[57] = swift_task_alloc();
  v8[58] = swift_task_alloc();
  v10 = sub_244B170D4();
  v8[59] = v10;
  v8[60] = *(_QWORD *)(v10 - 8);
  v8[61] = swift_task_alloc();
  v8[62] = swift_task_alloc();
  v11 = sub_244B170A4();
  v8[63] = v11;
  v8[64] = *(_QWORD *)(v11 - 8);
  v8[65] = swift_task_alloc();
  v8[66] = swift_task_alloc();
  v8[67] = swift_task_alloc();
  v8[68] = swift_task_alloc();
  v12 = sub_244B16720();
  v8[69] = v12;
  v8[70] = *(_QWORD *)(v12 - 8);
  v8[71] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B01FB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  os_signpost_type_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD);
  uint8_t *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v1 = v0[71];
  v2 = v0[70];
  v3 = v0[69];
  sub_244B17008();
  v4 = sub_244B16708();
  v6 = v5;
  v36 = v4;
  v0[72] = v4;
  v0[73] = v5;
  v35 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v35(v1, v3);
  v0[74] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  sub_244B170BC();
  sub_244B17080();
  v37 = v6;
  swift_bridgeObjectRetain_n();
  v7 = sub_244B170BC();
  v8 = sub_244B1732C();
  if ((sub_244B17344() & 1) != 0)
  {
    v9 = v0[67];
    v32 = v0[63];
    v33 = v0[64];
    v10 = *(void (**)(uint64_t, _QWORD))(v33 + 16);
    v10(v9, v0[68]);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v38 = v12;
    *(_DWORD *)v11 = 136446210;
    swift_bridgeObjectRetain();
    v0[45] = sub_244B139EC(v36, v6, &v38);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v13 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v7, v8, v13, "requestStream", "first token requestIdentifier=%{public, signpost.description=attribute,public}s)", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v12, -1, -1);
    MEMORY[0x24951F40C](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v9, v32);
  }
  else
  {
    v14 = v0[64];

    swift_bridgeObjectRelease_n();
    v10 = *(void (**)(uint64_t, _QWORD))(v14 + 16);
  }
  v0[75] = v10;
  v15 = v0[71];
  v16 = v0[69];
  v17 = v0[68];
  v18 = v0[63];
  v19 = v0[64];
  v20 = v0[52];
  v34 = v0[48];
  v21 = v0[46];
  ((void (*)(_QWORD, uint64_t, uint64_t))v10)(v0[67], v17, v18);
  sub_244B170F8();
  swift_allocObject();
  v22 = sub_244B170EC();
  v23 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  v0[76] = v23;
  v23(v17, v18);
  v0[36] = v22;
  sub_244B16714();
  v24 = sub_244B16708();
  v26 = v25;
  v0[77] = v25;
  v35(v15, v16);
  v27 = sub_244B16AB0();
  v28 = MEMORY[0x24BE78E70];
  v0[10] = v27;
  v0[11] = v28;
  v0[7] = v20;
  v29 = (_QWORD *)swift_task_alloc();
  v0[78] = v29;
  v29[2] = v21;
  v29[3] = v0 + 36;
  v29[4] = v36;
  v29[5] = v37;
  v29[6] = v24;
  v29[7] = v26;
  v29[8] = v20;
  v29[9] = v34;
  swift_retain();
  v30 = (_QWORD *)swift_task_alloc();
  v0[79] = v30;
  *v30 = v0;
  v30[1] = sub_244B02310;
  return sub_244B05220((uint64_t)v30, v0[50], v0[51], v0[49], (uint64_t)(v0 + 7), 0, (uint64_t)&unk_2573DB420, (uint64_t)v29);
}

uint64_t sub_244B02310()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 640) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    __swift_destroy_boxed_opaque_existential_1(v2 + 56);
  }
  return swift_task_switch();
}

uint64_t sub_244B0239C()
{
  uint64_t v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  const char *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  os_signpost_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  _QWORD *v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  os_signpost_id_t v26;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  os_signpost_type_t v32;
  uint64_t v33;

  swift_bridgeObjectRetain();
  swift_retain();
  v1 = sub_244B170BC();
  sub_244B170E0();
  v2 = sub_244B17320();
  if ((sub_244B17344() & 1) != 0)
  {
    v32 = v2;
    v3 = *(_QWORD *)(v0 + 496);
    v5 = *(_QWORD *)(v0 + 472);
    v4 = *(_QWORD *)(v0 + 480);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5) == *MEMORY[0x24BEE7810])
    {
      v6 = 0;
      v7 = 0;
      v8 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 480) + 8))(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 472));
      v8 = "last token received requestIdentifier=%{public, signpost.description=attribute,public}s)";
      v7 = 2;
      v6 = 1;
    }
    v28 = v8;
    v31 = *(void (**)(uint64_t, uint64_t))(v0 + 608);
    v10 = *(_QWORD *)(v0 + 584);
    v11 = *(_QWORD *)(v0 + 576);
    v29 = *(_QWORD *)(v0 + 504);
    v30 = *(_QWORD *)(v0 + 528);
    (*(void (**)(_QWORD))(v0 + 600))(*(_QWORD *)(v0 + 536));
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v33 = v13;
    *(_BYTE *)v12 = v7;
    *(_BYTE *)(v12 + 1) = v6;
    *(_WORD *)(v12 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 272) = sub_244B139EC(v11, v10, &v33);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v14 = sub_244B1708C();
    v9 = (_QWORD *)(v0 + 536);
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v1, v32, v14, "requestStream", v28, (uint8_t *)v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v13, -1, -1);
    MEMORY[0x24951F40C](v12, -1, -1);

    swift_release();
    v31(v30, v29);
  }
  else
  {
    v9 = (_QWORD *)(v0 + 528);
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 608))(*v9, *(_QWORD *)(v0 + 504));
  sub_244B16A8C();
  swift_release();
  v15 = sub_244B170BC();
  sub_244B170E0();
  v16 = sub_244B17320();
  if ((sub_244B17344() & 1) != 0)
  {
    v18 = *(_QWORD *)(v0 + 480);
    v17 = *(_QWORD *)(v0 + 488);
    v19 = *(_QWORD *)(v0 + 472);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v18 + 88))(v17, v19) == *MEMORY[0x24BEE7810])
    {
      v20 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 480) + 8))(*(_QWORD *)(v0 + 488), *(_QWORD *)(v0 + 472));
      v20 = "";
    }
    v22 = *(void (**)(uint64_t, uint64_t))(v0 + 608);
    v21 = (_QWORD *)(v0 + 536);
    v23 = *(_QWORD *)(v0 + 520);
    v24 = *(_QWORD *)(v0 + 504);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 600))(*(_QWORD *)(v0 + 536), v23, v24);
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    v26 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v15, v16, v26, "requestStream", v20, v25, 2u);
    MEMORY[0x24951F40C](v25, -1, -1);

    v22(v23, v24);
  }
  else
  {
    v21 = (_QWORD *)(v0 + 520);

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 608))(*v21, *(_QWORD *)(v0 + 504));
  *(_QWORD *)(v0 + 264) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
  sub_244B17284();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B02820()
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
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_signpost_type_t v45;
  char v46;
  _DWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  _QWORD *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  os_signpost_id_t v58;
  NSObject *v59;
  os_signpost_type_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  _QWORD *v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;
  uint8_t *v69;
  os_signpost_id_t v70;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_type_t type;
  os_log_type_t typea[8];
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t, uint64_t);
  void (*v81)(uint64_t, uint64_t);
  os_signpost_type_t v82;
  uint64_t v83;

  v1 = *(_QWORD *)(v0 + 640);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  *(_QWORD *)(v0 + 312) = v1;
  MEMORY[0x24951F340](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF28);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v2 = *(_QWORD *)(v0 + 464);
    v4 = *(_QWORD *)(v0 + 432);
    v3 = *(_QWORD *)(v0 + 440);
    v5 = *(_QWORD *)(v0 + 424);
    MEMORY[0x24951F334](*(_QWORD *)(v0 + 640));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v3, v5);
    sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
    v6 = swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v7, v2, v5);
    *(_QWORD *)(v0 + 352) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
    sub_244B17284();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v5);
    v8 = *(_QWORD *)(v0 + 312);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 640);
    MEMORY[0x24951F334](*(_QWORD *)(v0 + 312));
    *(_QWORD *)(v0 + 304) = v9;
    MEMORY[0x24951F340](v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3C0);
    v10 = swift_dynamicCast();
    v11 = *(_QWORD *)(v0 + 640);
    if (!v10)
    {
      v21 = *(_QWORD *)(v0 + 448);
      v20 = *(_QWORD *)(v0 + 456);
      v23 = *(_QWORD *)(v0 + 424);
      v22 = *(_QWORD *)(v0 + 432);
      MEMORY[0x24951F334](*(_QWORD *)(v0 + 304));
      *(_QWORD *)(v0 + 296) = v11;
      MEMORY[0x24951F340](v11);
      sub_244B17200();
      swift_bridgeObjectRetain();
      sub_244AFFC88(MEMORY[0x24BEE4AF8]);
      sub_244B16F3C();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 104))(v20, *MEMORY[0x24BE68978], v23);
      v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16);
      v24(v21, v20, v23);
      v25 = sub_244B17110();
      v26 = sub_244B172B4();
      v27 = os_log_type_enabled(v25, v26);
      v28 = *(_QWORD *)(v0 + 448);
      v30 = *(_QWORD *)(v0 + 424);
      v29 = *(_QWORD *)(v0 + 432);
      if (v27)
      {
        v31 = (uint8_t *)swift_slowAlloc();
        v80 = v24;
        v32 = swift_slowAlloc();
        v83 = v32;
        *(_DWORD *)v31 = 136315138;
        sub_244AF7684(&qword_2573DB430, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A08]);
        v33 = sub_244B17410();
        *(_QWORD *)(v0 + 280) = sub_244B139EC(v33, v34, &v83);
        sub_244B1735C();
        swift_bridgeObjectRelease();
        v35 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
        v35(v28, v30);
        _os_log_impl(&dword_244AF5000, v25, v26, "Request failed: %s", v31, 0xCu);
        swift_arrayDestroy();
        v36 = v32;
        v24 = v80;
        MEMORY[0x24951F40C](v36, -1, -1);
        MEMORY[0x24951F40C](v31, -1, -1);

      }
      else
      {

        v35 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
        v35(v28, v30);
      }
      v39 = *(_QWORD *)(v0 + 640);
      v40 = *(_QWORD *)(v0 + 456);
      v41 = *(_QWORD *)(v0 + 424);
      sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
      v42 = swift_allocError();
      v24(v43, v40, v41);
      *(_QWORD *)(v0 + 256) = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
      sub_244B17284();
      MEMORY[0x24951F334](v39);
      v35(v40, v41);
      goto LABEL_13;
    }
    MEMORY[0x24951F334](v11);
    sub_244B13AE0((__int128 *)(v0 + 176), v0 + 16);
    sub_244AF7B54(v0 + 16, v0 + 216);
    sub_244AF7B54(v0 + 16, v0 + 136);
    sub_244AF7B54(v0 + 16, v0 + 96);
    v12 = sub_244B17110();
    v13 = sub_244B172B4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v79 = swift_slowAlloc();
      v83 = v79;
      *(_DWORD *)v14 = 136315650;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 240));
      type = v13;
      v15 = sub_244B169B4();
      *(_QWORD *)(v0 + 328) = sub_244B139EC(v15, v16, &v83);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 216);
      *(_WORD *)(v14 + 12) = 2048;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 160));
      v17 = sub_244B169A8();
      __swift_destroy_boxed_opaque_existential_1(v0 + 136);
      *(_QWORD *)(v0 + 336) = v17;
      sub_244B1735C();
      *(_WORD *)(v14 + 22) = 2080;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 120));
      v18 = sub_244B169C0();
      *(_QWORD *)(v0 + 344) = sub_244B139EC(v18, v19, &v83);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v0 + 96);
      _os_log_impl(&dword_244AF5000, v12, type, "Request failed: %s %ld %s", (uint8_t *)v14, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v79, -1, -1);
      MEMORY[0x24951F40C](v14, -1, -1);

    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1(v0 + 136);

      __swift_destroy_boxed_opaque_existential_1(v0 + 216);
      __swift_destroy_boxed_opaque_existential_1(v0 + 96);
    }
    v75 = *(_QWORD *)(v0 + 424);
    *(_QWORD *)typea = *(_QWORD *)(v0 + 432);
    sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
    v73 = swift_allocError();
    v38 = v37;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    sub_244B169C0();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    sub_244B169B4();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    sub_244B169A8();
    sub_244AFFC88(MEMORY[0x24BEE4AF8]);
    sub_244B16F3C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)typea + 104))(v38, *MEMORY[0x24BE68978], v75);
    *(_QWORD *)(v0 + 320) = v73;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
    sub_244B17284();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    v8 = *(_QWORD *)(v0 + 304);
  }
  MEMORY[0x24951F334](v8);
LABEL_13:
  swift_bridgeObjectRetain();
  swift_retain();
  v44 = sub_244B170BC();
  sub_244B170E0();
  v45 = sub_244B17320();
  v46 = sub_244B17344();
  v47 = (_DWORD *)MEMORY[0x24BEE7810];
  if ((v46 & 1) != 0)
  {
    v82 = v45;
    v48 = *(_QWORD *)(v0 + 496);
    v49 = *(_QWORD *)(v0 + 472);
    v50 = *(_QWORD *)(v0 + 480);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v50 + 88))(v48, v49) == *v47)
    {
      v51 = 0;
      v52 = 0;
      v72 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 480) + 8))(*(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 472));
      v72 = "last token received requestIdentifier=%{public, signpost.description=attribute,public}s)";
      v52 = 2;
      v51 = 1;
    }
    v81 = *(void (**)(uint64_t, uint64_t))(v0 + 608);
    v54 = *(_QWORD *)(v0 + 584);
    v55 = *(_QWORD *)(v0 + 576);
    v74 = *(_QWORD *)(v0 + 504);
    v76 = *(_QWORD *)(v0 + 528);
    (*(void (**)(_QWORD))(v0 + 600))(*(_QWORD *)(v0 + 536));
    v56 = swift_slowAlloc();
    v57 = swift_slowAlloc();
    v83 = v57;
    *(_BYTE *)v56 = v52;
    *(_BYTE *)(v56 + 1) = v51;
    *(_WORD *)(v56 + 2) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 272) = sub_244B139EC(v55, v54, &v83);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v58 = sub_244B1708C();
    v53 = (_QWORD *)(v0 + 536);
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v44, v82, v58, "requestStream", v72, (uint8_t *)v56, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v57, -1, -1);
    MEMORY[0x24951F40C](v56, -1, -1);

    swift_release();
    v81(v76, v74);
    v47 = (_DWORD *)MEMORY[0x24BEE7810];
  }
  else
  {
    v53 = (_QWORD *)(v0 + 528);
    swift_bridgeObjectRelease_n();

    swift_release();
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 608))(*v53, *(_QWORD *)(v0 + 504));
  sub_244B16A8C();
  swift_release();
  v59 = sub_244B170BC();
  sub_244B170E0();
  v60 = sub_244B17320();
  if ((sub_244B17344() & 1) != 0)
  {
    v62 = *(_QWORD *)(v0 + 480);
    v61 = *(_QWORD *)(v0 + 488);
    v63 = *(_QWORD *)(v0 + 472);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v62 + 88))(v61, v63) == *v47)
    {
      v64 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 480) + 8))(*(_QWORD *)(v0 + 488), *(_QWORD *)(v0 + 472));
      v64 = "";
    }
    v66 = *(void (**)(uint64_t, uint64_t))(v0 + 608);
    v65 = (_QWORD *)(v0 + 536);
    v67 = *(_QWORD *)(v0 + 520);
    v68 = *(_QWORD *)(v0 + 504);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 600))(*(_QWORD *)(v0 + 536), v67, v68);
    v69 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v69 = 0;
    v70 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v59, v60, v70, "requestStream", v64, v69, 2u);
    MEMORY[0x24951F40C](v69, -1, -1);

    v66(v67, v68);
  }
  else
  {
    v65 = (_QWORD *)(v0 + 520);

  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 608))(*v65, *(_QWORD *)(v0 + 504));
  *(_QWORD *)(v0 + 264) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
  sub_244B17284();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B03448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
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
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;

  v8[67] = v25;
  v8[66] = v24;
  v8[65] = a8;
  v8[63] = a6;
  v8[64] = a7;
  v8[61] = a4;
  v8[62] = a5;
  v8[59] = a2;
  v8[60] = a3;
  v8[68] = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB360);
  v8[69] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3B0);
  v8[70] = swift_task_alloc();
  sub_244B16E10();
  v8[71] = swift_task_alloc();
  v9 = sub_244B16E28();
  v8[72] = v9;
  v8[73] = *(_QWORD *)(v9 - 8);
  v8[74] = swift_task_alloc();
  v8[75] = swift_task_alloc();
  v10 = sub_244B16A50();
  v8[76] = v10;
  v8[77] = *(_QWORD *)(v10 - 8);
  v8[78] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3A8);
  v8[79] = swift_task_alloc();
  v11 = sub_244B169FC();
  v8[80] = v11;
  v8[81] = *(_QWORD *)(v11 - 8);
  v8[82] = swift_task_alloc();
  v12 = sub_244B16B94();
  v8[83] = v12;
  v8[84] = *(_QWORD *)(v12 - 8);
  v8[85] = swift_task_alloc();
  v8[86] = swift_task_alloc();
  v8[87] = swift_task_alloc();
  v13 = sub_244B16A80();
  v8[88] = v13;
  v8[89] = *(_QWORD *)(v13 - 8);
  v8[90] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF68);
  v8[91] = swift_task_alloc();
  v8[92] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF50);
  v8[93] = swift_task_alloc();
  v8[94] = swift_task_alloc();
  v14 = sub_244B1696C();
  v8[95] = v14;
  v8[96] = *(_QWORD *)(v14 - 8);
  v8[97] = swift_task_alloc();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB458);
  v8[98] = v15;
  v8[99] = *(_QWORD *)(v15 - 8);
  v8[100] = swift_task_alloc();
  v8[101] = swift_task_alloc();
  v8[102] = swift_task_alloc();
  v16 = sub_244B16720();
  v8[103] = v16;
  v8[104] = *(_QWORD *)(v16 - 8);
  v8[105] = swift_task_alloc();
  v17 = sub_244B16CE4();
  v8[106] = v17;
  v8[107] = *(_QWORD *)(v17 - 8);
  v8[108] = swift_task_alloc();
  v18 = sub_244B170D4();
  v8[109] = v18;
  v8[110] = *(_QWORD *)(v18 - 8);
  v8[111] = swift_task_alloc();
  v19 = sub_244B170A4();
  v8[112] = v19;
  v8[113] = *(_QWORD *)(v19 - 8);
  v8[114] = swift_task_alloc();
  v8[115] = swift_task_alloc();
  v8[116] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF58);
  v20 = swift_task_alloc();
  v8[117] = v20;
  v21 = sub_244B16930();
  v8[118] = v21;
  v8[119] = *(_QWORD *)(v21 - 8);
  v8[120] = swift_task_alloc();
  v8[121] = swift_task_alloc();
  v8[122] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  v8[123] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  v22 = (_QWORD *)swift_task_alloc();
  v8[124] = v22;
  *v22 = v8;
  v22[1] = sub_244B0384C;
  return sub_244AF7F18(v20);
}

uint64_t sub_244B0384C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    *(_QWORD *)(v2 + 1016) = v0;
  }
  else
  {
    *(_DWORD *)(v2 + 1024) = *MEMORY[0x24BE78CE8];
    *(_DWORD *)(v2 + 1028) = *MEMORY[0x24BE78CE0];
    *(_DWORD *)(v2 + 1032) = *MEMORY[0x24BEE7810];
    *(_QWORD *)(v2 + 1000) = 0;
  }
  return swift_task_switch();
}

uint64_t sub_244B038E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  os_signpost_type_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
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
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t *v44;
  os_signpost_id_t v45;
  NSObject *v46;
  os_signpost_type_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  os_signpost_id_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(_QWORD, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
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
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  _BOOL4 v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
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
  uint64_t v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  int64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  NSObject *v151;
  os_log_type_t v152;
  _BOOL4 v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
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
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _QWORD *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void (*v186)(uint64_t, uint64_t);
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void (*v191)(uint64_t, _QWORD);
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209[4];

  v1 = *(_QWORD *)(v0 + 952);
  v2 = *(_QWORD *)(v0 + 944);
  v3 = *(_QWORD *)(v0 + 936);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    sub_244AF8EA0(v3, &qword_2573DAF58);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  v5 = *(_DWORD *)(v0 + 1024);
  v6 = *(_QWORD *)(v0 + 968);
  v7 = *(_QWORD *)(v0 + 960);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v6, v3, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v7, v6, v2);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 88))(v7, v2);
  if (v8 != v5)
  {
    if (v8 != *(_DWORD *)(v0 + 1028))
    {
      v31 = *(_QWORD *)(v0 + 968);
      v32 = *(_QWORD *)(v0 + 960);
      v33 = *(_QWORD *)(v0 + 952);
      v34 = *(_QWORD *)(v0 + 944);
      v35 = sub_244B16F48();
      sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
      swift_allocError();
      v37 = v36;
      v209[0] = 0;
      v209[1] = 0xE000000000000000;
      sub_244B17374();
      *(_QWORD *)(v0 + 376) = 0;
      *(_QWORD *)(v0 + 384) = 0xE000000000000000;
      sub_244B17218();
      sub_244B173C8();
      v38 = *(_QWORD *)(v0 + 384);
      *v37 = *(_QWORD *)(v0 + 376);
      v37[1] = v38;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v37, *MEMORY[0x24BE68930], v35);
      swift_willThrow();
      v39 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
      v39(v31, v34);
      v39(v32, v34);
LABEL_45:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v4 = *(uint64_t (**)(void))(v0 + 8);
      return v4();
    }
    v16 = *(_QWORD *)(v0 + 960);
    v17 = *(_QWORD *)(v0 + 776);
    v18 = *(_QWORD *)(v0 + 768);
    v19 = *(_QWORD *)(v0 + 760);
    v20 = *(_QWORD *)(v0 + 752);
    v21 = *(_QWORD *)(v0 + 744);
    v22 = *(_QWORD *)(v0 + 736);
    v200 = *(_QWORD *)(v0 + 712);
    v206 = *(_QWORD *)(v0 + 704);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 952) + 96))(v16, *(_QWORD *)(v0 + 944));
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF60);
    v24 = v16 + *(int *)(v23 + 48);
    v25 = v16 + *(int *)(v23 + 64);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32))(v17, v16, v19);
    sub_244B1520C(v24, v20, &qword_2573DAF50);
    sub_244B1520C(v25, v22, &qword_2573DAF68);
    sub_244AF8E5C(v20, v21, &qword_2573DAF50);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v200 + 48))(v21, 1, v206) == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 744), &qword_2573DAF50);
      v26 = *(_QWORD *)(v0 + 1000);
    }
    else
    {
      v75 = v0 + 56;
      v76 = (uint64_t *)(v0 + 216);
      v208 = (uint64_t *)(v0 + 256);
      v77 = *(_QWORD *)(v0 + 648);
      v78 = *(_QWORD *)(v0 + 640);
      v79 = *(_QWORD *)(v0 + 632);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 712) + 32))(*(_QWORD *)(v0 + 720), *(_QWORD *)(v0 + 744), *(_QWORD *)(v0 + 704));
      sub_244B16B88();
      sub_244B16A74();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48))(v79, 1, v78) == 1)
      {
        sub_244AF8EA0(*(_QWORD *)(v0 + 632), &qword_2573DB3A8);
      }
      else
      {
        v195 = *(_QWORD *)(v0 + 696);
        v80 = *(_QWORD *)(v0 + 688);
        v81 = *(_QWORD *)(v0 + 672);
        v82 = *(_QWORD *)(v0 + 664);
        v83 = *(_QWORD *)(v0 + 656);
        v84 = *(_QWORD *)(v0 + 648);
        v85 = *(_QWORD *)(v0 + 640);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v84 + 32))(v83, *(_QWORD *)(v0 + 632), v85);
        sub_244B169E4();
        sub_244B169F0();
        v76 = (uint64_t *)(v0 + 216);
        sub_244B16B88();
        v86 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
        v75 = v0 + 56;
        v86(v83, v85);
        (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v195, v82);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v81 + 32))(v195, v80, v82);
      }
      v87 = *(_QWORD *)(v0 + 848);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 672) + 16))(*(_QWORD *)(v0 + 680), *(_QWORD *)(v0 + 696), *(_QWORD *)(v0 + 664));
      v88 = sub_244B16D44();
      v89 = MEMORY[0x24BEB8550];
      *(_QWORD *)(v0 + 240) = v88;
      *(_QWORD *)(v0 + 248) = v89;
      __swift_allocate_boxed_opaque_existential_1(v76);
      swift_bridgeObjectRetain();
      sub_244B16D38();
      *(_QWORD *)(v0 + 280) = v87;
      *(_QWORD *)(v0 + 288) = sub_244AF7684(&qword_2573DB460, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8508], MEMORY[0x24BEB8510]);
      __swift_allocate_boxed_opaque_existential_1(v208);
      sub_244B16CF0();
      sub_244AF7B54((uint64_t)v208, v75);
      swift_bridgeObjectRetain_n();
      v90 = sub_244B17110();
      v91 = sub_244B172C0();
      v92 = os_log_type_enabled(v90, v91);
      v93 = *(_QWORD *)(v0 + 504);
      if (v92)
      {
        v94 = *(_QWORD *)(v0 + 496);
        v95 = v75;
        v96 = swift_slowAlloc();
        v97 = swift_slowAlloc();
        v209[0] = v97;
        *(_DWORD *)v96 = 136315394;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v96 + 4) = sub_244B139EC(v94, v93, v209);
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v96 + 12) = 2080;
        sub_244AF7B54(v95, v0 + 336);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB468);
        v98 = sub_244B17200();
        *(_QWORD *)(v96 + 14) = sub_244B139EC(v98, v99, v209);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1(v95);
        _os_log_impl(&dword_244AF5000, v90, v91, "%s Emitting TG event: %s", (uint8_t *)v96, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24951F40C](v97, -1, -1);
        MEMORY[0x24951F40C](v96, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        __swift_destroy_boxed_opaque_existential_1(v75);
      }
      v100 = *(_QWORD *)(v0 + 1000);
      v101 = sub_244B16B70();
      if (v100)
      {
        v202 = *(_QWORD *)(v0 + 968);
        v193 = *(_QWORD *)(v0 + 952);
        v196 = *(_QWORD *)(v0 + 944);
        v103 = *(_QWORD *)(v0 + 776);
        v104 = *(_QWORD *)(v0 + 768);
        v105 = *(_QWORD *)(v0 + 760);
        v106 = *(_QWORD *)(v0 + 752);
        v107 = *(_QWORD *)(v0 + 736);
        v108 = *(_QWORD *)(v0 + 720);
        v109 = *(_QWORD *)(v0 + 712);
        v110 = *(_QWORD *)(v0 + 704);
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 672) + 8))(*(_QWORD *)(v0 + 696), *(_QWORD *)(v0 + 664));
        (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v108, v110);
        sub_244AF8EA0(v107, &qword_2573DAF68);
        sub_244AF8EA0(v106, &qword_2573DAF50);
        (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v103, v105);
        (*(void (**)(uint64_t, uint64_t))(v193 + 8))(v202, v196);
        goto LABEL_44;
      }
      v111 = *(_QWORD *)(v0 + 808);
      v112 = *(_QWORD *)(v0 + 792);
      v113 = *(_QWORD *)(v0 + 784);
      v114 = *(_QWORD *)(v0 + 712);
      v197 = *(_QWORD *)(v0 + 704);
      v203 = *(_QWORD *)(v0 + 720);
      v115 = *(_QWORD *)(v0 + 696);
      v116 = *(_QWORD *)(v0 + 672);
      v117 = *(_QWORD *)(v0 + 664);
      *(_QWORD *)(v0 + 424) = v101;
      *(_QWORD *)(v0 + 432) = v102;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
      sub_244B17278();
      (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v111, v113);
      (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v115, v117);
      (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v203, v197);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v208);
      v26 = 0;
    }
    v118 = *(_QWORD *)(v0 + 728);
    v119 = *(_QWORD *)(v0 + 616);
    v120 = *(_QWORD *)(v0 + 608);
    sub_244AF8E5C(*(_QWORD *)(v0 + 736), v118, &qword_2573DAF68);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v119 + 48))(v118, 1, v120) == 1)
    {
      v121 = *(_QWORD *)(v0 + 968);
      v122 = *(_QWORD *)(v0 + 952);
      v123 = *(_QWORD *)(v0 + 944);
      v124 = *(_QWORD *)(v0 + 776);
      v125 = *(_QWORD *)(v0 + 768);
      v126 = *(_QWORD *)(v0 + 760);
      v127 = *(_QWORD *)(v0 + 752);
      v128 = *(_QWORD *)(v0 + 728);
      sub_244AF8EA0(*(_QWORD *)(v0 + 736), &qword_2573DAF68);
      sub_244AF8EA0(v127, &qword_2573DAF50);
      (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v124, v126);
      (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v121, v123);
      sub_244AF8EA0(v128, &qword_2573DAF68);
      goto LABEL_48;
    }
    v198 = v26;
    v208 = (uint64_t *)(v0 + 96);
    v204 = v0 + 176;
    v129 = *(_QWORD *)(v0 + 560);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 616) + 32))(*(_QWORD *)(v0 + 624), *(_QWORD *)(v0 + 728), *(_QWORD *)(v0 + 608));
    sub_244B16A2C();
    v130 = sub_244B16A20();
    v131 = *(_QWORD *)(v130 - 8);
    v132 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v131 + 48))(v129, 1, v130);
    v133 = *(_QWORD *)(v0 + 560);
    if (v132 == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 560), &qword_2573DB3B0);
      v134 = 0xE700000000000000;
      v135 = 0x6E776F6E6B6E75;
    }
    else
    {
      v135 = sub_244B16A14();
      v134 = v136;
      (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v133, v130);
    }
    v137 = (uint64_t *)(v0 + 456);
    MEMORY[0x24951EAF4](v135, v134, 6369134, 0xE300000000000000);
    sub_244B16A38();
    sub_244B16A08();
    sub_244B16834();
    sub_244B17200();
    v138 = sub_244B16A44();
    v139 = *(_QWORD *)(v138 + 16);
    if (v139)
    {
      *v137 = MEMORY[0x24BEE4AF8];
      sub_244B144EC(0, v139, 0);
      v140 = 0;
      v141 = *v137;
      v142 = *(_QWORD *)(*v137 + 16);
      do
      {
        v143 = *(int *)(v138 + 4 * v140 + 32);
        *v137 = v141;
        v144 = *(_QWORD *)(v141 + 24);
        if (v142 >= v144 >> 1)
        {
          sub_244B144EC(v144 > 1, v142 + 1, 1);
          v141 = *v137;
        }
        ++v140;
        *(_QWORD *)(v141 + 16) = v142 + 1;
        *(_QWORD *)(v141 + 8 * v142++ + 32) = v143;
      }
      while (v139 != v140);
    }
    swift_bridgeObjectRelease();
    v145 = *(_QWORD *)(v0 + 600);
    v146 = *(_QWORD *)(v0 + 592);
    v147 = *(_QWORD *)(v0 + 584);
    v148 = *(_QWORD *)(v0 + 576);
    v180 = *(_QWORD *)(v0 + 848);
    sub_244AFFC88(MEMORY[0x24BEE4AF8]);
    sub_244B16E1C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v147 + 16))(v146, v145, v148);
    v149 = sub_244B16B40();
    v150 = MEMORY[0x24BEB7F48];
    *(_QWORD *)(v0 + 160) = v149;
    *(_QWORD *)(v0 + 168) = v150;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
    swift_bridgeObjectRetain();
    sub_244B16B34();
    *(_QWORD *)(v0 + 120) = v180;
    *(_QWORD *)(v0 + 128) = sub_244AF7684(&qword_2573DB460, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8508], MEMORY[0x24BEB8510]);
    __swift_allocate_boxed_opaque_existential_1(v208);
    sub_244B16CF0();
    sub_244AF7B54((uint64_t)v208, v204);
    swift_bridgeObjectRetain_n();
    v151 = sub_244B17110();
    v152 = sub_244B172C0();
    v153 = os_log_type_enabled(v151, v152);
    v154 = *(_QWORD *)(v0 + 504);
    if (v153)
    {
      v155 = *(_QWORD *)(v0 + 496);
      v156 = swift_slowAlloc();
      v187 = swift_slowAlloc();
      v209[0] = v187;
      *(_DWORD *)v156 = 136315394;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 448) = sub_244B139EC(v155, v154, v209);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v156 + 12) = 2080;
      sub_244AF7B54(v204, v0 + 296);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB468);
      v157 = sub_244B17200();
      *(_QWORD *)(v0 + 440) = sub_244B139EC(v157, v158, v209);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1(v204);
      _os_log_impl(&dword_244AF5000, v151, v152, "%s Emitting TG event: %s", (uint8_t *)v156, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v187, -1, -1);
      MEMORY[0x24951F40C](v156, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      __swift_destroy_boxed_opaque_existential_1(v204);
    }
    v159 = v198;
    v160 = sub_244B16B70();
    v162 = *(_QWORD *)(v0 + 968);
    v199 = *(_QWORD *)(v0 + 952);
    v205 = *(_QWORD *)(v0 + 944);
    if (!v159)
    {
      v173 = *(_QWORD *)(v0 + 800);
      v174 = *(_QWORD *)(v0 + 792);
      v175 = *(_QWORD *)(v0 + 776);
      v190 = *(_QWORD *)(v0 + 768);
      v194 = *(_QWORD *)(v0 + 760);
      v185 = *(_QWORD *)(v0 + 736);
      v188 = *(_QWORD *)(v0 + 752);
      v181 = *(_QWORD *)(v0 + 784);
      v182 = *(_QWORD *)(v0 + 616);
      v183 = *(_QWORD *)(v0 + 608);
      v184 = *(_QWORD *)(v0 + 624);
      v176 = *(_QWORD *)(v0 + 600);
      v177 = *(_QWORD *)(v0 + 584);
      v178 = *(_QWORD *)(v0 + 576);
      *(_QWORD *)(v0 + 392) = v160;
      *(_QWORD *)(v0 + 400) = v161;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
      sub_244B17278();
      (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v173, v181);
      (*(void (**)(uint64_t, uint64_t))(v177 + 8))(v176, v178);
      (*(void (**)(uint64_t, uint64_t))(v182 + 8))(v184, v183);
      sub_244AF8EA0(v185, &qword_2573DAF68);
      sub_244AF8EA0(v188, &qword_2573DAF50);
      (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v175, v194);
      (*(void (**)(uint64_t, uint64_t))(v199 + 8))(v162, v205);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v208);
      goto LABEL_48;
    }
    v163 = *(_QWORD *)(v0 + 776);
    v164 = *(_QWORD *)(v0 + 768);
    v165 = *(_QWORD *)(v0 + 760);
    v166 = *(_QWORD *)(v0 + 752);
    v167 = *(_QWORD *)(v0 + 736);
    v168 = *(_QWORD *)(v0 + 624);
    v169 = *(_QWORD *)(v0 + 968);
    v170 = *(_QWORD *)(v0 + 616);
    v171 = *(_QWORD *)(v0 + 608);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 584) + 8))(*(_QWORD *)(v0 + 600), *(_QWORD *)(v0 + 576));
    (*(void (**)(uint64_t, uint64_t))(v170 + 8))(v168, v171);
    sub_244AF8EA0(v167, &qword_2573DAF68);
    sub_244AF8EA0(v166, &qword_2573DAF50);
    (*(void (**)(uint64_t, uint64_t))(v164 + 8))(v163, v165);
    (*(void (**)(uint64_t, uint64_t))(v199 + 8))(v169, v205);
LABEL_44:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v208);
    goto LABEL_45;
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 952) + 96))(*(_QWORD *)(v0 + 960), *(_QWORD *)(v0 + 944));
  swift_retain();
  v9 = sub_244B170BC();
  sub_244B170E0();
  v10 = sub_244B17320();
  if ((sub_244B17344() & 1) != 0)
  {
    v11 = *(_DWORD *)(v0 + 1032);
    v12 = *(_QWORD *)(v0 + 888);
    v13 = *(_QWORD *)(v0 + 880);
    v14 = *(_QWORD *)(v0 + 872);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v13 + 88))(v12, v14) == v11)
    {
      v15 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 880) + 8))(*(_QWORD *)(v0 + 888), *(_QWORD *)(v0 + 872));
      v15 = "token received";
    }
    v40 = *(_QWORD *)(v0 + 928);
    v41 = *(_QWORD *)(v0 + 920);
    v42 = *(_QWORD *)(v0 + 904);
    v43 = *(_QWORD *)(v0 + 896);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v41, v40, v43);
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    v45 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v9, v10, v45, "requestStream", v15, v44, 2u);
    MEMORY[0x24951F40C](v44, -1, -1);

    swift_release();
    v30 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
    v30(v40, v43);
    v30(v41, v43);
  }
  else
  {
    v27 = *(_QWORD *)(v0 + 928);
    v28 = *(_QWORD *)(v0 + 904);
    v29 = *(_QWORD *)(v0 + 896);

    swift_release();
    v30 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v30(v27, v29);
  }
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v46 = sub_244B170BC();
  v47 = sub_244B1732C();
  if ((sub_244B17344() & 1) != 0)
  {
    v48 = *(_QWORD *)(v0 + 920);
    v50 = *(_QWORD *)(v0 + 496);
    v49 = *(_QWORD *)(v0 + 504);
    v189 = *(_QWORD *)(v0 + 896);
    v191 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 904) + 16);
    v191(v48, *(_QWORD *)(v0 + 912));
    v186 = v30;
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = swift_slowAlloc();
    v209[0] = v52;
    *(_DWORD *)v51 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 464) = sub_244B139EC(v50, v49, v209);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v53 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v46, v47, v53, "requestStream", "extend token requestIdentifier=%{public, signpost.description=attribute,public}s)", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v52, -1, -1);
    MEMORY[0x24951F40C](v51, -1, -1);

    v54 = v186;
    v186(v48, v189);
    v55 = (void (*)(_QWORD, uint64_t, uint64_t))v191;
  }
  else
  {
    v56 = *(_QWORD *)(v0 + 904);

    swift_bridgeObjectRelease_n();
    v55 = *(void (**)(_QWORD, uint64_t, uint64_t))(v56 + 16);
    v54 = v30;
  }
  v57 = *(_QWORD *)(v0 + 912);
  v58 = *(_QWORD *)(v0 + 896);
  v192 = *(_QWORD *)(v0 + 1000);
  v59 = *(_QWORD *)(v0 + 840);
  v60 = *(_QWORD *)(v0 + 832);
  v61 = *(_QWORD *)(v0 + 824);
  v62 = *(uint64_t **)(v0 + 488);
  v55(*(_QWORD *)(v0 + 920), v57, v58);
  sub_244B170F8();
  swift_allocObject();
  v63 = sub_244B170EC();
  v54(v57, v58);
  *v62 = v63;
  swift_release();
  swift_bridgeObjectRetain();
  sub_244B16714();
  sub_244B16708();
  (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v59, v61);
  v64 = sub_244B16D5C();
  v65 = MEMORY[0x24BEB85A8];
  *(_QWORD *)(v0 + 40) = v64;
  *(_QWORD *)(v0 + 48) = v65;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
  swift_bridgeObjectRetain();
  sub_244B16D50();
  sub_244B16CF0();
  sub_244B16AA4();
  swift_bridgeObjectRelease();
  sub_244AF7684(&qword_2573DB460, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8508], MEMORY[0x24BEB8510]);
  v66 = sub_244B16B70();
  v68 = *(_QWORD *)(v0 + 968);
  v69 = *(_QWORD *)(v0 + 952);
  v70 = *(_QWORD *)(v0 + 944);
  v71 = *(_QWORD *)(v0 + 864);
  v72 = *(_QWORD *)(v0 + 856);
  v73 = *(_QWORD *)(v0 + 848);
  if (v192)
  {
    (*(void (**)(_QWORD, _QWORD))(v69 + 8))(*(_QWORD *)(v0 + 968), *(_QWORD *)(v0 + 944));
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
    goto LABEL_45;
  }
  v74 = *(_QWORD *)(v0 + 816);
  v201 = *(_QWORD *)(v0 + 792);
  v207 = *(_QWORD *)(v0 + 784);
  *(_QWORD *)(v0 + 408) = v66;
  *(_QWORD *)(v0 + 416) = v67;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
  sub_244B17278();
  (*(void (**)(uint64_t, uint64_t))(v201 + 8))(v74, v207);
  (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v71, v73);
LABEL_48:
  v179 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1008) = v179;
  *v179 = v0;
  v179[1] = sub_244B04FE4;
  return sub_244AF7F18(*(_QWORD *)(v0 + 936));
}

uint64_t sub_244B04FE4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 1016) = v0;
  else
    *(_QWORD *)(v2 + 1000) = 0;
  return swift_task_switch();
}

uint64_t sub_244B0504C()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B05220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v9 + 72) = a8;
  *(_QWORD *)(v9 + 80) = v8;
  *(_BYTE *)(v9 + 224) = a6;
  *(_QWORD *)(v9 + 56) = a5;
  *(_QWORD *)(v9 + 64) = a7;
  *(_QWORD *)(v9 + 40) = a3;
  *(_QWORD *)(v9 + 48) = a4;
  *(_QWORD *)(v9 + 24) = a1;
  *(_QWORD *)(v9 + 32) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB1A0);
  *(_QWORD *)(v9 + 88) = swift_task_alloc();
  v10 = sub_244B16EC4();
  *(_QWORD *)(v9 + 96) = v10;
  *(_QWORD *)(v9 + 104) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 112) = swift_task_alloc();
  *(_QWORD *)(v9 + 120) = swift_task_alloc();
  v11 = sub_244B16720();
  *(_QWORD *)(v9 + 128) = v11;
  *(_QWORD *)(v9 + 136) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 144) = swift_task_alloc();
  v12 = sub_244B17050();
  *(_QWORD *)(v9 + 152) = v12;
  *(_QWORD *)(v9 + 160) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v9 + 168) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B05314()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  int8x16_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  sub_244AF75AC();
  if ((sub_244B172F0() & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 16))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 152));
    v1 = sub_244B17110();
    v2 = sub_244B172CC();
    v3 = os_log_type_enabled(v1, v2);
    v4 = *(_QWORD *)(v0 + 160);
    v5 = *(_QWORD *)(v0 + 168);
    v6 = *(_QWORD *)(v0 + 152);
    if (v3)
    {
      v7 = *(_QWORD *)(v0 + 144);
      v36 = *(_QWORD *)(v0 + 136);
      v37 = *(_QWORD *)(v0 + 128);
      v41 = *(_QWORD *)(v0 + 152);
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v43 = v9;
      *(_DWORD *)v8 = 136315138;
      sub_244B17008();
      v10 = sub_244B16708();
      v12 = v11;
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v7, v37);
      *(_QWORD *)(v0 + 16) = sub_244B139EC(v10, v12, &v43);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v41);
      _os_log_impl(&dword_244AF5000, v1, v2, "%s Fallback is enabled", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v9, -1, -1);
      MEMORY[0x24951F40C](v8, -1, -1);

    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    }
    v24 = sub_244B16F48();
    sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
    swift_allocError();
    v26 = v25;
    sub_244AFFC88(MEMORY[0x24BEE4AF8]);
    sub_244B16F3C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BE68978], v24);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 136);
    v13 = *(_QWORD *)(v0 + 144);
    v15 = *(_QWORD *)(v0 + 128);
    v16 = *(_QWORD *)(v0 + 80);
    v17 = *(_QWORD *)(v0 + 88);
    sub_244B17008();
    v42 = sub_244B16708();
    v19 = v18;
    *(_QWORD *)(v0 + 176) = v18;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    logMetric(logger:name:startInstant:)(v16 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, 0xD000000000000012, 0x8000000244B17F20);
    sub_244B16EB8();
    sub_244B16FFC();
    v20 = sub_244B16F30();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v17, 1, v20);
    v23 = *(_QWORD *)(v0 + 88);
    if (v22 == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 88), &qword_2573DB1A0);
    }
    else
    {
      sub_244B16F18();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v20);
    }
    v28 = v22 == 1;
    v30 = *(_QWORD *)(v0 + 112);
    v29 = *(_QWORD *)(v0 + 120);
    v32 = *(_QWORD *)(v0 + 96);
    v31 = *(_QWORD *)(v0 + 104);
    v33 = *(_QWORD *)(v0 + 80);
    LOBYTE(v43) = v28;
    v40 = vextq_s8(*(int8x16_t *)(v0 + 48), *(int8x16_t *)(v0 + 48), 8uLL);
    v38 = *(_OWORD *)(v0 + 32);
    v39 = *(_OWORD *)(v0 + 64);
    sub_244B16EAC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v30, v29, v32);
    v34 = swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v34;
    *(_OWORD *)(v34 + 16) = v38;
    *(_QWORD *)(v34 + 32) = v33;
    *(_QWORD *)(v34 + 40) = v42;
    *(_QWORD *)(v34 + 48) = v19;
    *(int8x16_t *)(v34 + 56) = v40;
    *(_OWORD *)(v34 + 72) = v39;
    v35 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v35;
    *v35 = v0;
    v35[1] = sub_244B057AC;
    return sub_244AFFEC8(*(_QWORD *)(v0 + 24), v42, v19, *(_BYTE *)(v0 + 224), *(_QWORD *)(v0 + 112), (uint64_t)&unk_2573DB440, v34);
  }
}

uint64_t sub_244B057AC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  v3 = v2[14];
  v4 = v2[12];
  v5 = *(void (**)(uint64_t, uint64_t))(v2[13] + 8);
  if (v0)
    v2[27] = v5;
  else
    v2[26] = v5;
  v5(v3, v4);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B05858(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v9 + 72) = a8;
  *(_QWORD *)(v9 + 80) = v8;
  *(_BYTE *)(v9 + 224) = a6;
  *(_QWORD *)(v9 + 56) = a5;
  *(_QWORD *)(v9 + 64) = a7;
  *(_QWORD *)(v9 + 40) = a3;
  *(_QWORD *)(v9 + 48) = a4;
  *(_QWORD *)(v9 + 24) = a1;
  *(_QWORD *)(v9 + 32) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB1A0);
  *(_QWORD *)(v9 + 88) = swift_task_alloc();
  v10 = sub_244B16EC4();
  *(_QWORD *)(v9 + 96) = v10;
  *(_QWORD *)(v9 + 104) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 112) = swift_task_alloc();
  *(_QWORD *)(v9 + 120) = swift_task_alloc();
  v11 = sub_244B16720();
  *(_QWORD *)(v9 + 128) = v11;
  *(_QWORD *)(v9 + 136) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 144) = swift_task_alloc();
  v12 = sub_244B17050();
  *(_QWORD *)(v9 + 152) = v12;
  *(_QWORD *)(v9 + 160) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v9 + 168) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B0594C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  int8x16_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  sub_244AF75AC();
  if ((sub_244B172F0() & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 16))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 152));
    v1 = sub_244B17110();
    v2 = sub_244B172CC();
    v3 = os_log_type_enabled(v1, v2);
    v4 = *(_QWORD *)(v0 + 160);
    v5 = *(_QWORD *)(v0 + 168);
    v6 = *(_QWORD *)(v0 + 152);
    if (v3)
    {
      v7 = *(_QWORD *)(v0 + 144);
      v36 = *(_QWORD *)(v0 + 136);
      v37 = *(_QWORD *)(v0 + 128);
      v41 = *(_QWORD *)(v0 + 152);
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v43 = v9;
      *(_DWORD *)v8 = 136315138;
      sub_244B17008();
      v10 = sub_244B16708();
      v12 = v11;
      (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v7, v37);
      *(_QWORD *)(v0 + 16) = sub_244B139EC(v10, v12, &v43);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v41);
      _os_log_impl(&dword_244AF5000, v1, v2, "%s Fallback is enabled", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v9, -1, -1);
      MEMORY[0x24951F40C](v8, -1, -1);

    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
    }
    v24 = sub_244B16F48();
    sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
    swift_allocError();
    v26 = v25;
    sub_244AFFC88(MEMORY[0x24BEE4AF8]);
    sub_244B16F3C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BE68978], v24);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 136);
    v13 = *(_QWORD *)(v0 + 144);
    v15 = *(_QWORD *)(v0 + 128);
    v16 = *(_QWORD *)(v0 + 80);
    v17 = *(_QWORD *)(v0 + 88);
    sub_244B17008();
    v42 = sub_244B16708();
    v19 = v18;
    *(_QWORD *)(v0 + 176) = v18;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    logMetric(logger:name:startInstant:)(v16 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, 0xD000000000000012, 0x8000000244B17F20);
    sub_244B16EB8();
    sub_244B16FFC();
    v20 = sub_244B16F30();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v17, 1, v20);
    v23 = *(_QWORD *)(v0 + 88);
    if (v22 == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 88), &qword_2573DB1A0);
    }
    else
    {
      sub_244B16F18();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v23, v20);
    }
    v28 = v22 == 1;
    v30 = *(_QWORD *)(v0 + 112);
    v29 = *(_QWORD *)(v0 + 120);
    v32 = *(_QWORD *)(v0 + 96);
    v31 = *(_QWORD *)(v0 + 104);
    v33 = *(_QWORD *)(v0 + 80);
    LOBYTE(v43) = v28;
    v40 = vextq_s8(*(int8x16_t *)(v0 + 48), *(int8x16_t *)(v0 + 48), 8uLL);
    v38 = *(_OWORD *)(v0 + 32);
    v39 = *(_OWORD *)(v0 + 64);
    sub_244B16EAC();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v30, v29, v32);
    v34 = swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v34;
    *(_OWORD *)(v34 + 16) = v38;
    *(_QWORD *)(v34 + 32) = v33;
    *(_QWORD *)(v34 + 40) = v42;
    *(_QWORD *)(v34 + 48) = v19;
    *(int8x16_t *)(v34 + 56) = v40;
    *(_OWORD *)(v34 + 72) = v39;
    v35 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v35;
    *v35 = v0;
    v35[1] = sub_244B05DE4;
    return sub_244B004FC(*(_QWORD *)(v0 + 24), v42, v19, *(_BYTE *)(v0 + 224), *(_QWORD *)(v0 + 112), (uint64_t)&unk_2573DB2D8, v34);
  }
}

uint64_t sub_244B05DE4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  v3 = v2[14];
  v4 = v2[12];
  v5 = *(void (**)(uint64_t, uint64_t))(v2[13] + 8);
  if (v0)
    v2[27] = v5;
  else
    v2[26] = v5;
  v5(v3, v4);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B05E90()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 208))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B05F10()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 216))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B05F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_244B17248();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_244B1723C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_244AF8EA0(a1, &qword_2573DB3F0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_244B17230();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t NewInferenceProvider.requestOneShot(clientData:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[13] = a3;
  v4[14] = v3;
  v4[11] = a1;
  v4[12] = a2;
  v5 = sub_244B17050();
  v4[15] = v5;
  v4[16] = *(_QWORD *)(v5 - 8);
  v4[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB1A0);
  v4[18] = swift_task_alloc();
  v6 = sub_244B17128();
  v4[19] = v6;
  v4[20] = *(_QWORD *)(v6 - 8);
  v4[21] = swift_task_alloc();
  v7 = sub_244B170A4();
  v4[22] = v7;
  v4[23] = *(_QWORD *)(v7 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v8 = sub_244B16720();
  v4[26] = v8;
  v4[27] = *(_QWORD *)(v8 - 8);
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B061FC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  unint64_t v7;
  NSObject *v8;
  os_signpost_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  void (*v14)(_QWORD, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v47;
  os_log_type_t type;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(uint64_t, _QWORD);
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v1 = v0[29];
  v3 = v0[26];
  v2 = v0[27];
  sub_244B17008();
  v4 = sub_244B16708();
  v0[30] = v5;
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v7 = v5;
  v49 = v6;
  v6(v1, v3);
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v8 = sub_244B170BC();
  v9 = sub_244B1732C();
  v58 = v7;
  v59 = v4;
  if ((sub_244B17344() & 1) != 0)
  {
    v10 = v0[24];
    v51 = v0[23];
    v53 = v0[22];
    v56 = *(void (**)(uint64_t, _QWORD))(v51 + 16);
    v56(v10, v0[25]);
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v60 = v12;
    *(_DWORD *)v11 = 136446210;
    swift_bridgeObjectRetain();
    v0[10] = sub_244B139EC(v4, v7, &v60);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v13 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v8, v9, v13, "requestOneShot", "full request requestIdentifier=%{public, signpost.description=attribute,public}s)", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v12, -1, -1);
    MEMORY[0x24951F40C](v11, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v10, v53);
    v14 = (void (*)(_QWORD, uint64_t, uint64_t))v56;
  }
  else
  {
    v15 = v0[23];

    swift_bridgeObjectRelease_n();
    v14 = *(void (**)(_QWORD, uint64_t, uint64_t))(v15 + 16);
  }
  v16 = v0[25];
  v18 = v0[22];
  v17 = v0[23];
  v19 = v0[20];
  v54 = v0[21];
  v20 = v0[18];
  v14(v0[24], v16, v18);
  sub_244B170F8();
  swift_allocObject();
  v57 = sub_244B170EC();
  v0[31] = v57;
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  (*(void (**)(uint64_t))(v19 + 16))(v54);
  sub_244B17008();
  sub_244B17044();
  sub_244B17020();
  sub_244B16FFC();
  v21 = sub_244B16F30();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21);
  v24 = v0[18];
  if (v23 == 1)
  {
    sub_244AF8EA0(v0[18], &qword_2573DB1A0);
  }
  else
  {
    sub_244B16F18();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v21);
  }
  v26 = v0[16];
  v25 = v0[17];
  v27 = v0[15];
  v28 = v0[13];
  v29 = sub_244B16AB0();
  swift_allocObject();
  LOBYTE(v60) = v23 == 1;
  v30 = sub_244B16A98();
  v0[32] = v30;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v25, v28, v27);
  v31 = sub_244B17110();
  v32 = sub_244B172D8();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = v0[29];
    v34 = v0[26];
    type = v32;
    v47 = v0[17];
    v50 = v0[16];
    v55 = v0[15];
    v35 = (uint8_t *)swift_slowAlloc();
    v52 = swift_slowAlloc();
    v60 = v52;
    *(_DWORD *)v35 = 136315138;
    sub_244B17008();
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v36 = sub_244B17410();
    v38 = v37;
    v49(v33, v34);
    v0[9] = sub_244B139EC(v36, v38, &v60);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v47, v55);
    _os_log_impl(&dword_244AF5000, v31, type, "%s executing one shot request", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v52, -1, -1);
    MEMORY[0x24951F40C](v35, -1, -1);

  }
  else
  {
    v40 = v0[16];
    v39 = v0[17];
    v41 = v0[15];

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
  }
  v42 = MEMORY[0x24BE78E70];
  v43 = v0[14];
  v0[5] = v29;
  v0[6] = v42;
  v0[2] = v30;
  v44 = (_QWORD *)swift_task_alloc();
  v0[33] = v44;
  v44[2] = v43;
  v44[3] = v57;
  v44[4] = v30;
  v44[5] = v59;
  v44[6] = v58;
  swift_retain();
  v45 = (_QWORD *)swift_task_alloc();
  v0[34] = v45;
  *v45 = v0;
  v45[1] = sub_244B067BC;
  return sub_244B05858((uint64_t)(v0 + 7), v0[11], v0[12], v0[13], (uint64_t)(v0 + 2), 1, (uint64_t)&unk_2573DB1C8, (uint64_t)v44);
}

uint64_t sub_244B067BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 280) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  }
  return swift_task_switch();
}

uint64_t sub_244B06848()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_release();
  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_244B068F8()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B069C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
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

  v7[26] = a6;
  v7[27] = a7;
  v7[24] = a4;
  v7[25] = a5;
  v7[22] = a2;
  v7[23] = a3;
  v7[21] = a1;
  sub_244B16D74();
  v7[28] = swift_task_alloc();
  v8 = sub_244B16B58();
  v7[29] = v8;
  v7[30] = *(_QWORD *)(v8 - 8);
  v7[31] = swift_task_alloc();
  v9 = sub_244B16BB8();
  v7[32] = v9;
  v7[33] = *(_QWORD *)(v9 - 8);
  v7[34] = swift_task_alloc();
  sub_244B16BF4();
  v7[35] = swift_task_alloc();
  v10 = sub_244B16CD8();
  v7[36] = v10;
  v7[37] = *(_QWORD *)(v10 - 8);
  v7[38] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3A8);
  v7[39] = swift_task_alloc();
  v11 = sub_244B169FC();
  v7[40] = v11;
  v7[41] = *(_QWORD *)(v11 - 8);
  v7[42] = swift_task_alloc();
  v12 = sub_244B16A80();
  v7[43] = v12;
  v7[44] = *(_QWORD *)(v12 - 8);
  v7[45] = swift_task_alloc();
  v13 = sub_244B16B94();
  v7[46] = v13;
  v7[47] = *(_QWORD *)(v13 - 8);
  v7[48] = swift_task_alloc();
  v7[49] = swift_task_alloc();
  v7[50] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB360);
  v7[51] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3B0);
  v7[52] = swift_task_alloc();
  v14 = sub_244B16E10();
  v7[53] = v14;
  v7[54] = *(_QWORD *)(v14 - 8);
  v7[55] = swift_task_alloc();
  v15 = sub_244B16A50();
  v7[56] = v15;
  v7[57] = *(_QWORD *)(v15 - 8);
  v7[58] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF68);
  v7[59] = swift_task_alloc();
  v7[60] = swift_task_alloc();
  v16 = sub_244B1696C();
  v7[61] = v16;
  v7[62] = *(_QWORD *)(v16 - 8);
  v7[63] = swift_task_alloc();
  v17 = sub_244B170D4();
  v7[64] = v17;
  v7[65] = *(_QWORD *)(v17 - 8);
  v7[66] = swift_task_alloc();
  v7[67] = swift_task_alloc();
  v7[68] = swift_task_alloc();
  v7[69] = swift_task_alloc();
  v7[70] = swift_task_alloc();
  v7[71] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF58);
  v7[72] = swift_task_alloc();
  v18 = sub_244B16930();
  v7[73] = v18;
  v7[74] = *(_QWORD *)(v18 - 8);
  v7[75] = swift_task_alloc();
  v7[76] = swift_task_alloc();
  v19 = sub_244B170A4();
  v7[77] = v19;
  v7[78] = *(_QWORD *)(v19 - 8);
  v7[79] = swift_task_alloc();
  v7[80] = swift_task_alloc();
  v7[81] = swift_task_alloc();
  v7[82] = swift_task_alloc();
  v7[83] = swift_task_alloc();
  v7[84] = swift_task_alloc();
  v7[85] = swift_task_alloc();
  v7[86] = swift_task_alloc();
  v7[87] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3B8);
  v7[88] = swift_task_alloc();
  v7[89] = swift_task_alloc();
  v7[90] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF50);
  v7[91] = swift_task_alloc();
  v7[92] = swift_task_alloc();
  v7[93] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B06E3C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_signpost_type_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD);
  uint8_t *v13;
  uint64_t v14;
  os_signpost_id_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0[93];
  v2 = v0[90];
  v3 = v0[43];
  v4 = v0[44];
  v0[12] = 0;
  v0[13] = 0xE000000000000000;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v1, 1, 1, v3);
  v5 = sub_244B16E28();
  v0[94] = v5;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  v0[95] = v6;
  v6(v2, 1, 1, v5);
  v0[96] = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v7 = sub_244B170BC();
  v8 = sub_244B1732C();
  if ((sub_244B17344() & 1) != 0)
  {
    v9 = v0[86];
    v23 = v0[77];
    v24 = v0[78];
    v11 = v0[26];
    v10 = v0[27];
    v12 = *(void (**)(uint64_t, _QWORD))(v24 + 16);
    v12(v9, v0[87]);
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v25 = v14;
    *(_DWORD *)v13 = 136446210;
    swift_bridgeObjectRetain();
    v0[20] = sub_244B139EC(v11, v10, &v25);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v15 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v7, v8, v15, "requestOneShot", "first token requestIdentifier=%{public, signpost.description=attribute,public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v14, -1, -1);
    MEMORY[0x24951F40C](v13, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v9, v23);
  }
  else
  {
    v16 = v0[78];

    swift_bridgeObjectRelease_n();
    v12 = *(void (**)(uint64_t, _QWORD))(v16 + 16);
  }
  v0[97] = v12;
  v17 = v0[87];
  v18 = v0[78];
  v19 = v0[77];
  ((void (*)(_QWORD, uint64_t, uint64_t))v12)(v0[86], v17, v19);
  v0[98] = sub_244B170F8();
  swift_allocObject();
  v0[99] = sub_244B170EC();
  v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v0[100] = v20;
  v20(v17, v19);
  v21 = (_QWORD *)swift_task_alloc();
  v0[101] = v21;
  *v21 = v0;
  v21[1] = sub_244B070FC;
  return sub_244AF7F18(v0[72]);
}

uint64_t sub_244B070FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    v3 = *(_QWORD *)(v2 + 792);
    *(_QWORD *)(v2 + 856) = v0;
    *(_QWORD *)(v2 + 848) = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_DWORD *)(v2 + 864) = *MEMORY[0x24BE78CE8];
    v4 = (_DWORD *)MEMORY[0x24BEE7810];
    *(_DWORD *)(v2 + 868) = *MEMORY[0x24BE78CE0];
    *(_DWORD *)(v2 + 872) = *v4;
    *(_QWORD *)(v2 + 824) = *(_QWORD *)(v2 + 792);
    *(_QWORD *)(v2 + 816) = 0;
  }
  return swift_task_switch();
}

uint64_t sub_244B071AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_signpost_type_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  os_signpost_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t *v24;
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
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  os_signpost_id_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_signpost_type_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  os_signpost_type_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t *v103;
  NSObject *v104;
  os_signpost_type_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  _QWORD *v111;
  uint64_t *v112;
  void (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t, uint64_t, uint64_t);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint8_t *v118;
  os_signpost_id_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t (*v122)(void);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  os_signpost_id_t v133;
  NSObject *v134;
  os_signpost_type_t v135;
  void (*v136)(uint64_t, uint64_t);
  uint64_t v137;
  uint64_t v138;
  uint8_t *v139;
  os_signpost_id_t v140;
  void (*v141)(uint64_t, uint64_t);
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  int v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  void (*v155)(uint64_t, uint64_t);
  uint64_t v156;
  uint64_t v157;
  uint8_t *v158;
  os_signpost_id_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void (*v174)(uint64_t, uint64_t);
  uint64_t v175;
  uint64_t v176;
  uint8_t *v177;
  os_signpost_id_t v178;
  uint64_t v179;
  int64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  _QWORD *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  void (*v217)(uint64_t, uint64_t);
  uint64_t v218;
  os_signpost_type_t v219;
  uint64_t v220;
  void (*v221)(uint64_t, uint64_t);
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  os_signpost_type_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void (*v237)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v238[4];

  v1 = *(_QWORD *)(v0 + 592);
  v2 = *(_QWORD *)(v0 + 584);
  v3 = *(_QWORD *)(v0 + 576);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v2) == 1)
  {
    sub_244AF8EA0(v3, &qword_2573DAF58);
    swift_bridgeObjectRetain_n();
    v4 = sub_244B170BC();
    sub_244B170E0();
    v5 = sub_244B17320();
    if ((sub_244B17344() & 1) != 0)
    {
      v229 = v5;
      v6 = *(_DWORD *)(v0 + 872);
      v7 = *(_QWORD *)(v0 + 560);
      v8 = *(_QWORD *)(v0 + 520);
      v9 = *(_QWORD *)(v0 + 512);
      swift_retain();
      sub_244B17104();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == v6)
      {
        v10 = 0;
        v11 = 0;
        v215 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 520) + 8))(*(_QWORD *)(v0 + 560), *(_QWORD *)(v0 + 512));
        v215 = "last token received requestIdentifier=%{public, signpost.description=attribute,public}s";
        v11 = 2;
        v10 = 1;
      }
      v221 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
      v24 = (uint64_t *)(v0 + 688);
      v205 = *(_QWORD *)(v0 + 616);
      v211 = *(_QWORD *)(v0 + 664);
      v46 = *(_QWORD *)(v0 + 208);
      v45 = *(_QWORD *)(v0 + 216);
      (*(void (**)(_QWORD))(v0 + 776))(*(_QWORD *)(v0 + 688));
      v47 = swift_slowAlloc();
      v48 = swift_slowAlloc();
      v238[0] = v48;
      *(_BYTE *)v47 = v11;
      *(_BYTE *)(v47 + 1) = v10;
      *(_WORD *)(v47 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 144) = sub_244B139EC(v46, v45, v238);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      v49 = sub_244B1708C();
      _os_signpost_emit_with_name_impl(&dword_244AF5000, v4, v229, v49, "requestOneShot", v215, (uint8_t *)v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v48, -1, -1);
      MEMORY[0x24951F40C](v47, -1, -1);

      v221(v211, v205);
    }
    else
    {
      v24 = (uint64_t *)(v0 + 664);
      swift_bridgeObjectRelease_n();

    }
    v50 = *v24;
    v51 = *(_QWORD *)(v0 + 744);
    v52 = *(_QWORD *)(v0 + 728);
    v53 = *(_QWORD *)(v0 + 344);
    v54 = *(_QWORD *)(v0 + 352);
    (*(void (**)(uint64_t, _QWORD))(v0 + 800))(v50, *(_QWORD *)(v0 + 616));
    sub_244B16B88();
    sub_244AF8E5C(v51, v52, &qword_2573DAF50);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48))(v52, 1, v53) == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 728), &qword_2573DAF50);
    }
    else
    {
      v55 = *(_QWORD *)(v0 + 320);
      v56 = *(_QWORD *)(v0 + 328);
      v57 = *(_QWORD *)(v0 + 312);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 352) + 32))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 728), *(_QWORD *)(v0 + 344));
      sub_244B16A74();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v57, 1, v55) == 1)
      {
        v58 = *(_QWORD *)(v0 + 312);
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 352) + 8))(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 344));
        sub_244AF8EA0(v58, &qword_2573DB3A8);
      }
      else
      {
        v80 = *(_QWORD *)(v0 + 392);
        v79 = *(_QWORD *)(v0 + 400);
        v81 = *(_QWORD *)(v0 + 368);
        v82 = *(_QWORD *)(v0 + 376);
        v226 = *(_QWORD *)(v0 + 352);
        v83 = *(_QWORD *)(v0 + 336);
        v231 = *(_QWORD *)(v0 + 344);
        v234 = *(_QWORD *)(v0 + 360);
        v85 = *(_QWORD *)(v0 + 320);
        v84 = *(_QWORD *)(v0 + 328);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v84 + 32))(v83, *(_QWORD *)(v0 + 312), v85);
        sub_244B169E4();
        sub_244B169F0();
        sub_244B16B88();
        (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
        (*(void (**)(uint64_t, uint64_t))(v226 + 8))(v234, v231);
        (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v79, v81);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 32))(v79, v80, v81);
      }
    }
    v216 = *(_QWORD *)(v0 + 704);
    v222 = *(_QWORD *)(v0 + 720);
    v235 = *(_QWORD *)(v0 + 816);
    v86 = *(_QWORD *)(v0 + 272);
    v87 = *(_QWORD *)(v0 + 248);
    v198 = *(_QWORD *)(v0 + 264);
    v201 = *(_QWORD *)(v0 + 256);
    v206 = *(_QWORD *)(v0 + 240);
    v212 = *(_QWORD *)(v0 + 232);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 376) + 16))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 400), *(_QWORD *)(v0 + 368));
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3C8);
    sub_244B16BE8();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_244B17A80;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3D0);
    sub_244B16BD0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_244B17A80;
    sub_244B16BA0();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v198 + 104))(v86, *MEMORY[0x24BEB8230], v201);
    sub_244B16BC4();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v206 + 104))(v87, *MEMORY[0x24BEB8110], v212);
    sub_244B16BDC();
    sub_244B16D68();
    sub_244AF8E5C(v222, v216, &qword_2573DB3B8);
    sub_244B16BAC();
    sub_244B16CCC();
    sub_244AF7684(&qword_2573DB3D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8468], MEMORY[0x24BEB8470]);
    v89 = sub_244B16B70();
    v90 = *(_QWORD *)(v0 + 400);
    v91 = *(_QWORD *)(v0 + 368);
    v92 = *(_QWORD *)(v0 + 376);
    v93 = *(_QWORD *)(v0 + 296);
    v94 = *(_QWORD *)(v0 + 304);
    v95 = *(_QWORD *)(v0 + 288);
    if (!v235)
    {
      v227 = v88;
      v103 = *(uint64_t **)(v0 + 168);
      v223 = v89;
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v94, v95);
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v90, v91);
      *v103 = v223;
      v103[1] = v227;
      v104 = sub_244B170BC();
      sub_244B170E0();
      v105 = sub_244B17320();
      if ((sub_244B17344() & 1) != 0)
      {
        v106 = *(_DWORD *)(v0 + 872);
        v107 = *(_QWORD *)(v0 + 552);
        v108 = *(_QWORD *)(v0 + 520);
        v109 = *(_QWORD *)(v0 + 512);
        swift_retain();
        sub_244B17104();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v108 + 88))(v107, v109) == v106)
        {
          v110 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 520) + 8))(*(_QWORD *)(v0 + 552), *(_QWORD *)(v0 + 512));
          v110 = "";
        }
        v155 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
        v112 = (uint64_t *)(v0 + 688);
        v156 = *(_QWORD *)(v0 + 656);
        v157 = *(_QWORD *)(v0 + 616);
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 776))(*(_QWORD *)(v0 + 688), v156, v157);
        v158 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v158 = 0;
        v159 = sub_244B1708C();
        _os_signpost_emit_with_name_impl(&dword_244AF5000, v104, v105, v159, "requestOneShot", v110, v158, 2u);
        MEMORY[0x24951F40C](v158, -1, -1);

        v155(v156, v157);
      }
      else
      {
        v112 = (uint64_t *)(v0 + 656);

      }
      v160 = *v112;
      v161 = *(_QWORD *)(v0 + 744);
      v162 = *(_QWORD *)(v0 + 720);
      (*(void (**)(uint64_t, _QWORD))(v0 + 800))(v160, *(_QWORD *)(v0 + 616));
      sub_244B16A8C();
      sub_244AF8EA0(v162, &qword_2573DB3B8);
      sub_244AF8EA0(v161, &qword_2573DAF50);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v122 = *(uint64_t (**)(void))(v0 + 8);
      return v122();
    }
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v94, v95);
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v90, v91);
    v96 = sub_244B170BC();
    sub_244B170E0();
    v97 = sub_244B17320();
    if ((sub_244B17344() & 1) == 0)
    {
      v111 = (_QWORD *)(v0 + 632);

LABEL_38:
      v120 = *(_QWORD *)(v0 + 744);
      v121 = *(_QWORD *)(v0 + 720);
      (*(void (**)(_QWORD, _QWORD))(v0 + 800))(*v111, *(_QWORD *)(v0 + 616));
      sub_244B16A8C();
      sub_244AF8EA0(v121, &qword_2573DB3B8);
      sub_244AF8EA0(v120, &qword_2573DAF50);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v122 = *(uint64_t (**)(void))(v0 + 8);
      return v122();
    }
    v98 = *(_DWORD *)(v0 + 872);
    v99 = *(_QWORD *)(v0 + 528);
    v100 = *(_QWORD *)(v0 + 520);
    v101 = *(_QWORD *)(v0 + 512);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v100 + 88))(v99, v101) == v98)
    {
      v102 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 520) + 8))(*(_QWORD *)(v0 + 528), *(_QWORD *)(v0 + 512));
      v102 = "";
    }
    v113 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
    v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 776);
    v111 = (_QWORD *)(v0 + 688);
    v115 = *(_QWORD *)(v0 + 688);
    v116 = *(_QWORD *)(v0 + 632);
LABEL_37:
    v117 = *(_QWORD *)(v0 + 616);
    v114(v115, v116, v117);
    v118 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v118 = 0;
    v119 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v96, v97, v119, "requestOneShot", v102, v118, 2u);
    MEMORY[0x24951F40C](v118, -1, -1);

    v113(v116, v117);
    goto LABEL_38;
  }
  v12 = *(_DWORD *)(v0 + 864);
  v13 = *(_QWORD *)(v0 + 608);
  v14 = *(_QWORD *)(v0 + 600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v13, v3, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v14, v13, v2);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 88))(v14, v2);
  if (v15 == v12)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 592) + 96))(*(_QWORD *)(v0 + 600), *(_QWORD *)(v0 + 584));
    sub_244B16AA4();
    swift_bridgeObjectRetain_n();
    v16 = sub_244B170BC();
    sub_244B170E0();
    v17 = sub_244B17320();
    if ((sub_244B17344() & 1) != 0)
    {
      v219 = v17;
      v18 = *(_DWORD *)(v0 + 872);
      v19 = *(_QWORD *)(v0 + 568);
      v20 = *(_QWORD *)(v0 + 520);
      v21 = *(_QWORD *)(v0 + 512);
      swift_retain();
      sub_244B17104();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 88))(v19, v21) == v18)
      {
        v22 = 0;
        v23 = 0;
        v210 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 520) + 8))(*(_QWORD *)(v0 + 568), *(_QWORD *)(v0 + 512));
        v210 = "token received requestIdentifier=%{public, signpost.description=attribute,public}s";
        v23 = 2;
        v22 = 1;
      }
      v217 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
      v59 = (_QWORD *)(v0 + 688);
      v202 = *(_QWORD *)(v0 + 616);
      v207 = *(_QWORD *)(v0 + 680);
      v130 = *(_QWORD *)(v0 + 208);
      v129 = *(_QWORD *)(v0 + 216);
      (*(void (**)(_QWORD))(v0 + 776))(*(_QWORD *)(v0 + 688));
      v131 = swift_slowAlloc();
      v132 = swift_slowAlloc();
      v238[0] = v132;
      *(_BYTE *)v131 = v23;
      *(_BYTE *)(v131 + 1) = v22;
      *(_WORD *)(v131 + 2) = 2082;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v131 + 4) = sub_244B139EC(v130, v129, v238);
      swift_bridgeObjectRelease_n();
      v133 = sub_244B1708C();
      _os_signpost_emit_with_name_impl(&dword_244AF5000, v16, v219, v133, "requestOneShot", v210, (uint8_t *)v131, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v132, -1, -1);
      MEMORY[0x24951F40C](v131, -1, -1);

      v217(v207, v202);
    }
    else
    {
      v59 = (_QWORD *)(v0 + 680);
      swift_bridgeObjectRelease_n();

    }
    (*(void (**)(_QWORD, _QWORD))(v0 + 800))(*v59, *(_QWORD *)(v0 + 616));
    sub_244B170BC();
    sub_244B17080();
    v134 = sub_244B170BC();
    v135 = sub_244B1732C();
    if ((sub_244B17344() & 1) != 0)
    {
      v136 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
      v137 = *(_QWORD *)(v0 + 688);
      v138 = *(_QWORD *)(v0 + 616);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 776))(v137, *(_QWORD *)(v0 + 672), v138);
      v139 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v139 = 0;
      v140 = sub_244B1708C();
      _os_signpost_emit_with_name_impl(&dword_244AF5000, v134, v135, v140, "requestOneShot", "extend token", v139, 2u);
      MEMORY[0x24951F40C](v139, -1, -1);

      v136(v137, v138);
    }
    else
    {

    }
    v141 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
    v142 = *(_QWORD *)(v0 + 672);
    v143 = *(_QWORD *)(v0 + 616);
    v144 = *(_QWORD *)(v0 + 608);
    v145 = *(_QWORD *)(v0 + 592);
    v146 = *(_QWORD *)(v0 + 584);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 776))(*(_QWORD *)(v0 + 688), v142, v143);
    swift_allocObject();
    v147 = sub_244B170EC();
    swift_release();
    v141(v142, v143);
    sub_244B17218();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v145 + 8))(v144, v146);
    goto LABEL_73;
  }
  if (v15 != *(_DWORD *)(v0 + 868))
  {
    v60 = *(_QWORD *)(v0 + 608);
    v61 = *(_QWORD *)(v0 + 600);
    v62 = *(_QWORD *)(v0 + 592);
    v63 = *(_QWORD *)(v0 + 584);
    swift_bridgeObjectRelease();
    v64 = sub_244B16F48();
    sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
    v65 = swift_allocError();
    v67 = v66;
    v238[0] = 0;
    v238[1] = 0xE000000000000000;
    sub_244B17374();
    *(_QWORD *)(v0 + 112) = 0;
    *(_QWORD *)(v0 + 120) = 0xE000000000000000;
    sub_244B17218();
    sub_244B173C8();
    v68 = *(_QWORD *)(v0 + 120);
    *v67 = *(_QWORD *)(v0 + 112);
    v67[1] = v68;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v64 - 8) + 104))(v67, *MEMORY[0x24BE68930], v64);
    swift_willThrow();
    v69 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
    v69(v60, v63);
    v69(v61, v63);
    goto LABEL_21;
  }
  v233 = (uint64_t *)(v0 + 152);
  v25 = *(_QWORD *)(v0 + 744);
  v26 = *(_QWORD *)(v0 + 736);
  v27 = *(_QWORD *)(v0 + 600);
  v28 = *(_QWORD *)(v0 + 592);
  v29 = *(_QWORD *)(v0 + 584);
  v30 = *(_QWORD *)(v0 + 496);
  v31 = *(_QWORD *)(v0 + 504);
  v32 = *(_QWORD *)(v0 + 480);
  v33 = *(_QWORD *)(v0 + 488);
  v220 = *(_QWORD *)(v0 + 472);
  v225 = *(_QWORD *)(v0 + 456);
  v230 = *(_QWORD *)(v0 + 448);
  sub_244AF8EA0(v25, &qword_2573DAF50);
  (*(void (**)(uint64_t, uint64_t))(v28 + 96))(v27, v29);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF60);
  v35 = v27 + *(int *)(v34 + 48);
  v36 = v27 + *(int *)(v34 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 32))(v31, v27, v33);
  sub_244B1520C(v35, v26, &qword_2573DAF50);
  sub_244B1520C(v36, v32, &qword_2573DAF68);
  sub_244AF8E5C(v26, v25, &qword_2573DAF50);
  sub_244AF8E5C(v32, v220, &qword_2573DAF68);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v225 + 48))(v220, 1, v230) != 1)
  {
    v148 = *(_QWORD *)(v0 + 416);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 456) + 32))(*(_QWORD *)(v0 + 464), *(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 448));
    sub_244B16A2C();
    v149 = sub_244B16A20();
    v150 = *(_QWORD *)(v149 - 8);
    v151 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v150 + 48))(v148, 1, v149);
    v152 = *(_QWORD *)(v0 + 416);
    if (v151 == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 416), &qword_2573DB3B0);
      v153 = 0xE700000000000000;
      v154 = 0x6E776F6E6B6E75;
    }
    else
    {
      v154 = sub_244B16A14();
      v153 = v164;
      (*(void (**)(uint64_t, uint64_t))(v150 + 8))(v152, v149);
    }
    v165 = *(_QWORD *)(v0 + 408);
    MEMORY[0x24951EAF4](v154, v153, 6369134, 0xE300000000000000);
    sub_244B16A38();
    sub_244B16A08();
    sub_244B16834();
    v166 = sub_244B16828();
    v167 = *(_QWORD *)(v166 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v167 + 48))(v165, 1, v166) == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 408), &qword_2573DB360);
LABEL_66:
      v179 = sub_244B16A44();
      v180 = *(_QWORD *)(v179 + 16);
      if (v180)
      {
        *v233 = MEMORY[0x24BEE4AF8];
        sub_244B144EC(0, v180, 0);
        v181 = 0;
        v182 = *v233;
        v183 = *(_QWORD *)(*v233 + 16);
        do
        {
          v184 = *(int *)(v179 + 4 * v181 + 32);
          *v233 = v182;
          v185 = *(_QWORD *)(v182 + 24);
          if (v183 >= v185 >> 1)
          {
            sub_244B144EC(v185 > 1, v183 + 1, 1);
            v182 = *v233;
          }
          ++v181;
          *(_QWORD *)(v182 + 16) = v183 + 1;
          *(_QWORD *)(v182 + 8 * v183++ + 32) = v184;
        }
        while (v180 != v181);
      }
      swift_bridgeObjectRelease();
      v237 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 760);
      v197 = *(_QWORD *)(v0 + 736);
      v186 = *(_QWORD *)(v0 + 720);
      v187 = *(_QWORD *)(v0 + 712);
      v209 = *(_QWORD *)(v0 + 608);
      v214 = *(_QWORD *)(v0 + 752);
      v200 = *(_QWORD *)(v0 + 592);
      v204 = *(_QWORD *)(v0 + 584);
      v193 = *(_QWORD *)(v0 + 496);
      v188 = *(_QWORD *)(v0 + 480);
      v194 = *(_QWORD *)(v0 + 488);
      v195 = *(_QWORD *)(v0 + 504);
      v190 = *(_QWORD *)(v0 + 456);
      v189 = *(_QWORD *)(v0 + 464);
      v191 = *(_QWORD *)(v0 + 448);
      sub_244AFFC88(MEMORY[0x24BEE4AF8]);
      sub_244B16E1C();
      (*(void (**)(uint64_t, uint64_t))(v190 + 8))(v189, v191);
      sub_244AF8EA0(v188, &qword_2573DAF68);
      sub_244AF8EA0(v197, &qword_2573DAF50);
      (*(void (**)(uint64_t, uint64_t))(v193 + 8))(v195, v194);
      (*(void (**)(uint64_t, uint64_t))(v200 + 8))(v209, v204);
      sub_244AF8EA0(v186, &qword_2573DB3B8);
      v237(v187, 0, 1, v214);
      sub_244B1520C(v187, v186, &qword_2573DB3B8);
      goto LABEL_72;
    }
    v168 = *(_QWORD *)(v0 + 816);
    sub_244B1681C();
    if (!v168)
    {
      (*(void (**)(_QWORD, uint64_t))(v167 + 8))(*(_QWORD *)(v0 + 408), v166);
      goto LABEL_66;
    }
    v65 = v168;
    v232 = *(_QWORD *)(v0 + 584);
    v236 = *(_QWORD *)(v0 + 608);
    v218 = *(_QWORD *)(v0 + 504);
    v224 = *(_QWORD *)(v0 + 592);
    v203 = *(_QWORD *)(v0 + 496);
    v208 = *(_QWORD *)(v0 + 736);
    v213 = *(_QWORD *)(v0 + 488);
    v199 = *(_QWORD *)(v0 + 480);
    v169 = *(_QWORD *)(v0 + 456);
    v196 = *(_QWORD *)(v0 + 464);
    v171 = *(_QWORD *)(v0 + 440);
    v170 = *(_QWORD *)(v0 + 448);
    v173 = *(_QWORD *)(v0 + 424);
    v172 = *(_QWORD *)(v0 + 432);
    v228 = *(_QWORD *)(v0 + 408);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v172 + 8))(v171, v173);
    (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v196, v170);
    sub_244AF8EA0(v199, &qword_2573DAF68);
    sub_244AF8EA0(v208, &qword_2573DAF50);
    (*(void (**)(uint64_t, uint64_t))(v203 + 8))(v218, v213);
    (*(void (**)(uint64_t, uint64_t))(v224 + 8))(v236, v232);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v167 + 8))(v228, v166);
LABEL_21:
    *(_QWORD *)(v0 + 136) = v65;
    MEMORY[0x24951F340](v65);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3C0);
    if (swift_dynamicCast())
    {
      MEMORY[0x24951F334](v65);
      sub_244B13AE0((__int128 *)(v0 + 56), v0 + 16);
      v70 = sub_244B16F48();
      sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
      swift_allocError();
      v72 = v71;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
      sub_244B169C0();
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
      sub_244B169B4();
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
      sub_244B169A8();
      sub_244AFFC88(MEMORY[0x24BEE4AF8]);
      sub_244B16F3C();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v70 - 8) + 104))(v72, *MEMORY[0x24BE68978], v70);
      swift_willThrow();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      MEMORY[0x24951F334](*(_QWORD *)(v0 + 136));
      v73 = sub_244B170BC();
      sub_244B170E0();
      v74 = sub_244B17320();
      if ((sub_244B17344() & 1) != 0)
      {
        v75 = *(_QWORD *)(v0 + 544);
        v76 = *(_QWORD *)(v0 + 520);
        v77 = *(_QWORD *)(v0 + 512);
        swift_retain();
        sub_244B17104();
        swift_release();
        if ((*(unsigned int (**)(uint64_t, uint64_t))(v76 + 88))(v75, v77) == *MEMORY[0x24BEE7810])
        {
          v78 = "[Error] Interval already ended";
        }
        else
        {
          (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 520) + 8))(*(_QWORD *)(v0 + 544), *(_QWORD *)(v0 + 512));
          v78 = "";
        }
        v174 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
        v111 = (_QWORD *)(v0 + 688);
        v175 = *(_QWORD *)(v0 + 648);
        v176 = *(_QWORD *)(v0 + 616);
        (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 776))(*(_QWORD *)(v0 + 688), v175, v176);
        v177 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v177 = 0;
        v178 = sub_244B1708C();
        _os_signpost_emit_with_name_impl(&dword_244AF5000, v73, v74, v178, "requestOneShot", v78, v177, 2u);
        MEMORY[0x24951F40C](v177, -1, -1);

        v174(v175, v176);
      }
      else
      {
        v111 = (_QWORD *)(v0 + 648);

      }
      goto LABEL_38;
    }
    MEMORY[0x24951F334](*(_QWORD *)(v0 + 136));
    v123 = sub_244B16F48();
    sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
    swift_allocError();
    v125 = v124;
    *(_QWORD *)(v0 + 128) = v65;
    MEMORY[0x24951F340](v65);
    sub_244B17200();
    swift_bridgeObjectRetain();
    sub_244AFFC88(MEMORY[0x24BEE4AF8]);
    sub_244B16F3C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v123 - 8) + 104))(v125, *MEMORY[0x24BE68978], v123);
    swift_willThrow();
    swift_release();
    MEMORY[0x24951F334](v65);
    v96 = sub_244B170BC();
    sub_244B170E0();
    v97 = sub_244B17320();
    if ((sub_244B17344() & 1) == 0)
    {
      v111 = (_QWORD *)(v0 + 640);

      goto LABEL_38;
    }
    v126 = *(_QWORD *)(v0 + 536);
    v127 = *(_QWORD *)(v0 + 520);
    v128 = *(_QWORD *)(v0 + 512);
    swift_retain();
    sub_244B17104();
    swift_release();
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v127 + 88))(v126, v128) == *MEMORY[0x24BEE7810])
    {
      v102 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 520) + 8))(*(_QWORD *)(v0 + 536), *(_QWORD *)(v0 + 512));
      v102 = "";
    }
    v113 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
    v114 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 776);
    v111 = (_QWORD *)(v0 + 688);
    v115 = *(_QWORD *)(v0 + 688);
    v116 = *(_QWORD *)(v0 + 640);
    goto LABEL_37;
  }
  v37 = *(_QWORD *)(v0 + 736);
  v38 = *(_QWORD *)(v0 + 608);
  v39 = *(_QWORD *)(v0 + 592);
  v40 = *(_QWORD *)(v0 + 584);
  v42 = *(_QWORD *)(v0 + 496);
  v41 = *(_QWORD *)(v0 + 504);
  v43 = *(_QWORD *)(v0 + 488);
  v44 = *(_QWORD *)(v0 + 472);
  sub_244AF8EA0(*(_QWORD *)(v0 + 480), &qword_2573DAF68);
  sub_244AF8EA0(v37, &qword_2573DAF50);
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
  sub_244AF8EA0(v44, &qword_2573DAF68);
LABEL_72:
  v147 = *(_QWORD *)(v0 + 824);
LABEL_73:
  *(_QWORD *)(v0 + 832) = v147;
  v192 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 840) = v192;
  *v192 = v0;
  v192[1] = sub_244B08EE8;
  return sub_244AF7F18(*(_QWORD *)(v0 + 576));
}

uint64_t sub_244B08EE8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  v3 = v2[104];
  if (v0)
  {
    v2[107] = v0;
    v2[106] = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2[103] = v3;
    v2[102] = 0;
  }
  return swift_task_switch();
}

uint64_t sub_244B08F64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_signpost_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  _QWORD *v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  os_signpost_id_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(v0 + 856);
  *(_QWORD *)(v0 + 136) = v1;
  MEMORY[0x24951F340](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3C0);
  if (swift_dynamicCast())
  {
    MEMORY[0x24951F334](v1);
    sub_244B13AE0((__int128 *)(v0 + 56), v0 + 16);
    v2 = sub_244B16F48();
    sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
    swift_allocError();
    v4 = v3;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    sub_244B169C0();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    sub_244B169B4();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
    sub_244B169A8();
    sub_244AFFC88(MEMORY[0x24BEE4AF8]);
    sub_244B16F3C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v2 - 8) + 104))(v4, *MEMORY[0x24BE68978], v2);
    swift_willThrow();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    MEMORY[0x24951F334](*(_QWORD *)(v0 + 136));
    v5 = sub_244B170BC();
    sub_244B170E0();
    v6 = sub_244B17320();
    if ((sub_244B17344() & 1) != 0)
    {
      v7 = *(_QWORD *)(v0 + 544);
      v8 = *(_QWORD *)(v0 + 520);
      v9 = *(_QWORD *)(v0 + 512);
      swift_retain();
      sub_244B17104();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v8 + 88))(v7, v9) == *MEMORY[0x24BEE7810])
      {
        v10 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 520) + 8))(*(_QWORD *)(v0 + 544), *(_QWORD *)(v0 + 512));
        v10 = "";
      }
      v21 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
      v20 = (_QWORD *)(v0 + 688);
      v22 = *(_QWORD *)(v0 + 648);
      v23 = *(_QWORD *)(v0 + 616);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 776))(*(_QWORD *)(v0 + 688), v22, v23);
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      v25 = sub_244B1708C();
      _os_signpost_emit_with_name_impl(&dword_244AF5000, v5, v6, v25, "requestOneShot", v10, v24, 2u);
      MEMORY[0x24951F40C](v24, -1, -1);

      v21(v22, v23);
    }
    else
    {
      v20 = (_QWORD *)(v0 + 648);

    }
  }
  else
  {
    MEMORY[0x24951F334](*(_QWORD *)(v0 + 136));
    v11 = sub_244B16F48();
    sub_244AF7684(&qword_2573DB2E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE689F0], MEMORY[0x24BE68A00]);
    swift_allocError();
    v13 = v12;
    *(_QWORD *)(v0 + 128) = v1;
    MEMORY[0x24951F340](v1);
    sub_244B17200();
    swift_bridgeObjectRetain();
    sub_244AFFC88(MEMORY[0x24BEE4AF8]);
    sub_244B16F3C();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BE68978], v11);
    swift_willThrow();
    swift_release();
    MEMORY[0x24951F334](v1);
    v14 = sub_244B170BC();
    sub_244B170E0();
    v15 = sub_244B17320();
    if ((sub_244B17344() & 1) != 0)
    {
      v16 = *(_QWORD *)(v0 + 536);
      v17 = *(_QWORD *)(v0 + 520);
      v18 = *(_QWORD *)(v0 + 512);
      swift_retain();
      sub_244B17104();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v17 + 88))(v16, v18) == *MEMORY[0x24BEE7810])
      {
        v19 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 520) + 8))(*(_QWORD *)(v0 + 536), *(_QWORD *)(v0 + 512));
        v19 = "";
      }
      v26 = *(void (**)(uint64_t, uint64_t))(v0 + 800);
      v20 = (_QWORD *)(v0 + 688);
      v27 = *(_QWORD *)(v0 + 640);
      v28 = *(_QWORD *)(v0 + 616);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(v0 + 776))(*(_QWORD *)(v0 + 688), v27, v28);
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      v30 = sub_244B1708C();
      _os_signpost_emit_with_name_impl(&dword_244AF5000, v14, v15, v30, "requestOneShot", v19, v29, 2u);
      MEMORY[0x24951F40C](v29, -1, -1);

      v26(v27, v28);
    }
    else
    {
      v20 = (_QWORD *)(v0 + 640);

    }
  }
  v31 = *(_QWORD *)(v0 + 744);
  v32 = *(_QWORD *)(v0 + 720);
  (*(void (**)(_QWORD, _QWORD))(v0 + 800))(*v20, *(_QWORD *)(v0 + 616));
  sub_244B16A8C();
  sub_244AF8EA0(v32, &qword_2573DB3B8);
  sub_244AF8EA0(v31, &qword_2573DAF50);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B09734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)(v8 + 160) = v24;
  *(_QWORD *)(v8 + 168) = v25;
  *(_OWORD *)(v8 + 144) = v23;
  *(_QWORD *)(v8 + 128) = a7;
  *(_QWORD *)(v8 + 136) = a8;
  *(_QWORD *)(v8 + 112) = a5;
  *(_QWORD *)(v8 + 120) = a6;
  *(_QWORD *)(v8 + 96) = a3;
  *(_QWORD *)(v8 + 104) = a4;
  *(_QWORD *)(v8 + 80) = a1;
  *(_QWORD *)(v8 + 88) = a2;
  v9 = sub_244B16EF4();
  *(_QWORD *)(v8 + 176) = v9;
  *(_QWORD *)(v8 + 184) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 192) = swift_task_alloc();
  *(_QWORD *)(v8 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB310);
  *(_QWORD *)(v8 + 208) = swift_task_alloc();
  *(_QWORD *)(v8 + 216) = swift_task_alloc();
  v10 = sub_244B16DA4();
  *(_QWORD *)(v8 + 224) = v10;
  *(_QWORD *)(v8 + 232) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 240) = swift_task_alloc();
  v11 = sub_244B16DF8();
  *(_QWORD *)(v8 + 248) = v11;
  *(_QWORD *)(v8 + 256) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 264) = swift_task_alloc();
  v12 = sub_244B170A4();
  *(_QWORD *)(v8 + 272) = v12;
  *(_QWORD *)(v8 + 280) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v8 + 288) = swift_task_alloc();
  *(_QWORD *)(v8 + 296) = swift_task_alloc();
  v13 = sub_244B16720();
  *(_QWORD *)(v8 + 304) = v13;
  *(_QWORD *)(v8 + 312) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v8 + 320) = swift_task_alloc();
  v14 = sub_244B17128();
  *(_QWORD *)(v8 + 328) = v14;
  *(_QWORD *)(v8 + 336) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v8 + 344) = swift_task_alloc();
  v15 = sub_244B17050();
  *(_QWORD *)(v8 + 352) = v15;
  *(_QWORD *)(v8 + 360) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 368) = swift_task_alloc();
  *(_QWORD *)(v8 + 376) = swift_task_alloc();
  v16 = sub_244B1696C();
  *(_QWORD *)(v8 + 384) = v16;
  *(_QWORD *)(v8 + 392) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v8 + 400) = swift_task_alloc();
  v17 = sub_244B16D2C();
  *(_QWORD *)(v8 + 408) = v17;
  *(_QWORD *)(v8 + 416) = *(_QWORD *)(v17 - 8);
  *(_QWORD *)(v8 + 424) = swift_task_alloc();
  v18 = sub_244B16CC0();
  *(_QWORD *)(v8 + 432) = v18;
  *(_QWORD *)(v8 + 440) = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v8 + 448) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB318);
  *(_QWORD *)(v8 + 456) = swift_task_alloc();
  *(_QWORD *)(v8 + 464) = swift_task_alloc();
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  *(_QWORD *)(v8 + 480) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB320);
  *(_QWORD *)(v8 + 488) = swift_task_alloc();
  *(_QWORD *)(v8 + 496) = swift_task_alloc();
  v19 = sub_244B16E34();
  *(_QWORD *)(v8 + 504) = v19;
  *(_QWORD *)(v8 + 512) = *(_QWORD *)(v19 - 8);
  *(_QWORD *)(v8 + 520) = swift_task_alloc();
  *(_QWORD *)(v8 + 528) = swift_task_alloc();
  *(_QWORD *)(v8 + 536) = swift_task_alloc();
  *(_QWORD *)(v8 + 544) = swift_task_alloc();
  v20 = sub_244B16C90();
  *(_QWORD *)(v8 + 552) = v20;
  *(_QWORD *)(v8 + 560) = *(_QWORD *)(v20 - 8);
  *(_QWORD *)(v8 + 568) = swift_task_alloc();
  *(_QWORD *)(v8 + 576) = swift_task_alloc();
  v21 = sub_244B16B7C();
  *(_QWORD *)(v8 + 584) = v21;
  *(_QWORD *)(v8 + 592) = *(_QWORD *)(v21 - 8);
  *(_QWORD *)(v8 + 600) = swift_task_alloc();
  *(_QWORD *)(v8 + 608) = swift_task_alloc();
  *(_QWORD *)(v8 + 616) = swift_task_alloc();
  *(_QWORD *)(v8 + 624) = swift_task_alloc();
  *(_QWORD *)(v8 + 632) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B09AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v6)(uint64_t, uint64_t, uint64_t);
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  BOOL v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
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
  NSObject *v43;
  os_log_type_t v44;
  BOOL v45;
  unint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  NSObject *v54;
  os_log_type_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
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
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  BOOL v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint8_t *v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  NSObject *v129;
  os_signpost_type_t v130;
  char v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  uint8_t *v135;
  uint64_t v136;
  os_signpost_id_t v137;
  void (*v138)(uint64_t, uint64_t);
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  int v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  _QWORD *v165;
  void (*v166)(uint64_t, uint64_t, uint64_t);
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, uint64_t, uint64_t);
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void (*v194)(_QWORD, unint64_t, _QWORD);
  uint64_t v195;
  void (*v196)(_QWORD, _QWORD, uint64_t);
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200[3];

  sub_244AF7684(&qword_2573DB328, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8168], MEMORY[0x24BEB8178]);
  sub_244B16B64();
  v1 = *(_QWORD *)(v0 + 632);
  v2 = *(_QWORD *)(v0 + 624);
  v3 = *(_QWORD *)(v0 + 592);
  v4 = *(_QWORD *)(v0 + 584);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 184) + 56);
  v5(*(_QWORD *)(v0 + 480), 1, 1, *(_QWORD *)(v0 + 176));
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v1, v4);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v7 == *MEMORY[0x24BEB8150])
  {
    v6(*(_QWORD *)(v0 + 616), *(_QWORD *)(v0 + 632), *(_QWORD *)(v0 + 584));
    swift_bridgeObjectRetain_n();
    v8 = sub_244B17110();
    v9 = sub_244B172CC();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(_QWORD *)(v0 + 616);
    if (v10)
    {
      v177 = *(_QWORD *)(v0 + 592);
      v172 = *(_QWORD *)(v0 + 600);
      v175 = *(_QWORD *)(v0 + 584);
      v13 = *(_QWORD *)(v0 + 128);
      v12 = *(_QWORD *)(v0 + 136);
      v14 = swift_slowAlloc();
      v183 = swift_slowAlloc();
      v200[0] = v183;
      *(_DWORD *)v14 = 136315394;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 56) = sub_244B139EC(v13, v12, v200);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v14 + 12) = 2080;
      v6(v172, v11, v175);
      v15 = sub_244B17200();
      *(_QWORD *)(v0 + 64) = sub_244B139EC(v15, v16, v200);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v17 = *(void (**)(uint64_t, uint64_t))(v177 + 8);
      v17(v11, v175);
      _os_log_impl(&dword_244AF5000, v8, v9, "%s received unkown request payload %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v183, -1, -1);
      MEMORY[0x24951F40C](v14, -1, -1);

    }
    else
    {
      v30 = *(_QWORD *)(v0 + 592);
      v31 = *(_QWORD *)(v0 + 584);

      swift_bridgeObjectRelease_n();
      v17 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v17(v11, v31);
    }
    v32 = *(_QWORD *)(v0 + 632);
    v33 = *(_QWORD *)(v0 + 624);
    v34 = *(_QWORD *)(v0 + 584);
    v35 = *(_QWORD *)(v0 + 480);
    type metadata accessor for PrivateMLClientInferenceProviderError(0);
    sub_244AF7684(&qword_2573DB330, type metadata accessor for PrivateMLClientInferenceProviderError, (uint64_t)&unk_244B17BE8);
    swift_allocError();
    v37 = v36;
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 2, 4, v38);
    swift_willThrow();
    sub_244AF8EA0(v35, &qword_2573DB318);
    v17(v32, v34);
    v17(v33, v34);
LABEL_33:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (v7 == *MEMORY[0x24BEB8158])
  {
    v18 = *(_QWORD *)(v0 + 624);
    v20 = *(_QWORD *)(v0 + 440);
    v19 = *(_QWORD *)(v0 + 448);
    v21 = *(_QWORD *)(v0 + 432);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 592) + 96))(v18, *(_QWORD *)(v0 + 584));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v19, v18, v21);
    swift_bridgeObjectRetain_n();
    v22 = sub_244B17110();
    v23 = sub_244B172D8();
    v24 = os_log_type_enabled(v22, v23);
    v25 = *(_QWORD *)(v0 + 136);
    if (v24)
    {
      v26 = *(_QWORD *)(v0 + 128);
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v200[0] = v28;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 72) = sub_244B139EC(v26, v25, v200);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, v22, v23, "%s received complete prompt request", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v28, -1, -1);
      MEMORY[0x24951F40C](v27, -1, -1);

    }
    else
    {

      v29 = swift_bridgeObjectRelease_n();
    }
    v50 = *(_QWORD *)(v0 + 440);
    v51 = *(_QWORD *)(v0 + 448);
    v52 = *(_QWORD *)(v0 + 432);
    v53 = *(_QWORD **)(v0 + 144);
    MEMORY[0x24951E9A4](v29);
    sub_244B16C9C();
    sub_244B16CA8();
    __swift_project_boxed_opaque_existential_1(v53, v53[3]);
    sub_244B16DBC();
    sub_244B16A5C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
  }
  else
  {
    if (v7 != *MEMORY[0x24BEB8160])
    {
      v6(*(_QWORD *)(v0 + 608), *(_QWORD *)(v0 + 632), *(_QWORD *)(v0 + 584));
      swift_bridgeObjectRetain_n();
      v54 = sub_244B17110();
      v55 = sub_244B172CC();
      v56 = os_log_type_enabled(v54, v55);
      v57 = *(_QWORD *)(v0 + 608);
      if (v56)
      {
        v178 = *(_QWORD *)(v0 + 600);
        v184 = *(_QWORD *)(v0 + 584);
        v189 = *(_QWORD *)(v0 + 592);
        v58 = *(_QWORD *)(v0 + 128);
        v59 = *(_QWORD *)(v0 + 136);
        v60 = swift_slowAlloc();
        v195 = swift_slowAlloc();
        v200[0] = v195;
        *(_DWORD *)v60 = 136315394;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 16) = sub_244B139EC(v58, v59, v200);
        sub_244B1735C();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v60 + 12) = 2080;
        v6(v178, v57, v184);
        v61 = sub_244B17200();
        *(_QWORD *)(v0 + 24) = sub_244B139EC(v61, v62, v200);
        sub_244B1735C();
        swift_bridgeObjectRelease();
        v63 = *(void (**)(uint64_t, uint64_t))(v189 + 8);
        v63(v57, v184);
        _os_log_impl(&dword_244AF5000, v54, v55, "%s received unkown request payload %s", (uint8_t *)v60, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24951F40C](v195, -1, -1);
        MEMORY[0x24951F40C](v60, -1, -1);

      }
      else
      {
        v70 = *(_QWORD *)(v0 + 592);
        v71 = *(_QWORD *)(v0 + 584);

        swift_bridgeObjectRelease_n();
        v63 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
        v63(v57, v71);
      }
      v72 = *(_QWORD *)(v0 + 632);
      v73 = *(_QWORD *)(v0 + 624);
      v74 = *(_QWORD *)(v0 + 584);
      v75 = *(_QWORD *)(v0 + 480);
      type metadata accessor for PrivateMLClientInferenceProviderError(0);
      sub_244AF7684(&qword_2573DB330, type metadata accessor for PrivateMLClientInferenceProviderError, (uint64_t)&unk_244B17BE8);
      swift_allocError();
      v77 = v76;
      v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v77, 2, 4, v78);
      swift_willThrow();
      sub_244AF8EA0(v75, &qword_2573DB318);
      v63(v72, v74);
      v63(v73, v74);
      goto LABEL_33;
    }
    v39 = *(_QWORD *)(v0 + 624);
    v41 = *(_QWORD *)(v0 + 416);
    v40 = *(_QWORD *)(v0 + 424);
    v42 = *(_QWORD *)(v0 + 408);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 592) + 96))(v39, *(_QWORD *)(v0 + 584));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v40, v39, v42);
    swift_bridgeObjectRetain_n();
    v43 = sub_244B17110();
    v44 = sub_244B172D8();
    v45 = os_log_type_enabled(v43, v44);
    v46 = *(_QWORD *)(v0 + 136);
    if (v45)
    {
      v47 = *(_QWORD *)(v0 + 128);
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v200[0] = v49;
      *(_DWORD *)v48 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 48) = sub_244B139EC(v47, v46, v200);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, v43, v44, "%s received completePromptTemplate request", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v49, -1, -1);
      MEMORY[0x24951F40C](v48, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v64 = *(_QWORD *)(v0 + 504);
    v65 = *(_QWORD *)(v0 + 512);
    v66 = *(_QWORD *)(v0 + 216);
    sub_244B16D20();
    v190 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
    v67 = v190(v66, 1, v64);
    v68 = *(_QWORD *)(v0 + 512);
    if (v67 == 1)
    {
      v69 = *(_QWORD *)(v0 + 216);
      sub_244B16DC8();
      sub_244AF8EA0(v69, &qword_2573DB310);
      v196 = *(void (**)(_QWORD, _QWORD, uint64_t))(v68 + 32);
    }
    else
    {
      v196 = *(void (**)(_QWORD, _QWORD, uint64_t))(v68 + 32);
      v196(*(_QWORD *)(v0 + 528), *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 504));
    }
    v79 = *(_QWORD *)(v0 + 504);
    v80 = *(_QWORD *)(v0 + 480);
    v81 = *(_QWORD *)(v0 + 464);
    v82 = *(_QWORD *)(v0 + 208);
    v83 = *(_QWORD *)(v0 + 176);
    v196(*(_QWORD *)(v0 + 544), *(_QWORD *)(v0 + 528), v79);
    sub_244B16D08();
    sub_244B16D14();
    sub_244B16CFC();
    sub_244AF8EA0(v80, &qword_2573DB318);
    v5(v81, 0, 1, v83);
    sub_244B1520C(v81, v80, &qword_2573DB318);
    sub_244B16D20();
    if (v190(v82, 1, v79) == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 208), &qword_2573DB310);
    }
    else
    {
      v196(*(_QWORD *)(v0 + 520), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 504));
      v84 = sub_244B16DBC();
      v86 = v85;
      swift_bridgeObjectRelease();
      v87 = HIBYTE(v86) & 0xF;
      if ((v86 & 0x2000000000000000) == 0)
        v87 = v84 & 0xFFFFFFFFFFFFLL;
      v88 = *(_QWORD *)(v0 + 520);
      v89 = *(_QWORD *)(v0 + 504);
      v90 = *(_QWORD *)(v0 + 512);
      if (v87)
      {
        __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 144), *(_QWORD *)(*(_QWORD *)(v0 + 144) + 24));
        sub_244B16DBC();
        sub_244B16A5C();
        swift_bridgeObjectRelease();
      }
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v88, v89);
    }
    v91 = *(_QWORD *)(v0 + 456);
    v92 = *(_QWORD *)(v0 + 176);
    v93 = *(_QWORD *)(v0 + 184);
    sub_244AF8E5C(*(_QWORD *)(v0 + 480), v91, &qword_2573DB318);
    v94 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v91, 1, v92);
    v95 = *(_QWORD *)(v0 + 456);
    v96 = *(_QWORD *)(v0 + 416);
    v97 = *(_QWORD *)(v0 + 408);
    if (v94 == 1)
    {
      (*(void (**)(_QWORD, _QWORD))(v96 + 8))(*(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 408));
      sub_244AF8EA0(v95, &qword_2573DB318);
    }
    else
    {
      v99 = *(_QWORD *)(v0 + 192);
      v98 = *(_QWORD *)(v0 + 200);
      v101 = *(_QWORD *)(v0 + 176);
      v100 = *(_QWORD *)(v0 + 184);
      v102 = *(_QWORD **)(v0 + 144);
      v197 = *(_QWORD *)(v0 + 424);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v100 + 32))(v98, *(_QWORD *)(v0 + 456), v101);
      __swift_project_boxed_opaque_existential_1(v102, v102[3]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v100 + 16))(v99, v98, v101);
      sub_244B17200();
      sub_244B16A68();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v98, v101);
      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v197, v97);
    }
  }
  v171 = *(_QWORD *)(v0 + 576);
  v103 = *(_QWORD *)(v0 + 568);
  v104 = *(_QWORD *)(v0 + 560);
  v105 = *(_QWORD *)(v0 + 544);
  v106 = *(_QWORD *)(v0 + 536);
  v108 = *(_QWORD *)(v0 + 504);
  v107 = *(_QWORD *)(v0 + 512);
  v168 = *(_QWORD *)(v0 + 496);
  v169 = *(_QWORD *)(v0 + 552);
  v167 = *(_QWORD *)(v0 + 488);
  v198 = *(_QWORD *)(v0 + 400);
  v109 = *(_QWORD *)(v0 + 376);
  v179 = *(_QWORD *)(v0 + 480);
  v185 = *(_QWORD *)(v0 + 344);
  v173 = *(_QWORD *)(v0 + 472);
  v176 = *(_QWORD *)(v0 + 336);
  v191 = *(_QWORD *)(v0 + 328);
  v110 = *(_QWORD *)(v0 + 112);
  v170 = *(_QWORD *)(v0 + 120);
  v111 = *(_QWORD *)(v0 + 104);
  v166 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 360) + 16);
  v166(v109, *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 352));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v107 + 16))(v106, v105, v108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 16))(v103, v171, v169);
  sub_244AF8E5C(v168, v167, &qword_2573DB320);
  sub_244AF8E5C(v179, v173, &qword_2573DB318);
  v112 = v170 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v176 + 16))(v185, v170 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, v191);
  sub_244B14D30(v111, v110);
  sub_244B0D138(v111, v110, v109, v106, v103, v167, v173, v185, v198);
  v114 = *(_QWORD *)(v0 + 368);
  v115 = *(_QWORD *)(v0 + 352);
  v116 = *(_QWORD *)(v0 + 152);
  logMetric(logger:name:startInstant:)(v112, 0xD000000000000012, 0x8000000244B17FC0);
  v166(v114, v116, v115);
  v117 = sub_244B17110();
  v118 = sub_244B172D8();
  v119 = os_log_type_enabled(v117, v118);
  v120 = *(_QWORD *)(v0 + 360);
  v121 = *(_QWORD *)(v0 + 368);
  v122 = *(_QWORD *)(v0 + 352);
  if (v119)
  {
    v123 = *(_QWORD *)(v0 + 320);
    v180 = *(_QWORD *)(v0 + 312);
    v186 = *(_QWORD *)(v0 + 352);
    v124 = *(_QWORD *)(v0 + 304);
    v125 = (uint8_t *)swift_slowAlloc();
    v192 = swift_slowAlloc();
    v200[0] = v192;
    *(_DWORD *)v125 = 136315138;
    sub_244B17008();
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v126 = sub_244B17410();
    v174 = v120;
    v128 = v127;
    (*(void (**)(uint64_t, uint64_t))(v180 + 8))(v123, v124);
    *(_QWORD *)(v0 + 40) = sub_244B139EC(v126, v128, v200);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v121, v186);
    _os_log_impl(&dword_244AF5000, v117, v118, "%s sending private ML request", v125, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v192, -1, -1);
    MEMORY[0x24951F40C](v125, -1, -1);

  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v121, v122);
  }
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v129 = sub_244B170BC();
  v130 = sub_244B17338();
  v131 = sub_244B17344();
  v132 = *(_QWORD *)(v0 + 296);
  if ((v131 & 1) != 0)
  {
    v193 = *(_QWORD *)(v0 + 280);
    v181 = *(_QWORD *)(v0 + 288);
    v187 = *(_QWORD *)(v0 + 272);
    v134 = *(_QWORD *)(v0 + 128);
    v133 = *(_QWORD *)(v0 + 136);
    (*(void (**)(void))(v193 + 16))();
    v135 = (uint8_t *)swift_slowAlloc();
    v136 = swift_slowAlloc();
    v200[0] = v136;
    *(_DWORD *)v135 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = sub_244B139EC(v134, v133, v200);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v137 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v129, v130, v137, "executePrivateMLRequest", "request parsed requestIdentifier=%{public, signpost.description=attribute,public}s)", v135, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v136, -1, -1);
    MEMORY[0x24951F40C](v135, -1, -1);

    v138 = *(void (**)(uint64_t, uint64_t))(v193 + 8);
    v138(v132, v187);
    v138(v181, v187);
  }
  else
  {
    v140 = *(_QWORD *)(v0 + 272);
    v139 = *(_QWORD *)(v0 + 280);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v132, v140);
  }
  sub_244B16DD4();
  *(_QWORD *)(v0 + 640) = v141;
  v142 = sub_244B16DB0();
  v143 = *(_QWORD *)(v142 + 16);
  if (v143)
  {
    v144 = *(_QWORD *)(v0 + 256);
    v199 = *(_QWORD *)(v0 + 232);
    v200[0] = MEMORY[0x24BEE4AF8];
    sub_244B144D0(0, v143, 0);
    v145 = v142 + ((*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80));
    v182 = *(_QWORD *)(v144 + 72);
    v188 = v144;
    v194 = *(void (**)(_QWORD, unint64_t, _QWORD))(v144 + 16);
    while (1)
    {
      v146 = *(_QWORD *)(v0 + 240);
      v147 = *(_QWORD *)(v0 + 224);
      v194(*(_QWORD *)(v0 + 264), v145, *(_QWORD *)(v0 + 248));
      sub_244B16DE0();
      v148 = sub_244B16D8C();
      v150 = v149;
      (*(void (**)(uint64_t, uint64_t))(v199 + 8))(v146, v147);
      v151 = sub_244B16DEC();
      if ((v151 & 0x8000000000000000) != 0)
        break;
      v152 = v151;
      if (HIDWORD(v151))
        break;
      (*(void (**)(_QWORD, _QWORD))(v188 + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
      v153 = v200[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244B144D0(0, *(_QWORD *)(v153 + 16) + 1, 1);
        v153 = v200[0];
      }
      v155 = *(_QWORD *)(v153 + 16);
      v154 = *(_QWORD *)(v153 + 24);
      if (v155 >= v154 >> 1)
      {
        sub_244B144D0(v154 > 1, v155 + 1, 1);
        v153 = v200[0];
      }
      *(_QWORD *)(v153 + 16) = v155 + 1;
      v156 = v153 + 24 * v155;
      *(_QWORD *)(v156 + 32) = v148;
      *(_QWORD *)(v156 + 40) = v150;
      *(_DWORD *)(v156 + 48) = v152;
      v145 += v182;
      if (!--v143)
      {
        swift_bridgeObjectRelease();
        goto LABEL_51;
      }
    }
    return sub_244B173D4();
  }
  else
  {
    swift_bridgeObjectRelease();
    v153 = MEMORY[0x24BEE4AF8];
LABEL_51:
    *(_QWORD *)(v0 + 648) = v153;
    v157 = *(_QWORD *)(v0 + 400);
    v158 = *(_QWORD *)(v0 + 152);
    v160 = *(_QWORD *)(v0 + 120);
    v159 = *(_QWORD *)(v0 + 128);
    v161 = *(_QWORD *)(v0 + 96);
    v162 = swift_task_alloc();
    *(_QWORD *)(v0 + 656) = v162;
    v163 = *(_OWORD *)(v0 + 136);
    v164 = *(_OWORD *)(v0 + 160);
    *(_QWORD *)(v162 + 16) = v160;
    *(_QWORD *)(v162 + 24) = v158;
    *(_QWORD *)(v162 + 32) = v157;
    *(_QWORD *)(v162 + 40) = v159;
    *(_OWORD *)(v162 + 48) = v163;
    *(_QWORD *)(v162 + 64) = v161;
    *(_OWORD *)(v162 + 72) = v164;
    v165 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 664) = v165;
    *v165 = v0;
    v165[1] = sub_244B0B124;
    return sub_244B16AD4();
  }
}

uint64_t sub_244B0B124()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 672) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B0B1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)(v8 + 160) = v24;
  *(_QWORD *)(v8 + 168) = v25;
  *(_OWORD *)(v8 + 144) = v23;
  *(_QWORD *)(v8 + 128) = a7;
  *(_QWORD *)(v8 + 136) = a8;
  *(_QWORD *)(v8 + 112) = a5;
  *(_QWORD *)(v8 + 120) = a6;
  *(_QWORD *)(v8 + 96) = a3;
  *(_QWORD *)(v8 + 104) = a4;
  *(_QWORD *)(v8 + 80) = a1;
  *(_QWORD *)(v8 + 88) = a2;
  v9 = sub_244B16EF4();
  *(_QWORD *)(v8 + 176) = v9;
  *(_QWORD *)(v8 + 184) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 192) = swift_task_alloc();
  *(_QWORD *)(v8 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB310);
  *(_QWORD *)(v8 + 208) = swift_task_alloc();
  *(_QWORD *)(v8 + 216) = swift_task_alloc();
  v10 = sub_244B16DA4();
  *(_QWORD *)(v8 + 224) = v10;
  *(_QWORD *)(v8 + 232) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 240) = swift_task_alloc();
  v11 = sub_244B16DF8();
  *(_QWORD *)(v8 + 248) = v11;
  *(_QWORD *)(v8 + 256) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 264) = swift_task_alloc();
  v12 = sub_244B170A4();
  *(_QWORD *)(v8 + 272) = v12;
  *(_QWORD *)(v8 + 280) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v8 + 288) = swift_task_alloc();
  *(_QWORD *)(v8 + 296) = swift_task_alloc();
  v13 = sub_244B16720();
  *(_QWORD *)(v8 + 304) = v13;
  *(_QWORD *)(v8 + 312) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v8 + 320) = swift_task_alloc();
  v14 = sub_244B17128();
  *(_QWORD *)(v8 + 328) = v14;
  *(_QWORD *)(v8 + 336) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v8 + 344) = swift_task_alloc();
  v15 = sub_244B17050();
  *(_QWORD *)(v8 + 352) = v15;
  *(_QWORD *)(v8 + 360) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 368) = swift_task_alloc();
  *(_QWORD *)(v8 + 376) = swift_task_alloc();
  v16 = sub_244B1696C();
  *(_QWORD *)(v8 + 384) = v16;
  *(_QWORD *)(v8 + 392) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v8 + 400) = swift_task_alloc();
  v17 = sub_244B16D2C();
  *(_QWORD *)(v8 + 408) = v17;
  *(_QWORD *)(v8 + 416) = *(_QWORD *)(v17 - 8);
  *(_QWORD *)(v8 + 424) = swift_task_alloc();
  v18 = sub_244B16CC0();
  *(_QWORD *)(v8 + 432) = v18;
  *(_QWORD *)(v8 + 440) = *(_QWORD *)(v18 - 8);
  *(_QWORD *)(v8 + 448) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB318);
  *(_QWORD *)(v8 + 456) = swift_task_alloc();
  *(_QWORD *)(v8 + 464) = swift_task_alloc();
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  *(_QWORD *)(v8 + 480) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB320);
  *(_QWORD *)(v8 + 488) = swift_task_alloc();
  *(_QWORD *)(v8 + 496) = swift_task_alloc();
  v19 = sub_244B16E34();
  *(_QWORD *)(v8 + 504) = v19;
  *(_QWORD *)(v8 + 512) = *(_QWORD *)(v19 - 8);
  *(_QWORD *)(v8 + 520) = swift_task_alloc();
  *(_QWORD *)(v8 + 528) = swift_task_alloc();
  *(_QWORD *)(v8 + 536) = swift_task_alloc();
  *(_QWORD *)(v8 + 544) = swift_task_alloc();
  v20 = sub_244B16C90();
  *(_QWORD *)(v8 + 552) = v20;
  *(_QWORD *)(v8 + 560) = *(_QWORD *)(v20 - 8);
  *(_QWORD *)(v8 + 568) = swift_task_alloc();
  *(_QWORD *)(v8 + 576) = swift_task_alloc();
  v21 = sub_244B16B7C();
  *(_QWORD *)(v8 + 584) = v21;
  *(_QWORD *)(v8 + 592) = *(_QWORD *)(v21 - 8);
  *(_QWORD *)(v8 + 600) = swift_task_alloc();
  *(_QWORD *)(v8 + 608) = swift_task_alloc();
  *(_QWORD *)(v8 + 616) = swift_task_alloc();
  *(_QWORD *)(v8 + 624) = swift_task_alloc();
  *(_QWORD *)(v8 + 632) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B0B55C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v6)(uint64_t, uint64_t, uint64_t);
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  BOOL v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
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
  NSObject *v43;
  os_log_type_t v44;
  BOOL v45;
  unint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  NSObject *v54;
  os_log_type_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
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
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  BOOL v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint8_t *v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  NSObject *v129;
  os_signpost_type_t v130;
  char v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  uint8_t *v135;
  uint64_t v136;
  os_signpost_id_t v137;
  void (*v138)(uint64_t, uint64_t);
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  int v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  _QWORD *v165;
  void (*v166)(uint64_t, uint64_t, uint64_t);
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t (*v190)(uint64_t, uint64_t, uint64_t);
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void (*v194)(_QWORD, unint64_t, _QWORD);
  uint64_t v195;
  void (*v196)(_QWORD, _QWORD, uint64_t);
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200[3];

  sub_244AF7684(&qword_2573DB328, (uint64_t (*)(uint64_t))MEMORY[0x24BEB8168], MEMORY[0x24BEB8178]);
  sub_244B16B64();
  v1 = *(_QWORD *)(v0 + 632);
  v2 = *(_QWORD *)(v0 + 624);
  v3 = *(_QWORD *)(v0 + 592);
  v4 = *(_QWORD *)(v0 + 584);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 184) + 56);
  v5(*(_QWORD *)(v0 + 480), 1, 1, *(_QWORD *)(v0 + 176));
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v1, v4);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v2, v4);
  if (v7 == *MEMORY[0x24BEB8150])
  {
    v6(*(_QWORD *)(v0 + 616), *(_QWORD *)(v0 + 632), *(_QWORD *)(v0 + 584));
    swift_bridgeObjectRetain_n();
    v8 = sub_244B17110();
    v9 = sub_244B172CC();
    v10 = os_log_type_enabled(v8, v9);
    v11 = *(_QWORD *)(v0 + 616);
    if (v10)
    {
      v177 = *(_QWORD *)(v0 + 592);
      v172 = *(_QWORD *)(v0 + 600);
      v175 = *(_QWORD *)(v0 + 584);
      v13 = *(_QWORD *)(v0 + 128);
      v12 = *(_QWORD *)(v0 + 136);
      v14 = swift_slowAlloc();
      v183 = swift_slowAlloc();
      v200[0] = v183;
      *(_DWORD *)v14 = 136315394;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 56) = sub_244B139EC(v13, v12, v200);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v14 + 12) = 2080;
      v6(v172, v11, v175);
      v15 = sub_244B17200();
      *(_QWORD *)(v0 + 64) = sub_244B139EC(v15, v16, v200);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v17 = *(void (**)(uint64_t, uint64_t))(v177 + 8);
      v17(v11, v175);
      _os_log_impl(&dword_244AF5000, v8, v9, "%s received unkown request payload %s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v183, -1, -1);
      MEMORY[0x24951F40C](v14, -1, -1);

    }
    else
    {
      v30 = *(_QWORD *)(v0 + 592);
      v31 = *(_QWORD *)(v0 + 584);

      swift_bridgeObjectRelease_n();
      v17 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v17(v11, v31);
    }
    v32 = *(_QWORD *)(v0 + 632);
    v33 = *(_QWORD *)(v0 + 624);
    v34 = *(_QWORD *)(v0 + 584);
    v35 = *(_QWORD *)(v0 + 480);
    type metadata accessor for PrivateMLClientInferenceProviderError(0);
    sub_244AF7684(&qword_2573DB330, type metadata accessor for PrivateMLClientInferenceProviderError, (uint64_t)&unk_244B17BE8);
    swift_allocError();
    v37 = v36;
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 2, 4, v38);
    swift_willThrow();
    sub_244AF8EA0(v35, &qword_2573DB318);
    v17(v32, v34);
    v17(v33, v34);
LABEL_33:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (v7 == *MEMORY[0x24BEB8158])
  {
    v18 = *(_QWORD *)(v0 + 624);
    v20 = *(_QWORD *)(v0 + 440);
    v19 = *(_QWORD *)(v0 + 448);
    v21 = *(_QWORD *)(v0 + 432);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 592) + 96))(v18, *(_QWORD *)(v0 + 584));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 32))(v19, v18, v21);
    swift_bridgeObjectRetain_n();
    v22 = sub_244B17110();
    v23 = sub_244B172D8();
    v24 = os_log_type_enabled(v22, v23);
    v25 = *(_QWORD *)(v0 + 136);
    if (v24)
    {
      v26 = *(_QWORD *)(v0 + 128);
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v200[0] = v28;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 72) = sub_244B139EC(v26, v25, v200);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, v22, v23, "%s received complete prompt request", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v28, -1, -1);
      MEMORY[0x24951F40C](v27, -1, -1);

    }
    else
    {

      v29 = swift_bridgeObjectRelease_n();
    }
    v50 = *(_QWORD *)(v0 + 440);
    v51 = *(_QWORD *)(v0 + 448);
    v52 = *(_QWORD *)(v0 + 432);
    v53 = *(_QWORD **)(v0 + 144);
    MEMORY[0x24951E9A4](v29);
    sub_244B16C9C();
    sub_244B16CA8();
    __swift_project_boxed_opaque_existential_1(v53, v53[3]);
    sub_244B16DBC();
    sub_244B16A5C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
  }
  else
  {
    if (v7 != *MEMORY[0x24BEB8160])
    {
      v6(*(_QWORD *)(v0 + 608), *(_QWORD *)(v0 + 632), *(_QWORD *)(v0 + 584));
      swift_bridgeObjectRetain_n();
      v54 = sub_244B17110();
      v55 = sub_244B172CC();
      v56 = os_log_type_enabled(v54, v55);
      v57 = *(_QWORD *)(v0 + 608);
      if (v56)
      {
        v178 = *(_QWORD *)(v0 + 600);
        v184 = *(_QWORD *)(v0 + 584);
        v189 = *(_QWORD *)(v0 + 592);
        v58 = *(_QWORD *)(v0 + 128);
        v59 = *(_QWORD *)(v0 + 136);
        v60 = swift_slowAlloc();
        v195 = swift_slowAlloc();
        v200[0] = v195;
        *(_DWORD *)v60 = 136315394;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 16) = sub_244B139EC(v58, v59, v200);
        sub_244B1735C();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v60 + 12) = 2080;
        v6(v178, v57, v184);
        v61 = sub_244B17200();
        *(_QWORD *)(v0 + 24) = sub_244B139EC(v61, v62, v200);
        sub_244B1735C();
        swift_bridgeObjectRelease();
        v63 = *(void (**)(uint64_t, uint64_t))(v189 + 8);
        v63(v57, v184);
        _os_log_impl(&dword_244AF5000, v54, v55, "%s received unkown request payload %s", (uint8_t *)v60, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24951F40C](v195, -1, -1);
        MEMORY[0x24951F40C](v60, -1, -1);

      }
      else
      {
        v70 = *(_QWORD *)(v0 + 592);
        v71 = *(_QWORD *)(v0 + 584);

        swift_bridgeObjectRelease_n();
        v63 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
        v63(v57, v71);
      }
      v72 = *(_QWORD *)(v0 + 632);
      v73 = *(_QWORD *)(v0 + 624);
      v74 = *(_QWORD *)(v0 + 584);
      v75 = *(_QWORD *)(v0 + 480);
      type metadata accessor for PrivateMLClientInferenceProviderError(0);
      sub_244AF7684(&qword_2573DB330, type metadata accessor for PrivateMLClientInferenceProviderError, (uint64_t)&unk_244B17BE8);
      swift_allocError();
      v77 = v76;
      v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v77, 2, 4, v78);
      swift_willThrow();
      sub_244AF8EA0(v75, &qword_2573DB318);
      v63(v72, v74);
      v63(v73, v74);
      goto LABEL_33;
    }
    v39 = *(_QWORD *)(v0 + 624);
    v41 = *(_QWORD *)(v0 + 416);
    v40 = *(_QWORD *)(v0 + 424);
    v42 = *(_QWORD *)(v0 + 408);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 592) + 96))(v39, *(_QWORD *)(v0 + 584));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v40, v39, v42);
    swift_bridgeObjectRetain_n();
    v43 = sub_244B17110();
    v44 = sub_244B172D8();
    v45 = os_log_type_enabled(v43, v44);
    v46 = *(_QWORD *)(v0 + 136);
    if (v45)
    {
      v47 = *(_QWORD *)(v0 + 128);
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v200[0] = v49;
      *(_DWORD *)v48 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 48) = sub_244B139EC(v47, v46, v200);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, v43, v44, "%s received completePromptTemplate request", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v49, -1, -1);
      MEMORY[0x24951F40C](v48, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v64 = *(_QWORD *)(v0 + 504);
    v65 = *(_QWORD *)(v0 + 512);
    v66 = *(_QWORD *)(v0 + 216);
    sub_244B16D20();
    v190 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v65 + 48);
    v67 = v190(v66, 1, v64);
    v68 = *(_QWORD *)(v0 + 512);
    if (v67 == 1)
    {
      v69 = *(_QWORD *)(v0 + 216);
      sub_244B16DC8();
      sub_244AF8EA0(v69, &qword_2573DB310);
      v196 = *(void (**)(_QWORD, _QWORD, uint64_t))(v68 + 32);
    }
    else
    {
      v196 = *(void (**)(_QWORD, _QWORD, uint64_t))(v68 + 32);
      v196(*(_QWORD *)(v0 + 528), *(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 504));
    }
    v79 = *(_QWORD *)(v0 + 504);
    v80 = *(_QWORD *)(v0 + 480);
    v81 = *(_QWORD *)(v0 + 464);
    v82 = *(_QWORD *)(v0 + 208);
    v83 = *(_QWORD *)(v0 + 176);
    v196(*(_QWORD *)(v0 + 544), *(_QWORD *)(v0 + 528), v79);
    sub_244B16D08();
    sub_244B16D14();
    sub_244B16CFC();
    sub_244AF8EA0(v80, &qword_2573DB318);
    v5(v81, 0, 1, v83);
    sub_244B1520C(v81, v80, &qword_2573DB318);
    sub_244B16D20();
    if (v190(v82, 1, v79) == 1)
    {
      sub_244AF8EA0(*(_QWORD *)(v0 + 208), &qword_2573DB310);
    }
    else
    {
      v196(*(_QWORD *)(v0 + 520), *(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 504));
      v84 = sub_244B16DBC();
      v86 = v85;
      swift_bridgeObjectRelease();
      v87 = HIBYTE(v86) & 0xF;
      if ((v86 & 0x2000000000000000) == 0)
        v87 = v84 & 0xFFFFFFFFFFFFLL;
      v88 = *(_QWORD *)(v0 + 520);
      v89 = *(_QWORD *)(v0 + 504);
      v90 = *(_QWORD *)(v0 + 512);
      if (v87)
      {
        __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 144), *(_QWORD *)(*(_QWORD *)(v0 + 144) + 24));
        sub_244B16DBC();
        sub_244B16A5C();
        swift_bridgeObjectRelease();
      }
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v88, v89);
    }
    v91 = *(_QWORD *)(v0 + 456);
    v92 = *(_QWORD *)(v0 + 176);
    v93 = *(_QWORD *)(v0 + 184);
    sub_244AF8E5C(*(_QWORD *)(v0 + 480), v91, &qword_2573DB318);
    v94 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v91, 1, v92);
    v95 = *(_QWORD *)(v0 + 456);
    v96 = *(_QWORD *)(v0 + 416);
    v97 = *(_QWORD *)(v0 + 408);
    if (v94 == 1)
    {
      (*(void (**)(_QWORD, _QWORD))(v96 + 8))(*(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 408));
      sub_244AF8EA0(v95, &qword_2573DB318);
    }
    else
    {
      v99 = *(_QWORD *)(v0 + 192);
      v98 = *(_QWORD *)(v0 + 200);
      v101 = *(_QWORD *)(v0 + 176);
      v100 = *(_QWORD *)(v0 + 184);
      v102 = *(_QWORD **)(v0 + 144);
      v197 = *(_QWORD *)(v0 + 424);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v100 + 32))(v98, *(_QWORD *)(v0 + 456), v101);
      __swift_project_boxed_opaque_existential_1(v102, v102[3]);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v100 + 16))(v99, v98, v101);
      sub_244B17200();
      sub_244B16A68();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v98, v101);
      (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v197, v97);
    }
  }
  v171 = *(_QWORD *)(v0 + 576);
  v103 = *(_QWORD *)(v0 + 568);
  v104 = *(_QWORD *)(v0 + 560);
  v105 = *(_QWORD *)(v0 + 544);
  v106 = *(_QWORD *)(v0 + 536);
  v108 = *(_QWORD *)(v0 + 504);
  v107 = *(_QWORD *)(v0 + 512);
  v168 = *(_QWORD *)(v0 + 496);
  v169 = *(_QWORD *)(v0 + 552);
  v167 = *(_QWORD *)(v0 + 488);
  v198 = *(_QWORD *)(v0 + 400);
  v109 = *(_QWORD *)(v0 + 376);
  v179 = *(_QWORD *)(v0 + 480);
  v185 = *(_QWORD *)(v0 + 344);
  v173 = *(_QWORD *)(v0 + 472);
  v176 = *(_QWORD *)(v0 + 336);
  v191 = *(_QWORD *)(v0 + 328);
  v110 = *(_QWORD *)(v0 + 112);
  v170 = *(_QWORD *)(v0 + 120);
  v111 = *(_QWORD *)(v0 + 104);
  v166 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 360) + 16);
  v166(v109, *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 352));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v107 + 16))(v106, v105, v108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 16))(v103, v171, v169);
  sub_244AF8E5C(v168, v167, &qword_2573DB320);
  sub_244AF8E5C(v179, v173, &qword_2573DB318);
  v112 = v170 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v176 + 16))(v185, v170 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger, v191);
  sub_244B14D30(v111, v110);
  sub_244B0D138(v111, v110, v109, v106, v103, v167, v173, v185, v198);
  v114 = *(_QWORD *)(v0 + 368);
  v115 = *(_QWORD *)(v0 + 352);
  v116 = *(_QWORD *)(v0 + 152);
  logMetric(logger:name:startInstant:)(v112, 0xD000000000000012, 0x8000000244B17FC0);
  v166(v114, v116, v115);
  v117 = sub_244B17110();
  v118 = sub_244B172D8();
  v119 = os_log_type_enabled(v117, v118);
  v120 = *(_QWORD *)(v0 + 360);
  v121 = *(_QWORD *)(v0 + 368);
  v122 = *(_QWORD *)(v0 + 352);
  if (v119)
  {
    v123 = *(_QWORD *)(v0 + 320);
    v180 = *(_QWORD *)(v0 + 312);
    v186 = *(_QWORD *)(v0 + 352);
    v124 = *(_QWORD *)(v0 + 304);
    v125 = (uint8_t *)swift_slowAlloc();
    v192 = swift_slowAlloc();
    v200[0] = v192;
    *(_DWORD *)v125 = 136315138;
    sub_244B17008();
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v126 = sub_244B17410();
    v174 = v120;
    v128 = v127;
    (*(void (**)(uint64_t, uint64_t))(v180 + 8))(v123, v124);
    *(_QWORD *)(v0 + 40) = sub_244B139EC(v126, v128, v200);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v174 + 8))(v121, v186);
    _os_log_impl(&dword_244AF5000, v117, v118, "%s sending private ML request", v125, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v192, -1, -1);
    MEMORY[0x24951F40C](v125, -1, -1);

  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v120 + 8))(v121, v122);
  }
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v129 = sub_244B170BC();
  v130 = sub_244B17338();
  v131 = sub_244B17344();
  v132 = *(_QWORD *)(v0 + 296);
  if ((v131 & 1) != 0)
  {
    v193 = *(_QWORD *)(v0 + 280);
    v181 = *(_QWORD *)(v0 + 288);
    v187 = *(_QWORD *)(v0 + 272);
    v134 = *(_QWORD *)(v0 + 128);
    v133 = *(_QWORD *)(v0 + 136);
    (*(void (**)(void))(v193 + 16))();
    v135 = (uint8_t *)swift_slowAlloc();
    v136 = swift_slowAlloc();
    v200[0] = v136;
    *(_DWORD *)v135 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = sub_244B139EC(v134, v133, v200);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v137 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v129, v130, v137, "executePrivateMLRequest", "request parsed requestIdentifier=%{public, signpost.description=attribute,public}s)", v135, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v136, -1, -1);
    MEMORY[0x24951F40C](v135, -1, -1);

    v138 = *(void (**)(uint64_t, uint64_t))(v193 + 8);
    v138(v132, v187);
    v138(v181, v187);
  }
  else
  {
    v140 = *(_QWORD *)(v0 + 272);
    v139 = *(_QWORD *)(v0 + 280);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v132, v140);
  }
  sub_244B16DD4();
  *(_QWORD *)(v0 + 640) = v141;
  v142 = sub_244B16DB0();
  v143 = *(_QWORD *)(v142 + 16);
  if (v143)
  {
    v144 = *(_QWORD *)(v0 + 256);
    v199 = *(_QWORD *)(v0 + 232);
    v200[0] = MEMORY[0x24BEE4AF8];
    sub_244B144D0(0, v143, 0);
    v145 = v142 + ((*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80));
    v182 = *(_QWORD *)(v144 + 72);
    v188 = v144;
    v194 = *(void (**)(_QWORD, unint64_t, _QWORD))(v144 + 16);
    while (1)
    {
      v146 = *(_QWORD *)(v0 + 240);
      v147 = *(_QWORD *)(v0 + 224);
      v194(*(_QWORD *)(v0 + 264), v145, *(_QWORD *)(v0 + 248));
      sub_244B16DE0();
      v148 = sub_244B16D8C();
      v150 = v149;
      (*(void (**)(uint64_t, uint64_t))(v199 + 8))(v146, v147);
      v151 = sub_244B16DEC();
      if ((v151 & 0x8000000000000000) != 0)
        break;
      v152 = v151;
      if (HIDWORD(v151))
        break;
      (*(void (**)(_QWORD, _QWORD))(v188 + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
      v153 = v200[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244B144D0(0, *(_QWORD *)(v153 + 16) + 1, 1);
        v153 = v200[0];
      }
      v155 = *(_QWORD *)(v153 + 16);
      v154 = *(_QWORD *)(v153 + 24);
      if (v155 >= v154 >> 1)
      {
        sub_244B144D0(v154 > 1, v155 + 1, 1);
        v153 = v200[0];
      }
      *(_QWORD *)(v153 + 16) = v155 + 1;
      v156 = v153 + 24 * v155;
      *(_QWORD *)(v156 + 32) = v148;
      *(_QWORD *)(v156 + 40) = v150;
      *(_DWORD *)(v156 + 48) = v152;
      v145 += v182;
      if (!--v143)
      {
        swift_bridgeObjectRelease();
        goto LABEL_51;
      }
    }
    return sub_244B173D4();
  }
  else
  {
    swift_bridgeObjectRelease();
    v153 = MEMORY[0x24BEE4AF8];
LABEL_51:
    *(_QWORD *)(v0 + 648) = v153;
    v157 = *(_QWORD *)(v0 + 400);
    v158 = *(_QWORD *)(v0 + 152);
    v160 = *(_QWORD *)(v0 + 120);
    v159 = *(_QWORD *)(v0 + 128);
    v161 = *(_QWORD *)(v0 + 96);
    v162 = swift_task_alloc();
    *(_QWORD *)(v0 + 656) = v162;
    v163 = *(_OWORD *)(v0 + 136);
    v164 = *(_OWORD *)(v0 + 160);
    *(_QWORD *)(v162 + 16) = v160;
    *(_QWORD *)(v162 + 24) = v158;
    *(_QWORD *)(v162 + 32) = v157;
    *(_QWORD *)(v162 + 40) = v159;
    *(_OWORD *)(v162 + 48) = v163;
    *(_QWORD *)(v162 + 64) = v161;
    *(_OWORD *)(v162 + 72) = v164;
    v165 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 664) = v165;
    *v165 = v0;
    v165[1] = sub_244B0CB9C;
    return sub_244B16AD4();
  }
}

uint64_t sub_244B0CB9C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 672) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B0CC28()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 632);
  v13 = *(_QWORD *)(v0 + 592);
  v14 = *(_QWORD *)(v0 + 584);
  v2 = *(_QWORD *)(v0 + 576);
  v11 = *(_QWORD *)(v0 + 560);
  v12 = *(_QWORD *)(v0 + 552);
  v3 = *(_QWORD *)(v0 + 544);
  v5 = *(_QWORD *)(v0 + 504);
  v4 = *(_QWORD *)(v0 + 512);
  v6 = *(_QWORD *)(v0 + 496);
  v8 = *(_QWORD *)(v0 + 392);
  v7 = *(_QWORD *)(v0 + 400);
  v9 = *(_QWORD *)(v0 + 384);
  sub_244AF8EA0(*(_QWORD *)(v0 + 480), &qword_2573DB318);
  sub_244AF8EA0(v6, &qword_2573DB320);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v12);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v14);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B0CEA4()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v13 = *(_QWORD *)(v0 + 584);
  v14 = *(_QWORD *)(v0 + 632);
  v1 = *(_QWORD *)(v0 + 576);
  v2 = *(_QWORD *)(v0 + 560);
  v3 = *(_QWORD *)(v0 + 552);
  v4 = *(_QWORD *)(v0 + 544);
  v6 = *(_QWORD *)(v0 + 504);
  v5 = *(_QWORD *)(v0 + 512);
  v7 = *(_QWORD *)(v0 + 496);
  v8 = *(_QWORD *)(v0 + 392);
  v11 = *(_QWORD *)(v0 + 400);
  v12 = *(_QWORD *)(v0 + 592);
  v9 = *(_QWORD *)(v0 + 384);
  sub_244AF8EA0(*(_QWORD *)(v0 + 480), &qword_2573DB318);
  sub_244AF8EA0(v7, &qword_2573DB320);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B0D138@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
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
  uint64_t v87;
  uint64_t v88;
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
  uint64_t v101;
  uint64_t v102;
  uint8_t *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _BYTE *v110;
  _QWORD *v111;
  char v112;
  NSObject *v113;
  os_log_type_t v114;
  int v115;
  uint64_t v116;
  uint8_t *v117;
  _BYTE *v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint8_t *v125;
  uint8_t *v126;
  uint64_t v127;
  char v128;
  uint8_t *v129;
  NSObject *v130;
  os_log_type_t v131;
  uint8_t *v132;
  uint64_t v133;
  _BYTE *v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  unint64_t v138;
  unint64_t v139;
  _BYTE *v140;
  uint64_t v141;
  uint8_t *v142;
  uint8_t *v143;
  void (*v144)(uint8_t *, uint64_t, uint64_t);
  NSObject *v145;
  os_log_type_t v146;
  _BOOL4 v147;
  uint64_t v148;
  _BYTE *v149;
  uint64_t v150;
  uint8_t *v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  uint8_t *v156;
  uint64_t v157;
  unint64_t v158;
  unint64_t v159;
  uint8_t *v160;
  uint8_t *v161;
  uint64_t v162;
  unint64_t v163;
  uint8_t *v164;
  uint64_t v165;
  uint64_t v166;
  __int128 v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  unint64_t v173;
  uint64_t v174;
  unint64_t i;
  unint64_t v177;
  uint64_t v178;
  uint64_t *v179;
  uint8_t *v180;
  uint64_t v181;
  uint8_t *v182;
  _BYTE *v183;
  void (*v184)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v185;
  _BYTE *v186;
  uint64_t v187;
  NSObject *v188;
  os_log_type_t v189;
  int v190;
  uint64_t v191;
  _BYTE *v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  unint64_t v196;
  _BYTE *v197;
  uint8_t *v198;
  uint64_t v199;
  uint64_t v200;
  os_log_t v201;
  uint8_t *v202;
  uint64_t v203;
  _BYTE *v204;
  void (*v205)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v206;
  NSObject *v207;
  os_log_type_t v208;
  uint8_t *v209;
  uint64_t v210;
  _BYTE *v211;
  uint64_t v212;
  uint64_t v213;
  unint64_t v214;
  unint64_t v215;
  uint64_t v216;
  uint8_t *v217;
  uint8_t *v218;
  _BYTE *v219;
  void (*v220)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v221;
  _BYTE *v222;
  NSObject *v223;
  os_log_type_t v224;
  int v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  _BYTE *v229;
  uint64_t v230;
  uint64_t v231;
  unint64_t v232;
  unint64_t v233;
  _BYTE *v234;
  uint8_t *v235;
  os_log_t v236;
  uint64_t v237;
  uint64_t v238;
  NSObject *v239;
  uint64_t v240;
  uint64_t v241;
  char v242;
  char v243;
  char v244;
  uint8_t *v245;
  _BYTE *v246;
  void (*v247)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v248;
  _BYTE *v249;
  NSObject *v250;
  os_log_type_t v251;
  int v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  _BYTE *v256;
  uint64_t v257;
  uint64_t v258;
  unint64_t v259;
  unint64_t v260;
  _BYTE *v261;
  uint8_t *v262;
  os_log_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  char v268;
  unint64_t *v269;
  _BYTE *v270;
  uint8_t *v271;
  uint8_t *v272;
  uint64_t *v273;
  _BYTE *v274;
  void (*v275)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v276;
  _BYTE *v277;
  NSObject *v278;
  os_log_type_t v279;
  int v280;
  _DWORD *v281;
  _BYTE *v282;
  uint8_t *v283;
  uint64_t v284;
  uint64_t v285;
  unint64_t v286;
  unint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint8_t *v291;
  uint64_t v292;
  _BYTE *v293;
  uint8_t *v294;
  _BYTE *v295;
  void (*v296)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v297;
  unint64_t v298;
  NSObject *v299;
  os_log_type_t v300;
  int v301;
  _BYTE *v302;
  uint64_t v303;
  uint64_t v304;
  unint64_t v305;
  unint64_t v306;
  _BYTE *v307;
  uint64_t v308;
  uint8_t *v309;
  os_log_t v310;
  _BYTE *v311;
  uint8_t *v312;
  _BYTE *v313;
  uint64_t v314;
  uint64_t v315;
  void (**v316)(_QWORD, _QWORD);
  _BYTE *v317;
  uint64_t v318;
  unint64_t v319;
  char v320;
  unint64_t v321;
  char v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  char v328;
  _BYTE *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  _BYTE *v335;
  void (*v336)(uint64_t, uint64_t);
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  _QWORD *v340;
  int v341;
  _QWORD *v342;
  uint64_t v343;
  _BYTE *v344;
  _BYTE *v345;
  uint64_t v346;
  uint64_t v347;
  int v348;
  _BYTE *v349;
  uint64_t *v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t result;
  _BYTE *v355;
  void (*v356)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v357;
  uint64_t v358;
  NSObject *v359;
  os_log_type_t v360;
  uint8_t *v361;
  _BYTE *v362;
  uint64_t v363;
  uint64_t v364;
  unint64_t v365;
  unint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  void (*v374)(_BYTE *, uint64_t);
  unint64_t *v375;
  unint64_t v376;
  _DWORD *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  int v382;
  uint64_t v383;
  _BYTE *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint8_t *v392;
  _BYTE *v393;
  uint64_t v394;
  _BYTE *v395;
  _BYTE *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  void (*v403)(uint8_t **, _QWORD);
  _QWORD **v404;
  _QWORD *v405;
  _QWORD *v406;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v408;
  unint64_t v409;
  _QWORD *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  int v414;
  uint8_t *v415;
  _BYTE *v416;
  void (*v417)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v418;
  NSObject *v419;
  os_log_type_t v420;
  uint8_t *v421;
  _BYTE *v422;
  uint64_t v423;
  uint64_t v424;
  unint64_t v425;
  unint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint8_t **v431;
  char v432;
  unint64_t v433;
  unint64_t v434;
  uint8_t *v435;
  _BYTE *v436;
  _BYTE *v437;
  void (*v438)(uint8_t *, uint64_t, uint64_t);
  NSObject *v439;
  uint8_t *v440;
  os_log_type_t v441;
  uint8_t *v442;
  uint64_t v443;
  _BYTE *v444;
  uint64_t v445;
  uint64_t v446;
  unint64_t v447;
  unint64_t v448;
  uint8_t *v449;
  uint64_t v450;
  uint64_t v451;
  uint8_t *v452;
  uint64_t v453;
  int64_t v454;
  unint64_t v455;
  uint64_t v456;
  _BYTE *v457;
  uint64_t v458;
  uint64_t v459;
  unint64_t v460;
  int v461;
  uint64_t v462;
  unint64_t v463;
  unint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  _BYTE *v470;
  uint64_t v471;
  uint64_t v472;
  _BYTE *v473;
  uint64_t v474;
  uint8_t *v475;
  unint64_t v476;
  unint64_t v477;
  _BYTE *v478;
  void (*v479)(uint8_t *, uint64_t, uint64_t);
  _BYTE *v480;
  _BYTE *v481;
  uint64_t v482;
  NSObject *v483;
  os_log_type_t v484;
  int v485;
  uint64_t v486;
  _BYTE *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  unint64_t v491;
  unint64_t v492;
  uint8_t *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  uint64_t v497;
  uint8_t *v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  _BYTE v502[4];
  int v503;
  _DWORD *v504;
  _QWORD *v505;
  _BYTE *v506;
  _BYTE *v507;
  uint8_t *v508;
  _BYTE *v509;
  uint64_t v510;
  uint64_t v511;
  _BYTE *v512;
  _BYTE *v513;
  _BYTE *v514;
  _BYTE *v515;
  _BYTE *v516;
  _BYTE *v517;
  _BYTE *v518;
  __int128 v519;
  _BYTE *v520;
  _BYTE *v521;
  _BYTE *v522;
  _BYTE *v523;
  _BYTE *v524;
  uint64_t *v525;
  _BYTE *v526;
  uint64_t v527;
  uint64_t v528;
  _BYTE *v529;
  uint64_t v530;
  uint64_t v531;
  _BYTE *v532;
  _BYTE *v533;
  _BYTE *v534;
  _BYTE *v535;
  _BYTE *v536;
  uint64_t v537;
  uint64_t v538;
  _BYTE *v539;
  _BYTE *v540;
  _BYTE *v541;
  _BYTE *v542;
  _BYTE *v543;
  _BYTE *v544;
  uint64_t v545;
  unint64_t v546;
  uint8_t *v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  _BYTE *v551;
  _BYTE *v552;
  _BYTE *v553;
  _BYTE *v554;
  _BYTE *v555;
  _BYTE *v556;
  uint8_t *v557;
  char *v558;
  __int128 v559;
  uint64_t v560;
  os_log_t v561;
  uint64_t v562;
  uint64_t v563;
  __int128 v564;
  _BYTE *v565;
  _BYTE *v566;
  _BYTE *v567;
  _BYTE *v568;
  unint64_t v569;
  _BYTE *v570;
  _BYTE *v571;
  uint64_t v572;
  uint8_t *v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  _BYTE *v579;
  uint64_t v580;
  uint64_t v581;
  _BYTE *v582;
  uint8_t *v583;
  uint64_t v584;
  int64_t v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  unint64_t v590;
  os_log_t v591;
  os_log_t v592;
  uint64_t v593;
  uint8_t *v594;
  void (*v595)(uint8_t *, uint64_t, uint64_t);
  uint8_t *v596;
  uint64_t v597;
  uint8_t *v598;
  uint8_t *v599;
  uint8_t *v600;
  uint8_t *v601;
  uint64_t v602;
  uint8_t *v603;
  uint8_t *v604;
  uint64_t v605;
  __int128 v606;
  uint64_t v607;
  uint8_t *v608;
  NSObject *v609;
  uint64_t v610;
  uint64_t v611;

  v548 = a7;
  v549 = a6;
  v550 = a4;
  v546 = a2;
  v545 = a1;
  v562 = a9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB360);
  MEMORY[0x24BDAC7A8](v12);
  v516 = &v502[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v575 = sub_244B16DA4();
  v574 = *(_QWORD *)(v575 - 8);
  v14 = MEMORY[0x24BDAC7A8](v575);
  v565 = &v502[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14);
  v552 = &v502[-v16];
  v577 = sub_244B16DF8();
  v576 = *(_QWORD *)(v577 - 8);
  v17 = MEMORY[0x24BDAC7A8](v577);
  v579 = &v502[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v556 = &v502[-v19];
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB368);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v551 = &v502[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v21);
  v509 = &v502[-v23];
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB318);
  MEMORY[0x24BDAC7A8](v24);
  v513 = &v502[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v531 = sub_244B16EF4();
  v530 = *(_QWORD *)(v531 - 8);
  MEMORY[0x24BDAC7A8](v531);
  v518 = &v502[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB1A0);
  MEMORY[0x24BDAC7A8](v27);
  v529 = &v502[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB370);
  MEMORY[0x24BDAC7A8](v29);
  v525 = (uint64_t *)&v502[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB320);
  MEMORY[0x24BDAC7A8](v31);
  v524 = &v502[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v528 = sub_244B16B4C();
  v527 = *(_QWORD *)(v528 - 8);
  MEMORY[0x24BDAC7A8](v528);
  v526 = &v502[-((v33 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v511 = sub_244B1684C();
  v510 = *(_QWORD *)(v511 - 8);
  v34 = MEMORY[0x24BDAC7A8](v511);
  v504 = &v502[-((v35 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v34);
  v505 = &v502[-v36];
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB378);
  MEMORY[0x24BDAC7A8](v37);
  v522 = &v502[-((v38 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB380);
  v40 = MEMORY[0x24BDAC7A8](v39);
  v517 = &v502[-((v41 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v40);
  v523 = &v502[-v42];
  v43 = sub_244B17248();
  MEMORY[0x24BDAC7A8](v43);
  v521 = &v502[-((v44 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v538 = sub_244B1696C();
  v537 = *(_QWORD *)(v538 - 8);
  MEMORY[0x24BDAC7A8](v538);
  v534 = &v502[-((v45 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v581 = sub_244B16720();
  v580 = *(_QWORD *)(v581 - 8);
  MEMORY[0x24BDAC7A8](v581);
  v582 = &v502[-((v46 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v47 = sub_244B17050();
  v48 = *(_QWORD *)(v47 - 8);
  v49 = MEMORY[0x24BDAC7A8](v47);
  v515 = &v502[-((v50 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v51 = MEMORY[0x24BDAC7A8](v49);
  v532 = &v502[-v52];
  v53 = MEMORY[0x24BDAC7A8](v51);
  v514 = &v502[-v54];
  v55 = MEMORY[0x24BDAC7A8](v53);
  v512 = &v502[-v56];
  v57 = MEMORY[0x24BDAC7A8](v55);
  v507 = &v502[-v58];
  v59 = MEMORY[0x24BDAC7A8](v57);
  v508 = &v502[-v60];
  v61 = MEMORY[0x24BDAC7A8](v59);
  v506 = &v502[-v62];
  v63 = MEMORY[0x24BDAC7A8](v61);
  v533 = &v502[-v64];
  v65 = MEMORY[0x24BDAC7A8](v63);
  v520 = &v502[-v66];
  v67 = MEMORY[0x24BDAC7A8](v65);
  v541 = &v502[-v68];
  v69 = MEMORY[0x24BDAC7A8](v67);
  v547 = &v502[-v70];
  v71 = MEMORY[0x24BDAC7A8](v69);
  v536 = &v502[-v72];
  v73 = MEMORY[0x24BDAC7A8](v71);
  v540 = &v502[-v74];
  v75 = MEMORY[0x24BDAC7A8](v73);
  v539 = &v502[-v76];
  v77 = MEMORY[0x24BDAC7A8](v75);
  v535 = &v502[-v78];
  v79 = MEMORY[0x24BDAC7A8](v77);
  v544 = &v502[-v80];
  v81 = MEMORY[0x24BDAC7A8](v79);
  v543 = &v502[-v82];
  v83 = MEMORY[0x24BDAC7A8](v81);
  v542 = &v502[-v84];
  v85 = MEMORY[0x24BDAC7A8](v83);
  v555 = &v502[-v86];
  v87 = MEMORY[0x24BDAC7A8](v85);
  v554 = &v502[-v88];
  v89 = MEMORY[0x24BDAC7A8](v87);
  v553 = &v502[-v90];
  v91 = MEMORY[0x24BDAC7A8](v89);
  v568 = &v502[-v92];
  v93 = MEMORY[0x24BDAC7A8](v91);
  v567 = &v502[-v94];
  v95 = MEMORY[0x24BDAC7A8](v93);
  v566 = &v502[-v96];
  v97 = MEMORY[0x24BDAC7A8](v95);
  v571 = &v502[-v98];
  v99 = MEMORY[0x24BDAC7A8](v97);
  v570 = &v502[-v100];
  v101 = MEMORY[0x24BDAC7A8](v99);
  v103 = &v502[-v102];
  v104 = MEMORY[0x24BDAC7A8](v101);
  v106 = (unint64_t)&v502[-v105];
  v107 = MEMORY[0x24BDAC7A8](v104);
  v601 = &v502[-v108];
  MEMORY[0x24BDAC7A8](v107);
  v110 = &v502[-v109];
  v563 = a5;
  sub_244B16C48();
  v111 = &loc_244B17000;
  v587 = a3;
  v589 = a8;
  v586 = v48;
  v602 = (uint64_t)v103;
  if ((v112 & 1) != 0)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v48 + 16))(v110, a3, v47);
    v113 = sub_244B17110();
    v114 = sub_244B172D8();
    v115 = v114;
    if (os_log_type_enabled(v113, v114))
    {
      v116 = swift_slowAlloc();
      LODWORD(v600) = v115;
      v117 = (uint8_t *)v116;
      v599 = (uint8_t *)swift_slowAlloc();
      v608 = v599;
      v598 = v117;
      *(_DWORD *)v117 = 136315138;
      v596 = v117 + 4;
      v118 = v582;
      sub_244B17008();
      sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v119 = v106;
      v120 = v581;
      v121 = sub_244B17410();
      v123 = v122;
      v124 = v120;
      v106 = v119;
      (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v118, v124);
      *(_QWORD *)&v606 = sub_244B139EC(v121, v123, (uint64_t *)&v608);
      v111 = (_QWORD *)&loc_244B17000;
      a8 = v589;
      sub_244B1735C();
      v48 = v586;
      swift_bridgeObjectRelease();
      (*(void (**)(_BYTE *, uint64_t))(v48 + 8))(v110, v47);
      v125 = v598;
      _os_log_impl(&dword_244AF5000, v113, (os_log_type_t)v600, "%s max tokens not set will be overriden.", v598, 0xCu);
      v126 = v599;
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v126, -1, -1);
      MEMORY[0x24951F40C](v125, -1, -1);

    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v48 + 8))(v110, v47);
    }
    a3 = v587;
    v103 = (uint8_t *)v602;
  }
  v127 = sub_244B16C48();
  v595 = *(void (**)(uint8_t *, uint64_t, uint64_t))(v48 + 16);
  if ((v128 & 1) == 0 && !v127)
  {
    v129 = v601;
    v595(v601, a3, v47);
    v130 = sub_244B17110();
    v131 = sub_244B172D8();
    if (os_log_type_enabled(v130, v131))
    {
      v132 = (uint8_t *)swift_slowAlloc();
      v600 = (uint8_t *)swift_slowAlloc();
      v608 = v600;
      v133 = v111[327];
      v599 = v132;
      *(_DWORD *)v132 = v133;
      v598 = v132 + 4;
      v134 = v582;
      sub_244B17008();
      sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v135 = v106;
      v136 = v581;
      v137 = sub_244B17410();
      v139 = v138;
      v140 = v134;
      v48 = v586;
      v141 = v136;
      v106 = v135;
      (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v140, v141);
      *(_QWORD *)&v606 = sub_244B139EC(v137, v139, (uint64_t *)&v608);
      sub_244B1735C();
      v111 = (_QWORD *)&loc_244B17000;
      a8 = v589;
      swift_bridgeObjectRelease();
      (*(void (**)(uint8_t *, uint64_t))(v48 + 8))(v601, v47);
      v142 = v599;
      _os_log_impl(&dword_244AF5000, v130, v131, "%s max tokens is set to zero.", v599, 0xCu);
      v143 = v600;
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v143, -1, -1);
      MEMORY[0x24951F40C](v142, -1, -1);

    }
    else
    {

      (*(void (**)(uint8_t *, uint64_t))(v48 + 8))(v129, v47);
    }
    a3 = v587;
    v103 = (uint8_t *)v602;
  }
  v144 = v595;
  v595((uint8_t *)v106, a3, v47);
  v144(v103, a3, v47);
  v145 = sub_244B17110();
  v146 = sub_244B172D8();
  LODWORD(v601) = v146;
  v147 = os_log_type_enabled(v145, v146);
  v588 = v47;
  if (v147)
  {
    v148 = swift_slowAlloc();
    v600 = (uint8_t *)swift_slowAlloc();
    v608 = v600;
    *(_DWORD *)v148 = 136315394;
    v599 = (uint8_t *)(v148 + 4);
    v149 = v582;
    sub_244B17008();
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v150 = v47;
    v151 = v103;
    v152 = v581;
    v153 = sub_244B17410();
    v155 = v154;
    (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v149, v152);
    *(_QWORD *)&v606 = sub_244B139EC(v153, v155, (uint64_t *)&v608);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    v156 = *(uint8_t **)(v586 + 8);
    ((void (*)(unint64_t, uint64_t))v156)(v106, v150);
    *(_WORD *)(v148 + 12) = 2080;
    v106 = (unint64_t)v151;
    sub_244B1702C();
    v157 = sub_244B172A8();
    v159 = v158;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v606 = sub_244B139EC(v157, v159, (uint64_t *)&v608);
    sub_244B1735C();
    v47 = v588;
    swift_bridgeObjectRelease();
    v598 = v156;
    ((void (*)(unint64_t, uint64_t))v156)(v106, v47);
    v111 = (_QWORD *)&loc_244B17000;
    _os_log_impl(&dword_244AF5000, v145, (os_log_type_t)v601, "%s initializing private ML request asset identifiers: %s", (uint8_t *)v148, 0x16u);
    v160 = (uint8_t *)MEMORY[0x24BEE4AD8];
    v161 = v600;
    swift_arrayDestroy();
    a8 = v589;
    MEMORY[0x24951F40C](v161, -1, -1);
    v162 = v148;
    a3 = v587;
    MEMORY[0x24951F40C](v162, -1, -1);

    v163 = v597;
  }
  else
  {

    v164 = *(uint8_t **)(v48 + 8);
    ((void (*)(unint64_t, uint64_t))v164)(v106, v47);
    v598 = v164;
    ((void (*)(uint8_t *, uint64_t))v164)(v103, v47);
    v163 = v597;
    v160 = (uint8_t *)MEMORY[0x24BEE4AD8];
  }
  v569 = sub_244AF75AC();
  v601 = (uint8_t *)sub_244B172E4();
  v602 = v165;
  v166 = sub_244B1702C();
  v572 = 0;
  v583 = 0;
  v573 = 0;
  v168 = 0;
  v169 = *(_QWORD *)(v166 + 56);
  v584 = v166 + 56;
  v593 = v166;
  v170 = 1 << *(_BYTE *)(v166 + 32);
  v171 = -1;
  if (v170 < 64)
    v171 = ~(-1 << v170);
  v172 = v171 & v169;
  v585 = (unint64_t)(v170 + 63) >> 6;
  v558 = (char *)&v606 + 8;
  v592 = (os_log_t)0xE300000000000000;
  v590 = 0xE000000000000000;
  *(_QWORD *)&v167 = v111[327];
  v559 = v167;
  v557 = v160 + 8;
  v560 = 0x8000000244B180E0;
  *(_QWORD *)&v167 = 136315394;
  v564 = v167;
  *(_QWORD *)&v167 = 136315650;
  v519 = v167;
  v596 = (uint8_t *)0xE000000000000000;
  v591 = (os_log_t)0xE000000000000000;
  v578 = 5065804;
  if ((v171 & v169) == 0)
    goto LABEL_19;
LABEL_18:
  v173 = __clz(__rbit64(v172));
  v174 = (v172 - 1) & v172;
  for (i = v173 | (v168 << 6); ; i = __clz(__rbit64(v177)) + (v168 << 6))
  {
    v179 = (uint64_t *)(*(_QWORD *)(v593 + 48) + 16 * i);
    v181 = *v179;
    v180 = (uint8_t *)v179[1];
    swift_bridgeObjectRetain();
    sub_244B16744();
    if (v163)
    {
      sub_244AF7628(v545, v546);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v314 = sub_244B17128();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v314 - 8) + 8))(a8, v314);
      goto LABEL_111;
    }
    v599 = (uint8_t *)v168;
    v600 = (uint8_t *)v174;
    if (v607)
    {
      v594 = (uint8_t *)v181;
      v182 = v180;
      sub_244B13AE0(&v606, (uint64_t)&v608);
      sub_244AF7B54((uint64_t)&v608, (uint64_t)&v606);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB158);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB388);
      if (swift_dynamicCast())
      {
        v597 = 0;
        swift_bridgeObjectRelease();
        v183 = v566;
        v184 = v595;
        v595(v566, a3, v47);
        v185 = v567;
        v184(v567, (uint64_t)v183, v47);
        v186 = v568;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v586 + 32))(v568, v183, v47);
        v160 = v182;
        swift_bridgeObjectRetain_n();
        v187 = a8;
        v188 = sub_244B17110();
        v189 = sub_244B172D8();
        v190 = v189;
        if (os_log_type_enabled(v188, v189))
        {
          v191 = swift_slowAlloc();
          v596 = (uint8_t *)swift_slowAlloc();
          v603 = v596;
          *(_DWORD *)v191 = v564;
          v192 = v582;
          v561 = v188;
          LODWORD(v583) = v190;
          sub_244B17008();
          sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          v193 = v581;
          v194 = sub_244B17410();
          v196 = v195;
          v197 = v192;
          v198 = v598;
          (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v197, v193);
          *(_QWORD *)(v191 + 4) = sub_244B139EC(v194, v196, (uint64_t *)&v603);
          v199 = v588;
          swift_bridgeObjectRelease();
          ((void (*)(_BYTE *, uint64_t))v198)(v186, v199);
          v200 = v199;
          ((void (*)(_BYTE *, uint64_t))v198)(v185, v199);
          *(_WORD *)(v191 + 12) = 2080;
          swift_bridgeObjectRetain();
          v106 = (unint64_t)v594;
          *(_QWORD *)(v191 + 14) = sub_244B139EC((uint64_t)v594, (unint64_t)v160, (uint64_t *)&v603);
          swift_bridgeObjectRelease_n();
          v201 = v561;
          _os_log_impl(&dword_244AF5000, v561, (os_log_type_t)v583, "%s resource is tokenizer %s", (uint8_t *)v191, 0x16u);
          v202 = v596;
          swift_arrayDestroy();
          v187 = v589;
          MEMORY[0x24951F40C](v202, -1, -1);
          v203 = v191;
          a3 = v587;
          MEMORY[0x24951F40C](v203, -1, -1);

        }
        else
        {

          v245 = v598;
          ((void (*)(_BYTE *, uint64_t))v598)(v186, v47);
          v200 = v47;
          ((void (*)(_BYTE *, uint64_t))v245)(v185, v47);
          swift_bridgeObjectRelease_n();
          v106 = (unint64_t)v594;
        }
        v603 = v601;
        v604 = (uint8_t *)v602;
        swift_bridgeObjectRetain();
        sub_244B17218();
        swift_bridgeObjectRelease();
        v583 = v603;
        v596 = v604;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v608);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v605);
        v168 = (uint64_t)v599;
        v172 = (unint64_t)v600;
        a8 = v187;
        v47 = v200;
        v163 = v597;
        goto LABEL_75;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB160);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        v219 = v553;
        v220 = v595;
        v595(v553, a3, v47);
        v221 = v554;
        v220(v554, (uint64_t)v219, v47);
        v222 = v555;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v586 + 32))(v555, v219, v47);
        v106 = (unint64_t)v182;
        swift_bridgeObjectRetain_n();
        v223 = sub_244B17110();
        v224 = sub_244B172D8();
        v225 = v224;
        if (os_log_type_enabled(v223, v224))
        {
          v226 = swift_slowAlloc();
          v227 = swift_slowAlloc();
          v597 = 0;
          v228 = v227;
          v603 = (uint8_t *)v227;
          *(_DWORD *)v226 = v564;
          v229 = v582;
          v592 = v223;
          sub_244B17008();
          sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          LODWORD(v578) = v225;
          v230 = v581;
          v231 = sub_244B17410();
          v233 = v232;
          v234 = v229;
          v235 = v598;
          (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v234, v230);
          *(_QWORD *)(v226 + 4) = sub_244B139EC(v231, v233, (uint64_t *)&v603);
          v47 = v588;
          swift_bridgeObjectRelease();
          ((void (*)(_BYTE *, uint64_t))v235)(v222, v47);
          ((void (*)(_BYTE *, uint64_t))v235)(v221, v47);
          *(_WORD *)(v226 + 12) = 2080;
          swift_bridgeObjectRetain();
          v160 = v594;
          *(_QWORD *)(v226 + 14) = sub_244B139EC((uint64_t)v594, v106, (uint64_t *)&v603);
          swift_bridgeObjectRelease_n();
          v236 = v592;
          _os_log_impl(&dword_244AF5000, v592, (os_log_type_t)v578, "%s resource is model %s", (uint8_t *)v226, 0x16u);
          swift_arrayDestroy();
          v237 = v228;
          v163 = v597;
          a8 = v589;
          MEMORY[0x24951F40C](v237, -1, -1);
          v238 = v226;
          a3 = v587;
          MEMORY[0x24951F40C](v238, -1, -1);

        }
        else
        {

          v270 = v222;
          v271 = v598;
          ((void (*)(_BYTE *, uint64_t))v598)(v270, v47);
          ((void (*)(_BYTE *, uint64_t))v271)(v221, v47);
          swift_bridgeObjectRelease_n();
          v160 = v594;
        }
        v603 = v601;
        v604 = (uint8_t *)v602;
        swift_bridgeObjectRetain();
        sub_244B17218();
        swift_bridgeObjectRelease();
        v578 = (uint64_t)v603;
        v272 = v604;
        v273 = &v611;
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB170);
        if (!swift_dynamicCast())
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB390);
          if (swift_dynamicCast())
          {
            swift_bridgeObjectRelease();
            v274 = v535;
            v275 = v595;
            v595(v535, a3, v47);
            v276 = v539;
            v275(v539, (uint64_t)v274, v47);
            v277 = v540;
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v586 + 32))(v540, v274, v47);
            v106 = (unint64_t)v182;
            swift_bridgeObjectRetain_n();
            v278 = sub_244B17110();
            v279 = sub_244B172D8();
            v280 = v279;
            if (os_log_type_enabled(v278, v279))
            {
              v281 = (_DWORD *)swift_slowAlloc();
              v572 = (uint64_t)v281;
              v597 = swift_slowAlloc();
              v603 = (uint8_t *)v597;
              *v281 = v564;
              v282 = v582;
              LODWORD(v590) = v280;
              sub_244B17008();
              sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
              v283 = (uint8_t *)v168;
              v284 = v581;
              v285 = sub_244B17410();
              v287 = v286;
              v288 = v284;
              v168 = (uint64_t)v283;
              (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v282, v288);
              v289 = sub_244B139EC(v285, v287, (uint64_t *)&v603);
              v290 = v572;
              *(_QWORD *)(v572 + 4) = v289;
              v163 = 0;
              v291 = v598;
              a8 = v589;
              swift_bridgeObjectRelease();
              ((void (*)(_BYTE *, uint64_t))v291)(v540, v47);
              v598 = v291;
              ((void (*)(_BYTE *, uint64_t))v291)(v539, v47);
              *(_WORD *)(v290 + 12) = 2080;
              swift_bridgeObjectRetain();
              v160 = v594;
              *(_QWORD *)(v290 + 14) = sub_244B139EC((uint64_t)v594, v106, (uint64_t *)&v603);
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_244AF5000, v278, (os_log_type_t)v590, "%s resource is draft %s", (uint8_t *)v290, 0x16u);
              v292 = v597;
              swift_arrayDestroy();
              MEMORY[0x24951F40C](v292, -1, -1);
              MEMORY[0x24951F40C](v290, -1, -1);

            }
            else
            {

              v311 = v277;
              v312 = v598;
              ((void (*)(_BYTE *, uint64_t))v598)(v311, v47);
              ((void (*)(_BYTE *, uint64_t))v312)(v276, v47);
              swift_bridgeObjectRelease_n();
              v160 = v594;
            }
            v603 = v601;
            v604 = (uint8_t *)v602;
            swift_bridgeObjectRetain();
            sub_244B17218();
            swift_bridgeObjectRelease();
            v572 = (uint64_t)v603;
            v590 = (unint64_t)v604;
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v608);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v605);
            a3 = v587;
            v172 = (unint64_t)v600;
          }
          else
          {
            v295 = v536;
            v296 = v595;
            v595(v536, a3, v47);
            v296(v547, (uint64_t)v295, v47);
            v297 = v541;
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v586 + 32))(v541, v295, v47);
            v298 = v602;
            swift_bridgeObjectRetain_n();
            v106 = (unint64_t)v182;
            swift_bridgeObjectRetain();
            v299 = sub_244B17110();
            v300 = sub_244B172D8();
            v301 = v300;
            if (os_log_type_enabled(v299, v300))
            {
              v160 = (uint8_t *)swift_slowAlloc();
              v597 = swift_slowAlloc();
              v605 = v597;
              *(_DWORD *)v160 = v519;
              v302 = v582;
              v561 = v299;
              sub_244B17008();
              sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
              v503 = v301;
              v303 = v581;
              v304 = sub_244B17410();
              v306 = v305;
              v307 = v302;
              a8 = v589;
              v308 = v303;
              v309 = v598;
              (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v307, v308);
              *(_QWORD *)(v160 + 4) = sub_244B139EC(v304, v306, &v605);
              v168 = (uint64_t)v599;
              swift_bridgeObjectRelease();
              ((void (*)(_BYTE *, uint64_t))v309)(v541, v47);
              ((void (*)(uint8_t *, uint64_t))v309)(v547, v47);
              *((_WORD *)v160 + 6) = 2080;
              swift_bridgeObjectRetain();
              *(_QWORD *)(v160 + 14) = sub_244B139EC((uint64_t)v594, v106, &v605);
              swift_bridgeObjectRelease_n();
              *((_WORD *)v160 + 11) = 2080;
              swift_bridgeObjectRetain();
              *((_QWORD *)v160 + 3) = sub_244B139EC((uint64_t)v601, v298, &v605);
              a3 = v587;
              swift_bridgeObjectRelease_n();
              v310 = v561;
              _os_log_impl(&dword_244AF5000, v561, (os_log_type_t)v503, "%s resource is default %s server scope: %s", v160, 0x20u);
              v106 = v597;
              swift_arrayDestroy();
              MEMORY[0x24951F40C](v106, -1, -1);
              MEMORY[0x24951F40C](v160, -1, -1);

              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v608);
              v172 = (unint64_t)v600;
            }
            else
            {
              v313 = v297;
              v160 = v598;
              ((void (*)(_BYTE *, uint64_t))v598)(v313, v47);
              ((void (*)(uint8_t *, uint64_t))v160)(v547, v47);

              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease_n();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v608);
              v172 = (unint64_t)v600;
              a3 = v587;
            }
          }
LABEL_75:
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v606);
          if (v172)
            goto LABEL_18;
          goto LABEL_19;
        }
        swift_bridgeObjectRelease();
        v246 = v542;
        v247 = v595;
        v595(v542, a3, v47);
        v248 = v543;
        v247(v543, (uint64_t)v246, v47);
        v249 = v544;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v586 + 32))(v544, v246, v47);
        v106 = (unint64_t)v182;
        swift_bridgeObjectRetain_n();
        v250 = sub_244B17110();
        v251 = sub_244B172D8();
        v252 = v251;
        if (os_log_type_enabled(v250, v251))
        {
          v253 = swift_slowAlloc();
          v254 = swift_slowAlloc();
          v597 = 0;
          v255 = v254;
          v603 = (uint8_t *)v254;
          *(_DWORD *)v253 = v564;
          v256 = v582;
          v591 = v250;
          sub_244B17008();
          sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
          LODWORD(v573) = v252;
          v257 = v581;
          v258 = sub_244B17410();
          v260 = v259;
          v261 = v256;
          v262 = v598;
          (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v261, v257);
          *(_QWORD *)(v253 + 4) = sub_244B139EC(v258, v260, (uint64_t *)&v603);
          v47 = v588;
          swift_bridgeObjectRelease();
          ((void (*)(_BYTE *, uint64_t))v262)(v249, v47);
          ((void (*)(_BYTE *, uint64_t))v262)(v248, v47);
          *(_WORD *)(v253 + 12) = 2080;
          swift_bridgeObjectRetain();
          v160 = v594;
          *(_QWORD *)(v253 + 14) = sub_244B139EC((uint64_t)v594, v106, (uint64_t *)&v603);
          swift_bridgeObjectRelease_n();
          v263 = v591;
          _os_log_impl(&dword_244AF5000, v591, (os_log_type_t)v573, "%s resource is adaptor %s", (uint8_t *)v253, 0x16u);
          swift_arrayDestroy();
          v264 = v255;
          v163 = v597;
          a8 = v589;
          MEMORY[0x24951F40C](v264, -1, -1);
          v265 = v253;
          a3 = v587;
          MEMORY[0x24951F40C](v265, -1, -1);

        }
        else
        {

          v293 = v249;
          v294 = v598;
          ((void (*)(_BYTE *, uint64_t))v598)(v293, v47);
          ((void (*)(_BYTE *, uint64_t))v294)(v248, v47);
          swift_bridgeObjectRelease_n();
          v160 = v594;
        }
        v603 = v601;
        v604 = (uint8_t *)v602;
        swift_bridgeObjectRetain();
        sub_244B17218();
        swift_bridgeObjectRelease();
        v573 = v603;
        v272 = v604;
        v273 = &v610;
      }
      *(v273 - 32) = (uint64_t)v272;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v608);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v605);
      v168 = (uint64_t)v599;
      v172 = (unint64_t)v600;
      goto LABEL_75;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_244AF8EA0((uint64_t)&v606, &qword_2573DB168);
    v204 = v570;
    v205 = v595;
    v595(v570, a3, v47);
    v206 = v571;
    v205(v571, (uint64_t)v204, v47);
    ((void (*)(_BYTE *, uint64_t))v598)(v204, v47);
    v207 = sub_244B17110();
    v208 = sub_244B172D8();
    if (os_log_type_enabled(v207, v208))
    {
      v209 = (uint8_t *)swift_slowAlloc();
      v210 = swift_slowAlloc();
      v608 = (uint8_t *)v210;
      v596 = v209;
      *(_DWORD *)v209 = v559;
      v597 = 0;
      v594 = v209 + 4;
      v211 = v582;
      sub_244B17008();
      sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v212 = v581;
      v213 = sub_244B17410();
      v215 = v214;
      v216 = v212;
      v217 = v598;
      (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v211, v216);
      *(_QWORD *)&v606 = sub_244B139EC(v213, v215, (uint64_t *)&v608);
      v163 = v597;
      a3 = v587;
      sub_244B1735C();
      v47 = v588;
      swift_bridgeObjectRelease();
      ((void (*)(_BYTE *, uint64_t))v217)(v206, v47);
      v218 = v596;
      _os_log_impl(&dword_244AF5000, v207, v208, "%s found no resource for identifier", v596, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v210, -1, -1);
      MEMORY[0x24951F40C](v218, -1, -1);

    }
    else
    {

      ((void (*)(_BYTE *, uint64_t))v598)(v206, v47);
    }
    v239 = v602;
    if ((sub_244B16ABC() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      type metadata accessor for PrivateMLClientInferenceProviderError(0);
      sub_244AF7684(&qword_2573DB330, type metadata accessor for PrivateMLClientInferenceProviderError, (uint64_t)&unk_244B17BE8);
      swift_allocError();
      v324 = v323;
      v325 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v325 - 8) + 56))(v324, 1, 4, v325);
      swift_willThrow();
      sub_244AF7628(v545, v546);
      v326 = sub_244B17128();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v326 - 8) + 8))(v589, v326);
      goto LABEL_111;
    }
    v240 = sub_244B17308();
    if (!v240)
      goto LABEL_107;
    v241 = v240;
    if (!*(_QWORD *)(v240 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_107:
      swift_bridgeObjectRelease();
      v355 = v520;
      v356 = v595;
      v595(v520, a3, v47);
      v357 = v533;
      v356(v533, (uint64_t)v355, v47);
      ((void (*)(_BYTE *, uint64_t))v598)(v355, v47);
      v358 = v589;
      v359 = sub_244B17110();
      v360 = sub_244B172D8();
      if (os_log_type_enabled(v359, v360))
      {
        v361 = (uint8_t *)swift_slowAlloc();
        v602 = swift_slowAlloc();
        v608 = (uint8_t *)v602;
        *(_DWORD *)v361 = v559;
        v601 = v361 + 4;
        v362 = v582;
        sub_244B17008();
        sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v363 = v581;
        v364 = sub_244B17410();
        v366 = v365;
        (*(void (**)(_BYTE *, uint64_t))(v580 + 8))(v362, v363);
        *(_QWORD *)&v606 = sub_244B139EC(v364, v366, (uint64_t *)&v608);
        a3 = v587;
        sub_244B1735C();
        v358 = v589;
        swift_bridgeObjectRelease();
        ((void (*)(_BYTE *, uint64_t))v598)(v533, v47);
        _os_log_impl(&dword_244AF5000, v359, v360, "%s no or empty override catalog", v361, 0xCu);
        v367 = v602;
        swift_arrayDestroy();
        MEMORY[0x24951F40C](v367, -1, -1);
        MEMORY[0x24951F40C](v361, -1, -1);

      }
      else
      {

        ((void (*)(_BYTE *, uint64_t))v598)(v357, v47);
      }
      type metadata accessor for PrivateMLClientInferenceProviderError(0);
      sub_244AF7684(&qword_2573DB330, type metadata accessor for PrivateMLClientInferenceProviderError, (uint64_t)&unk_244B17BE8);
      swift_allocError();
      v369 = v368;
      v370 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v370 - 8) + 56))(v369, 1, 4, v370);
      swift_willThrow();
      sub_244AF7628(v545, v546);
      v371 = sub_244B17128();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v371 - 8) + 8))(v358, v371);
LABEL_111:
      sub_244AF8EA0(v548, &qword_2573DB318);
      sub_244AF8EA0(v549, &qword_2573DB320);
      v372 = sub_244B16C90();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v372 - 8) + 8))(v563, v372);
      v373 = sub_244B16E34();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v373 - 8) + 8))(v550, v373);
      ((void (*)(uint64_t, uint64_t))v598)(a3, v47);
      return swift_release();
    }
    sub_244B14CB0(0x6D614E6C65646F6DLL, 0xE900000000000065, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0);
    if ((v242 & 1) != 0)
      swift_bridgeObjectRetain();
    v608 = v601;
    v609 = v239;
    swift_bridgeObjectRetain();
    sub_244B17218();
    swift_bridgeObjectRelease();
    v578 = (uint64_t)v608;
    v592 = v609;
    if (*(_QWORD *)(v241 + 16))
    {
      sub_244B14CB0(0xD000000000000010, v560, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0);
      if ((v243 & 1) != 0)
        swift_bridgeObjectRetain();
    }
    v608 = v601;
    v609 = v239;
    swift_bridgeObjectRetain();
    sub_244B17218();
    swift_bridgeObjectRelease();
    v573 = v608;
    v591 = v609;
    if (*(_QWORD *)(v241 + 16))
    {
      sub_244B14CB0(0x657A696E656B6F54, 0xED0000656D614E72, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0);
      if ((v244 & 1) != 0)
        swift_bridgeObjectRetain();
    }
    v608 = v601;
    v609 = v239;
    swift_bridgeObjectRetain();
    sub_244B17218();
    swift_bridgeObjectRelease();
    v596 = (uint8_t *)v609;
    v266 = *(_QWORD *)(v241 + 16);
    v583 = v608;
    if (v266
      && (v267 = sub_244B14CB0(0x646F4D7466617264, 0xEE00656D614E6C65, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0), (v268 & 1) != 0))
    {
      v269 = (unint64_t *)(*(_QWORD *)(v241 + 56) + 16 * v267);
      v106 = *v269;
      v160 = (uint8_t *)v269[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      v160 = (uint8_t *)0xE500000000000000;
      v106 = 0x7466617244;
    }
    swift_bridgeObjectRelease();
    v608 = v601;
    v609 = v602;
    swift_bridgeObjectRetain();
    sub_244B17218();
    swift_bridgeObjectRelease();
    v572 = (uint64_t)v608;
    v590 = (unint64_t)v609;
    a8 = v589;
    v168 = (uint64_t)v599;
    v172 = (unint64_t)v600;
    if (v600)
      goto LABEL_18;
LABEL_19:
    if (__OFADD__(v168++, 1))
    {
      __break(1u);
      goto LABEL_166;
    }
    if (v168 >= v585)
      goto LABEL_83;
    v177 = *(_QWORD *)(v584 + 8 * v168);
    if (!v177)
      break;
LABEL_29:
    v174 = (v177 - 1) & v177;
  }
  v178 = v168 + 1;
  if (v168 + 1 >= v585)
    goto LABEL_83;
  v177 = *(_QWORD *)(v584 + 8 * v178);
  if (v177)
    goto LABEL_28;
  v178 = v168 + 2;
  if (v168 + 2 >= v585)
    goto LABEL_83;
  v177 = *(_QWORD *)(v584 + 8 * v178);
  if (v177)
  {
LABEL_28:
    v168 = v178;
    goto LABEL_29;
  }
  v178 = v168 + 3;
  if (v168 + 3 < v585)
  {
    v177 = *(_QWORD *)(v584 + 8 * v178);
    if (!v177)
    {
      while (1)
      {
        v168 = v178 + 1;
        if (__OFADD__(v178, 1))
          break;
        if (v168 >= v585)
          goto LABEL_83;
        v177 = *(_QWORD *)(v584 + 8 * v168);
        ++v178;
        if (v177)
          goto LABEL_29;
      }
LABEL_166:
      __break(1u);
      goto LABEL_167;
    }
    goto LABEL_28;
  }
LABEL_83:
  v315 = a8;
  swift_bridgeObjectRelease();
  swift_release();
  v316 = (void (**)(_QWORD, _QWORD))v582;
  sub_244B17008();
  sub_244B17038();
  v317 = v534;
  sub_244B168C4();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v537 + 32))(v562, v317, v538);
  sub_244B17008();
  v318 = sub_244B17020();
  sub_244AFE810(v316, v318);
  v600 = *(uint8_t **)(v580 + 8);
  ((void (*)(_QWORD, uint64_t))v600)(v316, v581);
  sub_244B16858();
  sub_244B16870();
  sub_244B167E0();
  sub_244B167EC();
  sub_244B16D80();
  sub_244B167F8();
  v319 = sub_244B16C6C();
  if ((v320 & 1) != 0)
    v319 = 0;
  if ((v319 & 0x8000000000000000) == 0 && !HIDWORD(v319))
  {
    sub_244B1678C();
    sub_244B168AC();
    sub_244B16C30();
    sub_244B167B0();
    v321 = sub_244B16C48();
    if ((v322 & 1) != 0 || (v321 & 0x8000000000000000) == 0 && !HIDWORD(v321))
    {
      sub_244B16954();
      sub_244B16C3C();
      sub_244B167C8();
      sub_244B16C60();
      sub_244B16864();
      v327 = sub_244B16C24();
      if ((v328 & 1) != 0 || (v327 & 0x8000000000000000) == 0)
        goto LABEL_96;
    }
  }
LABEL_95:
  while (2)
  {
    while (2)
    {
      sub_244B173D4();
      __break(1u);
LABEL_96:
      sub_244B16798();
      sub_244B17014();
      sub_244B16960();
      sub_244B16C78();
      sub_244B16900();
      sub_244B16C54();
      sub_244B167D4();
      sub_244B16948();
      sub_244B17260();
      sub_244B167BC();
      v329 = v522;
      sub_244B16C84();
      v330 = (uint64_t)v329;
      v331 = sub_244B16C18();
      v332 = *(_QWORD *)(v331 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v332 + 48))(v330, 1, v331) == 1)
      {
        sub_244AF8EA0(v330, &qword_2573DB378);
        v333 = sub_244B16C00();
        v334 = (uint64_t)v523;
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v333 - 8) + 56))(v523, 1, 1, v333);
        goto LABEL_100;
      }
      v335 = v523;
      sub_244B16C0C();
      v336 = *(void (**)(uint64_t, uint64_t))(v332 + 8);
      v334 = (uint64_t)v335;
      v336(v330, v331);
      v337 = sub_244B16C00();
      v338 = *(_QWORD *)(v337 - 8);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v338 + 56))(v335, 0, 1, v337);
      v339 = (uint64_t)v335;
      v340 = v517;
      sub_244AF8E5C(v339, (uint64_t)v517, &qword_2573DB380);
      v341 = (*(uint64_t (**)(_QWORD *, uint64_t))(v338 + 88))(v340, v337);
      if (v341 == *MEMORY[0x24BEB82B8])
      {
        (*(void (**)(_QWORD *, uint64_t))(v338 + 96))(v340, v337);
        v342 = v505;
        *v505 = *v340;
        (*(void (**)(_QWORD *, _QWORD, uint64_t))(v510 + 104))(v342, *MEMORY[0x24BE78C20], v511);
        sub_244B16894();
LABEL_100:
        v343 = v315;
LABEL_101:
        v344 = v529;
        goto LABEL_102;
      }
      v343 = v315;
      if (v341 != *MEMORY[0x24BEB82C0])
      {
        if (v341 == *MEMORY[0x24BEB82C8])
        {
          (*(void (**)(_QWORD *, _QWORD, uint64_t))(v510 + 104))(v505, *MEMORY[0x24BE78C30], v511);
          sub_244B16894();
        }
        else
        {
          (*(void (**)(_BYTE *, uint64_t))(v338 + 8))(v517, v337);
        }
        goto LABEL_101;
      }
      v374 = *(void (**)(_BYTE *, uint64_t))(v338 + 96);
      v375 = (unint64_t *)v517;
      v374(v517, v337);
      v376 = *v375;
      if ((*v375 & 0x8000000000000000) != 0)
        continue;
      break;
    }
    v344 = v529;
    if (HIDWORD(v376))
      continue;
    break;
  }
  v377 = v504;
  *v504 = v376;
  (*(void (**)(_DWORD *, _QWORD, uint64_t))(v510 + 104))(v377, *MEMORY[0x24BE78C28], v511);
  sub_244B16894();
LABEL_102:
  sub_244AF8EA0(v334, &qword_2573DB380);
  v345 = v524;
  sub_244AF8E5C(v549, (uint64_t)v524, &qword_2573DB320);
  v346 = v527;
  v347 = v528;
  v348 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v527 + 48))(v345, 1, v528);
  v349 = v526;
  v350 = v525;
  if (v348 == 1)
  {
    sub_244AF8EA0((uint64_t)v345, &qword_2573DB320);
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v346 + 32))(v526, v345, v347);
    Constraints.toTMLConstraints(logger:)(v343, v350);
    if (v163)
    {
      sub_244AF7628(v545, v546);
      v351 = sub_244B17128();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v351 - 8) + 8))(v343, v351);
      sub_244AF8EA0(v548, &qword_2573DB318);
      sub_244AF8EA0(v549, &qword_2573DB320);
      v352 = sub_244B16C90();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v352 - 8) + 8))(v563, v352);
      v353 = sub_244B16E34();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v353 - 8) + 8))(v550, v353);
      ((void (*)(uint64_t, uint64_t))v598)(v587, v47);
      (*(void (**)(_BYTE *, uint64_t))(v346 + 8))(v349, v347);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v537 + 8))(v562, v538);
    }
    sub_244B16804();
    (*(void (**)(_BYTE *, uint64_t))(v346 + 8))(v349, v347);
  }
  v378 = v587;
  sub_244B16FFC();
  v379 = sub_244B16F30();
  v380 = *(_QWORD *)(v379 - 8);
  v381 = (uint64_t)v344;
  v382 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v380 + 48))(v344, 1, v379);
  if (v382 == 1)
  {
    sub_244AF8EA0(v381, &qword_2573DB1A0);
  }
  else
  {
    sub_244B16F18();
    (*(void (**)(uint64_t, uint64_t))(v380 + 8))(v381, v379);
  }
  v383 = v577;
  LOBYTE(v608) = v382 == 1;
  sub_244B168A0();
  v384 = v513;
  sub_244AF8E5C(v548, (uint64_t)v513, &qword_2573DB318);
  v385 = v530;
  v386 = v531;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v530 + 48))(v384, 1, v531) == 1)
  {
    sub_244AF8EA0((uint64_t)v384, &qword_2573DB318);
    v387 = sub_244B16DB0();
    v388 = *(_QWORD *)(v387 + 16);
    if (v388)
    {
      v389 = *(unsigned __int8 *)(v576 + 80);
      v599 = (uint8_t *)v387;
      v390 = v387 + ((v389 + 32) & ~v389);
      v391 = *(_QWORD *)(v576 + 72);
      v601 = *(uint8_t **)(v576 + 16);
      v392 = v601;
      ((void (*)(_BYTE *, uint64_t, uint64_t))v601)(v556, v390, v383);
      while (1)
      {
        v395 = v552;
        sub_244B16DE0();
        v396 = v551;
        sub_244B16D98();
        v397 = (uint64_t)v396;
        (*(void (**)(_BYTE *, uint64_t))(v574 + 8))(v395, v575);
        v398 = sub_244B16738();
        v399 = *(_QWORD *)(v398 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v399 + 48))(v397, 1, v398) == 1)
        {
          sub_244AF8EA0(v397, &qword_2573DB368);
        }
        else
        {
          v400 = v391;
          v597 = v163;
          v602 = sub_244B1672C();
          v402 = v401;
          (*(void (**)(uint64_t, uint64_t))(v399 + 8))(v397, v398);
          v403 = (void (*)(uint8_t **, _QWORD))sub_244B168E8();
          v405 = v404;
          v406 = *v404;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *v405 = v406;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v406 = sub_244B13840(0, v406[2] + 1, 1, v406);
            *v405 = v406;
          }
          v409 = v406[2];
          v408 = v406[3];
          if (v409 >= v408 >> 1)
          {
            v406 = sub_244B13840((_QWORD *)(v408 > 1), v409 + 1, 1, v406);
            *v405 = v406;
          }
          v391 = v400;
          v406[2] = v409 + 1;
          v410 = &v406[2 * v409];
          v410[4] = v602;
          v410[5] = v402;
          v403(&v608, 0);
          v378 = v587;
          v163 = v597;
          v392 = v601;
        }
        v393 = v556;
        v394 = v577;
        (*(void (**)(_BYTE *, uint64_t))(v576 + 8))(v556, v577);
        v390 += v391;
        if (!--v388)
          break;
        ((void (*)(_BYTE *, uint64_t, uint64_t))v392)(v393, v390, v394);
      }
    }
    swift_bridgeObjectRelease();
    v597 = v163;
    v416 = v507;
    v47 = v588;
    v417 = v595;
    v595(v507, v378, v588);
    v418 = v512;
    v417(v512, (uint64_t)v416, v47);
    ((void (*)(_BYTE *, uint64_t))v598)(v416, v47);
    v419 = sub_244B17110();
    v420 = sub_244B172D8();
    if (os_log_type_enabled(v419, v420))
    {
      v421 = (uint8_t *)swift_slowAlloc();
      v602 = swift_slowAlloc();
      v608 = (uint8_t *)v602;
      *(_DWORD *)v421 = v559;
      v601 = v421 + 4;
      v422 = v582;
      sub_244B17008();
      sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v423 = v581;
      v424 = sub_244B17410();
      v426 = v425;
      ((void (*)(_BYTE *, uint64_t))v600)(v422, v423);
      *(_QWORD *)&v606 = sub_244B139EC(v424, v426, (uint64_t *)&v608);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      ((void (*)(_BYTE *, uint64_t))v598)(v512, v47);
      _os_log_impl(&dword_244AF5000, v419, v420, "%s Setup CompletePrompt.", v421, 0xCu);
      v427 = v602;
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v427, -1, -1);
      MEMORY[0x24951F40C](v421, -1, -1);

    }
    else
    {

      ((void (*)(_BYTE *, uint64_t))v598)(v418, v47);
    }
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v385 + 32))(v518, v384, v386);
    v411 = (uint64_t)v509;
    sub_244B16EE8();
    v412 = sub_244B16738();
    v413 = *(_QWORD *)(v412 - 8);
    v414 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v413 + 48))(v411, 1, v412);
    v597 = v163;
    if (v414 == 1)
    {
      sub_244AF8EA0(v411, &qword_2573DB368);
      v415 = v508;
    }
    else
    {
      v428 = sub_244B1672C();
      v429 = v411;
      v160 = (uint8_t *)v428;
      a8 = v430;
      (*(void (**)(uint64_t, uint64_t))(v413 + 8))(v429, v412);
      v172 = sub_244B168E8();
      v106 = (unint64_t)v431;
      v168 = (uint64_t)*v431;
      v432 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)v106 = v168;
      if ((v432 & 1) == 0)
      {
LABEL_167:
        v168 = (uint64_t)sub_244B13840(0, *(_QWORD *)(v168 + 16) + 1, 1, (_QWORD *)v168);
        *(_QWORD *)v106 = v168;
      }
      v434 = *(_QWORD *)(v168 + 16);
      v433 = *(_QWORD *)(v168 + 24);
      if (v434 >= v433 >> 1)
      {
        v168 = (uint64_t)sub_244B13840((_QWORD *)(v433 > 1), v434 + 1, 1, (_QWORD *)v168);
        *(_QWORD *)v106 = v168;
      }
      v415 = v508;
      *(_QWORD *)(v168 + 16) = v434 + 1;
      v435 = (uint8_t *)(v168 + 16 * v434);
      *((_QWORD *)v435 + 4) = v160;
      *((_QWORD *)v435 + 5) = a8;
      ((void (*)(uint8_t **, _QWORD))v172)(&v608, 0);
      v378 = v587;
    }
    v436 = v518;
    sub_244B16ED0();
    sub_244B16888();
    sub_244B16EDC();
    sub_244B168DC();
    v437 = v506;
    v438 = v595;
    v595(v506, v378, v47);
    v438(v415, (uint64_t)v437, v47);
    ((void (*)(_BYTE *, uint64_t))v598)(v437, v47);
    v439 = sub_244B17110();
    v440 = v415;
    v441 = sub_244B172D8();
    if (os_log_type_enabled(v439, v441))
    {
      v442 = (uint8_t *)swift_slowAlloc();
      v443 = swift_slowAlloc();
      v601 = v442;
      v602 = v443;
      v608 = (uint8_t *)v443;
      *(_DWORD *)v442 = v559;
      v599 = v442 + 4;
      v444 = v582;
      sub_244B17008();
      sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v445 = v581;
      v446 = sub_244B17410();
      v448 = v447;
      ((void (*)(_BYTE *, uint64_t))v600)(v444, v445);
      *(_QWORD *)&v606 = sub_244B139EC(v446, v448, (uint64_t *)&v608);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      ((void (*)(uint8_t *, uint64_t))v598)(v440, v47);
      v449 = v601;
      _os_log_impl(&dword_244AF5000, v439, v441, "%s Setup PromptTemplate.", v601, 0xCu);
      v450 = v602;
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v450, -1, -1);
      MEMORY[0x24951F40C](v449, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v530 + 8))(v518, v531);
    }
    else
    {
      ((void (*)(uint8_t *, uint64_t))v598)(v440, v47);

      (*(void (**)(_BYTE *, uint64_t))(v530 + 8))(v436, v531);
    }
  }
  v451 = v577;
  v599 = (uint8_t *)sub_244B16DD4();
  v596 = v452;
  v453 = sub_244B16DB0();
  v454 = *(_QWORD *)(v453 + 16);
  if (v454)
  {
    v608 = (uint8_t *)MEMORY[0x24BEE4AF8];
    sub_244B144D0(0, v454, 0);
    v455 = (*(unsigned __int8 *)(v576 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v576 + 80);
    v594 = (uint8_t *)v453;
    v163 = v453 + v455;
    v456 = *(_QWORD *)(v576 + 72);
    v601 = *(uint8_t **)(v576 + 16);
    v602 = v456;
    while (1)
    {
      ((void (*)(_BYTE *, unint64_t, uint64_t))v601)(v579, v163, v451);
      v457 = v565;
      sub_244B16DE0();
      v315 = sub_244B16D8C();
      v459 = v458;
      (*(void (**)(_BYTE *, uint64_t))(v574 + 8))(v457, v575);
      v460 = sub_244B16DEC();
      if ((v460 & 0x8000000000000000) != 0)
        goto LABEL_95;
      v461 = v460;
      if (HIDWORD(v460))
        goto LABEL_95;
      (*(void (**)(_BYTE *, uint64_t))(v576 + 8))(v579, v451);
      v462 = (uint64_t)v608;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244B144D0(0, *(_QWORD *)(v462 + 16) + 1, 1);
        v462 = (uint64_t)v608;
      }
      v464 = *(_QWORD *)(v462 + 16);
      v463 = *(_QWORD *)(v462 + 24);
      if (v464 >= v463 >> 1)
      {
        sub_244B144D0(v463 > 1, v464 + 1, 1);
        v462 = (uint64_t)v608;
      }
      *(_QWORD *)(v462 + 16) = v464 + 1;
      v465 = v462 + 24 * v464;
      *(_QWORD *)(v465 + 32) = v315;
      *(_QWORD *)(v465 + 40) = v459;
      *(_DWORD *)(v465 + 48) = v461;
      v163 += v602;
      --v454;
      v47 = v588;
      v451 = v577;
      if (!v454)
      {
        swift_bridgeObjectRelease();
        goto LABEL_155;
      }
    }
  }
  swift_bridgeObjectRelease();
  v462 = MEMORY[0x24BEE4AF8];
LABEL_155:
  v466 = v587;
  v467 = v597;
  if (*(_QWORD *)(v462 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB398);
    v468 = sub_244B173F8();
  }
  else
  {
    v468 = MEMORY[0x24BEE4B00];
  }
  v608 = (uint8_t *)v468;
  sub_244B14F58(v462, 1, &v608);
  v597 = v467;
  if (v467)
  {
    swift_bridgeObjectRelease();
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v469 = v562;
    sub_244B1687C();
    sub_244B168D0();
    sub_244B168F4();
    v470 = v516;
    sub_244B16810();
    v471 = sub_244B16828();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v471 - 8) + 56))(v470, 0, 1, v471);
    sub_244B16840();
    v472 = v537;
    v473 = v534;
    v474 = v538;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v537 + 16))(v534, v469, v538);
    v475 = (uint8_t *)sub_244B167A4();
    v477 = v476;
    (*(void (**)(_BYTE *, uint64_t))(v472 + 8))(v473, v474);
    v478 = v514;
    v479 = v595;
    v595(v514, v466, v47);
    v480 = v532;
    v479(v532, (uint64_t)v478, v47);
    v481 = v515;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v586 + 32))(v515, v478, v47);
    swift_bridgeObjectRetain();
    v482 = v589;
    v483 = sub_244B17110();
    v484 = sub_244B172C0();
    v485 = v484;
    if (os_log_type_enabled(v483, v484))
    {
      v486 = swift_slowAlloc();
      v602 = swift_slowAlloc();
      v608 = (uint8_t *)v602;
      *(_DWORD *)v486 = 136315395;
      v596 = (uint8_t *)(v486 + 4);
      LODWORD(v601) = v485;
      v487 = v582;
      sub_244B17008();
      sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v488 = v581;
      v489 = sub_244B17410();
      v599 = v475;
      v490 = v47;
      v492 = v491;
      ((void (*)(_BYTE *, uint64_t))v600)(v487, v488);
      *(_QWORD *)&v606 = sub_244B139EC(v489, v492, (uint64_t *)&v608);
      sub_244B1735C();
      swift_bridgeObjectRelease();
      v493 = v598;
      ((void (*)(_BYTE *, uint64_t))v598)(v481, v490);
      ((void (*)(_BYTE *, uint64_t))v493)(v532, v490);
      *(_WORD *)(v486 + 12) = 2081;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v606 = sub_244B139EC((uint64_t)v599, v477, (uint64_t *)&v608);
      sub_244B1735C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244AF5000, v483, (os_log_type_t)v601, "%s initialized request %{private}s", (uint8_t *)v486, 0x16u);
      v494 = v602;
      swift_arrayDestroy();
      MEMORY[0x24951F40C](v494, -1, -1);
      MEMORY[0x24951F40C](v486, -1, -1);
      sub_244AF7628(v545, v546);

      v495 = sub_244B17128();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v495 - 8) + 8))(v589, v495);
      sub_244AF8EA0(v548, &qword_2573DB318);
      sub_244AF8EA0(v549, &qword_2573DB320);
      v496 = sub_244B16C90();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v496 - 8) + 8))(v563, v496);
      v497 = sub_244B16E34();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v497 - 8) + 8))(v550, v497);
      return ((uint64_t (*)(uint64_t, uint64_t))v493)(v587, v490);
    }
    else
    {
      sub_244AF7628(v545, v546);
      swift_bridgeObjectRelease_n();

      v498 = v598;
      ((void (*)(_BYTE *, uint64_t))v598)(v481, v47);
      ((void (*)(_BYTE *, uint64_t))v498)(v480, v47);
      v499 = sub_244B17128();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v499 - 8) + 8))(v482, v499);
      sub_244AF8EA0(v548, &qword_2573DB318);
      sub_244AF8EA0(v549, &qword_2573DB320);
      v500 = sub_244B16C90();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v500 - 8) + 8))(v563, v500);
      v501 = sub_244B16E34();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v501 - 8) + 8))(v550, v501);
      return ((uint64_t (*)(uint64_t, uint64_t))v498)(v466, v47);
    }
  }
  return result;
}

uint64_t sub_244B1139C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  uint64_t v19;

  *(_QWORD *)(v8 + 192) = v19;
  *(_OWORD *)(v8 + 176) = v18;
  *(_QWORD *)(v8 + 160) = a7;
  *(_QWORD *)(v8 + 168) = a8;
  *(_QWORD *)(v8 + 144) = a5;
  *(_QWORD *)(v8 + 152) = a6;
  *(_QWORD *)(v8 + 128) = a3;
  *(_QWORD *)(v8 + 136) = a4;
  *(_QWORD *)(v8 + 112) = a1;
  *(_QWORD *)(v8 + 120) = a2;
  v9 = sub_244B170A4();
  *(_QWORD *)(v8 + 200) = v9;
  *(_QWORD *)(v8 + 208) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 216) = swift_task_alloc();
  *(_QWORD *)(v8 + 224) = swift_task_alloc();
  v10 = sub_244B1717C();
  *(_QWORD *)(v8 + 232) = v10;
  *(_QWORD *)(v8 + 240) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 248) = swift_task_alloc();
  v11 = sub_244B16918();
  *(_QWORD *)(v8 + 256) = v11;
  *(_QWORD *)(v8 + 264) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
  *(_QWORD *)(v8 + 280) = swift_task_alloc();
  *(_QWORD *)(v8 + 288) = _s18InstrumentedTokensV13AsyncIteratorVMa(0);
  *(_QWORD *)(v8 + 296) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB1A0);
  *(_QWORD *)(v8 + 304) = swift_task_alloc();
  v12 = sub_244B1693C();
  *(_QWORD *)(v8 + 312) = v12;
  *(_QWORD *)(v8 + 320) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v8 + 328) = swift_task_alloc();
  v13 = sub_244B173BC();
  *(_QWORD *)(v8 + 336) = v13;
  *(_QWORD *)(v8 + 344) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v8 + 352) = swift_task_alloc();
  *(_QWORD *)(v8 + 360) = swift_task_alloc();
  v14 = sub_244B17128();
  *(_QWORD *)(v8 + 368) = v14;
  *(_QWORD *)(v8 + 376) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v8 + 384) = swift_task_alloc();
  *(_QWORD *)(v8 + 392) = swift_task_alloc();
  *(_QWORD *)(v8 + 400) = swift_task_alloc();
  *(_QWORD *)(v8 + 408) = _s18InstrumentedTokensVMa(0);
  *(_QWORD *)(v8 + 416) = swift_task_alloc();
  v15 = sub_244B16720();
  *(_QWORD *)(v8 + 424) = v15;
  *(_QWORD *)(v8 + 432) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 440) = swift_task_alloc();
  *(_QWORD *)(v8 + 448) = swift_task_alloc();
  v16 = sub_244B17050();
  *(_QWORD *)(v8 + 456) = v16;
  *(_QWORD *)(v8 + 464) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B1160C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
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
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(void);
  _QWORD *v38;
  uint64_t v39;
  NSObject *v40;
  os_signpost_type_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  os_signpost_id_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
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
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  int v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t, uint64_t);
  __int128 *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  os_signpost_type_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (*v97)(_QWORD, _QWORD);
  uint64_t v98[2];

  v82 = (__int128 *)(v0 + 16);
  v71 = v0 + 56;
  v1 = *(_QWORD *)(v0 + 128) + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 464) + 16))(*(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 456));
  v94 = v1;
  v2 = sub_244B17110();
  v3 = sub_244B172D8();
  if (os_log_type_enabled(v2, v3))
  {
    v84 = *(_QWORD *)(v0 + 472);
    v87 = *(_QWORD *)(v0 + 464);
    v4 = *(_QWORD *)(v0 + 448);
    v91 = *(_QWORD *)(v0 + 456);
    v5 = *(_QWORD *)(v0 + 424);
    v80 = *(_QWORD *)(v0 + 432);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v98[0] = v7;
    *(_DWORD *)v6 = 136315138;
    sub_244B17008();
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v8 = sub_244B17410();
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v4, v5);
    *(_QWORD *)(v0 + 104) = sub_244B139EC(v8, v10, v98);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v84, v91);
    _os_log_impl(&dword_244AF5000, v2, v3, "%s waiting for private ML response tokens", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v7, -1, -1);
    MEMORY[0x24951F40C](v6, -1, -1);

  }
  else
  {
    v12 = *(_QWORD *)(v0 + 464);
    v11 = *(_QWORD *)(v0 + 472);
    v13 = *(_QWORD *)(v0 + 456);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v14 = *(_QWORD *)(v0 + 360);
  v15 = *(_QWORD *)(v0 + 336);
  v16 = *(_QWORD *)(v0 + 344);
  v17 = *(_QWORD *)(v0 + 320);
  v18 = *(_QWORD *)(v0 + 304);
  v85 = *(_QWORD *)(v0 + 328);
  v88 = *(_QWORD *)(v0 + 168);
  v20 = *(_QWORD *)(v0 + 120);
  v19 = *(_QWORD *)(v0 + 128);
  v78 = *(_QWORD *)(v0 + 312);
  v81 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 376) + 16);
  v81(*(_QWORD *)(v0 + 400), v94, *(_QWORD *)(v0 + 368));
  sub_244B168B8();
  v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v77(v14, v19 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_initializationInstant, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v85, v20, v78);
  sub_244AF7B54(v88, (uint64_t)v82);
  sub_244B16FFC();
  v21 = sub_244B16F30();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v18, 1, v21);
  v24 = *(_QWORD *)(v0 + 304);
  if (v23 == 1)
  {
    sub_244AF8EA0(*(_QWORD *)(v0 + 304), &qword_2573DB1A0);
    v79 = 0;
  }
  else
  {
    v79 = sub_244B16F18();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v21);
  }
  v74 = v23 == 1;
  v95 = *(_QWORD *)(v0 + 448);
  v25 = *(_QWORD *)(v0 + 432);
  v26 = *(_QWORD *)(v0 + 416);
  v27 = *(int **)(v0 + 408);
  v72 = *(_QWORD *)(v0 + 424);
  v73 = *(_QWORD *)(v0 + 392);
  v64 = *(_QWORD *)(v0 + 384);
  v66 = *(_QWORD *)(v0 + 376);
  v89 = *(_QWORD *)(v0 + 368);
  v55 = *(_QWORD *)(v0 + 360);
  v28 = *(_QWORD *)(v0 + 344);
  v92 = *(_QWORD *)(v0 + 352);
  v86 = *(_QWORD *)(v0 + 336);
  v61 = *(_QWORD *)(v0 + 328);
  v56 = *(_QWORD *)(v0 + 320);
  v58 = *(_QWORD *)(v0 + 312);
  v29 = *(_QWORD *)(v0 + 296);
  v63 = *(int **)(v0 + 288);
  v75 = *(_QWORD *)(v0 + 280);
  v76 = *(_QWORD *)(v0 + 272);
  v69 = *(_QWORD *)(v0 + 264);
  v70 = *(_QWORD *)(v0 + 256);
  v65 = *(_QWORD *)(v0 + 248);
  v67 = *(_QWORD *)(v0 + 240);
  v68 = *(_QWORD *)(v0 + 232);
  v30 = *(_QWORD *)(v0 + 152);
  v31 = *(_QWORD *)(v0 + 160);
  v60 = v31;
  (*(void (**)(uint64_t, _QWORD))(v66 + 32))(v26, *(_QWORD *)(v0 + 400));
  v57 = v26 + v27[5];
  (*(void (**)(void))(v25 + 32))();
  v32 = (_QWORD *)(v26 + v27[6]);
  *v32 = v30;
  v32[1] = v31;
  v33 = v26 + v27[8];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v33, v55, v86);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v26 + v27[7], v61, v58);
  v34 = v26 + v27[9];
  sub_244B13AE0(v82, v34);
  v35 = v26 + v27[10];
  *(_DWORD *)v35 = v79;
  *(_BYTE *)(v35 + 4) = v74;
  v81(v73, v26, v89);
  v59 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v59(v95, v57, v72);
  v77(v92, v33, v86);
  v36 = sub_244B17158();
  v37 = *(void (**)(void))(*(_QWORD *)(v36 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v37)(v75, 1, 1, v36);
  swift_bridgeObjectRetain_n();
  sub_244B16924();
  sub_244AF7B54(v34, v71);
  v83 = v29 + v63[9];
  v37();
  v62 = v63[13];
  *(_QWORD *)(v29 + v62) = 0;
  v81(v29, v73, v89);
  v59(v29 + v63[5], v95, v72);
  v38 = (_QWORD *)(v29 + v63[6]);
  *v38 = v30;
  v38[1] = v60;
  v77(v29 + v63[7], v92, v86);
  sub_244AF7B54(v71, v29 + v63[11]);
  v81(v64, v73, v89);
  swift_bridgeObjectRetain();
  LOBYTE(v98[0]) = v74;
  sub_244B17164();
  __swift_destroy_boxed_opaque_existential_1(v71);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v92, v86);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v95, v72);
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v73, v89);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 32))(v29 + v63[8], v65, v68);
  sub_244AF7ED0(v75, v83);
  *(_QWORD *)(v29 + v62) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 32))(v29 + v63[10], v76, v70);
  v39 = v29 + v63[12];
  *(_DWORD *)v39 = v79;
  *(_BYTE *)(v39 + 4) = v74;
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v40 = sub_244B170BC();
  v41 = sub_244B17338();
  v42 = sub_244B17344();
  v43 = *(_QWORD *)(v0 + 224);
  if ((v42 & 1) != 0)
  {
    v90 = *(_QWORD *)(v0 + 216);
    v96 = *(_QWORD *)(v0 + 208);
    v93 = v41;
    v44 = *(_QWORD *)(v0 + 200);
    v45 = *(_QWORD *)(v0 + 152);
    v46 = *(_QWORD *)(v0 + 160);
    (*(void (**)(void))(v96 + 16))();
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v98[0] = v48;
    *(_DWORD *)v47 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 96) = sub_244B139EC(v45, v46, v98);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v49 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v40, v93, v49, "executePrivateMLRequest", "waiting for tokens requestIdentifier=%{public, signpost.description=attribute,public}s)", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v48, -1, -1);
    MEMORY[0x24951F40C](v47, -1, -1);

    v50 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
    v50(v43, v44);
    v50(v90, v44);
  }
  else
  {
    v51 = *(_QWORD *)(v0 + 200);
    v52 = *(_QWORD *)(v0 + 208);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v43, v51);
  }
  v97 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0 + 184) + *(_QWORD *)(v0 + 184));
  v53 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 480) = v53;
  *v53 = v0;
  v53[1] = sub_244B11E80;
  return v97(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 296));
}

uint64_t sub_244B11E80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 488) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B11EE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  uint64_t v19;

  *(_QWORD *)(v8 + 192) = v19;
  *(_OWORD *)(v8 + 176) = v18;
  *(_QWORD *)(v8 + 160) = a7;
  *(_QWORD *)(v8 + 168) = a8;
  *(_QWORD *)(v8 + 144) = a5;
  *(_QWORD *)(v8 + 152) = a6;
  *(_QWORD *)(v8 + 128) = a3;
  *(_QWORD *)(v8 + 136) = a4;
  *(_QWORD *)(v8 + 112) = a1;
  *(_QWORD *)(v8 + 120) = a2;
  v9 = sub_244B170A4();
  *(_QWORD *)(v8 + 200) = v9;
  *(_QWORD *)(v8 + 208) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 216) = swift_task_alloc();
  *(_QWORD *)(v8 + 224) = swift_task_alloc();
  v10 = sub_244B1717C();
  *(_QWORD *)(v8 + 232) = v10;
  *(_QWORD *)(v8 + 240) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v8 + 248) = swift_task_alloc();
  v11 = sub_244B16918();
  *(_QWORD *)(v8 + 256) = v11;
  *(_QWORD *)(v8 + 264) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v8 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DAF40);
  *(_QWORD *)(v8 + 280) = swift_task_alloc();
  *(_QWORD *)(v8 + 288) = _s18InstrumentedTokensV13AsyncIteratorVMa(0);
  *(_QWORD *)(v8 + 296) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB1A0);
  *(_QWORD *)(v8 + 304) = swift_task_alloc();
  v12 = sub_244B1693C();
  *(_QWORD *)(v8 + 312) = v12;
  *(_QWORD *)(v8 + 320) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v8 + 328) = swift_task_alloc();
  v13 = sub_244B173BC();
  *(_QWORD *)(v8 + 336) = v13;
  *(_QWORD *)(v8 + 344) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v8 + 352) = swift_task_alloc();
  *(_QWORD *)(v8 + 360) = swift_task_alloc();
  v14 = sub_244B17128();
  *(_QWORD *)(v8 + 368) = v14;
  *(_QWORD *)(v8 + 376) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v8 + 384) = swift_task_alloc();
  *(_QWORD *)(v8 + 392) = swift_task_alloc();
  *(_QWORD *)(v8 + 400) = swift_task_alloc();
  *(_QWORD *)(v8 + 408) = _s18InstrumentedTokensVMa(0);
  *(_QWORD *)(v8 + 416) = swift_task_alloc();
  v15 = sub_244B16720();
  *(_QWORD *)(v8 + 424) = v15;
  *(_QWORD *)(v8 + 432) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v8 + 440) = swift_task_alloc();
  *(_QWORD *)(v8 + 448) = swift_task_alloc();
  v16 = sub_244B17050();
  *(_QWORD *)(v8 + 456) = v16;
  *(_QWORD *)(v8 + 464) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v8 + 472) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244B12154()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
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
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(void);
  _QWORD *v38;
  uint64_t v39;
  NSObject *v40;
  os_signpost_type_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  os_signpost_id_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
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
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  int v79;
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t, uint64_t);
  __int128 *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  os_signpost_type_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (*v97)(_QWORD, _QWORD);
  uint64_t v98[2];

  v82 = (__int128 *)(v0 + 16);
  v71 = v0 + 56;
  v1 = *(_QWORD *)(v0 + 128) + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 464) + 16))(*(_QWORD *)(v0 + 472), *(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 456));
  v94 = v1;
  v2 = sub_244B17110();
  v3 = sub_244B172D8();
  if (os_log_type_enabled(v2, v3))
  {
    v84 = *(_QWORD *)(v0 + 472);
    v87 = *(_QWORD *)(v0 + 464);
    v4 = *(_QWORD *)(v0 + 448);
    v91 = *(_QWORD *)(v0 + 456);
    v5 = *(_QWORD *)(v0 + 424);
    v80 = *(_QWORD *)(v0 + 432);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v98[0] = v7;
    *(_DWORD *)v6 = 136315138;
    sub_244B17008();
    sub_244AF7684(qword_2573DAF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v8 = sub_244B17410();
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v80 + 8))(v4, v5);
    *(_QWORD *)(v0 + 104) = sub_244B139EC(v8, v10, v98);
    sub_244B1735C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v84, v91);
    _os_log_impl(&dword_244AF5000, v2, v3, "%s waiting for private ML response tokens", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v7, -1, -1);
    MEMORY[0x24951F40C](v6, -1, -1);

  }
  else
  {
    v12 = *(_QWORD *)(v0 + 464);
    v11 = *(_QWORD *)(v0 + 472);
    v13 = *(_QWORD *)(v0 + 456);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v14 = *(_QWORD *)(v0 + 360);
  v15 = *(_QWORD *)(v0 + 336);
  v16 = *(_QWORD *)(v0 + 344);
  v17 = *(_QWORD *)(v0 + 320);
  v18 = *(_QWORD *)(v0 + 304);
  v85 = *(_QWORD *)(v0 + 328);
  v88 = *(_QWORD *)(v0 + 168);
  v20 = *(_QWORD *)(v0 + 120);
  v19 = *(_QWORD *)(v0 + 128);
  v78 = *(_QWORD *)(v0 + 312);
  v81 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 376) + 16);
  v81(*(_QWORD *)(v0 + 400), v94, *(_QWORD *)(v0 + 368));
  sub_244B168B8();
  v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v77(v14, v19 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_initializationInstant, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v85, v20, v78);
  sub_244AF7B54(v88, (uint64_t)v82);
  sub_244B16FFC();
  v21 = sub_244B16F30();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v18, 1, v21);
  v24 = *(_QWORD *)(v0 + 304);
  if (v23 == 1)
  {
    sub_244AF8EA0(*(_QWORD *)(v0 + 304), &qword_2573DB1A0);
    v79 = 0;
  }
  else
  {
    v79 = sub_244B16F18();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v24, v21);
  }
  v74 = v23 == 1;
  v95 = *(_QWORD *)(v0 + 448);
  v25 = *(_QWORD *)(v0 + 432);
  v26 = *(_QWORD *)(v0 + 416);
  v27 = *(int **)(v0 + 408);
  v72 = *(_QWORD *)(v0 + 424);
  v73 = *(_QWORD *)(v0 + 392);
  v64 = *(_QWORD *)(v0 + 384);
  v66 = *(_QWORD *)(v0 + 376);
  v89 = *(_QWORD *)(v0 + 368);
  v55 = *(_QWORD *)(v0 + 360);
  v28 = *(_QWORD *)(v0 + 344);
  v92 = *(_QWORD *)(v0 + 352);
  v86 = *(_QWORD *)(v0 + 336);
  v61 = *(_QWORD *)(v0 + 328);
  v56 = *(_QWORD *)(v0 + 320);
  v58 = *(_QWORD *)(v0 + 312);
  v29 = *(_QWORD *)(v0 + 296);
  v63 = *(int **)(v0 + 288);
  v75 = *(_QWORD *)(v0 + 280);
  v76 = *(_QWORD *)(v0 + 272);
  v69 = *(_QWORD *)(v0 + 264);
  v70 = *(_QWORD *)(v0 + 256);
  v65 = *(_QWORD *)(v0 + 248);
  v67 = *(_QWORD *)(v0 + 240);
  v68 = *(_QWORD *)(v0 + 232);
  v30 = *(_QWORD *)(v0 + 152);
  v31 = *(_QWORD *)(v0 + 160);
  v60 = v31;
  (*(void (**)(uint64_t, _QWORD))(v66 + 32))(v26, *(_QWORD *)(v0 + 400));
  v57 = v26 + v27[5];
  (*(void (**)(void))(v25 + 32))();
  v32 = (_QWORD *)(v26 + v27[6]);
  *v32 = v30;
  v32[1] = v31;
  v33 = v26 + v27[8];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 32))(v33, v55, v86);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 32))(v26 + v27[7], v61, v58);
  v34 = v26 + v27[9];
  sub_244B13AE0(v82, v34);
  v35 = v26 + v27[10];
  *(_DWORD *)v35 = v79;
  *(_BYTE *)(v35 + 4) = v74;
  v81(v73, v26, v89);
  v59 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
  v59(v95, v57, v72);
  v77(v92, v33, v86);
  v36 = sub_244B17158();
  v37 = *(void (**)(void))(*(_QWORD *)(v36 - 8) + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v37)(v75, 1, 1, v36);
  swift_bridgeObjectRetain_n();
  sub_244B16924();
  sub_244AF7B54(v34, v71);
  v83 = v29 + v63[9];
  v37();
  v62 = v63[13];
  *(_QWORD *)(v29 + v62) = 0;
  v81(v29, v73, v89);
  v59(v29 + v63[5], v95, v72);
  v38 = (_QWORD *)(v29 + v63[6]);
  *v38 = v30;
  v38[1] = v60;
  v77(v29 + v63[7], v92, v86);
  sub_244AF7B54(v71, v29 + v63[11]);
  v81(v64, v73, v89);
  swift_bridgeObjectRetain();
  LOBYTE(v98[0]) = v74;
  sub_244B17164();
  __swift_destroy_boxed_opaque_existential_1(v71);
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v92, v86);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v95, v72);
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v73, v89);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v67 + 32))(v29 + v63[8], v65, v68);
  sub_244AF7ED0(v75, v83);
  *(_QWORD *)(v29 + v62) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v69 + 32))(v29 + v63[10], v76, v70);
  v39 = v29 + v63[12];
  *(_DWORD *)v39 = v79;
  *(_BYTE *)(v39 + 4) = v74;
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v40 = sub_244B170BC();
  v41 = sub_244B17338();
  v42 = sub_244B17344();
  v43 = *(_QWORD *)(v0 + 224);
  if ((v42 & 1) != 0)
  {
    v90 = *(_QWORD *)(v0 + 216);
    v96 = *(_QWORD *)(v0 + 208);
    v93 = v41;
    v44 = *(_QWORD *)(v0 + 200);
    v45 = *(_QWORD *)(v0 + 152);
    v46 = *(_QWORD *)(v0 + 160);
    (*(void (**)(void))(v96 + 16))();
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v98[0] = v48;
    *(_DWORD *)v47 = 136446210;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 96) = sub_244B139EC(v45, v46, v98);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v49 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v40, v93, v49, "executePrivateMLRequest", "waiting for tokens requestIdentifier=%{public, signpost.description=attribute,public}s)", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v48, -1, -1);
    MEMORY[0x24951F40C](v47, -1, -1);

    v50 = *(void (**)(uint64_t, uint64_t))(v96 + 8);
    v50(v43, v44);
    v50(v90, v44);
  }
  else
  {
    v51 = *(_QWORD *)(v0 + 200);
    v52 = *(_QWORD *)(v0 + 208);
    swift_bridgeObjectRelease_n();

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v43, v51);
  }
  v97 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0 + 184) + *(_QWORD *)(v0 + 184));
  v53 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 480) = v53;
  *v53 = v0;
  v53[1] = sub_244B129C8;
  return v97(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 296));
}

uint64_t sub_244B129C8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 488) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_244B12A2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 416);
  v2 = *(_QWORD *)(v0 + 296);
  sub_244B12CC4(*(_QWORD *)(v0 + 176), v2, *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160));
  sub_244B14E28(v2, _s18InstrumentedTokensV13AsyncIteratorVMa);
  sub_244B14E28(v1, _s18InstrumentedTokensVMa);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B12B78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 416);
  v2 = *(_QWORD *)(v0 + 296);
  sub_244B12CC4(*(_QWORD *)(v0 + 176), v2, *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160));
  sub_244B14E28(v2, _s18InstrumentedTokensV13AsyncIteratorVMa);
  sub_244B14E28(v1, _s18InstrumentedTokensVMa);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244B12CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  os_signpost_id_t v19;
  void (*v20)(_BYTE *, uint64_t);
  _BYTE v22[4];
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v7 = sub_244B170A4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9);
  v13 = &v22[-v12];
  _s18InstrumentedTokensV13AsyncIteratorVMa(0);
  sub_244B171A0();
  sub_244B170BC();
  sub_244B17080();
  swift_bridgeObjectRetain_n();
  v14 = sub_244B170BC();
  v15 = sub_244B17338();
  if ((sub_244B17344() & 1) != 0)
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v11, v13, v7);
    v24 = v8;
    v16 = swift_slowAlloc();
    v23 = v15;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v26 = v18;
    *(_DWORD *)v17 = 136446210;
    swift_bridgeObjectRetain();
    v25 = sub_244B139EC(a4, a5, &v26);
    sub_244B1735C();
    swift_bridgeObjectRelease_n();
    v19 = sub_244B1708C();
    _os_signpost_emit_with_name_impl(&dword_244AF5000, v14, (os_signpost_type_t)v23, v19, "executePrivateMLRequest", "request complete requestIdentifier=%{public, signpost.description=attribute,public}s)", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24951F40C](v18, -1, -1);
    MEMORY[0x24951F40C](v17, -1, -1);

    v20 = *(void (**)(_BYTE *, uint64_t))(v24 + 8);
    v20(v13, v7);
    return ((uint64_t (*)(_BYTE *, uint64_t))v20)(v11, v7);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v13, v7);
  }
}

uint64_t NewInferenceProvider.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  v2 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_initializationInstant;
  v4 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  v6 = sub_244B170C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return v0;
}

uint64_t NewInferenceProvider.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  v2 = sub_244B17128();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_initializationInstant;
  v4 = sub_244B173BC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster;
  v6 = sub_244B170C8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocClassInstance();
}

uint64_t sub_244B13050@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v12;

  v2 = sub_244B17128();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = swift_allocObject();
  v7 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  if (qword_2573DAEF0 != -1)
    swift_once();
  v8 = v6 + v7;
  v9 = __swift_project_value_buffer(v2, (uint64_t)qword_2573DBA20);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  sub_244B17398();
  v10((uint64_t)v5, v8, v2);
  result = sub_244B170B0();
  *a1 = v6;
  return result;
}

uint64_t sub_244B13160(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_244B15EA8;
  v7[4] = a2;
  v7[5] = v6;
  v7[3] = a1;
  return swift_task_switch();
}

uint64_t sub_244B131D4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *v2;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_244B15EA8;
  v7[4] = a2;
  v7[5] = v6;
  v7[3] = a1;
  return swift_task_switch();
}

void sub_244B13248()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_244B15EA8;
  JUMPOUT(0x24951EC98);
}

uint64_t sub_244B132C8@<X0>(uint8_t *a1@<X0>, uint8_t *a2@<X1>, uint8_t *a3@<X2>, uint64_t *a4@<X8>)
{
  return NewInferenceProvider.requestStream(clientData:configuration:)(a1, a2, a3, a4);
}

uint64_t sub_244B132EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_244B13354;
  return NewInferenceProvider.requestOneShot(clientData:configuration:)(a1, a2, a3);
}

uint64_t sub_244B13354(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_244B133B8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_244B15EA8;
  return sub_244B16F9C();
}

void sub_244B1343C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_244AF7894;
  JUMPOUT(0x24951EC74);
}

uint64_t sub_244B134A4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_244B15EA8;
  return NewInferenceProvider.prewarmHint(_:)(a1);
}

void sub_244B134F4()
{
  qword_2573DB110 = (uint64_t)&unk_2515B11E0;
}

double sub_244B13508()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3A0);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 6;
  *(_OWORD *)(v0 + 16) = xmmword_244B17A90;
  *(_QWORD *)(v0 + 32) = 0x7463736F746F6870;
  *(_QWORD *)(v0 + 40) = 0xE90000000000006CLL;
  *(_QWORD *)(v0 + 48) = 0xD000000000000010;
  *(_QWORD *)(v0 + 56) = 0x8000000244B181C0;
  *(_QWORD *)(v0 + 64) = 0x6C6974756374;
  *(_QWORD *)(v0 + 72) = 0xE600000000000000;
  *(_QWORD *)(v0 + 80) = 0x6C6F6F7465676173;
  *(_QWORD *)(v0 + 88) = 0xE800000000000000;
  *(_QWORD *)(v0 + 96) = 0x6C6F6F746774;
  *(_QWORD *)(v0 + 104) = 0xE600000000000000;
  *(_QWORD *)(v0 + 112) = 0x6568636C6C657073;
  *(_QWORD *)(v0 + 120) = 0xEA00000000006B63;
  qword_2573DB118 = v0;
  return result;
}

uint64_t sub_244B135D4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_244B1741C();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_244B1741C() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_244B13698(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_244B136CC(void (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v2 = sub_244B16720();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v4 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  a1(v5);
  sub_244AF7684(qword_2573DAF70, v3, MEMORY[0x24BDCEAB8]);
  v8 = sub_244B17410();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v2);
  return v8;
}

uint64_t sub_244B13790(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_244B137F4;
  return v6(a1);
}

uint64_t sub_244B137F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_244B13840(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3A0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_244B14E68(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_244B1394C(uint64_t (*a1)(void))
{
  return a1();
}

_BYTE **sub_244B1396C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_244B1397C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_244B139EC(v6, v7, a3);
  v8 = *a1 + 8;
  sub_244B1735C();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_244B139EC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_244B13E80(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244B157A4((uint64_t)v12, *a3);
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
      sub_244B157A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_244B13AE0(__int128 *a1, uint64_t a2)
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

uint64_t sub_244B13AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v10;

  v5 = *(_QWORD *)(v2 + 16);
  v10 = *(_OWORD *)(v2 + 40);
  v6 = *(_QWORD *)(v2 + 56);
  v7 = swift_task_alloc();
  v8 = *(_OWORD *)(v2 + 24);
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = sub_244B15EA8;
  *(_QWORD *)(v7 + 64) = v6;
  *(_OWORD *)(v7 + 32) = v8;
  *(_OWORD *)(v7 + 48) = v10;
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = v5;
  return swift_task_switch();
}

uint64_t sub_244B13B88(uint64_t a1)
{
  uint64_t v1;

  return sub_244B01C2C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

unint64_t sub_244B13B98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573DB1B0;
  if (!qword_2573DB1B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573DB1A8);
    result = MEMORY[0x24951F394](MEMORY[0x24BEE6D38], v1);
    atomic_store(result, (unint64_t *)&qword_2573DB1B0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24951F388](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
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

uint64_t sub_244B13C64(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_244B15EA8;
  return sub_244B069C4(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_244B13CF4()
{
  return type metadata accessor for NewInferenceProvider(0);
}

uint64_t type metadata accessor for NewInferenceProvider(uint64_t a1)
{
  return sub_244AF7E7C(a1, qword_2573DB238);
}

uint64_t sub_244B13D10()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_244B17128();
  if (v1 <= 0x3F)
  {
    result = sub_244B173BC();
    if (v2 <= 0x3F)
    {
      result = sub_244B170C8();
      if (v3 <= 0x3F)
      {
        result = swift_updateClassMetadata2();
        if (!result)
          return 0;
      }
    }
  }
  return result;
}

uint64_t method lookup function for NewInferenceProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NewInferenceProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_244B13DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v7 = v3[2];
  v8 = v3[3];
  v9 = v3[4];
  v10 = v3[5];
  v11 = v3[6];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v12;
  *v12 = v4;
  v12[1] = sub_244AF7894;
  return sub_244B0B1B0(a1, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t sub_244B13E80(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_244B17368();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_244B14038(a5, a6);
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
  v8 = sub_244B1738C();
  if (!v8)
  {
    sub_244B173D4();
    __break(1u);
LABEL_17:
    result = sub_244B17404();
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

uint64_t sub_244B14038(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_244B140CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_244B142A4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_244B142A4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_244B140CC(uint64_t a1, unint64_t a2)
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
      v3 = sub_244B14240(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_244B17380();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_244B173D4();
      __break(1u);
LABEL_10:
      v2 = sub_244B17224();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_244B17404();
    __break(1u);
LABEL_14:
    result = sub_244B173D4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_244B14240(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2573DB480);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_244B142A4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_2573DB480);
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
  result = sub_244B17404();
  __break(1u);
  return result;
}

unint64_t sub_244B143F0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_244B1741C() & 1) == 0)
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
      while (!v14 && (sub_244B1741C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_244B144D0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244B14508(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244B144EC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244B146A0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244B14508(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;
  _QWORD *v13;
  size_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB350);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 4;
  v13 = a4 + 4;
  v14 = 3 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v10 + 4, a4 + 4, v14 * 8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB358);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244B17404();
  __break(1u);
  return result;
}

uint64_t sub_244B146A0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E0);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_244B17404();
  __break(1u);
  return result;
}

void *sub_244B147FC()
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
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB398);
  v2 = *v0;
  v3 = sub_244B173E0();
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + v20) = (_DWORD)v17;
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

uint64_t sub_244B149A8(uint64_t a1, char a2)
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
  int v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB398);
  v37 = a2;
  v6 = sub_244B173EC();
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
    v32 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_244B17464();
    sub_244B1720C();
    result = sub_244B17470();
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
    *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v17) = v32;
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

uint64_t sub_244B14CB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v5;

  sub_244B17464();
  sub_244B1720C();
  v5 = sub_244B17470();
  return a3(a1, a2, v5);
}

uint64_t type metadata accessor for PrivateMLClientInferenceProviderError(uint64_t a1)
{
  return sub_244AF7E7C(a1, (uint64_t *)&unk_2573DB4F8);
}

uint64_t sub_244B14D30(uint64_t a1, unint64_t a2)
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

uint64_t sub_244B14D74(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = v2[7];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_244B15EA8;
  return sub_244B11EE4(a1, a2, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_244B14E28(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_244B14E68(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244B17404();
  __break(1u);
  return result;
}

uint64_t sub_244B14F58(uint64_t result, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _DWORD *i;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;

  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v6 = result;
    v8 = *(_QWORD *)(result + 32);
    v7 = *(_QWORD *)(result + 40);
    v43 = *(_DWORD *)(result + 48);
    v9 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = sub_244B14CB0(v8, v7, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0);
    v12 = v9[2];
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v15 = v10;
    if (v9[3] < v14)
    {
      sub_244B149A8(v14, a2 & 1);
      v16 = sub_244B14CB0(v8, v7, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0);
      if ((v15 & 1) != (v17 & 1))
      {
LABEL_27:
        result = sub_244B17428();
        __break(1u);
        return result;
      }
      v11 = v16;
      v18 = (_QWORD *)*a3;
      if ((v15 & 1) == 0)
        goto LABEL_12;
LABEL_9:
      v19 = *(_DWORD *)(v18[7] + 4 * v11);
      swift_bridgeObjectRelease();
      *(_DWORD *)(v18[7] + 4 * v11) = v19;
      v20 = v3 - 1;
      if (!v20)
        return swift_bridgeObjectRelease();
LABEL_16:
      for (i = (_DWORD *)(v6 + 72); ; i += 6)
      {
        v29 = *((_QWORD *)i - 2);
        v28 = *((_QWORD *)i - 1);
        v30 = *i;
        v31 = (_QWORD *)*a3;
        swift_bridgeObjectRetain();
        v32 = sub_244B14CB0(v29, v28, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0);
        v34 = v31[2];
        v35 = (v33 & 1) == 0;
        v23 = __OFADD__(v34, v35);
        v36 = v34 + v35;
        if (v23)
          break;
        v37 = v33;
        if (v31[3] < v36)
        {
          sub_244B149A8(v36, 1);
          v32 = sub_244B14CB0(v29, v28, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_244B143F0);
          if ((v37 & 1) != (v38 & 1))
            goto LABEL_27;
        }
        v39 = (_QWORD *)*a3;
        if ((v37 & 1) != 0)
        {
          v26 = 4 * v32;
          v27 = *(_DWORD *)(v39[7] + 4 * v32);
          swift_bridgeObjectRelease();
          *(_DWORD *)(v39[7] + v26) = v27;
        }
        else
        {
          v39[(v32 >> 6) + 8] |= 1 << v32;
          v40 = (uint64_t *)(v39[6] + 16 * v32);
          *v40 = v29;
          v40[1] = v28;
          *(_DWORD *)(v39[7] + 4 * v32) = v30;
          v41 = v39[2];
          v23 = __OFADD__(v41, 1);
          v42 = v41 + 1;
          if (v23)
            goto LABEL_26;
          v39[2] = v42;
        }
        if (!--v20)
          return swift_bridgeObjectRelease();
      }
      goto LABEL_25;
    }
    if ((a2 & 1) != 0)
    {
      v18 = (_QWORD *)*a3;
      if ((v10 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_244B147FC();
      v18 = (_QWORD *)*a3;
      if ((v15 & 1) != 0)
        goto LABEL_9;
    }
LABEL_12:
    v18[(v11 >> 6) + 8] |= 1 << v11;
    v21 = (uint64_t *)(v18[6] + 16 * v11);
    *v21 = v8;
    v21[1] = v7;
    *(_DWORD *)(v18[7] + 4 * v11) = v43;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v18[2] = v24;
    v20 = v3 - 1;
    if (!v20)
      return swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  return result;
}

uint64_t sub_244B1520C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_244B15250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_244B17050();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  sub_244AF7628(*(_QWORD *)(v0 + v8), *(_QWORD *)(v0 + v8 + 8));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244B15354(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2573DB3E8) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v3 + 64);
  v6 = *(_QWORD *)(sub_244B17050() - 8);
  v7 = (v4 + v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = v1[2];
  v9 = v1[3];
  v10 = v1[4];
  v11 = v1[5];
  v12 = (uint64_t)v1 + v7;
  v13 = *(_QWORD *)((char *)v1 + ((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_244AF7894;
  return sub_244B01E6C(a1, v8, v9, v10, v11, (uint64_t)v1 + v4, v12, v13);
}

uint64_t sub_244B15454()
{
  return sub_244B17254();
}

uint64_t sub_244B15478()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244B1549C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_244B15EA8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2573DB408 + dword_2573DB408))(a1, v4);
}

uint64_t sub_244B1550C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  v8 = v2[5];
  v9 = v2[6];
  v10 = v2[7];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_244B15EA8;
  return sub_244B03448(a1, a2, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_244B155B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v7 = v3[2];
  v8 = v3[3];
  v9 = v3[4];
  v10 = v3[5];
  v11 = v3[6];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v12;
  *v12 = v4;
  v12[1] = sub_244B15EA8;
  return sub_244B09734(a1, a2, a3, v7, v8, v9, v10, v11);
}

uint64_t sub_244B15668(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = v2[7];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v12;
  *v12 = v3;
  v12[1] = sub_244B15EA8;
  return sub_244B1139C(a1, a2, v6, v7, v8, v9, v10, v11);
}

unint64_t sub_244B1571C()
{
  unint64_t result;

  result = qword_2573DB470;
  if (!qword_2573DB470)
  {
    result = MEMORY[0x24951F394](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2573DB470);
  }
  return result;
}

unint64_t sub_244B15760()
{
  unint64_t result;

  result = qword_2573DB478;
  if (!qword_2573DB478)
  {
    result = MEMORY[0x24951F394](MEMORY[0x24BEE5E60], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2573DB478);
  }
  return result;
}

uint64_t sub_244B157A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t *sub_244B15820(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 4, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_244B16E88();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 4, v7);
    }
  }
  return a1;
}

uint64_t sub_244B158F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 4, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_244B16E88();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *sub_244B15960(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_244B16E88();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_244B15A14(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 4, v6);
  v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_244B16E88();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_244AF8EA0((uint64_t)a1, &qword_2573DB338);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_244B16E88();
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

void *sub_244B15B20(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 4, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_244B16E88();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  }
  return a1;
}

void *sub_244B15BD4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 4, v6);
  v10 = v8(a2, 4, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_244B16E88();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_244AF8EA0((uint64_t)a1, &qword_2573DB338);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_244B16E88();
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 4, v6);
  return a1;
}

uint64_t sub_244B15CE0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B15CEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 5)
    return v5 - 4;
  else
    return 0;
}

uint64_t sub_244B15D3C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244B15D48(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 4);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_244B15DA0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 4, v2);
}

uint64_t sub_244B15DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573DB338);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 4, v4);
}

uint64_t sub_244B15E20()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244B16E88();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t sub_244B15E74()
{
  return sub_244AF7684(&qword_2573DB330, type metadata accessor for PrivateMLClientInferenceProviderError, (uint64_t)&unk_244B17BE8);
}

uint64_t sub_244B15EC4()
{
  uint64_t v0;

  v0 = sub_244B17128();
  __swift_allocate_value_buffer(v0, qword_2573DB518);
  __swift_project_value_buffer(v0, (uint64_t)qword_2573DB518);
  swift_bridgeObjectRetain();
  return sub_244B1711C();
}

uint64_t static Logger.viewCycle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2573DAF08 != -1)
    swift_once();
  v2 = sub_244B17128();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2573DB518);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t InferenceProvider.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  InferenceProvider.init()();
  return v0;
}

_QWORD *InferenceProvider.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;

  v1 = v0;
  v2 = sub_244B17128();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244B170C8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2573DAF08 != -1)
    swift_once();
  __swift_project_value_buffer(v2, (uint64_t)qword_2573DB518);
  v10 = sub_244B17110();
  v11 = sub_244B172B4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_244AF5000, v10, v11, "Using NewInferenceProvider", v12, 2u);
    MEMORY[0x24951F40C](v12, -1, -1);
  }

  v13 = type metadata accessor for NewInferenceProvider(0);
  v14 = swift_allocObject();
  v15 = OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_logger;
  if (qword_2573DAEF0 != -1)
    swift_once();
  v16 = v14 + v15;
  v17 = __swift_project_value_buffer(v2, (uint64_t)qword_2573DBA20);
  v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v18(v16, v17, v2);
  sub_244B17398();
  v18((uint64_t)v5, v16, v2);
  sub_244B170B0();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v14 + OBJC_IVAR____TtC32PrivateMLClientInferenceProvider20NewInferenceProvider_signPoster, v9, v6);
  v1[5] = v13;
  v1[6] = sub_244B16218();
  v1[2] = v14;
  return v1;
}

unint64_t sub_244B16218()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573DB530;
  if (!qword_2573DB530)
  {
    v1 = type metadata accessor for NewInferenceProvider(255);
    result = MEMORY[0x24951F394](&protocol conformance descriptor for NewInferenceProvider, v1);
    atomic_store(result, (unint64_t *)&qword_2573DB530);
  }
  return result;
}

uint64_t InferenceProvider.loadIn(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_244B1627C()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 32) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 32) + 40));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_244B162F4;
  return sub_244B16F6C();
}

uint64_t sub_244B162F4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t InferenceProvider.loadOut(inferenceAssetIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_244B16358()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 32) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 32) + 40));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_244B166BC;
  return sub_244B16F78();
}

uint64_t InferenceProvider.requestStream(clientData:configuration:)()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  return sub_244B16F54();
}

uint64_t InferenceProvider.requestOneShot(clientData:configuration:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_244B1645C()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 40) + 16), *(_QWORD *)(*(_QWORD *)(v0 + 40) + 40));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_244B164D8;
  return sub_244B16F60();
}

uint64_t sub_244B164D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t InferenceProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t InferenceProvider.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

_QWORD *sub_244B1657C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  v2 = swift_allocObject();
  result = InferenceProvider.init()();
  *a1 = v2;
  return result;
}

uint64_t sub_244B165B4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return swift_task_switch();
}

uint64_t sub_244B165D4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = *v2;
  return swift_task_switch();
}

uint64_t sub_244B165F4()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 16), *(_QWORD *)(*(_QWORD *)v0 + 40));
  return sub_244B16F54();
}

uint64_t sub_244B16668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a1;
  v4[3] = a2;
  v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t type metadata accessor for InferenceProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for InferenceProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InferenceProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_244B166C0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_244B166CC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_244B166D8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_244B166E4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_244B166F0()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_244B166FC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_244B16708()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_244B16714()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_244B16720()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_244B1672C()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_244B16738()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_244B16744()
{
  return MEMORY[0x24BE681B0]();
}

uint64_t sub_244B16750()
{
  return MEMORY[0x24BE68280]();
}

uint64_t sub_244B1675C()
{
  return MEMORY[0x24BE682B0]();
}

uint64_t sub_244B16768()
{
  return MEMORY[0x24BE682B8]();
}

uint64_t sub_244B16774()
{
  return MEMORY[0x24BE68320]();
}

uint64_t sub_244B16780()
{
  return MEMORY[0x24BE68420]();
}

uint64_t sub_244B1678C()
{
  return MEMORY[0x24BE78B98]();
}

uint64_t sub_244B16798()
{
  return MEMORY[0x24BE78BA0]();
}

uint64_t sub_244B167A4()
{
  return MEMORY[0x24BE78BA8]();
}

uint64_t sub_244B167B0()
{
  return MEMORY[0x24BE78BB0]();
}

uint64_t sub_244B167BC()
{
  return MEMORY[0x24BE78BB8]();
}

uint64_t sub_244B167C8()
{
  return MEMORY[0x24BE78BC0]();
}

uint64_t sub_244B167D4()
{
  return MEMORY[0x24BE78BC8]();
}

uint64_t sub_244B167E0()
{
  return MEMORY[0x24BE78BD0]();
}

uint64_t sub_244B167EC()
{
  return MEMORY[0x24BE78BD8]();
}

uint64_t sub_244B167F8()
{
  return MEMORY[0x24BE78BE0]();
}

uint64_t sub_244B16804()
{
  return MEMORY[0x24BE78BE8]();
}

uint64_t sub_244B16810()
{
  return MEMORY[0x24BE78BF0]();
}

uint64_t sub_244B1681C()
{
  return MEMORY[0x24BE78BF8]();
}

uint64_t sub_244B16828()
{
  return MEMORY[0x24BE78C00]();
}

uint64_t sub_244B16834()
{
  return MEMORY[0x24BE78C10]();
}

uint64_t sub_244B16840()
{
  return MEMORY[0x24BE78C18]();
}

uint64_t sub_244B1684C()
{
  return MEMORY[0x24BE78C38]();
}

uint64_t sub_244B16858()
{
  return MEMORY[0x24BE78C40]();
}

uint64_t sub_244B16864()
{
  return MEMORY[0x24BE78C48]();
}

uint64_t sub_244B16870()
{
  return MEMORY[0x24BE78C50]();
}

uint64_t sub_244B1687C()
{
  return MEMORY[0x24BE78C58]();
}

uint64_t sub_244B16888()
{
  return MEMORY[0x24BE78C60]();
}

uint64_t sub_244B16894()
{
  return MEMORY[0x24BE78C68]();
}

uint64_t sub_244B168A0()
{
  return MEMORY[0x24BE78C70]();
}

uint64_t sub_244B168AC()
{
  return MEMORY[0x24BE78C78]();
}

uint64_t sub_244B168B8()
{
  return MEMORY[0x24BE78C80]();
}

uint64_t sub_244B168C4()
{
  return MEMORY[0x24BE78C88]();
}

uint64_t sub_244B168D0()
{
  return MEMORY[0x24BE78C90]();
}

uint64_t sub_244B168DC()
{
  return MEMORY[0x24BE78C98]();
}

uint64_t sub_244B168E8()
{
  return MEMORY[0x24BE78CA0]();
}

uint64_t sub_244B168F4()
{
  return MEMORY[0x24BE78CA8]();
}

uint64_t sub_244B16900()
{
  return MEMORY[0x24BE78CB0]();
}

uint64_t sub_244B1690C()
{
  return MEMORY[0x24BE78CB8]();
}

uint64_t sub_244B16918()
{
  return MEMORY[0x24BE78CC8]();
}

uint64_t sub_244B16924()
{
  return MEMORY[0x24BE78CD8]();
}

uint64_t sub_244B16930()
{
  return MEMORY[0x24BE78CF0]();
}

uint64_t sub_244B1693C()
{
  return MEMORY[0x24BE78D00]();
}

uint64_t sub_244B16948()
{
  return MEMORY[0x24BE78D10]();
}

uint64_t sub_244B16954()
{
  return MEMORY[0x24BE78D18]();
}

uint64_t sub_244B16960()
{
  return MEMORY[0x24BE78D20]();
}

uint64_t sub_244B1696C()
{
  return MEMORY[0x24BE78D28]();
}

uint64_t sub_244B16978()
{
  return MEMORY[0x24BE78D40]();
}

uint64_t sub_244B16984()
{
  return MEMORY[0x24BE78D60]();
}

uint64_t sub_244B16990()
{
  return MEMORY[0x24BE78D78]();
}

uint64_t sub_244B1699C()
{
  return MEMORY[0x24BE78D88]();
}

uint64_t sub_244B169A8()
{
  return MEMORY[0x24BE78D98]();
}

uint64_t sub_244B169B4()
{
  return MEMORY[0x24BE78DA0]();
}

uint64_t sub_244B169C0()
{
  return MEMORY[0x24BE78DA8]();
}

uint64_t sub_244B169CC()
{
  return MEMORY[0x24BE78DB0]();
}

uint64_t sub_244B169D8()
{
  return MEMORY[0x24BE78DB8]();
}

uint64_t sub_244B169E4()
{
  return MEMORY[0x24BE78DC0]();
}

uint64_t sub_244B169F0()
{
  return MEMORY[0x24BE78DC8]();
}

uint64_t sub_244B169FC()
{
  return MEMORY[0x24BE78DD0]();
}

uint64_t sub_244B16A08()
{
  return MEMORY[0x24BE78DE0]();
}

uint64_t sub_244B16A14()
{
  return MEMORY[0x24BE78DE8]();
}

uint64_t sub_244B16A20()
{
  return MEMORY[0x24BE78DF0]();
}

uint64_t sub_244B16A2C()
{
  return MEMORY[0x24BE78E00]();
}

uint64_t sub_244B16A38()
{
  return MEMORY[0x24BE78E08]();
}

uint64_t sub_244B16A44()
{
  return MEMORY[0x24BE78E10]();
}

uint64_t sub_244B16A50()
{
  return MEMORY[0x24BE78E18]();
}

uint64_t sub_244B16A5C()
{
  return MEMORY[0x24BE78E30]();
}

uint64_t sub_244B16A68()
{
  return MEMORY[0x24BE78E38]();
}

uint64_t sub_244B16A74()
{
  return MEMORY[0x24BE78E40]();
}

uint64_t sub_244B16A80()
{
  return MEMORY[0x24BE78E48]();
}

uint64_t sub_244B16A8C()
{
  return MEMORY[0x24BE78E58]();
}

uint64_t sub_244B16A98()
{
  return MEMORY[0x24BE78E60]();
}

uint64_t sub_244B16AA4()
{
  return MEMORY[0x24BE78E68]();
}

uint64_t sub_244B16AB0()
{
  return MEMORY[0x24BE78E78]();
}

uint64_t sub_244B16ABC()
{
  return MEMORY[0x24BE78E88]();
}

uint64_t sub_244B16AC8()
{
  return MEMORY[0x24BE78E90]();
}

uint64_t sub_244B16AD4()
{
  return MEMORY[0x24BE78E98]();
}

uint64_t sub_244B16AE0()
{
  return MEMORY[0x24BE78EA8]();
}

uint64_t sub_244B16AEC()
{
  return MEMORY[0x24BE78EB8]();
}

uint64_t sub_244B16AF8()
{
  return MEMORY[0x24BE78EC0]();
}

uint64_t sub_244B16B04()
{
  return MEMORY[0x24BE78EC8]();
}

uint64_t sub_244B16B10()
{
  return MEMORY[0x24BE78ED0]();
}

uint64_t sub_244B16B1C()
{
  return MEMORY[0x24BE78ED8]();
}

uint64_t sub_244B16B28()
{
  return MEMORY[0x24BE78EE8]();
}

uint64_t sub_244B16B34()
{
  return MEMORY[0x24BEB7F40]();
}

uint64_t sub_244B16B40()
{
  return MEMORY[0x24BEB7F50]();
}

uint64_t sub_244B16B4C()
{
  return MEMORY[0x24BEB80D8]();
}

uint64_t sub_244B16B58()
{
  return MEMORY[0x24BEB8130]();
}

uint64_t sub_244B16B64()
{
  return MEMORY[0x24BEB8140]();
}

uint64_t sub_244B16B70()
{
  return MEMORY[0x24BEB8148]();
}

uint64_t sub_244B16B7C()
{
  return MEMORY[0x24BEB8168]();
}

uint64_t sub_244B16B88()
{
  return MEMORY[0x24BEB8180]();
}

uint64_t sub_244B16B94()
{
  return MEMORY[0x24BEB81B8]();
}

uint64_t sub_244B16BA0()
{
  return MEMORY[0x24BEB8208]();
}

uint64_t sub_244B16BAC()
{
  return MEMORY[0x24BEB8220]();
}

uint64_t sub_244B16BB8()
{
  return MEMORY[0x24BEB8238]();
}

uint64_t sub_244B16BC4()
{
  return MEMORY[0x24BEB8250]();
}

uint64_t sub_244B16BD0()
{
  return MEMORY[0x24BEB8258]();
}

uint64_t sub_244B16BDC()
{
  return MEMORY[0x24BEB8270]();
}

uint64_t sub_244B16BE8()
{
  return MEMORY[0x24BEB8288]();
}

uint64_t sub_244B16BF4()
{
  return MEMORY[0x24BEB8298]();
}

uint64_t sub_244B16C00()
{
  return MEMORY[0x24BEB82D0]();
}

uint64_t sub_244B16C0C()
{
  return MEMORY[0x24BEB82E8]();
}

uint64_t sub_244B16C18()
{
  return MEMORY[0x24BEB82F0]();
}

uint64_t sub_244B16C24()
{
  return MEMORY[0x24BEB8318]();
}

uint64_t sub_244B16C30()
{
  return MEMORY[0x24BEB8320]();
}

uint64_t sub_244B16C3C()
{
  return MEMORY[0x24BEB8338]();
}

uint64_t sub_244B16C48()
{
  return MEMORY[0x24BEB8340]();
}

uint64_t sub_244B16C54()
{
  return MEMORY[0x24BEB8350]();
}

uint64_t sub_244B16C60()
{
  return MEMORY[0x24BEB8358]();
}

uint64_t sub_244B16C6C()
{
  return MEMORY[0x24BEB8360]();
}

uint64_t sub_244B16C78()
{
  return MEMORY[0x24BEB8370]();
}

uint64_t sub_244B16C84()
{
  return MEMORY[0x24BEB8380]();
}

uint64_t sub_244B16C90()
{
  return MEMORY[0x24BEB8388]();
}

uint64_t sub_244B16C9C()
{
  return MEMORY[0x24BEB8438]();
}

uint64_t sub_244B16CA8()
{
  return MEMORY[0x24BEB8440]();
}

uint64_t sub_244B16CB4()
{
  return MEMORY[0x24BEB8448]();
}

uint64_t sub_244B16CC0()
{
  return MEMORY[0x24BEB8450]();
}

uint64_t sub_244B16CCC()
{
  return MEMORY[0x24BEB8460]();
}

uint64_t sub_244B16CD8()
{
  return MEMORY[0x24BEB8468]();
}

uint64_t sub_244B16CE4()
{
  return MEMORY[0x24BEB8508]();
}

uint64_t sub_244B16CF0()
{
  return MEMORY[0x24BEB8518]();
}

uint64_t sub_244B16CFC()
{
  return MEMORY[0x24BEB8520]();
}

uint64_t sub_244B16D08()
{
  return MEMORY[0x24BEB8528]();
}

uint64_t sub_244B16D14()
{
  return MEMORY[0x24BEB8530]();
}

uint64_t sub_244B16D20()
{
  return MEMORY[0x24BEB8538]();
}

uint64_t sub_244B16D2C()
{
  return MEMORY[0x24BEB8540]();
}

uint64_t sub_244B16D38()
{
  return MEMORY[0x24BEB8548]();
}

uint64_t sub_244B16D44()
{
  return MEMORY[0x24BEB8558]();
}

uint64_t sub_244B16D50()
{
  return MEMORY[0x24BEB85A0]();
}

uint64_t sub_244B16D5C()
{
  return MEMORY[0x24BEB85B0]();
}

uint64_t sub_244B16D68()
{
  return MEMORY[0x24BEB85C0]();
}

uint64_t sub_244B16D74()
{
  return MEMORY[0x24BEB85C8]();
}

uint64_t sub_244B16D80()
{
  return MEMORY[0x24BEB86F8]();
}

uint64_t sub_244B16D8C()
{
  return MEMORY[0x24BEB8728]();
}

uint64_t sub_244B16D98()
{
  return MEMORY[0x24BEB8780]();
}

uint64_t sub_244B16DA4()
{
  return MEMORY[0x24BEB87B8]();
}

uint64_t sub_244B16DB0()
{
  return MEMORY[0x24BEB8828]();
}

uint64_t sub_244B16DBC()
{
  return MEMORY[0x24BEB8838]();
}

uint64_t sub_244B16DC8()
{
  return MEMORY[0x24BEB8840]();
}

uint64_t sub_244B16DD4()
{
  return MEMORY[0x24BEB88F8]();
}

uint64_t sub_244B16DE0()
{
  return MEMORY[0x24BEB8908]();
}

uint64_t sub_244B16DEC()
{
  return MEMORY[0x24BEB8910]();
}

uint64_t sub_244B16DF8()
{
  return MEMORY[0x24BEB8928]();
}

uint64_t sub_244B16E04()
{
  return MEMORY[0x24BEB8950]();
}

uint64_t sub_244B16E10()
{
  return MEMORY[0x24BEB8968]();
}

uint64_t sub_244B16E1C()
{
  return MEMORY[0x24BEB8970]();
}

uint64_t sub_244B16E28()
{
  return MEMORY[0x24BEB8998]();
}

uint64_t sub_244B16E34()
{
  return MEMORY[0x24BEB89B8]();
}

uint64_t sub_244B16E40()
{
  return MEMORY[0x24BE788C8]();
}

uint64_t sub_244B16E4C()
{
  return MEMORY[0x24BE788D0]();
}

uint64_t sub_244B16E58()
{
  return MEMORY[0x24BE788D8]();
}

uint64_t sub_244B16E64()
{
  return MEMORY[0x24BE788E0]();
}

uint64_t sub_244B16E70()
{
  return MEMORY[0x24BE788E8]();
}

uint64_t sub_244B16E7C()
{
  return MEMORY[0x24BE788F0]();
}

uint64_t sub_244B16E88()
{
  return MEMORY[0x24BE788F8]();
}

uint64_t sub_244B16E94()
{
  return MEMORY[0x24BE78918]();
}

uint64_t sub_244B16EA0()
{
  return MEMORY[0x24BE78930]();
}

uint64_t sub_244B16EAC()
{
  return MEMORY[0x24BE78938]();
}

uint64_t sub_244B16EB8()
{
  return MEMORY[0x24BE78940]();
}

uint64_t sub_244B16EC4()
{
  return MEMORY[0x24BE78948]();
}

uint64_t sub_244B16ED0()
{
  return MEMORY[0x24BEB8B68]();
}

uint64_t sub_244B16EDC()
{
  return MEMORY[0x24BEB8B70]();
}

uint64_t sub_244B16EE8()
{
  return MEMORY[0x24BEB8B78]();
}

uint64_t sub_244B16EF4()
{
  return MEMORY[0x24BEB8B80]();
}

uint64_t sub_244B16F00()
{
  return MEMORY[0x24BEB8C48]();
}

uint64_t sub_244B16F0C()
{
  return MEMORY[0x24BEB8C50]();
}

uint64_t sub_244B16F18()
{
  return MEMORY[0x24BE688E0]();
}

uint64_t sub_244B16F24()
{
  return MEMORY[0x24BE688E8]();
}

uint64_t sub_244B16F30()
{
  return MEMORY[0x24BE688F0]();
}

uint64_t sub_244B16F3C()
{
  return MEMORY[0x24BE689A8]();
}

uint64_t sub_244B16F48()
{
  return MEMORY[0x24BE689F0]();
}

uint64_t sub_244B16F54()
{
  return MEMORY[0x24BE68A90]();
}

uint64_t sub_244B16F60()
{
  return MEMORY[0x24BE68A98]();
}

uint64_t sub_244B16F6C()
{
  return MEMORY[0x24BE68AA8]();
}

uint64_t sub_244B16F78()
{
  return MEMORY[0x24BE68AB8]();
}

uint64_t sub_244B16F84()
{
  return MEMORY[0x24BE68AC8]();
}

uint64_t sub_244B16F90()
{
  return MEMORY[0x24BE68AE0]();
}

uint64_t sub_244B16F9C()
{
  return MEMORY[0x24BE68AF8]();
}

uint64_t sub_244B16FA8()
{
  return MEMORY[0x24BE68B08]();
}

uint64_t sub_244B16FB4()
{
  return MEMORY[0x24BE68B50]();
}

uint64_t sub_244B16FC0()
{
  return MEMORY[0x24BE68B58]();
}

uint64_t sub_244B16FCC()
{
  return MEMORY[0x24BE68B60]();
}

uint64_t sub_244B16FD8()
{
  return MEMORY[0x24BE68B68]();
}

uint64_t sub_244B16FE4()
{
  return MEMORY[0x24BE68B70]();
}

uint64_t sub_244B16FF0()
{
  return MEMORY[0x24BE68B78]();
}

uint64_t sub_244B16FFC()
{
  return MEMORY[0x24BE68B80]();
}

uint64_t sub_244B17008()
{
  return MEMORY[0x24BE68B88]();
}

uint64_t sub_244B17014()
{
  return MEMORY[0x24BE68B90]();
}

uint64_t sub_244B17020()
{
  return MEMORY[0x24BE68B98]();
}

uint64_t sub_244B1702C()
{
  return MEMORY[0x24BE68BA0]();
}

uint64_t sub_244B17038()
{
  return MEMORY[0x24BE68BA8]();
}

uint64_t sub_244B17044()
{
  return MEMORY[0x24BE68BB0]();
}

uint64_t sub_244B17050()
{
  return MEMORY[0x24BE68BB8]();
}

uint64_t sub_244B1705C()
{
  return MEMORY[0x24BE3B648]();
}

uint64_t sub_244B17068()
{
  return MEMORY[0x24BE3B970]();
}

uint64_t sub_244B17074()
{
  return MEMORY[0x24BE3B9A0]();
}

uint64_t sub_244B17080()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_244B1708C()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_244B17098()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_244B170A4()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_244B170B0()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_244B170BC()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_244B170C8()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_244B170D4()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_244B170E0()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_244B170EC()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_244B170F8()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_244B17104()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_244B17110()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244B1711C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_244B17128()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244B17134()
{
  return MEMORY[0x24BE3BCA0]();
}

uint64_t sub_244B17140()
{
  return MEMORY[0x24BE3BCA8]();
}

uint64_t sub_244B1714C()
{
  return MEMORY[0x24BE3BCB0]();
}

uint64_t sub_244B17158()
{
  return MEMORY[0x24BE3BCB8]();
}

uint64_t sub_244B17164()
{
  return MEMORY[0x24BE3BD18]();
}

uint64_t sub_244B17170()
{
  return MEMORY[0x24BE3BD20]();
}

uint64_t sub_244B1717C()
{
  return MEMORY[0x24BE3BD28]();
}

uint64_t sub_244B17188()
{
  return MEMORY[0x24BE3BD38]();
}

uint64_t sub_244B17194()
{
  return MEMORY[0x24BE3BD40]();
}

uint64_t sub_244B171A0()
{
  return MEMORY[0x24BE3BD50]();
}

uint64_t sub_244B171AC()
{
  return MEMORY[0x24BE3BD70]();
}

uint64_t sub_244B171B8()
{
  return MEMORY[0x24BE3BD80]();
}

uint64_t sub_244B171C4()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_244B171D0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244B171DC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_244B171E8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_244B171F4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_244B17200()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_244B1720C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244B17218()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244B17224()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244B17230()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_244B1723C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_244B17248()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_244B17254()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_244B17260()
{
  return MEMORY[0x24BEE6B18]();
}

uint64_t sub_244B1726C()
{
  return MEMORY[0x24BEE6C90]();
}

uint64_t sub_244B17278()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_244B17284()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_244B17290()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_244B1729C()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_244B172A8()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_244B172B4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_244B172C0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_244B172CC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244B172D8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_244B172E4()
{
  return MEMORY[0x24BE78EF0]();
}

uint64_t sub_244B172F0()
{
  return MEMORY[0x24BE78EF8]();
}

uint64_t sub_244B172FC()
{
  return MEMORY[0x24BE78F00]();
}

uint64_t sub_244B17308()
{
  return MEMORY[0x24BE78F08]();
}

uint64_t sub_244B17314()
{
  return MEMORY[0x24BE78F10]();
}

uint64_t sub_244B17320()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_244B1732C()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_244B17338()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_244B17344()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_244B17350()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244B1735C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244B17368()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_244B17374()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_244B17380()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_244B1738C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_244B17398()
{
  return MEMORY[0x24BEE6D88]();
}

uint64_t sub_244B173A4()
{
  return MEMORY[0x24BEE6DB0]();
}

uint64_t sub_244B173B0()
{
  return MEMORY[0x24BEE6DC0]();
}

uint64_t sub_244B173BC()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_244B173C8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_244B173D4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244B173E0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_244B173EC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244B173F8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_244B17404()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244B17410()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_244B1741C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_244B17428()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244B17434()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_244B17440()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_244B1744C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_244B17458()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_244B17464()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244B17470()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244B1747C()
{
  return MEMORY[0x24BDD0B18]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

