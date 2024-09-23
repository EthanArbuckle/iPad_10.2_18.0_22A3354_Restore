void sub_22D32B948(uint64_t a1, uint64_t a2)
{
  sub_22D2C7A04(qword_255D6F198, a2, (uint64_t (*)(uint64_t))type metadata accessor for RNReadNotificationsFlowProvider, (uint64_t)&unk_22D336B20);
}

void sub_22D32B974(uint64_t a1, uint64_t a2)
{
  sub_22D2C7A04(qword_255D6F1B0, a2, (uint64_t (*)(uint64_t))type metadata accessor for RNReadNotificationsFlowProvider, (uint64_t)&unk_22D336B58);
}

uint64_t sub_22D32B9A0(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_22D33049C();
    __break(1u);
  }
  else if (a1)
  {
    OUTLINED_FUNCTION_23(a1, (unint64_t *)&qword_255D69FF8);
    result = sub_22D3301F0();
    *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

unint64_t sub_22D32BA54(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_22D32BA78()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_67_4();
  v2 = OUTLINED_FUNCTION_95_4((uint64_t)v1);
  sub_22D32BB08(v2, v3, v4);
  *(_QWORD *)(v0 + 32) = v5;
  OUTLINED_FUNCTION_19();
}

void sub_22D32BAAC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OUTLINED_FUNCTION_67_4();
  v2 = OUTLINED_FUNCTION_95_4((uint64_t)v1);
  sub_22D32BB50(v2, v3, v4);
  *(_QWORD *)(v0 + 32) = v5;
  OUTLINED_FUNCTION_19();
}

void sub_22D32BADC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void sub_22D32BB08(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_53_10(a1, a2, a3);
  if (v6)
    OUTLINED_FUNCTION_46_8();
  *v3 = *(id *)(v4 + 8 * v5 + 32);
  OUTLINED_FUNCTION_19();
}

void sub_22D32BB50(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_53_10(a1, a2, a3);
  if (v4)
    OUTLINED_FUNCTION_46_8();
  *v3 = swift_retain();
  OUTLINED_FUNCTION_19();
}

uint64_t sub_22D32BB98()
{
  return swift_release();
}

void sub_22D32BBA0(uint64_t a1)
{
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
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t i;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v32;
  char *v33;
  char *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  BOOL v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D6A140);
  OUTLINED_FUNCTION_32();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v50 = (uint64_t)v45 - v6;
  v7 = OUTLINED_FUNCTION_35_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3_0();
  v47 = v10;
  v48 = v9 - v8;
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (v11 + 32) & ~v11;
  v52 = (char *)MEMORY[0x24BEE4AF8];
  v49 = MEMORY[0x24BEE4AF8] + v12;
  v45[2] = v11 | 7;
  OUTLINED_FUNCTION_10();
  v13 = 0;
  v14 = 0;
  v51 = 0;
  v15 = 0;
  for (i = v12; ; v12 = i)
  {
    while (1)
    {
      if (!v14)
        goto LABEL_5;
      v17 = *(_QWORD *)(v14 + 16);
      if (v13 == v17)
        break;
      if (v13 >= v17)
        goto LABEL_41;
      v46 = *(_QWORD *)(v47 + 72);
      sub_22D2B6D18(v14 + v12 + v46 * v13, (uint64_t)v5);
      __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
      v21 = v50;
      sub_22D32C308((uint64_t)v5, v50, &qword_255D6A140);
      if (__swift_getEnumTagSinglePayload(v21, 1, v7) == 1)
        goto LABEL_36;
      sub_22D2BEF28(v21, v48);
      v22 = v51;
      if (v51)
      {
        v23 = v52;
        v12 = i;
        goto LABEL_33;
      }
      v24 = *((_QWORD *)v52 + 3);
      if ((uint64_t)((v24 >> 1) + 0x4000000000000000) < 0)
        goto LABEL_44;
      v12 = i;
      v25 = v24 & 0xFFFFFFFFFFFFFFFELL;
      if (v25 <= 1)
        v26 = 1;
      else
        v26 = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D6A548);
      v27 = v46;
      v51 = (char *)swift_allocObject();
      v28 = _swift_stdlib_malloc_size(v51);
      if (!v27)
        goto LABEL_45;
      v29 = v27;
      v30 = v28 - i;
      if (v28 - i == 0x8000000000000000 && v27 == -1)
        goto LABEL_46;
      v32 = v30 / v27;
      v34 = v51;
      v33 = v52;
      *((_QWORD *)v51 + 2) = v26;
      *((_QWORD *)v34 + 3) = 2 * (v30 / v29);
      v35 = (unint64_t)&v34[i];
      v36 = *((_QWORD *)v33 + 3);
      v37 = (v36 >> 1) * v29;
      if (*((_QWORD *)v33 + 2))
      {
        if (v34 >= v33 && v35 < (unint64_t)&v33[i + v37])
        {
          if (v34 != v33)
          {
            OUTLINED_FUNCTION_103_3();
            swift_arrayInitWithTakeBackToFront();
LABEL_30:
            v37 = v45[1];
            v35 = v49;
            v33 = v52;
          }
          *((_QWORD *)v33 + 2) = 0;
          goto LABEL_32;
        }
        OUTLINED_FUNCTION_103_3();
        swift_arrayInitWithTakeFrontToBack();
        goto LABEL_30;
      }
LABEL_32:
      v49 = v35 + v37;
      v22 = (char *)((v32 & 0x7FFFFFFFFFFFFFFFLL) - (v36 >> 1));
      swift_release();
      v23 = v51;
LABEL_33:
      v39 = __OFSUB__(v22, 1);
      v40 = v22 - 1;
      if (v39)
        goto LABEL_42;
      v51 = v40;
      ++v13;
      v41 = v49;
      sub_22D2BEF28(v48, v49);
      v49 = v41 + v46;
      v52 = v23;
    }
    OUTLINED_FUNCTION_69_6((uint64_t)v5);
    sub_22D2C1DE8((uint64_t)v5, &qword_255D6A140);
LABEL_5:
    v18 = *(_QWORD *)(a1 + 16);
    if (v15 == v18)
      break;
    if (v15 >= v18)
    {
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    v19 = v15 + 1;
    v20 = *(_QWORD *)(a1 + 8 * v15 + 32);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_4_10();
    v13 = 0;
    v14 = v20;
    v15 = v19;
  }
  v21 = v50;
  OUTLINED_FUNCTION_69_6(v50);
LABEL_36:
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_10();
  sub_22D2C1DE8(v21, &qword_255D6A140);
  v42 = *((_QWORD *)v52 + 3);
  if (v42 < 2)
    return;
  v43 = v42 >> 1;
  v39 = __OFSUB__(v43, v51);
  v44 = v43 - (_QWORD)v51;
  if (!v39)
  {
    *((_QWORD *)v52 + 2) = v44;
    return;
  }
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
}

void sub_22D32BF00(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D6F1F0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1;
  sub_22D330268();

  v26 = *(int *)(v4 + 36);
  *(_QWORD *)&v6[v26] = a2;
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2)
  {
    sub_22D32F008();
    sub_22D2C7A04(&qword_255D6F1F8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BDCD520], MEMORY[0x24BDCD530]);
    v9 = 0;
    v10 = 1 - a2;
    v11 = v8 + 4;
    while (1)
    {
      sub_22D330334();
      if (!*((_QWORD *)&v28 + 1))
      {
        *(_QWORD *)&v6[v26] = -v10;
        goto LABEL_24;
      }
      sub_22D2E0264(&v27, v29);
      if (!v9)
      {
        v12 = v8[3];
        if ((uint64_t)((v12 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_29;
        v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
        if (v13 <= 1)
          v14 = 1;
        else
          v14 = v13;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255D6E848);
        v15 = (_QWORD *)swift_allocObject();
        v16 = (uint64_t)(_swift_stdlib_malloc_size(v15) - 32) / 32;
        v15[2] = v14;
        v15[3] = 2 * v16;
        v17 = (unint64_t)(v15 + 4);
        v18 = v8[3];
        v19 = v18 >> 1;
        if (v8[2])
        {
          if (v15 != v8 || v17 >= (unint64_t)&v8[4 * v19 + 4])
            memmove(v15 + 4, v8 + 4, 32 * v19);
          v8[2] = 0;
        }
        v11 = (_OWORD *)(v17 + 32 * v19);
        v9 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - (v18 >> 1);
        swift_release();
        v8 = v15;
      }
      v21 = __OFSUB__(v9--, 1);
      if (v21)
        break;
      sub_22D2E0264(v29, v11);
      v11 += 2;
      if (++v10 == 1)
        goto LABEL_22;
    }
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = 0;
LABEL_22:
  *(_QWORD *)&v6[v26] = 0;
  v27 = 0u;
  v28 = 0u;
LABEL_24:
  sub_22D2C1DE8((uint64_t)v6, &qword_255D6F1F0);
  sub_22D2C1DE8((uint64_t)&v27, &qword_255D6A010);
  v22 = v8[3];
  if (v22 >= 2)
  {
    v23 = v22 >> 1;
    v21 = __OFSUB__(v23, v9);
    v24 = v23 - v9;
    if (v21)
    {
LABEL_30:
      __break(1u);
      return;
    }
    v8[2] = v24;
  }
}

uint64_t sub_22D32C158()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_60_4();
  OUTLINED_FUNCTION_23_23();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_29_15(v1, (uint64_t)sub_22D32C350);
  return sub_22D32976C(v2, v3, v4);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_60_4() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_release();
  OUTLINED_FUNCTION_14(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D32C238()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_60_4();
  OUTLINED_FUNCTION_23_23();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_29_15(v1, (uint64_t)sub_22D32C288);
  return sub_22D3296D0(v2, v3, v4);
}

uint64_t sub_22D32C288(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_1_1();
  return OUTLINED_FUNCTION_25_18(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_22D32C2B8(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 328) = result;
  return result;
}

unint64_t sub_22D32C2C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D6F228;
  if (!qword_255D6F228)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D6F220);
    result = MEMORY[0x22E312820](&unk_22D333830, v1);
    atomic_store(result, (unint64_t *)&qword_255D6F228);
  }
  return result;
}

