uint64_t sub_2496C4464(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2496C9A7C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_2496C9A7C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x24BCF6280](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_2496C4F8C(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_2496C9A7C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_2496C9A1C();
  }
  __break(1u);
  return result;
}

uint64_t sub_2496C461C()
{
  return swift_deallocClassInstance();
}

uint64_t variable initialization expression of HighlightAction._label()
{
  return sub_2496C4724(0x6C6562614CLL, 0xE500000000000000, 0xD00000000000001BLL, 0x80000002496CA410);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCF6490]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of UnhighlightAction._label()
{
  return sub_2496C4724(0x6C6562614CLL, 0xE500000000000000, 0xD00000000000001DLL, 0x80000002496CA430);
}

uint64_t variable initialization expression of TapAction._label()
{
  return sub_2496C4724(0x6C6562614CLL, 0xE500000000000000, 0xD000000000000016, 0x80000002496CA450);
}

uint64_t variable initialization expression of ScrollAction._directionString()
{
  return sub_2496C4724(0x6F69746365726944, 0xE90000000000006ELL, 0xD00000000000001ALL, 0x80000002496CA470);
}

uint64_t sub_2496C4724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[6];

  v37[2] = a3;
  v37[3] = a4;
  v37[0] = a1;
  v37[1] = a2;
  v4 = sub_2496C99A4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7, v8);
  v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v11, v12, v13, v14);
  v16 = (char *)v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v17, v18, v19, v20);
  v22 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v23, v24, v25, v26);
  v28 = (char *)v37 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_2496C99BC();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29, v31, v32, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v28, 0, 1, v29);
  v34 = sub_2496C99D4();
  v37[4] = 0;
  v37[5] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v22, 1, 1, v34);
  v35 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v16, 1, 1, v35);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v10, *MEMORY[0x24BDB6090], v4);
  return sub_2496C9998();
}

uint64_t type metadata accessor for AccessibilityElementSearcher()
{
  return objc_opt_self();
}

unint64_t sub_2496C4968(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2496C9AD0();
  sub_2496C99EC();
  v4 = sub_2496C9ADC();
  return sub_2496C4CC8(a1, a2, v4);
}

uint64_t sub_2496C49CC(uint64_t a1, char a2)
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
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578792B8);
  v6 = sub_2496C9A94();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_2496C6800(v24, v35);
      }
      else
      {
        sub_2496C6748((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2496C9AD0();
      sub_2496C99EC();
      result = sub_2496C9ADC();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_2496C6800(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_2496C4CC8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2496C9AAC() & 1) == 0)
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
      while (!v14 && (sub_2496C9AAC() & 1) == 0);
    }
  }
  return v6;
}

void *sub_2496C4DA8()
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
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578792B8);
  v2 = *v0;
  v3 = sub_2496C9A88();
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
    v20 = 32 * v15;
    sub_2496C6748(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_2496C6800(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

uint64_t sub_2496C4F8C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2496C9A7C();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_2496C9A7C();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_2496C6810();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_2578792C0);
            v10 = sub_2496C5130(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_2496C67C8(0, &qword_2578792B0);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_2496C5130(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2496C51B0(v6, a2, a3);
  return sub_2496C5184;
}

void sub_2496C5184(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2496C51B0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x24BCF6274](a2, a3);
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
    return sub_2496C521C;
  }
  __break(1u);
  return result;
}

void sub_2496C521C(id *a1)
{

}

