uint64_t sub_1C25DF19C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1C25F00D0(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C25E46F4();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_1C25F2AFC();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = sub_1C25F3288();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a2, v12 + *(_QWORD *)(v14 + 72) * v6, v13);
    sub_1C25E2370(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = sub_1C25F3288();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_1C25DF2D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1C25F00D0(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v16 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C25E49D4();
      v9 = v16;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_1C25F2AFC();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(_QWORD *)(v12 + 72) * v6;
    (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v10 + v13, v11);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v12 + 32))(a2, *(_QWORD *)(v9 + 56) + v13, v11);
    sub_1C25E2644(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a2, 0, 1, v11);
  }
  else
  {
    v15 = sub_1C25F2AFC();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a2, 1, 1, v15);
  }
}

uint64_t sub_1C25DF408(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1C25F003C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C25E4C30();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 24 * v6);
  sub_1C25E2900(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C25DF4F8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1C25F003C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1C25E4E10(&qword_1EF77CAD8);
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1C25E2AE8(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C25DF5CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v8;
  unint64_t v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v8 = v5;
  swift_bridgeObjectRetain();
  v12 = sub_1C25F003C(a1, a2);
  LOBYTE(a2) = v13;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v8;
    v21 = *v8;
    *v8 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C25E4FBC(a3, a4);
      v15 = v21;
    }
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(v15 + 56);
    v17 = a3(0);
    v18 = *(_QWORD *)(v17 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v18 + 32))(a5, v16 + *(_QWORD *)(v18 + 72) * v12, v17);
    sub_1C25E2CBC(v12, v15, a3);
    *v8 = v15;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(a5, 0, 1, v17);
  }
  else
  {
    v20 = a3(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(a5, 1, 1, v20);
  }
}

uint64_t sub_1C25DF710@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1C25F003C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1C25E5748();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = type metadata accessor for RootRequestController.TRPCache(0);
    v14 = *(_QWORD *)(v13 - 8);
    sub_1C25E62CC(v12 + *(_QWORD *)(v14 + 72) * v8, a3);
    sub_1C25E2CBC(v8, v11, type metadata accessor for RootRequestController.TRPCache);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for RootRequestController.TRPCache(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_1C25DF844(uint64_t a1, char a2)
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
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CA70);
  v6 = sub_1C25F56C4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
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
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_1C25524F8((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_1C25E7170(v25, (uint64_t)&v38);
      sub_1C25786D4(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_1C25F55A4();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
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
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_1C25524F8(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C25DFB58(uint64_t a1, char a2)
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
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[3];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB28);
  v37 = a2;
  v6 = sub_1C25F56C4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
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
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 48 * v17);
    if ((v37 & 1) != 0)
    {
      sub_1C2575934(v25, v38);
    }
    else
    {
      sub_1C2575900((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_1C25F5838();
    sub_1C25F534C();
    result = sub_1C25F5850();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = (uint64_t)sub_1C2575934(v38, (_OWORD *)(*(_QWORD *)(v7 + 56) + 48 * v14));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C25DFE7C(uint64_t a1, char a2)
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
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  __int128 v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB18);
  v38 = a2;
  v6 = sub_1C25F56C4();
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
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v14 << 6);
      goto LABEL_31;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v11)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v37 + 8 * v23);
    ++v14;
    if (!v25)
    {
      v14 = v23 + 1;
      if (v23 + 1 >= v11)
        goto LABEL_33;
      v25 = *(_QWORD *)(v37 + 8 * v14);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v14 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v25 = *(_QWORD *)(v37 + 8 * v14);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v14 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v39 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v31);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1C25F5838();
    sub_1C25F534C();
    result = sub_1C25F5850();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v17 == v28;
        if (v17 == v28)
          v17 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 16 * v18;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v19);
    *v20 = v34;
    v20[1] = v33;
    *(_OWORD *)(*(_QWORD *)(v7 + 56) + v19) = v39;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v24 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C25E0188(uint64_t a1, int a2)
{
  return sub_1C25E0FA4(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x1E0D9E0D0], &qword_1EF77CB10);
}

uint64_t sub_1C25E019C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = v2;
  v5 = sub_1C25F3288();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x1E0C80A78](v5);
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_1C25F2AFC();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF77CAF8);
  v11 = sub_1C25F56C4();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v46 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v44 = v2;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  v48 = v10;
  result = swift_retain();
  v19 = 0;
  v43 = a2;
  v20 = 16;
  if ((a2 & 1) != 0)
    v20 = 32;
  v47 = v20;
  v21 = v20;
  while (1)
  {
    if (v16)
    {
      v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v24 = v23 | (v19 << 6);
      goto LABEL_24;
    }
    v25 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45)
      break;
    v26 = v46;
    v27 = v46[v25];
    ++v19;
    if (!v27)
    {
      v19 = v25 + 1;
      if (v25 + 1 >= v45)
        goto LABEL_34;
      v27 = v46[v19];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          v40 = v48;
          swift_release();
          v3 = v44;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            v19 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v19 >= v45)
              goto LABEL_34;
            v27 = v46[v19];
            ++v28;
            if (v27)
              goto LABEL_23;
          }
        }
        v19 = v28;
      }
    }
LABEL_23:
    v16 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v19 << 6);
LABEL_24:
    v29 = v48;
    v30 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v21))(v9, *(_QWORD *)(v48 + 48) + v30 * v24, v7);
    v31 = *(_QWORD *)(v29 + 56);
    v32 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v21))(v50, v31 + v32 * v24, v52);
    sub_1C254354C(&qword_1ED7B0B90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    result = sub_1C25F52F8();
    v33 = -1 << *(_BYTE *)(v12 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v39 == -1);
      v22 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v12 + 48) + v30 * v22, v9, v7);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v12 + 56) + v32 * v22, v50, v52);
    ++*(_QWORD *)(v12 + 16);
  }
  v40 = v48;
  swift_release();
  v3 = v44;
  v26 = v46;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v40 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v40 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_1C25E0594(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(unint64_t, _BYTE *, uint64_t);
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  _QWORD *v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(_BYTE *, unint64_t, uint64_t);
  unint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[4];
  int v48;
  uint64_t *v49;
  int64_t v50;
  _QWORD *v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;

  v3 = v2;
  v5 = sub_1C25F2AFC();
  v55 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = &v47[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v47[-v9];
  v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB08);
  v12 = sub_1C25F56C4();
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v11 + 32);
  v14 = *(_QWORD *)(v11 + 64);
  v51 = (_QWORD *)(v11 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v49 = v2;
  v50 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11;
  v18 = v12 + 64;
  v54 = v17;
  result = swift_retain();
  v20 = 0;
  v48 = a2;
  v21 = 16;
  if ((a2 & 1) != 0)
    v21 = 32;
  v52 = v21;
  v53 = v8;
  while (1)
  {
    if (v16)
    {
      v26 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v27 = v26 | (v20 << 6);
      goto LABEL_24;
    }
    v28 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v28 >= v50)
      break;
    v29 = v51;
    v30 = v51[v28];
    ++v20;
    if (!v30)
    {
      v20 = v28 + 1;
      if (v28 + 1 >= v50)
        goto LABEL_34;
      v30 = v51[v20];
      if (!v30)
      {
        v31 = v28 + 2;
        if (v31 >= v50)
        {
LABEL_34:
          v45 = v54;
          swift_release();
          v3 = v49;
          if ((v48 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v30 = v51[v31];
        if (!v30)
        {
          while (1)
          {
            v20 = v31 + 1;
            if (__OFADD__(v31, 1))
              goto LABEL_43;
            if (v20 >= v50)
              goto LABEL_34;
            v30 = v51[v20];
            ++v31;
            if (v30)
              goto LABEL_23;
          }
        }
        v20 = v31;
      }
    }
LABEL_23:
    v16 = (v30 - 1) & v30;
    v27 = __clz(__rbit64(v30)) + (v20 << 6);
LABEL_24:
    v32 = v54;
    v33 = *(_QWORD *)(v55 + 72);
    v34 = v33 * v27;
    v35 = *(void (**)(_BYTE *, unint64_t, uint64_t))(v55 + v52);
    v35(v10, *(_QWORD *)(v54 + 48) + v33 * v27, v5);
    v36 = *(_QWORD *)(v32 + 56) + v34;
    v37 = v53;
    v35(v53, v36, v5);
    sub_1C254354C(&qword_1ED7B0B90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    result = sub_1C25F52F8();
    v38 = -1 << *(_BYTE *)(v12 + 32);
    v39 = result & ~v38;
    v40 = v39 >> 6;
    if (((-1 << v39) & ~*(_QWORD *)(v18 + 8 * (v39 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v39) & ~*(_QWORD *)(v18 + 8 * (v39 >> 6)))) | v39 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v41 = 0;
      v42 = (unint64_t)(63 - v38) >> 6;
      do
      {
        if (++v40 == v42 && (v41 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v43 = v40 == v42;
        if (v40 == v42)
          v40 = 0;
        v41 |= v43;
        v44 = *(_QWORD *)(v18 + 8 * v40);
      }
      while (v44 == -1);
      v22 = __clz(__rbit64(~v44)) + (v40 << 6);
    }
    *(_QWORD *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    v23 = v33 * v22;
    v24 = *(_QWORD *)(v12 + 48) + v33 * v22;
    v25 = *(void (**)(unint64_t, _BYTE *, uint64_t))(v55 + 32);
    v25(v24, v10, v5);
    result = ((uint64_t (*)(unint64_t, _BYTE *, uint64_t))v25)(*(_QWORD *)(v12 + 56) + v23, v37, v5);
    ++*(_QWORD *)(v12 + 16);
  }
  v45 = v54;
  swift_release();
  v3 = v49;
  v29 = v51;
  if ((v48 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v46 = 1 << *(_BYTE *)(v45 + 32);
  if (v46 >= 64)
    bzero(v29, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v29 = -1 << v46;
  *(_QWORD *)(v45 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_1C25E096C(uint64_t a1, char a2)
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
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  char v37;
  __int128 v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B1640);
  v37 = a2;
  v6 = sub_1C25F56C4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
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
        if (v22 >= v35)
          goto LABEL_33;
        v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_33;
          v23 = v36[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v37 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v35)
                  goto LABEL_33;
                v23 = v36[v13];
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
      v31 = *v29;
      v30 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + 24 * v21;
      v38 = *(_OWORD *)v32;
      v33 = *(_QWORD *)(v32 + 16);
      if ((v37 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        swift_retain();
      }
      sub_1C25F5838();
      sub_1C25F534C();
      result = sub_1C25F5850();
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
      *v18 = v31;
      v18[1] = v30;
      v19 = *(_QWORD *)(v7 + 56) + 24 * v17;
      *(_OWORD *)v19 = v38;
      *(_QWORD *)(v19 + 16) = v33;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C25E0C94(uint64_t a1, char a2, uint64_t *a3)
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
  v7 = sub_1C25F56C4();
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
    sub_1C25F5838();
    sub_1C25F534C();
    result = sub_1C25F5850();
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

uint64_t sub_1C25E0FA4(uint64_t a1, int a2, uint64_t (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
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
  int v46;
  char *v47;
  uint64_t v48;

  v6 = v4;
  v48 = a3(0);
  v8 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48);
  v47 = (char *)&v42 - v9;
  v10 = *v4;
  __swift_instantiateConcreteTypeFromMangledName(a4);
  v46 = a2;
  v11 = sub_1C25F56C4();
  v12 = v11;
  if (*(_QWORD *)(v10 + 16))
  {
    v43 = v4;
    v13 = 1 << *(_BYTE *)(v10 + 32);
    v14 = *(_QWORD *)(v10 + 64);
    v45 = (_QWORD *)(v10 + 64);
    if (v13 < 64)
      v15 = ~(-1 << v13);
    else
      v15 = -1;
    v16 = v15 & v14;
    v44 = (unint64_t)(v13 + 63) >> 6;
    v17 = v11 + 64;
    result = swift_retain();
    v19 = 0;
    while (1)
    {
      if (v16)
      {
        v22 = __clz(__rbit64(v16));
        v16 &= v16 - 1;
        v23 = v22 | (v19 << 6);
      }
      else
      {
        v24 = v19 + 1;
        if (__OFADD__(v19, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v24 >= v44)
          goto LABEL_34;
        v25 = v45[v24];
        ++v19;
        if (!v25)
        {
          v19 = v24 + 1;
          if (v24 + 1 >= v44)
            goto LABEL_34;
          v25 = v45[v19];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v44)
            {
LABEL_34:
              swift_release();
              v6 = v43;
              if ((v46 & 1) != 0)
              {
                v41 = 1 << *(_BYTE *)(v10 + 32);
                if (v41 >= 64)
                  bzero(v45, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v45 = -1 << v41;
                *(_QWORD *)(v10 + 16) = 0;
              }
              break;
            }
            v25 = v45[v26];
            if (!v25)
            {
              while (1)
              {
                v19 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_41;
                if (v19 >= v44)
                  goto LABEL_34;
                v25 = v45[v19];
                ++v26;
                if (v25)
                  goto LABEL_21;
              }
            }
            v19 = v26;
          }
        }
LABEL_21:
        v16 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v19 << 6);
      }
      v27 = *(_QWORD *)(v10 + 56);
      v28 = v10;
      v29 = (uint64_t *)(*(_QWORD *)(v10 + 48) + 16 * v23);
      v31 = *v29;
      v30 = v29[1];
      v32 = *(_QWORD *)(v8 + 72);
      v33 = v27 + v32 * v23;
      if ((v46 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 32))(v47, v33, v48);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v47, v33, v48);
        swift_bridgeObjectRetain();
      }
      sub_1C25F5838();
      sub_1C25F534C();
      result = sub_1C25F5850();
      v34 = -1 << *(_BYTE *)(v12 + 32);
      v35 = result & ~v34;
      v36 = v35 >> 6;
      if (((-1 << v35) & ~*(_QWORD *)(v17 + 8 * (v35 >> 6))) != 0)
      {
        v20 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v17 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          v39 = v36 == v38;
          if (v36 == v38)
            v36 = 0;
          v37 |= v39;
          v40 = *(_QWORD *)(v17 + 8 * v36);
        }
        while (v40 == -1);
        v20 = __clz(__rbit64(~v40)) + (v36 << 6);
      }
      *(_QWORD *)(v17 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
      v21 = (_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v20);
      *v21 = v31;
      v21[1] = v30;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v12 + 56) + v32 * v20, v47, v48);
      ++*(_QWORD *)(v12 + 16);
      v10 = v28;
    }
  }
  result = swift_release();
  *v6 = v12;
  return result;
}

uint64_t sub_1C25E1308(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CAD0);
  v36 = a2;
  v6 = sub_1C25F56C4();
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
      swift_bridgeObjectRetain();
    }
    sub_1C25F5838();
    sub_1C25F534C();
    result = sub_1C25F5850();
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

uint64_t sub_1C25E161C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B1278);
  v42 = a2;
  v6 = sub_1C25F56C4();
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
    sub_1C25F5838();
    sub_1C25F534C();
    result = sub_1C25F5850();
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

uint64_t sub_1C25E1940(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
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
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CAE0);
  v6 = a2;
  v7 = sub_1C25F56C4();
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v22 = v21 | (v14 << 6);
      }
      else
      {
        v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35)
          goto LABEL_33;
        v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          v14 = v23 + 1;
          if (v23 + 1 >= v35)
            goto LABEL_33;
          v24 = v36[v14];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v6 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                v14 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v14 >= v35)
                  goto LABEL_33;
                v24 = v36[v14];
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
        v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      v30 = 16 * v22;
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *v31;
      v32 = v31[1];
      v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_1C258E9A4(v37);
      }
      sub_1C25F5838();
      sub_1C25F534C();
      result = sub_1C25F5850();
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
            goto LABEL_39;
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
      v19 = 16 * v18;
      v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
      *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + v19) = v37;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t sub_1C25E1C4C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
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
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  _QWORD *v41;
  uint64_t v42;
  int v43;

  v3 = v2;
  v5 = type metadata accessor for RootRequestController.TRPCache(0);
  v42 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0B60);
  v43 = a2;
  v9 = sub_1C25F56C4();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v41 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v39 = v2;
  v40 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
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
    if (v22 >= v40)
      break;
    v23 = v41;
    v24 = v41[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_34;
      v24 = v41[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_34:
          swift_release();
          v3 = v39;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v41[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v40)
              goto LABEL_34;
            v24 = v41[v17];
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
    v26 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v42 + 72);
    v30 = *(_QWORD *)(v8 + 56) + v29 * v21;
    if ((v43 & 1) != 0)
    {
      sub_1C25E62CC(v30, (uint64_t)v7);
    }
    else
    {
      sub_1C25E6310(v30, (uint64_t)v7);
      swift_bridgeObjectRetain();
    }
    sub_1C25F5838();
    sub_1C25F534C();
    result = sub_1C25F5850();
    v31 = -1 << *(_BYTE *)(v10 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v15 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v15 + 8 * v33);
      }
      while (v37 == -1);
      v18 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = sub_1C25E62CC((uint64_t)v7, *(_QWORD *)(v10 + 56) + v29 * v18);
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = v41;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v8 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

unint64_t sub_1C25E1FB4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1C25F5598();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1C25E7170(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = sub_1C25F55A4();
        result = sub_1C2552508((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C25E217C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  __int128 *v17;
  __int128 *v18;
  BOOL v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1C25F5598();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1C25F5838();
        swift_bridgeObjectRetain();
        sub_1C25F534C();
        v11 = sub_1C25F5850();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (__int128 *)(v16 + 48 * v3);
          v18 = (__int128 *)(v16 + 48 * v6);
          if (48 * v3 < (uint64_t)(48 * v6) || v17 >= v18 + 3 || (v19 = v3 == v6, v3 = v6, !v19))
          {
            v9 = *v18;
            v10 = v18[2];
            v17[1] = v18[1];
            v17[2] = v10;
            *v17 = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C25E2370(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_1C25F2AFC();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_1C25F5598();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_1C254354C(&qword_1ED7B0B90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        v18 = sub_1C25F52F8();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v8 = v14;
            if (v15 * a1 < v16
              || *(_QWORD *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v16 + v15))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = *(_QWORD *)(*(_QWORD *)(sub_1C25F3288() - 8) + 72);
            v24 = v23 * a1;
            result = v22 + v23 * a1;
            v25 = v23 * v10;
            v26 = v22 + v23 * v10 + v23;
            if (v24 < v25 || result >= v26)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v17;
            }
            else
            {
              a1 = v10;
              v13 = v17;
              if (v24 != v25)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v17;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
        v12 = v15;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C25E2644(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, unint64_t, uint64_t);
  unint64_t v32;
  uint64_t v33;

  v4 = sub_1C25F2AFC();
  v33 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_1C25F5598();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v32 = (result + 1) & v11;
      v12 = *(_QWORD *)(v33 + 72);
      v31 = *(void (**)(char *, unint64_t, uint64_t))(v33 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12 * v10;
        v16 = v13;
        v31(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_1C254354C(&qword_1ED7B0B90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        v17 = sub_1C25F52F8();
        result = (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v7, v4);
        v13 = v16;
        v18 = v17 & v16;
        if (a1 >= (uint64_t)v32)
        {
          if (v18 >= v32 && a1 >= (uint64_t)v18)
          {
LABEL_16:
            v21 = v12 * a1;
            if (v12 * a1 < v15
              || *(_QWORD *)(a2 + 48) + v12 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v15 + v12))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v21 != v15)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            result = v22 + v21;
            if (v21 < v15 || result >= v22 + v15 + v12)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v8 = v14;
              v13 = v16;
            }
            else
            {
              a1 = v10;
              v23 = v21 == v15;
              v8 = v14;
              v13 = v16;
              if (!v23)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v16;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v18 >= v32 || a1 >= (uint64_t)v18)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v24 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v25 = *v24;
    v26 = (-1 << a1) - 1;
  }
  else
  {
    v24 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v26 = *v24;
    v25 = (-1 << a1) - 1;
  }
  *v24 = v26 & v25;
  v27 = *(_QWORD *)(a2 + 16);
  v28 = __OFSUB__(v27, 1);
  v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C25E2900(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1C25F5598();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1C25F5838();
        swift_bridgeObjectRetain();
        sub_1C25F534C();
        v10 = sub_1C25F5850();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = v15 + 24 * v3;
          v17 = (__int128 *)(v15 + 24 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= (unint64_t)v17 + 24))
          {
            v9 = *v17;
            *(_QWORD *)(v16 + 16) = *((_QWORD *)v17 + 2);
            *(_OWORD *)v16 = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C25E2AE8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1C25F5598();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1C25F5838();
        swift_bridgeObjectRetain();
        sub_1C25F534C();
        v9 = sub_1C25F5850();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1C25E2CBC(unint64_t result, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v4 = result;
  v5 = a2 + 64;
  v6 = -1 << *(_BYTE *)(a2 + 32);
  v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(_QWORD *)(a2 + 64 + 8 * (v7 >> 6))) != 0)
  {
    v9 = ~v6;
    result = sub_1C25F5598();
    if ((*(_QWORD *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      v10 = (result + 1) & v9;
      while (1)
      {
        sub_1C25F5838();
        swift_bridgeObjectRetain();
        sub_1C25F534C();
        v11 = sub_1C25F5850();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v9;
        if (v4 >= (uint64_t)v10)
          break;
        if (v12 < v10)
          goto LABEL_11;
LABEL_12:
        v13 = *(_QWORD *)(a2 + 48);
        v14 = (_OWORD *)(v13 + 16 * v4);
        v15 = (_OWORD *)(v13 + 16 * v7);
        if (v4 != v7 || v14 >= v15 + 1)
          *v14 = *v15;
        v16 = *(_QWORD *)(a2 + 56);
        v17 = *(_QWORD *)(*(_QWORD *)(a3(0) - 8) + 72);
        v18 = v17 * v4;
        result = v16 + v17 * v4;
        v19 = v17 * v7;
        v20 = v16 + v17 * v7 + v17;
        if (v18 < v19 || result >= v20)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v4 = v7;
          if (v18 == v19)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v4 = v7;
LABEL_6:
        v7 = (v7 + 1) & v9;
        if (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          goto LABEL_21;
      }
      if (v12 < v10)
        goto LABEL_6;
LABEL_11:
      if (v4 < (uint64_t)v12)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v22 = (uint64_t *)(v5 + 8 * ((unint64_t)v4 >> 6));
    v23 = *v22;
    v24 = (-1 << v4) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v5 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_1C25E2EC4(_OWORD *a1, uint64_t a2, char a3)
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
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_1C25F00A0(a2);
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
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        return sub_1C25524F8(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_1C25E4180();
      goto LABEL_7;
    }
    sub_1C25DF844(v13, a3 & 1);
    v19 = sub_1C25F00A0(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1C25E7170(a2, (uint64_t)v21);
      return sub_1C25E3E20(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E2FFC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1C25E35D0(a1, a2, a3, a4, (uint64_t *)&unk_1EF77CB38);
}

uint64_t sub_1C25E3008(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
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

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1C25F003C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
        return sub_1C25E674C((uint64_t)a1, v18[7] + 48 * v12);
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1C25E4364();
      goto LABEL_7;
    }
    sub_1C25DFB58(v15, a4 & 1);
    v20 = sub_1C25F003C(a2, a3);
    if ((v16 & 1) == (v21 & 1))
    {
      v12 = v20;
      v18 = *v5;
      if ((v16 & 1) != 0)
        return sub_1C25E674C((uint64_t)a1, v18[7] + 48 * v12);
LABEL_11:
      sub_1C25E3E98(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E3130(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_1C25F2AFC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_1C25F00D0(a2);
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
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = sub_1C25F3288();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_1C25E46F4();
      goto LABEL_7;
    }
    sub_1C25E019C(v17, a3 & 1);
    v24 = sub_1C25F00D0(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_1C25E3F04(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E32B8(uint64_t a1, uint64_t a2, char a3)
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
  uint64_t result;
  unint64_t v22;
  char v23;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = sub_1C25F2AFC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_1C25F00D0(a2);
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
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 40))(v20[7] + *(_QWORD *)(v9 + 72) * v14, a1, v8);
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_1C25E49D4();
      goto LABEL_7;
    }
    sub_1C25E0594(v17, a3 & 1);
    v22 = sub_1C25F00D0(a2);
    if ((v18 & 1) == (v23 & 1))
    {
      v14 = v22;
      v20 = *v4;
      if ((v18 & 1) != 0)
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v9 + 40))(v20[7] + *(_QWORD *)(v9 + 72) * v14, a1, v8);
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_1C25E3FBC(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E3434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
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
  _QWORD *v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v7 = v6;
  v14 = *v6;
  v16 = sub_1C25F003C(a4, a5);
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
    sub_1C25E4C30();
LABEL_7:
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = (_QWORD *)(v22[7] + 24 * v16);
      swift_release();
      result = swift_unknownObjectRelease();
      *v23 = a1;
      v23[1] = a2;
      v23[2] = a3;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 16 * v16);
    *v27 = a4;
    v27[1] = a5;
    v28 = (_QWORD *)(v22[7] + 24 * v16);
    *v28 = a1;
    v28[1] = a2;
    v28[2] = a3;
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
  sub_1C25E096C(v19, a6 & 1);
  v25 = sub_1C25F003C(a4, a5);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E35C4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_1C25E35D0(a1, a2, a3, a4, &qword_1EF77CAD8);
}

uint64_t sub_1C25E35D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
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
  v14 = sub_1C25F003C(a2, a3);
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
    sub_1C25E4E10(a5);
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
  sub_1C25E0C94(v17, a4 & 1, a5);
  v23 = sub_1C25F003C(a2, a3);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E3744(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(_QWORD), uint64_t *a6)
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
  v16 = sub_1C25F003C(a2, a3);
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
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v23 + *(_QWORD *)(*(_QWORD *)(v24 - 8) + 72) * v16, a1, v24);
      }
      goto LABEL_11;
    }
    if (v21 >= v19 && (a4 & 1) == 0)
    {
      sub_1C25E4FBC(a5, a6);
      goto LABEL_7;
    }
    sub_1C25E0FA4(v19, a4 & 1, a5, a6);
    v26 = sub_1C25F003C(a2, a3);
    if ((v20 & 1) == (v27 & 1))
    {
      v16 = v26;
      v22 = *v9;
      if ((v20 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1C25E4068(v16, a2, a3, a1, v22, a5);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E38A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1C25F003C(a2, a3);
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
    sub_1C25E5218();
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
  sub_1C25E1308(v15, a4 & 1);
  v21 = sub_1C25F003C(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E3A04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
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
  v14 = sub_1C25F003C(a3, a4);
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
    sub_1C25E53CC();
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
  sub_1C25E161C(v17, a5 & 1);
  v23 = sub_1C25F003C(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E3B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
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
  uint64_t *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1C25F003C(a3, a4);
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
    sub_1C25E5584();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (uint64_t *)(v20[7] + 16 * v14);
      result = sub_1C258D6F4(*v21);
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (uint64_t *)(v20[7] + 16 * v14);
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
  sub_1C25E1940(v17, a5 & 1);
  v23 = sub_1C25F003C(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

uint64_t sub_1C25E3CEC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1C25F003C(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7];
        v20 = v19
            + *(_QWORD *)(*(_QWORD *)(type metadata accessor for RootRequestController.TRPCache(0) - 8) + 72) * v12;
        return sub_1C25E6354(a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1C25E5748();
      goto LABEL_7;
    }
    sub_1C25E1C4C(v15, a4 & 1);
    v22 = sub_1C25F003C(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1C25E40F8(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1C25F57D8();
  __break(1u);
  return result;
}

_OWORD *sub_1C25E3E20(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_1C25524F8(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

_OWORD *sub_1C25E3E98(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1C2575934(a4, (_OWORD *)(a5[7] + 48 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_1C25E3F04(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1C25F2AFC();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = sub_1C25F3288();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

uint64_t sub_1C25E3FBC(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1C25F2AFC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 72) * a1;
  v12 = v8 + v11;
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32);
  v13(v12, a2, v9);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(a4[7] + v11, a3, v9);
  v15 = a4[2];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    a4[2] = v17;
  return result;
}

uint64_t sub_1C25E4068(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t (*a6)(_QWORD))
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v9 = (_QWORD *)(a5[6] + 16 * a1);
  *v9 = a2;
  v9[1] = a3;
  v10 = a5[7];
  v11 = a6(0);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a4, v11);
  v13 = a5[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a5[2] = v15;
  return result;
}

uint64_t sub_1C25E40F8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = type metadata accessor for RootRequestController.TRPCache(0);
  result = sub_1C25E62CC(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_1C25E4180()
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
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CA70);
  v2 = *v0;
  v3 = sub_1C25F56B8();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_1C25E7170(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1C25786D4(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1C25524F8(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1C25E4364()
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
  uint64_t *v25;
  __int128 v26[3];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB28);
  v2 = *v0;
  v3 = sub_1C25F56B8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
      goto LABEL_30;
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
    v20 = 48 * v15;
    sub_1C2575900(*(_QWORD *)(v2 + 56) + 48 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1C2575934(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
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
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C25E454C()
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
  __int128 v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB18);
  v2 = *v0;
  v3 = sub_1C25F56B8();
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v20;
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

char *sub_1C25E46F4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = sub_1C25F3288();
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_1C25F2AFC();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF77CAF8);
  v33 = v0;
  v3 = *v0;
  v4 = sub_1C25F56B8();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (char *)swift_release();
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (char *)(v4 + 64);
  v8 = (char *)(v3 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    result = (char *)memmove(result, v8, 8 * v9);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (char *)swift_release();
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_1C25E49D4()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void (*v20)(char *, unint64_t, uint64_t);
  void (*v21)(unint64_t, char *, uint64_t);
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;

  v1 = sub_1C25F2AFC();
  v2 = *(_QWORD **)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v25 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB08);
  v26 = v0;
  v8 = *v0;
  v9 = sub_1C25F56B8();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v26 = v10;
    return result;
  }
  result = (void *)(v9 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12)
    result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  v27 = v8 + 64;
  v13 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v14 = 1 << *(_BYTE *)(v8 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v8 + 64);
  v28 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v22 >= v28)
      goto LABEL_23;
    v23 = *(_QWORD *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v28)
        goto LABEL_23;
      v23 = *(_QWORD *)(v27 + 8 * v13);
      if (!v23)
        break;
    }
LABEL_22:
    v16 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_9:
    v19 = v2[9] * v18;
    v20 = (void (*)(char *, unint64_t, uint64_t))v2[2];
    v20(v7, *(_QWORD *)(v8 + 48) + v19, v1);
    v20(v5, *(_QWORD *)(v8 + 56) + v19, v1);
    v21 = (void (*)(unint64_t, char *, uint64_t))v2[4];
    v21(*(_QWORD *)(v10 + 48) + v19, v7, v1);
    result = (void *)((uint64_t (*)(unint64_t, char *, uint64_t))v21)(*(_QWORD *)(v10 + 56) + v19, v5, v1);
  }
  v24 = v22 + 2;
  if (v24 >= v28)
    goto LABEL_23;
  v23 = *(_QWORD *)(v27 + 8 * v24);
  if (v23)
  {
    v13 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v28)
      goto LABEL_23;
    v23 = *(_QWORD *)(v27 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_1C25E4C30()
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
  _QWORD *v23;
  __int128 v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B1640);
  v2 = *v0;
  v3 = sub_1C25F56B8();
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
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)(v21 + 16);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v24 = *(_OWORD *)v21;
    *v23 = v19;
    v23[1] = v18;
    v25 = *(_QWORD *)(v4 + 56) + v20;
    *(_OWORD *)v25 = v24;
    *(_QWORD *)(v25 + 16) = v22;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    result = (void *)swift_retain();
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

void *sub_1C25E4E10(uint64_t *a1)
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
  v4 = sub_1C25F56B8();
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

void *sub_1C25E4FBC(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;

  v37 = a1(0);
  v4 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78](v37);
  v6 = (char *)&v33 - v5;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v34 = v2;
  v7 = *v2;
  v8 = sub_1C25F56B8();
  v9 = *(_QWORD *)(v7 + 16);
  v38 = v8;
  if (!v9)
  {
    result = (void *)swift_release();
    v32 = v38;
    v31 = v34;
LABEL_28:
    *v31 = v32;
    return result;
  }
  v10 = v8;
  result = (void *)(v8 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v7 || (unint64_t)result >= v7 + 64 + 8 * v12)
  {
    result = memmove(result, (const void *)(v7 + 64), 8 * v12);
    v10 = v38;
  }
  v35 = v7 + 64;
  v14 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v7 + 16);
  v15 = 1 << *(_BYTE *)(v7 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(v7 + 64);
  v36 = (unint64_t)(v15 + 63) >> 6;
  v18 = v37;
  while (1)
  {
    if (v17)
    {
      v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_12;
    }
    v28 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v28 >= v36)
      goto LABEL_26;
    v29 = *(_QWORD *)(v35 + 8 * v28);
    ++v14;
    if (!v29)
    {
      v14 = v28 + 1;
      if (v28 + 1 >= v36)
        goto LABEL_26;
      v29 = *(_QWORD *)(v35 + 8 * v14);
      if (!v29)
        break;
    }
LABEL_25:
    v17 = (v29 - 1) & v29;
    v20 = __clz(__rbit64(v29)) + (v14 << 6);
LABEL_12:
    v21 = 16 * v20;
    v22 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
    v24 = *v22;
    v23 = v22[1];
    v25 = *(_QWORD *)(v4 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(_QWORD *)(v7 + 56) + v25, v18);
    v26 = v38;
    v27 = (_QWORD *)(*(_QWORD *)(v38 + 48) + v21);
    *v27 = v24;
    v27[1] = v23;
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(_QWORD *)(v26 + 56) + v25, v6, v18);
    result = (void *)swift_bridgeObjectRetain();
  }
  v30 = v28 + 2;
  if (v30 >= v36)
  {
LABEL_26:
    result = (void *)swift_release();
    v31 = v34;
    v32 = v38;
    goto LABEL_28;
  }
  v29 = *(_QWORD *)(v35 + 8 * v30);
  if (v29)
  {
    v14 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v14 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v14 >= v36)
      goto LABEL_26;
    v29 = *(_QWORD *)(v35 + 8 * v14);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_1C25E5218()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CAD0);
  v2 = *v0;
  v3 = sub_1C25F56B8();
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

void *sub_1C25E53CC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B1278);
  v2 = *v0;
  v3 = sub_1C25F56B8();
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

void *sub_1C25E5584()
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
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CAE0);
  v2 = *v0;
  v3 = sub_1C25F56B8();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v24 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    result = (void *)sub_1C258E9A4(v24);
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1C25E5748()
{
  uint64_t *v0;
  uint64_t *v1;
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
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v1 = v0;
  v2 = type metadata accessor for RootRequestController.TRPCache(0);
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0B60);
  v5 = *v0;
  v6 = sub_1C25F56B8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v7;
    return result;
  }
  v28 = v1;
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v29 = v5 + 64;
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
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v11;
    if (!v25)
    {
      v11 = v24 + 1;
      if (v24 + 1 >= v15)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v11);
      if (!v25)
        break;
    }
LABEL_25:
    v14 = (v25 - 1) & v25;
    v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v30 + 72) * v17;
    sub_1C25E6310(*(_QWORD *)(v5 + 56) + v22, (uint64_t)v4);
    v23 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v23 = v21;
    v23[1] = v20;
    sub_1C25E62CC((uint64_t)v4, *(_QWORD *)(v7 + 56) + v22);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v28;
    goto LABEL_28;
  }
  v25 = *(_QWORD *)(v29 + 8 * v26);
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
    v25 = *(_QWORD *)(v29 + 8 * v11);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C25E5974(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_QWORD *sub_1C25E59FC(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v6;
  id v7;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = *(void **)(*(_QWORD *)(a5 + 56) + 8 * a2);
    *result = v6;
    swift_bridgeObjectRetain();
    v7 = v6;
    return (_QWORD *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

void sub_1C25E5A8C(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_1C25E5ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a6)
    return 0;
  if (v9 == v7 && v8 == v6)
    return 1;
  return sub_1C25F57C0();
}

uint64_t sub_1C25E5C2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, unint64_t, uint64_t);
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v38;
  double v39;
  double v40;
  void (*v41)(char *, uint64_t);
  double v42;
  char *v43;
  NSObject *v44;

  v2 = sub_1C25F2C04();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v43 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CA40);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CA48);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C25C99F8(a1);
  if (v16 && (v17 = v15, swift_bridgeObjectRelease(), v17))
  {
    sub_1C25F4AC4();
    v18 = sub_1C25F2C1C();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v14, 1, v18) == 1)
    {
      sub_1C2540B58((uint64_t)v14, &qword_1EF77CA48);
      if (qword_1ED7B0498 != -1)
        swift_once();
      v20 = sub_1C25F513C();
      __swift_project_value_buffer(v20, (uint64_t)qword_1ED7B17B0);
      v21 = sub_1C25F5130();
      v22 = sub_1C25F5484();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1C2539000, v21, v22, "Empty LVC prediction", v23, 2u);
        MEMORY[0x1C3BC3720](v23, -1, -1);
      }

      return 0;
    }
    v44 = v17;
    v28 = sub_1C25F2C10();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v18);
    v29 = *(_QWORD *)(v28 + 16);
    if (!v29)
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v11, 1, 1, v2);
      goto LABEL_16;
    }
    v43 = v11;
    v30 = v28 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v31 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
    v31(v8, v30, v2);
    swift_bridgeObjectRetain();
    if (v29 == 1)
    {
LABEL_14:
      swift_bridgeObjectRelease();
      v11 = v43;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v43, v8, v2);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v11, 0, 1, v2);