void sub_22D32C308(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_0();
}

uint64_t OUTLINED_FUNCTION_1_32()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_5_26()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 80) = *(_QWORD *)(v1 + 96);

}

uint64_t OUTLINED_FUNCTION_9_27(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(*(_QWORD *)(v1 - 80), 1, 1, a1);
  return 3;
}

uint64_t OUTLINED_FUNCTION_10_29()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_17_21()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1(v1, *(_QWORD *)(v0 + 40));
  return sub_22D32F404();
}

_QWORD *OUTLINED_FUNCTION_21_16()
{
  uint64_t v0;
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(v1);
  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 88));
}

uint64_t OUTLINED_FUNCTION_25_18(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_26_16()
{
  return sub_22D32F758();
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  return sub_22D32F3A4();
}

uint64_t OUTLINED_FUNCTION_29_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a11 + 104))(a12, a2, a13);
}

uint64_t OUTLINED_FUNCTION_30_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 104))(v4, a2, v3);
}

uint64_t OUTLINED_FUNCTION_42_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a19 + 8))(v20, a20);
}

uint64_t OUTLINED_FUNCTION_43_8()
{
  return sub_22D32F4AC();
}

uint64_t OUTLINED_FUNCTION_45_10()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47_10(int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int16 a10)
{
  return sub_22D2CBD00(a1, a2, a3, a4, a5, 0, 0, 0, a9, a10);
}

uint64_t OUTLINED_FUNCTION_48_7@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return sub_22D2B906C(v1 + a1, v2);
}

unint64_t OUTLINED_FUNCTION_49_9()
{
  char v0;
  unint64_t v1;
  uint64_t v2;
  char v3;

  if (v0)
    v3 = 1;
  else
    v3 = 0;
  return sub_22D32BA54(v1, v3, v2);
}

unint64_t OUTLINED_FUNCTION_53_10(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_22D32BA54(a2, (a3 & 0xC000000000000001) == 0, a3);
}

uint64_t OUTLINED_FUNCTION_56_9()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_60_7()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_63_7()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_64_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v2 - 104))(v0, *(_QWORD *)(v2 - 88), *(_QWORD *)(v1 + 592));
}

unint64_t OUTLINED_FUNCTION_65_4()
{
  uint64_t v0;
  unint64_t v1;

  return sub_22D32BA54(v1, (v0 & 0xC000000000000001) == 0, v0);
}

void *OUTLINED_FUNCTION_67_4()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_69_6(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_77_1()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  return sub_22D2B906C(v1 + *v2, v0);
}

uint64_t OUTLINED_FUNCTION_80_4()
{
  uint64_t v0;

  return v0;
}

BOOL OUTLINED_FUNCTION_82_5(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_87_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _QWORD, uint64_t);
  uint64_t v3;

  return v2(v0, *(_QWORD *)(v3 - 88), v1);
}

uint64_t OUTLINED_FUNCTION_93_4()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_95_4(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_96_3()
{
  return sub_22D330340();
}

uint64_t OUTLINED_FUNCTION_98_2()
{
  return sub_22D2C18C0();
}

BOOL OUTLINED_FUNCTION_99_1(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_103_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = v1;
  *(_QWORD *)(v2 - 112) = v1;
  *(_QWORD *)(v2 - 152) = v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_108_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_109_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_110_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_113_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_115_0()
{
  return sub_22D3300B8();
}

uint64_t OUTLINED_FUNCTION_116_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_119_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return sub_22D2B906C(v2 + a1, v1);
}

void OUTLINED_FUNCTION_128_0()
{
  sub_22D317CBC();
}

void sub_22D32C6EC()
{
  uint64_t *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  int *Notification;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v3 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_26_17()), sel_init);
  v4 = v0[2];
  v5 = v0[3];
  v6 = v3;
  OUTLINED_FUNCTION_22_21();
  sub_22D32D628(v4, v5, v1);
  OUTLINED_FUNCTION_16();
  v7 = *v0;
  v8 = v0[1];
  v9 = v1;
  OUTLINED_FUNCTION_29_17();
  sub_22D32D66C(v7, v8, v2);

  OUTLINED_FUNCTION_0_4();
  if (v0[5])
  {
    v10 = (void *)v0[4];
    v11 = v2;
    OUTLINED_FUNCTION_7_13();
    OUTLINED_FUNCTION_21_17();
    v12 = (id)OUTLINED_FUNCTION_25_19();
  }
  else
  {
    v12 = v2;
    v10 = 0;
  }
  OUTLINED_FUNCTION_6_31((uint64_t)v12, sel_setThreadIdentifier_);

  Notification = (int *)type metadata accessor for ReadNotification();
  v14 = v2;
  v15 = (void *)sub_22D32F074();
  OUTLINED_FUNCTION_0_29((uint64_t)v15, sel_setDate_);

  if (*(uint64_t *)((char *)v0 + Notification[10] + 8))
  {
    OUTLINED_FUNCTION_12_29();
    v17 = (void *)OUTLINED_FUNCTION_3_30();
    v16 = OUTLINED_FUNCTION_0_4();
  }
  else
  {
    v17 = 0;
  }
  OUTLINED_FUNCTION_0_29(v16, sel_setTitle_);

  if (*(uint64_t *)((char *)v0 + Notification[11] + 8))
  {
    OUTLINED_FUNCTION_12_29();
    v19 = (void *)OUTLINED_FUNCTION_3_30();
    v18 = OUTLINED_FUNCTION_0_4();
  }
  else
  {
    v19 = 0;
  }
  OUTLINED_FUNCTION_0_29(v18, sel_setSubtitle_);

  if (*(uint64_t *)((char *)v0 + Notification[12] + 8))
  {
    OUTLINED_FUNCTION_12_29();
    v21 = (void *)OUTLINED_FUNCTION_3_30();
    v20 = OUTLINED_FUNCTION_0_4();
  }
  else
  {
    v21 = 0;
  }
  OUTLINED_FUNCTION_0_29(v20, sel_setBody_);

  sub_22D2B696C(0, (unint64_t *)&qword_255D69FD8);
  v22 = (void *)sub_22D3302EC();
  OUTLINED_FUNCTION_0_29((uint64_t)v22, sel_setPreviewRestricted_);

  sub_22D2BF13C((uint64_t)v0);
  OUTLINED_FUNCTION_8_1();
}

void sub_22D32C8D0()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void **v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void **v14;
  void *v15;
  uint64_t v16;
  void **v17;
  void *v18;
  uint64_t v19;
  void **v20;
  void *v21;

  v2 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_26_17()), sel_init);
  OUTLINED_FUNCTION_22_21();
  v3 = (void *)sub_22D330070();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1_33(v0, sel_setNotificationId_);

  v4 = v0;
  OUTLINED_FUNCTION_29_17();
  v5 = (void *)sub_22D330070();
  v6 = OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_6_31(v6, sel_setApplicationId_);

  OUTLINED_FUNCTION_30_13();
  if (v0)
  {
    v8 = *v7;
    v9 = v1;
    OUTLINED_FUNCTION_7_13();
    OUTLINED_FUNCTION_21_17();
    v10 = (id)OUTLINED_FUNCTION_25_19();
  }
  else
  {
    v10 = v1;
    v8 = 0;
  }
  OUTLINED_FUNCTION_6_31((uint64_t)v10, sel_setThreadIdentifier_);

  v11 = v1;
  v12 = (void *)sub_22D32F074();
  OUTLINED_FUNCTION_0_29((uint64_t)v12, sel_setDate_);

  OUTLINED_FUNCTION_30_13();
  if (v0)
  {
    v15 = *v14;
    OUTLINED_FUNCTION_7_13();
    OUTLINED_FUNCTION_7_31();
    v13 = OUTLINED_FUNCTION_5_27();
  }
  else
  {
    v15 = 0;
  }
  OUTLINED_FUNCTION_0_29(v13, sel_setTitle_);

  OUTLINED_FUNCTION_30_13();
  if (v0)
  {
    v18 = *v17;
    OUTLINED_FUNCTION_7_13();
    OUTLINED_FUNCTION_7_31();
    v16 = OUTLINED_FUNCTION_5_27();
  }
  else
  {
    v18 = 0;
  }
  OUTLINED_FUNCTION_0_29(v16, sel_setSubtitle_);

  OUTLINED_FUNCTION_30_13();
  if (v0)
  {
    v21 = *v20;
    OUTLINED_FUNCTION_7_13();
    OUTLINED_FUNCTION_7_31();
    v19 = OUTLINED_FUNCTION_5_27();
  }
  else
  {
    v21 = 0;
  }
  OUTLINED_FUNCTION_0_29(v19, sel_setBody_);

  swift_release();
  OUTLINED_FUNCTION_8_1();
}

