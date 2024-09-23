void SNSetupLogging()
{
  if (SNSetupLogging_onceToken != -1)
    dispatch_once(&SNSetupLogging_onceToken, &__block_literal_global_0);
}

uint64_t sub_1D57969A4()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = sub_1D57980F4(v0);
  OUTLINED_FUNCTION_7(v1, &qword_1EFF46CF0);
  result = sub_1D5798360();
  qword_1EFF46D00 = result;
  return result;
}

void static PPT.preloadScroll(initDelay:currentDepth:maxDepth:scrollView:completion:)()
{
  void (*v0)(uint64_t);
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
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
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  void (*v35)(uint64_t);
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)();
  _QWORD *v57;

  OUTLINED_FUNCTION_10();
  v52 = v0;
  v53 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = OUTLINED_FUNCTION_13();
  v50 = *(_QWORD *)(v10 - 8);
  v51 = v10;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_0();
  v49 = v12;
  v13 = OUTLINED_FUNCTION_8();
  v47 = *(_QWORD *)(v13 - 8);
  v48 = v13;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_0();
  v45 = v15;
  v46 = OUTLINED_FUNCTION_2();
  v16 = *(_QWORD *)(v46 - 8);
  v17 = MEMORY[0x1E0C80A78](v46);
  v19 = (char *)&v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v44 = (char *)&v43 - v20;
  if (_MergedGlobals != -1)
    swift_once();
  v21 = (void *)qword_1EFF46D00;
  sub_1D5797190(0, &qword_1EFF46C88, (uint64_t (*)(uint64_t))sub_1D5796DAC, MEMORY[0x1E0DED1E8]);
  v22 = OUTLINED_FUNCTION_6();
  v23 = MEMORY[0x1E0DEB418];
  *(_OWORD *)(v22 + 16) = xmmword_1D5798AE0;
  v24 = MEMORY[0x1E0DEB490];
  *(_QWORD *)(v22 + 56) = v23;
  *(_QWORD *)(v22 + 64) = v24;
  *(_QWORD *)(v22 + 32) = v5;
  v25 = v21;
  v26 = objc_msgSend(v3, sel_description);
  v27 = sub_1D5798330();
  v29 = v28;

  *(_QWORD *)(v22 + 96) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v22 + 104) = sub_1D5796E00();
  *(_QWORD *)(v22 + 72) = v27;
  *(_QWORD *)(v22 + 80) = v29;
  sub_1D579833C();
  sub_1D57982D0();

  v30 = swift_bridgeObjectRelease();
  if (v7 >= v5)
  {
    v52(v30);
  }
  else
  {
    OUTLINED_FUNCTION_7(v30, &qword_1EFF46CA0);
    v31 = (void *)OUTLINED_FUNCTION_11();
    sub_1D5798300();
    v32 = v44;
    MEMORY[0x1D8277508](v19, v9);
    v43 = *(void (**)(char *, uint64_t))(v16 + 8);
    v33 = v46;
    v43(v19, v46);
    v34 = (_QWORD *)OUTLINED_FUNCTION_6();
    v35 = v52;
    v36 = v53;
    v34[2] = v3;
    v34[3] = v35;
    v34[4] = v36;
    v34[5] = v7;
    v34[6] = v5;
    v56 = sub_1D579713C;
    v57 = v34;
    v54 = MEMORY[0x1E0C809B0];
    v55 = 1107296256;
    v37 = OUTLINED_FUNCTION_18((uint64_t)sub_1D579714C);
    v38 = v3;
    swift_retain();
    swift_release();
    v39 = v45;
    OUTLINED_FUNCTION_16();
    v54 = MEMORY[0x1E0DEE9D8];
    v40 = sub_1D5797F34(&qword_1EFF46CA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    OUTLINED_FUNCTION_21(v40, &qword_1EFF46CB0, v41, MEMORY[0x1E0DEAEC8]);
    sub_1D57971E8();
    v42 = v49;
    OUTLINED_FUNCTION_9();
    MEMORY[0x1D8277538](v32, v39, v42, v37);
    OUTLINED_FUNCTION_14();

    OUTLINED_FUNCTION_5(v42, *(uint64_t (**)(uint64_t, uint64_t))(v50 + 8));
    OUTLINED_FUNCTION_4(v47);
    v43(v32, v33);
  }
  OUTLINED_FUNCTION_1();
}