LABEL_16:
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) != 1)
      {
        v36 = sub_1C25F2BEC();

        (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
        return v36;
      }
      sub_1C2540B58((uint64_t)v11, &qword_1EF77CA40);
      v25 = v44;
      if (qword_1ED7B0498 != -1)
        swift_once();
      v32 = sub_1C25F513C();
      __swift_project_value_buffer(v32, (uint64_t)qword_1ED7B17B0);
      v33 = sub_1C25F5130();
      v34 = sub_1C25F5484();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1C2539000, v33, v34, "No predicted language found in LVC output", v35, 2u);
        MEMORY[0x1C3BC3720](v35, -1, -1);
      }

      goto LABEL_22;
    }
    v38 = 1;
    while (v38 < *(_QWORD *)(v28 + 16))
    {
      v31(v6, v30 + *(_QWORD *)(v3 + 72) * v38, v2);
      sub_1C25F2BF8();
      v40 = v39;
      sub_1C25F2BF8();
      v41 = *(void (**)(char *, uint64_t))(v3 + 8);
      if (v40 >= v42)
      {
        v41(v6, v2);
      }
      else
      {
        v41(v8, v2);
        (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v6, v2);
      }
      if (v29 == ++v38)
        goto LABEL_14;
    }
    __break(1u);
  }
  else if (qword_1ED7B0498 == -1)
  {
    goto LABEL_10;
  }
  swift_once();
LABEL_10:
  v24 = sub_1C25F513C();
  __swift_project_value_buffer(v24, (uint64_t)qword_1ED7B17B0);
  v25 = sub_1C25F5130();
  v26 = sub_1C25F5484();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_1C2539000, v25, v26, "tcuMappedNLResponse is empty", v27, 2u);
    MEMORY[0x1C3BC3720](v27, -1, -1);
  }
LABEL_22:

  return 0;
}

uint64_t sub_1C25E6154()
{
  unint64_t v0;

  v0 = sub_1C25F56E8();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_1C25E619C(uint64_t a1)
{
  uint64_t v1;

  return sub_1C25DCAB8(a1, *(_QWORD *)(v1 + 16));
}

void sub_1C25E61AC()
{
  uint64_t v0;

  sub_1C25DCC58(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1C25E61B4(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C25DC3AC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C25E61C0(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C25DC200(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C25E61CC(uint64_t a1)
{
  return sub_1C25BB030(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1C25DB62C);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1C25E6208()
{
  uint64_t v0;

  sub_1C25DB7EC(*(_QWORD *)(v0 + 16));
}

uint64_t type metadata accessor for RootRequestController.TRPCache(uint64_t a1)
{
  return sub_1C254B8CC(a1, qword_1ED7B0A08);
}

uint64_t sub_1C25E6224(uint64_t a1)
{
  uint64_t v1;

  return sub_1C25D9ED8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(char **)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_BYTE *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104));
}

void sub_1C25E6268(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_1C25E6278()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1C25E62B4()
{
  uint64_t v0;

  sub_1C25DAF5C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1C25E62CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RootRequestController.TRPCache(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C25E6310(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RootRequestController.TRPCache(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C25E6354(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RootRequestController.TRPCache(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1C25E639C()
{
  sub_1C25E6470(0xD00000000000001DLL, 0x80000001C25FB990);
}

unint64_t sub_1C25E63B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF77CA58;
  if (!qword_1EF77CA58)
  {
    v1 = sub_1C253CC30(255, &qword_1EF77CA50);
    result = MEMORY[0x1C3BC3648](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EF77CA58);
  }
  return result;
}

uint64_t sub_1C25E6410()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C25E6444(uint64_t a1)
{
  return sub_1C25BB030(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1C25D96B4);
}

void sub_1C25E6454()
{
  sub_1C25E6470(0xD00000000000001BLL, 0x80000001C25FB970);
}

void sub_1C25E6470(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1C25DE960(v2[2], v2[3], v2[4], v2[5], v2[6], a1, a2);
}

uint64_t objectdestroy_52Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C25E64DC()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1C25E6518()
{
  uint64_t v0;

  sub_1C25D9A94(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1C25E6528(uint64_t a1)
{
  uint64_t v1;

  return sub_1C25D7BCC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1C25E6534(uint64_t a1)
{
  return sub_1C25BB030(a1, sub_1C25D7688);
}

uint64_t sub_1C25E6540(uint64_t a1)
{
  return sub_1C25BB030(a1, sub_1C25D6AF0);
}

uint64_t sub_1C25E654C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1C25E6570(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_1C25D3628(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_1C25E6590(uint64_t a1)
{
  uint64_t v1;

  return sub_1C25D2AC0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_1C25E6598()
{
  uint64_t v0;

  sub_1C25CD00C(v0, 0xD00000000000001BLL, 0x80000001C25FB910);
}

uint64_t sub_1C25E65CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1C2540FD4;
  return sub_1C2578FEC(a1, v4, v5, v1 + 32);
}

uint64_t sub_1C25E6638(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B0980);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_92Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_1C25E66B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1C25403F4;
  return sub_1C2578FEC(a1, v4, v5, v1 + 32);
}

void sub_1C25E671C()
{
  uint64_t v0;

  sub_1C25CD00C(v0, 0xD00000000000001FLL, 0x80000001C25FB950);
}

uint64_t sub_1C25E674C(uint64_t a1, uint64_t a2)
{
  assignWithTake for IntelligenceFlowBridgeRequestProcessor.InputCandidate(a2, a1);
  return a2;
}

id sub_1C25E678C(id result, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
      result = (id)swift_bridgeObjectRetain();
      break;
    case 2:
      result = result;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for RootRequestControllerErrors(uint64_t a1)
{
  sub_1C25E67D4(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_1C25E67D4(void *a1, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 3:
      swift_bridgeObjectRelease();
      break;
    case 2:

      break;
    default:
      return;
  }
}

uint64_t _s24RequestDispatcherBridges27RootRequestControllerErrorsOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1C25E678C(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for RootRequestControllerErrors(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1C25E678C(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1C25E67D4(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for RootRequestControllerErrors(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1C25E67D4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for RootRequestControllerErrors(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RootRequestControllerErrors(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1C25E6978(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_1C25E6990(uint64_t result, unsigned int a2)
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

ValueMetadata *type metadata accessor for RootRequestControllerErrors()
{
  return &type metadata for RootRequestControllerErrors;
}

char *sub_1C25E69B8(char *a1, char **a2, uint64_t a3)
{
  char *v3;
  int v4;
  char *v5;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  char *v16;
  char *v17;
  uint64_t v18;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(_QWORD *)a1 = v5;
    v3 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    v8 = a2[1];
    v9 = a2[2];
    *(_QWORD *)a1 = v5;
    *((_QWORD *)a1 + 1) = v8;
    *((_QWORD *)a1 + 2) = v9;
    v10 = *(int *)(a3 + 24);
    v11 = &a1[v10];
    v12 = (char *)a2 + v10;
    v13 = sub_1C25F3A14();
    v14 = *(_QWORD *)(v13 - 8);
    v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
    v16 = v5;
    v17 = v9;
    if (v15(v12, 1, v13))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0970);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
    v3[*(int *)(a3 + 28)] = *((_BYTE *)a2 + *(int *)(a3 + 28));
  }
  return v3;
}

uint64_t sub_1C25E6AD4(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = (char *)a1 + *(int *)(a2 + 24);
  v5 = sub_1C25F3A14();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_1C25E6B58(uint64_t a1, __int128 *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  id v13;
  id v14;
  uint64_t v15;
  __int128 v17;

  v17 = *a2;
  *(_OWORD *)a1 = *a2;
  v6 = (void *)*((_QWORD *)a2 + 2);
  *(_QWORD *)(a1 + 16) = v6;
  v7 = *(int *)(a3 + 24);
  v8 = (void *)(a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = sub_1C25F3A14();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
  v13 = (id)v17;
  v14 = v6;
  if (v12(v9, 1, v10))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0970);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 28)) = *((_BYTE *)a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_1C25E6C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v9 = v6;

  *(_QWORD *)(a1 + 8) = v7;
  v10 = *(void **)(a1 + 16);
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11;

  v13 = *(int *)(a3 + 24);
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = sub_1C25F3A14();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (!v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 24))(v14, v15, v16);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0970);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 16))(v14, v15, v16);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
LABEL_7:
  *(_BYTE *)(a1 + *(int *)(a3 + 28)) = *(_BYTE *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_1C25E6DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_1C25F3A14();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0970);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 28)) = *(_BYTE *)(a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_1C25E6E84(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  v6 = a2[1];
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v8 = *(void **)(a1 + 16);
  v9 = a2[2];
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v9;

  v10 = *(int *)(a3 + 24);
  v11 = (void *)(a1 + v10);
  v12 = (char *)a2 + v10;
  v13 = sub_1C25F3A14();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0970);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(_BYTE *)(a1 + *(int *)(a3 + 28)) = *((_BYTE *)a2 + *(int *)(a3 + 28));
  return a1;
}

uint64_t sub_1C25E6FC0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C25E6FCC(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0970);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v9);
  }
}

uint64_t sub_1C25E7058()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1C25E7064(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0970);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

void sub_1C25E70DC()
{
  unint64_t v0;

  sub_1C257546C(319, &qword_1ED7B0978, (void (*)(uint64_t))MEMORY[0x1E0D9D110]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_1C25E7170(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1C25E71B8()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  unint64_t v47;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (!v1)
  {
    objc_opt_self();
    v16 = swift_dynamicCastObjCClass();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = v0;
      v19 = objc_msgSend(v17, sel_listenAfterSpeaking);
      if (v19)
        goto LABEL_18;
    }
    else
    {
      objc_opt_self();
      v22 = swift_dynamicCastObjCClass();
      if (!v22)
      {
        objc_opt_self();
        v24 = swift_dynamicCastObjCClass();
        if (!v24)
          return 0;
        v25 = (void *)v24;
        v26 = v0;
        v27 = objc_msgSend(v25, sel_callbacks);
        if (v27)
        {
          v28 = v27;
          sub_1C253CC30(0, &qword_1EF77CB48);
          v29 = sub_1C25F5394();

        }
        else
        {
          v29 = MEMORY[0x1E0DEE9D8];
        }
        if (v29 >> 62)
          goto LABEL_67;
        v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v30)
        {
LABEL_37:
          v31 = 0;
          v45 = v29;
          v47 = v29 & 0xC000000000000001;
          v42 = v26;
          v43 = v29 + 32;
          v26 = (id)0x1E0D87000;
          v44 = v30;
          while (1)
          {
            if (v47)
              v32 = (id)MEMORY[0x1C3BC2EF8](v31, v29);
            else
              v32 = *(id *)(v43 + 8 * v31);
            v33 = v32;
            if (__OFADD__(v31++, 1))
              goto LABEL_66;
            v35 = objc_msgSend(v32, sel_commands);
            if (v35)
            {
              v36 = v35;
              __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B02C0);
              v37 = sub_1C25F5394();

            }
            else
            {
              v37 = MEMORY[0x1E0DEE9D8];
            }
            if (v37 >> 62)
            {
              swift_bridgeObjectRetain_n();
              v38 = sub_1C25F56A0();
              swift_bridgeObjectRelease();
              if (v38)
              {
LABEL_48:
                v39 = 4;
                v40 = 0;
                if ((v37 & 0xC000000000000001) != 0)
                {
LABEL_49:
                  MEMORY[0x1C3BC2EF8](v40, v37);
                  v29 = v40 + 1;
                  if (__OFADD__(v40, 1))
                    goto LABEL_65;
                  goto LABEL_53;
                }
                while (1)
                {
                  swift_unknownObjectRetain();
                  v29 = v40 + 1;
                  if (__OFADD__(v40, 1))
                    break;
LABEL_53:
                  objc_opt_self();
                  if (swift_dynamicCastObjCClass())
                  {
                    v41 = sub_1C25E71B8();
                    swift_unknownObjectRelease();
                    if ((v41 & 1) != 0)
                    {

                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      v7 = 1;
                      goto LABEL_70;
                    }
                    if (v29 == v38)
                      goto LABEL_38;
                  }
                  else
                  {
                    swift_unknownObjectRelease();
                    if (v29 == v38)
                      goto LABEL_38;
                  }
                  v40 = ++v39 - 4;
                  if ((v37 & 0xC000000000000001) != 0)
                    goto LABEL_49;
                }
LABEL_65:
                __break(1u);
LABEL_66:
                __break(1u);
LABEL_67:
                swift_bridgeObjectRetain();
                v30 = sub_1C25F56A0();
                if (!v30)
                  break;
                goto LABEL_37;
              }
            }
            else
            {
              v38 = *(_QWORD *)((v37 & 0xFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (v38)
                goto LABEL_48;
            }
LABEL_38:
            swift_bridgeObjectRelease_n();

            v29 = v45;
            if (v31 == v44)
              goto LABEL_64;
          }
        }

        goto LABEL_69;
      }
      v23 = (void *)v22;
      v18 = v0;
      v19 = objc_msgSend(v23, sel_listenAfterSpeaking);
      if (v19)
      {
LABEL_18:
        v20 = v19;
        v7 = (uint64_t)objc_msgSend(v19, sel_BOOLValue);

        return v7;
      }
    }

    return 0;
  }
  v2 = (void *)v1;
  v3 = v0;
  v4 = objc_msgSend(v2, sel_views);
  if (v4)
  {
    v5 = v4;
    sub_1C253CC30(0, (unint64_t *)&unk_1ED7B02E0);
    v6 = sub_1C25F5394();

    if (!(v6 >> 62))
      goto LABEL_4;
LABEL_21:
    swift_bridgeObjectRetain();
    v7 = sub_1C25F56A0();
    if (v7)
      goto LABEL_5;
LABEL_25:

    swift_bridgeObjectRelease_n();
    return v7;
  }
  v6 = MEMORY[0x1E0DEE9D8];
  if (MEMORY[0x1E0DEE9D8] >> 62)
    goto LABEL_21;
LABEL_4:
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v7)
    goto LABEL_25;
LABEL_5:
  v46 = v3;
  v8 = 4;
  v9 = 0;
  if ((v6 & 0xC000000000000001) == 0)
    goto LABEL_7;
LABEL_6:
  for (i = (id)MEMORY[0x1C3BC2EF8](v9, v6); ; i = *(id *)(v6 + 8 * v8))
  {
    v11 = i;
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
      break;
    v13 = objc_msgSend(i, sel_listenAfterSpeaking);
    if (v13)
    {
      v14 = v13;
      v15 = objc_msgSend(v13, sel_BOOLValue);

      if ((v15 & 1) != 0)
      {
        v7 = 1;
        goto LABEL_24;
      }
      if (v12 == v7)
        goto LABEL_19;
    }
    else
    {

      if (v12 == v7)
      {
LABEL_19:
        v7 = 0;
LABEL_24:
        v3 = v46;
        goto LABEL_25;
      }
    }
    v9 = ++v8 - 4;
    if ((v6 & 0xC000000000000001) != 0)
      goto LABEL_6;
LABEL_7:
    ;
  }
  __break(1u);
LABEL_64:

LABEL_69:
  v7 = 0;
LABEL_70:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

id sub_1C25E7700()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  id result;
  void *v21;
  id v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;

  objc_opt_self();
  v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = v0;
    v4 = objc_msgSend(v2, sel_dialogPhase);
    if (v4)
    {
      v5 = v4;
      v6 = sub_1C25F5334();
      v8 = v7;

      v9 = sub_1C25F5334();
      if (v8)
      {
        if (v6 == v9 && v8 == v10)
          LOBYTE(v12) = 1;
        else
          LOBYTE(v12) = sub_1C25F57C0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return (id)(v12 & 1);
      }
    }
    else
    {
      sub_1C25F5334();
    }
    swift_bridgeObjectRelease();

LABEL_39:
    LOBYTE(v12) = 0;
    return (id)(v12 & 1);
  }
  objc_opt_self();
  v13 = swift_dynamicCastObjCClass();
  if (!v13)
    goto LABEL_39;
  v14 = (void *)v13;
  v15 = v0;
  v16 = objc_msgSend(v14, sel_callbacks);
  if (v16)
  {
    v17 = v16;
    sub_1C253CC30(0, &qword_1EF77CB48);
    v18 = sub_1C25F5394();

    if (!(v18 >> 62))
      goto LABEL_12;
LABEL_44:
    swift_bridgeObjectRetain();
    v12 = sub_1C25F56A0();
    if (v12)
      goto LABEL_13;
LABEL_45:

LABEL_46:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)(v12 & 1);
  }
  v18 = MEMORY[0x1E0DEE9D8];
  if (MEMORY[0x1E0DEE9D8] >> 62)
    goto LABEL_44;
LABEL_12:
  v12 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v12)
    goto LABEL_45;
LABEL_13:
  v19 = 0;
  v33 = v18;
  v34 = v18 & 0xC000000000000001;
  v31 = v18 + 32;
  v32 = v12;
  while (1)
  {
    result = v34 ? (id)MEMORY[0x1C3BC2EF8](v19, v33) : *(id *)(v31 + 8 * v19);
    v21 = result;
    if (__OFADD__(v19++, 1))
      break;
    v23 = objc_msgSend(result, sel_commands);
    if (v23)
    {
      v24 = v23;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B02C0);
      v25 = sub_1C25F5394();

      if (!(v25 >> 62))
        goto LABEL_21;
    }
    else
    {
      v25 = MEMORY[0x1E0DEE9D8];
      if (!(MEMORY[0x1E0DEE9D8] >> 62))
      {
LABEL_21:
        v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v26)
          goto LABEL_22;
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRetain_n();
    v26 = sub_1C25F56A0();
    swift_bridgeObjectRelease();
    if (v26)
    {
LABEL_22:
      v27 = 4;
      v28 = 0;
      if ((v25 & 0xC000000000000001) != 0)
      {
LABEL_23:
        result = (id)MEMORY[0x1C3BC2EF8](v28, v25);
        v29 = v28 + 1;
        if (!__OFADD__(v28, 1))
          goto LABEL_27;
      }
      else
      {
        while (1)
        {
          result = (id)swift_unknownObjectRetain();
          v29 = v28 + 1;
          if (__OFADD__(v28, 1))
            break;
LABEL_27:
          objc_opt_self();
          if (swift_dynamicCastObjCClass())
          {
            v30 = sub_1C25E7700();
            swift_unknownObjectRelease();
            if ((v30 & 1) != 0)
            {

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              LOBYTE(v12) = 1;
              goto LABEL_46;
            }
            if (v29 == v26)
              goto LABEL_14;
          }
          else
          {
            swift_unknownObjectRelease();
            if (v29 == v26)
              goto LABEL_14;
          }
          v28 = ++v27 - 4;
          if ((v25 & 0xC000000000000001) != 0)
            goto LABEL_23;
        }
      }
      __break(1u);
      break;
    }
LABEL_14:
    swift_bridgeObjectRelease_n();

    if (v19 == v32)
    {

      LOBYTE(v12) = 0;
      goto LABEL_46;
    }
  }
  __break(1u);
  return result;
}

void sub_1C25E7AEC(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  __int128 v8;
  __int128 v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18[3];
  __int128 v19;
  __int128 v20;
  void *v21;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v3 = v1;
    sub_1C25E7CA0(v18);
LABEL_5:
    v4 = v18[0];
    v5 = v18[1];
    v6 = (void *)v18[2];
    v16 = v20;
    v17 = v19;
    v7 = v21;

    v9 = v16;
    v8 = v17;
    goto LABEL_6;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v3 = v1;
    sub_1C25E8B38((uint64_t)v18);
    goto LABEL_5;
  }
  objc_opt_self();
  v6 = (void *)swift_dynamicCastObjCClass();
  v8 = 0uLL;
  if (v6)
  {
    v10 = v1;
    v11 = objc_msgSend(v6, sel_message);
    if (v11)
    {
      v12 = v11;
      v4 = sub_1C25F5334();
      v5 = v13;

    }
    else
    {
      v4 = 0;
      v5 = 0;
    }
    v7 = objc_msgSend(v6, sel_message);
    if (v7)
    {
      v6 = (void *)sub_1C25F5334();
      v15 = v14;

      v7 = 0;
      v9 = 0uLL;
      v8 = v15;
    }
    else
    {

      v6 = 0;
      v9 = 0uLL;
      v8 = 0uLL;
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v7 = 0;
    v9 = 0uLL;
  }
LABEL_6:
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 24) = v8;
  *(_OWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 56) = v7;
}

void sub_1C25E7CA0(unint64_t *a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  id v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  id v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  id v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v86;
  unint64_t v87;
  _QWORD *v88;
  _QWORD *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  _QWORD *v93;
  _QWORD *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  unint64_t v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  _QWORD *v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  unint64_t v155;
  unint64_t v156;
  unint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unint64_t *v161;
  uint64_t v162;
  unint64_t v163;
  uint64_t v164;
  unint64_t v165;
  unint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  _QWORD *v170;
  unint64_t v171;
  uint64_t v172;
  unint64_t v173;
  _QWORD *v174;
  _QWORD *v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;

  v3 = sub_1C25F2844();
  v4 = *(_QWORD *)(v3 - 8);
  v176 = v3;
  v177 = v4;
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v164 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(v1, sel_views);
  if (!v7)
  {
LABEL_153:
    __break(1u);
    return;
  }
  v8 = v7;
  sub_1C253CC30(0, (unint64_t *)&unk_1ED7B02E0);
  v9 = sub_1C25F5394();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1C25F56A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v166 = a1;
  if (v10)
  {
    if (v10 >= 1)
    {
      v11 = 0;
      v171 = v9 & 0xC000000000000001;
      v12 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v170 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v174 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v175 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = v176;
      v172 = v10;
      v173 = v9;
      while (1)
      {
        if (v171)
          v14 = (id)MEMORY[0x1C3BC2EF8](v11, v9);
        else
          v14 = *(id *)(v9 + 8 * v11 + 32);
        v15 = v14;
        objc_opt_self();
        v16 = swift_dynamicCastObjCClass();
        if (v16)
        {
          v17 = (id)v16;
          v18 = v15;
          goto LABEL_12;
        }
        objc_opt_self();
        v29 = (void *)swift_dynamicCastObjCClass();
        if (v29)
        {
          v30 = objc_msgSend(v29, sel_utteranceView);
          if (v30)
            break;
        }
        objc_opt_self();
        v31 = swift_dynamicCastObjCClass();
        if (v31)
        {
          v32 = (void *)v31;
          v17 = v15;
          v33 = objc_msgSend(v32, sel_dialog);
          if (v33)
          {
            v34 = v33;
            v35 = objc_msgSend(v33, sel_content);
            if (!v35)
              goto LABEL_75;
            v36 = v35;
            sub_1C25E8FD4((uint64_t)&v178);
            v37 = v179;
            v165 = v178;
            v38 = v180;
            v167 = v182;
            v168 = v181;

            swift_bridgeObjectRetain();
            if (v37)
            {
              v164 = v38;
              v39 = v12;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v175 = sub_1C25EF9D8(0, v175[2] + 1, 1, v175);
              v41 = v175[2];
              v40 = v175[3];
              if (v41 >= v40 >> 1)
                v175 = sub_1C25EF9D8((_QWORD *)(v40 > 1), v41 + 1, 1, v175);
              v42 = v175;
              v175[2] = v41 + 1;
              v43 = &v42[2 * v41];
              v43[4] = v165;
              v43[5] = v37;
              v12 = v39;
              v38 = v164;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v44 = v168;
            if (!v168)
            {
LABEL_75:

              v15 = v34;
              goto LABEL_72;
            }
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v174 = sub_1C25EF9D8(0, v174[2] + 1, 1, v174);
            v46 = v174[2];
            v45 = v174[3];
            if (v46 >= v45 >> 1)
              v174 = sub_1C25EF9D8((_QWORD *)(v45 > 1), v46 + 1, 1, v174);
            v47 = v174;
            v174[2] = v46 + 1;
            v48 = &v47[2 * v46];
            v48[4] = v38;
            v48[5] = v44;

            goto LABEL_71;
          }

        }
        v79 = objc_msgSend(v15, sel_dialog);
        if (!v79)
        {
          v78 = v172;
          v9 = v173;
          goto LABEL_73;
        }
        v80 = v79;
        v81 = objc_msgSend(v79, sel_content);
        if (!v81)
          goto LABEL_91;
        v82 = v81;
        sub_1C25E8FD4((uint64_t)&v178);
        v83 = v179;
        v165 = v178;
        v84 = v181;
        v167 = v180;
        v168 = v182;

        swift_bridgeObjectRetain();
        if (v83)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v169 = v12;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            v175 = sub_1C25EF9D8(0, v175[2] + 1, 1, v175);
          v87 = v175[2];
          v86 = v175[3];
          if (v87 >= v86 >> 1)
            v175 = sub_1C25EF9D8((_QWORD *)(v86 > 1), v87 + 1, 1, v175);
          v88 = v175;
          v175[2] = v87 + 1;
          v89 = &v88[2 * v87];
          v89[4] = v165;
          v89[5] = v83;
          v12 = v169;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v84)
        {
          v90 = v84;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v174 = sub_1C25EF9D8(0, v174[2] + 1, 1, v174);
          v92 = v174[2];
          v91 = v174[3];
          if (v92 >= v91 >> 1)
            v174 = sub_1C25EF9D8((_QWORD *)(v91 > 1), v92 + 1, 1, v174);
          v93 = v174;
          v174[2] = v92 + 1;
          v94 = &v93[2 * v92];
          v94[4] = v167;
          v94[5] = v90;
          v17 = v80;
        }
        else
        {
LABEL_91:
          v17 = v15;
          v15 = v80;
        }
LABEL_72:
        v78 = v172;
        v9 = v173;

LABEL_73:
        ++v11;

        if (v78 == v11)
          goto LABEL_94;
      }
      v17 = v30;
LABEL_12:
      v19 = objc_msgSend(v17, sel_text);
      if (v19)
      {
        v20 = v19;
        v21 = sub_1C25F5334();
        v23 = v22;

        v24 = HIBYTE(v23) & 0xF;
        if ((v23 & 0x2000000000000000) == 0)
          v24 = v21 & 0xFFFFFFFFFFFFLL;
        if (v24)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v175 = sub_1C25EF9D8(0, v175[2] + 1, 1, v175);
          v26 = v175[2];
          v25 = v175[3];
          if (v26 >= v25 >> 1)
            v175 = sub_1C25EF9D8((_QWORD *)(v25 > 1), v26 + 1, 1, v175);
          v27 = v175;
          v175[2] = v26 + 1;
          v28 = &v27[2 * v26];
          v28[4] = v21;
          v28[5] = v23;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
      v49 = objc_msgSend(v17, sel_speakableText);
      if (v49)
      {
        v50 = v49;
        v51 = sub_1C25F5334();
        v53 = v52;

        v54 = HIBYTE(v53) & 0xF;
        if ((v53 & 0x2000000000000000) == 0)
          v54 = v51 & 0xFFFFFFFFFFFFLL;
        if (v54)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v174 = sub_1C25EF9D8(0, v174[2] + 1, 1, v174);
          v56 = v174[2];
          v55 = v174[3];
          if (v56 >= v55 >> 1)
            v174 = sub_1C25EF9D8((_QWORD *)(v55 > 1), v56 + 1, 1, v174);
          v57 = v174;
          v174[2] = v56 + 1;
          v58 = &v57[2 * v56];
          v58[4] = v51;
          v58[5] = v53;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
      v59 = objc_msgSend(v17, sel_redactedText);
      if (v59)
      {
        v60 = v59;
        v61 = sub_1C25F5334();
        v63 = v62;

        v64 = HIBYTE(v63) & 0xF;
        if ((v63 & 0x2000000000000000) == 0)
          v64 = v61 & 0xFFFFFFFFFFFFLL;
        if (v64)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v170 = sub_1C25EF9D8(0, v170[2] + 1, 1, v170);
          v66 = v170[2];
          v65 = v170[3];
          if (v66 >= v65 >> 1)
            v170 = sub_1C25EF9D8((_QWORD *)(v65 > 1), v66 + 1, 1, v170);
          v67 = v170;
          v170[2] = v66 + 1;
          v68 = &v67[2 * v66];
          v68[4] = v61;
          v68[5] = v63;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }
      v69 = objc_msgSend(v17, sel_redactedSpeakableText);
      if (v69)
      {
        v70 = v69;
        v71 = sub_1C25F5334();
        v73 = v72;

        v74 = HIBYTE(v73) & 0xF;
        if ((v73 & 0x2000000000000000) == 0)
          v74 = v71 & 0xFFFFFFFFFFFFLL;
        if (v74)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v12 = sub_1C25EF9D8(0, v12[2] + 1, 1, v12);
          v76 = v12[2];
          v75 = v12[3];
          if (v76 >= v75 >> 1)
            v12 = sub_1C25EF9D8((_QWORD *)(v75 > 1), v76 + 1, 1, v12);
          v12[2] = v76 + 1;
          v77 = &v12[2 * v76];
          v77[4] = v71;
          v77[5] = v73;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
      }

LABEL_71:
      v15 = v17;
      goto LABEL_72;
    }
    __break(1u);
    goto LABEL_153;
  }
  v12 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v170 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v174 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v175 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v13 = v176;
LABEL_94:
  swift_bridgeObjectRelease();
  v95 = MEMORY[0x1E0DEE9D8];
  v183 = MEMORY[0x1E0DEE9D8];
  v96 = v175[2];
  v169 = v12;
  if (v96)
  {
    v97 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      v99 = *(v97 - 1);
      v98 = *v97;
      v178 = v99;
      v179 = v98;
      swift_bridgeObjectRetain();
      sub_1C25F2838();
      sub_1C257F81C();
      v100 = sub_1C25F5550();
      v102 = v101;
      (*(void (**)(char *, uint64_t))(v177 + 8))(v6, v13);
      swift_bridgeObjectRelease();
      v103 = HIBYTE(v102) & 0xF;
      if ((v102 & 0x2000000000000000) == 0)
        v103 = v100 & 0xFFFFFFFFFFFFLL;
      if (v103)
      {
        v104 = v183;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C25C34F8(0, *(_QWORD *)(v104 + 16) + 1, 1);
          v104 = v183;
        }
        v106 = *(_QWORD *)(v104 + 16);
        v105 = *(_QWORD *)(v104 + 24);
        if (v106 >= v105 >> 1)
        {
          sub_1C25C34F8(v105 > 1, v106 + 1, 1);
          v104 = v183;
        }
        *(_QWORD *)(v104 + 16) = v106 + 1;
        v107 = v104 + 16 * v106;
        *(_QWORD *)(v107 + 32) = v99;
        *(_QWORD *)(v107 + 40) = v98;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v97 += 2;
      --v96;
    }
    while (v96);
    swift_bridgeObjectRelease();
    v108 = v183;
    v95 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v108 = MEMORY[0x1E0DEE9D8];
  }
  v178 = v108;
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0290);
  v173 = sub_1C25C3514();
  v171 = sub_1C25F5304();
  v168 = v110;
  swift_release();
  v183 = v95;
  v111 = v95;
  v112 = v174[2];
  v172 = v109;
  if (v112)
  {
    v113 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      v114 = *(v113 - 1);
      v115 = *v113;
      v178 = v114;
      v179 = v115;
      swift_bridgeObjectRetain();
      sub_1C25F2838();
      sub_1C257F81C();
      v116 = sub_1C25F5550();
      v118 = v117;
      (*(void (**)(char *, uint64_t))(v177 + 8))(v6, v13);
      swift_bridgeObjectRelease();
      v119 = HIBYTE(v118) & 0xF;
      if ((v118 & 0x2000000000000000) == 0)
        v119 = v116 & 0xFFFFFFFFFFFFLL;
      if (v119)
      {
        v120 = v183;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C25C34F8(0, *(_QWORD *)(v120 + 16) + 1, 1);
          v120 = v183;
        }
        v122 = *(_QWORD *)(v120 + 16);
        v121 = *(_QWORD *)(v120 + 24);
        if (v122 >= v121 >> 1)
        {
          sub_1C25C34F8(v121 > 1, v122 + 1, 1);
          v120 = v183;
        }
        *(_QWORD *)(v120 + 16) = v122 + 1;
        v123 = v120 + 16 * v122;
        *(_QWORD *)(v123 + 32) = v114;
        *(_QWORD *)(v123 + 40) = v115;
        v13 = v176;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v113 += 2;
      --v112;
    }
    while (v112);
    swift_bridgeObjectRelease();
    v124 = v183;
    v125 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v124 = v111;
    v125 = v111;
  }
  v178 = v124;
  v167 = sub_1C25F5304();
  v165 = v126;
  swift_release();
  v183 = v125;
  v127 = v125;
  v128 = v175[2];
  if (v128)
  {
    v129 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      v130 = *(v129 - 1);
      v131 = *v129;
      v178 = v130;
      v179 = v131;
      swift_bridgeObjectRetain();
      sub_1C25F2838();
      sub_1C257F81C();
      v132 = sub_1C25F5550();
      v134 = v133;
      (*(void (**)(char *, uint64_t))(v177 + 8))(v6, v13);
      swift_bridgeObjectRelease();
      v135 = HIBYTE(v134) & 0xF;
      if ((v134 & 0x2000000000000000) == 0)
        v135 = v132 & 0xFFFFFFFFFFFFLL;
      if (v135)
      {
        v136 = v183;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C25C34F8(0, *(_QWORD *)(v136 + 16) + 1, 1);
          v136 = v183;
        }
        v138 = *(_QWORD *)(v136 + 16);
        v137 = *(_QWORD *)(v136 + 24);
        if (v138 >= v137 >> 1)
        {
          sub_1C25C34F8(v137 > 1, v138 + 1, 1);
          v136 = v183;
        }
        *(_QWORD *)(v136 + 16) = v138 + 1;
        v139 = v136 + 16 * v138;
        *(_QWORD *)(v139 + 32) = v130;
        *(_QWORD *)(v139 + 40) = v131;
        v13 = v176;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v129 += 2;
      --v128;
    }
    while (v128);
    swift_bridgeObjectRelease();
    v140 = v183;
    v141 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v140 = v127;
    v141 = v127;
  }
  v178 = v140;
  v142 = sub_1C25F5304();
  v144 = v143;
  swift_release();
  v183 = v141;
  v145 = v174;
  v146 = v174[2];
  if (v146)
  {
    v164 = v144;
    swift_bridgeObjectRetain();
    v147 = v145 + 5;
    do
    {
      v149 = *(v147 - 1);
      v148 = *v147;
      v178 = v149;
      v179 = v148;
      swift_bridgeObjectRetain();
      sub_1C25F2838();
      sub_1C257F81C();
      v150 = sub_1C25F5550();
      v152 = v151;
      (*(void (**)(char *, uint64_t))(v177 + 8))(v6, v13);
      swift_bridgeObjectRelease();
      v153 = HIBYTE(v152) & 0xF;
      if ((v152 & 0x2000000000000000) == 0)
        v153 = v150 & 0xFFFFFFFFFFFFLL;
      if (v153)
      {
        v154 = v183;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1C25C34F8(0, *(_QWORD *)(v154 + 16) + 1, 1);
          v154 = v183;
        }
        v156 = *(_QWORD *)(v154 + 16);
        v155 = *(_QWORD *)(v154 + 24);
        if (v156 >= v155 >> 1)
        {
          sub_1C25C34F8(v155 > 1, v156 + 1, 1);
          v154 = v183;
        }
        *(_QWORD *)(v154 + 16) = v156 + 1;
        v157 = v154 + 16 * v156;
        *(_QWORD *)(v157 + 32) = v149;
        *(_QWORD *)(v157 + 40) = v148;
        v13 = v176;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v147 += 2;
      --v146;
    }
    while (v146);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v144 = v164;
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v178 = v183;
  v158 = sub_1C25F5304();
  v160 = v159;
  swift_release();
  v161 = v166;
  v162 = v168;
  *v166 = v171;
  v161[1] = v162;
  v163 = v165;
  v161[2] = v167;
  v161[3] = v163;
  v161[4] = v142;
  v161[5] = v144;
  v161[6] = v158;
  v161[7] = v160;
}

id sub_1C25E8B38@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id result;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[8];

  result = objc_msgSend(v1, sel_dialogs);
  v4 = result;
  if (!result)
  {
    v23 = 0;
    v24 = 0;
    v25 = 0;
LABEL_43:
    *(_QWORD *)a1 = v24;
    *(_QWORD *)(a1 + 8) = v25;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v23;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    return result;
  }
  sub_1C253CC30(0, &qword_1EF77CB50);
  v5 = sub_1C25F5394();

  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain();
    v45 = a1;
    if (v6)
      goto LABEL_4;
LABEL_19:
    v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_20:
    swift_bridgeObjectRelease_n();
    v26 = v8[2];
    v27 = v8;
    if (v26)
    {
      swift_bridgeObjectRetain_n();
      v28 = v8 + 7;
      v29 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v30 = v26;
      do
      {
        v33 = *(v28 - 3);
        v32 = *(v28 - 2);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v32)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v29 = sub_1C25EF9D8(0, v29[2] + 1, 1, v29);
          v35 = v29[2];
          v34 = v29[3];
          if (v35 >= v34 >> 1)
            v29 = sub_1C25EF9D8((_QWORD *)(v34 > 1), v35 + 1, 1, v29);
          v29[2] = v35 + 1;
          v31 = &v29[2 * v35];
          v31[4] = v33;
          v31[5] = v32;
        }
        v28 += 8;
        --v30;
      }
      while (v30);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v29 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v52[0] = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0290);
    sub_1C25C3514();
    v24 = sub_1C25F5304();
    v25 = v36;
    swift_bridgeObjectRelease();
    if (v26)
    {
      v51 = v24;
      swift_bridgeObjectRetain();
      v37 = v27 + 6;
      v38 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      do
      {
        v40 = *v37;
        v41 = v37[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v41)
        {
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v38 = sub_1C25EF9D8(0, v38[2] + 1, 1, v38);
          v43 = v38[2];
          v42 = v38[3];
          if (v43 >= v42 >> 1)
            v38 = sub_1C25EF9D8((_QWORD *)(v42 > 1), v43 + 1, 1, v38);
          v38[2] = v43 + 1;
          v39 = &v38[2 * v43];
          v39[4] = v40;
          v39[5] = v41;
        }
        v37 += 8;
        --v26;
      }
      while (v26);
      swift_bridgeObjectRelease();
      v24 = v51;
    }
    else
    {
      v38 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    swift_bridgeObjectRelease();
    v52[0] = v38;
    v4 = (void *)sub_1C25F5304();
    v23 = v44;
    result = (id)swift_bridgeObjectRelease();
    a1 = v45;
    goto LABEL_43;
  }
  swift_bridgeObjectRetain();
  result = (id)sub_1C25F56A0();
  v6 = (uint64_t)result;
  v45 = a1;
  if (!result)
    goto LABEL_19;
LABEL_4:
  if (v6 >= 1)
  {
    v7 = 0;
    v48 = v5 & 0xC000000000000001;
    v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v46 = v6;
    v47 = v5;
    do
    {
      if (v48)
        v9 = (id)MEMORY[0x1C3BC2EF8](v7, v5);
      else
        v9 = *(id *)(v5 + 8 * v7 + 32);
      v10 = v9;
      v11 = objc_msgSend(v9, sel_content, v45);
      if (v11)
      {
        v12 = v11;
        sub_1C25E8FD4((uint64_t)v52);
        v13 = v52[0];
        v15 = v52[2];
        v14 = v52[3];
        v17 = v52[4];
        v16 = v52[5];
        v18 = v52[6];
        v49 = v52[7];
        v50 = v52[1];

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_1C25EFE74(0, v8[2] + 1, 1, v8);
        v20 = v8[2];
        v19 = v8[3];
        v21 = v8;
        if (v20 >= v19 >> 1)
          v21 = sub_1C25EFE74((_QWORD *)(v19 > 1), v20 + 1, 1, v8);
        v8 = v21;
        v21[2] = v20 + 1;
        v22 = &v21[8 * v20];
        v22[4] = v13;
        v22[5] = v50;
        v22[6] = v15;
        v22[7] = v14;
        v22[8] = v17;
        v22[9] = v16;
        v22[10] = v18;
        v22[11] = v49;
        v6 = v46;
        v5 = v47;
      }
      else
      {

      }
      ++v7;
    }
    while (v6 != v7);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

double sub_1C25E8FD4@<D0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double result;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  v4 = sub_1C25F2844();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v1, sel_text);
  if (v8)
  {
    v9 = v8;
    v10 = sub_1C25F5334();
    v12 = v11;

    v25 = v10;
    v26 = v12;
    sub_1C25F2838();
    sub_1C257F81C();
    v13 = sub_1C25F5550();
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
    v15 = 0;
  }
  v16 = (unint64_t)objc_msgSend(v2, sel_speakableTextOverride);
  if (v16)
  {
    v17 = sub_1C25F5334();
    v19 = v18;

    v25 = v17;
    v26 = v19;
    sub_1C25F2838();
    sub_1C257F81C();
    v20 = sub_1C25F5550();
    v16 = v21;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_bridgeObjectRelease();
    if (v15)
      goto LABEL_6;
  }
  else
  {
    v20 = 0;
    if (v15)
    {
LABEL_6:
      v22 = HIBYTE(v15) & 0xF;
      if ((v15 & 0x2000000000000000) == 0)
        v22 = v13 & 0xFFFFFFFFFFFFLL;
      if (!v22)
      {
        swift_bridgeObjectRelease();
        v13 = 0;
        v15 = 0;
      }
      if (!v16)
        goto LABEL_18;
      goto LABEL_14;
    }
  }
  v13 = 0;
  if (!v16)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    v20 = v13;
    v16 = v15;
    goto LABEL_19;
  }
LABEL_14:
  v23 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0)
    v23 = v20 & 0xFFFFFFFFFFFFLL;
  if (!v23)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
LABEL_19:
  *(_QWORD *)a1 = v13;
  *(_QWORD *)(a1 + 8) = v15;
  *(_QWORD *)(a1 + 16) = v20;
  *(_QWORD *)(a1 + 24) = v16;
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  return result;
}

uint64_t (*sub_1C25E91D0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1C25E92A8(v6, a2, a3);
  return sub_1C25E9224;
}

uint64_t (*sub_1C25E9228(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1C25E931C(v6, a2, a3);
  return sub_1C25E9224;
}

void sub_1C25E927C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1C25E92A8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1C3BC2EF8](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1C25E9314;
  }
  __break(1u);
  return result;
}

void sub_1C25E9314(id *a1)
{

}

uint64_t (*sub_1C25E931C(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x1C3BC2EF8](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return sub_1C25E9388;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C25E9388()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for SendMessageShim()
{
  return &type metadata for SendMessageShim;
}

void sub_1C25E93A0()
{
  strcpy((char *)&qword_1EF77CEB8, "send_message");
  unk_1EF77CEC5 = 0;
  unk_1EF77CEC6 = -5120;
}

uint64_t sub_1C25E93CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(unint64_t, char *, uint64_t);
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v0 = sub_1C25F2E74();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1C25F5268();
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (_QWORD *)((char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_1C25F2E98();
  __swift_allocate_value_buffer(v7, qword_1EF77CEC8);
  v29[2] = __swift_project_value_buffer(v7, (uint64_t)qword_1EF77CEC8);
  if (qword_1EF77A4C8 != -1)
    swift_once();
  v29[1] = qword_1EF77CEB8;
  v32 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRetain();
  sub_1C25C3430(0, 4, 0);
  v8 = v32;
  sub_1C25E9750(0);
  v10 = *(_QWORD *)(v8 + 16);
  v9 = *(_QWORD *)(v8 + 24);
  if (v10 >= v9 >> 1)
  {
    sub_1C25C3430(v9 > 1, v10 + 1, 1);
    v8 = v32;
  }
  *(_QWORD *)(v8 + 16) = v10 + 1;
  v11 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v12 = *(_QWORD *)(v1 + 72);
  v13 = v8 + v11 + v12 * v10;
  v14 = *(void (**)(unint64_t, char *, uint64_t))(v1 + 32);
  v14(v13, v3, v0);
  sub_1C25E9750(1);
  v32 = v8;
  v16 = *(_QWORD *)(v8 + 16);
  v15 = *(_QWORD *)(v8 + 24);
  if (v16 >= v15 >> 1)
  {
    sub_1C25C3430(v15 > 1, v16 + 1, 1);
    v8 = v32;
  }
  *(_QWORD *)(v8 + 16) = v16 + 1;
  v14(v8 + v11 + v12 * v16, v3, v0);
  sub_1C25E9750(2);
  v32 = v8;
  v18 = *(_QWORD *)(v8 + 16);
  v17 = *(_QWORD *)(v8 + 24);
  if (v18 >= v17 >> 1)
  {
    sub_1C25C3430(v17 > 1, v18 + 1, 1);
    v8 = v32;
  }
  *(_QWORD *)(v8 + 16) = v18 + 1;
  v14(v8 + v11 + v12 * v18, v3, v0);
  sub_1C25E9750(3);
  v32 = v8;
  v20 = *(_QWORD *)(v8 + 16);
  v19 = *(_QWORD *)(v8 + 24);
  if (v20 >= v19 >> 1)
  {
    sub_1C25C3430(v19 > 1, v20 + 1, 1);
    v8 = v32;
  }
  *(_QWORD *)(v8 + 16) = v20 + 1;
  v14(v8 + v11 + v12 * v20, v3, v0);
  v21 = sub_1C25F5280();
  v22 = swift_allocBox();
  v24 = v23;
  v25 = sub_1C25F5274();
  v26 = swift_allocBox();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, *MEMORY[0x1E0DC0188], v25);
  *v24 = v26;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v24, *MEMORY[0x1E0DC01C8], v21);
  *v6 = v22;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v30 + 104))(v6, *MEMORY[0x1E0DC00E8], v31);
  return sub_1C25F2E8C();
}

void sub_1C25E9750(char a1)
{
  uint64_t v2;

  v2 = sub_1C25F5268();
  MEMORY[0x1E0C80A78](v2);
  __asm { BR              X10 }
}

uint64_t sub_1C25E97CC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t *, _QWORD, uint64_t);

  *(_QWORD *)(v3 - 88) = swift_allocBox();
  v5 = v4;
  v6 = sub_1C25F5280();
  v7 = swift_allocBox();
  v9 = v8;
  v10 = sub_1C25F5274();
  v11 = swift_allocBox();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v12, *MEMORY[0x1E0DC0190], v10);
  *v9 = v11;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v9, *MEMORY[0x1E0DC01C8], v6);
  *v5 = v7;
  v13 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v1 + 104);
  v13(v5, *MEMORY[0x1E0DC00E8], v2);
  *v0 = *(_QWORD *)(v3 - 88);
  v13(v0, *MEMORY[0x1E0DC00D0], v2);
  return sub_1C25F2E68();
}