void sub_22D32CAB0()
{
  void *v0;
  uint64_t v1;

  sub_22D2C3D58(v0, (SEL *)&selRef_applicationId);
  if (v1)
  {
    sub_22D2B6930();
    sub_22D330394();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

id sub_22D32CB40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  int v21;
  id v22;
  void *v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  char v25;
  void *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  void *v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  uint64_t (*v31)(uint64_t, uint64_t);
  void *v32;
  uint64_t v34;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D69C90);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_10_30();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - v6;
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v34 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v34 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v34 - v14;
  v16 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_22D2EAE80(a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_notificationId, (uint64_t)v15, &qword_255D69C90);
  sub_22D32FE30();
  v17 = OUTLINED_FUNCTION_93_2((uint64_t)v15);
  v18 = v16;
  if (v17 == 1)
  {
    sub_22D2B6CDC((uint64_t)v15, &qword_255D69C90);
    v19 = 0;
  }
  else
  {
    sub_22D32FE24();
    OUTLINED_FUNCTION_17_22();
    OUTLINED_FUNCTION_8_30((uint64_t)v15, v20);
    v19 = (void *)sub_22D330070();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1_33(v18, sel_setNotificationId_);

  sub_22D2EAE80(a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_appId, (uint64_t)v13, &qword_255D69C90);
  v21 = OUTLINED_FUNCTION_93_2((uint64_t)v13);
  v22 = v18;
  if (v21 == 1)
  {
    sub_22D2B6CDC((uint64_t)v13, &qword_255D69C90);
    v23 = 0;
  }
  else
  {
    sub_22D32FE24();
    OUTLINED_FUNCTION_17_22();
    OUTLINED_FUNCTION_8_30((uint64_t)v13, v24);
    v23 = (void *)sub_22D330070();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_1_33(v22, sel_setApplicationId_);

  sub_22D2EAE80(a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_title, (uint64_t)v10, &qword_255D69C90);
  OUTLINED_FUNCTION_3_14((uint64_t)v10);
  if (v25)
  {
    sub_22D2B6CDC((uint64_t)v10, &qword_255D69C90);
    v26 = 0;
  }
  else
  {
    v26 = (void *)sub_22D32FE24();
    OUTLINED_FUNCTION_17_22();
    OUTLINED_FUNCTION_8_30((uint64_t)v10, v27);
    OUTLINED_FUNCTION_24_15();
    OUTLINED_FUNCTION_18_18();
  }
  OUTLINED_FUNCTION_1_33(v22, sel_setTitle_);

  v28 = a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_subtitle;
  sub_22D2EAE80(a1 + OBJC_IVAR____TtC24SiriNotificationsIntents25NotificationsNotification_subtitle, (uint64_t)v7, &qword_255D69C90);
  OUTLINED_FUNCTION_3_14((uint64_t)v7);
  if (v25)
  {
    sub_22D2B6CDC((uint64_t)v7, &qword_255D69C90);
    v29 = 0;
  }
  else
  {
    v29 = (void *)sub_22D32FE24();
    OUTLINED_FUNCTION_17_22();
    OUTLINED_FUNCTION_8_30((uint64_t)v7, v30);
    OUTLINED_FUNCTION_24_15();
    OUTLINED_FUNCTION_18_18();
  }
  OUTLINED_FUNCTION_1_33(v22, sel_setSubtitle_);

  sub_22D2EAE80(v28, v1, &qword_255D69C90);
  OUTLINED_FUNCTION_3_14(v1);
  if (v25)
  {
    sub_22D2B6CDC(v1, &qword_255D69C90);
    v32 = 0;
  }
  else
  {
    sub_22D32FE24();
    OUTLINED_FUNCTION_17_22();
    OUTLINED_FUNCTION_8_30(v1, v31);
    v32 = (void *)OUTLINED_FUNCTION_3_30();
    OUTLINED_FUNCTION_0_4();
  }
  OUTLINED_FUNCTION_1_33(v22, sel_setBody_);

  swift_release();
  return v22;
}

id sub_22D32CF00(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  SANotificationOnDeviceObject.description.getter();

  v2 = (void *)sub_22D330070();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t SANotificationOnDeviceObject.description.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
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
  _QWORD v27[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D69FC8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27[0] = 0;
  v27[1] = 0xE000000000000000;
  sub_22D33040C();
  v4 = sub_22D330130();
  OUTLINED_FUNCTION_4_32(v4, (SEL *)&selRef_notificationId);
  OUTLINED_FUNCTION_11_27(v5, v6);
  OUTLINED_FUNCTION_28_12();
  OUTLINED_FUNCTION_0_4();
  v7 = sub_22D330130();
  OUTLINED_FUNCTION_4_32(v7, (SEL *)&selRef_applicationId);
  OUTLINED_FUNCTION_11_27(v8, v9);
  OUTLINED_FUNCTION_28_12();
  OUTLINED_FUNCTION_0_4();
  v10 = sub_22D330130();
  OUTLINED_FUNCTION_4_32(v10, (SEL *)&selRef_threadIdentifier);
  OUTLINED_FUNCTION_11_27(v11, v12);
  OUTLINED_FUNCTION_28_12();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_23_24();
  v13 = objc_msgSend(v0, sel_date);
  if (v13)
  {
    v14 = v13;
    sub_22D32F0B0();

    v15 = sub_22D32F0C8();
    v16 = 0;
  }
  else
  {
    v15 = sub_22D32F0C8();
    v16 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v3, v16, 1, v15);
  sub_22D330490();
  sub_22D2B6CDC((uint64_t)v3, &qword_255D69FC8);
  v17 = sub_22D330130();
  OUTLINED_FUNCTION_4_32(v17, (SEL *)&selRef_title);
  OUTLINED_FUNCTION_11_27(v18, v19);
  sub_22D330130();
  OUTLINED_FUNCTION_16();
  v20 = sub_22D330130();
  OUTLINED_FUNCTION_4_32(v20, (SEL *)&selRef_subtitle);
  OUTLINED_FUNCTION_11_27(v21, v22);
  sub_22D330130();
  OUTLINED_FUNCTION_16();
  v23 = OUTLINED_FUNCTION_23_24();
  OUTLINED_FUNCTION_4_32(v23, (SEL *)&selRef_body);
  OUTLINED_FUNCTION_11_27(v24, v25);
  sub_22D330130();
  swift_bridgeObjectRelease();
  return v27[0];
}

uint64_t SANotificationOnDeviceObject.isEqual(_:)(uint64_t a1)
{
  void *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  NSObject *v26;
  id v28[2];
  _DWORD v29[6];
  uint64_t v30;

  v4 = sub_22D32FF98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_10_30();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v28 - v7;
  sub_22D2EAE80(a1, (uint64_t)v29, &qword_255D6A010);
  if (v30)
  {
    sub_22D2B696C(0, (unint64_t *)&qword_255D69FF8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v9 = v28[1];
      sub_22D32D594(v9);
      v11 = v10;
      v13 = v12;
      sub_22D2C3D58(v1, (SEL *)&selRef_notificationId);
      if (v13)
      {
        if (v15)
        {
          if (v11 == v14 && v13 == v15)
          {
            OUTLINED_FUNCTION_0_4();
            v17 = 1;
          }
          else
          {
            v17 = sub_22D330598();
            OUTLINED_FUNCTION_0_4();
          }
        }
        else
        {
          v17 = 0;
        }
      }
      else
      {
        if (!v15)
        {
          v17 = 1;
          goto LABEL_21;
        }
        v17 = 0;
      }
      OUTLINED_FUNCTION_0_4();
LABEL_21:
      if (qword_255D69148 != -1)
        swift_once();
      v22 = __swift_project_value_buffer(v4, (uint64_t)qword_255D765E8);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v22, v4);
      v23 = sub_22D32FF8C();
      v24 = sub_22D330274();
      if (OUTLINED_FUNCTION_15_25(v24))
      {
        v25 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v25 = 67109120;
        v29[0] = v17 & 1;
        sub_22D330340();
        _os_log_impl(&dword_22D2B0000, v23, (os_log_type_t)v8, "SANotificationOnDeviceObject isEqual | isEqual: %{BOOL}d", v25, 8u);
        OUTLINED_FUNCTION_0_0();
      }
      v26 = v23;
      v19 = v9;

      goto LABEL_26;
    }
  }
  else
  {
    sub_22D2B6CDC((uint64_t)v29, &qword_255D6A010);
  }
  if (qword_255D69148 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v4, (uint64_t)qword_255D765E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v2, v18, v4);
  v19 = sub_22D32FF8C();
  v20 = sub_22D330274();
  if (OUTLINED_FUNCTION_15_25(v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_22D2B0000, v19, (os_log_type_t)v2, "SANotificationOnDeviceObject isEqual | unable to convert object to SANotificationOnDeviceObject", v21, 2u);
    OUTLINED_FUNCTION_0_0();
  }
  v17 = 0;
  v8 = v2;
LABEL_26:

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v17 & 1;
}

uint64_t sub_22D32D518(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain();
    sub_22D3303A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = a1;
  }
  v6 = SANotificationOnDeviceObject.isEqual(_:)((uint64_t)v8);

  sub_22D2B6CDC((uint64_t)v8, &qword_255D6A010);
  return v6 & 1;
}

void sub_22D32D594(void *a1)
{
  id v2;

  v2 = objc_msgSend(a1, sel_notificationId);

  if (v2)
  {
    sub_22D33007C();

  }
  OUTLINED_FUNCTION_19();
}

void sub_22D32D5F8(void *a1)
{
  sub_22D2C3D58(a1, (SEL *)&selRef_title);
}

void sub_22D32D604(void *a1)
{
  sub_22D2C3D58(a1, (SEL *)&selRef_subtitle);
}

void sub_22D32D610(void *a1)
{
  sub_22D2C3D58(a1, (SEL *)&selRef_body);
}

void sub_22D32D61C(void *a1)
{
  sub_22D2C3D58(a1, (SEL *)&selRef_notificationId);
}

void sub_22D32D628(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_22D330070();
  objc_msgSend(a3, sel_setNotificationId_, v4);

}

void sub_22D32D66C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_22D330070();
  objc_msgSend(a3, sel_setApplicationId_, v4);

}

