uint64_t sub_1C1315F58()
{
  uint64_t v0;

  MEMORY[0x1C3BAAC58](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnfairLock()
{
  return objc_opt_self();
}

void type metadata accessor for BSSqliteDatabaseConnectionDataProtectionClass(uint64_t a1)
{
  sub_1C1315FCC(a1, &qword_1EF6D9730);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1C1315FCC(a1, &qword_1ED7989E0);
}

void sub_1C1315FCC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1C1316010@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t *v21;
  __int128 v22;
  _OWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[2];
  __int128 v27;
  _BYTE v28[32];
  _OWORD v29[2];

  v5 = (unint64_t)objc_msgSend(a1, sel_count);
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_14;
  v6 = v5;
  v21 = a2;
  if (v5)
  {
    v2 = 0;
    v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    while (v6 != v2)
    {
      v8 = objc_msgSend(a1, sel_keyAtIndex_, v2);
      if (!v8)
        goto LABEL_15;
      v9 = v8;
      v10 = sub_1C1321370();
      v12 = v11;
      v13 = objc_msgSend(a1, sel_objectForKey_, v9);

      if (!v13)
      {
        *(_QWORD *)&v27 = 0;
        *((_QWORD *)&v27 + 1) = 0xE000000000000000;
        sub_1C1321454();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        goto LABEL_17;
      }
      sub_1C1321448();
      swift_unknownObjectRelease();
      sub_1C1317C8C(&v27, v29);
      *(_QWORD *)&v27 = v10;
      *((_QWORD *)&v27 + 1) = v12;
      sub_1C1317C9C((uint64_t)v29, (uint64_t)v28);
      v24 = v10;
      v25 = v12;
      sub_1C1317C9C((uint64_t)v28, (uint64_t)v26);
      *(_QWORD *)&v22 = v10;
      *((_QWORD *)&v22 + 1) = v12;
      sub_1C1317C8C(v26, v23);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_1C131EADC(0, v7[2] + 1, 1, v7);
      v15 = v7[2];
      v14 = v7[3];
      if (v15 >= v14 >> 1)
        v7 = sub_1C131EADC((_QWORD *)(v14 > 1), v15 + 1, 1, v7);
      ++v2;
      v7[2] = v15 + 1;
      v16 = &v7[6 * v15];
      v17 = v23[1];
      v16[3] = v23[0];
      v16[4] = v17;
      v16[2] = v22;
      sub_1C1317D84((uint64_t)&v27, &qword_1ED7989B0);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
      if (v6 == v2)
        goto LABEL_12;
    }
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    *(_QWORD *)&v27 = 0;
    *((_QWORD *)&v27 + 1) = 0xE000000000000000;
    sub_1C1321454();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    v24 = v2;
    sub_1C13214CC();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    swift_bridgeObjectRelease();
    while (1)
    {
LABEL_17:
      sub_1C1321490();
      __break(1u);
      swift_bridgeObjectRelease();
      *(_QWORD *)&v27 = 0;
      *((_QWORD *)&v27 + 1) = 0xE000000000000000;
      sub_1C1321454();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v27 = 0xD000000000000027;
      *((_QWORD *)&v27 + 1) = 0x80000001C1322090;
      swift_getErrorValue();
      sub_1C13214F0();
      _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
      swift_bridgeObjectRelease();
    }
  }
LABEL_12:
  v18 = swift_bridgeObjectRetain();
  v19 = sub_1C1317960(v18);

  result = swift_bridgeObjectRelease_n();
  *v21 = v19;
  return result;
}

uint64_t SQLResult.startIndex.getter()
{
  return 0;
}

uint64_t SQLResult.endIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16);
}

uint64_t SQLResult.allColumns.getter()
{
  uint64_t *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  v3 = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1C1316F1C(0, v2, 0);
    v3 = v14;
    v4 = (char *)(v1 + 64);
    do
    {
      v6 = *((_QWORD *)v4 - 4);
      v5 = *((_QWORD *)v4 - 3);
      v7 = *((_QWORD *)v4 - 2);
      v8 = *((_QWORD *)v4 - 1);
      v9 = *v4;
      swift_bridgeObjectRetain();
      sub_1C1316F38(v7, v8, v9);
      sub_1C1316FA0(v7, v8, v9);
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_1C1316F1C(v10 > 1, v11 + 1, 1);
      v4 += 40;
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v6;
      *(_QWORD *)(v12 + 40) = v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t SQLResult.allValues.getter()
{
  uint64_t *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  v3 = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1C1317008(0, v2, 0);
    v3 = v12;
    v4 = (char *)(v1 + 64);
    do
    {
      v5 = *((_QWORD *)v4 - 2);
      v6 = *((_QWORD *)v4 - 1);
      v7 = *v4;
      swift_bridgeObjectRetain();
      sub_1C1316F38(v5, v6, v7);
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v12 + 16);
      v8 = *(_QWORD *)(v12 + 24);
      if (v9 >= v8 >> 1)
        sub_1C1317008(v8 > 1, v9 + 1, 1);
      v4 += 40;
      *(_QWORD *)(v12 + 16) = v9 + 1;
      v10 = v12 + 24 * v9;
      *(_QWORD *)(v10 + 32) = v5;
      *(_QWORD *)(v10 + 40) = v6;
      *(_BYTE *)(v10 + 48) = v7;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return v3;
}

Swift::Int __swiftcall SQLResult.index(after:)(Swift::Int after)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFADD__(after, 1);
  result = after + 1;
  if (v1)
    __break(1u);
  return result;
}

unint64_t SQLResult.subscript.getter@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (*(_QWORD *)(*(_QWORD *)v2 + 16) <= result)
  {
    __break(1u);
  }
  else
  {
    v4 = *(_QWORD *)v2 + 40 * result;
    v5 = *(_QWORD *)(v4 + 48);
    v6 = *(_QWORD *)(v4 + 56);
    v7 = *(_BYTE *)(v4 + 64);
    swift_bridgeObjectRetain();
    sub_1C1316F38(v5, v6, v7);
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a2 = v5;
    *(_QWORD *)(a2 + 8) = v6;
    *(_BYTE *)(a2 + 16) = v7;
  }
  return result;
}

uint64_t SQLResult.subscript.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;

  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6)
  {
    v8 = result;
    v9 = (char *)(v5 + 64);
    while (1)
    {
      v10 = *((_QWORD *)v9 - 2);
      v11 = *((_QWORD *)v9 - 1);
      v12 = *v9;
      if (*((_QWORD *)v9 - 4) == v8 && *((_QWORD *)v9 - 3) == a2)
        break;
      result = sub_1C13214D8();
      if ((result & 1) != 0)
        break;
      v9 += 40;
      if (!--v6)
        goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    sub_1C1316F38(v10, v11, v12);
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a3 = v10;
    *(_QWORD *)(a3 + 8) = v11;
    *(_BYTE *)(a3 + 16) = v12;
  }
  else
  {
LABEL_9:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_BYTE *)(a3 + 16) = -1;
  }
  return result;
}

uint64_t SQLResult.subscript.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  BOOL v13;
  uint64_t result;

  v3 = *v1;
  v4 = sub_1C132146C();
  v6 = v5;
  v7 = *(_QWORD *)(v3 + 16);
  if (v7)
  {
    v8 = v4;
    v9 = (char *)(v3 + 64);
    while (1)
    {
      v10 = *((_QWORD *)v9 - 2);
      v11 = *((_QWORD *)v9 - 1);
      v12 = *v9;
      v13 = *((_QWORD *)v9 - 4) == v8 && *((_QWORD *)v9 - 3) == v6;
      if (v13 || (sub_1C13214D8() & 1) != 0)
        break;
      v9 += 40;
      if (!--v7)
        goto LABEL_9;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C1316F38(v10, v11, v12);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a1 = v10;
    *(_QWORD *)(a1 + 8) = v11;
    *(_BYTE *)(a1 + 16) = v12;
  }
  else
  {
LABEL_9:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = -1;
  }
  return result;
}

uint64_t SQLResult.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  char *i;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;

  v7 = *v4;
  v8 = *(_QWORD *)(*v4 + 16);
  if (!v8)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a4, 1, 1, a3);
  for (i = (char *)(v7 + 64); ; i += 40)
  {
    v12 = *((_QWORD *)i - 2);
    v13 = *((_QWORD *)i - 1);
    v14 = *i;
    v15 = *((_QWORD *)i - 4) == a1 && *((_QWORD *)i - 3) == a2;
    if (v15 || (sub_1C13214D8() & 1) != 0)
      break;
    if (!--v8)
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(a4, 1, 1, a3);
  }
  swift_bridgeObjectRetain();
  sub_1C1316F38(v12, v13, v14);
  swift_bridgeObjectRelease();
  SQLValue.unbox<A>()();
  return sub_1C1316FA0(v12, v13, v14);
}

uint64_t SQLResult.subscript.getter@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v17;

  v5 = *v2;
  swift_bridgeObjectRetain();
  v6 = sub_1C132146C();
  v8 = v7;
  v9 = *(_QWORD *)(v5 + 16);
  if (v9)
  {
    v10 = v6;
    v17 = a2;
    v11 = (char *)(v5 + 64);
    while (1)
    {
      v12 = *((_QWORD *)v11 - 2);
      v13 = *((_QWORD *)v11 - 1);
      v14 = *v11;
      v15 = *((_QWORD *)v11 - 4) == v10 && *((_QWORD *)v11 - 3) == v8;
      if (v15 || (sub_1C13214D8() & 1) != 0)
        break;
      v11 += 40;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        a2 = v17;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C1316F38(v12, v13, v14);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    SQLValue.unbox<A>()();
    return sub_1C1316FA0(v12, v13, v14);
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_11:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
  }
}

void sub_1C1316ADC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void sub_1C1316AE4(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16);
}

void (*sub_1C1316AF4(uint64_t (**a1)(uint64_t a1), unint64_t *a2))(_QWORD *a1)
{
  uint64_t (*v4)(uint64_t);

  v4 = (uint64_t (*)(uint64_t))malloc(0x28uLL);
  *a1 = v4;
  *((_QWORD *)v4 + 4) = sub_1C1316B6C(v4, *a2);
  return sub_1C1316B40;
}

void sub_1C1316B40(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_1C1316B6C(uint64_t (*result)(uint64_t a1), unint64_t a2))(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (*(_QWORD *)(*(_QWORD *)v2 + 16) <= a2)
  {
    __break(1u);
  }
  else
  {
    v3 = result;
    v4 = *(_QWORD *)v2 + 40 * a2;
    v5 = *(_QWORD *)(v4 + 48);
    v6 = *(_QWORD *)(v4 + 56);
    v7 = *(_BYTE *)(v4 + 64);
    swift_bridgeObjectRetain();
    sub_1C1316F38(v5, v6, v7);
    swift_bridgeObjectRelease();
    *(_QWORD *)v3 = v5;
    *((_QWORD *)v3 + 1) = v6;
    *((_BYTE *)v3 + 16) = v7;
    return destroy for SQLValue;
  }
  return result;
}

uint64_t destroy for SQLValue(uint64_t a1)
{
  return sub_1C1316FA0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t *sub_1C1316C04@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t **v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *result;
  if (*result < 0 || (v4 = result[1], result = *v2, (*v2)[2] < v4))
  {
    __break(1u);
  }
  else
  {
    a2[1] = v4;
    a2[2] = result;
    *a2 = v3;
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1C1316C30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *a1 = *v1;
  a1[1] = 0;
  a1[2] = *(_QWORD *)(v2 + 16);
  return swift_bridgeObjectRetain();
}

BOOL sub_1C1316C44()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16) == 0;
}

