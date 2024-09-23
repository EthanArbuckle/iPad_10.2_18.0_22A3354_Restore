uint64_t TLKSnippetModernizationEnabled()
{
  void *v0;
  uint64_t v1;

  if (TLKSnippetModernizationEnabled_onceToken[0] != -1)
    dispatch_once(TLKSnippetModernizationEnabled_onceToken, &__block_literal_global_25);
  if (!TLKSnippetModernizationEnabled_snippetModernizationEnabled)
    return 0;
  +[TLKTrialManager sharedManager](TLKTrialManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "snippetModernizationEnabled");

  return v1;
}

void sub_1AC750378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AC750560(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
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

uint64_t TLKBiggerSuggestionsLayoutEnabled()
{
  void *v1;
  uint64_t v2;

  if (+[TLKUtilities isMacOS](TLKUtilities, "isMacOS"))
    return 0;
  +[TLKTrialManager sharedManager](TLKTrialManager, "sharedManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "biggerSuggestionsLayoutEnabled");

  return v2;
}

void sub_1AC766354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1AC766A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double *__SK_RGBtoHSV(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6;
  float v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;

  if (a4 >= a5)
    v6 = a4;
  else
    v6 = a5;
  if (v6 < a6)
    v6 = a6;
  v7 = v6;
  v8 = v7;
  *a3 = v7;
  if (v7 == 0.0)
  {
    *result = NAN;
    *a2 = 0.0;
    *a3 = 0.0;
  }
  else
  {
    if (a4 <= a5)
      v9 = a4;
    else
      v9 = a5;
    if (v9 > a6)
      v9 = a6;
    v10 = v9;
    v11 = v7 - v10;
    *a2 = (float)(v11 / v7);
    v12 = v11;
    if (v8 == a4)
    {
      v13 = (a5 - a6) / v12;
    }
    else
    {
      v14 = v8 == a5;
      v15 = (a4 - a5) / v12 + 4.0;
      v13 = (a6 - a4) / v12 + 2.0;
      if (!v14)
        v13 = v15;
    }
    v16 = v13 * 60.0;
    if (v16 < 0.0)
      v16 = v16 + 360.0;
    *result = v16;
  }
  return result;
}

void sub_1AC770D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AC77934C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 2);
}

uint64_t sub_1AC779368@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 96);
  swift_beginAccess();
  v7 = type metadata accessor for ComputationTracker.State(0, *(_QWORD *)(v3 + 80), v5, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, v4, v7);
}

uint64_t type metadata accessor for ComputationTracker.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ComputationTracker.State);
}

uint64_t sub_1AC7793E4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 96);
  swift_beginAccess();
  v7 = type metadata accessor for ComputationTracker.State(0, *(_QWORD *)(v3 + 80), v5, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v4, a1, v7);
  return swift_endAccess();
}

uint64_t (*sub_1AC77945C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AC7794A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104));
  swift_retain();
  return v1;
}

uint64_t sub_1AC7794D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_1AC779524(a1, a2);
  return v4;
}

uint64_t *sub_1AC779524(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v5 = *v2;
  swift_defaultActor_initialize();
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v5 + 80) - 8) + 56))((uint64_t)v2 + *(_QWORD *)(*v2 + 96), 1, 2, *(_QWORD *)(v5 + 80));
  v6 = *(_QWORD *)(*v2 + 112);
  sub_1AC7846B4();
  *(uint64_t *)((char *)v2 + v6) = sub_1AC784654();
  v7 = (uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 104));
  *v7 = a1;
  v7[1] = a2;
  return v2;
}

uint64_t sub_1AC7795D0()
{
  sub_1AC7846B4();
  return sub_1AC784654();
}

uint64_t sub_1AC779604()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AC77964C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 112));
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1AC77969C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1AC7796E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[3] = a1;
  v2[4] = v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2[5] = v3;
  v4 = sub_1AC7846B4();
  v2[6] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[7] = v5;
  v2[8] = *(_QWORD *)(v5 + 64);
  v2[9] = swift_task_alloc();
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  type metadata accessor for ComputationTracker.State(0, v3, v6, v7);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1AC7797D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v11)(uint64_t);
  _QWORD *v12;
  uint64_t v14;
  _QWORD *v15;
  uint64_t (*v16)(_QWORD);

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 40);
  (*(void (**)(void))(**(_QWORD **)(v0 + 32) + 120))();
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v1, 2, v3);
  if (v4)
  {
    if (v4 == 1)
    {
      v7 = *(_QWORD *)(v0 + 104);
      v9 = *(_QWORD *)(v0 + 32);
      v8 = *(_QWORD *)(v0 + 40);
      v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 80) + 56);
      *(_QWORD *)(v0 + 128) = v10;
      v10(v7, 2, 2, v8);
      v11 = *(void (**)(uint64_t))(*(_QWORD *)v9 + 128);
      *(_QWORD *)(v0 + 136) = v11;
      v11(v7);
      v16 = (uint64_t (*)(_QWORD))(**(int **)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 104))
                                           + *(_QWORD *)(v9 + *(_QWORD *)(*(_QWORD *)v9 + 104)));
      v12 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 144) = v12;
      *v12 = v0;
      v12[1] = sub_1AC779A64;
      return v16(*(_QWORD *)(v0 + 96));
    }
    else
    {
      v14 = type metadata accessor for ComputationTracker(255, *(_QWORD *)(v0 + 40), v5, v6);
      MEMORY[0x1AF4413A4](&unk_1AC789B40, v14);
      v15 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 120) = v15;
      *v15 = v0;
      v15[1] = sub_1AC7799AC;
      return sub_1AC784858();
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 32))(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 40));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1AC7799AC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AC779A04()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC779A64()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AC779ABC()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  void (*v2)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, _QWORD, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 128);
  v1 = *(uint64_t (**)(uint64_t))(v0 + 136);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 32);
  v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 + 80) + 16);
  v7(v3, *(_QWORD *)(v0 + 96), v4);
  v2(v3, 0, 2, v4);
  v8 = v1(v3);
  v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 152))(v8);
  if (!MEMORY[0x1AF440B10](v9, v5))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 32))(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 40));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v10 = 0;
  v12 = *(_QWORD *)(v0 + 56);
  v11 = *(_QWORD *)(v0 + 64);
  while (1)
  {
    v13 = sub_1AC784660();
    sub_1AC78463C();
    if ((v13 & 1) != 0)
    {
      (*(void (**)(_QWORD, unint64_t, _QWORD))(v12 + 16))(*(_QWORD *)(v0 + 72), v9+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v10, *(_QWORD *)(v0 + 48));
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_10;
      goto LABEL_5;
    }
    result = sub_1AC784768();
    if (v11 != 8)
      break;
    v18 = result;
    v19 = *(_QWORD *)(v0 + 72);
    v20 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)(v0 + 16) = v18;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v19, v0 + 16, v20);
    swift_unknownObjectRelease();
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }
LABEL_5:
    v15 = *(_QWORD *)(v0 + 72);
    v16 = *(_QWORD *)(v0 + 48);
    v7(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 40));
    sub_1AC7846A8();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v16);
    ++v10;
    if (v14 == MEMORY[0x1AF440B10](v9, v16))
      goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC779CB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, _QWORD);
  _BYTE v10[32];

  v4 = sub_1AC7846B4();
  MEMORY[0x1E0C80A78](v4, v5);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(&v10[-v7], a1, v4);
  v8 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)a2 + 168))(v10);
  sub_1AC784690();
  sub_1AC784678();
  return v8(v10, 0);
}

uint64_t sub_1AC779D84@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t *v3;
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
  uint64_t v16;

  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 80);
  v7 = type metadata accessor for ComputationTracker.State(0, v6, a1, a2);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x1E0C80A78](v7, v9);
  v12 = (char *)&v16 - v11;
  (*(void (**)(uint64_t))(v5 + 120))(v10);
  v13 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 2, v6))
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
    v14 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(a3, v12, v6);
    v14 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a3, v14, 1, v6);
}

uint64_t sub_1AC779E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 96);
  v6 = type metadata accessor for ComputationTracker.State(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v4;
}

uint64_t sub_1AC779EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1AC779E68(a1, a2, a3, a4);
  return swift_defaultActor_deallocate();
}

uint64_t sub_1AC779EF4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1AC779F00()
{
  return sub_1AC779EF4();
}

unint64_t sub_1AC779F18(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972F8);
  v2 = (_QWORD *)sub_1AC784834();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (id *)(a1 + 40);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = *v4;
    v8 = v5;
    result = sub_1AC77ECCC((uint64_t)v8);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = 8 * result;
    *(_QWORD *)(v2[6] + v11) = v8;
    *(_QWORD *)(v2[7] + v11) = v6;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v14;
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

unint64_t sub_1AC77A018(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972E8);
  v2 = (_QWORD *)sub_1AC784834();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    swift_retain();
    result = sub_1AC77ECCC((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
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

uint64_t sub_1AC77A120(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v9;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = sub_1AC77ECCC((uint64_t)a1);
      if ((v7 & 1) != 0)
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v6);
        swift_retain();
        return v5;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = sub_1AC7847E0();

  if (!v4)
    return 0;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972A0);
  swift_dynamicCast();
  v5 = v9;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_1AC77A1E8()
{
  uint64_t v0;

  if (qword_1EEC97B20 != -1)
    swift_once();
  v0 = sub_1AC7845DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EEC97C38);
}

uint64_t sub_1AC77A230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t sub_1AC77A24C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v1 = v0 + 10;
  if (qword_1EEC97B20 != -1)
    swift_once();
  v2 = sub_1AC7845DC();
  v0[19] = __swift_project_value_buffer(v2, (uint64_t)qword_1EEC97C38);
  swift_bridgeObjectRetain_n();
  v3 = sub_1AC7845C4();
  v4 = sub_1AC784714();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v15 = (_QWORD *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v17 = v16;
    *(_DWORD *)v5 = 138412546;
    v6 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    v0[10] = v6;
    sub_1AC784738();
    *v15 = v6;
    *(_WORD *)(v5 + 12) = 2080;
    v7 = sub_1AC783994();
    v8 = swift_bridgeObjectRetain();
    v9 = MEMORY[0x1AF440AB0](v8, v7);
    v11 = v10;
    swift_bridgeObjectRelease();
    v0[10] = sub_1AC77E68C(v9, v11, &v17);
    sub_1AC784738();
    v1 = v0 + 10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AC747000, v3, v4, "[%@]: fetching keys %s", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v16, -1, -1);
    MEMORY[0x1AF441428](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v12 = (void *)v0[18];
  v0[20] = sub_1AC783994();
  v13 = sub_1AC78460C();
  v0[21] = v13;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_1AC77A54C;
  v0[14] = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v0[11] = 0x40000000;
  v0[12] = sub_1AC77A940;
  v0[13] = &block_descriptor;
  objc_msgSend(v12, sel_computeObjectsForKeys_completionHandler_, v13, v1);
  return swift_continuation_await();
}

uint64_t sub_1AC77A54C()
{
  return swift_task_switch();
}

uint64_t sub_1AC77A598()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;
  _QWORD *v24;
  NSObject *log;
  uint64_t v26;
  uint64_t v27[2];

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 120);

  if (!v2)
    v2 = MEMORY[0x1E0DEE9D8];
  v3 = sub_1AC77A9AC(v2);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1AC784804();
  }
  else
  {
    v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (*(_QWORD *)(v3 + 16) < v4)
    v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972F8);
    v5 = sub_1AC784834();
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9E0];
  }
  v6 = *(_QWORD *)(v0 + 136);
  v27[0] = v5;
  sub_1AC78107C(v6, v3, 1, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v27[0];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v8 = sub_1AC7845C4();
  v9 = sub_1AC784714();
  if (os_log_type_enabled(v8, v9))
  {
    log = v8;
    v10 = *(_QWORD *)(v0 + 160);
    v23 = v7;
    v11 = swift_slowAlloc();
    v24 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v27[0] = v26;
    *(_DWORD *)v11 = 138412802;
    v12 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    *(_QWORD *)(v0 + 80) = v12;
    sub_1AC784738();
    *v24 = v12;
    *(_WORD *)(v11 + 12) = 2080;
    v13 = swift_bridgeObjectRetain();
    v14 = MEMORY[0x1AF440AB0](v13, v10);
    v16 = v15;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 80) = sub_1AC77E68C(v14, v16, v27);
    sub_1AC784738();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 22) = 2080;
    v17 = swift_bridgeObjectRetain();
    v18 = MEMORY[0x1AF440AB0](v17, v10);
    v20 = v19;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 80) = sub_1AC77E68C(v18, v20, v27);
    sub_1AC784738();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v8 = log;
    _os_log_impl(&dword_1AC747000, log, v9, "[%@]: fetched keys %s, %s", (uint8_t *)v11, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v24, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v26, -1, -1);
    v21 = v11;
    v7 = v23;
    MEMORY[0x1AF441428](v21, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  **(_QWORD **)(v0 + 128) = v7;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC77A940(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    sub_1AC783994();
    v3 = sub_1AC784618();
  }
  else
  {
    v3 = 0;
  }
  v5 = v3;
  sub_1AC7843A8((uint64_t)&v5, *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40), &qword_1EEC97280);
  return swift_continuation_resume();
}