uint64_t sub_1C25E9B8C(char a1)
{
  return *(_QWORD *)&aRecipienconten[8 * a1];
}

uint64_t sub_1C25E9BAC()
{
  _OWORD *v0;
  __int128 v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  _OWORD v22[3];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  sub_1C25F2A3C();
  swift_allocObject();
  sub_1C25F2A30();
  v1 = v0[1];
  v22[0] = *v0;
  v22[1] = v1;
  v22[2] = v0[2];
  sub_1C25EB584();
  v12 = sub_1C25F2A24();
  v14 = v13;
  swift_release();
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_1C25F2A78();
  *(_QWORD *)&v22[0] = 0;
  v17 = objc_msgSend(v15, sel_propertyListWithData_options_format_error_, v16, 0, 0, v22);

  if (v17)
  {
    v18 = *(id *)&v22[0];
    sub_1C25F5568();
    sub_1C254346C(v12, v14);
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77AD40);
    if (swift_dynamicCast())
      return v21;
    else
      return 0;
  }
  else
  {
    v19 = *(id *)&v22[0];
    v20 = (void *)sub_1C25F2A6C();

    swift_willThrow();
    sub_1C254346C(v12, v14);
    if (qword_1EF77A400 != -1)
      swift_once();
    v2 = sub_1C25F513C();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EF77CC60);
    v3 = v20;
    v4 = v20;
    v5 = sub_1C25F5130();
    v6 = sub_1C25F5490();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = v20;
      v10 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v22[0] = v10;
      sub_1C25F5538();
      *v8 = v10;

      _os_log_impl(&dword_1C2539000, v5, v6, "Error serializing Send Message direct invocation %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B11F0);
      swift_arrayDestroy();
      MEMORY[0x1C3BC3720](v8, -1, -1);
      MEMORY[0x1C3BC3720](v7, -1, -1);

    }
    else
    {

    }
    return 0;
  }
}

uint64_t sub_1C25E9EF0(char a1)
{
  return *(_QWORD *)&aIntenttyintent[8 * a1];
}

uint64_t sub_1C25E9F10(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  char v11[16];
  _BYTE v12[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB68);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C25EB8C4();
  sub_1C25F5868();
  v11[0] = 0;
  sub_1C25F576C();
  if (!v2)
  {
    sub_1C254393C(v3 + 16, (uint64_t)v12);
    sub_1C254393C((uint64_t)v12, (uint64_t)v11);
    v10[15] = 1;
    sub_1C2543984();
    sub_1C25F5784();
    v11[0] = 2;
    sub_1C25F5790();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1C25EA074()
{
  char *v0;

  return sub_1C25E9EF0(*v0);
}

uint64_t sub_1C25EA07C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1C25EB908(a1, a2);
  *a3 = result;
  return result;
}

void sub_1C25EA0A0(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1C25EA0AC()
{
  sub_1C25EB8C4();
  return sub_1C25F5874();
}

uint64_t sub_1C25EA0D4()
{
  sub_1C25EB8C4();
  return sub_1C25F5880();
}

double sub_1C25EA0FC@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_1C25EBA64(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_1C25EA13C(_QWORD *a1)
{
  return sub_1C25E9F10(a1);
}

uint64_t sub_1C25EA174()
{
  uint64_t v0;

  if (qword_1EF77A4C8 != -1)
    swift_once();
  v0 = qword_1EF77CEB8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1C25EA1D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF77A4D0 != -1)
    swift_once();
  v2 = sub_1C25F2E98();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF77CEC8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1C25EA244@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  _BOOL4 v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  os_log_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  void (*v42)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  __int128 v56;
  uint64_t v57;
  char *v58;
  NSObject *v59;
  unint64_t v60;
  unint64_t v61;
  uint8_t *v62;
  char *v63;
  char *v64;
  char *v65;
  NSObject *v66;
  NSObject *v67;
  void (*v68)(char *, char *, uint64_t);
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  void (*v76)(char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  id v79;
  id v80;
  id v81;
  void *v82;
  id v83;
  NSObject *v84;
  os_log_type_t v85;
  uint64_t v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  NSObject *v99;
  os_log_type_t v100;
  os_log_type_t v101;
  uint8_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t result;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  char *v120;
  char *v121;
  _QWORD *v122;
  char *v123;
  void (*v124)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int (*v125)(char *, uint64_t, uint64_t);
  uint64_t v126;
  __int128 v127;
  uint64_t v128;
  __int128 v129;
  char *v130;
  char *v131;
  void (*v132)(char *, char *, uint64_t);
  uint8_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  os_log_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142[2];

  v126 = a1;
  v122 = a2;
  v2 = sub_1C25F513C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v123 = (char *)&v119 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v131 = (char *)&v119 - v6;
  v7 = sub_1C25F525C();
  v134 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x1E0C80A78](v7);
  v130 = (char *)&v119 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v137 = (char *)&v119 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77AD58);
  v12 = MEMORY[0x1E0C80A78](v11);
  v121 = (char *)&v119 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v120 = (char *)&v119 - v15;
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v119 - v16;
  v18 = sub_1C25F2FF4();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v119 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF77A400 != -1)
    swift_once();
  v22 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF77CC60);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, v126, v18);
  v138 = v22;
  v23 = sub_1C25F5130();
  v24 = sub_1C25F5484();
  v25 = v24;
  v26 = os_log_type_enabled(v23, v24);
  v136 = v2;
  if (v26)
  {
    v139 = v23;
    v27 = (uint8_t *)swift_slowAlloc();
    v135 = swift_slowAlloc();
    v142[0] = v135;
    v133 = v27;
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)&v129 = v27 + 4;
    sub_1C25F2F94();
    v28 = sub_1C25F52D4();
    LODWORD(v132) = v25;
    v29 = v18;
    v30 = v17;
    v31 = v28;
    v33 = v32;
    swift_bridgeObjectRelease();
    v34 = v31;
    v17 = v30;
    v141 = sub_1C258AF38(v34, v33, v142);
    sub_1C25F5538();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v29);
    v35 = v139;
    v36 = v133;
    _os_log_impl(&dword_1C2539000, v139, (os_log_type_t)v132, "SendMessageShim, extractingParameters from ClientAction %s", v133, 0xCu);
    v37 = v135;
    swift_arrayDestroy();
    MEMORY[0x1C3BC3720](v37, -1, -1);
    MEMORY[0x1C3BC3720](v36, -1, -1);

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);

  }
  v38 = sub_1C25F2F94();
  v39 = v134;
  if (*(_QWORD *)(v38 + 16) && (v40 = sub_1C25F003C(0x6E65697069636572, 0xEA00000000007374), (v41 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v39 + 16))(v17, *(_QWORD *)(v38 + 56) + *(_QWORD *)(v39 + 72) * v40, v7);
    v42 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56);
    v43 = v17;
    v44 = 0;
  }
  else
  {
    v42 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 56);
    v43 = v17;
    v44 = 1;
  }
  v124 = v42;
  v42((uint64_t)v43, v44, 1, v7);
  swift_bridgeObjectRelease();
  v125 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v125(v17, 1, v7) == 1)
  {
    sub_1C2581FA0((uint64_t)v17);
  }
  else
  {
    v45 = sub_1C25F5238();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v17, v7);
    if (v45)
      goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  v45 = MEMORY[0x1E0DEE9D8];
LABEL_14:
  swift_bridgeObjectRetain_n();
  v46 = sub_1C25F5130();
  v47 = sub_1C25F5484();
  v48 = v47;
  if (os_log_type_enabled(v46, v47))
  {
    v49 = swift_slowAlloc();
    LODWORD(v139) = v48;
    v50 = v49;
    v51 = swift_slowAlloc();
    *(_DWORD *)v50 = 134218242;
    v141 = *(_QWORD *)(v45 + 16);
    v142[0] = v51;
    sub_1C25F5538();
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 12) = 2080;
    v135 = v50 + 14;
    v52 = swift_bridgeObjectRetain();
    v53 = MEMORY[0x1C3BC2CA0](v52, v7);
    v55 = v54;
    swift_bridgeObjectRelease();
    v141 = sub_1C258AF38(v53, v55, v142);
    sub_1C25F5538();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2539000, v46, (os_log_type_t)v139, "SendMessageShim, recipeints TypedPerson count: %ld with values %s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1C3BC3720](v51, -1, -1);
    MEMORY[0x1C3BC3720](v50, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v57 = v136;
  v58 = "rBridgeLog";
  v142[0] = MEMORY[0x1E0DEE9D8];
  v59 = *(NSObject **)(v45 + 16);
  v135 = v7;
  if (v59)
  {
    v60 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    v119 = v45;
    v61 = v45 + v60;
    v62 = *(uint8_t **)(v39 + 72);
    v132 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
    v133 = v62;
    *(_QWORD *)&v56 = 136315138;
    v129 = v56;
    v128 = MEMORY[0x1E0DEE9B8] + 8;
    *(_QWORD *)&v56 = 138412290;
    v127 = v56;
    v63 = v130;
    v64 = v131;
    v65 = v137;
    do
    {
      v139 = v59;
      v68 = v132;
      v132(v65, (char *)v61, v7);
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v64, v138, v57);
      v68(v63, v65, v7);
      v69 = sub_1C25F5130();
      v70 = sub_1C25F5484();
      if (os_log_type_enabled(v69, v70))
      {
        v71 = swift_slowAlloc();
        v72 = swift_slowAlloc();
        v141 = v72;
        *(_DWORD *)v71 = v129;
        v73 = sub_1C25F5244();
        if (v74)
        {
          v75 = v74;
        }
        else
        {
          v73 = 0x3E726F7272653CLL;
          v75 = 0xE700000000000000;
        }
        *(_QWORD *)(v71 + 4) = sub_1C258AF38(v73, v75, &v141);
        swift_bridgeObjectRelease();
        v76 = *(void (**)(char *, uint64_t))(v39 + 8);
        v76(v63, v135);
        _os_log_impl(&dword_1C2539000, v69, v70, "SendMessageShim, recipeint TypedPerson.toString: %s", (uint8_t *)v71, 0xCu);
        swift_arrayDestroy();
        v77 = v72;
        v7 = v135;
        MEMORY[0x1C3BC3720](v77, -1, -1);
        MEMORY[0x1C3BC3720](v71, -1, -1);

        (*(void (**)(char *, uint64_t))(v3 + 8))(v64, v136);
      }
      else
      {
        v76 = *(void (**)(char *, uint64_t))(v39 + 8);
        v76(v63, v7);

        (*(void (**)(char *, uint64_t))(v3 + 8))(v64, v57);
      }
      v65 = v137;
      sub_1C25F5244();
      if (v78)
      {
        v79 = objc_allocWithZone(MEMORY[0x1E0CBDA60]);
        v80 = objc_msgSend(v79, sel_initWithValue_type_, 0, 2, v119);
        v81 = objc_allocWithZone(MEMORY[0x1E0CBDA58]);
        v82 = (void *)sub_1C25F5328();
        swift_bridgeObjectRelease();
        v83 = objc_msgSend(v81, sel_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_, v80, 0, v82, 0, 0, 0);

        v84 = v83;
        v66 = sub_1C25F5130();
        v85 = sub_1C25F5484();
        if (os_log_type_enabled(v66, v85))
        {
          v86 = swift_slowAlloc();
          v87 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v86 = v127;
          *(_QWORD *)(v86 + 4) = v84;
          *v87 = v84;
          _os_log_impl(&dword_1C2539000, v66, v85, "SendMessageShim, adding INPerson: %@", (uint8_t *)v86, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B11F0);
          swift_arrayDestroy();
          v88 = v87;
          v7 = v135;
          MEMORY[0x1C3BC3720](v88, -1, -1);
          MEMORY[0x1C3BC3720](v86, -1, -1);
        }
        else
        {

          v66 = v84;
        }

        v67 = v84;
        MEMORY[0x1C3BC2C7C]();
        if (*(_QWORD *)((v142[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v142[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1C25F53B8();
        sub_1C25F53DC();
        sub_1C25F53AC();

        v63 = v130;
        v64 = v131;
        v65 = v137;
      }
      v76(v65, v7);
      v39 = v134;
      v61 += (unint64_t)v133;
      v59 = (os_log_t)((char *)v139 - 1);
      v57 = v136;
    }
    while (v139 != (os_log_t)1);
    swift_bridgeObjectRelease();
    v58 = "RequestControllerBridgeLog" + 16;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v89 = sub_1C25F2F94();
  v90 = v123;
  v91 = (uint64_t)v120;
  if (*(_QWORD *)(v89 + 16) && (v92 = sub_1C25F003C(0x746E65746E6F63, 0xE700000000000000), (v93 & 1) != 0))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v39 + 16))(v91, *(_QWORD *)(v89 + 56) + *(_QWORD *)(v39 + 72) * v92, v7);
    v94 = 0;
  }
  else
  {
    v94 = 1;
  }
  v124(v91, v94, 1, v7);
  swift_bridgeObjectRelease();
  if (v125((char *)v91, 1, v7) == 1)
  {
    sub_1C2581FA0(v91);
    v95 = 0;
    v96 = 0;
  }
  else
  {
    v95 = sub_1C25F5244();
    v96 = v97;
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v91, v7);
  }
  v98 = v136;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v90, v138, v136);
  swift_bridgeObjectRetain_n();
  v99 = sub_1C25F5130();
  v100 = sub_1C25F5484();
  v139 = (os_log_t)v3;
  v101 = v100;
  if (os_log_type_enabled(v99, v100))
  {
    v102 = (uint8_t *)swift_slowAlloc();
    v103 = swift_slowAlloc();
    v138 = v95;
    v104 = v103;
    v141 = v103;
    *(_DWORD *)v102 = *((_QWORD *)v58 + 42);
    if (v96)
      v105 = v138;
    else
      v105 = 0x3E6C696E3CLL;
    if (v96)
      v106 = v96;
    else
      v106 = 0xE500000000000000;
    swift_bridgeObjectRetain();
    v107 = v105;
    v7 = v135;
    v140 = sub_1C258AF38(v107, v106, &v141);
    sub_1C25F5538();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2539000, v99, v101, "SendMessageShim, content: %s", v102, 0xCu);
    swift_arrayDestroy();
    v108 = v104;
    v95 = v138;
    MEMORY[0x1C3BC3720](v108, -1, -1);
    MEMORY[0x1C3BC3720](v102, -1, -1);

    ((void (*)(char *, uint64_t))v139[1].isa)(v123, v136);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    ((void (*)(char *, uint64_t))v139[1].isa)(v90, v98);
  }
  v109 = (uint64_t)v121;
  v110 = sub_1C25F2F94();
  if (*(_QWORD *)(v110 + 16) && (v111 = sub_1C25F003C(0x6165536F746F6870, 0xEF6D726554686372), (v112 & 1) != 0))
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v39 + 16))(v109, *(_QWORD *)(v110 + 56) + *(_QWORD *)(v39 + 72) * v111, v7);
    v113 = 0;
  }
  else
  {
    v113 = 1;
  }
  v124(v109, v113, 1, v7);
  swift_bridgeObjectRelease();
  if (v125((char *)v109, 1, v7) == 1)
  {
    result = sub_1C2581FA0(v109);
    v115 = 0;
    v116 = 0;
  }
  else
  {
    v115 = sub_1C25F5244();
    v116 = v117;
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v39 + 8))(v109, v7);
  }
  v118 = v122;
  *v122 = v142[0];
  v118[1] = v95;
  v118[2] = v96;
  v118[3] = MEMORY[0x1E0DEE9D8];
  v118[4] = v115;
  v118[5] = v116;
  return result;
}