void sub_1C1316C58(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t *sub_1C1316C68@<X0>(uint64_t *result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v3 = *result;
    if (!a2)
    {
LABEL_6:
      *a3 = v3;
      return result;
    }
    v4 = v3 ^ 0x7FFFFFFFFFFFFFFFLL;
    v5 = a2 - 1;
    while (v4 > v5)
    {
      ++v3;
      if (!--a2)
        goto LABEL_6;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C1316CA0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = sub_1C1317BBC(*a1, a2, *a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t *sub_1C1316CD4(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;

  v2 = *result;
  v3 = *a2;
  if (*a2 < *result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (*a2 == *result)
    return 0;
  v4 = (uint64_t *)(v3 - v2);
  if (v3 > v2)
  {
    result = 0;
    v5 = v3 + ~v2;
    while (v5 <= 0x7FFFFFFFFFFFFFFELL)
    {
      result = (uint64_t *)((char *)result + 1);
      if (v4 == result)
        return result;
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t *sub_1C1316D2C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *sub_1C1316D48(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

_QWORD *sub_1C1316D64(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

_QWORD *sub_1C1316D80@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *sub_1C1316D98(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

void sub_1C1316DB0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_1C1316DBC()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 16);
}

uint64_t sub_1C1316DC8()
{
  return 2;
}

_QWORD *sub_1C1316DD0()
{
  uint64_t *v0;
  _QWORD *v1;

  v1 = sub_1C1317750(*v0);
  swift_bridgeObjectRelease();
  return v1;
}

_QWORD *sub_1C1316E04(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_1C1317814(a1, a2, a3, *v3);
}

uint64_t sub_1C1316E0C()
{
  return sub_1C13213C4();
}

uint64_t sub_1C1316E2C()
{
  return 1;
}

uint64_t sub_1C1316E34()
{
  sub_1C132152C();
  sub_1C1321538();
  return sub_1C1321544();
}

uint64_t sub_1C1316E74()
{
  return sub_1C1321538();
}

uint64_t sub_1C1316E98()
{
  sub_1C132152C();
  sub_1C1321538();
  return sub_1C1321544();
}

uint64_t sub_1C1316EE4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1C1317190(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1C1316F00(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1C1317324(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1C1316F1C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1C1317470(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1C1316F38(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3)
    return sub_1C1316F5C(result, a2);
  if (a3 == 2)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1C1316F5C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C1316FA0(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3)
    return sub_1C1316FC4(result, a2);
  if (a3 == 2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1C1316FC4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C1317008(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1C13175D8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

unint64_t sub_1C1317028()
{
  unint64_t result;

  result = qword_1EF6D9738;
  if (!qword_1EF6D9738)
  {
    result = MEMORY[0x1C3BAABEC](&protocol conformance descriptor for SQLResult, &type metadata for SQLResult);
    atomic_store(result, (unint64_t *)&qword_1EF6D9738);
  }
  return result;
}

uint64_t sub_1C131706C()
{
  return MEMORY[0x1E0DEB430];
}

uint64_t sub_1C1317078()
{
  return sub_1C1317140(&qword_1EF6D9740, &qword_1EF6D9748, MEMORY[0x1E0DEA228]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BAABE0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1C13170E8()
{
  return sub_1C1317140(&qword_1EF6D9750, &qword_1EF6D9758, MEMORY[0x1E0DEDE48]);
}

uint64_t sub_1C1317114()
{
  return sub_1C1317140(&qword_1EF6D9760, &qword_1EF6D9768, MEMORY[0x1E0DEC908]);
}

uint64_t sub_1C1317140(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1C3BAABEC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLResult()
{
  return &type metadata for SQLResult;
}

uint64_t sub_1C1317190(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798738);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 4;
  v13 = a4 + 4;
  v14 = 5 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v10 + 4, a4 + 4, v14 * 8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7989A0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1C13214C0();
  __break(1u);
  return result;
}

uint64_t sub_1C1317324(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798740);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1C13214C0();
  __break(1u);
  return result;
}

uint64_t sub_1C1317470(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7989D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1C13214C0();
  __break(1u);
  return result;
}

uint64_t sub_1C13175D8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D9770);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 24 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1C13214C0();
  __break(1u);
  return result;
}

_QWORD *sub_1C1317750(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D9770);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  swift_bridgeObjectRetain();
  v5 = sub_1C1317814(&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRelease();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

_QWORD *sub_1C1317814(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  _QWORD *v14;

  if (!a2)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = a3;
  if (!a3)
  {
LABEL_12:
    *result = a4;
    result[1] = v5;
    return (_QWORD *)v5;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v6 = *(_QWORD *)(a4 + 16);
    if (v6)
    {
      v7 = a2;
      v14 = result;
      v8 = (char *)(a4 + 64);
      v9 = -(uint64_t)v6;
      v10 = 1;
      while (v10 - 1 < v6)
      {
        v11 = *((_QWORD *)v8 - 2);
        v12 = *((_QWORD *)v8 - 1);
        v13 = *v8;
        swift_bridgeObjectRetain();
        sub_1C1316F38(v11, v12, v13);
        result = (_QWORD *)swift_bridgeObjectRelease();
        *(_QWORD *)v7 = v11;
        *(_QWORD *)(v7 + 8) = v12;
        *(_BYTE *)(v7 + 16) = v13;
        if (v5 == v10)
        {
          result = v14;
          goto LABEL_12;
        }
        v6 = *(_QWORD *)(a4 + 16);
        if (v10 == v6)
        {
          v5 = v10;
          result = v14;
          goto LABEL_12;
        }
        ++v10;
        v7 += 24;
        v8 += 40;
        if (v9 + v10 == 1)
        {
          __break(1u);
          goto LABEL_11;
        }
      }
      __break(1u);
      goto LABEL_16;
    }
    goto LABEL_11;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BAABD4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1C1317960(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 v14;
  _BYTE v15[32];
  __int128 v16;
  unsigned __int8 v17;
  _QWORD v18[2];
  _BYTE v19[32];
  uint64_t v20;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v20 = MEMORY[0x1E0DEE9D8];
    sub_1C1316EE4(0, v1, 0);
    for (i = a1 + 32; ; i += 48)
    {
      sub_1C1317CF8(i, (uint64_t)v18);
      v5 = v18[0];
      v6 = v18[1];
      sub_1C1317C9C((uint64_t)v19, (uint64_t)v15);
      SQLValue.init(_:)((uint64_t)v15, (uint64_t)&v16);
      v7 = v17;
      if (v17 == 255)
        break;
      v14 = v16;
      sub_1C1317C9C((uint64_t)v19, (uint64_t)v15);
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
      sub_1C1317D84((uint64_t)v18, &qword_1ED7989A8);
      v2 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1C1316EE4(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v20;
      }
      v9 = *(_QWORD *)(v2 + 16);
      v8 = *(_QWORD *)(v2 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_1C1316EE4(v8 > 1, v9 + 1, 1);
        v2 = v20;
      }
      *(_QWORD *)(v2 + 16) = v9 + 1;
      v10 = v2 + 40 * v9;
      *(_QWORD *)(v10 + 32) = v5;
      *(_QWORD *)(v10 + 40) = v6;
      *(_OWORD *)(v10 + 48) = v14;
      *(_BYTE *)(v10 + 64) = v7;
      if (!--v1)
        return v2;
    }
    sub_1C1317C9C((uint64_t)v19, (uint64_t)v15);
    *(_QWORD *)&v16 = 0;
    *((_QWORD *)&v16 + 1) = 0xE000000000000000;
    sub_1C1321454();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v16 = 0xD00000000000002ELL;
    *((_QWORD *)&v16 + 1) = 0x80000001C13220C0;
    sub_1C1321550();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    swift_bridgeObjectRelease();
    v2 = *((_QWORD *)&v16 + 1);
    v11 = v16;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    sub_1C1317D40();
    swift_allocError();
    *v12 = v11;
    v12[1] = v2;
    swift_willThrow();
    sub_1C1317D84((uint64_t)v18, &qword_1ED7989A8);
    swift_release();
  }
  return v2;
}

uint64_t sub_1C1317BBC(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64x2_t v8;
  int64x2_t v9;
  int64x2_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2 < 0)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  if (a2)
  {
    v3 = a3 - result;
    if (a3 - result >= (unint64_t)(a2 - 1))
      v3 = a2 - 1;
    if (v3 >= (result ^ 0x7FFFFFFFFFFFFFFFuLL))
      v3 = result ^ 0x7FFFFFFFFFFFFFFFLL;
    v4 = v3 + 1;
    if (v4 >= 5)
    {
      v7 = v4 & 3;
      if ((v4 & 3) == 0)
        v7 = 4;
      v5 = v4 - v7;
      v8 = 0uLL;
      v9 = (int64x2_t)(unint64_t)result;
      v10 = vdupq_n_s64(1uLL);
      v11 = v5;
      do
      {
        v9 = vaddq_s64(v9, v10);
        v8 = vaddq_s64(v8, v10);
        v11 -= 4;
      }
      while (v11);
      v6 = vaddvq_s64(vaddq_s64(v8, v9));
    }
    else
    {
      v5 = 0;
      v6 = result;
    }
    v12 = v5 + result - 0x7FFFFFFFFFFFFFFFLL;
    v13 = v5 + result - a3;
    v14 = a2 - v5;
    result = v6;
    while (1)
    {
      if (!v13)
        return 0;
      if (!v12)
        break;
      ++result;
      ++v12;
      ++v13;
      if (!--v14)
        return result;
    }
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

_OWORD *sub_1C1317C8C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1C1317C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_1C1317CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7989A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1C1317D40()
{
  unint64_t result;

  result = qword_1EF6D9778;
  if (!qword_1EF6D9778)
  {
    result = MEMORY[0x1C3BAABEC](&unk_1C1321B10, &type metadata for SQLResultError);
    atomic_store(result, (unint64_t *)&qword_1EF6D9778);
  }
  return result;
}

uint64_t sub_1C1317D84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for SQLResultError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SQLResultError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SQLResultError(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for SQLResultError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLResultError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SQLResultError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SQLResultError()
{
  return &type metadata for SQLResultError;
}

uint64_t getEnumTagSinglePayload for SQLResultError.Code(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SQLResultError.Code(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C1317F9C + 4 * asc_1C1321994[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C1317FBC + 4 * byte_1C1321999[v4]))();
}

_BYTE *sub_1C1317F9C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C1317FBC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C1317FC4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C1317FCC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C1317FD4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C1317FDC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1C1317FE8()
{
  return 0;
}

ValueMetadata *type metadata accessor for SQLResultError.Code()
{
  return &type metadata for SQLResultError.Code;
}

unint64_t sub_1C1318008()
{
  unint64_t result;

  result = qword_1EF6D9780;
  if (!qword_1EF6D9780)
  {
    result = MEMORY[0x1C3BAABEC](&unk_1C1321B98, &type metadata for SQLResultError.Code);
    atomic_store(result, (unint64_t *)&qword_1EF6D9780);
  }
  return result;
}

uint64_t SQLValue.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  uint64_t result;
  __int128 v14;
  id v15[5];
  __int128 v16;
  char v17;
  __int128 v18;
  char v19;
  __int128 v20;
  uint64_t v21;
  _UNKNOWN **v22;
  _BYTE v23[32];

  sub_1C1317C9C(a1, (uint64_t)v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798990);
  if (!swift_dynamicCast())
  {
    sub_1C1318DE4(0, &qword_1ED798718);
    if (swift_dynamicCast())
    {
      v5 = v15[0];
      v6 = sub_1C1318698();

      if (v6)
      {
        objc_msgSend(v5, sel_doubleValue);
        v21 = MEMORY[0x1E0DEB070];
        v22 = &protocol witness table for Double;
        *(_QWORD *)&v20 = v7;
LABEL_14:
        SQLValue.init(_:)((uint64_t)&v20, (uint64_t)&v18);

        __swift_destroy_boxed_opaque_existential_0(a1);
        v14 = v18;
        v4 = v19;
        goto LABEL_15;
      }
      if (sub_1C13187E0())
      {
        v8 = objc_msgSend(v5, sel_longLongValue);
        v21 = MEMORY[0x1E0DEDC60];
        v22 = &protocol witness table for Int64;
        *(_QWORD *)&v20 = v8;
        goto LABEL_14;
      }

    }
    sub_1C1318DE4(0, &qword_1ED798720);
    if (swift_dynamicCast())
    {
      v5 = v15[0];
      v9 = sub_1C132137C();
      v11 = MEMORY[0x1E0DEA968];
      v12 = &protocol witness table for String;
    }
    else
    {
      sub_1C1318DE4(0, &qword_1ED798710);
      if (!swift_dynamicCast())
      {
        __swift_destroy_boxed_opaque_existential_0(a1);
        result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
        *(_QWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = 0;
        *(_BYTE *)(a2 + 16) = -1;
        return result;
      }
      v5 = v15[0];
      v9 = sub_1C1318890(v5);
      v11 = MEMORY[0x1E0CB0338];
      v12 = &protocol witness table for Data;
    }
    v21 = v11;
    v22 = v12;
    *(_QWORD *)&v20 = v9;
    *((_QWORD *)&v20 + 1) = v10;
    goto LABEL_14;
  }
  sub_1C131A624(&v20, (uint64_t)&v18);
  sub_1C1318C94((uint64_t)&v18, (uint64_t)v15);
  SQLValue.init(_:)((uint64_t)v15, (uint64_t)&v16);
  __swift_destroy_boxed_opaque_existential_0(a1);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v18);
  v14 = v16;
  v4 = v17;
LABEL_15:
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
  *(_OWORD *)a2 = v14;
  *(_BYTE *)(a2 + 16) = v4;
  return result;
}

{
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  _BYTE v10[40];

  sub_1C1318C94(a1, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798990);
  sub_1C1318DE4(0, (unint64_t *)&qword_1ED7989B8);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);

    v4 = 0;
    v5 = 0;
    v6 = 4;
LABEL_11:
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
    *(_QWORD *)a2 = v4;
    *(_QWORD *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6;
    return result;
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    v5 = 0;
    v6 = 0;
    v4 = v8;
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    v5 = 0;
    v4 = v8;
    v6 = 1;
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    v4 = v8;
    v5 = v9;
    v6 = 2;
    goto LABEL_11;
  }
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    v4 = v8;
    v5 = v9;
    v6 = 3;
    goto LABEL_11;
  }
  result = sub_1C1321490();
  __break(1u);
  return result;
}

void SQLValue.unbox<A>()()
{
  sub_1C1321418();
  MEMORY[0x1E0C80A78]();
  __asm { BR              X10 }
}

uint64_t sub_1C1318350(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  *(_QWORD *)(v6 - 80) = MEMORY[0x1E0DEDC60];
  *(_QWORD *)(v6 - 72) = &protocol witness table for Int64;
  *(_QWORD *)(v6 - 104) = a1;
  sub_1C131A624((__int128 *)(v6 - 104), v6 - 144);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798990);
  v7 = swift_dynamicCast();
  v8 = *(_QWORD *)(v1 - 8);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  if (v7)
  {
    v9(v2, 0, 1, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v4, v2, v1);
    v10 = 0;
  }
  else
  {
    v10 = 1;
    v9(v2, 1, 1, v1);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v3);
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v9)(v4, v10, 1, v1);
}

BOOL sub_1C1318698()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v13;

  objc_msgSend(objc_retainAutorelease(v0), sel_objCType);
  v1 = sub_1C13213AC();
  v3 = sub_1C131F028(v1, v2);
  swift_bridgeObjectRelease();
  v13 = MEMORY[0x1E0DEE9D8];
  sub_1C1316F00(0, 2, 0);
  v4 = v13;
  v6 = *(_QWORD *)(v13 + 16);
  v5 = *(_QWORD *)(v13 + 24);
  v7 = v5 >> 1;
  v8 = v6 + 1;
  if (v5 >> 1 <= v6)
  {
    sub_1C1316F00(v5 > 1, v6 + 1, 1);
    v4 = v13;
    v5 = *(_QWORD *)(v13 + 24);
    v7 = v5 >> 1;
  }
  *(_QWORD *)(v4 + 16) = v8;
  *(_BYTE *)(v4 + v6 + 32) = 102;
  v9 = v6 + 2;
  if (v7 < v9)
  {
    sub_1C1316F00(v5 > 1, v9, 1);
    v4 = v13;
  }
  *(_QWORD *)(v4 + 16) = v9;
  *(_BYTE *)(v4 + v8 + 32) = 100;
  if (*(_QWORD *)(v3 + 16) == 1)
  {
    v10 = *(unsigned __int8 *)(v3 + 32);
    swift_release();
    v11 = sub_1C131921C(v10, v4);
  }
  else
  {
    swift_release();
    v11 = 0;
  }
  swift_release();
  return v11;
}

BOOL sub_1C13187E0()
{
  void *v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  id v7;

  v1 = objc_retainAutorelease(v0);
  objc_msgSend(v1, sel_objCType);
  v2 = sub_1C13213AC();
  v4 = sub_1C131F028(v2, v3);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v4 + 16) != 1)
  {
    swift_release();
    return 1;
  }
  v5 = *(unsigned __int8 *)(v4 + 32);
  swift_release();
  if (v5 != 81)
    return 1;
  v6 = objc_msgSend(v1, sel_longLongValue);
  v7 = objc_msgSend(v1, sel_unsignedLongLongValue);
  return (uint64_t)v6 >= 0 && v6 == v7;
}

uint64_t sub_1C1318890(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v12;
  __int128 v13[2];
  uint64_t v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v12 = a1;
  sub_1C1318DE4(0, &qword_1ED798710);
  v2 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798748);
  if (!swift_dynamicCast())
  {
    v14 = 0;
    memset(v13, 0, sizeof(v13));
    sub_1C131A588((uint64_t)v13);
    v3 = sub_1C13213F4();
    v4 = sub_1C1321400();
    v5 = sub_1C13213F4();
    v6 = sub_1C1321400();
    if (v3 < v5 || v6 < v3)
    {
      __break(1u);
    }
    else
    {
      v7 = sub_1C13213F4();
      v8 = sub_1C1321400();
      if (v4 >= v7 && v8 >= v4)
      {
        if (!__OFSUB__(v4, v3))
        {
          *(_QWORD *)&v13[0] = sub_1C1319D04(v4 - v3);
          *((_QWORD *)&v13[0] + 1) = v9;
          MEMORY[0x1E0C80A78](*(_QWORD *)&v13[0]);
          sub_1C131927C();
          __asm { BR              X12 }
        }
LABEL_11:
        __break(1u);
        JUMPOUT(0x1C1318C74);
      }
    }
    __break(1u);
    goto LABEL_11;
  }
  sub_1C131A624(v13, (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  sub_1C13212B0();

  v13[0] = v12;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return *(_QWORD *)&v13[0];
}

uint64_t sub_1C1318C94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void SQLValue.unboxedValue()()
{
  __asm { BR              X10 }
}

uint64_t sub_1C1318D0C(uint64_t result)
{
  _QWORD *v1;

  v1[3] = MEMORY[0x1E0DEDC60];
  v1[4] = &protocol witness table for Int64;
  *v1 = result;
  return result;
}

uint64_t sub_1C1318DE4(uint64_t a1, unint64_t *a2)
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

void SQLValue.contains<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[12];

  v11[2] = a4;
  v5 = *(_QWORD *)(a2 - 8);
  v11[4] = a1;
  v11[5] = v5;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v11[1] = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1321418();
  v11[3] = *(_QWORD *)(swift_getTupleTypeMetadata2() - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v8 = MEMORY[0x1E0C80A78](v7);
  v9 = MEMORY[0x1E0C80A78](v8);
  MEMORY[0x1E0C80A78](v9);
  v11[6] = (char *)v11 - v10;
  __asm { BR              X10 }
}

uint64_t sub_1C1318F54(uint64_t a1)
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
  int v10;
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  void (*v17)(uint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);

  *(_QWORD *)(v8 - 96) = MEMORY[0x1E0DEDC60];
  *(_QWORD *)(v8 - 88) = &protocol witness table for Int64;
  *(_QWORD *)(v8 - 120) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798990);
  v9 = *(_QWORD *)(v8 - 128);
  v10 = swift_dynamicCast();
  v11 = *(_QWORD *)(v8 - 136);
  v12 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56);
  v12(v9, v10 ^ 1u, 1, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v11 + 16))(v6, *(_QWORD *)(v8 - 144), v4);
  v12(v6, 0, 1, v4);
  *(_QWORD *)(v8 - 144) = v3;
  v13 = v2 + *(int *)(v3 + 48);
  v14 = v5;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v15(v2, v9, v1);
  v15(v13, v6, v1);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (v16(v2, 1, v4) != 1)
  {
    *(_QWORD *)(v8 - 176) = v14;
    v15(v7, v2, v1);
    if (v16(v13, 1, v4) != 1)
    {
      v19 = *(_QWORD *)(v8 - 136);
      v20 = *(_QWORD *)(v8 - 168);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v20, v13, v4);
      v18 = sub_1C1321358();
      v21 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
      v21(v20, v4);
      v17 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 176) + 8);
      v17(v6, v1);
      v21(v7, v4);
      v17(v2, v1);
      goto LABEL_8;
    }
    v17 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 176) + 8);
    v17(v6, v1);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 136) + 8))(v7, v4);
    goto LABEL_6;
  }
  v17 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v17(v6, v1);
  if (v16(v13, 1, v4) != 1)
  {
LABEL_6:
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v8 - 152) + 8))(v2, *(_QWORD *)(v8 - 144));
    v18 = 0;
    goto LABEL_8;
  }
  v17(v2, v1);
  v18 = 1;