uint64_t sub_2496C5224(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  char isUniquelyReferenced_nonNull_native;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _OWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  id v28;
  char v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  _OWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  unint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t result;
  void *v50;
  void *v51;
  __int128 v52;
  _OWORD v53[2];
  __int128 v54;
  uint64_t v55;
  unint64_t v56;

  *(_QWORD *)&v52 = a1;
  *((_QWORD *)&v52 + 1) = a2;
  v2 = objc_msgSend((id)objc_opt_self(), sel_systemWideElement);
  if (!v2)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, sel_systemApplication);
  if (!v4)
  {
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    result = sub_2496C9AB8();
    __break(1u);
    return result;
  }
  v56 = MEMORY[0x24BEE4AF8];
  v51 = v4;
  v5 = objc_msgSend(v4, sel_currentApplications);
  if (!v5)
    goto LABEL_48;
  v6 = v5;
  v7 = sub_2496C9A10();

  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
  {
    swift_bridgeObjectRelease();
    v45 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
      goto LABEL_34;
LABEL_38:
    swift_bridgeObjectRetain();
    v47 = sub_2496C9A7C();
    swift_bridgeObjectRelease();
    if (v47 < 1)
      goto LABEL_39;
LABEL_35:
    if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v46 = *(id *)(v45 + 32);
      swift_bridgeObjectRelease();

      return (uint64_t)v46;
    }
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v50 = v3;
  v9 = MEMORY[0x24BEE0D00];
  v10 = v7 + 32;
  do
  {
    sub_2496C6748(v10, (uint64_t)&v54);
    sub_2496C67C8(0, &qword_2578792B0);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_7;
    v11 = *(void **)&v53[0];
    v12 = v9;
    v55 = v9;
    v54 = v52;
    sub_2496C6800(&v54, v53);
    swift_bridgeObjectRetain();
    v13 = (_QWORD *)MEMORY[0x24BEE4B00];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = sub_2496C4968(0x6554686372616573, 0xEA00000000007478);
    v17 = v13[2];
    v18 = (v15 & 1) == 0;
    v19 = v17 + v18;
    if (__OFADD__(v17, v18))
    {
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    v20 = v15;
    if (v13[3] >= v19)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v15 & 1) != 0)
          goto LABEL_16;
      }
      else
      {
        sub_2496C4DA8();
        if ((v20 & 1) != 0)
          goto LABEL_16;
      }
    }
    else
    {
      sub_2496C49CC(v19, isUniquelyReferenced_nonNull_native);
      v21 = sub_2496C4968(0x6554686372616573, 0xEA00000000007478);
      if ((v20 & 1) != (v22 & 1))
        goto LABEL_49;
      v16 = v21;
      if ((v20 & 1) != 0)
      {
LABEL_16:
        v23 = (_OWORD *)(v13[7] + 32 * v16);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v23);
        sub_2496C6800(v53, v23);
        goto LABEL_20;
      }
    }
    v13[(v16 >> 6) + 8] |= 1 << v16;
    v24 = (_QWORD *)(v13[6] + 16 * v16);
    *v24 = 0x6554686372616573;
    v24[1] = 0xEA00000000007478;
    sub_2496C6800(v53, (_OWORD *)(v13[7] + 32 * v16));
    v25 = v13[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
      goto LABEL_43;
    v13[2] = v27;
LABEL_20:
    swift_bridgeObjectRelease();
    v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, 5);
    v55 = sub_2496C67C8(0, &qword_2578792A0);
    *(_QWORD *)&v54 = v28;
    sub_2496C6800(&v54, v53);
    v29 = swift_isUniquelyReferenced_nonNull_native();
    v31 = sub_2496C4968(0x694C746C75736572, 0xEB0000000074696DLL);
    v32 = v13[2];
    v33 = (v30 & 1) == 0;
    v34 = v32 + v33;
    if (__OFADD__(v32, v33))
      goto LABEL_42;
    v35 = v30;
    if (v13[3] >= v34)
    {
      if ((v29 & 1) != 0)
      {
        if ((v30 & 1) == 0)
          goto LABEL_29;
      }
      else
      {
        sub_2496C4DA8();
        if ((v35 & 1) == 0)
          goto LABEL_29;
      }
    }
    else
    {
      sub_2496C49CC(v34, v29);
      v36 = sub_2496C4968(0x694C746C75736572, 0xEB0000000074696DLL);
      if ((v35 & 1) != (v37 & 1))
        goto LABEL_49;
      v31 = v36;
      if ((v35 & 1) == 0)
      {
LABEL_29:
        v13[(v31 >> 6) + 8] |= 1 << v31;
        v39 = (_QWORD *)(v13[6] + 16 * v31);
        *v39 = 0x694C746C75736572;
        v39[1] = 0xEB0000000074696DLL;
        sub_2496C6800(v53, (_OWORD *)(v13[7] + 32 * v31));
        v40 = v13[2];
        v26 = __OFADD__(v40, 1);
        v41 = v40 + 1;
        if (v26)
          goto LABEL_44;
        v13[2] = v41;
        goto LABEL_31;
      }
    }
    v38 = (_OWORD *)(v13[7] + 32 * v31);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v38);
    sub_2496C6800(v53, v38);
LABEL_31:
    swift_bridgeObjectRelease();
    v9 = v12;
    v42 = (void *)sub_2496C99C8();
    swift_bridgeObjectRelease();
    v43 = objc_msgSend(v11, sel_elementsForAttribute_parameter_, 92516, v42);

    if (v43)
    {
      v44 = sub_2496C9A10();

      sub_2496C4464(v44);
    }

LABEL_7:
    v10 += 32;
    --v8;
  }
  while (v8);
  swift_bridgeObjectRelease();
  v45 = v56;
  v3 = v50;
  if (v56 >> 62)
    goto LABEL_38;
LABEL_34:
  if (*(uint64_t *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
    goto LABEL_35;
LABEL_39:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578792A8);
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_2496C9D50;
  *(_QWORD *)(v48 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v48 + 32) = 0xD000000000000025;
  *(_QWORD *)(v48 + 40) = 0x80000002496CA4F0;
  sub_2496C9AC4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 0;
}