void sub_1C25EAF74(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v4 = objc_msgSend(a1, sel_typeName);
  v5 = sub_1C25F5334();
  v7 = v6;

  v8 = objc_msgSend(a1, sel_backingStore);
  v9 = objc_msgSend(v8, sel_data);

  if (v9)
  {
    v10 = sub_1C25F2A90();
    v12 = v11;

  }
  else
  {

    v10 = 0;
    v12 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v10;
  a2[3] = v12;
  a2[4] = 0xD000000000000013;
  a2[5] = 0x80000001C25FC9D0;
}

id sub_1C25EB05C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40[3];

  v2 = sub_1C25F513C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C25EA244(a1, v40);
  v38 = v40[1];
  v6 = v40[2];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_1EF77A400 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF77CC60);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v8 = sub_1C25F5130();
  v9 = sub_1C25F5484();
  v10 = v9;
  if (os_log_type_enabled(v8, v9))
  {
    v11 = swift_slowAlloc();
    v36 = v10;
    v12 = v11;
    v35 = swift_slowAlloc();
    v40[0] = v35;
    *(_DWORD *)v12 = 136315394;
    v13 = sub_1C25EB4FC();
    v37 = v3;
    v14 = v13;
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x1C3BC2CA0](v15, v14);
    v18 = v17;
    swift_bridgeObjectRelease();
    v39 = sub_1C258AF38(v16, v18, v40);
    sub_1C25F5538();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    if (v6)
      v19 = v38;
    else
      v19 = 0x74657320746F6E3CLL;
    if (v6)
      v20 = v6;
    else
      v20 = 0xE90000000000003ELL;
    swift_bridgeObjectRetain();
    v39 = sub_1C258AF38(v19, v20, v40);
    sub_1C25F5538();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2539000, v8, (os_log_type_t)v36, "Building DI for SendMessageShim, computed parameters: contacts=%s, content=%s", (uint8_t *)v12, 0x16u);
    v21 = v35;
    swift_arrayDestroy();
    MEMORY[0x1C3BC3720](v21, -1, -1);
    MEMORY[0x1C3BC3720](v12, -1, -1);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v5, v2);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_1C25EB4FC();
  v22 = (void *)sub_1C25F5388();
  swift_bridgeObjectRelease();
  if (v6)
  {
    v23 = (void *)sub_1C25F5328();
    swift_bridgeObjectRelease();
  }
  else
  {
    v23 = 0;
  }
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CBDB80]), sel_initWithRecipients_outgoingMessageType_content_speakableGroupName_conversationIdentifier_serviceName_sender_attachments_, v22, 1, v23, 0, 0, 0, 0, 0);

  v25 = objc_allocWithZone(MEMORY[0x1E0D9C808]);
  v26 = (void *)sub_1C25F5328();
  v27 = objc_msgSend(v25, sel_initWithIdentifier_, v26);

  v28 = v24;
  sub_1C25EAF74(v28, v40);
  v29 = (void *)sub_1C25E9BAC();
  sub_1C25EB538((uint64_t)v40);
  if (v29)
  {
    sub_1C2564A04((uint64_t)v29);
    swift_bridgeObjectRelease();
    v29 = (void *)sub_1C25F52BC();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v27, sel_setUserData_, v29);

  v30 = (void *)objc_opt_self();
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9C800]), sel_init);
  v32 = objc_msgSend(v30, sel_runSiriKitExecutorCommandWithContext_payload_, v31, v27);

  return v32;
}

unint64_t sub_1C25EB4FC()
{
  unint64_t result;

  result = qword_1EF77CB58;
  if (!qword_1EF77CB58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF77CB58);
  }
  return result;
}

uint64_t sub_1C25EB538(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  swift_bridgeObjectRelease();
  sub_1C2543458(v2, v3);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1C25EB584()
{
  unint64_t result;

  result = qword_1EF77CB60;
  if (!qword_1EF77CB60)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F8C94, &type metadata for SendMessageShim.SendMessageDirectInvocation);
    atomic_store(result, (unint64_t *)&qword_1EF77CB60);
  }
  return result;
}

uint64_t destroy for SendMessageShim.SendMessageDirectInvocation(uint64_t a1)
{
  unint64_t v2;

  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >> 60 != 15)
    sub_1C254346C(*(_QWORD *)(a1 + 16), v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SendMessageShim.SendMessageDirectInvocation(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  _OWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2 + 2;
  v6 = a2[3];
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    v7 = *(_QWORD *)v5;
    sub_1C2543508(v7, v6);
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v6;
  }
  v8 = a2[5];
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SendMessageShim.SendMessageDirectInvocation(_QWORD *a1, _QWORD *a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2 + 2;
  v5 = a2[3];
  if (a1[3] >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      sub_1C2543508(*v4, a2[3]);
      v8 = a1[2];
      v9 = a1[3];
      a1[2] = v7;
      a1[3] = v5;
      sub_1C254346C(v8, v9);
      goto LABEL_8;
    }
    sub_1C2543760((uint64_t)(a1 + 2));
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 1) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v6 = *v4;
  sub_1C2543508(*v4, a2[3]);
  a1[2] = v6;
  a1[3] = v5;
LABEL_8:
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

_QWORD *assignWithTake for SendMessageShim.SendMessageDirectInvocation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2 + 2;
  v6 = a1[3];
  if (v6 >> 60 != 15)
  {
    v7 = a2[3];
    if (v7 >> 60 != 15)
    {
      v8 = a1[2];
      a1[2] = *v5;
      a1[3] = v7;
      sub_1C254346C(v8, v6);
      goto LABEL_6;
    }
    sub_1C2543760((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v5;
LABEL_6:
  v9 = a2[5];
  a1[4] = a2[4];
  a1[5] = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SendMessageShim.SendMessageDirectInvocation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SendMessageShim.SendMessageDirectInvocation(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SendMessageShim.SendMessageDirectInvocation()
{
  return &type metadata for SendMessageShim.SendMessageDirectInvocation;
}

unint64_t sub_1C25EB8C4()
{
  unint64_t result;

  result = qword_1EF77CB70;
  if (!qword_1EF77CB70)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F8D80, &type metadata for SendMessageShim.SendMessageDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF77CB70);
  }
  return result;
}

uint64_t sub_1C25EB908(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7954746E65746E69 && a2 == 0xEE00656D614E6570;
  if (v3 || (sub_1C25F57C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6144746E65746E69 && a2 == 0xEA00000000006174 || (sub_1C25F57C0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6449707061 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1C25F57C0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1C25EBA64@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  unint64_t v18;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C25EB8C4();
  sub_1C25F585C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v24) = 0;
  v9 = sub_1C25F570C();
  v11 = v10;
  v23 = v9;
  v26 = 1;
  sub_1C2543E64();
  swift_bridgeObjectRetain();
  sub_1C25F5724();
  v12 = v24;
  LOBYTE(v24) = 2;
  v21 = v25;
  v22 = v12;
  sub_1C25434F4(v12, v25);
  v13 = sub_1C25F5730();
  v15 = v14;
  v16 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  v18 = v21;
  v17 = v22;
  sub_1C25434F4(v22, v21);
  swift_bridgeObjectRetain();
  sub_1C2543458(v17, v18);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_1C2543458(v17, v18);
  result = swift_bridgeObjectRelease();
  *a2 = v23;
  a2[1] = v11;
  a2[2] = v17;
  a2[3] = v18;
  a2[4] = v16;
  a2[5] = v15;
  return result;
}

uint64_t storeEnumTagSinglePayload for SendMessageShim.SendMessageDirectInvocation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C25EBD28 + 4 * byte_1C25F8C09[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C25EBD5C + 4 * byte_1C25F8C04[v4]))();
}

uint64_t sub_1C25EBD5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C25EBD64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C25EBD6CLL);
  return result;
}

uint64_t sub_1C25EBD78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C25EBD80);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C25EBD84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C25EBD8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SendMessageShim.SendMessageDirectInvocation.CodingKeys()
{
  return &type metadata for SendMessageShim.SendMessageDirectInvocation.CodingKeys;
}

unint64_t sub_1C25EBDAC()
{
  unint64_t result;

  result = qword_1EF77CB80;
  if (!qword_1EF77CB80)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F8D58, &type metadata for SendMessageShim.SendMessageDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF77CB80);
  }
  return result;
}

unint64_t sub_1C25EBDF4()
{
  unint64_t result;

  result = qword_1EF77CB88;
  if (!qword_1EF77CB88)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F8CC8, &type metadata for SendMessageShim.SendMessageDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF77CB88);
  }
  return result;
}

unint64_t sub_1C25EBE3C()
{
  unint64_t result;

  result = qword_1EF77CB90;
  if (!qword_1EF77CB90)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F8CF0, &type metadata for SendMessageShim.SendMessageDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF77CB90);
  }
  return result;
}

id sub_1C25EBE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v5;
  void *v6;

  v5 = (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a5 + 24))(a1, a4, a5);
  v6 = (void *)sub_1C25F5328();
  objc_msgSend(v5, sel_setRefId_, v6);

  return v5;
}

double sub_1C25EBEF0()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB98);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 7;
  *(_OWORD *)(v0 + 16) = xmmword_1C25F6590;
  *(_QWORD *)(v0 + 32) = &type metadata for CreateReminderShim;
  *(_QWORD *)(v0 + 40) = &off_1E7C16750;
  *(_QWORD *)(v0 + 48) = &type metadata for SendMessageShim;
  *(_QWORD *)(v0 + 56) = &off_1E7C191E0;
  *(_QWORD *)(v0 + 64) = &type metadata for PlayMediaShim;
  *(_QWORD *)(v0 + 72) = &off_1E7C17A60;
  *(_QWORD *)(v0 + 80) = &type metadata for StartCallShim;
  *(_QWORD *)(v0 + 88) = &off_1E7C195F8;
  *(_QWORD *)(v0 + 96) = &type metadata for CreateTimerShim;
  *(_QWORD *)(v0 + 104) = &off_1E7C16900;
  *(_QWORD *)(v0 + 112) = &type metadata for CreateAlarmShim;
  *(_QWORD *)(v0 + 120) = &off_1E7C16380;
  *(_QWORD *)(v0 + 128) = &type metadata for NavigateToShim;
  *(_QWORD *)(v0 + 136) = &off_1E7C17A18;
  qword_1EF77CEE0 = v0;
  return result;
}

void sub_1C25EBFB8(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  char v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v41 = *(_OWORD *)(a1 + 48);
  swift_bridgeObjectRetain();
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v11 = sub_1C25F003C(v8, v7);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_1C25E454C();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v8;
    v21[1] = v7;
    *(_OWORD *)(v20[7] + 16 * v11) = v41;
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    v25 = v4 - 1;
    if (v4 == 1)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = (_OWORD *)(a1 + 80);
    while (1)
    {
      v28 = *((_QWORD *)v26 - 2);
      v27 = *((_QWORD *)v26 - 1);
      v42 = *v26;
      v29 = (_QWORD *)*a3;
      swift_bridgeObjectRetain();
      v30 = sub_1C25F003C(v28, v27);
      v32 = v29[2];
      v33 = (v31 & 1) == 0;
      v23 = __OFADD__(v32, v33);
      v34 = v32 + v33;
      if (v23)
        break;
      v35 = v31;
      if (v29[3] < v34)
      {
        sub_1C25DFE7C(v34, 1);
        v30 = sub_1C25F003C(v28, v27);
        if ((v35 & 1) != (v36 & 1))
          goto LABEL_25;
      }
      if ((v35 & 1) != 0)
        goto LABEL_10;
      v37 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      v38 = (uint64_t *)(v37[6] + 16 * v30);
      *v38 = v28;
      v38[1] = v27;
      *(_OWORD *)(v37[7] + 16 * v30) = v42;
      v39 = v37[2];
      v23 = __OFADD__(v39, 1);
      v40 = v39 + 1;
      if (v23)
        goto LABEL_24;
      v37[2] = v40;
      v26 += 2;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_1C25DFE7C(v14, a2 & 1);
  v16 = sub_1C25F003C(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B1290);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_1C25F57D8();
  __break(1u);
LABEL_26:
  sub_1C25F55D4();
  sub_1C25F5358();
  sub_1C25F5670();
  sub_1C25F5358();
  sub_1C25F5688();
  __break(1u);
}

uint64_t sub_1C25EC348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_1C25F2E98();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF77A4D8 != -1)
    swift_once();
  v4 = qword_1EF77CEE0;
  v5 = *(_QWORD *)(qword_1EF77CEE0 + 16);
  v6 = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1C25C345C(0, v5, 0);
    v6 = v12;
    v7 = v4 + 40;
    do
    {
      (*(void (**)(void))(*(_QWORD *)v7 + 16))();
      v12 = v6;
      v9 = *(_QWORD *)(v6 + 16);
      v8 = *(_QWORD *)(v6 + 24);
      if (v9 >= v8 >> 1)
      {
        sub_1C25C345C(v8 > 1, v9 + 1, 1);
        v6 = v12;
      }
      *(_QWORD *)(v6 + 16) = v9 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(v6+ ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ *(_QWORD *)(v1 + 72) * v9, v3, v0);
      v7 += 16;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  return v6;
}

uint64_t sub_1C25EC4B8()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;

  if (qword_1EF77A4D8 != -1)
    swift_once();
  v0 = qword_1EF77CEE0;
  v1 = *(_QWORD *)(qword_1EF77CEE0 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1C25C34A4(0, v1, 0);
    v3 = 0;
    v2 = v14;
    do
    {
      v13 = *(_OWORD *)(v0 + 16 * v3 + 32);
      v4 = (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16 * v3 + 40) + 8))();
      v6 = v5;
      v14 = v2;
      v8 = *(_QWORD *)(v2 + 16);
      v7 = *(_QWORD *)(v2 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1C25C34A4(v7 > 1, v8 + 1, 1);
        v2 = v14;
      }
      ++v3;
      *(_QWORD *)(v2 + 16) = v8 + 1;
      v9 = v2 + 32 * v8;
      *(_QWORD *)(v9 + 32) = v4;
      *(_QWORD *)(v9 + 40) = v6;
      *(_OWORD *)(v9 + 48) = v13;
    }
    while (v1 != v3);
    swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v2 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CB18);
    v10 = sub_1C25F56D0();
  }
  else
  {
    v10 = MEMORY[0x1E0DEE9E0];
  }
  v14 = v10;
  v11 = swift_bridgeObjectRetain();
  sub_1C25EBFB8(v11, 1, &v14);
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1C25EC664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 16))();
}

uint64_t sub_1C25EC66C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 24))();
}

uint64_t sub_1C25EC674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t sub_1C25EC67C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 40))();
}

uint64_t sub_1C25EC684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 48))();
}

void sub_1C25EC68C(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t type metadata accessor for SiriActivationHelper()
{
  return objc_opt_self();
}

void sub_1C25EC700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1C25ECA9C(a1, a2, a3, a4, a5, a6, 0xD000000000000041, 0x80000001C25FCB80, (uint64_t)&block_descriptor_8, MEMORY[0x1E0CFE650]);
}

uint64_t block_copy_helper_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_8()
{
  return swift_release();
}

void sub_1C25EC760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1C25ECA9C(a1, a2, a3, a4, a5, a6, 0xD00000000000004ALL, 0x80000001C25FCBD0, (uint64_t)&block_descriptor_3_1, MEMORY[0x1E0CFE620]);
}

void sub_1C25EC7A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1C25ECA9C(a1, a2, a3, a4, a5, a6, 0xD00000000000004ALL, 0x80000001C25FCC20, (uint64_t)&block_descriptor_6_0, MEMORY[0x1E0CFE630]);
}

void sub_1C25EC7F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t aBlock[6];

  if (qword_1ED7B0498 != -1)
    swift_once();
  v6 = sub_1C25F513C();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED7B17B0);
  v7 = sub_1C25F5130();
  v8 = sub_1C25F5484();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    aBlock[0] = v10;
    *(_DWORD *)v9 = 136315138;
    sub_1C258AF38(0xD00000000000004ELL, 0x80000001C25FCC70, aBlock);
    sub_1C25F5538();
    _os_log_impl(&dword_1C2539000, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BC3720](v10, -1, -1);
    MEMORY[0x1C3BC3720](v9, -1, -1);
  }

  v11 = (void *)sub_1C25F52BC();
  aBlock[4] = a3;
  aBlock[5] = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1C25EC68C;
  aBlock[3] = (uint64_t)&block_descriptor_9;
  v12 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  AFSiriActivationTriggerless();
  _Block_release(v12);

}

void sub_1C25ECA0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1C25ECA9C(a1, a2, a3, a4, a5, a6, 0xD00000000000004DLL, 0x80000001C25FCCC0, (uint64_t)&block_descriptor_12_0, MEMORY[0x1E0CFE628]);
}

void sub_1C25ECA54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_1C25ECA9C(a1, a2, a3, a4, a5, a6, 0xD000000000000044, 0x80000001C25FCD10, (uint64_t)&block_descriptor_15_0, MEMORY[0x1E0CFE618]);
}

void sub_1C25ECA9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, void (*a10)(uint64_t, void *, void *, void *))
{
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t aBlock[6];

  if (qword_1ED7B0498 != -1)
    swift_once();
  v15 = sub_1C25F513C();
  __swift_project_value_buffer(v15, (uint64_t)qword_1ED7B17B0);
  v16 = sub_1C25F5130();
  v17 = sub_1C25F5484();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v20 = a7;
    v21 = v19;
    aBlock[0] = v19;
    *(_DWORD *)v18 = 136315138;
    sub_1C258AF38(v20, a8, aBlock);
    sub_1C25F5538();
    _os_log_impl(&dword_1C2539000, v16, v17, "%s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1C3BC3720](v21, -1, -1);
    MEMORY[0x1C3BC3720](v18, -1, -1);
  }

  if (a3)
    v22 = (void *)sub_1C25F5328();
  else
    v22 = 0;
  v23 = (void *)sub_1C25F52BC();
  aBlock[4] = a5;
  aBlock[5] = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1C25EC68C;
  aBlock[3] = a9;
  v24 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  a10(a1, v22, v23, v24);
  _Block_release(v24);

}

uint64_t sub_1C25ECD10(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v5 = sub_1C25F4B78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  sub_1C25F4B84();
  v6 = a3;
  return sub_1C25F4B6C();
}

uint64_t storeEnumTagSinglePayload for SiriXFallbackForNoMatchingTool(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C25ECDB0 + 4 * byte_1C25F8EF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C25ECDD0 + 4 * byte_1C25F8EF5[v4]))();
}

_BYTE *sub_1C25ECDB0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C25ECDD0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C25ECDD8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C25ECDE0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C25ECDE8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C25ECDF0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriXFallbackForNoMatchingTool()
{
  return &type metadata for SiriXFallbackForNoMatchingTool;
}

unint64_t sub_1C25ECE10()
{
  unint64_t result;

  result = qword_1EF77CBA0;
  if (!qword_1EF77CBA0)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F8F80, &type metadata for SiriXFallbackForNoMatchingTool);
    atomic_store(result, (unint64_t *)&qword_1EF77CBA0);
  }
  return result;
}

const char *sub_1C25ECE54()
{
  return "siriXFallbackForNoMatchingTool";
}

ValueMetadata *type metadata accessor for StartCallShim()
{
  return &type metadata for StartCallShim;
}

void sub_1C25ECE78()
{
  qword_1EF77CEE8 = 0x61635F7472617473;
  unk_1EF77CEF0 = 0xEA00000000006C6CLL;
}

uint64_t sub_1C25ECEA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t *, _QWORD, uint64_t);
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, _QWORD, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v46[5];
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  unsigned int v54;
  int v55;
  uint64_t v56;
  uint64_t v57;

  v0 = sub_1C25F2E74();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v50 = (char *)v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1C25F5268();
  v52 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (_QWORD *)((char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_1C25F2E98();
  __swift_allocate_value_buffer(v6, qword_1EF77CEF8);
  v46[2] = __swift_project_value_buffer(v6, (uint64_t)qword_1EF77CEF8);
  if (qword_1EF77A4E0 != -1)
    swift_once();
  v46[1] = qword_1EF77CEE8;
  v57 = MEMORY[0x1E0DEE9D8];
  v46[0] = unk_1EF77CEF0;
  swift_bridgeObjectRetain();
  sub_1C25C3430(0, 2, 0);
  v7 = 0;
  v8 = 0;
  v56 = v57;
  v49 = *MEMORY[0x1E0DC0190];
  v53 = *MEMORY[0x1E0DC01C8];
  v54 = *MEMORY[0x1E0DC00E8];
  v48 = *MEMORY[0x1E0DC00D0];
  v47 = *MEMORY[0x1E0DC0178];
  v46[3] = 0x80000001C25FCE30;
  v46[4] = 0x80000001C25FCDE0;
  v9 = v50;
  do
  {
    v55 = v7;
    if ((*((_BYTE *)&unk_1E7C15D58 + v8 + 32) & 1) != 0)
    {
      v10 = sub_1C25F5280();
      v11 = swift_allocBox();
      v13 = v12;
      v14 = sub_1C25F5274();
      v15 = swift_allocBox();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, v47, v14);
      *v13 = v15;
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v13, v53, v10);
      *v5 = v11;
      v17 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v52 + 104);
      v17(v5, v54, v3);
    }
    else
    {
      v51 = swift_allocBox();
      v19 = v18;
      v20 = sub_1C25F5280();
      v21 = swift_allocBox();
      v22 = v1;
      v23 = v5;
      v25 = v24;
      v26 = v0;
      v27 = v3;
      v28 = sub_1C25F5274();
      v29 = swift_allocBox();
      v30 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104);
      v31 = v28;
      v3 = v27;
      v0 = v26;
      v30(v32, v49, v31);
      *v25 = v29;
      v33 = v25;
      v5 = v23;
      v1 = v22;
      v9 = v50;
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v33, v53, v20);
      *v19 = v21;
      v17 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v52 + 104);
      v17(v19, v54, v3);
      *v5 = v51;
      v17(v5, v48, v3);
    }
    sub_1C25F2E68();
    v34 = v56;
    v57 = v56;
    v36 = *(_QWORD *)(v56 + 16);
    v35 = *(_QWORD *)(v56 + 24);
    if (v36 >= v35 >> 1)
    {
      sub_1C25C3430(v35 > 1, v36 + 1, 1);
      v9 = v50;
      v34 = v57;
    }
    *(_QWORD *)(v34 + 16) = v36 + 1;
    v37 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
    v56 = v34;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(v34 + v37 + *(_QWORD *)(v1 + 72) * v36, v9, v0);
    v7 = 1;
    v8 = 1u;
  }
  while ((v55 & 1) == 0);
  v38 = sub_1C25F5280();
  v39 = swift_allocBox();
  v41 = v40;
  v42 = sub_1C25F5274();
  v43 = swift_allocBox();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v44, *MEMORY[0x1E0DC0188], v42);
  *v41 = v43;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v41, v53, v38);
  *v5 = v39;
  v17(v5, v54, v3);
  return sub_1C25F2E8C();
}

uint64_t sub_1C25ED364(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7072656B61657073;
  else
    return 0x74616E6974736564;
}

uint64_t sub_1C25ED3AC()
{
  _OWORD *v0;
  __int128 v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  _OWORD v22[3];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  sub_1C25F2A3C();
  swift_allocObject();
  sub_1C25F2A30();
  v1 = v0[1];
  v22[0] = *v0;
  v22[1] = v1;
  v22[2] = v0[2];
  sub_1C25EE5F0();
  v12 = sub_1C25F2A24();
  v14 = v13;
  swift_release();
  v15 = (void *)objc_opt_self();
  v16 = (void *)sub_1C25F2A78();
  *(_QWORD *)&v22[0] = 0;
  v17 = objc_msgSend(v15, sel_propertyListWithData_options_format_error_, v16, 0, 0, v22);

  if (v17)
  {
    v18 = *(id *)&v22[0];
    sub_1C25F5568();
    sub_1C254346C(v12, v14);
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77AD40);
    if (swift_dynamicCast())
      return v21;
    else
      return 0;
  }
  else
  {
    v19 = *(id *)&v22[0];
    v20 = (void *)sub_1C25F2A6C();

    swift_willThrow();
    sub_1C254346C(v12, v14);
    if (qword_1EF77A400 != -1)
      swift_once();
    v2 = sub_1C25F513C();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EF77CC60);
    v3 = v20;
    v4 = v20;
    v5 = sub_1C25F5130();
    v6 = sub_1C25F5490();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = v20;
      v10 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v22[0] = v10;
      sub_1C25F5538();
      *v8 = v10;

      _os_log_impl(&dword_1C2539000, v5, v6, "Error serializing direct invocation %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7B11F0);
      swift_arrayDestroy();
      MEMORY[0x1C3BC3720](v8, -1, -1);
      MEMORY[0x1C3BC3720](v7, -1, -1);

    }
    else
    {

    }
    return 0;
  }
}

void sub_1C25ED6F0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v37 = a2;
  v3 = sub_1C25F51FC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C25F525C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v34 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v36 = (char *)&v32 - v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v32 - v13;
  v33 = sub_1C25F51E4();
  v15 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v35 = a1;
  v19 = a1;
  v20 = v18;
  v18(v14, v19, v7);
  if ((*(unsigned int (**)(char *, uint64_t))(v8 + 88))(v14, v7) == *MEMORY[0x1E0DC0018])
  {
    (*(void (**)(char *, uint64_t))(v8 + 96))(v14, v7);
    v21 = swift_projectBox();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v21, v3);
    if ((*(unsigned int (**)(char *, uint64_t))(v4 + 88))(v6, v3) == *MEMORY[0x1E0DBFF60])
    {
      (*(void (**)(char *, uint64_t))(v4 + 96))(v6, v3);
      v22 = v33;
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v6, v33);
      swift_release();
      v23 = sub_1C25F51D8();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v22);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
  }
  v24 = v36;
  if (qword_1EF77A400 != -1)
    swift_once();
  v25 = sub_1C25F513C();
  __swift_project_value_buffer(v25, (uint64_t)qword_1EF77CC60);
  v20(v24, v35, v7);
  v26 = sub_1C25F5130();
  v27 = sub_1C25F5490();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v39 = v35;
    *(_DWORD *)v28 = 136315138;
    v33 = (uint64_t)(v28 + 4);
    v20(v34, (uint64_t)v24, v7);
    v29 = sub_1C25F5340();
    v38 = sub_1C258AF38(v29, v30, &v39);
    sub_1C25F5538();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v24, v7);
    _os_log_impl(&dword_1C2539000, v26, v27, "Encountered a value in destinations parameter that was not a .primitive(.person(_)): %s", v28, 0xCu);
    v31 = v35;
    swift_arrayDestroy();
    MEMORY[0x1C3BC3720](v31, -1, -1);
    MEMORY[0x1C3BC3720](v28, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v24, v7);
  }

  v23 = 0;
LABEL_12:
  *v37 = v23;
}

uint64_t sub_1C25EDAC4(char a1)
{
  return *(_QWORD *)&aIntenttyintent_0[8 * a1];
}

uint64_t sub_1C25EDAE4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  char v11[16];
  _BYTE v12[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CBB0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C25EE644();
  sub_1C25F5868();
  v11[0] = 0;
  sub_1C25F576C();
  if (!v2)
  {
    sub_1C254393C(v3 + 16, (uint64_t)v12);
    sub_1C254393C((uint64_t)v12, (uint64_t)v11);
    v10[15] = 1;
    sub_1C2543984();
    sub_1C25F5784();
    v11[0] = 2;
    sub_1C25F5790();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_1C25EDC48()
{
  char *v0;

  return sub_1C25EDAC4(*v0);
}

uint64_t sub_1C25EDC50()
{
  sub_1C25EE644();
  return sub_1C25F5874();
}

uint64_t sub_1C25EDC78()
{
  sub_1C25EE644();
  return sub_1C25F5880();
}

double sub_1C25EDCA0@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  sub_1C25EE688(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_1C25EDCE0(_QWORD *a1)
{
  return sub_1C25EDAE4(a1);
}

uint64_t sub_1C25EDD18()
{
  uint64_t v0;

  if (qword_1EF77A4E0 != -1)
    swift_once();
  v0 = qword_1EF77CEE8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1C25EDD74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF77A4E8 != -1)
    swift_once();
  v2 = sub_1C25F2E98();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EF77CEF8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1C25EDDE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  int v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  uint64_t v26;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v0 = sub_1C25F525C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77AD58);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v28 - v8;
  v10 = sub_1C25F2F94();
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_1C25F003C(0x7072656B61657073, 0xEC000000656E6F68), (v12 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v9, *(_QWORD *)(v10 + 56) + *(_QWORD *)(v1 + 72) * v11, v0);
    v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
    v13(v9, 0, 1, v0);
  }
  else
  {
    v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56);
    v13(v9, 1, 1, v0);
  }
  swift_bridgeObjectRelease();
  v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48);
  if (v14(v9, 1, v0) == 1)
  {
    sub_1C2581FA0((uint64_t)v9);
    v15 = 0;
  }
  else
  {
    v16 = sub_1C25F522C();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
    v15 = v16 & 1;
  }
  v17 = sub_1C25F2F94();
  if (*(_QWORD *)(v17 + 16) && (v18 = sub_1C25F003C(0x74616E6974736564, 0xEC000000736E6F69), (v19 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v7, *(_QWORD *)(v17 + 56) + *(_QWORD *)(v1 + 72) * v18, v0);
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  v13(v7, v20, 1, v0);
  swift_bridgeObjectRelease();
  if (v14(v7, 1, v0) == 1)
  {
    sub_1C2581FA0((uint64_t)v7);
  }
  else
  {
    v21 = sub_1C25F5238();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v7, v0);
    if (v21)
      goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  v21 = MEMORY[0x1E0DEE9D8];
LABEL_16:
  v22 = MEMORY[0x1E0DEE9D8];
  v32 = MEMORY[0x1E0DEE9D8];
  v23 = *(_QWORD *)(v21 + 16);
  if (v23)
  {
    v29 = v15;
    v24 = v21 + ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));
    v30 = *(_QWORD *)(v1 + 72);
    v25 = *(void (**)(char *, unint64_t, uint64_t))(v1 + 16);
    v28 = v21;
    swift_bridgeObjectRetain();
    do
    {
      v25(v3, v24, v0);
      sub_1C25ED6F0((uint64_t)v3, &v31);
      v26 = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      if (v31)
      {
        MEMORY[0x1C3BC2C7C](v26);
        if (*(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1C25F53B8();
        sub_1C25F53DC();
        sub_1C25F53AC();
      }
      v24 += v30;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    v22 = v32;
  }
  swift_bridgeObjectRelease();
  return v22;
}

void sub_1C25EE188(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v4 = objc_msgSend(a1, sel_typeName);
  v5 = sub_1C25F5334();
  v7 = v6;

  v8 = objc_msgSend(a1, sel_backingStore);
  v9 = objc_msgSend(v8, sel_data);

  if (v9)
  {
    v10 = sub_1C25F2A90();
    v12 = v11;

  }
  else
  {

    v10 = 0;
    v12 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
  a2[2] = v10;
  a2[3] = v12;
  a2[4] = 0xD000000000000015;
  a2[5] = 0x80000001C25FCDC0;
}

id sub_1C25EE270()
{
  char v0;
  char v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v25[6];

  sub_1C25EDDE8();
  v1 = v0;
  if (qword_1EF77A400 != -1)
    swift_once();
  v2 = sub_1C25F513C();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EF77CC60);
  swift_bridgeObjectRetain_n();
  v3 = sub_1C25F5130();
  v4 = sub_1C25F5484();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v25[0] = v6;
    *(_DWORD *)v5 = 136315394;
    v7 = sub_1C25EB4FC();
    v8 = swift_bridgeObjectRetain();
    v9 = MEMORY[0x1C3BC2CA0](v8, v7);
    v11 = v10;
    swift_bridgeObjectRelease();
    sub_1C258AF38(v9, v11, v25);
    sub_1C25F5538();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 1024;
    sub_1C25F5538();
    _os_log_impl(&dword_1C2539000, v3, v4, "Building DI for StartCallShim, computed parameters: contacts=%s, isSpeakerphone=%{BOOL}d", (uint8_t *)v5, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x1C3BC3720](v6, -1, -1);
    MEMORY[0x1C3BC3720](v5, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v12 = v1 & 1;
  v13 = objc_allocWithZone(MEMORY[0x1E0CBDC10]);
  sub_1C25EB4FC();
  v14 = (void *)sub_1C25F5388();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithCallRecordFilter_callRecordToCallBack_audioRoute_destinationType_preferredCallProvider_contacts_ttyType_callCapability_, 0, 0, v12, 1, 1, v14, 0, 0);

  v16 = objc_allocWithZone(MEMORY[0x1E0D9C808]);
  v17 = (void *)sub_1C25F5328();
  v18 = objc_msgSend(v16, sel_initWithIdentifier_, v17);

  v19 = v15;
  sub_1C25EE188(v19, v25);
  v20 = (void *)sub_1C25ED3AC();
  sub_1C25EB538((uint64_t)v25);
  if (v20)
  {
    sub_1C2564A04((uint64_t)v20);
    swift_bridgeObjectRelease();
    v20 = (void *)sub_1C25F52BC();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v18, sel_setUserData_, v20);

  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9C800]), sel_init);
  v23 = objc_msgSend(v21, sel_runSiriKitExecutorCommandWithContext_payload_, v22, v18);

  return v23;
}