unint64_t sub_1D5796DAC()
{
  unint64_t result;

  result = qword_1EFF46C90;
  if (!qword_1EFF46C90)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFF46C90);
  }
  return result;
}

unint64_t sub_1D5796E00()
{
  unint64_t result;

  result = qword_1EFF46C98;
  if (!qword_1EFF46C98)
  {
    result = MEMORY[0x1D8277844](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EFF46C98);
  }
  return result;
}

void sub_1D5796E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(id);
  void *v5;
  void *v6;
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
  uint64_t v18;
  char *v19;
  double Height;
  uint64_t v21;
  id v22;
  double v23;
  double v24;
  id v25;
  double v26;
  void (*v27)(char *, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  void (*v30)(id);
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(id);
  _QWORD v44[6];
  CGRect v45;

  OUTLINED_FUNCTION_10();
  v39 = v0;
  v40 = v1;
  v3 = v2;
  v43 = v4;
  v6 = v5;
  v7 = *(_QWORD *)(OUTLINED_FUNCTION_13() - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1D57982F4();
  v41 = *(_QWORD *)(v10 - 8);
  v42 = v10;
  OUTLINED_FUNCTION_3();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = OUTLINED_FUNCTION_2();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v17 = (char *)&v36 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v36 - v18;
  objc_msgSend(v6, sel_bounds);
  Height = CGRectGetHeight(v45);
  v22 = OUTLINED_FUNCTION_17(v21, sel_contentSize);
  v24 = v23;
  v25 = OUTLINED_FUNCTION_17((uint64_t)v22, sel_contentOffset);
  if (Height + v26 >= v24)
  {
    v43(v25);
  }
  else
  {
    OUTLINED_FUNCTION_7((uint64_t)objc_msgSend(v6, sel_setContentOffset_animated_, 0), &qword_1EFF46CA0);
    v38 = v7;
    v37 = OUTLINED_FUNCTION_11();
    sub_1D5798300();
    MEMORY[0x1D8277508](v17, 1.0);
    v27 = *(void (**)(char *, uint64_t))(v14 + 8);
    v27(v17, v13);
    v28 = (_QWORD *)OUTLINED_FUNCTION_6();
    v29 = v40;
    v28[2] = v39;
    v28[3] = v29;
    v30 = v43;
    v28[4] = v6;
    v28[5] = v30;
    v28[6] = v3;
    v44[4] = sub_1D57980B8;
    v44[5] = v28;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 1107296256;
    v44[2] = sub_1D579714C;
    v44[3] = &block_descriptor_28;
    v31 = _Block_copy(v44);
    v32 = v6;
    swift_retain();
    swift_release();
    OUTLINED_FUNCTION_16();
    v44[0] = MEMORY[0x1E0DEE9D8];
    v33 = sub_1D5797F34(&qword_1EFF46CA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    OUTLINED_FUNCTION_20(v33, &qword_1EFF46CB0, v34, MEMORY[0x1E0DEAEC8]);
    sub_1D57971E8();
    sub_1D579836C();
    v35 = (void *)v37;
    MEMORY[0x1D8277538](v19, v12, v9, v31);
    _Block_release(v31);

    OUTLINED_FUNCTION_5((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(v38 + 8));
    OUTLINED_FUNCTION_4(v41);
    v27(v19, v13);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1D5797110()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1D579713C()
{
  sub_1D5796E3C();
}

uint64_t sub_1D579714C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
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

void sub_1D5797190(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

unint64_t sub_1D57971E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFF46CB8;
  if (!qword_1EFF46CB8)
  {
    sub_1D5797190(255, &qword_1EFF46CB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1D8277844](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EFF46CB8);
  }
  return result;
}

void static PPT.waitForContent(initDelay:contentLength:scrollView:timeout:completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t *v5;
  uint64_t *v6;
  double v7;
  double v8;
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
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  int v41;
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
  uint64_t (*v55)();
  uint64_t v56;

  OUTLINED_FUNCTION_10();
  v46 = v0;
  v43 = v1;
  v44 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_13();
  v51 = *(_QWORD *)(v9 - 8);
  v52 = v9;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_0();
  v50 = v11;
  v12 = OUTLINED_FUNCTION_8();
  v48 = *(_QWORD *)(v12 - 8);
  v49 = v12;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_0();
  v47 = v14;
  v15 = OUTLINED_FUNCTION_2();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v45 = (char *)&v40 - v20;
  v42 = *v6;
  v41 = *((unsigned __int8 *)v6 + 8);
  if (_MergedGlobals != -1)
    swift_once();
  v21 = (void *)qword_1EFF46D00;
  sub_1D5797190(0, &qword_1EFF46C88, (uint64_t (*)(uint64_t))sub_1D5796DAC, MEMORY[0x1E0DED1E8]);
  v22 = OUTLINED_FUNCTION_6();
  *(_OWORD *)(v22 + 16) = xmmword_1D5798AF0;
  v23 = v21;
  v24 = objc_msgSend(v4, sel_description);
  v25 = sub_1D5798330();
  v27 = v26;

  *(_QWORD *)(v22 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v22 + 64) = sub_1D5796E00();
  *(_QWORD *)(v22 + 32) = v25;
  *(_QWORD *)(v22 + 40) = v27;
  sub_1D579833C();
  sub_1D57982D0();

  v28 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7(v28, &qword_1EFF46CA0);
  v29 = (void *)OUTLINED_FUNCTION_11();
  sub_1D5798300();
  v30 = v45;
  MEMORY[0x1D8277508](v19, v8);
  v40 = *(void (**)(char *, uint64_t))(v16 + 8);
  v40(v19, v15);
  OUTLINED_FUNCTION_12((uint64_t)v19, v43, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16));
  v31 = (*(unsigned __int8 *)(v16 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v42;
  *(_BYTE *)(v32 + 24) = v41;
  v33 = v44;
  *(_QWORD *)(v32 + 32) = v4;
  *(_QWORD *)(v32 + 40) = v33;
  *(_QWORD *)(v32 + 48) = v46;
  OUTLINED_FUNCTION_12(v32 + v31, (uint64_t)v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 32));
  v55 = sub_1D57979B8;
  v56 = v32;
  v53 = MEMORY[0x1E0C809B0];
  v54 = 1107296256;
  v34 = OUTLINED_FUNCTION_18((uint64_t)sub_1D579714C);
  v35 = v4;
  swift_retain();
  swift_release();
  v36 = v47;
  sub_1D57982E8();
  v53 = MEMORY[0x1E0DEE9D8];
  v37 = sub_1D5797F34(&qword_1EFF46CA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  OUTLINED_FUNCTION_21(v37, &qword_1EFF46CB0, v38, MEMORY[0x1E0DEAEC8]);
  sub_1D57971E8();
  v39 = v50;
  OUTLINED_FUNCTION_9();
  MEMORY[0x1D8277538](v30, v36, v39, v34);
  OUTLINED_FUNCTION_14();

  OUTLINED_FUNCTION_5(v39, *(uint64_t (**)(uint64_t, uint64_t))(v51 + 8));
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v36, v49);
  v40(v30, v15);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1D57975DC(uint64_t a1, int a2, void *a3, uint64_t (*a4)(id), uint64_t (*a5)(id), uint64_t a6)
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  double v24;
  double v25;
  uint64_t v26;
  char v27;
  uint64_t (*v28)(char *, uint64_t);
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t (**v34)(id);
  uint64_t (*v35)(id);
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(id);
  uint64_t (*v55)(id);
  _QWORD aBlock[6];

  v53 = a6;
  v54 = a4;
  v55 = a5;
  v9 = OUTLINED_FUNCTION_13();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_0();
  v52 = v11;
  v12 = OUTLINED_FUNCTION_8();
  v50 = *(_QWORD *)(v12 - 8);
  v51 = v12;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_0();
  v49 = v14;
  v15 = OUTLINED_FUNCTION_2();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  v18 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v44 - v21;
  v23 = OUTLINED_FUNCTION_17(v20, sel_contentSize);
  v47 = a1;
  v48 = a2;
  if ((a2 & 1) != 0)
  {
    if (v24 > *(double *)&a1)
      return v54(v23);
  }
  else if (v25 > *(double *)&a1)
  {
    return v54(v23);
  }
  v45 = a3;
  v46 = v10;
  sub_1D5798300();
  sub_1D5797F34(&qword_1EFF46CE8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF6B8], MEMORY[0x1E0DEF6C8]);
  v26 = v53;
  v27 = sub_1D5798324();
  v28 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
  v23 = (id)v28(v22, v15);
  if ((v27 & 1) != 0)
  {
    OUTLINED_FUNCTION_7((uint64_t)v23, &qword_1EFF46CA0);
    v29 = (void *)OUTLINED_FUNCTION_11();
    sub_1D5798300();
    MEMORY[0x1D8277508](v19, 1.0);
    v28(v19, v15);
    OUTLINED_FUNCTION_12((uint64_t)v19, v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16));
    v30 = *(unsigned __int8 *)(v16 + 80);
    v53 = v9;
    v31 = (v30 + 40) & ~v30;
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = v47;
    *(_BYTE *)(v32 + 24) = v48 & 1;
    v33 = v45;
    *(_QWORD *)(v32 + 32) = v45;
    OUTLINED_FUNCTION_12(v32 + v31, (uint64_t)v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 32));
    v34 = (uint64_t (**)(id))(v32 + ((v17 + v31 + 7) & 0xFFFFFFFFFFFFFFF8));
    v35 = v55;
    *v34 = v54;
    v34[1] = v35;
    aBlock[4] = sub_1D5797FFC;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1D579714C;
    aBlock[3] = &block_descriptor_22;
    v36 = _Block_copy(aBlock);
    v37 = v33;
    swift_retain();
    swift_release();
    v38 = v49;
    OUTLINED_FUNCTION_16();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    v39 = sub_1D5797F34(&qword_1EFF46CA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    OUTLINED_FUNCTION_20(v39, &qword_1EFF46CB0, v40, MEMORY[0x1E0DEAEC8]);
    sub_1D57971E8();
    v41 = v52;
    v42 = v53;
    sub_1D579836C();
    MEMORY[0x1D8277538](v22, v38, v41, v36);
    _Block_release(v36);

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v41, v42);
    OUTLINED_FUNCTION_4(v50);
    return v28(v22, v15);
  }
  return v54(v23);
}

uint64_t sub_1D5797948()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_2() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  OUTLINED_FUNCTION_22();
  swift_release();
  OUTLINED_FUNCTION_5(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_deallocObject();
}

uint64_t sub_1D57979B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2() - 8) + 80);
  return sub_1D57975DC(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void **)(v0 + 32), *(uint64_t (**)(id))(v0 + 40), *(uint64_t (**)(id))(v0 + 48), v0 + ((v1 + 56) & ~v1));
}