id sub_2496C5870(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  id result;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  id v33;
  id v34;
  unint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  uint64_t v53;
  unint64_t v54;

  v2 = a2;
  result = (id)sub_2496C5224(a1, a2);
  if (result)
    return result;
  v41 = (id)objc_opt_self();
  result = objc_msgSend(v41, sel_systemWideElement);
  if (!result)
    goto LABEL_89;
  v45 = result;
  result = objc_msgSend(result, sel_systemApplication);
  if (!result)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  v54 = MEMORY[0x24BEE4AF8];
  v44 = result;
  result = objc_msgSend(result, sel_currentApplications);
  if (!result)
  {
LABEL_91:
    __break(1u);
    return result;
  }
  v5 = result;
  v42 = a1;
  v6 = sub_2496C9A10();

  v7 = *(_QWORD *)(v6 + 16);
  v40 = v2;
  if (!v7)
  {
    result = (id)swift_bridgeObjectRelease();
    v8 = MEMORY[0x24BEE4AF8];
    if (MEMORY[0x24BEE4AF8] >> 62)
      goto LABEL_33;
LABEL_27:
    if (*(uint64_t *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
      goto LABEL_28;
LABEL_34:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578792A8);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_2496C9D50;
    *(_QWORD *)(v23 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v23 + 32) = 0xD000000000000011;
    *(_QWORD *)(v23 + 40) = 0x80000002496CA4D0;
    sub_2496C9AC4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    v21 = 0;
    goto LABEL_35;
  }
  v8 = 0;
  v9 = v6 + 32;
  v2 = (unint64_t)&selRef_supportsAction_;
  v49 = v6;
  v46 = v6 + 32;
  v48 = *(_QWORD *)(v6 + 16);
  do
  {
    if ((unint64_t)v8 >= *(_QWORD *)(v6 + 16))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    sub_2496C6748(v9 + 32 * v8, (uint64_t)v52);
    __swift_project_boxed_opaque_existential_0(v52, v53);
    v10 = (void *)sub_2496C9AA0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v52);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257879298);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_2496C9D60;
    *(_QWORD *)(v11 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 0);
    *(_QWORD *)(v11 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 1);
    sub_2496C9A1C();
    sub_2496C67C8(0, &qword_2578792A0);
    v12 = (void *)sub_2496C9A04();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v10, sel_elementsForAttribute_parameter_, 94500, v12);

    if (!v13)
    {
      swift_unknownObjectRelease();
      goto LABEL_8;
    }
    sub_2496C67C8(0, &qword_2578792B0);
    v14 = sub_2496C9A10();

    if (v14 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = sub_2496C9A7C();
      swift_bridgeObjectRelease();
      if (!v15)
      {
LABEL_25:
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    else
    {
      v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v15)
        goto LABEL_25;
    }
    if (v15 < 1)
      goto LABEL_82;
    for (i = 0; i != v15; ++i)
    {
      if ((v14 & 0xC000000000000001) != 0)
        v17 = (id)MEMORY[0x24BCF6274](i, v14);
      else
        v17 = *(id *)(v14 + 8 * i + 32);
      v18 = v17;
      if (objc_msgSend(v17, sel_supportsAction_, 2007))
      {
        v19 = v18;
        MEMORY[0x24BCF6208]();
        if (*(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2496C9A28();
        sub_2496C9A34();
        sub_2496C9A1C();
      }

    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v6 = v49;
    v9 = v46;
    v7 = v48;
LABEL_8:
    ++v8;
  }
  while (v8 != v7);
  result = (id)swift_bridgeObjectRelease();
  v8 = v54;
  v2 = v40;
  if (!(v54 >> 62))
    goto LABEL_27;
LABEL_33:
  swift_bridgeObjectRetain();
  v22 = sub_2496C9A7C();
  result = (id)swift_bridgeObjectRelease();
  if (v22 < 1)
    goto LABEL_34;
LABEL_28:
  if ((v8 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v20 = *(id *)(v8 + 32);
      goto LABEL_31;
    }
    __break(1u);
LABEL_86:
    __break(1u);
LABEL_87:
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
LABEL_84:
  v20 = (id)MEMORY[0x24BCF6274](0, v8);
LABEL_31:
  v21 = v20;

  swift_bridgeObjectRelease();
LABEL_35:
  objc_msgSend(v21, sel_performAction_, 2068);

  v24 = (void *)objc_opt_self();
  objc_msgSend(v24, sel_sleepForTimeInterval_, 0.3);
  result = (id)sub_2496C5224(v42, v2);
  if (result)
    return result;
  v25 = 0;
  v39 = v24;
  while (1)
  {
    v43 = v25;
    result = objc_msgSend(v41, sel_systemWideElement);
    if (!result)
      goto LABEL_86;
    v45 = result;
    result = objc_msgSend(result, sel_systemApplication);
    if (!result)
      goto LABEL_87;
    v54 = MEMORY[0x24BEE4AF8];
    v44 = result;
    result = objc_msgSend(result, sel_currentApplications);
    if (!result)
      goto LABEL_88;
    v8 = (uint64_t)result;
    v26 = sub_2496C9A10();

    v51 = *(_QWORD *)(v26 + 16);
    if (v51)
      break;
    swift_bridgeObjectRelease();
    v35 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
      goto LABEL_65;
LABEL_73:
    swift_bridgeObjectRetain();
    v8 = sub_2496C9A7C();
    swift_bridgeObjectRelease();
    if (v8 <= 0)
      goto LABEL_76;
LABEL_66:
    if ((v35 & 0xC000000000000001) != 0)
    {
      v36 = (id)MEMORY[0x24BCF6274](0, v35);
    }
    else
    {
      if (!*(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_83;
      v36 = *(id *)(v35 + 32);
    }
    v37 = v36;

    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_performAction_, 2006);

    objc_msgSend(v39, sel_sleepForTimeInterval_, 0.3);
    result = (id)sub_2496C5224(v42, v2);
    if (result)
      return result;
    v25 = v43 + 1;
    if (v43 == 4)
      return 0;
  }
  v2 = 0;
  v50 = v26 + 32;
  v47 = v26;
  while (2)
  {
    if (v2 >= *(_QWORD *)(v26 + 16))
    {
      __break(1u);
LABEL_80:
      __break(1u);
      goto LABEL_81;
    }
    sub_2496C6748(v50 + 32 * v2, (uint64_t)v52);
    __swift_project_boxed_opaque_existential_0(v52, v53);
    v27 = (void *)sub_2496C9AA0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v52);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257879298);
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_2496C9D60;
    *(_QWORD *)(v28 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 0);
    *(_QWORD *)(v28 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 1);
    sub_2496C9A1C();
    sub_2496C67C8(0, &qword_2578792A0);
    v29 = (void *)sub_2496C9A04();
    swift_bridgeObjectRelease();
    v8 = (uint64_t)objc_msgSend(v27, sel_elementsForAttribute_parameter_, 94500, v29);

    if (v8)
    {
      sub_2496C67C8(0, &qword_2578792B0);
      v30 = sub_2496C9A10();

      if ((unint64_t)v30 >> 62)
      {
        if (v30 < 0)
          v8 = v30;
        else
          v8 = v30 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
        v31 = sub_2496C9A7C();
        swift_bridgeObjectRelease();
        if (v31)
        {
LABEL_48:
          if (v31 < 1)
            goto LABEL_80;
          for (j = 0; j != v31; ++j)
          {
            if ((v30 & 0xC000000000000001) != 0)
              v33 = (id)MEMORY[0x24BCF6274](j, v30);
            else
              v33 = *(id *)(v30 + 8 * j + 32);
            v8 = (uint64_t)v33;
            if (objc_msgSend(v33, sel_supportsAction_, 2006))
            {
              v34 = (id)v8;
              MEMORY[0x24BCF6208]();
              if (*(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v54 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_2496C9A28();
              sub_2496C9A34();
              sub_2496C9A1C();
            }

          }
        }
      }
      else
      {
        v31 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v31)
          goto LABEL_48;
      }
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      v26 = v47;
    }
    else
    {
      swift_unknownObjectRelease();
    }
    if (++v2 != v51)
      continue;
    break;
  }
  swift_bridgeObjectRelease();
  v35 = v54;
  v2 = v40;
  if (v54 >> 62)
    goto LABEL_73;
LABEL_65:
  v8 = *(_QWORD *)((v35 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v8 > 0)
    goto LABEL_66;
LABEL_76:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578792A8);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_2496C9D50;
  *(_QWORD *)(v38 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v38 + 32) = 0xD000000000000011;
  *(_QWORD *)(v38 + 40) = 0x80000002496CA4D0;
  sub_2496C9AC4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 0;
}

id sub_2496C6280(unsigned int a1)
{
  id result;
  unint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  unint64_t v29;

  result = objc_msgSend((id)objc_opt_self(), sel_systemWideElement);
  if (!result)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v3 = (unint64_t)result;
  result = objc_msgSend(result, sel_systemApplication);
  if (!result)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v4 = result;
  v29 = MEMORY[0x24BEE4AF8];
  result = objc_msgSend(result, sel_currentApplications);
  if (!result)
  {
LABEL_47:
    __break(1u);
    return result;
  }
  v5 = (unint64_t)result;
  v6 = sub_2496C9A10();

  v7 = *(_QWORD *)(v6 + 16);
  if (!v7)
  {
    result = (id)swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
      goto LABEL_32;
LABEL_38:
    swift_bridgeObjectRetain();
    v21 = sub_2496C9A7C();
    result = (id)swift_bridgeObjectRelease();
    if (v21 < 1)
      goto LABEL_39;
LABEL_33:
    if ((v5 & 0xC000000000000001) != 0)
    {
LABEL_43:
      v19 = (id)MEMORY[0x24BCF6274](0, v5);
      goto LABEL_36;
    }
    if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v19 = *(id *)(v5 + 32);
LABEL_36:
      v20 = v19;

      swift_bridgeObjectRelease();
      return v20;
    }
    __break(1u);
    goto LABEL_45;
  }
  v23 = v4;
  v24 = v3;
  v8 = 0;
  v4 = (void *)(v6 + 32);
  v26 = *(_QWORD *)(v6 + 16);
  v27 = v6;
  v25 = (void *)(v6 + 32);
  do
  {
    if (v8 >= *(_QWORD *)(v6 + 16))
    {
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    sub_2496C6748((uint64_t)v4 + 32 * v8, (uint64_t)v28);
    __swift_project_boxed_opaque_existential_0(v28, v28[3]);
    v9 = (void *)sub_2496C9AA0();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257879298);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_2496C9D60;
    v5 = 0x24BDD16E0uLL;
    *(_QWORD *)(v10 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 0);
    *(_QWORD *)(v10 + 40) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, 1);
    sub_2496C9A1C();
    sub_2496C67C8(0, &qword_2578792A0);
    v3 = sub_2496C9A04();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v9, sel_elementsForAttribute_parameter_, 94500, v3);

    if (!v11)
    {
      swift_unknownObjectRelease();
      goto LABEL_7;
    }
    sub_2496C67C8(0, &qword_2578792B0);
    v3 = sub_2496C9A10();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      v12 = sub_2496C9A7C();
      swift_bridgeObjectRelease();
      if (!v12)
      {
LABEL_30:
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_7;
      }
    }
    else
    {
      v12 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v12)
        goto LABEL_30;
    }
    if (v12 < 1)
      goto LABEL_42;
    v13 = 0;
    v5 = v3 & 0xC000000000000001;
    do
    {
      if (v5)
        v14 = (id)MEMORY[0x24BCF6274](v13, v3);
      else
        v14 = *(id *)(v3 + 8 * v13 + 32);
      v15 = v14;
      if (a1 == 2068)
        v16 = 2007;
      else
        v16 = a1;
      if (a1 == 2069)
        v17 = 2006;
      else
        v17 = v16;
      if ((objc_msgSend(v14, sel_supportsAction_, v17) & 1) != 0)
      {
        v18 = v15;
        MEMORY[0x24BCF6208]();
        if (*(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2496C9A28();
        sub_2496C9A34();
        sub_2496C9A1C();
      }
      ++v13;

    }
    while (v12 != v13);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v7 = v26;
    v6 = v27;
    v4 = v25;
LABEL_7:
    ++v8;
  }
  while (v8 != v7);
  result = (id)swift_bridgeObjectRelease();
  v5 = v29;
  v4 = v23;
  v3 = v24;
  if (v29 >> 62)
    goto LABEL_38;
LABEL_32:
  if (*(uint64_t *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
    goto LABEL_33;
LABEL_39:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578792A8);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_2496C9D50;
  *(_QWORD *)(v22 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v22 + 32) = 0xD000000000000011;
  *(_QWORD *)(v22 + 40) = 0x80000002496CA4D0;
  sub_2496C9AC4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 0;
}

uint64_t sub_2496C6748(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_2496C67C8(uint64_t a1, unint64_t *a2)
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

_OWORD *sub_2496C6800(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_2496C6810()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578792C8;
  if (!qword_2578792C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578792C0);
    result = MEMORY[0x24BCF64A8](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2578792C8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BCF649C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t HighlightAction.init(with:)(uint64_t a1, uint64_t a2)
{
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
  char *v14;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v36 = a1;
  v37 = a2;
  v2 = sub_2496C99A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v9, v10, v11, v12);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v21, v22, v23, v24);
  v26 = (char *)&v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_2496C99BC();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27, v29, v30, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v26, 0, 1, v27);
  v32 = sub_2496C99D4();
  v38 = 0;
  v39 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v20, 1, 1, v32);
  v33 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v14, 1, 1, v33);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v8, *MEMORY[0x24BDB6090], v2);
  v34 = sub_2496C9998();
  v38 = v36;
  v39 = v37;
  swift_retain();
  sub_2496C998C();
  swift_release();
  return v34;
}