unint64_t sub_1C25EE5F0()
{
  unint64_t result;

  result = qword_1EF77CBA8;
  if (!qword_1EF77CBA8)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F9078, &type metadata for StartCallShim.StartAudioCallDirectInvocation);
    atomic_store(result, (unint64_t *)&qword_1EF77CBA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for StartCallShim.StartAudioCallDirectInvocation()
{
  return &type metadata for StartCallShim.StartAudioCallDirectInvocation;
}

unint64_t sub_1C25EE644()
{
  unint64_t result;

  result = qword_1EF77CBB8;
  if (!qword_1EF77CBB8)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F9164, &type metadata for StartCallShim.StartAudioCallDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF77CBB8);
  }
  return result;
}

uint64_t sub_1C25EE688@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  unint64_t v18;
  uint64_t result;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CBC0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C25EE644();
  sub_1C25F585C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v24) = 0;
  v9 = sub_1C25F570C();
  v11 = v10;
  v23 = v9;
  v26 = 1;
  sub_1C2543E64();
  swift_bridgeObjectRetain();
  sub_1C25F5724();
  v12 = v24;
  LOBYTE(v24) = 2;
  v21 = v25;
  v22 = v12;
  sub_1C25434F4(v12, v25);
  v13 = sub_1C25F5730();
  v15 = v14;
  v16 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  v18 = v21;
  v17 = v22;
  sub_1C25434F4(v22, v21);
  swift_bridgeObjectRetain();
  sub_1C2543458(v17, v18);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  sub_1C2543458(v17, v18);
  result = swift_bridgeObjectRelease();
  *a2 = v23;
  a2[1] = v11;
  a2[2] = v17;
  a2[3] = v18;
  a2[4] = v16;
  a2[5] = v15;
  return result;
}

uint64_t storeEnumTagSinglePayload for StartCallShim.StartAudioCallDirectInvocation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C25EE94C + 4 * byte_1C25F8FE5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C25EE980 + 4 * byte_1C25F8FE0[v4]))();
}

uint64_t sub_1C25EE980(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C25EE988(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C25EE990);
  return result;
}

uint64_t sub_1C25EE99C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C25EE9A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C25EE9A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C25EE9B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StartCallShim.StartAudioCallDirectInvocation.CodingKeys()
{
  return &type metadata for StartCallShim.StartAudioCallDirectInvocation.CodingKeys;
}

unint64_t sub_1C25EE9D0()
{
  unint64_t result;

  result = qword_1EF77CBC8;
  if (!qword_1EF77CBC8)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F913C, &type metadata for StartCallShim.StartAudioCallDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF77CBC8);
  }
  return result;
}

unint64_t sub_1C25EEA18()
{
  unint64_t result;

  result = qword_1EF77CBD0;
  if (!qword_1EF77CBD0)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F90AC, &type metadata for StartCallShim.StartAudioCallDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF77CBD0);
  }
  return result;
}

unint64_t sub_1C25EEA60()
{
  unint64_t result;

  result = qword_1EF77CBD8;
  if (!qword_1EF77CBD8)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F90D4, &type metadata for StartCallShim.StartAudioCallDirectInvocation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF77CBD8);
  }
  return result;
}

uint64_t sub_1C25EEAA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_1C25EEAC8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;

  v2 = swift_bridgeObjectRetain();
  sub_1C25F05F4(v2, (void (*)(_QWORD, _QWORD))sub_1C25EF9D0);
  swift_bridgeObjectRelease();
  objc_allocWithZone((Class)sub_1C25F507C());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1C25F5070();
  v4 = (void *)sub_1C25F50A0();
  if ((v5 & 1) != 0)
  {
    sub_1C25F084C();
    v8 = swift_allocError();
    *v9 = 1;
    sub_1C25F0890(v4);

  }
  else
  {
    v6 = sub_1C25F0ABC(a1, v4);
    if (v7)
    {
      v8 = v6;
    }
    else
    {
      sub_1C25F084C();
      v8 = swift_allocError();
      *v10 = 2;
    }
    sub_1C25F0890(v4);

  }
  return v8;
}

uint64_t sub_1C25EEC58@<X0>(void *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  BOOL v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint8_t *v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  NSObject *v66;
  os_log_type_t v67;
  _BOOL4 v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  char *v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  id v97;
  unsigned int *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *, uint64_t);
  void (*v103)(char *, uint64_t, uint64_t);
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  id v112;
  _QWORD *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123[3];
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;

  v113 = a2;
  v122 = a4;
  v6 = sub_1C25F5064();
  v119 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v101 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_1C25F4BC0();
  v9 = *(_QWORD *)(v115 - 8);
  MEMORY[0x1E0C80A78](v115);
  v11 = (char *)&v101 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = sub_1C25F4C5C();
  v15 = *(_QWORD *)(v121 - 8);
  MEMORY[0x1E0C80A78](v121);
  v17 = (char *)&v101 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend(a1, sel_tcuId);
  if (v18)
  {
    v19 = v18;
    v118 = v8;
    v114 = v17;
    v20 = sub_1C25F5334();
    v22 = v21;

    v112 = a1;
    v23 = objc_msgSend(a1, sel_speechPackage);
    if (v23)
    {
      v24 = v23;
      v25 = objc_msgSend(v23, sel_recognition);

      if (v25)
      {
        v26 = objc_msgSend(v25, sel_oneBestTranscript);

        v120 = v20;
        v116 = v15;
        if (v26)
        {
          v117 = sub_1C25F5334();
          v28 = v27;

        }
        else
        {
          if (qword_1ED7B0498 != -1)
            swift_once();
          v37 = sub_1C25F513C();
          __swift_project_value_buffer(v37, (uint64_t)qword_1ED7B17B0);
          v38 = sub_1C25F5130();
          v39 = sub_1C25F549C();
          if (os_log_type_enabled(v38, v39))
          {
            v40 = (uint8_t *)swift_slowAlloc();
            v110 = v22;
            v41 = a3;
            v42 = v40;
            *(_WORD *)v40 = 0;
            _os_log_impl(&dword_1C2539000, v38, v39, "Empty utterance from speech package", v40, 2u);
            v43 = v42;
            a3 = v41;
            v20 = v120;
            v22 = v110;
            MEMORY[0x1C3BC3720](v43, -1, -1);
          }

          v117 = 0;
          v28 = 0xE000000000000000;
        }
        v44 = MEMORY[0x1E0DEE9D8];
        v126 = MEMORY[0x1E0DEE9D8];
        v127 = MEMORY[0x1E0DEE9D8];
        v45 = *(_QWORD *)(a3 + 56);
        if (*(_QWORD *)(v45 + 16))
        {
          swift_bridgeObjectRetain();
          v46 = sub_1C25F003C(v20, v22);
          if ((v47 & 1) != 0)
          {
            v48 = *(void **)(*(_QWORD *)(v45 + 56) + 8 * v46);
            v49 = v48;
            swift_bridgeObjectRelease();
            if (v48)
            {
              v50 = v49;
              v44 = sub_1C25F4AB8();

            }
            else
            {
              v44 = MEMORY[0x1E0DEE9D8];
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
        v51 = type metadata accessor for TTProxyInput();
        sub_1C25F1AE4(a3 + *(int *)(v51 + 40), (uint64_t)v14);
        v52 = v116;
        v53 = v121;
        v54 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v116 + 48))(v14, 1, v121);
        v111 = a3;
        if (v54 == 1)
        {
          sub_1C2540B58((uint64_t)v14, &qword_1ED7B0C08);
          v55 = v118;
          v56 = v122;
LABEL_43:
          if (qword_1ED7B0498 != -1)
            swift_once();
          v89 = sub_1C25F513C();
          __swift_project_value_buffer(v89, (uint64_t)qword_1ED7B17B0);
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          v90 = sub_1C25F5130();
          v91 = sub_1C25F5484();
          if (os_log_type_enabled(v90, v91))
          {
            v92 = swift_slowAlloc();
            v93 = swift_slowAlloc();
            v123[0] = v93;
            *(_DWORD *)v92 = 136315394;
            swift_bridgeObjectRetain();
            v125 = sub_1C258AF38(v120, v22, v123);
            sub_1C25F5538();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v92 + 12) = 2080;
            swift_bridgeObjectRetain();
            v125 = sub_1C258AF38(v117, v28, v123);
            sub_1C25F5538();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_1C2539000, v90, v91, "creating candidate for TTManager with tcuId - %s, utterance - %s", (uint8_t *)v92, 0x16u);
            swift_arrayDestroy();
            v94 = v93;
            v55 = v118;
            v56 = v122;
            MEMORY[0x1C3BC3720](v94, -1, -1);
            MEMORY[0x1C3BC3720](v92, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
          }
          v95 = v112;
          v96 = v119;
          v97 = objc_msgSend(v112, sel_speechEvent);
          v98 = (unsigned int *)MEMORY[0x1E0DA7968];
          switch((unint64_t)v97)
          {
            case 1uLL:
              v98 = (unsigned int *)MEMORY[0x1E0DA7958];
              break;
            case 8uLL:
              v98 = (unsigned int *)MEMORY[0x1E0DA7960];
              break;
            case 0x11uLL:
              v98 = (unsigned int *)MEMORY[0x1E0DA7978];
              break;
            case 0x1EuLL:
              break;
            default:
              v98 = (unsigned int *)MEMORY[0x1E0DA7970];
              break;
          }
          (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v55, *v98, v6);
          v99 = objc_msgSend(v95, sel_siriIntendedInfo);
          swift_beginAccess();
          swift_beginAccess();
          sub_1C25F504C();
          v100 = sub_1C25F5058();
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 56))(v56, 0, 1, v100);
        }
        v109 = v6;
        v107 = v44;
        (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v114, v14, v53);
        v58 = v113[3];
        v57 = v113[4];
        v59 = __swift_project_boxed_opaque_existential_1(v113, v58);
        v60 = *MEMORY[0x1E0D9EDA0];
        v61 = v115;
        v103 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
        v103(v11, v60, v115);
        v104 = v59;
        v106 = v58;
        v105 = v57;
        sub_1C25F4C44();
        v102 = *(void (**)(char *, uint64_t))(v9 + 8);
        v102(v11, v61);
        if (v124)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CBE8);
          if (swift_dynamicCast())
          {
            v62 = v125;
            goto LABEL_29;
          }
        }
        else
        {
          sub_1C2540B58((uint64_t)v123, &qword_1ED7B0320);
        }
        v62 = MEMORY[0x1E0DEE9D8];
LABEL_29:
        v110 = v22;
        v127 = v62;
        v63 = qword_1ED7B0498;
        swift_bridgeObjectRetain();
        if (v63 != -1)
          swift_once();
        v64 = sub_1C25F513C();
        v65 = (_QWORD *)__swift_project_value_buffer(v64, (uint64_t)qword_1ED7B17B0);
        swift_bridgeObjectRetain();
        v66 = sub_1C25F5130();
        v67 = sub_1C25F5484();
        v68 = os_log_type_enabled(v66, v67);
        v108 = v28;
        v113 = v65;
        if (v68)
        {
          v69 = (uint8_t *)swift_slowAlloc();
          v70 = swift_slowAlloc();
          v123[0] = v70;
          *(_DWORD *)v69 = 136315138;
          v71 = sub_1C25F2BE0();
          v72 = swift_bridgeObjectRetain();
          v73 = MEMORY[0x1C3BC2CA0](v72, v71);
          v75 = v74;
          swift_bridgeObjectRelease();
          v76 = v73;
          v61 = v115;
          v125 = sub_1C258AF38(v76, v75, v123);
          sub_1C25F5538();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1C2539000, v66, v67, "From SessionState activeTasks: %s", v69, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1C3BC3720](v70, -1, -1);
          MEMORY[0x1C3BC3720](v69, -1, -1);

        }
        else
        {
          swift_bridgeObjectRelease_n();

          swift_bridgeObjectRelease();
        }
        v77 = v102;
        v103(v11, *MEMORY[0x1E0D9EDB0], v61);
        v78 = v114;
        sub_1C25F4C44();
        v77(v11, v61);
        if (v124)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CBE8);
          if (swift_dynamicCast())
          {
            v79 = v125;
LABEL_39:
            v126 = v79;
            swift_bridgeObjectRetain_n();
            v80 = sub_1C25F5130();
            v81 = sub_1C25F5484();
            if (os_log_type_enabled(v80, v81))
            {
              v82 = (uint8_t *)swift_slowAlloc();
              v83 = swift_slowAlloc();
              v123[0] = v83;
              *(_DWORD *)v82 = 136315138;
              v84 = sub_1C25F2BE0();
              v85 = swift_bridgeObjectRetain();
              v86 = MEMORY[0x1C3BC2CA0](v85, v84);
              v88 = v87;
              swift_bridgeObjectRelease();
              v125 = sub_1C258AF38(v86, v88, v123);
              sub_1C25F5538();
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              _os_log_impl(&dword_1C2539000, v80, v81, "From SessionState executedTasks: %s", v82, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x1C3BC3720](v83, -1, -1);
              MEMORY[0x1C3BC3720](v82, -1, -1);

              (*(void (**)(char *, uint64_t))(v116 + 8))(v114, v121);
            }
            else
            {
              swift_bridgeObjectRelease_n();

              (*(void (**)(char *, uint64_t))(v116 + 8))(v78, v121);
            }
            v56 = v122;
            v55 = v118;
            v6 = v109;
            v22 = v110;
            v28 = v108;
            goto LABEL_43;
          }
        }
        else
        {
          sub_1C2540B58((uint64_t)v123, &qword_1ED7B0320);
        }
        v79 = MEMORY[0x1E0DEE9D8];
        goto LABEL_39;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    JUMPOUT(0x1C25EF914);
  }
  if (qword_1ED7B0498 != -1)
    swift_once();
  v29 = sub_1C25F513C();
  __swift_project_value_buffer(v29, (uint64_t)qword_1ED7B17B0);
  v30 = sub_1C25F5130();
  v31 = sub_1C25F5490();
  v32 = os_log_type_enabled(v30, v31);
  v33 = v122;
  if (v32)
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_1C2539000, v30, v31, "unable to read tcuId from trpCandidateMessage - tcuPackage", v34, 2u);
    MEMORY[0x1C3BC3720](v34, -1, -1);
  }

  v35 = sub_1C25F5058();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v33, 1, 1, v35);
}

uint64_t sub_1C25EF98C()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTManagerProxy()
{
  return objc_opt_self();
}

uint64_t sub_1C25EF9D0@<X0>(void *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1C25EEC58(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

_QWORD *sub_1C25EF9D8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B02F8);
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
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C25F0420(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1C25EFAE4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77CC20);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x1E0DEE9D8];
      v12 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1C25F0510(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1C25EFBDC(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C25EFC04(a1, a2, a3, a4, &qword_1EF77CC30, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAEAB0]);
}

uint64_t sub_1C25EFBF0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C25EFC04(a1, a2, a3, a4, &qword_1EF77CC28, (uint64_t (*)(_QWORD))MEMORY[0x1E0DBFED0]);
}

uint64_t sub_1C25EFC04(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_1C25F567C();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C25F09A4(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_1C25EFE10(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C25EFC04(a1, a2, a3, a4, &qword_1EF77CC10, (uint64_t (*)(_QWORD))MEMORY[0x1E0D3AF08]);
}

uint64_t sub_1C25EFE24(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C25EFC04(a1, a2, a3, a4, &qword_1EF77CC08, (uint64_t (*)(_QWORD))MEMORY[0x1E0DC0028]);
}

uint64_t sub_1C25EFE38(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C25EFC04(a1, a2, a3, a4, &qword_1EF77CBF0, (uint64_t (*)(_QWORD))MEMORY[0x1E0D9EA78]);
}

uint64_t sub_1C25EFE4C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C25EFC04(a1, a2, a3, a4, &qword_1EF77CBF8, (uint64_t (*)(_QWORD))MEMORY[0x1E0D9EBC8]);
}

uint64_t sub_1C25EFE60(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1C25EFC04(a1, a2, a3, a4, &qword_1EF77CC00, (uint64_t (*)(_QWORD))MEMORY[0x1E0D9E9A8]);
}

_QWORD *sub_1C25EFE74(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77C7F8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 + 31;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 6);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1C25F089C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1C25EFF80(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_1C25F56DC();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_1C25F0014@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_1C25F003C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C25F5838();
  sub_1C25F534C();
  v4 = sub_1C25F5850();
  return sub_1C25F013C(a1, a2, v4);
}

unint64_t sub_1C25F00A0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C25F55A4();
  return sub_1C25F021C(a1, v2);
}

unint64_t sub_1C25F00D0(uint64_t a1)
{
  uint64_t v2;

  sub_1C25F2AFC();
  sub_1C254354C(&qword_1ED7B0B90, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v2 = sub_1C25F52F8();
  return sub_1C25F02E0(a1, v2);
}

unint64_t sub_1C25F013C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C25F57C0() & 1) == 0)
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
      while (!v14 && (sub_1C25F57C0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1C25F021C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1C25E7170(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1C3BC2EB0](v9, a1);
      sub_1C2552508((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1C25F02E0(uint64_t a1, uint64_t a2)
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
  v5 = sub_1C25F2AFC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
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
      sub_1C254354C(&qword_1ED7B0B98, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
      v14 = sub_1C25F531C();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_1C25F0420(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_1C25F56DC();
  __break(1u);
  return result;
}

char *sub_1C25F0510(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_1C25F56DC();
  __break(1u);
  return result;
}

unint64_t sub_1C25F05F4(uint64_t a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v21[3];
  void (*v22)(_QWORD, _QWORD);
  char *v23;
  uint64_t v24;
  char *v25;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B09C8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1C25F5058();
  v24 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x1E0C80A78](v8);
  v25 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v23 = (char *)v21 - v11;
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
    return MEMORY[0x1E0DEE9D8];
  v21[2] = v2;
  swift_bridgeObjectRetain();
  v21[1] = a1;
  v13 = a1 + 40;
  v14 = MEMORY[0x1E0DEE9D8];
  v22 = a2;
  v15 = v24;
  do
  {
    a2(*(_QWORD *)(v13 - 8), v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v7, 1, v8) == 1)
    {
      sub_1C2540B58((uint64_t)v7, &qword_1ED7B09C8);
    }
    else
    {
      v16 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
      v17 = v23;
      v16(v23, v7, v8);
      v16(v25, v17, v8);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v14 = sub_1C25EFC04(0, *(_QWORD *)(v14 + 16) + 1, 1, v14, (uint64_t *)&unk_1ED7B0B78, (uint64_t (*)(_QWORD))MEMORY[0x1E0DA7948]);
      v19 = *(_QWORD *)(v14 + 16);
      v18 = *(_QWORD *)(v14 + 24);
      if (v19 >= v18 >> 1)
        v14 = sub_1C25EFC04(v18 > 1, v19 + 1, 1, v14, (uint64_t *)&unk_1ED7B0B78, (uint64_t (*)(_QWORD))MEMORY[0x1E0DA7948]);
      *(_QWORD *)(v14 + 16) = v19 + 1;
      v15 = v24;
      v16((char *)(v14+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v24 + 72) * v19), v25, v8);
      a2 = v22;
    }
    v13 += 48;
    --v12;
  }
  while (v12);
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1C25F084C()
{
  unint64_t result;

  result = qword_1EF77CBE0;
  if (!qword_1EF77CBE0)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F92E0, &type metadata for TTManagerProxyingErrors);
    atomic_store(result, (unint64_t *)&qword_1EF77CBE0);
  }
  return result;
}

void sub_1C25F0890(id a1)
{

}

uint64_t sub_1C25F089C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF77C7F0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1C25F56DC();
  __break(1u);
  return result;
}

uint64_t sub_1C25F09A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_1C25F56DC();
  __break(1u);
  return result;
}

uint64_t sub_1C25F0ABC(uint64_t a1, void *a2)
{
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
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint8_t *v49;
  uint64_t v50;
  id v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char v61;
  void (*v62)(char *, uint64_t);
  void (*v63)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t);
  int v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (*v73)(char *, uint64_t, uint64_t);
  uint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char v80;
  void (*v81)(char *, uint64_t);
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  void (*v94)(char *, uint64_t);
  char *v95;
  uint64_t v96;
  void (*v97)(char *, uint64_t);
  NSObject *v98;
  os_log_type_t v99;
  uint8_t *v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t (*v105)(char *, unint64_t, uint64_t);
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char v113;
  void (*v114)(char *, uint64_t);
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  NSObject *v119;
  os_log_type_t v120;
  uint8_t *v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  void (*v125)(char *, uint64_t);
  char *v126;
  void (*v127)(char *, uint64_t);
  NSObject *v128;
  os_log_type_t v129;
  uint8_t *v130;
  int v132;
  uint64_t v133;
  int v134;
  NSObject *v135;
  os_log_type_t v136;
  uint8_t *v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  id v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t (*v159)(char *, unint64_t, uint64_t);
  void (*v160)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;

  v139 = a1;
  v3 = type metadata accessor for TTProxyInput();
  MEMORY[0x1E0C80A78](v3);
  v138 = (uint64_t)&v138 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1C25F5094();
  v158 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v138 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v140 = (char *)&v138 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v138 - v12;
  v14 = MEMORY[0x1E0C80A78](v11);
  v143 = (char *)&v138 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v138 - v17;
  MEMORY[0x1E0C80A78](v16);
  v161 = (char *)&v138 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B09D8);
  v21 = MEMORY[0x1E0C80A78](v20);
  v141 = (char *)&v138 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v21);
  v144 = (char *)&v138 - v24;
  MEMORY[0x1E0C80A78](v23);
  v148 = (char *)&v138 - v25;
  v164 = sub_1C25F50D0();
  v26 = *(_QWORD *)(v164 - 8);
  v27 = MEMORY[0x1E0C80A78](v164);
  v154 = (char *)&v138 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v27);
  v142 = (char *)&v138 - v30;
  v31 = MEMORY[0x1E0C80A78](v29);
  v145 = (char *)&v138 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v156 = (char *)&v138 - v34;
  v35 = MEMORY[0x1E0C80A78](v33);
  v147 = (char *)&v138 - v36;
  v37 = MEMORY[0x1E0C80A78](v35);
  v146 = (char *)&v138 - v38;
  v39 = MEMORY[0x1E0C80A78](v37);
  v41 = (char *)&v138 - v40;
  MEMORY[0x1E0C80A78](v39);
  v149 = (char *)&v138 - v42;
  if (qword_1ED7B0498 != -1)
    swift_once();
  v43 = sub_1C25F513C();
  v44 = __swift_project_value_buffer(v43, (uint64_t)qword_1ED7B17B0);
  v45 = a2;
  v151 = v44;
  v46 = sub_1C25F5130();
  v47 = sub_1C25F5484();
  v48 = os_log_type_enabled(v46, v47);
  v162 = v18;
  v163 = v26;
  v153 = v8;
  v155 = v45;
  v150 = v13;
  if (v48)
  {
    v49 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v49 = 134217984;
    v50 = *(_QWORD *)(sub_1C25F5088() + 16);

    swift_bridgeObjectRelease();
    v167 = v50;
    v51 = v155;
    sub_1C25F5538();

    _os_log_impl(&dword_1C2539000, v46, v47, "received response from ttManager with num TTResults - %ld", v49, 0xCu);
    v52 = v49;
    v26 = v163;
    MEMORY[0x1C3BC3720](v52, -1, -1);

  }
  else
  {

  }
  v152 = sub_1C25F5088();
  v53 = *(_QWORD *)(v152 + 16);
  v54 = v164;
  v55 = v158;
  if (v53)
  {
    v56 = v152 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
    LODWORD(v160) = *MEMORY[0x1E0DA79A8];
    v157 = *(_QWORD *)(v26 + 72);
    v159 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v26 + 16);
    while (1)
    {
      v57 = v159(v41, v56, v54);
      v58 = v161;
      MEMORY[0x1C3BC29B8](v57);
      v59 = v162;
      (*(void (**)(char *, _QWORD, uint64_t))(v55 + 104))(v162, v160, v5);
      sub_1C254354C(&qword_1ED7B09D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA79B8], MEMORY[0x1E0DA79C0]);
      sub_1C25F5370();
      sub_1C25F5370();
      if (v167 == v165 && v168 == v166)
        break;
      v61 = sub_1C25F57C0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v62 = *(void (**)(char *, uint64_t))(v55 + 8);
      v62(v59, v5);
      v62(v58, v5);
      if ((v61 & 1) != 0)
        goto LABEL_16;
      v26 = v163;
      v54 = v164;
      (*(void (**)(char *, uint64_t))(v163 + 8))(v41, v164);
      v56 += v157;
      if (!--v53)
        goto LABEL_14;
    }
    swift_bridgeObjectRelease_n();
    v65 = *(void (**)(char *, uint64_t))(v55 + 8);
    v65(v59, v5);
    v65(v58, v5);
LABEL_16:
    v26 = v163;
    v54 = v164;
    v64 = (uint64_t)v148;
    (*(void (**)(char *, char *, uint64_t))(v163 + 32))(v148, v41, v164);
    v63 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
    v63(v64, 0, 1, v54);
  }
  else
  {
LABEL_14:
    v63 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56);
    v64 = (uint64_t)v148;
    v63((uint64_t)v148, 1, 1, v54);
  }
  swift_bridgeObjectRelease();
  v66 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48);
  v67 = v66(v64, 1, v54);
  v68 = v150;
  if (v67 == 1)
  {
    sub_1C2540B58(v64, &qword_1ED7B09D8);
    v69 = sub_1C25F5088();
    v70 = *(_QWORD *)(v69 + 16);
    v159 = (uint64_t (*)(char *, unint64_t, uint64_t))v66;
    v160 = v63;
    if (v70)
    {
      v71 = *(unsigned __int8 *)(v26 + 80);
      v157 = v69;
      v72 = v69 + ((v71 + 32) & ~v71);
      LODWORD(v162) = *MEMORY[0x1E0DA79A0];
      v161 = *(char **)(v26 + 72);
      v73 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 16);
      v74 = v164;
      v75 = v143;
      v76 = v156;
      v77 = v158;
      while (1)
      {
        v78 = v73(v76, v72, v74);
        MEMORY[0x1C3BC29B8](v78);
        (*(void (**)(char *, _QWORD, uint64_t))(v77 + 104))(v68, v162, v5);
        sub_1C254354C(&qword_1ED7B09D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA79B8], MEMORY[0x1E0DA79C0]);
        sub_1C25F5370();
        sub_1C25F5370();
        if (v167 == v165 && v168 == v166)
          break;
        v80 = sub_1C25F57C0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v81 = *(void (**)(char *, uint64_t))(v77 + 8);
        v81(v68, v5);
        v81(v75, v5);
        if ((v80 & 1) != 0)
          goto LABEL_33;
        v74 = v164;
        v76 = v156;
        (*(void (**)(char *, uint64_t))(v163 + 8))(v156, v164);
        v72 += (uint64_t)v161;
        if (!--v70)
        {
          v82 = 1;
          v26 = v163;
          v83 = v145;
          v84 = (uint64_t)v144;
          goto LABEL_34;
        }
      }
      swift_bridgeObjectRelease_n();
      v97 = *(void (**)(char *, uint64_t))(v77 + 8);
      v97(v68, v5);
      v97(v75, v5);
LABEL_33:
      v26 = v163;
      v74 = v164;
      v84 = (uint64_t)v144;
      (*(void (**)(char *, char *, uint64_t))(v163 + 32))(v144, v156, v164);
      v82 = 0;
      v83 = v145;
LABEL_34:
      v66 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v159;
      v63 = v160;
    }
    else
    {
      v82 = 1;
      v74 = v164;
      v83 = v145;
      v84 = (uint64_t)v144;
    }
    v63(v84, v82, 1, v74);
    swift_bridgeObjectRelease();
    if (v66(v84, 1, v74) == 1)
    {
      sub_1C2540B58(v84, &qword_1ED7B09D8);
      v98 = sub_1C25F5130();
      v99 = sub_1C25F5484();
      if (os_log_type_enabled(v98, v99))
      {
        v100 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v100 = 0;
        _os_log_impl(&dword_1C2539000, v98, v99, "TTProxy result with mitigation decision - mitigated", v100, 2u);
        MEMORY[0x1C3BC3720](v100, -1, -1);
      }

      v101 = sub_1C25F5088();
      v102 = *(_QWORD *)(v101 + 16);
      if (v102)
      {
        v103 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
        v157 = v101;
        v104 = v101 + v103;
        LODWORD(v162) = *MEMORY[0x1E0DA79B0];
        v161 = *(char **)(v26 + 72);
        v105 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v26 + 16);
        v106 = v164;
        v107 = v140;
        v108 = v154;
        v109 = v158;
        while (1)
        {
          v110 = v105(v108, v104, v106);
          MEMORY[0x1C3BC29B8](v110);
          v111 = v153;
          (*(void (**)(char *, _QWORD, uint64_t))(v109 + 104))(v153, v162, v5);
          sub_1C254354C(&qword_1ED7B09D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DA79B8], MEMORY[0x1E0DA79C0]);
          sub_1C25F5370();
          sub_1C25F5370();
          if (v167 == v165 && v168 == v166)
            break;
          v113 = sub_1C25F57C0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v114 = *(void (**)(char *, uint64_t))(v109 + 8);
          v114(v111, v5);
          v114(v107, v5);
          if ((v113 & 1) != 0)
            goto LABEL_53;
          v106 = v164;
          v108 = v154;
          (*(void (**)(char *, uint64_t))(v163 + 8))(v154, v164);
          v104 += (unint64_t)v161;
          if (!--v102)
          {
            v115 = 1;
            v26 = v163;
            v116 = v142;
            v117 = (uint64_t)v141;
            goto LABEL_54;
          }
        }
        swift_bridgeObjectRelease_n();
        v127 = *(void (**)(char *, uint64_t))(v109 + 8);
        v127(v111, v5);
        v127(v107, v5);
LABEL_53:
        v26 = v163;
        v106 = v164;
        v117 = (uint64_t)v141;
        (*(void (**)(char *, char *, uint64_t))(v163 + 32))(v141, v154, v164);
        v115 = 0;
        v116 = v142;