uint64_t sub_1AC77A9AC(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1AC784804();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    result = sub_1AC7847A4();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v4 = 0;
        do
        {
          v5 = v4 + 1;
          v10 = (void *)MEMORY[0x1AF440C00]();
          sub_1AC783994();
          v6 = v10;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
          swift_dynamicCast();
          swift_unknownObjectRelease();
          sub_1AC78478C();
          sub_1AC7847B0();
          sub_1AC7847BC();
          sub_1AC784798();
          v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        v7 = (void **)(a1 + 32);
        sub_1AC783994();
        do
        {
          v8 = *v7++;
          v9 = v8;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
          swift_dynamicCast();

          sub_1AC78478C();
          sub_1AC7847B0();
          sub_1AC7847BC();
          sub_1AC784798();
          --v2;
        }
        while (v2);
      }
      return v11;
    }
  }
  return result;
}

uint64_t sub_1AC77AB88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[29] = a2;
  v3[30] = a3;
  v3[28] = a1;
  return swift_task_switch();
}

uint64_t sub_1AC77ABF0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  os_log_type_t type;

  if (qword_1EEC97B20 != -1)
    swift_once();
  v1 = (void *)v0[29];
  v2 = sub_1AC7845DC();
  v0[31] = __swift_project_value_buffer(v2, (uint64_t)qword_1EEC97C38);
  v3 = v1;
  v4 = sub_1AC7845C4();
  v5 = sub_1AC784714();
  v6 = os_log_type_enabled(v4, v5);
  v7 = (void *)v0[29];
  if (v6)
  {
    type = v5;
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412546;
    v10 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    v0[26] = v10;
    sub_1AC784738();
    *v9 = v10;
    *(_WORD *)(v8 + 12) = 2112;
    v0[27] = v7;
    v11 = v7;
    sub_1AC784738();
    v9[1] = v7;

    _os_log_impl(&dword_1AC747000, v4, type, "[%@]: fetching key %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v9, -1, -1);
    MEMORY[0x1AF441428](v8, -1, -1);
  }
  else
  {

  }
  v13 = v0[29];
  v12 = (void *)v0[30];
  v0[7] = v0 + 21;
  v0[2] = v0;
  v0[3] = sub_1AC77AE78;
  v14 = swift_continuation_init();
  v0[16] = MEMORY[0x1E0C809B0];
  v15 = v0 + 16;
  v15[1] = 0x40000000;
  v15[2] = sub_1AC77B198;
  v15[3] = &block_descriptor_72;
  v15[4] = v14;
  objc_msgSend(v12, sel_computeObjectForKey_completionHandler_, v13, v15);
  return swift_continuation_await();
}

uint64_t sub_1AC77AE78()
{
  return swift_task_switch();
}

uint64_t sub_1AC77AEF0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t *v17;
  uint64_t inited;
  NSObject *v19;
  NSObject *v21;
  os_log_type_t v22;

  v1 = *(void **)(v0 + 232);
  v2 = *(void **)(v0 + 168);
  v3 = v2;
  v4 = v1;
  v5 = v3;
  v6 = v4;
  v7 = sub_1AC7845C4();
  v8 = sub_1AC784714();
  if (os_log_type_enabled(v7, v8))
  {
    v22 = v8;
    v21 = v7;
    v9 = *(void **)(v0 + 232);
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412802;
    v12 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    *(_QWORD *)(v0 + 176) = v12;
    sub_1AC784738();
    *v11 = v12;
    *(_WORD *)(v10 + 12) = 2112;
    *(_QWORD *)(v0 + 184) = v9;
    v13 = v9;
    sub_1AC784738();
    v11[1] = v9;

    *(_WORD *)(v10 + 22) = 2112;
    if (v2)
    {
      *(_QWORD *)(v0 + 200) = v5;
      v14 = v5;
    }
    else
    {
      *(_QWORD *)(v0 + 192) = 0;
    }
    sub_1AC784738();
    v16 = v21;
    v11[2] = v2;

    _os_log_impl(&dword_1AC747000, v21, v22, "[%@]: fetched key %@, %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v11, -1, -1);
    MEMORY[0x1AF441428](v10, -1, -1);
    v15 = *(NSObject **)(v0 + 232);
  }
  else
  {

    v15 = *(NSObject **)(v0 + 232);
    v16 = v15;
  }
  v17 = *(unint64_t **)(v0 + 224);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97278);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AC789B10;
  *(_QWORD *)(inited + 32) = v15;
  *(_QWORD *)(inited + 40) = v2;
  v19 = v15;
  *v17 = sub_1AC779F18(inited);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC77B198(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_1AC7843A8((uint64_t)&v6, v3, (uint64_t *)&unk_1EEC972D8);
  return swift_continuation_resume();
}

uint64_t sub_1AC77B1E8(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x1E0DEE9D8];
    if (!v6)
      break;
    v13 = MEMORY[0x1E0DEE9D8];
    result = sub_1AC7847A4();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x1AF440C00](v8, a3);
      else
        v9 = *(id *)(a3 + 8 * v8 + 32);
      v10 = v9;
      v11 = v9;
      a1(&v12, &v11);

      if (v3)
        return swift_release();
      ++v8;
      sub_1AC78478C();
      sub_1AC7847B0();
      sub_1AC7847BC();
      sub_1AC784798();
      if (v6 == v8)
        return v13;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v6 = sub_1AC784804();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1AC77B350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[14] = a2;
  v3[15] = a3;
  v3[13] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC972D0);
  v3[16] = v4;
  v3[17] = *(_QWORD *)(v4 - 8);
  v3[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97298);
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1AC77B3EC()
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
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 120);
  *(_QWORD *)(v0 + 168) = sub_1AC779F18(MEMORY[0x1E0DEE9D8]);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1AC784804();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972C0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97308);
    sub_1AC7846FC();
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v19;
    *v19 = v0;
    v19[1] = sub_1AC77B6FC;
    return sub_1AC784708();
  }
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_17;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v21 = v1 & 0xC000000000000001;
    v20 = *(_QWORD *)(v0 + 120) + 32;
    v22 = v2;
    while (1)
    {
      if (v21)
      {
        v6 = MEMORY[0x1AF440C00](v4, *(_QWORD *)(v0 + 120));
      }
      else
      {
        v6 = *(_QWORD *)(v20 + 8 * v4);
        swift_retain();
      }
      v8 = *(_QWORD *)(v0 + 152);
      v7 = *(_QWORD *)(v0 + 160);
      v9 = sub_1AC7846F0();
      v10 = *(_QWORD *)(v9 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v7, 1, 1, v9);
      v11 = (_QWORD *)swift_allocObject();
      v11[2] = 0;
      v12 = v11 + 2;
      v11[3] = 0;
      v11[4] = v6;
      sub_1AC783D00(v7, v8);
      LODWORD(v8) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
      swift_retain();
      v13 = *(_QWORD *)(v0 + 152);
      if ((_DWORD)v8 == 1)
      {
        sub_1AC7838E4(*(_QWORD *)(v0 + 152));
        if (!*v12)
          goto LABEL_13;
      }
      else
      {
        sub_1AC7846E4();
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
        if (!*v12)
        {
LABEL_13:
          v14 = 0;
          v16 = 0;
          goto LABEL_14;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      v14 = sub_1AC78469C();
      v16 = v15;
      swift_unknownObjectRelease();
LABEL_14:
      v17 = **(_QWORD **)(v0 + 112);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972C0);
      v18 = v16 | v14;
      if (v16 | v14)
      {
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        v18 = v0 + 16;
        *(_QWORD *)(v0 + 32) = v14;
        *(_QWORD *)(v0 + 40) = v16;
      }
      ++v4;
      v5 = *(_QWORD *)(v0 + 160);
      *(_QWORD *)(v0 + 48) = 1;
      *(_QWORD *)(v0 + 56) = v18;
      *(_QWORD *)(v0 + 64) = v17;
      swift_task_create();
      swift_release();
      swift_release();
      sub_1AC7838E4(v5);
      if (v22 == v4)
        goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC77B6FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v2 + 184) = *(_QWORD *)(v2 + 168);
  return swift_task_switch();
}

void sub_1AC77B76C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  char v22;
  char isUniquelyReferenced_nonNull_native;
  void *v24;
  id v25;
  char v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  id v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  _QWORD *v44;
  void *v45;
  _QWORD *v46;
  _QWORD *v47;
  int64_t v48;

  v1 = (_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 72);
  if (!v2)
  {
    v42 = *(_QWORD *)(v0 + 184);
    v43 = *(_QWORD **)(v0 + 104);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    *v43 = v42;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v46 = (_QWORD *)(v0 + 88);
  v47 = (_QWORD *)(v0 + 96);
  v3 = v2 + 64;
  v4 = -1;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  if (-v5 < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v2 + 64);
  v48 = (unint64_t)(63 - v5) >> 6;
  v7 = (_QWORD *)v1[23];
  swift_bridgeObjectRetain();
  v8 = 0;
LABEL_5:
  while (2)
  {
    v1[25] = v7;
    if (v6)
    {
LABEL_6:
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_25;
    }
    while (1)
    {
      v11 = v8 + 1;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
        goto LABEL_49;
      }
      if (v11 >= v48)
        goto LABEL_45;
      v12 = *(_QWORD *)(v3 + 8 * v11);
      ++v8;
      if (!v12)
      {
        v8 = v11 + 1;
        if (v11 + 1 >= v48)
          goto LABEL_45;
        v12 = *(_QWORD *)(v3 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 2;
          if (v11 + 2 >= v48)
            goto LABEL_45;
          v12 = *(_QWORD *)(v3 + 8 * v8);
          if (!v12)
          {
            v8 = v11 + 3;
            if (v11 + 3 >= v48)
              goto LABEL_45;
            v12 = *(_QWORD *)(v3 + 8 * v8);
            if (!v12)
            {
              v8 = v11 + 4;
              if (v11 + 4 >= v48)
                goto LABEL_45;
              v12 = *(_QWORD *)(v3 + 8 * v8);
              if (!v12)
              {
                v13 = v11 + 5;
                if (v13 >= v48)
                {
LABEL_45:
                  swift_release();
                  swift_bridgeObjectRelease();
                  v41 = (_QWORD *)swift_task_alloc();
                  v1[24] = v41;
                  *v41 = v1;
                  v41[1] = sub_1AC77BBF0;
                  sub_1AC784708();
                  return;
                }
                v12 = *(_QWORD *)(v3 + 8 * v13);
                if (!v12)
                {
                  while (1)
                  {
                    v8 = v13 + 1;
                    if (__OFADD__(v13, 1))
                      break;
                    if (v8 >= v48)
                      goto LABEL_45;
                    v12 = *(_QWORD *)(v3 + 8 * v8);
                    ++v13;
                    if (v12)
                      goto LABEL_24;
                  }
LABEL_50:
                  __break(1u);
LABEL_51:
                  __break(1u);
                  return;
                }
                v8 = v13;
              }
            }
          }
        }
      }
LABEL_24:
      v6 = (v12 - 1) & v12;
      v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_25:
      v14 = *(_QWORD *)(v2 + 16);
      v15 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v10);
      v16 = v15;
      if (v14)
        break;
LABEL_28:
      swift_bridgeObjectRetain();
      v20 = sub_1AC77ECCC((uint64_t)v16);
      v22 = v21;
      swift_bridgeObjectRelease();
      if ((v22 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v46 = v7;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_1AC77FB20();
          v7 = (_QWORD *)*v46;
        }

        v24 = *(void **)(v7[7] + 8 * v20);
        sub_1AC77F678(v20, (uint64_t)v7);
        swift_bridgeObjectRelease();

        goto LABEL_5;
      }

      if (v6)
        goto LABEL_6;
    }
    v17 = v15;
    v18 = sub_1AC77ECCC((uint64_t)v17);
    if ((v19 & 1) == 0)
    {

      goto LABEL_28;
    }
    v44 = v1;
    v45 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v18);
    v25 = v45;

    v26 = swift_isUniquelyReferenced_nonNull_native();
    *v47 = v7;
    v28 = sub_1AC77ECCC((uint64_t)v17);
    v29 = v7[2];
    v30 = (v27 & 1) == 0;
    v31 = v29 + v30;
    if (__OFADD__(v29, v30))
    {
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    v32 = v27;
    if (v7[3] >= v31)
    {
      if ((v26 & 1) == 0)
        sub_1AC77FB20();
LABEL_40:
      v7 = (_QWORD *)*v47;
      if ((v32 & 1) != 0)
      {
        v35 = v7[7];

        *(_QWORD *)(v35 + 8 * v28) = v45;
      }
      else
      {
        v7[(v28 >> 6) + 8] |= 1 << v28;
        v36 = 8 * v28;
        *(_QWORD *)(v7[6] + v36) = v17;
        *(_QWORD *)(v7[7] + v36) = v45;
        v37 = v7[2];
        v38 = __OFADD__(v37, 1);
        v39 = v37 + 1;
        if (v38)
          goto LABEL_51;
        v7[2] = v39;
        v40 = v17;
      }
      swift_bridgeObjectRelease();

      v1 = v44;
      continue;
    }
    break;
  }
  sub_1AC77F3A8(v31, v26);
  v33 = sub_1AC77ECCC((uint64_t)v17);
  if ((v32 & 1) == (v34 & 1))
  {
    v28 = v33;
    goto LABEL_40;
  }
  sub_1AC783994();
  sub_1AC784864();
}

