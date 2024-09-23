uint64_t sub_1AF3ADC58()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  _QWORD __src[42];

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA88);
  v2 = sub_1AF3E7DC0();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
    result = swift_release();
LABEL_35:
    *v0 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v5 = v1 + 56;
  if (v4 < 64)
    v6 = ~(-1 << v4);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v1 + 56);
  v24 = (unint64_t)(v4 + 63) >> 6;
  v8 = v2 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v24)
      goto LABEL_33;
    v15 = *(_QWORD *)(v5 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v24)
        goto LABEL_33;
      v15 = *(_QWORD *)(v5 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v24)
          goto LABEL_33;
        v15 = *(_QWORD *)(v5 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    memcpy(__src, (const void *)(*(_QWORD *)(v1 + 48) + 328 * v13), 0x141uLL);
    sub_1AF3E80D8();
    sub_1AF3B6C90((uint64_t)__src);
    swift_bridgeObjectRetain();
    sub_1AF3E7940();
    swift_bridgeObjectRelease();
    result = sub_1AF3E8114();
    v17 = -1 << *(_BYTE *)(v3 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v8 + 8 * (v18 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v20 = 0;
      v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v22 = v19 == v21;
        if (v19 == v21)
          v19 = 0;
        v20 |= v22;
        v23 = *(_QWORD *)(v8 + 8 * v19);
      }
      while (v23 == -1);
      v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    result = (uint64_t)memcpy((void *)(*(_QWORD *)(v3 + 48) + 328 * v11), __src, 0x141uLL);
    ++*(_QWORD *)(v3 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v24)
  {
LABEL_33:
    result = swift_release_n();
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v5 + 8 * v16);
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
    if (v10 >= v24)
      goto LABEL_33;
    v15 = *(_QWORD *)(v5 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_1AF3ADF2C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(uint64_t *__return_ptr, id *, _QWORD *))
{
  uint64_t v5;
  uint64_t v6;
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
  _QWORD *v21;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  char v38;
  _QWORD *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD *v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  id v48[2];
  uint64_t v49;
  unint64_t v50;
  _QWORD v51[12];
  void *v52;

  v6 = v5;
  v8 = -1 << *(_BYTE *)(a1 + 32);
  v9 = ~v8;
  v10 = *(_QWORD *)(a1 + 64);
  v11 = -v8;
  v51[4] = a1;
  v51[5] = a1 + 64;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  else
    v12 = -1;
  v51[6] = v9;
  v51[7] = 0;
  v51[8] = v12 & v10;
  v51[9] = a2;
  v51[10] = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  v13 = sub_1AF3B43C4();
  if (!v14)
  {
LABEL_20:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1AF3BA9A0();
    swift_release();
    return;
  }
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  while (1)
  {
    v51[2] = v17;
    v51[3] = v18;
    v51[0] = v19;
    v51[1] = v20;
    v30 = *(_QWORD **)v6;
    v32 = sub_1AF396870(v17, v18);
    v33 = v30[2];
    v34 = (v31 & 1) == 0;
    v35 = v33 + v34;
    if (__OFADD__(v33, v34))
    {
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      sub_1AF3E806C();
      __break(1u);
      goto LABEL_27;
    }
    v36 = v31;
    if (v30[3] < v35)
      break;
    if ((a4 & 1) != 0)
    {
      if ((v31 & 1) != 0)
        goto LABEL_16;
    }
    else
    {
      sub_1AF3AEF6C();
      if ((v36 & 1) != 0)
        goto LABEL_16;
    }
LABEL_6:
    v21 = *(_QWORD **)v6;
    *(_QWORD *)(*(_QWORD *)v6 + 8 * (v32 >> 6) + 64) |= 1 << v32;
    v22 = (uint64_t *)(v21[6] + 16 * v32);
    *v22 = v17;
    v22[1] = v18;
    v23 = (_QWORD *)(v21[7] + 16 * v32);
    *v23 = v19;
    v23[1] = v20;
    v24 = v21[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_25;
    v21[2] = v26;
LABEL_8:
    v17 = sub_1AF3B43C4();
    v18 = v27;
    v19 = v28;
    v20 = v29;
    a4 = 1;
    if (!v27)
      goto LABEL_20;
  }
  sub_1AF3AE6FC(v35, a4 & 1);
  v37 = sub_1AF396870(v17, v18);
  if ((v36 & 1) != (v38 & 1))
    goto LABEL_26;
  v32 = v37;
  if ((v36 & 1) == 0)
    goto LABEL_6;
LABEL_16:
  v39 = *(_QWORD **)v6;
  v40 = *(_QWORD *)(*(_QWORD *)v6 + 56) + 16 * v32;
  v41 = *(void **)(v40 + 8);
  v48[0] = *(id *)v40;
  v48[1] = v41;
  swift_bridgeObjectRetain();
  v42 = v52;
  a5(&v49, v48, v51);
  if (!v42)
  {
    v52 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v43 = (_QWORD *)(v39[7] + 16 * v32);
    v44 = v49;
    v45 = v50;
    swift_bridgeObjectRelease();
    *v43 = v44;
    v43[1] = v45;
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  v48[0] = v42;
  v46 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1AF3BA9A0();
    swift_release();

    return;
  }
LABEL_27:
  v49 = 0;
  v50 = 0xE000000000000000;
  sub_1AF3E7DE4();
  sub_1AF3E7970();
  sub_1AF3E7E80();
  sub_1AF3E7970();
  sub_1AF3E7EE0();
  __break(1u);
}

void sub_1AF3AE2DC(_QWORD *a1, char a2, _QWORD *a3)
{
  char *v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  id v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  _QWORD *v33;
  char v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;

  v4 = (uint64_t *)a1[2];
  if (v4)
  {
    v7 = a1[4];
    v8 = a1[5];
    v10 = a1[6];
    v9 = a1[7];
    swift_bridgeObjectRetain();
    v11 = *a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = sub_1AF396870(v7, v8);
    v14 = *(_QWORD *)(v11 + 16);
    v15 = (v12 & 1) == 0;
    v16 = v14 + v15;
    if (__OFADD__(v14, v15))
      goto LABEL_23;
    LOBYTE(v3) = v12;
    if (*(_QWORD *)(v11 + 24) >= v16)
    {
      v19 = a3;
      if ((a2 & 1) == 0)
        goto LABEL_25;
      goto LABEL_9;
    }
    sub_1AF3AE6FC(v16, a2 & 1);
    v17 = sub_1AF396870(v7, v8);
    if ((v3 & 1) == (v18 & 1))
    {
      v13 = v17;
      while (1)
      {
        v19 = a3;
LABEL_9:
        v20 = (_QWORD *)*v19;
        if ((v3 & 1) != 0)
          break;
        v20[(v13 >> 6) + 8] |= 1 << v13;
        v28 = (uint64_t *)(v20[6] + 16 * v13);
        *v28 = v7;
        v28[1] = v8;
        v29 = (_QWORD *)(v20[7] + 16 * v13);
        *v29 = v10;
        v29[1] = v9;
        v30 = v20[2];
        v31 = __OFADD__(v30, 1);
        v32 = v30 + 1;
        if (!v31)
        {
          v20[2] = v32;
          v3 = (char *)v4 - 1;
          if (v4 == (uint64_t *)1)
          {
LABEL_22:
            swift_bridgeObjectRelease_n();
            return;
          }
          v4 = a1 + 11;
          while (1)
          {
            v7 = *(v4 - 3);
            v8 = *(v4 - 2);
            v10 = *(v4 - 1);
            v9 = *v4;
            v33 = (_QWORD *)*v19;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v13 = sub_1AF396870(v7, v8);
            v35 = v33[2];
            v36 = (v34 & 1) == 0;
            v37 = v35 + v36;
            if (__OFADD__(v35, v36))
              break;
            v38 = v34;
            if (v33[3] < v37)
            {
              sub_1AF3AE6FC(v37, 1);
              v39 = sub_1AF396870(v7, v8);
              if ((v38 & 1) != (v40 & 1))
                goto LABEL_26;
              v13 = v39;
            }
            v19 = a3;
            v20 = (_QWORD *)*a3;
            if ((v38 & 1) != 0)
              goto LABEL_10;
            v20[(v13 >> 6) + 8] |= 1 << v13;
            v41 = (uint64_t *)(v20[6] + 16 * v13);
            *v41 = v7;
            v41[1] = v8;
            v42 = (_QWORD *)(v20[7] + 16 * v13);
            *v42 = v10;
            v42[1] = v9;
            v43 = v20[2];
            v31 = __OFADD__(v43, 1);
            v44 = v43 + 1;
            if (v31)
              goto LABEL_24;
            v4 += 4;
            v20[2] = v44;
            if (!--v3)
              goto LABEL_22;
          }
LABEL_23:
          __break(1u);
        }
LABEL_24:
        __break(1u);
LABEL_25:
        sub_1AF3AEF6C();
      }
LABEL_10:
      v21 = (uint64_t *)(v20[7] + 16 * v13);
      v22 = *v21;
      v23 = v21[1];
      type metadata accessor for KTraceRecordError();
      sub_1AF3910EC();
      v24 = (void *)swift_allocError();
      v26 = v25;
      swift_bridgeObjectRetain_n();
      sub_1AF3E7970();
      sub_1AF3E7970();
      *v26 = v22;
      v26[1] = v23;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      swift_bridgeObjectRelease();
      v27 = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
      if ((swift_dynamicCast() & 1) != 0)
        goto LABEL_27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
    else
    {
LABEL_26:
      sub_1AF3E806C();
      __break(1u);
LABEL_27:
      sub_1AF3E7DE4();
      sub_1AF3E7970();
      sub_1AF3E7E80();
      sub_1AF3E7970();
      sub_1AF3E7EE0();
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1AF3AE6FC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAB8);
  v42 = a2;
  v6 = sub_1AF3E7F04();
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
    sub_1AF3E80D8();
    sub_1AF3E7940();
    result = sub_1AF3E8114();
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

uint64_t sub_1AF3AEA20(uint64_t a1, char a2)
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
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  int64_t v26;
  _QWORD *v27;
  unint64_t v28;
  int64_t v29;
  uint64_t *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  int64_t v50;
  _QWORD *v51;
  uint64_t i;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAC8);
  v53 = a2;
  v6 = sub_1AF3E7F04();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v51 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v49 = v2;
  v50 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  for (i = v5; ; v5 = i)
  {
    if (v10)
    {
      v17 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v18 = v17 | (v13 << 6);
      if ((v53 & 1) != 0)
        goto LABEL_10;
      goto LABEL_23;
    }
    v26 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v26 >= v50)
      break;
    v27 = v51;
    v28 = v51[v26];
    ++v13;
    if (!v28)
    {
      v13 = v26 + 1;
      if (v26 + 1 >= v50)
        goto LABEL_33;
      v28 = v51[v13];
      if (!v28)
      {
        v29 = v26 + 2;
        if (v29 >= v50)
        {
LABEL_33:
          swift_release();
          v3 = v49;
          if ((v53 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v28 = v51[v29];
        if (!v28)
        {
          while (1)
          {
            v13 = v29 + 1;
            if (__OFADD__(v29, 1))
              goto LABEL_42;
            if (v13 >= v50)
              goto LABEL_33;
            v28 = v51[v13];
            ++v29;
            if (v28)
              goto LABEL_22;
          }
        }
        v13 = v29;
      }
    }
LABEL_22:
    v10 = (v28 - 1) & v28;
    v18 = __clz(__rbit64(v28)) + (v13 << 6);
    if ((v53 & 1) != 0)
    {
LABEL_10:
      v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v18);
      v20 = *v19;
      v21 = v19[1];
      v22 = *(_QWORD *)(v5 + 56) + 200 * v18;
      v72 = *(_OWORD *)v22;
      v54 = *(_QWORD *)(v22 + 32);
      v23 = *(_BYTE *)(v22 + 40);
      v58 = *(_QWORD *)(v22 + 48);
      v59 = *(_QWORD *)(v22 + 16);
      v55 = *(_QWORD *)(v22 + 56);
      v56 = *(_QWORD *)(v22 + 72);
      v57 = *(_QWORD *)(v22 + 24);
      v60 = *(_BYTE *)(v22 + 80);
      v61 = *(_QWORD *)(v22 + 64);
      v62 = *(_QWORD *)(v22 + 88);
      v63 = *(_QWORD *)(v22 + 112);
      v64 = *(_QWORD *)(v22 + 96);
      v65 = *(_QWORD *)(v22 + 120);
      v66 = *(_QWORD *)(v22 + 104);
      v67 = *(_OWORD *)(v22 + 128);
      v24 = *(_BYTE *)(v22 + 144);
      v25 = *(_BYTE *)(v22 + 168);
      v70 = *(_OWORD *)(v22 + 176);
      v71 = *(_QWORD *)(v22 + 152);
      v68 = *(_QWORD *)(v22 + 160);
      v69 = *(_QWORD *)(v22 + 192);
      goto LABEL_24;
    }
LABEL_23:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v18);
    v20 = *v30;
    v21 = v30[1];
    v31 = *(_QWORD *)(v5 + 56) + 200 * v18;
    v73 = *(_OWORD *)v31;
    v32 = *(_OWORD *)(v31 + 64);
    v34 = *(_OWORD *)(v31 + 16);
    v33 = *(_OWORD *)(v31 + 32);
    v76 = *(_OWORD *)(v31 + 48);
    v77 = v32;
    v74 = v34;
    v75 = v33;
    v35 = *(_OWORD *)(v31 + 128);
    v37 = *(_OWORD *)(v31 + 80);
    v36 = *(_OWORD *)(v31 + 96);
    v80 = *(_OWORD *)(v31 + 112);
    v81 = v35;
    v78 = v37;
    v79 = v36;
    v39 = *(_OWORD *)(v31 + 160);
    v38 = *(_OWORD *)(v31 + 176);
    v40 = *(_OWORD *)(v31 + 144);
    v85 = *(_QWORD *)(v31 + 192);
    v83 = v39;
    v84 = v38;
    v82 = v40;
    v72 = v73;
    v69 = v85;
    v70 = v38;
    v71 = *((_QWORD *)&v40 + 1);
    v25 = BYTE8(v39);
    v68 = v39;
    v24 = v40;
    v66 = *((_QWORD *)&v79 + 1);
    v67 = v81;
    v64 = v79;
    v65 = *((_QWORD *)&v80 + 1);
    v62 = *((_QWORD *)&v37 + 1);
    v63 = v80;
    v60 = v37;
    v61 = v77;
    v55 = *((_QWORD *)&v76 + 1);
    v56 = *((_QWORD *)&v77 + 1);
    v58 = v76;
    v57 = *((_QWORD *)&v74 + 1);
    v59 = v74;
    v54 = v75;
    v23 = BYTE8(v75);
    swift_bridgeObjectRetain();
    sub_1AF3B7E08((uint64_t)&v73);
LABEL_24:
    sub_1AF3E80D8();
    sub_1AF3E7940();
    result = sub_1AF3E8114();
    v41 = -1 << *(_BYTE *)(v7 + 32);
    v42 = result & ~v41;
    v43 = v42 >> 6;
    if (((-1 << v42) & ~*(_QWORD *)(v11 + 8 * (v42 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v42) & ~*(_QWORD *)(v11 + 8 * (v42 >> 6)))) | v42 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v44 = 0;
      v45 = (unint64_t)(63 - v41) >> 6;
      do
      {
        if (++v43 == v45 && (v44 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v46 = v43 == v45;
        if (v43 == v45)
          v43 = 0;
        v44 |= v46;
        v47 = *(_QWORD *)(v11 + 8 * v43);
      }
      while (v47 == -1);
      v14 = __clz(__rbit64(~v47)) + (v43 << 6);
    }
    LOBYTE(v73) = v23;
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v20;
    v15[1] = v21;
    v16 = *(_QWORD *)(v7 + 56) + 200 * v14;
    *(_OWORD *)v16 = v72;
    *(_QWORD *)(v16 + 16) = v59;
    *(_QWORD *)(v16 + 24) = v57;
    *(_QWORD *)(v16 + 32) = v54;
    *(_BYTE *)(v16 + 40) = v23;
    *(_QWORD *)(v16 + 48) = v58;
    *(_QWORD *)(v16 + 56) = v55;
    *(_QWORD *)(v16 + 64) = v61;
    *(_QWORD *)(v16 + 72) = v56;
    *(_BYTE *)(v16 + 80) = v60;
    *(_QWORD *)(v16 + 88) = v62;
    *(_QWORD *)(v16 + 96) = v64;
    *(_QWORD *)(v16 + 104) = v66;
    *(_QWORD *)(v16 + 112) = v63;
    *(_QWORD *)(v16 + 120) = v65;
    *(_OWORD *)(v16 + 128) = v67;
    *(_BYTE *)(v16 + 144) = v24;
    *(_QWORD *)(v16 + 152) = v71;
    *(_QWORD *)(v16 + 160) = v68;
    *(_OWORD *)(v16 + 176) = v70;
    *(_QWORD *)(v16 + 192) = v69;
    *(_BYTE *)(v16 + 168) = v25;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v49;
  v27 = v51;
  if ((v53 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v48 = 1 << *(_BYTE *)(v5 + 32);
  if (v48 >= 64)
    bzero(v27, ((unint64_t)(v48 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v27 = -1 << v48;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_1AF3AEF6C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAB8);
  v2 = *v0;
  v3 = sub_1AF3E7EF8();
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

void *sub_1AF3AF124()
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
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  int64_t v42;
  unint64_t v43;
  int64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAC8);
  v2 = *v0;
  v3 = sub_1AF3E7EF8();
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
    v42 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v42 >= v13)
      goto LABEL_26;
    v43 = *(_QWORD *)(v6 + 8 * v42);
    ++v9;
    if (!v43)
    {
      v9 = v42 + 1;
      if (v42 + 1 >= v13)
        goto LABEL_26;
      v43 = *(_QWORD *)(v6 + 8 * v9);
      if (!v43)
        break;
    }
LABEL_25:
    v12 = (v43 - 1) & v43;
    v15 = __clz(__rbit64(v43)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 200 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v23 = *(_OWORD *)(v21 + 16);
    v22 = *(_OWORD *)(v21 + 32);
    v24 = *(_OWORD *)(v21 + 64);
    v48 = *(_OWORD *)(v21 + 48);
    v49 = v24;
    v25 = *(_OWORD *)(v21 + 128);
    v27 = *(_OWORD *)(v21 + 80);
    v26 = *(_OWORD *)(v21 + 96);
    v52 = *(_OWORD *)(v21 + 112);
    v53 = v25;
    v50 = v27;
    v51 = v26;
    v29 = *(_OWORD *)(v21 + 160);
    v28 = *(_OWORD *)(v21 + 176);
    v30 = *(_OWORD *)(v21 + 144);
    v57 = *(_QWORD *)(v21 + 192);
    v55 = v29;
    v56 = v28;
    v54 = v30;
    v45 = *(_OWORD *)v21;
    v46 = v23;
    v47 = v22;
    v31 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v31 = v19;
    v31[1] = v18;
    v32 = *(_QWORD *)(v4 + 56) + v20;
    *(_OWORD *)v32 = v45;
    v33 = v46;
    v34 = v47;
    v35 = v49;
    *(_OWORD *)(v32 + 48) = v48;
    *(_OWORD *)(v32 + 64) = v35;
    *(_OWORD *)(v32 + 16) = v33;
    *(_OWORD *)(v32 + 32) = v34;
    v36 = v50;
    v37 = v51;
    v38 = v53;
    *(_OWORD *)(v32 + 112) = v52;
    *(_OWORD *)(v32 + 128) = v38;
    *(_OWORD *)(v32 + 80) = v36;
    *(_OWORD *)(v32 + 96) = v37;
    v39 = v54;
    v40 = v55;
    v41 = v56;
    *(_QWORD *)(v32 + 192) = v57;
    *(_OWORD *)(v32 + 160) = v40;
    *(_OWORD *)(v32 + 176) = v41;
    *(_OWORD *)(v32 + 144) = v39;
    swift_bridgeObjectRetain();
    result = (void *)sub_1AF3B7E08((uint64_t)&v45);
  }
  v44 = v42 + 2;
  if (v44 >= v13)
    goto LABEL_26;
  v43 = *(_QWORD *)(v6 + 8 * v44);
  if (v43)
  {
    v9 = v44;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v44 + 1;
    if (__OFADD__(v44, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v43 = *(_QWORD *)(v6 + 8 * v9);
    ++v44;
    if (v43)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1AF3AF36C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAE0);
  v2 = *v0;
  v3 = sub_1AF3E7EF8();
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

char *sub_1AF3AF520(uint64_t a1)
{
  return sub_1AF3AF598(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1AF3AF534(uint64_t a1)
{
  return sub_1AF3AF6B0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1AF3AF548(uint64_t a1)
{
  return sub_1AF3AF7B0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1AF3AF55C(uint64_t a1)
{
  return sub_1AF3AF8B0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_1AF3AF570(_QWORD *a1)
{
  return sub_1AF3AFAE4(0, a1[2], 0, a1);
}

char *sub_1AF3AF584(uint64_t a1)
{
  return sub_1AF3AFD80(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1AF3AF598(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B8D0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1AF3AF6B0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BB68);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1AF3AF7B0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAC0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1AF3AF8B0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BB60);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_1AF3AF9A8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAE8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 216);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[27 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 216 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAF0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_1AF3AFAE4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAA8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAB0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_1AF3AFC04(size_t result, int64_t a2, char a3, _QWORD *a4)
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
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA98);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA08) - 8);
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
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA08) - 8);
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

char *sub_1AF3AFD80(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA90);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 328);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[328 * v8])
      memmove(v12, v13, 328 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void (*sub_1AF3AFE98(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_1AF3B012C(v6);
  v6[10] = sub_1AF3AFF78(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_1AF3AFF28;
}

void sub_1AF3AFF28(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_1AF3AFF78(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t *a1)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  void (*result)(uint64_t *);

  v5 = v4;
  v10 = malloc(0x1B8uLL);
  *a1 = v10;
  v10[51] = a3;
  v10[52] = v5;
  v10[50] = a2;
  v11 = *v5;
  v13 = sub_1AF396870(a2, a3);
  *((_BYTE *)v10 + 432) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  v17 = v12;
  v18 = *(_QWORD *)(v11 + 24);
  if (v18 < v16 || (a4 & 1) == 0)
  {
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_1AF3AF124();
      goto LABEL_9;
    }
    sub_1AF3AEA20(v16, a4 & 1);
    v19 = sub_1AF396870(a2, a3);
    if ((v17 & 1) == (v20 & 1))
    {
      v13 = v19;
      goto LABEL_9;
    }
LABEL_14:
    result = (void (*)(uint64_t *))sub_1AF3E806C();
    __break(1u);
    return result;
  }
LABEL_9:
  v10[53] = v13;
  if ((v17 & 1) != 0)
  {
    memmove(v10 + 25, (const void *)(*(_QWORD *)(*v5 + 56) + 200 * v13), 0xC8uLL);
    nullsub_1(v10 + 25);
  }
  else
  {
    sub_1AF3BA5EC((uint64_t)(v10 + 25));
  }
  sub_1AF3478BC((uint64_t)(v10 + 25), (uint64_t)v10, &qword_1EEE3B988);
  return sub_1AF3B00D0;
}

void sub_1AF3B00D0(uint64_t *a1)
{
  void *v1;
  _QWORD *v2;

  v1 = (void *)*a1;
  v2 = (_QWORD *)(*a1 + 200);
  sub_1AF3B0158(*a1, *(_BYTE *)(*a1 + 432), *(uint64_t **)(*a1 + 416), *(_QWORD *)(*a1 + 424), *(_QWORD *)(*a1 + 400), *(_QWORD *)(*a1 + 408));
  sub_1AF3478BC((uint64_t)v1, (uint64_t)v2, &qword_1EEE3B988);
  sub_1AF3BA6B4(v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1AF3BA610);
  free(v1);
}

uint64_t (*sub_1AF3B012C(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_1AF3B014C;
}

uint64_t sub_1AF3B014C(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

_QWORD *sub_1AF3B0158(uint64_t a1, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *result;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _OWORD __src[12];
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _QWORD v39[25];
  _BYTE v40[200];

  sub_1AF3478BC(a1, (uint64_t)v39, &qword_1EEE3B988);
  sub_1AF3478BC((uint64_t)v39, (uint64_t)v40, &qword_1EEE3B988);
  if (sub_1AF3B6F10((uint64_t)v40) == 1)
  {
    if ((a2 & 1) != 0)
    {
      swift_arrayDestroy();
      sub_1AF3B032C(a4, *a3);
    }
    return sub_1AF3BA6B4(v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1AF3BA720);
  }
  result = (_QWORD *)sub_1AF3478BC((uint64_t)v39, (uint64_t)__src, &qword_1EEE3B988);
  v36 = __src[10];
  v37 = __src[11];
  v38 = v25;
  v32 = __src[6];
  v33 = __src[7];
  v34 = __src[8];
  v35 = __src[9];
  v28 = __src[2];
  v29 = __src[3];
  v30 = __src[4];
  v31 = __src[5];
  v26 = __src[0];
  v27 = __src[1];
  v12 = (_QWORD *)*a3;
  if ((a2 & 1) != 0)
  {
    memmove((void *)(v12[7] + 200 * a4), __src, 0xC8uLL);
    return sub_1AF3BA6B4(v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1AF3BA720);
  }
  v12[(a4 >> 6) + 8] |= 1 << a4;
  v13 = (_QWORD *)(v12[6] + 16 * a4);
  *v13 = a5;
  v13[1] = a6;
  v14 = v12[7] + 200 * a4;
  v15 = v29;
  *(_OWORD *)(v14 + 32) = v28;
  *(_OWORD *)(v14 + 48) = v15;
  v16 = v33;
  *(_OWORD *)(v14 + 96) = v32;
  *(_OWORD *)(v14 + 112) = v16;
  v17 = v31;
  *(_OWORD *)(v14 + 64) = v30;
  *(_OWORD *)(v14 + 80) = v17;
  *(_QWORD *)(v14 + 192) = v38;
  v18 = v37;
  *(_OWORD *)(v14 + 160) = v36;
  *(_OWORD *)(v14 + 176) = v18;
  v19 = v35;
  *(_OWORD *)(v14 + 128) = v34;
  *(_OWORD *)(v14 + 144) = v19;
  v20 = v27;
  *(_OWORD *)v14 = v26;
  *(_OWORD *)(v14 + 16) = v20;
  v21 = v12[2];
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (!v22)
  {
    v12[2] = v23;
    swift_bridgeObjectRetain();
    return sub_1AF3BA6B4(v39, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1AF3BA720);
  }
  __break(1u);
  return result;
}

unint64_t sub_1AF3B032C(unint64_t result, uint64_t a2)
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
  const void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1AF3E7D84();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1AF3E80D8();
        swift_bridgeObjectRetain();
        sub_1AF3E7940();
        v9 = sub_1AF3E8114();
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
          result = v14 + 200 * v3;
          v15 = (const void *)(v14 + 200 * v6);
          if (v3 != v6 || (v3 = v6, result >= (unint64_t)v15 + 200))
          {
            result = (unint64_t)memmove((void *)result, v15, 0xC8uLL);
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1AF3B050C(unint64_t result, uint64_t a2)
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
    result = sub_1AF3E7D84();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1AF3E80D8();
        swift_bridgeObjectRetain();
        sub_1AF3E7940();
        v9 = sub_1AF3E8114();
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

uint64_t sub_1AF3B06E0(uint64_t a1, uint64_t a2)
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
  v6 = sub_1AF396870(a1, a2);
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
    sub_1AF3AF36C();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1AF3B050C(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1AF3B07AC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1AF3B1364(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1AF3B0940(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
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
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v37 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36)
          goto LABEL_47;
        v13 = *(_QWORD *)(v37 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v36)
            goto LABEL_47;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v36)
              goto LABEL_47;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v36)
                goto LABEL_47;
              v13 = *(_QWORD *)(v37 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_1AF3BA9A0();
                  return v2;
                }
                v13 = *(_QWORD *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v36)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v37 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_1AF3E80D8();
      swift_bridgeObjectRetain();
      sub_1AF3E7940();
      v19 = sub_1AF3E8114();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_1AF3E8030() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_1AF3E8030() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x1E0C80A78](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_1AF3B14F0((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_1AF3BA9A0();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_1AF3B14F0((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_1AF3BA9A0();
      MEMORY[0x1AF45E3DC](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1AF3B0DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t isStackAllocationSafe;
  char v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = a2;
  v28 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v26 = a1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    while (1)
    {
      v6 = (uint64_t *)(v25[0] + 16 * v5);
      v8 = *v6;
      v7 = v6[1];
      ++v5;
      sub_1AF3E80D8();
      swift_bridgeObjectRetain();
      sub_1AF3E7940();
      v9 = sub_1AF3E8114();
      v10 = -1 << *(_BYTE *)(v2 + 32);
      v11 = v9 & ~v10;
      if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
      {
        v12 = *(_QWORD *)(v2 + 48);
        v13 = (_QWORD *)(v12 + 16 * v11);
        v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_1AF3E8030() & 1) != 0)
        {
          isStackAllocationSafe = swift_bridgeObjectRelease();
          v27 = v5;
LABEL_19:
          v19 = *(_BYTE *)(v2 + 32);
          v20 = (unint64_t)((1 << v19) + 63) >> 6;
          v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
          {
            MEMORY[0x1E0C80A78](isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            v22 = sub_1AF3B17CC((uint64_t)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            v22 = sub_1AF3B17CC((uint64_t)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x1AF45E3DC](v23, -1, -1);
          }
          return v22;
        }
        v15 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v15;
          if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
            break;
          v16 = (_QWORD *)(v12 + 16 * v11);
          v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_1AF3E8030() & 1) != 0)
          {
            v27 = v5;
            isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t sub_1AF3B10B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BB70);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * v4 - 64;
  v5 = sub_1AF3B3C58(&v7, (_BYTE *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_1AF3BA9A0();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

_QWORD *sub_1AF3B1188(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B488);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_1AF3B3DEC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1AF3BA9A0();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1AF3B126C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA90);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 328);
  v5 = sub_1AF3B3FE8(&v7, (char *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_1AF3BA9A0();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1AF3B1364(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_1AF3E80D8();
  swift_bridgeObjectRetain();
  sub_1AF3E7940();
  v6 = sub_1AF3E8114();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1AF3E8030() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1AF3E8030() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1AF3AD04C();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_1AF3B1C88(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1AF3B14F0(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;

  v7 = *(_QWORD *)(a3 + 16);
  v38 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v39 = a3 + 56;
  while (2)
  {
    v37 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          v14 = (unint64_t)(a5[2] + 64) >> 6;
          v15 = a5[3];
          if (v13 >= v14)
            goto LABEL_43;
          v16 = a5[1];
          v17 = *(_QWORD *)(v16 + 8 * v13);
          if (!v17)
          {
            v15 = v9 + 1;
            if (v9 + 2 >= v14)
              goto LABEL_43;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              v13 = v9 + 2;
            }
            else
            {
              v15 = v9 + 2;
              if (v9 + 3 >= v14)
                goto LABEL_43;
              v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                v13 = v9 + 3;
              }
              else
              {
                v13 = v9 + 4;
                v15 = v9 + 3;
                if (v9 + 4 >= v14)
                  goto LABEL_43;
                v17 = *(_QWORD *)(v16 + 8 * v13);
                if (!v17)
                {
                  v15 = v14 - 1;
                  v18 = v9 + 5;
                  while (v14 != v18)
                  {
                    v17 = *(_QWORD *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      v13 = v18 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_43:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return sub_1AF3B19F4(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_21:
          v11 = (v17 - 1) & v17;
          v12 = __clz(__rbit64(v17)) + (v13 << 6);
          v9 = v13;
        }
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1AF3E80D8();
        swift_bridgeObjectRetain();
        sub_1AF3E7940();
        v22 = sub_1AF3E8114();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v39 + 8 * (v24 >> 6))) != 0)
          break;
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      v27 = *(_QWORD *)(a3 + 48);
      v28 = (_QWORD *)(v27 + 16 * v24);
      v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_1AF3E8030() & 1) == 0)
      {
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_1AF3E8030() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      result = swift_bridgeObjectRelease();
LABEL_29:
      v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_45:
      __break(1u);
      return result;
    }
    if (v37 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1AF3B17CC(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  unint64_t v26;
  _QWORD *v27;
  BOOL v28;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v30 = (unint64_t *)result;
  v31 = v6 - 1;
  v8 = *a5;
  v7 = a5[1];
  v9 = *(_QWORD *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_1AF3B19F4(v30, a2, v31, a3);
  }
  v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9)
      goto LABEL_29;
    v11 = v8 + 16 * v7;
    v13 = *(_QWORD *)(v11 + 32);
    v12 = *(_QWORD *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_1AF3E80D8();
    swift_bridgeObjectRetain();
    sub_1AF3E7940();
    v14 = sub_1AF3E8114();
    v15 = -1 << *(_BYTE *)(a3 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = 1 << v16;
    if (((1 << v16) & *(_QWORD *)(v32 + 8 * (v16 >> 6))) == 0)
      goto LABEL_4;
    v19 = *(_QWORD *)(a3 + 48);
    v20 = (_QWORD *)(v19 + 16 * v16);
    v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_1AF3E8030() & 1) == 0)
    {
      v24 = ~v15;
      for (i = v16 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v19 + 16 * v26);
        v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_1AF3E8030() & 1) != 0)
        {
          result = swift_bridgeObjectRelease();
          v17 = v26 >> 6;
          v18 = 1 << v26;
          goto LABEL_15;
        }
      }
LABEL_4:
      result = swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    result = swift_bridgeObjectRelease();
LABEL_15:
    v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      v23 = v31 - 1;
      if (__OFSUB__(v31, 1))
        goto LABEL_30;
      --v31;
      if (!v23)
        return MEMORY[0x1E0DEE9E8];
    }
LABEL_5:
    v8 = *a5;
    v7 = a5[1];
    v9 = *(_QWORD *)(*a5 + 16);
    if (v7 == v9)
      goto LABEL_2;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1AF3B19F4(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
    v8 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAA0);
  result = sub_1AF3E7DCC();
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
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
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
    sub_1AF3E80D8();
    swift_bridgeObjectRetain();
    sub_1AF3E7940();
    result = sub_1AF3E8114();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
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
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_1AF3B1C88(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1AF3E7D84();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1AF3E80D8();
        swift_bridgeObjectRetain();
        sub_1AF3E7940();
        v10 = sub_1AF3E8114();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1AF3B1E4C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v50;
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
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAC8);
  result = sub_1AF3E7F10();
  v8 = result;
  v50 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v50)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v50)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v50)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v50)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v50)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_QWORD *)(v4 + 56) + 200 * v13;
    v21 = *(_OWORD *)(v20 + 16);
    v22 = *(_OWORD *)(v20 + 32);
    v23 = *(_OWORD *)(v20 + 48);
    v56 = *(_OWORD *)(v20 + 64);
    v54 = v22;
    v55 = v23;
    v24 = *(_OWORD *)(v20 + 128);
    v26 = *(_OWORD *)(v20 + 80);
    v25 = *(_OWORD *)(v20 + 96);
    v59 = *(_OWORD *)(v20 + 112);
    v60 = v24;
    v57 = v26;
    v58 = v25;
    v28 = *(_OWORD *)(v20 + 160);
    v27 = *(_OWORD *)(v20 + 176);
    v29 = *(_OWORD *)(v20 + 144);
    v64 = *(_QWORD *)(v20 + 192);
    v62 = v28;
    v63 = v27;
    v61 = v29;
    v52 = *(_OWORD *)v20;
    v53 = v21;
    sub_1AF3E80D8();
    swift_bridgeObjectRetain();
    sub_1AF3B7E08((uint64_t)&v52);
    sub_1AF3E7940();
    result = sub_1AF3E8114();
    v30 = -1 << *(_BYTE *)(v8 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v11 + 8 * (v31 >> 6))) != 0)
    {
      v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v11 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v36 = v32 == v35;
        if (v32 == v35)
          v32 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v11 + 8 * v32);
      }
      while (v37 == -1);
      v33 = __clz(__rbit64(~v37)) + (v32 << 6);
    }
    *(_QWORD *)(v11 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    v38 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v33);
    *v38 = v19;
    v38[1] = v18;
    v39 = *(_QWORD *)(v8 + 56) + 200 * v33;
    *(_OWORD *)v39 = v52;
    v40 = v53;
    v41 = v54;
    v42 = v56;
    *(_OWORD *)(v39 + 48) = v55;
    *(_OWORD *)(v39 + 64) = v42;
    *(_OWORD *)(v39 + 16) = v40;
    *(_OWORD *)(v39 + 32) = v41;
    v43 = v57;
    v44 = v58;
    v45 = v60;
    *(_OWORD *)(v39 + 112) = v59;
    *(_OWORD *)(v39 + 128) = v45;
    *(_OWORD *)(v39 + 80) = v43;
    *(_OWORD *)(v39 + 96) = v44;
    v46 = v61;
    v47 = v62;
    v48 = v63;
    *(_QWORD *)(v39 + 192) = v64;
    *(_OWORD *)(v39 + 160) = v47;
    *(_OWORD *)(v39 + 176) = v48;
    *(_OWORD *)(v39 + 144) = v46;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1AF3B2188(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

uint64_t sub_1AF3B2200(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  unint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;

  v3 = a1[1];
  result = sub_1AF3E8000();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_1AF3B2FDC(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_151;
  v101 = result;
  v98 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x1E0DEE9D8];
    v104 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
      v10 = MEMORY[0x1E0DEE9D8];
LABEL_117:
      result = v10;
      v100 = v7;
      if (v11 >= 2)
      {
        v91 = *v98;
        do
        {
          v92 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v91)
            goto LABEL_159;
          v93 = result;
          v94 = *(_QWORD *)(result + 32 + 16 * v92);
          v95 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_1AF3B31A0((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v91 + 16 * v95, v104);
          if (v1)
            break;
          if (v95 < v94)
            goto LABEL_147;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_1AF3977F4(v93);
            v93 = result;
          }
          if (v92 >= *(_QWORD *)(v93 + 16))
            goto LABEL_148;
          v96 = (_QWORD *)(v93 + 32 + 16 * v92);
          *v96 = v94;
          v96[1] = v95;
          v97 = *(_QWORD *)(v93 + 16);
          if (v11 > v97)
            goto LABEL_149;
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          result = v93;
          *(_QWORD *)(v93 + 16) = v97 - 1;
          v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v100 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v100 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v6 = v5 >> 1;
    result = sub_1AF3E7AE4();
    *(_QWORD *)(result + 16) = v6;
    v100 = result;
    v104 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v99 = v9 + 8;
  v10 = MEMORY[0x1E0DEE9D8];
  v102 = v3;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_45;
    v13 = (uint64_t *)(v9 + 16 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 16 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_44;
      v17 = 0;
    }
    else
    {
      result = sub_1AF3E8030();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v99 + 16 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 16 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_1AF3E8030();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 2;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_155;
      if (v12 < v18)
      {
        v23 = 16 * v18;
        v24 = 16 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_158;
            v27 = v9 + v23;
            v28 = *(_QWORD *)(v9 + v24);
            v29 = *(_QWORD *)(v9 + v24 + 8);
            *(_OWORD *)(v9 + v24) = *(_OWORD *)(v9 + v23 - 16);
            *(_QWORD *)(v27 - 16) = v28;
            *(_QWORD *)(v27 - 8) = v29;
          }
          ++v26;
          v23 -= 16;
          v24 += 16;
        }
        while (v26 < v25);
      }
LABEL_44:
      v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_150;
      if (v8 - v12 < v101)
        break;
    }
LABEL_66:
    if (v8 < v12)
      goto LABEL_145;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1AF397654(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v38 = *(_QWORD *)(v10 + 16);
    v37 = *(_QWORD *)(v10 + 24);
    v11 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      result = (uint64_t)sub_1AF397654((char *)(v37 > 1), v38 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v39 = v10 + 32;
    v40 = (uint64_t *)(v10 + 32 + 16 * v38);
    *v40 = v12;
    v40[1] = v8;
    if (v38)
    {
      v103 = v8;
      while (1)
      {
        v41 = v11 - 1;
        if (v11 >= 4)
        {
          v46 = v39 + 16 * v11;
          v47 = *(_QWORD *)(v46 - 64);
          v48 = *(_QWORD *)(v46 - 56);
          v52 = __OFSUB__(v48, v47);
          v49 = v48 - v47;
          if (v52)
            goto LABEL_134;
          v51 = *(_QWORD *)(v46 - 48);
          v50 = *(_QWORD *)(v46 - 40);
          v52 = __OFSUB__(v50, v51);
          v44 = v50 - v51;
          v45 = v52;
          if (v52)
            goto LABEL_135;
          v53 = v11 - 2;
          v54 = (uint64_t *)(v39 + 16 * (v11 - 2));
          v56 = *v54;
          v55 = v54[1];
          v52 = __OFSUB__(v55, v56);
          v57 = v55 - v56;
          if (v52)
            goto LABEL_136;
          v52 = __OFADD__(v44, v57);
          v58 = v44 + v57;
          if (v52)
            goto LABEL_138;
          if (v58 >= v49)
          {
            v76 = (uint64_t *)(v39 + 16 * v41);
            v78 = *v76;
            v77 = v76[1];
            v52 = __OFSUB__(v77, v78);
            v79 = v77 - v78;
            if (v52)
              goto LABEL_144;
            v69 = v44 < v79;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v70 = *(_QWORD *)(v10 + 32);
            v71 = *(_QWORD *)(v10 + 40);
            v52 = __OFSUB__(v71, v70);
            v63 = v71 - v70;
            v64 = v52;
            goto LABEL_98;
          }
          v43 = *(_QWORD *)(v10 + 32);
          v42 = *(_QWORD *)(v10 + 40);
          v52 = __OFSUB__(v42, v43);
          v44 = v42 - v43;
          v45 = v52;
        }
        if ((v45 & 1) != 0)
          goto LABEL_137;
        v53 = v11 - 2;
        v59 = (uint64_t *)(v39 + 16 * (v11 - 2));
        v61 = *v59;
        v60 = v59[1];
        v62 = __OFSUB__(v60, v61);
        v63 = v60 - v61;
        v64 = v62;
        if (v62)
          goto LABEL_139;
        v65 = (uint64_t *)(v39 + 16 * v41);
        v67 = *v65;
        v66 = v65[1];
        v52 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v52)
          goto LABEL_141;
        if (__OFADD__(v63, v68))
          goto LABEL_143;
        if (v63 + v68 >= v44)
        {
          v69 = v44 < v68;
LABEL_104:
          if (v69)
            v41 = v53;
          goto LABEL_106;
        }
LABEL_98:
        if ((v64 & 1) != 0)
          goto LABEL_140;
        v72 = (uint64_t *)(v39 + 16 * v41);
        v74 = *v72;
        v73 = v72[1];
        v52 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v52)
          goto LABEL_142;
        if (v75 < v63)
          goto LABEL_15;
LABEL_106:
        v80 = v41 - 1;
        if (v41 - 1 >= v11)
        {
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
          goto LABEL_154;
        }
        v81 = v9;
        if (!v9)
          goto LABEL_157;
        v82 = v10;
        v83 = (uint64_t *)(v39 + 16 * v80);
        v84 = *v83;
        v85 = v39;
        v86 = v41;
        v87 = (_QWORD *)(v39 + 16 * v41);
        v88 = v87[1];
        v89 = v81;
        result = sub_1AF3B31A0((char *)(v81 + 16 * *v83), (char *)(v81 + 16 * *v87), v81 + 16 * v88, v104);
        if (v1)
          goto LABEL_114;
        if (v88 < v84)
          goto LABEL_131;
        if (v86 > *(_QWORD *)(v82 + 16))
          goto LABEL_132;
        *v83 = v84;
        *(_QWORD *)(v85 + 16 * v80 + 8) = v88;
        v90 = *(_QWORD *)(v82 + 16);
        if (v86 >= v90)
          goto LABEL_133;
        v10 = v82;
        v11 = v90 - 1;
        result = (uint64_t)memmove(v87, v87 + 2, 16 * (v90 - 1 - v86));
        v39 = v85;
        *(_QWORD *)(v82 + 16) = v90 - 1;
        v9 = v89;
        v8 = v103;
        if (v90 <= 2)
          goto LABEL_15;
      }
    }
    v11 = 1;
LABEL_15:
    v3 = v102;
    if (v8 >= v102)
    {
      v7 = v100;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v101))
    goto LABEL_153;
  if (v12 + v101 >= v3)
    v30 = v3;
  else
    v30 = v12 + v101;
  if (v30 >= v12)
  {
    if (v8 != v30)
    {
      v31 = (uint64_t *)(v9 + 16 * v8);
      do
      {
        v32 = (uint64_t *)(v9 + 16 * v8);
        result = *v32;
        v33 = v32[1];
        v34 = v12;
        v35 = v31;
        do
        {
          if (result == *(v35 - 2) && v33 == *(v35 - 1))
            break;
          result = sub_1AF3E8030();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_156;
          result = *v35;
          v33 = v35[1];
          *(_OWORD *)v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = result;
          v35 -= 2;
          ++v34;
        }
        while (v8 != v34);
        ++v8;
        v31 += 2;
      }
      while (v8 != v30);
      v8 = v30;
    }
    goto LABEL_66;
  }
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
  return result;
}

uint64_t sub_1AF3B28A4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  unint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  char v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  _BYTE __dst[321];
  uint64_t v101;

  v3 = a1[1];
  result = sub_1AF3E8000();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_156;
    if (v3)
      return sub_1AF3B30A8(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_155;
  v96 = result;
  v97 = v3;
  v101 = v1;
  v92 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x1E0DEE9D8];
    v99 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
      v10 = MEMORY[0x1E0DEE9D8];
LABEL_121:
      result = v10;
      v95 = v7;
      if (v11 >= 2)
      {
        v84 = *v92;
        do
        {
          v85 = v11 - 2;
          if (v11 < 2)
            goto LABEL_150;
          if (!v84)
            goto LABEL_163;
          v86 = result;
          v87 = *(_QWORD *)(result + 32 + 16 * v85);
          v88 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          v89 = v101;
          result = sub_1AF3B33CC((char *)(v84 + 328 * v87), (char *)(v84 + 328 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v84 + 328 * v88, v99);
          v101 = v89;
          if (v89)
            break;
          if (v88 < v87)
            goto LABEL_151;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_1AF3977F4(v86);
            v86 = result;
          }
          if (v85 >= *(_QWORD *)(v86 + 16))
            goto LABEL_152;
          v90 = (_QWORD *)(v86 + 32 + 16 * v85);
          *v90 = v87;
          v90[1] = v88;
          v91 = *(_QWORD *)(v86 + 16);
          if (v11 > v91)
            goto LABEL_153;
          memmove((void *)(v86 + 32 + 16 * (v11 - 1)), (const void *)(v86 + 32 + 16 * v11), 16 * (v91 - v11));
          result = v86;
          *(_QWORD *)(v86 + 16) = v91 - 1;
          v11 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_118:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v95 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v95 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v6 = v5 >> 1;
    result = sub_1AF3E7AE4();
    *(_QWORD *)(result + 16) = v6;
    v3 = v97;
    v95 = result;
    v99 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v93 = *a1 - 328;
  v94 = *a1 + 8;
  v10 = MEMORY[0x1E0DEE9D8];
  v98 = *a1;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
    {
LABEL_23:
      if (v8 < v3)
        goto LABEL_24;
      goto LABEL_70;
    }
    v13 = (uint64_t *)(v9 + 328 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 328 * v12);
    if (result == *v15 && v14 == v15[1])
      break;
    result = sub_1AF3E8030();
    v17 = result;
    v18 = v12 + 2;
    if (v12 + 2 < v3)
      goto LABEL_45;
    v8 = v12 + 2;
    if ((result & 1) == 0)
      goto LABEL_23;
LABEL_60:
    if (v18 < v12)
      goto LABEL_159;
LABEL_61:
    if (v12 >= v18)
    {
      v8 = v18;
      if (v18 < v3)
        goto LABEL_24;
    }
    else
    {
      v28 = (char *)(v93 + 328 * v18);
      v29 = v18;
      v30 = v12;
      v31 = (char *)(v9 + 328 * v12);
      do
      {
        if (v30 != --v29)
        {
          if (!v9)
            goto LABEL_162;
          memcpy(__dst, v31, sizeof(__dst));
          memmove(v31, v28, 0x148uLL);
          result = (uint64_t)memcpy(v28, __dst, 0x141uLL);
        }
        ++v30;
        v28 -= 328;
        v31 += 328;
      }
      while (v30 < v29);
      v8 = v18;
      v3 = v97;
      if (v18 < v97)
      {
LABEL_24:
        if (__OFSUB__(v8, v12))
          goto LABEL_154;
        if (v8 - v12 < v96)
        {
          if (__OFADD__(v12, v96))
            goto LABEL_157;
          if (v12 + v96 >= v3)
            v19 = v3;
          else
            v19 = v12 + v96;
          if (v19 < v12)
          {
LABEL_158:
            __break(1u);
            goto LABEL_159;
          }
          if (v8 != v19)
          {
            v20 = (_QWORD *)(v93 + 328 * v8);
            do
            {
              v21 = v12;
              v22 = v20;
              do
              {
                result = v22[41];
                if (result == *v22 && v22[42] == v22[1])
                  break;
                result = sub_1AF3E8030();
                if ((result & 1) == 0)
                  break;
                if (!v9)
                  goto LABEL_160;
                memcpy(__dst, v22 + 41, sizeof(__dst));
                memcpy(v22 + 41, v22, 0x148uLL);
                result = (uint64_t)memcpy(v22, __dst, 0x141uLL);
                v22 -= 41;
                ++v21;
              }
              while (v8 != v21);
              ++v8;
              v20 += 41;
            }
            while (v8 != v19);
            v8 = v19;
          }
        }
      }
    }
LABEL_70:
    if (v8 < v12)
      goto LABEL_149;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1AF397654(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v33 = *(_QWORD *)(v10 + 16);
    v32 = *(_QWORD *)(v10 + 24);
    v11 = v33 + 1;
    if (v33 >= v32 >> 1)
    {
      result = (uint64_t)sub_1AF397654((char *)(v32 > 1), v33 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v34 = v10 + 32;
    v35 = (uint64_t *)(v10 + 32 + 16 * v33);
    *v35 = v12;
    v35[1] = v8;
    if (v33)
    {
      v9 = v98;
      while (1)
      {
        v36 = v11 - 1;
        if (v11 >= 4)
        {
          v41 = v34 + 16 * v11;
          v42 = *(_QWORD *)(v41 - 64);
          v43 = *(_QWORD *)(v41 - 56);
          v47 = __OFSUB__(v43, v42);
          v44 = v43 - v42;
          if (v47)
            goto LABEL_138;
          v46 = *(_QWORD *)(v41 - 48);
          v45 = *(_QWORD *)(v41 - 40);
          v47 = __OFSUB__(v45, v46);
          v39 = v45 - v46;
          v40 = v47;
          if (v47)
            goto LABEL_139;
          v48 = v11 - 2;
          v49 = (uint64_t *)(v34 + 16 * (v11 - 2));
          v51 = *v49;
          v50 = v49[1];
          v47 = __OFSUB__(v50, v51);
          v52 = v50 - v51;
          if (v47)
            goto LABEL_140;
          v47 = __OFADD__(v39, v52);
          v53 = v39 + v52;
          if (v47)
            goto LABEL_142;
          if (v53 >= v44)
          {
            v71 = (uint64_t *)(v34 + 16 * v36);
            v73 = *v71;
            v72 = v71[1];
            v47 = __OFSUB__(v72, v73);
            v74 = v72 - v73;
            if (v47)
              goto LABEL_148;
            v64 = v39 < v74;
            goto LABEL_108;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v65 = *(_QWORD *)(v10 + 32);
            v66 = *(_QWORD *)(v10 + 40);
            v47 = __OFSUB__(v66, v65);
            v58 = v66 - v65;
            v59 = v47;
            goto LABEL_102;
          }
          v38 = *(_QWORD *)(v10 + 32);
          v37 = *(_QWORD *)(v10 + 40);
          v47 = __OFSUB__(v37, v38);
          v39 = v37 - v38;
          v40 = v47;
        }
        if ((v40 & 1) != 0)
          goto LABEL_141;
        v48 = v11 - 2;
        v54 = (uint64_t *)(v34 + 16 * (v11 - 2));
        v56 = *v54;
        v55 = v54[1];
        v57 = __OFSUB__(v55, v56);
        v58 = v55 - v56;
        v59 = v57;
        if (v57)
          goto LABEL_143;
        v60 = (uint64_t *)(v34 + 16 * v36);
        v62 = *v60;
        v61 = v60[1];
        v47 = __OFSUB__(v61, v62);
        v63 = v61 - v62;
        if (v47)
          goto LABEL_145;
        if (__OFADD__(v58, v63))
          goto LABEL_147;
        if (v58 + v63 >= v39)
        {
          v64 = v39 < v63;
LABEL_108:
          if (v64)
            v36 = v48;
          goto LABEL_110;
        }
LABEL_102:
        if ((v59 & 1) != 0)
          goto LABEL_144;
        v67 = (uint64_t *)(v34 + 16 * v36);
        v69 = *v67;
        v68 = v67[1];
        v47 = __OFSUB__(v68, v69);
        v70 = v68 - v69;
        if (v47)
          goto LABEL_146;
        if (v70 < v58)
          goto LABEL_15;
LABEL_110:
        v75 = v36 - 1;
        if (v36 - 1 >= v11)
        {
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
        if (!v9)
          goto LABEL_161;
        v76 = v10;
        v77 = v9;
        v78 = (uint64_t *)(v34 + 16 * v75);
        v79 = *v78;
        v80 = (_QWORD *)(v34 + 16 * v36);
        v81 = v80[1];
        v82 = v101;
        result = sub_1AF3B33CC((char *)(v77 + 328 * *v78), (char *)(v77 + 328 * *v80), v77 + 328 * v81, v99);
        v101 = v82;
        if (v82)
          goto LABEL_118;
        if (v81 < v79)
          goto LABEL_135;
        if (v36 > *(_QWORD *)(v76 + 16))
          goto LABEL_136;
        *v78 = v79;
        *(_QWORD *)(v34 + 16 * v75 + 8) = v81;
        v83 = *(_QWORD *)(v76 + 16);
        if (v36 >= v83)
          goto LABEL_137;
        v10 = v76;
        v11 = v83 - 1;
        result = (uint64_t)memmove((void *)(v34 + 16 * v36), v80 + 2, 16 * (v83 - 1 - v36));
        *(_QWORD *)(v76 + 16) = v83 - 1;
        v64 = v83 > 2;
        v9 = v98;
        if (!v64)
          goto LABEL_15;
      }
    }
    v11 = 1;
    v9 = v98;
LABEL_15:
    v3 = v97;
    if (v8 >= v97)
    {
      v7 = v95;
      goto LABEL_121;
    }
  }
  v18 = v12 + 2;
  if (v12 + 2 >= v3)
  {
    v8 = v12 + 2;
    goto LABEL_70;
  }
  v17 = 0;
LABEL_45:
  v24 = (_QWORD *)(v94 + 328 * v18);
  while (1)
  {
    result = *(v24 - 1);
    v26 = (_QWORD *)(v9 + 328 * v8);
    if (result != *v26 || *v24 != v26[1])
    {
      result = sub_1AF3E8030();
      if (((v17 ^ result) & 1) != 0)
        goto LABEL_59;
      goto LABEL_47;
    }
    if ((v17 & 1) != 0)
      break;
LABEL_47:
    v24 += 41;
    v25 = v18 + 1;
    v8 = v18;
    v18 = v25;
    if (v25 >= v97)
    {
      v18 = v25;
LABEL_59:
      v3 = v97;
      v8 = v18;
      if ((v17 & 1) == 0)
        goto LABEL_23;
      goto LABEL_60;
    }
  }
  v3 = v97;
  if (v18 >= v12)
    goto LABEL_61;
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
  return result;
}

uint64_t sub_1AF3B2FDC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_1AF3E8030(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1AF3B30A8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  _BYTE v12[321];

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 328 * a3 - 328;
LABEL_5:
    v9 = v6;
    v10 = (_QWORD *)v8;
    while (1)
    {
      result = v10[41];
      v11 = result == *v10 && v10[42] == v10[1];
      if (v11 || (result = sub_1AF3E8030(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 328;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      memcpy(v12, v10 + 41, sizeof(v12));
      memcpy(v10 + 41, v10, 0x148uLL);
      result = (uint64_t)memcpy(v10, v12, 0x141uLL);
      v10 -= 41;
      if (v4 == ++v9)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1AF3B31A0(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  BOOL v20;
  BOOL v21;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 15;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 15;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4)
      memmove(a4, __src, 16 * v13);
    v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16)
      goto LABEL_48;
    v17 = (char *)(a3 - 16);
    while (1)
    {
      v18 = v17 + 16;
      v19 = v6 - 16;
      v20 = *((_QWORD *)v14 - 2) == *((_QWORD *)v6 - 2) && *((_QWORD *)v14 - 1) == *((_QWORD *)v6 - 1);
      if (v20 || (sub_1AF3E8030() & 1) == 0)
      {
        v19 = v14 - 16;
        if (v18 != v14)
        {
          v14 -= 16;
LABEL_45:
          *(_OWORD *)v17 = *(_OWORD *)v19;
          goto LABEL_46;
        }
        v21 = v17 >= v14;
        v14 -= 16;
        if (v21)
          goto LABEL_45;
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 16;
          goto LABEL_45;
        }
        v21 = v17 >= v6;
        v6 -= 16;
        if (v21)
          goto LABEL_45;
      }
LABEL_46:
      if (v6 > v7)
      {
        v17 -= 16;
        if (v14 > v4)
          continue;
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4)
    memmove(a4, __dst, 16 * v10);
  v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v15 || (sub_1AF3E8030() & 1) == 0)
        break;
      v16 = v6;
      v15 = v7 == v6;
      v6 += 16;
      if (!v15)
        goto LABEL_20;
LABEL_21:
      v7 += 16;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_23;
    }
    v16 = v4;
    v15 = v7 == v4;
    v4 += 16;
    if (v15)
      goto LABEL_21;
LABEL_20:
    *(_OWORD *)v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_23:
  v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0])
    memmove(v6, v4, 16 * ((v14 - v4) / 16));
  return 1;
}

uint64_t sub_1AF3B33CC(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  BOOL v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  BOOL v20;
  BOOL v21;
  size_t v22;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = (__src - __dst) / 328;
  v10 = a3 - (_QWORD)__src;
  v11 = (uint64_t)(a3 - (_QWORD)__src) / 328;
  if (v9 >= v11)
  {
    v16 = 328 * v11;
    if (a4 != __src || &__src[v16] <= a4)
      memmove(a4, __src, 328 * v11);
    v13 = &v4[v16];
    if (v7 >= v6 || v10 < 328)
      goto LABEL_44;
    v17 = (char *)(a3 - 328);
    while (1)
    {
      v18 = v17 + 328;
      v19 = v6 - 328;
      v20 = *((_QWORD *)v13 - 41) == *((_QWORD *)v6 - 41) && *((_QWORD *)v13 - 40) == *((_QWORD *)v6 - 40);
      if (v20 || (sub_1AF3E8030() & 1) == 0)
      {
        v19 = v13 - 328;
        if (v18 != v13)
        {
          v13 -= 328;
LABEL_41:
          memmove(v17, v19, 0x148uLL);
          goto LABEL_42;
        }
        v21 = v17 >= v13;
        v13 -= 328;
        if (v21)
          goto LABEL_41;
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 328;
          goto LABEL_41;
        }
        v21 = v17 >= v6;
        v6 -= 328;
        if (v21)
          goto LABEL_41;
      }
LABEL_42:
      if (v6 > v7)
      {
        v17 -= 328;
        if (v13 > v4)
          continue;
      }
      goto LABEL_44;
    }
  }
  v12 = 328 * v9;
  if (a4 != __dst || &__dst[v12] <= a4)
    memmove(a4, __dst, v12);
  v13 = &v4[v12];
  if ((unint64_t)v6 < a3 && v8 >= 328)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v14 || (sub_1AF3E8030() & 1) == 0)
        break;
      v15 = v6;
      v14 = v7 == v6;
      v6 += 328;
      if (!v14)
        goto LABEL_16;
LABEL_17:
      v7 += 328;
      if (v4 >= v13 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v15 = v4;
    v14 = v7 == v4;
    v4 += 328;
    if (v14)
      goto LABEL_17;
LABEL_16:
    memmove(v7, v15, 0x148uLL);
    goto LABEL_17;
  }
LABEL_19:
  v6 = v7;
LABEL_44:
  v22 = 328 * ((v13 - v4) / 328);
  if (v6 != v4 || v6 >= &v4[v22])
    memmove(v6, v4, v22);
  return 1;
}

unint64_t sub_1AF3B3638(unint64_t result, int64_t a2, const void *a3)
{
  char **v3;
  char *v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v13;
  char *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v5 = *v3;
  v6 = *((_QWORD *)*v3 + 2);
  if (v6 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v10 = v6 + v9;
  if (__OFADD__(v6, v9))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v10 > *((_QWORD *)v5 + 3) >> 1)
  {
    if (v6 <= v10)
      v13 = v6 + v9;
    else
      v13 = v6;
    v5 = sub_1AF3AFD80(isUniquelyReferenced_nonNull_native, v13, 1, v5);
  }
  v14 = &v5[328 * v7 + 32];
  result = swift_arrayDestroy();
  if (!v9)
    goto LABEL_19;
  v15 = *((_QWORD *)v5 + 2);
  v16 = __OFSUB__(v15, a2);
  v17 = v15 - a2;
  if (v16)
    goto LABEL_25;
  result = (unint64_t)(v14 + 328);
  v18 = &v5[328 * a2 + 32];
  v19 = 328 * v17;
  if (v14 + 328 != v18 || result >= (unint64_t)&v18[v19])
    result = (unint64_t)memmove((void *)result, v18, v19);
  v20 = *((_QWORD *)v5 + 2);
  v16 = __OFADD__(v20, v9);
  v21 = v20 + v9;
  if (!v16)
  {
    *((_QWORD *)v5 + 2) = v21;
LABEL_19:
    result = (unint64_t)memcpy(v14, a3, 0x141uLL);
    *v3 = v5;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1AF3B3778@<X0>(uint64_t *a1@<X0>, char a2@<W1>, void *a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  BOOL v33;
  void *v34;
  uint64_t result;
  _QWORD *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  uint64_t *__src;
  _BYTE v44[336];

  v4 = v3;
  v8 = *v3;
  sub_1AF3E80D8();
  v9 = *a1;
  v10 = a1[1];
  __src = a1;
  swift_bridgeObjectRetain();
  sub_1AF3E7940();
  swift_bridgeObjectRelease();
  v11 = sub_1AF3E8114();
  v12 = -1 << *(_BYTE *)(v8 + 32);
  v13 = v11 & ~v12;
  v14 = v8 + 56;
  if (((*(_QWORD *)(v8 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v15 = *(_QWORD *)(v8 + 48);
    v16 = (_QWORD *)(v15 + 328 * v13);
    v17 = *v16 == v9 && v16[1] == v10;
    if (v17 || (sub_1AF3E8030() & 1) != 0)
    {
      v18 = 0;
      v19 = 1;
    }
    else
    {
      v42 = a3;
      v20 = ~v12;
      v13 = (v13 + 1) & ~v12;
      if (((*(_QWORD *)(v14 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
      {
        v18 = 1;
        while (1)
        {
          v21 = (_QWORD *)(v15 + 328 * v13);
          v22 = *v21 == v9 && v21[1] == v10;
          if (v22 || (sub_1AF3E8030() & 1) != 0)
            break;
          v13 = (v13 + 1) & v20;
          if (((*(_QWORD *)(v14 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          {
            v19 = 0;
            goto LABEL_20;
          }
        }
        v18 = 0;
        v19 = 1;
      }
      else
      {
        v19 = 0;
        v18 = 1;
      }
LABEL_20:
      a3 = v42;
    }
  }
  else
  {
    v19 = 0;
    v18 = 1;
  }
  v23 = *(_QWORD *)(v8 + 16);
  v24 = v23 + v18;
  if (__OFADD__(v23, v18))
  {
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v25 = *(_QWORD *)(v8 + 24);
  if (v25 >= v24 && (a2 & 1) != 0)
  {
    if (!v19)
      goto LABEL_48;
    goto LABEL_39;
  }
  if ((a2 & 1) != 0)
  {
    v26 = a3;
    sub_1AF3AC4B0();
  }
  else
  {
    if (v25 >= v24)
    {
      sub_1AF3AD38C();
      if (!v19)
      {
LABEL_48:
        v38 = *v4;
        *(_QWORD *)(*v4 + 8 * (v13 >> 6) + 56) |= 1 << v13;
        memcpy((void *)(*(_QWORD *)(v38 + 48) + 328 * v13), __src, 0x141uLL);
        v39 = *(_QWORD *)(v38 + 16);
        v40 = __OFADD__(v39, 1);
        v41 = v39 + 1;
        if (!v40)
        {
          *(_QWORD *)(v38 + 16) = v41;
          sub_1AF3BA4FC((uint64_t)v44);
          return sub_1AF3478BC((uint64_t)v44, (uint64_t)a3, &qword_1EEE3BA18);
        }
        goto LABEL_51;
      }
LABEL_39:
      v34 = (void *)(*(_QWORD *)(*v4 + 48) + 328 * v13);
      memmove(a3, v34, 0x141uLL);
      memcpy(v34, __src, 0x141uLL);
      return nullsub_1(a3);
    }
    v26 = a3;
    sub_1AF3ADC58();
  }
  v27 = *v4;
  sub_1AF3E80D8();
  swift_bridgeObjectRetain();
  sub_1AF3E7940();
  swift_bridgeObjectRelease();
  v28 = sub_1AF3E8114();
  v29 = -1 << *(_BYTE *)(v27 + 32);
  v13 = v28 & ~v29;
  v30 = v27 + 56;
  if (((*(_QWORD *)(v27 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
    goto LABEL_47;
  v31 = *(_QWORD *)(v27 + 48);
  v32 = (_QWORD *)(v31 + 328 * v13);
  v33 = *v32 == v9 && v32[1] == v10;
  if (v33 || (sub_1AF3E8030() & 1) != 0)
    goto LABEL_38;
  v13 = (v13 + 1) & ~v29;
  if (((*(_QWORD *)(v30 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
  {
LABEL_47:
    a3 = v26;
    if ((v19 & 1) == 0)
      goto LABEL_48;
    goto LABEL_52;
  }
  while (1)
  {
    v36 = (_QWORD *)(v31 + 328 * v13);
    v37 = *v36 == v9 && v36[1] == v10;
    if (v37 || (sub_1AF3E8030() & 1) != 0)
      break;
    v13 = (v13 + 1) & ~v29;
    if (((*(_QWORD *)(v30 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      goto LABEL_47;
  }
LABEL_38:
  a3 = v26;
  if ((v19 & 1) != 0)
    goto LABEL_39;
LABEL_52:
  result = sub_1AF3E8060();
  __break(1u);
  return result;
}

uint64_t sub_1AF3B3B3C(uint64_t a1)
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

_QWORD *sub_1AF3B3BC4(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

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
    *result = *(_QWORD *)(*(_QWORD *)(a5 + 56) + 8 * a2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return (_QWORD *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

_QWORD *sub_1AF3B3C58(_QWORD *result, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_BYTE *)(*(_QWORD *)(a4 + 48) + v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1AF3B3DEC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

_QWORD *sub_1AF3B3FE8(_QWORD *result, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  const void *v19;
  uint64_t v20;
  _QWORD *v21;
  _BYTE __dst[336];

  v5 = a4 + 56;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v10 = a2;
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v21 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = (const void *)(*(_QWORD *)(a4 + 48) + 328 * v15);
    memcpy(__dst, v19, 0x141uLL);
    memmove(v10, v19, 0x141uLL);
    if (v12 == v9)
    {
      sub_1AF3B6C90((uint64_t)__dst);
      goto LABEL_38;
    }
    v10 += 328;
    result = (_QWORD *)sub_1AF3B6C90((uint64_t)__dst);
    if (v8)
      goto LABEL_8;
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v16 >= v13)
      goto LABEL_33;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v5 + 8 * v11);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_33;
        v17 = *(_QWORD *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(_QWORD *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v5 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v20;
      result = v21;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1AF3B420C(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_1AF3B42AC(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_1AF3B4390@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  a2[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AF3B43C4()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  _QWORD v23[4];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = 16 * v6;
    v8 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v9 = *v8;
    v10 = v8[1];
    v11 = (uint64_t *)(*(_QWORD *)(v1 + 56) + v7);
    v12 = *v11;
    v13 = v11[1];
    v0[3] = v4;
    v0[4] = v5;
    v14 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v23[0] = v9;
    v23[1] = v10;
    v23[2] = v12;
    v23[3] = v13;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(&v22, v23);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v22;
  }
  v16 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v17 = (unint64_t)(v0[2] + 64) >> 6;
    if (v16 < v17)
    {
      v18 = v0[1];
      v19 = *(_QWORD *)(v18 + 8 * v16);
      if (v19)
      {
LABEL_7:
        v5 = (v19 - 1) & v19;
        v6 = __clz(__rbit64(v19)) + (v16 << 6);
        v4 = v16;
        goto LABEL_3;
      }
      v20 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v17)
      {
        v19 = *(_QWORD *)(v18 + 8 * v20);
        if (v19)
        {
LABEL_10:
          v16 = v20;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v17)
        {
          v19 = *(_QWORD *)(v18 + 8 * (v3 + 3));
          if (v19)
          {
            v16 = v3 + 3;
            goto LABEL_7;
          }
          v20 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v17)
          {
            v19 = *(_QWORD *)(v18 + 8 * v20);
            if (v19)
              goto LABEL_10;
            v16 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v17)
            {
              v19 = *(_QWORD *)(v18 + 8 * v16);
              if (v19)
                goto LABEL_7;
              v4 = v17 - 1;
              v21 = v3 + 6;
              while (v17 != v21)
              {
                v19 = *(_QWORD *)(v18 + 8 * v21++);
                if (v19)
                {
                  v16 = v21 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

char *sub_1AF3B4560(uint64_t a1)
{
  return sub_1AF38FECC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1AF3B4574(uint64_t a1)
{
  return sub_1AF3AB3F4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1AF3B4588(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000012 && a2 == 0x80000001AF3F20D0 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x654D757043726570 && a2 == 0xEF62694D79726F6DLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1AF3B4698(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BBE0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AF3481A4();
  sub_1AF3E8120();
  if (!v1)
  {
    v11 = 0;
    sub_1AF3E7F7C();
    v10 = 1;
    v7 = sub_1AF3E7F88();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v7;
}

uint64_t sub_1AF3B47EC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t result;
  int64_t v9;
  int v10;
  int v11;
  char v12;
  char v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t *v51;
  char v52[16];
  uint64_t *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t *v56;

  v4 = v3;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = (uint64_t *)MEMORY[0x1E0DEE9D8];
  if (!v5)
    return (uint64_t)v6;
  v7 = a1;
  v56 = (uint64_t *)MEMORY[0x1E0DEE9D8];
  sub_1AF3AB0A4(0, v5, 0);
  v6 = v56;
  result = sub_1AF3B420C(v7);
  v9 = result;
  v11 = v10;
  v13 = v12 & 1;
  v43 = v7;
  v44 = v7 + 56;
  while ((v9 & 0x8000000000000000) == 0 && v9 < 1 << *(_BYTE *)(v7 + 32))
  {
    if (((*(_QWORD *)(v44 + (((unint64_t)v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
      goto LABEL_20;
    if (*(_DWORD *)(v7 + 36) != v11)
      goto LABEL_21;
    v50 = v13;
    v51 = v6;
    v14 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    swift_bridgeObjectRetain();
    v54 = 61;
    v55 = 0xE100000000000000;
    v53 = &v54;
    swift_bridgeObjectRetain();
    v17 = sub_1AF38ECFC(1, 1, sub_1AF390B60, (uint64_t)v52, v15, v16);
    v18 = *((_QWORD *)v17 + 2);
    if (!v18)
    {
      swift_bridgeObjectRelease();
      type metadata accessor for KTraceRecordError();
      sub_1AF3910EC();
      swift_allocError();
      v39 = v38;
      v54 = a2;
      v55 = a3;
      swift_bridgeObjectRetain();
      v6 = &v54;
      sub_1AF3E7970();
      sub_1AF3E7970();
      v40 = v55;
      *(_QWORD *)v39 = v54;
      *(_QWORD *)(v39 + 8) = v40;
      *(_BYTE *)(v39 + 16) = 0;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
LABEL_17:
      swift_release();
      swift_bridgeObjectRelease();
      return (uint64_t)v6;
    }
    v45 = v11;
    v46 = v5;
    v19 = *((_QWORD *)v17 + 4);
    v48 = *((_QWORD *)v17 + 5);
    v49 = v4;
    v6 = (uint64_t *)*((_QWORD *)v17 + 7);
    v47 = *((_QWORD *)v17 + 6);
    if (v18 == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v20 = MEMORY[0x1AF45C804](0, 0xE000000000000000);
      v22 = v21;
      v24 = v23;
      v26 = v25;
    }
    else
    {
      v20 = *((_QWORD *)v17 + 8);
      v22 = *((_QWORD *)v17 + 9);
      v24 = *((_QWORD *)v17 + 10);
      v26 = *((_QWORD *)v17 + 11);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    v27 = MEMORY[0x1AF45C4C8](v19, v48, v47, v6);
    v29 = v28;
    swift_bridgeObjectRelease();
    v30 = MEMORY[0x1AF45C4C8](v20, v22, v24, v26);
    v32 = v31;
    swift_bridgeObjectRelease();
    v4 = v49;
    if (v49)
      goto LABEL_17;
    swift_bridgeObjectRelease();
    v6 = v51;
    v56 = v51;
    v34 = v51[2];
    v33 = v51[3];
    if (v34 >= v33 >> 1)
    {
      sub_1AF3AB0A4((_QWORD *)(v33 > 1), v34 + 1, 1);
      v6 = v56;
    }
    v6[2] = v34 + 1;
    v35 = &v6[4 * v34];
    v35[4] = v27;
    v35[5] = v29;
    v35[6] = v30;
    v35[7] = v32;
    v7 = v43;
    result = sub_1AF3B42AC(v9, v45, v50 & 1, v43);
    v9 = result;
    v11 = v36;
    v13 = v37 & 1;
    v5 = v46 - 1;
    if (v46 == 1)
    {
      sub_1AF3B82A4(result, v36, v13);
      return (uint64_t)v6;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

_QWORD *sub_1AF3B4B18(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BBC0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AF348620();
  sub_1AF3E8120();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B840);
    sub_1AF347900(&qword_1EEE3BBC8, &qword_1EEE3B840, (uint64_t (*)(void))sub_1AF3BAA30, MEMORY[0x1E0DEAF40]);
    sub_1AF3E7F94();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_1AF3B4C64(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E496E6F69746361 && a2 == 0xEB00000000786564;
  if (v2 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001AF3F20F0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1AF3B4D68(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E496E6F69746361 && a2 == 0xEB00000000786564;
  if (v2 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4665736963657270 && a2 == 0xED00007265746C69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1AF3B4E94(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BBB0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1AF340D2C();
  sub_1AF3E8120();
  if (!v1)
  {
    v9[15] = 0;
    v7 = sub_1AF3E7F88();
    v9[14] = 1;
    sub_1AF3E7F64();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v7;
}

unint64_t sub_1AF3B4FE8()
{
  unint64_t result;

  result = qword_1EEE3CEC0;
  if (!qword_1EEE3CEC0)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ECA78, &type metadata for PlanSettings.KPerfPET.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3CEC0);
  }
  return result;
}

unint64_t sub_1AF3B502C()
{
  unint64_t result;

  result = qword_1EEE3B870;
  if (!qword_1EEE3B870)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBDA8, &type metadata for PlanSettings.KPerfPETMode);
    atomic_store(result, (unint64_t *)&qword_1EEE3B870);
  }
  return result;
}

uint64_t sub_1AF3B5070(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701080941 && a2 == 0xE400000000000000;
  if (v2 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646E4972656D6974 && a2 == 0xEA00000000007865)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1AF3B515C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE v8[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BBA0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AF3B4FE8();
  sub_1AF3E8120();
  v8[14] = 0;
  sub_1AF3BA9EC();
  sub_1AF3E7F94();
  v6 = v8[15];
  v8[13] = 1;
  sub_1AF3E7F88();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v6;
}

uint64_t sub_1AF3B52C4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E496E6F69746361 && a2 == 0xEB00000000786564;
  if (v2 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001AF3F2110)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1AF3B53C8(_QWORD *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;

  v5 = v3;
  v13 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  a3();
  sub_1AF3E8120();
  if (!v3)
  {
    v15 = 0;
    v10 = v13;
    v5 = sub_1AF3E7F88();
    v14 = 1;
    sub_1AF3E7F88();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v10);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v5;
}

uint64_t sub_1AF3B5528(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6465726975716572 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1AF3B566C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;
  char v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BB88);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AF342FD4();
  sub_1AF3E8120();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    v12 = 0;
    v7 = sub_1AF3E7F64();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B888);
    v11 = 1;
    sub_1AF342F74(&qword_1EEE3BB90, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEA0D8]);
    swift_bridgeObjectRetain();
    sub_1AF3E7F94();
    v10 = 2;
    swift_bridgeObjectRetain();
    v9 = 0;
    sub_1AF3E7F70();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_1AF3B58BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1AF3E7B14();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1AF3AB50C(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1AF3B5950(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1AF3B59A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unsigned __int8 *v4;
  unsigned int v5;
  char v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  sub_1AF3BA9A8();
  result = sub_1AF3E7B14();
  v7 = result;
  if (v2)
  {
    v4 = (unsigned __int8 *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_1AF3AB6B8(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_1AF3B5A18@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _OWORD *v18;
  char *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  __int128 v49;
  int v50;
  __int128 v51;
  _OWORD *v52;
  char *v53;
  uint64_t v54;
  _QWORD *v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[32];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  char v74;
  uint64_t v75;
  __int128 v76;
  unsigned __int8 v77;
  _BYTE v78[7];
  uint64_t v79;
  unsigned __int128 v80;
  uint64_t v81;
  char v82;
  _BYTE v83[7];
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  char v90;
  _BYTE v91[7];
  __int128 v92;
  char v93;
  _BYTE v94[7];
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  _BYTE v98[7];
  char v99;
  _BYTE v100[7];
  char v101;
  _BYTE v102[7];
  _BYTE v103[7];
  char v104;
  unint64_t v105;

  v52 = a2;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BB00);
  v4 = *(_QWORD *)(v54 - 8);
  MEMORY[0x1E0C80A78](v54);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = 1;
  v101 = 1;
  v99 = 1;
  v7 = sub_1AF38DB08();
  v9 = v8;
  v10 = a1[3];
  v55 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v10);
  sub_1AF34738C(v7, v9);
  sub_1AF347A30();
  v53 = v6;
  sub_1AF3E8120();
  v105 = v9;
  if (v2)
  {
    v61 = v2;
    sub_1AF33C310(v7, v9);
    v56 = 0uLL;
    v57 = 0uLL;
    v58 = 0;
    v59 = 0;
    v63 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 2;
    v15 = MEMORY[0x1E0DEE9D8];
    v60 = MEMORY[0x1E0DEE9D8];
    v62 = MEMORY[0x1E0DEE9D8];
    v16 = 2;
    v17 = 0;
LABEL_4:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v55);
    *(_QWORD *)&v76 = v13;
    *((_QWORD *)&v76 + 1) = v12;
    v77 = v104;
    *(_DWORD *)v78 = *(_DWORD *)v103;
    *(_DWORD *)&v78[3] = *(_DWORD *)&v103[3];
    v79 = v59;
    *(_QWORD *)&v80 = v17;
    *((_QWORD *)&v80 + 1) = v11;
    v81 = v63;
    v82 = v16;
    *(_DWORD *)v83 = *(_DWORD *)v102;
    *(_DWORD *)&v83[3] = *(_DWORD *)&v102[3];
    v84 = v62;
    v85 = v60;
    v86 = v14;
    v87 = v58;
    v88 = v15;
    v89 = v57;
    v90 = v101;
    *(_DWORD *)v91 = *(_DWORD *)v100;
    *(_DWORD *)&v91[3] = *(_DWORD *)&v100[3];
    v92 = v56;
    v93 = v99;
    *(_DWORD *)v94 = *(_DWORD *)v98;
    *(_DWORD *)&v94[3] = *(_DWORD *)&v98[3];
    v95 = 0;
    v96 = v7;
    v97 = v105;
    return sub_1AF3B82F0((uint64_t)&v76);
  }
  v18 = v52;
  LOBYTE(v64) = 0;
  sub_1AF3BA7C4();
  v19 = v53;
  sub_1AF3E7F58();
  v51 = v76;
  v20 = v77;
  v104 = v77;
  LOBYTE(v76) = 1;
  v21 = sub_1AF3E7F40();
  v23 = v22;
  v50 = v20;
  LOBYTE(v76) = 2;
  swift_bridgeObjectRetain();
  v24 = sub_1AF3E7F40();
  v59 = v21;
  v27 = v26;
  *(_QWORD *)&v49 = v23;
  *((_QWORD *)&v49 + 1) = v24;
  LOBYTE(v76) = 3;
  swift_bridgeObjectRetain();
  v28 = sub_1AF3E7F4C();
  v63 = v27;
  v48 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B8F0);
  LOBYTE(v64) = 4;
  sub_1AF347900(&qword_1EEE3BB10, &qword_1EEE3B8F0, (uint64_t (*)(void))sub_1AF3BA808, MEMORY[0x1E0DEAF40]);
  sub_1AF3E7F58();
  v29 = v76;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B908);
  LOBYTE(v64) = 5;
  sub_1AF347900(&qword_1EEE3BB20, &qword_1EEE3B908, (uint64_t (*)(void))sub_1AF3BA84C, MEMORY[0x1E0DEAF40]);
  swift_bridgeObjectRetain();
  sub_1AF3E7F58();
  v62 = v29;
  v30 = v76;
  LOBYTE(v64) = 6;
  sub_1AF3BA890();
  swift_bridgeObjectRetain();
  sub_1AF3E7F58();
  v60 = v30;
  v58 = *((_QWORD *)&v76 + 1);
  v47 = v76;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B928);
  LOBYTE(v64) = 7;
  sub_1AF347900(&qword_1EEE3BB38, &qword_1EEE3B928, (uint64_t (*)(void))sub_1AF3BA8D4, MEMORY[0x1E0DEAF40]);
  sub_1AF3E7F58();
  v61 = 0;
  v15 = v76;
  LOBYTE(v64) = 8;
  sub_1AF3BA918();
  swift_bridgeObjectRetain();
  v31 = v54;
  v32 = v61;
  sub_1AF3E7F58();
  v61 = v32;
  if (v32)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v19, v31);
    sub_1AF33C310(v7, v105);
    v17 = v49;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v56 = 0uLL;
    v57 = 0uLL;
LABEL_9:
    v12 = *((_QWORD *)&v51 + 1);
    v13 = v51;
    v11 = *((_QWORD *)&v49 + 1);
    v16 = v48;
    v14 = v47;
    goto LABEL_4;
  }
  v57 = v76;
  v33 = v77;
  v101 = v77;
  LOBYTE(v64) = 9;
  sub_1AF3E7F58();
  v61 = 0;
  v56 = v76;
  HIDWORD(v46) = v77;
  v99 = v77;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B948);
  v74 = 10;
  sub_1AF347900(&qword_1EEE3BB50, &qword_1EEE3B948, (uint64_t (*)(void))sub_1AF3BA95C, MEMORY[0x1E0DEAF40]);
  v34 = v61;
  sub_1AF3E7F58();
  v61 = v34;
  if (v34)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v53, v54);
    sub_1AF33C310(v7, v105);
    v17 = v49;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v53, v54);
  v35 = v75;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v64 = v51;
  LOBYTE(v65) = v50;
  v36 = v60;
  v37 = v49;
  *((_QWORD *)&v65 + 1) = v59;
  v66 = v49;
  v38 = v63;
  *(_QWORD *)&v67 = v63;
  BYTE8(v67) = v48;
  *(_QWORD *)&v68 = v62;
  *((_QWORD *)&v68 + 1) = v60;
  *(_QWORD *)&v69 = v47;
  *((_QWORD *)&v69 + 1) = v58;
  *(_QWORD *)v70 = v15;
  *(_OWORD *)&v70[8] = v57;
  v70[24] = v33;
  v71 = v56;
  LOBYTE(v72) = BYTE4(v46);
  *((_QWORD *)&v72 + 1) = v35;
  *(_QWORD *)&v73 = v7;
  v39 = v105;
  *((_QWORD *)&v73 + 1) = v105;
  sub_1AF3B83BC((uint64_t)&v64);
  sub_1AF33C310(v7, v39);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v40 = v62;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v55);
  v76 = v51;
  v77 = v104;
  *(_DWORD *)v78 = *(_DWORD *)v103;
  *(_DWORD *)&v78[3] = *(_DWORD *)&v103[3];
  v79 = v59;
  v80 = __PAIR128__(*((unint64_t *)&v49 + 1), v37);
  v81 = v38;
  v82 = v48;
  *(_DWORD *)v83 = *(_DWORD *)v102;
  *(_DWORD *)&v83[3] = *(_DWORD *)&v102[3];
  v84 = v40;
  v85 = v36;
  v86 = v47;
  v87 = v58;
  v88 = v15;
  v89 = v57;
  v90 = v101;
  *(_DWORD *)v91 = *(_DWORD *)v100;
  *(_DWORD *)&v91[3] = *(_DWORD *)&v100[3];
  v92 = v56;
  v93 = v99;
  *(_DWORD *)v94 = *(_DWORD *)v98;
  *(_DWORD *)&v94[3] = *(_DWORD *)&v98[3];
  v95 = v35;
  v96 = v7;
  v97 = v105;
  result = sub_1AF3B82F0((uint64_t)&v76);
  v41 = v72;
  v18[8] = v71;
  v18[9] = v41;
  v18[10] = v73;
  v42 = v69;
  v18[4] = v68;
  v18[5] = v42;
  v43 = *(_OWORD *)&v70[16];
  v18[6] = *(_OWORD *)v70;
  v18[7] = v43;
  v44 = v65;
  *v18 = v64;
  v18[1] = v44;
  v45 = v67;
  v18[2] = v66;
  v18[3] = v45;
  return result;
}

uint64_t sub_1AF3B6558(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x73657361696C61 && a2 == 0xE700000000000000;
  if (v2 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x736973706F6E7973 && a2 == 0xE800000000000000 || (sub_1AF3E8030() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x73676E6974746573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1AF3B66AC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t result;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  _BYTE v25[184];
  _QWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
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
  _QWORD *v61;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAF8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v61 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_1AF34529C();
  sub_1AF3E8120();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v10 = v6;
    v23 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
    LOBYTE(v24) = 0;
    sub_1AF34523C(&qword_1EEE3B9E8, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEAF40]);
    sub_1AF3E7F58();
    v11 = v26[0];
    LOBYTE(v26[0]) = 1;
    swift_bridgeObjectRetain();
    v12 = sub_1AF3E7F64();
    v14 = v13;
    v38 = 2;
    sub_1AF3B8378();
    swift_bridgeObjectRetain();
    sub_1AF3E7F94();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v5);
    *(_OWORD *)&v25[120] = v46;
    *(_OWORD *)&v25[136] = v47;
    *(_OWORD *)&v25[152] = v48;
    *(_OWORD *)&v25[168] = v49;
    *(_OWORD *)&v25[56] = v42;
    *(_OWORD *)&v25[72] = v43;
    *(_OWORD *)&v25[88] = v44;
    *(_OWORD *)&v25[104] = v45;
    *(_OWORD *)&v25[8] = v39;
    *(_OWORD *)&v25[24] = v40;
    *(_OWORD *)&v25[40] = v41;
    v58 = v47;
    v59 = v48;
    v60 = v49;
    v54 = v43;
    v55 = v44;
    v56 = v45;
    v57 = v46;
    v50 = v39;
    v51 = v40;
    v52 = v41;
    v53 = v42;
    *(_QWORD *)&v24 = v11;
    *((_QWORD *)&v24 + 1) = v12;
    *(_QWORD *)v25 = v14;
    sub_1AF3B7E08((uint64_t)&v24);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
    v34 = v57;
    v35 = v58;
    v36 = v59;
    v37 = v60;
    v30 = v53;
    v31 = v54;
    v32 = v55;
    v33 = v56;
    v27 = v50;
    v28 = v51;
    v26[0] = v11;
    v26[1] = v12;
    v26[2] = v14;
    v29 = v52;
    result = sub_1AF3B7EB0((uint64_t)v26);
    v16 = *(_OWORD *)&v25[160];
    v17 = v23;
    *(_OWORD *)(v23 + 160) = *(_OWORD *)&v25[144];
    *(_OWORD *)(v17 + 176) = v16;
    *(_QWORD *)(v17 + 192) = *(_QWORD *)&v25[176];
    v18 = *(_OWORD *)&v25[96];
    *(_OWORD *)(v17 + 96) = *(_OWORD *)&v25[80];
    *(_OWORD *)(v17 + 112) = v18;
    v19 = *(_OWORD *)&v25[128];
    *(_OWORD *)(v17 + 128) = *(_OWORD *)&v25[112];
    *(_OWORD *)(v17 + 144) = v19;
    v20 = *(_OWORD *)&v25[32];
    *(_OWORD *)(v17 + 32) = *(_OWORD *)&v25[16];
    *(_OWORD *)(v17 + 48) = v20;
    v21 = *(_OWORD *)&v25[64];
    *(_OWORD *)(v17 + 64) = *(_OWORD *)&v25[48];
    *(_OWORD *)(v17 + 80) = v21;
    v22 = *(_OWORD *)v25;
    *(_OWORD *)v17 = v24;
    *(_OWORD *)(v17 + 16) = v22;
  }
  return result;
}

uint64_t sub_1AF3B6A44()
{
  unint64_t v0;

  v0 = sub_1AF3E7F34();
  swift_bridgeObjectRelease();
  if (v0 >= 0xB)
    return 11;
  else
    return v0;
}

_QWORD *sub_1AF3B6A88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
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
  __int128 v48;
  uint64_t v49;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  v3 = *(_QWORD *)(a2 + 296);
  v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  do
  {
    if (*(_QWORD *)(v3 + 16))
    {
      v7 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain_n();
      v8 = sub_1AF396870(v7, v6);
      if ((v9 & 1) != 0)
      {
        v10 = *(_QWORD *)(v3 + 56) + 200 * v8;
        v37 = *(_OWORD *)v10;
        v11 = *(_OWORD *)(v10 + 48);
        v12 = *(_OWORD *)(v10 + 64);
        v13 = *(_OWORD *)(v10 + 32);
        v38 = *(_OWORD *)(v10 + 16);
        v39 = v13;
        v40 = v11;
        v41 = v12;
        v14 = *(_OWORD *)(v10 + 80);
        v15 = *(_OWORD *)(v10 + 96);
        v16 = *(_OWORD *)(v10 + 128);
        v44 = *(_OWORD *)(v10 + 112);
        v45 = v16;
        v42 = v14;
        v43 = v15;
        v17 = *(_OWORD *)(v10 + 144);
        v18 = *(_OWORD *)(v10 + 160);
        v19 = *(_OWORD *)(v10 + 176);
        v49 = *(_QWORD *)(v10 + 192);
        v47 = v18;
        v48 = v19;
        v46 = v17;
        sub_1AF3B7E08((uint64_t)&v37);
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_1AF3AF9A8(0, v5[2] + 1, 1, v5);
        v21 = v5[2];
        v20 = v5[3];
        if (v21 >= v20 >> 1)
          v5 = sub_1AF3AF9A8((_QWORD *)(v20 > 1), v21 + 1, 1, v5);
        v26 = v39;
        v27 = v40;
        v30 = v43;
        v31 = v44;
        v28 = v41;
        v29 = v42;
        v36 = v49;
        v34 = v47;
        v35 = v48;
        v32 = v45;
        v33 = v46;
        v24 = v37;
        v25 = v38;
        v5[2] = v21 + 1;
        v22 = &v5[27 * v21];
        v22[4] = v7;
        v22[5] = v6;
        *((_OWORD *)v22 + 3) = v24;
        *((_OWORD *)v22 + 6) = v27;
        *((_OWORD *)v22 + 7) = v28;
        *((_OWORD *)v22 + 4) = v25;
        *((_OWORD *)v22 + 5) = v26;
        *((_OWORD *)v22 + 10) = v31;
        *((_OWORD *)v22 + 11) = v32;
        *((_OWORD *)v22 + 8) = v29;
        *((_OWORD *)v22 + 9) = v30;
        v22[30] = v36;
        *((_OWORD *)v22 + 13) = v34;
        *((_OWORD *)v22 + 14) = v35;
        *((_OWORD *)v22 + 12) = v33;
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    v4 += 2;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1AF3B6C90(uint64_t a1)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 280);
  v4 = *(_QWORD *)(a1 + 272);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF34738C(v4, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1AF3B6DB0(uint64_t a1)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 280);
  v4 = *(_QWORD *)(a1 + 272);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF33C310(v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1AF3B6ECC()
{
  unint64_t result;

  result = qword_1EEE3B980;
  if (!qword_1EEE3B980)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC220, &type metadata for Plan);
    atomic_store(result, (unint64_t *)&qword_1EEE3B980);
  }
  return result;
}

uint64_t sub_1AF3B6F10(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_1AF3B6F28(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char **v28;
  char *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAA8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF3EB020;
  v5 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(inited + 32) = a2;
  *(_QWORD *)(inited + 40) = v5;
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    swift_bridgeObjectRetain();
    v7 = (uint64_t *)(a1 + 40);
    do
    {
      v10 = *(v7 - 1);
      v9 = *v7;
      v11 = *(_QWORD *)(inited + 16);
      result = swift_bridgeObjectRetain();
      if (!v11)
      {
        __break(1u);
LABEL_38:
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
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
        return result;
      }
      v13 = *(_QWORD *)(inited + 16 * v11 + 16);
      swift_bridgeObjectRetain();
      v14 = sub_1AF3E794C();
      result = swift_bridgeObjectRelease();
      v15 = v13 + v14;
      if (__OFADD__(v13, v14))
        goto LABEL_38;
      v16 = __OFADD__(v15, 2);
      v17 = v15 + 2;
      if (v16)
        goto LABEL_39;
      if (v17 < 81)
      {
        v22 = *(_QWORD *)(inited + 16);
        result = sub_1AF3E794C();
        v23 = result + 2;
        if (__OFADD__(result, 2))
          goto LABEL_41;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) != 0)
        {
          if (!v22)
            goto LABEL_45;
        }
        else
        {
          result = (uint64_t)sub_1AF3AF570((_QWORD *)inited);
          inited = result;
          if (!v22)
            goto LABEL_45;
        }
        if (v22 > *(_QWORD *)(inited + 16))
          goto LABEL_42;
        v24 = (_QWORD *)(inited + 32 + 16 * (v22 - 1));
        if (__OFADD__(*v24, v23))
          goto LABEL_43;
        *v24 += v23;
        v25 = *(_QWORD *)(inited + 16);
        result = swift_bridgeObjectRetain();
        if (!v25)
          goto LABEL_44;
        v26 = inited + 32 + 16 * v25;
        v29 = *(char **)(v26 - 8);
        v28 = (char **)(v26 - 8);
        v27 = v29;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v28 = v29;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v27 = sub_1AF3413B8(0, *((_QWORD *)v27 + 2) + 1, 1, v27);
          *v28 = v27;
        }
        v32 = *((_QWORD *)v27 + 2);
        v31 = *((_QWORD *)v27 + 3);
        if (v32 >= v31 >> 1)
        {
          v27 = sub_1AF3413B8((char *)(v31 > 1), v32 + 1, 1, v27);
          *v28 = v27;
        }
        *((_QWORD *)v27 + 2) = v32 + 1;
        v33 = &v27[16 * v32];
        *((_QWORD *)v33 + 4) = v10;
        *((_QWORD *)v33 + 5) = v9;
      }
      else
      {
        result = sub_1AF3E794C();
        v18 = result + 2;
        if (__OFADD__(result, 2))
          goto LABEL_40;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B488);
        v19 = swift_allocObject();
        *(_OWORD *)(v19 + 16) = xmmword_1AF3EB020;
        *(_QWORD *)(v19 + 32) = v10;
        *(_QWORD *)(v19 + 40) = v9;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          inited = (uint64_t)sub_1AF3AFAE4(0, *(_QWORD *)(inited + 16) + 1, 1, (_QWORD *)inited);
        v21 = *(_QWORD *)(inited + 16);
        v20 = *(_QWORD *)(inited + 24);
        if (v21 >= v20 >> 1)
          inited = (uint64_t)sub_1AF3AFAE4((_QWORD *)(v20 > 1), v21 + 1, 1, (_QWORD *)inited);
        *(_QWORD *)(inited + 16) = v21 + 1;
        v8 = inited + 16 * v21;
        *(_QWORD *)(v8 + 32) = v18;
        *(_QWORD *)(v8 + 40) = v19;
      }
      v7 += 2;
      swift_bridgeObjectRelease();
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    v34 = *(_QWORD *)(inited + 16);
    if (v34)
    {
      v5 = MEMORY[0x1E0DEE9D8];
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v34 = 1;
LABEL_30:
    v43 = v5;
    sub_1AF38FDBC(0, v34, 0);
    v35 = 40;
    v36 = v43;
    do
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
      sub_1AF3B82B0((unint64_t *)&qword_1EEE3B478, &qword_1EEE3B470, MEMORY[0x1E0DEAF20]);
      v37 = sub_1AF3E7898();
      v39 = v38;
      swift_bridgeObjectRelease();
      v41 = *(_QWORD *)(v43 + 16);
      v40 = *(_QWORD *)(v43 + 24);
      if (v41 >= v40 >> 1)
        sub_1AF38FDBC((char *)(v40 > 1), v41 + 1, 1);
      *(_QWORD *)(v43 + 16) = v41 + 1;
      v42 = v43 + 16 * v41;
      *(_QWORD *)(v42 + 32) = v37;
      *(_QWORD *)(v42 + 40) = v39;
      v35 += 16;
      --v34;
    }
    while (v34);
    swift_bridgeObjectRelease();
  }
  return v36;
}

char *sub_1AF3B7304(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return (char *)MEMORY[0x1E0DEE9D8];
  v4 = swift_bridgeObjectRetain() + 48;
  v5 = (char *)MEMORY[0x1E0DEE9D8];
  do
  {
    v7 = *(_QWORD *)v4;
    if (*(_QWORD *)(*(_QWORD *)v4 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8 = sub_1AF3E794C();
      sub_1AF3B6F28(v7, v8);
      sub_1AF3E7970();
      v9 = sub_1AF3E794C();
      MEMORY[0x1AF45C5AC](32, 0xE100000000000000, v9);
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
      sub_1AF3B82B0((unint64_t *)&qword_1EEE3B478, &qword_1EEE3B470, MEMORY[0x1E0DEAF20]);
      sub_1AF3E7898();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1AF3E7970();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_1AF3413B8(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
      v11 = *((_QWORD *)v5 + 2);
      v10 = *((_QWORD *)v5 + 3);
      if (v11 >= v10 >> 1)
        v5 = sub_1AF3413B8((char *)(v10 > 1), v11 + 1, 1, v5);
      *((_QWORD *)v5 + 2) = v11 + 1;
      v6 = &v5[16 * v11];
      *((_QWORD *)v6 + 4) = a2;
      *((_QWORD *)v6 + 5) = a3;
    }
    v4 += 24;
    --v3;
  }
  while (v3);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1AF3B754C(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int EnumCaseMultiPayload;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4C0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF391B5C(a1, a2, a3, (uint64_t *)v11);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v13 = *(_QWORD *)v11;
  if (EnumCaseMultiPayload != 1)
  {
    v14 = *((_QWORD *)v11 + 1);
    v15 = &v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4C8) + 48)];
    v16 = *a4;
    if (*(_QWORD *)(*a4 + 16))
    {
      swift_bridgeObjectRetain();
      v17 = sub_1AF396870(v13, v14);
      if ((v18 & 1) != 0)
      {
        v19 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v17);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1AF3B06E0(v13, v14);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v20 = sub_1AF3B47EC(v19, v13, v14);
        if (v4)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v25 = sub_1AF3E7694();
          (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v15, v25);
          return a1;
        }
        v23 = (_QWORD *)v20;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        if (v23[2])
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAB8);
          v24 = sub_1AF3E7F10();
        }
        else
        {
          v24 = MEMORY[0x1E0DEE9E0];
        }
        v28 = v24;
        sub_1AF3AE2DC(v23, 1, &v28);
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v21 = sub_1AF3E7694();
    v22 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v21 - 8) + 8);
    swift_bridgeObjectRetain();
    v22(v15, v21);
    return a1;
  }
  sub_1AF39928C(*(_QWORD *)v11, *((_QWORD *)v11 + 1), *((_QWORD *)v11 + 2), *((_QWORD *)v11 + 3), v11[32]);
  return 0;
}

uint64_t sub_1AF3B77DC(uint64_t result, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  int64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  BOOL v41;
  uint64_t v42;
  _QWORD *v43;
  BOOL v44;
  uint64_t v45;
  _QWORD *v46;
  BOOL v47;
  unint64_t *v49;
  uint64_t v50;
  _QWORD *v51;
  int64_t v52;
  uint64_t v56;
  _OWORD v57[12];
  uint64_t v58;
  uint64_t v59;

  v5 = a4;
  v49 = (unint64_t *)result;
  v50 = 0;
  v6 = 0;
  v9 = a3[8];
  v7 = a3 + 8;
  v8 = v9;
  v10 = 1 << *((_BYTE *)v7 - 32);
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v12 = v11 & v8;
  v51 = v7;
  v52 = (unint64_t)(v10 + 63) >> 6;
  v59 = a4 + 56;
  v56 = a5 + 56;
  while (v12)
  {
    v13 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    v14 = v13 | (v6 << 6);
LABEL_22:
    v18 = (uint64_t *)(a3[6] + 16 * v14);
    v19 = *v18;
    v20 = v18[1];
    v21 = a3[7] + 200 * v14;
    v57[0] = *(_OWORD *)v21;
    v22 = *(_OWORD *)(v21 + 48);
    v24 = *(_OWORD *)(v21 + 16);
    v23 = *(_OWORD *)(v21 + 32);
    v57[4] = *(_OWORD *)(v21 + 64);
    v57[2] = v23;
    v57[3] = v22;
    v57[1] = v24;
    v25 = *(_OWORD *)(v21 + 128);
    v27 = *(_OWORD *)(v21 + 80);
    v26 = *(_OWORD *)(v21 + 96);
    v57[7] = *(_OWORD *)(v21 + 112);
    v57[8] = v25;
    v57[5] = v27;
    v57[6] = v26;
    v29 = *(_OWORD *)(v21 + 160);
    v28 = *(_OWORD *)(v21 + 176);
    v30 = *(_OWORD *)(v21 + 144);
    v58 = *(_QWORD *)(v21 + 192);
    v57[10] = v29;
    v57[11] = v28;
    v57[9] = v30;
    if (*(_QWORD *)(v5 + 16))
    {
      sub_1AF3E80D8();
      swift_bridgeObjectRetain();
      sub_1AF3B7E08((uint64_t)v57);
      sub_1AF3E7940();
      v31 = sub_1AF3E8114();
      v32 = -1 << *(_BYTE *)(v5 + 32);
      v33 = v31 & ~v32;
      if (((*(_QWORD *)(v59 + ((v33 >> 3) & 0xFFFFFFFFFFFFF8)) >> v33) & 1) == 0)
        goto LABEL_5;
      v34 = *(_QWORD *)(a4 + 48);
      v35 = (_QWORD *)(v34 + 16 * v33);
      if ((*v35 != v19 || v35[1] != v20) && (sub_1AF3E8030() & 1) == 0)
      {
        v45 = ~v32;
        do
        {
          v33 = (v33 + 1) & v45;
          if (((*(_QWORD *)(v59 + ((v33 >> 3) & 0xFFFFFFFFFFFFF8)) >> v33) & 1) == 0)
            goto LABEL_5;
          v46 = (_QWORD *)(v34 + 16 * v33);
          v47 = *v46 == v19 && v46[1] == v20;
        }
        while (!v47 && (sub_1AF3E8030() & 1) == 0);
      }
      if (!*(_QWORD *)(a5 + 16))
        goto LABEL_50;
      sub_1AF3E80D8();
      sub_1AF3E7940();
      v36 = sub_1AF3E8114();
      v37 = -1 << *(_BYTE *)(a5 + 32);
      v38 = v36 & ~v37;
      if (((*(_QWORD *)(v56 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) == 0)
        goto LABEL_50;
      v39 = *(_QWORD *)(a5 + 48);
      v40 = (_QWORD *)(v39 + 16 * v38);
      v41 = *v40 == v19 && v40[1] == v20;
      if (v41 || (sub_1AF3E8030() & 1) != 0)
      {
LABEL_5:
        sub_1AF3B7EB0((uint64_t)v57);
        result = swift_bridgeObjectRelease();
        v5 = a4;
      }
      else
      {
        v42 = ~v37;
        while (1)
        {
          v38 = (v38 + 1) & v42;
          if (((*(_QWORD *)(v56 + ((v38 >> 3) & 0xFFFFFFFFFFFFF8)) >> v38) & 1) == 0)
            break;
          v43 = (_QWORD *)(v39 + 16 * v38);
          v44 = *v43 == v19 && v43[1] == v20;
          if (v44 || (sub_1AF3E8030() & 1) != 0)
            goto LABEL_5;
        }
LABEL_50:
        sub_1AF3B7EB0((uint64_t)v57);
        result = swift_bridgeObjectRelease();
        *(unint64_t *)((char *)v49 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
        if (__OFADD__(v50, 1))
          goto LABEL_55;
        ++v50;
        v5 = a4;
      }
    }
  }
  v15 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_54;
  }
  if (v15 >= v52)
    return sub_1AF3B1E4C(v49, a2, v50, (uint64_t)a3);
  v16 = v51[v15];
  ++v6;
  if (v16)
    goto LABEL_21;
  v6 = v15 + 1;
  if (v15 + 1 >= v52)
    return sub_1AF3B1E4C(v49, a2, v50, (uint64_t)a3);
  v16 = v51[v6];
  if (v16)
    goto LABEL_21;
  v6 = v15 + 2;
  if (v15 + 2 >= v52)
    return sub_1AF3B1E4C(v49, a2, v50, (uint64_t)a3);
  v16 = v51[v6];
  if (v16)
  {
LABEL_21:
    v12 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v6 << 6);
    goto LABEL_22;
  }
  v17 = v15 + 3;
  if (v17 >= v52)
    return sub_1AF3B1E4C(v49, a2, v50, (uint64_t)a3);
  v16 = v51[v17];
  if (v16)
  {
    v6 = v17;
    goto LABEL_21;
  }
  while (1)
  {
    v6 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v6 >= v52)
      return sub_1AF3B1E4C(v49, a2, v50, (uint64_t)a3);
    v16 = v51[v6];
    ++v17;
    if (v16)
      goto LABEL_21;
  }
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
  return result;
}

uint64_t sub_1AF3B7BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v7;
  unsigned int v8;
  unint64_t v9;
  size_t v10;
  uint64_t isStackAllocationSafe;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_BYTE *)(a1 + 32);
  v8 = v7 & 0x3F;
  v9 = (unint64_t)((1 << v7) + 63) >> 6;
  v10 = 8 * v9;
  swift_bridgeObjectRetain_n();
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_1AF3B77DC((uint64_t)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, (_QWORD *)a1, a2, a3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v3)
      swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = (void *)swift_slowAlloc();
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_1AF3B77DC((uint64_t)v13, v9, (_QWORD *)a1, a2, a3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x1AF45E3DC](v13, -1, -1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1AF3B7E08(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 184);
  v3 = *(_QWORD *)(a1 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF34738C(v2, v3);
  return a1;
}

uint64_t sub_1AF3B7EB0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 184);
  v3 = *(_QWORD *)(a1 + 192);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF33C310(v2, v3);
  return a1;
}

uint64_t sub_1AF3B7F58(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  BOOL v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = *(_QWORD *)(result + 16);
  if (!v3)
    return MEMORY[0x1E0DEE9D8];
  v5 = 0;
  v36 = result + 32;
  v40 = a3 + 56;
  v41 = a2 + 56;
  v35 = MEMORY[0x1E0DEE9D8];
  do
  {
    if (v5 <= v3)
      v6 = v3;
    else
      v6 = v5;
    v39 = v6;
    v7 = v5;
    while (1)
    {
      if (v7 == v39)
      {
        __break(1u);
        return result;
      }
      v5 = v7 + 1;
      if (*(_QWORD *)(a2 + 16))
        break;
LABEL_9:
      v7 = v5;
      if (v5 == v3)
        return v35;
    }
    v8 = v3;
    v9 = v36 + 32 * v7;
    v11 = *(_QWORD *)v9;
    v10 = *(_QWORD *)(v9 + 8);
    v12 = *(_QWORD *)(v9 + 16);
    v37 = *(_BYTE *)(v9 + 24);
    sub_1AF3E80D8();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AF3E7940();
    v13 = sub_1AF3E8114();
    v14 = -1 << *(_BYTE *)(a2 + 32);
    v15 = v13 & ~v14;
    if (((*(_QWORD *)(v41 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
      goto LABEL_8;
    v16 = *(_QWORD *)(a2 + 48);
    v17 = (_QWORD *)(v16 + 16 * v15);
    v18 = *v17 == v11 && v17[1] == v10;
    if (!v18 && (sub_1AF3E8030() & 1) == 0)
    {
      v28 = ~v14;
      do
      {
        v15 = (v15 + 1) & v28;
        if (((*(_QWORD *)(v41 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
          goto LABEL_8;
        v29 = (_QWORD *)(v16 + 16 * v15);
        v30 = *v29 == v11 && v29[1] == v10;
      }
      while (!v30 && (sub_1AF3E8030() & 1) == 0);
    }
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_42;
    sub_1AF3E80D8();
    swift_bridgeObjectRetain();
    sub_1AF3E7940();
    v19 = sub_1AF3E8114();
    v20 = -1 << *(_BYTE *)(a3 + 32);
    v21 = v19 & ~v20;
    if (((*(_QWORD *)(v40 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
      goto LABEL_41;
    v22 = *(_QWORD *)(a3 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v11 && v23[1] == v10;
    if (v24 || (sub_1AF3E8030() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
LABEL_8:
      v3 = v8;
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    v25 = ~v20;
    while (1)
    {
      v21 = (v21 + 1) & v25;
      if (((*(_QWORD *)(v40 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
        break;
      v26 = (_QWORD *)(v22 + 16 * v21);
      v27 = *v26 == v11 && v26[1] == v10;
      if (v27 || (sub_1AF3E8030() & 1) != 0)
        goto LABEL_7;
    }
LABEL_41:
    swift_bridgeObjectRelease();
LABEL_42:
    v31 = v35;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1AF3AB0C0(0, *(_QWORD *)(v35 + 16) + 1, 1);
      v31 = v35;
    }
    v3 = v8;
    v33 = *(_QWORD *)(v31 + 16);
    v32 = *(_QWORD *)(v31 + 24);
    if (v33 >= v32 >> 1)
    {
      result = (uint64_t)sub_1AF3AB0C0((char *)(v32 > 1), v33 + 1, 1);
      v31 = v35;
    }
    *(_QWORD *)(v31 + 16) = v33 + 1;
    v35 = v31;
    v34 = v31 + 32 * v33;
    *(_QWORD *)(v34 + 32) = v11;
    *(_QWORD *)(v34 + 40) = v10;
    *(_QWORD *)(v34 + 48) = v12;
    *(_BYTE *)(v34 + 56) = v37;
  }
  while (v5 != v3);
  return v35;
}

uint64_t sub_1AF3B82A4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1AF3B82B0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1AF45E31C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1AF3B82F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 160);
  v3 = *(_QWORD *)(a1 + 168);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF33C310(v2, v3);
  return a1;
}

unint64_t sub_1AF3B8378()
{
  unint64_t result;

  result = qword_1EEE3B9F0;
  if (!qword_1EEE3B9F0)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC040, &type metadata for PlanSettings);
    atomic_store(result, (unint64_t *)&qword_1EEE3B9F0);
  }
  return result;
}

uint64_t sub_1AF3B83BC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(a1 + 160);
  v3 = *(_QWORD *)(a1 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF34738C(v2, v3);
  return a1;
}

unint64_t sub_1AF3B8444()
{
  unint64_t result;

  result = qword_1EEE3BA00;
  if (!qword_1EEE3BA00)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC090, &type metadata for PlanLayer);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA00);
  }
  return result;
}

uint64_t sub_1AF3B8488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF3B84D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for KTraceRecordError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF3B8514(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for KTraceRecordError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AF3B8550(uint64_t a1)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v5 = *(_OWORD *)(a1 + 272);
  v3 = *(_OWORD *)(a1 + 240);
  v4 = *(_OWORD *)(a1 + 256);
  sub_1AF3B85E0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v3,
    *((uint64_t *)&v3 + 1),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((unint64_t *)&v5 + 1));
  return a1;
}

uint64_t sub_1AF3B85E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,unint64_t a36)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1AF33C310(a35, a36);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1AF3B8708()
{
  unint64_t result;

  result = qword_1EEE3BA20;
  if (!qword_1EEE3BA20)
  {
    result = MEMORY[0x1AF45E31C](&protocol conformance descriptor for PlanSource, &type metadata for PlanSource);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA20);
  }
  return result;
}

unint64_t sub_1AF3B8750()
{
  unint64_t result;

  result = qword_1EEE3BA28;
  if (!qword_1EEE3BA28)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBAB0, &type metadata for PlanSettings.KPerfSampler);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA28);
  }
  return result;
}

unint64_t sub_1AF3B8798()
{
  unint64_t result;

  result = qword_1EEE3BA30;
  if (!qword_1EEE3BA30)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBCE0, &type metadata for PlanSettings.KPerfPETMode);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA30);
  }
  return result;
}

unint64_t sub_1AF3B87E0()
{
  unint64_t result;

  result = qword_1EEE3BA38;
  if (!qword_1EEE3BA38)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBDD0, &type metadata for PlanSettings.KPerfLazyTrigger.KPerfLazyKind);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA38);
  }
  return result;
}

unint64_t sub_1AF3B8828()
{
  unint64_t result;

  result = qword_1EEE3BA40;
  if (!qword_1EEE3BA40)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBF00, &type metadata for PlanSettings.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA40);
  }
  return result;
}

unint64_t sub_1AF3B8870()
{
  unint64_t result;

  result = qword_1EEE3BA48;
  if (!qword_1EEE3BA48)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC018, &type metadata for PlanSettings.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA48);
  }
  return result;
}

unint64_t sub_1AF3B88B8()
{
  unint64_t result;

  result = qword_1EEE3BA50;
  if (!qword_1EEE3BA50)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBFF0, &type metadata for PlanSettings.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA50);
  }
  return result;
}

unint64_t sub_1AF3B8900()
{
  unint64_t result;

  result = qword_1EEE3BA58;
  if (!qword_1EEE3BA58)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC0E0, &type metadata for Plan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA58);
  }
  return result;
}

unint64_t sub_1AF3B8948()
{
  unint64_t result;

  result = qword_1EEE3BA60;
  if (!qword_1EEE3BA60)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC1F8, &type metadata for Plan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA60);
  }
  return result;
}

unint64_t sub_1AF3B8990()
{
  unint64_t result;

  result = qword_1EEE3BA68;
  if (!qword_1EEE3BA68)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC1D0, &type metadata for Plan.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA68);
  }
  return result;
}

unint64_t sub_1AF3B89D8()
{
  unint64_t result;

  result = qword_1EEE3BA70;
  if (!qword_1EEE3BA70)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC2B0, &type metadata for Plan);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA70);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PlanSource(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PlanSource(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AF3B8AF8 + 4 * byte_1AF3EB9C6[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1AF3B8B2C + 4 * byte_1AF3EB9C1[v4]))();
}

uint64_t sub_1AF3B8B2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF3B8B34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF3B8B3CLL);
  return result;
}

uint64_t sub_1AF3B8B48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF3B8B50);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AF3B8B54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF3B8B5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlanSource()
{
  return &type metadata for PlanSource;
}

ValueMetadata *type metadata accessor for KDebugBufferSize()
{
  return &type metadata for KDebugBufferSize;
}

uint64_t destroy for PlanSettings(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1AF33C310(*(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 168));
}

uint64_t initializeWithCopy for PlanSettings(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v5;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  v6 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  v7 = *(_QWORD *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF34738C(v6, v7);
  *(_QWORD *)(a1 + 160) = v6;
  *(_QWORD *)(a1 + 168) = v7;
  return a1;
}

uint64_t assignWithCopy for PlanSettings(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = *a2;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *((_QWORD *)a2 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(__int128 *)((char *)a2 + 104);
  *(_BYTE *)(a1 + 120) = *((_BYTE *)a2 + 120);
  *(_OWORD *)(a1 + 104) = v5;
  v6 = *((_BYTE *)a2 + 144);
  *(_OWORD *)(a1 + 128) = a2[8];
  *(_BYTE *)(a1 + 144) = v6;
  *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *((_QWORD *)a2 + 20);
  v7 = *((_QWORD *)a2 + 21);
  sub_1AF34738C(v8, v7);
  v9 = *(_QWORD *)(a1 + 160);
  v10 = *(_QWORD *)(a1 + 168);
  *(_QWORD *)(a1 + 160) = v8;
  *(_QWORD *)(a1 + 168) = v7;
  sub_1AF33C310(v9, v10);
  return a1;
}

__n128 __swift_memcpy176_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for PlanSettings(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a1 + 160);
  v7 = *(_QWORD *)(a1 + 168);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  sub_1AF33C310(v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlanSettings(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 176))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PlanSettings(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 176) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 176) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanSettings()
{
  return &type metadata for PlanSettings;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfSampler()
{
  return &type metadata for PlanSettings.KPerfSampler;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfAction()
{
  return &type metadata for PlanSettings.KPerfAction;
}

uint64_t storeEnumTagSinglePayload for PlanSettings.KPerfTimer(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfTimer()
{
  return &type metadata for PlanSettings.KPerfTimer;
}

_QWORD *assignWithCopy for PlanSettings.KPerfKDebugTrigger(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PlanSettings.KPerfKDebugTrigger(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PlanSettings.KPerfKDebugTrigger(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlanSettings.KPerfKDebugTrigger(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfKDebugTrigger()
{
  return &type metadata for PlanSettings.KPerfKDebugTrigger;
}

uint64_t storeEnumTagSinglePayload for PlanSettings.KPerfPET(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfPET()
{
  return &type metadata for PlanSettings.KPerfPET;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfPETMode()
{
  return &type metadata for PlanSettings.KPerfPETMode;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfLazyTrigger()
{
  return &type metadata for PlanSettings.KPerfLazyTrigger;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfLazyTrigger.KPerfLazyKind()
{
  return &type metadata for PlanSettings.KPerfLazyTrigger.KPerfLazyKind;
}

uint64_t assignWithCopy for PlanSettings.ProviderEntry(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for PlanSettings.ProviderEntry(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlanSettings.ProviderEntry(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlanSettings.ProviderEntry(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanSettings.ProviderEntry()
{
  return &type metadata for PlanSettings.ProviderEntry;
}

uint64_t assignWithCopy for PlanLayer(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = v5;
  v6 = *(_BYTE *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 168) = v6;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 184);
  v7 = *(_QWORD *)(a2 + 192);
  sub_1AF34738C(v8, v7);
  v9 = *(_QWORD *)(a1 + 184);
  v10 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(a1 + 184) = v8;
  *(_QWORD *)(a1 + 192) = v7;
  sub_1AF33C310(v9, v10);
  return a1;
}

uint64_t assignWithTake for PlanLayer(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a1 + 184);
  v8 = *(_QWORD *)(a1 + 192);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  sub_1AF33C310(v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PlanLayer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 200))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PlanLayer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 200) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 200) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PlanLayer()
{
  return &type metadata for PlanLayer;
}

uint64_t destroy for Plan(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF33C310(*(_QWORD *)(a1 + 272), *(_QWORD *)(a1 + 280));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Plan(uint64_t a1, uint64_t a2)
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
  unint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  v9 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v9;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v10 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v10;
  v11 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v11;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v12 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v12;
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_BYTE *)(a1 + 256) = *(_BYTE *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  v13 = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  v16 = *(_QWORD *)(a2 + 280);
  v17 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF34738C(v17, v16);
  *(_QWORD *)(a1 + 272) = v17;
  *(_QWORD *)(a1 + 280) = v16;
  v14 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v14;
  *(_BYTE *)(a1 + 304) = *(_BYTE *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Plan(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = v4;
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 216);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_OWORD *)(a1 + 216) = v5;
  v6 = *(_BYTE *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_BYTE *)(a1 + 256) = v6;
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 272);
  v8 = *(_QWORD *)(a2 + 280);
  sub_1AF34738C(v7, v8);
  v9 = *(_QWORD *)(a1 + 272);
  v10 = *(_QWORD *)(a1 + 280);
  *(_QWORD *)(a1 + 272) = v7;
  *(_QWORD *)(a1 + 280) = v8;
  sub_1AF33C310(v9, v10);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 304) = *(_BYTE *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  return a1;
}

void *__swift_memcpy321_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x141uLL);
}

uint64_t assignWithTake for Plan(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v7;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v8 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v9;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_BYTE *)(a1 + 256) = *(_BYTE *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(a1 + 272);
  v11 = *(_QWORD *)(a1 + 280);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  sub_1AF33C310(v10, v11);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 304) = *(_BYTE *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  return a1;
}

uint64_t getEnumTagSinglePayload for Plan(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 321))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Plan(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_BYTE *)(result + 320) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 321) = 1;
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
    *(_BYTE *)(result + 321) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Plan()
{
  return &type metadata for Plan;
}

ValueMetadata *type metadata accessor for PlanSettings.KPerfPET.CodingKeys()
{
  return &type metadata for PlanSettings.KPerfPET.CodingKeys;
}

_BYTE *sub_1AF3B9D5C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t _s6ktrace12PlanSettingsV12KPerfPETModeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

unint64_t sub_1AF3B9DFC()
{
  unint64_t result;

  result = qword_1EEE3E860[0];
  if (!qword_1EEE3E860[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC458, &type metadata for KDebugBufferSize.CodingKeys);
    atomic_store(result, qword_1EEE3E860);
  }
  return result;
}

unint64_t sub_1AF3B9E44()
{
  unint64_t result;

  result = qword_1EEE3EA70[0];
  if (!qword_1EEE3EA70[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC510, &type metadata for PlanSettings.KPerfAction.CodingKeys);
    atomic_store(result, qword_1EEE3EA70);
  }
  return result;
}

unint64_t sub_1AF3B9E8C()
{
  unint64_t result;

  result = qword_1EEE3EC80[0];
  if (!qword_1EEE3EC80[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC5C8, &type metadata for PlanSettings.KPerfTimer.CodingKeys);
    atomic_store(result, qword_1EEE3EC80);
  }
  return result;
}

unint64_t sub_1AF3B9ED4()
{
  unint64_t result;

  result = qword_1EEE3EE90[0];
  if (!qword_1EEE3EE90[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC680, &type metadata for PlanSettings.KPerfKDebugTrigger.CodingKeys);
    atomic_store(result, qword_1EEE3EE90);
  }
  return result;
}

unint64_t sub_1AF3B9F1C()
{
  unint64_t result;

  result = qword_1EEE3F0A0[0];
  if (!qword_1EEE3F0A0[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC738, &type metadata for PlanSettings.KPerfPET.CodingKeys);
    atomic_store(result, qword_1EEE3F0A0);
  }
  return result;
}

unint64_t sub_1AF3B9F64()
{
  unint64_t result;

  result = qword_1EEE3F2B0[0];
  if (!qword_1EEE3F2B0[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC7F0, &type metadata for PlanSettings.KPerfLazyTrigger.CodingKeys);
    atomic_store(result, qword_1EEE3F2B0);
  }
  return result;
}

unint64_t sub_1AF3B9FAC()
{
  unint64_t result;

  result = qword_1EEE3F4C0[0];
  if (!qword_1EEE3F4C0[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC8A8, &type metadata for PlanSettings.ProviderEntry.CodingKeys);
    atomic_store(result, qword_1EEE3F4C0);
  }
  return result;
}

unint64_t sub_1AF3B9FF4()
{
  unint64_t result;

  result = qword_1EEE3F6D0[0];
  if (!qword_1EEE3F6D0[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC960, &type metadata for PlanLayer.CodingKeys);
    atomic_store(result, qword_1EEE3F6D0);
  }
  return result;
}

unint64_t sub_1AF3BA03C()
{
  unint64_t result;

  result = qword_1EEE3F7E0;
  if (!qword_1EEE3F7E0)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC8D0, &type metadata for PlanLayer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3F7E0);
  }
  return result;
}

unint64_t sub_1AF3BA084()
{
  unint64_t result;

  result = qword_1EEE3F7E8[0];
  if (!qword_1EEE3F7E8[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC8F8, &type metadata for PlanLayer.CodingKeys);
    atomic_store(result, qword_1EEE3F7E8);
  }
  return result;
}

unint64_t sub_1AF3BA0CC()
{
  unint64_t result;

  result = qword_1EEE3F870;
  if (!qword_1EEE3F870)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC818, &type metadata for PlanSettings.ProviderEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3F870);
  }
  return result;
}

unint64_t sub_1AF3BA114()
{
  unint64_t result;

  result = qword_1EEE3F878;
  if (!qword_1EEE3F878)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC840, &type metadata for PlanSettings.ProviderEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3F878);
  }
  return result;
}

unint64_t sub_1AF3BA15C()
{
  unint64_t result;

  result = qword_1EEE3F900;
  if (!qword_1EEE3F900)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC760, &type metadata for PlanSettings.KPerfLazyTrigger.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3F900);
  }
  return result;
}

unint64_t sub_1AF3BA1A4()
{
  unint64_t result;

  result = qword_1EEE3F908[0];
  if (!qword_1EEE3F908[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC788, &type metadata for PlanSettings.KPerfLazyTrigger.CodingKeys);
    atomic_store(result, qword_1EEE3F908);
  }
  return result;
}

unint64_t sub_1AF3BA1EC()
{
  unint64_t result;

  result = qword_1EEE3F990;
  if (!qword_1EEE3F990)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC6A8, &type metadata for PlanSettings.KPerfPET.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3F990);
  }
  return result;
}

unint64_t sub_1AF3BA234()
{
  unint64_t result;

  result = qword_1EEE3F998[0];
  if (!qword_1EEE3F998[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC6D0, &type metadata for PlanSettings.KPerfPET.CodingKeys);
    atomic_store(result, qword_1EEE3F998);
  }
  return result;
}

unint64_t sub_1AF3BA27C()
{
  unint64_t result;

  result = qword_1EEE3FA20;
  if (!qword_1EEE3FA20)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC5F0, &type metadata for PlanSettings.KPerfKDebugTrigger.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3FA20);
  }
  return result;
}

unint64_t sub_1AF3BA2C4()
{
  unint64_t result;

  result = qword_1EEE3FA28[0];
  if (!qword_1EEE3FA28[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC618, &type metadata for PlanSettings.KPerfKDebugTrigger.CodingKeys);
    atomic_store(result, qword_1EEE3FA28);
  }
  return result;
}

unint64_t sub_1AF3BA30C()
{
  unint64_t result;

  result = qword_1EEE3FAB0;
  if (!qword_1EEE3FAB0)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC538, &type metadata for PlanSettings.KPerfTimer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3FAB0);
  }
  return result;
}

unint64_t sub_1AF3BA354()
{
  unint64_t result;

  result = qword_1EEE3FAB8[0];
  if (!qword_1EEE3FAB8[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC560, &type metadata for PlanSettings.KPerfTimer.CodingKeys);
    atomic_store(result, qword_1EEE3FAB8);
  }
  return result;
}

unint64_t sub_1AF3BA39C()
{
  unint64_t result;

  result = qword_1EEE3FB40;
  if (!qword_1EEE3FB40)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC480, &type metadata for PlanSettings.KPerfAction.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3FB40);
  }
  return result;
}

unint64_t sub_1AF3BA3E4()
{
  unint64_t result;

  result = qword_1EEE3FB48[0];
  if (!qword_1EEE3FB48[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC4A8, &type metadata for PlanSettings.KPerfAction.CodingKeys);
    atomic_store(result, qword_1EEE3FB48);
  }
  return result;
}

unint64_t sub_1AF3BA42C()
{
  unint64_t result;

  result = qword_1EEE3FBD0;
  if (!qword_1EEE3FBD0)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC3C8, &type metadata for KDebugBufferSize.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE3FBD0);
  }
  return result;
}

unint64_t sub_1AF3BA474()
{
  unint64_t result;

  result = qword_1EEE3FBD8[0];
  if (!qword_1EEE3FBD8[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EC3F0, &type metadata for KDebugBufferSize.CodingKeys);
    atomic_store(result, qword_1EEE3FBD8);
  }
  return result;
}

unint64_t sub_1AF3BA4B8()
{
  unint64_t result;

  result = qword_1EEE3BA78;
  if (!qword_1EEE3BA78)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBD48, &type metadata for PlanSettings.KPerfPETMode);
    atomic_store(result, (unint64_t *)&qword_1EEE3BA78);
  }
  return result;
}

double sub_1AF3BA4FC(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 320) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_1AF3BA530(uint64_t a1)
{
  uint64_t v2;
  unint64_t v4;

  v2 = *(_QWORD *)(a1 + 200);
  v4 = *(_QWORD *)(a1 + 208);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF33C310(v2, v4);
  return a1;
}

double sub_1AF3BA5EC(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 192) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_1AF3BA610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unint64_t a25)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return sub_1AF33C310(a24, a25);
  }
  return result;
}

_QWORD *sub_1AF3BA6B4(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21],
    a1[22],
    a1[23],
    a1[24]);
  return a1;
}

uint64_t sub_1AF3BA720(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,unint64_t a25)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return sub_1AF34738C(a24, a25);
  }
  return result;
}

unint64_t sub_1AF3BA7C4()
{
  unint64_t result;

  result = qword_1EEE3BB08;
  if (!qword_1EEE3BB08)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBA60, &type metadata for KDebugBufferSize);
    atomic_store(result, (unint64_t *)&qword_1EEE3BB08);
  }
  return result;
}

unint64_t sub_1AF3BA808()
{
  unint64_t result;

  result = qword_1EEE3BB18;
  if (!qword_1EEE3BB18)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBBA0, &type metadata for PlanSettings.KPerfAction);
    atomic_store(result, (unint64_t *)&qword_1EEE3BB18);
  }
  return result;
}

unint64_t sub_1AF3BA84C()
{
  unint64_t result;

  result = qword_1EEE3BB28;
  if (!qword_1EEE3BB28)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBBF0, &type metadata for PlanSettings.KPerfTimer);
    atomic_store(result, (unint64_t *)&qword_1EEE3BB28);
  }
  return result;
}

unint64_t sub_1AF3BA890()
{
  unint64_t result;

  result = qword_1EEE3BB30;
  if (!qword_1EEE3BB30)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBC90, &type metadata for PlanSettings.KPerfPET);
    atomic_store(result, (unint64_t *)&qword_1EEE3BB30);
  }
  return result;
}

unint64_t sub_1AF3BA8D4()
{
  unint64_t result;

  result = qword_1EEE3BB40;
  if (!qword_1EEE3BB40)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBC40, &type metadata for PlanSettings.KPerfKDebugTrigger);
    atomic_store(result, (unint64_t *)&qword_1EEE3BB40);
  }
  return result;
}

unint64_t sub_1AF3BA918()
{
  unint64_t result;

  result = qword_1EEE3BB48;
  if (!qword_1EEE3BB48)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBE38, &type metadata for PlanSettings.KPerfLazyTrigger);
    atomic_store(result, (unint64_t *)&qword_1EEE3BB48);
  }
  return result;
}

unint64_t sub_1AF3BA95C()
{
  unint64_t result;

  result = qword_1EEE3BB58;
  if (!qword_1EEE3BB58)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBE88, &type metadata for PlanSettings.ProviderEntry);
    atomic_store(result, (unint64_t *)&qword_1EEE3BB58);
  }
  return result;
}

uint64_t sub_1AF3BA9A0()
{
  return swift_release();
}

unint64_t sub_1AF3BA9A8()
{
  unint64_t result;

  result = qword_1EEE3BB80;
  if (!qword_1EEE3BB80)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBAD8, &type metadata for PlanSettings.KPerfSampler);
    atomic_store(result, (unint64_t *)&qword_1EEE3BB80);
  }
  return result;
}

unint64_t sub_1AF3BA9EC()
{
  unint64_t result;

  result = qword_1EEE3BBA8;
  if (!qword_1EEE3BBA8)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBD80, &type metadata for PlanSettings.KPerfPETMode);
    atomic_store(result, (unint64_t *)&qword_1EEE3BBA8);
  }
  return result;
}

unint64_t sub_1AF3BAA30()
{
  unint64_t result;

  result = qword_1EEE3BBD0;
  if (!qword_1EEE3BBD0)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EBB50, &type metadata for PlanSettings.KPerfSampler);
    atomic_store(result, (unint64_t *)&qword_1EEE3BBD0);
  }
  return result;
}

uint64_t StaticString.charPtr.getter(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (!result)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t sub_1AF3BAA98()
{
  uint64_t result;

  result = sub_1AF3E7790();
  qword_1EEE41270 = result;
  return result;
}

uint64_t *sub_1AF3BAAB4()
{
  if (qword_1EEE3FC60 != -1)
    swift_once();
  return &qword_1EEE41270;
}

uint64_t sub_1AF3BAAF4()
{
  uint64_t result;

  result = sub_1AF3E779C();
  qword_1EEE41278 = result;
  return result;
}

uint64_t *sub_1AF3BAB10()
{
  if (qword_1EEE3FC68 != -1)
    swift_once();
  return &qword_1EEE41278;
}

void sub_1AF3BAB50(char *a1)
{
  sub_1AF3BAB5C(*a1);
}

void sub_1AF3BAB5C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1AF3BAB94(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1AF3BABE8 + 4 * byte_1AF3ECC6C[a2]))(11122);
}

uint64_t sub_1AF3BABE8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 11122 && v1 == 0xE200000000000000)
    v2 = 1;
  else
    v2 = sub_1AF3E8030();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1AF3BAC88()
{
  char *v0;

  sub_1AF3BAC90(*v0);
}

void sub_1AF3BAC90(char a1)
{
  sub_1AF3E80D8();
  __asm { BR              X10 }
}

uint64_t sub_1AF3BACD4()
{
  sub_1AF3E7940();
  swift_bridgeObjectRelease();
  return sub_1AF3E8114();
}

void sub_1AF3BAD30()
{
  __asm { BR              X10 }
}

uint64_t sub_1AF3BAD60()
{
  sub_1AF3E7940();
  return swift_bridgeObjectRelease();
}

void sub_1AF3BADA8(uint64_t a1)
{
  char *v1;

  sub_1AF3BADB0(a1, *v1);
}

void sub_1AF3BADB0(uint64_t a1, char a2)
{
  sub_1AF3E80D8();
  __asm { BR              X10 }
}

uint64_t sub_1AF3BADF0()
{
  sub_1AF3E7940();
  swift_bridgeObjectRelease();
  return sub_1AF3E8114();
}

uint64_t sub_1AF3BAE4C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1AF3BDAAC();
  *a1 = result;
  return result;
}

uint64_t sub_1AF3BAE78()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1AF3BAE9C + 4 * byte_1AF3ECC84[*v0]))();
}

void sub_1AF3BAE9C(_QWORD *a1@<X8>)
{
  *a1 = 11122;
  a1[1] = 0xE200000000000000;
}

void sub_1AF3BAEAC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 119;
  a1[1] = v1;
}

void sub_1AF3BAEB8(_QWORD *a1@<X8>)
{
  *a1 = 11127;
  a1[1] = 0xE200000000000000;
}

void sub_1AF3BAEC8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 97;
  a1[1] = v1;
}

void sub_1AF3BAED4(_QWORD *a1@<X8>)
{
  *a1 = 11105;
  a1[1] = 0xE200000000000000;
}

void sub_1AF3BAEE4(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

FILE *sub_1AF3BAF1C()
{
  uint64_t v0;
  uint64_t v1;
  FILE *v2;

  v0 = sub_1AF3E7910();
  swift_bridgeObjectRelease();
  v1 = sub_1AF3E7910();
  swift_bridgeObjectRelease();
  v2 = fopen((const char *)(v0 + 32), (const char *)(v1 + 32));
  swift_release();
  swift_release();
  return v2;
}

FILE *sub_1AF3BAFB0(FILE *a1)
{
  int v1;
  int v2;
  FILE *result;

  v1 = fileno(a1);
  v2 = dup(v1);
  if (v2 < 0)
    return 0;
  result = fdopen(v2, "a");
  if (!result)
    __break(1u);
  return result;
}

FILE *sub_1AF3BAFEC(FILE *a1)
{
  int v2;
  int v3;
  int v4;
  FILE *result;
  int v6;
  int v7;

  v2 = fileno(a1);
  v3 = dup(v2);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    result = fopen("/dev/null", "a");
    if (!result)
      return result;
    v6 = fileno(result);
    v7 = fileno(a1);
    if ((dup2(v6, v7) & 0x80000000) == 0)
    {
      result = fdopen(v4, "a");
      if (result)
        return result;
      __break(1u);
    }
  }
  return 0;
}

uint64_t sub_1AF3BB080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  swift_allocObject();
  v8 = sub_1AF3BDAF4(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v8;
}

char *sub_1AF3BB0FC@<X0>(const char *a1@<X0>, char **a2@<X8>)
{
  char *result;

  result = strdup(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1AF3BB128(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  void (*v15)(char *, char *, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t result;
  char *v34;
  char *v35;
  char *v36;
  _QWORD v37[2];
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, char *);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v40 = a8;
  v41 = a5;
  v9 = v8;
  v53 = a4;
  v54 = a1;
  v55 = a2;
  v39 = *(_QWORD *)(a5 - 8);
  v10 = MEMORY[0x1E0C80A78](a1);
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = sub_1AF3E7C10();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x1E0C80A78](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x1E0C80A78](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x1E0C80A78](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x1E0C80A78](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x1E0C80A78](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = sub_1AF3E7A48();
  v57 = sub_1AF3E7E5C();
  v53 = sub_1AF3E7E68();
  sub_1AF3E7E44();
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = sub_1AF3E7A3C();
  if (v31 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v31)
  {
    swift_getAssociatedConformanceWitness();
    while (1)
    {
      sub_1AF3E7C70();
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48))(v24, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v54(v24, v52);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v52, v41);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v24, AssociatedTypeWitness);
      sub_1AF3E7E50();
      if (!--v31)
      {
        v34 = v49;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v34 = v49;
LABEL_9:
  sub_1AF3E7C70();
  v52 = *(char **)(v17 + 48);
  if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v34, 1, AssociatedTypeWitness) == 1)
  {
    v35 = v49;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v43);
    return v57;
  }
  else
  {
    v50 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v36 = v38;
    v35 = v49;
    while (1)
    {
      v50(v36, v35, AssociatedTypeWitness);
      v54(v36, v51);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
      sub_1AF3E7E50();
      sub_1AF3E7C70();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

uint64_t sub_1AF3BB634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  void *v4;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v2; ++i)
    {
      v4 = *(void **)(v1 + 8 * i + 32);
      if (v4)
        free(v4);
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_1AF3BB6DC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1AF3BB6E8()
{
  return 0;
}

uint64_t sub_1AF3BB6F0()
{
  return 2;
}

uint64_t *sub_1AF3BB6F8()
{
  uint64_t **v0;

  return sub_1AF3BCD14(*v0);
}

uint64_t **sub_1AF3BB700(uint64_t **a1, uint64_t a2, uint64_t a3)
{
  uint64_t **v3;

  return sub_1AF3BB708(a1, a2, a3, *v3);
}

uint64_t **sub_1AF3BB708(uint64_t **result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (!a2)
    goto LABEL_9;
  if (!a3)
  {
LABEL_11:
    v5 = a3;
    goto LABEL_12;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v4 = *a4;
    if (*a4)
    {
      v5 = 0;
      v6 = a4 + 1;
      while (1)
      {
        *(_QWORD *)(a2 + 8 * v5) = v4;
        if (a3 - 1 == v5)
          break;
        a4 = v6;
        v7 = *v6++;
        v4 = v7;
        ++v5;
        if (!v7)
          goto LABEL_12;
      }
      a4 = v6;
      goto LABEL_11;
    }
LABEL_9:
    v5 = 0;
LABEL_12:
    *result = a4;
    return (uint64_t **)v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AF3BB768()
{
  return sub_1AF3E7A60();
}

void sub_1AF3BB788(_QWORD *a1@<X8>)
{
  uint64_t **v1;
  uint64_t v2;

  v2 = **v1;
  if (v2)
    ++*v1;
  *a1 = v2;
}

uint64_t sub_1AF3BB7A4()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;

  sub_1AF3911B0(v0, (uint64_t)&v5);
  if (v6)
  {
    v1 = v5;
    sub_1AF3E7DE4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v4 = v1;
    sub_1AF3E7970();
  }
  else
  {
    v2 = v5;
    sub_1AF3E7DE4();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v4 = v2;
  }
  sub_1AF3E7970();
  return v4;
}

uint64_t sub_1AF3BB90C()
{
  __int128 *v0;
  _BYTE v2[40];

  sub_1AF3911B0(v0, (uint64_t)v2);
  return sub_1AF3BB7A4();
}

unint64_t sub_1AF3BB940(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  double v30;
  unint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;

  v5 = 115;
  if ((a3 & 1) == 0)
    v5 = 0xD000000000000010;
  v6 = 0x80000001AF3F21D0;
  if ((a3 & 1) != 0)
    v6 = 0xE100000000000000;
  v47 = v5;
  v48 = v6;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v7)
  {
LABEL_23:
    sub_1AF3BDE90();
    swift_allocError();
    *(_QWORD *)v32 = a1;
    *(_QWORD *)(v32 + 8) = a2;
    *(_QWORD *)(v32 + 16) = v47;
    *(_QWORD *)(v32 + 24) = v48;
    *(_BYTE *)(v32 + 32) = 1;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  v9 = 4 * v7;
  v10 = 15;
  while (1)
  {
    v11 = sub_1AF3E7A18();
    v13 = v12;
    if ((sub_1AF3E788C() & 1) == 0 && (v11 != 46 || v13 != 0xE100000000000000))
      break;
    swift_bridgeObjectRelease();
LABEL_10:
    v10 = sub_1AF3E7958();
    if (v9 == v10 >> 14)
      goto LABEL_23;
  }
  v14 = sub_1AF3E8030();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
    goto LABEL_10;
  swift_bridgeObjectRetain();
  v15 = sub_1AF3E7A30();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v22 = sub_1AF39E584(v10, a1, a2);
  v45 = v23;
  v46 = v22;
  v25 = v24;
  v27 = v26;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v28 = sub_1AF3E7B08();
  if ((v29 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v33 = MEMORY[0x1AF45C4C8](v15, v17, v19, v21);
    v35 = v34;
    swift_bridgeObjectRelease();
    sub_1AF3BDE90();
    swift_allocError();
    *(_QWORD *)v36 = v33;
    *(_QWORD *)(v36 + 8) = v35;
    *(_QWORD *)(v36 + 16) = 0;
    *(_QWORD *)(v36 + 24) = 0;
    *(_BYTE *)(v36 + 32) = 0;
    return swift_willThrow();
  }
  v30 = *(double *)&v28;
  swift_bridgeObjectRelease();
  if ((a3 & 1) != 0 && (sub_1AF3BDED4(v46, v45, v25, v27, 115, 0xE100000000000000) & 1) == 0)
  {
    v38 = MEMORY[0x1AF45C4C8](v46, v45, v25, v27);
    v40 = v39;
    swift_bridgeObjectRelease();
    sub_1AF3BDE90();
    swift_allocError();
    *(_QWORD *)v41 = v38;
    *(_QWORD *)(v41 + 8) = v40;
    *(_OWORD *)(v41 + 16) = xmmword_1AF3ECF70;
LABEL_33:
    *(_BYTE *)(v41 + 32) = 2;
    return swift_willThrow();
  }
  if ((sub_1AF3BDF48(29550, 0xE200000000000000, v46, v45, v25, v27) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((~*(_QWORD *)&v30 & 0x7FF0000000000000) != 0)
    {
      if (v30 > -1.0)
      {
        if (v30 < 1.84467441e19)
          return (unint64_t)v30;
LABEL_47:
        __break(1u);
LABEL_48:
        __break(1u);
        goto LABEL_49;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_47;
  }
  if ((sub_1AF3BDF48(7583170, 0xA300000000000000, v46, v45, v25, v27) & 1) != 0
    || (sub_1AF3BDF48(29557, 0xE200000000000000, v46, v45, v25, v27) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v37 = v30 * 1000.0;
    if ((~COERCE__INT64(v30 * 1000.0) & 0x7FF0000000000000) == 0)
      goto LABEL_48;
    if (v37 <= -1.0)
    {
LABEL_49:
      __break(1u);
    }
    else if (v37 < 1.84467441e19)
    {
      return (unint64_t)v37;
    }
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if ((sub_1AF3BDF48(29549, 0xE200000000000000, v46, v45, v25, v27) & 1) == 0)
  {
LABEL_39:
    if ((sub_1AF3BDF48(115, 0xE100000000000000, v46, v45, v25, v27) & 1) != 0)
    {
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v37 = v30 * 1000000000.0;
      if ((~COERCE__INT64(v30 * 1000000000.0) & 0x7FF0000000000000) == 0)
      {
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
      if (v37 <= -1.0)
      {
LABEL_54:
        __break(1u);
        return result;
      }
      if (v37 < 1.84467441e19)
        return (unint64_t)v37;
      __break(1u);
    }
    v42 = MEMORY[0x1AF45C4C8](v46, v45, v25, v27);
    v44 = v43;
    swift_bridgeObjectRelease();
    sub_1AF3BDE90();
    swift_allocError();
    *(_QWORD *)v41 = v42;
    *(_QWORD *)(v41 + 8) = v44;
    *(_QWORD *)(v41 + 16) = v47;
    *(_QWORD *)(v41 + 24) = v48;
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v37 = v30 * 1000000.0;
  if ((~COERCE__INT64(v30 * 1000000.0) & 0x7FF0000000000000) == 0)
    goto LABEL_51;
  if (v37 <= -1.0)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v37 >= 1.84467441e19)
  {
    __break(1u);
    goto LABEL_39;
  }
  return (unint64_t)v37;
}

unint64_t sub_1AF3BBE94(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  double v26;
  unint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
  {
LABEL_18:
    sub_1AF3BDE90();
    swift_allocError();
    *(_QWORD *)v28 = a1;
    *(_QWORD *)(v28 + 8) = a2;
    *(_OWORD *)(v28 + 16) = xmmword_1AF3ECF80;
    *(_BYTE *)(v28 + 32) = 1;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  v5 = 4 * v4;
  v6 = 15;
  while (1)
  {
    v7 = sub_1AF3E7A18();
    v9 = v8;
    if ((sub_1AF3E788C() & 1) == 0 && (v7 != 46 || v9 != 0xE100000000000000))
      break;
    swift_bridgeObjectRelease();
LABEL_6:
    v6 = sub_1AF3E7958();
    if (v5 == v6 >> 14)
      goto LABEL_18;
  }
  v10 = sub_1AF3E8030();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v11 = sub_1AF3E7A30();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v18 = sub_1AF39E584(v6, a1, a2);
  v20 = v19;
  v38 = v21;
  v23 = v22;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v24 = sub_1AF3E7B08();
  if ((v25 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v29 = MEMORY[0x1AF45C4C8](v11, v13, v15, v17);
    v31 = v30;
    swift_bridgeObjectRelease();
    sub_1AF3BDE90();
    swift_allocError();
    *(_QWORD *)v32 = v29;
    *(_QWORD *)(v32 + 8) = v31;
    *(_QWORD *)(v32 + 16) = 0;
    *(_QWORD *)(v32 + 24) = 0;
    *(_BYTE *)(v32 + 32) = 0;
    return swift_willThrow();
  }
  v26 = *(double *)&v24;
  swift_bridgeObjectRelease();
  if ((sub_1AF3BDF48(25197, 0xE200000000000000, v18, v20, v38, v23) & 1) != 0
    || (sub_1AF3BDF48(16973, 0xE200000000000000, v18, v20, v38, v23) & 1) != 0)
  {
    result = swift_bridgeObjectRelease();
    if ((~*(_QWORD *)&v26 & 0x7FF0000000000000) != 0)
    {
      if (v26 > -1.0)
      {
        if (v26 < 1.84467441e19)
          return (unint64_t)v26;
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_30;
  }
  if ((sub_1AF3BDF48(25191, 0xE200000000000000, v18, v20, v38, v23) & 1) == 0
    && (sub_1AF3BDF48(16967, 0xE200000000000000, v18, v20, v38, v23) & 1) == 0)
  {
    v34 = MEMORY[0x1AF45C4C8](v18, v20, v38, v23);
    v36 = v35;
    swift_bridgeObjectRelease();
    sub_1AF3BDE90();
    swift_allocError();
    *(_QWORD *)v37 = v34;
    *(_QWORD *)(v37 + 8) = v36;
    *(_OWORD *)(v37 + 16) = xmmword_1AF3ECF80;
    *(_BYTE *)(v37 + 32) = 2;
    return swift_willThrow();
  }
  result = swift_bridgeObjectRelease();
  v33 = v26 * 1024.0;
  if ((~COERCE__INT64(v26 * 1024.0) & 0x7FF0000000000000) == 0)
    goto LABEL_31;
  if (v33 <= -1.0)
  {
LABEL_32:
    __break(1u);
  }
  else if (v33 < 1.84467441e19)
  {
    return (unint64_t)v33;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AF3BC24C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  int64x2_t *v14;
  unint64_t v15;
  int64x2_t v16;
  int8x16_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t *v20;
  int64_t v21;
  int64_t v22;

  swift_bridgeObjectRetain();
  v6 = sub_1AF3BDFB0(a1, a2, a3);
  v7 = swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v6 + 16);
  if (v8)
  {
    v9 = *(_QWORD *)(v6 + 32);
    v10 = v8 - 1;
    if (v8 != 1)
    {
      if (v8 < 5)
      {
        v11 = 1;
        goto LABEL_9;
      }
      v11 = v10 & 0xFFFFFFFFFFFFFFFCLL | 1;
      v13 = vdupq_n_s64(v9);
      v14 = (int64x2_t *)(v6 + 56);
      v15 = v10 & 0xFFFFFFFFFFFFFFFCLL;
      v16 = v13;
      do
      {
        v13 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v13, v14[-1]), (int8x16_t)v13, (int8x16_t)v14[-1]);
        v16 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_s64(v16, *v14), (int8x16_t)v16, *(int8x16_t *)v14);
        v14 += 2;
        v15 -= 4;
      }
      while (v15);
      v17 = vbslq_s8((int8x16_t)vcgtq_s64(v13, v16), (int8x16_t)v13, (int8x16_t)v16);
      v18 = vextq_s8(v17, v17, 8uLL).u64[0];
      v9 = (int64_t)vbsl_s8((int8x8_t)vcgtd_s64(v17.i64[0], v18), *(int8x8_t *)v17.i8, (int8x8_t)v18);
      if (v10 != (v10 & 0xFFFFFFFFFFFFFFFCLL))
      {
LABEL_9:
        v19 = v8 - v11;
        v20 = (int64_t *)(v6 + 8 * v11 + 32);
        do
        {
          v22 = *v20++;
          v21 = v22;
          if (v9 <= v22)
            v9 = v21;
          --v19;
        }
        while (v19);
      }
    }
    MEMORY[0x1E0C80A78](v7);
    swift_bridgeObjectRetain();
    v12 = sub_1AF3BDBFC(v6, a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1AF3BE0D0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v12;
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1AF3BC3CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_1AF3E7CE8() & 1) == 0)
    return sub_1AF3E7B44();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v2, a2);
  sub_1AF3E7B20();
  return sub_1AF3E7B38();
}

uint64_t sub_1AF3BC4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t AssociatedConformanceWitness;
  uint64_t AssociatedTypeWitness;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char v47;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v38 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v5 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v37 = (char *)&v35 - v6;
  v43 = *(_QWORD *)(a1 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v41 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v35 - v9;
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = swift_getAssociatedTypeWitness();
  v35 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v35 - v12;
  v14 = swift_checkMetadataState();
  v42 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x1E0C80A78](v14);
  v36 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v35 - v17;
  if ((sub_1AF3E7CDC() & 1) != 0)
  {
    v44 = 30768;
    v45 = 0xE200000000000000;
    sub_1AF347C60();
    sub_1AF3BC3CC((uint64_t)&v44, a1);
    swift_getAssociatedConformanceWitness();
    if ((sub_1AF3E7B2C() & 1) == 0)
    {
      v19 = AssociatedConformanceWitness;
      v20 = sub_1AF3E7CD0();
      MEMORY[0x1E0C80A78](v20);
      *(&v35 - 4) = v14;
      *(&v35 - 3) = v19;
      *(&v35 - 2) = 16;
      swift_getAssociatedConformanceWitness();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BBF8);
      sub_1AF3E7A54();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v11);
      v21 = v42;
      v22 = (uint64_t)v36;
      (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v36, v18, v14);
      if ((v45 & 0x100) == 0)
      {
        v30 = v45;
        v31 = v44;
        (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v14);
        v46 = v31;
        if ((v30 & 1) != 0)
          return 0;
        return v46;
      }
      v23 = sub_1AF3BE154();
      sub_1AF3BCEC4(v22, 16, MEMORY[0x1E0DEBB98], v23, (uint64_t)&v46);
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v14);
LABEL_8:
      if ((v47 & 1) != 0)
        return 0;
      return v46;
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v14);
  }
  else
  {
    v24 = v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v10, v2, a1);
    if ((sub_1AF3E7B2C() & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v10, a1);
    }
    else
    {
      v25 = v37;
      v26 = sub_1AF3E7CD0();
      MEMORY[0x1E0C80A78](v26);
      *(&v35 - 4) = a1;
      *(&v35 - 3) = a2;
      *(&v35 - 2) = 10;
      v27 = AssociatedTypeWitness;
      swift_getAssociatedConformanceWitness();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BBF8);
      sub_1AF3E7A54();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v25, v27);
      v28 = (uint64_t)v41;
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v41, v10, a1);
      if ((v45 & 0x100) != 0)
      {
        v29 = sub_1AF3BE154();
        sub_1AF3BCEC4(v28, 10, MEMORY[0x1E0DEBB98], v29, (uint64_t)&v46);
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, a1);
        goto LABEL_8;
      }
      v32 = v45;
      v33 = v44;
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, a1);
      v46 = v33;
      if ((v32 & 1) == 0)
        return v46;
    }
  }
  return 0;
}

uint64_t sub_1AF3BCA04()
{
  size_t v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = 8;
  v2[0] = 0;
  sysctlbyname("hw.memsize", v2, &v1, 0, 0);
  if ((v2[0] & 0x8000000000000000) != 0)
    __break(1u);
  return v2[0] >> 20;
}

uint64_t sub_1AF3BCA7C()
{
  return os_variant_has_internal_content();
}

uint64_t sub_1AF3BCA98()
{
  size_t v1;
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  v1 = 4;
  sysctlbyname("hw.logicalcpu_max", &v2, &v1, 0, 0);
  return v2;
}

char *sub_1AF3BCB08(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC40);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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

char *sub_1AF3BCC00(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1AF3BCC1C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1AF3BCC1C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC30);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  swift_release();
  return v10;
}

uint64_t *sub_1AF3BCD14(uint64_t *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v1 = *result;
  v2 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v3 = 0;
  if (*result)
  {
    v4 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
    v5 = result + 1;
    while (1)
    {
      if (!v3)
      {
        v6 = v2[3];
        if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_26;
        v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
        if (v7 <= 1)
          v8 = 1;
        else
          v8 = v7;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC18);
        v9 = (_QWORD *)swift_allocObject();
        v10 = _swift_stdlib_malloc_size(v9);
        v11 = v10 - 32;
        if (v10 < 32)
          v11 = v10 - 25;
        v12 = v11 >> 3;
        v9[2] = v8;
        v9[3] = 2 * (v11 >> 3);
        v13 = (unint64_t)(v9 + 4);
        v14 = v2[3] >> 1;
        if (v2[2])
        {
          if (v9 != v2 || v13 >= (unint64_t)&v2[v14 + 4])
            memmove(v9 + 4, v2 + 4, 8 * v14);
          v2[2] = 0;
        }
        v4 = (_QWORD *)(v13 + 8 * v14);
        v3 = (v12 & 0x7FFFFFFFFFFFFFFFLL) - v14;
        result = (uint64_t *)swift_release();
        v2 = v9;
      }
      v16 = __OFSUB__(v3--, 1);
      if (v16)
        break;
      *v4++ = v1;
      v17 = *v5++;
      v1 = v17;
      if (!v17)
        goto LABEL_21;
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
LABEL_21:
  v18 = v2[3];
  if (v18 < 2)
    return v2;
  v19 = v18 >> 1;
  v16 = __OFSUB__(v19, v3);
  v20 = v19 - v3;
  if (!v16)
  {
    v2[2] = v20;
    return v2;
  }
LABEL_27:
  __break(1u);
  return result;
}

unsigned __int8 *sub_1AF3BCE54@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  int v7;
  BOOL v8;
  int v9;

  v7 = *result;
  if (v7 == 43)
  {
    v8 = a2-- < 1;
    if (v8)
      goto LABEL_15;
    if (result)
      ++result;
    else
      result = 0;
LABEL_12:
    v9 = 0;
    return (unsigned __int8 *)sub_1AF3BD010(result, a2, a3, v9, a4, a5, a6);
  }
  if (v7 != 45)
    goto LABEL_12;
  v8 = a2-- < 1;
  if (!v8)
  {
    if (result)
      ++result;
    else
      result = 0;
    v9 = 1;
    return (unsigned __int8 *)sub_1AF3BD010(result, a2, a3, v9, a4, a5, a6);
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1AF3BCEC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v20[2];

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v10 + 16))((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_1AF3E7A24();
  v13 = v12;
  sub_1AF3E7C10();
  if ((v13 & 0x1000000000000000) == 0)
  {
    if ((v13 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v15 = HIBYTE(v13) & 0xF;
    v20[0] = v11;
    v20[1] = v13 & 0xFFFFFFFFFFFFFFLL;
    v14 = (unsigned __int8 *)v20;
    goto LABEL_7;
  }
  v11 = sub_1AF3BD578();
  v17 = v16;
  swift_bridgeObjectRelease();
  v13 = v17;
  if ((v17 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v11 & 0x1000000000000000) != 0)
  {
    v14 = (unsigned __int8 *)((v13 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v15 = v11 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v14 = (unsigned __int8 *)sub_1AF3E7E38();
  }
LABEL_7:
  sub_1AF3BD508(v14, v15, a2, a3, a4, a5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF3BD010@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  int v26;
  int v27;
  int v28;
  unsigned __int8 *v29;
  char *v30;
  unsigned int v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  char *v36;
  int v37;
  int v38;
  char *v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  int v46;
  int v47;
  uint64_t v48;
  int v49;
  char *v50;
  int v51;
  unsigned __int8 *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char v59;
  char v60;
  char v61;
  uint64_t v62;

  v51 = a4;
  v52 = a1;
  v53 = a7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v50 = (char *)&v46 - v12;
  v55 = a6;
  v13 = *(_QWORD *)(a6 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v58 = *(_QWORD *)(a5 - 8);
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v16);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v46 - v21;
  MEMORY[0x1E0C80A78](v20);
  v25 = (char *)&v46 - v24;
  if (!a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56))(v53, 1, 1, a5);
  v57 = v23;
  v26 = a3 + 48;
  v27 = a3 + 55;
  v28 = a3 + 87;
  if (a3 <= 10)
    v28 = 97;
  v46 = v28;
  if (a3 <= 10)
    v27 = 65;
  v47 = v27;
  v62 = a3;
  if (a3 > 10)
    v26 = 58;
  v49 = v26;
  sub_1AF344F88();
  v56 = v25;
  v54 = v13;
  sub_1AF3E7CF4();
  swift_getAssociatedConformanceWitness();
  sub_1AF3E8048();
  sub_1AF3E8024();
  v29 = v52;
  if (!v52)
  {
    v33 = *(void (**)(char *, uint64_t))(v58 + 8);
    v30 = v56;
LABEL_28:
    v33(v30, a5);
    v41 = v58;
    v42 = v53;
    (*(void (**)(uint64_t, char *, uint64_t))(v58 + 32))(v53, v22, a5);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v41 + 56))(v42, 0, 1, a5);
  }
  v30 = v56;
  while (1)
  {
    v31 = *v29;
    if (v31 >= 0x30 && v31 < v49)
    {
      v48 = a2;
      v59 = v31 - 48;
      sub_1AF3BE888();
      sub_1AF3E7CF4();
      goto LABEL_20;
    }
    if (v31 < 0x41 || v31 >= v47)
      break;
    v48 = a2;
    v60 = v31 - 55;
    sub_1AF3BE888();
LABEL_19:
    sub_1AF3E7CF4();
    v30 = v56;
LABEL_20:
    LODWORD(v52) = sub_1AF3E7EBC();
    v32 = v58;
    v33 = *(void (**)(char *, uint64_t))(v58 + 8);
    v33(v22, a5);
    v34 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
    v34(v22, v18, a5);
    v35 = v18;
    v36 = v57;
    if ((v51 & 1) != 0)
      v37 = sub_1AF3E7EC8();
    else
      v37 = sub_1AF3E7EB0();
    v38 = v37;
    v33(v36, a5);
    v33(v22, a5);
    v39 = v50;
    v34(v50, v35, a5);
    v34(v22, v39, a5);
    if (((v52 | v38) & 1) != 0)
    {
      v33(v22, a5);
      v33(v30, a5);
      v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v58 + 56);
      return v40(v53, 1, 1, a5);
    }
    v18 = v35;
    ++v29;
    a2 = v48 - 1;
    if (v48 == 1)
      goto LABEL_28;
  }
  if (v31 >= 0x61 && v31 < v46)
  {
    v48 = a2;
    v61 = v31 - 87;
    sub_1AF3BE888();
    goto LABEL_19;
  }
  v44 = v58;
  v45 = *(void (**)(char *, uint64_t))(v58 + 8);
  v45(v22, a5);
  v45(v56, a5);
  v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56);
  return v40(v53, 1, 1, a5);
}

unsigned __int8 *sub_1AF3BD508@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  int v6;
  BOOL v7;
  int v8;

  v6 = *result;
  if (v6 == 43)
  {
    v7 = a2-- < 1;
    if (v7)
      goto LABEL_15;
    if (result)
      ++result;
    else
      result = 0;
LABEL_12:
    v8 = 0;
    return (unsigned __int8 *)sub_1AF3BD010(result, a2, a3, v8, a4, a5, a6);
  }
  if (v6 != 45)
    goto LABEL_12;
  v7 = a2-- < 1;
  if (!v7)
  {
    if (result)
      ++result;
    else
      result = 0;
    v8 = 1;
    return (unsigned __int8 *)sub_1AF3BD010(result, a2, a3, v8, a4, a5, a6);
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_1AF3BD578()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1AF3E7A30();
  v4 = sub_1AF3BD5F4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1AF3BD5F4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_1AF3BD738(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1AF34714C(v9, 0);
      v12 = sub_1AF3BD824((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1AF45C4E0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1AF45C4E0);
LABEL_9:
      sub_1AF3E7E38();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1AF45C4E0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1AF3BD738(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_1AF3BDA34(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1AF3BDA34(a2, a3, a4);
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
    return sub_1AF3E79B8();
  }
  __break(1u);
  return result;
}

unint64_t sub_1AF3BD824(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
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
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_1AF3BDA34(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_1AF3E79C4();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_1AF3E7E38();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_1AF3BDA34(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_1AF3E79A0();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1AF3BDA34(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_1AF3E79DC();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1AF45C558](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_1AF3BDAAC()
{
  unint64_t v0;

  v0 = sub_1AF3E7F34();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_1AF3BDAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v15[6];

  v5 = v4;
  v15[2] = a2;
  v15[3] = a3;
  v15[4] = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC38);
  v10 = sub_1AF3BB128((void (*)(char *, char *))sub_1AF3BE8CC, (uint64_t)v15, a2, v8, MEMORY[0x1E0DEDCE8], a3, MEMORY[0x1E0DEDD18], v9);
  swift_bridgeObjectRetain();
  v11 = (char *)v10;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v11 = sub_1AF3BCB08(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
  v13 = *((_QWORD *)v11 + 2);
  v12 = *((_QWORD *)v11 + 3);
  if (v13 >= v12 >> 1)
    v11 = sub_1AF3BCB08((char *)(v12 > 1), v13 + 1, 1, v11);
  *((_QWORD *)v11 + 2) = v13 + 1;
  *(_QWORD *)&v11[8 * v13 + 32] = 0;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v5 + 16) = v11;
  return v5;
}

uint64_t sub_1AF3BDBFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t *v8;
  uint64_t result;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  int64_t v37;
  uint64_t v39;
  uint64_t v40;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(a2 + 16);
  if (v6 >= v5)
    v7 = *(_QWORD *)(a1 + 16);
  else
    v7 = *(_QWORD *)(a2 + 16);
  v40 = MEMORY[0x1E0DEE9D8];
  sub_1AF38FDBC(0, v7, 0);
  v32 = v7;
  v34 = a1;
  v35 = a2;
  v36 = v5;
  v33 = v6;
  if (v7)
  {
    v8 = (uint64_t *)(a1 + 32);
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    v10 = (uint64_t *)(a2 + 40);
    while (v5)
    {
      if (!v6)
        goto LABEL_26;
      v11 = *v8;
      v12 = *(v10 - 1);
      v13 = *v10;
      swift_bridgeObjectRetain();
      v39 = a3(v11, v12, v13);
      v15 = v14;
      result = swift_bridgeObjectRelease();
      v17 = *(_QWORD *)(v40 + 16);
      v16 = *(_QWORD *)(v40 + 24);
      if (v17 >= v16 >> 1)
        result = (uint64_t)sub_1AF38FDBC((char *)(v16 > 1), v17 + 1, 1);
      *(_QWORD *)(v40 + 16) = v17 + 1;
      v18 = v40 + 16 * v17;
      --v6;
      *(_QWORD *)(v18 + 32) = v39;
      *(_QWORD *)(v18 + 40) = v15;
      --v5;
      v10 += 2;
      ++v8;
      if (!--v7)
        goto LABEL_13;
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
LABEL_13:
    if (v36 <= v33)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v40;
    }
    v19 = 0;
    if (v32 <= v33)
      v20 = v33;
    else
      v20 = v32;
    v37 = v20 - v32;
    v21 = v36 - v32;
    v22 = (uint64_t *)(v35 + 16 * v32 + 40);
    while (v21 != v19)
    {
      if (v33 - v32 == v19)
        goto LABEL_24;
      if (v37 == v19)
        goto LABEL_28;
      v23 = *(_QWORD *)(v34 + 8 * v32 + 32 + 8 * v19);
      v24 = *(v22 - 1);
      v25 = *v22;
      swift_bridgeObjectRetain();
      v26 = a3(v23, v24, v25);
      v28 = v27;
      result = swift_bridgeObjectRelease();
      v30 = *(_QWORD *)(v40 + 16);
      v29 = *(_QWORD *)(v40 + 24);
      if (v30 >= v29 >> 1)
        result = (uint64_t)sub_1AF38FDBC((char *)(v29 > 1), v30 + 1, 1);
      *(_QWORD *)(v40 + 16) = v30 + 1;
      v31 = v40 + 16 * v30;
      *(_QWORD *)(v31 + 32) = v26;
      *(_QWORD *)(v31 + 40) = v28;
      ++v19;
      v22 += 2;
      if (v21 == v19)
        goto LABEL_24;
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_1AF3BDE90()
{
  unint64_t result;

  result = qword_1EEE3BBE8;
  if (!qword_1EEE3BBE8)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ECE5C, &type metadata for SuffixedNumberError);
    atomic_store(result, (unint64_t *)&qword_1EEE3BBE8);
  }
  return result;
}

uint64_t sub_1AF3BDED4(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;

  if ((a6 & 0x2000000000000000) != 0)
    v6 = HIBYTE(a6) & 0xF;
  else
    v6 = a5 & 0xFFFFFFFFFFFFLL;
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6)
    return 1;
  else
    return sub_1AF3E800C() & 1;
}

uint64_t sub_1AF3BDF48(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;

  if ((a2 & 0x2000000000000000) != 0)
    v7 = HIBYTE(a2) & 0xF;
  else
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (a1 == a5 && a2 == a6 && !(a3 >> 16) && v7 == a4 >> 16)
    return 1;
  else
    return sub_1AF3E800C() & 1;
}

uint64_t sub_1AF3BDFB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  unint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v15 = MEMORY[0x1E0DEE9D8];
    sub_1AF3BCC00(0, v3, 0);
    v4 = v15;
    v8 = (unint64_t *)(a1 + 40);
    do
    {
      v9 = *(v8 - 1);
      v10 = *v8;
      swift_bridgeObjectRetain();
      sub_1AF39D6F0(a2, a3, v9, v10);
      v11 = sub_1AF3E79D0();
      swift_bridgeObjectRelease();
      v13 = *(_QWORD *)(v15 + 16);
      v12 = *(_QWORD *)(v15 + 24);
      if (v13 >= v12 >> 1)
        sub_1AF3BCC00((char *)(v12 > 1), v13 + 1, 1);
      v8 += 2;
      *(_QWORD *)(v15 + 16) = v13 + 1;
      *(_QWORD *)(v15 + 8 * v13 + 32) = v11;
      --v3;
    }
    while (v3);
  }
  return v4;
}

uint64_t sub_1AF3BE0D0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = __OFADD__(v2, v3);
  v5 = v2 + v3;
  if (v4)
  {
    __break(1u);
  }
  else if (!__OFSUB__(v5, result))
  {
    v6 = MEMORY[0x1AF45C5AC](32, 0xE100000000000000, v5 - result);
    sub_1AF3E7970();
    return v6;
  }
  __break(1u);
  return result;
}

unsigned __int8 *sub_1AF3BE140@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1AF3BE198(a1, a2, a3);
}

unint64_t sub_1AF3BE154()
{
  unint64_t result;

  result = qword_1EEE3BBF0;
  if (!qword_1EEE3BBF0)
  {
    result = MEMORY[0x1AF45E31C](MEMORY[0x1E0DEBBE0], MEMORY[0x1E0DEBB98]);
    atomic_store(result, (unint64_t *)&qword_1EEE3BBF0);
  }
  return result;
}

unsigned __int8 *sub_1AF3BE198@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;

  v7 = *(_QWORD *)(v3 + 32);
  v8 = sub_1AF3BE154();
  return sub_1AF3BCE54(a1, a2, v7, MEMORY[0x1E0DEBB98], v8, a3);
}

uint64_t sub_1AF3BE210()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1AF3BE238()
{
  unint64_t result;

  result = qword_1EEE3BC00;
  if (!qword_1EEE3BC00)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ECC9C, &type metadata for StandardFile.Mode);
    atomic_store(result, (unint64_t *)&qword_1EEE3BC00);
  }
  return result;
}

unint64_t sub_1AF3BE280()
{
  unint64_t result;

  result = qword_1EEE3BC08;
  if (!qword_1EEE3BC08)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ECDE4, &type metadata for NullTerminatedCStringArrayIterator);
    atomic_store(result, (unint64_t *)&qword_1EEE3BC08);
  }
  return result;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for StandardFile()
{
  return &type metadata for StandardFile;
}

uint64_t getEnumTagSinglePayload for StandardFile.Mode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StandardFile.Mode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1AF3BE3C8 + 4 * byte_1AF3ECC95[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1AF3BE3FC + 4 * byte_1AF3ECC90[v4]))();
}

uint64_t sub_1AF3BE3FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF3BE404(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF3BE40CLL);
  return result;
}

uint64_t sub_1AF3BE418(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF3BE420);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1AF3BE424(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF3BE42C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StandardFile.Mode()
{
  return &type metadata for StandardFile.Mode;
}

uint64_t type metadata accessor for CStringArray()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for NullTerminatedCStringArray()
{
  return &type metadata for NullTerminatedCStringArray;
}

uint64_t _s6ktrace12StandardFileVwet_0(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t _s6ktrace12StandardFileVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for NullTerminatedCStringArrayIterator()
{
  return &type metadata for NullTerminatedCStringArrayIterator;
}

uint64_t sub_1AF3BE508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  result = a2;
  if (a5 - 1 < 2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  if (!a5)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for SuffixedNumberError(uint64_t a1)
{
  return sub_1AF3BE560(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t sub_1AF3BE560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  uint64_t result;

  result = a2;
  if (a5 - 1 < 2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  if (!a5)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for SuffixedNumberError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1AF3BE508(*(_QWORD *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for SuffixedNumberError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1AF3BE508(*(_QWORD *)a2, v4, v5, v6, v7);
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1AF3BE560(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for SuffixedNumberError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  unsigned __int8 v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_1AF3BE560(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for SuffixedNumberError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SuffixedNumberError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SuffixedNumberError()
{
  return &type metadata for SuffixedNumberError;
}

ValueMetadata *type metadata accessor for CurrentSystem()
{
  return &type metadata for CurrentSystem;
}

__n128 __swift_memcpy152_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t sub_1AF3BE7A0(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 152))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 56);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t sub_1AF3BE7FC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 152) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 152) = 0;
    if (a2)
      *(_QWORD *)(result + 56) = a2;
  }
  return result;
}

void type metadata accessor for __sFILE(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BC10);
}

unint64_t sub_1AF3BE888()
{
  unint64_t result;

  result = qword_1EEE3BC28;
  if (!qword_1EEE3BC28)
  {
    result = MEMORY[0x1AF45E31C](MEMORY[0x1E0DEDEA0], MEMORY[0x1E0DEDE70]);
    atomic_store(result, (unint64_t *)&qword_1EEE3BC28);
  }
  return result;
}

uint64_t sub_1AF3BE8CC()
{
  swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC38);
  return sub_1AF3E7CC4();
}

void type metadata accessor for __sbuf(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BC48);
}

unint64_t sub_1AF3BE974(unint64_t result, unint64_t a2)
{
  double v2;

  v2 = (double)result * (double)HIDWORD(a2) / (double)a2;
  if ((~*(_QWORD *)&v2 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v2 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v2 < 1.84467441e19)
    return (unint64_t)v2;
LABEL_7:
  __break(1u);
  return result;
}

double sub_1AF3BE9D0(unint64_t a1, unint64_t a2)
{
  return (double)a1 * (double)a2 / (double)HIDWORD(a2) / 1000000000.0;
}

unint64_t sub_1AF3BEA00(unsigned int a1, uint64_t a2)
{
  return a1 | (unint64_t)(a2 << 32);
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EventTimebase(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for EventTimebase(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

ValueMetadata *type metadata accessor for EventTimebase()
{
  return &type metadata for EventTimebase;
}

void sub_1AF3BEA70()
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
  _QWORD v9[10];

  v1 = sub_1AF3E7694();
  MEMORY[0x1E0C80A78](v1);
  v2 = sub_1AF3E7E20();
  v9[1] = *(_QWORD *)(v2 - 8);
  v9[2] = v2;
  MEMORY[0x1E0C80A78](v2);
  v9[0] = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1AF3E7E2C();
  v5 = MEMORY[0x1E0C80A78](v4);
  MEMORY[0x1E0C80A78](v5);
  v6 = type metadata accessor for KTraceRecordError();
  MEMORY[0x1E0C80A78](v6);
  sub_1AF3B84D0(v0, (uint64_t)v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = (char *)&loc_1AF3BEBDC + *((int *)qword_1AF3BFDC0 + swift_getEnumCaseMultiPayload());
  __asm { BR              X10 }
}

uint64_t sub_1AF3BEBEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = v0[1];
  *(_QWORD *)(v1 - 120) = *v0;
  *(_QWORD *)(v1 - 112) = v2;
  sub_1AF3E7970();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  return *(_QWORD *)(v1 - 120);
}

void sub_1AF3BFA60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v2, v3, v1);
  *(_QWORD *)(v4 - 120) = 0;
  *(_QWORD *)(v4 - 112) = 0xE000000000000000;
  sub_1AF3E7DE4();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 - 120) = 0xD000000000000029;
  *(_QWORD *)(v4 - 112) = 0x80000001AF3F2290;
  sub_1AF3E767C();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
  JUMPOUT(0x1AF3BFA38);
}

uint64_t type metadata accessor for KTraceRecordError()
{
  uint64_t result;

  result = qword_1EEE40170;
  if (!qword_1EEE40170)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1AF3BFEA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE3B998;
  if (!qword_1EEE3B998)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE3B990);
    result = MEMORY[0x1AF45E31C](MEMORY[0x1E0DEB3D0], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE3B998);
  }
  return result;
}

uint64_t sub_1AF3BFEF0(__int128 *a1, uint64_t a2)
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

uint64_t sub_1AF3BFF08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void (*v18)(char *, uint64_t);
  _OWORD v20[2];
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  _BYTE v27[24];
  uint64_t v28;

  v2 = sub_1AF3E7E20();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v20 - v7;
  v9 = sub_1AF3E7E08();
  if (!v9
    || (v10 = (void *)v9,
        v11 = (void *)sub_1AF3E75E0(),
        v10,
        v12 = (void *)sub_1AF3E7C04(),
        v11,
        !v12))
  {
    memset(v25, 0, sizeof(v25));
    v26 = 1;
LABEL_11:
    sub_1AF3C1760((uint64_t)v25, &qword_1EEE3BC60);
LABEL_12:
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v14(v8, a1, v2);
LABEL_13:
    v15 = sub_1AF3E7E14();
    v17 = v16;
    goto LABEL_14;
  }
  if ((objc_msgSend(v12, sel_respondsToSelector_, sel___swift_objectForKeyedSubscript_) & 1) != 0)
  {
    v21 = 0xD000000000000012;
    v22 = 0x80000001AF3F2900;
    v13 = objc_msgSend(v12, sel___swift_objectForKeyedSubscript_, sub_1AF3E8054());
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    if (v13)
    {
      sub_1AF3E7D60();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v20, 0, sizeof(v20));
    }
    sub_1AF3478BC((uint64_t)v20, (uint64_t)&v21, &qword_1EEE3B610);
  }
  else
  {
    swift_unknownObjectRelease();
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 1;
  }
  sub_1AF3478BC((uint64_t)&v21, (uint64_t)v25, &qword_1EEE3BC60);
  if (v26 == 1)
    goto LABEL_11;
  sub_1AF3478BC((uint64_t)v25, (uint64_t)v27, &qword_1EEE3B610);
  if (v28)
  {
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_12;
    v15 = v21;
    v17 = v22;
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v14(v8, a1, v2);
    if (v17 == 1)
      goto LABEL_13;
  }
  else
  {
    sub_1AF3C1760((uint64_t)v27, &qword_1EEE3B610);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v14(v8, a1, v2);
    v15 = 0;
    v17 = 0;
  }
LABEL_14:
  v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  v18(v8, v2);
  v14(v6, a1, v2);
  if (!v17)
    v15 = sub_1AF3E7E14();
  v18(v6, v2);
  return v15;
}

uint64_t *sub_1AF3C01E0(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v10 = *(_QWORD *)a2;
    *a1 = *(_QWORD *)a2;
    a1 = (uint64_t *)(v10 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = *(_QWORD *)a2;
        v8 = *((_QWORD *)a2 + 1);
        v9 = a2[16];
        sub_1AF39F040(v7, v8, v9);
        *a1 = v7;
        a1[1] = v8;
        *((_BYTE *)a1 + 16) = v9;
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
      case 0x16u:
        v12 = *((_QWORD *)a2 + 1);
        *a1 = *(_QWORD *)a2;
        a1[1] = v12;
        *((_DWORD *)a1 + 4) = *((_DWORD *)a2 + 4);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 5u:
      case 6u:
      case 8u:
      case 0xDu:
      case 0xEu:
      case 0x11u:
      case 0x13u:
      case 0x14u:
      case 0x18u:
      case 0x19u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x23u:
        v19 = *((_QWORD *)a2 + 1);
        *a1 = *(_QWORD *)a2;
        a1[1] = v19;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
      case 9u:
      case 0xAu:
      case 0x12u:
      case 0x15u:
      case 0x17u:
      case 0x22u:
        v20 = *((_QWORD *)a2 + 1);
        *a1 = *(_QWORD *)a2;
        a1[1] = v20;
        v21 = *((_QWORD *)a2 + 2);
        v22 = *((_QWORD *)a2 + 3);
        a1[2] = v21;
        a1[3] = v22;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        v13 = *((_QWORD *)a2 + 1);
        *a1 = *(_QWORD *)a2;
        a1[1] = v13;
        swift_bridgeObjectRetain();
        v14 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA10) + 48);
        v15 = (char *)a1 + v14;
        v16 = &a2[v14];
        v17 = sub_1AF3E7E2C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
        swift_storeEnumTagMultiPayload();
        break;
      case 0xBu:
      case 0xFu:
        v18 = *((_QWORD *)a2 + 1);
        *a1 = *(_QWORD *)a2;
        a1[1] = v18;
        a1[2] = *((_QWORD *)a2 + 2);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 0xCu:
        *a1 = *(_QWORD *)a2;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 0x25u:
        v23 = sub_1AF3E7694();
        (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(a1, a2, v23);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1AF3C07B4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      return sub_1AF39DE80(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
    case 2:
    case 3:
    case 5:
    case 6:
    case 8:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 19:
    case 20:
    case 22:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 35:
      return swift_bridgeObjectRelease();
    case 4:
    case 9:
    case 10:
    case 18:
    case 21:
    case 23:
    case 34:
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    case 7:
      swift_bridgeObjectRelease();
      a1 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA10) + 48);
      v3 = sub_1AF3E7E2C();
      goto LABEL_7;
    case 37:
      v3 = sub_1AF3E7694();
LABEL_7:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *sub_1AF3C0880(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = *(_QWORD *)a2;
      v7 = *((_QWORD *)a2 + 1);
      v8 = a2[16];
      sub_1AF39F040(v6, v7, v8);
      *a1 = v6;
      a1[1] = v7;
      *((_BYTE *)a1 + 16) = v8;
      goto LABEL_11;
    case 2u:
    case 0x16u:
      v9 = *((_QWORD *)a2 + 1);
      *a1 = *(_QWORD *)a2;
      a1[1] = v9;
      *((_DWORD *)a1 + 4) = *((_DWORD *)a2 + 4);
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 3u:
    case 5u:
    case 6u:
    case 8u:
    case 0xDu:
    case 0xEu:
    case 0x11u:
    case 0x13u:
    case 0x14u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
    case 0x1Bu:
    case 0x1Cu:
    case 0x1Du:
    case 0x1Eu:
    case 0x1Fu:
    case 0x20u:
    case 0x23u:
      v16 = *((_QWORD *)a2 + 1);
      *a1 = *(_QWORD *)a2;
      a1[1] = v16;
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 4u:
    case 9u:
    case 0xAu:
    case 0x12u:
    case 0x15u:
    case 0x17u:
    case 0x22u:
      v17 = *((_QWORD *)a2 + 1);
      *a1 = *(_QWORD *)a2;
      a1[1] = v17;
      v18 = *((_QWORD *)a2 + 2);
      v19 = *((_QWORD *)a2 + 3);
      a1[2] = v18;
      a1[3] = v19;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 7u:
      v10 = *((_QWORD *)a2 + 1);
      *a1 = *(_QWORD *)a2;
      a1[1] = v10;
      swift_bridgeObjectRetain();
      v11 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA10) + 48);
      v12 = (char *)a1 + v11;
      v13 = &a2[v11];
      v14 = sub_1AF3E7E2C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      goto LABEL_11;
    case 0xBu:
    case 0xFu:
      v15 = *((_QWORD *)a2 + 1);
      *a1 = *(_QWORD *)a2;
      a1[1] = v15;
      a1[2] = *((_QWORD *)a2 + 2);
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 0xCu:
      *a1 = *(_QWORD *)a2;
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 0x25u:
      v20 = sub_1AF3E7694();
      (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(a1, a2, v20);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t *sub_1AF3C0DA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 != a2)
  {
    sub_1AF3B8514((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v6 = *a2;
        v7 = a2[1];
        v8 = *((_BYTE *)a2 + 16);
        sub_1AF39F040(v6, v7, v8);
        *a1 = v6;
        a1[1] = v7;
        *((_BYTE *)a1 + 16) = v8;
        goto LABEL_12;
      case 2u:
      case 0x16u:
        *a1 = *a2;
        a1[1] = a2[1];
        *((_DWORD *)a1 + 4) = *((_DWORD *)a2 + 4);
        swift_bridgeObjectRetain();
        goto LABEL_12;
      case 3u:
      case 5u:
      case 6u:
      case 8u:
      case 0xDu:
      case 0xEu:
      case 0x11u:
      case 0x13u:
      case 0x14u:
      case 0x18u:
      case 0x19u:
      case 0x1Au:
      case 0x1Bu:
      case 0x1Cu:
      case 0x1Du:
      case 0x1Eu:
      case 0x1Fu:
      case 0x20u:
      case 0x23u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_12;
      case 4u:
      case 9u:
      case 0xAu:
      case 0x12u:
      case 0x15u:
      case 0x17u:
      case 0x22u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_12;
      case 7u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA10) + 48);
        v10 = (char *)a1 + v9;
        v11 = (char *)a2 + v9;
        v12 = sub_1AF3E7E2C();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
        goto LABEL_12;
      case 0xBu:
      case 0xFu:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        swift_bridgeObjectRetain();
        goto LABEL_12;
      case 0xCu:
        *a1 = *a2;
        swift_bridgeObjectRetain();
        goto LABEL_12;
      case 0x25u:
        v13 = sub_1AF3E7694();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, a2, v13);
LABEL_12:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *sub_1AF3C1410(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 37)
  {
    v11 = sub_1AF3E7694();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 7)
  {
    *a1 = *a2;
    v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA10) + 48);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1AF3E7E2C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_OWORD *sub_1AF3C14F8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 != a2)
  {
    sub_1AF3B8514((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 37)
    {
      v11 = sub_1AF3E7694();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 7)
    {
      *a1 = *a2;
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BA10) + 48);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_1AF3E7E2C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for TrimNote(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for TrimNote(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1AF3C160C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1AF3C161C()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  unint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;

  v0 = MEMORY[0x1E0DE9D30] + 64;
  v5 = &unk_1AF3ED168;
  v6 = MEMORY[0x1E0DE9D30] + 64;
  v7 = &unk_1AF3ED180;
  v8 = &unk_1AF3ED198;
  v9 = &unk_1AF3ED1B0;
  v10 = &unk_1AF3ED198;
  v11 = &unk_1AF3ED198;
  result = sub_1AF3E7E2C();
  if (v2 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v12 = &v4;
    v13 = &unk_1AF3ED198;
    v14 = &unk_1AF3ED1B0;
    v15 = &unk_1AF3ED1B0;
    v16 = &unk_1AF3ED1C8;
    v17 = MEMORY[0x1E0DE9D18] + 64;
    v18 = &unk_1AF3ED198;
    v19 = &unk_1AF3ED198;
    v20 = &unk_1AF3ED1C8;
    v21 = v0;
    v22 = &unk_1AF3ED198;
    v23 = &unk_1AF3ED1B0;
    v24 = &unk_1AF3ED198;
    v25 = &unk_1AF3ED198;
    v26 = &unk_1AF3ED1B0;
    v27 = &unk_1AF3ED180;
    v28 = &unk_1AF3ED1B0;
    v29 = &unk_1AF3ED198;
    v30 = &unk_1AF3ED198;
    v31 = &unk_1AF3ED198;
    v32 = &unk_1AF3ED198;
    v33 = &unk_1AF3ED198;
    v34 = &unk_1AF3ED198;
    v35 = &unk_1AF3ED198;
    v36 = &unk_1AF3ED198;
    v37 = &unk_1AF3ED198;
    v38 = MEMORY[0x1E0DE9D38] + 64;
    v39 = &unk_1AF3ED1B0;
    v40 = &unk_1AF3ED198;
    v41 = v0;
    result = sub_1AF3E7694();
    if (v3 <= 0x3F)
    {
      v42 = *(_QWORD *)(result - 8) + 64;
      v43 = &unk_1AF3ED1E0;
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_1AF3C1760(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1AF3C179C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
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
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[16];
  _QWORD *v40;
  uint64_t v41[6];
  _QWORD v42[2];
  uint64_t v43;

  v2 = v1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v43 = MEMORY[0x1E0DEE9D8];
    sub_1AF3C5AC4(0, v3, 0);
    v5 = v43;
    v6 = (unint64_t *)(a1 + 40);
    while (1)
    {
      v7 = *(v6 - 1);
      v8 = *v6;
      swift_bridgeObjectRetain();
      v42[0] = 58;
      v42[1] = 0xE100000000000000;
      v40 = v42;
      swift_bridgeObjectRetain();
      v9 = sub_1AF38ECFC(1, 1, sub_1AF390784, (uint64_t)v39, v7, v8);
      v10 = *((_QWORD *)v9 + 2);
      if (!v10)
        break;
      v37 = v2;
      v38 = v5;
      v11 = *((_QWORD *)v9 + 5);
      v34 = v3;
      v35 = *((_QWORD *)v9 + 4);
      v12 = *((_QWORD *)v9 + 6);
      v13 = *((_QWORD *)v9 + 7);
      if (v10 == 1)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v36 = MEMORY[0x1AF45C804](0, 0xE000000000000000);
        v15 = v14;
        v17 = v16;
        v19 = v18;
      }
      else
      {
        v15 = *((_QWORD *)v9 + 9);
        v36 = *((_QWORD *)v9 + 8);
        v17 = *((_QWORD *)v9 + 10);
        v19 = *((_QWORD *)v9 + 11);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      v20 = MEMORY[0x1AF45C4C8](v35, v11, v12, v13);
      v22 = v21;
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B488);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1AF3EB020;
      v24 = MEMORY[0x1AF45C4C8](v36, v15, v17, v19);
      v26 = v25;
      swift_bridgeObjectRelease();
      *(_QWORD *)(inited + 32) = v24;
      *(_QWORD *)(inited + 40) = v26;
      v27 = sub_1AF3B58BC(inited);
      swift_setDeallocating();
      swift_arrayDestroy();
      v2 = v37;
      v5 = v38;
      if (v37)
        goto LABEL_15;
      swift_bridgeObjectRelease();
      v43 = v38;
      v29 = *(_QWORD *)(v38 + 16);
      v28 = *(_QWORD *)(v38 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_1AF3C5AC4(v28 > 1, v29 + 1, 1);
        v5 = v43;
      }
      v6 += 2;
      *(_QWORD *)(v5 + 16) = v29 + 1;
      v30 = (_QWORD *)(v5 + 24 * v29);
      v30[4] = v20;
      v30[5] = v22;
      v30[6] = v27;
      v3 = v34 - 1;
      if (v34 == 1)
        goto LABEL_13;
    }
    swift_bridgeObjectRelease();
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    swift_allocError();
    *(_QWORD *)v32 = v7;
    *(_QWORD *)(v32 + 8) = v8;
    *(_BYTE *)(v32 + 16) = 0;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_willThrow();
LABEL_15:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
    if (*(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16))
    {
LABEL_13:
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAE0);
      v31 = sub_1AF3E7F10();
    }
    else
    {
      v31 = MEMORY[0x1E0DEE9E0];
    }
    v41[0] = v31;
    sub_1AF3C53D0(v5, 1, v41);
    result = v41[0];
    if (v2)
      return swift_release();
  }
  return result;
}

uint64_t sub_1AF3C1AD0(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 1;
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 1;
  if (v2 >= v3)
    v4 = a1;
  else
    v4 = a2;
  if (v2 >= v3)
    v5 = a2;
  else
    v5 = a1;
  v32 = v4;
  v33 = v4 + 56;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v4 + 56);
  v31 = (unint64_t)(63 - v6) >> 6;
  v9 = v5 + 56;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    while (1)
    {
      v12 = v11;
      if (!v8)
        break;
      v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v14 = v13 | (v11 << 6);
      if (*(_QWORD *)(v5 + 16))
        goto LABEL_31;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v31)
      goto LABEL_48;
    v16 = *(_QWORD *)(v33 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v12 + 2;
      if (v12 + 2 >= v31)
        goto LABEL_48;
      v16 = *(_QWORD *)(v33 + 8 * v11);
      if (!v16)
      {
        v11 = v12 + 3;
        if (v12 + 3 >= v31)
          goto LABEL_48;
        v16 = *(_QWORD *)(v33 + 8 * v11);
        if (!v16)
          break;
      }
    }
LABEL_30:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(_QWORD *)(v5 + 16))
    {
LABEL_31:
      v18 = (uint64_t *)(*(_QWORD *)(v32 + 48) + 16 * v14);
      v20 = *v18;
      v19 = v18[1];
      sub_1AF3E80D8();
      swift_bridgeObjectRetain();
      sub_1AF3E7940();
      v21 = sub_1AF3E8114();
      v22 = -1 << *(_BYTE *)(v5 + 32);
      v23 = v21 & ~v22;
      if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
      {
        v24 = *(_QWORD *)(v5 + 48);
        v25 = (_QWORD *)(v24 + 16 * v23);
        v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (sub_1AF3E8030() & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v30 = 0;
LABEL_45:
          sub_1AF3BA9A0();
          return v30;
        }
        v27 = ~v22;
        while (1)
        {
          v23 = (v23 + 1) & v27;
          if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            break;
          v28 = (_QWORD *)(v24 + 16 * v23);
          v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (sub_1AF3E8030() & 1) != 0)
            goto LABEL_44;
        }
      }
      result = swift_bridgeObjectRelease();
    }
  }
  v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    v30 = 1;
    goto LABEL_45;
  }
  v16 = *(_QWORD *)(v33 + 8 * v17);
  if (v16)
  {
    v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v31)
      goto LABEL_48;
    v16 = *(_QWORD *)(v33 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_30;
  }
LABEL_50:
  __break(1u);
  return result;
}

uint64_t sub_1AF3C1DB0(void *__src)
{
  uint64_t v1;
  void *v2;
  _BYTE __dst[328];
  _BYTE v5[336];

  memcpy(__dst, __src, 0x141uLL);
  v2 = (void *)(v1 + OBJC_IVAR____TtC6ktrace9Recording_plan);
  swift_beginAccess();
  memcpy(v5, v2, 0x141uLL);
  memcpy(v2, __dst, 0x141uLL);
  sub_1AF3B6C90((uint64_t)__dst);
  sub_1AF3B6DB0((uint64_t)v5);
  return sub_1AF3B6DB0((uint64_t)__dst);
}

uint64_t (*sub_1AF3C1E38())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF3C1E7C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_1AF3C1EAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*sub_1AF3C1EE8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF3C1F24()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_1AF3C1F54(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*sub_1AF3C1F90())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1AF3C1FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = nullsub_1(a1);
  *(_QWORD *)(v4 + 24) = nullsub_1(a2);
  return v4;
}

uint64_t sub_1AF3C2024()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1AF3C2034()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC6ktrace9Recording_endReason);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1AF3C2078(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC6ktrace9Recording_endReason);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1AF3C20C0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF3C2104(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC6ktrace9Recording_endWaitGroup);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1AF3C2154())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF3C2198@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + OBJC_IVAR____TtC6ktrace9Recording_kdebugPostprocessing;
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 24);
  v4 = *(_QWORD *)(v3 + 32);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v3 + 8);
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1AF3C2208(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;
  __int128 v4;
  uint64_t v6;
  __int128 v7;

  v7 = *a1;
  v6 = *((_QWORD *)a1 + 3);
  v3 = v1 + OBJC_IVAR____TtC6ktrace9Recording_kdebugPostprocessing;
  swift_beginAccess();
  v4 = a1[1];
  *(_OWORD *)v3 = *a1;
  *(_OWORD *)(v3 + 16) = v4;
  *(_QWORD *)(v3 + 32) = *((_QWORD *)a1 + 4);
  sub_1AF398928((uint64_t)&v7);
  sub_1AF398928((uint64_t)&v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF398950((uint64_t)&v7);
  return sub_1AF398950((uint64_t)&v6);
}

uint64_t (*sub_1AF3C22AC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1AF3C22F0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_1AF3C2344(a1, a2);
  return v4;
}

uint64_t sub_1AF3C2344(_QWORD *a1, uint64_t *a2)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char **v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  FILE *v37;
  FILE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void (*v48)(void);
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  void (*v60)(void);
  _QWORD *v61;
  uint64_t v62;
  void (*v63)(_BYTE *, uint64_t);
  void (*v64)(_BYTE *, uint64_t);
  id v65;
  void *v66;
  uint64_t v67;
  void (*v68)(uint64_t, uint64_t);
  _QWORD *v69;
  uint64_t v70;
  int v71;
  unint64_t *v72;
  uint64_t v73;
  unint64_t isa;
  char *v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  NSObject *v82;
  char *v83;
  __int128 v84;
  unint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  Class v89;
  Class v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  id v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  char *v106;
  unint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  _OWORD *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  int64_t v122;
  unint64_t *v123;
  unint64_t *v124;
  unint64_t v125;
  unint64_t v126;
  unint64_t v127;
  unint64_t *v128;
  unint64_t v129;
  unint64_t *v130;
  uint64_t v131;
  char *v132;
  int64_t v133;
  NSObject *v134;
  unint64_t *v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  objc_class *v151;
  objc_class *v152;
  uint64_t inited;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  NSObject *v158;
  unint64_t v159;
  unint64_t v160;
  NSObject *v161;
  uint64_t v162;
  uint64_t v163;
  NSObject *v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t result;
  NSObject *v170;
  uint64_t v171;
  uint64_t v172;
  char v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  uint64_t v188;
  int *v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  uint64_t v199;
  __int128 v200;
  dispatch_semaphore_t v201;
  NSObject *v202;
  uint64_t v203;
  __int128 v204;
  uint64_t v205;
  _QWORD *v206;
  uint64_t v207;
  void *v208;
  const void *v209;
  uint64_t v210;
  _QWORD *v211;
  uint64_t v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v219;
  char *v220;
  uint64_t v221;
  uint64_t v222;
  void (*v223)(uint64_t, char *, uint64_t);
  uint64_t v224;
  int *v225;
  id v226;
  uint64_t v227;
  uint64_t v228;
  void (*v229)(char *, uint64_t);
  char *v230;
  uint64_t v231;
  uint64_t v232;
  char *v233;
  char *v234;
  char *v235;
  uint64_t v236;
  __int128 v237;
  char *v238;
  uint64_t v239;
  char *v240;
  uint64_t v241;
  uint64_t v242;
  _QWORD *v243;
  uint64_t v244;
  char *v245;
  uint64_t v246;
  uint64_t *v247;
  uint64_t v248;
  uint64_t *v249;
  uint64_t v250;
  NSObject *v251;
  uint64_t v252;
  NSObject *v253;
  _OWORD v254[2];
  uint64_t v255;
  uint64_t v256[25];
  _QWORD v257[25];
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  uint64_t v270;
  uint64_t v271;
  unint64_t v272;
  uint64_t (*v273)(uint64_t);
  void *v274;
  void *v275;
  _QWORD *v276;
  unint64_t v277;
  id v278[6];
  _BYTE v279[321];
  uint64_t v280;

  v249 = a2;
  v280 = *MEMORY[0x1E0C80C00];
  v5 = sub_1AF3E7E2C();
  v231 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x1E0C80A78](v5);
  v233 = (char *)&v221 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v230 = (char *)&v221 - v8;
  v250 = sub_1AF3E7B8C();
  v241 = *(_QWORD *)(v250 - 8);
  MEMORY[0x1E0C80A78](v250);
  v251 = ((char *)&v221 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v239 = sub_1AF3E7B74();
  MEMORY[0x1E0C80A78](v239);
  v240 = (char *)&v221 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1AF3E7838();
  MEMORY[0x1E0C80A78](v11);
  v238 = (char *)&v221 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1AF3E7604();
  v236 = *(_QWORD *)(v13 - 8);
  *(_QWORD *)&v237 = v13;
  MEMORY[0x1E0C80A78](v13);
  v235 = (char *)&v221 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v221 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v246 = sub_1AF3E7694();
  v18 = *(_QWORD *)(v246 - 8);
  v19 = MEMORY[0x1E0C80A78](v246);
  v242 = (uint64_t)&v221 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char **)((char *)&v221 - v22);
  v24 = MEMORY[0x1E0C80A78](v21);
  v234 = (char *)&v221 - v25;
  v26 = MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v221 - v27;
  MEMORY[0x1E0C80A78](v26);
  v245 = (char *)&v221 - v29;
  v30 = OBJC_IVAR____TtC6ktrace9Recording_endWaitGroup;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC6ktrace9Recording_endWaitGroup) = 0;
  if (!*a1)
    goto LABEL_109;
  v232 = v5;
  v248 = v30;
  v31 = sub_1AF3E797C();
  v32 = (uint64_t *)(v2 + OBJC_IVAR____TtC6ktrace9Recording_toolName);
  *v32 = v31;
  v32[1] = v33;
  v247 = v32;
  v252 = v2;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC6ktrace9Recording_recording) = a1;
  v34 = a1[3];
  if (!v34)
  {
LABEL_110:
    __break(1u);
LABEL_111:
    __break(1u);
  }
  v35 = nullsub_1(v34);
  v243 = a1;
  v36 = a1[4];
  if (!v36)
    goto LABEL_111;
  v37 = (FILE *)v35;
  type metadata accessor for Reporter();
  v38 = (FILE *)nullsub_1(v36);
  v39 = sub_1AF39A1DC(v37, v38, 0x6E6964726F636572, 0xE900000000000067, 1);
  if (v3)
  {
    sub_1AF3C7498((uint64_t)v249, type metadata accessor for RecordingOptions);
    swift_bridgeObjectRelease();
    v40 = v252;
LABEL_86:
    swift_release();
    type metadata accessor for Recording();
    swift_deallocPartialClassInstance();
    return v40;
  }
  v41 = v39;
  v244 = 0;
  v42 = v252;
  v221 = OBJC_IVAR____TtC6ktrace9Recording_reporter;
  *(_QWORD *)(v252 + OBJC_IVAR____TtC6ktrace9Recording_reporter) = v39;
  v43 = type metadata accessor for RecordingOptions(0);
  v44 = v42 + OBJC_IVAR____TtC6ktrace9Recording_options;
  v222 = (uint64_t)v249 + *(int *)(v43 + 20);
  sub_1AF3C79F4(v222, v44, type metadata accessor for RecordingOptions.Options);
  v45 = type metadata accessor for RecordingOptions.Options(0);
  v224 = v44;
  v225 = (int *)v45;
  sub_1AF3C5B1C(v44 + *(int *)(v45 + 20), (uint64_t)v17);
  v46 = v246;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v17, 1, v246) == 1)
  {
    __break(1u);
LABEL_113:
    v28 = sub_1AF3C6D84((uint64_t)v28);
    *v23 = v28;
    goto LABEL_107;
  }
  swift_retain();
  v228 = v41;
  v47 = v245;
  sub_1AF3E75F8();
  v229 = *(void (**)(char *, uint64_t))(v18 + 8);
  v229(v17, v46);
  v48 = *(void (**)(void))(v18 + 16);
  v227 = v252 + OBJC_IVAR____TtC6ktrace9Recording_finishedFile;
  v223 = (void (*)(uint64_t, char *, uint64_t))v48;
  v48();
  v49 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3620]), sel_init);
  v50 = (void *)sub_1AF3E7628();
  *(_QWORD *)v279 = 0;
  v51 = objc_msgSend(v49, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 99, 1, v50, 1, v279);

  v52 = *(void **)v279;
  v226 = v51;
  if (!v51)
  {
    v65 = *(id *)v279;
    v66 = (void *)sub_1AF3E75EC();

    swift_willThrow();
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    swift_allocError();
    v223(v67, v47, v46);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();

    swift_release();
    v68 = (void (*)(uint64_t, uint64_t))v229;
    v229(v47, v46);
    sub_1AF3C7498((uint64_t)v249, type metadata accessor for RecordingOptions);
    v69 = (_QWORD *)&unk_1EEE41000;
    v70 = v227;
LABEL_83:
    v68(v70, v46);
    swift_bridgeObjectRelease();
    v40 = v252;
    if (v226)

    sub_1AF3C7498(v40 + v69[61], type metadata accessor for RecordingOptions.Options);
    swift_release();
    goto LABEL_86;
  }
  sub_1AF3E7664();
  v53 = v52;

  *(_QWORD *)v279 = sub_1AF3E761C();
  *(_QWORD *)&v279[8] = v54;
  v56 = v235;
  v55 = v236;
  v57 = v237;
  (*(void (**)(char *, _QWORD, _QWORD))(v236 + 104))(v235, *MEMORY[0x1E0CAFD78], v237);
  v223 = (void (*)(uint64_t, char *, uint64_t))sub_1AF347C60();
  sub_1AF3E7688();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
  swift_bridgeObjectRelease();
  sub_1AF3E764C();
  v58 = v229;
  v229((char *)v23, v46);
  v58(v28, v46);
  v59 = v252;
  v60 = *(void (**)(void))(v18 + 32);
  v236 = v252 + OBJC_IVAR____TtC6ktrace9Recording_inProcessFile;
  *(_QWORD *)&v237 = v60;
  v60();
  sub_1AF3448B8(0, &qword_1EEE3BC68);
  sub_1AF3E782C();
  *(_QWORD *)v279 = MEMORY[0x1E0DEE9D8];
  sub_1AF344878(&qword_1EEE3BC70, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC78);
  sub_1AF3B82B0(&qword_1EEE3BC80, &qword_1EEE3BC78, MEMORY[0x1E0DEAF38]);
  sub_1AF3E7D78();
  (*(void (**)(NSObject *, _QWORD, uint64_t))(v241 + 104))(v251, *MEMORY[0x1E0DEF8D0], v250);
  *(_QWORD *)(v59 + OBJC_IVAR____TtC6ktrace9Recording_waitQueue) = sub_1AF3E7B98();
  v61 = v243;
  if (v243[2])
  {
    v62 = sub_1AF3E797C();
    v64 = v63;
  }
  else
  {
    v62 = 0;
    v64 = 0;
  }
  v71 = (*((_DWORD *)v61 + 12) >> 1) & 1;
  v72 = (unint64_t *)(v224 + v225[30]);
  isa = *v72;
  v73 = v72[1];
  v75 = (char *)v225[26];
  v76 = v75[v224];
  swift_bridgeObjectRetain();
  v77 = v242;
  v78 = v62;
  v79 = v244;
  sub_1AF3A92F0(isa, v73, v76, v71, v78, v64, v242);
  if (v79)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v46 = v246;
    v68 = (void (*)(uint64_t, uint64_t))v229;
    v229(v245, v246);
    sub_1AF3C7498((uint64_t)v249, type metadata accessor for RecordingOptions);
    v69 = (_QWORD *)&unk_1EEE41000;
    v70 = v227;
    v68(v236, v46);
    goto LABEL_83;
  }
  v240 = v75;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v80 = v252;
  v81 = (char *)(v252 + OBJC_IVAR____TtC6ktrace9Recording_planPath);
  ((void (*)(uint64_t, uint64_t, uint64_t))v237)(v252 + OBJC_IVAR____TtC6ktrace9Recording_planPath, v77, v246);
  v235 = v81;
  sub_1AF3A5C84(v279);
  v82 = *(NSObject **)&v279[264];
  v83 = (char *)(v80 + OBJC_IVAR____TtC6ktrace9Recording_plan);
  memcpy((void *)(v80 + OBJC_IVAR____TtC6ktrace9Recording_plan), v279, 0x108uLL);
  *((_QWORD *)v83 + 33) = v82;
  v84 = *(_OWORD *)&v279[288];
  *((_OWORD *)v83 + 17) = *(_OWORD *)&v279[272];
  *((_OWORD *)v83 + 18) = v84;
  *((_OWORD *)v83 + 19) = *(_OWORD *)&v279[304];
  v83[320] = v279[320];
  v85 = (unint64_t *)MEMORY[0x1E0DEE9D8];
  v238 = v83;
  v86 = v80;
  v244 = 0;
  if (v82)
  {
    isa = (unint64_t)v82[2].isa;
    v87 = MEMORY[0x1E0DEE9D8];
    if (isa)
    {
      v271 = MEMORY[0x1E0DEE9D8];
      swift_bridgeObjectRetain();
      sub_1AF38FDBC(0, isa, 0);
      v87 = v271;
      v251 = v82;
      v88 = v82 + 5;
      do
      {
        v90 = v88[-1].isa;
        v89 = v88->isa;
        v271 = v87;
        v92 = *(_QWORD *)(v87 + 16);
        v91 = *(_QWORD *)(v87 + 24);
        swift_bridgeObjectRetain();
        if (v92 >= v91 >> 1)
        {
          sub_1AF38FDBC((char *)(v91 > 1), v92 + 1, 1);
          v87 = v271;
        }
        v88 += 4;
        *(_QWORD *)(v87 + 16) = v92 + 1;
        v93 = v87 + 16 * v92;
        *(_QWORD *)(v93 + 32) = v90;
        *(_QWORD *)(v93 + 40) = v89;
        --isa;
      }
      while (isa);
      swift_bridgeObjectRelease();
      v86 = v252;
      v83 = v238;
      v85 = (unint64_t *)MEMORY[0x1E0DEE9D8];
    }
  }
  else
  {
    v87 = MEMORY[0x1E0DEE9D8];
  }
  swift_beginAccess();
  v271 = *((_QWORD *)v83 + 36);
  swift_bridgeObjectRetain();
  sub_1AF39BC88(v87);
  v94 = swift_bridgeObjectRetain();
  sub_1AF3C6580(v94);
  v95 = sub_1AF3B58BC(v271);
  swift_bridgeObjectRelease();
  v253 = v95;
  v96 = *(_QWORD *)(v95 + 56);
  v241 = v95 + 56;
  v97 = 1 << *(_BYTE *)(v95 + 32);
  v98 = -1;
  if (v97 < 64)
    v98 = ~(-1 << v97);
  v99 = v98 & v96;
  v242 = (unint64_t)(v97 + 63) >> 6;
  swift_bridgeObjectRetain();
  v100 = 0;
  v101 = v240;
  *(_QWORD *)&v237 = v95;
  while (1)
  {
    if (v99)
    {
      v250 = (v99 - 1) & v99;
      v251 = v100;
      v102 = __clz(__rbit64(v99)) | ((_QWORD)v100 << 6);
      goto LABEL_43;
    }
    v103 = (uint64_t)v100 + 1;
    if (__OFADD__(v100, 1))
      break;
    if (v103 >= v242)
      goto LABEL_62;
    v104 = *(_QWORD *)(v241 + 8 * v103);
    v105 = (uint64_t)v100 + 1;
    if (!v104)
    {
      v105 = (uint64_t)v100 + 2;
      if ((uint64_t)v100 + 2 >= v242)
        goto LABEL_62;
      v104 = *(_QWORD *)(v241 + 8 * v105);
      if (!v104)
      {
        v105 = (uint64_t)v100 + 3;
        if ((uint64_t)v100 + 3 >= v242)
          goto LABEL_62;
        v104 = *(_QWORD *)(v241 + 8 * v105);
        if (!v104)
        {
          v106 = (char *)v100 + 4;
          if ((uint64_t)v100 + 4 >= v242)
          {
LABEL_62:
            swift_release();
            v132 = *(char **)(v224 + v225[24]);
            v133 = *((_QWORD *)v132 + 2);
            v134 = MEMORY[0x1E0DEE9D8];
            if (v133)
            {
              v278[0] = (id)MEMORY[0x1E0DEE9D8];
              swift_bridgeObjectRetain();
              sub_1AF3C5AC4(0, v133, 0);
              v251 = v278[0];
              v234 = v132;
              v135 = (unint64_t *)(v132 + 40);
              v237 = xmmword_1AF3EB020;
              while (1)
              {
                v137 = *(v135 - 1);
                v136 = *v135;
                swift_bridgeObjectRetain();
                v257[0] = 58;
                v257[1] = 0xE100000000000000;
                *(_QWORD *)&v259 = v257;
                swift_bridgeObjectRetain();
                v138 = v244;
                v139 = sub_1AF38ECFC(1, 1, sub_1AF390784, (uint64_t)&v258, v137, v136);
                v244 = v138;
                v140 = *((_QWORD *)v139 + 2);
                if (!v140)
                  break;
                v239 = v133;
                v141 = *((_QWORD *)v139 + 4);
                v142 = *((_QWORD *)v139 + 5);
                v143 = *((_QWORD *)v139 + 7);
                v241 = *((_QWORD *)v139 + 6);
                v242 = v141;
                if (v140 == 1)
                {
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRelease();
                  v250 = MEMORY[0x1AF45C804](0, 0xE000000000000000);
                  v145 = v144;
                  v147 = v146;
                  v149 = v148;
                }
                else
                {
                  v145 = *((_QWORD *)v139 + 9);
                  v250 = *((_QWORD *)v139 + 8);
                  v147 = *((_QWORD *)v139 + 10);
                  v149 = *((_QWORD *)v139 + 11);
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRetain();
                  swift_bridgeObjectRelease();
                }
                v150 = MEMORY[0x1AF45C4C8](v242, v142, v241, v143);
                v152 = v151;
                swift_bridgeObjectRelease();
                __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B488);
                inited = swift_initStackObject();
                *(_OWORD *)(inited + 16) = v237;
                v154 = MEMORY[0x1AF45C4C8](v250, v145, v147, v149);
                v156 = v155;
                swift_bridgeObjectRelease();
                *(_QWORD *)(inited + 32) = v154;
                *(_QWORD *)(inited + 40) = v156;
                v157 = sub_1AF3B58BC(inited);
                swift_setDeallocating();
                swift_arrayDestroy();
                v86 = v252;
                if (v244)
                  goto LABEL_74;
                swift_bridgeObjectRelease();
                v158 = v251;
                v278[0] = v251;
                v160 = (unint64_t)v251[2].isa;
                v159 = (unint64_t)v251[3].isa;
                if (v160 >= v159 >> 1)
                {
                  sub_1AF3C5AC4(v159 > 1, v160 + 1, 1);
                  v158 = v278[0];
                }
                v135 += 2;
                v158[2].isa = (Class)(v160 + 1);
                v251 = v158;
                v161 = &v158[3 * v160];
                v161[4].isa = (Class)v150;
                v161[5].isa = v152;
                v161[6].isa = (Class)v157;
                v83 = v238;
                v133 = v239 - 1;
                if (v239 == 1)
                {
                  swift_bridgeObjectRelease();
                  v101 = v240;
                  v134 = v251;
                  goto LABEL_75;
                }
              }
              swift_bridgeObjectRelease();
              type metadata accessor for KTraceRecordError();
              sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
              v162 = swift_allocError();
              *(_QWORD *)v163 = v137;
              *(_QWORD *)(v163 + 8) = v136;
              *(_BYTE *)(v163 + 16) = 0;
              swift_storeEnumTagMultiPayload();
              swift_bridgeObjectRetain();
              v244 = v162;
              swift_willThrow();
LABEL_74:
              swift_bridgeObjectRelease();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
LABEL_80:
              v46 = v246;
              swift_bridgeObjectRelease();
              v167 = v245;
LABEL_81:
              v68 = (void (*)(uint64_t, uint64_t))v229;
              v229(v167, v46);
              sub_1AF3C7498((uint64_t)v249, type metadata accessor for RecordingOptions);
LABEL_82:
              v69 = &unk_1EEE41000;
              v70 = v227;
              v168 = v236;
              v68((uint64_t)v235, v46);
              memcpy(v279, (const void *)(v252 + OBJC_IVAR____TtC6ktrace9Recording_plan), sizeof(v279));
              sub_1AF3B6DB0((uint64_t)v279);
              v68(v168, v46);
              goto LABEL_83;
            }
LABEL_75:
            if (v134[2].isa)
            {
              v164 = v134;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAE0);
              v165 = sub_1AF3E7F10();
              v134 = v164;
            }
            else
            {
              v165 = MEMORY[0x1E0DEE9E0];
            }
            v271 = v165;
            v166 = v244;
            sub_1AF3C53D0((uint64_t)v134, 1, &v271);
            if (v166)
            {
              v244 = v166;
              swift_release();
              swift_release();
              goto LABEL_80;
            }
            v256[0] = v271;
            v170 = v253;
            v171 = v224;
            v172 = *(_QWORD *)(v222 + v225[23]);
            v173 = v101[v224];
            swift_beginAccess();
            v174 = swift_bridgeObjectRetain();
            v175 = sub_1AF3A6230(v174, v172, v173, v256);
            v244 = 0;
            swift_endAccess();
            v251 = v170;
            swift_bridgeObjectRelease();
            v176 = *(_QWORD *)(v86 + v221);
            v271 = 0;
            v272 = 0xE000000000000000;
            swift_retain();
            sub_1AF3E7DE4();
            swift_bridgeObjectRelease();
            v271 = 0xD000000000000016;
            v272 = 0x80000001AF3F2950;
            v177 = v175;
            *(_QWORD *)&v258 = v175;
            v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
            sub_1AF3B82B0((unint64_t *)&qword_1EEE3B478, &qword_1EEE3B470, MEMORY[0x1E0DEAF20]);
            v250 = v178;
            sub_1AF3E7898();
            sub_1AF3E7970();
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v176 + 224))(v271, v272);
            swift_release();
            swift_bridgeObjectRelease();
            v179 = *((_QWORD *)v83 + 34);
            v180 = *((_QWORD *)v83 + 35);
            *(_QWORD *)&v258 = v179;
            *((_QWORD *)&v258 + 1) = v180;
            v181 = (uint64_t *)(v171 + v225[17]);
            v182 = v181[1];
            if (v182)
            {
              v183 = *v181;
              sub_1AF34738C(v179, v180);
              swift_bridgeObjectRetain();
              v184 = v244;
              v185 = sub_1AF38D8B0(v183, v182);
              v244 = v184;
              if (v184)
              {
                swift_release();
                swift_bridgeObjectRelease();
                v186 = v179;
                v187 = v180;
LABEL_96:
                sub_1AF33C310(v186, v187);
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v167 = v245;
                v46 = v246;
                goto LABEL_81;
              }
              sub_1AF38DB48(v185);
              result = swift_bridgeObjectRelease();
            }
            else
            {
              result = sub_1AF34738C(v179, v180);
            }
            v188 = v224;
            v189 = v225;
            v190 = (uint64_t *)(v224 + v225[18]);
            v191 = v190[1];
            isa = v177;
            if (v191)
            {
              v192 = *v190;
              swift_bridgeObjectRetain();
              v193 = v191;
              v194 = v244;
              v195 = sub_1AF38D8B0(v192, v193);
              v244 = v194;
              if (v194)
              {
                swift_release();
                swift_bridgeObjectRelease();
                v187 = *((_QWORD *)&v258 + 1);
                v186 = v258;
                goto LABEL_96;
              }
              sub_1AF38DB48(v195);
              result = swift_bridgeObjectRelease();
              v188 = v224;
              v189 = v225;
            }
            v196 = v188 + v189[13];
            if ((*(_BYTE *)(v196 + 8) & 1) != 0)
            {
              v101 = (char *)v244;
              goto LABEL_105;
            }
            v197 = *(_QWORD *)v196;
            if ((*(_QWORD *)v196 & 0x8000000000000000) == 0)
            {
              swift_beginAccess();
              v198 = (char *)v244;
              sub_1AF3A5198(v197);
              v101 = v198;
              if (v198)
              {
                swift_endAccess();
                swift_release();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_1AF33C310(v258, *((unint64_t *)&v258 + 1));
                v46 = v246;
                v68 = (void (*)(uint64_t, uint64_t))v229;
                v229(v245, v246);
                sub_1AF3C7498((uint64_t)v249, type metadata accessor for RecordingOptions);
                goto LABEL_82;
              }
              goto LABEL_104;
            }
            __break(1u);
LABEL_115:
            __break(1u);
            return result;
          }
          v104 = *(_QWORD *)(v241 + 8 * (_QWORD)v106);
          if (!v104)
          {
            while (1)
            {
              v105 = (uint64_t)(v106 + 1);
              if (__OFADD__(v106, 1))
                break;
              if (v105 >= v242)
                goto LABEL_62;
              v104 = *(_QWORD *)(v241 + 8 * v105);
              ++v106;
              if (v104)
                goto LABEL_42;
            }
            __break(1u);
LABEL_109:
            __break(1u);
            goto LABEL_110;
          }
          v105 = (uint64_t)v100 + 4;
        }
      }
    }
LABEL_42:
    v250 = (v104 - 1) & v104;
    v251 = v105;
    v102 = __clz(__rbit64(v104)) + (v105 << 6);
LABEL_43:
    v107 = (unint64_t *)(*(_QWORD *)(v95 + 48) + 16 * v102);
    isa = *v107;
    v108 = v107[1];
    swift_beginAccess();
    v109 = *((_QWORD *)v83 + 37);
    if (*(_QWORD *)(v109 + 16))
    {
      swift_bridgeObjectRetain_n();
      v110 = sub_1AF396870(isa, v108);
      if ((v111 & 1) != 0)
      {
        v112 = (_OWORD *)(*(_QWORD *)(v109 + 56) + 200 * v110);
        v258 = *v112;
        v113 = v112[3];
        v114 = v112[4];
        v115 = v112[2];
        v259 = v112[1];
        v260 = v115;
        v261 = v113;
        v262 = v114;
        v116 = v112[5];
        v117 = v112[6];
        v118 = v112[8];
        v265 = v112[7];
        v266 = v118;
        v263 = v116;
        v264 = v117;
        v119 = v112[9];
        v120 = v112[10];
        v121 = v112[11];
        v270 = *((_QWORD *)v112 + 24);
        v268 = v120;
        v269 = v121;
        v267 = v119;
        memmove(&v271, v112, 0xC8uLL);
        nullsub_1(&v271);
        sub_1AF3B7E08((uint64_t)&v258);
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        sub_1AF3BA5EC((uint64_t)&v258);
        sub_1AF3C6FFC((uint64_t)&v258, (uint64_t)&v271);
      }
    }
    else
    {
      sub_1AF3BA5EC((uint64_t)&v258);
      sub_1AF3C6FFC((uint64_t)&v258, (uint64_t)&v271);
      swift_bridgeObjectRetain();
    }
    sub_1AF3C6FFC((uint64_t)&v271, (uint64_t)v257);
    sub_1AF3C6FFC((uint64_t)v257, (uint64_t)&v258);
    if (sub_1AF3B6F10((uint64_t)&v258) == 1)
    {
      swift_endAccess();
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
    isa = v277;
    sub_1AF3C6FFC((uint64_t)&v271, (uint64_t)v256);
    swift_endAccess();
    swift_bridgeObjectRetain();
    sub_1AF3C7044((uint64_t)v256);
    swift_bridgeObjectRelease();
    if (isa)
    {
      v122 = *(_QWORD *)(isa + 16);
      if (v122)
      {
        v278[0] = v85;
        sub_1AF38FDBC(0, v122, 0);
        v123 = (unint64_t *)v278[0];
        v239 = isa;
        v124 = (unint64_t *)(isa + 40);
        do
        {
          v125 = *(v124 - 1);
          v126 = *v124;
          v278[0] = v123;
          isa = v123[2];
          v127 = v123[3];
          swift_bridgeObjectRetain();
          if (isa >= v127 >> 1)
          {
            sub_1AF38FDBC((char *)(v127 > 1), isa + 1, 1);
            v123 = (unint64_t *)v278[0];
          }
          v124 += 4;
          v123[2] = isa + 1;
          v128 = &v123[2 * isa];
          v128[4] = v125;
          v128[5] = v126;
          --v122;
        }
        while (v122);
        swift_bridgeObjectRelease();
        v86 = v252;
        v83 = v238;
        v101 = v240;
        v85 = (unint64_t *)MEMORY[0x1E0DEE9D8];
        v129 = v123[2];
        if (v129)
        {
LABEL_56:
          v130 = v123 + 5;
          do
          {
            v131 = *(v130 - 1);
            isa = *v130;
            swift_bridgeObjectRetain();
            sub_1AF3AB50C((uint64_t *)v278, v131, isa);
            swift_bridgeObjectRelease();
            v130 += 2;
            --v129;
          }
          while (v129);
          swift_bridgeObjectRelease();
          v101 = v240;
          goto LABEL_61;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        v123 = v85;
        v129 = v85[2];
        if (v129)
          goto LABEL_56;
      }
      swift_bridgeObjectRelease();
LABEL_61:
      v95 = v237;
    }
LABEL_26:
    v99 = v250;
    v100 = v251;
  }
  __break(1u);
LABEL_104:
  swift_endAccess();
LABEL_105:
  result = (uint64_t)ktrace_session_create();
  if (!result)
    goto LABEL_115;
  v199 = result;
  sub_1AF3C6AB0((uint64_t)&v258);
  v244 = (uint64_t)v101;
  v200 = v258;
  *(_OWORD *)(v86 + OBJC_IVAR____TtC6ktrace9Recording_subclassBitmap) = v258;
  *(_QWORD *)(v86 + OBJC_IVAR____TtC6ktrace9Recording_session) = v199;
  sub_1AF34738C(v200, *((unint64_t *)&v200 + 1));
  v201 = dispatch_semaphore_create(0);
  type metadata accessor for KernelDisableWaiter();
  *(_QWORD *)(v86 + OBJC_IVAR____TtC6ktrace9Recording_kernelDisableWaiter) = sub_1AF3A0894();
  *(_QWORD *)(v86 + OBJC_IVAR____TtC6ktrace9Recording_waitComplete) = v201;
  *(_DWORD *)(v86 + OBJC_IVAR____TtC6ktrace9Recording_endReason) = 0;
  v202 = v201;
  sub_1AF3CC148((unint64_t *)v254);
  v203 = v86 + OBJC_IVAR____TtC6ktrace9Recording_kdebugPostprocessing;
  v204 = v254[1];
  *(_OWORD *)v203 = v254[0];
  *(_OWORD *)(v203 + 16) = v204;
  *(_QWORD *)(v203 + 32) = v255;
  v205 = OBJC_IVAR____TtC6ktrace9Recording_session;
  v206 = (_QWORD *)swift_allocObject();
  v206[2] = v199;
  v206[3] = v86;
  v206[4] = v202;
  v275 = sub_1AF3C70D8;
  v276 = v206;
  v207 = MEMORY[0x1E0C809B0];
  v271 = MEMORY[0x1E0C809B0];
  v272 = 1107296256;
  v273 = sub_1AF347CA4;
  v274 = &block_descriptor_0;
  v208 = _Block_copy(&v271);
  v251 = v202;
  swift_retain();
  swift_release();
  ktrace_set_completion_handler(v199, v208);
  v209 = v208;
  v17 = (char *)v205;
  _Block_release(v209);
  v210 = *(_QWORD *)(v86 + v205);
  v211 = (_QWORD *)swift_allocObject();
  v211[2] = v86;
  v211[3] = v199;
  v212 = v228;
  v211[4] = isa;
  v211[5] = v212;
  v211[6] = v243;
  v275 = sub_1AF3C722C;
  v276 = v211;
  v271 = v207;
  v272 = 1107296256;
  v273 = (uint64_t (*)(uint64_t))sub_1AF347B2C;
  v274 = &block_descriptor_6;
  v213 = _Block_copy(&v271);
  swift_retain();
  swift_retain();
  swift_release();
  ktrace_set_post_processing_handler(v210, v213);
  _Block_release(v213);
  type metadata accessor for CStringArray();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B488);
  v214 = swift_allocObject();
  *(_OWORD *)(v214 + 16) = xmmword_1AF3EB020;
  v215 = *(_QWORD *)(v86 + OBJC_IVAR____TtC6ktrace9Recording_toolName + 8);
  *(_QWORD *)(v214 + 32) = *(_QWORD *)(v86 + OBJC_IVAR____TtC6ktrace9Recording_toolName);
  *(_QWORD *)(v214 + 40) = v215;
  v216 = *v249;
  v271 = v214;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF39BC88(v216);
  v217 = sub_1AF3B82B0(&qword_1EEE3BC88, &qword_1EEE3B470, MEMORY[0x1E0DEAF38]);
  v44 = sub_1AF3BB080((uint64_t)&v271, v250, v217, (uint64_t)v223);
  v23 = (char **)(v44 + 16);
  swift_beginAccess();
  v28 = *(char **)(v44 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v44 + 16) = v28;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_113;
LABEL_107:
  v220 = v245;
  v219 = v246;
  v40 = v252;
  ktrace_set_command_argv(*(_QWORD *)&v17[v252], (const char **)v28 + 4);
  *(_QWORD *)(v44 + 16) = v28;
  swift_endAccess();
  swift_release();

  swift_release();
  sub_1AF33C310(v258, *((unint64_t *)&v258 + 1));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v229(v220, v219);
  sub_1AF3C7498((uint64_t)v249, type metadata accessor for RecordingOptions);
  return v40;
}

uint64_t sub_1AF3C3DDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t (*v19)(_QWORD *, _QWORD);
  uint64_t v20;
  _TtC6ktrace12ProviderList *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  const char *v30;
  uint64_t v31;
  int v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[321];
  _QWORD v36[43];

  v36[41] = *MEMORY[0x1E0C80C00];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC90);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for KTraceRecordError();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (geteuid())
  {
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    swift_allocError();
LABEL_3:
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  sub_1AF3C4258((uint64_t)v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1AF3C79B0((uint64_t)v4, (uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for KTraceRecordError);
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    swift_allocError();
    sub_1AF3C79F4((uint64_t)v7, v9, (uint64_t (*)(_QWORD))type metadata accessor for KTraceRecordError);
    swift_willThrow();
    return sub_1AF3C7498((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for KTraceRecordError);
  }
  sub_1AF3C1760((uint64_t)v4, &qword_1EEE3BC90);
  v10 = *(void **)(*(_QWORD *)(v0 + OBJC_IVAR____TtC6ktrace9Recording_recording) + 40);
  v11 = v0 + OBJC_IVAR____TtC6ktrace9Recording_options;
  v12 = type metadata accessor for RecordingOptions.Options(0);
  v13 = (int *)v12;
  if (v10)
  {
    v14 = (uint64_t *)(v11 + *(int *)(v12 + 120));
    v16 = *v14;
    v15 = v14[1];
    _Block_copy(v10);
    _Block_copy(v10);
    sub_1AF3C4EC4(v16, v15, 0, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10);
    v17 = v10;
  }
  else
  {
    v17 = 0;
  }
  _Block_release(v17);
  if ((*(_BYTE *)(v11 + v13[16]) & 1) == 0)
  {
    v19 = (uint64_t (*)(_QWORD *, _QWORD))(*(uint64_t (**)(_QWORD *))(*(_QWORD *)v0 + 224))(v36);
    *(_BYTE *)(v20 + 168) = 0;
    v18 = v19(v36, 0);
  }
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)v0 + 208))(v36, v18);
  memcpy(v35, v36, sizeof(v35));
  v21 = *(_TtC6ktrace12ProviderList **)(v0 + OBJC_IVAR____TtC6ktrace9Recording_session);
  v22 = *(_BYTE *)(v11 + v13[26]);
  sub_1AF3A7874(v21, *(void **)(v0 + OBJC_IVAR____TtC6ktrace9Recording_reporter), v22);
  result = sub_1AF3B6DB0((uint64_t)v36);
  if (!v1)
  {
    v23 = v11 + v13[19];
    if ((*(_BYTE *)(v23 + 8) & 1) == 0)
      result = ktrace_set_buffer_size((uint64_t)v21, *(_QWORD *)v23);
    v24 = v11 + v13[28];
    if ((*(_BYTE *)(v24 + 8) & 1) == 0)
      result = (uint64_t)ktrace_set_trailing_duration((uint64_t)v21, *(_QWORD *)v24);
    if (*(_BYTE *)(v11 + v13[20]) == 1)
      result = ktrace_set_collection_priority((uint64_t)v21, 63);
    v25 = v11 + v13[21];
    if ((*(_BYTE *)(v25 + 4) & 1) == 0)
      result = ktrace_set_collection_priority((uint64_t)v21, *(_DWORD *)v25);
    v26 = v11 + v13[9];
    if ((*(_BYTE *)(v26 + 4) & 1) != 0)
    {
      v27 = v11 + v13[10];
      if ((*(_BYTE *)(v27 + 8) & 1) != 0)
        return result;
      if ((v22 & 1) == 0)
      {
        sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
        swift_allocError();
        v29 = 0xD00000000000001CLL;
        v30 = "end-after-kdebug-events-size";
LABEL_29:
        *v28 = v29;
        v28[1] = (unint64_t)(v30 - 32) | 0x8000000000000000;
        goto LABEL_3;
      }
    }
    else
    {
      if ((v22 & 1) == 0)
      {
        sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
        swift_allocError();
        v29 = 0xD000000000000013;
        v30 = "end-on-kdebug-event";
        goto LABEL_29;
      }
      *(_DWORD *)v35 = *(_DWORD *)v26;
      memset(&v35[8], 0, 32);
      v32 = -1;
      v33 = 0u;
      v34 = 0u;
      result = ktrace_end_on_event_match((uint64_t)v21, (__int128 *)v35, (__int128 *)&v32);
      v27 = v11 + v13[10];
      if ((*(_BYTE *)(v27 + 8) & 1) != 0)
        return result;
    }
    return ktrace_end_on_event_count((uint64_t)v21, *(_QWORD *)v27);
  }
  return result;
}

uint64_t sub_1AF3C4258@<X0>(uint64_t a1@<X8>)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  int v9;
  size_t v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v10 = 4;
  sysctlbyname("ktrace.state", &v11, &v10, 0, 0);
  if ((v11 | 2) == 2)
    goto LABEL_2;
  v9 = 0;
  v8 = 4;
  sysctlbyname("ktrace.owning_pid", &v9, &v8, 0, 0);
  v3 = v9;
  if (v9 < 1 || v3 == getpid())
    goto LABEL_2;
  v4 = sub_1AF3E7AE4();
  *(_QWORD *)(v4 + 16) = 64;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  if (proc_name(v3, (void *)(v4 + 32), 0x40u) > 0)
  {
LABEL_13:
    v5 = sub_1AF3C75B8(v4);
    v7 = v6;
    swift_bridgeObjectRelease();
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v7;
    *(_DWORD *)(a1 + 16) = v3;
    type metadata accessor for KTraceRecordError();
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC90);
    return swift_storeEnumTagMultiPayload();
  }
  if (MEMORY[0x1AF45C330]() != 3)
  {
    if (*(_QWORD *)(sub_1AF3E7910() + 16))
    {
      swift_release();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        if (*(_QWORD *)(v4 + 16))
        {
LABEL_12:
          *(_BYTE *)(v4 + 32) = 63;
          goto LABEL_13;
        }
LABEL_16:
        __break(1u);
      }
    }
    else
    {
      __break(1u);
    }
    v4 = (uint64_t)sub_1AF3C6D98(v4);
    if (*(_QWORD *)(v4 + 16))
      goto LABEL_12;
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
LABEL_2:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC90);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1AF3C444C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  void (*v16)(unint64_t, unint64_t, _QWORD, _QWORD);
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD);
  const void *v19;
  uint64_t result;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  __int128 v29[3];
  _QWORD v30[2];
  uint64_t v31;

  v2 = v1;
  v3 = v0;
  v4 = v0 + OBJC_IVAR____TtC6ktrace9Recording_options;
  v5 = *(_QWORD *)(v4 + *(int *)(type metadata accessor for RecordingOptions.Options(0) + 24));
  v6 = *(_QWORD *)(v5 + 16);
  v7 = MEMORY[0x1E0DEE9D8];
  if (v6)
  {
    v31 = v1;
    v30[0] = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1AF3C5B64(0, v6, 0);
    v7 = v30[0];
    v8 = (uint64_t *)(v5 + 40);
    do
    {
      v10 = *(v8 - 1);
      v9 = *v8;
      swift_bridgeObjectRetain();
      sub_1AF39FF84(v10, v9, v29);
      swift_bridgeObjectRelease();
      v30[0] = v7;
      v12 = *(_QWORD *)(v7 + 16);
      v11 = *(_QWORD *)(v7 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_1AF3C5B64(v11 > 1, v12 + 1, 1);
        v7 = v30[0];
      }
      v8 += 2;
      *(_QWORD *)(v7 + 16) = v12 + 1;
      sub_1AF3BFEF0(v29, v7 + 40 * v12 + 32);
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
    v2 = v31;
  }
  if (!*(_QWORD *)(v7 + 16))
    return swift_bridgeObjectRelease();
  v13 = *(_QWORD *)(v3 + OBJC_IVAR____TtC6ktrace9Recording_reporter);
  v14 = sub_1AF345A10();
  v15 = sub_1AF347DB0();
  v16 = *(void (**)(unint64_t, unint64_t, _QWORD, _QWORD))(*(_QWORD *)v13 + 216);
  v16(0xD000000000000018, 0x80000001AF3F29E0, v14 & 1, v15 & 1);
  v17 = *(_QWORD *)(v3 + OBJC_IVAR____TtC6ktrace9Recording_recording);
  v18 = *(void (***)(_QWORD, _QWORD))(v17 + 40);
  if (v18)
  {
    _Block_copy(*(const void **)(v17 + 40));
    _Block_copy(v18);
    v29[0] = xmmword_1AF3ED200;
    LODWORD(v30[0]) = 1;
    v30[1] = v29;
    ((void (**)(_QWORD, _QWORD *))v18)[2](v18, v30);
    _Block_release(v18);
    v19 = v18;
  }
  else
  {
    v19 = 0;
  }
  _Block_release(v19);
  type metadata accessor for WaitGroup();
  v21 = *(id *)(v3 + OBJC_IVAR____TtC6ktrace9Recording_waitQueue);
  swift_retain();
  result = sub_1AF39FD1C(v7, v21, v13);
  if (!v2)
  {
    v22 = sub_1AF340A80();
    if (!v22)
      return swift_release();
    v23 = *(_QWORD *)(v22 + 16);
    if (v23)
    {
      v31 = 0;
      v24 = (unint64_t *)(v22 + 40);
      do
      {
        v25 = *(v24 - 1);
        v26 = *v24;
        swift_bridgeObjectRetain();
        v27 = sub_1AF345A10();
        v28 = sub_1AF347DB0();
        v16(v25, v26, v27 & 1, v28 & 1);
        swift_bridgeObjectRelease();
        v24 += 2;
        --v23;
      }
      while (v23);
      swift_release();
      return swift_bridgeObjectRelease();
    }
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1AF3C474C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;

  v4 = (_QWORD *)(a1 + 16);
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 == 1)
  {
    (*(void (**)(unint64_t, unint64_t))(**(_QWORD **)(a2
                                                                             + OBJC_IVAR____TtC6ktrace9Recording_reporter)
                                                               + 248))(0xD000000000000018, 0x80000001AF3F2BE0);
    ktrace_abort(*(_QWORD *)(a2 + OBJC_IVAR____TtC6ktrace9Recording_session));
  }
  else if (v5)
  {
    if (v5 >= 2)
      (*(void (**)(unint64_t, unint64_t))(**(_QWORD **)(a2
                                                                               + OBJC_IVAR____TtC6ktrace9Recording_reporter)
                                                                 + 248))(0xD000000000000011, 0x80000001AF3F2BC0);
  }
  else
  {
    (*(void (**)(unint64_t, unint64_t))(**(_QWORD **)(a2
                                                                             + OBJC_IVAR____TtC6ktrace9Recording_reporter)
                                                               + 248))(0xD00000000000003ELL, 0x80000001AF3F2C00);
  }
  result = swift_beginAccess();
  if (__OFADD__(*v4, 1))
    __break(1u);
  else
    ++*v4;
  return result;
}

uint64_t sub_1AF3C4880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  _BYTE v5[336];

  v1 = v0 + OBJC_IVAR____TtC6ktrace9Recording_planPath;
  v2 = sub_1AF3E7694();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  memcpy(v5, (const void *)(v0 + OBJC_IVAR____TtC6ktrace9Recording_plan), 0x141uLL);
  sub_1AF3B6DB0((uint64_t)v5);
  v3(v0 + OBJC_IVAR____TtC6ktrace9Recording_inProcessFile, v2);
  v3(v0 + OBJC_IVAR____TtC6ktrace9Recording_finishedFile, v2);
  swift_bridgeObjectRelease();

  sub_1AF3C7498(v0 + OBJC_IVAR____TtC6ktrace9Recording_options, type metadata accessor for RecordingOptions.Options);
  sub_1AF33C310(*(_QWORD *)(v0 + OBJC_IVAR____TtC6ktrace9Recording_subclassBitmap), *(_QWORD *)(v0 + OBJC_IVAR____TtC6ktrace9Recording_subclassBitmap + 8));

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1AF3C49D0()
{
  sub_1AF3C4880();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF3C49F4()
{
  uint64_t v0;

  v0 = sub_1AF3E7778();
  __swift_allocate_value_buffer(v0, qword_1EEE41280);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEE41280);
  return sub_1AF3E776C();
}

void sub_1AF3C4A64(int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  void *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(void **)(v3 + 40);
  if (v6)
  {
    _Block_copy(v6);
    sub_1AF3C4EC4(a2, a3, a1, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v6);
  }
  if (qword_1EEE40180 != -1)
    swift_once();
  v8 = sub_1AF3E7778();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EEE41280);
  swift_bridgeObjectRetain_n();
  v9 = sub_1AF3E7760();
  v10 = sub_1AF3E7B50();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v13 = v12;
    *(_DWORD *)v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_1AF346C80(a2, a3, &v13);
    sub_1AF3E7C7C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF33A000, v9, v10, "recording failed: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF45E3DC](v12, -1, -1);
    MEMORY[0x1AF45E3DC](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t ktrace_record(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF34305C(a1, a3);
}

uint64_t ktrace_record(_:_:_:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF34305C(a1, a3);
}

uint64_t ktrace_recording_create(const char *a1, int a2)
{
  uint64_t v4;

  v4 = swift_slowAlloc();
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)v4 = strdup(a1);
  *(_DWORD *)(v4 + 48) = a2;
  return v4;
}

uint64_t ktrace_recording_create(_:_:)(const char *a1, int a2)
{
  uint64_t v4;

  v4 = swift_slowAlloc();
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)v4 = strdup(a1);
  *(_DWORD *)(v4 + 48) = a2;
  return v4;
}

char *ktrace_recording_override_default_plan(uint64_t a1, const char *a2)
{
  char *result;

  free(*(void **)(a1 + 8));
  result = strdup(a2);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

char *ktrace_recording_override_default_plan(_:_:)(uint64_t a1, const char *a2)
{
  char *result;

  free(*(void **)(a1 + 8));
  result = strdup(a2);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t ktrace_recording_set_streams(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = a3;
  return result;
}

uint64_t ktrace_recording_set_streams(_:_:_:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = a3;
  return result;
}

char *ktrace_recording_override_plan_path(uint64_t a1, const char *a2)
{
  char *result;

  free(*(void **)(a1 + 16));
  result = strdup(a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

char *ktrace_recording_override_plan_path(_:_:)(uint64_t a1, const char *a2)
{
  char *result;

  free(*(void **)(a1 + 16));
  result = strdup(a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void ktrace_recording_follow_notifications(uint64_t a1, void *aBlock)
{
  void *v3;
  void *v4;
  void *v5;
  const void *v6;

  v3 = _Block_copy(aBlock);
  v4 = _Block_copy(v3);
  _Block_release(v4);
  v5 = _Block_copy(v4);
  v6 = *(const void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  _Block_copy(v5);
  _Block_release(v6);
  _Block_release(v3);
}

void ktrace_recording_follow_notifications(_:callback:)(uint64_t a1, void *aBlock)
{
  void *v3;
  void *v4;
  const void *v5;

  v3 = _Block_copy(aBlock);
  _Block_release(v3);
  v4 = _Block_copy(v3);
  v5 = *(const void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v4;
  _Block_copy(v4);
  _Block_release(v5);
}

void ktrace_recording_destroy(_:)(uint64_t a1)
{
  const void *v2;

  free(*(void **)a1);
  free(*(void **)(a1 + 16));
  free(*(void **)(a1 + 8));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    _Block_release(v2);
  JUMPOUT(0x1AF45E3DCLL);
}

void sub_1AF3C4EC4(uint64_t a1, uint64_t a2, int a3, void (**a4)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v15;

  v6 = a2;
  v7 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_1AF3E7DD8();
    goto LABEL_8;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      v8 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    }
    else
    {
      v8 = sub_1AF3E7E38();
      if (!v8)
      {
        LODWORD(v11) = a3;
        v12 = 0;
        goto LABEL_7;
      }
    }
    LODWORD(v11) = a3;
    v12 = v8;
LABEL_7:
    ((void (**)(_QWORD, uint64_t *, uint64_t, uint64_t))a4)[2](a4, &v11, v7, v6);
LABEL_8:
    _Block_release(a4);
    return;
  }
  v11 = a1;
  v12 = a2 & 0xFFFFFFFFFFFFFFLL;
  v9 = a3;
  v10 = &v11;
  ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD), int *))a4[2])(a4, &v9);
  _Block_release(a4);
}

_DWORD *sub_1AF3C4FFC@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1AF3C5008(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_1AF3C5010@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_DWORD *sub_1AF3C5024@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_DWORD *sub_1AF3C5038@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1AF3C504C(_DWORD *a1, int *a2)
{
  _DWORD *v2;
  int v3;
  int v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_DWORD *sub_1AF3C507C@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  _DWORD *v2;
  int v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v3 == 0;
  return result;
}

int *sub_1AF3C50A8@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v3;
  int v4;
  int v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v5 == 0;
  return result;
}

_DWORD *sub_1AF3C50CC(_DWORD *result)
{
  _DWORD *v1;

  *v1 |= *result;
  return result;
}

_DWORD *sub_1AF3C50E0(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= *result;
  return result;
}

_DWORD *sub_1AF3C50F4(_DWORD *result)
{
  _DWORD *v1;

  *v1 ^= *result;
  return result;
}

_DWORD *sub_1AF3C5108@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1AF3C511C(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1AF3C5130(_DWORD *a1)
{
  _DWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1AF3C5144(_DWORD *a1)
{
  _DWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1AF3C5158()
{
  _DWORD *v0;

  return *v0 == 0;
}

_DWORD *sub_1AF3C5168(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_1AF3C517C@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X8>)
{
  int v3;
  uint64_t result;

  v3 = sub_1AF3C7C34(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

char *sub_1AF3C51B8(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BCC0);
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
    sub_1AF3C74D4(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1AF3C52B0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC98);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
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
    sub_1AF3C764C(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_1AF3C53D0(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t *i;
  uint64_t *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  for (i = (uint64_t *)(swift_bridgeObjectRetain() + 48); ; i += 3)
  {
    v11 = *(i - 2);
    v10 = *(i - 1);
    v12 = *i;
    v13 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = sub_1AF396870(v11, v10);
    v16 = v13[2];
    v17 = (v14 & 1) == 0;
    v18 = v16 + v17;
    if (__OFADD__(v16, v17))
    {
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      sub_1AF3E806C();
      __break(1u);
      goto LABEL_22;
    }
    v19 = v14;
    if (v13[3] >= v18)
    {
      if ((a2 & 1) == 0)
        sub_1AF3AF36C();
    }
    else
    {
      sub_1AF3C57B0(v18, a2 & 1);
      v20 = sub_1AF396870(v11, v10);
      if ((v19 & 1) != (v21 & 1))
        goto LABEL_21;
      v15 = v20;
    }
    v22 = (_QWORD *)*a3;
    if ((v19 & 1) != 0)
      break;
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v6 = (uint64_t *)(v22[6] + 16 * v15);
    *v6 = v11;
    v6[1] = v10;
    *(_QWORD *)(v22[7] + 8 * v15) = v12;
    v7 = v22[2];
    v8 = __OFADD__(v7, 1);
    v9 = v7 + 1;
    if (v8)
      goto LABEL_20;
    v22[2] = v9;
LABEL_5:
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  v23 = *(_QWORD *)(v22[7] + 8 * v15);
  swift_bridgeObjectRetain();
  if ((sub_1AF3C1AD0(v12, v23) & 1) != 0)
  {
    v24 = sub_1AF3A76F8(v12, v23);
    swift_bridgeObjectRelease();
    v25 = v22[7];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v25 + 8 * v15) = v24;
    goto LABEL_5;
  }
  type metadata accessor for KTraceRecordError();
  sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
  v26 = (void *)swift_allocError();
  v28 = v27;
  swift_bridgeObjectRetain();
  sub_1AF3C5EC4(v12, v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B990);
  sub_1AF3B82B0((unint64_t *)&qword_1EEE3B998, &qword_1EEE3B990, MEMORY[0x1E0DEB3D0]);
  sub_1AF347C60();
  v29 = sub_1AF3E7A6C();
  v31 = v30;
  swift_release();
  *v28 = v29;
  v28[1] = v31;
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  swift_bridgeObjectRelease();
  v32 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_22:
  sub_1AF3E7DE4();
  sub_1AF3E7970();
  sub_1AF3E7E80();
  sub_1AF3E7970();
  sub_1AF3E7EE0();
  __break(1u);
}

uint64_t sub_1AF3C57B0(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BAE0);
  v36 = a2;
  v6 = sub_1AF3E7F04();
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
    sub_1AF3E80D8();
    sub_1AF3E7940();
    result = sub_1AF3E8114();
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

uint64_t sub_1AF3C5AC4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1AF3C5B80(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t type metadata accessor for Recording()
{
  uint64_t result;

  result = qword_1EEE3BF48;
  if (!qword_1EEE3BF48)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AF3C5B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF3C5B64(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1AF3C5D24(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1AF3C5B80(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BCC8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BCD0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1AF3E7F1C();
  __break(1u);
  return result;
}

uint64_t sub_1AF3C5D24(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC98);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BCB8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1AF3E7F1C();
  __break(1u);
  return result;
}

uint64_t sub_1AF3C5EC4(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_1AF3C6044((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_1AF3C6044((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x1AF45E3DC](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_1AF3C6044(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
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
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v62 = v6;
          v12 = v11 | (v6 << 6);
        }
        else
        {
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
              {
                v16 = v6 + 4;
                if (v6 + 4 >= v59)
                  goto LABEL_79;
                v14 = *(_QWORD *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      goto LABEL_83;
                    if (v15 >= v59)
                      goto LABEL_79;
                    v14 = *(_QWORD *)(v58 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_22;
                  }
                }
                v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v62 = v15;
          v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
        v19 = *v17;
        v18 = v17[1];
        sub_1AF3E80D8();
        swift_bridgeObjectRetain();
        sub_1AF3E7940();
        v20 = sub_1AF3E8114();
        v21 = -1 << *(_BYTE *)(v5 + 32);
        v22 = v20 & ~v21;
        v23 = v22 >> 6;
        v24 = 1 << v22;
        if (((1 << v22) & *(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
          break;
LABEL_6:
        result = swift_bridgeObjectRelease();
        v6 = v62;
        v5 = a3;
        v4 = a4;
      }
      v25 = *(_QWORD *)(a3 + 48);
      v26 = (_QWORD *)(v25 + 16 * v22);
      v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_1AF3E8030() & 1) == 0)
      {
        v28 = ~v21;
        for (i = v22 + 1; ; i = v30 + 1)
        {
          v30 = i & v28;
          if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
            break;
          v31 = (_QWORD *)(v25 + 16 * v30);
          v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_1AF3E8030() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v23 = v30 >> 6;
            v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
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
  }
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
    if (v37)
    {
      v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
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
          break;
      }
    }
LABEL_62:
    v37 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    v44 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v40);
    v46 = *v44;
    v45 = v44[1];
    sub_1AF3E80D8();
    swift_bridgeObjectRetain();
    sub_1AF3E7940();
    v47 = sub_1AF3E8114();
    v48 = -1 << *(_BYTE *)(v4 + 32);
    v49 = v47 & ~v48;
    if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
      goto LABEL_46;
    v50 = *(_QWORD *)(a4 + 48);
    v51 = (_QWORD *)(v50 + 16 * v49);
    v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_1AF3E8030() & 1) != 0)
    {
LABEL_76:
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      v33 = __OFADD__(v61++, 1);
      v5 = a3;
      v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_1AF3B19F4(v57, a2, v61, v5);
      }
    }
    else
    {
      v53 = ~v48;
      while (1)
      {
        v49 = (v49 + 1) & v53;
        if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
          break;
        v54 = (_QWORD *)(v50 + 16 * v49);
        v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_1AF3E8030() & 1) != 0)
          goto LABEL_76;
      }
LABEL_46:
      result = swift_bridgeObjectRelease();
      v5 = a3;
      v4 = a4;
    }
  }
  v43 = v41 + 3;
  if (v43 >= v63)
    goto LABEL_79;
  v42 = *(_QWORD *)(v60 + 8 * v43);
  if (v42)
  {
    v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    v34 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v34 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v34);
    ++v43;
    if (v42)
      goto LABEL_62;
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_1AF3C6580(uint64_t result)
{
  char **v1;
  int64_t v2;
  uint64_t v3;
  char *v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  int64_t v32;
  unint64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  uint64_t v37;
  _QWORD v38[2];
  uint64_t v39;
  int64_t v40;
  unint64_t v41;

  v3 = *(_QWORD *)(result + 16);
  v4 = *v1;
  v5 = *((_QWORD *)*v1 + 2);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = result;
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v9 = *((_QWORD *)v4 + 3) >> 1, v9 < v6))
  {
    if (v5 <= v6)
      v10 = v5 + v3;
    else
      v10 = v5;
    v4 = sub_1AF3413B8(isUniquelyReferenced_nonNull_native, v10, 1, v4);
    v9 = *((_QWORD *)v4 + 3) >> 1;
  }
  v11 = *((_QWORD *)v4 + 2);
  v12 = v9 - v11;
  result = sub_1AF3B3DEC((uint64_t)v38, &v4[16 * v11 + 32], v9 - v11, v7);
  if (result < v3)
    goto LABEL_15;
  if (result)
  {
    v14 = *((_QWORD *)v4 + 2);
    v15 = __OFADD__(v14, result);
    v16 = v14 + result;
    if (v15)
    {
      __break(1u);
      goto LABEL_48;
    }
    *((_QWORD *)v4 + 2) = v16;
  }
  if (result != v12)
  {
LABEL_13:
    result = sub_1AF3BA9A0();
    *v1 = v4;
    return result;
  }
LABEL_16:
  v2 = *((_QWORD *)v4 + 2);
  v3 = v38[0];
  v37 = v38[1];
  v13 = v39;
  v6 = v40;
  if (v41)
  {
    v17 = (v41 - 1) & v41;
    v18 = __clz(__rbit64(v41)) | (v40 << 6);
    v36 = (unint64_t)(v39 + 64) >> 6;
    goto LABEL_18;
  }
LABEL_48:
  v32 = v6 + 1;
  if (__OFADD__(v6, 1))
    goto LABEL_66;
  v36 = (unint64_t)(v13 + 64) >> 6;
  if (v32 >= v36)
    goto LABEL_13;
  v33 = *(_QWORD *)(v37 + 8 * v32);
  v34 = v6 + 1;
  if (!v33)
  {
    v34 = v6 + 2;
    if (v6 + 2 >= v36)
      goto LABEL_13;
    v33 = *(_QWORD *)(v37 + 8 * v34);
    if (!v33)
    {
      v34 = v6 + 3;
      if (v6 + 3 >= v36)
        goto LABEL_13;
      v33 = *(_QWORD *)(v37 + 8 * v34);
      if (!v33)
      {
        v34 = v6 + 4;
        if (v6 + 4 >= v36)
          goto LABEL_13;
        v33 = *(_QWORD *)(v37 + 8 * v34);
        if (!v33)
        {
          v34 = v6 + 5;
          if (v6 + 5 >= v36)
            goto LABEL_13;
          v33 = *(_QWORD *)(v37 + 8 * v34);
          if (!v33)
          {
            v35 = v6 + 6;
            do
            {
              if (v36 == v35)
                goto LABEL_13;
              v33 = *(_QWORD *)(v37 + 8 * v35++);
            }
            while (!v33);
            v34 = v35 - 1;
          }
        }
      }
    }
  }
  v17 = (v33 - 1) & v33;
  v18 = __clz(__rbit64(v33)) + (v34 << 6);
  v6 = v34;
LABEL_18:
  v19 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v18);
  v21 = *v19;
  v20 = v19[1];
  result = swift_bridgeObjectRetain();
  while (1)
  {
    v22 = *((_QWORD *)v4 + 3);
    v23 = v22 >> 1;
    if ((uint64_t)(v22 >> 1) < v2 + 1)
      break;
    if (v2 < v23)
      goto LABEL_23;
LABEL_20:
    *((_QWORD *)v4 + 2) = v2;
  }
  result = (uint64_t)sub_1AF3413B8((char *)(v22 > 1), v2 + 1, 1, v4);
  v4 = (char *)result;
  v23 = *(_QWORD *)(result + 24) >> 1;
  if (v2 >= v23)
    goto LABEL_20;
  while (1)
  {
LABEL_23:
    v24 = &v4[16 * v2 + 32];
    *(_QWORD *)v24 = v21;
    *((_QWORD *)v24 + 1) = v20;
    ++v2;
    if (v17)
    {
      v25 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v26 = v25 | (v6 << 6);
      goto LABEL_41;
    }
    v27 = v6 + 1;
    if (__OFADD__(v6, 1))
      break;
    if (v27 >= v36)
      goto LABEL_45;
    v28 = *(_QWORD *)(v37 + 8 * v27);
    v29 = v6 + 1;
    if (!v28)
    {
      v29 = v6 + 2;
      if (v6 + 2 >= v36)
        goto LABEL_45;
      v28 = *(_QWORD *)(v37 + 8 * v29);
      if (!v28)
      {
        v29 = v6 + 3;
        if (v6 + 3 >= v36)
          goto LABEL_45;
        v28 = *(_QWORD *)(v37 + 8 * v29);
        if (!v28)
        {
          v29 = v6 + 4;
          if (v6 + 4 >= v36)
            goto LABEL_45;
          v28 = *(_QWORD *)(v37 + 8 * v29);
          if (!v28)
          {
            v29 = v6 + 5;
            if (v6 + 5 >= v36)
              goto LABEL_45;
            v28 = *(_QWORD *)(v37 + 8 * v29);
            if (!v28)
            {
              v30 = v6 + 6;
              while (v36 != v30)
              {
                v28 = *(_QWORD *)(v37 + 8 * v30++);
                if (v28)
                {
                  v29 = v30 - 1;
                  goto LABEL_40;
                }
              }
LABEL_45:
              *((_QWORD *)v4 + 2) = v2;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_40:
    v17 = (v28 - 1) & v28;
    v26 = __clz(__rbit64(v28)) + (v29 << 6);
    v6 = v29;
LABEL_41:
    v31 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v26);
    v21 = *v31;
    v20 = v31[1];
    if (v2 >= v23)
    {
      result = swift_bridgeObjectRetain();
      goto LABEL_20;
    }
    result = swift_bridgeObjectRetain();
  }
  __break(1u);
LABEL_66:
  __break(1u);
  return result;
}

uint64_t sub_1AF3C6948(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_1AF3C52B0(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[5 * v8 + 4];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BCB8);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_1AF3E7F1C();
  __break(1u);
  return result;
}

void sub_1AF3C6AB0(uint64_t a1)
{
  __asm { BR              X13 }
}

void sub_1AF3C6B08(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t aBlock, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  _QWORD v34[6];
  uint64_t v35;
  unsigned int v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned __int8 v39;

  v35 = v29;
  LOWORD(v36) = v28;
  BYTE2(v36) = BYTE2(v28);
  HIBYTE(v36) = BYTE3(v28);
  v37 = BYTE4(v28);
  v38 = BYTE5(v28);
  v39 = BYTE6(v28);
  v34[4] = nullsub_1;
  v34[5] = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 1107296256;
  v34[2] = sub_1AF347B2C;
  v34[3] = &block_descriptor_35;
  v32 = _Block_copy(v34);
  ktrace_events_filter_bitmap(v31, &v35, v32);
  _Block_release(v32);
  v33 = v36 | ((unint64_t)v37 << 32) | ((unint64_t)v38 << 40) | ((unint64_t)v39 << 48);
  *v30 = v35;
  v30[1] = v33;
}

char *sub_1AF3C6D84(uint64_t a1)
{
  return sub_1AF3BCB08(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1AF3C6D98(uint64_t a1)
{
  return sub_1AF3C51B8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_1AF3C6DAC(int *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  _QWORD v10[6];

  sub_1AF3E76B8();
  v4 = *a1;
  if (a1[1] < (int)v4)
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v5 = sub_1AF3E7580();
  if (v5)
  {
    v6 = v5;
    v7 = sub_1AF3E75A4();
    if (!__OFSUB__(v4, v7))
    {
      v8 = (const void *)(v6 + v4 - v7);
      sub_1AF3E7598();
      v10[4] = nullsub_1;
      v10[5] = 0;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 1107296256;
      v10[2] = sub_1AF347B2C;
      v10[3] = &block_descriptor_41;
      v9 = _Block_copy(v10);
      ktrace_events_filter_bitmap(a2, v8, v9);
      _Block_release(v9);
      return;
    }
    goto LABEL_6;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_1AF3C6E8C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x1E0DEE9D8];
    v8 = 2 * v5;
    if (v5 <= 0)
    {
      v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0)
          goto LABEL_19;
        v12 = a2 + 16 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8)
          goto LABEL_19;
        swift_arrayInitWithCopy();
        return (uint64_t)v9;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B488);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 17;
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 4);
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  result = sub_1AF3E7F1C();
  __break(1u);
  return result;
}

uint64_t sub_1AF3C6FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF3C7044(uint64_t a1)
{
  sub_1AF3BA610(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192));
  return a1;
}

uint64_t sub_1AF3C70AC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1AF3C70D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t end_reason;
  _QWORD *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE __dst[328];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _QWORD __src[41];

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  end_reason = ktrace_get_end_reason(v2);
  ktrace_session_destroy(v2);
  v4 = (*(_QWORD *(**)(__int128 *__return_ptr))(*(_QWORD *)v1 + 280))(&v10);
  (*(void (**)(_QWORD *__return_ptr, _QWORD *))(*(_QWORD *)v1 + 208))(__src, v4);
  memcpy(__dst, __src, 0x141uLL);
  v5 = sub_1AF3CBE84(__dst, v1 + OBJC_IVAR____TtC6ktrace9Recording_options);
  v7 = v6;
  v13 = v10;
  sub_1AF398950((uint64_t)&v13);
  v12 = v11;
  sub_1AF398950((uint64_t)&v12);
  sub_1AF3B6DB0((uint64_t)__src);
  if (v7)
  {
    (*(void (**)(unint64_t, uint64_t))(**(_QWORD **)(v1 + OBJC_IVAR____TtC6ktrace9Recording_reporter)
                                                      + 232))(v5, v7);
    swift_bridgeObjectRelease();
  }
  kperf_reset();
  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 240))(end_reason);
  return sub_1AF3E7BF8();
}

uint64_t sub_1AF3C71F8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1AF3C722C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t end_reason;
  char v9;
  char v10;
  void (**v11)(_QWORD, _QWORD);
  const void *v12;
  void *v13;
  __int128 v14;
  uint64_t (*v15)();
  void *v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  int v19;
  __int128 *v20;

  v4 = v1[2];
  v3 = v1[3];
  v5 = v1[5];
  v6 = v1[6];
  v7 = *(_QWORD *)(v4 + OBJC_IVAR____TtC6ktrace9Recording_kernelDisableWaiter);
  end_reason = ktrace_get_end_reason(v3);
  (*(void (**)(uint64_t))(*(_QWORD *)v7 + 128))(end_reason);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
  sub_1AF3B82B0((unint64_t *)&qword_1EEE3B478, &qword_1EEE3B470, MEMORY[0x1E0DEAF20]);
  sub_1AF3E7898();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  sub_1AF3E7DE4();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v14 = 0xD000000000000018;
  *((_QWORD *)&v14 + 1) = 0x80000001AF3F2D10;
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  v9 = sub_1AF345A10();
  v10 = sub_1AF347DB0();
  (*(void (**)(unint64_t, unint64_t, _QWORD, _QWORD))(*(_QWORD *)v5 + 216))(0xD000000000000018, 0x80000001AF3F2D10, v9 & 1, v10 & 1);
  swift_bridgeObjectRelease();
  v11 = *(void (***)(_QWORD, _QWORD))(v6 + 40);
  if (v11)
  {
    _Block_copy(*(const void **)(v6 + 40));
    _Block_copy(v11);
    v14 = xmmword_1AF3ED200;
    v19 = 5;
    v20 = &v14;
    ((void (**)(_QWORD, int *))v11)[2](v11, &v19);
    _Block_release(v11);
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  _Block_release(v12);
  v17 = sub_1AF3C7A7C;
  v18 = v4;
  *(_QWORD *)&v14 = MEMORY[0x1E0C809B0];
  *((_QWORD *)&v14 + 1) = 1107296256;
  v15 = sub_1AF347B2C;
  v16 = &block_descriptor_29;
  v13 = _Block_copy(&v14);
  swift_retain();
  swift_release();
  ktrace_events_all(a1, v13);
  _Block_release(v13);
}

uint64_t sub_1AF3C7498(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_1AF3C74D4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_1AF3E7F1C();
  __break(1u);
  return result;
}

uint64_t sub_1AF3C75B8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
      return sub_1AF3E7928();
    v4 = 0;
    v5 = v1 - 1;
    v6 = v2 + 33;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v6 + v4++))
        return sub_1AF3E7928();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1AF3C7600()
{
  return swift_deallocObject();
}

uint64_t sub_1AF3C7614()
{
  uint64_t v0;

  return sub_1AF3C474C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF3C764C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BCB8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1AF3E7F1C();
  __break(1u);
  return result;
}

uint64_t sub_1AF3C7758()
{
  return type metadata accessor for Recording();
}

uint64_t sub_1AF3C7760()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1AF3E7694();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for RecordingOptions.Options(319);
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t type metadata accessor for Recording.Diagnostics()
{
  return objc_opt_self();
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1AF3C789C(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t sub_1AF3C78F8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

void type metadata accessor for ktrace_recording(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BCA0);
}

unint64_t sub_1AF3C796C()
{
  unint64_t result;

  result = qword_1EEE3BCB0;
  if (!qword_1EEE3BCB0)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ECD7C, &type metadata for NullTerminatedCStringArray);
    atomic_store(result, (unint64_t *)&qword_1EEE3BCB0);
  }
  return result;
}

uint64_t sub_1AF3C79B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AF3C79F4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1AF3C7A38(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  uint64_t v5;

  v5 = a1;
  v2 = *(_QWORD *)(v1 + 24);
  v4 = *(_DWORD *)(v1 + 16);
  return (*(uint64_t (**)(uint64_t, int *))(v2 + 16))(v2, &v4);
}

uint64_t sub_1AF3C7A7C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_BYTE *, _QWORD);
  _BYTE v4[32];

  if (result)
  {
    v2 = result;
    v3 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v1 + 296))(v4);
    sub_1AF3CBDF0(v2);
    return v3(v4, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void type metadata accessor for ktrace_record_flags_t(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BCD8);
}

uint64_t sub_1AF3C7AF0(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 8))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t sub_1AF3C7B34(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = 0;
  }
  return result;
}

void type metadata accessor for ktrace_record_notify(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BCE0);
}

uint64_t sub_1AF3C7B84()
{
  return sub_1AF344878(&qword_1EEE3BCE8, (uint64_t (*)(uint64_t))type metadata accessor for ktrace_record_flags_t, (uint64_t)&unk_1AF3ED354);
}

uint64_t sub_1AF3C7BB0()
{
  return sub_1AF344878(&qword_1EEE3BCF0, (uint64_t (*)(uint64_t))type metadata accessor for ktrace_record_flags_t, (uint64_t)&unk_1AF3ED320);
}

uint64_t sub_1AF3C7BDC()
{
  return sub_1AF344878(&qword_1EEE3BCF8, (uint64_t (*)(uint64_t))type metadata accessor for ktrace_record_flags_t, (uint64_t)&unk_1AF3ED380);
}

uint64_t sub_1AF3C7C08()
{
  return sub_1AF344878(&qword_1EEE3BD00, (uint64_t (*)(uint64_t))type metadata accessor for ktrace_record_flags_t, (uint64_t)&unk_1AF3ED3BC);
}

uint64_t sub_1AF3C7C34(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = (int *)(v2 + 32);
  do
  {
    v5 = *v3++;
    v4 = v5;
    if ((v5 & ~(_DWORD)result) == 0)
      v4 = 0;
    result = v4 | result;
    --v1;
  }
  while (v1);
  return result;
}

void type metadata accessor for ktrace_record_note_t(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BD08);
}

unint64_t sub_1AF3C7CDC()
{
  unint64_t result;

  result = sub_1AF3C84C8((uint64_t)&unk_1E5F6E530);
  qword_1EEE41298 = result;
  return result;
}

uint64_t sub_1AF3C7D00(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 184);
  if (v1 && *(_QWORD *)(v1 + 16))
  {
    sub_1AF3E7DE4();
    sub_1AF3E7970();
    sub_1AF3E8018();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
  }
  v2 = sub_1AF3A5794();
  v3 = sub_1AF3C7FFC((uint64_t)v2);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v3 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
    sub_1AF390B14();
    sub_1AF3E7898();
    swift_bridgeObjectRelease();
    sub_1AF3E7DE4();
    sub_1AF3E7970();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3E7970();
  }
  swift_bridgeObjectRelease();
  sub_1AF3E7DE4();
  sub_1AF3E7970();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1AF3C7FFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  __int128 *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  _BYTE v60[184];
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _OWORD v71[2];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[16];
  uint64_t v78;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  v2 = a1 + 32;
  v3 = swift_bridgeObjectRetain();
  v4 = *(_OWORD *)(v3 + 208);
  v55 = *(_OWORD *)(v3 + 192);
  v56 = v4;
  v57 = *(_OWORD *)(v3 + 224);
  v58 = *(_QWORD *)(v3 + 240);
  v5 = *(_OWORD *)(v3 + 144);
  v51 = *(_OWORD *)(v3 + 128);
  v52 = v5;
  v6 = *(_OWORD *)(v3 + 176);
  v53 = *(_OWORD *)(v3 + 160);
  v54 = v6;
  v7 = *(_OWORD *)(v3 + 80);
  v47 = *(_OWORD *)(v3 + 64);
  v48 = v7;
  v8 = *(_OWORD *)(v3 + 112);
  v49 = *(_OWORD *)(v3 + 96);
  v50 = v8;
  v9 = *(_OWORD *)(v3 + 48);
  v45 = *(_OWORD *)(v3 + 32);
  v46 = v9;
  v10 = (char *)MEMORY[0x1E0DEE9D8];
  v11 = 1;
  v35 = v2;
  v36 = v1;
  while (1)
  {
    v43 = v45;
    *(_OWORD *)&v60[144] = v56;
    *(_OWORD *)&v60[160] = v57;
    *(_QWORD *)&v60[176] = v58;
    *(_OWORD *)&v60[80] = v52;
    *(_OWORD *)&v60[96] = v53;
    *(_OWORD *)&v60[112] = v54;
    *(_OWORD *)&v60[128] = v55;
    *(_OWORD *)&v60[16] = v48;
    *(_OWORD *)&v60[32] = v49;
    *(_OWORD *)&v60[48] = v50;
    *(_OWORD *)&v60[64] = v51;
    v59 = v46;
    *(_OWORD *)v60 = v47;
    sub_1AF3C9598((uint64_t)&v45);
    v74 = *(_OWORD *)&v60[136];
    v75 = *(_OWORD *)&v60[152];
    v76 = *(_OWORD *)&v60[168];
    v71[0] = *(_OWORD *)&v60[72];
    v71[1] = *(_OWORD *)&v60[88];
    v72 = *(_OWORD *)&v60[104];
    v73 = *(_OWORD *)&v60[120];
    v67 = *(_OWORD *)&v60[8];
    v68 = *(_OWORD *)&v60[24];
    v69 = *(_OWORD *)&v60[40];
    v70 = *(_OWORD *)&v60[56];
    sub_1AF3CBC98((uint64_t)v71, (uint64_t)v77);
    sub_1AF3CBC98((uint64_t)v77, (uint64_t)&v78);
    if (v78)
    {
      if ((_QWORD)v72)
      {
        v12 = *(_QWORD *)(v72 + 16);
        if (v12)
          break;
      }
    }
LABEL_33:
    sub_1AF3BA530((uint64_t)&v45);
    if (v11 == v1)
      goto LABEL_35;
LABEL_34:
    v28 = (__int128 *)(v2 + 216 * v11);
    v29 = v28[11];
    v55 = v28[10];
    v56 = v29;
    v57 = v28[12];
    v58 = *((_QWORD *)v28 + 26);
    v30 = v28[7];
    v51 = v28[6];
    v52 = v30;
    v31 = v28[9];
    v53 = v28[8];
    v54 = v31;
    v32 = v28[3];
    v47 = v28[2];
    v48 = v32;
    v33 = v28[5];
    v49 = v28[4];
    v50 = v33;
    v34 = v28[1];
    ++v11;
    v45 = *v28;
    v46 = v34;
  }
  v41 = v10;
  v13 = v72 + 32;
  v14 = *(_QWORD *)(v78 + 16);
  v15 = v78 + 32;
  result = swift_bridgeObjectRetain();
  v17 = 0;
  v42 = v11;
  v39 = v13;
  v40 = v12;
  v37 = v15;
  v38 = v14;
  while (1)
  {
    v18 = *(_QWORD *)(v13 + 24 * v17);
    if (v18 < v14)
    {
      if (v18 < 0)
      {
        __break(1u);
        return result;
      }
      v44 = *(_QWORD *)(*(_QWORD *)(v15 + 8 * v18) + 16);
      if (v44)
        break;
    }
LABEL_7:
    if (++v17 == v12)
    {
      swift_bridgeObjectRelease();
      v2 = v35;
      v1 = v36;
      v10 = v41;
      goto LABEL_33;
    }
  }
  sub_1AF340A10();
  swift_bridgeObjectRetain();
  v19 = swift_bridgeObjectRetain();
  v20 = 0;
  while (1)
  {
    v21 = v19;
    v22 = *(_BYTE *)(v19 + v20 + 32);
    v66 = v22;
    v65 = 0;
    sub_1AF3E7A78();
    sub_1AF3E7A78();
    if (v63 == v61 && v64 == v62)
      break;
    v24 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v24 & 1) != 0)
      goto LABEL_23;
    v66 = v22;
    v65 = 1;
    sub_1AF3E7A78();
    sub_1AF3E7A78();
    if (v63 == v61 && v64 == v62)
      break;
    v25 = sub_1AF3E8030();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      goto LABEL_23;
    ++v20;
    v19 = v21;
    if (v44 == v20)
    {
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v11 = v42;
      v13 = v39;
      v12 = v40;
      v15 = v37;
      v14 = v38;
      goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_23:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1AF3BA530((uint64_t)&v45);
  if (*((_QWORD *)&v43 + 1))
  {
    v10 = v41;
    v2 = v35;
    v1 = v36;
    v11 = v42;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_1AF3413B8(0, *((_QWORD *)v41 + 2) + 1, 1, v41);
    v27 = *((_QWORD *)v10 + 2);
    v26 = *((_QWORD *)v10 + 3);
    if (v27 >= v26 >> 1)
      v10 = sub_1AF3413B8((char *)(v26 > 1), v27 + 1, 1, v10);
    *((_QWORD *)v10 + 2) = v27 + 1;
    *(_OWORD *)&v10[16 * v27 + 32] = v43;
  }
  else
  {
    v2 = v35;
    v1 = v36;
    v10 = v41;
    v11 = v42;
  }
  if (v11 != v1)
    goto LABEL_34;
LABEL_35:
  swift_bridgeObjectRelease();
  return (uint64_t)v10;
}

uint64_t sub_1AF3C84A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_1AF3C7D00(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

unint64_t sub_1AF3C84C8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  __int128 *v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD30);
  v2 = (_QWORD *)sub_1AF3E7F10();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (__int128 *)(a1 + 40);
  while (1)
  {
    v5 = *((unsigned __int8 *)v4 - 8);
    v11 = *v4;
    swift_retain();
    result = sub_1AF3C9228(v5);
    if ((v7 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    *(_OWORD *)(v2[7] + 16 * result) = v11;
    v8 = v2[2];
    v9 = __OFADD__(v8, 1);
    v10 = v8 + 1;
    if (v9)
      goto LABEL_11;
    v2[2] = v10;
    v4 = (__int128 *)((char *)v4 + 24);
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

uint64_t type metadata accessor for KdebugAdvice()
{
  uint64_t result;

  result = qword_1EEE40418;
  if (!qword_1EEE40418)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AF3C8614()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  unsigned __int16 *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  void (*v16)(_QWORD *__return_ptr, _QWORD *);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
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
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  unsigned __int16 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  uint64_t result;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  const void *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  _QWORD v78[2];
  _QWORD v79[44];
  _OWORD v80[21];
  uint64_t v81;
  unint64_t v82;

  v1 = type metadata accessor for KdebugAdvice();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v66 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = v0;
  v4 = *v0;
  swift_bridgeObjectRetain_n();
  v5 = sub_1AF3C94B4(v4);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v80[0] = v5;
  sub_1AF3C944C((char **)v80);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(*(_QWORD *)&v80[0] + 16) < 3uLL)
  {
    __break(1u);
    goto LABEL_42;
  }
  v66 = 0;
  v67 = v1;
  v68 = v3;
  v69 = *(_QWORD *)&v80[0];
  v81 = 0;
  v82 = 0xE000000000000000;
  v71 = v75 + 2;
  v72 = *(_QWORD *)&v80[0] + 32;
  swift_retain();
  v6 = 0;
  v7 = (char *)MEMORY[0x1E0DEE9D8];
  v70 = 0x80000001AF3F2F20;
  do
  {
    v77 = v6;
    v8 = (unsigned __int16 *)(v72 + 16 * v6);
    v9 = *v8;
    v10 = *((_QWORD *)v8 + 1);
    v11 = sub_1AF38AACC(*v8);
    if (v11 != 150)
    {
      v12 = v11;
      if (qword_1EEE40410 != -1)
        swift_once();
      v13 = qword_1EEE41298;
      if (*(_QWORD *)(qword_1EEE41298 + 16))
      {
        v14 = sub_1AF3C9228(v12);
        if ((v15 & 1) != 0)
        {
          v16 = *(void (**)(_QWORD *__return_ptr, _QWORD *))(*(_QWORD *)(v13 + 56) + 16 * v14);
          LOBYTE(v80[0]) = v12;
          swift_retain();
          v17 = sub_1AF3E78F8();
          sub_1AF39F214(v17, v18, v10, v4, v75[1]);
          swift_bridgeObjectRelease();
          *(_QWORD *)&v80[0] = 8237;
          *((_QWORD *)&v80[0] + 1) = 0xE200000000000000;
          sub_1AF3E7970();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_1AF3E7970();
          swift_bridgeObjectRelease();
          sub_1AF3E7970();
          swift_bridgeObjectRelease();
          memcpy(v80, v71, 0x141uLL);
          memcpy(v79, v71, 0x141uLL);
          sub_1AF3B6C90((uint64_t)v80);
          v16(v78, v79);
          swift_release();
          sub_1AF3B6DB0((uint64_t)v80);
          v79[0] = v78[0];
          v79[1] = v78[1];
          swift_bridgeObjectRetain();
          sub_1AF3E7970();
          swift_bridgeObjectRelease();
LABEL_31:
          sub_1AF3E7970();
          goto LABEL_3;
        }
      }
    }
    memcpy(v80, v71, 0x141uLL);
    v19 = sub_1AF3A5794();
    v20 = v19;
    v76 = &v66;
    v21 = v19[2];
    if (v21)
    {
      v73 = v10;
      v74 = v7;
      v22 = *((_OWORD *)v19 + 13);
      v80[10] = *((_OWORD *)v19 + 12);
      v80[11] = v22;
      v80[12] = *((_OWORD *)v19 + 14);
      *(_QWORD *)&v80[13] = v19[30];
      v23 = *((_OWORD *)v19 + 9);
      v80[6] = *((_OWORD *)v19 + 8);
      v80[7] = v23;
      v24 = *((_OWORD *)v19 + 11);
      v80[8] = *((_OWORD *)v19 + 10);
      v80[9] = v24;
      v25 = *((_OWORD *)v19 + 5);
      v80[2] = *((_OWORD *)v19 + 4);
      v80[3] = v25;
      v26 = *((_OWORD *)v19 + 7);
      v80[4] = *((_OWORD *)v19 + 6);
      v80[5] = v26;
      v27 = *((_OWORD *)v19 + 3);
      v80[0] = *((_OWORD *)v19 + 2);
      v80[1] = v27;
      v28 = v21 - 1;
      v29 = 31;
      v30 = (char *)MEMORY[0x1E0DEE9D8];
      while (1)
      {
        v31 = v80[0];
        v32 = *((_QWORD *)&v80[12] + 1);
        v33 = *(_QWORD *)&v80[13];
        sub_1AF3C9598((uint64_t)v80);
        sub_1AF38E3A8(v9 | 0x10000, v32, v33);
        if ((v34 & 1) != 0)
        {
          swift_bridgeObjectRetain();
          sub_1AF3BA530((uint64_t)v80);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v30 = sub_1AF3413B8(0, *((_QWORD *)v30 + 2) + 1, 1, v30);
          v36 = *((_QWORD *)v30 + 2);
          v35 = *((_QWORD *)v30 + 3);
          if (v36 >= v35 >> 1)
            v30 = sub_1AF3413B8((char *)(v35 > 1), v36 + 1, 1, v30);
          *((_QWORD *)v30 + 2) = v36 + 1;
          *(_OWORD *)&v30[16 * v36 + 32] = v31;
          if (!v28)
          {
LABEL_21:
            swift_bridgeObjectRelease();
            v10 = v73;
            v7 = v74;
            goto LABEL_23;
          }
        }
        else
        {
          sub_1AF3BA530((uint64_t)v80);
          if (!v28)
            goto LABEL_21;
        }
        v37 = *(_OWORD *)&v20[v29 + 2];
        v80[0] = *(_OWORD *)&v20[v29];
        v80[1] = v37;
        v38 = *(_OWORD *)&v20[v29 + 4];
        v39 = *(_OWORD *)&v20[v29 + 6];
        v40 = *(_OWORD *)&v20[v29 + 10];
        v80[4] = *(_OWORD *)&v20[v29 + 8];
        v80[5] = v40;
        v80[2] = v38;
        v80[3] = v39;
        v41 = *(_OWORD *)&v20[v29 + 12];
        v42 = *(_OWORD *)&v20[v29 + 14];
        v43 = *(_OWORD *)&v20[v29 + 18];
        v80[8] = *(_OWORD *)&v20[v29 + 16];
        v80[9] = v43;
        v80[6] = v41;
        v80[7] = v42;
        v44 = *(_OWORD *)&v20[v29 + 20];
        v45 = *(_OWORD *)&v20[v29 + 22];
        v46 = *(_OWORD *)&v20[v29 + 24];
        *(_QWORD *)&v80[13] = v20[v29 + 26];
        v80[11] = v45;
        v80[12] = v46;
        v80[10] = v44;
        v29 += 27;
        --v28;
      }
    }
    swift_bridgeObjectRelease();
    v30 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_23:
    if (!*((_QWORD *)v30 + 2))
    {
      v47 = v10;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_1AF3C9354(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
      v49 = *((_QWORD *)v7 + 2);
      v48 = *((_QWORD *)v7 + 3);
      if (v49 >= v48 >> 1)
        v7 = sub_1AF3C9354((char *)(v48 > 1), v49 + 1, 1, v7);
      *((_QWORD *)v7 + 2) = v49 + 1;
      v50 = &v7[16 * v49];
      *((_WORD *)v50 + 16) = v9;
      v10 = v47;
      *((_QWORD *)v50 + 5) = v47;
    }
    v51 = nullsub_1(v9);
    v52 = sub_1AF38CA8C(v51);
    *(_QWORD *)&v80[0] = 8237;
    *((_QWORD *)&v80[0] + 1) = 0xE200000000000000;
    v4 = *v75;
    sub_1AF39F214(v52, v53, v10, *v75, v75[1]);
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)v30 + 2))
    {
      *(_QWORD *)&v80[0] = 0;
      *((_QWORD *)&v80[0] + 1) = 0xE000000000000000;
      sub_1AF3E7DE4();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v80[0] = 0xD000000000000017;
      *((_QWORD *)&v80[0] + 1) = v70;
      v79[0] = v30;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
      sub_1AF390B14();
      sub_1AF3E7898();
      swift_bridgeObjectRelease();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
LABEL_3:
    swift_bridgeObjectRelease();
    v6 = v77 + 1;
  }
  while (v77 != 2);
  swift_release();
  if (*((_QWORD *)v7 + 2))
  {
    v54 = swift_bridgeObjectRetain();
    v55 = sub_1AF3C8FB4(v54);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v80[0] = 0;
    *((_QWORD *)&v80[0] + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v80[0] = 8237;
    *((_QWORD *)&v80[0] + 1) = 0xE200000000000000;
    v79[0] = v55;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
    sub_1AF390B14();
    sub_1AF3E7898();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    if ((sub_1AF3BCA7C() & 1) != 0)
    {
      v56 = swift_bridgeObjectRetain();
      v57 = sub_1AF3C908C(v56);
      swift_bridgeObjectRelease();
      *(_QWORD *)&v80[0] = 0;
      *((_QWORD *)&v80[0] + 1) = 0xE000000000000000;
      sub_1AF3E7DE4();
      sub_1AF3E7970();
      v79[0] = v57;
      sub_1AF3E7898();
      swift_bridgeObjectRelease();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      sub_1AF3E7970();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
    }
  }
  v58 = (uint64_t)v75;
  v59 = (char *)v75 + *(int *)(v67 + 24);
  v60 = &v59[*(int *)(type metadata accessor for RecordingOptions.Options(0) + 76)];
  v61 = *(_QWORD *)v60;
  LOBYTE(v59) = v60[8];
  v62 = (uint64_t)v68;
  sub_1AF3C79F4(v58, (uint64_t)v68, (uint64_t (*)(_QWORD))type metadata accessor for KdebugAdvice);
  if ((v59 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_39:
    sub_1AF3C9654(v62);
    *(_QWORD *)&v80[0] = 0;
    *((_QWORD *)&v80[0] + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    sub_1AF3E7970();
    if (!__OFADD__(v61, v61 / 4))
    {
      v79[0] = v61 + v61 / 4;
      sub_1AF3E8018();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      sub_1AF3E7970();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      swift_release();
      return v81;
    }
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if ((*(_BYTE *)(v62 + 144) & 1) == 0)
  {
    v63 = *(_QWORD *)(v62 + 136);
    v64 = *(double *)(v62 + 128);
    swift_bridgeObjectRelease();
    v61 = sub_1AF3A12F0(v63, v64);
    goto LABEL_39;
  }
LABEL_43:
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1AF3C8FB4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  unsigned __int16 *v4;
  unsigned int v5;
  unsigned __int16 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v14 = MEMORY[0x1E0DEE9D8];
    sub_1AF38FDBC(0, v1, 0);
    v2 = v14;
    v4 = (unsigned __int16 *)(a1 + 32);
    do
    {
      v5 = *v4;
      v4 += 8;
      v6 = nullsub_1(v5);
      v7 = sub_1AF38CA8C(v6);
      v9 = v8;
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_1AF38FDBC((char *)(v10 > 1), v11 + 1, 1);
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1AF3C908C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  __int16 *v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    sub_1AF38FDBC(0, v1, 0);
    v2 = v12;
    v4 = (__int16 *)(a1 + 32);
    v5 = MEMORY[0x1E0DEE0D0];
    do
    {
      v6 = *v4;
      v4 += 8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B458);
      v7 = swift_allocObject();
      *(_OWORD *)(v7 + 16) = xmmword_1AF3EB020;
      *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEE068];
      *(_QWORD *)(v7 + 64) = v5;
      *(_WORD *)(v7 + 32) = v6;
      sub_1AF3E78D4();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v12 + 16);
      v8 = *(_QWORD *)(v12 + 24);
      if (v9 >= v8 >> 1)
        sub_1AF38FDBC((char *)(v8 > 1), v9 + 1, 1);
      *(_QWORD *)(v12 + 16) = v9 + 1;
      v10 = v12 + 16 * v9;
      *(_QWORD *)(v10 + 32) = 7876691;
      *(_QWORD *)(v10 + 40) = 0xE300000000000000;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1AF3C91E0@<X0>(void *__src@<X2>, uint64_t a2@<X0>, uint64_t a3@<X1>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v7;

  *a5 = a2;
  a5[1] = a3;
  memcpy(a5 + 2, __src, 0x141uLL);
  v7 = (uint64_t)a5 + *(int *)(type metadata accessor for KdebugAdvice() + 24);
  return sub_1AF3C9690(a4, v7);
}

unint64_t sub_1AF3C9228(uint64_t a1)
{
  uint64_t v2;

  sub_1AF3CB0F4();
  v2 = sub_1AF3E7880();
  return sub_1AF3C9290(a1, v2);
}

unint64_t sub_1AF3C9290(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    sub_1AF38D410();
    do
    {
      if ((sub_1AF3E78B0() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

char *sub_1AF3C9354(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD18);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1AF3C944C(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1AF3CBC84((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_1AF3CB138(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_1AF3C94B4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD20);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_1AF3CBAE4(&v8, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_1AF3BA9A0();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1AF3C9598(uint64_t a1)
{
  uint64_t v2;
  unint64_t v4;

  v2 = *(_QWORD *)(a1 + 200);
  v4 = *(_QWORD *)(a1 + 208);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF34738C(v2, v4);
  return a1;
}

uint64_t sub_1AF3C9654(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for KdebugAdvice();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AF3C9690(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF3C96D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4;
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
  int *v20;
  uint64_t v21;
  const void *v22;
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
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
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
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int (*v63)(const void *, uint64_t, uint64_t);
  void *__dst;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16) & ~(unint64_t)v4);
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    v7 = a2[7];
    *(_QWORD *)(a1 + 48) = a2[6];
    *(_QWORD *)(a1 + 56) = v7;
    v8 = a2[9];
    *(_QWORD *)(a1 + 64) = a2[8];
    *(_QWORD *)(a1 + 72) = v8;
    v9 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v9;
    v10 = a2[13];
    *(_QWORD *)(a1 + 96) = a2[12];
    *(_QWORD *)(a1 + 104) = v10;
    v11 = a2[15];
    *(_QWORD *)(a1 + 112) = a2[14];
    *(_QWORD *)(a1 + 120) = v11;
    *(_OWORD *)(a1 + 128) = *((_OWORD *)a2 + 8);
    *(_BYTE *)(a1 + 144) = *((_BYTE *)a2 + 144);
    v12 = a2[20];
    *(_QWORD *)(a1 + 152) = a2[19];
    *(_QWORD *)(a1 + 160) = v12;
    v13 = a2[22];
    *(_QWORD *)(a1 + 168) = a2[21];
    *(_QWORD *)(a1 + 176) = v13;
    *(_BYTE *)(a1 + 184) = *((_BYTE *)a2 + 184);
    v14 = a2[25];
    *(_QWORD *)(a1 + 192) = a2[24];
    *(_QWORD *)(a1 + 200) = v14;
    *(_OWORD *)(a1 + 208) = *((_OWORD *)a2 + 13);
    *(_QWORD *)(a1 + 224) = a2[28];
    *(_BYTE *)(a1 + 248) = *((_BYTE *)a2 + 248);
    *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 29);
    *(_BYTE *)(a1 + 272) = *((_BYTE *)a2 + 272);
    *(_OWORD *)(a1 + 256) = *((_OWORD *)a2 + 16);
    v15 = a2[36];
    *(_QWORD *)(a1 + 280) = a2[35];
    v60 = a2[37];
    v61 = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AF34738C(v61, v60);
    *(_QWORD *)(a1 + 288) = v61;
    *(_QWORD *)(a1 + 296) = v60;
    v16 = a2[39];
    *(_QWORD *)(a1 + 304) = a2[38];
    *(_QWORD *)(a1 + 312) = v16;
    *(_BYTE *)(a1 + 320) = *((_BYTE *)a2 + 320);
    *(_QWORD *)(a1 + 328) = a2[41];
    *(_BYTE *)(a1 + 336) = *((_BYTE *)a2 + 336);
    v17 = *(int *)(a3 + 24);
    v18 = a1 + v17;
    v19 = (uint64_t)a2 + v17;
    *(_QWORD *)(a1 + v17) = *(uint64_t *)((char *)a2 + v17);
    v20 = (int *)type metadata accessor for RecordingOptions.Options(0);
    v21 = v20[5];
    __dst = (void *)(v18 + v21);
    v22 = (const void *)(v19 + v21);
    v23 = sub_1AF3E7694();
    v24 = *(_QWORD *)(v23 - 8);
    v63 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v24 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v63(v22, 1, v23))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
      memcpy(__dst, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v24 + 16))(__dst, v22, v23);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
    }
    *(_QWORD *)(v18 + v20[6]) = *(_QWORD *)(v19 + v20[6]);
    *(_QWORD *)(v18 + v20[7]) = *(_QWORD *)(v19 + v20[7]);
    *(_QWORD *)(v18 + v20[8]) = *(_QWORD *)(v19 + v20[8]);
    v26 = v20[9];
    v27 = v18 + v26;
    v28 = v19 + v26;
    *(_DWORD *)v27 = *(_DWORD *)v28;
    *(_BYTE *)(v27 + 4) = *(_BYTE *)(v28 + 4);
    v29 = v20[10];
    v30 = v18 + v29;
    v31 = v19 + v29;
    *(_QWORD *)v30 = *(_QWORD *)v31;
    *(_BYTE *)(v30 + 8) = *(_BYTE *)(v31 + 8);
    *(_QWORD *)(v18 + v20[11]) = *(_QWORD *)(v19 + v20[11]);
    *(_QWORD *)(v18 + v20[12]) = *(_QWORD *)(v19 + v20[12]);
    v32 = v20[13];
    v33 = v18 + v32;
    v34 = v19 + v32;
    *(_QWORD *)v33 = *(_QWORD *)v34;
    *(_BYTE *)(v33 + 8) = *(_BYTE *)(v34 + 8);
    *(_BYTE *)(v18 + v20[14]) = *(_BYTE *)(v19 + v20[14]);
    *(_BYTE *)(v18 + v20[15]) = *(_BYTE *)(v19 + v20[15]);
    *(_BYTE *)(v18 + v20[16]) = *(_BYTE *)(v19 + v20[16]);
    v35 = v20[17];
    v36 = (_QWORD *)(v18 + v35);
    v37 = (_QWORD *)(v19 + v35);
    v62 = v37[1];
    *v36 = *v37;
    v36[1] = v62;
    v38 = v20[18];
    v39 = (_QWORD *)(v18 + v38);
    v40 = (_QWORD *)(v19 + v38);
    v41 = v40[1];
    *v39 = *v40;
    v39[1] = v41;
    v42 = v20[19];
    v43 = v18 + v42;
    v44 = v19 + v42;
    *(_QWORD *)v43 = *(_QWORD *)v44;
    *(_BYTE *)(v43 + 8) = *(_BYTE *)(v44 + 8);
    *(_BYTE *)(v18 + v20[20]) = *(_BYTE *)(v19 + v20[20]);
    v45 = v20[21];
    v46 = v18 + v45;
    v47 = v19 + v45;
    *(_DWORD *)v46 = *(_DWORD *)v47;
    *(_BYTE *)(v46 + 4) = *(_BYTE *)(v47 + 4);
    *(_QWORD *)(v18 + v20[22]) = *(_QWORD *)(v19 + v20[22]);
    *(_QWORD *)(v18 + v20[23]) = *(_QWORD *)(v19 + v20[23]);
    *(_QWORD *)(v18 + v20[24]) = *(_QWORD *)(v19 + v20[24]);
    *(_BYTE *)(v18 + v20[25]) = *(_BYTE *)(v19 + v20[25]);
    *(_BYTE *)(v18 + v20[26]) = *(_BYTE *)(v19 + v20[26]);
    *(_QWORD *)(v18 + v20[27]) = *(_QWORD *)(v19 + v20[27]);
    v48 = v20[28];
    v49 = v18 + v48;
    v50 = v19 + v48;
    *(_QWORD *)v49 = *(_QWORD *)v50;
    *(_BYTE *)(v49 + 8) = *(_BYTE *)(v50 + 8);
    v51 = v20[29];
    v52 = (_QWORD *)(v18 + v51);
    v53 = (_QWORD *)(v19 + v51);
    v54 = v53[1];
    *v52 = *v53;
    v52[1] = v54;
    v55 = v20[30];
    v56 = (_QWORD *)(v18 + v55);
    v57 = (_QWORD *)(v19 + v55);
    v58 = v57[1];
    *v56 = *v57;
    v56[1] = v58;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1AF3C9BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF33C310(*(_QWORD *)(a1 + 288), *(_QWORD *)(a1 + 296));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = v4 + *(int *)(type metadata accessor for RecordingOptions.Options(0) + 20);
  v6 = sub_1AF3E7694();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF3C9D60(uint64_t a1, uint64_t a2, uint64_t a3)
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
  int *v18;
  uint64_t v19;
  const void *v20;
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
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
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
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int (*v61)(const void *, uint64_t, uint64_t);
  void *__dst;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  v10 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v10;
  v11 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v11;
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  v12 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v12;
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_BYTE *)(a1 + 272) = *(_BYTE *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  v13 = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  v58 = *(_QWORD *)(a2 + 296);
  v59 = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF34738C(v59, v58);
  *(_QWORD *)(a1 + 288) = v59;
  *(_QWORD *)(a1 + 296) = v58;
  v14 = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 312) = v14;
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_BYTE *)(a1 + 336) = *(_BYTE *)(a2 + 336);
  v15 = *(int *)(a3 + 24);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  v18 = (int *)type metadata accessor for RecordingOptions.Options(0);
  v19 = v18[5];
  __dst = (void *)(v16 + v19);
  v20 = (const void *)(v17 + v19);
  v21 = sub_1AF3E7694();
  v22 = *(_QWORD *)(v21 - 8);
  v61 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v61(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(__dst, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(__dst, v20, v21);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
  }
  *(_QWORD *)(v16 + v18[6]) = *(_QWORD *)(v17 + v18[6]);
  *(_QWORD *)(v16 + v18[7]) = *(_QWORD *)(v17 + v18[7]);
  *(_QWORD *)(v16 + v18[8]) = *(_QWORD *)(v17 + v18[8]);
  v24 = v18[9];
  v25 = v16 + v24;
  v26 = v17 + v24;
  *(_DWORD *)v25 = *(_DWORD *)v26;
  *(_BYTE *)(v25 + 4) = *(_BYTE *)(v26 + 4);
  v27 = v18[10];
  v28 = v16 + v27;
  v29 = v17 + v27;
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *(_BYTE *)(v28 + 8) = *(_BYTE *)(v29 + 8);
  *(_QWORD *)(v16 + v18[11]) = *(_QWORD *)(v17 + v18[11]);
  *(_QWORD *)(v16 + v18[12]) = *(_QWORD *)(v17 + v18[12]);
  v30 = v18[13];
  v31 = v16 + v30;
  v32 = v17 + v30;
  *(_QWORD *)v31 = *(_QWORD *)v32;
  *(_BYTE *)(v31 + 8) = *(_BYTE *)(v32 + 8);
  *(_BYTE *)(v16 + v18[14]) = *(_BYTE *)(v17 + v18[14]);
  *(_BYTE *)(v16 + v18[15]) = *(_BYTE *)(v17 + v18[15]);
  *(_BYTE *)(v16 + v18[16]) = *(_BYTE *)(v17 + v18[16]);
  v33 = v18[17];
  v34 = (_QWORD *)(v16 + v33);
  v35 = (_QWORD *)(v17 + v33);
  v60 = v35[1];
  *v34 = *v35;
  v34[1] = v60;
  v36 = v18[18];
  v37 = (_QWORD *)(v16 + v36);
  v38 = (_QWORD *)(v17 + v36);
  v39 = v38[1];
  *v37 = *v38;
  v37[1] = v39;
  v40 = v18[19];
  v41 = v16 + v40;
  v42 = v17 + v40;
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *(_BYTE *)(v41 + 8) = *(_BYTE *)(v42 + 8);
  *(_BYTE *)(v16 + v18[20]) = *(_BYTE *)(v17 + v18[20]);
  v43 = v18[21];
  v44 = v16 + v43;
  v45 = v17 + v43;
  *(_DWORD *)v44 = *(_DWORD *)v45;
  *(_BYTE *)(v44 + 4) = *(_BYTE *)(v45 + 4);
  *(_QWORD *)(v16 + v18[22]) = *(_QWORD *)(v17 + v18[22]);
  *(_QWORD *)(v16 + v18[23]) = *(_QWORD *)(v17 + v18[23]);
  *(_QWORD *)(v16 + v18[24]) = *(_QWORD *)(v17 + v18[24]);
  *(_BYTE *)(v16 + v18[25]) = *(_BYTE *)(v17 + v18[25]);
  *(_BYTE *)(v16 + v18[26]) = *(_BYTE *)(v17 + v18[26]);
  *(_QWORD *)(v16 + v18[27]) = *(_QWORD *)(v17 + v18[27]);
  v46 = v18[28];
  v47 = v16 + v46;
  v48 = v17 + v46;
  *(_QWORD *)v47 = *(_QWORD *)v48;
  *(_BYTE *)(v47 + 8) = *(_BYTE *)(v48 + 8);
  v49 = v18[29];
  v50 = (_QWORD *)(v16 + v49);
  v51 = (_QWORD *)(v17 + v49);
  v52 = v51[1];
  *v50 = *v51;
  v50[1] = v52;
  v53 = v18[30];
  v54 = (_QWORD *)(v16 + v53);
  v55 = (_QWORD *)(v17 + v53);
  v56 = v55[1];
  *v54 = *v55;
  v54[1] = v56;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1AF3CA20C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = v6;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_OWORD *)(a2 + 232);
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  *(_OWORD *)(a1 + 232) = v7;
  v8 = *(_BYTE *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_BYTE *)(a1 + 272) = v8;
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 288);
  v10 = *(_QWORD *)(a2 + 296);
  sub_1AF34738C(v9, v10);
  v11 = *(_QWORD *)(a1 + 288);
  v12 = *(_QWORD *)(a1 + 296);
  *(_QWORD *)(a1 + 288) = v9;
  *(_QWORD *)(a1 + 296) = v10;
  sub_1AF33C310(v11, v12);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 336) = *(_BYTE *)(a2 + 336);
  v13 = *(int *)(a3 + 24);
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v16 = (int *)type metadata accessor for RecordingOptions.Options(0);
  v17 = v16[5];
  v18 = (void *)(v14 + v17);
  v19 = (void *)(v15 + v17);
  v20 = sub_1AF3E7694();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (!v23)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v21 + 24))(v18, v19, v20);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v21 + 8))(v18, v20);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v21 + 16))(v18, v19, v20);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
LABEL_7:
  *(_QWORD *)(v14 + v16[6]) = *(_QWORD *)(v15 + v16[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + v16[7]) = *(_QWORD *)(v15 + v16[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + v16[8]) = *(_QWORD *)(v15 + v16[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26 = v16[9];
  v27 = v14 + v26;
  v28 = (int *)(v15 + v26);
  v29 = *v28;
  *(_BYTE *)(v27 + 4) = *((_BYTE *)v28 + 4);
  *(_DWORD *)v27 = v29;
  v30 = v16[10];
  v31 = v14 + v30;
  v32 = (uint64_t *)(v15 + v30);
  v33 = *v32;
  *(_BYTE *)(v31 + 8) = *((_BYTE *)v32 + 8);
  *(_QWORD *)v31 = v33;
  *(_QWORD *)(v14 + v16[11]) = *(_QWORD *)(v15 + v16[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + v16[12]) = *(_QWORD *)(v15 + v16[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = v16[13];
  v35 = v14 + v34;
  v36 = (uint64_t *)(v15 + v34);
  v37 = *v36;
  *(_BYTE *)(v35 + 8) = *((_BYTE *)v36 + 8);
  *(_QWORD *)v35 = v37;
  *(_BYTE *)(v14 + v16[14]) = *(_BYTE *)(v15 + v16[14]);
  *(_BYTE *)(v14 + v16[15]) = *(_BYTE *)(v15 + v16[15]);
  *(_BYTE *)(v14 + v16[16]) = *(_BYTE *)(v15 + v16[16]);
  v38 = v16[17];
  v39 = (_QWORD *)(v14 + v38);
  v40 = (_QWORD *)(v15 + v38);
  *v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41 = v16[18];
  v42 = (_QWORD *)(v14 + v41);
  v43 = (_QWORD *)(v15 + v41);
  *v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v44 = v16[19];
  v45 = v14 + v44;
  v46 = (uint64_t *)(v15 + v44);
  v47 = *v46;
  *(_BYTE *)(v45 + 8) = *((_BYTE *)v46 + 8);
  *(_QWORD *)v45 = v47;
  *(_BYTE *)(v14 + v16[20]) = *(_BYTE *)(v15 + v16[20]);
  v48 = v16[21];
  v49 = v14 + v48;
  v50 = v15 + v48;
  LODWORD(v47) = *(_DWORD *)v50;
  *(_BYTE *)(v49 + 4) = *(_BYTE *)(v50 + 4);
  *(_DWORD *)v49 = v47;
  *(_QWORD *)(v14 + v16[22]) = *(_QWORD *)(v15 + v16[22]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + v16[23]) = *(_QWORD *)(v15 + v16[23]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + v16[24]) = *(_QWORD *)(v15 + v16[24]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(v14 + v16[25]) = *(_BYTE *)(v15 + v16[25]);
  *(_BYTE *)(v14 + v16[26]) = *(_BYTE *)(v15 + v16[26]);
  *(_QWORD *)(v14 + v16[27]) = *(_QWORD *)(v15 + v16[27]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v51 = v16[28];
  v52 = v14 + v51;
  v53 = (uint64_t *)(v15 + v51);
  v54 = *v53;
  *(_BYTE *)(v52 + 8) = *((_BYTE *)v53 + 8);
  *(_QWORD *)v52 = v54;
  v55 = v16[29];
  v56 = (_QWORD *)(v14 + v55);
  v57 = (_QWORD *)(v15 + v55);
  *v56 = *v57;
  v56[1] = v57[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v58 = v16[30];
  v59 = (_QWORD *)(v14 + v58);
  v60 = (_QWORD *)(v15 + v58);
  *v59 = *v60;
  v59[1] = v60[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1AF3CA82C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;

  *a1 = *a2;
  memcpy(a1 + 1, a2 + 1, 0x141uLL);
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  v9 = (int *)type metadata accessor for RecordingOptions.Options(0);
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_1AF3E7694();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  *(_QWORD *)&v7[v9[6]] = *(_QWORD *)&v8[v9[6]];
  *(_QWORD *)&v7[v9[7]] = *(_QWORD *)&v8[v9[7]];
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  v16 = v9[9];
  v17 = &v7[v16];
  v18 = &v8[v16];
  *(_DWORD *)v17 = *(_DWORD *)v18;
  v17[4] = v18[4];
  v19 = v9[10];
  v20 = &v7[v19];
  v21 = &v8[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  v20[8] = v21[8];
  *(_QWORD *)&v7[v9[11]] = *(_QWORD *)&v8[v9[11]];
  *(_QWORD *)&v7[v9[12]] = *(_QWORD *)&v8[v9[12]];
  v22 = v9[13];
  v23 = &v7[v22];
  v24 = &v8[v22];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v24[8];
  v7[v9[14]] = v8[v9[14]];
  v7[v9[15]] = v8[v9[15]];
  v7[v9[16]] = v8[v9[16]];
  *(_OWORD *)&v7[v9[17]] = *(_OWORD *)&v8[v9[17]];
  *(_OWORD *)&v7[v9[18]] = *(_OWORD *)&v8[v9[18]];
  v25 = v9[19];
  v26 = &v7[v25];
  v27 = &v8[v25];
  *(_QWORD *)v26 = *(_QWORD *)v27;
  v26[8] = v27[8];
  v7[v9[20]] = v8[v9[20]];
  v28 = v9[21];
  v29 = &v7[v28];
  v30 = &v8[v28];
  *(_DWORD *)v29 = *(_DWORD *)v30;
  v29[4] = v30[4];
  *(_QWORD *)&v7[v9[22]] = *(_QWORD *)&v8[v9[22]];
  *(_QWORD *)&v7[v9[23]] = *(_QWORD *)&v8[v9[23]];
  *(_QWORD *)&v7[v9[24]] = *(_QWORD *)&v8[v9[24]];
  v7[v9[25]] = v8[v9[25]];
  v7[v9[26]] = v8[v9[26]];
  *(_QWORD *)&v7[v9[27]] = *(_QWORD *)&v8[v9[27]];
  v31 = v9[28];
  v32 = &v7[v31];
  v33 = &v8[v31];
  v32[8] = v33[8];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *(_OWORD *)&v7[v9[29]] = *(_OWORD *)&v8[v9[29]];
  *(_OWORD *)&v7[v9[30]] = *(_OWORD *)&v8[v9[30]];
  return a1;
}

uint64_t sub_1AF3CAAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(void *, uint64_t, uint64_t);
  int v24;
  int v25;
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
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t *v43;
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
  _QWORD *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  v10 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 176) = v11;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_BYTE *)(a1 + 248) = *(_BYTE *)(a2 + 248);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_BYTE *)(a1 + 272) = *(_BYTE *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(a1 + 288);
  v13 = *(_QWORD *)(a1 + 296);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  sub_1AF33C310(v12, v13);
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 320) = *(_BYTE *)(a2 + 320);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 336) = *(_BYTE *)(a2 + 336);
  v14 = *(int *)(a3 + 24);
  v15 = a1 + v14;
  v16 = a2 + v14;
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  v17 = (int *)type metadata accessor for RecordingOptions.Options(0);
  v18 = v17[5];
  v19 = (void *)(v15 + v18);
  v20 = (void *)(v16 + v18);
  v21 = sub_1AF3E7694();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (!v24)
  {
    if (!v25)
    {
      (*(void (**)(void *, void *, uint64_t))(v22 + 40))(v19, v20, v21);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v25)
  {
LABEL_6:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v22 + 32))(v19, v20, v21);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
LABEL_7:
  *(_QWORD *)(v15 + v17[6]) = *(_QWORD *)(v16 + v17[6]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + v17[7]) = *(_QWORD *)(v16 + v17[7]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + v17[8]) = *(_QWORD *)(v16 + v17[8]);
  swift_bridgeObjectRelease();
  v27 = v17[9];
  v28 = v15 + v27;
  v29 = v16 + v27;
  *(_DWORD *)v28 = *(_DWORD *)v29;
  *(_BYTE *)(v28 + 4) = *(_BYTE *)(v29 + 4);
  v30 = v17[10];
  v31 = v15 + v30;
  v32 = v16 + v30;
  *(_BYTE *)(v31 + 8) = *(_BYTE *)(v32 + 8);
  *(_QWORD *)v31 = *(_QWORD *)v32;
  *(_QWORD *)(v15 + v17[11]) = *(_QWORD *)(v16 + v17[11]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + v17[12]) = *(_QWORD *)(v16 + v17[12]);
  swift_bridgeObjectRelease();
  v33 = v17[13];
  v34 = v15 + v33;
  v35 = v16 + v33;
  *(_QWORD *)v34 = *(_QWORD *)v35;
  *(_BYTE *)(v34 + 8) = *(_BYTE *)(v35 + 8);
  *(_BYTE *)(v15 + v17[14]) = *(_BYTE *)(v16 + v17[14]);
  *(_BYTE *)(v15 + v17[15]) = *(_BYTE *)(v16 + v17[15]);
  *(_BYTE *)(v15 + v17[16]) = *(_BYTE *)(v16 + v17[16]);
  v36 = v17[17];
  v37 = (_QWORD *)(v15 + v36);
  v38 = (uint64_t *)(v16 + v36);
  v40 = *v38;
  v39 = v38[1];
  *v37 = v40;
  v37[1] = v39;
  swift_bridgeObjectRelease();
  v41 = v17[18];
  v42 = (_QWORD *)(v15 + v41);
  v43 = (uint64_t *)(v16 + v41);
  v45 = *v43;
  v44 = v43[1];
  *v42 = v45;
  v42[1] = v44;
  swift_bridgeObjectRelease();
  v46 = v17[19];
  v47 = v15 + v46;
  v48 = v16 + v46;
  *(_QWORD *)v47 = *(_QWORD *)v48;
  *(_BYTE *)(v47 + 8) = *(_BYTE *)(v48 + 8);
  *(_BYTE *)(v15 + v17[20]) = *(_BYTE *)(v16 + v17[20]);
  v49 = v17[21];
  v50 = v15 + v49;
  v51 = v16 + v49;
  *(_DWORD *)v50 = *(_DWORD *)v51;
  *(_BYTE *)(v50 + 4) = *(_BYTE *)(v51 + 4);
  *(_QWORD *)(v15 + v17[22]) = *(_QWORD *)(v16 + v17[22]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + v17[23]) = *(_QWORD *)(v16 + v17[23]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + v17[24]) = *(_QWORD *)(v16 + v17[24]);
  swift_bridgeObjectRelease();
  *(_BYTE *)(v15 + v17[25]) = *(_BYTE *)(v16 + v17[25]);
  *(_BYTE *)(v15 + v17[26]) = *(_BYTE *)(v16 + v17[26]);
  *(_QWORD *)(v15 + v17[27]) = *(_QWORD *)(v16 + v17[27]);
  swift_bridgeObjectRelease();
  v52 = v17[28];
  v53 = v15 + v52;
  v54 = v16 + v52;
  *(_QWORD *)v53 = *(_QWORD *)v54;
  *(_BYTE *)(v53 + 8) = *(_BYTE *)(v54 + 8);
  v55 = v17[29];
  v56 = (_QWORD *)(v15 + v55);
  v57 = (uint64_t *)(v16 + v55);
  v59 = *v57;
  v58 = v57[1];
  *v56 = v59;
  v56[1] = v58;
  swift_bridgeObjectRelease();
  v60 = v17[30];
  v61 = (_QWORD *)(v15 + v60);
  v62 = (uint64_t *)(v16 + v60);
  v64 = *v62;
  v63 = v62[1];
  *v61 = v64;
  v61[1] = v63;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AF3CAF70()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF3CAF7C(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for RecordingOptions.Options(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 24)], a2, v8);
  }
}

uint64_t sub_1AF3CAFF8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1AF3CB004(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for RecordingOptions.Options(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 24)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_1AF3CB078()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for RecordingOptions.Options(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_1AF3CB0F4()
{
  unint64_t result;

  result = qword_1EEE3BD10;
  if (!qword_1EEE3BD10)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EAF1C, &type metadata for KnownKdebugSubclass);
    atomic_store(result, (unint64_t *)&qword_1EEE3BD10);
  }
  return result;
}

uint64_t sub_1AF3CB138(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  _WORD *v28;
  uint64_t v29;
  uint64_t v30;
  _WORD *v31;
  __int16 v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  char v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t i;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  unint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;

  v3 = a1[1];
  result = sub_1AF3E8000();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v83 = 0;
      v84 = *a1;
      for (i = 1; i != v3; ++i)
      {
        v86 = *(_QWORD *)(v84 + 16 * i + 8);
        v87 = v83;
        do
        {
          v88 = v84 + v87;
          if (*(_QWORD *)(v84 + v87 + 8) >= v86)
            break;
          if (!v84)
            goto LABEL_141;
          v89 = *(_WORD *)(v88 + 16);
          *(_OWORD *)(v88 + 16) = *(_OWORD *)v88;
          *(_WORD *)v88 = v89;
          *(_QWORD *)(v88 + 8) = v86;
          v87 -= 16;
        }
        while (v87 != -16);
        v83 += 16;
      }
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_136;
    v6 = result;
    v97 = a1;
    if (v3 > 1)
    {
      v7 = v5 >> 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD28);
      result = sub_1AF3E7AE4();
      *(_QWORD *)(result + 16) = v7;
      v99 = result;
      v103 = (char *)(result + 32);
LABEL_13:
      v9 = 0;
      v10 = *a1;
      v98 = *a1 + 40;
      v11 = MEMORY[0x1E0DEE9D8];
      v100 = v6;
      v101 = v3;
      v102 = v10;
      while (1)
      {
        v13 = v9++;
        if (v9 < v3)
        {
          v14 = *(_QWORD *)(v10 + 16 * v9 + 8);
          v15 = *(_QWORD *)(v10 + 16 * v13 + 8);
          v9 = v13 + 2;
          if (v13 + 2 < v3)
          {
            v16 = (uint64_t *)(v98 + 16 * v13);
            v17 = v14;
            while (1)
            {
              v19 = *v16;
              v16 += 2;
              v18 = v19;
              if (v15 < v14 == v17 >= v19)
                break;
              ++v9;
              v17 = v18;
              if (v3 == v9)
              {
                v9 = v3;
                break;
              }
            }
          }
          if (v15 < v14)
          {
            if (v9 < v13)
              goto LABEL_138;
            if (v13 < v9)
            {
              v20 = 16 * v9;
              v21 = 16 * v13;
              v22 = v9;
              v23 = v13;
              do
              {
                if (v23 != --v22)
                {
                  if (!v10)
                    goto LABEL_144;
                  v24 = v10 + v20;
                  v25 = *(_WORD *)(v10 + v21);
                  v26 = *(_QWORD *)(v10 + v21 + 8);
                  *(_OWORD *)(v10 + v21) = *(_OWORD *)(v10 + v20 - 16);
                  *(_WORD *)(v24 - 16) = v25;
                  *(_QWORD *)(v24 - 8) = v26;
                }
                ++v23;
                v20 -= 16;
                v21 += 16;
              }
              while (v23 < v22);
            }
          }
        }
        if (v9 < v3)
        {
          if (__OFSUB__(v9, v13))
            goto LABEL_135;
          if (v9 - v13 < v6)
          {
            v27 = v13 + v6;
            if (__OFADD__(v13, v6))
              goto LABEL_139;
            if (v27 >= v3)
              v27 = v3;
            if (v27 < v13)
            {
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
              return result;
            }
            if (v9 != v27)
            {
              v28 = (_WORD *)(v10 + 16 * v9);
              do
              {
                v29 = *(_QWORD *)(v10 + 16 * v9 + 8);
                v30 = v13;
                v31 = v28;
                do
                {
                  if (*((_QWORD *)v31 - 1) >= v29)
                    break;
                  if (!v10)
                    goto LABEL_142;
                  v32 = *v31;
                  *(_OWORD *)v31 = *((_OWORD *)v31 - 1);
                  *((_QWORD *)v31 - 1) = v29;
                  *(v31 - 8) = v32;
                  v31 -= 8;
                  ++v30;
                }
                while (v9 != v30);
                ++v9;
                v28 += 8;
              }
              while (v9 != v27);
              v9 = v27;
            }
          }
        }
        if (v9 < v13)
          goto LABEL_130;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_1AF397654(0, *(_QWORD *)(v11 + 16) + 1, 1, (char *)v11);
          v11 = result;
        }
        v34 = *(_QWORD *)(v11 + 16);
        v33 = *(_QWORD *)(v11 + 24);
        v12 = v34 + 1;
        v10 = v102;
        if (v34 >= v33 >> 1)
        {
          result = (uint64_t)sub_1AF397654((char *)(v33 > 1), v34 + 1, 1, (char *)v11);
          v10 = v102;
          v11 = result;
        }
        *(_QWORD *)(v11 + 16) = v12;
        v35 = v11 + 32;
        v36 = (uint64_t *)(v11 + 32 + 16 * v34);
        *v36 = v13;
        v36[1] = v9;
        if (v34)
        {
          while (1)
          {
            v37 = v12 - 1;
            if (v12 >= 4)
            {
              v42 = v35 + 16 * v12;
              v43 = *(_QWORD *)(v42 - 64);
              v44 = *(_QWORD *)(v42 - 56);
              v48 = __OFSUB__(v44, v43);
              v45 = v44 - v43;
              if (v48)
                goto LABEL_119;
              v47 = *(_QWORD *)(v42 - 48);
              v46 = *(_QWORD *)(v42 - 40);
              v48 = __OFSUB__(v46, v47);
              v40 = v46 - v47;
              v41 = v48;
              if (v48)
                goto LABEL_120;
              v49 = v12 - 2;
              v50 = (uint64_t *)(v35 + 16 * (v12 - 2));
              v52 = *v50;
              v51 = v50[1];
              v48 = __OFSUB__(v51, v52);
              v53 = v51 - v52;
              if (v48)
                goto LABEL_121;
              v48 = __OFADD__(v40, v53);
              v54 = v40 + v53;
              if (v48)
                goto LABEL_123;
              if (v54 >= v45)
              {
                v72 = (uint64_t *)(v35 + 16 * v37);
                v74 = *v72;
                v73 = v72[1];
                v48 = __OFSUB__(v73, v74);
                v75 = v73 - v74;
                if (v48)
                  goto LABEL_129;
                v65 = v40 < v75;
                goto LABEL_83;
              }
            }
            else
            {
              if (v12 != 3)
              {
                v66 = *(_QWORD *)(v11 + 32);
                v67 = *(_QWORD *)(v11 + 40);
                v48 = __OFSUB__(v67, v66);
                v59 = v67 - v66;
                v60 = v48;
                goto LABEL_77;
              }
              v39 = *(_QWORD *)(v11 + 32);
              v38 = *(_QWORD *)(v11 + 40);
              v48 = __OFSUB__(v38, v39);
              v40 = v38 - v39;
              v41 = v48;
            }
            if ((v41 & 1) != 0)
              goto LABEL_122;
            v49 = v12 - 2;
            v55 = (uint64_t *)(v35 + 16 * (v12 - 2));
            v57 = *v55;
            v56 = v55[1];
            v58 = __OFSUB__(v56, v57);
            v59 = v56 - v57;
            v60 = v58;
            if (v58)
              goto LABEL_124;
            v61 = (uint64_t *)(v35 + 16 * v37);
            v63 = *v61;
            v62 = v61[1];
            v48 = __OFSUB__(v62, v63);
            v64 = v62 - v63;
            if (v48)
              goto LABEL_126;
            if (__OFADD__(v59, v64))
              goto LABEL_128;
            if (v59 + v64 >= v40)
            {
              v65 = v40 < v64;
LABEL_83:
              if (v65)
                v37 = v49;
              goto LABEL_85;
            }
LABEL_77:
            if ((v60 & 1) != 0)
              goto LABEL_125;
            v68 = (uint64_t *)(v35 + 16 * v37);
            v70 = *v68;
            v69 = v68[1];
            v48 = __OFSUB__(v69, v70);
            v71 = v69 - v70;
            if (v48)
              goto LABEL_127;
            if (v71 < v59)
              goto LABEL_15;
LABEL_85:
            v76 = v37 - 1;
            if (v37 - 1 >= v12)
            {
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
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
              goto LABEL_140;
            }
            if (!v10)
              goto LABEL_143;
            v77 = v11;
            v78 = (uint64_t *)(v35 + 16 * v76);
            v79 = *v78;
            v80 = (_QWORD *)(v35 + 16 * v37);
            v81 = v80[1];
            result = sub_1AF3CB7C8((char *)(v10 + 16 * *v78), (char *)(v10 + 16 * *v80), v10 + 16 * v81, v103);
            if (v1)
              goto LABEL_93;
            if (v81 < v79)
              goto LABEL_116;
            if (v37 > *(_QWORD *)(v77 + 16))
              goto LABEL_117;
            *v78 = v79;
            *(_QWORD *)(v35 + 16 * v76 + 8) = v81;
            v82 = *(_QWORD *)(v77 + 16);
            if (v37 >= v82)
              goto LABEL_118;
            v11 = v77;
            v12 = v82 - 1;
            result = (uint64_t)memmove((void *)(v35 + 16 * v37), v80 + 2, 16 * (v82 - 1 - v37));
            *(_QWORD *)(v77 + 16) = v82 - 1;
            v10 = v102;
            if (v82 <= 2)
              goto LABEL_15;
          }
        }
        v12 = 1;
LABEL_15:
        v6 = v100;
        v3 = v101;
        if (v9 >= v101)
        {
          v8 = v99;
          goto LABEL_102;
        }
      }
    }
    v8 = MEMORY[0x1E0DEE9D8];
    v103 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
    if (v3 == 1)
    {
      v99 = MEMORY[0x1E0DEE9D8];
      goto LABEL_13;
    }
    v12 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
    v11 = MEMORY[0x1E0DEE9D8];
LABEL_102:
    result = v11;
    v99 = v8;
    if (v12 >= 2)
    {
      v90 = *v97;
      do
      {
        v91 = v12 - 2;
        if (v12 < 2)
          goto LABEL_131;
        if (!v90)
          goto LABEL_145;
        v92 = result;
        v93 = *(_QWORD *)(result + 32 + 16 * v91);
        v94 = *(_QWORD *)(result + 32 + 16 * (v12 - 1) + 8);
        result = sub_1AF3CB7C8((char *)(v90 + 16 * v93), (char *)(v90 + 16 * *(_QWORD *)(result + 32 + 16 * (v12 - 1))), v90 + 16 * v94, v103);
        if (v1)
          break;
        if (v94 < v93)
          goto LABEL_132;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_1AF3977F4(v92);
          v92 = result;
        }
        if (v91 >= *(_QWORD *)(v92 + 16))
          goto LABEL_133;
        v95 = (_QWORD *)(v92 + 32 + 16 * v91);
        *v95 = v93;
        v95[1] = v94;
        v96 = *(_QWORD *)(v92 + 16);
        if (v12 > v96)
          goto LABEL_134;
        memmove((void *)(v92 + 32 + 16 * (v12 - 1)), (const void *)(v92 + 32 + 16 * v12), 16 * (v96 - v12));
        result = v92;
        *(_QWORD *)(v92 + 16) = v96 - 1;
        v12 = v96 - 1;
      }
      while (v96 > 2);
    }
LABEL_93:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v99 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1AF3CB7C8(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  int64_t v22;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 15;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 15;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4)
      memmove(a4, __src, 16 * v13);
    v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16)
      goto LABEL_43;
    v18 = (char *)(a3 - 16);
    while (1)
    {
      v19 = v18 + 16;
      if (*((_QWORD *)v6 - 1) >= *((_QWORD *)v14 - 1))
      {
        v20 = v14 - 16;
        if (v19 != v14)
        {
          v14 -= 16;
          goto LABEL_40;
        }
        v21 = v18 >= v14;
        v14 -= 16;
        if (v21)
          goto LABEL_40;
      }
      else
      {
        v20 = v6 - 16;
        if (v19 != v6)
        {
          v6 -= 16;
LABEL_40:
          *(_OWORD *)v18 = *(_OWORD *)v20;
          goto LABEL_41;
        }
        v21 = v18 >= v6;
        v6 -= 16;
        if (v21)
          goto LABEL_40;
      }
LABEL_41:
      if (v6 > v7)
      {
        v18 -= 16;
        if (v14 > v4)
          continue;
      }
      goto LABEL_43;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4)
    memmove(a4, __dst, 16 * v10);
  v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      if (*((_QWORD *)v4 + 1) >= *((_QWORD *)v6 + 1))
      {
        v17 = v4 + 16;
        v16 = v4;
        v15 = v6;
        if (v7 == v4)
        {
          v4 += 16;
          if (v7 < v17)
            goto LABEL_20;
        }
        else
        {
          v4 += 16;
        }
      }
      else
      {
        v15 = v6 + 16;
        v16 = v6;
        if (v7 == v6 && v7 < v15)
          goto LABEL_20;
      }
      *(_OWORD *)v7 = *(_OWORD *)v16;
LABEL_20:
      v7 += 16;
      if (v4 < v14)
      {
        v6 = v15;
        if ((unint64_t)v15 < a3)
          continue;
      }
      break;
    }
  }
  v6 = v7;
LABEL_43:
  v22 = v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0);
  if (v6 != v4 || v6 >= &v4[v22 & 0xFFFFFFFFFFFFFFF0])
    memmove(v6, v4, 16 * (v22 >> 4));
  return 1;
}

char *sub_1AF3CB9EC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD20);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_release();
  return v10;
}

_QWORD *sub_1AF3CBAE4(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    v13 = *(_WORD *)(*(_QWORD *)(a4 + 48) + 2 * v12);
    v14 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v12);
    *(_WORD *)a2 = v13;
    *(_QWORD *)(a2 + 8) = v14;
    a2 += 16;
    if (v9 == a3)
      goto LABEL_35;
  }
  v15 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v15 >= v10)
    goto LABEL_30;
  v16 = *(_QWORD *)(v4 + 8 * v15);
  if (v16)
    goto LABEL_19;
  v8 += 2;
  if (v15 + 1 >= v10)
  {
    v7 = 0;
    v8 = v15;
    goto LABEL_34;
  }
  v16 = *(_QWORD *)(v4 + 8 * v8);
  if (v16)
  {
LABEL_15:
    v15 = v8;
LABEL_19:
    v18 = __clz(__rbit64(v16));
    v7 = (v16 - 1) & v16;
    v12 = v18 + (v15 << 6);
    v8 = v15;
    goto LABEL_8;
  }
  v17 = v15 + 2;
  if (v15 + 2 >= v10)
    goto LABEL_30;
  v16 = *(_QWORD *)(v4 + 8 * v17);
  if (v16)
  {
LABEL_18:
    v15 = v17;
    goto LABEL_19;
  }
  v8 = v15 + 3;
  if (v15 + 3 >= v10)
  {
    v7 = 0;
    v8 = v15 + 2;
    goto LABEL_34;
  }
  v16 = *(_QWORD *)(v4 + 8 * v8);
  if (v16)
    goto LABEL_15;
  v17 = v15 + 4;
  if (v15 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v4 + 8 * v17);
  if (v16)
    goto LABEL_18;
  while (1)
  {
    v15 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v15 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v16 = *(_QWORD *)(v4 + 8 * v15);
    ++v17;
    if (v16)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

char *sub_1AF3CBC84(uint64_t a1)
{
  return sub_1AF3CB9EC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1AF3CBC98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B8B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF3CBCE0()
{
  sub_1AF3E80D8();
  sub_1AF3E8108();
  sub_1AF3E80FC();
  return sub_1AF3E8114();
}

uint64_t sub_1AF3CBD3C()
{
  sub_1AF3E8108();
  return sub_1AF3E80FC();
}

uint64_t sub_1AF3CBD78()
{
  sub_1AF3E80D8();
  sub_1AF3E8108();
  sub_1AF3E80FC();
  return sub_1AF3E8114();
}

BOOL sub_1AF3CBDD0(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 == *(_DWORD *)a2 && *(unsigned __int16 *)(a1 + 4) == *(unsigned __int16 *)(a2 + 4);
}

uint64_t sub_1AF3CBDF0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[8];

  v2 = result;
  if (*(_DWORD *)(result + 48) == 117571592)
  {
    v3 = *(_QWORD *)(v1 + 32);
    v4 = __OFADD__(v3, 1);
    v5 = v3 + 1;
    if (v4)
    {
      __break(1u);
      return result;
    }
    *(_QWORD *)(v1 + 32) = v5;
  }
  result = sub_1AF39F3B8(result);
  v6 = *(_QWORD *)v2;
  if (*(_QWORD *)v2 < *(_QWORD *)(v1 + 16))
  {
    result = sub_1AF3CC17C((uint64_t)v7, *(unsigned int *)(v2 + 52) | ((unint64_t)(unsigned __int16)HIWORD(*(_DWORD *)(v2 + 48)) << 32));
    v6 = *(_QWORD *)v2;
  }
  *(_QWORD *)(v1 + 16) = v6;
  return result;
}

unint64_t sub_1AF3CBE84(const void *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[3];
  _QWORD v18[41];
  _BYTE v19[336];

  v5 = type metadata accessor for RecordingOptions.Options(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for KdebugAdvice();
  MEMORY[0x1E0C80A78](v8);
  v10 = (_QWORD *)((char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  memcpy(v19, a1, 0x141uLL);
  v11 = v2[4];
  v12 = *(_QWORD *)(v2[3] + 16);
  if (v12)
    v13 = 0xD000000000000063;
  else
    v13 = 0;
  if (v11 >= 1)
  {
    v15 = *v2;
    v14 = v2[1];
    v17[1] = v12;
    memcpy(v18, a1, 0x141uLL);
    sub_1AF3CC2C8(a2, (uint64_t)v7);
    swift_bridgeObjectRetain();
    sub_1AF3B6C90((uint64_t)v19);
    sub_1AF3C91E0(v18, v15, v14, (uint64_t)v7, v10);
    v18[0] = 0;
    v18[1] = 0xE000000000000000;
    sub_1AF3E7DE4();
    sub_1AF3E7970();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    v17[2] = v11;
    sub_1AF3E8018();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3C8614();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    v13 = v18[0];
    sub_1AF3C9654((uint64_t)v10);
  }
  return v13;
}

unint64_t sub_1AF3CC148@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;
  unint64_t v4;

  result = sub_1AF39F518();
  *a1 = result;
  a1[1] = v3;
  v4 = MEMORY[0x1E0DEE9E8];
  a1[2] = 0;
  a1[3] = v4;
  a1[4] = 0;
  return result;
}

uint64_t sub_1AF3CC17C(uint64_t a1, unint64_t a2)
{
  uint64_t *v2;
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;

  v3 = a2;
  v5 = HIDWORD(a2);
  v6 = *v2;
  sub_1AF3E80D8();
  sub_1AF3E8108();
  sub_1AF3E80FC();
  v7 = sub_1AF3E8114();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    while (1)
    {
      v11 = *(_QWORD *)(v6 + 48) + 8 * v9;
      if (*(_DWORD *)v11 == (_DWORD)v3 && *(unsigned __int16 *)(v11 + 4) == (unsigned __int16)v5)
        break;
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    result = 0;
    v13 = *(_QWORD *)(*v2 + 48) + 8 * v9;
    LODWORD(v3) = *(_DWORD *)v13;
    LOWORD(v5) = *(_WORD *)(v13 + 4);
  }
  else
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v2;
    *v2 = 0x8000000000000000;
    sub_1AF3CC874(v3 & 0xFFFFFFFFFFFFLL, v9, isUniquelyReferenced_nonNull_native);
    *v2 = v15;
    swift_bridgeObjectRelease();
    result = 1;
  }
  *(_DWORD *)a1 = v3;
  *(_WORD *)(a1 + 4) = v5;
  return result;
}

uint64_t sub_1AF3CC2C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1AF3CC310()
{
  unint64_t result;

  result = qword_1EEE3BD38;
  if (!qword_1EEE3BD38)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ED580, &type metadata for RetrogradeEvent);
    atomic_store(result, (unint64_t *)&qword_1EEE3BD38);
  }
  return result;
}

uint64_t __swift_memcpy6_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for RetrogradeEvent(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 6))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RetrogradeEvent(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_WORD *)(result + 4) = 0;
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
  *(_BYTE *)(result + 6) = v3;
  return result;
}

ValueMetadata *type metadata accessor for RetrogradeEvent()
{
  return &type metadata for RetrogradeEvent;
}

uint64_t destroy for KdebugPostprocessing()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for KdebugPostprocessing(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for KdebugPostprocessing(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  return a1;
}

uint64_t assignWithTake for KdebugPostprocessing(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for KdebugPostprocessing(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for KdebugPostprocessing(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for KdebugPostprocessing()
{
  return &type metadata for KdebugPostprocessing;
}

uint64_t sub_1AF3CC598()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD40);
  result = sub_1AF3E7DC0();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v29 = (_QWORD *)(v2 + 56);
    v6 = 1 << *(_BYTE *)(v2 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v6 + 63) >> 6;
    v10 = result + 56;
    while (1)
    {
      if (v8)
      {
        v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
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
        if (v15 >= v9)
          goto LABEL_33;
        v16 = v29[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v9)
            goto LABEL_33;
          v16 = v29[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v9)
              goto LABEL_33;
            v16 = v29[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v9)
              {
LABEL_33:
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v28;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v29[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v9)
                    goto LABEL_33;
                  v16 = v29[v5];
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
        v8 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(v2 + 48) + 8 * v14;
      v19 = *(_DWORD *)v18;
      v20 = *(_WORD *)(v18 + 4);
      sub_1AF3E80D8();
      sub_1AF3E8108();
      sub_1AF3E80FC();
      result = sub_1AF3E8114();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v11 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 8 * v11;
      *(_DWORD *)v12 = v19;
      *(_WORD *)(v12 + 4) = v20;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_1AF3CC874(unint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v5 = result;
  v6 = HIDWORD(result);
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_1AF3CC598();
  }
  else
  {
    if (v8 > v7)
    {
      result = (unint64_t)sub_1AF3CC9E0();
      goto LABEL_14;
    }
    sub_1AF3CCB84();
  }
  v9 = *v3;
  sub_1AF3E80D8();
  sub_1AF3E8108();
  sub_1AF3E80FC();
  result = sub_1AF3E8114();
  v10 = -1 << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v10;
    while (1)
    {
      v12 = *(_QWORD *)(v9 + 48) + 8 * a2;
      if (*(_DWORD *)v12 == v5 && *(unsigned __int16 *)(v12 + 4) == (unsigned __int16)v6)
        break;
      a2 = (a2 + 1) & v11;
      if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_14;
    }
    result = sub_1AF3E8060();
    __break(1u);
  }
LABEL_14:
  v13 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v14 = *(_QWORD *)(v13 + 48) + 8 * a2;
  *(_DWORD *)v14 = v5;
  *(_WORD *)(v14 + 4) = v6;
  v15 = *(_QWORD *)(v13 + 16);
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    *(_QWORD *)(v13 + 16) = v17;
  return result;
}

void *sub_1AF3CC9E0()
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
  int v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD40);
  v2 = *v0;
  v3 = sub_1AF3E7DB4();
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
    v16 = 8 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v18 = *(_DWORD *)v17;
    LOWORD(v17) = *(_WORD *)(v17 + 4);
    v19 = *(_QWORD *)(v4 + 48) + v16;
    *(_DWORD *)v19 = v18;
    *(_WORD *)(v19 + 4) = v17;
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

uint64_t sub_1AF3CCB84()
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
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD40);
  result = sub_1AF3E7DC0();
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
  v28 = (unint64_t)(v7 + 63) >> 6;
  v10 = result + 56;
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
    if (v15 >= v28)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v28)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v28)
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
    v18 = *(_QWORD *)(v2 + 48) + 8 * v14;
    v19 = *(_DWORD *)v18;
    v20 = *(_WORD *)(v18 + 4);
    sub_1AF3E80D8();
    sub_1AF3E8108();
    sub_1AF3E80FC();
    result = sub_1AF3E8114();
    v21 = -1 << *(_BYTE *)(v4 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      v11 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v10 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v4 + 48) + 8 * v11;
    *(_DWORD *)v12 = v19;
    *(_WORD *)(v12 + 4) = v20;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v28)
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
    if (v5 >= v28)
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

uint64_t sub_1AF3CCE2C(_QWORD *a1)
{
  swift_allocObject();
  return sub_1AF3CCE64(a1);
}

uint64_t sub_1AF3CCE64(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *v1;
  v3 = *((_OWORD *)a1 + 1);
  *((_OWORD *)v1 + 1) = *(_OWORD *)a1;
  *((_OWORD *)v1 + 2) = v3;
  *((_BYTE *)v1 + 48) = *((_BYTE *)a1 + 32);
  v4 = *((char *)a1 + 8);
  v5 = *(_QWORD *)&asc_1AF3EDC98[8 * v4];
  v1[7] = v5;
  v6 = (uint64_t *)*a1;
  v7 = ktrace_chunk_size_t(*a1);
  if (__OFSUB__(v7, v5))
  {
    __break(1u);
    JUMPOUT(0x1AF3CCF44);
  }
  if (ktrace_chunk_map_data(v6, v5, v7 - v5))
    __asm { BR              X11 }
  type metadata accessor for EventChunkData(0, *(_QWORD *)(v2 + 80), v8, v9);
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t type metadata accessor for EventChunkData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for EventChunkData);
}

void sub_1AF3CCF68()
{
  MEMORY[0x1E0C80A78]();
  __asm { BR              X10 }
}

uint64_t sub_1AF3CCFF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v5 = ((uint64_t (*)(_QWORD))ktrace_chunk_size_t)(*(_QWORD *)(v2 + 16)) / 64;
  if ((uint64_t)v5 >= 1)
  {
    v6 = 0;
    v7 = *(_QWORD *)(v2 + 64);
    while (1)
    {
      v8 = v5 >> 1;
      v9 = v6 + (v5 >> 1);
      if (__OFADD__(v6, v5 >> 1))
        break;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v7 + *(_QWORD *)(v3 + 72) * v9, v0);
      v10 = (*(uint64_t (**)(uint64_t))(v4 - 88))(v1);
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
      if ((v10 & 1) == 0)
      {
        v6 = v9 + 1;
        if (__OFADD__(v9, 1))
          goto LABEL_11;
        v8 = v5 + ~v8;
      }
      v5 = v8;
      if (v8 <= 0)
        return v6;
    }
    __break(1u);
LABEL_11:
    __break(1u);
    JUMPOUT(0x1AF3CD0B8);
  }
  return 0;
}

uint64_t sub_1AF3CD0CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t (*v11)(BOOL (*)(uint64_t), _BYTE *);
  uint64_t v12;
  char v13;
  char v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int16 v21;
  __int16 v22;
  _QWORD *appended;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  UInt8 bytes[8];
  _BYTE v36[16];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[16];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v42 = a4;
  v43 = a5;
  v44 = a2;
  v45 = a3;
  v11 = *(uint64_t (**)(BOOL (*)(uint64_t), _BYTE *))(*v5 + 120);
  v12 = v11(sub_1AF3D5048, v41);
  v14 = v13;
  v37 = a4;
  v38 = a5;
  v39 = a2;
  v40 = a3;
  result = v11(sub_1AF3D50A4, v36);
  v17 = v5[8];
  if (!v17)
    goto LABEL_24;
  if ((v14 & 1) != 0)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  if ((v16 & 1) != 0)
    goto LABEL_26;
  v18 = result;
  if (v12 < result)
  {
    while (1)
    {
      v19 = v5[2];
      v20 = ktrace_chunk_tag(v19);
      v21 = ktrace_chunk_version_major(v19);
      v22 = ktrace_chunk_version_minor(v19);
      appended = ktrace_file_append_start(a1, v20, v21, v22);
      if (!appended)
      {
        v29 = MEMORY[0x1AF45C330]();
        sub_1AF3CDC78();
        swift_allocError();
        *(_QWORD *)v30 = 0xD000000000000015;
        *(_QWORD *)(v30 + 8) = 0x80000001AF3F30F0;
        *(_DWORD *)(v30 + 16) = v29;
        *(_BYTE *)(v30 + 20) = 1;
        return swift_willThrow();
      }
      v24 = (uint64_t)appended;
      if ((uint64_t)v5[7] > 0)
      {
        *(_QWORD *)bytes = 0;
        v25 = ktrace_file_append_data(a1, (uint64_t)appended, bytes, 8);
        if (v25)
          break;
      }
      if (__OFSUB__(v18, v12))
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      if (v18 - v12 >= 0x1FFFFFF)
        v26 = 0x1FFFFFFLL;
      else
        v26 = v18 - v12;
      if ((unint64_t)(v26 - 0x200000000000000) >> 58 != 63)
        goto LABEL_22;
      v27 = ktrace_file_append_data(a1, v24, (UInt8 *)(v17 + (v12 << 6)), v26 << 6);
      if (v27)
      {
        v31 = v27;
        sub_1AF3CDC78();
        swift_allocError();
        v33 = 0xD000000000000014;
        v34 = "appending event data";
        goto LABEL_20;
      }
      v28 = __OFADD__(v12, v26);
      v12 += v26;
      if (v28)
        goto LABEL_23;
      result = ktrace_file_append_finish(a1, v24);
      if (v12 >= v18)
        return result;
    }
    v31 = v25;
    sub_1AF3CDC78();
    swift_allocError();
    v33 = 0xD000000000000016;
    v34 = "appending event header";
LABEL_20:
    *(_QWORD *)v32 = v33;
    *(_QWORD *)(v32 + 8) = (unint64_t)(v34 - 32) | 0x8000000000000000;
    *(_DWORD *)(v32 + 16) = v31;
    *(_BYTE *)(v32 + 20) = 1;
    swift_willThrow();
    return ktrace_file_append_finish(a1, v24);
  }
  return result;
}

uint64_t sub_1AF3CD390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t (*v11)(BOOL (*)(uint64_t *), _BYTE *);
  uint64_t v12;
  char v13;
  char v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int16 v21;
  __int16 v22;
  _QWORD *appended;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  UInt8 bytes[8];
  _BYTE v36[16];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[16];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v42 = a4;
  v43 = a5;
  v44 = a2;
  v45 = a3;
  v11 = *(uint64_t (**)(BOOL (*)(uint64_t *), _BYTE *))(*v5 + 120);
  v12 = v11(sub_1AF3D5100, v41);
  v14 = v13;
  v37 = a4;
  v38 = a5;
  v39 = a2;
  v40 = a3;
  result = v11(sub_1AF3D5154, v36);
  v17 = v5[8];
  if (!v17)
    goto LABEL_24;
  if ((v14 & 1) != 0)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  if ((v16 & 1) != 0)
    goto LABEL_26;
  v18 = result;
  if (v12 < result)
  {
    while (1)
    {
      v19 = v5[2];
      v20 = ktrace_chunk_tag(v19);
      v21 = ktrace_chunk_version_major(v19);
      v22 = ktrace_chunk_version_minor(v19);
      appended = ktrace_file_append_start(a1, v20, v21, v22);
      if (!appended)
      {
        v29 = MEMORY[0x1AF45C330]();
        sub_1AF3CDC78();
        swift_allocError();
        *(_QWORD *)v30 = 0xD000000000000015;
        *(_QWORD *)(v30 + 8) = 0x80000001AF3F30F0;
        *(_DWORD *)(v30 + 16) = v29;
        *(_BYTE *)(v30 + 20) = 1;
        return swift_willThrow();
      }
      v24 = (uint64_t)appended;
      if ((uint64_t)v5[7] > 0)
      {
        *(_QWORD *)bytes = 0;
        v25 = ktrace_file_append_data(a1, (uint64_t)appended, bytes, 8);
        if (v25)
          break;
      }
      if (__OFSUB__(v18, v12))
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      if (v18 - v12 >= 0x3FFFFFF)
        v26 = 0x3FFFFFFLL;
      else
        v26 = v18 - v12;
      if ((unint64_t)(v26 - 0x400000000000000) >> 59 != 31)
        goto LABEL_22;
      v27 = ktrace_file_append_data(a1, v24, (UInt8 *)(v17 + 32 * v12), 32 * v26);
      if (v27)
      {
        v31 = v27;
        sub_1AF3CDC78();
        swift_allocError();
        v33 = 0xD000000000000014;
        v34 = "appending event data";
        goto LABEL_20;
      }
      v28 = __OFADD__(v12, v26);
      v12 += v26;
      if (v28)
        goto LABEL_23;
      result = ktrace_file_append_finish(a1, v24);
      if (v12 >= v18)
        return result;
    }
    v31 = v25;
    sub_1AF3CDC78();
    swift_allocError();
    v33 = 0xD000000000000016;
    v34 = "appending event header";
LABEL_20:
    *(_QWORD *)v32 = v33;
    *(_QWORD *)(v32 + 8) = (unint64_t)(v34 - 32) | 0x8000000000000000;
    *(_DWORD *)(v32 + 16) = v31;
    *(_BYTE *)(v32 + 20) = 1;
    swift_willThrow();
    return ktrace_file_append_finish(a1, v24);
  }
  return result;
}

uint64_t sub_1AF3CD654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t (*v11)(BOOL (*)(uint64_t), _BYTE *);
  uint64_t v12;
  char v13;
  char v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  __int16 v21;
  __int16 v22;
  _QWORD *appended;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  UInt8 bytes[8];
  _BYTE v36[16];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[16];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v42 = a4;
  v43 = a5;
  v44 = a2;
  v45 = a3;
  v11 = *(uint64_t (**)(BOOL (*)(uint64_t), _BYTE *))(*v5 + 120);
  v12 = v11(sub_1AF3D51A8, v41);
  v14 = v13;
  v37 = a4;
  v38 = a5;
  v39 = a2;
  v40 = a3;
  result = v11(sub_1AF3D51FC, v36);
  v17 = v5[8];
  if (!v17)
    goto LABEL_24;
  if ((v14 & 1) != 0)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
  }
  if ((v16 & 1) != 0)
    goto LABEL_26;
  v18 = result;
  if (v12 < result)
  {
    while (1)
    {
      v19 = v5[2];
      v20 = ktrace_chunk_tag(v19);
      v21 = ktrace_chunk_version_major(v19);
      v22 = ktrace_chunk_version_minor(v19);
      appended = ktrace_file_append_start(a1, v20, v21, v22);
      if (!appended)
      {
        v29 = MEMORY[0x1AF45C330]();
        sub_1AF3CDC78();
        swift_allocError();
        *(_QWORD *)v30 = 0xD000000000000015;
        *(_QWORD *)(v30 + 8) = 0x80000001AF3F30F0;
        *(_DWORD *)(v30 + 16) = v29;
        *(_BYTE *)(v30 + 20) = 1;
        return swift_willThrow();
      }
      v24 = (uint64_t)appended;
      if ((uint64_t)v5[7] > 0)
      {
        *(_QWORD *)bytes = 0;
        v25 = ktrace_file_append_data(a1, (uint64_t)appended, bytes, 8);
        if (v25)
          break;
      }
      if (__OFSUB__(v18, v12))
      {
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      if (v18 - v12 >= 44739242)
        v26 = 44739242;
      else
        v26 = v18 - v12;
      if ((unsigned __int128)(v26 * (__int128)48) >> 64 != (48 * v26) >> 63)
        goto LABEL_22;
      v27 = ktrace_file_append_data(a1, v24, (UInt8 *)(v17 + 48 * v12), 48 * v26);
      if (v27)
      {
        v31 = v27;
        sub_1AF3CDC78();
        swift_allocError();
        v33 = 0xD000000000000014;
        v34 = "appending event data";
        goto LABEL_20;
      }
      v28 = __OFADD__(v12, v26);
      v12 += v26;
      if (v28)
        goto LABEL_23;
      result = ktrace_file_append_finish(a1, v24);
      if (v12 >= v18)
        return result;
    }
    v31 = v25;
    sub_1AF3CDC78();
    swift_allocError();
    v33 = 0xD000000000000016;
    v34 = "appending event header";
LABEL_20:
    *(_QWORD *)v32 = v33;
    *(_QWORD *)(v32 + 8) = (unint64_t)(v34 - 32) | 0x8000000000000000;
    *(_DWORD *)(v32 + 16) = v31;
    *(_BYTE *)(v32 + 20) = 1;
    swift_willThrow();
    return ktrace_file_append_finish(a1, v24);
  }
  return result;
}

uint64_t sub_1AF3CD91C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(BOOL (*)(), _BYTE *);
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __int16 v23;
  __int16 v24;
  _QWORD *appended;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  UInt8 bytes[8];
  _BYTE v41[16];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[16];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v11 = *v5;
  v48 = *(_QWORD *)(*v5 + 80);
  v12 = v48;
  v49 = a4;
  v50 = a5;
  v51 = a2;
  v52 = a3;
  v13 = *(uint64_t (**)(BOOL (*)(), _BYTE *))(v11 + 120);
  v14 = v13(sub_1AF3CDC18, v47);
  v37 = v15;
  v42 = v12;
  v43 = a4;
  v44 = a5;
  v45 = a2;
  v46 = a3;
  v16 = v13(sub_1AF3CDC48, v41);
  v18 = v17;
  result = sub_1AF3E7C1C();
  v39 = result;
  if (!result)
    goto LABEL_26;
  v38 = *(_QWORD *)(v12 - 8);
  v20 = *(_QWORD *)(v38 + 64);
  if (!v20)
    goto LABEL_25;
  if ((v37 & 1) != 0)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  if ((v18 & 1) != 0)
    goto LABEL_28;
  if (v14 < v16)
  {
    while (1)
    {
      v21 = v5[2];
      v22 = ktrace_chunk_tag(v21);
      v23 = ktrace_chunk_version_major(v21);
      v24 = ktrace_chunk_version_minor(v21);
      appended = ktrace_file_append_start(a1, v22, v23, v24);
      if (!appended)
      {
        v31 = MEMORY[0x1AF45C330]();
        sub_1AF3CDC78();
        swift_allocError();
        *(_QWORD *)v32 = 0xD000000000000015;
        *(_QWORD *)(v32 + 8) = 0x80000001AF3F30F0;
        *(_DWORD *)(v32 + 16) = v31;
        *(_BYTE *)(v32 + 20) = 1;
        return swift_willThrow();
      }
      v26 = (uint64_t)appended;
      if ((uint64_t)v5[7] >= 1)
      {
        *(_QWORD *)bytes = 0;
        v27 = ktrace_file_append_data(a1, (uint64_t)appended, bytes, 8);
        if (v27)
          break;
      }
      if (__OFSUB__(v16, v14))
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      if (0x7FFFFFFF / v20 >= v16 - v14)
        v28 = v16 - v14;
      else
        v28 = 0x7FFFFFFF / v20;
      if ((unsigned __int128)(v28 * (__int128)v20) >> 64 != (v28 * v20) >> 63)
        goto LABEL_23;
      v29 = ktrace_file_append_data(a1, v26, (UInt8 *)(v39 + *(_QWORD *)(v38 + 72) * v14), v28 * v20);
      if (v29)
      {
        v33 = v29;
        sub_1AF3CDC78();
        swift_allocError();
        v35 = 0xD000000000000014;
        v36 = "appending event data";
        goto LABEL_21;
      }
      v30 = __OFADD__(v14, v28);
      v14 += v28;
      if (v30)
        goto LABEL_24;
      result = ktrace_file_append_finish(a1, v26);
      if (v14 >= v16)
        return result;
    }
    v33 = v27;
    sub_1AF3CDC78();
    swift_allocError();
    v35 = 0xD000000000000016;
    v36 = "appending event header";
LABEL_21:
    *(_QWORD *)v34 = v35;
    *(_QWORD *)(v34 + 8) = (unint64_t)(v36 - 32) | 0x8000000000000000;
    *(_DWORD *)(v34 + 16) = v33;
    *(_BYTE *)(v34 + 20) = 1;
    swift_willThrow();
    return ktrace_file_append_finish(a1, v26);
  }
  return result;
}

BOOL sub_1AF3CDC18()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  return (*(uint64_t (**)(void))(v0 + 24))() > v1;
}

BOOL sub_1AF3CDC48()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  return (*(uint64_t (**)(void))(v0 + 24))() > v1;
}

unint64_t sub_1AF3CDC78()
{
  unint64_t result;

  result = qword_1EEE3BD48;
  if (!qword_1EEE3BD48)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ED694, &type metadata for EventChunk.Err);
    atomic_store(result, (unint64_t *)&qword_1EEE3BD48);
  }
  return result;
}

unint64_t sub_1AF3CDCBC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  result = ktrace_chunk_size_t(v1);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = result - v3;
  if (__OFSUB__(result, v3))
  {
    __break(1u);
  }
  else
  {
    result = sub_1AF3E7C1C();
    if (result)
    {
      ktrace_chunk_unmap_data(v1, result, v4);
      return v0;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1AF3CDD24()
{
  sub_1AF3CDCBC();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF3CDD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[2];

  if ((a3 & 0x100000000) != 0)
  {
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    strcpy((char *)v4, "file I/O for ");
    HIWORD(v4[1]) = -4864;
    sub_1AF3E7970();
    sub_1AF3E7970();
    sub_1AF3E8018();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    v4[0] = 0xD000000000000018;
    v4[1] = 0x80000001AF3F3150;
    sub_1AF3E7970();
  }
  return v4[0];
}

uint64_t sub_1AF3CDE6C()
{
  uint64_t v0;

  return sub_1AF3CDD44(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32));
}

uint64_t sub_1AF3CDE90(uint64_t a1)
{
  sub_1AF3E7DE4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1AF3E7970();
  sub_1AF3E8018();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AF3CDF44()
{
  uint64_t *v0;

  return sub_1AF3CDE90(*v0);
}

uint64_t sub_1AF3CDF50(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = 0;
  v2 = ktrace_file_earliest_timestamp(a1, v8);
  if (v2)
  {
    v3 = v2;
    sub_1AF3D1E44();
    swift_allocError();
    *(_QWORD *)v4 = 0xD000000000000012;
    *(_QWORD *)(v4 + 8) = 0x80000001AF3F3190;
LABEL_5:
    *(_DWORD *)(v4 + 16) = v3;
    return swift_willThrow();
  }
  v7 = 0;
  v5 = ktrace_file_latest_timestamp(a1, &v7);
  if (v5)
  {
    v3 = v5;
    sub_1AF3D1E44();
    swift_allocError();
    *(_QWORD *)v4 = 0xD000000000000010;
    *(_QWORD *)(v4 + 8) = 0x80000001AF3F31B0;
    goto LABEL_5;
  }
  return v8[0];
}

void sub_1AF3CE070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  __asm { BR              X10 }
}

unint64_t sub_1AF3CE0AC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v6 = sub_1AF3BE974(v3, a3);
  v7 = v4 + v6;
  if (__CFADD__(v4, v6))
  {
    __break(1u);
    JUMPOUT(0x1AF3CE1F4);
  }
  if (v7 > v5)
  {
    type metadata accessor for TrimError(0);
    sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
    swift_allocError();
    *v8 = 0xD00000000000001FLL;
    v8[1] = 0x80000001AF3F3200;
    v8[2] = v7;
    v8[3] = v5;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  return v7;
}

void sub_1AF3CE208(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1AF3CE238()
{
  sub_1AF3E8018();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  return 64;
}

void sub_1AF3CE310(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

unint64_t sub_1AF3CE340()
{
  sub_1AF3E7DE4();
  swift_bridgeObjectRelease();
  sub_1AF3E8018();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  return 0xD000000000000010;
}

void sub_1AF3CE4A0()
{
  uint64_t v0;

  sub_1AF3CE310(*(_QWORD *)v0, *(_BYTE *)(v0 + 8));
}

uint64_t sub_1AF3CE4AC(uint64_t a1)
{
  return sub_1AF3D2650(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void sub_1AF3CE4C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = sub_1AF3E7808();
  MEMORY[0x1E0C80A78](v1);
  v2 = type metadata accessor for TrimError(0);
  MEMORY[0x1E0C80A78](v2);
  sub_1AF3C79F4(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)sub_1AF3CE590 + 4 * word_1AF3ED5EE[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1AF3CE590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD70) + 48));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v1, v0);
  *(_QWORD *)(v4 - 80) = 0;
  *(_QWORD *)(v4 - 72) = 0xE000000000000000;
  sub_1AF3E7DE4();
  sub_1AF344878(&qword_1EEE3BD68, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0138], MEMORY[0x1E0DF0148]);
  v6 = sub_1AF3E8018();
  v8 = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 - 80) = v6;
  *(_QWORD *)(v4 - 72) = v8;
  sub_1AF3E7970();
  *(_DWORD *)(v4 - 88) = v5;
  sub_1AF3E8018();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v4 - 80);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v0);
  return v9;
}

uint64_t sub_1AF3CEA70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t result;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  unint64_t *v38;
  unint64_t *v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
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
  char *v68;
  char *v69;
  id v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  __int128 v75;
  __int128 v76;
  __n128 v77;
  _QWORD v78[2];
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint64_t v112;
  _OWORD v113[8];
  uint64_t v114;
  uint64_t v115;

  v91 = a3;
  v89 = a6;
  v84 = sub_1AF3E7808();
  v86 = *(_QWORD *)(v84 - 8);
  v10 = MEMORY[0x1E0C80A78](v84);
  v82 = (char *)v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v83 = (char *)v78 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD78);
  MEMORY[0x1E0C80A78](v13);
  v85 = (char *)v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TrimOptions(0);
  v88 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x1E0C80A78](v15);
  v18 = (char *)v78 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = v16;
  v19 = *(int *)(v16 + 32);
  v87 = v18;
  v18[v19] = 0;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a4;
  *(_QWORD *)(v20 + 24) = a5;
  v115 = a5;
  swift_retain();
  v21 = sub_1AF39D7DC();
  v22 = sub_1AF39D7E8();
  v23 = sub_1AF39D7E8();
  v77.n128_u64[1] = v22;
  *((_QWORD *)&v76 + 1) = v20;
  v77.n128_u64[0] = (unint64_t)v21;
  *(_QWORD *)&v76 = sub_1AF3D270C;
  *(_QWORD *)&v75 = 0xD000000000000049;
  *((_QWORD *)&v75 + 1) = 0x80000001AF3F3480;
  sub_1AF39D7F4(a1, a2, (uint64_t)sub_1AF3CF7C8, 0, 0xD000000000000024, 0x80000001AF3F3390, 0xD0000000000000BFLL, 0x80000001AF3F33C0, (uint64_t)&v104, v75, 0, v76, v77, v23);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = 0;
  *(_BYTE *)(v24 + 24) = 3;
  swift_retain();
  v25 = sub_1AF347DB0();
  sub_1AF39B1D8(1836020326, 0xE400000000000000, 0xD00000000000001FLL, 0x80000001AF3F34D0, 0, 0, v25 & 1, (uint64_t)sub_1AF3D273C, v24);
  swift_release();
  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = 1;
  *(_BYTE *)(v26 + 24) = 3;
  swift_retain();
  v27 = sub_1AF347DB0();
  sub_1AF39B1D8(28532, 0xE200000000000000, 0xD000000000000020, 0x80000001AF3F34F0, 0, 0, v27 & 1, (uint64_t)sub_1AF3D273C, v26);
  swift_release();
  v28 = swift_allocObject();
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)(v28 + 24) = 0;
  swift_retain();
  v29 = sub_1AF347DB0();
  sub_1AF39B1D8(0x74757074756FLL, 0xE600000000000000, 0xD00000000000001CLL, 0x80000001AF3F3520, 111, 0xE100000000000000, v29 & 1, (uint64_t)sub_1AF3D27E8, v28);
  swift_release();
  v113[6] = v110;
  v113[7] = v111;
  v114 = v112;
  v113[2] = v106;
  v113[3] = v107;
  v113[4] = v108;
  v113[5] = v109;
  v113[0] = v104;
  v113[1] = v105;
  sub_1AF3D2848(v113);
  v30 = v92;
  v31 = sub_1AF39C080(v91);
  if (v30)
  {
    swift_bridgeObjectRelease();
    sub_1AF3D2914(v113);
    swift_release();
    sub_1AF3D2914(v113);
    swift_release();
    swift_release();
    return swift_release();
  }
  v80 = (_QWORD *)(v26 + 16);
  v81 = v28;
  v92 = v26;
  v33 = v31;
  swift_bridgeObjectRelease();
  sub_1AF3D2914(v113);
  if (!v33)
  {
    swift_release();
    sub_1AF3D2914(v113);
    swift_release();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 56))(v89, 1, 1, v90);
  }
  v91 = 0;
  v34 = *(_QWORD *)(v33 + 16);
  if (!v34)
  {
    swift_bridgeObjectRelease();
    type metadata accessor for TrimError(0);
    sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
    swift_allocError();
    *v37 = 0xD000000000000020;
    v37[1] = 0x80000001AF3F35A0;
    goto LABEL_14;
  }
  v79 = v24;
  if (v34 == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v35 = v80;
    if (*(unsigned __int8 *)(v24 + 24) >= 3u && !*(_QWORD *)(v24 + 16))
    {
      swift_beginAccess();
      if (*(unsigned __int8 *)(v92 + 24) >= 3u)
      {
        if (*v35)
        {
          swift_bridgeObjectRelease();
          type metadata accessor for TrimError(0);
          sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
          swift_allocError();
          *v36 = 0xD00000000000001FLL;
          v36[1] = 0x80000001AF3F3580;
LABEL_14:
          swift_storeEnumTagMultiPayload();
          swift_willThrow();
          swift_release();
          v101 = v110;
          v102 = v111;
          v103 = v112;
          v97 = v106;
          v98 = v107;
          v99 = v108;
          v100 = v109;
          v95 = v104;
          v96 = v105;
          sub_1AF3D2914(&v95);
          swift_release();
          swift_release();
          return swift_release();
        }
      }
    }
    v41 = (uint64_t)v87;
    sub_1AF3E7814();
    v42 = *(_BYTE *)(v24 + 24);
    v43 = v90;
    v44 = v41 + *(int *)(v90 + 24);
    *(_QWORD *)v44 = *(_QWORD *)(v24 + 16);
    *(_BYTE *)(v44 + 8) = v42;
    swift_beginAccess();
    v45 = v92;
    v46 = *(_BYTE *)(v92 + 24);
    v47 = v41 + *(int *)(v43 + 28);
    *(_QWORD *)v47 = *(_QWORD *)(v92 + 16);
    *(_BYTE *)(v47 + 8) = v46;
    swift_beginAccess();
    if (*(_QWORD *)(v81 + 24))
    {
      swift_bridgeObjectRetain();
      sub_1AF3E7814();
      swift_release();
      sub_1AF3D2914(v113);
      swift_release();
      swift_release();
LABEL_19:
      v49 = v88;
      v48 = v89;
      swift_release();
      sub_1AF3C79F4(v41, v48, type metadata accessor for TrimOptions);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v49 + 56))(v48, 0, 1, v43);
      return sub_1AF3C7498(v41, type metadata accessor for TrimOptions);
    }
    sub_1AF3E77FC();
    if (v50)
    {
      *(_QWORD *)&v95 = 46;
      *((_QWORD *)&v95 + 1) = 0xE100000000000000;
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      v51 = v95;
    }
    else
    {
      v51 = 0;
    }
    v52 = v85;
    sub_1AF3E77B4();
    v53 = (uint64_t)v52;
    v54 = sub_1AF3E77E4();
    v55 = *(_QWORD *)(v54 - 8);
    LODWORD(v80) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v53, 1, v54);
    if ((_DWORD)v80 == 1)
    {
      swift_bridgeObjectRelease();
      sub_1AF3C1760(v53, &qword_1EEE3BD78);
      v89 = type metadata accessor for TrimError(0);
      sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
      v91 = swift_allocError();
      v57 = v56;
      *(_QWORD *)&v95 = 0;
      *((_QWORD *)&v95 + 1) = 0xE000000000000000;
      sub_1AF3E7DE4();
      sub_1AF344878(&qword_1EEE3BD68, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0138], MEMORY[0x1E0DF0148]);
      v58 = v84;
      v59 = sub_1AF3E8018();
      v60 = v41;
      v62 = v61;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v95 = v59;
      *((_QWORD *)&v95 + 1) = v62;
      sub_1AF3E7970();
      v63 = *((_QWORD *)&v95 + 1);
      *v57 = v95;
      v57[1] = v63;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      swift_release();
      v101 = v110;
      v102 = v111;
      v103 = v112;
      v97 = v106;
      v98 = v107;
      v99 = v108;
      v100 = v109;
      v95 = v104;
      v96 = v105;
      sub_1AF3D2914(&v95);
      swift_release();
      swift_release();
    }
    else
    {
      v64 = sub_1AF3E77D8();
      v78[1] = v51;
      v65 = v64;
      v67 = v66;
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v53, v54);
      *(_QWORD *)&v95 = v65;
      *((_QWORD *)&v95 + 1) = v67;
      sub_1AF3E7970();
      sub_1AF3CE208(*(_QWORD *)(v79 + 16), *(_BYTE *)(v79 + 24));
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      sub_1AF3E7970();
      sub_1AF3CE208(*(_QWORD *)(v45 + 16), *(_BYTE *)(v45 + 24));
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      v68 = v87;
      v58 = v84;
      v85 = *(char **)(v86 + 16);
      ((void (*)(char *, char *, uint64_t))v85)(v82, v87, v84);
      sub_1AF3E77C0();
      v69 = &v68[*(int *)(v90 + 20)];
      sub_1AF3E77F0();
      v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3620]), sel_init);
      sub_1AF3E77CC();
      v71 = (void *)sub_1AF3E78BC();
      swift_bridgeObjectRelease();
      v72 = objc_msgSend(v70, sel_fileExistsAtPath_, v71);

      if (!v72)
      {
        swift_release();
        v101 = v110;
        v102 = v111;
        v103 = v112;
        v97 = v106;
        v98 = v107;
        v99 = v108;
        v100 = v109;
        v95 = v104;
        v96 = v105;
        sub_1AF3D2914(&v95);
        swift_release();
        swift_release();
        v43 = v90;
        v41 = (uint64_t)v87;
        goto LABEL_19;
      }
      type metadata accessor for TrimError(0);
      sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
      swift_allocError();
      ((void (*)(uint64_t, char *, uint64_t))v85)(v73, v69, v58);
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      swift_release();
      v101 = v110;
      v102 = v111;
      v103 = v112;
      v97 = v106;
      v98 = v107;
      v99 = v108;
      v100 = v109;
      v95 = v104;
      v96 = v105;
      sub_1AF3D2914(&v95);
      swift_release();
      swift_release();
      v60 = (uint64_t)v87;
    }
    swift_release();
    v74 = *(uint64_t (**)(uint64_t, uint64_t))(v86 + 8);
    result = v74(v60, v58);
    if ((_DWORD)v80 != 1)
      return v74(v60 + *(int *)(v90 + 20), v58);
  }
  else
  {
    type metadata accessor for TrimError(0);
    sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
    swift_allocError();
    v39 = v38;
    *(_QWORD *)&v95 = 0;
    *((_QWORD *)&v95 + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    result = swift_bridgeObjectRelease();
    v93 = 0xD000000000000011;
    v94 = 0x80000001AF3F3540;
    if (*(_QWORD *)(v33 + 16) < v34)
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)&v95 = v33;
      *((_QWORD *)&v95 + 1) = v33 + 32;
      *(_QWORD *)&v96 = 1;
      *((_QWORD *)&v96 + 1) = (2 * v34) | 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD80);
      sub_1AF3D29E0();
      sub_1AF3E7898();
      swift_bridgeObjectRelease();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      v40 = v94;
      *v39 = v93;
      v39[1] = v40;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      swift_release();
      v101 = v110;
      v102 = v111;
      v103 = v112;
      v97 = v106;
      v98 = v107;
      v99 = v108;
      v100 = v109;
      v95 = v104;
      v96 = v105;
      sub_1AF3D2914(&v95);
      swift_release();
      swift_release();
      return swift_release();
    }
  }
  return result;
}

unint64_t sub_1AF3CF7C8()
{
  return 0xD000000000000021;
}

uint64_t sub_1AF3CF7E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = sub_1AF3E7718();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF3E770C();
  v21 = sub_1AF3E7700();
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v29 = v15;
  v16 = ktrace_file_uuid(a1, (uint64_t)&v21);
  if (v16)
  {
    v17 = v16;
    sub_1AF3CDC78();
    swift_allocError();
    *(_OWORD *)v18 = xmmword_1AF3EDCC0;
    *(_DWORD *)(v18 + 16) = v17;
    *(_BYTE *)(v18 + 20) = 1;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  }
}

uint64_t sub_1AF3CF9A0()
{
  return 0x6946656372756F73;
}

uint64_t sub_1AF3CF9C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6946656372756F73 && a2 == 0xEE0044495555656CLL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_1AF3E8030();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_1AF3CFA7C()
{
  sub_1AF3D2A2C();
  return sub_1AF3E8144();
}

uint64_t sub_1AF3CFAA4()
{
  sub_1AF3D2A2C();
  return sub_1AF3E8150();
}

uint64_t sub_1AF3CFACC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD98);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AF3D2A2C();
  sub_1AF3E812C();
  sub_1AF3E7FC4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t Trimming.toolName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Trimming.interactive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Trimming.notify.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_retain();
  return v1;
}

uint64_t Trimming.init(toolName:interactive:notify:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Trimming.trim(arguments:)(Swift::OpaquePointer arguments)
{
  __int128 *v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void (*v26)(void **, uint64_t);
  void **v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(void **, uint64_t);
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  uint64_t v51;
  id v52;
  uint64_t v53;
  double v54;
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
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void (*v76)(void **, uint64_t);
  void (*v77)(void **, uint64_t);
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void **v106;
  _QWORD *v107;
  void *v108;
  void **v109;
  id v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  _BYTE *v115;
  _QWORD *v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t *v127;
  int v128;
  uint64_t v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  uint64_t v133;
  int64_t v134;
  const UInt8 *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  int64_t v139;
  const UInt8 *v140;
  uint64_t v141;
  int64_t v142;
  const UInt8 *v143;
  uint64_t v144;
  _DWORD *v145;
  _DWORD *v146;
  _BYTE *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void (*v153)(uint64_t *);
  void *v154;
  uint64_t v155;
  unint64_t v156;
  unint64_t v157;
  uint64_t v158;
  char *v159;
  char *v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  _BYTE *v166;
  uint64_t v167;
  void **v168;
  void (*v169)(void **, uint64_t);
  _QWORD *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t *v173;
  _QWORD *rawValue;
  char *v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;
  uint64_t v179;
  unsigned int v180;
  uint64_t aBlock;
  uint64_t v182;
  uint64_t (*v183)(uint64_t, uint64_t);
  void *v184;
  uint64_t (*v185)(uint64_t *);
  uint64_t v186;
  uint64_t v187;

  rawValue = arguments._rawValue;
  v2 = v1;
  v187 = *MEMORY[0x1E0C80C00];
  v163 = sub_1AF3E74FC();
  v162 = *(_QWORD *)(v163 - 8);
  MEMORY[0x1E0C80A78](v163);
  v161 = (char *)&v148 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD90);
  MEMORY[0x1E0C80A78](v4);
  v166 = (char *)&v148 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = sub_1AF3E7718();
  v164 = *(_QWORD *)(v165 - 8);
  MEMORY[0x1E0C80A78](v165);
  v160 = (char *)&v148 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v172 = type metadata accessor for TrimNote(0);
  MEMORY[0x1E0C80A78](v172);
  v173 = (uint64_t *)((char *)&v148 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v167 = sub_1AF3E78EC();
  v169 = *(void (**)(void **, uint64_t))(v167 - 8);
  MEMORY[0x1E0C80A78](v167);
  v168 = (void **)((char *)&v148 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v170 = (_QWORD *)type metadata accessor for TrimOptions(0);
  v171 = *(v170 - 1);
  v9 = *(_QWORD **)(v171 + 64);
  v10 = MEMORY[0x1E0C80A78](v170);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v148 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BDA0);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v148 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v148 - v17;
  v19 = v2[1];
  v176 = *v2;
  v177 = v19;
  v178 = *((_QWORD *)v2 + 4);
  v20 = v176;
  v21 = swift_allocObject();
  v22 = v2[1];
  *(_OWORD *)(v21 + 16) = *v2;
  *(_OWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 48) = *((_QWORD *)v2 + 4);
  swift_bridgeObjectRetain();
  v23 = (uint64_t)rawValue;
  swift_bridgeObjectRetain();
  sub_1AF3D2AEC((uint64_t)&v176);
  v24 = (uint64_t)v175;
  sub_1AF3CEA70(v20, *((uint64_t *)&v20 + 1), v23, (uint64_t)sub_1AF3D2AE4, v21, (uint64_t)v18);
  v25 = (void *)v24;
  if (v24)
    goto LABEL_14;
  v26 = v169;
  v27 = v168;
  rawValue = v9;
  v158 = (uint64_t)&v148 - (((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v159 = v12;
  sub_1AF3D2B20((uint64_t)v18, (uint64_t)v16);
  v28 = v170;
  if ((*(unsigned int (**)(char *, uint64_t, _QWORD *))(v171 + 48))(v16, 1, v170) == 1)
  {
    sub_1AF3C1760((uint64_t)v18, &qword_1EEE3BDA0);
    v29 = (uint64_t)v16;
LABEL_4:
    sub_1AF3C1760(v29, &qword_1EEE3BDA0);
    return;
  }
  v175 = v18;
  v30 = (uint64_t)v16;
  v31 = (uint64_t)v159;
  sub_1AF3D2B68(v30, (uint64_t)v159);
  aBlock = sub_1AF3E77CC();
  v182 = v32;
  sub_1AF3E78E0();
  v157 = sub_1AF347C60();
  v33 = sub_1AF3E7CAC();
  v34 = (void (*)(void **, uint64_t))*((_QWORD *)v26 + 1);
  v34(v27, v167);
  swift_bridgeObjectRelease();
  if (!v33)
  {
    __break(1u);
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  v35 = ktrace_file_open((const char *)(v33 + 32), 0);
  swift_bridgeObjectRelease();
  if (!v35)
  {
    type metadata accessor for TrimError(0);
    sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
    v25 = (void *)swift_allocError();
    v45 = v44;
    v46 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD70) + 48);
    v47 = sub_1AF3E7808();
    v48 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 16))(v45, v31, v47);
    *(_DWORD *)(v45 + v46) = MEMORY[0x1AF45C330](v48);
LABEL_11:
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    v43 = v31;
    goto LABEL_12;
  }
  v36 = sub_1AF3CDF50(v35);
  v169 = v34;
  v38 = v37;
  v39 = v36;
  LODWORD(aBlock) = 0;
  v180 = 0;
  v40 = ktrace_file_timebase(v35, &aBlock, &v180);
  if (v40)
  {
    v41 = v40;
    sub_1AF3D1E44();
    v25 = (void *)swift_allocError();
    *(_QWORD *)v42 = 0x65736162656D6974;
    *(_QWORD *)(v42 + 8) = 0xE800000000000000;
    *(_DWORD *)(v42 + 16) = v41;
    swift_willThrow();
    goto LABEL_9;
  }
  v149 = v35;
  v154 = 0;
  v53 = sub_1AF3BEA00(aBlock, v180);
  v156 = v38;
  v155 = v39;
  if (v38 < v39)
  {
    __break(1u);
    JUMPOUT(0x1AF3D10FCLL);
  }
  v151 = v53;
  v54 = sub_1AF3BE9D0(v38 - v39, v53);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B458);
  v55 = swift_allocObject();
  v56 = MEMORY[0x1E0DEB070];
  *(_OWORD *)(v55 + 16) = xmmword_1AF3EB020;
  v57 = MEMORY[0x1E0DEB100];
  *(_QWORD *)(v55 + 56) = v56;
  *(_QWORD *)(v55 + 64) = v57;
  *(double *)(v55 + 32) = v54;
  sub_1AF3E78D4();
  v153 = (void (*)(uint64_t *))*((_QWORD *)&v177 + 1);
  v152 = v178;
  v58 = sub_1AF3E7808();
  sub_1AF344878(&qword_1EEE3BD68, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0138], MEMORY[0x1E0DF0148]);
  v59 = (uint64_t)v159;
  v148 = v58;
  aBlock = sub_1AF3E8018();
  v182 = v60;
  sub_1AF3E7970();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  sub_1AF3E7970();
  v61 = aBlock;
  v150 = v182;
  v62 = v59 + *((int *)v28 + 6);
  sub_1AF3CE310(*(_QWORD *)v62, *(_BYTE *)(v62 + 8));
  v64 = v63;
  v65 = v28;
  v67 = v66;
  v68 = v65;
  v69 = v59 + *((int *)v65 + 7);
  sub_1AF3CE310(*(_QWORD *)v69, *(_BYTE *)(v69 + 8));
  v70 = v173;
  v71 = v150;
  *v173 = v61;
  v70[1] = v71;
  v70[2] = v64;
  v70[3] = v67;
  v70[4] = v72;
  v70[5] = v73;
  swift_storeEnumTagMultiPayload();
  v153(v70);
  sub_1AF3C7498((uint64_t)v70, type metadata accessor for TrimNote);
  v74 = v151;
  v75 = v154;
  sub_1AF3CE070(v155, v156, v151, *(_QWORD *)v62, *(_BYTE *)(v62 + 8));
  v25 = v75;
  if (v75)
  {
    v43 = v59;
    goto LABEL_12;
  }
  v77 = (void (*)(void **, uint64_t))v76;
  sub_1AF3CE070(v155, v156, v74, *(_QWORD *)v69, *(_BYTE *)(v69 + 8));
  v79 = (uint64_t)v175;
  v80 = v78;
  if ((unint64_t)v77 >= v78)
  {
    type metadata accessor for TrimError(0);
    sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
    v25 = (void *)swift_allocError();
    *v90 = 0xD000000000000028;
    v90[1] = 0x80000001AF3F35D0;
    v90[2] = v77;
    v90[3] = v80;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    sub_1AF3C7498(v59, type metadata accessor for TrimOptions);
    v49 = v79;
    goto LABEL_13;
  }
  v156 = v78;
  v81 = *((int *)v68 + 5);
  v31 = v59;
  v82 = v59 + v81;
  aBlock = sub_1AF3E77CC();
  v182 = v83;
  sub_1AF3E78E0();
  v84 = sub_1AF3E7CAC();
  v169(v27, v167);
  swift_bridgeObjectRelease();
  if (!v84)
  {
    __break(1u);
    JUMPOUT(0x1AF3D12ACLL);
  }
  v85 = v149;
  v86 = ktrace_file_create(v149, (char *)(v84 + 32));
  swift_bridgeObjectRelease();
  v87 = v148;
  v88 = v158;
  if (!v86)
  {
    type metadata accessor for TrimError(0);
    sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
    v25 = (void *)swift_allocError();
    v92 = v91;
    v93 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD70) + 48);
    v94 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v87 - 8) + 16))(v92, v82, v87);
    *(_DWORD *)(v92 + v93) = MEMORY[0x1AF45C330](v94);
    goto LABEL_11;
  }
  v89 = (uint64_t)v166;
  sub_1AF3CF7E4(v85, (uint64_t)v166);
  v95 = v164;
  v96 = v165;
  v97 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v164 + 48))(v89, 1, v165);
  v169 = v77;
  v170 = v86;
  v155 = v82;
  if (v97 != 1)
  {
    v111 = v160;
    (*(void (**)(char *, uint64_t, uint64_t))(v95 + 32))(v160, v89, v96);
    v112 = sub_1AF3E76F4();
    v114 = v113;
    (*(void (**)(char *, uint64_t))(v95 + 8))(v111, v96);
    sub_1AF3E752C();
    swift_allocObject();
    sub_1AF3E7520();
    (*(void (**)(char *, _QWORD, uint64_t))(v162 + 104))(v161, *MEMORY[0x1E0CAE110], v163);
    sub_1AF3E7508();
    aBlock = v112;
    v182 = v114;
    sub_1AF3D2F94();
    sub_1AF3E7514();
    v124 = v123;
    v154 = 0;
    swift_bridgeObjectRelease();
    __asm { BR              X10 }
  }
  v154 = 0;
  sub_1AF3C1760(v89, &qword_1EEE3BD90);
  v98 = swift_allocObject();
  *(_QWORD *)(v98 + 16) = 0;
  v168 = (void **)(v98 + 16);
  v99 = swift_allocObject();
  *(_QWORD *)(v99 + 16) = MEMORY[0x1E0DEE9D8];
  v167 = v99 + 16;
  v100 = swift_allocObject();
  *(_BYTE *)(v100 + 16) = 0;
  v166 = (_BYTE *)(v100 + 16);
  sub_1AF3C79F4(v31, v88, type metadata accessor for TrimOptions);
  v101 = (*(unsigned __int8 *)(v171 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v171 + 80);
  v102 = ((unint64_t)rawValue + v101 + 7) & 0xFFFFFFFFFFFFFFF8;
  v103 = (v102 + 15) & 0xFFFFFFFFFFFFFFF8;
  v104 = v31;
  v105 = swift_allocObject();
  *(_QWORD *)(v105 + 16) = v156;
  *(_QWORD *)(v105 + 24) = v99;
  sub_1AF3D2B68(v158, v105 + v101);
  *(_QWORD *)(v105 + v102) = v100;
  v106 = (void **)v99;
  v107 = v170;
  *(_QWORD *)(v105 + v103) = v170;
  *(_QWORD *)(v105 + ((v103 + 15) & 0xFFFFFFFFFFFFFFF8)) = v98;
  v185 = sub_1AF3D2CD8;
  v186 = v105;
  aBlock = MEMORY[0x1E0C809B0];
  v182 = 1107296256;
  v183 = sub_1AF3D137C;
  v184 = &block_descriptor_1;
  v108 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  ktrace_file_iterate(v149, 0, (uint64_t)v108);
  _Block_release(v108);
  v109 = v168;
  swift_beginAccess();
  v25 = *v109;
  if (*v109)
  {
    v110 = v25;
    swift_willThrow();
    swift_release();
    swift_release();
    swift_release();
    ktrace_file_close(v107);
    v43 = v104;
    goto LABEL_12;
  }
  v165 = v98;
  v168 = v106;
  v171 = v100;
  v115 = v166;
  swift_beginAccess();
  if ((*v115 & 1) == 0)
  {
    v179 = v156;
    ktrace_file_append_chunk((uint64_t)v107, 32775, 0, 1, (UInt8 *)&v179, 8);
  }
  v116 = (_QWORD *)v167;
  swift_beginAccess();
  rawValue = (_QWORD *)*v116;
  v117 = rawValue[2];
  v118 = 0;
  if (v117 < 2 || rawValue[6] >= (unint64_t)v169)
    goto LABEL_42;
  v119 = rawValue + 11;
  v120 = 1;
  while (1)
  {
    v121 = *v119;
    v119 += 5;
    if (v121 >= (unint64_t)v169)
      break;
    v122 = v120 + 1;
    if (__OFADD__(v120, 1))
      goto LABEL_67;
    ++v120;
    if (v122 == v117)
      goto LABEL_41;
  }
  if (!v120)
    goto LABEL_41;
  v118 = v120 - 1;
  if ((uint64_t)v117 < v120 - 1)
  {
LABEL_70:
    __break(1u);
    JUMPOUT(0x1AF3D1294);
  }
  if (v120 < 1)
  {
    __break(1u);
LABEL_41:
    v118 = 0;
  }
LABEL_42:
  if (v118 == v117)
  {
LABEL_59:
    v144 = (uint64_t)v173;
    (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v148 - 8) + 16))(v173, v155);
    swift_storeEnumTagMultiPayload();
    v153((uint64_t *)v144);
    sub_1AF3C7498(v144, type metadata accessor for TrimNote);
    swift_release();
    swift_release();
    swift_release();
    ktrace_file_close(v170);
    sub_1AF3C7498((uint64_t)v159, type metadata accessor for TrimOptions);
    v29 = (uint64_t)v175;
    goto LABEL_4;
  }
  swift_bridgeObjectRetain();
  v125 = 5 * v118;
  v126 = v117;
  while (1)
  {
    if (v118 >= v126)
      goto LABEL_66;
    v127 = (uint64_t *)rawValue[v125 + 4];
    v128 = LOBYTE(rawValue[v125 + 5]);
    v129 = rawValue[v125 + 6];
    v130 = rawValue[v125 + 7];
    v131 = rawValue[v125 + 8];
    if (LOBYTE(rawValue[v125 + 5]))
      break;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BDB0);
    v137 = swift_allocObject();
    *(_QWORD *)(v137 + 16) = v127;
    *(_BYTE *)(v137 + 24) = 0;
    *(_QWORD *)(v137 + 32) = v129;
    *(_QWORD *)(v137 + 40) = v130;
    *(_BYTE *)(v137 + 48) = v131;
    *(_QWORD *)(v137 + 56) = 8;
    v138 = ktrace_chunk_size_t(v127);
    v139 = v138 - 8;
    if (__OFSUB__(v138, 8))
      goto LABEL_69;
    v140 = ktrace_chunk_map_data(v127, 8uLL, v139);
    if (!v140)
    {
LABEL_60:
      swift_deallocPartialClassInstance();
      type metadata accessor for TrimError(0);
      sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
      v25 = (void *)swift_allocError();
      v146 = v145;
      *v145 = ktrace_chunk_tag((uint64_t)v127);
      v146[1] = 0;
      goto LABEL_64;
    }
    *(_QWORD *)(v137 + 64) = v140;
    *(_QWORD *)(v137 + 72) = v139 / 32;
    v136 = v154;
    sub_1AF3CD390((uint64_t)v170, (uint64_t)v169, v156, (uint64_t)sub_1AF3D13CC, 0);
LABEL_56:
    v154 = v136;
    if (v136)
    {
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      ktrace_file_close(v170);
      sub_1AF3C7498((uint64_t)v159, type metadata accessor for TrimOptions);
      sub_1AF3C1760((uint64_t)v175, &qword_1EEE3BDA0);
      v25 = v154;
      goto LABEL_14;
    }
    v126 = v117;
    ++v118;
    swift_release();
    v125 += 5;
    if (v117 == v118)
    {
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  if (v128 == 4)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BDA8);
    v141 = swift_allocObject();
    *(_QWORD *)(v141 + 16) = v127;
    *(_BYTE *)(v141 + 24) = 4;
    *(_QWORD *)(v141 + 32) = v129;
    *(_QWORD *)(v141 + 40) = v130;
    *(_BYTE *)(v141 + 48) = v131;
    *(_QWORD *)(v141 + 56) = 0;
    v142 = ktrace_chunk_size_t(v127);
    v143 = ktrace_chunk_map_data(v127, 0, v142);
    if (!v143)
      goto LABEL_60;
    *(_QWORD *)(v141 + 64) = v143;
    *(_QWORD *)(v141 + 72) = v142 / 48;
    v136 = v154;
    sub_1AF3CD654((uint64_t)v170, (uint64_t)v169, v156, (uint64_t)sub_1AF3D13CC, 0);
    goto LABEL_56;
  }
  if (v128 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BDB8);
    v132 = swift_allocObject();
    *(_QWORD *)(v132 + 16) = v127;
    *(_BYTE *)(v132 + 24) = 1;
    *(_QWORD *)(v132 + 32) = v129;
    *(_QWORD *)(v132 + 40) = v130;
    *(_BYTE *)(v132 + 48) = v131;
    *(_QWORD *)(v132 + 56) = 8;
    v133 = ktrace_chunk_size_t(v127);
    v134 = v133 - 8;
    if (__OFSUB__(v133, 8))
      goto LABEL_68;
    v135 = ktrace_chunk_map_data(v127, 8uLL, v134);
    if (!v135)
      goto LABEL_60;
    *(_QWORD *)(v132 + 64) = v135;
    *(_QWORD *)(v132 + 72) = v134 / 64;
    v136 = v154;
    sub_1AF3CD0CC((uint64_t)v170, (uint64_t)v169, v156, (uint64_t)sub_1AF3D13C4, 0);
    goto LABEL_56;
  }
  type metadata accessor for TrimError(0);
  sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
  v25 = (void *)swift_allocError();
  *v147 = v128;
LABEL_64:
  swift_storeEnumTagMultiPayload();
  swift_willThrow();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  ktrace_file_close(v170);
LABEL_9:
  v43 = (uint64_t)v159;
LABEL_12:
  sub_1AF3C7498(v43, type metadata accessor for TrimOptions);
  v49 = (uint64_t)v175;
LABEL_13:
  sub_1AF3C1760(v49, &qword_1EEE3BDA0);
LABEL_14:
  v50 = (void (*)(uint64_t))*((_QWORD *)&v177 + 1);
  v51 = (uint64_t)v173;
  *v173 = (uint64_t)v25;
  swift_storeEnumTagMultiPayload();
  v52 = v25;
  v50(v51);
  sub_1AF3C7498(v51, type metadata accessor for TrimNote);
  swift_willThrow();
}

uint64_t sub_1AF3D12CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void (*v9)(_QWORD *);
  uint64_t v11;

  v6 = type metadata accessor for TrimNote(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (uint64_t *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(void (**)(_QWORD *))(a3 + 24);
  *v8 = a1;
  v8[1] = a2;
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  v9(v8);
  return sub_1AF3C7498((uint64_t)v8, type metadata accessor for TrimNote);
}

uint64_t sub_1AF3D137C(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);

  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a2) = v3(a2);
  swift_release();
  return a2 & 1;
}

uint64_t sub_1AF3D13C4(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_1AF3D13CC(_QWORD *a1)
{
  return *a1 & 0xFFFFFFFFFFFFFFLL;
}

char *sub_1AF3D13D8(char *result, int64_t a2, char a3, char *a4)
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
  size_t v14;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BDF0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 40 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v14);
  }
  swift_bridgeObjectRelease();
  return v10;
}

unsigned __int8 *sub_1AF3D14DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5)
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
  sub_1AF3D5250();
  swift_bridgeObjectRetain();
  v7 = sub_1AF3E7A24();
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
  v7 = sub_1AF3BD578();
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
    v9 = (unsigned __int8 *)sub_1AF3E7E38();
  }
LABEL_7:
  v13 = sub_1AF3D15CC(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_1AF3D15CC(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 v15;
  BOOL v16;
  uint64_t v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 *v21;
  unsigned int v22;
  char v23;
  unint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unint64_t v29;
  unsigned int v30;
  char v31;
  unint64_t v32;
  unsigned __int8 v33;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
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
              if (!is_mul_ok(v9, a3))
                return 0;
              v14 = v9 * a3;
              v15 = v11 + v12;
              v16 = v14 >= v15;
              v9 = v14 - v15;
              if (!v16)
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
      goto LABEL_67;
    }
    if (a2)
    {
      v26 = a3 + 48;
      v27 = a3 + 55;
      v28 = a3 + 87;
      if (a3 > 10)
      {
        v26 = 58;
      }
      else
      {
        v28 = 97;
        v27 = 65;
      }
      if (result)
      {
        v29 = 0;
        do
        {
          v30 = *result;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              v13 = 0;
              if (v30 < 0x61 || v30 >= v28)
                return (unsigned __int8 *)v13;
              v31 = -87;
            }
            else
            {
              v31 = -55;
            }
          }
          else
          {
            v31 = -48;
          }
          if (!is_mul_ok(v29, a3))
            return 0;
          v32 = v29 * a3;
          v33 = v30 + v31;
          v16 = __CFADD__(v32, v33);
          v29 = v32 + v33;
          if (v16)
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v29;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_67:
    __break(1u);
    return result;
  }
  v17 = a2 - 1;
  if (a2 == 1)
    return 0;
  v18 = a3 + 48;
  v19 = a3 + 55;
  v20 = a3 + 87;
  if (a3 > 10)
  {
    v18 = 58;
  }
  else
  {
    v20 = 97;
    v19 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v21 = result + 1;
  do
  {
    v22 = *v21;
    if (v22 < 0x30 || v22 >= v18)
    {
      if (v22 < 0x41 || v22 >= v19)
      {
        v13 = 0;
        if (v22 < 0x61 || v22 >= v20)
          return (unsigned __int8 *)v13;
        v23 = -87;
      }
      else
      {
        v23 = -55;
      }
    }
    else
    {
      v23 = -48;
    }
    if (!is_mul_ok(v9, a3))
      return 0;
    v24 = v9 * a3;
    v25 = v22 + v23;
    v16 = __CFADD__(v24, v25);
    v9 = v24 + v25;
    if (v16)
      return 0;
    ++v21;
    --v17;
  }
  while (v17);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1AF3D1848(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t result;
  char v13;
  _QWORD v14[2];
  char v15;

  if ((a4 & 0x1000000000000000) != 0)
  {
    result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v11 = (_QWORD *)sub_1AF3E7E38();
  }
  result = sub_1AF3D1E88((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

unint64_t sub_1AF3D1918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  unint64_t result;
  int v5;
  unsigned int is_64_bit;
  size_t v7;
  int v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  int v13;
  int v14;
  unint64_t v15;
  const char *v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  uint64_t v24;
  size_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v2 = (uint64_t *)a1;
  v39 = *MEMORY[0x1E0C80C00];
  result = ktrace_chunk_tag(a1);
  v5 = result;
  if ((_DWORD)result != 20982 && (_DWORD)result != 7936)
  {
    if ((_DWORD)result == 7680)
    {
      is_64_bit = ktrace_chunk_is_64_bit((uint64_t)v2);
      v7 = is_64_bit ? 64 : 32;
      result = ktrace_chunk_size((uint64_t)v2);
      if (result >= (v7 | 8))
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v8 = ktrace_chunk_copy_data(v2, 8, &v35, v7);
        if (v8)
        {
          v9 = v8;
          sub_1AF3CDC78();
          swift_allocError();
          v11 = 0xD000000000000017;
          v12 = "copying first raw event";
LABEL_30:
          *(_QWORD *)v10 = v11;
          *(_QWORD *)(v10 + 8) = (unint64_t)(v12 - 32) | 0x8000000000000000;
          *(_DWORD *)(v10 + 16) = v9;
LABEL_41:
          *(_BYTE *)(v10 + 20) = 1;
          return swift_willThrow();
        }
        v19 = is_64_bit;
        if (is_64_bit)
          v20 = v35;
        else
          v20 = v35 & 0xFFFFFFFFFFFFFFLL;
        v27 = ktrace_chunk_size_t(v2);
        if (!__OFSUB__(v27, v7))
        {
          result = ktrace_chunk_copy_data(v2, v27 - v7, &v35, v7);
          if ((_DWORD)result)
          {
            v14 = result;
            sub_1AF3CDC78();
            swift_allocError();
            v15 = 0xD000000000000016;
            v16 = "copying last raw event";
            goto LABEL_40;
          }
          v22 = 0;
          v21 = v35;
          if (!(_DWORD)v19)
            v21 = v35 & 0xFFFFFFFFFFFFFFLL;
LABEL_23:
          *(_QWORD *)a2 = v2;
          *(_QWORD *)(a2 + 8) = v19;
          *(_QWORD *)(a2 + 16) = v20;
          *(_QWORD *)(a2 + 24) = v21;
          *(_BYTE *)(a2 + 32) = v22;
          return result;
        }
        goto LABEL_55;
      }
    }
LABEL_22:
    v2 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v19 = 5;
    goto LABEL_23;
  }
  result = ktrace_chunk_is_64_bit((uint64_t)v2);
  if (v5 != 7936)
  {
    if (v5 == 20982)
    {
      result = ktrace_chunk_size((uint64_t)v2);
      if (result >= 0x30)
      {
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        v13 = ktrace_chunk_copy_data(v2, 0, &v35, 0x30uLL);
        if (v13)
        {
          v14 = v13;
          sub_1AF3CDC78();
          swift_allocError();
          v15 = 0xD00000000000001BLL;
          v16 = "copying first artrace event";
LABEL_40:
          *(_QWORD *)v10 = v15;
          *(_QWORD *)(v10 + 8) = (unint64_t)(v16 - 32) | 0x8000000000000000;
          *(_DWORD *)(v10 + 16) = v14;
          goto LABEL_41;
        }
        v28 = v35;
        memset(v34, 0, sizeof(v34));
        v29 = ktrace_chunk_size_t(v2);
        if (!__OFSUB__(v29, 48))
        {
          result = ktrace_chunk_copy_data(v2, v29 - 48, v34, 0x30uLL);
          if ((_DWORD)result)
          {
            v14 = result;
            sub_1AF3CDC78();
            swift_allocError();
            v15 = 0xD00000000000001ALL;
            v16 = "copying last artrace event";
            goto LABEL_40;
          }
          v22 = 0;
          v20 = v28 & 0xFFFFFFFFFFFFFFLL;
          v21 = *(_QWORD *)&v34[0] & 0xFFFFFFFFFFFFFFLL;
          v19 = 4;
          goto LABEL_23;
        }
        goto LABEL_56;
      }
    }
    goto LABEL_22;
  }
  v17 = result;
  if ((_DWORD)result)
    v18 = 64;
  else
    v18 = 32;
  if ((_DWORD)result)
    v19 = 3;
  else
    v19 = 2;
  result = ktrace_chunk_size((uint64_t)v2);
  if (result < 0xC)
    goto LABEL_22;
  v23 = (void *)swift_slowAlloc();
  v24 = ktrace_chunk_size_t(v2);
  if (__OFSUB__(v24, 12))
  {
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (v24 - 12 >= 64)
    v25 = 64;
  else
    v25 = v24 - 12;
  *(_QWORD *)&v34[0] = v25;
  v26 = ktrace_chunk_copy_data(v2, 12, v23, v25);
  if (v26)
  {
    v9 = v26;
    sub_1AF3CDC78();
    swift_allocError();
    v11 = 0xD00000000000001ELL;
    v12 = "copying first compressed event";
    goto LABEL_30;
  }
  bzero(&v35, 0x388uLL);
  ktrace_compressor_reset(&v35);
  type metadata accessor for ktrace_point(0);
  v30 = sub_1AF3E7AE4();
  *(_QWORD *)(v30 + 16) = 1;
  *(_OWORD *)(v30 + 64) = 0u;
  *(_OWORD *)(v30 + 80) = 0u;
  *(_OWORD *)(v30 + 48) = 0u;
  *(_OWORD *)(v30 + 32) = 0u;
  if (decompress_64((unsigned int *)&v35, (uint64_t)v23, (unint64_t *)v34, v30 + 32, v18) == v18)
  {
    v31 = *(_QWORD *)(v30 + 16);
    if (v17)
    {
      if (!v31)
      {
LABEL_57:
        __break(1u);
LABEL_58:
        __break(1u);
      }
      v20 = *(_QWORD *)(v30 + 32);
      result = swift_bridgeObjectRelease();
    }
    else
    {
      if (!v31)
        goto LABEL_58;
      v33 = *(_QWORD *)(v30 + 32);
      result = swift_bridgeObjectRelease();
      v20 = v33 & 0xFFFFFFFFFFFFFFLL;
    }
    v21 = 0;
    v22 = 1;
    goto LABEL_23;
  }
  sub_1AF3CDC78();
  swift_allocError();
  *(_QWORD *)v32 = 0xD000000000000022;
  *(_QWORD *)(v32 + 8) = 0x80000001AF3F37A0;
  *(_DWORD *)(v32 + 16) = 0;
  *(_BYTE *)(v32 + 20) = 0;
  swift_willThrow();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF3D1DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1AF3D1E44()
{
  unint64_t result;

  result = qword_1EEE3BD58;
  if (!qword_1EEE3BD58)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ED784, &_s3ErrON);
    atomic_store(result, (unint64_t *)&qword_1EEE3BD58);
  }
  return result;
}

uint64_t sub_1AF3D1E88(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  unsigned __int8 v31;
  BOOL v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  unint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned int v45;
  char v46;
  unint64_t v47;
  unsigned __int8 v48;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_1AF3BDA34(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_96;
  result = sub_1AF3E79B8();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_1AF3BDA34(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_1AF3BDA34(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_92;
  if (v17 < a3 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  result = sub_1AF3E79B8();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v18 < v15)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v33 = a6 + 48;
        v34 = a6 + 55;
        v35 = a6 + 87;
        if (a6 > 10)
        {
          v33 = 58;
        }
        else
        {
          v35 = 97;
          v34 = 65;
        }
        if (v19)
        {
          v24 = 0;
          v36 = v19 + 1;
          v37 = result - 1;
          do
          {
            v38 = *v36;
            if (v38 < 0x30 || v38 >= v33)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                v29 = 0;
                if (v38 < 0x61 || v38 >= v35)
                  return v29;
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            if (!is_mul_ok(v24, a6))
              return 0;
            v40 = v24 * a6;
            v41 = v38 + v39;
            v32 = __CFADD__(v40, v41);
            v24 = v40 + v41;
            if (v32)
              return 0;
            ++v36;
            --v37;
          }
          while (v37);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v42 = a6 + 48;
      v43 = a6 + 55;
      v44 = a6 + 87;
      if (a6 > 10)
      {
        v42 = 58;
      }
      else
      {
        v44 = 97;
        v43 = 65;
      }
      if (v19)
      {
        v24 = 0;
        while (1)
        {
          v45 = *v19;
          if (v45 < 0x30 || v45 >= v42)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              v29 = 0;
              if (v45 < 0x61 || v45 >= v44)
                return v29;
              v46 = -87;
            }
            else
            {
              v46 = -55;
            }
          }
          else
          {
            v46 = -48;
          }
          if (!is_mul_ok(v24, a6))
            return 0;
          v47 = v24 * a6;
          v48 = v45 + v46;
          v32 = __CFADD__(v47, v48);
          v24 = v47 + v48;
          if (v32)
            return 0;
          ++v19;
          if (!--result)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 48;
      v22 = a6 + 55;
      v23 = a6 + 87;
      if (a6 > 10)
      {
        v21 = 58;
      }
      else
      {
        v23 = 97;
        v22 = 65;
      }
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              if (v27 < 0x61 || v27 >= v23)
                return v29;
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
          if (!is_mul_ok(v24, a6))
            return 0;
          v30 = v24 * a6;
          v31 = v27 + v28;
          v32 = v30 >= v31;
          v24 = v30 - v31;
          if (!v32)
            return 0;
          ++v25;
          if (!--v26)
            return v24;
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

unsigned __int8 *sub_1AF3D22A4(uint64_t a1, unint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  __int16 v38;
  char v39;
  uint64_t *v40;
  uint64_t *v41;
  char v42;
  char v43;
  uint64_t *v44;
  unint64_t v45;
  uint64_t v47;
  unint64_t v48;

  v3 = v2;
  if ((sub_1AF3E79E8() & 1) != 0)
  {
    v6 = sub_1AF39E4E8(1uLL, a1, a2);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    swift_bridgeObjectRelease();
    v13 = MEMORY[0x1AF45C4C8](v6, v8, v10, v12);
    v15 = v14;
    swift_bridgeObjectRelease();
    v16 = sub_1AF347DB0();
    v17 = sub_1AF3BB940(v13, v15, v16 & 1);
    if (!v2)
      v3 = (unsigned __int8 *)v17;
    goto LABEL_7;
  }
  if ((sub_1AF3E79E8() & 1) != 0)
  {
    v18 = sub_1AF39E4E8(1uLL, a1, a2);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    swift_bridgeObjectRelease();
    v25 = MEMORY[0x1AF45C4C8](v18, v20, v22, v24);
    v27 = v26;
    swift_bridgeObjectRelease();
    v28 = sub_1AF347DB0();
    v29 = sub_1AF3BB940(v25, v27, v28 & 1);
    if (!v2)
      v3 = (unsigned __int8 *)v29;
    goto LABEL_7;
  }
  if ((sub_1AF3E79E8() & 1) == 0)
  {
    type metadata accessor for TrimError(0);
    sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
    swift_allocError();
    v41 = v40;
    v47 = 0;
    v48 = 0xE000000000000000;
    sub_1AF3E7DE4();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    v3 = (unsigned __int8 *)&v47;
LABEL_18:
    sub_1AF3E7970();
    v45 = v48;
    *v41 = v47;
    v41[1] = v45;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return v3;
  }
  swift_bridgeObjectRetain();
  v30 = sub_1AF39E4E8(1uLL, a1, a2);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  swift_bridgeObjectRelease();
  if (!((v30 ^ v32) >> 14))
  {
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  v37 = sub_1AF3D1848(v30, v32, v34, v36, 10);
  if ((v38 & 0x100) != 0)
  {
    v3 = sub_1AF3D14DC(v30, v32, v34, v36, 10);
    v43 = v42;
    swift_bridgeObjectRelease();
    if ((v43 & 1) == 0)
      goto LABEL_7;
LABEL_17:
    type metadata accessor for TrimError(0);
    sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
    swift_allocError();
    v41 = v44;
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    v47 = a1;
    v48 = a2;
    v3 = (unsigned __int8 *)&v47;
    goto LABEL_18;
  }
  v3 = (unsigned __int8 *)v37;
  v39 = v38;
  swift_bridgeObjectRelease();
  if ((v39 & 1) != 0)
    goto LABEL_17;
LABEL_7:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t type metadata accessor for TrimError(uint64_t a1)
{
  return sub_1AF3D2A84(a1, (uint64_t *)&unk_1EEE40B40);
}

uint64_t sub_1AF3D2650(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(void))((char *)sub_1AF3D266C + 4 * byte_1AF3ED600[a2]))();
}

BOOL sub_1AF3D266C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return !a4 && a1 == a3;
}

uint64_t type metadata accessor for TrimOptions(uint64_t a1)
{
  return sub_1AF3D2A84(a1, qword_1EEE40B60);
}

uint64_t sub_1AF3D26E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF3D270C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1AF3D272C()
{
  return swift_deallocObject();
}

uint64_t sub_1AF3D273C(uint64_t a1, unint64_t a2)
{
  return sub_1AF3D2750(a1, a2);
}

uint64_t sub_1AF3D2750(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  char v7;
  uint64_t v8;
  char v9;

  swift_bridgeObjectRetain();
  result = (uint64_t)sub_1AF3D22A4(a1, a2);
  if (!v3)
  {
    v8 = result;
    v9 = v7;
    result = swift_beginAccess();
    *(_QWORD *)(v2 + 16) = v8;
    *(_BYTE *)(v2 + 24) = v9;
  }
  return result;
}

uint64_t sub_1AF3D27C4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF3D27E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRetain();
}

_QWORD *sub_1AF3D2848(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[2];
  v3 = a1[10];
  v4 = a1[12];
  swift_bridgeObjectRetain();
  sub_1AF39AF80(v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF39AF80(v3);
  sub_1AF39AF80(v4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1AF3D2914(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1[2];
  v3 = a1[10];
  v4 = a1[12];
  swift_bridgeObjectRelease();
  sub_1AF39AF90(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF39AF90(v3);
  sub_1AF39AF90(v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1AF3D29E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE3BD88;
  if (!qword_1EEE3BD88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE3BD80);
    result = MEMORY[0x1AF45E31C](MEMORY[0x1E0DEBF68], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE3BD88);
  }
  return result;
}

unint64_t sub_1AF3D2A2C()
{
  unint64_t result;

  result = qword_1EEE40530[0];
  if (!qword_1EEE40530[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EDBB4, &type metadata for TraceFileProvenance.CodingKeys);
    atomic_store(result, qword_1EEE40530);
  }
  return result;
}

uint64_t type metadata accessor for TrimNote(uint64_t a1)
{
  return sub_1AF3D2A84(a1, (uint64_t *)&unk_1EEE40B50);
}

uint64_t sub_1AF3D2A84(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AF3D2AB8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF3D2AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1AF3D12CC(a1, a2, v2 + 16);
}

uint64_t sub_1AF3D2AEC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_1AF3D2B20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BDA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF3D2B68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TrimOptions(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF3D2BAC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1AF3D2BD0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF3D2BF4()
{
  return swift_deallocObject();
}

uint64_t sub_1AF3D2C04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = type metadata accessor for TrimOptions(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_release();
  v4 = v0 + v3;
  v5 = sub_1AF3E7808();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v4 + *(int *)(v1 + 20), v5);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF3D2CD8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char **v18;
  char *v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _DWORD *v27;
  _DWORD *v28;
  int v29;
  int v30;
  unint64_t v31;
  _BYTE v32[40];
  __int128 v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  __int128 v39;

  v3 = type metadata accessor for TrimOptions(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(_QWORD *)(v1 + 24);
  v31 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v1 + v6);
  v10 = *(_QWORD *)(v1 + v7);
  v11 = *(_QWORD *)(v1 + ((v7 + 15) & 0xFFFFFFFFFFFFF8));
  sub_1AF3D1918((uint64_t)a1, (uint64_t)v32);
  sub_1AF3D1DFC((uint64_t)v32, (uint64_t)&v33);
  if (BYTE8(v33) == 5)
  {
    v14 = ktrace_chunk_tag((uint64_t)a1);
    v15 = v1 + v5 + *(int *)(v3 + 28);
    if (*(unsigned __int8 *)(v15 + 8) >= 3u)
    {
      if (*(_QWORD *)v15)
        v25 = 0;
      else
        v25 = v14 == 32775;
      if (v25)
        goto LABEL_6;
    }
    else if (v14 == 32775)
    {
LABEL_6:
      v16 = 1;
      swift_beginAccess();
      *(_BYTE *)(v9 + 16) = 1;
      return v16;
    }
    if (!ktrace_file_append(v10, a1))
    {
      type metadata accessor for TrimError(0);
      sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
      v26 = swift_allocError();
      v28 = v27;
      v29 = ktrace_chunk_tag((uint64_t)a1);
      v30 = MEMORY[0x1AF45C330]();
      *v28 = v29;
      v28[1] = v30;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      swift_beginAccess();
      v12 = *(void **)(v11 + 16);
      *(_QWORD *)(v11 + 16) = v26;

      return 0;
    }
    return 1;
  }
  v39 = v33;
  v17 = v34;
  v37 = v35;
  v38 = v36;
  if (v34 > v31)
    return 1;
  v18 = (char **)(v8 + 16);
  swift_beginAccess();
  v19 = *v18;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v18 = v19;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v19 = sub_1AF3D13D8(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
    *v18 = v19;
  }
  v22 = *((_QWORD *)v19 + 2);
  v21 = *((_QWORD *)v19 + 3);
  if (v22 >= v21 >> 1)
  {
    v19 = sub_1AF3D13D8((char *)(v21 > 1), v22 + 1, 1, v19);
    *v18 = v19;
  }
  *((_QWORD *)v19 + 2) = v22 + 1;
  v23 = &v19[40 * v22];
  *((_OWORD *)v23 + 2) = v39;
  *((_QWORD *)v23 + 6) = v17;
  v24 = v37;
  v23[64] = v38;
  *((_QWORD *)v23 + 7) = v24;
  return 1;
}

unint64_t sub_1AF3D2F94()
{
  unint64_t result;

  result = qword_1EEE3BDC0;
  if (!qword_1EEE3BDC0)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ED89C, &type metadata for TraceFileProvenance);
    atomic_store(result, (unint64_t *)&qword_1EEE3BDC0);
  }
  return result;
}

unint64_t sub_1AF3D2FE0()
{
  unint64_t result;

  result = qword_1EEE3BDC8;
  if (!qword_1EEE3BDC8)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3ED6D4, &type metadata for EventChunk.Kind);
    atomic_store(result, (unint64_t *)&qword_1EEE3BDC8);
  }
  return result;
}

uint64_t sub_1AF3D3028()
{
  return sub_1AF344878(&qword_1EEE3BD60, type metadata accessor for TrimError, (uint64_t)&unk_1AF3ED85C);
}

uint64_t sub_1AF3D3058()
{
  return swift_initClassMetadata2();
}

uint64_t getEnumTagSinglePayload for EventChunk(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 5;
  v5 = v3 - 5;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for EventChunk(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 4;
  }
  return result;
}

ValueMetadata *type metadata accessor for EventChunk()
{
  return &type metadata for EventChunk;
}

uint64_t sub_1AF3D3150()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for EventChunk.Err()
{
  return sub_1AF3D316C();
}

uint64_t sub_1AF3D316C()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s6ktrace10EventChunkV3ErrOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_DWORD *)a2 + 4);
  v6 = *((_BYTE *)a2 + 20);
  sub_1AF3D3150();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  return a1;
}

uint64_t assignWithCopy for EventChunk.Err(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_DWORD *)a2 + 4);
  v6 = *((_BYTE *)a2 + 20);
  sub_1AF3D3150();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  sub_1AF3D316C();
  return a1;
}

__n128 __swift_memcpy21_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_QWORD *)(a1 + 13) = *(_QWORD *)(a2 + 13);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for EventChunk.Err(uint64_t a1, uint64_t a2)
{
  int v3;
  char v4;

  v3 = *(_DWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 20);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 20) = v4;
  sub_1AF3D316C();
  return a1;
}

uint64_t getEnumTagSinglePayload for EventChunk.Err(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 21))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 20);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for EventChunk.Err(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 21) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 21) = 0;
    if (a2)
      *(_BYTE *)(result + 20) = -(char)a2;
  }
  return result;
}

uint64_t sub_1AF3D3330(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 20);
}

uint64_t sub_1AF3D3338(uint64_t result, char a2)
{
  *(_BYTE *)(result + 20) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EventChunk.Err()
{
  return &type metadata for EventChunk.Err;
}

uint64_t getEnumTagSinglePayload for EventChunk.Kind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for EventChunk.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AF3D3430 + 4 * byte_1AF3ED609[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1AF3D3464 + 4 * byte_1AF3ED604[v4]))();
}

uint64_t sub_1AF3D3464(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF3D346C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF3D3474);
  return result;
}

uint64_t sub_1AF3D3480(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF3D3488);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1AF3D348C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF3D3494(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EventChunk.Kind()
{
  return &type metadata for EventChunk.Kind;
}

uint64_t sub_1AF3D34B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s3ErrOwca(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy20_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t _s3ErrOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t _s3ErrOwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 20))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s3ErrOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 20) = 1;
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
    *(_BYTE *)(result + 20) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s3ErrOMa()
{
  return &_s3ErrON;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TrimLocation(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TrimLocation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1AF3D36C4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_1AF3D36DC(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrimLocation()
{
  return &type metadata for TrimLocation;
}

_QWORD *sub_1AF3D3704(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 3u:
        v7 = sub_1AF3E7808();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD70);
        *(_DWORD *)((char *)a1 + *(int *)(v8 + 48)) = *(_DWORD *)((char *)a2 + *(int *)(v8 + 48));
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
      case 5u:
        v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        v12 = a2[1];
        *a1 = *a2;
        a1[1] = v12;
        *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 8u:
        v13 = sub_1AF3E7808();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, a2, v13);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1AF3D38D4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 3:
    case 8:
      v3 = sub_1AF3E7808();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    case 4:
    case 5:
    case 6:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *sub_1AF3D394C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 3u:
      v6 = sub_1AF3E7808();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD70);
      *(_DWORD *)((char *)a1 + *(int *)(v7 + 48)) = *(_DWORD *)((char *)a2 + *(int *)(v7 + 48));
      goto LABEL_7;
    case 4u:
    case 5u:
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 6u:
      v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 8u:
      v10 = sub_1AF3E7808();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *sub_1AF3D3AE0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_1AF3C7498((uint64_t)a1, type metadata accessor for TrimError);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 3u:
        v6 = sub_1AF3E7808();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD70);
        *(_DWORD *)((char *)a1 + *(int *)(v7 + 48)) = *(_DWORD *)((char *)a2 + *(int *)(v7 + 48));
        goto LABEL_8;
      case 4u:
      case 5u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 6u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 8u:
        v8 = sub_1AF3E7808();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

char *sub_1AF3D3CAC(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 8)
  {
    v9 = sub_1AF3E7808();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload != 3 && EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_1AF3E7808();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD70);
    *(_DWORD *)&a1[*(int *)(v8 + 48)] = *(_DWORD *)&a2[*(int *)(v8 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *sub_1AF3D3DDC(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_1AF3C7498((uint64_t)a1, type metadata accessor for TrimError);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 8)
    {
      v9 = sub_1AF3E7808();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload != 3 && EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_1AF3E7808();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD70);
      *(_DWORD *)&a1[*(int *)(v8 + 48)] = *(_DWORD *)&a2[*(int *)(v8 + 48)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_1AF3D3F24()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char *v5;
  const char *v6;
  const char *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  result = sub_1AF3E7808();
  if (v1 <= 0x3F)
  {
    v2 = *(_QWORD *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v5 = &v4;
    v6 = "\b";
    v7 = "\b";
    swift_getTupleTypeLayout2();
    v8 = &v3;
    v9 = &unk_1AF3ED9A0;
    v10 = &unk_1AF3ED9A0;
    v11 = &unk_1AF3ED9B8;
    v12 = &unk_1AF3ED9D0;
    v13 = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for TrimNote(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  char *v7;
  char *v8;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v8[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = a2[1];
        *(_QWORD *)a1 = *a2;
        *((_QWORD *)a1 + 1) = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        v10 = *a2;
        v11 = v10;
        *(_QWORD *)a1 = v10;
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        v12 = a2[1];
        *(_QWORD *)a1 = *a2;
        *((_QWORD *)a1 + 1) = v12;
        v13 = a2[3];
        *((_QWORD *)a1 + 2) = a2[2];
        *((_QWORD *)a1 + 3) = v13;
        v14 = a2[4];
        v15 = a2[5];
        *((_QWORD *)a1 + 4) = v14;
        *((_QWORD *)a1 + 5) = v15;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        v16 = sub_1AF3E7808();
        (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

void destroy for TrimNote(id *a1)
{
  uint64_t v2;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      goto LABEL_4;
    case 1u:

      break;
    case 2u:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_4:
      swift_bridgeObjectRelease();
      break;
    case 3u:
      v2 = sub_1AF3E7808();
      (*(void (**)(id *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
      break;
    default:
      return;
  }
}

_QWORD *initializeWithCopy for TrimNote(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 1u:
      v7 = (void *)*a2;
      v8 = v7;
      *a1 = v7;
      goto LABEL_7;
    case 2u:
      v9 = a2[1];
      *a1 = *a2;
      a1[1] = v9;
      v10 = a2[3];
      a1[2] = a2[2];
      a1[3] = v10;
      v11 = a2[4];
      v12 = a2[5];
      a1[4] = v11;
      a1[5] = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 3u:
      v13 = sub_1AF3E7808();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, a2, v13);
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *assignWithCopy for TrimNote(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  id v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_1AF3C7498((uint64_t)a1, type metadata accessor for TrimNote);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 1u:
        v6 = (void *)*a2;
        v7 = v6;
        *a1 = v6;
        goto LABEL_8;
      case 2u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        a1[5] = a2[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 3u:
        v8 = sub_1AF3E7808();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for TrimNote(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v6 = sub_1AF3E7808();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for TrimNote(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1AF3C7498((uint64_t)a1, type metadata accessor for TrimNote);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      v6 = sub_1AF3E7808();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1AF3D4590()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AF3E7808();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

_QWORD *sub_1AF3D4614(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1AF3E7808();
    v8 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((_QWORD *)((char *)a1 + a3[5]), (_QWORD *)((char *)a2 + a3[5]), v7);
    v9 = a3[6];
    v10 = a3[7];
    v11 = (char *)a1 + v9;
    v12 = (char *)a2 + v9;
    *(_QWORD *)v11 = *(_QWORD *)v12;
    v11[8] = v12[8];
    v13 = (char *)a1 + v10;
    v14 = (char *)a2 + v10;
    *(_QWORD *)v13 = *(_QWORD *)v14;
    v13[8] = v14[8];
    *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  }
  return a1;
}

uint64_t sub_1AF3D46F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = sub_1AF3E7808();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t sub_1AF3D4758(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_1AF3E7808();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a3[7];
  v10 = a1 + v8;
  v11 = a2 + v8;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  v12 = a1 + v9;
  v13 = a2 + v9;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1AF3D4808(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1AF3E7808();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a1 + v8;
  v10 = (uint64_t *)(a2 + v8);
  v11 = *v10;
  *(_BYTE *)(v9 + 8) = *((_BYTE *)v10 + 8);
  *(_QWORD *)v9 = v11;
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  LOBYTE(v11) = *(_BYTE *)(v14 + 8);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *(_BYTE *)(v13 + 8) = v11;
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1AF3D48BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_1AF3E7808();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a3[7];
  v10 = a1 + v8;
  v11 = a2 + v8;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  v12 = a1 + v9;
  v13 = a2 + v9;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1AF3D496C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_1AF3E7808();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + a3[5], a2 + a3[5], v6);
  v8 = a3[6];
  v9 = a3[7];
  v10 = a1 + v8;
  v11 = a2 + v8;
  *(_QWORD *)v10 = *(_QWORD *)v11;
  *(_BYTE *)(v10 + 8) = *(_BYTE *)(v11 + 8);
  v12 = a1 + v9;
  v13 = a2 + v9;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = *(_BYTE *)(v13 + 8);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1AF3D4A1C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF3D4A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_1AF3E7808();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 32));
  if (v9 >= 2)
    return ((v9 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_1AF3D4AB4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF3D4AC0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_1AF3E7808();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 32)) = a2 + 1;
  return result;
}

uint64_t sub_1AF3D4B38()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AF3E7808();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TraceFileProvenance()
{
  return &type metadata for TraceFileProvenance;
}

uint64_t destroy for Trimming()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for Trimming(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Trimming(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for Trimming(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for Trimming()
{
  return &type metadata for Trimming;
}

__n128 __swift_memcpy112_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t sub_1AF3D4D20(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 112))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t sub_1AF3D4D64(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 112) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

void type metadata accessor for ktrace_chunk(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BDD0);
}

void type metadata accessor for ktrace_point_64(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BDD8);
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

uint64_t sub_1AF3D4DF4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AF3D4E14(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for ktrace_point_32(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BDE0);
}

__n128 __swift_memcpy48_1(uint64_t a1, uint64_t a2)
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

uint64_t sub_1AF3D4E68(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AF3D4E88(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for artrace_ktrace_file_tracepoint64(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BDE8);
}

uint64_t storeEnumTagSinglePayload for TraceFileProvenance.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1AF3D4F14 + 4 * byte_1AF3ED642[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1AF3D4F34 + 4 * byte_1AF3ED647[v4]))();
}

_BYTE *sub_1AF3D4F14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1AF3D4F34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1AF3D4F3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1AF3D4F44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1AF3D4F4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1AF3D4F54(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TraceFileProvenance.CodingKeys()
{
  return &type metadata for TraceFileProvenance.CodingKeys;
}

unint64_t sub_1AF3D4F74()
{
  unint64_t result;

  result = qword_1EEE40C70[0];
  if (!qword_1EEE40C70[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EDB8C, &type metadata for TraceFileProvenance.CodingKeys);
    atomic_store(result, qword_1EEE40C70);
  }
  return result;
}

unint64_t sub_1AF3D4FBC()
{
  unint64_t result;

  result = qword_1EEE40D80;
  if (!qword_1EEE40D80)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EDAFC, &type metadata for TraceFileProvenance.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE40D80);
  }
  return result;
}

unint64_t sub_1AF3D5004()
{
  unint64_t result;

  result = qword_1EEE40D88[0];
  if (!qword_1EEE40D88[0])
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EDB24, &type metadata for TraceFileProvenance.CodingKeys);
    atomic_store(result, qword_1EEE40D88);
  }
  return result;
}

BOOL sub_1AF3D5048(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_OWORD *);
  unint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v2 = *(uint64_t (**)(_OWORD *))(v1 + 16);
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  return v2(v7) > v3;
}

BOOL sub_1AF3D50A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_OWORD *);
  unint64_t v3;
  uint64_t v4;
  __int128 v5;
  _OWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v2 = *(uint64_t (**)(_OWORD *))(v1 + 16);
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v5;
  v7[2] = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  return v2(v7) > v3;
}

BOOL sub_1AF3D5100(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  unint64_t v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = *(_QWORD *)(v1 + 32);
  v5 = *a1;
  v6 = *(_OWORD *)(a1 + 1);
  v7 = a1[3];
  return v2(&v5) > v3;
}

BOOL sub_1AF3D5154(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  unint64_t v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = *(_QWORD *)(v1 + 40);
  v5 = *a1;
  v6 = *(_OWORD *)(a1 + 1);
  v7 = a1[3];
  return v2(&v5) > v3;
}

BOOL sub_1AF3D51A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD *);
  unint64_t v3;
  __int128 v4;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;

  v2 = *(uint64_t (**)(_QWORD *))(v1 + 16);
  v3 = *(_QWORD *)(v1 + 32);
  v6[0] = *(_QWORD *)a1;
  v6[1] = *(_QWORD *)(a1 + 8);
  v4 = *(_OWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 16);
  v8 = v4;
  return v2(v6) > v3;
}

BOOL sub_1AF3D51FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD *);
  unint64_t v3;
  __int128 v4;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;

  v2 = *(uint64_t (**)(_QWORD *))(v1 + 16);
  v3 = *(_QWORD *)(v1 + 40);
  v6[0] = *(_QWORD *)a1;
  v6[1] = *(_QWORD *)(a1 + 8);
  v4 = *(_OWORD *)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 16);
  v8 = v4;
  return v2(v6) > v3;
}

unint64_t sub_1AF3D5250()
{
  unint64_t result;

  result = qword_1EEE3BDF8;
  if (!qword_1EEE3BDF8)
  {
    result = MEMORY[0x1AF45E31C](MEMORY[0x1E0DEBB10], MEMORY[0x1E0DEBAF0]);
    atomic_store(result, (unint64_t *)&qword_1EEE3BDF8);
  }
  return result;
}

void type metadata accessor for ktrace_point(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BE00);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1AF45E2B0](a1, v6, a5);
}

uint64_t sub_1AF3D52D4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AF3D52F4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for ktrace_chunk.__Unnamed_union___Anonymous_field9(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BE08);
}

uint64_t sub_1AF3D5344(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AF3D5364(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 56) = v3;
  return result;
}

void type metadata accessor for ktrace_chunk_array(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BE10);
}

void type metadata accessor for ktrace_chunk.__Unnamed_union___Anonymous_field2(uint64_t a1)
{
  sub_1AF399D84(a1, &qword_1EEE3BE18);
}

void AmendmentError.errorDescription.getter()
{
  __asm { BR              X10 }
}

unint64_t sub_1AF3D5408()
{
  sub_1AF3E7DE4();
  swift_bridgeObjectRelease();
  sub_1AF3E7970();
  return 0xD000000000000013;
}

void sub_1AF3D55CC(void *a1, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 4:
      swift_bridgeObjectRelease();
      break;
    case 3:

      break;
    default:
      return;
  }
}

uint64_t Amending.toolName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Amending.interactive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t Amending.notify.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_retain();
  return v1;
}

uint64_t Amending.init(toolName:interactive:notify:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  *(_QWORD *)(a6 + 40) = 0;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Amending.amend(arguments:)(Swift::OpaquePointer arguments)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  void (*v22)(_QWORD);
  unint64_t v23;
  void *v24;
  __int128 *v25;
  BOOL (*v26)(uint64_t *);
  void (*v27)(__int128 *);
  id v28;
  BOOL (*v29)(uint64_t *);
  _QWORD *v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  int v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int *v64;
  int *v65;
  int v66;
  int v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  FILE *v77;
  FILE *v78;
  FILE *v79;
  uint64_t *v80;
  uint64_t *v81;
  uint64_t v82;
  void **v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  dispatch_semaphore_t v88;
  uint64_t v89;
  __int128 v90;
  int *v91;
  void *v92;
  void (*v93)(_QWORD);
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  __int128 v97;
  unint64_t v98;
  void *v99;
  char *v100;
  char *v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  id v106;
  __int128 v107;
  __int128 v108;
  __n128 v109;
  int *v110;
  uint64_t v111;
  uint64_t v112;
  int v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  Swift::OpaquePointer v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  Class isa;
  NSObject *v126;
  NSObject *v127;
  char *v128;
  unsigned __int8 *rawValue;
  void (*v130)(_QWORD);
  unint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  _OWORD v169[5];
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint64_t v173;

  rawValue = (unsigned __int8 *)arguments._rawValue;
  v3 = sub_1AF3E7820();
  v121 = *(_QWORD *)(v3 - 8);
  v122 = v3;
  MEMORY[0x1E0C80A78](v3);
  v120 = (char *)&v110 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1AF3E7B8C();
  isa = v5[-1].isa;
  v126 = v5;
  MEMORY[0x1E0C80A78](v5);
  v127 = ((char *)&v110 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v123 = sub_1AF3E7B74();
  MEMORY[0x1E0C80A78](v123);
  v124 = (char *)&v110 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1AF3E7838();
  v118 = *(_QWORD *)(v8 - 8);
  v119 = v8;
  MEMORY[0x1E0C80A78](v8);
  v128 = (char *)&v110 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v1[1];
  v157 = *v1;
  v158 = v10;
  v159 = v1[2];
  v11 = (char *)swift_allocObject();
  *((_QWORD *)v11 + 2) = MEMORY[0x1E0DEE9E8];
  *((_QWORD *)v11 + 3) = MEMORY[0x1E0DEE9D8];
  v11[32] = 0;
  v13 = *((_QWORD *)&v157 + 1);
  v12 = v157;
  v14 = (_OWORD *)swift_allocObject();
  v15 = v1[1];
  v14[1] = *v1;
  v14[2] = v15;
  v14[3] = v1[2];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1AF3D2AEC((uint64_t)&v157);
  v16 = sub_1AF39D7DC();
  v17 = sub_1AF39D7E8();
  v18 = sub_1AF39D7E8();
  v109.n128_u64[1] = v17;
  *((_QWORD *)&v108 + 1) = v14;
  v109.n128_u64[0] = (unint64_t)v16;
  *(_QWORD *)&v108 = sub_1AF3D7124;
  *(_QWORD *)&v107 = 0xD000000000000049;
  *((_QWORD *)&v107 + 1) = 0x80000001AF3F3480;
  sub_1AF39D7F4(v12, v13, (uint64_t)sub_1AF3D6EF0, (uint64_t)v11, 0xD000000000000039, 0x80000001AF3F38B0, 0, 0, (uint64_t)&v148, v107, 0, v108, v109, v18);
  swift_retain();
  v19 = sub_1AF347DB0();
  sub_1AF39B1D8(6579297, 0xE300000000000000, 0xD000000000000017, 0x80000001AF3F38F0, 0, 0, v19 & 1, (uint64_t)sub_1AF3D7170, (uint64_t)v11);
  swift_release();
  swift_retain();
  v20 = sub_1AF347DB0();
  sub_1AF39B0B8(0x656D697265707865, 0xEC0000006C61746ELL, 0xD000000000000026, 0x80000001AF3F3910, 0, 0, v20 & 1, (uint64_t)sub_1AF3D7344, (uint64_t)v11);
  swift_release();
  v21 = v153;
  swift_retain();
  sub_1AF39AF90(v21);
  *(_QWORD *)&v153 = sub_1AF3D7388;
  *((_QWORD *)&v153 + 1) = v11;
  v169[0] = v148;
  v169[1] = v149;
  v169[2] = v150;
  v169[3] = v151;
  v169[4] = v152;
  *(_QWORD *)&v170 = sub_1AF3D7388;
  *((_QWORD *)&v170 + 1) = v11;
  v171 = v154;
  v172 = v155;
  v173 = v156;
  v162 = v150;
  v163 = v151;
  v160 = v148;
  v161 = v149;
  v168 = v156;
  v166 = v154;
  v167 = v155;
  v164 = v152;
  v165 = v170;
  sub_1AF3D2848(v169);
  v22 = v130;
  v23 = sub_1AF39C080((uint64_t)rawValue);
  v24 = v22;
  if (v22)
  {
    sub_1AF3D2914(v169);
    v25 = v169;
LABEL_3:
    sub_1AF3D2914(v25);
    swift_release();
    v26 = 0;
LABEL_4:
    v27 = (void (*)(__int128 *))*((_QWORD *)&v158 + 1);
    v148 = (unint64_t)v24;
    LOBYTE(v149) = 1;
    v28 = v24;
    v27(&v148);

    swift_willThrow();
    v29 = v26;
LABEL_5:
    sub_1AF39AF90((uint64_t)v29);
    return;
  }
  v30 = (_QWORD *)v23;
  v130 = (void (*)(_QWORD))(v11 + 16);
  sub_1AF3D2914(v169);
  if (!v30)
  {
    sub_1AF3D2914(v169);
    swift_release();
    v29 = 0;
    goto LABEL_5;
  }
  v31 = v30[2];
  if (!v31)
  {
    swift_bridgeObjectRelease();
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v38 = 0xD000000000000024;
    *(_QWORD *)(v38 + 8) = 0x80000001AF3F3B20;
    *(_BYTE *)(v38 + 16) = 0;
    swift_willThrow();
    v145 = v154;
    v146 = v155;
    v147 = v156;
    v141 = v150;
    v142 = v151;
    v143 = v152;
    v144 = v153;
    v139 = v148;
    v140 = v149;
    v25 = &v139;
    goto LABEL_3;
  }
  rawValue = (unsigned __int8 *)v11;
  v33 = v30 + 4;
  v32 = v30[4];
  if (v31 != 1)
  {
    *(_QWORD *)&v139 = 0;
    *((_QWORD *)&v139 + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    v136 = 0xD000000000000011;
    v137 = 0x80000001AF3F3540;
    if (v30[2] < v31)
    {
      __break(1u);
      goto LABEL_49;
    }
    *(_QWORD *)&v139 = v30;
    *((_QWORD *)&v139 + 1) = v30 + 4;
    *(_QWORD *)&v140 = 1;
    *((_QWORD *)&v140 + 1) = (2 * v31) | 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BD80);
    sub_1AF3B82B0((unint64_t *)&qword_1EEE3BD88, &qword_1EEE3BD80, MEMORY[0x1E0DEBF68]);
    sub_1AF3E7898();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    v39 = v136;
    v40 = v137;
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v41 = v39;
    *(_QWORD *)(v41 + 8) = v40;
    *(_BYTE *)(v41 + 16) = 0;
LABEL_15:
    swift_willThrow();
LABEL_21:
    v145 = v154;
    v146 = v155;
    v147 = v156;
    v141 = v150;
    v142 = v151;
    v143 = v152;
    v144 = v153;
    v139 = v148;
    v140 = v149;
    v25 = &v139;
    goto LABEL_3;
  }
  v34 = v30[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35 = (_QWORD *)*((_QWORD *)&v159 + 1);
  if (*((_QWORD *)&v159 + 1))
  {
    v36 = v32;
    v37 = (uint64_t)v130;
    goto LABEL_17;
  }
  v36 = v32;
  v42 = sub_1AF3E7910();
  v35 = (_QWORD *)ktrace_file_open((const char *)(v42 + 32), 1);
  swift_release();
  v37 = (uint64_t)v130;
  if (!v35)
  {
    *(_QWORD *)&v139 = 0;
    *((_QWORD *)&v139 + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    v136 = v32;
    v137 = v34;
    v48 = sub_1AF3E7970();
    v49 = MEMORY[0x1AF45C330](v48);
    if (!strerror(v49))
    {
LABEL_60:
      __break(1u);
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    sub_1AF3E797C();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    v50 = v136;
    v51 = v137;
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v52 = v50;
    *(_QWORD *)(v52 + 8) = v51;
    *(_BYTE *)(v52 + 16) = 1;
    goto LABEL_15;
  }
LABEL_17:
  if (ktrace_file_get_format((uint64_t)v35) != 4)
  {
    *(_QWORD *)&v139 = 0;
    *((_QWORD *)&v139 + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v139 = v36;
    *((_QWORD *)&v139 + 1) = v34;
    sub_1AF3E7970();
    v44 = v139;
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_OWORD *)v45 = v44;
    *(_BYTE *)(v45 + 16) = 1;
    swift_willThrow();
LABEL_20:
    ktrace_file_close(v35);
    goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v43 = swift_bridgeObjectRetain();
  v46 = sub_1AF3C179C(v43);
  swift_bridgeObjectRelease();
  v138 = v46;
  v47 = swift_bridgeObjectRetain();
  v53 = sub_1AF3D6C44(v47, v37, &v138);
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v53 + 16))
  {
    swift_bridgeObjectRelease();
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v62 = 0xD000000000000024;
    *(_QWORD *)(v62 + 8) = 0x80000001AF3F3AF0;
    *(_BYTE *)(v62 + 16) = 0;
    swift_willThrow();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v116 = v53;
  v135 = 0;
  v54 = swift_allocObject();
  *(_QWORD *)(v54 + 16) = &v135;
  v55 = swift_allocObject();
  *(_QWORD *)(v55 + 16) = sub_1AF3D7574;
  *(_QWORD *)(v55 + 24) = v54;
  *(_QWORD *)&v141 = sub_1AF3D75B0;
  *((_QWORD *)&v141 + 1) = v55;
  v56 = v35;
  v33 = (_QWORD *)MEMORY[0x1E0C809B0];
  *(_QWORD *)&v139 = MEMORY[0x1E0C809B0];
  v2 = 1107296256;
  *((_QWORD *)&v139 + 1) = 1107296256;
  *(_QWORD *)&v140 = sub_1AF3D6E9C;
  *((_QWORD *)&v140 + 1) = &block_descriptor_2;
  v57 = (uint64_t)_Block_copy(&v139);
  swift_retain();
  swift_release();
  v117._rawValue = v56;
  v58 = ktrace_file_header_iterate((uint64_t)v56, 0, v57);
  _Block_release((const void *)v57);
  LOBYTE(v57) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v57 & 1) != 0)
  {
    __break(1u);
    goto LABEL_60;
  }
  if (v58)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)&v139 = 0;
    *((_QWORD *)&v139 + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    v131 = 0xD00000000000001DLL;
    v132 = 0x80000001AF3F3990;
    if (strerror(v58))
    {
      sub_1AF3E797C();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      v59 = v131;
      v60 = v132;
      sub_1AF3D7520();
      v24 = (void *)swift_allocError();
      *(_QWORD *)v61 = v59;
      *(_QWORD *)(v61 + 8) = v60;
LABEL_29:
      *(_BYTE *)(v61 + 16) = 2;
      swift_willThrow();
LABEL_41:
      swift_bridgeObjectRelease();
      ktrace_file_close(v117._rawValue);
      v145 = v154;
      v146 = v155;
      v147 = v156;
      v141 = v150;
      v142 = v151;
      v143 = v152;
      v144 = v153;
      v139 = v148;
      v140 = v149;
      sub_1AF3D2914(&v139);
      swift_release();
      v26 = sub_1AF3D7574;
      goto LABEL_4;
    }
    goto LABEL_61;
  }
  v63 = v135;
  if (!v135)
  {
    swift_bridgeObjectRelease();
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v61 = 0xD000000000000024;
    *(_QWORD *)(v61 + 8) = 0x80000001AF3F39B0;
    goto LABEL_29;
  }
  v64 = (int *)ktrace_session_create_with_flags(0);
  if (!v64)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)&v139 = 0;
    *((_QWORD *)&v139 + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    v72 = swift_bridgeObjectRelease();
    v131 = 0xD00000000000002ALL;
    v132 = 0x80000001AF3F39E0;
    v73 = MEMORY[0x1AF45C330](v72);
    if (!strerror(v73))
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    sub_1AF3E797C();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    v74 = v131;
    v75 = v132;
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v76 = v74;
    *(_QWORD *)(v76 + 8) = v75;
    *(_BYTE *)(v76 + 16) = 2;
    swift_willThrow();
    v71 = v63;
LABEL_40:
    ktrace_machine_destroy(v71);
    goto LABEL_41;
  }
  v65 = v64;
  v115 = v63;
  v66 = ktrace_set_ktrace_file((uint64_t)v64, (uint64_t)v117._rawValue, 0);
  if (v66)
  {
    v67 = v66;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v139 = 0;
    *((_QWORD *)&v139 + 1) = 0xE000000000000000;
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    v131 = 0xD000000000000023;
    v132 = 0x80000001AF3F3A10;
    if (!strerror(v67))
    {
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    sub_1AF3E797C();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    v68 = v131;
    v69 = v132;
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v70 = v68;
    *(_QWORD *)(v70 + 8) = v69;
    goto LABEL_36;
  }
  sub_1AF3BAEE4(0x6C756E2F7665642FLL, 0xE90000000000006CLL, 4);
  if (!v77)
  {
    swift_bridgeObjectRelease();
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v70 = 0xD000000000000019;
    *(_QWORD *)(v70 + 8) = 0x80000001AF3F3A40;
LABEL_36:
    *(_BYTE *)(v70 + 16) = 2;
    swift_willThrow();
    v71 = v115;
    goto LABEL_40;
  }
  v110 = v65;
  v112 = v54;
  if ((v158 & 1) != 0)
  {
    v80 = sub_1AF3BAB10();
    swift_beginAccess();
    v79 = (FILE *)*v80;
    v81 = sub_1AF3BAAB4();
    swift_beginAccess();
    v78 = (FILE *)*v81;
  }
  else
  {
    v78 = v77;
    v79 = v77;
  }
  type metadata accessor for Reporter();
  v111 = sub_1AF39A1DC(v79, v78, 0x676E69646E656D41, 0xE800000000000000, 1);
LABEL_49:
  type metadata accessor for ProviderList();
  v114 = ProviderList.__allocating_init(machine:)(v115);
  v82 = *(_QWORD *)(v116 + 16);
  if (v82)
  {
    v113 = rawValue[32];
    v83 = (void **)(v116 + 48);
    v84 = (void *)v111;
    do
    {
      v86 = (uint64_t)*(v83 - 1);
      v85 = *v83;
      v87 = (uint64_t)*(v83 - 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_1AF392ED4(v87, v86, v85, v84, v113);
      v83 += 4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      --v82;
    }
    while (v82);
  }
  swift_bridgeObjectRelease();
  sub_1AF393A5C((uint64_t)v117._rawValue);
  sub_1AF3448B8(0, &qword_1EEE3BC68);
  sub_1AF3E782C();
  *(_QWORD *)&v139 = MEMORY[0x1E0DEE9D8];
  sub_1AF344878(&qword_1EEE3BC70, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BC78);
  sub_1AF3B82B0(&qword_1EEE3BC80, &qword_1EEE3BC78, MEMORY[0x1E0DEAF38]);
  sub_1AF3E7D78();
  (*((void (**)(NSObject *, _QWORD, NSObject *))isa + 13))(v127, *MEMORY[0x1E0DEF8D0], v126);
  v127 = sub_1AF3E7B98();
  v88 = dispatch_semaphore_create(0);
  v89 = swift_allocObject();
  v90 = v158;
  *(_OWORD *)(v89 + 16) = v157;
  *(_OWORD *)(v89 + 32) = v90;
  *(_OWORD *)(v89 + 48) = v159;
  v91 = v110;
  *(_QWORD *)(v89 + 64) = v110;
  *(_QWORD *)(v89 + 72) = v88;
  *(_QWORD *)&v141 = sub_1AF3D7608;
  *((_QWORD *)&v141 + 1) = v89;
  *(_QWORD *)&v139 = v33;
  *((_QWORD *)&v139 + 1) = v2;
  *(_QWORD *)&v140 = sub_1AF347CA4;
  *((_QWORD *)&v140 + 1) = &block_descriptor_15;
  v92 = _Block_copy(&v139);
  sub_1AF3D2AEC((uint64_t)&v157);
  v126 = v88;
  swift_release();
  ktrace_set_completion_handler((uint64_t)v91, v92);
  _Block_release(v92);
  ProviderList.configurePostprocessing(session:)((Swift::OpaquePointer)v91);
  v93 = (void (*)(_QWORD))*((_QWORD *)&v158 + 1);
  v94 = swift_bridgeObjectRetain();
  v95 = sub_1AF3B1188(v94);
  swift_bridgeObjectRelease();
  v139 = (unint64_t)v95;
  LOBYTE(v140) = 2;
  v130 = v93;
  v93(&v139);
  swift_release();
  if (!ktrace_session_has_callbacks(v91))
  {
    (*(void (**)(unint64_t, unint64_t))(*(_QWORD *)v111 + 224))(0xD000000000000029, 0x80000001AF3F3A90);
LABEL_58:
    v105 = v117._rawValue;
    v106 = v114;
    ProviderList.postprocessingComplete(file:)(v117);
    v139 = xmmword_1AF3ECC40;
    LOBYTE(v140) = 3;
    v130(&v139);

    swift_release();
    ktrace_machine_destroy(v115);
    swift_bridgeObjectRelease();
    ktrace_file_close(v105);
    v145 = v154;
    v146 = v155;
    v147 = v156;
    v141 = v150;
    v142 = v151;
    v143 = v152;
    v144 = v153;
    v139 = v148;
    v140 = v149;
    sub_1AF3D2914(&v139);
    swift_release();
    v29 = sub_1AF3D7574;
    goto LABEL_5;
  }
  sub_1AF3448B8(0, (unint64_t *)&qword_1EEE3B758);
  sub_1AF3E7BA4();
  swift_getObjectType();
  v96 = swift_allocObject();
  v97 = v158;
  *(_OWORD *)(v96 + 16) = v157;
  *(_OWORD *)(v96 + 32) = v97;
  *(_OWORD *)(v96 + 48) = v159;
  v98 = (unint64_t)v110;
  *(_QWORD *)(v96 + 64) = v110;
  *(_QWORD *)&v141 = sub_1AF3D769C;
  *((_QWORD *)&v141 + 1) = v96;
  *(_QWORD *)&v139 = v33;
  *((_QWORD *)&v139 + 1) = v2;
  *(_QWORD *)&v140 = sub_1AF347CA4;
  *((_QWORD *)&v140 + 1) = &block_descriptor_21;
  v99 = _Block_copy(&v139);
  sub_1AF3D2AEC((uint64_t)&v157);
  v100 = v128;
  sub_1AF3E782C();
  v101 = v120;
  sub_1AF344798();
  sub_1AF3E7BB0();
  _Block_release(v99);
  (*(void (**)(char *, uint64_t))(v121 + 8))(v101, v122);
  (*(void (**)(char *, uint64_t))(v118 + 8))(v100, v119);
  swift_release();
  sub_1AF3E7BC8();
  if (!ktrace_start(v98, v127))
  {
    sub_1AF3E7BEC();
    sub_1AF3E7BBC();
    swift_unknownObjectRelease();
    goto LABEL_58;
  }
  *(_QWORD *)&v139 = 0;
  *((_QWORD *)&v139 + 1) = 0xE000000000000000;
  sub_1AF3E7DE4();
  swift_bridgeObjectRelease();
  v133 = 0xD000000000000024;
  v134 = 0x80000001AF3F3AC0;
  if (strerror(0))
  {
    sub_1AF3E797C();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    v102 = v133;
    v103 = v134;
    sub_1AF3D7520();
    v24 = (void *)swift_allocError();
    *(_QWORD *)v104 = v102;
    *(_QWORD *)(v104 + 8) = v103;
    *(_BYTE *)(v104 + 16) = 2;
    swift_willThrow();
    swift_release();

    swift_unknownObjectRelease();
    ktrace_machine_destroy(v115);
    swift_bridgeObjectRelease();
    ktrace_file_close(v117._rawValue);
    v145 = v154;
    v146 = v155;
    v147 = v156;
    v141 = v150;
    v142 = v151;
    v143 = v152;
    v144 = v153;
    v139 = v148;
    v140 = v149;
    sub_1AF3D2914(&v139);
    swift_release();
    v26 = sub_1AF3D7574;
    goto LABEL_4;
  }
LABEL_64:
  __break(1u);
}

uint64_t sub_1AF3D6C44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v8;
  int64_t v9;
  int v10;
  int v11;
  char v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v39;
  int v40;
  int64_t v41;
  uint64_t v42;

  v4 = v3;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = MEMORY[0x1E0DEE9D8];
  if (!v5)
    return v6;
  v8 = a1;
  v42 = MEMORY[0x1E0DEE9D8];
  sub_1AF3AB0C0(0, v5, 0);
  v6 = v42;
  v9 = sub_1AF3B420C(v8);
  v11 = v10;
  v13 = v12 & 1;
  v37 = v8 + 56;
  result = swift_beginAccess();
  v35 = v8;
  v36 = a2;
  while ((v9 & 0x8000000000000000) == 0 && v9 < 1 << *(_BYTE *)(v8 + 32))
  {
    if (((*(_QWORD *)(v37 + (((unint64_t)v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
      goto LABEL_17;
    if (*(_DWORD *)(v8 + 36) != v11)
      goto LABEL_18;
    v39 = v13;
    v40 = v11;
    v41 = v5;
    v15 = v6;
    v16 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * v9);
    v6 = *v16;
    v17 = v16[1];
    v18 = *(unsigned __int8 *)(a2 + 16);
    swift_bridgeObjectRetain();
    v19 = v18;
    v20 = v4;
    v21 = sub_1AF3A620C(v6, v17, v19, a3);
    if (v4)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v6;
    }
    v25 = v22;
    if (!v22)
    {
      sub_1AF3D7520();
      swift_allocError();
      *(_QWORD *)v34 = v6;
      *(_QWORD *)(v34 + 8) = v17;
      *(_BYTE *)(v34 + 16) = 4;
      swift_willThrow();
      swift_release();
      return v6;
    }
    v26 = v21;
    v27 = v23;
    v28 = v24;
    swift_bridgeObjectRelease();
    v6 = v15;
    v30 = *(_QWORD *)(v15 + 16);
    v29 = *(_QWORD *)(v15 + 24);
    if (v30 >= v29 >> 1)
    {
      sub_1AF3AB0C0((char *)(v29 > 1), v30 + 1, 1);
      v6 = v15;
    }
    *(_QWORD *)(v6 + 16) = v30 + 1;
    v31 = v6 + 32 * v30;
    *(_QWORD *)(v31 + 32) = v26;
    *(_QWORD *)(v31 + 40) = v25;
    *(_QWORD *)(v31 + 48) = v27;
    *(_BYTE *)(v31 + 56) = v28 & 1;
    v8 = v35;
    result = sub_1AF3B42AC(v9, v40, v39 & 1, v35);
    v9 = result;
    v11 = v32;
    v13 = v33 & 1;
    v5 = v41 - 1;
    v4 = v20;
    a2 = v36;
    if (v41 == 1)
    {
      sub_1AF3B82A4(result, v32, v33 & 1);
      return v6;
    }
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1AF3D6E9C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2) & 1;
}

uint64_t sub_1AF3D6EC4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_1AF3D6EF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;

  swift_beginAccess();
  v1 = sub_1AF39163C(*(_BYTE *)(v0 + 32));
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (_QWORD *)(v1 + 64);
    v4 = (char *)MEMORY[0x1E0DEE9D8];
    do
    {
      if (*v3)
        sub_1AF3E7970();
      swift_bridgeObjectRetain();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      sub_1AF3E7970();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_1AF3413B8(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
      v6 = *((_QWORD *)v4 + 2);
      v5 = *((_QWORD *)v4 + 3);
      if (v6 >= v5 >> 1)
        v4 = sub_1AF3413B8((char *)(v5 > 1), v6 + 1, 1, v4);
      *((_QWORD *)v4 + 2) = v6 + 1;
      v7 = &v4[16 * v6];
      *((_QWORD *)v7 + 4) = 9;
      *((_QWORD *)v7 + 5) = 0xE100000000000000;
      v3 += 8;
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
  sub_1AF3B82B0((unint64_t *)&qword_1EEE3B478, &qword_1EEE3B470, MEMORY[0x1E0DEAF20]);
  sub_1AF3E7898();
  swift_bridgeObjectRelease();
  sub_1AF3E7DE4();
  swift_bridgeObjectRelease();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  return 0xD00000000000002DLL;
}

uint64_t sub_1AF3D711C()
{
  return objectdestroy_2Tm();
}

uint64_t sub_1AF3D7124(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(_QWORD *);
  _QWORD v5[2];
  char v6;

  v3 = *(void (**)(_QWORD *))(v2 + 40);
  v5[0] = a1;
  v5[1] = a2;
  v6 = 0;
  swift_bridgeObjectRetain();
  v3(v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF3D7170(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  char *v5;
  int64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v24[16];
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[5];

  v27[0] = 44;
  v27[1] = 0xE100000000000000;
  v25 = v27;
  swift_bridgeObjectRetain();
  v5 = sub_1AF38ECFC(0x7FFFFFFFFFFFFFFFLL, 1, sub_1AF390B60, (uint64_t)v24, a1, a2);
  v6 = *((_QWORD *)v5 + 2);
  if (v6)
  {
    v27[4] = v2;
    v27[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF38FDBC(0, v6, 0);
    v7 = (_QWORD *)v27[0];
    v8 = (uint64_t *)(v5 + 56);
    do
    {
      v10 = *(v8 - 3);
      v9 = *(v8 - 2);
      v11 = *(v8 - 1);
      v12 = *v8;
      swift_bridgeObjectRetain();
      v13 = MEMORY[0x1AF45C4C8](v10, v9, v11, v12);
      v15 = v14;
      swift_bridgeObjectRelease();
      v27[0] = v7;
      v17 = v7[2];
      v16 = v7[3];
      if (v17 >= v16 >> 1)
      {
        sub_1AF38FDBC((char *)(v16 > 1), v17 + 1, 1);
        v7 = (_QWORD *)v27[0];
      }
      v7[2] = v17 + 1;
      v18 = &v7[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
      v8 += 4;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  swift_beginAccess();
  v19 = v7[2];
  if (v19)
  {
    v20 = v7 + 5;
    do
    {
      v22 = *(v20 - 1);
      v21 = *v20;
      swift_bridgeObjectRetain();
      sub_1AF3AB50C(&v26, v22, v21);
      swift_bridgeObjectRelease();
      v20 += 2;
      --v19;
    }
    while (v19);
  }
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1AF3D7344()
{
  uint64_t v0;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v0 + 32) = 1;
  return result;
}

uint64_t sub_1AF3D7388(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v3 = v2;
  sub_1AF347C60();
  if ((sub_1AF3E7CB8() & 1) != 0)
  {
    swift_beginAccess();
    v6 = *(_QWORD *)(v2 + 24);
    swift_bridgeObjectRetain();
    result = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v3 + 24) = v6;
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1AF3413B8(0, *(_QWORD *)(v6 + 16) + 1, 1, (char *)v6);
      v6 = result;
      *(_QWORD *)(v3 + 24) = result;
    }
    v9 = *(_QWORD *)(v6 + 16);
    v8 = *(_QWORD *)(v6 + 24);
    if (v9 >= v8 >> 1)
    {
      result = (uint64_t)sub_1AF3413B8((char *)(v8 > 1), v9 + 1, 1, (char *)v6);
      v6 = result;
      *(_QWORD *)(v3 + 24) = result;
    }
    *(_QWORD *)(v6 + 16) = v9 + 1;
    v10 = v6 + 16 * v9;
    *(_QWORD *)(v10 + 32) = a1;
    *(_QWORD *)(v10 + 40) = a2;
  }
  else
  {
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3D7520();
    swift_allocError();
    *(_QWORD *)v11 = 0xD000000000000010;
    *(_QWORD *)(v11 + 8) = 0x80000001AF3F3B50;
    *(_BYTE *)(v11 + 16) = 0;
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_1AF3D7520()
{
  unint64_t result;

  result = qword_1EEE3BE20;
  if (!qword_1EEE3BE20)
  {
    result = MEMORY[0x1AF45E31C](&protocol conformance descriptor for AmendmentError, &type metadata for AmendmentError);
    atomic_store(result, (unint64_t *)&qword_1EEE3BE20);
  }
  return result;
}

uint64_t sub_1AF3D7564()
{
  return swift_deallocObject();
}

BOOL sub_1AF3D7574(uint64_t *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = *(uint64_t **)(v1 + 16);
  v3 = ktrace_machine_create(a1);
  *v2 = v3;
  return v3 == 0;
}

uint64_t sub_1AF3D75A0()
{
  return swift_deallocObject();
}

uint64_t sub_1AF3D75B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1AF3D75D4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1AF3D7608()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD *);
  _QWORD v4[2];
  char v5;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(void (**)(_QWORD *))(v0 + 40);
  v4[0] = 0;
  v4[1] = 0;
  v5 = 3;
  v2(v4);
  ktrace_session_destroy(v1);
  return sub_1AF3E7BF8();
}

uint64_t sub_1AF3D765C()
{
  return objectdestroy_2Tm();
}

uint64_t objectdestroy_2Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1AF3D769C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(__int128 *);
  __int128 v3;
  char v4;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(void (**)(__int128 *))(v0 + 40);
  v3 = xmmword_1AF3EDDF0;
  v4 = 3;
  v2(&v3);
  ktrace_end(v1, 0);
}

uint64_t initializeBufferWithCopyOfBuffer for AmendmentError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1AF3D7868(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1AF3D76F8);
}

id sub_1AF3D76F8(id result, id a2, char a3)
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 4:
      result = (id)swift_bridgeObjectRetain();
      break;
    case 3:
      result = result;
      break;
    default:
      return result;
  }
  return result;
}

void destroy for AmendmentError(uint64_t a1)
{
  sub_1AF3D55CC(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t *assignWithCopy for AmendmentError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1AF3D78C4(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1AF3D76F8, (void (*)(uint64_t, uint64_t, uint64_t))sub_1AF3D55CC);
}

uint64_t *assignWithTake for AmendmentError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF3D7930(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1AF3D55CC);
}

uint64_t getEnumTagSinglePayload for AmendmentError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AmendmentError(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AmendmentError()
{
  return &type metadata for AmendmentError;
}

uint64_t initializeBufferWithCopyOfBuffer for AmendmentNote(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_1AF3D7868(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1AF3D7808);
}

id sub_1AF3D7808(id result, id a2, char a3)
{
  if (a3 == 2)
    return (id)swift_bridgeObjectRetain();
  if (a3 != 1)
  {
    if (a3)
      return result;
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void destroy for AmendmentNote(uint64_t a1)
{
  sub_1AF3D7840(*(void **)a1, *(id *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_1AF3D7840(void *a1, id a2, char a3)
{
  if (a3 == 2)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    return;
  }
  if (a3 != 1)
  {
    if (a3)
      return;
    goto LABEL_4;
  }

}

uint64_t sub_1AF3D7868(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *a2;
  v6 = a2[1];
  v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for AmendmentNote(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_1AF3D78C4(a1, a2, a3, (void (*)(_QWORD, uint64_t, uint64_t))sub_1AF3D7808, (void (*)(uint64_t, uint64_t, uint64_t))sub_1AF3D7840);
}

uint64_t *sub_1AF3D78C4(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = *a2;
  v8 = a2[1];
  v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  v10 = *a1;
  v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  v12 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for AmendmentNote(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF3D7930(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1AF3D7840);
}

uint64_t *sub_1AF3D7930(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_BYTE *)(a2 + 16);
  v6 = *a1;
  v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v8 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for AmendmentNote(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AmendmentNote(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1AF3D7A00(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_1AF3D7A18(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AmendmentNote()
{
  return &type metadata for AmendmentNote;
}

uint64_t destroy for AmendingOptions()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s6ktrace15AmendingOptionsVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AmendingOptions(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for AmendingOptions(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AmendingOptions(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AmendingOptions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AmendingOptions()
{
  return &type metadata for AmendingOptions;
}

uint64_t initializeWithCopy for Amending(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for Amending(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
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

uint64_t assignWithTake for Amending(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for Amending(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Amending(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Amending()
{
  return &type metadata for Amending;
}

_QWORD *sub_1AF3D7DC4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1AF3D7DD0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1AF3D7DD8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1AF3D7DEC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1AF3D7E00@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1AF3D7E14(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1AF3D7E44@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1AF3D7E70@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1AF3D7E94(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1AF3D7EA8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1AF3D7EBC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1AF3D7ED0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1AF3D7EE4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1AF3D7EF8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1AF3D7F0C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1AF3D7F20()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *sub_1AF3D7F30(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1AF3D7F44@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_1AF3D7F54(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1AF3D7F68@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_1AF3DA650(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t type metadata accessor for RecordingOptions.Options(uint64_t a1)
{
  return sub_1AF3D2A84(a1, (uint64_t *)&unk_1EEE3BF00);
}

uint64_t sub_1AF3D7FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1AF3D8000(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  id v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v30 = a2;
  v31 = a3;
  v29 = a1;
  v24 = a4;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v25 = (uint64_t)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v24 - v8;
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v24 - v11;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v24 - v13;
  v15 = sub_1AF3E7694();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 1;
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  v28(v14, 1, 1, v15);
  v27 = (id)objc_opt_self();
  v26 = xmmword_1AF3EB020;
  do
  {
    if (v17 == 1000)
    {
      __break(1u);
LABEL_8:
      __break(1u);
      goto LABEL_9;
    }
    v32 = v30;
    v33 = v31;
    swift_bridgeObjectRetain();
    sub_1AF3E7970();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B458);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = v26;
    *(_QWORD *)(v18 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v18 + 64) = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v18 + 32) = v17;
    sub_1AF3E78D4();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3E7640();
    swift_bridgeObjectRelease();
    sub_1AF3D82F8((uint64_t)v14);
    v28(v12, 0, 1, v15);
    sub_1AF3478BC((uint64_t)v12, (uint64_t)v14, &qword_1EEE3B4B8);
    v19 = objc_msgSend(v27, sel_defaultManager);
    sub_1AF3C5B1C((uint64_t)v14, (uint64_t)v9);
    v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    if (v20(v9, 1, v15) == 1)
      goto LABEL_8;
    sub_1AF3E767C();
    v21 = (void *)sub_1AF3E78BC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v15);
    v22 = objc_msgSend(v19, sel_fileExistsAtPath_, v21);

    ++v17;
  }
  while ((v22 & 1) != 0);
  v23 = v25;
  sub_1AF3C5B1C((uint64_t)v14, v25);
  if (v20((char *)v23, 1, v15) != 1)
  {
    sub_1AF3D82F8((uint64_t)v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v24, v23, v15);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t sub_1AF3D82F8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AF3D8338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  void *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  id v33;
  id v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v37 = a1;
  v2 = v1;
  v40 = *MEMORY[0x1E0C80C00];
  v3 = type metadata accessor for RecordingOptions.Options(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_1AF3E7694();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v36 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v36 - v14;
  v16 = (uint64_t *)(v2 + *(int *)(v3 + 116));
  v17 = v16[1];
  if (!v17)
    __break(1u);
  v18 = *v16;
  swift_bridgeObjectRetain();
  sub_1AF3E7610();
  v19 = sub_1AF3E79F4();
  v38 = v7;
  if ((v19 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    v23 = sub_1AF3E761C();
    v25 = v24;
    sub_1AF3E7658();
    if (sub_1AF3E767C())
      v27 = 0;
    else
      v27 = v26 == 0xE000000000000000;
    if (v27)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v28 = sub_1AF3E8030();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0)
      {
        v29 = v38;
        (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v10, v13, v6);
LABEL_16:
        sub_1AF3D8000((uint64_t)v10, v23, v25, v37);
        swift_bridgeObjectRelease();
        v35 = *(void (**)(char *, uint64_t))(v29 + 8);
        v35(v10, v6);
        v35(v13, v6);
        return ((uint64_t (*)(char *, uint64_t))v35)(v15, v6);
      }
    }
    v33 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v34 = objc_msgSend(v33, sel_currentDirectoryPath);

    sub_1AF3E78C8();
    sub_1AF3E7610();
    swift_bridgeObjectRelease();
    v29 = v38;
    goto LABEL_16;
  }
  v39 = 0;
  v20 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v21 = (void *)sub_1AF3E78BC();
  v22 = objc_msgSend(v20, sel_fileExistsAtPath_isDirectory_, v21, &v39);

  if (v39 == 1)
    goto LABEL_13;
  sub_1AF3C79F4(v2, (uint64_t)v5, type metadata accessor for RecordingOptions.Options);
  if (v22)
  {
    v30 = *v5;
    sub_1AF3C7498((uint64_t)v5, type metadata accessor for RecordingOptions.Options);
    if ((v30 & 1) == 0)
    {
LABEL_13:
      type metadata accessor for KTraceRecordError();
      sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
      swift_allocError();
      *v31 = v18;
      v31[1] = v17;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v15, v6);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1AF3C7498((uint64_t)v5, type metadata accessor for RecordingOptions.Options);
  }
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v38 + 32))(v37, v15, v6);
}

uint64_t type metadata accessor for RecordingOptions(uint64_t a1)
{
  return sub_1AF3D2A84(a1, (uint64_t *)&unk_1EEE41190);
}

uint64_t sub_1AF3D87A0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v13;

  v3 = a3[2];
  if (!v3)
    return 0;
  v7 = a3[4] == a1 && a3[5] == a2;
  if (v7 || (sub_1AF3E8030() & 1) != 0)
    return 0;
  v9 = 0;
  v10 = a3 + 7;
  v11 = 1;
  while (1)
  {
    if (v3 == v11)
      return 0;
    ++v9;
    if (*(v10 - 1) == a1 && *v10 == a2)
      break;
    v13 = sub_1AF3E8030();
    result = v11++;
    v10 += 2;
    if ((v13 & 1) != 0)
      return result;
  }
  return v9;
}

uint64_t sub_1AF3D8884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  char v63;
  char v64;
  char v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  void *v71;
  unint64_t v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  _BYTE *v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uid_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  __n128 v109;
  void (*v110)(char *, uint64_t, uint64_t);
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _BYTE *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;
  char v148[8];
  _OWORD v149[8];
  uint64_t v150;
  uint64_t v151;

  v117 = a3;
  v5 = (int *)type metadata accessor for RecordingOptions.Options(0);
  MEMORY[0x1E0C80A78](v5);
  v113 = (uint64_t)&v110 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
  MEMORY[0x1E0C80A78](v7);
  v112 = (uint64_t)&v110 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RecordingOptions(0);
  v115 = *(_QWORD *)(v9 - 8);
  v116 = v9;
  MEMORY[0x1E0C80A78](v9);
  v124 = (uint64_t *)((char *)&v110 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = swift_allocBox();
  v13 = (uint64_t)v12;
  *v12 = 0;
  v14 = (char *)v12 + v5[5];
  v15 = sub_1AF3E7694();
  v110 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v111 = v15;
  v110(v14, 1, 1);
  v16 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v13 + v5[6]) = MEMORY[0x1E0DEE9D8];
  v118 = (_QWORD *)(v13 + v5[7]);
  *v118 = v16;
  *(_QWORD *)(v13 + v5[8]) = v16;
  v17 = v13 + v5[9];
  *(_DWORD *)v17 = 0;
  *(_BYTE *)(v17 + 4) = 1;
  v18 = v13 + v5[10];
  *(_QWORD *)v18 = 0;
  *(_BYTE *)(v18 + 8) = 1;
  *(_QWORD *)(v13 + v5[11]) = v16;
  *(_QWORD *)(v13 + v5[12]) = v16;
  v19 = v13 + v5[13];
  *(_QWORD *)v19 = 0;
  *(_BYTE *)(v19 + 8) = 1;
  *(_BYTE *)(v13 + v5[14]) = 0;
  *(_BYTE *)(v13 + v5[15]) = 0;
  *(_BYTE *)(v13 + v5[16]) = 1;
  v20 = (_QWORD *)(v13 + v5[17]);
  *v20 = 0;
  v20[1] = 0;
  v21 = (_QWORD *)(v13 + v5[18]);
  *v21 = 0;
  v21[1] = 0;
  v22 = v13 + v5[19];
  *(_QWORD *)v22 = 0;
  *(_BYTE *)(v22 + 8) = 1;
  *(_BYTE *)(v13 + v5[20]) = 0;
  v23 = v13 + v5[21];
  *(_DWORD *)v23 = 0;
  *(_BYTE *)(v23 + 4) = 1;
  v24 = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(v13 + v5[22]) = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)(v13 + v5[23]) = v24;
  *(_QWORD *)(v13 + v5[24]) = v16;
  *(_BYTE *)(v13 + v5[25]) = 0;
  *(_BYTE *)(v13 + v5[26]) = 0;
  *(_QWORD *)(v13 + v5[27]) = v16;
  v25 = v13 + v5[28];
  *(_QWORD *)v25 = 0;
  *(_BYTE *)(v25 + 8) = 1;
  v26 = (_QWORD *)(v13 + v5[29]);
  *v26 = 0;
  v26[1] = 0;
  v27 = (_QWORD *)(v13 + v5[30]);
  *v27 = 0x746C7561666564;
  v27[1] = 0xE700000000000000;
  v28 = swift_allocObject();
  v123 = v28;
  *(_BYTE *)(v28 + 16) = 0;
  v114 = (_BYTE *)(v28 + 16);
  sub_1AF3478BC(a1, (uint64_t)v148, &qword_1EEE3BC38);
  sub_1AF3478BC((uint64_t)v148, (uint64_t)&v151, &qword_1EEE3BC38);
  result = v151;
  if (v151)
  {
    v30 = sub_1AF3E797C();
    v119 = v31;
    v120 = v30;
    v32 = swift_allocObject();
    *(_QWORD *)(v32 + 16) = a2;
    v33 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v32 + 24) = *(_OWORD *)a1;
    *(_OWORD *)(v32 + 40) = v33;
    *(_OWORD *)(v32 + 56) = *(_OWORD *)(a1 + 32);
    *(_QWORD *)(v32 + 72) = *(_QWORD *)(a1 + 48);
    v34 = swift_allocObject();
    v125 = a1;
    v35 = v34;
    v36 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v34 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v34 + 32) = v36;
    *(_OWORD *)(v34 + 48) = *(_OWORD *)(a1 + 32);
    *(_QWORD *)(v34 + 64) = *(_QWORD *)(a1 + 48);
    sub_1AF344918(a1);
    sub_1AF344918(v125);
    swift_bridgeObjectRetain();
    v37 = sub_1AF39D7DC();
    v38 = sub_1AF39D7E8();
    v39 = sub_1AF39D7E8();
    v109.n128_u64[1] = v38;
    *((_QWORD *)&v108 + 1) = v35;
    v109.n128_u64[0] = (unint64_t)v37;
    *(_QWORD *)&v108 = sub_1AF3DABE0;
    *(_QWORD *)&v107 = 0xD000000000000049;
    *((_QWORD *)&v107 + 1) = 0x80000001AF3F3480;
    sub_1AF39D7F4(v120, v119, (uint64_t)sub_1AF3DABB0, v32, 0xD000000000000010, 0x80000001AF3F3BA0, 0, 0, (uint64_t)&v139, v107, 0, v108, v109, v39);
    *v124 = a2;
    v40 = *(_BYTE *)(v125 + 48);
    v121 = a2;
    if ((v40 & 1) != 0)
    {
      *(_QWORD *)&v130 = MEMORY[0x1E0DEE9D8];
      swift_bridgeObjectRetain();
      sub_1AF3D9EBC(0, 2, 0);
      v41 = v130;
      v43 = *(_QWORD *)(v130 + 16);
      v42 = *(_QWORD *)(v130 + 24);
      v44 = v42 >> 1;
      v45 = v43 + 1;
      if (v42 >> 1 <= v43)
      {
        sub_1AF3D9EBC((char *)(v42 > 1), v43 + 1, 1);
        v41 = v130;
        v42 = *(_QWORD *)(v130 + 24);
        v44 = v42 >> 1;
      }
      *(_QWORD *)(v41 + 16) = v45;
      v46 = v41 + 24 * v43;
      *(_OWORD *)(v46 + 32) = xmmword_1AF3ECC40;
      *(_BYTE *)(v46 + 48) = 0;
      v47 = v43 + 2;
      if (v44 <= v45)
      {
        sub_1AF3D9EBC((char *)(v42 > 1), v47, 1);
        v41 = v130;
      }
      *(_QWORD *)(v41 + 16) = v47;
      v48 = v41 + 24 * v45;
      *(_OWORD *)(v48 + 32) = xmmword_1AF3EDE00;
      *(_BYTE *)(v48 + 48) = 0;
      sub_1AF3D9FEC(v41);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_retain();
    sub_1AF39AFA0((uint64_t)sub_1AF3DACDC, v11);
    swift_release();
    swift_retain();
    sub_1AF39AFA0((uint64_t)sub_1AF3DAD68, v11);
    swift_release();
    swift_retain();
    v49 = sub_1AF347DB0();
    v120 = 0xD000000000000023;
    sub_1AF39B1D8(1851878512, 0xE400000000000000, 0xD000000000000023, 0x80000001AF3F3BC0, 0, 0, v49 & 1, (uint64_t)sub_1AF3DADF4, v11);
    swift_release();
    swift_retain();
    v50 = sub_1AF347DB0();
    sub_1AF39B1D8(6579297, 0xE300000000000000, 0xD00000000000002ALL, 0x80000001AF3F3BF0, 0, 0, v50 & 1, (uint64_t)sub_1AF3DAE7C, v11);
    swift_release();
    swift_retain();
    v51 = sub_1AF347DB0();
    sub_1AF39B1D8(1953066351, 0xE400000000000000, 0xD00000000000002CLL, 0x80000001AF3F3C20, 0, 0, v51 & 1, (uint64_t)sub_1AF3DB074, v11);
    swift_release();
    v52 = swift_allocObject();
    *(_QWORD *)(v52 + 16) = v123;
    *(_QWORD *)(v52 + 24) = v11;
    v53 = v144;
    swift_retain();
    swift_retain();
    sub_1AF39AF90(v53);
    *(_QWORD *)&v144 = sub_1AF3DB298;
    *((_QWORD *)&v144 + 1) = v52;
    swift_retain();
    v54 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD000000000000012, 0x80000001AF3F3C50, 0xD00000000000003BLL, 0x80000001AF3F3C70, 0, 0, v54 & 1, (uint64_t)sub_1AF3DB4B0, v11);
    swift_release();
    swift_retain();
    v55 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD000000000000010, 0x80000001AF3F3CB0, 0xD00000000000003ELL, 0x80000001AF3F3CD0, 0, 0, v55 & 1, (uint64_t)sub_1AF3DB5A8, v11);
    swift_release();
    swift_retain();
    v56 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD000000000000012, 0x80000001AF3F3D10, 0xD000000000000032, 0x80000001AF3F3D30, 0, 0, v56 & 1, (uint64_t)sub_1AF3DB6A0, v11);
    swift_release();
    swift_retain();
    v57 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD000000000000013, 0x80000001AF3F3D70, 0xD000000000000038, 0x80000001AF3F3D90, 0, 0, v57 & 1, (uint64_t)sub_1AF3DB8B8, v11);
    swift_release();
    swift_retain();
    v58 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD000000000000013, 0x80000001AF3F2990, 0xD00000000000002FLL, 0x80000001AF3F3DD0, 0, 0, v58 & 1, (uint64_t)sub_1AF3DB9BC, v11);
    swift_release();
    swift_retain();
    v59 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD00000000000001CLL, 0x80000001AF3F2970, 0xD000000000000041, 0x80000001AF3F3E00, 0, 0, v59 & 1, (uint64_t)sub_1AF3DBAEC, v11);
    swift_release();
    swift_retain();
    v60 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD000000000000015, 0x80000001AF3F3E50, 0xD000000000000037, 0x80000001AF3F3E70, 0, 0, v60 & 1, (uint64_t)sub_1AF3DBC9C, v11);
    swift_release();
    swift_retain();
    v61 = sub_1AF347DB0();
    sub_1AF39B0B8(0x746972777265766FLL, 0xE900000000000065, v120, 0x80000001AF3F3EB0, 0, 0, v61 & 1, (uint64_t)sub_1AF3DBD94, v11);
    swift_release();
    swift_retain();
    v62 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD000000000000012, 0x80000001AF3F3EE0, 0xD000000000000026, 0x80000001AF3F3F00, 0, 0, v62 & 1, (uint64_t)sub_1AF3DBDF0, v11);
    swift_release();
    swift_retain();
    v63 = sub_1AF347DB0();
    sub_1AF39B0B8(0x73736572706D6F63, 0xE800000000000000, 0xD000000000000021, 0x80000001AF3F3F30, 0, 0, v63 & 1, (uint64_t)sub_1AF3DC014, v11);
    swift_release();
    swift_retain();
    v64 = sub_1AF347DB0();
    sub_1AF39B0B8(0x73736572706D6F63, 0xEF676E697275642DLL, 0xD000000000000022, 0x80000001AF3F3F60, 0, 0, v64 & 1, (uint64_t)sub_1AF3DC078, v11);
    swift_release();
    swift_retain();
    v65 = sub_1AF347DB0();
    sub_1AF39B0B8(0x656D697265707865, 0xEC0000006C61746ELL, 0xD000000000000019, 0x80000001AF3F3F90, 0, 0, v65 & 1, (uint64_t)sub_1AF3DC0DC, v11);
    swift_release();
    v66 = (uint64_t *)sub_1AF39AF6C();
    swift_beginAccess();
    v67 = *v66;
    v68 = v66[1];
    swift_retain();
    swift_bridgeObjectRetain();
    v69 = sub_1AF347DB0();
    sub_1AF39B0B8(v67, v68, 0xD000000000000015, 0x80000001AF3F3FB0, 0, 0, v69 & 1, (uint64_t)sub_1AF3DC140, v11);
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    sub_1AF39B1D8(0xD000000000000012, 0x80000001AF3F3FD0, 0xD000000000000028, 0x80000001AF3F3FF0, 0, 0, 1, (uint64_t)sub_1AF3DC1A4, v11);
    swift_release();
    swift_retain();
    sub_1AF39B1D8(0xD000000000000015, 0x80000001AF3F4020, 0xD00000000000002BLL, 0x80000001AF3F4040, 0, 0, 1, (uint64_t)sub_1AF3DC344, v11);
    swift_release();
    swift_retain();
    sub_1AF39B1D8(0xD000000000000015, 0x80000001AF3F4070, 0xD000000000000025, 0x80000001AF3F4090, 0, 0, 1, (uint64_t)sub_1AF3DC3CC, v11);
    swift_release();
    swift_retain();
    sub_1AF39B0B8(0xD000000000000015, 0x80000001AF3F40C0, 0xD000000000000089, 0x80000001AF3F40E0, 0, 0, 1, (uint64_t)sub_1AF3DC454, v11);
    swift_release();
    swift_retain();
    sub_1AF39B1D8(0xD000000000000013, 0x80000001AF3F4170, 0xD000000000000049, 0x80000001AF3F4190, 0, 0, 1, (uint64_t)sub_1AF3DC4B8, v11);
    swift_release();
    swift_retain();
    sub_1AF39B0B8(0xD000000000000016, 0x80000001AF3F41E0, 0xD000000000000025, 0x80000001AF3F4200, 0, 0, 1, (uint64_t)sub_1AF3DC8A8, v11);
    swift_release();
    swift_retain();
    v70 = sub_1AF347DB0();
    sub_1AF39B1D8(0xD000000000000011, 0x80000001AF3F4230, 0xD000000000000040, 0x80000001AF3F4250, 0, 0, v70 & 1, (uint64_t)sub_1AF3DC908, v11);
    swift_release();
    v149[6] = v145;
    v149[7] = v146;
    v150 = v147;
    v149[2] = v141;
    v149[3] = v142;
    v149[4] = v143;
    v149[5] = v144;
    v149[0] = v139;
    v149[1] = v140;
    sub_1AF3D2848(v149);
    v71 = v122;
    v72 = sub_1AF39C080(v121);
    v73 = v71;
    if (v71)
    {
      swift_bridgeObjectRelease();
      sub_1AF3D2914(v149);
LABEL_11:
      v126 = v73;
      v74 = v73;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
      if (swift_dynamicCast())
      {

        v75 = v127;
        v76 = v128;
        v77 = v129;
        type metadata accessor for KTraceRecordError();
        sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
        swift_allocError();
        *(_QWORD *)v78 = v75;
        *(_QWORD *)(v78 + 8) = v76;
        *(_BYTE *)(v78 + 16) = v77;
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
      }
      sub_1AF3448F0(v125);

      goto LABEL_14;
    }
    v79 = v72;
    swift_bridgeObjectRelease();
    sub_1AF3D2914(v149);
    if (v79)
    {
      if (*(_QWORD *)(v79 + 16))
      {
        type metadata accessor for KTraceRecordError();
        sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
        v80 = swift_allocError();
        v82 = v81;
        *(_QWORD *)&v130 = v79;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
        sub_1AF390B14();
        v83 = sub_1AF3E7898();
        v85 = v84;
        swift_bridgeObjectRelease();
        *v82 = v83;
        v82[1] = v85;
        v73 = (void *)v80;
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        goto LABEL_11;
      }
      swift_bridgeObjectRelease();
      swift_beginAccess();
      if ((*(_BYTE *)(v13 + v5[26]) & 1) == 0 && *(_BYTE *)(v13 + v5[15]) == 1)
      {
        type metadata accessor for KTraceRecordError();
        sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
        swift_allocError();
        *v86 = 0xD000000000000011;
        v86[1] = 0x80000001AF3F42D0;
LABEL_32:
        swift_storeEnumTagMultiPayload();
        goto LABEL_33;
      }
      v87 = (uint64_t *)(v13 + v5[29]);
      v88 = v87[1];
      if (!v88)
      {
        type metadata accessor for KTraceRecordError();
        sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
        swift_allocError();
        *v96 = 0xD00000000000002ELL;
        v96[1] = 0x80000001AF3F42A0;
        goto LABEL_32;
      }
      v89 = *v87;
      v90 = v114;
      swift_beginAccess();
      if (*v90 == 1)
      {
        swift_bridgeObjectRetain();
        if ((sub_1AF3E79F4() & 1) == 0)
        {
          type metadata accessor for KTraceRecordError();
          sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
          swift_allocError();
          *v102 = v89;
          v102[1] = v88;
          goto LABEL_32;
        }
        swift_bridgeObjectRelease();
      }
      v91 = *(_QWORD *)(v13 + v5[22]);
      swift_bridgeObjectRetain();
      v92 = swift_bridgeObjectRetain();
      v93 = sub_1AF3C1AD0(v92, v91);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v93 & 1) == 0)
      {
        type metadata accessor for KTraceRecordError();
        sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
        swift_allocError();
        v98 = v97;
        v99 = *(_QWORD *)(v13 + v5[22]);
        swift_bridgeObjectRetain();
        v100 = swift_bridgeObjectRetain();
        v101 = sub_1AF3C5EC4(v100, v99);
        swift_bridgeObjectRelease();
        *v98 = v101;
        swift_storeEnumTagMultiPayload();
LABEL_33:
        swift_willThrow();
        sub_1AF3448F0(v125);
LABEL_14:
        v136 = v145;
        v137 = v146;
        v138 = v147;
        v132 = v141;
        v133 = v142;
        v134 = v143;
        v135 = v144;
        v130 = v139;
        v131 = v140;
        sub_1AF3D2914(&v130);
        swift_release();
        swift_release();
        return swift_bridgeObjectRelease();
      }
      v94 = v113;
      sub_1AF3C79F4(v13, v113, type metadata accessor for RecordingOptions.Options);
      v95 = v112;
      sub_1AF3D8338(v112);
      sub_1AF3C7498(v94, type metadata accessor for RecordingOptions.Options);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v110)(v95, 0, 1, v111);
      sub_1AF3D7FB8(v95, v13 + v5[5]);
      v103 = geteuid();
      v104 = (uint64_t)v124;
      if (v103)
      {
        type metadata accessor for KTraceRecordError();
        sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
        swift_allocError();
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        sub_1AF3448F0(v125);
        v136 = v145;
        v137 = v146;
        v138 = v147;
        v132 = v141;
        v133 = v142;
        v134 = v143;
        v135 = v144;
        v130 = v139;
        v131 = v140;
        sub_1AF3D2914(&v130);
        swift_release();
        swift_release();
        return swift_bridgeObjectRelease();
      }
      sub_1AF3448F0(v125);
      v105 = v116;
      sub_1AF3C79F4(v13, v104 + *(int *)(v116 + 20), type metadata accessor for RecordingOptions.Options);
      v136 = v145;
      v137 = v146;
      v138 = v147;
      v132 = v141;
      v133 = v142;
      v134 = v143;
      v135 = v144;
      v130 = v139;
      v131 = v140;
      sub_1AF3D2914(&v130);
      swift_release();
      swift_release();
      v106 = v117;
      sub_1AF3C79F4(v104, v117, type metadata accessor for RecordingOptions);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v115 + 56))(v106, 0, 1, v105);
      return sub_1AF3C7498(v104, type metadata accessor for RecordingOptions);
    }
    else
    {
      sub_1AF3448F0(v125);
      sub_1AF3D2914(v149);
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v115 + 56))(v117, 1, 1, v116);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1AF3D9E54(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1AF3B4560((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_1AF3B2200(v5);
  *a1 = v2;
  return result;
}

char *sub_1AF3D9EBC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1AF3D9ED8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1AF3D9ED8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BE48);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_1AF3D9FEC(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
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
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)sub_1AF3DA0D8((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_1AF3DA0D8(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BE48);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1AF3DA1EC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3BE50);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1AF3DA2EC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = sub_1AF3E7A24();
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
  v5 = sub_1AF3BD578();
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
    v7 = (unsigned __int8 *)sub_1AF3E7E38();
  }
LABEL_7:
  v11 = sub_1AF3DA3D0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_1AF3DA3D0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  uint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  uint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = (int)v8 * (uint64_t)(int)a3;
            if (v23 != (int)v23)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__OFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = (int)v28 * (uint64_t)(int)a3;
            if (v31 != (int)v31)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__OFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = (int)v8 * (uint64_t)(int)a3;
            if (v14 != (int)v14)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (__OFSUB__((_DWORD)v14, v15))
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1AF3DA650(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1AF3DA688(_QWORD *a1, int a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  int v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;
  int64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  unint64_t v36;
  _QWORD v37[43];
  char *v38[41];
  _QWORD v39[42];
  _QWORD *v40;

  v3 = v2;
  v6 = 0x746C7561666564;
  v7 = sub_1AF3E7694();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF3D87A0(0x6972657078652D2DLL, 0xEE006C61746E656DLL, a1);
  v12 = v11;
  v13 = sub_1AF3D87A0(0x6E616C702D2DLL, 0xE600000000000000, a1);
  if ((v14 & 1) == 0)
  {
    v15 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v15 < a1[2])
    {
      if ((v15 & 0x8000000000000000) == 0)
      {
        v16 = &a1[2 * v15];
        v6 = v16[4];
        v17 = v16[5];
        swift_bridgeObjectRetain();
        goto LABEL_7;
      }
LABEL_21:
      __break(1u);
      result = swift_release();
      __break(1u);
      return result;
    }
  }
  v17 = 0xE700000000000000;
LABEL_7:
  v18 = sub_1AF3A96F4((v12 & 1) == 0, a2 & 1);
  if (v2)
    return swift_bridgeObjectRelease();
  v35 = v12;
  v36 = v17;
  v40 = v18;
  swift_bridgeObjectRelease();
  v20 = v40[2];
  if (v20)
  {
    v29 = v6;
    v30 = a2;
    v31 = v10;
    v32 = v8;
    v33 = v7;
    v39[0] = MEMORY[0x1E0DEE9D8];
    v34 = 0;
    v21 = v40;
    sub_1AF38FDBC(0, v20, 0);
    v3 = v34;
    v22 = v39[0];
    v23 = v21 + 5;
    do
    {
      v24 = *(v23 - 1);
      v25 = *v23;
      v39[0] = v22;
      v27 = *(_QWORD *)(v22 + 16);
      v26 = *(_QWORD *)(v22 + 24);
      swift_bridgeObjectRetain();
      if (v27 >= v26 >> 1)
      {
        sub_1AF38FDBC((char *)(v26 > 1), v27 + 1, 1);
        v3 = v34;
        v22 = v39[0];
      }
      v23 += 41;
      *(_QWORD *)(v22 + 16) = v27 + 1;
      v28 = v22 + 16 * v27;
      *(_QWORD *)(v28 + 32) = v24;
      *(_QWORD *)(v28 + 40) = v25;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease();
    v8 = v32;
    v7 = v33;
    v10 = v31;
    LOBYTE(a2) = v30;
    v6 = v29;
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x1E0DEE9D8];
  }
  sub_1AF3A92F0(v6, v36, (v35 & 1) == 0, a2 & 1, 0, 0, (uint64_t)v10);
  if (v3)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1AF3A5C84(v39);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    memcpy(v38, v39, 0x141uLL);
    v37[0] = 0;
    v37[1] = 0xE000000000000000;
    sub_1AF3E7DE4();
    swift_bridgeObjectRelease();
    v37[0] = 0x6020202020;
    v37[1] = 0xE500000000000000;
    swift_bridgeObjectRetain();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    swift_bridgeObjectRetain();
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    v37[41] = v37[0];
    v37[42] = v37[1];
    memcpy(v37, v38, 0x141uLL);
    sub_1AF3A78CC(0x2020202020202020, 0xE800000000000000);
    sub_1AF3E7970();
    swift_bridgeObjectRelease();
    sub_1AF3E7970();
    sub_1AF3B6DB0((uint64_t)v38);
  }
  v39[0] = 0;
  v39[1] = 0xE000000000000000;
  sub_1AF3E7DE4();
  swift_bridgeObjectRelease();
  v39[0] = 0xD00000000000002FLL;
  v39[1] = 0x80000001AF3F43D0;
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  sub_1AF3E7970();
  v38[0] = (char *)v22;
  swift_bridgeObjectRetain();
  sub_1AF3D9E54(v38);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B470);
  sub_1AF390B14();
  sub_1AF3E7898();
  swift_release();
  sub_1AF3E7970();
  swift_bridgeObjectRelease();
  return v39[0];
}

uint64_t sub_1AF3DAB7C()
{
  return swift_deallocObject();
}

uint64_t sub_1AF3DAB8C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF3DABB0()
{
  uint64_t v0;

  return sub_1AF3DA688(*(_QWORD **)(v0 + 16), (*(_DWORD *)(v0 + 72) >> 1) & 1);
}

uint64_t sub_1AF3DABD0()
{
  return swift_deallocObject();
}

uint64_t sub_1AF3DABE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  _BYTE v7[8];
  uint64_t v8;

  sub_1AF344940(7, a1, a2);
  sub_1AF3478BC(v2 + 40, (uint64_t)v7, &qword_1EEE3BE58);
  sub_1AF3478BC((uint64_t)v7, (uint64_t)&v8, &qword_1EEE3BE58);
  result = v8;
  if (v8)
  {
    nullsub_1(v8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B5D8);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_1AF3EB020;
    *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v6 + 32) = a1;
    *(_QWORD *)(v6 + 40) = a2;
    sub_1AF345E6C();
    swift_bridgeObjectRetain();
    sub_1AF3E80B4();
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1AF3DACDC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  result = type metadata accessor for RecordingOptions.Options(0);
  if (a2)
  {
    v5 = result;
    v6 = swift_projectBox();
    swift_beginAccess();
    v7 = (_QWORD *)(v6 + *(int *)(v5 + 116));
    *v7 = a1;
    v7[1] = a2;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1AF3DAD68(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  result = type metadata accessor for RecordingOptions.Options(0);
  if (a2)
  {
    v5 = result;
    v6 = swift_projectBox();
    swift_beginAccess();
    v7 = (_QWORD *)(v6 + *(int *)(v5 + 120));
    *v7 = a1;
    v7[1] = a2;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1AF3DADF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  v5 = swift_projectBox();
  swift_beginAccess();
  v6 = (_QWORD *)(v5 + *(int *)(v4 + 120));
  *v6 = a1;
  v6[1] = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF3DAE7C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  char *v5;
  int64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v24[16];
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[5];

  type metadata accessor for RecordingOptions.Options(0);
  swift_projectBox();
  v27[0] = 44;
  v27[1] = 0xE100000000000000;
  v25 = v27;
  swift_bridgeObjectRetain();
  v5 = sub_1AF38ECFC(0x7FFFFFFFFFFFFFFFLL, 1, sub_1AF390784, (uint64_t)v24, a1, a2);
  v6 = *((_QWORD *)v5 + 2);
  if (v6)
  {
    v27[4] = v2;
    v27[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF38FDBC(0, v6, 0);
    v7 = (_QWORD *)v27[0];
    v8 = (uint64_t *)(v5 + 56);
    do
    {
      v10 = *(v8 - 3);
      v9 = *(v8 - 2);
      v12 = *(v8 - 1);
      v11 = *v8;
      swift_bridgeObjectRetain();
      v13 = MEMORY[0x1AF45C4C8](v10, v9, v12, v11);
      v15 = v14;
      swift_bridgeObjectRelease();
      v27[0] = v7;
      v17 = v7[2];
      v16 = v7[3];
      if (v17 >= v16 >> 1)
      {
        sub_1AF38FDBC((char *)(v16 > 1), v17 + 1, 1);
        v7 = (_QWORD *)v27[0];
      }
      v7[2] = v17 + 1;
      v18 = &v7[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
      v8 += 4;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  swift_beginAccess();
  v19 = v7[2];
  if (v19)
  {
    v20 = v7 + 5;
    do
    {
      v22 = *(v20 - 1);
      v21 = *v20;
      swift_bridgeObjectRetain();
      sub_1AF3AB50C(&v26, v22, v21);
      swift_bridgeObjectRelease();
      v20 += 2;
      --v19;
    }
    while (v19);
  }
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1AF3DB074(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  char *v5;
  int64_t v6;
  _QWORD *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char v24[16];
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[5];

  type metadata accessor for RecordingOptions.Options(0);
  swift_projectBox();
  v27[0] = 44;
  v27[1] = 0xE100000000000000;
  v25 = v27;
  swift_bridgeObjectRetain();
  v5 = sub_1AF38ECFC(0x7FFFFFFFFFFFFFFFLL, 1, sub_1AF390784, (uint64_t)v24, a1, a2);
  v6 = *((_QWORD *)v5 + 2);
  if (v6)
  {
    v27[4] = v2;
    v27[0] = MEMORY[0x1E0DEE9D8];
    sub_1AF38FDBC(0, v6, 0);
    v7 = (_QWORD *)v27[0];
    v8 = (uint64_t *)(v5 + 56);
    do
    {
      v10 = *(v8 - 3);
      v9 = *(v8 - 2);
      v12 = *(v8 - 1);
      v11 = *v8;
      swift_bridgeObjectRetain();
      v13 = MEMORY[0x1AF45C4C8](v10, v9, v12, v11);
      v15 = v14;
      swift_bridgeObjectRelease();
      v27[0] = v7;
      v17 = v7[2];
      v16 = v7[3];
      if (v17 >= v16 >> 1)
      {
        sub_1AF38FDBC((char *)(v16 > 1), v17 + 1, 1);
        v7 = (_QWORD *)v27[0];
      }
      v7[2] = v17 + 1;
      v18 = &v7[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
      v8 += 4;
      --v6;
    }
    while (v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  swift_beginAccess();
  v19 = v7[2];
  if (v19)
  {
    v20 = v7 + 5;
    do
    {
      v22 = *(v20 - 1);
      v21 = *v20;
      swift_bridgeObjectRetain();
      sub_1AF3AB50C(&v26, v22, v21);
      swift_bridgeObjectRelease();
      v20 += 2;
      --v19;
    }
    while (v19);
  }
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_1AF3DB26C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF3DB298(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = type metadata accessor for RecordingOptions.Options(0);
  v7 = swift_projectBox();
  if (a1 == 0x687461702D6F74 && a2 == 0xE700000000000000 || (sub_1AF3E8030() & 1) != 0)
  {
    result = swift_beginAccess();
    *(_BYTE *)(v5 + 16) = 1;
  }
  else
  {
    sub_1AF347C60();
    if ((sub_1AF3E7CB8() & 1) != 0)
    {
      swift_beginAccess();
      v9 = *(int *)(v6 + 96);
      v10 = *(_QWORD *)(v7 + v9);
      swift_bridgeObjectRetain();
      result = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)(v7 + v9) = v10;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1AF3413B8(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
        v10 = result;
        *(_QWORD *)(v7 + v9) = result;
      }
      v11 = *(_QWORD *)(v10 + 16);
      v12 = *(_QWORD *)(v10 + 24);
      v13 = v11 + 1;
      if (v11 >= v12 >> 1)
      {
        v16 = (char *)v10;
        v17 = *(_QWORD *)(v10 + 16);
        result = (uint64_t)sub_1AF3413B8((char *)(v12 > 1), v11 + 1, 1, v16);
        v11 = v17;
        v10 = result;
        *(_QWORD *)(v7 + v9) = result;
      }
      *(_QWORD *)(v10 + 16) = v13;
      v14 = v10 + 16 * v11;
      *(_QWORD *)(v14 + 32) = a1;
      *(_QWORD *)(v14 + 40) = a2;
    }
    else
    {
      type metadata accessor for KTraceRecordError();
      sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
      swift_allocError();
      *(_QWORD *)v15 = a1;
      *(_QWORD *)(v15 + 8) = a2;
      *(_BYTE *)(v15 + 16) = 0;
      swift_storeEnumTagMultiPayload();
      swift_bridgeObjectRetain();
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_1AF3DB4B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  v5 = swift_projectBox();
  swift_beginAccess();
  v6 = *(int *)(v4 + 44);
  v7 = *(_QWORD *)(v5 + v6);
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 + v6) = v7;
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1AF3413B8(0, *(_QWORD *)(v7 + 16) + 1, 1, (char *)v7);
    v7 = result;
    *(_QWORD *)(v5 + v6) = result;
  }
  v10 = *(_QWORD *)(v7 + 16);
  v9 = *(_QWORD *)(v7 + 24);
  if (v10 >= v9 >> 1)
  {
    result = (uint64_t)sub_1AF3413B8((char *)(v9 > 1), v10 + 1, 1, (char *)v7);
    v7 = result;
    *(_QWORD *)(v5 + v6) = result;
  }
  *(_QWORD *)(v7 + 16) = v10 + 1;
  v11 = v7 + 16 * v10;
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 40) = a2;
  return result;
}

uint64_t sub_1AF3DB5A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  v5 = swift_projectBox();
  swift_beginAccess();
  v6 = *(int *)(v4 + 48);
  v7 = *(_QWORD *)(v5 + v6);
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 + v6) = v7;
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1AF3413B8(0, *(_QWORD *)(v7 + 16) + 1, 1, (char *)v7);
    v7 = result;
    *(_QWORD *)(v5 + v6) = result;
  }
  v10 = *(_QWORD *)(v7 + 16);
  v9 = *(_QWORD *)(v7 + 24);
  if (v10 >= v9 >> 1)
  {
    result = (uint64_t)sub_1AF3413B8((char *)(v9 > 1), v10 + 1, 1, (char *)v7);
    v7 = result;
    *(_QWORD *)(v5 + v6) = result;
  }
  *(_QWORD *)(v7 + 16) = v10 + 1;
  v11 = v7 + 16 * v10;
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 40) = a2;
  return result;
}

void sub_1AF3DB6A0(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  __int128 v22;
  _BYTE v23[40];
  id v24;

  v5 = type metadata accessor for RecordingOptions.Options(0);
  v6 = swift_projectBox();
  v7 = sub_1AF3BB940(a1, a2, 1);
  if (v2)
  {
    v24 = v2;
    v8 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_5:

      return;
    }

    sub_1AF3911B0(&v22, (uint64_t)v23);
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    v9 = (void *)swift_allocError();
    v11 = v10;
    v12 = sub_1AF3BB7A4();
    v14 = v13;
    sub_1AF3DF0AC((uint64_t)v23);
    if (v14)
    {
      *v11 = 0xD000000000000014;
      v11[1] = 0x80000001AF3F43B0;
      v11[2] = v12;
      v11[3] = v14;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      goto LABEL_5;
    }

    __break(1u);
  }
  else
  {
    v15 = v7;
    swift_beginAccess();
    v16 = *(int *)(v5 + 32);
    v17 = *(char **)(v6 + v16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v6 + v16) = v17;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v17 = sub_1AF3DA0D8(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
      *(_QWORD *)(v6 + v16) = v17;
    }
    v20 = *((_QWORD *)v17 + 2);
    v19 = *((_QWORD *)v17 + 3);
    if (v20 >= v19 >> 1)
    {
      v17 = sub_1AF3DA0D8((char *)(v19 > 1), v20 + 1, 1, v17);
      *(_QWORD *)(v6 + v16) = v17;
    }
    *((_QWORD *)v17 + 2) = v20 + 1;
    v21 = &v17[24 * v20];
    *((_QWORD *)v21 + 4) = v15;
    *((_QWORD *)v21 + 5) = 0;
    v21[48] = 1;
  }
}

uint64_t sub_1AF3DB8B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  v5 = swift_projectBox();
  swift_beginAccess();
  v6 = *(int *)(v4 + 28);
  v7 = *(_QWORD *)(v5 + v6);
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 + v6) = v7;
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1AF3DA0D8(0, *(_QWORD *)(v7 + 16) + 1, 1, (char *)v7);
    v7 = result;
    *(_QWORD *)(v5 + v6) = result;
  }
  v10 = *(_QWORD *)(v7 + 16);
  v9 = *(_QWORD *)(v7 + 24);
  if (v10 >= v9 >> 1)
  {
    result = (uint64_t)sub_1AF3DA0D8((char *)(v9 > 1), v10 + 1, 1, (char *)v7);
    v7 = result;
    *(_QWORD *)(v5 + v6) = result;
  }
  *(_QWORD *)(v7 + 16) = v10 + 1;
  v11 = v7 + 24 * v10;
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 40) = a2;
  *(_BYTE *)(v11 + 48) = 2;
  return result;
}

unint64_t sub_1AF3DB9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t result;
  char v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  v5 = swift_projectBox();
  v6 = sub_1AF347C60();
  result = sub_1AF3BC4D0(MEMORY[0x1E0DEA968], v6);
  if ((v8 & 1) != 0)
  {
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    swift_allocError();
    *v11 = 0xD000000000000015;
    v11[1] = 0x80000001AF3F4390;
    v11[2] = a1;
    v11[3] = a2;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  else
  {
    v9 = result;
    if (HIDWORD(result))
    {
      __break(1u);
    }
    else
    {
      result = swift_beginAccess();
      v10 = v5 + *(int *)(v4 + 36);
      *(_DWORD *)v10 = v9;
      *(_BYTE *)(v10 + 4) = 0;
    }
  }
  return result;
}

void sub_1AF3DBAEC(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  _BYTE v18[40];
  id v19;

  v3 = v2;
  v6 = type metadata accessor for RecordingOptions.Options(0);
  v7 = swift_projectBox();
  v8 = sub_1AF3BBE94(a1, a2);
  if (v2)
  {
    v19 = v2;
    v9 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_5:

      return;
    }

    sub_1AF3911B0(&v17, (uint64_t)v18);
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    v3 = (void *)swift_allocError();
    v11 = v10;
    v12 = sub_1AF3BB7A4();
    v14 = v13;
    sub_1AF3DF0AC((uint64_t)v18);
    if (v14)
    {
      *v11 = 0xD00000000000001ELL;
      v11[1] = 0x80000001AF3F4370;
      v11[2] = v12;
      v11[3] = v14;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      goto LABEL_5;
    }
  }
  else
  {
    if (v8 >> 54)
    {
      __break(1u);
    }
    else if ((v8 & 0x3FF00000000000) == 0)
    {
      v15 = (v8 & 0xFFFFFFFFFFFLL) << 14;
      swift_beginAccess();
      v16 = v7 + *(int *)(v6 + 40);
      *(_QWORD *)v16 = v15;
      *(_BYTE *)(v16 + 8) = 0;
      return;
    }
    __break(1u);
  }

  __break(1u);
}

uint64_t sub_1AF3DBC9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  v5 = swift_projectBox();
  swift_beginAccess();
  v6 = *(int *)(v4 + 24);
  v7 = *(_QWORD *)(v5 + v6);
  swift_bridgeObjectRetain();
  result = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 + v6) = v7;
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1AF3DA1EC(0, *(_QWORD *)(v7 + 16) + 1, 1, (char *)v7);
    v7 = result;
    *(_QWORD *)(v5 + v6) = result;
  }
  v10 = *(_QWORD *)(v7 + 16);
  v9 = *(_QWORD *)(v7 + 24);
  if (v10 >= v9 >> 1)
  {
    result = (uint64_t)sub_1AF3DA1EC((char *)(v9 > 1), v10 + 1, 1, (char *)v7);
    v7 = result;
    *(_QWORD *)(v5 + v6) = result;
  }
  *(_QWORD *)(v7 + 16) = v10 + 1;
  v11 = v7 + 16 * v10;
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 40) = a2;
  return result;
}

uint64_t sub_1AF3DBD94()
{
  _QWORD *v0;
  uint64_t result;

  type metadata accessor for RecordingOptions.Options(0);
  v0 = (_QWORD *)swift_projectBox();
  result = swift_beginAccess();
  if ((*v0 & 1) == 0)
    *v0 |= 1uLL;
  return result;
}

void sub_1AF3DBDF0(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  id v21;
  _BYTE v22[40];

  v3 = v2;
  v6 = type metadata accessor for RecordingOptions.Options(0);
  v7 = swift_projectBox();
  v8 = sub_1AF347DB0();
  v9 = sub_1AF3BB940(a1, a2, v8 & 1);
  if (!v2)
  {
    v10 = v9;
    if (v9 >> 4 > 0xC34)
    {
      swift_beginAccess();
      v19 = v7 + *(int *)(v6 + 52);
      *(_QWORD *)v19 = v10 / 0x3E8;
      *(_BYTE *)(v19 + 8) = 0;
      return;
    }
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    v3 = (void *)swift_allocError();
    *v11 = v10;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
  }
  v21 = v3;
  v12 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
  if (!swift_dynamicCast())
  {
LABEL_7:

    return;
  }

  sub_1AF3911B0(&v20, (uint64_t)v22);
  type metadata accessor for KTraceRecordError();
  sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
  v13 = (void *)swift_allocError();
  v15 = v14;
  v16 = sub_1AF3BB7A4();
  v18 = v17;
  sub_1AF3DF0AC((uint64_t)v22);
  if (v18)
  {
    *v15 = 0xD000000000000014;
    v15[1] = 0x80000001AF3F4350;
    v15[2] = v16;
    v15[3] = v18;
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    goto LABEL_7;
  }

  __break(1u);
}

uint64_t sub_1AF3DC014()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for RecordingOptions.Options(0);
  v1 = swift_projectBox();
  result = swift_beginAccess();
  *(_BYTE *)(v1 + *(int *)(v0 + 56)) = 1;
  return result;
}

uint64_t sub_1AF3DC078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for RecordingOptions.Options(0);
  v1 = swift_projectBox();
  result = swift_beginAccess();
  *(_BYTE *)(v1 + *(int *)(v0 + 60)) = 1;
  return result;
}

uint64_t sub_1AF3DC0DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for RecordingOptions.Options(0);
  v1 = swift_projectBox();
  result = swift_beginAccess();
  *(_BYTE *)(v1 + *(int *)(v0 + 104)) = 1;
  return result;
}

uint64_t sub_1AF3DC140()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for RecordingOptions.Options(0);
  v1 = swift_projectBox();
  result = swift_beginAccess();
  *(_BYTE *)(v1 + *(int *)(v0 + 100)) = 1;
  return result;
}

void sub_1AF3DC1A4(uint64_t a1, unint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  _BYTE v18[40];
  id v19;

  v3 = v2;
  v6 = type metadata accessor for RecordingOptions.Options(0);
  v7 = swift_projectBox();
  v8 = sub_1AF3BBE94(a1, a2);
  if (v2)
  {
    v19 = v2;
    v9 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_5:

      return;
    }

    sub_1AF3911B0(&v17, (uint64_t)v18);
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    v3 = (void *)swift_allocError();
    v11 = v10;
    v12 = sub_1AF3BB7A4();
    v14 = v13;
    sub_1AF3DF0AC((uint64_t)v18);
    if (v14)
    {
      *v11 = 0xD000000000000014;
      v11[1] = 0x80000001AF3F4330;
      v11[2] = v12;
      v11[3] = v14;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      goto LABEL_5;
    }
  }
  else
  {
    v15 = v8;
    if ((v8 & 0x8000000000000000) == 0)
    {
      swift_beginAccess();
      v16 = v7 + *(int *)(v6 + 76);
      *(_QWORD *)v16 = v15;
      *(_BYTE *)(v16 + 8) = 0;
      return;
    }
    __break(1u);
  }

  __break(1u);
}

uint64_t sub_1AF3DC344(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  v5 = swift_projectBox();
  swift_beginAccess();
  v6 = (_QWORD *)(v5 + *(int *)(v4 + 68));
  *v6 = a1;
  v6[1] = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF3DC3CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  v5 = swift_projectBox();
  swift_beginAccess();
  v6 = (_QWORD *)(v5 + *(int *)(v4 + 72));
  *v6 = a1;
  v6[1] = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF3DC454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for RecordingOptions.Options(0);
  v1 = swift_projectBox();
  result = swift_beginAccess();
  *(_BYTE *)(v1 + *(int *)(v0 + 80)) = 1;
  return result;
}

uint64_t sub_1AF3DC4B8(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unsigned int v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;

  v4 = type metadata accessor for RecordingOptions.Options(0);
  result = swift_projectBox();
  v6 = HIBYTE(a2) & 0xF;
  v7 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v8 = HIBYTE(a2) & 0xF;
  else
    v8 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v8)
    goto LABEL_56;
  v9 = result;
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v12 = sub_1AF3DA2EC(a1, a2, 10);
    swift_bridgeObjectRelease();
    if ((v12 & 0x100000000) == 0)
      goto LABEL_36;
    goto LABEL_56;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v10 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v10 = (unsigned __int8 *)sub_1AF3E7E38();
    v11 = sub_1AF3DA3D0(v10, v7, 10);
    v30 = BYTE4(v11) & 1;
    if ((BYTE4(v11) & 1) == 0)
    {
      LODWORD(v12) = (_DWORD)v11;
LABEL_36:
      if ((v12 - 64) >= 0xFFFFFFC4)
      {
        result = swift_beginAccess();
        v19 = v9 + *(int *)(v4 + 84);
        *(_DWORD *)v19 = v12;
        *(_BYTE *)(v19 + 4) = 0;
        return result;
      }
      type metadata accessor for KTraceRecordError();
      sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
      swift_allocError();
      *(_DWORD *)v18 = v12;
      *(_QWORD *)(v18 + 4) = 0x3F00000004;
      swift_storeEnumTagMultiPayload();
      return swift_willThrow();
    }
LABEL_56:
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    swift_allocError();
    *v28 = 0xD000000000000015;
    v28[1] = 0x80000001AF3F4310;
    v28[2] = a1;
    v28[3] = a2;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  v29[0] = a1;
  v29[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v6)
      goto LABEL_61;
    if (v6 == 1)
      goto LABEL_59;
    LODWORD(v12) = (BYTE1(a1) - 48);
    if (v12 <= 9)
    {
      if (v6 == 2)
        goto LABEL_34;
      if ((BYTE2(a1) - 48) <= 9u)
      {
        LODWORD(v12) = 10 * v12 + (BYTE2(a1) - 48);
        v14 = v6 - 3;
        if (v6 != 3)
        {
          v15 = (unsigned __int8 *)v29 + 3;
          while (1)
          {
            v16 = *v15 - 48;
            if (v16 > 9)
              goto LABEL_32;
            v17 = 10 * (int)v12;
            if (v17 != (int)v17)
              goto LABEL_32;
            LODWORD(v12) = v17 + v16;
            if (__OFADD__((_DWORD)v17, v16))
              goto LABEL_32;
            LOBYTE(v6) = 0;
            ++v15;
            if (!--v14)
              goto LABEL_35;
          }
        }
        goto LABEL_34;
      }
    }
LABEL_32:
    LODWORD(v12) = 0;
    LOBYTE(v6) = 1;
    goto LABEL_35;
  }
  if (a1 != 45)
  {
    if (!v6)
      goto LABEL_32;
    LODWORD(v12) = (a1 - 48);
    if (v12 > 9)
      goto LABEL_32;
    if (v6 == 1)
    {
LABEL_34:
      LOBYTE(v6) = 0;
      goto LABEL_35;
    }
    if ((BYTE1(a1) - 48) <= 9u)
    {
      LODWORD(v12) = 10 * v12 + (BYTE1(a1) - 48);
      v20 = v6 - 2;
      if (v6 != 2)
      {
        v21 = (unsigned __int8 *)v29 + 2;
        while (1)
        {
          v22 = *v21 - 48;
          if (v22 > 9)
            goto LABEL_32;
          v23 = 10 * (int)v12;
          if (v23 != (int)v23)
            goto LABEL_32;
          LODWORD(v12) = v23 + v22;
          if (__OFADD__((_DWORD)v23, v22))
            goto LABEL_32;
          LOBYTE(v6) = 0;
          ++v21;
          if (!--v20)
            goto LABEL_35;
        }
      }
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  if (v6)
  {
    if (v6 != 1)
    {
      v13 = (BYTE1(a1) - 48);
      if (v13 > 9)
        goto LABEL_32;
      if (v6 == 2)
      {
        LOBYTE(v6) = 0;
        LODWORD(v12) = -v13;
        goto LABEL_35;
      }
      if ((BYTE2(a1) - 48) > 9u)
        goto LABEL_32;
      LODWORD(v12) = -10 * v13 - (BYTE2(a1) - 48);
      v24 = v6 - 3;
      if (v6 != 3)
      {
        v25 = (unsigned __int8 *)v29 + 3;
        while (1)
        {
          v26 = *v25 - 48;
          if (v26 > 9)
            goto LABEL_32;
          v27 = 10 * (int)v12;
          if (v27 != (int)v27)
            goto LABEL_32;
          LODWORD(v12) = v27 - v26;
          if (__OFSUB__((_DWORD)v27, v26))
            goto LABEL_32;
          LOBYTE(v6) = 0;
          ++v25;
          if (!--v24)
            goto LABEL_35;
        }
      }
      goto LABEL_34;
    }
LABEL_59:
    LODWORD(v12) = 0;
LABEL_35:
    if ((v6 & 1) == 0)
      goto LABEL_36;
    goto LABEL_56;
  }
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

uint64_t sub_1AF3DC8A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for RecordingOptions.Options(0);
  v1 = swift_projectBox();
  result = swift_beginAccess();
  *(_BYTE *)(v1 + *(int *)(v0 + 64)) = 0;
  return result;
}

void sub_1AF3DC908(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  _BYTE v19[40];
  id v20;

  v5 = type metadata accessor for RecordingOptions.Options(0);
  v6 = swift_projectBox();
  v7 = sub_1AF347DB0();
  v8 = sub_1AF3BB940(a1, a2, v7 & 1);
  if (v2)
  {
    v20 = v2;
    v9 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B540);
    if ((swift_dynamicCast() & 1) == 0)
    {
LABEL_5:

      return;
    }

    sub_1AF3911B0(&v18, (uint64_t)v19);
    type metadata accessor for KTraceRecordError();
    sub_1AF344878((unint64_t *)&qword_1EEE3B750, (uint64_t (*)(uint64_t))type metadata accessor for KTraceRecordError, (uint64_t)&unk_1AF3ED104);
    v10 = (void *)swift_allocError();
    v12 = v11;
    v13 = sub_1AF3BB7A4();
    v15 = v14;
    sub_1AF3DF0AC((uint64_t)v19);
    if (v15)
    {
      *v12 = 0xD000000000000013;
      v12[1] = 0x80000001AF3F42F0;
      v12[2] = v13;
      v12[3] = v15;
      swift_storeEnumTagMultiPayload();
      swift_willThrow();
      goto LABEL_5;
    }

    __break(1u);
  }
  else
  {
    v16 = v8;
    swift_beginAccess();
    v17 = v6 + *(int *)(v5 + 112);
    *(_QWORD *)v17 = v16;
    *(_BYTE *)(v17 + 8) = 0;
  }
}

unint64_t sub_1AF3DCAAC()
{
  unint64_t result;

  result = qword_1EEE3BE28;
  if (!qword_1EEE3BE28)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EDF20, &type metadata for RecordingOptions.Options.Requests);
    atomic_store(result, (unint64_t *)&qword_1EEE3BE28);
  }
  return result;
}

unint64_t sub_1AF3DCAF4()
{
  unint64_t result;

  result = qword_1EEE3BE30;
  if (!qword_1EEE3BE30)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EDE58, &type metadata for RecordingOptions.Options.Requests);
    atomic_store(result, (unint64_t *)&qword_1EEE3BE30);
  }
  return result;
}

unint64_t sub_1AF3DCB3C()
{
  unint64_t result;

  result = qword_1EEE3BE38;
  if (!qword_1EEE3BE38)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EDF58, &type metadata for RecordingOptions.Options.Requests);
    atomic_store(result, (unint64_t *)&qword_1EEE3BE38);
  }
  return result;
}

unint64_t sub_1AF3DCB84()
{
  unint64_t result;

  result = qword_1EEE3BE40;
  if (!qword_1EEE3BE40)
  {
    result = MEMORY[0x1AF45E31C](&unk_1AF3EDF80, &type metadata for RecordingOptions.Options.Requests);
    atomic_store(result, (unint64_t *)&qword_1EEE3BE40);
  }
  return result;
}

uint64_t *sub_1AF3DCBC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
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
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v16 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    *(uint64_t *)((char *)a1 + v5) = *(uint64_t *)((char *)a2 + v5);
    v8 = (int *)type metadata accessor for RecordingOptions.Options(0);
    v9 = v8[5];
    v10 = &v6[v9];
    v11 = &v7[v9];
    v12 = sub_1AF3E7694();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    *(_QWORD *)&v6[v8[6]] = *(_QWORD *)&v7[v8[6]];
    *(_QWORD *)&v6[v8[7]] = *(_QWORD *)&v7[v8[7]];
    *(_QWORD *)&v6[v8[8]] = *(_QWORD *)&v7[v8[8]];
    v17 = v8[9];
    v18 = &v6[v17];
    v19 = &v7[v17];
    *(_DWORD *)v18 = *(_DWORD *)v19;
    v18[4] = v19[4];
    v20 = v8[10];
    v21 = &v6[v20];
    v22 = &v7[v20];
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v21[8] = v22[8];
    *(_QWORD *)&v6[v8[11]] = *(_QWORD *)&v7[v8[11]];
    *(_QWORD *)&v6[v8[12]] = *(_QWORD *)&v7[v8[12]];
    v23 = v8[13];
    v24 = &v6[v23];
    v25 = &v7[v23];
    *(_QWORD *)v24 = *(_QWORD *)v25;
    v24[8] = v25[8];
    v6[v8[14]] = v7[v8[14]];
    v6[v8[15]] = v7[v8[15]];
    v6[v8[16]] = v7[v8[16]];
    v26 = v8[17];
    v27 = &v6[v26];
    v28 = &v7[v26];
    v29 = *((_QWORD *)v28 + 1);
    *(_QWORD *)v27 = *(_QWORD *)v28;
    *((_QWORD *)v27 + 1) = v29;
    v30 = v8[18];
    v31 = &v6[v30];
    v32 = &v7[v30];
    v33 = *((_QWORD *)v32 + 1);
    *(_QWORD *)v31 = *(_QWORD *)v32;
    *((_QWORD *)v31 + 1) = v33;
    v34 = v8[19];
    v35 = &v6[v34];
    v36 = &v7[v34];
    *(_QWORD *)v35 = *(_QWORD *)v36;
    v35[8] = v36[8];
    v6[v8[20]] = v7[v8[20]];
    v37 = v8[21];
    v38 = &v6[v37];
    v39 = &v7[v37];
    *(_DWORD *)v38 = *(_DWORD *)v39;
    v38[4] = v39[4];
    *(_QWORD *)&v6[v8[22]] = *(_QWORD *)&v7[v8[22]];
    *(_QWORD *)&v6[v8[23]] = *(_QWORD *)&v7[v8[23]];
    *(_QWORD *)&v6[v8[24]] = *(_QWORD *)&v7[v8[24]];
    v6[v8[25]] = v7[v8[25]];
    v6[v8[26]] = v7[v8[26]];
    *(_QWORD *)&v6[v8[27]] = *(_QWORD *)&v7[v8[27]];
    v40 = v8[28];
    v41 = &v6[v40];
    v42 = &v7[v40];
    *(_QWORD *)v41 = *(_QWORD *)v42;
    v41[8] = v42[8];
    v43 = v8[29];
    v44 = &v6[v43];
    v45 = &v7[v43];
    v46 = *((_QWORD *)v45 + 1);
    *(_QWORD *)v44 = *(_QWORD *)v45;
    *((_QWORD *)v44 + 1) = v46;
    v47 = v8[30];
    v48 = &v6[v47];
    v49 = &v7[v47];
    v50 = *((_QWORD *)v49 + 1);
    *(_QWORD *)v48 = *(_QWORD *)v49;
    *((_QWORD *)v48 + 1) = v50;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  return (uint64_t *)v16;
}

uint64_t sub_1AF3DCF10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = v4 + *(int *)(type metadata accessor for RecordingOptions.Options(0) + 20);
  v6 = sub_1AF3E7694();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_1AF3DD044(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  char *v5;
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
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
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;

  *a1 = *a2;
  v3 = *(int *)(a3 + 20);
  v4 = (char *)a1 + v3;
  v5 = (char *)a2 + v3;
  *(_QWORD *)((char *)a1 + v3) = *(_QWORD *)((char *)a2 + v3);
  v6 = (int *)type metadata accessor for RecordingOptions.Options(0);
  v7 = v6[5];
  v8 = &v4[v7];
  v9 = &v5[v7];
  v10 = sub_1AF3E7694();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_QWORD *)&v4[v6[6]] = *(_QWORD *)&v5[v6[6]];
  *(_QWORD *)&v4[v6[7]] = *(_QWORD *)&v5[v6[7]];
  *(_QWORD *)&v4[v6[8]] = *(_QWORD *)&v5[v6[8]];
  v14 = v6[9];
  v15 = &v4[v14];
  v16 = &v5[v14];
  *(_DWORD *)v15 = *(_DWORD *)v16;
  v15[4] = v16[4];
  v17 = v6[10];
  v18 = &v4[v17];
  v19 = &v5[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  *(_QWORD *)&v4[v6[11]] = *(_QWORD *)&v5[v6[11]];
  *(_QWORD *)&v4[v6[12]] = *(_QWORD *)&v5[v6[12]];
  v20 = v6[13];
  v21 = &v4[v20];
  v22 = &v5[v20];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v4[v6[14]] = v5[v6[14]];
  v4[v6[15]] = v5[v6[15]];
  v4[v6[16]] = v5[v6[16]];
  v23 = v6[17];
  v24 = &v4[v23];
  v25 = &v5[v23];
  v26 = *((_QWORD *)v25 + 1);
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = v26;
  v27 = v6[18];
  v28 = &v4[v27];
  v29 = &v5[v27];
  v30 = *((_QWORD *)v29 + 1);
  *(_QWORD *)v28 = *(_QWORD *)v29;
  *((_QWORD *)v28 + 1) = v30;
  v31 = v6[19];
  v32 = &v4[v31];
  v33 = &v5[v31];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  v32[8] = v33[8];
  v4[v6[20]] = v5[v6[20]];
  v34 = v6[21];
  v35 = &v4[v34];
  v36 = &v5[v34];
  *(_DWORD *)v35 = *(_DWORD *)v36;
  v35[4] = v36[4];
  *(_QWORD *)&v4[v6[22]] = *(_QWORD *)&v5[v6[22]];
  *(_QWORD *)&v4[v6[23]] = *(_QWORD *)&v5[v6[23]];
  *(_QWORD *)&v4[v6[24]] = *(_QWORD *)&v5[v6[24]];
  v4[v6[25]] = v5[v6[25]];
  v4[v6[26]] = v5[v6[26]];
  *(_QWORD *)&v4[v6[27]] = *(_QWORD *)&v5[v6[27]];
  v37 = v6[28];
  v38 = &v4[v37];
  v39 = &v5[v37];
  *(_QWORD *)v38 = *(_QWORD *)v39;
  v38[8] = v39[8];
  v40 = v6[29];
  v41 = &v4[v40];
  v42 = &v5[v40];
  v43 = *((_QWORD *)v42 + 1);
  *(_QWORD *)v41 = *(_QWORD *)v42;
  *((_QWORD *)v41 + 1) = v43;
  v44 = v6[30];
  v45 = &v4[v44];
  v46 = &v5[v44];
  v47 = *((_QWORD *)v46 + 1);
  *(_QWORD *)v45 = *(_QWORD *)v46;
  *((_QWORD *)v45 + 1) = v47;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1AF3DD360(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  int v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  v9 = (int *)type metadata accessor for RecordingOptions.Options(0);
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_1AF3E7694();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(_QWORD *)&v7[v9[6]] = *(_QWORD *)&v8[v9[6]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[7]] = *(_QWORD *)&v8[v9[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = v9[9];
  v20 = &v7[v19];
  v21 = &v8[v19];
  v22 = *(_DWORD *)v21;
  v20[4] = v21[4];
  *(_DWORD *)v20 = v22;
  v23 = v9[10];
  v24 = &v7[v23];
  v25 = &v8[v23];
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  *(_QWORD *)&v7[v9[11]] = *(_QWORD *)&v8[v9[11]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[12]] = *(_QWORD *)&v8[v9[12]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27 = v9[13];
  v28 = &v7[v27];
  v29 = &v8[v27];
  v30 = *(_QWORD *)v29;
  v28[8] = v29[8];
  *(_QWORD *)v28 = v30;
  v7[v9[14]] = v8[v9[14]];
  v7[v9[15]] = v8[v9[15]];
  v7[v9[16]] = v8[v9[16]];
  v31 = v9[17];
  v32 = &v7[v31];
  v33 = &v8[v31];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *((_QWORD *)v32 + 1) = *((_QWORD *)v33 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v34 = v9[18];
  v35 = &v7[v34];
  v36 = &v8[v34];
  *(_QWORD *)v35 = *(_QWORD *)v36;
  *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v37 = v9[19];
  v38 = &v7[v37];
  v39 = &v8[v37];
  v40 = *(_QWORD *)v39;
  v38[8] = v39[8];
  *(_QWORD *)v38 = v40;
  v7[v9[20]] = v8[v9[20]];
  v41 = v9[21];
  v42 = &v7[v41];
  v43 = &v8[v41];
  LODWORD(v40) = *(_DWORD *)v43;
  v42[4] = v43[4];
  *(_DWORD *)v42 = v40;
  *(_QWORD *)&v7[v9[22]] = *(_QWORD *)&v8[v9[22]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[23]] = *(_QWORD *)&v8[v9[23]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[24]] = *(_QWORD *)&v8[v9[24]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7[v9[25]] = v8[v9[25]];
  v7[v9[26]] = v8[v9[26]];
  *(_QWORD *)&v7[v9[27]] = *(_QWORD *)&v8[v9[27]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v44 = v9[28];
  v45 = &v7[v44];
  v46 = &v8[v44];
  v47 = *(_QWORD *)v46;
  v45[8] = v46[8];
  *(_QWORD *)v45 = v47;
  v48 = v9[29];
  v49 = &v7[v48];
  v50 = &v8[v48];
  *(_QWORD *)v49 = *(_QWORD *)v50;
  *((_QWORD *)v49 + 1) = *((_QWORD *)v50 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v51 = v9[30];
  v52 = &v7[v51];
  v53 = &v8[v51];
  *(_QWORD *)v52 = *(_QWORD *)v53;
  *((_QWORD *)v52 + 1) = *((_QWORD *)v53 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_1AF3DD744(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
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
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  *(_QWORD *)((char *)a1 + v4) = *(_QWORD *)((char *)a2 + v4);
  v7 = (int *)type metadata accessor for RecordingOptions.Options(0);
  v8 = v7[5];
  v9 = &v5[v8];
  v10 = &v6[v8];
  v11 = sub_1AF3E7694();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_QWORD *)&v5[v7[6]] = *(_QWORD *)&v6[v7[6]];
  *(_QWORD *)&v5[v7[7]] = *(_QWORD *)&v6[v7[7]];
  *(_QWORD *)&v5[v7[8]] = *(_QWORD *)&v6[v7[8]];
  v14 = v7[9];
  v15 = &v5[v14];
  v16 = &v6[v14];
  *(_DWORD *)v15 = *(_DWORD *)v16;
  v15[4] = v16[4];
  v17 = v7[10];
  v18 = &v5[v17];
  v19 = &v6[v17];
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  *(_QWORD *)&v5[v7[11]] = *(_QWORD *)&v6[v7[11]];
  *(_QWORD *)&v5[v7[12]] = *(_QWORD *)&v6[v7[12]];
  v20 = v7[13];
  v21 = &v5[v20];
  v22 = &v6[v20];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v5[v7[14]] = v6[v7[14]];
  v5[v7[15]] = v6[v7[15]];
  v5[v7[16]] = v6[v7[16]];
  *(_OWORD *)&v5[v7[17]] = *(_OWORD *)&v6[v7[17]];
  *(_OWORD *)&v5[v7[18]] = *(_OWORD *)&v6[v7[18]];
  v23 = v7[19];
  v24 = &v5[v23];
  v25 = &v6[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  v24[8] = v25[8];
  v5[v7[20]] = v6[v7[20]];
  v26 = v7[21];
  v27 = &v5[v26];
  v28 = &v6[v26];
  *(_DWORD *)v27 = *(_DWORD *)v28;
  v27[4] = v28[4];
  *(_QWORD *)&v5[v7[22]] = *(_QWORD *)&v6[v7[22]];
  *(_QWORD *)&v5[v7[23]] = *(_QWORD *)&v6[v7[23]];
  *(_QWORD *)&v5[v7[24]] = *(_QWORD *)&v6[v7[24]];
  v5[v7[25]] = v6[v7[25]];
  v5[v7[26]] = v6[v7[26]];
  *(_QWORD *)&v5[v7[27]] = *(_QWORD *)&v6[v7[27]];
  v29 = v7[28];
  v30 = &v5[v29];
  v31 = &v6[v29];
  v30[8] = v31[8];
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *(_OWORD *)&v5[v7[29]] = *(_OWORD *)&v6[v7[29]];
  *(_OWORD *)&v5[v7[30]] = *(_OWORD *)&v6[v7[30]];
  return a1;
}

_QWORD *sub_1AF3DD9B4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  v9 = (int *)type metadata accessor for RecordingOptions.Options(0);
  v10 = v9[5];
  v11 = &v7[v10];
  v12 = &v8[v10];
  v13 = sub_1AF3E7694();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  *(_QWORD *)&v7[v9[6]] = *(_QWORD *)&v8[v9[6]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[7]] = *(_QWORD *)&v8[v9[7]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[8]] = *(_QWORD *)&v8[v9[8]];
  swift_bridgeObjectRelease();
  v19 = v9[9];
  v20 = &v7[v19];
  v21 = &v8[v19];
  *(_DWORD *)v20 = *(_DWORD *)v21;
  v20[4] = v21[4];
  v22 = v9[10];
  v23 = &v7[v22];
  v24 = &v8[v22];
  v23[8] = v24[8];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *(_QWORD *)&v7[v9[11]] = *(_QWORD *)&v8[v9[11]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[12]] = *(_QWORD *)&v8[v9[12]];
  swift_bridgeObjectRelease();
  v25 = v9[13];
  v26 = &v7[v25];
  v27 = &v8[v25];
  *(_QWORD *)v26 = *(_QWORD *)v27;
  v26[8] = v27[8];
  v7[v9[14]] = v8[v9[14]];
  v7[v9[15]] = v8[v9[15]];
  v7[v9[16]] = v8[v9[16]];
  v28 = v9[17];
  v29 = &v7[v28];
  v30 = &v8[v28];
  v32 = *(_QWORD *)v30;
  v31 = *((_QWORD *)v30 + 1);
  *(_QWORD *)v29 = v32;
  *((_QWORD *)v29 + 1) = v31;
  swift_bridgeObjectRelease();
  v33 = v9[18];
  v34 = &v7[v33];
  v35 = &v8[v33];
  v37 = *(_QWORD *)v35;
  v36 = *((_QWORD *)v35 + 1);
  *(_QWORD *)v34 = v37;
  *((_QWORD *)v34 + 1) = v36;
  swift_bridgeObjectRelease();
  v38 = v9[19];
  v39 = &v7[v38];
  v40 = &v8[v38];
  *(_QWORD *)v39 = *(_QWORD *)v40;
  v39[8] = v40[8];
  v7[v9[20]] = v8[v9[20]];
  v41 = v9[21];
  v42 = &v7[v41];
  v43 = &v8[v41];
  *(_DWORD *)v42 = *(_DWORD *)v43;
  v42[4] = v43[4];
  *(_QWORD *)&v7[v9[22]] = *(_QWORD *)&v8[v9[22]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[23]] = *(_QWORD *)&v8[v9[23]];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v9[24]] = *(_QWORD *)&v8[v9[24]];
  swift_bridgeObjectRelease();
  v7[v9[25]] = v8[v9[25]];
  v7[v9[26]] = v8[v9[26]];
  *(_QWORD *)&v7[v9[27]] = *(_QWORD *)&v8[v9[27]];
  swift_bridgeObjectRelease();
  v44 = v9[28];
  v45 = &v7[v44];
  v46 = &v8[v44];
  *(_QWORD *)v45 = *(_QWORD *)v46;
  v45[8] = v46[8];
  v47 = v9[29];
  v48 = &v7[v47];
  v49 = &v8[v47];
  v51 = *(_QWORD *)v49;
  v50 = *((_QWORD *)v49 + 1);
  *(_QWORD *)v48 = v51;
  *((_QWORD *)v48 + 1) = v50;
  swift_bridgeObjectRelease();
  v52 = v9[30];
  v53 = &v7[v52];
  v54 = &v8[v52];
  v56 = *(_QWORD *)v54;
  v55 = *((_QWORD *)v54 + 1);
  *(_QWORD *)v53 = v56;
  *((_QWORD *)v53 + 1) = v55;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AF3DDD08()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF3DDD14(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for RecordingOptions.Options(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_1AF3DDD90()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1AF3DDD9C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for RecordingOptions.Options(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_1AF3DDE10()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for RecordingOptions.Options(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_1AF3DDE88(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1AF3E7694();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v14 = a3[7];
    *(_QWORD *)((char *)v4 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
    *(_QWORD *)((char *)v4 + v14) = *(_QWORD *)((char *)a2 + v14);
    v15 = a3[9];
    *(_QWORD *)((char *)v4 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    *(_DWORD *)v16 = *(_DWORD *)v17;
    v16[4] = v17[4];
    v18 = a3[10];
    v19 = a3[11];
    v20 = (char *)v4 + v18;
    v21 = (char *)a2 + v18;
    *(_QWORD *)v20 = *(_QWORD *)v21;
    v20[8] = v21[8];
    *(_QWORD *)((char *)v4 + v19) = *(_QWORD *)((char *)a2 + v19);
    v22 = a3[13];
    *(_QWORD *)((char *)v4 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
    v23 = (char *)v4 + v22;
    v24 = (char *)a2 + v22;
    *(_QWORD *)v23 = *(_QWORD *)v24;
    v23[8] = v24[8];
    v25 = a3[15];
    *((_BYTE *)v4 + a3[14]) = *((_BYTE *)a2 + a3[14]);
    *((_BYTE *)v4 + v25) = *((_BYTE *)a2 + v25);
    v26 = a3[17];
    *((_BYTE *)v4 + a3[16]) = *((_BYTE *)a2 + a3[16]);
    v27 = (_QWORD *)((char *)v4 + v26);
    v28 = (_QWORD *)((char *)a2 + v26);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = a3[18];
    v31 = a3[19];
    v32 = (_QWORD *)((char *)v4 + v30);
    v33 = (_QWORD *)((char *)a2 + v30);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    v35 = (char *)v4 + v31;
    v36 = (char *)a2 + v31;
    *(_QWORD *)v35 = *(_QWORD *)v36;
    v35[8] = v36[8];
    v37 = a3[21];
    *((_BYTE *)v4 + a3[20]) = *((_BYTE *)a2 + a3[20]);
    v38 = (char *)v4 + v37;
    v39 = (char *)a2 + v37;
    *(_DWORD *)v38 = *(_DWORD *)v39;
    v38[4] = v39[4];
    v40 = a3[23];
    *(_QWORD *)((char *)v4 + a3[22]) = *(_QWORD *)((char *)a2 + a3[22]);
    *(_QWORD *)((char *)v4 + v40) = *(_QWORD *)((char *)a2 + v40);
    v41 = a3[25];
    *(_QWORD *)((char *)v4 + a3[24]) = *(_QWORD *)((char *)a2 + a3[24]);
    *((_BYTE *)v4 + v41) = *((_BYTE *)a2 + v41);
    v42 = a3[27];
    *((_BYTE *)v4 + a3[26]) = *((_BYTE *)a2 + a3[26]);
    *(_QWORD *)((char *)v4 + v42) = *(_QWORD *)((char *)a2 + v42);
    v43 = a3[28];
    v44 = a3[29];
    v45 = (char *)v4 + v43;
    v46 = (char *)a2 + v43;
    *(_QWORD *)v45 = *(_QWORD *)v46;
    v45[8] = v46[8];
    v47 = (_QWORD *)((char *)v4 + v44);
    v48 = (_QWORD *)((char *)a2 + v44);
    v49 = v48[1];
    *v47 = *v48;
    v47[1] = v49;
    v50 = a3[30];
    v51 = (_QWORD *)((char *)v4 + v50);
    v52 = (_QWORD *)((char *)a2 + v50);
    v53 = v52[1];
    *v51 = *v52;
    v51[1] = v53;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1AF3DE180(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_1AF3E7694();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_1AF3DE298(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1AF3E7694();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  v13 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  v16 = a3[10];
  v17 = a3[11];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  *(_QWORD *)((char *)a1 + v17) = *(_QWORD *)((char *)a2 + v17);
  v20 = a3[13];
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v23 = a3[15];
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  *((_BYTE *)a1 + v23) = *((_BYTE *)a2 + v23);
  v24 = a3[17];
  *((_BYTE *)a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = a3[18];
  v29 = a3[19];
  v30 = (_QWORD *)((char *)a1 + v28);
  v31 = (_QWORD *)((char *)a2 + v28);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = (char *)a1 + v29;
  v34 = (char *)a2 + v29;
  *(_QWORD *)v33 = *(_QWORD *)v34;
  v33[8] = v34[8];
  v35 = a3[21];
  *((_BYTE *)a1 + a3[20]) = *((_BYTE *)a2 + a3[20]);
  v36 = (char *)a1 + v35;
  v37 = (char *)a2 + v35;
  *(_DWORD *)v36 = *(_DWORD *)v37;
  v36[4] = v37[4];
  v38 = a3[23];
  *(_QWORD *)((char *)a1 + a3[22]) = *(_QWORD *)((char *)a2 + a3[22]);
  *(_QWORD *)((char *)a1 + v38) = *(_QWORD *)((char *)a2 + v38);
  v39 = a3[25];
  *(_QWORD *)((char *)a1 + a3[24]) = *(_QWORD *)((char *)a2 + a3[24]);
  *((_BYTE *)a1 + v39) = *((_BYTE *)a2 + v39);
  v40 = a3[27];
  *((_BYTE *)a1 + a3[26]) = *((_BYTE *)a2 + a3[26]);
  *(_QWORD *)((char *)a1 + v40) = *(_QWORD *)((char *)a2 + v40);
  v41 = a3[28];
  v42 = a3[29];
  v43 = (char *)a1 + v41;
  v44 = (char *)a2 + v41;
  *(_QWORD *)v43 = *(_QWORD *)v44;
  v43[8] = v44[8];
  v45 = (_QWORD *)((char *)a1 + v42);
  v46 = (_QWORD *)((char *)a2 + v42);
  v47 = v46[1];
  *v45 = *v46;
  v45[1] = v47;
  v48 = a3[30];
  v49 = (_QWORD *)((char *)a1 + v48);
  v50 = (_QWORD *)((char *)a2 + v48);
  v51 = v50[1];
  *v49 = *v50;
  v49[1] = v51;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1AF3DE564(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  int v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1AF3E7694();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v15 = a3[9];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *(_DWORD *)v17;
  v16[4] = v17[4];
  *(_DWORD *)v16 = v18;
  v19 = a3[10];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = *(_QWORD *)v21;
  v20[8] = v21[8];
  *(_QWORD *)v20 = v22;
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = a3[13];
  v24 = (char *)a1 + v23;
  v25 = (char *)a2 + v23;
  v26 = *(_QWORD *)v25;
  v24[8] = v25[8];
  *(_QWORD *)v24 = v26;
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
  *((_BYTE *)a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  v27 = a3[17];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = a3[18];
  v31 = (_QWORD *)((char *)a1 + v30);
  v32 = (_QWORD *)((char *)a2 + v30);
  *v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33 = a3[19];
  v34 = (char *)a1 + v33;
  v35 = (char *)a2 + v33;
  v36 = *(_QWORD *)v35;
  v34[8] = v35[8];
  *(_QWORD *)v34 = v36;
  *((_BYTE *)a1 + a3[20]) = *((_BYTE *)a2 + a3[20]);
  v37 = a3[21];
  v38 = (char *)a1 + v37;
  v39 = (char *)a2 + v37;
  LODWORD(v36) = *(_DWORD *)v39;
  v38[4] = v39[4];
  *(_DWORD *)v38 = v36;
  *(_QWORD *)((char *)a1 + a3[22]) = *(_QWORD *)((char *)a2 + a3[22]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[23]) = *(_QWORD *)((char *)a2 + a3[23]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[24]) = *(_QWORD *)((char *)a2 + a3[24]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_BYTE *)a1 + a3[25]) = *((_BYTE *)a2 + a3[25]);
  *((_BYTE *)a1 + a3[26]) = *((_BYTE *)a2 + a3[26]);
  *(_QWORD *)((char *)a1 + a3[27]) = *(_QWORD *)((char *)a2 + a3[27]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = a3[28];
  v41 = (char *)a1 + v40;
  v42 = (char *)a2 + v40;
  v43 = *(_QWORD *)v42;
  v41[8] = v42[8];
  *(_QWORD *)v41 = v43;
  v44 = a3[29];
  v45 = (_QWORD *)((char *)a1 + v44);
  v46 = (_QWORD *)((char *)a2 + v44);
  *v45 = *v46;
  v45[1] = v46[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v47 = a3[30];
  v48 = (_QWORD *)((char *)a1 + v47);
  v49 = (_QWORD *)((char *)a2 + v47);
  *v48 = *v49;
  v48[1] = v49[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_1AF3DE918(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1AF3E7694();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  v13 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_DWORD *)v14 = *(_DWORD *)v15;
  v14[4] = v15[4];
  v16 = a3[10];
  v17 = a3[11];
  v18 = (char *)a1 + v16;
  v19 = (char *)a2 + v16;
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v18[8] = v19[8];
  *(_QWORD *)((char *)a1 + v17) = *(_QWORD *)((char *)a2 + v17);
  v20 = a3[13];
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  *(_QWORD *)v21 = *(_QWORD *)v22;
  v21[8] = v22[8];
  v23 = a3[15];
  *((_BYTE *)a1 + a3[14]) = *((_BYTE *)a2 + a3[14]);
  *((_BYTE *)a1 + v23) = *((_BYTE *)a2 + v23);
  v24 = a3[17];
  *((_BYTE *)a1 + a3[16]) = *((_BYTE *)a2 + a3[16]);
  *(_OWORD *)((char *)a1 + v24) = *(_OWORD *)((char *)a2 + v24);
  v25 = a3[19];
  *(_OWORD *)((char *)a1 + a3[18]) = *(_OWORD *)((char *)a2 + a3[18]);
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  *(_QWORD *)v26 = *(_QWORD *)v27;
  v26[8] = v27[8];
  v28 = a3[21];
  *((_BYTE *)a1 + a3[20]) = *((_BYTE *)a2 + a3[20]);
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  *(_DWORD *)v29 = *(_DWORD *)v30;
  v29[4] = v30[4];
  v31 = a3[23];
  *(_QWORD *)((char *)a1 + a3[22]) = *(_QWORD *)((char *)a2 + a3[22]);
  *(_QWORD *)((char *)a1 + v31) = *(_QWORD *)((char *)a2 + v31);
  v32 = a3[25];
  *(_QWORD *)((char *)a1 + a3[24]) = *(_QWORD *)((char *)a2 + a3[24]);
  *((_BYTE *)a1 + v32) = *((_BYTE *)a2 + v32);
  v33 = a3[27];
  *((_BYTE *)a1 + a3[26]) = *((_BYTE *)a2 + a3[26]);
  *(_QWORD *)((char *)a1 + v33) = *(_QWORD *)((char *)a2 + v33);
  v34 = a3[28];
  v35 = a3[29];
  v36 = (char *)a1 + v34;
  v37 = (char *)a2 + v34;
  *(_QWORD *)v36 = *(_QWORD *)v37;
  v36[8] = v37[8];
  *(_OWORD *)((char *)a1 + v35) = *(_OWORD *)((char *)a2 + v35);
  *(_OWORD *)((char *)a1 + a3[30]) = *(_OWORD *)((char *)a2 + a3[30]);
  return a1;
}

_QWORD *sub_1AF3DEB40(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1AF3E7694();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  v15 = a3[9];
  v16 = a3[10];
  v17 = (char *)a1 + v15;
  v18 = (char *)a2 + v15;
  v17[4] = v18[4];
  *(_DWORD *)v17 = *(_DWORD *)v18;
  v19 = (char *)a1 + v16;
  v20 = (char *)a2 + v16;
  v19[8] = v20[8];
  *(_QWORD *)v19 = *(_QWORD *)v20;
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  swift_bridgeObjectRelease();
  v21 = a3[13];
  v22 = a3[14];
  v23 = (char *)a1 + v21;
  v24 = (char *)a2 + v21;
  v23[8] = v24[8];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  *((_BYTE *)a1 + v22) = *((_BYTE *)a2 + v22);
  v25 = a3[16];
  *((_BYTE *)a1 + a3[15]) = *((_BYTE *)a2 + a3[15]);
  *((_BYTE *)a1 + v25) = *((_BYTE *)a2 + v25);
  v26 = a3[17];
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (_QWORD *)((char *)a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  v31 = a3[18];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v35 = *v33;
  v34 = v33[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  v36 = a3[19];
  v37 = a3[20];
  v38 = (char *)a1 + v36;
  v39 = (char *)a2 + v36;
  v38[8] = v39[8];
  *(_QWORD *)v38 = *(_QWORD *)v39;
  *((_BYTE *)a1 + v37) = *((_BYTE *)a2 + v37);
  v40 = a3[21];
  v41 = a3[22];
  v42 = (char *)a1 + v40;
  v43 = (char *)a2 + v40;
  v42[4] = v43[4];
  *(_DWORD *)v42 = *(_DWORD *)v43;
  *(_QWORD *)((char *)a1 + v41) = *(_QWORD *)((char *)a2 + v41);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[23]) = *(_QWORD *)((char *)a2 + a3[23]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[24]) = *(_QWORD *)((char *)a2 + a3[24]);
  swift_bridgeObjectRelease();
  v44 = a3[26];
  *((_BYTE *)a1 + a3[25]) = *((_BYTE *)a2 + a3[25]);
  *((_BYTE *)a1 + v44) = *((_BYTE *)a2 + v44);
  *(_QWORD *)((char *)a1 + a3[27]) = *(_QWORD *)((char *)a2 + a3[27]);
  swift_bridgeObjectRelease();
  v45 = a3[28];
  v46 = a3[29];
  v47 = (char *)a1 + v45;
  v48 = (char *)a2 + v45;
  *(_QWORD *)v47 = *(_QWORD *)v48;
  v47[8] = v48[8];
  v49 = (_QWORD *)((char *)a1 + v46);
  v50 = (_QWORD *)((char *)a2 + v46);
  v52 = *v50;
  v51 = v50[1];
  *v49 = v52;
  v49[1] = v51;
  swift_bridgeObjectRelease();
  v53 = a3[30];
  v54 = (_QWORD *)((char *)a1 + v53);
  v55 = (_QWORD *)((char *)a2 + v53);
  v57 = *v55;
  v56 = v55[1];
  *v54 = v57;
  v54[1] = v56;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AF3DEE50()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF3DEE5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1AF3DEEE0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF3DEEEC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE3B4B8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void sub_1AF3DEF6C()
{
  unint64_t v0;

  sub_1AF3DF048();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1AF3DF048()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EEE3B188)
  {
    sub_1AF3E7694();
    v0 = sub_1AF3E7C10();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EEE3B188);
  }
}

ValueMetadata *type metadata accessor for RecordingOptions.Options.Requests()
{
  return &type metadata for RecordingOptions.Options.Requests;
}

uint64_t sub_1AF3DF0AC(uint64_t a1)
{
  sub_1AF3BE560(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  return a1;
}

void ktrace_postprocessing_set_completed_handler_cold_1()
{
  _os_crash();
  __break(1u);
}

void ktrace_postprocess_file_internal_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void ktrace_postprocess_file_internal_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF33A000, a1, a3, "post-processing complete", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ktrace_postprocess_file_internal_cold_3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AF33A000, a2, OS_LOG_TYPE_ERROR, "failed to start ktrace session to postprocess file (%{errno}d)", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void ktrace_postprocess_file_internal_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF33A000, a1, a3, "starting post-processing", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void ktariadne_read_times_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AF33A000, a2, OS_LOG_TYPE_ERROR, "unable to decode artrace traceinfo extended chunk (%{errno}d)", (uint8_t *)v2, 8u);
}

void kttimesync_init_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get timezone (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void kttimesync_init_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get timebase info (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void kttimesync_init_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to read mach_get_times (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __kttimesync_init_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unable to decode tailspin time chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __kttimesync_init_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get abstime from tailspin time chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_remotetime_update_params_cold_1()
{
  OUTLINED_FUNCTION_3();
  _os_crash();
  __break(1u);
}

void ktrace_set_remotetime_conversion_enabled_cold_2()
{
  _os_crash();
  __break(1u);
}

void _session_process_events_cold_1()
{
  _os_crash();
  __break(1u);
}

void sysctlbyname_string_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "sysctlbyname(%s) failed (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void sysctlbyname_string_cold_7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "sysctlbyname(%s) size returned got larger (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void sysctl_number_internal_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void sysctl_number_internal_cold_6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "sysctl requires too much space %zu (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void create_dict_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unknown error reading dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void create_dict_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "error reading dictionary: %@ (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void create_dict_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "data does not contain a dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void dict_string_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "dictionary value at key '%@' is not a string (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_number_internal_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "cannot convert CFData of size %zu to number (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_number_internal_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "dictionary value at key '%@' should be a number or data (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_BOOL_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "dictionary has no value for key '%@' (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_BOOL_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "dictionary value at key '%@' is not a BOOLean (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_data_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "dictionary value at key '%@' is not data (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_number_arr_internal_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "array value at index %u is not a number (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_number_arr_internal_cold_6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "dictionary value at key '%@' is not an array (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_set_string_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "could not create string from '%s' (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_set_cfstring_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not allocate C string (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void dict_set_number_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "could not create number of type %ld (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void dict_set_number_arr_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not create array (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void dict_set_number_arr_cold_4(int a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;

  LODWORD(v3) = 67109376;
  HIDWORD(v3) = a1;
  LOWORD(v4) = 1024;
  *(_DWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_5(&dword_1AF33A000, a2, a3, "could not create number at index %u (%{errno}d)", v3, v4);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_chunk_map_data_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to map non-file chunk data (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_chunk_map_data_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to map 0 size data of chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_chunk_map_data_cold_6()
{
  __assert_rtn("ktrace_chunk_map_data", "chunk.c", 157, "n <= to_read");
}

void ktrace_chunk_unmap_data_internal_cold_1()
{
  _os_crash();
  __break(1u);
}

void ktrace_chunk_copy_plist_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to map chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_chunk_copy_plist_cold_2(__CFError **a1, int a2, NSObject *a3)
{
  const char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = utf8_cferror(*a1);
  v6 = 136315394;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_error_impl(&dword_1AF33A000, a3, OS_LOG_TYPE_ERROR, "failed to decode plist chunk: %s (%{errno}d)", (uint8_t *)&v6, 0x12u);
}

void ktrace_chunk_iterate_subchunks_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AF33A000, log, OS_LOG_TYPE_DEBUG, "no chunks to iterate", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void ktrace_chunk_iterate_subchunks_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not validate the first chunk for iteration (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void append_eventnames_from_path_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1AF33A000, log, OS_LOG_TYPE_ERROR, "failed to append codes file: %s (%{errno}d)", (uint8_t *)&v3, 0x12u);
}

void ktrace_callback_list_add_cold_4()
{
  _os_crash();
  __break(1u);
}

void safe_encode_cold_3()
{
  _os_crash();
  __break(1u);
}

void ktrace_config_create_current_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to allocate event disabling match (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_config_create_current_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get event disabling matcher (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get lightweight PET status (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get PET idle rate (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get kperf sampling status (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get kperf lazy CPU action (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get kperf lazy CPU time threshold (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get kperf lazy wait action (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get kperf lazy wait time threshold (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get PET timer ID (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get action for kdebug trigger (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_15()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "failed to get period for timer %u (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void config_current_kperf_cold_16()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "failed to get action ID for timer %u (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void config_current_kperf_cold_17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get timer count (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kperf_cold_18()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "failed to get user data for action %u (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void config_current_kperf_cold_19()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "failed to get samplers for action %u (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void config_current_kperf_cold_20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get kperf action count (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kpc_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get periods for KPC (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kpc_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get action IDs for KPC (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void config_current_kpc_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get config for KPC (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_config_serialize_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unknown error reading config dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_config_serialize_cold_3(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl(&dword_1AF33A000, log, OS_LOG_TYPE_ERROR, "error reading config dictionary: %@ (%{errno}d)", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_config_serialize_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "length of serialized config is 0 (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void state_name_cold_1()
{
  _os_crash();
  __break(1u);
}

void owner_kind_name_cold_1()
{
  _os_crash();
  __break(1u);
}

void context_kind_name_cold_1()
{
  _os_crash();
  __break(1u);
}

void trigger_kind_name_cold_1()
{
  _os_crash();
  __break(1u);
}

void ktrace_config_kdebug_pid_included_cold_2()
{
  _os_crash();
  __break(1u);
}

void ktrace_file_append_local_log_content_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get os_log local store (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_log_content_from_store_cold_1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = v0;
  OUTLINED_FUNCTION_3_1(&dword_1AF33A000, v1, (uint64_t)v1, "exception occurred while setting logging predicate: %@ (%{errno}d)", v2);
}

void __ktrace_file_append_log_content_from_store_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to prepare log source for unknown reason (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_cold_2(void *a1, int a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[14];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  OUTLINED_FUNCTION_4();
  v7 = a2;
  OUTLINED_FUNCTION_3_1(&dword_1AF33A000, a3, v5, "failed to prepare log source: %@ (%{errno}d)", v6);
}

void __ktrace_file_append_log_content_from_store_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to append log data (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to append log metadata (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "log stream disconnected while appending (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "log stream backlogged while appending (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "log stream in invalid position while appending (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "log stream requested invalidation while appending (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "log stream unsupported invalidation while appending (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "log stream had insufficient permissions while appending (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "log stream failed to evaluate predicate while appending (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_append_log_content_from_store_block_invoke_4_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "log stream failed to initialize while appending (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_print_trace_point_cold_1()
{
  _os_crash();
  __break(1u);
}

void escape_string_cold_1()
{
  __assert_rtn("escape_string", "event_printing.c", 32, "written >= 1");
}

void thread_cputime_map_update_cold_1()
{
  _os_crash();
  __break(1u);
}

void ktrace_set_thread_cputime_enabled_cold_4()
{
  _os_crash();
  __break(1u);
}

void fd_size_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot get file size (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_open_internal_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "only read %zd bytes of magic word (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_open_internal_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = 4;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1AF33A000, v0, v1, "cannot read %zu bytes at offset 0 to parse version 0 header (%{errno}d)", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_open_internal_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot allocate memory for synthesized artrace chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_open_internal_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot append artrace chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_open_internal_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "cannot read artrace block header at offset %lld (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_open_internal_cold_6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "file size of %lld is too small to contain a valid trace file\n (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_open_internal_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = 288;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1AF33A000, v0, v1, "failed to read V2 header of %zu bytes (%{errno}d)", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_open_internal_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "parsing a V2 file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_chunk_array_next_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9(&dword_1AF33A000, v0, v1, "consuming last chunk at offset %lld, max offset %lld", v2, v3);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_chunk_array_next_cold_6(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = a1[1];
  v5 = 134218496;
  v6 = a2;
  v7 = 1024;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  _os_log_debug_impl(&dword_1AF33A000, log, OS_LOG_TYPE_DEBUG, "found chunk with header at offset %lld, tag 0x%08x size %u", (uint8_t *)&v5, 0x18u);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_chunk_array_next_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot write correct file size to chunk with EOF size (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_chunk_array_next_cold_9()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9(&dword_1AF33A000, v0, v1, "found EOF size on appendable file, writing actual size %llu at offset %llu", v2, v3);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_chunk_array_next_cold_10()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "found invalid chunk at offset %lld\n (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_chunk_array_next_cold_11()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9(&dword_1AF33A000, v0, v1, "no initial chunk and asked to iterate from current offset %lld, starting with offset %lld", v2, v3);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_chunk_array_next_cold_12(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1AF33A000, a2, a3, "no more chunks to return from file, next position %zu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_iterate_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "no chunks to iterate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_iterate_cold_4()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_10();
  _os_log_fault_impl(&dword_1AF33A000, v0, OS_LOG_TYPE_FAULT, "ktrace_chunk_next returned the same chunk", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_iterate_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not validate the first chunk for iteration (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_data_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "cannot write data of size %zu to file (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_append_data_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot seek to end of file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_file_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "failed to open file to append: %s (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_append_file_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "failed to stat file to append: %s (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_append_file_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "failed to map file to append: %s (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_append_file_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "failed to unmap file: %s (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_append_start_internal_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot write chunk header to file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_start_internal_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "cannot extend file by %zu bytes (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_append_start_internal_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_1AF33A000, a2, a3, "aligning appended chunk by %zu bytes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_append_start_internal_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot seek to the end to start appending chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_start_internal_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "chunk with subchunk bit set cannot be created (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_finish_internal_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to write chunk header, truncating the file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_finish_internal_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot append chunk to internal table (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_align_next_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to extend file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_align_next_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to extend file by one byte (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_align_next_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to seek to end (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_update_header_size_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot update header size (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_header_append_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot append header chunk because normal chunks have been appended (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_header_append_chunk_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot append header chunk because chunk is already being appended (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_header_append_chunk_cold_3()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void ktrace_file_header_append_live_cpu_map_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unable to read CPU map (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_thread_map_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unable to read thread map (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "Unrecognized compression level (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "file is not appendable (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_cold_4(int a1, NSObject *a2)
{
  uint64_t v4;
  uint8_t v5[10];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  __error();
  OUTLINED_FUNCTION_19();
  v6 = a1;
  OUTLINED_FUNCTION_18(&dword_1AF33A000, a2, v4, "cannot seek to end of file after writing events %d (%{errno}d)", v5);
}

void ktrace_file_append_live_ktrace_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "start time only supported when compressing (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_transformed_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to allocate read buffer (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_transformed_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to allocate scratch buffer (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_transformed_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to append transformed events to file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_transformed_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not read events from kernel (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_transformed_cold_7()
{
  os_log_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1AF33A000, v0, OS_LOG_TYPE_DEBUG, "starting to read for %u ms", v1, 8u);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_ktrace_transformed_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "compression or filtering must be requested (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_append_live_filtered_ktrace_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "Unrecognized compression level (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_compress_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to allocate scratch buffer (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_compress_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get path to input file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_compress_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to create temporary file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_compress_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to fcopyfile (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void append_transformed_events_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to map chunk data (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_capture_live_stackshot_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to create stackshot config (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_capture_live_stackshot_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "stackshot failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_capture_live_stackshot_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to set flags on stackshot config %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_walltime_offset_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "timezone not available, using local timezone instead", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_earliest_timestamp_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "never set timestamp from events (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_earliest_timestamp_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "inner iteration failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_earliest_timestamp_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to iterate file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_latest_timestamp_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to iterate file to find last timestamp (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_write_header_system_default_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unknown error reading machine dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_write_header_system_default_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "error reading machine dictionary: %@ (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace_file_write_header_system_default_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not append machine chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_file_write_header_internal_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot write file header when creating new file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_iterate_subfiles_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "invalid subfile: id out of range (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_iterate_subfiles_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "invalid subfile: no header or bad header version (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_iterate_subfiles_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "invalid subfile: bad size or version for subfile id chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_iterate_subfiles_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "invalid subfile: bad size, version, or position for subfile header chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_iterate_subfiles_block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "invalid subfile: bad size or version for subfile relationship chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "no CPU map found in V1 file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot read magic number for CPU map (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot read number of CPUs in CPU map (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_4()
{
  int v0;
  NSObject *v1;
  uint8_t v2[10];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19();
  v3 = v0;
  OUTLINED_FUNCTION_18(&dword_1AF33A000, v1, (uint64_t)v1, "value at CPU count was %u (%{errno}d)", v2);
  OUTLINED_FUNCTION_3_0();
}

void parse_v1_file_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot create chunk for CPU map (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "CPU map found in V1+ file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot append synthesized CPU map chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int128 v3;

  LOWORD(v3) = 2048;
  *(_QWORD *)((char *)&v3 + 2) = a2;
  OUTLINED_FUNCTION_11(&dword_1AF33A000, a2, a3, "CPU map found with %u CPUs, of size %llu", 67109376, (_QWORD)v3);
  OUTLINED_FUNCTION_3_0();
}

void parse_v1_file_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "CPU map location cannot be determined (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "synthesized thread map chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "walltime in V1 header in high bytes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v1_file_cold_12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "read only %zu bytes of V1 header (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void parse_v1_file_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "parsing a V1 file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void parse_v3_header_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "only read %zu bytes of V3 header (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void parse_v3_header_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9(&dword_1AF33A000, v0, v1, "V3 file has header with size %llu, header size %llu", v2, v3);
  OUTLINED_FUNCTION_3_0();
}

void parse_v3_header_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  __int128 v4;

  v3 = "active";
  if (!*(_DWORD *)(a1 + 184))
    v3 = "inactive";
  LOWORD(v4) = 2080;
  *(_QWORD *)((char *)&v4 + 2) = v3;
  OUTLINED_FUNCTION_11(&dword_1AF33A000, a2, a3, "file has timezone of %u minutes west, DST %s", 67109378, (const char *)v4);
  OUTLINED_FUNCTION_3_0();
}

void __parse_artrace_file_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "size of artrace trace info block is smaller than structure (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __parse_artrace_file_block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = 0;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1AF33A000, v0, v1, "size of artrace extended trace info block is %llu (%{errno}d)", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3_0();
}

void __parse_artrace_file_block_invoke_cold_7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "cannot allocate memory for artrace extended trace info data of size %llu (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void __parse_artrace_file_block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not find K64 key in extended trace info block (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __parse_artrace_file_block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not get 32-bit unsigned integer from CFNumber (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __parse_artrace_file_block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unsupported type for k64 value (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_thread_map_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot append synthesized thread map chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_thread_map_chunk_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "cannot allocate %zu bytes to read thread map (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void synthesize_thread_map_chunk_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "V1 file is 32-bits with uintptr_t aligned 4", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_thread_map_chunk_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "V1 file is 32-bits with uintptr_t aligned 8", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_thread_map_chunk_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "V1 file is 64-bits", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_thread_map_chunk_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "V1 thread map is not valid (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_thread_map_chunk_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "V1 file has no 64-bit thread map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_thread_map_chunk_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "V1 file has no 32-bit thread map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_events_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot read first event's timestamp (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_events_chunk_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot create chunk for events (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_events_chunk_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot append synthesized events chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_events_chunk_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 134218240;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 280) - a2;
  OUTLINED_FUNCTION_9(&dword_1AF33A000, a2, a3, "creating synthetic events chunk at offset %lld of size %lld", *(_QWORD *)v3, *(_QWORD *)&v3[8]);
  OUTLINED_FUNCTION_3_0();
}

void synthesize_events_chunk_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "first 64-bit event's unused field is 0, cannot be a 32-bit file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void synthesize_events_chunk_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot read first 64-bit event's unused field (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_iterate_subfile_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "invalid subfile: unexpected subchunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_file_iterate_subfile_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "invalid subfile: bad size, version, or position for subfile id chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void setup_events_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to start appending chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void setup_events_chunk_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to append events header to chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void finish_events_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to finish appending chunk (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void finish_events_chunk_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to update compressed events count (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void flatbuffers::FlatBufferBuilder::GetBufferPointer()
{
  __assert_rtn("Finished", "flatbuffers.h", 1321, "finished");
}

{
  __assert_rtn("data", "flatbuffers.h", 1020, "cur_");
}

void flatbuffers::Allocator::reallocate_downward()
{
  __assert_rtn("reallocate_downward", "flatbuffers.h", 691, "new_size > old_size");
}

void flatbuffers::FlatBufferBuilder::NotNested()
{
  __assert_rtn("NotNested", "flatbuffers.h", 1436, "!num_field_loc");
}

{
  __assert_rtn("NotNested", "flatbuffers.h", 1434, "!nested");
}

void flatbuffers::vector_downward::ensure_space()
{
  __assert_rtn("ensure_space", "flatbuffers.h", 992, "cur_ >= scratch_ && scratch_ >= buf_");
}

{
  __assert_rtn("ensure_space", "flatbuffers.h", 996, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
}

void flatbuffers::FlatBufferBuilder::ReferTo()
{
  __assert_rtn("ReferTo", "flatbuffers.h", 1421, "off && off <= GetSize()");
}

void flatbuffers::FlatBufferBuilder::EndTable()
{
  __assert_rtn("EndTable", "flatbuffers.h", 1452, "nested");
}

{
  __assert_rtn("EndTable", "flatbuffers.h", 1467, "table_object_size < 0x10000");
}

{
  __assert_rtn("scratch_end", "flatbuffers.h", 1030, "scratch_");
}

{
  __assert_rtn("scratch_data", "flatbuffers.h", 1025, "buf_");
}

{
  __assert_rtn("EndTable", "flatbuffers.h", 1478, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
}

void flatbuffers::FlatBufferBuilder::EndVector()
{
  __assert_rtn("EndVector", "flatbuffers.h", 1673, "nested");
}

void flatbuffers::FlatBufferBuilder::Finish()
{
  __assert_rtn("Finish", "flatbuffers.h", 2155, "strlen(file_identifier) == kFileIdentifierLength");
}

void _session_start_file_cold_4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AF33A000, log, OS_LOG_TYPE_DEBUG, "no timebase found in the file; using current system timebase",
    v1,
    2u);
}

void _session_start_file_cold_5(int *a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_debug_impl(&dword_1AF33A000, log, OS_LOG_TYPE_DEBUG, "no timebase found in the file; using supplemental timebase (%d / %d)",
    (uint8_t *)v5,
    0xEu);
}

void _session_start_live_cold_1()
{
  _os_crash();
  __break(1u);
}

void _session_start_live_cold_2()
{
  _os_crash();
  __break(1u);
}

void _session_start_live_cold_4()
{
  OUTLINED_FUNCTION_7();
  _os_crash();
  __break(1u);
}

void _session_start_live_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF33A000, a1, a3, "capturing stackshot", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _session_start_live_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF33A000, a1, a3, "enabling tracing in the kernel", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _session_start_live_cold_9(uint64_t *a1, int a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  OUTLINED_FUNCTION_3_1(&dword_1AF33A000, a3, (uint64_t)a3, "failed to start tracing with providers: %@ (%{errno}d)", (uint8_t *)&v4);
}

void _session_start_live_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unable to disable tracing for existing trace mode (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _session_start_live_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot set event match disable (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _session_start_live_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "unable to initialize tracing (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _session_start_live_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "existing session cannot take over live session (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _session_start_live_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "attempt to trace from two sessions at once denied (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _session_start_live_cold_15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "attempt to live trace but not available (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _session_start_live_cold_16(int a1, NSObject *a2)
{
  uint64_t v4;
  uint8_t v5[10];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  geteuid();
  OUTLINED_FUNCTION_6();
  v6 = a1;
  OUTLINED_FUNCTION_18(&dword_1AF33A000, a2, v4, "cannot live trace with euid %d (%{errno}d)", v5);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_reset_existing_cold_1()
{
  _os_crash();
  __break(1u);
}

void __drain_events_block_block_invoke_cold_1()
{
  _os_crash();
  __break(1u);
}

void __drain_events_block_block_invoke_cold_4(int a1, int a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 136315394;
  v7 = strerror(a1);
  v8 = 1024;
  v9 = a2;
  OUTLINED_FUNCTION_3_1(&dword_1AF33A000, a3, v5, "trace collection failed: %s (%{errno}d)", (uint8_t *)&v6);
  OUTLINED_FUNCTION_5_1();
}

void __drain_events_block_block_invoke_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AF33A000, a1, a3, "trace returned empty", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __drain_events_block_block_invoke_cold_7()
{
  int v0;
  NSObject *v1;
  uint8_t v2[10];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = v0;
  OUTLINED_FUNCTION_18(&dword_1AF33A000, v1, (uint64_t)v1, "trace collection failed: %d (%{errno}d)", v2);
}

void kdebug_wait_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KERN_KDBUFWAIT failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void kdebug_read_events_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "KERN_KDREADTR failed to read %zu bytes (%{errno}d)");
}

void kdebug_write_events_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KERN_KDWRITETR failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void kdebug_get_bufinfo_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KERN_KDGETBUF failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void kdebug_alloc_current_cpu_map_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KERN_KDCPUMAP_EXT failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void kdebug_alloc_current_cpu_map_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "KERN_KDCPUMAP_EXT failed %zu (%{errno}d)");
}

void kdebug_alloc_current_thread_map_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KERN_KDREADCURTHRMAP failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void kdebug_alloc_thread_map_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KERN_KDTHRMAP failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace::RingBufferImpl::handleTracepoint()
{
  __assert_rtn("handleTracepoint", "time_ringbuffer.cpp", 492, "nextChunk");
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "WARNING: The maximum ring buffer size has been reached. The trace will not be able to cover the full requested ring buffer time. (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace::RingBufferImpl::handlerSupportCheckTimeTruncation()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "ERROR: Timestamp size exceeded. Trace file will probably be corrupted and unreadable. You can fix this by rebooting. (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace::RingBufferImpl::handlerSupportCheckTimeBackwards(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;

  LODWORD(v3) = 67109376;
  HIDWORD(v3) = *(unsigned __int8 *)(a1 + 3);
  LOWORD(v4) = 1024;
  *(_DWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_5(&dword_1AF33A000, a2, a3, "ERROR: Timestamps out of order for class 0x%x. Trace file will probably be corrupted and unreadable. Please file a bug against Purple Ariadne with this trace. (%{errno}d)", v3, v4);
  OUTLINED_FUNCTION_3_0();
}

void ktrace::RingBufferImpl::handleCompletion()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "ERROR: Failed to create kdebug events chunk in output file (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "ERROR: The trace buffer has lost samples. This is currently not supported by the UI. Run with --help-dropped-events for additional help. (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace::RingBufferImpl::handleCompletion(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1AF33A000, log, OS_LOG_TYPE_ERROR, "ERROR: Failed to write %ld kdebug events into chunk in output file (%{errno}d)", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

void ktrace::RingBufferImpl::RingBufferImpl()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "ERROR: Couldn't allocate ring buffer. (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "ERROR: Couldn't get total memory size: %{darwin.errno}d (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void ktrace::MemoryPool<ktrace::RingBufferHeader>::reapMemory()
{
  __assert_rtn("reapMemory", "time_ringbuffer.cpp", 203, "numPages > 0");
}

void _session_end_internal_cold_3()
{
  _os_crash();
  __break(1u);
}

void _session_teardown_cold_2()
{
  _os_crash();
  __break(1u);
}

void _session_teardown_cold_4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AF33A000, a2, OS_LOG_TYPE_ERROR, "could not find last timestamp, not writing summary chunk (%{errno}d)", (uint8_t *)v2, 8u);
}

void ktrace_start_cold_4()
{
  _os_crash();
  __break(1u);
}

void ktrace_start_cold_6()
{
  _os_crash();
  __break(1u);
}

void ktrace_start_cold_9()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void ktrace_start_cold_11()
{
  _os_crash();
  __break(1u);
}

void ktrace_start_cold_12(unsigned __int8 *a1)
{
  atomic_load(a1);
  OUTLINED_FUNCTION_3();
  _os_crash();
  __break(1u);
}

void ktrace_file_append_ioreg_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AF33A000, a2, OS_LOG_TYPE_ERROR, "error writing ioreg plist (%{errno}d)", (uint8_t *)v2, 8u);
}

void ktrace_machine_create_current_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to fill machine from sysctl (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_create_current_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "device UUID is NULL, cannot create machine (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_create_current_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not set internal content in dict (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_create_current_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to fill machine clusters (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_create_current_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to get IORegistry entry for cpus (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_create_current_cold_7(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_5_2(&dword_1AF33A000, a3, (uint64_t)a3, "ignoring CPU due to missing logical-cpu-id property", a1);
}

void ktrace_machine_create_current_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot find BuildVersion in SupplementalVersionDictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_create_current_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot find ProductName in SupplementalVersionDictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_create_current_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot find ProductVersion in SupplementalVersionDictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_fill_name_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, a2, a3, "cannot determine if current task is entitled to user-assigned device name: %@ (%{errno}d)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_WORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void ktrace_machine_fill_name_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_5_2(&dword_1AF33A000, a1, a3, "cannot access user-assigned device name without entitlement", v3);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_fill_volume_size_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "overflow when getting root volume size (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_fill_volume_size_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "could not set root volume size in dict (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_fill_volume_size_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot stat root node (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_create_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 136315394;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
}

void ktrace_machine_v1_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_v1_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot find clusters by CPU in machine dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_v1_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_v1_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot find dies by CPU in machine dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_machine_v1_4_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
}

void ktrace_start_writing_fd_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, a2, a3, "unable to create output ktrace_file when starting to trace (%{errno}d)", a5, a6, a7, a8, 0);
}

void ktrace_start_writing_file_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, a2, a3, "unable to open output trace file (%{errno}d)", a5, a6, a7, a8, 0);
}

void _session_ensure_uuidmap_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AF33A000, a2, OS_LOG_TYPE_ERROR, "failed to get ktrace_machine_t for session. (%{errno}d)", (uint8_t *)v2, 8u);
}

void ktrace_stream_iterate_group_cold_4()
{
  _os_crash();
  __break(1u);
}

void convert_events_cold_5(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_1AF33A000, a2, OS_LOG_TYPE_DEBUG, "did not convert data, provided data with size %zu", (uint8_t *)&v2, 0xCu);
}

void ktrace_iter_init_chunk_cold_2(const __CFData *a1, uint64_t *a2, NSObject *a3)
{
  CFIndex Length;
  uint64_t v6;
  int v7;
  CFIndex v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  Length = CFDataGetLength(a1);
  v6 = *a2;
  v7 = 134218240;
  v8 = Length;
  v9 = 2048;
  v10 = v6;
  _os_log_debug_impl(&dword_1AF33A000, a3, OS_LOG_TYPE_DEBUG, "decompressed %zu bytes, but expected %zu", (uint8_t *)&v7, 0x16u);
}

void kthmap_update_stackshot_cold_2(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_3(a1, a2);
  OUTLINED_FUNCTION_3_2(&dword_1AF33A000, v2, v3, "invalid stackshot", v4);
}

void kthmap_update_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "new thread has no associated task (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void kthmap_update_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AF33A000, log, OS_LOG_TYPE_DEBUG, "task unique ID's aren't consistent", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void ktrace_thread_map_update_prepass_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "thread groups found on 32-bit target (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void create_dictionary_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to create CFData for dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void create_dictionary_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "failed to create property list from data (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void create_dictionary_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "deserialized property list is not a dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ariadne_thread_dict_apply_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot find pid key in thread dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ariadne_thread_dict_apply_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot convert tid key to number (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _ariadne_process_dict_apply_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "cannot find name key in thread dictionary (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_create_cold_1(char a1, uint64_t a2, NSObject *a3)
{
  int v3;
  int v4;

  if ((a1 & 1) != 0)
    LOWORD(v3) = 0;
  else
    v3 = *(_DWORD *)(a2 + 196);
  LOWORD(v4) = 1024;
  HIWORD(v4) = v3;
  OUTLINED_FUNCTION_5(&dword_1AF33A000, a2, a3, "unknown arch: type = %#x, subtype = %#x", 67109376, v4);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_address_space_append()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "refusing to append symbol owner with a null uuid to address space!\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_24();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_17(&dword_1AF33A000, v1, (uint64_t)v1, "refusing to append a second shared cache to address space!\nold start address = %llx\nnew start address = %llx\n", v2);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_address_space_from_stackshot()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "bad stackshot: unbalanced containers!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "bad stackshot: no STACKSHOT_KCTYPE_TASK_SNAPSHOT or pid is -1", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_address_space_from_stackshot(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_5_3(a1, a2);
  OUTLINED_FUNCTION_6_0(&dword_1AF33A000, v2, (uint64_t)v2, "invalid stackshot", v3);
}

void ktrace_uuid_map_update_with_stackshot_cold_1()
{
  __assert_rtn("ktrace_address_space_merge", "trace_symbolicate.mm", 1201, "owner->start <= old_owner.start");
}

void ktrace_address_space_deep_iterate_symbol_owners()
{
  _os_crash();
  __break(1u);
}

void ktrace_uuid_map_learn_tailspin_process_info_with_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "invalid tailspin process info chunk: plist decode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_tailspin_process_info_with_chunk_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "invalid tailspin process info chunk: bad Pid or LoadInfos", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_tailspin_process_info_with_chunk_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_13_0(&dword_1AF33A000, v0, v1, "tailspin process info chunk invalid pid (%ld), ignoring", v2);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_uuid_map_learn_tailspin_process_info_with_chunk_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "not a dict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_tailspin_process_info_with_chunk_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "not a number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_tailspin_symbols_with_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "invalid tailspin symbols chunk: plist decode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_tailspin_symbols_with_chunk_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "tailspin symbols chunk says size is zero.  Guessing size from symbols", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_tailspin_symbols_with_chunk_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "invalid tailspin symbols chunk: bad Size, UUID_String or TEXT_EXEC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_tailspin_symbols_with_chunk_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "not a BOOLean", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_tailspin_symbols_with_chunk_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "not a string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_ariadne_process_dict_with_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "invalid ariadne chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_uuid_map_learn_ariadne_process_dict_with_chunk_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "invalid process dict in ariadne chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_uuid_map_learn_ariadne_process_dict_with_chunk_block_invoke_cold_6(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_5_3(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_1AF33A000, v2, (uint64_t)v2, "not a string", v3);
}

void __ktrace_uuid_map_learn_ariadne_process_dict_with_chunk_block_invoke_cold_8(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_5_3(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_1AF33A000, v2, (uint64_t)v2, "not a number", v3);
}

void __ktrace_uuid_map_learn_ariadne_process_dict_with_chunk_block_invoke_cold_10(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_5_3(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_1AF33A000, v2, (uint64_t)v2, "not a dictionary", v3);
}

void __ktrace_uuid_map_learn_ariadne_process_dict_with_chunk_block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "not an array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_inodes_with_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "failed to map inodes chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_inodes_with_chunk_cold_2(__CFError **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  utf8_cferror(*a1);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_11_0(&dword_1AF33A000, v1, v2, "failed to decode inodes chunk: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_uuid_map_learn_inodes_with_chunk_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "saw a second inodes chunk!?  Invalid file.  Ignoring.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_read_process_info_dict()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "process info dict has no images", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "process info dict image has no uuid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "process info dict segment has no name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "process info dict segment has no address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_13_0(&dword_1AF33A000, v0, v1, "process info dict segment has invalid address: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "process info dict segment has no length", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_13_0(&dword_1AF33A000, v0, v1, "process info dict segment has invalid length: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "process info dict has invalid uuid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "process info dict has no pid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_read_process_info_dict(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_5_3(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_1AF33A000, v2, (uint64_t)v2, "not an array", v3);
}

void ktrace_uuid_map_learn_kernelmap_with_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "failed to parse kernel map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_uuid_map_learn_process_info_with_chunk_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "failed to parse process info chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void dyldtp_decode_window_update()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_14_0(&dword_1AF33A000, v0, v1, "ignoring DBG_DYLD tracepoint with a threadid of -1, at time %llu", v2);
  OUTLINED_FUNCTION_3_0();
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "DBG_DYLD decode error.  UUID high bits cut off.  rdar://problem/53183775", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___Z31ktrace_uuid_map_update_internalP15ktrace_uuid_mapP14ktrace_sessionP12ktrace_pointbbU13block_pointerFv12PrepassOpRefE_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 48);
  *(_DWORD *)a3 = 136315394;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2048;
  *(_QWORD *)(a3 + 14) = v4;
  OUTLINED_FUNCTION_19_0(&dword_1AF33A000, "missing dyld unload event for uuid %s at address %llx rdar://problem/54088896", (uint8_t *)a3, a4);
}

void ___Z31ktrace_uuid_map_update_internalP15ktrace_uuid_mapP14ktrace_sessionP12ktrace_pointbbU13block_pointerFv12PrepassOpRefE_block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_21(a1, a2, a3, 4.8151e-34);
  OUTLINED_FUNCTION_19_0(&dword_1AF33A000, "dyld tracepoints show a lib(%s), likely from sharedcache(%s), but no dscsym available", v3, v4);
}

void ___Z31ktrace_uuid_map_update_internalP15ktrace_uuid_mapP14ktrace_sessionP12ktrace_pointbbU13block_pointerFv12PrepassOpRefE_block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "got null UUID from DBG_DYLD_UUID_MAP_A", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_address_space_merge_owner()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "kext UUID mismatch rdar://problem/56379326", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___Z31ktrace_uuid_map_update_internalP15ktrace_uuid_mapP14ktrace_sessionP12ktrace_pointbbU13block_pointerFv12PrepassOpRefE_block_invoke_2_58_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "got null UUID from DBG_DYLD_UUID_SHARED_CACHE_A", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void make_image_summary(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t Path;
  __int16 v7;
  uint64_t Name;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 136315394;
  Path = CSSymbolOwnerGetPath();
  v7 = 2080;
  Name = CSSymbolOwnerGetName();
  OUTLINED_FUNCTION_17(&dword_1AF33A000, a3, v4, "null uuid found for symbol owner (%s, %s)", (uint8_t *)&v5);
}

uint64_t make_image_summary(void *a1, const char *a2, uint64_t a3, uint64_t a4, void *a5)
{
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  int v13;
  int Pid;
  uint64_t result;

  bzero(a1, 0x801uLL);
  v8 = strlen(a2);
  v9 = 1024;
  if (v8 < 0x400)
    v9 = v8;
  if (v9)
  {
    v10 = 2 * v9;
    v11 = 2049;
    v12 = (char *)a1;
    do
    {
      v13 = *a2++;
      snprintf(v12, v11, "%0hhx", v13);
      v11 -= 2;
      v12 += 2;
    }
    while (v10 + v11 != 2049);
  }
  CSSymbolOwnerGetSymbolicator();
  if ((CSIsNull() & 1) != 0)
    Pid = -1;
  else
    Pid = CSSymbolicatorGetPid();
  bzero(a5, 0xC00uLL);
  result = snprintf((char *)a5, 0xC00uLL, "non-UTF-8 path: %s, pid: %d", (const char *)a1, Pid);
  qword_1EEE3BE68 = (uint64_t)a5;
  __break(1u);
  return result;
}

void ktrace_uuid_map_postprocess_file_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_24();
  _os_log_debug_impl(&dword_1AF33A000, v0, OS_LOG_TYPE_DEBUG, "no CPU count found in file, using %llu", v1, 0xCu);
  OUTLINED_FUNCTION_3_0();
}

void __ktrace_uuid_map_postprocess_file_block_invoke_7_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "failed to visit UUIDs: %d (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void __ktrace_uuid_map_postprocess_file_block_invoke_7_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "failed to create thread for call: %d (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void __ktrace_symbolicate_file_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "invalid symbols chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_symbolicate_file_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "failed to map symbols chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_make_symbolicator(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "failed to create a symbolicator for %s\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "failed to set up symbolicator for %s: expected 1 symbol owner\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_symboilcator_learn_ariadne_chunk()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "invalid ariadne chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_symboilcator_learn_tailspin_chunk()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "invalid tailspin symbols chunk: bad UUID_String, TEXT_EXEC or Symbols", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_copy_symbolicator_from_chunk_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "failed to read signature in symbols chunk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_copy_symbolicator_from_chunk_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1AF33A000, v0, v1, "failed to read symbols chunk header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_address_space_create_cssymbolicator()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "Couldn't find any binary image infos.  Symbolicator will be NULL\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ktrace_dsym_search_configuration_create_with_plist_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "ktrace_dsym_search_configuration_create_with_plist(): not a dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __ktrace_dsym_search_configuration_create_with_plist_block_invoke_cold_1(const __CFString *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  utf8(a1);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_11_0(&dword_1AF33A000, v1, v2, "unknown dsym_search_configuration key: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_symbols_buffer_to_text_cold_1()
{
  __assert_rtn("Verifier", "flatbuffers.h", 2286, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
}

void ___ZL42ktrace_uuid_map_learn_inodes_with_chunk_v0P15ktrace_uuid_mapPK14__CFDictionary_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "invalid inode map\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void CSRegionGetSegmentName(const char *a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = "<unknown>";
  if (a1)
    v3 = a1;
  v4 = 136315394;
  v5 = a2;
  v6 = 2080;
  v7 = v3;
  OUTLINED_FUNCTION_17(&dword_1AF33A000, a3, (uint64_t)a3, "malformed segment name: '%s', from macho: '%s'", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

void ktrace_collect_uuid_offset()
{
  _os_crash();
  __break(1u);
}

void ___ZL27ktrace_add_symbols_for_uuidP21symbolication_contextP11UUIDContext_block_invoke_cold_1(uint64_t *a1, unsigned __int8 **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_22(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "failed to create signature for %s\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

void ___ZL27ktrace_add_symbols_for_uuidP21symbolication_contextP11UUIDContext_block_invoke_164_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AF33A000, v0, v1, "failed to write symbols chunk\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ___ZL27ktrace_add_symbols_for_uuidP21symbolication_contextP11UUIDContext_block_invoke_164_cold_2(uint64_t *a1, unsigned __int8 **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_22(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "added symbols for %s\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_executable(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "could not find executable for %s\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_executable()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_4(&dword_1AF33A000, v0, v1, "fdopen failed!\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_14_0(&dword_1AF33A000, v0, v1, "failed to parse output from command: %s\n", v2);
  OUTLINED_FUNCTION_3_0();
}

{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10_0();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1AF33A000, v1, OS_LOG_TYPE_ERROR, "command failed: %s (exit status %d)\n", v2, 0x12u);
  OUTLINED_FUNCTION_3_0();
}

{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  OUTLINED_FUNCTION_25(v0);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_11_0(&dword_1AF33A000, v1, v2, "pipe failed: %s\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_executable(FILE *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = ferror(a1);
  strerror(v3);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_13_0(&dword_1AF33A000, a2, v4, "error reading from pipe! %s\n", v5);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_executable(const __CFString *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  utf8(a1);
  OUTLINED_FUNCTION_10_0();
  v7 = 2080;
  v8 = a2;
  OUTLINED_FUNCTION_23(&dword_1AF33A000, a3, v5, "found executable: %s\n\tusing command: %s\n", v6);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_executable(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  OUTLINED_FUNCTION_25(v2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_13_0(&dword_1AF33A000, a1, v3, "waitpid failed! %s\n", v4);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_executable(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_25(a1);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_11_0(&dword_1AF33A000, v1, v2, "posix_spawn failed: %s\n", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_arch_with_default(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "could not figure out arch for %s\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_segment_count(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "could not figure segment count for %s\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

void ktrace_find_image_type(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "could not figure out image type for %s\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

void ___ZL42ktrace_address_space_create_cssymbolicatorP21symbolication_contextP20ktrace_address_space_block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_21(a1, a2, a3, 4.8151e-34);
  OUTLINED_FUNCTION_23(&dword_1AF33A000, v5, v3, "coulnd't figure out segment length for %s of %s\n", v4);
}

void ktrace_iterate_segments(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_13_0(&dword_1AF33A000, a3, (uint64_t)a3, "invalid image summary for %s", (uint8_t *)a2);
}

void ktrace_find_base_address(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_16_0(a1, a2);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_8_0(&dword_1AF33A000, v2, v3, "could not figure out base address for %s\n", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_5_1();
}

void flatbuffers::IntToStringHex()
{
  __assert_rtn("IntToStringHex", "util.h", 208, "i >= 0");
}

void flatbuffers::IterateObject()
{
  __assert_rtn("InlineSize", "minireflect.h", 101, "false");
}

{
  __assert_rtn("InlineSize", "minireflect.h", 99, "false");
}

void flatbuffers::IterateValue()
{
  __assert_rtn("IterateValue", "minireflect.h", 200, "prev_val");
}

{
  __assert_rtn("Get", "flatbuffers.h", 279, "i < size()");
}

{
  __assert_rtn("IterateValue", "minireflect.h", 227, "false");
}

void trace_set_enable_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "KDENABLE sysctl failed setting to %d (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_get_bufinfo_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KDGETBUF sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void trace_readtrace_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KDREADTR sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void trace_set_filter_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KDSET_TYPEFILTER sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void trace_parse_filter_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "parsing filter: invalid directive: '%s' (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_parse_filter_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "parsing filter: invalid class: %s (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_parse_filter_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "parsing filter: class out of range: %s (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_parse_filter_cold_4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "parsing filter: unexpected extra string contents in class filter: '%s' (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_parse_filter_cold_5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "parsing filter: invalid subclass: %s (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_parse_filter_cold_6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "parsing filter: subclass out of range: %s (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_parse_filter_cold_7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1AF33A000, v0, v1, "parsing filter: unexpected extra string contents in subclass filter: '%s' (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_parse_filter_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "parsing filter: unexpected end of string (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void trace_set_pid_filter_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KDPID{TR,EX} sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void trace_initialize_bufs_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KERN_KDSETBUF sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void trace_initialize_bufs_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KERN_KDSETUP sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void trace_set_flags_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "KDEFLAGS %u sysctl failed (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

void trace_set_event_match_disable_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KDSET_EDM sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void trace_readcurthreadmap_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1AF33A000, v0, v1, "KDREADCURTHRMAP sysctl failed (%{errno}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void vfs_trace_paths_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5(&dword_1AF33A000, v0, v1, "vfs.generic.trace_paths sysctl failed with error %d (%{errno}d)");
  OUTLINED_FUNCTION_3_0();
}

uint64_t sub_1AF3E74B4()
{
  return MEMORY[0x1E0CADFF0]();
}

uint64_t sub_1AF3E74C0()
{
  return MEMORY[0x1E0CAE008]();
}

uint64_t sub_1AF3E74CC()
{
  return MEMORY[0x1E0CAE010]();
}

uint64_t sub_1AF3E74D8()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1AF3E74E4()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1AF3E74F0()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1AF3E74FC()
{
  return MEMORY[0x1E0CAE118]();
}

uint64_t sub_1AF3E7508()
{
  return MEMORY[0x1E0CAE120]();
}

uint64_t sub_1AF3E7514()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1AF3E7520()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1AF3E752C()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1AF3E7538()
{
  return MEMORY[0x1E0CAE3A0]();
}

uint64_t sub_1AF3E7544()
{
  return MEMORY[0x1E0CAE400]();
}

uint64_t sub_1AF3E7550()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1AF3E755C()
{
  return MEMORY[0x1E0CAE440]();
}

uint64_t sub_1AF3E7568()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1AF3E7574()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1AF3E7580()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1AF3E758C()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1AF3E7598()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1AF3E75A4()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1AF3E75B0()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1AF3E75BC()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1AF3E75C8()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1AF3E75D4()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1AF3E75E0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1AF3E75EC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1AF3E75F8()
{
  return MEMORY[0x1E0CAFD20]();
}

uint64_t sub_1AF3E7604()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1AF3E7610()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1AF3E761C()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1AF3E7628()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1AF3E7634()
{
  return MEMORY[0x1E0CAFE68]();
}

uint64_t sub_1AF3E7640()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1AF3E764C()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1AF3E7658()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1AF3E7664()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1AF3E7670()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1AF3E767C()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1AF3E7688()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1AF3E7694()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1AF3E76A0()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1AF3E76AC()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1AF3E76B8()
{
  return MEMORY[0x1E0CB00F0]();
}

uint64_t sub_1AF3E76C4()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1AF3E76D0()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1AF3E76DC()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1AF3E76E8()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1AF3E76F4()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1AF3E7700()
{
  return MEMORY[0x1E0CB0978]();
}

uint64_t sub_1AF3E770C()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1AF3E7718()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1AF3E7724()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1AF3E7730()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1AF3E773C()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1AF3E7748()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1AF3E7754()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1AF3E7760()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1AF3E776C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1AF3E7778()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1AF3E7784()
{
  return MEMORY[0x1E0DF2040]();
}

uint64_t sub_1AF3E7790()
{
  return MEMORY[0x1E0DF2060]();
}

uint64_t sub_1AF3E779C()
{
  return MEMORY[0x1E0DF2068]();
}

uint64_t sub_1AF3E77A8()
{
  return MEMORY[0x1E0DF2058]();
}

uint64_t sub_1AF3E77B4()
{
  return MEMORY[0x1E0DF00C0]();
}

uint64_t sub_1AF3E77C0()
{
  return MEMORY[0x1E0DF00C8]();
}

uint64_t sub_1AF3E77CC()
{
  return MEMORY[0x1E0DF00F8]();
}

uint64_t sub_1AF3E77D8()
{
  return MEMORY[0x1E0DF0100]();
}

uint64_t sub_1AF3E77E4()
{
  return MEMORY[0x1E0DF0110]();
}

uint64_t sub_1AF3E77F0()
{
  return MEMORY[0x1E0DF0128]();
}

uint64_t sub_1AF3E77FC()
{
  return MEMORY[0x1E0DF0130]();
}

uint64_t sub_1AF3E7808()
{
  return MEMORY[0x1E0DF0138]();
}

uint64_t sub_1AF3E7814()
{
  return MEMORY[0x1E0DF0150]();
}

uint64_t sub_1AF3E7820()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1AF3E782C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1AF3E7838()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1AF3E7844()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1AF3E7850()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1AF3E785C()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1AF3E7868()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1AF3E7874()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1AF3E7880()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1AF3E788C()
{
  return MEMORY[0x1E0DEA2B8]();
}

uint64_t sub_1AF3E7898()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1AF3E78A4()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1AF3E78B0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1AF3E78BC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1AF3E78C8()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1AF3E78D4()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1AF3E78E0()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1AF3E78EC()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1AF3E78F8()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1AF3E7904()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1AF3E7910()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1AF3E791C()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1AF3E7928()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t sub_1AF3E7934()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1AF3E7940()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1AF3E794C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1AF3E7958()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1AF3E7964()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1AF3E7970()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1AF3E797C()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1AF3E7988()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1AF3E7994()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1AF3E79A0()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1AF3E79AC()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1AF3E79B8()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1AF3E79C4()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1AF3E79D0()
{
  return MEMORY[0x1E0DEA8C0]();
}

uint64_t sub_1AF3E79DC()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1AF3E79E8()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1AF3E79F4()
{
  return MEMORY[0x1E0DEA948]();
}

uint64_t sub_1AF3E7A00()
{
  return MEMORY[0x1E0DEA958]();
}

uint64_t sub_1AF3E7A0C()
{
  return MEMORY[0x1E0DEA9C0]();
}

uint64_t sub_1AF3E7A18()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1AF3E7A24()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1AF3E7A30()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1AF3E7A3C()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1AF3E7A48()
{
  return MEMORY[0x1E0DEAA68]();
}

uint64_t sub_1AF3E7A54()
{
  return MEMORY[0x1E0DEAA80]();
}

uint64_t sub_1AF3E7A60()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1AF3E7A6C()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_1AF3E7A78()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1AF3E7A84()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t sub_1AF3E7A90()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1AF3E7A9C()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1AF3E7AA8()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1AF3E7AB4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1AF3E7AC0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1AF3E7ACC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1AF3E7AD8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1AF3E7AE4()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1AF3E7AF0()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1AF3E7AFC()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1AF3E7B08()
{
  return MEMORY[0x1E0DEB110]();
}

uint64_t sub_1AF3E7B14()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1AF3E7B20()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1AF3E7B2C()
{
  return MEMORY[0x1E0DEB598]();
}

uint64_t sub_1AF3E7B38()
{
  return MEMORY[0x1E0DEB678]();
}

uint64_t sub_1AF3E7B44()
{
  return MEMORY[0x1E0DEB698]();
}

uint64_t sub_1AF3E7B50()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1AF3E7B5C()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1AF3E7B68()
{
  return MEMORY[0x1E0DEF7E8]();
}

uint64_t sub_1AF3E7B74()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1AF3E7B80()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1AF3E7B8C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1AF3E7B98()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1AF3E7BA4()
{
  return MEMORY[0x1E0DEF988]();
}

uint64_t sub_1AF3E7BB0()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1AF3E7BBC()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1AF3E7BC8()
{
  return MEMORY[0x1E0DEFA30]();
}

uint64_t sub_1AF3E7BD4()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1AF3E7BE0()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1AF3E7BEC()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1AF3E7BF8()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1AF3E7C04()
{
  return MEMORY[0x1E0CB2078]();
}

uint64_t sub_1AF3E7C10()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1AF3E7C1C()
{
  return MEMORY[0x1E0DEB980]();
}

uint64_t sub_1AF3E7C28()
{
  return MEMORY[0x1E0DEB988]();
}

uint64_t sub_1AF3E7C34()
{
  return MEMORY[0x1E0DEBA70]();
}

uint64_t sub_1AF3E7C40()
{
  return MEMORY[0x1E0DEBA80]();
}

uint64_t sub_1AF3E7C4C()
{
  return MEMORY[0x1E0DEBB48]();
}

uint64_t sub_1AF3E7C58()
{
  return MEMORY[0x1E0DEBB50]();
}

uint64_t sub_1AF3E7C64()
{
  return MEMORY[0x1E0DEBB58]();
}

uint64_t sub_1AF3E7C70()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1AF3E7C7C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1AF3E7C88()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1AF3E7C94()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1AF3E7CA0()
{
  return MEMORY[0x1E0CB2460]();
}

uint64_t sub_1AF3E7CAC()
{
  return MEMORY[0x1E0CB2558]();
}

uint64_t sub_1AF3E7CB8()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1AF3E7CC4()
{
  return MEMORY[0x1E0DEBCE0]();
}

uint64_t sub_1AF3E7CD0()
{
  return MEMORY[0x1E0DEBCF8]();
}

uint64_t sub_1AF3E7CDC()
{
  return MEMORY[0x1E0DEBD18]();
}

uint64_t sub_1AF3E7CE8()
{
  return MEMORY[0x1E0DEBD60]();
}

uint64_t sub_1AF3E7CF4()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t sub_1AF3E7D00()
{
  return MEMORY[0x1E0DEBD98]();
}

uint64_t sub_1AF3E7D0C()
{
  return MEMORY[0x1E0DEBDA8]();
}

uint64_t sub_1AF3E7D18()
{
  return MEMORY[0x1E0DEBDB0]();
}

uint64_t sub_1AF3E7D24()
{
  return MEMORY[0x1E0DEBDC8]();
}

uint64_t sub_1AF3E7D30()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t sub_1AF3E7D3C()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t sub_1AF3E7D48()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t sub_1AF3E7D54()
{
  return MEMORY[0x1E0DEBE48]();
}

uint64_t sub_1AF3E7D60()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1AF3E7D6C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1AF3E7D78()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1AF3E7D84()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1AF3E7D90()
{
  return MEMORY[0x1E0DEC1C0]();
}

uint64_t sub_1AF3E7D9C()
{
  return MEMORY[0x1E0DEC1D8]();
}

uint64_t sub_1AF3E7DA8()
{
  return MEMORY[0x1E0DEC208]();
}

uint64_t sub_1AF3E7DB4()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1AF3E7DC0()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1AF3E7DCC()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1AF3E7DD8()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1AF3E7DE4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1AF3E7DF0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1AF3E7DFC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1AF3E7E08()
{
  return MEMORY[0x1E0DEC468]();
}

uint64_t sub_1AF3E7E14()
{
  return MEMORY[0x1E0DEC480]();
}

uint64_t sub_1AF3E7E20()
{
  return MEMORY[0x1E0DEC488]();
}

uint64_t sub_1AF3E7E2C()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1AF3E7E38()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1AF3E7E44()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1AF3E7E50()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1AF3E7E5C()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1AF3E7E68()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1AF3E7E74()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t sub_1AF3E7E80()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1AF3E7E8C()
{
  return MEMORY[0x1E0DEC958]();
}

uint64_t sub_1AF3E7E98()
{
  return MEMORY[0x1E0DEC960]();
}

uint64_t sub_1AF3E7EA4()
{
  return MEMORY[0x1E0DEC968]();
}

uint64_t sub_1AF3E7EB0()
{
  return MEMORY[0x1E0DECA10]();
}

uint64_t sub_1AF3E7EBC()
{
  return MEMORY[0x1E0DECA18]();
}

uint64_t sub_1AF3E7EC8()
{
  return MEMORY[0x1E0DECA20]();
}

uint64_t sub_1AF3E7ED4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1AF3E7EE0()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1AF3E7EEC()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1AF3E7EF8()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1AF3E7F04()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1AF3E7F10()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1AF3E7F1C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1AF3E7F28()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_1AF3E7F34()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1AF3E7F40()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1AF3E7F4C()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1AF3E7F58()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1AF3E7F64()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1AF3E7F70()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1AF3E7F7C()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1AF3E7F88()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1AF3E7F94()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1AF3E7FA0()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1AF3E7FAC()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1AF3E7FB8()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1AF3E7FC4()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1AF3E7FD0()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1AF3E7FDC()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1AF3E7FE8()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1AF3E7FF4()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1AF3E8000()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1AF3E800C()
{
  return MEMORY[0x1E0DED1B8]();
}

uint64_t sub_1AF3E8018()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1AF3E8024()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t sub_1AF3E8030()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1AF3E803C()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1AF3E8048()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t sub_1AF3E8054()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1AF3E8060()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1AF3E806C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1AF3E8078()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1AF3E8084()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1AF3E8090()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1AF3E809C()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1AF3E80A8()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1AF3E80B4()
{
  return MEMORY[0x1E0DEDED0]();
}

uint64_t sub_1AF3E80C0()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1AF3E80CC()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1AF3E80D8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1AF3E80E4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1AF3E80F0()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1AF3E80FC()
{
  return MEMORY[0x1E0DEDF20]();
}

uint64_t sub_1AF3E8108()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1AF3E8114()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1AF3E8120()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1AF3E812C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1AF3E8138()
{
  return MEMORY[0x1E0DEE8B8]();
}

uint64_t sub_1AF3E8144()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1AF3E8150()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1AF3E815C()
{
  return MEMORY[0x1E0DEE978]();
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x1E0C97D08](theArray, range.location, range.length, value, comparator, context);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x1E0C98760]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1E0C994D0](url, error);
}

uint64_t CSAddressSetAdd()
{
  return MEMORY[0x1E0D19F28]();
}

uint64_t CSAddressSetCreate()
{
  return MEMORY[0x1E0D19F30]();
}

uint64_t CSArchitectureGetArchitectureForName()
{
  return MEMORY[0x1E0D19F38]();
}

uint64_t CSArchitectureGetFamilyName()
{
  return MEMORY[0x1E0D19F58]();
}

uint64_t CSArchitectureIsArm()
{
  return MEMORY[0x1E0D19F78]();
}

uint64_t CSArchitectureIsArm64()
{
  return MEMORY[0x1E0D19F90]();
}

uint64_t CSArchitectureIsX86_64()
{
  return MEMORY[0x1E0D19F98]();
}

uint64_t CSIsNull()
{
  return MEMORY[0x1E0D19FC0]();
}

uint64_t CSRegionGetName()
{
  return MEMORY[0x1E0D19FF0]();
}

uint64_t CSRegionGetRange()
{
  return MEMORY[0x1E0D19FF8]();
}

uint64_t CSRegionGetSymbolOwner()
{
  return MEMORY[0x1E0D1A008]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1E0D1A010]();
}

uint64_t CSRetain()
{
  return MEMORY[0x1E0D1A020]();
}

uint64_t CSSourceInfoGetFilename()
{
  return MEMORY[0x1E0D1A038]();
}

uint64_t CSSourceInfoGetLineNumber()
{
  return MEMORY[0x1E0D1A048]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x1E0D1A080]();
}

uint64_t CSSymbolOwnerCreateSparseSignature()
{
  return MEMORY[0x1E0D1A0B8]();
}

uint64_t CSSymbolOwnerForeachSegment()
{
  return MEMORY[0x1E0D1A0D8]();
}

uint64_t CSSymbolOwnerGetArchitecture()
{
  return MEMORY[0x1E0D1A0E8]();
}

uint64_t CSSymbolOwnerGetBaseAddress()
{
  return MEMORY[0x1E0D1A0F8]();
}

uint64_t CSSymbolOwnerGetCFUUIDBytes()
{
  return MEMORY[0x1E0D1A110]();
}

uint64_t CSSymbolOwnerGetFlags()
{
  return MEMORY[0x1E0D1A120]();
}

uint64_t CSSymbolOwnerGetName()
{
  return MEMORY[0x1E0D1A128]();
}

uint64_t CSSymbolOwnerGetPath()
{
  return MEMORY[0x1E0D1A138]();
}

uint64_t CSSymbolOwnerGetSymbolicator()
{
  return MEMORY[0x1E0D1A180]();
}

uint64_t CSSymbolOwnerIsAOut()
{
  return MEMORY[0x1E0D1A190]();
}

uint64_t CSSymbolOwnerIsDyld()
{
  return MEMORY[0x1E0D1A1A0]();
}

uint64_t CSSymbolOwnerIsDyldSharedCache()
{
  return MEMORY[0x1E0D1A1A8]();
}

uint64_t CSSymbolicatorCreateWithBinaryImageListCountPidFlagsAndNotification()
{
  return MEMORY[0x1E0D1A1E0]();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return MEMORY[0x1E0D1A208]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x1E0D1A230]();
}

uint64_t CSSymbolicatorCreateWithSignature()
{
  return MEMORY[0x1E0D1A240]();
}

uint64_t CSSymbolicatorCreateWithURLAndArchitecture()
{
  return MEMORY[0x1E0D1A260]();
}

uint64_t CSSymbolicatorForeachSymbolOwnerAtTime()
{
  return MEMORY[0x1E0D1A288]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithPath()
{
  return MEMORY[0x1E0D1A2A0]();
}

uint64_t CSSymbolicatorForeachSymbolicatorWithURL()
{
  return MEMORY[0x1E0D1A2B8]();
}

uint64_t CSSymbolicatorGetArchitecture()
{
  return MEMORY[0x1E0D1A2D0]();
}

uint64_t CSSymbolicatorGetPid()
{
  return MEMORY[0x1E0D1A2E8]();
}

uint64_t CSSymbolicatorGetSourceInfoWithAddressAtTime()
{
  return MEMORY[0x1E0D1A308]();
}

uint64_t CSSymbolicatorGetSymbolOwner()
{
  return MEMORY[0x1E0D1A310]();
}

uint64_t CSSymbolicatorGetSymbolOwnerCountAtTime()
{
  return MEMORY[0x1E0D1A328]();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return MEMORY[0x1E0D1A348]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1E0CBB8F0](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x1E0CBB920](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetLocationInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t location)
{
  return MEMORY[0x1E0CBB928](*(_QWORD *)&entry, plane, location);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return MEMORY[0x1E0CBB940](*(_QWORD *)&entry, plane, name);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1E0CBB988](*(_QWORD *)&entry, entryID);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return MEMORY[0x1E0CBB9B8](*(_QWORD *)&mainPort);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA08](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t OSLogLookupPathWithUUID()
{
  return MEMORY[0x1E0D446D8]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _IOObjectGetClass()
{
  return MEMORY[0x1E0CBBAA0]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1E0C809D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4720]();
}

{
  return MEMORY[0x1E0DE4728]();
}

{
  return MEMORY[0x1E0DE4730]();
}

{
  return MEMORY[0x1E0DE4738]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E5F6B990();
}

void operator delete(void *__p)
{
  off_1E5F6B998(__p);
}

uint64_t operator delete()
{
  return off_1E5F6B9A0();
}

uint64_t operator new[]()
{
  return off_1E5F6B9A8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E5F6B9B0(__sz);
}

uint64_t operator new()
{
  return off_1E5F6B9B8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C80FF8]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C816E0](a1, a2);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x1E0C82EE8](object, finalizer);
}

uint64_t dispatch_source_cancel_and_wait()
{
  return MEMORY[0x1E0C82F18]();
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

uint64_t dscsym_iterate_buffer()
{
  return MEMORY[0x1E0DE57D0]();
}

uint64_t dscsym_mmap_dscsym_for_uuid()
{
  return MEMORY[0x1E0DE57D8]();
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1E0C83088](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C83308](*(_QWORD *)&from_fd, *(_QWORD *)&to_fd, a3, *(_QWORD *)&flags);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83438](__buf, __size, __mode);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1E0C83550](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C83570](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1E0C83670](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

ssize_t getline(char **__linep, size_t *__linecapp, FILE *__stream)
{
  return MEMORY[0x1E0C836E0](__linep, __linecapp, __stream);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return MEMORY[0x1E0C83728](*(_QWORD *)&a1, a2, a3);
}

int getpagesize(void)
{
  return MEMORY[0x1E0C83740]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uint64_t kdebug_typefilter()
{
  return MEMORY[0x1E0C83A30]();
}

uint64_t kpc_get_actionid()
{
  return MEMORY[0x1E0DDC2D8]();
}

uint64_t kpc_get_config()
{
  return MEMORY[0x1E0DDC2E0]();
}

uint64_t kpc_get_config_count()
{
  return MEMORY[0x1E0DDC2E8]();
}

uint64_t kpc_get_counter_count()
{
  return MEMORY[0x1E0DDC2F0]();
}

uint64_t kpc_get_counting()
{
  return MEMORY[0x1E0DDC2F8]();
}

uint64_t kpc_get_period()
{
  return MEMORY[0x1E0DDC300]();
}

uint64_t kpc_get_thread_counting()
{
  return MEMORY[0x1E0DDC308]();
}

uint64_t kpdecode_cursor_clearchunk()
{
  return MEMORY[0x1E0DDC430]();
}

uint64_t kpdecode_cursor_create()
{
  return MEMORY[0x1E0DDC438]();
}

uint64_t kpdecode_cursor_free()
{
  return MEMORY[0x1E0DDC440]();
}

uint64_t kpdecode_cursor_next_record()
{
  return MEMORY[0x1E0DDC448]();
}

uint64_t kpdecode_cursor_set_option()
{
  return MEMORY[0x1E0DDC450]();
}

uint64_t kpdecode_cursor_setchunk()
{
  return MEMORY[0x1E0DDC458]();
}

uint64_t kpdecode_record_free()
{
  return MEMORY[0x1E0DDC460]();
}

uint64_t kperf_action_count_get()
{
  return MEMORY[0x1E0DDC310]();
}

uint64_t kperf_action_count_set()
{
  return MEMORY[0x1E0DDC318]();
}

uint64_t kperf_action_filter_get()
{
  return MEMORY[0x1E0DDC320]();
}

uint64_t kperf_action_samplers_get()
{
  return MEMORY[0x1E0DDC328]();
}

uint64_t kperf_action_samplers_set()
{
  return MEMORY[0x1E0DDC330]();
}

uint64_t kperf_action_userdata_get()
{
  return MEMORY[0x1E0DDC338]();
}

uint64_t kperf_kdebug_action_get()
{
  return MEMORY[0x1E0DDC340]();
}

uint64_t kperf_kdebug_action_set()
{
  return MEMORY[0x1E0DDC348]();
}

uint64_t kperf_kdebug_filter_add_desc()
{
  return MEMORY[0x1E0DDC350]();
}

uint64_t kperf_kdebug_filter_create()
{
  return MEMORY[0x1E0DDC358]();
}

uint64_t kperf_kdebug_filter_create_desc()
{
  return MEMORY[0x1E0DDC360]();
}

uint64_t kperf_kdebug_filter_destroy()
{
  return MEMORY[0x1E0DDC368]();
}

uint64_t kperf_kdebug_filter_get()
{
  return MEMORY[0x1E0DDC370]();
}

uint64_t kperf_kdebug_filter_set()
{
  return MEMORY[0x1E0DDC378]();
}

uint64_t kperf_lazy_cpu_action_get()
{
  return MEMORY[0x1E0DDC380]();
}

uint64_t kperf_lazy_cpu_action_set()
{
  return MEMORY[0x1E0DDC388]();
}

uint64_t kperf_lazy_cpu_time_threshold_get()
{
  return MEMORY[0x1E0DDC390]();
}

uint64_t kperf_lazy_cpu_time_threshold_set()
{
  return MEMORY[0x1E0DDC398]();
}

uint64_t kperf_lazy_wait_action_get()
{
  return MEMORY[0x1E0DDC3A0]();
}

uint64_t kperf_lazy_wait_action_set()
{
  return MEMORY[0x1E0DDC3A8]();
}

uint64_t kperf_lazy_wait_time_threshold_get()
{
  return MEMORY[0x1E0DDC3B0]();
}

uint64_t kperf_lazy_wait_time_threshold_set()
{
  return MEMORY[0x1E0DDC3B8]();
}

uint64_t kperf_ns_to_ticks()
{
  return MEMORY[0x1E0DDC3C0]();
}

uint64_t kperf_reset()
{
  return MEMORY[0x1E0DDC3C8]();
}

uint64_t kperf_sample_get()
{
  return MEMORY[0x1E0DDC3D0]();
}

uint64_t kperf_sample_set()
{
  return MEMORY[0x1E0DDC3D8]();
}

uint64_t kperf_ticks_to_ns()
{
  return MEMORY[0x1E0DDC3E0]();
}

uint64_t kperf_timer_action_get()
{
  return MEMORY[0x1E0DDC3E8]();
}

uint64_t kperf_timer_action_set()
{
  return MEMORY[0x1E0DDC3F0]();
}

uint64_t kperf_timer_count_get()
{
  return MEMORY[0x1E0DDC3F8]();
}

uint64_t kperf_timer_count_set()
{
  return MEMORY[0x1E0DDC400]();
}

uint64_t kperf_timer_lightweight_pet_set()
{
  return MEMORY[0x1E0DDC408]();
}

uint64_t kperf_timer_period_get()
{
  return MEMORY[0x1E0DDC410]();
}

uint64_t kperf_timer_period_set()
{
  return MEMORY[0x1E0DDC418]();
}

uint64_t kperf_timer_pet_get()
{
  return MEMORY[0x1E0DDC420]();
}

uint64_t kperf_timer_pet_set()
{
  return MEMORY[0x1E0DDC428]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F18](size, type_id);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

FILE *__cdecl open_memstream(char **__bufp, size_t *__sizep)
{
  return (FILE *)MEMORY[0x1E0C84498](__bufp, __sizep);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C84B38](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1E0C84B40](a1, *(_QWORD *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1E0C84B48](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B60](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B68](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C18](*(_QWORD *)&type, *(_QWORD *)&typeinfo, buffer, *(_QWORD *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1E0C84DD8](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

uint64_t stackshot_capture_with_config()
{
  return MEMORY[0x1E0C854A8]();
}

uint64_t stackshot_config_create()
{
  return MEMORY[0x1E0C854B0]();
}

uint64_t stackshot_config_dealloc()
{
  return MEMORY[0x1E0C854B8]();
}

uint64_t stackshot_config_get_stackshot_buffer()
{
  return MEMORY[0x1E0C854C0]();
}

uint64_t stackshot_config_get_stackshot_size()
{
  return MEMORY[0x1E0C854C8]();
}

uint64_t stackshot_config_set_flags()
{
  return MEMORY[0x1E0C854D0]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

char *__cdecl strsignal(int __sig)
{
  return (char *)MEMORY[0x1E0C855F8](*(_QWORD *)&__sig);
}

int strsnvisx(char *a1, size_t a2, const char *a3, size_t a4, int a5, const char *a6)
{
  return MEMORY[0x1E0C85600](a1, a2, a3, a4, *(_QWORD *)&a5, a6);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
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

uint64_t swift_dynamicCastTypeToObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBC8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x1E0C85A20](out);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