LABEL_54:
        v66 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v159;
        v63 = v160;
      }
      else
      {
        v115 = 1;
        v106 = v164;
        v116 = v142;
        v117 = (uint64_t)v141;
      }
      v63(v117, v115, 1, v106);
      swift_bridgeObjectRelease();
      if (v66(v117, 1, v106) == 1)
      {
        sub_1C2540B58(v117, &qword_1ED7B09D8);
        v128 = sub_1C25F5130();
        v129 = sub_1C25F5490();
        if (os_log_type_enabled(v128, v129))
        {
          v130 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v130 = 0;
          _os_log_impl(&dword_1C2539000, v128, v129, "None of the TCUs are either selected/maybeMitigated/Mitigated - this should not be possible", v130, 2u);
          MEMORY[0x1C3BC3720](v130, -1, -1);
        }

        return 0;
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v116, v117, v106);
        v132 = *(unsigned __int8 *)(v139 + 16);
        v133 = v138;
        sub_1C25F1A64(v139, v138);
        if (v132 == 1)
        {
          sub_1C25F1AA8(v133);
        }
        else
        {
          v134 = *(unsigned __int8 *)(v133 + 17);
          sub_1C25F1AA8(v133);
          if (v134 != 1)
          {
            v96 = sub_1C25F50C4();
            (*(void (**)(char *, uint64_t))(v26 + 8))(v116, v164);
            return v96;
          }
        }
        v135 = sub_1C25F5130();
        v136 = sub_1C25F549C();
        if (os_log_type_enabled(v135, v136))
        {
          v137 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v137 = 0;
          _os_log_impl(&dword_1C2539000, v135, v136, "setting mitigation decision to force mitigated because it's a FF or Announce followup", v137, 2u);
          MEMORY[0x1C3BC3720](v137, -1, -1);
        }

        v96 = sub_1C25F50C4();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v116, v164);
      }
    }
    else
    {
      v118 = v147;
      (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v147, v84, v74);
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v83, v118, v74);
      v119 = sub_1C25F5130();
      v120 = sub_1C25F5484();
      if (os_log_type_enabled(v119, v120))
      {
        v121 = (uint8_t *)swift_slowAlloc();
        v122 = swift_slowAlloc();
        v167 = v122;
        *(_DWORD *)v121 = 136315138;
        v123 = sub_1C25F50C4();
        v165 = sub_1C258AF38(v123, v124, &v167);
        sub_1C25F5538();
        swift_bridgeObjectRelease();
        v125 = *(void (**)(char *, uint64_t))(v26 + 8);
        v125(v83, v74);
        _os_log_impl(&dword_1C2539000, v119, v120, "TTProxy result with TCUId %s and  mitigation decision - maybeMitigated", v121, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3BC3720](v122, -1, -1);
        MEMORY[0x1C3BC3720](v121, -1, -1);
      }
      else
      {
        v125 = *(void (**)(char *, uint64_t))(v26 + 8);
        v125(v83, v74);
      }

      v126 = v147;
      v96 = sub_1C25F50C4();
      v125(v126, v74);
    }
  }
  else
  {
    v85 = v149;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v149, v64, v54);
    v86 = v146;
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v146, v85, v54);
    v87 = v54;
    v88 = sub_1C25F5130();
    v89 = sub_1C25F5484();
    if (os_log_type_enabled(v88, v89))
    {
      v90 = (uint8_t *)swift_slowAlloc();
      v91 = swift_slowAlloc();
      v167 = v91;
      *(_DWORD *)v90 = 136315138;
      v92 = sub_1C25F50C4();
      v165 = sub_1C258AF38(v92, v93, &v167);
      sub_1C25F5538();
      swift_bridgeObjectRelease();
      v94 = *(void (**)(char *, uint64_t))(v26 + 8);
      v94(v86, v87);
      _os_log_impl(&dword_1C2539000, v88, v89, "TTProxy result with TCUId %s and  mitigation decision - selected", v90, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BC3720](v91, -1, -1);
      MEMORY[0x1C3BC3720](v90, -1, -1);
    }
    else
    {
      v94 = *(void (**)(char *, uint64_t))(v26 + 8);
      v94(v86, v87);
    }

    v95 = v149;
    v96 = sub_1C25F50C4();
    v94(v95, v87);
  }
  return v96;
}

uint64_t sub_1C25F1A64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTProxyInput();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C25F1AA8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TTProxyInput();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C25F1AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t storeEnumTagSinglePayload for TTManagerProxyingErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C25F1B78 + 4 * byte_1C25F91F5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1C25F1BAC + 4 * byte_1C25F91F0[v4]))();
}

uint64_t sub_1C25F1BAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C25F1BB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C25F1BBCLL);
  return result;
}

uint64_t sub_1C25F1BC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C25F1BD0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1C25F1BD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C25F1BDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TTManagerProxyingErrors()
{
  return &type metadata for TTManagerProxyingErrors;
}

unint64_t sub_1C25F1BFC()
{
  unint64_t result;

  result = qword_1EF77CC18;
  if (!qword_1EF77CC18)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F92B8, &type metadata for TTManagerProxyingErrors);
    atomic_store(result, (unint64_t *)&qword_1EF77CC18);
  }
  return result;
}

_QWORD *sub_1C25F1C40(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v14 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v14 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
    v6 = a2[4];
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v6;
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v7 = *(int *)(a3 + 40);
    v8 = (void *)(a1 + v7);
    v9 = (char *)a2 + v7;
    *(_QWORD *)(a1 + 56) = a2[7];
    v10 = sub_1C25F4C5C();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v12(v9, 1, v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  return v3;
}

uint64_t sub_1C25F1D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 40);
  v5 = sub_1C25F4C5C();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_1C25F1E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(const void *, uint64_t, uint64_t);
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(int *)(a3 + 40);
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v9 = sub_1C25F4C5C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  return a1;
}

uint64_t sub_1C25F1F28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 40);
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_1C25F4C5C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t sub_1C25F20B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  const void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v4 = *(int *)(a3 + 40);
  v5 = (const void *)(a2 + v4);
  v6 = (void *)(a1 + v4);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  v7 = sub_1C25F4C5C();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
    memcpy(v6, v5, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v6, v5, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  }
  return a1;
}

uint64_t sub_1C25F219C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 40);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = sub_1C25F4C5C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  return a1;
}

uint64_t sub_1C25F22FC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C25F2308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t sub_1C25F2388()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1C25F2394(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7B0C08);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for TTProxyInput()
{
  uint64_t result;

  result = qword_1ED7B0AF0;
  if (!qword_1ED7B0AF0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1C25F2448()
{
  unint64_t v0;

  sub_1C25F24E0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1C25F24E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED7B0C10)
  {
    sub_1C25F4C5C();
    v0 = sub_1C25F552C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED7B0C10);
  }
}

uint64_t storeEnumTagSinglePayload for TTProxyMitigationDecision(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C25F2580 + 4 * byte_1C25F9325[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1C25F25B4 + 4 * byte_1C25F9320[v4]))();
}

uint64_t sub_1C25F25B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C25F25BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C25F25C4);
  return result;
}

uint64_t sub_1C25F25D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C25F25D8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1C25F25DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C25F25E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TTProxyMitigationDecision()
{
  return &type metadata for TTProxyMitigationDecision;
}