uint64_t sub_1AC77BBF0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v2 + 184) = *(_QWORD *)(v2 + 200);
  return swift_task_switch();
}

uint64_t sub_1AC77BC60()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC77BCC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)a4 + 176) + *(_QWORD *)(*(_QWORD *)a4 + 176));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_1AC77BD30;
  return v8(a1);
}

uint64_t sub_1AC77BD30()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AC77BD7C()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1AC77BDA0()
{
  uint64_t v0;

  type metadata accessor for SingleCallingActor();
  v0 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = sub_1AC77A018(MEMORY[0x1E0DEE9D8]);
  return v0;
}

unint64_t sub_1AC77BDE4()
{
  return sub_1AC779F18(MEMORY[0x1E0DEE9D8]);
}

uint64_t sub_1AC77BDF0()
{
  uint64_t v0;

  v0 = sub_1AC7845DC();
  __swift_allocate_value_buffer(v0, qword_1EEC97C38);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEC97C38);
  return sub_1AC7845D0();
}

uint64_t sub_1AC77BE68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EEC97B20 != -1)
    swift_once();
  v2 = sub_1AC7845DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EEC97C38);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

id TLKAsyncCache.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TLKAsyncCache.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v1 = OBJC_IVAR___TLKAsyncCache_cache;
  type metadata accessor for SingleCallingActor();
  v2 = swift_allocObject();
  v3 = v0;
  swift_defaultActor_initialize();
  v4 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + 112) = sub_1AC77A018(MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)&v0[v1] = v2;
  v5 = OBJC_IVAR___TLKAsyncCache_lookaheadCache;
  *(_QWORD *)&v3[v5] = sub_1AC779F18(v4);

  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for TLKAsyncCache();
  v6 = objc_msgSendSuper2(&v12, sel_init);
  v7 = (void *)objc_opt_self();
  v8 = v6;
  v9 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v8, sel_clear, *MEMORY[0x1E0DC4778], 0);

  v10 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v10, sel_addObserver_selector_name_object_, v8, sel_clear, *MEMORY[0x1E0DC4768], 0);

  return v8;
}

uint64_t sub_1AC77C068(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  sub_1AC7846CC();
  v3[6] = sub_1AC7846C0();
  sub_1AC78469C();
  return swift_task_switch();
}

uint64_t sub_1AC77C0D8()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t result;
  unint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  char v39;
  char v40;
  unint64_t v41;
  id v42;
  id v43;
  char isUniquelyReferenced_nonNull_native;
  char v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  id v57;
  unint64_t v58;
  void *v59;
  id v60;
  id v61;
  NSObject *v62;
  os_log_type_t v63;
  _BOOL4 v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  id v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  _QWORD *v86;
  os_log_t log;
  unint64_t v88;
  os_log_type_t type[8];
  os_log_type_t typea;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;

  v1 = v0;
  swift_release();
  if (qword_1EEC97B20 != -1)
    goto LABEL_42;
  while (1)
  {
    v2 = (uint64_t *)(v1 + 16);
    v88 = v1;
    v1 += 24;
    v3 = *(void **)(v1 + 16);
    v4 = sub_1AC7845DC();
    __swift_project_value_buffer(v4, (uint64_t)qword_1EEC97C38);
    v5 = v3;
    swift_bridgeObjectRetain_n();
    v6 = v5;
    v7 = sub_1AC7845C4();
    v8 = sub_1AC784714();
    v9 = os_log_type_enabled(v7, v8);
    v10 = *(void **)(v1 + 16);
    log = (os_log_t)v1;
    v79 = v2;
    if (v9)
    {
      v11 = swift_slowAlloc();
      v84 = (_QWORD *)swift_slowAlloc();
      v91 = swift_slowAlloc();
      v94 = (_QWORD *)v91;
      *(_DWORD *)v11 = 136315650;
      v12 = v10;
      v13 = objc_msgSend(v12, sel_description);
      v14 = sub_1AC7845E8();
      v16 = v15;

      v17 = v14;
      v1 = (unint64_t)log;
      *v2 = sub_1AC77E68C(v17, v16, (uint64_t *)&v94);
      sub_1AC784738();
      swift_bridgeObjectRelease();

      *(_WORD *)(v11 + 12) = 2112;
      v18 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
      *v2 = (uint64_t)v18;
      sub_1AC784738();
      *v84 = v18;
      *(_WORD *)(v11 + 22) = 2080;
      v19 = sub_1AC783994();
      v20 = swift_bridgeObjectRetain();
      v21 = MEMORY[0x1AF440AB0](v20, v19);
      v23 = v22;
      swift_bridgeObjectRelease();
      *v2 = sub_1AC77E68C(v21, v23, (uint64_t *)&v94);
      sub_1AC784738();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1AC747000, v7, v8, "[%s|%@]: Began lookahead update for %s", (uint8_t *)v11, 0x20u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
      swift_arrayDestroy();
      MEMORY[0x1AF441428](v84, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1AF441428](v91, -1, -1);
      MEMORY[0x1AF441428](v11, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    v82 = OBJC_IVAR___TLKAsyncCache_lookaheadCache;
    v83 = *(_QWORD *)(v88 + 40);
    v24 = *(_QWORD **)(v83 + OBJC_IVAR___TLKAsyncCache_lookaheadCache);
    v25 = *(_QWORD *)(v88 + 24);
    if (!(v25 >> 62))
    {
      v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      result = swift_bridgeObjectRetain();
      if (!v26)
        break;
      goto LABEL_7;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1AC784804();
    v26 = result;
    if (!result)
      break;
LABEL_7:
    v28 = v25 & 0xC000000000000001;
    if ((v25 & 0xC000000000000001) != 0)
    {
      v29 = (id)MEMORY[0x1AF440C00](0, *(_QWORD *)v1);
    }
    else
    {
      if (!*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return result;
      }
      v29 = *(id *)(*(_QWORD *)v1 + 32);
    }
    v30 = v29;
    v31 = *(_QWORD *)(v88 + 32);
    v85 = *(_QWORD *)(v31 + 16);
    if (!v85)
    {

      swift_bridgeObjectRelease();
      goto LABEL_45;
    }
    v32 = 0;
    v80 = *(_QWORD *)(v88 + 24) + 40;
    v81 = v25 & 0xFFFFFFFFFFFFFF8;
    *(_QWORD *)type = v26 - 1;
    v92 = v31 + 32;
    v33 = *(_QWORD *)(v31 + 16);
    while (1)
    {
      v35 = *(void **)(v92 + 8 * v32);
      if (!v35)
      {

        goto LABEL_31;
      }
      v36 = v24[2];
      v37 = v35;
      if (v36)
      {
        v38 = v30;
        sub_1AC77ECCC((uint64_t)v38);
        v40 = v39;

        if ((v40 & 1) != 0)
        {

          goto LABEL_31;
        }
      }
      v41 = v28;
      v42 = v37;
      v43 = v30;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v94 = v24;
      v1 = sub_1AC77ECCC((uint64_t)v43);
      v46 = v24[2];
      v47 = (v45 & 1) == 0;
      v48 = v46 + v47;
      if (__OFADD__(v46, v47))
        break;
      v49 = v45;
      if (v24[3] >= v48)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v52 = 8 * v1;
          if ((v45 & 1) == 0)
            goto LABEL_28;
        }
        else
        {
          sub_1AC77FB20();
          v24 = v94;
          v52 = 8 * v1;
          if ((v49 & 1) == 0)
            goto LABEL_28;
        }
      }
      else
      {
        sub_1AC77F3A8(v48, isUniquelyReferenced_nonNull_native);
        v24 = v94;
        v50 = sub_1AC77ECCC((uint64_t)v43);
        if ((v49 & 1) != (v51 & 1))
        {
          sub_1AC783994();
          return sub_1AC784864();
        }
        v1 = v50;
        v52 = 8 * v50;
        if ((v49 & 1) == 0)
        {
LABEL_28:
          v24[(v1 >> 6) + 8] |= 1 << v1;
          *(_QWORD *)(v24[6] + v52) = v43;
          *(_QWORD *)(v24[7] + v52) = v35;
          v54 = v24[2];
          v55 = __OFADD__(v54, 1);
          v56 = v54 + 1;
          if (v55)
            goto LABEL_41;
          v24[2] = v56;
          v57 = v43;
          goto LABEL_30;
        }
      }
      v53 = v24[7];

      *(_QWORD *)(v53 + v52) = v35;
LABEL_30:
      swift_bridgeObjectRelease();

      v33 = v85;
      v1 = (unint64_t)log;
      v28 = v41;
LABEL_31:
      if (*(_QWORD *)type == v32)
        goto LABEL_44;
      v58 = v32 + 1;
      if (v28)
      {
        v34 = (id)MEMORY[0x1AF440C00](v32 + 1, *(_QWORD *)v1);
      }
      else
      {
        if (v58 >= *(_QWORD *)(v81 + 16))
          goto LABEL_40;
        v34 = *(id *)(v80 + 8 * v32);
      }
      v30 = v34;
      ++v32;
      if (v33 == v58)
      {

        goto LABEL_44;
      }
    }
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    swift_once();
  }
LABEL_44:
  swift_bridgeObjectRelease();
LABEL_45:
  swift_bridgeObjectRelease();
  v59 = *(void **)(v88 + 40);
  *(_QWORD *)(v83 + v82) = v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v60 = v59;
  swift_bridgeObjectRetain_n();
  v61 = v60;
  v62 = sub_1AC7845C4();
  v63 = sub_1AC784714();
  v64 = os_log_type_enabled(v62, v63);
  v65 = *(void **)(v88 + 40);
  if (v64)
  {
    v66 = swift_slowAlloc();
    v86 = (_QWORD *)swift_slowAlloc();
    v93 = swift_slowAlloc();
    v94 = (_QWORD *)v93;
    *(_DWORD *)v66 = 136315650;
    typea = v63;
    v67 = v65;
    v68 = objc_msgSend(v67, sel_description);
    v69 = sub_1AC7845E8();
    v71 = v70;

    *v79 = sub_1AC77E68C(v69, v71, (uint64_t *)&v94);
    sub_1AC784738();
    swift_bridgeObjectRelease();

    *(_WORD *)(v66 + 12) = 2112;
    v72 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    *v79 = (uint64_t)v72;
    sub_1AC784738();
    *v86 = v72;
    *(_WORD *)(v66 + 22) = 2080;
    v73 = sub_1AC783994();
    v74 = swift_bridgeObjectRetain();
    v75 = MEMORY[0x1AF440AB0](v74, v73);
    v77 = v76;
    swift_bridgeObjectRelease();
    *v79 = sub_1AC77E68C(v75, v77, (uint64_t *)&v94);
    sub_1AC784738();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AC747000, v62, typea, "[%s|%@]: Completed lookahead update for %s", (uint8_t *)v66, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v86, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v93, -1, -1);
    MEMORY[0x1AF441428](v66, -1, -1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }

  v78 = *(_QWORD *)(v83 + v82);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v88 + 8))(v78);
}

void *sub_1AC77C9DC(void *a1)
{
  void *v1;
  uint64_t v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  char v22;
  void *v23;
  id v24;
  uint64_t v26;
  char *v27;
  uint64_t v28;

  if (qword_1EEC97B20 != -1)
    swift_once();
  v3 = sub_1AC7845DC();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EEC97C38);
  v4 = v1;
  v5 = a1;
  v6 = (char *)v4;
  v7 = v5;
  v8 = sub_1AC7845C4();
  v9 = sub_1AC784714();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v28 = v26;
    *(_DWORD *)v10 = 136315650;
    v12 = v6;
    v13 = objc_msgSend(v12, sel_description);
    v14 = sub_1AC7845E8();
    v27 = v6;
    v16 = v15;

    sub_1AC77E68C(v14, v16, &v28);
    sub_1AC784738();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2112;
    v17 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    sub_1AC784738();
    *v11 = v17;
    *(_WORD *)(v10 + 22) = 2112;
    v18 = v7;
    v6 = v27;
    sub_1AC784738();
    v11[1] = v7;

    _os_log_impl(&dword_1AC747000, v8, v9, "[%s|%@]: Get lookahead value for %@", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v11, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v26, -1, -1);
    MEMORY[0x1AF441428](v10, -1, -1);

  }
  else
  {

  }
  v19 = *(_QWORD *)&v6[OBJC_IVAR___TLKAsyncCache_lookaheadCache];
  if (!*(_QWORD *)(v19 + 16))
    return 0;
  v20 = v7;
  swift_bridgeObjectRetain();
  v21 = sub_1AC77ECCC((uint64_t)v20);
  if ((v22 & 1) != 0)
  {
    v23 = *(void **)(*(_QWORD *)(v19 + 56) + 8 * v21);
    v24 = v23;
  }
  else
  {
    v23 = 0;
  }

  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_1AC77CD38(void *a1, void (*a2)(void), uint64_t a3)
{
  char *v3;
  uint64_t v7;
  id v8;
  unint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97290);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1AC789B20;
  *(_QWORD *)(v7 + 32) = a1;
  v10 = v7;
  sub_1AC784630();
  sub_1AC782AA8((uint64_t)a2);
  v8 = a1;
  sub_1AC781778(v10, v3, a2, a3);
  sub_1AC783A00((uint64_t)a2);
  return swift_bridgeObjectRelease();
}

