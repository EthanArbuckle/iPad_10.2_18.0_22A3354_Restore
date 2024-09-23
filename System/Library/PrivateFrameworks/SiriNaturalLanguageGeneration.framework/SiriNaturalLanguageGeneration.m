uint64_t sub_246E9AC38(uint64_t a1, int a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  _QWORD *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[3];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v3 = v2;
  v55 = a2;
  v57 = sub_246EBE008();
  v5 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57, v6);
  v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25765A820 != -1)
    swift_once();
  v9 = sub_246EBE02C();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  v56 = v10;
  v11 = sub_246EBE014();
  v12 = sub_246EBE1F4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = OUTLINED_FUNCTION_4();
    v53 = v5;
    v14 = v13;
    v59[0] = OUTLINED_FUNCTION_4();
    *(_DWORD *)v14 = 134218242;
    v58 = *(_QWORD *)(a1 + 16);
    sub_246EBE248();
    OUTLINED_FUNCTION_3();
    *(_WORD *)(v14 + 12) = 2080;
    v54 = a1;
    v16 = v3[2];
    v15 = v3[3];
    OUTLINED_FUNCTION_1();
    v58 = sub_246EBBD70(v16, v15, v59);
    sub_246EBE248();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246E99000, v11, v12, "%ld documents, query is '%s'", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  swift_release();
  OUTLINED_FUNCTION_3();
  v62 = MEMORY[0x24BEE4B00];
  v61 = MEMORY[0x24BEE4AF8];
  v17 = qword_25765A828;
  OUTLINED_FUNCTION_6();
  if (v17 != -1)
    swift_once();
  v18 = (id)qword_25765E570;
  sub_246EA3CEC((uint64_t)"QueryTokenization", 17, 2, v18, (uint64_t)v3);
  v54 = v19;

  v20 = (void *)qword_25765E570;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_6();
  v21 = v20;
  sub_246EA3DC4((uint64_t)"DocumentTokenization", 20, 2, v21, a1, v3);
  v23 = v22;
  v53 = v22;

  v24 = (id)qword_25765E570;
  OUTLINED_FUNCTION_5();
  sub_246EBE218();
  OUTLINED_FUNCTION_0();
  sub_246E9B61C(v23, (uint64_t)v3, &v61, &v62);
  sub_246EBE20C();
  OUTLINED_FUNCTION_0();
  v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v26 = v57;
  v25(v8, v57);
  v52 = v25;

  v27 = (id)qword_25765E570;
  OUTLINED_FUNCTION_1();
  v28 = v27;
  OUTLINED_FUNCTION_5();
  sub_246EBE218();
  v29 = (uint64_t)v3;
  v30 = a1;
  OUTLINED_FUNCTION_0();
  swift_bridgeObjectRetain();
  v31 = swift_bridgeObjectRetain();
  sub_246E9C580(v31, a1);
  v33 = v32;
  swift_bridgeObjectRelease();
  sub_246EBE20C();
  OUTLINED_FUNCTION_0();
  v25(v8, v26);

  swift_bridgeObjectRelease();
  v34 = (void *)qword_25765E570;
  v51 = v29;
  swift_retain();
  v35 = v54;
  OUTLINED_FUNCTION_1();
  swift_retain();
  v36 = v34;
  sub_246EA3E98((uint64_t)"QueryTFIDF", 10, 2, v36, v29, v35, v33);
  v38 = v37;

  v39 = v55 & 1;
  v40 = (_QWORD *)sub_246E9BC5C(v35, v53, v55 & 1);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3();
  v41 = sub_246E9B9BC(v40);
  if ((v42 & 1) != 0)
    v43 = 0;
  else
    v43 = v41;
  v60 = MEMORY[0x24BEE4AF8];
  v44 = (id)qword_25765E570;
  sub_246EBDFFC();
  sub_246EBE218();
  OUTLINED_FUNCTION_0();
  sub_246E9BA00((uint64_t)&v61, v39, v43, (uint64_t)v40, &v60, v30, v51, v33, v38);
  sub_246EBE20C();
  OUTLINED_FUNCTION_0();
  v52(v8, v57);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  v45 = sub_246EBE014();
  v46 = sub_246EBE1F4();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_DWORD *)v47 = 134217984;
    OUTLINED_FUNCTION_8();
    v59[0] = *(_QWORD *)(v60 + 16);
    sub_246EBE248();
    _os_log_impl(&dword_246E99000, v45, v46, "%ld documents scored", v47, 0xCu);
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_8();
  v48 = v60;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v48;
}

uint64_t sub_246E9B238(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  sub_246EB5024(0, v1, 0);
  v2 = v14;
  result = sub_246E9DB6C(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    v6 = result;
    if (result < 1 << *(_BYTE *)(a1 + 32))
    {
      v7 = v5;
      v8 = a1 + 64;
      while ((*(_QWORD *)(v8 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
      {
        if (v7 != *(_DWORD *)(a1 + 36))
          goto LABEL_18;
        v9 = *(float *)(*(_QWORD *)(a1 + 56) + 4 * v6);
        v11 = *(_QWORD *)(v14 + 16);
        v10 = *(_QWORD *)(v14 + 24);
        if (v11 >= v10 >> 1)
        {
          v13 = v8;
          result = (uint64_t)sub_246EB5024((char *)(v10 > 1), v11 + 1, 1);
          v8 = v13;
        }
        *(_QWORD *)(v14 + 16) = v11 + 1;
        *(float *)(v14 + 4 * v11 + 32) = v9 * v9;
        if ((uint64_t)v6 >= -(-1 << *(_BYTE *)(a1 + 32)))
          goto LABEL_19;
        if ((*(_QWORD *)(v8 + 8 * (v6 >> 6)) & (1 << v6)) == 0)
          goto LABEL_20;
        if (v7 != *(_DWORD *)(a1 + 36))
          goto LABEL_21;
        v12 = v8;
        result = sub_246EBE260();
        if (!--v1)
          return v2;
        v6 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          v8 = v12;
          v7 = *(_DWORD *)(a1 + 36);
          if (result < 1 << *(_BYTE *)(a1 + 32))
            continue;
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_246E9B3E4(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  float v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  float v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v22 = MEMORY[0x24BEE4AF8];
    sub_246EB5024(0, v2, 0);
    v4 = a2;
    v5 = v22;
    result = sub_246E9DB6C(a1);
    if ((result & 0x8000000000000000) == 0)
    {
      v8 = result;
      if (result < 1 << *(_BYTE *)(a1 + 32))
      {
        v9 = v7;
        v10 = a1 + 64;
        while ((*(_QWORD *)(v10 + 8 * (v8 >> 6)) & (1 << v8)) != 0)
        {
          if (v9 != *(_DWORD *)(a1 + 36))
            goto LABEL_24;
          v11 = *(float *)(*(_QWORD *)(a1 + 56) + 4 * v8);
          if (*(_QWORD *)(v4 + 16))
          {
            v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v8);
            v14 = *v12;
            v13 = v12[1];
            swift_bridgeObjectRetain();
            v15 = sub_246EB5650(v14, v13);
            v4 = a2;
            v16 = 0.0;
            if ((v17 & 1) != 0)
              v16 = *(float *)(*(_QWORD *)(a2 + 56) + 4 * v15);
            result = swift_bridgeObjectRelease();
          }
          else
          {
            v16 = 0.0;
          }
          v18 = v5;
          v23 = v5;
          v19 = *(_QWORD *)(v5 + 16);
          v20 = *(_QWORD *)(v18 + 24);
          if (v19 >= v20 >> 1)
          {
            result = (uint64_t)sub_246EB5024((char *)(v20 > 1), v19 + 1, 1);
            v4 = a2;
            v18 = v23;
          }
          *(_QWORD *)(v18 + 16) = v19 + 1;
          *(float *)(v18 + 4 * v19 + 32) = v11 * v16;
          if ((uint64_t)v8 >= -(-1 << *(_BYTE *)(a1 + 32)))
            goto LABEL_25;
          v10 = a1 + 64;
          if ((*(_QWORD *)(a1 + 64 + 8 * (v8 >> 6)) & (1 << v8)) == 0)
            goto LABEL_26;
          if (v9 != *(_DWORD *)(a1 + 36))
            goto LABEL_27;
          v5 = v18;
          result = sub_246EBE260();
          if (!--v2)
          {
            swift_bridgeObjectRelease();
            return v5;
          }
          v8 = result;
          if ((result & 0x8000000000000000) == 0)
          {
            v9 = *(_DWORD *)(a1 + 36);
            if (result < 1 << *(_BYTE *)(a1 + 32))
              continue;
          }
          goto LABEL_28;
        }
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
      }
    }
LABEL_28:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_246E9B61C(uint64_t result, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  void (*v5)(_QWORD *@<X8>);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  _QWORD *v46;

  v40 = *(_QWORD *)(result + 16);
  if (!v40)
    return result;
  swift_bridgeObjectRetain();
  v5 = 0;
  v6 = 0;
  while (2)
  {
    v42 = v6 + 1;
    v7 = swift_bridgeObjectRetain();
    v8 = sub_246E9BEC8(v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_246EB6E60();
    v9 = *(_QWORD *)(*a3 + 16);
    sub_246EB6ED8(v9);
    v10 = 0;
    v11 = *a3;
    *(_QWORD *)(v11 + 16) = v9 + 1;
    *(_QWORD *)(v11 + 8 * v9 + 32) = v8;
    v12 = *(_QWORD *)(v8 + 64);
    v43 = v8 + 64;
    v13 = 1 << *(_BYTE *)(v8 + 32);
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v15 = v14 & v12;
    v44 = (unint64_t)(v13 + 63) >> 6;
    v45 = v8;
    if ((v14 & v12) != 0)
    {
LABEL_7:
      v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v17 = v16 | (v10 << 6);
      goto LABEL_22;
    }
    while (1)
    {
      v18 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_41;
      if (v18 >= v44)
        break;
      v19 = *(_QWORD *)(v43 + 8 * v18);
      ++v10;
      if (v19)
        goto LABEL_21;
      v10 = v18 + 1;
      if (v18 + 1 >= v44)
        break;
      v19 = *(_QWORD *)(v43 + 8 * v10);
      if (v19)
        goto LABEL_21;
      v10 = v18 + 2;
      if (v18 + 2 >= v44)
        break;
      v19 = *(_QWORD *)(v43 + 8 * v10);
      if (v19)
        goto LABEL_21;
      v20 = v18 + 3;
      if (v20 >= v44)
        break;
      v19 = *(_QWORD *)(v43 + 8 * v20);
      if (!v19)
      {
        while (1)
        {
          v10 = v20 + 1;
          if (__OFADD__(v20, 1))
            goto LABEL_42;
          if (v10 >= v44)
            goto LABEL_35;
          v19 = *(_QWORD *)(v43 + 8 * v10);
          ++v20;
          if (v19)
            goto LABEL_21;
        }
      }
      v10 = v20;
LABEL_21:
      v15 = (v19 - 1) & v19;
      v17 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_22:
      v21 = (uint64_t *)(*(_QWORD *)(v45 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      swift_bridgeObjectRetain();
      sub_246E9DC2C((uint64_t)v5);
      swift_isUniquelyReferenced_nonNull_native();
      v24 = (_QWORD *)*a4;
      v46 = (_QWORD *)*a4;
      *a4 = 0x8000000000000000;
      v25 = sub_246EB5650(v23, v22);
      if (__OFADD__(v24[2], (v26 & 1) == 0))
      {
        __break(1u);
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        result = sub_246EBE398();
        __break(1u);
        return result;
      }
      v27 = v25;
      v28 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765AAA8);
      if ((sub_246EBE2C0() & 1) != 0)
      {
        v29 = sub_246EB5650(v23, v22);
        if ((v28 & 1) != (v30 & 1))
          goto LABEL_43;
        v27 = v29;
      }
      *a4 = v46;
      swift_bridgeObjectRelease();
      v31 = (_QWORD *)*a4;
      if ((v28 & 1) == 0)
      {
        v31[(v27 >> 6) + 8] |= 1 << v27;
        v32 = (uint64_t *)(v31[6] + 16 * v27);
        *v32 = v23;
        v32[1] = v22;
        *(_QWORD *)(v31[7] + 8 * v27) = 0;
        v33 = v31[2];
        v34 = v33 + 1;
        v35 = __OFADD__(v33, 1);
        swift_bridgeObjectRetain();
        if (v35)
          goto LABEL_40;
        v31[2] = v34;
      }
      swift_bridgeObjectRetain();
      v36 = v31[7];
      swift_bridgeObjectRelease();
      v37 = *(_QWORD *)(v36 + 8 * v27);
      v38 = __OFADD__(v37, 1);
      v39 = v37 + 1;
      if (v38)
        goto LABEL_39;
      *(_QWORD *)(v36 + 8 * v27) = v39;
      swift_bridgeObjectRelease();
      v5 = sub_246E9B9B4;
      if (v15)
        goto LABEL_7;
    }
LABEL_35:
    swift_release();
    v6 = v42;
    if (v42 != v40)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
  return sub_246E9DC2C((uint64_t)v5);
}

void sub_246E9B9B4(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_246E9B9BC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = a1[2];
  if (!v1)
    return 0;
  result = a1[4];
  v4 = v1 - 1;
  if (v1 != 1)
  {
    v5 = a1 + 5;
    do
    {
      v7 = *v5++;
      v6 = v7;
      if (result <= v7)
        result = v6;
      --v4;
    }
    while (v4);
  }
  return result;
}

void sub_246E9BA00(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v36;
  char v38;
  uint64_t v39;

  v39 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v39)
    return;
  v36 = (_QWORD *)(a7 + 80);
  v38 = a2 & (a3 > 0);
  v33 = a4 + 32;
  swift_bridgeObjectRetain();
  v12 = 0;
  v13 = (uint64_t *)(a6 + 40);
  v32 = a8;
  v14 = a6;
  while ((v38 & 1) != 0)
  {
    if (v12 >= *(_QWORD *)(a4 + 16))
      goto LABEL_18;
    if (*(_QWORD *)(v33 + 8 * v12) != a3)
      break;
    if (v12 >= *(_QWORD *)(a6 + 16))
      goto LABEL_19;
    v15 = *(v13 - 1);
    v16 = *v13;
    v17 = *a5;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a5 = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_246EB1090();
      v17 = v30;
      *a5 = v30;
    }
    v19 = *(_QWORD *)(v17 + 16);
    if (v19 >= *(_QWORD *)(v17 + 24) >> 1)
    {
      sub_246EB1090();
      v17 = v31;
      *a5 = v31;
    }
    *(_QWORD *)(v17 + 16) = v19 + 1;
    v20 = v17 + 24 * v19;
    *(_QWORD *)(v20 + 32) = v15;
    v21 = v20 + 32;
    v22 = 1.0;
    a8 = v32;
LABEL_14:
    ++v12;
    *(_QWORD *)(v21 + 8) = v16;
    *(float *)(v21 + 16) = v22;
    v13 += 2;
    a6 = v14;
    if (v39 == v12)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  v23 = swift_bridgeObjectRetain();
  v24 = sub_246E9C0AC(v23, a8);
  swift_bridgeObjectRelease();
  __swift_project_boxed_opaque_existential_1(v36, *(_QWORD *)(a7 + 104));
  sub_246E9C3C8(v24, a9);
  v22 = v25;
  swift_bridgeObjectRelease();
  if (v12 < *(_QWORD *)(a6 + 16))
  {
    v26 = *(v13 - 1);
    v16 = *v13;
    swift_bridgeObjectRetain();
    sub_246EB6E6C();
    v27 = *(_QWORD *)(*a5 + 16);
    sub_246EB6EE4(v27);
    v28 = *a5;
    *(_QWORD *)(v28 + 16) = v27 + 1;
    v29 = v28 + 24 * v27;
    *(_QWORD *)(v29 + 32) = v26;
    v21 = v29 + 32;
    goto LABEL_14;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  __break(1u);
}

uint64_t sub_246E9BC5C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(_QWORD *)(a2 + 16);
  if (v5)
  {
    v6 = sub_246EBE1AC();
    *(_QWORD *)(v6 + 16) = v5;
    v21 = v6;
    bzero((void *)(v6 + 32), 8 * v5);
    if ((a3 & 1) == 0)
      return v21;
  }
  else
  {
    v21 = MEMORY[0x24BEE4AF8];
    if ((a3 & 1) == 0)
      return v21;
  }
  v7 = swift_bridgeObjectRetain();
  v8 = sub_246E9BE18(v7);
  if (!v5)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v21;
  }
  v20 = a2 + 32;
  swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    v10 = *(_QWORD *)(v20 + 8 * v9);
    swift_bridgeObjectRetain();
    v11 = sub_246EBE1E8();
    v23 = v11;
    v12 = *(_QWORD *)(v10 + 16);
    if (v12)
    {
      v13 = (uint64_t *)(v10 + 40);
      do
      {
        v14 = *(v13 - 1);
        v15 = *v13;
        swift_bridgeObjectRetain();
        sub_246E9C7A4(&v22, v14, v15);
        swift_bridgeObjectRelease();
        v13 += 2;
        --v12;
      }
      while (v12);
      swift_bridgeObjectRelease();
      v16 = v23;
    }
    else
    {
      v16 = v11;
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    v17 = sub_246E9CC28(v16, v8);
    swift_bridgeObjectRelease();
    v18 = *(_QWORD *)(v17 + 16);
    result = swift_release();
    if (v9 >= *(_QWORD *)(v21 + 16))
      break;
    *(_QWORD *)(v21 + 32 + 8 * v9++) = v18;
    if (v9 == v5)
    {
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_246E9BE18(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_246EBE1E8();
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
      sub_246E9C7A4(&v9, v5, v6);
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

uint64_t sub_246E9BEC8(uint64_t a1)
{
  uint64_t v1;
  float v2;
  uint64_t v3;
  void (*v4)(_DWORD *@<X8>);
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  void (*v20)(_DWORD *@<X8>);
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 1.0 / (float)v1;
    v3 = swift_bridgeObjectRetain();
    v4 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4B00];
    v6 = (uint64_t *)(v3 + 40);
    while (1)
    {
      v8 = *(v6 - 1);
      v7 = *v6;
      swift_bridgeObjectRetain();
      sub_246E9DC2C((uint64_t)v4);
      swift_isUniquelyReferenced_nonNull_native();
      v9 = OUTLINED_FUNCTION_7();
      if (__OFADD__(v5[2], (v10 & 1) == 0))
        break;
      v11 = v9;
      v12 = v10;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765AA90);
      if ((sub_246EBE2C0() & 1) != 0)
      {
        v13 = OUTLINED_FUNCTION_7();
        if ((v12 & 1) != (v14 & 1))
          goto LABEL_19;
        v11 = v13;
      }
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v5[(v11 >> 6) + 8] |= 1 << v11;
        v15 = (_QWORD *)(v5[6] + 16 * v11);
        *v15 = v8;
        v15[1] = v7;
        *(_DWORD *)(v5[7] + 4 * v11) = 0;
        v16 = v5[2];
        v17 = v16 + 1;
        v18 = __OFADD__(v16, 1);
        swift_bridgeObjectRetain();
        if (v18)
          goto LABEL_18;
        v5[2] = v17;
      }
      v6 += 2;
      swift_bridgeObjectRetain();
      v19 = v5[7];
      swift_bridgeObjectRelease();
      *(float *)(v19 + 4 * v11) = v2 + *(float *)(v19 + 4 * v11);
      swift_bridgeObjectRelease();
      v4 = sub_246E9C0A4;
      if (!--v1)
      {
        swift_bridgeObjectRelease();
        v20 = sub_246E9C0A4;
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    result = sub_246EBE398();
    __break(1u);
  }
  else
  {
    v20 = 0;
    v5 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_16:
    sub_246E9DC2C((uint64_t)v20);
    return (uint64_t)v5;
  }
  return result;
}

void sub_246E9C0A4(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_246E9C0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  float v22;
  unint64_t v23;
  char v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  float v29;
  uint64_t *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t result;
  unint64_t v35;
  char v36;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v9 = 0;
  v10 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v9 << 6);
LABEL_20:
    if (*(_QWORD *)(a2 + 16))
    {
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
      v17 = *(float *)(*(_QWORD *)(a1 + 56) + 4 * v12);
      v19 = *v16;
      v18 = v16[1];
      OUTLINED_FUNCTION_1();
      v20 = sub_246EB5650(v19, v18);
      if ((v21 & 1) != 0)
      {
        v22 = *(float *)(*(_QWORD *)(a2 + 56) + 4 * v20);
        swift_isUniquelyReferenced_nonNull_native();
        v23 = sub_246EB5650(v19, v18);
        v36 = v24;
        if (__OFADD__(v10[2], (v24 & 1) == 0))
          goto LABEL_35;
        v35 = v23;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25765AA90);
        v25 = sub_246EBE2C0();
        v26 = v35;
        if ((v25 & 1) != 0)
        {
          v27 = sub_246EB5650(v19, v18);
          if ((v36 & 1) != (v28 & 1))
            goto LABEL_37;
          v26 = v27;
        }
        v29 = v17 * v22;
        if ((v36 & 1) != 0)
        {
          *(float *)(v10[7] + 4 * v26) = v29;
        }
        else
        {
          v10[(v26 >> 6) + 8] |= 1 << v26;
          v30 = (uint64_t *)(v10[6] + 16 * v26);
          *v30 = v19;
          v30[1] = v18;
          *(float *)(v10[7] + 4 * v26) = v29;
          v31 = v10[2];
          v32 = __OFADD__(v31, 1);
          v33 = v31 + 1;
          if (v32)
            goto LABEL_36;
          v10[2] = v33;
          OUTLINED_FUNCTION_1();
        }
        OUTLINED_FUNCTION_3();
        swift_bridgeObjectRelease();
      }
      else
      {
        OUTLINED_FUNCTION_3();
      }
    }
  }
  v13 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v13 >= v8)
    goto LABEL_32;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  ++v9;
  if (v14)
    goto LABEL_19;
  v9 = v13 + 1;
  if (v13 + 1 >= v8)
    goto LABEL_32;
  v14 = *(_QWORD *)(v4 + 8 * v9);
  if (v14)
    goto LABEL_19;
  v9 = v13 + 2;
  if (v13 + 2 >= v8)
    goto LABEL_32;
  v14 = *(_QWORD *)(v4 + 8 * v9);
  if (v14)
  {
LABEL_19:
    v7 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v9 << 6);
    goto LABEL_20;
  }
  v15 = v13 + 3;
  if (v15 >= v8)
  {
LABEL_32:
    swift_release();
    return (uint64_t)v10;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
    v9 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    v9 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v9 >= v8)
      goto LABEL_32;
    v14 = *(_QWORD *)(v4 + 8 * v9);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  result = sub_246EBE398();
  __break(1u);
  return result;
}

uint64_t sub_246E9C354()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  return v0;
}

uint64_t sub_246E9C388()
{
  sub_246E9C354();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TFIDFScorer()
{
  return objc_opt_self();
}

void sub_246E9C3C8(uint64_t a1, uint64_t a2)
{
  float v4;

  v4 = sub_246E9C4A4(a1);
  if ((float)(v4 * sub_246E9C4A4(a2)) != 0.0)
    sub_246E9C420(a1, a2);
}

float sub_246E9C420(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  float *v6;
  float v7;
  float v8;

  swift_bridgeObjectRetain();
  v4 = sub_246E9B3E4(a1, a2);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = (float *)(v4 + 32);
    v7 = 0.0;
    do
    {
      v8 = *v6++;
      v7 = v7 + v8;
      --v5;
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

float sub_246E9C4A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  float *v3;
  float v4;
  float v5;

  v1 = sub_246E9B238(a1);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (float *)(v1 + 32);
    v4 = 0.0;
    do
    {
      v5 = *v3++;
      v4 = v4 + v5;
      --v2;
    }
    while (v2);
  }
  else
  {
    v4 = 0.0;
  }
  swift_bridgeObjectRelease();
  return sqrtf(v4);
}

uint64_t sub_246E9C508()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for CosineSimilarity()
{
  return objc_opt_self();
}

void type metadata accessor for SISchemaComponentName()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25765AA88)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25765AA88);
  }
}

void sub_246E9C580(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25765AAA0);
  v4 = sub_246EBE2F0();
  v5 = (_QWORD *)v4;
  v6 = 0;
  v7 = *(_QWORD *)(a1 + 64);
  v25 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v7;
  v26 = (unint64_t)(v8 + 63) >> 6;
  v11 = v4 + 64;
  if ((v9 & v7) == 0)
    goto LABEL_5;
LABEL_4:
  v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v12 | (v6 << 6); ; i = __clz(__rbit64(v15)) + (v6 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v19 = *v17;
    v18 = v17[1];
    v20 = log2f((float)((float)*(uint64_t *)(a2 + 16) + 1.0)/ (float)((float)*(uint64_t *)(*(_QWORD *)(a1 + 56) + 8 * i) + 1.0));
    *(_QWORD *)(v11 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v21 = (_QWORD *)(v5[6] + 16 * i);
    *v21 = v19;
    v21[1] = v18;
    *(float *)(v5[7] + 4 * i) = v20 + 1.0;
    v22 = v5[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v5[2] = v24;
    swift_bridgeObjectRetain();
    if (v10)
      goto LABEL_4;
LABEL_5:
    v14 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_24;
    if (v14 >= v26)
      goto LABEL_22;
    v15 = *(_QWORD *)(v25 + 8 * v14);
    ++v6;
    if (!v15)
    {
      v6 = v14 + 1;
      if (v14 + 1 >= v26)
        goto LABEL_22;
      v15 = *(_QWORD *)(v25 + 8 * v6);
      if (!v15)
      {
        v6 = v14 + 2;
        if (v14 + 2 >= v26)
          goto LABEL_22;
        v15 = *(_QWORD *)(v25 + 8 * v6);
        if (!v15)
          break;
      }
    }
LABEL_18:
    v10 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v26)
  {
LABEL_22:
    swift_bridgeObjectRelease();
    return;
  }
  v15 = *(_QWORD *)(v25 + 8 * v16);
  if (v15)
  {
    v6 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v26)
      goto LABEL_22;
    v15 = *(_QWORD *)(v25 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_246E9C7A4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_246EBE3D4();
  swift_bridgeObjectRetain();
  sub_246EBE104();
  v8 = sub_246EBE3EC();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_246EBE368() & 1) != 0)
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
      if (v19 || (sub_246EBE368() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_246E9D57C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_246E9C950()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765AA98);
  v3 = sub_246EBE284();
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
      sub_246EBE3D4();
      sub_246EBE104();
      result = sub_246EBE3EC();
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
                sub_246EA0410(0, (unint64_t)(v29 + 63) >> 6, v30);
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

uint64_t sub_246E9CC28(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe, a2);
    v6 = (_QWORD *)((char *)v10 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_246EA0410(0, v5, v6);
    v7 = sub_246E9CDB4((uint64_t)v6, v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (_QWORD *)swift_slowAlloc();
    sub_246EA0410(0, v5, v8);
    v7 = sub_246E9CDB4((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x24956C73C](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_246E9CDB4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t i;
  unint64_t v30;
  _QWORD *v31;
  BOOL v32;
  BOOL v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  BOOL v52;
  uint64_t v53;
  _QWORD *v54;
  BOOL v55;
  unint64_t *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  int64_t v63;

  v4 = a4;
  v5 = a3;
  v57 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) >= *(_QWORD *)(a3 + 16))
  {
    v34 = 0;
    v60 = a3 + 56;
    v61 = 0;
    v35 = 1 << *(_BYTE *)(a3 + 32);
    if (v35 < 64)
      v36 = ~(-1 << v35);
    else
      v36 = -1;
    v37 = v36 & *(_QWORD *)(a3 + 56);
    v63 = (unint64_t)(v35 + 63) >> 6;
    v38 = a4 + 56;
    while (1)
    {
      while (1)
      {
        if (v37)
        {
          v39 = __clz(__rbit64(v37));
          v37 &= v37 - 1;
          v40 = v39 | (v34 << 6);
        }
        else
        {
          v41 = v34 + 1;
          if (__OFADD__(v34, 1))
          {
LABEL_81:
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if (v41 >= v63)
            goto LABEL_79;
          v42 = *(_QWORD *)(v60 + 8 * v41);
          ++v34;
          if (!v42)
          {
            v34 = v41 + 1;
            if (v41 + 1 >= v63)
              goto LABEL_79;
            v42 = *(_QWORD *)(v60 + 8 * v34);
            if (!v42)
            {
              v34 = v41 + 2;
              if (v41 + 2 >= v63)
                goto LABEL_79;
              v42 = *(_QWORD *)(v60 + 8 * v34);
              if (!v42)
              {
                v43 = v41 + 3;
                if (v43 >= v63)
                  goto LABEL_79;
                v42 = *(_QWORD *)(v60 + 8 * v43);
                if (!v42)
                {
                  while (1)
                  {
                    v34 = v43 + 1;
                    if (__OFADD__(v43, 1))
                      goto LABEL_85;
                    if (v34 >= v63)
                      break;
                    v42 = *(_QWORD *)(v60 + 8 * v34);
                    ++v43;
                    if (v42)
                      goto LABEL_61;
                  }
LABEL_79:
                  swift_retain();
                  return sub_246E9D2F0(v57, a2, v61, v5);
                }
                v34 = v43;
              }
            }
          }
LABEL_61:
          v37 = (v42 - 1) & v42;
          v40 = __clz(__rbit64(v42)) + (v34 << 6);
        }
        v44 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v40);
        v46 = *v44;
        v45 = v44[1];
        sub_246EBE3D4();
        swift_bridgeObjectRetain();
        sub_246EBE104();
        v47 = sub_246EBE3EC();
        v48 = -1 << *(_BYTE *)(v4 + 32);
        v49 = v47 & ~v48;
        if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) != 0)
          break;
LABEL_78:
        result = swift_bridgeObjectRelease();
        v5 = a3;
        v4 = a4;
      }
      v50 = *(_QWORD *)(a4 + 48);
      v51 = (_QWORD *)(v50 + 16 * v49);
      v52 = *v51 == v46 && v51[1] == v45;
      if (!v52 && (sub_246EBE368() & 1) == 0)
      {
        v53 = ~v48;
        do
        {
          v49 = (v49 + 1) & v53;
          if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
            goto LABEL_78;
          v54 = (_QWORD *)(v50 + 16 * v49);
          v55 = *v54 == v46 && v54[1] == v45;
        }
        while (!v55 && (sub_246EBE368() & 1) == 0);
      }
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      v33 = __OFADD__(v61++, 1);
      v5 = a3;
      v4 = a4;
      if (v33)
        goto LABEL_83;
    }
  }
  v6 = 0;
  v58 = a4 + 56;
  v7 = 1 << *(_BYTE *)(a4 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  v59 = (unint64_t)(v7 + 63) >> 6;
  v61 = 0;
  v10 = a3 + 56;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v62 = v6;
      v12 = v11 | (v6 << 6);
      goto LABEL_22;
    }
    v13 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_81;
    }
    if (v13 >= v59)
      goto LABEL_79;
    v14 = *(_QWORD *)(v58 + 8 * v13);
    v15 = v6 + 1;
    if (!v14)
    {
      v15 = v6 + 2;
      if (v6 + 2 >= v59)
        goto LABEL_79;
      v14 = *(_QWORD *)(v58 + 8 * v15);
      if (!v14)
      {
        v15 = v6 + 3;
        if (v6 + 3 >= v59)
          goto LABEL_79;
        v14 = *(_QWORD *)(v58 + 8 * v15);
        if (!v14)
          break;
      }
    }
LABEL_21:
    v9 = (v14 - 1) & v14;
    v62 = v15;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
LABEL_22:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_246EBE3D4();
    swift_bridgeObjectRetain();
    sub_246EBE104();
    v20 = sub_246EBE3EC();
    v21 = -1 << *(_BYTE *)(v5 + 32);
    v22 = v20 & ~v21;
    v23 = v22 >> 6;
    v24 = 1 << v22;
    if (((1 << v22) & *(_QWORD *)(v10 + 8 * (v22 >> 6))) == 0)
      goto LABEL_36;
    v25 = *(_QWORD *)(a3 + 48);
    v26 = (_QWORD *)(v25 + 16 * v22);
    v27 = *v26 == v19 && v26[1] == v18;
    if (v27 || (sub_246EBE368() & 1) != 0)
    {
      result = swift_bridgeObjectRelease();
LABEL_38:
      v6 = v62;
      v5 = a3;
      v57[v23] |= v24;
      v33 = __OFADD__(v61++, 1);
      v4 = a4;
      if (v33)
        goto LABEL_82;
    }
    else
    {
      v28 = ~v21;
      for (i = v22 + 1; ; i = v30 + 1)
      {
        v30 = i & v28;
        if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
          break;
        v31 = (_QWORD *)(v25 + 16 * v30);
        v32 = *v31 == v19 && v31[1] == v18;
        if (v32 || (sub_246EBE368() & 1) != 0)
        {
          result = swift_bridgeObjectRelease();
          v23 = v30 >> 6;
          v24 = 1 << v30;
          goto LABEL_38;
        }
      }
LABEL_36:
      result = swift_bridgeObjectRelease();
      v6 = v62;
      v5 = a3;
      v4 = a4;
    }
  }
  v16 = v6 + 4;
  if (v6 + 4 >= v59)
    goto LABEL_79;
  v14 = *(_QWORD *)(v58 + 8 * v16);
  if (v14)
  {
    v15 = v6 + 4;
    goto LABEL_21;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v59)
      goto LABEL_79;
    v14 = *(_QWORD *)(v58 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_21;
  }
LABEL_84:
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t sub_246E9D2F0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
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
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_35:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765AA98);
  result = sub_246EBE290();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_35;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_35;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_35;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_246EBE3D4();
    swift_bridgeObjectRetain();
    sub_246EBE104();
    result = sub_246EBE3EC();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      goto LABEL_38;
    if (!v5)
      goto LABEL_35;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_35;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_35;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_246E9D57C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_246E9C950();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_246E9D714();
      goto LABEL_22;
    }
    sub_246E9D8C4();
  }
  v11 = *v4;
  sub_246EBE3D4();
  sub_246EBE104();
  result = sub_246EBE3EC();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_246EBE368(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_246EBE38C();
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
          result = sub_246EBE368();
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

void *sub_246E9D714()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765AA98);
  v2 = *v0;
  v3 = sub_246EBE278();
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

uint64_t sub_246E9D8C4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765AA98);
  v3 = sub_246EBE284();
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
    sub_246EBE3D4();
    swift_bridgeObjectRetain();
    sub_246EBE104();
    result = sub_246EBE3EC();
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

uint64_t sub_246E9DB6C(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24956C688]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_246E9DC2C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
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

uint64_t OUTLINED_FUNCTION_0()
{
  return sub_246EBDFF0();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_2()
{
  JUMPOUT(0x24956C73CLL);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_246EBDFFC();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_retain();
}

unint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_246EB5650(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_beginAccess();
}

uint64_t sub_246E9DCF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD v21[4];
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[40];

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    sub_246EA297C(a1 + 32, (uint64_t)v24);
    swift_bridgeObjectRetain();
    v5 = v3 - 1;
    if (v3 != 1)
    {
      v6 = a1 + 72;
      do
      {
        sub_246EA297C(v6, (uint64_t)&v22);
        __swift_project_boxed_opaque_existential_1(v24, v25);
        OUTLINED_FUNCTION_10();
        v8 = v7;
        __swift_project_boxed_opaque_existential_1(&v22, v23);
        OUTLINED_FUNCTION_10();
        if (v8 >= v9)
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v22);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
          sub_246EA00C4(&v22, (uint64_t)v24);
        }
        v6 += 40;
        --v5;
      }
      while (v5);
    }
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_18();
    sub_246EA00C4(&v26, (uint64_t)v29);
    sub_246EA28DC(v2 + 16, (uint64_t)v24);
    if (v25)
    {
      v10 = OUTLINED_FUNCTION_18();
      MEMORY[0x24BDAC7A8](v10, v11);
      v21[2] = v29;
      swift_bridgeObjectRetain();
      v12 = sub_246E9E014((uint64_t)sub_246EA2960, (uint64_t)v21, a1);
      if (*(_QWORD *)(v12 + 16) < 2uLL)
      {
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_25();
      }
      else
      {
        v13 = v27;
        v14 = v28;
        __swift_project_boxed_opaque_existential_1(&v26, v27);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 8))(v12, v13, v14);
        OUTLINED_FUNCTION_3_0();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
      }
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v26);
    }
    else
    {
      sub_246EA2924((uint64_t)v24, &qword_25765AEA0);
      return OUTLINED_FUNCTION_25();
    }
  }
  else
  {
    if (qword_25765A820 != -1)
      swift_once();
    v15 = OUTLINED_FUNCTION_24();
    v16 = __swift_project_value_buffer(v15, (uint64_t)qword_25765E558);
    v17 = sub_246EBE014();
    v18 = sub_246EBE200();
    if (OUTLINED_FUNCTION_2_0(v18))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_246E99000, v17, v16, "No dialogs", v19, 2u);
      OUTLINED_FUNCTION_2();
    }

    sub_246EA00DC();
    OUTLINED_FUNCTION_0_0();
    return OUTLINED_FUNCTION_4_0();
  }
}

BOOL sub_246E9DF88(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  v5 = (*(float (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  v6 = a2[3];
  v7 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v6);
  return v5 == (*(float (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
}

uint64_t sub_246E9E014(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v8)(__int128 *);
  unint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(__int128 *);
  uint64_t v24;
  _BYTE v25[24];
  uint64_t v26;
  uint64_t v27;
  __int128 v28[2];
  uint64_t v29;

  v4 = a3;
  v5 = MEMORY[0x24BEE4AF8];
  v29 = MEMORY[0x24BEE4AF8];
  v6 = *(_QWORD *)(a3 + 16);
  if (v6)
  {
    v8 = (uint64_t (*)(__int128 *))result;
    v9 = 0;
    v10 = a3 + 32;
    v23 = (uint64_t (*)(__int128 *))result;
    v24 = a3;
    v22 = v6;
    while (v9 < *(_QWORD *)(v4 + 16))
    {
      sub_246EA297C(v10, (uint64_t)v28);
      v5 = a2;
      v11 = v8(v28);
      if (v3)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
        swift_bridgeObjectRelease();
        swift_release();
        return v5;
      }
      if ((v11 & 1) != 0)
      {
        sub_246EA00C4(v28, (uint64_t)v25);
        v12 = v29;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246EB5088(0, *(_QWORD *)(v12 + 16) + 1, 1);
          v12 = v29;
        }
        v14 = *(_QWORD *)(v12 + 16);
        v13 = *(_QWORD *)(v12 + 24);
        if (v14 >= v13 >> 1)
          sub_246EB5088(v13 > 1, v14 + 1, 1);
        v15 = v26;
        v16 = v27;
        v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
        MEMORY[0x24BDAC7A8](v17, v17);
        v19 = (char *)&v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v20 + 16))(v19);
        sub_246EA27FC(v14, (uint64_t)v19, &v29, v15, v16);
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
        v8 = v23;
        v4 = v24;
        v6 = v22;
      }
      else
      {
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      }
      ++v9;
      v10 += 40;
      if (v6 == v9)
      {
        v5 = v29;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v5;
  }
  return result;
}

uint64_t sub_246E9E1F8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17[2];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = result;
  v4 = MEMORY[0x24BEE4AF8];
  v21 = MEMORY[0x24BEE4AF8];
  v5 = *(_QWORD *)(result + 16);
  if (!v5)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v4;
  }
  v6 = 0;
  v7 = result + 32;
  while (v6 < *(_QWORD *)(v3 + 16))
  {
    sub_246EA297C(v7, (uint64_t)&v18);
    v8 = v19;
    v9 = v20;
    __swift_project_boxed_opaque_existential_1(&v18, v19);
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
    if (!*(_QWORD *)(a2 + 16))
    {
      swift_bridgeObjectRelease();
LABEL_8:
      sub_246EA00C4(&v18, (uint64_t)v17);
      v14 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246EB50B4(0, *(_QWORD *)(v14 + 16) + 1, 1);
        v14 = v21;
      }
      v16 = *(_QWORD *)(v14 + 16);
      v15 = *(_QWORD *)(v14 + 24);
      if (v16 >= v15 >> 1)
      {
        sub_246EB50B4(v15 > 1, v16 + 1, 1);
        v14 = v21;
      }
      *(_QWORD *)(v14 + 16) = v16 + 1;
      result = sub_246EA00C4(v17, v14 + 40 * v16 + 32);
      goto LABEL_13;
    }
    sub_246EB5650(v10, v11);
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
      goto LABEL_8;
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v18);
LABEL_13:
    ++v6;
    v7 += 40;
    if (v5 == v6)
    {
      v4 = v21;
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_246E9E394()
{
  uint64_t v0;

  sub_246EA2924(v0 + 16, &qword_25765AEA0);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HighestScoringDialogSelector()
{
  return objc_opt_self();
}

uint64_t sub_246E9E3E0(uint64_t a1)
{
  return sub_246E9DCF4(a1);
}

uint64_t sub_246E9E400(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v3 = v2;
  sub_246EA297C(a1, v2 + 16);
  sub_246EA297C(a2, v2 + 56);
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 16) = 36;
  type metadata accessor for SELFLogger();
  swift_allocObject();
  v7 = sub_246EB72AC((uint64_t)&unk_25765BF88, 0, (uint64_t)sub_246EB7198, 0, 36, (uint64_t)sub_246EA29D0, v6);
  __swift_destroy_boxed_opaque_existential_1(a2);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(_QWORD *)(v3 + 96) = v7;
  return v3;
}

void sub_246E9E4C4(unint64_t a1@<X0>, unint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  sub_246E9E548(a1, a2);
  if (!v3)
  {
    v6 = v2[10];
    v7 = v2[11];
    __swift_project_boxed_opaque_existential_1(v2 + 7, v6);
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 16))(a2, v6, v7);
    sub_246EB75F4(a1);
  }
}

uint64_t sub_246E9E548@<X0>(unint64_t a1@<X0>, unint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  float *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32[2];
  _OWORD v33[2];
  __int128 v34;
  _OWORD v35[4];
  uint64_t v36;

  v3 = v2;
  if (qword_25765A820 != -1)
LABEL_23:
    swift_once();
  v6 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v6, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_12();
  v7 = (void *)sub_246EBE014();
  v8 = sub_246EBE1F4();
  if (OUTLINED_FUNCTION_2_0(v8))
  {
    v9 = (float *)OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_23(v9, 3.852e-34);
    *(_QWORD *)&v35[0] = v10;
    sub_246EBE248();
    OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_8_0(&dword_246E99000, v11, v12, "Selecting from %ld dialogs");
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_6_0();
  if (*(_QWORD *)(a1 + 16))
  {
    v13 = OUTLINED_FUNCTION_9((_QWORD *)(v3 + 56));
    v31 = *(_QWORD *)(v13 + 16);
    if (v31)
    {
      v28 = a2;
      v29 = a1;
      OUTLINED_FUNCTION_5_0(MEMORY[0x24BEE4AF8]);
      OUTLINED_FUNCTION_19();
      a2 = 0;
      v3 = v13 + 32;
      v30 = v13;
      do
      {
        if (a2 >= *(_QWORD *)(v13 + 16))
        {
          __break(1u);
          goto LABEL_23;
        }
        sub_246EA297C(v3, (uint64_t)v32);
        *(_QWORD *)&v33[0] = a2;
        sub_246EA00C4(v32, (uint64_t)v33 + 8);
        v35[1] = v33[1];
        v35[2] = v34;
        v35[0] = v33[0];
        v14 = v34;
        __swift_project_boxed_opaque_existential_1((_QWORD *)v35 + 1, v34);
        v15 = (*(uint64_t (**)(_QWORD, _QWORD))(*((_QWORD *)&v14 + 1) + 16))(v14, *((_QWORD *)&v14 + 1));
        v17 = v16;
        v18 = *(_QWORD *)&v35[0];
        *(_QWORD *)&v33[0] = *(_QWORD *)&v35[0];
        sub_246EA297C((uint64_t)v35 + 8, (uint64_t)v33 + 8);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v33 + 8);
        sub_246EA2924((uint64_t)v35, &qword_25765AE78);
        v19 = v36;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_13(*(_QWORD *)(v19 + 16));
          v19 = v36;
        }
        a1 = *(_QWORD *)(v19 + 16);
        v20 = *(_QWORD *)(v19 + 24);
        if (a1 >= v20 >> 1)
        {
          sub_246EB506C((char *)(v20 > 1), a1 + 1, 1);
          v19 = v36;
        }
        ++a2;
        *(_QWORD *)(v19 + 16) = a1 + 1;
        v21 = (_QWORD *)(v19 + 24 * a1);
        v21[4] = v15;
        v21[5] = v17;
        v21[6] = v18;
        v3 += 40;
        v13 = v30;
      }
      while (v31 != a2);
      OUTLINED_FUNCTION_20();
      v22 = sub_246E9ECF0(v19);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_19();
      v23 = sub_246E9E1F8(v29, v22);
      a2 = v28;
      if (*(_QWORD *)(v23 + 16))
      {
        OUTLINED_FUNCTION_16();
        a1 = v23;
        goto LABEL_17;
      }
      OUTLINED_FUNCTION_26();
      v25 = sub_246EBE014();
      v26 = sub_246EBE1F4();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)OUTLINED_FUNCTION_4();
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_246E99000, v25, v26, "No acceptable dialogs, selecting least recent", v27, 2u);
        OUTLINED_FUNCTION_2();
      }

      sub_246E9ED7C(v29, v22, v28);
    }
    else
    {
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_12();
LABEL_17:
      sub_246E9EFC0(a1, a2);
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_246EA00DC();
    OUTLINED_FUNCTION_0_0();
    return swift_willThrow();
  }
}

uint64_t sub_246E9E8E8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38[2];
  __int128 __src[5];
  uint64_t __dst[10];
  char v41;
  uint64_t v42;

  v1 = a1[4] >> 1;
  v37 = a1[3];
  if (__OFSUB__(v1, v37))
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v36 = a1[4] >> 1;
  v2 = *a1;
  v3 = a1[2];
  if (v1 - v37 >= *(_QWORD *)(*a1 + 16))
    v4 = *(_QWORD *)(*a1 + 16);
  else
    v4 = v1 - v37;
  v42 = MEMORY[0x24BEE4AF8];
  sub_246EB5024(0, v4 & ~(v4 >> 63), 0);
  v41 = 0;
  if ((v4 & 0x8000000000000000) == 0)
  {
    v35 = v2;
    if (v4)
    {
      v5 = v2 + 32;
      swift_bridgeObjectRetain();
      result = swift_unknownObjectRetain();
      v7 = 0;
      v8 = v36;
      v9 = v3 + 40 * v37;
      do
      {
        if (v4 == v7)
        {
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        v10 = *(_QWORD *)(v2 + 16);
        if (v7 == v10)
          goto LABEL_46;
        if (v7 >= v10)
          goto LABEL_39;
        sub_246EA297C(v5, (uint64_t)__src);
        if (!(v37 - v36 + v7))
          goto LABEL_45;
        if ((uint64_t)(v37 + v7) >= v8)
          goto LABEL_40;
        sub_246EA00C4(__src, (uint64_t)__dst);
        sub_246EA297C(v9, (uint64_t)&__dst[5]);
        v11 = __dst[3];
        v12 = __dst[4];
        __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
        v13 = (*(float (**)(uint64_t, uint64_t))(v12 + 16))(v11, v12);
        v14 = __dst[8];
        v15 = __dst[9];
        __swift_project_boxed_opaque_existential_1(&__dst[5], __dst[8]);
        v16 = (*(float (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
        sub_246EA2924((uint64_t)__dst, &qword_25765AE80);
        v17 = v42;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_246EB5024(0, *(_QWORD *)(v17 + 16) + 1, 1);
          v17 = v42;
        }
        v19 = *(_QWORD *)(v17 + 16);
        v18 = *(_QWORD *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          result = (uint64_t)sub_246EB5024((char *)(v18 > 1), v19 + 1, 1);
          v17 = v42;
        }
        ++v7;
        *(_QWORD *)(v17 + 16) = v19 + 1;
        *(float *)(v17 + 4 * v19 + 32) = v13 - v16;
        v5 += 40;
        v9 += 40;
        v2 = v35;
        v8 = v36;
      }
      while (v4 != v7);
      if ((v41 & 1) != 0)
        goto LABEL_37;
      v20 = v37 + v7;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      v8 = v36;
      v20 = v37;
    }
    v21 = *(_QWORD *)(v2 + 16);
    if (v4 == v21)
    {
LABEL_37:
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return v42;
    }
    v22 = v2 + 40 * v4 + 32;
    v23 = v3 + 40 * v20;
    v24 = v20;
    while (v4 < v21)
    {
      sub_246EA297C(v22, (uint64_t)v38);
      if (v8 == v24)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
        goto LABEL_37;
      }
      if (v20 < v37 || v24 >= v8)
        goto LABEL_42;
      sub_246EA00C4(v38, (uint64_t)__src);
      sub_246EA297C(v23, (uint64_t)&__src[2] + 8);
      memcpy(__dst, __src, sizeof(__dst));
      v26 = __dst[3];
      v27 = __dst[4];
      __swift_project_boxed_opaque_existential_1(__dst, __dst[3]);
      v28 = (*(float (**)(uint64_t, uint64_t))(v27 + 16))(v26, v27);
      v29 = __dst[8];
      v30 = __dst[9];
      __swift_project_boxed_opaque_existential_1(&__dst[5], __dst[8]);
      v31 = (*(float (**)(uint64_t, uint64_t))(v30 + 16))(v29, v30);
      sub_246EA2924((uint64_t)__dst, &qword_25765AE80);
      v32 = v42;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246EB5024(0, *(_QWORD *)(v32 + 16) + 1, 1);
        v32 = v42;
      }
      v34 = *(_QWORD *)(v32 + 16);
      v33 = *(_QWORD *)(v32 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_246EB5024((char *)(v33 > 1), v34 + 1, 1);
        v32 = v42;
      }
      ++v4;
      *(_QWORD *)(v32 + 16) = v34 + 1;
      *(float *)(v32 + 4 * v34 + 32) = v28 - v31;
      v8 = v36;
      v21 = *(_QWORD *)(v35 + 16);
      v22 += 40;
      v23 += 40;
      ++v24;
      if (v4 == v21)
        goto LABEL_37;
    }
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)__src);
LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_246E9ECF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765AE90);
    v3 = sub_246EBE308();
  }
  else
  {
    v3 = MEMORY[0x24BEE4B00];
  }
  v6 = v3;
  sub_246EA042C(a1, 1, &v6);
  v4 = v6;
  if (v1)
    swift_release();
  return v4;
}

uint64_t sub_246E9ED7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v7;
  uint64_t v8;

  swift_bridgeObjectRetain();
  sub_246E9EE10(a1, a2, (uint64_t)&v7);
  if (v8)
    return sub_246EA00C4(&v7, a3);
  sub_246EA2924((uint64_t)&v7, &qword_25765AE98);
  sub_246EA00DC();
  OUTLINED_FUNCTION_0_0();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_246E9EE10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    sub_246EA297C(a1 + 32, (uint64_t)&v27);
    swift_bridgeObjectRetain();
    v7 = v5 - 1;
    if (v5 != 1)
    {
      v8 = a1 + 72;
      do
      {
        sub_246EA297C(v8, (uint64_t)&v24);
        v9 = v25;
        v10 = v26;
        __swift_project_boxed_opaque_existential_1(&v24, v25);
        v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
        if (*(_QWORD *)(a2 + 16) && (v13 = sub_246EB5650(v11, v12), (v14 & 1) != 0))
          v15 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v13);
        else
          v15 = -1;
        swift_bridgeObjectRelease();
        v16 = v28;
        v17 = v29;
        __swift_project_boxed_opaque_existential_1(&v27, v28);
        v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8))(v16, v17);
        if (*(_QWORD *)(a2 + 16) && (v20 = sub_246EB5650(v18, v19), (v21 & 1) != 0))
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v20);
          swift_bridgeObjectRelease();
          if (v15 < v22)
            goto LABEL_13;
        }
        else
        {
          swift_bridgeObjectRelease();
          if (v15 < -1)
          {
LABEL_13:
            __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
            sub_246EA00C4(&v24, (uint64_t)&v27);
            goto LABEL_14;
          }
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
LABEL_14:
        v8 += 40;
        --v7;
      }
      while (v7);
    }
    swift_bridgeObjectRelease();
    sub_246EA00C4(&v27, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_246E9EFC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;

  v5 = v2 + 16;
  swift_beginAccess();
  __swift_mutable_project_boxed_opaque_existential_1(v2 + 16, *(_QWORD *)(v2 + 40));
  v6 = sub_246EBE068();
  swift_endAccess();
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v5 = v6 / v7;
    if (qword_25765A820 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v8 = v6 - v5 * v7;
  v9 = sub_246EBE02C();
  __swift_project_value_buffer(v9, (uint64_t)qword_25765E558);
  swift_bridgeObjectRetain();
  v10 = sub_246EBE014();
  v11 = sub_246EBE1F4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    *(_DWORD *)v12 = 134218240;
    OUTLINED_FUNCTION_21();
    *(_WORD *)(v12 + 12) = 2048;
    OUTLINED_FUNCTION_21();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246E99000, v10, v11, "Selected index %ld out of %ld", (uint8_t *)v12, 0x16u);
    MEMORY[0x24956C73C](v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return sub_246EA297C(a1 + 40 * v8 + 32, a2);
}

uint64_t sub_246E9F170()
{
  sub_246E9FCC0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RandomOriginalDialogSelector()
{
  return objc_opt_self();
}

void sub_246E9F1B0(unint64_t a1@<X0>, unint64_t a2@<X8>)
{
  sub_246E9E4C4(a1, a2);
}

BOOL sub_246E9F1D0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_246E9F1E0()
{
  return sub_246EBE3E0();
}

uint64_t sub_246E9F204()
{
  sub_246EBE3D4();
  sub_246EBE3E0();
  return sub_246EBE3EC();
}

BOOL sub_246E9F248(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_246E9F1D0(*a1, *a2);
}

uint64_t sub_246E9F254()
{
  return sub_246E9F204();
}

uint64_t sub_246E9F25C()
{
  return sub_246E9F1E0();
}

uint64_t sub_246E9F264()
{
  sub_246EBE3D4();
  sub_246EBE3E0();
  return sub_246EBE3EC();
}

uint64_t sub_246E9F2A4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  result = sub_246E9F344(a1, (uint64_t)a2);
  if (!v3)
  {
    v6 = v2[5];
    v7 = v2[6];
    OUTLINED_FUNCTION_27(v2 + 2);
    v8 = a2[3];
    v9 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v8);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v9 + 8))(v11, v8, v9);
    v10 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 16))(v11, v6, v7);
    return OUTLINED_FUNCTION_22(v10);
  }
  return result;
}

uint64_t sub_246E9F344@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
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
  float v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  os_log_type_t v29;
  float *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  __int128 v50[2];
  _OWORD v51[2];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[6];
  uint64_t v57;

  v4 = v3;
  v5 = v2;
  if (qword_25765A820 != -1)
    goto LABEL_34;
  while (1)
  {
    v7 = OUTLINED_FUNCTION_24();
    __swift_project_value_buffer(v7, (uint64_t)qword_25765E558);
    OUTLINED_FUNCTION_15();
    v8 = sub_246EBE014();
    v9 = sub_246EBE1F4();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_DWORD *)v10 = 134217984;
      OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_7_0();
      _os_log_impl(&dword_246E99000, v8, v9, "Selecting from %ld dialogs", v10, 0xCu);
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_7_0();
    *(_QWORD *)&v53 = a1;
    OUTLINED_FUNCTION_15();
    sub_246EA05B4((uint64_t *)&v53);
    if (v4)
      goto LABEL_37;
    v11 = v53;
    if ((*(_BYTE *)(v5 + 56) & 1) == 0)
      break;
LABEL_19:
    OUTLINED_FUNCTION_12();
    v28 = (void *)sub_246EBE014();
    v29 = sub_246EBE1F4();
    v48 = v11;
    if (OUTLINED_FUNCTION_2_0(v29))
    {
      v30 = (float *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_23(v30, 3.852e-34);
      OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_8_0(&dword_246E99000, v31, v32, "%ld acceptable dialogs");
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_6_0();
    a1 = *(_QWORD *)(v5 + 48);
    v4 = OUTLINED_FUNCTION_9((_QWORD *)(v5 + 16));
    OUTLINED_FUNCTION_5_0(MEMORY[0x24BEE4AF8]);
    v33 = v57;
    v34 = *(_QWORD *)(v4 + 16);
    OUTLINED_FUNCTION_19();
    if (!v34)
    {
LABEL_29:
      OUTLINED_FUNCTION_20();
      v45 = sub_246E9ECF0(v33);
      *(_QWORD *)&v53 = v48;
      OUTLINED_FUNCTION_15();
      swift_bridgeObjectRetain();
      sub_246EA061C((uint64_t *)&v53, v45);
      OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_7_0();
      sub_246E9FB04(v53, (uint64_t)&v53);
      swift_release();
      if (*((_QWORD *)&v54 + 1))
        return sub_246EA00C4(&v53, a2);
      sub_246EA2924((uint64_t)&v53, &qword_25765AE70);
      goto LABEL_32;
    }
    v35 = 0;
    v36 = v4 + 32;
    v49 = v4;
    while (v35 < *(_QWORD *)(v4 + 16))
    {
      sub_246EA297C(v36, (uint64_t)v50);
      *(_QWORD *)&v51[0] = v35;
      sub_246EA00C4(v50, (uint64_t)v51 + 8);
      v54 = v51[1];
      v55 = v52;
      v53 = v51[0];
      v38 = *((_QWORD *)&v52 + 1);
      v37 = v52;
      __swift_project_boxed_opaque_existential_1((_QWORD *)&v53 + 1, v52);
      a1 = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 16))(v37, v38);
      v40 = v39;
      v41 = v53;
      *(_QWORD *)&v51[0] = v53;
      sub_246EA297C((uint64_t)&v53 + 8, (uint64_t)v51 + 8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51 + 8);
      sub_246EA2924((uint64_t)&v53, &qword_25765AE78);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_13(*(_QWORD *)(v33 + 16));
        v33 = v57;
      }
      v43 = *(_QWORD *)(v33 + 16);
      v42 = *(_QWORD *)(v33 + 24);
      v5 = v43 + 1;
      if (v43 >= v42 >> 1)
      {
        sub_246EB506C((char *)(v42 > 1), v43 + 1, 1);
        v33 = v57;
      }
      ++v35;
      *(_QWORD *)(v33 + 16) = v5;
      v44 = (_QWORD *)(v33 + 24 * v43);
      v44[4] = a1;
      v44[5] = v40;
      v44[6] = v41;
      v36 += 40;
      v4 = v49;
      if (v34 == v35)
        goto LABEL_29;
    }
    __break(1u);
LABEL_34:
    swift_once();
  }
  v12 = sub_246EB5BD0(1, v53);
  v56[0] = v11;
  v56[1] = v12;
  v56[2] = v13;
  v56[3] = v14;
  v56[4] = v15;
  swift_retain_n();
  v16 = sub_246E9E8E8(v56);
  swift_unknownObjectRelease();
  swift_release();
  v17 = *(_QWORD *)(v16 + 16);
  if (!v17)
  {
    swift_release();
    OUTLINED_FUNCTION_16();
LABEL_32:
    sub_246EA00DC();
    OUTLINED_FUNCTION_0_0();
    return OUTLINED_FUNCTION_4_0();
  }
  v18 = v17 - 1;
  if (v18)
  {
    v20 = 0;
    v19 = 0;
    v21 = *(float *)(v16 + 32);
    do
    {
      v22 = *(float *)(v16 + 36 + 4 * v20);
      if (v21 < v22)
        v19 = v20 + 1;
      v23 = v20 + 1;
      if (v21 < v22)
        v21 = *(float *)(v16 + 36 + 4 * v20);
      ++v20;
    }
    while (v18 != v23);
  }
  else
  {
    v19 = 0;
  }
  OUTLINED_FUNCTION_16();
  v24 = *(_QWORD *)(v11 + 16);
  v25 = __OFSUB__(v24, v19);
  v26 = v24 - v19;
  if (!v25)
  {
    if (__OFSUB__(v26, 1))
      goto LABEL_36;
    sub_246E9F7E4(v26 - 1, v11);
    v11 = v27;
    goto LABEL_19;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  result = swift_release();
  __break(1u);
  return result;
}

void sub_246E9F7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
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
  _BYTE v33[24];
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (a1 < 0)
    goto LABEL_32;
  if (a1)
  {
    v39 = MEMORY[0x24BEE4AF8];
    v40 = MEMORY[0x24BEE4AF8];
    v4 = *(_QWORD *)(a2 + 16);
    if (!v4)
    {
      swift_bridgeObjectRelease();
LABEL_28:
      swift_release();
      return;
    }
    v5 = 0;
    v6 = 0;
    v7 = a2 + 32;
    v32 = v4 - 1;
    v8 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      sub_246EA297C(v7, (uint64_t)&v36);
      v9 = *(_QWORD *)(v8 + 16);
      if ((uint64_t)v9 >= a1)
      {
        if (v6 >= v9)
          goto LABEL_30;
        sub_246EA297C(v8 + 40 * v6 + 32, (uint64_t)v33);
        v19 = v40;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246EB5088(0, *(_QWORD *)(v19 + 16) + 1, 1);
          v19 = v40;
        }
        v21 = *(_QWORD *)(v19 + 16);
        v20 = *(_QWORD *)(v19 + 24);
        if (v21 >= v20 >> 1)
          sub_246EB5088(v20 > 1, v21 + 1, 1);
        v22 = v34;
        v23 = v35;
        v24 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v33, v34);
        MEMORY[0x24BDAC7A8](v24, v24);
        v26 = (char *)&v31 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v27 + 16))(v26);
        sub_246EA27FC(v21, (uint64_t)v26, &v40, v22, v23);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
        v28 = v39;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246EA06B4(v28);
          v28 = v29;
          v39 = v29;
        }
        if (v6 >= *(_QWORD *)(v28 + 16))
          goto LABEL_31;
        v30 = v28 + 40 * v6 + 32;
        __swift_destroy_boxed_opaque_existential_1(v30);
        sub_246EA00C4(&v36, v30);
        v8 = v39;
        if ((uint64_t)++v6 >= a1)
        {
          if (v32 == v5)
          {
LABEL_26:
            swift_bridgeObjectRelease();
            goto LABEL_28;
          }
          v6 = 0;
          goto LABEL_24;
        }
      }
      else
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v39 = v8;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_246EB5088(0, v9 + 1, 1);
          v8 = v39;
        }
        v12 = *(_QWORD *)(v8 + 16);
        v11 = *(_QWORD *)(v8 + 24);
        if (v12 >= v11 >> 1)
          sub_246EB5088(v11 > 1, v12 + 1, 1);
        v13 = v37;
        v14 = v38;
        v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v36, v37);
        MEMORY[0x24BDAC7A8](v15, v15);
        v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v18 + 16))(v17);
        sub_246EA27FC(v12, (uint64_t)v17, &v39, v13, v14);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
        v8 = v39;
      }
      if (v32 == v5)
        goto LABEL_26;
LABEL_24:
      ++v5;
      v7 += 40;
      if (v5 >= *(_QWORD *)(a2 + 16))
      {
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return;
      }
    }
  }
}

double sub_246E9FB04@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_246EA297C(a1 + 32, a2);
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_246E9FB3C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HighestScoringOriginalDialogSelector()
{
  return objc_opt_self();
}

uint64_t sub_246E9FB80@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_246E9F2A4(a1, a2);
}

uint64_t sub_246E9FBA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[40];
  _QWORD v14[5];
  char v15;

  v3 = v1;
  v5 = *(_QWORD *)(v3 + 40);
  v6 = *(_QWORD *)(v3 + 48);
  OUTLINED_FUNCTION_27((_QWORD *)(v3 + 16));
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 8))(a1, v5, v6);
  v8 = *(_QWORD *)(v3 + 80);
  v9 = *(_QWORD *)(v3 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 56), v8);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t))(v9 + 8))(v14, v7, v8, v9);
  if (v2)
    return OUTLINED_FUNCTION_3_0();
  v15 = *(_BYTE *)(v3 + 104);
  sub_246EA297C((uint64_t)v14, (uint64_t)v13);
  sub_246EB72C4(&v15, v7, (uint64_t)v13);
  OUTLINED_FUNCTION_3_0();
  sub_246EA2924((uint64_t)v13, &qword_25765AE70);
  v11 = v14[3];
  v12 = v14[4];
  OUTLINED_FUNCTION_27(v14);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_246E9FCC0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  return v0;
}

uint64_t sub_246E9FCEC()
{
  sub_246E9FCC0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DialogScorerSelector()
{
  return objc_opt_self();
}

uint64_t sub_246E9FD2C(uint64_t a1)
{
  return sub_246E9FBA0(a1);
}

uint64_t sub_246E9FD4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24[2];
  uint64_t v25;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v25 = a2;
    v4 = a1 + 32;
    v6 = *(_QWORD *)(v2 + 16);
    v5 = *(_QWORD *)(v2 + 24);
    swift_bridgeObjectRetain();
    v17 = v4;
    while (1)
    {
      sub_246EA297C(v4, (uint64_t)&v21);
      v8 = v22;
      v7 = v23;
      __swift_project_boxed_opaque_existential_1(&v21, v22);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v7 + 8))(v18, v8, v7);
      v9 = v19;
      v10 = v20;
      __swift_project_boxed_opaque_existential_1(v18, v19);
      if ((*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10) == v6 && v11 == v5)
        break;
      v13 = sub_246EBE368();
      v14 = OUTLINED_FUNCTION_26();
      OUTLINED_FUNCTION_22(v14);
      if ((v13 & 1) != 0)
        goto LABEL_12;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v21);
      v4 += 40;
      if (!--v3)
      {
        OUTLINED_FUNCTION_3_0();
        sub_246EA297C(v17, (uint64_t)v24);
        return sub_246EA00C4(v24, v25);
      }
    }
    v16 = OUTLINED_FUNCTION_6_0();
    OUTLINED_FUNCTION_22(v16, v17);
LABEL_12:
    OUTLINED_FUNCTION_3_0();
    sub_246EA00C4(&v21, (uint64_t)v24);
    return sub_246EA00C4(v24, v25);
  }
  else
  {
    sub_246EA00DC();
    OUTLINED_FUNCTION_0_0();
    return OUTLINED_FUNCTION_4_0();
  }
}

uint64_t sub_246E9FEA4()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IdentifiedDialogOrFirstSelector()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HighestScoringOriginalDialogSelector.ThresholdMethod(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HighestScoringOriginalDialogSelector.ThresholdMethod(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246E9FFCC + 4 * byte_246EBE9B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246EA0000 + 4 * byte_246EBE9B0[v4]))();
}

uint64_t sub_246EA0000(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EA0008(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246EA0010);
  return result;
}

uint64_t sub_246EA001C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246EA0024);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_246EA0028(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EA0030(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EA003C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_246EA0048(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HighestScoringOriginalDialogSelector.ThresholdMethod()
{
  return &type metadata for HighestScoringOriginalDialogSelector.ThresholdMethod;
}

unint64_t sub_246EA0068()
{
  unint64_t result;

  result = qword_25765AE60;
  if (!qword_25765AE60)
  {
    result = MEMORY[0x24956C6A0](&unk_246EBEB30, &type metadata for HighestScoringOriginalDialogSelector.ThresholdMethod);
    atomic_store(result, (unint64_t *)&qword_25765AE60);
  }
  return result;
}

uint64_t sub_246EA00A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246E9FD4C(a1, a2);
}

uint64_t sub_246EA00C4(__int128 *a1, uint64_t a2)
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

unint64_t sub_246EA00DC()
{
  unint64_t result;

  result = qword_25765AE68;
  if (!qword_25765AE68)
  {
    result = MEMORY[0x24956C6A0](&protocol conformance descriptor for NLGDialogSelectorError, &type metadata for NLGDialogSelectorError);
    atomic_store(result, (unint64_t *)&qword_25765AE68);
  }
  return result;
}

uint64_t sub_246EA0118(uint64_t a1, char a2)
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
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765AE90);
  v37 = a2;
  v6 = sub_246EBE2FC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
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
    v23 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * i);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_246EBE3D4();
    sub_246EBE104();
    result = sub_246EBE3EC();
    v24 = -1 << *(_BYTE *)(v7 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        v30 = v26 == v29;
        if (v26 == v29)
          v26 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          v27 = __clz(__rbit64(~v31)) + (v26 << 6);
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
    v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    v32 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v27);
    *v32 = v22;
    v32[1] = v21;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v27) = v23;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_41;
    if (v16 >= v35)
    {
      swift_release();
      v3 = v34;
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v36 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v35)
        goto LABEL_32;
      v18 = *(_QWORD *)(v36 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_18:
    v10 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v35)
  {
    v18 = *(_QWORD *)(v36 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_42;
        if (v13 >= v35)
          goto LABEL_32;
        v18 = *(_QWORD *)(v36 + 8 * v13);
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
  v3 = v34;
LABEL_34:
  if ((v37 & 1) != 0)
  {
    v33 = 1 << *(_BYTE *)(v5 + 32);
    if (v33 >= 64)
      sub_246EA0410(0, (unint64_t)(v33 + 63) >> 6, v17);
    else
      *v17 = -1 << v33;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_246EA0410(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_246EA042C(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_15();
  for (i = (uint64_t *)(a1 + 48); ; i += 3)
  {
    v8 = *(i - 2);
    v7 = *(i - 1);
    v9 = *i;
    v10 = (_QWORD *)*a3;
    OUTLINED_FUNCTION_12();
    v12 = OUTLINED_FUNCTION_17();
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      break;
    v16 = v11;
    if (v10[3] >= v15)
    {
      if ((a2 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_25765AAA8);
        sub_246EBE2CC();
      }
    }
    else
    {
      sub_246EA0118(v15, a2 & 1);
      v17 = OUTLINED_FUNCTION_17();
      if ((v16 & 1) != (v18 & 1))
        goto LABEL_18;
      v12 = v17;
    }
    v19 = (_QWORD *)*a3;
    if ((v16 & 1) != 0)
    {
      OUTLINED_FUNCTION_6_0();
      *(_QWORD *)(v19[7] + 8 * v12) = v9;
    }
    else
    {
      v19[(v12 >> 6) + 8] |= 1 << v12;
      v20 = (_QWORD *)(v19[6] + 16 * v12);
      *v20 = v8;
      v20[1] = v7;
      *(_QWORD *)(v19[7] + 8 * v12) = v9;
      v21 = v19[2];
      v22 = __OFADD__(v21, 1);
      v23 = v21 + 1;
      if (v22)
        goto LABEL_17;
      v19[2] = v23;
    }
    a2 = 1;
    if (!--v4)
    {
      OUTLINED_FUNCTION_7_0();
      return OUTLINED_FUNCTION_7_0();
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  result = sub_246EBE398();
  __break(1u);
  return result;
}

uint64_t sub_246EA05B4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_246EA06B4(v2);
    v2 = v3;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  result = sub_246EA1314(v6);
  *a1 = v2;
  return result;
}

uint64_t sub_246EA061C(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8[2];

  v4 = *a1;
  swift_bridgeObjectRetain_n();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_246EA06B4(v4);
    v4 = v5;
  }
  v6 = *(_QWORD *)(v4 + 16);
  v8[0] = v4 + 32;
  v8[1] = v6;
  swift_bridgeObjectRetain();
  sub_246EA06C8(v8, a2);
  *a1 = v4;
  return swift_bridgeObjectRelease_n();
}

void sub_246EA06B4(uint64_t a1)
{
  sub_246EB54C0(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_246EA06C8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
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
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
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
  unint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  float v94;
  uint64_t v95;
  uint64_t v96;
  _BOOL4 v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  char *v104;
  char *v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  BOOL v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  BOOL v127;
  uint64_t v128;
  char v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  BOOL v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  uint64_t v146;
  char *v147;
  char *v148;
  uint64_t v149;
  unint64_t v150;
  char *v151;
  uint64_t v152;
  char *v153;
  unint64_t v154;
  unint64_t v155;
  char *v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  char *v162;
  unint64_t v163;
  char *v164;
  unint64_t v165;
  uint64_t result;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int v171;
  uint64_t v172;
  uint64_t *v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  char *v177;
  unint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  _QWORD v184[3];
  uint64_t v185;
  uint64_t v186;
  _QWORD v187[3];
  uint64_t v188;
  uint64_t v189;
  __int128 v190;
  uint64_t v191;
  uint64_t v192;

  v4 = a1;
  v5 = a1[1];
  swift_bridgeObjectRetain_n();
  v6 = sub_246EBE350();
  if (v6 >= v5)
  {
    if ((v5 & 0x8000000000000000) == 0)
    {
      if (v5)
        sub_246EA1B14(0, v5, 1, v4, a2);
      swift_bridgeObjectRelease_n();
      return swift_bridgeObjectRelease();
    }
    goto LABEL_164;
  }
  v7 = v6;
  v183 = v2;
  v168 = sub_246EB8FDC(v5 / 2);
  v169 = v5;
  v175 = a2;
  v176 = v8;
  if (v5 <= 0)
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
    v103 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_126:
    v156 = v10;
    if (v103 < 2)
    {
LABEL_139:
      swift_bridgeObjectRelease();
      if (v169 >= -1)
        goto LABEL_140;
      goto LABEL_169;
    }
    v157 = *v4;
    v182 = *v4;
    while (1)
    {
      v158 = v103 - 2;
      if (v103 < 2)
        break;
      if (!v157)
        goto LABEL_173;
      v159 = *(_QWORD *)&v156[16 * v158 + 32];
      v160 = *(_QWORD *)&v156[16 * v103 + 24];
      v161 = (char *)(v157 + 40 * v159);
      v162 = (char *)(v157 + 40 * *(_QWORD *)&v156[16 * v103 + 16]);
      v163 = v157 + 40 * v160;
      swift_bridgeObjectRetain();
      sub_246EA1F18(v161, v162, v163, v176, a2);
      if (v183)
        goto LABEL_123;
      if (v160 < v159)
        goto LABEL_159;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v156 = sub_246EA27E8((uint64_t)v156);
      if (v158 >= *((_QWORD *)v156 + 2))
        goto LABEL_160;
      v164 = &v156[16 * v158 + 32];
      *(_QWORD *)v164 = v159;
      *((_QWORD *)v164 + 1) = v160;
      v165 = *((_QWORD *)v156 + 2);
      if (v103 > v165)
        goto LABEL_161;
      memmove(&v156[16 * v103 + 16], &v156[16 * v103 + 32], 16 * (v165 - v103));
      *((_QWORD *)v156 + 2) = v165 - 1;
      v103 = v165 - 1;
      a2 = v175;
      v157 = v182;
      if (v165 <= 2)
        goto LABEL_139;
    }
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
LABEL_169:
    __break(1u);
LABEL_170:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_171:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_172:
    swift_bridgeObjectRelease_n();
    __break(1u);
LABEL_173:
    result = swift_bridgeObjectRelease_n();
    __break(1u);
    return result;
  }
  v167 = v7;
  v9 = 0;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v173 = v4;
  while (1)
  {
    v11 = v9++;
    v177 = v10;
    v174 = v11;
    if (v9 < v5)
    {
      v12 = *v4;
      sub_246EA297C(*v4 + 40 * v9, (uint64_t)&v190);
      v170 = v12;
      sub_246EA297C(v12 + 40 * v11, (uint64_t)v187);
      v13 = v191;
      v14 = v192;
      __swift_project_boxed_opaque_existential_1(&v190, v191);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v14 + 8))(v184, v13, v14);
      v15 = v185;
      v16 = v186;
      __swift_project_boxed_opaque_existential_1(v184, v185);
      v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
      v179 = v5;
      if (*(_QWORD *)(a2 + 16) && (v19 = sub_246EB5650(v17, v18), (v20 & 1) != 0))
        v21 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v19);
      else
        v21 = -1;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
      v22 = v188;
      v23 = v189;
      __swift_project_boxed_opaque_existential_1(v187, v188);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v23 + 8))(v184, v22, v23);
      v24 = v185;
      v25 = v186;
      __swift_project_boxed_opaque_existential_1(v184, v185);
      v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v25);
      if (*(_QWORD *)(a2 + 16) && (v28 = sub_246EB5650(v26, v27), (v29 & 1) != 0))
        v30 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v28);
      else
        v30 = -1;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
      if (v21 == v30)
      {
        v31 = v191;
        v32 = v192;
        __swift_project_boxed_opaque_existential_1(&v190, v191);
        v33 = (*(float (**)(uint64_t, uint64_t))(v32 + 16))(v31, v32);
        v34 = v188;
        v35 = v189;
        __swift_project_boxed_opaque_existential_1(v187, v188);
        v36 = (*(float (**)(uint64_t, uint64_t))(v35 + 16))(v34, v35) < v33;
      }
      else
      {
        v36 = v21 < v30;
      }
      v171 = v36;
      v5 = v179;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v190);
      v9 = v11 + 2;
      if (v11 + 2 < v179)
      {
        v37 = v170 + 40 * v11 + 40;
        while (1)
        {
          sub_246EA297C(v37 + 40, (uint64_t)&v190);
          sub_246EA297C(v37, (uint64_t)v187);
          v39 = v191;
          v38 = v192;
          __swift_project_boxed_opaque_existential_1(&v190, v191);
          (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v38 + 8))(v184, v39, v38);
          v40 = v185;
          v41 = v186;
          __swift_project_boxed_opaque_existential_1(v184, v185);
          v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8))(v40, v41);
          if (!*(_QWORD *)(a2 + 16))
            goto LABEL_21;
          v44 = sub_246EB5650(v42, v43);
          if ((v45 & 1) != 0)
            v46 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v44);
          else
LABEL_21:
            v46 = -1;
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
          v47 = v188;
          v48 = v189;
          __swift_project_boxed_opaque_existential_1(v187, v188);
          (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v48 + 8))(v184, v47, v48);
          v49 = v185;
          v50 = v186;
          __swift_project_boxed_opaque_existential_1(v184, v185);
          v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 8))(v49, v50);
          if (!*(_QWORD *)(a2 + 16))
            goto LABEL_25;
          v53 = sub_246EB5650(v51, v52);
          if ((v54 & 1) != 0)
            v55 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v53);
          else
LABEL_25:
            v55 = -1;
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
          if (v46 == v55)
          {
            v56 = v191;
            v57 = v192;
            __swift_project_boxed_opaque_existential_1(&v190, v191);
            v58 = (*(float (**)(uint64_t, uint64_t))(v57 + 16))(v56, v57);
            v59 = v188;
            v60 = v189;
            __swift_project_boxed_opaque_existential_1(v187, v188);
            v61 = (*(float (**)(uint64_t, uint64_t))(v60 + 16))(v59, v60) < v58;
          }
          else
          {
            v61 = v46 < v55;
          }
          v10 = v177;
          v5 = v179;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v190);
          if (v171 != v61)
            break;
          ++v9;
          v37 += 40;
          if (v9 >= v179)
          {
            v9 = v179;
            break;
          }
        }
      }
      if (v171)
      {
        if (v9 < v11)
          goto LABEL_166;
        if (v11 < v9)
        {
          v62 = 40 * v9 - 40;
          v63 = 40 * v11;
          v64 = v11;
          v65 = v9;
          do
          {
            if (v64 != --v9)
            {
              if (!v170)
                goto LABEL_172;
              v66 = v170 + v63;
              sub_246EA00C4((__int128 *)(v170 + v63), (uint64_t)&v190);
              v67 = *(_QWORD *)(v170 + v62 + 32);
              v68 = *(_OWORD *)(v170 + v62 + 16);
              *(_OWORD *)v66 = *(_OWORD *)(v170 + v62);
              *(_OWORD *)(v66 + 16) = v68;
              *(_QWORD *)(v66 + 32) = v67;
              sub_246EA00C4(&v190, v170 + v62);
              v10 = v177;
            }
            ++v64;
            v62 -= 40;
            v63 += 40;
          }
          while (v64 < v9);
          v9 = v65;
          v11 = v174;
          v5 = v179;
        }
      }
    }
    if (v9 < v5)
    {
      if (__OFSUB__(v9, v11))
        goto LABEL_163;
      if (v9 - v11 < v167)
      {
        if (__OFADD__(v11, v167))
          goto LABEL_167;
        if (v11 + v167 >= v5)
          v69 = v5;
        else
          v69 = v11 + v167;
        if (v69 < v11)
          goto LABEL_168;
        if (v9 != v69)
        {
          v70 = 40 * v9 - 40;
          v172 = v69;
          do
          {
            v71 = v11;
            v180 = v70;
            v72 = v9;
            do
            {
              v73 = *v4 + v70;
              sub_246EA297C(v73 + 40, (uint64_t)&v190);
              sub_246EA297C(v73, (uint64_t)v187);
              v74 = v191;
              v75 = v192;
              __swift_project_boxed_opaque_existential_1(&v190, v191);
              (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v75 + 8))(v184, v74, v75);
              v76 = v185;
              v77 = v186;
              __swift_project_boxed_opaque_existential_1(v184, v185);
              v78 = (*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8))(v76, v77);
              if (*(_QWORD *)(a2 + 16) && (v80 = sub_246EB5650(v78, v79), (v81 & 1) != 0))
                v82 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v80);
              else
                v82 = -1;
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
              v83 = v188;
              v84 = v189;
              __swift_project_boxed_opaque_existential_1(v187, v188);
              (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v84 + 8))(v184, v83, v84);
              v85 = v185;
              v86 = v186;
              __swift_project_boxed_opaque_existential_1(v184, v185);
              v87 = (*(uint64_t (**)(uint64_t, uint64_t))(v86 + 8))(v85, v86);
              if (*(_QWORD *)(a2 + 16) && (v89 = sub_246EB5650(v87, v88), (v90 & 1) != 0))
                v91 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v89);
              else
                v91 = -1;
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v184);
              if (v82 == v91)
              {
                v92 = v191;
                v93 = v192;
                __swift_project_boxed_opaque_existential_1(&v190, v191);
                v94 = (*(float (**)(uint64_t, uint64_t))(v93 + 16))(v92, v93);
                v95 = v188;
                v96 = v189;
                __swift_project_boxed_opaque_existential_1(v187, v188);
                v97 = (*(float (**)(uint64_t, uint64_t))(v96 + 16))(v95, v96) < v94;
              }
              else
              {
                v97 = v82 < v91;
              }
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v187);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v190);
              if (!v97)
                break;
              v98 = *v4;
              if (!*v4)
                goto LABEL_170;
              v99 = v98 + v70;
              sub_246EA00C4((__int128 *)(v98 + v70 + 40), (uint64_t)&v190);
              v100 = *(_OWORD *)(v99 + 16);
              *(_OWORD *)(v99 + 40) = *(_OWORD *)v99;
              *(_OWORD *)(v99 + 56) = v100;
              *(_QWORD *)(v99 + 72) = *(_QWORD *)(v99 + 32);
              sub_246EA00C4(&v190, v99);
              v70 -= 40;
              ++v71;
            }
            while (v72 != v71);
            v9 = v72 + 1;
            v70 = v180 + 40;
            v11 = v174;
          }
          while (v9 != v172);
          v9 = v172;
          v10 = v177;
        }
      }
    }
    if (v9 < v11)
      goto LABEL_162;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_246EA26F4(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v102 = *((_QWORD *)v10 + 2);
    v101 = *((_QWORD *)v10 + 3);
    v103 = v102 + 1;
    if (v102 >= v101 >> 1)
      v10 = sub_246EA26F4((char *)(v101 > 1), v102 + 1, 1, v10);
    *((_QWORD *)v10 + 2) = v103;
    v104 = &v10[16 * v102 + 32];
    *(_QWORD *)v104 = v11;
    *((_QWORD *)v104 + 1) = v9;
    if (v102)
      break;
    v103 = 1;
LABEL_117:
    v5 = v4[1];
    if (v9 >= v5)
      goto LABEL_126;
  }
  v105 = v10 + 32;
  while (1)
  {
    v106 = v103 - 1;
    if (v103 >= 4)
    {
      v111 = &v105[16 * v103];
      v112 = *((_QWORD *)v111 - 8);
      v113 = *((_QWORD *)v111 - 7);
      v117 = __OFSUB__(v113, v112);
      v114 = v113 - v112;
      if (v117)
        goto LABEL_147;
      v116 = *((_QWORD *)v111 - 6);
      v115 = *((_QWORD *)v111 - 5);
      v117 = __OFSUB__(v115, v116);
      v109 = v115 - v116;
      v110 = v117;
      if (v117)
        goto LABEL_148;
      v118 = v103 - 2;
      v119 = &v105[16 * v103 - 32];
      v121 = *(_QWORD *)v119;
      v120 = *((_QWORD *)v119 + 1);
      v117 = __OFSUB__(v120, v121);
      v122 = v120 - v121;
      if (v117)
        goto LABEL_149;
      v117 = __OFADD__(v109, v122);
      v123 = v109 + v122;
      if (v117)
        goto LABEL_151;
      if (v123 >= v114)
      {
        v141 = &v105[16 * v106];
        v143 = *(_QWORD *)v141;
        v142 = *((_QWORD *)v141 + 1);
        v117 = __OFSUB__(v142, v143);
        v144 = v142 - v143;
        if (v117)
          goto LABEL_157;
        v134 = v109 < v144;
        goto LABEL_106;
      }
    }
    else
    {
      if (v103 != 3)
      {
        v135 = *((_QWORD *)v10 + 4);
        v136 = *((_QWORD *)v10 + 5);
        v117 = __OFSUB__(v136, v135);
        v128 = v136 - v135;
        v129 = v117;
        goto LABEL_100;
      }
      v108 = *((_QWORD *)v10 + 4);
      v107 = *((_QWORD *)v10 + 5);
      v117 = __OFSUB__(v107, v108);
      v109 = v107 - v108;
      v110 = v117;
    }
    if ((v110 & 1) != 0)
      goto LABEL_150;
    v118 = v103 - 2;
    v124 = &v105[16 * v103 - 32];
    v126 = *(_QWORD *)v124;
    v125 = *((_QWORD *)v124 + 1);
    v127 = __OFSUB__(v125, v126);
    v128 = v125 - v126;
    v129 = v127;
    if (v127)
      goto LABEL_152;
    v130 = &v105[16 * v106];
    v132 = *(_QWORD *)v130;
    v131 = *((_QWORD *)v130 + 1);
    v117 = __OFSUB__(v131, v132);
    v133 = v131 - v132;
    if (v117)
      goto LABEL_154;
    if (__OFADD__(v128, v133))
      goto LABEL_156;
    if (v128 + v133 >= v109)
    {
      v134 = v109 < v133;
LABEL_106:
      if (v134)
        v106 = v118;
      goto LABEL_108;
    }
LABEL_100:
    if ((v129 & 1) != 0)
      goto LABEL_153;
    v137 = &v105[16 * v106];
    v139 = *(_QWORD *)v137;
    v138 = *((_QWORD *)v137 + 1);
    v117 = __OFSUB__(v138, v139);
    v140 = v138 - v139;
    if (v117)
      goto LABEL_155;
    if (v140 < v128)
      goto LABEL_117;
LABEL_108:
    v145 = v106 - 1;
    if (v106 - 1 >= v103)
    {
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
      goto LABEL_158;
    }
    v146 = *v4;
    if (!*v4)
      goto LABEL_171;
    v147 = &v105[16 * v145];
    v148 = v105;
    v149 = *(_QWORD *)v147;
    v150 = v106;
    v151 = &v148[16 * v106];
    v152 = *((_QWORD *)v151 + 1);
    v153 = (char *)(v146 + 40 * *(_QWORD *)v147);
    v178 = v146 + 40 * v152;
    v181 = (char *)(v146 + 40 * *(_QWORD *)v151);
    a2 = v175;
    swift_bridgeObjectRetain();
    sub_246EA1F18(v153, v181, v178, v176, v175);
    if (v183)
      break;
    if (v152 < v149)
      goto LABEL_144;
    if (v150 > *((_QWORD *)v10 + 2))
      goto LABEL_145;
    v154 = v150;
    *(_QWORD *)v147 = v149;
    v105 = v10 + 32;
    *(_QWORD *)&v10[16 * v145 + 40] = v152;
    v155 = *((_QWORD *)v10 + 2);
    if (v150 >= v155)
      goto LABEL_146;
    v183 = 0;
    v103 = v155 - 1;
    memmove(v151, v151 + 16, 16 * (v155 - 1 - v154));
    *((_QWORD *)v10 + 2) = v155 - 1;
    v4 = v173;
    if (v155 <= 2)
      goto LABEL_117;
  }
LABEL_123:
  swift_bridgeObjectRelease();
  if (v169 < -1)
    goto LABEL_165;
LABEL_140:
  *(_QWORD *)(v168 + 16) = 0;
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246EA1314(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  unint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  char v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  _QWORD v120[3];
  uint64_t v121;
  uint64_t v122;
  __int128 v123;
  uint64_t v124;
  uint64_t v125;

  v2 = a1;
  v3 = a1[1];
  result = sub_246EBE350();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        return sub_246EA1DB8(0, v3, 1, v2);
      return result;
    }
    goto LABEL_127;
  }
  v5 = result;
  result = sub_246EB8FDC(v3 / 2);
  v113 = result;
  v114 = v3;
  v119 = v6;
  if (v3 <= 0)
  {
    v8 = MEMORY[0x24BEE4AF8];
    v49 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_92:
    result = v8;
    if (v49 < 2)
    {
LABEL_103:
      result = swift_bridgeObjectRelease();
      if (v114 >= -1)
      {
        *(_QWORD *)(v113 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_132;
    }
    v102 = *v2;
    while (1)
    {
      v103 = v49 - 2;
      if (v49 < 2)
        break;
      if (!v102)
        goto LABEL_136;
      v104 = result;
      v105 = *(_QWORD *)(result + 32 + 16 * v103);
      v106 = *(_QWORD *)(result + 32 + 16 * (v49 - 1) + 8);
      result = sub_246EA243C((char *)(v102 + 40 * v105), (char *)(v102 + 40 * *(_QWORD *)(result + 32 + 16 * (v49 - 1))), v102 + 40 * v106, v119);
      if (v1)
        goto LABEL_89;
      if (v106 < v105)
        goto LABEL_122;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_246EA27E8(v104);
        v104 = result;
      }
      if (v103 >= *(_QWORD *)(v104 + 16))
        goto LABEL_123;
      v107 = v104 + 32;
      v108 = (_QWORD *)(v104 + 32 + 16 * v103);
      *v108 = v105;
      v108[1] = v106;
      v109 = v104;
      v110 = *(_QWORD *)(v104 + 16);
      if (v49 > v110)
        goto LABEL_124;
      memmove((void *)(v107 + 16 * (v49 - 1)), (const void *)(v107 + 16 * v49), 16 * (v110 - v49));
      result = v109;
      *(_QWORD *)(v109 + 16) = v110 - 1;
      v49 = v110 - 1;
      if (v110 <= 2)
        goto LABEL_103;
    }
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
    return result;
  }
  v112 = v5;
  v7 = 0;
  v8 = MEMORY[0x24BEE4AF8];
  v9 = v3;
  while (1)
  {
    v10 = v7++;
    v117 = v10;
    if (v7 < v9)
    {
      v11 = *v2;
      sub_246EA297C(*v2 + 40 * v7, (uint64_t)&v123);
      sub_246EA297C(v11 + 40 * v10, (uint64_t)v120);
      v13 = v124;
      v12 = v125;
      __swift_project_boxed_opaque_existential_1(&v123, v124);
      v14 = (*(float (**)(uint64_t, uint64_t))(v12 + 16))(v13, v12);
      v15 = v121;
      v16 = v122;
      __swift_project_boxed_opaque_existential_1(v120, v121);
      v17 = (*(float (**)(uint64_t, uint64_t))(v16 + 16))(v15, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v123);
      v7 = v10 + 2;
      v115 = v11;
      if (v10 + 2 < v9)
      {
        v18 = v11 + 40 * v10 + 40;
        while (1)
        {
          v19 = v18 + 40;
          sub_246EA297C(v18 + 40, (uint64_t)&v123);
          sub_246EA297C(v18, (uint64_t)v120);
          v20 = v124;
          v21 = v125;
          __swift_project_boxed_opaque_existential_1(&v123, v124);
          v22 = (*(float (**)(uint64_t, uint64_t))(v21 + 16))(v20, v21);
          v23 = v121;
          v24 = v122;
          __swift_project_boxed_opaque_existential_1(v120, v121);
          v25 = (*(float (**)(uint64_t, uint64_t))(v24 + 16))(v23, v24) >= v22;
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
          result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v123);
          if (v17 < v14 == v25)
            break;
          ++v7;
          v18 = v19;
          if (v7 >= v9)
          {
            v7 = v9;
            break;
          }
        }
        v10 = v117;
      }
      if (v17 < v14)
      {
        if (v7 < v10)
          goto LABEL_129;
        if (v10 < v7)
        {
          v111 = v9;
          v26 = 40 * v7 - 40;
          v27 = v10;
          v28 = 40 * v10;
          v29 = v7;
          do
          {
            if (v27 != --v29)
            {
              if (!v115)
                goto LABEL_135;
              v30 = v115 + v28;
              sub_246EA00C4((__int128 *)(v115 + v28), (uint64_t)&v123);
              v31 = *(_QWORD *)(v115 + v26 + 32);
              v32 = *(_OWORD *)(v115 + v26 + 16);
              *(_OWORD *)v30 = *(_OWORD *)(v115 + v26);
              *(_OWORD *)(v30 + 16) = v32;
              *(_QWORD *)(v30 + 32) = v31;
              result = sub_246EA00C4(&v123, v115 + v26);
            }
            ++v27;
            v26 -= 40;
            v28 += 40;
          }
          while (v27 < v29);
          v10 = v117;
          v9 = v111;
        }
      }
    }
    if (v7 < v9)
    {
      if (__OFSUB__(v7, v10))
        goto LABEL_126;
      if (v7 - v10 < v112)
      {
        v33 = v10 + v112;
        if (__OFADD__(v10, v112))
          goto LABEL_130;
        if (v33 >= v9)
          v33 = v9;
        if (v33 < v10)
          goto LABEL_131;
        if (v7 != v33)
        {
          v34 = 40 * v7 - 40;
          v116 = v33;
          do
          {
            v35 = v10;
            v36 = v34;
            do
            {
              v37 = *v2 + v36;
              sub_246EA297C(v37 + 40, (uint64_t)&v123);
              sub_246EA297C(v37, (uint64_t)v120);
              v38 = v124;
              v39 = v125;
              __swift_project_boxed_opaque_existential_1(&v123, v124);
              v40 = (*(float (**)(uint64_t, uint64_t))(v39 + 16))(v38, v39);
              v41 = v121;
              v42 = v122;
              __swift_project_boxed_opaque_existential_1(v120, v121);
              v43 = (*(float (**)(uint64_t, uint64_t))(v42 + 16))(v41, v42);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)v120);
              result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v123);
              if (v43 >= v40)
                break;
              v44 = *v2;
              if (!*v2)
                goto LABEL_133;
              v45 = v44 + v36;
              sub_246EA00C4((__int128 *)(v44 + v36 + 40), (uint64_t)&v123);
              v46 = *(_OWORD *)(v45 + 16);
              *(_OWORD *)(v45 + 40) = *(_OWORD *)v45;
              *(_OWORD *)(v45 + 56) = v46;
              *(_QWORD *)(v45 + 72) = *(_QWORD *)(v45 + 32);
              result = sub_246EA00C4(&v123, v45);
              v36 -= 40;
              ++v35;
            }
            while (v7 != v35);
            ++v7;
            v34 += 40;
            v10 = v117;
          }
          while (v7 != v116);
          v7 = v116;
        }
      }
    }
    if (v7 < v10)
      goto LABEL_125;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_246EA26F4(0, *(_QWORD *)(v8 + 16) + 1, 1, (char *)v8);
      v8 = result;
    }
    v48 = *(_QWORD *)(v8 + 16);
    v47 = *(_QWORD *)(v8 + 24);
    v49 = v48 + 1;
    if (v48 >= v47 >> 1)
    {
      result = (uint64_t)sub_246EA26F4((char *)(v47 > 1), v48 + 1, 1, (char *)v8);
      v8 = result;
    }
    *(_QWORD *)(v8 + 16) = v49;
    v118 = v8 + 32;
    v50 = (uint64_t *)(v8 + 32 + 16 * v48);
    *v50 = v10;
    v50[1] = v7;
    if (v48)
      break;
    v49 = 1;
LABEL_84:
    v9 = v2[1];
    if (v7 >= v9)
      goto LABEL_92;
  }
  v51 = v8 + 32;
  while (1)
  {
    v52 = v49 - 1;
    if (v49 >= 4)
    {
      v57 = v51 + 16 * v49;
      v58 = *(_QWORD *)(v57 - 64);
      v59 = *(_QWORD *)(v57 - 56);
      v63 = __OFSUB__(v59, v58);
      v60 = v59 - v58;
      if (v63)
        goto LABEL_110;
      v62 = *(_QWORD *)(v57 - 48);
      v61 = *(_QWORD *)(v57 - 40);
      v63 = __OFSUB__(v61, v62);
      v55 = v61 - v62;
      v56 = v63;
      if (v63)
        goto LABEL_111;
      v64 = v49 - 2;
      v65 = (uint64_t *)(v51 + 16 * (v49 - 2));
      v67 = *v65;
      v66 = v65[1];
      v63 = __OFSUB__(v66, v67);
      v68 = v66 - v67;
      if (v63)
        goto LABEL_112;
      v63 = __OFADD__(v55, v68);
      v69 = v55 + v68;
      if (v63)
        goto LABEL_114;
      if (v69 >= v60)
      {
        v87 = (uint64_t *)(v51 + 16 * v52);
        v89 = *v87;
        v88 = v87[1];
        v63 = __OFSUB__(v88, v89);
        v90 = v88 - v89;
        if (v63)
          goto LABEL_120;
        v80 = v55 < v90;
        goto LABEL_73;
      }
    }
    else
    {
      if (v49 != 3)
      {
        v81 = *(_QWORD *)(v8 + 32);
        v82 = *(_QWORD *)(v8 + 40);
        v63 = __OFSUB__(v82, v81);
        v74 = v82 - v81;
        v75 = v63;
        goto LABEL_67;
      }
      v54 = *(_QWORD *)(v8 + 32);
      v53 = *(_QWORD *)(v8 + 40);
      v63 = __OFSUB__(v53, v54);
      v55 = v53 - v54;
      v56 = v63;
    }
    if ((v56 & 1) != 0)
      goto LABEL_113;
    v64 = v49 - 2;
    v70 = (uint64_t *)(v51 + 16 * (v49 - 2));
    v72 = *v70;
    v71 = v70[1];
    v73 = __OFSUB__(v71, v72);
    v74 = v71 - v72;
    v75 = v73;
    if (v73)
      goto LABEL_115;
    v76 = (uint64_t *)(v51 + 16 * v52);
    v78 = *v76;
    v77 = v76[1];
    v63 = __OFSUB__(v77, v78);
    v79 = v77 - v78;
    if (v63)
      goto LABEL_117;
    if (__OFADD__(v74, v79))
      goto LABEL_119;
    if (v74 + v79 >= v55)
    {
      v80 = v55 < v79;
LABEL_73:
      if (v80)
        v52 = v64;
      goto LABEL_75;
    }
LABEL_67:
    if ((v75 & 1) != 0)
      goto LABEL_116;
    v83 = (uint64_t *)(v51 + 16 * v52);
    v85 = *v83;
    v84 = v83[1];
    v63 = __OFSUB__(v84, v85);
    v86 = v84 - v85;
    if (v63)
      goto LABEL_118;
    if (v86 < v74)
      goto LABEL_84;
LABEL_75:
    v91 = v52 - 1;
    if (v52 - 1 >= v49)
    {
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
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
      goto LABEL_121;
    }
    v92 = v7;
    v93 = v2;
    v94 = *v2;
    if (!*v2)
      goto LABEL_134;
    v95 = v8;
    v96 = (uint64_t *)(v51 + 16 * v91);
    v97 = v51;
    v98 = *v96;
    v99 = (_QWORD *)(v97 + 16 * v52);
    v100 = v99[1];
    result = sub_246EA243C((char *)(v94 + 40 * *v96), (char *)(v94 + 40 * *v99), v94 + 40 * v100, v119);
    if (v1)
      break;
    if (v100 < v98)
      goto LABEL_107;
    if (v52 > *(_QWORD *)(v95 + 16))
      goto LABEL_108;
    *v96 = v98;
    v51 = v118;
    *(_QWORD *)(v118 + 16 * v91 + 8) = v100;
    v101 = *(_QWORD *)(v95 + 16);
    if (v52 >= v101)
      goto LABEL_109;
    v8 = v95;
    v49 = v101 - 1;
    result = (uint64_t)memmove(v99, v99 + 2, 16 * (v101 - 1 - v52));
    *(_QWORD *)(v95 + 16) = v101 - 1;
    v2 = v93;
    v7 = v92;
    if (v101 <= 2)
      goto LABEL_84;
  }
LABEL_89:
  result = swift_bridgeObjectRelease();
  if (v114 < -1)
    goto LABEL_128;
  *(_QWORD *)(v113 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_246EA1B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  uint64_t result;
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
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;

  if (a3 == a2)
    return swift_bridgeObjectRelease();
  v8 = a3;
  v9 = 40 * a3 - 40;
  while (2)
  {
    v10 = a1;
    v41 = v9;
    do
    {
      v11 = *a4 + v9;
      sub_246EA297C(v11 + 40, (uint64_t)&v48);
      sub_246EA297C(v11, (uint64_t)v45);
      v12 = v49;
      v13 = v50;
      __swift_project_boxed_opaque_existential_1(&v48, v49);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v42, v12, v13);
      v14 = v43;
      v15 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v14, v15);
      if (*(_QWORD *)(a5 + 16) && (v18 = sub_246EB5650(v16, v17), (v19 & 1) != 0))
        v20 = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * v18);
      else
        v20 = -1;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      v21 = v46;
      v22 = v47;
      __swift_project_boxed_opaque_existential_1(v45, v46);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v22 + 8))(v42, v21, v22);
      v23 = v43;
      v24 = v44;
      __swift_project_boxed_opaque_existential_1(v42, v43);
      v25 = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 8))(v23, v24);
      if (*(_QWORD *)(a5 + 16) && (v27 = sub_246EB5650(v25, v26), (v28 & 1) != 0))
        v29 = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * v27);
      else
        v29 = -1;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      if (v20 == v29)
      {
        v30 = v49;
        v31 = v50;
        __swift_project_boxed_opaque_existential_1(&v48, v49);
        v32 = (*(float (**)(uint64_t, uint64_t))(v31 + 16))(v30, v31);
        v33 = v46;
        v34 = v47;
        __swift_project_boxed_opaque_existential_1(v45, v46);
        v35 = (*(float (**)(uint64_t, uint64_t))(v34 + 16))(v33, v34) < v32;
      }
      else
      {
        v35 = v20 < v29;
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
      result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v48);
      if (!v35)
        break;
      v36 = *a4;
      if (!*a4)
      {
        __break(1u);
        return result;
      }
      v37 = v36 + v9;
      sub_246EA00C4((__int128 *)(v36 + v9 + 40), (uint64_t)&v48);
      v38 = *(_OWORD *)(v37 + 16);
      *(_OWORD *)(v37 + 40) = *(_OWORD *)v37;
      *(_OWORD *)(v37 + 56) = v38;
      *(_QWORD *)(v37 + 72) = *(_QWORD *)(v37 + 32);
      sub_246EA00C4(&v48, v37);
      v9 -= 40;
      ++v10;
    }
    while (v8 != v10);
    ++v8;
    v9 = v41 + 40;
    if (v8 != a2)
      continue;
    break;
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_246EA1DB8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = result;
  if (a3 != a2)
  {
    v5 = a3;
    v7 = 40 * a3 - 40;
    while (2)
    {
      v8 = v26;
      v9 = v7;
      do
      {
        v10 = *a4 + v9;
        sub_246EA297C(v10 + 40, (uint64_t)&v23);
        sub_246EA297C(v10, (uint64_t)v20);
        v11 = v24;
        v12 = v25;
        __swift_project_boxed_opaque_existential_1(&v23, v24);
        v13 = (*(float (**)(uint64_t, uint64_t))(v12 + 16))(v11, v12);
        v14 = v21;
        v15 = v22;
        __swift_project_boxed_opaque_existential_1(v20, v21);
        v16 = (*(float (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
        if (v16 >= v13)
          break;
        v17 = *a4;
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        v18 = v17 + v9;
        sub_246EA00C4((__int128 *)(v17 + v9 + 40), (uint64_t)&v23);
        v19 = *(_OWORD *)(v18 + 16);
        *(_OWORD *)(v18 + 40) = *(_OWORD *)v18;
        *(_OWORD *)(v18 + 56) = v19;
        *(_QWORD *)(v18 + 72) = *(_QWORD *)(v18 + 32);
        result = sub_246EA00C4(&v23, v18);
        v9 -= 40;
        ++v8;
      }
      while (v5 != v8);
      ++v5;
      v7 += 40;
      if (v5 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_246EA1F18(char *a1, char *a2, unint64_t a3, char *a4, uint64_t a5)
{
  char *v5;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  BOOL v40;
  char *v41;
  __int128 v44;
  __int128 v45;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  float v70;
  uint64_t v71;
  uint64_t v72;
  _BOOL4 v73;
  char *v74;
  BOOL v75;
  BOOL v76;
  __int128 v77;
  __int128 v78;
  char *v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD v85[3];
  uint64_t v86;
  uint64_t v87;
  _QWORD v88[3];
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[3];
  uint64_t v92;
  uint64_t v93;

  v5 = a4;
  v7 = a2;
  v8 = a1;
  v9 = a2 - a1;
  v10 = (a2 - a1) / 40;
  v11 = a3 - (_QWORD)a2;
  v12 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  if (v10 >= v12)
  {
    sub_246EB482C(a2, (uint64_t)(a3 - (_QWORD)a2) / 40, a4);
    v13 = (unint64_t)&v5[40 * v12];
    if (v8 >= v7 || v11 <= 39)
      goto LABEL_66;
    v47 = a3 - 40;
    v48 = a5;
    v81 = v5;
    while (1)
    {
      v83 = v13;
      v13 -= 40;
      sub_246EA297C(v13, (uint64_t)v91);
      v49 = v7 - 40;
      sub_246EA297C((uint64_t)(v7 - 40), (uint64_t)v88);
      v51 = v92;
      v50 = v93;
      __swift_project_boxed_opaque_existential_1(v91, v92);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v50 + 8))(v85, v51, v50);
      v52 = v86;
      v53 = v87;
      __swift_project_boxed_opaque_existential_1(v85, v86);
      v54 = (*(uint64_t (**)(uint64_t, uint64_t))(v53 + 8))(v52, v53);
      if (*(_QWORD *)(v48 + 16) && (v56 = sub_246EB5650(v54, v55), (v57 & 1) != 0))
        v58 = *(_QWORD *)(*(_QWORD *)(v48 + 56) + 8 * v56);
      else
        v58 = -1;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
      v59 = v89;
      v60 = v90;
      __swift_project_boxed_opaque_existential_1(v88, v89);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v60 + 8))(v85, v59, v60);
      v61 = v86;
      v62 = v87;
      __swift_project_boxed_opaque_existential_1(v85, v86);
      v63 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 8))(v61, v62);
      if (*(_QWORD *)(a5 + 16) && (v65 = sub_246EB5650(v63, v64), (v66 & 1) != 0))
        v67 = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * v65);
      else
        v67 = -1;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
      if (v58 == v67)
      {
        v68 = v92;
        v69 = v93;
        __swift_project_boxed_opaque_existential_1(v91, v92);
        v70 = (*(float (**)(uint64_t, uint64_t))(v69 + 16))(v68, v69);
        v71 = v89;
        v72 = v90;
        __swift_project_boxed_opaque_existential_1(v88, v89);
        v73 = (*(float (**)(uint64_t, uint64_t))(v72 + 16))(v71, v72) < v70;
      }
      else
      {
        v73 = v58 < v67;
      }
      v48 = a5;
      v5 = v81;
      v74 = (char *)(v47 + 40);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      if (v73)
      {
        v75 = v74 != v7 || v47 >= (unint64_t)v7;
        v7 -= 40;
        v13 = v83;
        if (!v75)
          goto LABEL_60;
      }
      else
      {
        v76 = v74 != (char *)v83 || v47 >= v83;
        v49 = (char *)v13;
        if (!v76)
          goto LABEL_60;
      }
      v77 = *(_OWORD *)v49;
      v78 = *((_OWORD *)v49 + 1);
      *(_QWORD *)(v47 + 32) = *((_QWORD *)v49 + 4);
      *(_OWORD *)v47 = v77;
      *(_OWORD *)(v47 + 16) = v78;
LABEL_60:
      v47 -= 40;
      if (v13 <= (unint64_t)v81 || v7 <= v8)
        goto LABEL_66;
    }
  }
  sub_246EB482C(a1, (a2 - a1) / 40, a4);
  v13 = (unint64_t)&v5[40 * v10];
  if ((unint64_t)v7 >= a3)
  {
    v7 = v8;
  }
  else
  {
    if (v9 > 39)
    {
      v82 = a3;
      do
      {
        v14 = v13;
        sub_246EA297C((uint64_t)v7, (uint64_t)v91);
        v15 = v5;
        sub_246EA297C((uint64_t)v5, (uint64_t)v88);
        v16 = v92;
        v17 = v93;
        __swift_project_boxed_opaque_existential_1(v91, v92);
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v17 + 8))(v85, v16, v17);
        v18 = v86;
        v19 = v87;
        __swift_project_boxed_opaque_existential_1(v85, v86);
        v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
        if (*(_QWORD *)(a5 + 16) && (v22 = sub_246EB5650(v20, v21), (v23 & 1) != 0))
          v24 = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * v22);
        else
          v24 = -1;
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
        v25 = v89;
        v26 = v90;
        __swift_project_boxed_opaque_existential_1(v88, v89);
        (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v26 + 8))(v85, v25, v26);
        v27 = v86;
        v28 = v87;
        __swift_project_boxed_opaque_existential_1(v85, v86);
        v29 = (*(uint64_t (**)(uint64_t, uint64_t))(v28 + 8))(v27, v28);
        if (*(_QWORD *)(a5 + 16) && (v31 = sub_246EB5650(v29, v30), (v32 & 1) != 0))
          v33 = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * v31);
        else
          v33 = -1;
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
        if (v24 == v33)
        {
          v34 = v92;
          v35 = v93;
          __swift_project_boxed_opaque_existential_1(v91, v92);
          v36 = (*(float (**)(uint64_t, uint64_t))(v35 + 16))(v34, v35);
          v37 = v89;
          v38 = v90;
          __swift_project_boxed_opaque_existential_1(v88, v89);
          v39 = (*(float (**)(uint64_t, uint64_t))(v38 + 16))(v37, v38) < v36;
        }
        else
        {
          v39 = v24 < v33;
        }
        v5 = v15;
        v13 = v14;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
        if (v39)
        {
          v40 = v8 == v7;
          v41 = v7;
          v7 += 40;
          if (v40 && v8 < v7)
            goto LABEL_28;
        }
        else
        {
          v41 = v15;
          v5 = v15 + 40;
          if (v8 == v15 && v8 < v5)
            goto LABEL_28;
        }
        v44 = *(_OWORD *)v41;
        v45 = *((_OWORD *)v41 + 1);
        *((_QWORD *)v8 + 4) = *((_QWORD *)v41 + 4);
        *(_OWORD *)v8 = v44;
        *((_OWORD *)v8 + 1) = v45;
LABEL_28:
        v8 += 40;
      }
      while ((unint64_t)v5 < v14 && (unint64_t)v7 < v82);
    }
    v7 = v8;
  }
LABEL_66:
  sub_246EB482C(v5, (uint64_t)(v13 - (_QWORD)v5) / 40, v7);
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_246EA243C(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  BOOL v20;
  char *v21;
  BOOL v22;
  __int128 v23;
  __int128 v24;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  BOOL v34;
  __int128 v35;
  __int128 v36;
  char *v39;
  _QWORD v40[3];
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  char *v46;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 40;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 40;
  if (v9 >= v11)
  {
    sub_246EB482C(a2, (uint64_t)(a3 - (_QWORD)a2) / 40, a4);
    v12 = &v4[40 * v11];
    if (v7 < v6 && v10 >= 40)
    {
      v26 = a3 - 40;
      v39 = v4;
      do
      {
        v46 = (char *)(v26 + 40);
        sub_246EA297C((uint64_t)(v12 - 40), (uint64_t)v43);
        v27 = v6 - 40;
        sub_246EA297C((uint64_t)(v6 - 40), (uint64_t)v40);
        v28 = v44;
        v29 = v45;
        __swift_project_boxed_opaque_existential_1(v43, v44);
        v30 = (*(float (**)(uint64_t, uint64_t))(v29 + 16))(v28, v29);
        v31 = v41;
        v32 = v42;
        __swift_project_boxed_opaque_existential_1(v40, v41);
        v33 = (*(float (**)(uint64_t, uint64_t))(v32 + 16))(v31, v32);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
        if (v33 >= v30)
        {
          v34 = v46 != v12 || v26 >= (unint64_t)v12;
          v27 = v12 - 40;
          v12 -= 40;
        }
        else
        {
          v34 = v46 != v6 || v26 >= (unint64_t)v6;
          v6 -= 40;
        }
        v4 = v39;
        if (v34)
        {
          v35 = *(_OWORD *)v27;
          v36 = *((_OWORD *)v27 + 1);
          *(_QWORD *)(v26 + 32) = *((_QWORD *)v27 + 4);
          *(_OWORD *)v26 = v35;
          *(_OWORD *)(v26 + 16) = v36;
        }
        v26 -= 40;
      }
      while (v12 > v39 && v6 > v7);
    }
  }
  else
  {
    sub_246EB482C(a1, (a2 - a1) / 40, a4);
    v12 = &v4[40 * v9];
    if ((unint64_t)v6 >= a3 || v8 < 40)
    {
      v6 = v7;
    }
    else
    {
      do
      {
        v13 = (unint64_t)v12;
        sub_246EA297C((uint64_t)v6, (uint64_t)v43);
        sub_246EA297C((uint64_t)v4, (uint64_t)v40);
        v14 = v44;
        v15 = v45;
        __swift_project_boxed_opaque_existential_1(v43, v44);
        v16 = (*(float (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
        v17 = v41;
        v18 = v42;
        __swift_project_boxed_opaque_existential_1(v40, v41);
        v19 = (*(float (**)(uint64_t, uint64_t))(v18 + 16))(v17, v18);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
        if (v19 >= v16)
        {
          v20 = v7 == v4;
          v21 = v4;
          v4 += 40;
          v22 = !v20 || v7 >= v4;
        }
        else
        {
          v20 = v7 == v6;
          v21 = v6;
          v6 += 40;
          v22 = !v20 || v7 >= v6;
        }
        v12 = (char *)v13;
        if (v22)
        {
          v23 = *(_OWORD *)v21;
          v24 = *((_OWORD *)v21 + 1);
          *((_QWORD *)v7 + 4) = *((_QWORD *)v21 + 4);
          *(_OWORD *)v7 = v23;
          *((_OWORD *)v7 + 1) = v24;
        }
        v7 += 40;
      }
      while ((unint64_t)v4 < v13 && (unint64_t)v6 < a3);
      v6 = v7;
    }
  }
  sub_246EB482C(v4, (v12 - v4) / 40, v6);
  return 1;
}

char *sub_246EA26F4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765AE88);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_246EA27E8(uint64_t a1)
{
  return sub_246EA26F4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_246EA27FC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_246EA00C4(&v12, v10 + 40 * a1 + 32);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
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

uint64_t sub_246EA28DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765AEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EA2924(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL sub_246EA2960(_QWORD *a1)
{
  uint64_t v1;

  return sub_246E9DF88(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_246EA297C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_246EA29C0()
{
  return swift_deallocObject();
}

uint64_t sub_246EA29D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_246EB7204(*(unsigned int *)(v1 + 16), a1);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_allocError();
}

BOOL OUTLINED_FUNCTION_2_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_willThrow();
}

char *OUTLINED_FUNCTION_5_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = a1;
  return sub_246EB506C(0, 0, 0);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_8_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_bridgeObjectRetain();
}

char *OUTLINED_FUNCTION_13@<X0>(uint64_t a1@<X8>)
{
  return sub_246EB506C(0, a1 + 1, 1);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_246EBE248();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_17()
{
  uint64_t v0;
  uint64_t v1;

  return sub_246EB5650(v1, v0);
}

uint64_t OUTLINED_FUNCTION_18()
{
  uint64_t v0;

  return sub_246EA00C4((__int128 *)(v0 - 200), v0 - 160);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_246EBE248();
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

float *OUTLINED_FUNCTION_23(float *result, float a2)
{
  *result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_246EBE02C();
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;
  uint64_t v1;

  return sub_246EA00C4((__int128 *)(v1 - 120), v0);
}

uint64_t OUTLINED_FUNCTION_26()
{
  return swift_bridgeObjectRelease();
}

_QWORD *OUTLINED_FUNCTION_27(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

void sub_246EA2B34(uint64_t a1)
{
  _DWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  os_log_type_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  sub_246EBDE94();
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v4, v5);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v6, v7);
  OUTLINED_FUNCTION_0_1();
  v18 = v8;
  sub_246EBDC9C();
  OUTLINED_FUNCTION_20_0();
  MEMORY[0x24BDAC7A8](v9, v10);
  OUTLINED_FUNCTION_16_0();
  if (qword_25765A820 != -1)
    swift_once();
  v11 = sub_246EBE02C();
  __swift_project_value_buffer(v11, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_6_1();
  v12 = (void *)sub_246EBE014();
  v13 = sub_246EBE1F4();
  if (OUTLINED_FUNCTION_17_0(v13))
  {
    OUTLINED_FUNCTION_14_0();
    v19 = OUTLINED_FUNCTION_13_0();
    *v1 = 136315138;
    sub_246EA3A30((unint64_t *)&qword_25765AF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v14 = OUTLINED_FUNCTION_11();
    sub_246EBBD70(v14, v15, &v19);
    sub_246EBE248();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_9_0(&dword_246E99000, v16, v17, "Loading JSON file from %s");
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_1_0();

  sub_246EBDCA8();
  if (v2)
  {
    OUTLINED_FUNCTION_2_1(a1);
    type metadata accessor for SerializedDialogSelectionModel();
    OUTLINED_FUNCTION_5_1();
  }
  else
  {
    sub_246EBDE88();
    sub_246EA3A30(&qword_25765AF68, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF6F8);
    sub_246EBDF3C();
    OUTLINED_FUNCTION_2_1(a1);
    sub_246EA39EC(v18, (uint64_t)v1 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model);
  }
  OUTLINED_FUNCTION_7_1();
}

void sub_246EA2DA4(uint64_t a1)
{
  _DWORD *v1;
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
  void *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[6];
  char *v24;
  uint64_t v25;
  _OWORD v26[2];
  uint64_t v27;
  uint64_t v28;

  sub_246EBDEAC();
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v3, v4);
  OUTLINED_FUNCTION_0_1();
  v23[5] = v5;
  v23[4] = OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_246EBDC9C();
  OUTLINED_FUNCTION_20_0();
  MEMORY[0x24BDAC7A8](v10, v11);
  OUTLINED_FUNCTION_16_0();
  if (qword_25765A820 != -1)
    swift_once();
  v12 = sub_246EBE02C();
  __swift_project_value_buffer(v12, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_6_1();
  v13 = (void *)sub_246EBE014();
  v14 = sub_246EBE1F4();
  v15 = OUTLINED_FUNCTION_17_0(v14);
  v24 = v9;
  if (v15)
  {
    OUTLINED_FUNCTION_14_0();
    v23[3] = v1;
    v16 = OUTLINED_FUNCTION_13_0();
    v23[2] = a1;
    *(_QWORD *)&v26[0] = v16;
    *v1 = 136315138;
    v23[1] = v1 + 1;
    sub_246EA3A30((unint64_t *)&qword_25765AF70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v17 = OUTLINED_FUNCTION_11();
    v28 = sub_246EBBD70(v17, v18, (uint64_t *)v26);
    sub_246EBE248();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_9_0(&dword_246E99000, v19, v20, "Loading binary file from %s");
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_1_0();

  v21 = v25;
  sub_246EBDCA8();
  if (v21)
  {
    OUTLINED_FUNCTION_2_1(a1);
    type metadata accessor for SerializedDialogSelectionModel();
    OUTLINED_FUNCTION_5_1();
  }
  else
  {
    v27 = 0;
    memset(v26, 0, sizeof(v26));
    sub_246EBDEA0();
    sub_246EA3A30(&qword_25765AF68, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF6F8);
    v22 = (uint64_t)v24;
    sub_246EBDF54();
    OUTLINED_FUNCTION_2_1(a1);
    sub_246EA39EC(v22, (uint64_t)v1 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model);
  }
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_246EA3034()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  BOOL v61;
  unint64_t v62;
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
  uint64_t *v75;
  uint64_t *v76;
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
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;

  v98 = type metadata accessor for Siri_Nlg_Content(0);
  v102 = *(_QWORD *)(v98 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = type metadata accessor for Siri_Nlg_Dialog(0);
  v91 = *(_QWORD *)(v83 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v5, v6);
  OUTLINED_FUNCTION_0_1();
  v94 = (uint64_t *)v7;
  v77 = type metadata accessor for Siri_Nlg_DialogSwitch(0);
  v79 = *(_QWORD *)(v77 - 8);
  OUTLINED_FUNCTION_4_1();
  MEMORY[0x24BDAC7A8](v8, v9);
  OUTLINED_FUNCTION_0_1();
  v84 = (uint64_t *)v10;
  v70 = type metadata accessor for Siri_Nlg_CATFile(0);
  MEMORY[0x24BDAC7A8](v70, v11);
  OUTLINED_FUNCTION_0_1();
  v78 = v13;
  v14 = v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model;
  v96 = v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model;
  v15 = *(_QWORD *)(v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model);
  v16 = MEMORY[0x24BEE4AF8];
  v67 = *(_QWORD *)(*(_QWORD *)v14 + 16);
  if (v67)
  {
    v72 = v12;
    v71 = v15 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    OUTLINED_FUNCTION_22_0();
    v17 = 0;
    v93 = v16;
    v18 = v78;
    v95 = v4;
    v65 = v15;
LABEL_3:
    if (v17 >= *(_QWORD *)(v15 + 16))
      goto LABEL_51;
    OUTLINED_FUNCTION_25_0();
    v68 = v19;
    sub_246EA3A6C(v71 + v20 * v19, v18, type metadata accessor for Siri_Nlg_CATFile);
    v21 = *(_QWORD *)v18;
    v69 = *(_QWORD *)(*(_QWORD *)v18 + 16);
    if (!v69)
      goto LABEL_44;
    v22 = *(int *)(v70 + 28);
    v76 = (uint64_t *)(v18 + *(int *)(v70 + 24));
    v75 = (uint64_t *)(v18 + v22);
    v74 = v21 + ((*(unsigned __int8 *)(v79 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80));
    v23 = swift_bridgeObjectRetain();
    v24 = 0;
    v66 = v23;
    while (1)
    {
      if (v24 >= *(_QWORD *)(v23 + 16))
        goto LABEL_50;
      OUTLINED_FUNCTION_25_0();
      v73 = v25;
      sub_246EA3A6C(v74 + v26 * v25, (uint64_t)v84, type metadata accessor for Siri_Nlg_DialogSwitch);
      v27 = v76[1];
      if (v27)
      {
        v87 = *v76;
        v90 = v27;
      }
      else
      {
        v87 = 0;
        v90 = 0xE000000000000000;
      }
      v28 = v75[1];
      if (v28)
      {
        v86 = *v75;
        v89 = v28;
      }
      else
      {
        v86 = 0;
        v89 = 0xE000000000000000;
      }
      v29 = (uint64_t *)((char *)v84 + *(int *)(v77 + 24));
      v30 = v29[1];
      if (v30)
      {
        v85 = *v29;
        v88 = v30;
      }
      else
      {
        v85 = 0;
        v88 = 0xE000000000000000;
      }
      v31 = *v84;
      v81 = *(_QWORD *)(*v84 + 16);
      if (v81)
        break;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_22_0();
      swift_bridgeObjectRetain();
LABEL_41:
      v60 = v73 + 1;
      OUTLINED_FUNCTION_23_0();
      OUTLINED_FUNCTION_23_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_23_0();
      sub_246EA3B34((uint64_t)v84, type metadata accessor for Siri_Nlg_DialogSwitch);
      v24 = v60;
      v61 = v60 == v69;
      v18 = v78;
      v15 = v65;
      v23 = v66;
      if (v61)
      {
        swift_bridgeObjectRelease();
LABEL_44:
        v62 = v68 + 1;
        sub_246EA3B34(v18, type metadata accessor for Siri_Nlg_CATFile);
        v17 = v62;
        if (v62 == v67)
        {
          swift_bridgeObjectRelease();
          return v93;
        }
        goto LABEL_3;
      }
    }
    OUTLINED_FUNCTION_15_0();
    v82 = v32;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_22_0();
    swift_bridgeObjectRetain();
    v33 = 0;
    v80 = v31;
    while (1)
    {
      if (v33 >= *(_QWORD *)(v31 + 16))
        goto LABEL_49;
      OUTLINED_FUNCTION_25_0();
      v92 = v34;
      v36 = (uint64_t)v94;
      sub_246EA3A6C(v82 + v35 * v34, (uint64_t)v94, type metadata accessor for Siri_Nlg_Dialog);
      type metadata accessor for NLGDialogBuilder();
      swift_initStackObject();
      NLGDialogBuilder.init()();
      v37 = (uint64_t *)(v36 + *(int *)(v83 + 24));
      if (v37[1])
      {
        v38 = *v37;
        v39 = v37[1];
      }
      else
      {
        v38 = 0;
        v39 = 0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_19();
      sub_246EB002C(v38, v39);
      swift_bridgeObjectRelease();
      *(_QWORD *)&v105 = v87;
      *((_QWORD *)&v105 + 1) = v90;
      v106 = v86;
      v107 = v89;
      v108 = v85;
      v109 = v88;
      v97 = sub_246EB04F4(&v105);
      swift_release();
      v40 = *v94;
      if (*(_QWORD *)(*v94 + 16))
        break;
      sub_246EB0558((uint64_t *)&v105);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        v54 = v93;
      }
      else
      {
        sub_246EB11E0(0, *(_QWORD *)(v93 + 16) + 1, 1, v93);
        v54 = v58;
      }
      v56 = *(_QWORD *)(v54 + 16);
      v55 = *(_QWORD *)(v54 + 24);
      if (v56 >= v55 >> 1)
      {
        sub_246EB11E0(v55 > 1, v56 + 1, 1, v54);
        v54 = v59;
      }
      v57 = v92 + 1;
      *(_QWORD *)(v54 + 16) = v56 + 1;
      v93 = v54;
      sub_246EA00C4(&v105, v54 + 40 * v56 + 32);
      swift_release();
      sub_246EA3B34((uint64_t)v94, type metadata accessor for Siri_Nlg_Dialog);
      v33 = v57;
      v31 = v80;
      if (v57 == v81)
        goto LABEL_41;
    }
    OUTLINED_FUNCTION_15_0();
    v100 = v41;
    OUTLINED_FUNCTION_19();
    v99 = v40;
    if (!*(_QWORD *)(v40 + 16))
    {
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
      JUMPOUT(0x246EA38F4);
    }
    OUTLINED_FUNCTION_25_0();
    sub_246EA3A6C(v100, (uint64_t)v4, type metadata accessor for Siri_Nlg_Content);
    v42 = *(_QWORD *)v4;
    v43 = *(_QWORD *)(*(_QWORD *)v4 + 16);
    if (!v43)
    {
      v45 = v16;
LABEL_32:
      *(_QWORD *)&v105 = v45;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765AF78);
      sub_246EA3AAC();
      sub_246EBE080();
      swift_bridgeObjectRelease();
      __asm { BR              X9 }
    }
    v103 = 0;
    *(_QWORD *)&v105 = v16;
    swift_bridgeObjectRetain();
    sub_246EB4FEC(0, v43, 0);
    v44 = 0;
    v45 = v105;
    v104 = *(_QWORD *)(v96 + 8);
    v46 = v104 + 32;
    while (1)
    {
      v47 = *(unsigned int *)(v42 + 4 * v44 + 32);
      if (*(_QWORD *)(v104 + 16) <= v47)
        break;
      v48 = v43;
      v49 = (uint64_t *)(v46 + 16 * v47);
      v50 = *v49;
      v16 = v49[1];
      *(_QWORD *)&v105 = v45;
      v52 = *(_QWORD *)(v45 + 16);
      v51 = *(_QWORD *)(v45 + 24);
      swift_bridgeObjectRetain();
      if (v52 >= v51 >> 1)
      {
        sub_246EB4FEC((char *)(v51 > 1), v52 + 1, 1);
        v45 = v105;
      }
      ++v44;
      *(_QWORD *)(v45 + 16) = v52 + 1;
      v53 = v45 + 16 * v52;
      *(_QWORD *)(v53 + 32) = v50;
      *(_QWORD *)(v53 + 40) = v16;
      v43 = v48;
      if (v48 == v44)
      {
        swift_bridgeObjectRelease();
        v4 = v95;
        goto LABEL_32;
      }
    }
    __break(1u);
  }
  return v16;
}

uint64_t sub_246EA3908()
{
  uint64_t v0;

  sub_246EA3B34(v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration30SerializedDialogSelectionModel_model, type metadata accessor for Siri_Nlg_Model);
  return swift_deallocClassInstance();
}

uint64_t sub_246EA3940()
{
  return type metadata accessor for SerializedDialogSelectionModel();
}

uint64_t type metadata accessor for SerializedDialogSelectionModel()
{
  uint64_t result;

  result = qword_25765AED0;
  if (!qword_25765AED0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246EA3980()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Siri_Nlg_Model(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_246EA39EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Siri_Nlg_Model(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_246EA3A30(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24956C6A0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_24_0();
}

void sub_246EA3A6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_24_0();
}

unint64_t sub_246EA3AAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25765AF80;
  if (!qword_25765AF80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25765AF78);
    result = MEMORY[0x24956C6A0](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25765AF80);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24956C694](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_246EA3B34(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_24_0();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_deallocPartialClassInstance();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v3, v2, v1);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;
  NSObject *v6;

  _os_log_impl(a1, v6, v5, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_246EBE35C();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_17_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_19_0()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_246EA3B34(v0, v1);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return type metadata accessor for Siri_Nlg_Model(0);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_bridgeObjectRelease();
}

void sub_246EA3CEC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;

  v7 = OUTLINED_FUNCTION_7_2();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a4;
  sub_246EBDFFC();
  sub_246EBE218();
  OUTLINED_FUNCTION_2_2();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a5 + 40), *(_QWORD *)(a5 + 64));
  sub_246EB9C1C(*(_QWORD *)(a5 + 16), *(_QWORD *)(a5 + 24), *(_QWORD **)(a5 + 32));
  sub_246EBE20C();
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  swift_release();
  OUTLINED_FUNCTION_0_2();
}

void sub_246EA3DC4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v10 = OUTLINED_FUNCTION_7_2();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  OUTLINED_FUNCTION_5_2();
  v13 = a4;
  OUTLINED_FUNCTION_6_2();
  sub_246EBE218();
  OUTLINED_FUNCTION_3_1();
  swift_retain();
  sub_246EA3F80(a5, a6);
  sub_246EBE20C();
  OUTLINED_FUNCTION_3_1();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v6, v10);
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_2();
}

void sub_246EA3E98(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v15 = OUTLINED_FUNCTION_7_2();
  v11 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v12);
  OUTLINED_FUNCTION_5_2();
  v13 = a4;
  OUTLINED_FUNCTION_6_2();
  sub_246EBE218();
  OUTLINED_FUNCTION_4_2();
  v14 = sub_246E9BEC8(a6);
  sub_246E9C0AC(v14, a7);
  swift_bridgeObjectRelease();
  sub_246EBE20C();
  OUTLINED_FUNCTION_4_2();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v7, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246EA3F80(uint64_t a1, _QWORD *a2)
{
  int64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_246EB5008(0, v3, 0);
    v5 = v14;
    v6 = (uint64_t *)(a1 + 40);
    do
    {
      v7 = *(v6 - 1);
      v8 = *v6;
      __swift_project_boxed_opaque_existential_1(a2 + 5, a2[8]);
      v9 = (_QWORD *)a2[4];
      swift_bridgeObjectRetain();
      v10 = sub_246EB9C1C(v7, v8, v9);
      swift_bridgeObjectRelease();
      v12 = *(_QWORD *)(v14 + 16);
      v11 = *(_QWORD *)(v14 + 24);
      if (v12 >= v11 >> 1)
        sub_246EB5008((char *)(v11 > 1), v12 + 1, 1);
      v6 += 2;
      *(_QWORD *)(v14 + 16) = v12 + 1;
      *(_QWORD *)(v14 + 8 * v12 + 32) = v10;
      --v3;
    }
    while (v3);
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4AF8];
  }
  return v5;
}

uint64_t sub_246EA40B8()
{
  uint64_t v0;

  v0 = sub_246EBE02C();
  __swift_allocate_value_buffer(v0, qword_25765E558);
  __swift_project_value_buffer(v0, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_1_1();
  return sub_246EBE020();
}

uint64_t sub_246EA4114()
{
  uint64_t result;

  sub_246EA4158();
  OUTLINED_FUNCTION_1_1();
  result = sub_246EBE224();
  qword_25765E570 = result;
  return result;
}

unint64_t sub_246EA4158()
{
  unint64_t result;

  result = qword_25765AF88;
  if (!qword_25765AF88)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25765AF88);
  }
  return result;
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

unint64_t OUTLINED_FUNCTION_1_1()
{
  return 0xD000000000000012;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_246EBDFF0();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_246EBDFF0();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_246EBDFF0();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_246EBDFFC();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return sub_246EBE008();
}

uint64_t sub_246EA428C@<X0>(uint64_t a1@<X8>)
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
  char *v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B260);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_246EBDD8C();
  v7 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x24BDAC7A8](v6, v8);
  v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v9, v12);
  v15 = (char *)v40 - v14;
  v17 = MEMORY[0x24BDAC7A8](v13, v16);
  v19 = (char *)v40 - v18;
  MEMORY[0x24BDAC7A8](v17, v20);
  v22 = (char *)v40 - v21;
  sub_246EBDE28();
  if (sub_246EBDE1C())
  {
    sub_246EBDE10();
    swift_release();
    sub_246EBDE34();
    swift_release();
    OUTLINED_FUNCTION_20_1((uint64_t)v5, 0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) != 1)
    {
      v23 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
      v23(v22, v5, v6);
      if (qword_25765A820 != -1)
        swift_once();
      v24 = sub_246EBE02C();
      __swift_project_value_buffer(v24, (uint64_t)qword_25765E558);
      OUTLINED_FUNCTION_19_1((uint64_t)v19, (uint64_t)v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
      v25 = sub_246EBE014();
      v26 = sub_246EBE1F4();
      if (os_log_type_enabled(v25, v26))
      {
        v42 = a1;
        v27 = OUTLINED_FUNCTION_4();
        v40[1] = v23;
        v28 = (uint8_t *)v27;
        v43 = OUTLINED_FUNCTION_4();
        v41 = v7;
        *(_DWORD *)v28 = 136315138;
        sub_246EA5F84();
        v29 = sub_246EBE35C();
        v31 = OUTLINED_FUNCTION_12_1(v29, v30);
        OUTLINED_FUNCTION_11_0(v31);
        sub_246EBE248();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_17_1(*(uint64_t (**)(uint64_t, uint64_t))(v41 + 8));
        OUTLINED_FUNCTION_9_1();
        OUTLINED_FUNCTION_2();
      }
      OUTLINED_FUNCTION_17_1(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));

      return ((uint64_t (*)(uint64_t, char *, uint64_t))v23)(a1, v22, v6);
    }
  }
  else
  {
    OUTLINED_FUNCTION_20_1((uint64_t)v5, 1);
  }
  sub_246EA2924((uint64_t)v5, &qword_25765B260);
  sub_246EBDD5C();
  if (qword_25765A820 != -1)
    swift_once();
  v32 = sub_246EBE02C();
  __swift_project_value_buffer(v32, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_19_1((uint64_t)v11, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  v33 = sub_246EBE014();
  v34 = sub_246EBE200();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)OUTLINED_FUNCTION_4();
    v43 = OUTLINED_FUNCTION_4();
    v41 = v7;
    v42 = a1;
    *(_DWORD *)v35 = 136315138;
    sub_246EA5F84();
    v36 = sub_246EBE35C();
    v38 = OUTLINED_FUNCTION_12_1(v36, v37);
    OUTLINED_FUNCTION_11_0(v38);
    sub_246EBE248();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_3();
    OUTLINED_FUNCTION_9_1();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_7_3();

  return OUTLINED_FUNCTION_19_1(a1, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
}

uint64_t *sub_246EA46C0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjCClassFromMetadata;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;

  v12 = *v11;
  v14 = *a1;
  v13 = a1[1];
  v16 = a1[2];
  v15 = a1[3];
  v11[2] = *a1;
  v11[3] = v13;
  v11[4] = v16;
  v11[5] = v15;
  v11[6] = a2;
  v11[7] = a3;
  v11[8] = a4;
  v11[9] = a5;
  v11[10] = a6;
  v11[11] = a7;
  v11[12] = a8;
  v11[13] = a9;
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v18 = (void *)objc_opt_self();
  OUTLINED_FUNCTION_19();
  swift_bridgeObjectRetain();
  v19 = objc_msgSend(v18, sel_bundleForClass_, ObjCClassFromMetadata);
  v20 = (_QWORD *)OUTLINED_FUNCTION_4_3();
  if (a10)
  {
    v20[2] = a10;
    v20[3] = a11;

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16();
    v21 = sub_246EA5E88;
  }
  else
  {
    v20[2] = v19;
    v20[3] = v14;
    v20[4] = v13;
    v20[5] = v16;
    v21 = sub_246EA5E4C;
    v20[6] = v15;
    v20[7] = v12;
  }
  v22 = OUTLINED_FUNCTION_4_3();
  *(_QWORD *)(v22 + 16) = v21;
  *(_QWORD *)(v22 + 24) = v20;
  v11[14] = (uint64_t)sub_246EA5E80;
  v11[15] = v22;
  return v11;
}

id sub_246EA47F0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  id result;
  uint64_t v13[4];

  v10 = *a1;
  v11 = *a2;
  v13[0] = a4;
  v13[1] = a5;
  v13[2] = a6;
  v13[3] = a7;
  result = sub_246EA4840(a3, v13, v10, v11);
  *a8 = result;
  return result;
}

id sub_246EA4840(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
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
  char *v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;

  v48 = a3;
  v49 = a4;
  v46 = sub_246EBDC48();
  v6 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46, v7);
  v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B250);
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v12, v15);
  v18 = (char *)&v46 - v17;
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)&v46 - v21;
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v46 - v24;
  v26 = a2[1];
  v47 = *a2;
  v27 = a2[2];
  v50 = a1;
  v51 = v27;
  v28 = objc_msgSend(a1, sel_resourceURL);
  if (v28)
  {
    v29 = v28;
    sub_246EBDC6C();

    v30 = sub_246EBDC9C();
    v31 = (uint64_t)v18;
    v32 = 0;
  }
  else
  {
    v30 = sub_246EBDC9C();
    v31 = (uint64_t)v18;
    v32 = 1;
  }
  __swift_storeEnumTagSinglePayload(v31, v32, 1, v30);
  sub_246EA5EB8((uint64_t)v18, (uint64_t)v22);
  sub_246EBDC9C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v30) == 1)
  {
    sub_246EA2924((uint64_t)v22, &qword_25765B250);
    v33 = 1;
  }
  else
  {
    v52 = 0x6574616C706D6554;
    v53 = 0xE900000000000073;
    v34 = v46;
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BDCD7A0], v46);
    sub_246EA5F48();
    sub_246EBDC90();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v34);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v22, v30);
    v33 = 0;
  }
  v35 = v50;
  v36 = v48;
  __swift_storeEnumTagSinglePayload((uint64_t)v25, v33, 1, v30);
  sub_246EA5F00((uint64_t)v25, (uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v30) == 1)
  {
    v37 = 0;
  }
  else
  {
    v37 = (void *)sub_246EBDC54();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v14, v30);
  }
  v38 = v47;
  v39 = (void *)objc_opt_self();
  v52 = v38;
  v53 = v26;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_246EBE11C();
  swift_bridgeObjectRetain();
  sub_246EBE11C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v40 = (void *)sub_246EBE098();
  swift_bridgeObjectRelease();
  sub_246EB2B6C(v36);
  v41 = (void *)sub_246EBE038();
  swift_bridgeObjectRelease();
  v42 = (void *)sub_246EBE038();
  LODWORD(v45) = 0;
  v43 = objc_msgSend(v39, sel_execute_templateDir_catId_parameters_globals_callback_options_, v35, v37, v40, v41, v42, 0, v45);

  sub_246EA2924((uint64_t)v25, &qword_25765B250);
  return v43;
}

uint64_t sub_246EA4C30(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, uint64_t *, uint64_t *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a2;
  v6 = a1;
  a3(&v4, &v6, &v5);
  return v4;
}

uint64_t sub_246EA4C6C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t inited;
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B238);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246EBEC00;
  v4 = v1[6];
  v5 = v1[7];
  *(_QWORD *)(inited + 32) = v4;
  *(_QWORD *)(inited + 40) = v5;
  v6 = v1[9];
  *(_QWORD *)(inited + 48) = v1[8];
  *(_QWORD *)(inited + 56) = v6;
  v7 = v1[10];
  v8 = v1[11];
  *(_QWORD *)(inited + 64) = v7;
  *(_QWORD *)(inited + 72) = v8;
  v9 = v1[13];
  *(_QWORD *)(inited + 80) = v1[12];
  *(_QWORD *)(inited + 88) = v9;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_12();
  swift_bridgeObjectRetain();
  v10 = sub_246EBE05C();
  OUTLINED_FUNCTION_10_0();
  v11 = sub_246EAFE38(v4, v5, v10);
  v13 = v12;
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_12();
  v14 = sub_246EAFE38(v7, v8, v10);
  v16 = v15;
  OUTLINED_FUNCTION_6_0();
  if (!v13)
  {
    if (!v16)
      goto LABEL_13;
LABEL_10:
    OUTLINED_FUNCTION_2_3();
    goto LABEL_11;
  }
  if (!v16)
    goto LABEL_10;
  if (v11 != v14 || v13 != v16)
  {
    v18 = sub_246EBE368();
    OUTLINED_FUNCTION_21_1();
    OUTLINED_FUNCTION_2_3();
    if ((v18 & 1) != 0)
      goto LABEL_13;
LABEL_11:
    sub_246EB2F00(v10);
    v20 = v19;
    swift_bridgeObjectRelease();
    sub_246EA4F9C(v20, a1);
    return swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_2_3();
LABEL_13:
  if (qword_25765A820 != -1)
    swift_once();
  v22 = sub_246EBE02C();
  __swift_project_value_buffer(v22, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_19();
  v23 = sub_246EBE014();
  v24 = sub_246EBE200();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    *(_DWORD *)v25 = 136315138;
    OUTLINED_FUNCTION_19();
    v26 = sub_246EBE050();
    v28 = v27;
    swift_bridgeObjectRelease();
    sub_246EBBD70(v26, v28, &v30);
    sub_246EBE248();
    OUTLINED_FUNCTION_20();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246E99000, v23, v24, "Unable to generate unambiguous dialog using %s", v25, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_20();
  sub_246EA5DDC();
  OUTLINED_FUNCTION_0_0();
  *(_QWORD *)v29 = 0xD000000000000016;
  *(_QWORD *)(v29 + 8) = 0x8000000246EC0A00;
  *(_BYTE *)(v29 + 16) = 0;
  return swift_willThrow();
}

void sub_246EA4F9C(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B238);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246EBEC10;
  *(_QWORD *)(inited + 32) = 0x656C61636F6CLL;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 48) = sub_246EBDD14();
  *(_QWORD *)(inited + 56) = v6;
  v7 = sub_246EBE05C();
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 112);
  sub_246EB2F00(v7);
  v10 = v9;
  OUTLINED_FUNCTION_6_0();
  v11 = (void *)v8(a1, v10);
  OUTLINED_FUNCTION_21_1();
  type metadata accessor for NLGDialogBuilder();
  swift_initStackObject();
  v12 = objc_msgSend(v11, sel_dialog, NLGDialogBuilder.init()());
  sub_246EA5DA0();
  v13 = sub_246EBE1A0();

  if (!(v13 >> 62))
  {
    if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_8:
    OUTLINED_FUNCTION_6_0();
    sub_246EA5DDC();
    OUTLINED_FUNCTION_0_0();
    *(_QWORD *)v19 = 0xD000000000000019;
    *(_QWORD *)(v19 + 8) = 0x8000000246EC09E0;
    *(_BYTE *)(v19 + 16) = 1;
    swift_willThrow();
    swift_release();
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_12();
  v18 = sub_246EBE2E4();
  OUTLINED_FUNCTION_6_0();
  if (!v18)
    goto LABEL_8;
LABEL_3:
  if ((v13 & 0xC000000000000001) != 0)
  {
    v14 = (id)MEMORY[0x24956C214](0, v13);
    goto LABEL_6;
  }
  if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v14 = *(id *)(v13 + 32);
LABEL_6:
    v15 = v14;
    OUTLINED_FUNCTION_6_0();
    v16 = objc_msgSend(v15, sel_id);
    sub_246EBE0A4();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_10_0();
    sub_246EB002C(v10, (uint64_t)v8);
    swift_retain();
    OUTLINED_FUNCTION_2_3();
    v17 = objc_msgSend(v15, sel_fullPrint);
    sub_246EBE0A4();
    OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_10_0();
    sub_246EB0038(v10, (uint64_t)v8);
    OUTLINED_FUNCTION_2_3();
    sub_246EB0558(a2);

    swift_release_n();
LABEL_9:

    return;
  }
  __break(1u);
}

uint64_t sub_246EA5224()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16();
  swift_release();
  return v0;
}

uint64_t sub_246EA5278()
{
  sub_246EA5224();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AlternativeQuestionGenerator()
{
  return objc_opt_self();
}

_QWORD *sub_246EA52BC(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
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
  uint64_t v28[3];
  uint64_t v29;
  uint64_t v30;

  v5 = v4;
  v10 = a1[3];
  v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v11 + 16))(v28, v10, v11);
  v12 = v29;
  v13 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v12, v13);
  v16 = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  v17 = a2[3];
  v18 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v17);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v18 + 16))(v28, v17, v18);
  v19 = v29;
  v20 = v30;
  __swift_project_boxed_opaque_existential_1(v28, v29);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
  v23 = v22;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  v5[2] = a3;
  v5[3] = a4;
  OUTLINED_FUNCTION_1_2();
  v28[0] = v24;
  v28[1] = v25;
  v28[2] = 0xD000000000000021;
  v29 = 0x8000000246EC0AB0;
  type metadata accessor for AlternativeQuestionGenerator();
  v26 = OUTLINED_FUNCTION_4_3();
  sub_246EA46C0(v28, 0x7265567473726966, 0xEF65736172685062, v14, v16, 0xD000000000000010, 0x8000000246EC0A90, v21, v23, 0, 0);
  sub_246EA5FC4((uint64_t)a2);
  sub_246EA5FC4((uint64_t)a1);
  v5[4] = v26;
  return v5;
}

uint64_t sub_246EA5470@<X0>(uint64_t *a1@<X8>)
{
  return sub_246EA5634(a1);
}

uint64_t sub_246EA5484()
{
  sub_246EA56E4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for VerbPhraseQuestionGenerator()
{
  return objc_opt_self();
}

uint64_t sub_246EA54C4@<X0>(uint64_t *a1@<X8>)
{
  return sub_246EA5470(a1);
}

_QWORD *sub_246EA54E4(_BYTE *a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16[4];

  v5 = v4;
  if (*a1)
  {
    if (*a1 == 1)
    {
      v6 = 0xE400000000000000;
      v7 = 1701670760;
    }
    else
    {
      v6 = 0xE500000000000000;
      v7 = 0x656E6F6870;
    }
  }
  else
  {
    v6 = 0xE300000000000000;
    v7 = 7496035;
  }
  v8 = 0xE400000000000000;
  v9 = 1701670760;
  if (*a2 != 1)
  {
    v9 = 0x656E6F6870;
    v8 = 0xE500000000000000;
  }
  if (*a2)
    v10 = v9;
  else
    v10 = 7496035;
  if (*a2)
    v11 = v8;
  else
    v11 = 0xE300000000000000;
  v5[2] = a3;
  v5[3] = a4;
  OUTLINED_FUNCTION_1_2();
  v16[0] = v12;
  v16[1] = v13;
  v16[2] = 0xD00000000000002BLL;
  v16[3] = 0x8000000246EC0A60;
  type metadata accessor for AlternativeQuestionGenerator();
  v14 = OUTLINED_FUNCTION_4_3();
  sub_246EA46C0(v16, 0xD000000000000019, 0x8000000246EC0A20, v7, v6, 0xD00000000000001ALL, 0x8000000246EC0A40, v10, v11, 0, 0);
  v5[4] = v14;
  return v5;
}

uint64_t sub_246EA5634@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v3 = sub_246EBDD8C();
  v4 = *(_QWORD *)(v3 - 8);
  v6 = MEMORY[0x24BDAC7A8](v3, v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t))(v1 + 16))(v6);
  sub_246EA4C6C(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v8, v3);
}

uint64_t sub_246EA56E4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t type metadata accessor for ExecutionDestinationQuestionGenerator()
{
  return objc_opt_self();
}

uint64_t sub_246EA5728()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_246EA5730()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_246EA57A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) > 0x18)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_246EA5868(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_QWORD *sub_246EA58AC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  return a1;
}

_QWORD *sub_246EA591C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_246EA5994(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_246EA59E4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_246EA5A4C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  int v12;
  unsigned int v14;
  int v15;
  unint64_t v16;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  v9 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_22;
  v10 = ((v8 + 16) & ~v8) + *(_QWORD *)(v5 + 64);
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      v12 = *(_DWORD *)(a1 + v10);
      if (!v12)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_22:
      if ((v6 & 0x80000000) != 0)
        return __swift_getEnumTagSinglePayload((a1 + v8 + 16) & ~v8, v6, v4);
      v16 = *(_QWORD *)(a1 + 8);
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_22;
LABEL_15:
  v15 = (v12 - 1) << v11;
  if (v10 > 3)
    v15 = 0;
  if (!(_DWORD)v10)
    return v7 + v15 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_246EA5B20 + 4 * byte_246EBEC20[(v10 - 1)]))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_246EA5B98(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  char v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v11 = ((a3 - v6 + ~(-1 << v8)) >> v8) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0;
  }
  if (v6 < a2)
  {
    v10 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v12 = v10 & ~(-1 << v8);
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for CATParameter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CATParameter);
}

unint64_t sub_246EA5DA0()
{
  unint64_t result;

  result = qword_25765B240;
  if (!qword_25765B240)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25765B240);
  }
  return result;
}

unint64_t sub_246EA5DDC()
{
  unint64_t result;

  result = qword_25765B248;
  if (!qword_25765B248)
  {
    result = MEMORY[0x24956C6A0](&protocol conformance descriptor for NLGDialogGeneratorError, &type metadata for NLGDialogGeneratorError);
    atomic_store(result, (unint64_t *)&qword_25765B248);
  }
  return result;
}

uint64_t sub_246EA5E18()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_246EA5E4C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_246EA47F0(a1, a2, *(void **)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), a3);
}

uint64_t sub_246EA5E5C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_246EA5E80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_246EA4C30(a1, a2, *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v2 + 16));
}

uint64_t sub_246EA5E88@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 16))(*a1, *a2);
  *a3 = result;
  return result;
}

uint64_t sub_246EA5EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EA5F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B250);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_246EA5F48()
{
  unint64_t result;

  result = qword_25765B258;
  if (!qword_25765B258)
  {
    result = MEMORY[0x24956C6A0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25765B258);
  }
  return result;
}

unint64_t sub_246EA5F84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25765B268;
  if (!qword_25765B268)
  {
    v1 = sub_246EBDD8C();
    result = MEMORY[0x24956C6A0](MEMORY[0x24BDCEEF0], v1);
    atomic_store(result, (unint64_t *)&qword_25765B268);
  }
  return result;
}

uint64_t sub_246EA5FC4(uint64_t a1)
{
  destroy for NLGVerbPhrase();
  return a1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24956C64C](a1, v6, a5);
}

uint64_t sub_246EA602C@<X0>(uint64_t *a1@<X8>)
{
  return sub_246EA54C4(a1);
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_246EBBD70(a1, a2, (uint64_t *)(v2 - 88));
}

void OUTLINED_FUNCTION_16_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_17_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_19_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_20_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return swift_bridgeObjectRelease();
}

unint64_t sub_246EA60F0(uint64_t a1, unint64_t a2)
{
  unsigned __int8 *v2;
  unint64_t v3;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  char v43;
  uint64_t *v44;
  _BYTE v46[16];
  _QWORD *v47;
  _QWORD v48[4];

  v3 = (unint64_t)v2;
  v48[0] = 46;
  v47 = v48;
  swift_bridgeObjectRetain_n();
  v6 = (_QWORD *)sub_246EAE7D0(0x7FFFFFFFFFFFFFFFLL, 1u, sub_246EA7448, (uint64_t)v46, a1, a2);
  swift_bridgeObjectRelease();
  if (v6[2] != 3 || !((v6[5] ^ v6[4]) >> 14))
    goto LABEL_22;
  v7 = OUTLINED_FUNCTION_3_2();
  v12 = sub_246EA6F30(v7, v8, v9, v10, v11);
  if ((v13 & 0x100) != 0)
  {
    swift_bridgeObjectRetain();
    v14 = OUTLINED_FUNCTION_3_2();
    v3 = (unint64_t)sub_246EA6704(v14, v15, v16, v17, v18);
    v20 = v19;
    swift_bridgeObjectRelease();
    if ((v20 & 1) != 0)
      goto LABEL_22;
  }
  else
  {
    if ((v13 & 1) != 0)
      goto LABEL_22;
    v3 = v12;
  }
  if (v6[2] < 2uLL)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (!((v6[9] ^ v6[8]) >> 14))
  {
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_23:
    sub_246EA7464();
    swift_allocError();
    *v44 = a1;
    v44[1] = a2;
    swift_willThrow();
    return v3;
  }
  v21 = OUTLINED_FUNCTION_2_4();
  v26 = sub_246EA6F30(v21, v22, v23, v24, v25);
  v48[3] = v2;
  if ((v27 & 0x100) == 0)
  {
    if ((v27 & 1) == 0)
    {
      v28 = v26;
      goto LABEL_13;
    }
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  v29 = OUTLINED_FUNCTION_2_4();
  v28 = (unint64_t)sub_246EA6704(v29, v30, v31, v32, v33);
  v35 = v34;
  swift_bridgeObjectRelease();
  if ((v35 & 1) != 0)
    goto LABEL_22;
LABEL_13:
  if (v6[2] < 3uLL)
  {
LABEL_26:
    __break(1u);
    goto LABEL_22;
  }
  v36 = v6[12];
  v37 = v6[13];
  v39 = v6[14];
  v38 = v6[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!((v37 ^ v36) >> 14))
    goto LABEL_22;
  v40 = sub_246EA6F30(v36, v37, v39, v38, 10);
  if ((v41 & 0x100) != 0)
    v40 = (uint64_t)sub_246EA6704(v36, v37, v39, v38, 10);
  v42 = v40;
  v43 = v41;
  swift_bridgeObjectRelease();
  if ((v43 & 1) != 0 || (v3 & 0x8000000000000000) != 0 || (v28 & 0x8000000000000000) != 0 || v42 < 0)
    goto LABEL_23;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_246EA6344()
{
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_3();
  sub_246EBE11C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_0_3();
  sub_246EBE11C();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_246EA63DC()
{
  return sub_246EA6344();
}

uint64_t sub_246EA63E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v6;
  BOOL v7;

  if (a1 < a4)
    return OUTLINED_FUNCTION_5_3();
  if (a1 == a4 && (a2 < a5 || (a2 == a5 ? (v7 = __OFSUB__(a3, a6), v6 = a3 - a6 < 0) : (v7 = 0, v6 = 0), v6 ^ v7)))
    return OUTLINED_FUNCTION_5_3();
  else
    return OUTLINED_FUNCTION_6_3();
}

BOOL sub_246EA640C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return a1 == a4 && a2 == a5 && a3 == a6;
}

uint64_t sub_246EA6420(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_246EA64D0(a1, a2, a3, a4, sub_246EA63E8);
}

uint64_t sub_246EA642C(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_246EA64D0(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_246EA6438);
}

BOOL sub_246EA6438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _BOOL8 result;

  result = 0;
  if (a4 >= a1)
  {
    if (a4 != a1)
      return 1;
    if (a5 >= a2 && (a5 != a2 || a6 >= a3))
      return 1;
  }
  return result;
}

uint64_t sub_246EA6464(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_246EA64D0(a1, a2, a3, a4, sub_246EA6470);
}

uint64_t sub_246EA6470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v6;
  BOOL v7;

  if (a1 < a4)
    return OUTLINED_FUNCTION_6_3();
  if (a1 == a4 && (a2 < a5 || (a2 == a5 ? (v7 = __OFSUB__(a3, a6), v6 = a3 - a6 < 0) : (v7 = 0, v6 = 0), v6 ^ v7)))
    return OUTLINED_FUNCTION_6_3();
  else
    return OUTLINED_FUNCTION_5_3();
}

uint64_t sub_246EA6494(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_246EA64D0(a1, a2, a3, a4, sub_246EA64A0);
}

uint64_t sub_246EA64A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v6;
  BOOL v7;

  if (a4 < a1)
    return OUTLINED_FUNCTION_5_3();
  if (a4 == a1 && (a5 < a2 || (a5 == a2 ? (v7 = __OFSUB__(a6, a3), v6 = a6 - a3 < 0) : (v7 = 0, v6 = 0), v6 ^ v7)))
    return OUTLINED_FUNCTION_5_3();
  else
    return OUTLINED_FUNCTION_6_3();
}

uint64_t sub_246EA64C4(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_246EA64D0(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_246EA640C);
}

uint64_t sub_246EA64D0(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(*a1, a1[1], a1[2], *a2, a2[1], a2[2]);
}

unint64_t sub_246EA64F0(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD v8[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_7_4();
  sub_246EBE3F8();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v8, v8[3]);
    OUTLINED_FUNCTION_7_4();
    v4 = sub_246EBE374();
    v6 = v5;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    v1 = sub_246EA60F0(v4, v6);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

unint64_t sub_246EA65CC@<X0>(_QWORD *a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;
  unint64_t v5;
  unint64_t v6;

  result = sub_246EA64F0(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

unint64_t sub_246EA65FC()
{
  unint64_t result;

  result = qword_25765B270;
  if (!qword_25765B270)
  {
    result = MEMORY[0x24956C6A0]("yȗ\nHA", &type metadata for SemanticVersion);
    atomic_store(result, (unint64_t *)&qword_25765B270);
  }
  return result;
}

_QWORD *sub_246EA6648(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B288);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_246EA66AC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v6 = sub_246EBE164();
    OUTLINED_FUNCTION_1_3(v6);
    return v7 | 4;
  }
  else
  {
    v3 = MEMORY[0x24956C0AC](15, a1 >> 16);
    OUTLINED_FUNCTION_1_3(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_246EA6704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_246EA74A0();
  swift_bridgeObjectRetain();
  v7 = sub_246EBE17C();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_246EA6A70();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_246EBE2B4();
  }
LABEL_7:
  v13 = sub_246EA67F4(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_246EA67F4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_246EA6A70()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_246EA6ACC();
  v4 = sub_246EA6B00(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_246EA6ACC()
{
  return sub_246EBE188();
}

uint64_t sub_246EA6B00(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_246EA6C44(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_246EA6648(v9, 0);
      v12 = sub_246EA6D30((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x24956C064](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x24956C064);
LABEL_9:
      sub_246EBE2B4();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x24956C064]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_246EA6C44(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_246EA66AC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_246EA66AC(a2, a3, a4);
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
    return sub_246EBE14C();
  }
  __break(1u);
  return result;
}

unint64_t sub_246EA6D30(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_246EA66AC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_246EBE158();
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
          result = sub_246EBE2B4();
        v19 = *(_BYTE *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      result = sub_246EA66AC(v12, a6, a7);
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
    v12 = sub_246EBE134();
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

uint64_t sub_246EA6F30(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t result;
  char v14;
  _QWORD v15[2];
  char v16;

  if ((a4 & 0x1000000000000000) != 0)
  {
    result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v12 = HIBYTE(a4) & 0xF;
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v15;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v12 = a3 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v11 = (_QWORD *)sub_246EBE2B4();
  }
  result = sub_246EA7008((uint64_t)v11, v12, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v16 = v14 & 1;
LABEL_8:
    LOBYTE(v15[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

uint64_t sub_246EA7008(uint64_t result, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  int v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  uint64_t v30;
  unsigned __int8 *v31;
  uint64_t v32;
  unsigned int v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  unsigned __int8 *v40;
  uint64_t v41;
  unsigned int v42;
  char v43;
  uint64_t v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  uint64_t v48;
  unsigned int v49;
  char v50;
  uint64_t v51;

  v11 = a3;
  v12 = result;
  v13 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0)
    LOBYTE(v13) = 1;
  v14 = 4 << v13;
  v15 = a3 & 0xC;
  v16 = a3;
  if (v15 == 4 << v13)
  {
    result = sub_246EA66AC(a3, a5, a6);
    v16 = result;
  }
  v17 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x1000000000000000) != 0)
  {
    v19 = a5 & 0xFFFFFFFFFFFFLL;
    if ((a6 & 0x2000000000000000) != 0)
      v19 = HIBYTE(a6) & 0xF;
    if (v19 < v16 >> 16)
      goto LABEL_96;
    result = sub_246EBE14C();
    v18 = result;
    v17 = HIBYTE(a6) & 0xF;
  }
  else
  {
    v18 = v16 >> 16;
  }
  if (v15 == v14)
  {
    v20 = v17;
    result = sub_246EA66AC(v11, a5, a6);
    v17 = v20;
    v11 = result;
  }
  if ((a4 & 0xC) == v14)
  {
    v21 = a4;
    v22 = v17;
    result = sub_246EA66AC(v21, a5, a6);
    v17 = v22;
    a4 = result;
    if ((a6 & 0x1000000000000000) == 0)
      goto LABEL_11;
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
LABEL_11:
    result = (a4 >> 16) - (v11 >> 16);
    goto LABEL_22;
  }
  v23 = a5 & 0xFFFFFFFFFFFFLL;
  if ((a6 & 0x2000000000000000) != 0)
    v23 = v17;
  if (v23 < v11 >> 16)
    goto LABEL_92;
  if (v23 < a4 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  result = sub_246EBE14C();
LABEL_22:
  v24 = v18 + result;
  if (__OFADD__(v18, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v24 < v18)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v25 = (unsigned __int8 *)(v12 + v18);
  if (!v12)
    v25 = 0;
  v26 = *v25;
  if (v26 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v37 = a7 + 48;
        v38 = a7 + 55;
        v39 = a7 + 87;
        if (a7 > 10)
        {
          v37 = 58;
        }
        else
        {
          v39 = 97;
          v38 = 65;
        }
        if (v25)
        {
          v30 = 0;
          v40 = v25 + 1;
          v41 = result - 1;
          do
          {
            v42 = *v40;
            if (v42 < 0x30 || v42 >= v37)
            {
              if (v42 < 0x41 || v42 >= v38)
              {
                v35 = 0;
                if (v42 < 0x61 || v42 >= v39)
                  return v35;
                v43 = -87;
              }
              else
              {
                v43 = -55;
              }
            }
            else
            {
              v43 = -48;
            }
            v44 = v30 * a7;
            if ((unsigned __int128)(v30 * (__int128)a7) >> 64 != (v30 * a7) >> 63)
              return 0;
            v30 = v44 + (v42 + v43);
            if (__OFADD__(v44, (v42 + v43)))
              return 0;
            ++v40;
            --v41;
          }
          while (v41);
          return v30;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v26 != 45)
  {
    if (v24 != v18)
    {
      v45 = a7 + 48;
      v46 = a7 + 55;
      v47 = a7 + 87;
      if (a7 > 10)
      {
        v45 = 58;
      }
      else
      {
        v47 = 97;
        v46 = 65;
      }
      if (v25)
      {
        v48 = 0;
        do
        {
          v49 = *v25;
          if (v49 < 0x30 || v49 >= v45)
          {
            if (v49 < 0x41 || v49 >= v46)
            {
              v35 = 0;
              if (v49 < 0x61 || v49 >= v47)
                return v35;
              v50 = -87;
            }
            else
            {
              v50 = -55;
            }
          }
          else
          {
            v50 = -48;
          }
          v51 = v48 * a7;
          if ((unsigned __int128)(v48 * (__int128)a7) >> 64 != (v48 * a7) >> 63)
            return 0;
          v48 = v51 + (v49 + v50);
          if (__OFADD__(v51, (v49 + v50)))
            return 0;
          ++v25;
          --result;
        }
        while (result);
        return v51 + (v49 + v50);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v27 = a7 + 48;
      v28 = a7 + 55;
      v29 = a7 + 87;
      if (a7 > 10)
      {
        v27 = 58;
      }
      else
      {
        v29 = 97;
        v28 = 65;
      }
      if (v25)
      {
        v30 = 0;
        v31 = v25 + 1;
        v32 = result - 1;
        while (1)
        {
          v33 = *v31;
          if (v33 < 0x30 || v33 >= v27)
          {
            if (v33 < 0x41 || v33 >= v28)
            {
              v35 = 0;
              if (v33 < 0x61 || v33 >= v29)
                return v35;
              v34 = -87;
            }
            else
            {
              v34 = -55;
            }
          }
          else
          {
            v34 = -48;
          }
          v36 = v30 * a7;
          if ((unsigned __int128)(v30 * (__int128)a7) >> 64 != (v30 * a7) >> 63)
            return 0;
          v30 = v36 - (v33 + v34);
          if (__OFSUB__(v36, (v33 + v34)))
            return 0;
          ++v31;
          if (!--v32)
            return v30;
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

uint64_t sub_246EA7448(uint64_t *a1)
{
  uint64_t v1;

  return sub_246EAECAC(a1, *(uint64_t **)(v1 + 16)) & 1;
}

unint64_t sub_246EA7464()
{
  unint64_t result;

  result = qword_25765B278;
  if (!qword_25765B278)
  {
    result = MEMORY[0x24956C6A0](&unk_246EBEE20, &type metadata for SemanticVersionError);
    atomic_store(result, (unint64_t *)&qword_25765B278);
  }
  return result;
}

unint64_t sub_246EA74A0()
{
  unint64_t result;

  result = qword_25765B280;
  if (!qword_25765B280)
  {
    result = MEMORY[0x24956C6A0](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_25765B280);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SemanticVersionError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SemanticVersionError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SemanticVersionError(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for SemanticVersionError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SemanticVersionError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for SemanticVersionError(uint64_t result, int a2, int a3)
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

uint64_t OUTLINED_FUNCTION_6_3()
{
  return 0;
}

ValueMetadata *type metadata accessor for SemanticVersionError()
{
  return &type metadata for SemanticVersionError;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SemanticVersion(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SemanticVersion(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SemanticVersion()
{
  return &type metadata for SemanticVersion;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_246EBE35C();
}

unint64_t OUTLINED_FUNCTION_1_3(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return sub_246EBE11C();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  uint64_t v0;

  return v0;
}

uint64_t static NLGUtteranceProvider.currentUtterance.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  void *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;

  sub_246EBDE28();
  if (!sub_246EBDE1C())
  {
    if (qword_25765A820 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_24();
    v8 = OUTLINED_FUNCTION_2_5(v7, (uint64_t)qword_25765E558);
    v9 = sub_246EBE200();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_1_4();
      *(_WORD *)v10 = 0;
      OUTLINED_FUNCTION_4_5(&dword_246E99000, v8, v9, "No current request", v10);
      OUTLINED_FUNCTION_2();
    }

    return 0;
  }
  sub_246EBDE04();
  swift_release();
  v0 = sub_246EBDE58();
  if (!v1)
  {
    v11 = (void *)sub_246EBDE4C();
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, sel_recognition);
      if (v13)
      {
        v14 = v13;
        v15 = sub_246EA7A8C(v13);
        if (v16)
        {
          v2 = v15;
          if (qword_25765A820 != -1)
            swift_once();
          v17 = OUTLINED_FUNCTION_24();
          v18 = OUTLINED_FUNCTION_2_5(v17, (uint64_t)qword_25765E558);
          v19 = sub_246EBE1F4();
          if (os_log_type_enabled(v18, v19))
          {
            v20 = (uint8_t *)OUTLINED_FUNCTION_1_4();
            *(_WORD *)v20 = 0;
            OUTLINED_FUNCTION_4_5(&dword_246E99000, v18, v19, "Returning speech transcript from current request", v20);
            OUTLINED_FUNCTION_2();
          }

          goto LABEL_8;
        }

      }
      if (qword_25765A820 != -1)
        swift_once();
      v26 = OUTLINED_FUNCTION_24();
      v27 = (void *)OUTLINED_FUNCTION_2_5(v26, (uint64_t)qword_25765E558);
      v28 = sub_246EBE200();
      if (OUTLINED_FUNCTION_6_4(v28))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_4() = 0;
        OUTLINED_FUNCTION_3_3(&dword_246E99000, v29, v30, "No speech recognition transcript");
        OUTLINED_FUNCTION_2();
      }

    }
    else
    {
      if (qword_25765A820 != -1)
        swift_once();
      v21 = OUTLINED_FUNCTION_24();
      v22 = (void *)OUTLINED_FUNCTION_2_5(v21, (uint64_t)qword_25765E558);
      v23 = sub_246EBE200();
      if (OUTLINED_FUNCTION_6_4(v23))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_4() = 0;
        OUTLINED_FUNCTION_3_3(&dword_246E99000, v24, v25, "No speech package");
        OUTLINED_FUNCTION_2();
      }

    }
    swift_release();
    return 0;
  }
  v2 = v0;
  if (qword_25765A820 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_24();
  v4 = OUTLINED_FUNCTION_2_5(v3, (uint64_t)qword_25765E558);
  v5 = sub_246EBE1F4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_4();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_4_5(&dword_246E99000, v4, v5, "Returning utterance from current request", v6);
    OUTLINED_FUNCTION_2();
  }

LABEL_8:
  swift_release();
  return v2;
}

uint64_t sub_246EA7A8C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_oneBestTranscript);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246EBE0A4();

  return v3;
}

ValueMetadata *type metadata accessor for NLGUtteranceProvider()
{
  return &type metadata for NLGUtteranceProvider;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_246EBE014();
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_4_5(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

BOOL OUTLINED_FUNCTION_6_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t *sub_246EA7B48(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    a1[1] = a2[1];
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_246EBDE7C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 28);
    v14 = (char *)v7 + v13;
    v15 = (char *)a2 + v13;
    v16 = type metadata accessor for Siri_Nlg_Capabilities(0);
    if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v16))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v12(v14, v15, v11);
      v14[*(int *)(v16 + 20)] = v15[*(int *)(v16 + 20)];
      __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
    }
  }
  return v7;
}

uint64_t type metadata accessor for Siri_Nlg_Capabilities(uint64_t a1)
{
  return sub_246EAB850(a1, qword_25765B390);
}

uint64_t sub_246EA7C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t (*v9)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_246EBDE7C();
  v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v9(v4, v5);
  v6 = a1 + *(int *)(a2 + 28);
  v7 = type metadata accessor for Siri_Nlg_Capabilities(0);
  result = __swift_getEnumTagSinglePayload(v6, 1, v7);
  if (!(_DWORD)result)
    return v9(v6, v5);
  return result;
}

_QWORD *sub_246EA7D4C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_246EBDE7C();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for Siri_Nlg_Capabilities(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v10);
    v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
    __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  }
  return a1;
}

_QWORD *sub_246EA7E5C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int EnumTagSinglePayload;
  uint64_t v17;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for Siri_Nlg_Capabilities(0);
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!(_DWORD)v8)
  {
    if (!EnumTagSinglePayload)
    {
      v11(v13, v14, v9);
      v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
      return a1;
    }
    sub_246EAC538((uint64_t)v13, type metadata accessor for Siri_Nlg_Capabilities);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v14, v9);
  v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

_OWORD *sub_246EA7FCC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  *a1 = *a2;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  v11 = *(int *)(a3 + 28);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = type metadata accessor for Siri_Nlg_Capabilities(0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v9);
    v12[*(int *)(v14 + 20)] = v13[*(int *)(v14 + 20)];
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v14);
  }
  return a1;
}

_QWORD *sub_246EA80C4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int EnumTagSinglePayload;
  uint64_t v17;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 40);
  v11(v7, v8, v9);
  v12 = *(int *)(a3 + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for Siri_Nlg_Capabilities(0);
  LODWORD(v8) = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v15);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  if (!(_DWORD)v8)
  {
    if (!EnumTagSinglePayload)
    {
      v11(v13, v14, v9);
      v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
      return a1;
    }
    sub_246EAC538((uint64_t)v13, type metadata accessor for Siri_Nlg_Capabilities);
    goto LABEL_6;
  }
  if (EnumTagSinglePayload)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v14, v9);
  v13[*(int *)(v15 + 20)] = v14[*(int *)(v15 + 20)];
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  return a1;
}

uint64_t sub_246EA8224()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_246EA8230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_0_4();
    if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    {
      v7 = v6;
      v8 = *(int *)(a3 + 24);
    }
    else
    {
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
      v8 = *(int *)(a3 + 28);
    }
    OUTLINED_FUNCTION_5_4(a1 + v8, a2, v7);
  }
}

uint64_t sub_246EA82A8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246EA82B4()
{
  uint64_t v0;
  _QWORD *v1;
  int v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_47();
  if (v4)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    v5 = v3;
    v6 = v2;
    v7 = OUTLINED_FUNCTION_0_4();
    if (*(_DWORD *)(*(_QWORD *)(v7 - 8) + 84) == v6)
    {
      v8 = v7;
      v9 = *(int *)(v5 + 24);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
      v9 = *(int *)(v5 + 28);
    }
    OUTLINED_FUNCTION_6_5((uint64_t)v1 + v9, v0, v0, v8);
  }
}

uint64_t type metadata accessor for Siri_Nlg_Model(uint64_t a1)
{
  return sub_246EAB850(a1, (uint64_t *)&unk_25765B2F0);
}

void sub_246EA8340()
{
  unint64_t v0;
  unint64_t v1;

  sub_246EBDE7C();
  if (v0 <= 0x3F)
  {
    sub_246EA83D4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_246EA83D4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25765B300)
  {
    type metadata accessor for Siri_Nlg_Capabilities(255);
    v0 = sub_246EBE230();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25765B300);
  }
}

_QWORD *sub_246EA8428(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_246EBDE7C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_246EA84B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_246EBDE7C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_246EA84E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246EBDE7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_246EA8540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246EBDE7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_246EA859C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246EBDE7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_246EA85F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_246EBDE7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_246EA8654()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_246EA8660(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_0_4();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    OUTLINED_FUNCTION_5_4(a1, a2, v4);
  else
    OUTLINED_FUNCTION_8_2();
}

uint64_t sub_246EA86E0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_246EA86EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_0_4();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    OUTLINED_FUNCTION_6_5(a1, a2, a2, v8);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
    OUTLINED_FUNCTION_8_2();
  }
}

uint64_t sub_246EA874C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246EBDE7C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_246EA87BC(unsigned __int8 a1, char a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = 0x726F74636146;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0xD000000000000023;
    else
      v4 = 0x6E6F6973726556;
    if (v3 == 1)
      v5 = 0x8000000246EC04F0;
    else
      v5 = 0xE700000000000000;
  }
  else
  {
    v5 = 0xE600000000000000;
    v4 = 0x726F74636146;
  }
  if (a2)
  {
    if (a2 == 1)
      v2 = 0xD000000000000023;
    else
      v2 = 0x6E6F6973726556;
    if (a2 == 1)
      v6 = 0x8000000246EC04F0;
    else
      v6 = 0xE700000000000000;
  }
  else
  {
    v6 = 0xE600000000000000;
  }
  if (v4 != v2 || v5 != v6)
    OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_2();
}

void sub_246EA88AC(unsigned __int8 a1, char a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = 7496035;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 1701670760;
    else
      v4 = 0x656E6F6870;
    if (v3 == 1)
      v5 = 0xE400000000000000;
    else
      v5 = 0xE500000000000000;
  }
  else
  {
    v5 = 0xE300000000000000;
    v4 = 7496035;
  }
  if (a2)
  {
    if (a2 == 1)
      v2 = 1701670760;
    else
      v2 = 0x656E6F6870;
    if (a2 == 1)
      v6 = 0xE400000000000000;
    else
      v6 = 0xE500000000000000;
  }
  else
  {
    v6 = 0xE300000000000000;
  }
  if (v4 != v2 || v5 != v6)
    OUTLINED_FUNCTION_23_1();
  OUTLINED_FUNCTION_16();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_2();
}

BOOL sub_246EA897C(char a1, char a2)
{
  return a1 == a2;
}

unint64_t sub_246EA898C(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

uint64_t sub_246EA899C(uint64_t result)
{
  return result;
}

BOOL sub_246EA89A4(char *a1, char *a2)
{
  return sub_246EA897C(*a1, *a2);
}

void sub_246EA89B0()
{
  sub_246EAD6E4();
}

uint64_t sub_246EA89B8()
{
  sub_246EAC59C();
  return sub_246EBDED0();
}

void sub_246EA89F0()
{
  sub_246EAD7E8();
}

void sub_246EA89F8(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_246EA8A00@<X0>(unint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_246EA898C(a1);
  *a2 = result;
  return result;
}

uint64_t sub_246EA8A24()
{
  unsigned __int8 *v0;

  return sub_246EA899C(*v0);
}

unint64_t sub_246EA8A2C@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_246EA898C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_246EA8A54@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = sub_246EA899C(*v1);
  *a1 = result;
  return result;
}

void sub_246EA8A7C(_QWORD *a1@<X8>)
{
  *a1 = &unk_25183B028;
}

void sub_246EA8A8C(uint64_t a1@<X8>)
{
  sub_246EBDE70();
  *(_BYTE *)(a1 + *(int *)(OUTLINED_FUNCTION_38() + 20)) = 2;
  OUTLINED_FUNCTION_24_0();
}

uint64_t sub_246EA8AB8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = MEMORY[0x24BEE4AF8];
  *a1 = MEMORY[0x24BEE4AF8];
  a1[1] = v2;
  v3 = type metadata accessor for Siri_Nlg_Model(0);
  sub_246EBDE70();
  v4 = (uint64_t)a1 + *(int *)(v3 + 28);
  v5 = OUTLINED_FUNCTION_38();
  return __swift_storeEnumTagSinglePayload(v4, 1, 1, v5);
}

void sub_246EA8B14(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;

  *a1 = MEMORY[0x24BEE4AF8];
  type metadata accessor for Siri_Nlg_CATFile(0);
  OUTLINED_FUNCTION_14_1();
  v3 = (_QWORD *)((char *)a1 + *(int *)(v1 + 24));
  *v3 = 0;
  v3[1] = 0;
  v4 = (_QWORD *)((char *)a1 + *(int *)(v1 + 28));
  *v4 = 0;
  v4[1] = 0;
  OUTLINED_FUNCTION_24_0();
}

void sub_246EA8B5C(void (*a1)(_QWORD)@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *v4;

  *a2 = MEMORY[0x24BEE4AF8];
  a1(0);
  OUTLINED_FUNCTION_14_1();
  v4 = (_QWORD *)((char *)a2 + *(int *)(v2 + 24));
  *v4 = 0;
  v4[1] = 0;
  OUTLINED_FUNCTION_24_0();
}

void sub_246EA8B9C(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = MEMORY[0x24BEE4AF8];
  type metadata accessor for Siri_Nlg_Content(0);
  OUTLINED_FUNCTION_14_1();
  *((_BYTE *)a1 + *(int *)(v1 + 24)) = 4;
  OUTLINED_FUNCTION_24_0();
}

uint64_t sub_246EA8BD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  unint64_t v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;

  v0 = sub_246EBDFE4();
  __swift_allocate_value_buffer(v0, qword_25765E578);
  __swift_project_value_buffer(v0, (uint64_t)qword_25765E578);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B490);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B498);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_246EBEE80;
  v6 = v5 + v4;
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v5 + v4) = 0;
  *(_QWORD *)v7 = "CONTENTTYPE_UNKNOWN";
  *(_QWORD *)(v7 + 8) = 19;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_246EBDFCC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v6 + v3) = 1;
  *(_QWORD *)v11 = "CONTENTTYPE_TEXT";
  *(_QWORD *)(v11 + 8) = 16;
  *(_BYTE *)(v11 + 16) = 2;
  v10();
  v12 = (_QWORD *)(v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 2;
  *(_QWORD *)v13 = "CONTENTTYPE_KEYWORDS";
  *((_QWORD *)v13 + 1) = 20;
  v13[16] = 2;
  v10();
  v14 = (_QWORD *)(v6 + 3 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 3;
  *(_QWORD *)v15 = "CONTENTTYPE_SOURCE_KEYWORDS";
  *((_QWORD *)v15 + 1) = 27;
  v15[16] = 2;
  v10();
  return sub_246EBDFD8();
}

uint64_t sub_246EA8D90(uint64_t a1, uint64_t a2)
{
  return sub_246EA9750(a1, a2, &qword_25765A830, (uint64_t)qword_25765E578);
}

uint64_t sub_246EA8DAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  _QWORD *v12;
  char *v13;

  v0 = sub_246EBDFE4();
  __swift_allocate_value_buffer(v0, qword_25765E590);
  __swift_project_value_buffer(v0, (uint64_t)qword_25765E590);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B490);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B498);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_246EBEE90;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "capabilities";
  *(_QWORD *)(v7 + 8) = 12;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_246EBDFCC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "cat_file";
  *((_QWORD *)v11 + 1) = 8;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "vocabulary";
  *((_QWORD *)v13 + 1) = 10;
  v13[16] = 2;
  v10();
  return sub_246EBDFD8();
}

void sub_246EA8F3C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = OUTLINED_FUNCTION_12_2();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 3:
          OUTLINED_FUNCTION_52();
          sub_246EBDF00();
          break;
        case 2:
          v3 = OUTLINED_FUNCTION_1_5();
          sub_246EAAA00(v3, v4, v5, v6, type metadata accessor for Siri_Nlg_CATFile, &qword_25765B430, (uint64_t)&unk_246EBF428);
          break;
        case 1:
          OUTLINED_FUNCTION_1_5();
          sub_246EA8FE4();
          break;
      }
      v1 = OUTLINED_FUNCTION_51();
    }
  }
  OUTLINED_FUNCTION_2_6();
}

uint64_t sub_246EA8FE4()
{
  type metadata accessor for Siri_Nlg_Model(0);
  type metadata accessor for Siri_Nlg_Capabilities(0);
  sub_246EA3A30(&qword_25765B450, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF590);
  return sub_246EBDF30();
}

void sub_246EA9078()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_39();
  sub_246EA9144(v2);
  if (!v0)
  {
    if (*(_QWORD *)(*v1 + 16))
    {
      type metadata accessor for Siri_Nlg_CATFile(0);
      sub_246EA3A30(&qword_25765B430, type metadata accessor for Siri_Nlg_CATFile, (uint64_t)&unk_246EBF428);
      OUTLINED_FUNCTION_18_1();
    }
    if (*(_QWORD *)(v1[1] + 16))
      sub_246EBDF90();
    type metadata accessor for Siri_Nlg_Model(0);
    OUTLINED_FUNCTION_17_2();
  }
  OUTLINED_FUNCTION_2_6();
}

void sub_246EA9144(uint64_t a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Siri_Nlg_Capabilities(0);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Siri_Nlg_Model(0);
  sub_246EABAAC(a1 + *(int *)(v10 + 28), (uint64_t)v5);
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
    sub_246EABB38((uint64_t)v5, &qword_25765B290);
  }
  else
  {
    sub_246EABAF4((uint64_t)v5, (uint64_t)v9);
    sub_246EA3A30(&qword_25765B450, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF590);
    sub_246EBDFC0();
    sub_246EAC538((uint64_t)v9, type metadata accessor for Siri_Nlg_Capabilities);
  }
}

void sub_246EA92A0(uint64_t a1, uint64_t a2)
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  char *v42;
  uint64_t v43;
  char *v44;
  void (*v45)(char *, uint64_t);
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v4 = OUTLINED_FUNCTION_0_4();
  v48 = *(_QWORD *)(v4 - 8);
  v49 = v4;
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v47 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v8);
  v46 = (char *)&v46 - v9;
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_36();
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B4A8);
  OUTLINED_FUNCTION_36();
  MEMORY[0x24BDAC7A8](v15, v16);
  v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
  OUTLINED_FUNCTION_36();
  v21 = MEMORY[0x24BDAC7A8](v19, v20);
  v23 = (char *)&v46 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v21, v24);
  v27 = (char *)&v46 - v26;
  MEMORY[0x24BDAC7A8](v25, v28);
  v30 = (char *)&v46 - v29;
  v31 = type metadata accessor for Siri_Nlg_Model(0);
  sub_246EABAAC(a1 + *(int *)(v31 + 28), (uint64_t)v30);
  sub_246EABAAC(a2 + *(int *)(v31 + 28), (uint64_t)v27);
  v32 = (uint64_t)&v18[*(int *)(v14 + 48)];
  sub_246EABAAC((uint64_t)v30, (uint64_t)v18);
  sub_246EABAAC((uint64_t)v27, v32);
  OUTLINED_FUNCTION_37((uint64_t)v18);
  if (!v33)
  {
    sub_246EABAAC((uint64_t)v18, (uint64_t)v23);
    OUTLINED_FUNCTION_37(v32);
    if (!v33)
    {
      sub_246EABAF4(v32, (uint64_t)v13);
      sub_246EA9ABC((uint64_t)v23, (uint64_t)v13);
      v35 = v34;
      sub_246EAC538((uint64_t)v13, type metadata accessor for Siri_Nlg_Capabilities);
      OUTLINED_FUNCTION_25_1((uint64_t)v27);
      OUTLINED_FUNCTION_25_1((uint64_t)v30);
      sub_246EAC538((uint64_t)v23, type metadata accessor for Siri_Nlg_Capabilities);
      OUTLINED_FUNCTION_25_1((uint64_t)v18);
      if ((v35 & 1) == 0)
        goto LABEL_14;
      goto LABEL_11;
    }
    sub_246EABB38((uint64_t)v27, &qword_25765B290);
    sub_246EABB38((uint64_t)v30, &qword_25765B290);
    sub_246EAC538((uint64_t)v23, type metadata accessor for Siri_Nlg_Capabilities);
LABEL_9:
    sub_246EABB38((uint64_t)v18, &qword_25765B4A8);
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_25_1((uint64_t)v27);
  OUTLINED_FUNCTION_25_1((uint64_t)v30);
  OUTLINED_FUNCTION_37(v32);
  if (!v33)
    goto LABEL_9;
  sub_246EABB38((uint64_t)v18, &qword_25765B290);
LABEL_11:
  v36 = OUTLINED_FUNCTION_45();
  if ((sub_246EAC214(v36, v37) & 1) != 0 && (sub_246EAC46C(*(_QWORD **)(a1 + 8), *(_QWORD **)(a2 + 8)) & 1) != 0)
  {
    v38 = a1 + *(int *)(v31 + 24);
    v40 = v48;
    v39 = v49;
    v41 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
    v42 = v46;
    v41(v46, v38, v49);
    v43 = a2 + *(int *)(v31 + 24);
    v44 = v47;
    v41(v47, v43, v39);
    sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    sub_246EBE08C();
    v45 = *(void (**)(char *, uint64_t))(v40 + 8);
    v45(v44, v39);
    v45(v42, v39);
  }
LABEL_14:
  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246EA95F8()
{
  return 0x676C6E2E69726973;
}

uint64_t sub_246EA9620@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_246EBDE7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_246EA9660(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a2 + 24);
  v5 = sub_246EBDE7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(v4, a1, v5);
}

uint64_t (*sub_246EA96A0())()
{
  return nullsub_1;
}

void sub_246EA96B4()
{
  sub_246EA8F3C();
}

void sub_246EA96C8()
{
  sub_246EA9078();
}

uint64_t sub_246EA96E0()
{
  sub_246EA3A30(&qword_25765B4A0, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF6C0);
  return sub_246EBDEC4();
}

uint64_t sub_246EA9734(uint64_t a1, uint64_t a2)
{
  return sub_246EA9750(a1, a2, &qword_25765A838, (uint64_t)qword_25765E590);
}

uint64_t sub_246EA9750(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  sub_246EAAFE8(a3, a4);
  sub_246EBDFE4();
  v4 = OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_9_2(v4, v5, v6, v7);
}

uint64_t sub_246EA9788()
{
  sub_246EA3A30(&qword_25765AF68, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF6F8);
  return sub_246EBDF60();
}

uint64_t sub_246EA97C8()
{
  return sub_246EAB328(type metadata accessor for Siri_Nlg_Model, &qword_25765B470, (uint64_t)&unk_246EBF630);
}

uint64_t sub_246EA97F4()
{
  sub_246EA3A30(&qword_25765AF68, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF6F8);
  return sub_246EBDF6C();
}

uint64_t sub_246EA984C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = sub_246EBDFE4();
  __swift_allocate_value_buffer(v0, qword_25765E5A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25765E5A8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B490);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B498);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_246EBEC10;
  v5 = v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v4 + v3) = 1;
  *(_QWORD *)v5 = "dialog_selection";
  *(_QWORD *)(v5 + 8) = 16;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x24BE5C328];
  v7 = sub_246EBDFCC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  return sub_246EBDFD8();
}

void sub_246EA9950(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_22_1(a1, a2);
  while (1)
  {
    v3 = sub_246EBDEDC();
    if (v2 || (v4 & 1) != 0)
      break;
    if (v3 == 1)
    {
      OUTLINED_FUNCTION_1_5();
      sub_246EA9998();
    }
  }
  OUTLINED_FUNCTION_49();
}

uint64_t sub_246EA9998()
{
  type metadata accessor for Siri_Nlg_Capabilities(0);
  return sub_246EBDEE8();
}

uint64_t sub_246EA99F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  OUTLINED_FUNCTION_52();
  result = sub_246EA9A48(v1);
  if (!v0)
    return sub_246EBDE64();
  return result;
}

uint64_t sub_246EA9A48(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for Siri_Nlg_Capabilities(0);
  if (*(_BYTE *)(a1 + *(int *)(result + 20)) != 2)
    return sub_246EBDF78();
  return result;
}

void sub_246EA9ABC(uint64_t a1, uint64_t a2)
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
  int v13;
  int v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v6 = OUTLINED_FUNCTION_0_4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  OUTLINED_FUNCTION_3_4();
  MEMORY[0x24BDAC7A8](v9, v10);
  v11 = OUTLINED_FUNCTION_10_1();
  v12 = *(int *)(type metadata accessor for Siri_Nlg_Capabilities(v11) + 20);
  v13 = *(unsigned __int8 *)(a1 + v12);
  v14 = *(unsigned __int8 *)(a2 + v12);
  if (v13 == 2)
  {
    if (v14 != 2)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v14 != 2 && ((((v14 & 1) == 0) ^ v13) & 1) != 0)
  {
LABEL_6:
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    v15(v3, a1, v6);
    v15(v2, a2, v6);
    sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
    OUTLINED_FUNCTION_4_6();
    OUTLINED_FUNCTION_32(v2);
    OUTLINED_FUNCTION_32(v3);
  }
LABEL_7:
  OUTLINED_FUNCTION_7_5();
}

unint64_t sub_246EA9BC4()
{
  return 0xD000000000000015;
}

uint64_t sub_246EA9BE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_246EBDE7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_246EA9C18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_246EBDE7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*sub_246EA9C50())()
{
  return nullsub_1;
}

void sub_246EA9C60(uint64_t a1, uint64_t a2)
{
  sub_246EA9950(a1, a2);
}

uint64_t sub_246EA9C74()
{
  return sub_246EA99F8();
}

uint64_t sub_246EA9C88()
{
  sub_246EA3A30(&qword_25765B4B8, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF558);
  return sub_246EBDEC4();
}

uint64_t sub_246EA9CD8(uint64_t a1, uint64_t a2)
{
  return sub_246EA9750(a1, a2, &qword_25765A840, (uint64_t)qword_25765E5A8);
}

uint64_t sub_246EA9CF4()
{
  sub_246EA3A30(&qword_25765B450, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF590);
  return sub_246EBDF60();
}

uint64_t sub_246EA9D34()
{
  return sub_246EAB328(type metadata accessor for Siri_Nlg_Capabilities, &qword_25765B458, (uint64_t)&unk_246EBF4C8);
}

uint64_t sub_246EA9D60()
{
  sub_246EA3A30(&qword_25765B450, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF590);
  return sub_246EBDF6C();
}

uint64_t sub_246EA9DB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;
  _QWORD *v12;
  char *v13;

  v0 = sub_246EBDFE4();
  __swift_allocate_value_buffer(v0, qword_25765E5C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25765E5C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B490);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B498);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_246EBEE90;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "cat_family";
  *(_QWORD *)(v7 + 8) = 10;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_246EBDFCC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "cat_identifier";
  *((_QWORD *)v11 + 1) = 14;
  v11[16] = 2;
  v10();
  v12 = (_QWORD *)((char *)v6 + 2 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "dialog_switch";
  *((_QWORD *)v13 + 1) = 13;
  v13[16] = 2;
  v10();
  return sub_246EBDFD8();
}

void sub_246EA9F3C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = OUTLINED_FUNCTION_12_2();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(v1)
      {
        case 3:
          v7 = OUTLINED_FUNCTION_1_5();
          sub_246EAAA00(v7, v8, v9, v10, type metadata accessor for Siri_Nlg_DialogSwitch, &qword_25765B410, (uint64_t)&unk_246EBF2C0);
          break;
        case 2:
          OUTLINED_FUNCTION_1_5();
          sub_246EA9FE8();
          break;
        case 1:
          v3 = OUTLINED_FUNCTION_1_5();
          sub_246EAA594(v3, v4, v5, v6, type metadata accessor for Siri_Nlg_CATFile);
          break;
      }
      v1 = OUTLINED_FUNCTION_51();
    }
  }
  OUTLINED_FUNCTION_2_6();
}

uint64_t sub_246EA9FE8()
{
  type metadata accessor for Siri_Nlg_CATFile(0);
  return sub_246EBDF18();
}

void sub_246EAA048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;

  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_39();
  sub_246EAA5CC(v2, v3, v4, v5, v6);
  if (!v0)
  {
    OUTLINED_FUNCTION_39();
    sub_246EAA104(v7);
    if (*(_QWORD *)(*(_QWORD *)v1 + 16))
    {
      type metadata accessor for Siri_Nlg_DialogSwitch(0);
      sub_246EA3A30(&qword_25765B410, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t)&unk_246EBF2C0);
      OUTLINED_FUNCTION_18_1();
    }
    type metadata accessor for Siri_Nlg_CATFile(0);
    OUTLINED_FUNCTION_17_2();
  }
  OUTLINED_FUNCTION_2_6();
}

uint64_t sub_246EAA104(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for Siri_Nlg_CATFile(0);
  if (*(_QWORD *)(a1 + *(int *)(result + 28) + 8))
    return sub_246EBDFA8();
  return result;
}

void sub_246EAA178(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;

  v4 = OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v4, v5);
  OUTLINED_FUNCTION_3_4();
  MEMORY[0x24BDAC7A8](v6, v7);
  v8 = OUTLINED_FUNCTION_10_1();
  v9 = type metadata accessor for Siri_Nlg_CATFile(v8);
  OUTLINED_FUNCTION_19_2();
  if (!v12)
  {
    if (v10)
      goto LABEL_21;
LABEL_10:
    OUTLINED_FUNCTION_19_2();
    if (v18)
    {
      if (!v16)
        goto LABEL_21;
      OUTLINED_FUNCTION_35(v17);
      v21 = v15 && v19 == v20;
      if (!v21 && (OUTLINED_FUNCTION_23_1() & 1) == 0)
        goto LABEL_21;
    }
    else if (v16)
    {
      goto LABEL_21;
    }
    v22 = OUTLINED_FUNCTION_45();
    if ((sub_246EABFF8(v22, v23) & 1) != 0)
    {
      OUTLINED_FUNCTION_16_2(v2, a1 + *(int *)(v9 + 20));
      OUTLINED_FUNCTION_15_1(*(int *)(v9 + 20));
      sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      OUTLINED_FUNCTION_4_6();
      OUTLINED_FUNCTION_31(v1);
      OUTLINED_FUNCTION_31(v2);
    }
    goto LABEL_21;
  }
  if (v10)
  {
    OUTLINED_FUNCTION_35(v11);
    v15 = v15 && v13 == v14;
    if (v15 || (OUTLINED_FUNCTION_23_1() & 1) != 0)
      goto LABEL_10;
  }
LABEL_21:
  OUTLINED_FUNCTION_7_5();
}

unint64_t sub_246EAA2B0()
{
  return 0xD000000000000010;
}

uint64_t (*sub_246EAA2D4())()
{
  return nullsub_1;
}

void sub_246EAA2E8()
{
  sub_246EA9F3C();
}

void sub_246EAA2FC()
{
  sub_246EAA048();
}

uint64_t sub_246EAA310()
{
  sub_246EA3A30(&qword_25765B4C0, type metadata accessor for Siri_Nlg_CATFile, (uint64_t)&unk_246EBF3F0);
  return sub_246EBDEC4();
}

uint64_t sub_246EAA360(uint64_t a1, uint64_t a2)
{
  return sub_246EA9750(a1, a2, &qword_25765A848, (uint64_t)qword_25765E5C0);
}

uint64_t sub_246EAA37C()
{
  sub_246EA3A30(&qword_25765B430, type metadata accessor for Siri_Nlg_CATFile, (uint64_t)&unk_246EBF428);
  return sub_246EBDF60();
}

uint64_t sub_246EAA3BC()
{
  return sub_246EAB328(type metadata accessor for Siri_Nlg_CATFile, &qword_25765B438, (uint64_t)&unk_246EBF360);
}

uint64_t sub_246EAA3E8()
{
  sub_246EA3A30(&qword_25765B430, type metadata accessor for Siri_Nlg_CATFile, (uint64_t)&unk_246EBF428);
  return sub_246EBDF6C();
}

uint64_t sub_246EAA43C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_246EBDFE4();
  __swift_allocate_value_buffer(v0, qword_25765E5D8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25765E5D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B490);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B498);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_246EBEC00;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "switch_variable";
  *(_QWORD *)(v7 + 8) = 15;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_246EBDFCC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "dialog";
  *((_QWORD *)v11 + 1) = 6;
  v11[16] = 2;
  v10();
  return sub_246EBDFD8();
}

void sub_246EAA594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  OUTLINED_FUNCTION_13_1(a1, a2, a3, a4, a5);
  OUTLINED_FUNCTION_52();
  sub_246EBDF18();
  OUTLINED_FUNCTION_29();
}

void sub_246EAA5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;

  if (*(_QWORD *)(v5 + *(int *)(OUTLINED_FUNCTION_13_1(a1, a2, a3, a4, a5) + 24) + 8))
    sub_246EBDFA8();
  OUTLINED_FUNCTION_29();
}

void sub_246EAA61C(_QWORD *a1@<X8>)
{
  sub_246EA8B5C((void (*)(_QWORD))type metadata accessor for Siri_Nlg_DialogSwitch, a1);
}

unint64_t sub_246EAA638()
{
  return 0xD000000000000015;
}

void sub_246EAA654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_246EAA964(a1, a2, a3, type metadata accessor for Siri_Nlg_DialogSwitch, type metadata accessor for Siri_Nlg_Dialog, &qword_25765B3F0, (uint64_t)&unk_246EBF158);
}

void sub_246EAA688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_246EAAA94(a1, a2, a3, type metadata accessor for Siri_Nlg_DialogSwitch, type metadata accessor for Siri_Nlg_Dialog, &qword_25765B3F0, (uint64_t)&unk_246EBF158);
}

uint64_t sub_246EAA6BC()
{
  sub_246EA3A30(&qword_25765B4C8, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t)&unk_246EBF288);
  return sub_246EBDEC4();
}

uint64_t sub_246EAA70C(uint64_t a1, uint64_t a2)
{
  return sub_246EA9750(a1, a2, &qword_25765A850, (uint64_t)qword_25765E5D8);
}

uint64_t sub_246EAA728()
{
  sub_246EA3A30(&qword_25765B410, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t)&unk_246EBF2C0);
  return sub_246EBDF60();
}

uint64_t sub_246EAA768()
{
  return sub_246EAB328(type metadata accessor for Siri_Nlg_DialogSwitch, &qword_25765B418, (uint64_t)&unk_246EBF1F8);
}

uint64_t sub_246EAA794()
{
  sub_246EA3A30(&qword_25765B410, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t)&unk_246EBF2C0);
  return sub_246EBDF6C();
}

uint64_t sub_246EAA7E4(uint64_t a1, uint64_t a2)
{
  char v2;

  sub_246EAAB90(a1, a2, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t (*)(uint64_t))sub_246EABB60);
  return v2 & 1;
}

uint64_t sub_246EAA80C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_246EBDFE4();
  __swift_allocate_value_buffer(v0, qword_25765E5F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25765E5F0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B490);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B498);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_246EBEC00;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "switch_case";
  *(_QWORD *)(v7 + 8) = 11;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C328];
  v9 = sub_246EBDFCC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "content";
  *((_QWORD *)v11 + 1) = 7;
  v11[16] = 2;
  v10();
  return sub_246EBDFD8();
}

void sub_246EAA964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t v7;
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

  while (1)
  {
    v12 = sub_246EBDEDC();
    if (v7 || (v13 & 1) != 0)
      break;
    if (v12 == 2)
    {
      v18 = OUTLINED_FUNCTION_53();
      sub_246EAAA00(v18, v19, v20, v21, a5, a6, a7);
    }
    else if (v12 == 1)
    {
      v14 = OUTLINED_FUNCTION_53();
      sub_246EAA594(v14, v15, v16, v17, a4);
    }
  }
  OUTLINED_FUNCTION_2_6();
}

uint64_t sub_246EAAA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7)
{
  a5(0);
  sub_246EA3A30(a6, a5, a7);
  return sub_246EBDF24();
}

void sub_246EAAA94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  sub_246EAA5CC(v7, a1, a2, a3, a4);
  if (!v8)
  {
    if (*(_QWORD *)(*(_QWORD *)v7 + 16))
    {
      a5(0);
      sub_246EA3A30(a6, a5, a7);
      sub_246EBDFB4();
    }
    a4(0);
    OUTLINED_FUNCTION_44();
  }
}

void sub_246EAAB90(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
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
  BOOL v20;
  uint64_t v21;

  v9 = OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v9, v10);
  OUTLINED_FUNCTION_3_4();
  MEMORY[0x24BDAC7A8](v11, v12);
  v13 = OUTLINED_FUNCTION_10_1();
  v14 = a3(v13);
  OUTLINED_FUNCTION_19_2();
  if (!v17)
  {
    if (v15)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v15)
  {
    OUTLINED_FUNCTION_35(v16);
    v20 = v20 && v18 == v19;
    if (v20 || (OUTLINED_FUNCTION_23_1() & 1) != 0)
    {
LABEL_10:
      v21 = OUTLINED_FUNCTION_45();
      if ((a4(v21) & 1) != 0)
      {
        OUTLINED_FUNCTION_16_2(v5, a1 + *(int *)(v14 + 20));
        OUTLINED_FUNCTION_15_1(*(int *)(v14 + 20));
        sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        OUTLINED_FUNCTION_4_6();
        OUTLINED_FUNCTION_31(v4);
        OUTLINED_FUNCTION_31(v5);
      }
    }
  }
LABEL_12:
  OUTLINED_FUNCTION_0_2();
}

void sub_246EAACA0(_QWORD *a1@<X8>)
{
  sub_246EA8B5C((void (*)(_QWORD))type metadata accessor for Siri_Nlg_Dialog, a1);
}

uint64_t sub_246EAACBC()
{
  return 0x676C6E2E69726973;
}

void sub_246EAACE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_246EAA964(a1, a2, a3, type metadata accessor for Siri_Nlg_Dialog, type metadata accessor for Siri_Nlg_Content, &qword_25765B3D0, (uint64_t)&unk_246EBEFF0);
}

void sub_246EAAD14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_246EAAA94(a1, a2, a3, type metadata accessor for Siri_Nlg_Dialog, type metadata accessor for Siri_Nlg_Content, &qword_25765B3D0, (uint64_t)&unk_246EBEFF0);
}

uint64_t sub_246EAAD48()
{
  sub_246EA3A30(&qword_25765B4D0, type metadata accessor for Siri_Nlg_Dialog, (uint64_t)"1Ɨ\nL>");
  return sub_246EBDEC4();
}

uint64_t sub_246EAAD98(uint64_t a1, uint64_t a2)
{
  return sub_246EA9750(a1, a2, &qword_25765A858, (uint64_t)qword_25765E5F0);
}

uint64_t sub_246EAADB4()
{
  sub_246EA3A30(&qword_25765B3F0, type metadata accessor for Siri_Nlg_Dialog, (uint64_t)&unk_246EBF158);
  return sub_246EBDF60();
}

uint64_t sub_246EAADF4()
{
  return sub_246EAB328(type metadata accessor for Siri_Nlg_Dialog, &qword_25765B3F8, (uint64_t)&unk_246EBF090);
}

uint64_t sub_246EAAE20()
{
  sub_246EA3A30(&qword_25765B3F0, type metadata accessor for Siri_Nlg_Dialog, (uint64_t)&unk_246EBF158);
  return sub_246EBDF6C();
}

uint64_t sub_246EAAE70(uint64_t a1, uint64_t a2)
{
  char v2;

  sub_246EAAB90(a1, a2, type metadata accessor for Siri_Nlg_Dialog, (uint64_t (*)(uint64_t))sub_246EABD54);
  return v2 & 1;
}

uint64_t sub_246EAAE98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  char *v11;

  v0 = sub_246EBDFE4();
  __swift_allocate_value_buffer(v0, qword_25765E608);
  __swift_project_value_buffer(v0, (uint64_t)qword_25765E608);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B490);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B498);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_246EBEC00;
  v6 = (_QWORD *)(v5 + v4);
  v7 = v5 + v4 + *(int *)(v1 + 48);
  *v6 = 1;
  *(_QWORD *)v7 = "type";
  *(_QWORD *)(v7 + 8) = 4;
  *(_BYTE *)(v7 + 16) = 2;
  v8 = *MEMORY[0x24BE5C318];
  v9 = sub_246EBDFCC();
  v10 = *(void (**)(void))(*(_QWORD *)(v9 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v10)(v7, v8, v9);
  v11 = (char *)v6 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)((char *)v6 + v3) = 2;
  *(_QWORD *)v11 = "token";
  *((_QWORD *)v11 + 1) = 5;
  v11[16] = 2;
  v10();
  return sub_246EBDFD8();
}

uint64_t sub_246EAAFE8(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_246EBDFE4();
  return __swift_project_value_buffer(v3, a2);
}

void sub_246EAB028(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  OUTLINED_FUNCTION_22_1(a1, a2);
  while (1)
  {
    v3 = sub_246EBDEDC();
    if (v2 || (v4 & 1) != 0)
      break;
    if (v3 == 2)
    {
      OUTLINED_FUNCTION_52();
      sub_246EBDF0C();
    }
    else if (v3 == 1)
    {
      OUTLINED_FUNCTION_1_5();
      sub_246EAB08C();
    }
  }
  OUTLINED_FUNCTION_49();
}

uint64_t sub_246EAB08C()
{
  type metadata accessor for Siri_Nlg_Content(0);
  sub_246EAC59C();
  return sub_246EBDEF4();
}

uint64_t sub_246EAB100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  result = sub_246EAB1A0(v0);
  if (!v1)
  {
    if (*(_QWORD *)(*(_QWORD *)v0 + 16))
      sub_246EBDF9C();
    type metadata accessor for Siri_Nlg_Content(0);
    return OUTLINED_FUNCTION_44();
  }
  return result;
}

uint64_t sub_246EAB1A0(uint64_t a1)
{
  uint64_t result;

  result = type metadata accessor for Siri_Nlg_Content(0);
  if (*(_BYTE *)(a1 + *(int *)(result + 24)) != 4)
  {
    sub_246EAC59C();
    return sub_246EBDF84();
  }
  return result;
}

void sub_246EAB228(uint64_t a1, uint64_t a2)
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
  int v13;
  int v14;
  uint64_t v16;
  uint64_t v17;

  v6 = OUTLINED_FUNCTION_0_4();
  MEMORY[0x24BDAC7A8](v6, v7);
  OUTLINED_FUNCTION_3_4();
  MEMORY[0x24BDAC7A8](v8, v9);
  v10 = OUTLINED_FUNCTION_10_1();
  v11 = type metadata accessor for Siri_Nlg_Content(v10);
  v12 = *(int *)(v11 + 24);
  v13 = *(unsigned __int8 *)(a1 + v12);
  v14 = *(unsigned __int8 *)(a2 + v12);
  if (v13 == 4)
  {
    if (v14 != 4)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (v14 != 4 && v13 == v14)
  {
LABEL_9:
    v16 = OUTLINED_FUNCTION_45();
    if (sub_246EABF8C(v16, v17))
    {
      OUTLINED_FUNCTION_16_2(v3, a1 + *(int *)(v11 + 20));
      OUTLINED_FUNCTION_15_1(*(int *)(v11 + 20));
      sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      OUTLINED_FUNCTION_4_6();
      OUTLINED_FUNCTION_32(v2);
      OUTLINED_FUNCTION_32(v3);
    }
  }
LABEL_11:
  OUTLINED_FUNCTION_7_5();
}

uint64_t sub_246EAB328(uint64_t (*a1)(uint64_t), unint64_t *a2, uint64_t a3)
{
  sub_246EBE3D4();
  a1(0);
  sub_246EA3A30(a2, a1, a3);
  sub_246EBE074();
  return sub_246EBE3EC();
}

unint64_t sub_246EAB3A8()
{
  return 0xD000000000000010;
}

uint64_t sub_246EAB3C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_4();
  v0 = OUTLINED_FUNCTION_34();
  return OUTLINED_FUNCTION_9_2(v0, v1, v2, v3);
}

uint64_t sub_246EAB3EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = v2 + *(int *)(a2 + 20);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_33();
  return OUTLINED_FUNCTION_9_2(v4, a1, v6, *(uint64_t (**)(void))(v5 + 40));
}

void sub_246EAB420(uint64_t a1, uint64_t a2)
{
  sub_246EAB028(a1, a2);
}

uint64_t sub_246EAB434()
{
  return sub_246EAB100();
}

uint64_t sub_246EAB448()
{
  sub_246EA3A30(&qword_25765B4D8, type metadata accessor for Siri_Nlg_Content, (uint64_t)&unk_246EBEFB8);
  return sub_246EBDEC4();
}

uint64_t sub_246EAB498(uint64_t a1, uint64_t a2)
{
  return sub_246EA9750(a1, a2, &qword_25765A860, (uint64_t)qword_25765E608);
}

uint64_t sub_246EAB4B4()
{
  sub_246EA3A30(&qword_25765B3D0, type metadata accessor for Siri_Nlg_Content, (uint64_t)&unk_246EBEFF0);
  return sub_246EBDF60();
}

uint64_t sub_246EAB4F4()
{
  return sub_246EAB328(type metadata accessor for Siri_Nlg_Content, &qword_25765B3D8, (uint64_t)&unk_246EBEF28);
}

uint64_t sub_246EAB520()
{
  sub_246EA3A30(&qword_25765B3D0, type metadata accessor for Siri_Nlg_Content, (uint64_t)&unk_246EBEFF0);
  return sub_246EBDF6C();
}

uint64_t sub_246EAB570()
{
  sub_246EBE3D4();
  sub_246EBE074();
  return sub_246EBE3EC();
}

void sub_246EAB5C4()
{
  sub_246EA3A30(&qword_25765B3C8, type metadata accessor for Siri_Nlg_Content, (uint64_t)&unk_246EBEF00);
}

uint64_t type metadata accessor for Siri_Nlg_Content(uint64_t a1)
{
  return sub_246EAB850(a1, qword_25765B670);
}

void sub_246EAB604()
{
  sub_246EA3A30(&qword_25765B3D0, type metadata accessor for Siri_Nlg_Content, (uint64_t)&unk_246EBEFF0);
}

void sub_246EAB630()
{
  sub_246EA3A30(&qword_25765B3D8, type metadata accessor for Siri_Nlg_Content, (uint64_t)&unk_246EBEF28);
}

void sub_246EAB65C()
{
  sub_246EA3A30(&qword_25765B3E0, type metadata accessor for Siri_Nlg_Content, (uint64_t)&unk_246EBEF68);
}

void sub_246EAB688()
{
  sub_246EA3A30(&qword_25765B3E8, type metadata accessor for Siri_Nlg_Dialog, (uint64_t)&unk_246EBF068);
}

uint64_t type metadata accessor for Siri_Nlg_Dialog(uint64_t a1)
{
  return sub_246EAB850(a1, qword_25765B5D8);
}

void sub_246EAB6C8()
{
  sub_246EA3A30(&qword_25765B3F0, type metadata accessor for Siri_Nlg_Dialog, (uint64_t)&unk_246EBF158);
}

void sub_246EAB6F4()
{
  sub_246EA3A30(&qword_25765B3F8, type metadata accessor for Siri_Nlg_Dialog, (uint64_t)&unk_246EBF090);
}

void sub_246EAB720()
{
  sub_246EA3A30(&qword_25765B400, type metadata accessor for Siri_Nlg_Dialog, (uint64_t)&unk_246EBF0D0);
}

void sub_246EAB74C()
{
  sub_246EA3A30(&qword_25765B408, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t)")ŗ\nt=");
}

uint64_t type metadata accessor for Siri_Nlg_DialogSwitch(uint64_t a1)
{
  return sub_246EAB850(a1, qword_25765B540);
}

void sub_246EAB78C()
{
  sub_246EA3A30(&qword_25765B410, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t)&unk_246EBF2C0);
}

void sub_246EAB7B8()
{
  sub_246EA3A30(&qword_25765B418, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t)&unk_246EBF1F8);
}

void sub_246EAB7E4()
{
  sub_246EA3A30(&qword_25765B420, type metadata accessor for Siri_Nlg_DialogSwitch, (uint64_t)&unk_246EBF238);
}

void sub_246EAB810()
{
  sub_246EA3A30(&qword_25765B428, type metadata accessor for Siri_Nlg_CATFile, (uint64_t)&unk_246EBF338);
}

uint64_t type metadata accessor for Siri_Nlg_CATFile(uint64_t a1)
{
  return sub_246EAB850(a1, qword_25765B708);
}

uint64_t sub_246EAB850(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_246EAB880()
{
  sub_246EA3A30(&qword_25765B430, type metadata accessor for Siri_Nlg_CATFile, (uint64_t)&unk_246EBF428);
}

void sub_246EAB8AC()
{
  sub_246EA3A30(&qword_25765B438, type metadata accessor for Siri_Nlg_CATFile, (uint64_t)&unk_246EBF360);
}

void sub_246EAB8D8()
{
  sub_246EA3A30(&qword_25765B440, type metadata accessor for Siri_Nlg_CATFile, (uint64_t)&unk_246EBF3A0);
}

void sub_246EAB904()
{
  sub_246EA3A30(&qword_25765B448, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF4A0);
}

void sub_246EAB930()
{
  sub_246EA3A30(&qword_25765B450, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF590);
}

void sub_246EAB95C()
{
  sub_246EA3A30(&qword_25765B458, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF4C8);
}

void sub_246EAB988()
{
  sub_246EA3A30(&qword_25765B460, type metadata accessor for Siri_Nlg_Capabilities, (uint64_t)&unk_246EBF508);
}

void sub_246EAB9B4()
{
  sub_246EA3A30(&qword_25765B468, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF608);
}

void sub_246EAB9E0()
{
  sub_246EA3A30(&qword_25765AF68, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF6F8);
}

void sub_246EABA0C()
{
  sub_246EA3A30(&qword_25765B470, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF630);
}

void sub_246EABA38()
{
  sub_246EA3A30(&qword_25765B478, type metadata accessor for Siri_Nlg_Model, (uint64_t)&unk_246EBF670);
}

unint64_t sub_246EABA68()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25765B480;
  if (!qword_25765B480)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25765B488);
    result = MEMORY[0x24956C6A0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25765B480);
  }
  return result;
}

uint64_t sub_246EABAAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B290);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EABAF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Siri_Nlg_Capabilities(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_246EABB38(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_26_0(v2);
  OUTLINED_FUNCTION_24_0();
}

uint64_t sub_246EABB60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = type metadata accessor for Siri_Nlg_Dialog(0);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (uint64_t *)((char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6, v9);
  v12 = (uint64_t *)((char *)&v22 - v11);
  v13 = *(_QWORD *)(a1 + 16);
  v23 = a2;
  if (v13 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v13 && a1 != v23)
  {
    v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v22 = *(_QWORD *)(v10 + 72);
    do
    {
      sub_246EAC560(a1 + v14, (uint64_t)v12, (void (*)(_QWORD))type metadata accessor for Siri_Nlg_Dialog);
      sub_246EAC560(v23 + v14, (uint64_t)v8, (void (*)(_QWORD))type metadata accessor for Siri_Nlg_Dialog);
      v15 = *(int *)(v4 + 24);
      v16 = (uint64_t *)((char *)v12 + v15);
      v17 = *(uint64_t *)((char *)v12 + v15 + 8);
      v18 = (uint64_t *)((char *)v8 + v15);
      v19 = v18[1];
      if (v17)
      {
        if (!v19 || (*v16 == *v18 ? (v20 = v17 == v19) : (v20 = 0), !v20 && (sub_246EBE368() & 1) == 0))
        {
LABEL_18:
          sub_246EAC538((uint64_t)v8, type metadata accessor for Siri_Nlg_Dialog);
          sub_246EAC538((uint64_t)v12, type metadata accessor for Siri_Nlg_Dialog);
          return 0;
        }
      }
      else if (v19)
      {
        goto LABEL_18;
      }
      if ((sub_246EABD54(*v12, *v8) & 1) == 0)
        goto LABEL_18;
      sub_246EBDE7C();
      sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      if ((sub_246EBE08C() & 1) == 0)
        goto LABEL_18;
      sub_246EAC538((uint64_t)v8, type metadata accessor for Siri_Nlg_Dialog);
      sub_246EAC538((uint64_t)v12, type metadata accessor for Siri_Nlg_Dialog);
      v14 += v22;
      --v13;
    }
    while (v13);
  }
  return 1;
}

uint64_t sub_246EABD54(uint64_t a1, uint64_t a2)
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t result;
  int *v26;
  int *v27;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v4 = type metadata accessor for Siri_Nlg_Content(0);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v12 = (char *)&v32 - v11;
  v13 = *(_QWORD *)(a1 + 16);
  if (v13 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v13 && a1 != a2)
  {
    v14 = 0;
    v15 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    v32 = a2 + v15;
    v33 = a1 + v15;
    v16 = *(_QWORD *)(v10 + 72);
    while (1)
    {
      sub_246EAC560(v33 + v16 * v14, (uint64_t)v12, (void (*)(_QWORD))type metadata accessor for Siri_Nlg_Content);
      sub_246EAC560(v32 + v16 * v14, (uint64_t)v8, (void (*)(_QWORD))type metadata accessor for Siri_Nlg_Content);
      v17 = *(int *)(v4 + 24);
      v18 = v12[v17];
      v19 = v8[v17];
      if (v18 == 4)
      {
        if (v19 != 4)
          goto LABEL_26;
      }
      else if (v19 == 4 || v18 != v19)
      {
LABEL_26:
        sub_246EAC538((uint64_t)v8, type metadata accessor for Siri_Nlg_Content);
        sub_246EAC538((uint64_t)v12, type metadata accessor for Siri_Nlg_Content);
        return 0;
      }
      v21 = *(_QWORD *)v12;
      v22 = *(_QWORD *)v8;
      v23 = *(_QWORD *)(*(_QWORD *)v12 + 16);
      if (v23 != *(_QWORD *)(*(_QWORD *)v8 + 16))
        goto LABEL_26;
      if (v23)
        v24 = v21 == v22;
      else
        v24 = 1;
      if (!v24)
      {
        if (*(_DWORD *)(v21 + 32) != *(_DWORD *)(v22 + 32))
          goto LABEL_26;
        v26 = (int *)(v21 + 36);
        v27 = (int *)(v22 + 36);
        v28 = v23 - 1;
        while (v28)
        {
          v30 = *v26++;
          v29 = v30;
          v31 = *v27++;
          --v28;
          if (v29 != v31)
            goto LABEL_26;
        }
      }
      sub_246EBDE7C();
      sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
      if ((sub_246EBE08C() & 1) == 0)
        goto LABEL_26;
      ++v14;
      sub_246EAC538((uint64_t)v8, type metadata accessor for Siri_Nlg_Content);
      sub_246EAC538((uint64_t)v12, type metadata accessor for Siri_Nlg_Content);
      result = 1;
      if (v14 == v13)
        return result;
    }
  }
  return 1;
}

BOOL sub_246EABF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v3;
  int *v4;
  uint64_t v5;
  _BOOL8 result;
  int v7;
  int v8;
  int v9;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(_DWORD *)(a1 + 32) != *(_DWORD *)(a2 + 32))
    return 0;
  v3 = (int *)(a1 + 36);
  v4 = (int *)(a2 + 36);
  v5 = v2 - 1;
  do
  {
    result = v5 == 0;
    if (!v5)
      break;
    v8 = *v3++;
    v7 = v8;
    v9 = *v4++;
    --v5;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_246EABFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  char v23;
  BOOL v24;
  char v25;
  uint64_t v27;
  uint64_t v28;

  v4 = type metadata accessor for Siri_Nlg_DialogSwitch(0);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (uint64_t *)((char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6, v9);
  v12 = (uint64_t *)((char *)&v27 - v11);
  v13 = *(_QWORD *)(a1 + 16);
  if (v13 == *(_QWORD *)(a2 + 16))
  {
    if (v13 && a1 != a2)
    {
      v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      v27 = *(_QWORD *)(v10 + 72);
      v15 = v13 - 1;
      while (1)
      {
        sub_246EAC560(a1 + v14, (uint64_t)v12, (void (*)(_QWORD))type metadata accessor for Siri_Nlg_DialogSwitch);
        sub_246EAC560(a2 + v14, (uint64_t)v8, (void (*)(_QWORD))type metadata accessor for Siri_Nlg_DialogSwitch);
        v16 = *(int *)(v4 + 24);
        v17 = (uint64_t *)((char *)v12 + v16);
        v18 = *(uint64_t *)((char *)v12 + v16 + 8);
        v19 = (uint64_t *)((char *)v8 + v16);
        v20 = v19[1];
        if (v18)
        {
          if (!v20 || (*v17 == *v19 ? (v21 = v18 == v20) : (v21 = 0), !v21 && (sub_246EBE368() & 1) == 0))
          {
LABEL_22:
            sub_246EAC538((uint64_t)v8, type metadata accessor for Siri_Nlg_DialogSwitch);
            sub_246EAC538((uint64_t)v12, type metadata accessor for Siri_Nlg_DialogSwitch);
            goto LABEL_23;
          }
        }
        else if (v20)
        {
          goto LABEL_22;
        }
        if ((sub_246EABB60(*v12, *v8) & 1) == 0)
          goto LABEL_22;
        v28 = v15;
        sub_246EBDE7C();
        sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v22 = v28;
        v23 = sub_246EBE08C();
        sub_246EAC538((uint64_t)v8, type metadata accessor for Siri_Nlg_DialogSwitch);
        sub_246EAC538((uint64_t)v12, type metadata accessor for Siri_Nlg_DialogSwitch);
        v24 = v22 != 0;
        v15 = v22 - 1;
        v25 = v24;
        if ((v23 & 1) != 0)
        {
          v14 += v27;
          if ((v25 & 1) != 0)
            continue;
        }
        return v23 & 1;
      }
    }
    v23 = 1;
  }
  else
  {
LABEL_23:
    v23 = 0;
  }
  return v23 & 1;
}

uint64_t sub_246EAC214(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  char v29;
  BOOL v30;
  char v31;
  uint64_t v33;
  uint64_t v34;

  v4 = type metadata accessor for Siri_Nlg_CATFile(0);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (uint64_t *)((char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6, v9);
  v12 = (uint64_t *)((char *)&v33 - v11);
  v13 = *(_QWORD *)(a1 + 16);
  if (v13 == *(_QWORD *)(a2 + 16))
  {
    if (v13 && a1 != a2)
    {
      v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
      v33 = *(_QWORD *)(v10 + 72);
      v15 = v13 - 1;
      while (1)
      {
        sub_246EAC560(a1 + v14, (uint64_t)v12, (void (*)(_QWORD))type metadata accessor for Siri_Nlg_CATFile);
        sub_246EAC560(a2 + v14, (uint64_t)v8, (void (*)(_QWORD))type metadata accessor for Siri_Nlg_CATFile);
        v16 = *(int *)(v4 + 24);
        v17 = (uint64_t *)((char *)v12 + v16);
        v18 = *(uint64_t *)((char *)v12 + v16 + 8);
        v19 = (uint64_t *)((char *)v8 + v16);
        v20 = v19[1];
        if (v18)
        {
          if (!v20 || (*v17 == *v19 ? (v21 = v18 == v20) : (v21 = 0), !v21 && (sub_246EBE368() & 1) == 0))
          {
LABEL_31:
            sub_246EAC538((uint64_t)v8, type metadata accessor for Siri_Nlg_CATFile);
            sub_246EAC538((uint64_t)v12, type metadata accessor for Siri_Nlg_CATFile);
            goto LABEL_32;
          }
        }
        else if (v20)
        {
          goto LABEL_31;
        }
        v22 = *(int *)(v4 + 28);
        v23 = (uint64_t *)((char *)v12 + v22);
        v24 = *(uint64_t *)((char *)v12 + v22 + 8);
        v25 = (uint64_t *)((char *)v8 + v22);
        v26 = v25[1];
        if (v24)
        {
          if (!v26)
            goto LABEL_31;
          v27 = *v23 == *v25 && v24 == v26;
          if (!v27 && (sub_246EBE368() & 1) == 0)
            goto LABEL_31;
        }
        else if (v26)
        {
          goto LABEL_31;
        }
        if ((sub_246EABFF8(*v12, *v8) & 1) == 0)
          goto LABEL_31;
        v34 = v15;
        sub_246EBDE7C();
        sub_246EA3A30(&qword_25765B4B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE5BF10], MEMORY[0x24BE5BF20]);
        v28 = v34;
        v29 = sub_246EBE08C();
        sub_246EAC538((uint64_t)v8, type metadata accessor for Siri_Nlg_CATFile);
        sub_246EAC538((uint64_t)v12, type metadata accessor for Siri_Nlg_CATFile);
        v30 = v28 != 0;
        v15 = v28 - 1;
        v31 = v30;
        if ((v29 & 1) != 0)
        {
          v14 += v33;
          if ((v31 & 1) != 0)
            continue;
        }
        return v29 & 1;
      }
    }
    v29 = 1;
  }
  else
  {
LABEL_32:
    v29 = 0;
  }
  return v29 & 1;
}

uint64_t sub_246EAC46C(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t result;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;

  v2 = a1[2];
  if (v2 != a2[2])
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  result = a1[4];
  if (result != a2[4] || a1[5] != a2[5])
  {
    v7 = sub_246EBE368();
    result = 0;
    if ((v7 & 1) == 0)
      return result;
  }
  if (v2 == 1)
    return 1;
  v8 = a1 + 7;
  v9 = a2 + 7;
  v10 = 1;
  while (v10 < v2)
  {
    result = *(v8 - 1);
    if (result != *(v9 - 1) || *v8 != *v9)
    {
      result = sub_246EBE368();
      if ((result & 1) == 0)
        return 0;
    }
    ++v10;
    v8 += 2;
    v9 += 2;
    if (v2 == v10)
      return 1;
  }
  __break(1u);
  return result;
}

void sub_246EAC538(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_26_0(v2);
  OUTLINED_FUNCTION_24_0();
}

void sub_246EAC560(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v5;

  a3(0);
  OUTLINED_FUNCTION_33();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  OUTLINED_FUNCTION_24_0();
}

unint64_t sub_246EAC59C()
{
  unint64_t result;

  result = qword_25765B4E0;
  if (!qword_25765B4E0)
  {
    result = MEMORY[0x24956C6A0](&unk_246EBF914, &type metadata for Siri_Nlg_ContentType);
    atomic_store(result, (unint64_t *)&qword_25765B4E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Siri_Nlg_ContentType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 3) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Siri_Nlg_ContentType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246EAC6AC + 4 * byte_246EBEEA5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_246EAC6E0 + 4 * byte_246EBEEA0[v4]))();
}

uint64_t sub_246EAC6E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EAC6E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246EAC6F0);
  return result;
}

uint64_t sub_246EAC6FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246EAC704);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_246EAC708(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EAC710(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_246EAC71C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Siri_Nlg_ContentType()
{
  return &type metadata for Siri_Nlg_ContentType;
}

uint64_t sub_246EAC74C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246EAC75C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246EAC76C()
{
  return sub_246EACD48();
}

void sub_246EAC778(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v3;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    swift_retain();
  }
  else
  {
    OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_30(*(int *)(a3 + 24));
  }
  OUTLINED_FUNCTION_7_5();
}

uint64_t sub_246EAC7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = OUTLINED_FUNCTION_0_4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void sub_246EAC858(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_30(*(int *)(a3 + 24));
  OUTLINED_FUNCTION_7_5();
}

void sub_246EAC8B4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_28(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24));
  v7 = *(int *)(a3 + 24);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_11_1();
}

void sub_246EAC93C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_48();
  *v3 = v4;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_28(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32));
  *(_OWORD *)(v2 + *(int *)(v0 + 24)) = *(_OWORD *)(v1 + *(int *)(v0 + 24));
  OUTLINED_FUNCTION_11_1();
}

void sub_246EAC98C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_48();
  *v2 = v3;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_28(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40));
  v5 = *(int *)(v0 + 24);
  v6 = (_QWORD *)((char *)v2 + v5);
  v7 = (uint64_t *)(v1 + v5);
  v9 = *v7;
  v8 = v7[1];
  *v6 = v9;
  v6[1] = v8;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_1();
}

uint64_t sub_246EAC9F4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246EACA04()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_QWORD *sub_246EACA14(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (_QWORD *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_246EBDE7C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    *((_BYTE *)v7 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v7;
}

uint64_t sub_246EACAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_246EBDE7C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_246EACB10(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_246EACB9C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_246EACC24(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_246EACC9C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_246EACD1C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_246EACD2C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_246EACD3C()
{
  return sub_246EACD48();
}

uint64_t sub_246EACD48()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246EBDE7C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_246EACDC4(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_246EBDE7C();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (uint64_t *)((char *)v7 + v13);
    v16 = (uint64_t *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = (uint64_t *)((char *)v7 + v14);
    v19 = (uint64_t *)((char *)a2 + v14);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t sub_246EACE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_246EBDE7C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_246EACF0C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (_QWORD *)((char *)a1 + v11);
  v14 = (_QWORD *)((char *)a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (_QWORD *)((char *)a1 + v12);
  v17 = (_QWORD *)((char *)a2 + v12);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_246EACFBC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v13);
  v15 = (_QWORD *)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_246EAD090(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v10) = *(_OWORD *)((char *)a2 + v10);
  return a1;
}

_QWORD *sub_246EAD110(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_246EBDE7C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  v15 = a3[7];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246EAD1BC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void __swift_get_extra_inhabitant_index_3Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    v6 = OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_5_4(a1 + *(int *)(a3 + 20), a2, v6);
  }
}

uint64_t sub_246EAD21C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void __swift_store_extra_inhabitant_index_4Tm()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_47();
  if (v3)
  {
    *v1 = (v0 - 1);
    OUTLINED_FUNCTION_8_2();
  }
  else
  {
    v4 = v2;
    v5 = OUTLINED_FUNCTION_0_4();
    OUTLINED_FUNCTION_6_5((uint64_t)v1 + *(int *)(v4 + 20), v0, v0, v5);
  }
}

uint64_t sub_246EAD278()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246EBDE7C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_246EAD300()
{
  unint64_t result;

  result = qword_25765B748;
  if (!qword_25765B748)
  {
    result = MEMORY[0x24956C6A0](&unk_246EBF8EC, &type metadata for Siri_Nlg_ContentType);
    atomic_store(result, (unint64_t *)&qword_25765B748);
  }
  return result;
}

unint64_t sub_246EAD340()
{
  unint64_t result;

  result = qword_25765B750;
  if (!qword_25765B750)
  {
    result = MEMORY[0x24956C6A0](&unk_246EBF8AC, &type metadata for Siri_Nlg_ContentType);
    atomic_store(result, (unint64_t *)&qword_25765B750);
  }
  return result;
}

unint64_t sub_246EAD380()
{
  unint64_t result;

  result = qword_25765B758;
  if (!qword_25765B758)
  {
    result = MEMORY[0x24956C6A0](&unk_246EBF874, &type metadata for Siri_Nlg_ContentType);
    atomic_store(result, (unint64_t *)&qword_25765B758);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_246EBDE7C();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_246EBE08C();
}

uint64_t OUTLINED_FUNCTION_5_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_6_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return sub_246EBDEDC();
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(0);
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_246EBDE70();
}

uint64_t OUTLINED_FUNCTION_15_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v1, v3 + a1, v2);
}

uint64_t OUTLINED_FUNCTION_16_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_17_2()
{
  return sub_246EBDE64();
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return sub_246EBDFB4();
}

uint64_t OUTLINED_FUNCTION_22_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return sub_246EBE368();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_25_1(uint64_t a1)
{
  uint64_t *v1;

  sub_246EABB38(a1, v1);
}

uint64_t OUTLINED_FUNCTION_26_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_28@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_30@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + a1);
  v4 = v3[1];
  *v1 = *v3;
  v1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_32(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_34()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_35@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return type metadata accessor for Siri_Nlg_Capabilities(0);
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if ((unint64_t)*v0 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_246EBDE64();
}

uint64_t OUTLINED_FUNCTION_45()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t OUTLINED_FUNCTION_51()
{
  return sub_246EBDEDC();
}

uint64_t OUTLINED_FUNCTION_53()
{
  uint64_t v0;

  return v0;
}

void sub_246EAD6E4()
{
  sub_246EBE3D4();
  sub_246EAD340();
  OUTLINED_FUNCTION_5_5();
  sub_246EBE3EC();
  OUTLINED_FUNCTION_2_7();
}

uint64_t sub_246EAD728()
{
  return sub_246EAD828();
}

void sub_246EAD734(char a1)
{
  sub_246EAD8B0(0, a1);
}

uint64_t sub_246EAD740(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_0_5();
  else
    OUTLINED_FUNCTION_3_5();
  sub_246EBE104();
  return swift_bridgeObjectRelease();
}

uint64_t sub_246EAD784()
{
  sub_246EBE104();
  return swift_bridgeObjectRelease();
}

void sub_246EAD7E8()
{
  sub_246EBE3D4();
  sub_246EAD340();
  OUTLINED_FUNCTION_5_5();
  sub_246EBE3EC();
  OUTLINED_FUNCTION_2_7();
}

uint64_t sub_246EAD828()
{
  sub_246EBE3D4();
  sub_246EBE104();
  swift_bridgeObjectRelease();
  return sub_246EBE3EC();
}

void sub_246EAD8B0(uint64_t a1, char a2)
{
  sub_246EBE3D4();
  if (a2)
    OUTLINED_FUNCTION_0_5();
  else
    OUTLINED_FUNCTION_3_5();
  sub_246EBE104();
  swift_bridgeObjectRelease();
  sub_246EBE3EC();
  OUTLINED_FUNCTION_2_7();
}

uint64_t NLGEntityType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1701670760;
  if (*v0 != 1)
    v1 = 0x656E6F6870;
  if (*v0)
    return v1;
  else
    return 7496035;
}

_QWORD *static NLGDialogGenerators.alternativeQuestion(between:and:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  _QWORD *result;
  _QWORD v7[5];
  _QWORD v8[5];

  sub_246EAD9D8(a1, (uint64_t)v8);
  sub_246EAD9D8(a2, (uint64_t)v7);
  v5 = type metadata accessor for VerbPhraseQuestionGenerator();
  OUTLINED_FUNCTION_4_7();
  result = sub_246EA52BC(v8, v7, (uint64_t)sub_246EA52B8, 0);
  a3[3] = v5;
  a3[4] = &off_25183B418;
  *a3 = result;
  return result;
}

uint64_t sub_246EAD9D8(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for NLGVerbPhrase(a2, a1);
  return a2;
}

_QWORD *static NLGDialogGenerators.alternativeQuestion(between:and:)@<X0>(char *a1@<X0>, char *a2@<X1>, _QWORD *a3@<X8>)
{
  char v4;
  uint64_t v5;
  _QWORD *result;
  char v7;
  char v8;

  v4 = *a2;
  v8 = *a1;
  v7 = v4;
  v5 = type metadata accessor for ExecutionDestinationQuestionGenerator();
  OUTLINED_FUNCTION_4_7();
  result = sub_246EA54E4(&v8, &v7, (uint64_t)sub_246EA52B8, 0);
  a3[3] = v5;
  a3[4] = &off_25183B408;
  *a3 = result;
  return result;
}

uint64_t NLGVerbPhrase.dialog.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_246EA297C(v1, a1);
}

uint64_t NLGVerbPhrase.init(dialog:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246EA00C4(a1, a2);
}

void NLGExecutionDestination.entityType.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

SiriNaturalLanguageGeneration::NLGExecutionDestination __swiftcall NLGExecutionDestination.init(entityType:)(SiriNaturalLanguageGeneration::NLGExecutionDestination entityType)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)entityType.entityType;
  return entityType;
}

SiriNaturalLanguageGeneration::NLGEntityType_optional __swiftcall NLGEntityType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriNaturalLanguageGeneration::NLGEntityType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_246EBE320();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_246EADB08(unsigned __int8 *a1, char *a2)
{
  sub_246EA88AC(*a1, *a2);
}

uint64_t sub_246EADB14()
{
  return sub_246EAD728();
}

uint64_t sub_246EADB1C()
{
  return sub_246EAD784();
}

uint64_t sub_246EADB24()
{
  return sub_246EAD828();
}

SiriNaturalLanguageGeneration::NLGEntityType_optional sub_246EADB2C(Swift::String *a1)
{
  return NLGEntityType.init(rawValue:)(*a1);
}

uint64_t sub_246EADB38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = NLGEntityType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void static NLGDialogGeneratorError.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_246EADB9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  int v5;
  char v7;

  if (v5)
  {
    v7 = 0;
  }
  else if (v0 == v2 && v1 == v3)
  {
    LOBYTE(v5) = 0;
    v4 = 0;
    v7 = 1;
  }
  else
  {
    v7 = sub_246EBE368();
    LOBYTE(v5) = v4;
  }
  sub_246EADCA8(v2, v3, v5);
  sub_246EADCA8(v0, v1, v4);
  sub_246EADCC0(v0, v1, v4);
  sub_246EADCC0(v2, v3, v5);
  return v7 & 1;
}

uint64_t sub_246EADCA8(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_246EADCC0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_246EADCDC()
{
  unint64_t result;

  result = qword_25765B760;
  if (!qword_25765B760)
  {
    result = MEMORY[0x24956C6A0](&protocol conformance descriptor for NLGEntityType, &type metadata for NLGEntityType);
    atomic_store(result, (unint64_t *)&qword_25765B760);
  }
  return result;
}

uint64_t dispatch thunk of NLGDialogGenerator.generate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void type metadata accessor for NLGDialogGenerators()
{
  OUTLINED_FUNCTION_1_6();
}

uint64_t initializeBufferWithCopyOfBuffer for NLGCATIdentifier(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t initializeWithCopy for NLGVerbPhrase(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for NLGVerbPhrase(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NLGVerbPhrase(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGVerbPhrase(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for NLGVerbPhrase(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for NLGVerbPhrase()
{
  OUTLINED_FUNCTION_1_6();
}

void type metadata accessor for NLGExecutionDestination()
{
  OUTLINED_FUNCTION_1_6();
}

uint64_t getEnumTagSinglePayload for NLGDialogScorerType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 2) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s29SiriNaturalLanguageGeneration13NLGEntityTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246EAE100 + 4 * byte_246EBF969[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246EAE134 + 4 * byte_246EBF964[v4]))();
}

uint64_t sub_246EAE134(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EAE13C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246EAE144);
  return result;
}

uint64_t sub_246EAE150(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246EAE158);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246EAE15C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EAE164(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for NLGEntityType()
{
  OUTLINED_FUNCTION_1_6();
}

uint64_t destroy for NLGDialogGeneratorError(uint64_t a1)
{
  return sub_246EADCC0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s29SiriNaturalLanguageGeneration23NLGDialogGeneratorErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_246EADCA8(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for NLGDialogGeneratorError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_246EADCA8(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_246EADCC0(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NLGDialogGeneratorError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_246EADCC0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGDialogGeneratorError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3)
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

uint64_t storeEnumTagSinglePayload for NLGDialogGeneratorError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_246EAE308(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_246EAE310(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

void type metadata accessor for NLGDialogGeneratorError()
{
  OUTLINED_FUNCTION_1_6();
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_246EBE074();
}

uint64_t NLGCATIdentifier.identifier.getter()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_bridgeObjectRetain();
  sub_246EBE11C();
  swift_bridgeObjectRetain();
  sub_246EBE11C();
  swift_bridgeObjectRelease();
  return v2;
}

SiriNaturalLanguageGeneration::NLGCATIdentifier __swiftcall NLGCATIdentifier.init(_:_:)(Swift::String a1, Swift::String a2)
{
  Swift::String *v2;
  SiriNaturalLanguageGeneration::NLGCATIdentifier result;

  *v2 = a1;
  v2[1] = a2;
  result.useCase = a2;
  result.family = a1;
  return result;
}

uint64_t NLGCATIdentifier.family.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_22_0();
  return v1;
}

uint64_t NLGCATIdentifier.useCase.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_22_0();
  return v1;
}

SiriNaturalLanguageGeneration::NLGCATIdentifier_optional __swiftcall NLGCATIdentifier.init(_:)(Swift::String a1)
{
  uint64_t *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v4;
  _QWORD *v5;
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  _QWORD v25[2];
  SiriNaturalLanguageGeneration::NLGCATIdentifier_optional result;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v4 = v1;
  v25[0] = 35;
  v25[1] = 0xE100000000000000;
  v24[2] = v25;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)sub_246EAE7D0(0x7FFFFFFFFFFFFFFFLL, 1u, sub_246EA7448, (uint64_t)v24, countAndFlagsBits, (unint64_t)object);
  swift_bridgeObjectRelease();
  if (v5[2] == 2)
  {
    v6 = v5[4];
    v7 = v5[5];
    v8 = v5[6];
    v9 = v5[7];
    swift_bridgeObjectRetain();
    v10 = MEMORY[0x24956C058](v6, v7, v8, v9);
    v12 = v11;
    v13 = swift_bridgeObjectRelease();
    if (v5[2] < 2uLL)
    {
      __break(1u);
    }
    else
    {
      v17 = v5[8];
      v18 = v5[9];
      v19 = v5[10];
      v20 = v5[11];
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_26();
      v21 = MEMORY[0x24956C058](v17, v18, v19, v20);
      v23 = v22;
      v13 = swift_bridgeObjectRelease();
      *v4 = v10;
      v4[1] = v12;
      v4[2] = v21;
      v4[3] = v23;
    }
  }
  else
  {
    v13 = OUTLINED_FUNCTION_26();
    *(_OWORD *)v4 = 0u;
    *((_OWORD *)v4 + 1) = 0u;
  }
  result.value.useCase._object = v16;
  result.value.useCase._countAndFlagsBits = v15;
  result.value.family._object = v14;
  result.value.family._countAndFlagsBits = v13;
  return result;
}

uint64_t NLGCATIdentifier.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_246EBE104();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_0();
  sub_246EBE104();
  return swift_bridgeObjectRelease();
}

uint64_t static NLGCATIdentifier.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_246EBE368(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
      return 1;
    else
      return sub_246EBE368();
  }
  return result;
}

uint64_t NLGCATIdentifier.hashValue.getter()
{
  sub_246EBE3D4();
  swift_bridgeObjectRetain();
  sub_246EBE104();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22_0();
  sub_246EBE104();
  OUTLINED_FUNCTION_26();
  return sub_246EBE3EC();
}

uint64_t sub_246EAE70C()
{
  sub_246EBE3D4();
  swift_bridgeObjectRetain();
  sub_246EBE104();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_246EBE104();
  swift_bridgeObjectRelease();
  return sub_246EBE3EC();
}

uint64_t sub_246EAE790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return sub_246EBE368() & 1;
}

uint64_t sub_246EAE7D0(uint64_t a1, unsigned __int8 a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
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
  _QWORD *v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    goto LABEL_40;
  }
  v10 = OUTLINED_FUNCTION_6_6();
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  v42 = v10 + 16;
  v47 = OUTLINED_FUNCTION_6_6();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_246EAEBA8(v30 | (v11 << 16), v47, a2 & 1, v10);
    OUTLINED_FUNCTION_3();
    v13 = *(_QWORD *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_36:
    swift_release();
    return v13;
  }
  v41 = a1;
  v48 = 4 * v12;
  v13 = MEMORY[0x24BEE4AF8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_246EBE170();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_3();
      return v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      v14 = OUTLINED_FUNCTION_2_8();
      goto LABEL_21;
    }
    v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14)
        goto LABEL_38;
      v21 = OUTLINED_FUNCTION_4_8();
      v43 = v23;
      v44 = v22;
      v45 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_3_6();
        v13 = v28;
      }
      v25 = *(_QWORD *)(v13 + 16);
      if (v25 >= *(_QWORD *)(v13 + 24) >> 1)
      {
        OUTLINED_FUNCTION_3_6();
        v13 = v29;
      }
      *(_QWORD *)(v13 + 16) = v25 + 1;
      v26 = (_QWORD *)(v13 + 32 * v25);
      v26[4] = v21;
      v26[5] = v45;
      v26[6] = v44;
      v26[7] = v43;
      *(_QWORD *)v42 = v13;
    }
    v27 = OUTLINED_FUNCTION_2_8();
    v14 = v27;
    *(_QWORD *)(v47 + 16) = v27;
    if ((v20 & 1) == 0 && *(_QWORD *)(v13 + 16) == v41)
      break;
    v15 = v27;
    v16 = v27;
LABEL_21:
    if (v48 == v14 >> 14)
      goto LABEL_30;
  }
  v16 = v27;
  v15 = v27;
LABEL_30:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_3();
LABEL_35:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_36;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = OUTLINED_FUNCTION_4_8();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    OUTLINED_FUNCTION_3();
    sub_246EB6E78();
    v38 = *(_QWORD *)(*(_QWORD *)v42 + 16);
    sub_246EB6EF0(v38);
    v13 = *(_QWORD *)v42;
    *(_QWORD *)(v13 + 16) = v38 + 1;
    v39 = (_QWORD *)(v13 + 32 * v38);
    v39[4] = v31;
    v39[5] = v33;
    v39[6] = v35;
    v39[7] = v37;
    *(_QWORD *)v42 = v13;
    goto LABEL_35;
  }
LABEL_38:
  OUTLINED_FUNCTION_5_6();
LABEL_40:
  result = sub_246EBE2D8();
  __break(1u);
  return result;
}

uint64_t sub_246EAEBA8(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
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
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_246EBE188();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    sub_246EB6E78();
    v14 = *(_QWORD *)(*(_QWORD *)(a4 + 16) + 16);
    sub_246EB6EF0(v14);
    v15 = *(_QWORD *)(a4 + 16);
    *(_QWORD *)(v15 + 16) = v14 + 1;
    v16 = (_QWORD *)(v15 + 32 * v14);
    v16[4] = v7;
    v16[5] = v9;
    v16[6] = v11;
    v16[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_246EBE2D8();
  __break(1u);
  return result;
}

uint64_t sub_246EAECAC(uint64_t *a1, uint64_t *a2)
{
  return sub_246EAE790(*a1, a1[1], *a2, a2[1]) & 1;
}

unint64_t sub_246EAECD8()
{
  unint64_t result;

  result = qword_25765B768;
  if (!qword_25765B768)
  {
    result = MEMORY[0x24956C6A0](&protocol conformance descriptor for NLGCATIdentifier, &type metadata for NLGCATIdentifier);
    atomic_store(result, (unint64_t *)&qword_25765B768);
  }
  return result;
}

uint64_t dispatch thunk of NLGDialogProvider.getDialogs(templateDir:catTemplate:locale:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of NLGDialogProvider.getDialogs(templateDir:catTemplates:locale:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of NLGDialogProvider.getDialogs(templateDir:catTemplate:locale:parameters:catGlobals:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

unint64_t destroy for NLGDialogProviderError(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s29SiriNaturalLanguageGeneration22NLGDialogProviderErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for NLGDialogProviderError(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for NLGDialogProviderError(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGDialogProviderError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for NLGDialogProviderError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_246EAEF70(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_246EAEF88(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for NLGDialogProviderError()
{
  return &type metadata for NLGDialogProviderError;
}

uint64_t destroy for NLGCATIdentifier()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for NLGCATIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NLGCATIdentifier(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for NLGCATIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGCATIdentifier(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
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

uint64_t storeEnumTagSinglePayload for NLGCATIdentifier(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NLGCATIdentifier()
{
  return &type metadata for NLGCATIdentifier;
}

uint64_t sub_246EAF168()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_246EAF18C()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return sub_246EBE110();
}

void OUTLINED_FUNCTION_3_6()
{
  sub_246EB11FC();
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  return sub_246EBE188();
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return swift_allocObject();
}

uint64_t NLGDialogSelector.select(from:defaultDialog:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  __int128 v6;

  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t))(a3 + 8))(&v6, a1, a2, a3);
  return sub_246EA00C4(&v6, a4);
}

_QWORD *sub_246EAF328()
{
  _QWORD *result;

  type metadata accessor for UserDefaultsDialogRecorder();
  swift_allocObject();
  result = sub_246EB5C84(50, 0x6948676F6C616944, 0xED000079726F7473);
  qword_25765B770 = (uint64_t)result;
  return result;
}

uint64_t static NLGDialogSelectors.randomOriginal()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9[5];
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;

  v11 = MEMORY[0x24BEE3A00];
  v12 = MEMORY[0x24BEE3A08];
  OUTLINED_FUNCTION_2_9();
  v1 = static NLGDialogSelectors.randomOriginal(randomNumberGenerator:dialogRecorder:)((uint64_t)v10, (uint64_t)v9, v0);
  OUTLINED_FUNCTION_4_9(v1, &qword_25765B778, v2, v3, v4, v5, v6, v7, v9[0]);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

uint64_t static NLGDialogSelectors.randomOriginal(randomNumberGenerator:dialogRecorder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[5];
  _BYTE v11[40];

  sub_246EA297C(a1, (uint64_t)v11);
  sub_246EAF7E8(a2, (uint64_t)&v8);
  if (v9)
  {
    sub_246EA00C4(&v8, (uint64_t)v10);
  }
  else
  {
    if (qword_25765A868 != -1)
      swift_once();
    v5 = qword_25765B770;
    v10[3] = type metadata accessor for UserDefaultsDialogRecorder();
    v10[4] = &off_25183C048;
    v10[0] = v5;
    swift_retain();
    sub_246EA2924((uint64_t)&v8, &qword_25765B778);
  }
  v6 = type metadata accessor for RandomOriginalDialogSelector();
  OUTLINED_FUNCTION_4_3();
  result = sub_246E9E400((uint64_t)v11, (uint64_t)v10);
  a3[3] = v6;
  a3[4] = (uint64_t)&off_25183B330;
  *a3 = result;
  return result;
}

uint64_t static NLGDialogSelectors.highestScoring(using:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[5];

  v10[3] = type metadata accessor for IdentifiedDialogOrFirstSelector();
  v10[4] = &off_25183B320;
  v10[0] = swift_initStaticObject();
  type metadata accessor for HighestScoringDialogSelector();
  v4 = OUTLINED_FUNCTION_4_3();
  sub_246EAF830((uint64_t)v10, v4 + 16);
  sub_246EA297C(a1, (uint64_t)v10);
  type metadata accessor for DialogScorerSelector();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_6_7();
  v8 = OUTLINED_FUNCTION_3_7((uint64_t)v10, v5, v6, v7, (uint64_t)&off_25183B2F8, (uint64_t)&unk_25183BDA8, (uint64_t)sub_246EAFB70);
  result = OUTLINED_FUNCTION_5_7((uint64_t)&off_25183B308);
  *a2 = v8;
  return result;
}

uint64_t static NLGDialogSelectors.highestScoringOriginal(using:)()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10[6];

  OUTLINED_FUNCTION_2_9();
  v2 = static NLGDialogSelectors.highestScoringOriginal(using:dialogRecorder:)(v0, (uint64_t)v10, v1);
  return OUTLINED_FUNCTION_4_9(v2, &qword_25765B778, v3, v4, v5, v6, v7, v8, v10[0]);
}

uint64_t static NLGDialogSelectors.highestScoringOriginal(using:dialogRecorder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
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
  uint64_t result;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  _UNKNOWN **v23;

  sub_246EAF7E8(a2, (uint64_t)&v19);
  if (v20)
  {
    sub_246EA00C4(&v19, (uint64_t)&v21);
  }
  else
  {
    if (qword_25765A868 != -1)
      swift_once();
    v5 = qword_25765B770;
    v22 = type metadata accessor for UserDefaultsDialogRecorder();
    v23 = &off_25183C048;
    *(_QWORD *)&v21 = v5;
    v6 = swift_retain();
    OUTLINED_FUNCTION_4_9(v6, &qword_25765B778, v7, v8, v9, v10, v11, v12, v19);
  }
  type metadata accessor for HighestScoringOriginalDialogSelector();
  v13 = OUTLINED_FUNCTION_4_3();
  sub_246EA00C4(&v21, v13 + 16);
  *(_BYTE *)(v13 + 56) = 0;
  sub_246EA297C(a1, (uint64_t)&v21);
  type metadata accessor for DialogScorerSelector();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_6_7();
  v17 = OUTLINED_FUNCTION_3_7((uint64_t)&v21, v14, v15, v16, (uint64_t)&off_25183B2E8, (uint64_t)&unk_25183BD80, (uint64_t)sub_246EA29D0);
  result = OUTLINED_FUNCTION_5_7((uint64_t)&off_25183B308);
  *a3 = v17;
  return result;
}

uint64_t static NLGDialogSelectorError.== infix(_:_:)()
{
  return 1;
}

uint64_t NLGDialogSelectorError.hash(into:)()
{
  return sub_246EBE3E0();
}

uint64_t NLGDialogSelectorError.hashValue.getter()
{
  sub_246EBE3D4();
  sub_246EBE3E0();
  return sub_246EBE3EC();
}

uint64_t sub_246EAF784()
{
  return NLGDialogSelectorError.hashValue.getter();
}

uint64_t sub_246EAF798()
{
  return NLGDialogSelectorError.hash(into:)();
}

uint64_t sub_246EAF7AC()
{
  sub_246EBE3D4();
  sub_246EBE3E0();
  return sub_246EBE3EC();
}

uint64_t sub_246EAF7E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B778);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EAF830(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765AEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EAF878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t a5, uint64_t a6, uint64_t a7)
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
  __int128 v24;
  _QWORD v25[5];
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];

  v29[3] = a4(0);
  v29[4] = a5;
  v29[0] = a2;
  sub_246EA297C(a1, a3 + 16);
  sub_246EA297C((uint64_t)v29, a3 + 56);
  sub_246EA297C(a1, (uint64_t)v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B788);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B790);
  if (swift_dynamicCast())
  {
    sub_246EA00C4(&v24, (uint64_t)v26);
    v12 = v27;
    v13 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v13 + 8))(v25, v12, v13);
    *(_BYTE *)(a3 + 104) = v25[0];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  }
  else
  {
    OUTLINED_FUNCTION_2_9();
    OUTLINED_FUNCTION_4_9(v14, &qword_25765B798, v15, v16, v17, v18, v19, v20, v24);
    *(_BYTE *)(a3 + 104) = 2;
  }
  v21 = OUTLINED_FUNCTION_4_3();
  *(_DWORD *)(v21 + 16) = 36;
  type metadata accessor for SELFLogger();
  OUTLINED_FUNCTION_4_3();
  v22 = sub_246EB72AC((uint64_t)&unk_25765BF88, 0, (uint64_t)sub_246EB7198, 0, 36, a7, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1(a1);
  *(_QWORD *)(a3 + 96) = v22;
  return a3;
}

unint64_t sub_246EAFA0C()
{
  unint64_t result;

  result = qword_25765B780;
  if (!qword_25765B780)
  {
    result = MEMORY[0x24956C6A0](&protocol conformance descriptor for NLGDialogSelectorError, &type metadata for NLGDialogSelectorError);
    atomic_store(result, (unint64_t *)&qword_25765B780);
  }
  return result;
}

uint64_t dispatch thunk of NLGDialogSelector.select(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of NLGDialogSelector.select(from:defaultDialog:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

ValueMetadata *type metadata accessor for NLGDialogSelectors()
{
  return &type metadata for NLGDialogSelectors;
}

uint64_t getEnumTagSinglePayload for NLGDialogSelectorError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for NLGDialogSelectorError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_246EAFB0C + 4 * asc_246EBFC80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246EAFB2C + 4 * byte_246EBFC85[v4]))();
}

_BYTE *sub_246EAFB0C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246EAFB2C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246EAFB34(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246EAFB3C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246EAFB44(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246EAFB4C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for NLGDialogSelectorError()
{
  return &type metadata for NLGDialogSelectorError;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return swift_deallocObject();
}

double OUTLINED_FUNCTION_2_9()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_3_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;

  return sub_246EAF878(a1, v8, v9, v7, a5, a6, a7);
}

uint64_t OUTLINED_FUNCTION_4_9(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_246EA2924((uint64_t)&a9, a2);
}

uint64_t OUTLINED_FUNCTION_5_7@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return swift_retain();
}

uint64_t sub_246EAFBC4()
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

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B7A8);
  MEMORY[0x24BDAC7A8](v0, v1);
  OUTLINED_FUNCTION_0_6();
  v4 = v3 - v2;
  v5 = sub_246EAFD08();
  if (!v6)
    return 0;
  v7 = v5;
  sub_246EBDD50();
  v8 = sub_246EBDD44();
  if (__swift_getEnumTagSinglePayload(v4, 1, v8) == 1)
  {
    OUTLINED_FUNCTION_16();
    sub_246EA2924(v4, &qword_25765B7A8);
    return 0;
  }
  else
  {
    sub_246EBDD20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v4, v8);
    swift_bridgeObjectRetain();
    sub_246EBE11C();
    OUTLINED_FUNCTION_16();
    swift_bridgeObjectRetain();
    sub_246EBE11C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16();
    return v7;
  }
}

uint64_t sub_246EAFD08()
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

  v0 = sub_246EBDD74();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  OUTLINED_FUNCTION_0_6();
  v5 = v4 - v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B7A0);
  MEMORY[0x24BDAC7A8](v6, v7);
  OUTLINED_FUNCTION_0_6();
  v10 = v9 - v8;
  sub_246EBDD80();
  sub_246EBDD68();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v5, v0);
  v11 = sub_246EBDD2C();
  if (__swift_getEnumTagSinglePayload(v10, 1, v11) == 1)
  {
    sub_246EA2924(v10, &qword_25765B7A0);
    return 0;
  }
  else
  {
    v12 = sub_246EBDD20();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  }
  return v12;
}

uint64_t sub_246EAFE38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v4 = sub_246EB5650(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * v4);
  swift_bridgeObjectRetain();
  return v6;
}

double sub_246EAFE8C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_246EB5650(a1, a2), (v7 & 1) != 0))
  {
    sub_246EB19E0(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

double NLGDialogBuilder.__allocating_init()()
{
  _OWORD *v0;
  double result;

  v0 = (_OWORD *)OUTLINED_FUNCTION_4_3();
  result = 0.0;
  v0[1] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[4] = 0u;
  v0[5] = 0u;
  v0[6] = 0u;
  v0[7] = 0u;
  return result;
}

double sub_246EAFF0C@<D0>(_OWORD *a1@<X8>)
{
  return NLGDialog.source.getter(a1);
}

double NLGDialog.source.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_246EAFF30()
{
  return 0;
}

uint64_t NLGDialogContent.sourceKeywords.getter()
{
  return 0;
}

uint64_t static NLGDialogSource.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  uint64_t result;
  BOOL v13;
  char v14;

  v2 = a1[2];
  v4 = a1[3];
  v3 = a1[4];
  v5 = a1[5];
  v6 = a2[2];
  v7 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v10 = *a1 == *a2 && a1[1] == a2[1];
  if (v10 || (v11 = sub_246EBE368(), result = 0, (v11 & 1) != 0))
  {
    v13 = v2 == v6 && v4 == v7;
    if (v13 || (v14 = sub_246EBE368(), result = 0, (v14 & 1) != 0))
    {
      if (v3 == v8 && v5 == v9)
        return 1;
      else
        return sub_246EBE368();
    }
  }
  return result;
}

uint64_t sub_246EB002C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return OUTLINED_FUNCTION_1_8();
}

uint64_t sub_246EB0038(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return OUTLINED_FUNCTION_1_8();
}

uint64_t sub_246EB0044(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return OUTLINED_FUNCTION_1_8();
}

uint64_t sub_246EB0050(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return OUTLINED_FUNCTION_1_8();
}

uint64_t sub_246EB005C@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1[10];
  v3 = v1[11];
  v4 = v1[12];
  v5 = v1[13];
  v6 = v1[14];
  v7 = v1[15];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  return sub_246EB19A4(v2, v3);
}

uint64_t sub_246EB0078(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(v1 + 80);
  v2 = *(_QWORD *)(v1 + 88);
  v4 = a1[1];
  *(_OWORD *)(v1 + 80) = *a1;
  *(_OWORD *)(v1 + 96) = v4;
  *(_OWORD *)(v1 + 112) = a1[2];
  return sub_246EB0BE0(v3, v2);
}

double NLGDialogBuilder.init()()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  v0[6] = 0u;
  v0[7] = 0u;
  v0[4] = 0u;
  v0[5] = 0u;
  v0[2] = 0u;
  v0[3] = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t sub_246EB00B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
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
  double v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
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
  double v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  __int128 v76;
  uint64_t v77;

  v4 = sub_246EAFE8C(25705, 0xE200000000000000, a1, &v76);
  if (v77)
  {
    if (OUTLINED_FUNCTION_0_7())
    {
      v5 = v72;
      v6 = v74;
      goto LABEL_6;
    }
  }
  else
  {
    OUTLINED_FUNCTION_11_2(v1, &qword_25765B7B0, v2, v3, v4);
  }
  v5 = 0;
  v6 = 0xE000000000000000;
LABEL_6:
  swift_bridgeObjectRetain();
  sub_246EB002C(v5, v6);
  swift_bridgeObjectRelease();
  v10 = OUTLINED_FUNCTION_25_2(0x746E65746E6F63, &v76);
  if (!v77)
  {
    OUTLINED_FUNCTION_11_2(v7, &qword_25765B7B0, v8, v9, v10);
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B7B8);
  v11 = OUTLINED_FUNCTION_0_7();
  if ((v11 & 1) == 0)
  {
LABEL_12:
    v25 = MEMORY[0x24BEE4AF8];
    goto LABEL_25;
  }
  v22 = OUTLINED_FUNCTION_8_3(v11, v12, v13, v14, v15, v16, v17, v18, v72, v74, v76);
  if (v77)
  {
    if (OUTLINED_FUNCTION_0_7())
    {
      v23 = v72;
      v24 = v74;
      goto LABEL_15;
    }
  }
  else
  {
    OUTLINED_FUNCTION_11_2(v19, &qword_25765B7B0, v20, v21, v22);
  }
  v23 = 0;
  v24 = 0xE000000000000000;
LABEL_15:
  sub_246EB0AD0();
  v25 = v26;
  v27 = *(_QWORD *)(v26 + 16);
  if (v27 >= *(_QWORD *)(v26 + 24) >> 1)
  {
    OUTLINED_FUNCTION_6_8();
    v25 = v67;
  }
  *(_QWORD *)(v25 + 16) = v27 + 1;
  v28 = v25 + 16 * v27;
  *(_QWORD *)(v28 + 32) = v23;
  *(_QWORD *)(v28 + 40) = v24;
  OUTLINED_FUNCTION_10_2(0x6B61657073, &v76);
  v29 = swift_bridgeObjectRelease();
  if (!v77)
  {
    OUTLINED_FUNCTION_11_2(v29, &qword_25765B7B0, v30, v31);
    goto LABEL_21;
  }
  if (!OUTLINED_FUNCTION_0_7())
  {
LABEL_21:
    v32 = 0;
    v33 = 0xE000000000000000;
    goto LABEL_22;
  }
  v32 = v72;
  v33 = v74;
LABEL_22:
  v34 = *(_QWORD *)(v25 + 16);
  if (v34 >= *(_QWORD *)(v25 + 24) >> 1)
  {
    OUTLINED_FUNCTION_6_8();
    v25 = v68;
  }
  *(_QWORD *)(v25 + 16) = v34 + 1;
  v35 = v25 + 16 * v34;
  *(_QWORD *)(v35 + 32) = v32;
  *(_QWORD *)(v35 + 40) = v33;
LABEL_25:
  v39 = OUTLINED_FUNCTION_25_2(0x6E6F6974706163, &v76);
  if (!v77)
  {
    OUTLINED_FUNCTION_11_2(v36, &qword_25765B7B0, v37, v38, v39);
    goto LABEL_45;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B7B8);
  v40 = OUTLINED_FUNCTION_0_7();
  if ((v40 & 1) != 0)
  {
    v51 = OUTLINED_FUNCTION_8_3(v40, v41, v42, v43, v44, v45, v46, v47, v72, v74, v76);
    if (v77)
    {
      if (OUTLINED_FUNCTION_0_7())
      {
        v52 = v73;
        v53 = v75;
        goto LABEL_33;
      }
    }
    else
    {
      OUTLINED_FUNCTION_11_2(v48, &qword_25765B7B0, v49, v50, v51);
    }
    v52 = 0;
    v53 = 0xE000000000000000;
LABEL_33:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_6_8();
      v25 = v69;
    }
    v54 = *(_QWORD *)(v25 + 16);
    if (v54 >= *(_QWORD *)(v25 + 24) >> 1)
    {
      OUTLINED_FUNCTION_6_8();
      v25 = v70;
    }
    *(_QWORD *)(v25 + 16) = v54 + 1;
    v55 = v25 + 16 * v54;
    *(_QWORD *)(v55 + 32) = v52;
    *(_QWORD *)(v55 + 40) = v53;
    OUTLINED_FUNCTION_10_2(0x6B61657073, &v76);
    v56 = swift_bridgeObjectRelease();
    if (v77)
    {
      if (OUTLINED_FUNCTION_0_7())
      {
        v59 = v73;
        v60 = v75;
LABEL_42:
        v61 = *(_QWORD *)(v25 + 16);
        if (v61 >= *(_QWORD *)(v25 + 24) >> 1)
        {
          OUTLINED_FUNCTION_6_8();
          v25 = v71;
        }
        *(_QWORD *)(v25 + 16) = v61 + 1;
        v62 = v25 + 16 * v61;
        *(_QWORD *)(v62 + 32) = v59;
        *(_QWORD *)(v62 + 40) = v60;
        goto LABEL_45;
      }
    }
    else
    {
      OUTLINED_FUNCTION_11_2(v56, &qword_25765B7B0, v57, v58);
    }
    v59 = 0;
    v60 = 0xE000000000000000;
    goto LABEL_42;
  }
LABEL_45:
  *(_QWORD *)&v76 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765AF78);
  sub_246EA3AAC();
  v63 = sub_246EBE080();
  v65 = v64;
  swift_bridgeObjectRelease();
  sub_246EB0038(v63, v65);
  return swift_retain();
}

uint64_t sub_246EB0480(uint64_t a1, uint64_t a2)
{
  return sub_246EB04B0(a1, a2, (void (*)(uint64_t, uint64_t))sub_246EB002C);
}

uint64_t sub_246EB048C(uint64_t a1, uint64_t a2)
{
  return sub_246EB04B0(a1, a2, (void (*)(uint64_t, uint64_t))sub_246EB0038);
}

uint64_t sub_246EB0498(uint64_t a1, uint64_t a2)
{
  return sub_246EB04B0(a1, a2, (void (*)(uint64_t, uint64_t))sub_246EB0044);
}

uint64_t sub_246EB04A4(uint64_t a1, uint64_t a2)
{
  return sub_246EB04B0(a1, a2, (void (*)(uint64_t, uint64_t))sub_246EB0050);
}

uint64_t sub_246EB04B0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  swift_bridgeObjectRetain();
  a3(a1, a2);
  return swift_retain();
}

uint64_t sub_246EB04F4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5 = a1[5];
  *(_QWORD *)&v7 = *a1;
  *((_QWORD *)&v7 + 1) = v1;
  v8 = v2;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_246EB0078(&v7);
  return swift_retain();
}

uint64_t sub_246EB0558@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  uint64_t v21;
  _OWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  void *v27;
  _UNKNOWN **v28;

  v2 = v1;
  if (!v1[5] && !v1[7])
  {
    if (qword_25765A820 != -1)
      swift_once();
    v3 = OUTLINED_FUNCTION_24();
    __swift_project_value_buffer(v3, (uint64_t)qword_25765E558);
    OUTLINED_FUNCTION_27_0();
    v4 = OUTLINED_FUNCTION_26_1();
    if (OUTLINED_FUNCTION_21_2(v4))
    {
      *(_WORD *)OUTLINED_FUNCTION_1_4() = 0;
      OUTLINED_FUNCTION_18_2(&dword_246E99000, v5, v6, "Text and keywords are both empty");
      OUTLINED_FUNCTION_2();
    }

  }
  if (v1[3])
  {
    v20 = v1[3];
    v21 = v1[2];
  }
  else
  {
    v20 = 0xE000000000000000;
    v21 = 0;
  }
  if (v1[5])
  {
    v7 = v1[4];
    v8 = v2[5];
  }
  else
  {
    v7 = 0;
    v8 = 0xE000000000000000;
  }
  if (v2[7])
  {
    v9 = v2[6];
    v10 = v2[7];
  }
  else
  {
    v9 = 0;
    v10 = 0xE000000000000000;
  }
  if (v2[9])
  {
    v11 = v2[8];
    v12 = v2[9];
  }
  else
  {
    v11 = 0;
    v12 = 0xE000000000000000;
  }
  v27 = &unk_25183C600;
  v28 = &off_25183C658;
  v13 = (_QWORD *)OUTLINED_FUNCTION_4_3();
  *(_QWORD *)&v26 = v13;
  v13[2] = v7;
  v13[3] = v8;
  v13[4] = v9;
  v13[5] = v10;
  v13[6] = v11;
  v13[7] = v12;
  sub_246EB005C((uint64_t *)v23);
  v18 = v23[1];
  v19 = v23[0];
  v14 = v24;
  v15 = v25;
  a1[3] = (uint64_t)&unk_25183C578;
  a1[4] = (uint64_t)&off_25183C638;
  v16 = OUTLINED_FUNCTION_4_3();
  *a1 = v16;
  *(_QWORD *)(v16 + 16) = v21;
  *(_QWORD *)(v16 + 24) = v20;
  sub_246EA00C4(&v26, v16 + 32);
  *(_OWORD *)(v16 + 72) = v19;
  *(_OWORD *)(v16 + 88) = v18;
  *(_QWORD *)(v16 + 104) = v14;
  *(_QWORD *)(v16 + 112) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t NLGDialogBuilder.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_23_2();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_246EB0BE0(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  return v0;
}

uint64_t NLGDialogBuilder.__deallocating_deinit()
{
  NLGDialogBuilder.deinit();
  return swift_deallocClassInstance();
}

double NLGScoredDialogBuilder.__allocating_init()()
{
  uint64_t v0;
  double result;

  v0 = OUTLINED_FUNCTION_4_3();
  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 44) = 0u;
  *(_BYTE *)(v0 + 60) = 1;
  return result;
}

double NLGScoredDialogBuilder.init()()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 44) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_BYTE *)(v0 + 60) = 1;
  return result;
}

uint64_t sub_246EB0810(uint64_t a1)
{
  uint64_t v1;
  _BYTE v3[40];

  sub_246EA297C(a1, (uint64_t)v3);
  swift_beginAccess();
  sub_246EB0C1C((uint64_t)v3, v1 + 16);
  swift_endAccess();
  return swift_retain();
}

uint64_t sub_246EB086C(float a1)
{
  uint64_t v1;

  *(float *)(v1 + 56) = a1;
  *(_BYTE *)(v1 + 60) = 0;
  return swift_retain();
}

void sub_246EB087C(uint64_t a1@<X8>)
{
  NSObject *v1;
  NSObject *v2;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16[2];

  v2 = v1;
  v4 = v1 + 2;
  swift_beginAccess();
  sub_246EB0C64((uint64_t)v4, (uint64_t)&v14);
  if (v15)
  {
    sub_246EA00C4(&v14, (uint64_t)v16);
    if (BYTE4(v2[7].isa) == 1)
    {
      if (qword_25765A820 != -1)
        swift_once();
      v5 = OUTLINED_FUNCTION_24();
      __swift_project_value_buffer(v5, (uint64_t)qword_25765E558);
      OUTLINED_FUNCTION_27_0();
      v6 = OUTLINED_FUNCTION_26_1();
      if (OUTLINED_FUNCTION_21_2(v6))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_4() = 0;
        OUTLINED_FUNCTION_18_2(&dword_246E99000, v7, v8, "Score is empty, defaulting to 0");
        OUTLINED_FUNCTION_2();
      }

    }
    sub_246EA00C4(v16, (uint64_t)&v14);
    if (BYTE4(v2[7].isa))
      v9 = 0.0;
    else
      v9 = *(float *)&v2[7].isa;
    *(_QWORD *)(a1 + 24) = &unk_25183C4F8;
    *(_QWORD *)(a1 + 32) = &off_25183C620;
    v10 = OUTLINED_FUNCTION_4_3();
    *(_QWORD *)a1 = v10;
    sub_246EA00C4(&v14, v10 + 16);
    *(float *)(v10 + 56) = v9;
  }
  else
  {
    sub_246EA2924((uint64_t)&v14, &qword_25765AE98);
    if (qword_25765A820 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_24();
    __swift_project_value_buffer(v11, (uint64_t)qword_25765E558);
    OUTLINED_FUNCTION_27_0();
    v12 = OUTLINED_FUNCTION_26_1();
    if (os_log_type_enabled(v4, v12))
    {
      v13 = (uint8_t *)OUTLINED_FUNCTION_1_4();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_246E99000, v4, v12, "Dialog is empty", v13, 2u);
      OUTLINED_FUNCTION_2();
    }

    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
}

uint64_t NLGScoredDialogBuilder.deinit()
{
  uint64_t v0;

  sub_246EA2924(v0 + 16, &qword_25765AE98);
  return v0;
}

uint64_t NLGScoredDialogBuilder.__deallocating_deinit()
{
  uint64_t v0;

  sub_246EA2924(v0 + 16, &qword_25765AE98);
  return swift_deallocClassInstance();
}

void sub_246EB0AD0()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  const void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_20_2();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_19_3();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_9_3();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA68);
    v5 = (const void *)OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_14_2(v5);
    OUTLINED_FUNCTION_13_2(v6);
  }
  if ((v0 & 1) != 0)
  {
    v7 = (char *)OUTLINED_FUNCTION_22_2();
    sub_246EB460C(v7, v8, v9);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v10 = OUTLINED_FUNCTION_7_6();
    sub_246EB1398(v10, v11, v12, v13);
  }
  OUTLINED_FUNCTION_8_2();
}

uint64_t sub_246EB0B6C()
{
  OUTLINED_FUNCTION_23_2();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_246EB0B9C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_23_2();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  if (*(_QWORD *)(v0 + 80))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_deallocObject();
}

uint64_t sub_246EB0BE0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_246EB0C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765AE98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EB0C64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765AE98);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EB0CAC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t dispatch thunk of NLGDialog.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NLGDialog.source.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of NLGDialogContent.text.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLGDialogContent.sourceKeywords.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t destroy for NLGDialogSource()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for NLGDialogSource(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for NLGDialogSource(_QWORD *a1, _QWORD *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for NLGDialogSource(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  return a1;
}

uint64_t getEnumTagSinglePayload for NLGDialogSource(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for NLGDialogSource(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NLGDialogSource()
{
  return &type metadata for NLGDialogSource;
}

uint64_t type metadata accessor for NLGDialogBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for NLGDialogBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NLGDialogBuilder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of NLGDialogBuilder.fromDictionary(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of NLGDialogBuilder.identifier(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of NLGDialogBuilder.text(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of NLGDialogBuilder.keywords(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of NLGDialogBuilder.sourceKeywords(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of NLGDialogBuilder.source(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of NLGDialogBuilder.build()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of NLGScoredDialog.dialog.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t type metadata accessor for NLGScoredDialogBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for NLGScoredDialogBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NLGScoredDialogBuilder.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of NLGScoredDialogBuilder.dialog(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of NLGScoredDialogBuilder.score(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of NLGScoredDialogBuilder.build()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

void sub_246EB0FF4()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_20_2();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_19_3();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_9_3();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA58);
    v5 = (const void *)OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_14_2(v5);
    OUTLINED_FUNCTION_13_2(v6);
  }
  if ((v0 & 1) != 0)
  {
    v7 = OUTLINED_FUNCTION_22_2();
    sub_246EB4664(v7);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v8 = OUTLINED_FUNCTION_7_6();
    sub_246EB148C(v8, v9, v10, v11);
  }
  OUTLINED_FUNCTION_8_2();
}

void sub_246EB1090()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_20_2();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_19_3();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_9_3();
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA48);
    v6 = (const void *)OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_14_2(v6);
    *(_QWORD *)(v2 + 16) = v1;
    *(_QWORD *)(v2 + 24) = 2 * (v7 / 24);
  }
  if ((v0 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_22_2();
    sub_246EB4744(v8, v9, v10);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_7_6();
    sub_246EB15A0(v11, v12, v13, v14);
  }
}

void sub_246EB1144()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  const void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_20_2();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_19_3();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_9_3();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA30);
    v5 = (const void *)OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_14_2(v5);
    OUTLINED_FUNCTION_13_2(v6);
  }
  if ((v0 & 1) != 0)
  {
    v7 = (char *)OUTLINED_FUNCTION_22_2();
    sub_246EB4830(v7, v8, v9);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v10 = OUTLINED_FUNCTION_7_6();
    sub_246EB16BC(v10, v11, v12, v13);
  }
  OUTLINED_FUNCTION_8_2();
}

void sub_246EB11E0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_246EB12B4(a1, a2, a3, a4, &qword_25765BA38, &qword_25765BA40, (void (*)(uint64_t, uint64_t, unint64_t))sub_246EB482C);
}

void sub_246EB11FC()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  const void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_20_2();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_19_3();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_9_3();
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA70);
    v5 = (const void *)OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_14_2(v5);
    OUTLINED_FUNCTION_13_2(v6);
  }
  if ((v0 & 1) != 0)
  {
    v7 = (char *)OUTLINED_FUNCTION_22_2();
    sub_246EB48E8(v7, v8, v9);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v10 = OUTLINED_FUNCTION_7_6();
    sub_246EB17B0(v10, v11, v12, v13);
  }
  OUTLINED_FUNCTION_8_2();
}

void sub_246EB1298(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_246EB12B4(a1, a2, a3, a4, &qword_25765BA20, &qword_25765BA28, (void (*)(uint64_t, uint64_t, unint64_t))sub_246EB482C);
}

void sub_246EB12B4(char a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6, void (*a7)(uint64_t, uint64_t, unint64_t))
{
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;
  unint64_t v18;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v12 != v13)
    {
      OUTLINED_FUNCTION_19_3();
      if (v12)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  else
  {
    v11 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v11 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v11;
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v16 = (_QWORD *)OUTLINED_FUNCTION_4_3();
    v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 40);
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v18 = (unint64_t)(v16 + 4);
  if ((a1 & 1) != 0)
  {
    a7(a4 + 32, v14, v18);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    sub_246EB18A4(0, v14, v18, a4, a6);
  }
}

uint64_t sub_246EB1398(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EB148C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA60);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EB15A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA50);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EB16BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + (a1 << 6) + 32;
    v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EB17B0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EB18A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 40 * a1 + 32;
    v7 = a3 + 40 * v5;
    if (v6 >= v7 || v6 + 40 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  OUTLINED_FUNCTION_5_6();
  result = sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EB19A4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_246EB19E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_6_8()
{
  sub_246EB0AD0();
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return 0;
}

double OUTLINED_FUNCTION_8_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11)
{
  return sub_246EAFE8C(0x746E697270, 0xE500000000000000, a9, &a11);
}

double OUTLINED_FUNCTION_10_2@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_246EAFE8C(a1, 0xE500000000000000, v2, a2);
}

uint64_t OUTLINED_FUNCTION_11_2(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return sub_246EA2924((uint64_t)va, a2);
}

void OUTLINED_FUNCTION_13_2(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = 2 * (a1 / v1);
}

size_t OUTLINED_FUNCTION_14_2(const void *a1)
{
  return _swift_stdlib_malloc_size(a1);
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

void OUTLINED_FUNCTION_18_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_21_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  uint64_t v0;

  return v0 + 32;
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_25_2@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_246EAFE8C(a1, 0xE700000000000000, v2, a2);
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_246EBE200();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_246EBE014();
}

uint64_t sub_246EB1B6C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  int64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_246EB4FEC(0, v2, 0);
    v3 = v14;
    v6 = a1 + 32;
    do
    {
      v7 = a2(v6);
      v9 = v8;
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_246EB4FEC((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      v6 += 40;
      --v2;
    }
    while (v2);
  }
  return v3;
}

void sub_246EB1C54(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  __int128 v33[3];
  __int128 v34;
  _BYTE v35[28];
  __int128 v36;
  _BYTE v37[28];
  uint64_t v38;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (v5 >= v4)
    v6 = *(_QWORD *)(a1 + 16);
  else
    v6 = *(_QWORD *)(a2 + 16);
  v38 = MEMORY[0x24BEE4AF8];
  sub_246EB50E0(0, v6, 0);
  v32 = v4;
  v30 = a1;
  v31 = a2;
  if (v6)
  {
    v7 = a1 + 32;
    v8 = (int *)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = v6;
    v10 = v4;
    v11 = v5;
    while (v10)
    {
      sub_246EA297C(v7, (uint64_t)&v36);
      if (!v11)
        goto LABEL_29;
      v12 = *v8;
      sub_246EA00C4(&v36, (uint64_t)&v34);
      *(_DWORD *)&v35[24] = v12;
      sub_246EA297C((uint64_t)&v34, (uint64_t)v33);
      sub_246EA00C4(v33, (uint64_t)&v36);
      *(_DWORD *)&v37[24] = v12;
      sub_246EA2924((uint64_t)&v34, &qword_25765BBF8);
      v13 = v38;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246EB50E0(0, *(_QWORD *)(v13 + 16) + 1, 1);
        v13 = v38;
      }
      v15 = *(_QWORD *)(v13 + 16);
      v14 = *(_QWORD *)(v13 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_246EB50E0(v14 > 1, v15 + 1, 1);
        v13 = v38;
      }
      *(_QWORD *)(v13 + 16) = v15 + 1;
      v16 = (_OWORD *)(v13 + 48 * v15);
      v17 = v36;
      v18 = *(_OWORD *)v37;
      *(_OWORD *)((char *)v16 + 60) = *(_OWORD *)&v37[12];
      --v11;
      v16[2] = v17;
      v16[3] = v18;
      --v10;
      ++v8;
      v7 += 40;
      if (!--v9)
        goto LABEL_15;
    }
    __break(1u);
LABEL_29:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_15:
    v20 = v5;
    v19 = v32;
    if (v32 <= v5)
    {
LABEL_27:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    v21 = v30 + 40 * v6 + 32;
    while (v6 < v19)
    {
      sub_246EA297C(v21, (uint64_t)v33);
      if (v20 == v6)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
        goto LABEL_27;
      }
      if (v6 >= v20)
        goto LABEL_31;
      v22 = *(_DWORD *)(v31 + 32 + 4 * v6);
      sub_246EA00C4(v33, (uint64_t)&v34);
      *(_DWORD *)&v35[24] = v22;
      v36 = v34;
      *(_OWORD *)v37 = *(_OWORD *)v35;
      *(_OWORD *)&v37[12] = *(_OWORD *)&v35[12];
      sub_246EA297C((uint64_t)&v36, (uint64_t)v33);
      v23 = *(_DWORD *)&v37[24];
      sub_246EA00C4(v33, (uint64_t)&v34);
      *(_DWORD *)&v35[24] = v23;
      sub_246EA2924((uint64_t)&v36, &qword_25765BBF8);
      v24 = v38;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246EB50E0(0, *(_QWORD *)(v24 + 16) + 1, 1);
        v24 = v38;
      }
      v26 = *(_QWORD *)(v24 + 16);
      v25 = *(_QWORD *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_246EB50E0(v25 > 1, v26 + 1, 1);
        v24 = v38;
      }
      ++v6;
      *(_QWORD *)(v24 + 16) = v26 + 1;
      v27 = (_OWORD *)(v24 + 48 * v26);
      v28 = v34;
      v29 = *(_OWORD *)v35;
      *(_OWORD *)((char *)v27 + 60) = *(_OWORD *)&v35[12];
      v27[2] = v28;
      v27[3] = v29;
      v21 += 40;
      v20 = v5;
      v19 = v32;
      if (v32 == v6)
        goto LABEL_27;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
}

void sub_246EB1F64(void (*a1)(_OWORD *__return_ptr, _OWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v34;
  _OWORD __src[6];
  __int128 v36;
  _OWORD v37[2];
  _OWORD __dst[6];
  uint64_t v39;

  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(a4 + 16);
  if (v7 >= v6)
    v8 = *(_QWORD *)(a3 + 16);
  else
    v8 = *(_QWORD *)(a4 + 16);
  v39 = MEMORY[0x24BEE4AF8];
  sub_246EB50E0(0, v8, 0);
  v32 = v7;
  v30 = a4;
  v31 = a3;
  v29 = v8;
  if (v8)
  {
    v9 = v39;
    v10 = a3 + 32;
    v11 = a4 + 32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = v6;
    while (v12)
    {
      sub_246EB29A0(v10, (uint64_t)&v36);
      if (!v7)
        goto LABEL_34;
      __dst[0] = v36;
      __dst[1] = v37[0];
      *(_OWORD *)((char *)&__dst[1] + 12) = *(_OWORD *)((char *)v37 + 12);
      sub_246EA297C(v11, (uint64_t)&__dst[3]);
      a1(__src, __dst);
      if (v34)
      {
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_246EA2924((uint64_t)__dst, &qword_25765BBF0);
        return;
      }
      sub_246EA2924((uint64_t)__dst, &qword_25765BBF0);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246EB50E0(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v9 = v39;
      }
      v14 = *(_QWORD *)(v9 + 16);
      v13 = *(_QWORD *)(v9 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_246EB50E0(v13 > 1, v14 + 1, 1);
        v9 = v39;
      }
      *(_QWORD *)(v9 + 16) = v14 + 1;
      v15 = (_OWORD *)(v9 + 48 * v14);
      v16 = __src[0];
      v17 = __src[1];
      *(_OWORD *)((char *)v15 + 60) = *(_OWORD *)((char *)&__src[1] + 12);
      --v7;
      v15[2] = v16;
      v15[3] = v17;
      --v12;
      v11 += 40;
      v10 += 48;
      if (!--v8)
        goto LABEL_16;
    }
    __break(1u);
LABEL_34:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_16:
    v19 = v32;
    v18 = v6;
    if (v6 <= v32)
    {
LABEL_31:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    v20 = v29;
    v21 = v31 + 48 * v29 + 32;
    v22 = v30 + 40 * v29 + 32;
    while (v20 < v18)
    {
      sub_246EB29A0(v21, (uint64_t)&v36);
      if (v19 == v20)
      {
        sub_246EB29DC((uint64_t)&v36);
        goto LABEL_31;
      }
      if (v20 >= v19)
        goto LABEL_36;
      __src[0] = v36;
      __src[1] = v37[0];
      *(_OWORD *)((char *)&__src[1] + 12) = *(_OWORD *)((char *)v37 + 12);
      sub_246EA297C(v22, (uint64_t)&__src[3]);
      memcpy(__dst, __src, 0x58uLL);
      a1(__src, __dst);
      sub_246EA2924((uint64_t)__dst, &qword_25765BBF0);
      if (v34)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return;
      }
      v23 = v39;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246EB50E0(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v39;
      }
      v25 = *(_QWORD *)(v23 + 16);
      v24 = *(_QWORD *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_246EB50E0(v24 > 1, v25 + 1, 1);
        v23 = v39;
      }
      ++v20;
      *(_QWORD *)(v23 + 16) = v25 + 1;
      v26 = (_OWORD *)(v23 + 48 * v25);
      v27 = __src[0];
      v28 = __src[1];
      *(_OWORD *)((char *)v26 + 60) = *(_OWORD *)((char *)&__src[1] + 12);
      v26[2] = v27;
      v26[3] = v28;
      v21 += 48;
      v22 += 40;
      v19 = v32;
      v18 = v6;
      if (v6 == v20)
        goto LABEL_31;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_246EB22E4@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  char v4;
  _BYTE v5[40];

  sub_246EA297C(v1 + 16, (uint64_t)v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765BC00);
  type metadata accessor for TFIDFScorer();
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    result = swift_release();
    v4 = 0;
  }
  else
  {
    v4 = 2;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_246EB2360(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = sub_246EB1B6C(a1, *(uint64_t (**)(uint64_t))(v1 + 56));
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 40));
  v3 = sub_246E9AC38(v2, *(unsigned __int8 *)(v1 + 72));
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v15 = MEMORY[0x24BEE4AF8];
    sub_246EB5024(0, v4, 0);
    v5 = v15;
    v6 = *(_QWORD *)(v15 + 16);
    v7 = 48;
    do
    {
      v8 = *(_DWORD *)(v3 + v7);
      v9 = *(_QWORD *)(v15 + 24);
      if (v6 >= v9 >> 1)
        sub_246EB5024((char *)(v9 > 1), v6 + 1, 1);
      *(_QWORD *)(v15 + 16) = v6 + 1;
      *(_DWORD *)(v15 + 4 * v6 + 32) = v8;
      v7 += 24;
      ++v6;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
  }
  v10 = swift_bridgeObjectRetain();
  sub_246EB1C54(v10, v5);
  v12 = v11;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = sub_246EBCC98(v12);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_246EB24C8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DialogScorer()
{
  return objc_opt_self();
}

uint64_t sub_246EB2514(uint64_t a1)
{
  return sub_246EB2360(a1);
}

uint64_t sub_246EB2534@<X0>(char *a1@<X8>)
{
  return sub_246EB22E4(a1);
}

void sub_246EB2554(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_246EB2560(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[5];
  _QWORD v25[5];
  int v26;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;
  int v30;
  __int128 v31;
  _BYTE v32[28];

  v2 = v1;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v25[0] = MEMORY[0x24BEE4AF8];
    sub_246EB50E0(0, v4, 0);
    v6 = a1 + 32;
    v5 = v25[0];
    do
    {
      sub_246EA297C(v6, (uint64_t)v27);
      sub_246EA297C((uint64_t)v27, (uint64_t)&v31);
      *(_DWORD *)&v32[24] = 0;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246EB50E0(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v25[0];
      }
      v8 = *(_QWORD *)(v5 + 16);
      v7 = *(_QWORD *)(v5 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_246EB50E0(v7 > 1, v8 + 1, 1);
        v5 = v25[0];
      }
      *(_QWORD *)(v5 + 16) = v8 + 1;
      v9 = (_OWORD *)(v5 + 48 * v8);
      v10 = v31;
      v11 = *(_OWORD *)v32;
      *(_OWORD *)((char *)v9 + 60) = *(_OWORD *)&v32[12];
      v9[2] = v10;
      v9[3] = v11;
      v6 += 40;
      --v4;
    }
    while (v4);
  }
  v12 = *(_QWORD *)(v2 + 16);
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v14 = v12 + 32;
    v24[4] = *(_QWORD *)(v2 + 16);
    swift_bridgeObjectRetain();
    do
    {
      sub_246EB293C(v14, (uint64_t)&v31);
      v15 = *(_DWORD *)&v32[24];
      sub_246EA00C4(&v31, (uint64_t)v27);
      v30 = v15;
      v16 = v28;
      v17 = v29;
      __swift_project_boxed_opaque_existential_1(v27, v28);
      v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 8))(a1, v16, v17);
      v19 = sub_246EA297C((uint64_t)v27, (uint64_t)v25);
      v26 = v15;
      MEMORY[0x24BDAC7A8](v19, v20);
      v24[2] = v25;
      sub_246EB1F64((void (*)(_OWORD *__return_ptr, _OWORD *))sub_246EB2984, (uint64_t)v24, v5, v18);
      v5 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_246EA2924((uint64_t)v25, &qword_25765BBE8);
      sub_246EA2924((uint64_t)v27, &qword_25765BBE8);
      v14 += 48;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
  }
  v22 = sub_246EBCC98(v5);
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_246EB27B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v6;
  float v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  _BYTE v13[40];
  float v14;
  _BYTE v15[40];
  __int128 v16[2];
  _BYTE v17[48];
  _BYTE v18[40];

  v6 = (_QWORD *)(a1 + 48);
  sub_246EB29A0(a1, (uint64_t)v17);
  sub_246EA297C((uint64_t)v6, (uint64_t)v18);
  sub_246EA297C((uint64_t)v17, (uint64_t)v16);
  sub_246EB29DC((uint64_t)v17);
  sub_246EB29A0(a1, (uint64_t)v13);
  sub_246EA297C((uint64_t)v6, (uint64_t)v15);
  v7 = v14;
  sub_246EB29DC((uint64_t)v13);
  v8 = *(float *)(a2 + 40);
  v10 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 80);
  __swift_project_boxed_opaque_existential_1(v6, v10);
  v11 = v7 + (float)(v8 * (*(float (**)(uint64_t, uint64_t))(v9 + 16))(v10, v9));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  sub_246EA00C4(v16, a3);
  *(float *)(a3 + 40) = v11;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

uint64_t sub_246EB28C4()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeightedDialogScorer()
{
  return objc_opt_self();
}

uint64_t sub_246EB2908(uint64_t a1)
{
  return sub_246EB2560(a1);
}

void sub_246EB2928(_BYTE *a1@<X8>)
{
  sub_246EB2554(a1);
}

uint64_t sub_246EB293C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765BBE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EB2984@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_246EB27B8(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_246EB29A0(uint64_t a1, uint64_t a2)
{
  sub_246EBD5E4(a2, a1);
  return a2;
}

uint64_t sub_246EB29DC(uint64_t a1)
{
  destroy for NLGVerbPhrase();
  return a1;
}

void (*sub_246EB2A10(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(_QWORD *__return_ptr, uint64_t)))(_QWORD *__return_ptr, uint64_t)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  void (*v17)(_QWORD *__return_ptr, uint64_t);

  v7 = sub_246EBE008();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a4;
  sub_246EBDFFC();
  sub_246EBE218();
  v13 = sub_246EBDFF0();
  v14 = v16[1];
  a5(&v17, v13);
  if (v14)
  {
    sub_246EBE20C();
    sub_246EBDFF0();
    swift_willThrow();
  }
  else
  {
    a5 = v17;
    sub_246EBE20C();
    sub_246EBDFF0();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return a5;
}

void sub_246EB2B6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];
  _OWORD v41[3];
  _OWORD v42[2];
  __int128 v43;
  _OWORD v44[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BCF8);
    v2 = OUTLINED_FUNCTION_18_3();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v32 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = 0;
  if (!v5)
    goto LABEL_9;
LABEL_8:
  v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v9 = v8 | (v7 << 6);
  while (1)
  {
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
    v20 = *v18;
    v19 = v18[1];
    sub_246EB19E0(*(_QWORD *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(_QWORD *)&v43 = v20;
    *((_QWORD *)&v43 + 1) = v19;
    v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(_QWORD *)&v41[0] = v20;
    *((_QWORD *)&v41[0] + 1) = v19;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_246EB59E4(v42, v36);
    v37 = v33;
    v38 = v34;
    v39 = v35;
    sub_246EB59E4(v36, v40);
    v33 = v37;
    v34 = v38;
    v35 = v39;
    sub_246EB59E4(v40, v41);
    sub_246EB59E4(v41, &v37);
    v21 = sub_246EBE26C();
    v22 = -1 << *(_BYTE *)(v2 + 32);
    v23 = v21 & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v6 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v6 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v6 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(_QWORD *)(v6 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    v30 = *(_QWORD *)(v2 + 48) + 40 * v25;
    *(_OWORD *)v30 = v33;
    *(_OWORD *)(v30 + 16) = v34;
    *(_QWORD *)(v30 + 32) = v35;
    sub_246EB59E4(&v37, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v25));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v10 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_42;
    if (v10 >= v31)
      goto LABEL_40;
    v11 = *(_QWORD *)(v32 + 8 * v10);
    v12 = v7 + 1;
    if (!v11)
    {
      OUTLINED_FUNCTION_30_0();
      if (v13 == v14)
        goto LABEL_40;
      OUTLINED_FUNCTION_29_0();
      if (!v11)
      {
        OUTLINED_FUNCTION_30_0();
        if (v13 == v14)
          goto LABEL_40;
        OUTLINED_FUNCTION_29_0();
        if (!v11)
        {
          OUTLINED_FUNCTION_30_0();
          if (v13 == v14)
            goto LABEL_40;
          OUTLINED_FUNCTION_29_0();
          if (!v11)
            break;
        }
      }
    }
LABEL_28:
    v5 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v7 = v12;
  }
  v16 = v15 + 4;
  if (v16 >= v31)
  {
LABEL_40:
    swift_release();
    sub_246EB59F4();
    return;
  }
  v11 = *(_QWORD *)(v32 + 8 * v16);
  if (v11)
  {
    v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    OUTLINED_FUNCTION_30_0();
    if (v13 == v14)
      goto LABEL_40;
    OUTLINED_FUNCTION_29_0();
    v16 = v17 + 1;
    if (v11)
      goto LABEL_28;
  }
LABEL_43:
  __break(1u);
}

void sub_246EB2F00(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  char v15;
  BOOL v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _OWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  _OWORD v43[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BD28);
    v2 = (_QWORD *)OUTLINED_FUNCTION_18_3();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v35 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v34 = (unint64_t)(63 - v3) >> 6;
  v6 = &v40;
  v7 = &v42;
  swift_bridgeObjectRetain();
  v8 = 0;
  v9 = MEMORY[0x24BEE4AD8] + 8;
  v10 = MEMORY[0x24BEE0D00];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v37 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v8 << 6);
      }
      else
      {
        v12 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_38;
        if (v12 >= v34)
        {
LABEL_35:
          sub_246EB59F4();
          return;
        }
        v13 = *(_QWORD *)(v35 + 8 * v12);
        v14 = v8 + 1;
        if (!v13)
        {
          OUTLINED_FUNCTION_25_3();
          if (v15 == v16)
            goto LABEL_35;
          OUTLINED_FUNCTION_24_2();
          if (!v13)
          {
            OUTLINED_FUNCTION_25_3();
            if (v15 == v16)
              goto LABEL_35;
            OUTLINED_FUNCTION_24_2();
            if (!v13)
            {
              OUTLINED_FUNCTION_25_3();
              if (v15 == v16)
                goto LABEL_35;
              OUTLINED_FUNCTION_24_2();
              if (!v13)
              {
                v18 = v17 + 4;
                if (v18 >= v34)
                  goto LABEL_35;
                v13 = *(_QWORD *)(v35 + 8 * v18);
                if (!v13)
                {
                  while (!__OFADD__(v18, 1))
                  {
                    OUTLINED_FUNCTION_25_3();
                    if (v15 == v16)
                      goto LABEL_35;
                    OUTLINED_FUNCTION_24_2();
                    v18 = v19 + 1;
                    if (v13)
                      goto LABEL_29;
                  }
                  goto LABEL_39;
                }
                v14 = v18;
              }
            }
          }
        }
LABEL_29:
        v37 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v8 = v14;
      }
      v20 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v38 = *v20;
      v39 = v20[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      sub_246EB59E4(v6, v7);
      sub_246EB59E4(v7, v43);
      sub_246EB59E4(v43, &v41);
      v21 = sub_246EB5650(v38, v39);
      v22 = v21;
      if ((v23 & 1) == 0)
        break;
      v36 = v8;
      v24 = v7;
      v25 = v6;
      v26 = v1;
      v27 = v10;
      v28 = v9;
      v29 = (uint64_t *)(v2[6] + 16 * v21);
      swift_bridgeObjectRelease();
      *v29 = v38;
      v29[1] = v39;
      v9 = v28;
      v10 = v27;
      v1 = v26;
      v6 = v25;
      v7 = v24;
      v8 = v36;
      v30 = (_OWORD *)(v2[7] + 32 * v22);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      sub_246EB59E4(&v41, v30);
      v5 = v37;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v21;
    v31 = (uint64_t *)(v2[6] + 16 * v21);
    *v31 = v38;
    v31[1] = v39;
    sub_246EB59E4(&v41, (_OWORD *)(v2[7] + 32 * v21));
    v32 = v2[2];
    v16 = __OFADD__(v32, 1);
    v33 = v32 + 1;
    if (v16)
      goto LABEL_37;
    v2[2] = v33;
    v5 = v37;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_246EB3230@<X0>(uint64_t a1@<X8>)
{
  if (qword_25765A870 != -1)
    swift_once();
  return sub_246EBAD3C(a1);
}

void sub_246EB3294(char *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  void (*v28)(uint64_t);
  int EnumTagSinglePayload;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  __int128 v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char v49;
  unint64_t v50;
  char v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  int v65;
  void (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  _OWORD *v68;
  _QWORD *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t *v77;
  unint64_t v78;
  char *v79;
  int v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91[7];
  uint64_t v92;

  v5 = v4;
  v82 = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B250);
  MEMORY[0x24BDAC7A8](v8, v9);
  OUTLINED_FUNCTION_7_7();
  v73 = v10;
  OUTLINED_FUNCTION_16_4();
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v70 - v13;
  v15 = sub_246EBDC9C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v17);
  OUTLINED_FUNCTION_7_7();
  v88 = v18;
  OUTLINED_FUNCTION_16_4();
  MEMORY[0x24BDAC7A8](v19, v20);
  v79 = (char *)&v70 - v21;
  OUTLINED_FUNCTION_16_4();
  MEMORY[0x24BDAC7A8](v22, v23);
  v25 = (char *)&v70 - v24;
  v26 = *a2;
  v85 = a2[1];
  v86 = v26;
  v27 = a2[2];
  v83 = a2[3];
  v84 = v27;
  v28 = *(void (**)(uint64_t))(v3 + 16);
  swift_retain();
  v28((uint64_t)a1);
  swift_release();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15);
  v90 = v16;
  if (EnumTagSinglePayload == 1)
  {
    sub_246EA2924((uint64_t)v14, &qword_25765B250);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BD10);
    v30 = *(unsigned __int8 *)(v16 + 80);
    v72 = *(_QWORD *)(v16 + 72);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_246EBEC10;
    v74 = v31;
    v87 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
    v87(v31 + ((v30 + 32) & ~v30), (uint64_t)a1, v15);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v25, v14, v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BD10);
    v32 = *(_QWORD *)(v16 + 72);
    v30 = *(unsigned __int8 *)(v16 + 80);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_246EBEC00;
    v74 = v33;
    v34 = v33 + ((v30 + 32) & ~v30);
    v35 = *(void (**)(uint64_t, char *, uint64_t))(v16 + 16);
    v35(v34, v25, v15);
    v72 = v32;
    v87 = (void (*)(uint64_t, uint64_t, uint64_t))v35;
    v35(v34 + v32, a1, v15);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v25, v15);
  }
  v36 = v5;
  v37 = v73;
  v38 = v15;
  v39 = (uint64_t)v79;
  v40 = v88;
  v41 = sub_246EAFBC4();
  if (!v42)
  {
    v41 = sub_246EAFD08();
    if (!v42)
    {
      swift_bridgeObjectRelease();
      sub_246EB59A8();
      OUTLINED_FUNCTION_0_0();
      *v69 = 0;
      v69[1] = 0;
LABEL_34:
      swift_willThrow();
      goto LABEL_35;
    }
  }
  v44 = v42;
  v45 = v74;
  v70 = *(_QWORD *)(v74 + 16);
  if (!v70)
  {
    OUTLINED_FUNCTION_6_9();
    OUTLINED_FUNCTION_16();
LABEL_32:
    sub_246EB59A8();
    OUTLINED_FUNCTION_0_0();
    *v68 = xmmword_246EBFF70;
    goto LABEL_34;
  }
  v46 = 0;
  v47 = 0;
  v71 = v74 + ((v30 + 32) & ~(unint64_t)v30);
  v77 = &v92;
  *(_QWORD *)&v43 = 136315650;
  v76 = v43;
  v75 = MEMORY[0x24BEE4AD8] + 8;
  v88 = v41;
  v89 = v38;
  while (1)
  {
    if (v47 >= *(_QWORD *)(v45 + 16))
      goto LABEL_40;
    v78 = v47;
    OUTLINED_FUNCTION_23_3(v37, v71 + v72 * v47);
    __swift_storeEnumTagSinglePayload(v37, 0, 1, v38);
    if (__swift_getEnumTagSinglePayload(v37, 1, v38) == 1)
      break;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v90 + 32))(v39, v37, v38);
    if (!v46)
    {
      v49 = 0;
      v50 = 0;
      while (v50 < 2)
      {
        v51 = v49;
        if (!v46)
        {
          v52 = *((unsigned __int8 *)&unk_25183B0B8 + v50 + 32);
          if (qword_25765A820 != -1)
            swift_once();
          v53 = sub_246EBE02C();
          __swift_project_value_buffer(v53, (uint64_t)qword_25765E558);
          OUTLINED_FUNCTION_23_3(v40, v39);
          swift_bridgeObjectRetain_n();
          v54 = sub_246EBE014();
          v55 = sub_246EBE1F4();
          v56 = v55;
          if (os_log_type_enabled(v54, v55))
          {
            v57 = OUTLINED_FUNCTION_4();
            v58 = OUTLINED_FUNCTION_4();
            v82 = v36;
            v91[0] = v58;
            *(_DWORD *)v57 = v76;
            v81 = v56;
            swift_bridgeObjectRetain();
            v91[6] = sub_246EBBD70(v88, v44, v91);
            sub_246EBE248();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v57 + 12) = 2080;
            if (v52)
              v59 = 1852797802;
            else
              v59 = 7235938;
            if (v52)
              v60 = 0xE400000000000000;
            else
              v60 = 0xE300000000000000;
            v80 = v52;
            v61 = sub_246EBBD70(v59, v60, v91);
            OUTLINED_FUNCTION_9_4(v61);
            OUTLINED_FUNCTION_26();
            *(_WORD *)(v57 + 22) = 2080;
            sub_246EB59FC();
            v62 = sub_246EBE35C();
            v64 = sub_246EBBD70(v62, v63, v91);
            OUTLINED_FUNCTION_9_4(v64);
            OUTLINED_FUNCTION_26();
            (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v40, v89);
            _os_log_impl(&dword_246E99000, v54, (os_log_type_t)v81, "Trying to load %s %s model from %s", (uint8_t *)v57, 0x20u);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_2();
          }
          swift_bridgeObjectRelease_n();
          v65 = v52;
          v66 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
          v66(v40, v38);

          v91[0] = v86;
          v91[1] = v85;
          v91[2] = v84;
          v91[3] = v83;
          sub_246EB3A84(v39, v91, v88, v44, v65);
          if (v36)
          {
            swift_bridgeObjectRelease();
            v66(v39, v38);
            swift_bridgeObjectRelease();
            goto LABEL_35;
          }
          v46 = v67;
        }
        v49 = 1;
        v50 = 1u;
        if ((v51 & 1) != 0)
          goto LABEL_11;
      }
      __break(1u);
LABEL_40:
      __break(1u);
      return;
    }
LABEL_11:
    v48 = v78 + 1;
    (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v39, v38);
    v47 = v48;
    v37 = v73;
    v45 = v74;
    if (v48 == v70)
    {
      OUTLINED_FUNCTION_6_9();
      goto LABEL_37;
    }
  }
  swift_bridgeObjectRelease();
LABEL_37:
  swift_bridgeObjectRelease();
  if (!v46)
    goto LABEL_32;
  swift_retain();
  sub_246EA3034();
  swift_release_n();
LABEL_35:
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_246EB3978(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16[4];
  uint64_t v17;

  v4 = v3;
  v6 = *(_QWORD *)(a2 + 16);
  result = MEMORY[0x24BEE4AF8];
  v17 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = (uint64_t *)(a2 + 56);
    while (1)
    {
      v11 = *(v10 - 1);
      v12 = *v10;
      v13 = *(v10 - 2);
      v16[0] = *(v10 - 3);
      v16[1] = v13;
      v16[2] = v11;
      v16[3] = v12;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_10_0();
      sub_246EB3294(a1, v16, a3);
      if (v4)
        break;
      v15 = v14;
      v10 += 4;
      OUTLINED_FUNCTION_2_3();
      swift_bridgeObjectRelease();
      sub_246EB5794(v15);
      if (!--v6)
      {
        swift_bridgeObjectRelease();
        return v17;
      }
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_3();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_26();
  }
  return result;
}

void sub_246EB3A84(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5)
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
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  unsigned int v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;

  LODWORD(v57) = a5;
  v56 = a1;
  v59 = sub_246EBDC9C();
  v6 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59, v7);
  OUTLINED_FUNCTION_7_7();
  v53 = v8;
  OUTLINED_FUNCTION_16_4();
  MEMORY[0x24BDAC7A8](v9, v10);
  v52 = (char *)&v51 - v11;
  OUTLINED_FUNCTION_16_4();
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v16 = (char *)&v51 - v15;
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v20 = (char *)&v51 - v19;
  v22 = MEMORY[0x24BDAC7A8](v18, v21);
  v24 = (char *)&v51 - v23;
  MEMORY[0x24BDAC7A8](v22, v25);
  v58 = (char *)&v51 - v26;
  v27 = *a2;
  v28 = a2[1];
  v29 = a2[2];
  v30 = a2[3];
  v54 = v27;
  v55 = v29;
  v31 = sub_246EBE0E0();
  v33 = v31 == 0x73752D6E65 && v32 == 0xE500000000000000;
  if (v33 || (v34 = v31, v35 = v32, (sub_246EBE368() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    v35 = 0xE200000000000000;
    v34 = 28261;
  }
  sub_246EBDC60();
  v60 = v54;
  v61 = v28;
  swift_bridgeObjectRetain();
  sub_246EBE11C();
  sub_246EBDC60();
  OUTLINED_FUNCTION_3_0();
  v56 = v6;
  v36 = *(_QWORD *)(v6 + 8);
  OUTLINED_FUNCTION_35_0((uint64_t)v16);
  v60 = v55;
  v61 = v30;
  swift_bridgeObjectRetain();
  sub_246EBE11C();
  sub_246EBDC60();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_35_0((uint64_t)v20);
  v60 = v34;
  v61 = v35;
  sub_246EBE11C();
  v37 = v57;
  sub_246EBE11C();
  OUTLINED_FUNCTION_16();
  sub_246EBDC60();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_35_0((uint64_t)v24);
  v38 = sub_246EBDC78();
  v40 = v39;
  v41 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v42 = (void *)sub_246EBE098();
  v43 = objc_msgSend(v41, sel_fileExistsAtPath_, v42);

  if (v43)
  {
    OUTLINED_FUNCTION_2_3();
    v44 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 16);
    if ((v37 & 1) != 0)
    {
      v50 = v53;
      OUTLINED_FUNCTION_12_3(v44);
      type metadata accessor for SerializedDialogSelectionModel();
      OUTLINED_FUNCTION_27_1();
      sub_246EA2B34(v50);
    }
    else
    {
      v45 = (uint64_t)v52;
      OUTLINED_FUNCTION_12_3(v44);
      type metadata accessor for SerializedDialogSelectionModel();
      OUTLINED_FUNCTION_27_1();
      sub_246EA2DA4(v45);
    }
    OUTLINED_FUNCTION_10_3();
  }
  else
  {
    if (qword_25765A820 != -1)
      swift_once();
    v46 = sub_246EBE02C();
    __swift_project_value_buffer(v46, (uint64_t)qword_25765E558);
    OUTLINED_FUNCTION_10_0();
    v47 = sub_246EBE014();
    v48 = sub_246EBE1F4();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)OUTLINED_FUNCTION_4();
      v60 = OUTLINED_FUNCTION_4();
      v57 = v36;
      *(_DWORD *)v49 = 136315138;
      OUTLINED_FUNCTION_10_0();
      v62 = sub_246EBBD70(v38, v40, &v60);
      sub_246EBE248();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_246E99000, v47, v48, "No file found at %s", v49, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }
    swift_bridgeObjectRelease_n();

    OUTLINED_FUNCTION_10_3();
  }
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_246EB3F6C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DefaultDialogProvider()
{
  return objc_opt_self();
}

void sub_246EB3FB0(char *a1, uint64_t *a2, uint64_t a3)
{
  sub_246EB3294(a1, a2, a3);
}

uint64_t sub_246EB3FD0(char *a1, uint64_t a2, uint64_t a3)
{
  return sub_246EB3978(a1, a2, a3);
}

uint64_t sub_246EB3FF0()
{
  return sub_246EB4004();
}

uint64_t sub_246EB4004()
{
  uint64_t v0;
  _QWORD *v1;
  void (*v2)(_QWORD *__return_ptr, uint64_t);
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __int128 v10[2];
  _QWORD *v11;

  if (qword_25765A828 != -1)
    swift_once();
  v1 = (id)qword_25765E570;
  v2 = sub_246EB2A10((uint64_t)"DialogEngineExecution", 21, 2, v1, (void (*)(_QWORD *__return_ptr, uint64_t))sub_246EB43A4);

  if (v0)
    return (uint64_t)v1;
  result = sub_246EB5878(v2);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(result + 16);
    if (v5)
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      sub_246EB50B4(0, v5, 0);
      v6 = 0;
      v1 = v11;
      do
      {
        v9 = *(_QWORD *)(v4 + 8 * v6 + 32);
        sub_246EB43D8(&v9, (uint64_t *)v10);
        v11 = v1;
        v8 = v1[2];
        v7 = v1[3];
        if (v8 >= v7 >> 1)
        {
          sub_246EB50B4(v7 > 1, v8 + 1, 1);
          v1 = v11;
        }
        ++v6;
        v1[2] = v8 + 1;
        sub_246EA00C4(v10, (uint64_t)&v1[5 * v8 + 4]);
      }
      while (v5 != v6);
      OUTLINED_FUNCTION_3_0();

    }
    else
    {
      OUTLINED_FUNCTION_3_0();

      return MEMORY[0x24BEE4AF8];
    }
    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

void sub_246EB41BC(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X7>, _QWORD *a4@<X8>, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2CAF8]), sel_init);
  sub_246EBDC84();
  sub_246EB591C();
  sub_246EB58D8(a1, a2, v8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  sub_246EBE11C();
  swift_bridgeObjectRetain();
  sub_246EBE11C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  sub_246EB591C();
  sub_246EB2B6C(a3);
  sub_246EB5954();
  sub_246EB2B6C(a5);
  sub_246EB5954();
  objc_msgSend(v8, sel_setSwitchFallthrough_, 1);
  objc_msgSend(v8, sel_setIncludeKeywords_, 1);
  v9 = objc_msgSend(v8, sel_execute);
  if (v9)
  {
    v10 = v9;

    *a4 = v10;
  }
  else
  {
    sub_246EB59A8();
    swift_allocError();
    *v11 = 0xD000000000000016;
    v11[1] = 0x8000000246EC0FF0;
    swift_willThrow();

  }
}

void sub_246EB43A4(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  sub_246EB41BC(v1[3], v1[4], v1[9], a1, v1[10]);
}

uint64_t sub_246EB43D8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v3 = *a1;
  type metadata accessor for NLGDialogBuilder();
  swift_initStackObject();
  NLGDialogBuilder.init()();
  sub_246EAFE8C(25705, 0xE200000000000000, v3, &v7);
  if (v8)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      sub_246EB002C(v5, v6);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_246EA2924((uint64_t)&v7, &qword_25765B7B0);
  }
  sub_246EAFE8C(0x746E65746E6F63, 0xE700000000000000, v3, &v7);
  if (!v8)
    goto LABEL_10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B7B8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_11;
  sub_246EAFE8C(0x746E697270, 0xE500000000000000, v5, &v7);
  swift_bridgeObjectRelease();
  if (v8)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      sub_246EB0038(v5, v6);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
LABEL_10:
    sub_246EA2924((uint64_t)&v7, &qword_25765B7B0);
  }
LABEL_11:
  sub_246EAFE8C(0x7364726F7779656BLL, 0xE800000000000000, v3, &v7);
  if (v8)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      sub_246EB0044(v5, v6);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_246EA2924((uint64_t)&v7, &qword_25765B7B0);
  }
  sub_246EB0558(a2);
  return swift_release();
}

char *sub_246EB460C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    result = (char *)OUTLINED_FUNCTION_2_10();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_8(a3, result);
  }
  return result;
}

char *sub_246EB4668(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    result = (char *)OUTLINED_FUNCTION_2_10();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_8(a3, result);
  }
  return result;
}

char *sub_246EB46C0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246EBE314();
    __break(1u);
  }
  else if (__dst != __src || &__src[4 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 4 * a2);
  }
  return __src;
}

char *sub_246EB4744(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    result = (char *)OUTLINED_FUNCTION_2_10();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_8(a3, result);
  }
  return result;
}

char *sub_246EB47A0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246EBE314();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_246EB4830(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    result = (char *)OUTLINED_FUNCTION_2_10();
    __break(1u);
  }
  else if (a3 != result || &result[64 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_8(a3, result);
  }
  return result;
}

char *sub_246EB4888(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    result = (char *)OUTLINED_FUNCTION_2_10();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_8(a3, result);
  }
  return result;
}

char *sub_246EB48E8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    result = (char *)OUTLINED_FUNCTION_2_10();
    __break(1u);
  }
  else if (a3 != result || &result[32 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_8(a3, result);
  }
  return result;
}

char *sub_246EB4940(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    result = (char *)OUTLINED_FUNCTION_2_10();
    __break(1u);
  }
  else if (a3 != result || &result[48 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_8(a3, result);
  }
  return result;
}

uint64_t sub_246EB499C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    OUTLINED_FUNCTION_21_3();
  }
  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3)
      return OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_5_6();
    OUTLINED_FUNCTION_20_3();
  }
  result = OUTLINED_FUNCTION_3_9();
  __break(1u);
  return result;
}

uint64_t sub_246EB4A34(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_246EBE314();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765AF78);
    return swift_arrayInitWithCopy();
  }
  return result;
}

void *sub_246EB4B20(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[4 * a2] <= __src || &__src[4 * a2] <= __dst))
    return memcpy(__dst, __src, 4 * a2);
  result = (void *)sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EB4BE8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 24 * a2 > a1 ? (v3 = a1 + 24 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_246EBE314();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BD38);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_246EB4CD8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    OUTLINED_FUNCTION_21_3();
  }
  else
  {
    if (a3 + (a2 << 6) <= a1 || a1 + (a2 << 6) <= a3)
      return OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_5_6();
    OUTLINED_FUNCTION_20_3();
  }
  result = OUTLINED_FUNCTION_3_9();
  __break(1u);
  return result;
}

uint64_t sub_246EB4D70(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    OUTLINED_FUNCTION_21_3();
  }
  else
  {
    if (a3 + 40 * a2 <= a1 || a1 + 40 * a2 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a4);
      return swift_arrayInitWithCopy();
    }
    OUTLINED_FUNCTION_5_6();
    OUTLINED_FUNCTION_20_3();
  }
  result = OUTLINED_FUNCTION_3_9();
  __break(1u);
  return result;
}

uint64_t sub_246EB4E2C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 48 * a2 <= a1 || a1 + 48 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EB4EFC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 48 * a2 > a1 ? (v3 = a1 + 48 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_246EBE314();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BBE8);
    return swift_arrayInitWithCopy();
  }
  return result;
}

char *sub_246EB4FEC(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_246EB5138(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_246EB5008(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_246EB5218(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_246EB5024(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_246EB52F8(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_246EB5040(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_246EB54D4(a1, a2, a3, *v3, &qword_25765BD00, &qword_25765BD08);
  *v3 = v4;
}

char *sub_246EB506C(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_246EB53D8(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_246EB5088(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_246EB54D4(a1, a2, a3, *v3, &qword_25765BA20, &qword_25765BA28);
  *v3 = v4;
}

void sub_246EB50B4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_246EB54D4(a1, a2, a3, *v3, &qword_25765BA38, &qword_25765BA40);
  *v3 = v4;
}

void sub_246EB50E0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_246EB5594(a1, a2, a3, *v3, &qword_25765BD18, (void (*)(char *, uint64_t, char *))sub_246EB4E2C);
  *v3 = v4;
}

void sub_246EB510C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_246EB5594(a1, a2, a3, *v3, &qword_25765BD48, (void (*)(char *, uint64_t, char *))sub_246EB4EFC);
  *v3 = v4;
}

char *sub_246EB5138(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA68);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_246EB460C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246EB499C((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_246EB5218(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BD40);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_246EB4668(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246EB4A34((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

char *sub_246EB52F8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BD20);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_246EB46C0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246EB4B20(v13, v8, v12);
  }
  swift_release();
  return v10;
}

char *sub_246EB53D8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BD30);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_246EB47A0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246EB4BE8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_246EB54C0(char a1, int64_t a2, char a3, uint64_t a4)
{
  sub_246EB54D4(a1, a2, a3, a4, &qword_25765BA20, &qword_25765BA28);
}

void sub_246EB54D4(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  char *v15;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)OUTLINED_FUNCTION_17_3();
    OUTLINED_FUNCTION_26_2(v13);
  }
  else
  {
    v12 = MEMORY[0x24BEE4AF8];
  }
  v14 = (char *)(v12 + 32);
  v15 = (char *)(a4 + 32);
  if ((a1 & 1) != 0)
  {
    sub_246EB4888(v15, v11, v14);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246EB4D70((unint64_t)v15, v11, (unint64_t)v14, a6);
  }
  swift_release();
  OUTLINED_FUNCTION_11_1();
}

void sub_246EB5594(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(char *, uint64_t, char *))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  char *v15;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)OUTLINED_FUNCTION_17_3();
    OUTLINED_FUNCTION_26_2(v13);
  }
  else
  {
    v12 = MEMORY[0x24BEE4AF8];
  }
  v14 = (char *)(v12 + 32);
  v15 = (char *)(a4 + 32);
  if ((a1 & 1) != 0)
  {
    sub_246EB4940(v15, v11, v14);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    a6(v15, v11, v14);
  }
  swift_release();
  OUTLINED_FUNCTION_11_1();
}

unint64_t sub_246EB5650(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_246EBE3D4();
  sub_246EBE104();
  v4 = sub_246EBE3EC();
  return sub_246EB56B4(a1, a2, v4);
}

unint64_t sub_246EB56B4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_246EBE368() & 1) == 0)
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
      while (!v14 && (sub_246EBE368() & 1) == 0);
    }
  }
  return v6;
}

void sub_246EB5794(uint64_t a1)
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
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

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
    sub_246EB11E0(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    v3 = v9;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v10 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v10 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_246EB4D70(a1 + 32, v2, v3 + 40 * v10 + 32, &qword_25765BA40);
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *v1 = v3;
    return;
  }
  v11 = *(_QWORD *)(v3 + 16);
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    *(_QWORD *)(v3 + 16) = v13;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_246EB5878(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_response);
  if (!v1)
    return 0;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765B7B8);
  v3 = sub_246EBE1A0();

  return v3;
}

void sub_246EB58D8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_246EBE098();
  objc_msgSend(a3, sel_setLocale_, v4);

}

void sub_246EB591C()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  sub_246EBE098();
  v0 = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_19_4(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_4_11(v10);
}

void sub_246EB5954()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  sub_246EBE038();
  v0 = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_19_4(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_4_11(v10);
}

unint64_t sub_246EB59A8()
{
  unint64_t result;

  result = qword_25765BCF0;
  if (!qword_25765BCF0)
  {
    result = MEMORY[0x24956C6A0](&protocol conformance descriptor for NLGDialogProviderError, &type metadata for NLGDialogProviderError);
    atomic_store(result, (unint64_t *)&qword_25765BCF0);
  }
  return result;
}

_OWORD *sub_246EB59E4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_246EB59F4()
{
  return swift_release();
}

unint64_t sub_246EB59FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25765AF70;
  if (!qword_25765AF70)
  {
    v1 = sub_246EBDC9C();
    result = MEMORY[0x24956C6A0](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_25765AF70);
  }
  return result;
}

void *OUTLINED_FUNCTION_0_8@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return sub_246EBE314();
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_246EBE314();
}

void OUTLINED_FUNCTION_4_11(id a1)
{

}

uint64_t OUTLINED_FUNCTION_6_9()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v0, 1, 1, v1);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = a1;
  return sub_246EBE248();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_arrayInitWithCopy();
}

uint64_t OUTLINED_FUNCTION_12_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_18_3()
{
  return sub_246EBE308();
}

id OUTLINED_FUNCTION_19_4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  SEL *v10;
  void *v11;

  return objc_msgSend(v11, *v10, a10);
}

uint64_t OUTLINED_FUNCTION_23_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 152))(a1, a2, v2);
}

size_t OUTLINED_FUNCTION_26_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  size_t result;

  result = _swift_stdlib_malloc_size(a1);
  a1[2] = v1;
  a1[3] = 2 * ((uint64_t)(result - 32) / v2);
  return result;
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_246EB5BD4(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;

  if (result < 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v3 = *(_QWORD *)(a2 + 16);
  result = sub_246EB7038(0, result, v3);
  if ((v4 & 1) != 0)
    v5 = v3;
  else
    v5 = result;
  if (v3 < v5)
    goto LABEL_9;
  if ((v5 & 0x8000000000000000) == 0)
    return a2;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_246EB5C3C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_7_8();
  v0 = OUTLINED_FUNCTION_19();
  v1 = sub_246EBCB40(v0);
  OUTLINED_FUNCTION_16();
  return v1;
}

_QWORD *sub_246EB5C84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = MEMORY[0x24BEE4AF8];
  v3[3] = a2;
  v3[4] = a3;
  v3[5] = a1;
  sub_246EB617C();
  return v3;
}

void sub_246EB5CAC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint8_t *v30;
  NSObject *oslog;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

  v2 = v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v4 = OUTLINED_FUNCTION_17_4();
  v5(v4);
  if (!v33)
  {
    if (qword_25765A820 != -1)
      swift_once();
    v28 = OUTLINED_FUNCTION_24();
    __swift_project_value_buffer(v28, (uint64_t)qword_25765E558);
    oslog = OUTLINED_FUNCTION_27_0();
    v29 = sub_246EBE200();
    if (os_log_type_enabled(oslog, v29))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_246E99000, oslog, v29, "Only catSwitch type dialogs supported", v30, 2u);
      OUTLINED_FUNCTION_2();
    }

    return;
  }
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v6 = OUTLINED_FUNCTION_17_4();
  v8 = v7(v6);
  v10 = v9;
  v11 = (uint64_t *)(v1 + 16);
  OUTLINED_FUNCTION_7_8();
  sub_246EB6E84((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_246EB1144);
  v12 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16);
  sub_246EB6EFC(v12, (uint64_t (*)(BOOL))sub_246EB1144);
  v13 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v13 + 16) = v12 + 1;
  v14 = v13 + (v12 << 6);
  *(_QWORD *)(v14 + 32) = v32;
  *(_QWORD *)(v14 + 40) = v33;
  *(_OWORD *)(v14 + 48) = v34;
  *(_QWORD *)(v14 + 64) = v35;
  *(_QWORD *)(v14 + 72) = v36;
  *(_QWORD *)(v14 + 80) = v8;
  *(_QWORD *)(v14 + 88) = v10;
  swift_endAccess();
  v15 = *(_QWORD *)(sub_246EB5C3C() + 16);
  swift_bridgeObjectRelease();
  v16 = *(_QWORD *)(v2 + 40);
  if (v16 >= v15)
  {
LABEL_9:
    sub_246EB67A4();
    OUTLINED_FUNCTION_2_11();
    return;
  }
  if (__OFSUB__(*(_QWORD *)(*v11 + 16), v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  if (qword_25765A820 != -1)
LABEL_16:
    swift_once();
  v17 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v17, (uint64_t)qword_25765E558);
  v18 = OUTLINED_FUNCTION_27_0();
  v19 = sub_246EBE1F4();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_DWORD *)v20 = 134217984;
    sub_246EBE248();
    OUTLINED_FUNCTION_8_4(&dword_246E99000, v18, v19, "Dropping %ld oldest entries", v20);
    OUTLINED_FUNCTION_2();
  }

  v21 = *(_QWORD *)(*v11 + 16);
  if (!__OFSUB__(v21, v16))
  {
    sub_246EB5BD4(v21 - v16, *v11);
    v23 = v22;
    v25 = v24;
    OUTLINED_FUNCTION_22_0();
    v26 = OUTLINED_FUNCTION_17_4();
    *v11 = sub_246EB5FA8(v26, v27, v23, v25);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t sub_246EB5FA8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((a4 & 1) == 0)
    goto LABEL_2;
  sub_246EBE380();
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
    sub_246EB6F7C(a1, a2, a3, a4);
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

uint64_t sub_246EB608C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  if (qword_25765A820 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v2, (uint64_t)qword_25765E558);
  v3 = OUTLINED_FUNCTION_27_0();
  v4 = sub_246EBE1F4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_246E99000, v3, v4, "Clearing history", v5, 2u);
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_7_8();
  *(_QWORD *)(v1 + 16) = MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRelease();
  return sub_246EB67A4();
}

uint64_t sub_246EB617C()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF50]), sel_init);
  v3 = (void *)OUTLINED_FUNCTION_6_10();
  v4 = objc_msgSend(v2, sel_persistentDomainForName_, v3);

  if (v4)
  {
    v3 = (void *)sub_246EBE044();

    v5 = v1[3];
    v6 = v1[4];
    swift_bridgeObjectRetain();
    sub_246EAFE8C(v5, v6, (uint64_t)v3, &v31);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7_0();
    if (v33)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765AF78);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v7 = v38;
        v8 = *(_QWORD *)(v38 + 16);
        if (v8)
        {
          OUTLINED_FUNCTION_19();
          v9 = v7 + 40;
          v10 = MEMORY[0x24BEE4AF8];
          do
          {
            swift_bridgeObjectRetain_n();
            v11 = OUTLINED_FUNCTION_17_4();
            sub_246EB64B4(v11, v12, v13);
            v14 = v31;
            v16 = v32;
            v15 = v33;
            v17 = v34;
            v3 = v35;
            v29 = v37;
            v30 = v36;
            swift_bridgeObjectRelease();
            if (*((_QWORD *)&v14 + 1))
            {
              v28 = v3;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                OUTLINED_FUNCTION_20_4();
                v10 = v20;
              }
              v18 = *(_QWORD *)(v10 + 16);
              v3 = (void *)(v18 + 1);
              if (v18 >= *(_QWORD *)(v10 + 24) >> 1)
              {
                OUTLINED_FUNCTION_20_4();
                v10 = v21;
              }
              *(_QWORD *)(v10 + 16) = v3;
              v19 = v10 + (v18 << 6);
              *(_OWORD *)(v19 + 32) = v14;
              *(_QWORD *)(v19 + 48) = v16;
              *(_QWORD *)(v19 + 56) = v15;
              *(_QWORD *)(v19 + 64) = v17;
              *(_QWORD *)(v19 + 72) = v28;
              *(_QWORD *)(v19 + 80) = v30;
              *(_QWORD *)(v19 + 88) = v29;
            }
            v9 += 16;
            --v8;
          }
          while (v8);
          OUTLINED_FUNCTION_16();
        }
        else
        {
          v10 = MEMORY[0x24BEE4AF8];
        }
        OUTLINED_FUNCTION_16();
        OUTLINED_FUNCTION_7_8();
        v1[2] = v10;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_246EB6F3C((uint64_t)&v31);
    }
  }
  if (qword_25765A820 != -1)
    swift_once();
  v22 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v22, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_13_3();
  v23 = sub_246EBE014();
  v24 = sub_246EBE1F4();
  if (OUTLINED_FUNCTION_14_3(v24))
  {
    v25 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_DWORD *)v25 = 134217984;
    v26 = *(_QWORD *)(sub_246EB5C3C() + 16);
    OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_26();
    v38 = v26;
    sub_246EBE248();
    OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_8_4(&dword_246E99000, v23, (os_log_type_t)v3, "Loaded %ld dialogs from history", v25);
    OUTLINED_FUNCTION_2();
  }

  return OUTLINED_FUNCTION_16_5();
}

void sub_246EB64B4(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _QWORD *v6;
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
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  char v37[16];
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40[2];

  v40[0] = 35;
  v40[1] = 0xE100000000000000;
  v38 = v40;
  swift_bridgeObjectRetain_n();
  v6 = (_QWORD *)sub_246EAE7D0(0x7FFFFFFFFFFFFFFFLL, 1u, sub_246EA7448, (uint64_t)v37, a1, a2);
  OUTLINED_FUNCTION_7_0();
  if (v6[2] == 4)
  {
    OUTLINED_FUNCTION_7_0();
    if (v6[2])
    {
      v7 = v6[4];
      a2 = v6[5];
      a1 = v6[6];
      v8 = v6[7];
      swift_bridgeObjectRetain();
      v9 = MEMORY[0x24956C058](v7, a2, a1, v8);
      v35 = v10;
      v36 = v9;
      swift_bridgeObjectRelease();
      if (v6[2] >= 2uLL)
      {
        v11 = v6[8];
        v12 = v6[9];
        v13 = v6[10];
        v14 = v6[11];
        swift_bridgeObjectRetain();
        a1 = MEMORY[0x24956C058](v11, v12, v13, v14);
        v16 = v15;
        swift_bridgeObjectRelease();
        if (v6[2] >= 3uLL)
        {
          v17 = v6[12];
          v18 = v6[13];
          v19 = v6[14];
          v20 = v6[15];
          swift_bridgeObjectRetain();
          v21 = MEMORY[0x24956C058](v17, v18, v19, v20);
          v23 = v22;
          swift_bridgeObjectRelease();
          if (v6[2] >= 4uLL)
          {
            v24 = v6[16];
            v25 = v6[17];
            v26 = v6[18];
            v27 = v6[19];
            OUTLINED_FUNCTION_15();
            OUTLINED_FUNCTION_26();
            v28 = MEMORY[0x24956C058](v24, v25, v26, v27);
            v30 = v29;
            OUTLINED_FUNCTION_7_0();
            *a3 = v36;
            a3[1] = v35;
            a3[2] = a1;
            a3[3] = v16;
            a3[4] = v21;
            a3[5] = v23;
            a3[6] = v28;
            a3[7] = v30;
            goto LABEL_11;
          }
          goto LABEL_15;
        }
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_26();
  if (qword_25765A820 != -1)
LABEL_16:
    swift_once();
  v31 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v31, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_15();
  v32 = sub_246EBE014();
  v33 = sub_246EBE200();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)OUTLINED_FUNCTION_4();
    v40[0] = OUTLINED_FUNCTION_4();
    *(_DWORD *)v34 = 136315138;
    OUTLINED_FUNCTION_15();
    v39 = sub_246EBBD70(a1, a2, v40);
    sub_246EBE248();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_8_4(&dword_246E99000, v32, v33, "Unparsable entry: %s", v34);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }

  swift_bridgeObjectRelease_n();
  *((_OWORD *)a3 + 2) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
LABEL_11:
  OUTLINED_FUNCTION_2_11();
}

uint64_t sub_246EB67A4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t inited;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCF50]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765BE40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_246EBEC10;
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(inited + 32) = v4;
  *(_QWORD *)(inited + 40) = v5;
  OUTLINED_FUNCTION_7_8();
  v6 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v22 = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_22_0();
    OUTLINED_FUNCTION_15();
    sub_246EB4FEC(0, v7, 0);
    v8 = v22;
    v9 = v6 + 48;
    do
    {
      v20 = *(_QWORD *)(v9 - 16);
      v21 = *(_QWORD *)(v9 - 8);
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_1_9();
      sub_246EBE11C();
      OUTLINED_FUNCTION_1_9();
      sub_246EBE11C();
      OUTLINED_FUNCTION_1_9();
      OUTLINED_FUNCTION_19();
      sub_246EBE11C();
      OUTLINED_FUNCTION_16();
      v11 = *(_QWORD *)(v22 + 16);
      v10 = *(_QWORD *)(v22 + 24);
      if (v11 >= v10 >> 1)
        sub_246EB4FEC((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v22 + 16) = v11 + 1;
      v12 = v22 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v20;
      *(_QWORD *)(v12 + 40) = v21;
      v9 += 64;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_22_0();
    v8 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_25765AF78);
  *(_QWORD *)(inited + 48) = v8;
  sub_246EBE05C();
  v13 = (void *)sub_246EBE038();
  OUTLINED_FUNCTION_7_0();
  v14 = (void *)OUTLINED_FUNCTION_6_10();
  objc_msgSend(v2, sel_setPersistentDomain_forName_, v13, v14);

  if (qword_25765A820 != -1)
    swift_once();
  v15 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v15, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_13_3();
  v16 = sub_246EBE014();
  v17 = sub_246EBE1F4();
  if (OUTLINED_FUNCTION_14_3(v17))
  {
    v18 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_DWORD *)v18 = 134217984;
    sub_246EB5C3C();
    OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_26();
    sub_246EBE248();
    OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_8_4(&dword_246E99000, v16, (os_log_type_t)v14, "Saved %ld dialogs to history", v18);
    OUTLINED_FUNCTION_2();
  }

  return OUTLINED_FUNCTION_16_5();
}

uint64_t sub_246EB6AD0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_246EB6AF4()
{
  sub_246EB6AD0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UserDefaultsDialogRecorder()
{
  return objc_opt_self();
}

uint64_t destroy for UserDefaultsDialogHistoryEntry()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for UserDefaultsDialogHistoryEntry(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for UserDefaultsDialogHistoryEntry(_QWORD *a1, _QWORD *a2)
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
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_QWORD *assignWithTake for UserDefaultsDialogHistoryEntry(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

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
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserDefaultsDialogHistoryEntry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
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

uint64_t storeEnumTagSinglePayload for UserDefaultsDialogHistoryEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserDefaultsDialogHistoryEntry()
{
  return &type metadata for UserDefaultsDialogHistoryEntry;
}

uint64_t sub_246EB6D94()
{
  return sub_246EB5C3C();
}

void sub_246EB6DB4(_QWORD *a1)
{
  sub_246EB5CAC(a1);
}

uint64_t sub_246EB6DD4()
{
  return sub_246EB608C();
}

uint64_t sub_246EB6DF4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *v1;
  v2 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_246EB6E34()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_246EB6E60()
{
  return sub_246EB6E84((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_246EB0FF4);
}

uint64_t sub_246EB6E6C()
{
  return sub_246EB6E84((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_246EB1090);
}

uint64_t sub_246EB6E78()
{
  return sub_246EB6E84((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_246EB11FC);
}

uint64_t sub_246EB6E84(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if (!(_DWORD)result)
  {
    result = a1(result, *(_QWORD *)(v3 + 16) + 1, 1, v3);
    *v1 = result;
  }
  return result;
}

uint64_t sub_246EB6ED8(uint64_t a1)
{
  return sub_246EB6EFC(a1, (uint64_t (*)(BOOL))sub_246EB0FF4);
}

uint64_t sub_246EB6EE4(uint64_t a1)
{
  return sub_246EB6EFC(a1, (uint64_t (*)(BOOL))sub_246EB1090);
}

uint64_t sub_246EB6EF0(uint64_t a1)
{
  return sub_246EB6EFC(a1, (uint64_t (*)(BOOL))sub_246EB11FC);
}

uint64_t sub_246EB6EFC(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

uint64_t sub_246EB6F3C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B7B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_246EB6F7C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA30);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 64);
    }
    if (v4 != a3)
    {
      sub_246EB4CD8(a2 + (a3 << 6), v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

uint64_t sub_246EB7038(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return sub_246EBE11C();
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return sub_246EBE098();
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_8_4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return swift_retain_n();
}

BOOL OUTLINED_FUNCTION_14_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_20_4()
{
  sub_246EB1144();
}

uint64_t sub_246EB7120(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_246EB7138()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedStream);
  OUTLINED_FUNCTION_20_5(v1, sel_emitMessage_);
  swift_unknownObjectRelease();
  return OUTLINED_FUNCTION_19_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_246EB7198()
{
  uint64_t v0;

  sub_246EBDE28();
  if (!sub_246EBDE1C())
    return 0;
  sub_246EBDE04();
  OUTLINED_FUNCTION_42_0();
  v0 = sub_246EBDE40();
  swift_release();
  return v0;
}

uint64_t sub_246EB7204@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_246EBDCD8();
  v6 = objc_msgSend(v4, sel_derivedIdentifierForComponentName_fromSourceIdentifier_, a1, v5);

  if (v6)
  {
    sub_246EBDCE4();

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  v8 = OUTLINED_FUNCTION_30_1();
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v8);
}

uint64_t sub_246EB72AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_DWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 56) = a6;
  *(_QWORD *)(v7 + 64) = a7;
  return v7;
}

void sub_246EB72C4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[40];

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765BF50);
  OUTLINED_FUNCTION_36();
  MEMORY[0x24BDAC7A8](v8, v9);
  OUTLINED_FUNCTION_27_2();
  v10 = *a1;
  if (!*(_QWORD *)(a2 + 16))
  {
    if (qword_25765A820 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_2_5(v11, (uint64_t)qword_25765E558);
    v12 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_23_4(v12))
    {
      *(_WORD *)OUTLINED_FUNCTION_4() = 0;
      OUTLINED_FUNCTION_17_5(&dword_246E99000, v13, v14, "SELF logging called with no candidates generated");
      OUTLINED_FUNCTION_2();
    }

  }
  sub_246EBE1C4();
  v15 = sub_246EBE1DC();
  OUTLINED_FUNCTION_22_3(v15);
  sub_246EB8FB0(a3, (uint64_t)v18, &qword_25765AE70);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  *(_QWORD *)(v16 + 32) = v4;
  *(_BYTE *)(v16 + 40) = v10;
  *(_QWORD *)(v16 + 48) = a2;
  OUTLINED_FUNCTION_58((uint64_t)v18, v16 + 56);
  swift_retain();
  v17 = swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_64(v17, (uint64_t)&unk_25765BF80);
  swift_release();
  OUTLINED_FUNCTION_7_5();
}

uint64_t sub_246EB741C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v10;

  *(_BYTE *)(v7 + 24) = a5;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v10;
  *v10 = v7;
  v10[1] = sub_246EB748C;
  return sub_246EB7A14((_BYTE *)(v7 + 24), a6, a7);
}

uint64_t sub_246EB748C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_10();
  return OUTLINED_FUNCTION_4_12(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_246EB74B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_246EBE1DC();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_246EB93A8(a1, &qword_25765BF50);
  }
  else
  {
    sub_246EBE1D0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_246EBE1B8();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_246EB75F4(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _BYTE v18[40];
  _BYTE v19[24];
  uint64_t v20;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765BF50);
  OUTLINED_FUNCTION_36();
  MEMORY[0x24BDAC7A8](v4, v5);
  OUTLINED_FUNCTION_27_2();
  if (!*(_QWORD *)(a1 + 16))
  {
    if (qword_25765A820 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_2_5(v6, (uint64_t)qword_25765E558);
    v7 = OUTLINED_FUNCTION_46();
    if (OUTLINED_FUNCTION_23_4(v7))
    {
      *(_WORD *)OUTLINED_FUNCTION_4() = 0;
      OUTLINED_FUNCTION_17_5(&dword_246E99000, v8, v9, "SELF logging called with no dialogs");
      OUTLINED_FUNCTION_2();
    }

  }
  type metadata accessor for NLGScoredDialogBuilder();
  inited = swift_initStackObject();
  OUTLINED_FUNCTION_5_9(inited);
  OUTLINED_FUNCTION_42_0();
  sub_246EB087C((uint64_t)v19);
  swift_release();
  if (!v20)
  {
    if (qword_25765A820 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_24();
    v12 = OUTLINED_FUNCTION_2_5(v11, (uint64_t)qword_25765E558);
    v13 = sub_246EBE200();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_246E99000, v12, v13, "Failed to produce NLGScoredDialog", v14, 2u);
      OUTLINED_FUNCTION_2();
    }

  }
  sub_246EBE1C4();
  v15 = sub_246EBE1DC();
  OUTLINED_FUNCTION_22_3(v15);
  sub_246EB8FB0((uint64_t)v19, (uint64_t)v18, &qword_25765AE70);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = a1;
  v16[5] = v2;
  OUTLINED_FUNCTION_58((uint64_t)v18, (uint64_t)(v16 + 6));
  swift_bridgeObjectRetain();
  v17 = swift_retain();
  OUTLINED_FUNCTION_64(v17, (uint64_t)&unk_25765BF60);
  swift_release();
  sub_246EB93A8((uint64_t)v19, &qword_25765AE70);
  OUTLINED_FUNCTION_7_5();
}

uint64_t sub_246EB7810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[31] = a5;
  v6[32] = a6;
  v6[30] = a4;
  return swift_task_switch();
}

uint64_t sub_246EB782C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v1 + 32;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_246EA297C(v3, v0 + 80);
      type metadata accessor for NLGScoredDialogBuilder();
      inited = swift_initStackObject();
      OUTLINED_FUNCTION_5_9(inited);
      OUTLINED_FUNCTION_42_0();
      sub_246EB087C(v0 + 160);
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v0 + 80);
      if (*(_QWORD *)(v0 + 184))
      {
        sub_246EA00C4((__int128 *)(v0 + 160), v0 + 120);
        sub_246EA00C4((__int128 *)(v0 + 120), v0 + 200);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_59(0, *(_QWORD *)(v4 + 16) + 1);
          v4 = v8;
        }
        v7 = *(_QWORD *)(v4 + 16);
        v6 = *(_QWORD *)(v4 + 24);
        if (v7 >= v6 >> 1)
        {
          OUTLINED_FUNCTION_59(v6 > 1, v7 + 1);
          v4 = v9;
        }
        *(_QWORD *)(v4 + 16) = v7 + 1;
        sub_246EA00C4((__int128 *)(v0 + 200), v4 + 40 * v7 + 32);
      }
      else
      {
        sub_246EB93A8(v0 + 160, &qword_25765AE70);
      }
      v3 += 40;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v0 + 264) = v4;
  *(_BYTE *)(v0 + 77) = 3;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 272) = v10;
  *v10 = v0;
  v10[1] = sub_246EB79E0;
  return sub_246EB7A14((_BYTE *)(v0 + 77), v4, *(_QWORD *)(v0 + 256));
}

uint64_t sub_246EB79E0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_26_3();
  OUTLINED_FUNCTION_2_12();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_4_12(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_246EB7A14(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  *(_QWORD *)(v4 + 64) = a3;
  *(_QWORD *)(v4 + 72) = v3;
  *(_QWORD *)(v4 + 56) = a2;
  sub_246EBE0C8();
  *(_QWORD *)(v4 + 80) = swift_task_alloc();
  v6 = OUTLINED_FUNCTION_30_1();
  *(_QWORD *)(v4 + 88) = v6;
  *(_QWORD *)(v4 + 96) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 104) = OUTLINED_FUNCTION_9_5();
  *(_QWORD *)(v4 + 112) = OUTLINED_FUNCTION_9_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765BF30);
  *(_QWORD *)(v4 + 120) = OUTLINED_FUNCTION_9_5();
  *(_QWORD *)(v4 + 128) = OUTLINED_FUNCTION_9_5();
  *(_QWORD *)(v4 + 136) = OUTLINED_FUNCTION_9_5();
  *(_QWORD *)(v4 + 144) = OUTLINED_FUNCTION_9_5();
  *(_BYTE *)(v4 + 184) = *a1;
  return swift_task_switch();
}

uint64_t sub_246EB7AE4()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t EnumTagSinglePayload;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  id v41;
  os_log_type_t v42;
  uint8_t *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD *v49;
  uint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  uint64_t (*v54)(id);
  uint64_t v55;

  v54 = (uint64_t (*)(id))(v0 + 40);
  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 72) + 32))();
  v5 = v4;
  OUTLINED_FUNCTION_33_0((uint64_t)v1);
  OUTLINED_FUNCTION_33_0(v2);
  if (!v5)
    goto LABEL_4;
  v6 = *(_QWORD *)(v0 + 128);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 88);
  OUTLINED_FUNCTION_18_0();
  sub_246EBDCC0();
  swift_bridgeObjectRelease();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v6, 1, (uint64_t)v1);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    sub_246EB93A8(*(_QWORD *)(v0 + 128), &qword_25765BF30);
LABEL_4:
    if (qword_25765A820 != -1)
      swift_once();
    v8 = OUTLINED_FUNCTION_24();
    __swift_project_value_buffer(v8, (uint64_t)qword_25765E558);
    OUTLINED_FUNCTION_18_0();
    v9 = sub_246EBE014();
    v10 = sub_246EBE200();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_4();
      v55 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v11 = 136315138;
      *(_QWORD *)(v0 + 16) = v3;
      *(_QWORD *)(v0 + 24) = v5;
      OUTLINED_FUNCTION_18_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765BF40);
      v12 = sub_246EBE0D4();
      *(_QWORD *)(v0 + 40) = sub_246EBBD70(v12, v13, &v55);
      sub_246EBE248();
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_55();
      OUTLINED_FUNCTION_8_4(&dword_246E99000, v9, v10, "UUID could not be calculated from: %s", v11);
      OUTLINED_FUNCTION_35_1();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_55();

    goto LABEL_14;
  }
  v14 = *(_QWORD *)(v0 + 136);
  v15 = *(_QWORD *)(v0 + 144);
  v17 = *(_QWORD *)(v0 + 120);
  v16 = *(_QWORD *)(v0 + 128);
  v18 = *(_QWORD *)(v0 + 112);
  v20 = *(_QWORD *)(v0 + 88);
  v19 = *(_QWORD *)(v0 + 96);
  v21 = *(_QWORD *)(v0 + 72);
  OUTLINED_FUNCTION_45_0(EnumTagSinglePayload, &qword_25765BF30);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v18, v16, v20);
  v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16);
  v22(v15, v18, v20);
  __swift_storeEnumTagSinglePayload(v15, 0, 1, v20);
  (*(void (**)(uint64_t))(v21 + 56))(v18);
  sub_246EB93A8(v14, &qword_25765BF30);
  OUTLINED_FUNCTION_58(v17, v14);
  if (qword_25765A820 != -1)
    swift_once();
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 104);
  v23 = *(_QWORD *)(v0 + 112);
  v24 = *(_QWORD *)(v0 + 88);
  v25 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v25, (uint64_t)qword_25765E558);
  v22((uint64_t)v1, v23, v24);
  v26 = sub_246EBE014();
  v27 = sub_246EBE1F4();
  v28 = os_log_type_enabled(v26, v27);
  v9 = *(NSObject **)(v0 + 104);
  v29 = *(_QWORD *)(v0 + 112);
  v30 = *(_QWORD *)(v0 + 88);
  if (v28)
  {
    v31 = (uint8_t *)OUTLINED_FUNCTION_4();
    v55 = OUTLINED_FUNCTION_4();
    *(_DWORD *)v31 = 136315138;
    sub_246EB928C();
    v32 = sub_246EBE35C();
    *(_QWORD *)(v0 + 48) = sub_246EBBD70(v32, v33, &v55);
    sub_246EBE248();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_32_0();
    OUTLINED_FUNCTION_8_4(&dword_246E99000, v26, v27, "Request ID %s", v31);
    OUTLINED_FUNCTION_35_1();
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_32_0();
  v1(v29, v30);
LABEL_14:
  v34 = *(_QWORD *)(v0 + 136);
  v35 = *(_QWORD *)(v0 + 56);
  v36 = *(_QWORD *)(v0 + 64);
  LOBYTE(v55) = *(_BYTE *)(v0 + 184);
  sub_246EB8988((unsigned __int8 *)&v55, v35, v36, v34);
  *(_QWORD *)(v0 + 152) = v37;
  if (v37)
  {
    v38 = v37;
    if (qword_25765A820 != -1)
      swift_once();
    v39 = OUTLINED_FUNCTION_24();
    v40 = __swift_project_value_buffer(v39, (uint64_t)qword_25765E558);
    v41 = v38;
    sub_246EBE014();
    v42 = OUTLINED_FUNCTION_46();
    if (os_log_type_enabled(v40, v42))
    {
      v43 = (uint8_t *)OUTLINED_FUNCTION_4();
      v55 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v43 = 136315138;
      sub_246EB91D4(v41);
      if (v44 >> 60 == 15)
      {
        v45 = 0x8000000246EC1150;
        v46 = 0xD000000000000016;
      }
      else
      {
        sub_246EBE0BC();
        v51 = sub_246EBE0B0();
        if (v52)
        {
          v46 = v51;
          v45 = v52;
          OUTLINED_FUNCTION_62();
        }
        else
        {
          OUTLINED_FUNCTION_62();
          v45 = 0xEF3E676E69646F63;
          v46 = 0x6544726F7272653CLL;
        }
      }
      *(_QWORD *)(v0 + 32) = sub_246EBBD70(v46, v45, &v55);
      sub_246EBE248();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_8_4(&dword_246E99000, v40, v42, "    Sending SELF generation event:     %s", v43);
      OUTLINED_FUNCTION_35_1();
      OUTLINED_FUNCTION_2();
    }

    v53 = (_QWORD *)OUTLINED_FUNCTION_7_9();
    *(_QWORD *)(v0 + 160) = v53;
    *v53 = v0;
    v53[1] = sub_246EB8168;
    return v54(v41);
  }
  else
  {
    OUTLINED_FUNCTION_34_0();
    *(_QWORD *)(v0 + 168) = v47;
    if (v47)
    {
      v48 = v47;
      v49 = (_QWORD *)OUTLINED_FUNCTION_7_9();
      *(_QWORD *)(v0 + 176) = v49;
      *v49 = v0;
      v49[1] = sub_246EB828C;
      return v54(v48);
    }
    else
    {
      OUTLINED_FUNCTION_8_5();
      OUTLINED_FUNCTION_14_4((uint64_t)v1);
      OUTLINED_FUNCTION_14_4((uint64_t)v9);
      OUTLINED_FUNCTION_43_0();
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_38_0();
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_49_0();
      OUTLINED_FUNCTION_63();
      OUTLINED_FUNCTION_61();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
}

uint64_t sub_246EB8168()
{
  OUTLINED_FUNCTION_26_3();
  OUTLINED_FUNCTION_2_12();
  return OUTLINED_FUNCTION_12_4();
}

uint64_t sub_246EB81A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  OUTLINED_FUNCTION_34_0();
  *(_QWORD *)(v2 + 168) = v3;
  if (v3)
  {
    v4 = v3;
    v7 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)(v2 + 72) + 16)
                                         + *(_QWORD *)(*(_QWORD *)(v2 + 72) + 16));
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 176) = v5;
    *v5 = v2;
    v5[1] = sub_246EB828C;
    return v7(v4);
  }
  else
  {
    OUTLINED_FUNCTION_8_5();
    OUTLINED_FUNCTION_14_4(v0);
    OUTLINED_FUNCTION_14_4(v1);
    OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_50_0();
    OUTLINED_FUNCTION_38_0();
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_49_0();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_61();
    return (*(uint64_t (**)(void))(v2 + 8))();
  }
}

uint64_t sub_246EB828C()
{
  OUTLINED_FUNCTION_26_3();
  OUTLINED_FUNCTION_2_12();
  return OUTLINED_FUNCTION_12_4();
}

uint64_t sub_246EB82C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_14_4(v0);
  OUTLINED_FUNCTION_14_4(v1);
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_38_0();
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_49_0();
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_61();
  return OUTLINED_FUNCTION_19_5(*(uint64_t (**)(void))(v2 + 8));
}

void sub_246EB8340(uint64_t a1, uint64_t a2)
{
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t EnumTagSinglePayload;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;

  v75 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765BF30);
  OUTLINED_FUNCTION_36();
  MEMORY[0x24BDAC7A8](v3, v4);
  OUTLINED_FUNCTION_7_7();
  v72 = v5;
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v10 = (char *)&v68 - v9;
  v12 = MEMORY[0x24BDAC7A8](v8, v11);
  v14 = (char *)&v68 - v13;
  v16 = MEMORY[0x24BDAC7A8](v12, v15);
  v18 = (char *)&v68 - v17;
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)&v68 - v21;
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v68 - v24;
  v26 = OUTLINED_FUNCTION_30_1();
  v27 = *(_QWORD *)(v26 - 8);
  v73 = v26;
  v74 = v27;
  MEMORY[0x24BDAC7A8](v26, v28);
  OUTLINED_FUNCTION_7_7();
  v68 = v29;
  v32 = MEMORY[0x24BDAC7A8](v30, v31);
  v34 = (char *)&v68 - v33;
  MEMORY[0x24BDAC7A8](v32, v35);
  v37 = (char *)&v68 - v36;
  v38 = OUTLINED_FUNCTION_41(objc_allocWithZone(MEMORY[0x24BE95B60]));
  if (v38)
  {
    v39 = v38;
    v71 = a1;
    v69 = OUTLINED_FUNCTION_41(objc_allocWithZone(MEMORY[0x24BE95B68]));
    if (v69)
    {
      v40 = OUTLINED_FUNCTION_41(objc_allocWithZone(MEMORY[0x24BE95B68]));
      if (v40)
      {
        v41 = v40;
        sub_246EB8FB0(v75, (uint64_t)v25, &qword_25765BF30);
        v42 = v73;
        EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v25, 1, v73);
        v44 = v69;
        if ((_DWORD)EnumTagSinglePayload == 1)
        {
          OUTLINED_FUNCTION_45_0(EnumTagSinglePayload, &qword_25765BF30);
        }
        else
        {
          v60 = v74;
          OUTLINED_FUNCTION_24_3((uint64_t)v37, (uint64_t)v25, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 32));
          OUTLINED_FUNCTION_31_1();
          OUTLINED_FUNCTION_24_3((uint64_t)v34, (uint64_t)v37, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v60 + 16));
          v61 = sub_246EB890C((uint64_t)v34);
          OUTLINED_FUNCTION_20_5(v44, sel_setUuid_);

          (*(void (**)(char *, uint64_t))(v60 + 8))(v37, v42);
        }
        v62 = v71;
        objc_msgSend(v44, sel_setComponent_, *(unsigned int *)(v70 + 48));
        sub_246EB8FB0(v62, (uint64_t)v22, &qword_25765BF30);
        if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v42) == 1)
        {
          sub_246EB93A8((uint64_t)v22, &qword_25765BF30);
        }
        else
        {
          v63 = v74;
          v64 = v41;
          v65 = v68;
          OUTLINED_FUNCTION_24_3(v68, (uint64_t)v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 32));
          OUTLINED_FUNCTION_31_1();
          OUTLINED_FUNCTION_24_3((uint64_t)v34, v65, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v63 + 16));
          v66 = sub_246EB890C((uint64_t)v34);
          objc_msgSend(v64, (SEL)&selRef_setScoredDialogIdentifier_, v66);

          v44 = v69;
          v67 = v65;
          v41 = v64;
          (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v67, v42);
        }
        objc_msgSend(v41, sel_setComponent_, 1);
        objc_msgSend(v39, sel_setSource_, v44);
        objc_msgSend(v39, sel_setTarget_, v41);

        goto LABEL_24;
      }

      v39 = v69;
    }

    a1 = v71;
  }
  if (qword_25765A820 != -1)
    swift_once();
  v45 = OUTLINED_FUNCTION_24();
  __swift_project_value_buffer(v45, (uint64_t)qword_25765E558);
  OUTLINED_FUNCTION_57(a1, (uint64_t)v18);
  OUTLINED_FUNCTION_57(v75, (uint64_t)v14);
  v46 = sub_246EBE014();
  v47 = sub_246EBE200();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = OUTLINED_FUNCTION_4();
    v76 = OUTLINED_FUNCTION_4();
    *(_DWORD *)v48 = 136315394;
    sub_246EB8FB0((uint64_t)v18, (uint64_t)v10, &qword_25765BF30);
    v49 = v73;
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v73) == 1)
    {
      sub_246EB93A8((uint64_t)v10, &qword_25765BF30);
      v50 = 0xE300000000000000;
      v51 = 6369134;
    }
    else
    {
      v51 = sub_246EBDCCC();
      v50 = v52;
      (*(void (**)(char *, uint64_t))(v74 + 8))(v10, v49);
    }
    v53 = sub_246EBBD70(v51, v50, &v76);
    OUTLINED_FUNCTION_11_0(v53);
    sub_246EBE248();
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_47_0((uint64_t)v18);
    *(_WORD *)(v48 + 12) = 2080;
    v54 = v72;
    OUTLINED_FUNCTION_57((uint64_t)v14, v72);
    v55 = __swift_getEnumTagSinglePayload(v54, 1, v49);
    if ((_DWORD)v55 == 1)
    {
      OUTLINED_FUNCTION_45_0(v55, &qword_25765BF30);
      v56 = 0xE300000000000000;
      v57 = 6369134;
    }
    else
    {
      v57 = sub_246EBDCCC();
      v56 = v58;
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v54, v49);
    }
    v59 = sub_246EBBD70(v57, v56, &v76);
    OUTLINED_FUNCTION_11_0(v59);
    sub_246EBE248();
    OUTLINED_FUNCTION_16();
    sub_246EB93A8((uint64_t)v14, &qword_25765BF30);
    _os_log_impl(&dword_246E99000, v46, v47, "    Unable to create RequestLink schemas for SELF for requestId: %s,     and loggingGenerationId: %s", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_47_0((uint64_t)v18);
  OUTLINED_FUNCTION_47_0((uint64_t)v14);

LABEL_24:
  OUTLINED_FUNCTION_0_2();
}

id sub_246EB890C(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_246EBDCD8();
  v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  v5 = sub_246EBDCFC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_246EB8988(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;

  v33 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25765BF30);
  OUTLINED_FUNCTION_36();
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OUTLINED_FUNCTION_30_1();
  v12 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)&v31 - v18;
  v20 = *a1;
  v21 = OUTLINED_FUNCTION_13_4(objc_allocWithZone(MEMORY[0x24BE95360]));
  if (v21)
  {
    v22 = v21;
    v23 = OUTLINED_FUNCTION_13_4(objc_allocWithZone(MEMORY[0x24BE95368]));
    if (v23)
    {
      v31 = a3;
      v32 = v23;
      sub_246EB8FB0(a4, (uint64_t)v10, &qword_25765BF30);
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
      {
        sub_246EB93A8((uint64_t)v10, &qword_25765BF30);
        OUTLINED_FUNCTION_31_1();
        sub_246EBDCF0();
        v24 = OUTLINED_FUNCTION_44_0();
        v25 = v32;
        OUTLINED_FUNCTION_20_5(v32, sel_setNlgId_);

      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v10, v11);
        OUTLINED_FUNCTION_31_1();
        (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v19, v11);
        v30 = OUTLINED_FUNCTION_44_0();
        v25 = v32;
        OUTLINED_FUNCTION_20_5(v32, sel_setNlgId_);

        (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v11);
      }
      objc_msgSend(v22, sel_setEventMetadata_, v25);
      OUTLINED_FUNCTION_13_4(objc_allocWithZone(MEMORY[0x24BE95388]));
      OUTLINED_FUNCTION_13_4(objc_allocWithZone(MEMORY[0x24BE95378]));
      __asm { BR              X9 }
    }

  }
  if (qword_25765A820 != -1)
    swift_once();
  v26 = OUTLINED_FUNCTION_24();
  v27 = OUTLINED_FUNCTION_2_5(v26, (uint64_t)qword_25765E558);
  v28 = sub_246EBE200();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_246E99000, v27, v28, "Failed to initialize NLGSchema objects", v29, 2u);
    OUTLINED_FUNCTION_2();
  }

  OUTLINED_FUNCTION_0_2();
}

uint64_t sub_246EB8F08()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_246EB8F34()
{
  sub_246EB8F08();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SELFLogger()
{
  return objc_opt_self();
}

unint64_t sub_246EB8F74()
{
  unint64_t result;

  result = qword_25765BF38;
  if (!qword_25765BF38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25765BF38);
  }
  return result;
}

void sub_246EB8FB0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_28_0(a1, a2, a3);
  OUTLINED_FUNCTION_51_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_24_0();
}

uint64_t sub_246EB8FDC(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    OUTLINED_FUNCTION_5_6();
    result = sub_246EBE2D8();
    __break(1u);
  }
  else if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765BA28);
    result = sub_246EBE1AC();
    *(_QWORD *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_246EB9070(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_246EB90D4;
  return v6(a1);
}

uint64_t sub_246EB90D4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_10();
  return OUTLINED_FUNCTION_4_12(*(uint64_t (**)(void))(v0 + 8));
}

void sub_246EB90FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_246EBE098();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setScoredDialogIdentifier_, v4);

}

void sub_246EB914C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_246EBE098();
  objc_msgSend(a3, sel_setCatIdentifier_, v4);

}

void sub_246EB9190(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_246EBE098();
  objc_msgSend(a3, sel_setCatFamily_, v4);

}

uint64_t sub_246EB91D4(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_jsonData);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_246EBDCB4();

  return v3;
}

uint64_t sub_246EB9234(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_246EB9248(a1, a2);
  return a1;
}

uint64_t sub_246EB9248(uint64_t a1, unint64_t a2)
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

unint64_t sub_246EB928C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25765BF48;
  if (!qword_25765BF48)
  {
    v1 = sub_246EBDCFC();
    result = MEMORY[0x24956C6A0](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_25765BF48);
  }
  return result;
}

uint64_t sub_246EB92CC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  if (*(_QWORD *)(v0 + 72))
    __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocObject();
}

void sub_246EB9310(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_28_0(a1, a2, a3);
  OUTLINED_FUNCTION_51_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_24_0();
}

uint64_t sub_246EB933C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  v4 = OUTLINED_FUNCTION_21_4(v3);
  return sub_246EB7810(v4, v5, v6, v7, v2, v0 + 48);
}

void sub_246EB93A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_24_0();
}

uint64_t sub_246EB93E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_246EB9404(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_246EB748C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25765BF68 + dword_25765BF68))(a1, v4);
}

uint64_t sub_246EB9474()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 80))
    __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocObject();
}

uint64_t sub_246EB94B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = v0 + 56;
  v4 = *(_BYTE *)(v0 + 40);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  v6 = OUTLINED_FUNCTION_21_4(v5);
  return sub_246EB741C(v6, v7, v8, v9, v4, v2, v3);
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_12(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5_9(uint64_t a1)
{
  uint64_t v1;

  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_BYTE *)(a1 + 60) = 1;
  return sub_246EB0810(v1);
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return swift_task_switch();
}

id OUTLINED_FUNCTION_13_4(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

void OUTLINED_FUNCTION_14_4(uint64_t a1)
{
  uint64_t *v1;

  sub_246EB93A8(a1, v1);
}

void OUTLINED_FUNCTION_17_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_19_5(uint64_t (*a1)(void))
{
  return a1();
}

id OUTLINED_FUNCTION_20_5(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_21_4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_22_3(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 0, 1, a1);
}

BOOL OUTLINED_FUNCTION_23_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_24_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_25_4()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_26_3()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_28_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return sub_246EBDCFC();
}

unint64_t OUTLINED_FUNCTION_31_1()
{
  return sub_246EB8F74();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_33_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

void OUTLINED_FUNCTION_34_0()
{
  uint64_t v0;

  sub_246EB8340(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 136));
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_41(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_task_dealloc();
}

id OUTLINED_FUNCTION_44_0()
{
  uint64_t v0;

  return sub_246EB890C(v0);
}

void OUTLINED_FUNCTION_45_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_246EB93A8(v2, a2);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return sub_246EBE1F4();
}

void OUTLINED_FUNCTION_47_0(uint64_t a1)
{
  uint64_t *v1;

  sub_246EB93A8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_51_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_57(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_246EB8FB0(a1, a2, v2);
}

void OUTLINED_FUNCTION_58(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_246EB9310(a1, a2, v2);
}

void OUTLINED_FUNCTION_59(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_246EB1298(a1, a2, 1, v2);
}

_QWORD *OUTLINED_FUNCTION_60(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_62()
{
  unint64_t v0;
  uint64_t v1;

  return sub_246EB9234(v1, v0);
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_246EB74B0(v2, a2, v3);
}

uint64_t dispatch thunk of NLGDialogHistoryEntry.dialogSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLGDialogHistoryEntry.dialogIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of NLGDialogRecorder.history.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of NLGDialogRecorder.insert(dialog:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of NLGDialogRecorder.clear()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_246EB97F0(uint64_t result, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = result;
  v22 = *(_QWORD *)(result + 16);
  if (v22)
  {
    v4 = 0;
    v21 = result + 32;
    v19 = a2 + 7;
    v20 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      if (v4 >= *(_QWORD *)(v3 + 16))
      {
LABEL_29:
        __break(1u);
        return result;
      }
      v5 = (uint64_t *)(v21 + 16 * v4);
      v6 = *v5;
      v7 = v5[1];
      ++v4;
      v8 = a2[2];
      if (!v8)
        goto LABEL_19;
      result = a2[4];
      if (result != v6 || a2[5] != v7)
      {
        result = sub_246EBE368();
        if ((result & 1) == 0)
          break;
      }
LABEL_24:
      if (v4 == v22)
        goto LABEL_27;
    }
    if (v8 != 1)
    {
      v10 = v19;
      v11 = 1;
      while (1)
      {
        v12 = v11 + 1;
        if (__OFADD__(v11, 1))
          break;
        result = *(v10 - 1);
        if (result == v6 && *v10 == v7)
          goto LABEL_24;
        result = sub_246EBE368();
        if ((result & 1) != 0)
          goto LABEL_24;
        v10 += 2;
        ++v11;
        if (v12 == v8)
          goto LABEL_19;
      }
      __break(1u);
      goto LABEL_29;
    }
LABEL_19:
    swift_bridgeObjectRetain();
    result = swift_isUniquelyReferenced_nonNull_native();
    v14 = v20;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_246EB4FEC(0, *(_QWORD *)(v20 + 16) + 1, 1);
      v14 = v20;
    }
    v15 = v14;
    v17 = *(_QWORD *)(v14 + 16);
    v16 = *(_QWORD *)(v14 + 24);
    if (v17 >= v16 >> 1)
    {
      result = (uint64_t)sub_246EB4FEC((char *)(v16 > 1), v17 + 1, 1);
      v15 = v20;
    }
    *(_QWORD *)(v15 + 16) = v17 + 1;
    v20 = v15;
    v18 = v15 + 16 * v17;
    *(_QWORD *)(v18 + 32) = v6;
    *(_QWORD *)(v18 + 40) = v7;
    goto LABEL_24;
  }
  v20 = MEMORY[0x24BEE4AF8];
LABEL_27:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_246EB99B4(uint64_t a1)
{
  uint64_t v1;
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
  int EnumTagSinglePayload;
  uint64_t v15;
  void (*v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD, _QWORD, _QWORD);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = sub_246EBDDF8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765C060);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = a1;
  v12 = sub_246EBDD98();
  sub_246EBA028(&qword_25765C068, MEMORY[0x24BE68FE0]);
  swift_retain();
  sub_246EBE194();
  v13 = sub_246EBA028(&qword_25765C070, MEMORY[0x24BE68FE8]);
  sub_246EBE23C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v3);
  v27 = v1;
  if (EnumTagSinglePayload == 1)
  {
    v15 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v17 = *(void (**)(_QWORD, _QWORD, _QWORD))(v4 + 32);
    v15 = MEMORY[0x24BEE4AF8];
    v29 = v13;
    v30 = v4;
    v28 = v17;
    do
    {
      v17(v7, v11, v3);
      if ((sub_246EBDDEC() & 1) != 0)
      {
        v18 = v12;
        v19 = sub_246EBDDE0();
        v21 = v20;
        (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_246EB0AD0();
          v15 = v24;
        }
        v22 = *(_QWORD *)(v15 + 16);
        if (v22 >= *(_QWORD *)(v15 + 24) >> 1)
        {
          sub_246EB0AD0();
          v15 = v25;
        }
        *(_QWORD *)(v15 + 16) = v22 + 1;
        v23 = v15 + 16 * v22;
        *(_QWORD *)(v23 + 32) = v19;
        *(_QWORD *)(v23 + 40) = v21;
        v4 = v30;
        v12 = v18;
        v17 = v28;
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      }
      sub_246EBE23C();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v3) != 1);
  }
  swift_release();
  return v15;
}

uint64_t sub_246EB9C1C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25765C050);
  v4 = *(_QWORD *)(sub_246EBDDB0() - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_246EC00E0;
  v8 = v7 + v6;
  OUTLINED_FUNCTION_0_9(v8, *MEMORY[0x24BE69028]);
  OUTLINED_FUNCTION_0_9(v8 + v5, *MEMORY[0x24BE69020]);
  OUTLINED_FUNCTION_0_9(v8 + 2 * v5, *MEMORY[0x24BE69018]);
  OUTLINED_FUNCTION_0_9(v8 + 3 * v5, *MEMORY[0x24BE69000]);
  OUTLINED_FUNCTION_0_9(v8 + 4 * v5, *MEMORY[0x24BE69008]);
  sub_246EBDDD4();
  swift_allocObject();
  sub_246EBDDC8();
  sub_246EBDDBC();
  v9 = sub_246EBDDA4();
  v11 = sub_246EB99B4(v9);
  swift_bridgeObjectRetain();
  v12 = sub_246EB97F0(v11, a3);
  swift_release();
  swift_release();
  swift_release();
  return v12;
}

uint64_t sub_246EB9F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration16MorphunTokenizer_locale;
  v2 = sub_246EBDD8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_246EB9F7C()
{
  return type metadata accessor for MorphunTokenizer();
}

uint64_t type metadata accessor for MorphunTokenizer()
{
  uint64_t result;

  result = qword_25765BFC0;
  if (!qword_25765BFC0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_246EB9FBC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_246EBDD8C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_246EBA028(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_246EBDD98();
    result = MEMORY[0x24956C6A0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

void OUTLINED_FUNCTION_1_11()
{
  void *v0;

}

id OUTLINED_FUNCTION_3_10()
{
  void *v0;

  return v0;
}

uint64_t NLGDefaultProvider.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NLGDefaultProvider.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_246EBA098@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for DefaultDialogProvider();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = sub_246EB3230;
  *(_QWORD *)(result + 24) = 0;
  a1[3] = v2;
  a1[4] = (uint64_t)&off_25183BF88;
  *a1 = result;
  return result;
}

uint64_t NLGDefaultProvider.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t NLGDefaultProvider.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NLGDefaultProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for NLGDefaultProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NLGDefaultProvider.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of NLGDefaultProvider.dialogProvider()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t sub_246EBA140@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765C208);
  MEMORY[0x24BDAC7A8](v5, v6);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_246EBC7C8();
  sub_246EBE404();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v17) = 0;
  v7 = sub_246EBE32C();
  v10 = v9;
  v16 = v7;
  sub_246EBC804();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5_10();
  v15 = v17;
  LOBYTE(v17) = 1;
  v11 = sub_246EBE344();
  v20 = v11;
  if ((v11 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_10();
    OUTLINED_FUNCTION_3_11();
    v12 = v17;
    v13 = v18;
    v14 = v19;
  }
  else
  {
    OUTLINED_FUNCTION_3_11();
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  result = OUTLINED_FUNCTION_3();
  *(_QWORD *)a2 = v16;
  *(_QWORD *)(a2 + 8) = v10;
  *(_QWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 24) = v13;
  *(_QWORD *)(a2 + 32) = v14;
  *(_BYTE *)(a2 + 40) = (v20 & 1) == 0;
  *(_QWORD *)(a2 + 48) = v15;
  *(_QWORD *)(a2 + 56) = v18;
  *(_QWORD *)(a2 + 64) = v19;
  return result;
}

uint64_t sub_246EBA33C()
{
  unint64_t v0;

  v0 = sub_246EBE320();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_246EBA388()
{
  return 3;
}

uint64_t sub_246EBA390()
{
  return 0;
}

uint64_t sub_246EBA39C(char a1)
{
  if (!a1)
    return 0x726F74636146;
  if (a1 == 1)
    return 0xD000000000000023;
  return 0x6E6F6973726556;
}

void sub_246EBA3F4(unsigned __int8 *a1, char *a2)
{
  sub_246EA87BC(*a1, *a2);
}

void sub_246EBA400()
{
  char *v0;

  sub_246EAD734(*v0);
}

uint64_t sub_246EBA408(uint64_t a1)
{
  char *v1;

  return sub_246EAD740(a1, *v1);
}

void sub_246EBA410(uint64_t a1)
{
  char *v1;

  sub_246EAD8B0(a1, *v1);
}

uint64_t sub_246EBA418@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246EBA33C();
  *a1 = result;
  return result;
}

uint64_t sub_246EBA444@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_246EBA39C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_246EBA46C()
{
  char *v0;

  return sub_246EBA39C(*v0);
}

uint64_t sub_246EBA474@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246EBA384();
  *a1 = result;
  return result;
}

uint64_t sub_246EBA498()
{
  return sub_246EBA390();
}

uint64_t sub_246EBA4B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_246EBA388();
  *a1 = result;
  return result;
}

uint64_t sub_246EBA4D8()
{
  sub_246EBC7C8();
  return sub_246EBE410();
}

uint64_t sub_246EBA500()
{
  sub_246EBC7C8();
  return sub_246EBE41C();
}

void *sub_246EBA528@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  void *result;
  _BYTE __src[72];

  result = (void *)sub_246EBA140(a1, (uint64_t)__src);
  if (!v2)
    return memcpy(a2, __src, 0x48uLL);
  return result;
}

double sub_246EBA570()
{
  uint64_t v0;
  double result;

  type metadata accessor for DialogEngineAssetClient();
  v0 = swift_allocObject();
  result = 0.0;
  *(_OWORD *)(v0 + 16) = xmmword_246EBFF70;
  qword_25765E620 = v0;
  return result;
}

void sub_246EBA5A4()
{
  uint64_t *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v1 = (void *)v0[3];
  if (v1 == (void *)1)
  {
    v2 = sub_246EBA5FC((uint64_t)v0, *v0);
    v3 = (void *)v0[3];
    v0[3] = (uint64_t)v2;
    v4 = v2;
    sub_246EBC584(v3);
  }
  sub_246EBC594(v1);
  OUTLINED_FUNCTION_8_2();
}

id sub_246EBA5FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t aBlock[6];
  uint64_t v27;

  v4 = swift_allocObject();
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_sharedManager);
  v7 = (void *)sub_246EBE098();
  v8 = objc_msgSend(v6, sel_retrieveAssetSet_usages_, v7, 0);

  if (v8)
  {
    *(_QWORD *)(v4 + 16) = v8;
    if (qword_25765A820 != -1)
      swift_once();
    v9 = sub_246EBE02C();
    __swift_project_value_buffer(v9, (uint64_t)qword_25765E558);
    v10 = sub_246EBE014();
    v11 = sub_246EBE1F4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      v13 = aBlock[0];
      *(_DWORD *)v12 = 136315138;
      v27 = sub_246EBBD70(0xD000000000000015, 0x8000000246EC1500, aBlock);
      sub_246EBE248();
      _os_log_impl(&dword_246E99000, v10, v11, "Initialized asset set for %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24956C73C](v13, -1, -1);
      MEMORY[0x24956C73C](v12, -1, -1);
    }

    v14 = objc_msgSend(v5, sel_sharedManager);
    v15 = (void *)sub_246EBE098();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v4;
    *(_QWORD *)(v16 + 24) = a2;
    aBlock[4] = (uint64_t)sub_246EBC5EC;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_246EBAD10;
    aBlock[3] = (uint64_t)&block_descriptor;
    v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    v18 = objc_msgSend(v14, sel_observeAssetSet_queue_handler_, v15, 0, v17);
    _Block_release(v17);

    *(_QWORD *)(a1 + 16) = v18;
    swift_unknownObjectRelease();
    swift_beginAccess();
    v19 = *(id *)(v4 + 16);
    swift_release();
  }
  else
  {
    swift_deallocUninitializedObject();
    if (qword_25765A820 != -1)
      swift_once();
    v20 = sub_246EBE02C();
    __swift_project_value_buffer(v20, (uint64_t)qword_25765E558);
    v21 = sub_246EBE014();
    v22 = sub_246EBE200();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      aBlock[0] = v24;
      *(_DWORD *)v23 = 136315138;
      v27 = sub_246EBBD70(0xD000000000000015, 0x8000000246EC1500, aBlock);
      sub_246EBE248();
      _os_log_impl(&dword_246E99000, v21, v22, "Unable to initialize asset set for %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24956C73C](v24, -1, -1);
      MEMORY[0x24956C73C](v23, -1, -1);
    }

    return 0;
  }
  return v19;
}

void sub_246EBAA78(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  void *v7;
  id v8;
  void **v9;
  void *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *oslog;
  uint64_t v15[4];

  if (qword_25765A820 != -1)
    swift_once();
  v2 = sub_246EBE02C();
  __swift_project_value_buffer(v2, (uint64_t)qword_25765E558);
  v3 = sub_246EBE014();
  v4 = sub_246EBE1F4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_246E99000, v3, v4, "Refreshing asset set", v5, 2u);
    MEMORY[0x24956C73C](v5, -1, -1);
  }

  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v7 = (void *)sub_246EBE098();
  v8 = objc_msgSend(v6, sel_retrieveAssetSet_usages_, v7, 0);

  if (v8)
  {
    v9 = (void **)(a1 + 16);
    swift_beginAccess();
    v10 = *v9;
    *v9 = v8;

  }
  else
  {
    oslog = sub_246EBE014();
    v11 = sub_246EBE200();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v15[0] = v13;
      *(_DWORD *)v12 = 136315138;
      v15[3] = sub_246EBBD70(0xD000000000000015, 0x8000000246EC1500, v15);
      sub_246EBE248();
      _os_log_impl(&dword_246E99000, oslog, v11, "Unable to update asset set for %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24956C73C](v13, -1, -1);
      MEMORY[0x24956C73C](v12, -1, -1);

    }
    else
    {

    }
  }
}

void sub_246EBAD00(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = a1;
  sub_246EBC584(v2);
}

uint64_t sub_246EBAD10(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_246EBAD3C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
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
  char *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v43)(char *, NSObject *, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t *v97;
  _QWORD v98[3];
  char *v99;
  char *v100;
  void (*v101)(char *, char *, uint64_t);
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD v108[6];
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112[2];
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char v117[8];
  _QWORD v118[3];
  char v119;

  v104 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B250);
  v3 = MEMORY[0x24BDAC7A8](v1, v2);
  v5 = (char *)v98 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3, v6);
  v8 = ((char *)v98 - v7);
  v105 = sub_246EBDC9C();
  v103 = *(_QWORD *)(v105 - 8);
  v10 = MEMORY[0x24BDAC7A8](v105, v9);
  v12 = (void (*)(char *, char *, uint64_t))((char *)v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = MEMORY[0x24BDAC7A8](v10, v13);
  v16 = MEMORY[0x24BDAC7A8](v14, v15);
  v18 = (char *)v98 - v17;
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)v98 - v21;
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)v98 - v24;
  sub_246EBBBA0((uint64_t)v108);
  v100 = v22;
  v101 = v12;
  v99 = v18;
  v102 = v25;
  v26 = v108[0];
  v27 = v108[1];
  OUTLINED_FUNCTION_10_5();
  sub_246EBA5A4();
  if (!v28)
  {
    OUTLINED_FUNCTION_1_12();
    goto LABEL_6;
  }
  v29 = v28;
  v30 = (void *)sub_246EBE098();
  OUTLINED_FUNCTION_1_12();
  v31 = objc_msgSend(v29, sel_assetNamed_, v30);

  if (!v31)
  {
LABEL_6:
    OUTLINED_FUNCTION_29_2((uint64_t)v8, 1, 1);
LABEL_9:
    sub_246EBBE90((uint64_t)v8);
    if (qword_25765A820 != -1)
      swift_once();
    v36 = OUTLINED_FUNCTION_24();
    __swift_project_value_buffer(v36, (uint64_t)qword_25765E558);
    OUTLINED_FUNCTION_10_5();
    sub_246EBE014();
    v37 = OUTLINED_FUNCTION_28_1();
    if (os_log_type_enabled(v8, v37))
    {
      v38 = (uint8_t *)OUTLINED_FUNCTION_4();
      v112[0] = OUTLINED_FUNCTION_4();
      *(_DWORD *)v38 = 136315138;
      OUTLINED_FUNCTION_10_5();
      v39 = sub_246EBBD70(v26, v27, v112);
      OUTLINED_FUNCTION_32_1(v39);
      OUTLINED_FUNCTION_26_4();
      OUTLINED_FUNCTION_1_12();
      OUTLINED_FUNCTION_1_12();
      OUTLINED_FUNCTION_1_12();
      OUTLINED_FUNCTION_8_4(&dword_246E99000, v8, v37, "No updated directory for '%s'", v38);
      OUTLINED_FUNCTION_35_1();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_1_12();
    OUTLINED_FUNCTION_1_12();

    goto LABEL_14;
  }
  v32 = objc_msgSend(v31, sel_location);

  v33 = v105;
  if (v32)
  {
    sub_246EBDC6C();

    v34 = 0;
  }
  else
  {
    v34 = 1;
  }
  v35 = v103;
  OUTLINED_FUNCTION_29_2((uint64_t)v5, v34, 1);
  sub_246EBBED0((uint64_t)v5, (uint64_t)v8, &qword_25765B250);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v33) == 1)
    goto LABEL_9;
  v43 = *(void (**)(char *, NSObject *, uint64_t))(v35 + 32);
  v44 = v102;
  v43(v102, v8, v33);
  sub_246EBBBA0((uint64_t)v112);
  if (qword_25765A820 != -1)
    swift_once();
  v45 = OUTLINED_FUNCTION_24();
  v46 = __swift_project_value_buffer(v45, (uint64_t)qword_25765E558);
  v47 = v100;
  v101 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  v101(v100, v44, v33);
  v103 = v46;
  sub_246EBE014();
  v48 = v35;
  v49 = OUTLINED_FUNCTION_28_1();
  if (os_log_type_enabled(v8, v49))
  {
    v50 = (uint8_t *)OUTLINED_FUNCTION_4();
    v118[0] = OUTLINED_FUNCTION_4();
    *(_DWORD *)v50 = 136315138;
    sub_246EB59FC();
    v51 = OUTLINED_FUNCTION_31_2();
    v53 = OUTLINED_FUNCTION_33_1(v51, v52);
    OUTLINED_FUNCTION_9_6(v53);
    sub_246EBE248();
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_12_5();
    OUTLINED_FUNCTION_8_4(&dword_246E99000, v8, v49, "Found asset config in %s", v50);
    OUTLINED_FUNCTION_35_1();
    OUTLINED_FUNCTION_2();
  }
  v54 = *(void (**)(char *, uint64_t))(v48 + 8);
  v54(v47, v33);

  sub_246EBBED0((uint64_t)&v113, (uint64_t)v117, (uint64_t *)&stru_25765C1F8);
  sub_246EBBED0((uint64_t)v117, (uint64_t)v118, (uint64_t *)&stru_25765C1F8);
  if ((v119 & 1) != 0)
  {
    OUTLINED_FUNCTION_4_13();
    OUTLINED_FUNCTION_1_12();
    OUTLINED_FUNCTION_7_10();
    v55 = OUTLINED_FUNCTION_28_1();
    if (os_log_type_enabled(&stru_25765C1F8, v55))
    {
      v56 = (uint8_t *)OUTLINED_FUNCTION_4();
      v57 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_27_3(v57);
      *(_DWORD *)v56 = 136315138;
      v58 = sub_246EBBD70(0xD000000000000019, 0x8000000246EC12C0, &v107);
      OUTLINED_FUNCTION_11_4(v58);
      OUTLINED_FUNCTION_26_4();
      OUTLINED_FUNCTION_8_4(&dword_246E99000, &stru_25765C1F8, v55, "Updated %s missing min diff update version", v56);
      OUTLINED_FUNCTION_35_1();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_12_5();
    goto LABEL_14;
  }
  v100 = (char *)v54;
  v59 = v118[0];
  v60 = v118[1];
  v61 = v118[2];
  v63 = v109;
  v62 = v110;
  v64 = v111;
  v98[1] = v114;
  v65 = sub_246EA64A0(v114, v115, v116, v109, v110, v111);
  v98[2] = v62;
  if ((v65 & 1) == 0)
  {
    OUTLINED_FUNCTION_10_5();
    sub_246EBBE40((uint64_t)v112);
    v79 = OUTLINED_FUNCTION_7_10();
    v80 = sub_246EBE1F4();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = OUTLINED_FUNCTION_4();
      v82 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_27_3(v82);
      *(_DWORD *)v81 = 136315394;
      v83 = OUTLINED_FUNCTION_13_5();
      v85 = OUTLINED_FUNCTION_6_11(v83, v84);
      OUTLINED_FUNCTION_11_4(v85);
      OUTLINED_FUNCTION_17_6();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_13();
      OUTLINED_FUNCTION_4_13();
      *(_WORD *)(v81 + 12) = 2080;
      v86 = sub_246EA6344();
      v106 = OUTLINED_FUNCTION_6_11(v86, v87);
      sub_246EBE248();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_1_12();
      OUTLINED_FUNCTION_1_12();
      _os_log_impl(&dword_246E99000, v79, v80, "Updated asset has older version %s <= %s", (uint8_t *)v81, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_1_12();
    OUTLINED_FUNCTION_1_12();
    OUTLINED_FUNCTION_4_13();
    v97 = v112;
    goto LABEL_35;
  }
  v105 = v63;
  if ((sub_246EA6470(v63, v62, v64, v59, v60, v61) & 1) == 0)
  {
    OUTLINED_FUNCTION_4_13();
    OUTLINED_FUNCTION_10_5();
    v88 = OUTLINED_FUNCTION_7_10();
    v89 = sub_246EBE1F4();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = OUTLINED_FUNCTION_4();
      v91 = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_27_3(v91);
      *(_DWORD *)v90 = 136315394;
      v92 = sub_246EA6344();
      v94 = OUTLINED_FUNCTION_6_11(v92, v93);
      OUTLINED_FUNCTION_11_4(v94);
      OUTLINED_FUNCTION_17_6();
      swift_bridgeObjectRelease();
      *(_WORD *)(v90 + 12) = 2080;
      OUTLINED_FUNCTION_30_2();
      v95 = sub_246EA6344();
      v106 = OUTLINED_FUNCTION_6_11(v95, v96);
      OUTLINED_FUNCTION_17_6();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_1_12();
      OUTLINED_FUNCTION_1_12();
      _os_log_impl(&dword_246E99000, v88, v89, "Updated asset has newer minimum version %s > %s", (uint8_t *)v90, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_1_12();
    v97 = v108;
LABEL_35:
    sub_246EBBE68((uint64_t)v97);
    OUTLINED_FUNCTION_14_5();
LABEL_14:
    v40 = 1;
    v41 = v104;
    return OUTLINED_FUNCTION_29_2(v41, v40, 1);
  }
  v98[0] = v43;
  v101(v99, v102, v33);
  OUTLINED_FUNCTION_10_5();
  sub_246EBBE40((uint64_t)v112);
  v66 = v33;
  v67 = OUTLINED_FUNCTION_7_10();
  v68 = sub_246EBE1F4();
  if (os_log_type_enabled(v67, v68))
  {
    v69 = OUTLINED_FUNCTION_4();
    v103 = OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_27_3(v103);
    *(_DWORD *)v69 = 136315650;
    v101 = (void (*)(char *, char *, uint64_t))v64;
    sub_246EB59FC();
    v70 = sub_246EBE35C();
    v72 = OUTLINED_FUNCTION_6_11(v70, v71);
    OUTLINED_FUNCTION_11_4(v72);
    OUTLINED_FUNCTION_17_6();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_14_5();
    *(_WORD *)(v69 + 12) = 2080;
    v73 = OUTLINED_FUNCTION_13_5();
    v75 = OUTLINED_FUNCTION_6_11(v73, v74);
    OUTLINED_FUNCTION_24_4(v75);
    OUTLINED_FUNCTION_17_6();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_13();
    OUTLINED_FUNCTION_4_13();
    *(_WORD *)(v69 + 22) = 2080;
    OUTLINED_FUNCTION_30_2();
    v76 = sub_246EA6344();
    v78 = OUTLINED_FUNCTION_6_11(v76, v77);
    OUTLINED_FUNCTION_24_4(v78);
    sub_246EBE248();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_1_12();
    OUTLINED_FUNCTION_1_12();
    _os_log_impl(&dword_246E99000, v67, v68, "Returning %s (%s > %s)", (uint8_t *)v69, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_14_5();
  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_4_13();
  OUTLINED_FUNCTION_1_12();
  OUTLINED_FUNCTION_1_12();

  v41 = v104;
  ((void (*)(uint64_t, char *, uint64_t))v98[0])(v104, v102, v66);
  v40 = 0;
  return OUTLINED_FUNCTION_29_2(v41, v40, 1);
}

uint64_t sub_246EBBBA0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  uint64_t v12;

  v3 = sub_246EBDC9C();
  MEMORY[0x24BDAC7A8](v3, v4);
  sub_246EBDC60();
  sub_246EBDCA8();
  if (v1)
    return OUTLINED_FUNCTION_8_6();
  sub_246EBDC3C();
  swift_allocObject();
  sub_246EBDC30();
  sub_246EBC548();
  sub_246EBDC24();
  OUTLINED_FUNCTION_8_6();
  swift_release();
  result = OUTLINED_FUNCTION_21_5();
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 40) = v10;
  *(_OWORD *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 64) = v12;
  return result;
}

uint64_t sub_246EBBD0C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  sub_246EBC584(*(id *)(v0 + 24));
  return v0;
}

uint64_t sub_246EBBD30()
{
  sub_246EBBD0C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DialogEngineAssetClient()
{
  return objc_opt_self();
}

uint64_t sub_246EBBD70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_246EBBF14(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_246EB19E0((uint64_t)v12, *a3);
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
      sub_246EB19E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_246EBBE40(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_246EBBE68(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246EBBE90(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25765B250);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246EBBED0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_246EBBF14(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_246EBC068((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_246EBE254();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_246EBC12C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_246EBE2B4();
    if (!v8)
    {
      result = sub_246EBE2D8();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_246EBC068(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246EBE314();
  __break(1u);
  return result;
}

uint64_t sub_246EBC12C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_246EBC1C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_246EBC330(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_246EBC330((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_246EBC1C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_246EBE128();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_246EA6648(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_246EBE29C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_246EBE314();
  __break(1u);
LABEL_14:
  result = sub_246EBE2D8();
  __break(1u);
  return result;
}

char *sub_246EBC330(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25765B288);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_246EBC4C8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_246EBC404(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_246EBC404(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246EBE314();
  __break(1u);
  return result;
}

char *sub_246EBC4C8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_246EBE314();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_246EBC548()
{
  unint64_t result;

  result = qword_25765C200;
  if (!qword_25765C200)
  {
    result = MEMORY[0x24956C6A0](&unk_246EC01F4, &type metadata for DialogAssetDelivery);
    atomic_store(result, (unint64_t *)&qword_25765C200);
  }
  return result;
}

void sub_246EBC584(id a1)
{
  if (a1 != (id)1)

}

id sub_246EBC594(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

uint64_t sub_246EBC5A4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_246EBC5C8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_246EBC5EC()
{
  uint64_t v0;

  sub_246EBAA78(*(_QWORD *)(v0 + 16));
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

uint64_t initializeWithCopy for DialogAssetDelivery(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DialogAssetDelivery(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for DialogAssetDelivery(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for DialogAssetDelivery(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
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

uint64_t storeEnumTagSinglePayload for DialogAssetDelivery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogAssetDelivery()
{
  return &type metadata for DialogAssetDelivery;
}

unint64_t sub_246EBC7C8()
{
  unint64_t result;

  result = qword_25765C210;
  if (!qword_25765C210)
  {
    result = MEMORY[0x24956C6A0](&unk_246EC0318, &type metadata for DialogAssetDelivery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25765C210);
  }
  return result;
}

unint64_t sub_246EBC804()
{
  unint64_t result;

  result = qword_25765C218;
  if (!qword_25765C218)
  {
    result = MEMORY[0x24956C6A0](&unk_246EBED30, &type metadata for SemanticVersion);
    atomic_store(result, (unint64_t *)&qword_25765C218);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DialogAssetDelivery.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246EBC88C + 4 * byte_246EC01A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246EBC8C0 + 4 * byte_246EC01A0[v4]))();
}

uint64_t sub_246EBC8C0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EBC8C8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246EBC8D0);
  return result;
}

uint64_t sub_246EBC8DC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246EBC8E4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246EBC8E8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EBC8F0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DialogAssetDelivery.CodingKeys()
{
  return &type metadata for DialogAssetDelivery.CodingKeys;
}

unint64_t sub_246EBC910()
{
  unint64_t result;

  result = qword_25765C220;
  if (!qword_25765C220)
  {
    result = MEMORY[0x24956C6A0](&unk_246EC02F0, &type metadata for DialogAssetDelivery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25765C220);
  }
  return result;
}

unint64_t sub_246EBC950()
{
  unint64_t result;

  result = qword_25765C228;
  if (!qword_25765C228)
  {
    result = MEMORY[0x24956C6A0](&unk_246EC0228, &type metadata for DialogAssetDelivery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25765C228);
  }
  return result;
}

unint64_t sub_246EBC990()
{
  unint64_t result;

  result = qword_25765C230;
  if (!qword_25765C230)
  {
    result = MEMORY[0x24956C6A0](&unk_246EC0250, &type metadata for DialogAssetDelivery.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25765C230);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  uint64_t v0;

  return sub_246EBBE68(v0 - 296);
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  uint64_t v0;

  return sub_246EBBE68(v0 - 224);
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return sub_246EBE338();
}

uint64_t OUTLINED_FUNCTION_6_11(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_246EBBD70(a1, a2, (uint64_t *)(v2 - 312));
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return sub_246EBE014();
}

uint64_t OUTLINED_FUNCTION_8_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_9_6(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 152) = a1;
  return v1 - 152;
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  uint64_t v0;

  return sub_246EBBE40(v0 - 296);
}

uint64_t OUTLINED_FUNCTION_11_4(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 320) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return sub_246EA6344();
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 368))();
}

uint64_t OUTLINED_FUNCTION_17_6()
{
  return sub_246EBE248();
}

BOOL OUTLINED_FUNCTION_18_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21_5()
{
  unint64_t v0;
  uint64_t v1;

  return sub_246EB9248(v1, v0);
}

uint64_t OUTLINED_FUNCTION_24_4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 320) = a1;
  return v1 - 320;
}

uint64_t OUTLINED_FUNCTION_25_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return sub_246EBE248();
}

uint64_t OUTLINED_FUNCTION_27_3(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 312) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_246EBE1F4();
}

uint64_t OUTLINED_FUNCTION_29_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 328);
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return sub_246EBE35C();
}

uint64_t OUTLINED_FUNCTION_32_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = a1;
  return v1 - 120;
}

uint64_t OUTLINED_FUNCTION_33_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_246EBBD70(a1, a2, (uint64_t *)(v2 - 120));
}

uint64_t sub_246EBCB40(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  ValueMetadata *v18;
  _UNKNOWN **v19;
  uint64_t v20;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_246EB5040(0, v1, 0);
    v2 = v20;
    v4 = (uint64_t *)(a1 + 48);
    do
    {
      v5 = *(v4 - 1);
      v6 = v4[1];
      v15 = *v4;
      v16 = *(v4 - 2);
      v7 = v4[3];
      v8 = v4[5];
      v13 = v4[4];
      v14 = v4[2];
      v9 = *(_QWORD *)(v2 + 16);
      v10 = *(_QWORD *)(v2 + 24);
      v20 = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v9 >= v10 >> 1)
      {
        sub_246EB5040(v10 > 1, v9 + 1, 1);
        v2 = v20;
      }
      v4 += 8;
      v18 = &type metadata for UserDefaultsDialogHistoryEntry;
      v19 = &off_25183C030;
      v11 = (_QWORD *)OUTLINED_FUNCTION_4_3();
      *(_QWORD *)&v17 = v11;
      v11[2] = v16;
      v11[3] = v5;
      v11[4] = v15;
      v11[5] = v6;
      v11[6] = v14;
      v11[7] = v7;
      v11[8] = v13;
      v11[9] = v8;
      *(_QWORD *)(v2 + 16) = v9 + 1;
      sub_246EA00C4(&v17, v2 + 40 * v9 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_246EBCC98(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  void *v9;
  _UNKNOWN **v10;
  _BYTE v11[48];
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_246EB5088(0, v1, 0);
    v2 = v12;
    v4 = a1 + 32;
    do
    {
      sub_246EB29A0(v4, (uint64_t)v11);
      v12 = v2;
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_246EB5088(v5 > 1, v6 + 1, 1);
        v2 = v12;
      }
      v9 = &unk_25183C4F8;
      v10 = &off_25183C620;
      *(_QWORD *)&v8 = OUTLINED_FUNCTION_4_3();
      sub_246EB29A0((uint64_t)v11, v8 + 16);
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_246EA00C4(&v8, v2 + 40 * v6 + 32);
      sub_246EB29DC((uint64_t)v11);
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_246EBCDB8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  _BYTE v11[48];
  __int128 v12;
  _OWORD v13[2];
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_246EB510C(0, v1, 0);
    v4 = a1 + 32;
    v2 = v14;
    do
    {
      sub_246EBD59C(v4, (uint64_t)v11);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25765C240);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25765BBE8);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_246EB510C(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v14;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_246EB510C(v5 > 1, v6 + 1, 1);
        v2 = v14;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      v7 = (_OWORD *)(v2 + 48 * v6);
      v8 = v12;
      v9 = v13[0];
      *(_OWORD *)((char *)v7 + 60) = *(_OWORD *)((char *)v13 + 12);
      v7[2] = v8;
      v7[3] = v9;
      v4 += 48;
      --v1;
    }
    while (v1);
  }
  return v2;
}

BOOL static NLGDialogScorerType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t NLGDialogScorerType.hash(into:)()
{
  return sub_246EBE3E0();
}

uint64_t NLGDialogScorerType.hashValue.getter()
{
  sub_246EBE3D4();
  sub_246EBE3E0();
  return sub_246EBE3EC();
}

uint64_t static NLGDialogScorers.createTFIDFScorer(query:localeIdentifier:stopWords:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t *a4@<X8>)
{
  return static NLGDialogScorers.createTFIDFScorer(query:localeIdentifier:stopWords:using:overwriteSimilarityScore:)(a1, a2, a3, (uint64_t)sub_246EBCF98, 0, 0, a4);
}

uint64_t sub_246EBCF98(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = a1[3];
  v2 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v1);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v2 + 16))(v7, v1, v2);
  v3 = v8;
  v4 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

uint64_t static NLGDialogScorers.createTFIDFScorer(query:localeIdentifier:stopWords:using:overwriteSimilarityScore:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, int a6@<W7>, uint64_t *a7@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  int v31;
  _QWORD v32[5];

  v31 = a6;
  v30 = a4;
  v12 = sub_246EBDD8C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_246EBDD08();
  type metadata accessor for MorphunTokenizer();
  v17 = swift_allocObject();
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v17 + OBJC_IVAR____TtC29SiriNaturalLanguageGeneration16MorphunTokenizer_locale, v16, v12);
  type metadata accessor for CosineSimilarity();
  v18 = OUTLINED_FUNCTION_4_3();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v19 = sub_246EBD298(a1, a2, a3, v17, v18);
  v20 = type metadata accessor for TFIDFScorer();
  v32[3] = v20;
  v32[4] = &off_25183B248;
  v32[0] = v19;
  v21 = type metadata accessor for DialogScorer();
  v22 = OUTLINED_FUNCTION_4_3();
  v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v20);
  MEMORY[0x24BDAC7A8](v23, v23);
  v25 = (uint64_t *)((char *)&v29 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  v27 = *v25;
  *(_QWORD *)(v22 + 40) = v20;
  *(_QWORD *)(v22 + 48) = &off_25183B248;
  *(_QWORD *)(v22 + 16) = v27;
  *(_QWORD *)(v22 + 56) = v30;
  *(_QWORD *)(v22 + 64) = a5;
  *(_BYTE *)(v22 + 72) = v31;
  swift_retain();
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  a7[3] = v21;
  a7[4] = (uint64_t)&off_25183BF68;
  swift_release();
  result = swift_release();
  *a7 = v22;
  return result;
}

uint64_t static NLGDialogScorers.createWeightedScorer(adding:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = type metadata accessor for WeightedDialogScorer();
  v3 = OUTLINED_FUNCTION_4_3();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_246EBCDB8(v4);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v3 + 16) = v5;
  a1[3] = v2;
  a1[4] = (uint64_t)&off_25183BF58;
  *a1 = v3;
  return result;
}

_QWORD *sub_246EBD298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[3];
  uint64_t v25;
  _UNKNOWN **v26;
  _QWORD v27[5];

  v10 = type metadata accessor for MorphunTokenizer();
  v27[3] = v10;
  v27[4] = &off_25183C0F0;
  v27[0] = a4;
  v11 = type metadata accessor for CosineSimilarity();
  v25 = v11;
  v26 = &off_25183B238;
  v24[0] = a5;
  type metadata accessor for TFIDFScorer();
  v12 = (_QWORD *)swift_allocObject();
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, v10);
  MEMORY[0x24BDAC7A8](v13, v13);
  v15 = (_QWORD *)((char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v24, v25);
  MEMORY[0x24BDAC7A8](v17, v17);
  v19 = (_QWORD *)((char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  v21 = *v15;
  v22 = *v19;
  v12[8] = v10;
  v12[9] = &off_25183C0F0;
  v12[10] = v22;
  v12[13] = v11;
  v12[14] = &off_25183B238;
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = a3;
  v12[5] = v21;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return v12;
}

unint64_t sub_246EBD414()
{
  unint64_t result;

  result = qword_25765C238;
  if (!qword_25765C238)
  {
    result = MEMORY[0x24956C6A0](&protocol conformance descriptor for NLGDialogScorerType, &type metadata for NLGDialogScorerType);
    atomic_store(result, (unint64_t *)&qword_25765C238);
  }
  return result;
}

uint64_t dispatch thunk of NLGDialogScorer.score(dialogs:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of NLGDialogScorerTypeSetting.scorerType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t storeEnumTagSinglePayload for NLGDialogScorerType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246EBD4AC + 4 * byte_246EC0375[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246EBD4E0 + 4 * byte_246EC0370[v4]))();
}

uint64_t sub_246EBD4E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EBD4E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246EBD4F0);
  return result;
}

uint64_t sub_246EBD4FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246EBD504);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246EBD508(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246EBD510(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NLGDialogScorerType()
{
  return &type metadata for NLGDialogScorerType;
}

ValueMetadata *type metadata accessor for NLGDialogScorers()
{
  return &type metadata for NLGDialogScorers;
}

uint64_t sub_246EBD53C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_246EBD578()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_246EBD59C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25765C240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_246EBD5E4(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t sub_246EBD628(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy44_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 28) = *(_OWORD *)(a2 + 28);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_246EBD66C(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 40) = *(_DWORD *)(a2 + 40);
  return a1;
}

uint64_t sub_246EBD6AC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 44))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t sub_246EBD6EC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 44) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 44) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for DefaultScoredDialog()
{
  OUTLINED_FUNCTION_1_6();
}

uint64_t sub_246EBD744(uint64_t a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  result = *(_QWORD *)(a1 + 64);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_246EBD794(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2 + 16;
  v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  v7 = v6;
  v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  swift_bridgeObjectRetain();
  v8(a1 + 16, v5, v7);
  v9 = *(_QWORD *)(a2 + 64);
  if (v9)
  {
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = v9;
    v10 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = v10;
    v11 = *(_QWORD *)(a2 + 88);
    v12 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 88) = v11;
    *(_QWORD *)(a1 + 96) = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v13 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v13;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  }
  return a1;
}

_QWORD *sub_246EBD850(_QWORD *a1, _QWORD *a2)
{
  _OWORD *v4;
  _OWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  v4 = a1 + 7;
  v5 = a2 + 7;
  v6 = a2[8];
  if (a1[8])
  {
    if (v6)
    {
      a1[7] = a2[7];
      a1[8] = a2[8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[9] = a2[9];
      a1[10] = a2[10];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      a1[11] = a2[11];
      a1[12] = a2[12];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_246EBD9A0((uint64_t)(a1 + 7));
      v8 = *(_OWORD *)(a2 + 9);
      v7 = *(_OWORD *)(a2 + 11);
      *v4 = *v5;
      *(_OWORD *)(a1 + 9) = v8;
      *(_OWORD *)(a1 + 11) = v7;
    }
  }
  else if (v6)
  {
    a1[7] = a2[7];
    a1[8] = a2[8];
    a1[9] = a2[9];
    a1[10] = a2[10];
    a1[11] = a2[11];
    a1[12] = a2[12];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v9 = *v5;
    v10 = *(_OWORD *)(a2 + 11);
    *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 11) = v10;
    *v4 = v9;
  }
  return a1;
}

uint64_t sub_246EBD9A0(uint64_t a1)
{
  destroy for NLGDialogSource();
  return a1;
}

void *__swift_memcpy104_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x68uLL);
}

uint64_t sub_246EBD9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  if (!*(_QWORD *)(a1 + 64))
    goto LABEL_5;
  v6 = *(_QWORD *)(a2 + 64);
  if (!v6)
  {
    sub_246EBD9A0(a1 + 56);
LABEL_5:
    v9 = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 72) = v9;
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
    return a1;
  }
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_246EBDA90(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 104))
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

uint64_t sub_246EBDAD0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for DefaultDialog()
{
  OUTLINED_FUNCTION_1_6();
}

void type metadata accessor for DefaultDialogContent()
{
  OUTLINED_FUNCTION_1_6();
}

uint64_t sub_246EBDB40()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_246EBDB6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_246EA297C(v1 + 16, a1);
}

uint64_t sub_246EBDB88@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v1[7];
  v3 = v1[8];
  v4 = v1[9];
  v5 = v1[10];
  v6 = v1[11];
  v7 = v1[12];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  a1[5] = v7;
  return sub_246EB19A4(v2, v3);
}

uint64_t sub_246EBDBA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_246EBDBD0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_246EBDBFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_246EA297C(v1, a1);
}

float sub_246EBDC18()
{
  uint64_t v0;

  return *(float *)(v0 + 40);
}

uint64_t sub_246EBDC24()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_246EBDC30()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_246EBDC3C()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_246EBDC48()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_246EBDC54()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_246EBDC60()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_246EBDC6C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_246EBDC78()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_246EBDC84()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_246EBDC90()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_246EBDC9C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_246EBDCA8()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_246EBDCB4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_246EBDCC0()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_246EBDCCC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_246EBDCD8()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_246EBDCE4()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_246EBDCF0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_246EBDCFC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_246EBDD08()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_246EBDD14()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_246EBDD20()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_246EBDD2C()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_246EBDD38()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_246EBDD44()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_246EBDD50()
{
  return MEMORY[0x24BDCED50]();
}

uint64_t sub_246EBDD5C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_246EBDD68()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_246EBDD74()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_246EBDD80()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_246EBDD8C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_246EBDD98()
{
  return MEMORY[0x24BE68FD8]();
}

uint64_t sub_246EBDDA4()
{
  return MEMORY[0x24BE68FF0]();
}

uint64_t sub_246EBDDB0()
{
  return MEMORY[0x24BE69030]();
}

uint64_t sub_246EBDDBC()
{
  return MEMORY[0x24BE69040]();
}

uint64_t sub_246EBDDC8()
{
  return MEMORY[0x24BE69048]();
}

uint64_t sub_246EBDDD4()
{
  return MEMORY[0x24BE69050]();
}

uint64_t sub_246EBDDE0()
{
  return MEMORY[0x24BE69058]();
}

uint64_t sub_246EBDDEC()
{
  return MEMORY[0x24BE69068]();
}

uint64_t sub_246EBDDF8()
{
  return MEMORY[0x24BE69080]();
}

uint64_t sub_246EBDE04()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_246EBDE10()
{
  return MEMORY[0x24BEA87E8]();
}

uint64_t sub_246EBDE1C()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_246EBDE28()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_246EBDE34()
{
  return MEMORY[0x24BEA8B20]();
}

uint64_t sub_246EBDE40()
{
  return MEMORY[0x24BE92ED8]();
}

uint64_t sub_246EBDE4C()
{
  return MEMORY[0x24BE92F18]();
}

uint64_t sub_246EBDE58()
{
  return MEMORY[0x24BE92F98]();
}

uint64_t sub_246EBDE64()
{
  return MEMORY[0x24BE5BF00]();
}

uint64_t sub_246EBDE70()
{
  return MEMORY[0x24BE5BF08]();
}

uint64_t sub_246EBDE7C()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_246EBDE88()
{
  return MEMORY[0x24BE5BF90]();
}

uint64_t sub_246EBDE94()
{
  return MEMORY[0x24BE5BF98]();
}

uint64_t sub_246EBDEA0()
{
  return MEMORY[0x24BE5BFC0]();
}

uint64_t sub_246EBDEAC()
{
  return MEMORY[0x24BE5BFC8]();
}

uint64_t sub_246EBDEB8()
{
  return MEMORY[0x24BE5C008]();
}

uint64_t sub_246EBDEC4()
{
  return MEMORY[0x24BE5C010]();
}

uint64_t sub_246EBDED0()
{
  return MEMORY[0x24BE5C018]();
}

uint64_t sub_246EBDEDC()
{
  return MEMORY[0x24BE5C038]();
}

uint64_t sub_246EBDEE8()
{
  return MEMORY[0x24BE5C060]();
}

uint64_t sub_246EBDEF4()
{
  return MEMORY[0x24BE5C070]();
}

uint64_t sub_246EBDF00()
{
  return MEMORY[0x24BE5C0E8]();
}

uint64_t sub_246EBDF0C()
{
  return MEMORY[0x24BE5C0F0]();
}

uint64_t sub_246EBDF18()
{
  return MEMORY[0x24BE5C118]();
}

uint64_t sub_246EBDF24()
{
  return MEMORY[0x24BE5C148]();
}

uint64_t sub_246EBDF30()
{
  return MEMORY[0x24BE5C160]();
}

uint64_t sub_246EBDF3C()
{
  return MEMORY[0x24BE5C1A0]();
}

uint64_t sub_246EBDF48()
{
  return MEMORY[0x24BE5C1B0]();
}

uint64_t sub_246EBDF54()
{
  return MEMORY[0x24BE5C1B8]();
}

uint64_t sub_246EBDF60()
{
  return MEMORY[0x24BE5C1D0]();
}

uint64_t sub_246EBDF6C()
{
  return MEMORY[0x24BE5C1E8]();
}

uint64_t sub_246EBDF78()
{
  return MEMORY[0x24BE5C270]();
}

uint64_t sub_246EBDF84()
{
  return MEMORY[0x24BE5C278]();
}

uint64_t sub_246EBDF90()
{
  return MEMORY[0x24BE5C2C0]();
}

uint64_t sub_246EBDF9C()
{
  return MEMORY[0x24BE5C2C8]();
}

uint64_t sub_246EBDFA8()
{
  return MEMORY[0x24BE5C2E8]();
}

uint64_t sub_246EBDFB4()
{
  return MEMORY[0x24BE5C300]();
}

uint64_t sub_246EBDFC0()
{
  return MEMORY[0x24BE5C310]();
}

uint64_t sub_246EBDFCC()
{
  return MEMORY[0x24BE5C330]();
}

uint64_t sub_246EBDFD8()
{
  return MEMORY[0x24BE5C340]();
}

uint64_t sub_246EBDFE4()
{
  return MEMORY[0x24BE5C350]();
}

uint64_t sub_246EBDFF0()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_246EBDFFC()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_246EBE008()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_246EBE014()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_246EBE020()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_246EBE02C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_246EBE038()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_246EBE044()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_246EBE050()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_246EBE05C()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_246EBE068()
{
  return MEMORY[0x24BEE05F8]();
}

uint64_t sub_246EBE074()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_246EBE080()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_246EBE08C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_246EBE098()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_246EBE0A4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_246EBE0B0()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_246EBE0BC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_246EBE0C8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_246EBE0D4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_246EBE0E0()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_246EBE0EC()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_246EBE0F8()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_246EBE104()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_246EBE110()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_246EBE11C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_246EBE128()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_246EBE134()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_246EBE140()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_246EBE14C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_246EBE158()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_246EBE164()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_246EBE170()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_246EBE17C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_246EBE188()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_246EBE194()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_246EBE1A0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_246EBE1AC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_246EBE1B8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_246EBE1C4()
{
  return MEMORY[0x24BEE6938]();
}

uint64_t sub_246EBE1D0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_246EBE1DC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_246EBE1E8()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_246EBE1F4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_246EBE200()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_246EBE20C()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_246EBE218()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_246EBE224()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_246EBE230()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_246EBE23C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_246EBE248()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_246EBE254()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_246EBE260()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_246EBE26C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_246EBE278()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_246EBE284()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_246EBE290()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_246EBE29C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_246EBE2A8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_246EBE2B4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_246EBE2C0()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_246EBE2CC()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_246EBE2D8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_246EBE2E4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_246EBE2F0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_246EBE2FC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_246EBE308()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_246EBE314()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_246EBE320()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_246EBE32C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_246EBE338()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_246EBE344()
{
  return MEMORY[0x24BEE33D0]();
}

uint64_t sub_246EBE350()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_246EBE35C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_246EBE368()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_246EBE374()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_246EBE380()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_246EBE38C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_246EBE398()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_246EBE3A4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_246EBE3B0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_246EBE3BC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_246EBE3C8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_246EBE3D4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_246EBE3E0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_246EBE3EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_246EBE3F8()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_246EBE404()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_246EBE410()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_246EBE41C()
{
  return MEMORY[0x24BEE4A10]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

float log2f(float a1)
{
  float result;

  MEMORY[0x24BDAEAE0](a1);
  return result;
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x24BEE4C20]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