uint64_t sub_2496C6B0C()
{
  uint64_t v0;

  v0 = sub_2496C99BC();
  __swift_allocate_value_buffer(v0, static HighlightAction.title);
  __swift_project_value_buffer(v0, (uint64_t)static HighlightAction.title);
  return sub_2496C99B0();
}

uint64_t HighlightAction.title.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_2578791A0 != -1)
    swift_once();
  v0 = sub_2496C99BC();
  return __swift_project_value_buffer(v0, (uint64_t)static HighlightAction.title);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static HighlightAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578791A0 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static HighlightAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static HighlightAction.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_2578791A0 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static HighlightAction.title);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static HighlightAction.title.modify())()
{
  uint64_t v0;

  if (qword_2578791A0 != -1)
    swift_once();
  v0 = sub_2496C99BC();
  __swift_project_value_buffer(v0, (uint64_t)static HighlightAction.title);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t HighlightAction.perform()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_2496C9A58();
  v2[4] = sub_2496C9A4C();
  sub_2496C9A40();
  return swift_task_switch();
}

uint64_t sub_2496C6E00()
{
  uint64_t v0;

  swift_release();
  HighlightAction.execute()();
  sub_2496C9974();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Bool __swiftcall HighlightAction.execute()()
{
  id v0;
  void *v1;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for AccessibilityActivationController();
  swift_initStackObject();
  if (!_AXSApplicationAccessibilityEnabled())
  {
    _AXSApplicationAccessibilitySetEnabled();
    objc_msgSend((id)objc_opt_self(), sel_sleepForTimeInterval_, 0.3);
  }
  swift_release();
  sub_2496C9980();
  v0 = sub_2496C5870(v3, v4);
  if (v0)
  {
    v1 = (void *)sub_2496C99E0();
    objc_msgSend(v0, sel_performAction_withValue_, 5500, v1);
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v0 != 0;
}

BOOL sub_2496C6F3C()
{
  return HighlightAction.execute()();
}

uint64_t sub_2496C6F44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578791A0 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static HighlightAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2496C6FF0(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;

  v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  sub_2496C9A58();
  v2[4] = sub_2496C9A4C();
  sub_2496C9A40();
  return swift_task_switch();
}

uint64_t sub_2496C7060@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _s15UINavigationKit15HighlightActionVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_2496C7084()
{
  sub_2496C73F0();
  return sub_2496C995C();
}

uint64_t _s15UINavigationKit15HighlightActionVACycfC_0()
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
  char *v12;
  uint64_t v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  unint64_t v35;

  v0 = sub_2496C99A4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3, v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v19, v20, v21, v22);
  v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_2496C99BC();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25, v27, v28, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);
  v30 = sub_2496C99D4();
  v34 = 0;
  v35 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v18, 1, 1, v30);
  v31 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v12, 1, 1, v31);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v6, *MEMORY[0x24BDB6090], v0);
  v32 = sub_2496C9998();
  v34 = 0;
  v35 = 0xE000000000000000;
  swift_retain();
  sub_2496C998C();
  swift_release();
  return v32;
}

