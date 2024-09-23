uint64_t type metadata accessor for OverrideResult(uint64_t a1)
{
  return sub_2195313E0(a1, (uint64_t *)&unk_253F22018);
}

uint64_t sub_21952D470()
{
  uint64_t result;
  unint64_t v1;

  result = sub_219557604();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.match(inputs:for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

void sub_21952D4EC()
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
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  id v21;
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
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  OUTLINED_FUNCTION_62();
  v6 = v5;
  type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_31_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22168);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_9_0();
  v11 = v10 - v9;
  v12 = sub_21955743C();
  v53 = *(_QWORD *)(v12 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_11_4(v14, v47);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21FF0);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v15);
  v16 = OUTLINED_FUNCTION_7_4();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_5_7();
  Array<A>.currentTurn.getter(v6, v1);
  OUTLINED_FUNCTION_39_1(v1, 1, v16);
  if (v20)
  {
    v18 = &qword_253F21FF0;
    v19 = v1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v2, v1, v16);
    Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter(v11);
    OUTLINED_FUNCTION_39_1(v11, 1, v12);
    if (!v20)
    {
      v49 = v17;
      v54 = v16;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v53 + 32))(v52, v11, v12);
      v22 = sub_219557F70();
      v24 = v23;
      v25 = v22;
      v26 = sub_219549050(v52);
      v27 = v2;
      v28 = v26;
      if (v26)
      {
        OUTLINED_FUNCTION_81();
        v29 = *(_QWORD *)(v28 + 16);
        if (v29)
        {
          v50 = v27;
          v55 = MEMORY[0x24BEE4AF8];
          sub_21952E9C0(0, v29, 0);
          v30 = v28 + ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80));
          v51 = *(_QWORD *)(v0 + 72);
          v48 = v29;
          v31 = v29;
          do
          {
            sub_21952EC38(v30, v4, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
            v32 = (uint64_t *)(v4 + *(int *)(v3 + 44));
            if (v32[1])
            {
              v33 = *v32;
              v34 = v32[1];
            }
            else
            {
              v34 = 0xE500000000000000;
              v33 = 0x296C696E28;
            }
            swift_bridgeObjectRetain();
            sub_21952ECDC(v4, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
            v35 = v55;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_21952E9C0(0, *(_QWORD *)(v55 + 16) + 1, 1);
              v35 = v55;
            }
            v37 = *(_QWORD *)(v35 + 16);
            v36 = *(_QWORD *)(v35 + 24);
            if (v37 >= v36 >> 1)
            {
              sub_21952E9C0(v36 > 1, v37 + 1, 1);
              v35 = v55;
            }
            *(_QWORD *)(v35 + 16) = v37 + 1;
            v38 = v35 + 16 * v37;
            *(_QWORD *)(v38 + 32) = v33;
            *(_QWORD *)(v38 + 40) = v34;
            v30 += v51;
            --v31;
          }
          while (v31);
          swift_release();
          v27 = v50;
          v29 = v48;
        }
        sub_2195582A0();
        if (qword_253F22160 != -1)
          swift_once();
        v39 = (void *)qword_253F221A8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
        v40 = OUTLINED_FUNCTION_8();
        v41 = MEMORY[0x24BEE1768];
        *(_OWORD *)(v40 + 16) = xmmword_219558D80;
        v42 = MEMORY[0x24BEE17F0];
        *(_QWORD *)(v40 + 56) = v41;
        *(_QWORD *)(v40 + 64) = v42;
        *(_QWORD *)(v40 + 32) = v29;
        v43 = v39;
        OUTLINED_FUNCTION_35_1();

        OUTLINED_FUNCTION_37();
        sub_21952EEA0();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_19_3();
        OUTLINED_FUNCTION_24_1(v27, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
      }
      else
      {
        sub_219558294();
        if (qword_253F22160 != -1)
          swift_once();
        v44 = (void *)qword_253F221A8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
        v45 = OUTLINED_FUNCTION_8();
        *(_OWORD *)(v45 + 16) = xmmword_219558D80;
        *(_QWORD *)(v45 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v45 + 64) = sub_21952E30C();
        *(_QWORD *)(v45 + 32) = v25;
        *(_QWORD *)(v45 + 40) = v24;
        v46 = v44;
        OUTLINED_FUNCTION_35_1();

        OUTLINED_FUNCTION_37();
        OUTLINED_FUNCTION_19_3();
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v2, v54);
      }
      goto LABEL_25;
    }
    OUTLINED_FUNCTION_24_1(v2, *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
    v18 = &qword_253F22168;
    v19 = v11;
  }
  sub_21952F3F8(v19, v18);
  sub_2195582AC();
  if (qword_253F22160 != -1)
    swift_once();
  v21 = (id)qword_253F221A8;
  OUTLINED_FUNCTION_8_4();

LABEL_25:
  OUTLINED_FUNCTION_1_0();
}

uint64_t type metadata accessor for SiriNLOverride()
{
  uint64_t result;

  result = qword_253F22258;
  if (!qword_253F22258)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A2EE2C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter@<X0>(uint64_t a1@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  sub_219557640();
  MEMORY[0x24BDAC7A8]();
  if ((sub_219557F58() & 1) != 0
    && (OUTLINED_FUNCTION_1_7(), v2 = sub_219557634(), OUTLINED_FUNCTION_0_6(), (v2 & 1) != 0))
  {
    OUTLINED_FUNCTION_1_7();
    sub_21955761C();
    OUTLINED_FUNCTION_0_6();
    sub_2195573D0();
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  v4 = sub_21955743C();
  return __swift_storeEnumTagSinglePayload(a1, v3, 1, v4);
}

void sub_21952DFEC(_Unwind_Exception *a1, uint64_t a2, void *a3, ...)
{
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a3);

  marisa::Agent::~Agent((marisa::Agent *)va);
  _Unwind_Resume(a1);
}

void sub_21952E050()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_72_0();
  if (v6)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = OUTLINED_FUNCTION_64();
  if (!v7 || v5 > *(_QWORD *)(v2 + 24) >> 1)
  {
    if (v4 <= v5)
      v8 = v5;
    else
      v8 = v4;
    sub_219546804(v7, v8, 1, (char *)v2);
    v2 = v9;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_14;
    goto LABEL_16;
  }
  if ((*(_QWORD *)(v2 + 24) >> 1) - *(_QWORD *)(v2 + 16) < v3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_arrayInitWithCopy();
  if (!v3)
  {
LABEL_14:
    OUTLINED_FUNCTION_10();
    *v1 = v2;
    OUTLINED_FUNCTION_20_3();
    return;
  }
  v10 = *(_QWORD *)(v2 + 16);
  v6 = __OFADD__(v10, v3);
  v11 = v10 + v3;
  if (!v6)
  {
    *(_QWORD *)(v2 + 16) = v11;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

void sub_21952E10C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_72_0();
  if (v6)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = OUTLINED_FUNCTION_64();
  if (!v7 || v5 > *(_QWORD *)(v2 + 24) >> 1)
  {
    if (v4 <= v5)
      v8 = v5;
    else
      v8 = v4;
    sub_2195467F0(v7, v8, 1, v2);
    v2 = v9;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_14;
    goto LABEL_16;
  }
  v10 = (*(_QWORD *)(v2 + 24) >> 1) - *(_QWORD *)(v2 + 16);
  type metadata accessor for SiriNLOverride();
  if (v10 < v3)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  OUTLINED_FUNCTION_31_3();
  swift_arrayInitWithCopy();
  if (!v3)
  {
LABEL_14:
    OUTLINED_FUNCTION_10();
    *v1 = v2;
    OUTLINED_FUNCTION_20_3();
    return;
  }
  v11 = *(_QWORD *)(v2 + 16);
  v6 = __OFADD__(v11, v3);
  v12 = v11 + v3;
  if (!v6)
  {
    *(_QWORD *)(v2 + 16) = v12;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

void sub_21952E1D4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v8 = v4 + v2;
    else
      v8 = v4;
    sub_219546908(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    v3 = v9;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC8);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *v1 = v3;
    return;
  }
  v10 = *(_QWORD *)(v3 + 16);
  v11 = __OFADD__(v10, v2);
  v12 = v10 + v2;
  if (!v11)
  {
    *(_QWORD *)(v3 + 16) = v12;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

unint64_t sub_21952E2D0()
{
  unint64_t result;

  result = qword_253F22618;
  if (!qword_253F22618)
  {
    result = MEMORY[0x219A2EE44](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253F22618);
  }
  return result;
}

unint64_t sub_21952E30C()
{
  unint64_t result;

  result = qword_253F22620;
  if (!qword_253F22620)
  {
    result = MEMORY[0x219A2EE44](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253F22620);
  }
  return result;
}

uint64_t type metadata accessor for RegexOverrideCache()
{
  return objc_opt_self();
}

uint64_t sub_21952E368(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  void (*v7)(_BYTE *, uint64_t);
  _BYTE *v8;
  uint64_t (*v9)(_BYTE *, uint64_t);
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[16];

  v4 = OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  v7(v6, a1);
  v8 = &v6[*(int *)(v4 + 20)];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  v10 = v9(v8, a2);
  if (qword_253F22088 != -1)
    v10 = swift_once();
  MEMORY[0x24BDAC7A8](v10);
  *(_QWORD *)&v15[-16] = v6;
  sub_219548A9C((uint64_t)sub_21952E4BC, (uint64_t)&v15[-32], v11);
  v13 = v12;
  sub_21952E68C((uint64_t)v6);
  return v13;
}

uint64_t type metadata accessor for CacheKey()
{
  uint64_t result;

  result = qword_253F22048;
  if (!qword_253F22048)
    return swift_getSingletonMetadata();
  return result;
}

ValueMetadata *_s16SiriNLUOverrides8CacheKeyVMa_0()
{
  return &type metadata for CacheKey;
}

uint64_t sub_21952E4BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_21952E4D4(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_21952E4D4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  char v4;
  uint64_t v5;

  if (qword_253F220A0 != -1)
    swift_once();
  swift_beginAccess();
  if (*((_QWORD *)off_253F22090 + 2) && (sub_21952F794(a1), (v4 & 1) != 0))
    v5 = swift_bridgeObjectRetain();
  else
    v5 = 0;
  *a2 = v5;
  return swift_endAccess();
}

uint64_t sub_21952E588(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x219A2EE44](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21952E5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21952E60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_21955743C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_219557D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_21952E68C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21952E6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_21955743C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_219557D84();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t destroy for CacheKey()
{
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SiriNLOverride(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _OWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = a3[9];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  a1[6] = a2[6];
  v12 = sub_2195573AC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  v14 = a3[11];
  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = a3[12];
  v19 = (char *)a1 + v18;
  v20 = (_OWORD *)((char *)a2 + v18);
  v21 = *(_QWORD *)((char *)a2 + v18 + 8);
  swift_bridgeObjectRetain();
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)v19 = *v20;
  }
  else
  {
    v22 = *(_QWORD *)v20;
    sub_21952E944(v22, v21);
    *(_QWORD *)v19 = v22;
    *((_QWORD *)v19 + 1) = v21;
  }
  v23 = a3[14];
  *(_DWORD *)((char *)a1 + a3[13]) = *(_DWORD *)((char *)a2 + a3[13]);
  v24 = (char *)a1 + v23;
  v25 = (_QWORD *)((char *)a2 + v23);
  v26 = *(_QWORD *)((char *)a2 + v23 + 8);
  if (v26 >> 60 == 15)
  {
    *(_OWORD *)v24 = *(_OWORD *)v25;
  }
  else
  {
    v27 = *v25;
    sub_21952E944(*v25, v26);
    *(_QWORD *)v24 = v27;
    *((_QWORD *)v24 + 1) = v26;
  }
  v28 = a3[15];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = sub_219557FDC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v30, 1, v31))
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
    __swift_storeEnumTagSinglePayload((uint64_t)v29, 0, 1, v31);
  }
  return a1;
}

uint64_t sub_21952E944(uint64_t a1, unint64_t a2)
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

void sub_21952E988()
{
  _QWORD *v0;
  uint64_t v1;

  sub_21952EA68();
  *v0 = v1;
}

void sub_21952E9A4()
{
  _QWORD *v0;
  uint64_t v1;

  sub_21954C284();
  *v0 = v1;
}

void sub_21952E9C0(char a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_21952EB58(a1, a2, a3, *v3);
  *v3 = v4;
}

void sub_21952E9DC()
{
  _QWORD *v0;
  uint64_t v1;

  sub_21954C178();
  *v0 = v1;
}

void sub_21952E9F8()
{
  _QWORD *v0;
  uint64_t v1;

  sub_21952EA4C();
  *v0 = v1;
}

void sub_21952EA14()
{
  _QWORD *v0;
  uint64_t v1;

  sub_21952EC1C();
  *v0 = v1;
}

void sub_21952EA30()
{
  _QWORD *v0;
  uint64_t v1;

  sub_21954C268();
  *v0 = v1;
}

void sub_21952EA4C()
{
  sub_21954C194();
}

void sub_21952EA68()
{
  sub_21954C194();
}

void sub_21952EA84()
{
  uint64_t v0;
  char v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  char v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_46_1();
  if ((v7 & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_49_0();
      if (v9)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_2();
    }
  }
  else
  {
    v8 = v5;
  }
  v11 = *(_QWORD *)(v0 + 16);
  if (v8 <= v11)
    v12 = *(_QWORD *)(v0 + 16);
  else
    v12 = v8;
  if (!v12)
    goto LABEL_17;
  __swift_instantiateConcreteTypeFromMangledName(v6);
  __swift_instantiateConcreteTypeFromMangledName(v2);
  v13 = (_QWORD *)OUTLINED_FUNCTION_7_5();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v3)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v14 - v4 == 0x8000000000000000 && v3 == -1)
    goto LABEL_22;
  v13[2] = v11;
  v13[3] = 2 * ((uint64_t)(v14 - v4) / v3);
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(v2);
  OUTLINED_FUNCTION_23_3();
  if ((v1 & 1) != 0)
  {
    OUTLINED_FUNCTION_52_1(v16, v17);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_33_1();
  }
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_1_0();
}

void sub_21952EB58(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_49_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_2();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F22668);
    v11 = OUTLINED_FUNCTION_30_0();
    _swift_stdlib_malloc_size((const void *)v11);
    OUTLINED_FUNCTION_54_1();
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = v12;
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_219546444((char *)(a4 + 32), v9, (char *)(v11 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_41();
}

void sub_21952EC1C()
{
  sub_21954C194();
}

void sub_21952EC38(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_99();
}

void sub_21952EC78(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19(a1, a2, a3);
  OUTLINED_FUNCTION_8_5(v3);
  OUTLINED_FUNCTION_99();
}

uint64_t sub_21952EC98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriNLOverride();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_21952ECDC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_50(*(_QWORD *)(v2 - 8));
  OUTLINED_FUNCTION_99();
}

uint64_t sub_21952ED0C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SiriNLOverride();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for SiriNLOverride(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[9];
  v5 = sub_2195573AC();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = (uint64_t *)(a1 + a2[12]);
  v7 = v6[1];
  if (v7 >> 60 != 15)
    sub_21952EE5C(*v6, v7);
  v8 = (uint64_t *)(a1 + a2[14]);
  v9 = v8[1];
  if (v9 >> 60 != 15)
    sub_21952EE5C(*v8, v9);
  v10 = a1 + a2[15];
  v11 = sub_219557FDC();
  result = __swift_getEnumTagSinglePayload(v10, 1, v11);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  return result;
}

uint64_t sub_21952EE5C(uint64_t a1, unint64_t a2)
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

void sub_21952EEA0()
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
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
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  OUTLINED_FUNCTION_62();
  v6 = v5;
  v8 = v7;
  type metadata accessor for OverrideMatchResult(0);
  OUTLINED_FUNCTION_31_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3();
  v53 = v10;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v48 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22168);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_6_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21FF0);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v15);
  v16 = OUTLINED_FUNCTION_7_4();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_18_2();
  Array<A>.currentTurn.getter(v8, v1);
  OUTLINED_FUNCTION_39_1(v1, 1, v16);
  if (v21)
  {
    v18 = &qword_253F21FF0;
    v19 = v1;
    goto LABEL_7;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 32))(v2, v1, v16);
  Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter(v4);
  v20 = sub_21955743C();
  OUTLINED_FUNCTION_39_1(v4, 1, v20);
  if (v21)
  {
    OUTLINED_FUNCTION_32_1(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
    v18 = &qword_253F22168;
    v19 = v4;
LABEL_7:
    sub_21952F3F8(v19, v18);
    sub_2195582AC();
    if (qword_253F22160 == -1)
    {
LABEL_8:
      v22 = (id)qword_253F221A8;
      OUTLINED_FUNCTION_8_4();

      goto LABEL_28;
    }
LABEL_30:
    swift_once();
    goto LABEL_8;
  }
  v51 = v6;
  v52 = v3;
  v49 = v17;
  v50 = v16;
  sub_21952F3F8(v4, &qword_253F22168);
  v48 = v2;
  sub_219557F64();
  static MatchingSpanUtils.getSpanLabelDict(_:)();
  v24 = v23;
  swift_bridgeObjectRelease();
  if (qword_253F223E8 != -1)
    swift_once();
  v25 = sub_21952FF68(byte_253F22910);
  v27 = v26;
  v28 = sub_21953009C();
  v30 = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v31 = sub_2195302BC(v51, v8, v24, v28, v30, v25, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_1();
  v32 = MEMORY[0x24BEE4AF8];
  v54 = MEMORY[0x24BEE4AF8];
  v33 = *(_QWORD *)(v31 + 16);
  if (v33)
  {
    v34 = 0;
    v35 = v52;
    v51 = *(_QWORD *)(v31 + 16);
    while (v34 < *(_QWORD *)(v31 + 16))
    {
      v36 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
      v37 = *(_QWORD *)(v0 + 72);
      sub_21952EC38(v31 + v36 + v37 * v34, (uint64_t)v13, type metadata accessor for OverrideMatchResult);
      if (v13[*(int *)(v35 + 20)] == 1)
      {
        sub_21954A048((uint64_t)v13, v53);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_21952EA14();
        v38 = v54;
        v39 = *(_QWORD *)(v54 + 16);
        if (v39 >= *(_QWORD *)(v54 + 24) >> 1)
        {
          sub_21952EA14();
          v38 = v54;
        }
        *(_QWORD *)(v38 + 16) = v39 + 1;
        sub_21954A048(v53, v38 + v36 + v39 * v37);
        v33 = v51;
        v35 = v52;
      }
      else
      {
        sub_21952ECDC((uint64_t)v13, type metadata accessor for OverrideMatchResult);
      }
      if (v33 == ++v34)
      {
        v32 = v54;
        goto LABEL_23;
      }
    }
    __break(1u);
    goto LABEL_30;
  }
LABEL_23:
  OUTLINED_FUNCTION_37();
  sub_2195582A0();
  v41 = v48;
  v40 = v49;
  if (qword_253F22160 != -1)
    swift_once();
  v42 = (void *)qword_253F221A8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
  v43 = OUTLINED_FUNCTION_8();
  *(_OWORD *)(v43 + 16) = xmmword_219558D80;
  v44 = *(_QWORD *)(v32 + 16);
  v45 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v43 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v43 + 64) = v45;
  *(_QWORD *)(v43 + 32) = v44;
  v46 = v42;
  sub_219558138();

  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v32 + 16))
  {
    sub_2195582A0();
    v47 = (id)qword_253F221A8;
    OUTLINED_FUNCTION_77();

  }
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v41, v50);
LABEL_28:
  OUTLINED_FUNCTION_1_0();
}

uint64_t type metadata accessor for OverrideMatchResult(uint64_t a1)
{
  return sub_2195313E0(a1, qword_253F22410);
}

uint64_t sub_21952F370()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SiriNLOverride();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_21952F3F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_50(*(_QWORD *)(v2 - 8));
  OUTLINED_FUNCTION_99();
}

void sub_21952F428(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_99();
}

void static MatchingSpanUtils.getSpanLabelDict(_:)()
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
  void (*v11)(_QWORD, _QWORD, _QWORD);
  void (*v12)(_QWORD *@<X8>);
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(_QWORD, _QWORD, _QWORD);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;

  OUTLINED_FUNCTION_62();
  v2 = v1;
  v3 = OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_28_0();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3();
  v50 = v4;
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v44 - v5;
  v7 = *(_QWORD *)(v2 + 16);
  if (!v7)
  {
    v12 = 0;
LABEL_25:
    sub_219545380((uint64_t)v12);
    OUTLINED_FUNCTION_1_0();
    return;
  }
  OUTLINED_FUNCTION_32_0();
  v46 = v8;
  v9 = v2 + v8;
  v10 = *(_QWORD *)(v0 + 72);
  v11 = *(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 16);
  v44 = v2;
  swift_bridgeObjectRetain();
  v12 = 0;
  v13 = (_QWORD *)MEMORY[0x24BEE4B00];
  v47 = v0;
  v48 = v3;
  v49 = v10;
  v45 = v11;
  while (1)
  {
    v11(v6, v9, v3);
    v14 = sub_219557778();
    v16 = v15;
    OUTLINED_FUNCTION_18_0();
    v17 = HIBYTE(v16) & 0xF;
    if ((v16 & 0x2000000000000000) == 0)
      v17 = v14 & 0xFFFFFFFFFFFFLL;
    if (!v17)
    {
      v37 = v49;
      goto LABEL_22;
    }
    v18 = sub_219557778();
    v19 = (void (*)(uint64_t, char *, uint64_t))v11;
    v21 = v20;
    v19(v50, v6, v3);
    sub_219545380((uint64_t)v12);
    swift_isUniquelyReferenced_nonNull_native();
    v51 = v13;
    v22 = sub_21952F890(v18, v21);
    if (__OFADD__(v13[2], (v23 & 1) == 0))
      break;
    v24 = v22;
    v25 = v23;
    __swift_instantiateConcreteTypeFromMangledName(qword_253F21E38);
    if ((sub_21955839C() & 1) != 0)
    {
      v26 = sub_21952F890(v18, v21);
      if ((v25 & 1) != (v27 & 1))
        goto LABEL_28;
      v24 = v26;
    }
    v13 = v51;
    OUTLINED_FUNCTION_55_0();
    if ((v25 & 1) == 0)
    {
      v13[(v24 >> 6) + 8] |= 1 << v24;
      v28 = (uint64_t *)(v13[6] + 16 * v24);
      *v28 = v18;
      v28[1] = v21;
      *(_QWORD *)(v13[7] + 8 * v24) = MEMORY[0x24BEE4AF8];
      v29 = v13[2];
      v30 = v29 + 1;
      v31 = __OFADD__(v29, 1);
      swift_bridgeObjectRetain();
      if (v31)
        goto LABEL_27;
      v13[2] = v30;
    }
    swift_bridgeObjectRetain();
    v32 = v13[7];
    swift_bridgeObjectRelease();
    v33 = *(_QWORD *)(v32 + 8 * v24);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v32 + 8 * v24) = v33;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v39 = OUTLINED_FUNCTION_11_2();
      sub_21954668C(v39, v40, v41, v33, &qword_253F22648, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C640]);
      v33 = v42;
      *(_QWORD *)(v32 + 8 * v24) = v42;
    }
    v36 = *(_QWORD *)(v33 + 16);
    v35 = *(_QWORD *)(v33 + 24);
    if (v36 >= v35 >> 1)
    {
      sub_21954668C(v35 > 1, v36 + 1, 1, v33, &qword_253F22648, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C640]);
      v33 = v43;
      *(_QWORD *)(v32 + 8 * v24) = v43;
    }
    *(_QWORD *)(v33 + 16) = v36 + 1;
    v37 = v49;
    v38 = v33 + v46 + v36 * v49;
    v0 = v47;
    v3 = v48;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 32))(v38, v50, v48);
    swift_bridgeObjectRelease();
    v12 = sub_219542464;
    v11 = v45;
LABEL_22:
    (*(void (**)(char *, uint64_t))(v0 + 8))(v6, v3);
    v9 += v37;
    if (!--v7)
    {
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  sub_21955845C();
  __break(1u);
}

unint64_t sub_21952F794(uint64_t a1)
{
  uint64_t v2;

  OUTLINED_FUNCTION_14_1();
  sub_21955743C();
  sub_21952E588(&qword_253F21FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  sub_219558150();
  type metadata accessor for CacheKey();
  sub_219557D54();
  sub_2195584C8();
  v2 = OUTLINED_FUNCTION_47_0();
  return sub_21952FB78(a1, v2);
}

unint64_t sub_21952F82C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2195584B0();
  return sub_21952F968(a1, v2);
}

unint64_t sub_21952F85C(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x219A2E868](*(_QWORD *)(v1 + 40), a1, 4);
  return sub_21952FADC(a1, v3);
}

unint64_t sub_21952F890(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  OUTLINED_FUNCTION_14_1();
  sub_2195581B0();
  v4 = OUTLINED_FUNCTION_47_0();
  return sub_21952FD0C(a1, a2, v4);
}

unint64_t sub_21952F8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  OUTLINED_FUNCTION_14_1();
  swift_bridgeObjectRetain();
  sub_2195581B0();
  OUTLINED_FUNCTION_4_3();
  sub_2195584C8();
  v6 = OUTLINED_FUNCTION_47_0();
  return sub_21952FA04(a1, a2, a3, v6);
}

unint64_t sub_21952F968(uint64_t a1, uint64_t a2)
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
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_21952FA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  BOOL v15;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v11 = ~v6;
    v12 = *(_QWORD *)(v4 + 48);
    do
    {
      v13 = (_QWORD *)(v12 + 24 * v7);
      v14 = v13[2];
      v15 = *v13 == a1 && v13[1] == a2;
      if ((v15 || (sub_219558438() & 1) != 0) && v14 == a3)
        break;
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_21952FADC(int a1, uint64_t a2)
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
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_21952FB78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  v15 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v15);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v14 = v12;
    while (1)
    {
      sub_21952E5C8(*(_QWORD *)(v3 + 48) + v12 * v10, (uint64_t)v8);
      if ((MEMORY[0x219A2D7D0](v8, a1) & 1) != 0)
      {
        sub_219557D84();
        sub_21952E588(&qword_253F21FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE9CE30], MEMORY[0x24BE9CE40]);
        sub_21955824C();
        sub_21955824C();
        v12 = v14;
        if (v17 == v16)
          break;
      }
      sub_21952E68C((uint64_t)v8);
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        return v10;
    }
    sub_21952E68C((uint64_t)v8);
  }
  return v10;
}

unint64_t sub_21952FD0C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_219558438() & 1) == 0)
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
      while (!v14 && (sub_219558438() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21952FDEC()
{
  unsigned int v0;
  _QWORD *v1;
  unint64_t v2;
  char v3;
  char v4;
  uint64_t result;

  if (qword_253F22408 != -1)
    swift_once();
  if (qword_253F223F0 != -1)
    swift_once();
  v0 = dword_253F223F8;
  swift_beginAccess();
  v1 = off_253F22400;
  if (*((_QWORD *)off_253F22400 + 2) && (v2 = sub_21952F85C(v0), (v3 & 1) != 0))
  {
    v4 = *(_BYTE *)(v1[7] + v2);
    result = swift_endAccess();
  }
  else
  {
    result = swift_endAccess();
    v4 = 8;
  }
  byte_253F22910 = v4;
  return result;
}

void *sub_21952FEC0()
{
  void *result;

  result = (void *)sub_219558144();
  off_253F22400 = result;
  return result;
}

ValueMetadata *type metadata accessor for MobileGestalt.DeviceClass()
{
  return &type metadata for MobileGestalt.DeviceClass;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

void sub_21952FF18()
{
  void *v0;
  int v1;

  v0 = (void *)sub_219558174();
  v1 = MGGetSInt32Answer();

  dword_253F223F8 = v1;
}

uint64_t sub_21952FF68(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21952FF98
                                                            + 4 * asc_219559410[a1]))(0x454E4F4850, 0xE500000000000000);
}

uint64_t sub_21952FF98()
{
  return 4473168;
}

uint64_t sub_21952FFA8()
{
  return 0x4E414D4553524F48;
}

uint64_t sub_21952FFC0()
{
  return 1398097242;
}

uint64_t sub_21952FFD0()
{
  return 0x4F454D4143;
}

uint64_t sub_21952FFE0()
{
  return 0x4843544157;
}

uint64_t sub_21952FFF0()
{
  return 5390659;
}

uint64_t sub_219530000()
{
  return 0x544952414752414DLL;
}

uint64_t sub_21953001C()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_219530034(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE v4[24];
  uint64_t v5;

  sub_2195300BC(a1, a2, (uint64_t)v4);
  if (v5)
  {
    if (swift_dynamicCast())
      return v3;
  }
  else
  {
    sub_21954DDD4((uint64_t)v4);
  }
  return 0;
}

uint64_t sub_21953009C()
{
  return sub_219530034(0x54746375646F7250, 0xEB00000000657079);
}

double sub_2195300BC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v6;
  uint64_t v7;
  double result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = (void *)sub_219558174();
  v7 = MGCopyAnswerWithError();

  if (v7)
  {
    *(_QWORD *)(a3 + 24) = swift_getObjectType();
    *(_QWORD *)a3 = v7;
  }
  else
  {
    sub_2195582AC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_2195590A0;
    v10 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
    v11 = sub_21952E30C();
    *(_QWORD *)(v9 + 64) = v11;
    *(_QWORD *)(v9 + 32) = a1;
    *(_QWORD *)(v9 + 40) = a2;
    swift_bridgeObjectRetain();
    v12 = sub_219558420();
    *(_QWORD *)(v9 + 96) = v10;
    *(_QWORD *)(v9 + 104) = v11;
    *(_QWORD *)(v9 + 72) = v12;
    *(_QWORD *)(v9 + 80) = v13;
    sub_219546D50();
    v14 = (void *)sub_2195582D0();
    sub_219558138();
    swift_bridgeObjectRelease();

    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_2195302BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
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
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t v30;
  uint64_t matched;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a7;
  v32 = a4;
  v33 = a6;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22450);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  matched = type metadata accessor for OverrideMatchResult(0);
  v29 = *(_QWORD *)(matched - 8);
  v14 = MEMORY[0x24BDAC7A8](matched);
  v30 = (uint64_t)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v28 - v16;
  v18 = *(_QWORD *)(a1 + 16);
  if (v18)
  {
    v28[2] = v7;
    v19 = *(_QWORD *)(type metadata accessor for SiriNLOverride() - 8);
    v20 = a1 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
    v21 = *(_QWORD *)(v19 + 72);
    v28[1] = a1;
    swift_bridgeObjectRetain();
    v22 = MEMORY[0x24BEE4AF8];
    v28[3] = a5;
    v28[4] = a3;
    do
    {
      SiriNLOverride.matches(inputs:spanDict:deviceType:userInterfaceIdiom:)();
      if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, matched) == 1)
      {
        sub_21952F3F8((uint64_t)v13, &qword_253F22450);
      }
      else
      {
        sub_21954A048((uint64_t)v13, (uint64_t)v17);
        sub_21954A048((uint64_t)v17, v30);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2195468E0(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
          v22 = v25;
        }
        v24 = *(_QWORD *)(v22 + 16);
        v23 = *(_QWORD *)(v22 + 24);
        if (v24 >= v23 >> 1)
        {
          sub_2195468E0(v23 > 1, v24 + 1, 1, v22);
          v22 = v26;
        }
        *(_QWORD *)(v22 + 16) = v24 + 1;
        sub_21954A048(v30, v22+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v24);
      }
      v20 += v21;
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_21953052C(void (*a1)(_QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];
  void (*v24)(_QWORD);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t matched;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22038);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  matched = type metadata accessor for OverrideMatchResultAndParse(0);
  v26 = *(_QWORD *)(matched - 8);
  v9 = MEMORY[0x24BDAC7A8](matched);
  v27 = (uint64_t)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v25 = (uint64_t)v23 - v11;
  v12 = *(_QWORD *)(a3 + 16);
  if (!v12)
    return MEMORY[0x24BEE4AF8];
  v13 = *(_QWORD *)(type metadata accessor for OverrideMatchResult(0) - 8);
  v14 = a3 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
  v15 = *(_QWORD *)(v13 + 72);
  v23[1] = a3;
  swift_bridgeObjectRetain();
  v16 = MEMORY[0x24BEE4AF8];
  v24 = a1;
  while (1)
  {
    a1(v14);
    if (v3)
      break;
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, matched) == 1)
    {
      sub_21954A56C((uint64_t)v8, &qword_253F22038);
    }
    else
    {
      v17 = v25;
      sub_2195330A0((uint64_t)v8, v25, type metadata accessor for OverrideMatchResultAndParse);
      sub_2195330A0(v17, v27, type metadata accessor for OverrideMatchResultAndParse);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2195468F4(0, *(_QWORD *)(v16 + 16) + 1, 1, v16);
        v16 = v20;
      }
      v19 = *(_QWORD *)(v16 + 16);
      v18 = *(_QWORD *)(v16 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_2195468F4(v18 > 1, v19 + 1, 1, v16);
        v16 = v21;
      }
      *(_QWORD *)(v16 + 16) = v19 + 1;
      sub_2195330A0(v27, v16+ ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))+ *(_QWORD *)(v26 + 72) * v19, type metadata accessor for OverrideMatchResultAndParse);
      a1 = v24;
    }
    v14 += v15;
    if (!--v12)
    {
      swift_bridgeObjectRelease();
      return v16;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_219530790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD);
  void (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  void (*v32)(_QWORD);
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_45_1();
  v37 = v2;
  v38 = v3;
  v5 = v4;
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22000);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_18_2();
  v36 = OUTLINED_FUNCTION_18_4();
  v33 = *(_QWORD *)(v36 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3();
  v34 = v10;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v31 - v12;
  v14 = *(_QWORD *)(v5 + 16);
  if (!v14)
    return MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v31 = v5;
  v15 = (uint64_t *)(v5 + 40);
  v16 = MEMORY[0x24BEE4AF8];
  v32 = v7;
  while (1)
  {
    v17 = *v15;
    v35[0] = *(v15 - 1);
    v35[1] = v17;
    swift_bridgeObjectRetain();
    v7(v35);
    if (v0)
      break;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_39_1(v1, 1, v36);
    if (v18)
    {
      sub_21954A56C(v1, &qword_253F22000);
    }
    else
    {
      sub_2195330A0(v1, (uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
      sub_2195330A0((uint64_t)v13, v34, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v25 = OUTLINED_FUNCTION_25_3();
        sub_2195467F0(v25, v26, v27, v16);
        v16 = v28;
      }
      v21 = *(_QWORD *)(v16 + 16);
      v20 = *(_QWORD *)(v16 + 24);
      if (v21 >= v20 >> 1)
      {
        sub_2195467F0(v20 > 1, v21 + 1, 1, v16);
        v16 = v29;
      }
      *(_QWORD *)(v16 + 16) = v21 + 1;
      OUTLINED_FUNCTION_32_0();
      sub_2195330A0(v24, v16 + v22 + *(_QWORD *)(v23 + 72) * v21, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
      v7 = v32;
    }
    v15 += 2;
    if (!--v14)
    {
      swift_bridgeObjectRelease();
      return v16;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t SiriNLOverride.matches(inputs:spanDict:deviceType:userInterfaceIdiom:)()
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
  char *v13;
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
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  void (*v58)(char *, uint64_t, uint64_t);
  uint64_t v59;
  char v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v67;
  char v68;
  uint64_t v69;
  unsigned __int8 v70;
  unsigned __int8 v71;
  unsigned __int8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;

  OUTLINED_FUNCTION_62();
  v116 = v2;
  v117 = v3;
  v103 = v4;
  v104 = v5;
  v105 = v6;
  v106 = v7;
  v102 = v8;
  v114 = v9;
  v11 = v10;
  v100 = *(_QWORD *)(type metadata accessor for TurnInputRuleMatchResult(0) - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_4_2();
  v101 = v13;
  OUTLINED_FUNCTION_38();
  type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v14);
  v107 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22168);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_48();
  v110 = sub_21955743C();
  v108 = *(_QWORD *)(v110 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v17);
  v109 = (uint64_t)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21FF0);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_9_0();
  v22 = v21 - v20;
  v115 = OUTLINED_FUNCTION_0_3();
  v112 = *(_QWORD *)(v115 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v23);
  v113 = (uint64_t)&v97 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_9_0();
  v28 = v27 - v26;
  v29 = sub_219557FDC();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)&v97 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v31);
  v36 = (char *)&v97 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)&v97 - v37;
  v111 = v0;
  SiriNLOverride.nluRequestRule.getter(v28);
  OUTLINED_FUNCTION_39_1(v28, 1, v29);
  if (v52)
  {
    sub_21952F3F8(v28, &qword_253F21E18);
    v39 = OUTLINED_FUNCTION_45_2();
    v40 = v11;
  }
  else
  {
    v99 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v38, v28, v29);
    v41 = *(_QWORD *)(sub_219557A0C() + 16);
    swift_bridgeObjectRelease();
    if (v41)
    {
      Array<A>.currentTurn.getter(v114, v22);
      v42 = v115;
      OUTLINED_FUNCTION_39_1(v22, 1, v115);
      if (v52)
      {
        sub_21952F3F8(v22, &qword_253F21FF0);
        v43 = v99;
      }
      else
      {
        v98 = v38;
        v49 = v112;
        v50 = v113;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v112 + 32))(v113, v22, v42);
        Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter(v1);
        v51 = v110;
        OUTLINED_FUNCTION_39_1(v1, 1, v110);
        if (v52)
        {
          OUTLINED_FUNCTION_20_4(v50, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
          sub_21952F3F8(v1, &qword_253F22168);
          v38 = v98;
          v43 = v99;
        }
        else
        {
          v54 = v108;
          v53 = v109;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v108 + 32))(v109, v1, v51);
          v55 = (uint64_t)v98;
          v56 = sub_2195316B8(v53);
          if ((v56 & 1) != 0)
          {
            v57 = sub_219557FA0();
            v58 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
            v58(v36, v55, v29);
            if ((v57 & 1) != 0)
            {
              if (sub_219557F88() != v105 || v59 != v106)
              {
                v61 = OUTLINED_FUNCTION_49_2();
                OUTLINED_FUNCTION_3_1();
                OUTLINED_FUNCTION_16_2((uint64_t)v36);
                if ((v61 & 1) == 0)
                {
                  sub_2195582A0();
                  if (qword_253F22160 != -1)
                    swift_once();
                  v62 = (id)qword_253F221A8;
                  v63 = MEMORY[0x24BEE4AF8];
                  OUTLINED_FUNCTION_33_0();
                  OUTLINED_FUNCTION_35_1();

                  OUTLINED_FUNCTION_46_2();
                  (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v113, v115);
                  goto LABEL_51;
                }
LABEL_32:
                v67 = (uint64_t)v98;
                v68 = sub_219557FC4();
                v58(v33, v67, v29);
                v69 = v115;
                if ((v68 & 1) != 0)
                {
                  sub_219557FB8();
                  v70 = sub_21954DCF4();
                  swift_bridgeObjectRetain();
                  v71 = sub_21954DCF4();
                  v72 = v71;
                  if (v70 == 9)
                  {
                    OUTLINED_FUNCTION_16_2((uint64_t)v33);
                    if (v72 == 9)
                      goto LABEL_48;
                    goto LABEL_38;
                  }
                  if (v71 == 9)
                  {
                    OUTLINED_FUNCTION_16_2((uint64_t)v33);
                    goto LABEL_38;
                  }
                  v73 = sub_21952FF68(v70);
                  v75 = v74;
                  if (v73 != sub_21952FF68(v72) || v75 != v76)
                  {
                    v78 = OUTLINED_FUNCTION_49_2();
                    OUTLINED_FUNCTION_3_1();
                    OUTLINED_FUNCTION_37();
                    OUTLINED_FUNCTION_16_2((uint64_t)v33);
                    if ((v78 & 1) != 0)
                    {
LABEL_48:
                      v79 = *(_QWORD *)(v114 + 16);
                      v80 = *(_QWORD *)(sub_219557A0C() + 16);
                      swift_bridgeObjectRelease();
                      if (v79 >= v80)
                      {
                        v84 = sub_219557A0C();
                        MEMORY[0x24BDAC7A8](v84);
                        v85 = v102;
                        *(&v97 - 2) = v53;
                        *(&v97 - 1) = v85;
                        v86 = swift_bridgeObjectRetain();
                        v87 = 0;
                        sub_21954ECCC(v86, v84, (void (*)(char *, char *))sub_219531930, (uint64_t)(&v97 - 4));
                        v89 = v88;
                        OUTLINED_FUNCTION_4_3();
                        swift_bridgeObjectRelease();
                        v90 = *(_QWORD *)(v89 + 16);
                        if (v90)
                        {
                          OUTLINED_FUNCTION_80_0();
                          v92 = *(_QWORD *)(v91 + 72);
                          OUTLINED_FUNCTION_2_0();
                          v93 = 1;
                          v94 = v101;
                          do
                          {
                            sub_2195330CC(v87, (uint64_t)v94, type metadata accessor for TurnInputRuleMatchResult);
                            if ((v93 & 1) != 0)
                              v93 = *v94;
                            else
                              v93 = 0;
                            sub_21953C624((uint64_t)v94);
                            v87 += v92;
                            --v90;
                          }
                          while (v90);
                          OUTLINED_FUNCTION_3_1();
                        }
                        else
                        {
                          v93 = 1;
                        }
                        v95 = (uint64_t)v111;
                        OUTLINED_FUNCTION_20_4(v113, *(uint64_t (**)(uint64_t, uint64_t))(v112 + 8));
                        OUTLINED_FUNCTION_16_2((uint64_t)v98);
                        v96 = v99;
                        sub_2195330CC(v95, v99, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
                        v83 = (int *)OUTLINED_FUNCTION_45_2();
                        *(_BYTE *)(v96 + v83[5]) = v93;
                        *(_QWORD *)(v96 + v83[6]) = v89;
                        *(_QWORD *)(v96 + v83[7]) = 0;
                        OUTLINED_FUNCTION_24_1(v109, *(uint64_t (**)(uint64_t, uint64_t))(v108 + 8));
                        v40 = v96;
                        goto LABEL_61;
                      }
                      sub_2195582A0();
                      if (qword_253F22160 == -1)
                        goto LABEL_50;
LABEL_62:
                      swift_once();
LABEL_50:
                      v62 = (id)qword_253F221A8;
                      v63 = MEMORY[0x24BEE4AF8];
                      OUTLINED_FUNCTION_33_0();
                      OUTLINED_FUNCTION_35_1();

                      OUTLINED_FUNCTION_46_2();
                      (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v113, v69);
LABEL_51:
                      OUTLINED_FUNCTION_16_2((uint64_t)v98);
                      v81 = (uint64_t)v62;
                      v82 = v99;
                      sub_2195330A0(v81, v99, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
                      v83 = (int *)OUTLINED_FUNCTION_45_2();
                      *(_BYTE *)(v82 + v83[5]) = 0;
                      *(_QWORD *)(v82 + v83[6]) = v63;
                      *(_QWORD *)(v82 + v83[7]) = 0;
                      OUTLINED_FUNCTION_24_1(v109, *(uint64_t (**)(uint64_t, uint64_t))(v108 + 8));
                      v40 = v82;
LABEL_61:
                      v65 = 0;
                      v39 = (uint64_t)v83;
                      return __swift_storeEnumTagSinglePayload(v40, v65, 1, v39);
                    }
LABEL_38:
                    sub_2195582A0();
                    if (qword_253F22160 == -1)
                      goto LABEL_50;
                    goto LABEL_62;
                  }
                  OUTLINED_FUNCTION_38_3();
                }
                OUTLINED_FUNCTION_16_2((uint64_t)v33);
                goto LABEL_48;
              }
              swift_bridgeObjectRelease();
            }
            OUTLINED_FUNCTION_16_2((uint64_t)v36);
            goto LABEL_32;
          }
          OUTLINED_FUNCTION_20_4(v113, *(uint64_t (**)(uint64_t, uint64_t))(v112 + 8));
          OUTLINED_FUNCTION_24_1(v53, *(uint64_t (**)(uint64_t, uint64_t))(v54 + 8));
          v43 = v99;
          v38 = (char *)v55;
        }
      }
      sub_2195582AC();
      if (qword_253F22160 != -1)
        swift_once();
      v64 = (id)qword_253F221A8;
      OUTLINED_FUNCTION_33_0();
      sub_219558138();

      OUTLINED_FUNCTION_21_2((uint64_t)v38, *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
      v39 = OUTLINED_FUNCTION_45_2();
      v40 = v43;
    }
    else
    {
      sub_2195582AC();
      if (qword_253F22160 != -1)
        swift_once();
      v44 = (void *)qword_253F221A8;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
      v45 = swift_allocObject();
      *(_OWORD *)(v45 + 16) = xmmword_219558D80;
      v47 = *v111;
      v46 = v111[1];
      *(_QWORD *)(v45 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v45 + 64) = sub_21952E30C();
      *(_QWORD *)(v45 + 32) = v47;
      *(_QWORD *)(v45 + 40) = v46;
      v48 = v44;
      swift_bridgeObjectRetain();
      sub_219558138();

      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_21_2((uint64_t)v38, *(uint64_t (**)(uint64_t, uint64_t))(v30 + 8));
      v39 = OUTLINED_FUNCTION_45_2();
      v40 = v99;
    }
  }
  v65 = 1;
  return __swift_storeEnumTagSinglePayload(v40, v65, 1, v39);
}

uint64_t type metadata accessor for TurnInputRuleMatchResult(uint64_t a1)
{
  return sub_2195313E0(a1, qword_253F224B0);
}

void sub_2195312FC()
{
  unint64_t v0;

  sub_219531378();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_219531378()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F22588)
  {
    type metadata accessor for UtteranceRuleMatchResult(255);
    v0 = sub_2195582E8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F22588);
  }
}

uint64_t type metadata accessor for UtteranceRuleMatchResult(uint64_t a1)
{
  return sub_2195313E0(a1, qword_253F22548);
}

uint64_t sub_2195313E0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_219531410()
{
  uint64_t result;
  unint64_t v1;

  result = sub_219557AB4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void SiriNLOverride.nluRequestRule.getter(uint64_t a1@<X8>)
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
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);

  sub_219558114();
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9_0();
  v5 = v4 - v3;
  v6 = sub_219557FDC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9_0();
  v10 = v9 - v8;
  v11 = OUTLINED_FUNCTION_18_4();
  sub_21953AAD0(v1 + *(int *)(v11 + 60), v5, &qword_253F21E18);
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) != 1)
  {
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32);
    v18(v10, v5, v6);
    v18(a1, v10, v6);
    goto LABEL_6;
  }
  sub_21952F428(v5, &qword_253F21E18);
  v12 = (uint64_t *)(v1 + *(int *)(v11 + 56));
  v13 = v12[1];
  if (v13 >> 60 != 15)
  {
    v14 = *v12;
    v15 = OUTLINED_FUNCTION_22_6();
    sub_21952E944(v15, v16);
    sub_21952E944(v14, v13);
    sub_219558108();
    sub_219553A74((unint64_t *)&qword_253F22250, (uint64_t (*)(uint64_t))MEMORY[0x24BE9DD50], MEMORY[0x24BE9DD10]);
    OUTLINED_FUNCTION_30_3();
    sub_219558120();
    OUTLINED_FUNCTION_7_6();
LABEL_6:
    v17 = 0;
    goto LABEL_7;
  }
  v17 = 1;
LABEL_7:
  __swift_storeEnumTagSinglePayload(a1, v17, 1, v6);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_2195316B8(uint64_t a1)
{
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
  char *v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v34)(uint64_t, uint64_t);
  _QWORD v35[5];
  uint64_t v36;

  v2 = v1;
  v36 = a1;
  v3 = sub_21955743C();
  v4 = *(_QWORD *)(v3 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_219557FDC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v35 - v12;
  v14 = sub_219557F94();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v2, v7);
  if ((v14 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    goto LABEL_18;
  }
  v35[1] = v11;
  v35[2] = v6;
  v35[3] = v4;
  v35[4] = v3;
  v15 = v36;
  v16 = sub_219557FD0();
  v18 = v17;
  swift_bridgeObjectRelease();
  if ((v18 & 0x2000000000000000) != 0)
    v19 = HIBYTE(v18) & 0xF;
  else
    v19 = v16 & 0xFFFFFFFFFFFFLL;
  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v13, v7);
  if (v19)
  {
    v35[0] = v20;
    v21 = sub_219557FD0();
    v23 = v22;
    if (v21 == sub_2195573DC() && v23 == v24)
    {
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_2_6();
      OUTLINED_FUNCTION_0_8();
    }
    else
    {
      v26 = sub_219558438();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_2_6();
      OUTLINED_FUNCTION_0_8();
      if ((v26 & 1) == 0)
      {
        v27 = sub_219557FD0();
        v29 = v28;
        v30 = sub_219557400();
        if (v31)
        {
          if (v27 == v30 && v31 == v29)
            LOBYTE(v19) = 1;
          else
            LOBYTE(v19) = sub_219558438();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_3_5();
          OUTLINED_FUNCTION_1_9();
          swift_bridgeObjectRelease();
          return v19 & 1;
        }
        v34 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
        swift_bridgeObjectRetain();
        v34(v4, v15);
        OUTLINED_FUNCTION_1_9();
        swift_bridgeObjectRelease_n();
LABEL_18:
        LOBYTE(v19) = 0;
        return v19 & 1;
      }
    }
    OUTLINED_FUNCTION_3_5();
    OUTLINED_FUNCTION_1_9();
    LOBYTE(v19) = 1;
  }
  return v19 & 1;
}

void sub_219531930(char a1@<W0>, char *a2@<X8>)
{
  sub_21953195C(a1, a2);
}

void sub_21953195C(char a1@<W1>, char *a2@<X8>)
{
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  sub_21955767C();
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_14_2();
  sub_2195575B0();
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_4();
  v5 = sub_219557640();
  v41 = *(_QWORD *)(v5 - 8);
  v42 = v5;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_9_0();
  v9 = (char *)(v8 - v7);
  v40 = sub_219557B2C();
  v10 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_9_0();
  v13 = v12 - v11;
  v39 = OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_9_0();
  v17 = (char *)(v16 - v15);
  sub_219557B38();
  sub_219557F70();
  v19 = v18;
  sub_219557F4C();
  sub_219531D30(v17);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v9, v42);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v40);
  if ((*v17 & 1) != 0)
  {
    v20 = *(_QWORD *)(sub_219557A0C() + 16);
    swift_bridgeObjectRelease();
    if (v20)
    {
      v21 = *(_QWORD *)(sub_219557A0C() + 16);
      if (!v21)
      {
LABEL_10:
        OUTLINED_FUNCTION_10();
        sub_2195582A0();
        v9 = a2;
        if (qword_253F22160 != -1)
          swift_once();
        v27 = (id)qword_253F221A8;
        sub_219558138();

        v13 = OUTLINED_FUNCTION_12_2();
        v28 = (uint64_t)&a2[*(int *)(v13 + 20)];
        OUTLINED_FUNCTION_22_1((uint64_t)v17);
        v23 = v28;
        v24 = 0;
        v25 = 1;
        v26 = v39;
        goto LABEL_13;
      }
      v9 = v17;
      sub_219557A48();
      OUTLINED_FUNCTION_4_5();
      while (1)
      {
        OUTLINED_FUNCTION_18_1();
        OUTLINED_FUNCTION_16_1();
        OUTLINED_FUNCTION_10_3();
        sub_219557F64();
        OUTLINED_FUNCTION_8_3();
        OUTLINED_FUNCTION_20_1();
        OUTLINED_FUNCTION_13_2();
        if ((a1 & 1) != 0)
          break;
        v10 += v19;
        if (!--v21)
          goto LABEL_10;
      }
      OUTLINED_FUNCTION_10();
    }
    v13 = *(_QWORD *)(sub_219557B44() + 16);
    swift_bridgeObjectRelease();
    if (v13)
    {
      v13 = sub_219557B44();
      v30 = *(_QWORD *)(v13 + 16);
      if (v30)
      {
        sub_219557A48();
        OUTLINED_FUNCTION_4_5();
        while (1)
        {
          OUTLINED_FUNCTION_18_1();
          OUTLINED_FUNCTION_16_1();
          OUTLINED_FUNCTION_10_3();
          sub_219557F64();
          OUTLINED_FUNCTION_8_3();
          OUTLINED_FUNCTION_20_1();
          OUTLINED_FUNCTION_13_2();
          if ((a1 & 1) != 0)
            break;
          v10 += v19;
          if (!--v30)
            goto LABEL_20;
        }
        OUTLINED_FUNCTION_10();
        sub_2195582A0();
        if (qword_253F22160 != -1)
          swift_once();
        v37 = (id)qword_253F221A8;
        sub_219558138();

        v13 = OUTLINED_FUNCTION_12_2();
        v9 = a2;
        v22 = (uint64_t)v17;
        goto LABEL_9;
      }
LABEL_20:
      OUTLINED_FUNCTION_10();
    }
    OUTLINED_FUNCTION_12_2();
    v31 = OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_22_1(v31);
    v29 = 1;
    v32 = OUTLINED_FUNCTION_21_1();
    __swift_storeEnumTagSinglePayload(v32, v33, v34, v35);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_12_2();
  v22 = OUTLINED_FUNCTION_11_3();
LABEL_9:
  OUTLINED_FUNCTION_22_1(v22);
  v23 = OUTLINED_FUNCTION_21_1();
LABEL_13:
  __swift_storeEnumTagSinglePayload(v23, v24, v25, v26);
  v29 = 0;
LABEL_22:
  v36 = *(int *)(v13 + 24);
  *v9 = v29;
  *(_QWORD *)&v9[v36] = 0;
  OUTLINED_FUNCTION_1_0();
}

void sub_219531D30(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22168);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_9_0();
  v6 = v5 - v4;
  v7 = sub_219557AA8();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6_4();
  v8 = sub_219557AB4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_14_2();
  sub_219557B14();
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v1, v8);
  if (v10 == *MEMORY[0x24BE9C9C0])
  {
    sub_219558294();
    if (qword_253F22160 != -1)
      swift_once();
    v11 = (int *)(id)qword_253F221A8;
    sub_219558138();

    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_7_3();
    v12 = v11[6];
    *a1 = 0;
LABEL_12:
    *(_QWORD *)&a1[v12] = 0;
    *(_QWORD *)&a1[v11[7]] = 0;
LABEL_15:
    OUTLINED_FUNCTION_1_0();
    return;
  }
  if (v10 == *MEMORY[0x24BE9C9C8])
  {
    sub_219557AC0();
    sub_219557A84();
    OUTLINED_FUNCTION_3_4();
    OUTLINED_FUNCTION_19_2();
    sub_219557A9C();
    OUTLINED_FUNCTION_3_4();
    OUTLINED_FUNCTION_19_2();
    sub_219557A90();
    OUTLINED_FUNCTION_3_4();
    sub_219557B20();
    sub_21955743C();
    OUTLINED_FUNCTION_17_0(v6);
    OUTLINED_FUNCTION_5_5();
    sub_21952E2D0();
    v13 = sub_21955830C();
    v15 = v14;
    sub_21953AF44(v6);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_17_0(v6);
    v16 = 1;
    OUTLINED_FUNCTION_5_5();
    v11 = (int *)sub_21955830C();
    v18 = v17;
    sub_21953AF44(v6);
    if ((int *)v13 != v11 || v15 != v18)
      v16 = sub_219558438();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_15_2();
    OUTLINED_FUNCTION_7_3();
    v12 = v11[6];
    *a1 = v16 & 1;
    goto LABEL_12;
  }
  if (v10 == *MEMORY[0x24BE9C9D0])
  {
    sub_219532064();
    goto LABEL_15;
  }
  sub_21955842C();
  __break(1u);
}

void sub_219532064()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  unsigned int *v26;
  id v27;
  void *v28;
  _BYTE *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  unsigned int *v38;
  id i;
  void *v40;
  _BYTE *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  int64_t v60;
  unint64_t v61;
  int64_t v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  char v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  id v111;
  _BYTE *v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _BYTE *v120;
  _BYTE *v121;
  uint64_t v122;
  int64_t v123;
  uint64_t v124;
  unsigned int *v125;
  int *matched;

  OUTLINED_FUNCTION_62();
  v116 = v0;
  v117 = v1;
  v118 = v3;
  v119 = v2;
  v120 = v4;
  v5 = sub_219557A78();
  v125 = *(unsigned int **)(v5 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_9_0();
  v9 = v8 - v7;
  matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_9_0();
  v13 = (_BYTE *)(v12 - v11);
  v14 = sub_219557AA8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_9_0();
  v18 = v17 - v16;
  v19 = sub_219557B20();
  v21 = v20;
  sub_219557AC0();
  v22 = sub_219557A84();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
  v23 = v22 & 1;
  v24 = sub_219532C2C(0, &qword_253F22058);
  v25 = sub_219532C64(v19, v21, v23, 0);
  v26 = (unsigned int *)MEMORY[0x24BE9C9D0];
  v28 = v25;
  v113 = v9;
  OUTLINED_FUNCTION_10();
  v29 = v28;
  v30 = (void *)sub_219558174();
  OUTLINED_FUNCTION_52();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F221A0);
  sub_219532EB0();
  sub_21952E2D0();
  v31 = sub_2195582C4();
  v112 = v29;
  v33 = objc_msgSend(v29, sel_matchesInString_options_range_, v30, 0, v31, v32);

  sub_219532C2C(0, &qword_253F22630);
  v34 = sub_219558258();

  if (!(v34 >> 62))
  {
    v35 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v36 = v9;
    v37 = v120;
    if (v35 == 1)
    {
      OUTLINED_FUNCTION_42();
      if (*(_QWORD *)((v34 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_4;
LABEL_81:
      OUTLINED_FUNCTION_42();
      OUTLINED_FUNCTION_37();
      v100 = OUTLINED_FUNCTION_96();
      OUTLINED_FUNCTION_44(v100);
      v101 = matched[6];
      *v37 = 0;
      *(_QWORD *)&v37[v101] = 0;
      *(_QWORD *)&v37[matched[7]] = 0;
      goto LABEL_88;
    }
LABEL_82:
    OUTLINED_FUNCTION_37();
    if (v35 < 2)
    {
      v37 = v112;

LABEL_86:
LABEL_87:
      v105 = OUTLINED_FUNCTION_96();
      OUTLINED_FUNCTION_44(v105);
      v106 = matched[6];
      *v120 = 0;
      *(_QWORD *)&v120[v106] = 0;
      *(_QWORD *)&v120[matched[7]] = 0;
      goto LABEL_88;
    }
    sub_2195582AC();
    v37 = v112;
    if (qword_253F22160 == -1)
    {
LABEL_84:
      v102 = (void *)qword_253F221A8;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
      v103 = OUTLINED_FUNCTION_30_0();
      *(_OWORD *)(v103 + 16) = xmmword_2195590A0;
      *(_QWORD *)(v103 + 56) = v24;
      *(_QWORD *)(v103 + 64) = sub_219545330();
      *(_QWORD *)(v103 + 32) = v37;
      *(_QWORD *)(v103 + 96) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v103 + 104) = sub_21952E30C();
      *(_QWORD *)(v103 + 72) = v119;
      *(_QWORD *)(v103 + 80) = v118;
      OUTLINED_FUNCTION_52();
      v104 = v102;
      OUTLINED_FUNCTION_45();

      OUTLINED_FUNCTION_10();
      goto LABEL_86;
    }
LABEL_92:
    swift_once();
    goto LABEL_84;
  }
  swift_bridgeObjectRetain();
  v35 = sub_2195583B4();
  OUTLINED_FUNCTION_37();
  v36 = v9;
  v37 = v120;
  if (v35 != 1)
    goto LABEL_82;
  OUTLINED_FUNCTION_42();
  swift_bridgeObjectRetain();
  v99 = sub_2195583B4();
  OUTLINED_FUNCTION_37();
  if (!v99)
    goto LABEL_81;
LABEL_4:
  if ((v34 & 0xC000000000000001) != 0)
    goto LABEL_90;
  if (!*(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_92;
  }
  v38 = v26;
  for (i = *(id *)(v34 + 32); ; i = (id)MEMORY[0x219A2E70C](0, v34))
  {
    v40 = i;
    OUTLINED_FUNCTION_37();
    v41 = &v13[matched[5]];
    v42 = *v38;
    v43 = sub_219557AB4();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v41, v42, v43);
    v44 = matched[6];
    *v13 = 0;
    *(_QWORD *)&v13[v44] = 0;
    *(_QWORD *)&v13[matched[7]] = v40;
    v111 = v40;
    v45 = sub_219557A0C();
    v109 = *(_QWORD *)(v45 + 16);
    if (!v109)
    {
      OUTLINED_FUNCTION_98();
      OUTLINED_FUNCTION_10();
      v47 = (_QWORD *)MEMORY[0x24BEE4B00];
      goto LABEL_61;
    }
    v107 = v44;
    v34 = 0;
    v46 = 0;
    v26 = v125;
    v110 = v45 + ((*((unsigned __int8 *)v125 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v125 + 80));
    v47 = (_QWORD *)MEMORY[0x24BEE4B00];
    v124 = v5;
    v121 = v13;
    v108 = v45;
LABEL_9:
    if (v46 < *(_QWORD *)(v45 + 16))
      break;
    __break(1u);
LABEL_90:
    v38 = v26;
  }
  v114 = v46;
  (*((void (**)(uint64_t, unint64_t, uint64_t))v26 + 2))(v36, v110 + *((_QWORD *)v26 + 9) * v46, v5);
  if ((sub_219557A60() & 1) == 0)
  {
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_6_1();
    sub_2195582AC();
    if (qword_253F22160 != -1)
      swift_once();
    v88 = (id)qword_253F221A8;
    OUTLINED_FUNCTION_77();
    OUTLINED_FUNCTION_54();

    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_46(*((uint64_t (**)(uint64_t, uint64_t))v26 + 1));
    goto LABEL_62;
  }
  sub_219557A54();
  v48 = (void *)sub_219558174();
  OUTLINED_FUNCTION_10();
  v49 = objc_msgSend(v111, sel_rangeWithName_, v48);
  v51 = v50;

  if (v49 == (id)sub_21955731C())
  {
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_6_1();
    sub_2195582A0();
    if (qword_253F22160 != -1)
      swift_once();
    v89 = (void *)qword_253F221A8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
    v90 = OUTLINED_FUNCTION_30_0();
    *(_OWORD *)(v90 + 16) = xmmword_2195590A0;
    v91 = v89;
    v92 = sub_219557A54();
    v94 = v93;
    v95 = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v90 + 56) = MEMORY[0x24BEE0D00];
    v96 = sub_21952E30C();
    *(_QWORD *)(v90 + 64) = v96;
    *(_QWORD *)(v90 + 32) = v92;
    *(_QWORD *)(v90 + 40) = v94;
    v97 = sub_219557B20();
    *(_QWORD *)(v90 + 96) = v95;
    *(_QWORD *)(v90 + 104) = v96;
    *(_QWORD *)(v90 + 72) = v97;
    *(_QWORD *)(v90 + 80) = v98;
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_54();

    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_42();
    (*((void (**)(uint64_t, uint64_t))v125 + 1))(v36, v124);
    v86 = (uint64_t)v13;
    v87 = (uint64_t)v120;
    goto LABEL_63;
  }
  v52 = sub_2195333B4(v36, (uint64_t)v49, v51, v116, v117, v119, v118);
  if (!v52)
  {
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_46(*((uint64_t (**)(uint64_t, uint64_t))v26 + 1));
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_6_1();
    goto LABEL_62;
  }
  v53 = 0;
  v115 = v114 + 1;
  v54 = *(_QWORD *)(v52 + 64);
  v122 = v52 + 64;
  v55 = 1 << *(_BYTE *)(v52 + 32);
  if (v55 < 64)
    v56 = ~(-1 << v55);
  else
    v56 = -1;
  v57 = v56 & v54;
  v123 = (unint64_t)(v55 + 63) >> 6;
  if ((v56 & v54) != 0)
  {
LABEL_17:
    v58 = __clz(__rbit64(v57));
    v57 &= v57 - 1;
    matched = v53;
    v59 = v58 | ((_QWORD)v53 << 6);
    goto LABEL_32;
  }
  while (1)
  {
    v60 = (int64_t)v53 + 1;
    if (__OFADD__(v53, 1))
      goto LABEL_77;
    v13 = v121;
    if (v60 >= v123)
      break;
    v61 = *(_QWORD *)(v122 + 8 * v60);
    v62 = (int64_t)v53 + 1;
    if (v61)
      goto LABEL_31;
    v62 = (int64_t)v53 + 2;
    if ((uint64_t)v53 + 2 >= v123)
      break;
    v61 = *(_QWORD *)(v122 + 8 * v62);
    if (v61)
      goto LABEL_31;
    v62 = (int64_t)v53 + 3;
    if ((uint64_t)v53 + 3 >= v123)
      break;
    v61 = *(_QWORD *)(v122 + 8 * v62);
    if (v61)
      goto LABEL_31;
    v63 = v53 + 1;
    if ((uint64_t)(v53 + 1) >= v123)
      break;
    v61 = *(_QWORD *)(v122 + 8 * (_QWORD)v63);
    if (!v61)
    {
      while (1)
      {
        v62 = (int64_t)v63 + 1;
        if (__OFADD__(v63, 1))
          goto LABEL_78;
        if (v62 >= v123)
          goto LABEL_58;
        v61 = *(_QWORD *)(v122 + 8 * v62);
        v63 = (int *)((char *)v63 + 1);
        if (v61)
          goto LABEL_31;
      }
    }
    v62 = (int64_t)(v53 + 1);
LABEL_31:
    v57 = (v61 - 1) & v61;
    matched = (int *)v62;
    v59 = __clz(__rbit64(v61)) + (v62 << 6);
LABEL_32:
    v64 = v52;
    v65 = *(_QWORD *)(*(_QWORD *)(v52 + 48) + 8 * v59);
    v66 = *(_QWORD *)(*(_QWORD *)(v52 + 56) + 8 * v59);
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_75();
    swift_isUniquelyReferenced_nonNull_native();
    v67 = OUTLINED_FUNCTION_97();
    if (__OFADD__(v47[2], (v68 & 1) == 0))
    {
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
      swift_once();
      v27 = (id)qword_253F221A8;
      OUTLINED_FUNCTION_77();

      goto LABEL_87;
    }
    v34 = v67;
    v69 = v68;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE80);
    if ((sub_21955839C() & 1) != 0)
    {
      v70 = OUTLINED_FUNCTION_97();
      if ((v69 & 1) != (v71 & 1))
      {
        sub_21955845C();
        __break(1u);
        return;
      }
      v34 = v70;
    }
    swift_bridgeObjectRelease();
    if ((v69 & 1) != 0)
    {
      OUTLINED_FUNCTION_52();
    }
    else
    {
      v47[(v34 >> 6) + 8] |= 1 << v34;
      *(_QWORD *)(v47[6] + 8 * v34) = v65;
      *(_QWORD *)(v47[7] + 8 * v34) = MEMORY[0x24BEE4AF8];
      v72 = v47[2];
      v73 = v72 + 1;
      v74 = __OFADD__(v72, 1);
      OUTLINED_FUNCTION_52();
      if (v74)
        goto LABEL_75;
      v47[2] = v73;
    }
    v75 = v47[7];
    OUTLINED_FUNCTION_51();
    v76 = *(_QWORD *)(v66 + 16);
    v77 = *(_QWORD *)(v75 + 8 * v34);
    v78 = *(_QWORD *)(v77 + 16);
    v79 = v78 + v76;
    if (__OFADD__(v78, v76))
      goto LABEL_72;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v75 + 8 * v34) = v77;
    if (!isUniquelyReferenced_nonNull_native || v79 > *(_QWORD *)(v77 + 24) >> 1)
    {
      if (v78 <= v79)
        v81 = v78 + v76;
      else
        v81 = v78;
      sub_219546678(isUniquelyReferenced_nonNull_native, v81, 1, v77);
      v77 = v82;
      *(_QWORD *)(v75 + 8 * v34) = v82;
    }
    if (*(_QWORD *)(v66 + 16))
    {
      v34 = (*(_QWORD *)(v77 + 24) >> 1) - *(_QWORD *)(v77 + 16);
      type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode();
      if ((uint64_t)v34 < v76)
        goto LABEL_74;
      swift_arrayInitWithCopy();
      if (v76)
      {
        v83 = *(_QWORD *)(v77 + 16);
        v84 = __OFADD__(v83, v76);
        v85 = v83 + v76;
        if (v84)
          goto LABEL_76;
        *(_QWORD *)(v77 + 16) = v85;
      }
    }
    else if (v76)
    {
      goto LABEL_73;
    }
    OUTLINED_FUNCTION_81();
    v34 = (unint64_t)sub_219542464;
    v5 = v124;
    v26 = v125;
    v52 = v64;
    v53 = matched;
    if (v57)
      goto LABEL_17;
  }
LABEL_58:
  swift_release();
  v36 = v113;
  OUTLINED_FUNCTION_46(*((uint64_t (**)(uint64_t, uint64_t))v26 + 1));
  v46 = v115;
  v37 = v120;
  v45 = v108;
  if (v115 != v109)
    goto LABEL_9;
  OUTLINED_FUNCTION_98();
  OUTLINED_FUNCTION_10();
  v44 = v107;
LABEL_61:
  OUTLINED_FUNCTION_54();
  *v13 = 1;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v13[v44] = v47;
LABEL_62:
  v86 = (uint64_t)v13;
  v87 = (uint64_t)v37;
LABEL_63:
  sub_219534768(v86, v87, type metadata accessor for UtteranceRuleMatchResult);
  sub_21952ECDC((uint64_t)v13, type metadata accessor for UtteranceRuleMatchResult);
  OUTLINED_FUNCTION_75();
LABEL_88:
  OUTLINED_FUNCTION_1_0();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_21952E944(v1, v0);
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + *(int *)(v1 + 20);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_219558138();
}

unint64_t OUTLINED_FUNCTION_45_0()
{
  uint64_t v0;

  return sub_21952F82C(v0);
}

uint64_t OUTLINED_FUNCTION_45_2()
{
  return type metadata accessor for OverrideMatchResult(0);
}

uint64_t sub_219532C2C(uint64_t a1, unint64_t *a2)
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

id sub_219532C64(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v15;

  v5 = v4;
  if ((a4 & 1) != 0)
    a3 = 0;
  v9 = qword_253F22610;
  swift_bridgeObjectRetain();
  if (v9 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_7();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253F21E20);
  OUTLINED_FUNCTION_1_8();
  if (qword_253F225F8 != -1)
    swift_once();
  swift_beginAccess();
  v10 = qword_253F225E8;
  swift_bridgeObjectRetain();
  v11 = sub_219532E28(a1, a2, a3, v10);
  OUTLINED_FUNCTION_4_3();
  if (!v11)
  {
    OUTLINED_FUNCTION_1_8();
    v12 = objc_allocWithZone(MEMORY[0x24BDD1798]);
    swift_bridgeObjectRetain();
    v13 = sub_21953AB0C(a1, a2, a3);
    if (v5)
    {
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_0_7();
      os_unfair_lock_unlock((os_unfair_lock_t)&dword_253F21E20);
      OUTLINED_FUNCTION_1_8();
      return v11;
    }
    v15 = v13;
    swift_beginAccess();
    v11 = v15;
    sub_2195484CC((uint64_t)v11, a1, a2, a3);
  }
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_0_7();
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253F21E20);
  OUTLINED_FUNCTION_1_8();
  return v11;
}

void *sub_219532E28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  void *v7;
  id v8;

  if (!*(_QWORD *)(a4 + 16))
    return 0;
  v5 = sub_21952F8E8(a1, a2, a3);
  if ((v6 & 1) == 0)
    return 0;
  v7 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v5);
  v8 = v7;
  return v7;
}

uint64_t sub_219532E6C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  char v4;

  if (*(_QWORD *)(a2 + 16) && (v3 = sub_21952F82C(a1), (v4 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v3);
  else
    return 0;
}

unint64_t sub_219532EB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F22640;
  if (!qword_253F22640)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F221A0);
    result = MEMORY[0x219A2EE44](MEMORY[0x24BEE2C50], v1);
    atomic_store(result, (unint64_t *)&qword_253F22640);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x219A2EE38](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_30()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 104))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return 0;
}

_BYTE *initializeWithCopy for UtteranceRuleMatchResult(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_219557AB4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  v11 = *(void **)&a2[v10];
  *(_QWORD *)&a1[v10] = v11;
  swift_bridgeObjectRetain();
  v12 = v11;
  return a1;
}

uint64_t storeEnumTagSinglePayload for UtteranceRuleMatchResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void destroy for UtteranceRuleMatchResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_219557AB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();

}

void sub_2195330A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19(a1, a2, a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_99();
}

void sub_2195330CC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19(a1, a2, a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_99();
}

_BYTE *initializeWithCopy for TurnInputRuleMatchResult(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  int *matched;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)matched))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    *v7 = *v8;
    v11 = matched[5];
    v12 = &v7[v11];
    v13 = &v8[v11];
    v14 = sub_219557AB4();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    *(_QWORD *)&v7[matched[6]] = *(_QWORD *)&v8[matched[6]];
    v15 = matched[7];
    v16 = *(void **)&v8[v15];
    *(_QWORD *)&v7[v15] = v16;
    swift_bridgeObjectRetain();
    v17 = v16;
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)matched);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t getEnumTagSinglePayload for UtteranceRuleMatchResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t destroy for TurnInputRuleMatchResult(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t matched;
  uint64_t v4;
  uint64_t v5;

  v2 = a1 + *(int *)(a2 + 20);
  matched = type metadata accessor for UtteranceRuleMatchResult(0);
  if (!__swift_getEnumTagSinglePayload(v2, 1, matched))
  {
    v4 = v2 + *(int *)(matched + 20);
    v5 = sub_219557AB4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    swift_bridgeObjectRelease();

  }
  return swift_bridgeObjectRelease();
}

uint64_t storeEnumTagSinglePayload for OverrideMatchResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for OverrideMatchResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for SiriNLOverride()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t OUTLINED_FUNCTION_59@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return sub_219557E80();
}

uint64_t OUTLINED_FUNCTION_59_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

void OUTLINED_FUNCTION_54()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 208) + 8))(v0, *(_QWORD *)(v1 - 200));
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_20_4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_2195333B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
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
  uint64_t v19;
  char *v20;
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
  _BOOL4 v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t *v52;
  char v53;
  char *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t);
  unsigned int v69;
  uint64_t v70;
  char *v71;
  void (*v72)(char *, uint64_t, void *);
  unint64_t v73;
  void (*v74)(char *, void *);
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  unsigned int v82;
  char *v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  BOOL v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  BOOL v96;
  uint64_t v98;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  _QWORD *v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  _QWORD *v128;
  _QWORD *v129;
  _QWORD *v130;
  id v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void (*v140)(_QWORD *@<X8>);
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  char *v149;
  void (*v150)(char *, char *, uint64_t);
  char *v151;
  uint64_t v152;
  char *v153;
  unint64_t v154;
  int v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  char v160;
  unint64_t v161;
  char v162;
  char v163;
  unint64_t v164;
  char v165;
  uint64_t v166;
  uint64_t v167;
  BOOL v168;
  uint64_t v169;
  uint64_t v170;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v172;
  unint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  id v180;
  id v181;
  uint64_t result;
  _QWORD v183[2];
  uint64_t v184;
  uint64_t v185;
  char *v186;
  uint64_t v187;
  __int128 v188;
  uint64_t v189;
  _BOOL4 v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t *v195;
  uint64_t v196;
  char *v197;
  char *v198;
  uint64_t *v199;
  uint64_t v200;
  unint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void (*v205)(char *, uint64_t);
  _QWORD *v206;
  unint64_t v207;
  unint64_t *v208;
  char *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  char *v217;
  char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void (*v223)(char *, uint64_t, uint64_t);
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  _QWORD *v227;

  v194 = a7;
  v193 = a6;
  v187 = a5;
  v226 = a4;
  v196 = a3;
  v185 = type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode();
  v184 = *(_QWORD *)(v185 - 8);
  MEMORY[0x24BDAC7A8](v185);
  v191 = (uint64_t)v183 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21955749C();
  v214 = *(_QWORD *)(v10 - 8);
  v215 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v213 = (char *)v183 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void *)sub_219557640();
  v219 = *((_QWORD *)v12 - 1);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v217 = (char *)v183 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v218 = (char *)v183 - v15;
  v16 = sub_2195577B4();
  v224 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v209 = (char *)v183 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v183 - v19;
  v21 = sub_219557B08();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v183[0] = (char *)v183 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v198 = (char *)v183 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)v183 - v27;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22628);
  MEMORY[0x24BDAC7A8](v29);
  v192 = (char *)v183 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22198);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v195 = (_QWORD *)((char *)v183 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = MEMORY[0x24BDAC7A8](v32);
  v186 = (char *)v183 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v208 = (_QWORD *)((char *)v183 - v37);
  MEMORY[0x24BDAC7A8](v36);
  v199 = (_QWORD *)((char *)v183 - v38);
  v210 = a1;
  v39 = *(_QWORD *)(sub_219557A0C() + 16);
  swift_bridgeObjectRelease();
  if (!v39)
  {
    v12 = &unk_253F22000;
    sub_2195582A0();
    if (qword_253F22160 == -1)
    {
LABEL_82:
      v131 = *((id *)v12 + 53);
      sub_219558138();

      return MEMORY[0x24BEE4B00];
    }
LABEL_140:
    swift_once();
    goto LABEL_82;
  }
  v40 = a2 + v196;
  if (__OFADD__(a2, v196))
  {
LABEL_139:
    __break(1u);
    goto LABEL_140;
  }
  v204 = sub_219557A0C();
  v207 = 0;
  v216 = v40;
  v189 = v40 - 1;
  v41 = __OFSUB__(v40, 1);
  v190 = v41;
  v188 = xmmword_219558D80;
  v206 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v202 = v21;
  v221 = v16;
  v203 = v22;
  v200 = v29;
  v220 = a2;
  v197 = v28;
  v212 = v12;
  while (1)
  {
    v42 = *(_QWORD *)(v204 + 16);
    v43 = (uint64_t)v208;
    if (v207 == v42)
    {
      v44 = 1;
    }
    else
    {
      if (v207 >= v42)
        goto LABEL_133;
      v45 = v28;
      v46 = v21;
      v47 = v207;
      v225 = v207 + 1;
      v48 = &v192[*(int *)(v29 + 48)];
      (*(void (**)(char *, unint64_t, uint64_t))(v22 + 16))(v48, v204+ ((*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))+ *(_QWORD *)(v22 + 72) * v207, v46);
      v49 = (char *)v208 + *(int *)(v29 + 48);
      *v208 = v47;
      v21 = v46;
      v28 = v45;
      v50 = v48;
      v43 = (uint64_t)v208;
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v49, v50, v21);
      v44 = 0;
      v207 = v225;
    }
    __swift_storeEnumTagSinglePayload(v43, v44, 1, v29);
    v51 = v43;
    v52 = v199;
    sub_219534730(v51, (uint64_t)v199, &qword_253F22198);
    if (__swift_getEnumTagSinglePayload((uint64_t)v52, 1, v29) == 1)
      break;
    v225 = *v52;
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, (char *)v52 + *(int *)(v29 + 48), v21);
    v53 = sub_219557AFC();
    v54 = v198;
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v198, v28, v21);
    if ((v53 & 1) == 0)
    {
      v205 = *(void (**)(char *, uint64_t))(v22 + 8);
      v205(v54, v21);
LABEL_62:
      v105 = v194;
      v106 = v193;
      sub_219558288();
      if ((v107 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_115:
        sub_2195582A0();
        if (qword_253F22160 != -1)
          swift_once();
        v176 = (void *)qword_253F221A8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
        v177 = swift_allocObject();
        v178 = MEMORY[0x24BEE1768];
        *(_OWORD *)(v177 + 16) = xmmword_2195590B0;
        v179 = MEMORY[0x24BEE17F0];
        *(_QWORD *)(v177 + 56) = v178;
        *(_QWORD *)(v177 + 64) = v179;
        *(_QWORD *)(v177 + 32) = a2;
        *(_QWORD *)(v177 + 96) = v178;
        *(_QWORD *)(v177 + 104) = v179;
        *(_QWORD *)(v177 + 72) = v216;
        *(_QWORD *)(v177 + 136) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v177 + 144) = sub_21952E30C();
        *(_QWORD *)(v177 + 112) = v106;
        *(_QWORD *)(v177 + 120) = v105;
        v180 = v176;
        swift_bridgeObjectRetain();
        sub_219558138();

        swift_bridgeObjectRelease();
        v205(v28, v21);
        return 0;
      }
      v108 = sub_219558240();
      v110 = v109;
      v112 = v111;
      v114 = v113;
      sub_219545848();
      if ((v115 & 0x100000000) != 0)
        goto LABEL_83;
      if (v190)
        goto LABEL_131;
      sub_219545848();
      if ((v116 & 0x100000000) != 0)
      {
LABEL_83:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v21 = v202;
        v105 = v194;
        v106 = v193;
        a2 = v220;
        goto LABEL_115;
      }
      v117 = v116;
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F22648);
      v118 = swift_allocObject();
      *(_OWORD *)(v118 + 16) = v188;
      v119 = v118;
      sub_2195577A8();
      sub_219557784();
      sub_219557730();
      if (v117 == -1)
        goto LABEL_132;
      sub_21955770C();
      MEMORY[0x219A2E55C](v108, v110, v112, v114);
      sub_21955776C();
      swift_bridgeObjectRelease();
      v120 = v206;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21954657C(0, v120[2] + 1, 1, v120);
        v120 = v128;
      }
      v21 = v202;
      a2 = v220;
      v16 = v221;
      v122 = v120[2];
      v121 = v120[3];
      v123 = v122 + 1;
      if (v122 < v121 >> 1)
      {
        v124 = v119;
        goto LABEL_77;
      }
      sub_21954657C(v121 > 1, v122 + 1, 1, v120);
      v124 = v119;
      goto LABEL_80;
    }
    v55 = sub_219557AF0();
    v57 = v56;
    swift_bridgeObjectRelease();
    if ((v57 & 0x2000000000000000) != 0)
      v58 = HIBYTE(v57) & 0xF;
    else
      v58 = v55 & 0xFFFFFFFFFFFFLL;
    v205 = *(void (**)(char *, uint64_t))(v22 + 8);
    v205(v54, v21);
    if (!v58)
      goto LABEL_62;
    v59 = sub_219557AF0();
    v61 = v187;
    if (!*(_QWORD *)(v187 + 16) || (v62 = sub_21952F890(v59, v60), (v63 & 1) == 0))
    {
      swift_bridgeObjectRelease();
      v205(v28, v21);
      goto LABEL_125;
    }
    v64 = *(_QWORD *)(*(_QWORD *)(v61 + 56) + 8 * v62);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v65 = *(_QWORD *)(v64 + 16);
    if (v65)
    {
      v66 = (*(unsigned __int8 *)(v224 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v224 + 80);
      v183[1] = v64;
      v201 = v66;
      v67 = v64 + v66;
      v68 = *(void (**)(char *, uint64_t, uint64_t))(v224 + 16);
      v222 = *(_QWORD *)(v224 + 72);
      v223 = v68;
      v211 = MEMORY[0x24BEE4AF8];
      while (1)
      {
        v223(v20, v67, v16);
        v69 = sub_219557724();
        v71 = v218;
        v70 = v219;
        v72 = *(void (**)(char *, uint64_t, void *))(v219 + 16);
        v72(v218, v226, v12);
        v73 = *(_QWORD *)(sub_219557628() + 16);
        swift_bridgeObjectRelease();
        v74 = *(void (**)(char *, void *))(v70 + 8);
        v74(v71, v12);
        if (v73 <= v69)
        {
          v81 = -1;
        }
        else
        {
          v75 = sub_219557628();
          if (*(_QWORD *)(v75 + 16) <= (unint64_t)v69)
          {
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
            goto LABEL_135;
          }
          v76 = v213;
          v77 = v214;
          v78 = v215;
          (*(void (**)(char *, unint64_t, uint64_t))(v214 + 16))(v213, v75+ ((*(unsigned __int8 *)(v77 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80))+ *(_QWORD *)(v214 + 72) * v69, v215);
          swift_bridgeObjectRelease();
          v79 = sub_219557490();
          v80 = *(void (**)(char *, uint64_t))(v77 + 8);
          v12 = v212;
          v80(v76, v78);
          v81 = v79;
        }
        v82 = sub_219557700();
        v83 = v217;
        v72(v217, v226, v12);
        if (v82)
        {
          v84 = v82;
          v85 = *(_QWORD *)(sub_219557628() + 16);
          swift_bridgeObjectRelease();
          v74(v83, v12);
          if (v85 >= v84)
          {
            v86 = sub_219557628();
            a2 = v220;
            if (*(_QWORD *)(v86 + 16) < v84)
              goto LABEL_130;
            v87 = v84 - 1;
            v88 = v225 != 0;
            v89 = v213;
            v90 = v214;
            v91 = v215;
            (*(void (**)(char *, unint64_t, uint64_t))(v214 + 16))(v213, v86+ ((*(unsigned __int8 *)(v90 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v90 + 80))+ *(_QWORD *)(v214 + 72) * v87, v215);
            swift_bridgeObjectRelease();
            LODWORD(v92) = sub_219557484();
            (*(void (**)(char *, uint64_t))(v90 + 8))(v89, v91);
            v92 = (int)v92;
            v93 = v81 == a2 || v88;
            v94 = v216;
            if (v81 < a2 || v216 < (int)v92)
            {
              v16 = v221;
              v12 = v212;
            }
            else
            {
              v16 = v221;
              v12 = v212;
              if ((v93 & 1) != 0)
                goto LABEL_46;
            }
            goto LABEL_58;
          }
        }
        else
        {
          v74(v83, v12);
        }
        v96 = v225 != 0;
        a2 = v220;
        if (v81 == v220)
          v96 = 1;
        v94 = v216;
        if (v81 < v220 || v216 < -1)
        {
          v16 = v221;
        }
        else
        {
          v16 = v221;
          if (v96)
          {
            v92 = -1;
LABEL_46:
            v98 = *(_QWORD *)(sub_219557A0C() + 16);
            swift_bridgeObjectRelease();
            if (v225 != v98 - 1 || v92 == v94)
            {
              v223(v209, (uint64_t)v20, v16);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
              {
                v100 = v211;
              }
              else
              {
                sub_219546568(0, *(_QWORD *)(v211 + 16) + 1, 1, v211);
                v100 = v103;
              }
              v102 = *(_QWORD *)(v100 + 16);
              v101 = *(_QWORD *)(v100 + 24);
              if (v102 >= v101 >> 1)
              {
                sub_219546568(v101 > 1, v102 + 1, 1, v100);
                v100 = v104;
              }
              *(_QWORD *)(v100 + 16) = v102 + 1;
              v211 = v100;
              (*(void (**)(unint64_t, char *, uint64_t))(v224 + 32))(v100 + v201 + v102 * v222, v209, v16);
            }
          }
        }
LABEL_58:
        (*(void (**)(char *, uint64_t))(v224 + 8))(v20, v16);
        v67 += v222;
        if (!--v65)
        {
          swift_bridgeObjectRelease();
          v21 = v202;
          v125 = v211;
          goto LABEL_72;
        }
      }
    }
    swift_bridgeObjectRelease();
    v125 = MEMORY[0x24BEE4AF8];
LABEL_72:
    v120 = v206;
    if (!*(_QWORD *)(v125 + 16))
    {
      swift_bridgeObjectRelease();
      v205(v197, v21);
LABEL_125:
      swift_bridgeObjectRelease();
LABEL_126:
      swift_bridgeObjectRelease();
      return 0;
    }
    v126 = v125;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_21954657C(0, v120[2] + 1, 1, v120);
      v120 = v130;
    }
    v122 = v120[2];
    v127 = v120[3];
    v123 = v122 + 1;
    if (v122 < v127 >> 1)
    {
      v124 = v126;
      goto LABEL_77;
    }
    sub_21954657C(v127 > 1, v122 + 1, 1, v120);
    v124 = v126;
LABEL_80:
    v120 = v129;
LABEL_77:
    v120[2] = v123;
    v206 = v120;
    v120[v122 + 4] = v124;
    v28 = v197;
    v205(v197, v21);
    v22 = v203;
    v29 = v200;
  }
  swift_bridgeObjectRelease();
  static MatchingSpanUtils.getAdjacentSpanLists(from:usingTokens:)();
  v134 = v133;
  swift_bridgeObjectRelease();
  v135 = *(_QWORD *)(v134 + 16);
  if (v135 >= 2)
  {
    sub_2195582A0();
    if (qword_253F22160 != -1)
      swift_once();
    v136 = (id)qword_253F221A8;
    sub_219558138();

    v135 = *(_QWORD *)(v134 + 16);
  }
  if (!v135)
    goto LABEL_126;
  v137 = *(_QWORD *)(v134 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v138 = *(_QWORD *)(v137 + 16);
  v139 = *(_QWORD *)(sub_219557A0C() + 16);
  swift_bridgeObjectRelease();
  if (v138 != v139)
  {
    swift_bridgeObjectRelease();
    sub_2195582AC();
    if (qword_253F22160 != -1)
      swift_once();
    v181 = (id)qword_253F221A8;
    sub_219558138();

    return 0;
  }
  v140 = 0;
  v141 = 0;
  v225 = sub_219557A0C();
  v142 = *(_QWORD *)(v225 + 16);
  v132 = (_QWORD *)MEMORY[0x24BEE4B00];
  v12 = (void *)v183[0];
  v226 = v142;
  while (2)
  {
    v143 = (uint64_t)v195;
    if (v141 == v142)
    {
      v144 = 1;
      v141 = v142;
      v145 = v200;
    }
    else
    {
      if (v141 >= *(_QWORD *)(v225 + 16))
        goto LABEL_137;
      v146 = v203;
      v145 = v200;
      v147 = &v192[*(int *)(v200 + 48)];
      v148 = v202;
      (*(void (**)(char *, unint64_t, uint64_t))(v203 + 16))(v147, v225+ ((*(unsigned __int8 *)(v146 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v146 + 80))+ *(_QWORD *)(v146 + 72) * v141, v202);
      v149 = (char *)v195 + *(int *)(v145 + 48);
      *v195 = v141;
      v150 = *(void (**)(char *, char *, uint64_t))(v146 + 32);
      v12 = (void *)v183[0];
      v151 = v147;
      v143 = (uint64_t)v195;
      v150(v149, v151, v148);
      v144 = 0;
      ++v141;
    }
    __swift_storeEnumTagSinglePayload(v143, v144, 1, v145);
    v152 = v143;
    v153 = v186;
    sub_219534730(v152, (uint64_t)v186, &qword_253F22198);
    if (__swift_getEnumTagSinglePayload((uint64_t)v153, 1, v145) == 1)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_219545380((uint64_t)v140);
      return (uint64_t)v132;
    }
    v154 = *(_QWORD *)v153;
    (*(void (**)(void *, char *, uint64_t))(v203 + 32))(v12, &v153[*(int *)(v145 + 48)], v202);
    v155 = sub_219557AD8();
    if ((v154 & 0x8000000000000000) != 0)
      goto LABEL_134;
    if (v154 >= *(_QWORD *)(v137 + 16))
    {
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
    v156 = v155;
    v157 = v137
         + ((*(unsigned __int8 *)(v224 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v224 + 80))
         + *(_QWORD *)(v224 + 72) * v154;
    v158 = v191;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v224 + 16))(v191, v157, v16);
    *(_QWORD *)(v158 + *(int *)(v185 + 20)) = (int)sub_219557AE4();
    sub_219545380((uint64_t)v140);
    swift_isUniquelyReferenced_nonNull_native();
    v227 = v132;
    v159 = sub_21952F82C(v156);
    if (__OFADD__(v132[2], (v160 & 1) == 0))
      goto LABEL_136;
    v161 = v159;
    v162 = v160;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE80);
    v163 = sub_21955839C();
    v132 = v227;
    if ((v163 & 1) == 0)
    {
LABEL_102:
      swift_bridgeObjectRelease();
      if ((v162 & 1) != 0)
      {
        swift_bridgeObjectRetain();
      }
      else
      {
        v132[(v161 >> 6) + 8] |= 1 << v161;
        *(_QWORD *)(v132[6] + 8 * v161) = v156;
        *(_QWORD *)(v132[7] + 8 * v161) = MEMORY[0x24BEE4AF8];
        v166 = v132[2];
        v167 = v166 + 1;
        v168 = __OFADD__(v166, 1);
        swift_bridgeObjectRetain();
        if (v168)
          goto LABEL_138;
        v132[2] = v167;
      }
      v169 = v132[7];
      swift_bridgeObjectRelease();
      v170 = *(_QWORD *)(v169 + 8 * v161);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v169 + 8 * v161) = v170;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_219546678(0, *(_QWORD *)(v170 + 16) + 1, 1, v170);
        v170 = v174;
        *(_QWORD *)(v169 + 8 * v161) = v174;
      }
      v173 = *(_QWORD *)(v170 + 16);
      v172 = *(_QWORD *)(v170 + 24);
      if (v173 >= v172 >> 1)
      {
        sub_219546678(v172 > 1, v173 + 1, 1, v170);
        v170 = v175;
        *(_QWORD *)(v169 + 8 * v161) = v175;
      }
      *(_QWORD *)(v170 + 16) = v173 + 1;
      sub_21953E668(v191, v170+ ((*(unsigned __int8 *)(v184 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v184 + 80))+ *(_QWORD *)(v184 + 72) * v173);
      (*(void (**)(void *, uint64_t))(v203 + 8))(v12, v202);
      v140 = sub_219542464;
      v16 = v221;
      v142 = v226;
      continue;
    }
    break;
  }
  v164 = sub_21952F82C(v156);
  if ((v162 & 1) == (v165 & 1))
  {
    v161 = v164;
    goto LABEL_102;
  }
  result = sub_21955845C();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode()
{
  uint64_t result;

  result = qword_253F221B8;
  if (!qword_253F221B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2195346BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2195577B4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_219534730(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_99();
}

void sub_219534768(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_99();
}

void sub_2195347A0()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
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
  uint64_t v23;
  char *v24;
  char v25;
  void (*v26)(_QWORD, _QWORD, _QWORD);
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
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
  id v51;
  uint64_t v52[2];
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  void (*v56)(_QWORD, _QWORD, _QWORD);
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  OUTLINED_FUNCTION_62();
  v2 = v0;
  v53 = v3;
  v60 = v4;
  v5 = sub_219557A30();
  v52[0] = *(_QWORD *)(v5 - 8);
  v52[1] = v5;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_9_0();
  v9 = (char *)(v8 - v7);
  v10 = sub_21955767C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v57 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_79_0();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v52 - v15;
  v17 = sub_219557A48();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_3();
  v59 = v19;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v20);
  v55 = (uint64_t)v52 - v21;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)v52 - v23;
  v25 = sub_2195579F4();
  v26 = *(void (**)(_QWORD, _QWORD, _QWORD))(v18 + 16);
  v58 = v2;
  v27 = v2;
  v28 = v60;
  v56 = v26;
  v26(v24, v27, v17);
  v54 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v54(v16, v28, v10);
  if ((v25 & 1) != 0)
  {
    sub_219557A00();
    sub_219557A18();
    v29 = sub_219534C08((uint64_t)v16, v9);
    OUTLINED_FUNCTION_50(v52[0]);
    OUTLINED_FUNCTION_39_2((uint64_t)v1);
    OUTLINED_FUNCTION_39_2((uint64_t)v16);
    OUTLINED_FUNCTION_52_2();
    if ((v29 & 1) == 0)
    {
      sub_2195582A0();
      if (qword_253F22160 == -1)
        goto LABEL_22;
      goto LABEL_27;
    }
  }
  else
  {
    OUTLINED_FUNCTION_39_2((uint64_t)v16);
    OUTLINED_FUNCTION_52_2();
  }
  v30 = v17;
  v31 = v58;
  v32 = sub_219557A3C();
  v33 = v55;
  OUTLINED_FUNCTION_51_1(v55, v31);
  v34 = (uint64_t)v57;
  v54(v57, v28, v10);
  if ((v32 & 1) != 0)
  {
    v35 = v33;
    v36 = sub_219557A24();
    v37 = sub_21953E73C();
    OUTLINED_FUNCTION_39_2(v34);
    OUTLINED_FUNCTION_69_0(v35);
    if (((v36 ^ v37) & 1) != 0)
    {
      sub_2195582A0();
      if (qword_253F22160 == -1)
        goto LABEL_22;
      goto LABEL_27;
    }
  }
  else
  {
    OUTLINED_FUNCTION_39_2(v34);
    OUTLINED_FUNCTION_69_0(v33);
  }
  v38 = *(_QWORD *)(sub_219557A0C() + 16);
  swift_bridgeObjectRelease();
  v39 = v59;
  OUTLINED_FUNCTION_51_1(v59, v31);
  if (!v38)
  {
LABEL_24:
    OUTLINED_FUNCTION_69_0(v39);
    goto LABEL_25;
  }
  v40 = sub_219557A0C();
  v41 = *(_QWORD *)(v40 + 16);
  if (!v41)
  {
    OUTLINED_FUNCTION_10();
    goto LABEL_24;
  }
  v60 = v30;
  sub_2195577B4();
  v42 = 0;
  OUTLINED_FUNCTION_31_3();
  v43 = *(_QWORD *)(v53 + 16);
  v45 = *(_QWORD *)(v44 + 72);
  v47 = v53 + v46;
  v58 = v40 + v46;
  while (v43)
  {
    ++v42;
    swift_bridgeObjectRetain();
    v48 = v47;
    v49 = v47;
    v50 = v43;
    while ((sub_21953ED28(v49) & 1) == 0)
    {
      v49 += v45;
      if (!--v50)
      {
        OUTLINED_FUNCTION_10();
        goto LABEL_21;
      }
    }
    OUTLINED_FUNCTION_4_3();
    v47 = v48;
    if (v42 == v41)
    {
      OUTLINED_FUNCTION_10();
      v39 = v59;
      goto LABEL_24;
    }
  }
LABEL_21:
  swift_bridgeObjectRelease();
  v1(v59, v60);
  sub_2195582A0();
  if (qword_253F22160 == -1)
    goto LABEL_22;
LABEL_27:
  swift_once();
LABEL_22:
  v51 = (id)qword_253F221A8;
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_77();

LABEL_25:
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_219534C08(uint64_t a1, char *a2)
{
  uint64_t v2;
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
  char *v78;
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
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  unsigned int (*v108)(char *, uint64_t);
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char v118;
  void (*v119)(char *, uint64_t);
  uint64_t v120;
  char v121;
  unint64_t v122;
  void *v123;
  uint64_t v124;
  char v125;
  char v126;
  char v127;
  char v128;
  uint64_t v129;
  char *v130;
  char v131;
  void (*v132)(char *, uint64_t);
  uint64_t v133;
  char v134;
  uint64_t v135;
  void (*v136)(char *, uint64_t);
  char *v137;
  unint64_t v138;
  uint64_t v139;
  unint64_t v140;
  char v141;
  void (*v142)(unint64_t, uint64_t);
  uint64_t v143;
  uint64_t v144;
  void (*v145)(char *, uint64_t);
  char *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *v151;
  id v152;
  char v153;
  void (*v154)(char *, unint64_t, uint64_t);
  char *v155;
  char *v156;
  char v157;
  char *v158;
  char v159;
  char v160;
  char v161;
  void (*v162)(char *, uint64_t);
  uint64_t v163;
  char *v164;
  char v165;
  char *v166;
  char *v167;
  unint64_t v168;
  char v169;
  void (*v170)(char *, uint64_t);
  char *v171;
  char *v172;
  char *v173;
  void (*v174)(char *, uint64_t);
  char *v175;
  char *v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  char *v184;
  char *v185;
  char *v186;
  char *v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  char *v191;
  char *v192;
  unint64_t v193;
  char *v194;
  char *v195;
  char *v196;
  char *v197;
  uint64_t v198;
  unint64_t v199;
  unint64_t v200;
  char *v201;
  char *v202;
  char *v203;
  unint64_t v204;
  char *v205;
  char *v206;
  BOOL v207;
  char v208;
  char *v209;
  char *v210;
  char *v211;
  char *v212;
  char *v213;
  char *v214;
  char *v215;
  char *v216;
  unint64_t v217;
  unint64_t v218;
  void (*v219)(char *, uint64_t);
  char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  char *v224;
  uint64_t v225;
  unint64_t v226;
  char *v227;
  unint64_t v228;
  unint64_t v229;
  char *v230;
  char v232;
  char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  char *v237;
  uint64_t v238;
  unint64_t v239;
  char *v240;
  unint64_t v241;
  unint64_t v242;
  char *v243;
  char v245;
  uint64_t result;
  char *v247;
  uint64_t v248;
  char *v249;
  uint64_t v250;
  void (*v251)(char *, uint64_t);
  uint64_t v252;
  char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void (*v259)(char *, uint64_t, uint64_t);
  void *v260;
  uint64_t v261;
  unint64_t v262;
  uint64_t v263;
  unint64_t v264;
  unint64_t v265;
  uint64_t v266;
  unint64_t v267;
  uint64_t v268;
  unint64_t v269;
  unint64_t v270;
  uint64_t v271;
  uint64_t v272;
  char *v273;
  uint64_t v274;
  uint64_t v275;
  unint64_t v276;
  uint64_t v277;
  void *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  unint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  char v286;
  uint64_t v287;
  char v288;
  void (*v289)(char *, uint64_t, uint64_t);
  uint64_t v290;
  char v291;
  uint64_t v292;
  char v293;
  char *v294;
  char *v295;
  char *v296;
  uint64_t v297;
  uint64_t v298;
  void (*v299)(uint64_t, uint64_t);
  uint64_t v300;
  uint64_t v301;
  void (*v302)(char *, uint64_t);
  void (*v303)(char *, uint64_t);
  uint64_t v304;
  char *v305;
  char *v306;
  char *v307;
  char *v308;
  uint64_t v309;
  uint64_t v310;
  char *v311;
  char *v312;
  char *v313;
  char *v314;
  char *v315;
  unint64_t v316;
  char *v317;
  char *v318;
  char *v319;
  char *v320;
  unint64_t v321;
  uint64_t v322;
  char *v323;
  char *v324;
  char *v325;
  char *v326;
  char *v327;
  char *v328;
  char *v329;
  char *v330;
  char *v331;
  char *v332;
  char *v333;
  uint64_t v334;
  uint64_t v335;
  char *v336;
  char *v337;
  unint64_t v338;
  char *v339;
  uint64_t v340;
  uint64_t v341;
  char *v342;
  char *v343;
  uint64_t v344;
  char *v345;
  uint64_t v346;
  char *v347;
  char *v348;
  uint64_t v349;
  uint64_t v350;
  char *v351;
  uint64_t v352;
  uint64_t v353;
  char *v354;
  uint64_t v355;
  uint64_t v356;
  void (*v357)(unint64_t, uint64_t);
  uint64_t v358;
  char *v359;
  char *v360;
  uint64_t v361;
  char *v362;
  char *v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  void (*v370)(char *, uint64_t);
  char *v371;
  void *v372;
  char *v373;
  unint64_t v374;
  char *v375;
  char *v376;
  unint64_t v377;
  uint64_t v378;
  char *v379;
  char *v380;
  unint64_t v381;
  uint64_t v382;
  char *v383;
  uint64_t v384;
  char *v385;
  uint64_t v386;
  uint64_t v387;
  unint64_t v388;
  unint64_t v389;

  v383 = a2;
  v369 = a1;
  v310 = sub_219557C70();
  v309 = *(_QWORD *)(v310 - 8);
  v2 = MEMORY[0x24BDAC7A8](v310);
  v308 = (char *)&v304 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v307 = (char *)&v304 - v4;
  v322 = sub_21955767C();
  v361 = *(_QWORD *)(v322 - 8);
  v5 = MEMORY[0x24BDAC7A8](v322);
  v7 = (char *)&v304 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v315 = (char *)&v304 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v371 = (char *)&v304 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v359 = (char *)&v304 - v12;
  v364 = sub_219557BE0();
  v349 = *(_QWORD *)(v364 - 8);
  MEMORY[0x24BDAC7A8](v364);
  v363 = (char *)&v304 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v356 = sub_219557B74();
  v355 = *(_QWORD *)(v356 - 8);
  MEMORY[0x24BDAC7A8](v356);
  v354 = (char *)&v304 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v353 = sub_219557934();
  v352 = *(_QWORD *)(v353 - 8);
  MEMORY[0x24BDAC7A8](v353);
  v351 = (char *)&v304 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v368 = sub_2195577D8();
  v367 = *(_QWORD *)(v368 - 8);
  v16 = MEMORY[0x24BDAC7A8](v368);
  v357 = (void (*)(unint64_t, uint64_t))((char *)&v304 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v304 - v18;
  v20 = sub_219557D9C();
  v377 = *(_QWORD *)(v20 - 8);
  v378 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v376 = (char *)&v304 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v350 = sub_219557D0C();
  v358 = *(_QWORD *)(v350 - 8);
  v22 = MEMORY[0x24BDAC7A8](v350);
  v331 = (char *)&v304 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v338 = (unint64_t)&v304 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v326 = (char *)&v304 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v325 = (char *)&v304 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v337 = (char *)&v304 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v328 = (char *)&v304 - v32;
  v335 = sub_219557F34();
  v334 = *(_QWORD *)(v335 - 8);
  v33 = MEMORY[0x24BDAC7A8](v335);
  v324 = (char *)&v304 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v323 = (char *)&v304 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v306 = (char *)&v304 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v314 = (char *)&v304 - v40;
  MEMORY[0x24BDAC7A8](v39);
  v321 = (unint64_t)&v304 - v41;
  v346 = sub_219557F10();
  v344 = *(_QWORD *)(v346 - 8);
  v42 = MEMORY[0x24BDAC7A8](v346);
  v333 = (char *)&v304 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = MEMORY[0x24BDAC7A8](v42);
  v332 = (char *)&v304 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v312 = (char *)&v304 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v317 = (char *)&v304 - v49;
  MEMORY[0x24BDAC7A8](v48);
  v327 = (char *)&v304 - v50;
  v51 = sub_21955755C();
  v386 = *(_QWORD *)(v51 - 8);
  v387 = v51;
  v52 = MEMORY[0x24BDAC7A8](v51);
  v362 = (char *)&v304 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = MEMORY[0x24BDAC7A8](v52);
  v347 = (char *)&v304 - v55;
  v56 = MEMORY[0x24BDAC7A8](v54);
  v385 = (char *)&v304 - v57;
  v58 = MEMORY[0x24BDAC7A8](v56);
  v305 = (char *)&v304 - v59;
  v60 = MEMORY[0x24BDAC7A8](v58);
  v313 = (char *)&v304 - v61;
  v62 = MEMORY[0x24BDAC7A8](v60);
  v311 = (char *)&v304 - v63;
  v64 = MEMORY[0x24BDAC7A8](v62);
  v316 = (unint64_t)&v304 - v65;
  v66 = MEMORY[0x24BDAC7A8](v64);
  v360 = (char *)&v304 - v67;
  MEMORY[0x24BDAC7A8](v66);
  v380 = (char *)&v304 - v68;
  v384 = sub_219557B98();
  v382 = *(_QWORD *)(v384 - 8);
  v69 = MEMORY[0x24BDAC7A8](v384);
  v375 = (char *)&v304 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = MEMORY[0x24BDAC7A8](v69);
  v379 = (char *)&v304 - v72;
  v73 = MEMORY[0x24BDAC7A8](v71);
  v342 = (char *)&v304 - v74;
  v75 = MEMORY[0x24BDAC7A8](v73);
  v374 = (unint64_t)&v304 - v76;
  MEMORY[0x24BDAC7A8](v75);
  v78 = (char *)&v304 - v77;
  v79 = sub_219557598();
  v80 = *(_QWORD *)(v79 - 8);
  v81 = MEMORY[0x24BDAC7A8](v79);
  v318 = (char *)&v304 - ((v82 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = MEMORY[0x24BDAC7A8](v81);
  v319 = (char *)&v304 - v84;
  v85 = MEMORY[0x24BDAC7A8](v83);
  v320 = (char *)&v304 - v86;
  v87 = MEMORY[0x24BDAC7A8](v85);
  v330 = (char *)&v304 - v88;
  v89 = MEMORY[0x24BDAC7A8](v87);
  v329 = (char *)&v304 - v90;
  v91 = MEMORY[0x24BDAC7A8](v89);
  v343 = (char *)&v304 - v92;
  v93 = MEMORY[0x24BDAC7A8](v91);
  v336 = (char *)&v304 - v94;
  v95 = MEMORY[0x24BDAC7A8](v93);
  v348 = (char *)&v304 - v96;
  v97 = MEMORY[0x24BDAC7A8](v95);
  v99 = (char *)&v304 - v98;
  v100 = MEMORY[0x24BDAC7A8](v97);
  v373 = (char *)&v304 - v101;
  MEMORY[0x24BDAC7A8](v100);
  v103 = (char *)&v304 - v102;
  v372 = 0;
  v104 = sub_219557A30();
  v105 = *(_QWORD *)(v104 - 8);
  MEMORY[0x24BDAC7A8](v104);
  v107 = (char *)&v304 - ((v106 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v105 + 16))(v107, v383, v104);
  v340 = v105;
  v108 = *(unsigned int (**)(char *, uint64_t))(v105 + 88);
  v109 = v371;
  v339 = v107;
  v341 = v104;
  v207 = v108(v107, v104) == *MEMORY[0x24BE9C960];
  v383 = v7;
  v366 = v79;
  if (v207)
  {
    sub_219557658();
    v110 = sub_21955758C();
    v370 = *(void (**)(char *, uint64_t))(v80 + 8);
    v370(v103, v79);
    v111 = *(_QWORD *)(v110 + 16);
    if (!v111)
    {
      swift_bridgeObjectRelease();
      v177 = v359;
      v178 = v361;
      goto LABEL_133;
    }
    v377 = (*(unsigned __int8 *)(v358 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v358 + 80);
    v375 = (char *)v110;
    v376 = (char *)(v110 + v377);
    v112 = *(_QWORD *)(v358 + 72);
    swift_bridgeObjectRetain();
    v379 = 0;
    v113 = v380;
    v381 = v112;
    v368 = v111;
LABEL_5:
    v114 = v373;
    sub_219557658();
    v115 = sub_21955758C();
    v370(v114, v366);
    v116 = *(_QWORD *)(v115 + 16);
    if (!v116)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_129;
    }
    v378 = v115;
    ++v379;
    v117 = v115 + v377;
    swift_bridgeObjectRetain();
    while ((sub_219557CA0() & 1) == 0)
    {
      if ((sub_219557CAC() & 1) != 0)
      {
        sub_219550E3C();
        if ((v125 & 1) != 0)
          goto LABEL_67;
        goto LABEL_57;
      }
      if ((sub_219557C7C() & 1) != 0)
      {
        sub_219551724();
        if ((v126 & 1) != 0)
          goto LABEL_67;
        goto LABEL_57;
      }
      if ((sub_219557C94() & 1) != 0)
      {
        sub_219551D10();
        if ((v127 & 1) != 0)
          goto LABEL_67;
        goto LABEL_57;
      }
      v128 = sub_219557CD0();
      v129 = v350;
      if ((v128 & 1) != 0)
      {
        if ((sub_219557CD0() & 1) == 0)
          goto LABEL_56;
        v130 = v327;
        sub_219557CB8();
        v131 = sub_219557F04();
        v132 = *(void (**)(char *, uint64_t))(v344 + 8);
        v133 = v346;
        v132(v130, v346);
        sub_219557CB8();
        v134 = sub_219557F04();
        v135 = v133;
        v136 = v132;
        v132(v130, v135);
        if ((v131 & 1) == 0)
          goto LABEL_41;
        v113 = v380;
        if ((v134 & 1) == 0)
          goto LABEL_56;
        v137 = v317;
        sub_219557CB8();
        v138 = v316;
        sub_219557EF8();
        v136(v137, v346);
        v123 = v372;
        v139 = sub_219557FF4();
        if (v123)
        {
          (*(void (**)(unint64_t, uint64_t))(v386 + 8))(v138, v387);
          v372 = 0;
          sub_219558294();
          v112 = v381;
          if (qword_253F22160 != -1)
            goto LABEL_66;
          goto LABEL_38;
        }
        v367 = v139;
        v149 = v387;
        v357 = *(void (**)(unint64_t, uint64_t))(v386 + 8);
        v357(v138, v387);
        v170 = v136;
        v171 = v312;
        sub_219557CB8();
        v172 = v311;
        sub_219557EF8();
        v173 = v172;
        v170(v171, v346);
        sub_219557FF4();
        goto LABEL_65;
      }
      if ((sub_219557CDC() & 1) != 0)
      {
        if ((sub_219557CDC() & 1) == 0)
          goto LABEL_56;
        v140 = v321;
        sub_219557CC4();
        v141 = sub_219557F28();
        v142 = *(void (**)(unint64_t, uint64_t))(v334 + 8);
        v143 = v335;
        v142(v140, v335);
        sub_219557CC4();
        v134 = sub_219557F28();
        v144 = v143;
        v145 = (void (*)(char *, uint64_t))v142;
        v142(v140, v144);
        if ((v141 & 1) == 0)
        {
LABEL_41:
          v113 = v380;
          v112 = v381;
          if ((v134 & 1) == 0)
            goto LABEL_67;
          goto LABEL_57;
        }
        v113 = v380;
        if ((v134 & 1) == 0)
          goto LABEL_56;
        v146 = v314;
        sub_219557CC4();
        v147 = v313;
        sub_219557F1C();
        v145(v146, v335);
        v123 = v372;
        v148 = sub_219557FF4();
        if (v123)
        {
          (*(void (**)(char *, uint64_t))(v386 + 8))(v147, v387);
          v372 = 0;
          v112 = v381;
          sub_219558294();
          if (qword_253F22160 == -1)
            goto LABEL_38;
LABEL_66:
          swift_once();
LABEL_38:
          v152 = (id)qword_253F221A8;
          sub_219558138();

          v109 = v371;
          goto LABEL_57;
        }
        v367 = v148;
        v149 = v387;
        v357 = *(void (**)(unint64_t, uint64_t))(v386 + 8);
        v357((unint64_t)v147, v387);
        v174 = v145;
        v175 = v306;
        sub_219557CC4();
        v176 = v305;
        sub_219557F1C();
        v173 = v176;
        v174(v175, v335);
        sub_219557FF4();
LABEL_65:
        v372 = 0;
        v158 = v173;
LABEL_43:
        v357((unint64_t)v158, v149);
        sub_2195500B0();
        v160 = v159;
        swift_release();
        swift_release();
        v109 = v371;
        v113 = v380;
        v112 = v381;
        if ((v160 & 1) != 0)
          goto LABEL_67;
        goto LABEL_57;
      }
      v153 = sub_219557CA0();
      v154 = *(void (**)(char *, unint64_t, uint64_t))(v358 + 16);
      v155 = v328;
      v154(v328, v117, v129);
      if ((v153 & 1) != 0)
      {
        v156 = v155;
        v157 = 0;
      }
      else
      {
        v161 = sub_219557CAC();
        v156 = v155;
        v157 = v161 ^ 1;
      }
      v162 = *(void (**)(char *, uint64_t))(v358 + 8);
      v163 = v350;
      v162(v156, v350);
      v164 = v337;
      v154(v337, v117, v163);
      if ((v157 & 1) == 0)
      {
        v162(v164, v163);
        v166 = v325;
        v154(v325, v117, v163);
LABEL_53:
        v162(v166, v163);
        v167 = v326;
        v154(v326, v117, v163);
        v109 = v371;
LABEL_54:
        v162(v167, v163);
        v168 = v338;
        v154((char *)v338, v117, v163);
LABEL_55:
        v162((char *)v168, v163);
LABEL_56:
        v112 = v381;
        goto LABEL_57;
      }
      v165 = sub_219557C7C();
      v162(v164, v163);
      v166 = v325;
      v154(v325, v117, v163);
      if ((v165 & 1) != 0)
        goto LABEL_53;
      LODWORD(v367) = sub_219557C94();
      v162(v166, v163);
      v167 = v326;
      v154(v326, v117, v163);
      v109 = v371;
      if ((v367 & 1) != 0)
        goto LABEL_54;
      LODWORD(v367) = sub_219557CD0();
      v162(v167, v163);
      v168 = v338;
      v154((char *)v338, v117, v163);
      if ((v367 & 1) != 0)
        goto LABEL_55;
      v169 = sub_219557CDC();
      v162((char *)v168, v163);
      v112 = v381;
      if ((v169 & 1) == 0)
      {
LABEL_67:
        swift_bridgeObjectRelease_n();
        v177 = v359;
        v7 = v383;
        if (v379 == (char *)v368)
        {
          swift_bridgeObjectRelease_n();
          v178 = v361;
          v79 = v366;
          goto LABEL_133;
        }
        goto LABEL_5;
      }
LABEL_57:
      v117 += v112;
      if (!--v116)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_127;
      }
    }
    if ((sub_219557CA0() & 1) == 0)
      goto LABEL_57;
    sub_219557D00();
    v118 = sub_219557B8C();
    v119 = *(void (**)(char *, uint64_t))(v382 + 8);
    v120 = v384;
    v119(v78, v384);
    sub_219557D00();
    v121 = sub_219557B8C();
    v119(v78, v120);
    if ((v118 & 1) == 0)
    {
      v112 = v381;
      if ((v121 & 1) == 0)
        goto LABEL_67;
      goto LABEL_57;
    }
    if ((v121 & 1) == 0)
      goto LABEL_56;
    v122 = v374;
    sub_219557D00();
    sub_219557B80();
    v119((char *)v122, v384);
    v123 = v372;
    v124 = sub_219557FF4();
    if (v123)
    {
      (*(void (**)(char *, uint64_t))(v386 + 8))(v113, v387);
      v372 = 0;
      sub_219558294();
      v112 = v381;
      if (qword_253F22160 != -1)
        goto LABEL_66;
      goto LABEL_38;
    }
    v367 = v124;
    v149 = v387;
    v357 = *(void (**)(unint64_t, uint64_t))(v386 + 8);
    v357((unint64_t)v113, v387);
    v150 = v342;
    sub_219557D00();
    v151 = v360;
    sub_219557B80();
    v119(v150, v384);
    sub_219557FF4();
    v372 = 0;
    v158 = v151;
    goto LABEL_43;
  }
  sub_219557658();
  v179 = sub_21955758C();
  v370 = *(void (**)(char *, uint64_t))(v80 + 8);
  v370(v99, v79);
  v326 = *(char **)(v179 + 16);
  if (v326)
  {
    v328 = (char *)((*(unsigned __int8 *)(v358 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v358 + 80));
    v327 = &v328[v179];
    v381 = *(_QWORD *)(v358 + 72);
    v325 = (char *)v179;
    swift_bridgeObjectRetain();
    v360 = 0;
    v374 = (unint64_t)"Turn context was not matched";
    v373 = (char *)0x800000021955AC90;
    v338 = (unint64_t)"SystemInformed[entities=";
    v337 = (char *)0x8000000219559AE0;
    v321 = (unint64_t)"SystemReportedSuccess[task=";
    v317 = (char *)0x8000000219559AA0;
    v316 = (unint64_t)"Other SDA string: %s";
    v314 = (char *)0x8000000219559A80;
    v345 = v19;
    while (1)
    {
      v180 = v348;
      sub_219557658();
      v181 = sub_21955758C();
      v370(v180, v79);
      v182 = *(_QWORD *)(v181 + 16);
      if (!v182)
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_128;
      }
      v183 = &v327[v381 * (_QWORD)v360++];
      v184 = &v328[v181];
      v342 = (char *)v181;
      swift_bridgeObjectRetain();
      v185 = v379;
      v380 = v183;
      while (1)
      {
        if ((sub_219557CA0() & 1) != 0)
        {
          sub_219557D00();
          if ((sub_219557B8C() & 1) != 0)
          {
            v186 = v385;
            sub_219557B80();
            sub_21953B3EC();
            (*(void (**)(char *, uint64_t))(v386 + 8))(v186, v387);
          }
          v388 = 0;
          v389 = 0xE000000000000000;
          sub_21955833C();
          swift_bridgeObjectRelease();
          v388 = 0xD000000000000016;
          v389 = (unint64_t)v373;
          sub_2195581BC();
          swift_bridgeObjectRelease();
          sub_2195581BC();
          v188 = v388;
          v190 = v389;
          (*(void (**)(char *, uint64_t))(v382 + 8))(v185, v384);
          v7 = v383;
        }
        else if ((sub_219557CAC() & 1) != 0)
        {
          v187 = v376;
          sub_219557C88();
          v188 = sub_21954F6F4();
          v190 = v189;
          (*(void (**)(char *, uint64_t))(v377 + 8))(v187, v378);
        }
        else if ((sub_219557C7C() & 1) != 0)
        {
          sub_219557CE8();
          if ((sub_2195577C0() & 1) != 0)
          {
            v191 = v351;
            sub_2195577CC();
            sub_21953AF84();
            (*(void (**)(char *, uint64_t))(v352 + 8))(v191, v353);
          }
          v388 = 0;
          v389 = 0xE000000000000000;
          sub_21955833C();
          swift_bridgeObjectRelease();
          v388 = 0xD000000000000016;
          v389 = v338 | 0x8000000000000000;
          sub_2195581BC();
          swift_bridgeObjectRelease();
          sub_2195581BC();
          v188 = v388;
          v190 = v389;
          (*(void (**)(char *, uint64_t))(v367 + 8))(v19, v368);
        }
        else if ((sub_219557C94() & 1) != 0)
        {
          v192 = v354;
          sub_219557CF4();
          v188 = sub_21954FB28();
          v190 = v193;
          (*(void (**)(char *, uint64_t))(v355 + 8))(v192, v356);
        }
        else if ((sub_219557CD0() & 1) != 0)
        {
          v205 = v332;
          sub_219557CB8();
          if ((sub_219557F04() & 1) != 0)
          {
            v206 = v385;
            sub_219557EF8();
            sub_21953B3EC();
            (*(void (**)(char *, uint64_t))(v386 + 8))(v206, v387);
          }
          v388 = 0;
          v389 = 0xE000000000000000;
          sub_21955833C();
          swift_bridgeObjectRelease();
          v388 = 0xD00000000000001BLL;
          v389 = v321 | 0x8000000000000000;
          sub_2195581BC();
          swift_bridgeObjectRelease();
          sub_2195581BC();
          v188 = v388;
          v190 = v389;
          (*(void (**)(char *, uint64_t))(v344 + 8))(v205, v346);
        }
        else if ((sub_219557CDC() & 1) != 0)
        {
          v211 = v323;
          sub_219557CC4();
          if ((sub_219557F28() & 1) != 0)
          {
            v212 = v385;
            sub_219557F1C();
            sub_21953B3EC();
            (*(void (**)(char *, uint64_t))(v386 + 8))(v212, v387);
          }
          v388 = 0;
          v389 = 0xE000000000000000;
          sub_21955833C();
          swift_bridgeObjectRelease();
          v388 = 0xD00000000000001BLL;
          v389 = v316 | 0x8000000000000000;
          sub_2195581BC();
          swift_bridgeObjectRelease();
          sub_2195581BC();
          v188 = v388;
          v190 = v389;
          (*(void (**)(char *, uint64_t))(v334 + 8))(v211, v335);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v358 + 16))(v331, v183, v350);
          v188 = sub_21955818C();
          v190 = v217;
        }
        if ((sub_219557CA0() & 1) != 0)
        {
          v194 = v19;
          v195 = v375;
          sub_219557D00();
          if ((sub_219557B8C() & 1) != 0)
          {
            v196 = v385;
            sub_219557B80();
            sub_21953B3EC();
            (*(void (**)(char *, uint64_t))(v386 + 8))(v196, v387);
          }
          v388 = 0;
          v389 = 0xE000000000000000;
          sub_21955833C();
          swift_bridgeObjectRelease();
          v388 = 0xD000000000000016;
          v389 = v374 | 0x8000000000000000;
          sub_2195581BC();
          swift_bridgeObjectRelease();
          sub_2195581BC();
          v198 = v388;
          v200 = v389;
          (*(void (**)(char *, uint64_t))(v382 + 8))(v195, v384);
          v7 = v383;
          v19 = v194;
          v185 = v379;
        }
        else
        {
          if ((sub_219557CAC() & 1) != 0)
          {
            v197 = v376;
            sub_219557C88();
            v198 = sub_21954F6F4();
            v200 = v199;
            (*(void (**)(char *, uint64_t))(v377 + 8))(v197, v378);
            goto LABEL_101;
          }
          if ((sub_219557C7C() & 1) != 0)
          {
            v201 = (char *)v357;
            sub_219557CE8();
            if ((sub_2195577C0() & 1) != 0)
            {
              v202 = v351;
              sub_2195577CC();
              sub_21953AF84();
              (*(void (**)(char *, uint64_t))(v352 + 8))(v202, v353);
            }
            v388 = 0;
            v389 = 0xE000000000000000;
            sub_21955833C();
            swift_bridgeObjectRelease();
            v388 = 0xD000000000000016;
            v389 = (unint64_t)v337;
            sub_2195581BC();
            swift_bridgeObjectRelease();
            sub_2195581BC();
            v198 = v388;
            v200 = v389;
            (*(void (**)(char *, uint64_t))(v367 + 8))(v201, v368);
LABEL_100:
            v7 = v383;
            v19 = v345;
            goto LABEL_101;
          }
          if ((sub_219557C94() & 1) != 0)
          {
            v203 = v354;
            sub_219557CF4();
            v198 = sub_21954FB28();
            v200 = v204;
            (*(void (**)(char *, uint64_t))(v355 + 8))(v203, v356);
            goto LABEL_101;
          }
          if ((sub_219557CD0() & 1) != 0)
          {
            v209 = v333;
            sub_219557CB8();
            if ((sub_219557F04() & 1) != 0)
            {
              v210 = v385;
              sub_219557EF8();
              sub_21953B3EC();
              (*(void (**)(char *, uint64_t))(v386 + 8))(v210, v387);
            }
            v388 = 0;
            v389 = 0xE000000000000000;
            sub_21955833C();
            swift_bridgeObjectRelease();
            v388 = 0xD00000000000001BLL;
            v389 = (unint64_t)v317;
            sub_2195581BC();
            swift_bridgeObjectRelease();
            sub_2195581BC();
            v198 = v388;
            v200 = v389;
            (*(void (**)(char *, uint64_t))(v344 + 8))(v209, v346);
            goto LABEL_100;
          }
          if ((sub_219557CDC() & 1) != 0)
          {
            v213 = v324;
            sub_219557CC4();
            if ((sub_219557F28() & 1) != 0)
            {
              v214 = v385;
              sub_219557F1C();
              sub_21953B3EC();
              v215 = v214;
              v216 = v213;
              (*(void (**)(char *, uint64_t))(v386 + 8))(v215, v387);
            }
            else
            {
              v216 = v213;
            }
            v388 = 0;
            v389 = 0xE000000000000000;
            sub_21955833C();
            swift_bridgeObjectRelease();
            v388 = 0xD00000000000001BLL;
            v389 = (unint64_t)v314;
            sub_2195581BC();
            swift_bridgeObjectRelease();
            sub_2195581BC();
            v198 = v388;
            v200 = v389;
            (*(void (**)(char *, uint64_t))(v334 + 8))(v216, v335);
            v7 = v383;
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v358 + 16))(v331, v184, v350);
            v198 = sub_21955818C();
            v200 = v218;
          }
        }
LABEL_101:
        v207 = v188 == v198 && v190 == v200;
        if (v207)
          break;
        v208 = sub_219558438();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v208 & 1) != 0)
          goto LABEL_125;
        v183 = v380;
        v184 += v381;
        if (!--v182)
        {
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
LABEL_128:
          (*(void (**)(char *, uint64_t))(v340 + 8))(v339, v341);
          goto LABEL_129;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_125:
      swift_bridgeObjectRelease_n();
      v178 = v361;
      v79 = v366;
      if (v360 == v326)
      {
        swift_bridgeObjectRelease_n();
        v109 = v371;
        goto LABEL_132;
      }
    }
  }
  swift_bridgeObjectRelease();
  v178 = v361;
LABEL_132:
  (*(void (**)(char *, uint64_t))(v340 + 8))(v339, v341);
  v177 = v359;
LABEL_133:
  v220 = v336;
  sub_219557658();
  v221 = sub_219557568();
  v370(v220, v79);
  v379 = *(char **)(v221 + 16);
  if (v379)
  {
    v222 = *(_QWORD *)(sub_219557460() - 8);
    v381 = (*(unsigned __int8 *)(v222 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v222 + 80);
    v380 = (char *)(v221 + v381);
    v223 = *(_QWORD *)(v222 + 72);
    v378 = v221;
    swift_bridgeObjectRetain();
    v384 = 0;
    do
    {
      v224 = v343;
      sub_219557658();
      v225 = sub_219557568();
      v370(v224, v79);
      v219 = *(void (**)(char *, uint64_t))(v225 + 16);
      if (!v219)
      {
LABEL_196:
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        return v219 & 1;
      }
      ++v384;
      v226 = v225 + v381;
      v382 = v225;
      swift_bridgeObjectRetain();
      while (1)
      {
        if ((sub_219557448() & 1) != 0)
        {
          v227 = v385;
          sub_219557454();
          sub_21953B3EC();
          (*(void (**)(char *, uint64_t))(v386 + 8))(v227, v387);
        }
        v388 = 0x7361745B6B736154;
        v389 = 0xEA00000000003D6BLL;
        sub_2195581BC();
        swift_bridgeObjectRelease();
        sub_2195581BC();
        v229 = v388;
        v228 = v389;
        if ((sub_219557448() & 1) != 0)
        {
          v230 = v385;
          sub_219557454();
          sub_21953B3EC();
          (*(void (**)(char *, uint64_t))(v386 + 8))(v230, v387);
        }
        v388 = 0x7361745B6B736154;
        v389 = 0xEA00000000003D6BLL;
        sub_2195581BC();
        swift_bridgeObjectRelease();
        sub_2195581BC();
        if (v229 == v388 && v228 == v389)
          break;
        v232 = sub_219558438();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v232 & 1) != 0)
          goto LABEL_149;
        v226 += v223;
        v219 = (void (*)(char *, uint64_t))((char *)v219 - 1);
        if (!v219)
        {
LABEL_170:
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          return v219 & 1;
        }
      }
      swift_bridgeObjectRelease_n();
LABEL_149:
      swift_bridgeObjectRelease_n();
      v7 = v383;
      v177 = v359;
      v109 = v371;
      v178 = v361;
      v79 = v366;
    }
    while ((char *)v384 != v379);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v233 = v329;
  sub_219557658();
  v234 = sub_219557574();
  v370(v233, v79);
  v379 = *(char **)(v234 + 16);
  if (v379)
  {
    v235 = *(_QWORD *)(sub_219557460() - 8);
    v381 = (*(unsigned __int8 *)(v235 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v235 + 80);
    v380 = (char *)(v234 + v381);
    v236 = *(_QWORD *)(v235 + 72);
    v378 = v234;
    swift_bridgeObjectRetain();
    v384 = 0;
    do
    {
      v237 = v330;
      sub_219557658();
      v238 = sub_219557574();
      v370(v237, v79);
      v219 = *(void (**)(char *, uint64_t))(v238 + 16);
      if (!v219)
        goto LABEL_196;
      ++v384;
      v239 = v238 + v381;
      v382 = v238;
      swift_bridgeObjectRetain();
      while (1)
      {
        if ((sub_219557448() & 1) != 0)
        {
          v240 = v385;
          sub_219557454();
          sub_21953B3EC();
          (*(void (**)(char *, uint64_t))(v386 + 8))(v240, v387);
        }
        v388 = 0x7361745B6B736154;
        v389 = 0xEA00000000003D6BLL;
        sub_2195581BC();
        swift_bridgeObjectRelease();
        sub_2195581BC();
        v242 = v388;
        v241 = v389;
        if ((sub_219557448() & 1) != 0)
        {
          v243 = v385;
          sub_219557454();
          sub_21953B3EC();
          (*(void (**)(char *, uint64_t))(v386 + 8))(v243, v387);
        }
        v388 = 0x7361745B6B736154;
        v389 = 0xEA00000000003D6BLL;
        sub_2195581BC();
        swift_bridgeObjectRelease();
        sub_2195581BC();
        if (v242 == v388 && v241 == v389)
          break;
        v245 = sub_219558438();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v245 & 1) != 0)
          goto LABEL_168;
        v239 += v236;
        v219 = (void (*)(char *, uint64_t))((char *)v219 - 1);
        if (!v219)
          goto LABEL_170;
      }
      swift_bridgeObjectRelease_n();
LABEL_168:
      swift_bridgeObjectRelease_n();
      v7 = v383;
      v177 = v359;
      v109 = v371;
      v178 = v361;
      v79 = v366;
    }
    while ((char *)v384 != v379);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v247 = v320;
  sub_219557658();
  v248 = sub_219557580();
  v249 = v247;
  v250 = v366;
  v251 = v370;
  v370(v249, v366);
  v252 = *(_QWORD *)(v248 + 16);
  swift_bridgeObjectRelease();
  if (v252)
  {
    v253 = v319;
    sub_219557658();
    v254 = sub_219557580();
    v251(v253, v250);
    v255 = *(_QWORD *)(v254 + 16);
    if (v255)
    {
      v388 = MEMORY[0x24BEE4AF8];
      sub_21952E9C0(0, v255, 0);
      v256 = *(unsigned __int8 *)(v349 + 80);
      v385 = (char *)v254;
      v257 = v254 + ((v256 + 32) & ~v256);
      v258 = *(_QWORD *)(v349 + 72);
      v259 = *(void (**)(char *, uint64_t, uint64_t))(v349 + 16);
      while (1)
      {
        v259(v363, v257, v364);
        sub_219557BD4();
        v260 = v372;
        sub_219557FF4();
        if (!v260)
          break;

        v372 = 0;
        v261 = 0xD000000000000019;
        v262 = 0x8000000219559B60;
LABEL_188:
        (*(void (**)(char *, uint64_t))(v386 + 8))(v362, v387);
        (*(void (**)(char *, uint64_t))(v349 + 8))(v363, v364);
        v268 = v388;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21952E9C0(0, *(_QWORD *)(v268 + 16) + 1, 1);
          v268 = v388;
        }
        v270 = *(_QWORD *)(v268 + 16);
        v269 = *(_QWORD *)(v268 + 24);
        if (v270 >= v269 >> 1)
        {
          sub_21952E9C0(v269 > 1, v270 + 1, 1);
          v268 = v388;
        }
        *(_QWORD *)(v268 + 16) = v270 + 1;
        v271 = v268 + 16 * v270;
        *(_QWORD *)(v271 + 32) = v261;
        *(_QWORD *)(v271 + 40) = v262;
        v257 += v258;
        --v255;
        v109 = v371;
        if (!v255)
        {
          swift_bridgeObjectRelease();
          v177 = v359;
          v7 = v383;
          goto LABEL_199;
        }
      }
      v372 = 0;
      v263 = swift_retain();
      v264 = MEMORY[0x219A2E3D0](v263);
      if (v264 >> 62)
      {
        result = sub_2195583B4();
        if (result)
          goto LABEL_180;
      }
      else
      {
        result = *(_QWORD *)((v264 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (result)
        {
LABEL_180:
          if ((v264 & 0xC000000000000001) != 0)
          {
            MEMORY[0x219A2E70C](0, v264);
          }
          else
          {
            if (!*(_QWORD *)((v264 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_229:
              __break(1u);
              return result;
            }
            swift_retain();
          }
          swift_release();
          swift_bridgeObjectRelease();
          v261 = sub_2195580A8();
          v262 = v265;
          swift_release();
LABEL_187:
          swift_release();
          goto LABEL_188;
        }
      }
      swift_bridgeObjectRelease();
      v266 = sub_219558024();
      swift_release();
      if (!v266)
      {
        swift_release();
        v261 = 0x69746E65206F6E5BLL;
        v262 = 0xEB000000005D7974;
        goto LABEL_188;
      }
      v261 = sub_21955809C();
      v262 = v267;
      swift_release();
      goto LABEL_187;
    }
    swift_bridgeObjectRelease();
    v268 = MEMORY[0x24BEE4AF8];
LABEL_199:
    v272 = sub_21954F970(v268);
    v273 = v318;
    sub_219557658();
    v274 = sub_219557580();
    v370(v273, v366);
    v275 = *(_QWORD *)(v274 + 16);
    if (v275)
    {
      v276 = v274 + ((*(unsigned __int8 *)(v349 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v349 + 80));
      v277 = *(_QWORD *)(v349 + 72);
      swift_bridgeObjectRetain();
      while (1)
      {
        sub_219557BD4();
        v278 = v372;
        sub_219557FF4();
        if (v278)
        {

          v372 = 0;
          v279 = 0xD000000000000019;
          v280 = 0x8000000219559B60;
          goto LABEL_214;
        }
        v372 = 0;
        v281 = swift_retain();
        v282 = MEMORY[0x219A2E3D0](v281);
        if (v282 >> 62)
        {
          result = sub_2195583B4();
          if (result)
          {
LABEL_205:
            if ((v282 & 0xC000000000000001) != 0)
            {
              MEMORY[0x219A2E70C](0, v282);
            }
            else
            {
              if (!*(_QWORD *)((v282 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_229;
              swift_retain();
            }
            swift_release();
            swift_bridgeObjectRelease();
            v283 = sub_2195580A8();
            goto LABEL_212;
          }
        }
        else
        {
          result = *(_QWORD *)((v282 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (result)
            goto LABEL_205;
        }
        swift_bridgeObjectRelease();
        v285 = sub_219558024();
        swift_release();
        if (!v285)
        {
          swift_release();
          v279 = 0x69746E65206F6E5BLL;
          v280 = 0xEB000000005D7974;
          goto LABEL_213;
        }
        v283 = sub_21955809C();
LABEL_212:
        v279 = v283;
        v280 = v284;
        swift_release();
        swift_release();
LABEL_213:
        v109 = v371;
LABEL_214:
        (*(void (**)(char *, uint64_t))(v386 + 8))(v347, v387);
        v286 = sub_219552104(v279, v280, v272);
        swift_bridgeObjectRelease();
        v7 = v383;
        if ((v286 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_127:
          swift_bridgeObjectRelease_n();
LABEL_129:
          LOBYTE(v219) = 0;
          return v219 & 1;
        }
        v276 += v277;
        if (!--v275)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v177 = v359;
          goto LABEL_222;
        }
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_222:
    v178 = v361;
  }
  v287 = v365;
  v288 = sub_21955764C();
  v289 = *(void (**)(char *, uint64_t, uint64_t))(v178 + 16);
  v290 = v322;
  v289(v177, v369, v322);
  v289(v109, v287, v290);
  if ((v288 & 1) != 0)
  {
    v291 = sub_21955764C();
    v292 = v322;
    v293 = v291;
    v294 = v315;
    v289(v315, (uint64_t)v109, v322);
    v289(v7, (uint64_t)v177, v292);
    if ((v293 & 1) == 0)
    {
      v303 = *(void (**)(char *, uint64_t))(v178 + 8);
      v303(v7, v292);
      v303(v294, v292);
      v303(v109, v292);
      v303(v177, v292);
      goto LABEL_129;
    }
    v295 = v7;
    v296 = v307;
    v297 = v292;
    sub_219557670();
    v298 = (uint64_t)v308;
    sub_219557670();
    LOBYTE(v219) = sub_219537814(v298);
    v299 = *(void (**)(uint64_t, uint64_t))(v309 + 8);
    v300 = v298;
    v301 = v310;
    v299(v300, v310);
    v299((uint64_t)v296, v301);
    v302 = *(void (**)(char *, uint64_t))(v178 + 8);
    v302(v295, v297);
    v302(v294, v297);
    v302(v109, v297);
    v302(v177, v297);
  }
  else
  {
    v219 = *(void (**)(char *, uint64_t))(v178 + 8);
    v219(v109, v290);
    v219(v177, v290);
    LOBYTE(v219) = 1;
  }
  return v219 & 1;
}

uint64_t sub_219537814(uint64_t a1)
{
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char v36;
  void (*v37)(char *, uint64_t, uint64_t);
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  char v48;
  char *v49;
  char *v50;
  int v51;
  int v52;
  char *v53;
  char *v54;
  char *v55;
  char *v56;
  int v57;
  int v58;
  char v59;
  char *v60;
  char v61;
  char v62;
  unsigned __int8 v63;
  char v64;
  char *v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  _BOOL8 v70;
  void (*v71)(char *, uint64_t);
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v2 = v1;
  v88 = a1;
  v3 = sub_219557BF8();
  v77 = *(_QWORD *)(v3 - 8);
  v78 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v76 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v75 = (char *)&v73 - v6;
  v7 = sub_219557C70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v82 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v84 = (char *)&v73 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v81 = (char *)&v73 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v87 = (char *)&v73 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v80 = (char *)&v73 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v86 = (char *)&v73 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v85 = (char *)&v73 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v83 = (char *)&v73 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v73 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v73 - v29;
  v31 = MEMORY[0x24BDAC7A8](v28);
  v33 = (char *)&v73 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v73 - v34;
  v36 = sub_219557C58();
  v37 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v37(v35, v88, v7);
  v37(v33, v1, v7);
  if ((v36 & 1) != 0)
  {
    v74 = v8;
    v38 = sub_219557C58();
    v37(v30, (uint64_t)v33, v7);
    v37(v27, (uint64_t)v35, v7);
    if ((v38 & 1) != 0)
    {
      v39 = sub_219557C34();
      v41 = v40;
      if (v39 == sub_219557C34() && v41 == v42)
        v44 = 1;
      else
        v44 = sub_219558438();
      v79 = v44;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v79 = 0;
    }
    v45 = *(void (**)(char *, uint64_t))(v74 + 8);
    v45(v27, v7);
    v45(v30, v7);
  }
  else
  {
    v45 = *(void (**)(char *, uint64_t))(v8 + 8);
    v79 = 1;
  }
  v46 = v88;
  v47 = v80;
  v45(v33, v7);
  v45(v35, v7);
  v48 = sub_219557C1C();
  v49 = v83;
  v37(v83, v1, v7);
  v50 = v85;
  v37(v85, v46, v7);
  if ((v48 & 1) != 0)
  {
    v51 = sub_219557C04();
    v52 = sub_219557C04();
    v50 = v85;
    LODWORD(v88) = v51 ^ v52;
  }
  else
  {
    LODWORD(v88) = 0;
  }
  v53 = v49;
  v55 = v81;
  v54 = v82;
  v45(v50, v7);
  v45(v53, v7);
  LOBYTE(v53) = sub_219557C28();
  v56 = v86;
  v37(v86, v2, v7);
  v37(v47, v46, v7);
  if ((v53 & 1) != 0)
  {
    v57 = sub_219557C10();
    v58 = sub_219557C10();
    v56 = v86;
    LODWORD(v85) = v57 ^ v58;
  }
  else
  {
    LODWORD(v85) = 0;
  }
  v45(v47, v7);
  v45(v56, v7);
  v59 = sub_219557C64();
  v60 = v87;
  v37(v87, v2, v7);
  v37(v55, v46, v7);
  if ((v59 & 1) != 0)
  {
    v61 = sub_219557C4C();
    v62 = sub_219557C4C();
    v60 = v87;
    v63 = v61 ^ v62;
  }
  else
  {
    v63 = 0;
  }
  v45(v55, v7);
  v45(v60, v7);
  v64 = sub_219557BEC();
  v65 = v84;
  v37(v84, v2, v7);
  v37(v54, v46, v7);
  if ((v64 & 1) != 0)
  {
    v66 = v75;
    v67 = v65;
    sub_219557C40();
    v68 = v76;
    sub_219557C40();
    sub_219553A74(&qword_25508CF90, (uint64_t (*)(uint64_t))MEMORY[0x24BE9CBF8], MEMORY[0x24BE9CC00]);
    v69 = v78;
    sub_21955824C();
    sub_21955824C();
    v70 = v90 == v89;
    v71 = *(void (**)(char *, uint64_t))(v77 + 8);
    v71(v68, v69);
    v71(v66, v69);
    v45(v54, v7);
    v45(v67, v7);
    if (!(v88 & 1 | ((v79 & 1) == 0) | (v85 | v63) & 1))
      return v70;
  }
  else
  {
    v45(v54, v7);
    v45(v65, v7);
    if (!(v88 & 1 | ((v79 & 1) == 0) | (v85 | v63) & 1))
      return 1;
  }
  return 0;
}

_QWORD *initializeWithCopy for OverrideMatchResult(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _OWORD *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  a1[6] = a2[6];
  v9 = (int *)type metadata accessor for SiriNLOverride();
  v10 = v9[9];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2195573AC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
  }
  *((_BYTE *)a1 + v9[10]) = *((_BYTE *)a2 + v9[10]);
  v15 = v9[11];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v9[12];
  v20 = (char *)a1 + v19;
  v21 = (_OWORD *)((char *)a2 + v19);
  v22 = *(_QWORD *)((char *)a2 + v19 + 8);
  swift_bridgeObjectRetain();
  if (v22 >> 60 == 15)
  {
    *(_OWORD *)v20 = *v21;
  }
  else
  {
    v23 = *(_QWORD *)v21;
    sub_21952E944(v23, v22);
    *(_QWORD *)v20 = v23;
    *((_QWORD *)v20 + 1) = v22;
  }
  *(_DWORD *)((char *)a1 + v9[13]) = *(_DWORD *)((char *)a2 + v9[13]);
  v24 = v9[14];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = *((_QWORD *)v26 + 1);
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)v25 = *(_OWORD *)v26;
  }
  else
  {
    v28 = *(_QWORD *)v26;
    sub_21952E944(*(_QWORD *)v26, *((_QWORD *)v26 + 1));
    *(_QWORD *)v25 = v28;
    *((_QWORD *)v25 + 1) = v27;
  }
  v29 = v9[15];
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = sub_219557FDC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
  {
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v30, v31, v32);
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
  }
  v34 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v34) = *(_QWORD *)((char *)a2 + v34);
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for OverrideMatchResult(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = (int *)type metadata accessor for SiriNLOverride();
  v3 = a1 + v2[9];
  v4 = sub_2195573AC();
  if (!__swift_getEnumTagSinglePayload(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (uint64_t *)(a1 + v2[12]);
  v6 = v5[1];
  if (v6 >> 60 != 15)
    sub_21952EE5C(*v5, v6);
  v7 = (uint64_t *)(a1 + v2[14]);
  v8 = v7[1];
  if (v8 >> 60 != 15)
    sub_21952EE5C(*v7, v8);
  v9 = a1 + v2[15];
  v10 = sub_219557FDC();
  if (!__swift_getEnumTagSinglePayload(v9, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void OverrideResult.init(matches:turnInputAndPreprocessing:)()
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
  uint64_t (*v14)(uint64_t);
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
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t (*v32)(uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  void *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t);
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t matched;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[3];
  uint64_t v96;

  OUTLINED_FUNCTION_62();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = type metadata accessor for OverrideResult(0);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_22_4();
  v9 = sub_219557604();
  v88 = *(_QWORD *)(v9 - 8);
  v89 = v9;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v10);
  v87 = (char *)&v79 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t (*)(uint64_t))((char *)&v79 - v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22038);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_9_0();
  v85 = v17 - v16;
  matched = type metadata accessor for OverrideMatchResultAndParse(0);
  v18 = *(_QWORD *)(matched - 8);
  MEMORY[0x24BDAC7A8](matched);
  OUTLINED_FUNCTION_3();
  v86 = v19;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_19_0();
  v90 = v21;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_19_0();
  v93 = v23;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_19_0();
  v84 = v25;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v79 - v27;
  v95[2] = v2;
  v29 = sub_21953052C((void (*)(_QWORD))sub_21953B804, (uint64_t)v95, v4);
  swift_bridgeObjectRelease();
  v30 = *(_QWORD *)(v29 + 16);
  if (v30)
  {
    v79 = v14;
    v80 = v0;
    v81 = v2;
    v82 = v7;
    v83 = v6;
    v96 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    v31 = 0;
    v32 = type metadata accessor for OverrideMatchResultAndParse;
    v33 = matched;
    v92 = v29;
    while (v31 < *(_QWORD *)(v29 + 16))
    {
      OUTLINED_FUNCTION_32_0();
      v34 = *(_QWORD *)(v18 + 72);
      v94 = v35;
      sub_2195330CC(v29 + v35 + v34 * v31, (uint64_t)v28, type metadata accessor for OverrideMatchResultAndParse);
      if ((sub_2195575C8() & 1) != 0)
      {
        sub_21953DC64((uint64_t)v28, type metadata accessor for OverrideMatchResultAndParse);
      }
      else
      {
        sub_2195330A0((uint64_t)v28, v93, type metadata accessor for OverrideMatchResultAndParse);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_25_3();
          sub_21952E988();
        }
        v36 = v96;
        v37 = *(_QWORD *)(v96 + 16);
        if (v37 >= *(_QWORD *)(v96 + 24) >> 1)
        {
          sub_21952E988();
          v36 = v96;
        }
        *(_QWORD *)(v36 + 16) = v37 + 1;
        sub_2195330A0(v93, v36 + v94 + v37 * v34, type metadata accessor for OverrideMatchResultAndParse);
        v33 = matched;
        v29 = v92;
      }
      if (v30 == ++v31)
      {
        OUTLINED_FUNCTION_50_0();
        v38 = v85;
        sub_21954C0F0(v96, type metadata accessor for OverrideMatchResultAndParse, (uint64_t (*)(uint64_t))sub_21954DB00, (uint64_t)sub_219546488, (void (*)(uint64_t))sub_21954A30C);
        OUTLINED_FUNCTION_28_1();
        v39 = OUTLINED_FUNCTION_41_0();
        if (__swift_getEnumTagSinglePayload(v39, v40, v33) == 1)
        {
          sub_21954A56C(v38, &qword_253F22038);
          swift_bridgeObjectRetain();
          v41 = v29 + v94;
          v42 = MEMORY[0x24BEE4AF8];
          v43 = (uint64_t)v87;
          v44 = v90;
          do
          {
            sub_2195330CC(v41, v44, type metadata accessor for OverrideMatchResultAndParse);
            v45 = (uint64_t *)(v44 + *(int *)(type metadata accessor for SiriNLOverride() + 44));
            v46 = *v45;
            v47 = v45[1];
            swift_bridgeObjectRetain();
            sub_21953DC64(v44, type metadata accessor for OverrideMatchResultAndParse);
            if (v47)
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                v52 = OUTLINED_FUNCTION_25_3();
                sub_219546804(v52, v53, v54, (char *)v42);
                v42 = v55;
              }
              v49 = *(_QWORD *)(v42 + 16);
              v48 = *(_QWORD *)(v42 + 24);
              if (v49 >= v48 >> 1)
              {
                sub_219546804(v48 > 1, v49 + 1, 1, (char *)v42);
                v42 = v56;
              }
              *(_QWORD *)(v42 + 16) = v49 + 1;
              v50 = v42 + 16 * v49;
              *(_QWORD *)(v50 + 32) = v46;
              *(_QWORD *)(v50 + 40) = v47;
              v43 = (uint64_t)v87;
            }
            v51 = v92;
            v41 += v34;
            --v30;
          }
          while (v30);
          OUTLINED_FUNCTION_50_0();
          if (*(_QWORD *)(v42 + 16))
          {
            sub_2195582A0();
            if (qword_253F22160 != -1)
              swift_once();
            v64 = (void *)qword_253F221A8;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
            v65 = OUTLINED_FUNCTION_30_0();
            *(_OWORD *)(v65 + 16) = xmmword_219558D80;
            v96 = v42;
            v66 = v64;
            __swift_instantiateConcreteTypeFromMangledName(&qword_253F22100);
            sub_21953B5E0();
            v67 = sub_21955815C();
            v69 = v68;
            OUTLINED_FUNCTION_10();
            *(_QWORD *)(v65 + 56) = MEMORY[0x24BEE0D00];
            *(_QWORD *)(v65 + 64) = sub_21952E30C();
            *(_QWORD *)(v65 + 32) = v67;
            *(_QWORD *)(v65 + 40) = v69;
            sub_219558138();

            swift_bridgeObjectRelease();
            v43 = (uint64_t)v87;
          }
          else
          {
            OUTLINED_FUNCTION_10();
          }
          v70 = *(_QWORD *)(v51 + 16);
          v71 = MEMORY[0x24BEE4AF8];
          v72 = v88;
          if (v70)
          {
            v96 = MEMORY[0x24BEE4AF8];
            sub_21952E9F8();
            v73 = v51 + v94;
            do
            {
              v74 = v86;
              sub_2195330CC(v73, v86, type metadata accessor for OverrideMatchResultAndParse);
              OUTLINED_FUNCTION_38_2(v43, v74 + *(int *)(v33 + 20), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 16));
              sub_21953DC64(v74, type metadata accessor for OverrideMatchResultAndParse);
              v71 = v96;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                OUTLINED_FUNCTION_25_3();
                sub_21952E9F8();
                v71 = v96;
              }
              v75 = *(_QWORD *)(v71 + 16);
              if (v75 >= *(_QWORD *)(v71 + 24) >> 1)
              {
                sub_21952E9F8();
                v71 = v96;
              }
              *(_QWORD *)(v71 + 16) = v75 + 1;
              v72 = v88;
              OUTLINED_FUNCTION_32_0();
              OUTLINED_FUNCTION_38_2(v71 + v76 + *(_QWORD *)(v72 + 72) * v75, v43, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 32));
              v96 = v71;
              v73 += v34;
              --v70;
            }
            while (v70);
          }
          v77 = OUTLINED_FUNCTION_0_3();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 8))(v81, v77);
          OUTLINED_FUNCTION_50_0();
          v78 = (uint64_t)v80;
          *v80 = v71;
          swift_storeEnumTagMultiPayload();
          sub_2195330A0(v78, v83, type metadata accessor for OverrideResult);
          goto LABEL_41;
        }
        OUTLINED_FUNCTION_50_0();
        v29 = v84;
        sub_2195330A0(v38, v84, type metadata accessor for OverrideMatchResultAndParse);
        v58 = (uint64_t *)(v29 + *(int *)(type metadata accessor for SiriNLOverride() + 44));
        v31 = v58[1];
        v32 = v79;
        if (v31)
        {
          v18 = *v58;
          swift_bridgeObjectRetain();
          sub_219558294();
          if (qword_253F22160 == -1)
            goto LABEL_25;
          goto LABEL_43;
        }
        goto LABEL_26;
      }
    }
    __break(1u);
LABEL_43:
    swift_once();
LABEL_25:
    v59 = (void *)qword_253F221A8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
    v60 = OUTLINED_FUNCTION_30_0();
    *(_OWORD *)(v60 + 16) = xmmword_219558D80;
    *(_QWORD *)(v60 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v60 + 64) = sub_21952E30C();
    *(_QWORD *)(v60 + 32) = v18;
    *(_QWORD *)(v60 + 40) = v31;
    v61 = v59;
    sub_219558138();

    swift_bridgeObjectRelease();
LABEL_26:
    v62 = v88;
    OUTLINED_FUNCTION_38_2((uint64_t)v32, v29 + *(int *)(matched + 20), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v88 + 16));
    sub_2195575BC();
    sub_21953DC64(v29, type metadata accessor for OverrideMatchResultAndParse);
    v63 = OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_19_4(v63);
    OUTLINED_FUNCTION_38_2(v83, (uint64_t)v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 32));
    goto LABEL_27;
  }
  OUTLINED_FUNCTION_50_0();
  v57 = OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_19_4(v57);
LABEL_27:
  swift_storeEnumTagMultiPayload();
LABEL_41:
  OUTLINED_FUNCTION_1_0();
}

uint64_t type metadata accessor for OverrideMatchResultAndParse(uint64_t a1)
{
  return sub_2195313E0(a1, (uint64_t *)&unk_253F22028);
}

uint64_t sub_219538978()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for OverrideMatchResult(319);
  if (v1 <= 0x3F)
  {
    result = sub_219557604();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

_QWORD *initializeWithCopy for OverrideResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
    }
    v7 = sub_219557604();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t destroy for OverrideResult(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
    return swift_bridgeObjectRelease();
  if (!(_DWORD)result)
  {
    v3 = sub_219557604();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

uint64_t sub_219538B30()
{
  return static NSRegularExpression.resetCache()();
}

uint64_t static NSRegularExpression.resetCache()()
{
  if (qword_253F22610 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_5();
  os_unfair_lock_lock((os_unfair_lock_t)&dword_253F21E20);
  swift_endAccess();
  if (qword_253F225F8 != -1)
    swift_once();
  swift_beginAccess();
  qword_253F225E8 = MEMORY[0x24BEE4B00];
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_5();
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_253F21E20);
  return swift_endAccess();
}

void static RegexOverrideCache.reset()()
{
  os_unfair_lock_s *v0;

  if (qword_253F22088 != -1)
    swift_once();
  v0 = (os_unfair_lock_s *)(qword_253F22078 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_253F22078 + 16));
  sub_219538CAC();
  os_unfair_lock_unlock(v0);
}

uint64_t sub_219538CAC()
{
  if (qword_253F220A0 != -1)
    swift_once();
  swift_beginAccess();
  off_253F22090 = (_UNKNOWN *)MEMORY[0x24BEE4B00];
  return swift_bridgeObjectRelease();
}

_QWORD *sub_219538D2C@<X0>(uint64_t a1@<X0>, _QWORD *(*a2)(uint64_t *__return_ptr)@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  _QWORD *result;

  result = sub_219541E5C(a1, a2, a3);
  if (!v4)
    *a4 = result;
  return result;
}

_QWORD *sub_219538D54(uint64_t a1, _QWORD *(*a2)(uint64_t *__return_ptr), uint64_t a3)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;

  result = OUTLINED_FUNCTION_5_1(a1, a2, a3);
  if (!v3)
    return (_QWORD *)v5;
  return result;
}

uint64_t *marisa::scoped_array<marisa::scoped_array<char>>::~scoped_array(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  if (*a1)
  {
    v5 = *(_QWORD *)(v2 - 8);
    v4 = v2 - 8;
    v3 = v5;
    if (v5)
    {
      v6 = 8 * v3;
      do
      {
        v7 = *(_QWORD *)(v4 + v6);
        if (v7)
          MEMORY[0x219A2E9D0](v7, 0x1000C8077774924);
        v6 -= 8;
      }
      while (v6);
    }
    MEMORY[0x219A2E9D0](v4 - 8, 0x10C80436913F5);
  }
  return a1;
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.loadOverrideTrieBundle(filePath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

id sub_219538EE8()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_219558174();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_init_, v1);

  return v2;
}

void sub_2195396F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.preheat(locale:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t sub_219539760()
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
  char *v16;
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
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, unint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  _QWORD v50[3];
  char *v51;
  char *v52;
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
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  OUTLINED_FUNCTION_62();
  v77 = v2;
  v78 = v3;
  v4 = sub_219557AA8();
  v66 = *(_QWORD *)(v4 - 8);
  v67 = v4;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_2();
  v65 = v6;
  OUTLINED_FUNCTION_38();
  v7 = sub_219557B2C();
  v63 = *(_QWORD *)(v7 - 8);
  v64 = v7;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_18_2();
  v68 = sub_219557B5C();
  v70 = *(_QWORD *)(v68 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_4_2();
  v71 = v10;
  OUTLINED_FUNCTION_38();
  sub_219558114();
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_4_2();
  v50[2] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
  OUTLINED_FUNCTION_0_9();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v52 = (char *)v50 - v17;
  OUTLINED_FUNCTION_38();
  v18 = sub_219557FDC();
  v60 = *(_QWORD *)(v18 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_3();
  v53 = v20;
  MEMORY[0x24BDAC7A8](v21);
  v61 = (uint64_t)v50 - v22;
  OUTLINED_FUNCTION_38();
  v23 = type metadata accessor for SiriNLOverride();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_4_2();
  v56 = v25;
  OUTLINED_FUNCTION_38();
  v26 = sub_219557D84();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_6_6();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v27 + 104))(v1, *MEMORY[0x24BE9CE18], v26);
  sub_2195495E4();
  v29 = v28;
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v1, v26);
  v59 = *(_QWORD *)(v29 + 16);
  if (v59)
  {
    v58 = v29 + ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80));
    v57 = *(_QWORD *)(v24 + 72);
    OUTLINED_FUNCTION_26_1((uint64_t)&v75);
    v30 = 0;
    v31 = v68;
    v32 = v71;
    v33 = (uint64_t)v52;
    v55 = v23;
    v34 = v56;
    v51 = v16;
    v54 = v18;
    while (1)
    {
      sub_21952EC38(v58 + v57 * v30, v34, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
      sub_219549FC0(v34 + *(int *)(v23 + 60), (uint64_t)v16);
      OUTLINED_FUNCTION_39_1((uint64_t)v16, 1, v18);
      if (!v35)
        break;
      sub_21952F3F8((uint64_t)v16, &qword_253F21E18);
      if (*(_QWORD *)(v34 + *(int *)(v23 + 56) + 8) >> 60 != 15)
      {
        v62 = v30;
        v74 = 0;
        v72 = 0u;
        v73 = 0u;
        OUTLINED_FUNCTION_23_1();
        OUTLINED_FUNCTION_23_1();
        sub_219558108();
        sub_21954A008();
        sub_219558120();
        OUTLINED_FUNCTION_22_2();
        OUTLINED_FUNCTION_9_3(v33, 0);
        v32 = v71;
        v23 = v55;
        goto LABEL_8;
      }
      OUTLINED_FUNCTION_9_3(v33, 1);
      sub_21952F3F8(v33, &qword_253F21E18);
      v32 = v71;
LABEL_14:
      ++v30;
      sub_21952ECDC(v34, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
      if (v30 == v59)
        return OUTLINED_FUNCTION_38_1();
    }
    v62 = v30;
    v36 = v53;
    OUTLINED_FUNCTION_27_1(v53, (uint64_t)v16);
    OUTLINED_FUNCTION_27_1(v33, v36);
    OUTLINED_FUNCTION_9_3(v33, 0);
LABEL_8:
    OUTLINED_FUNCTION_27_1(v61, v33);
    v37 = sub_219557A0C();
    v38 = *(_QWORD *)(v37 + 16);
    if (v38)
    {
      v69 = sub_219532C2C(0, &qword_253F22058);
      v39 = v70;
      v40 = v37 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
      OUTLINED_FUNCTION_26_1((uint64_t)&v76);
      v41 = *(_QWORD *)(v39 + 72);
      v42 = *(void (**)(uint64_t, unint64_t, uint64_t))(v39 + 16);
      do
      {
        v42(v32, v40, v31);
        sub_219557B38();
        v43 = sub_219557B20();
        v45 = v44;
        v46 = v0;
        v47 = v65;
        sub_219557AC0();
        v48 = sub_219557A84();
        (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v47, v67);

        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_20_2();
        v0 = v46;
        v32 = v71;
        v31 = v68;
        (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v71, v68);
        v40 += v41;
        --v38;
      }
      while (v38);
      OUTLINED_FUNCTION_38_1();
      v16 = v51;
      v33 = (uint64_t)v52;
      v23 = v55;
    }
    else
    {
      OUTLINED_FUNCTION_3_1();
    }
    v34 = v56;
    v18 = v54;
    OUTLINED_FUNCTION_24_1(v61, *(uint64_t (**)(uint64_t, uint64_t))(v60 + 8));
    v30 = v62;
    goto LABEL_14;
  }
  return OUTLINED_FUNCTION_3_1();
}

void sub_219539F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21953A44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21953A628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void SiriNLOverride.init(inputText:ruleId:locale:namespace:source:overrideId:parse:ruleData:utteranceComparisonType:timeStamp:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, int a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t a13, uint64_t a14, unint64_t a15, int a16)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  sub_219558114();
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_4_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_4_2();
  v31 = v21;
  v22 = (int *)OUTLINED_FUNCTION_18_4();
  v23 = (uint64_t *)(a9 + v22[14]);
  v24 = a9 + v22[15];
  sub_219557FDC();
  OUTLINED_FUNCTION_34_4(v24, 1);
  *(_QWORD *)(a9 + 16) = a1;
  *(_QWORD *)(a9 + 24) = a2;
  *(_QWORD *)a9 = a3;
  *(_QWORD *)(a9 + 8) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_DWORD *)(a9 + 48) = a7;
  *(_DWORD *)(a9 + 52) = a8;
  v25 = a9 + v22[9];
  sub_219557388();
  v26 = sub_2195573AC();
  __swift_storeEnumTagSinglePayload(v25, 0, 1, v26);
  *(_BYTE *)(a9 + v22[10]) = 1;
  v27 = (_QWORD *)(a9 + v22[11]);
  *v27 = a10;
  v27[1] = a11;
  v28 = (uint64_t *)(a9 + v22[12]);
  *v28 = a12;
  v28[1] = a13;
  *(_DWORD *)(a9 + v22[13]) = a16;
  *v23 = a14;
  v23[1] = a15;
  if (a15 >> 60 != 15)
  {
    v29 = OUTLINED_FUNCTION_22_6();
    sub_21953AA54(v29, v30);
    sub_21953AA54(a14, a15);
    sub_21953AA54(a12, a13);
    sub_219558108();
    sub_219553A74((unint64_t *)&qword_253F22250, (uint64_t (*)(uint64_t))MEMORY[0x24BE9DD50], MEMORY[0x24BE9DD10]);
    OUTLINED_FUNCTION_30_3();
    sub_219558120();
    sub_21953AA68(a12, a13);
    OUTLINED_FUNCTION_7_6();
    OUTLINED_FUNCTION_34_4(v31, 0);
    sub_21953AA7C(v31, v24);
  }
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_21953AA54(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21952E944(a1, a2);
  return a1;
}

uint64_t sub_21953AA68(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21952EE5C(a1, a2);
  return a1;
}

uint64_t sub_21953AA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t storeEnumTagSinglePayload for SiriNLOverride()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_21953AAD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_14_4();
  v4(v3);
  OUTLINED_FUNCTION_99();
}

id sub_21953AB0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_219558174();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithPattern_options_error_, v5, a3, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_21955734C();

    swift_willThrow();
  }
  return v6;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SiriNLOverride(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _OWORD *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = a3[9];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    a1[6] = a2[6];
    v13 = sub_2195573AC();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
    }
    v16 = a3[11];
    *((_BYTE *)v4 + a3[10]) = *((_BYTE *)a2 + a3[10]);
    v17 = (_QWORD *)((char *)v4 + v16);
    v18 = (_QWORD *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = a3[12];
    v21 = (char *)v4 + v20;
    v22 = (_OWORD *)((char *)a2 + v20);
    v23 = *(_QWORD *)((char *)a2 + v20 + 8);
    swift_bridgeObjectRetain();
    if (v23 >> 60 == 15)
    {
      *(_OWORD *)v21 = *v22;
    }
    else
    {
      v24 = *(_QWORD *)v22;
      sub_21952E944(v24, v23);
      *(_QWORD *)v21 = v24;
      *((_QWORD *)v21 + 1) = v23;
    }
    v25 = a3[14];
    *(_DWORD *)((char *)v4 + a3[13]) = *(_DWORD *)((char *)a2 + a3[13]);
    v26 = (char *)v4 + v25;
    v27 = (_QWORD *)((char *)a2 + v25);
    v28 = *(_QWORD *)((char *)a2 + v25 + 8);
    if (v28 >> 60 == 15)
    {
      *(_OWORD *)v26 = *(_OWORD *)v27;
    }
    else
    {
      v29 = *v27;
      sub_21952E944(*v27, v28);
      *(_QWORD *)v26 = v29;
      *((_QWORD *)v26 + 1) = v28;
    }
    v30 = a3[15];
    v31 = (char *)v4 + v30;
    v32 = (char *)a2 + v30;
    v33 = sub_219557FDC();
    if (__swift_getEnumTagSinglePayload((uint64_t)v32, 1, v33))
    {
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v31, v32, v33);
      __swift_storeEnumTagSinglePayload((uint64_t)v31, 0, 1, v33);
    }
  }
  return v4;
}

unint64_t SiriNLOverride.description.getter()
{
  sub_21955833C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_4();
  swift_bridgeObjectRetain();
  sub_2195581BC();
  swift_bridgeObjectRelease();
  sub_2195581BC();
  swift_bridgeObjectRetain();
  sub_2195581BC();
  OUTLINED_FUNCTION_10();
  sub_2195581BC();
  return 0xD00000000000001ALL;
}

uint64_t sub_21953AF44(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22168);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21953AF84()
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;

  v1 = sub_219557934();
  v41 = *(_QWORD *)(v1 - 8);
  v42 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v40 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_219557DCC();
  v38 = *(_QWORD *)(v3 - 8);
  v39 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_219557E80();
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_219557D3C();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_219557808();
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v49 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2195576DC();
  v53 = *(_QWORD *)(v11 - 8);
  v54 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v52 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2195576AC();
  v56 = *(_QWORD *)(v13 - 8);
  v57 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v55 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_219557EEC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_21955755C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_219557BC8();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v37 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_219557814() & 1) != 0)
  {
    sub_219557880();
    sub_219557BBC();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
LABEL_7:
    sub_21953B3EC();
    v29 = v28;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    return v29;
  }
  if ((sub_2195578E0() & 1) != 0)
  {
    sub_2195578BC();
    sub_219557EE0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    goto LABEL_7;
  }
  if ((sub_219557820() & 1) != 0)
  {
    v27 = v55;
    sub_2195578F8();
    sub_2195576A0();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v27, v57);
    goto LABEL_7;
  }
  v31 = v22;
  if ((sub_21955782C() & 1) != 0)
  {
    v32 = v52;
    sub_219557910();
    sub_2195576D0();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v32, v54);
  }
  else
  {
    if ((sub_219557850() & 1) != 0)
    {
      v33 = v49;
      sub_219557928();
      sub_2195577FC();
      v35 = v50;
      v34 = v51;
    }
    else if ((sub_2195578A4() & 1) != 0)
    {
      v33 = v46;
      sub_219557844();
      sub_219557D30();
      v35 = v47;
      v34 = v48;
    }
    else if ((sub_2195578D4() & 1) != 0)
    {
      v33 = v43;
      sub_219557898();
      sub_219557E74();
      v35 = v44;
      v34 = v45;
    }
    else
    {
      if ((sub_2195578C8() & 1) == 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v40, v0, v42);
        return sub_21955818C();
      }
      v33 = v37;
      sub_219557868();
      sub_219557DC0();
      v35 = v38;
      v34 = v39;
    }
    (*(void (**)(char *, uint64_t))(v35 + 8))(v33, v34);
  }
  sub_21953B3EC();
  v29 = v36;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v31, v19);
  return v29;
}

void sub_21953B3EC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_75_0();
  if (v0)
  {
    OUTLINED_FUNCTION_30();
    return;
  }
  v1 = MEMORY[0x219A2E3D0]();
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_5;
LABEL_15:
    OUTLINED_FUNCTION_37();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F22100);
    sub_21953B5E0();
    sub_21955815C();
    OUTLINED_FUNCTION_27_4();
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_28_1();
    return;
  }
  v2 = sub_2195583B4();
  if (!v2)
    goto LABEL_15;
LABEL_5:
  v10 = MEMORY[0x24BEE4AF8];
  sub_21952E9C0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x219A2E70C](v3, v1);
      else
        swift_retain();
      v8 = sub_21955809C();
      v9 = v4;
      sub_2195581BC();
      sub_2195580A8();
      sub_2195581BC();
      swift_release();
      swift_bridgeObjectRelease();
      v6 = *(_QWORD *)(v10 + 16);
      v5 = *(_QWORD *)(v10 + 24);
      if (v6 >= v5 >> 1)
        sub_21952E9C0(v5 > 1, v6 + 1, 1);
      ++v3;
      *(_QWORD *)(v10 + 16) = v6 + 1;
      v7 = v10 + 16 * v6;
      *(_QWORD *)(v7 + 32) = v8;
      *(_QWORD *)(v7 + 40) = v9;
    }
    while (v2 != v3);
    goto LABEL_15;
  }
  __break(1u);
}

unint64_t sub_21953B5E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F22108;
  if (!qword_253F22108)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253F22100);
    result = MEMORY[0x219A2EE44](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_253F22108);
  }
  return result;
}

uint64_t sub_21953B624(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t);
  char *v8;
  void (*v9)(char *, uint64_t);
  os_unfair_lock_s *v10;
  uint64_t v12;

  v4 = OUTLINED_FUNCTION_3_2();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1();
  v7(v6, a1);
  v8 = &v6[*(int *)(v4 + 20)];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  v9(v8, a2);
  if (qword_253F22088 != -1)
    swift_once();
  v10 = (os_unfair_lock_s *)(qword_253F22078 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_253F22078 + 16));
  sub_21953B728((uint64_t)v6);
  os_unfair_lock_unlock(v10);
  return sub_21952E68C((uint64_t)v6);
}

uint64_t sub_21953B728(uint64_t a1)
{
  uint64_t v2;

  if (qword_253F220A0 != -1)
    swift_once();
  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  sub_219548460(v2, a1);
  return swift_endAccess();
}

uint64_t sub_21953B7C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21953B804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21953B81C(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_21953B81C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t matched;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF30);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_219557604();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OverrideMatchResult.getPatchedUserParse(turnInputAndPreprocessing:)(a2, (uint64_t)v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_21954A56C((uint64_t)v8, &qword_25508CF30);
    matched = type metadata accessor for OverrideMatchResultAndParse(0);
    v14 = a3;
    v15 = 1;
  }
  else
  {
    v16 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v16(v12, v8, v9);
    sub_2195330CC(a1, a3, type metadata accessor for OverrideMatchResult);
    v17 = type metadata accessor for OverrideMatchResultAndParse(0);
    v16((char *)(a3 + *(int *)(v17 + 20)), v12, v9);
    v14 = a3;
    v15 = 0;
    matched = v17;
  }
  return __swift_storeEnumTagSinglePayload(v14, v15, 1, matched);
}

uint64_t OverrideMatchResult.getPatchedUserParse(turnInputAndPreprocessing:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  id v72;
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
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t EnumTagSinglePayload;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
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
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(char *, char *, uint64_t);
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
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
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t matched;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  _OWORD v145[2];
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;

  v117 = a1;
  v144 = a2;
  v3 = sub_219557640();
  OUTLINED_FUNCTION_56(v3, (uint64_t)v145);
  v119 = v4;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_2();
  v118 = v6;
  OUTLINED_FUNCTION_38();
  v7 = sub_219557AB4();
  OUTLINED_FUNCTION_56(v7, (uint64_t)&v146);
  v122 = v8;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_4_2();
  v121 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_4_2();
  v139 = v12;
  v13 = OUTLINED_FUNCTION_38();
  matched = type metadata accessor for UtteranceRuleMatchResult(v13);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_2();
  v141 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF20);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_4_2();
  v137 = v17;
  v18 = OUTLINED_FUNCTION_38();
  v136 = type metadata accessor for TurnInputRuleMatchResult(v18);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_4_2();
  v142 = v20;
  OUTLINED_FUNCTION_38();
  v21 = sub_2195573C4();
  OUTLINED_FUNCTION_56(v21, (uint64_t)&v149);
  v133 = v22;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_4_2();
  v132 = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF28);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_4_2();
  v134 = v26;
  OUTLINED_FUNCTION_38();
  v135 = sub_21955746C();
  v126 = *(_QWORD *)(v135 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_3();
  v125 = v28;
  MEMORY[0x24BDAC7A8](v29);
  v124 = (uint64_t)&v112 - v30;
  OUTLINED_FUNCTION_38();
  v31 = sub_2195574A8();
  OUTLINED_FUNCTION_56(v31, (uint64_t)&v147);
  v128 = v32;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_4_2();
  v127 = v34;
  OUTLINED_FUNCTION_38();
  v35 = sub_2195574B4();
  v36 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v112 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_2195574E4();
  OUTLINED_FUNCTION_56(v39, (uint64_t)&v148);
  v130 = v40;
  OUTLINED_FUNCTION_5_2();
  v42 = MEMORY[0x24BDAC7A8](v41);
  v44 = (char *)&v112 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v42);
  v46 = (char *)&v112 - v45;
  sub_219558114();
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v47);
  v48 = sub_219557604();
  v49 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_3();
  v116 = v50;
  v52 = MEMORY[0x24BDAC7A8](v51);
  v54 = (char *)&v112 - v53;
  MEMORY[0x24BDAC7A8](v52);
  v143 = (char *)&v112 - v55;
  OUTLINED_FUNCTION_38();
  v56 = *(int *)(type metadata accessor for SiriNLOverride() + 48);
  v138 = v2;
  v57 = (uint64_t *)(v2 + v56);
  v58 = v57[1];
  if (v58 >> 60 != 15)
  {
    v114 = v49;
    v62 = *v57;
    v146 = 0;
    memset(v145, 0, sizeof(v145));
    OUTLINED_FUNCTION_25_2();
    OUTLINED_FUNCTION_25_2();
    sub_219558108();
    sub_21953C598();
    v115 = v62;
    v120 = v58;
    sub_219558120();
    v63 = v114;
    v64 = v143;
    v113 = *(void (**)(char *, char *, uint64_t))(v114 + 32);
    v113(v143, v54, v48);
    v65 = *(_QWORD *)(sub_219557568() + 16);
    swift_bridgeObjectRelease();
    v66 = v48;
    if (v65)
    {
      sub_2195574D8();
      (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v38, *MEMORY[0x24BE9C200], v35);
      sub_2195574CC();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v128 + 104))(v127, *MEMORY[0x24BE9C1D8], v129);
      sub_2195574C0();
      v67 = v130;
      (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v44, v46, v131);
      sub_2195575F8();
      v68 = v132;
      sub_2195573B8();
      v69 = v134;
      sub_219557FE8();
      OUTLINED_FUNCTION_39(v68, *(uint64_t (**)(uint64_t, _QWORD))(v133 + 8));
      v70 = v135;
      v71 = v64;
      if (__swift_getEnumTagSinglePayload(v69, 1, v135) == 1)
      {
        OUTLINED_FUNCTION_29_1(*(uint64_t (**)(uint64_t, uint64_t))(v67 + 8));
        sub_21954A56C(v69, &qword_25508CF28);
      }
      else
      {
        v74 = v126;
        v75 = v67;
        v76 = v124;
        OUTLINED_FUNCTION_12_1(v124, v69, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v126 + 32));
        OUTLINED_FUNCTION_12_1(v125, v76, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 16));
        sub_2195575EC();
        (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v76, v70);
        OUTLINED_FUNCTION_29_1(*(uint64_t (**)(uint64_t, uint64_t))(v75 + 8));
      }
      v78 = v141;
      v77 = v142;
      v79 = v139;
      v80 = matched;
      v82 = v136;
      v81 = v137;
      v83 = type metadata accessor for OverrideMatchResult(0);
      sub_21954A324(*(_QWORD *)(v138 + *(int *)(v83 + 24)), type metadata accessor for TurnInputRuleMatchResult, v81);
      if (__swift_getEnumTagSinglePayload(v81, 1, v82) == 1)
      {
        v84 = &qword_25508CF20;
        v85 = v81;
LABEL_17:
        sub_21954A56C(v85, v84);
        sub_2195582AC();
        v88 = v144;
        if (qword_253F22160 != -1)
          swift_once();
        v89 = (id)qword_253F221A8;
        OUTLINED_FUNCTION_33_0();
        OUTLINED_FUNCTION_31_1();

        sub_21953AA68(v115, v120);
        OUTLINED_FUNCTION_17_1();
        v73 = v88;
        goto LABEL_20;
      }
      sub_21953C5F0(v81, v77, type metadata accessor for TurnInputRuleMatchResult);
      OUTLINED_FUNCTION_24_2(v77 + *(int *)(v82 + 20), v86, &qword_25508CF18);
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v79, 1, v80);
      if ((_DWORD)EnumTagSinglePayload == 1)
      {
        OUTLINED_FUNCTION_9_4(EnumTagSinglePayload, type metadata accessor for TurnInputRuleMatchResult);
        v84 = &qword_25508CF18;
        v85 = v79;
        goto LABEL_17;
      }
      sub_21953C5F0(v79, v78, type metadata accessor for UtteranceRuleMatchResult);
      v92 = v122;
      v93 = v121;
      v94 = v123;
      OUTLINED_FUNCTION_12_1(v121, v78 + *(int *)(v80 + 20), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v122 + 16));
      v95 = (*(uint64_t (**)(uint64_t, uint64_t))(v92 + 88))(v93, v94);
      if (v95 == *MEMORY[0x24BE9C9C8])
      {
        v96 = OUTLINED_FUNCTION_1_10();
        OUTLINED_FUNCTION_11_5(v96, type metadata accessor for UtteranceRuleMatchResult);
        OUTLINED_FUNCTION_9_4(v97, type metadata accessor for TurnInputRuleMatchResult);
        v98 = v144;
        OUTLINED_FUNCTION_34_2();
        v73 = v98;
        v90 = 0;
        goto LABEL_21;
      }
      if (v95 != *MEMORY[0x24BE9C9D0])
      {
        v105 = sub_21953AA68(v115, v120);
        OUTLINED_FUNCTION_11_5(v105, type metadata accessor for UtteranceRuleMatchResult);
        OUTLINED_FUNCTION_9_4(v106, type metadata accessor for TurnInputRuleMatchResult);
        OUTLINED_FUNCTION_17_1();
        __swift_storeEnumTagSinglePayload(v144, 1, 1, v66);
        return OUTLINED_FUNCTION_39(v121, *(uint64_t (**)(uint64_t, _QWORD))(v122 + 8));
      }
      if (*(_QWORD *)(v78 + *(int *)(v80 + 24)))
      {
        swift_bridgeObjectRetain();
        sub_219557F70();
        v99 = v118;
        sub_219557F4C();
        v100 = sub_219543594();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_39(v99, *(uint64_t (**)(uint64_t, _QWORD))(v119 + 8));
        if (v100)
        {
          v101 = v114;
          (*(void (**)(uint64_t, char *, uint64_t))(v114 + 16))(v116, v71, v66);
          sub_2195575E0();
          v102 = OUTLINED_FUNCTION_1_10();
          OUTLINED_FUNCTION_11_5(v102, type metadata accessor for UtteranceRuleMatchResult);
          OUTLINED_FUNCTION_9_4(v103, type metadata accessor for TurnInputRuleMatchResult);
          (*(void (**)(char *, uint64_t))(v101 + 8))(v71, v66);
        }
        else
        {
          v110 = OUTLINED_FUNCTION_1_10();
          OUTLINED_FUNCTION_11_5(v110, type metadata accessor for UtteranceRuleMatchResult);
          OUTLINED_FUNCTION_9_4(v111, type metadata accessor for TurnInputRuleMatchResult);
        }
        v104 = v144;
        OUTLINED_FUNCTION_34_2();
        v73 = v104;
        v90 = 0;
        v91 = v66;
        return __swift_storeEnumTagSinglePayload(v73, v90, 1, v91);
      }
      sub_2195582AC();
      if (qword_253F22160 != -1)
        swift_once();
      v107 = (id)qword_253F221A8;
      OUTLINED_FUNCTION_33_0();
      OUTLINED_FUNCTION_31_1();

      v108 = OUTLINED_FUNCTION_1_10();
      OUTLINED_FUNCTION_11_5(v108, type metadata accessor for UtteranceRuleMatchResult);
      OUTLINED_FUNCTION_9_4(v109, type metadata accessor for TurnInputRuleMatchResult);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v71, v66);
    }
    else
    {
      sub_2195582AC();
      if (qword_253F22160 != -1)
        swift_once();
      v72 = (id)qword_253F221A8;
      OUTLINED_FUNCTION_33_0();
      sub_219558138();

      sub_21953AA68(v115, v120);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v143, v48);
    }
    v73 = v144;
LABEL_20:
    v90 = 1;
LABEL_21:
    v91 = v66;
    return __swift_storeEnumTagSinglePayload(v73, v90, 1, v91);
  }
  v59 = v144;
  sub_2195582AC();
  if (qword_253F22160 != -1)
    swift_once();
  v60 = (id)qword_253F221A8;
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_31_1();

  return __swift_storeEnumTagSinglePayload(v59, 1, 1, v48);
}

unint64_t sub_21953C598()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F220E8;
  if (!qword_253F220E8)
  {
    v1 = sub_219557604();
    result = MEMORY[0x219A2EE44](MEMORY[0x24BE9C3F8], v1);
    atomic_store(result, (unint64_t *)&qword_253F220E8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TurnInputRuleMatchResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for TurnInputRuleMatchResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_21953C5F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = OUTLINED_FUNCTION_19(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  OUTLINED_FUNCTION_99();
}

uint64_t sub_21953C624(uint64_t a1)
{
  uint64_t matched;

  matched = type metadata accessor for TurnInputRuleMatchResult(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(matched - 8) + 8))(a1, matched);
  return a1;
}

void sub_21953C660(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_27_2(a1, a2);
  OUTLINED_FUNCTION_15(v2);
  OUTLINED_FUNCTION_99();
}

uint64_t sub_21953C684()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21953C690()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

_QWORD *sub_21953C69C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _OWORD *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  int *matched;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  a1[6] = a2[6];
  v9 = (int *)type metadata accessor for SiriNLOverride();
  v10 = v9[9];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2195573AC();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
  }
  *((_BYTE *)a1 + v9[10]) = *((_BYTE *)a2 + v9[10]);
  v15 = v9[11];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = v9[12];
  v20 = (char *)a1 + v19;
  v21 = (_OWORD *)((char *)a2 + v19);
  v22 = *(_QWORD *)((char *)a2 + v19 + 8);
  swift_bridgeObjectRetain();
  if (v22 >> 60 == 15)
  {
    *(_OWORD *)v20 = *v21;
  }
  else
  {
    v23 = *(_QWORD *)v21;
    sub_21952E944(v23, v22);
    *(_QWORD *)v20 = v23;
    *((_QWORD *)v20 + 1) = v22;
  }
  *(_DWORD *)((char *)a1 + v9[13]) = *(_DWORD *)((char *)a2 + v9[13]);
  v24 = v9[14];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  v27 = *((_QWORD *)v26 + 1);
  if (v27 >> 60 == 15)
  {
    *(_OWORD *)v25 = *(_OWORD *)v26;
  }
  else
  {
    v28 = *(_QWORD *)v26;
    sub_21952E944(*(_QWORD *)v26, *((_QWORD *)v26 + 1));
    *(_QWORD *)v25 = v28;
    *((_QWORD *)v25 + 1) = v27;
  }
  v29 = v9[15];
  v30 = (char *)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = sub_219557FDC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v31, 1, v32))
  {
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v30, v31, v32);
    __swift_storeEnumTagSinglePayload((uint64_t)v30, 0, 1, v32);
  }
  matched = (int *)type metadata accessor for OverrideMatchResult(0);
  *((_BYTE *)a1 + matched[5]) = *((_BYTE *)a2 + matched[5]);
  *(_QWORD *)((char *)a1 + matched[6]) = *(_QWORD *)((char *)a2 + matched[6]);
  *(_QWORD *)((char *)a1 + matched[7]) = *(_QWORD *)((char *)a2 + matched[7]);
  v35 = *(int *)(a3 + 20);
  v36 = (char *)a1 + v35;
  v37 = (char *)a2 + v35;
  v38 = sub_219557604();
  v39 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v39(v36, v37, v38);
  return a1;
}

void sub_21953C934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  uint64_t (*v3)(_QWORD);
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
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
  void (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t, uint64_t);
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  char *v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
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
  void (*v125)(char *, uint64_t, uint64_t);
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  void (*v133)(uint64_t, uint64_t);
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  BOOL v157;
  unint64_t v158;
  uint64_t *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t v166;
  BOOL v167;
  uint64_t v168;
  char v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  BOOL v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t *v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  unint64_t v191;
  char v192;
  uint64_t v193;
  char v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  unint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  _QWORD *v203;
  unint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  char *v214;
  uint64_t v215;
  char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  char *v230;
  char *v231;
  char *v232;
  char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t *v244;

  OUTLINED_FUNCTION_45_1();
  v226 = v1;
  v3 = v2;
  v4 = v0;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
  OUTLINED_FUNCTION_0_9();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v206 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v206 - v12;
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_19_0();
  v217 = v14;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_19_0();
  v221 = v16;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_19_0();
  v210 = v18;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_23();
  v215 = v20;
  v238 = OUTLINED_FUNCTION_58_0();
  v235 = *(_QWORD *)(v238 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_3();
  v230 = v22;
  OUTLINED_FUNCTION_2_2();
  v24 = MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v206 - v25;
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_19_0();
  v214 = v27;
  OUTLINED_FUNCTION_2_2();
  v29 = MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v206 - v30;
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_19_0();
  v209 = v32;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_23();
  v224 = v34;
  v229 = v3(0);
  v227 = *(_QWORD *)(v229 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_3();
  v220 = v36;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_19_0();
  v240 = v38;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_19_0();
  v211 = v40;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_19_0();
  v243 = v42;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_19_0();
  v228 = v44;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_19_0();
  v223 = v46;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_19_0();
  v213 = v48;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_23();
  v212 = v50;
  v244 = v6;
  v51 = v6[1];
  v52 = sub_219558414();
  if (v52 >= v51)
  {
    if (v51 < 0)
      goto LABEL_161;
    if (v51)
      sub_21953D768();
LABEL_138:
    OUTLINED_FUNCTION_3_0();
    return;
  }
  if (v51 < -1)
    goto LABEL_160;
  v208 = v52;
  v232 = v10;
  if (v51 > 1)
    *(_QWORD *)(sub_219558270() + 16) = v51 / 2;
  OUTLINED_FUNCTION_32_0();
  v207 = v54;
  v225 = v54 + v55;
  v56 = v215;
  if (v51 <= 0)
  {
    v142 = *(_QWORD *)(v53 + 16);
LABEL_126:
    if (v142 >= 2)
    {
      v198 = *v244;
      do
      {
        v199 = v142 - 2;
        if (v142 < 2)
          goto LABEL_154;
        if (!v198)
          goto LABEL_168;
        v200 = v53;
        v201 = *(_QWORD *)(v53 + 32 + 16 * v199);
        v202 = *(_QWORD *)(v53 + 32 + 16 * (v142 - 1) + 8);
        OUTLINED_FUNCTION_26_3();
        if (v0)
          break;
        if (v202 < v201)
          goto LABEL_155;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_21954DAD8(v200);
          v200 = v205;
        }
        if (v199 >= *(_QWORD *)(v200 + 16))
          goto LABEL_156;
        v203 = (_QWORD *)(v200 + 32 + 16 * v199);
        *v203 = v201;
        v203[1] = v202;
        v204 = *(_QWORD *)(v200 + 16);
        if (v142 > v204)
          goto LABEL_157;
        memmove((void *)(v200 + 32 + 16 * (v142 - 1)), (const void *)(v200 + 32 + 16 * v142), 16 * (v204 - v142));
        v53 = v200;
        *(_QWORD *)(v200 + 16) = v204 - 1;
        v142 = v204 - 1;
      }
      while (v204 > 2);
    }
LABEL_137:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v207 + 16) = 0;
    swift_bridgeObjectRelease();
    goto LABEL_138;
  }
  v57 = 0;
  v53 = MEMORY[0x24BEE4AF8];
  v233 = v13;
  v231 = v26;
  v216 = v31;
  v58 = v224;
  v59 = v228;
  while (1)
  {
    v60 = v57;
    v61 = v57 + 1;
    v219 = v53;
    v222 = v57;
    if (v57 + 1 < v51)
    {
      v239 = v51;
      v62 = *v244;
      v63 = *(_QWORD *)(v227 + 72);
      v236 = v57 + 1;
      v64 = v62 + v63 * v61;
      v65 = v212;
      OUTLINED_FUNCTION_27_3(v64, v212);
      v218 = v62;
      v242 = v63;
      v66 = v62 + v63 * v60;
      v67 = v213;
      OUTLINED_FUNCTION_27_3(v66, v213);
      v68 = OUTLINED_FUNCTION_18_4();
      sub_219547394(v65 + *(int *)(v68 + 36), v56);
      v69 = v238;
      OUTLINED_FUNCTION_39_1(v56, 1, v238);
      v70 = v210;
      if (v76)
      {
        sub_21954A56C(v56, (uint64_t *)&unk_253F220D8);
        LODWORD(v241) = 0;
      }
      else
      {
        v71 = v56;
        v72 = v235;
        v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v235 + 32);
        v73(v58, v71, v69);
        OUTLINED_FUNCTION_30_2(v67 + *(int *)(v68 + 36));
        v74 = OUTLINED_FUNCTION_41_0();
        OUTLINED_FUNCTION_39_1(v74, v75, v69);
        if (v76)
        {
          (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v58, v69);
          sub_21954A56C(v70, (uint64_t *)&unk_253F220D8);
          LODWORD(v241) = 0;
        }
        else
        {
          v77 = v209;
          v73(v209, v70, v69);
          LODWORD(v241) = sub_2195573A0() == -1;
          v78 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
          v79 = v77;
          v58 = v224;
          v78(v79, v69);
          v78(v58, v69);
        }
        v59 = v228;
      }
      OUTLINED_FUNCTION_14_3(v213);
      OUTLINED_FUNCTION_14_3(v212);
      v61 = v222 + 2;
      v51 = v239;
      if (v222 + 2 < v239)
      {
        v236 *= v242;
        v237 = v68;
        v80 = v218;
        v234 = v242 * v61;
        while (1)
        {
          v81 = v61;
          v82 = v223;
          OUTLINED_FUNCTION_42_1(v80 + v234, v223);
          OUTLINED_FUNCTION_42_1(v80 + v236, v59);
          v83 = v237;
          v84 = v221;
          OUTLINED_FUNCTION_30_2(v82 + *(int *)(v237 + 36));
          v85 = OUTLINED_FUNCTION_41_0();
          v86 = v238;
          OUTLINED_FUNCTION_39_1(v85, v87, v238);
          if (v76)
          {
            sub_21954A56C(v84, (uint64_t *)&unk_253F220D8);
            v88 = 0;
          }
          else
          {
            v89 = v84;
            v90 = v59;
            v91 = v235;
            v92 = *(void (**)(char *, uint64_t, uint64_t))(v235 + 32);
            v93 = v216;
            v92(v216, v89, v86);
            v94 = v90 + *(int *)(v83 + 36);
            v95 = v217;
            OUTLINED_FUNCTION_29_2(v94);
            OUTLINED_FUNCTION_39_1(v95, 1, v86);
            if (v96)
            {
              (*(void (**)(char *, uint64_t))(v91 + 8))(v93, v86);
              sub_21954A56C(v95, (uint64_t *)&unk_253F220D8);
              v88 = 0;
            }
            else
            {
              v97 = v95;
              v98 = (uint64_t)v214;
              v92(v214, v97, v86);
              v88 = OUTLINED_FUNCTION_53_1() == -1;
              v99 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
              v99(v98, v86);
              v99((uint64_t)v93, v86);
            }
            v59 = v228;
            v51 = v239;
          }
          OUTLINED_FUNCTION_8_6(v59);
          OUTLINED_FUNCTION_8_6(v223);
          if ((_DWORD)v241 != v88)
            break;
          v61 = v81 + 1;
          v80 += v242;
          v59 = v228;
          if (v81 + 1 >= v51)
          {
            v61 = v51;
            v58 = v224;
            goto LABEL_28;
          }
        }
        v58 = v224;
        v61 = v81;
      }
LABEL_28:
      v60 = v222;
      if ((_DWORD)v241)
      {
        if (v61 < v222)
          goto LABEL_162;
        if (v222 < v61)
        {
          v100 = 0;
          v101 = v242 * (v61 - 1);
          v102 = v61 * v242;
          v103 = v222;
          v104 = v222 * v242;
          do
          {
            if (v103 != v61 + v100 - 1)
            {
              v105 = v4;
              v106 = v218;
              if (!v218)
                goto LABEL_167;
              v107 = v218 + v104;
              v241 = v218 + v101;
              OUTLINED_FUNCTION_55_1(v218 + v104, v220);
              if (v104 < v101 || v107 >= v106 + v102)
              {
                v109 = v241;
                OUTLINED_FUNCTION_49_1();
                v4 = v105;
                v110 = v109;
              }
              else
              {
                v4 = v105;
                v110 = v241;
                if (v104 != v101)
                  swift_arrayInitWithTakeBackToFront();
              }
              OUTLINED_FUNCTION_57_0(v220, v110);
              v51 = v239;
            }
            ++v103;
            --v100;
            v101 -= v242;
            v102 -= v242;
            v104 += v242;
          }
          while (v103 < v61 + v100);
          v58 = v224;
          v60 = v222;
        }
      }
    }
    v111 = v211;
    if (v61 < v51)
    {
      if (__OFSUB__(v61, v60))
        goto LABEL_159;
      if (v61 - v60 < v208)
        break;
    }
LABEL_69:
    if (v61 < v60)
      goto LABEL_158;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v239 = v61;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      v53 = v219;
    }
    else
    {
      v192 = OUTLINED_FUNCTION_25_3();
      sub_21954D968(v192, v193, v194, v195);
      v53 = v196;
    }
    v141 = *(_QWORD *)(v53 + 16);
    v140 = *(_QWORD *)(v53 + 24);
    v142 = v141 + 1;
    if (v141 >= v140 >> 1)
    {
      sub_21954D968(v140 > 1, v141 + 1, 1, (char *)v53);
      v53 = v197;
    }
    *(_QWORD *)(v53 + 16) = v142;
    v143 = v53 + 32;
    v144 = (uint64_t *)(v53 + 32 + 16 * v141);
    v145 = v239;
    *v144 = v222;
    v144[1] = v145;
    if (v141)
    {
      v59 = v228;
      while (1)
      {
        v146 = v142 - 1;
        if (v142 >= 4)
        {
          v151 = v143 + 16 * v142;
          v152 = *(_QWORD *)(v151 - 64);
          v153 = *(_QWORD *)(v151 - 56);
          v157 = __OFSUB__(v153, v152);
          v154 = v153 - v152;
          if (v157)
            goto LABEL_143;
          v156 = *(_QWORD *)(v151 - 48);
          v155 = *(_QWORD *)(v151 - 40);
          v157 = __OFSUB__(v155, v156);
          v149 = v155 - v156;
          v150 = v157;
          if (v157)
            goto LABEL_144;
          v158 = v142 - 2;
          v159 = (uint64_t *)(v143 + 16 * (v142 - 2));
          v161 = *v159;
          v160 = v159[1];
          v157 = __OFSUB__(v160, v161);
          v162 = v160 - v161;
          if (v157)
            goto LABEL_145;
          v157 = __OFADD__(v149, v162);
          v163 = v149 + v162;
          if (v157)
            goto LABEL_147;
          if (v163 >= v154)
          {
            v181 = (uint64_t *)(v143 + 16 * v146);
            v183 = *v181;
            v182 = v181[1];
            v157 = __OFSUB__(v182, v183);
            v184 = v182 - v183;
            if (v157)
              goto LABEL_153;
            v174 = v149 < v184;
            goto LABEL_107;
          }
        }
        else
        {
          if (v142 != 3)
          {
            v175 = *(_QWORD *)(v53 + 32);
            v176 = *(_QWORD *)(v53 + 40);
            v157 = __OFSUB__(v176, v175);
            v168 = v176 - v175;
            v169 = v157;
            goto LABEL_101;
          }
          v148 = *(_QWORD *)(v53 + 32);
          v147 = *(_QWORD *)(v53 + 40);
          v157 = __OFSUB__(v147, v148);
          v149 = v147 - v148;
          v150 = v157;
        }
        if ((v150 & 1) != 0)
          goto LABEL_146;
        v158 = v142 - 2;
        v164 = (uint64_t *)(v143 + 16 * (v142 - 2));
        v166 = *v164;
        v165 = v164[1];
        v167 = __OFSUB__(v165, v166);
        v168 = v165 - v166;
        v169 = v167;
        if (v167)
          goto LABEL_148;
        v170 = (uint64_t *)(v143 + 16 * v146);
        v172 = *v170;
        v171 = v170[1];
        v157 = __OFSUB__(v171, v172);
        v173 = v171 - v172;
        if (v157)
          goto LABEL_150;
        if (__OFADD__(v168, v173))
          goto LABEL_152;
        if (v168 + v173 >= v149)
        {
          v174 = v149 < v173;
LABEL_107:
          if (v174)
            v146 = v158;
          goto LABEL_109;
        }
LABEL_101:
        if ((v169 & 1) != 0)
          goto LABEL_149;
        v177 = (uint64_t *)(v143 + 16 * v146);
        v179 = *v177;
        v178 = v177[1];
        v157 = __OFSUB__(v178, v179);
        v180 = v178 - v179;
        if (v157)
          goto LABEL_151;
        if (v180 < v168)
          goto LABEL_118;
LABEL_109:
        v185 = v146 - 1;
        if (v146 - 1 >= v142)
        {
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
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
LABEL_154:
          __break(1u);
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
          goto LABEL_164;
        }
        if (!*v244)
          goto LABEL_166;
        v186 = v53;
        v187 = (uint64_t *)(v143 + 16 * v185);
        v188 = *v187;
        v189 = v143 + 16 * v146;
        v190 = *(_QWORD *)(v189 + 8);
        OUTLINED_FUNCTION_26_3();
        v4 = v0;
        if (v0)
          goto LABEL_137;
        if (v190 < v188)
          goto LABEL_140;
        if (v146 > *(_QWORD *)(v186 + 16))
          goto LABEL_141;
        *v187 = v188;
        *(_QWORD *)(v143 + 16 * v185 + 8) = v190;
        v191 = *(_QWORD *)(v186 + 16);
        if (v146 >= v191)
          goto LABEL_142;
        v142 = v191 - 1;
        memmove((void *)(v143 + 16 * v146), (const void *)(v189 + 16), 16 * (v191 - 1 - v146));
        v53 = v186;
        *(_QWORD *)(v186 + 16) = v191 - 1;
        v174 = v191 > 2;
        v58 = v224;
        v59 = v228;
        if (!v174)
          goto LABEL_118;
      }
    }
    v142 = 1;
    v59 = v228;
LABEL_118:
    v51 = v244[1];
    v57 = v239;
    v56 = v215;
    if (v239 >= v51)
      goto LABEL_126;
  }
  if (__OFADD__(v60, v208))
    goto LABEL_163;
  if (v60 + v208 >= v51)
    v112 = v51;
  else
    v112 = v60 + v208;
  if (v112 >= v60)
  {
    if (v61 == v112)
      goto LABEL_69;
    v206 = v4;
    v113 = *(_QWORD *)(v227 + 72);
    v114 = v113 * (v61 - 1);
    v234 = v113;
    v115 = v61 * v113;
    v218 = v112;
    while (1)
    {
      v116 = 0;
      v239 = v61;
      v236 = v115;
      v237 = v114;
      while (1)
      {
        v117 = *v244;
        v242 = v115 + v116;
        v118 = v115 + v116 + v117;
        v119 = v243;
        OUTLINED_FUNCTION_27_3(v118, v243);
        OUTLINED_FUNCTION_27_3(v114 + v116 + v117, v111);
        v120 = OUTLINED_FUNCTION_18_4();
        v121 = (uint64_t)v233;
        OUTLINED_FUNCTION_29_2(v119 + *(int *)(v120 + 36));
        v122 = v238;
        OUTLINED_FUNCTION_39_1(v121, 1, v238);
        if (v76)
        {
          v138 = v121;
LABEL_64:
          v114 = v237;
          sub_21954A56C(v138, (uint64_t *)&unk_253F220D8);
          OUTLINED_FUNCTION_14_3(v111);
          OUTLINED_FUNCTION_14_3(v243);
          v137 = v239;
          goto LABEL_66;
        }
        v241 = v60;
        v123 = v111;
        v124 = v235;
        v125 = *(void (**)(char *, uint64_t, uint64_t))(v235 + 32);
        v126 = v231;
        v125(v231, v121, v122);
        v127 = v123 + *(int *)(v120 + 36);
        v128 = (uint64_t)v232;
        OUTLINED_FUNCTION_30_2(v127);
        v129 = OUTLINED_FUNCTION_41_0();
        OUTLINED_FUNCTION_39_1(v129, v130, v122);
        if (v76)
        {
          (*(void (**)(char *, uint64_t))(v124 + 8))(v126, v122);
          v138 = v128;
          v111 = v123;
          goto LABEL_64;
        }
        v131 = (uint64_t)v230;
        v125(v230, v128, v122);
        v132 = OUTLINED_FUNCTION_53_1();
        v133 = *(void (**)(uint64_t, uint64_t))(v124 + 8);
        v133(v131, v122);
        v133((uint64_t)v126, v122);
        OUTLINED_FUNCTION_14_3(v123);
        OUTLINED_FUNCTION_14_3(v243);
        v111 = v123;
        if (v132 != -1)
          break;
        v134 = *v244;
        v115 = v236;
        v114 = v237;
        if (!*v244)
          goto LABEL_165;
        v135 = v134 + v237 + v116;
        OUTLINED_FUNCTION_55_1(v134 + v236 + v116, v240);
        v136 = v241;
        OUTLINED_FUNCTION_49_1();
        OUTLINED_FUNCTION_57_0(v240, v135);
        v116 -= v234;
        v60 = v136 + 1;
        v137 = v239;
        if (v239 == v60)
          goto LABEL_67;
      }
      v137 = v239;
      v114 = v237;
LABEL_66:
      v115 = v236;
LABEL_67:
      v61 = v137 + 1;
      v114 += v234;
      v115 += v234;
      v60 = v222;
      if (v61 == v218)
      {
        v61 = v218;
        v4 = v206;
        v58 = v224;
        goto LABEL_69;
      }
    }
  }
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  __break(1u);
}

void sub_21953D768()
{
  uint64_t (*v0)(_QWORD);
  uint64_t (*v1)(_QWORD);
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  _BYTE *v34;
  uint64_t v35;
  void (*v36)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[16];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BYTE *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(_QWORD);

  OUTLINED_FUNCTION_45_1();
  v1 = v0;
  v64 = v2;
  v4 = v3;
  v6 = v5;
  v52 = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3();
  v56 = v9;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v50[-v11];
  v13 = OUTLINED_FUNCTION_58_0();
  v55 = *(_QWORD *)(v13 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3();
  v54 = v15;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v16);
  v18 = &v50[-v17];
  v67 = v1;
  v53 = v1(0);
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_59_0();
  v60 = v19;
  OUTLINED_FUNCTION_2_2();
  v21 = MEMORY[0x24BDAC7A8](v20);
  MEMORY[0x24BDAC7A8](v21);
  v59 = v4;
  v51 = v6;
  if (v4 != v6)
  {
    v25 = &v50[-v23];
    v26 = v18;
    v27 = v24;
    v28 = *(_QWORD *)(v22 + 72);
    v29 = v28 * (v59 - 1);
    v57 = v28;
    v66 = v28 * v59;
    v61 = v12;
    while (2)
    {
      v30 = 0;
      v65 = v52;
      v58 = v29;
      while (1)
      {
        v31 = *v64;
        v63 = v66 + v30;
        OUTLINED_FUNCTION_42_1(v66 + v30 + v31, (uint64_t)v25);
        v62 = v29 + v30;
        OUTLINED_FUNCTION_42_1(v29 + v30 + v31, v27);
        v32 = OUTLINED_FUNCTION_18_4();
        OUTLINED_FUNCTION_29_2((uint64_t)&v25[*(int *)(v32 + 36)]);
        OUTLINED_FUNCTION_39_1((uint64_t)v12, 1, v13);
        if (v33)
        {
          v49 = (uint64_t)v12;
          goto LABEL_12;
        }
        v34 = v12;
        v35 = v55;
        v36 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v55 + 32);
        v36(v26, v34, v13);
        v37 = v27 + *(int *)(v32 + 36);
        v38 = v56;
        sub_219547394(v37, v56);
        OUTLINED_FUNCTION_39_1(v38, 1, v13);
        if (v33)
          break;
        v39 = v25;
        v40 = v27;
        v41 = v26;
        v42 = v13;
        v43 = v54;
        v36(v54, (_BYTE *)v38, v42);
        v44 = sub_2195573A0();
        v45 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
        v46 = v43;
        v13 = v42;
        v26 = v41;
        v27 = v40;
        v25 = v39;
        v29 = v58;
        v45((uint64_t)v46, v13);
        v45((uint64_t)v26, v13);
        OUTLINED_FUNCTION_31_2(v27);
        OUTLINED_FUNCTION_31_2((uint64_t)v25);
        v12 = v61;
        if (v44 == -1)
        {
          v47 = *v64;
          if (!*v64)
          {
            __break(1u);
            return;
          }
          v48 = v47 + v29 + v30;
          OUTLINED_FUNCTION_55_1(v47 + v66 + v30, v60);
          swift_arrayInitWithTakeFrontToBack();
          sub_2195330A0(v60, v48, v67);
          v30 -= v57;
          ++v65;
          v12 = v61;
          if (v59 != v65)
            continue;
        }
        goto LABEL_13;
      }
      (*(void (**)(_BYTE *, uint64_t))(v35 + 8))(v26, v13);
      v49 = v38;
      v12 = v61;
LABEL_12:
      sub_21954A56C(v49, (uint64_t *)&unk_253F220D8);
      OUTLINED_FUNCTION_31_2(v27);
      OUTLINED_FUNCTION_31_2((uint64_t)v25);
LABEL_13:
      v29 += v57;
      v66 += v57;
      if (++v59 != v51)
        continue;
      break;
    }
  }
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_21953DB04(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for SiriNLOverride();
  v5 = a1 + v4[9];
  v6 = sub_2195573AC();
  if (!__swift_getEnumTagSinglePayload(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = (uint64_t *)(a1 + v4[12]);
  v8 = v7[1];
  if (v8 >> 60 != 15)
    sub_21952EE5C(*v7, v8);
  v9 = (uint64_t *)(a1 + v4[14]);
  v10 = v9[1];
  if (v10 >> 60 != 15)
    sub_21952EE5C(*v9, v10);
  v11 = a1 + v4[15];
  v12 = sub_219557FDC();
  if (!__swift_getEnumTagSinglePayload(v11, 1, v12))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  type metadata accessor for OverrideMatchResult(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = a1 + *(int *)(a2 + 20);
  v14 = sub_219557604();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
}

void sub_21953DC64(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_15(v2);
  OUTLINED_FUNCTION_99();
}

void static MatchingSpanUtils.getAdjacentSpanLists(from:usingTokens:)()
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void (*v23)(unint64_t, char *, uint64_t);
  _QWORD *v24;
  void (*v25)(unint64_t, char *, uint64_t);
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v31;
  void (*v32)(char *, uint64_t);
  char v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unsigned int v59;
  int v60;
  unint64_t v61;
  unsigned int v62;
  unsigned int v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  unsigned int v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  char v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  char v93;
  _QWORD *v94;
  char v95;
  uint64_t v96;
  char v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  _QWORD *v104;
  _QWORD *v105;
  uint64_t v106;
  __int128 v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char *v119;
  __int128 v120;
  uint64_t v121;
  void (*v122)(uint64_t, uint64_t);
  uint64_t v123;
  uint64_t v124;
  void (*v125)(unint64_t, char *, uint64_t);
  uint64_t v126;

  OUTLINED_FUNCTION_62();
  v1 = v0;
  v3 = v2;
  v111 = OUTLINED_FUNCTION_15_1();
  v113 = *(_QWORD *)(v111 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_2();
  v110 = v5;
  v6 = OUTLINED_FUNCTION_48_0();
  v116 = *(_QWORD *)(v6 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3();
  v123 = v8;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v99 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v119 = (char *)&v99 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v99 - v17;
  if (!*(_QWORD *)(v3 + 16))
    goto LABEL_61;
  v19 = *(_QWORD *)(v3 + 32);
  v20 = *(_QWORD *)(v19 + 16);
  if (!v20)
    goto LABEL_61;
  v109 = v16;
  v21 = (*(unsigned __int8 *)(v116 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v116 + 80);
  v22 = v19 + v21;
  v23 = *(void (**)(unint64_t, char *, uint64_t))(v116 + 16);
  v124 = *(_QWORD *)(v116 + 72);
  v125 = v23;
  v117 = v19;
  v118 = v21;
  v121 = v1;
  v122 = (void (*)(uint64_t, uint64_t))(v124 + v21);
  swift_bridgeObjectRetain();
  v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v120 = xmmword_219558D80;
  do
  {
    v25 = v125;
    v125((unint64_t)v18, (char *)v22, v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F22648);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = v120;
    v25(v26 + v118, v18, v6);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v33 = OUTLINED_FUNCTION_11_2();
      sub_21954657C(v33, v34, v35, v24);
      v24 = v36;
    }
    v27 = v24;
    v28 = v24[2];
    v29 = v27;
    v30 = v27[3];
    if (v28 >= v30 >> 1)
    {
      sub_21954657C(v30 > 1, v28 + 1, 1, v29);
      v29 = v37;
    }
    v29[2] = v28 + 1;
    v31 = &v29[v28];
    v24 = v29;
    v31[4] = v26;
    v32 = *(void (**)(char *, uint64_t))(v116 + 8);
    v32(v18, v6);
    v22 += v124;
    --v20;
  }
  while (v20);
  v122 = (void (*)(uint64_t, uint64_t))v32;
  swift_bridgeObjectRelease();
  v126 = v3;
  swift_bridgeObjectRetain();
  sub_21953E430(0, 1);
  v38 = v126;
  v39 = *(_QWORD *)(v126 + 16);
  if (!v39)
  {
LABEL_58:
    OUTLINED_FUNCTION_3_1();
LABEL_61:
    OUTLINED_FUNCTION_1_0();
    return;
  }
  v40 = 0;
  v102 = v126 + 32;
  v107 = xmmword_2195590B0;
  v41 = (uint64_t)v119;
  v42 = v122;
  v101 = v126;
  v100 = v39;
  while (1)
  {
    if (v40 >= *(_QWORD *)(v38 + 16))
      goto LABEL_64;
    v106 = v24[2];
    if (v106)
      break;
    OUTLINED_FUNCTION_50_0();
    v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_56:
    if (!v24[2])
    {
LABEL_60:
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_50_0();
      goto LABEL_61;
    }
    if (++v40 == v39)
      goto LABEL_58;
  }
  v103 = v40;
  v43 = *(_QWORD *)(v102 + 8 * v40);
  v105 = v24 + 4;
  v44 = v43 + v118;
  swift_bridgeObjectRetain();
  v45 = 0;
  v46 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v114 = v44;
  v115 = v43;
  v104 = v24;
  while (1)
  {
    if (v45 >= v24[2])
      goto LABEL_63;
    v47 = v105[v45];
    v48 = *(_QWORD *)(v47 + 16);
    if (!v48)
      goto LABEL_53;
    v108 = v45;
    OUTLINED_FUNCTION_5_3(v41, v47 + v118 + (v48 - 1) * v124);
    *(_QWORD *)&v120 = *(_QWORD *)(v43 + 16);
    if ((_QWORD)v120)
      break;
LABEL_52:
    v42(v41, v6);
    v45 = v108;
LABEL_53:
    if (++v45 == v106)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_50_0();
      v24 = v46;
      v38 = v101;
      v39 = v100;
      v40 = v103;
      goto LABEL_56;
    }
  }
  swift_bridgeObjectRetain();
  v117 = v47;
  swift_bridgeObjectRetain();
  v49 = 0;
  while (1)
  {
    if (v49 >= *(_QWORD *)(v43 + 16))
    {
      __break(1u);
      goto LABEL_60;
    }
    OUTLINED_FUNCTION_5_3((uint64_t)v13, v44 + v49 * v124);
    v50 = v121;
    v51 = sub_219557628();
    v52 = OUTLINED_FUNCTION_34_0();
    if (v52 == OUTLINED_FUNCTION_9_2())
      goto LABEL_20;
    v59 = OUTLINED_FUNCTION_34_0();
    if (OUTLINED_FUNCTION_9_2() >= v59)
      break;
    OUTLINED_FUNCTION_4_3();
LABEL_34:
    v42 = v122;
LABEL_49:
    ++v49;
    v42((uint64_t)v13, v6);
    if (v49 == (_QWORD)v120)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v24 = v104;
      goto LABEL_52;
    }
  }
  v60 = OUTLINED_FUNCTION_34_0();
  v61 = *(_QWORD *)(v51 + 16);
  if (v61 == v60)
  {
    OUTLINED_FUNCTION_4_3();
    v41 = v50;
    goto LABEL_34;
  }
  v62 = sub_219557700();
  OUTLINED_FUNCTION_5_3(v109, (uint64_t)v13);
  if (v61 < v62)
  {
    OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_25_0();
    goto LABEL_45;
  }
  v63 = sub_219557724();
  OUTLINED_FUNCTION_25_0();
  if (v61 <= v63)
  {
    OUTLINED_FUNCTION_4_3();
LABEL_45:
    LODWORD(v112) = sub_2195582AC();
    if (qword_253F22160 != -1)
      swift_once();
    v72 = (void *)qword_253F221A8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
    v73 = OUTLINED_FUNCTION_30_0();
    *(_OWORD *)(v73 + 16) = v107;
    v74 = v72;
    v75 = sub_219557610();
    v77 = v76;
    *(_QWORD *)(v73 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v73 + 64) = sub_21952E30C();
    *(_QWORD *)(v73 + 32) = v75;
    *(_QWORD *)(v73 + 40) = v77;
    v41 = (uint64_t)v119;
    v78 = OUTLINED_FUNCTION_34_0();
    v79 = MEMORY[0x24BEE44F0];
    *(_QWORD *)(v73 + 96) = MEMORY[0x24BEE44F0];
    v80 = MEMORY[0x24BEE4558];
    *(_QWORD *)(v73 + 104) = MEMORY[0x24BEE4558];
    *(_DWORD *)(v73 + 72) = v78;
    v81 = OUTLINED_FUNCTION_9_2();
    *(_QWORD *)(v73 + 136) = v79;
    *(_QWORD *)(v73 + 144) = v80;
    *(_DWORD *)(v73 + 112) = v81;
    OUTLINED_FUNCTION_29_0();

    OUTLINED_FUNCTION_42_0();
LABEL_48:
    v42 = v122;
    v44 = v114;
    v43 = v115;
    goto LABEL_49;
  }
  LODWORD(v64) = sub_219557700();
  if (v64 >= OUTLINED_FUNCTION_9_2())
  {
LABEL_20:
    OUTLINED_FUNCTION_4_3();
    v42 = v122;
    v53 = v123;
LABEL_21:
    OUTLINED_FUNCTION_5_3(v53, (uint64_t)v13);
    v54 = v117;
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v82 = OUTLINED_FUNCTION_11_2();
      sub_21954668C(v82, v83, v84, v85, &qword_253F22648, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C640]);
      v54 = v86;
    }
    v56 = *(_QWORD *)(v54 + 16);
    v55 = *(_QWORD *)(v54 + 24);
    if (v56 >= v55 >> 1)
    {
      v87 = OUTLINED_FUNCTION_51_0(v55);
      sub_21954668C(v87, v88, v89, v54, &qword_253F22648, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C640]);
      v54 = v90;
    }
    *(_QWORD *)(v54 + 16) = v56 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v116 + 32))(v54 + v118 + v56 * v124, v123, v6);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v91 = OUTLINED_FUNCTION_11_2();
      sub_21954657C(v91, v92, v93, v46);
      v46 = v94;
    }
    v58 = v46[2];
    v57 = v46[3];
    if (v58 >= v57 >> 1)
    {
      v95 = OUTLINED_FUNCTION_51_0(v57);
      sub_21954657C(v95, v96, v97, v46);
      v46 = v98;
    }
    v46[2] = v58 + 1;
    v46[v58 + 4] = v54;
    v41 = (uint64_t)v119;
    goto LABEL_49;
  }
  v64 = v64;
  OUTLINED_FUNCTION_32_0();
  v112 = v51 + v65;
  while (v64 < *(_QWORD *)(v51 + 16))
  {
    v66 = v113;
    v67 = v110;
    v68 = v111;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v113 + 16))(v110, v112 + *(_QWORD *)(v113 + 72) * v64, v111);
    v69 = sub_219557478();
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v67, v68);
    if ((v69 & 1) != 0)
    {
      OUTLINED_FUNCTION_4_3();
      v41 = (uint64_t)v119;
      goto LABEL_48;
    }
    ++v64;
    v70 = OUTLINED_FUNCTION_9_2();
    v44 = v114;
    v43 = v115;
    if (v64 >= v70)
    {
      v71 = v123;
      swift_bridgeObjectRelease();
      v53 = v71;
      v42 = v122;
      goto LABEL_21;
    }
  }
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
}

uint64_t sub_21953E430(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  BOOL v17;
  uint64_t v18;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = result - a2;
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
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    sub_21954657C(isUniquelyReferenced_nonNull_native, v11, 1, v4);
    v4 = v12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F220F8);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_21;
  v13 = v4[2];
  v14 = v13 - a2;
  if (__OFSUB__(v13, a2))
    goto LABEL_27;
  v15 = (char *)&v4[a2 + 4];
  if (v6 != a2 || &v15[8 * v14] <= (char *)&v4[v6 + 4])
  {
    result = (uint64_t)memmove(&v4[v6 + 4], v15, 8 * v14);
    v13 = v4[2];
  }
  v17 = __OFADD__(v13, v8);
  v18 = v13 - v7;
  if (!v17)
  {
    v4[2] = v18;
LABEL_21:
    *(_QWORD *)v2 = v4;
    return result;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_21953E548(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v6 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v7 = a1 - a2;
  if (__OFSUB__(0, v6))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v8 = v5 - v6;
  if (__OFADD__(v5, v7))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v8 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v8)
      v10 = v5 + v7;
    else
      v10 = v5;
    sub_219546908(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    v4 = v11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC8);
  swift_arrayDestroy();
  if (!v6)
    goto LABEL_16;
  if (__OFSUB__(*(_QWORD *)(v4 + 16), a2))
    goto LABEL_22;
  sub_219546510();
  v12 = *(_QWORD *)(v4 + 16);
  v13 = __OFADD__(v12, v7);
  v14 = v12 - v6;
  if (!v13)
  {
    *(_QWORD *)(v4 + 16) = v14;
LABEL_16:
    *v2 = v4;
    return;
  }
LABEL_23:
  __break(1u);
}

uint64_t sub_21953E668(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s11SpanForNodeVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2195577B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s11SpanForNodeVwxx(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2195577B4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_21953E73C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(char *, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
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
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char v32;
  void (*v33)(char *, uint64_t, uint64_t);
  char v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  char *v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  char *v46;
  uint64_t v47;
  char v48;
  void (*v49)(char *, uint64_t);
  char v50;
  char *v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  char v56;
  char *v57;
  char *v58;
  char *v59;
  int v60;
  char *v61;
  char v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  void (*v72)(char *, unint64_t, uint64_t);
  char *v73;
  char v74;
  uint64_t v76;
  char *v77;
  char *v78;
  void (*v79)(char *, uint64_t);
  char *v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t);
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t, uint64_t);

  v1 = sub_219557D0C();
  v2 = *(void (**)(char *, uint64_t, uint64_t))(v1 - 8);
  v92 = v1;
  v93 = v2;
  MEMORY[0x24BDAC7A8](v1);
  v80 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = sub_219557598();
  v85 = *(_QWORD *)(v91 - 8);
  v4 = MEMORY[0x24BDAC7A8](v91);
  v81 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v84 = (char *)&v76 - v6;
  v7 = sub_219557C70();
  v8 = *(void (**)(char *, uint64_t))(v7 - 8);
  v87 = v7;
  v88 = v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v82 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v83 = (char *)&v76 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v86 = (char *)&v76 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v76 - v15;
  v17 = sub_21955767C();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v90 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v76 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v76 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v76 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v76 - v30;
  v32 = sub_21955764C();
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v89 = v0;
  v33(v31, v0, v17);
  if ((v32 & 1) == 0)
  {
    v43 = *(void (**)(char *, uint64_t))(v18 + 8);
    v43(v31, v17);
    LODWORD(v87) = 0;
    v44 = v92;
    v45 = v93;
    v40 = v89;
    v46 = v90;
    v47 = v91;
    v38 = v17;
    goto LABEL_17;
  }
  v77 = v26;
  v78 = v23;
  sub_219557670();
  v34 = sub_219557C1C();
  v35 = (void (*)(char *, uint64_t))*((_QWORD *)v88 + 1);
  v36 = v16;
  v37 = v87;
  v35(v36, v87);
  v33(v29, (uint64_t)v31, v17);
  v38 = v17;
  if ((v34 & 1) != 0)
  {
    v39 = *(void (**)(char *, uint64_t))(v18 + 8);
    v39(v29, v17);
    v88 = v39;
    v39(v31, v17);
    v40 = v89;
    v41 = v86;
    v42 = v83;
  }
  else
  {
    v41 = v86;
    sub_219557670();
    v48 = sub_219557C28();
    v35(v41, v37);
    v49 = *(void (**)(char *, uint64_t))(v18 + 8);
    v49(v29, v38);
    v88 = v49;
    v49(v31, v38);
    v40 = v89;
    v42 = v83;
    if ((v48 & 1) == 0)
    {
      LODWORD(v87) = 0;
      v44 = v92;
      v45 = v93;
      v46 = v90;
      v47 = v91;
      v43 = v88;
      goto LABEL_17;
    }
  }
  sub_219557670();
  v50 = sub_219557C1C();
  v51 = v42;
  v52 = v87;
  v35(v51, v87);
  v53 = v77;
  v33(v77, v40, v38);
  v54 = v82;
  v79 = v35;
  if ((v50 & 1) != 0)
  {
    sub_219557670();
    LODWORD(v89) = sub_219557C04();
    v35(v41, v52);
  }
  else
  {
    LODWORD(v89) = 0;
  }
  v44 = v92;
  v45 = v93;
  v47 = v91;
  v55 = v53;
  v43 = v88;
  v88(v55, v38);
  sub_219557670();
  v56 = sub_219557C28();
  v79(v54, v52);
  v57 = v78;
  v33(v78, v40, v38);
  if ((v56 & 1) == 0)
  {
    v43(v57, v38);
    if ((v89 & 1) == 0)
    {
      LODWORD(v87) = 0;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  v93 = v33;
  v58 = v57;
  v59 = v86;
  sub_219557670();
  v60 = sub_219557C10();
  v79(v59, v52);
  v61 = v58;
  v33 = v93;
  v43(v61, v38);
  if ((v89 & 1) != 0)
  {
LABEL_13:
    LODWORD(v87) = 1;
    goto LABEL_16;
  }
  LODWORD(v87) = v60;
LABEL_16:
  v46 = v90;
LABEL_17:
  v62 = sub_219557664();
  v33(v46, v40, v38);
  if ((v62 & 1) != 0)
  {
    v88 = v43;
    v63 = v84;
    sub_219557658();
    v64 = sub_21955758C();
    v65 = *(void (**)(char *, uint64_t))(v85 + 8);
    v65(v63, v47);
    v66 = *(_QWORD *)(v64 + 16);
    swift_bridgeObjectRelease();
    v88(v46, v38);
    if (v66)
    {
      v67 = v81;
      sub_219557658();
      v68 = sub_21955758C();
      v65(v67, v47);
      v69 = *(_QWORD *)(v68 + 16);
      if (v69)
      {
        v70 = v68 + ((*((unsigned __int8 *)v45 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v45 + 80));
        v71 = *((_QWORD *)v45 + 9);
        v72 = (void (*)(char *, unint64_t, uint64_t))*((_QWORD *)v45 + 2);
        swift_bridgeObjectRetain();
        v73 = v80;
        while (1)
        {
          v72(v73, v70, v44);
          v74 = sub_219557CA0();
          (*((void (**)(char *, uint64_t))v45 + 1))(v73, v44);
          if ((v74 & 1) != 0)
            break;
          v70 += v71;
          if (!--v69)
          {
            swift_bridgeObjectRelease_n();
            return (v87 & 1) != 0;
          }
        }
        swift_bridgeObjectRelease_n();
        return 1;
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v43(v46, v38);
  }
  return (v87 & 1) != 0;
}

uint64_t sub_21953ED28(uint64_t a1)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  _BYTE *v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v70;
  _BOOL4 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v85;
  int v86;
  int v87;
  _BYTE v88[12];
  _BOOL4 v89;
  _BYTE *v90;
  uint64_t v91;
  _BYTE *v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22168);
  MEMORY[0x24BDAC7A8](v3);
  v90 = &v88[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_2195577B4();
  MEMORY[0x24BDAC7A8](v5);
  v92 = &v88[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_19_0();
  v91 = v8;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_19_0();
  v94 = v10;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_19_0();
  v98 = v12;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_19_0();
  v97 = v14;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_19_0();
  v93 = v16;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_19_0();
  v96 = v18;
  OUTLINED_FUNCTION_2_2();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = &v88[-v21];
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = &v88[-v24];
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = &v88[-v27];
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = &v88[-v30];
  MEMORY[0x24BDAC7A8](v29);
  v33 = &v88[-v32];
  v95 = v1;
  v34 = sub_21955779C();
  v99 = a1;
  OUTLINED_FUNCTION_0_5((uint64_t)v33);
  if ((v34 & 1) != 0)
    v35 = sub_21955779C() ^ 1;
  else
    v35 = 1;
  OUTLINED_FUNCTION_1_6((uint64_t)v33);
  v36 = v99;
  OUTLINED_FUNCTION_0_5((uint64_t)v31);
  if ((v35 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_6((uint64_t)v31);
    OUTLINED_FUNCTION_0_5((uint64_t)v28);
    v37 = v36;
LABEL_11:
    OUTLINED_FUNCTION_1_6((uint64_t)v28);
    OUTLINED_FUNCTION_2_4((uint64_t)v25, v37);
    goto LABEL_12;
  }
  v38 = sub_219557754();
  OUTLINED_FUNCTION_1_6((uint64_t)v31);
  OUTLINED_FUNCTION_0_5((uint64_t)v28);
  v37 = v36;
  if ((v38 & 1) == 0)
    goto LABEL_11;
  v39 = sub_21955773C();
  OUTLINED_FUNCTION_1_6((uint64_t)v28);
  OUTLINED_FUNCTION_2_4((uint64_t)v25, v36);
  if ((v39 & 1) == 0)
  {
LABEL_12:
    OUTLINED_FUNCTION_1_6((uint64_t)v25);
    return 0;
  }
  v40 = *(_QWORD *)(sub_2195576F4() + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_6((uint64_t)v25);
  if (!v40)
    return 0;
  v41 = sub_219557754();
  OUTLINED_FUNCTION_0_5((uint64_t)v22);
  v42 = v96;
  OUTLINED_FUNCTION_2_4(v96, v36);
  if ((v41 & 1) != 0)
  {
    v43 = sub_219557724();
    v44 = sub_219557724();
    v42 = v96;
    v89 = v43 != v44;
  }
  else
  {
    v89 = 0;
  }
  v47 = v91;
  v48 = v94;
  OUTLINED_FUNCTION_1_6(v42);
  OUTLINED_FUNCTION_1_6((uint64_t)v22);
  v49 = sub_21955773C();
  v50 = v93;
  OUTLINED_FUNCTION_0_5(v93);
  v51 = v97;
  OUTLINED_FUNCTION_2_4(v97, v36);
  if ((v49 & 1) != 0)
  {
    v52 = sub_219557700();
    v53 = sub_219557700();
    v51 = v97;
    LODWORD(v96) = v52 != v53;
  }
  else
  {
    LODWORD(v96) = 0;
  }
  v54 = v50;
  v55 = (uint64_t)v92;
  OUTLINED_FUNCTION_1_6(v51);
  OUTLINED_FUNCTION_1_6(v54);
  LOBYTE(v54) = sub_219557790();
  v56 = v98;
  OUTLINED_FUNCTION_0_5(v98);
  OUTLINED_FUNCTION_2_4(v48, v36);
  if ((v54 & 1) != 0)
  {
    v102 = sub_219557760();
    v103 = v57;
    v100 = sub_219557760();
    v101 = v58;
    v59 = sub_21955743C();
    v60 = v90;
    __swift_storeEnumTagSinglePayload((uint64_t)v90, 1, 1, v59);
    sub_21952E2D0();
    v61 = sub_219558300();
    v56 = v98;
    v62 = v61;
    v63 = (uint64_t)v60;
    v48 = v94;
    sub_21953AF44(v63);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    LODWORD(v97) = v62 != 0;
  }
  else
  {
    LODWORD(v97) = 0;
  }
  OUTLINED_FUNCTION_1_6(v48);
  OUTLINED_FUNCTION_1_6(v56);
  v64 = sub_219557748();
  OUTLINED_FUNCTION_0_5(v47);
  OUTLINED_FUNCTION_2_4(v55, v36);
  if ((v64 & 1) != 0)
  {
    v65 = sub_219557718();
    v67 = v66;
    if (v65 != sub_219557718() || v67 != v68)
    {
      v70 = OUTLINED_FUNCTION_6_5();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      LODWORD(v98) = v70 ^ 1;
      goto LABEL_30;
    }
    OUTLINED_FUNCTION_5_6();
  }
  LODWORD(v98) = 0;
LABEL_30:
  v71 = v89;
  OUTLINED_FUNCTION_1_6(v55);
  OUTLINED_FUNCTION_1_6(v47);
  v72 = sub_2195576F4();
  v94 = *(_QWORD *)(v72 + 16);
  if (v94)
  {
    v89 = v71;
    v73 = 0;
    v74 = *(_QWORD *)(sub_2195576E8() - 8);
    v75 = (*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
    v76 = *(_QWORD *)(v74 + 72);
    v92 = (_BYTE *)(v72 + v75);
    v93 = v75;
    while (1)
    {
      v77 = sub_2195576F4();
      v78 = *(_QWORD *)(v77 + 16);
      if (!v78)
        break;
      ++v73;
      v79 = v77 + v75;
      sub_21953F3CC();
      swift_bridgeObjectRetain();
      while ((sub_219558168() & 1) == 0)
      {
        v79 += v76;
        if (!--v78)
        {
          OUTLINED_FUNCTION_37();
          OUTLINED_FUNCTION_5_6();
          goto LABEL_39;
        }
      }
      OUTLINED_FUNCTION_5_6();
      v75 = v93;
      if (v73 == v94)
      {
        OUTLINED_FUNCTION_37();
        v45 = 1;
        goto LABEL_40;
      }
    }
    OUTLINED_FUNCTION_37();
    swift_bridgeObjectRelease();
LABEL_39:
    v45 = 0;
LABEL_40:
    v71 = v89;
  }
  else
  {
    OUTLINED_FUNCTION_37();
    v45 = 1;
  }
  v80 = sub_219557778();
  v82 = v81;
  if (v80 == sub_219557778() && v82 == v83)
  {
    OUTLINED_FUNCTION_5_6();
    v86 = v71 | v96;
    v87 = v97;
  }
  else
  {
    v85 = OUTLINED_FUNCTION_6_5();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v86 = v71 | ~v85;
    v87 = v96 | v97;
  }
  if (((v86 | v87 | v98) & 1) != 0)
    return 0;
  return v45;
}

unint64_t sub_21953F3CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25508CF00;
  if (!qword_25508CF00)
  {
    v1 = sub_2195576E8();
    result = MEMORY[0x219A2EE44](MEMORY[0x24BE9C5B8], v1);
    atomic_store(result, (unint64_t *)&qword_25508CF00);
  }
  return result;
}

void Siri_Nlu_Internal_ComponentOverride.serializedOverrideValue.getter()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_219557DD8();
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_6();
  sub_219557E50();
  OUTLINED_FUNCTION_11();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_7();
  sub_219557E44();
  OUTLINED_FUNCTION_2();
  if ((v0 & 1) != 0)
  {
    v3 = sub_219557E08();
    OUTLINED_FUNCTION_1();
    if ((v3 & 1) != 0)
    {
      sub_2195582AC();
      if (qword_253F22160 != -1)
        swift_once();
      v4 = (void *)qword_253F221A8;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
      v5 = OUTLINED_FUNCTION_8();
      *(_OWORD *)(v5 + 16) = xmmword_219558D80;
      v6 = v4;
      v7 = sub_219557E14();
      v9 = v8;
      *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v5 + 64) = sub_21952E30C();
      *(_QWORD *)(v5 + 32) = v7;
      *(_QWORD *)(v5 + 40) = v9;
      OUTLINED_FUNCTION_5();

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  if ((sub_219557E08() & 1) != 0)
  {
    sub_219557DF0();
  }
  else
  {
    sub_219557E2C();
    sub_21952E588(&qword_253F220F0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9CF40], MEMORY[0x24BE9CF38]);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_0();
}

void sub_21953F5C4()
{
  Siri_Nlu_Internal_ComponentOverride.serializedOverrideValue.getter();
}

uint64_t Siri_Nlu_Internal_ParseOverride.namespace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE9CE18];
  v3 = sub_219557D84();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

void Siri_Nlu_Internal_ParseOverride.serializedOverrideValue.getter()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_219557604();
  OUTLINED_FUNCTION_9();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_6();
  sub_2195579E8();
  OUTLINED_FUNCTION_11();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_7();
  sub_2195579A0();
  OUTLINED_FUNCTION_2();
  if ((v0 & 1) != 0)
  {
    v3 = sub_219557994();
    OUTLINED_FUNCTION_1();
    if ((v3 & 1) != 0)
    {
      sub_2195582AC();
      if (qword_253F22160 != -1)
        swift_once();
      v4 = (void *)qword_253F221A8;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
      v5 = OUTLINED_FUNCTION_8();
      *(_OWORD *)(v5 + 16) = xmmword_219558D80;
      v6 = v4;
      v7 = sub_2195579B8();
      v9 = v8;
      *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v5 + 64) = sub_21952E30C();
      *(_QWORD *)(v5 + 32) = v7;
      *(_QWORD *)(v5 + 40) = v9;
      OUTLINED_FUNCTION_5();

      swift_bridgeObjectRelease();
    }
  }
  else
  {
    OUTLINED_FUNCTION_1();
  }
  if ((sub_219557994() & 1) != 0)
  {
    sub_219557988();
  }
  else
  {
    sub_2195579D0();
    sub_21952E588((unint64_t *)&qword_253F220E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE9C450], MEMORY[0x24BE9C3F8]);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_21953F7CC@<X0>(uint64_t a1@<X8>)
{
  return Siri_Nlu_Internal_ParseOverride.namespace.getter(a1);
}

void sub_21953F7E4()
{
  Siri_Nlu_Internal_ParseOverride.serializedOverrideValue.getter();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.enabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.namespace.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.creationTimestampMsSinceUnixEpoch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.serializedOverrideValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of Siri_Nlu_Internal_Override.nluRequestRules.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t sub_21953F83C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21953FA40();
  *a1 = result;
  return result;
}

uint64_t sub_21953F860@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_21953FC04(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_21953F88C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_21953FA58(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_21953F8B8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_21953FBEC(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_21953F8E4(_QWORD *a1, uint64_t *a2)
{
  return sub_21953FB8C(a1, *a2);
}

uint64_t sub_21953F8EC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_21953FC0C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_21953F91C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_21953FC30(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_21953F94C(uint64_t *a1)
{
  return sub_21953FA60(*a1);
}

uint64_t sub_21953F954(uint64_t *a1)
{
  return sub_21953FA48(*a1);
}

uint64_t sub_21953F95C(uint64_t *a1)
{
  return sub_21953FBD0(*a1);
}

uint64_t sub_21953F964@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_21953FC48(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_21953F990(uint64_t *a1)
{
  uint64_t *v1;

  return sub_21953FBB8(*a1, *v1);
}

BOOL sub_21953F99C(uint64_t *a1)
{
  uint64_t *v1;

  return sub_21953FC50(*a1, *v1);
}

BOOL sub_21953F9A8(uint64_t *a1)
{
  uint64_t *v1;

  return sub_21953FBC4(*a1, *v1);
}

BOOL sub_21953F9B4()
{
  uint64_t *v0;

  return sub_21953FBE0(*v0);
}

uint64_t sub_21953F9BC()
{
  return sub_219558318();
}

uint64_t sub_21953F9D4(uint64_t *a1)
{
  return sub_21953FBF4(*a1);
}

_QWORD *sub_21953F9DC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_21953F9EC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_21953F9F8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

BOOL sub_21953FA04(uint64_t *a1, uint64_t *a2)
{
  return sub_21953FA34(*a1, *a2);
}

uint64_t sub_21953FA10@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_21953FC5C(a1);
  *a2 = result;
  return result;
}

BOOL sub_21953FA34(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_21953FA40()
{
  return 0;
}

uint64_t sub_21953FA48(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_21953FA58(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_21953FA60(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_21953FA98(a1, &qword_253F21E30);
}

void type metadata accessor for Options(uint64_t a1)
{
  sub_21953FA98(a1, &qword_25508CD48);
}

void sub_21953FA98(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_21953FADC()
{
  return sub_21952E588(&qword_25508CD50, (uint64_t (*)(uint64_t))type metadata accessor for Options, (uint64_t)&unk_219558E84);
}

uint64_t sub_21953FB08()
{
  return sub_21952E588(&qword_25508CD58, (uint64_t (*)(uint64_t))type metadata accessor for Options, (uint64_t)&unk_219558E50);
}

uint64_t sub_21953FB34()
{
  return sub_21952E588(&qword_25508CD60, (uint64_t (*)(uint64_t))type metadata accessor for Options, (uint64_t)&unk_219558EB0);
}

uint64_t sub_21953FB60()
{
  return sub_21952E588(&qword_25508CD68, (uint64_t (*)(uint64_t))type metadata accessor for Options, (uint64_t)&unk_219558EEC);
}

BOOL sub_21953FB8C(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

BOOL sub_21953FBB8(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_21953FBC4(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_21953FBD0(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

BOOL sub_21953FBE0(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_21953FBEC(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

uint64_t sub_21953FBF4(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

uint64_t sub_21953FC04(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_21953FC0C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = *v1 & a1;
  if (result)
    *v1 &= ~a1;
  return result;
}

uint64_t sub_21953FC30(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_21953FC48(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_21953FC50(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

uint64_t sub_21953FC5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~v2) == 0)
        v4 = 0;
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t OUTLINED_FUNCTION_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_21955812C();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;

  return v0;
}

void static SiriNLOverride.overrideValuesNilOrEqual(overrideValues:otherValues:)(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;

  if (a1)
  {
    OUTLINED_FUNCTION_13();
    if (v4)
      goto LABEL_26;
    v5 = *(_QWORD *)(v3 + 16);
    while (1)
    {
      v23 = v2;
      v24 = v1;
      if (v1 >> 62)
      {
        OUTLINED_FUNCTION_7_0();
        v6 = sub_2195583B4();
        OUTLINED_FUNCTION_10();
      }
      else
      {
        v6 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      if (v5 != v6)
        break;
      if (v5 < 0)
      {
        __break(1u);
        return;
      }
      if (!v5)
        return;
      v7 = 0;
      v27 = v1 & 0xC000000000000001;
      v28 = v2 & 0xC000000000000001;
      v21 = v1 & 0xFFFFFFFFFFFFFF8;
      v22 = v2 + 32;
      v20 = (char *)(v1 + 32);
      v25 = v5 - 1;
      v26 = v5;
      while (v5 != v7)
      {
        if (v28)
        {
          v8 = MEMORY[0x219A2E70C](v7, v23);
        }
        else
        {
          v8 = *(_QWORD *)(v22 + 8 * v7);
          swift_unknownObjectRetain();
        }
        if (v27)
        {
          v9 = MEMORY[0x219A2E70C](v7, v24);
        }
        else
        {
          if (v7 >= *(_QWORD *)(v21 + 16))
            goto LABEL_25;
          v9 = *(_QWORD *)&v20[8 * v7];
          swift_unknownObjectRetain();
        }
        v10 = objc_allocWithZone(MEMORY[0x24BDD1618]);
        swift_unknownObjectRetain();
        v11 = OUTLINED_FUNCTION_8_0(v10, sel_initRequiringSecureCoding_);
        objc_msgSend(v11, sel_encodeObject_, v8);
        v12 = objc_msgSend(v11, sel_encodedData);
        v13 = sub_219557370();
        v15 = v14;

        v1 = (unint64_t)OUTLINED_FUNCTION_8_0(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_);
        objc_msgSend((id)v1, sel_encodeObject_, v9);
        v16 = objc_msgSend((id)v1, sel_encodedData);
        v2 = sub_219557370();
        v18 = v17;

        LOBYTE(v16) = MEMORY[0x219A2D728](v13, v15, v2, v18);
        sub_21952EE5C(v2, v18);

        sub_21952EE5C(v13, v15);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease_n();

        if ((v16 & 1) != 0)
        {
          v5 = v26;
          if (v25 != v7++)
            continue;
        }
        return;
      }
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      OUTLINED_FUNCTION_2_0();
      v5 = OUTLINED_FUNCTION_15_0();
      OUTLINED_FUNCTION_3_1();
    }
  }
}

void static SiriNLOverride.overrideValueNilOrEqual(overrideValue:otherValue:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  if (a1)
  {
    v5 = objc_allocWithZone(MEMORY[0x24BDD1618]);
    OUTLINED_FUNCTION_12();
    v6 = OUTLINED_FUNCTION_8_0(v2, sel_initRequiringSecureCoding_);
    objc_msgSend(v6, sel_encodeObject_, a1);
    v7 = objc_msgSend(v6, sel_encodedData);
    v8 = sub_219557370();
    v10 = v9;

    v11 = OUTLINED_FUNCTION_8_0(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_);
    objc_msgSend(v11, sel_encodeObject_, a2);
    v12 = objc_msgSend(v11, sel_encodedData);
    v13 = sub_219557370();
    v15 = v14;

    MEMORY[0x219A2D728](v8, v10, v13, v15);
    sub_21952EE5C(v13, v15);

    sub_21952EE5C(v8, v10);
    swift_unknownObjectRelease();

    OUTLINED_FUNCTION_1_0();
  }
}

uint64_t static SiriNLOverride.subsetOfOther(subset:other:)(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  if (!a1)
  {
    v7 = 1;
    return v7 & 1;
  }
  OUTLINED_FUNCTION_13();
  if (v4)
  {
    OUTLINED_FUNCTION_2_0();
    v8 = OUTLINED_FUNCTION_15_0();
    OUTLINED_FUNCTION_3_1();
    if (v8)
    {
      OUTLINED_FUNCTION_2_0();
      v5 = OUTLINED_FUNCTION_15_0();
      OUTLINED_FUNCTION_3_1();
      goto LABEL_4;
    }
LABEL_12:
    v7 = 1;
    return v7 & 1;
  }
  v5 = *(_QWORD *)(v3 + 16);
  if (!v5)
    goto LABEL_12;
LABEL_4:
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_7_0();
    v6 = sub_2195583B4();
    OUTLINED_FUNCTION_10();
  }
  else
  {
    v6 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v6 >= v5)
  {
    swift_bridgeObjectRetain();
    v7 = sub_219540410(v2, v1);
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

uint64_t static SiriNLOverride.sdaNilOrEqual(override:other:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  char v18;

  if (a1)
  {
    swift_getObjectType();
    OUTLINED_FUNCTION_12();
    sub_219540E54();
    v4 = v3;
    v6 = v5;
    swift_getObjectType();
    v7 = a2;
    sub_219540E54();
    v9 = v8;
    OUTLINED_FUNCTION_14();
    if (qword_253F22160 != -1)
      swift_once();
    v10 = (void *)qword_253F221A8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
    v11 = OUTLINED_FUNCTION_8();
    *(_OWORD *)(v11 + 16) = xmmword_219558D80;
    v12 = OUTLINED_FUNCTION_11_0(v11, MEMORY[0x24BEE0D00]);
    *(_QWORD *)(v11 + 64) = v12;
    *(_QWORD *)(v11 + 32) = v4;
    *(_QWORD *)(v11 + 40) = v6;
    v13 = v10;
    swift_bridgeObjectRetain();
    sub_219558138();

    swift_bridgeObjectRelease();
    sub_2195582A0();
    v14 = (void *)qword_253F221A8;
    v15 = OUTLINED_FUNCTION_8();
    *(_OWORD *)(v15 + 16) = xmmword_219558D80;
    *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v15 + 64) = v12;
    *(_QWORD *)(v15 + 32) = v9;
    *(_QWORD *)(v15 + 40) = v7;
    v16 = v14;
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_6_0();

    swift_bridgeObjectRelease();
    if (v4 == v9 && v6 == v7)
      v18 = 1;
    else
      v18 = OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_1();
    swift_unknownObjectRelease();
  }
  else
  {
    v18 = 1;
  }
  return v18 & 1;
}

uint64_t sub_219540410(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
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
  void *v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  char v25;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_32;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3)
    goto LABEL_28;
  while (1)
  {
    v4 = 0;
    v5 = v2 & 0xC000000000000001;
    v28 = v2;
    v27 = v2 & 0xC000000000000001;
LABEL_4:
    if (v5)
      MEMORY[0x219A2E70C](v4, v2);
    else
      swift_unknownObjectRetain();
    v6 = __OFADD__(v4, 1);
    v7 = v4 + 1;
    if (!v6)
      break;
LABEL_31:
    __break(1u);
LABEL_32:
    swift_bridgeObjectRetain();
    v3 = sub_2195583B4();
    if (!v3)
      goto LABEL_28;
  }
  v29 = v7;
  if (!(a2 >> 62))
  {
    v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    if (!v8)
      goto LABEL_29;
    goto LABEL_12;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_2195583B4();
  if (v8)
  {
LABEL_12:
    swift_getObjectType();
    v9 = 4;
    v30 = v8;
    while (1)
    {
      v2 = v9 - 4;
      if ((a2 & 0xC000000000000001) != 0)
        MEMORY[0x219A2E70C](v9 - 4, a2);
      else
        swift_unknownObjectRetain();
      if (__OFADD__(v2, 1))
      {
        __break(1u);
        goto LABEL_31;
      }
      v32 = v9 - 3;
      swift_unknownObjectRetain();
      sub_219540E54();
      v11 = v10;
      v13 = v12;
      swift_getObjectType();
      sub_219540E54();
      v33 = v14;
      v16 = v15;
      sub_2195582A0();
      if (qword_253F22160 != -1)
        swift_once();
      v17 = (void *)qword_253F221A8;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
      v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_219558D80;
      *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
      v19 = sub_21952E30C();
      *(_QWORD *)(v18 + 64) = v19;
      *(_QWORD *)(v18 + 32) = v11;
      *(_QWORD *)(v18 + 40) = v13;
      v20 = v17;
      swift_bridgeObjectRetain();
      sub_219558138();

      swift_bridgeObjectRelease();
      sub_2195582A0();
      v21 = (void *)qword_253F221A8;
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_219558D80;
      *(_QWORD *)(v22 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v22 + 64) = v19;
      *(_QWORD *)(v22 + 32) = v33;
      *(_QWORD *)(v22 + 40) = v16;
      v23 = v21;
      swift_bridgeObjectRetain();
      sub_219558138();

      swift_bridgeObjectRelease();
      if (v11 == v33 && v13 == v16)
        break;
      v25 = sub_219558438();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v25 & 1) != 0)
        goto LABEL_27;
      ++v9;
      if (v32 == v30)
        goto LABEL_29;
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease_n();
LABEL_27:
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    v5 = v27;
    v4 = v29;
    v2 = v28;
    if (v29 != v3)
      goto LABEL_4;
LABEL_28:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
LABEL_29:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease_n();
  return 0;
}

void static SiriNLOverride.subsetOfOther(subset:other:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  char v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  unint64_t v46;
  __int128 v47;

  v4 = sub_219557D0C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_9_0();
  v8 = (id)(v7 - v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE30);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v31 - v13;
  if (a1)
  {
    v15 = *(_QWORD *)(a1 + 16);
    if (v15)
    {
      v36 = *(_QWORD *)(a2 + 16);
      if (v36 >= v15)
      {
        v16 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
        v34 = a1 + v16;
        v43 = *(_QWORD *)(v5 + 72);
        v33 = a2 + v16;
        v31 = a1;
        OUTLINED_FUNCTION_2_0();
        v17 = 0;
        v47 = xmmword_219558D80;
        v35 = a2;
        v41 = v5;
        v42 = v4;
        v39 = v12;
        v40 = v8;
        v38 = v14;
        v32 = v15;
        do
        {
          v45 = v34 + v43 * v17;
          v37 = v17 + 1;
          swift_bridgeObjectRetain();
          v44 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
          v18 = v33;
          v19 = v36;
          while (1)
          {
            v44(v14, v45, v4);
            __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v4);
            sub_2195419CC((uint64_t)v14, (uint64_t)v12);
            if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v4) == 1)
            {
              sub_219541A14((uint64_t)v12);
              goto LABEL_18;
            }
            v46 = v19;
            (*(void (**)(id, char *, uint64_t))(v5 + 32))(v8, v12, v4);
            v20 = sub_21954E5E8();
            v22 = v21;
            v23 = sub_21954E5E8();
            OUTLINED_FUNCTION_14();
            if (qword_253F22160 != -1)
              swift_once();
            v24 = (void *)qword_253F221A8;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
            v25 = OUTLINED_FUNCTION_8();
            *(_OWORD *)(v25 + 16) = v47;
            v26 = OUTLINED_FUNCTION_11_0(v25, MEMORY[0x24BEE0D00]);
            *(_QWORD *)(v25 + 64) = v26;
            *(_QWORD *)(v25 + 32) = v20;
            *(_QWORD *)(v25 + 40) = v22;
            v27 = v24;
            swift_bridgeObjectRetain();
            sub_219558138();

            swift_bridgeObjectRelease();
            v4 = sub_2195582A0();
            v28 = (void *)qword_253F221A8;
            v5 = OUTLINED_FUNCTION_8();
            *(_OWORD *)(v5 + 16) = v47;
            *(_QWORD *)(v5 + 56) = MEMORY[0x24BEE0D00];
            *(_QWORD *)(v5 + 64) = v26;
            *(_QWORD *)(v5 + 32) = v23;
            *(_QWORD *)(v5 + 40) = v18;
            v8 = v28;
            OUTLINED_FUNCTION_2_0();
            sub_219558138();

            swift_bridgeObjectRelease();
            if (v20 == v23 && v22 == v18)
              break;
            v30 = OUTLINED_FUNCTION_5_0();
            swift_bridgeObjectRelease();
            OUTLINED_FUNCTION_3_1();
            OUTLINED_FUNCTION_4_0();
            v14 = v38;
            sub_219541A14((uint64_t)v38);
            v12 = v39;
            if ((v30 & 1) != 0)
              goto LABEL_19;
            v18 += v43;
            v19 = v46 - 1;
            if (v46 == 1)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_21;
            }
          }
          swift_bridgeObjectRelease_n();
          OUTLINED_FUNCTION_4_0();
          v14 = v38;
          v12 = v39;
LABEL_18:
          sub_219541A14((uint64_t)v14);
LABEL_19:
          OUTLINED_FUNCTION_10();
          v17 = v37;
        }
        while (v37 != v32);
        swift_bridgeObjectRelease();
      }
    }
  }
LABEL_21:
  OUTLINED_FUNCTION_1_0();
}

void static SiriNLOverride.sdaNilOrEqual(override:other:)(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  char *v24;
  uint64_t v25;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE30);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_9_0();
  v7 = v6 - v5;
  v8 = sub_219557D0C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_9_0();
  v12 = v11 - v10;
  sub_2195419CC(a1, v7);
  if (__swift_getEnumTagSinglePayload(v7, 1, v8) == 1)
  {
    sub_219541A14(v7);
  }
  else
  {
    v25 = v9;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v12, v7, v8);
    v13 = sub_21954E5E8();
    v15 = v14;
    v24 = sub_21954E5E8();
    OUTLINED_FUNCTION_14();
    if (qword_253F22160 != -1)
      swift_once();
    v16 = (void *)qword_253F221A8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
    v17 = OUTLINED_FUNCTION_8();
    *(_OWORD *)(v17 + 16) = xmmword_219558D80;
    v18 = OUTLINED_FUNCTION_11_0(v17, MEMORY[0x24BEE0D00]);
    *(_QWORD *)(v17 + 64) = v18;
    *(_QWORD *)(v17 + 32) = v13;
    *(_QWORD *)(v17 + 40) = v15;
    v19 = v16;
    swift_bridgeObjectRetain();
    sub_219558138();

    swift_bridgeObjectRelease();
    sub_2195582A0();
    v20 = (void *)qword_253F221A8;
    v21 = OUTLINED_FUNCTION_8();
    *(_OWORD *)(v21 + 16) = xmmword_219558D80;
    *(_QWORD *)(v21 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v21 + 64) = v18;
    *(_QWORD *)(v21 + 32) = v24;
    *(_QWORD *)(v21 + 40) = a2;
    v22 = v20;
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_6_0();

    swift_bridgeObjectRelease();
    if (v13 != v24 || v15 != a2)
      OUTLINED_FUNCTION_5_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_1();
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v12, v8);
  }
  OUTLINED_FUNCTION_1_0();
}

void sub_219540E54()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;

  objc_opt_self();
  v0 = swift_dynamicCastObjCClass();
  if (v0)
  {
    v1 = (void *)v0;
    swift_unknownObjectRetain();
    sub_21955833C();
    swift_bridgeObjectRelease();
    v2 = objc_msgSend(v1, sel_reference);
    sub_2195417CC();

LABEL_40:
    sub_2195581BC();
    swift_bridgeObjectRelease();
    sub_2195581BC();
    swift_unknownObjectRelease();
    return;
  }
  objc_opt_self();
  v3 = swift_dynamicCastObjCClass();
  if (!v3)
  {
    objc_opt_self();
    v16 = swift_dynamicCastObjCClass();
    if (v16)
    {
      v17 = (void *)v16;
      swift_unknownObjectRetain();
      sub_21955833C();
      swift_bridgeObjectRelease();
      v18 = objc_msgSend(v17, sel_offeredAct);
      swift_getObjectType();
      sub_2195415C0();
      swift_unknownObjectRelease();
      goto LABEL_40;
    }
    objc_opt_self();
    v19 = swift_dynamicCastObjCClass();
    if (!v19)
    {
      objc_opt_self();
      v33 = swift_dynamicCastObjCClass();
      if (v33)
      {
        v34 = (void *)v33;
        swift_unknownObjectRetain();
        v35 = objc_msgSend(v34, sel_task);
        if (v35)
        {
          v36 = v35;
          sub_2195417CC();

        }
        sub_21955833C();
        swift_bridgeObjectRelease();
      }
      else
      {
        objc_opt_self();
        v37 = swift_dynamicCastObjCClass();
        if (!v37)
        {
          swift_unknownObjectRetain();
          sub_21955818C();
          return;
        }
        v38 = (void *)v37;
        swift_unknownObjectRetain();
        v39 = objc_msgSend(v38, sel_task);
        if (v39)
        {
          v40 = v39;
          sub_2195417CC();

        }
        sub_21955833C();
        swift_bridgeObjectRelease();
        v41 = objc_msgSend(v38, sel_description);
        sub_219558180();

        sub_2195581BC();
        swift_bridgeObjectRelease();
      }
      goto LABEL_40;
    }
    v20 = (void *)v19;
    swift_unknownObjectRetain();
    v21 = objc_msgSend(v20, sel_entities);
    sub_219541A54();
    v6 = sub_219558258();

    if (v6 >> 62)
      goto LABEL_42;
    v22 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v22)
      goto LABEL_20;
    goto LABEL_39;
  }
  v4 = (void *)v3;
  swift_unknownObjectRetain();
  v5 = objc_msgSend(v4, sel_choices);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25508CE40);
  v6 = sub_219558258();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2195583B4();
    swift_bridgeObjectRelease();
    if (v7)
      goto LABEL_6;
LABEL_39:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F22100);
    sub_21953B5E0();
    sub_21955815C();
    swift_bridgeObjectRelease();
    sub_21955833C();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v7)
    goto LABEL_39;
LABEL_6:
  v42 = MEMORY[0x24BEE4AF8];
  sub_21952E9C0(0, v7 & ~(v7 >> 63), 0);
  if ((v7 & 0x8000000000000000) == 0)
  {
    v8 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0)
        MEMORY[0x219A2E70C](v8, v6);
      else
        swift_unknownObjectRetain();
      swift_getObjectType();
      sub_2195415C0();
      v10 = v9;
      v12 = v11;
      swift_unknownObjectRelease();
      v14 = *(_QWORD *)(v42 + 16);
      v13 = *(_QWORD *)(v42 + 24);
      if (v14 >= v13 >> 1)
        sub_21952E9C0(v13 > 1, v14 + 1, 1);
      ++v8;
      *(_QWORD *)(v42 + 16) = v14 + 1;
      v15 = v42 + 16 * v14;
      *(_QWORD *)(v15 + 32) = v10;
      *(_QWORD *)(v15 + 40) = v12;
    }
    while (v7 != v8);
    goto LABEL_39;
  }
  __break(1u);
LABEL_42:
  swift_bridgeObjectRetain();
  v22 = sub_2195583B4();
  swift_bridgeObjectRelease();
  if (!v22)
    goto LABEL_39;
LABEL_20:
  v43 = MEMORY[0x24BEE4AF8];
  sub_21952E9C0(0, v22 & ~(v22 >> 63), 0);
  if ((v22 & 0x8000000000000000) == 0)
  {
    v23 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0)
        v24 = (id)MEMORY[0x219A2E70C](v23, v6);
      else
        v24 = *(id *)(v6 + 8 * v23 + 32);
      v25 = v24;
      sub_2195417CC();
      v27 = v26;
      v29 = v28;

      v31 = *(_QWORD *)(v43 + 16);
      v30 = *(_QWORD *)(v43 + 24);
      if (v31 >= v30 >> 1)
        sub_21952E9C0(v30 > 1, v31 + 1, 1);
      ++v23;
      *(_QWORD *)(v43 + 16) = v31 + 1;
      v32 = v43 + 16 * v31;
      *(_QWORD *)(v32 + 32) = v27;
      *(_QWORD *)(v32 + 40) = v29;
    }
    while (v22 != v23);
    goto LABEL_39;
  }
  __break(1u);
}

void sub_2195415C0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = sub_219558018();
  if (!(v0 >> 62))
  {
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v1)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F22100);
    sub_21953B5E0();
    sub_21955815C();
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v1 = sub_2195583B4();
  swift_bridgeObjectRelease();
  if (!v1)
    goto LABEL_13;
LABEL_3:
  v9 = MEMORY[0x24BEE4AF8];
  sub_21952E9C0(0, v1 & ~(v1 >> 63), 0);
  if ((v1 & 0x8000000000000000) == 0)
  {
    v2 = 0;
    do
    {
      if ((v0 & 0xC000000000000001) != 0)
        MEMORY[0x219A2E70C](v2, v0);
      else
        swift_retain();
      v7 = sub_21955809C();
      v8 = v3;
      sub_2195581BC();
      sub_2195580A8();
      sub_2195581BC();
      swift_release();
      swift_bridgeObjectRelease();
      v5 = *(_QWORD *)(v9 + 16);
      v4 = *(_QWORD *)(v9 + 24);
      if (v5 >= v4 >> 1)
        sub_21952E9C0(v4 > 1, v5 + 1, 1);
      ++v2;
      *(_QWORD *)(v9 + 16) = v5 + 1;
      v6 = v9 + 16 * v5;
      *(_QWORD *)(v6 + 32) = v7;
      *(_QWORD *)(v6 + 40) = v8;
    }
    while (v1 != v2);
    goto LABEL_13;
  }
  __break(1u);
}

void sub_2195417CC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!sub_2195582B8())
    return;
  v0 = MEMORY[0x219A2E3D0]();
  if (v0 >> 62)
  {
    v1 = sub_2195583B4();
    if (v1)
      goto LABEL_4;
LABEL_15:
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F22100);
    sub_21953B5E0();
    sub_21955815C();
    swift_bridgeObjectRelease();
    swift_release();
    return;
  }
  v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v1)
    goto LABEL_15;
LABEL_4:
  v9 = MEMORY[0x24BEE4AF8];
  sub_21952E9C0(0, v1 & ~(v1 >> 63), 0);
  if ((v1 & 0x8000000000000000) == 0)
  {
    v2 = 0;
    do
    {
      if ((v0 & 0xC000000000000001) != 0)
        MEMORY[0x219A2E70C](v2, v0);
      else
        swift_retain();
      v7 = sub_21955809C();
      v8 = v3;
      sub_2195581BC();
      sub_2195580A8();
      sub_2195581BC();
      swift_release();
      swift_bridgeObjectRelease();
      v5 = *(_QWORD *)(v9 + 16);
      v4 = *(_QWORD *)(v9 + 24);
      if (v5 >= v4 >> 1)
        sub_21952E9C0(v4 > 1, v5 + 1, 1);
      ++v2;
      *(_QWORD *)(v9 + 16) = v5 + 1;
      v6 = v9 + 16 * v5;
      *(_QWORD *)(v6 + 32) = v7;
      *(_QWORD *)(v6 + 40) = v8;
    }
    while (v1 != v2);
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_2195419CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_219541A14(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_219541A54()
{
  unint64_t result;

  result = qword_25508CE38;
  if (!qword_25508CE38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25508CE38);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 144) + 8))(*(_QWORD *)(v0 - 152), *(_QWORD *)(v0 - 136));
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_219558438();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_8_0(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

unint64_t OUTLINED_FUNCTION_11_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a1 + 56) = a2;
  return sub_21952E30C();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_2195582A0();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_2195583B4();
}

void sub_219541B54()
{
  off_253F22090 = (_UNKNOWN *)MEMORY[0x24BEE4B00];
}

uint64_t sub_219541B68()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F220A8);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_253F22078 = result;
  return result;
}

uint64_t sub_219541B9C()
{
  OUTLINED_FUNCTION_0_0();
  sub_21952E588(&qword_253F21FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  sub_219558150();
  OUTLINED_FUNCTION_3_2();
  sub_219557D54();
  return sub_2195584C8();
}

BOOL sub_219541C0C()
{
  uint64_t v1;
  uint64_t v2;

  if ((MEMORY[0x219A2D7D0]() & 1) == 0)
    return 0;
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_1();
  sub_21952E588(&qword_253F21FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE9CE30], MEMORY[0x24BE9CE40]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_4_1();
  return v2 == v1;
}

uint64_t sub_219541CA4()
{
  sub_2195584BC();
  sub_21955743C();
  sub_21952E588(&qword_253F21FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  sub_219558150();
  type metadata accessor for CacheKey();
  sub_219557D54();
  sub_2195584C8();
  return sub_2195584D4();
}

uint64_t sub_219541D34()
{
  sub_2195584BC();
  OUTLINED_FUNCTION_0_0();
  sub_21952E588(&qword_253F21FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEED0]);
  sub_219558150();
  sub_219557D54();
  sub_2195584C8();
  return sub_2195584D4();
}

id RegexOverrideCache.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id RegexOverrideCache.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RegexOverrideCache();
  return objc_msgSendSuper2(&v2, sel_init);
}

id RegexOverrideCache.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RegexOverrideCache();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_QWORD *sub_219541E5C(uint64_t a1, _QWORD *(*a2)(uint64_t *__return_ptr), uint64_t a3)
{
  return sub_219538D54(a1, a2, a3);
}

uint64_t *sub_219541E70(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_21955743C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_219557D84();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_219541F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_21955743C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_219557D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_219541F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_21955743C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_219557D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_219542010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_21955743C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_219557D84();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_21954208C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_219542098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_2_1();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t sub_2195420F8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_219542104(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_0_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_2_1();
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t sub_21954216C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21955743C();
  if (v1 <= 0x3F)
  {
    result = sub_219557D84();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t sub_2195421F0()
{
  return sub_21952E588(&qword_253F22040, (uint64_t (*)(uint64_t))type metadata accessor for CacheKey, (uint64_t)&unk_219559034);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_21955743C();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_219557D84();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return type metadata accessor for CacheKey();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_21955824C();
}

_QWORD *OUTLINED_FUNCTION_5_1(uint64_t a1, _QWORD *(*a2)(uint64_t *__return_ptr), uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return a2((uint64_t *)va);
}

uint64_t *_s11SpanForNodeVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    swift_retain();
  }
  else
  {
    v7 = sub_2195577B4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t _s11SpanForNodeVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2195577B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s11SpanForNodeVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2195577B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s11SpanForNodeVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_2195577B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s11SpanForNodeVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_219542404()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_65();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t _s11SpanForNodeVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_219542438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_65();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

void sub_219542464(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_219542474()
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
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  char *v38;
  void (*v39)(uint64_t, uint64_t);
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
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char v55;
  char v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  char v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  char v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[4];
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
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void (*v120)(char *, uint64_t, void (*)(uint64_t, uint64_t));
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;

  OUTLINED_FUNCTION_62();
  v123 = v1;
  v124 = v2;
  v4 = v3;
  v89 = sub_219557DCC();
  v88[3] = *(_QWORD *)(v89 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_23();
  v106 = v7;
  v91 = sub_219557EEC();
  v90 = *(_QWORD *)(v91 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_23();
  v105 = v10;
  v11 = sub_219557D3C();
  OUTLINED_FUNCTION_56(v11, (uint64_t)&v122);
  v92 = v12;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_23();
  v98 = OUTLINED_FUNCTION_59(v15);
  v96 = *(_QWORD *)(v98 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_23();
  v103 = OUTLINED_FUNCTION_58(v18);
  v101 = *(_QWORD *)(v103 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_23();
  v102 = v21;
  v109 = sub_2195576DC();
  v107 = *(_QWORD *)(v109 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_23();
  v108 = v24;
  v113 = sub_2195576AC();
  v111 = *(_QWORD *)(v113 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_3();
  v100 = v26;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_23();
  v112 = v28;
  OUTLINED_FUNCTION_38();
  v119 = sub_21955755C();
  v117 = *(_QWORD *)(v119 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_3();
  v118 = v30;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v31);
  v116 = (char *)v88 - v32;
  v115 = OUTLINED_FUNCTION_82();
  v33 = *(_QWORD *)(v115 - 8);
  v34 = MEMORY[0x24BDAC7A8](v115);
  v36 = (void (*)(uint64_t, uint64_t))((char *)v88 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)v88 - v37;
  v39 = (void (*)(uint64_t, uint64_t))sub_219557934();
  v40 = *((_QWORD *)v39 - 1);
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_19_0();
  v104 = v43;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_19_0();
  v110 = v45;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_19_0();
  v114 = v47;
  OUTLINED_FUNCTION_2_2();
  v49 = MEMORY[0x24BDAC7A8](v48);
  v51 = (char *)v88 - v50;
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_86();
  MEMORY[0x24BDAC7A8](v52);
  v54 = (char *)v88 - v53;
  v55 = sub_219557814();
  v120 = *(void (**)(char *, uint64_t, void (*)(uint64_t, uint64_t)))(v40 + 16);
  v120(v54, v4, v39);
  if ((v55 & 1) == 0)
  {
    OUTLINED_FUNCTION_49();
LABEL_5:
    v60 = v4;
    v61 = sub_219557820();
    v120((char *)v0, v4, v39);
    if ((v61 & 1) != 0)
    {
      v62 = v112;
      sub_2195578F8();
      v63 = v62;
      LOBYTE(v62) = sub_219557688();
      v36 = *(void (**)(uint64_t, uint64_t))(v111 + 8);
      v64 = v113;
      OUTLINED_FUNCTION_18(v63);
      OUTLINED_FUNCTION_63();
      if ((v62 & 1) != 0)
      {
        v59 = v63;
        sub_2195578F8();
        OUTLINED_FUNCTION_40();
        sub_2195576A0();
        OUTLINED_FUNCTION_18(v63);
        OUTLINED_FUNCTION_43();
        OUTLINED_FUNCTION_1_2();
        v65 = v100;
        sub_2195578F8();
        OUTLINED_FUNCTION_22();
        sub_2195576A0();
LABEL_28:
        v79 = v65;
        v80 = v64;
LABEL_29:
        v36(v79, v80);
        goto LABEL_30;
      }
    }
    else
    {
      OUTLINED_FUNCTION_63();
    }
    v66 = sub_21955782C();
    OUTLINED_FUNCTION_11_1((uint64_t)v51);
    if ((v66 & 1) != 0)
    {
      v59 = v108;
      sub_219557910();
      v65 = sub_2195576B8();
      v67 = OUTLINED_FUNCTION_84();
      v64 = v109;
      OUTLINED_FUNCTION_18(v67);
      OUTLINED_FUNCTION_17((uint64_t)v51);
      if ((v65 & 1) != 0)
      {
        sub_219557910();
        OUTLINED_FUNCTION_40();
        sub_2195576D0();
        OUTLINED_FUNCTION_18(v59);
        OUTLINED_FUNCTION_43();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_26();
        sub_219557910();
        OUTLINED_FUNCTION_22();
        sub_2195576D0();
        goto LABEL_28;
      }
    }
    else
    {
      OUTLINED_FUNCTION_17((uint64_t)v51);
    }
    v68 = sub_219557850();
    v0 = v114;
    OUTLINED_FUNCTION_11_1(v114);
    if ((v68 & 1) != 0)
    {
      v59 = v102;
      sub_219557928();
      v65 = sub_2195577E4();
      v69 = OUTLINED_FUNCTION_84();
      v64 = v103;
      OUTLINED_FUNCTION_18(v69);
      OUTLINED_FUNCTION_17(v0);
      if ((v65 & 1) != 0)
      {
        sub_219557928();
        OUTLINED_FUNCTION_40();
        sub_2195577FC();
        OUTLINED_FUNCTION_18(v59);
        OUTLINED_FUNCTION_43();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_26();
        sub_219557928();
        OUTLINED_FUNCTION_22();
        sub_2195577FC();
        goto LABEL_28;
      }
    }
    else
    {
      OUTLINED_FUNCTION_17(v0);
    }
    v70 = sub_2195578D4();
    v0 = v110;
    OUTLINED_FUNCTION_11_1(v110);
    if ((v70 & 1) != 0)
    {
      v59 = v97;
      sub_219557898();
      v65 = sub_219557E5C();
      v71 = OUTLINED_FUNCTION_84();
      v64 = v98;
      OUTLINED_FUNCTION_18(v71);
      OUTLINED_FUNCTION_17(v0);
      if ((v65 & 1) != 0)
      {
        sub_219557898();
        OUTLINED_FUNCTION_40();
        sub_219557E74();
        OUTLINED_FUNCTION_18(v59);
        OUTLINED_FUNCTION_43();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_26();
        sub_219557898();
        OUTLINED_FUNCTION_22();
        sub_219557E74();
        goto LABEL_28;
      }
    }
    else
    {
      OUTLINED_FUNCTION_17(v0);
    }
    v72 = sub_2195578A4();
    v73 = v104;
    OUTLINED_FUNCTION_11_1(v104);
    if ((v72 & 1) != 0)
    {
      v74 = v93;
      sub_219557844();
      v75 = sub_219557D18();
      v36 = *(void (**)(uint64_t, uint64_t))(v92 + 8);
      v64 = v94;
      OUTLINED_FUNCTION_18(v74);
      OUTLINED_FUNCTION_17(v73);
      v0 = v105;
      v59 = v106;
      if ((v75 & 1) != 0)
      {
        sub_219557844();
        v65 = (uint64_t)v116;
        sub_219557D30();
        OUTLINED_FUNCTION_18(v74);
        OUTLINED_FUNCTION_43();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_26();
        sub_219557844();
        OUTLINED_FUNCTION_22();
        sub_219557D30();
        goto LABEL_28;
      }
    }
    else
    {
      OUTLINED_FUNCTION_17(v73);
      v0 = v105;
      v59 = v106;
    }
    v76 = sub_2195578E0();
    v77 = v99;
    OUTLINED_FUNCTION_11_1(v99);
    if ((v76 & 1) != 0)
    {
      sub_2195578BC();
      v78 = sub_219557EC8();
      v36 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
      OUTLINED_FUNCTION_74(v0, (uint64_t)&v121);
      OUTLINED_FUNCTION_17(v77);
      if ((v78 & 1) != 0)
      {
        v64 = v0;
        sub_2195578BC();
        v65 = (uint64_t)v116;
        sub_219557EE0();
        OUTLINED_FUNCTION_18(v0);
        OUTLINED_FUNCTION_43();
        OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_26();
        sub_2195578BC();
        OUTLINED_FUNCTION_22();
        sub_219557EE0();
        goto LABEL_28;
      }
    }
    else
    {
      OUTLINED_FUNCTION_17(v77);
    }
    v82 = sub_2195578C8();
    v83 = v95;
    OUTLINED_FUNCTION_11_1(v95);
    if ((v82 & 1) != 0)
    {
      sub_219557868();
      v84 = sub_219557DA8();
      v85 = OUTLINED_FUNCTION_84();
      OUTLINED_FUNCTION_74(v85, (uint64_t)&v118);
      OUTLINED_FUNCTION_17(v83);
      if ((v84 & 1) != 0)
      {
        v86 = v59;
        sub_219557868();
        v0 = (uint64_t)v116;
        sub_219557DC0();
        v36(v59, v59);
        v59 = sub_219557544();
        v39 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
        OUTLINED_FUNCTION_14_0(v0);
        v87 = v88[0];
        sub_219557868();
        v60 = v118;
        sub_219557DC0();
        v79 = v87;
        v80 = v86;
        goto LABEL_29;
      }
    }
    else
    {
      OUTLINED_FUNCTION_17(v83);
    }
    return 0;
  }
  sub_219557880();
  v56 = sub_219557BA4();
  v57 = *(void (**)(char *, uint64_t))(v33 + 8);
  v57(v38, v115);
  OUTLINED_FUNCTION_49();
  if ((v56 & 1) == 0)
    goto LABEL_5;
  sub_219557880();
  v0 = (uint64_t)v116;
  sub_219557BBC();
  v58 = v115;
  v57(v38, v115);
  v59 = sub_219557544();
  v39 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
  OUTLINED_FUNCTION_14_0(v0);
  sub_219557880();
  v60 = v118;
  sub_219557BBC();
  v57((char *)v36, v58);
LABEL_30:
  sub_21955752C();
  v39(v60, v0);
  return v59;
}

void sub_219542DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  void (*v68)(char *, uint64_t, uint64_t);
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  void (*v71)(char *, uint64_t);
  char v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  char v76;
  char v77;
  char v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, _QWORD);
  uint64_t v83;
  uint64_t (*v84)(uint64_t, _QWORD);
  uint64_t v85;
  uint64_t (*v86)(uint64_t, _QWORD);
  uint64_t v87;
  uint64_t (*v88)(uint64_t, _QWORD);
  char v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, _QWORD);
  uint64_t v92;
  id v93;
  _QWORD v94[6];
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

  OUTLINED_FUNCTION_62();
  a19 = v22;
  a20 = v23;
  v114 = v24;
  v115 = v25;
  v112 = v26;
  v28 = v27;
  v29 = sub_219557DCC();
  OUTLINED_FUNCTION_56(v29, (uint64_t)&v117);
  v94[2] = v30;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_16(v32);
  v95 = sub_219557EEC();
  v94[5] = *(_QWORD *)(v95 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_16(v34);
  v97 = sub_219557D3C();
  v96 = *(_QWORD *)(v97 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_4_2();
  v37 = OUTLINED_FUNCTION_59(v36);
  OUTLINED_FUNCTION_56(v37, (uint64_t)&a12);
  v99 = v38;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_4_2();
  v102 = OUTLINED_FUNCTION_58(v40);
  v101 = *(_QWORD *)(v102 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_16(v42);
  v43 = sub_2195576DC();
  v104 = *(_QWORD *)(v43 - 8);
  v105 = v43;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_16(v45);
  v46 = sub_2195576AC();
  v108 = *(_QWORD *)(v46 - 8);
  v109 = v46;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_4_2();
  v107 = v48;
  v111 = OUTLINED_FUNCTION_82();
  v49 = *(_QWORD *)(v111 - 8);
  MEMORY[0x24BDAC7A8](v111);
  OUTLINED_FUNCTION_48();
  v50 = sub_219557934();
  v51 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_19_0();
  v106 = v55;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_19_0();
  v110 = v57;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v58);
  OUTLINED_FUNCTION_86();
  v60 = MEMORY[0x24BDAC7A8](v59);
  v62 = (char *)v94 - v61;
  v63 = MEMORY[0x24BDAC7A8](v60);
  v65 = (char *)v94 - v64;
  MEMORY[0x24BDAC7A8](v63);
  v67 = (char *)v94 - v66;
  v68 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  v68((char *)v94 - v66, v28, v50);
  v68(v65, (uint64_t)v67, v50);
  LOBYTE(v28) = sub_219557814();
  v113 = v51;
  v69 = *(void (**)(char *, uint64_t))(v51 + 8);
  v116 = v50;
  v70 = v50;
  v71 = v69;
  v69(v65, v70);
  if ((v28 & 1) != 0)
  {
    sub_219557880();
    v72 = sub_219557BA4();
    (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v20, v111);
    if ((v72 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_90();
      OUTLINED_FUNCTION_68();
      sub_219557550();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_90();
      OUTLINED_FUNCTION_68();
      sub_219557538();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      v73 = v115;
      v74 = v116;
      (*(void (**)(uint64_t, char *, uint64_t))(v113 + 32))(v115, v67, v116);
LABEL_26:
      v92 = 0;
      goto LABEL_27;
    }
  }
  v74 = v116;
  v68(v62, (uint64_t)v67, v116);
  v75 = sub_219557820();
  v71(v62, v74);
  if ((v75 & 1) != 0)
  {
    sub_2195578F8();
    v76 = sub_219557688();
    OUTLINED_FUNCTION_50(v108);
    if ((v76 & 1) != 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_94();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_94();
      OUTLINED_FUNCTION_69();
LABEL_25:
      sub_219557538();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      v73 = v115;
      (*(void (**)(uint64_t, char *, uint64_t))(v113 + 32))(v115, v67, v74);
      goto LABEL_26;
    }
  }
  OUTLINED_FUNCTION_20(v21);
  v77 = sub_21955782C();
  OUTLINED_FUNCTION_31(v21);
  if ((v77 & 1) != 0)
  {
    sub_219557910();
    v78 = sub_2195576B8();
    OUTLINED_FUNCTION_50(v104);
    if ((v78 & 1) != 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_92();
      OUTLINED_FUNCTION_66();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_92();
      OUTLINED_FUNCTION_66();
      goto LABEL_25;
    }
  }
  v79 = v110;
  OUTLINED_FUNCTION_20(v110);
  v80 = sub_219557850();
  OUTLINED_FUNCTION_31(v79);
  if ((v80 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    sub_219557928();
    LOBYTE(v79) = sub_2195577E4();
    v81 = OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_39(v81, v82);
    if ((v79 & 1) != 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_93();
      OUTLINED_FUNCTION_67();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_93();
      OUTLINED_FUNCTION_67();
      goto LABEL_25;
    }
  }
  OUTLINED_FUNCTION_20(v106);
  sub_2195578D4();
  OUTLINED_FUNCTION_21();
  if ((v79 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    sub_219557898();
    LOBYTE(v79) = sub_219557E5C();
    v83 = OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_39(v83, v84);
    if ((v79 & 1) != 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_87();
      OUTLINED_FUNCTION_70();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_87();
      OUTLINED_FUNCTION_70();
      goto LABEL_25;
    }
  }
  OUTLINED_FUNCTION_20(v103);
  sub_2195578A4();
  OUTLINED_FUNCTION_21();
  if ((v79 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    sub_219557844();
    LOBYTE(v79) = sub_219557D18();
    v85 = OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_39(v85, v86);
    if ((v79 & 1) != 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_72();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_89();
      OUTLINED_FUNCTION_72();
      goto LABEL_25;
    }
  }
  OUTLINED_FUNCTION_20(v100);
  sub_2195578E0();
  OUTLINED_FUNCTION_21();
  if ((v79 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    sub_2195578BC();
    LOBYTE(v79) = sub_219557EC8();
    v87 = OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_39(v87, v88);
    if ((v79 & 1) != 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_73();
      goto LABEL_25;
    }
  }
  OUTLINED_FUNCTION_20(v98);
  sub_2195578C8();
  OUTLINED_FUNCTION_21();
  if ((v79 & 1) != 0)
  {
    OUTLINED_FUNCTION_27();
    sub_219557868();
    v89 = sub_219557DA8();
    v90 = OUTLINED_FUNCTION_25();
    OUTLINED_FUNCTION_39(v90, v91);
    if ((v89 & 1) != 0)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_88();
      OUTLINED_FUNCTION_71();
      OUTLINED_FUNCTION_7_1();
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_10_1();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_88();
      OUTLINED_FUNCTION_71();
      goto LABEL_25;
    }
  }
  sub_2195582AC();
  if (qword_253F22160 != -1)
    swift_once();
  v93 = (id)qword_253F221A8;
  OUTLINED_FUNCTION_77();

  OUTLINED_FUNCTION_31((uint64_t)v67);
  v92 = 1;
  v73 = v115;
LABEL_27:
  __swift_storeEnumTagSinglePayload(v73, v92, 1, v74);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_219543594()
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
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(unint64_t, char *, uint64_t);
  unint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unsigned __int8 *v98;
  char v99;
  char v100;
  char v101;
  unsigned __int8 v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  void (*v115)(unint64_t, uint64_t, uint64_t);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unsigned __int8 v126;
  uint64_t v127;
  unsigned __int8 v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int EnumTagSinglePayload;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  unint64_t v164;
  unint64_t v165;
  void (*v166)(uint64_t, uint64_t);
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char v171;
  uint64_t v172;
  char v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  id v187;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  id v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  unint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void (*v213)(uint64_t, uint64_t, uint64_t);
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
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  unint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t *v238;
  uint64_t v239;
  uint64_t v240;
  __int128 v241;
  uint64_t v242;
  unint64_t v243;
  _QWORD *v244;
  uint64_t v245;
  uint64_t v246;
  unint64_t v247;
  unint64_t v248;
  unint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  _QWORD v263[14];
  uint64_t v264;
  uint64_t v265;

  OUTLINED_FUNCTION_62();
  v264 = v1;
  v265 = v2;
  v255 = v3;
  v224 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE50);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_16(v6);
  v7 = sub_21955797C();
  v253 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_48();
  v9 = sub_219557EBC();
  v251 = *(_QWORD *)(v9 - 8);
  v252 = v9;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_3();
  v250 = v11;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_23();
  v260 = v13;
  OUTLINED_FUNCTION_38();
  v14 = sub_2195580D8();
  OUTLINED_FUNCTION_56(v14, (uint64_t)&v258);
  v227 = v15;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_16(v18);
  v234 = sub_2195580FC();
  v233 = *(_QWORD *)(v234 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_16(v21);
  v22 = sub_219557520();
  v257 = *(_QWORD *)(v22 - 8);
  v258 = v22;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_4_2();
  v261 = v24;
  OUTLINED_FUNCTION_38();
  v25 = type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode();
  v246 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v27);
  v262 = (uint64_t)&v206 - v28;
  OUTLINED_FUNCTION_38();
  v29 = sub_219557934();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v35);
  v37 = (unint64_t)&v206 - v36;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE58);
  OUTLINED_FUNCTION_56(v38, (uint64_t)&v259);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_4_2();
  v218 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE60);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v42);
  v44 = (uint64_t *)((char *)&v206 - v43);
  v45 = sub_219557568();
  v46 = v25;
  v245 = static MatchingSpanUtils.utf16CodeUnitsToCodePointsMapping(_:)();
  v230 = 0;
  v47 = *(_QWORD *)(v45 + 16);
  v209 = (uint64_t)v263 + 2;
  v210 = (uint64_t)v263 + 3;
  v223 = MEMORY[0x24BEE4AF8];
  v241 = xmmword_219558D80;
  v236 = v25;
  v221 = v29;
  v220 = v30;
  v219 = v37;
  v237 = v7;
  v254 = v0;
  v222 = v45;
  v238 = v44;
  v216 = v47;
  while (1)
  {
LABEL_2:
    v48 = v229;
    OUTLINED_FUNCTION_76();
LABEL_3:
    if (v52 == v50)
    {
      v53 = 1;
      v217 = v50;
    }
    else
    {
      if ((v52 & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_158:
        __break(1u);
LABEL_159:
        __break(1u);
LABEL_160:
        __break(1u);
        goto LABEL_161;
      }
      if (v52 >= *(_QWORD *)(v51 + 16))
        goto LABEL_158;
      v54 = v52;
      v55 = v52 + 1;
      v56 = v218 + *(int *)(v48 + 48);
      OUTLINED_FUNCTION_35(v56, v51+ ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80))+ *(_QWORD *)(v30 + 72) * v52, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 16));
      OUTLINED_FUNCTION_76();
      *v57 = v54;
      v58 = v56;
      v48 = v229;
      OUTLINED_FUNCTION_35(v59, v58, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 32));
      OUTLINED_FUNCTION_76();
      v53 = 0;
      v217 = v55;
    }
    v60 = v49;
    __swift_storeEnumTagSinglePayload(v49, v53, 1, v48);
    sub_219534730(v60, (uint64_t)v44, &qword_25508CE60);
    if (__swift_getEnumTagSinglePayload((uint64_t)v44, 1, v48) == 1)
    {
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_6_1();
      return v223;
    }
    v61 = v48;
    v62 = *v44;
    v63 = *(void (**)(unint64_t, char *, uint64_t))(v30 + 32);
    v63(v37, (char *)v44 + *(int *)(v61 + 48), v29);
    if (*(_QWORD *)(v224 + 16))
    {
      v64 = sub_21952F82C(v62);
      if ((v65 & 1) != 0)
        break;
    }
    OUTLINED_FUNCTION_33(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v30 + 16));
    if ((OUTLINED_FUNCTION_32() & 1) == 0)
    {
      OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_85(v167);
    }
    OUTLINED_FUNCTION_28();
    if (v100)
    {
      OUTLINED_FUNCTION_24(v147, v148);
      v147 = v144;
    }
    v149 = OUTLINED_FUNCTION_12_0(v144, v145, v146, v147);
    v150 = (uint64_t *)&v244;
LABEL_119:
    OUTLINED_FUNCTION_83(v149, (uint64_t)v150);
    OUTLINED_FUNCTION_55();
  }
  v66 = *(_QWORD *)(*(_QWORD *)(v224 + 56) + 8 * v64);
  v239 = *(_QWORD *)(v66 + 16);
  if (!v239)
  {
    OUTLINED_FUNCTION_33(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v30 + 16));
    if ((OUTLINED_FUNCTION_32() & 1) == 0)
    {
      OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_85(v168);
    }
    OUTLINED_FUNCTION_28();
    if (v100)
    {
      OUTLINED_FUNCTION_24(v154, v155);
      v154 = v151;
    }
    v149 = OUTLINED_FUNCTION_12_0(v151, v152, v153, v154);
    v150 = &v242;
    goto LABEL_119;
  }
  swift_bridgeObjectRetain();
  v67 = sub_219542474();
  v259 = v68;
  if (!v67)
  {
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_33(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v30 + 16));
    if ((OUTLINED_FUNCTION_32() & 1) == 0)
    {
      OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_85(v169);
    }
    OUTLINED_FUNCTION_28();
    if (v100)
    {
      OUTLINED_FUNCTION_24(v159, v160);
      v159 = v156;
    }
    v149 = OUTLINED_FUNCTION_12_0(v156, v157, v158, v159);
    v150 = (uint64_t *)&v241 + 1;
    goto LABEL_119;
  }
  v213 = (void (*)(uint64_t, uint64_t, uint64_t))v63;
  v69 = 0;
  v243 = v66 + ((*(unsigned __int8 *)(v246 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v246 + 80));
  v70 = v244;
  v30 = v67;
  v240 = v66;
  while (v69 < *(_QWORD *)(v66 + 16))
  {
    sub_219534768(v243 + *(_QWORD *)(v246 + 72) * v69, v262, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
    if ((sub_219557790() & 1) == 0)
    {
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_6_1();
      sub_2195582AC();
      if (qword_253F22160 == -1)
        goto LABEL_128;
      goto LABEL_162;
    }
    v71 = static MatchingSpanUtils.getUnicodeScalarIndexes(_:_:_:)(v262, v255, v245);
    if ((v73 & 1) != 0)
    {
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_10();
      OUTLINED_FUNCTION_6_1();
      sub_2195582AC();
      if (qword_253F22160 == -1)
      {
LABEL_128:
        v176 = qword_253F221A8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
        v177 = OUTLINED_FUNCTION_30_0();
        OUTLINED_FUNCTION_47(v177);
        v178 = OUTLINED_FUNCTION_53();
        v180 = v179;
        v70[8] = OUTLINED_FUNCTION_79(MEMORY[0x24BEE0D00]);
        v70[4] = v178;
        v70[5] = v180;
        OUTLINED_FUNCTION_78();

        OUTLINED_FUNCTION_81();
        sub_21952ECDC(v176, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
        (*(void (**)(uint64_t, uint64_t))(v220 + 8))(v219, v221);
        goto LABEL_133;
      }
LABEL_162:
      swift_once();
      goto LABEL_128;
    }
    v248 = v72;
    v249 = v71;
    v256 = *(int *)(v46 + 20);
    v74 = *(_QWORD *)(v262 + v256);
    sub_219534768(v262, (uint64_t)v70, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
    if (v74 <= 0)
    {
      OUTLINED_FUNCTION_6_1();
      sub_21952ECDC((uint64_t)v70, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
      OUTLINED_FUNCTION_36();
      goto LABEL_131;
    }
    v75 = *(_QWORD *)((char *)v70 + *(int *)(v46 + 20));
    v76 = *(_QWORD *)(v30 + 16);
    sub_21952ECDC((uint64_t)v70, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
    if (v75 >= v76)
    {
      OUTLINED_FUNCTION_36();
      OUTLINED_FUNCTION_6_1();
LABEL_131:
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_6_1();
      OUTLINED_FUNCTION_6_1();
      sub_2195582AC();
      v30 = v221;
      v37 = v220;
      v46 = v219;
      if (qword_253F22160 == -1)
      {
LABEL_132:
        v181 = (void *)qword_253F221A8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
        v182 = OUTLINED_FUNCTION_30_0();
        v183 = v262;
        v184 = *(_QWORD *)(v262 + v256);
        v185 = MEMORY[0x24BEE1768];
        *(_OWORD *)(v182 + 16) = v241;
        v186 = MEMORY[0x24BEE17F0];
        *(_QWORD *)(v182 + 56) = v185;
        *(_QWORD *)(v182 + 64) = v186;
        *(_QWORD *)(v182 + 32) = v184;
        v187 = v181;
        sub_219558138();

        OUTLINED_FUNCTION_37();
        sub_21952ECDC(v183, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v46, v30);
        goto LABEL_133;
      }
LABEL_161:
      swift_once();
      goto LABEL_132;
    }
    v77 = v262;
    sub_219557724();
    sub_219545B08();
    v79 = v78;
    sub_219557700();
    sub_219545BE8();
    v81 = *(_QWORD *)(v77 + v256);
    if ((v81 & 0x8000000000000000) != 0)
      goto LABEL_142;
    if (v81 >= *(_QWORD *)(v30 + 16))
      goto LABEL_143;
    v37 = v80;
    v82 = (*(unsigned __int8 *)(v257 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v257 + 80);
    v83 = *(_QWORD *)(v257 + 72);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v257 + 16))(v261, v30 + v82 + v83 * v81, v258);
    v84 = sub_219557508();
    v247 = v69;
    if ((v84 & 1) == 0)
    {
      if ((sub_219557514() & 1) == 0)
      {
        OUTLINED_FUNCTION_6_1();
        OUTLINED_FUNCTION_6_1();
        OUTLINED_FUNCTION_36();
        OUTLINED_FUNCTION_6_1();
        OUTLINED_FUNCTION_6_1();
        sub_2195582AC();
        if (qword_253F22160 != -1)
          swift_once();
        v189 = (void *)qword_253F221A8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
        v190 = OUTLINED_FUNCTION_30_0();
        v191 = MEMORY[0x24BEE1768];
        *(_OWORD *)(v190 + 16) = v241;
        v192 = MEMORY[0x24BEE17F0];
        *(_QWORD *)(v190 + 56) = v191;
        *(_QWORD *)(v190 + 64) = v192;
        *(_QWORD *)(v190 + 32) = v81;
        v193 = v189;
        OUTLINED_FUNCTION_45();

        OUTLINED_FUNCTION_10();
        OUTLINED_FUNCTION_34();
        sub_21952ECDC(v262, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
        OUTLINED_FUNCTION_39(v219, *(uint64_t (**)(uint64_t, _QWORD))(v220 + 8));
        goto LABEL_133;
      }
      v92 = sub_219557760();
      v94 = v93;
      v95 = HIBYTE(v93) & 0xF;
      v96 = v92 & 0xFFFFFFFFFFFFLL;
      if ((v94 & 0x2000000000000000) != 0)
        v97 = v95;
      else
        v97 = v92 & 0xFFFFFFFFFFFFLL;
      if (!v97)
        goto LABEL_156;
      if ((v94 & 0x1000000000000000) != 0)
      {
        sub_2195449DC(v92, v94, 10);
        LOBYTE(v81) = v136;
        goto LABEL_60;
      }
      if ((v94 & 0x2000000000000000) == 0)
      {
        if ((v92 & 0x1000000000000000) != 0)
          v98 = (unsigned __int8 *)((v94 & 0xFFFFFFFFFFFFFFFLL) + 32);
        else
          v98 = (unsigned __int8 *)sub_219558354();
        v81 = v230;
        sub_219544B14(v98, v96, 10);
        v230 = v81;
        LOBYTE(v81) = v99 & 1;
        goto LABEL_60;
      }
      v263[0] = v92;
      v263[1] = v94 & 0xFFFFFFFFFFFFFFLL;
      if (v92 == 43)
      {
        if (!v95)
          goto LABEL_160;
        if (v95 == 1 || (BYTE1(v92) - 48) > 9u)
          goto LABEL_57;
        if (v95 == 2)
          goto LABEL_59;
        if ((BYTE2(v92) - 48) <= 9u)
        {
          if (v95 != 3)
          {
            while (1)
            {
              OUTLINED_FUNCTION_57();
              if (!v101 & v100)
                goto LABEL_57;
              OUTLINED_FUNCTION_29();
              if (!v101 || __OFADD__(v103, v102))
                goto LABEL_57;
              OUTLINED_FUNCTION_61();
              if (v101)
                goto LABEL_60;
            }
          }
          goto LABEL_59;
        }
      }
      else if (v92 == 45)
      {
        if (!v95)
          goto LABEL_159;
        if (v95 != 1 && (BYTE1(v92) - 48) <= 9u)
        {
          if (v95 == 2)
          {
            LOBYTE(v81) = 0;
LABEL_60:
            v104 = OUTLINED_FUNCTION_3_1();
            if ((v81 & 1) != 0)
              goto LABEL_137;
            v86 = v83;
            v105 = v225;
            MEMORY[0x219A2E490](v104);
            sub_2195580C0();
            v106 = v227;
            v107 = v228;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v227 + 16))(v226, v105, v228);
            sub_2195574FC();
            (*(void (**)(uint64_t, uint64_t))(v106 + 8))(v105, v107);
            v91 = v256;
            goto LABEL_62;
          }
          if ((BYTE2(v92) - 48) <= 9u)
          {
            if (v95 != 3)
            {
              while (1)
              {
                OUTLINED_FUNCTION_57();
                if (!v101 & v100)
                  goto LABEL_57;
                OUTLINED_FUNCTION_29();
                if (!v101 || __OFSUB__(v129, v128))
                  goto LABEL_57;
                OUTLINED_FUNCTION_61();
                if (v101)
                  goto LABEL_60;
              }
            }
LABEL_59:
            LOBYTE(v81) = 0;
            goto LABEL_60;
          }
        }
      }
      else if (v95 && (v92 - 48) <= 9u)
      {
        if (v95 == 1)
          goto LABEL_59;
        if ((BYTE1(v92) - 48) <= 9u)
        {
          if (v95 != 2)
          {
            while (1)
            {
              OUTLINED_FUNCTION_57();
              if (!v101 & v100)
                goto LABEL_57;
              OUTLINED_FUNCTION_29();
              if (!v101 || __OFADD__(v127, v126))
                goto LABEL_57;
              OUTLINED_FUNCTION_61();
              if (v101)
                goto LABEL_60;
            }
          }
          goto LABEL_59;
        }
      }
LABEL_57:
      LOBYTE(v81) = 1;
      goto LABEL_60;
    }
    v85 = v231;
    sub_2195580F0();
    v235 = v79;
    sub_219546020(v79, v37);
    v86 = v83;
    v87 = v30;
    if (!v88)
      sub_219557760();
    sub_2195580E4();
    v89 = v233;
    v90 = v234;
    OUTLINED_FUNCTION_35(v232, v85, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v233 + 16));
    sub_2195574F0();
    (*(void (**)(uint64_t, uint64_t))(v89 + 8))(v85, v90);
    v30 = v87;
    v91 = v256;
    v79 = v235;
LABEL_62:
    v108 = *(_QWORD *)(v262 + v91);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v110 = v238;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_219544AC0(v30);
      v30 = v130;
    }
    v70 = v244;
    if ((v108 & 0x8000000000000000) != 0)
      goto LABEL_144;
    if (v108 >= *(_QWORD *)(v30 + 16))
      goto LABEL_145;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v257 + 24))(v30 + v82 + v108 * v86, v261, v258);
    sub_219557EB0();
    v111 = *(_QWORD *)(v262 + v91);
    if ((v111 & 0x8000000000000000) != 0)
      goto LABEL_146;
    if (HIDWORD(v111))
      goto LABEL_147;
    sub_219557EA4();
    sub_219557E8C();
    sub_219557970();
    if ((v79 & 0x8000000000000000) != 0)
      goto LABEL_148;
    if (HIDWORD(v79))
      goto LABEL_149;
    sub_219557940();
    if ((v37 & 0x8000000000000000) != 0)
      goto LABEL_150;
    if (HIDWORD(v37))
      goto LABEL_151;
    sub_219557964();
    if ((v249 & 0x8000000000000000) != 0)
      goto LABEL_152;
    if (HIDWORD(v249))
      goto LABEL_153;
    sub_219557958();
    if ((v248 & 0x8000000000000000) != 0)
      goto LABEL_154;
    if (HIDWORD(v248))
      goto LABEL_155;
    sub_21955794C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE68);
    v112 = v253;
    v113 = (*(unsigned __int8 *)(v253 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v253 + 80);
    v114 = swift_allocObject();
    *(_OWORD *)(v114 + 16) = v241;
    v115 = *(void (**)(unint64_t, uint64_t, uint64_t))(v112 + 16);
    v116 = v254;
    v117 = v237;
    v115(v114 + v113, v254, v237);
    v118 = v260;
    sub_219557E98();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v251 + 16))(v250, v118, v252);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2195467B4(0, *(_QWORD *)(v259 + 16) + 1, 1, v259);
      v259 = v131;
    }
    v46 = v236;
    v119 = v247;
    v121 = *(_QWORD *)(v259 + 16);
    v120 = *(_QWORD *)(v259 + 24);
    if (v121 >= v120 >> 1)
    {
      v132 = OUTLINED_FUNCTION_95(v120);
      sub_2195467B4(v132, v133, v134, v259);
      v259 = v135;
    }
    v69 = v119 + 1;
    v122 = v259;
    *(_QWORD *)(v259 + 16) = v121 + 1;
    v123 = v251;
    v124 = v122
         + ((*(unsigned __int8 *)(v123 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80))
         + *(_QWORD *)(v123 + 72) * v121;
    v125 = v252;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v251 + 32))(v124, v250, v252);
    (*(void (**)(uint64_t, uint64_t))(v253 + 8))(v116, v117);
    (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v260, v125);
    OUTLINED_FUNCTION_34();
    sub_21952ECDC(v262, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
    v66 = v240;
    if (v69 == v239)
    {
      OUTLINED_FUNCTION_10();
      swift_bridgeObjectRetain();
      v137 = v215;
      v37 = v219;
      sub_219542DFC(v219, v30, v259, v138, v139, v140, v141, v142, v206, v207, v208, v209, v210, v211, v212, (uint64_t)v213, v214, v215, v216,
        v217);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3_1();
      v29 = v221;
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v137, 1, v221);
      v44 = v110;
      if (EnumTagSinglePayload == 1)
      {
        v30 = v220;
        OUTLINED_FUNCTION_55();
        sub_219544AD4(v137);
        OUTLINED_FUNCTION_3_1();
        v48 = v229;
        OUTLINED_FUNCTION_76();
        v50 = v216;
        v52 = v217;
        goto LABEL_3;
      }
      v259 = v30;
      v161 = v207;
      v213(v207, v137, v29);
      v30 = v220;
      OUTLINED_FUNCTION_35(v208, v161, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v220 + 16));
      if ((OUTLINED_FUNCTION_32() & 1) == 0)
      {
        OUTLINED_FUNCTION_8_1();
        OUTLINED_FUNCTION_85(v170);
      }
      v162 = v223;
      v164 = *(_QWORD *)(v223 + 16);
      v163 = *(_QWORD *)(v223 + 24);
      if (v164 >= v163 >> 1)
      {
        v171 = OUTLINED_FUNCTION_95(v163);
        sub_2195467DC(v171, v172, v173, v174);
        v162 = v175;
      }
      *(_QWORD *)(v162 + 16) = v164 + 1;
      v165 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
      v223 = v162;
      OUTLINED_FUNCTION_83(v162 + v165 + *(_QWORD *)(v30 + 72) * v164, (uint64_t)&v239);
      v166 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
      v166(v207, v29);
      v166(v37, v29);
      OUTLINED_FUNCTION_36();
      goto LABEL_2;
    }
  }
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
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
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  OUTLINED_FUNCTION_6_1();
  v240 = v245;
LABEL_137:
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_36();
  sub_2195582AC();
  v194 = v221;
  v195 = v220;
  if (qword_253F22160 != -1)
    swift_once();
  v196 = (void *)qword_253F221A8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
  v197 = OUTLINED_FUNCTION_30_0();
  *(_OWORD *)(v197 + 16) = xmmword_2195590A0;
  v198 = v196;
  v199 = v262;
  v200 = sub_219557760();
  v202 = v201;
  v203 = OUTLINED_FUNCTION_79(MEMORY[0x24BEE0D00]);
  *(_QWORD *)(v197 + 32) = v200;
  *(_QWORD *)(v197 + 40) = v202;
  v204 = *(_QWORD *)(v199 + v256);
  v205 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v197 + 96) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v197 + 104) = v205;
  *(_QWORD *)(v197 + 64) = v203;
  *(_QWORD *)(v197 + 72) = v204;
  OUTLINED_FUNCTION_78();

  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_34();
  sub_21952ECDC(v199, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
  (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v219, v194);
LABEL_133:
  swift_bridgeObjectRelease();
  return 0;
}

unsigned __int8 *sub_2195449DC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = sub_219558234();
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
  v5 = sub_219544D90();
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
    v7 = (unsigned __int8 *)sub_219558354();
  }
LABEL_7:
  v11 = sub_219544B14(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

void sub_219544AC0(uint64_t a1)
{
  sub_2195467C8(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_219544AD4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unsigned __int8 *sub_219544B14(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      v15 = a2 - 1;
      if (a2 != 1)
      {
        v16 = a3 + 48;
        v17 = a3 + 55;
        v18 = a3 + 87;
        if (a3 > 10)
        {
          v16 = 58;
        }
        else
        {
          v18 = 97;
          v17 = 65;
        }
        if (result)
        {
          v9 = 0;
          v19 = result + 1;
          do
          {
            v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                v13 = 0;
                if (v20 < 0x61 || v20 >= v18)
                  return (unsigned __int8 *)v13;
                v21 = -87;
              }
              else
              {
                v21 = -55;
              }
            }
            else
            {
              v21 = -48;
            }
            v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21)))
              return 0;
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        v23 = a3 + 48;
        v24 = a3 + 55;
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v23 = 58;
        }
        else
        {
          v25 = 97;
          v24 = 65;
        }
        if (result)
        {
          v26 = 0;
          do
          {
            v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                v13 = 0;
                if (v27 < 0x61 || v27 >= v25)
                  return (unsigned __int8 *)v13;
                v28 = -87;
              }
              else
              {
                v28 = -55;
              }
            }
            else
            {
              v28 = -48;
            }
            v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
              return 0;
            v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28)))
              return 0;
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
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
                v13 = 0;
                if (v11 < 0x61 || v11 >= v8)
                  return (unsigned __int8 *)v13;
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
            v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12)))
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
  }
  __break(1u);
  return result;
}

uint64_t sub_219544D90()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_219544DEC();
  v4 = sub_219544E20(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_219544DEC()
{
  return sub_219558240();
}

uint64_t sub_219544E20(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_219544F64(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_219545050(v9, 0);
      v12 = sub_2195450B4((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x219A2E568](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x219A2E568);
LABEL_9:
      sub_219558354();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x219A2E568]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_219544F64(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_2195452B4(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_2195452B4(a2, a3, a4);
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
    return sub_2195581EC();
  }
  __break(1u);
  return result;
}

_QWORD *sub_219545050(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE70);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_2195450B4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
    goto LABEL_35;
  }
  if (a3 < 0)
    goto LABEL_38;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_35:
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
    result = v12;
    if ((v12 & 0xC) == v15)
      result = sub_2195452B4(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_2195581F8();
      v19 = result;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_219558354();
        v19 = *(_BYTE *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      result = sub_2195452B4(v12, a6, a7);
      v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16)
      goto LABEL_37;
    v12 = sub_2195581D4();
LABEL_31:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_35;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_2195452B4(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_219558228();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x219A2E5A4](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t sub_219545330()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25508CE78;
  if (!qword_25508CE78)
  {
    v1 = sub_219532C2C(255, &qword_253F22058);
    result = MEMORY[0x219A2EE44](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&qword_25508CE78);
  }
  return result;
}

uint64_t sub_219545380(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void OUTLINED_FUNCTION_0_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 120) + 8))(v0, *(_QWORD *)(v1 - 104));
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_219557550();
}

void OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;

  sub_2195467DC(0, *(_QWORD *)(*(_QWORD *)(v0 - 456) + 16) + 1, 1, *(_QWORD *)(v0 - 456));
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 152, 0);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 120, 0);
}

uint64_t OUTLINED_FUNCTION_11_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 96))(a1, v2, v1);
}

unint64_t OUTLINED_FUNCTION_12_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *(_QWORD *)(a4 + 16) = v4;
  v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  *(_QWORD *)(v7 - 456) = a4;
  return a4 + v8 + *(_QWORD *)(v6 + 72) * v5;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  return v1(a1, *(_QWORD *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_16@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

void OUTLINED_FUNCTION_24(uint64_t a1@<X3>, unint64_t a2@<X8>)
{
  uint64_t v2;

  sub_2195467DC(a2 > 1, v2, 1, a1);
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_33@<X0>(uint64_t (*a1)(_QWORD, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(*(_QWORD *)(v1 - 256), v3, v2);
}

uint64_t OUTLINED_FUNCTION_34()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 168) + 8))(*(_QWORD *)(v0 - 136), *(_QWORD *)(v0 - 160));
}

uint64_t OUTLINED_FUNCTION_35@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_39@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

void OUTLINED_FUNCTION_42()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_219557544();
}

uint64_t OUTLINED_FUNCTION_46@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

id OUTLINED_FUNCTION_47(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v2 - 304);
  return v1;
}

uint64_t OUTLINED_FUNCTION_49()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return sub_219557778();
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_56@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return sub_219557808();
}

uint64_t OUTLINED_FUNCTION_63()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_2195577B4();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return sub_2195576C4();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return sub_2195577F0();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_219557BB0();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_219557694();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_219557E68();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return sub_219557DB4();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_219557D24();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return sub_219557ED4();
}

uint64_t OUTLINED_FUNCTION_74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v2)(uint64_t, _QWORD);

  return v2(a1, *(_QWORD *)(a2 - 256));
}

uint64_t OUTLINED_FUNCTION_75()
{
  uint64_t v0;

  return sub_219545380(v0);
}

uint64_t OUTLINED_FUNCTION_77()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_78()
{
  return sub_219558138();
}

unint64_t OUTLINED_FUNCTION_79@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = a1;
  return sub_21952E30C();
}

uint64_t OUTLINED_FUNCTION_80@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_82()
{
  return sub_219557BC8();
}

uint64_t OUTLINED_FUNCTION_83@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, _QWORD, uint64_t);

  return v3(a1, *(_QWORD *)(a2 - 256), v2);
}

uint64_t OUTLINED_FUNCTION_84()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_85(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 456) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_21955788C();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return sub_21955785C();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return sub_219557838();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return sub_219557874();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return sub_2195578B0();
}

uint64_t OUTLINED_FUNCTION_92()
{
  return sub_219557904();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return sub_21955791C();
}

uint64_t OUTLINED_FUNCTION_94()
{
  return sub_2195578EC();
}

BOOL OUTLINED_FUNCTION_95@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_96()
{
  return sub_219557AB4();
}

unint64_t OUTLINED_FUNCTION_97()
{
  uint64_t v0;

  return sub_21952F82C(v0);
}

void OUTLINED_FUNCTION_98()
{
  uint64_t v0;

}

void sub_219545848()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int EnumTagSinglePayload;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  BOOL v38;

  OUTLINED_FUNCTION_62();
  v35 = v0;
  v1 = OUTLINED_FUNCTION_15_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v29 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22110);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_4_2();
  v31 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22118);
  OUTLINED_FUNCTION_5_2();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (unint64_t *)((char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v12);
  v16 = (uint64_t *)((char *)&v29 - v15);
  v17 = sub_219557628();
  v18 = 0;
  v19 = *(_QWORD *)(v17 + 16);
  v36 = v17;
  v33 = v19;
  v34 = v16;
  while (1)
  {
    if (v18 == v19)
    {
      v20 = 1;
      v37 = v19;
    }
    else
    {
      if (v18 >= *(_QWORD *)(v17 + 16))
      {
        __break(1u);
        goto LABEL_18;
      }
      v21 = v31 + *(int *)(v8 + 48);
      OUTLINED_FUNCTION_12_1(v21, v17+ ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))+ *(_QWORD *)(v2 + 72) * v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
      v22 = (uint64_t)v14 + *(int *)(v8 + 48);
      *v14 = v18;
      OUTLINED_FUNCTION_12_1(v22, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
      v20 = 0;
      v37 = v18 + 1;
    }
    __swift_storeEnumTagSinglePayload((uint64_t)v14, v20, 1, v8);
    sub_219546A5C((uint64_t)v14, (uint64_t)v16);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v8);
    if (EnumTagSinglePayload == 1)
    {
      swift_bridgeObjectRelease();
LABEL_16:
      v38 = EnumTagSinglePayload == 1;
      OUTLINED_FUNCTION_1_0();
      return;
    }
    v24 = *v16;
    OUTLINED_FUNCTION_12_1((uint64_t)v7, (uint64_t)v16 + *(int *)(v8 + 48), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));
    v25 = (int)sub_219557490();
    OUTLINED_FUNCTION_12_1((uint64_t)v5, (uint64_t)v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    v26 = (uint64_t)v5;
    v27 = v35;
    if (v25 > v35)
    {
      OUTLINED_FUNCTION_36_0(v26);
      v5 = (char *)v26;
      goto LABEL_11;
    }
    v30 = v24;
    v32 = sub_219557484();
    v28 = *(void (**)(char *, uint64_t))(v2 + 8);
    OUTLINED_FUNCTION_36_0(v26);
    if ((int)v32 > v27)
      break;
    v5 = (char *)v26;
LABEL_11:
    OUTLINED_FUNCTION_36_0((uint64_t)v7);
    v19 = v33;
    v16 = v34;
    v17 = v36;
    v18 = v37;
  }
  swift_bridgeObjectRelease();
  if ((v30 & 0x8000000000000000) != 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (!HIDWORD(v30))
  {
    v28(v7, v1);
    goto LABEL_16;
  }
LABEL_19:
  __break(1u);
}

void sub_219545B08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_62();
  v4 = v3;
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_28_0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = OUTLINED_FUNCTION_3_3();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_27_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v0, v0, v6);
  if ((v4 & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_24_0();
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(sub_219557628() + 16);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24_0();
  if (v8 <= v4)
  {
LABEL_6:
    OUTLINED_FUNCTION_1_0();
    return;
  }
  if (*(_QWORD *)(sub_219557628() + 16) > v4)
  {
    OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_12_1(v1, v9 + v10 * v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    OUTLINED_FUNCTION_3_1();
    sub_219557490();
    OUTLINED_FUNCTION_19_1();
    goto LABEL_6;
  }
  __break(1u);
}

void sub_219545BE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_62();
  v4 = v3;
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_28_0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = OUTLINED_FUNCTION_3_3();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_27_0();
  v8 = __OFSUB__(v4, 1);
  v9 = v4 - 1;
  if (v8)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v0, v0, v6);
    if ((v9 & 0x8000000000000000) != 0)
    {
      OUTLINED_FUNCTION_23_0();
      goto LABEL_7;
    }
    v10 = *(_QWORD *)(sub_219557628() + 16);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_23_0();
    if (v9 >= v10)
    {
LABEL_7:
      OUTLINED_FUNCTION_1_0();
      return;
    }
    if (v9 < *(_QWORD *)(sub_219557628() + 16))
    {
      OUTLINED_FUNCTION_21_0();
      OUTLINED_FUNCTION_12_1(v1, v11 + v12 * v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
      OUTLINED_FUNCTION_3_1();
      sub_219557484();
      OUTLINED_FUNCTION_19_1();
      goto LABEL_7;
    }
  }
  __break(1u);
}

uint64_t static MatchingSpanUtils.utf16CodeUnitsToCodePointsMapping(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;

  swift_bridgeObjectRetain();
  v0 = 0;
  v1 = 0;
  v2 = MEMORY[0x24BEE4B00];
  while (1)
  {
    sub_2195581C8();
    if (!v3)
    {
      swift_bridgeObjectRelease();
      return v2;
    }
    v4 = v3;
    swift_isUniquelyReferenced_nonNull_native();
    v5 = OUTLINED_FUNCTION_30_1();
    if (__OFADD__(*(_QWORD *)(v2 + 16), (v6 & 1) == 0))
      break;
    v7 = v5;
    v8 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25508CE88);
    if ((sub_21955839C() & 1) != 0)
    {
      v9 = OUTLINED_FUNCTION_45_0();
      if ((v8 & 1) != (v10 & 1))
        goto LABEL_41;
      v7 = v9;
    }
    v2 = v28;
    if ((v8 & 1) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v7) = v1;
    }
    else
    {
      OUTLINED_FUNCTION_39_0(v28 + 8 * (v7 >> 6));
      *(_QWORD *)(v11 + 8 * v7) = v0;
      *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v7) = v1;
      v12 = *(_QWORD *)(v28 + 16);
      v13 = __OFADD__(v12, 1);
      v14 = v12 + 1;
      if (v13)
        goto LABEL_40;
      *(_QWORD *)(v28 + 16) = v14;
    }
    OUTLINED_FUNCTION_55_0();
    if ((v4 & 0x1000000000000000) != 0)
      v15 = sub_219558204();
    else
      v15 = sub_219558210();
    v16 = v15;
    OUTLINED_FUNCTION_42_0();
    v17 = v16 - 1;
    if (v16 < 1)
      goto LABEL_37;
    if (v16 != 1)
    {
      while (v17)
      {
        if (v0 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_33;
        ++v0;
        swift_isUniquelyReferenced_nonNull_native();
        v18 = OUTLINED_FUNCTION_30_1();
        v20 = v19;
        if (__OFADD__(*(_QWORD *)(v2 + 16), (v19 & 1) == 0))
          goto LABEL_34;
        v21 = v18;
        if ((sub_21955839C() & 1) != 0)
        {
          v22 = OUTLINED_FUNCTION_45_0();
          if ((v20 & 1) != (v23 & 1))
            goto LABEL_41;
          v21 = v22;
        }
        v2 = v28;
        if ((v20 & 1) != 0)
        {
          *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v21) = v1;
        }
        else
        {
          OUTLINED_FUNCTION_39_0(v28 + 8 * (v21 >> 6));
          *(_QWORD *)(v24 + 8 * v21) = v0;
          *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v21) = v1;
          v25 = *(_QWORD *)(v28 + 16);
          v13 = __OFADD__(v25, 1);
          v26 = v25 + 1;
          if (v13)
            goto LABEL_35;
          *(_QWORD *)(v28 + 16) = v26;
        }
        OUTLINED_FUNCTION_55_0();
        if (!--v17)
          goto LABEL_26;
      }
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      break;
    }
LABEL_26:
    v13 = __OFADD__(v1++, 1);
    if (v13)
      goto LABEL_38;
    v13 = __OFADD__(v0++, 1);
    if (v13)
      goto LABEL_39;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  result = sub_21955845C();
  __break(1u);
  return result;
}

uint64_t static MatchingSpanUtils.getUnicodeScalarIndexes(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  char v12;

  sub_219557724();
  sub_219545B08();
  if (v4 == -1)
    return 0;
  v5 = v4;
  sub_219557700();
  sub_219545BE8();
  if (v6 == -1)
    return 0;
  v7 = v6;
  v8 = sub_219532E6C(v5, a3);
  if ((v9 & 1) != 0)
    return 0;
  v10 = v8;
  result = sub_219532E6C(v7 - 1, a3);
  if ((v12 & 1) != 0)
    return 0;
  if (!__OFADD__(result, 1))
    return v10;
  __break(1u);
  return result;
}

uint64_t sub_219546020(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = 0;
  if (a1 < 0 || a2 < 0 || a2 < a1)
    return v2;
  sub_219557610();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_18_0();
  sub_219557610();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_20_0();
  v3 = OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_52_0();
  sub_219557610();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_18_0();
  sub_219557610();
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_20_0();
  v4 = OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_52_0();
  result = sub_219557610();
  if (v4 >> 14 >= v3 >> 14)
  {
    v6 = sub_219558240();
    v8 = v7;
    v10 = v9;
    v12 = v11;
    OUTLINED_FUNCTION_3_1();
    v2 = MEMORY[0x219A2E55C](v6, v8, v10, v12);
    OUTLINED_FUNCTION_42_0();
    return v2;
  }
  __break(1u);
  return result;
}

uint64_t static MatchingSpanUtils.trailingAdjacent(_:_:usingTokens:)()
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
  char *v12;
  uint64_t v13;
  int v14;
  unsigned int v16;
  int v17;
  unint64_t v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  OUTLINED_FUNCTION_62();
  v40 = v0;
  v41 = v1;
  v3 = v2;
  v5 = v4;
  v38 = OUTLINED_FUNCTION_15_1();
  v6 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OUTLINED_FUNCTION_48_0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = v3;
  v13 = sub_219557628();
  v14 = OUTLINED_FUNCTION_13_1();
  if (v14 == OUTLINED_FUNCTION_22_0())
    goto LABEL_2;
  v16 = OUTLINED_FUNCTION_13_1();
  v37 = v5;
  if (OUTLINED_FUNCTION_22_0() >= v16)
  {
    v17 = OUTLINED_FUNCTION_13_1();
    v18 = *(_QWORD *)(v13 + 16);
    if (v18 != v17)
    {
      v19 = OUTLINED_FUNCTION_13_1();
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v37, v9);
      if (v18 >= v19)
      {
        v20 = sub_219557724();
        OUTLINED_FUNCTION_35_0();
        if (v18 > v20)
        {
          LODWORD(v21) = OUTLINED_FUNCTION_13_1();
          if (v21 >= OUTLINED_FUNCTION_22_0())
          {
LABEL_2:
            OUTLINED_FUNCTION_38_0();
            return 1;
          }
          v21 = v21;
          OUTLINED_FUNCTION_32_0();
          v23 = v13 + v22;
          v24 = v38;
          while (v21 < *(_QWORD *)(v13 + 16))
          {
            (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v23 + *(_QWORD *)(v6 + 72) * v21, v24);
            v25 = sub_219557478();
            (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v24);
            if ((v25 & 1) != 0)
              goto LABEL_5;
            if (++v21 >= OUTLINED_FUNCTION_22_0())
              goto LABEL_2;
          }
          __break(1u);
          goto LABEL_19;
        }
        OUTLINED_FUNCTION_38_0();
      }
      else
      {
        OUTLINED_FUNCTION_38_0();
        OUTLINED_FUNCTION_35_0();
      }
      sub_2195582AC();
      if (qword_253F22160 == -1)
      {
LABEL_17:
        v26 = (void *)qword_253F221A8;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
        v27 = OUTLINED_FUNCTION_30_0();
        *(_OWORD *)(v27 + 16) = xmmword_2195590B0;
        v28 = v26;
        v29 = sub_219557610();
        v31 = v30;
        *(_QWORD *)(v27 + 56) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v27 + 64) = sub_21952E30C();
        *(_QWORD *)(v27 + 32) = v29;
        *(_QWORD *)(v27 + 40) = v31;
        v32 = OUTLINED_FUNCTION_13_1();
        v33 = MEMORY[0x24BEE44F0];
        v34 = MEMORY[0x24BEE4558];
        *(_QWORD *)(v27 + 96) = MEMORY[0x24BEE44F0];
        *(_QWORD *)(v27 + 104) = v34;
        *(_DWORD *)(v27 + 72) = v32;
        v35 = OUTLINED_FUNCTION_9_2();
        *(_QWORD *)(v27 + 136) = v33;
        *(_QWORD *)(v27 + 144) = v34;
        *(_DWORD *)(v27 + 112) = v35;
        OUTLINED_FUNCTION_29_0();

        goto LABEL_5;
      }
LABEL_19:
      swift_once();
      goto LABEL_17;
    }
  }
LABEL_5:
  swift_bridgeObjectRelease();
  return 0;
}

char *sub_219546444(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[16 * a2] <= __dst)
    return (char *)memmove(__dst, __src, 16 * a2);
  return __src;
}

void sub_219546470()
{
  sub_2195464AC();
}

void sub_21954647C()
{
  sub_2195464AC();
}

void sub_219546488()
{
  sub_2195464AC();
}

void sub_219546494()
{
  sub_2195464AC();
}

void sub_2195464A0()
{
  sub_219546510();
}

void sub_2195464AC()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD);
  char v3;
  char v4;

  OUTLINED_FUNCTION_26_0();
  if (v3 && (v2(0), OUTLINED_FUNCTION_40_0(), !v4 & v3))
  {
    if (v1 == v0)
    {
      OUTLINED_FUNCTION_41();
    }
    else
    {
      OUTLINED_FUNCTION_1_3();
      OUTLINED_FUNCTION_7_2();
    }
  }
  else
  {
    v2(0);
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_6_2();
  }
}

void sub_219546504()
{
  sub_219546510();
}

void sub_219546510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  char v3;
  char v4;

  OUTLINED_FUNCTION_26_0();
  if (v3 && (__swift_instantiateConcreteTypeFromMangledName(v2), OUTLINED_FUNCTION_40_0(), !v4 & v3))
  {
    if (v1 == v0)
    {
      OUTLINED_FUNCTION_41();
    }
    else
    {
      OUTLINED_FUNCTION_1_3();
      OUTLINED_FUNCTION_7_2();
    }
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(v2);
    OUTLINED_FUNCTION_1_3();
    OUTLINED_FUNCTION_6_2();
  }
}

void sub_219546568(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_253F22648, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C640]);
}

void sub_21954657C(char a1, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_49_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_2();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = a4[2];
  if (v6 <= v9)
    v10 = a4[2];
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F22128);
    v11 = (_QWORD *)OUTLINED_FUNCTION_30_0();
    v12 = _swift_stdlib_malloc_size(v11);
    v11[2] = v9;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 8);
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || &a4[v9 + 4] <= v11 + 4)
      memmove(v11 + 4, a4 + 4, 8 * v9);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F220F8);
    OUTLINED_FUNCTION_54_0();
  }
  OUTLINED_FUNCTION_10();
}

void sub_219546678(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_253F22120, (uint64_t (*)(_QWORD))type metadata accessor for Siri_Nlu_Internal_TurnInputRule.UtteranceRule.SpanForNode);
}

void sub_21954668C(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  size_t v18;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    if (v10 != v11)
    {
      OUTLINED_FUNCTION_49_0();
      if (v10)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_2();
    }
  }
  else
  {
    v9 = a2;
  }
  v12 = *(_QWORD *)(a4 + 16);
  if (v9 <= v12)
    v13 = *(_QWORD *)(a4 + 16);
  else
    v13 = v9;
  if (!v13)
    goto LABEL_17;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v14 = *(_QWORD *)(a6(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v17 = (_QWORD *)swift_allocObject();
  v18 = _swift_stdlib_malloc_size(v17);
  if (!v15)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v18 - v16 == 0x8000000000000000 && v15 == -1)
    goto LABEL_22;
  v17[2] = v12;
  v17[3] = 2 * ((uint64_t)(v18 - v16) / v15);
LABEL_17:
  a6(0);
  OUTLINED_FUNCTION_32_0();
  if ((a1 & 1) != 0)
  {
    sub_2195464AC();
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_16_0();
}

void sub_2195467B4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_25508CE98, (uint64_t (*)(_QWORD))MEMORY[0x24BE9D008]);
}

void sub_2195467C8(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_25508CEA0, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C270]);
}

void sub_2195467DC(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_25508CEA8, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C828]);
}

void sub_2195467F0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_253F22650, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
}

void sub_219546804(char a1, uint64_t a2, char a3, char *a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_49_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_2();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v6 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F22668);
    v11 = (char *)OUTLINED_FUNCTION_30_0();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || &v14[16 * v9] <= v13)
      memmove(v13, v14, 16 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_54_0();
  }
  OUTLINED_FUNCTION_10();
}

void sub_2195468E0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_253F22658, type metadata accessor for OverrideMatchResult);
}

void sub_2195468F4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_25508CE90, type metadata accessor for OverrideMatchResultAndParse);
}

void sub_219546908(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_49_0();
      if (v7)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_2();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (!v10)
    goto LABEL_17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC0);
  v11 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC8) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (_QWORD *)swift_allocObject();
  v15 = _swift_stdlib_malloc_size(v14);
  if (!v12)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v15 - v13 == 0x8000000000000000 && v12 == -1)
    goto LABEL_22;
  v14[2] = v9;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC8);
  OUTLINED_FUNCTION_32_0();
  if ((a1 & 1) != 0)
  {
    sub_219546510();
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_54_0();
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_16_0();
}

void sub_219546A38(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_21954668C(a1, a2, a3, a4, &qword_25508CEB0, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C2B8]);
}

ValueMetadata *type metadata accessor for MatchingSpanUtils()
{
  return &type metadata for MatchingSpanUtils;
}

uint64_t sub_219546A5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_219557640();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 104))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return swift_arrayInitWithTakeBackToFront();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_219557724();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_12_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_219557700();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_2195584BC();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_21955749C();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_219557724();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 128))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_219558138();
}

unint64_t OUTLINED_FUNCTION_30_1()
{
  uint64_t v0;

  return sub_21952F82C(v0);
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return sub_219557700();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_36_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_39_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_219557610();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return sub_2195584D4();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return sub_2195577B4();
}

BOOL OUTLINED_FUNCTION_51_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return sub_21955821C();
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_219546CF0()
{
  uint64_t result;

  sub_219546D50();
  result = sub_2195582DC();
  qword_253F221A8 = result;
  return result;
}

unint64_t sub_219546D50()
{
  unint64_t result;

  result = qword_253F22638;
  if (!qword_253F22638)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F22638);
  }
  return result;
}

id static ParseOverride.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_219558174();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

unint64_t sub_219546E00()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25508CED0;
  if (!qword_25508CED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25508CED8);
    v2 = MEMORY[0x24BEE0D10];
    result = MEMORY[0x219A2EE44](MEMORY[0x24BEE4AB0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25508CED0);
  }
  return result;
}

uint64_t sub_219546E5C@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, sel_creation);
  if (v3)
  {
    v4 = v3;
    sub_219557394();

    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = sub_2195573AC();
  return __swift_storeEnumTagSinglePayload(a2, v5, 1, v6);
}

void sub_219546EC8(uint64_t a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_219547394(a1, (uint64_t)v6);
  v7 = *a2;
  v8 = sub_2195573AC();
  v9 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8) != 1)
  {
    v9 = (void *)sub_21955737C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  objc_msgSend(v7, sel_setCreation_, v9);

}

void sub_219546F98(id *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  if (OUTLINED_FUNCTION_2_3(a1, a2, a3, a4))
  {
    sub_219558180();
    OUTLINED_FUNCTION_5_4();
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  *v4 = v5;
  v4[1] = v6;
  OUTLINED_FUNCTION_41();
}

void sub_219546FDC()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  OUTLINED_FUNCTION_4_4();
  if (v1)
  {
    v0 = sub_219558174();
    v7 = v0;
  }
  else
  {
    v7 = 0;
  }
  OUTLINED_FUNCTION_1_4(v0, v1, v7, v2, v3, v4, v5, v6, v8, v9);
  OUTLINED_FUNCTION_0_2(v10);
}

void sub_219547018(id *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;

  if (OUTLINED_FUNCTION_2_3(a1, a2, a3, a4))
  {
    sub_219557370();
    OUTLINED_FUNCTION_5_4();
  }
  else
  {
    v5 = 0;
    v6 = 0xF000000000000000;
  }
  *v4 = v5;
  v4[1] = v6;
  OUTLINED_FUNCTION_41();
}

void sub_21954705C()
{
  int v0;
  unint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  OUTLINED_FUNCTION_4_4();
  if (v1 >> 60 == 15)
  {
    v7 = 0;
  }
  else
  {
    v0 = sub_219557358();
    v7 = v0;
  }
  OUTLINED_FUNCTION_1_4(v0, v1, v7, v2, v3, v4, v5, v6, v8, v9);
  OUTLINED_FUNCTION_0_2(v10);
}

uint64_t sub_2195470A0@<X0>(uint64_t *a1@<X8>)
{
  void **v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2195473DC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *keypath_get_selector_archivedNluRequestRule()
{
  return sel_archivedNluRequestRule;
}

void sub_2195470D4(id *a1, uint64_t a2, uint64_t a3)
{
  sub_219547018(a1, a2, a3, (SEL *)&selRef_archivedNluRequestRule);
}

void sub_2195470F0()
{
  sub_21954705C();
}

char *keypath_get_selector_creation()
{
  return sel_creation;
}

char *keypath_get_selector_enabled()
{
  return sel_enabled;
}

void sub_21954712C(uint64_t a1)
{
  _BYTE *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(a1), sel_enabled);
  OUTLINED_FUNCTION_99();
}

id sub_219547154(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setEnabled_, *a1);
}

char *keypath_get_selector_id()
{
  return sel_id;
}

void sub_219547174(id *a1, uint64_t a2, uint64_t a3)
{
  sub_219546F98(a1, a2, a3, (SEL *)&selRef_id);
}

void sub_219547190()
{
  sub_219546FDC();
}

char *keypath_get_selector_inputText()
{
  return sel_inputText;
}

void sub_2195471B8(id *a1, uint64_t a2, uint64_t a3)
{
  sub_219546F98(a1, a2, a3, (SEL *)&selRef_inputText);
}

void sub_2195471D4()
{
  sub_219546FDC();
}

char *keypath_get_selector_locale()
{
  return sel_locale;
}

void sub_2195471FC(id *a1, uint64_t a2, uint64_t a3)
{
  sub_219546F98(a1, a2, a3, (SEL *)&selRef_locale);
}

void sub_219547218()
{
  sub_219546FDC();
}

char *keypath_get_selector_namespace()
{
  return sel_namespace;
}

void sub_219547240(uint64_t a1)
{
  _DWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(a1), sel_namespace);
  OUTLINED_FUNCTION_99();
}

id sub_219547268(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setNamespace_, *a1);
}

char *keypath_get_selector_overrideId()
{
  return sel_overrideId;
}

void sub_219547288(id *a1, uint64_t a2, uint64_t a3)
{
  sub_219546F98(a1, a2, a3, (SEL *)&selRef_overrideId);
}

void sub_2195472A4()
{
  sub_219546FDC();
}

char *keypath_get_selector_source()
{
  return sel_source;
}

void sub_2195472CC(uint64_t a1)
{
  _DWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(a1), sel_source);
  OUTLINED_FUNCTION_99();
}

id sub_2195472F4(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSource_, *a1);
}

char *keypath_get_selector_userParse()
{
  return sel_userParse;
}

void sub_219547314(id *a1, uint64_t a2, uint64_t a3)
{
  sub_219547018(a1, a2, a3, (SEL *)&selRef_userParse);
}

void sub_219547330()
{
  sub_21954705C();
}

char *keypath_get_selector_utteranceComparisonType()
{
  return sel_utteranceComparisonType;
}

void sub_219547358(uint64_t a1)
{
  _DWORD *v1;

  *v1 = objc_msgSend((id)OUTLINED_FUNCTION_6_3(a1), sel_utteranceComparisonType);
  OUTLINED_FUNCTION_99();
}

id sub_219547380(unsigned int *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setUtteranceComparisonType_, *a1);
}

uint64_t sub_219547394(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2195473DC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_id);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_219558180();

  return v3;
}

void OUTLINED_FUNCTION_0_2(id a1)
{

}

id OUTLINED_FUNCTION_1_4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  SEL *v10;
  void *v11;

  return objc_msgSend(v11, *v10);
}

id OUTLINED_FUNCTION_2_3(id *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  return objc_msgSend(*a1, *a4);
}

void OUTLINED_FUNCTION_5_4()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_6_3(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t Array<A>.currentTurn.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = OUTLINED_FUNCTION_0_3();
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t Array<A>.previousTurns.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  if (*(_QWORD *)(a1 + 16) < 2uLL)
    return 0;
  v1 = sub_21954753C(1, a1);
  return sub_2195475B4(v1, v2, v3, v4);
}

uint64_t sub_21954753C(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16) < result)
  {
    __break(1u);
  }
  else if ((result & 0x8000000000000000) == 0)
  {
    sub_219557F7C();
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t sub_2195475B4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((a4 & 1) == 0)
    goto LABEL_2;
  sub_219558444();
  swift_unknownObjectRetain_n();
  v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    v10 = MEMORY[0x24BEE4AF8];
  }
  v11 = *(_QWORD *)(v10 + 16);
  swift_release();
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v11 != (a4 >> 1) - a3)
  {
LABEL_11:
    swift_unknownObjectRelease();
LABEL_2:
    sub_219552318(a1, a2, a3, a4);
    v9 = v8;
    goto LABEL_9;
  }
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t Array<A>.currentTurnLocale.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  if (*(_QWORD *)(a1 + 16))
  {
    OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_1_5();
    return Siri_Nlu_Internal_Overrides_TurnInputAndPreprocessing.locale.getter(a2);
  }
  else
  {
    v4 = sub_21955743C();
    return __swift_storeEnumTagSinglePayload(a2, 1, 1, v4);
  }
}

uint64_t Array<A>.currentTurnUtterance.getter(uint64_t a1)
{
  if (!*(_QWORD *)(a1 + 16))
    return 0;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_5();
  return sub_219557F70();
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_219557F7C();
}

uint64_t sub_219547754(uint64_t a1, uint64_t a2)
{
  uint64_t matched;

  matched = type metadata accessor for UtteranceRuleMatchResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(matched - 8) + 32))(a2, a1, matched);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_219557B14();
}

void OUTLINED_FUNCTION_8_3()
{
  sub_2195347A0();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 112) + 8))(v0, *(_QWORD *)(v1 - 104));
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return type metadata accessor for TurnInputRuleMatchResult(0);
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 96) + 8))(v0, *(_QWORD *)(v1 - 88));
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return type metadata accessor for UtteranceRuleMatchResult(0);
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_2195575A4();
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return sub_219557F40();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return sub_219557AC0();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_22_1(uint64_t a1)
{
  uint64_t v1;

  return sub_219547754(a1, v1);
}

unint64_t sub_2195478C4(uint64_t a1, unsigned __int8 a2)
{
  if (a2 > 1u)
  {
    if (a1)
      return 0xD000000000000022;
    else
      return 0xD000000000000025;
  }
  else
  {
    sub_21955833C();
    OUTLINED_FUNCTION_0_4();
    sub_2195581BC();
    sub_219558420();
    sub_2195581BC();
    swift_bridgeObjectRelease();
    sub_2195581BC();
    return 0;
  }
}

unint64_t sub_2195479E8(uint64_t a1, char a2)
{
  unint64_t result;

  result = 0xD00000000000005DLL;
  if (a2 && (a2 == 1 || a1))
    return 0xD000000000000057;
  return result;
}

unint64_t sub_219547A48()
{
  uint64_t v0;

  return sub_2195478C4(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

unint64_t sub_219547A54()
{
  uint64_t v0;

  return sub_2195479E8(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParseOverride.validateForInsert()()
{
  sub_219547F74((SEL *)&selRef_validateForInsert_);
}

uint64_t sub_219547AB4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  _QWORD v18[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEF8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_219557D84();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - v9;
  objc_msgSend(v0, sel_namespace);
  sub_219557D6C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
  {
    sub_219548104((uint64_t)v3, &qword_25508CEF8);
    v11 = (int)objc_msgSend(v0, sel_namespace);
    sub_2195480C8();
    swift_allocError();
    *(_QWORD *)v12 = v11;
    *(_BYTE *)(v12 + 8) = 0;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BE9CE10], v4);
    sub_21952E588(&qword_253F21FE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE9CE30], MEMORY[0x24BE9CE40]);
    sub_21955824C();
    sub_21955824C();
    v15 = v18[0];
    v14 = v18[1];
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    if (v14 == v15)
    {
      sub_2195480C8();
      swift_allocError();
      *(_QWORD *)v17 = 0;
      *(_BYTE *)(v17 + 8) = 2;
      swift_willThrow();
    }
    return ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
  }
}

uint64_t sub_219547CDC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  _QWORD v18[4];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEE0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_219557D60();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - v9;
  objc_msgSend(v0, sel_source);
  sub_219557D48();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4) == 1)
  {
    sub_219548104((uint64_t)v3, &qword_25508CEE0);
    v11 = (int)objc_msgSend(v0, sel_source);
    sub_2195480C8();
    swift_allocError();
    *(_QWORD *)v12 = v11;
    *(_BYTE *)(v12 + 8) = 1;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, *MEMORY[0x24BE9CDE0], v4);
    sub_21952E588(&qword_25508CEF0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9CDF8], MEMORY[0x24BE9CE08]);
    sub_21955824C();
    sub_21955824C();
    v14 = v18[3];
    v15 = v18[1];
    v16 = *(void (**)(char *, uint64_t))(v5 + 8);
    v16(v8, v4);
    if (v14 == v15)
    {
      sub_2195480C8();
      swift_allocError();
      *(_QWORD *)v17 = 1;
      *(_BYTE *)(v17 + 8) = 2;
      swift_willThrow();
    }
    return ((uint64_t (*)(char *, uint64_t))v16)(v10, v4);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ParseOverride.validateForUpdate()()
{
  sub_219547F74((SEL *)&selRef_validateForUpdate_);
}

uint64_t sub_219547F74(SEL *a1)
{
  void *v1;
  uint64_t v2;
  id v4;
  uint64_t result;
  id v6;
  objc_super v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8[0] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for ParseOverride();
  if (objc_msgSendSuper2(&v7, *a1, v8))
  {
    v4 = v8[0];
    result = sub_219547AB4();
    if (!v2)
      return sub_219547CDC();
  }
  else
  {
    v6 = v8[0];
    sub_21955734C();

    return swift_willThrow();
  }
  return result;
}

uint64_t sub_21954804C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  id v5;

  v5 = a1;
  a4();

  return 1;
}

unint64_t sub_2195480C8()
{
  unint64_t result;

  result = qword_25508CEE8;
  if (!qword_25508CEE8)
  {
    result = MEMORY[0x219A2EE44](&unk_219559178, &_s15ValidationErrorON);
    atomic_store(result, (unint64_t *)&qword_25508CEE8);
  }
  return result;
}

uint64_t sub_219548104(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s15ValidationErrorOwet(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 2)
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

uint64_t _s15ValidationErrorOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_2195481DC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_2195481F4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *_s15ValidationErrorOMa()
{
  return &_s15ValidationErrorON;
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_1_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_2_4(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return sub_219558438();
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return sub_219557F4C();
}

void sub_219548280()
{
  qword_253F225E8 = MEMORY[0x24BEE4B00];
}

void sub_219548294()
{
  dword_253F21E20 = 0;
}

uint64_t sub_2195482A0()
{
  swift_bridgeObjectRetain();
  sub_2195581B0();
  swift_bridgeObjectRelease();
  return sub_2195584C8();
}

BOOL sub_2195482FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v9;
  _BOOL8 result;

  if (a1 == a4 && a2 == a5)
    return a3 == a6;
  v9 = sub_219558438();
  result = 0;
  if ((v9 & 1) != 0)
    return a3 == a6;
  return result;
}

uint64_t sub_21954834C()
{
  sub_2195584BC();
  swift_bridgeObjectRetain();
  sub_2195581B0();
  swift_bridgeObjectRelease();
  sub_2195584C8();
  return sub_2195584D4();
}

uint64_t sub_2195483C0()
{
  return sub_21954834C();
}

uint64_t sub_2195483CC()
{
  return sub_2195482A0();
}

uint64_t sub_2195483D8()
{
  sub_2195584BC();
  swift_bridgeObjectRetain();
  sub_2195581B0();
  swift_bridgeObjectRelease();
  sub_2195584C8();
  return sub_2195584D4();
}

BOOL sub_219548444(uint64_t *a1, uint64_t *a2)
{
  return sub_2195482FC(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

uint64_t sub_219548460(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_219548550(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2195484CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v10;

  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v4;
  *v4 = 0x8000000000000000;
  sub_21954868C(a1, a2, a3, a4);
  *v4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_219548550(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  v3 = (_QWORD **)v2;
  v6 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (_QWORD *)*v2;
  v10 = sub_21952F794(a2);
  if (__OFADD__(v9[2], (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v12 = v10;
  v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22070);
  if ((sub_21955839C() & 1) == 0)
    goto LABEL_5;
  v14 = sub_21952F794(a2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_10:
    result = sub_21955845C();
    __break(1u);
    return result;
  }
  v12 = v14;
LABEL_5:
  v16 = *v3;
  if ((v13 & 1) != 0)
  {
    v17 = v16[7];
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v17 + 8 * v12) = a1;
  }
  else
  {
    sub_21952E5C8(a2, (uint64_t)v8);
    return sub_2195487BC(v12, (uint64_t)v8, a1, v16);
  }
  return result;
}

void sub_21954868C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_21952F8E8(a2, a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22068);
  if ((sub_21955839C() & 1) == 0)
    goto LABEL_5;
  v15 = sub_21952F8E8(a2, a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    sub_21955845C();
    __break(1u);
    return;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = v17[7];

    *(_QWORD *)(v18 + 8 * v13) = a1;
  }
  else
  {
    sub_21954884C(v13, a2, a3, a4, a1, v17);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_2195487BC(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for CacheKey();
  result = sub_21953B7C0(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1);
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

unint64_t sub_21954884C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 24 * result);
  *v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  *(_QWORD *)(a6[7] + 8 * result) = a5;
  v7 = a6[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a6[2] = v9;
  return result;
}

_QWORD *_s16SiriNLUOverrides8CacheKeyVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for CacheKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

_QWORD *assignWithTake for CacheKey(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for CacheKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for CacheKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

unint64_t sub_2195489E4()
{
  unint64_t result;

  result = qword_253F22600;
  if (!qword_253F22600)
  {
    result = MEMORY[0x219A2EE44](&unk_2195591DC, &type metadata for CacheKey);
    atomic_store(result, (unint64_t *)&qword_253F22600);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(v1 - 104) + 16))(*(_QWORD *)(v1 - 112), v0, *(_QWORD *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 128))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(*(_QWORD *)(v3 - 120), v2, v0);
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void sub_219548A9C(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3)
{
  sub_219548AB8(a1, a2, a3, (void (*)(uint64_t *__return_ptr))sub_219538D2C);
}

void sub_219548AB8(uint64_t a1, uint64_t a2, os_unfair_lock_s *a3, void (*a4)(uint64_t *__return_ptr))
{
  os_unfair_lock_s *v5;
  uint64_t v6;

  v5 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  a4(&v6);
  os_unfair_lock_unlock(v5);
}

void sub_219548B2C(_QWORD *(*a1)(uint64_t *__return_ptr), uint64_t a2, os_unfair_lock_s *a3)
{
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_21954A0F4(v6, a1, a2, &v7);
  os_unfair_lock_unlock(v5);
}

void sub_219548B9C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;

}

uint64_t sub_219548BA8()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F220A8);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_253F22008 = result;
  return result;
}

uint64_t sub_219548BDC()
{
  return swift_weakInit();
}

void static SiriNLOverridePrimaryStore.getWeakSharedTrieStore()(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v2;

  if (qword_253F21E08 != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_25_1();
  sub_219548AB8((uint64_t)sub_219548CC4, v1, v2, (void (*)(uint64_t *__return_ptr))sub_219538D2C);
}

uint64_t sub_219548C68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  if (qword_253F22010 != -1)
    swift_once();
  result = swift_weakLoadStrong();
  *a1 = result;
  return result;
}

uint64_t sub_219548CC4@<X0>(uint64_t *a1@<X8>)
{
  return sub_219548C68(a1);
}

void static SiriNLOverridePrimaryStore.sharedTrieStore.getter(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v2;

  if (qword_253F21E08 != -1)
    a1 = swift_once();
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_25_1();
  sub_219548B2C((_QWORD *(*)(uint64_t *__return_ptr))sub_219548DDC, v1, v2);
}

uint64_t sub_219548D50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  if (qword_253F22010 != -1)
    swift_once();
  result = swift_weakLoadStrong();
  v3 = result;
  if (!result)
  {
    type metadata accessor for SiriNLOverridePrimaryStore();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = 0;
    result = swift_weakAssign();
  }
  *a1 = v3;
  return result;
}

uint64_t sub_219548DDC@<X0>(uint64_t *a1@<X8>)
{
  return sub_219548D50(a1);
}

uint64_t SiriNLOverridePrimaryStore.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t SiriNLOverridePrimaryStore.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = 0;
  return result;
}

uint64_t SiriNLOverridePrimaryStore.deinit()
{
  uint64_t v0;
  id v1;

  sub_219558294();
  if (qword_253F22160 != -1)
    swift_once();
  v1 = (id)qword_253F221A8;
  OUTLINED_FUNCTION_77();

  return v0;
}

uint64_t SiriNLOverridePrimaryStore.__deallocating_deinit()
{
  SiriNLOverridePrimaryStore.deinit();
  return swift_deallocClassInstance();
}

BOOL sub_219548EDC()
{
  id v0;
  uint64_t v1;
  id v2;
  id v3;

  sub_219532C2C(0, &qword_253F22060);
  swift_bridgeObjectRetain();
  v0 = sub_219538EE8();
  v1 = (uint64_t)v0;
  if (v0)
  {
    v2 = v0;
    sub_219548B9C(v1);
    sub_2195582A0();
    if (qword_253F22160 != -1)
      swift_once();
    v3 = (id)qword_253F221A8;
    OUTLINED_FUNCTION_77();

  }
  else
  {
    sub_2195582AC();
    if (qword_253F22160 != -1)
      swift_once();
    v2 = (id)qword_253F221A8;
    OUTLINED_FUNCTION_77();
  }

  return v1 != 0;
}

BOOL sub_219549040()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16) != 0;
}

uint64_t sub_219549050(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21FD8);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_12_3();
  v6 = sub_219557424();
  v44 = *(_QWORD *)(v6 - 8);
  v45 = v6;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_9_0();
  v10 = v9 - v8;
  v46 = sub_2195573F4();
  v42 = *(_QWORD *)(v46 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_11_4(v12, v40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22168);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_5_7();
  v14 = *(void **)(v1 + 16);
  if (v14)
  {
    v15 = sub_21955743C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v2, a1, v15);
    __swift_storeEnumTagSinglePayload(v2, 0, 1, v15);
    sub_21952E2D0();
    v16 = v14;
    sub_21955830C();
    sub_21952F3F8(v2, &qword_253F22168);
    sub_2195582F4();
    swift_bridgeObjectRelease();
    v17 = (void *)sub_219558174();
    sub_2195573DC();
    v18 = (void *)sub_219558174();
    swift_bridgeObjectRelease();
    v43 = v16;
    v19 = objc_msgSend(v16, sel_fetchRuleId_locale_overrideNamespace_, v17, v18, sub_219557D54());

    v20 = sub_219558258();
    sub_219557430();
    sub_219557418();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v10, v45);
    if (__swift_getEnumTagSinglePayload(v3, 1, v46) == 1)
    {
      swift_bridgeObjectRelease();
      sub_21952F3F8(v3, &qword_253F21FD8);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 32))(v41, v3, v46);
      v23 = (void *)sub_219558174();
      swift_bridgeObjectRelease();
      sub_2195573E8();
      v24 = (void *)sub_219558174();
      swift_bridgeObjectRelease();
      v25 = objc_msgSend(v43, sel_fetchRuleId_locale_overrideNamespace_, v23, v24, sub_219557D54());

      sub_219558258();
      sub_21952E050();
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v46);
    }
    v22 = sub_219549A3C(v20);
    swift_bridgeObjectRelease();
    sub_219558294();
    if (qword_253F22160 != -1)
      swift_once();
    v26 = (void *)qword_253F221A8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_2195590A0;
    v28 = *(_QWORD *)(v22 + 16);
    v29 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v27 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v27 + 64) = v29;
    *(_QWORD *)(v27 + 32) = v28;
    v30 = type metadata accessor for SiriNLOverride();
    v31 = v26;
    v32 = MEMORY[0x219A2E628](v22, v30);
    v34 = v33;
    *(_QWORD *)(v27 + 96) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v27 + 104) = sub_21952E30C();
    *(_QWORD *)(v27 + 72) = v32;
    *(_QWORD *)(v27 + 80) = v34;
    sub_219558138();

    swift_bridgeObjectRelease();
    sub_2195495E4();
    sub_21952E10C();
    sub_219558294();
    v35 = (void *)qword_253F221A8;
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_219558D80;
    v37 = *(_QWORD *)(v22 + 16);
    *(_QWORD *)(v36 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v36 + 64) = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v36 + 32) = v37;
    v38 = v35;
    sub_219558138();

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2195582AC();
    if (qword_253F22160 != -1)
      swift_once();
    v21 = (id)qword_253F221A8;
    v22 = MEMORY[0x24BEE4AF8];
    sub_219558138();

  }
  return v22;
}

void sub_2195495E4()
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
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;

  OUTLINED_FUNCTION_62();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F21FD8);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_5_7();
  v7 = sub_219557424();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_12_3();
  v9 = sub_2195573F4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_9_0();
  v13 = v12 - v11;
  type metadata accessor for RegexOverrideCache();
  v37 = sub_21952E368(v5, v3);
  if (v37)
  {
    sub_219558294();
    if (qword_253F22160 != -1)
      swift_once();
    v14 = (void *)qword_253F221A8;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
    v15 = OUTLINED_FUNCTION_8();
    *(_OWORD *)(v15 + 16) = xmmword_219558D80;
    v16 = *(_QWORD *)(v37 + 16);
    v17 = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v15 + 64) = v17;
    *(_QWORD *)(v15 + 32) = v16;
    v18 = v14;
    OUTLINED_FUNCTION_36_1();

    OUTLINED_FUNCTION_3_1();
  }
  else
  {
    v36 = v10;
    v19 = *(void **)(v0 + 16);
    if (v19)
    {
      v20 = v19;
      sub_2195573DC();
      v21 = (void *)sub_219558174();
      OUTLINED_FUNCTION_10();
      v22 = v3;
      v23 = v5;
      v24 = objc_msgSend(v20, sel_fetchRegexRuleIds_overrideNamespace_, v21, sub_219557D54());

      v25 = sub_219558258();
      sub_219557430();
      sub_219557418();
      OUTLINED_FUNCTION_50(v8);
      OUTLINED_FUNCTION_39_1(v1, 1, v9);
      if (v26)
      {
        sub_21952F3F8(v1, &qword_253F21FD8);
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v13, v1, v9);
        sub_2195573E8();
        v28 = (void *)sub_219558174();
        OUTLINED_FUNCTION_3_1();
        v29 = objc_msgSend(v20, sel_fetchRegexRuleIds_overrideNamespace_, v28, sub_219557D54());

        sub_219558258();
        sub_21952E050();
        OUTLINED_FUNCTION_32_1(*(uint64_t (**)(uint64_t, uint64_t))(v36 + 8));
      }
      swift_bridgeObjectRetain();
      v30 = sub_219549A3C(v25);
      OUTLINED_FUNCTION_81();
      swift_bridgeObjectRelease();
      sub_219558294();
      if (qword_253F22160 != -1)
        swift_once();
      v31 = (void *)qword_253F221A8;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F22670);
      v32 = OUTLINED_FUNCTION_8();
      *(_OWORD *)(v32 + 16) = xmmword_219558D80;
      v33 = *(_QWORD *)(v30 + 16);
      v34 = MEMORY[0x24BEE17F0];
      *(_QWORD *)(v32 + 56) = MEMORY[0x24BEE1768];
      *(_QWORD *)(v32 + 64) = v34;
      *(_QWORD *)(v32 + 32) = v33;
      v35 = v31;
      sub_219558138();

      OUTLINED_FUNCTION_81();
      sub_21953B624(v23, v22);

    }
    else
    {
      sub_2195582AC();
      if (qword_253F22160 != -1)
        swift_once();
      v27 = (id)qword_253F221A8;
      OUTLINED_FUNCTION_34_1();

    }
  }
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_219549A3C(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(v1 + 16))
  {
    MEMORY[0x24BDAC7A8](a1);
    v3 = v2;
    v4 = sub_219530790();

  }
  else
  {
    sub_2195582AC();
    if (qword_253F22160 != -1)
      swift_once();
    v5 = (id)qword_253F221A8;
    v4 = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_36_1();

  }
  return v4;
}

uint64_t sub_219549B40@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
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
  id v39;
  uint64_t v41[2];
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v49 = a5;
  v50 = a4;
  v46 = a3;
  v53 = a6;
  v8 = sub_219557D60();
  v47 = *(_QWORD *)(v8 - 8);
  v48 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_219557D84();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a1;
  v16 = a1[1];
  v17 = (void *)sub_219558174();
  v18 = objc_msgSend(a2, sel_fetchSerializedNluRequestRule_, v17);

  if (!v18)
  {
    sub_2195582AC();
    if (qword_253F22160 != -1)
      swift_once();
    v39 = (id)qword_253F221A8;
    sub_219558138();
    goto LABEL_16;
  }
  v19 = sub_219557370();
  v51 = v20;
  v52 = v19;

  v21 = (void *)sub_219558174();
  v22 = objc_msgSend(a2, sel_fetchOverrideId_, v21);

  if (!v22)
  {
    sub_2195582AC();
    if (qword_253F22160 == -1)
      goto LABEL_15;
    goto LABEL_22;
  }
  v45 = v15;
  v44 = sub_219558180();
  v24 = v23;
  v25 = objc_msgSend(a2, sel_fetchSerializedUserParse_, v22);
  if (!v25)
  {
    swift_bridgeObjectRelease();

    sub_2195582AC();
    if (qword_253F22160 == -1)
    {
LABEL_15:
      v39 = (id)qword_253F221A8;
      sub_219558138();
      sub_21952EE5C(v52, v51);
LABEL_16:

      v36 = type metadata accessor for SiriNLOverride();
      v37 = v53;
      v38 = 1;
      return __swift_storeEnumTagSinglePayload(v37, v38, 1, v36);
    }
LABEL_22:
    swift_once();
    goto LABEL_15;
  }
  v26 = v25;
  v27 = sub_219557370();
  v42 = v28;
  v43 = v27;

  v41[1] = (uint64_t)objc_msgSend(a2, sel_fetchOverrideTimeStamp_, v22);
  v29 = v50;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v49 = sub_2195573DC();
  v41[0] = v30;
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BE9CE18], v11);
  v31 = sub_219557D54();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (v31 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v31 > 0x7FFFFFFF)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v33 = v47;
  v32 = v48;
  (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v10, *MEMORY[0x24BE9CDD8], v48);
  v34 = sub_219557D54();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v32);
  if (v34 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v34 > 0x7FFFFFFF)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v35 = v53;
  SiriNLOverride.init(inputText:ruleId:locale:namespace:source:overrideId:parse:ruleData:utteranceComparisonType:timeStamp:)(v46, v29, v45, v16, v49, v41[0], v31, v34, v53, v44, v24, v43, v42, v52, v51, 1);
  v36 = type metadata accessor for SiriNLOverride();
  v37 = v35;
  v38 = 0;
  return __swift_storeEnumTagSinglePayload(v37, v38, 1, v36);
}

uint64_t sub_219549FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21954A008()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253F22250;
  if (!qword_253F22250)
  {
    v1 = sub_219557FDC();
    result = MEMORY[0x219A2EE44](MEMORY[0x24BE9DD10], v1);
    atomic_store(result, (unint64_t *)&qword_253F22250);
  }
  return result;
}

uint64_t sub_21954A048(uint64_t a1, uint64_t a2)
{
  uint64_t matched;

  matched = type metadata accessor for OverrideMatchResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(matched - 8) + 32))(a2, a1, matched);
  return a2;
}

uint64_t type metadata accessor for SiriNLOverridePrimaryStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriNLOverridePrimaryStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.isOverrideTrieBundleLoaded()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SiriNLOverridePrimaryStore.matchCandidateOverrides(inputs:candidateOverrides:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t sub_21954A0D8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_219549B40(a1, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

_QWORD *sub_21954A0F4@<X0>(uint64_t a1@<X0>, _QWORD *(*a2)(uint64_t *__return_ptr)@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  _QWORD *result;

  result = sub_219538D54(a1, a2, a3);
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return sub_219557F7C();
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_9_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_11_4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 144) + 8))(*(_QWORD *)(v0 - 152), *(_QWORD *)(v0 - 184));
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  unint64_t v0;
  uint64_t v1;

  return sub_21953AA68(v1, v0);
}

uint64_t OUTLINED_FUNCTION_24_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_26_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 - 256) = v1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_27_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_32_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_39_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

void UtteranceRuleMatchResult.init(matched:comparisonType:allUdaSpanNodes:textCheckingResult:)(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _BYTE *a5@<X8>)
{
  int *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;

  v10 = (int *)OUTLINED_FUNCTION_15_2();
  v11 = v10[6];
  *a5 = a1;
  *(_QWORD *)&a5[v11] = a3;
  v12 = &a5[v10[5]];
  v13 = OUTLINED_FUNCTION_13_3();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v12, a2, v13);
  *(_QWORD *)&a5[v10[7]] = a4;
  OUTLINED_FUNCTION_20_3();
}

uint64_t sub_21954A30C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21954A324(a1, type metadata accessor for OverrideMatchResultAndParse, a2);
}

uint64_t sub_21954A318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21954A324(a1, type metadata accessor for OverrideMatchResult, a2);
}

uint64_t sub_21954A324@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = OUTLINED_FUNCTION_27_2(a1, a2);
  if (v6)
  {
    OUTLINED_FUNCTION_26_2();
    sub_21952EC78(a1 + v8, a3, a2);
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a3, v9, 1, v7);
}

uint64_t sub_21954A394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC8);
  if (v4)
  {
    OUTLINED_FUNCTION_26_2();
    OUTLINED_FUNCTION_24_2(a1 + v6, v7, &qword_25508CEC8);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return OUTLINED_FUNCTION_2_7(a2, v8, 1, v5);
}

void TurnInputRuleMatchResult.init(matched:utteranceRuleMatchResult:userDialogActs:)(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  v8 = OUTLINED_FUNCTION_12_2();
  v9 = *(int *)(v8 + 24);
  *a4 = a1;
  sub_21954A444(a2, (uint64_t)&a4[*(int *)(v8 + 20)]);
  *(_QWORD *)&a4[v9] = a3;
  OUTLINED_FUNCTION_20_3();
}

uint64_t sub_21954A444(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void OverrideMatchResult.override.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21952EC78(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for SiriNLOverride);
}

uint64_t OverrideMatchResult.matched.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for OverrideMatchResult(0) + 20));
}

uint64_t OverrideMatchResult.turnInputMatchResults.getter()
{
  type metadata accessor for OverrideMatchResult(0);
  return swift_bridgeObjectRetain();
}

uint64_t OverrideMatchResult.userDialogActs.getter()
{
  type metadata accessor for OverrideMatchResult(0);
  return swift_bridgeObjectRetain();
}

void OverrideMatchResult.userDialogActs.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(type metadata accessor for OverrideMatchResult(0) + 28);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  OUTLINED_FUNCTION_41();
}

uint64_t (*OverrideMatchResult.userDialogActs.modify())()
{
  type metadata accessor for OverrideMatchResult(0);
  return nullsub_1;
}

void sub_21954A56C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_15(v2);
  OUTLINED_FUNCTION_99();
}

uint64_t TurnInputRuleMatchResult.matched.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void TurnInputRuleMatchResult.utteranceRuleMatchResult.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_12_2();
  OUTLINED_FUNCTION_24_2(v0 + *(int *)(v1 + 20), v2, &qword_25508CF18);
}

uint64_t TurnInputRuleMatchResult.userDialogActs.getter()
{
  return sub_21954A670((void (*)(_QWORD))type metadata accessor for TurnInputRuleMatchResult);
}

void TurnInputRuleMatchResult.userDialogActs.setter(uint64_t a1)
{
  sub_21954A6A0(a1, type metadata accessor for TurnInputRuleMatchResult);
}

uint64_t (*TurnInputRuleMatchResult.userDialogActs.modify())()
{
  OUTLINED_FUNCTION_12_2();
  return nullsub_1;
}

uint64_t UtteranceRuleMatchResult.matched.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*UtteranceRuleMatchResult.matched.modify())()
{
  return nullsub_1;
}

uint64_t UtteranceRuleMatchResult.comparisonType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_15_2() + 20);
  v4 = OUTLINED_FUNCTION_13_3();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t UtteranceRuleMatchResult.allUdaSpanNodes.getter()
{
  return sub_21954A670((void (*)(_QWORD))type metadata accessor for UtteranceRuleMatchResult);
}

uint64_t sub_21954A670(void (*a1)(_QWORD))
{
  a1(0);
  return swift_bridgeObjectRetain();
}

void UtteranceRuleMatchResult.allUdaSpanNodes.setter(uint64_t a1)
{
  sub_21954A6A0(a1, type metadata accessor for UtteranceRuleMatchResult);
}

void sub_21954A6A0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(int *)(OUTLINED_FUNCTION_27_2(a1, a2) + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  OUTLINED_FUNCTION_41();
}

uint64_t (*UtteranceRuleMatchResult.allUdaSpanNodes.modify())()
{
  OUTLINED_FUNCTION_15_2();
  return nullsub_1;
}

void UtteranceRuleMatchResult.textCheckingResult.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_15_2() + 28));
  OUTLINED_FUNCTION_99();
}

_QWORD *initializeBufferWithCopyOfBuffer for OverrideMatchResult(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _OWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    a1[6] = a2[6];
    v10 = (int *)type metadata accessor for SiriNLOverride();
    v11 = v10[9];
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_2195573AC();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
    }
    *((_BYTE *)v4 + v10[10]) = *((_BYTE *)a2 + v10[10]);
    v17 = v10[11];
    v18 = (_QWORD *)((char *)v4 + v17);
    v19 = (_QWORD *)((char *)a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = v10[12];
    v22 = (char *)v4 + v21;
    v23 = (_OWORD *)((char *)a2 + v21);
    v24 = *(_QWORD *)((char *)a2 + v21 + 8);
    swift_bridgeObjectRetain();
    if (v24 >> 60 == 15)
    {
      *(_OWORD *)v22 = *v23;
    }
    else
    {
      v25 = *(_QWORD *)v23;
      sub_21952E944(v25, v24);
      *(_QWORD *)v22 = v25;
      *((_QWORD *)v22 + 1) = v24;
    }
    *(_DWORD *)((char *)v4 + v10[13]) = *(_DWORD *)((char *)a2 + v10[13]);
    v26 = v10[14];
    v27 = (char *)v4 + v26;
    v28 = (char *)a2 + v26;
    v29 = *((_QWORD *)v28 + 1);
    if (v29 >> 60 == 15)
    {
      *(_OWORD *)v27 = *(_OWORD *)v28;
    }
    else
    {
      v30 = *(_QWORD *)v28;
      sub_21952E944(*(_QWORD *)v28, *((_QWORD *)v28 + 1));
      *(_QWORD *)v27 = v30;
      *((_QWORD *)v27 + 1) = v29;
    }
    v31 = v10[15];
    v32 = (char *)v4 + v31;
    v33 = (char *)a2 + v31;
    v34 = sub_219557FDC();
    if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v34))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
      __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, v34);
    }
    v36 = a3[6];
    *((_BYTE *)v4 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *(_QWORD *)((char *)v4 + v36) = *(_QWORD *)((char *)a2 + v36);
    *(_QWORD *)((char *)v4 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t assignWithCopy for OverrideMatchResult(uint64_t a1, uint64_t a2, int *a3)
{
  int *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  const void *v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  v6 = (int *)type metadata accessor for SiriNLOverride();
  v7 = v6[9];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_2195573AC();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v13 = *(_QWORD *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
LABEL_7:
  *(_BYTE *)(a1 + v6[10]) = *(_BYTE *)(a2 + v6[10]);
  v15 = v6[11];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v6[12];
  v19 = (uint64_t *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v21 = *(_QWORD *)(a2 + v18 + 8);
  if (*(_QWORD *)(a1 + v18 + 8) >> 60 == 15)
  {
    if (v21 >> 60 != 15)
    {
      v22 = *v20;
      sub_21952E944(v22, v21);
      *v19 = v22;
      v19[1] = v21;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v21 >> 60 == 15)
  {
    sub_21954AD6C((uint64_t)v19);
LABEL_12:
    *(_OWORD *)v19 = *(_OWORD *)v20;
    goto LABEL_14;
  }
  v23 = *v20;
  sub_21952E944(v23, v21);
  v24 = *v19;
  v25 = v19[1];
  *v19 = v23;
  v19[1] = v21;
  sub_21952EE5C(v24, v25);
LABEL_14:
  *(_DWORD *)(a1 + v6[13]) = *(_DWORD *)(a2 + v6[13]);
  v26 = v6[14];
  v27 = (uint64_t *)(a1 + v26);
  v28 = (uint64_t *)(a2 + v26);
  v29 = *(_QWORD *)(a2 + v26 + 8);
  if (*(_QWORD *)(a1 + v26 + 8) >> 60 == 15)
  {
    if (v29 >> 60 != 15)
    {
      v30 = *v28;
      sub_21952E944(v30, v29);
      *v27 = v30;
      v27[1] = v29;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v29 >> 60 == 15)
  {
    sub_21954AD6C((uint64_t)v27);
LABEL_19:
    *(_OWORD *)v27 = *(_OWORD *)v28;
    goto LABEL_21;
  }
  v31 = *v28;
  sub_21952E944(v31, v29);
  v32 = *v27;
  v33 = v27[1];
  *v27 = v31;
  v27[1] = v29;
  sub_21952EE5C(v32, v33);
LABEL_21:
  v34 = v6[15];
  v35 = (void *)(a1 + v34);
  v36 = (const void *)(a2 + v34);
  v37 = sub_219557FDC();
  v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v37);
  v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37);
  if (!v38)
  {
    v40 = *(_QWORD *)(v37 - 8);
    if (!v39)
    {
      (*(void (**)(void *, const void *, uint64_t))(v40 + 24))(v35, v36, v37);
      goto LABEL_27;
    }
    (*(void (**)(void *, uint64_t))(v40 + 8))(v35, v37);
    goto LABEL_26;
  }
  if (v39)
  {
LABEL_26:
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    goto LABEL_27;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v35, v36, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
LABEL_27:
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21954AD6C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t initializeWithTake for OverrideMatchResult(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = (int *)type metadata accessor for SiriNLOverride();
  v8 = v7[9];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_2195573AC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  *(_OWORD *)(a1 + v7[11]) = *(_OWORD *)(a2 + v7[11]);
  *(_OWORD *)(a1 + v7[12]) = *(_OWORD *)(a2 + v7[12]);
  *(_DWORD *)(a1 + v7[13]) = *(_DWORD *)(a2 + v7[13]);
  *(_OWORD *)(a1 + v7[14]) = *(_OWORD *)(a2 + v7[14]);
  v13 = v7[15];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_219557FDC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  v18 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v18) = *(_QWORD *)(a2 + v18);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

_QWORD *assignWithTake for OverrideMatchResult(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int EnumTagSinglePayload;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  v9 = (int *)type metadata accessor for SiriNLOverride();
  v10 = v9[9];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2195573AC();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (EnumTagSinglePayload)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v16 = *(_QWORD *)(v13 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v13);
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v11, v12, v13);
LABEL_7:
  *((_BYTE *)a1 + v9[10]) = *((_BYTE *)a2 + v9[10]);
  v18 = v9[11];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = v9[12];
  v24 = (uint64_t)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = *(_QWORD *)((char *)a1 + v23 + 8);
  if (v26 >> 60 == 15)
  {
LABEL_10:
    *(_OWORD *)v24 = *(_OWORD *)v25;
    goto LABEL_12;
  }
  v27 = *((_QWORD *)v25 + 1);
  if (v27 >> 60 == 15)
  {
    sub_21954AD6C(v24);
    goto LABEL_10;
  }
  v28 = *(_QWORD *)v24;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_QWORD *)(v24 + 8) = v27;
  sub_21952EE5C(v28, v26);
LABEL_12:
  *(_DWORD *)((char *)a1 + v9[13]) = *(_DWORD *)((char *)a2 + v9[13]);
  v29 = v9[14];
  v30 = (uint64_t)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = *(_QWORD *)((char *)a1 + v29 + 8);
  if (v32 >> 60 == 15)
  {
LABEL_15:
    *(_OWORD *)v30 = *(_OWORD *)v31;
    goto LABEL_17;
  }
  v33 = *((_QWORD *)v31 + 1);
  if (v33 >> 60 == 15)
  {
    sub_21954AD6C(v30);
    goto LABEL_15;
  }
  v34 = *(_QWORD *)v30;
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *(_QWORD *)(v30 + 8) = v33;
  sub_21952EE5C(v34, v32);
LABEL_17:
  v35 = v9[15];
  v36 = (char *)a1 + v35;
  v37 = (char *)a2 + v35;
  v38 = sub_219557FDC();
  v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    v41 = *(_QWORD *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v36, v37, v38);
      goto LABEL_23;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_22;
  }
  if (v40)
  {
LABEL_22:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_23:
  v43 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v43) = *(_QWORD *)((char *)a2 + v43);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

void sub_21954B268(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriNLOverride();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    OUTLINED_FUNCTION_3_6(a1, a2, v4);
  else
    OUTLINED_FUNCTION_41();
}

void sub_21954B2D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  char v8;

  type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_22_3();
  if (v8)
  {
    OUTLINED_FUNCTION_2_7(a1, a2, a2, v7);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
    OUTLINED_FUNCTION_41();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TurnInputRuleMatchResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  int *matched;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, (uint64_t)matched))
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
    else
    {
      *v8 = *v9;
      v13 = matched[5];
      v14 = &v8[v13];
      v15 = &v9[v13];
      v16 = sub_219557AB4();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
      *(_QWORD *)&v8[matched[6]] = *(_QWORD *)&v9[matched[6]];
      v17 = matched[7];
      v18 = *(void **)&v9[v17];
      *(_QWORD *)&v8[v17] = v18;
      swift_bridgeObjectRetain();
      v19 = v18;
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, (uint64_t)matched);
    }
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return v4;
}

_BYTE *assignWithCopy for TurnInputRuleMatchResult(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  int *matched;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v21;
  _BYTE *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, (uint64_t)matched);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)matched);
  if (!EnumTagSinglePayload)
  {
    if (!v11)
    {
      *v7 = *v8;
      v21 = matched[5];
      v22 = &v7[v21];
      v23 = &v8[v21];
      v24 = sub_219557AB4();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(v22, v23, v24);
      *(_QWORD *)&v7[matched[6]] = *(_QWORD *)&v8[matched[6]];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v25 = matched[7];
      v26 = *(void **)&v7[v25];
      v27 = *(void **)&v8[v25];
      *(_QWORD *)&v7[v25] = v27;
      v28 = v27;

      goto LABEL_7;
    }
    sub_21953C660((uint64_t)v7, type metadata accessor for UtteranceRuleMatchResult);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  *v7 = *v8;
  v12 = matched[5];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = sub_219557AB4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  *(_QWORD *)&v7[matched[6]] = *(_QWORD *)&v8[matched[6]];
  v16 = matched[7];
  v17 = *(void **)&v8[v16];
  *(_QWORD *)&v7[v16] = v17;
  swift_bridgeObjectRetain();
  v18 = v17;
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)matched);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_BYTE *initializeWithTake for TurnInputRuleMatchResult(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  int *matched;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)matched))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    *v7 = *v8;
    v11 = matched[5];
    v12 = &v7[v11];
    v13 = &v8[v11];
    v14 = sub_219557AB4();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
    *(_QWORD *)&v7[matched[6]] = *(_QWORD *)&v8[matched[6]];
    *(_QWORD *)&v7[matched[7]] = *(_QWORD *)&v8[matched[7]];
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)matched);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *assignWithTake for TurnInputRuleMatchResult(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  int *matched;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  matched = (int *)type metadata accessor for UtteranceRuleMatchResult(0);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, (uint64_t)matched);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, (uint64_t)matched);
  if (!EnumTagSinglePayload)
  {
    if (!v11)
    {
      *v7 = *v8;
      v18 = matched[5];
      v19 = &v7[v18];
      v20 = &v8[v18];
      v21 = sub_219557AB4();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
      *(_QWORD *)&v7[matched[6]] = *(_QWORD *)&v8[matched[6]];
      swift_bridgeObjectRelease();
      v22 = matched[7];
      v23 = *(void **)&v7[v22];
      *(_QWORD *)&v7[v22] = *(_QWORD *)&v8[v22];

      goto LABEL_7;
    }
    sub_21953C660((uint64_t)v7, type metadata accessor for UtteranceRuleMatchResult);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  *v7 = *v8;
  v12 = matched[5];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v15 = sub_219557AB4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_QWORD *)&v7[matched[6]] = *(_QWORD *)&v8[matched[6]];
  *(_QWORD *)&v7[matched[7]] = *(_QWORD *)&v8[matched[7]];
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, (uint64_t)matched);
LABEL_7:
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  swift_bridgeObjectRelease();
  return a1;
}

void sub_21954B8B8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_DWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18) - 8) + 84) == a2)
  {
    v2 = OUTLINED_FUNCTION_23_2();
    OUTLINED_FUNCTION_3_6(v2, v3, v4);
  }
  else
  {
    OUTLINED_FUNCTION_6_7();
    OUTLINED_FUNCTION_41();
  }
}

void sub_21954B908(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF18);
  OUTLINED_FUNCTION_22_3();
  if (v7)
  {
    v8 = OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_2_7(v8, v9, v10, v11);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
    OUTLINED_FUNCTION_41();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for UtteranceRuleMatchResult(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_219557AB4();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    v12 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)v4 + v11) = (uint64_t)v12;
    swift_bridgeObjectRetain();
    v13 = v12;
  }
  return v4;
}

_BYTE *assignWithCopy for UtteranceRuleMatchResult(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_219557AB4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = *(void **)&a1[v10];
  v12 = *(void **)&a2[v10];
  *(_QWORD *)&a1[v10] = v12;
  v13 = v12;

  return a1;
}

_BYTE *initializeWithTake for UtteranceRuleMatchResult(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_219557AB4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];
  return a1;
}

_BYTE *assignWithTake for UtteranceRuleMatchResult(_BYTE *a1, _BYTE *a2, int *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  *a1 = *a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_219557AB4();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = *(void **)&a1[v10];
  *(_QWORD *)&a1[v10] = *(_QWORD *)&a2[v10];

  return a1;
}

void sub_21954BBC4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_13_3() - 8) + 84) == a2)
  {
    v2 = OUTLINED_FUNCTION_23_2();
    OUTLINED_FUNCTION_3_6(v2, v3, v4);
  }
  else
  {
    OUTLINED_FUNCTION_6_7();
    OUTLINED_FUNCTION_41();
  }
}

void sub_21954BC0C(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_22_3();
  if (v7)
  {
    v8 = OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_2_7(v8, v9, v10, v11);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
    OUTLINED_FUNCTION_41();
  }
}

void sub_21954BC58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a3);
  OUTLINED_FUNCTION_8_5(v3);
  OUTLINED_FUNCTION_99();
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  uint64_t v0;

  return sub_21953AA68(*(_QWORD *)(v0 - 424), *(_QWORD *)(v0 - 376));
}

uint64_t OUTLINED_FUNCTION_2_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_3_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  int v3;

  v2 = *(_QWORD *)(v0 + *(int *)(v1 + 24));
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  v3 = v2 - 1;
  if (v3 < 0)
    v3 = -1;
  return (v3 + 1);
}

uint64_t OUTLINED_FUNCTION_8_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

void OUTLINED_FUNCTION_9_4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_21953C660(v2, a2);
}

void OUTLINED_FUNCTION_11_5(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_21953C660(v2, a2);
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return sub_219557AB4();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + *(int *)(v1 + 20);
}

void OUTLINED_FUNCTION_24_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_21954BC58(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  unint64_t v0;
  uint64_t v1;

  return sub_21952E944(v1, v0);
}

uint64_t OUTLINED_FUNCTION_27_2(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  return a2(0);
}

uint64_t OUTLINED_FUNCTION_29_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 440))();
}

uint64_t dispatch thunk of NLOverride.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLOverride.inputText.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NLOverride.locale.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

id ParseOverride.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id ParseOverride.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for ParseOverride();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for ParseOverride()
{
  return objc_opt_self();
}

id ParseOverride.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ParseOverride();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void OverrideResult.init(replaceMatchFromMatches:turnInputAndPreprocessing:)()
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
  uint64_t matched;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;

  OUTLINED_FUNCTION_62();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF30);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_9_0();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_37_0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_18_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22450);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v14);
  v15 = OUTLINED_FUNCTION_22_4();
  matched = type metadata accessor for OverrideMatchResult(v15);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_9_0();
  v20 = v19 - v18;
  Array<A>.oldestOverride.getter(v5);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v1, 1, matched) == 1)
  {
    v21 = OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_5_8(v21);
    v22 = &qword_253F22450;
    v23 = v1;
  }
  else
  {
    sub_2195330A0(v1, v20, type metadata accessor for OverrideMatchResult);
    OverrideMatchResult.getPatchedUserParse(turnInputAndPreprocessing:)(v3, v11);
    if (__swift_getEnumTagSinglePayload(v11, 1, v12) != 1)
    {
      v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32);
      v25(v0, v11, v12);
      sub_2195575BC();
      v26 = OUTLINED_FUNCTION_0_3();
      OUTLINED_FUNCTION_5_8(v26);
      sub_21953DC64(v20, type metadata accessor for OverrideMatchResult);
      v25(v7, v0, v12);
      goto LABEL_7;
    }
    v24 = OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_5_8(v24);
    sub_21953DC64(v20, type metadata accessor for OverrideMatchResult);
    v22 = &qword_25508CF30;
    v23 = v11;
  }
  sub_21954A56C(v23, v22);
LABEL_7:
  type metadata accessor for OverrideResult(0);
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_1_0();
}

uint64_t Array<A>.oldestOverride.getter(uint64_t a1)
{
  return sub_21954C0F0(a1, type metadata accessor for OverrideMatchResult, (uint64_t (*)(uint64_t))sub_21954DB3C, (uint64_t)sub_219546470, (void (*)(uint64_t))sub_21954A318);
}

uint64_t sub_21954C0F0(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v9;

  v9 = a1;
  swift_bridgeObjectRetain();
  sub_21954C2A0(&v9, a2, a3);
  a5(v9);
  return swift_release();
}

void sub_21954C178()
{
  sub_21954C194();
}

void sub_21954C194()
{
  uint64_t v0;
  char v1;
  void (*v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  char v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_46_1();
  if ((v7 & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_49_0();
      if (v9)
      {
LABEL_23:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_2();
    }
  }
  else
  {
    v8 = v5;
  }
  v11 = *(_QWORD *)(v0 + 16);
  if (v8 <= v11)
    v12 = *(_QWORD *)(v0 + 16);
  else
    v12 = v8;
  if (!v12)
    goto LABEL_17;
  __swift_instantiateConcreteTypeFromMangledName(v6);
  v2(0);
  v13 = (_QWORD *)OUTLINED_FUNCTION_7_5();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v3)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v14 - v4 == 0x8000000000000000 && v3 == -1)
    goto LABEL_22;
  v13[2] = v11;
  v13[3] = 2 * ((uint64_t)(v14 - v4) / v3);
LABEL_17:
  v2(0);
  OUTLINED_FUNCTION_23_3();
  if ((v1 & 1) != 0)
  {
    OUTLINED_FUNCTION_52_1(v16, v17);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_33_1();
  }
  OUTLINED_FUNCTION_28_1();
  OUTLINED_FUNCTION_1_0();
}

void sub_21954C268()
{
  sub_21952EA84();
}

void sub_21954C284()
{
  sub_21952EA84();
}

void sub_21954C2A0(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t))
{
  uint64_t v5;

  a2(0);
  v5 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = a3(v5);
  sub_21953C934();
  *a1 = v5;
}

uint64_t *initializeBufferWithCopyOfBuffer for OverrideResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;

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
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        return a1;
      }
      v8 = sub_219557604();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *assignWithCopy for OverrideResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_21953DC64((uint64_t)a1, type metadata accessor for OverrideResult);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
      }
      v7 = sub_219557604();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *initializeWithTake for OverrideResult(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_219557604();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *assignWithTake for OverrideResult(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21953DC64((uint64_t)a1, type metadata accessor for OverrideResult);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_219557604();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_21954C60C()
{
  return swift_storeEnumTagMultiPayload();
}

_QWORD *sub_21954C61C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _OWORD *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int *matched;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    a1[6] = a2[6];
    v10 = (int *)type metadata accessor for SiriNLOverride();
    v11 = v10[9];
    v12 = (char *)v4 + v11;
    v13 = (char *)a2 + v11;
    v14 = sub_2195573AC();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
    }
    *((_BYTE *)v4 + v10[10]) = *((_BYTE *)a2 + v10[10]);
    v17 = v10[11];
    v18 = (_QWORD *)((char *)v4 + v17);
    v19 = (_QWORD *)((char *)a2 + v17);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = v10[12];
    v22 = (char *)v4 + v21;
    v23 = (_OWORD *)((char *)a2 + v21);
    v24 = *(_QWORD *)((char *)a2 + v21 + 8);
    swift_bridgeObjectRetain();
    if (v24 >> 60 == 15)
    {
      *(_OWORD *)v22 = *v23;
    }
    else
    {
      v25 = *(_QWORD *)v23;
      sub_21952E944(v25, v24);
      *(_QWORD *)v22 = v25;
      *((_QWORD *)v22 + 1) = v24;
    }
    *(_DWORD *)((char *)v4 + v10[13]) = *(_DWORD *)((char *)a2 + v10[13]);
    v26 = v10[14];
    v27 = (char *)v4 + v26;
    v28 = (char *)a2 + v26;
    v29 = *((_QWORD *)v28 + 1);
    if (v29 >> 60 == 15)
    {
      *(_OWORD *)v27 = *(_OWORD *)v28;
    }
    else
    {
      v30 = *(_QWORD *)v28;
      sub_21952E944(*(_QWORD *)v28, *((_QWORD *)v28 + 1));
      *(_QWORD *)v27 = v30;
      *((_QWORD *)v27 + 1) = v29;
    }
    v31 = v10[15];
    v32 = (char *)v4 + v31;
    v33 = (char *)a2 + v31;
    v34 = sub_219557FDC();
    if (__swift_getEnumTagSinglePayload((uint64_t)v33, 1, v34))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
      __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, v34);
    }
    matched = (int *)type metadata accessor for OverrideMatchResult(0);
    *((_BYTE *)v4 + matched[5]) = *((_BYTE *)a2 + matched[5]);
    *(_QWORD *)((char *)v4 + matched[6]) = *(_QWORD *)((char *)a2 + matched[6]);
    *(_QWORD *)((char *)v4 + matched[7]) = *(_QWORD *)((char *)a2 + matched[7]);
    v37 = *(int *)(a3 + 20);
    v38 = (char *)v4 + v37;
    v39 = (char *)a2 + v37;
    v40 = sub_219557604();
    v41 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v41(v38, v39, v40);
  }
  return v4;
}

uint64_t sub_21954C8E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  const void *v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int *matched;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  v6 = (int *)type metadata accessor for SiriNLOverride();
  v7 = v6[9];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_2195573AC();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v13 = *(_QWORD *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(void *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v13 + 24))(v8, v9, v10);
LABEL_7:
  *(_BYTE *)(a1 + v6[10]) = *(_BYTE *)(a2 + v6[10]);
  v15 = v6[11];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v6[12];
  v19 = (uint64_t *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v21 = *(_QWORD *)(a2 + v18 + 8);
  if (*(_QWORD *)(a1 + v18 + 8) >> 60 == 15)
  {
    if (v21 >> 60 != 15)
    {
      v22 = *v20;
      sub_21952E944(v22, v21);
      *v19 = v22;
      v19[1] = v21;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v21 >> 60 == 15)
  {
    sub_21954AD6C((uint64_t)v19);
LABEL_12:
    *(_OWORD *)v19 = *(_OWORD *)v20;
    goto LABEL_14;
  }
  v23 = *v20;
  sub_21952E944(v23, v21);
  v24 = *v19;
  v25 = v19[1];
  *v19 = v23;
  v19[1] = v21;
  sub_21952EE5C(v24, v25);
LABEL_14:
  *(_DWORD *)(a1 + v6[13]) = *(_DWORD *)(a2 + v6[13]);
  v26 = v6[14];
  v27 = (uint64_t *)(a1 + v26);
  v28 = (uint64_t *)(a2 + v26);
  v29 = *(_QWORD *)(a2 + v26 + 8);
  if (*(_QWORD *)(a1 + v26 + 8) >> 60 == 15)
  {
    if (v29 >> 60 != 15)
    {
      v30 = *v28;
      sub_21952E944(v30, v29);
      *v27 = v30;
      v27[1] = v29;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v29 >> 60 == 15)
  {
    sub_21954AD6C((uint64_t)v27);
LABEL_19:
    *(_OWORD *)v27 = *(_OWORD *)v28;
    goto LABEL_21;
  }
  v31 = *v28;
  sub_21952E944(v31, v29);
  v32 = *v27;
  v33 = v27[1];
  *v27 = v31;
  v27[1] = v29;
  sub_21952EE5C(v32, v33);
LABEL_21:
  v34 = v6[15];
  v35 = (void *)(a1 + v34);
  v36 = (const void *)(a2 + v34);
  v37 = sub_219557FDC();
  v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v37);
  v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37);
  if (!v38)
  {
    v40 = *(_QWORD *)(v37 - 8);
    if (!v39)
    {
      (*(void (**)(void *, const void *, uint64_t))(v40 + 24))(v35, v36, v37);
      goto LABEL_27;
    }
    (*(void (**)(void *, uint64_t))(v40 + 8))(v35, v37);
    goto LABEL_26;
  }
  if (v39)
  {
LABEL_26:
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    goto LABEL_27;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v37 - 8) + 16))(v35, v36, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
LABEL_27:
  matched = (int *)type metadata accessor for OverrideMatchResult(0);
  *(_BYTE *)(a1 + matched[5]) = *(_BYTE *)(a2 + matched[5]);
  *(_QWORD *)(a1 + matched[6]) = *(_QWORD *)(a2 + matched[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + matched[7]) = *(_QWORD *)(a2 + matched[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v43 = *(int *)(a3 + 20);
  v44 = a1 + v43;
  v45 = a2 + v43;
  v46 = sub_219557604();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 24))(v44, v45, v46);
  return a1;
}

uint64_t sub_21954CCE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  int *matched;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = (int *)type metadata accessor for SiriNLOverride();
  v8 = v7[9];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_2195573AC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  *(_BYTE *)(a1 + v7[10]) = *(_BYTE *)(a2 + v7[10]);
  *(_OWORD *)(a1 + v7[11]) = *(_OWORD *)(a2 + v7[11]);
  *(_OWORD *)(a1 + v7[12]) = *(_OWORD *)(a2 + v7[12]);
  *(_DWORD *)(a1 + v7[13]) = *(_DWORD *)(a2 + v7[13]);
  *(_OWORD *)(a1 + v7[14]) = *(_OWORD *)(a2 + v7[14]);
  v13 = v7[15];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_219557FDC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  }
  matched = (int *)type metadata accessor for OverrideMatchResult(0);
  *(_BYTE *)(a1 + matched[5]) = *(_BYTE *)(a2 + matched[5]);
  *(_QWORD *)(a1 + matched[6]) = *(_QWORD *)(a2 + matched[6]);
  *(_QWORD *)(a1 + matched[7]) = *(_QWORD *)(a2 + matched[7]);
  v19 = *(int *)(a3 + 20);
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = sub_219557604();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v20, v21, v22);
  return a1;
}

_QWORD *sub_21954CED4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  int EnumTagSinglePayload;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int *matched;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  v9 = (int *)type metadata accessor for SiriNLOverride();
  v10 = v9[9];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_2195573AC();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v13);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13);
  if (EnumTagSinglePayload)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v16 = *(_QWORD *)(v13 - 8);
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v13);
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v11, v12, v13);
LABEL_7:
  *((_BYTE *)a1 + v9[10]) = *((_BYTE *)a2 + v9[10]);
  v18 = v9[11];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = v9[12];
  v24 = (uint64_t)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = *(_QWORD *)((char *)a1 + v23 + 8);
  if (v26 >> 60 == 15)
  {
LABEL_10:
    *(_OWORD *)v24 = *(_OWORD *)v25;
    goto LABEL_12;
  }
  v27 = *((_QWORD *)v25 + 1);
  if (v27 >> 60 == 15)
  {
    sub_21954AD6C(v24);
    goto LABEL_10;
  }
  v28 = *(_QWORD *)v24;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *(_QWORD *)(v24 + 8) = v27;
  sub_21952EE5C(v28, v26);
LABEL_12:
  *(_DWORD *)((char *)a1 + v9[13]) = *(_DWORD *)((char *)a2 + v9[13]);
  v29 = v9[14];
  v30 = (uint64_t)a1 + v29;
  v31 = (char *)a2 + v29;
  v32 = *(_QWORD *)((char *)a1 + v29 + 8);
  if (v32 >> 60 == 15)
  {
LABEL_15:
    *(_OWORD *)v30 = *(_OWORD *)v31;
    goto LABEL_17;
  }
  v33 = *((_QWORD *)v31 + 1);
  if (v33 >> 60 == 15)
  {
    sub_21954AD6C(v30);
    goto LABEL_15;
  }
  v34 = *(_QWORD *)v30;
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *(_QWORD *)(v30 + 8) = v33;
  sub_21952EE5C(v34, v32);
LABEL_17:
  v35 = v9[15];
  v36 = (char *)a1 + v35;
  v37 = (char *)a2 + v35;
  v38 = sub_219557FDC();
  v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v38);
  v40 = __swift_getEnumTagSinglePayload((uint64_t)v37, 1, v38);
  if (!v39)
  {
    v41 = *(_QWORD *)(v38 - 8);
    if (!v40)
    {
      (*(void (**)(char *, char *, uint64_t))(v41 + 40))(v36, v37, v38);
      goto LABEL_23;
    }
    (*(void (**)(char *, uint64_t))(v41 + 8))(v36, v38);
    goto LABEL_22;
  }
  if (v40)
  {
LABEL_22:
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
    goto LABEL_23;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
  __swift_storeEnumTagSinglePayload((uint64_t)v36, 0, 1, v38);
LABEL_23:
  matched = (int *)type metadata accessor for OverrideMatchResult(0);
  *((_BYTE *)a1 + matched[5]) = *((_BYTE *)a2 + matched[5]);
  *(_QWORD *)((char *)a1 + matched[6]) = *(_QWORD *)((char *)a2 + matched[6]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + matched[7]) = *(_QWORD *)((char *)a2 + matched[7]);
  swift_bridgeObjectRelease();
  v44 = *(int *)(a3 + 20);
  v45 = (char *)a1 + v44;
  v46 = (char *)a2 + v44;
  v47 = sub_219557604();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v47 - 8) + 40))(v45, v46, v47);
  return a1;
}

uint64_t sub_21954D220(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_43_0();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
  {
    v7 = v6;
    v8 = v4;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_37_0();
    v8 = v4 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, v3, v7);
}

uint64_t sub_21954D278(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_43_0();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = v5;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_37_0();
    v10 = v5 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, v4, v4, v9);
}

uint64_t sub_21954D2D8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(unint64_t, int64_t, unint64_t);
  void (*v3)(unint64_t, int64_t, unint64_t);
  uint64_t (*v4)(_QWORD);
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
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
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  BOOL v42;
  int64_t v43;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  int EnumTagSinglePayload;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(unint64_t, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v67;
  BOOL v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t);
  unint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  _BOOL4 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  uint64_t v96;
  void (*v97)(uint64_t, uint64_t);
  uint64_t v98;
  unint64_t v99;
  unint64_t v101;
  BOOL v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t (*v109)(_QWORD);
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;

  OUTLINED_FUNCTION_45_1();
  v126 = v0;
  v127 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v14);
  v112 = (char *)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_19_0();
  v116 = v17;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_19_0();
  v111 = v19;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_23();
  v108 = v21;
  v122 = OUTLINED_FUNCTION_58_0();
  v22 = *(_QWORD *)(v122 - 8);
  MEMORY[0x24BDAC7A8](v122);
  OUTLINED_FUNCTION_3();
  v107 = v23;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_19_0();
  v110 = v25;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_19_0();
  v106 = v27;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_23();
  v115 = v29;
  v118 = v5(0);
  MEMORY[0x24BDAC7A8](v118);
  OUTLINED_FUNCTION_59_0();
  v114 = v30;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v31);
  v120 = (unint64_t)&v104 - v32;
  OUTLINED_FUNCTION_2_2();
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v104 - v35;
  result = MEMORY[0x24BDAC7A8](v34);
  v113 = (uint64_t)&v104 - v38;
  v40 = *(_QWORD *)(v39 + 72);
  if (!v40)
  {
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    __break(1u);
    return result;
  }
  v41 = v11 - v13;
  v42 = v11 - v13 == 0x8000000000000000 && v40 == -1;
  if (v42)
    goto LABEL_85;
  v43 = v9 - v11;
  if (v9 - v11 == 0x8000000000000000 && v40 == -1)
    goto LABEL_86;
  v45 = v13;
  v121 = v9;
  v46 = v41 / v40;
  v125 = v13;
  v124 = v7;
  v47 = v43 / v40;
  v117 = v22;
  if (v41 / v40 >= v43 / v40)
  {
    v115 = v45;
    v3(v11, v43 / v40, v7);
    v74 = v7 + v47 * v40;
    v123 = v74;
    v125 = v11;
    v75 = v116;
    v76 = v47 * v40 < 1 || v115 >= v11;
    v77 = v114;
    if (!v76)
    {
      v78 = -v40;
      v109 = v5;
      v105 = v7;
      v119 = -v40;
      do
      {
        v79 = v74 + v78;
        v80 = v78;
        v81 = v120;
        v82 = v121;
        OUTLINED_FUNCTION_32_2(v79, v120);
        v83 = v11 + v80;
        OUTLINED_FUNCTION_32_2(v11 + v80, v77);
        v84 = OUTLINED_FUNCTION_18_4();
        sub_219547394(v81 + *(int *)(v84 + 36), v75);
        OUTLINED_FUNCTION_39_1(v75, 1, v122);
        if (v42)
        {
          sub_21954A56C(v75, (uint64_t *)&unk_253F220D8);
          v85 = 0;
        }
        else
        {
          v121 = v11;
          v86 = v122;
          v87 = v117;
          v88 = v75;
          v89 = *(void (**)(uint64_t, uint64_t, uint64_t))(v117 + 32);
          v90 = v110;
          v89(v110, v88, v122);
          v91 = v77 + *(int *)(v84 + 36);
          v92 = (uint64_t)v112;
          OUTLINED_FUNCTION_30_2(v91);
          v93 = OUTLINED_FUNCTION_41_0();
          OUTLINED_FUNCTION_39_1(v93, v94, v86);
          if (v95)
          {
            (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v90, v86);
            sub_21954A56C(v92, (uint64_t *)&unk_253F220D8);
            v85 = 0;
          }
          else
          {
            v96 = v107;
            v89(v107, v92, v86);
            v85 = sub_2195573A0() == -1;
            v97 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
            v98 = v96;
            v7 = v105;
            v97(v98, v86);
            v97(v90, v86);
          }
          v5 = v109;
          v77 = v114;
          v11 = v121;
        }
        v78 = v119;
        v99 = v82 + v119;
        OUTLINED_FUNCTION_8_6(v77);
        OUTLINED_FUNCTION_8_6(v120);
        v121 = v99;
        if (v85)
        {
          if (v82 < v11 || v99 >= v11)
          {
            OUTLINED_FUNCTION_9_5();
          }
          else if (v82 != v11)
          {
            OUTLINED_FUNCTION_10_4();
          }
          v125 += v78;
        }
        else
        {
          v101 = v123;
          v123 += v78;
          if (v82 < v101 || v99 >= v101)
          {
            OUTLINED_FUNCTION_9_5();
          }
          else if (v82 != v101)
          {
            OUTLINED_FUNCTION_10_4();
          }
          v83 = v11;
        }
        v74 = v123;
        v75 = v116;
        v103 = v123 > v7 && v83 > v115;
        v11 = v83;
      }
      while (v103);
    }
  }
  else
  {
    v3(v45, v41 / v40, v7);
    v48 = v7 + v46 * v40;
    v123 = v48;
    v49 = v46 * v40 < 1 || v11 >= v121;
    v50 = v40;
    v51 = v108;
    v52 = v113;
    if (!v49)
    {
      v119 = v50;
      v120 = v48;
      v53 = v115;
      while (1)
      {
        OUTLINED_FUNCTION_32_2(v11, v52);
        OUTLINED_FUNCTION_32_2(v7, (uint64_t)v36);
        v54 = OUTLINED_FUNCTION_18_4();
        sub_219547394(v52 + *(int *)(v54 + 36), v51);
        EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v51, 1, v122);
        v56 = v51;
        if (EnumTagSinglePayload == 1)
          goto LABEL_20;
        v57 = v117;
        v58 = *(void (**)(unint64_t, uint64_t, uint64_t))(v117 + 32);
        v59 = (uint64_t)v36;
        v60 = v122;
        v58(v53, v51, v122);
        v61 = v59 + *(int *)(v54 + 36);
        v62 = v111;
        OUTLINED_FUNCTION_29_2(v61);
        OUTLINED_FUNCTION_39_1(v62, 1, v60);
        if (v42)
          break;
        v69 = v106;
        v70 = v122;
        v58(v106, v62, v122);
        v71 = sub_2195573A0();
        v72 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
        v72(v69, v70);
        v72(v115, v70);
        v51 = v108;
        OUTLINED_FUNCTION_8_6(v59);
        v52 = v113;
        OUTLINED_FUNCTION_8_6(v113);
        v36 = (char *)v59;
        v48 = v120;
        if (v71 != -1)
          goto LABEL_21;
        v63 = v125;
        v64 = v119;
        v67 = v11 + v119;
        if (v125 < v11 || v125 >= v67)
        {
          OUTLINED_FUNCTION_9_5();
        }
        else
        {
          if (v125 == v11)
          {
            v63 = v11;
            goto LABEL_31;
          }
          OUTLINED_FUNCTION_10_4();
        }
        v64 = v119;
LABEL_31:
        v125 = v63 + v64;
        v7 = v124;
        v68 = v124 >= v48 || v67 >= v121;
        v11 = v67;
        if (v68)
          goto LABEL_83;
      }
      (*(void (**)(unint64_t, uint64_t))(v57 + 8))(v53, v122);
      v56 = v62;
      v36 = (char *)v59;
      v52 = v113;
      v48 = v120;
LABEL_20:
      sub_21954A56C(v56, (uint64_t *)&unk_253F220D8);
      OUTLINED_FUNCTION_8_6((uint64_t)v36);
      OUTLINED_FUNCTION_8_6(v52);
LABEL_21:
      v63 = v125;
      v64 = v119;
      v65 = v124 + v119;
      if (v125 < v124 || v125 >= v65)
      {
        OUTLINED_FUNCTION_9_5();
      }
      else
      {
        if (v125 == v124)
        {
LABEL_30:
          v124 = v65;
          v67 = v11;
          goto LABEL_31;
        }
        OUTLINED_FUNCTION_10_4();
      }
      v64 = v119;
      goto LABEL_30;
    }
  }
LABEL_83:
  sub_21954DA2C(&v125, &v124, (uint64_t *)&v123, v5);
  return 1;
}

void sub_21954D968(char a1, uint64_t a2, char a3, char *a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_10_2();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_49_0();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_8_2();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v6 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF38);
    v11 = (char *)OUTLINED_FUNCTION_30_0();
    _swift_stdlib_malloc_size(v11);
    OUTLINED_FUNCTION_54_1();
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = v12;
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || &v14[16 * v9] <= v13)
      memmove(v13, v14, 16 * v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v9);
  }
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_41();
}

uint64_t sub_21954DA2C(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v10;

  v4 = *a1;
  v5 = *a2;
  v6 = *a3;
  result = a4(0);
  v8 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }
  if (v6 - v5 == 0x8000000000000000 && v8 == -1)
    goto LABEL_16;
  v10 = v5 + (uint64_t)(v6 - v5) / v8 * v8;
  if (v4 < v5 || v4 >= v10)
    return swift_arrayInitWithTakeFrontToBack();
  if (v4 != v5)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

void sub_21954DAD8(uint64_t a1)
{
  sub_21954D968(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_21954DAEC(uint64_t a1)
{
  sub_21952EB58(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_21954DB00()
{
  sub_21954C194();
}

void sub_21954DB3C()
{
  sub_21954C194();
}

uint64_t OUTLINED_FUNCTION_5_8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_8_6(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_21953DC64(a1, v1);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return swift_arrayInitWithTakeBackToFront();
}

void OUTLINED_FUNCTION_14_3(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_21953DC64(a1, v1);
}

uint64_t OUTLINED_FUNCTION_18_4()
{
  return type metadata accessor for SiriNLOverride();
}

uint64_t OUTLINED_FUNCTION_19_4(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22_4()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return sub_21954D2D8();
}

void OUTLINED_FUNCTION_27_3(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_2195330CC(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_29_2(uint64_t a1)
{
  uint64_t v1;

  return sub_219547394(a1, v1);
}

uint64_t OUTLINED_FUNCTION_30_2(uint64_t a1)
{
  uint64_t v1;

  return sub_219547394(a1, v1);
}

void OUTLINED_FUNCTION_31_2(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_21953DC64(a1, v1);
}

void OUTLINED_FUNCTION_32_2(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_2195330CC(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_219557604();
}

uint64_t OUTLINED_FUNCTION_38_2@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_42_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD);

  sub_2195330CC(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return type metadata accessor for OverrideMatchResult(0);
}

uint64_t OUTLINED_FUNCTION_49_1()
{
  return swift_arrayInitWithTakeFrontToBack();
}

uint64_t OUTLINED_FUNCTION_52_1(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;

  return v2(a2, v3);
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  return sub_2195573A0();
}

void OUTLINED_FUNCTION_55_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2195330A0(a1, a2, *(uint64_t (**)(_QWORD))(v2 - 72));
}

void OUTLINED_FUNCTION_57_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2195330A0(a1, a2, *(uint64_t (**)(_QWORD))(v2 - 72));
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return sub_2195573AC();
}

uint64_t sub_21954DCF4()
{
  unint64_t v0;

  v0 = sub_2195583CC();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

void sub_21954DD3C(char *a1)
{
  sub_21954E8B0(*a1);
}

void sub_21954DD48()
{
  unsigned __int8 *v0;

  sub_219553DAC(*v0);
}

void sub_21954DD50(uint64_t a1)
{
  char *v1;

  sub_219553E24(a1, *v1);
}

void sub_21954DD58(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_219554078(a1, *v1);
}

uint64_t sub_21954DD60@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21954DCF4();
  *a1 = result;
  return result;
}

uint64_t sub_21954DD8C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21952FF68(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t static MobileGestalt.buildVersion.getter()
{
  return sub_219530034(0x726556646C697542, 0xEC0000006E6F6973);
}

uint64_t sub_21954DDD4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22130);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static MobileGestalt.osVersion.getter()
{
  return sub_219530034(0x56746375646F7250, 0xEE006E6F69737265);
}

ValueMetadata *type metadata accessor for MobileGestalt()
{
  return &type metadata for MobileGestalt;
}

uint64_t getEnumTagSinglePayload for MobileGestalt.DeviceClass(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
    if (a2 + 8 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 8) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v5 = v6 - 9;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MobileGestalt.DeviceClass(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_21954DF1C + 4 * byte_21955941E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_21954DF50 + 4 * byte_219559419[v4]))();
}

uint64_t sub_21954DF50(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21954DF58(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21954DF60);
  return result;
}

uint64_t sub_21954DF6C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21954DF74);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_21954DF78(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21954DF80(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21954DF8C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21954DF94(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

unint64_t sub_21954DFA0()
{
  unint64_t result;

  result = qword_25508CF50;
  if (!qword_25508CF50)
  {
    result = MEMORY[0x219A2EE44]("5YT4\b,", &type metadata for MobileGestalt.DeviceClass);
    atomic_store(result, (unint64_t *)&qword_25508CF50);
  }
  return result;
}

uint64_t sub_21954DFDC(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t result;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  v5 = a1;
  if (a1 >> 62)
  {
LABEL_50:
    swift_bridgeObjectRetain();
    v6 = sub_2195583B4();
    if (!v6)
      goto LABEL_51;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v6)
      goto LABEL_51;
  }
  v7 = 0;
  v8 = v5 & 0xC000000000000001;
  v9 = a2 & 0xC000000000000001;
  v29 = a3 & 0xFFFFFFFFFFFFFF8;
  v34 = a3 & 0xC000000000000001;
  v32 = a2 >> 62;
  v33 = a3;
  v31 = v5;
  v28 = v5 & 0xC000000000000001;
  while (2)
  {
    if (v8)
      result = MEMORY[0x219A2E70C](v7, v5);
    else
      result = swift_retain();
    v11 = __OFADD__(v7, 1);
    v12 = v7 + 1;
    if (!v11)
    {
      if (v32)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        v13 = sub_2195583B4();
      }
      else
      {
        v13 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_retain();
        swift_bridgeObjectRetain();
      }
      if (!v13)
      {
LABEL_47:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        v25 = 0;
LABEL_52:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v25;
      }
      v30 = v12;
      v5 = 4;
      while (1)
      {
        if (v9)
          MEMORY[0x219A2E70C](v5 - 4, a2);
        else
          swift_retain();
        v14 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
        {
          __break(1u);
LABEL_49:
          __break(1u);
          goto LABEL_50;
        }
        sub_2195500B0();
        v16 = v15;
        swift_release();
        if ((v16 & 1) != 0)
          break;
        ++v5;
        if (v14 == v13)
          goto LABEL_47;
      }
      swift_release();
      swift_bridgeObjectRelease();
      if (v32)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v17 = sub_2195583B4();
      }
      else
      {
        v17 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      v7 = v30;
      if (v17)
      {
        v18 = 0;
        v26 = v17;
LABEL_25:
        if (v9)
          result = MEMORY[0x219A2E70C](v18, a2);
        else
          result = swift_retain();
        v11 = __OFADD__(v18, 1);
        v19 = v18 + 1;
        if (!v11)
        {
          v27 = v19;
          if (a3 >> 62)
          {
            swift_bridgeObjectRetain();
            swift_retain();
            v20 = sub_2195583B4();
          }
          else
          {
            v20 = *(_QWORD *)(v29 + 16);
            swift_bridgeObjectRetain();
            swift_retain();
          }
          if (!v20)
          {
LABEL_46:
            swift_release();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            goto LABEL_47;
          }
          v21 = 4;
          while (1)
          {
            if (v34)
            {
              v5 = MEMORY[0x219A2E70C](v21 - 4, a3);
            }
            else
            {
              v5 = *(_QWORD *)(a3 + 8 * v21);
              swift_retain();
            }
            a3 = v21 - 3;
            if (__OFADD__(v21 - 4, 1))
              goto LABEL_49;
            sub_2195500B0();
            v23 = v22;
            swift_release();
            if ((v23 & 1) != 0)
            {
              swift_release_n();
              a3 = v33;
              swift_bridgeObjectRelease();
              v18 = v27;
              v7 = v30;
              if (v27 != v26)
                goto LABEL_25;
              goto LABEL_43;
            }
            ++v21;
            v24 = a3 == v20;
            a3 = v33;
            if (v24)
              goto LABEL_46;
          }
        }
        goto LABEL_54;
      }
LABEL_43:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      v8 = v28;
      v5 = v31;
      if (v7 != v6)
        continue;
LABEL_51:
      swift_bridgeObjectRelease();
      v25 = 1;
      goto LABEL_52;
    }
    break;
  }
  __break(1u);
LABEL_54:
  __break(1u);
  return result;
}

uint64_t sub_21954E3D0(unint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a1;
  if (a1 >> 62)
    goto LABEL_25;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v4)
  {
    while (1)
    {
      v5 = 0;
      v6 = v3 & 0xC000000000000001;
      v15 = v4;
      v7 = a2 >> 62;
      v16 = v3;
      v14 = v3 & 0xC000000000000001;
LABEL_4:
      if (v6)
        MEMORY[0x219A2E70C](v5, v3);
      else
        swift_retain();
      if (!__OFADD__(v5++, 1))
        break;
LABEL_24:
      __break(1u);
LABEL_25:
      swift_bridgeObjectRetain();
      v4 = sub_2195583B4();
      if (!v4)
        goto LABEL_26;
    }
    if (v7)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      v9 = sub_2195583B4();
    }
    else
    {
      v9 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_retain();
      swift_bridgeObjectRetain();
    }
    if (!v9)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      swift_release_n();
      return 0;
    }
    v10 = 4;
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
        MEMORY[0x219A2E70C](v10 - 4, a2);
      else
        swift_retain();
      v3 = v10 - 3;
      if (__OFADD__(v10 - 4, 1))
      {
        __break(1u);
        goto LABEL_24;
      }
      sub_2195500B0();
      v12 = v11;
      swift_release();
      if ((v12 & 1) != 0)
        break;
      ++v10;
      if (v3 == v9)
        goto LABEL_22;
    }
    swift_release_n();
    swift_bridgeObjectRelease();
    v6 = v14;
    v3 = v16;
    v7 = a2 >> 62;
    if (v5 != v15)
      goto LABEL_4;
  }
LABEL_26:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

char *sub_21954E5E8()
{
  uint64_t v0;
  char *v1;
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
  unint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  OUTLINED_FUNCTION_62();
  v43 = v3;
  v44 = v4;
  v36 = sub_219557D0C();
  v34 = *(_QWORD *)(v36 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v5);
  v33 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_38();
  v35 = sub_219557F34();
  v32 = *(_QWORD *)(v35 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v7);
  v31 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_38();
  v9 = sub_219557F10();
  v38 = *(_QWORD *)(v9 - 8);
  v39 = v9;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v10);
  v37 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_38();
  v12 = sub_219557B74();
  v41 = *(_QWORD *)(v12 - 8);
  v42 = v12;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_4_2();
  v15 = OUTLINED_FUNCTION_55_2(v14);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_48();
  v17 = sub_219557D9C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_9_0();
  v21 = v20 - v19;
  v22 = sub_219557B98();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_14_2();
  if ((sub_219557CA0() & 1) != 0)
  {
    sub_219557D00();
    sub_21954F5EC();
    OUTLINED_FUNCTION_27_4();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v2, v22);
    return v1;
  }
  if ((sub_219557CAC() & 1) != 0)
  {
    sub_219557C88();
    sub_21954F6F4();
    OUTLINED_FUNCTION_27_4();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v17);
    return v1;
  }
  if ((sub_219557C7C() & 1) != 0)
  {
    sub_219557CE8();
    v24 = sub_21954FA20();
    v25 = v1;
    v1 = (char *)v24;
    (*(void (**)(char *, uint64_t))(v16 + 8))(v25, v15);
    return v1;
  }
  if ((sub_219557C94() & 1) != 0)
  {
    v26 = v40;
    sub_219557CF4();
    sub_21954FB28();
    OUTLINED_FUNCTION_27_4();
    v28 = v41;
    v27 = v42;
LABEL_11:
    (*(void (**)(char *, uint64_t))(v28 + 8))(v26, v27);
    return v1;
  }
  if ((sub_219557CD0() & 1) != 0)
  {
    v26 = v37;
    sub_219557CB8();
    sub_21954FEA0();
    OUTLINED_FUNCTION_27_4();
    v28 = v38;
    v27 = v39;
    goto LABEL_11;
  }
  if ((sub_219557CDC() & 1) != 0)
  {
    v30 = v31;
    sub_219557CC4();
    sub_21954FFA8();
    OUTLINED_FUNCTION_27_4();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v30, v35);
  }
  else
  {
    v1 = v33;
    (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v33, v0, v36);
    sub_21955818C();
    OUTLINED_FUNCTION_27_4();
  }
  return v1;
}

void sub_21954E8B0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21954E8F8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21954E9B0 + 4 * byte_2195594F5[a2]))(4473168);
}

void sub_21954E9B0(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 4473168 || v1 != 0xE300000000000000)
    OUTLINED_FUNCTION_49_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_41();
}

void sub_21954EA84(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21954EAC4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21954EBBC + 4 * byte_219559508[a2]))(0x7865547475706E69);
}

void sub_21954EBBC(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x7865547475706E69 || v1 != 0xE900000000000074)
    OUTLINED_FUNCTION_49_2();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_41();
}

void sub_21954ECCC(uint64_t a1, uint64_t a2, void (*a3)(char *, char *), uint64_t a4)
{
  uint64_t matched;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(char *, char *);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v58 = a3;
  v59 = a4;
  matched = type metadata accessor for TurnInputRuleMatchResult(0);
  v57 = *(_QWORD *)(matched - 8);
  v7 = MEMORY[0x24BDAC7A8](matched);
  v61 = (uint64_t)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v48 = (uint64_t)&v45 - v9;
  v10 = sub_219557F7C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v49 = (char *)&v45 - v14;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F22248);
  v15 = MEMORY[0x24BDAC7A8](v55);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v47 = (char *)&v45 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v46 = (uint64_t)&v45 - v20;
  v21 = *(_QWORD *)(a1 + 16);
  v22 = *(_QWORD *)(a2 + 16);
  if (v22 >= v21)
    v23 = *(_QWORD *)(a1 + 16);
  else
    v23 = *(_QWORD *)(a2 + 16);
  v62 = MEMORY[0x24BEE4AF8];
  sub_21952E9DC();
  v60 = a2;
  v56 = v10;
  v53 = v22;
  v54 = v21;
  v52 = v23;
  if (v23)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24 = 0;
    v50 = a1;
    while (v21 != v24)
    {
      v25 = v51;
      (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v51, a1+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v24, v10);
      if (v22 == v24)
        goto LABEL_28;
      v26 = sub_219557B5C();
      v27 = v25;
      v28 = v26;
      v29 = *(_QWORD *)(v26 - 8);
      v30 = a2
          + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))
          + *(_QWORD *)(v29 + 72) * v24;
      v31 = &v17[*(int *)(v55 + 48)];
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v17, v27, v10);
      (*(void (**)(char *, unint64_t, uint64_t))(v29 + 16))(v31, v30, v28);
      v58(v17, v31);
      sub_21952F3F8((uint64_t)v17, &qword_253F22248);
      v32 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21952E9DC();
        v32 = v62;
      }
      v33 = *(_QWORD *)(v32 + 16);
      v22 = v53;
      if (v33 >= *(_QWORD *)(v32 + 24) >> 1)
      {
        sub_21952E9DC();
        v32 = v62;
      }
      ++v24;
      *(_QWORD *)(v32 + 16) = v33 + 1;
      sub_2195330A0(v61, v32+ ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80))+ *(_QWORD *)(v57 + 72) * v33, type metadata accessor for TurnInputRuleMatchResult);
      a1 = v50;
      a2 = v60;
      v10 = v56;
      v21 = v54;
      if (v52 == v24)
        goto LABEL_15;
    }
    __break(1u);
LABEL_28:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_15:
    v34 = v52;
    if (v21 <= v22)
    {
LABEL_26:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    while (v34 < v21)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v49, a1+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v34, v10);
      if (v22 == v34)
      {
        (*(void (**)(char *, uint64_t))(v11 + 8))(v49, v10);
        goto LABEL_26;
      }
      if (v34 >= v22)
        goto LABEL_30;
      v35 = sub_219557B5C();
      v36 = *(_QWORD *)(v35 - 8);
      v37 = a2
          + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))
          + *(_QWORD *)(v36 + 72) * v34;
      v38 = v55;
      v39 = v10;
      v40 = (uint64_t)v47;
      v41 = &v47[*(int *)(v55 + 48)];
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v47, v49, v39);
      (*(void (**)(char *, unint64_t, uint64_t))(v36 + 16))(v41, v37, v35);
      v42 = v46;
      sub_219553A14(v40, v46, &qword_253F22248);
      v58((char *)v42, (char *)(v42 + *(int *)(v38 + 48)));
      sub_21952F3F8(v42, &qword_253F22248);
      v43 = v62;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21952E9DC();
        v43 = v62;
      }
      v22 = v53;
      v21 = v54;
      v44 = *(_QWORD *)(v43 + 16);
      if (v44 >= *(_QWORD *)(v43 + 24) >> 1)
      {
        sub_21952E9DC();
        v43 = v62;
      }
      ++v34;
      *(_QWORD *)(v43 + 16) = v44 + 1;
      sub_2195330A0(v48, v43+ ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80))+ *(_QWORD *)(v57 + 72) * v44, type metadata accessor for TurnInputRuleMatchResult);
      a2 = v60;
      v10 = v56;
      if (v21 == v34)
        goto LABEL_26;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
}

uint64_t sub_21954F204@<X0>(uint64_t a1@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v48 = a1;
  v1 = sub_219557DCC();
  v34 = *(_QWORD *)(v1 - 8);
  v35 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v33 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_219557E80();
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v36 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_219557D3C();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_219557808();
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v42 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2195576DC();
  v46 = *(_QWORD *)(v9 - 8);
  v47 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2195576AC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_219557EEC();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_219557BC8();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_219557814() & 1) != 0)
  {
    sub_219557880();
    v23 = v48;
    sub_219557BBC();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
LABEL_3:
    v24 = sub_21955755C();
    v25 = v23;
    return __swift_storeEnumTagSinglePayload(v25, 0, 1, v24);
  }
  v26 = v48;
  if ((sub_2195578E0() & 1) != 0)
  {
    sub_2195578BC();
    sub_219557EE0();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
LABEL_10:
    v24 = sub_21955755C();
    v25 = v26;
    return __swift_storeEnumTagSinglePayload(v25, 0, 1, v24);
  }
  if ((sub_219557820() & 1) != 0)
  {
    sub_2195578F8();
    sub_2195576A0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    goto LABEL_10;
  }
  if ((sub_21955782C() & 1) != 0)
  {
    v27 = v45;
    sub_219557910();
    sub_2195576D0();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v27, v47);
    goto LABEL_10;
  }
  v23 = v26;
  if ((sub_219557850() & 1) != 0)
  {
    v29 = v42;
    sub_219557928();
    sub_2195577FC();
    v31 = v43;
    v30 = v44;
LABEL_20:
    (*(void (**)(char *, uint64_t))(v31 + 8))(v29, v30);
    goto LABEL_3;
  }
  if ((sub_2195578A4() & 1) != 0)
  {
    v29 = v39;
    sub_219557844();
    sub_219557D30();
    v31 = v40;
    v30 = v41;
    goto LABEL_20;
  }
  if ((sub_2195578D4() & 1) != 0)
  {
    v29 = v36;
    sub_219557898();
    sub_219557E74();
    v31 = v37;
    v30 = v38;
    goto LABEL_20;
  }
  if ((sub_2195578C8() & 1) != 0)
  {
    v29 = v33;
    sub_219557868();
    sub_219557DC0();
    v31 = v34;
    v30 = v35;
    goto LABEL_20;
  }
  v32 = sub_21955755C();
  return __swift_storeEnumTagSinglePayload(v26, 1, 1, v32);
}

unint64_t sub_21954F5EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  unint64_t v6;

  v0 = sub_21955755C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_219557B8C() & 1) != 0)
  {
    sub_219557B80();
    sub_21953B3EC();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  v5 = 0;
  v6 = 0xE000000000000000;
  sub_21955833C();
  swift_bridgeObjectRelease();
  v5 = 0xD000000000000016;
  v6 = 0x800000021955AC90;
  sub_2195581BC();
  swift_bridgeObjectRelease();
  sub_2195581BC();
  return v5;
}

uint64_t sub_21954F6F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  void (*v21)(char *, unint64_t, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;

  v0 = sub_219557934();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_219557568();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_21952E9C0(0, v5, 0);
    v6 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    v20 = v4;
    v7 = v4 + v6;
    v8 = *(_QWORD *)(v1 + 72);
    v21 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    v22 = v8;
    v9 = v1;
    do
    {
      v21(v3, v7, v0);
      v10 = sub_21953AF84();
      v12 = v11;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      v13 = (uint64_t)v23;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21952E9C0(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = (uint64_t)v23;
      }
      v15 = *(_QWORD *)(v13 + 16);
      v14 = *(_QWORD *)(v13 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_21952E9C0(v14 > 1, v15 + 1, 1);
        v13 = (uint64_t)v23;
      }
      *(_QWORD *)(v13 + 16) = v15 + 1;
      v16 = v13 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v10;
      *(_QWORD *)(v16 + 40) = v12;
      v7 += v22;
      --v5;
      v1 = v9;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = MEMORY[0x24BEE4AF8];
  }
  sub_21954F970(v13);
  v17 = swift_bridgeObjectRetain();
  v18 = sub_219552238(v17);
  swift_bridgeObjectRelease();
  v23 = v18;
  sub_219552420((uint64_t *)&v23);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22100);
  sub_21953B5E0();
  sub_21955815C();
  swift_release();
  v23 = 0;
  v24 = 0xE000000000000000;
  sub_21955833C();
  swift_bridgeObjectRelease();
  v23 = (_QWORD *)0xD00000000000001ALL;
  v24 = 0x8000000219559B00;
  sub_2195581BC();
  swift_bridgeObjectRelease();
  sub_2195581BC();
  return (uint64_t)v23;
}

uint64_t sub_21954F970(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_21955827C();
  v10 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_219552DA4(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_21954FA20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  unint64_t v6;

  v0 = sub_219557934();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_2195577C0() & 1) != 0)
  {
    sub_2195577CC();
    sub_21953AF84();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  v5 = 0;
  v6 = 0xE000000000000000;
  sub_21955833C();
  swift_bridgeObjectRelease();
  v5 = 0xD000000000000016;
  v6 = 0x8000000219559AE0;
  sub_2195581BC();
  swift_bridgeObjectRelease();
  sub_2195581BC();
  return v5;
}

uint64_t sub_21954FB28()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, unint64_t, uint64_t);
  unint64_t v24;
  unint64_t v25;

  v20 = sub_21955755C();
  v0 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v2 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_219557568();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v24 = MEMORY[0x24BEE4AF8];
    sub_21952E9C0(0, v4, 0);
    v5 = v3 + ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80));
    v21 = *(_QWORD *)(v0 + 72);
    v22 = v0;
    v23 = *(void (**)(char *, unint64_t, uint64_t))(v0 + 16);
    v19[1] = v3;
    v19[2] = "[task extraction failed]";
    v6 = v20;
    while (1)
    {
      v23(v2, v5, v6);
      sub_219557FF4();
      v7 = swift_retain();
      v8 = MEMORY[0x219A2E3D0](v7);
      if (v8 >> 62)
      {
        result = sub_2195583B4();
        if (result)
        {
LABEL_5:
          if ((v8 & 0xC000000000000001) != 0)
          {
            MEMORY[0x219A2E70C](0, v8);
          }
          else
          {
            if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              return result;
            }
            swift_retain();
          }
          swift_release();
          swift_bridgeObjectRelease();
          v10 = sub_2195580A8();
          v12 = v11;
          swift_release();
          goto LABEL_12;
        }
      }
      else
      {
        result = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (result)
          goto LABEL_5;
      }
      swift_bridgeObjectRelease();
      v13 = sub_219558024();
      swift_release();
      if (!v13)
      {
        swift_release();
        v12 = 0xEB000000005D7974;
        v10 = 0x69746E65206F6E5BLL;
        goto LABEL_13;
      }
      v10 = sub_21955809C();
      v12 = v14;
      swift_release();
LABEL_12:
      swift_release();
LABEL_13:
      v6 = v20;
      (*(void (**)(char *, uint64_t))(v0 + 8))(v2, v20);
      v15 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21952E9C0(0, *(_QWORD *)(v15 + 16) + 1, 1);
        v6 = v20;
        v15 = v24;
      }
      v17 = *(_QWORD *)(v15 + 16);
      v16 = *(_QWORD *)(v15 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_21952E9C0(v16 > 1, v17 + 1, 1);
        v6 = v20;
        v15 = v24;
      }
      *(_QWORD *)(v15 + 16) = v17 + 1;
      v18 = v15 + 16 * v17;
      *(_QWORD *)(v18 + 32) = v10;
      *(_QWORD *)(v18 + 40) = v12;
      v0 = v22;
      v5 += v21;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
  }
  swift_bridgeObjectRelease();
  v15 = MEMORY[0x24BEE4AF8];
LABEL_22:
  v24 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22100);
  sub_21953B5E0();
  sub_21955815C();
  swift_bridgeObjectRelease();
  v24 = 0;
  v25 = 0xE000000000000000;
  sub_21955833C();
  swift_bridgeObjectRelease();
  v24 = 0xD000000000000018;
  v25 = 0x8000000219559AC0;
  sub_2195581BC();
  swift_bridgeObjectRelease();
  sub_2195581BC();
  return v24;
}

unint64_t sub_21954FEA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  unint64_t v6;

  v0 = sub_21955755C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_219557F04() & 1) != 0)
  {
    sub_219557EF8();
    sub_21953B3EC();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  v5 = 0;
  v6 = 0xE000000000000000;
  sub_21955833C();
  swift_bridgeObjectRelease();
  v5 = 0xD00000000000001BLL;
  v6 = 0x8000000219559AA0;
  sub_2195581BC();
  swift_bridgeObjectRelease();
  sub_2195581BC();
  return v5;
}

unint64_t sub_21954FFA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  unint64_t v6;

  v0 = sub_21955755C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_219557F28() & 1) != 0)
  {
    sub_219557F1C();
    sub_21953B3EC();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  v5 = 0;
  v6 = 0xE000000000000000;
  sub_21955833C();
  swift_bridgeObjectRelease();
  v5 = 0xD00000000000001BLL;
  v6 = 0x8000000219559A80;
  sub_2195581BC();
  swift_bridgeObjectRelease();
  sub_2195581BC();
  return v5;
}

void sub_2195500B0()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
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
  void (*v68)(uint64_t, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t);
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
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  void (*v90)(uint64_t, uint64_t);
  uint64_t v91;
  int EnumTagSinglePayload;
  uint64_t v93;
  int v94;
  uint64_t v95;
  int v96;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void (*v101)(uint64_t, uint64_t, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(uint64_t, uint64_t);
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
  void (*v120)(uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  void (*v123)(uint64_t, uint64_t);
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  void (*v143)(uint64_t, uint64_t, uint64_t);
  uint64_t v144;
  void (*v145)(uint64_t, uint64_t);
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;

  OUTLINED_FUNCTION_62();
  v154 = v0;
  v145 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF58);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3();
  v129 = v3;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_23();
  v128 = v5;
  OUTLINED_FUNCTION_38();
  v153 = sub_219558084();
  v149 = *(_QWORD *)(v153 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3();
  v147 = v7;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_23();
  v146 = v9;
  OUTLINED_FUNCTION_38();
  v157 = sub_219558060();
  v140 = *(_QWORD *)(v157 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_3();
  v130 = v11;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_23();
  v139 = v13;
  v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF60);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_2();
  v152 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF68);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_3();
  v126 = v17;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_19_0();
  v137 = v19;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v125 - v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF70);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_3();
  v132 = v24;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_19_0();
  v131 = v26;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_19_0();
  v135 = v28;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_19_0();
  v134 = v30;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v31);
  v156 = (uint64_t)&v125 - v32;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_23();
  v155 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF78);
  OUTLINED_FUNCTION_5_2();
  v36 = MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v125 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_23();
  v138 = v39;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC8);
  v41 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v148 = (uint64_t)&v125 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v43);
  v151 = (uint64_t)&v125 - v44;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v45);
  v47 = (char *)&v125 - v46;
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC0);
  v49 = *(unsigned __int8 *)(v41 + 80);
  v50 = (v49 + 32) & ~v49;
  v143 = (void (*)(uint64_t, uint64_t, uint64_t))(v50 + *(_QWORD *)(v41 + 72));
  v144 = v48;
  v142 = v49 | 7;
  v51 = swift_allocObject();
  v133 = xmmword_219558D80;
  *(_OWORD *)(v51 + 16) = xmmword_219558D80;
  v52 = sub_219558048();
  __swift_storeEnumTagSinglePayload(v51 + v50, 1, 1, v52);
  sub_219558090();
  v159 = v51;
  v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = v133;
  v154 = v40;
  *(_QWORD *)&v133 = v52;
  __swift_storeEnumTagSinglePayload(v53 + v50, 1, 1, v52);
  sub_219558090();
  v158 = v53;
  v54 = *(_QWORD *)(v51 + 16) == 0;
  v141 = v22;
  v150 = v47;
  v127 = v38;
  while (!v54)
  {
    v55 = v138;
    sub_21954A394(v51, v138);
    OUTLINED_FUNCTION_39_1(v55, 1, v154);
    if (v84)
      goto LABEL_51;
    sub_219553A14(v55, (uint64_t)v47, &qword_25508CEC8);
    v56 = v137;
    if (!*(_QWORD *)(v51 + 16))
      goto LABEL_48;
    OUTLINED_FUNCTION_83_0();
    if (!*(_QWORD *)(v53 + 16))
      goto LABEL_49;
    sub_21954A394(v53, (uint64_t)v38);
    v57 = v154;
    OUTLINED_FUNCTION_39_1((uint64_t)v38, 1, v154);
    if (v84)
      goto LABEL_52;
    v58 = *(int *)(v57 + 48);
    v59 = (uint64_t)v38;
    v60 = v151;
    sub_219553A14(v59, v151, &qword_25508CEC8);
    if (!*(_QWORD *)(v53 + 16))
      goto LABEL_50;
    v61 = v57;
    v62 = (uint64_t)v150;
    v63 = (uint64_t)&v150[v58];
    v64 = v60 + v58;
    OUTLINED_FUNCTION_83_0();
    v65 = v148;
    v66 = v148 + *(int *)(v61 + 48);
    OUTLINED_FUNCTION_17_2(v62, v148);
    v67 = v149;
    v68 = *(void (**)(uint64_t, uint64_t, uint64_t))(v149 + 16);
    v142 = v63;
    v69 = v63;
    v70 = v153;
    OUTLINED_FUNCTION_51_1(v66, v69);
    v71 = v155;
    sub_219553A14(v65, v155, &qword_25508CF70);
    v72 = *(void (**)(uint64_t, uint64_t))(v67 + 8);
    v72(v66, v70);
    v73 = v65 + *(int *)(v61 + 48);
    sub_219553A40(v60, v65, &qword_25508CF70);
    v143 = v68;
    v144 = v64;
    OUTLINED_FUNCTION_51_1(v73, v64);
    sub_219553A14(v65, v156, &qword_25508CF70);
    v145 = v72;
    v72(v73, v70);
    v74 = v134;
    OUTLINED_FUNCTION_17_2(v71, v134);
    v75 = v133;
    OUTLINED_FUNCTION_39_1(v74, 1, v133);
    if (v84)
    {
      OUTLINED_FUNCTION_13_4(v74);
      v77 = 1;
      v76 = (uint64_t)v141;
    }
    else
    {
      v76 = (uint64_t)v141;
      sub_21955803C();
      OUTLINED_FUNCTION_15_3();
      v77 = 0;
    }
    v78 = v135;
    __swift_storeEnumTagSinglePayload(v76, v77, 1, v157);
    OUTLINED_FUNCTION_17_2(v156, v78);
    OUTLINED_FUNCTION_39_1(v78, 1, v75);
    if (v84)
    {
      OUTLINED_FUNCTION_13_4(v78);
      v79 = 1;
    }
    else
    {
      sub_21955803C();
      OUTLINED_FUNCTION_15_3();
      v79 = 0;
    }
    v80 = v157;
    __swift_storeEnumTagSinglePayload(v56, v79, 1, v157);
    v81 = v152;
    v82 = v152 + *(int *)(v136 + 48);
    OUTLINED_FUNCTION_77_0(v76, v152);
    OUTLINED_FUNCTION_77_0(v56, v82);
    OUTLINED_FUNCTION_39_1(v81, 1, v80);
    if (v84)
    {
      OUTLINED_FUNCTION_73_0(v56);
      OUTLINED_FUNCTION_73_0(v76);
      OUTLINED_FUNCTION_39_1(v82, 1, v157);
      if (!v84)
        goto LABEL_42;
      OUTLINED_FUNCTION_73_0(v152);
    }
    else
    {
      v83 = v126;
      OUTLINED_FUNCTION_77_0(v152, v126);
      OUTLINED_FUNCTION_39_1(v82, 1, v157);
      if (v84)
      {
        OUTLINED_FUNCTION_2_8(v56);
        OUTLINED_FUNCTION_2_8((uint64_t)v141);
        (*(void (**)(uint64_t, uint64_t))(v140 + 8))(v83, v157);
LABEL_42:
        sub_21952F3F8(v152, &qword_25508CF60);
LABEL_43:
        OUTLINED_FUNCTION_2_8(v156);
        OUTLINED_FUNCTION_2_8(v155);
        OUTLINED_FUNCTION_2_8(v151);
        v124 = (uint64_t)v150;
LABEL_44:
        OUTLINED_FUNCTION_2_8(v124);
        swift_bridgeObjectRelease();
LABEL_45:
        swift_bridgeObjectRelease();
LABEL_46:
        OUTLINED_FUNCTION_1_0();
        return;
      }
      v85 = v140;
      v86 = v56;
      v87 = v139;
      v88 = v157;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v140 + 32))(v139, v82, v157);
      sub_219553A74(&qword_25508CF80, (uint64_t (*)(uint64_t))MEMORY[0x24BEA3410], MEMORY[0x24BEA3420]);
      v89 = sub_219558168();
      v90 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
      v90(v87, v88);
      OUTLINED_FUNCTION_22_5(v86);
      OUTLINED_FUNCTION_22_5((uint64_t)v141);
      v90(v83, v88);
      OUTLINED_FUNCTION_22_5(v152);
      if ((v89 & 1) == 0)
        goto LABEL_43;
    }
    v91 = v131;
    OUTLINED_FUNCTION_17_2(v155, v131);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v91, 1, v75);
    v93 = (uint64_t)v150;
    if (EnumTagSinglePayload == 1)
    {
      OUTLINED_FUNCTION_13_4(v91);
      v94 = 0;
    }
    else
    {
      v94 = sub_219558030();
      OUTLINED_FUNCTION_15_3();
    }
    v95 = v132;
    OUTLINED_FUNCTION_17_2(v156, v132);
    OUTLINED_FUNCTION_39_1(v95, 1, v75);
    if (v84)
    {
      OUTLINED_FUNCTION_13_4(v95);
      if (EnumTagSinglePayload != 1)
        goto LABEL_37;
    }
    else
    {
      v96 = sub_219558030();
      OUTLINED_FUNCTION_21_2(v95, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v75 - 8) + 8));
      if (EnumTagSinglePayload == 1 || v94 != v96)
      {
LABEL_37:
        OUTLINED_FUNCTION_2_8(v156);
        OUTLINED_FUNCTION_2_8(v155);
        v121 = v151;
LABEL_39:
        OUTLINED_FUNCTION_2_8(v121);
        v124 = v93;
        goto LABEL_44;
      }
    }
    v98 = v154;
    v99 = v148;
    v100 = v148 + *(int *)(v154 + 48);
    OUTLINED_FUNCTION_17_2(v93, v148);
    v101 = v143;
    v102 = v153;
    v143(v100, v142, v153);
    OUTLINED_FUNCTION_60(v146);
    OUTLINED_FUNCTION_13_4(v99);
    v103 = v99 + *(int *)(v98 + 48);
    v104 = v151;
    OUTLINED_FUNCTION_17_2(v151, v99);
    v101(v103, v144, v102);
    OUTLINED_FUNCTION_60(v147);
    OUTLINED_FUNCTION_13_4(v99);
    v105 = v139;
    sub_219558078();
    v106 = v130;
    sub_219558078();
    sub_219553A74(&qword_25508CF80, (uint64_t (*)(uint64_t))MEMORY[0x24BEA3410], MEMORY[0x24BEA3420]);
    v107 = v157;
    LOBYTE(v103) = sub_219558168();
    v108 = *(void (**)(uint64_t, uint64_t))(v140 + 8);
    v108(v106, v107);
    v108(v105, v107);
    if ((v103 & 1) == 0)
    {
      v122 = v153;
      v123 = v145;
      v145(v147, v153);
      v123(v146, v122);
      OUTLINED_FUNCTION_2_8(v156);
      OUTLINED_FUNCTION_2_8(v155);
      v121 = v104;
      goto LABEL_39;
    }
    sub_219558054();
    v109 = v128;
    OUTLINED_FUNCTION_35_2();
    v110 = v146;
    v111 = v147;
    v112 = v129;
    OUTLINED_FUNCTION_48_1();
    sub_21955806C();
    OUTLINED_FUNCTION_22_5(v112);
    OUTLINED_FUNCTION_22_5(v109);
    v113 = sub_219558000();
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_35_2();
    OUTLINED_FUNCTION_48_1();
    sub_21955806C();
    v114 = v112;
    v115 = v93;
    v116 = v153;
    OUTLINED_FUNCTION_22_5(v114);
    OUTLINED_FUNCTION_22_5(v109);
    v117 = sub_219558000();
    OUTLINED_FUNCTION_3_1();
    v118 = sub_219550C7C(v113);
    swift_bridgeObjectRelease();
    sub_21952E1D4(v118);
    v119 = sub_219550C7C(v117);
    OUTLINED_FUNCTION_4_3();
    sub_21952E1D4(v119);
    v120 = v145;
    v145(v111, v116);
    v120(v110, v116);
    OUTLINED_FUNCTION_13_4(v156);
    OUTLINED_FUNCTION_13_4(v155);
    OUTLINED_FUNCTION_2_8(v104);
    OUTLINED_FUNCTION_2_8(v115);
    v51 = v159;
    if (!*(_QWORD *)(v159 + 16))
    {
      OUTLINED_FUNCTION_4_3();
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    v47 = (char *)v115;
    v54 = 0;
    v53 = v158;
    v38 = v127;
    if (!*(_QWORD *)(v158 + 16))
    {
      OUTLINED_FUNCTION_4_3();
      goto LABEL_45;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
}

uint64_t sub_219550C7C(uint64_t a1)
{
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
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF88);
  v2 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEC8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_21952EA30();
    v11 = a1 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v12 = *(_QWORD *)(v2 + 72);
    v10 = v16;
    do
    {
      sub_219553A40(v11, (uint64_t)v4, &qword_25508CF88);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21952EA30();
        v10 = v16;
      }
      v13 = *(_QWORD *)(v10 + 16);
      if (v13 >= *(_QWORD *)(v10 + 24) >> 1)
      {
        sub_21952EA30();
        v10 = v16;
      }
      *(_QWORD *)(v10 + 16) = v13 + 1;
      sub_219553A14((uint64_t)v8, v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v13, &qword_25508CEC8);
      v11 += v12;
      --v9;
    }
    while (v9);
  }
  return v10;
}

void sub_219550E3C()
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
  unint64_t v17;
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
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
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
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t, uint64_t);
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(uint64_t, uint64_t, uint64_t);
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
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
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;

  OUTLINED_FUNCTION_62();
  v130 = v0;
  v3 = v2;
  v4 = OUTLINED_FUNCTION_82_0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3();
  v117 = v6;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_19_0();
  v118 = v8;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_19_0();
  v125 = v10;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_19_0();
  v122 = v12;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_79_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_23();
  v121 = v15;
  v16 = OUTLINED_FUNCTION_78_0();
  v17 = *(_QWORD *)(v16 - 8);
  v132 = v16;
  v133 = v17;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_9_0();
  v21 = v20 - v19;
  v134 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25508CEB8) - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_3();
  v131 = v23;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v24);
  v127 = (uint64_t)&v114 - v25;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v26);
  v128 = (uint64_t)&v114 - v27;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_19_0();
  v123 = v29;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v30);
  v126 = (uint64_t)&v114 - v31;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v32);
  v34 = (char *)&v114 - v33;
  v35 = sub_219557D9C();
  v36 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_3();
  v119 = v37;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v38);
  v40 = (char *)&v114 - v39;
  if ((sub_219557CAC() & 1) != 0)
  {
    sub_219557C88();
    v41 = sub_219557568();
    v42 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v43 = v41;
    v114 = v42;
    v42((uint64_t)v40, v35);
    v44 = *(_QWORD *)(v43 + 16);
    v129 = v5;
    v120 = v1;
    v116 = v3;
    v115 = v35;
    if (v44)
    {
      OUTLINED_FUNCTION_25_4(MEMORY[0x24BEE4AF8]);
      OUTLINED_FUNCTION_10_5();
      v130 = v43;
      v46 = v43 + v45;
      v48 = *(_QWORD *)(v47 + 72);
      v49 = v4;
      do
      {
        OUTLINED_FUNCTION_87_0(v21, v46);
        v50 = v21;
        sub_21954F204((uint64_t)v34);
        OUTLINED_FUNCTION_24_1(v21, *(uint64_t (**)(uint64_t, uint64_t))(v133 + 8));
        if ((OUTLINED_FUNCTION_65_0() & 1) == 0)
        {
          OUTLINED_FUNCTION_33_2();
          v50 = v135;
        }
        v51 = *(_QWORD *)(v50 + 16);
        if (v51 >= *(_QWORD *)(v50 + 24) >> 1)
        {
          OUTLINED_FUNCTION_26_4();
          v50 = v135;
        }
        OUTLINED_FUNCTION_32_3();
        sub_219553A14((uint64_t)v34, v52 + v53 * v51, &qword_25508CEB8);
        v46 += v48;
        --v44;
      }
      while (v44);
      v4 = v49;
      OUTLINED_FUNCTION_86_0();
      v5 = v129;
      v1 = v120;
      v35 = v115;
    }
    else
    {
      OUTLINED_FUNCTION_10();
      v50 = MEMORY[0x24BEE4AF8];
    }
    v54 = *(_QWORD *)(v50 + 16);
    if (v54)
    {
      OUTLINED_FUNCTION_10_5();
      v56 = v50 + v55;
      v124 = *(_QWORD *)(v57 + 72);
      OUTLINED_FUNCTION_2_0();
      v130 = MEMORY[0x24BEE4AF8];
      v58 = v123;
      do
      {
        v59 = v126;
        OUTLINED_FUNCTION_17_2(v56, v126);
        sub_219553A14(v59, v58, &qword_25508CEB8);
        OUTLINED_FUNCTION_39_1(v58, 1, v4);
        if (v60)
        {
          OUTLINED_FUNCTION_13_4(v58);
        }
        else
        {
          v61 = v58;
          v62 = v121;
          OUTLINED_FUNCTION_29_3(v121, v61);
          OUTLINED_FUNCTION_29_3(v1, v62);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v64 = v130;
          }
          else
          {
            sub_219546A38(0, *(_QWORD *)(v130 + 16) + 1, 1, v130);
            v64 = v69;
          }
          v66 = *(_QWORD *)(v64 + 16);
          v65 = *(_QWORD *)(v64 + 24);
          if (v66 >= v65 >> 1)
          {
            sub_219546A38(v65 > 1, v66 + 1, 1, v64);
            v64 = v70;
          }
          *(_QWORD *)(v64 + 16) = v66 + 1;
          OUTLINED_FUNCTION_56_0();
          v130 = v67;
          v1 = v120;
          OUTLINED_FUNCTION_29_3(v67 + v68 + *(_QWORD *)(v5 + 72) * v66, v120);
          v58 = v123;
        }
        v56 += v124;
        --v54;
      }
      while (v54);
      OUTLINED_FUNCTION_38_3();
      v35 = v115;
    }
    else
    {
      OUTLINED_FUNCTION_3_1();
      v130 = MEMORY[0x24BEE4AF8];
    }
    v71 = v119;
    sub_219557C88();
    v72 = sub_219557568();
    v114(v71, v35);
    v73 = *(_QWORD *)(v72 + 16);
    v74 = v131;
    if (v73)
    {
      OUTLINED_FUNCTION_25_4(MEMORY[0x24BEE4AF8]);
      OUTLINED_FUNCTION_10_5();
      v126 = v72;
      v76 = v72 + v75;
      v78 = *(_QWORD *)(v77 + 72);
      v79 = v128;
      do
      {
        OUTLINED_FUNCTION_87_0(v21, v76);
        v80 = v21;
        sub_21954F204(v79);
        OUTLINED_FUNCTION_24_1(v21, *(uint64_t (**)(uint64_t, uint64_t))(v133 + 8));
        if ((OUTLINED_FUNCTION_65_0() & 1) == 0)
        {
          OUTLINED_FUNCTION_33_2();
          v80 = v135;
        }
        v81 = *(_QWORD *)(v80 + 16);
        if (v81 >= *(_QWORD *)(v80 + 24) >> 1)
        {
          OUTLINED_FUNCTION_26_4();
          v80 = v135;
        }
        OUTLINED_FUNCTION_32_3();
        v79 = v128;
        sub_219553A14(v128, v82 + v83 * v81, &qword_25508CEB8);
        v76 += v78;
        --v73;
        v74 = v131;
      }
      while (v73);
      swift_bridgeObjectRelease();
      v5 = v129;
    }
    else
    {
      OUTLINED_FUNCTION_81();
      v80 = MEMORY[0x24BEE4AF8];
    }
    v84 = *(_QWORD *)(v80 + 16);
    if (v84)
    {
      OUTLINED_FUNCTION_80_0();
      v86 = *(_QWORD *)(v85 + 72);
      OUTLINED_FUNCTION_2_0();
      v87 = MEMORY[0x24BEE4AF8];
      do
      {
        v88 = v127;
        sub_219553A40(v73, v127, &qword_25508CEB8);
        sub_219553A14(v88, v74, &qword_25508CEB8);
        OUTLINED_FUNCTION_39_1(v74, 1, v4);
        if (v60)
        {
          sub_21952F3F8(v74, &qword_25508CEB8);
        }
        else
        {
          v89 = v122;
          OUTLINED_FUNCTION_29_3(v122, v74);
          OUTLINED_FUNCTION_29_3(v125, v89);
          v90 = swift_isUniquelyReferenced_nonNull_native();
          if ((v90 & 1) == 0)
          {
            OUTLINED_FUNCTION_68_0(0, *(_QWORD *)(v87 + 16) + 1);
            v87 = v94;
          }
          v92 = *(_QWORD *)(v87 + 16);
          v91 = *(_QWORD *)(v87 + 24);
          if (v92 >= v91 >> 1)
          {
            OUTLINED_FUNCTION_68_0(v91 > 1, v92 + 1);
            v87 = v95;
          }
          *(_QWORD *)(v87 + 16) = v92 + 1;
          v5 = v129;
          OUTLINED_FUNCTION_56_0();
          OUTLINED_FUNCTION_29_3(v87 + v93 + *(_QWORD *)(v5 + 72) * v92, v125);
          v74 = v131;
        }
        v73 += v86;
        --v84;
      }
      while (v84);
      OUTLINED_FUNCTION_38_3();
    }
    else
    {
      OUTLINED_FUNCTION_3_1();
      v87 = MEMORY[0x24BEE4AF8];
    }
    v96 = *(_QWORD *)(v130 + 16);
    v97 = MEMORY[0x24BEE4AF8];
    if (v96)
    {
      v135 = MEMORY[0x24BEE4AF8];
      v98 = v130;
      sub_219558378();
      OUTLINED_FUNCTION_56_0();
      v99 = v5;
      v101 = v98 + v100;
      v134 = *(_QWORD *)(v99 + 72);
      v102 = *(void (**)(uint64_t, uint64_t, uint64_t))(v99 + 16);
      v103 = v118;
      do
      {
        v102(v103, v101, v4);
        OUTLINED_FUNCTION_40_1();
        OUTLINED_FUNCTION_5_9();
        sub_219558360();
        sub_219558384();
        sub_219558390();
        sub_21955836C();
        v101 += v134;
        --v96;
      }
      while (v96);
      v104 = v135;
      OUTLINED_FUNCTION_86_0();
      v97 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      v105 = *(_QWORD *)(v87 + 16);
      swift_bridgeObjectRelease();
      if (!v105)
      {
        OUTLINED_FUNCTION_4_3();
        goto LABEL_59;
      }
      v104 = MEMORY[0x24BEE4AF8];
    }
    v106 = *(_QWORD *)(v87 + 16);
    if (v106)
    {
      v133 = v104;
      v135 = v97;
      sub_219558378();
      OUTLINED_FUNCTION_10_5();
      v108 = v87 + v107;
      v134 = *(_QWORD *)(v109 + 72);
      v110 = *(void (**)(uint64_t, uint64_t, uint64_t))(v109 + 16);
      v111 = v117;
      do
      {
        v110(v111, v108, v4);
        OUTLINED_FUNCTION_40_1();
        OUTLINED_FUNCTION_5_9();
        sub_219558360();
        sub_219558384();
        sub_219558390();
        sub_21955836C();
        v108 += v134;
        --v106;
      }
      while (v106);
      v112 = v135;
      OUTLINED_FUNCTION_4_3();
      v104 = v133;
    }
    else
    {
      OUTLINED_FUNCTION_4_3();
      v112 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRetain();
    v113 = swift_bridgeObjectRetain();
    sub_21954DFDC(v113, v112, v104);
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_10();
  }
LABEL_59:
  OUTLINED_FUNCTION_1_0();
}

void sub_219551724()
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
  uint64_t v17;
  uint64_t v18;
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
  char *v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  id v54;
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t, uint64_t);
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  OUTLINED_FUNCTION_62();
  v2 = OUTLINED_FUNCTION_82_0();
  v63 = *(_QWORD *)(v2 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3();
  v62 = v4;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_23();
  v64 = v6;
  v65 = OUTLINED_FUNCTION_78_0();
  v7 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  OUTLINED_FUNCTION_14_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CEB8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v8);
  v59 = (uint64_t)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v10);
  v61 = (char *)v57 - v11;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_19_0();
  v68 = v13;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v14);
  v60 = (uint64_t)v57 - v15;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v16);
  v66 = (uint64_t)v57 - v17;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v18);
  v67 = (uint64_t)v57 - v19;
  OUTLINED_FUNCTION_2_2();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v57 - v22;
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_19_0();
  v70 = v24;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_23();
  v27 = OUTLINED_FUNCTION_55_2(v26);
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)v57 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_219557C7C() & 1) != 0)
  {
    v57[1] = v0;
    v58 = v2;
    sub_219557CE8();
    v31 = sub_2195577C0();
    v32 = *(void (**)(char *, uint64_t))(v28 + 8);
    OUTLINED_FUNCTION_36_2();
    OUTLINED_FUNCTION_67_0();
    v33 = sub_2195577C0();
    OUTLINED_FUNCTION_36_2();
    if ((v31 & 1) != 0 && (v33 & 1) != 0)
    {
      sub_219557CE8();
      OUTLINED_FUNCTION_76_0();
      OUTLINED_FUNCTION_36_2();
      v34 = v69;
      sub_21954F204(v69);
      v35 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
      v36 = v65;
      v35(v1, v65);
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_76_0();
      v37 = v27;
      v38 = v34;
      v32(v30, v37);
      v39 = v70;
      sub_21954F204(v70);
      v35(v1, v36);
      v40 = v34;
      v41 = v58;
      LODWORD(v42) = __swift_getEnumTagSinglePayload(v40, 1, v58);
      sub_219553A40(v39, (uint64_t)v23, &qword_25508CEB8);
      if ((_DWORD)v42 == 1)
      {
        OUTLINED_FUNCTION_24_3((uint64_t)v23);
        OUTLINED_FUNCTION_34_3((uint64_t)v23);
        v43 = v67;
        sub_219553A40(v38, v67, &qword_25508CEB8);
        v44 = v66;
        sub_219553A40(v39, v66, &qword_25508CEB8);
      }
      else
      {
        v42 = &qword_25508CEB8;
        OUTLINED_FUNCTION_2_8((uint64_t)v23);
        v43 = v67;
        OUTLINED_FUNCTION_84_0(v38, v67);
        v44 = v66;
        OUTLINED_FUNCTION_84_0(v39, v66);
      }
      v45 = v68;
      OUTLINED_FUNCTION_24_3(v43);
      v46 = v44;
      v47 = v60;
      sub_219553A14(v46, v60, &qword_25508CEB8);
      if ((_DWORD)v42 == 1)
      {
        v42 = &qword_25508CEB8;
        OUTLINED_FUNCTION_2_8(v47);
        OUTLINED_FUNCTION_2_8(v43);
      }
      else
      {
        OUTLINED_FUNCTION_24_3(v47);
        OUTLINED_FUNCTION_34_3(v47);
        OUTLINED_FUNCTION_34_3(v43);
      }
      v49 = v63;
      v48 = v64;
      v50 = (uint64_t)v61;
      v51 = v62;
      OUTLINED_FUNCTION_24_3(v38);
      sub_219553A40(v39, v45, &qword_25508CEB8);
      if ((_DWORD)v42 != 1 || (OUTLINED_FUNCTION_39_1(v45, 1, v41), !v52))
      {
        OUTLINED_FUNCTION_2_8(v45);
        OUTLINED_FUNCTION_84_0(v38, v50);
        OUTLINED_FUNCTION_39_1(v50, 1, v41);
        if (!v52)
        {
          OUTLINED_FUNCTION_59_1(v48);
          v50 = v59;
          sub_219553A40(v39, v59, &qword_25508CEB8);
          OUTLINED_FUNCTION_39_1(v50, 1, v41);
          if (!v52)
          {
            OUTLINED_FUNCTION_59_1(v51);
            OUTLINED_FUNCTION_75_0();
            if (!v45)
            {
              OUTLINED_FUNCTION_40_1();
              sub_2195500B0();
              swift_release();
              swift_release();
              v56 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
              v56(v51, v41);
              v56(v48, v41);
              OUTLINED_FUNCTION_34_3(v70);
              OUTLINED_FUNCTION_34_3(v38);
              goto LABEL_26;
            }
            sub_219558294();
            if (qword_253F22160 != -1)
              swift_once();
            v54 = (id)qword_253F221A8;
            OUTLINED_FUNCTION_33_0();
            OUTLINED_FUNCTION_77();
            OUTLINED_FUNCTION_30();

            v55 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
            v55(v51, v41);
            v55(v48, v41);
            v53 = v39;
LABEL_25:
            OUTLINED_FUNCTION_2_8(v53);
            OUTLINED_FUNCTION_2_8(v38);
            goto LABEL_26;
          }
          OUTLINED_FUNCTION_21_2(v48, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
        }
        OUTLINED_FUNCTION_2_8(v39);
        v53 = v50;
        goto LABEL_25;
      }
      OUTLINED_FUNCTION_2_8(v45);
      OUTLINED_FUNCTION_2_8(v39);
      OUTLINED_FUNCTION_2_8(v38);
    }
  }
LABEL_26:
  OUTLINED_FUNCTION_1_0();
}

void sub_219551D10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, unint64_t);
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, unint64_t);
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  unint64_t v53;

  OUTLINED_FUNCTION_62();
  v2 = v1;
  v3 = OUTLINED_FUNCTION_82_0();
  v52 = *(_QWORD *)(v3 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3();
  v50 = v5;
  OUTLINED_FUNCTION_2_2();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v45 - v7;
  v9 = sub_219557B74();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v51 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_2_2();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v45 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v45 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v45 - v19;
  if ((sub_219557C94() & 1) != 0)
  {
    v49 = v0;
    sub_219557CF4();
    v21 = sub_219557568();
    v22 = *(void (**)(char *, uint64_t))(v10 + 8);
    v22(v20, v9);
    v23 = *(_QWORD *)(v21 + 16);
    OUTLINED_FUNCTION_3_1();
    sub_219557CF4();
    v24 = sub_219557568();
    v25 = v18;
    v26 = v22;
    v22(v25, v9);
    v27 = *(_QWORD *)(v24 + 16);
    OUTLINED_FUNCTION_3_1();
    if (v23 == v27)
    {
      sub_219557CF4();
      v28 = sub_219557568();
      v22(v15, v9);
      v29 = *(_QWORD *)(v28 + 16);
      if (v29)
      {
        v46 = v22;
        v47 = v9;
        v48 = v2;
        v53 = MEMORY[0x24BEE4AF8];
        sub_219558378();
        OUTLINED_FUNCTION_10_5();
        v49 = v28;
        v31 = v28 + v30;
        v33 = *(_QWORD *)(v32 + 72);
        v34 = *(void (**)(char *, uint64_t, unint64_t))(v32 + 16);
        do
        {
          v34(v8, v31, v3);
          OUTLINED_FUNCTION_40_1();
          OUTLINED_FUNCTION_42_2();
          sub_219558360();
          sub_219558384();
          sub_219558390();
          sub_21955836C();
          v31 += v33;
          --v29;
        }
        while (v29);
        v35 = v53;
        swift_bridgeObjectRelease();
        v9 = v47;
        v26 = v46;
      }
      else
      {
        OUTLINED_FUNCTION_4_3();
        v35 = MEMORY[0x24BEE4AF8];
      }
      v36 = v51;
      sub_219557CF4();
      v37 = sub_219557568();
      v26(v36, v9);
      v38 = *(_QWORD *)(v37 + 16);
      if (v38)
      {
        v51 = (char *)v35;
        v53 = MEMORY[0x24BEE4AF8];
        sub_219558378();
        OUTLINED_FUNCTION_10_5();
        v49 = v37;
        v40 = v37 + v39;
        v42 = *(_QWORD *)(v41 + 72);
        v43 = *(void (**)(uint64_t, uint64_t, unint64_t))(v41 + 16);
        v44 = v50;
        do
        {
          v43(v44, v40, v3);
          OUTLINED_FUNCTION_40_1();
          OUTLINED_FUNCTION_41_1();
          sub_219558360();
          sub_219558384();
          sub_219558390();
          sub_21955836C();
          v40 += v42;
          --v38;
        }
        while (v38);
        OUTLINED_FUNCTION_74_0();
        v35 = (unint64_t)v51;
      }
      else
      {
        swift_bridgeObjectRelease();
        v3 = MEMORY[0x24BEE4AF8];
      }
      swift_bridgeObjectRetain();
      sub_21954E3D0(v35, v3);
      OUTLINED_FUNCTION_81();
      OUTLINED_FUNCTION_10();
    }
  }
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_219552104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_2195584BC();
    sub_2195581B0();
    v6 = sub_2195584D4();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_219558438() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_219558438() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

_QWORD *sub_219552238(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F22668);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  v5 = sub_219553818((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_219553A6C();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_219552318(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  size_t v11;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v5)
  {
    if (v5 <= 0)
      goto LABEL_11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25508CFA0);
    v7 = *(_QWORD *)(OUTLINED_FUNCTION_0_3() - 8);
    v8 = *(_QWORD *)(v7 + 72);
    v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    if (v8)
    {
      if (v11 - v9 != 0x8000000000000000 || v8 != -1)
      {
        v10[2] = v5;
        v10[3] = 2 * ((uint64_t)(v11 - v9) / v8);
LABEL_11:
        if (v4 != a3)
        {
          OUTLINED_FUNCTION_0_3();
          OUTLINED_FUNCTION_31_3();
          swift_arrayInitWithCopy();
          return;
        }
        goto LABEL_16;
      }
LABEL_15:
      __break(1u);
LABEL_16:
      __break(1u);
      return;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
}

void sub_219552420(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_21954DAEC(v2);
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v4;
  sub_219552488(v5);
  *a1 = v2;
}

void sub_219552488(uint64_t *a1)
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  BOOL v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  unint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  uint64_t v64;
  char v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *__dst;

  v3 = a1[1];
  v4 = sub_219558414();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_147;
    if (v3)
      sub_219552B28(0, v3, 1, a1);
    return;
  }
  if (v3 < -1)
    goto LABEL_146;
  v106 = v4;
  v103 = a1;
  if (v3 <= 1)
  {
    v6 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v39 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v9 = MEMORY[0x24BEE4AF8];
      goto LABEL_113;
    }
    v105 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v5 = sub_219558270();
    *(_QWORD *)(v5 + 16) = v3 / 2;
    v105 = v5;
    __dst = (char *)(v5 + 32);
  }
  v7 = 0;
  v8 = *a1;
  v104 = v8 + 8;
  v9 = MEMORY[0x24BEE4AF8];
  v107 = v3;
  while (1)
  {
    v10 = v7++;
    if (v7 >= v3)
      goto LABEL_39;
    v11 = (uint64_t *)(v8 + 16 * v7);
    v12 = *v11;
    v13 = v11[1];
    v14 = (_QWORD *)(v8 + 16 * v10);
    if (v12 == *v14 && v13 == v14[1])
    {
      v17 = v10 + 2;
      if (v10 + 2 >= v3)
        goto LABEL_38;
      v16 = 0;
    }
    else
    {
      v16 = sub_219558438();
      v17 = v10 + 2;
      if (v10 + 2 >= v3)
        goto LABEL_30;
    }
    v18 = (_QWORD *)(v104 + 16 * v17);
    do
    {
      v19 = (_QWORD *)(v8 + 16 * v7);
      if (*(v18 - 1) == *v19 && *v18 == v19[1])
      {
        if ((v16 & 1) != 0)
          goto LABEL_31;
      }
      else if (((v16 ^ sub_219558438()) & 1) != 0)
      {
        goto LABEL_30;
      }
      v18 += 2;
      v21 = v17 + 1;
      v7 = v17;
      v17 = v21;
    }
    while (v21 < v3);
    v17 = v21;
LABEL_30:
    v7 = v17;
    if ((v16 & 1) != 0)
    {
LABEL_31:
      if (v17 < v10)
        goto LABEL_150;
      if (v10 < v17)
      {
        v22 = 16 * v17;
        v23 = 16 * v10;
        v24 = v17;
        v25 = v10;
        do
        {
          if (v25 != --v24)
          {
            if (!v8)
              goto LABEL_153;
            v26 = v8 + v22;
            v27 = *(_QWORD *)(v8 + v23);
            v28 = *(_QWORD *)(v8 + v23 + 8);
            *(_OWORD *)(v8 + v23) = *(_OWORD *)(v8 + v22 - 16);
            *(_QWORD *)(v26 - 16) = v27;
            *(_QWORD *)(v26 - 8) = v28;
          }
          ++v25;
          v22 -= 16;
          v23 += 16;
        }
        while (v25 < v24);
      }
LABEL_38:
      v7 = v17;
    }
LABEL_39:
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10))
        goto LABEL_145;
      if (v7 - v10 < v106)
        break;
    }
LABEL_59:
    if (v7 < v10)
      goto LABEL_140;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_21954D968(0, *(_QWORD *)(v9 + 16) + 1, 1, (char *)v9);
      v9 = v92;
    }
    v38 = *(_QWORD *)(v9 + 16);
    v37 = *(_QWORD *)(v9 + 24);
    v39 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      sub_21954D968(v37 > 1, v38 + 1, 1, (char *)v9);
      v9 = v93;
    }
    *(_QWORD *)(v9 + 16) = v39;
    v40 = v9 + 32;
    v41 = (uint64_t *)(v9 + 32 + 16 * v38);
    *v41 = v10;
    v41[1] = v7;
    if (v38)
    {
      v108 = v7;
      while (1)
      {
        v42 = v39 - 1;
        if (v39 >= 4)
        {
          v47 = v40 + 16 * v39;
          v48 = *(_QWORD *)(v47 - 64);
          v49 = *(_QWORD *)(v47 - 56);
          v53 = __OFSUB__(v49, v48);
          v50 = v49 - v48;
          if (v53)
            goto LABEL_129;
          v52 = *(_QWORD *)(v47 - 48);
          v51 = *(_QWORD *)(v47 - 40);
          v53 = __OFSUB__(v51, v52);
          v45 = v51 - v52;
          v46 = v53;
          if (v53)
            goto LABEL_130;
          v54 = v39 - 2;
          v55 = (uint64_t *)(v40 + 16 * (v39 - 2));
          v57 = *v55;
          v56 = v55[1];
          v53 = __OFSUB__(v56, v57);
          v58 = v56 - v57;
          if (v53)
            goto LABEL_131;
          v53 = __OFADD__(v45, v58);
          v59 = v45 + v58;
          if (v53)
            goto LABEL_133;
          if (v59 >= v50)
          {
            v77 = (uint64_t *)(v40 + 16 * v42);
            v79 = *v77;
            v78 = v77[1];
            v53 = __OFSUB__(v78, v79);
            v80 = v78 - v79;
            if (v53)
              goto LABEL_139;
            v70 = v45 < v80;
            goto LABEL_97;
          }
        }
        else
        {
          if (v39 != 3)
          {
            v71 = *(_QWORD *)(v9 + 32);
            v72 = *(_QWORD *)(v9 + 40);
            v53 = __OFSUB__(v72, v71);
            v64 = v72 - v71;
            v65 = v53;
            goto LABEL_91;
          }
          v44 = *(_QWORD *)(v9 + 32);
          v43 = *(_QWORD *)(v9 + 40);
          v53 = __OFSUB__(v43, v44);
          v45 = v43 - v44;
          v46 = v53;
        }
        if ((v46 & 1) != 0)
          goto LABEL_132;
        v54 = v39 - 2;
        v60 = (uint64_t *)(v40 + 16 * (v39 - 2));
        v62 = *v60;
        v61 = v60[1];
        v63 = __OFSUB__(v61, v62);
        v64 = v61 - v62;
        v65 = v63;
        if (v63)
          goto LABEL_134;
        v66 = (uint64_t *)(v40 + 16 * v42);
        v68 = *v66;
        v67 = v66[1];
        v53 = __OFSUB__(v67, v68);
        v69 = v67 - v68;
        if (v53)
          goto LABEL_136;
        if (__OFADD__(v64, v69))
          goto LABEL_138;
        if (v64 + v69 >= v45)
        {
          v70 = v45 < v69;
LABEL_97:
          if (v70)
            v42 = v54;
          goto LABEL_99;
        }
LABEL_91:
        if ((v65 & 1) != 0)
          goto LABEL_135;
        v73 = (uint64_t *)(v40 + 16 * v42);
        v75 = *v73;
        v74 = v73[1];
        v53 = __OFSUB__(v74, v75);
        v76 = v74 - v75;
        if (v53)
          goto LABEL_137;
        if (v76 < v64)
          goto LABEL_108;
LABEL_99:
        v81 = v42 - 1;
        if (v42 - 1 >= v39)
        {
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
          goto LABEL_149;
        }
        v82 = v8;
        if (!v8)
          goto LABEL_152;
        v83 = v9;
        v84 = (uint64_t *)(v40 + 16 * v81);
        v85 = *v84;
        v86 = v40;
        v87 = v42;
        v88 = (_QWORD *)(v40 + 16 * v42);
        v89 = v88[1];
        v90 = v82;
        sub_219552BEC((char *)(v82 + 16 * *v84), (char *)(v82 + 16 * *v88), v82 + 16 * v89, __dst);
        if (v1)
        {
LABEL_110:
          swift_bridgeObjectRelease();
          *(_QWORD *)(v105 + 16) = 0;
          swift_bridgeObjectRelease();
          return;
        }
        if (v89 < v85)
          goto LABEL_126;
        if (v87 > *(_QWORD *)(v83 + 16))
          goto LABEL_127;
        *v84 = v85;
        *(_QWORD *)(v86 + 16 * v81 + 8) = v89;
        v91 = *(_QWORD *)(v83 + 16);
        if (v87 >= v91)
          goto LABEL_128;
        v9 = v83;
        v39 = v91 - 1;
        memmove(v88, v88 + 2, 16 * (v91 - 1 - v87));
        v40 = v86;
        *(_QWORD *)(v83 + 16) = v91 - 1;
        v8 = v90;
        v7 = v108;
        if (v91 <= 2)
          goto LABEL_108;
      }
    }
    v39 = 1;
LABEL_108:
    v3 = v107;
    if (v7 >= v107)
    {
      v6 = v105;
LABEL_113:
      v94 = v9;
      v105 = v6;
      if (v39 >= 2)
      {
        v95 = *v103;
        do
        {
          v96 = v39 - 2;
          if (v39 < 2)
            goto LABEL_141;
          if (!v95)
            goto LABEL_154;
          v97 = v94;
          v98 = *(_QWORD *)(v94 + 32 + 16 * v96);
          v99 = *(_QWORD *)(v94 + 32 + 16 * (v39 - 1) + 8);
          sub_219552BEC((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)(v94 + 32 + 16 * (v39 - 1))), v95 + 16 * v99, __dst);
          if (v1)
            goto LABEL_110;
          if (v99 < v98)
            goto LABEL_142;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_21954DAD8(v97);
            v97 = v102;
          }
          if (v96 >= *(_QWORD *)(v97 + 16))
            goto LABEL_143;
          v100 = (_QWORD *)(v97 + 32 + 16 * v96);
          *v100 = v98;
          v100[1] = v99;
          v101 = *(_QWORD *)(v97 + 16);
          if (v39 > v101)
            goto LABEL_144;
          memmove((void *)(v97 + 32 + 16 * (v39 - 1)), (const void *)(v97 + 32 + 16 * v39), 16 * (v101 - v39));
          v94 = v97;
          *(_QWORD *)(v97 + 16) = v101 - 1;
          v39 = v101 - 1;
        }
        while (v101 > 2);
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)(v105 + 16) = 0;
      swift_bridgeObjectRelease();
      return;
    }
  }
  if (__OFADD__(v10, v106))
    goto LABEL_148;
  if (v10 + v106 >= v3)
    v29 = v3;
  else
    v29 = v10 + v106;
  if (v29 >= v10)
  {
    if (v7 != v29)
    {
      v30 = (_QWORD *)(v8 + 16 * v7);
      do
      {
        v31 = (uint64_t *)(v8 + 16 * v7);
        v32 = *v31;
        v33 = v31[1];
        v34 = v10;
        v35 = v30;
        do
        {
          v36 = v32 == *(v35 - 2) && v33 == *(v35 - 1);
          if (v36 || (sub_219558438() & 1) == 0)
            break;
          if (!v8)
            goto LABEL_151;
          v32 = *v35;
          v33 = v35[1];
          *(_OWORD *)v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = v32;
          v35 -= 2;
          ++v34;
        }
        while (v7 != v34);
        ++v7;
        v30 += 2;
      }
      while (v7 != v29);
      v7 = v29;
    }
    goto LABEL_59;
  }
LABEL_149:
  __break(1u);
LABEL_150:
  __break(1u);
LABEL_151:
  __break(1u);
LABEL_152:
  __break(1u);
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
}

uint64_t sub_219552B28(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
    while (2)
    {
      v9 = (uint64_t *)(v7 + 16 * v4);
      result = *v9;
      v10 = v9[1];
      v11 = v6;
      v12 = (uint64_t *)v8;
      do
      {
        if (result == *(v12 - 2) && v10 == *(v12 - 1))
          break;
        result = sub_219558438();
        if ((result & 1) == 0)
          break;
        if (!v7)
        {
          __break(1u);
          return result;
        }
        result = *v12;
        v10 = v12[1];
        *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }
      while (v4 != v11);
      ++v4;
      v8 += 16;
      if (v4 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_219552BEC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v14;
  char *v15;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  uint64_t v25;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = (a2 - __src) / 16;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 16;
  if (v9 >= v11)
  {
    sub_219546444(a2, (uint64_t)(a3 - (_QWORD)a2) / 16, __dst);
    v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16)
      goto LABEL_47;
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      v20 = v12 - 16;
      v21 = *((_QWORD *)v12 - 2) == *((_QWORD *)v6 - 2) && *((_QWORD *)v12 - 1) == *((_QWORD *)v6 - 1);
      if (v21 || (sub_219558438() & 1) == 0)
      {
        v23 = v19 != v12 || v18 >= v12;
        v12 -= 16;
        if (!v23)
          goto LABEL_43;
      }
      else
      {
        v22 = v19 != v6 || v18 >= v6;
        v20 = v6 - 16;
        v6 -= 16;
        if (!v22)
          goto LABEL_43;
      }
      *(_OWORD *)v18 = *(_OWORD *)v20;
LABEL_43:
      v18 -= 16;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_47;
    }
  }
  sub_219546444(__src, (a2 - __src) / 16, __dst);
  v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (!v14 && (sub_219558438() & 1) != 0)
        break;
      v15 = v4;
      v14 = v7 == v4;
      v4 += 16;
      if (!v14)
        goto LABEL_15;
LABEL_16:
      v7 += 16;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_21;
    }
    v15 = v6;
    v14 = v7 == v6;
    v6 += 16;
    if (v14)
      goto LABEL_16;
LABEL_15:
    *(_OWORD *)v7 = *(_OWORD *)v15;
    goto LABEL_16;
  }
LABEL_21:
  v6 = v7;
LABEL_47:
  v25 = (v12 - v4) / 16;
  if (v6 != v4 || v6 >= &v4[16 * v25])
    memmove(v6, v4, 16 * v25);
  return 1;
}

uint64_t sub_219552DA4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_2195584BC();
  swift_bridgeObjectRetain();
  sub_2195581B0();
  v8 = sub_2195584D4();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_219558438() & 1) != 0)
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
      if (v19 || (sub_219558438() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_219553228(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_219552F50()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF98);
  v3 = sub_219558330();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_2195584BC();
      sub_2195581B0();
      result = sub_2195584D4();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_21955614C(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_219553228(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_219552F50();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2195533C0();
      goto LABEL_22;
    }
    sub_219553570();
  }
  v11 = *v4;
  sub_2195584BC();
  sub_2195581B0();
  result = sub_2195584D4();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_219558438(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_219558450();
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
          result = sub_219558438();
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

void *sub_2195533C0()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF98);
  v2 = *v0;
  v3 = sub_219558324();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_219553570()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CF98);
  v3 = sub_219558330();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_2195584BC();
    swift_bridgeObjectRetain();
    sub_2195581B0();
    result = sub_2195584D4();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_219553818(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
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
    return v10;
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
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
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

void sub_219553A14(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_53_2(a1, a2, a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_99();
}

void sub_219553A40(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_53_2(a1, a2, a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_99();
}

uint64_t sub_219553A6C()
{
  return swift_release();
}

void sub_219553A74(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x219A2EE44](a3, v5), a1);
  }
  OUTLINED_FUNCTION_99();
}

void OUTLINED_FUNCTION_2_8(uint64_t a1)
{
  uint64_t *v1;

  sub_21952F3F8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 152) + 8))(v0, v1);
}

void OUTLINED_FUNCTION_13_4(uint64_t a1)
{
  uint64_t *v1;

  sub_21952F3F8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_16_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_17_2(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_219553A40(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_21_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_22_5(uint64_t a1)
{
  uint64_t *v1;

  sub_21952F3F8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_24_3(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void OUTLINED_FUNCTION_25_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  sub_21952E9A4();
}

void OUTLINED_FUNCTION_26_4()
{
  sub_21952E9A4();
}

uint64_t OUTLINED_FUNCTION_29_3(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

void OUTLINED_FUNCTION_32_3()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = v1;
}

void OUTLINED_FUNCTION_33_2()
{
  sub_21952E9A4();
}

void OUTLINED_FUNCTION_34_3(uint64_t a1)
{
  uint64_t *v1;

  sub_21952F3F8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_38_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_39_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_219557FF4();
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 104) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 104) + 8))(v1, v0);
}

void OUTLINED_FUNCTION_46_2()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_2195330CC(*(_QWORD *)(v1 - 144), *(_QWORD *)(v1 - 176), v0);
}

uint64_t OUTLINED_FUNCTION_48_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_storeEnumTagSinglePayload(v2, 1, 1, v1);
  return v0;
}

uint64_t OUTLINED_FUNCTION_49_2()
{
  return sub_219558438();
}

uint64_t OUTLINED_FUNCTION_51_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_52_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_53_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_55_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_2195577D8();
}

uint64_t OUTLINED_FUNCTION_60(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v1, v3);
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return sub_219557CE8();
}

void OUTLINED_FUNCTION_68_0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_219546A38(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_69_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_73_0(uint64_t a1)
{
  uint64_t *v1;

  sub_21952F3F8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return sub_219557FF4();
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return sub_2195577CC();
}

void OUTLINED_FUNCTION_77_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_219553A40(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  return sub_219557934();
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  return sub_21955755C();
}

void OUTLINED_FUNCTION_83_0()
{
  sub_21953E548(0, 1);
}

void OUTLINED_FUNCTION_84_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_219553A40(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_86_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_87_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);
  uint64_t v3;

  return v2(a1, a2, *(_QWORD *)(v3 - 128));
}

void sub_219553DAC(unsigned __int8 a1)
{
  OUTLINED_FUNCTION_26_5();
  sub_21952FF68(a1);
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_15_4();
}

uint64_t sub_219553DE0(char a1)
{
  _BYTE v3[72];

  sub_2195584BC();
  sub_219553F10((uint64_t)v3, a1);
  return sub_2195584D4();
}

void sub_219553E24(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_219553E60()
{
  sub_2195581B0();
  return swift_bridgeObjectRelease();
}

void sub_219553F10(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_219553F44()
{
  sub_2195581B0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_219554038(uint64_t a1, char a2)
{
  _BYTE v4[72];

  sub_2195584BC();
  sub_219553F10((uint64_t)v4, a2);
  return sub_2195584D4();
}

void sub_219554078(uint64_t a1, unsigned __int8 a2)
{
  sub_2195584BC();
  sub_21952FF68(a2);
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_15_4();
}

BOOL static SiriNLOverride.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void SiriNLOverride.Error.hash(into:)()
{
  sub_2195584C8();
  OUTLINED_FUNCTION_99();
}

void SiriNLOverride.Error.hashValue.getter()
{
  OUTLINED_FUNCTION_26_5();
  sub_2195584C8();
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_15_4();
}

uint64_t sub_219554128()
{
  sub_2195584BC();
  sub_2195584C8();
  return sub_2195584D4();
}

void SiriNLOverride.id.getter()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_99();
}

void SiriNLOverride.inputText.getter()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_99();
}

void SiriNLOverride.locale.getter()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_99();
}

uint64_t SiriNLOverride.namespace.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 48);
}

uint64_t SiriNLOverride.source.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 52);
}

void SiriNLOverride.creation.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_18_4();
  sub_21953AAD0(v1 + *(int *)(v3 + 36), a1, (uint64_t *)&unk_253F220D8);
  OUTLINED_FUNCTION_99();
}

uint64_t SiriNLOverride.enabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_18_4() + 40));
}

void SiriNLOverride.overrideId.getter()
{
  OUTLINED_FUNCTION_18_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_99();
}

void _s16SiriNLUOverrides0A10NLOverrideV9userParse10Foundation4DataVSgvg_0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_18_4();
  sub_21953AA54(*(_QWORD *)(v0 + *(int *)(v1 + 48)), *(_QWORD *)(v0 + *(int *)(v1 + 48) + 8));
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_99();
}

uint64_t SiriNLOverride.utteranceComparisonType.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(OUTLINED_FUNCTION_18_4() + 52));
}

void SiriNLOverride.utteranceComparisonType.setter(int a1)
{
  uint64_t v1;

  *(_DWORD *)(v1 + *(int *)(OUTLINED_FUNCTION_18_4() + 52)) = a1;
  OUTLINED_FUNCTION_99();
}

uint64_t (*SiriNLOverride.utteranceComparisonType.modify())()
{
  OUTLINED_FUNCTION_18_4();
  return nullsub_1;
}

void SiriNLOverride.archivedNluRequestRule.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_18_4();
  sub_21953AA54(*(_QWORD *)(v0 + *(int *)(v1 + 56)), *(_QWORD *)(v0 + *(int *)(v1 + 56) + 8));
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_99();
}

void SiriNLOverride.archivedNluRequestRule.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = v2 + *(int *)(OUTLINED_FUNCTION_18_4() + 56);
  sub_21953AA68(*(_QWORD *)v5, *(_QWORD *)(v5 + 8));
  *(_QWORD *)v5 = a1;
  *(_QWORD *)(v5 + 8) = a2;
  OUTLINED_FUNCTION_41();
}

uint64_t (*SiriNLOverride.archivedNluRequestRule.modify())()
{
  OUTLINED_FUNCTION_18_4();
  return nullsub_1;
}

SiriNLUOverrides::SiriNLOverride::CodingKeys_optional __swiftcall SiriNLOverride.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  SiriNLUOverrides::SiriNLOverride::CodingKeys_optional result;

  v2 = v1;
  v3 = sub_2195583CC();
  OUTLINED_FUNCTION_10();
  v4 = 10;
  if (v3 < 0xA)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_41();
  return result;
}

SiriNLUOverrides::SiriNLOverride::CodingKeys_optional __swiftcall SiriNLOverride.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  _BYTE *v1;
  _BYTE *v2;
  SiriNLUOverrides::SiriNLOverride::CodingKeys_optional result;
  char v4;

  v2 = v1;
  result.value = SiriNLOverride.CodingKeys.init(rawValue:)(stringValue).value;
  *v2 = v4;
  return result;
}

SiriNLUOverrides::SiriNLOverride::CodingKeys_optional __swiftcall SiriNLOverride.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 10;
  return (SiriNLUOverrides::SiriNLOverride::CodingKeys_optional)intValue;
}

uint64_t SiriNLOverride.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t SiriNLOverride.CodingKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_5_10 + 4
                                                                                                * byte_219559533[*v0]))(25705, 0xE200000000000000);
}

void sub_219554448()
{
  OUTLINED_FUNCTION_33_3();
}

unint64_t sub_219554480()
{
  return 0xD000000000000017;
}

uint64_t SiriNLOverride.CodingKeys.stringValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_5_10_0
                                                            + 4 * byte_21955953D[*v0]))(25705, 0xE200000000000000);
}

void sub_2195544C8()
{
  OUTLINED_FUNCTION_33_3();
}

unint64_t sub_219554500()
{
  return 0xD000000000000017;
}

void sub_21955451C(char *a1)
{
  sub_21954EA84(*a1);
}

uint64_t sub_219554528()
{
  char *v0;

  return sub_219553DE0(*v0);
}

void sub_219554530(uint64_t a1)
{
  char *v1;

  sub_219553F10(a1, *v1);
}

uint64_t sub_219554538(uint64_t a1)
{
  char *v1;

  return sub_219554038(a1, *v1);
}

SiriNLUOverrides::SiriNLOverride::CodingKeys_optional sub_219554540(Swift::String *a1)
{
  return SiriNLOverride.CodingKeys.init(rawValue:)(*a1);
}

void sub_21955454C(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = SiriNLOverride.CodingKeys.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_99();
}

uint64_t sub_219554574()
{
  return 0;
}

uint64_t sub_219554584()
{
  sub_219554F8C();
  return sub_2195584EC();
}

uint64_t sub_2195545AC()
{
  sub_219554F8C();
  return sub_2195584F8();
}

uint64_t SiriNLOverride.dictionary.getter()
{
  _QWORD *v0;
  uint64_t inited;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CFA8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2195590B0;
  *(_QWORD *)(inited + 32) = 25705;
  *(_QWORD *)(inited + 40) = 0xE200000000000000;
  v2 = v0[1];
  *(_QWORD *)(inited + 48) = *v0;
  *(_QWORD *)(inited + 56) = v2;
  *(_QWORD *)(inited + 64) = 0x7865547475706E69;
  *(_QWORD *)(inited + 72) = 0xE900000000000074;
  v3 = v0[3];
  *(_QWORD *)(inited + 80) = v0[2];
  *(_QWORD *)(inited + 88) = v3;
  *(_QWORD *)(inited + 96) = 0x656C61636F6CLL;
  *(_QWORD *)(inited + 104) = 0xE600000000000000;
  v4 = v0[4];
  v5 = v0[5];
  *(_QWORD *)(inited + 112) = v4;
  *(_QWORD *)(inited + 120) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CED8);
  return sub_219558144();
}

uint64_t SiriNLOverride.criteria.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = SiriNLOverride.dictionary.getter();
  v1 = sub_21955470C(v0);
  OUTLINED_FUNCTION_10();
  sub_219554E5C(25705, 0xE200000000000000);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_21955470C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  uint64_t v34;

  v1 = MEMORY[0x24BEE4B00];
  v34 = MEMORY[0x24BEE4B00];
  sub_219556168(a1, v33);
  v2 = v33[0];
  v3 = v33[1];
  v4 = v33[3];
  v5 = v33[4];
  v6 = (unint64_t)(v33[2] + 64) >> 6;
  for (result = swift_bridgeObjectRetain(); ; result = swift_bridgeObjectRelease())
  {
    do
    {
      if (v5)
      {
        v8 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v9 = v8 | (v4 << 6);
      }
      else
      {
        v10 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
          goto LABEL_36;
        }
        if (v10 >= v6)
          goto LABEL_34;
        v11 = *(_QWORD *)(v3 + 8 * v10);
        v12 = v4 + 1;
        if (!v11)
        {
          v12 = v4 + 2;
          if (v4 + 2 >= v6)
            goto LABEL_34;
          v11 = *(_QWORD *)(v3 + 8 * v12);
          if (!v11)
          {
            v12 = v4 + 3;
            if (v4 + 3 >= v6)
              goto LABEL_34;
            v11 = *(_QWORD *)(v3 + 8 * v12);
            if (!v11)
            {
              v12 = v4 + 4;
              if (v4 + 4 >= v6)
                goto LABEL_34;
              v11 = *(_QWORD *)(v3 + 8 * v12);
              if (!v11)
              {
                v12 = v4 + 5;
                if (v4 + 5 >= v6)
                  goto LABEL_34;
                v11 = *(_QWORD *)(v3 + 8 * v12);
                if (!v11)
                {
                  v13 = v4 + 6;
                  while (v13 < v6)
                  {
                    v11 = *(_QWORD *)(v3 + 8 * v13++);
                    if (v11)
                    {
                      v12 = v13 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_34:
                  sub_219553A6C();
                  return v1;
                }
              }
            }
          }
        }
LABEL_19:
        v5 = (v11 - 1) & v11;
        v9 = __clz(__rbit64(v11)) + (v12 << 6);
        v4 = v12;
      }
      v14 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 16 * v9);
      v15 = v14[1];
    }
    while (!v15);
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v9);
    v17 = v16[1];
    v31 = *v14;
    v32 = *v16;
    v18 = *(_QWORD *)(v1 + 16);
    if (*(_QWORD *)(v1 + 24) <= v18)
    {
      v19 = v18 + 1;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_219555E40(v19, 1);
      v1 = v34;
    }
    else
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
    }
    sub_2195584BC();
    sub_2195581B0();
    result = sub_2195584D4();
    v20 = v1 + 64;
    v21 = -1 << *(_BYTE *)(v1 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v1 + 64 + 8 * (v22 >> 6))) == 0)
      break;
    v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v1 + 64 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)(v20 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = (_QWORD *)(*(_QWORD *)(v1 + 48) + 16 * v24);
    *v29 = v32;
    v29[1] = v17;
    v30 = (_QWORD *)(*(_QWORD *)(v1 + 56) + 16 * v24);
    *v30 = v31;
    v30[1] = v15;
    ++*(_QWORD *)(v1 + 16);
  }
  v25 = 0;
  v26 = (unint64_t)(63 - v21) >> 6;
  while (++v23 != v26 || (v25 & 1) == 0)
  {
    v27 = v23 == v26;
    if (v23 == v26)
      v23 = 0;
    v25 |= v27;
    v28 = *(_QWORD *)(v20 + 8 * v23);
    if (v28 != -1)
    {
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
      goto LABEL_33;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

void SiriNLOverride.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  __int128 v26;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_9_0();
  v7 = v6 - v5;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25508CFB0);
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_9_0();
  type metadata accessor for SiriNLOverride();
  OUTLINED_FUNCTION_0_9();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_9_0();
  v11 = v10 - v9;
  v24 = v10 - v9 + v12[14];
  *(_OWORD *)v24 = xmmword_2195598B0;
  v25 = v12;
  v13 = v10 - v9 + v12[15];
  v14 = sub_219557FDC();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_219554F8C();
  sub_2195584E0();
  if (v2)
  {
    OUTLINED_FUNCTION_29_4();
    sub_21953AA68(*(_QWORD *)v24, *(_QWORD *)(v24 + 8));
    sub_21952F428(v13, &qword_253F21E18);
  }
  else
  {
    *(_QWORD *)v11 = OUTLINED_FUNCTION_4_6();
    *(_QWORD *)(v11 + 8) = v15;
    *(_QWORD *)(v11 + 16) = OUTLINED_FUNCTION_4_6();
    *(_QWORD *)(v11 + 24) = v16;
    *(_QWORD *)(v11 + 32) = OUTLINED_FUNCTION_4_6();
    *(_QWORD *)(v11 + 40) = v17;
    *(_DWORD *)(v11 + 48) = OUTLINED_FUNCTION_9_6(3);
    *(_DWORD *)(v11 + 52) = OUTLINED_FUNCTION_9_6(4);
    sub_2195573AC();
    LOBYTE(v26) = 5;
    sub_219553A74(&qword_25508CFC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    OUTLINED_FUNCTION_31_4();
    sub_219554FE8(v7, v11 + v25[9]);
    OUTLINED_FUNCTION_21_3(6);
    *(_BYTE *)(v11 + v25[10]) = sub_2195583FC() & 1;
    OUTLINED_FUNCTION_21_3(7);
    v18 = sub_2195583D8();
    v19 = (uint64_t *)(v11 + v25[11]);
    *v19 = v18;
    v19[1] = v20;
    sub_219555030();
    OUTLINED_FUNCTION_31_4();
    *(_OWORD *)(v11 + v25[12]) = v26;
    v21 = sub_219558408();
    OUTLINED_FUNCTION_24_4();
    *(_DWORD *)(v11 + v25[13]) = v21;
    sub_21952EC98(v11, a2);
    OUTLINED_FUNCTION_29_4();
    sub_21952ED0C(v11);
  }
}

void sub_219554E48(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  SiriNLOverride.init(from:)(a1, a2);
}

uint64_t sub_219554E5C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21952F890(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v3;
  *v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CFF0);
  sub_21955839C();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 16 * v6);
  sub_2195583A8();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_219554F8C()
{
  unint64_t result;

  result = qword_25508CFB8;
  if (!qword_25508CFB8)
  {
    result = MEMORY[0x219A2EE44](&protocol conformance descriptor for SiriNLOverride.CodingKeys, &type metadata for SiriNLOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25508CFB8);
  }
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

uint64_t sub_219554FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_219555030()
{
  unint64_t result;

  result = qword_25508CFC8;
  if (!qword_25508CFC8)
  {
    result = MEMORY[0x219A2EE44](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25508CFC8);
  }
  return result;
}

unint64_t sub_219555070()
{
  unint64_t result;

  result = qword_25508CFD0;
  if (!qword_25508CFD0)
  {
    result = MEMORY[0x219A2EE44](&protocol conformance descriptor for SiriNLOverride.Error, &type metadata for SiriNLOverride.Error);
    atomic_store(result, (unint64_t *)&qword_25508CFD0);
  }
  return result;
}

unint64_t sub_2195550B0()
{
  unint64_t result;

  result = qword_25508CFD8;
  if (!qword_25508CFD8)
  {
    result = MEMORY[0x219A2EE44]("EYT4(+", &type metadata for SiriNLOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25508CFD8);
  }
  return result;
}

unint64_t sub_2195550F0()
{
  unint64_t result;

  result = qword_25508CFE0;
  if (!qword_25508CFE0)
  {
    result = MEMORY[0x219A2EE44](&protocol conformance descriptor for SiriNLOverride.CodingKeys, &type metadata for SiriNLOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25508CFE0);
  }
  return result;
}

unint64_t sub_219555130()
{
  unint64_t result;

  result = qword_25508CFE8;
  if (!qword_25508CFE8)
  {
    result = MEMORY[0x219A2EE44]("\rYT48*", &type metadata for SiriNLOverride.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25508CFE8);
  }
  return result;
}

uint64_t assignWithCopy for SiriNLOverride(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  const void *v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a2 + 52);
  v6 = a3[9];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_2195573AC();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = *(_QWORD *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, const void *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  v14 = a3[11];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[12];
  v18 = (uint64_t *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *(_QWORD *)(a2 + v17 + 8);
  if (*(_QWORD *)(a1 + v17 + 8) >> 60 == 15)
  {
    if (v20 >> 60 != 15)
    {
      v21 = *v19;
      sub_21952E944(v21, v20);
      *v18 = v21;
      v18[1] = v20;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (v20 >> 60 == 15)
  {
    sub_21954AD6C((uint64_t)v18);
LABEL_12:
    *(_OWORD *)v18 = *(_OWORD *)v19;
    goto LABEL_14;
  }
  v22 = *v19;
  sub_21952E944(v22, v20);
  v23 = *v18;
  v24 = v18[1];
  *v18 = v22;
  v18[1] = v20;
  sub_21952EE5C(v23, v24);
LABEL_14:
  *(_DWORD *)(a1 + a3[13]) = *(_DWORD *)(a2 + a3[13]);
  v25 = a3[14];
  v26 = (uint64_t *)(a1 + v25);
  v27 = (uint64_t *)(a2 + v25);
  v28 = *(_QWORD *)(a2 + v25 + 8);
  if (*(_QWORD *)(a1 + v25 + 8) >> 60 == 15)
  {
    if (v28 >> 60 != 15)
    {
      v29 = *v27;
      sub_21952E944(v29, v28);
      *v26 = v29;
      v26[1] = v28;
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (v28 >> 60 == 15)
  {
    sub_21954AD6C((uint64_t)v26);
LABEL_19:
    *(_OWORD *)v26 = *(_OWORD *)v27;
    goto LABEL_21;
  }
  v30 = *v27;
  sub_21952E944(v30, v28);
  v31 = *v26;
  v32 = v26[1];
  *v26 = v30;
  v26[1] = v28;
  sub_21952EE5C(v31, v32);
LABEL_21:
  v33 = a3[15];
  v34 = (void *)(a1 + v33);
  v35 = (const void *)(a2 + v33);
  v36 = sub_219557FDC();
  v37 = __swift_getEnumTagSinglePayload((uint64_t)v34, 1, v36);
  v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v36);
  if (!v37)
  {
    v39 = *(_QWORD *)(v36 - 8);
    if (!v38)
    {
      (*(void (**)(void *, const void *, uint64_t))(v39 + 24))(v34, v35, v36);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v39 + 8))(v34, v36);
    goto LABEL_26;
  }
  if (v38)
  {
LABEL_26:
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v36 - 8) + 16))(v34, v35, v36);
  __swift_storeEnumTagSinglePayload((uint64_t)v34, 0, 1, v36);
  return a1;
}

uint64_t initializeWithTake for SiriNLOverride(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v7 = a3[9];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_2195573AC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  v12 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  v13 = a3[13];
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  *(_DWORD *)(a1 + v13) = *(_DWORD *)(a2 + v13);
  v14 = a3[15];
  *(_OWORD *)(a1 + a3[14]) = *(_OWORD *)(a2 + a3[14]);
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = sub_219557FDC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
    __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  }
  return a1;
}

_QWORD *assignWithTake for SiriNLOverride(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  v9 = a3[9];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2195573AC();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v15 = *(_QWORD *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_7:
  v17 = a3[11];
  *((_BYTE *)a1 + a3[10]) = *((_BYTE *)a2 + a3[10]);
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = a3[12];
  v23 = (uint64_t)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = *(_QWORD *)((char *)a1 + v22 + 8);
  if (v25 >> 60 == 15)
  {
LABEL_10:
    *(_OWORD *)v23 = *(_OWORD *)v24;
    goto LABEL_12;
  }
  v26 = *((_QWORD *)v24 + 1);
  if (v26 >> 60 == 15)
  {
    sub_21954AD6C(v23);
    goto LABEL_10;
  }
  v27 = *(_QWORD *)v23;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_QWORD *)(v23 + 8) = v26;
  sub_21952EE5C(v27, v25);
LABEL_12:
  v28 = a3[14];
  *(_DWORD *)((char *)a1 + a3[13]) = *(_DWORD *)((char *)a2 + a3[13]);
  v29 = (uint64_t)a1 + v28;
  v30 = (char *)a2 + v28;
  v31 = *(_QWORD *)((char *)a1 + v28 + 8);
  if (v31 >> 60 == 15)
  {
LABEL_15:
    *(_OWORD *)v29 = *(_OWORD *)v30;
    goto LABEL_17;
  }
  v32 = *((_QWORD *)v30 + 1);
  if (v32 >> 60 == 15)
  {
    sub_21954AD6C(v29);
    goto LABEL_15;
  }
  v33 = *(_QWORD *)v29;
  *(_QWORD *)v29 = *(_QWORD *)v30;
  *(_QWORD *)(v29 + 8) = v32;
  sub_21952EE5C(v33, v31);
LABEL_17:
  v34 = a3[15];
  v35 = (char *)a1 + v34;
  v36 = (char *)a2 + v34;
  v37 = sub_219557FDC();
  v38 = __swift_getEnumTagSinglePayload((uint64_t)v35, 1, v37);
  v39 = __swift_getEnumTagSinglePayload((uint64_t)v36, 1, v37);
  if (!v38)
  {
    v40 = *(_QWORD *)(v37 - 8);
    if (!v39)
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 40))(v35, v36, v37);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v35, v37);
    goto LABEL_22;
  }
  if (v39)
  {
LABEL_22:
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
    memcpy(v35, v36, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v37 - 8) + 32))(v35, v36, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
  return a1;
}

uint64_t sub_21955592C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == (_DWORD)a2)
    {
      v9 = v8;
      v10 = *(int *)(a3 + 36);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
      v10 = *(int *)(a3 + 60);
    }
    return __swift_getEnumTagSinglePayload(a1 + v10, a2, v9);
  }
}

void sub_2195559CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_41();
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F220D8);
    if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
    {
      v9 = v8;
      v10 = *(int *)(a4 + 36);
    }
    else
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F21E18);
      v10 = *(int *)(a4 + 60);
    }
    __swift_storeEnumTagSinglePayload(a1 + v10, a2, a2, v9);
  }
}

void sub_219555A60()
{
  unint64_t v0;
  unint64_t v1;

  sub_219555B44(319, &qword_253F221B0, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
  if (v0 <= 0x3F)
  {
    sub_219555B44(319, &qword_253F21FF8, (void (*)(uint64_t))MEMORY[0x24BE9DD50]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_219555B44(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_2195582E8();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_99();
}

uint64_t getEnumTagSinglePayload for SiriNLOverride.Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 1) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriNLOverride.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_219555C60 + 4 * byte_21955954C[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_219555C94 + 4 * byte_219559547[v4]))();
}

uint64_t sub_219555C94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_219555C9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x219555CA4);
  return result;
}

uint64_t sub_219555CB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x219555CB8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_219555CBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_219555CC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_219555CD0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SiriNLOverride.Error()
{
  return &type metadata for SiriNLOverride.Error;
}

uint64_t getEnumTagSinglePayload for SiriNLOverride.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF7)
  {
    if (a2 + 9 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 9) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 10;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v5 = v6 - 10;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriNLOverride.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_219555DC0 + 4 * byte_219559556[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_219555DF4 + 4 * byte_219559551[v4]))();
}

uint64_t sub_219555DF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_219555DFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x219555E04);
  return result;
}

uint64_t sub_219555E10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x219555E18);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_219555E1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_219555E24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriNLOverride.CodingKeys()
{
  return &type metadata for SiriNLOverride.CodingKeys;
}

uint64_t sub_219555E40(uint64_t a1, char a2)
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
  unint64_t i;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
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
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t *v37;
  int64_t v38;
  uint64_t v39;
  char v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25508CFF8);
  v40 = a2;
  v6 = sub_2195583C0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v39 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v37 = v2;
  v38 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  if (!v10)
    goto LABEL_7;
LABEL_6:
  v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v22 = *v20;
    v21 = v20[1];
    v23 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * i);
    v24 = *v23;
    v25 = v23[1];
    if ((v40 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2195584BC();
    sub_2195581B0();
    result = sub_2195584D4();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) == 0)
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      while (++v28 != v31 || (v30 & 1) == 0)
      {
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v11 + 8 * v28);
        if (v33 != -1)
        {
          v29 = __clz(__rbit64(~v33)) + (v28 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    v34 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v29);
    *v34 = v22;
    v34[1] = v21;
    v35 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v29);
    *v35 = v24;
    v35[1] = v25;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_41;
    if (v16 >= v38)
    {
      swift_release();
      v3 = v37;
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v39 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v38)
        goto LABEL_32;
      v18 = *(_QWORD *)(v39 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_18:
    v10 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v38)
  {
    v18 = *(_QWORD *)(v39 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_42;
        if (v13 >= v38)
          goto LABEL_32;
        v18 = *(_QWORD *)(v39 + 8 * v13);
        ++v19;
        if (v18)
          goto LABEL_18;
      }
    }
    v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  v3 = v37;
LABEL_34:
  if ((v40 & 1) != 0)
  {
    v36 = 1 << *(_BYTE *)(v5 + 32);
    if (v36 >= 64)
      sub_21955614C(0, (unint64_t)(v36 + 63) >> 6, v17);
    else
      *v17 = -1 << v36;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_21955614C(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_219556168@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_2195583F0();
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return 0x7865547475706E69;
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return 0x656469727265766FLL;
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  unint64_t v0;
  uint64_t v1;

  return sub_21953AA68(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_6@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_219558408();
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  return 0x64656C62616E65;
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return 0x6E6F697461657263;
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_2195581B0();
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return 0x656372756F73;
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  return 0x656C61636F6CLL;
}

uint64_t OUTLINED_FUNCTION_21_3@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_22_6()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = 0;
  *(_OWORD *)(v1 - 128) = 0u;
  *(_OWORD *)(v1 - 112) = 0u;
  return v0;
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  return sub_2195584BC();
}

uint64_t OUTLINED_FUNCTION_29_4()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 112));
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_31_4()
{
  return sub_2195583E4();
}

uint64_t OUTLINED_FUNCTION_32_4()
{
  return sub_219558138();
}

uint64_t OUTLINED_FUNCTION_34_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
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

void sub_2195564C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2195565F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_219556684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2195568CC()
{
  void *v0;
  void *v1;
  uint64_t v2;

  __cxa_end_catch();
  marisa::Agent::~Agent((marisa::Agent *)&v2);

  JUMPOUT(0x21955694CLL);
}

void sub_2195568DC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_2195568EC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  uint64_t v23;

  marisa::Agent::~Agent((marisa::Agent *)&v23);

  JUMPOUT(0x21955694CLL);
}

void sub_219556B40()
{
  void *v0;
  void *v1;
  uint64_t v2;

  __cxa_end_catch();
  marisa::Agent::~Agent((marisa::Agent *)&v2);

  JUMPOUT(0x219556BB4);
}

void sub_219556B50(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_219556B60(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;
  uint64_t v23;

  marisa::Agent::~Agent((marisa::Agent *)&v23);

  JUMPOUT(0x219556BB4);
}

void sub_219556C50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_219556DD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_2195570D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;

  marisa::Agent::~Agent((marisa::Agent *)&a9);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]();
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_24DA9E180, MEMORY[0x24BEDAAF0]);
}

void sub_2195572DC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

uint64_t sub_21955731C()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_219557328()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_219557334()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_219557340()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21955734C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_219557358()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_219557364()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_219557370()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21955737C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_219557388()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_219557394()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2195573A0()
{
  return MEMORY[0x24BDCE898]();
}

uint64_t sub_2195573AC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2195573B8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2195573C4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2195573D0()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_2195573DC()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2195573E8()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_2195573F4()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_219557400()
{
  return MEMORY[0x24BDCEBA0]();
}

uint64_t sub_21955740C()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_219557418()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_219557424()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_219557430()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_21955743C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_219557448()
{
  return MEMORY[0x24BE9C130]();
}

uint64_t sub_219557454()
{
  return MEMORY[0x24BE9C140]();
}

uint64_t sub_219557460()
{
  return MEMORY[0x24BE9C148]();
}

uint64_t sub_21955746C()
{
  return MEMORY[0x24BE9C168]();
}

uint64_t sub_219557478()
{
  return MEMORY[0x24BE9C178]();
}

uint64_t sub_219557484()
{
  return MEMORY[0x24BE9C180]();
}

uint64_t sub_219557490()
{
  return MEMORY[0x24BE9C188]();
}

uint64_t sub_21955749C()
{
  return MEMORY[0x24BE9C190]();
}

uint64_t sub_2195574A8()
{
  return MEMORY[0x24BE9C1E0]();
}

uint64_t sub_2195574B4()
{
  return MEMORY[0x24BE9C208]();
}

uint64_t sub_2195574C0()
{
  return MEMORY[0x24BE9C220]();
}

uint64_t sub_2195574CC()
{
  return MEMORY[0x24BE9C230]();
}

uint64_t sub_2195574D8()
{
  return MEMORY[0x24BE9C238]();
}

uint64_t sub_2195574E4()
{
  return MEMORY[0x24BE9C240]();
}

uint64_t sub_2195574F0()
{
  return MEMORY[0x24BE9C250]();
}

uint64_t sub_2195574FC()
{
  return MEMORY[0x24BE9C258]();
}

uint64_t sub_219557508()
{
  return MEMORY[0x24BE9C260]();
}

uint64_t sub_219557514()
{
  return MEMORY[0x24BE9C268]();
}

uint64_t sub_219557520()
{
  return MEMORY[0x24BE9C270]();
}

uint64_t sub_21955752C()
{
  return MEMORY[0x24BE9C280]();
}

uint64_t sub_219557538()
{
  return MEMORY[0x24BE9C288]();
}

uint64_t sub_219557544()
{
  return MEMORY[0x24BE9C2A0]();
}

uint64_t sub_219557550()
{
  return MEMORY[0x24BE9C2A8]();
}

uint64_t sub_21955755C()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_219557568()
{
  return MEMORY[0x24BE9C2D8]();
}

uint64_t sub_219557574()
{
  return MEMORY[0x24BE9C2E8]();
}

uint64_t sub_219557580()
{
  return MEMORY[0x24BE9C2F8]();
}

uint64_t sub_21955758C()
{
  return MEMORY[0x24BE9C308]();
}

uint64_t sub_219557598()
{
  return MEMORY[0x24BE9C320]();
}

uint64_t sub_2195575A4()
{
  return MEMORY[0x24BE9C390]();
}

uint64_t sub_2195575B0()
{
  return MEMORY[0x24BE9C3C8]();
}

uint64_t sub_2195575BC()
{
  return MEMORY[0x24BE9C3D8]();
}

uint64_t sub_2195575C8()
{
  return MEMORY[0x24BE9C3E0]();
}

uint64_t sub_2195575D4()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_2195575E0()
{
  return MEMORY[0x24BE9C3F0]();
}

uint64_t sub_2195575EC()
{
  return MEMORY[0x24BE9C418]();
}

uint64_t sub_2195575F8()
{
  return MEMORY[0x24BE9C438]();
}

uint64_t sub_219557604()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_219557610()
{
  return MEMORY[0x24BE9C4C0]();
}

uint64_t sub_21955761C()
{
  return MEMORY[0x24BE9C4C8]();
}

uint64_t sub_219557628()
{
  return MEMORY[0x24BE9C4D0]();
}

uint64_t sub_219557634()
{
  return MEMORY[0x24BE9C4D8]();
}

uint64_t sub_219557640()
{
  return MEMORY[0x24BE9C4E0]();
}

uint64_t sub_21955764C()
{
  return MEMORY[0x24BE9C4E8]();
}

uint64_t sub_219557658()
{
  return MEMORY[0x24BE9C4F0]();
}

uint64_t sub_219557664()
{
  return MEMORY[0x24BE9C500]();
}

uint64_t sub_219557670()
{
  return MEMORY[0x24BE9C508]();
}

uint64_t sub_21955767C()
{
  return MEMORY[0x24BE9C520]();
}

uint64_t sub_219557688()
{
  return MEMORY[0x24BE9C558]();
}

uint64_t sub_219557694()
{
  return MEMORY[0x24BE9C560]();
}

uint64_t sub_2195576A0()
{
  return MEMORY[0x24BE9C568]();
}

uint64_t sub_2195576AC()
{
  return MEMORY[0x24BE9C578]();
}

uint64_t sub_2195576B8()
{
  return MEMORY[0x24BE9C580]();
}

uint64_t sub_2195576C4()
{
  return MEMORY[0x24BE9C588]();
}

uint64_t sub_2195576D0()
{
  return MEMORY[0x24BE9C590]();
}

uint64_t sub_2195576DC()
{
  return MEMORY[0x24BE9C5A0]();
}

uint64_t sub_2195576E8()
{
  return MEMORY[0x24BE9C5B0]();
}

uint64_t sub_2195576F4()
{
  return MEMORY[0x24BE9C5C0]();
}

uint64_t sub_219557700()
{
  return MEMORY[0x24BE9C5C8]();
}

uint64_t sub_21955770C()
{
  return MEMORY[0x24BE9C5D0]();
}

uint64_t sub_219557718()
{
  return MEMORY[0x24BE9C5D8]();
}

uint64_t sub_219557724()
{
  return MEMORY[0x24BE9C5E0]();
}

uint64_t sub_219557730()
{
  return MEMORY[0x24BE9C5E8]();
}

uint64_t sub_21955773C()
{
  return MEMORY[0x24BE9C5F0]();
}

uint64_t sub_219557748()
{
  return MEMORY[0x24BE9C5F8]();
}

uint64_t sub_219557754()
{
  return MEMORY[0x24BE9C600]();
}

uint64_t sub_219557760()
{
  return MEMORY[0x24BE9C608]();
}

uint64_t sub_21955776C()
{
  return MEMORY[0x24BE9C610]();
}

uint64_t sub_219557778()
{
  return MEMORY[0x24BE9C618]();
}

uint64_t sub_219557784()
{
  return MEMORY[0x24BE9C620]();
}

uint64_t sub_219557790()
{
  return MEMORY[0x24BE9C628]();
}

uint64_t sub_21955779C()
{
  return MEMORY[0x24BE9C630]();
}

uint64_t sub_2195577A8()
{
  return MEMORY[0x24BE9C638]();
}

uint64_t sub_2195577B4()
{
  return MEMORY[0x24BE9C640]();
}

uint64_t sub_2195577C0()
{
  return MEMORY[0x24BE9C6C0]();
}

uint64_t sub_2195577CC()
{
  return MEMORY[0x24BE9C6C8]();
}

uint64_t sub_2195577D8()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_2195577E4()
{
  return MEMORY[0x24BE9C6E8]();
}

uint64_t sub_2195577F0()
{
  return MEMORY[0x24BE9C6F0]();
}

uint64_t sub_2195577FC()
{
  return MEMORY[0x24BE9C6F8]();
}

uint64_t sub_219557808()
{
  return MEMORY[0x24BE9C708]();
}

uint64_t sub_219557814()
{
  return MEMORY[0x24BE9C710]();
}

uint64_t sub_219557820()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_21955782C()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_219557838()
{
  return MEMORY[0x24BE9C730]();
}

uint64_t sub_219557844()
{
  return MEMORY[0x24BE9C738]();
}

uint64_t sub_219557850()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_21955785C()
{
  return MEMORY[0x24BE9C750]();
}

uint64_t sub_219557868()
{
  return MEMORY[0x24BE9C758]();
}

uint64_t sub_219557874()
{
  return MEMORY[0x24BE9C760]();
}

uint64_t sub_219557880()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_21955788C()
{
  return MEMORY[0x24BE9C778]();
}

uint64_t sub_219557898()
{
  return MEMORY[0x24BE9C780]();
}

uint64_t sub_2195578A4()
{
  return MEMORY[0x24BE9C788]();
}

uint64_t sub_2195578B0()
{
  return MEMORY[0x24BE9C790]();
}

uint64_t sub_2195578BC()
{
  return MEMORY[0x24BE9C798]();
}

uint64_t sub_2195578C8()
{
  return MEMORY[0x24BE9C7A8]();
}

uint64_t sub_2195578D4()
{
  return MEMORY[0x24BE9C7B0]();
}

uint64_t sub_2195578E0()
{
  return MEMORY[0x24BE9C7B8]();
}

uint64_t sub_2195578EC()
{
  return MEMORY[0x24BE9C7C8]();
}

uint64_t sub_2195578F8()
{
  return MEMORY[0x24BE9C7D0]();
}

uint64_t sub_219557904()
{
  return MEMORY[0x24BE9C7E0]();
}

uint64_t sub_219557910()
{
  return MEMORY[0x24BE9C7E8]();
}

uint64_t sub_21955791C()
{
  return MEMORY[0x24BE9C7F8]();
}

uint64_t sub_219557928()
{
  return MEMORY[0x24BE9C800]();
}

uint64_t sub_219557934()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_219557940()
{
  return MEMORY[0x24BE9C8B0]();
}

uint64_t sub_21955794C()
{
  return MEMORY[0x24BE9C8B8]();
}

uint64_t sub_219557958()
{
  return MEMORY[0x24BE9C8C0]();
}

uint64_t sub_219557964()
{
  return MEMORY[0x24BE9C8C8]();
}

uint64_t sub_219557970()
{
  return MEMORY[0x24BE9C8D0]();
}

uint64_t sub_21955797C()
{
  return MEMORY[0x24BE9C8D8]();
}

uint64_t sub_219557988()
{
  return MEMORY[0x24BE9C8E8]();
}

uint64_t sub_219557994()
{
  return MEMORY[0x24BE9C8F0]();
}

uint64_t sub_2195579A0()
{
  return MEMORY[0x24BE9C8F8]();
}

uint64_t sub_2195579AC()
{
  return MEMORY[0x24BE9C900]();
}

uint64_t sub_2195579B8()
{
  return MEMORY[0x24BE9C908]();
}

uint64_t sub_2195579C4()
{
  return MEMORY[0x24BE9C910]();
}

uint64_t sub_2195579D0()
{
  return MEMORY[0x24BE9C918]();
}

uint64_t sub_2195579DC()
{
  return MEMORY[0x24BE9C920]();
}

uint64_t sub_2195579E8()
{
  return MEMORY[0x24BE9C928]();
}

uint64_t sub_2195579F4()
{
  return MEMORY[0x24BE9C938]();
}

uint64_t sub_219557A00()
{
  return MEMORY[0x24BE9C940]();
}

uint64_t sub_219557A0C()
{
  return MEMORY[0x24BE9C948]();
}

uint64_t sub_219557A18()
{
  return MEMORY[0x24BE9C950]();
}

uint64_t sub_219557A24()
{
  return MEMORY[0x24BE9C958]();
}

uint64_t sub_219557A30()
{
  return MEMORY[0x24BE9C968]();
}

uint64_t sub_219557A3C()
{
  return MEMORY[0x24BE9C970]();
}

uint64_t sub_219557A48()
{
  return MEMORY[0x24BE9C978]();
}

uint64_t sub_219557A54()
{
  return MEMORY[0x24BE9C980]();
}

uint64_t sub_219557A60()
{
  return MEMORY[0x24BE9C988]();
}

uint64_t sub_219557A6C()
{
  return MEMORY[0x24BE9C990]();
}

uint64_t sub_219557A78()
{
  return MEMORY[0x24BE9C998]();
}

uint64_t sub_219557A84()
{
  return MEMORY[0x24BE9C9A0]();
}

uint64_t sub_219557A90()
{
  return MEMORY[0x24BE9C9A8]();
}

uint64_t sub_219557A9C()
{
  return MEMORY[0x24BE9C9B0]();
}

uint64_t sub_219557AA8()
{
  return MEMORY[0x24BE9C9B8]();
}

uint64_t sub_219557AB4()
{
  return MEMORY[0x24BE9C9D8]();
}

uint64_t sub_219557AC0()
{
  return MEMORY[0x24BE9C9E8]();
}

uint64_t sub_219557ACC()
{
  return MEMORY[0x24BE9C9F0]();
}

uint64_t sub_219557AD8()
{
  return MEMORY[0x24BE9C9F8]();
}

uint64_t sub_219557AE4()
{
  return MEMORY[0x24BE9CA00]();
}

uint64_t sub_219557AF0()
{
  return MEMORY[0x24BE9CA08]();
}

uint64_t sub_219557AFC()
{
  return MEMORY[0x24BE9CA10]();
}

uint64_t sub_219557B08()
{
  return MEMORY[0x24BE9CA18]();
}

uint64_t sub_219557B14()
{
  return MEMORY[0x24BE9CA28]();
}

uint64_t sub_219557B20()
{
  return MEMORY[0x24BE9CA30]();
}

uint64_t sub_219557B2C()
{
  return MEMORY[0x24BE9CA38]();
}

uint64_t sub_219557B38()
{
  return MEMORY[0x24BE9CA48]();
}

uint64_t sub_219557B44()
{
  return MEMORY[0x24BE9CA50]();
}

uint64_t sub_219557B50()
{
  return MEMORY[0x24BE9CA58]();
}

uint64_t sub_219557B5C()
{
  return MEMORY[0x24BE9CA60]();
}

uint64_t sub_219557B68()
{
  return MEMORY[0x24BE9CAB8]();
}

uint64_t sub_219557B74()
{
  return MEMORY[0x24BE9CAC0]();
}

uint64_t sub_219557B80()
{
  return MEMORY[0x24BE9CAD0]();
}

uint64_t sub_219557B8C()
{
  return MEMORY[0x24BE9CAE0]();
}

uint64_t sub_219557B98()
{
  return MEMORY[0x24BE9CAF0]();
}

uint64_t sub_219557BA4()
{
  return MEMORY[0x24BE9CAF8]();
}

uint64_t sub_219557BB0()
{
  return MEMORY[0x24BE9CB08]();
}

uint64_t sub_219557BBC()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_219557BC8()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_219557BD4()
{
  return MEMORY[0x24BE9CB88]();
}

uint64_t sub_219557BE0()
{
  return MEMORY[0x24BE9CBD0]();
}

uint64_t sub_219557BEC()
{
  return MEMORY[0x24BE9CBE8]();
}

uint64_t sub_219557BF8()
{
  return MEMORY[0x24BE9CBF8]();
}

uint64_t sub_219557C04()
{
  return MEMORY[0x24BE9CC08]();
}

uint64_t sub_219557C10()
{
  return MEMORY[0x24BE9CC28]();
}

uint64_t sub_219557C1C()
{
  return MEMORY[0x24BE9CC38]();
}

uint64_t sub_219557C28()
{
  return MEMORY[0x24BE9CC40]();
}

uint64_t sub_219557C34()
{
  return MEMORY[0x24BE9CC48]();
}

uint64_t sub_219557C40()
{
  return MEMORY[0x24BE9CC58]();
}

uint64_t sub_219557C4C()
{
  return MEMORY[0x24BE9CC68]();
}

uint64_t sub_219557C58()
{
  return MEMORY[0x24BE9CC80]();
}

uint64_t sub_219557C64()
{
  return MEMORY[0x24BE9CC88]();
}

uint64_t sub_219557C70()
{
  return MEMORY[0x24BE9CCA8]();
}

uint64_t sub_219557C7C()
{
  return MEMORY[0x24BE9CCC0]();
}

uint64_t sub_219557C88()
{
  return MEMORY[0x24BE9CCC8]();
}

uint64_t sub_219557C94()
{
  return MEMORY[0x24BE9CCD8]();
}

uint64_t sub_219557CA0()
{
  return MEMORY[0x24BE9CCE0]();
}

uint64_t sub_219557CAC()
{
  return MEMORY[0x24BE9CCE8]();
}

uint64_t sub_219557CB8()
{
  return MEMORY[0x24BE9CCF0]();
}

uint64_t sub_219557CC4()
{
  return MEMORY[0x24BE9CCF8]();
}

uint64_t sub_219557CD0()
{
  return MEMORY[0x24BE9CD00]();
}

uint64_t sub_219557CDC()
{
  return MEMORY[0x24BE9CD08]();
}

uint64_t sub_219557CE8()
{
  return MEMORY[0x24BE9CD38]();
}

uint64_t sub_219557CF4()
{
  return MEMORY[0x24BE9CD48]();
}

uint64_t sub_219557D00()
{
  return MEMORY[0x24BE9CD50]();
}

uint64_t sub_219557D0C()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_219557D18()
{
  return MEMORY[0x24BE9CDB8]();
}

uint64_t sub_219557D24()
{
  return MEMORY[0x24BE9CDC0]();
}

uint64_t sub_219557D30()
{
  return MEMORY[0x24BE9CDC8]();
}

uint64_t sub_219557D3C()
{
  return MEMORY[0x24BE9CDD0]();
}

uint64_t sub_219557D48()
{
  return MEMORY[0x24BE9CDE8]();
}

uint64_t sub_219557D54()
{
  return MEMORY[0x24BE9CDF0]();
}

uint64_t sub_219557D60()
{
  return MEMORY[0x24BE9CDF8]();
}

uint64_t sub_219557D6C()
{
  return MEMORY[0x24BE9CE20]();
}

uint64_t sub_219557D78()
{
  return MEMORY[0x24BE9CE28]();
}

uint64_t sub_219557D84()
{
  return MEMORY[0x24BE9CE30]();
}

uint64_t sub_219557D90()
{
  return MEMORY[0x24BE9CEF8]();
}

uint64_t sub_219557D9C()
{
  return MEMORY[0x24BE9CF10]();
}

uint64_t sub_219557DA8()
{
  return MEMORY[0x24BE9CF18]();
}

uint64_t sub_219557DB4()
{
  return MEMORY[0x24BE9CF20]();
}

uint64_t sub_219557DC0()
{
  return MEMORY[0x24BE9CF28]();
}

uint64_t sub_219557DCC()
{
  return MEMORY[0x24BE9CF30]();
}

uint64_t sub_219557DD8()
{
  return MEMORY[0x24BE9CF40]();
}

uint64_t sub_219557DE4()
{
  return MEMORY[0x24BE9CF48]();
}

uint64_t sub_219557DF0()
{
  return MEMORY[0x24BE9CF50]();
}

uint64_t _s12SiriNLUTypes0A31_Nlu_Internal_ComponentOverrideV0A12NLUOverridesE9namespaceAA0a1_c1_d1_F8MetadataV0F9NamespaceOvg_0()
{
  return MEMORY[0x24BE9CF58]();
}

uint64_t sub_219557E08()
{
  return MEMORY[0x24BE9CF60]();
}

uint64_t sub_219557E14()
{
  return MEMORY[0x24BE9CF68]();
}

uint64_t sub_219557E20()
{
  return MEMORY[0x24BE9CF70]();
}

uint64_t sub_219557E2C()
{
  return MEMORY[0x24BE9CF78]();
}

uint64_t sub_219557E38()
{
  return MEMORY[0x24BE9CF80]();
}

uint64_t sub_219557E44()
{
  return MEMORY[0x24BE9CF88]();
}

uint64_t sub_219557E50()
{
  return MEMORY[0x24BE9CF90]();
}

uint64_t sub_219557E5C()
{
  return MEMORY[0x24BE9CFC8]();
}

uint64_t sub_219557E68()
{
  return MEMORY[0x24BE9CFD0]();
}

uint64_t sub_219557E74()
{
  return MEMORY[0x24BE9CFD8]();
}

uint64_t sub_219557E80()
{
  return MEMORY[0x24BE9CFE0]();
}

uint64_t sub_219557E8C()
{
  return MEMORY[0x24BE9CFE8]();
}

uint64_t sub_219557E98()
{
  return MEMORY[0x24BE9CFF0]();
}

uint64_t sub_219557EA4()
{
  return MEMORY[0x24BE9CFF8]();
}

uint64_t sub_219557EB0()
{
  return MEMORY[0x24BE9D000]();
}

uint64_t sub_219557EBC()
{
  return MEMORY[0x24BE9D008]();
}

uint64_t sub_219557EC8()
{
  return MEMORY[0x24BE9D0C8]();
}

uint64_t sub_219557ED4()
{
  return MEMORY[0x24BE9D0D0]();
}

uint64_t sub_219557EE0()
{
  return MEMORY[0x24BE9D0D8]();
}

uint64_t sub_219557EEC()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t sub_219557EF8()
{
  return MEMORY[0x24BE9D160]();
}

uint64_t sub_219557F04()
{
  return MEMORY[0x24BE9D168]();
}

uint64_t sub_219557F10()
{
  return MEMORY[0x24BE9D170]();
}

uint64_t sub_219557F1C()
{
  return MEMORY[0x24BE9D178]();
}

uint64_t sub_219557F28()
{
  return MEMORY[0x24BE9D180]();
}

uint64_t sub_219557F34()
{
  return MEMORY[0x24BE9D188]();
}

uint64_t sub_219557F40()
{
  return MEMORY[0x24BE9D4C8]();
}

uint64_t sub_219557F4C()
{
  return MEMORY[0x24BE9D4D8]();
}

uint64_t sub_219557F58()
{
  return MEMORY[0x24BE9D4E0]();
}

uint64_t sub_219557F64()
{
  return MEMORY[0x24BE9D4E8]();
}

uint64_t sub_219557F70()
{
  return MEMORY[0x24BE9D4F0]();
}

uint64_t sub_219557F7C()
{
  return MEMORY[0x24BE9D4F8]();
}

uint64_t sub_219557F88()
{
  return MEMORY[0x24BE9DD18]();
}

uint64_t sub_219557F94()
{
  return MEMORY[0x24BE9DD20]();
}

uint64_t sub_219557FA0()
{
  return MEMORY[0x24BE9DD28]();
}

uint64_t sub_219557FAC()
{
  return MEMORY[0x24BE9DD30]();
}

uint64_t sub_219557FB8()
{
  return MEMORY[0x24BE9DD38]();
}

uint64_t sub_219557FC4()
{
  return MEMORY[0x24BE9DD40]();
}

uint64_t sub_219557FD0()
{
  return MEMORY[0x24BE9DD48]();
}

uint64_t sub_219557FDC()
{
  return MEMORY[0x24BE9DD50]();
}

uint64_t sub_219557FE8()
{
  return MEMORY[0x24BE9E000]();
}

uint64_t sub_219557FF4()
{
  return MEMORY[0x24BE9E018]();
}

uint64_t sub_219558000()
{
  return MEMORY[0x24BE9F9C0]();
}

uint64_t sub_21955800C()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_219558018()
{
  return MEMORY[0x24BE9FFD0]();
}

uint64_t sub_219558024()
{
  return MEMORY[0x24BE9FFD8]();
}

uint64_t sub_219558030()
{
  return MEMORY[0x24BEA33C0]();
}

uint64_t sub_21955803C()
{
  return MEMORY[0x24BEA33C8]();
}

uint64_t sub_219558048()
{
  return MEMORY[0x24BEA33E0]();
}

uint64_t sub_219558054()
{
  return MEMORY[0x24BEA33F8]();
}

uint64_t sub_219558060()
{
  return MEMORY[0x24BEA3410]();
}

uint64_t sub_21955806C()
{
  return MEMORY[0x24BEA3440]();
}

uint64_t sub_219558078()
{
  return MEMORY[0x24BEA3450]();
}

uint64_t sub_219558084()
{
  return MEMORY[0x24BEA3458]();
}

uint64_t sub_219558090()
{
  return MEMORY[0x24BEA3528]();
}

uint64_t sub_21955809C()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_2195580A8()
{
  return MEMORY[0x24BEA3640]();
}

uint64_t sub_2195580B4()
{
  return MEMORY[0x24BEA3818]();
}

uint64_t sub_2195580C0()
{
  return MEMORY[0x24BE5B9B8]();
}

uint64_t sub_2195580CC()
{
  return MEMORY[0x24BE5B9C0]();
}

uint64_t sub_2195580D8()
{
  return MEMORY[0x24BE5B9C8]();
}

uint64_t sub_2195580E4()
{
  return MEMORY[0x24BE5BA28]();
}

uint64_t sub_2195580F0()
{
  return MEMORY[0x24BE5BA30]();
}

uint64_t sub_2195580FC()
{
  return MEMORY[0x24BE5BA38]();
}

uint64_t sub_219558108()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_219558114()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_219558120()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_21955812C()
{
  return MEMORY[0x24BE5C1C0]();
}

uint64_t sub_219558138()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_219558144()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_219558150()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21955815C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_219558168()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_219558174()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_219558180()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21955818C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_219558198()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2195581A4()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2195581B0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2195581BC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2195581C8()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_2195581D4()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2195581E0()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2195581EC()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_2195581F8()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_219558204()
{
  return MEMORY[0x24BEE0C70]();
}

uint64_t sub_219558210()
{
  return MEMORY[0x24BEE0C80]();
}

uint64_t sub_21955821C()
{
  return MEMORY[0x24BEE0C98]();
}

uint64_t sub_219558228()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_219558234()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_219558240()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21955824C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_219558258()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_219558264()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_219558270()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21955827C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_219558288()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_219558294()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2195582A0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2195582AC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2195582B8()
{
  return MEMORY[0x24BEA3850]();
}

uint64_t sub_2195582C4()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_2195582D0()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_2195582DC()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2195582E8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2195582F4()
{
  return MEMORY[0x24BDD05E0]();
}

uint64_t sub_219558300()
{
  return MEMORY[0x24BDD0620]();
}

uint64_t sub_21955830C()
{
  return MEMORY[0x24BDD0628]();
}

uint64_t sub_219558318()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_219558324()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_219558330()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21955833C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_219558348()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_219558354()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_219558360()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21955836C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_219558378()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_219558384()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_219558390()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21955839C()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2195583A8()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_2195583B4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2195583C0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2195583CC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2195583D8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2195583E4()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2195583F0()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2195583FC()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_219558408()
{
  return MEMORY[0x24BEE3398]();
}

uint64_t sub_219558414()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_219558420()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21955842C()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_219558438()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_219558444()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_219558450()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21955845C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_219558468()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_219558474()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_219558480()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21955848C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_219558498()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2195584A4()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_2195584B0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2195584BC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2195584C8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2195584D4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2195584E0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2195584EC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2195584F8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x24BED8450]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t marisa::Trie::mmap(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x24BEDC580](this, a2);
}

uint64_t marisa::Trie::build(marisa::Trie *this, Keyset *a2)
{
  return MEMORY[0x24BEDC588](this, a2);
}

uint64_t marisa::Trie::Trie(marisa::Trie *this)
{
  return MEMORY[0x24BEDC598](this);
}

void marisa::Trie::~Trie(marisa::Trie *this)
{
  MEMORY[0x24BEDC5A0](this);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this, const char *a2)
{
  return MEMORY[0x24BEDC5A8](this, a2);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this)
{
  return MEMORY[0x24BEDC5B0](this);
}

uint64_t marisa::Agent::Agent(marisa::Agent *this)
{
  return MEMORY[0x24BEDC5B8](this);
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
  MEMORY[0x24BEDC5C0](this);
}

uint64_t marisa::Keyset::push_back(marisa::Keyset *this, const char *a2, float a3)
{
  return MEMORY[0x24BEDC5D0](this, a2, a3);
}

uint64_t marisa::Keyset::Keyset(marisa::Keyset *this)
{
  return MEMORY[0x24BEDC5D8](this);
}

uint64_t marisa::Trie::reverse_lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x24BEDC5E0](this, a2);
}

uint64_t marisa::Trie::predictive_search(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x24BEDC5E8](this, a2);
}

uint64_t marisa::Trie::save(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x24BEDC5F0](this, a2);
}

uint64_t marisa::Trie::size(marisa::Trie *this)
{
  return MEMORY[0x24BEDC5F8](this);
}

uint64_t marisa::Trie::lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x24BEDC608](this, a2);
}

uint64_t marisa::Trie::num_keys(marisa::Trie *this)
{
  return MEMORY[0x24BEDC610](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24DA9E198();
}

void operator delete(void *__p)
{
  off_24DA9E1A0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24DA9E1A8(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