void sub_1AC77CDE4(unint64_t a1, void (*a2)(void))
{
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  if (!a2)
    return;
  v4 = a1 >> 62;
  if (a1)
  {
    if (v4)
    {
      swift_bridgeObjectRetain();
      v5 = (void *)sub_1AC784804();
      if (v5)
        goto LABEL_5;
    }
    else
    {
      v5 = *(void **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_5:
        if ((a1 & 0xC000000000000001) != 0)
        {
          v6 = (id)MEMORY[0x1AF440C00](0, a1);
        }
        else
        {
          if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_31;
          }
          v6 = *(id *)(a1 + 32);
        }
        v5 = v6;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v5 = 0;
LABEL_12:
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
  v8 = v7;
  if (v5)
  {
    sub_1AC783994();
    v9 = v5;
    v10 = sub_1AC78472C();

    v11 = 0;
    if (!a1 || (v10 & 1) != 0)
      goto LABEL_28;
  }
  else
  {

    if (!a1)
    {
LABEL_27:
      v11 = 0;
      goto LABEL_28;
    }
  }
  if (!v4)
  {
    v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12)
      goto LABEL_19;
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  if (!sub_1AC784804())
  {
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
LABEL_19:
  if ((a1 & 0xC000000000000001) != 0)
  {
LABEL_31:
    v13 = (id)MEMORY[0x1AF440C00](0, a1);
    goto LABEL_22;
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v13 = *(id *)(a1 + 32);
LABEL_22:
    v14 = v13;
    swift_bridgeObjectRelease();
    v11 = v14;
LABEL_28:
    v15 = v11;
    a2();

    return;
  }
  __break(1u);
}

uint64_t sub_1AC77D0D4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  void (*v8)(uint64_t *);

  if (a2)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = a2;
    *(_QWORD *)(v7 + 24) = a3;
    v8 = (void (*)(uint64_t *))sub_1AC782ADC;
  }
  else
  {
    v7 = 0;
    v8 = (void (*)(uint64_t *))nullsub_1;
  }
  swift_retain();
  sub_1AC782AA8(a2);
  sub_1AC782110(a1, v3, v8, v7);
  return swift_release_n();
}

void sub_1AC77D27C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
  {
    sub_1AC783994();
    v3 = sub_1AC78460C();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_1AC77D2DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  sub_1AC7846CC();
  v7[10] = sub_1AC7846C0();
  v7[11] = sub_1AC78469C();
  v7[12] = v8;
  return swift_task_switch();
}

uint64_t sub_1AC77D34C()
{
  int8x16_t *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int8x16_t *v22;
  int8x16_t v23;
  _QWORD *v25;
  os_log_type_t type;
  NSObject *log;
  uint64_t v28;
  uint64_t v29;

  if (qword_1EEC97B20 != -1)
    swift_once();
  v1 = (void *)v0[3].i64[0];
  v2 = sub_1AC7845DC();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EEC97C38);
  v3 = v1;
  swift_bridgeObjectRetain_n();
  v4 = v3;
  v5 = sub_1AC7845C4();
  v6 = sub_1AC784714();
  v7 = os_log_type_enabled(v5, v6);
  v8 = (void *)v0[3].i64[0];
  if (v7)
  {
    log = v5;
    v9 = swift_slowAlloc();
    v25 = (_QWORD *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v29 = v28;
    *(_DWORD *)v9 = 136315650;
    v10 = v8;
    type = v6;
    v11 = objc_msgSend(v10, sel_description);
    v12 = sub_1AC7845E8();
    v14 = v13;

    v0[1].i64[1] = sub_1AC77E68C(v12, v14, &v29);
    sub_1AC784738();
    swift_bridgeObjectRelease();

    *(_WORD *)(v9 + 12) = 2112;
    v15 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    v0[2].i64[0] = (uint64_t)v15;
    sub_1AC784738();
    *v25 = v15;
    *(_WORD *)(v9 + 22) = 2080;
    v16 = sub_1AC783994();
    v17 = swift_bridgeObjectRetain();
    v18 = MEMORY[0x1AF440AB0](v17, v16);
    v20 = v19;
    swift_bridgeObjectRelease();
    v0[2].i64[1] = sub_1AC77E68C(v18, v20, &v29);
    sub_1AC784738();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AC747000, log, type, "[%s|%@]: Dispatching cache task for %s", (uint8_t *)v9, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v28, -1, -1);
    MEMORY[0x1AF441428](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v21 = *(_QWORD *)(v0[3].i64[0] + OBJC_IVAR___TLKAsyncCache_cache);
  v22 = (int8x16_t *)swift_task_alloc();
  v0[6].i64[1] = (uint64_t)v22;
  v22->i64[0] = (uint64_t)v0;
  v22->i64[1] = (uint64_t)sub_1AC77D6B4;
  v23 = v0[3];
  v22[5].i64[0] = v21;
  v22[4] = vextq_s8(v23, v23, 8uLL);
  return swift_task_switch();
}

uint64_t sub_1AC77D6B4(uint64_t a1)
{
  uint64_t **v1;
  _QWORD *v3;
  uint64_t *v5;

  v5 = *v1;
  v5[14] = a1;
  swift_task_dealloc();
  v3 = (_QWORD *)swift_task_alloc();
  v5[15] = (uint64_t)v3;
  *v3 = v5;
  v3[1] = sub_1AC77D728;
  return sub_1AC77C068(v5[7], a1);
}

uint64_t sub_1AC77D728(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1AC77D788()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(void (**)(uint64_t))(v0 + 64);
  swift_release();
  swift_bridgeObjectRetain();
  v4 = sub_1AC7815E4(v2, v1);
  swift_bridgeObjectRelease_n();
  v3(v4);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC77D810(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1AC7846F0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1AC7846E4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1AC7838E4(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AC78469C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1AC77D954()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97298);
  MEMORY[0x1E0C80A78](v1, v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1AC7846F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  sub_1AC7846CC();
  v6 = v0;
  v7 = sub_1AC7846C0();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x1E0DF06E8];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = v6;
  sub_1AC77D810((uint64_t)v4, (uint64_t)&unk_1EEC977A8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_1AC77DA30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[6] = a4;
  sub_1AC7846CC();
  v4[7] = sub_1AC7846C0();
  v4[8] = sub_1AC78469C();
  v4[9] = v5;
  return swift_task_switch();
}

uint64_t sub_1AC77DA9C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  if (qword_1EEC97B20 != -1)
    swift_once();
  v1 = (void *)v0[6];
  v2 = sub_1AC7845DC();
  v0[10] = __swift_project_value_buffer(v2, (uint64_t)qword_1EEC97C38);
  v3 = v1;
  v4 = sub_1AC7845C4();
  v5 = sub_1AC784714();
  v6 = os_log_type_enabled(v4, v5);
  v7 = (void *)v0[6];
  if (v6)
  {
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v19 = v18;
    *(_DWORD *)v8 = 136315394;
    v10 = v7;
    v11 = objc_msgSend(v10, sel_description);
    v12 = sub_1AC7845E8();
    v14 = v13;

    v0[2] = sub_1AC77E68C(v12, v14, &v19);
    sub_1AC784738();
    swift_bridgeObjectRelease();

    *(_WORD *)(v8 + 12) = 2112;
    v15 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    v0[2] = v15;
    sub_1AC784738();
    *v9 = v15;
    _os_log_impl(&dword_1AC747000, v4, v5, "[%s|%@]: Clearing lookahead", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v18, -1, -1);
    MEMORY[0x1AF441428](v8, -1, -1);
  }
  else
  {

  }
  v16 = v0[6];
  *(_QWORD *)(v16 + OBJC_IVAR___TLKAsyncCache_lookaheadCache) = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  v0[11] = *(_QWORD *)(v16 + OBJC_IVAR___TLKAsyncCache_cache);
  return swift_task_switch();
}

uint64_t sub_1AC77DD34()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_beginAccess();
  *(_QWORD *)(v1 + 112) = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1AC77DD90()
{
  uint64_t v0;
  void *v1;
  id *v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = (id *)(v0 + 48);
  v1 = *(void **)(v0 + 48);
  swift_release();
  v3 = v1;
  v4 = sub_1AC7845C4();
  v5 = sub_1AC784714();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 48);
    v7 = swift_slowAlloc();
    v16 = (_QWORD *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v18 = v17;
    *(_DWORD *)v7 = 136315394;
    v8 = v6;
    v9 = objc_msgSend(v8, sel_description);
    v10 = sub_1AC7845E8();
    v12 = v11;

    *(_QWORD *)(v0 + 40) = sub_1AC77E68C(v10, v12, &v18);
    sub_1AC784738();
    swift_bridgeObjectRelease();

    *(_WORD *)(v7 + 12) = 2112;
    v13 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    *(_QWORD *)(v0 + 40) = v13;
    sub_1AC784738();
    *v16 = v13;
    _os_log_impl(&dword_1AC747000, v4, v5, "[%s|%@]: Cleared cache", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v16, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v17, -1, -1);
    MEMORY[0x1AF441428](v7, -1, -1);
  }
  else
  {
    v14 = *v2;

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id TLKAsyncCache.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TLKAsyncCache();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t TLKAsyncCache.computeObject(forKey:)()
{
  uint64_t v0;

  sub_1AC7846CC();
  *(_QWORD *)(v0 + 16) = sub_1AC7846C0();
  sub_1AC78469C();
  return swift_task_switch();
}

uint64_t sub_1AC77E174()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1AC77E2D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = sub_1AC7846CC();
  v3[6] = sub_1AC7846C0();
  sub_1AC78469C();
  return swift_task_switch();
}

uint64_t sub_1AC77E34C()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;

  v1 = (const void *)v0[3];
  v2 = (void *)v0[4];
  v3 = (void *)v0[2];
  swift_release();
  v0[7] = _Block_copy(v1);
  v4 = v3;
  v5 = v2;
  v0[8] = sub_1AC7846C0();
  sub_1AC78469C();
  return swift_task_switch();
}

uint64_t sub_1AC77E3D4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(void **)(v0 + 32);
  v3 = *(void **)(v0 + 16);
  swift_release();

  if (v1)
  {
    v4 = *(void (***)(_QWORD, _QWORD))(v0 + 56);
    v4[2](v4, 0);
    _Block_release(v4);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AC77E43C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1AC7845A8;
  return v6(a1);
}

uint64_t sub_1AC77E4A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1AC7845A0;
  return v6();
}

uint64_t sub_1AC77E4F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1AC7845A0;
  return v7();
}