unint64_t sub_2496C7314()
{
  unint64_t result;

  result = qword_2578792D8;
  if (!qword_2578792D8)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for HighlightAction, &type metadata for HighlightAction);
    atomic_store(result, (unint64_t *)&qword_2578792D8);
  }
  return result;
}

unint64_t sub_2496C735C()
{
  unint64_t result;

  result = qword_2578792E0;
  if (!qword_2578792E0)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for HighlightAction, &type metadata for HighlightAction);
    atomic_store(result, (unint64_t *)&qword_2578792E0);
  }
  return result;
}

uint64_t sub_2496C73A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2496C73B0()
{
  sub_2496C73F0();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2496C73F0()
{
  unint64_t result;

  result = qword_2578792E8;
  if (!qword_2578792E8)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for HighlightAction, &type metadata for HighlightAction);
    atomic_store(result, (unint64_t *)&qword_2578792E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for HighlightAction()
{
  return &type metadata for HighlightAction;
}

unint64_t sub_2496C7448()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578792F8;
  if (!qword_2578792F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257879300);
    result = MEMORY[0x24BCF64A8](MEMORY[0x24BDB5E58], v1);
    atomic_store(result, (unint64_t *)&qword_2578792F8);
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

uint64_t sub_2496C74D4()
{
  if (_AXSApplicationAccessibilityEnabled())
    _AXSApplicationAccessibilitySetEnabled();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AccessibilityActivationController()
{
  return objc_opt_self();
}

uint64_t UnhighlightAction.init(with:)(uint64_t a1, uint64_t a2)
{
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
  char *v14;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v36 = a1;
  v37 = a2;
  v2 = sub_2496C99A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v9, v10, v11, v12);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v21, v22, v23, v24);
  v26 = (char *)&v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_2496C99BC();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27, v29, v30, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v26, 0, 1, v27);
  v32 = sub_2496C99D4();
  v38 = 0;
  v39 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v20, 1, 1, v32);
  v33 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v14, 1, 1, v33);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v8, *MEMORY[0x24BDB6090], v2);
  v34 = sub_2496C9998();
  v38 = v36;
  v39 = v37;
  swift_retain();
  sub_2496C998C();
  swift_release();
  return v34;
}