void static PPT.rampDisplay(completion:)(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v5 = objc_msgSend(v4, sel_delegate);

  if (v5)
  {
    if ((objc_msgSend(v5, sel_respondsToSelector_, sel_window) & 1) != 0)
    {
      v6 = objc_msgSend(v5, sel_window);
      swift_unknownObjectRelease();
      if (v6)
      {
        objc_msgSend(v6, sel_setAlpha_, 0.0);

      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  v7 = (void *)objc_opt_self();
  v8 = MEMORY[0x1E0C809B0];
  v9 = OUTLINED_FUNCTION_15((uint64_t)sub_1D579714C, MEMORY[0x1E0C809B0], 1107296256, v12, v14);
  v10 = OUTLINED_FUNCTION_6();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  v11 = OUTLINED_FUNCTION_15((uint64_t)sub_1D5797D6C, v8, 1107296256, v13, v15);
  swift_retain();
  swift_release();
  objc_msgSend(v7, sel_animateWithDuration_animations_completion_, v9, v11, 0.5);
  _Block_release(v11);
  OUTLINED_FUNCTION_14();
}

void sub_1D5797BA0()
{
  id v0;
  id v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = objc_msgSend(v0, sel_delegate);

  if (v1)
  {
    if ((objc_msgSend(v1, sel_respondsToSelector_, sel_window) & 1) != 0)
    {
      v2 = objc_msgSend(v1, sel_window);
      OUTLINED_FUNCTION_19();
      if (v2)
      {
        objc_msgSend(v2, sel_setAlpha_, 1.0);

      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_1D5797C80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5797CA4()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  id v2;
  id v3;
  uint64_t v4;
  id v5;

  v1 = *(uint64_t (**)(uint64_t))(v0 + 16);
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v3 = objc_msgSend(v2, sel_delegate);

  if (v3)
  {
    if ((objc_msgSend(v3, sel_respondsToSelector_, sel_window) & 1) != 0)
    {
      v5 = objc_msgSend(v3, sel_window);
      v4 = OUTLINED_FUNCTION_19();
      if (v5)
      {
        objc_msgSend(v5, sel_setAlpha_, 1.0);

      }
    }
    else
    {
      v4 = OUTLINED_FUNCTION_19();
    }
  }
  return v1(v4);
}

uint64_t sub_1D5797D6C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id PPT.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id PPT.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PPT.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PPT()
{
  return objc_opt_self();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PPT.ContentLength(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
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

uint64_t storeEnumTagSinglePayload for PPT.ContentLength(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1D5797F0C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_1D5797F18(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PPT.ContentLength()
{
  return &type metadata for PPT.ContentLength;
}

uint64_t sub_1D5797F34(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D8277844](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D5797F74()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_2() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_5(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D5797FFC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_2() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_BYTE *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v6 = v0 + v2;
  v7 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  v8 = *v7;
  v9 = v7[1];
  type metadata accessor for PPT();
  v11 = v3;
  v12 = v4;
  return static PPT.waitForContent(initDelay:contentLength:scrollView:timeout:completion:)(&v11, v5, v6, v8, v9, 0.0);
}

uint64_t sub_1D5798090()
{
  OUTLINED_FUNCTION_22();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1D57980B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  v1 = v0[2];
  type metadata accessor for PPT();
  result = v1 + 1;
  if (!__OFADD__(v1, 1))
    return static PPT.preloadScroll(initDelay:currentDepth:maxDepth:scrollView:completion:)(result, v0[3], v0[4], v0[5], v0[6], 1.0);
  __break(1u);
  return result;
}

uint64_t sub_1D57980F4(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2)
    return 0;
  v3 = sub_1D5798330();

  return v3;
}

uint64_t sub_1D5798160(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_1D579830C();
}

uint64_t OUTLINED_FUNCTION_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_5@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, unint64_t *a2)
{
  return sub_1D5798160(0, a2);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_1D57982F4();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_1D579836C();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_1D5798354();
}

uint64_t OUTLINED_FUNCTION_12@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return sub_1D57982DC();
}

void OUTLINED_FUNCTION_14()
{
  const void *v0;

  _Block_release(v0);
}

void *OUTLINED_FUNCTION_15@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_1D57982E8();
}

id OUTLINED_FUNCTION_17(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void *OUTLINED_FUNCTION_18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = a1;
  *(_QWORD *)(v2 - 128) = v1;
  return _Block_copy((const void *)(v2 - 152));
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_20(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t (*v4)(uint64_t);

  sub_1D5797190(0, a2, v4, a4);
}

void OUTLINED_FUNCTION_21(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t (*v4)(uint64_t);

  sub_1D5797190(0, a2, v4, a4);
}

void OUTLINED_FUNCTION_22()
{
  uint64_t v0;

}

uint64_t sub_1D57982D0()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1D57982DC()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1D57982E8()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1D57982F4()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1D5798300()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1D579830C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1D5798318()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1D5798324()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1D5798330()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D579833C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1D5798348()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1D5798354()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1D5798360()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1D579836C()
{
  return MEMORY[0x1E0DEC060]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