void sub_22D32D6B0(void *a1)
{
  sub_22D2C3D58(a1, (SEL *)&selRef_applicationId);
}

id OUTLINED_FUNCTION_0_29(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

id OUTLINED_FUNCTION_1_33(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3_30()
{
  return sub_22D330070();
}

void OUTLINED_FUNCTION_4_32(uint64_t a1, SEL *a2)
{
  void *v2;

  sub_22D2C3D58(v2, a2);
}

uint64_t OUTLINED_FUNCTION_5_27()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_6_31(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_7_31()
{
  return sub_22D330070();
}

uint64_t OUTLINED_FUNCTION_8_30@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_11_27(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_29()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_15_25(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_17()
{
  return sub_22D330070();
}

uint64_t OUTLINED_FUNCTION_22_21()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_23_24()
{
  return sub_22D330130();
}

uint64_t OUTLINED_FUNCTION_24_15()
{
  return sub_22D330070();
}

uint64_t OUTLINED_FUNCTION_25_19()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26_17()
{
  return swift_getObjCClassFromMetadata();
}

uint64_t OUTLINED_FUNCTION_28_12()
{
  return sub_22D330130();
}

uint64_t OUTLINED_FUNCTION_29_17()
{
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for FollowupNotificationsCATs()
{
  uint64_t result;

  result = qword_255D6F240;
  if (!qword_255D6F240)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22D32D80C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_22D32D848()
{
  return type metadata accessor for FollowupNotificationsCATs();
}

void sub_22D32D850()
{
  sub_22D32D868(MEMORY[0x24BE9C720]);
}

void sub_22D32D85C()
{
  sub_22D32D868(MEMORY[0x24BE9C740]);
}

void sub_22D32D868(void (*a1)(void))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D6B120);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_0();
  v5 = v4 - v3;
  sub_22D32FC20();
  sub_22D2E8384(v5);
  v6 = sub_22D32F950();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_22D2B6CDC(v5, &qword_255D6B120);
  }
  else
  {
    a1();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  OUTLINED_FUNCTION_19();
}

void sub_22D32D92C()
{
  sub_22D32D868(MEMORY[0x24BE9C728]);
}

void sub_22D32D938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_10_31();
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_3_0();
  v3 = v2 - v1;
  sub_22D32FAE8();
  if (v5)
  {
    sub_22D32FB9C();
    if (OUTLINED_FUNCTION_5_8())
    {
      swift_release();
      OUTLINED_FUNCTION_14_24();
      goto LABEL_10;
    }
  }
  else
  {
    sub_22D2B6CDC((uint64_t)v4, &qword_255D6A010);
  }
  OUTLINED_FUNCTION_14_24();
  sub_22D32FAE8();
  if (v5)
  {
    sub_22D32FBA8();
    if ((OUTLINED_FUNCTION_5_8() & 1) != 0)
      swift_release();
  }
  else
  {
    sub_22D2B6CDC((uint64_t)v4, &qword_255D6A010);
  }
LABEL_10:
  sub_22D32DAC4(v3);
  OUTLINED_FUNCTION_19();
}

uint64_t type metadata accessor for NotificationNLv4Intent()
{
  uint64_t result;

  result = qword_255D6F2F0;
  if (!qword_255D6F2F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22D32DA80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for NotificationNLv4Intent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D32DAC4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for NotificationNLv4Intent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D32DB00()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_10_31();
  v0 = sub_22D32FAE8();
  if (v19)
  {
    OUTLINED_FUNCTION_15_26();
    if ((OUTLINED_FUNCTION_0_30() & 1) != 0)
    {
      OUTLINED_FUNCTION_4_33();
      OUTLINED_FUNCTION_7_32();
      OUTLINED_FUNCTION_30_1();
      if (v18)
      {
        OUTLINED_FUNCTION_25_7();
        v3 = OUTLINED_FUNCTION_9_28();
        OUTLINED_FUNCTION_18_0();
        if (v3)
          goto LABEL_26;
        OUTLINED_FUNCTION_30_1();
      }
      swift_release();
    }
  }
  else
  {
    OUTLINED_FUNCTION_13_25(v0, &qword_255D6A010, v1, v2);
  }
  v4 = OUTLINED_FUNCTION_8_31();
  if (v19)
  {
    sub_22D32FB00();
    if ((OUTLINED_FUNCTION_0_30() & 1) != 0)
    {
      OUTLINED_FUNCTION_4_33();
      OUTLINED_FUNCTION_7_32();
      OUTLINED_FUNCTION_30_1();
      if (v18)
      {
        OUTLINED_FUNCTION_25_7();
        v7 = OUTLINED_FUNCTION_9_28();
        OUTLINED_FUNCTION_18_0();
        if (v7)
          goto LABEL_26;
        OUTLINED_FUNCTION_30_1();
      }
      swift_release();
    }
  }
  else
  {
    OUTLINED_FUNCTION_13_25(v4, &qword_255D6A010, v5, v6);
  }
  v8 = OUTLINED_FUNCTION_8_31();
  if (!v19)
  {
    OUTLINED_FUNCTION_13_25(v8, &qword_255D6A010, v9, v10);
    goto LABEL_22;
  }
  sub_22D32FBF0();
  if ((OUTLINED_FUNCTION_0_30() & 1) == 0)
    goto LABEL_22;
  OUTLINED_FUNCTION_4_33();
  OUTLINED_FUNCTION_7_32();
  OUTLINED_FUNCTION_30_1();
  if (!v18)
  {
LABEL_21:
    swift_release();
LABEL_22:
    v12 = OUTLINED_FUNCTION_8_31();
    if (v19)
    {
      sub_22D32FBCC();
      if ((OUTLINED_FUNCTION_0_30() & 1) != 0)
      {
        OUTLINED_FUNCTION_4_33();
        sub_22D32F9EC();
        OUTLINED_FUNCTION_30_1();
        if (v18)
        {
          OUTLINED_FUNCTION_25_7();
          v15 = OUTLINED_FUNCTION_9_28();
          OUTLINED_FUNCTION_18_0();
          if (v15)
            goto LABEL_26;
          OUTLINED_FUNCTION_30_1();
        }
        swift_release();
      }
    }
    else
    {
      OUTLINED_FUNCTION_13_25(v12, &qword_255D6A010, v13, v14);
    }
    return 0;
  }
  OUTLINED_FUNCTION_25_7();
  v11 = OUTLINED_FUNCTION_9_28();
  OUTLINED_FUNCTION_18_0();
  if (!v11)
  {
    OUTLINED_FUNCTION_30_1();
    goto LABEL_21;
  }
LABEL_26:
  v16 = sub_22D32E2D8();
  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_18_0();
  swift_release();
  return v16;
}

BOOL sub_22D32DD30()
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
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v15)(char *, uint64_t, uint64_t);
  int v16;
  _QWORD v18[3];
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(qword_255D6F290);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_3_0();
  v3 = v2 - v1;
  v4 = sub_22D32FB6C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - v9;
  OUTLINED_FUNCTION_10_31();
  sub_22D32FAE8();
  if (!v19)
  {
    sub_22D2B6CDC((uint64_t)v18, &qword_255D6A010);
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_15_26();
  if ((OUTLINED_FUNCTION_5_8() & 1) == 0)
    goto LABEL_11;
  swift_retain();
  sub_22D32F9EC();
  OUTLINED_FUNCTION_106_0();
  if (!v18[0])
    goto LABEL_10;
  swift_retain();
  v11 = sub_22D32FA94();
  swift_release();
  if (!v11)
  {
    OUTLINED_FUNCTION_106_0();
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  sub_22D32FB60();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_106_0();
  if (__swift_getEnumTagSinglePayload(v3, 1, v4) == 1)
  {
    sub_22D2B6CDC(v3, qword_255D6F290);
  }
  else
  {
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 32);
    v15(v10, v3, v4);
    v15(v8, (uint64_t)v10, v4);
    LODWORD(v15) = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
    v16 = *MEMORY[0x24BEA11C8];
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    if ((_DWORD)v15 == v16)
      return 1;
  }
LABEL_11:
  sub_22D32FAE8();
  if (!v19)
  {
    sub_22D2B6CDC((uint64_t)v18, &qword_255D6A010);
    return 0;
  }
  OUTLINED_FUNCTION_15_26();
  if ((OUTLINED_FUNCTION_5_8() & 1) == 0)
    return 0;
  swift_retain();
  sub_22D32F9EC();
  OUTLINED_FUNCTION_3_5();
  if (!v18[0])
    goto LABEL_21;
  v12 = sub_22D32FB78();
  if (!v12)
  {
    OUTLINED_FUNCTION_3_5();
LABEL_21:
    swift_release();
    return 0;
  }
  if (v12 >> 62)
    v13 = sub_22D3304C0();
  else
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_5();
  swift_release();
  return v13 != 0;
}

uint64_t sub_22D32E028()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD v18[4];

  v0 = sub_22D32FF98();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v18 - v5;
  OUTLINED_FUNCTION_10_31();
  sub_22D32FAE8();
  if (!v18[3])
  {
    sub_22D2B6CDC((uint64_t)v18, &qword_255D6A010);
    goto LABEL_6;
  }
  sub_22D32FB00();
  if ((OUTLINED_FUNCTION_5_8() & 1) == 0)
  {
LABEL_6:
    if (qword_255D69148 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v0, (uint64_t)qword_255D765E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v8, v0);
    v9 = sub_22D32FF8C();
    v10 = sub_22D330274();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_1_4();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22D2B0000, v9, v10, "NotificationNLv4Intent getEntity | unable covert task to UsoTask_read_uso_NoEntity", v11, 2u);
      OUTLINED_FUNCTION_0_0();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    return 0;
  }
  OUTLINED_FUNCTION_25_7();
  sub_22D32F9EC();
  OUTLINED_FUNCTION_18_0();
  if (!v18[0])
  {
    if (qword_255D69148 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v0, (uint64_t)qword_255D765E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v13, v0);
    v14 = sub_22D32FF8C();
    v15 = sub_22D330274();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)OUTLINED_FUNCTION_1_4();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_22D2B0000, v14, v15, "NotificationNLv4Intent getEntity | unable to obtain reference", v16, 2u);
      OUTLINED_FUNCTION_0_0();
    }

    OUTLINED_FUNCTION_18_0();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    return 0;
  }
  swift_retain();
  v7 = sub_22D32FA28();
  OUTLINED_FUNCTION_18_0();
  swift_release_n();
  return v7;
}