uint64_t sub_2496C778C()
{
  uint64_t v0;

  v0 = sub_2496C99BC();
  __swift_allocate_value_buffer(v0, static UnhighlightAction.title);
  __swift_project_value_buffer(v0, (uint64_t)static UnhighlightAction.title);
  return sub_2496C99B0();
}

uint64_t UnhighlightAction.title.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_2578791A8 != -1)
    swift_once();
  v0 = sub_2496C99BC();
  return __swift_project_value_buffer(v0, (uint64_t)static UnhighlightAction.title);
}

uint64_t static UnhighlightAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578791A8 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static UnhighlightAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static UnhighlightAction.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_2578791A8 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static UnhighlightAction.title);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static UnhighlightAction.title.modify())()
{
  uint64_t v0;

  if (qword_2578791A8 != -1)
    swift_once();
  v0 = sub_2496C99BC();
  __swift_project_value_buffer(v0, (uint64_t)static UnhighlightAction.title);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t UnhighlightAction.perform()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_2496C9A58();
  v2[4] = sub_2496C9A4C();
  sub_2496C9A40();
  return swift_task_switch();
}

uint64_t sub_2496C7A64()
{
  uint64_t v0;

  swift_release();
  UnhighlightAction.execute()();
  sub_2496C9974();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Bool __swiftcall UnhighlightAction.execute()()
{
  id v0;
  void *v1;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for AccessibilityActivationController();
  swift_initStackObject();
  if (!_AXSApplicationAccessibilityEnabled())
  {
    _AXSApplicationAccessibilitySetEnabled();
    objc_msgSend((id)objc_opt_self(), sel_sleepForTimeInterval_, 0.3);
  }
  swift_release();
  sub_2496C9980();
  v0 = sub_2496C5870(v3, v4);
  if (v0)
  {
    v1 = (void *)sub_2496C99E0();
    objc_msgSend(v0, sel_performAction_withValue_, 5501, v1);
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v0 != 0;
}

BOOL sub_2496C7BA0()
{
  return UnhighlightAction.execute()();
}

uint64_t sub_2496C7BA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578791A8 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static UnhighlightAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2496C7C40(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;

  v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  sub_2496C9A58();
  v2[4] = sub_2496C9A4C();
  sub_2496C9A40();
  return swift_task_switch();
}

uint64_t sub_2496C7CB0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _s15UINavigationKit17UnhighlightActionVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_2496C7CD4()
{
  sub_2496C8040();
  return sub_2496C995C();
}

uint64_t _s15UINavigationKit17UnhighlightActionVACycfC_0()
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
  char *v12;
  uint64_t v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  unint64_t v35;

  v0 = sub_2496C99A4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3, v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v19, v20, v21, v22);
  v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_2496C99BC();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25, v27, v28, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);
  v30 = sub_2496C99D4();
  v34 = 0;
  v35 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v18, 1, 1, v30);
  v31 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v12, 1, 1, v31);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v6, *MEMORY[0x24BDB6090], v0);
  v32 = sub_2496C9998();
  v34 = 0;
  v35 = 0xE000000000000000;
  swift_retain();
  sub_2496C998C();
  swift_release();
  return v32;
}

unint64_t sub_2496C7F64()
{
  unint64_t result;

  result = qword_2578793C0;
  if (!qword_2578793C0)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for UnhighlightAction, &type metadata for UnhighlightAction);
    atomic_store(result, (unint64_t *)&qword_2578793C0);
  }
  return result;
}

unint64_t sub_2496C7FAC()
{
  unint64_t result;

  result = qword_2578793C8;
  if (!qword_2578793C8)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for UnhighlightAction, &type metadata for UnhighlightAction);
    atomic_store(result, (unint64_t *)&qword_2578793C8);
  }
  return result;
}

uint64_t sub_2496C7FF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2496C8000()
{
  sub_2496C8040();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2496C8040()
{
  unint64_t result;

  result = qword_2578793D0;
  if (!qword_2578793D0)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for UnhighlightAction, &type metadata for UnhighlightAction);
    atomic_store(result, (unint64_t *)&qword_2578793D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for UnhighlightAction()
{
  return &type metadata for UnhighlightAction;
}

uint64_t type metadata accessor for AccessibilityActionPerformer()
{
  return objc_opt_self();
}

uint64_t TapAction.init(with:)(uint64_t a1, uint64_t a2)
{
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
  char *v14;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v36 = a1;
  v37 = a2;
  v2 = sub_2496C99A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v9, v10, v11, v12);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v21, v22, v23, v24);
  v26 = (char *)&v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_2496C99BC();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27, v29, v30, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v26, 0, 1, v27);
  v32 = sub_2496C99D4();
  v38 = 0;
  v39 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v20, 1, 1, v32);
  v33 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v14, 1, 1, v33);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v8, *MEMORY[0x24BDB6090], v2);
  v34 = sub_2496C9998();
  v38 = v36;
  v39 = v37;
  swift_retain();
  sub_2496C998C();
  swift_release();
  return v34;
}

uint64_t sub_2496C8324()
{
  uint64_t v0;

  v0 = sub_2496C99BC();
  __swift_allocate_value_buffer(v0, static TapAction.title);
  __swift_project_value_buffer(v0, (uint64_t)static TapAction.title);
  return sub_2496C99B0();
}