uint64_t sub_1AC77E548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1AC7846F0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1AC7846E4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1AC7838E4(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AC78469C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1AC77E68C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1AC77E75C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1AC7844E4((uint64_t)v12, *a3);
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
      sub_1AC7844E4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1AC77E75C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1AC784744();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1AC77E914(a5, a6);
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
  v8 = sub_1AC784780();
  if (!v8)
  {
    sub_1AC7847F8();
    __break(1u);
LABEL_17:
    result = sub_1AC784840();
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

uint64_t sub_1AC77E914(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1AC77E9A8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1AC77EB80(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1AC77EB80(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1AC77E9A8(uint64_t a1, unint64_t a2)
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
      v3 = sub_1AC77EB1C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1AC78475C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1AC7847F8();
      __break(1u);
LABEL_10:
      v2 = sub_1AC7845F4();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1AC784840();
    __break(1u);
LABEL_14:
    result = sub_1AC7847F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1AC77EB1C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97288);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1AC77EB80(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97288);
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
  result = sub_1AC784840();
  __break(1u);
  return result;
}

unint64_t sub_1AC77ECCC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AC784720();
  return sub_1AC77ECFC(a1, v2);
}

unint64_t sub_1AC77ECFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_1AC783994();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_1AC78472C();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_1AC78472C();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_1AC77EE04(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = sub_1AC7847D4();
  if (!__OFADD__(result, 1))
  {
    *v3 = sub_1AC77EEA4(v7, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_1AC77F828(a1, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC77EEA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972E8);
    v2 = sub_1AC784828();
    v18 = v2;
    sub_1AC7847C8();
    v3 = sub_1AC7847EC();
    if (v3)
    {
      v4 = v3;
      sub_1AC783994();
      do
      {
        swift_dynamicCast();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972A0);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_1AC77F0D4(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_1AC784720();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_1AC7847EC();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  return v2;
}

uint64_t sub_1AC77F0D4(uint64_t a1, char a2)
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
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972E8);
  v6 = sub_1AC78481C();
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
          if ((a2 & 1) == 0)
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
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      swift_retain();
    }
    result = sub_1AC784720();
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
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
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

uint64_t sub_1AC77F3A8(uint64_t a1, char a2)
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
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972F8);
  v6 = sub_1AC78481C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
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
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
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
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v32;
      v34 = v31;
    }
    result = sub_1AC784720();
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
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_1AC77F678(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_1AC784750();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_1AC784720();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

id sub_1AC77F828(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_1AC77ECCC((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_1AC77F978();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_release();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_1AC77F0D4(v12, a3 & 1);
  v18 = sub_1AC77ECCC((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1AC783994();
  result = (id)sub_1AC784864();
  __break(1u);
  return result;
}

void *sub_1AC77F978()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972E8);
  v2 = *v0;
  v3 = sub_1AC784810();
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_retain();
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

id sub_1AC77FB20()
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
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972F8);
  v2 = *v0;
  v3 = sub_1AC784810();
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
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v18;
    result = v17;
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

uint64_t type metadata accessor for ComputationTracker(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ComputationTracker);
}

uint64_t sub_1AC77FCD0(uint64_t a1)
{
  uint64_t v1;

  return sub_1AC779CB8(a1, v1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t type metadata accessor for SingleCallingActor()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for TLKAsyncCache()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF441398]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1AC77FD70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return swift_task_switch();
}

uint64_t sub_1AC77FD8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = sub_1AC78060C(*(_QWORD *)(v0 + 64), *(_QWORD **)(v0 + 72), *(uint64_t **)(v0 + 80));
  *(_QWORD *)(v0 + 88) = v1;
  if (qword_1EEC97B20 != -1)
    swift_once();
  v2 = sub_1AC7845DC();
  *(_QWORD *)(v0 + 96) = __swift_project_value_buffer(v2, (uint64_t)qword_1EEC97C38);
  swift_bridgeObjectRetain_n();
  v3 = sub_1AC7845C4();
  v4 = sub_1AC784714();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v16 = (_QWORD *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v19 = v17;
    *(_DWORD *)v5 = 138412546;
    v18 = v1;
    v6 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    *(_QWORD *)(v0 + 48) = v6;
    sub_1AC784738();
    *v16 = v6;
    *(_WORD *)(v5 + 12) = 2080;
    v7 = sub_1AC783994();
    v8 = swift_bridgeObjectRetain();
    v9 = MEMORY[0x1AF440AB0](v8, v7);
    v11 = v10;
    swift_bridgeObjectRelease();
    v12 = v9;
    v1 = v18;
    *(_QWORD *)(v0 + 56) = sub_1AC77E68C(v12, v11, &v19);
    sub_1AC784738();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AC747000, v3, v4, "[%@]: Dispatching trackers for %s", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v16, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v17, -1, -1);
    MEMORY[0x1AF441428](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972C0);
  sub_1AC783B54();
  v13 = swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v13;
  *(_QWORD *)(v13 + 16) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC978A8);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v14;
  *v14 = v0;
  v14[1] = sub_1AC7800AC;
  return sub_1AC78484C();
}

uint64_t sub_1AC7800AC()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0)

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1AC780148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain_n();
  v3 = sub_1AC7845C4();
  v4 = sub_1AC784714();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v19 = v18;
    *(_DWORD *)v5 = 138412546;
    v6 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    *(_QWORD *)(v1 + 32) = v6;
    sub_1AC784738();
    *v17 = v6;
    *(_WORD *)(v5 + 12) = 2080;
    v7 = sub_1AC783994();
    v8 = swift_bridgeObjectRetain();
    v9 = MEMORY[0x1AF440AB0](v8, v7);
    v10 = v3;
    v11 = v2;
    v13 = v12;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 40) = sub_1AC77E68C(v9, v13, &v19);
    sub_1AC784738();
    v2 = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AC747000, v10, v4, "[%@]: Completed trackers for %s", (uint8_t *)v5, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v18, -1, -1);
    MEMORY[0x1AF441428](v5, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v14 = *(_QWORD *)(v1 + 64);
  swift_bridgeObjectRetain();
  v15 = sub_1AC781460(v14, v2);
  swift_bridgeObjectRelease_n();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v15);
}

uint64_t sub_1AC7803C8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  swift_bridgeObjectRetain_n();
  v1 = sub_1AC7845C4();
  v2 = sub_1AC784714();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v14 = v13;
    *(_DWORD *)v3 = 138412546;
    v4 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    *(_QWORD *)(v0 + 32) = v4;
    sub_1AC784738();
    *v12 = v4;
    *(_WORD *)(v3 + 12) = 2080;
    v5 = sub_1AC783994();
    v6 = swift_bridgeObjectRetain();
    v7 = MEMORY[0x1AF440AB0](v6, v5);
    v9 = v8;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 40) = sub_1AC77E68C(v7, v9, &v14);
    sub_1AC784738();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AC747000, v1, v2, "[%@]: Completed trackers for %s", (uint8_t *)v3, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v12, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v13, -1, -1);
    MEMORY[0x1AF441428](v3, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v10 = sub_1AC781460(*(_QWORD *)(v0 + 64), 0);
  swift_bridgeObjectRelease_n();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_1AC78060C(unint64_t a1, _QWORD *a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  unint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v46;
  char v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  char v51;
  unint64_t v52;
  char v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t result;
  _QWORD v63[6];
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  uint64_t v73[3];

  swift_retain();
  v6 = swift_bridgeObjectRetain();
  v7 = 0;
  v8 = sub_1AC780E48(v6, a3);
  swift_bridgeObjectRelease();
  swift_release();
  if (qword_1EEC97B20 != -1)
LABEL_43:
    swift_once();
  v9 = sub_1AC7845DC();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1EEC97C38);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_1AC7845C4();
  v12 = sub_1AC784714();
  v13 = v8 >> 62;
  v71 = v8;
  if (os_log_type_enabled(v11, v12))
  {
    v70 = v10;
    v68 = (uint64_t)a2;
    v14 = swift_slowAlloc();
    v15 = (_QWORD *)swift_slowAlloc();
    v65 = swift_slowAlloc();
    v73[0] = v65;
    *(_DWORD *)v14 = 138412802;
    v72 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    sub_1AC784738();
    *v15 = v72;
    *(_WORD *)(v14 + 12) = 2048;
    v66 = v8 >> 62;
    v67 = v7;
    v69 = a3;
    if (v13)
    {
      swift_bridgeObjectRetain();
      sub_1AC784804();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1AC784738();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2080;
    v16 = sub_1AC783994();
    v17 = swift_bridgeObjectRetain();
    v18 = MEMORY[0x1AF440AB0](v17, v16);
    v20 = v19;
    swift_bridgeObjectRelease();
    v72 = (_QWORD *)sub_1AC77E68C(v18, v20, v73);
    v8 = v71;
    sub_1AC784738();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC747000, v11, v12, "[%@]: Found %ld unfetched keys for %s", (uint8_t *)v14, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v15, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v65, -1, -1);
    MEMORY[0x1AF441428](v14, -1, -1);

    a2 = (_QWORD *)v68;
    a3 = v69;
    v13 = v66;
    v7 = v67;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  if (v13)
  {
    swift_bridgeObjectRetain();
    v21 = sub_1AC784804();
    swift_bridgeObjectRelease();
    if (!v21)
      goto LABEL_38;
  }
  else
  {
    v21 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v21)
    {
LABEL_38:
      v60 = swift_bridgeObjectRelease();
      MEMORY[0x1E0C80A78](v60, v61);
      v63[2] = a3;
      v63[3] = a1;
      v63[4] = a2;
      return sub_1AC77B1E8((void (*)(uint64_t *__return_ptr, id *))sub_1AC783D48, (uint64_t)v63, a1);
    }
  }
  if ((objc_msgSend(a2, sel_respondsToSelector_, sel_computeObjectsForKeys_completionHandler_, v64) & 1) == 0)
    goto LABEL_38;
  v69 = a3;
  v70 = v21;
  swift_bridgeObjectRetain_n();
  v22 = sub_1AC7845C4();
  v23 = sub_1AC784714();
  v64 = a1;
  v67 = v7;
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = (_QWORD *)swift_slowAlloc();
    v68 = swift_slowAlloc();
    v73[0] = v68;
    *(_DWORD *)v24 = 138412546;
    v26 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    sub_1AC784738();
    *v25 = v26;
    *(_WORD *)(v24 + 12) = 2080;
    v27 = sub_1AC783994();
    v28 = swift_bridgeObjectRetain();
    v29 = MEMORY[0x1AF440AB0](v28, v27);
    v30 = a2;
    v32 = v31;
    swift_bridgeObjectRelease();
    v72 = (_QWORD *)sub_1AC77E68C(v29, v32, v73);
    v8 = v71;
    sub_1AC784738();
    swift_bridgeObjectRelease_n();
    a2 = v30;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC747000, v22, v23, "[%@]: Creating combined ComputationTracker for %s", (uint8_t *)v24, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v25, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v68, -1, -1);
    MEMORY[0x1AF441428](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 16) = v8;
  *(_QWORD *)(v33 + 24) = a2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972A0);
  v34 = a2;
  a2 = (_QWORD *)swift_allocObject();
  swift_bridgeObjectRetain();
  v68 = (uint64_t)v34;
  v35 = v34;
  swift_defaultActor_initialize();
  v36 = MEMORY[0x1E0DEE9D8];
  a2[14] = 0;
  a2[15] = &unk_1EEC978D8;
  a3 = v69 + 14;
  a2[16] = v33;
  a2[17] = v36;
  v7 = v8 & 0xC000000000000001;
  a1 = 4;
  while (1)
  {
    if (v7)
      v38 = (id)MEMORY[0x1AF440C00](a1 - 4, v8);
    else
      v38 = *(id *)(v8 + 8 * a1);
    v39 = v38;
    v40 = a1 - 3;
    if (__OFADD__(a1 - 4, 1))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    swift_beginAccess();
    v41 = *a3;
    if ((*a3 & 0xC000000000000001) != 0)
    {
      if (v41 >= 0)
        v41 &= 0xFFFFFFFFFFFFFF8uLL;
      v42 = v39;
      swift_retain();
      v43 = sub_1AC7847D4();
      if (__OFADD__(v43, 1))
        goto LABEL_41;
      *a3 = sub_1AC77EEA4(v41, v43 + 1);
    }
    else
    {
      v44 = v39;
      swift_retain();
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v72 = (_QWORD *)*a3;
    v46 = v72;
    *a3 = 0x8000000000000000;
    v8 = sub_1AC77ECCC((uint64_t)v39);
    v48 = v46[2];
    v49 = (v47 & 1) == 0;
    v50 = v48 + v49;
    if (__OFADD__(v48, v49))
      goto LABEL_40;
    v51 = v47;
    if (v46[3] < v50)
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v54 = v72;
      if ((v47 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      sub_1AC77F978();
      v54 = v72;
      if ((v51 & 1) != 0)
      {
LABEL_14:
        v37 = v54[7];
        swift_release();
        *(_QWORD *)(v37 + 8 * v8) = a2;
        goto LABEL_15;
      }
    }
LABEL_33:
    v54[(v8 >> 6) + 8] |= 1 << v8;
    v55 = 8 * v8;
    *(_QWORD *)(v54[6] + v55) = v39;
    *(_QWORD *)(v54[7] + v55) = a2;
    v56 = v54[2];
    v57 = __OFADD__(v56, 1);
    v58 = v56 + 1;
    if (v57)
      goto LABEL_42;
    v54[2] = v58;
    v59 = v39;
LABEL_15:
    *a3 = (uint64_t)v54;

    swift_bridgeObjectRelease();
    swift_endAccess();

    ++a1;
    v8 = v71;
    if (v40 == v70)
    {
      swift_release();
      a1 = v64;
      a2 = (_QWORD *)v68;
      a3 = v69;
      goto LABEL_38;
    }
  }
  sub_1AC77F0D4(v50, isUniquelyReferenced_nonNull_native);
  v52 = sub_1AC77ECCC((uint64_t)v39);
  if ((v51 & 1) == (v53 & 1))
  {
    v8 = v52;
    v54 = v72;
    if ((v51 & 1) != 0)
      goto LABEL_14;
    goto LABEL_33;
  }
  sub_1AC783994();
  result = sub_1AC784864();
  __break(1u);
  return result;
}

uint64_t sub_1AC780E48(unint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t i;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v16 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_25;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v14 = a2 + 14;
  swift_beginAccess();
  if (v4)
  {
    for (i = 0; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = (id)MEMORY[0x1AF440C00](i, a1);
      }
      else
      {
        if (i >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_24:
          __break(1u);
LABEL_25:
          v4 = sub_1AC784804();
          goto LABEL_3;
        }
        v6 = *(id *)(a1 + 8 * i + 32);
      }
      v7 = v6;
      v8 = i + 1;
      if (__OFADD__(i, 1))
        goto LABEL_24;
      v9 = *v14;
      if ((*v14 & 0xC000000000000001) != 0)
      {
        a2 = (uint64_t *)v6;
        swift_bridgeObjectRetain();
        if (!sub_1AC7847E0())
          goto LABEL_5;
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972A0);
        swift_dynamicCast();
        v10 = v15;
        swift_unknownObjectRelease();
      }
      else
      {
        if (!*(_QWORD *)(v9 + 16))
          goto LABEL_6;
        a2 = (uint64_t *)v6;
        swift_bridgeObjectRetain();
        v11 = sub_1AC77ECCC((uint64_t)a2);
        if ((v12 & 1) == 0)
        {
LABEL_5:

          swift_bridgeObjectRelease();
          goto LABEL_6;
        }
        v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v11);
        swift_retain();
      }

      swift_bridgeObjectRelease();
      if (v10)
      {

        swift_release();
        goto LABEL_7;
      }
LABEL_6:
      sub_1AC78478C();
      a2 = *(uint64_t **)(v16 + 16);
      sub_1AC7847B0();
      sub_1AC7847BC();
      sub_1AC784798();
LABEL_7:
      if (v8 == v4)
        return v16;
    }
  }
  return MEMORY[0x1E0DEE9D8];
}