uint64_t sub_22D32E2D8()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void (*v21)(_QWORD);
  char *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  _QWORD v51[2];
  __int128 v52;
  char *v53;
  char *v54;
  unsigned int v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  void (*v60)(_QWORD);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;

  v0 = sub_22D32FAD0();
  v57 = *(_QWORD *)(v0 - 8);
  v58 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v56 = (char *)v51 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_22D32FF98();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v66 = (char *)v51 - v7;
  v8 = sub_22D32FA58();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v59 = (char *)v51 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v51 - v14;
  v16 = sub_22D32FAAC();
  if (!v16)
  {
    if (qword_255D69148 != -1)
      swift_once();
    v45 = __swift_project_value_buffer(v2, (uint64_t)qword_255D765E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v45, v2);
    v46 = sub_22D32FF8C();
    v47 = sub_22D330274();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_22D2B0000, v46, v47, "NotificationNLv4Intent getTargetAppId | unable to get uso identifiers", v48, 2u);
      MEMORY[0x22E3128E0](v48, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  v18 = *(_QWORD *)(v16 + 16);
  if (!v18)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    return 0;
  }
  v19 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v51[0] = v16;
  v20 = v16 + v19;
  v55 = *MEMORY[0x24BEA00A0];
  v61 = *(_QWORD *)(v9 + 72);
  v21 = *(void (**)(_QWORD))(v9 + 16);
  *(_QWORD *)&v17 = 136315138;
  v52 = v17;
  v51[1] = MEMORY[0x24BEE4AD8] + 8;
  v62 = v2;
  v63 = v3;
  v22 = v59;
  v60 = v21;
  v54 = v15;
  while (1)
  {
    v64 = v20;
    v65 = v18;
    v21(v15);
    if (qword_255D69148 != -1)
      swift_once();
    v23 = __swift_project_value_buffer(v2, (uint64_t)qword_255D765E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v66, v23, v2);
    ((void (*)(char *, char *, uint64_t))v21)(v22, v15, v8);
    v24 = sub_22D32FF8C();
    v25 = sub_22D330274();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v27 = swift_slowAlloc();
      v67 = v27;
      *(_DWORD *)v26 = v52;
      ((void (*)(char *, char *, uint64_t))v21)(v53, v22, v8);
      v28 = sub_22D3300B8();
      *(_QWORD *)(v26 + 4) = sub_22D2CAC84(v28, v29, &v67);
      swift_bridgeObjectRelease();
      v30 = *(void (**)(char *, uint64_t))(v9 + 8);
      v30(v22, v8);
      _os_log_impl(&dword_22D2B0000, v24, v25, "NotificationNLv4Intent identifier | %s", (uint8_t *)v26, 0xCu);
      swift_arrayDestroy();
      v31 = v27;
      v2 = v62;
      MEMORY[0x22E3128E0](v31, -1, -1);
      MEMORY[0x22E3128E0](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v63 + 8))(v66, v2);
    }
    else
    {
      v30 = *(void (**)(char *, uint64_t))(v9 + 8);
      v30(v22, v8);

      (*(void (**)(char *, uint64_t))(v3 + 8))(v66, v2);
    }
    v32 = sub_22D32FA4C();
    if (!v33)
      goto LABEL_15;
    v34 = v32;
    v35 = v33;
    v36 = v8;
    v37 = v56;
    v38 = v57;
    v39 = v58;
    (*(void (**)(char *, _QWORD, uint64_t))(v57 + 104))(v56, v55, v58);
    v40 = sub_22D32FAC4();
    v42 = v41;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v39);
    if (v34 == v40 && v35 == v42)
      break;
    v44 = sub_22D330598();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v2 = v62;
    v8 = v36;
    v15 = v54;
    v22 = v59;
    if ((v44 & 1) != 0)
      goto LABEL_25;
LABEL_15:
    v30(v15, v8);
    v21 = v60;
    v20 = v64 + v61;
    v18 = v65 - 1;
    v3 = v63;
    if (v65 == 1)
      goto LABEL_22;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = v36;
  v15 = v54;
LABEL_25:
  swift_bridgeObjectRelease();
  v49 = sub_22D32FA40();
  v30(v15, v8);
  return v49;
}

uint64_t *sub_22D32E828(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_22D32F8A8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  swift_retain();
  return a1;
}

uint64_t sub_22D32E8B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22D32F8A8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_22D32E8F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_22D32F8A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  return a1;
}

uint64_t sub_22D32E954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_22D32F8A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_22D32E9C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_22D32F8A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_22D32EA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_22D32F8A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  return a1;
}

uint64_t sub_22D32EA80()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_22D32EA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D32F8A8();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    __swift_getEnumTagSinglePayload(a1, a2, v4);
  else
    OUTLINED_FUNCTION_19();
}

uint64_t sub_22D32EB08()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D32EB14(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = sub_22D32F8A8();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t sub_22D32EB88()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D32F8A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_30()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_4_33()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_7_32()
{
  return sub_22D32F9EC();
}

uint64_t OUTLINED_FUNCTION_8_31()
{
  return sub_22D32FAE8();
}

uint64_t OUTLINED_FUNCTION_9_28()
{
  return sub_22D32FAA0();
}

uint64_t OUTLINED_FUNCTION_10_31()
{
  return type metadata accessor for NotificationNLv4Intent();
}

uint64_t OUTLINED_FUNCTION_13_25(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return sub_22D2B6CDC((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_14_24()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22D32DA80(v1, v0);
}

uint64_t OUTLINED_FUNCTION_15_26()
{
  return sub_22D32FB90();
}

uint64_t sub_22D32EC60(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D32EC9C + 4 * byte_22D336CE0[a1]))(0xD000000000000012, 0x800000022D33A2C0);
}

unint64_t sub_22D32EC9C()
{
  return 0xD000000000000011;
}

uint64_t sub_22D32ECE8()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_22D32ED60(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D32ED98 + 4 * byte_22D336CEB[a1]))(0xD000000000000015, 0x800000022D33A0C0);
}

uint64_t sub_22D32ED98(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_22D32EE24(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D32EE64 + 4 * byte_22D336CF4[a1]))(0xD000000000000015, 0x800000022D33A1A0);
}

uint64_t sub_22D32EE64()
{
  uint64_t v0;

  return v0 + 9;
}

uint64_t sub_22D32EED0()
{
  return 0x20636972656E6547;
}

uint64_t sub_22D32EEF4()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_22D32EF00()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_22D32EF0C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_22D32EF18()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_22D32EF24()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_22D32EF30()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_22D32EF3C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_22D32EF48()
{
  return MEMORY[0x24BDCB638]();
}

uint64_t sub_22D32EF54()
{
  return MEMORY[0x24BDCB6B0]();
}

uint64_t sub_22D32EF60()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_22D32EF6C()
{
  return MEMORY[0x24BDCB6D8]();
}

uint64_t sub_22D32EF78()
{
  return MEMORY[0x24BDCB708]();
}

uint64_t sub_22D32EF84()
{
  return MEMORY[0x24BDCB710]();
}

uint64_t sub_22D32EF90()
{
  return MEMORY[0x24BDCB720]();
}

uint64_t sub_22D32EF9C()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_22D32EFA8()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_22D32EFB4()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_22D32EFC0()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_22D32EFCC()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_22D32EFD8()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_22D32EFE4()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_22D32EFF0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_22D32EFFC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22D32F008()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_22D32F014()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22D32F020()
{
  return MEMORY[0x24BDCDA48]();
}