uint64_t TapAction.title.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_2578791B0 != -1)
    swift_once();
  v0 = sub_2496C99BC();
  return __swift_project_value_buffer(v0, (uint64_t)static TapAction.title);
}

uint64_t static TapAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578791B0 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static TapAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static TapAction.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_2578791B0 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static TapAction.title);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static TapAction.title.modify())()
{
  uint64_t v0;

  if (qword_2578791B0 != -1)
    swift_once();
  v0 = sub_2496C99BC();
  __swift_project_value_buffer(v0, (uint64_t)static TapAction.title);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t TapAction.perform()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_2496C9A58();
  v2[4] = sub_2496C9A4C();
  sub_2496C9A40();
  return swift_task_switch();
}

uint64_t sub_2496C85FC()
{
  uint64_t v0;

  swift_release();
  TapAction.execute()();
  sub_2496C9974();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Bool __swiftcall TapAction.execute()()
{
  id v0;
  void *v1;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for AccessibilityActivationController();
  swift_initStackObject();
  if (!_AXSApplicationAccessibilityEnabled())
  {
    _AXSApplicationAccessibilitySetEnabled();
    objc_msgSend((id)objc_opt_self(), sel_sleepForTimeInterval_, 0.3);
  }
  swift_release();
  sub_2496C9980();
  v0 = sub_2496C5870(v3, v4);
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, sel_performAction_, 2010);
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v1 != 0;
}

BOOL sub_2496C8708()
{
  return TapAction.execute()();
}

uint64_t sub_2496C8710@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578791B0 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static TapAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2496C87A8(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;

  v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  sub_2496C9A58();
  v2[4] = sub_2496C9A4C();
  sub_2496C9A40();
  return swift_task_switch();
}

uint64_t sub_2496C8818@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _s15UINavigationKit9TapActionVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_2496C883C()
{
  sub_2496C8B84();
  return sub_2496C995C();
}

uint64_t _s15UINavigationKit9TapActionVACycfC_0()
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
  char *v12;
  uint64_t v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[2];

  v0 = sub_2496C99A4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3, v4);
  v6 = (char *)v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16);
  v18 = (char *)v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v19, v20, v21, v22);
  v24 = (char *)v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_2496C99BC();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25, v27, v28, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);
  v30 = sub_2496C99D4();
  v33[0] = 0;
  v33[1] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v18, 1, 1, v30);
  v31 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v12, 1, 1, v31);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v6, *MEMORY[0x24BDB6090], v0);
  return sub_2496C9998();
}

unint64_t sub_2496C8AA8()
{
  unint64_t result;

  result = qword_2578794B0;
  if (!qword_2578794B0)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for TapAction, &type metadata for TapAction);
    atomic_store(result, (unint64_t *)&qword_2578794B0);
  }
  return result;
}

unint64_t sub_2496C8AF0()
{
  unint64_t result;

  result = qword_2578794B8;
  if (!qword_2578794B8)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for TapAction, &type metadata for TapAction);
    atomic_store(result, (unint64_t *)&qword_2578794B8);
  }
  return result;
}

uint64_t sub_2496C8B34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2496C8B44()
{
  sub_2496C8B84();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2496C8B84()
{
  unint64_t result;

  result = qword_2578794C0;
  if (!qword_2578794C0)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for TapAction, &type metadata for TapAction);
    atomic_store(result, (unint64_t *)&qword_2578794C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for TapAction()
{
  return &type metadata for TapAction;
}

uint64_t ScrollAction.init(with:)(uint64_t a1, uint64_t a2)
{
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
  char *v14;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v36 = a1;
  v37 = a2;
  v2 = sub_2496C99A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v9, v10, v11, v12);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18);
  v20 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v21, v22, v23, v24);
  v26 = (char *)&v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_2496C99BC();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27, v29, v30, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v26, 0, 1, v27);
  v32 = sub_2496C99D4();
  v38 = 0;
  v39 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v20, 1, 1, v32);
  v33 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v14, 1, 1, v33);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v8, *MEMORY[0x24BDB6090], v2);
  v34 = sub_2496C9998();
  v38 = v36;
  v39 = v37;
  swift_retain();
  sub_2496C998C();
  swift_release();
  return v34;
}

uint64_t sub_2496C8E4C()
{
  uint64_t v0;

  v0 = sub_2496C99BC();
  __swift_allocate_value_buffer(v0, static ScrollAction.title);
  __swift_project_value_buffer(v0, (uint64_t)static ScrollAction.title);
  return sub_2496C99B0();
}

uint64_t ScrollAction.title.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_2578791B8 != -1)
    swift_once();
  v0 = sub_2496C99BC();
  return __swift_project_value_buffer(v0, (uint64_t)static ScrollAction.title);
}

uint64_t static ScrollAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578791B8 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ScrollAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ScrollAction.title.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_2578791B8 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ScrollAction.title);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ScrollAction.title.modify())()
{
  uint64_t v0;

  if (qword_2578791B8 != -1)
    swift_once();
  v0 = sub_2496C99BC();
  __swift_project_value_buffer(v0, (uint64_t)static ScrollAction.title);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ScrollAction.perform()(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_2496C9A58();
  v2[4] = sub_2496C9A4C();
  sub_2496C9A40();
  return swift_task_switch();
}

uint64_t sub_2496C912C()
{
  uint64_t v0;

  swift_release();
  ScrollAction.execute()();
  sub_2496C9974();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Bool __swiftcall ScrollAction.execute()()
{
  char v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;

  sub_2496C9980();
  v0 = sub_2496C93A4(v5, v6);
  swift_bridgeObjectRelease();
  if (_AXSApplicationAccessibilityEnabled())
  {
    if (!_AXSApplicationAccessibilityEnabled())
      goto LABEL_4;
    goto LABEL_3;
  }
  _AXSApplicationAccessibilitySetEnabled();
  objc_msgSend((id)objc_opt_self(), sel_sleepForTimeInterval_, 0.3);
  if (_AXSApplicationAccessibilityEnabled())
LABEL_3:
    _AXSApplicationAccessibilitySetEnabled();
LABEL_4:
  v1 = dword_2496CA244[v0];
  v2 = sub_2496C6280(dword_2496CA244[v0]);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, sel_performAction_, v1);

  }
  return v3 != 0;
}