void sub_1AC78107C(uint64_t a1, uint64_t a2, char a3, _QWORD *a4)
{
  unint64_t v4;
  void *v5;
  char v6;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  char v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  void *v32;
  _QWORD *v33;
  id v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  char v41;
  _QWORD *v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v11 = sub_1AC784804();
    swift_bridgeObjectRelease();
    if (!v11)
      goto LABEL_26;
  }
  else
  {
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!v11)
      goto LABEL_26;
  }
  v56 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x1AF440C00](0, a1);
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }
    v12 = *(id *)(a1 + 32);
  }
  v5 = v12;
  if (!*(_QWORD *)(a2 + 16))
  {
LABEL_32:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
  v51 = *(_QWORD *)(a2 + 16);
  v13 = (_QWORD *)*a4;
  v54 = *(void **)(a2 + 32);
  v53 = v54;
  v4 = sub_1AC77ECCC((uint64_t)v5);
  v15 = v13[2];
  v16 = (v14 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v6 = v14;
  if (v13[3] >= v17)
  {
    if ((a3 & 1) != 0)
    {
      v20 = (_QWORD *)*a4;
      if ((v14 & 1) != 0)
        goto LABEL_14;
      goto LABEL_24;
    }
LABEL_23:
    sub_1AC77FB20();
    v20 = (_QWORD *)*a4;
    if ((v6 & 1) != 0)
    {
LABEL_14:
      v21 = 8 * v4;
      v22 = *(void **)(v20[7] + v21);
      v23 = v22;

      v24 = v20[7];
      *(_QWORD *)(v24 + v21) = v22;
      if (v11 != 1)
      {
LABEL_27:
        if (v56)
        {
          v29 = (id)MEMORY[0x1AF440C00](1, a1);
        }
        else
        {
          if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          {
LABEL_49:
            __break(1u);
            goto LABEL_50;
          }
          v29 = *(id *)(a1 + 40);
        }
        v5 = v29;
        v55 = v51 - 1;
        if (v51 == 1)
          goto LABEL_32;
        v30 = 0;
        v52 = v11 - 2;
        while (1)
        {
          v32 = *(void **)(a2 + 40 + 8 * v30);
          v33 = (_QWORD *)*a4;
          v34 = v32;
          v35 = sub_1AC77ECCC((uint64_t)v5);
          v37 = v33[2];
          v38 = (v36 & 1) == 0;
          v27 = __OFADD__(v37, v38);
          v39 = v37 + v38;
          if (v27)
            goto LABEL_47;
          v40 = v36;
          if (v33[3] < v39)
          {
            sub_1AC77F3A8(v39, 1);
            v35 = sub_1AC77ECCC((uint64_t)v5);
            if ((v40 & 1) != (v41 & 1))
              goto LABEL_50;
          }
          v42 = (_QWORD *)*a4;
          if ((v40 & 1) != 0)
          {
            v43 = 8 * v35;
            v44 = *(void **)(v42[7] + 8 * v35);
            v45 = v44;

            v46 = v42[7];
            *(_QWORD *)(v46 + v43) = v44;
          }
          else
          {
            v42[(v35 >> 6) + 8] |= 1 << v35;
            v47 = 8 * v35;
            *(_QWORD *)(v42[6] + v47) = v5;
            *(_QWORD *)(v42[7] + v47) = v32;
            v48 = v42[2];
            v27 = __OFADD__(v48, 1);
            v49 = v48 + 1;
            if (v27)
              goto LABEL_48;
            v42[2] = v49;
          }
          if (v52 == v30)
            break;
          v50 = v30 + 2;
          if (v56)
          {
            v31 = (id)MEMORY[0x1AF440C00](v50, a1);
          }
          else
          {
            if (v50 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_49;
            v31 = *(id *)(a1 + 8 * v30 + 48);
          }
          v5 = v31;
          if (v55 == ++v30)
            goto LABEL_32;
        }
      }
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
LABEL_24:
    v20[(v4 >> 6) + 8] |= 1 << v4;
    v25 = 8 * v4;
    *(_QWORD *)(v20[6] + v25) = v5;
    *(_QWORD *)(v20[7] + v25) = v54;
    v26 = v20[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_48:
      __break(1u);
      goto LABEL_49;
    }
    v20[2] = v28;
    if (v11 == 1)
      goto LABEL_26;
    goto LABEL_27;
  }
  sub_1AC77F3A8(v17, a3 & 1);
  v18 = sub_1AC77ECCC((uint64_t)v5);
  if ((v6 & 1) == (v19 & 1))
  {
    v4 = v18;
    v20 = (_QWORD *)*a4;
    if ((v6 & 1) == 0)
      goto LABEL_24;
    goto LABEL_14;
  }
LABEL_50:
  sub_1AC783994();
  sub_1AC784864();
  __break(1u);
}

uint64_t sub_1AC781460(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  id v8;
  unint64_t v9;
  char v10;
  id v11;
  uint64_t v12;

  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    v4 = sub_1AC784804();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = MEMORY[0x1E0DEE9D8];
  if (v4)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    result = sub_1AC7847A4();
    if ((v4 & 0x8000000000000000) == 0)
    {
      v6 = 0;
      while (1)
      {
        if (v4 == v6)
        {
          __break(1u);
          goto LABEL_19;
        }
        if ((a1 & 0xC000000000000001) != 0)
        {
          v7 = (id)MEMORY[0x1AF440C00](v6, a1);
          if (a2)
            goto LABEL_12;
        }
        else
        {
          v7 = *(id *)(a1 + 8 * v6 + 32);
          if (a2)
          {
LABEL_12:
            if (*(_QWORD *)(a2 + 16))
            {
              v8 = v7;
              v9 = sub_1AC77ECCC((uint64_t)v8);
              if ((v10 & 1) != 0)
                v11 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v9);

            }
          }
        }
        ++v6;

        sub_1AC78478C();
        sub_1AC7847B0();
        sub_1AC7847BC();
        sub_1AC784798();
        if (v4 == v6)
          return v12;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1AC7815E4(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;

  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v4 = sub_1AC784804();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  result = MEMORY[0x1E0DEE9D8];
  if (v4)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    result = sub_1AC7847A4();
    if ((v4 & 0x8000000000000000) == 0)
    {
      v6 = 0;
      while (1)
      {
        if (v4 == v6)
        {
          __break(1u);
          goto LABEL_20;
        }
        if ((a1 & 0xC000000000000001) != 0)
          v7 = (id)MEMORY[0x1AF440C00](v6, a1);
        else
          v7 = *(id *)(a1 + 8 * v6 + 32);
        v8 = v7;
        if (*(_QWORD *)(a2 + 16))
        {
          v9 = v7;
          v10 = sub_1AC77ECCC((uint64_t)v9);
          if ((v11 & 1) != 0)
          {
            v12 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v10);
            v13 = v12;

            if (v12)
              goto LABEL_8;
          }
          else
          {

          }
        }
        objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
LABEL_8:
        ++v6;

        sub_1AC78478C();
        sub_1AC7847B0();
        sub_1AC7847BC();
        sub_1AC784798();
        if (v4 == v6)
          return v14;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1AC781778(unint64_t a1, char *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  id v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t result;
  uint64_t v56;
  char *v57;
  char *v58;
  NSObject *v59;
  os_log_type_t v60;
  int v61;
  uint64_t v62;
  char *v63;
  char *v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  id v69;
  _QWORD *v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  unint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  char *v84;
  _QWORD *v85;
  uint64_t v86;
  void (*v87)(void);
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97298);
  MEMORY[0x1E0C80A78](v8, v9);
  v88 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = a4;
  v89 = v11;
  v92 = MEMORY[0x1E0DEE9D8];
  v90 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_19:
    sub_1AC782AA8((uint64_t)a3);
    v24 = a2;
    swift_bridgeObjectRetain();
    v12 = sub_1AC784804();
    v86 = a4;
    v87 = a3;
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    sub_1AC782AA8((uint64_t)a3);
    v13 = a2;
    swift_bridgeObjectRetain();
    v86 = a4;
    v87 = a3;
    if (v12)
    {
LABEL_3:
      v14 = OBJC_IVAR___TLKAsyncCache_lookaheadCache;
      v15 = 4;
      while (1)
      {
        a4 = v15 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v16 = (id)MEMORY[0x1AF440C00](v15 - 4, a1);
          v17 = v15 - 3;
          if (__OFADD__(a4, 1))
            goto LABEL_18;
        }
        else
        {
          v16 = *(id *)(a1 + 8 * v15);
          v17 = v15 - 3;
          if (__OFADD__(a4, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        v18 = *(_QWORD *)&a2[v14];
        if (*(_QWORD *)(v18 + 16))
        {
          v19 = v16;
          swift_bridgeObjectRetain();
          v20 = sub_1AC77ECCC((uint64_t)v19);
          if ((v21 & 1) != 0)
          {
            a3 = (void (*)(void))*(id *)(*(_QWORD *)(v18 + 56) + 8 * v20);

            v22 = swift_bridgeObjectRelease();
            MEMORY[0x1AF440A8C](v22);
            if (*(_QWORD *)(v92 + 16) >= *(_QWORD *)(v92 + 24) >> 1)
              sub_1AC784648();
            sub_1AC78466C();
            sub_1AC784630();
          }
          else
          {

            swift_bridgeObjectRelease();
          }
        }
        else
        {

        }
        ++v15;
        if (v17 == v12)
        {
          swift_bridgeObjectRelease();
          v23 = v92;
          goto LABEL_21;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  v23 = MEMORY[0x1E0DEE9D8];
LABEL_21:

  if (qword_1EEC97B20 != -1)
    swift_once();
  v25 = sub_1AC7845DC();
  v26 = __swift_project_value_buffer(v25, (uint64_t)qword_1EEC97C38);
  v27 = a2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v28 = v27;
  v29 = sub_1AC7845C4();
  v30 = sub_1AC784714();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc();
    v82 = (_QWORD *)swift_slowAlloc();
    v83 = swift_slowAlloc();
    v92 = v83;
    *(_DWORD *)v31 = 136315906;
    v85 = (_QWORD *)v26;
    v32 = v28;
    v33 = objc_msgSend(v32, sel_description);
    v84 = v28;
    v34 = v33;
    v35 = sub_1AC7845E8();
    v37 = v36;

    v91 = sub_1AC77E68C(v35, v37, &v92);
    sub_1AC784738();

    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2112;
    v38 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    v91 = (uint64_t)v38;
    sub_1AC784738();
    v39 = v82;
    *v82 = v38;
    *(_WORD *)(v31 + 22) = 2048;
    v40 = *(_QWORD *)(v23 + 16);
    swift_bridgeObjectRelease();
    v91 = v40;
    sub_1AC784738();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 32) = 2080;
    v41 = sub_1AC783994();
    v42 = swift_bridgeObjectRetain();
    v43 = MEMORY[0x1AF440AB0](v42, v41);
    v45 = v44;
    swift_bridgeObjectRelease();
    v91 = sub_1AC77E68C(v43, v45, &v92);
    v28 = v84;
    sub_1AC784738();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC747000, v29, v30, "[%s|%@]: Found %ld hits in lookahead for %s", (uint8_t *)v31, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v39, -1, -1);
    v46 = v83;
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v46, -1, -1);
    MEMORY[0x1AF441428](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v47 = *(_QWORD *)(v23 + 16);
  if (v90)
  {
    swift_bridgeObjectRetain();
    v56 = sub_1AC784804();
    swift_bridgeObjectRelease();
    if (v47 != v56)
      goto LABEL_28;
  }
  else if (v47 != *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_28:
    swift_bridgeObjectRelease();
    v48 = (uint64_t)v88;
    sub_1AC7846D8();
    v49 = sub_1AC7846F0();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v48, 0, 1, v49);
    sub_1AC7846CC();
    v50 = v28;
    swift_bridgeObjectRetain();
    v51 = v89;
    swift_retain();
    v52 = sub_1AC7846C0();
    v53 = (_QWORD *)swift_allocObject();
    v54 = MEMORY[0x1E0DF06E8];
    v53[2] = v52;
    v53[3] = v54;
    v53[4] = v50;
    v53[5] = a1;
    v53[6] = sub_1AC784418;
    v53[7] = v51;
    sub_1AC77D810(v48, (uint64_t)&unk_1EEC97900, (uint64_t)v53);
    swift_release();
    return swift_release();
  }
  v57 = v28;
  swift_bridgeObjectRetain_n();
  v58 = v57;
  v59 = sub_1AC7845C4();
  v60 = sub_1AC784714();
  v61 = v60;
  if (os_log_type_enabled(v59, v60))
  {
    v62 = swift_slowAlloc();
    v85 = (_QWORD *)swift_slowAlloc();
    v90 = swift_slowAlloc();
    v92 = v90;
    *(_DWORD *)v62 = 136315650;
    v63 = v58;
    LODWORD(v88) = v61;
    v64 = v63;
    v65 = objc_msgSend(v63, sel_description);
    v66 = sub_1AC7845E8();
    v68 = v67;

    v91 = sub_1AC77E68C(v66, v68, &v92);
    sub_1AC784738();

    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2112;
    v69 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    v91 = (uint64_t)v69;
    sub_1AC784738();
    v70 = v85;
    *v85 = v69;
    *(_WORD *)(v62 + 22) = 2080;
    v71 = sub_1AC783994();
    v72 = swift_bridgeObjectRetain();
    v73 = MEMORY[0x1AF440AB0](v72, v71);
    v75 = v74;
    swift_bridgeObjectRelease();
    v91 = sub_1AC77E68C(v73, v75, &v92);
    sub_1AC784738();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC747000, v59, (os_log_type_t)v88, "[%s|%@]: Returning hits in lookahead synchronously for %s", (uint8_t *)v62, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v70, -1, -1);
    v76 = v90;
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v76, -1, -1);
    MEMORY[0x1AF441428](v62, -1, -1);

    if (v47)
      goto LABEL_32;
LABEL_40:
    swift_bridgeObjectRelease();
    v80 = MEMORY[0x1E0DEE9D8];
LABEL_41:
    sub_1AC77CDE4(v80, v87);
    swift_release();
    return swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease_n();
  if (!v47)
    goto LABEL_40;
LABEL_32:
  v92 = MEMORY[0x1E0DEE9D8];
  result = sub_1AC7847A4();
  if (v47 >= 1)
  {
    v77 = 0;
    do
    {
      v78 = *(void **)(v23 + 8 * v77 + 32);
      if (!v78)
      {
        objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
        v78 = 0;
      }
      ++v77;
      v79 = v78;
      sub_1AC78478C();
      sub_1AC7847B0();
      sub_1AC7847BC();
      sub_1AC784798();
    }
    while (v47 != v77);
    v80 = v92;
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC782110(unint64_t a1, char *a2, void (*a3)(uint64_t *), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  char *v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  char *v58;
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  int v62;
  uint64_t v63;
  char *v64;
  char *v65;
  id v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  id v70;
  _QWORD *v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  char *v85;
  _QWORD *v86;
  uint64_t v87;
  void (*v88)(uint64_t *);
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97298);
  MEMORY[0x1E0C80A78](v8, v9);
  v89 = (char *)&v82 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_allocObject();
  v88 = (void (*)(uint64_t *))a3;
  *(_QWORD *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = a4;
  v90 = v11;
  v93 = MEMORY[0x1E0DEE9D8];
  v91 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_19:
    swift_retain();
    v25 = a2;
    swift_bridgeObjectRetain();
    v12 = sub_1AC784804();
    v87 = a4;
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_retain();
    v13 = a2;
    swift_bridgeObjectRetain();
    v87 = a4;
    if (v12)
    {
LABEL_3:
      v14 = OBJC_IVAR___TLKAsyncCache_lookaheadCache;
      v15 = 4;
      while (1)
      {
        a4 = v15 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v16 = (id)MEMORY[0x1AF440C00](v15 - 4, a1);
          v17 = v15 - 3;
          if (__OFADD__(a4, 1))
            goto LABEL_18;
        }
        else
        {
          v16 = *(id *)(a1 + 8 * v15);
          v17 = v15 - 3;
          if (__OFADD__(a4, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        v18 = *(_QWORD *)&a2[v14];
        if (*(_QWORD *)(v18 + 16))
        {
          v19 = v16;
          swift_bridgeObjectRetain();
          v20 = sub_1AC77ECCC((uint64_t)v19);
          if ((v21 & 1) != 0)
          {
            v22 = *(id *)(*(_QWORD *)(v18 + 56) + 8 * v20);

            v23 = swift_bridgeObjectRelease();
            MEMORY[0x1AF440A8C](v23);
            if (*(_QWORD *)(v93 + 16) >= *(_QWORD *)(v93 + 24) >> 1)
              sub_1AC784648();
            sub_1AC78466C();
            sub_1AC784630();
          }
          else
          {

            swift_bridgeObjectRelease();
          }
        }
        else
        {

        }
        ++v15;
        if (v17 == v12)
        {
          swift_bridgeObjectRelease();
          v24 = v93;
          goto LABEL_21;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  v24 = MEMORY[0x1E0DEE9D8];
LABEL_21:

  if (qword_1EEC97B20 != -1)
    swift_once();
  v26 = sub_1AC7845DC();
  v27 = __swift_project_value_buffer(v26, (uint64_t)qword_1EEC97C38);
  v28 = a2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v29 = v28;
  v30 = sub_1AC7845C4();
  v31 = sub_1AC784714();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v83 = (_QWORD *)swift_slowAlloc();
    v84 = swift_slowAlloc();
    v93 = v84;
    *(_DWORD *)v32 = 136315906;
    v86 = (_QWORD *)v27;
    v33 = v29;
    v34 = objc_msgSend(v33, sel_description);
    v85 = v29;
    v35 = v34;
    v36 = sub_1AC7845E8();
    v38 = v37;

    v92 = sub_1AC77E68C(v36, v38, &v93);
    sub_1AC784738();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2112;
    v39 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    v92 = (uint64_t)v39;
    sub_1AC784738();
    v40 = v83;
    *v83 = v39;
    *(_WORD *)(v32 + 22) = 2048;
    v41 = *(_QWORD *)(v24 + 16);
    swift_bridgeObjectRelease();
    v92 = v41;
    sub_1AC784738();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 32) = 2080;
    v42 = sub_1AC783994();
    v43 = swift_bridgeObjectRetain();
    v44 = MEMORY[0x1AF440AB0](v43, v42);
    v46 = v45;
    swift_bridgeObjectRelease();
    v92 = sub_1AC77E68C(v44, v46, &v93);
    v29 = v85;
    sub_1AC784738();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC747000, v30, v31, "[%s|%@]: Found %ld hits in lookahead for %s", (uint8_t *)v32, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v40, -1, -1);
    v47 = v84;
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v47, -1, -1);
    MEMORY[0x1AF441428](v32, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v48 = *(_QWORD *)(v24 + 16);
  if (v91)
  {
    swift_bridgeObjectRetain();
    v57 = sub_1AC784804();
    swift_bridgeObjectRelease();
    if (v48 != v57)
      goto LABEL_28;
  }
  else if (v48 != *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_28:
    swift_bridgeObjectRelease();
    v49 = (uint64_t)v89;
    sub_1AC7846D8();
    v50 = sub_1AC7846F0();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v49, 0, 1, v50);
    sub_1AC7846CC();
    v51 = v29;
    swift_bridgeObjectRetain();
    v52 = v90;
    swift_retain();
    v53 = sub_1AC7846C0();
    v54 = (_QWORD *)swift_allocObject();
    v55 = MEMORY[0x1E0DF06E8];
    v54[2] = v53;
    v54[3] = v55;
    v54[4] = v51;
    v54[5] = a1;
    v54[6] = sub_1AC783ABC;
    v54[7] = v52;
    sub_1AC77D810(v49, (uint64_t)&unk_1EEC97880, (uint64_t)v54);
    swift_release();
    return swift_release();
  }
  v58 = v29;
  swift_bridgeObjectRetain_n();
  v59 = v58;
  v60 = sub_1AC7845C4();
  v61 = sub_1AC784714();
  v62 = v61;
  if (os_log_type_enabled(v60, v61))
  {
    v63 = swift_slowAlloc();
    v86 = (_QWORD *)swift_slowAlloc();
    v91 = swift_slowAlloc();
    v93 = v91;
    *(_DWORD *)v63 = 136315650;
    v64 = v59;
    LODWORD(v89) = v62;
    v65 = v64;
    v66 = objc_msgSend(v64, sel_description);
    v67 = sub_1AC7845E8();
    v69 = v68;

    v92 = sub_1AC77E68C(v67, v69, &v93);
    sub_1AC784738();

    swift_bridgeObjectRelease();
    *(_WORD *)(v63 + 12) = 2112;
    v70 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
    v92 = (uint64_t)v70;
    sub_1AC784738();
    v71 = v86;
    *v86 = v70;
    *(_WORD *)(v63 + 22) = 2080;
    v72 = sub_1AC783994();
    v73 = swift_bridgeObjectRetain();
    v74 = MEMORY[0x1AF440AB0](v73, v72);
    v76 = v75;
    swift_bridgeObjectRelease();
    v92 = sub_1AC77E68C(v74, v76, &v93);
    sub_1AC784738();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AC747000, v60, (os_log_type_t)v89, "[%s|%@]: Returning hits in lookahead synchronously for %s", (uint8_t *)v63, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v71, -1, -1);
    v77 = v91;
    swift_arrayDestroy();
    MEMORY[0x1AF441428](v77, -1, -1);
    MEMORY[0x1AF441428](v63, -1, -1);

    if (v48)
      goto LABEL_32;
LABEL_40:
    swift_bridgeObjectRelease();
    v81 = MEMORY[0x1E0DEE9D8];
LABEL_41:
    v93 = v81;
    v88(&v93);
    swift_release();
    return swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease_n();
  if (!v48)
    goto LABEL_40;
LABEL_32:
  v93 = MEMORY[0x1E0DEE9D8];
  result = sub_1AC7847A4();
  if (v48 >= 1)
  {
    v78 = 0;
    do
    {
      v79 = *(void **)(v24 + 8 * v78 + 32);
      if (!v79)
      {
        objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E38]), sel_init);
        v79 = 0;
      }
      ++v78;
      v80 = v79;
      sub_1AC78478C();
      sub_1AC7847B0();
      sub_1AC7847BC();
      sub_1AC784798();
    }
    while (v48 != v78);
    v81 = v93;
    swift_bridgeObjectRelease();
    goto LABEL_41;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AC782AA8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1AC782AB8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC782ADC(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_1AC782B04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1AC7845A0;
  return sub_1AC77DA30((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_1AC782B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for ComputationTracker.State(319, *(_QWORD *)(a1 + 80), a3, a4);
  if (v5 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1AC782BEC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1AC782BF4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

uint64_t *sub_1AC782C4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL8 v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  _BOOL8 v20;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = v8;
  if (v7 <= 1)
  {
    if (v8 <= 3)
    {
      v11 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
      if (v11 > 0xFFFE)
      {
        v10 = 4;
      }
      else
      {
        v12 = v11 != 0;
        v13 = v11 >= 0xFF;
        v10 = 2;
        if (!v13)
          v10 = v12;
      }
    }
    else
    {
      v10 = 1;
    }
    v9 = v10 + v8;
  }
  v14 = *(_DWORD *)(v6 + 80);
  if (v14 <= 7 && v9 <= 0x18 && (*(_DWORD *)(v6 + 80) & 0x100000) == 0)
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 2, *(_QWORD *)(a3 + 16)))
    {
      if (v7 <= 1)
      {
        if (v8 <= 3)
        {
          v19 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
          if (v19 > 0xFFFE)
          {
            v18 = 4;
          }
          else
          {
            v20 = v19 != 0;
            v13 = v19 >= 0xFF;
            v18 = 2;
            if (!v13)
              v18 = v20;
          }
        }
        else
        {
          v18 = 1;
        }
        v8 += v18;
      }
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
    }
  }
  else
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v14 + 16) & ~v14));
    swift_retain();
  }
  return a1;
}

uint64_t sub_1AC782DE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 2, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return result;
}

void *sub_1AC782E40(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  BOOL v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          v9 = 4;
        }
        else
        {
          v11 = v10 != 0;
          v12 = v10 >= 0xFF;
          v9 = 2;
          if (!v12)
            v9 = v11;
        }
      }
      else
      {
        v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *sub_1AC782F30(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  unsigned int v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  BOOL v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 2, v5);
  v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        v13 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v13 > 0xFFFE)
        {
          v12 = 4;
        }
        else
        {
          v14 = v13 != 0;
          v15 = v13 >= 0xFF;
          v12 = 2;
          if (!v15)
            v12 = v14;
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
          goto LABEL_5;
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
  }
  return a1;
}

void *sub_1AC783080(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  BOOL v12;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 2, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7 <= 1)
    {
      if (v8 <= 3)
      {
        v10 = (~(-1 << (8 * v8)) - v7 + 2) >> (8 * v8);
        if (v10 > 0xFFFE)
        {
          v9 = 4;
        }
        else
        {
          v11 = v10 != 0;
          v12 = v10 >= 0xFF;
          v9 = 2;
          if (!v12)
            v9 = v11;
        }
      }
      else
      {
        v9 = 1;
      }
      v8 += v9;
    }
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  return a1;
}

void *sub_1AC783170(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  unsigned int v10;
  size_t v11;
  uint64_t v12;
  unsigned int v13;
  _BOOL8 v14;
  BOOL v15;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 2, v5);
  v9 = v7(a2, 2, v5);
  if (v8)
  {
    if (v9)
    {
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
        {
LABEL_5:
          v12 = 1;
LABEL_16:
          v11 += v12;
          goto LABEL_17;
        }
LABEL_9:
        v13 = (~(-1 << (8 * v11)) - v10 + 2) >> (8 * v11);
        if (v13 > 0xFFFE)
        {
          v12 = 4;
        }
        else
        {
          v14 = v13 != 0;
          v15 = v13 >= 0xFF;
          v12 = 2;
          if (!v15)
            v12 = v14;
        }
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 2, v5);
  }
  else
  {
    if (v9)
    {
      (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
      v10 = *(_DWORD *)(v6 + 84);
      v11 = *(_QWORD *)(v6 + 64);
      if (v10 <= 1)
      {
        if (v11 > 3)
          goto LABEL_5;
        goto LABEL_9;
      }
LABEL_17:
      memcpy(a1, a2, v11);
      return a1;
    }
    (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
  }
  return a1;
}

uint64_t sub_1AC7832C0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL8 v10;
  BOOL v11;
  int v12;
  char v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 2;
  v7 = *(_QWORD *)(v4 + 64);
  if (v5 <= 1)
  {
    v6 = 0;
    if (v7 <= 3)
    {
      v9 = (~(-1 << (8 * v7)) - v5 + 2) >> (8 * v7);
      if (v9 > 0xFFFE)
      {
        v8 = 4;
      }
      else
      {
        v10 = v9 != 0;
        v11 = v9 >= 0xFF;
        v8 = 2;
        if (!v11)
          v8 = v10;
      }
    }
    else
    {
      v8 = 1;
    }
    v7 += v8;
  }
  if (!a2)
    return 0;
  v12 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_29;
  v13 = 8 * v7;
  if (v7 <= 3)
  {
    v15 = ((v12 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v15))
    {
      v14 = *(_DWORD *)(a1 + v7);
      if (!v14)
        goto LABEL_29;
      goto LABEL_20;
    }
    if (v15 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_29;
      goto LABEL_20;
    }
    if (v15 < 2)
    {
LABEL_29:
      if (v6)
      {
        v18 = (*(uint64_t (**)(void))(v4 + 48))();
        if (v18 >= 3)
          return v18 - 2;
        else
          return 0;
      }
      return 0;
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_29;
LABEL_20:
  v16 = (v14 - 1) << v13;
  if (v7 > 3)
    v16 = 0;
  if ((_DWORD)v7)
  {
    if (v7 <= 3)
      v17 = v7;
    else
      v17 = 4;
    __asm { BR              X12 }
  }
  return v6 + v16 + 1;
}

void sub_1AC783454(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  uint64_t v10;
  unsigned int v11;
  _BOOL8 v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = v7 - 2;
  v9 = *(_QWORD *)(v6 + 64);
  if (v7 <= 1)
  {
    v8 = 0;
    if (v9 <= 3)
    {
      v11 = (~(-1 << (8 * v9)) - v7 + 2) >> (8 * v9);
      if (v11 > 0xFFFE)
      {
        v10 = 4;
      }
      else
      {
        v12 = v11 != 0;
        v13 = v11 >= 0xFF;
        v10 = 2;
        if (!v13)
          v10 = v12;
      }
    }
    else
    {
      v10 = 1;
    }
    v9 += v10;
  }
  v13 = a3 >= v8;
  v14 = a3 - v8;
  if (v14 != 0 && v13)
  {
    if (v9 <= 3)
    {
      v17 = ((v14 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v17))
      {
        v15 = 4u;
      }
      else if (v17 >= 0x100)
      {
        v15 = 2;
      }
      else
      {
        v15 = v17 > 1;
      }
    }
    else
    {
      v15 = 1u;
    }
  }
  else
  {
    v15 = 0u;
  }
  if (v8 < a2)
  {
    v16 = ~v8 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v18 = v16 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v18;
          *((_BYTE *)a1 + 2) = BYTE2(v18);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v18;
        }
        else
        {
          *(_BYTE *)a1 = v18;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_1AC783670(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 48))(a1, 2);
}

uint64_t sub_1AC783684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 56))(a1, a2, 2);
}

uint64_t method lookup function for TLKAsyncCache()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TLKAsyncCache.getCachedObject(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of TLKAsyncCache.getObject(forKey:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of TLKAsyncCache.getObjects(forKeys:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TLKAsyncCache.clear()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t sub_1AC783714()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1AC783748()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1AC7845A0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1EEC97820 + dword_1EEC97820))(v2, v3, v4);
}

uint64_t sub_1AC7837B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1AC7845A0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EEC97830 + dword_1EEC97830))(v2, v3, v4);
}