uint64_t sub_22D32F02C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_22D32F038()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22D32F044()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_22D32F050()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22D32F05C()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_22D32F068()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_22D32F074()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_22D32F080()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_22D32F08C()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_22D32F098()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_22D32F0A4()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_22D32F0B0()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_22D32F0BC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_22D32F0C8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_22D32F0D4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_22D32F0E0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22D32F0EC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22D32F0F8()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_22D32F104()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_22D32F110()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_22D32F11C()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_22D32F128()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_22D32F134()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_22D32F140()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_22D32F14C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_22D32F158()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_22D32F164()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_22D32F170()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_22D32F17C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_22D32F188()
{
  return MEMORY[0x24BE95F80]();
}

uint64_t sub_22D32F194()
{
  return MEMORY[0x24BE95FA0]();
}

uint64_t sub_22D32F1A0()
{
  return MEMORY[0x24BE95FB0]();
}

uint64_t sub_22D32F1AC()
{
  return MEMORY[0x24BE95FC0]();
}

uint64_t sub_22D32F1B8()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_22D32F1C4()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_22D32F1D0()
{
  return MEMORY[0x24BE961A8]();
}

uint64_t sub_22D32F1DC()
{
  return MEMORY[0x24BE961B8]();
}

uint64_t sub_22D32F1E8()
{
  return MEMORY[0x24BE961E8]();
}

uint64_t sub_22D32F1F4()
{
  return MEMORY[0x24BE965F0]();
}

uint64_t sub_22D32F200()
{
  return MEMORY[0x24BE96600]();
}

uint64_t sub_22D32F20C()
{
  return MEMORY[0x24BE96830]();
}

uint64_t sub_22D32F218()
{
  return MEMORY[0x24BE968E0]();
}

uint64_t sub_22D32F224()
{
  return MEMORY[0x24BE968F8]();
}

uint64_t sub_22D32F230()
{
  return MEMORY[0x24BE96900]();
}

uint64_t sub_22D32F23C()
{
  return MEMORY[0x24BE96928]();
}

uint64_t sub_22D32F248()
{
  return MEMORY[0x24BE96A58]();
}

uint64_t sub_22D32F254()
{
  return MEMORY[0x24BE96A68]();
}

uint64_t sub_22D32F260()
{
  return MEMORY[0x24BE96A80]();
}

uint64_t sub_22D32F26C()
{
  return MEMORY[0x24BE96A90]();
}

uint64_t sub_22D32F278()
{
  return MEMORY[0x24BE96AA8]();
}

uint64_t sub_22D32F284()
{
  return MEMORY[0x24BE96AB0]();
}

uint64_t sub_22D32F290()
{
  return MEMORY[0x24BE96AC0]();
}

uint64_t sub_22D32F29C()
{
  return MEMORY[0x24BE96AD0]();
}

uint64_t sub_22D32F2A8()
{
  return MEMORY[0x24BE96AE0]();
}

uint64_t sub_22D32F2B4()
{
  return MEMORY[0x24BE96AE8]();
}

uint64_t sub_22D32F2C0()
{
  return MEMORY[0x24BE96AF0]();
}

uint64_t sub_22D32F2CC()
{
  return MEMORY[0x24BE96AF8]();
}

uint64_t sub_22D32F2D8()
{
  return MEMORY[0x24BE96B00]();
}

uint64_t sub_22D32F2E4()
{
  return MEMORY[0x24BE96B08]();
}

uint64_t sub_22D32F2F0()
{
  return MEMORY[0x24BE96B20]();
}

uint64_t sub_22D32F2FC()
{
  return MEMORY[0x24BE96B30]();
}

uint64_t sub_22D32F308()
{
  return MEMORY[0x24BE96DF0]();
}

uint64_t sub_22D32F314()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_22D32F320()
{
  return MEMORY[0x24BE96E80]();
}

uint64_t sub_22D32F32C()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_22D32F338()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_22D32F344()
{
  return MEMORY[0x24BE96EA8]();
}

uint64_t sub_22D32F350()
{
  return MEMORY[0x24BE96EB8]();
}

uint64_t sub_22D32F35C()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_22D32F368()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_22D32F374()
{
  return MEMORY[0x24BE96EE0]();
}

uint64_t sub_22D32F380()
{
  return MEMORY[0x24BE96EE8]();
}

uint64_t sub_22D32F38C()
{
  return MEMORY[0x24BE96F08]();
}

uint64_t sub_22D32F398()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_22D32F3A4()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_22D32F3B0()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_22D32F3BC()
{
  return MEMORY[0x24BE97328]();
}

uint64_t sub_22D32F3C8()
{
  return MEMORY[0x24BE97330]();
}

uint64_t sub_22D32F3D4()
{
  return MEMORY[0x24BE97340]();
}

uint64_t sub_22D32F3E0()
{
  return MEMORY[0x24BE97358]();
}

uint64_t sub_22D32F3EC()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_22D32F3F8()
{
  return MEMORY[0x24BE97388]();
}

uint64_t sub_22D32F404()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_22D32F410()
{
  return MEMORY[0x24BE97428]();
}

uint64_t sub_22D32F41C()
{
  return MEMORY[0x24BE97430]();
}

uint64_t sub_22D32F428()
{
  return MEMORY[0x24BE97438]();
}

uint64_t sub_22D32F434()
{
  return MEMORY[0x24BE97440]();
}

uint64_t sub_22D32F440()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_22D32F44C()
{
  return MEMORY[0x24BE97588]();
}

uint64_t sub_22D32F458()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_22D32F464()
{
  return MEMORY[0x24BE975D0]();
}

uint64_t sub_22D32F470()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_22D32F47C()
{
  return MEMORY[0x24BE975F8]();
}

uint64_t sub_22D32F488()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_22D32F494()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_22D32F4A0()
{
  return MEMORY[0x24BE976B8]();
}

uint64_t sub_22D32F4AC()
{
  return MEMORY[0x24BE976D0]();
}

uint64_t sub_22D32F4B8()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_22D32F4C4()
{
  return MEMORY[0x24BE97770]();
}

uint64_t sub_22D32F4D0()
{
  return MEMORY[0x24BE97778]();
}

uint64_t sub_22D32F4DC()
{
  return MEMORY[0x24BE97780]();
}

uint64_t sub_22D32F4E8()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_22D32F4F4()
{
  return MEMORY[0x24BE97AA8]();
}

uint64_t sub_22D32F500()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_22D32F50C()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_22D32F518()
{
  return MEMORY[0x24BE97C70]();
}

uint64_t sub_22D32F524()
{
  return MEMORY[0x24BE97C78]();
}

uint64_t sub_22D32F530()
{
  return MEMORY[0x24BE97CA8]();
}

uint64_t sub_22D32F53C()
{
  return MEMORY[0x24BE97CB0]();
}

uint64_t sub_22D32F548()
{
  return MEMORY[0x24BE97CE0]();
}

uint64_t sub_22D32F554()
{
  return MEMORY[0x24BE97D00]();
}

uint64_t sub_22D32F560()
{
  return MEMORY[0x24BE97D08]();
}

uint64_t sub_22D32F56C()
{
  return MEMORY[0x24BE97D10]();
}

uint64_t sub_22D32F578()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_22D32F584()
{
  return MEMORY[0x24BE97D48]();
}

uint64_t sub_22D32F590()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_22D32F59C()
{
  return MEMORY[0x24BE97D78]();
}

uint64_t sub_22D32F5A8()
{
  return MEMORY[0x24BE97DA0]();
}

uint64_t sub_22D32F5B4()
{
  return MEMORY[0x24BE97DB8]();
}

uint64_t sub_22D32F5C0()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t sub_22D32F5CC()
{
  return MEMORY[0x24BE97DE0]();
}

uint64_t sub_22D32F5D8()
{
  return MEMORY[0x24BE97E08]();
}

uint64_t sub_22D32F5E4()
{
  return MEMORY[0x24BE97E20]();
}

uint64_t sub_22D32F5F0()
{
  return MEMORY[0x24BE97E30]();
}

uint64_t sub_22D32F5FC()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_22D32F608()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_22D32F614()
{
  return MEMORY[0x24BE97F28]();
}

uint64_t sub_22D32F620()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t sub_22D32F62C()
{
  return MEMORY[0x24BE97F40]();
}

uint64_t sub_22D32F638()
{
  return MEMORY[0x24BE97F48]();
}

uint64_t sub_22D32F644()
{
  return MEMORY[0x24BE97F50]();
}

uint64_t sub_22D32F650()
{
  return MEMORY[0x24BE97F58]();
}

uint64_t sub_22D32F65C()
{
  return MEMORY[0x24BE97F60]();
}

uint64_t sub_22D32F668()
{
  return MEMORY[0x24BE97F68]();
}

uint64_t sub_22D32F674()
{
  return MEMORY[0x24BE97F80]();
}

uint64_t sub_22D32F680()
{
  return MEMORY[0x24BE97FD8]();
}

uint64_t sub_22D32F68C()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_22D32F698()
{
  return MEMORY[0x24BE98180]();
}

uint64_t sub_22D32F6A4()
{
  return MEMORY[0x24BE98188]();
}

uint64_t sub_22D32F6B0()
{
  return MEMORY[0x24BE98200]();
}