LABEL_8:
  v17(*(_QWORD *)(v8 - 128), v1);
  return v18 & 1;
}

BOOL sub_1C131921C(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

void sub_1C131927C()
{
  __asm { BR              X11 }
}

_QWORD *sub_1C13192DC@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_1C1319568@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_1C1319DA0(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_1C1319E60((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_1C1319ED8((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_1C13195DC(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_1C1319640(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_1C1321274();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_1C1321298();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_1C132128C();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

void sub_1C13196EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1C131974C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x1C1319930);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_1C1319954(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1C13199B0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_1C13196EC((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_1C1316FC4(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

void sub_1C1319B78(_QWORD *a1, _BYTE *a2, uint64_t a3)
{
  void *v3;
  id v7;
  uint64_t v8;
  char v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _BYTE *v21;

  v7 = v3;
  v8 = sub_1C13213F4();

  v21 = a2;
  if (!a2 || !a3)
    goto LABEL_5;
  if (a3 < 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v8 == sub_1C1321400())
  {
LABEL_5:
    *a1 = v7;
    a1[1] = v8;
    return;
  }
  v9 = sub_1C132140C();
  v10 = v7;
  v11 = sub_1C13213F4();
  v12 = sub_1C1321400();

  if (v8 >= v11 && v8 < v12)
  {
    *a2 = v9;
    if (a3 == 1)
    {
      ++v8;
      goto LABEL_5;
    }
    v20 = a1;
    v13 = 1;
    while (a3 != v13)
    {
      v14 = v8 + v13;
      if (v8 + v13 == sub_1C1321400())
      {
        v8 += v13;
        goto LABEL_18;
      }
      v15 = sub_1C132140C();
      v16 = v10;
      v17 = sub_1C13213F4();
      v18 = sub_1C1321400();

      if (v14 < v17 || v14 >= v18)
        goto LABEL_20;
      v19 = v13 + 1;
      v21[v13] = v15;
      v13 = v19;
      if (a3 == v19)
      {
        v8 += v19;
LABEL_18:
        a1 = v20;
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
}

uint64_t sub_1C1319D04(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_1C13212A4();
      swift_allocObject();
      sub_1C1321280();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1C13212F8();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t sub_1C1319DA0(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_1C1319E60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1C13212A4();
  swift_allocObject();
  result = sub_1C1321268();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1C13212F8();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1C1319ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1C13212A4();
  swift_allocObject();
  result = sub_1C1321268();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1C1319F58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_1C1321274();
  v11 = result;
  if (result)
  {
    result = sub_1C1321298();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_1C132128C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1C13196EC(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void _s10SessionSQL8SQLValueO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

BOOL sub_1C131A050()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  unint64_t v4;
  int v5;

  if (v5)
  {
    sub_1C1316F38(v0, v1, v5);
    sub_1C1316FA0(v3, v4, v2);
    sub_1C1316FA0(v0, v1, v5);
    return 0;
  }
  else
  {
    sub_1C1316FA0(v3, v4, 0);
    sub_1C1316FA0(v0, v1, 0);
    return v3 == v0;
  }
}

void sub_1C131A24C(uint64_t a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  char v6;

  if (a1 == BYTE6(v2))
  {
    if (a1 >= 1)
    {
      sub_1C1316F38(v1, v2, 3);
      sub_1C1316F38(v1, v2, 3);
      sub_1C1316F38(v3, v4, 3);
      sub_1C1319954(v3, v4);
      v6 = v5;
      sub_1C1316FA0(v3, v4, 3);
      sub_1C1316FA0(v1, v2, 3);
      if ((v6 & 1) != 0)
        JUMPOUT(0x1C131A1A8);
      JUMPOUT(0x1C131A1A4);
    }
    sub_1C1316F38(v1, v2, 3);
    sub_1C1316F38(v3, v4, 3);
    sub_1C1316FA0(v3, v4, 3);
    JUMPOUT(0x1C131A150);
  }
  sub_1C1316F38(v1, v2, 3);
  sub_1C1316F38(v3, v4, 3);
  sub_1C1316FA0(v3, v4, 3);
  JUMPOUT(0x1C131A1A0);
}

uint64_t sub_1C131A3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1C1316F38(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SQLValue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1C1316F38(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1C1316FA0(v6, v7, v8);
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

uint64_t assignWithTake for SQLValue(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1C1316FA0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1C131A548(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_1C131A560(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLValue()
{
  return &type metadata for SQLValue;
}

uint64_t sub_1C131A588(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798750);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_1C131A5C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;

  v9 = **(_QWORD **)(v3 + 16);
  v8[2] = &v9;
  result = sub_1C13195DC((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1C131A660, (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t sub_1C131A624(__int128 *a1, uint64_t a2)
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_1C131A660(_BYTE *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v7 = **(id **)(v3 + 16);
  sub_1C1319B78(v10, a1, a2);
  v8 = v10[1];
  *a3 = v10[0];
  a3[1] = v8;
  a3[2] = v9;
}

unint64_t sub_1C131A6D0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798730);
  v2 = (_QWORD *)sub_1C13214B4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (char *)(a1 + 64);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 4);
    v6 = *((_QWORD *)v4 - 3);
    v7 = *((_QWORD *)v4 - 2);
    v8 = *((_QWORD *)v4 - 1);
    v9 = *v4;
    swift_bridgeObjectRetain();
    sub_1C1316F38(v7, v8, v9);
    result = sub_1C131F34C(v5, v6);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v2[6] + 16 * result);
    *v12 = v5;
    v12[1] = v6;
    v13 = v2[7] + 24 * result;
    *(_QWORD *)v13 = v7;
    *(_QWORD *)(v13 + 8) = v8;
    *(_BYTE *)(v13 + 16) = v9;
    v14 = v2[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4 += 40;
    v2[2] = v16;
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

SessionSQL::SQLStatement __swiftcall SQLStatement.init(stringLiteral:)(Swift::String stringLiteral)
{
  _QWORD *v1;
  void *object;
  uint64_t countAndFlagsBits;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SessionSQL::SQLStatement result;

  object = stringLiteral._object;
  countAndFlagsBits = stringLiteral._countAndFlagsBits;
  v4 = v1;
  v5 = (void *)sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  *v4 = v5;
  v4[1] = countAndFlagsBits;
  v4[2] = object;
  result.parameterizedStatement._object = v7;
  result.parameterizedStatement._countAndFlagsBits = v6;
  result.bindings._rawValue = v5;
  return result;
}

SessionSQL::SQLStatement __swiftcall SQLStatement.init(stringInterpolation:)(SessionSQL::SQLStatement stringInterpolation)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)stringInterpolation.bindings._rawValue;
  v3 = *((_QWORD *)stringInterpolation.bindings._rawValue + 1);
  *v1 = *((_QWORD *)stringInterpolation.bindings._rawValue + 2);
  v1[1] = v2;
  v1[2] = v3;
  return stringInterpolation;
}

SessionSQL::SQLStatement::StringInterpolation __swiftcall SQLStatement.StringInterpolation.init(literalCapacity:interpolationCount:)(Swift::Int literalCapacity, Swift::Int interpolationCount)
{
  _QWORD *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  SessionSQL::SQLStatement::StringInterpolation result;

  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v2[2] = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  v4 = MEMORY[0x1C3BAA73C](literalCapacity);
  result.bindings._rawValue = v6;
  result.value._object = v5;
  result.value._countAndFlagsBits = v4;
  return result;
}

uint64_t SQLStatement.StringInterpolation.appendInterpolation(_:)()
{
  sub_1C132146C();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  return swift_bridgeObjectRelease();
}

uint64_t SQLStatement.StringInterpolation.appendInterpolation(_:)(__int128 *a1)
{
  char v1;
  __int128 v3;
  char v4;

  v1 = *((_BYTE *)a1 + 16);
  v3 = *a1;
  v4 = v1;
  return sub_1C131A900((uint64_t)&v3);
}

uint64_t sub_1C131A900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_BYTE *)(a1 + 16);
  sub_1C13214CC();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  sub_1C1316F38(v2, v3, v4);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = 0x8000000000000000;
  sub_1C131B2E4(v2, v3, v4, 0x676E69646E696240, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v1 + 16) = v7;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SQLStatement.StringInterpolation.appendInterpolation(bind:)(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  char v3;
  _QWORD v5[2];
  char v6;
  uint64_t v7;
  unint64_t v8;
  char v9;

  sub_1C1318C94(a1, (uint64_t)v5);
  SQLValue.init(_:)((uint64_t)v5, (uint64_t)&v7);
  v1 = v7;
  v2 = v8;
  v3 = v9;
  v5[0] = v7;
  v5[1] = v8;
  v6 = v9;
  sub_1C131A900((uint64_t)v5);
  return sub_1C1316FA0(v1, v2, v3);
}

uint64_t sub_1C131AA74()
{
  return MEMORY[0x1E0DEA9F0];
}

uint64_t sub_1C131AA80@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  a2[2] = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  return MEMORY[0x1C3BAA73C](a1);
}

uint64_t sub_1C131AAC0()
{
  return _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
}

unint64_t sub_1C131AAD0()
{
  unint64_t result;

  result = qword_1EF6D9788;
  if (!qword_1EF6D9788)
  {
    result = MEMORY[0x1C3BAABEC](&protocol conformance descriptor for SQLStatement, &type metadata for SQLStatement);
    atomic_store(result, (unint64_t *)&qword_1EF6D9788);
  }
  return result;
}

unint64_t sub_1C131AB18()
{
  unint64_t result;

  result = qword_1EF6D9790;
  if (!qword_1EF6D9790)
  {
    result = MEMORY[0x1C3BAABEC](&protocol conformance descriptor for SQLStatement.StringInterpolation, &type metadata for SQLStatement.StringInterpolation);
    atomic_store(result, (unint64_t *)&qword_1EF6D9790);
  }
  return result;
}

uint64_t *sub_1C131AB5C@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *result;
  v3 = result[1];
  *a2 = result[2];
  a2[1] = v2;
  a2[2] = v3;
  return result;
}

unint64_t sub_1C131AB74()
{
  unint64_t result;

  result = qword_1EF6D9798;
  if (!qword_1EF6D9798)
  {
    result = MEMORY[0x1C3BAABEC](&protocol conformance descriptor for SQLStatement, &type metadata for SQLStatement);
    atomic_store(result, (unint64_t *)&qword_1EF6D9798);
  }
  return result;
}

unint64_t sub_1C131ABC0()
{
  unint64_t result;

  result = qword_1EF6D97A0;
  if (!qword_1EF6D97A0)
  {
    result = MEMORY[0x1C3BAABEC](&protocol conformance descriptor for SQLStatement, &type metadata for SQLStatement);
    atomic_store(result, (unint64_t *)&qword_1EF6D97A0);
  }
  return result;
}

uint64_t sub_1C131AC04()
{
  return MEMORY[0x1E0DEAA00];
}

uint64_t sub_1C131AC10()
{
  return MEMORY[0x1E0DEA9F8];
}

unint64_t sub_1C131AC1C@<X0>(unint64_t *a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t result;

  v3 = *a1;
  v4 = a1[1];
  result = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  *a2 = result;
  a2[1] = v3;
  a2[2] = v4;
  return result;
}

uint64_t destroy for SQLStatement()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s10SessionSQL12SQLStatementVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SQLStatement(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for SQLStatement(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLStatement(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLStatement(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLStatement()
{
  return &type metadata for SQLStatement;
}

uint64_t destroy for SQLStatement.StringInterpolation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s10SessionSQL12SQLStatementV19StringInterpolationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SQLStatement.StringInterpolation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SQLStatement.StringInterpolation(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLStatement.StringInterpolation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLStatement.StringInterpolation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SQLStatement.StringInterpolation()
{
  return &type metadata for SQLStatement.StringInterpolation;
}

uint64_t sub_1C131AFBC(uint64_t a1, char a2)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
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
  unint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t i;
  char v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798730);
  v40 = a2;
  v6 = sub_1C13214A8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v38 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
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
        if (v22 >= v37)
          goto LABEL_33;
        v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v37)
            goto LABEL_33;
          v23 = v38[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v40 & 1) != 0)
              {
                v36 = 1 << *(_BYTE *)(v5 + 32);
                if (v36 >= 64)
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v36;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v37)
                  goto LABEL_33;
                v23 = v38[v13];
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
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v30 = *v29;
      v31 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + 24 * v21;
      v34 = *(_QWORD *)v32;
      v33 = *(_QWORD *)(v32 + 8);
      v35 = *(_BYTE *)(v32 + 16);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_1C1316F38(v34, v33, v35);
      }
      sub_1C132152C();
      sub_1C1321394();
      result = sub_1C1321544();
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
            goto LABEL_39;
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
      *v18 = v30;
      v18[1] = v31;
      v19 = *(_QWORD *)(v7 + 56) + 24 * v17;
      *(_QWORD *)v19 = v34;
      *(_QWORD *)(v19 + 8) = v33;
      *(_BYTE *)(v19 + 16) = v35;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C131B2E4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v7 = v6;
  v14 = *v6;
  v16 = sub_1C131F34C(a4, a5);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_1C131B46C();
LABEL_7:
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7] + 24 * v16;
      result = sub_1C1316FA0(*(_QWORD *)v23, *(_QWORD *)(v23 + 8), *(_BYTE *)(v23 + 16));
      *(_QWORD *)v23 = a1;
      *(_QWORD *)(v23 + 8) = a2;
      *(_BYTE *)(v23 + 16) = a3;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 16 * v16);
    *v27 = a4;
    v27[1] = a5;
    v28 = v22[7] + 24 * v16;
    *(_QWORD *)v28 = a1;
    *(_QWORD *)(v28 + 8) = a2;
    *(_BYTE *)(v28 + 16) = a3;
    v29 = v22[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v22[2] = v31;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1C131AFBC(v19, a6 & 1);
  v25 = sub_1C131F34C(a4, a5);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C13214E4();
  __break(1u);
  return result;
}

void *sub_1C131B46C()
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
  uint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  char v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798730);
  v2 = *v0;
  v3 = sub_1C132149C();
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
    v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      v9 = v27 + 1;
      if (v27 + 1 >= v13)
        goto LABEL_26;
      v28 = *(_QWORD *)(v6 + 8 * v9);
      if (!v28)
        break;
    }
LABEL_25:
    v12 = (v28 - 1) & v28;
    v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v25 = *(_BYTE *)(v21 + 16);
    *v24 = v19;
    v24[1] = v18;
    v26 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v26 = v22;
    *(_QWORD *)(v26 + 8) = v23;
    *(_BYTE *)(v26 + 16) = v25;
    swift_bridgeObjectRetain();
    result = (void *)sub_1C1316F38(v22, v23, v25);
  }
  v29 = v27 + 2;
  if (v29 >= v13)
    goto LABEL_26;
  v28 = *(_QWORD *)(v6 + 8 * v29);
  if (v28)
  {
    v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v9);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t SQLSchemaBuilder.init(majorVersion:schemaRevisions:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_WORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SQLSchemaBuilder(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SQLSchemaBuilder(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SQLSchemaBuilder(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for SQLSchemaBuilder()
{
  return &type metadata for SQLSchemaBuilder;
}

uint64_t sub_1C131B710()
{
  sub_1C13214CC();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  sub_1C13214CC();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  return 118;
}

BOOL sub_1C131B7C4(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  _BOOL4 v5;

  v2 = *a1;
  v3 = *a2;
  v4 = v2 == v3;
  v5 = v2 < v3;
  if (v4)
    return a1[1] < a2[1];
  else
    return v5;
}

uint64_t sub_1C131B7EC()
{
  return sub_1C131B710();
}

BOOL static SQLiteError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SQLiteError.hash(into:)()
{
  return sub_1C1321538();
}

uint64_t SQLiteError.hashValue.getter()
{
  sub_1C132152C();
  sub_1C1321538();
  return sub_1C1321544();
}

BOOL sub_1C131B878(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1C131B88C()
{
  sub_1C132152C();
  sub_1C1321538();
  return sub_1C1321544();
}

uint64_t sub_1C131B8D0()
{
  return sub_1C1321538();
}

uint64_t sub_1C131B8F8()
{
  sub_1C132152C();
  sub_1C1321538();
  return sub_1C1321544();
}

void sub_1C131B938(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v2 = v1;
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(*(_QWORD *)(v2 + 24) + 16));
  if (a1 == 1)
  {
    if (*(_QWORD *)(v2 + 56))
      return;
    v7 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    MEMORY[0x1C3BAA73C](18);
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    sub_1C13214CC();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    swift_bridgeObjectRelease();
    v4 = 0xE000000000000000;
    v5 = v7;
    v6 = 0;
    goto LABEL_7;
  }
  if (!a1 && *(_QWORD *)(v2 + 56) == 1)
  {
    v5 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    v6 = 0xD000000000000016;
    v4 = 0x80000001C13224F0;
LABEL_7:
    v7 = v4;
    SQLDatabase.perform(_:)((uint64_t *)&v5);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

id SQLDatabase.perform(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  _BYTE *v12;
  void *v13;
  id aBlock[7];

  aBlock[6] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = *(void **)(v1 + 32);
  v4 = (void *)sub_1C1321364();
  v5 = objc_msgSend(v3, sel_prepareStatement_, v4);

  if (v5)
  {
    v6 = sub_1C131F490(v2);
    v7 = (_QWORD *)swift_allocObject();
    v7[2] = MEMORY[0x1E0DEE9D8];
    sub_1C131CF1C(v6);
    swift_release();
    v8 = (void *)sub_1C132134C();
    swift_bridgeObjectRelease();
    aBlock[4] = sub_1C131F7CC;
    aBlock[5] = v7;
    aBlock[0] = (id)MEMORY[0x1E0C809B0];
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1C131D36C;
    aBlock[3] = &block_descriptor;
    v9 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    aBlock[0] = 0;
    v10 = objc_msgSend(v5, sel_executeWithBindings_resultRowHandler_error_, v8, v9, aBlock);
    _Block_release(v9);

    v11 = aBlock[0];
    if ((v10 & 1) != 0)
    {

      swift_beginAccess();
      v5 = (id)v7[2];
      swift_bridgeObjectRetain();
      swift_release();
    }
    else
    {
      v13 = v11;
      sub_1C13212C8();

      swift_willThrow();
      swift_release();

    }
  }
  else
  {
    sub_1C131BCEC();
    swift_allocError();
    *v12 = 3;
    swift_willThrow();
  }
  return v5;
}

unint64_t sub_1C131BCEC()
{
  unint64_t result;

  result = qword_1EF6D97A8;
  if (!qword_1EF6D97A8)
  {
    result = MEMORY[0x1C3BAABEC](&protocol conformance descriptor for SQLiteError, &type metadata for SQLiteError);
    atomic_store(result, (unint64_t *)&qword_1EF6D97A8);
  }
  return result;
}

uint64_t sub_1C131BD30(void *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  id v17;
  uint8_t *v18;
  _QWORD *v19;
  uint64_t v20;
  Swift::Int64 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  Swift::Int64 v26;
  void *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  SessionSQL::SQLStatement v44;
  SessionSQL::SQLStatement v45;

  v4 = v2;
  v7 = *a2;
  v6 = a2[1];
  *(_QWORD *)(v4 + 16) = 10;
  type metadata accessor for UnfairLock();
  v8 = swift_allocObject();
  v9 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v8 + 16) = v9;
  *v9 = 0;
  *(_QWORD *)(v4 + 48) = 0;
  *(_QWORD *)(v4 + 56) = 0;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 24) = v8;
  v10 = a1;
  v40 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  v41 = 0xD00000000000001BLL;
  v42 = 0x80000001C1322510;
  SQLDatabase.perform(_:)((uint64_t *)&v40);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    v41 = 0xD000000000000016;
    v42 = 0x80000001C1322530;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40 = 0;
    v41 = 0xE000000000000000;
    v42 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    MEMORY[0x1C3BAA73C](18);
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    v43 = 10;
    sub_1C13214CC();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    swift_bridgeObjectRelease();
    v11 = v40;
    v12 = v41;
    v40 = v42;
    v41 = v11;
    v42 = v12;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    v41 = 0xD000000000000017;
    v42 = 0x80000001C1322550;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    v41 = 0xD000000000000019;
    v42 = 0x80000001C1322570;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    v41 = 0xD00000000000001ELL;
    v42 = 0x80000001C1322590;
    SQLDatabase.perform(_:)((uint64_t *)&v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v6)
    {
      LOWORD(v40) = v7;
      v41 = v6;
      sub_1C131C530((unsigned __int16 *)&v40);
      v39 = v10;
      swift_bridgeObjectRelease();
    }
    else
    {
      v39 = v10;
    }
    v40 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    v41 = 0xD000000000000015;
    v42 = 0x80000001C13225B0;
    v44.bindings._rawValue = &v40;
    v22 = SQLDatabase.performSimple(_:)(v44);
    v24 = v23;
    if (v23)
    {

      v25 = 0;
    }
    else
    {
      v25 = v22;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v40 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    v41 = 0xD000000000000011;
    v42 = 0x80000001C13225D0;
    v45.bindings._rawValue = &v40;
    v26 = SQLDatabase.performSimple(_:)(v45);
    if (v27)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      v28 = v26;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v24)
        goto LABEL_25;
      if (qword_1ED798708 != -1)
        swift_once();
      v29 = fmax((double)v28 * 0.05, 256.0);
      v30 = sub_1C1321340();
      __swift_project_value_buffer(v30, (uint64_t)qword_1ED7986F0);
      v31 = sub_1C1321334();
      v32 = sub_1C13213E8();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = swift_slowAlloc();
        *(_DWORD *)v33 = 134349312;
        v40 = v25;
        sub_1C1321424();
        *(_WORD *)(v33 + 12) = 2050;
        v40 = v28;
        sub_1C1321424();
        _os_log_impl(&dword_1C1314000, v31, v32, "Database has %{public}lld/%{public}lld free pages.", (uint8_t *)v33, 0x16u);
        MEMORY[0x1C3BAAC58](v33, -1, -1);
      }

      if (v29 > (double)v25)
        goto LABEL_25;
      v34 = sub_1C1321334();
      v35 = sub_1C13213E8();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_1C1314000, v34, v35, "Vacuuming", v36, 2u);
        MEMORY[0x1C3BAAC58](v36, -1, -1);
      }

      v40 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
      v41 = 0xD000000000000019;
      v42 = 0x80000001C13225F0;
      SQLDatabase.perform(_:)((uint64_t *)&v40);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
LABEL_25:

    return v4;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v4 + 32), sel_close, v37);
  swift_release();
  if (qword_1ED798708 != -1)
    swift_once();
  v13 = sub_1C1321340();
  __swift_project_value_buffer(v13, (uint64_t)qword_1ED7986F0);
  v14 = v3;
  v15 = sub_1C1321334();
  v16 = sub_1C13213DC();
  if (os_log_type_enabled(v15, v16))
  {
    v38 = v4;
    v17 = v10;
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v18 = 138543362;
    v20 = sub_1C13212BC();
    v40 = v20;
    sub_1C1321424();
    *v19 = v20;
    v10 = v17;
    v4 = v38;

    _os_log_impl(&dword_1C1314000, v15, v16, "Failed to open database: %{public}@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF6D97B8);
    swift_arrayDestroy();
    MEMORY[0x1C3BAAC58](v19, -1, -1);
    MEMORY[0x1C3BAAC58](v18, -1, -1);
  }
  else
  {

  }
  swift_willThrow();

  return v4;
}

uint64_t sub_1C131C530(unsigned __int16 *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  unsigned int v3;
  uint64_t v4;
  Swift::Int64 v5;
  uint64_t result;
  uint64_t v7;
  uint8_t *v8;
  unsigned int v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _BYTE *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t *v19;
  void *v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  uint8_t *v25;
  id v26;
  void *v27;
  NSObject *log;
  os_log_type_t type;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  id v33[2];
  SessionSQL::SQLStatement v34;

  v2 = v1;
  v33[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *((_QWORD *)a1 + 1);
  v30 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  v31 = 0xD000000000000013;
  v32 = 0x80000001C1322610;
  v34.bindings._rawValue = &v30;
  v5 = SQLDatabase.performSimple(_:)(v34);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (v7)
    return result;
  if (v5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v5 > 0x7FFFFFFF)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v8 = *(uint8_t **)(v4 + 16);
  if ((unint64_t)v8 >= 0x10000)
  {
    result = sub_1C1321484();
    __break(1u);
  }
  else
  {
    v9 = (unsigned __int16)*(_QWORD *)(v4 + 16);
    if (v3 != WORD1(v5) || (unsigned __int16)v5 != v9)
    {
      v10 = v3 < WORD1(v5);
      if (v3 == WORD1(v5))
        v10 = v9 < (unsigned __int16)v5;
      if (v10)
      {
        if (qword_1ED798708 == -1)
        {
LABEL_11:
          v11 = sub_1C1321340();
          __swift_project_value_buffer(v11, (uint64_t)qword_1ED7986F0);
          v12 = sub_1C1321334();
          v13 = sub_1C13213E8();
          if (os_log_type_enabled(v12, v13))
          {
            v14 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_1C1314000, v12, v13, "Existing schema version is greater than target schema version", v14, 2u);
            MEMORY[0x1C3BAAC58](v14, -1, -1);
          }

          sub_1C131BCEC();
          swift_allocError();
          *v15 = 2;
          return swift_willThrow();
        }
LABEL_30:
        swift_once();
        goto LABEL_11;
      }
      if (qword_1ED798708 != -1)
        swift_once();
      v16 = sub_1C1321340();
      __swift_project_value_buffer(v16, (uint64_t)qword_1ED7986F0);
      v17 = sub_1C1321334();
      type = sub_1C13213E8();
      if (os_log_type_enabled(v17, type))
      {
        log = v17;
        v18 = swift_slowAlloc();
        v27 = (void *)swift_slowAlloc();
        v33[0] = v27;
        *(_DWORD *)v18 = 136446466;
        v30 = 118;
        v31 = 0xE100000000000000;
        sub_1C13214CC();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        swift_bridgeObjectRelease();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        sub_1C13214CC();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        swift_bridgeObjectRelease();
        v19 = (uint8_t *)v18;
        v30 = sub_1C131ED0C(v30, v31, (uint64_t *)v33);
        sub_1C1321424();
        swift_bridgeObjectRelease();
        *(_WORD *)(v18 + 12) = 2082;
        v30 = 118;
        v31 = 0xE100000000000000;
        sub_1C13214CC();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        swift_bridgeObjectRelease();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        sub_1C13214CC();
        _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
        swift_bridgeObjectRelease();
        v30 = sub_1C131ED0C(v30, v31, (uint64_t *)v33);
        sub_1C1321424();
        swift_bridgeObjectRelease();
        v17 = log;
        _os_log_impl(&dword_1C1314000, log, type, "Migrating database from %{public}s to %{public}s", v19, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C3BAAC58](v27, -1, -1);
        MEMORY[0x1C3BAAC58](v19, -1, -1);
      }

      if (v3 == WORD1(v5))
      {
        v30 = (unsigned __int16)v5;
      }
      else
      {
        v20 = (void *)v2[4];
        v33[0] = 0;
        if (!objc_msgSend(v20, sel_truncateDatabaseAndReturnError_, v33))
        {
          v26 = v33[0];
          sub_1C13212C8();

          return swift_willThrow();
        }
        v30 = 0;
        v21 = v33[0];
        v22 = sub_1C1321334();
        v23 = sub_1C13213E8();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (int)v8;
          v8 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1C1314000, v22, v23, "Truncated database", v8, 2u);
          v25 = v8;
          LODWORD(v8) = v24;
          MEMORY[0x1C3BAAC58](v25, -1, -1);
        }

      }
      swift_bridgeObjectRetain();
      swift_retain();
      sub_1C1320700(0x6F6974617267694DLL, 0xE90000000000006ELL, v2, v3, v4, (unint64_t *)&v30, (unint64_t)v2, v3 | ((_DWORD)v8 << 16));
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  return result;
}

Swift::Int64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLDatabase.performSimple(_:)(SessionSQL::SQLStatement a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  _BYTE *v8;
  __int128 v10;
  uint64_t v11;

  v3 = *((_QWORD *)a1.bindings._rawValue + 2);
  v10 = *(_OWORD *)a1.bindings._rawValue;
  v11 = v3;
  v4 = SQLDatabase.perform(_:)((uint64_t *)&v10);
  if (!v2)
  {
    v1 = (uint64_t)v4;
    if (!v4[2] || (v5 = v4[4], swift_bridgeObjectRetain(), swift_bridgeObjectRelease(), *(_QWORD *)(v5 + 16) != 1))
    {
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v1 = *(_QWORD *)(v5 + 48);
    v6 = *(_QWORD *)(v5 + 56);
    v7 = *(unsigned __int8 *)(v5 + 64);
    swift_bridgeObjectRetain();
    sub_1C1316F38(v1, v6, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v7)
    {
      sub_1C1316FA0(v1, v6, v7);
LABEL_7:
      sub_1C131BCEC();
      swift_allocError();
      *v8 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

id sub_1C131CC58()
{
  uint64_t v0;
  uint64_t v2[3];

  v2[0] = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  v2[1] = 0xD00000000000001BLL;
  v2[2] = 0x80000001C13221C0;
  SQLDatabase.perform(_:)(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return objc_msgSend(*(id *)(v0 + 32), sel_close);
}

uint64_t SQLDatabase.deinit()
{
  uint64_t v0;

  swift_release();

  return v0;
}

uint64_t SQLDatabase.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t SQLDatabase.Storage.path.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1C13212E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SQLDatabase.Storage.protectionClass.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SQLDatabase.Storage() + 20));
}

uint64_t SQLDatabase.Storage.init(path:protectionClass:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = sub_1C13212E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for SQLDatabase.Storage();
  *(_QWORD *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t SQLDatabase.__allocating_init(storage:schema:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v11[2];

  v3 = *a2;
  v4 = a2[1];
  v5 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for SQLDatabase.Storage() + 20));
  v6 = objc_allocWithZone(MEMORY[0x1E0D01878]);
  v7 = (void *)sub_1C13212D4();
  v8 = objc_msgSend(v6, sel_initWithFileURL_dataProtectionClass_, v7, v5);

  v11[0] = v3;
  v11[1] = v4;
  type metadata accessor for SQLDatabase();
  swift_allocObject();
  v9 = sub_1C131BD30(v8, v11);
  sub_1C131F848(a1);
  return v9;
}

Swift::Bool __swiftcall SQLDatabase.isInTransaction()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  Swift::Bool v2;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 24) + 16);
  os_unfair_lock_lock(v1);
  v2 = *(_QWORD *)(v0 + 40) != 0;
  os_unfair_lock_unlock(v1);
  return v2;
}

unint64_t sub_1C131CF1C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t i;
  uint64_t *v8;
  _OWORD *v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  char v29[40];
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[2];
  _OWORD v35[3];
  __int128 v36[2];
  uint64_t v37;
  __int128 v38;
  _OWORD v39[2];
  uint64_t v40;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7989C0);
    v2 = (_QWORD *)sub_1C13214B4();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  i = 0;
  if (v5)
    goto LABEL_10;
LABEL_11:
  v12 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v12 >= v27)
    goto LABEL_32;
  v13 = *(_QWORD *)(v28 + 8 * v12);
  v14 = i + 1;
  if (!v13)
  {
    v14 = i + 2;
    if (i + 2 >= v27)
      goto LABEL_32;
    v13 = *(_QWORD *)(v28 + 8 * v14);
    if (!v13)
    {
      v14 = i + 3;
      if (i + 3 >= v27)
        goto LABEL_32;
      v13 = *(_QWORD *)(v28 + 8 * v14);
      if (!v13)
      {
        v14 = i + 4;
        if (i + 4 >= v27)
          goto LABEL_32;
        v13 = *(_QWORD *)(v28 + 8 * v14);
        if (!v13)
        {
          v15 = i + 5;
          if (i + 5 < v27)
          {
            v13 = *(_QWORD *)(v28 + 8 * v15);
            if (v13)
            {
              v14 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v14 = v15 + 1;
              if (__OFADD__(v15, 1))
                goto LABEL_36;
              if (v14 >= v27)
                break;
              v13 = *(_QWORD *)(v28 + 8 * v14);
              ++v15;
              if (v13)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_1C1321098();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v5 = (v13 - 1) & v13;
  v11 = __clz(__rbit64(v13)) + (v14 << 6);
  for (i = v14; ; v11 = v10 | (i << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v18 = *v16;
    v17 = v16[1];
    sub_1C1318C94(*(_QWORD *)(a1 + 56) + 40 * v11, (uint64_t)v39);
    *(_QWORD *)&v38 = v18;
    *((_QWORD *)&v38 + 1) = v17;
    v35[2] = v38;
    v36[0] = v39[0];
    v36[1] = v39[1];
    v37 = v40;
    v30 = v18;
    v31 = v17;
    sub_1C131A624(v36, (uint64_t)v29);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798990);
    swift_dynamicCast();
    v20 = v30;
    v19 = v31;
    sub_1C1317C8C(&v32, v34);
    sub_1C1317C8C(v34, v35);
    sub_1C1317C8C(v35, &v33);
    result = sub_1C131F34C(v20, v19);
    v21 = result;
    if ((v22 & 1) != 0)
    {
      v8 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v20;
      v8[1] = v19;
      v9 = (_OWORD *)(v2[7] + 32 * v21);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      result = (unint64_t)sub_1C1317C8C(&v33, v9);
      if (!v5)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v23 = (uint64_t *)(v2[6] + 16 * result);
    *v23 = v20;
    v23[1] = v19;
    result = (unint64_t)sub_1C1317C8C(&v33, (_OWORD *)(v2[7] + 32 * result));
    v24 = v2[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_34;
    v2[2] = v26;
    if (!v5)
      goto LABEL_11;
LABEL_10:
    v10 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1C131D290(void *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v3 = (_QWORD *)(a2 + 16);
  sub_1C1316010(a1, &v10);
  v4 = v10;
  swift_beginAccess();
  v5 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v5 = sub_1C131EC00(0, v5[2] + 1, 1, v5);
    *v3 = v5;
  }
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
  {
    v5 = sub_1C131EC00((_QWORD *)(v7 > 1), v8 + 1, 1, v5);
    *v3 = v5;
  }
  v5[2] = v8 + 1;
  v5[v8 + 4] = v4;
  return swift_endAccess();
}

void SQLDatabase.inTransaction(reason:_:)(uint64_t a1, unint64_t a2, uint64_t (*a3)(void), unint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  os_unfair_lock_s *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  os_unfair_lock_s *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  os_unfair_lock_s *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  os_unfair_lock_s *v47;
  uint64_t v48;
  os_unfair_lock_s *v49;
  os_unfair_lock_s *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(void);
  unint64_t v56;
  id v57;
  uint64_t v58;
  _BYTE aBlock[24];
  void *v60;
  void (*v61)(uint64_t);
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;

  v6 = v4;
  v65 = a1;
  *(_QWORD *)aBlock = a1;
  *(_QWORD *)&aBlock[8] = a2;
  v63 = 32;
  v64 = 0xE100000000000000;
  sub_1C131F884();
  if ((sub_1C132143C() & 1) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  v10 = v4[3];
  v11 = *(os_unfair_lock_s **)(v10 + 16);
  os_unfair_lock_lock(v11);
  v12 = v6[6];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v6[6] = v14;
  os_unfair_lock_assert_owner(v11);
  v15 = v6[5];
  v16 = v6[6];
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v55 = a3;
  os_unfair_lock_unlock(v11);
  sub_1C1321454();
  swift_bridgeObjectRelease();
  strcpy(aBlock, "transaction_");
  aBlock[13] = 0;
  *(_WORD *)&aBlock[14] = -5120;
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  v63 = v17;
  sub_1C13214CC();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  a4 = *(_QWORD *)&aBlock[8];
  v18 = *(_QWORD *)aBlock;
  v19 = *(os_unfair_lock_s **)(v10 + 16);
  os_unfair_lock_lock(v19);
  v20 = v6[7];
  if (v20 == -1)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v56 = a2;
  v58 = v10;
  v6[7] = v20 + 1;
  sub_1C131B938(v20);
  os_unfair_lock_unlock(v19);
  v21 = objc_allocWithZone(MEMORY[0x1E0D01868]);
  swift_bridgeObjectRetain();
  swift_retain();
  v22 = (void *)sub_1C1321364();
  v23 = (void *)sub_1C1321364();
  swift_bridgeObjectRelease();
  v61 = sub_1C131F8C8;
  v62 = v6;
  *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
  *(_QWORD *)&aBlock[8] = 1107296256;
  *(_QWORD *)&aBlock[16] = sub_1C131D36C;
  v60 = &block_descriptor_3;
  v24 = _Block_copy(aBlock);
  v57 = objc_msgSend(v21, sel_initWithIdentifier_forReason_invalidationBlock_, v22, v23, v24);

  _Block_release(v24);
  swift_release();
  *(_QWORD *)aBlock = 0;
  *(_QWORD *)&aBlock[8] = 0xE000000000000000;
  *(_QWORD *)&aBlock[16] = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  MEMORY[0x1C3BAA73C](10);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  v25 = *(_OWORD *)aBlock;
  *(_QWORD *)aBlock = *(_QWORD *)&aBlock[16];
  *(_OWORD *)&aBlock[8] = v25;
  SQLDatabase.perform(_:)((uint64_t *)aBlock);
  if (!v5)
  {
    v54 = v18;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1ED798708 == -1)
      goto LABEL_9;
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v26 = *(os_unfair_lock_s **)(v58 + 16);
  os_unfair_lock_lock(v26);
  v27 = v6[6];
  v13 = __OFSUB__(v27, 1);
  v28 = v27 - 1;
  if (!v13)
  {
    v6[6] = v28;
    os_unfair_lock_assert_owner(v26);
    os_unfair_lock_unlock(v26);
    swift_willThrow();
LABEL_19:
    objc_msgSend(v57, sel_invalidate, v53);

    return;
  }
LABEL_32:
  __break(1u);
LABEL_33:
  swift_once();
LABEL_9:
  v29 = sub_1C1321340();
  __swift_project_value_buffer(v29, (uint64_t)qword_1ED7986F0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v30 = sub_1C1321334();
  v31 = sub_1C13213D0();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = swift_slowAlloc();
    v53 = swift_slowAlloc();
    *(_QWORD *)aBlock = v53;
    *(_DWORD *)v32 = 136446466;
    swift_bridgeObjectRetain();
    v63 = sub_1C131ED0C(v65, v56, (uint64_t *)aBlock);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v32 + 12) = 2082;
    swift_bridgeObjectRetain();
    v63 = sub_1C131ED0C(v54, a4, (uint64_t *)aBlock);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1314000, v30, v31, "Beginning db savepoint [%{public}s]: %{public}s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BAAC58](v53, -1, -1);
    MEMORY[0x1C3BAAC58](v32, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v33 = v58;
  v34 = *(os_unfair_lock_s **)(v58 + 16);
  os_unfair_lock_lock(v34);
  v35 = v6[6];
  v13 = __OFSUB__(v35, 1);
  v36 = v35 - 1;
  if (v13)
  {
    __break(1u);
    goto LABEL_35;
  }
  v37 = v6[5];
  v6[6] = v36;
  os_unfair_lock_assert_owner(v34);
  v38 = v6[5];
  v13 = __OFADD__(v38, 1);
  v39 = v38 + 1;
  if (v13)
  {
LABEL_35:
    __break(1u);
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v6[5] = v39;
  os_unfair_lock_assert_owner(v34);
  os_unfair_lock_unlock(v34);
  v40 = v55();
  if (v5)
  {
    sub_1C131DE64(v65, v56, v54, a4);
    swift_bridgeObjectRelease();
    swift_willThrow();
    v41 = *(os_unfair_lock_s **)(v58 + 16);
    os_unfair_lock_lock(v41);
    v42 = v6[5];
    v13 = __OFSUB__(v42, 1);
    v43 = v42 - 1;
    if (!v13)
    {
      v6[5] = v43;
      os_unfair_lock_assert_owner(v41);
      os_unfair_lock_unlock(v41);
      goto LABEL_19;
    }
    goto LABEL_36;
  }
  if ((v40 & 1) != 0)
    sub_1C131DBAC(v65, v56, v54, a4);
  else
    sub_1C131DE64(v65, v56, v54, a4);
  swift_bridgeObjectRelease();
  if (v37)
  {
    swift_retain();
    v44 = sub_1C1321334();
    v45 = sub_1C13213D0();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v46 = 134349056;
      v47 = *(os_unfair_lock_s **)(v58 + 16);
      os_unfair_lock_lock(v47);
      v48 = v6[5];
      v49 = v47;
      v33 = v58;
      os_unfair_lock_unlock(v49);
      *(_QWORD *)aBlock = v48;
      sub_1C1321424();
      swift_release();
      _os_log_impl(&dword_1C1314000, v44, v45, "Outstanding transactions remaining: %{public}ld", v46, 0xCu);
      MEMORY[0x1C3BAAC58](v46, -1, -1);

    }
    else
    {

      swift_release();
    }
  }
  else
  {
    sub_1C131E1B4((uint64_t)v6, v65, v56);
  }
  v50 = *(os_unfair_lock_s **)(v33 + 16);
  os_unfair_lock_lock(v50);
  v51 = v6[5];
  v13 = __OFSUB__(v51, 1);
  v52 = v51 - 1;
  if (!v13)
  {
    v6[5] = v52;
    os_unfair_lock_assert_owner(v50);
    os_unfair_lock_unlock(v50);
    objc_msgSend(v57, sel_invalidate);

    return;
  }
LABEL_37:
  __break(1u);
}

uint64_t sub_1C131DBAC(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v5 = v4;
  if (qword_1ED798708 != -1)
    swift_once();
  v10 = sub_1C1321340();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED7986F0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_1C1321334();
  v12 = sub_1C13213D0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v14 = v19;
    *(_DWORD *)v13 = 136446466;
    swift_bridgeObjectRetain();
    v22 = sub_1C131ED0C(a1, a2, &v19);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    v22 = sub_1C131ED0C(a3, a4, &v19);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1314000, v11, v12, "Committing transaction savepoint [%{public}s]: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    v15 = v14;
    v5 = v4;
    MEMORY[0x1C3BAAC58](v15, -1, -1);
    MEMORY[0x1C3BAAC58](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v19 = 0;
  v20 = 0xE000000000000000;
  v21 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  MEMORY[0x1C3BAA73C](18);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  v16 = v19;
  v17 = v20;
  v19 = v21;
  v20 = v16;
  v21 = v17;
  SQLDatabase.perform(_:)(&v19);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (!v5)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1C131DE64(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v5 = v4;
  if (qword_1ED798708 != -1)
    swift_once();
  v10 = sub_1C1321340();
  __swift_project_value_buffer(v10, (uint64_t)qword_1ED7986F0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_1C1321334();
  v12 = sub_1C13213D0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v20 = v14;
    *(_DWORD *)v13 = 136446466;
    swift_bridgeObjectRetain();
    v23 = sub_1C131ED0C(a1, a2, &v20);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    v23 = sub_1C131ED0C(a3, a4, &v20);
    v5 = v4;
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1314000, v11, v12, "Rollback to transaction savepoint [%{public}s]: %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BAAC58](v14, -1, -1);
    MEMORY[0x1C3BAAC58](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v20 = 0;
  v21 = 0xE000000000000000;
  v22 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  MEMORY[0x1C3BAA73C](22);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  v15 = v20;
  v16 = v21;
  v20 = v22;
  v21 = v15;
  v22 = v16;
  SQLDatabase.perform(_:)(&v20);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (!v5)
  {
    swift_bridgeObjectRelease();
    v20 = 0;
    v21 = 0xE000000000000000;
    v22 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
    MEMORY[0x1C3BAA73C](18);
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
    v18 = v20;
    v19 = v21;
    v20 = v22;
    v21 = v18;
    v22 = v19;
    SQLDatabase.perform(_:)(&v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1C131E1B4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16[3];
  uint64_t v17;

  v16[0] = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  v16[1] = 0xD00000000000001BLL;
  v16[2] = 0x80000001C13221C0;
  SQLDatabase.perform(_:)(v16);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1ED798708 != -1)
      swift_once();
    v6 = sub_1C1321340();
    __swift_project_value_buffer(v6, (uint64_t)qword_1ED7986F0);
    swift_bridgeObjectRetain_n();
    v7 = sub_1C1321334();
    v8 = sub_1C13213D0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v16[0] = v10;
      *(_DWORD *)v9 = 136446210;
      swift_bridgeObjectRetain();
      v17 = sub_1C131ED0C(a2, a3, v16);
      sub_1C1321424();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1314000, v7, v8, "Unable to execute wal_checkpoint(FULL, privacy: .public) for: %{public}s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BAAC58](v10, -1, -1);
      MEMORY[0x1C3BAAC58](v9, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1ED798708 != -1)
      swift_once();
    v11 = sub_1C1321340();
    __swift_project_value_buffer(v11, (uint64_t)qword_1ED7986F0);
    swift_bridgeObjectRetain_n();
    v12 = sub_1C1321334();
    v13 = sub_1C13213D0();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v16[0] = v15;
      *(_DWORD *)v14 = 136446210;
      swift_bridgeObjectRetain();
      v17 = sub_1C131ED0C(a2, a3, v16);
      sub_1C1321424();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C1314000, v12, v13, "Successfully executed wal_checkpoint(FULL, privacy: .public) for: %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BAAC58](v15, -1, -1);
      MEMORY[0x1C3BAAC58](v14, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_1C131E54C(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)(a2 + 24) + 16);
  os_unfair_lock_lock(v3);
  v4 = *(_QWORD *)(a2 + 56);
  if (v4)
  {
    *(_QWORD *)(a2 + 56) = v4 - 1;
    sub_1C131B938(v4);
    os_unfair_lock_unlock(v3);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1C131E594(uint64_t a1, uint64_t a2, unint64_t *a3, _QWORD *a4, unsigned int a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v29;
  uint64_t v31[2];
  unint64_t v32;
  unint64_t v33;

  v7 = *a3;
  if ((*a3 & 0x8000000000000000) != 0)
    goto LABEL_34;
  v8 = v5;
  v29 = *(_QWORD *)(a2 + 16);
  if (!v7)
    goto LABEL_16;
  if (!v29)
    goto LABEL_27;
  v10 = v7 - 2;
  if (v7 < 2)
  {
LABEL_16:
    if (v7 == v29)
      goto LABEL_27;
    swift_bridgeObjectRetain();
    while (v7 < *(_QWORD *)(a2 + 16))
    {
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = *(_OWORD *)(a2 + 16 * v7 + 32);
      v17 = qword_1ED798708;
      swift_retain();
      if (v17 != -1)
        swift_once();
      v18 = v7 + 1;
      v19 = sub_1C1321340();
      __swift_project_value_buffer(v19, (uint64_t)qword_1ED7986F0);
      v20 = sub_1C1321334();
      v21 = sub_1C13213E8();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = swift_slowAlloc();
        *(_DWORD *)v22 = 134349312;
        *(_QWORD *)(v22 + 4) = v7;
        *(_WORD *)(v22 + 12) = 2050;
        *(_QWORD *)(v22 + 14) = v18;
        _os_log_impl(&dword_1C1314000, v20, v21, "Migrating from minor revision %{public}ld to %{public}ld", (uint8_t *)v22, 0x16u);
        MEMORY[0x1C3BAAC58](v22, -1, -1);
      }

      sub_1C1321454();
      swift_bridgeObjectRelease();
      strcpy((char *)v31, "MigratingFrom_");
      HIBYTE(v31[1]) = -18;
      sub_1C13214CC();
      _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
      swift_bridgeObjectRelease();
      _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
      v33 = v7 + 1;
      sub_1C13214CC();
      _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
      swift_bridgeObjectRelease();
      swift_retain();
      swift_retain();
      sub_1C131FF00(v31[0], v31[1], a4, (void (*)(uint64_t))sub_1C1320F80, v6, (uint64_t)a4);
      swift_bridgeObjectRelease();
      if (v8)
      {
        swift_bridgeObjectRelease();
        swift_release_n();
        swift_release();
        return 1;
      }
      swift_release_n();
      swift_release();
      ++v7;
      if (v29 == v18)
      {
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    swift_once();
    goto LABEL_29;
  }
  if (v29 - 1 < v10)
    v10 = v29 - 1;
  v11 = v10 + 1;
  if (v11 >= 0x21)
  {
    v13 = v11 & 0x1F;
    if ((v11 & 0x1F) == 0)
      v13 = 32;
    v14 = v11 - v13;
    v12 = v14 + 1;
    do
      v14 -= 32;
    while (v14);
  }
  else
  {
    v12 = 1;
  }
  v15 = v7 - v12;
  v16 = v29 - v12;
  while (v16)
  {
    --v16;
    if (!--v15)
      goto LABEL_16;
  }
LABEL_27:
  v32 = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  MEMORY[0x1C3BAA73C](22);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  LODWORD(v6) = __PAIR64__(a5, a5) >> 16;
  LODWORD(v33) = v6;
  sub_1C13214CC();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  v31[0] = v32;
  v31[1] = 0;
  v32 = 0xE000000000000000;
  SQLDatabase.perform(_:)(v31);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
    return 1;
  swift_bridgeObjectRelease();
  if (qword_1ED798708 != -1)
    goto LABEL_35;
LABEL_29:
  v23 = sub_1C1321340();
  __swift_project_value_buffer(v23, (uint64_t)qword_1ED7986F0);
  v24 = sub_1C1321334();
  v25 = sub_1C13213E8();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v26 = 67240192;
    LODWORD(v31[0]) = v6;
    sub_1C1321424();
    _os_log_impl(&dword_1C1314000, v24, v25, "Set revision to %{public}d", v26, 8u);
    MEMORY[0x1C3BAAC58](v26, -1, -1);
  }

  return 1;
}

void sub_1C131EA8C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

_QWORD *sub_1C131EADC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7989D0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1C131FDF4(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1C131EC00(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7989C8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C1320FA8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C131ED0C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1C131EDDC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C1317C9C((uint64_t)v12, *a3);
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
      sub_1C1317C9C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C131EDDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1C1321430();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1C131EF94(a5, a6);
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
  v8 = sub_1C1321478();
  if (!v8)
  {
    sub_1C1321484();
    __break(1u);
LABEL_17:
    result = sub_1C13214C0();
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

uint64_t sub_1C131EF94(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C131F028(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1C131F200(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1C131F200(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C131F028(uint64_t a1, unint64_t a2)
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
      v3 = sub_1C131F19C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1C1321460();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1C1321484();
      __break(1u);
LABEL_10:
      v2 = sub_1C13213B8();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1C13214C0();
    __break(1u);
LABEL_14:
    result = sub_1C1321484();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1C131F19C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798740);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1C131F200(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798740);
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
  result = sub_1C13214C0();
  __break(1u);
  return result;
}

unint64_t sub_1C131F34C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C132152C();
  sub_1C1321394();
  v4 = sub_1C1321544();
  return sub_1C131F3B0(a1, a2, v4);
}

unint64_t sub_1C131F3B0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C13214D8() & 1) == 0)
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
      while (!v14 && (sub_1C13214D8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1C131F490(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED798728);
  result = sub_1C132149C();
  v3 = *(_QWORD *)(a1 + 64);
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v10 = (unint64_t)(v4 + 63) >> 6;
  if ((v5 & v3) != 0)
  {
    v6 = __clz(__rbit64(v5 & v3));
    goto LABEL_18;
  }
  if ((unint64_t)(v4 + 63) >> 6 > 1)
  {
    v7 = *(_QWORD *)(a1 + 72);
    v8 = 1;
    if (v7)
      goto LABEL_17;
    v8 = 2;
    if (v10 <= 2)
      return result;
    v7 = *(_QWORD *)(a1 + 80);
    if (v7)
      goto LABEL_17;
    v8 = 3;
    if (v10 <= 3)
      return result;
    v7 = *(_QWORD *)(a1 + 88);
    if (v7)
    {
LABEL_17:
      v6 = __clz(__rbit64(v7)) + (v8 << 6);
LABEL_18:
      __asm { BR              X9 }
    }
    v9 = 4;
    if (v10 > 4)
    {
      v7 = *(_QWORD *)(a1 + 96);
      if (v7)
      {
        v8 = 4;
        goto LABEL_17;
      }
      while (1)
      {
        v8 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          JUMPOUT(0x1C131F794);
        }
        if (v8 >= v10)
          break;
        v7 = *(_QWORD *)(a1 + 64 + 8 * v8);
        ++v9;
        if (v7)
          goto LABEL_17;
      }
    }
  }
  return result;
}

uint64_t sub_1C131F7A8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C131F7CC(void *a1)
{
  uint64_t v1;

  return sub_1C131D290(a1, v1);
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

uint64_t type metadata accessor for SQLDatabase.Storage()
{
  uint64_t result;

  result = qword_1ED7986E0;
  if (!qword_1ED7986E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for SQLDatabase()
{
  return objc_opt_self();
}

uint64_t sub_1C131F848(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SQLDatabase.Storage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C131F884()
{
  unint64_t result;

  result = qword_1ED798998;
  if (!qword_1ED798998)
  {
    result = MEMORY[0x1C3BAABEC](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED798998);
  }
  return result;
}

void sub_1C131F8C8(uint64_t a1)
{
  uint64_t v1;

  sub_1C131E54C(a1, v1);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_1C131F8EC()
{
  unint64_t result;

  result = qword_1EF6D97B0;
  if (!qword_1EF6D97B0)
  {
    result = MEMORY[0x1C3BAABEC](&protocol conformance descriptor for SQLiteError, &type metadata for SQLiteError);
    atomic_store(result, (unint64_t *)&qword_1EF6D97B0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLiteError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1C131FA18 + 4 * byte_1C1321E7D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1C131FA4C + 4 * byte_1C1321E78[v4]))();
}

uint64_t sub_1C131FA4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C131FA54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C131FA5CLL);
  return result;
}

uint64_t sub_1C131FA68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C131FA70);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1C131FA74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C131FA7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C131FA88(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C131FA90(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteError()
{
  return &type metadata for SQLiteError;
}

uint64_t method lookup function for SQLDatabase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SQLDatabase.close()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t *initializeBufferWithCopyOfBuffer for SQLDatabase.Storage(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = sub_1C13212E0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for SQLDatabase.Storage(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C13212E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C13212E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C13212E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C13212E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for SQLDatabase.Storage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1C13212E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLDatabase.Storage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C131FCF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1C13212E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SQLDatabase.Storage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C131FD40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1C13212E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1C131FD80()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C13212E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1C131FDF4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7989A8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1C13214C0();
  __break(1u);
  return result;
}

void sub_1C131FF00(unint64_t a1, unint64_t a2, _QWORD *a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  unint64_t v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  os_unfair_lock_s *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  os_unfair_lock_s *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_unfair_lock_s *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  os_unfair_lock_s *v48;
  uint64_t v49;
  os_unfair_lock_s *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  _BYTE aBlock[24];
  void *v60;
  void (*v61)(uint64_t);
  _QWORD *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;

  v12 = a1;
  *(_QWORD *)aBlock = a1;
  *(_QWORD *)&aBlock[8] = a2;
  v63 = 32;
  v64 = 0xE100000000000000;
  sub_1C131F884();
  if ((sub_1C132143C() & 1) != 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v13 = a3[3];
  v14 = *(os_unfair_lock_s **)(v13 + 16);
  os_unfair_lock_lock(v14);
  v15 = a3[6];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v55 = a6;
  a3[6] = v17;
  os_unfair_lock_assert_owner(v14);
  v18 = a3[5];
  v19 = a3[6];
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v54 = a4;
  os_unfair_lock_unlock(v14);
  sub_1C1321454();
  swift_bridgeObjectRelease();
  strcpy(aBlock, "transaction_");
  aBlock[13] = 0;
  *(_WORD *)&aBlock[14] = -5120;
  v56 = v12;
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  v63 = v20;
  sub_1C13214CC();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)&aBlock[8];
  a5 = *(_QWORD *)aBlock;
  v21 = *(os_unfair_lock_s **)(v13 + 16);
  os_unfair_lock_lock(v21);
  v22 = a3[7];
  if (v22 == -1)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v57 = a2;
  v65 = v13;
  a3[7] = v22 + 1;
  sub_1C131B938(v22);
  os_unfair_lock_unlock(v21);
  v23 = objc_allocWithZone(MEMORY[0x1E0D01868]);
  swift_bridgeObjectRetain();
  swift_retain();
  v24 = (void *)sub_1C1321364();
  v25 = (void *)sub_1C1321364();
  swift_bridgeObjectRelease();
  v61 = sub_1C131F8C8;
  v62 = a3;
  *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
  *(_QWORD *)&aBlock[8] = 1107296256;
  *(_QWORD *)&aBlock[16] = sub_1C131D36C;
  v60 = &block_descriptor_14;
  v26 = _Block_copy(aBlock);
  v58 = objc_msgSend(v23, sel_initWithIdentifier_forReason_invalidationBlock_, v24, v25, v26);

  _Block_release(v26);
  swift_release();
  *(_QWORD *)aBlock = 0;
  *(_QWORD *)&aBlock[8] = 0xE000000000000000;
  *(_QWORD *)&aBlock[16] = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  MEMORY[0x1C3BAA73C](10);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  v27 = *(_OWORD *)aBlock;
  *(_QWORD *)aBlock = *(_QWORD *)&aBlock[16];
  *(_OWORD *)&aBlock[8] = v27;
  SQLDatabase.perform(_:)((uint64_t *)aBlock);
  if (!v6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1ED798708 == -1)
      goto LABEL_9;
    goto LABEL_31;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = *(os_unfair_lock_s **)(v65 + 16);
  os_unfair_lock_lock(v28);
  v29 = a3[6];
  v16 = __OFSUB__(v29, 1);
  v30 = v29 - 1;
  if (!v16)
  {
    a3[6] = v30;
    os_unfair_lock_assert_owner(v28);
    os_unfair_lock_unlock(v28);
    swift_willThrow();
LABEL_18:
    objc_msgSend(v58, sel_invalidate);

    return;
  }
LABEL_30:
  __break(1u);
LABEL_31:
  swift_once();
LABEL_9:
  v31 = sub_1C1321340();
  __swift_project_value_buffer(v31, (uint64_t)qword_1ED7986F0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v32 = sub_1C1321334();
  v33 = sub_1C13213D0();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc();
    v53 = swift_slowAlloc();
    *(_QWORD *)aBlock = v53;
    *(_DWORD *)v34 = 136446466;
    swift_bridgeObjectRetain();
    v63 = sub_1C131ED0C(v56, v57, (uint64_t *)aBlock);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 2082;
    swift_bridgeObjectRetain();
    v63 = sub_1C131ED0C(a5, v12, (uint64_t *)aBlock);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1314000, v32, v33, "Beginning db savepoint [%{public}s]: %{public}s", (uint8_t *)v34, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BAAC58](v53, -1, -1);
    MEMORY[0x1C3BAAC58](v34, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v35 = v65;
  v36 = *(os_unfair_lock_s **)(v65 + 16);
  os_unfair_lock_lock(v36);
  v38 = a3[5];
  v37 = a3[6];
  v16 = __OFSUB__(v37, 1);
  v39 = v37 - 1;
  if (v16)
  {
    __break(1u);
    goto LABEL_33;
  }
  a3[6] = v39;
  os_unfair_lock_assert_owner(v36);
  v40 = a3[5];
  v16 = __OFADD__(v40, 1);
  v41 = v40 + 1;
  if (v16)
  {
LABEL_33:
    __break(1u);
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  a3[5] = v41;
  os_unfair_lock_assert_owner(v36);
  os_unfair_lock_unlock(v36);
  v54(v55);
  if (v6)
  {
    sub_1C131DE64(v56, v57, a5, v12);
    swift_bridgeObjectRelease();
    swift_willThrow();
    v42 = *(os_unfair_lock_s **)(v35 + 16);
    os_unfair_lock_lock(v42);
    v43 = a3[5];
    v16 = __OFSUB__(v43, 1);
    v44 = v43 - 1;
    if (!v16)
    {
      a3[5] = v44;
      os_unfair_lock_assert_owner(v42);
      os_unfair_lock_unlock(v42);
      goto LABEL_18;
    }
    goto LABEL_34;
  }
  sub_1C131DBAC(v56, v57, a5, v12);
  swift_bridgeObjectRelease();
  if (v38)
  {
    swift_retain();
    v45 = sub_1C1321334();
    v46 = sub_1C13213D0();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v47 = 134349056;
      v48 = *(os_unfair_lock_s **)(v65 + 16);
      os_unfair_lock_lock(v48);
      v49 = a3[5];
      os_unfair_lock_unlock(v48);
      *(_QWORD *)aBlock = v49;
      v35 = v65;
      sub_1C1321424();
      swift_release();
      _os_log_impl(&dword_1C1314000, v45, v46, "Outstanding transactions remaining: %{public}ld", v47, 0xCu);
      MEMORY[0x1C3BAAC58](v47, -1, -1);

    }
    else
    {

      swift_release();
    }
  }
  else
  {
    sub_1C131E1B4((uint64_t)a3, v56, v57);
  }
  v50 = *(os_unfair_lock_s **)(v35 + 16);
  os_unfair_lock_lock(v50);
  v51 = a3[5];
  v16 = __OFSUB__(v51, 1);
  v52 = v51 - 1;
  if (!v16)
  {
    a3[5] = v52;
    os_unfair_lock_assert_owner(v50);
    os_unfair_lock_unlock(v50);
    objc_msgSend(v58, sel_invalidate);

    return;
  }
LABEL_35:
  __break(1u);
}

void sub_1C1320700(uint64_t a1, unint64_t a2, _QWORD *a3, unsigned int a4, uint64_t a5, unint64_t *a6, unint64_t a7, unsigned int a8)
{
  uint64_t v8;
  uint64_t v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_unfair_lock_s *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  os_unfair_lock_s *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_unfair_lock_s *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  os_unfair_lock_s *v51;
  uint64_t v52;
  os_unfair_lock_s *v53;
  uint64_t v54;
  uint64_t v55;
  os_unfair_lock_s *v56;
  uint64_t v57;
  uint64_t v58;
  os_log_type_t type;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  unsigned int v64;
  unint64_t *v65;
  uint64_t v66;
  unint64_t v68;
  id v69;
  _BYTE aBlock[24];
  void *v71;
  void (*v72)(uint64_t);
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;

  *(_QWORD *)aBlock = a1;
  *(_QWORD *)&aBlock[8] = a2;
  v74 = 32;
  v75 = 0xE100000000000000;
  sub_1C131F884();
  if ((sub_1C132143C() & 1) != 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  v66 = a5;
  v16 = a3[3];
  v17 = *(os_unfair_lock_s **)(v16 + 16);
  os_unfair_lock_lock(v17);
  v18 = a3[6];
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v65 = a6;
  a3[6] = v20;
  os_unfair_lock_assert_owner(v17);
  v21 = a3[5];
  v22 = a3[6];
  v23 = v21 + v22;
  if (__OFADD__(v21, v22))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v63 = (_QWORD *)a7;
  v64 = a8;
  os_unfair_lock_unlock(v17);
  sub_1C1321454();
  swift_bridgeObjectRelease();
  strcpy(aBlock, "transaction_");
  aBlock[13] = 0;
  *(_WORD *)&aBlock[14] = -5120;
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  v74 = v23;
  sub_1C13214CC();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  swift_bridgeObjectRelease();
  a7 = *(_QWORD *)&aBlock[8];
  v24 = *(_QWORD *)aBlock;
  v25 = *(os_unfair_lock_s **)(v16 + 16);
  os_unfair_lock_lock(v25);
  v26 = a3[7];
  if (v26 == -1)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v68 = a2;
  v76 = v16;
  a3[7] = v26 + 1;
  sub_1C131B938(v26);
  os_unfair_lock_unlock(v25);
  v27 = objc_allocWithZone(MEMORY[0x1E0D01868]);
  swift_bridgeObjectRetain();
  swift_retain();
  v28 = (void *)sub_1C1321364();
  v29 = (void *)sub_1C1321364();
  swift_bridgeObjectRelease();
  v72 = sub_1C131F8C8;
  v73 = a3;
  *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
  *(_QWORD *)&aBlock[8] = 1107296256;
  *(_QWORD *)&aBlock[16] = sub_1C131D36C;
  v71 = &block_descriptor_7;
  v30 = _Block_copy(aBlock);
  v69 = objc_msgSend(v27, sel_initWithIdentifier_forReason_invalidationBlock_, v28, v29, v30);

  _Block_release(v30);
  swift_release();
  *(_QWORD *)aBlock = 0;
  *(_QWORD *)&aBlock[8] = 0xE000000000000000;
  *(_QWORD *)&aBlock[16] = sub_1C131A6D0(MEMORY[0x1E0DEE9D8]);
  MEMORY[0x1C3BAA73C](10);
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0();
  v31 = *(_OWORD *)aBlock;
  *(_QWORD *)aBlock = *(_QWORD *)&aBlock[16];
  *(_OWORD *)&aBlock[8] = v31;
  SQLDatabase.perform(_:)((uint64_t *)aBlock);
  if (!v8)
  {
    v61 = v24;
    v62 = a1;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1ED798708 == -1)
      goto LABEL_9;
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v32 = *(os_unfair_lock_s **)(v76 + 16);
  os_unfair_lock_lock(v32);
  v33 = a3[6];
  v19 = __OFSUB__(v33, 1);
  v34 = v33 - 1;
  if (!v19)
  {
    a3[6] = v34;
    os_unfair_lock_assert_owner(v32);
    os_unfair_lock_unlock(v32);
    swift_willThrow();
LABEL_23:
    objc_msgSend(v69, sel_invalidate);

    return;
  }
LABEL_32:
  __break(1u);
LABEL_33:
  swift_once();
LABEL_9:
  v35 = sub_1C1321340();
  __swift_project_value_buffer(v35, (uint64_t)qword_1ED7986F0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v36 = sub_1C1321334();
  v37 = sub_1C13213D0();
  if (os_log_type_enabled(v36, v37))
  {
    type = v37;
    v38 = swift_slowAlloc();
    v60 = swift_slowAlloc();
    *(_QWORD *)aBlock = v60;
    *(_DWORD *)v38 = 136446466;
    swift_bridgeObjectRetain();
    v74 = sub_1C131ED0C(v62, v68, (uint64_t *)aBlock);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v38 + 12) = 2082;
    swift_bridgeObjectRetain();
    v39 = v61;
    v74 = sub_1C131ED0C(v61, a7, (uint64_t *)aBlock);
    sub_1C1321424();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1C1314000, v36, type, "Beginning db savepoint [%{public}s]: %{public}s", (uint8_t *)v38, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BAAC58](v60, -1, -1);
    MEMORY[0x1C3BAAC58](v38, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    v39 = v61;
  }
  v40 = v76;
  v41 = *(os_unfair_lock_s **)(v76 + 16);
  os_unfair_lock_lock(v41);
  v42 = a3[6];
  v19 = __OFSUB__(v42, 1);
  v43 = v42 - 1;
  if (v19)
  {
    __break(1u);
    goto LABEL_35;
  }
  v44 = a3[5];
  a3[6] = v43;
  os_unfair_lock_assert_owner(v41);
  v45 = a3[5];
  v19 = __OFADD__(v45, 1);
  v46 = v45 + 1;
  if (v19)
  {
LABEL_35:
    __break(1u);
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  a3[5] = v46;
  os_unfair_lock_assert_owner(v41);
  os_unfair_lock_unlock(v41);
  v47 = sub_1C131E594(a4, v66, v65, v63, v64);
  if (v8)
  {
    sub_1C131DE64(v62, v68, v39, a7);
    swift_bridgeObjectRelease();
    swift_willThrow();
    v53 = *(os_unfair_lock_s **)(v40 + 16);
    os_unfair_lock_lock(v53);
    v54 = a3[5];
    v19 = __OFSUB__(v54, 1);
    v55 = v54 - 1;
    if (!v19)
    {
      a3[5] = v55;
      os_unfair_lock_assert_owner(v53);
      os_unfair_lock_unlock(v53);
      goto LABEL_23;
    }
    goto LABEL_36;
  }
  if ((v47 & 1) != 0)
    sub_1C131DBAC(v62, v68, v39, a7);
  else
    sub_1C131DE64(v62, v68, v39, a7);
  swift_bridgeObjectRelease();
  if (v44)
  {
    swift_retain();
    v48 = sub_1C1321334();
    v49 = sub_1C13213D0();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v50 = 134349056;
      v51 = *(os_unfair_lock_s **)(v76 + 16);
      os_unfair_lock_lock(v51);
      v52 = a3[5];
      os_unfair_lock_unlock(v51);
      *(_QWORD *)aBlock = v52;
      v40 = v76;
      sub_1C1321424();
      swift_release();
      _os_log_impl(&dword_1C1314000, v48, v49, "Outstanding transactions remaining: %{public}ld", v50, 0xCu);
      MEMORY[0x1C3BAAC58](v50, -1, -1);

    }
    else
    {

      swift_release();
    }
  }
  else
  {
    sub_1C131E1B4((uint64_t)a3, v62, v68);
  }
  v56 = *(os_unfair_lock_s **)(v40 + 16);
  os_unfair_lock_lock(v56);
  v57 = a3[5];
  v19 = __OFSUB__(v57, 1);
  v58 = v57 - 1;
  if (!v19)
  {
    a3[5] = v58;
    os_unfair_lock_assert_owner(v56);
    os_unfair_lock_unlock(v56);
    objc_msgSend(v69, sel_invalidate);

    return;
  }
LABEL_37:
  __break(1u);
}

uint64_t sub_1C1320F5C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C1320F80(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_1C1320FA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1C13214C0();
  __break(1u);
  return result;
}

uint64_t sub_1C1321098()
{
  return swift_release();
}

unint64_t sub_1C13210A0()
{
  unint64_t result;

  result = qword_1ED7989B8;
  if (!qword_1ED7989B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED7989B8);
  }
  return result;
}

uint64_t sub_1C13210F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1C132131C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C1321340();
  __swift_allocate_value_buffer(v4, qword_1ED7986F0);
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED7986F0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0C8FF18], v0);
  return sub_1C1321328();
}

uint64_t static Logger.database.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1ED798708 != -1)
    swift_once();
  v2 = sub_1C1321340();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED7986F0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
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

uint64_t sub_1C132125C()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1C1321268()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1C1321274()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1C1321280()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1C132128C()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1C1321298()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1C13212A4()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1C13212B0()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1C13212BC()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1C13212C8()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C13212D4()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1C13212E0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1C13212EC()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1C13212F8()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1C1321304()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1C1321310()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_1C132131C()
{
  return MEMORY[0x1E0C8FF30]();
}

uint64_t sub_1C1321328()
{
  return MEMORY[0x1E0C90220]();
}

uint64_t sub_1C1321334()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C1321340()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C132134C()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C1321358()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C1321364()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C1321370()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C132137C()
{
  return MEMORY[0x1E0CB1A58]();
}

uint64_t sub_1C1321388()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_1C1321394()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t _s10SessionSQL12SQLStatementV19StringInterpolationV06appendE07trustedySS_tF_0()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C13213AC()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1C13213B8()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C13213C4()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1C13213D0()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C13213DC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C13213E8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C13213F4()
{
  return MEMORY[0x1E0CB1FC0]();
}

uint64_t sub_1C1321400()
{
  return MEMORY[0x1E0CB1FC8]();
}

uint64_t sub_1C132140C()
{
  return MEMORY[0x1E0CB1FD0]();
}

uint64_t sub_1C1321418()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1C1321424()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C1321430()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C132143C()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1C1321448()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C1321454()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C1321460()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C132146C()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1C1321478()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C1321484()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C1321490()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1C132149C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1C13214A8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1C13214B4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1C13214C0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C13214CC()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C13214D8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C13214E4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C13214F0()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C13214FC()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C1321508()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C1321514()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C1321520()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C132152C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C1321538()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C1321544()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C1321550()
{
  return MEMORY[0x1E0DEE978]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