uint64_t objectdestroy_12Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC783860(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1AC7845A0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EEC97840 + dword_1EEC97840))(a1, v4, v5, v6);
}

uint64_t sub_1AC7838E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97298);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AC783924(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1AC7845A0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEC97850 + dword_1EEC97850))(a1, v4);
}

unint64_t sub_1AC783994()
{
  unint64_t result;

  result = qword_1EEC972B0;
  if (!qword_1EEC972B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EEC972B0);
  }
  return result;
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1AC783A00(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1AC783A10()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1AC783A34(uint64_t a1)
{
  uint64_t v1;

  sub_1AC77D27C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1AC783A3C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1AC783A4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1AC7845A0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEC97868 + dword_1EEC97868))(a1, v4);
}

uint64_t sub_1AC783ABC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_1AC783AF0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1AC7845A0;
  return sub_1AC77D2DC((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

unint64_t sub_1AC783B54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEC97C30;
  if (!qword_1EEC97C30)
  {
    v1 = type metadata accessor for SingleCallingActor();
    result = MEMORY[0x1AF4413A4](&unk_1AC789C38, v1);
    atomic_store(result, (unint64_t *)&qword_1EEC97C30);
  }
  return result;
}

uint64_t sub_1AC783B98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1AC7845A0;
  return sub_1AC77B350(a1, a2, v6);
}