uint64_t sub_22D32F6BC()
{
  return MEMORY[0x24BE98218]();
}

uint64_t sub_22D32F6C8()
{
  return MEMORY[0x24BE98220]();
}

uint64_t sub_22D32F6D4()
{
  return MEMORY[0x24BE98228]();
}

uint64_t sub_22D32F6E0()
{
  return MEMORY[0x24BE98310]();
}

uint64_t sub_22D32F6EC()
{
  return MEMORY[0x24BE98320]();
}

uint64_t sub_22D32F6F8()
{
  return MEMORY[0x24BE983E8]();
}

uint64_t sub_22D32F704()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_22D32F710()
{
  return MEMORY[0x24BE984E0]();
}

uint64_t sub_22D32F71C()
{
  return MEMORY[0x24BE98538]();
}

uint64_t sub_22D32F728()
{
  return MEMORY[0x24BE98638]();
}

uint64_t sub_22D32F734()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_22D32F740()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_22D32F74C()
{
  return MEMORY[0x24BE98700]();
}

uint64_t sub_22D32F758()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_22D32F764()
{
  return MEMORY[0x24BE98858]();
}

uint64_t sub_22D32F770()
{
  return MEMORY[0x24BE98868]();
}

uint64_t sub_22D32F77C()
{
  return MEMORY[0x24BE98898]();
}

uint64_t sub_22D32F788()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_22D32F794()
{
  return MEMORY[0x24BE98978]();
}

uint64_t sub_22D32F7A0()
{
  return MEMORY[0x24BE98980]();
}

uint64_t sub_22D32F7AC()
{
  return MEMORY[0x24BE98988]();
}

uint64_t sub_22D32F7B8()
{
  return MEMORY[0x24BE98990]();
}

uint64_t sub_22D32F7C4()
{
  return MEMORY[0x24BE98AE0]();
}

uint64_t sub_22D32F7D0()
{
  return MEMORY[0x24BE98AE8]();
}

uint64_t sub_22D32F7DC()
{
  return MEMORY[0x24BE98AF0]();
}

uint64_t sub_22D32F7E8()
{
  return MEMORY[0x24BE98AF8]();
}

uint64_t sub_22D32F7F4()
{
  return MEMORY[0x24BE98B00]();
}

uint64_t sub_22D32F800()
{
  return MEMORY[0x24BE98B08]();
}

uint64_t sub_22D32F80C()
{
  return MEMORY[0x24BE98B20]();
}

uint64_t sub_22D32F818()
{
  return MEMORY[0x24BE98B28]();
}

uint64_t sub_22D32F824()
{
  return MEMORY[0x24BE98D08]();
}

uint64_t sub_22D32F830()
{
  return MEMORY[0x24BE98D18]();
}

uint64_t sub_22D32F83C()
{
  return MEMORY[0x24BE98D28]();
}

uint64_t sub_22D32F848()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_22D32F854()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_22D32F860()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_22D32F86C()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_22D32F878()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_22D32F884()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_22D32F890()
{
  return MEMORY[0x24BE98ED8]();
}

uint64_t sub_22D32F89C()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_22D32F8A8()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_22D32F8B4()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_22D32F8C0()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_22D32F8CC()
{
  return MEMORY[0x24BE9C160]();
}

uint64_t sub_22D32F8D8()
{
  return MEMORY[0x24BE9C168]();
}

uint64_t sub_22D32F8E4()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_22D32F8F0()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_22D32F8FC()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_22D32F908()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t sub_22D32F914()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t sub_22D32F920()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_22D32F92C()
{
  return MEMORY[0x24BE9C7A0]();
}

uint64_t sub_22D32F938()
{
  return MEMORY[0x24BE9C7B0]();
}

uint64_t sub_22D32F944()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_22D32F950()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_22D32F95C()
{
  return MEMORY[0x24BE9CD28]();
}

uint64_t sub_22D32F968()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t sub_22D32F974()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t sub_22D32F980()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_22D32F98C()
{
  return MEMORY[0x24BE9D0E0]();
}

uint64_t sub_22D32F998()
{
  return MEMORY[0x24BE9D0E8]();
}

uint64_t sub_22D32F9A4()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t sub_22D32F9B0()
{
  return MEMORY[0x24BE9E000]();
}

uint64_t sub_22D32F9BC()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t sub_22D32F9C8()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t sub_22D32F9D4()
{
  return MEMORY[0x24BE9EAF8]();
}

uint64_t sub_22D32F9E0()
{
  return MEMORY[0x24BE9EB10]();
}

uint64_t sub_22D32F9EC()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_22D32F9F8()
{
  return MEMORY[0x24BE9EE58]();
}

uint64_t sub_22D32FA04()
{
  return MEMORY[0x24BE9EE60]();
}

uint64_t sub_22D32FA10()
{
  return MEMORY[0x24BE9EF18]();
}

uint64_t sub_22D32FA1C()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_22D32FA28()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_22D32FA34()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_22D32FA40()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_22D32FA4C()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_22D32FA58()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_22D32FA64()
{
  return MEMORY[0x24BE9FAB0]();
}

uint64_t sub_22D32FA70()
{
  return MEMORY[0x24BE9FAB8]();
}

uint64_t sub_22D32FA7C()
{
  return MEMORY[0x24BE9FAC0]();
}

uint64_t sub_22D32FA88()
{
  return MEMORY[0x24BE9FE58]();
}

uint64_t sub_22D32FA94()
{
  return MEMORY[0x24BE9FF30]();
}

uint64_t sub_22D32FAA0()
{
  return MEMORY[0x24BE9FF38]();
}

uint64_t sub_22D32FAAC()
{
  return MEMORY[0x24BE9FF60]();
}

uint64_t sub_22D32FAB8()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t sub_22D32FAC4()
{
  return MEMORY[0x24BEA00A8]();
}

uint64_t sub_22D32FAD0()
{
  return MEMORY[0x24BEA00B8]();
}

uint64_t sub_22D32FADC()
{
  return MEMORY[0x24BEA0168]();
}

uint64_t sub_22D32FAE8()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_22D32FAF4()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_22D32FB00()
{
  return MEMORY[0x24BEA08E8]();
}

uint64_t sub_22D32FB0C()
{
  return MEMORY[0x24BEA0960]();
}

uint64_t sub_22D32FB18()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_22D32FB24()
{
  return MEMORY[0x24BEA0B38]();
}

uint64_t sub_22D32FB30()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_22D32FB3C()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_22D32FB48()
{
  return MEMORY[0x24BEA0D30]();
}

uint64_t sub_22D32FB54()
{
  return MEMORY[0x24BEA0F60]();
}

uint64_t sub_22D32FB60()
{
  return MEMORY[0x24BEA1138]();
}

uint64_t sub_22D32FB6C()
{
  return MEMORY[0x24BEA1250]();
}

uint64_t sub_22D32FB78()
{
  return MEMORY[0x24BEA1290]();
}

uint64_t sub_22D32FB84()
{
  return MEMORY[0x24BEA1CD8]();
}

uint64_t sub_22D32FB90()
{
  return MEMORY[0x24BEA1FA8]();
}

uint64_t sub_22D32FB9C()
{
  return MEMORY[0x24BEA2000]();
}

uint64_t sub_22D32FBA8()
{
  return MEMORY[0x24BEA2010]();
}

uint64_t sub_22D32FBB4()
{
  return MEMORY[0x24BEA22F8]();
}

uint64_t sub_22D32FBC0()
{
  return MEMORY[0x24BEA24E8]();
}

uint64_t sub_22D32FBCC()
{
  return MEMORY[0x24BEA2508]();
}

uint64_t sub_22D32FBD8()
{
  return MEMORY[0x24BEA2860]();
}

uint64_t sub_22D32FBE4()
{
  return MEMORY[0x24BEA2868]();
}

uint64_t sub_22D32FBF0()
{
  return MEMORY[0x24BEA2D00]();
}

uint64_t sub_22D32FBFC()
{
  return MEMORY[0x24BEA2F68]();
}

uint64_t sub_22D32FC08()
{
  return MEMORY[0x24BEA2F70]();
}

uint64_t sub_22D32FC14()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_22D32FC20()
{
  return MEMORY[0x24BEA3650]();
}

uint64_t sub_22D32FC2C()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_22D32FC38()
{
  return MEMORY[0x24BE042D0]();
}

uint64_t sub_22D32FC44()
{
  return MEMORY[0x24BE042D8]();
}

uint64_t sub_22D32FC50()
{
  return MEMORY[0x24BE1E2A8]();
}

uint64_t sub_22D32FC5C()
{
  return MEMORY[0x24BE1E2C0]();
}

uint64_t sub_22D32FC68()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_22D32FC74()
{
  return MEMORY[0x24BEA87E8]();
}

uint64_t sub_22D32FC80()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_22D32FC8C()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_22D32FC98()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_22D32FCA4()
{
  return MEMORY[0x24BEA8AC0]();
}

uint64_t sub_22D32FCB0()
{
  return MEMORY[0x24BEA8AE8]();
}

uint64_t sub_22D32FCBC()
{
  return MEMORY[0x24BEA8B70]();
}

uint64_t sub_22D32FCC8()
{
  return MEMORY[0x24BEA8E00]();
}

uint64_t sub_22D32FCD4()
{
  return MEMORY[0x24BEA7920]();
}

uint64_t sub_22D32FCE0()
{
  return MEMORY[0x24BEA7940]();
}