BOOL sub_2496C9248()
{
  return ScrollAction.execute()();
}

uint64_t sub_2496C9250@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2578791B8 != -1)
    swift_once();
  v2 = sub_2496C99BC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static ScrollAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2496C92E8(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;

  v3 = *v1;
  v2[2] = a1;
  v2[3] = v3;
  sub_2496C9A58();
  v2[4] = sub_2496C9A4C();
  sub_2496C9A40();
  return swift_task_switch();
}

uint64_t sub_2496C9358@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _s15UINavigationKit12ScrollActionVACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_2496C937C()
{
  sub_2496C98CC();
  return sub_2496C995C();
}

uint64_t sub_2496C93A4(uint64_t a1, uint64_t a2)
{
  uint64_t v5;

  if (a1 == 28789 && a2 == 0xE200000000000000)
    return 0;
  v5 = 0;
  if ((sub_2496C9AAC() & 1) == 0)
  {
    if (a1 == 1853321060 && a2 == 0xE400000000000000 || (sub_2496C9AAC() & 1) != 0)
    {
      return 1;
    }
    else if (a1 == 0x7468676972 && a2 == 0xE500000000000000 || (sub_2496C9AAC() & 1) != 0)
    {
      return 3;
    }
    else if (a1 == 1952867692 && a2 == 0xE400000000000000 || (sub_2496C9AAC() & 1) != 0)
    {
      return 2;
    }
    else if (a1 == 7368564 && a2 == 0xE300000000000000 || (sub_2496C9AAC() & 1) != 0)
    {
      return 4;
    }
    else
    {
      v5 = 5;
      if (a1 != 0x6D6F74746F62 || a2 != 0xE600000000000000)
      {
        if ((sub_2496C9AAC() & 1) != 0)
          return 5;
        else
          return 3;
      }
    }
  }
  return v5;
}

uint64_t _s15UINavigationKit12ScrollActionVACycfC_0()
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
  char *v12;
  uint64_t v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  unint64_t v35;

  v0 = sub_2496C99A4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3, v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C0);
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791C8);
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D0);
  MEMORY[0x24BDAC7A8](v19, v20, v21, v22);
  v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_2496C99BC();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25, v27, v28, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578791D8);
  sub_2496C99B0();
  sub_2496C99B0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v24, 0, 1, v25);
  v30 = sub_2496C99D4();
  v34 = 0;
  v35 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v18, 1, 1, v30);
  v31 = sub_2496C9968();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v12, 1, 1, v31);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v6, *MEMORY[0x24BDB6090], v0);
  v32 = sub_2496C9998();
  v34 = 0x7468676972;
  v35 = 0xE500000000000000;
  swift_retain();
  sub_2496C998C();
  swift_release();
  return v32;
}

unint64_t sub_2496C97F0()
{
  unint64_t result;

  result = qword_2578794D8;
  if (!qword_2578794D8)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for ScrollAction, &type metadata for ScrollAction);
    atomic_store(result, (unint64_t *)&qword_2578794D8);
  }
  return result;
}

unint64_t sub_2496C9838()
{
  unint64_t result;

  result = qword_2578794E0;
  if (!qword_2578794E0)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for ScrollAction, &type metadata for ScrollAction);
    atomic_store(result, (unint64_t *)&qword_2578794E0);
  }
  return result;
}

uint64_t sub_2496C987C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2496C988C()
{
  sub_2496C98CC();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2496C98CC()
{
  unint64_t result;

  result = qword_2578794E8;
  if (!qword_2578794E8)
  {
    result = MEMORY[0x24BCF64A8](&protocol conformance descriptor for ScrollAction, &type metadata for ScrollAction);
    atomic_store(result, (unint64_t *)&qword_2578794E8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ScrollAction()
{
  return &type metadata for ScrollAction;
}

uint64_t sub_2496C9920()
{
  return MEMORY[0x24BDB4DD8]();
}

uint64_t sub_2496C992C()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_2496C9938()
{
  return MEMORY[0x24BDB4E08]();
}

uint64_t sub_2496C9944()
{
  return MEMORY[0x24BDB4E10]();
}

uint64_t sub_2496C9950()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_2496C995C()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_2496C9968()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_2496C9974()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_2496C9980()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_2496C998C()
{
  return MEMORY[0x24BDB5468]();
}

uint64_t sub_2496C9998()
{
  return MEMORY[0x24BDB5580]();
}

uint64_t sub_2496C99A4()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_2496C99B0()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_2496C99BC()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2496C99C8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2496C99D4()
{
  return MEMORY[0x24BDB6620]();
}

uint64_t sub_2496C99E0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2496C99EC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2496C99F8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2496C9A04()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2496C9A10()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2496C9A1C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2496C9A28()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2496C9A34()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2496C9A40()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2496C9A4C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2496C9A58()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2496C9A64()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2496C9A70()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2496C9A7C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2496C9A88()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2496C9A94()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2496C9AA0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2496C9AAC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2496C9AB8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2496C9AC4()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_2496C9AD0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2496C9ADC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t _AXSApplicationAccessibilityEnabled()
{
  return MEMORY[0x24BED2040]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x24BED2048]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