uint64_t sub_1AC783C00()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC783C2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1AC783CB8;
  v8 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v4 + 176) + *(_QWORD *)(*(_QWORD *)v4 + 176));
  v6 = (_QWORD *)swift_task_alloc();
  v5[2] = v6;
  *v6 = v5;
  v6[1] = sub_1AC77BD30;
  return v8(a1);
}

uint64_t sub_1AC783CB8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AC783D00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC97298);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1AC783D48(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  os_log_type_t typea;
  NSObject *type;
  NSObject *v37;
  id v38;

  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 32);
  v6 = *a1;
  swift_beginAccess();
  v7 = *(_QWORD *)(v4 + 112);
  v8 = v6;
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)sub_1AC77A120(v8, v7);
  swift_bridgeObjectRelease();

  if (v9)
  {
    if (qword_1EEC97B20 != -1)
      swift_once();
    v10 = sub_1AC7845DC();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EEC97C38);
    v11 = v8;
    v12 = sub_1AC7845C4();
    v13 = sub_1AC784714();
    if (os_log_type_enabled(v12, v13))
    {
      typea = v13;
      v14 = swift_slowAlloc();
      v34 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412546;
      v15 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
      sub_1AC784738();
      *v34 = v15;
      *(_WORD *)(v14 + 12) = 2112;
      v37 = v11;
      v16 = v11;
      sub_1AC784738();
      v34[1] = v11;

      _os_log_impl(&dword_1AC747000, v12, typea, "[%@]: Found cached value for %@", (uint8_t *)v14, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
      swift_arrayDestroy();
      MEMORY[0x1AF441428](v34, -1, -1);
      MEMORY[0x1AF441428](v14, -1, -1);
    }
    else
    {

      v12 = v11;
    }
  }
  else
  {
    if (qword_1EEC97B20 != -1)
      swift_once();
    v17 = sub_1AC7845DC();
    __swift_project_value_buffer(v17, (uint64_t)qword_1EEC97C38);
    swift_bridgeObjectRetain_n();
    v18 = sub_1AC7845C4();
    v19 = sub_1AC784714();
    type = v18;
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v37 = v32;
      *(_DWORD *)v20 = 138412546;
      v33 = v5;
      v38 = objc_msgSend((id)objc_opt_self(), sel_currentThread);
      sub_1AC784738();
      *v31 = v38;
      *(_WORD *)(v20 + 12) = 2080;
      v21 = sub_1AC783994();
      v22 = swift_bridgeObjectRetain();
      v23 = MEMORY[0x1AF440AB0](v22, v21);
      v25 = v24;
      swift_bridgeObjectRelease();
      v26 = v23;
      v5 = v33;
      v38 = (id)sub_1AC77E68C(v26, v25, (uint64_t *)&v37);
      sub_1AC784738();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1AC747000, type, v19, "[%@]: Creating individual ComputationTracker for %s", (uint8_t *)v20, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972D8);
      swift_arrayDestroy();
      MEMORY[0x1AF441428](v31, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1AF441428](v32, -1, -1);
      MEMORY[0x1AF441428](v20, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease_n();

    }
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = v8;
    *(_QWORD *)(v27 + 24) = v5;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEC972A0);
    v9 = (_QWORD *)swift_allocObject();
    v28 = v8;
    swift_unknownObjectRetain();
    swift_defaultActor_initialize();
    v29 = MEMORY[0x1E0DEE9D8];
    v9[14] = 0;
    v9[15] = &unk_1EEC978F0;
    v9[16] = v27;
    v9[17] = v29;
    swift_beginAccess();
    v12 = v28;
    v30 = swift_retain();
    sub_1AC77EE04(v30, v12);
    swift_endAccess();
  }

  *a2 = v9;
}

uint64_t sub_1AC784280()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AC7842AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1AC7845A0;
  *(_OWORD *)(v4 + 136) = v5;
  *(_QWORD *)(v4 + 128) = a1;
  return swift_task_switch();
}

uint64_t sub_1AC784314()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AC784340(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1AC7845A0;
  *(_OWORD *)(v4 + 232) = v5;
  *(_QWORD *)(v4 + 224) = a1;
  return swift_task_switch();
}

uint64_t sub_1AC7843A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AC7843EC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

void sub_1AC784418(unint64_t a1)
{
  uint64_t v1;

  sub_1AC77CDE4(a1, *(void (**)(void))(v1 + 16));
}

uint64_t objectdestroy_50Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AC784460()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1AC783CB8;
  return sub_1AC77D2DC((uint64_t)v6, v7, v8, v2, v3, v5, v4);
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

uint64_t sub_1AC7844E4(uint64_t a1, uint64_t a2)
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

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1AF441374](a1, v6, a5);
}

void sub_1AC784590()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_1AC7845C4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1AC7845D0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1AC7845DC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1AC7845E8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1AC7845F4()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1AC784600()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1AC78460C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1AC784618()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1AC784624()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1AC784630()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1AC78463C()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1AC784648()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1AC784654()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1AC784660()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1AC78466C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1AC784678()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1AC784684()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1AC784690()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1AC78469C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1AC7846A8()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1AC7846B4()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1AC7846C0()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1AC7846CC()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1AC7846D8()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1AC7846E4()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1AC7846F0()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1AC7846FC()
{
  return MEMORY[0x1E0DF0950]();
}

uint64_t sub_1AC784708()
{
  return MEMORY[0x1E0DF0980]();
}

uint64_t sub_1AC784714()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1AC784720()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1AC78472C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1AC784738()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1AC784744()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1AC784750()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1AC78475C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1AC784768()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1AC784774()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1AC784780()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1AC78478C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1AC784798()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1AC7847A4()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1AC7847B0()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1AC7847BC()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1AC7847C8()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1AC7847D4()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1AC7847E0()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1AC7847EC()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1AC7847F8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1AC784804()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1AC784810()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1AC78481C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1AC784828()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1AC784834()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1AC784840()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1AC78484C()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1AC784858()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1AC784864()
{
  return MEMORY[0x1E0DEDAE8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x1E0CD2630](retstr, m);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
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

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
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

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x1E0CA7A28]();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x1E0CA7A68](*(_QWORD *)&uiType, language, size);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0DC4500]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1E0DC4A08]();
}

uint64_t UIRoundToScreenScale()
{
  return MEMORY[0x1E0DC52F0]();
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

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return MEMORY[0x1E0DC57B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
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