uint64_t sub_22D32FCEC()
{
  return MEMORY[0x24BEA7958]();
}

uint64_t sub_22D32FCF8()
{
  return MEMORY[0x24BEA7970]();
}

uint64_t sub_22D32FD04()
{
  return MEMORY[0x24BEA7980]();
}

uint64_t sub_22D32FD10()
{
  return MEMORY[0x24BEA7988]();
}

uint64_t sub_22D32FD1C()
{
  return MEMORY[0x24BE927E0]();
}

uint64_t sub_22D32FD28()
{
  return MEMORY[0x24BE927F0]();
}

uint64_t sub_22D32FD34()
{
  return MEMORY[0x24BE927F8]();
}

uint64_t sub_22D32FD40()
{
  return MEMORY[0x24BE92808]();
}

uint64_t sub_22D32FD4C()
{
  return MEMORY[0x24BE92828]();
}

uint64_t sub_22D32FD58()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_22D32FD64()
{
  return MEMORY[0x24BE92860]();
}

uint64_t sub_22D32FD70()
{
  return MEMORY[0x24BE92888]();
}

uint64_t sub_22D32FD7C()
{
  return MEMORY[0x24BE92898]();
}

uint64_t sub_22D32FD88()
{
  return MEMORY[0x24BE928A0]();
}

uint64_t sub_22D32FD94()
{
  return MEMORY[0x24BE928A8]();
}

uint64_t sub_22D32FDA0()
{
  return MEMORY[0x24BE928B0]();
}

uint64_t sub_22D32FDAC()
{
  return MEMORY[0x24BE928C0]();
}

uint64_t sub_22D32FDB8()
{
  return MEMORY[0x24BE928D8]();
}

uint64_t sub_22D32FDC4()
{
  return MEMORY[0x24BE928E0]();
}

uint64_t sub_22D32FDD0()
{
  return MEMORY[0x24BE928E8]();
}

uint64_t sub_22D32FDDC()
{
  return MEMORY[0x24BE928F8]();
}

uint64_t sub_22D32FDE8()
{
  return MEMORY[0x24BE92928]();
}

uint64_t sub_22D32FDF4()
{
  return MEMORY[0x24BE92938]();
}

uint64_t sub_22D32FE00()
{
  return MEMORY[0x24BE92940]();
}

uint64_t sub_22D32FE0C()
{
  return MEMORY[0x24BE92950]();
}

uint64_t sub_22D32FE18()
{
  return MEMORY[0x24BE929A8]();
}

uint64_t sub_22D32FE24()
{
  return MEMORY[0x24BE929B0]();
}

uint64_t sub_22D32FE30()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_22D32FE3C()
{
  return MEMORY[0x24BE92B18]();
}

uint64_t sub_22D32FE48()
{
  return MEMORY[0x24BE92B20]();
}

uint64_t sub_22D32FE54()
{
  return MEMORY[0x24BE92B28]();
}

uint64_t sub_22D32FE60()
{
  return MEMORY[0x24BE92B30]();
}

uint64_t sub_22D32FE6C()
{
  return MEMORY[0x24BE92B38]();
}

uint64_t sub_22D32FE78()
{
  return MEMORY[0x24BE92B40]();
}

uint64_t sub_22D32FE84()
{
  return MEMORY[0x24BE92B50]();
}

uint64_t sub_22D32FE90()
{
  return MEMORY[0x24BE92B58]();
}

uint64_t sub_22D32FE9C()
{
  return MEMORY[0x24BE92B60]();
}

uint64_t sub_22D32FEA8()
{
  return MEMORY[0x24BE92B78]();
}

uint64_t sub_22D32FEB4()
{
  return MEMORY[0x24BE92BE0]();
}

uint64_t sub_22D32FEC0()
{
  return MEMORY[0x24BE92BF0]();
}

uint64_t sub_22D32FECC()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_22D32FED8()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_22D32FEE4()
{
  return MEMORY[0x24BE90B88]();
}

uint64_t sub_22D32FEF0()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_22D32FEFC()
{
  return MEMORY[0x24BE92ED8]();
}

uint64_t sub_22D32FF08()
{
  return MEMORY[0x24BE92F08]();
}

uint64_t sub_22D32FF14()
{
  return MEMORY[0x24BE92F70]();
}

uint64_t sub_22D32FF20()
{
  return MEMORY[0x24BE92FA0]();
}

uint64_t sub_22D32FF2C()
{
  return MEMORY[0x24BEA5450]();
}

uint64_t sub_22D32FF38()
{
  return MEMORY[0x24BEA5480]();
}

uint64_t sub_22D32FF44()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_22D32FF50()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_22D32FF5C()
{
  return MEMORY[0x24BDFCA98]();
}

uint64_t sub_22D32FF68()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_22D32FF74()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_22D32FF80()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_22D32FF8C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22D32FF98()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22D32FFA4()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_22D32FFB0()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_22D32FFBC()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_22D32FFC8()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_22D32FFD4()
{
  return MEMORY[0x24BEA59D8]();
}

uint64_t sub_22D32FFE0()
{
  return MEMORY[0x24BEA5A38]();
}

uint64_t sub_22D32FFEC()
{
  return MEMORY[0x24BEA5A40]();
}

uint64_t sub_22D32FFF8()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_22D330004()
{
  return MEMORY[0x24BEA5A98]();
}

uint64_t sub_22D330010()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_22D33001C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22D330028()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22D330034()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_22D330040()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_22D33004C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22D330058()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_22D330064()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22D330070()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22D33007C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22D330088()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_22D330094()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_22D3300A0()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_22D3300AC()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_22D3300B8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22D3300C4()
{
  return MEMORY[0x24BEE09F8]();
}

uint64_t sub_22D3300D0()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_22D3300DC()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_22D3300E8()
{
  return MEMORY[0x24BEE0A78]();
}

uint64_t sub_22D3300F4()
{
  return MEMORY[0x24BEE0A80]();
}

uint64_t sub_22D330100()
{
  return MEMORY[0x24BEE0A88]();
}

uint64_t sub_22D33010C()
{
  return MEMORY[0x24BEE0AA0]();
}

uint64_t sub_22D330118()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22D330124()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_22D330130()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22D33013C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_22D330148()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22D330154()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_22D330160()
{
  return MEMORY[0x24BEE0C90]();
}

uint64_t sub_22D33016C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_22D330178()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22D330184()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_22D330190()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_22D33019C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_22D3301A8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22D3301B4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22D3301C0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22D3301CC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_22D3301D8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22D3301E4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22D3301F0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22D3301FC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22D330208()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22D330214()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22D330220()
{
  return MEMORY[0x24BEE6978]();
}

uint64_t sub_22D33022C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22D330238()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22D330244()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_22D330250()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_22D33025C()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_22D330268()
{
  return MEMORY[0x24BDCFE90]();
}

uint64_t sub_22D330274()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22D330280()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22D33028C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22D330298()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22D3302A4()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_22D3302B0()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_22D3302BC()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_22D3302C8()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_22D3302D4()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_22D3302E0()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_22D3302EC()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_22D3302F8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22D330304()
{
  return MEMORY[0x24BDD0260]();
}

uint64_t sub_22D330310()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22D33031C()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_22D330328()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22D330334()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_22D330340()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22D33034C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22D330358()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_22D330364()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_22D330370()
{
  return MEMORY[0x24BDD04F0]();
}

uint64_t sub_22D33037C()
{
  return MEMORY[0x24BDD0518]();
}

uint64_t sub_22D330388()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_22D330394()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_22D3303A0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22D3303AC()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_22D3303B8()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_22D3303C4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_22D3303D0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22D3303DC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22D3303E8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_22D3303F4()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_22D330400()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_22D33040C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22D330418()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22D330424()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22D330430()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_22D33043C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22D330448()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_22D330454()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_22D330460()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_22D33046C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_22D330478()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_22D330484()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_22D330490()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22D33049C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22D3304A8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22D3304B4()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_22D3304C0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22D3304CC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22D3304D8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22D3304E4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22D3304F0()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_22D3304FC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_22D330508()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22D330514()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_22D330520()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22D33052C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_22D330538()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_22D330544()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22D330550()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_22D33055C()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22D330568()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_22D330574()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22D330580()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22D33058C()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_22D330598()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22D3305A4()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_22D3305B0()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_22D3305BC()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_22D3305C8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22D3305D4()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_22D3305E0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22D3305EC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22D3305F8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22D330604()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22D330610()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22D33061C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22D330628()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_22D330634()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22D330640()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22D33064C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22D330658()
{
  return MEMORY[0x24BEE47C8]();
}

uint64_t sub_22D330664()
{
  return MEMORY[0x24BEE47D0]();
}

uint64_t sub_22D330670()
{
  return MEMORY[0x24BEE47E0]();
}

uint64_t sub_22D33067C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22D330688()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AFSiriAnnouncementPlatformGetName()
{
  return MEMORY[0x24BE08F80]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x24BE1B200]();
}

uint64_t CEMEmojiTokenCopyNameWithCount()
{
  return MEMORY[0x24BE1B248]();
}

uint64_t CEMEmojiTokenCreateWithString()
{
  return MEMORY[0x24BE1B250]();
}

uint64_t CEMEmojiTokensAreEquivalent()
{
  return MEMORY[0x24BE1B260]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithLocaleAndBlock()
{
  return MEMORY[0x24BE1B270]();
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