uint64_t destroy for TRPInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s24RequestDispatcherBridges7TRPInfoVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for TRPInfo(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for TRPInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TRPInfo(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TRPInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TRPInfo()
{
  return &type metadata for TRPInfo;
}

unint64_t sub_1C25F27AC()
{
  unint64_t result;

  result = qword_1EF77CC38;
  if (!qword_1EF77CC38)
  {
    result = MEMORY[0x1C3BC3648](&unk_1C25F941C, &type metadata for TTProxyMitigationDecision);
    atomic_store(result, (unint64_t *)&qword_1EF77CC38);
  }
  return result;
}

uint64_t sub_1C25F27F0()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1C25F27FC()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1C25F2808()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1C25F2814()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1C25F2820()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1C25F282C()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1C25F2838()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1C25F2844()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1C25F2850()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1C25F285C()
{
  return MEMORY[0x1E0CAE5C0]();
}

uint64_t sub_1C25F2868()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1C25F2874()
{
  return MEMORY[0x1E0CAE6E0]();
}

uint64_t sub_1C25F2880()
{
  return MEMORY[0x1E0CAE6F8]();
}

uint64_t sub_1C25F288C()
{
  return MEMORY[0x1E0CAE930]();
}

uint64_t sub_1C25F2898()
{
  return MEMORY[0x1E0CAE938]();
}

uint64_t sub_1C25F28A4()
{
  return MEMORY[0x1E0CAE940]();
}

uint64_t sub_1C25F28B0()
{
  return MEMORY[0x1E0CAE950]();
}

uint64_t sub_1C25F28BC()
{
  return MEMORY[0x1E0CAE958]();
}

uint64_t sub_1C25F28C8()
{
  return MEMORY[0x1E0CAE968]();
}

uint64_t sub_1C25F28D4()
{
  return MEMORY[0x1E0CAE978]();
}

uint64_t sub_1C25F28E0()
{
  return MEMORY[0x1E0CAE990]();
}

uint64_t sub_1C25F28EC()
{
  return MEMORY[0x1E0CAE9C8]();
}

uint64_t sub_1C25F28F8()
{
  return MEMORY[0x1E0CAE9D0]();
}

uint64_t sub_1C25F2904()
{
  return MEMORY[0x1E0CAE9D8]();
}

uint64_t sub_1C25F2910()
{
  return MEMORY[0x1E0CAE9F0]();
}

uint64_t sub_1C25F291C()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_1C25F2928()
{
  return MEMORY[0x1E0CAEA00]();
}

uint64_t sub_1C25F2934()
{
  return MEMORY[0x1E0CAEA10]();
}

uint64_t sub_1C25F2940()
{
  return MEMORY[0x1E0CAEA18]();
}

uint64_t sub_1C25F294C()
{
  return MEMORY[0x1E0CAEA20]();
}

uint64_t sub_1C25F2958()
{
  return MEMORY[0x1E0CAEA28]();
}

uint64_t sub_1C25F2964()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1C25F2970()
{
  return MEMORY[0x1E0CAEA40]();
}

uint64_t sub_1C25F297C()
{
  return MEMORY[0x1E0CAEA48]();
}

uint64_t sub_1C25F2988()
{
  return MEMORY[0x1E0CAEA50]();
}

uint64_t sub_1C25F2994()
{
  return MEMORY[0x1E0CAEA58]();
}

uint64_t sub_1C25F29A0()
{
  return MEMORY[0x1E0CAEA68]();
}

uint64_t sub_1C25F29AC()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1C25F29B8()
{
  return MEMORY[0x1E0CAEA88]();
}

uint64_t sub_1C25F29C4()
{
  return MEMORY[0x1E0CAEA90]();
}

uint64_t sub_1C25F29D0()
{
  return MEMORY[0x1E0CAEAA0]();
}

uint64_t sub_1C25F29DC()
{
  return MEMORY[0x1E0CAEAA8]();
}

uint64_t sub_1C25F29E8()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1C25F29F4()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1C25F2A00()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1C25F2A0C()
{
  return MEMORY[0x1E0CAEB40]();
}

uint64_t sub_1C25F2A18()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1C25F2A24()
{
  return MEMORY[0x1E0CAF638]();
}

uint64_t sub_1C25F2A30()
{
  return MEMORY[0x1E0CAF668]();
}

uint64_t sub_1C25F2A3C()
{
  return MEMORY[0x1E0CAF670]();
}

uint64_t sub_1C25F2A48()
{
  return MEMORY[0x1E0CAF720]();
}

uint64_t sub_1C25F2A54()
{
  return MEMORY[0x1E0CAF750]();
}

uint64_t sub_1C25F2A60()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1C25F2A6C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C25F2A78()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1C25F2A84()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1C25F2A90()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C25F2A9C()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1C25F2AA8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1C25F2AB4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1C25F2AC0()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1C25F2ACC()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1C25F2AD8()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1C25F2AE4()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1C25F2AF0()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1C25F2AFC()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1C25F2B08()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1C25F2B14()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1C25F2B20()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1C25F2B2C()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1C25F2B38()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1C25F2B44()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1C25F2B50()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1C25F2B5C()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1C25F2B68()
{
  return MEMORY[0x1E0CB1458]();
}

uint64_t sub_1C25F2B74()
{
  return MEMORY[0x1E0CB1460]();
}

uint64_t sub_1C25F2B80()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1C25F2B8C()
{
  return MEMORY[0x1E0DA85C8]();
}

uint64_t sub_1C25F2B98()
{
  return MEMORY[0x1E0DA85D0]();
}

uint64_t sub_1C25F2BA4()
{
  return MEMORY[0x1E0DA85D8]();
}

uint64_t sub_1C25F2BB0()
{
  return MEMORY[0x1E0D9B3D8]();
}

uint64_t sub_1C25F2BBC()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1C25F2BC8()
{
  return MEMORY[0x1E0D20F48]();
}

uint64_t sub_1C25F2BD4()
{
  return MEMORY[0x1E0D20F50]();
}

uint64_t sub_1C25F2BE0()
{
  return MEMORY[0x1E0D9F0B8]();
}

uint64_t sub_1C25F2BEC()
{
  return MEMORY[0x1E0D9F810]();
}

uint64_t sub_1C25F2BF8()
{
  return MEMORY[0x1E0D9F818]();
}

uint64_t sub_1C25F2C04()
{
  return MEMORY[0x1E0D9F820]();
}

uint64_t sub_1C25F2C10()
{
  return MEMORY[0x1E0D9F8A0]();
}

uint64_t sub_1C25F2C1C()
{
  return MEMORY[0x1E0D9F8A8]();
}

uint64_t sub_1C25F2C28()
{
  return MEMORY[0x1E0DA0420]();
}

uint64_t sub_1C25F2C34()
{
  return MEMORY[0x1E0DA0428]();
}

uint64_t sub_1C25F2C40()
{
  return MEMORY[0x1E0DA05E0]();
}

uint64_t sub_1C25F2C4C()
{
  return MEMORY[0x1E0DA0678]();
}

uint64_t sub_1C25F2C58()
{
  return MEMORY[0x1E0DA0688]();
}

uint64_t sub_1C25F2C64()
{
  return MEMORY[0x1E0DA10B8]();
}

uint64_t sub_1C25F2C70()
{
  return MEMORY[0x1E0DA1130]();
}

uint64_t sub_1C25F2C7C()
{
  return MEMORY[0x1E0DA1140]();
}

uint64_t sub_1C25F2C88()
{
  return MEMORY[0x1E0DA1180]();
}

uint64_t sub_1C25F2C94()
{
  return MEMORY[0x1E0DA1188]();
}

uint64_t sub_1C25F2CA0()
{
  return MEMORY[0x1E0DA1190]();
}

uint64_t sub_1C25F2CAC()
{
  return MEMORY[0x1E0DA1198]();
}

uint64_t sub_1C25F2CB8()
{
  return MEMORY[0x1E0DA1248]();
}

uint64_t sub_1C25F2CC4()
{
  return MEMORY[0x1E0DA1258]();
}

uint64_t sub_1C25F2CD0()
{
  return MEMORY[0x1E0DA1268]();
}

uint64_t sub_1C25F2CDC()
{
  return MEMORY[0x1E0DA1278]();
}

uint64_t sub_1C25F2CE8()
{
  return MEMORY[0x1E0DA1280]();
}

uint64_t sub_1C25F2CF4()
{
  return MEMORY[0x1E0DA12B0]();
}

uint64_t sub_1C25F2D00()
{
  return MEMORY[0x1E0DA1378]();
}

uint64_t sub_1C25F2D0C()
{
  return MEMORY[0x1E0DA1388]();
}

uint64_t sub_1C25F2D18()
{
  return MEMORY[0x1E0DA1398]();
}

uint64_t sub_1C25F2D24()
{
  return MEMORY[0x1E0DA1460]();
}

uint64_t sub_1C25F2D30()
{
  return MEMORY[0x1E0DA1510]();
}

uint64_t sub_1C25F2D3C()
{
  return MEMORY[0x1E0DA1678]();
}

uint64_t sub_1C25F2D48()
{
  return MEMORY[0x1E0DA1680]();
}

uint64_t sub_1C25F2D54()
{
  return MEMORY[0x1E0DA1688]();
}

uint64_t sub_1C25F2D60()
{
  return MEMORY[0x1E0DA1690]();
}

uint64_t sub_1C25F2D6C()
{
  return MEMORY[0x1E0DA1698]();
}

uint64_t sub_1C25F2D78()
{
  return MEMORY[0x1E0DA16A0]();
}

uint64_t sub_1C25F2D84()
{
  return MEMORY[0x1E0DA1F68]();
}

uint64_t sub_1C25F2D90()
{
  return MEMORY[0x1E0DA2BC0]();
}

uint64_t sub_1C25F2D9C()
{
  return MEMORY[0x1E0DA7AD0]();
}

uint64_t sub_1C25F2DA8()
{
  return MEMORY[0x1E0DA7AE8]();
}

uint64_t sub_1C25F2DB4()
{
  return MEMORY[0x1E0DA7AF8]();
}

uint64_t sub_1C25F2DC0()
{
  return MEMORY[0x1E0DA7CA0]();
}

uint64_t sub_1C25F2DCC()
{
  return MEMORY[0x1E0DA7CA8]();
}

uint64_t sub_1C25F2DD8()
{
  return MEMORY[0x1E0DA7DD0]();
}

uint64_t sub_1C25F2DE4()
{
  return MEMORY[0x1E0DA7DE8]();
}

uint64_t sub_1C25F2DF0()
{
  return MEMORY[0x1E0DA8168]();
}

uint64_t sub_1C25F2DFC()
{
  return MEMORY[0x1E0DA8180]();
}

uint64_t sub_1C25F2E08()
{
  return MEMORY[0x1E0DA8198]();
}

uint64_t sub_1C25F2E14()
{
  return MEMORY[0x1E0DA81B0]();
}

uint64_t sub_1C25F2E20()
{
  return MEMORY[0x1E0D3ADD0]();
}

uint64_t sub_1C25F2E2C()
{
  return MEMORY[0x1E0D3ADD8]();
}

uint64_t sub_1C25F2E38()
{
  return MEMORY[0x1E0D3ADE0]();
}

uint64_t sub_1C25F2E44()
{
  return MEMORY[0x1E0D3ADF0]();
}

uint64_t sub_1C25F2E50()
{
  return MEMORY[0x1E0D3ADF8]();
}

uint64_t sub_1C25F2E5C()
{
  return MEMORY[0x1E0D3AE00]();
}

uint64_t sub_1C25F2E68()
{
  return MEMORY[0x1E0D3AE10]();
}

uint64_t sub_1C25F2E74()
{
  return MEMORY[0x1E0D3AE18]();
}

uint64_t sub_1C25F2E80()
{
  return MEMORY[0x1E0D3AE28]();
}

uint64_t sub_1C25F2E8C()
{
  return MEMORY[0x1E0D3AE30]();
}

uint64_t sub_1C25F2E98()
{
  return MEMORY[0x1E0D3AE38]();
}

uint64_t sub_1C25F2EA4()
{
  return MEMORY[0x1E0D3AE50]();
}

uint64_t sub_1C25F2EB0()
{
  return MEMORY[0x1E0D3AE58]();
}

uint64_t sub_1C25F2EBC()
{
  return MEMORY[0x1E0D3AE60]();
}

uint64_t sub_1C25F2EC8()
{
  return MEMORY[0x1E0D3AE70]();
}

uint64_t sub_1C25F2ED4()
{
  return MEMORY[0x1E0D3AE78]();
}

uint64_t sub_1C25F2EE0()
{
  return MEMORY[0x1E0D3AE88]();
}

uint64_t sub_1C25F2EEC()
{
  return MEMORY[0x1E0D3AEA0]();
}

uint64_t sub_1C25F2EF8()
{
  return MEMORY[0x1E0D3AEB8]();
}

uint64_t sub_1C25F2F04()
{
  return MEMORY[0x1E0D3AEC0]();
}

uint64_t sub_1C25F2F10()
{
  return MEMORY[0x1E0D3AEC8]();
}

uint64_t sub_1C25F2F1C()
{
  return MEMORY[0x1E0D3AED0]();
}

uint64_t sub_1C25F2F28()
{
  return MEMORY[0x1E0D3AED8]();
}

uint64_t sub_1C25F2F34()
{
  return MEMORY[0x1E0D3AEE0]();
}

uint64_t sub_1C25F2F40()
{
  return MEMORY[0x1E0D3AEE8]();
}

uint64_t sub_1C25F2F4C()
{
  return MEMORY[0x1E0D3AEF8]();
}

uint64_t sub_1C25F2F58()
{
  return MEMORY[0x1E0D3AF00]();
}

uint64_t sub_1C25F2F64()
{
  return MEMORY[0x1E0D3AF08]();
}

uint64_t sub_1C25F2F70()
{
  return MEMORY[0x1E0D3AF18]();
}

uint64_t sub_1C25F2F7C()
{
  return MEMORY[0x1E0D3AF20]();
}

uint64_t sub_1C25F2F88()
{
  return MEMORY[0x1E0D3AF28]();
}

uint64_t sub_1C25F2F94()
{
  return MEMORY[0x1E0D3AF38]();
}

uint64_t sub_1C25F2FA0()
{
  return MEMORY[0x1E0D3AF50]();
}

uint64_t sub_1C25F2FAC()
{
  return MEMORY[0x1E0D3AF60]();
}

uint64_t sub_1C25F2FB8()
{
  return MEMORY[0x1E0D3AF68]();
}

uint64_t sub_1C25F2FC4()
{
  return MEMORY[0x1E0D3AF70]();
}

uint64_t sub_1C25F2FD0()
{
  return MEMORY[0x1E0D3AF78]();
}

uint64_t sub_1C25F2FDC()
{
  return MEMORY[0x1E0D3AF80]();
}

uint64_t sub_1C25F2FE8()
{
  return MEMORY[0x1E0D3AF88]();
}

uint64_t sub_1C25F2FF4()
{
  return MEMORY[0x1E0D3AF90]();
}

uint64_t sub_1C25F3000()
{
  return MEMORY[0x1E0D3AFA0]();
}

uint64_t sub_1C25F300C()
{
  return MEMORY[0x1E0D3AFA8]();
}

uint64_t sub_1C25F3018()
{
  return MEMORY[0x1E0D3AFC0]();
}

uint64_t sub_1C25F3024()
{
  return MEMORY[0x1E0D3AFD8]();
}

uint64_t sub_1C25F3030()
{
  return MEMORY[0x1E0D3AFE8]();
}

uint64_t sub_1C25F303C()
{
  return MEMORY[0x1E0D3AFF8]();
}

uint64_t sub_1C25F3048()
{
  return MEMORY[0x1E0D3B000]();
}

uint64_t sub_1C25F3054()
{
  return MEMORY[0x1E0D3B008]();
}

uint64_t sub_1C25F3060()
{
  return MEMORY[0x1E0D3B010]();
}

uint64_t sub_1C25F306C()
{
  return MEMORY[0x1E0D3B028]();
}

uint64_t sub_1C25F3078()
{
  return MEMORY[0x1E0D3B050]();
}

uint64_t sub_1C25F3084()
{
  return MEMORY[0x1E0D3B060]();
}

uint64_t sub_1C25F3090()
{
  return MEMORY[0x1E0D3B068]();
}

uint64_t sub_1C25F309C()
{
  return MEMORY[0x1E0D3B070]();
}

uint64_t sub_1C25F30A8()
{
  return MEMORY[0x1E0D3B078]();
}

uint64_t sub_1C25F30B4()
{
  return MEMORY[0x1E0D3B080]();
}

uint64_t sub_1C25F30C0()
{
  return MEMORY[0x1E0D3B088]();
}

uint64_t sub_1C25F30CC()
{
  return MEMORY[0x1E0D3B090]();
}

uint64_t sub_1C25F30D8()
{
  return MEMORY[0x1E0D3B098]();
}

uint64_t sub_1C25F30E4()
{
  return MEMORY[0x1E0D3B0A0]();
}

uint64_t sub_1C25F30F0()
{
  return MEMORY[0x1E0D3B0A8]();
}

uint64_t sub_1C25F30FC()
{
  return MEMORY[0x1E0D3B0B0]();
}

uint64_t sub_1C25F3108()
{
  return MEMORY[0x1E0D3B0C0]();
}

uint64_t sub_1C25F3114()
{
  return MEMORY[0x1E0D3B0E0]();
}

uint64_t sub_1C25F3120()
{
  return MEMORY[0x1E0D3B0E8]();
}

uint64_t sub_1C25F312C()
{
  return MEMORY[0x1E0D3B108]();
}

uint64_t sub_1C25F3138()
{
  return MEMORY[0x1E0D3B118]();
}

uint64_t sub_1C25F3144()
{
  return MEMORY[0x1E0D3B128]();
}

uint64_t sub_1C25F3150()
{
  return MEMORY[0x1E0D3B130]();
}

uint64_t sub_1C25F315C()
{
  return MEMORY[0x1E0D3B148]();
}

uint64_t sub_1C25F3168()
{
  return MEMORY[0x1E0D3B158]();
}

uint64_t sub_1C25F3174()
{
  return MEMORY[0x1E0D3B170]();
}

uint64_t sub_1C25F3180()
{
  return MEMORY[0x1E0D3B188]();
}

uint64_t sub_1C25F318C()
{
  return MEMORY[0x1E0D3B190]();
}

uint64_t sub_1C25F3198()
{
  return MEMORY[0x1E0D3B1A0]();
}

uint64_t sub_1C25F31A4()
{
  return MEMORY[0x1E0D3B1C0]();
}

uint64_t sub_1C25F31B0()
{
  return MEMORY[0x1E0D3B1E0]();
}

uint64_t sub_1C25F31BC()
{
  return MEMORY[0x1E0D3B1E8]();
}

uint64_t sub_1C25F31C8()
{
  return MEMORY[0x1E0D3B1F0]();
}

uint64_t sub_1C25F31D4()
{
  return MEMORY[0x1E0D3B1F8]();
}

uint64_t sub_1C25F31E0()
{
  return MEMORY[0x1E0D3B200]();
}

uint64_t sub_1C25F31EC()
{
  return MEMORY[0x1E0D3B208]();
}

uint64_t sub_1C25F31F8()
{
  return MEMORY[0x1E0D3B210]();
}

uint64_t sub_1C25F3204()
{
  return MEMORY[0x1E0D3B218]();
}

uint64_t sub_1C25F3210()
{
  return MEMORY[0x1E0D3B220]();
}

uint64_t sub_1C25F321C()
{
  return MEMORY[0x1E0D3B248]();
}

uint64_t sub_1C25F3228()
{
  return MEMORY[0x1E0D3B250]();
}

uint64_t sub_1C25F3234()
{
  return MEMORY[0x1E0D3B278]();
}

uint64_t sub_1C25F3240()
{
  return MEMORY[0x1E0D3B288]();
}

uint64_t sub_1C25F324C()
{
  return MEMORY[0x1E0D3B298]();
}

uint64_t sub_1C25F3258()
{
  return MEMORY[0x1E0D3B2A0]();
}

uint64_t sub_1C25F3264()
{
  return MEMORY[0x1E0D3B2A8]();
}

uint64_t sub_1C25F3270()
{
  return MEMORY[0x1E0D3B2B0]();
}

uint64_t sub_1C25F327C()
{
  return MEMORY[0x1E0D3B2B8]();
}

uint64_t sub_1C25F3288()
{
  return MEMORY[0x1E0D3B2C0]();
}

uint64_t sub_1C25F3294()
{
  return MEMORY[0x1E0D3B2D0]();
}

uint64_t sub_1C25F32A0()
{
  return MEMORY[0x1E0D3B2E0]();
}

uint64_t sub_1C25F32AC()
{
  return MEMORY[0x1E0D3B2E8]();
}

uint64_t sub_1C25F32B8()
{
  return MEMORY[0x1E0D3B2F0]();
}

uint64_t sub_1C25F32C4()
{
  return MEMORY[0x1E0D3B2F8]();
}

uint64_t sub_1C25F32D0()
{
  return MEMORY[0x1E0D3B300]();
}

uint64_t sub_1C25F32DC()
{
  return MEMORY[0x1E0D3B348]();
}

uint64_t sub_1C25F32E8()
{
  return MEMORY[0x1E0D3B358]();
}

uint64_t sub_1C25F32F4()
{
  return MEMORY[0x1E0D3B360]();
}

uint64_t sub_1C25F3300()
{
  return MEMORY[0x1E0D3B370]();
}

uint64_t sub_1C25F330C()
{
  return MEMORY[0x1E0D3B378]();
}

uint64_t sub_1C25F3318()
{
  return MEMORY[0x1E0D3B398]();
}

uint64_t sub_1C25F3324()
{
  return MEMORY[0x1E0D3B3A0]();
}

uint64_t sub_1C25F3330()
{
  return MEMORY[0x1E0D3B3A8]();
}

uint64_t sub_1C25F333C()
{
  return MEMORY[0x1E0D3B3B0]();
}

uint64_t sub_1C25F3348()
{
  return MEMORY[0x1E0D3B3B8]();
}

uint64_t sub_1C25F3354()
{
  return MEMORY[0x1E0D3B3C0]();
}

uint64_t sub_1C25F3360()
{
  return MEMORY[0x1E0D3B3C8]();
}

uint64_t sub_1C25F336C()
{
  return MEMORY[0x1E0D3B3D8]();
}

uint64_t sub_1C25F3378()
{
  return MEMORY[0x1E0D3B3E0]();
}

uint64_t sub_1C25F3384()
{
  return MEMORY[0x1E0D3B3F0]();
}

uint64_t sub_1C25F3390()
{
  return MEMORY[0x1E0D3B400]();
}

uint64_t sub_1C25F339C()
{
  return MEMORY[0x1E0D3B410]();
}

uint64_t sub_1C25F33A8()
{
  return MEMORY[0x1E0D3B418]();
}

uint64_t sub_1C25F33B4()
{
  return MEMORY[0x1E0D3B428]();
}

uint64_t sub_1C25F33C0()
{
  return MEMORY[0x1E0D3B438]();
}

uint64_t sub_1C25F33CC()
{
  return MEMORY[0x1E0D3B440]();
}

uint64_t sub_1C25F33D8()
{
  return MEMORY[0x1E0D3B448]();
}

uint64_t sub_1C25F33E4()
{
  return MEMORY[0x1E0D3B450]();
}

uint64_t sub_1C25F33F0()
{
  return MEMORY[0x1E0D3B458]();
}

uint64_t sub_1C25F33FC()
{
  return MEMORY[0x1E0D3B460]();
}

uint64_t sub_1C25F3408()
{
  return MEMORY[0x1E0D3B468]();
}

uint64_t sub_1C25F3414()
{
  return MEMORY[0x1E0D3B470]();
}

uint64_t sub_1C25F3420()
{
  return MEMORY[0x1E0D3B480]();
}

uint64_t sub_1C25F342C()
{
  return MEMORY[0x1E0D3B488]();
}

uint64_t sub_1C25F3438()
{
  return MEMORY[0x1E0D3B490]();
}

uint64_t sub_1C25F3444()
{
  return MEMORY[0x1E0D3B498]();
}

uint64_t sub_1C25F3450()
{
  return MEMORY[0x1E0D3B4B8]();
}

uint64_t sub_1C25F345C()
{
  return MEMORY[0x1E0D3B4C8]();
}

uint64_t sub_1C25F3468()
{
  return MEMORY[0x1E0D3B4D8]();
}

uint64_t sub_1C25F3474()
{
  return MEMORY[0x1E0D3B4E0]();
}

uint64_t sub_1C25F3480()
{
  return MEMORY[0x1E0D3B4E8]();
}

uint64_t sub_1C25F348C()
{
  return MEMORY[0x1E0D3B4F0]();
}

uint64_t sub_1C25F3498()
{
  return MEMORY[0x1E0D3B4F8]();
}

uint64_t sub_1C25F34A4()
{
  return MEMORY[0x1E0D9C888]();
}

uint64_t sub_1C25F34B0()
{
  return MEMORY[0x1E0D9C898]();
}

uint64_t sub_1C25F34BC()
{
  return MEMORY[0x1E0D9C8C0]();
}

uint64_t sub_1C25F34C8()
{
  return MEMORY[0x1E0D9C910]();
}

uint64_t sub_1C25F34D4()
{
  return MEMORY[0x1E0D9C918]();
}

uint64_t sub_1C25F34E0()
{
  return MEMORY[0x1E0D9C938]();
}

uint64_t sub_1C25F34EC()
{
  return MEMORY[0x1E0D9C948]();
}

uint64_t sub_1C25F34F8()
{
  return MEMORY[0x1E0D9C978]();
}

uint64_t sub_1C25F3504()
{
  return MEMORY[0x1E0D9C998]();
}

uint64_t sub_1C25F3510()
{
  return MEMORY[0x1E0D9C9A0]();
}

uint64_t sub_1C25F351C()
{
  return MEMORY[0x1E0D9C9A8]();
}

uint64_t sub_1C25F3528()
{
  return MEMORY[0x1E0D9C9B0]();
}

uint64_t sub_1C25F3534()
{
  return MEMORY[0x1E0D9C9B8]();
}

uint64_t sub_1C25F3540()
{
  return MEMORY[0x1E0D9C9C0]();
}

uint64_t sub_1C25F354C()
{
  return MEMORY[0x1E0D9C9C8]();
}

uint64_t sub_1C25F3558()
{
  return MEMORY[0x1E0D9C9D0]();
}

uint64_t sub_1C25F3564()
{
  return MEMORY[0x1E0D9C9D8]();
}

uint64_t sub_1C25F3570()
{
  return MEMORY[0x1E0D9C9E0]();
}

uint64_t sub_1C25F357C()
{
  return MEMORY[0x1E0D9C9E8]();
}

uint64_t sub_1C25F3588()
{
  return MEMORY[0x1E0D9C9F0]();
}

uint64_t sub_1C25F3594()
{
  return MEMORY[0x1E0D9C9F8]();
}

uint64_t sub_1C25F35A0()
{
  return MEMORY[0x1E0D9CA20]();
}

uint64_t sub_1C25F35AC()
{
  return MEMORY[0x1E0D9CA28]();
}

uint64_t sub_1C25F35B8()
{
  return MEMORY[0x1E0D9CA30]();
}

uint64_t sub_1C25F35C4()
{
  return MEMORY[0x1E0D9CA78]();
}

uint64_t sub_1C25F35D0()
{
  return MEMORY[0x1E0D9CA80]();
}

uint64_t sub_1C25F35DC()
{
  return MEMORY[0x1E0D9CA88]();
}

uint64_t sub_1C25F35E8()
{
  return MEMORY[0x1E0D9CA90]();
}

uint64_t sub_1C25F35F4()
{
  return MEMORY[0x1E0D9CA98]();
}

uint64_t sub_1C25F3600()
{
  return MEMORY[0x1E0D9CAA0]();
}

uint64_t sub_1C25F360C()
{
  return MEMORY[0x1E0D9CAA8]();
}

uint64_t sub_1C25F3618()
{
  return MEMORY[0x1E0D9CAB0]();
}

uint64_t sub_1C25F3624()
{
  return MEMORY[0x1E0D9CAB8]();
}

uint64_t sub_1C25F3630()
{
  return MEMORY[0x1E0D9CAC0]();
}

uint64_t sub_1C25F363C()
{
  return MEMORY[0x1E0D9CAD0]();
}

uint64_t sub_1C25F3648()
{
  return MEMORY[0x1E0D9CAD8]();
}

uint64_t sub_1C25F3654()
{
  return MEMORY[0x1E0D9CAE0]();
}

uint64_t sub_1C25F3660()
{
  return MEMORY[0x1E0D9CAE8]();
}

uint64_t sub_1C25F366C()
{
  return MEMORY[0x1E0D9CAF0]();
}

uint64_t sub_1C25F3678()
{
  return MEMORY[0x1E0D9CAF8]();
}

uint64_t sub_1C25F3684()
{
  return MEMORY[0x1E0D9CB00]();
}

uint64_t sub_1C25F3690()
{
  return MEMORY[0x1E0D9CB08]();
}

uint64_t sub_1C25F369C()
{
  return MEMORY[0x1E0D9CB18]();
}

uint64_t sub_1C25F36A8()
{
  return MEMORY[0x1E0D9CB20]();
}

uint64_t sub_1C25F36B4()
{
  return MEMORY[0x1E0D9CB28]();
}

uint64_t sub_1C25F36C0()
{
  return MEMORY[0x1E0D9CB30]();
}

uint64_t sub_1C25F36CC()
{
  return MEMORY[0x1E0D9CB38]();
}

uint64_t sub_1C25F36D8()
{
  return MEMORY[0x1E0D9CB40]();
}

uint64_t sub_1C25F36E4()
{
  return MEMORY[0x1E0D9CB48]();
}

uint64_t sub_1C25F36F0()
{
  return MEMORY[0x1E0D9CB50]();
}

uint64_t sub_1C25F36FC()
{
  return MEMORY[0x1E0D9CB58]();
}

uint64_t sub_1C25F3708()
{
  return MEMORY[0x1E0D9CB60]();
}

uint64_t sub_1C25F3714()
{
  return MEMORY[0x1E0D9CB68]();
}

uint64_t sub_1C25F3720()
{
  return MEMORY[0x1E0D9CB70]();
}

uint64_t sub_1C25F372C()
{
  return MEMORY[0x1E0D9CB78]();
}

uint64_t sub_1C25F3738()
{
  return MEMORY[0x1E0D9CB80]();
}

uint64_t sub_1C25F3744()
{
  return MEMORY[0x1E0D9CB88]();
}

uint64_t sub_1C25F3750()
{
  return MEMORY[0x1E0D9CB90]();
}

uint64_t sub_1C25F375C()
{
  return MEMORY[0x1E0D9CBE8]();
}

uint64_t sub_1C25F3768()
{
  return MEMORY[0x1E0D9CBF0]();
}

uint64_t sub_1C25F3774()
{
  return MEMORY[0x1E0D9CBF8]();
}

uint64_t sub_1C25F3780()
{
  return MEMORY[0x1E0D9CC00]();
}

uint64_t sub_1C25F378C()
{
  return MEMORY[0x1E0D9CC08]();
}

uint64_t sub_1C25F3798()
{
  return MEMORY[0x1E0D9CC10]();
}

uint64_t sub_1C25F37A4()
{
  return MEMORY[0x1E0D9CC18]();
}

uint64_t sub_1C25F37B0()
{
  return MEMORY[0x1E0D9CC20]();
}

uint64_t sub_1C25F37BC()
{
  return MEMORY[0x1E0D9CC28]();
}

uint64_t sub_1C25F37C8()
{
  return MEMORY[0x1E0D9CC30]();
}

uint64_t sub_1C25F37D4()
{
  return MEMORY[0x1E0D9CC38]();
}

uint64_t sub_1C25F37E0()
{
  return MEMORY[0x1E0D9CC40]();
}

uint64_t sub_1C25F37EC()
{
  return MEMORY[0x1E0D9CD28]();
}

uint64_t sub_1C25F37F8()
{
  return MEMORY[0x1E0D9CD30]();
}

uint64_t sub_1C25F3804()
{
  return MEMORY[0x1E0D9CD48]();
}

uint64_t sub_1C25F3810()
{
  return MEMORY[0x1E0D9CD88]();
}

uint64_t sub_1C25F381C()
{
  return MEMORY[0x1E0D9CD98]();
}

uint64_t sub_1C25F3828()
{
  return MEMORY[0x1E0D9CDA0]();
}

uint64_t sub_1C25F3834()
{
  return MEMORY[0x1E0D9CDA8]();
}

uint64_t sub_1C25F3840()
{
  return MEMORY[0x1E0D9CDB0]();
}

uint64_t sub_1C25F384C()
{
  return MEMORY[0x1E0D9CDB8]();
}

uint64_t sub_1C25F3858()
{
  return MEMORY[0x1E0D9CDC0]();
}

uint64_t sub_1C25F3864()
{
  return MEMORY[0x1E0D9CDC8]();
}

uint64_t sub_1C25F3870()
{
  return MEMORY[0x1E0D9CDD0]();
}

uint64_t sub_1C25F387C()
{
  return MEMORY[0x1E0D9CDD8]();
}

uint64_t sub_1C25F3888()
{
  return MEMORY[0x1E0D9CDE0]();
}

uint64_t sub_1C25F3894()
{
  return MEMORY[0x1E0D9CDE8]();
}

uint64_t sub_1C25F38A0()
{
  return MEMORY[0x1E0D9CDF0]();
}

uint64_t sub_1C25F38AC()
{
  return MEMORY[0x1E0D9CDF8]();
}

uint64_t sub_1C25F38B8()
{
  return MEMORY[0x1E0D9CE00]();
}

uint64_t sub_1C25F38C4()
{
  return MEMORY[0x1E0D9CE10]();
}

uint64_t sub_1C25F38D0()
{
  return MEMORY[0x1E0D9CE18]();
}

uint64_t sub_1C25F38DC()
{
  return MEMORY[0x1E0D9CE20]();
}

uint64_t sub_1C25F38E8()
{
  return MEMORY[0x1E0D9CE28]();
}

uint64_t sub_1C25F38F4()
{
  return MEMORY[0x1E0D9CE30]();
}

uint64_t sub_1C25F3900()
{
  return MEMORY[0x1E0D9CE38]();
}

uint64_t sub_1C25F390C()
{
  return MEMORY[0x1E0D9CE40]();
}

uint64_t sub_1C25F3918()
{
  return MEMORY[0x1E0D9CE48]();
}

uint64_t sub_1C25F3924()
{
  return MEMORY[0x1E0D9CE50]();
}

uint64_t sub_1C25F3930()
{
  return MEMORY[0x1E0D9CEC0]();
}

uint64_t sub_1C25F393C()
{
  return MEMORY[0x1E0D9CEC8]();
}

uint64_t sub_1C25F3948()
{
  return MEMORY[0x1E0D9CED0]();
}

uint64_t sub_1C25F3954()
{
  return MEMORY[0x1E0D9CED8]();
}

uint64_t sub_1C25F3960()
{
  return MEMORY[0x1E0D9CEE0]();
}

uint64_t sub_1C25F396C()
{
  return MEMORY[0x1E0D9CEE8]();
}

uint64_t sub_1C25F3978()
{
  return MEMORY[0x1E0D9CEF0]();
}

uint64_t sub_1C25F3984()
{
  return MEMORY[0x1E0D9CEF8]();
}

uint64_t sub_1C25F3990()
{
  return MEMORY[0x1E0D9CF00]();
}

uint64_t sub_1C25F399C()
{
  return MEMORY[0x1E0D9CF08]();
}

uint64_t sub_1C25F39A8()
{
  return MEMORY[0x1E0D9CF10]();
}

uint64_t sub_1C25F39B4()
{
  return MEMORY[0x1E0D9CF18]();
}

uint64_t sub_1C25F39C0()
{
  return MEMORY[0x1E0D9CF20]();
}

uint64_t sub_1C25F39CC()
{
  return MEMORY[0x1E0D9CF28]();
}

uint64_t sub_1C25F39D8()
{
  return MEMORY[0x1E0D9CF30]();
}

uint64_t sub_1C25F39E4()
{
  return MEMORY[0x1E0D9CF38]();
}

uint64_t sub_1C25F39F0()
{
  return MEMORY[0x1E0D9CF48]();
}

uint64_t sub_1C25F39FC()
{
  return MEMORY[0x1E0D9CF50]();
}

uint64_t sub_1C25F3A08()
{
  return MEMORY[0x1E0D9D0F8]();
}

uint64_t sub_1C25F3A14()
{
  return MEMORY[0x1E0D9D110]();
}

uint64_t sub_1C25F3A20()
{
  return MEMORY[0x1E0D9D128]();
}

uint64_t sub_1C25F3A2C()
{
  return MEMORY[0x1E0D9D130]();
}

uint64_t sub_1C25F3A38()
{
  return MEMORY[0x1E0D9D140]();
}

uint64_t sub_1C25F3A44()
{
  return MEMORY[0x1E0D9D148]();
}

uint64_t sub_1C25F3A50()
{
  return MEMORY[0x1E0D9D150]();
}

uint64_t sub_1C25F3A5C()
{
  return MEMORY[0x1E0D9D158]();
}

uint64_t sub_1C25F3A68()
{
  return MEMORY[0x1E0D9D170]();
}

uint64_t sub_1C25F3A74()
{
  return MEMORY[0x1E0D9D180]();
}

uint64_t sub_1C25F3A80()
{
  return MEMORY[0x1E0D9D188]();
}

uint64_t sub_1C25F3A8C()
{
  return MEMORY[0x1E0D9D190]();
}

uint64_t sub_1C25F3A98()
{
  return MEMORY[0x1E0D9D198]();
}

uint64_t sub_1C25F3AA4()
{
  return MEMORY[0x1E0D9D248]();
}

uint64_t sub_1C25F3AB0()
{
  return MEMORY[0x1E0D9D250]();
}

uint64_t sub_1C25F3ABC()
{
  return MEMORY[0x1E0D9D258]();
}

uint64_t sub_1C25F3AC8()
{
  return MEMORY[0x1E0D9D260]();
}

uint64_t sub_1C25F3AD4()
{
  return MEMORY[0x1E0D9D268]();
}

uint64_t sub_1C25F3AE0()
{
  return MEMORY[0x1E0D9D2E0]();
}

uint64_t sub_1C25F3AEC()
{
  return MEMORY[0x1E0D9D2E8]();
}

uint64_t sub_1C25F3AF8()
{
  return MEMORY[0x1E0D9D338]();
}

uint64_t sub_1C25F3B04()
{
  return MEMORY[0x1E0D9D340]();
}

uint64_t sub_1C25F3B10()
{
  return MEMORY[0x1E0D9D348]();
}

uint64_t sub_1C25F3B1C()
{
  return MEMORY[0x1E0D9D350]();
}

uint64_t sub_1C25F3B28()
{
  return MEMORY[0x1E0D9D358]();
}

uint64_t sub_1C25F3B34()
{
  return MEMORY[0x1E0D9D360]();
}

uint64_t sub_1C25F3B40()
{
  return MEMORY[0x1E0D9D368]();
}

uint64_t sub_1C25F3B4C()
{
  return MEMORY[0x1E0D9D370]();
}

uint64_t sub_1C25F3B58()
{
  return MEMORY[0x1E0D9D378]();
}

uint64_t sub_1C25F3B64()
{
  return MEMORY[0x1E0D9D380]();
}

uint64_t sub_1C25F3B70()
{
  return MEMORY[0x1E0D9D388]();
}

uint64_t sub_1C25F3B7C()
{
  return MEMORY[0x1E0D9D390]();
}

uint64_t sub_1C25F3B88()
{
  return MEMORY[0x1E0D9D398]();
}

uint64_t sub_1C25F3B94()
{
  return MEMORY[0x1E0D9D3A0]();
}

uint64_t sub_1C25F3BA0()
{
  return MEMORY[0x1E0D9D3A8]();
}

uint64_t sub_1C25F3BAC()
{
  return MEMORY[0x1E0D9D3C0]();
}

uint64_t sub_1C25F3BB8()
{
  return MEMORY[0x1E0D9D3C8]();
}

uint64_t sub_1C25F3BC4()
{
  return MEMORY[0x1E0D9D3D0]();
}

uint64_t sub_1C25F3BD0()
{
  return MEMORY[0x1E0D9D3D8]();
}

uint64_t sub_1C25F3BDC()
{
  return MEMORY[0x1E0D9D3E0]();
}

uint64_t sub_1C25F3BE8()
{
  return MEMORY[0x1E0D9D3E8]();
}

uint64_t sub_1C25F3BF4()
{
  return MEMORY[0x1E0D9D3F0]();
}

uint64_t sub_1C25F3C00()
{
  return MEMORY[0x1E0D9D400]();
}

uint64_t sub_1C25F3C0C()
{
  return MEMORY[0x1E0D9D478]();
}

uint64_t sub_1C25F3C18()
{
  return MEMORY[0x1E0D9D480]();
}

uint64_t sub_1C25F3C24()
{
  return MEMORY[0x1E0D9D4E8]();
}

uint64_t sub_1C25F3C30()
{
  return MEMORY[0x1E0D9D518]();
}

uint64_t sub_1C25F3C3C()
{
  return MEMORY[0x1E0D9D520]();
}

uint64_t sub_1C25F3C48()
{
  return MEMORY[0x1E0D9D528]();
}

uint64_t sub_1C25F3C54()
{
  return MEMORY[0x1E0D9D530]();
}

uint64_t sub_1C25F3C60()
{
  return MEMORY[0x1E0D9D538]();
}

uint64_t sub_1C25F3C6C()
{
  return MEMORY[0x1E0D9D540]();
}

uint64_t sub_1C25F3C78()
{
  return MEMORY[0x1E0D9D548]();
}

uint64_t sub_1C25F3C84()
{
  return MEMORY[0x1E0D9D550]();
}

uint64_t sub_1C25F3C90()
{
  return MEMORY[0x1E0D9D558]();
}

uint64_t sub_1C25F3C9C()
{
  return MEMORY[0x1E0D9D560]();
}

uint64_t sub_1C25F3CA8()
{
  return MEMORY[0x1E0D9D568]();
}

uint64_t sub_1C25F3CB4()
{
  return MEMORY[0x1E0D9D578]();
}

uint64_t sub_1C25F3CC0()
{
  return MEMORY[0x1E0D9D580]();
}

uint64_t sub_1C25F3CCC()
{
  return MEMORY[0x1E0D9D600]();
}

uint64_t sub_1C25F3CD8()
{
  return MEMORY[0x1E0D9D608]();
}

uint64_t sub_1C25F3CE4()
{
  return MEMORY[0x1E0D9D610]();
}

uint64_t sub_1C25F3CF0()
{
  return MEMORY[0x1E0D9D618]();
}

uint64_t sub_1C25F3CFC()
{
  return MEMORY[0x1E0D9D620]();
}

uint64_t sub_1C25F3D08()
{
  return MEMORY[0x1E0D9D628]();
}

uint64_t sub_1C25F3D14()
{
  return MEMORY[0x1E0D9D630]();
}

uint64_t sub_1C25F3D20()
{
  return MEMORY[0x1E0D9D638]();
}

uint64_t sub_1C25F3D2C()
{
  return MEMORY[0x1E0D9D640]();
}

uint64_t sub_1C25F3D38()
{
  return MEMORY[0x1E0D9D670]();
}

uint64_t sub_1C25F3D44()
{
  return MEMORY[0x1E0D9D680]();
}

uint64_t sub_1C25F3D50()
{
  return MEMORY[0x1E0D9D688]();
}

uint64_t sub_1C25F3D5C()
{
  return MEMORY[0x1E0D9D690]();
}

uint64_t sub_1C25F3D68()
{
  return MEMORY[0x1E0D9D6D8]();
}

uint64_t sub_1C25F3D74()
{
  return MEMORY[0x1E0D9D6F0]();
}

uint64_t sub_1C25F3D80()
{
  return MEMORY[0x1E0D9D700]();
}

uint64_t sub_1C25F3D8C()
{
  return MEMORY[0x1E0D9D738]();
}

uint64_t sub_1C25F3D98()
{
  return MEMORY[0x1E0D9D7D0]();
}

uint64_t sub_1C25F3DA4()
{
  return MEMORY[0x1E0D9D7D8]();
}

uint64_t sub_1C25F3DB0()
{
  return MEMORY[0x1E0D9D7E0]();
}

uint64_t sub_1C25F3DBC()
{
  return MEMORY[0x1E0D9D7E8]();
}

uint64_t sub_1C25F3DC8()
{
  return MEMORY[0x1E0D9D7F0]();
}

uint64_t sub_1C25F3DD4()
{
  return MEMORY[0x1E0D9D7F8]();
}

uint64_t sub_1C25F3DE0()
{
  return MEMORY[0x1E0D9D800]();
}

uint64_t sub_1C25F3DEC()
{
  return MEMORY[0x1E0D9D810]();
}

uint64_t sub_1C25F3DF8()
{
  return MEMORY[0x1E0D9D820]();
}

uint64_t sub_1C25F3E04()
{
  return MEMORY[0x1E0D9D828]();
}

uint64_t sub_1C25F3E10()
{
  return MEMORY[0x1E0D9D830]();
}

uint64_t sub_1C25F3E1C()
{
  return MEMORY[0x1E0D9D838]();
}

uint64_t sub_1C25F3E28()
{
  return MEMORY[0x1E0D9D840]();
}

uint64_t sub_1C25F3E34()
{
  return MEMORY[0x1E0D9D848]();
}

uint64_t sub_1C25F3E40()
{
  return MEMORY[0x1E0D9D850]();
}

uint64_t sub_1C25F3E4C()
{
  return MEMORY[0x1E0D9D858]();
}

uint64_t sub_1C25F3E58()
{
  return MEMORY[0x1E0D9D860]();
}

uint64_t sub_1C25F3E64()
{
  return MEMORY[0x1E0D9D868]();
}

uint64_t sub_1C25F3E70()
{
  return MEMORY[0x1E0D9D870]();
}

uint64_t sub_1C25F3E7C()
{
  return MEMORY[0x1E0D9D878]();
}

uint64_t sub_1C25F3E88()
{
  return MEMORY[0x1E0D9D888]();
}

uint64_t sub_1C25F3E94()
{
  return MEMORY[0x1E0D9D890]();
}

uint64_t sub_1C25F3EA0()
{
  return MEMORY[0x1E0D9D898]();
}

uint64_t sub_1C25F3EAC()
{
  return MEMORY[0x1E0D9D8A0]();
}

uint64_t sub_1C25F3EB8()
{
  return MEMORY[0x1E0D9D8A8]();
}

uint64_t sub_1C25F3EC4()
{
  return MEMORY[0x1E0D9D8B0]();
}

uint64_t sub_1C25F3ED0()
{
  return MEMORY[0x1E0D9D8B8]();
}

uint64_t sub_1C25F3EDC()
{
  return MEMORY[0x1E0D9D8C0]();
}

uint64_t sub_1C25F3EE8()
{
  return MEMORY[0x1E0D9D8C8]();
}

uint64_t sub_1C25F3EF4()
{
  return MEMORY[0x1E0D9D8D0]();
}

uint64_t sub_1C25F3F00()
{
  return MEMORY[0x1E0D9D8D8]();
}

uint64_t sub_1C25F3F0C()
{
  return MEMORY[0x1E0D9D8E0]();
}

uint64_t sub_1C25F3F18()
{
  return MEMORY[0x1E0D9D928]();
}

uint64_t sub_1C25F3F24()
{
  return MEMORY[0x1E0D9D930]();
}

uint64_t sub_1C25F3F30()
{
  return MEMORY[0x1E0D9D938]();
}

uint64_t sub_1C25F3F3C()
{
  return MEMORY[0x1E0D9D940]();
}

uint64_t sub_1C25F3F48()
{
  return MEMORY[0x1E0D9D950]();
}

uint64_t sub_1C25F3F54()
{
  return MEMORY[0x1E0D9D958]();
}

uint64_t sub_1C25F3F60()
{
  return MEMORY[0x1E0D9D960]();
}

uint64_t sub_1C25F3F6C()
{
  return MEMORY[0x1E0D9D968]();
}

uint64_t sub_1C25F3F78()
{
  return MEMORY[0x1E0D9D970]();
}

uint64_t sub_1C25F3F84()
{
  return MEMORY[0x1E0D9D978]();
}

uint64_t sub_1C25F3F90()
{
  return MEMORY[0x1E0D9D980]();
}

uint64_t sub_1C25F3F9C()
{
  return MEMORY[0x1E0D9D988]();
}

uint64_t sub_1C25F3FA8()
{
  return MEMORY[0x1E0D9D9C8]();
}

uint64_t sub_1C25F3FB4()
{
  return MEMORY[0x1E0D9DA18]();
}

uint64_t sub_1C25F3FC0()
{
  return MEMORY[0x1E0D9DA20]();
}

uint64_t sub_1C25F3FCC()
{
  return MEMORY[0x1E0D9DA28]();
}

uint64_t sub_1C25F3FD8()
{
  return MEMORY[0x1E0D9DA78]();
}

uint64_t sub_1C25F3FE4()
{
  return MEMORY[0x1E0D9DA80]();
}

uint64_t sub_1C25F3FF0()
{
  return MEMORY[0x1E0D9DAF0]();
}

uint64_t sub_1C25F3FFC()
{
  return MEMORY[0x1E0D9DAF8]();
}

uint64_t sub_1C25F4008()
{
  return MEMORY[0x1E0D9DB18]();
}

uint64_t sub_1C25F4014()
{
  return MEMORY[0x1E0D9DB30]();
}

uint64_t sub_1C25F4020()
{
  return MEMORY[0x1E0D9DB40]();
}

uint64_t sub_1C25F402C()
{
  return MEMORY[0x1E0D9DB48]();
}

uint64_t sub_1C25F4038()
{
  return MEMORY[0x1E0D9DB50]();
}

uint64_t sub_1C25F4044()
{
  return MEMORY[0x1E0D9DB58]();
}

uint64_t sub_1C25F4050()
{
  return MEMORY[0x1E0D9DB60]();
}

uint64_t sub_1C25F405C()
{
  return MEMORY[0x1E0D9DB68]();
}

uint64_t sub_1C25F4068()
{
  return MEMORY[0x1E0D9DB70]();
}

uint64_t sub_1C25F4074()
{
  return MEMORY[0x1E0D9DB78]();
}

uint64_t sub_1C25F4080()
{
  return MEMORY[0x1E0D9DB80]();
}

uint64_t sub_1C25F408C()
{
  return MEMORY[0x1E0D9DB90]();
}

uint64_t sub_1C25F4098()
{
  return MEMORY[0x1E0D9DB98]();
}

uint64_t sub_1C25F40A4()
{
  return MEMORY[0x1E0D9DBA0]();
}

uint64_t sub_1C25F40B0()
{
  return MEMORY[0x1E0D9DBA8]();
}

uint64_t sub_1C25F40BC()
{
  return MEMORY[0x1E0D9DBB0]();
}

uint64_t sub_1C25F40C8()
{
  return MEMORY[0x1E0D9DBB8]();
}

uint64_t sub_1C25F40D4()
{
  return MEMORY[0x1E0D9DBC0]();
}

uint64_t sub_1C25F40E0()
{
  return MEMORY[0x1E0D9DBC8]();
}

uint64_t sub_1C25F40EC()
{
  return MEMORY[0x1E0D9DBD0]();
}

uint64_t sub_1C25F40F8()
{
  return MEMORY[0x1E0D9DBD8]();
}

uint64_t sub_1C25F4104()
{
  return MEMORY[0x1E0D9DBE0]();
}

uint64_t sub_1C25F4110()
{
  return MEMORY[0x1E0D9DBE8]();
}

uint64_t sub_1C25F411C()
{
  return MEMORY[0x1E0D9DBF0]();
}

uint64_t sub_1C25F4128()
{
  return MEMORY[0x1E0D9DBF8]();
}

uint64_t sub_1C25F4134()
{
  return MEMORY[0x1E0D9DCC0]();
}

uint64_t sub_1C25F4140()
{
  return MEMORY[0x1E0D9DCC8]();
}

uint64_t sub_1C25F414C()
{
  return MEMORY[0x1E0D9DCD0]();
}

uint64_t sub_1C25F4158()
{
  return MEMORY[0x1E0D9DCD8]();
}

uint64_t sub_1C25F4164()
{
  return MEMORY[0x1E0D9DCE0]();
}

uint64_t sub_1C25F4170()
{
  return MEMORY[0x1E0D9DCE8]();
}

uint64_t sub_1C25F417C()
{
  return MEMORY[0x1E0D9DCF0]();
}

uint64_t sub_1C25F4188()
{
  return MEMORY[0x1E0D9DCF8]();
}

uint64_t sub_1C25F4194()
{
  return MEMORY[0x1E0D9DD00]();
}

uint64_t sub_1C25F41A0()
{
  return MEMORY[0x1E0D9DD08]();
}

uint64_t sub_1C25F41AC()
{
  return MEMORY[0x1E0D9DD10]();
}

uint64_t sub_1C25F41B8()
{
  return MEMORY[0x1E0D9DD18]();
}

uint64_t sub_1C25F41C4()
{
  return MEMORY[0x1E0D9DD20]();
}

uint64_t sub_1C25F41D0()
{
  return MEMORY[0x1E0D9DD78]();
}

uint64_t sub_1C25F41DC()
{
  return MEMORY[0x1E0D9DD80]();
}

uint64_t sub_1C25F41E8()
{
  return MEMORY[0x1E0D9DD88]();
}

uint64_t sub_1C25F41F4()
{
  return MEMORY[0x1E0D9DD90]();
}

uint64_t sub_1C25F4200()
{
  return MEMORY[0x1E0D9DD98]();
}

uint64_t sub_1C25F420C()
{
  return MEMORY[0x1E0D9DDA0]();
}

uint64_t sub_1C25F4218()
{
  return MEMORY[0x1E0D9DDA8]();
}

uint64_t sub_1C25F4224()
{
  return MEMORY[0x1E0D9DDB0]();
}

uint64_t sub_1C25F4230()
{
  return MEMORY[0x1E0D9DDB8]();
}

uint64_t sub_1C25F423C()
{
  return MEMORY[0x1E0D9DDC0]();
}

uint64_t sub_1C25F4248()
{
  return MEMORY[0x1E0D9DDC8]();
}

uint64_t sub_1C25F4254()
{
  return MEMORY[0x1E0D9DDD0]();
}

uint64_t sub_1C25F4260()
{
  return MEMORY[0x1E0D9DDD8]();
}

uint64_t sub_1C25F426C()
{
  return MEMORY[0x1E0D9DDE0]();
}

uint64_t sub_1C25F4278()
{
  return MEMORY[0x1E0D9DDE8]();
}

uint64_t sub_1C25F4284()
{
  return MEMORY[0x1E0D9DDF0]();
}

uint64_t sub_1C25F4290()
{
  return MEMORY[0x1E0D9DEC8]();
}

uint64_t sub_1C25F429C()
{
  return MEMORY[0x1E0D9DED0]();
}

uint64_t sub_1C25F42A8()
{
  return MEMORY[0x1E0D9DED8]();
}

uint64_t sub_1C25F42B4()
{
  return MEMORY[0x1E0D9DEE0]();
}

uint64_t sub_1C25F42C0()
{
  return MEMORY[0x1E0D9DEE8]();
}

uint64_t sub_1C25F42CC()
{
  return MEMORY[0x1E0D9DEF0]();
}

uint64_t sub_1C25F42D8()
{
  return MEMORY[0x1E0D9DEF8]();
}

uint64_t sub_1C25F42E4()
{
  return MEMORY[0x1E0D9DF00]();
}

uint64_t sub_1C25F42F0()
{
  return MEMORY[0x1E0D9DF10]();
}

uint64_t sub_1C25F42FC()
{
  return MEMORY[0x1E0D9DF30]();
}

uint64_t sub_1C25F4308()
{
  return MEMORY[0x1E0D9DF38]();
}

uint64_t sub_1C25F4314()
{
  return MEMORY[0x1E0D9DF40]();
}

uint64_t sub_1C25F4320()
{
  return MEMORY[0x1E0D9DF48]();
}

uint64_t sub_1C25F432C()
{
  return MEMORY[0x1E0D9DF50]();
}

uint64_t sub_1C25F4338()
{
  return MEMORY[0x1E0D9DF58]();
}

uint64_t sub_1C25F4344()
{
  return MEMORY[0x1E0D9DF60]();
}

uint64_t sub_1C25F4350()
{
  return MEMORY[0x1E0D9DF68]();
}

uint64_t sub_1C25F435C()
{
  return MEMORY[0x1E0D9DF70]();
}

uint64_t sub_1C25F4368()
{
  return MEMORY[0x1E0D9DF78]();
}

uint64_t sub_1C25F4374()
{
  return MEMORY[0x1E0D9DF80]();
}

uint64_t sub_1C25F4380()
{
  return MEMORY[0x1E0D9DF88]();
}

uint64_t sub_1C25F438C()
{
  return MEMORY[0x1E0D9DF90]();
}

uint64_t sub_1C25F4398()
{
  return MEMORY[0x1E0D9E060]();
}

uint64_t sub_1C25F43A4()
{
  return MEMORY[0x1E0D9E068]();
}

uint64_t sub_1C25F43B0()
{
  return MEMORY[0x1E0D9E070]();
}

uint64_t sub_1C25F43BC()
{
  return MEMORY[0x1E0D9E078]();
}

uint64_t sub_1C25F43C8()
{
  return MEMORY[0x1E0D9E080]();
}

uint64_t sub_1C25F43D4()
{
  return MEMORY[0x1E0D9E088]();
}

uint64_t sub_1C25F43E0()
{
  return MEMORY[0x1E0D9E090]();
}

uint64_t sub_1C25F43EC()
{
  return MEMORY[0x1E0D9E098]();
}

uint64_t sub_1C25F43F8()
{
  return MEMORY[0x1E0D9E0D0]();
}

uint64_t sub_1C25F4404()
{
  return MEMORY[0x1E0D9E0E0]();
}

uint64_t sub_1C25F4410()
{
  return MEMORY[0x1E0D9E0E8]();
}

uint64_t sub_1C25F441C()
{
  return MEMORY[0x1E0D9E0F0]();
}

uint64_t sub_1C25F4428()
{
  return MEMORY[0x1E0D9E0F8]();
}

uint64_t sub_1C25F4434()
{
  return MEMORY[0x1E0D9E100]();
}

uint64_t sub_1C25F4440()
{
  return MEMORY[0x1E0D9E108]();
}

uint64_t sub_1C25F444C()
{
  return MEMORY[0x1E0D9E110]();
}

uint64_t sub_1C25F4458()
{
  return MEMORY[0x1E0D9E118]();
}

uint64_t sub_1C25F4464()
{
  return MEMORY[0x1E0D9E130]();
}

uint64_t sub_1C25F4470()
{
  return MEMORY[0x1E0D9E138]();
}

uint64_t sub_1C25F447C()
{
  return MEMORY[0x1E0D9E140]();
}

uint64_t sub_1C25F4488()
{
  return MEMORY[0x1E0D9E148]();
}

uint64_t sub_1C25F4494()
{
  return MEMORY[0x1E0D9E150]();
}

uint64_t sub_1C25F44A0()
{
  return MEMORY[0x1E0D9E158]();
}

uint64_t sub_1C25F44AC()
{
  return MEMORY[0x1E0D9E160]();
}

uint64_t sub_1C25F44B8()
{
  return MEMORY[0x1E0D9E200]();
}

uint64_t sub_1C25F44C4()
{
  return MEMORY[0x1E0D9E208]();
}

uint64_t sub_1C25F44D0()
{
  return MEMORY[0x1E0D9E228]();
}

uint64_t sub_1C25F44DC()
{
  return MEMORY[0x1E0D9E250]();
}

uint64_t sub_1C25F44E8()
{
  return MEMORY[0x1E0D9E268]();
}

uint64_t sub_1C25F44F4()
{
  return MEMORY[0x1E0D9E270]();
}

uint64_t sub_1C25F4500()
{
  return MEMORY[0x1E0D9E278]();
}

uint64_t sub_1C25F450C()
{
  return MEMORY[0x1E0D9E280]();
}

uint64_t sub_1C25F4518()
{
  return MEMORY[0x1E0D9E288]();
}

uint64_t sub_1C25F4524()
{
  return MEMORY[0x1E0D9E290]();
}

uint64_t sub_1C25F4530()
{
  return MEMORY[0x1E0D9E2E0]();
}

uint64_t sub_1C25F453C()
{
  return MEMORY[0x1E0D9E2E8]();
}

uint64_t sub_1C25F4548()
{
  return MEMORY[0x1E0D9E2F0]();
}

uint64_t sub_1C25F4554()
{
  return MEMORY[0x1E0D9E2F8]();
}

uint64_t sub_1C25F4560()
{
  return MEMORY[0x1E0D9E300]();
}

uint64_t sub_1C25F456C()
{
  return MEMORY[0x1E0D9E308]();
}

uint64_t sub_1C25F4578()
{
  return MEMORY[0x1E0D9E310]();
}

uint64_t sub_1C25F4584()
{
  return MEMORY[0x1E0D9E318]();
}

uint64_t sub_1C25F4590()
{
  return MEMORY[0x1E0D9E350]();
}

uint64_t sub_1C25F459C()
{
  return MEMORY[0x1E0D9E358]();
}

uint64_t sub_1C25F45A8()
{
  return MEMORY[0x1E0D9E370]();
}

uint64_t sub_1C25F45B4()
{
  return MEMORY[0x1E0D9E378]();
}

uint64_t sub_1C25F45C0()
{
  return MEMORY[0x1E0D9E380]();
}

uint64_t sub_1C25F45CC()
{
  return MEMORY[0x1E0D9E388]();
}

uint64_t sub_1C25F45D8()
{
  return MEMORY[0x1E0D9E390]();
}

uint64_t sub_1C25F45E4()
{
  return MEMORY[0x1E0D9E398]();
}

uint64_t sub_1C25F45F0()
{
  return MEMORY[0x1E0D9E3A0]();
}

uint64_t sub_1C25F45FC()
{
  return MEMORY[0x1E0D9E3A8]();
}

uint64_t sub_1C25F4608()
{
  return MEMORY[0x1E0D9E3B0]();
}

uint64_t sub_1C25F4614()
{
  return MEMORY[0x1E0D9E3C0]();
}

uint64_t sub_1C25F4620()
{
  return MEMORY[0x1E0D9E3C8]();
}

uint64_t sub_1C25F462C()
{
  return MEMORY[0x1E0D9E3E8]();
}

uint64_t sub_1C25F4638()
{
  return MEMORY[0x1E0D9E3F0]();
}

uint64_t sub_1C25F4644()
{
  return MEMORY[0x1E0D9E3F8]();
}

uint64_t sub_1C25F4650()
{
  return MEMORY[0x1E0D9E400]();
}

uint64_t sub_1C25F465C()
{
  return MEMORY[0x1E0D9E408]();
}

uint64_t sub_1C25F4668()
{
  return MEMORY[0x1E0D9E410]();
}

uint64_t sub_1C25F4674()
{
  return MEMORY[0x1E0D9E418]();
}

uint64_t sub_1C25F4680()
{
  return MEMORY[0x1E0D9E420]();
}

uint64_t sub_1C25F468C()
{
  return MEMORY[0x1E0D9E430]();
}

uint64_t sub_1C25F4698()
{
  return MEMORY[0x1E0D9E448]();
}

uint64_t sub_1C25F46A4()
{
  return MEMORY[0x1E0D9E488]();
}

uint64_t sub_1C25F46B0()
{
  return MEMORY[0x1E0D9E490]();
}

uint64_t sub_1C25F46BC()
{
  return MEMORY[0x1E0D9E4D8]();
}

uint64_t sub_1C25F46C8()
{
  return MEMORY[0x1E0D9E4E0]();
}

uint64_t sub_1C25F46D4()
{
  return MEMORY[0x1E0D9E4E8]();
}

uint64_t sub_1C25F46E0()
{
  return MEMORY[0x1E0D9E4F0]();
}

uint64_t sub_1C25F46EC()
{
  return MEMORY[0x1E0D9E4F8]();
}

uint64_t sub_1C25F46F8()
{
  return MEMORY[0x1E0D9E500]();
}

uint64_t sub_1C25F4704()
{
  return MEMORY[0x1E0D9E528]();
}

uint64_t sub_1C25F4710()
{
  return MEMORY[0x1E0D9E5A0]();
}

uint64_t sub_1C25F471C()
{
  return MEMORY[0x1E0D9E5F0]();
}

uint64_t sub_1C25F4728()
{
  return MEMORY[0x1E0D9E5F8]();
}

uint64_t sub_1C25F4734()
{
  return MEMORY[0x1E0D9E618]();
}

uint64_t sub_1C25F4740()
{
  return MEMORY[0x1E0D9E620]();
}

uint64_t sub_1C25F474C()
{
  return MEMORY[0x1E0D9E670]();
}

uint64_t sub_1C25F4758()
{
  return MEMORY[0x1E0D9E680]();
}

uint64_t sub_1C25F4764()
{
  return MEMORY[0x1E0D9E688]();
}

uint64_t sub_1C25F4770()
{
  return MEMORY[0x1E0D9E690]();
}

uint64_t sub_1C25F477C()
{
  return MEMORY[0x1E0D9E698]();
}

uint64_t sub_1C25F4788()
{
  return MEMORY[0x1E0D9E6A0]();
}

uint64_t sub_1C25F4794()
{
  return MEMORY[0x1E0D9E6A8]();
}

uint64_t sub_1C25F47A0()
{
  return MEMORY[0x1E0D9E6B0]();
}

uint64_t sub_1C25F47AC()
{
  return MEMORY[0x1E0D9E6B8]();
}

uint64_t sub_1C25F47B8()
{
  return MEMORY[0x1E0D9E6E0]();
}

uint64_t sub_1C25F47C4()
{
  return MEMORY[0x1E0D9E6E8]();
}

uint64_t sub_1C25F47D0()
{
  return MEMORY[0x1E0D9E6F0]();
}

uint64_t sub_1C25F47DC()
{
  return MEMORY[0x1E0D9E6F8]();
}

uint64_t sub_1C25F47E8()
{
  return MEMORY[0x1E0D9E700]();
}

uint64_t sub_1C25F47F4()
{
  return MEMORY[0x1E0D9E708]();
}

uint64_t sub_1C25F4800()
{
  return MEMORY[0x1E0D9E710]();
}

uint64_t sub_1C25F480C()
{
  return MEMORY[0x1E0D9E718]();
}

uint64_t sub_1C25F4818()
{
  return MEMORY[0x1E0D9E720]();
}

uint64_t sub_1C25F4824()
{
  return MEMORY[0x1E0D9E728]();
}

uint64_t sub_1C25F4830()
{
  return MEMORY[0x1E0D9E730]();
}

uint64_t sub_1C25F483C()
{
  return MEMORY[0x1E0D9E740]();
}

uint64_t sub_1C25F4848()
{
  return MEMORY[0x1E0D9E748]();
}

uint64_t sub_1C25F4854()
{
  return MEMORY[0x1E0D9E750]();
}

uint64_t sub_1C25F4860()
{
  return MEMORY[0x1E0D9E758]();
}

uint64_t sub_1C25F486C()
{
  return MEMORY[0x1E0D9E760]();
}

uint64_t sub_1C25F4878()
{
  return MEMORY[0x1E0D9E768]();
}

uint64_t sub_1C25F4884()
{
  return MEMORY[0x1E0D9E770]();
}

uint64_t sub_1C25F4890()
{
  return MEMORY[0x1E0D9E778]();
}

uint64_t sub_1C25F489C()
{
  return MEMORY[0x1E0D9E7A0]();
}

uint64_t sub_1C25F48A8()
{
  return MEMORY[0x1E0D9E7B0]();
}

uint64_t sub_1C25F48B4()
{
  return MEMORY[0x1E0D9E7B8]();
}

uint64_t sub_1C25F48C0()
{
  return MEMORY[0x1E0D9E7C0]();
}

uint64_t sub_1C25F48CC()
{
  return MEMORY[0x1E0D9E7E0]();
}

uint64_t sub_1C25F48D8()
{
  return MEMORY[0x1E0D9E8C0]();
}

uint64_t sub_1C25F48E4()
{
  return MEMORY[0x1E0D9E8E0]();
}

uint64_t sub_1C25F48F0()
{
  return MEMORY[0x1E0D9E8E8]();
}

uint64_t sub_1C25F48FC()
{
  return MEMORY[0x1E0D9E8F0]();
}

uint64_t sub_1C25F4908()
{
  return MEMORY[0x1E0D9E900]();
}

uint64_t sub_1C25F4914()
{
  return MEMORY[0x1E0D9E908]();
}

uint64_t sub_1C25F4920()
{
  return MEMORY[0x1E0D9E910]();
}

uint64_t sub_1C25F492C()
{
  return MEMORY[0x1E0D9E928]();
}

uint64_t sub_1C25F4938()
{
  return MEMORY[0x1E0D9E948]();
}

uint64_t sub_1C25F4944()
{
  return MEMORY[0x1E0D9E950]();
}

uint64_t sub_1C25F4950()
{
  return MEMORY[0x1E0D9E960]();
}

uint64_t sub_1C25F495C()
{
  return MEMORY[0x1E0D9E968]();
}

uint64_t sub_1C25F4968()
{
  return MEMORY[0x1E0D9E970]();
}

uint64_t sub_1C25F4974()
{
  return MEMORY[0x1E0D9E978]();
}

uint64_t sub_1C25F4980()
{
  return MEMORY[0x1E0D9E980]();
}

uint64_t sub_1C25F498C()
{
  return MEMORY[0x1E0D9E988]();
}

uint64_t sub_1C25F4998()
{
  return MEMORY[0x1E0D9E990]();
}

uint64_t sub_1C25F49A4()
{
  return MEMORY[0x1E0D9E998]();
}

uint64_t sub_1C25F49B0()
{
  return MEMORY[0x1E0D9E9A0]();
}

uint64_t sub_1C25F49BC()
{
  return MEMORY[0x1E0D9E9A8]();
}

uint64_t sub_1C25F49C8()
{
  return MEMORY[0x1E0D9E9B8]();
}

uint64_t sub_1C25F49D4()
{
  return MEMORY[0x1E0D9E9D0]();
}

uint64_t sub_1C25F49E0()
{
  return MEMORY[0x1E0D9E9E0]();
}

uint64_t sub_1C25F49EC()
{
  return MEMORY[0x1E0D9E9E8]();
}

uint64_t sub_1C25F49F8()
{
  return MEMORY[0x1E0D9E9F0]();
}

uint64_t sub_1C25F4A04()
{
  return MEMORY[0x1E0D9E9F8]();
}

uint64_t sub_1C25F4A10()
{
  return MEMORY[0x1E0D9EA00]();
}

uint64_t sub_1C25F4A1C()
{
  return MEMORY[0x1E0D9EA08]();
}

uint64_t sub_1C25F4A28()
{
  return MEMORY[0x1E0D9EA10]();
}

uint64_t sub_1C25F4A34()
{
  return MEMORY[0x1E0D9EA28]();
}

uint64_t sub_1C25F4A40()
{
  return MEMORY[0x1E0D9EA38]();
}

uint64_t sub_1C25F4A4C()
{
  return MEMORY[0x1E0D9EA40]();
}

uint64_t sub_1C25F4A58()
{
  return MEMORY[0x1E0D9EA48]();
}

uint64_t sub_1C25F4A64()
{
  return MEMORY[0x1E0D9EA50]();
}

uint64_t sub_1C25F4A70()
{
  return MEMORY[0x1E0D9EA58]();
}

uint64_t sub_1C25F4A7C()
{
  return MEMORY[0x1E0D9EA68]();
}

uint64_t sub_1C25F4A88()
{
  return MEMORY[0x1E0D9EA70]();
}

uint64_t sub_1C25F4A94()
{
  return MEMORY[0x1E0D9EA78]();
}

uint64_t sub_1C25F4AA0()
{
  return MEMORY[0x1E0D9EAC0]();
}

uint64_t sub_1C25F4AAC()
{
  return MEMORY[0x1E0D9EAC8]();
}

uint64_t sub_1C25F4AB8()
{
  return MEMORY[0x1E0D9EAD8]();
}

uint64_t sub_1C25F4AC4()
{
  return MEMORY[0x1E0D9EAF8]();
}

uint64_t sub_1C25F4AD0()
{
  return MEMORY[0x1E0D9EB68]();
}

uint64_t sub_1C25F4ADC()
{
  return MEMORY[0x1E0D9EBB8]();
}

uint64_t sub_1C25F4AE8()
{
  return MEMORY[0x1E0D9EBC0]();
}

uint64_t sub_1C25F4AF4()
{
  return MEMORY[0x1E0D9EBC8]();
}

uint64_t sub_1C25F4B00()
{
  return MEMORY[0x1E0D9EBF0]();
}

uint64_t sub_1C25F4B0C()
{
  return MEMORY[0x1E0D9EBF8]();
}

uint64_t sub_1C25F4B18()
{
  return MEMORY[0x1E0D9EC10]();
}

uint64_t sub_1C25F4B24()
{
  return MEMORY[0x1E0D9EC18]();
}

uint64_t sub_1C25F4B30()
{
  return MEMORY[0x1E0D9EC38]();
}

uint64_t sub_1C25F4B3C()
{
  return MEMORY[0x1E0D9EC48]();
}

uint64_t sub_1C25F4B48()
{
  return MEMORY[0x1E0D9EC50]();
}

uint64_t sub_1C25F4B54()
{
  return MEMORY[0x1E0D9EC58]();
}

uint64_t sub_1C25F4B60()
{
  return MEMORY[0x1E0D9EC90]();
}

uint64_t sub_1C25F4B6C()
{
  return MEMORY[0x1E0D9EC98]();
}

uint64_t sub_1C25F4B78()
{
  return MEMORY[0x1E0D9ECA0]();
}

uint64_t sub_1C25F4B84()
{
  return MEMORY[0x1E0D9ECA8]();
}

uint64_t sub_1C25F4B90()
{
  return MEMORY[0x1E0D9ECB0]();
}

uint64_t sub_1C25F4B9C()
{
  return MEMORY[0x1E0D9ECF0]();
}

uint64_t sub_1C25F4BA8()
{
  return MEMORY[0x1E0D9ECF8]();
}

uint64_t sub_1C25F4BB4()
{
  return MEMORY[0x1E0D9ED00]();
}

uint64_t sub_1C25F4BC0()
{
  return MEMORY[0x1E0D9EE08]();
}

uint64_t sub_1C25F4BCC()
{
  return MEMORY[0x1E0D9EE28]();
}

uint64_t sub_1C25F4BD8()
{
  return MEMORY[0x1E0D9EE30]();
}

uint64_t sub_1C25F4BE4()
{
  return MEMORY[0x1E0D9EE38]();
}

uint64_t sub_1C25F4BF0()
{
  return MEMORY[0x1E0D9EE40]();
}

uint64_t sub_1C25F4BFC()
{
  return MEMORY[0x1E0D9EEA0]();
}

uint64_t sub_1C25F4C08()
{
  return MEMORY[0x1E0D9EEB0]();
}

uint64_t sub_1C25F4C14()
{
  return MEMORY[0x1E0D9EEB8]();
}

uint64_t sub_1C25F4C20()
{
  return MEMORY[0x1E0D9EEF0]();
}

uint64_t sub_1C25F4C2C()
{
  return MEMORY[0x1E0D9EF00]();
}

uint64_t sub_1C25F4C38()
{
  return MEMORY[0x1E0D9EF18]();
}

uint64_t sub_1C25F4C44()
{
  return MEMORY[0x1E0D9EF28]();
}

uint64_t sub_1C25F4C50()
{
  return MEMORY[0x1E0D9EF78]();
}

uint64_t sub_1C25F4C5C()
{
  return MEMORY[0x1E0D9EF80]();
}

uint64_t sub_1C25F4C68()
{
  return MEMORY[0x1E0D9EFC0]();
}

uint64_t sub_1C25F4C74()
{
  return MEMORY[0x1E0D9EFD0]();
}

uint64_t sub_1C25F4C80()
{
  return MEMORY[0x1E0D9EFE8]();
}

uint64_t sub_1C25F4C8C()
{
  return MEMORY[0x1E0DA5018]();
}

uint64_t sub_1C25F4C98()
{
  return MEMORY[0x1E0DA5020]();
}

uint64_t sub_1C25F4CA4()
{
  return MEMORY[0x1E0DA5060]();
}

uint64_t sub_1C25F4CB0()
{
  return MEMORY[0x1E0DA5308]();
}

uint64_t sub_1C25F4CBC()
{
  return MEMORY[0x1E0DA5318]();
}

uint64_t sub_1C25F4CC8()
{
  return MEMORY[0x1E0DA5320]();
}

uint64_t sub_1C25F4CD4()
{
  return MEMORY[0x1E0DA5A90]();
}

uint64_t sub_1C25F4CE0()
{
  return MEMORY[0x1E0DA5AA8]();
}

uint64_t sub_1C25F4CEC()
{
  return MEMORY[0x1E0DA5D28]();
}

uint64_t sub_1C25F4CF8()
{
  return MEMORY[0x1E0DA5F30]();
}

uint64_t sub_1C25F4D04()
{
  return MEMORY[0x1E0DA6210]();
}

uint64_t sub_1C25F4D10()
{
  return MEMORY[0x1E0DA6218]();
}

uint64_t sub_1C25F4D1C()
{
  return MEMORY[0x1E0DA6228]();
}

uint64_t sub_1C25F4D28()
{
  return MEMORY[0x1E0DA6230]();
}

uint64_t sub_1C25F4D34()
{
  return MEMORY[0x1E0DA6238]();
}

uint64_t sub_1C25F4D40()
{
  return MEMORY[0x1E0DA7448]();
}

uint64_t sub_1C25F4D4C()
{
  return MEMORY[0x1E0DA4410]();
}

uint64_t sub_1C25F4D58()
{
  return MEMORY[0x1E0DA4418]();
}

uint64_t sub_1C25F4D64()
{
  return MEMORY[0x1E0DA4420]();
}

uint64_t sub_1C25F4D70()
{
  return MEMORY[0x1E0DA4428]();
}

uint64_t sub_1C25F4D7C()
{
  return MEMORY[0x1E0DA4438]();
}

uint64_t sub_1C25F4D88()
{
  return MEMORY[0x1E0DA4440]();
}

uint64_t sub_1C25F4D94()
{
  return MEMORY[0x1E0DA4448]();
}

uint64_t sub_1C25F4DA0()
{
  return MEMORY[0x1E0DA4450]();
}

uint64_t sub_1C25F4DAC()
{
  return MEMORY[0x1E0DA4458]();
}

uint64_t sub_1C25F4DB8()
{
  return MEMORY[0x1E0DA4460]();
}

uint64_t sub_1C25F4DC4()
{
  return MEMORY[0x1E0DA4470]();
}

uint64_t sub_1C25F4DD0()
{
  return MEMORY[0x1E0DA4480]();
}

uint64_t sub_1C25F4DDC()
{
  return MEMORY[0x1E0DA4488]();
}

uint64_t sub_1C25F4DE8()
{
  return MEMORY[0x1E0DA4490]();
}

uint64_t sub_1C25F4DF4()
{
  return MEMORY[0x1E0DA4498]();
}

uint64_t sub_1C25F4E00()
{
  return MEMORY[0x1E0DA44A0]();
}

uint64_t sub_1C25F4E0C()
{
  return MEMORY[0x1E0DA44A8]();
}

uint64_t sub_1C25F4E18()
{
  return MEMORY[0x1E0DA44B0]();
}

uint64_t sub_1C25F4E24()
{
  return MEMORY[0x1E0DA44B8]();
}

uint64_t sub_1C25F4E30()
{
  return MEMORY[0x1E0DA44C0]();
}

uint64_t sub_1C25F4E3C()
{
  return MEMORY[0x1E0DA44C8]();
}

uint64_t sub_1C25F4E48()
{
  return MEMORY[0x1E0DA44D0]();
}

uint64_t sub_1C25F4E54()
{
  return MEMORY[0x1E0DA44D8]();
}

uint64_t sub_1C25F4E60()
{
  return MEMORY[0x1E0DA44E0]();
}

uint64_t sub_1C25F4E6C()
{
  return MEMORY[0x1E0DA44F0]();
}

uint64_t sub_1C25F4E78()
{
  return MEMORY[0x1E0DA4500]();
}

uint64_t sub_1C25F4E84()
{
  return MEMORY[0x1E0DA4508]();
}

uint64_t sub_1C25F4E90()
{
  return MEMORY[0x1E0DA4510]();
}

uint64_t sub_1C25F4E9C()
{
  return MEMORY[0x1E0DA4518]();
}

uint64_t sub_1C25F4EA8()
{
  return MEMORY[0x1E0DA4520]();
}

uint64_t sub_1C25F4EB4()
{
  return MEMORY[0x1E0DA4528]();
}

uint64_t sub_1C25F4EC0()
{
  return MEMORY[0x1E0DA4530]();
}

uint64_t sub_1C25F4ECC()
{
  return MEMORY[0x1E0DA4538]();
}

uint64_t sub_1C25F4ED8()
{
  return MEMORY[0x1E0DA4540]();
}

uint64_t sub_1C25F4EE4()
{
  return MEMORY[0x1E0DA4550]();
}

uint64_t sub_1C25F4EF0()
{
  return MEMORY[0x1E0DA4560]();
}

uint64_t sub_1C25F4EFC()
{
  return MEMORY[0x1E0DA4568]();
}

uint64_t sub_1C25F4F08()
{
  return MEMORY[0x1E0DA4570]();
}

uint64_t sub_1C25F4F14()
{
  return MEMORY[0x1E0DA4578]();
}

uint64_t sub_1C25F4F20()
{
  return MEMORY[0x1E0DA4580]();
}

uint64_t sub_1C25F4F2C()
{
  return MEMORY[0x1E0DA4588]();
}

uint64_t sub_1C25F4F38()
{
  return MEMORY[0x1E0DA45A0]();
}

uint64_t sub_1C25F4F44()
{
  return MEMORY[0x1E0DA45A8]();
}

uint64_t sub_1C25F4F50()
{
  return MEMORY[0x1E0DA45E0]();
}

uint64_t sub_1C25F4F5C()
{
  return MEMORY[0x1E0DA45E8]();
}

uint64_t sub_1C25F4F68()
{
  return MEMORY[0x1E0DA45F8]();
}

uint64_t sub_1C25F4F74()
{
  return MEMORY[0x1E0DA4608]();
}

uint64_t sub_1C25F4F80()
{
  return MEMORY[0x1E0DA4610]();
}

uint64_t sub_1C25F4F8C()
{
  return MEMORY[0x1E0DA4618]();
}

uint64_t sub_1C25F4F98()
{
  return MEMORY[0x1E0DA4628]();
}

uint64_t sub_1C25F4FA4()
{
  return MEMORY[0x1E0DA4630]();
}

uint64_t sub_1C25F4FB0()
{
  return MEMORY[0x1E0DA4638]();
}

uint64_t sub_1C25F4FBC()
{
  return MEMORY[0x1E0DA4640]();
}

uint64_t sub_1C25F4FC8()
{
  return MEMORY[0x1E0DA4660]();
}

uint64_t sub_1C25F4FD4()
{
  return MEMORY[0x1E0DA4668]();
}

uint64_t sub_1C25F4FE0()
{
  return MEMORY[0x1E0DA4670]();
}

uint64_t sub_1C25F4FEC()
{
  return MEMORY[0x1E0DA4678]();
}

uint64_t sub_1C25F4FF8()
{
  return MEMORY[0x1E0DA4680]();
}

uint64_t sub_1C25F5004()
{
  return MEMORY[0x1E0DA4688]();
}

uint64_t sub_1C25F5010()
{
  return MEMORY[0x1E0DA4698]();
}

uint64_t sub_1C25F501C()
{
  return MEMORY[0x1E0DA46A0]();
}

uint64_t _s24RequestDispatcherBridges12CurareBridgeCfd_0()
{
  return MEMORY[0x1E0DA46B0]();
}

uint64_t sub_1C25F5034()
{
  return MEMORY[0x1E0DA46B8]();
}

uint64_t sub_1C25F5040()
{
  return MEMORY[0x1E0DA46F0]();
}

uint64_t sub_1C25F504C()
{
  return MEMORY[0x1E0DA7940]();
}

uint64_t sub_1C25F5058()
{
  return MEMORY[0x1E0DA7948]();
}

uint64_t sub_1C25F5064()
{
  return MEMORY[0x1E0DA7980]();
}

uint64_t sub_1C25F5070()
{
  return MEMORY[0x1E0DA7988]();
}

uint64_t sub_1C25F507C()
{
  return MEMORY[0x1E0DA7990]();
}

uint64_t sub_1C25F5088()
{
  return MEMORY[0x1E0DA7998]();
}

uint64_t sub_1C25F5094()
{
  return MEMORY[0x1E0DA79B8]();
}

uint64_t sub_1C25F50A0()
{
  return MEMORY[0x1E0DA79C8]();
}

uint64_t sub_1C25F50AC()
{
  return MEMORY[0x1E0DA79D0]();
}

uint64_t sub_1C25F50B8()
{
  return MEMORY[0x1E0DA79E0]();
}

uint64_t sub_1C25F50C4()
{
  return MEMORY[0x1E0DA79E8]();
}

uint64_t sub_1C25F50D0()
{
  return MEMORY[0x1E0DA79F0]();
}

uint64_t sub_1C25F50DC()
{
  return MEMORY[0x1E0D3B5D0]();
}

uint64_t sub_1C25F50E8()
{
  return MEMORY[0x1E0DF0268]();
}

uint64_t sub_1C25F50F4()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1C25F5100()
{
  return MEMORY[0x1E0D3B530]();
}

uint64_t sub_1C25F510C()
{
  return MEMORY[0x1E0D3B540]();
}

uint64_t sub_1C25F5118()
{
  return MEMORY[0x1E0D3B548]();
}

uint64_t sub_1C25F5124()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1C25F5130()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C25F513C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C25F5148()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1C25F5154()
{
  return MEMORY[0x1E0DA3E00]();
}

uint64_t sub_1C25F5160()
{
  return MEMORY[0x1E0DA3E48]();
}

uint64_t sub_1C25F516C()
{
  return MEMORY[0x1E0DA3E50]();
}

uint64_t sub_1C25F5178()
{
  return MEMORY[0x1E0DBFD20]();
}

uint64_t sub_1C25F5184()
{
  return MEMORY[0x1E0DBFD28]();
}

uint64_t sub_1C25F5190()
{
  return MEMORY[0x1E0DBFD30]();
}

uint64_t sub_1C25F519C()
{
  return MEMORY[0x1E0DBFD98]();
}

uint64_t sub_1C25F51A8()
{
  return MEMORY[0x1E0DBFDA8]();
}

uint64_t sub_1C25F51B4()
{
  return MEMORY[0x1E0DBFE90]();
}

uint64_t sub_1C25F51C0()
{
  return MEMORY[0x1E0DBFE98]();
}

uint64_t sub_1C25F51CC()
{
  return MEMORY[0x1E0DBFEA8]();
}

uint64_t sub_1C25F51D8()
{
  return MEMORY[0x1E0DBFEB0]();
}

uint64_t sub_1C25F51E4()
{
  return MEMORY[0x1E0DBFEB8]();
}

uint64_t sub_1C25F51F0()
{
  return MEMORY[0x1E0DBFED0]();
}

uint64_t sub_1C25F51FC()
{
  return MEMORY[0x1E0DBFF80]();
}

uint64_t sub_1C25F5208()
{
  return MEMORY[0x1E0DBFFA0]();
}

uint64_t sub_1C25F5214()
{
  return MEMORY[0x1E0DBFFA8]();
}

uint64_t sub_1C25F5220()
{
  return MEMORY[0x1E0D3B510]();
}

uint64_t sub_1C25F522C()
{
  return MEMORY[0x1E0D3B518]();
}

uint64_t sub_1C25F5238()
{
  return MEMORY[0x1E0D3B520]();
}

uint64_t sub_1C25F5244()
{
  return MEMORY[0x1E0D3B528]();
}

uint64_t sub_1C25F5250()
{
  return MEMORY[0x1E0DBFFF0]();
}

uint64_t sub_1C25F525C()
{
  return MEMORY[0x1E0DC0028]();
}

uint64_t sub_1C25F5268()
{
  return MEMORY[0x1E0DC0108]();
}

uint64_t sub_1C25F5274()
{
  return MEMORY[0x1E0DC01A8]();
}

uint64_t sub_1C25F5280()
{
  return MEMORY[0x1E0DC01D0]();
}

uint64_t sub_1C25F528C()
{
  return MEMORY[0x1E0DC0318]();
}

uint64_t sub_1C25F5298()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1C25F52A4()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1C25F52B0()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1C25F52BC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C25F52C8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C25F52D4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1C25F52E0()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C25F52EC()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1C25F52F8()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1C25F5304()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1C25F5310()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1C25F531C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C25F5328()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C25F5334()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C25F5340()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C25F534C()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C25F5358()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C25F5364()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C25F5370()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1C25F537C()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C25F5388()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C25F5394()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C25F53A0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1C25F53AC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C25F53B8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C25F53C4()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1C25F53D0()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1C25F53DC()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C25F53E8()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1C25F53F4()
{
  return MEMORY[0x1E0DEAEF0]();
}

uint64_t sub_1C25F5400()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1C25F540C()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1C25F5418()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1C25F5424()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1C25F5430()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1C25F543C()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1C25F5448()
{
  return MEMORY[0x1E0DF0A90]();
}

uint64_t sub_1C25F5454()
{
  return MEMORY[0x1E0DEB5C8]();
}

uint64_t sub_1C25F5460()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1C25F546C()
{
  return MEMORY[0x1E0D9C7C8]();
}

uint64_t sub_1C25F5478()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1C25F5484()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C25F5490()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C25F549C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C25F54A8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1C25F54B4()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1C25F54C0()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1C25F54CC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1C25F54D8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1C25F54E4()
{
  return MEMORY[0x1E0D99130]();
}

uint64_t sub_1C25F54F0()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1C25F54FC()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1C25F5508()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1C25F5514()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1C25F5520()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t sub_1C25F552C()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1C25F5538()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C25F5544()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C25F5550()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1C25F555C()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1C25F5568()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C25F5574()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_1C25F5580()
{
  return MEMORY[0x1E0DEBF58]();
}

uint64_t sub_1C25F558C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1C25F5598()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1C25F55A4()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1C25F55B0()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1C25F55BC()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1C25F55C8()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1C25F55D4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C25F55E0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C25F55EC()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1C25F55F8()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C25F5604()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1C25F5610()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1C25F561C()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1C25F5628()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C25F5634()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1C25F5640()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1C25F564C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1C25F5658()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1C25F5664()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1C25F5670()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1C25F567C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C25F5688()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1C25F5694()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1C25F56A0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C25F56AC()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1C25F56B8()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1C25F56C4()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1C25F56D0()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1C25F56DC()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C25F56E8()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1C25F56F4()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1C25F5700()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1C25F570C()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1C25F5718()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1C25F5724()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1C25F5730()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1C25F573C()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C25F5748()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1C25F5754()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1C25F5760()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1C25F576C()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1C25F5778()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1C25F5784()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1C25F5790()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1C25F579C()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C25F57A8()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1C25F57B4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C25F57C0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C25F57CC()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1C25F57D8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C25F57E4()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1C25F57F0()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1C25F57FC()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C25F5808()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C25F5814()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C25F5820()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C25F582C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C25F5838()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C25F5844()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C25F5850()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C25F585C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C25F5868()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C25F5874()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C25F5880()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1C25F588C()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AFCurrentUserInterfaceIdiom()
{
  return MEMORY[0x1E0CFE3C8]();
}

uint64_t AFDeviceSupportsPatientSiri()
{
  return MEMORY[0x1E0CFE430]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x1E0CFE448]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1E0CFE4D0]();
}

uint64_t AFSiriActivationTriggerless()
{
  return MEMORY[0x1E0CFE658]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

uint64_t _AFPreferencesOutputVoice()
{
  return MEMORY[0x1E0CFEB10]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
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

