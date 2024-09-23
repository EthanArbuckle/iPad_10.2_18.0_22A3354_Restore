uint64_t PlanksNDArray.shape.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t PlanksNDArray.strides.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t PlanksNDArray.__allocating_init(empty:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  PlanksNDArray.init(empty:)(a1);
  return v2;
}

_QWORD *PlanksNDArray.init(empty:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  v1[2] = sub_244406EB8();
  swift_beginAccess();
  sub_244406F0C();
  sub_244406E94();
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DB60);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_244407690;
  *(_QWORD *)(v3 + 32) = a1 & (a1 >> 63);
  v1[3] = v3;
  v1[4] = &unk_2514FC978;
  return v1;
}

uint64_t sub_2443D3568(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9[24];

  v1 = result;
  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = (uint64_t *)(result + 32);
    v4 = 1;
    while (1)
    {
      v5 = *v3++;
      v6 = v4 * v5;
      if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63)
        break;
      v4 = v6;
      if (!--v2)
        goto LABEL_7;
    }
    __break(1u);
  }
  else
  {
    v6 = 0;
LABEL_7:
    v7 = swift_allocObject();
    PlanksNDArray.init(empty:)(v6);
    swift_beginAccess();
    *(_QWORD *)(v7 + 24) = v1;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v9[0] = 0;
    v8 = _s6Planks0A8OrderingO14computeStrides5shape5orderSaySiGAG_ACtFZ_0(v1, v9);
    swift_bridgeObjectRelease();
    swift_release();
    swift_beginAccess();
    *(_QWORD *)(v7 + 32) = v8;
    swift_bridgeObjectRelease();
    return v7;
  }
  return result;
}

uint64_t PlanksNDArray.__allocating_init(array:shape:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_2443D3568(a2);
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = a1;
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t PlanksNDArray.__allocating_init(array2d:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25[5];

  v3 = *(_QWORD *)(v1 + 80);
  v4 = sub_244406F0C();
  if (MEMORY[0x24950E018](a1, v4) < 1)
  {
    __break(1u);
    goto LABEL_19;
  }
  sub_244406F18();
  v5 = MEMORY[0x24950E018](v25[0], v3);
  v6 = swift_bridgeObjectRelease();
  if (v5 < 1)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    result = swift_bridgeObjectRelease_n();
    __break(1u);
    return result;
  }
  v25[0] = a1;
  MEMORY[0x24BDAC7A8](v6);
  KeyPath = swift_getKeyPath();
  v8 = sub_244406F0C();
  v9 = MEMORY[0x24950E66C](MEMORY[0x24BEE12E0], v8);
  v11 = sub_2443D3A00((void (*)(char *, char *))sub_2443D4F10, KeyPath, v8, MEMORY[0x24BEE1768], MEMORY[0x24BEE4078], v9, MEMORY[0x24BEE40A8], v10);
  swift_release();
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v12; ++i)
    {
      v25[0] = *(_QWORD *)(v11 + 8 * i + 32);
      if (!sub_2443D3CF0(v25, a1, v3))
        goto LABEL_20;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DB60);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2444076A0;
  *(_QWORD *)(v14 + 32) = MEMORY[0x24950E018](a1, v4);
  sub_244406F18();
  v15 = MEMORY[0x24950E018](v25[0], v3);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + 40) = v15;
  v16 = sub_2443D3568(v14);
  swift_retain();
  if (!MEMORY[0x24950E030](a1, v4))
    goto LABEL_17;
  v17 = 4;
  v18 = MEMORY[0x24BEE12C8];
  while (1)
  {
    v19 = v17 - 4;
    v20 = sub_244406EDC();
    sub_244406E88();
    if ((v20 & 1) == 0)
      break;
    v21 = swift_bridgeObjectRetain();
    v22 = __OFADD__(v19, 1);
    v23 = v17 - 3;
    if (v22)
      goto LABEL_16;
LABEL_12:
    v25[3] = v21;
    swift_beginAccess();
    MEMORY[0x24950E66C](v18, v4);
    sub_244406EF4();
    swift_endAccess();
    ++v17;
    if (v23 == MEMORY[0x24950E030](a1, v4))
      goto LABEL_17;
  }
  v21 = sub_244407074();
  v22 = __OFADD__(v19, 1);
  v23 = v17 - 3;
  if (!v22)
    goto LABEL_12;
LABEL_16:
  __break(1u);
LABEL_17:
  swift_release();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_2443D39D0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result;

  result = MEMORY[0x24950E018](*a1, *(_QWORD *)(a3 + a2 - 8));
  *a4 = result;
  return result;
}

uint64_t sub_2443D3A00(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  void (*v24)(char *, _QWORD);
  void (*v25)(char *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char v43[32];
  uint64_t v44;

  v30 = a5;
  v31 = a8;
  v38 = a1;
  v39 = a2;
  v29 = *(_QWORD *)(a5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v40 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v14 = (char *)&v29 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v32 = *(_QWORD *)(v17 - 8);
  v33 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v29 - v18;
  v20 = sub_244406F60();
  if (!v20)
    return sub_244406EB8();
  v36 = AssociatedTypeWitness;
  v21 = v20;
  v44 = sub_2444070A4();
  v34 = sub_2444070B0();
  sub_24440708C();
  v37 = v8;
  result = sub_244406F54();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = v21;
    v35 = v16;
    while (v23)
    {
      v41 = v23;
      v24 = (void (*)(char *, _QWORD))sub_244406F9C();
      v25 = *(void (**)(char *))(v11 + 16);
      v26 = v11;
      v27 = v36;
      v25(v14);
      v24(v43, 0);
      v28 = v42;
      v38(v14, v40);
      if (v28)
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v31, v40, v30);
      }
      v42 = 0;
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v27);
      sub_244407098();
      result = sub_244406F78();
      v23 = v41 - 1;
      v11 = v26;
      if (v41 == 1)
      {
        (*(void (**)(char *, uint64_t))(v32 + 8))(v19, v33);
        return v44;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

BOOL sub_2443D3CF0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *a1;
  sub_244406F0C();
  sub_244406F18();
  v5 = MEMORY[0x24950E018](v7, a3);
  swift_bridgeObjectRelease();
  return v4 == v5;
}

uint64_t PlanksNDArray.__allocating_init(array3d:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[5];
  uint64_t v35;

  v3 = *(_QWORD *)(v1 + 80);
  v4 = sub_244406F0C();
  v5 = sub_244406F0C();
  if (MEMORY[0x24950E018](a1, v5) < 1)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_244406F18();
  v6 = MEMORY[0x24950E018](v34[0], v4);
  swift_bridgeObjectRelease();
  if (v6 < 1)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  sub_244406F18();
  sub_244406F18();
  swift_bridgeObjectRelease();
  v7 = MEMORY[0x24950E018](v35, v3);
  v8 = swift_bridgeObjectRelease();
  if (v7 < 1)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    result = swift_bridgeObjectRelease_n();
    __break(1u);
    return result;
  }
  v34[0] = a1;
  MEMORY[0x24BDAC7A8](v8);
  KeyPath = swift_getKeyPath();
  v10 = sub_244406F0C();
  v11 = MEMORY[0x24950E66C](MEMORY[0x24BEE12E0], v10);
  v13 = sub_2443D3A00((void (*)(char *, char *))sub_2443D4F10, KeyPath, v10, MEMORY[0x24BEE1768], MEMORY[0x24BEE4078], v11, MEMORY[0x24BEE40A8], v12);
  swift_release();
  v14 = *(_QWORD *)(v13 + 16);
  if (v14)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v14; ++i)
    {
      v34[0] = *(_QWORD *)(v13 + 8 * i + 32);
      if (!sub_2443D4244(v34))
        goto LABEL_31;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DB60);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2444076B0;
  *(_QWORD *)(v16 + 32) = MEMORY[0x24950E018](a1, v5);
  sub_244406F18();
  v33 = a1;
  v17 = MEMORY[0x24950E018](v34[0], v4);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v16 + 40) = v17;
  sub_244406F18();
  sub_244406F18();
  swift_bridgeObjectRelease();
  v18 = MEMORY[0x24950E018](v34[3], v3);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v16 + 48) = v18;
  v31 = sub_2443D3568(v16);
  swift_retain();
  if (!MEMORY[0x24950E030](a1, v5))
    goto LABEL_26;
  v19 = 0;
  v32 = a1 + 32;
  v20 = MEMORY[0x24BEE12C8];
  while (1)
  {
    v21 = sub_244406EDC();
    sub_244406E88();
    if ((v21 & 1) == 0)
      break;
    v22 = *(_QWORD *)(v32 + 8 * v19);
    swift_bridgeObjectRetain();
    v23 = __OFADD__(v19++, 1);
    if (v23)
      goto LABEL_25;
LABEL_14:
    v24 = v5;
    if (MEMORY[0x24950E030](v22, v4))
    {
      v25 = 4;
      do
      {
        v26 = v25 - 4;
        v27 = sub_244406EDC();
        sub_244406E88();
        if ((v27 & 1) != 0)
        {
          v28 = swift_bridgeObjectRetain();
          v29 = v25 - 3;
          if (__OFADD__(v26, 1))
            goto LABEL_27;
        }
        else
        {
          v28 = sub_244407074();
          v29 = v25 - 3;
          if (__OFADD__(v26, 1))
          {
LABEL_27:
            __break(1u);
            goto LABEL_28;
          }
        }
        v35 = v28;
        swift_beginAccess();
        MEMORY[0x24950E66C](v20, v4);
        sub_244406EF4();
        swift_endAccess();
        ++v25;
      }
      while (v29 != MEMORY[0x24950E030](v22, v4));
    }
    swift_bridgeObjectRelease();
    v5 = v24;
    if (v19 == MEMORY[0x24950E030](v33, v24))
      goto LABEL_26;
  }
  v22 = sub_244407074();
  v23 = __OFADD__(v19++, 1);
  if (!v23)
    goto LABEL_14;
LABEL_25:
  __break(1u);
LABEL_26:
  swift_release();
  swift_bridgeObjectRelease();
  return v31;
}

uint64_t sub_2443D4204@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = *a1;
  v4 = sub_244406F0C();
  result = MEMORY[0x24950E018](v3, v4);
  *a2 = result;
  return result;
}

BOOL sub_2443D4244(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *a1;
  v2 = sub_244406F0C();
  sub_244406F0C();
  sub_244406F18();
  v3 = MEMORY[0x24950E018](v5, v2);
  swift_bridgeObjectRelease();
  return v1 == v3;
}

uint64_t PlanksNDArray.isEmpty.getter()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = sub_244406F0C();
  MEMORY[0x24950E66C](MEMORY[0x24BEE12E0], v0);
  return sub_244406F84() & 1;
}

uint64_t PlanksNDArray.ndim.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)(v0 + 24) + 16);
}

uint64_t PlanksNDArray.nbytes.getter()
{
  uint64_t v1;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_244406EA0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_2443D43FC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  v3 = a2 - result;
  if (!result)
    v3 = 0;
  *a3 = v3;
  return result;
}

uint64_t PlanksNDArray.dtype.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)v0 + 80);
}

uint64_t PlanksNDArray.subscript.getter(_QWORD *a1)
{
  sub_2443D44F4(a1);
  swift_beginAccess();
  sub_244406F18();
  return swift_endAccess();
}

uint64_t sub_2443D4484(uint64_t a1, _QWORD **a2)
{
  return PlanksNDArray.subscript.getter(*a2);
}

uint64_t sub_2443D44A8(uint64_t a1, uint64_t a2, _QWORD **a3)
{
  _QWORD *v4;

  v4 = *a3;
  swift_bridgeObjectRetain();
  return sub_2443D4F84(a1, v4);
}

uint64_t PlanksNDArray.subscript.setter(uint64_t a1, uint64_t a2)
{
  return sub_2443D47A0(a1, a2, (void (*)(void))sub_2443D4F84);
}

{
  return sub_2443D47A0(a1, a2, (void (*)(void))sub_2443D5064);
}

uint64_t sub_2443D44F4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v3 = a1[2];
  result = swift_beginAccess();
  if (v3 != *(_QWORD *)(*(_QWORD *)(v1 + 24) + 16))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  swift_beginAccess();
  v5 = *(_QWORD **)(v1 + 32);
  v6 = v5[2];
  if (!v6 || !v3)
    return 0;
  v7 = v5[4];
  v8 = a1[4];
  result = v7 * v8;
  if ((unsigned __int128)(v7 * (__int128)v8) >> 64 != (v7 * v8) >> 63)
  {
LABEL_20:
    __break(1u);
    return result;
  }
  if (v6 != 1 && v3 != 1)
  {
    v10 = v5 + 5;
    v11 = a1 + 5;
    v12 = v3 - 2;
    v13 = v6 - 2;
    while (1)
    {
      v15 = *v10++;
      v14 = v15;
      v16 = v12;
      v17 = *v11++;
      v18 = v14 * v17;
      if ((unsigned __int128)(v14 * (__int128)v17) >> 64 != (v14 * v17) >> 63)
        break;
      v19 = __OFADD__(result, v18);
      result += v18;
      if (v19)
        goto LABEL_18;
      if (v13)
      {
        v12 = v16 - 1;
        --v13;
        if (v16)
          continue;
      }
      return result;
    }
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return result;
}

void (*PlanksNDArray.subscript.modify(_QWORD *a1, _QWORD *a2))(_QWORD ***a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  PlanksNDArray.subscript.getter(a2);
  return sub_2443D4674;
}

{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  PlanksNDArray.subscript.getter(a2);
  return sub_2443D4674;
}

void sub_2443D4674(_QWORD ***a1, char a2)
{
  _QWORD **v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  void (*v8)(_QWORD *, _QWORD *);

  v2 = *a1;
  v3 = (*a1)[4];
  v4 = (*a1)[5];
  v5 = (*a1)[2];
  v6 = (*a1)[3];
  v7 = **a1;
  if ((a2 & 1) != 0)
  {
    ((void (*)(_QWORD *, _QWORD *, _QWORD *))v6[2])((*a1)[4], v4, v5);
    swift_bridgeObjectRetain();
    sub_2443D4F84((uint64_t)v3, v7);
    v8 = (void (*)(_QWORD *, _QWORD *))v6[1];
    v8(v3, v5);
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_2443D4F84((uint64_t)v4, v7);
    v8 = (void (*)(_QWORD *, _QWORD *))v6[1];
  }
  v8(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t sub_2443D4730(uint64_t a1, _QWORD *a2)
{
  return PlanksNDArray.subscript.getter(*a2);
}

uint64_t sub_2443D4754(uint64_t a1, uint64_t a2, _QWORD **a3)
{
  _QWORD *v4;

  v4 = *a3;
  swift_bridgeObjectRetain();
  return sub_2443D5064(a1, v4);
}

uint64_t sub_2443D47A0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t v5;

  v5 = *v3;
  a3();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 80) - 8) + 8))(a1);
}

uint64_t PlanksNDArray.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlanksNDArray.__deallocating_deinit()
{
  PlanksNDArray.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2443D48B0(unint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_2444070EC();
    __break(1u);
    return result;
  }
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  result = sub_244406EC4();
  *(_QWORD *)(result + 16) = a2;
  v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    v6 = 0;
LABEL_9:
    v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  v7 = vdupq_n_s64(a1);
  v8 = (int64x2_t *)(result + 48);
  v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2)
    goto LABEL_9;
  return result;
}

Planks::PlanksOrdering_optional __swiftcall PlanksOrdering.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  Planks::PlanksOrdering_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24440714C();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

void *static PlanksOrdering.allCases.getter()
{
  return &unk_2514FCA18;
}

uint64_t PlanksOrdering.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x614D6E6D756C6F63;
  else
    return 0x726F6A614D776F72;
}

uint64_t sub_2443D4A48(char *a1, char *a2)
{
  return sub_24440510C(*a1, *a2);
}

uint64_t sub_2443D4A54()
{
  sub_244407278();
  sub_244406DF8();
  swift_bridgeObjectRelease();
  return sub_244407290();
}

uint64_t sub_2443D4ADC()
{
  sub_244406DF8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443D4B40()
{
  sub_244407278();
  sub_244406DF8();
  swift_bridgeObjectRelease();
  return sub_244407290();
}

Planks::PlanksOrdering_optional sub_2443D4BC4(Swift::String *a1)
{
  return PlanksOrdering.init(rawValue:)(*a1);
}

void sub_2443D4BD0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x726F6A614D776F72;
  if (*v1)
    v2 = 0x614D6E6D756C6F63;
  v3 = 0xE800000000000000;
  if (*v1)
    v3 = 0xEB00000000726F6ALL;
  *a1 = v2;
  a1[1] = v3;
}

void sub_2443D4C18(_QWORD *a1@<X8>)
{
  *a1 = &unk_2514FCA40;
}

uint64_t sub_2443D4C28()
{
  sub_2443D534C();
  return sub_244406E70();
}

uint64_t sub_2443D4C84()
{
  sub_2443D534C();
  return sub_244406E64();
}

uint64_t default argument 1 of static PlanksReader.readMagic(_:begin:)()
{
  return 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24950E654]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2443D4D18(unint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = _swift_isClassOrObjCExistentialType();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  v5 = a2 & 0xFFFFFFFFFFFFF8;
  if ((result & 1) == 0)
    v5 = a2;
  if (*(_QWORD *)(v5 + 16) <= a1)
    goto LABEL_7;
  return result;
}

uint64_t _s6Planks0A8OrderingO14computeStrides5shape5orderSaySiGAG_ACtFZ_0(uint64_t a1, char *a2)
{
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  uint64_t result;
  char v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = v2 - 1;
  if (v2 == 1)
    return (uint64_t)&unk_2514FC9A0;
  v7 = *a2;
  result = sub_2443D48B0(1uLL, v2);
  v4 = (_QWORD *)result;
  if ((v7 & 1) != 0)
  {
    if (!v2)
    {
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
    v8 = a1 + 32;
    v9 = 1;
    while (2)
    {
      v10 = 0;
      v11 = v9 + 1;
      v12 = 1;
      do
      {
        v13 = *(_QWORD *)(v8 + 8 * v10);
        if ((unsigned __int128)(v12 * (__int128)v13) >> 64 != (v12 * v13) >> 63)
        {
          __break(1u);
          goto LABEL_27;
        }
        v12 *= v13;
        ++v10;
      }
      while (v9 != v10);
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_2443E2868(v4);
        v4 = (_QWORD *)result;
      }
      if (v9 < v4[2])
      {
        v4[v9++ + 4] = v12;
        if (v11 != v2)
          continue;
        return (uint64_t)v4;
      }
      break;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v2)
  {
    v14 = 0;
    v15 = (uint64_t *)(a1 + 40);
    v16 = v3;
    while (2)
    {
      if (v14 != v3)
      {
        v17 = v14 + 1;
        v18 = v15;
        v19 = v16;
        v20 = 1;
        do
        {
          v21 = *v18++;
          v22 = v20 * v21;
          if ((unsigned __int128)(v20 * (__int128)v21) >> 64 != (v20 * v21) >> 63)
          {
LABEL_27:
            __break(1u);
            goto LABEL_28;
          }
          v20 = v22;
          --v19;
        }
        while (v19);
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_2443E2868(v4);
          v4 = (_QWORD *)result;
        }
        if (v14 < v4[2])
        {
          v4[v14 + 4] = v20;
          --v16;
          ++v15;
          ++v14;
          if (v17 != v3)
            continue;
          return (uint64_t)v4;
        }
        goto LABEL_30;
      }
      break;
    }
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2443D4EF8()
{
  return 8;
}

_QWORD *sub_2443D4F04(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2443D4F10()
{
  return sub_2443D4F30();
}

uint64_t sub_2443D4F24()
{
  return 8;
}

uint64_t sub_2443D4F30()
{
  swift_bridgeObjectRetain();
  swift_getAtKeyPath();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443D4F84(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isClassOrObjCExistentialType;
  uint64_t v10;

  v3 = v2;
  v5 = *v2;
  v6 = sub_2443D44F4(a2);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v7 = *(_QWORD *)(v5 + 80);
  sub_244406F0C();
  sub_244406EAC();
  v8 = v2[2];
  sub_2443D4D18(v6, v3[2]);
  isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
  v10 = v8 & 0xFFFFFFFFFFFFFF8;
  if ((isClassOrObjCExistentialType & 1) == 0)
    v10 = v8;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v10+ ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72) * v6, a1, v7);
  return swift_endAccess();
}

unint64_t sub_2443D506C()
{
  unint64_t result;

  result = qword_25735DB68;
  if (!qword_25735DB68)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for PlanksOrdering, &type metadata for PlanksOrdering);
    atomic_store(result, (unint64_t *)&qword_25735DB68);
  }
  return result;
}

unint64_t sub_2443D50B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25735DB70;
  if (!qword_25735DB70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_25735DB78);
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25735DB70);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24950E660](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2443D5144()
{
  return 8;
}

uint64_t sub_2443D5150()
{
  return 8;
}

uint64_t sub_2443D5160()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PlanksNDArray(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PlanksNDArray);
}

uint64_t method lookup function for PlanksNDArray()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PlanksNDArray.__allocating_init(empty:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PlanksOrdering(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PlanksOrdering(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2443D52B4 + 4 * byte_2444076C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2443D52E8 + 4 * byte_2444076C0[v4]))();
}

uint64_t sub_2443D52E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443D52F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2443D52F8);
  return result;
}

uint64_t sub_2443D5304(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2443D530CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2443D5310(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443D5318(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443D5324(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2443D5330(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PlanksOrdering()
{
  return &type metadata for PlanksOrdering;
}

unint64_t sub_2443D534C()
{
  unint64_t result;

  result = qword_25735DC00;
  if (!qword_25735DC00)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for PlanksOrdering, &type metadata for PlanksOrdering);
    atomic_store(result, (unint64_t *)&qword_25735DC00);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24950E624](a1, v6, a5);
}

uint64_t sub_2443D53CC()
{
  uint64_t v0;

  v0 = sub_244406D38();
  __swift_allocate_value_buffer(v0, qword_2573610D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2573610D0);
  return sub_244406D2C();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void *static FieldType.floatingPointTypes.getter()
{
  return &unk_2514FCA68;
}

void *static FieldType.integerTypes.getter()
{
  return &unk_2514FCA90;
}

void *static FieldType.unsignedTypes.getter()
{
  return &unk_2514FCAB8;
}

uint64_t FieldType.isFloatingPoint.getter()
{
  unsigned __int8 *v0;

  return sub_2443D54C8(*v0, (uint64_t)&unk_2514FCAE0);
}

uint64_t sub_2443D54C8(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }
  return 0;
}

uint64_t sub_2443D57F8(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_244407224();
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
    if (v12 || (sub_244407224() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t FieldType.isInteger.getter()
{
  unsigned __int8 *v0;

  return sub_2443D54C8(*v0, (uint64_t)&unk_2514FCA90);
}

uint64_t FieldType.isUnsigned.getter()
{
  unsigned __int8 *v0;

  return sub_2443D54C8(*v0, (uint64_t)&unk_2514FCB08);
}

uint64_t FieldType.size.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;

  v1 = *v0 - 1;
  if (v1 > 9)
    return 1;
  else
    return qword_244407A08[(char)v1];
}

uint64_t FieldType.stride.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;

  v1 = *v0 - 1;
  if (v1 > 9)
    return 1;
  else
    return qword_244407A08[(char)v1];
}

uint64_t FieldType.alignment.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;

  v1 = *v0 - 1;
  if (v1 > 9)
    return 1;
  else
    return qword_244407A08[(char)v1];
}

uint64_t FieldType.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2443D5988 + 4 * byte_2444078F8[*v0]))(947154537, 0xE400000000000000);
}

uint64_t sub_2443D5988()
{
  return 0x3631746E69;
}

uint64_t sub_2443D599C()
{
  return 0x3233746E69;
}

uint64_t sub_2443D59B0()
{
  return 0x3436746E69;
}

uint64_t sub_2443D59C4()
{
  return 0x38746E6975;
}

uint64_t sub_2443D59D8()
{
  return 0x3631746E6975;
}

uint64_t sub_2443D59EC()
{
  return 0x3233746E6975;
}

uint64_t sub_2443D5A00()
{
  return 0x3436746E6975;
}

uint64_t sub_2443D5A14()
{
  return 0x363174616F6C66;
}

uint64_t sub_2443D5A2C()
{
  return 0x323374616F6C66;
}

uint64_t sub_2443D5A44()
{
  return 0x343674616F6C66;
}

uint64_t sub_2443D5A5C()
{
  return 1819242338;
}

void static Int8.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void sub_2443D5A74(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static Int16.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void sub_2443D5A88(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void static Int32.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

void sub_2443D5AA0(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

void static Int64.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void sub_2443D5AB8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void static UInt8.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void sub_2443D5AD0(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void static UInt16.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

void sub_2443D5AE8(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

void static UInt32.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

void sub_2443D5B00(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

void static UInt64.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

void sub_2443D5B18(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

void static Float16.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

void sub_2443D5B30(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

void static Float.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

void sub_2443D5B48(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

void static Double.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

void sub_2443D5B60(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

void static Bool.fieldType.getter(_BYTE *a1@<X8>)
{
  *a1 = 11;
}

void sub_2443D5B78(_BYTE *a1@<X8>)
{
  *a1 = 11;
}

uint64_t dispatch thunk of static FieldTypeConvertible.fieldType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2443D5B8C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_2443F7D44(0, v1, 0);
    v2 = v11;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1)
        sub_2443F7D44(v7 > 1, v8 + 1, 1);
      v4 += 4;
      *(_QWORD *)(v11 + 16) = v8 + 1;
      v9 = v11 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v6;
      *(_QWORD *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2443D5C60(uint64_t a1)
{
  int64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_2443F7DA0(0, v2, 0);
    result = v9;
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v6 = *v4;
      v4 += 2;
      v5 = v6;
      v10 = result;
      v8 = *(_QWORD *)(result + 16);
      v7 = *(_QWORD *)(result + 24);
      if (v8 >= v7 >> 1)
      {
        sub_2443F7DA0(v7 > 1, v8 + 1, 1);
        result = v10;
      }
      *(_QWORD *)(result + 16) = v8 + 1;
      *(_QWORD *)(result + 8 * v8 + 32) = v5;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t PlanksReader.filePath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC6Planks12PlanksReader_filePath;
  v4 = sub_244406DA4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PlanksReader.fileSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader_fileSize);
}

uint64_t PlanksReader.metadataSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader_metadataSize);
}

uint64_t PlanksReader.metadata.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 8);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 24);
  *a1 = v3;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint8_t *PlanksReader.__allocating_init(filePath:)(uint64_t a1, unint64_t a2)
{
  swift_allocObject();
  return PlanksReader.init(filePath:)(a1, a2);
}

uint8_t *PlanksReader.init(filePath:)(uint64_t a1, unint64_t a2)
{
  uint8_t *v2;
  uint8_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  _DWORD *v22;
  uint8_t *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  os_log_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint8_t *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  uint8_t **v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  _BOOL4 v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  _BOOL4 v82;
  os_log_t v83;
  uint8_t *v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint8_t *v98;
  uint64_t v99;
  NSObject *v100;
  os_log_type_t v101;
  uint8_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  os_log_t v113;
  uint64_t v114;
  uint8_t *v115;
  uint8_t *v116;
  uint8_t *v117;
  uint8_t *v118;
  uint64_t v119;
  int v120;
  uint8_t *v121;
  uint64_t v122;
  NSObject *v123;
  uint64_t v124;
  uint64_t v125;

  v3 = v2;
  v6 = sub_244406DA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement] = 0;
  swift_bridgeObjectRetain();
  v117 = (uint8_t *)a1;
  sub_244406DB0();
  v10 = (uint64_t)&v3[OBJC_IVAR____TtC6Planks12PlanksReader_filePath];
  (*(void (**)(uint8_t *, char *, uint64_t))(v7 + 32))(&v3[OBJC_IVAR____TtC6Planks12PlanksReader_filePath], v9, v6);
  v119 = 0;
  v120 = 16842752;
  v118 = (uint8_t *)v10;
  sub_244406D98();
  v115 = (uint8_t *)v7;
  v11 = v121;
  v12 = OBJC_IVAR____TtC6Planks12PlanksReader_fd;
  *(_DWORD *)&v3[OBJC_IVAR____TtC6Planks12PlanksReader_fd] = (_DWORD)v121;
  v13 = sub_244406D68();
  v14 = v13;
  if ((v15 & 1) != 0)
  {
    LODWORD(v121) = v13;
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    v21 = (void *)swift_allocError();
    *v22 = v14;
    v23 = v115;
    if (qword_25735DB50 != -1)
      swift_once();
    v24 = sub_244406D38();
    __swift_project_value_buffer(v24, (uint64_t)qword_2573610D0);
    MEMORY[0x24950E5E8](v21);
    swift_bridgeObjectRetain();
    MEMORY[0x24950E5E8](v21);
    v25 = sub_244406D20();
    v26 = sub_244406FB4();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v113 = v25;
      v29 = (_QWORD *)v28;
      v114 = swift_slowAlloc();
      v115 = v3;
      v121 = (uint8_t *)v114;
      *(_DWORD *)v27 = 138412546;
      MEMORY[0x24950E5E8](v21);
      v30 = _swift_stdlib_bridgeErrorToNSError();
      v125 = v30;
      v116 = (uint8_t *)v6;
      sub_244406FE4();
      *v29 = v30;

      *(_WORD *)(v27 + 12) = 2080;
      swift_bridgeObjectRetain();
      v125 = sub_2443DABA4((uint64_t)v117, a2, (uint64_t *)&v121);
      v6 = (uint64_t)v116;
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v31 = v113;
      _os_log_impl(&dword_2443D2000, v113, v26, "File error: %@ - %s", (uint8_t *)v27, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DC28);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v29, -1, -1);
      v32 = v114;
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v32, -1, -1);
      MEMORY[0x24950E6FC](v27, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_17;
  }
  v116 = (uint8_t *)v6;
  v16 = OBJC_IVAR____TtC6Planks12PlanksReader_fileSize;
  *(_QWORD *)&v3[OBJC_IVAR____TtC6Planks12PlanksReader_fileSize] = v13;
  if (v13 < 12)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v17 = sub_244406D38();
    __swift_project_value_buffer(v17, (uint64_t)qword_2573610D0);
    swift_retain();
    v18 = sub_244406D20();
    v19 = sub_244406FB4();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v20 = 134217984;
      v121 = *(uint8_t **)&v3[v16];
      sub_244406FE4();
      swift_release();
      _os_log_impl(&dword_2443D2000, v18, v19, "Invalid fileSize: %lld", v20, 0xCu);
      MEMORY[0x24950E6FC](v20, -1, -1);

    }
    else
    {

      swift_release();
    }
    v6 = (uint64_t)v116;
    goto LABEL_16;
  }
  v34 = sub_2443DD0D4(v11, 1);
  v23 = v115;
  if (qword_25735DB58 != -1)
    swift_once();
  if (!sub_2443D7E0C(v34, (uint64_t)off_25735E290))
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v35 = sub_244406D38();
    __swift_project_value_buffer(v35, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v36 = sub_244406D20();
    v37 = sub_244406FB4();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v121 = (uint8_t *)v39;
      *(_DWORD *)v38 = 136315138;
      v117 = v38 + 4;
      v40 = swift_bridgeObjectRetain();
      v41 = MEMORY[0x24950DFAC](v40, MEMORY[0x24BEE4260]);
      v43 = v42;
      swift_bridgeObjectRelease();
      v125 = sub_2443DABA4(v41, v43, (uint64_t *)&v121);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v44 = "Invalid magicValue begin: %s";
LABEL_26:
      _os_log_impl(&dword_2443D2000, v36, v37, v44, v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v39, -1, -1);
      MEMORY[0x24950E6FC](v38, -1, -1);

LABEL_34:
      v6 = (uint64_t)v116;
LABEL_16:
      v23 = v115;
LABEL_17:
      (*((void (**)(uint8_t *, uint64_t))v23 + 1))(v118, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for PlanksReader();
      swift_deallocPartialClassInstance();
      return 0;
    }
LABEL_33:

    swift_bridgeObjectRelease_n();
    goto LABEL_34;
  }
  swift_bridgeObjectRelease();
  v45 = sub_2443DD0D4(*(unsigned int *)&v3[v12], 0);
  swift_bridgeObjectRelease();
  if (!sub_2443D7E0C(v45, (uint64_t)off_25735E290))
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v48 = sub_244406D38();
    __swift_project_value_buffer(v48, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v36 = sub_244406D20();
    v37 = sub_244406FB4();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v121 = (uint8_t *)v39;
      *(_DWORD *)v38 = 136315138;
      v117 = v38 + 4;
      v49 = swift_bridgeObjectRetain();
      v50 = MEMORY[0x24950DFAC](v49, MEMORY[0x24BEE4260]);
      v52 = v51;
      swift_bridgeObjectRelease();
      v125 = sub_2443DABA4(v50, v52, (uint64_t *)&v121);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v44 = "Invalid magicValue end: %s";
      goto LABEL_26;
    }
    goto LABEL_33;
  }
  swift_bridgeObjectRelease();
  v46 = sub_2443DD274();
  if ((v47 & 1) != 0)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v62 = sub_244406D38();
    __swift_project_value_buffer(v62, (uint64_t)qword_2573610D0);
    swift_retain_n();
    v55 = sub_244406D20();
    v56 = sub_244406FB4();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      v58 = swift_slowAlloc();
      v121 = (uint8_t *)v58;
      *(_DWORD *)v57 = 136315138;
      sub_2443DD48C();
      v6 = (uint64_t)v116;
      v63 = sub_2444071F4();
      v125 = sub_2443DABA4(v63, v64, (uint64_t *)&v121);
      sub_244406FE4();
      swift_release_n();
      swift_bridgeObjectRelease();
      v61 = "Failed at reading metadata size for %s";
      goto LABEL_45;
    }
LABEL_46:

    swift_release_n();
    v6 = (uint64_t)v116;
    goto LABEL_17;
  }
  v53 = v46;
  type metadata accessor for PlanksReader();
  static PlanksReader.readMetadata(_:metadataSize:)(v53, (uint64_t)&v121);
  v66 = v122;
  if (!v122)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v54 = sub_244406D38();
    __swift_project_value_buffer(v54, (uint64_t)qword_2573610D0);
    swift_retain_n();
    v55 = sub_244406D20();
    v56 = sub_244406FB4();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      v58 = swift_slowAlloc();
      v121 = (uint8_t *)v58;
      *(_DWORD *)v57 = 136315138;
      sub_2443DD48C();
      v6 = (uint64_t)v116;
      v59 = sub_2444071F4();
      v125 = sub_2443DABA4(v59, v60, (uint64_t *)&v121);
      sub_244406FE4();
      swift_release_n();
      swift_bridgeObjectRelease();
      v61 = "Failed at reading metadata for %s";
LABEL_45:
      _os_log_impl(&dword_2443D2000, v55, v56, v61, v57, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v58, -1, -1);
      v65 = v57;
      v23 = v115;
      MEMORY[0x24950E6FC](v65, -1, -1);

      goto LABEL_17;
    }
    goto LABEL_46;
  }
  v67 = v123;
  v68 = v124;
  v69 = (uint8_t **)&v3[OBJC_IVAR____TtC6Planks12PlanksReader_metadata];
  v118 = v121;
  *v69 = v121;
  v69[1] = (uint8_t *)v66;
  v69[2] = (uint8_t *)v67;
  v69[3] = (uint8_t *)v68;
  *(_QWORD *)&v3[OBJC_IVAR____TtC6Planks12PlanksReader_metadataSize] = v53;
  v70 = qword_25735DB50;
  swift_bridgeObjectRetain();
  v113 = v67;
  swift_bridgeObjectRetain();
  v117 = (uint8_t *)v68;
  swift_bridgeObjectRetain();
  if (v70 != -1)
    swift_once();
  v71 = sub_244406D38();
  v72 = __swift_project_value_buffer(v71, (uint64_t)qword_2573610D0);
  swift_retain_n();
  v114 = v72;
  v73 = sub_244406D20();
  v74 = sub_244406FA8();
  v75 = os_log_type_enabled(v73, v74);
  v112 = v53;
  if (v75)
  {
    v76 = (uint8_t *)swift_slowAlloc();
    v77 = swift_slowAlloc();
    v121 = (uint8_t *)v77;
    *(_DWORD *)v76 = 136315138;
    v115 = v76 + 4;
    sub_2443DD48C();
    v78 = sub_2444071F4();
    v125 = sub_2443DABA4(v78, v79, (uint64_t *)&v121);
    sub_244406FE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2443D2000, v73, v74, "PlanksReader file path: %s", v76, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v77, -1, -1);
    MEMORY[0x24950E6FC](v76, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_retain();
  v80 = sub_244406D20();
  v81 = sub_244406FA8();
  v82 = os_log_type_enabled(v80, v81);
  v83 = v113;
  if (v82)
  {
    v84 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v84 = 134217984;
    v121 = *(uint8_t **)&v3[OBJC_IVAR____TtC6Planks12PlanksReader_fileSize];
    sub_244406FE4();
    swift_release();
    _os_log_impl(&dword_2443D2000, v80, v81, "PlanksReader file size: %lld", v84, 0xCu);
    MEMORY[0x24950E6FC](v84, -1, -1);

  }
  else
  {

    swift_release();
  }
  v85 = sub_244406D20();
  v86 = sub_244406FA8();
  if (os_log_type_enabled(v85, v86))
  {
    v87 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v87 = 134217984;
    v121 = (uint8_t *)v112;
    sub_244406FE4();
    _os_log_impl(&dword_2443D2000, v85, v86, "PlanksReader file metadata size: %ld", v87, 0xCu);
    MEMORY[0x24950E6FC](v87, -1, -1);
  }
  v115 = v3;

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v88 = (uint64_t)v117;
  swift_bridgeObjectRetain_n();
  v89 = sub_244406D20();
  v90 = sub_244406FA8();
  if (os_log_type_enabled(v89, v90))
  {
    v91 = (uint8_t *)swift_slowAlloc();
    v92 = swift_slowAlloc();
    v116 = (uint8_t *)v92;
    *(_DWORD *)v91 = 136315138;
    v93 = v66;
    v94 = (uint64_t)v118;
    v121 = v118;
    v122 = v93;
    v123 = v83;
    v124 = (uint64_t)v117;
    v125 = v92;
    v95 = sub_2443D8364();
    v121 = (uint8_t *)sub_2443DABA4(v95, v96, &v125);
    v88 = (uint64_t)v117;
    sub_244406FE4();
    swift_bridgeObjectRelease();
    sub_2443DD4D4(v94, v93);
    v97 = v94;
    v66 = v93;
    sub_2443DD4D4(v97, v93);
    _os_log_impl(&dword_2443D2000, v89, v90, "PlanksReader file metadata summary: %s", v91, 0xCu);
    v98 = v116;
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v98, -1, -1);
    MEMORY[0x24950E6FC](v91, -1, -1);
  }
  else
  {
    v99 = (uint64_t)v118;
    sub_2443DD4D4((uint64_t)v118, v66);
    sub_2443DD4D4(v99, v66);
  }

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v100 = sub_244406D20();
  v101 = sub_244406FA8();
  if (os_log_type_enabled(v100, v101))
  {
    v102 = (uint8_t *)swift_slowAlloc();
    v117 = (uint8_t *)swift_slowAlloc();
    v121 = v117;
    *(_DWORD *)v102 = 136315138;
    v116 = v102 + 4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v103 = v66;
    v104 = (uint64_t)v118;
    v105 = sub_2443DA640((uint64_t)v118, v103, (uint64_t)v83, v88);
    v107 = v106;
    sub_2443DD4D4(v104, v103);
    v125 = sub_2443DABA4(v105, v107, (uint64_t *)&v121);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    sub_2443DD4D4(v104, v103);
    sub_2443DD4D4(v104, v103);
    _os_log_impl(&dword_2443D2000, v100, v101, "PlanksReader file metadata: %s", v102, 0xCu);
    v108 = (uint64_t)v117;
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v108, -1, -1);
    MEMORY[0x24950E6FC](v102, -1, -1);
  }
  else
  {
    v109 = v66;
    v110 = (uint64_t)v118;
    sub_2443DD4D4((uint64_t)v118, v109);
    sub_2443DD4D4(v110, v109);
  }

  return v115;
}

uint64_t static PlanksReader.readMagic(_:begin:)(uint64_t a1, char a2)
{
  return sub_2443DD0D4(a1, a2);
}

uint64_t sub_2443D7060(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  __int16 v10;
  uint64_t v11;
  char v12;
  char v13;
  __int16 v14;
  char v15;
  BOOL v17;
  _QWORD v19[2];
  __int128 v20;
  char v21;
  char v22;
  __int128 v23;
  __int16 v24;
  _QWORD v25[2];
  __int128 v26;
  char v27;
  char v28;
  __int128 v29;
  __int16 v30;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v5 = 0;
      v6 = v2 - 1;
      do
      {
        v7 = *(_QWORD *)(a1 + v5 + 40);
        v8 = *(_BYTE *)(a1 + v5 + 64);
        v9 = *(_BYTE *)(a1 + v5 + 65);
        v10 = *(_WORD *)(a1 + v5 + 88);
        v25[0] = *(_QWORD *)(a1 + v5 + 32);
        v25[1] = v7;
        v26 = *(_OWORD *)(a1 + v5 + 48);
        v27 = v8;
        v28 = v9;
        v29 = *(_OWORD *)(a1 + v5 + 72);
        v30 = v10;
        v11 = *(_QWORD *)(a2 + v5 + 40);
        v12 = *(_BYTE *)(a2 + v5 + 64);
        v13 = *(_BYTE *)(a2 + v5 + 65);
        v14 = *(_WORD *)(a2 + v5 + 88);
        v19[0] = *(_QWORD *)(a2 + v5 + 32);
        v19[1] = v11;
        v20 = *(_OWORD *)(a2 + v5 + 48);
        v21 = v12;
        v22 = v13;
        v23 = *(_OWORD *)(a2 + v5 + 72);
        v24 = v14;
        v15 = _s6Planks11ColumnChunkV2eeoiySbAC_ACtFZ_0((uint64_t)v25, (uint64_t)v19);
        v17 = v6-- != 0;
        if ((v15 & 1) == 0)
          break;
        v5 += 64;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_2443D7150(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != a2[2])
    return 0;
  if (v2 && (_QWORD *)a1 != a2)
  {
    v3 = *(unsigned __int8 *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 32) == a2[4] && *(_QWORD *)(a1 + 40) == a2[5];
    if (v4 || (sub_244407224() & 1) != 0)
      __asm { BR              X8 }
    return 0;
  }
  return 1;
}

BOOL sub_2443D74A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  int v33;
  double v34;
  double v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  int v43;
  _BOOL8 result;
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
  unint64_t v61;
  __int16 v62;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
      return 1;
    v3 = 0;
    v4 = a1 + 32;
    v49 = *(_QWORD *)(a1 + 16);
    v50 = a2 + 32;
    v48 = a1 + 32;
    while (1)
    {
      v5 = v4 + 40 * v3;
      v57 = v3;
      if (*(_BYTE *)v5)
      {
        if (*(_BYTE *)v5 == 1)
        {
          v6 = 0xE400000000000000;
          v7 = 1635017060;
        }
        else
        {
          v6 = 0xE500000000000000;
          v7 = 0x7865646E69;
        }
      }
      else
      {
        v6 = 0xE600000000000000;
        v7 = 0x656C706D6973;
      }
      v8 = v50 + 40 * v3;
      if (*(_BYTE *)v8)
      {
        if (*(_BYTE *)v8 == 1)
        {
          v9 = 0xE400000000000000;
          v10 = 1635017060;
        }
        else
        {
          v9 = 0xE500000000000000;
          v10 = 0x7865646E69;
        }
      }
      else
      {
        v9 = 0xE600000000000000;
        v10 = 0x656C706D6973;
      }
      v11 = *(_QWORD *)(v5 + 8);
      v55 = *(_QWORD *)(v5 + 24);
      v56 = *(_QWORD *)(v5 + 16);
      v54 = *(_QWORD *)(v5 + 32);
      v12 = *(_QWORD *)(v8 + 8);
      v52 = *(_QWORD *)(v8 + 24);
      v53 = *(_QWORD *)(v8 + 16);
      v51 = *(_QWORD *)(v8 + 32);
      if (v7 != v10)
        goto LABEL_18;
      if (v6 == v9)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
      }
      else
      {
LABEL_18:
        v13 = sub_244407224();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v13 & 1) == 0)
          break;
      }
      v14 = *(_QWORD *)(v11 + 16);
      if (v14 != *(_QWORD *)(v12 + 16))
        break;
      if (v14 && v11 != v12)
      {
        v15 = 0;
        v16 = 0;
        v59 = v11;
        v60 = v12;
        v58 = *(_QWORD *)(v11 + 16);
        do
        {
          if (v16 >= *(_QWORD *)(v12 + 16))
          {
            __break(1u);
            JUMPOUT(0x2443D7D4CLL);
          }
          v61 = v16;
          v17 = v11 + v15;
          v18 = *(_QWORD *)(v11 + v15 + 32);
          v19 = *(_QWORD *)(v11 + v15 + 40);
          v20 = *(_QWORD *)(v11 + v15 + 48);
          v21 = *(_QWORD *)(v11 + v15 + 56);
          v22 = *(_BYTE *)(v17 + 64);
          v23 = *(unsigned __int8 *)(v17 + 65);
          v25 = *(double *)(v17 + 72);
          v24 = *(double *)(v17 + 80);
          v62 = *(_WORD *)(v17 + 88);
          v26 = v15;
          v27 = v12 + v15;
          v28 = *(_QWORD *)(v12 + v15 + 32);
          v29 = *(_QWORD *)(v12 + v15 + 40);
          v30 = *(_QWORD *)(v12 + v15 + 48);
          v31 = *(_QWORD *)(v12 + v15 + 56);
          v32 = *(_BYTE *)(v12 + v15 + 64);
          v33 = *(unsigned __int8 *)(v27 + 65);
          v35 = *(double *)(v27 + 72);
          v34 = *(double *)(v27 + 80);
          v36 = *(_WORD *)(v27 + 88);
          if ((v18 != v28 || v19 != v29) && (sub_244407224() & 1) == 0)
            goto LABEL_76;
          if (v20 != v30 || v21 != v31)
            goto LABEL_76;
          if ((v22 & 1) != 0)
          {
            if ((v32 & 1) == 0)
              goto LABEL_76;
          }
          else if ((v32 & 1) != 0)
          {
            goto LABEL_76;
          }
          if (v23 == 2)
          {
            v37 = v26;
            if (v33 != 2)
              goto LABEL_76;
          }
          else
          {
            if (v33 == 2)
              goto LABEL_76;
            v37 = v26;
            if ((v23 & 1) != 0)
              v38 = 0x657A69746E617571;
            else
              v38 = 0x6572706D6F636E75;
            if ((v23 & 1) != 0)
              v39 = 0xE900000000000064;
            else
              v39 = 0xEC00000064657373;
            if ((v33 & 1) != 0)
              v40 = 0x657A69746E617571;
            else
              v40 = 0x6572706D6F636E75;
            if ((v33 & 1) != 0)
              v41 = 0xE900000000000064;
            else
              v41 = 0xEC00000064657373;
            if (v38 == v40 && v39 == v41)
            {
              swift_bridgeObjectRelease_n();
            }
            else
            {
              v42 = sub_244407224();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v42 & 1) == 0)
                goto LABEL_76;
            }
          }
          v43 = v36;
          if (v62 != 12)
          {
            if (v36 != 12 && v25 == v35 && v24 == v34)
              __asm { BR              X10 }
            goto LABEL_76;
          }
          v11 = v59;
          v12 = v60;
          if (v43 != 12)
            goto LABEL_76;
          v16 = v61 + 1;
          v15 = v37 + 64;
        }
        while (v58 != v61 + 1);
      }
      v3 = v57 + 1;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = v56 == v53 && v55 == v52 && v54 == v51;
      v4 = v48;
      if (!result || v3 == v49)
        return result;
    }
LABEL_76:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return 0;
}

BOOL sub_2443D7E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BOOL8 result;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  if (*(unsigned __int8 *)(a1 + 32) != *(unsigned __int8 *)(a2 + 32))
    return 0;
  if (v2 == 1)
    return 1;
  v4 = v2 - 2;
  v5 = (unsigned __int8 *)(a1 + 33);
  v6 = (unsigned __int8 *)(a2 + 33);
  do
  {
    v8 = *v5++;
    v7 = v8;
    v10 = *v6++;
    v9 = v10;
    v12 = v4-- != 0;
    result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

uint64_t static PlanksReader.readMetadataSize(_:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_2443DD274();
  if (v0)
    return v2;
  return result;
}

void static PlanksReader.readMetadata(_:metadataSize:)(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  _QWORD *v24;
  os_log_t v25;
  _DWORD *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  int v31;
  _DWORD *v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  os_log_t v41;

  v5 = sub_244406A80();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244406D68();
  v10 = v9;
  if ((v11 & 1) != 0)
  {
    LODWORD(v38) = v9;
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    swift_allocError();
    *v26 = v10;
    return;
  }
  v12 = v9 - a1;
  if (__OFSUB__(v9, a1))
  {
    __break(1u);
LABEL_22:
    swift_once();
    goto LABEL_12;
  }
  if (v12 > 0)
  {
    v13 = swift_slowAlloc();
    v14 = sub_244406D50();
    if ((v15 & 1) != 0)
    {
      v31 = v14;
      LODWORD(v38) = v14;
      sub_2443DAC74();
      swift_willThrowTypedImpl();
      swift_allocError();
      *v32 = v31;
    }
    else
    {
      sub_244406AB0();
      swift_allocObject();
      sub_244406AA4();
      (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCB1D8], v5);
      sub_244406A8C();
      v16 = sub_2443D97D8(v13, a1);
      v18 = v17;
      sub_2443DD510();
      sub_244406A98();
      if (v2)
      {
        sub_2443DD554(v16, v18);
        if (qword_25735DB50 != -1)
          swift_once();
        v19 = sub_244406D38();
        __swift_project_value_buffer(v19, (uint64_t)qword_2573610D0);
        MEMORY[0x24950E5E8](v2);
        MEMORY[0x24950E5E8](v2);
        v20 = sub_244406D20();
        v21 = sub_244406FB4();
        if (os_log_type_enabled(v20, v21))
        {
          v41 = v20;
          v22 = (uint8_t *)swift_slowAlloc();
          v37 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v22 = 138412290;
          MEMORY[0x24950E5E8](v2);
          v23 = _swift_stdlib_bridgeErrorToNSError();
          v38 = v23;
          sub_244406FE4();
          v24 = v37;
          *v37 = v23;

          v25 = v41;
          _os_log_impl(&dword_2443D2000, v41, v21, "Failed at parsing metadata: %@", v22, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25735DC28);
          swift_arrayDestroy();
          MEMORY[0x24950E6FC](v24, -1, -1);
          MEMORY[0x24950E6FC](v22, -1, -1);

          swift_release();
        }
        else
        {
          swift_release();

        }
        v33 = 0;
        v35 = 0;
        v34 = 0uLL;
      }
      else
      {
        sub_2443DD554(v16, v18);
        swift_release();
        v33 = v38;
        v34 = v39;
        v35 = v40;
      }
      *(_QWORD *)a2 = v33;
      *(_OWORD *)(a2 + 8) = v34;
      *(_QWORD *)(a2 + 24) = v35;
    }
    MEMORY[0x24950E6FC](v13, -1, -1);
    return;
  }
  if (qword_25735DB50 != -1)
    goto LABEL_22;
LABEL_12:
  v27 = sub_244406D38();
  __swift_project_value_buffer(v27, (uint64_t)qword_2573610D0);
  v28 = sub_244406D20();
  v29 = sub_244406FB4();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v30 = 134217984;
    v38 = v12;
    sub_244406FE4();
    _os_log_impl(&dword_2443D2000, v28, v29, "Invalid metadataOffset: %lld", v30, 0xCu);
    MEMORY[0x24950E6FC](v30, -1, -1);
  }

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
}

uint64_t sub_2443D8364()
{
  sub_24440705C();
  sub_244406E04();
  sub_244406E04();
  sub_2444071F4();
  sub_244406E04();
  swift_bridgeObjectRelease();
  sub_244406E04();
  sub_2444071F4();
  sub_244406E04();
  swift_bridgeObjectRelease();
  sub_244406E04();
  sub_2444071F4();
  sub_244406E04();
  swift_bridgeObjectRelease();
  sub_244406E04();
  sub_2444071F4();
  sub_244406E04();
  swift_bridgeObjectRelease();
  sub_244406E04();
  return 0;
}

uint64_t PlanksReader.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if ((sub_244406D74() & 0x100000000) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
  }
  v1 = v0 + OBJC_IVAR____TtC6Planks12PlanksReader_filePath;
  v2 = sub_244406DA4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlanksReader.__deallocating_deinit()
{
  PlanksReader.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2443D8650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 8);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v4 = sub_2443D5B8C(v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v2 = sub_2443DD658(v4);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2443D8730(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2443D8748(uint64_t *a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_2443D8650();
  return sub_2443D877C;
}

uint64_t sub_2443D877C(_QWORD *a1, uint64_t a2)
{
  return sub_2443D952C(a1, a2, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet);
}

uint64_t sub_2443D8788()
{
  return sub_2443D8E9C(&OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName, sub_2443D879C);
}

uint64_t sub_2443D879C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char isUniquelyReferenced_nonNull_native;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t result;

  if (qword_25735DB50 != -1)
LABEL_23:
    swift_once();
  v2 = sub_244406D38();
  __swift_project_value_buffer(v2, (uint64_t)qword_2573610D0);
  v3 = sub_244406D20();
  v4 = sub_244406FA8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2443D2000, v3, v4, "Building elementByName index", v5, 2u);
    MEMORY[0x24950E6FC](v5, -1, -1);
  }

  v6 = (_QWORD *)sub_2443F2778(MEMORY[0x24BEE4AF8]);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 8) + 16);
  if (!v7)
    return (uint64_t)v6;
  v8 = (_QWORD *)(swift_bridgeObjectRetain() + 56);
  while (1)
  {
    v11 = *(v8 - 3);
    v10 = *(v8 - 2);
    v12 = *((_BYTE *)v8 - 8);
    a1 = *v8;
    swift_bridgeObjectRetain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = sub_2443DC1EC(v11, v10);
    v16 = v6[2];
    v17 = (v14 & 1) == 0;
    v18 = v16 + v17;
    if (__OFADD__(v16, v17))
    {
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    v19 = v14;
    if (v6[3] < v18)
      break;
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v14 & 1) != 0)
        goto LABEL_6;
    }
    else
    {
      sub_2443F5954();
      if ((v19 & 1) != 0)
      {
LABEL_6:
        v9 = v6[7] + 32 * v15;
        swift_bridgeObjectRelease();
        *(_QWORD *)v9 = v11;
        *(_QWORD *)(v9 + 8) = v10;
        *(_BYTE *)(v9 + 16) = v12;
        *(_QWORD *)(v9 + 24) = a1;
        goto LABEL_7;
      }
    }
LABEL_15:
    v6[(v15 >> 6) + 8] |= 1 << v15;
    v22 = (uint64_t *)(v6[6] + 16 * v15);
    *v22 = v11;
    v22[1] = v10;
    v23 = v6[7] + 32 * v15;
    *(_QWORD *)v23 = v11;
    *(_QWORD *)(v23 + 8) = v10;
    *(_BYTE *)(v23 + 16) = v12;
    *(_QWORD *)(v23 + 24) = a1;
    v24 = v6[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_22;
    v6[2] = v26;
    swift_bridgeObjectRetain();
LABEL_7:
    v8 += 4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!--v7)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v6;
    }
  }
  sub_2443F4E58(v18, isUniquelyReferenced_nonNull_native);
  v20 = sub_2443DC1EC(v11, v10);
  if ((v19 & 1) == (v21 & 1))
  {
    v15 = v20;
    if ((v19 & 1) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
  result = sub_244407260();
  __break(1u);
  return result;
}

uint64_t sub_2443D8A30(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2443D8A48(uint64_t *a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_2443D8788();
  return sub_2443D8A7C;
}

uint64_t sub_2443D8A7C(_QWORD *a1, uint64_t a2)
{
  return sub_2443D952C(a1, a2, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName);
}

uint64_t sub_2443D8A88()
{
  return sub_2443D8E9C(&OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement, (uint64_t (*)(uint64_t))sub_2443D8A9C);
}

uint64_t sub_2443D8A9C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  _QWORD *v4;
  uint64_t v5;
  void (*v6)(_QWORD *@<X8>);
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  _QWORD *v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (qword_25735DB50 != -1)
LABEL_35:
    swift_once();
  v0 = sub_244406D38();
  __swift_project_value_buffer(v0, (uint64_t)qword_2573610D0);
  v1 = sub_244406D20();
  v2 = sub_244406FA8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2443D2000, v1, v2, "Building chunksByElement index", v3, 2u);
    MEMORY[0x24950E6FC](v3, -1, -1);
  }

  v4 = (_QWORD *)sub_2443F28B4(MEMORY[0x24BEE4AF8]);
  v5 = swift_bridgeObjectRetain();
  v6 = 0;
  v7 = 0;
  v8 = 40;
LABEL_5:
  v9 = *(_QWORD *)(v5 + 16);
  if (v7 <= v9)
    v10 = *(_QWORD *)(v5 + 16);
  else
    v10 = v7;
  v11 = v8 + 40 * v7;
  while (v9 != v7)
  {
    if (v10 == v7)
    {
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
    v12 = *(_QWORD *)(v5 + v11);
    ++v7;
    v13 = *(_QWORD *)(v12 + 16);
    v11 += 40;
    if (v13)
    {
      v38 = v8;
      v39 = v5;
      swift_bridgeObjectRetain();
      v14 = 0;
      v40 = v13;
      v15 = (uint64_t *)(v12 + 40);
      while (1)
      {
        v17 = *(v15 - 1);
        v16 = *v15;
        swift_bridgeObjectRetain();
        sub_2443DDCD8((uint64_t)v6);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v20 = sub_2443DC1EC(v17, v16);
        v21 = v4[2];
        v22 = (v19 & 1) == 0;
        v23 = v21 + v22;
        if (__OFADD__(v21, v22))
          goto LABEL_33;
        v24 = v19;
        if (v4[3] >= v23)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_2443F5B20();
        }
        else
        {
          sub_2443F5194(v23, isUniquelyReferenced_nonNull_native);
          v25 = sub_2443DC1EC(v17, v16);
          if ((v24 & 1) != (v26 & 1))
          {
            result = sub_244407260();
            __break(1u);
            return result;
          }
          v20 = v25;
        }
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0)
        {
          v4[(v20 >> 6) + 8] |= 1 << v20;
          v27 = (uint64_t *)(v4[6] + 16 * v20);
          *v27 = v17;
          v27[1] = v16;
          *(_QWORD *)(v4[7] + 8 * v20) = MEMORY[0x24BEE4AF8];
          v28 = v4[2];
          v29 = v28 + 1;
          v30 = __OFADD__(v28, 1);
          swift_bridgeObjectRetain();
          if (v30)
            goto LABEL_34;
          v4[2] = v29;
        }
        swift_bridgeObjectRetain();
        v31 = v4[7];
        swift_bridgeObjectRelease();
        v32 = *(_QWORD **)(v31 + 8 * v20);
        v33 = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(v31 + 8 * v20) = v32;
        if ((v33 & 1) == 0)
        {
          v32 = sub_2443E239C(0, v32[2] + 1, 1, v32);
          *(_QWORD *)(v31 + 8 * v20) = v32;
        }
        v35 = v32[2];
        v34 = v32[3];
        if (v35 >= v34 >> 1)
        {
          v32 = sub_2443E239C((_QWORD *)(v34 > 1), v35 + 1, 1, v32);
          *(_QWORD *)(v31 + 8 * v20) = v32;
        }
        v15 += 8;
        v32[2] = v35 + 1;
        v36 = &v32[2 * v35];
        v36[4] = v7 - 1;
        v36[5] = v14;
        swift_bridgeObjectRelease();
        v6 = sub_2443D8E20;
        if (v40 == ++v14)
        {
          swift_bridgeObjectRelease();
          v8 = v38;
          v5 = v39;
          goto LABEL_5;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  sub_2443DDCD8((uint64_t)v6);
  return (uint64_t)v4;
}

void sub_2443D8E20(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_2443D8E30(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2443D8E48(uint64_t *a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_2443D8A88();
  return sub_2443D8E7C;
}

uint64_t sub_2443D8E7C(_QWORD *a1, uint64_t a2)
{
  return sub_2443D952C(a1, a2, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement);
}

uint64_t sub_2443D8E88()
{
  return sub_2443D8E9C(&OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement, (uint64_t (*)(uint64_t))sub_2443D8EFC);
}

uint64_t sub_2443D8E9C(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  v4 = *(_QWORD *)(v2 + *a1);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v5 = a2(v2);
    *(_QWORD *)(v2 + v3) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v5;
}

uint64_t sub_2443D8EFC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  int64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char v40;
  char v41;
  unint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  char v48;
  uint64_t *v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;

  if (qword_25735DB50 != -1)
LABEL_67:
    swift_once();
  v0 = sub_244406D38();
  __swift_project_value_buffer(v0, (uint64_t)qword_2573610D0);
  v1 = sub_244406D20();
  v2 = sub_244406FA8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2443D2000, v1, v2, "Building groupsByElement index", v3, 2u);
    MEMORY[0x24950E6FC](v3, -1, -1);
  }

  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v5 = (_QWORD *)sub_2443F28C0(MEMORY[0x24BEE4AF8]);
  v6 = sub_2443D8A88();
  v7 = 0;
  v54 = v6 + 64;
  v8 = 1 << *(_BYTE *)(v6 + 32);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v6 + 64);
  v55 = (unint64_t)(v8 + 63) >> 6;
  v56 = v6;
  while (1)
  {
    if (v10)
    {
      v57 = (v10 - 1) & v10;
      v12 = __clz(__rbit64(v10)) | (v7 << 6);
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_65;
      if (v13 >= v55)
      {
LABEL_61:
        swift_release();
        return (uint64_t)v5;
      }
      v14 = *(_QWORD *)(v54 + 8 * v13);
      ++v7;
      if (!v14)
      {
        v7 = v13 + 1;
        if (v13 + 1 >= v55)
          goto LABEL_61;
        v14 = *(_QWORD *)(v54 + 8 * v7);
        if (!v14)
        {
          v7 = v13 + 2;
          if (v13 + 2 >= v55)
            goto LABEL_61;
          v14 = *(_QWORD *)(v54 + 8 * v7);
          if (!v14)
          {
            v15 = v13 + 3;
            if (v15 >= v55)
              goto LABEL_61;
            v14 = *(_QWORD *)(v54 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                v7 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_66;
                if (v7 >= v55)
                  goto LABEL_61;
                v14 = *(_QWORD *)(v54 + 8 * v7);
                ++v15;
                if (v14)
                  goto LABEL_25;
              }
            }
            v7 = v15;
          }
        }
      }
LABEL_25:
      v57 = (v14 - 1) & v14;
      v12 = __clz(__rbit64(v14)) + (v7 << 6);
    }
    v58 = v7;
    v59 = v5;
    v16 = (uint64_t *)(*(_QWORD *)(v56 + 48) + 16 * v12);
    v60 = v16[1];
    v61 = *v16;
    v17 = *(_QWORD *)(*(_QWORD *)(v56 + 56) + 8 * v12);
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v62 = v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2443F7DA0(0, v18, 0);
      v19 = v62;
      v20 = v62[2];
      v21 = 32;
      do
      {
        v22 = *(_QWORD *)(v17 + v21);
        v62 = v19;
        v23 = v19[3];
        if (v20 >= v23 >> 1)
        {
          sub_2443F7DA0(v23 > 1, v20 + 1, 1);
          v19 = v62;
        }
        v19[2] = v20 + 1;
        v19[v20 + 4] = v22;
        v21 += 16;
        ++v20;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      v19 = v4;
    }
    v24 = sub_244406F48();
    v25 = v19[2];
    if (v25)
    {
      v26 = 0;
      do
      {
        v28 = v24 + 56;
        while (1)
        {
          v29 = v19[v26++ + 4];
          v30 = sub_24440726C();
          v31 = -1 << *(_BYTE *)(v24 + 32);
          v32 = v30 & ~v31;
          if (((*(_QWORD *)(v28 + ((v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
            break;
          v33 = *(_QWORD *)(v24 + 48);
          if (*(_QWORD *)(v33 + 8 * v32) != v29)
          {
            v34 = ~v31;
            do
            {
              v32 = (v32 + 1) & v34;
              if (((*(_QWORD *)(v28 + ((v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
                goto LABEL_35;
            }
            while (*(_QWORD *)(v33 + 8 * v32) != v29);
          }
          if (v26 == v25)
            goto LABEL_44;
        }
LABEL_35:
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v62 = (_QWORD *)v24;
        sub_2443DBBC0(v29, v32, isUniquelyReferenced_nonNull_native);
        v24 = (uint64_t)v62;
        swift_bridgeObjectRelease();
      }
      while (v26 != v25);
    }
LABEL_44:
    swift_bridgeObjectRelease();
    v35 = *(_QWORD *)(v24 + 16);
    if (v35)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DB60);
      v36 = (_QWORD *)swift_allocObject();
      v37 = _swift_stdlib_malloc_size(v36);
      v38 = v37 - 32;
      if (v37 < 32)
        v38 = v37 - 25;
      v36[2] = v35;
      v36[3] = 2 * (v38 >> 3);
      v39 = sub_2443DCE40(&v62, v36 + 4, v35, v24);
      swift_bridgeObjectRetain();
      sub_2443DDCD0();
      if (v39 != (_QWORD *)v35)
        goto LABEL_63;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v36 = v4;
    }
    v40 = swift_isUniquelyReferenced_nonNull_native();
    v62 = v59;
    v42 = sub_2443DC1EC(v61, v60);
    v43 = v59[2];
    v44 = (v41 & 1) == 0;
    v45 = v43 + v44;
    if (__OFADD__(v43, v44))
    {
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
      goto LABEL_67;
    }
    v46 = v41;
    if (v59[3] < v45)
      break;
    if ((v40 & 1) != 0)
    {
      v5 = v62;
      if ((v41 & 1) != 0)
        goto LABEL_8;
    }
    else
    {
      sub_2443F5B2C();
      v5 = v62;
      if ((v46 & 1) != 0)
      {
LABEL_8:
        v11 = v5[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v11 + 8 * v42) = v36;
        goto LABEL_9;
      }
    }
LABEL_57:
    v5[(v42 >> 6) + 8] |= 1 << v42;
    v49 = (uint64_t *)(v5[6] + 16 * v42);
    *v49 = v61;
    v49[1] = v60;
    *(_QWORD *)(v5[7] + 8 * v42) = v36;
    v50 = v5[2];
    v51 = __OFADD__(v50, 1);
    v52 = v50 + 1;
    if (v51)
      goto LABEL_64;
    v5[2] = v52;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = v57;
    v7 = v58;
  }
  sub_2443F51A0(v45, v40);
  v47 = sub_2443DC1EC(v61, v60);
  if ((v46 & 1) == (v48 & 1))
  {
    v42 = v47;
    v5 = v62;
    if ((v46 & 1) != 0)
      goto LABEL_8;
    goto LABEL_57;
  }
  result = sub_244407260();
  __break(1u);
  return result;
}

uint64_t sub_2443D94D4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2443D94EC(uint64_t *a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_2443D8E88();
  return sub_2443D9520;
}

uint64_t sub_2443D9520(_QWORD *a1, uint64_t a2)
{
  return sub_2443D952C(a1, a2, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement);
}

uint64_t sub_2443D952C(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  *(_QWORD *)(a1[1] + *a3) = *a1;
  return swift_bridgeObjectRelease();
}

uint64_t static PlanksReader.readFilesize(_:)()
{
  uint64_t v0;
  char v1;
  _DWORD *v2;

  v0 = sub_244406D68();
  if ((v1 & 1) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    swift_allocError();
    *v2 = v0;
  }
  return v0;
}

uint64_t static PlanksReader.validateMagic(_:)(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  const char *v9;
  BOOL v11;
  uint64_t v12;

  v2 = sub_2443DD0D4(a1, 1);
  if (qword_25735DB58 != -1)
    swift_once();
  v3 = sub_2443D7E0C(v2, (uint64_t)off_25735E290);
  swift_bridgeObjectRelease();
  if (!v3)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v5 = sub_244406D38();
    __swift_project_value_buffer(v5, (uint64_t)qword_2573610D0);
    v6 = sub_244406D20();
    v7 = sub_244406FB4();
    if (!os_log_type_enabled(v6, v7))
      goto LABEL_10;
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    v9 = "Invalid file magic begin.";
    goto LABEL_9;
  }
  v4 = sub_2443DD0D4(a1, 0);
  v11 = sub_2443D7E0C(v4, (uint64_t)off_25735E290);
  swift_bridgeObjectRelease();
  if (!v11)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v12 = sub_244406D38();
    __swift_project_value_buffer(v12, (uint64_t)qword_2573610D0);
    v6 = sub_244406D20();
    v7 = sub_244406FB4();
    if (!os_log_type_enabled(v6, v7))
      goto LABEL_10;
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    v9 = "Invalid file magic end.";
LABEL_9:
    _os_log_impl(&dword_2443D2000, v6, v7, v9, v8, 2u);
    MEMORY[0x24950E6FC](v8, -1, -1);
LABEL_10:

    return 0;
  }
  return 1;
}

uint64_t sub_2443D97D8(uint64_t __src, uint64_t a2)
{
  if (__src)
  {
    if (a2)
    {
      if (a2 <= 14)
      {
        return sub_2443DD598((_BYTE *)__src, (_BYTE *)(__src + a2));
      }
      else
      {
        sub_244406B1C();
        swift_allocObject();
        sub_244406AEC();
        if ((unint64_t)a2 >= 0x7FFFFFFF)
        {
          sub_244406B28();
          __src = swift_allocObject();
          *(_QWORD *)(__src + 16) = 0;
          *(_QWORD *)(__src + 24) = a2;
        }
        else
        {
          return a2 << 32;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return __src;
}

uint64_t sub_2443D9890()
{
  uint64_t v0;
  int v1;
  void *v2;
  _DWORD *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v0 = sub_244406D74();
  if ((v0 & 0x100000000) != 0)
  {
    v1 = v0;
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    v2 = (void *)swift_allocError();
    *v3 = v1;
    if (qword_25735DB50 != -1)
      swift_once();
    v4 = sub_244406D38();
    __swift_project_value_buffer(v4, (uint64_t)qword_2573610D0);
    MEMORY[0x24950E5E8](v2);
    MEMORY[0x24950E5E8](v2);
    v5 = sub_244406D20();
    v6 = sub_244406FB4();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v14 = v9;
      *(_DWORD *)v7 = 136315394;
      swift_beginAccess();
      sub_244406DA4();
      sub_2443DD48C();
      v10 = sub_2444071F4();
      sub_2443DABA4(v10, v11, &v14);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2112;
      MEMORY[0x24950E5E8](v2);
      v13 = _swift_stdlib_bridgeErrorToNSError();
      sub_244406FE4();
      *v8 = v13;

      _os_log_impl(&dword_2443D2000, v5, v6, "Failed at closing PlanksReader(%s): %@", (uint8_t *)v7, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DC28);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v8, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v9, -1, -1);
      MEMORY[0x24950E6FC](v7, -1, -1);

    }
    else
    {

    }
  }
  return swift_release();
}

uint64_t sub_2443D9B64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  swift_bridgeObjectRetain();
  v4 = sub_2443D8A88();
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_2443DC1EC(a1, a2), (v6 & 1) != 0))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8 = sub_2443D5C60(v7);
    swift_bridgeObjectRelease();
    v9 = sub_2443DD6EC(v8);
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v9 + 16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

uint64_t sub_2443D9C34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8E88();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    v13 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    return v13;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v9 + 16);
  if (!v11)
  {
    v13 = 0;
    goto LABEL_12;
  }
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)(v3 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  v15 = *(_QWORD *)(v14 + 16);
  v16 = v14 + 32;
  while (1)
  {
    v17 = 0;
    v18 = *(_QWORD *)(v9 + 8 * v12 + 32);
    if ((v18 & 0x8000000000000000) == 0 && v18 < v15)
      v17 = *(_QWORD *)(v16 + 40 * v18 + 32);
    v19 = __OFADD__(v13, v17);
    v13 += v17;
    if (v19)
      break;
    if (v11 == ++v12)
      goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_2443D9D44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v13;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8E88();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_retain();
  v10 = sub_2443DD75C(v9, v3);
  swift_bridgeObjectRelease();
  swift_release();
  v13 = v10;
  swift_bridgeObjectRetain();
  sub_2443DC330((uint64_t *)&v13);
  swift_bridgeObjectRelease();
  if (!v13[2])
  {
    swift_release();
    return 0;
  }
  v11 = v13[4];
  swift_release();
  return v11;
}

_QWORD *sub_2443D9E64()
{
  _QWORD *v0;
  unint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  swift_retain();
  sub_2444070BC();
  swift_release();
  sub_244407140();
  if (*((_QWORD *)&v10 + 1))
  {
    v0 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v5 = v8;
      v6 = v9;
      v7 = v10;
      if (*((_QWORD *)&v8 + 1))
      {
        sub_244406E04();
        sub_244406E04();
        __swift_project_boxed_opaque_existential_0(&v6, *((uint64_t *)&v7 + 1));
        sub_244407218();
        sub_2443DDC20((uint64_t)&v5);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v0 = sub_2443E2290(0, v0[2] + 1, 1, v0);
        v2 = v0[2];
        v1 = v0[3];
        if (v2 >= v1 >> 1)
          v0 = sub_2443E2290((_QWORD *)(v1 > 1), v2 + 1, 1, v0);
        v0[2] = v2 + 1;
        v3 = &v0[2 * v2];
        v3[4] = 0;
        v3[5] = 0xE000000000000000;
      }
      else
      {
        sub_2443DDC20((uint64_t)&v5);
      }
      sub_244407140();
    }
    while (*((_QWORD *)&v10 + 1));
  }
  else
  {
    v0 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_release();
  return v0;
}

uint64_t sub_2443D9FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRetain();
  v4 = sub_2443D8A88();
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_2443DC1EC(a1, a2), (v6 & 1) != 0))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)(v7 + 16);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

uint64_t sub_2443DA084(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_bridgeObjectRetain();
  v4 = sub_2443D8A88();
  if (!*(_QWORD *)(v4 + 16) || (v5 = sub_2443DC1EC(a1, a2), (v6 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 2;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = sub_2443DCFE8(v7, sub_2443DD880);
  result = swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v8 + 16);
  if (!v10)
    goto LABEL_6;
  if (*(_BYTE *)(v8 + 32) != 1)
  {
    v11 = 0;
    goto LABEL_16;
  }
  if (v10 == 1)
  {
LABEL_6:
    v11 = 1;
LABEL_16:
    swift_bridgeObjectRelease();
    return v11;
  }
  v12 = 33;
  while (1)
  {
    v13 = v12 - 31;
    if (__OFADD__(v12 - 32, 1))
      break;
    v11 = *(unsigned __int8 *)(v8 + v12++);
    if ((_DWORD)v11 != 1 || v13 == v10)
      goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_2443DA1A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t *v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8A88();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 2;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v9 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v22 = MEMORY[0x24BEE4AF8];
    sub_2443F7DBC(0, v10, 0);
    v11 = v22;
    v12 = (uint64_t *)(v9 + 40);
    do
    {
      v13 = sub_2443DA340(*(v12 - 1), *v12, v3);
      v15 = *(_QWORD *)(v22 + 16);
      v14 = *(_QWORD *)(v22 + 24);
      if (v15 >= v14 >> 1)
        sub_2443F7DBC(v14 > 1, v15 + 1, 1);
      v12 += 2;
      *(_QWORD *)(v22 + 16) = v15 + 1;
      *(_BYTE *)(v22 + v15 + 32) = v13 & 1;
      --v10;
    }
    while (v10);
  }
  result = swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(v11 + 16);
  if (!v18)
    goto LABEL_13;
  if (*(_BYTE *)(v11 + 32) != 1)
  {
    v16 = 0;
    goto LABEL_22;
  }
  if (v18 == 1)
  {
LABEL_13:
    v16 = 1;
LABEL_22:
    swift_bridgeObjectRelease();
    return v16;
  }
  v19 = 33;
  while (1)
  {
    v20 = v19 - 31;
    if (__OFADD__(v19 - 32, 1))
      break;
    v16 = *(unsigned __int8 *)(v11 + v19++);
    if ((_DWORD)v16 != 1 || v20 == v18)
      goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_2443DA340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;

  v3 = 0;
  if ((a1 & 0x8000000000000000) == 0)
  {
    v4 = *(_QWORD *)(a3 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
    if (*(_QWORD *)(v4 + 16) > a1)
    {
      v3 = 0;
      if ((a2 & 0x8000000000000000) == 0)
      {
        v5 = *(_QWORD *)(v4 + 40 * a1 + 40);
        if (*(_QWORD *)(v5 + 16) > a2)
        {
          v6 = *(unsigned __int8 *)(v5 + (a2 << 6) + 65);
          if (v6 == 2)
          {
            v3 = 0;
          }
          else if ((v6 & 1) != 0)
          {
            v7 = sub_244407224();
            swift_bridgeObjectRelease();
            v3 = v7 ^ 1;
          }
          else
          {
            swift_bridgeObjectRelease();
            v3 = 0;
          }
        }
      }
    }
  }
  return v3 & 1;
}

uint64_t sub_2443DA424@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t result;

  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) != 0))
  {
    v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
    v10 = *(_QWORD *)(v9 + 8);
    v11 = *(_BYTE *)(v9 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (!v10)
    {
      v11 = 12;
      goto LABEL_7;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v11 = 12;
  }
  result = swift_bridgeObjectRelease();
LABEL_7:
  *a3 = v11;
  return result;
}

uint64_t sub_2443DA4D4()
{
  _OWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _OWORD *v5;
  __int128 v6;
  _QWORD *v7;
  _QWORD *v9;
  _QWORD v10[4];

  v1 = sub_2444072B4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[3] = &type metadata for ColumnChunk;
  v5 = (_OWORD *)swift_allocObject();
  v10[0] = v5;
  v6 = v0[1];
  v5[1] = *v0;
  v5[2] = v6;
  v5[3] = v0[2];
  *(_OWORD *)((char *)v5 + 58) = *(_OWORD *)((char *)v0 + 42);
  sub_2443DDBAC((uint64_t)v0);
  sub_24440729C();
  sub_2444072A8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v7 = sub_2443D9E64();
  swift_release();
  strcpy((char *)v10, "ColumnChunk(");
  BYTE5(v10[1]) = 0;
  HIWORD(v10[1]) = -5120;
  v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDD8);
  sub_2443DDBD4();
  sub_244406DE0();
  swift_bridgeObjectRelease();
  sub_244406E04();
  swift_bridgeObjectRelease();
  sub_244406E04();
  return v10[0];
}

uint64_t sub_2443DA640(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v15;
  _QWORD v16[4];

  v8 = sub_2444072B4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[3] = &type metadata for FileMetadata;
  v12 = (_QWORD *)swift_allocObject();
  v16[0] = v12;
  v12[2] = a1;
  v12[3] = a2;
  v12[4] = a3;
  v12[5] = a4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24440729C();
  sub_2444072A8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v13 = sub_2443D9E64();
  swift_release();
  strcpy((char *)v16, "FileMetadata(");
  HIWORD(v16[1]) = -4864;
  v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDD8);
  sub_2443DDBD4();
  sub_244406DE0();
  swift_bridgeObjectRelease();
  sub_244406E04();
  swift_bridgeObjectRelease();
  sub_244406E04();
  return v16[0];
}

uint64_t sub_2443DA7D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;
  _QWORD v16[4];

  v8 = sub_2444072B4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[3] = &type metadata for SchemaElement;
  v12 = swift_allocObject();
  v16[0] = v12;
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  *(_BYTE *)(v12 + 32) = a3;
  *(_QWORD *)(v12 + 40) = a4;
  swift_bridgeObjectRetain();
  sub_24440729C();
  sub_2444072A8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v13 = sub_2443D9E64();
  swift_release();
  strcpy((char *)v16, "SchemaElement(");
  HIBYTE(v16[1]) = -18;
  v15 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDD8);
  sub_2443DDBD4();
  sub_244406DE0();
  swift_bridgeObjectRelease();
  sub_244406E04();
  swift_bridgeObjectRelease();
  sub_244406E04();
  return v16[0];
}

uint64_t sub_2443DA954()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD *v7;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  ValueMetadata *v12;

  v1 = sub_2444072B4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = &type metadata for RowGroup;
  v5 = swift_allocObject();
  v10 = v5;
  v6 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v5 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 48) = *(_QWORD *)(v0 + 32);
  sub_2443DDBAC(v0);
  sub_24440729C();
  sub_2444072A8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v7 = sub_2443D9E64();
  swift_release();
  v10 = 0x70756F7247776F52;
  v11 = 0xE900000000000028;
  v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDD8);
  sub_2443DDBD4();
  sub_244406DE0();
  swift_bridgeObjectRelease();
  sub_244406E04();
  swift_bridgeObjectRelease();
  sub_244406E04();
  return v10;
}

uint64_t sub_2443DAAB4@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result;
  int v3;
  _DWORD *v4;

  result = sub_244406D44();
  v3 = result;
  if ((result & 0x100000000) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    result = swift_allocError();
    *v4 = v3;
  }
  else
  {
    *a1 = result;
  }
  return result;
}

uint64_t sub_2443DAB38@<X0>(_DWORD *a1@<X8>)
{
  return sub_2443DAAB4(a1);
}

uint64_t type metadata accessor for PlanksReader()
{
  uint64_t result;

  result = qword_25735DC70;
  if (!qword_25735DC70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2443DABA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2443DACB8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2443DDD3C((uint64_t)v12, *a3);
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
      sub_2443DDD3C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_2443DAC74()
{
  unint64_t result;

  result = qword_25735DC30;
  if (!qword_25735DC30)
  {
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE6000], MEMORY[0x24BEE5FF8]);
    atomic_store(result, (unint64_t *)&qword_25735DC30);
  }
  return result;
}

uint64_t sub_2443DACB8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_244406FF0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2443DAE70(a5, a6);
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
  v8 = sub_244407080();
  if (!v8)
  {
    sub_2444070EC();
    __break(1u);
LABEL_17:
    result = sub_244407134();
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

uint64_t sub_2443DAE70(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2443DAF04(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2443DB0DC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2443DB0DC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2443DAF04(uint64_t a1, unint64_t a2)
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
      v3 = sub_2443DB078(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_244407068();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2444070EC();
      __break(1u);
LABEL_10:
      v2 = sub_244406E10();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_244407134();
    __break(1u);
LABEL_14:
    result = sub_2444070EC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2443DB078(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE08);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2443DB0DC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE08);
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
  result = sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443DB228(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_244407278();
  swift_bridgeObjectRetain();
  sub_244406DF8();
  v8 = sub_244407290();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_244407224() & 1) != 0)
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
      if (v19 || (sub_244407224() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2443DBA28(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2443DB3D4(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = sub_24440726C();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_2443DBBC0(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_2443DB4CC()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE00);
  v3 = sub_244407044();
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
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_244407278();
      sub_244406DF8();
      result = sub_244407290();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2443DB7A8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDF8);
  result = sub_244407044();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
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
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
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
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      result = sub_24440726C();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2443DBA28(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2443DB4CC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2443EEF9C();
      goto LABEL_22;
    }
    sub_2443DBCE0();
  }
  v11 = *v4;
  sub_244407278();
  sub_244406DF8();
  result = sub_244407290();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_244407224(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_244407254();
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
          result = sub_244407224();
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

uint64_t sub_2443DBBC0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_2443DB7A8();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_2443EF14C();
      goto LABEL_14;
    }
    sub_2443DBF8C();
  }
  v8 = *v3;
  result = sub_24440726C();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_244407254();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

uint64_t sub_2443DBCE0()
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
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE00);
  v3 = sub_244407044();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
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
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_244407278();
    swift_bridgeObjectRetain();
    sub_244406DF8();
    result = sub_244407290();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2443DBF8C()
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
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDF8);
  result = sub_244407044();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
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
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
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
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    result = sub_24440726C();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
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
    if (v5 >= v10)
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

unint64_t sub_2443DC1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_244407278();
  sub_244406DF8();
  v4 = sub_244407290();
  return sub_2443DC250(a1, a2, v4);
}

unint64_t sub_2443DC250(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_244407224() & 1) == 0)
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
      while (!v14 && (sub_244407224() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2443DC330(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2443DCFD4(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_2443DC398(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2443DC398(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  unint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  char v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t i;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  unint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *__dst;

  v2 = a1;
  v3 = a1[1];
  result = sub_2444071E8();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v78 = 0;
      v79 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v81 = *(_QWORD *)(v79 + 8 * i);
        v82 = v78;
        do
        {
          v83 = *(_QWORD *)(v79 + v82);
          if (v81 >= v83)
            break;
          if (!v79)
            goto LABEL_141;
          *(_QWORD *)(v79 + v82 + 8) = v83;
          *(_QWORD *)(v79 + v82) = v81;
          v82 -= 8;
        }
        while (v82 != -8);
        v78 += 8;
      }
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v95 = result;
  v96 = v3;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_103:
      v94 = v8;
      if (v12 >= 2)
      {
        v84 = *v2;
        do
        {
          v85 = v12 - 2;
          if (v12 < 2)
            goto LABEL_132;
          if (!v84)
            goto LABEL_145;
          v86 = v11;
          v87 = v11 + 32;
          v88 = *(_QWORD *)&v11[16 * v85 + 32];
          v89 = *(_QWORD *)&v11[16 * v12 + 24];
          sub_2443DCA20((char *)(v84 + 8 * v88), (char *)(v84 + 8 * *(_QWORD *)&v87[16 * v12 - 16]), v84 + 8 * v89, __dst);
          if (v1)
            break;
          if (v89 < v88)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v86 = sub_2443DCE2C((uint64_t)v86);
          if (v85 >= *((_QWORD *)v86 + 2))
            goto LABEL_134;
          v90 = &v86[16 * v85 + 32];
          *(_QWORD *)v90 = v88;
          *((_QWORD *)v90 + 1) = v89;
          v91 = *((_QWORD *)v86 + 2);
          if (v12 > v91)
            goto LABEL_135;
          memmove(&v86[16 * v12 + 16], &v86[16 * v12 + 32], 16 * (v91 - v12));
          v11 = v86;
          *((_QWORD *)v86 + 2) = v91 - 1;
          v12 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v94 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v94 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_244406EC4();
    *(_QWORD *)(v7 + 16) = v6;
    v3 = v96;
    v94 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *v2;
  v92 = v2;
  v93 = *v2 - 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v97 = *v2;
  while (1)
  {
    v13 = v9++;
    if (v9 < v3)
    {
      v14 = *(_QWORD *)(v10 + 8 * v9);
      v15 = *(_QWORD *)(v10 + 8 * v13);
      v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        v16 = v14;
        while (1)
        {
          v17 = *(_QWORD *)(v10 + 8 * v9);
          if (v14 < v15 == v17 >= v16)
            break;
          ++v9;
          v16 = v17;
          if (v3 == v9)
          {
            v9 = v3;
            break;
          }
        }
      }
      if (v14 < v15)
      {
        if (v9 < v13)
          goto LABEL_138;
        if (v13 < v9)
        {
          v18 = v9 - 1;
          v19 = v13;
          do
          {
            if (v19 != v18)
            {
              if (!v10)
                goto LABEL_144;
              v20 = *(_QWORD *)(v10 + 8 * v19);
              *(_QWORD *)(v10 + 8 * v19) = *(_QWORD *)(v10 + 8 * v18);
              *(_QWORD *)(v10 + 8 * v18) = v20;
            }
            v59 = ++v19 < v18--;
          }
          while (v59);
        }
      }
    }
    if (v9 >= v3)
      goto LABEL_47;
    if (__OFSUB__(v9, v13))
      goto LABEL_136;
    if (v9 - v13 >= v95)
      goto LABEL_47;
    v21 = v13 + v95;
    if (__OFADD__(v13, v95))
      goto LABEL_139;
    if (v21 >= v3)
      v21 = v3;
    if (v21 < v13)
      break;
    if (v9 != v21)
    {
      v22 = (uint64_t *)(v93 + 8 * v9);
      do
      {
        v23 = *(_QWORD *)(v10 + 8 * v9);
        v24 = v13;
        v25 = v22;
        do
        {
          v26 = *v25;
          if (v23 >= *v25)
            break;
          if (!v10)
            goto LABEL_142;
          *v25 = v23;
          v25[1] = v26;
          --v25;
          ++v24;
        }
        while (v9 != v24);
        ++v9;
        ++v22;
      }
      while (v9 != v21);
      v9 = v21;
    }
LABEL_47:
    if (v9 < v13)
      goto LABEL_131;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_2443DCC8C(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v28 = *((_QWORD *)v11 + 2);
    v27 = *((_QWORD *)v11 + 3);
    v12 = v28 + 1;
    v10 = v97;
    if (v28 >= v27 >> 1)
    {
      v77 = sub_2443DCC8C((char *)(v27 > 1), v28 + 1, 1, v11);
      v10 = v97;
      v11 = v77;
    }
    *((_QWORD *)v11 + 2) = v12;
    v29 = v11 + 32;
    v30 = &v11[16 * v28 + 32];
    *(_QWORD *)v30 = v13;
    *((_QWORD *)v30 + 1) = v9;
    if (v28)
    {
      while (1)
      {
        v31 = v12 - 1;
        if (v12 >= 4)
        {
          v36 = &v29[16 * v12];
          v37 = *((_QWORD *)v36 - 8);
          v38 = *((_QWORD *)v36 - 7);
          v42 = __OFSUB__(v38, v37);
          v39 = v38 - v37;
          if (v42)
            goto LABEL_120;
          v41 = *((_QWORD *)v36 - 6);
          v40 = *((_QWORD *)v36 - 5);
          v42 = __OFSUB__(v40, v41);
          v34 = v40 - v41;
          v35 = v42;
          if (v42)
            goto LABEL_121;
          v43 = v12 - 2;
          v44 = &v29[16 * v12 - 32];
          v46 = *(_QWORD *)v44;
          v45 = *((_QWORD *)v44 + 1);
          v42 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          if (v42)
            goto LABEL_123;
          v42 = __OFADD__(v34, v47);
          v48 = v34 + v47;
          if (v42)
            goto LABEL_126;
          if (v48 >= v39)
          {
            v66 = &v29[16 * v31];
            v68 = *(_QWORD *)v66;
            v67 = *((_QWORD *)v66 + 1);
            v42 = __OFSUB__(v67, v68);
            v69 = v67 - v68;
            if (v42)
              goto LABEL_130;
            v59 = v34 < v69;
            goto LABEL_84;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v60 = *((_QWORD *)v11 + 4);
            v61 = *((_QWORD *)v11 + 5);
            v42 = __OFSUB__(v61, v60);
            v53 = v61 - v60;
            v54 = v42;
            goto LABEL_78;
          }
          v33 = *((_QWORD *)v11 + 4);
          v32 = *((_QWORD *)v11 + 5);
          v42 = __OFSUB__(v32, v33);
          v34 = v32 - v33;
          v35 = v42;
        }
        if ((v35 & 1) != 0)
          goto LABEL_122;
        v43 = v12 - 2;
        v49 = &v29[16 * v12 - 32];
        v51 = *(_QWORD *)v49;
        v50 = *((_QWORD *)v49 + 1);
        v52 = __OFSUB__(v50, v51);
        v53 = v50 - v51;
        v54 = v52;
        if (v52)
          goto LABEL_125;
        v55 = &v29[16 * v31];
        v57 = *(_QWORD *)v55;
        v56 = *((_QWORD *)v55 + 1);
        v42 = __OFSUB__(v56, v57);
        v58 = v56 - v57;
        if (v42)
          goto LABEL_128;
        if (__OFADD__(v53, v58))
          goto LABEL_129;
        if (v53 + v58 >= v34)
        {
          v59 = v34 < v58;
LABEL_84:
          if (v59)
            v31 = v43;
          goto LABEL_86;
        }
LABEL_78:
        if ((v54 & 1) != 0)
          goto LABEL_124;
        v62 = &v29[16 * v31];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v42 = __OFSUB__(v63, v64);
        v65 = v63 - v64;
        if (v42)
          goto LABEL_127;
        if (v65 < v53)
          goto LABEL_15;
LABEL_86:
        v70 = v31 - 1;
        if (v31 - 1 >= v12)
        {
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
        v71 = &v29[16 * v70];
        v72 = *(_QWORD *)v71;
        v73 = v29;
        v74 = &v29[16 * v31];
        v75 = *((_QWORD *)v74 + 1);
        sub_2443DCA20((char *)(v10 + 8 * *(_QWORD *)v71), (char *)(v10 + 8 * *(_QWORD *)v74), v10 + 8 * v75, __dst);
        if (v1)
          goto LABEL_114;
        if (v75 < v72)
          goto LABEL_117;
        if (v31 > *((_QWORD *)v11 + 2))
          goto LABEL_118;
        *(_QWORD *)v71 = v72;
        *(_QWORD *)&v73[16 * v70 + 8] = v75;
        v76 = *((_QWORD *)v11 + 2);
        if (v31 >= v76)
          goto LABEL_119;
        v12 = v76 - 1;
        memmove(v74, v74 + 16, 16 * (v76 - 1 - v31));
        v29 = v73;
        *((_QWORD *)v11 + 2) = v76 - 1;
        v10 = v97;
        if (v76 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v96;
    if (v9 >= v96)
    {
      v8 = v94;
      v2 = v92;
      goto LABEL_103;
    }
  }
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
  result = sub_2444070EC();
  __break(1u);
  return result;
}

uint64_t sub_2443DCA20(char *__src, char *a2, unint64_t a3, char *__dst)
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
  uint64_t v20;
  uint64_t result;
  char *v22;
  char *v23;
  char *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[8 * v13] <= __dst)
        memmove(__dst, a2, 8 * v13);
      v16 = &v4[8 * v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        v17 = (char *)(a3 - 8);
        while (1)
        {
          v18 = v17 + 8;
          v19 = v6 - 8;
          v20 = *((_QWORD *)v6 - 1);
          if (*((_QWORD *)v16 - 1) >= v20)
          {
            v22 = v16 - 8;
            if (v18 < v16 || v17 >= v16 || v18 != v16)
              *(_QWORD *)v17 = *((_QWORD *)v16 - 1);
            v16 -= 8;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v18 != v6 || v17 >= v6)
              *(_QWORD *)v17 = v20;
            v24 = v6 - 8;
            v6 -= 8;
            if (v19 <= v7)
              goto LABEL_42;
          }
          v17 -= 8;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst)
      memmove(__dst, __src, 8 * v10);
    v14 = &v4[8 * v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*(_QWORD *)v6 >= *(_QWORD *)v4)
        {
          if (v7 != v4)
            *(_QWORD *)v7 = *(_QWORD *)v4;
          v4 += 8;
          v23 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 8;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *(_QWORD *)v7 = *(_QWORD *)v6;
        }
        v7 += 8;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_2443DCD84((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_244407134();
  __break(1u);
  return result;
}

char *sub_2443DCC8C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDF0);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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

char *sub_2443DCD84(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_244407134();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_2443DCE2C(uint64_t a1)
{
  return sub_2443DCC8C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_2443DCE40(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
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

uint64_t sub_2443DCFD4(uint64_t a1)
{
  return sub_2443F7F40(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2443DCFE8(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  int64_t v2;
  uint64_t v3;
  _QWORD *v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_2443F7DBC(0, v2, 0);
    v3 = v11;
    v6 = (_QWORD *)(a1 + 40);
    do
    {
      v7 = a2(*(v6 - 1), *v6);
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        sub_2443F7DBC(v8 > 1, v9 + 1, 1);
      v6 += 2;
      *(_QWORD *)(v11 + 16) = v9 + 1;
      *(_BYTE *)(v11 + v9 + 32) = v7 & 1;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_2443DD0D4(uint64_t a1, char a2)
{
  uint64_t v2;
  int64_t v4;
  char *v5;
  int v6;
  char v7;
  char v8;
  char v9;
  uint64_t v10;
  int v12;
  _DWORD *v13;

  if (qword_25735DB58 != -1)
    swift_once();
  v4 = *((_QWORD *)off_25735E290 + 2);
  v5 = (char *)swift_slowAlloc();
  if ((a2 & 1) != 0)
  {
    v6 = sub_244406D68();
    if ((v7 & 1) != 0)
      goto LABEL_10;
  }
  else
  {
    v6 = sub_244406D68();
    if ((v8 & 1) != 0)
    {
LABEL_10:
      v12 = v6;
      sub_2443DAC74();
      swift_willThrowTypedImpl();
      swift_allocError();
      *v13 = v12;
      return MEMORY[0x24950E6FC](v5, -1, -1);
    }
  }
  v6 = sub_244406D5C();
  if (!v2)
  {
    if ((v9 & 1) == 0)
    {
      v10 = sub_2443F5E9C(v5, v4);
      MEMORY[0x24950E6FC](v5, -1, -1);
      return v10;
    }
    goto LABEL_10;
  }
  return MEMORY[0x24950E6FC](v5, -1, -1);
}

uint64_t sub_2443DD274()
{
  uint64_t v0;
  unsigned int *v1;
  int v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  int v11;
  _DWORD *v12;

  v1 = (unsigned int *)swift_slowAlloc();
  v2 = sub_244406D68();
  if ((v3 & 1) != 0)
    goto LABEL_10;
  v2 = sub_244406D5C();
  if (v0)
    return MEMORY[0x24950E6FC](v1, -1, -1);
  if ((v4 & 1) != 0)
  {
LABEL_10:
    v11 = v2;
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    swift_allocError();
    *v12 = v11;
    return MEMORY[0x24950E6FC](v1, -1, -1);
  }
  v5 = *v1;
  if (v5 >> 25)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v6 = sub_244406D38();
    __swift_project_value_buffer(v6, (uint64_t)qword_2573610D0);
    v7 = sub_244406D20();
    v8 = sub_244406FB4();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v9 = 134217984;
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v7, v8, "Invalid metadataSize: %ld", v9, 0xCu);
      MEMORY[0x24950E6FC](v9, -1, -1);
    }

    MEMORY[0x24950E6FC](v1, -1, -1);
    return 0;
  }
  else
  {
    MEMORY[0x24950E6FC](v1, -1, -1);
    return v5;
  }
}

unint64_t sub_2443DD48C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25735DC38;
  if (!qword_25735DC38)
  {
    v1 = sub_244406DA4();
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE60F8], v1);
    atomic_store(result, (unint64_t *)&qword_25735DC38);
  }
  return result;
}

uint64_t sub_2443DD4D4(uint64_t a1, uint64_t a2)
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

unint64_t sub_2443DD510()
{
  unint64_t result;

  result = qword_25735DC40;
  if (!qword_25735DC40)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for FileMetadata, &type metadata for FileMetadata);
    atomic_store(result, (unint64_t *)&qword_25735DC40);
  }
  return result;
}

uint64_t sub_2443DD554(uint64_t a1, unint64_t a2)
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

uint64_t sub_2443DD598(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
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

uint64_t sub_2443DD658(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_244406F48();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2443DB228(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2443DD6EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_244406F48();
  v7 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_2443DB3D4(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

_QWORD *sub_2443DD75C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(a2 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  swift_bridgeObjectRetain();
  v5 = 0;
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v7 = *(_QWORD *)(a1 + 8 * v5 + 32);
    if ((v7 & 0x8000000000000000) == 0 && v7 < *(_QWORD *)(v4 + 16))
    {
      v8 = *(_QWORD *)(v4 + 32 + 40 * v7 + 32);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_2443E2184(0, v6[2] + 1, 1, v6);
      v10 = v6[2];
      v9 = v6[3];
      if (v10 >= v9 >> 1)
        v6 = sub_2443E2184((_QWORD *)(v9 > 1), v10 + 1, 1, v6);
      v6[2] = v10 + 1;
      v6[v10 + 4] = v8;
    }
    ++v5;
  }
  while (v2 != v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2443DD880(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = 0;
  if ((a1 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
    if (*(_QWORD *)(v5 + 16) > a1)
    {
      result = 0;
      if ((a2 & 0x8000000000000000) == 0)
      {
        v6 = *(_QWORD *)(v5 + 40 * a1 + 40);
        if (*(_QWORD *)(v6 + 16) > a2)
          return *(unsigned __int8 *)(v6 + (a2 << 6) + 64);
      }
    }
  }
  return result;
}

uint64_t sub_2443DD8D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2443D8650();
  *a1 = result;
  return result;
}

uint64_t sub_2443DD8FC(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___fieldSet);
}

uint64_t sub_2443DD908@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2443D8788();
  *a1 = result;
  return result;
}

uint64_t sub_2443DD930(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___elementByName);
}

uint64_t sub_2443DD93C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2443D8A88();
  *a1 = result;
  return result;
}

uint64_t sub_2443DD964(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___chunksByElement);
}

uint64_t sub_2443DD970@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2443D8E88();
  *a1 = result;
  return result;
}

uint64_t sub_2443DD998(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC6Planks12PlanksReader____lazy_storage___groupsByElement);
}

uint64_t keypath_setTm(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *(_QWORD *)(*a2 + *a5) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443DD9D8()
{
  return type metadata accessor for PlanksReader();
}

uint64_t sub_2443DD9E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244406DA4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for PlanksReader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PlanksReader.__allocating_init(filePath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of PlanksReader.fieldSet.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PlanksReader.fieldSet.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PlanksReader.fieldSet.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of PlanksReader.elementByName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of PlanksReader.elementByName.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of PlanksReader.elementByName.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of PlanksReader.chunksByElement.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of PlanksReader.chunksByElement.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of PlanksReader.chunksByElement.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of PlanksReader.groupsByElement.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of PlanksReader.groupsByElement.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of PlanksReader.groupsByElement.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of PlanksReader.close()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of PlanksReader.totalRowGroupsCount(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of PlanksReader.totalRowsCount(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of PlanksReader.batchSizes(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of PlanksReader.batchCount(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of PlanksReader.isEncoded(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of PlanksReader.isCompressed(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of PlanksReader.fieldType(for:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t sub_2443DDB88()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2443DDBAC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_2443DDBD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25735DDE0;
  if (!qword_25735DDE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25735DDD8);
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25735DDE0);
  }
  return result;
}

uint64_t sub_2443DDC20(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2443DDC84()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2443DDCA8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2443DDCD0()
{
  return swift_release();
}

uint64_t sub_2443DDCD8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_2443DDCE8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

uint64_t sub_2443DDD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t ScalarType.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v8;

  v1 = v0;
  v2 = sub_244406C3C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE6B870])
    return 947154537;
  if (v6 == *MEMORY[0x24BE6B878])
    return 0x3631746E69;
  if (v6 == *MEMORY[0x24BE6B880])
    return 0x3233746E69;
  if (v6 == *MEMORY[0x24BE6B888])
    return 0x3436746E69;
  if (v6 == *MEMORY[0x24BE6B890])
    return 0x38746E6975;
  if (v6 == *MEMORY[0x24BE6B898])
    return 0x3631746E6975;
  if (v6 == *MEMORY[0x24BE6B8A0])
    return 0x3233746E6975;
  if (v6 == *MEMORY[0x24BE6B8A8])
    return 0x3436746E6975;
  if (v6 == *MEMORY[0x24BE6B8B0])
    return 0x363174616F6C66;
  if (v6 == *MEMORY[0x24BE6B8C8])
    return 0x363174616F6C6662;
  if (v6 == *MEMORY[0x24BE6B8B8])
    return 0x323374616F6C66;
  if (v6 == *MEMORY[0x24BE6B8C0])
    return 0x343674616F6C66;
  if (v6 == *MEMORY[0x24BE6B868])
    return 1819242338;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return 0x6E776F6E6B6E75;
}

uint64_t ScalarType.init(fieldType:)@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_244406C3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, **((unsigned int **)&unk_2514FD390 + *a1), v4);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t FieldType.init(scalarType:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v7;

  v4 = sub_244406C3C();
  v5 = *(_QWORD *)(v4 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 88))(a1, v4);
  if ((_DWORD)result == *MEMORY[0x24BE6B870])
  {
    v7 = 0;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B878])
  {
    v7 = 1;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B880])
  {
    v7 = 2;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B888])
  {
    v7 = 3;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B890])
  {
    v7 = 4;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B898])
  {
    v7 = 5;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B8A0])
  {
    v7 = 6;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B8A8])
  {
    v7 = 7;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B8B0])
  {
    v7 = 8;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B8B8])
  {
    v7 = 9;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B8C0])
  {
    v7 = 10;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE6B868])
  {
    v7 = 11;
  }
  else
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
    v7 = 12;
  }
  *a2 = v7;
  return result;
}

uint64_t Array<A>.median()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  uint64_t result;
  uint64_t v16;
  double v17;

  v4 = *(_QWORD *)(a2 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v16 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v12 = MEMORY[0x24950E018](v11);
  if (v12 < 1)
  {
    *(double *)&result = 0.0;
  }
  else
  {
    v17 = *(double *)&a1;
    v13 = sub_244406F0C();
    MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v13);
    sub_244406E58();
    sub_244406F18();
    if ((v12 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      sub_2443DE4B0();
      sub_244406DBC();
      *(double *)&result = v17;
    }
    else
    {
      sub_244406F18();
      swift_bridgeObjectRelease();
      sub_2444070F8();
      v14 = *(void (**)(char *, uint64_t))(v4 + 8);
      v14(v7, a2);
      v14(v10, a2);
      sub_2443DE4B0();
      sub_244406DBC();
      *(double *)&result = v17 * 0.5;
    }
  }
  return result;
}

unint64_t sub_2443DE4B0()
{
  unint64_t result;

  result = qword_25735DE10;
  if (!qword_25735DE10)
  {
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_25735DE10);
  }
  return result;
}

uint64_t Array<A>.mean()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v8;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v2 = MEMORY[0x24950E018](v1);
  v3 = v2 - 1;
  if (v2 < 1)
    return 0;
  v4 = 0.0;
  v5 = 1;
  while (1)
  {
    sub_244406F18();
    sub_2443DE4B0();
    sub_244406DBC();
    v4 = v4 + (v8 - v4) / (double)v5;
    if (!v3)
      break;
    --v3;
    if (__OFADD__(v5++, 1))
    {
      __break(1u);
      return *(_QWORD *)&v4;
    }
  }
  return *(_QWORD *)&v4;
}

uint64_t Array<A>.stddev()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  char v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  double v21;

  v4 = *(_QWORD *)(a2 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - v8;
  v10 = MEMORY[0x24950E018](v7);
  if (v10 < 2)
  {
LABEL_13:
    v12 = 0.0;
    return *(_QWORD *)&v12;
  }
  v11 = v10;
  v12 = COERCE_DOUBLE(Array<A>.mean()(a1));
  if ((v13 & 1) != 0)
    return *(_QWORD *)&v12;
  v14 = swift_bridgeObjectRetain();
  if (!MEMORY[0x24950E030](v14, a2))
  {
    swift_bridgeObjectRelease();
    v16 = 0.0;
LABEL_16:
    v12 = sqrt(v16 / (double)v11);
    return *(_QWORD *)&v12;
  }
  v20 = v11;
  v15 = 0;
  v16 = 0.0;
  while (1)
  {
    v17 = sub_244406EDC();
    sub_244406E88();
    if ((v17 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v9, a1+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v15, a2);
      v18 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_12;
      goto LABEL_7;
    }
    result = sub_244407074();
    if (v5 != 8)
      break;
    v21 = *(double *)&result;
    (*(void (**)(char *, double *, uint64_t))(v4 + 16))(v9, &v21, a2);
    swift_unknownObjectRelease();
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
LABEL_7:
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v9, a2);
    sub_2443DE4B0();
    sub_244406DBC();
    v16 = v16 + (v21 - v12) * (v21 - v12);
    ++v15;
    if (v18 == MEMORY[0x24950E030](a1, a2))
    {
      swift_bridgeObjectRelease();
      v11 = v20;
      goto LABEL_16;
    }
  }
  __break(1u);
  return result;
}

uint64_t PlanksWriter.writeBatch(_:label:as:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char v49;
  void (*v50)(uint64_t, uint64_t);
  char v51;
  uint64_t v52;
  char *v53;
  NSObject *v54;
  os_log_type_t v55;
  int v56;
  _BOOL4 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  os_log_t v65;
  uint64_t v66;
  uint64_t v67;
  os_log_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  int v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v96;
  void (*v97)(uint64_t, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  uint64_t v111;
  char v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  __int16 v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  char isUniquelyReferenced_nonNull_native;
  char *v130;
  unint64_t v131;
  unint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _QWORD *v135;
  uint64_t v136;
  _QWORD *v137;
  char v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSObject *v142;
  os_log_type_t v143;
  uint8_t *v144;
  uint64_t v145;
  _QWORD *v146;
  char v147;
  uint64_t v148;
  unint64_t v149;
  unint64_t v150;
  _QWORD *v151;
  uint64_t v152;
  NSObject *v153;
  os_log_type_t v154;
  _BOOL4 v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  unint64_t v163;
  uint64_t v164;
  _QWORD v165[2];
  int v166;
  void (*v167)(char *, uint64_t);
  uint64_t (*v168)(char *, uint64_t, uint64_t);
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  os_log_t v172;
  char *v173;
  char *v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185[2];
  char v186;
  uint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  unint64_t v192;
  uint64_t v193;
  uint64_t v194;
  __int16 v195;
  uint64_t v196;

  v181 = (char *)a4;
  v182 = a3;
  v177 = a2;
  v171 = sub_24440720C();
  v170 = *(_QWORD *)(v171 - 8);
  MEMORY[0x24BDAC7A8](v171);
  v174 = (char *)v165 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v165 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244406C3C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v173 = (char *)v165 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v172 = (os_log_t)((char *)v165 - v14);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v165 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v165 - v18;
  v180 = sub_244406C48();
  v178 = *(_QWORD *)(v180 - 8);
  MEMORY[0x24BDAC7A8](v180);
  v179 = (uint64_t)v165 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_244406D14();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x24BDAC7A8](v21);
  v176 = (char *)v165 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)v165 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v165 - v28;
  if (sub_244406CD8() != 2)
  {
    v36 = v21;
    if (qword_25735DB50 != -1)
      swift_once();
    v37 = sub_244406D38();
    __swift_project_value_buffer(v37, (uint64_t)qword_2573610D0);
    v38 = v22;
    (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v29, a1, v36);
    v39 = sub_244406D20();
    v40 = sub_244406FB4();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v188 = (char *)v42;
      v184 = v36;
      *(_DWORD *)v41 = 136315138;
      v183 = v38;
      v182 = (uint64_t)(v41 + 4);
      v43 = v179;
      sub_244406CF0();
      sub_2443E2B34(&qword_25735DE20, (uint64_t (*)(uint64_t))MEMORY[0x24BE6B8F8], MEMORY[0x24BE6B918]);
      v44 = v180;
      v45 = sub_2444071F4();
      v47 = v46;
      (*(void (**)(uint64_t, uint64_t))(v178 + 8))(v43, v44);
      v185[0] = sub_2443DABA4(v45, v47, (uint64_t *)&v188);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v183 + 8))(v29, v184);
      _os_log_impl(&dword_2443D2000, v39, v40, "Invalid tensor shape: %s. Only 2D tensors supported.", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v42, -1, -1);
      MEMORY[0x24950E6FC](v41, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v22 + 8))(v29, v36);
    }

    return 0;
  }
  v183 = v22;
  v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 16);
  v184 = v21;
  v168 = v30;
  v30(v27, a1, v21);
  sub_2443E27E0((uint64_t)v181, (uint64_t)v8);
  v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  v32 = v9;
  v169 = v10;
  if (v31 == 1)
  {
    sub_2443E2828((uint64_t)v8);
    v33 = (uint64_t)v27;
    v34 = v182;
    v35 = (uint64_t)v17;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v19, v8, v9);
    v35 = (uint64_t)v17;
    v48 = v19;
    sub_244406C90();
    sub_2443E2B34(&qword_25735DE38, (uint64_t (*)(uint64_t))MEMORY[0x24BE6B8D0], MEMORY[0x24BE6B8E0]);
    v49 = sub_244406DEC();
    v50 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v50(v35, v32);
    v33 = (uint64_t)v27;
    if ((v49 & 1) != 0)
    {
      v50((uint64_t)v19, v32);
      v34 = v182;
    }
    else
    {
      sub_244406C90();
      v51 = sub_244406C30();
      v50(v35, v32);
      if ((v51 & 1) == 0)
      {
        v181 = v27;
        if (qword_25735DB50 != -1)
          swift_once();
        v67 = sub_244406D38();
        __swift_project_value_buffer(v67, (uint64_t)qword_2573610D0);
        v68 = v172;
        (*(void (**)(os_log_t, char *, uint64_t))(v169 + 16))(v172, v19, v32);
        v69 = sub_244406D20();
        v70 = sub_244406FB4();
        if (os_log_type_enabled(v69, v70))
        {
          v71 = v32;
          v72 = swift_slowAlloc();
          v73 = swift_slowAlloc();
          v182 = (uint64_t)v48;
          v180 = v73;
          v185[0] = v73;
          *(_DWORD *)v72 = 136315394;
          v74 = ScalarType.description.getter();
          v188 = (char *)sub_2443DABA4(v74, v75, v185);
          sub_244406FE4();
          swift_bridgeObjectRelease();
          v50((uint64_t)v68, v71);
          *(_WORD *)(v72 + 12) = 2080;
          v76 = (uint64_t)v181;
          swift_beginAccess();
          sub_244406C90();
          v77 = ScalarType.description.getter();
          v79 = v78;
          v50(v35, v71);
          v196 = sub_2443DABA4(v77, v79, v185);
          sub_244406FE4();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2443D2000, v69, v70, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v72, 0x16u);
          v80 = v180;
          swift_arrayDestroy();
          MEMORY[0x24950E6FC](v80, -1, -1);
          MEMORY[0x24950E6FC](v72, -1, -1);

          v50(v182, v71);
          (*(void (**)(uint64_t, uint64_t))(v183 + 8))(v76, v184);
          return 0;
        }

        v50((uint64_t)v68, v32);
        v50((uint64_t)v19, v32);
LABEL_60:
        (*(void (**)(char *, uint64_t))(v183 + 8))(v181, v184);
        return 0;
      }
      if (qword_25735DB50 != -1)
        swift_once();
      v52 = sub_244406D38();
      __swift_project_value_buffer(v52, (uint64_t)qword_2573610D0);
      v53 = v173;
      (*(void (**)(char *, char *, uint64_t))(v169 + 16))(v173, v19, v32);
      v54 = sub_244406D20();
      v55 = sub_244406FA8();
      v56 = v55;
      v57 = os_log_type_enabled(v54, v55);
      v167 = (void (*)(char *, uint64_t))v50;
      if (v57)
      {
        v58 = swift_slowAlloc();
        v172 = v54;
        v59 = v58;
        v181 = (char *)swift_slowAlloc();
        v188 = v181;
        *(_DWORD *)v59 = 136315394;
        v165[1] = v59 + 4;
        swift_beginAccess();
        v166 = v56;
        sub_244406C90();
        v60 = ScalarType.description.getter();
        v62 = v61;
        v50(v35, v32);
        v185[0] = sub_2443DABA4(v60, v62, (uint64_t *)&v188);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v59 + 12) = 2080;
        v63 = ScalarType.description.getter();
        v185[0] = sub_2443DABA4(v63, v64, (uint64_t *)&v188);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        v50((uint64_t)v53, v32);
        v65 = v172;
        _os_log_impl(&dword_2443D2000, v172, (os_log_type_t)v166, "Casting tensor of type %s to type %s.", (uint8_t *)v59, 0x16u);
        v66 = (uint64_t)v181;
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v66, -1, -1);
        MEMORY[0x24950E6FC](v59, -1, -1);

      }
      else
      {
        v50((uint64_t)v53, v32);

      }
      v34 = v182;
      v81 = v171;
      v82 = v170;
      swift_beginAccess();
      v83 = v174;
      (*(void (**)(char *, _QWORD, uint64_t))(v82 + 104))(v174, *MEMORY[0x24BEE38B8], v81);
      v84 = v176;
      sub_244406CCC();
      (*(void (**)(char *, uint64_t))(v82 + 8))(v83, v81);
      v167(v48, v32);
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v183 + 40))(v33, v84, v184);
    }
  }
  swift_beginAccess();
  sub_244406C90();
  FieldType.init(scalarType:)(v35, (char *)&v188);
  v85 = v188;
  if (v188 == 12)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v86 = sub_244406D38();
    __swift_project_value_buffer(v86, (uint64_t)qword_2573610D0);
    v87 = sub_244406D20();
    v88 = sub_244406FB4();
    if (os_log_type_enabled(v87, v88))
    {
      v89 = v32;
      v90 = (uint8_t *)swift_slowAlloc();
      v91 = swift_slowAlloc();
      v188 = (char *)v91;
      *(_DWORD *)v90 = 136315138;
      v182 = (uint64_t)(v90 + 4);
      sub_244406C90();
      v92 = ScalarType.description.getter();
      v94 = v93;
      (*(void (**)(uint64_t, uint64_t))(v169 + 8))(v35, v89);
      v185[0] = sub_2443DABA4(v92, v94, (uint64_t *)&v188);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2443D2000, v87, v88, "Invalid FieldType for tensor: %s", v90, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v91, -1, -1);
      MEMORY[0x24950E6FC](v90, -1, -1);
    }

    (*(void (**)(uint64_t, uint64_t))(v183 + 8))(v33, v184);
    return 0;
  }
  v96 = v179;
  sub_244406CF0();
  v174 = (char *)sub_244406C60();
  v97 = *(void (**)(uint64_t, uint64_t))(v178 + 8);
  v98 = v180;
  v97(v96, v180);
  sub_244406CF0();
  v178 = sub_244406C60();
  v97(v96, v98);
  swift_bridgeObjectRetain();
  v99 = v175;
  v100 = sub_2443F3DE4();
  if (*(_QWORD *)(v100 + 16))
  {
    swift_bridgeObjectRetain();
    v101 = v177;
    v102 = sub_2443DC1EC(v177, v34);
    v103 = v184;
    if ((v104 & 1) != 0)
    {
      v105 = *(_QWORD *)(v100 + 56) + 32 * v102;
      v106 = v85;
      v108 = *(_QWORD *)v105;
      v107 = *(_QWORD *)(v105 + 8);
      v109 = *(_BYTE *)(v105 + 16);
      v110 = *(_QWORD *)(v105 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v179 = v108;
      v188 = (char *)v108;
      v189 = v107;
      v111 = v110;
      v112 = v109;
      LOBYTE(v190) = v109;
      v191 = v111;
      v185[0] = v101;
      v185[1] = v34;
      LODWORD(v180) = v106;
      v186 = v106;
      v187 = v178;
      if (_s6Planks13SchemaElementV2eeoiySbAC_ACtFZ_0(&v188, v185))
      {
        swift_bridgeObjectRelease();
        v101 = v177;
        v85 = v180;
        v103 = v184;
        goto LABEL_36;
      }
      if (qword_25735DB50 != -1)
        swift_once();
      v152 = sub_244406D38();
      __swift_project_value_buffer(v152, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v153 = sub_244406D20();
      v154 = sub_244406FB4();
      v155 = os_log_type_enabled(v153, v154);
      v156 = v184;
      if (!v155)
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v183 + 8))(v33, v156);
        return 0;
      }
      v157 = swift_slowAlloc();
      v182 = swift_slowAlloc();
      v188 = (char *)v182;
      *(_DWORD *)v157 = 136315650;
      swift_bridgeObjectRetain();
      v185[0] = sub_2443DABA4(v177, v34, (uint64_t *)&v188);
      v181 = (char *)v33;
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v157 + 12) = 2080;
      swift_bridgeObjectRetain();
      v158 = sub_2443DA7D0(v179, v107, v112, v111);
      v160 = v159;
      swift_bridgeObjectRelease();
      v185[0] = sub_2443DABA4(v158, v160, (uint64_t *)&v188);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v157 + 22) = 2080;
      swift_bridgeObjectRetain();
      v161 = sub_2443DA7D0(v177, v34, v180, v178);
      v163 = v162;
      swift_bridgeObjectRelease();
      v185[0] = sub_2443DABA4(v161, v163, (uint64_t *)&v188);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2443D2000, v153, v154, "Invalid batch label: %s with existing schema: %s vs %s", (uint8_t *)v157, 0x20u);
      v164 = v182;
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v164, -1, -1);
      MEMORY[0x24950E6FC](v157, -1, -1);

      goto LABEL_60;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v103 = v184;
    v101 = v177;
  }
LABEL_36:
  v113 = v176;
  v114 = v168(v176, v33, v103);
  MEMORY[0x24BDAC7A8](v114);
  v165[-4] = v99;
  v165[-3] = v101;
  v165[-2] = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE28);
  sub_244406CB4();
  v183 = *(_QWORD *)(v183 + 8);
  ((void (*)(char *, uint64_t))v183)(v113, v103);
  v115 = v189;
  if (!v189)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v141 = sub_244406D38();
    __swift_project_value_buffer(v141, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v142 = sub_244406D20();
    v143 = sub_244406FB4();
    if (os_log_type_enabled(v142, v143))
    {
      v144 = (uint8_t *)swift_slowAlloc();
      v145 = swift_slowAlloc();
      v188 = (char *)v145;
      *(_DWORD *)v144 = 136315138;
      swift_bridgeObjectRetain();
      v185[0] = sub_2443DABA4(v101, v34, (uint64_t *)&v188);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v142, v143, "Failed at writing batch: %s", v144, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v145, -1, -1);
      MEMORY[0x24950E6FC](v144, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    ((void (*)(uint64_t, uint64_t))v183)(v33, v103);
    return 0;
  }
  v179 = 0;
  LODWORD(v180) = v85;
  v181 = (char *)v33;
  v116 = v195;
  v118 = v193;
  v117 = v194;
  v119 = v191;
  v120 = v192;
  v121 = v190;
  v122 = (uint64_t)v188;
  v123 = v192 >> 8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE30);
  v124 = swift_allocObject();
  v125 = v99;
  v126 = v124;
  *(_OWORD *)(v124 + 16) = xmmword_244407690;
  *(_QWORD *)(v124 + 32) = v122;
  *(_QWORD *)(v124 + 40) = v115;
  *(_QWORD *)(v124 + 48) = v121;
  *(_QWORD *)(v124 + 56) = v119;
  *(_BYTE *)(v124 + 64) = v120 & 1;
  *(_BYTE *)(v124 + 65) = v123;
  *(_QWORD *)(v124 + 72) = v118;
  *(_QWORD *)(v124 + 80) = v117;
  *(_WORD *)(v124 + 88) = v116;
  v127 = v125 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v128 = *(_QWORD **)(v127 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v127 + 16) = v128;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v128 = sub_2443E25B4(0, v128[2] + 1, 1, v128);
    *(_QWORD *)(v127 + 16) = v128;
  }
  v130 = v174;
  v132 = v128[2];
  v131 = v128[3];
  v133 = (uint64_t)v181;
  v134 = v182;
  if (v132 >= v131 >> 1)
  {
    v128 = sub_2443E25B4((_QWORD *)(v131 > 1), v132 + 1, 1, v128);
    *(_QWORD *)(v127 + 16) = v128;
  }
  v128[2] = v132 + 1;
  v135 = &v128[5 * v132];
  *((_BYTE *)v135 + 32) = 1;
  v135[5] = v126;
  v135[6] = v121;
  v135[7] = v119;
  v135[8] = v130;
  swift_endAccess();
  v136 = *(_QWORD *)(v127 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v137 = (_QWORD *)sub_2443D5B8C(v136);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v138 = sub_2443D57F8(v177, v134, v137);
  swift_bridgeObjectRelease();
  if ((v138 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v139 = v133;
    v140 = v184;
  }
  else
  {
    swift_beginAccess();
    v146 = *(_QWORD **)(v127 + 8);
    v147 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v127 + 8) = v146;
    v148 = v184;
    if ((v147 & 1) == 0)
    {
      v146 = sub_2443E24A8(0, v146[2] + 1, 1, v146);
      *(_QWORD *)(v127 + 8) = v146;
    }
    v150 = v146[2];
    v149 = v146[3];
    if (v150 >= v149 >> 1)
    {
      v146 = sub_2443E24A8((_QWORD *)(v149 > 1), v150 + 1, 1, v146);
      *(_QWORD *)(v127 + 8) = v146;
    }
    v146[2] = v150 + 1;
    v151 = &v146[4 * v150];
    v151[4] = v177;
    v151[5] = v134;
    *((_BYTE *)v151 + 48) = v180;
    v151[7] = v178;
    swift_endAccess();
    v139 = v133;
    v140 = v148;
  }
  ((void (*)(uint64_t, uint64_t))v183)(v139, v140);
  return 1;
}

uint64_t PlanksWriter.writeTensor(_:label:as:batchSize:)(uint64_t a1, uint64_t a2, uint8_t *a3, void (*a4)(char *, uint64_t), uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint8_t *v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  uint8_t *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  char *v66;
  char *v67;
  char *v68;
  void (*v69)(char *, uint64_t);
  char v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  void (*v74)(char *, char *, uint64_t);
  char *v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  void (*v83)(char *, uint64_t);
  char *v84;
  uint64_t v85;
  unint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSObject *v92;
  uint64_t v93;
  os_log_type_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  void (*v109)(char *, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  BOOL v113;
  _BOOL4 v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  NSObject *v120;
  os_log_type_t v121;
  _BOOL4 v122;
  char *v123;
  uint64_t v124;
  uint8_t *v125;
  void (*v126)(uint64_t, char *);
  _QWORD v127[2];
  uint64_t v128;
  char *v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  NSObject *v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  void (*v140)(char *, uint64_t);
  uint64_t v141;
  uint64_t v142;
  char *v143;
  __int128 v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *v151;
  char *v152;
  uint8_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;

  v6 = v5;
  v139 = a5;
  v140 = a4;
  v132 = sub_24440720C();
  v131 = *(_QWORD *)(v132 - 8);
  MEMORY[0x24BDAC7A8](v132);
  v130 = (char *)v127 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = sub_244406D38();
  v137 = *(_QWORD *)(v142 - 8);
  v11 = MEMORY[0x24BDAC7A8](v142);
  v134 = (char *)v127 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v136 = ((char *)v127 - v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v151 = (char *)v127 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v127 - v17;
  v19 = sub_244406C3C();
  v154 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v133 = (char *)v127 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v135 = (char *)v127 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v146 = (char *)v127 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v138 = (char *)v127 - v26;
  *(_QWORD *)&v144 = sub_244406C48();
  v141 = *(_QWORD *)(v144 - 8);
  MEMORY[0x24BDAC7A8](v144);
  v143 = (char *)v127 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_244406D14();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v152 = (char *)v127 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v129 = (char *)v127 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v36 = (char *)v127 - v35;
  MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)v127 - v37;
  if (sub_244406CD8() != 2)
  {
    if (qword_25735DB50 != -1)
LABEL_73:
      swift_once();
    __swift_project_value_buffer(v142, (uint64_t)qword_2573610D0);
    (*(void (**)(char *, uint64_t, unint64_t))(v29 + 16))(v38, a1, v28);
    v46 = sub_244406D20();
    v51 = sub_244406FB4();
    if (!os_log_type_enabled(v46, v51))
    {
      (*(void (**)(char *, unint64_t))(v29 + 8))(v38, v28);
      goto LABEL_14;
    }
    v52 = (uint8_t *)swift_slowAlloc();
    v154 = swift_slowAlloc();
    v159 = v154;
    *(_DWORD *)v52 = 136315138;
    v152 = (char *)(v52 + 4);
    v153 = v52;
    v53 = v143;
    sub_244406CF0();
    sub_2443E2B34(&qword_25735DE20, (uint64_t (*)(uint64_t))MEMORY[0x24BE6B8F8], MEMORY[0x24BE6B918]);
    v54 = v144;
    v55 = sub_2444071F4();
    v56 = v28;
    v58 = v57;
    (*(void (**)(char *, uint64_t))(v141 + 8))(v53, v54);
    v158 = sub_2443DABA4(v55, v58, &v159);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, unint64_t))(v29 + 8))(v38, v56);
    v48 = v153;
    _os_log_impl(&dword_2443D2000, v46, v51, "Invalid tensor shape: %s. Only 2D tensors supported.", v153, 0xCu);
    v59 = v154;
    swift_arrayDestroy();
    v50 = v59;
LABEL_10:
    MEMORY[0x24950E6FC](v50, -1, -1);
    MEMORY[0x24950E6FC](v48, -1, -1);
LABEL_14:

    return 0;
  }
  v149 = v19;
  v150 = v36;
  v148 = v6;
  v39 = v6 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v153 = a3;
  v40 = *(_QWORD *)(v39 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v41 = (_QWORD *)sub_2443D5B8C(v40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42 = v153;
  swift_bridgeObjectRelease_n();
  v43 = sub_2443D57F8(a2, (uint64_t)v42, v41);
  swift_bridgeObjectRelease();
  v44 = a2;
  if ((v43 & 1) != 0)
  {
    v45 = v142;
    if (qword_25735DB50 != -1)
      swift_once();
    __swift_project_value_buffer(v45, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v46 = sub_244406D20();
    v47 = sub_244406FB4();
    if (!os_log_type_enabled(v46, v47))
    {

      swift_bridgeObjectRelease_n();
      return 0;
    }
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v158 = v49;
    *(_DWORD *)v48 = 136315138;
    swift_bridgeObjectRetain();
    v156 = sub_2443DABA4(v44, (unint64_t)v42, &v158);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v46, v47, "Invalid tensor label: %s", v48, 0xCu);
    swift_arrayDestroy();
    v50 = v49;
    goto LABEL_10;
  }
  v145 = a2;
  v60 = v150;
  (*(void (**)(char *, uint64_t, unint64_t))(v29 + 16))(v150, a1, v28);
  sub_2443E27E0((uint64_t)v140, (uint64_t)v18);
  v61 = v154;
  v62 = v149;
  v63 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v154 + 48))(v18, 1, v149);
  v64 = v142;
  v147 = v29;
  if (v63 == 1)
  {
    sub_2443E2828((uint64_t)v18);
  }
  else
  {
    v66 = v138;
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v138, v18, v62);
    v67 = v146;
    sub_244406C90();
    sub_2443E2B34(&qword_25735DE38, (uint64_t (*)(uint64_t))MEMORY[0x24BE6B8D0], MEMORY[0x24BE6B8E0]);
    v68 = v67;
    LOBYTE(v67) = sub_244406DEC();
    v69 = *(void (**)(char *, uint64_t))(v61 + 8);
    v69(v68, v62);
    if ((v67 & 1) != 0)
    {
      v69(v66, v62);
    }
    else
    {
      sub_244406C90();
      v70 = sub_244406C30();
      v69(v146, v62);
      if ((v70 & 1) == 0)
      {
        v89 = v137;
        if (qword_25735DB50 != -1)
          swift_once();
        v90 = __swift_project_value_buffer(v64, (uint64_t)qword_2573610D0);
        (*(void (**)(NSObject *, uint64_t, uint64_t))(v89 + 16))(v136, v90, v64);
        (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v135, v66, v62);
        v91 = v89;
        v92 = sub_244406D20();
        v93 = v64;
        v94 = sub_244406FB4();
        if (os_log_type_enabled(v92, v94))
        {
          v95 = swift_slowAlloc();
          v154 = swift_slowAlloc();
          v156 = v154;
          *(_DWORD *)v95 = 136315394;
          v96 = v135;
          v97 = ScalarType.description.getter();
          v158 = sub_2443DABA4(v97, v98, &v156);
          sub_244406FE4();
          swift_bridgeObjectRelease();
          v69(v96, v62);
          *(_WORD *)(v95 + 12) = 2080;
          swift_beginAccess();
          v99 = v146;
          sub_244406C90();
          v100 = ScalarType.description.getter();
          v102 = v101;
          v69(v99, v62);
          v155 = sub_2443DABA4(v100, v102, &v156);
          sub_244406FE4();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2443D2000, v92, v94, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v95, 0x16u);
          v103 = v154;
          swift_arrayDestroy();
          MEMORY[0x24950E6FC](v103, -1, -1);
          MEMORY[0x24950E6FC](v95, -1, -1);

          (*(void (**)(NSObject *, uint64_t))(v137 + 8))(v136, v142);
          v69(v138, v62);
          (*(void (**)(char *, unint64_t))(v147 + 8))(v150, v28);
        }
        else
        {

          v69(v135, v62);
          (*(void (**)(NSObject *, uint64_t))(v91 + 8))(v136, v93);
          v69(v66, v62);
          (*(void (**)(char *, unint64_t))(v29 + 8))(v60, v28);
        }
        return 0;
      }
      v140 = v69;
      v71 = v137;
      if (qword_25735DB50 != -1)
        swift_once();
      v72 = __swift_project_value_buffer(v64, (uint64_t)qword_2573610D0);
      v73 = v134;
      (*(void (**)(char *, uint64_t, uint64_t))(v71 + 16))(v134, v72, v64);
      v74 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
      v75 = v133;
      v74(v133, v66, v62);
      v76 = sub_244406D20();
      v77 = sub_244406FA8();
      v136 = v76;
      LODWORD(v135) = v77;
      if (os_log_type_enabled(v76, v77))
      {
        v78 = swift_slowAlloc();
        v128 = swift_slowAlloc();
        v158 = v128;
        *(_DWORD *)v78 = 136315394;
        v127[1] = v78 + 4;
        swift_beginAccess();
        v79 = v146;
        sub_244406C90();
        v80 = ScalarType.description.getter();
        v82 = v81;
        v83 = v140;
        v140(v79, v149);
        v156 = sub_2443DABA4(v80, v82, &v158);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v78 + 12) = 2080;
        v84 = v133;
        v85 = ScalarType.description.getter();
        v156 = sub_2443DABA4(v85, v86, &v158);
        v60 = v150;
        v62 = v149;
        sub_244406FE4();
        swift_bridgeObjectRelease();
        v83(v84, v62);
        v87 = v136;
        _os_log_impl(&dword_2443D2000, v136, (os_log_type_t)v135, "Casting tensor of type %s to type %s.", (uint8_t *)v78, 0x16u);
        v88 = v128;
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v88, -1, -1);
        MEMORY[0x24950E6FC](v78, -1, -1);

        (*(void (**)(char *, uint64_t))(v137 + 8))(v134, v64);
      }
      else
      {
        v140(v75, v62);

        (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v64);
      }
      swift_beginAccess();
      v104 = v131;
      v105 = v130;
      v106 = v132;
      (*(void (**)(char *, _QWORD, uint64_t))(v131 + 104))(v130, *MEMORY[0x24BEE38B8], v132);
      v107 = v129;
      sub_244406CCC();
      (*(void (**)(char *, uint64_t))(v104 + 8))(v105, v106);
      v140(v66, v62);
      swift_beginAccess();
      (*(void (**)(char *, char *, unint64_t))(v29 + 40))(v60, v107, v28);
    }
  }
  v146 = (char *)v28;
  swift_beginAccess();
  v108 = v143;
  sub_244406CF0();
  v38 = (char *)sub_244406C60();
  v109 = *(void (**)(char *, uint64_t))(v141 + 8);
  v110 = v144;
  v109(v108, v144);
  sub_244406CF0();
  a1 = (uint64_t)v108;
  v111 = sub_244406C60();
  v109(v108, v110);
  if ((uint64_t)v38 >= v139)
    v112 = v139;
  else
    v112 = (uint64_t)v38;
  if (v112)
  {
    v29 = 0;
    v108 = 0;
    v143 = 0;
    v113 = 0;
    v144 = xmmword_2444076A0;
    while (1)
    {
      v114 = (uint64_t)v38 >= (uint64_t)v108;
      if (v112 > 0)
        v114 = (uint64_t)v108 >= (uint64_t)v38;
      if (v114)
      {
        if ((v108 != v38) | v29 & 1)
          goto LABEL_64;
        if (v113)
        {
          v29 = 1;
          v28 = (unint64_t)v38;
          v113 = 1;
          v115 = (uint64_t)&v108[v112];
          if (__OFADD__(v108, v112))
            goto LABEL_70;
        }
        else
        {
          if (v143 == (char *)0x8000000000000000)
            goto LABEL_64;
          v113 = 0;
          v29 = 1;
          v28 = (unint64_t)v38;
          v115 = (uint64_t)&v108[v112];
          if (__OFADD__(v108, v112))
          {
LABEL_70:
            __break(1u);
LABEL_71:
            __break(1u);
LABEL_72:
            __break(1u);
            goto LABEL_73;
          }
        }
      }
      else
      {
        v113 = !__OFADD__(v108, v112);
        v116 = 0x8000000000000000;
        if (!__OFADD__(v108, v112))
          v116 = 0;
        v143 = (char *)v116;
        if (__OFADD__(v108, v112))
          v28 = ((uint64_t)&v108[v112] >> 63) ^ 0x8000000000000000;
        else
          v28 = (unint64_t)&v108[v112];
        v115 = (uint64_t)&v108[v112];
        if (__OFADD__(v108, v112))
          goto LABEL_70;
      }
      if ((uint64_t)v38 >= v115)
        a1 = v115;
      else
        a1 = (uint64_t)v38;
      if (v108 == (char *)a1)
      {
LABEL_64:
        (*(void (**)(char *, char *))(v147 + 8))(v150, v146);
        return 1;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDF0);
      v117 = swift_allocObject();
      *(_OWORD *)(v117 + 16) = v144;
      if (a1 < (uint64_t)v108)
        goto LABEL_71;
      *(_QWORD *)(v117 + 32) = v108;
      *(_QWORD *)(v117 + 40) = a1;
      if (v111 < 0)
        goto LABEL_72;
      *(_QWORD *)(v117 + 48) = 0;
      *(_QWORD *)(v117 + 56) = v111;
      v157 = v117;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE40);
      sub_2443E2B74();
      v118 = v152;
      sub_244406CFC();
      v62 = (uint64_t)v118;
      swift_bridgeObjectRelease();
      v119 = (uint64_t)v151;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v154 + 56))(v151, 1, 1, v149);
      a1 = PlanksWriter.writeBatch(_:label:as:)(v62, v145, (uint64_t)v153, v119);
      sub_2443E2828(v119);
      if ((a1 & 1) == 0)
        break;
      (*(void (**)(uint64_t, char *))(v147 + 8))(v62, v146);
      v108 = (char *)v28;
    }
    if (qword_25735DB50 != -1)
      goto LABEL_75;
  }
  else
  {
    __break(1u);
LABEL_75:
    swift_once();
  }
  __swift_project_value_buffer(v142, (uint64_t)qword_2573610D0);
  v120 = sub_244406D20();
  v121 = sub_244406FB4();
  v122 = os_log_type_enabled(v120, v121);
  v123 = v146;
  v124 = v147;
  if (v122)
  {
    v125 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v125 = 134217984;
    v157 = (uint64_t)v108;
    sub_244406FE4();
    _os_log_impl(&dword_2443D2000, v120, v121, "Failed at writing batch: %ld", v125, 0xCu);
    MEMORY[0x24950E6FC](v125, -1, -1);
  }

  v126 = *(void (**)(uint64_t, char *))(v124 + 8);
  v126(v62, v123);
  v126((uint64_t)v150, v123);
  return 0;
}

uint64_t sub_2443E0F98()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  int64_t v5;
  char v6;
  unint64_t v7;

  result = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 16);
  if (v2 <= 0)
  {
    if (v3 < result)
      goto LABEL_3;
  }
  else if (result < v3)
  {
LABEL_3:
    v4 = __OFADD__(result, v2);
    v5 = result + v2;
    v6 = v4;
    v7 = 0x8000000000000000;
    if (v4)
      v5 = (v5 >> 63) ^ 0x8000000000000000;
    else
      v7 = 0;
    *(_QWORD *)(v0 + 24) = v7;
    *(_BYTE *)(v0 + 32) = v6 ^ 1;
    *(_QWORD *)(v0 + 40) = v5;
    return result;
  }
  if (result != v3
    || (*(_BYTE *)(v0 + 48) & 1) != 0
    || (*(_BYTE *)(v0 + 32) & 1) == 0 && *(_QWORD *)(v0 + 24) == 0x8000000000000000)
  {
    return 0;
  }
  *(_BYTE *)(v0 + 48) = 1;
  return result;
}

uint64_t PlanksWriter.writeBatch<A, B>(_:label:as:quantization:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
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
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  int v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v56;
  _BYTE *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  _BYTE v73[12];
  int v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE *v77;
  _BYTE *v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  uint64_t v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  _BYTE *v90;
  _QWORD v91[4];

  v79 = a8;
  v84 = a5;
  *(_QWORD *)&v85 = a2;
  v86 = a3;
  v83 = a13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  MEMORY[0x24BDAC7A8](v15);
  v80 = &v73[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE50);
  MEMORY[0x24BDAC7A8](v17);
  v77 = &v73[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = sub_244406C48();
  MEMORY[0x24BDAC7A8](v19);
  v78 = &v73[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v76 = sub_244406D14();
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v82 = &v73[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = sub_244406D08();
  v91[0] = v22;
  v23 = sub_244406F0C();
  v24 = MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v23);
  v25 = v83;
  computeQuantizationParameters<A, B, C>(_:upperbound:)((uint64_t)v91, v84, a7, a6, v23, a12, v83, a9, (double *)&v87, a10, v24);
  v26 = v87;
  v27 = v88;
  v91[0] = v22;
  LODWORD(v84) = v89;
  v74 = BYTE1(v89);
  v28 = quantizeArray<A, B, C>(_:parameters:)((uint64_t)v91, &v87, a7, a6, v23, a12, v25, a9);
  swift_bridgeObjectRelease();
  if (!v28)
  {
    v43 = v85;
    v44 = v86;
    if (qword_25735DB50 != -1)
      swift_once();
    v45 = sub_244406D38();
    __swift_project_value_buffer(v45, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v46 = sub_244406D20();
    v47 = sub_244406FB4();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v87 = v49;
      *(_DWORD *)v48 = 136315138;
      swift_bridgeObjectRetain();
      v91[0] = sub_2443DABA4(v43, v44, &v87);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v46, v47, "Failed at quantizing batch: %s.", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v49, -1, -1);
      MEMORY[0x24950E6FC](v48, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  sub_244406CF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE58);
  sub_2444070C8();
  swift_bridgeObjectRelease();
  v29 = v77;
  sub_244406C78();
  v30 = sub_244406C84();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 0, 1, v30);
  v31 = (uint64_t)v82;
  sub_244406CE4();
  v32 = (uint64_t)v80;
  sub_244406C6C();
  v33 = sub_244406C3C();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 0, 1, v33);
  v34 = v85;
  v35 = v86;
  v36 = v81;
  v37 = PlanksWriter.writeBatch(_:label:as:)(v31, v85, v86, v32);
  sub_2443E2828(v32);
  if ((v37 & 1) == 0)
  {
LABEL_12:
    if (qword_25735DB50 != -1)
      swift_once();
    v50 = sub_244406D38();
    __swift_project_value_buffer(v50, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v51 = sub_244406D20();
    v52 = sub_244406FB4();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = swift_slowAlloc();
      v87 = v54;
      *(_DWORD *)v53 = 136315138;
      swift_bridgeObjectRetain();
      v91[0] = sub_2443DABA4(v34, v35, &v87);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v51, v52, "Failed at writing quantizedTensor: %s.", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v54, -1, -1);
      MEMORY[0x24950E6FC](v53, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v31, v76);
    return 0;
  }
  v38 = v36 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v39 = *(_QWORD *)(v38 + 16);
  v83 = v38 + 16;
  if (!*(_QWORD *)(v39 + 16))
  {
    swift_endAccess();
    goto LABEL_12;
  }
  v81 = v38;
  sub_2443E29C4((uint64_t)&v87);
  v40 = v88;
  if (v88)
  {
    v41 = v90;
    v85 = v89;
    v42 = v87;
  }
  else
  {
    sub_2443E28C8(*(_QWORD *)(*(_QWORD *)v83 + 16) - 1, (uint64_t)&v87);
    v42 = v87;
    v40 = v88;
    v85 = v89;
    v41 = v90;
  }
  swift_endAccess();
  v56 = *(_QWORD *)(v40 + 16);
  if (v56)
  {
    LODWORD(v79) = v42;
    v80 = v41;
    LODWORD(v86) = v84 | (v74 << 8);
    swift_bridgeObjectRetain_n();
    v84 = v40;
    v57 = (_BYTE *)(v40 + 64);
    v58 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v60 = *((_QWORD *)v57 - 4);
      v59 = *((_QWORD *)v57 - 3);
      v62 = *((_QWORD *)v57 - 2);
      v61 = *((_QWORD *)v57 - 1);
      v63 = *v57;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v58 = sub_2443E26D4(0, v58[2] + 1, 1, v58);
      v65 = v58[2];
      v64 = v58[3];
      if (v65 >= v64 >> 1)
        v58 = sub_2443E26D4((_QWORD *)(v64 > 1), v65 + 1, 1, v58);
      v57 += 64;
      v58[2] = v65 + 1;
      v66 = &v58[8 * v65];
      v66[4] = v60;
      v66[5] = v59;
      v66[6] = v62;
      v66[7] = v61;
      *((_BYTE *)v66 + 64) = v63;
      *((_BYTE *)v66 + 65) = 1;
      v66[9] = v26;
      v66[10] = v27;
      *((_WORD *)v66 + 44) = v86;
      --v56;
    }
    while (v56);
    swift_bridgeObjectRelease_n();
    v31 = (uint64_t)v82;
    v41 = v80;
    LOBYTE(v42) = v79;
  }
  else
  {
    v58 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v67 = v81;
  swift_beginAccess();
  v68 = *(_QWORD **)(v67 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v67 + 16) = v68;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v68 = sub_2443E25B4(0, v68[2] + 1, 1, v68);
    *(_QWORD *)v83 = v68;
  }
  v71 = v68[2];
  v70 = v68[3];
  if (v71 >= v70 >> 1)
  {
    v68 = sub_2443E25B4((_QWORD *)(v70 > 1), v71 + 1, 1, v68);
    *(_QWORD *)v83 = v68;
  }
  v68[2] = v71 + 1;
  v72 = &v68[5 * v71];
  *((_BYTE *)v72 + 32) = v42;
  v72[5] = v58;
  *((_OWORD *)v72 + 3) = v85;
  v72[8] = v41;
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v31, v76);
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t PlanksWriter.writeTensor<A, B>(_:label:as:batchSize:quantization:)(uint64_t a1, uint64_t a2, uint8_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
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
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  int v42;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v56;
  _BYTE *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  unint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  _QWORD *v68;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  _BYTE v73[4];
  int v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE *v77;
  _BYTE *v78;
  void (*v79)(char *, uint64_t);
  uint64_t v80;
  uint64_t v81;
  _BYTE *v82;
  uint64_t v83;
  __int128 v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  __int128 v88;
  void (*v89)(char *, uint64_t);
  _QWORD v90[4];

  v80 = a5;
  v83 = a6;
  *(_QWORD *)&v84 = a2;
  v85 = a3;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  MEMORY[0x24BDAC7A8](v16);
  v79 = (void (*)(char *, uint64_t))&v73[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE50);
  MEMORY[0x24BDAC7A8](v18);
  v77 = &v73[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = sub_244406C48();
  MEMORY[0x24BDAC7A8](v20);
  v78 = &v73[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v76 = sub_244406D14();
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v82 = &v73[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = sub_244406D08();
  v90[0] = v23;
  v24 = sub_244406F0C();
  v25 = MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v24);
  computeQuantizationParameters<A, B, C>(_:upperbound:)((uint64_t)v90, v83, a8, a7, v24, a13, a14, a10, (double *)&v86, a11, v25);
  v26 = v86;
  v27 = v87;
  v90[0] = v23;
  LODWORD(v83) = v88;
  v74 = BYTE1(v88);
  v28 = quantizeArray<A, B, C>(_:parameters:)((uint64_t)v90, &v86, a8, a7, v24, a13, a14, a10);
  swift_bridgeObjectRelease();
  if (!v28)
  {
    v43 = v84;
    v44 = v85;
    if (qword_25735DB50 != -1)
      swift_once();
    v45 = sub_244406D38();
    __swift_project_value_buffer(v45, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v46 = sub_244406D20();
    v47 = sub_244406FB4();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v86 = v49;
      *(_DWORD *)v48 = 136315138;
      swift_bridgeObjectRetain();
      v90[0] = sub_2443DABA4(v43, (unint64_t)v44, &v86);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v46, v47, "Failed at quantizing batch: %s.", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v49, -1, -1);
      MEMORY[0x24950E6FC](v48, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  sub_244406CF0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE58);
  sub_2444070C8();
  swift_bridgeObjectRelease();
  v29 = v77;
  sub_244406C78();
  v30 = sub_244406C84();
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 0, 1, v30);
  v31 = (uint64_t)v82;
  sub_244406CE4();
  v32 = v79;
  sub_244406C6C();
  v33 = sub_244406C3C();
  (*(void (**)(void (*)(char *, uint64_t), _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 0, 1, v33);
  v34 = v84;
  v35 = v85;
  v36 = v81;
  v37 = PlanksWriter.writeTensor(_:label:as:batchSize:)(v31, v84, v85, v32, v80);
  sub_2443E2828((uint64_t)v32);
  if ((v37 & 1) == 0)
  {
LABEL_12:
    if (qword_25735DB50 != -1)
      swift_once();
    v50 = sub_244406D38();
    __swift_project_value_buffer(v50, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v51 = sub_244406D20();
    v52 = sub_244406FB4();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = swift_slowAlloc();
      v86 = v54;
      *(_DWORD *)v53 = 136315138;
      swift_bridgeObjectRetain();
      v90[0] = sub_2443DABA4(v34, (unint64_t)v35, &v86);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v51, v52, "Failed at writing quantizedTensor: %s.", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v54, -1, -1);
      MEMORY[0x24950E6FC](v53, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v31, v76);
    return 0;
  }
  v38 = v36 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v39 = *(_QWORD *)(v38 + 16);
  v81 = v38 + 16;
  if (!*(_QWORD *)(v39 + 16))
  {
    swift_endAccess();
    goto LABEL_12;
  }
  v80 = v38;
  sub_2443E29C4((uint64_t)&v86);
  v40 = v87;
  if (v87)
  {
    v41 = v89;
    v84 = v88;
    v42 = v86;
  }
  else
  {
    sub_2443E28C8(*(_QWORD *)(*(_QWORD *)v81 + 16) - 1, (uint64_t)&v86);
    v42 = v86;
    v40 = v87;
    v84 = v88;
    v41 = v89;
  }
  swift_endAccess();
  v56 = *(_QWORD *)(v40 + 16);
  if (v56)
  {
    LODWORD(v78) = v42;
    v79 = v41;
    LODWORD(v85) = v83 | (v74 << 8);
    swift_bridgeObjectRetain_n();
    v83 = v40;
    v57 = (_BYTE *)(v40 + 64);
    v58 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v60 = *((_QWORD *)v57 - 4);
      v59 = *((_QWORD *)v57 - 3);
      v62 = *((_QWORD *)v57 - 2);
      v61 = *((_QWORD *)v57 - 1);
      v63 = *v57;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v58 = sub_2443E26D4(0, v58[2] + 1, 1, v58);
      v65 = v58[2];
      v64 = v58[3];
      if (v65 >= v64 >> 1)
        v58 = sub_2443E26D4((_QWORD *)(v64 > 1), v65 + 1, 1, v58);
      v57 += 64;
      v58[2] = v65 + 1;
      v66 = &v58[8 * v65];
      v66[4] = v60;
      v66[5] = v59;
      v66[6] = v62;
      v66[7] = v61;
      *((_BYTE *)v66 + 64) = v63;
      *((_BYTE *)v66 + 65) = 1;
      v66[9] = v26;
      v66[10] = v27;
      *((_WORD *)v66 + 44) = (_WORD)v85;
      --v56;
    }
    while (v56);
    swift_bridgeObjectRelease_n();
    v31 = (uint64_t)v82;
    v41 = v79;
    LOBYTE(v42) = (_BYTE)v78;
  }
  else
  {
    v58 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v67 = v80;
  swift_beginAccess();
  v68 = *(_QWORD **)(v67 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v67 + 16) = v68;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v68 = sub_2443E25B4(0, v68[2] + 1, 1, v68);
    *(_QWORD *)v81 = v68;
  }
  v71 = v68[2];
  v70 = v68[3];
  if (v71 >= v70 >> 1)
  {
    v68 = sub_2443E25B4((_QWORD *)(v70 > 1), v71 + 1, 1, v68);
    *(_QWORD *)v81 = v68;
  }
  v68[2] = v71 + 1;
  v72 = &v68[5 * v71];
  *((_BYTE *)v72 + 32) = v42;
  v72[5] = v58;
  *((_OWORD *)v72 + 3) = v84;
  v72[8] = v41;
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v31, v76);
  swift_bridgeObjectRelease();
  return 1;
}

_QWORD *sub_2443E2184(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DB60);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2443E2A4C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2443E2290(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE60);
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
    sub_2443E2BC0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2443E239C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE78);
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
    sub_2443E2CB0(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2443E24A8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE68);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2443E2E8C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2443E25B4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE70);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_2443E2D98(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2443E26D4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE30);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 6);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2443E2F7C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2443E27E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2443E2828(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_2443E2868(_QWORD *a1)
{
  return sub_2443E2184(0, a1[2], 0, a1);
}

_QWORD *sub_2443E287C(_QWORD *a1)
{
  return sub_2443E25B4(0, a1[2], 0, a1);
}

double sub_2443E2890@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2443F4A90(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), 0, 1, a1);
}

uint64_t sub_2443E28C8@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_2443E287C(v5);
  v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = &v5[5 * a1];
    v10 = *((_BYTE *)v8 + 32);
    v9 = v8 + 4;
    v11 = v9[1];
    v12 = v9[4];
    *(_BYTE *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v11;
    *(_OWORD *)(a2 + 16) = *((_OWORD *)v9 + 1);
    *(_QWORD *)(a2 + 32) = v12;
    v13 = v6 - 1 - a1;
    if (v13 >= 0)
    {
      result = (uint64_t)memmove(v9, v9 + 5, 40 * v13);
      v5[2] = v7;
      *v2 = v5;
      return result;
    }
  }
  result = sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443E29C4@<X0>(uint64_t a1@<X8>)
{
  _QWORD **v1;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) != 0)
  {
    v5 = v3[2];
    if (v5)
    {
LABEL_3:
      v6 = v5 - 1;
      v7 = &v3[5 * v6];
      v8 = v7[5];
      v9 = v7[8];
      *(_BYTE *)a1 = *((_BYTE *)v7 + 32);
      *(_QWORD *)(a1 + 8) = v8;
      *(_OWORD *)(a1 + 16) = *((_OWORD *)v7 + 3);
      *(_QWORD *)(a1 + 32) = v9;
      v3[2] = v6;
      *v1 = v3;
      return result;
    }
  }
  else
  {
    result = (uint64_t)sub_2443E287C(v3);
    v3 = (_QWORD *)result;
    v5 = *(_QWORD *)(result + 16);
    if (v5)
      goto LABEL_3;
  }
  __break(1u);
  return result;
}

char *sub_2443E2A4C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443E2B34(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24950E66C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2443E2B74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25735DE48;
  if (!qword_25735DE48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25735DE40);
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25735DE48);
  }
  return result;
}

uint64_t sub_2443E2BC0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_244407134();
  __break(1u);
  return result;
}

char *sub_2443E2CB0(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 16 * a1 + 32);
    v6 = 16 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443E2D98(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443E2E8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  result = sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443E2F7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  result = sub_244407134();
  __break(1u);
  return result;
}

uint64_t PlanksReader.readBatch<A>(label:as:batchIndex:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;

  swift_bridgeObjectRetain();
  v12 = sub_2443D8A88();
  if (*(_QWORD *)(v12 + 16) && (v13 = sub_2443DC1EC(a1, a2), (v14 & 1) != 0))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(v15 + 16);
    if (v16 && (a4 & 0x8000000000000000) == 0 && v16 > a4)
    {
      v17 = v15 + 16 * a4;
      v18 = *(_QWORD *)(v17 + 32);
      v19 = *(_QWORD *)(v17 + 40);
      swift_bridgeObjectRelease();
      return sub_2443E32E8(a1, a2, a3, v18, v19, a5, a6);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_25735DB50 != -1)
    swift_once();
  v21 = sub_244406D38();
  __swift_project_value_buffer(v21, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain_n();
  v22 = sub_244406D20();
  v23 = sub_244406FB4();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v26 = v25;
    *(_DWORD *)v24 = 136315138;
    swift_bridgeObjectRetain();
    sub_2443DABA4(a1, a2, &v26);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v22, v23, "Found no valid indices for label: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v25, -1, -1);
    MEMORY[0x24950E6FC](v24, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_2443E32E8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint8_t *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _OWORD *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t *__return_ptr, uint64_t, uint64_t);
  int v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  _OWORD v70[2];
  _BYTE v71[26];

  v8 = v7;
  swift_bridgeObjectRetain();
  v15 = sub_2443D8788();
  if (!*(_QWORD *)(v15 + 16) || (v16 = sub_2443DC1EC(a1, a2), (v17 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v25 = sub_244406D38();
    __swift_project_value_buffer(v25, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v26 = sub_244406D20();
    v27 = sub_244406FB4();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      *(_QWORD *)&v70[0] = v29;
      *(_DWORD *)v28 = 136315138;
      swift_bridgeObjectRetain();
      v69 = sub_2443DABA4(a1, a2, (uint64_t *)v70);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v26, v27, "Invalid SchemaElement for label: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v29, -1, -1);
      v30 = v28;
      goto LABEL_24;
    }

    goto LABEL_11;
  }
  v18 = *(_QWORD *)(v15 + 56) + 32 * v16;
  v19 = *(_QWORD *)(v18 + 8);
  v63 = *(_QWORD *)v18;
  v20 = *(unsigned __int8 *)(v18 + 16);
  v66 = *(_QWORD *)(v18 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v64 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a7 + 8);
  v64(&v69, a6, a7);
  v65 = v20;
  LOBYTE(v70[0]) = v20;
  v21 = FieldType.rawValue.getter();
  v23 = v22;
  if (v21 != FieldType.rawValue.getter() || v23 != v24)
  {
    v31 = sub_244407224();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) != 0)
      goto LABEL_13;
    if (qword_25735DB50 != -1)
      swift_once();
    v46 = sub_244406D38();
    __swift_project_value_buffer(v46, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v47 = sub_244406D20();
    v48 = sub_244406FB4();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = swift_slowAlloc();
      v50 = swift_slowAlloc();
      *(_QWORD *)&v70[0] = v50;
      *(_DWORD *)v49 = 136315394;
      v64(&v69, a6, a7);
      v51 = FieldType.description.getter();
      v69 = sub_2443DABA4(v51, v52, (uint64_t *)v70);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      swift_bridgeObjectRetain();
      v53 = sub_2443DA7D0(v63, v19, v65, v66);
      v55 = v54;
      swift_bridgeObjectRelease();
      v69 = sub_2443DABA4(v53, v55, (uint64_t *)v70);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2443D2000, v47, v48, "Invalid array type: %s for schema: %s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v50, -1, -1);
      MEMORY[0x24950E6FC](v49, -1, -1);

      return 0;
    }

LABEL_11:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  swift_bridgeObjectRelease_n();
LABEL_13:
  if (a4 < 0
    || (v32 = *(_QWORD *)(v8 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16), *(_QWORD *)(v32 + 16) <= a4)
    || a5 < 0
    || (v33 = v32 + 40 * a4, v34 = *(_QWORD *)(v33 + 40), *(_QWORD *)(v34 + 16) <= a5))
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v42 = sub_244406D38();
    __swift_project_value_buffer(v42, (uint64_t)qword_2573610D0);
    v26 = sub_244406D20();
    v43 = sub_244406FB4();
    if (!os_log_type_enabled(v26, v43))
      goto LABEL_25;
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl(&dword_2443D2000, v26, v43, "Invalid index", v44, 2u);
    v30 = v44;
LABEL_24:
    MEMORY[0x24950E6FC](v30, -1, -1);
LABEL_25:

    return 0;
  }
  v35 = *(_QWORD *)(v33 + 64);
  v36 = (_OWORD *)(v34 + (a5 << 6));
  v37 = v36[2];
  v38 = v36[3];
  v39 = v36[4];
  *(_OWORD *)&v71[10] = *(_OWORD *)((char *)v36 + 74);
  v70[1] = v38;
  *(_OWORD *)v71 = v39;
  v70[0] = v37;
  sub_2443DDBAC((uint64_t)v70);
  swift_bridgeObjectRelease();
  v68 = 0;
  v40 = v66 * v35;
  if ((unsigned __int128)(v66 * (__int128)v35) >> 64 == (v66 * v35) >> 63)
  {
    if ((v65 - 1) > 9)
      v41 = 1;
    else
      v41 = qword_244407D10[(char)(v65 - 1)];
    if ((unsigned __int128)(v40 * (__int128)v41) >> 64 == (v40 * v41) >> 63)
    {
      MEMORY[0x24BDAC7A8](v40);
      sub_244406ED0();
      sub_2443E6EA8((uint64_t)v70);
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  swift_once();
  v56 = sub_244406D38();
  __swift_project_value_buffer(v56, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain();
  v57 = sub_244406D20();
  v58 = sub_244406FA8();
  if (os_log_type_enabled(v57, v58))
  {
    v59 = swift_slowAlloc();
    v60 = swift_slowAlloc();
    v69 = v60;
    *(_DWORD *)v59 = 134218242;
    v67 = MEMORY[0x24950E018](v19, a6);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v59 + 12) = 2080;
    v64(&v67, a6, a7);
    v61 = FieldType.description.getter();
    v67 = sub_2443DABA4(v61, v62, &v69);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2443D2000, v57, v58, "Loaded array of %ld elements of type %s.", (uint8_t *)v59, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v60, -1, -1);
    MEMORY[0x24950E6FC](v59, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return v19;
}

double PlanksReader.iterBatches<A>(label:as:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;

  swift_bridgeObjectRetain();
  v6 = sub_2443D8A88();
  if (*(_QWORD *)(v6 + 16) && (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) != 0))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v9 + 16);
    swift_bridgeObjectRelease();
    if (v10)
    {
      swift_bridgeObjectRetain();
      v11 = swift_retain();
      return sub_2443E3D54(v11, a1, a2, (_QWORD *)a3);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_25735DB50 != -1)
    swift_once();
  v13 = sub_244406D38();
  __swift_project_value_buffer(v13, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain_n();
  v14 = sub_244406D20();
  v15 = sub_244406FB4();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v18 = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    sub_2443DABA4(a1, a2, &v18);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v14, v15, "Found no valid indices for label: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v17, -1, -1);
    MEMORY[0x24950E6FC](v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  result = 0.0;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  return result;
}

double sub_2443E3D54@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;

  swift_bridgeObjectRetain();
  v8 = sub_2443D8A88();
  if (*(_QWORD *)(v8 + 16) && (v9 = sub_2443DC1EC(a2, a3), (v10 & 1) != 0))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2443D9D44(a2, a3);
    *a4 = v12;
    a4[1] = a1;
    a4[2] = a2;
    a4[3] = a3;
    a4[4] = v11;
    a4[5] = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v14 = sub_244406D38();
    __swift_project_value_buffer(v14, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v15 = sub_244406D20();
    v16 = sub_244406FB4();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v19 = v18;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain();
      sub_2443DABA4(a2, a3, &v19);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v15, v16, "Invalid label: %s for AsyncArraySequence.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v18, -1, -1);
      MEMORY[0x24950E6FC](v17, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
      swift_bridgeObjectRelease_n();
    }
    result = 0.0;
    *((_OWORD *)a4 + 1) = 0u;
    *((_OWORD *)a4 + 2) = 0u;
    *(_OWORD *)a4 = 0u;
  }
  return result;
}

unint64_t PlanksReader.readArray<A>(label:as:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  const char *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void (*v51)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  swift_bridgeObjectRetain();
  v9 = sub_2443D8788();
  if (!*(_QWORD *)(v9 + 16) || (v10 = sub_2443DC1EC(a1, a2), (v11 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v19 = sub_244406D38();
    __swift_project_value_buffer(v19, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v20 = sub_244406D20();
    v21 = sub_244406FB4();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v56 = v23;
      *(_DWORD *)v22 = 136315138;
      swift_bridgeObjectRetain();
      v55 = sub_2443DABA4(a1, a2, &v56);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v24 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v20, v21, v24, v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v23, -1, -1);
      MEMORY[0x24950E6FC](v22, -1, -1);

      return 0;
    }
    goto LABEL_26;
  }
  v12 = *(_QWORD *)(v9 + 56) + 32 * v10;
  v13 = *(_QWORD *)(v12 + 8);
  v52 = *(_QWORD *)v12;
  v14 = *(unsigned __int8 *)(v12 + 16);
  v54 = *(_QWORD *)(v12 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v51 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 8);
  v51(&v55, a4, a5);
  v53 = v14;
  LOBYTE(v56) = v14;
  v15 = FieldType.rawValue.getter();
  v17 = v16;
  if (v15 == FieldType.rawValue.getter() && v17 == v18)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v25 = sub_244407224();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v34 = sub_244406D38();
      __swift_project_value_buffer(v34, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v35 = sub_244406D20();
      v36 = sub_244406FB4();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = swift_slowAlloc();
        v38 = swift_slowAlloc();
        v56 = v38;
        *(_DWORD *)v37 = 136315394;
        v39 = sub_2444072F0();
        v55 = sub_2443DABA4(v39, v40, &v56);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2080;
        swift_bridgeObjectRetain();
        v41 = sub_2443DA7D0(v52, v13, v53, v54);
        v43 = v42;
        swift_bridgeObjectRelease();
        v55 = sub_2443DABA4(v41, v43, &v56);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v35, v36, "Invalid array type: %s for schema: %s", (uint8_t *)v37, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v38, -1, -1);
        MEMORY[0x24950E6FC](v37, -1, -1);

        return 0;
      }

      goto LABEL_27;
    }
  }
  v26 = sub_2443D9C34(a1, a2);
  if (v26 < 1)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v32 = sub_244406D38();
    __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v20 = sub_244406D20();
    v21 = sub_244406FB4();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v56 = v23;
      *(_DWORD *)v22 = 136315138;
      swift_bridgeObjectRetain();
      v55 = sub_2443DABA4(a1, a2, &v56);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v24 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_26:

LABEL_27:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v27 = v26;
  swift_bridgeObjectRetain();
  if (!*(_QWORD *)(sub_2443D8A88() + 16) || (sub_2443DC1EC(a1, a2), (v28 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v31 = sub_244406D38();
    __swift_project_value_buffer(v31, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v20 = sub_244406D20();
    v21 = sub_244406FB4();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v56 = v23;
      *(_DWORD *)v22 = 136315138;
      swift_bridgeObjectRetain();
      v55 = sub_2443DABA4(a1, a2, &v56);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v24 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_26;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v29 = v54 * v27;
  if ((unsigned __int128)(v54 * (__int128)v27) >> 64 == (v54 * v27) >> 63)
  {
    if ((v53 - 1) > 9)
      v30 = 1;
    else
      v30 = qword_244407D10[(char)(v53 - 1)];
    if ((unsigned __int128)(v29 * (__int128)v30) >> 64 == (v29 * v30) >> 63)
    {
      MEMORY[0x24BDAC7A8](v29);
      sub_244406ED0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  swift_once();
  v44 = sub_244406D38();
  __swift_project_value_buffer(v44, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain();
  v45 = sub_244406D20();
  v46 = sub_244406FA8();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = swift_slowAlloc();
    v48 = swift_slowAlloc();
    v56 = v48;
    *(_DWORD *)v47 = 134218242;
    v55 = MEMORY[0x24950E018](a2, a4);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v47 + 12) = 2080;
    v51(&v55, a4, a5);
    v49 = FieldType.description.getter();
    v55 = sub_2443DABA4(v49, v50, &v56);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2443D2000, v45, v46, "Loaded array of %ld elements of type %s.", (uint8_t *)v47, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v48, -1, -1);
    MEMORY[0x24950E6FC](v47, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return a2;
}

void sub_2443E4944(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, _BYTE *a10, uint64_t a11)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  os_log_type_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  os_log_type_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v12 = *(_QWORD *)(a1 + 8);
  v13 = *(_QWORD *)(*(_QWORD *)(a11 - 8) + 72);
  v14 = v12 * v13;
  if ((unsigned __int128)(v12 * (__int128)v13) >> 64 != (v12 * v13) >> 63)
  {
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    swift_once();
LABEL_29:
    v38 = sub_244406D38();
    __swift_project_value_buffer(v38, (uint64_t)qword_2573610D0);
    v39 = sub_244406D20();
    v40 = sub_244406FB4();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_2443D2000, v39, v40, "Invalid index", v41, 2u);
      MEMORY[0x24950E6FC](v41, -1, -1);
    }
    goto LABEL_31;
  }
  v17 = sub_244406FCC();
  v18 = *(_QWORD *)(a4 + 16);
  if (!v18)
    goto LABEL_47;
  v52 = a4;
  v19 = *(_QWORD *)(a4 + 32);
  if (v19 < 0
    || (v20 = *(_QWORD *)(a5 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        v21 = *(_QWORD *)(v20 + 16),
        v19 >= v21))
  {
LABEL_28:
    if (qword_25735DB50 == -1)
      goto LABEL_29;
    goto LABEL_56;
  }
  v22 = v17;
  v23 = *(_QWORD *)(v52 + 40);
  v51 = v14;
  v24 = swift_bridgeObjectRetain();
  v25 = 0;
  v26 = (char)(a8 - 1);
  v27 = (uint64_t *)(v24 + 56);
  while (1)
  {
    if (v19 >= v21)
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    if (v23 < 0 || (v28 = v20 + 32 + 40 * v19, v29 = *(_QWORD *)(v28 + 8), v23 >= *(_QWORD *)(v29 + 16)))
    {
LABEL_27:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    v30 = *(_QWORD *)(v28 + 32);
    v31 = a9 * v30;
    if ((unsigned __int128)(a9 * (__int128)v30) >> 64 != (a9 * v30) >> 63)
      goto LABEL_50;
    if (v26 > 9)
      v32 = 1;
    else
      v32 = qword_244407D10[v26];
    if ((unsigned __int128)(v31 * (__int128)v32) >> 64 != (v31 * v32) >> 63)
      goto LABEL_51;
    v33 = *(_QWORD *)(v29 + (v23 << 6) + 56);
    if (v33 != v31 * v32)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 == -1)
        goto LABEL_33;
      goto LABEL_58;
    }
    v34 = __OFADD__(v25, v33);
    v35 = v25 + v33;
    if (v34)
      goto LABEL_52;
    if (v22)
    {
      if (v51 < v35)
        goto LABEL_35;
      if (v35 < v25)
        goto LABEL_55;
      goto LABEL_22;
    }
    if (v35 > 0)
    {
LABEL_35:
      swift_bridgeObjectRelease();
      if (qword_25735DB50 != -1)
        swift_once();
      v46 = sub_244406D38();
      __swift_project_value_buffer(v46, (uint64_t)qword_2573610D0);
      v39 = sub_244406D20();
      v47 = sub_244406FB4();
      if (os_log_type_enabled(v39, v47))
      {
        v44 = swift_slowAlloc();
        *(_DWORD *)v44 = 134218240;
        sub_244406FE4();
        *(_WORD *)(v44 + 12) = 2048;
        sub_244406FE4();
        v45 = "Failed at computing chunk offset: %ld vs %ld ";
        v48 = v39;
        v49 = v47;
LABEL_44:
        _os_log_impl(&dword_2443D2000, v48, v49, v45, (uint8_t *)v44, 0x16u);
        MEMORY[0x24950E6FC](v44, -1, -1);

        return;
      }
LABEL_31:

      return;
    }
    if (v35 < v25)
    {
      __break(1u);
LABEL_58:
      swift_once();
LABEL_33:
      v42 = sub_244406D38();
      __swift_project_value_buffer(v42, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v39 = sub_244406D20();
      v43 = sub_244406FB4();
      if (os_log_type_enabled(v39, v43))
      {
        v44 = swift_slowAlloc();
        *(_DWORD *)v44 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v44 + 12) = 2048;
        sub_244406FE4();
        v45 = "Found invalid chunk: %lld vs %ld";
LABEL_43:
        v48 = v39;
        v49 = v43;
        goto LABEL_44;
      }
LABEL_45:

      swift_bridgeObjectRelease_n();
      return;
    }
LABEL_22:
    swift_bridgeObjectRetain();
    sub_244406D50();
    if ((v36 & 1) != 0)
    {
      sub_2443DAC74();
      swift_willThrowTypedImpl();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 != -1)
        swift_once();
      v50 = sub_244406D38();
      __swift_project_value_buffer(v50, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v39 = sub_244406D20();
      v43 = sub_244406FB4();
      if (os_log_type_enabled(v39, v43))
      {
        v44 = swift_slowAlloc();
        *(_DWORD *)v44 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v44 + 12) = 2048;
        sub_244406FE4();
        v45 = "Failed at reading chunk at %lld for %ld bytes.";
        goto LABEL_43;
      }
      goto LABEL_45;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v31))
      goto LABEL_53;
    *a2 += v31;
    if (!--v18)
      break;
    v19 = *(v27 - 1);
    v26 = (char)(a8 - 1);
    if ((v19 & 0x8000000000000000) == 0)
    {
      v37 = *v27;
      v27 += 2;
      v23 = v37;
      v21 = *(_QWORD *)(v20 + 16);
      v25 = v35;
      if (v19 < v21)
        continue;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_47:
  *a10 = 1;
}

uint64_t PlanksReader.readBatch<A, B>(label:as:quantization:batchIndex:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  swift_bridgeObjectRetain();
  v18 = sub_2443D8A88();
  if (*(_QWORD *)(v18 + 16) && (v19 = sub_2443DC1EC(a1, a2), (v20 & 1) != 0))
  {
    v33 = a1;
    v21 = *(_QWORD *)(*(_QWORD *)(v18 + 56) + 8 * v19);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = *(_QWORD *)(v21 + 16);
    if (v22 && (a5 & 0x8000000000000000) == 0 && v22 > a5)
    {
      v23 = v21 + 16 * a5;
      v24 = *(_QWORD *)(v23 + 40);
      v32 = *(_QWORD *)(v23 + 32);
      swift_bridgeObjectRelease();
      return sub_2443E5268(v33, a2, v32, v24, a3, a4, a6, a7, a8, a9, a10);
    }
    a1 = v33;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_25735DB50 != -1)
    swift_once();
  v26 = sub_244406D38();
  __swift_project_value_buffer(v26, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain_n();
  v27 = sub_244406D20();
  v28 = sub_244406FB4();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = a1;
    v31 = swift_slowAlloc();
    v34 = v31;
    *(_DWORD *)v29 = 136315138;
    swift_bridgeObjectRetain();
    sub_2443DABA4(v30, a2, &v34);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v27, v28, "Found no valid indices for label: %s", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v31, -1, -1);
    MEMORY[0x24950E6FC](v29, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_2443E5268(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[2];
  __int16 v39;
  uint64_t v40;

  if (a3 < 0
    || (v12 = *(_QWORD *)(v11 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16), *(_QWORD *)(v12 + 16) <= a3)
    || a4 < 0
    || (v13 = *(_QWORD *)(v12 + 40 * a3 + 40), *(_QWORD *)(v13 + 16) <= a4)
    || (v14 = v13 + (a4 << 6), v15 = *(_WORD *)(v14 + 88), v15 == 12))
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v16 = sub_244406D38();
    __swift_project_value_buffer(v16, (uint64_t)qword_2573610D0);
    v17 = sub_244406D20();
    v18 = sub_244406FB4();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2443D2000, v17, v18, "Invalid index.", v19, 2u);
      MEMORY[0x24950E6FC](v19, -1, -1);
    }

    return 0;
  }
  v24 = v14 + 32;
  v26 = *(_QWORD *)(v24 + 40);
  v25 = *(_QWORD *)(v24 + 48);
  v27 = sub_2443E32E8(a1, a2, a6, a3, a4, a8, a11);
  if (!v27)
    goto LABEL_15;
  v40 = v27;
  v38[0] = v26;
  v38[1] = v25;
  v39 = v15;
  v28 = sub_244406F0C();
  MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v28);
  v20 = rebuildArray<A, B, C>(_:parameters:)((uint64_t)&v40, v38, a7, a8, v28, a9, a10, a11);
  swift_bridgeObjectRelease();
  if (!v20)
  {
LABEL_15:
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    v30 = sub_244406D20();
    v31 = sub_244406FB4();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v33 = swift_slowAlloc();
      v38[0] = v33;
      *(_DWORD *)v32 = 136315394;
      v34 = sub_2444072F0();
      v40 = sub_2443DABA4(v34, v35, v38);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v32 + 12) = 2080;
      v36 = sub_2444072F0();
      v40 = sub_2443DABA4(v36, v37, v38);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2443D2000, v30, v31, "Failed rebuilding of array of type %s into type %s.", (uint8_t *)v32, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v33, -1, -1);
      MEMORY[0x24950E6FC](v32, -1, -1);
    }

    return 0;
  }
  return v20;
}

double PlanksReader.iterBatches<A, B>(label:as:quantization:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double result;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;

  swift_bridgeObjectRetain();
  v8 = sub_2443D8A88();
  if (*(_QWORD *)(v8 + 16) && (v9 = sub_2443DC1EC(a1, a2), (v10 & 1) != 0))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 16);
    swift_bridgeObjectRelease();
    if (v12)
    {
      swift_bridgeObjectRetain();
      v13 = swift_retain();
      return sub_2443E584C(v13, a1, a2, a3, (_QWORD *)a4);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_25735DB50 != -1)
    swift_once();
  v15 = sub_244406D38();
  __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain_n();
  v16 = sub_244406D20();
  v17 = sub_244406FB4();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v20 = v19;
    *(_DWORD *)v18 = 136315138;
    swift_bridgeObjectRetain();
    sub_2443DABA4(a1, a2, &v20);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v16, v17, "Found no valid indices for label: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v19, -1, -1);
    MEMORY[0x24950E6FC](v18, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(a4 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  return result;
}

double sub_2443E584C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  double result;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;

  swift_bridgeObjectRetain();
  v10 = sub_2443D8A88();
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_2443DC1EC(a2, a3), (v12 & 1) != 0))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2443D9D44(a2, a3);
    *a5 = v14;
    a5[1] = a1;
    a5[2] = a2;
    a5[3] = a3;
    a5[4] = v13;
    a5[5] = a4;
    a5[6] = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v16 = sub_244406D38();
    __swift_project_value_buffer(v16, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v17 = sub_244406D20();
    v18 = sub_244406FB4();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v21 = v20;
      *(_DWORD *)v19 = 136315138;
      swift_bridgeObjectRetain();
      sub_2443DABA4(a2, a3, &v21);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v17, v18, "Invalid label: %s for AsyncArraySequence.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v20, -1, -1);
      MEMORY[0x24950E6FC](v19, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
      swift_bridgeObjectRelease_n();
    }
    a5[6] = 0;
    result = 0.0;
    *((_OWORD *)a5 + 1) = 0u;
    *((_OWORD *)a5 + 2) = 0u;
    *(_OWORD *)a5 = 0u;
  }
  return result;
}

uint64_t PlanksReader.readArray<A, B>(label:as:quantization:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  swift_bridgeObjectRetain();
  v17 = sub_2443D8788();
  if (*(_QWORD *)(v17 + 16) && (v18 = sub_2443DC1EC(a1, a2), (v19 & 1) != 0))
  {
    v41 = a3;
    v42 = a4;
    v40 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 32 * v18 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v20 = sub_2443D9C34(a1, a2);
    if (v20 < 1)
    {
      swift_bridgeObjectRelease();
      if (qword_25735DB50 != -1)
        swift_once();
      v37 = sub_244406D38();
      __swift_project_value_buffer(v37, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain_n();
      v31 = sub_244406D20();
      v32 = sub_244406FB4();
      if (!os_log_type_enabled(v31, v32))
        goto LABEL_28;
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v44 = v34;
      *(_DWORD *)v33 = 136315138;
      swift_bridgeObjectRetain();
      v43 = sub_2443DABA4(a1, a2, &v44);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v35 = "Found no valid rows for label: %s";
    }
    else
    {
      v21 = v20;
      swift_bridgeObjectRetain();
      v22 = sub_2443D8A88();
      if (*(_QWORD *)(v22 + 16))
      {
        v23 = sub_2443DC1EC(a1, a2);
        if ((v24 & 1) != 0)
        {
          v39 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((unsigned __int128)(v40 * (__int128)v21) >> 64 == (v40 * v21) >> 63)
          {
            v44 = sub_244406EB8();
            v25 = sub_244406F0C();
            sub_244406E94();
            v26 = *(_QWORD *)(v39 + 16);
            if (!v26)
            {
LABEL_11:
              swift_bridgeObjectRelease();
              return v44;
            }
            v40 = a1;
            v27 = (uint64_t *)(v39 + 40);
            while (1)
            {
              v28 = sub_2443E5268(v40, a2, *(v27 - 1), *v27, v41, v42, a5, a6, a7, a8, a9);
              if (!v28)
                break;
              v27 += 2;
              v43 = v28;
              MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v25);
              sub_244406EF4();
              if (!--v26)
                goto LABEL_11;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (qword_25735DB50 == -1)
            {
LABEL_26:
              v38 = sub_244406D38();
              __swift_project_value_buffer(v38, (uint64_t)qword_2573610D0);
              swift_bridgeObjectRetain_n();
              v31 = sub_244406D20();
              v32 = sub_244406FB4();
              if (os_log_type_enabled(v31, v32))
              {
                v33 = (uint8_t *)swift_slowAlloc();
                v34 = swift_slowAlloc();
                v43 = v34;
                *(_DWORD *)v33 = 136315138;
                swift_bridgeObjectRetain();
                sub_2443DABA4(v40, a2, &v43);
                sub_244406FE4();
                swift_bridgeObjectRelease_n();
                v35 = "Failed at loading array: %s";
                goto LABEL_16;
              }
LABEL_28:

              swift_bridgeObjectRelease_n();
              return 0;
            }
          }
          else
          {
            __break(1u);
          }
          swift_once();
          goto LABEL_26;
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 != -1)
        swift_once();
      v36 = sub_244406D38();
      __swift_project_value_buffer(v36, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain_n();
      v31 = sub_244406D20();
      v32 = sub_244406FB4();
      if (!os_log_type_enabled(v31, v32))
        goto LABEL_28;
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v44 = v34;
      *(_DWORD *)v33 = 136315138;
      swift_bridgeObjectRetain();
      v43 = sub_2443DABA4(a1, a2, &v44);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v35 = "Found no valid indices for label: %s";
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v31 = sub_244406D20();
    v32 = sub_244406FB4();
    if (!os_log_type_enabled(v31, v32))
      goto LABEL_28;
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v44 = v34;
    *(_DWORD *)v33 = 136315138;
    swift_bridgeObjectRetain();
    v43 = sub_2443DABA4(a1, a2, &v44);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    v35 = "Invalid SchemaElement for label: %s";
  }
LABEL_16:
  _os_log_impl(&dword_2443D2000, v31, v32, v35, v33, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x24950E6FC](v34, -1, -1);
  MEMORY[0x24950E6FC](v33, -1, -1);

  return 0;
}

void sub_2443E6184(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  uint64_t v8;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint64_t v21;

  if ((unsigned __int128)(*(uint64_t *)(a1 + 8) * (__int128)*(uint64_t *)(*(_QWORD *)(a8 - 8) + 72)) >> 64 != (uint64_t)(*(_QWORD *)(a1 + 8) * *(_QWORD *)(*(_QWORD *)(a8 - 8) + 72)) >> 63)
  {
    __break(1u);
LABEL_16:
    swift_once();
    goto LABEL_7;
  }
  v8 = a4;
  sub_244406FCC();
  if (*(_QWORD *)(v8 + 24) == a3)
  {
    sub_244406D50();
    if ((v13 & 1) != 0)
    {
      sub_2443DAC74();
      swift_willThrowTypedImpl();
      if (qword_25735DB50 == -1)
        goto LABEL_10;
    }
    else
    {
      if (!__OFADD__(*a2, a6))
      {
        *a2 += a6;
        *a7 = 1;
        return;
      }
      __break(1u);
    }
    swift_once();
LABEL_10:
    v19 = sub_244406D38();
    __swift_project_value_buffer(v19, (uint64_t)qword_2573610D0);
    sub_2443DDBAC(v8);
    v15 = sub_244406D20();
    v20 = sub_244406FB4();
    if (os_log_type_enabled(v15, v20))
    {
      v21 = swift_slowAlloc();
      *(_DWORD *)v21 = 134218240;
      sub_244406FE4();
      sub_2443E6EA8(v8);
      *(_WORD *)(v21 + 12) = 2048;
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v15, v20, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v21, 0x16u);
      v18 = v21;
      goto LABEL_12;
    }
LABEL_13:
    sub_2443E6EA8(v8);
    goto LABEL_14;
  }
  if (qword_25735DB50 != -1)
    goto LABEL_16;
LABEL_7:
  v14 = sub_244406D38();
  __swift_project_value_buffer(v14, (uint64_t)qword_2573610D0);
  sub_2443DDBAC(v8);
  v15 = sub_244406D20();
  v16 = sub_244406FB4();
  if (!os_log_type_enabled(v15, v16))
    goto LABEL_13;
  v17 = swift_slowAlloc();
  *(_DWORD *)v17 = 134218240;
  sub_244406FE4();
  sub_2443E6EA8(v8);
  *(_WORD *)(v17 + 12) = 2048;
  sub_244406FE4();
  _os_log_impl(&dword_2443D2000, v15, v16, "Found invalid chunk: %lld vs %ld", (uint8_t *)v17, 0x16u);
  v18 = v17;
LABEL_12:
  MEMORY[0x24950E6FC](v18, -1, -1);
LABEL_14:

}

uint64_t AsyncArraySequence.maxBatchSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t AsyncArraySequence.maxBatchSize.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AsyncArraySequence.maxBatchSize.modify())()
{
  return nullsub_1;
}

uint64_t AsyncArraySequence.makeAsyncIterator()@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  v6 = v1[4];
  v5 = v1[5];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v6;
  a1[5] = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t AsyncArraySequence.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_2443E6520()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((sub_244406F30() & 1) != 0 || (v1 = *(_QWORD **)(v0 + 24), v3 = v1[4], v2 = v1[5], v2 >= *(_QWORD *)(v3 + 16)))
  {
    v8 = 0;
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 16);
    v5 = v3 + 16 * v2;
    v6 = *(_QWORD *)(v5 + 32);
    v7 = *(_QWORD *)(v5 + 40);
    v1[5] = v2 + 1;
    v8 = sub_2443E32E8(v1[2], v1[3], *(_QWORD *)(v4 + 16), v6, v7, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

uint64_t sub_2443E6594@<X0>(_QWORD *a1@<X8>)
{
  AsyncArraySequence.makeAsyncIterator()(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2443E65D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = sub_2443E6634;
  v5[2] = a2;
  v5[3] = v2;
  return swift_task_switch();
}

uint64_t sub_2443E6634(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v5;

  v3 = *(_QWORD **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();
  *v3 = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2443E6688()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2443E670C;
  return sub_244406F24();
}

uint64_t sub_2443E670C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t AsyncTransformedArraySequence.maxBatchSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t AsyncTransformedArraySequence.maxBatchSize.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*AsyncTransformedArraySequence.maxBatchSize.modify())()
{
  return nullsub_1;
}

uint64_t AsyncTransformedArraySequence.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_QWORD *)(a1 + 48) = v5;
  swift_retain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t AsyncTransformedArraySequence.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_2443E67EC()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((sub_244406F30() & 1) != 0 || (v1 = *(_QWORD **)(v0 + 24), v2 = v1[6], v3 = v1[4], v2 >= *(_QWORD *)(v3 + 16)))
  {
    v8 = 0;
  }
  else
  {
    v4 = *(uint64_t **)(v0 + 16);
    v5 = v3 + 16 * v2;
    v6 = *(_QWORD *)(v5 + 32);
    v7 = *(_QWORD *)(v5 + 40);
    v1[6] = v2 + 1;
    v8 = sub_2443E5268(v1[2], v1[3], v6, v7, v4[2], v1[5], v4[2], v4[3], v4[4], v4[5], v4[6]);
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

uint64_t sub_2443E6878@<X0>(uint64_t a1@<X8>)
{
  AsyncTransformedArraySequence.makeAsyncIterator()(a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_2443E68B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = sub_2443E6ED8;
  v5[2] = a2;
  v5[3] = v2;
  return swift_task_switch();
}

uint64_t sub_2443E6918()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2443E6ED0;
  return sub_244406F24();
}

void sub_2443E699C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  sub_2443E4944(a1, a2, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(_BYTE *)(v2 + 72), *(_QWORD *)(v2 + 80), *(_BYTE **)(v2 + 88), *(_QWORD *)(v2 + 16));
}

void sub_2443E69D8()
{
  JUMPOUT(0x24950E66CLL);
}

uint64_t sub_2443E69E8()
{
  return MEMORY[0x24BEE40A8];
}

void sub_2443E69F4()
{
  JUMPOUT(0x24950E66CLL);
}

uint64_t sub_2443E6A04()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for ColumnChunk(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

_QWORD *sub_2443E6A40(_QWORD *a1, _QWORD *a2)
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
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2443E6A94(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
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

uint64_t sub_2443E6B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t sub_2443E6B90(uint64_t a1, int a2)
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

uint64_t sub_2443E6BD8(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for AsyncArraySequence(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncArraySequence);
}

uint64_t sub_2443E6C30()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2443E6C38()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443E6C68(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2443E6CCC(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  return a1;
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

uint64_t sub_2443E6D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  return a1;
}

uint64_t sub_2443E6DD8(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2443E6E20(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for AsyncTransformedArraySequence()
{
  JUMPOUT(0x24950E624);
}

void sub_2443E6E78(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  sub_2443E6184(a1, a2, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_BYTE **)(v2 + 64), *(_QWORD *)(v2 + 16));
}

uint64_t sub_2443E6EA8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2443E6EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 947154537 && v14 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(947154505, 0xE400000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F0CA8(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(947154537, 0xE400000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443E7810(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3631746E69 && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x3631746E49, 0xE500000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F134C(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x3631746E69, 0xE500000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443E8150(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3233746E69 && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x3233746E49, 0xE500000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F1A00(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x3233746E69, 0xE500000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443E8A90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3436746E69 && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x3436746E49, 0xE500000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F20BC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x3436746E69, 0xE500000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443E93D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x38746E6975 && v14 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x38746E4955, 0xE500000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F0CA8(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x38746E6975, 0xE500000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443E9D18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3631746E6975 && v14 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x3631746E4955, 0xE600000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F134C(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x3631746E6975, 0xE600000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443EA660(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3233746E6975 && v14 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x3233746E4955, 0xE600000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F1A00(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x3233746E6975, 0xE600000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443EAFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x3436746E6975 && v14 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x3436746E4955, 0xE600000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F20BC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x3436746E6975, 0xE600000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443EB8F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x363174616F6C66 && v14 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x363174616F6C46, 0xE700000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F134C(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x363174616F6C66, 0xE700000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443EC23C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x323374616F6C66 && v14 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x74616F6C46, 0xE500000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F1A00(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x323374616F6C66, 0xE700000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443ECB90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 0x343674616F6C66 && v14 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(0x656C62756F44, 0xE600000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F20BC(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(0x343674616F6C66, 0xE700000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_2443ED4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  const char *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[2];
  char v47;
  uint64_t v48;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2443D8788();
  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_2443DC1EC(a1, a2), (v8 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v15 = sub_244406D38();
    __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Invalid SchemaElement for label: %s";
LABEL_10:
      _os_log_impl(&dword_2443D2000, v16, v17, v20, v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v19, -1, -1);
      MEMORY[0x24950E6FC](v18, -1, -1);

      return 0;
    }
    goto LABEL_27;
  }
  v9 = *(_QWORD *)(v6 + 56) + 32 * v7;
  v11 = *(_QWORD *)v9;
  v10 = *(_QWORD *)(v9 + 8);
  v12 = *(_BYTE *)(v9 + 16);
  v13 = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LOBYTE(v46[0]) = v12;
  if (FieldType.rawValue.getter() == 1819242338 && v14 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v32 = sub_244406D38();
      __swift_project_value_buffer(v32, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v33 = sub_244406D20();
      v34 = sub_244406FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = swift_slowAlloc();
        v36 = swift_slowAlloc();
        v46[0] = v36;
        *(_DWORD *)v35 = 136315394;
        v48 = sub_2443DABA4(1819242306, 0xE400000000000000, v46);
        sub_244406FE4();
        *(_WORD *)(v35 + 12) = 2080;
        swift_bridgeObjectRetain();
        v37 = sub_2443DA7D0(v11, v10, v12, v13);
        v39 = v38;
        swift_bridgeObjectRelease();
        v48 = sub_2443DABA4(v37, v39, v46);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v33, v34, "Invalid array type: %s for schema: %s", (uint8_t *)v35, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v36, -1, -1);
        MEMORY[0x24950E6FC](v35, -1, -1);

        return 0;
      }

      goto LABEL_28;
    }
  }
  v22 = sub_2443D9C34(a1, a2);
  if (v22 <= 0)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid rows for label: %s";
      goto LABEL_10;
    }
LABEL_27:

LABEL_28:
    swift_bridgeObjectRelease_n();
    return 0;
  }
  v23 = v22;
  swift_bridgeObjectRetain();
  v24 = sub_2443D8A88();
  if (!*(_QWORD *)(v24 + 16) || (v25 = sub_2443DC1EC(a1, a2), (v26 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v29 = sub_244406D38();
    __swift_project_value_buffer(v29, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v16 = sub_244406D20();
    v17 = sub_244406FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v46[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v48 = sub_2443DABA4(a1, a2, v46);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v20 = "Found no valid indices for label: %s";
      goto LABEL_10;
    }
    goto LABEL_27;
  }
  v27 = *(_QWORD **)(*(_QWORD *)(v24 + 56) + 8 * v25);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v28 = v13 * v23;
  if ((unsigned __int128)(v13 * (__int128)v23) >> 64 != (v13 * v23) >> 63)
  {
    __break(1u);
    goto LABEL_45;
  }
  v47 = 0;
  if ((v28 & 0x8000000000000000) == 0)
  {
    if (v28)
    {
      a2 = sub_244406EC4();
      *(_QWORD *)(a2 + 16) = v28;
    }
    else
    {
      a2 = MEMORY[0x24BEE4AF8];
    }
    v48 = 0;
    v46[0] = a2 + 32;
    v46[1] = v13 * v23;
    sub_2443F0CA8(v46, &v48, v27, v3, v11, v10, v12, v13, &v47);
    if (v28 >= v48)
    {
      *(_QWORD *)(a2 + 16) = v48;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) != 0)
      {
        if (qword_25735DB50 == -1)
          goto LABEL_40;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    swift_once();
LABEL_40:
    v40 = sub_244406D38();
    __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v41 = sub_244406D20();
    v42 = sub_244406FA8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      v44 = swift_slowAlloc();
      v46[0] = v44;
      *(_DWORD *)v43 = 134218242;
      v48 = *(_QWORD *)(a2 + 16);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v48 = sub_2443DABA4(1819242338, 0xE400000000000000, v46);
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v41, v42, "Loaded array of %ld elements of type %s.", (uint8_t *)v43, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v44, -1, -1);
      MEMORY[0x24950E6FC](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    return a2;
  }
  sub_2444070EC();
  __break(1u);
  *(_QWORD *)(a2 + 16) = v45;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t PlanksReader.readDataFrame(label:columns:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X8>)
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFB0);
  v99 = *(_QWORD *)(v8 - 8);
  v100 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v98 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFB8);
  v96 = *(_QWORD *)(v10 - 8);
  v97 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v95 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFC0);
  v93 = *(_QWORD *)(v12 - 8);
  v94 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v92 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFC8);
  v90 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v89 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFD0);
  v87 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v86 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFD8);
  v84 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v83 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFE0);
  v81 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v80 = (char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFE8);
  v78 = *(_QWORD *)(v79 - 8);
  MEMORY[0x24BDAC7A8](v79);
  v77 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFF0);
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v74 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DFF8);
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v71 = (char *)&v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E000);
  v69 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v68 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E008);
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v65 = (char *)&v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_244406BDC();
  v105 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v26 = sub_2443F0B48(a3, a1, a2);
  swift_bridgeObjectRelease();
  v27 = swift_bridgeObjectRetain();
  v28 = sub_2443DD658(v27);
  swift_bridgeObjectRelease();
  v29 = sub_2443D8650();
  v30 = sub_2443EF2E0(v29, v28);
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_244406BD0();
    v31 = *(_QWORD *)(a3 + 16);
    if (v31)
    {
      v101 = v25;
      v32 = *(_QWORD *)(v26 + 16);
      if (v32)
      {
        v63 = v23;
        v64 = a4;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v33 = 0;
        a4 = 0;
        v107 = v32 - 1;
        v108 = v31 - 1;
        *(_QWORD *)&v34 = 136315138;
        v103 = v34;
        v102 = MEMORY[0x24BEE4AD8] + 8;
        v106 = a3;
        while (1)
        {
          v35 = *(_QWORD *)(v26 + v33 + 32);
          v36 = *(_QWORD *)(v26 + v33 + 40);
          swift_bridgeObjectRetain_n();
          v37 = sub_2443D8788();
          if (*(_QWORD *)(v37 + 16))
          {
            v38 = sub_2443DC1EC(v35, v36);
            if ((v39 & 1) != 0)
            {
              v40 = *(_QWORD *)(v37 + 56) + 32 * v38;
              v41 = *(unsigned __int8 *)(v40 + 16);
              v104 = *(_QWORD *)(v40 + 8);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              __asm { BR              X8 }
            }
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (qword_25735DB50 != -1)
            swift_once();
          v42 = sub_244406D38();
          __swift_project_value_buffer(v42, (uint64_t)qword_2573610D0);
          swift_bridgeObjectRetain();
          v43 = sub_244406D20();
          v44 = sub_244406FB4();
          if (os_log_type_enabled(v43, v44))
          {
            v45 = swift_slowAlloc();
            v46 = swift_slowAlloc();
            v110 = v46;
            *(_DWORD *)v45 = v103;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v45 + 4) = sub_2443DABA4(v35, v36, &v110);
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_2443D2000, v43, v44, "Invalid schema element: %s", (uint8_t *)v45, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24950E6FC](v46, -1, -1);
            v47 = v45;
            a3 = v106;
            MEMORY[0x24950E6FC](v47, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          if (v108 == a4 || v107 == a4)
            break;
          v23 = *(_QWORD *)(a3 + v33 + 48);
          v48 = *(_QWORD *)(v26 + 16);
          swift_bridgeObjectRetain();
          ++a4;
          v33 += 16;
          if (a4 >= v48)
          {
            __break(1u);
            goto LABEL_30;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        a4 = v64;
        v23 = v63;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v25 = v101;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v62 = v105;
    (*(void (**)(unint64_t, char *, uint64_t))(v105 + 32))(a4, v25, v23);
    return (*(uint64_t (**)(unint64_t, _QWORD, uint64_t, uint64_t))(v62 + 56))(a4, 0, 1, v23);
  }
  else
  {
    swift_bridgeObjectRelease();
    v49 = sub_2443D8650();
    v50 = sub_2443F048C(v28, v49);
    if (*(_QWORD *)(v50 + 16) <= *(_QWORD *)(v28 + 16) >> 3)
    {
      v110 = v28;
      sub_2443EF5D0(v50);
    }
    else
    {
      sub_2443EF764(v50, v28);
    }
    swift_release();
    if (qword_25735DB50 != -1)
LABEL_30:
      swift_once();
    v51 = sub_244406D38();
    __swift_project_value_buffer(v51, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v52 = sub_244406D20();
    v53 = sub_244406FB4();
    if (os_log_type_enabled(v52, v53))
    {
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = swift_slowAlloc();
      v64 = a4;
      v56 = v55;
      v110 = v55;
      *(_DWORD *)v54 = 136315138;
      swift_bridgeObjectRetain();
      v57 = sub_244406F3C();
      v59 = v58;
      swift_bridgeObjectRelease();
      v109 = sub_2443DABA4(v57, v59, &v110);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2443D2000, v52, v53, "Request columns not available in Planks file: %s", v54, 0xCu);
      swift_arrayDestroy();
      v60 = v56;
      a4 = v64;
      MEMORY[0x24950E6FC](v60, -1, -1);
      MEMORY[0x24950E6FC](v54, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v105 + 56))(a4, 1, 1, v23);
  }
}

void *sub_2443EEF9C()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE00);
  v2 = *v0;
  v3 = sub_244407038();
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
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_2443EF14C()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DDF8);
  v2 = *v0;
  v3 = sub_244407038();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2443EF2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t i;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
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
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (*(_QWORD *)(a1 + 16) < *(_QWORD *)(a2 + 16))
    return 0;
  v3 = a2;
  v4 = a1;
  v31 = a2 + 56;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a2 + 56);
  v30 = (unint64_t)(63 - v5) >> 6;
  v32 = a1 + 56;
  result = swift_bridgeObjectRetain();
  for (i = 0; ; i = v12)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (i << 6);
      v12 = i;
      if (!*(_QWORD *)(v4 + 16))
        goto LABEL_40;
      goto LABEL_25;
    }
    v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v13 >= v30)
      goto LABEL_41;
    v14 = *(_QWORD *)(v31 + 8 * v13);
    v12 = i + 1;
    if (!v14)
    {
      v12 = i + 2;
      if (i + 2 >= v30)
        goto LABEL_41;
      v14 = *(_QWORD *)(v31 + 8 * v12);
      if (!v14)
      {
        v12 = i + 3;
        if (i + 3 >= v30)
          goto LABEL_41;
        v14 = *(_QWORD *)(v31 + 8 * v12);
        if (!v14)
          break;
      }
    }
LABEL_24:
    v7 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(_QWORD *)(v4 + 16))
    {
LABEL_40:
      v2 = 0;
      goto LABEL_42;
    }
LABEL_25:
    v16 = v3;
    v17 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v19 = *v17;
    v18 = v17[1];
    sub_244407278();
    swift_bridgeObjectRetain();
    sub_244406DF8();
    v20 = sub_244407290();
    v21 = v4;
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = v20 & ~v22;
    if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
      goto LABEL_39;
    v24 = *(_QWORD *)(v21 + 48);
    v25 = (_QWORD *)(v24 + 16 * v23);
    v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_244407224() & 1) == 0)
    {
      v27 = ~v22;
      while (1)
      {
        v23 = (v23 + 1) & v27;
        if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          break;
        v28 = (_QWORD *)(v24 + 16 * v23);
        v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_244407224() & 1) != 0)
          goto LABEL_7;
      }
LABEL_39:
      swift_bridgeObjectRelease();
      v2 = 0;
LABEL_42:
      sub_2443DDCD0();
      return v2;
    }
LABEL_7:
    result = swift_bridgeObjectRelease();
    v3 = v16;
    v4 = v21;
  }
  v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_41:
    v2 = 1;
    goto LABEL_42;
  }
  v14 = *(_QWORD *)(v31 + 8 * v15);
  if (v14)
  {
    v12 = i + 4;
    goto LABEL_24;
  }
  while (1)
  {
    v12 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v12 >= v30)
      goto LABEL_41;
    v14 = *(_QWORD *)(v31 + 8 * v12);
    ++v15;
    if (v14)
      goto LABEL_24;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_2443EF5D0(uint64_t result)
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
    sub_2443EFBCC(v12, v13);
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

uint64_t sub_2443EF764(uint64_t a1, uint64_t a2)
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
  v43 = *MEMORY[0x24BDAC8D0];
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
                  sub_2443DDCD0();
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
      sub_244407278();
      swift_bridgeObjectRetain();
      sub_244406DF8();
      v19 = sub_244407290();
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
    if (v24 || (sub_244407224() & 1) != 0)
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
      while (!v27 && (sub_244407224() & 1) == 0);
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
      MEMORY[0x24BDAC7A8](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_2443EFD58((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_2443DDCD0();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_2443EFD58((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_2443DDCD0();
      MEMORY[0x24950E6FC](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_2443EFBCC(uint64_t a1, uint64_t a2)
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
  sub_244407278();
  swift_bridgeObjectRetain();
  sub_244406DF8();
  v6 = sub_244407290();
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
  if (!v11 && (sub_244407224() & 1) == 0)
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
    while (!v17 && (sub_244407224() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2443EEF9C();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_2443F02C8(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_2443EFD58(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
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
                  return sub_2443F0034(v38, a2, v37, a3);
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
        sub_244407278();
        swift_bridgeObjectRetain();
        sub_244406DF8();
        v22 = sub_244407290();
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
      if (!v29 && (sub_244407224() & 1) == 0)
      {
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_244407224() & 1) != 0)
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
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_2443F0034(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE00);
  result = sub_244407050();
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
    sub_244407278();
    swift_bridgeObjectRetain();
    sub_244406DF8();
    result = sub_244407290();
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

unint64_t sub_2443F02C8(unint64_t result)
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
    v8 = sub_24440702C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_244407278();
        swift_bridgeObjectRetain();
        sub_244406DF8();
        v10 = sub_244407290();
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

uint64_t sub_2443F048C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_2443F060C((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_2443F060C((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x24950E6FC](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_2443F060C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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
        sub_244407278();
        swift_bridgeObjectRetain();
        sub_244406DF8();
        v20 = sub_244407290();
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
      if (!v27 && (sub_244407224() & 1) == 0)
      {
        v28 = ~v21;
        for (i = v22 + 1; ; i = v30 + 1)
        {
          v30 = i & v28;
          if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
            break;
          v31 = (_QWORD *)(v25 + 16 * v30);
          v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_244407224() & 1) != 0)
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
    sub_244407278();
    swift_bridgeObjectRetain();
    sub_244406DF8();
    v47 = sub_244407290();
    v48 = -1 << *(_BYTE *)(v4 + 32);
    v49 = v47 & ~v48;
    if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
      goto LABEL_46;
    v50 = *(_QWORD *)(a4 + 48);
    v51 = (_QWORD *)(v50 + 16 * v49);
    v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_244407224() & 1) != 0)
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
        return sub_2443F0034(v57, a2, v61, v5);
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
        if (v55 || (sub_244407224() & 1) != 0)
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

uint64_t sub_2443F0B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v13;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_2443F7D44(0, v3, 0);
    v4 = v13;
    v7 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_244406E04();
      sub_244406E04();
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v13 + 16);
      v8 = *(_QWORD *)(v13 + 24);
      if (v9 >= v8 >> 1)
        sub_2443F7D44(v8 > 1, v9 + 1, 1);
      v7 += 16;
      *(_QWORD *)(v13 + 16) = v9 + 1;
      v10 = v13 + 16 * v9;
      *(_QWORD *)(v10 + 32) = a2;
      *(_QWORD *)(v10 + 40) = a3;
      --v3;
    }
    while (v3);
  }
  return v4;
}

uint64_t sub_2443F0C68(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_2443F0CA8(uint64_t *a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, _BYTE *a9)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v9 = a3[2];
  if (!v9)
  {
LABEL_45:
    *a9 = 1;
    return;
  }
  v11 = a3[4];
  if (v11 < 0
    || (v12 = *(_QWORD *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        v13 = *(_QWORD *)(v12 + 16),
        v11 >= v13))
  {
LABEL_27:
    if (qword_25735DB50 == -1)
    {
LABEL_28:
      v30 = sub_244406D38();
      __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
      v31 = sub_244406D20();
      v32 = sub_244406FB4();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_2443D2000, v31, v32, "Invalid index", v33, 2u);
        v34 = (uint64_t)v33;
        goto LABEL_30;
      }
LABEL_31:

      return;
    }
LABEL_55:
    swift_once();
    goto LABEL_28;
  }
  v17 = a3[5];
  v47 = v12 + 32;
  v48 = *a1;
  v45 = a1[1];
  v46 = *(_QWORD *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
  swift_bridgeObjectRetain();
  v18 = 0;
  v19 = (char)(a7 - 1);
  v20 = a3 + 7;
  while (1)
  {
    if (v11 >= v13)
    {
      __break(1u);
LABEL_50:
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    if (v17 < 0 || (v21 = v47 + 40 * v11, v22 = *(_QWORD *)(v21 + 8), v17 >= *(_QWORD *)(v22 + 16)))
    {
LABEL_26:
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
    v23 = *(_QWORD *)(v21 + 32);
    v24 = a8 * v23;
    if ((unsigned __int128)(a8 * (__int128)v23) >> 64 != (a8 * v23) >> 63)
      goto LABEL_50;
    if (v19 > 9)
      v25 = 1;
    else
      v25 = qword_244407D60[v19];
    if ((unsigned __int128)(v24 * (__int128)v25) >> 64 != (v24 * v25) >> 63)
      goto LABEL_51;
    v26 = *(_QWORD *)(v22 + (v17 << 6) + 56);
    if (v26 != v24 * v25)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 == -1)
        goto LABEL_33;
      goto LABEL_57;
    }
    v27 = v18 + v26;
    if (__OFADD__(v18, v26))
      goto LABEL_52;
    if (!v48)
    {
      if (v27 > 0)
      {
LABEL_35:
        swift_bridgeObjectRelease();
        if (qword_25735DB50 != -1)
          swift_once();
        v39 = sub_244406D38();
        __swift_project_value_buffer(v39, (uint64_t)qword_2573610D0);
        v31 = sub_244406D20();
        v40 = sub_244406FB4();
        if (!os_log_type_enabled(v31, v40))
          goto LABEL_31;
        v41 = swift_slowAlloc();
        *(_DWORD *)v41 = 134218240;
        sub_244406FE4();
        *(_WORD *)(v41 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v31, v40, "Failed at computing chunk offset: %ld vs %ld ", (uint8_t *)v41, 0x16u);
        v38 = v41;
      }
      else
      {
        if (v27 >= v18)
          goto LABEL_21;
        __break(1u);
LABEL_57:
        swift_once();
LABEL_33:
        v35 = sub_244406D38();
        __swift_project_value_buffer(v35, (uint64_t)qword_2573610D0);
        swift_bridgeObjectRetain();
        v31 = sub_244406D20();
        v36 = sub_244406FB4();
        if (!os_log_type_enabled(v31, v36))
          goto LABEL_46;
        v37 = swift_slowAlloc();
        *(_DWORD *)v37 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v31, v36, "Found invalid chunk: %lld vs %ld", (uint8_t *)v37, 0x16u);
        v38 = v37;
      }
      MEMORY[0x24950E6FC](v38, -1, -1);

      return;
    }
    if (v45 < v27)
      goto LABEL_35;
    if (v27 < v18)
      goto LABEL_54;
LABEL_21:
    swift_bridgeObjectRetain();
    sub_244406D50();
    if ((v28 & 1) != 0)
      break;
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v24))
      goto LABEL_53;
    *a2 += v24;
    if (!--v9)
    {
      swift_bridgeObjectRelease();
      goto LABEL_45;
    }
    v11 = *(v20 - 1);
    v19 = (char)(a7 - 1);
    if ((v11 & 0x8000000000000000) == 0)
    {
      v29 = *v20;
      v20 += 2;
      v17 = v29;
      v13 = *(_QWORD *)(v46 + 16);
      v18 = v27;
      if (v11 < v13)
        continue;
    }
    goto LABEL_26;
  }
  sub_2443DAC74();
  swift_willThrowTypedImpl();
  swift_bridgeObjectRelease();
  if (qword_25735DB50 != -1)
    swift_once();
  v42 = sub_244406D38();
  __swift_project_value_buffer(v42, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain();
  v31 = sub_244406D20();
  v43 = sub_244406FB4();
  if (os_log_type_enabled(v31, v43))
  {
    v44 = swift_slowAlloc();
    *(_DWORD *)v44 = 134218240;
    swift_bridgeObjectRelease();
    sub_244406FE4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2048;
    sub_244406FE4();
    _os_log_impl(&dword_2443D2000, v31, v43, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v44, 0x16u);
    v34 = v44;
LABEL_30:
    MEMORY[0x24950E6FC](v34, -1, -1);
    goto LABEL_31;
  }
LABEL_46:

  swift_bridgeObjectRelease_n();
}

void sub_2443F134C(uint64_t *a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, _BYTE *a9)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v9 = a1[1];
  if (v9 + 0x4000000000000000 < 0)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v11 = a3[2];
  if (!v11)
    goto LABEL_46;
  v12 = a3[4];
  if (v12 < 0
    || (v13 = *(_QWORD *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        v14 = *(_QWORD *)(v13 + 16),
        v12 >= v14))
  {
LABEL_28:
    if (qword_25735DB50 == -1)
    {
LABEL_29:
      v31 = sub_244406D38();
      __swift_project_value_buffer(v31, (uint64_t)qword_2573610D0);
      v32 = sub_244406D20();
      v33 = sub_244406FB4();
      if (!os_log_type_enabled(v32, v33))
      {
LABEL_32:

        return;
      }
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2443D2000, v32, v33, "Invalid index", v34, 2u);
      v35 = (uint64_t)v34;
LABEL_31:
      MEMORY[0x24950E6FC](v35, -1, -1);
      goto LABEL_32;
    }
LABEL_57:
    swift_once();
    goto LABEL_29;
  }
  v18 = a3[5];
  v47 = *a1;
  v46 = 2 * v9;
  swift_bridgeObjectRetain();
  v19 = 0;
  v20 = (char)(a7 - 1);
  v21 = a3 + 7;
  while (1)
  {
    if (v12 >= v14)
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    if (v18 < 0 || (v22 = v13 + 32 + 40 * v12, v23 = *(_QWORD *)(v22 + 8), v18 >= *(_QWORD *)(v23 + 16)))
    {
LABEL_27:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    v24 = *(_QWORD *)(v22 + 32);
    v25 = a8 * v24;
    if ((unsigned __int128)(a8 * (__int128)v24) >> 64 != (a8 * v24) >> 63)
      goto LABEL_51;
    if (v20 > 9)
      v26 = 1;
    else
      v26 = qword_244407D60[v20];
    if ((unsigned __int128)(v25 * (__int128)v26) >> 64 != (v25 * v26) >> 63)
      goto LABEL_52;
    v27 = *(_QWORD *)(v23 + (v18 << 6) + 56);
    if (v27 != v25 * v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 == -1)
        goto LABEL_34;
      goto LABEL_59;
    }
    v28 = v19 + v27;
    if (__OFADD__(v19, v27))
      goto LABEL_53;
    if (!v47)
    {
      if (v28 > 0)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        if (qword_25735DB50 != -1)
          swift_once();
        v40 = sub_244406D38();
        __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
        v32 = sub_244406D20();
        v41 = sub_244406FB4();
        if (!os_log_type_enabled(v32, v41))
          goto LABEL_32;
        v42 = swift_slowAlloc();
        *(_DWORD *)v42 = 134218240;
        sub_244406FE4();
        *(_WORD *)(v42 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v41, "Failed at computing chunk offset: %ld vs %ld ", (uint8_t *)v42, 0x16u);
        v39 = v42;
      }
      else
      {
        if (v28 >= v19)
          goto LABEL_22;
        __break(1u);
LABEL_59:
        swift_once();
LABEL_34:
        v36 = sub_244406D38();
        __swift_project_value_buffer(v36, (uint64_t)qword_2573610D0);
        swift_bridgeObjectRetain();
        v32 = sub_244406D20();
        v37 = sub_244406FB4();
        if (!os_log_type_enabled(v32, v37))
          goto LABEL_47;
        v38 = swift_slowAlloc();
        *(_DWORD *)v38 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v37, "Found invalid chunk: %lld vs %ld", (uint8_t *)v38, 0x16u);
        v39 = v38;
      }
      MEMORY[0x24950E6FC](v39, -1, -1);

      return;
    }
    if (v46 < v28)
      goto LABEL_36;
    if (v28 < v19)
      goto LABEL_56;
LABEL_22:
    swift_bridgeObjectRetain();
    sub_244406D50();
    if ((v29 & 1) != 0)
    {
      sub_2443DAC74();
      swift_willThrowTypedImpl();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 != -1)
        swift_once();
      v43 = sub_244406D38();
      __swift_project_value_buffer(v43, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v32 = sub_244406D20();
      v44 = sub_244406FB4();
      if (os_log_type_enabled(v32, v44))
      {
        v45 = swift_slowAlloc();
        *(_DWORD *)v45 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v44, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v45, 0x16u);
        v35 = v45;
        goto LABEL_31;
      }
LABEL_47:

      swift_bridgeObjectRelease_n();
      return;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v25))
      goto LABEL_54;
    *a2 += v25;
    if (!--v11)
      break;
    v12 = *(v21 - 1);
    v20 = (char)(a7 - 1);
    if ((v12 & 0x8000000000000000) == 0)
    {
      v30 = *v21;
      v21 += 2;
      v18 = v30;
      v14 = *(_QWORD *)(v13 + 16);
      v19 = v28;
      if (v12 < v14)
        continue;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_46:
  *a9 = 1;
}

void sub_2443F1A00(uint64_t *a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, _BYTE *a9)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v9 = a1[1];
  if ((unint64_t)(v9 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v11 = a3[2];
  if (!v11)
    goto LABEL_46;
  v12 = a3[4];
  if (v12 < 0
    || (v13 = *(_QWORD *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        v14 = *(_QWORD *)(v13 + 16),
        v12 >= v14))
  {
LABEL_28:
    if (qword_25735DB50 == -1)
    {
LABEL_29:
      v31 = sub_244406D38();
      __swift_project_value_buffer(v31, (uint64_t)qword_2573610D0);
      v32 = sub_244406D20();
      v33 = sub_244406FB4();
      if (!os_log_type_enabled(v32, v33))
      {
LABEL_32:

        return;
      }
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2443D2000, v32, v33, "Invalid index", v34, 2u);
      v35 = (uint64_t)v34;
LABEL_31:
      MEMORY[0x24950E6FC](v35, -1, -1);
      goto LABEL_32;
    }
LABEL_57:
    swift_once();
    goto LABEL_29;
  }
  v18 = a3[5];
  v47 = *a1;
  v46 = 4 * v9;
  swift_bridgeObjectRetain();
  v19 = 0;
  v20 = (char)(a7 - 1);
  v21 = a3 + 7;
  while (1)
  {
    if (v12 >= v14)
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    if (v18 < 0 || (v22 = v13 + 32 + 40 * v12, v23 = *(_QWORD *)(v22 + 8), v18 >= *(_QWORD *)(v23 + 16)))
    {
LABEL_27:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    v24 = *(_QWORD *)(v22 + 32);
    v25 = a8 * v24;
    if ((unsigned __int128)(a8 * (__int128)v24) >> 64 != (a8 * v24) >> 63)
      goto LABEL_51;
    if (v20 > 9)
      v26 = 1;
    else
      v26 = qword_244407D60[v20];
    if ((unsigned __int128)(v25 * (__int128)v26) >> 64 != (v25 * v26) >> 63)
      goto LABEL_52;
    v27 = *(_QWORD *)(v23 + (v18 << 6) + 56);
    if (v27 != v25 * v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 == -1)
        goto LABEL_34;
      goto LABEL_59;
    }
    v28 = v19 + v27;
    if (__OFADD__(v19, v27))
      goto LABEL_53;
    if (!v47)
    {
      if (v28 > 0)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        if (qword_25735DB50 != -1)
          swift_once();
        v40 = sub_244406D38();
        __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
        v32 = sub_244406D20();
        v41 = sub_244406FB4();
        if (!os_log_type_enabled(v32, v41))
          goto LABEL_32;
        v42 = swift_slowAlloc();
        *(_DWORD *)v42 = 134218240;
        sub_244406FE4();
        *(_WORD *)(v42 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v41, "Failed at computing chunk offset: %ld vs %ld ", (uint8_t *)v42, 0x16u);
        v39 = v42;
      }
      else
      {
        if (v28 >= v19)
          goto LABEL_22;
        __break(1u);
LABEL_59:
        swift_once();
LABEL_34:
        v36 = sub_244406D38();
        __swift_project_value_buffer(v36, (uint64_t)qword_2573610D0);
        swift_bridgeObjectRetain();
        v32 = sub_244406D20();
        v37 = sub_244406FB4();
        if (!os_log_type_enabled(v32, v37))
          goto LABEL_47;
        v38 = swift_slowAlloc();
        *(_DWORD *)v38 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v37, "Found invalid chunk: %lld vs %ld", (uint8_t *)v38, 0x16u);
        v39 = v38;
      }
      MEMORY[0x24950E6FC](v39, -1, -1);

      return;
    }
    if (v46 < v28)
      goto LABEL_36;
    if (v28 < v19)
      goto LABEL_56;
LABEL_22:
    swift_bridgeObjectRetain();
    sub_244406D50();
    if ((v29 & 1) != 0)
    {
      sub_2443DAC74();
      swift_willThrowTypedImpl();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 != -1)
        swift_once();
      v43 = sub_244406D38();
      __swift_project_value_buffer(v43, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v32 = sub_244406D20();
      v44 = sub_244406FB4();
      if (os_log_type_enabled(v32, v44))
      {
        v45 = swift_slowAlloc();
        *(_DWORD *)v45 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v44, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v45, 0x16u);
        v35 = v45;
        goto LABEL_31;
      }
LABEL_47:

      swift_bridgeObjectRelease_n();
      return;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v25))
      goto LABEL_54;
    *a2 += v25;
    if (!--v11)
      break;
    v12 = *(v21 - 1);
    v20 = (char)(a7 - 1);
    if ((v12 & 0x8000000000000000) == 0)
    {
      v30 = *v21;
      v21 += 2;
      v18 = v30;
      v14 = *(_QWORD *)(v13 + 16);
      v19 = v28;
      if (v12 < v14)
        continue;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_46:
  *a9 = 1;
}

void sub_2443F20BC(uint64_t *a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, _BYTE *a9)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v9 = a1[1];
  if ((unint64_t)(v9 - 0x1000000000000000) >> 61 != 7)
  {
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  v11 = a3[2];
  if (!v11)
    goto LABEL_46;
  v12 = a3[4];
  if (v12 < 0
    || (v13 = *(_QWORD *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16),
        v14 = *(_QWORD *)(v13 + 16),
        v12 >= v14))
  {
LABEL_28:
    if (qword_25735DB50 == -1)
    {
LABEL_29:
      v31 = sub_244406D38();
      __swift_project_value_buffer(v31, (uint64_t)qword_2573610D0);
      v32 = sub_244406D20();
      v33 = sub_244406FB4();
      if (!os_log_type_enabled(v32, v33))
      {
LABEL_32:

        return;
      }
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2443D2000, v32, v33, "Invalid index", v34, 2u);
      v35 = (uint64_t)v34;
LABEL_31:
      MEMORY[0x24950E6FC](v35, -1, -1);
      goto LABEL_32;
    }
LABEL_57:
    swift_once();
    goto LABEL_29;
  }
  v18 = a3[5];
  v47 = *a1;
  v46 = 8 * v9;
  swift_bridgeObjectRetain();
  v19 = 0;
  v20 = (char)(a7 - 1);
  v21 = a3 + 7;
  while (1)
  {
    if (v12 >= v14)
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    if (v18 < 0 || (v22 = v13 + 32 + 40 * v12, v23 = *(_QWORD *)(v22 + 8), v18 >= *(_QWORD *)(v23 + 16)))
    {
LABEL_27:
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    v24 = *(_QWORD *)(v22 + 32);
    v25 = a8 * v24;
    if ((unsigned __int128)(a8 * (__int128)v24) >> 64 != (a8 * v24) >> 63)
      goto LABEL_51;
    if (v20 > 9)
      v26 = 1;
    else
      v26 = qword_244407D60[v20];
    if ((unsigned __int128)(v25 * (__int128)v26) >> 64 != (v25 * v26) >> 63)
      goto LABEL_52;
    v27 = *(_QWORD *)(v23 + (v18 << 6) + 56);
    if (v27 != v25 * v26)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 == -1)
        goto LABEL_34;
      goto LABEL_59;
    }
    v28 = v19 + v27;
    if (__OFADD__(v19, v27))
      goto LABEL_53;
    if (!v47)
    {
      if (v28 > 0)
      {
LABEL_36:
        swift_bridgeObjectRelease();
        if (qword_25735DB50 != -1)
          swift_once();
        v40 = sub_244406D38();
        __swift_project_value_buffer(v40, (uint64_t)qword_2573610D0);
        v32 = sub_244406D20();
        v41 = sub_244406FB4();
        if (!os_log_type_enabled(v32, v41))
          goto LABEL_32;
        v42 = swift_slowAlloc();
        *(_DWORD *)v42 = 134218240;
        sub_244406FE4();
        *(_WORD *)(v42 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v41, "Failed at computing chunk offset: %ld vs %ld ", (uint8_t *)v42, 0x16u);
        v39 = v42;
      }
      else
      {
        if (v28 >= v19)
          goto LABEL_22;
        __break(1u);
LABEL_59:
        swift_once();
LABEL_34:
        v36 = sub_244406D38();
        __swift_project_value_buffer(v36, (uint64_t)qword_2573610D0);
        swift_bridgeObjectRetain();
        v32 = sub_244406D20();
        v37 = sub_244406FB4();
        if (!os_log_type_enabled(v32, v37))
          goto LABEL_47;
        v38 = swift_slowAlloc();
        *(_DWORD *)v38 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v37, "Found invalid chunk: %lld vs %ld", (uint8_t *)v38, 0x16u);
        v39 = v38;
      }
      MEMORY[0x24950E6FC](v39, -1, -1);

      return;
    }
    if (v46 < v28)
      goto LABEL_36;
    if (v28 < v19)
      goto LABEL_56;
LABEL_22:
    swift_bridgeObjectRetain();
    sub_244406D50();
    if ((v29 & 1) != 0)
    {
      sub_2443DAC74();
      swift_willThrowTypedImpl();
      swift_bridgeObjectRelease();
      if (qword_25735DB50 != -1)
        swift_once();
      v43 = sub_244406D38();
      __swift_project_value_buffer(v43, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v32 = sub_244406D20();
      v44 = sub_244406FB4();
      if (os_log_type_enabled(v32, v44))
      {
        v45 = swift_slowAlloc();
        *(_DWORD *)v45 = 134218240;
        swift_bridgeObjectRelease();
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v45 + 12) = 2048;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v32, v44, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v45, 0x16u);
        v35 = v45;
        goto LABEL_31;
      }
LABEL_47:

      swift_bridgeObjectRelease_n();
      return;
    }
    swift_bridgeObjectRelease();
    if (__OFADD__(*a2, v25))
      goto LABEL_54;
    *a2 += v25;
    if (!--v11)
      break;
    v12 = *(v21 - 1);
    v20 = (char)(a7 - 1);
    if ((v12 & 0x8000000000000000) == 0)
    {
      v30 = *v21;
      v21 += 2;
      v18 = v30;
      v14 = *(_QWORD *)(v13 + 16);
      v19 = v28;
      if (v12 < v14)
        continue;
    }
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_46:
  *a9 = 1;
}

unint64_t sub_2443F2778(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735E220);
  v2 = (_QWORD *)sub_244407128();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 72);
  while (1)
  {
    v5 = *(v4 - 5);
    v6 = *(v4 - 4);
    v8 = *(v4 - 3);
    v7 = *(v4 - 2);
    v9 = *((_BYTE *)v4 - 8);
    v10 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2443DC1EC(v5, v6);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v2[6] + 16 * result);
    *v13 = v5;
    v13[1] = v6;
    v14 = v2[7] + 32 * result;
    *(_QWORD *)v14 = v8;
    *(_QWORD *)(v14 + 8) = v7;
    *(_BYTE *)(v14 + 16) = v9;
    *(_QWORD *)(v14 + 24) = v10;
    v15 = v2[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v4 += 6;
    v2[2] = v17;
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

unint64_t sub_2443F28B4(uint64_t a1)
{
  return sub_2443F28CC(a1, &qword_25735E230);
}

unint64_t sub_2443F28C0(uint64_t a1)
{
  return sub_2443F28CC(a1, &qword_25735E228);
}

unint64_t sub_2443F28CC(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_244407128();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v6 = *(v5 - 2);
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2443DC1EC(v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v8;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
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

unint64_t sub_2443F29E0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735E210);
  v2 = (_QWORD *)sub_244407128();
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
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_2443DC1EC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
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

uint64_t PlanksWriter.filePath.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath;
  v4 = sub_244406DA4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_2443F2B44@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  swift_beginAccess();
  v5 = *v3;
  v4 = v3[1];
  v7 = v3[2];
  v6 = v3[3];
  *a2 = v5;
  a2[1] = v4;
  a2[2] = v7;
  a2[3] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2443F2BB8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v3 = *a1;
  v2 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = (_QWORD *)(*a2 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  swift_beginAccess();
  *v6 = v3;
  v6[1] = v2;
  v6[2] = v4;
  v6[3] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443F2C5C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  swift_beginAccess();
  v5 = *v3;
  v4 = v3[1];
  v7 = v3[2];
  v6 = v3[3];
  *a1 = v5;
  a1[1] = v4;
  a1[2] = v7;
  a1[3] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t PlanksWriter.__allocating_init(filePath:append:)(uint64_t a1, unint64_t a2, int a3)
{
  swift_allocObject();
  return PlanksWriter.init(filePath:append:)(a1, a2, a3);
}

uint64_t PlanksWriter.init(filePath:append:)(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(uint64_t, char *, uint64_t);
  uint64_t inited;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  NSObject *v43;
  os_log_type_t v44;
  BOOL v45;
  uint64_t v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  unint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint8_t *v82;
  int v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  v4 = v3;
  LODWORD(v82) = a3;
  v80 = sub_244406B7C();
  v79 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v8 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244406B94();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_244406DA4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_finalized) = 0;
  swift_bridgeObjectRetain();
  v76 = a1;
  v81 = a2;
  sub_244406DB0();
  v17 = v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath;
  v77 = v14;
  v18 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  v78 = v13;
  v18(v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath, v16, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735E0D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_244407690;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x8000000244409380;
  sub_244406B88();
  sub_2443F39AC((uint64_t)v8);
  v20 = sub_244406B34();
  v22 = v21;
  (*(void (**)(char *, uint64_t))(v79 + 8))(v8, v80);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(_QWORD *)(inited + 48) = v20;
  *(_QWORD *)(inited + 56) = v22;
  v23 = inited;
  LOBYTE(inited) = (_BYTE)v82;
  v24 = sub_2443F29E0(v23);
  v25 = MEMORY[0x24BEE4AF8];
  sub_2443F29E0(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  v26 = (_QWORD *)(v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  *v26 = 1;
  v26[1] = v25;
  v26[2] = v25;
  v26[3] = v24;
  if ((inited & 1) != 0)
    v27 = 520;
  else
    v27 = 1536;
  v83 = 2;
  v84 = v27;
  v85 = 16777652;
  v80 = v17;
  sub_244406D98();
  v80 = v4;
  *(_DWORD *)(v4 + OBJC_IVAR____TtC6Planks12PlanksWriter_fd) = v87;
  if (qword_25735DB50 != -1)
    swift_once();
  v28 = sub_244406D38();
  __swift_project_value_buffer(v28, (uint64_t)qword_2573610D0);
  v29 = v81;
  swift_bridgeObjectRetain_n();
  v30 = sub_244406D20();
  v31 = sub_244406FA8();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v87 = v33;
    *(_DWORD *)v32 = 136315138;
    v29 = v81;
    swift_bridgeObjectRetain();
    v86 = sub_2443DABA4(v76, v29, &v87);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v30, v31, "PlanksWriter file path: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v33, -1, -1);
    MEMORY[0x24950E6FC](v32, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v36 = (char)v82;
  v34 = v80;
  v37 = sub_244406D68();
  v38 = v37;
  if ((v39 & 1) != 0)
  {
    LODWORD(v87) = v37;
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    swift_bridgeObjectRetain();
    v43 = sub_244406D20();
    v44 = sub_244406FB4();
    v45 = os_log_type_enabled(v43, v44);
    v46 = v76;
    if (!v45)
    {

      swift_bridgeObjectRelease_n();
      return v34;
    }
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v87 = v48;
    *(_DWORD *)v47 = 136315138;
    swift_bridgeObjectRetain();
    v86 = sub_2443DABA4(v46, v29, &v87);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v43, v44, "Failed at seeking file: %s", v47, 0xCu);
    swift_arrayDestroy();
    v49 = v48;
    goto LABEL_17;
  }
  v40 = v76;
  if ((v36 & 1) == 0 || !v37)
  {
    sub_2443F6448();
    swift_bridgeObjectRelease();
LABEL_28:
    swift_retain_n();
    v43 = sub_244406D20();
    v65 = sub_244406FA8();
    if (!os_log_type_enabled(v43, v65))
    {

      swift_release_n();
      return v34;
    }
    v47 = (uint8_t *)swift_slowAlloc();
    v66 = swift_slowAlloc();
    v92 = v66;
    *(_DWORD *)v47 = 136315138;
    v82 = v47 + 4;
    v67 = (uint64_t *)(v34 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
    swift_beginAccess();
    v68 = *v67;
    v69 = v67[1];
    v71 = v67[2];
    v70 = v67[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v72 = sub_2443DA640(v68, v69, v71, v70);
    v74 = v73;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v34 = v80;
    swift_bridgeObjectRelease();
    v91 = sub_2443DABA4(v72, v74, &v92);
    sub_244406FE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2443D2000, v43, v65, "PlanksWriter file metadata: %s", v47, 0xCu);
    swift_arrayDestroy();
    v49 = v66;
LABEL_17:
    MEMORY[0x24950E6FC](v49, -1, -1);
    MEMORY[0x24950E6FC](v47, -1, -1);

    return v34;
  }
  v41 = sub_2443DD274();
  if ((v42 & 1) == 0)
  {
    v50 = v41;
    type metadata accessor for PlanksReader();
    static PlanksReader.readMetadata(_:metadataSize:)(v50, (uint64_t)&v87);
    v51 = v88;
    if (v88)
    {
      v52 = v87;
      v53 = v34;
      v54 = v89;
      v55 = v90;
      swift_bridgeObjectRelease();
      v56 = (uint64_t *)(v53 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
      swift_beginAccess();
      *v56 = v52;
      v56[1] = v51;
      v56[2] = v54;
      v56[3] = v55;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v57 = sub_244406D20();
      v58 = sub_244406FA8();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v59 = 134217984;
        v87 = v38;
        sub_244406FE4();
        _os_log_impl(&dword_2443D2000, v57, v58, "PlanksWriter existing file size: %lld", v59, 0xCu);
        MEMORY[0x24950E6FC](v59, -1, -1);
      }

      v34 = v80;
      goto LABEL_28;
    }
  }
  v60 = v81;
  swift_bridgeObjectRetain();
  v61 = sub_244406D20();
  v62 = sub_244406FB4();
  if (os_log_type_enabled(v61, v62))
  {
    v63 = (uint8_t *)swift_slowAlloc();
    v64 = swift_slowAlloc();
    v87 = v64;
    *(_DWORD *)v63 = 136315138;
    swift_bridgeObjectRetain();
    v86 = sub_2443DABA4(v40, v60, &v87);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v61, v62, "Failed at reading existing file: %s", v63, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v64, -1, -1);
    MEMORY[0x24950E6FC](v63, -1, -1);
    swift_release();

  }
  else
  {
    swift_release();

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_2443F39AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, _QWORD, uint64_t);
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v26 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E218);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_244406BAC();
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_244406B70();
  v5 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_244406B58();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_244406B40();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_244406B4C();
  MEMORY[0x24BDAC7A8](v16);
  (*(void (**)(char *, _QWORD))(v18 + 104))((char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BDCE368]);
  v19 = v12;
  v20 = v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDCE348], v19);
  v21 = *(void (**)(char *, _QWORD, uint64_t))(v9 + 104);
  v22 = v29;
  v21(v11, *MEMORY[0x24BDCE388], v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDCE3D0], v28);
  sub_244406BA0();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v3, 1, v22);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v25, v3, v22);
    return sub_244406B64();
  }
  return result;
}

uint64_t static PlanksWriter.initializeFile(fd:)()
{
  return sub_2443F6448();
}

uint64_t PlanksWriter.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_finalized) & 1) == 0)
    sub_2443F3FE8();
  if ((sub_244406D74() & 0x100000000) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
  }
  v1 = v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath;
  v2 = sub_244406DA4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlanksWriter.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_finalized) & 1) == 0)
    sub_2443F3FE8();
  if ((sub_244406D74() & 0x100000000) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
  }
  v1 = v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_filePath;
  v2 = sub_244406DA4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2443F3DE4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;

  v1 = (_QWORD *)sub_2443F2778(MEMORY[0x24BEE4AF8]);
  v2 = v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 16);
  if (!v3)
    return (uint64_t)v1;
  v4 = (_QWORD *)(swift_bridgeObjectRetain() + 56);
  while (1)
  {
    v25 = v3;
    v7 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *((_BYTE *)v4 - 8);
    v9 = *v4;
    swift_bridgeObjectRetain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = sub_2443DC1EC(v7, v6);
    v13 = v1[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      break;
    v16 = v11;
    if (v1[3] >= v15)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v11 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_2443F5954();
        if ((v16 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_2443F4E58(v15, isUniquelyReferenced_nonNull_native);
      v17 = sub_2443DC1EC(v7, v6);
      if ((v16 & 1) != (v18 & 1))
        goto LABEL_20;
      v12 = v17;
      if ((v16 & 1) != 0)
      {
LABEL_3:
        v5 = v1[7] + 32 * v12;
        swift_bridgeObjectRelease();
        *(_QWORD *)v5 = v7;
        *(_QWORD *)(v5 + 8) = v6;
        *(_BYTE *)(v5 + 16) = v8;
        *(_QWORD *)(v5 + 24) = v9;
        goto LABEL_4;
      }
    }
    v1[(v12 >> 6) + 8] |= 1 << v12;
    v19 = (uint64_t *)(v1[6] + 16 * v12);
    *v19 = v7;
    v19[1] = v6;
    v20 = v1[7] + 32 * v12;
    *(_QWORD *)v20 = v7;
    *(_QWORD *)(v20 + 8) = v6;
    *(_BYTE *)(v20 + 16) = v8;
    *(_QWORD *)(v20 + 24) = v9;
    v21 = v1[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_19;
    v1[2] = v23;
    swift_bridgeObjectRetain();
LABEL_4:
    v4 += 4;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 = v25 - 1;
    if (v25 == 1)
    {
      swift_bridgeObjectRelease();
      return (uint64_t)v1;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  result = sub_244407260();
  __break(1u);
  return result;
}

uint64_t sub_2443F3FE8()
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
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint8_t *v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[5];

  v2 = v1;
  v3 = v0;
  v42[4] = *MEMORY[0x24BDAC8D0];
  v4 = sub_244406B7C();
  v40 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (uint64_t)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_244406B94();
  v37 = *(_QWORD *)(v6 - 8);
  v38 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25735DB50 != -1)
    swift_once();
  v9 = sub_244406D38();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2573610D0);
  swift_retain_n();
  v36 = v10;
  v11 = sub_244406D20();
  v12 = sub_244406FA8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v35 = v14;
    *(_DWORD *)v13 = 136315138;
    v42[0] = v14;
    v33 = v13 + 4;
    v34 = v13;
    sub_244406DA4();
    sub_2443DD48C();
    v2 = v1;
    v15 = sub_2444071F4();
    v41 = sub_2443DABA4(v15, v16, v42);
    sub_244406FE4();
    swift_release_n();
    swift_bridgeObjectRelease();
    v17 = v34;
    _os_log_impl(&dword_2443D2000, v11, v12, "PlanksWriter: finalizing %s", v34, 0xCu);
    v18 = v35;
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v18, -1, -1);
    MEMORY[0x24950E6FC](v17, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v19 = v3;
  sub_244406B88();
  v20 = v39;
  sub_2443F39AC(v39);
  v21 = sub_244406B34();
  v23 = v22;
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v20, v4);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v38);
  v24 = (uint64_t *)(v19 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v41 = v24[3];
  v24[3] = 0x8000000000000000;
  sub_2443F57E0(v21, v23, 0xD000000000000014, 0x80000002444093A0, isUniquelyReferenced_nonNull_native);
  v24[3] = v41;
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_244406AD4();
  swift_allocObject();
  sub_244406AC8();
  v26 = *v24;
  v27 = v24[1];
  v29 = v24[2];
  v28 = v24[3];
  v42[0] = v26;
  v42[1] = v27;
  v42[2] = v29;
  v42[3] = v28;
  sub_2443F6548();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_244406ABC();
  if (!v2)
  {
    v32 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __asm { BR              X9 }
  }
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_BYTE *)(v19 + OBJC_IVAR____TtC6Planks12PlanksWriter_finalized) = 1;
  return result;
}

unint64_t sub_2443F4A04()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v1 = v0 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  result = swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = v3 + 40 * v4;
    v6 = *(_QWORD *)(v5 + 8);
    v7 = *(_QWORD *)(v5 + 16);
    v8 = __OFADD__(v6, v7);
    v9 = v6 + v7;
    if (v8)
    {
      __break(1u);
      goto LABEL_9;
    }
  }
  else
  {
    v9 = 4;
  }
  v8 = __OFADD__(v9, 4);
  v10 = v9 + 4;
  if (v8)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v12 = v10 - 1;
  v11 = v10 < 1;
  v13 = v10 + 2;
  if (!v11)
    v13 = v12;
  return v13 & 0xFFFFFFFFFFFFFFFCLL;
}

double sub_2443F4A90@<D0>(uint64_t a1@<X2>, uint64_t a2@<X3>, unint64_t a3@<X4>, char a4@<W5>, uint64_t a5@<X8>)
{
  char v9;
  uint64_t v10;
  char v11;
  double result;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  if ((a4 & 1) != 0)
    a3 = sub_2443F4A04();
  sub_244406D68();
  if ((v9 & 1) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
  }
  v10 = sub_244406D80();
  if ((v11 & 1) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    if (qword_25735DB50 != -1)
      swift_once();
    v13 = sub_244406D38();
    __swift_project_value_buffer(v13, (uint64_t)qword_2573610D0);
    v14 = sub_244406D20();
    v15 = sub_244406FB4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2443D2000, v14, v15, "Failed at writing column chunk data.", v16, 2u);
      MEMORY[0x24950E6FC](v16, -1, -1);
    }

    result = 0.0;
    *(_OWORD *)(a5 + 42) = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
    *(_OWORD *)(a5 + 32) = 0u;
    *(_OWORD *)a5 = 0u;
  }
  else
  {
    *(_QWORD *)a5 = a1;
    *(_QWORD *)(a5 + 8) = a2;
    *(_QWORD *)(a5 + 16) = a3;
    *(_QWORD *)(a5 + 24) = v10;
    *(_QWORD *)(a5 + 40) = 0;
    *(_QWORD *)(a5 + 48) = 0;
    *(_QWORD *)(a5 + 32) = 0;
    *(_WORD *)(a5 + 56) = 12;
    swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_2443F4C3C()
{
  sub_2443F3FE8();
  return swift_release();
}

uint64_t type metadata accessor for PlanksWriter()
{
  uint64_t result;

  result = qword_25735E110;
  if (!qword_25735E110)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2443F4E58(uint64_t a1, char a2)
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  char v42;
  char v43;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735E220);
  v42 = a2;
  v6 = sub_24440711C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v40 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v38 = v2;
  v39 = (unint64_t)(v8 + 63) >> 6;
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
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_33;
      v24 = v40[v13];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_33:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v39)
              goto LABEL_33;
            v24 = v40[v13];
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v5 + 56) + 32 * v21;
    v34 = *(_QWORD *)v33;
    v35 = *(_QWORD *)(v33 + 8);
    v43 = *(_BYTE *)(v33 + 16);
    v36 = *(_QWORD *)(v33 + 24);
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_244407278();
    sub_244406DF8();
    result = sub_244407290();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = *(_QWORD *)(v7 + 56) + 32 * v17;
    *(_QWORD *)v19 = v34;
    *(_QWORD *)(v19 + 8) = v35;
    *(_BYTE *)(v19 + 16) = v43;
    *(_QWORD *)(v19 + 24) = v36;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v37 = 1 << *(_BYTE *)(v5 + 32);
  if (v37 >= 64)
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v37;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2443F5194(uint64_t a1, char a2)
{
  return sub_2443F51AC(a1, a2, &qword_25735E230);
}

uint64_t sub_2443F51A0(uint64_t a1, char a2)
{
  return sub_2443F51AC(a1, a2, &qword_25735E228);
}

uint64_t sub_2443F51AC(uint64_t a1, char a2, uint64_t *a3)
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
  v7 = sub_24440711C();
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
      swift_bridgeObjectRetain();
    }
    sub_244407278();
    sub_244406DF8();
    result = sub_244407290();
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

uint64_t sub_2443F54BC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735E210);
  v42 = a2;
  v6 = sub_24440711C();
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
    sub_244407278();
    sub_244406DF8();
    result = sub_244407290();
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

uint64_t sub_2443F57E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
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
  v14 = sub_2443DC1EC(a3, a4);
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
    sub_2443F5CE4();
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
  sub_2443F54BC(v17, a5 & 1);
  v23 = sub_2443DC1EC(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_244407260();
  __break(1u);
  return result;
}

void *sub_2443F5954()
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
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735E220);
  v2 = *v0;
  v3 = sub_244407110();
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
    v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13)
      goto LABEL_26;
    v29 = *(_QWORD *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      v9 = v28 + 1;
      if (v28 + 1 >= v13)
        goto LABEL_26;
      v29 = *(_QWORD *)(v6 + 8 * v9);
      if (!v29)
        break;
    }
LABEL_25:
    v12 = (v29 - 1) & v29;
    v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = *(_BYTE *)(v21 + 16);
    v25 = *(_QWORD *)(v21 + 24);
    v26 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v26 = v19;
    v26[1] = v18;
    v27 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v27 = v22;
    *(_QWORD *)(v27 + 8) = v23;
    *(_BYTE *)(v27 + 16) = v24;
    *(_QWORD *)(v27 + 24) = v25;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v30 = v28 + 2;
  if (v30 >= v13)
    goto LABEL_26;
  v29 = *(_QWORD *)(v6 + 8 * v30);
  if (v29)
  {
    v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v29 = *(_QWORD *)(v6 + 8 * v9);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2443F5B20()
{
  return sub_2443F5B38(&qword_25735E230);
}

void *sub_2443F5B2C()
{
  return sub_2443F5B38(&qword_25735E228);
}

void *sub_2443F5B38(uint64_t *a1)
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
  v4 = sub_244407110();
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
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_2443F5CE4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735E210);
  v2 = *v0;
  v3 = sub_244407110();
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

uint64_t sub_2443F5E9C(char *a1, int64_t a2)
{
  char *v4;
  size_t v5;
  char *v6;
  uint64_t result;

  if (!a2)
    return MEMORY[0x24BEE4AF8];
  if (a2 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE08);
    v4 = (char *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    *((_QWORD *)v4 + 2) = a2;
    *((_QWORD *)v4 + 3) = 2 * v5 - 64;
    v6 = v4 + 32;
    if (&v4[a2 + 32] <= a1 || v6 >= &a1[a2])
    {
      memcpy(v6, a1, a2);
      return (uint64_t)v4;
    }
  }
  result = sub_244407134();
  __break(1u);
  return result;
}

int64_t sub_2443F5FBC(int64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[2];
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  if (a3)
    v4 = a4 - a3;
  else
    v4 = 0;
  if (result < 0 || (v5 = result, v4 < result))
  {
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a2 < 0 || v4 < a2)
    goto LABEL_24;
  v7 = a2 - result;
  if (a2 == result)
    return MEMORY[0x24BEE4AF8];
  if (v7 <= 0)
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE08);
    v8 = (_QWORD *)swift_allocObject();
    result = _swift_stdlib_malloc_size(v8);
    v8[2] = v7;
    v8[3] = 2 * result - 64;
  }
  v14[0] = v5;
  v14[1] = a2;
  v15 = a3;
  v16 = a4;
  MEMORY[0x24BDAC7A8](result);
  if (a3)
    v11 = a3;
  else
    v11 = 0;
  result = (int64_t)sub_2443F628C(v11, v14, (_QWORD *(*)(__int128 *__return_ptr, uint64_t, _QWORD *))sub_2443F670C, &v17);
  v12 = v14[0] + v18;
  if (__OFADD__(v14[0], v18))
    goto LABEL_25;
  v13 = v16 - v15;
  if (!v15)
    v13 = 0;
  if (v12 < 0 || v13 < v12)
    goto LABEL_26;
  if (v18 == v7)
    return (int64_t)v8;
LABEL_27:
  __break(1u);
  return result;
}

char *sub_2443F6134(char *__src, int64_t a2, char *__dst, int64_t a4)
{
  char *v4;
  size_t v5;
  char *result;

  v4 = __src;
  if (!a2 || !a4)
    return v4;
  if (a2 >= a4)
    v5 = a4;
  else
    v5 = a2;
  if ((v5 & 0x8000000000000000) == 0 && (&__dst[v5] <= __src || &__src[v5] <= __dst))
  {
    memcpy(__dst, __src, v5);
    v4 += v5;
    return v4;
  }
  result = (char *)sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443F6258(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = a4 - a3;
  if (!a3)
    v4 = 0;
  if (result < 0 || v4 < result)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0 && v4 >= a2)
  {
    return a2 - result;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2443F628C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, _QWORD *(*a3)(__int128 *__return_ptr, uint64_t, _QWORD *)@<X3>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *result;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  _OWORD *v19;

  v19 = a4;
  v7 = *a2;
  v8 = a2[1];
  v10 = a2[2];
  v9 = a2[3];
  v11 = sub_2443F6258(0, *a2, v10, v9);
  result = (_QWORD *)sub_2443F6258(v7, v8, v10, v9);
  if (__OFADD__(v11, result))
  {
    __break(1u);
    goto LABEL_10;
  }
  v13 = result;
  if ((uint64_t)result + v11 < v11)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (a1)
    v14 = a1 + v11;
  else
    v14 = 0;
  result = a3(&v17, v14, v13);
  if (!v4)
  {
    v15 = v18;
    v16 = v19;
    *v19 = v17;
    *((_QWORD *)v16 + 2) = v15;
  }
  return result;
}

uint64_t sub_2443F6358(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  _DWORD *v7;

  result = sub_244406AF8();
  if (result)
  {
    result = sub_244406B10();
    if (__OFSUB__(a1, result))
      goto LABEL_8;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  sub_244406B04();
  v5 = sub_244406D80();
  if ((v6 & 1) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    swift_allocError();
    *v7 = v5;
  }
  return v5;
}

uint64_t sub_2443F6448()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  _DWORD *v5;

  v0 = sub_244406D68();
  if ((v1 & 1) != 0)
  {
    v4 = v0;
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    v2 = v4;
    goto LABEL_7;
  }
  if (qword_25735DB58 != -1)
    swift_once();
  v2 = sub_244406D80();
  if ((v3 & 1) != 0)
  {
    sub_2443DAC74();
    swift_willThrowTypedImpl();
LABEL_7:
    swift_allocError();
    *v5 = v2;
  }
  return v2;
}

unint64_t sub_2443F6548()
{
  unint64_t result;

  result = qword_25735E0E0;
  if (!qword_25735E0E0)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for FileMetadata, &type metadata for FileMetadata);
    atomic_store(result, (unint64_t *)&qword_25735E0E0);
  }
  return result;
}

unint64_t sub_2443F658C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25735E088;
  if (!qword_25735E088)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25735E080);
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25735E088);
  }
  return result;
}

uint64_t sub_2443F65D8(uint64_t a1, unint64_t a2)
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

uint64_t sub_2443F6624()
{
  return type metadata accessor for PlanksWriter();
}

uint64_t sub_2443F662C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244406DA4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for PlanksWriter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PlanksWriter.metadata.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of PlanksWriter.__allocating_init(filePath:append:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of PlanksWriter.finalize()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of PlanksWriter.nextChunkOffset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of PlanksWriter.close()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

char *sub_2443F670C@<X0>(char *a1@<X0>, int64_t a2@<X1>, char **a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *result;
  char *v7;
  char *v8;

  result = sub_2443F6134(a1, a2, *(char **)(v3 + 16), *(_QWORD *)(v3 + 24));
  if (!v4)
  {
    *a3 = result;
    a3[1] = v7;
    a3[2] = v8;
  }
  return result;
}

uint64_t PlanksWriter.writeDataFrame(df:label:columnTypes:batchSize:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  int64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  char v53;
  _QWORD *v54;
  _QWORD *v55;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v64;
  char v65;
  __int128 v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  int64_t v74;
  unint64_t v75;
  int64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  unint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  void (*v89)(char *, uint64_t);
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  NSObject *v97;
  os_log_type_t v98;
  _DWORD *v99;
  char *v100;
  uint64_t v101;
  int v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  _QWORD *v107;
  unint64_t v108;
  unint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  NSObject *v112;
  os_log_type_t v113;
  uint8_t *v114;
  NSObject *v115;
  os_log_type_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  BOOL v125;
  uint64_t v126;
  NSObject *v127;
  os_log_type_t v128;
  uint8_t *v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t v136;
  __int128 v137;
  _QWORD *v138;
  _QWORD *v139;
  char v140;
  unint64_t v141;
  unint64_t v142;
  _QWORD *v143;
  char v144;
  _QWORD v145[2];
  __int128 v146;
  __int128 v147;
  uint64_t v148;
  __int128 v149;
  char *v150;
  __int128 v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  int64_t v161;
  void (*v162)(char *, uint64_t);
  uint64_t v163;
  uint64_t v164;
  char *v165;
  unint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  char v184;
  __int128 v185;
  _BYTE v186[24];
  _QWORD *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char v191;
  uint64_t v192;
  char v193;
  _OWORD v194[2];
  uint64_t v195;

  v6 = v5;
  v152 = a5;
  v174 = a3;
  v173 = a2;
  v158 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E238);
  v157 = *(_QWORD *)(v158 - 8);
  MEMORY[0x24BDAC7A8](v158);
  v156 = (char *)v145 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E240);
  MEMORY[0x24BDAC7A8](v155);
  v154 = (char *)v145 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_244406C24();
  v169 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v145 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v178 = sub_244406C00();
  v168 = *(_QWORD *)(v178 - 8);
  v14 = MEMORY[0x24BDAC7A8](v178);
  v16 = (char *)v145 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v180 = (char *)v145 - v17;
  v170 = a1;
  v148 = sub_244406BB8();
  v18 = *(_QWORD *)(a4 + 64);
  v163 = a4 + 64;
  v19 = 1 << *(_BYTE *)(a4 + 32);
  v20 = -1;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  v21 = v20 & v18;
  v159 = v6;
  v22 = (_QWORD *)(v6 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata);
  v23 = v11;
  v176 = a4;
  swift_bridgeObjectRetain();
  v160 = v22;
  swift_beginAccess();
  v24 = 0;
  v162 = (void (*)(char *, uint64_t))((unint64_t)(v19 + 63) >> 6);
  v164 = v11;
  v165 = v13;
  v172 = v16;
  if (!v21)
    goto LABEL_5;
LABEL_4:
  v177 = (v21 - 1) & v21;
  for (i = __clz(__rbit64(v21)) | (v24 << 6); ; i = __clz(__rbit64(v27)) + (v24 << 6))
  {
    LODWORD(v175) = *(unsigned __int8 *)(*(_QWORD *)(v176 + 56) + i);
    v187 = (_QWORD *)v173;
    v188 = v174;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_244406E04();
    sub_244406E04();
    swift_bridgeObjectRelease();
    v30 = v187;
    v29 = v188;
    v31 = v160[1];
    v32 = *(_QWORD *)(v31 + 16);
    v179 = v188;
    v33 = v187;
    if (v32)
    {
      v171 = v24;
      v34 = v160[2];
      v35 = v160[3];
      v187 = (_QWORD *)MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain_n();
      v167 = v34;
      swift_bridgeObjectRetain();
      v166 = v35;
      swift_bridgeObjectRetain();
      sub_2443F7D44(0, v32, 0);
      v36 = v187;
      v37 = (uint64_t *)(v31 + 40);
      do
      {
        v39 = *(v37 - 1);
        v38 = *v37;
        v187 = v36;
        v41 = v36[2];
        v40 = v36[3];
        swift_bridgeObjectRetain();
        if (v41 >= v40 >> 1)
        {
          sub_2443F7D44(v40 > 1, v41 + 1, 1);
          v36 = v187;
        }
        v37 += 4;
        v36[2] = v41 + 1;
        v42 = &v36[2 * v41];
        v42[4] = v39;
        v42[5] = v38;
        --v32;
      }
      while (v32);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      v23 = v164;
      v16 = v172;
      v24 = v171;
      v29 = v179;
      v30 = v33;
    }
    else
    {
      v36 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v43 = v36[2];
    v21 = v177;
    if (v43)
    {
      v44 = (_QWORD *)v36[4] == v30 && v36[5] == v29;
      if (v44 || (v45 = v23, (sub_244407224() & 1) != 0))
      {
LABEL_54:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
      if (v43 != 1)
      {
        if ((_QWORD *)v36[6] == v33 && v36[7] == v179)
          goto LABEL_54;
        v46 = sub_244407224();
        v47 = v179;
        if ((v46 & 1) != 0)
          goto LABEL_54;
        if (v43 != 2)
        {
          v48 = v33;
          v49 = v36 + 9;
          v50 = 2;
          do
          {
            v51 = v50 + 1;
            if (__OFADD__(v50, 1))
              goto LABEL_130;
            if ((_QWORD *)*(v49 - 1) == v48 && *v49 == v47)
              goto LABEL_54;
            v53 = sub_244407224();
            v47 = v179;
            if ((v53 & 1) != 0)
              goto LABEL_54;
            v48 = v33;
            v49 += 2;
            ++v50;
          }
          while (v51 != v43);
        }
      }
      swift_bridgeObjectRelease();
      v23 = v45;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v54 = v160;
    swift_beginAccess();
    v55 = (_QWORD *)v54[1];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v54[1] = v55;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v55 = sub_2443E24A8(0, v55[2] + 1, 1, v55);
      v160[1] = v55;
    }
    v58 = v55[2];
    v57 = v55[3];
    v59 = v179;
    if (v58 >= v57 >> 1)
    {
      v62 = sub_2443E24A8((_QWORD *)(v57 > 1), v58 + 1, 1, v55);
      v60 = v33;
      v59 = v179;
      v55 = v62;
      v160[1] = v62;
    }
    else
    {
      v60 = v33;
    }
    v55[2] = v58 + 1;
    v61 = &v55[4 * v58];
    v61[4] = v60;
    v61[5] = v59;
    *((_BYTE *)v61 + 48) = v175;
    v61[7] = v152;
    swift_endAccess();
    v13 = v165;
    if (v21)
      goto LABEL_4;
LABEL_5:
    v26 = v24 + 1;
    if (__OFADD__(v24, 1))
      goto LABEL_133;
    if (v26 >= (uint64_t)v162)
      goto LABEL_55;
    v27 = *(_QWORD *)(v163 + 8 * v26);
    ++v24;
    if (!v27)
    {
      v24 = v26 + 1;
      if (v26 + 1 >= (uint64_t)v162)
        goto LABEL_55;
      v27 = *(_QWORD *)(v163 + 8 * v24);
      if (!v27)
      {
        v24 = v26 + 2;
        if (v26 + 2 >= (uint64_t)v162)
          goto LABEL_55;
        v27 = *(_QWORD *)(v163 + 8 * v24);
        if (!v27)
          break;
      }
    }
LABEL_18:
    v177 = (v27 - 1) & v27;
  }
  v28 = v26 + 3;
  if (v28 >= (uint64_t)v162)
    goto LABEL_55;
  v27 = *(_QWORD *)(v163 + 8 * v28);
  if (v27)
  {
    v24 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v24 = v28 + 1;
    if (__OFADD__(v28, 1))
      goto LABEL_135;
    if (v24 >= (uint64_t)v162)
      break;
    v27 = *(_QWORD *)(v163 + 8 * v24);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_55:
  swift_release();
  if (!v152)
  {
LABEL_138:
    __break(1u);
    JUMPOUT(0x2443F7D18);
  }
  v187 = 0;
  v188 = v148;
  v189 = v152;
  v190 = 0;
  v191 = 0;
  v192 = 0;
  v193 = 0;
  v153 = OBJC_IVAR____TtC6Planks12PlanksWriter_fd;
  v64 = sub_2443E0F98();
  if ((v65 & 1) != 0)
    return 1;
  v150 = &v184;
  *((_QWORD *)&v66 + 1) = 1;
  v147 = xmmword_244407E10;
  *(_QWORD *)&v66 = 136315138;
  v146 = v66;
  v145[1] = MEMORY[0x24BEE4AD8] + 8;
  *(_QWORD *)&v66 = 134218498;
  v149 = v66;
  *(_QWORD *)&v66 = 136315394;
  v151 = v66;
  while (2)
  {
    if (__OFADD__(v64, v152))
      goto LABEL_136;
    v67 = v148;
    if (v148 >= v64 + v152)
      v67 = v64 + v152;
    if (__OFSUB__(v67, v64))
    {
LABEL_137:
      __break(1u);
      goto LABEL_138;
    }
    if (v67 - v64 < 1)
      return 1;
    v167 = v67;
    v171 = v64;
    v68 = sub_2443F4A04();
    LOBYTE(v185) = 1;
    *((_QWORD *)&v185 + 1) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)v186 = v68;
    v166 = v68;
    *(_OWORD *)&v186[8] = v147;
    v69 = 1 << *(_BYTE *)(v176 + 32);
    if (v69 < 64)
      v70 = ~(-1 << v69);
    else
      v70 = -1;
    v71 = v70 & *(_QWORD *)(v176 + 64);
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v72 = 0;
    v161 = (unint64_t)(v69 + 63) >> 6;
    while (2)
    {
      if (v71)
      {
        v177 = (v71 - 1) & v71;
        v179 = v72;
        v73 = __clz(__rbit64(v71)) | (v72 << 6);
        goto LABEL_86;
      }
      v74 = v72 + 1;
      if (__OFADD__(v72, 1))
        goto LABEL_132;
      if (v74 < v161)
      {
        v75 = *(_QWORD *)(v163 + 8 * v74);
        v76 = v72 + 1;
        if (!v75)
        {
          v76 = v72 + 2;
          if (v72 + 2 >= v161)
            break;
          v75 = *(_QWORD *)(v163 + 8 * v76);
          if (!v75)
          {
            v76 = v72 + 3;
            if (v72 + 3 >= v161)
              break;
            v75 = *(_QWORD *)(v163 + 8 * v76);
            if (!v75)
            {
              v77 = v72 + 4;
              if (v72 + 4 >= v161)
                break;
              v75 = *(_QWORD *)(v163 + 8 * v77);
              if (!v75)
              {
                while (1)
                {
                  v76 = v77 + 1;
                  if (__OFADD__(v77, 1))
                    break;
                  if (v76 >= v161)
                    goto LABEL_111;
                  v75 = *(_QWORD *)(v163 + 8 * v76);
                  ++v77;
                  if (v75)
                    goto LABEL_85;
                }
LABEL_134:
                __break(1u);
LABEL_135:
                __break(1u);
LABEL_136:
                __break(1u);
                goto LABEL_137;
              }
              v76 = v72 + 4;
            }
          }
        }
LABEL_85:
        v177 = (v75 - 1) & v75;
        v179 = v76;
        v73 = __clz(__rbit64(v75)) + (v76 << 6);
LABEL_86:
        v78 = (uint64_t *)(*(_QWORD *)(v176 + 48) + 16 * v73);
        v79 = *v78;
        v80 = v78[1];
        v81 = *(unsigned __int8 *)(*(_QWORD *)(v176 + 56) + v73);
        v181 = v173;
        v182 = v174;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_244406E04();
        sub_244406E04();
        v82 = v181;
        v83 = v182;
        v175 = v79;
        MEMORY[0x24950DD18](v79, v80);
        sub_2443E2B34(&qword_25735E248, (uint64_t (*)(uint64_t))MEMORY[0x24BDF6048], MEMORY[0x24BDF6060]);
        sub_244406F6C();
        if (v183 < v171)
        {
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
          goto LABEL_134;
        }
        v181 = v171;
        v182 = v183;
        sub_244406F90();
        v84 = v13;
        v85 = v13;
        v86 = v23;
        (*(void (**)(char *, uint64_t))(v169 + 8))(v85, v23);
        sub_2443E2B34(&qword_25735E250, (uint64_t (*)(uint64_t))MEMORY[0x24BDF5E78], MEMORY[0x24BDF5E80]);
        v87 = v16;
        v88 = v178;
        sub_244406F54();
        if (v167 < v183)
          goto LABEL_128;
        v181 = v183;
        v182 = v167;
        sub_244406F90();
        v89 = *(void (**)(char *, uint64_t))(v168 + 8);
        v89(v87, v88);
        v90 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 16);
        v91 = v166;
        v23 = v86;
        v13 = v84;
        if (v90)
        {
          v92 = *((_QWORD *)&v185 + 1) + (v90 << 6);
          v94 = *(_QWORD *)(v92 - 16);
          v93 = *(_QWORD *)(v92 - 8);
          v91 = v94 + v93;
          if (__OFADD__(v94, v93))
            goto LABEL_129;
        }
        if (v81)
        {
          v95 = v89;
          swift_bridgeObjectRelease();
          if (qword_25735DB50 != -1)
            swift_once();
          v96 = sub_244406D38();
          __swift_project_value_buffer(v96, (uint64_t)qword_2573610D0);
          swift_bridgeObjectRetain();
          v97 = sub_244406D20();
          v98 = sub_244406FB4();
          if (os_log_type_enabled(v97, v98))
          {
            v99 = (_DWORD *)swift_slowAlloc();
            v181 = swift_slowAlloc();
            *v99 = v151;
            __asm { BR              X9 }
          }
          swift_bridgeObjectRelease_n();

          v95(v180, v178);
          goto LABEL_68;
        }
        v162 = v89;
        v100 = v156;
        sub_244406BF4();
        LOBYTE(v181) = 0;
        sub_2443F7D60(&qword_25735E258, &qword_25735E238, MEMORY[0x24BDF5EE0]);
        v101 = v158;
        sub_244406C0C();
        (*(void (**)(char *, uint64_t))(v157 + 8))(v100, v101);
        sub_2443F7D60(&qword_25735E260, &qword_25735E240, MEMORY[0x24BDF5E50]);
        sub_244406E34();
        v102 = sub_244406D68();
        if ((v103 & 1) != 0)
        {
          LODWORD(v181) = v102;
          sub_2443DAC74();
          swift_willThrowTypedImpl();
        }
        v104 = sub_244406D80();
        v105 = v104;
        if ((v106 & 1) != 0)
        {
          LODWORD(v181) = v104;
          sub_2443DAC74();
          swift_willThrowTypedImpl();
          if (qword_25735DB50 != -1)
            swift_once();
          v111 = sub_244406D38();
          __swift_project_value_buffer(v111, (uint64_t)qword_2573610D0);
          v112 = sub_244406D20();
          v113 = sub_244406FB4();
          if (os_log_type_enabled(v112, v113))
          {
            v114 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v114 = 0;
            _os_log_impl(&dword_2443D2000, v112, v113, "Failed at writing column chunk data.", v114, 2u);
            MEMORY[0x24950E6FC](v114, -1, -1);
          }

          swift_bridgeObjectRelease();
          swift_release();
          swift_bridgeObjectRetain();
          v115 = sub_244406D20();
          v116 = sub_244406FB4();
          if (os_log_type_enabled(v115, v116))
          {
            v117 = swift_slowAlloc();
            v118 = swift_slowAlloc();
            v181 = v118;
            *(_DWORD *)v117 = v149;
            v183 = v171;
            sub_244406FE4();
            *(_WORD *)(v117 + 12) = 2080;
            swift_bridgeObjectRetain();
            v183 = sub_2443DABA4(v175, v80, &v181);
            sub_244406FE4();
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v117 + 22) = 2080;
            LOBYTE(v183) = 0;
            v119 = FieldType.description.getter();
            v183 = sub_2443DABA4(v119, v120, &v181);
            sub_244406FE4();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2443D2000, v115, v116, "Failed at writing batch %ld: %s %s", (uint8_t *)v117, 0x20u);
            swift_arrayDestroy();
            MEMORY[0x24950E6FC](v118, -1, -1);
            MEMORY[0x24950E6FC](v117, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }

          v162(v180, v178);
          v23 = v164;
          v13 = v165;
LABEL_68:
          v16 = v172;
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_release();
          swift_beginAccess();
          v107 = (_QWORD *)*((_QWORD *)&v185 + 1);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v107 = sub_2443E26D4(0, v107[2] + 1, 1, v107);
          v23 = v164;
          v16 = v172;
          v109 = v107[2];
          v108 = v107[3];
          if (v109 >= v108 >> 1)
            v107 = sub_2443E26D4((_QWORD *)(v108 > 1), v109 + 1, 1, v107);
          v107[2] = v109 + 1;
          v110 = &v107[8 * v109];
          v110[4] = v82;
          v110[5] = v83;
          v110[6] = v91;
          v110[7] = v105;
          *((_WORD *)v110 + 32) = 0;
          v110[9] = 0;
          v110[10] = 0;
          *((_WORD *)v110 + 44) = 12;
          *((_QWORD *)&v185 + 1) = v107;
          swift_endAccess();
          v162(v180, v178);
          v13 = v165;
        }
        v72 = v179;
        v71 = v177;
        continue;
      }
      break;
    }
LABEL_111:
    swift_release();
    swift_beginAccess();
    v121 = *(_QWORD *)(*((_QWORD *)&v185 + 1) + 16);
    if (v121)
    {
      v122 = 0;
      v123 = (uint64_t *)(*((_QWORD *)&v185 + 1) + 56);
      while (1)
      {
        v124 = *v123;
        v123 += 8;
        v125 = __OFADD__(v122, v124);
        v122 += v124;
        if (v125)
          goto LABEL_131;
        if (!--v121)
          goto LABEL_117;
      }
    }
    v122 = 0;
LABEL_117:
    *(_QWORD *)&v186[8] = v122;
    if (qword_25735DB50 != -1)
      swift_once();
    v126 = sub_244406D38();
    __swift_project_value_buffer(v126, (uint64_t)qword_2573610D0);
    v127 = sub_244406D20();
    v128 = sub_244406FA8();
    if (os_log_type_enabled(v127, v128))
    {
      v129 = (uint8_t *)swift_slowAlloc();
      v130 = swift_slowAlloc();
      v181 = v130;
      *(_DWORD *)v129 = v146;
      v194[0] = v185;
      v194[1] = *(_OWORD *)v186;
      v195 = *(_QWORD *)&v186[16];
      sub_2443DDBAC((uint64_t)v194);
      v131 = sub_2443DA954();
      v133 = v132;
      sub_2443E6EA8((uint64_t)v194);
      v183 = sub_2443DABA4(v131, v133, &v181);
      sub_244406FE4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2443D2000, v127, v128, "Written rowGroup: %s", v129, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v130, -1, -1);
      MEMORY[0x24950E6FC](v129, -1, -1);
    }

    v134 = v185;
    v135 = *((_QWORD *)&v185 + 1);
    v137 = *(_OWORD *)v186;
    v136 = *(_QWORD *)&v186[16];
    v138 = v160;
    swift_beginAccess();
    v139 = (_QWORD *)v138[2];
    swift_bridgeObjectRetain();
    v140 = swift_isUniquelyReferenced_nonNull_native();
    v138[2] = v139;
    if ((v140 & 1) == 0)
    {
      v139 = sub_2443E25B4(0, v139[2] + 1, 1, v139);
      v160[2] = v139;
    }
    v142 = v139[2];
    v141 = v139[3];
    if (v142 >= v141 >> 1)
    {
      v139 = sub_2443E25B4((_QWORD *)(v141 > 1), v142 + 1, 1, v139);
      v160[2] = v139;
    }
    v139[2] = v142 + 1;
    v143 = &v139[5 * v142];
    *((_BYTE *)v143 + 32) = v134;
    v143[5] = v135;
    *((_OWORD *)v143 + 3) = v137;
    v143[8] = v136;
    swift_endAccess();
    swift_bridgeObjectRelease();
    v64 = sub_2443E0F98();
    v13 = v165;
    v23 = v164;
    if ((v144 & 1) == 0)
      continue;
    return 1;
  }
}

uint64_t sub_2443F7D44(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2443F7DD8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2443F7D60(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24950E66C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2443F7DA0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2443F7F40(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2443F7DBC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2443F809C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2443F7DD8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE60);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  result = sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443F7F40(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735DB60);
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
  result = sub_244407134();
  __break(1u);
  return result;
}

uint64_t sub_2443F809C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E268);
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244407134();
  __break(1u);
  return result;
}

unint64_t sub_2443F81E8(uint64_t a1)
{
  unint64_t result;

  result = sub_2443F820C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2443F820C()
{
  unint64_t result;

  result = qword_25735E270;
  if (!qword_25735E270)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for FileMetadata, &type metadata for FileMetadata);
    atomic_store(result, (unint64_t *)&qword_25735E270);
  }
  return result;
}

uint64_t sub_2443F8250()
{
  uint64_t *v0;

  return sub_2443DA640(*v0, v0[1], v0[2], v0[3]);
}

unint64_t sub_2443F825C(uint64_t a1)
{
  unint64_t result;

  result = sub_2443F8280();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2443F8280()
{
  unint64_t result;

  result = qword_25735E278;
  if (!qword_25735E278)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for RowGroup, &type metadata for RowGroup);
    atomic_store(result, (unint64_t *)&qword_25735E278);
  }
  return result;
}

uint64_t sub_2443F82C4()
{
  return sub_2443DA954();
}

unint64_t sub_2443F82FC(uint64_t a1)
{
  unint64_t result;

  result = sub_2443F8320();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2443F8320()
{
  unint64_t result;

  result = qword_25735E280;
  if (!qword_25735E280)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ColumnChunk, &type metadata for ColumnChunk);
    atomic_store(result, (unint64_t *)&qword_25735E280);
  }
  return result;
}

uint64_t sub_2443F8364()
{
  return sub_2443DA4D4();
}

unint64_t sub_2443F83A4(uint64_t a1)
{
  unint64_t result;

  result = sub_2443F83C8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2443F83C8()
{
  unint64_t result;

  result = qword_25735E288;
  if (!qword_25735E288)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for SchemaElement, &type metadata for SchemaElement);
    atomic_store(result, (unint64_t *)&qword_25735E288);
  }
  return result;
}

uint64_t sub_2443F840C()
{
  uint64_t v0;

  return sub_2443DA7D0(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t PlanksWriter.writeBatch<A>(_:label:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  void (*v12)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  char v40;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  char v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  _QWORD v68[2];
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int16 v78;

  v6 = v5;
  v12 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 8);
  swift_bridgeObjectRetain();
  v12(&v71, a4, a5);
  v67 = v71;
  v66 = MEMORY[0x24950E018](a1, a4);
  v13 = sub_2443F3DE4();
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    v14 = sub_2443DC1EC(a2, a3);
    if ((v15 & 1) != 0)
    {
      v16 = *(_QWORD *)(v13 + 56) + 32 * v14;
      v18 = *(_QWORD *)v16;
      v17 = *(_QWORD *)(v16 + 8);
      v19 = *(_BYTE *)(v16 + 16);
      v20 = *(_QWORD *)(v16 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v71 = v18;
      v72 = v17;
      LOBYTE(v73) = v19;
      v74 = v20;
      v68[0] = a2;
      v68[1] = a3;
      v69 = v67;
      v70 = v66;
      if (!_s6Planks13SchemaElementV2eeoiySbAC_ACtFZ_0(&v71, v68))
      {
        if (qword_25735DB50 != -1)
          swift_once();
        v53 = sub_244406D38();
        __swift_project_value_buffer(v53, (uint64_t)qword_2573610D0);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v43 = sub_244406D20();
        v54 = sub_244406FB4();
        if (os_log_type_enabled(v43, v54))
        {
          v55 = swift_slowAlloc();
          v65 = swift_slowAlloc();
          v71 = v65;
          *(_DWORD *)v55 = 136315650;
          swift_bridgeObjectRetain();
          v68[0] = sub_2443DABA4(a2, a3, &v71);
          sub_244406FE4();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v55 + 12) = 2080;
          swift_bridgeObjectRetain();
          v56 = sub_2443DA7D0(v18, v17, v19, v20);
          v58 = v57;
          swift_bridgeObjectRelease();
          v68[0] = sub_2443DABA4(v56, v58, &v71);
          sub_244406FE4();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v55 + 22) = 2080;
          swift_bridgeObjectRetain();
          v59 = sub_2443DA7D0(a2, a3, v67, v66);
          v61 = v60;
          swift_bridgeObjectRelease();
          v68[0] = sub_2443DABA4(v59, v61, &v71);
          sub_244406FE4();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2443D2000, v43, v54, "Invalid batch label: %s with existing schema: %s vs %s", (uint8_t *)v55, 0x20u);
          swift_arrayDestroy();
          MEMORY[0x24950E6FC](v65, -1, -1);
          v47 = v55;
          goto LABEL_27;
        }

        swift_bridgeObjectRelease_n();
LABEL_29:
        swift_bridgeObjectRelease_n();
        return 0;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v21 = swift_bridgeObjectRelease();
  MEMORY[0x24BDAC7A8](v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE28);
  sub_244406EA0();
  v22 = v72;
  if (!v72)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v42 = sub_244406D38();
    __swift_project_value_buffer(v42, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v43 = sub_244406D20();
    v44 = sub_244406FB4();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = swift_slowAlloc();
      v71 = v46;
      *(_DWORD *)v45 = 136315138;
      swift_bridgeObjectRetain();
      v68[0] = sub_2443DABA4(a2, a3, &v71);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v43, v44, "Failed at writing batch: %s", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v46, -1, -1);
      v47 = (uint64_t)v45;
LABEL_27:
      MEMORY[0x24950E6FC](v47, -1, -1);

      return 0;
    }

    goto LABEL_29;
  }
  v63 = a3;
  v64 = a2;
  v23 = v78;
  v24 = v76;
  v25 = v77;
  v62 = v6;
  v27 = v74;
  v26 = v75;
  v28 = v73;
  v29 = v71;
  v30 = v75 >> 8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE30);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_244407690;
  *(_QWORD *)(v31 + 32) = v29;
  *(_QWORD *)(v31 + 40) = v22;
  *(_QWORD *)(v31 + 48) = v28;
  *(_QWORD *)(v31 + 56) = v27;
  *(_BYTE *)(v31 + 64) = v26 & 1;
  *(_BYTE *)(v31 + 65) = v30;
  *(_QWORD *)(v31 + 72) = v24;
  *(_QWORD *)(v31 + 80) = v25;
  *(_WORD *)(v31 + 88) = v23;
  v32 = v62 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v33 = *(_QWORD **)(v32 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v32 + 16) = v33;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v33 = sub_2443E25B4(0, v33[2] + 1, 1, v33);
    *(_QWORD *)(v32 + 16) = v33;
  }
  v36 = v33[2];
  v35 = v33[3];
  if (v36 >= v35 >> 1)
  {
    v33 = sub_2443E25B4((_QWORD *)(v35 > 1), v36 + 1, 1, v33);
    *(_QWORD *)(v32 + 16) = v33;
  }
  v33[2] = v36 + 1;
  v37 = &v33[5 * v36];
  *((_BYTE *)v37 + 32) = 1;
  v37[5] = v31;
  v37[6] = v28;
  v37[7] = v27;
  v37[8] = 1;
  swift_endAccess();
  v38 = *(_QWORD *)(v32 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v39 = (_QWORD *)sub_2443D5B8C(v38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v40 = sub_2443D57F8(v64, v63, v39);
  swift_bridgeObjectRelease();
  if ((v40 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    swift_beginAccess();
    v48 = *(_QWORD **)(v32 + 8);
    v49 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v32 + 8) = v48;
    if ((v49 & 1) == 0)
    {
      v48 = sub_2443E24A8(0, v48[2] + 1, 1, v48);
      *(_QWORD *)(v32 + 8) = v48;
    }
    v51 = v48[2];
    v50 = v48[3];
    if (v51 >= v50 >> 1)
    {
      v48 = sub_2443E24A8((_QWORD *)(v50 > 1), v51 + 1, 1, v48);
      *(_QWORD *)(v32 + 8) = v48;
    }
    v48[2] = v51 + 1;
    v52 = &v48[4 * v51];
    v52[4] = v64;
    v52[5] = v63;
    *((_BYTE *)v52 + 48) = v67;
    v52[7] = v66;
    swift_endAccess();
    return 1;
  }
}

uint64_t PlanksWriter.writeArray<A>(_:label:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  void (*v26)(uint64_t *__return_ptr, uint64_t, uint64_t);
  char v27;
  uint64_t v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int16 v57;

  v9 = v5 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  v10 = *(_QWORD *)(v9 + 8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = (_QWORD *)sub_2443D5B8C(v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v12 = sub_2443D57F8(a2, a3, v11);
  v13 = swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v14 = sub_244406D38();
    __swift_project_value_buffer(v14, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v15 = sub_244406D20();
    v16 = sub_244406FB4();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v50 = v18;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain();
      sub_2443DABA4(a2, a3, &v50);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v19 = "Invalid array label: %s";
LABEL_20:
      _os_log_impl(&dword_2443D2000, v15, v16, v19, v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v18, -1, -1);
      MEMORY[0x24950E6FC](v17, -1, -1);

      return 0;
    }
    goto LABEL_21;
  }
  MEMORY[0x24BDAC7A8](v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE28);
  sub_244406EA0();
  v20 = v51;
  if (!v51)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v41 = sub_244406D38();
    __swift_project_value_buffer(v41, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v15 = sub_244406D20();
    v16 = sub_244406FB4();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v50 = v18;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain();
      sub_2443DABA4(a2, a3, &v50);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v19 = "Failed at writing array: %s";
      goto LABEL_20;
    }
LABEL_21:

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v21 = a3;
  v47 = a2;
  v43 = v50;
  v22 = v52;
  v23 = v53;
  v24 = v55;
  v45 = v56;
  v44 = v57;
  v25 = v54;
  v26 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 8);
  v46 = v21;
  swift_bridgeObjectRetain();
  v26(&v50, a4, a5);
  v27 = v50;
  v28 = MEMORY[0x24950E018](a1, a4);
  swift_beginAccess();
  v29 = *(_QWORD **)(v9 + 8);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v9 + 8) = v29;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v29 = sub_2443E24A8(0, v29[2] + 1, 1, v29);
    *(_QWORD *)(v9 + 8) = v29;
  }
  v32 = v29[2];
  v31 = v29[3];
  if (v32 >= v31 >> 1)
  {
    v29 = sub_2443E24A8((_QWORD *)(v31 > 1), v32 + 1, 1, v29);
    *(_QWORD *)(v9 + 8) = v29;
  }
  v29[2] = v32 + 1;
  v33 = &v29[4 * v32];
  v33[4] = v47;
  v33[5] = v46;
  *((_BYTE *)v33 + 48) = v27;
  v33[7] = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE30);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_244407690;
  *(_QWORD *)(v34 + 32) = v43;
  *(_QWORD *)(v34 + 40) = v20;
  *(_QWORD *)(v34 + 48) = v22;
  *(_QWORD *)(v34 + 56) = v23;
  *(_BYTE *)(v34 + 64) = v25 & 1;
  *(_BYTE *)(v34 + 65) = HIBYTE(v25);
  *(_QWORD *)(v34 + 72) = v24;
  *(_QWORD *)(v34 + 80) = v45;
  *(_WORD *)(v34 + 88) = v44;
  v35 = *(_QWORD **)(v9 + 16);
  v36 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v9 + 16) = v35;
  if ((v36 & 1) == 0)
  {
    v35 = sub_2443E25B4(0, v35[2] + 1, 1, v35);
    *(_QWORD *)(v9 + 16) = v35;
  }
  v38 = v35[2];
  v37 = v35[3];
  if (v38 >= v37 >> 1)
  {
    v35 = sub_2443E25B4((_QWORD *)(v37 > 1), v38 + 1, 1, v35);
    *(_QWORD *)(v9 + 16) = v35;
  }
  v35[2] = v38 + 1;
  v39 = &v35[5 * v38];
  v40 = 1;
  *((_BYTE *)v39 + 32) = 1;
  v39[5] = v34;
  v39[6] = v22;
  v39[7] = v23;
  v39[8] = 1;
  swift_endAccess();
  return v40;
}

uint64_t PlanksWriter.writeBatch<A, B>(_:label:quantization:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2443F91E4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t))PlanksWriter.writeBatch<A>(_:label:), "Failed at quantizing batch: %s") & 1;
}

uint64_t PlanksWriter.writeArray<A, B>(_:label:quantization:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_2443F91E4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, (uint64_t (*)(uint64_t, uint64_t))PlanksWriter.writeArray<A>(_:label:), "Failed at quantizing array: %s") & 1;
}

uint64_t sub_2443F91E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t), const char *a12)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  __int16 v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v38;
  os_log_type_t v39;
  uint64_t v41;
  _BYTE *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v62;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  _QWORD v69[4];

  v69[0] = a1;
  v18 = sub_244406F0C();
  v19 = MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v18);
  computeQuantizationParameters<A, B, C>(_:upperbound:)((uint64_t)v69, a4, a6, a5, v18, a9, a10, a7, (double *)&v65, a8, v19);
  v20 = v65;
  v21 = v66;
  v22 = BYTE1(v67);
  v69[0] = a1;
  v23 = v67;
  v24 = quantizeArray<A, B, C>(_:parameters:)((uint64_t)v69, &v65, a6, a5, v18, a9, a10, a7);
  if (!v24)
  {
    if (qword_25735DB50 != -1)
      swift_once();
    v30 = sub_244406D38();
    __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v31 = sub_244406D20();
    v32 = sub_244406FB4();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v65 = v34;
      *(_DWORD *)v33 = 136315138;
      swift_bridgeObjectRetain();
      v69[0] = sub_2443DABA4(a2, a3, &v65);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v35 = v31;
      v36 = v32;
LABEL_16:
      _os_log_impl(&dword_2443D2000, v35, v36, a12, v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v34, -1, -1);
      MEMORY[0x24950E6FC](v33, -1, -1);

      return 0;
    }
LABEL_17:

    swift_bridgeObjectRelease_n();
    return 0;
  }
  v25 = a11(v24, a2);
  swift_bridgeObjectRelease();
  if ((v25 & 1) == 0)
  {
LABEL_12:
    if (qword_25735DB50 != -1)
      swift_once();
    v38 = sub_244406D38();
    __swift_project_value_buffer(v38, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v31 = sub_244406D20();
    v39 = sub_244406FB4();
    if (os_log_type_enabled(v31, v39))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v65 = v34;
      *(_DWORD *)v33 = 136315138;
      swift_bridgeObjectRetain();
      v69[0] = sub_2443DABA4(a2, a3, &v65);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      a12 = "Failed at writing quantizedData: %s.";
      v35 = v31;
      v36 = v39;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v26 = v59 + OBJC_IVAR____TtC6Planks12PlanksWriter_metadata;
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)(v26 + 16) + 16))
  {
    swift_endAccess();
    goto LABEL_12;
  }
  sub_2443E29C4((uint64_t)&v65);
  v27 = v66;
  if (v66)
  {
    v28 = v68;
    v62 = v67;
    v29 = v65;
  }
  else
  {
    sub_2443E28C8(*(_QWORD *)(*(_QWORD *)(v26 + 16) + 16) - 1, (uint64_t)&v65);
    v29 = v65;
    v27 = v66;
    v62 = v67;
    v28 = v68;
  }
  v57 = (_QWORD *)(v26 + 16);
  swift_endAccess();
  v41 = *(_QWORD *)(v27 + 16);
  if (v41)
  {
    v58 = v26;
    v60 = v28;
    v64 = v23 | (v22 << 8);
    swift_bridgeObjectRetain_n();
    v42 = (_BYTE *)(v27 + 64);
    v43 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v44 = *((_QWORD *)v42 - 4);
      v45 = *((_QWORD *)v42 - 3);
      v47 = *((_QWORD *)v42 - 2);
      v46 = *((_QWORD *)v42 - 1);
      v48 = *v42;
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v43 = sub_2443E26D4(0, v43[2] + 1, 1, v43);
      v50 = v43[2];
      v49 = v43[3];
      if (v50 >= v49 >> 1)
        v43 = sub_2443E26D4((_QWORD *)(v49 > 1), v50 + 1, 1, v43);
      v42 += 64;
      v43[2] = v50 + 1;
      v51 = &v43[8 * v50];
      v51[4] = v44;
      v51[5] = v45;
      v51[6] = v47;
      v51[7] = v46;
      *((_BYTE *)v51 + 64) = v48;
      *((_BYTE *)v51 + 65) = 1;
      v51[9] = v20;
      v51[10] = v21;
      *((_WORD *)v51 + 44) = v64;
      --v41;
    }
    while (v41);
    swift_bridgeObjectRelease_n();
    v28 = v60;
    v26 = v58;
  }
  else
  {
    v43 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v52 = *(_QWORD **)(v26 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v26 + 16) = v52;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v52 = sub_2443E25B4(0, v52[2] + 1, 1, v52);
    *v57 = v52;
  }
  v55 = v52[2];
  v54 = v52[3];
  if (v55 >= v54 >> 1)
  {
    v52 = sub_2443E25B4((_QWORD *)(v54 > 1), v55 + 1, 1, v52);
    *v57 = v52;
  }
  v52[2] = v55 + 1;
  v56 = &v52[5 * v55];
  *((_BYTE *)v56 + 32) = v29;
  v56[5] = v43;
  *((_OWORD *)v56 + 3) = v62;
  v56[8] = v28;
  swift_endAccess();
  swift_bridgeObjectRelease();
  return 1;
}

double sub_2443F980C@<D0>(uint64_t a1@<X8>)
{
  return sub_2443E2890(a1);
}

uint64_t FieldType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2443F9848 + 4 * a7[*v0]))(947154537, 0xE400000000000000);
}

uint64_t sub_2443F9848()
{
  return 0x3631746E69;
}

uint64_t sub_2443F985C()
{
  return 0x3233746E69;
}

uint64_t sub_2443F9870()
{
  return 0x3436746E69;
}

uint64_t sub_2443F9884()
{
  return 0x38746E6975;
}

uint64_t sub_2443F9898()
{
  return 0x3631746E6975;
}

uint64_t sub_2443F98AC()
{
  return 0x3233746E6975;
}

uint64_t sub_2443F98C0()
{
  return 0x3436746E6975;
}

uint64_t sub_2443F98D4()
{
  return 0x363174616F6C66;
}

uint64_t sub_2443F98EC()
{
  return 0x323374616F6C66;
}

uint64_t sub_2443F9904()
{
  return 0x343674616F6C66;
}

uint64_t sub_2443F991C()
{
  return 1819242338;
}

uint64_t FileMetadata.fieldNames.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_2443D5B8C(v0);
  swift_bridgeObjectRelease();
  return v1;
}

Planks::SchemaElement __swiftcall SchemaElement.init(name:fieldType:fieldCount:)(Planks::SchemaElement name, Planks::FieldType fieldType, Swift::Int fieldCount)
{
  uint64_t v3;
  char v4;

  v4 = *(_BYTE *)fieldType;
  *(Swift::String *)v3 = name.name;
  *(_BYTE *)(v3 + 16) = v4;
  *(_QWORD *)(v3 + 24) = fieldCount;
  name.fieldCount = fieldCount;
  name.fieldType = fieldType;
  return name;
}

_BYTE *RowGroup.init(chunkType:columnChunks:beginOffset:byteSize:rowsCount:)@<X0>(_BYTE *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_BYTE *)a6 = *result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t static PlanksDefaults.batchSize.getter()
{
  return 256;
}

Planks::FileMetadata __swiftcall FileMetadata.init(version:schema:rowGroups:keyValueMetadata:)(Swift::Int version, Swift::OpaquePointer schema, Swift::OpaquePointer rowGroups, Swift::OpaquePointer keyValueMetadata)
{
  Swift::OpaquePointer *v4;
  Swift::OpaquePointer *v9;
  Swift::Int v10;
  void *v11;
  void *v12;
  void *v13;
  Planks::FileMetadata result;

  v9 = v4;
  sub_2443F29E0(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = swift_bridgeObjectRelease();
  v9->_rawValue = (void *)version;
  v9[1]._rawValue = schema._rawValue;
  v9[2]._rawValue = rowGroups._rawValue;
  v9[3]._rawValue = keyValueMetadata._rawValue;
  result.keyValueMetadata._rawValue = v13;
  result.rowGroups._rawValue = v12;
  result.schema._rawValue = v11;
  result.version = v10;
  return result;
}

uint64_t ColumnChunk.init(schemaPath:beginOffset:byteSize:encoding:compression:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X4>, char *a6@<X5>, uint64_t a7@<X8>)
{
  char v7;
  char v8;

  v7 = *a5;
  v8 = *a6;
  *(_QWORD *)a7 = result;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  *(_BYTE *)(a7 + 32) = v7;
  *(_BYTE *)(a7 + 33) = v8;
  *(_QWORD *)(a7 + 40) = 0;
  *(_QWORD *)(a7 + 48) = 0;
  *(_WORD *)(a7 + 56) = 12;
  return result;
}

uint64_t Chunkable.endOffset.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;

  v4 = (*(uint64_t (**)(void))(a2 + 8))();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  v6 = __OFADD__(v4, v5);
  result = v4 + v5;
  if (v6)
    __break(1u);
  return result;
}

void sub_2443F9A98()
{
  off_25735E290 = &unk_2514FCB30;
}

uint64_t planksMagic.getter()
{
  if (qword_25735DB58 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t planksVersion.getter()
{
  return 1;
}

uint64_t planksMinFileSize.getter()
{
  return 12;
}

uint64_t planksMaxMetadataSize.getter()
{
  return 0x2000000;
}

Planks::FieldType_optional __swiftcall FieldType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  Planks::FieldType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24440714C();
  result.value = swift_bridgeObjectRelease();
  v5 = 12;
  if (v3 < 0xC)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static FieldType.allCases.getter()
{
  return &unk_2514FCC98;
}

uint64_t sub_2443F9B6C()
{
  return sub_244404ED0();
}

uint64_t sub_2443F9B78()
{
  sub_244407278();
  FieldType.rawValue.getter();
  sub_244406DF8();
  swift_bridgeObjectRelease();
  return sub_244407290();
}

uint64_t sub_2443F9BDC()
{
  FieldType.rawValue.getter();
  sub_244406DF8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443F9C2C()
{
  sub_244407278();
  FieldType.rawValue.getter();
  sub_244406DF8();
  swift_bridgeObjectRelease();
  return sub_244407290();
}

Planks::FieldType_optional sub_2443F9C8C(Swift::String *a1)
{
  return FieldType.init(rawValue:)(*a1);
}

uint64_t sub_2443F9C98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = FieldType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_2443F9CBC(_QWORD *a1@<X8>)
{
  *a1 = &unk_2514FCC98;
}

uint64_t sub_2443F9CCC()
{
  sub_2443FF6D8();
  return sub_244406E70();
}

uint64_t sub_2443F9D28()
{
  sub_2443FF6D8();
  return sub_244406E64();
}

uint64_t SchemaElement.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SchemaElement.name.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SchemaElement.name.modify())()
{
  return nullsub_1;
}

void SchemaElement.fieldType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *SchemaElement.fieldType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*SchemaElement.fieldType.modify())()
{
  return nullsub_1;
}

uint64_t SchemaElement.fieldCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t SchemaElement.fieldCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*SchemaElement.fieldCount.modify())()
{
  return nullsub_1;
}

uint64_t sub_2443F9E38()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x707954646C656966;
  if (*v0 != 1)
    v1 = 0x756F43646C656966;
  if (*v0)
    return v1;
  else
    return 1701667182;
}

uint64_t sub_2443F9E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2443FEBF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2443F9EB8()
{
  return 0;
}

uint64_t sub_2443F9EC4()
{
  sub_2443FCE10();
  return sub_2444072D8();
}

uint64_t sub_2443F9EEC()
{
  sub_2443FCE10();
  return sub_2444072E4();
}

uint64_t SchemaElement.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];
  int v10;
  char v11;
  char v12;
  char v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E298);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(unsigned __int8 *)(v1 + 16);
  v9[0] = *(_QWORD *)(v1 + 24);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FCE10();
  sub_2444072CC();
  v14 = 0;
  v7 = v9[1];
  sub_2444071AC();
  if (!v7)
  {
    v13 = v10;
    v12 = 1;
    sub_2443FCE54();
    sub_2444071D0();
    v11 = 2;
    sub_2444071C4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t SchemaElement.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char v16;
  char v17;
  unsigned __int8 v18;
  char v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E2B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FCE10();
  sub_2444072C0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v19 = 0;
  v9 = sub_244407164();
  v11 = v10;
  v17 = 1;
  sub_2443FCE98();
  swift_bridgeObjectRetain();
  sub_244407188();
  v15 = v18;
  v16 = 2;
  v13 = sub_24440717C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v15;
  *(_QWORD *)(a2 + 24) = v13;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443FA25C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SchemaElement.init(from:)(a1, a2);
}

uint64_t sub_2443FA270(_QWORD *a1)
{
  return SchemaElement.encode(to:)(a1);
}

uint64_t ChunkEncoding.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24440714C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void *static ChunkEncoding.allCases.getter()
{
  return &unk_2514FCD00;
}

uint64_t ChunkEncoding.rawValue.getter()
{
  return 0x6E69616C70;
}

uint64_t sub_2443FA2FC()
{
  return 1;
}

uint64_t sub_2443FA304()
{
  sub_244407278();
  sub_244406DF8();
  return sub_244407290();
}

uint64_t sub_2443FA350()
{
  return sub_244406DF8();
}

uint64_t sub_2443FA364()
{
  sub_244407278();
  sub_244406DF8();
  return sub_244407290();
}

uint64_t sub_2443FA3AC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24440714C();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2443FA3FC(_QWORD *a1@<X8>)
{
  *a1 = 0x6E69616C70;
  a1[1] = 0xE500000000000000;
}

void sub_2443FA414(_QWORD *a1@<X8>)
{
  *a1 = &unk_2514FCD60;
}

uint64_t sub_2443FA424()
{
  sub_2443FF694();
  return sub_244406E70();
}

uint64_t sub_2443FA480()
{
  sub_2443FF694();
  return sub_244406E64();
}

Planks::ChunkCompression_optional __swiftcall ChunkCompression.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  Planks::ChunkCompression_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24440714C();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

void *static ChunkCompression.allCases.getter()
{
  return &unk_2514FCDD8;
}

uint64_t ChunkCompression.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x657A69746E617571;
  else
    return 0x6572706D6F636E75;
}

uint64_t sub_2443FA580(char *a1, char *a2)
{
  return sub_24440505C(*a1, *a2);
}

uint64_t sub_2443FA58C()
{
  sub_244407278();
  sub_244406DF8();
  swift_bridgeObjectRelease();
  return sub_244407290();
}

uint64_t sub_2443FA618()
{
  sub_244406DF8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443FA680()
{
  sub_244407278();
  sub_244406DF8();
  swift_bridgeObjectRelease();
  return sub_244407290();
}

Planks::ChunkCompression_optional sub_2443FA708(Swift::String *a1)
{
  return ChunkCompression.init(rawValue:)(*a1);
}

void sub_2443FA714(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x6572706D6F636E75;
  if (*v1)
    v2 = 0x657A69746E617571;
  v3 = 0xEC00000064657373;
  if (*v1)
    v3 = 0xE900000000000064;
  *a1 = v2;
  a1[1] = v3;
}

void sub_2443FA760(_QWORD *a1@<X8>)
{
  *a1 = &unk_2514FCE00;
}

uint64_t sub_2443FA770()
{
  sub_2443FF650();
  return sub_244406E70();
}

uint64_t sub_2443FA7CC()
{
  sub_2443FF650();
  return sub_244406E64();
}

uint64_t ColumnChunk.schemaPath.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ColumnChunk.schemaPath.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ColumnChunk.schemaPath.modify())()
{
  return nullsub_1;
}

uint64_t ColumnChunk.beginOffset.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ColumnChunk.beginOffset.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*ColumnChunk.beginOffset.modify())()
{
  return nullsub_1;
}

uint64_t ColumnChunk.byteSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t ColumnChunk.byteSize.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*ColumnChunk.byteSize.modify())()
{
  return nullsub_1;
}

void ColumnChunk.encoding.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

_BYTE *ColumnChunk.encoding.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = *result;
  return result;
}

uint64_t (*ColumnChunk.encoding.modify())()
{
  return nullsub_1;
}

void ColumnChunk.compression.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 33);
}

_BYTE *ColumnChunk.compression.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 33) = *result;
  return result;
}

uint64_t (*ColumnChunk.compression.modify())()
{
  return nullsub_1;
}

__n128 ColumnChunk.quantization.getter@<Q0>(__n128 *a1@<X8>)
{
  uint64_t v1;
  unsigned __int16 v2;
  __n128 result;

  v2 = *(_WORD *)(v1 + 56);
  result = *(__n128 *)(v1 + 40);
  *a1 = result;
  a1[1].n128_u16[0] = v2;
  return result;
}

__n128 ColumnChunk.quantization.setter(__n128 *a1)
{
  uint64_t v1;
  unsigned __int16 v2;
  __n128 result;

  v2 = a1[1].n128_u16[0];
  result = *a1;
  *(__n128 *)(v1 + 40) = *a1;
  *(_WORD *)(v1 + 56) = v2;
  return result;
}

uint64_t (*ColumnChunk.quantization.modify())()
{
  return nullsub_1;
}

BOOL sub_2443FA954(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2443FA968()
{
  return sub_244407284();
}

uint64_t sub_2443FA990()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2443FA9C4 + 4 * byte_244407F5C[*v0]))(0x6150616D65686373, 0xEA00000000006874);
}

uint64_t sub_2443FA9C4()
{
  return 0x66664F6E69676562;
}

uint64_t sub_2443FA9E4()
{
  return 0x657A695365747962;
}

uint64_t sub_2443FA9FC()
{
  return 0x676E69646F636E65;
}

uint64_t sub_2443FAA14()
{
  return 0x73736572706D6F63;
}

uint64_t sub_2443FAA34()
{
  return 0x617A69746E617571;
}

uint64_t sub_2443FAA54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2443FED54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2443FAA78()
{
  sub_2443FCEDC();
  return sub_2444072D8();
}

uint64_t sub_2443FAAA0()
{
  sub_2443FCEDC();
  return sub_2444072E4();
}

uint64_t ColumnChunk.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  char v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E2C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v18 = *(_QWORD *)(v1 + 24);
  v19 = v7;
  v24 = *(unsigned __int8 *)(v1 + 32);
  LODWORD(v7) = *(unsigned __int8 *)(v1 + 33);
  v8 = *(_QWORD *)(v1 + 48);
  v14 = *(_QWORD *)(v1 + 40);
  v15 = v8;
  v16 = *(unsigned __int16 *)(v1 + 56);
  v17 = v7;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FCEDC();
  sub_2444072CC();
  LOBYTE(v21) = 0;
  v9 = v20;
  sub_2444071AC();
  if (!v9)
  {
    v10 = v24;
    v11 = v17;
    LOBYTE(v21) = 1;
    sub_2444071DC();
    LOBYTE(v21) = 2;
    sub_2444071DC();
    LOBYTE(v21) = v10;
    v25 = 3;
    sub_2443FCF20();
    sub_2444071A0();
    LOBYTE(v21) = v11;
    v25 = 4;
    sub_2443FCF64();
    sub_2444071A0();
    v21 = v14;
    v22 = v15;
    v23 = v16;
    v25 = 5;
    sub_2443FCFA8();
    sub_2444071A0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ColumnChunk.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int16 v21;
  int v22;
  char v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E2E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FCEDC();
  sub_2444072C0();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  LOBYTE(v20) = 0;
  v9 = sub_244407164();
  v11 = v10;
  LOBYTE(v20) = 1;
  swift_bridgeObjectRetain();
  v19 = sub_244407194();
  LOBYTE(v20) = 2;
  v18 = sub_244407194();
  v23 = 3;
  sub_2443FCFEC();
  sub_244407158();
  v22 = v20;
  v23 = 4;
  sub_2443FD030();
  sub_244407158();
  v17 = v20;
  v23 = 5;
  sub_2443FD074();
  sub_244407158();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = v21;
  v14 = v20;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  v15 = v18;
  *(_QWORD *)(a2 + 16) = v19;
  *(_QWORD *)(a2 + 24) = v15;
  *(_BYTE *)(a2 + 32) = v22;
  *(_BYTE *)(a2 + 33) = v17;
  *(_OWORD *)(a2 + 40) = v14;
  *(_WORD *)(a2 + 56) = v13;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443FAFA8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_2443FAFB0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_2443FAFB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  result = v1 + v2;
  if (__OFADD__(v1, v2))
    __break(1u);
  return result;
}

uint64_t sub_2443FAFCC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ColumnChunk.init(from:)(a1, a2);
}

uint64_t sub_2443FAFE0(_QWORD *a1)
{
  return ColumnChunk.encode(to:)(a1);
}

Planks::RowGroupType_optional __swiftcall RowGroupType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  Planks::RowGroupType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24440714C();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static RowGroupType.allCases.getter()
{
  return &unk_2514FCE90;
}

uint64_t RowGroupType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 1635017060;
  if (*v0 != 1)
    v1 = 0x7865646E69;
  if (*v0)
    return v1;
  else
    return 0x656C706D6973;
}

uint64_t sub_2443FB0A8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244404F64(*a1, *a2);
}

uint64_t sub_2443FB0B4()
{
  sub_244407278();
  sub_244406DF8();
  swift_bridgeObjectRelease();
  return sub_244407290();
}

uint64_t sub_2443FB144()
{
  sub_244406DF8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443FB1B0()
{
  sub_244407278();
  sub_244406DF8();
  swift_bridgeObjectRelease();
  return sub_244407290();
}

Planks::RowGroupType_optional sub_2443FB23C(Swift::String *a1)
{
  return RowGroupType.init(rawValue:)(*a1);
}

void sub_2443FB248(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE600000000000000;
  v4 = 0xE400000000000000;
  v5 = 1635017060;
  if (v2 != 1)
  {
    v5 = 0x7865646E69;
    v4 = 0xE500000000000000;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x656C706D6973;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

void sub_2443FB298(_QWORD *a1@<X8>)
{
  *a1 = &unk_2514FCEB8;
}

uint64_t sub_2443FB2A8()
{
  sub_2443FF60C();
  return sub_244406E70();
}

uint64_t sub_2443FB304()
{
  sub_2443FF60C();
  return sub_244406E64();
}

void RowGroup.chunkType.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *RowGroup.chunkType.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*RowGroup.chunkType.modify())()
{
  return nullsub_1;
}

uint64_t RowGroup.columnChunks.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RowGroup.columnChunks.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*RowGroup.columnChunks.modify())()
{
  return nullsub_1;
}

uint64_t RowGroup.beginOffset.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t RowGroup.beginOffset.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*RowGroup.beginOffset.modify())()
{
  return nullsub_1;
}

uint64_t RowGroup.byteSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t RowGroup.byteSize.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*RowGroup.byteSize.modify())()
{
  return nullsub_1;
}

uint64_t RowGroup.rowsCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t RowGroup.rowsCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*RowGroup.rowsCount.modify())()
{
  return nullsub_1;
}

uint64_t sub_2443FB41C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2443FB450 + 4 * byte_244407F62[*v0]))(0x7079546B6E756863, 0xE900000000000065);
}

uint64_t sub_2443FB450()
{
  return 0x68436E6D756C6F63;
}

uint64_t sub_2443FB470()
{
  return 0x66664F6E69676562;
}

uint64_t sub_2443FB490()
{
  return 0x657A695365747962;
}

uint64_t sub_2443FB4A8()
{
  return 0x6E756F4373776F72;
}

uint64_t sub_2443FB4C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2443FF028(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2443FB4E4()
{
  sub_2443FD210();
  return sub_2444072D8();
}

uint64_t sub_2443FB50C()
{
  sub_2443FD210();
  return sub_2444072E4();
}

uint64_t RowGroup.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E308);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v9 = *((_QWORD *)v1 + 1);
  v12[3] = *((_QWORD *)v1 + 2);
  v13 = v9;
  v10 = *((_QWORD *)v1 + 3);
  v12[1] = *((_QWORD *)v1 + 4);
  v12[2] = v10;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FD210();
  sub_2444072CC();
  v20 = v8;
  v19 = 0;
  sub_2443FD254();
  sub_2444071D0();
  if (!v2)
  {
    v14 = v13;
    v18 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E320);
    sub_2443FD474(&qword_25735E328, &qword_25735E320, (uint64_t (*)(void))sub_2443FD298, MEMORY[0x24BEE12A0]);
    sub_2444071D0();
    v17 = 2;
    sub_2444071DC();
    v16 = 3;
    sub_2444071DC();
    v15 = 4;
    sub_2444071C4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t RowGroup.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E338);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FD210();
  sub_2444072C0();
  if (!v2)
  {
    v22 = 0;
    sub_2443FD2DC();
    sub_244407188();
    v9 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E320);
    v21 = 1;
    sub_2443FD474(&qword_25735E348, &qword_25735E320, (uint64_t (*)(void))sub_2443FD320, MEMORY[0x24BEE12D0]);
    sub_244407188();
    v11 = v17;
    v20 = 2;
    swift_bridgeObjectRetain();
    v16 = sub_244407194();
    v19 = 3;
    v15 = sub_244407194();
    v18 = 4;
    v12 = sub_24440717C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    v13 = v16;
    *(_QWORD *)(a2 + 8) = v11;
    *(_QWORD *)(a2 + 16) = v13;
    *(_QWORD *)(a2 + 24) = v15;
    *(_QWORD *)(a2 + 32) = v12;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443FB9A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return RowGroup.init(from:)(a1, a2);
}

uint64_t sub_2443FB9B4(_QWORD *a1)
{
  return RowGroup.encode(to:)(a1);
}

uint64_t FileMetadata.version.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t FileMetadata.version.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*FileMetadata.version.modify())()
{
  return nullsub_1;
}

uint64_t FileMetadata.schema.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FileMetadata.schema.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t (*FileMetadata.schema.modify())()
{
  return nullsub_1;
}

uint64_t FileMetadata.rowGroups.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FileMetadata.rowGroups.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*FileMetadata.rowGroups.modify())()
{
  return nullsub_1;
}

uint64_t FileMetadata.keyValueMetadata.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t FileMetadata.keyValueMetadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

uint64_t (*FileMetadata.keyValueMetadata.modify())()
{
  return nullsub_1;
}

uint64_t sub_2443FBAB0(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  _QWORD *v24;
  char v26;
  int64_t v27;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v5 = result + 64;
  v6 = 1 << *(_BYTE *)(result + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(result + 64);
  v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v27)
        return 1;
      v12 = *(_QWORD *)(v5 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v27)
          return 1;
        v12 = *(_QWORD *)(v5 + 8 * v4);
        if (!v12)
        {
          v4 = v11 + 3;
          if (v11 + 3 >= v27)
            return 1;
          v12 = *(_QWORD *)(v5 + 8 * v4);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v8 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    v14 = 16 * v10;
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v14);
    v16 = *v15;
    v17 = v15[1];
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v14);
    v20 = *v18;
    v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = sub_2443DC1EC(v16, v17);
    v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v24 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v26 = sub_244407224();
      result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0)
        return 0;
    }
  }
  v13 = v11 + 4;
  if (v13 >= v27)
    return 1;
  v12 = *(_QWORD *)(v5 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v27)
      return 1;
    v12 = *(_QWORD *)(v5 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_24;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_2443FBCCC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2443FBCFC + 4 * byte_244407F67[*v0]))(0x6E6F6973726576, 0xE700000000000000);
}

uint64_t sub_2443FBCFC()
{
  return 0x616D65686373;
}

uint64_t sub_2443FBD10()
{
  return 0x70756F7247776F72;
}

unint64_t sub_2443FBD2C()
{
  return 0xD000000000000010;
}

uint64_t sub_2443FBD48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2443FF284(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2443FBD6C()
{
  sub_2443FD364();
  return sub_2444072D8();
}

uint64_t sub_2443FBD94()
{
  sub_2443FD364();
  return sub_2444072E4();
}

uint64_t FileMetadata.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E358);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1[1];
  v13 = v1[2];
  v14 = v8;
  v12 = v1[3];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FD364();
  sub_2444072CC();
  LOBYTE(v16) = 0;
  sub_2444071C4();
  if (!v2)
  {
    v9 = v12;
    v10 = v13;
    v16 = v14;
    v15 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E368);
    sub_2443FD474(&qword_25735E370, &qword_25735E368, (uint64_t (*)(void))sub_2443FD3A8, MEMORY[0x24BEE12A0]);
    sub_2444071D0();
    v16 = v10;
    v15 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E380);
    sub_2443FD474(&qword_25735E388, &qword_25735E380, (uint64_t (*)(void))sub_2443FD3EC, MEMORY[0x24BEE12A0]);
    sub_2444071D0();
    v16 = v9;
    v15 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E398);
    sub_2443FD51C(&qword_25735E3A0, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    sub_2444071D0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t FileMetadata.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E3A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2443F29E0(MEMORY[0x24BEE4AF8]);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FD364();
  sub_2444072C0();
  if (!v2)
  {
    LOBYTE(v18) = 0;
    v9 = sub_24440717C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E368);
    v17 = 1;
    sub_2443FD474(&qword_25735E3B0, &qword_25735E368, (uint64_t (*)(void))sub_2443FD430, MEMORY[0x24BEE12D0]);
    sub_244407188();
    v15 = v9;
    v11 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E380);
    v17 = 2;
    sub_2443FD474(&qword_25735E3C0, &qword_25735E380, (uint64_t (*)(void))sub_2443FD4D8, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_244407188();
    v12 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735E398);
    v17 = 3;
    sub_2443FD51C(&qword_25735E3D0, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
    swift_bridgeObjectRetain();
    sub_244407188();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v13 = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *a2 = v15;
    a2[1] = v11;
    a2[2] = v12;
    a2[3] = v13;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2443FC2FC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return FileMetadata.init(from:)(a1, a2);
}

uint64_t sub_2443FC310(_QWORD *a1)
{
  return FileMetadata.encode(to:)(a1);
}

uint64_t FileMetadata.rowsCount.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  BOOL v6;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return 0;
  result = 0;
  v4 = (uint64_t *)(v1 + 64);
  while (1)
  {
    v5 = *v4;
    v4 += 5;
    v6 = __OFADD__(result, v5);
    result += v5;
    if (v6)
      break;
    if (!--v2)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t FileMetadata.dataByteSize.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  BOOL v6;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return 0;
  result = 0;
  v4 = (uint64_t *)(v1 + 56);
  while (1)
  {
    v5 = *v4;
    v4 += 5;
    v6 = __OFADD__(result, v5);
    result += v5;
    if (v6)
      break;
    if (!--v2)
      return result;
  }
  __break(1u);
  return result;
}

double QuantizationParameters.bias.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void QuantizationParameters.bias.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*QuantizationParameters.bias.modify())()
{
  return nullsub_1;
}

double QuantizationParameters.scale.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

void QuantizationParameters.scale.setter(double a1)
{
  uint64_t v1;

  *(double *)(v1 + 8) = a1;
}

uint64_t (*QuantizationParameters.scale.modify())()
{
  return nullsub_1;
}

void QuantizationParameters.physicalType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *QuantizationParameters.physicalType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*QuantizationParameters.physicalType.modify())()
{
  return nullsub_1;
}

void QuantizationParameters.logicalType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 17);
}

_BYTE *QuantizationParameters.logicalType.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 17) = *result;
  return result;
}

uint64_t (*QuantizationParameters.logicalType.modify())()
{
  return nullsub_1;
}

Planks::QuantizationParameters __swiftcall QuantizationParameters.init(bias:scale:physicalType:logicalType:)(Swift::Double bias, Swift::Double scale, Planks::FieldType physicalType, Planks::FieldType logicalType)
{
  uint64_t v4;
  char v5;
  char v6;
  Planks::QuantizationParameters result;

  v5 = *(_BYTE *)physicalType;
  v6 = *(_BYTE *)logicalType;
  *(Swift::Double *)v4 = bias;
  *(Swift::Double *)(v4 + 8) = scale;
  *(_BYTE *)(v4 + 16) = v5;
  *(_BYTE *)(v4 + 17) = v6;
  result.scale = scale;
  result.bias = bias;
  result.physicalType = physicalType;
  return result;
}

uint64_t sub_2443FC444()
{
  sub_244407278();
  sub_244407284();
  return sub_244407290();
}

uint64_t sub_2443FC488()
{
  sub_244407278();
  sub_244407284();
  return sub_244407290();
}

uint64_t sub_2443FC4C8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2443FC4F0 + 4 * byte_244407F6B[*v0]))(1935763810, 0xE400000000000000);
}

uint64_t sub_2443FC4F0()
{
  return 0x656C616373;
}

uint64_t sub_2443FC504()
{
  return 0x6C61636973796870;
}

uint64_t sub_2443FC524()
{
  return 0x546C616369676F6CLL;
}

uint64_t sub_2443FC544@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2443FF43C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2443FC568()
{
  sub_2443FD57C();
  return sub_2444072D8();
}

uint64_t sub_2443FC590()
{
  sub_2443FD57C();
  return sub_2444072E4();
}

uint64_t QuantizationParameters.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  char v9;
  uint64_t v11;
  int v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E3D8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(unsigned __int8 *)(v1 + 16);
  v8 = *(_BYTE *)(v1 + 17);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FD57C();
  sub_2444072CC();
  v18 = 0;
  sub_2444071B8();
  if (!v2)
  {
    v9 = v12;
    v17 = 1;
    sub_2444071B8();
    v16 = v9;
    v15 = 2;
    sub_2443FCE54();
    sub_2444071D0();
    v14 = v8;
    v13 = 3;
    sub_2444071D0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t QuantizationParameters.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E3E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_2443FD57C();
  sub_2444072C0();
  if (!v2)
  {
    v22 = 0;
    sub_244407170();
    v10 = v9;
    v21 = 1;
    sub_244407170();
    v12 = v11;
    v19 = 2;
    sub_2443FCE98();
    sub_244407188();
    v14 = v20;
    v17 = 3;
    sub_244407188();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v15 = v18;
    *(_QWORD *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v12;
    *(_BYTE *)(a2 + 16) = v14;
    *(_BYTE *)(a2 + 17) = v15;
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
}

uint64_t sub_2443FC93C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return QuantizationParameters.init(from:)(a1, a2);
}

uint64_t sub_2443FC950(_QWORD *a1)
{
  return QuantizationParameters.encode(to:)(a1);
}

uint64_t _s6Planks22QuantizationParametersV2eeoiySbAC_ACtFZ_0(double *a1, double *a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*a1 == *a2 && a1[1] == a2[1])
  {
    v4 = FieldType.rawValue.getter();
    v6 = v5;
    if (v4 == FieldType.rawValue.getter() && v6 == v7)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v8 = sub_244407224();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 = 0;
      if ((v8 & 1) == 0)
        return v3 & 1;
    }
    v9 = FieldType.rawValue.getter();
    v11 = v10;
    if (v9 == FieldType.rawValue.getter() && v11 == v12)
      v3 = 1;
    else
      v3 = sub_244407224();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t _s6Planks11ColumnChunkV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  int v5;
  __int128 v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  __int128 v12;
  __int16 v13;
  uint64_t result;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int16 v26;
  __int128 v27;
  __int16 v28;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 33);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = *(_WORD *)(a1 + 56);
  v9 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v10 = *(unsigned __int8 *)(a2 + 32);
  v11 = *(unsigned __int8 *)(a2 + 33);
  v12 = *(_OWORD *)(a2 + 40);
  v13 = *(_WORD *)(a2 + 56);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    result = 0;
    if (v2 != v9 || v3 != v8)
      return result;
LABEL_9:
    if ((v4 & 1) != 0)
    {
      if (!v10)
        return 0;
    }
    else if ((v10 & 1) != 0)
    {
      return 0;
    }
    if (v5 == 2)
    {
      if (v11 != 2)
        return 0;
LABEL_33:
      if (v7 == 12)
      {
        if (v13 != 12)
          return 0;
      }
      else
      {
        v27 = v6;
        v28 = v7;
        if (v13 == 12)
          return 0;
        v25 = v12;
        v26 = v13;
        if ((_s6Planks22QuantizationParametersV2eeoiySbAC_ACtFZ_0((double *)&v27, (double *)&v25) & 1) == 0)
          return 0;
      }
      return 1;
    }
    if (v11 != 2)
    {
      v22 = v6;
      v24 = v12;
      if ((v5 & 1) != 0)
        v16 = 0x657A69746E617571;
      else
        v16 = 0x6572706D6F636E75;
      if ((v5 & 1) != 0)
        v17 = 0xE900000000000064;
      else
        v17 = 0xEC00000064657373;
      if ((v11 & 1) != 0)
        v18 = 0x657A69746E617571;
      else
        v18 = 0x6572706D6F636E75;
      if ((v11 & 1) != 0)
        v19 = 0xE900000000000064;
      else
        v19 = 0xEC00000064657373;
      if (v16 == v18 && v17 == v19)
      {
        swift_bridgeObjectRelease_n();
        v6 = v22;
        v12 = v24;
      }
      else
      {
        v20 = sub_244407224();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = 0;
        v6 = v22;
        v12 = v24;
        if ((v20 & 1) == 0)
          return result;
      }
      goto LABEL_33;
    }
    return 0;
  }
  v21 = *(_OWORD *)(a1 + 40);
  v23 = *(_OWORD *)(a2 + 40);
  v15 = sub_244407224();
  result = 0;
  if ((v15 & 1) != 0 && v2 == v9)
  {
    v6 = v21;
    v12 = v23;
    if (v3 == v8)
      goto LABEL_9;
  }
  return result;
}

uint64_t _s6Planks12FileMetadataV2eeoiySbAC_ACtFZ_0(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*a1 == *(_QWORD *)a2
    && (v3 = a1[2],
        v2 = a1[3],
        v5 = *(_QWORD *)(a2 + 16),
        v4 = *(_QWORD *)(a2 + 24),
        (sub_2443D7150(a1[1], *(_QWORD **)(a2 + 8)) & 1) != 0)
    && sub_2443D74A8(v3, v5))
  {
    return sub_2443FBAB0(v2, v4);
  }
  else
  {
    return 0;
  }
}

BOOL _s6Planks13SchemaElementV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  char v5;
  _BOOL8 result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v2 = a1[3];
  v3 = a2[3];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_244407224(), result = 0, (v5 & 1) != 0))
  {
    v7 = FieldType.rawValue.getter();
    v9 = v8;
    if (v7 == FieldType.rawValue.getter() && v9 == v10)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v11 = sub_244407224();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = 0;
      if ((v11 & 1) == 0)
        return result;
    }
    return v2 == v3;
  }
  return result;
}

unint64_t sub_2443FCE10()
{
  unint64_t result;

  result = qword_25735E2A0;
  if (!qword_25735E2A0)
  {
    result = MEMORY[0x24950E66C](&unk_244408D0C, &type metadata for SchemaElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E2A0);
  }
  return result;
}

unint64_t sub_2443FCE54()
{
  unint64_t result;

  result = qword_25735E2A8;
  if (!qword_25735E2A8)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for FieldType, &type metadata for FieldType);
    atomic_store(result, (unint64_t *)&qword_25735E2A8);
  }
  return result;
}

unint64_t sub_2443FCE98()
{
  unint64_t result;

  result = qword_25735E2B8;
  if (!qword_25735E2B8)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for FieldType, &type metadata for FieldType);
    atomic_store(result, (unint64_t *)&qword_25735E2B8);
  }
  return result;
}

unint64_t sub_2443FCEDC()
{
  unint64_t result;

  result = qword_25735E2C8;
  if (!qword_25735E2C8)
  {
    result = MEMORY[0x24950E66C](&unk_244408CBC, &type metadata for ColumnChunk.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E2C8);
  }
  return result;
}

unint64_t sub_2443FCF20()
{
  unint64_t result;

  result = qword_25735E2D0;
  if (!qword_25735E2D0)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ChunkEncoding, &type metadata for ChunkEncoding);
    atomic_store(result, (unint64_t *)&qword_25735E2D0);
  }
  return result;
}

unint64_t sub_2443FCF64()
{
  unint64_t result;

  result = qword_25735E2D8;
  if (!qword_25735E2D8)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ChunkCompression, &type metadata for ChunkCompression);
    atomic_store(result, (unint64_t *)&qword_25735E2D8);
  }
  return result;
}

unint64_t sub_2443FCFA8()
{
  unint64_t result;

  result = qword_25735E2E0;
  if (!qword_25735E2E0)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for QuantizationParameters, &type metadata for QuantizationParameters);
    atomic_store(result, (unint64_t *)&qword_25735E2E0);
  }
  return result;
}

unint64_t sub_2443FCFEC()
{
  unint64_t result;

  result = qword_25735E2F0;
  if (!qword_25735E2F0)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ChunkEncoding, &type metadata for ChunkEncoding);
    atomic_store(result, (unint64_t *)&qword_25735E2F0);
  }
  return result;
}

unint64_t sub_2443FD030()
{
  unint64_t result;

  result = qword_25735E2F8;
  if (!qword_25735E2F8)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ChunkCompression, &type metadata for ChunkCompression);
    atomic_store(result, (unint64_t *)&qword_25735E2F8);
  }
  return result;
}

unint64_t sub_2443FD074()
{
  unint64_t result;

  result = qword_25735E300;
  if (!qword_25735E300)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for QuantizationParameters, &type metadata for QuantizationParameters);
    atomic_store(result, (unint64_t *)&qword_25735E300);
  }
  return result;
}

uint64_t _s6Planks8RowGroupV2eeoiySbAC_ACtFZ_0(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t result;
  unsigned int v21;
  uint64_t v22;

  v2 = *a1;
  v3 = *((_QWORD *)a1 + 1);
  v4 = *((_QWORD *)a1 + 2);
  v6 = *((_QWORD *)a1 + 3);
  v5 = *((_QWORD *)a1 + 4);
  v8 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = 0xE400000000000000;
  v11 = 1635017060;
  if (v2 != 1)
  {
    v11 = 0x7865646E69;
    v10 = 0xE500000000000000;
  }
  if (*a1)
    v12 = v11;
  else
    v12 = 0x656C706D6973;
  if (v2)
    v13 = v10;
  else
    v13 = 0xE600000000000000;
  v14 = 0xE400000000000000;
  v15 = 1635017060;
  if (*(_BYTE *)a2 != 1)
  {
    v15 = 0x7865646E69;
    v14 = 0xE500000000000000;
  }
  if (*(_BYTE *)a2)
    v16 = v15;
  else
    v16 = 0x656C706D6973;
  if (*(_BYTE *)a2)
    v17 = v14;
  else
    v17 = 0xE600000000000000;
  v22 = *(_QWORD *)(a2 + 32);
  if (v12 == v16 && v13 == v17)
  {
    v18 = v5;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v18 = v5;
    v19 = sub_244407224();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v19 & 1) == 0)
      return result;
  }
  v21 = sub_2443D7060(v3, v8) & (v4 == v7);
  if (v6 != v9)
    v21 = 0;
  if (v18 == v22)
    return v21;
  else
    return 0;
}

unint64_t sub_2443FD210()
{
  unint64_t result;

  result = qword_25735E310;
  if (!qword_25735E310)
  {
    result = MEMORY[0x24950E66C](&unk_244408C6C, &type metadata for RowGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E310);
  }
  return result;
}

unint64_t sub_2443FD254()
{
  unint64_t result;

  result = qword_25735E318;
  if (!qword_25735E318)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for RowGroupType, &type metadata for RowGroupType);
    atomic_store(result, (unint64_t *)&qword_25735E318);
  }
  return result;
}

unint64_t sub_2443FD298()
{
  unint64_t result;

  result = qword_25735E330;
  if (!qword_25735E330)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ColumnChunk, &type metadata for ColumnChunk);
    atomic_store(result, (unint64_t *)&qword_25735E330);
  }
  return result;
}

unint64_t sub_2443FD2DC()
{
  unint64_t result;

  result = qword_25735E340;
  if (!qword_25735E340)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for RowGroupType, &type metadata for RowGroupType);
    atomic_store(result, (unint64_t *)&qword_25735E340);
  }
  return result;
}

unint64_t sub_2443FD320()
{
  unint64_t result;

  result = qword_25735E350;
  if (!qword_25735E350)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ColumnChunk, &type metadata for ColumnChunk);
    atomic_store(result, (unint64_t *)&qword_25735E350);
  }
  return result;
}

unint64_t sub_2443FD364()
{
  unint64_t result;

  result = qword_25735E360;
  if (!qword_25735E360)
  {
    result = MEMORY[0x24950E66C](&unk_244408C1C, &type metadata for FileMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E360);
  }
  return result;
}

unint64_t sub_2443FD3A8()
{
  unint64_t result;

  result = qword_25735E378;
  if (!qword_25735E378)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for SchemaElement, &type metadata for SchemaElement);
    atomic_store(result, (unint64_t *)&qword_25735E378);
  }
  return result;
}

unint64_t sub_2443FD3EC()
{
  unint64_t result;

  result = qword_25735E390;
  if (!qword_25735E390)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for RowGroup, &type metadata for RowGroup);
    atomic_store(result, (unint64_t *)&qword_25735E390);
  }
  return result;
}

unint64_t sub_2443FD430()
{
  unint64_t result;

  result = qword_25735E3B8;
  if (!qword_25735E3B8)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for SchemaElement, &type metadata for SchemaElement);
    atomic_store(result, (unint64_t *)&qword_25735E3B8);
  }
  return result;
}

uint64_t sub_2443FD474(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x24950E66C](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2443FD4D8()
{
  unint64_t result;

  result = qword_25735E3C8;
  if (!qword_25735E3C8)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for RowGroup, &type metadata for RowGroup);
    atomic_store(result, (unint64_t *)&qword_25735E3C8);
  }
  return result;
}

uint64_t sub_2443FD51C(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25735E398);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x24950E66C](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2443FD57C()
{
  unint64_t result;

  result = qword_25735E3E0;
  if (!qword_25735E3E0)
  {
    result = MEMORY[0x24950E66C](&unk_244408BCC, &type metadata for QuantizationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E3E0);
  }
  return result;
}

unint64_t sub_2443FD5C4()
{
  unint64_t result;

  result = qword_25735E3F0;
  if (!qword_25735E3F0)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for FieldType, &type metadata for FieldType);
    atomic_store(result, (unint64_t *)&qword_25735E3F0);
  }
  return result;
}

uint64_t sub_2443FD608()
{
  return sub_2443FD770(&qword_25735E3F8, &qword_25735E400);
}

unint64_t sub_2443FD630()
{
  unint64_t result;

  result = qword_25735E408;
  if (!qword_25735E408)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ChunkEncoding, &type metadata for ChunkEncoding);
    atomic_store(result, (unint64_t *)&qword_25735E408);
  }
  return result;
}

uint64_t sub_2443FD674()
{
  return sub_2443FD770(&qword_25735E410, &qword_25735E418);
}

unint64_t sub_2443FD69C()
{
  unint64_t result;

  result = qword_25735E420;
  if (!qword_25735E420)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ChunkCompression, &type metadata for ChunkCompression);
    atomic_store(result, (unint64_t *)&qword_25735E420);
  }
  return result;
}

uint64_t sub_2443FD6E0()
{
  return sub_2443FD770(&qword_25735E428, &qword_25735E430);
}

unint64_t sub_2443FD708()
{
  unint64_t result;

  result = qword_25735E438;
  if (!qword_25735E438)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for RowGroupType, &type metadata for RowGroupType);
    atomic_store(result, (unint64_t *)&qword_25735E438);
  }
  return result;
}

uint64_t sub_2443FD74C()
{
  return sub_2443FD770(&qword_25735E440, &qword_25735E448);
}

uint64_t sub_2443FD770(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of Chunkable.beginOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Chunkable.byteSize.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Chunkable.endOffset.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

ValueMetadata *type metadata accessor for PlanksDefaults()
{
  return &type metadata for PlanksDefaults;
}

uint64_t getEnumTagSinglePayload for FieldType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FieldType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_2443FD8B4 + 4 * byte_244407F74[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_2443FD8E8 + 4 * byte_244407F6F[v4]))();
}

uint64_t sub_2443FD8E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FD8F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2443FD8F8);
  return result;
}

uint64_t sub_2443FD904(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2443FD90CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_2443FD910(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FD918(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FieldType()
{
  return &type metadata for FieldType;
}

uint64_t initializeWithCopy for SchemaElement(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SchemaElement(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
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

uint64_t assignWithTake for SchemaElement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

ValueMetadata *type metadata accessor for SchemaElement()
{
  return &type metadata for SchemaElement;
}

uint64_t getEnumTagSinglePayload for ChunkEncoding(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ChunkEncoding(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2443FDAC8 + 4 * byte_244407F79[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2443FDAE8 + 4 * byte_244407F7E[v4]))();
}

_BYTE *sub_2443FDAC8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2443FDAE8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2443FDAF0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2443FDAF8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2443FDB00(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2443FDB08(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2443FDB14()
{
  return 0;
}

ValueMetadata *type metadata accessor for ChunkEncoding()
{
  return &type metadata for ChunkEncoding;
}

uint64_t storeEnumTagSinglePayload for ChunkCompression(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2443FDB78 + 4 * byte_244407F88[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2443FDBAC + 4 * byte_244407F83[v4]))();
}

uint64_t sub_2443FDBAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FDBB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2443FDBBCLL);
  return result;
}

uint64_t sub_2443FDBC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2443FDBD0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2443FDBD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FDBDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ChunkCompression()
{
  return &type metadata for ChunkCompression;
}

uint64_t destroy for ColumnChunk()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ColumnChunk(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ColumnChunk(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  v4 = *(_OWORD *)(a2 + 40);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v4;
  return a1;
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ColumnChunk(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_WORD *)(a1 + 56) = *(_WORD *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColumnChunk(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 58))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ColumnChunk(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 58) = 1;
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
    *(_BYTE *)(result + 58) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ColumnChunk()
{
  return &type metadata for ColumnChunk;
}

ValueMetadata *type metadata accessor for RowGroupType()
{
  return &type metadata for RowGroupType;
}

uint64_t initializeWithCopy for RowGroup(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RowGroup(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
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

uint64_t assignWithTake for RowGroup(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for RowGroup(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RowGroup(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RowGroup()
{
  return &type metadata for RowGroup;
}

uint64_t destroy for FileMetadata()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for FileMetadata(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for FileMetadata(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for FileMetadata(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s6Planks13SchemaElementVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2443FE134(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FileMetadata()
{
  return &type metadata for FileMetadata;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for QuantizationParameters(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xF5 && *(_BYTE *)(a1 + 18))
    return (*(_DWORD *)a1 + 245);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 0xC;
  v5 = v3 - 12;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for QuantizationParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 245;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 11;
  }
  return result;
}

ValueMetadata *type metadata accessor for QuantizationParameters()
{
  return &type metadata for QuantizationParameters;
}

ValueMetadata *type metadata accessor for QuantizationParameters.CodingKeys()
{
  return &type metadata for QuantizationParameters.CodingKeys;
}

uint64_t _s6Planks22QuantizationParametersV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s6Planks22QuantizationParametersV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2443FE324 + 4 * byte_244407F92[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2443FE358 + 4 * byte_244407F8D[v4]))();
}

uint64_t sub_2443FE358(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FE360(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2443FE368);
  return result;
}

uint64_t sub_2443FE374(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2443FE37CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2443FE380(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FE388(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FileMetadata.CodingKeys()
{
  return &type metadata for FileMetadata.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RowGroup.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RowGroup.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2443FE480 + 4 * byte_244407F9C[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2443FE4B4 + 4 * byte_244407F97[v4]))();
}

uint64_t sub_2443FE4B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FE4BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2443FE4C4);
  return result;
}

uint64_t sub_2443FE4D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2443FE4D8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2443FE4DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FE4E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RowGroup.CodingKeys()
{
  return &type metadata for RowGroup.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ColumnChunk.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ColumnChunk.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2443FE5DC + 4 * byte_244407FA6[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2443FE610 + 4 * byte_244407FA1[v4]))();
}

uint64_t sub_2443FE610(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FE618(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2443FE620);
  return result;
}

uint64_t sub_2443FE62C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2443FE634);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2443FE638(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FE640(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2443FE64C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ColumnChunk.CodingKeys()
{
  return &type metadata for ColumnChunk.CodingKeys;
}

uint64_t _s6Planks12RowGroupTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s6Planks12RowGroupTypeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2443FE740 + 4 * byte_244407FB0[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2443FE774 + 4 * byte_244407FAB[v4]))();
}

uint64_t sub_2443FE774(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FE77C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2443FE784);
  return result;
}

uint64_t sub_2443FE790(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2443FE798);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2443FE79C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2443FE7A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SchemaElement.CodingKeys()
{
  return &type metadata for SchemaElement.CodingKeys;
}

unint64_t sub_2443FE7C4()
{
  unint64_t result;

  result = qword_25735E450;
  if (!qword_25735E450)
  {
    result = MEMORY[0x24950E66C](&unk_2444088C4, &type metadata for SchemaElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E450);
  }
  return result;
}

unint64_t sub_2443FE80C()
{
  unint64_t result;

  result = qword_25735E458;
  if (!qword_25735E458)
  {
    result = MEMORY[0x24950E66C](&unk_24440897C, &type metadata for ColumnChunk.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E458);
  }
  return result;
}

unint64_t sub_2443FE854()
{
  unint64_t result;

  result = qword_25735E460;
  if (!qword_25735E460)
  {
    result = MEMORY[0x24950E66C](&unk_244408A34, &type metadata for RowGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E460);
  }
  return result;
}

unint64_t sub_2443FE89C()
{
  unint64_t result;

  result = qword_25735E468;
  if (!qword_25735E468)
  {
    result = MEMORY[0x24950E66C](&unk_244408AEC, &type metadata for FileMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E468);
  }
  return result;
}

unint64_t sub_2443FE8E4()
{
  unint64_t result;

  result = qword_25735E470;
  if (!qword_25735E470)
  {
    result = MEMORY[0x24950E66C](&unk_244408BA4, &type metadata for QuantizationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E470);
  }
  return result;
}

unint64_t sub_2443FE92C()
{
  unint64_t result;

  result = qword_25735E478;
  if (!qword_25735E478)
  {
    result = MEMORY[0x24950E66C](&unk_244408B14, &type metadata for QuantizationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E478);
  }
  return result;
}

unint64_t sub_2443FE974()
{
  unint64_t result;

  result = qword_25735E480;
  if (!qword_25735E480)
  {
    result = MEMORY[0x24950E66C](&unk_244408B3C, &type metadata for QuantizationParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E480);
  }
  return result;
}

unint64_t sub_2443FE9BC()
{
  unint64_t result;

  result = qword_25735E488;
  if (!qword_25735E488)
  {
    result = MEMORY[0x24950E66C](&unk_244408A5C, &type metadata for FileMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E488);
  }
  return result;
}

unint64_t sub_2443FEA04()
{
  unint64_t result;

  result = qword_25735E490;
  if (!qword_25735E490)
  {
    result = MEMORY[0x24950E66C](&unk_244408A84, &type metadata for FileMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E490);
  }
  return result;
}

unint64_t sub_2443FEA4C()
{
  unint64_t result;

  result = qword_25735E498;
  if (!qword_25735E498)
  {
    result = MEMORY[0x24950E66C](&unk_2444089A4, &type metadata for RowGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E498);
  }
  return result;
}

unint64_t sub_2443FEA94()
{
  unint64_t result;

  result = qword_25735E4A0;
  if (!qword_25735E4A0)
  {
    result = MEMORY[0x24950E66C](&unk_2444089CC, &type metadata for RowGroup.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E4A0);
  }
  return result;
}

unint64_t sub_2443FEADC()
{
  unint64_t result;

  result = qword_25735E4A8;
  if (!qword_25735E4A8)
  {
    result = MEMORY[0x24950E66C](&unk_2444088EC, &type metadata for ColumnChunk.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E4A8);
  }
  return result;
}

unint64_t sub_2443FEB24()
{
  unint64_t result;

  result = qword_25735E4B0;
  if (!qword_25735E4B0)
  {
    result = MEMORY[0x24950E66C](&unk_244408914, &type metadata for ColumnChunk.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E4B0);
  }
  return result;
}

unint64_t sub_2443FEB6C()
{
  unint64_t result;

  result = qword_25735E4B8;
  if (!qword_25735E4B8)
  {
    result = MEMORY[0x24950E66C](&unk_244408834, &type metadata for SchemaElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E4B8);
  }
  return result;
}

unint64_t sub_2443FEBB4()
{
  unint64_t result;

  result = qword_25735E4C0;
  if (!qword_25735E4C0)
  {
    result = MEMORY[0x24950E66C](&unk_24440885C, &type metadata for SchemaElement.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25735E4C0);
  }
  return result;
}

uint64_t sub_2443FEBF8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x707954646C656966 && a2 == 0xE900000000000065 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x756F43646C656966 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2443FED54(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6150616D65686373 && a2 == 0xEA00000000006874;
  if (v2 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x66664F6E69676562 && a2 == 0xEB00000000746573 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x657A695365747962 && a2 == 0xE800000000000000 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x676E69646F636E65 && a2 == 0xE800000000000000 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x73736572706D6F63 && a2 == 0xEB000000006E6F69 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x617A69746E617571 && a2 == 0xEC0000006E6F6974)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_2443FF028(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7079546B6E756863 && a2 == 0xE900000000000065;
  if (v2 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x68436E6D756C6F63 && a2 == 0xEC000000736B6E75 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x66664F6E69676562 && a2 == 0xEB00000000746573 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x657A695365747962 && a2 == 0xE800000000000000 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E756F4373776F72 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_2443FF284(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616D65686373 && a2 == 0xE600000000000000 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x70756F7247776F72 && a2 == 0xE900000000000073 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000244409480)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_2443FF43C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1935763810 && a2 == 0xE400000000000000;
  if (v2 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C616373 && a2 == 0xE500000000000000 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61636973796870 && a2 == 0xEC00000065707954 || (sub_244407224() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x546C616369676F6CLL && a2 == 0xEB00000000657079)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_244407224();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

unint64_t sub_2443FF60C()
{
  unint64_t result;

  result = qword_25735E4C8;
  if (!qword_25735E4C8)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for RowGroupType, &type metadata for RowGroupType);
    atomic_store(result, (unint64_t *)&qword_25735E4C8);
  }
  return result;
}

unint64_t sub_2443FF650()
{
  unint64_t result;

  result = qword_25735E4D0;
  if (!qword_25735E4D0)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ChunkCompression, &type metadata for ChunkCompression);
    atomic_store(result, (unint64_t *)&qword_25735E4D0);
  }
  return result;
}

unint64_t sub_2443FF694()
{
  unint64_t result;

  result = qword_25735E4D8;
  if (!qword_25735E4D8)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for ChunkEncoding, &type metadata for ChunkEncoding);
    atomic_store(result, (unint64_t *)&qword_25735E4D8);
  }
  return result;
}

unint64_t sub_2443FF6D8()
{
  unint64_t result;

  result = qword_25735E4E0;
  if (!qword_25735E4E0)
  {
    result = MEMORY[0x24950E66C](&protocol conformance descriptor for FieldType, &type metadata for FieldType);
    atomic_store(result, (unint64_t *)&qword_25735E4E0);
  }
  return result;
}

uint64_t sub_2443FF730(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_2443FF748()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void (*v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  uint64_t v11;

  if ((sub_244406F30() & 1) != 0
    || (v1 = *(_QWORD *)(v0 + 24),
        v2 = (int *)type metadata accessor for AsyncTensorSequence(),
        v3 = v2[9],
        v4 = *(_QWORD *)(v1 + v3),
        v5 = *(_QWORD *)(v1 + v2[8]),
        v4 >= *(_QWORD *)(v5 + 16)))
  {
    v10 = *(_QWORD *)(v0 + 16);
    v11 = sub_244406D14();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 16);
    v7 = v5 + 16 * v4;
    v8 = *(NSObject **)(v7 + 32);
    v9 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 40);
    *(_QWORD *)(v1 + v3) = v4 + 1;
    sub_2443FFA8C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v8, v9, v1 + v2[7], v6);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PlanksReader.readBatch(label:as:batchIndex:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void (*v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  swift_bridgeObjectRetain();
  v10 = sub_2443D8A88();
  if (*(_QWORD *)(v10 + 16) && (v11 = sub_2443DC1EC(a1, a2), (v12 & 1) != 0))
  {
    v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14 = *(_QWORD *)(v13 + 16);
    if (v14 && (a4 & 0x8000000000000000) == 0 && v14 > a4)
    {
      v15 = v13 + 16 * a4;
      v16 = *(NSObject **)(v15 + 32);
      v17 = *(void (**)(_QWORD, _QWORD, _QWORD))(v15 + 40);
      swift_bridgeObjectRelease();
      return sub_2443FFA8C(a1, a2, v16, v17, a3, a5);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_25735DB50 != -1)
    swift_once();
  v19 = sub_244406D38();
  __swift_project_value_buffer(v19, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain_n();
  v20 = sub_244406D20();
  v21 = sub_244406FB4();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v25 = v23;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain();
    sub_2443DABA4(a1, a2, &v25);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v20, v21, "Found no valid indices for label: %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v23, -1, -1);
    MEMORY[0x24950E6FC](v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v24 = sub_244406D14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(a5, 1, 1, v24);
}

uint64_t sub_2443FFA8C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, NSObject *a3@<X2>, void (*a4)(_QWORD, _QWORD, _QWORD)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
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
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  void (*v54)(char *, uint64_t);
  unsigned int (*v55)(char *, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  _BOOL4 v60;
  uint64_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  _BOOL4 v69;
  uint64_t v70;
  uint8_t *v71;
  uint64_t v72;
  void (*v74)(char *, char *, uint64_t);
  char *v75;
  char *v76;
  void (*v77)(char *, char *, uint64_t);
  char *v78;
  void (*v79)(char *, uint64_t);
  uint64_t (*v80)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  _OWORD *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  os_log_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(char *, char *, uint64_t);
  char *v97;
  char *v98;
  char *v99;
  NSObject *v100;
  os_log_type_t v101;
  int v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  void (*v109)(char *, uint64_t);
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  os_log_t v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  os_log_type_t v122;
  _BOOL4 v123;
  uint64_t v124;
  uint8_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void (*v129)(char *, uint64_t);
  uint64_t v130;
  NSObject *v131;
  os_log_type_t v132;
  int v133;
  _BOOL4 v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  void (*v140)(char *, uint64_t);
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  char *v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  void (*v153)(char *, uint64_t);
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void (*v157)(char *, char *, uint64_t);
  char *v158;
  NSObject *v159;
  os_log_type_t v160;
  int v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  void (*v165)(char *, uint64_t);
  uint64_t v166;
  unint64_t v167;
  os_log_t v168;
  uint64_t v169;
  void (*v170)(char *, uint64_t);
  uint64_t v171;
  uint64_t v172;
  char *v173;
  char *v174;
  char *v175;
  void (*v176)(char *, uint64_t);
  uint64_t v177;
  uint64_t v178;
  os_log_t v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  char *v187;
  char *v188;
  char *v189;
  uint64_t v190;
  char *v191;
  char *v192;
  char *v193;
  char *v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  char *v199;
  uint64_t v200;
  void (*v201)(char *, uint64_t);
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206[2];
  char v207;
  _OWORD v208[2];
  uint64_t v209;
  _OWORD v210[2];
  _BYTE v211[26];

  v7 = v6;
  v198 = a5;
  v196 = (uint64_t)a4;
  v197 = (uint64_t)a3;
  v202 = a6;
  v10 = sub_24440720C();
  v184 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v183 = (char *)&v177 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE50);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v177 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = sub_244406C48();
  v185 = *(_QWORD *)(v186 - 8);
  MEMORY[0x24BDAC7A8](v186);
  v194 = (char *)&v177 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_244406D14();
  v203 = *(_QWORD *)(v16 - 8);
  v204 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v192 = (char *)&v177 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v189 = (char *)&v177 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v188 = (char *)&v177 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v195 = (char *)&v177 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v190 = (uint64_t)&v177 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v177 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v177 - v30;
  v200 = sub_244406C3C();
  v201 = *(void (**)(char *, uint64_t))(v200 - 8);
  v32 = MEMORY[0x24BDAC7A8](v200);
  v182 = (char *)&v177 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x24BDAC7A8](v32);
  v191 = (char *)&v177 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v187 = (char *)&v177 - v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v193 = (char *)&v177 - v39;
  v40 = MEMORY[0x24BDAC7A8](v38);
  v42 = (char *)&v177 - v41;
  v43 = MEMORY[0x24BDAC7A8](v40);
  v45 = (char *)&v177 - v44;
  MEMORY[0x24BDAC7A8](v43);
  v199 = (char *)&v177 - v46;
  swift_bridgeObjectRetain();
  v47 = sub_2443D8788();
  if (*(_QWORD *)(v47 + 16) && (v48 = sub_2443DC1EC(a1, a2), (v49 & 1) != 0))
  {
    v178 = v10;
    v50 = *(_QWORD *)(v47 + 56) + 32 * v48;
    v51 = *(NSObject **)(v50 + 8);
    v180 = *(_QWORD *)v50;
    v52 = *(unsigned __int8 *)(v50 + 16);
    v179 = *(os_log_t *)(v50 + 24);
    v53 = v51;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    LODWORD(v181) = v52;
    LOBYTE(v210[0]) = v52;
    ScalarType.init(fieldType:)((char *)v210, (uint64_t)v31);
    v54 = v201;
    v55 = (unsigned int (*)(char *, uint64_t, uint64_t))*((_QWORD *)v201 + 6);
    v56 = v200;
    if (v55(v31, 1, v200) == 1)
    {
      sub_244404D38((uint64_t)v31, &qword_25735DE18);
      if (qword_25735DB50 != -1)
        swift_once();
      v57 = sub_244406D38();
      __swift_project_value_buffer(v57, (uint64_t)qword_2573610D0);
      swift_bridgeObjectRetain();
      v58 = sub_244406D20();
      v59 = sub_244406FB4();
      v60 = os_log_type_enabled(v58, v59);
      v61 = v204;
      if (v60)
      {
        v62 = (uint8_t *)swift_slowAlloc();
        v63 = swift_slowAlloc();
        *(_QWORD *)&v210[0] = v63;
        *(_DWORD *)v62 = 136315138;
        LOBYTE(v208[0]) = v181;
        v64 = FieldType.description.getter();
        *(_QWORD *)&v208[0] = sub_2443DABA4(v64, v65, (uint64_t *)v210);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v58, v59, "Invalid ScalarType for element: %s", v62, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v63, -1, -1);
        MEMORY[0x24950E6FC](v62, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v203 + 56);
LABEL_34:
      v126 = v202;
      v127 = 1;
      return v80(v126, v127, 1, v61);
    }
    v74 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v54 + 4);
    v75 = v199;
    v76 = v31;
    v77 = v74;
    v74(v199, v76, v56);
    sub_2443E27E0(v198, (uint64_t)v29);
    if (v55(v29, 1, v56) == 1)
    {
      sub_244404D38((uint64_t)v29, &qword_25735DE18);
      v78 = v75;
      v79 = v201;
    }
    else
    {
      v77(v45, v29, v56);
      if ((sub_244406C30() & 1) == 0)
      {
        if (qword_25735DB50 != -1)
          swift_once();
        v128 = sub_244406D38();
        __swift_project_value_buffer(v128, (uint64_t)qword_2573610D0);
        v129 = v201;
        v130 = v200;
        (*((void (**)(char *, char *, uint64_t))v201 + 2))(v42, v45, v200);
        swift_bridgeObjectRetain();
        v131 = sub_244406D20();
        v132 = sub_244406FB4();
        v133 = v132;
        v134 = os_log_type_enabled(v131, v132);
        v135 = v199;
        if (v134)
        {
          v136 = swift_slowAlloc();
          v197 = (uint64_t)v53;
          v137 = v136;
          v198 = swift_slowAlloc();
          *(_QWORD *)&v210[0] = v198;
          *(_DWORD *)v137 = 136315394;
          LODWORD(v196) = v133;
          v138 = ScalarType.description.getter();
          *(_QWORD *)&v208[0] = sub_2443DABA4(v138, v139, (uint64_t *)v210);
          sub_244406FE4();
          swift_bridgeObjectRelease();
          v140 = (void (*)(char *, uint64_t))*((_QWORD *)v129 + 1);
          v140(v42, v130);
          *(_WORD *)(v137 + 12) = 2080;
          LOBYTE(v208[0]) = v181;
          v141 = FieldType.description.getter();
          *(_QWORD *)&v208[0] = sub_2443DABA4(v141, v142, (uint64_t *)v210);
          v135 = v199;
          sub_244406FE4();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2443D2000, v131, (os_log_type_t)v196, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v137, 0x16u);
          v143 = v198;
          swift_arrayDestroy();
          MEMORY[0x24950E6FC](v143, -1, -1);
          MEMORY[0x24950E6FC](v137, -1, -1);

        }
        else
        {
          v140 = (void (*)(char *, uint64_t))*((_QWORD *)v129 + 1);
          v140(v42, v130);

          swift_bridgeObjectRelease_n();
        }
        v144 = v202;
        sub_244406CA8();
        v140(v45, v130);
        v140(v135, v130);
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v203 + 56))(v144, 0, 1, v204);
      }
      v79 = v201;
      (*((void (**)(char *, uint64_t))v201 + 1))(v45, v56);
      v78 = v199;
    }
    v61 = v204;
    if (v197 < 0
      || (v81 = *(_QWORD *)(v7 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16), *(_QWORD *)(v81 + 16) <= v197)
      || (v82 = v81 + 40 * v197,
          v84 = *(_OWORD *)(v82 + 32),
          v83 = *(_OWORD *)(v82 + 48),
          v209 = *(_QWORD *)(v82 + 64),
          v208[0] = v84,
          v208[1] = v83,
          v196 < 0)
      || *(_QWORD *)(*((_QWORD *)&v208[0] + 1) + 16) <= v196)
    {
      swift_bridgeObjectRelease();
      if (qword_25735DB50 != -1)
        swift_once();
      v120 = sub_244406D38();
      __swift_project_value_buffer(v120, (uint64_t)qword_2573610D0);
      v121 = sub_244406D20();
      v122 = sub_244406FB4();
      v123 = os_log_type_enabled(v121, v122);
      v124 = v203;
      if (v123)
      {
        v125 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v125 = 0;
        _os_log_impl(&dword_2443D2000, v121, v122, "Invalid index", v125, 2u);
        MEMORY[0x24950E6FC](v125, -1, -1);
      }

      (*((void (**)(char *, uint64_t))v201 + 1))(v78, v200);
      v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v124 + 56);
      goto LABEL_34;
    }
    v197 = (uint64_t)v77;
    v85 = (_OWORD *)(*((_QWORD *)&v208[0] + 1) + (v196 << 6));
    v86 = v85[2];
    v87 = v85[3];
    v88 = v85[4];
    *(_OWORD *)&v211[10] = *(_OWORD *)((char *)v85 + 74);
    v210[1] = v87;
    *(_OWORD *)v211 = v88;
    v210[0] = v86;
    v207 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25735DB60);
    v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_2444076A0;
    v90 = v179;
    *(_QWORD *)(v89 + 32) = v209;
    *(_QWORD *)(v89 + 40) = v90;
    sub_2443DDBAC((uint64_t)v208);
    sub_2443DDBAC((uint64_t)v210);
    sub_244406C54();
    v196 = *((_QWORD *)v79 + 2);
    ((void (*)(char *, char *, uint64_t))v196)(v193, v78, v56);
    sub_244406C78();
    v91 = sub_244406C84();
    v92 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v91 - 8) + 56))(v14, 0, 1, v91);
    MEMORY[0x24BDAC7A8](v92);
    *(&v177 - 8) = v180;
    *(&v177 - 7) = (uint64_t)v53;
    *((_BYTE *)&v177 - 48) = v181;
    *(&v177 - 5) = (uint64_t)v90;
    *(&v177 - 4) = (uint64_t)v208;
    *(&v177 - 3) = (uint64_t)v210;
    *(&v177 - 2) = v7;
    *(&v177 - 1) = (uint64_t)&v207;
    v93 = v195;
    sub_244406CC0();
    swift_bridgeObjectRelease();
    sub_2443E6EA8((uint64_t)v208);
    sub_2443E6EA8((uint64_t)v210);
    if ((v207 & 1) != 0)
    {
      v94 = v203;
      v61 = v204;
      if (qword_25735DB50 != -1)
        swift_once();
      v95 = sub_244406D38();
      __swift_project_value_buffer(v95, (uint64_t)qword_2573610D0);
      v96 = *(void (**)(char *, char *, uint64_t))(v94 + 16);
      v97 = v188;
      v96(v188, v93, v61);
      v98 = v189;
      v96(v189, v93, v61);
      v99 = v192;
      v96(v192, v93, v61);
      v100 = sub_244406D20();
      v101 = sub_244406FA8();
      v102 = v101;
      if (os_log_type_enabled(v100, v101))
      {
        v103 = swift_slowAlloc();
        v181 = swift_slowAlloc();
        v206[0] = v181;
        *(_DWORD *)v103 = 136315650;
        v177 = v103 + 4;
        v104 = v194;
        LODWORD(v180) = v102;
        sub_244406CF0();
        sub_2443E2B34(&qword_25735DE20, (uint64_t (*)(uint64_t))MEMORY[0x24BE6B8F8], MEMORY[0x24BE6B918]);
        v179 = v100;
        v105 = v186;
        v106 = sub_2444071F4();
        v108 = v107;
        (*(void (**)(char *, uint64_t))(v185 + 8))(v104, v105);
        v205 = sub_2443DABA4(v106, v108, v206);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        v109 = *(void (**)(char *, uint64_t))(v94 + 8);
        v109(v97, v204);
        *(_WORD *)(v103 + 12) = 2048;
        v110 = sub_244406C9C();
        v109(v98, v204);
        v205 = v110;
        sub_244406FE4();
        *(_WORD *)(v103 + 22) = 2080;
        v111 = v193;
        v112 = v192;
        sub_244406C90();
        v113 = ScalarType.description.getter();
        v115 = v114;
        v116 = v111;
        v117 = v200;
        (*((void (**)(char *, uint64_t))v201 + 1))(v116, v200);
        v205 = sub_2443DABA4(v113, v115, v206);
        sub_244406FE4();
        v61 = v204;
        swift_bridgeObjectRelease();
        v109(v112, v61);
        v118 = v179;
        _os_log_impl(&dword_2443D2000, v179, (os_log_type_t)v180, "Loaded tensor %s of %ld elements of type %s.", (uint8_t *)v103, 0x20u);
        v119 = v181;
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v119, -1, -1);
        MEMORY[0x24950E6FC](v103, -1, -1);

      }
      else
      {
        v109 = *(void (**)(char *, uint64_t))(v94 + 8);
        v109(v98, v61);
        v109(v97, v61);
        v109(v99, v61);

        v117 = v200;
      }
      v148 = v199;
      v149 = v191;
      v150 = v190;
      sub_2443E27E0(v198, v190);
      if (v55((char *)v150, 1, v117) == 1)
      {
        (*((void (**)(char *, uint64_t))v201 + 1))(v148, v117);
        sub_244404D38(v150, &qword_25735DE18);
      }
      else
      {
        v151 = v187;
        ((void (*)(char *, uint64_t, uint64_t))v197)(v187, v150, v117);
        sub_2443E2B34(&qword_25735DE38, (uint64_t (*)(uint64_t))MEMORY[0x24BE6B8D0], MEMORY[0x24BE6B8E0]);
        v152 = v117;
        if ((sub_244406DEC() & 1) == 0)
        {
          v156 = v117;
          v157 = (void (*)(char *, char *, uint64_t))v196;
          ((void (*)(char *, char *, uint64_t))v196)(v149, v148, v156);
          v158 = v182;
          v157(v182, v151, v152);
          v159 = sub_244406D20();
          v160 = sub_244406FA8();
          v161 = v160;
          if (os_log_type_enabled(v159, v160))
          {
            v162 = swift_slowAlloc();
            v198 = swift_slowAlloc();
            v206[0] = v198;
            *(_DWORD *)v162 = 136315394;
            v197 = (uint64_t)v159;
            v163 = ScalarType.description.getter();
            v205 = sub_2443DABA4(v163, v164, v206);
            sub_244406FE4();
            swift_bridgeObjectRelease();
            LODWORD(v196) = v161;
            v165 = (void (*)(char *, uint64_t))*((_QWORD *)v201 + 1);
            v165(v149, v152);
            *(_WORD *)(v162 + 12) = 2080;
            v166 = ScalarType.description.getter();
            v205 = sub_2443DABA4(v166, v167, v206);
            v148 = v199;
            sub_244406FE4();
            swift_bridgeObjectRelease();
            v201 = v165;
            v165(v158, v152);
            v168 = (os_log_t)v197;
            _os_log_impl(&dword_2443D2000, (os_log_t)v197, (os_log_type_t)v196, "Casting tensor of type %s to type %s.", (uint8_t *)v162, 0x16u);
            v169 = v198;
            swift_arrayDestroy();
            MEMORY[0x24950E6FC](v169, -1, -1);
            MEMORY[0x24950E6FC](v162, -1, -1);

          }
          else
          {
            v170 = (void (*)(char *, uint64_t))*((_QWORD *)v201 + 1);
            v170(v149, v152);
            v201 = v170;
            v170(v158, v152);

          }
          v171 = v178;
          v172 = v184;
          v173 = v183;
          (*(void (**)(char *, _QWORD, uint64_t))(v184 + 104))(v183, *MEMORY[0x24BEE38B8], v178);
          v155 = v202;
          v174 = v187;
          v175 = v195;
          sub_244406CCC();
          (*(void (**)(char *, uint64_t))(v172 + 8))(v173, v171);
          v176 = v201;
          v201(v174, v152);
          v109(v175, v61);
          v176(v148, v152);
          v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v203 + 56);
          goto LABEL_53;
        }
        v153 = (void (*)(char *, uint64_t))*((_QWORD *)v201 + 1);
        v153(v151, v152);
        v153(v148, v152);
      }
      v154 = v203;
      v155 = v202;
      (*(void (**)(uint64_t, char *, uint64_t))(v203 + 32))(v202, v195, v61);
      v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v154 + 56);
LABEL_53:
      v126 = v155;
      v127 = 0;
      return v80(v126, v127, 1, v61);
    }
    v145 = v93;
    v146 = v203;
    v147 = v204;
    (*(void (**)(char *, uint64_t))(v203 + 8))(v145, v204);
    (*((void (**)(char *, uint64_t))v201 + 1))(v199, v200);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v146 + 56))(v202, 1, 1, v147);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v66 = sub_244406D38();
    __swift_project_value_buffer(v66, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v67 = sub_244406D20();
    v68 = sub_244406FB4();
    v69 = os_log_type_enabled(v67, v68);
    v70 = v204;
    if (v69)
    {
      v71 = (uint8_t *)swift_slowAlloc();
      v72 = swift_slowAlloc();
      *(_QWORD *)&v210[0] = v72;
      *(_DWORD *)v71 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v208[0] = sub_2443DABA4(a1, a2, (uint64_t *)v210);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v67, v68, "Invalid SchemaElement for label: %s", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v72, -1, -1);
      MEMORY[0x24950E6FC](v71, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v203 + 56))(v202, 1, 1, v70);
  }
}

uint64_t PlanksReader.iterBatches(label:as:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v11 = sub_2443D8A88();
  if (*(_QWORD *)(v11 + 16) && (v12 = sub_2443DC1EC(a1, a2), (v13 & 1) != 0))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v15 = *(_QWORD *)(v14 + 16);
    swift_bridgeObjectRelease();
    if (v15)
    {
      sub_2443E27E0(a3, (uint64_t)v10);
      swift_bridgeObjectRetain();
      v16 = swift_retain();
      return sub_24440119C(v16, a1, a2, (uint64_t)v10, a4);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  if (qword_25735DB50 != -1)
    swift_once();
  v18 = sub_244406D38();
  __swift_project_value_buffer(v18, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain_n();
  v19 = sub_244406D20();
  v20 = sub_244406FB4();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v25 = v22;
    *(_DWORD *)v21 = 136315138;
    swift_bridgeObjectRetain();
    v24 = sub_2443DABA4(a1, a2, &v25);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v19, v20, "Found no valid indices for label: %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v22, -1, -1);
    MEMORY[0x24950E6FC](v21, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v23 = type metadata accessor for AsyncTensorSequence();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(a4, 1, 1, v23);
}

uint64_t sub_24440119C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v10 = type metadata accessor for AsyncTensorSequence();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t *)((char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  *(_QWORD *)((char *)v14 + *(int *)(v12 + 36)) = 0;
  swift_bridgeObjectRetain();
  v15 = sub_2443D8A88();
  if (*(_QWORD *)(v15 + 16) && (v16 = sub_2443DC1EC(a2, a3), (v17 & 1) != 0))
  {
    v18 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v14[1] = a1;
    v14[2] = a2;
    v14[3] = a3;
    sub_2443E27E0(a4, (uint64_t)v14 + *(int *)(v10 + 28));
    *(_QWORD *)((char *)v14 + *(int *)(v10 + 32)) = v18;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_2443D9D44(a2, a3);
    v20 = v19;
    swift_bridgeObjectRelease();
    swift_release();
    sub_244404D38(a4, &qword_25735DE18);
    *v14 = v20;
    sub_244404414((uint64_t)v14, a5);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(a5, 0, 1, v10);
    return sub_244404E60((uint64_t)v14);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v22 = sub_244406D38();
    __swift_project_value_buffer(v22, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v23 = sub_244406D20();
    v24 = sub_244406FB4();
    if (os_log_type_enabled(v23, v24))
    {
      v33 = v11;
      v25 = swift_slowAlloc();
      v34 = a5;
      v26 = (uint8_t *)v25;
      v27 = swift_slowAlloc();
      v32 = a4;
      v28 = v27;
      v36 = v27;
      *(_DWORD *)v26 = 136315138;
      swift_bridgeObjectRetain();
      v35 = sub_2443DABA4(a2, a3, &v36);
      v11 = v33;
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v23, v24, "Invalid label: %s for AsyncTensorSequence.", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v28, -1, -1);
      v29 = v26;
      a5 = v34;
      MEMORY[0x24950E6FC](v29, -1, -1);

      swift_release();
      v30 = v32;
    }
    else
    {
      swift_bridgeObjectRelease_n();

      swift_release();
      v30 = a4;
    }
    sub_244404D38(v30, &qword_25735DE18);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(a5, 1, 1, v10);
  }
}

uint64_t PlanksReader.readTensor(label:as:)@<X0>(void (*a1)(_QWORD, _QWORD, _QWORD)@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
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
  char *v26;
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
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  unsigned int (*v53)(char *, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  _BOOL4 v58;
  uint64_t v59;
  uint8_t *v60;
  void (*v61)(_QWORD, _QWORD, _QWORD);
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  _BOOL4 v67;
  uint64_t v68;
  uint8_t *v69;
  void (*v70)(_QWORD, _QWORD, _QWORD);
  char *v72;
  void (*v73)(char *, char *, uint64_t);
  unsigned int v74;
  uint64_t v75;
  char *v76;
  char v77;
  void (*v78)(_QWORD, _QWORD, _QWORD);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, char *, uint64_t);
  char *v96;
  char *v97;
  char *v98;
  NSObject *v99;
  os_log_type_t v100;
  int v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  void (*v108)(char *, uint64_t);
  uint64_t v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  char *v116;
  os_log_t v117;
  void (*v118)(_QWORD, _QWORD, _QWORD);
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  os_log_type_t v122;
  _BOOL4 v123;
  void (*v124)(_QWORD, _QWORD, _QWORD);
  uint8_t *v125;
  void (*v126)(_QWORD, _QWORD, _QWORD);
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t (*v130)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  NSObject *v136;
  os_log_type_t v137;
  uint64_t v138;
  uint64_t v139;
  unint64_t v140;
  void (*v141)(char *, uint64_t);
  uint64_t v142;
  unint64_t v143;
  void (*v144)(_QWORD, _QWORD, _QWORD);
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  unsigned int (*v151)(uint64_t, uint64_t, uint64_t);
  uint64_t v152;
  uint64_t v153;
  void (*v154)(char *, uint64_t);
  uint64_t v155;
  uint64_t v156;
  char *v157;
  char *v158;
  void (*v159)(char *, char *, uint64_t);
  char *v160;
  NSObject *v161;
  os_log_type_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char *v166;
  void (*v167)(char *, uint64_t);
  uint64_t v168;
  unint64_t v169;
  void (*v170)(_QWORD, _QWORD, _QWORD);
  uint64_t v171;
  char *v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  char *v178;
  uint64_t v179;
  _QWORD v180[2];
  void (*v181)(char *, uint64_t, uint64_t);
  unsigned int (*v182)(uint64_t, uint64_t, uint64_t);
  uint64_t v183;
  os_log_t v184;
  uint64_t v185;
  void (*v186)(_QWORD, _QWORD, _QWORD);
  char *v187;
  char *v188;
  char *v189;
  char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  char *v195;
  char *v196;
  char *v197;
  uint64_t v198;
  char *v199;
  char *v200;
  char *v201;
  char *v202;
  uint64_t v203;
  char *v204;
  uint64_t v205;
  void (*v206)(_QWORD, _QWORD, _QWORD);
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  char v210;
  uint64_t v211;
  void (*v212)(_QWORD, _QWORD, _QWORD);

  v5 = v4;
  v203 = a3;
  v207 = a4;
  v192 = sub_24440720C();
  v191 = *(_QWORD *)(v192 - 8);
  MEMORY[0x24BDAC7A8](v192);
  v190 = (char *)v180 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE50);
  MEMORY[0x24BDAC7A8](v9);
  v200 = (char *)v180 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_244406C48();
  v193 = *(_QWORD *)(v11 - 8);
  v194 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v201 = (char *)v180 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_244406D14();
  v208 = *(_QWORD *)(v13 - 8);
  v209 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v197 = (char *)v180 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v196 = (char *)v180 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v195 = (char *)v180 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v202 = (char *)v180 - v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v198 = (uint64_t)v180 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v180 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)v180 - v27;
  v205 = sub_244406C3C();
  v29 = *(_QWORD *)(v205 - 8);
  v30 = MEMORY[0x24BDAC7A8](v205);
  v189 = (char *)v180 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = MEMORY[0x24BDAC7A8](v30);
  v188 = (char *)v180 - v33;
  v34 = MEMORY[0x24BDAC7A8](v32);
  v199 = (char *)v180 - v35;
  v36 = MEMORY[0x24BDAC7A8](v34);
  v38 = (char *)v180 - v37;
  v39 = MEMORY[0x24BDAC7A8](v36);
  v41 = (char *)v180 - v40;
  v42 = MEMORY[0x24BDAC7A8](v39);
  v44 = (char *)v180 - v43;
  MEMORY[0x24BDAC7A8](v42);
  v204 = (char *)v180 - v45;
  swift_bridgeObjectRetain();
  v46 = sub_2443D8788();
  v47 = *(_QWORD *)(v46 + 16);
  v206 = a1;
  if (!v47 || (v48 = sub_2443DC1EC((uint64_t)a1, a2), (v49 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v64 = sub_244406D38();
    __swift_project_value_buffer(v64, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v65 = sub_244406D20();
    v66 = sub_244406FB4();
    v67 = os_log_type_enabled(v65, v66);
    v68 = v209;
    if (v67)
    {
      v69 = (uint8_t *)swift_slowAlloc();
      v70 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
      v212 = v70;
      *(_DWORD *)v69 = 136315138;
      swift_bridgeObjectRetain();
      v211 = sub_2443DABA4((uint64_t)v206, a2, (uint64_t *)&v212);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2443D2000, v65, v66, "Invalid SchemaElement for label: %s", v69, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v70, -1, -1);
      MEMORY[0x24950E6FC](v69, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v208 + 56))(v207, 1, 1, v68);
  }
  v187 = v38;
  v50 = *(_QWORD *)(v46 + 56) + 32 * v48;
  v51 = *(_QWORD *)(v50 + 8);
  v184 = *(os_log_t *)v50;
  v52 = *(unsigned __int8 *)(v50 + 16);
  v183 = *(_QWORD *)(v50 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  LODWORD(v186) = v52;
  LOBYTE(v212) = v52;
  ScalarType.init(fieldType:)((char *)&v212, (uint64_t)v28);
  v53 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48);
  v54 = v205;
  if (v53(v28, 1, v205) == 1)
  {
    sub_244404D38((uint64_t)v28, &qword_25735DE18);
    if (qword_25735DB50 != -1)
      swift_once();
    v55 = sub_244406D38();
    __swift_project_value_buffer(v55, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain();
    v56 = sub_244406D20();
    v57 = sub_244406FB4();
    v58 = os_log_type_enabled(v56, v57);
    v59 = v209;
    if (v58)
    {
      v60 = (uint8_t *)swift_slowAlloc();
      v61 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
      v212 = v61;
      *(_DWORD *)v60 = 136315138;
      LOBYTE(v211) = (_BYTE)v186;
      v62 = FieldType.description.getter();
      v211 = sub_2443DABA4(v62, v63, (uint64_t *)&v212);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2443D2000, v56, v57, "Invalid ScalarType for element: %s", v60, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v61, -1, -1);
      MEMORY[0x24950E6FC](v60, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    goto LABEL_38;
  }
  v185 = v29;
  v72 = v28;
  v73 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
  v73(v204, v72, v54);
  sub_2443E27E0(v203, (uint64_t)v26);
  v182 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v53;
  v74 = v53(v26, 1, v54);
  v181 = (void (*)(char *, uint64_t, uint64_t))v73;
  if (v74 == 1)
  {
    sub_244404D38((uint64_t)v26, &qword_25735DE18);
    v59 = v209;
    v75 = v185;
    v76 = v187;
  }
  else
  {
    v73(v44, v26, v54);
    v77 = sub_244406C30();
    v76 = v187;
    if ((v77 & 1) == 0)
    {
      v133 = v185;
      if (qword_25735DB50 != -1)
        swift_once();
      v134 = sub_244406D38();
      __swift_project_value_buffer(v134, (uint64_t)qword_2573610D0);
      v135 = v205;
      (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v41, v44, v205);
      swift_bridgeObjectRetain();
      v136 = sub_244406D20();
      v137 = sub_244406FB4();
      if (os_log_type_enabled(v136, v137))
      {
        v138 = swift_slowAlloc();
        v206 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
        v212 = v206;
        *(_DWORD *)v138 = 136315394;
        v139 = ScalarType.description.getter();
        v211 = sub_2443DABA4(v139, v140, (uint64_t *)&v212);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        v141 = *(void (**)(char *, uint64_t))(v133 + 8);
        v141(v41, v135);
        *(_WORD *)(v138 + 12) = 2080;
        LOBYTE(v211) = (_BYTE)v186;
        v142 = FieldType.description.getter();
        v211 = sub_2443DABA4(v142, v143, (uint64_t *)&v212);
        sub_244406FE4();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v136, v137, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v138, 0x16u);
        v144 = v206;
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v144, -1, -1);
        MEMORY[0x24950E6FC](v138, -1, -1);

      }
      else
      {
        v141 = *(void (**)(char *, uint64_t))(v133 + 8);
        v141(v41, v135);

        swift_bridgeObjectRelease_n();
      }
      v145 = v208;
      v146 = v209;
      v147 = v207;
      sub_244406CA8();
      v141(v44, v135);
      v141(v204, v135);
      v130 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v145 + 56);
      v129 = v147;
      v131 = 0;
      goto LABEL_48;
    }
    v75 = v185;
    (*(void (**)(char *, uint64_t))(v185 + 8))(v44, v54);
    v59 = v209;
  }
  v78 = v206;
  v79 = sub_2443D9C34((uint64_t)v206, a2);
  if (v79 < 1)
  {
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v128 = sub_244406D38();
    __swift_project_value_buffer(v128, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v121 = sub_244406D20();
    v122 = sub_244406FB4();
    if (os_log_type_enabled(v121, v122))
    {
      v125 = (uint8_t *)swift_slowAlloc();
      v126 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
      v212 = v126;
      *(_DWORD *)v125 = 136315138;
      swift_bridgeObjectRetain();
      v211 = sub_2443DABA4((uint64_t)v78, a2, (uint64_t *)&v212);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v127 = "Found no valid rows for label: %s";
      goto LABEL_35;
    }
LABEL_36:
    swift_bridgeObjectRelease_n();
    goto LABEL_37;
  }
  v80 = v79;
  swift_bridgeObjectRetain();
  v81 = sub_2443D8A88();
  if (!*(_QWORD *)(v81 + 16) || (v82 = sub_2443DC1EC((uint64_t)v206, a2), (v83 & 1) == 0))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25735DB50 != -1)
      swift_once();
    v120 = sub_244406D38();
    __swift_project_value_buffer(v120, (uint64_t)qword_2573610D0);
    swift_bridgeObjectRetain_n();
    v121 = sub_244406D20();
    v122 = sub_244406FB4();
    v123 = os_log_type_enabled(v121, v122);
    v124 = v206;
    if (v123)
    {
      v125 = (uint8_t *)swift_slowAlloc();
      v126 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
      v212 = v126;
      *(_DWORD *)v125 = 136315138;
      swift_bridgeObjectRetain();
      v211 = sub_2443DABA4((uint64_t)v124, a2, (uint64_t *)&v212);
      sub_244406FE4();
      swift_bridgeObjectRelease_n();
      v127 = "Found no valid indices for label: %s";
LABEL_35:
      _os_log_impl(&dword_2443D2000, v121, v122, v127, v125, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24950E6FC](v126, -1, -1);
      MEMORY[0x24950E6FC](v125, -1, -1);
LABEL_37:

      (*(void (**)(char *, uint64_t))(v185 + 8))(v204, v205);
LABEL_38:
      v129 = v207;
      v130 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v208 + 56);
      v131 = 1;
LABEL_39:
      v132 = v59;
      return v130(v129, v131, 1, v132);
    }
    goto LABEL_36;
  }
  v84 = *(_QWORD *)(*(_QWORD *)(v81 + 56) + 8 * v82);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v210 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25735DB60);
  v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = xmmword_2444076A0;
  v86 = v183;
  *(_QWORD *)(v85 + 32) = v80;
  *(_QWORD *)(v85 + 40) = v86;
  sub_244406C54();
  v87 = v204;
  v206 = *(void (**)(_QWORD, _QWORD, _QWORD))(v75 + 16);
  v206(v76, v204, v205);
  v88 = v200;
  sub_244406C78();
  v89 = sub_244406C84();
  v90 = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v88, 0, 1, v89);
  MEMORY[0x24BDAC7A8](v90);
  v180[-8] = v84;
  v180[-7] = v5;
  v180[-6] = v184;
  v180[-5] = v51;
  LOBYTE(v180[-4]) = (_BYTE)v186;
  v180[-3] = v86;
  v180[-2] = &v210;
  v91 = v202;
  sub_244406CC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v210 & 1) == 0)
  {
    v148 = v75;
    v149 = v208;
    v146 = v209;
    (*(void (**)(char *, uint64_t))(v208 + 8))(v91, v209);
    (*(void (**)(char *, uint64_t))(v148 + 8))(v87, v205);
    v130 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v149 + 56);
    v129 = v207;
    v131 = 1;
LABEL_48:
    v132 = v146;
    return v130(v129, v131, 1, v132);
  }
  v92 = v208;
  if (qword_25735DB50 != -1)
    swift_once();
  v93 = sub_244406D38();
  v94 = __swift_project_value_buffer(v93, (uint64_t)qword_2573610D0);
  v95 = *(void (**)(char *, char *, uint64_t))(v92 + 16);
  v96 = v195;
  v59 = v209;
  v95(v195, v91, v209);
  v97 = v196;
  v95(v196, v91, v59);
  v98 = v197;
  v95(v197, v91, v59);
  v200 = (char *)v94;
  v99 = sub_244406D20();
  v100 = sub_244406FA8();
  v101 = v100;
  if (os_log_type_enabled(v99, v100))
  {
    v102 = swift_slowAlloc();
    v186 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
    v212 = v186;
    *(_DWORD *)v102 = 136315650;
    v180[1] = v102 + 4;
    v103 = v201;
    v184 = v99;
    sub_244406CF0();
    sub_2443E2B34(&qword_25735DE20, (uint64_t (*)(uint64_t))MEMORY[0x24BE6B8F8], MEMORY[0x24BE6B918]);
    v104 = v194;
    v105 = sub_2444071F4();
    LODWORD(v183) = v101;
    v107 = v106;
    (*(void (**)(char *, uint64_t))(v193 + 8))(v103, v104);
    v211 = sub_2443DABA4(v105, v107, (uint64_t *)&v212);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    v108 = *(void (**)(char *, uint64_t))(v92 + 8);
    v108(v96, v209);
    *(_WORD *)(v102 + 12) = 2048;
    v109 = sub_244406C9C();
    v108(v97, v209);
    v211 = v109;
    sub_244406FE4();
    *(_WORD *)(v102 + 22) = 2080;
    v110 = v187;
    sub_244406C90();
    v111 = ScalarType.description.getter();
    v113 = v112;
    v114 = v110;
    v115 = v205;
    (*(void (**)(char *, uint64_t))(v75 + 8))(v114, v205);
    v211 = sub_2443DABA4(v111, v113, (uint64_t *)&v212);
    sub_244406FE4();
    v116 = v204;
    v59 = v209;
    swift_bridgeObjectRelease();
    v108(v98, v59);
    v117 = v184;
    _os_log_impl(&dword_2443D2000, v184, (os_log_type_t)v183, "Loaded tensor %s of %ld elements of type %s.", (uint8_t *)v102, 0x20u);
    v118 = v186;
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v118, -1, -1);
    v119 = v102;
    v91 = v202;
    MEMORY[0x24950E6FC](v119, -1, -1);

  }
  else
  {
    v108 = *(void (**)(char *, uint64_t))(v92 + 8);
    v108(v97, v59);
    v108(v96, v59);
    v108(v98, v59);

    v116 = v204;
    v115 = v205;
  }
  v150 = v199;
  v151 = v182;
  v152 = v198;
  sub_2443E27E0(v203, v198);
  if (v151(v152, 1, v115) == 1)
  {
    (*(void (**)(char *, uint64_t))(v185 + 8))(v116, v115);
    sub_244404D38(v152, &qword_25735DE18);
LABEL_54:
    v155 = v207;
    v156 = v208;
    (*(void (**)(uint64_t, char *, uint64_t))(v208 + 32))(v207, v91, v59);
    v130 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v156 + 56);
    v129 = v155;
    v131 = 0;
    goto LABEL_39;
  }
  v181(v150, v152, v115);
  sub_2443E2B34(&qword_25735DE38, (uint64_t (*)(uint64_t))MEMORY[0x24BE6B8D0], MEMORY[0x24BE6B8E0]);
  v153 = v115;
  if ((sub_244406DEC() & 1) != 0)
  {
    v154 = *(void (**)(char *, uint64_t))(v185 + 8);
    v154(v150, v115);
    v154(v116, v115);
    goto LABEL_54;
  }
  v157 = v188;
  v158 = v116;
  v159 = (void (*)(char *, char *, uint64_t))v206;
  v206(v188, v116, v115);
  v160 = v189;
  v159(v189, v150, v115);
  v161 = sub_244406D20();
  v162 = sub_244406FA8();
  if (os_log_type_enabled(v161, v162))
  {
    v163 = swift_slowAlloc();
    v206 = (void (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
    v212 = v206;
    *(_DWORD *)v163 = 136315394;
    v164 = ScalarType.description.getter();
    v211 = sub_2443DABA4(v164, v165, (uint64_t *)&v212);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    v166 = v157;
    v167 = *(void (**)(char *, uint64_t))(v185 + 8);
    v167(v166, v153);
    *(_WORD *)(v163 + 12) = 2080;
    v168 = ScalarType.description.getter();
    v211 = sub_2443DABA4(v168, v169, (uint64_t *)&v212);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    v167(v160, v153);
    _os_log_impl(&dword_2443D2000, v161, v162, "Casting tensor of type %s to type %s.", (uint8_t *)v163, 0x16u);
    v170 = v206;
    swift_arrayDestroy();
    v158 = v204;
    MEMORY[0x24950E6FC](v170, -1, -1);
    v171 = v163;
    v150 = v199;
    MEMORY[0x24950E6FC](v171, -1, -1);
  }
  else
  {
    v172 = v157;
    v167 = *(void (**)(char *, uint64_t))(v185 + 8);
    v167(v172, v153);
    v167(v160, v153);
  }

  v173 = v191;
  v174 = v190;
  v175 = v192;
  (*(void (**)(char *, _QWORD, uint64_t))(v191 + 104))(v190, *MEMORY[0x24BEE38B8], v192);
  v176 = v207;
  v177 = v202;
  sub_244406CCC();
  (*(void (**)(char *, uint64_t))(v173 + 8))(v174, v175);
  v167(v150, v153);
  v178 = v177;
  v179 = v209;
  v108(v178, v209);
  v167(v158, v153);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v208 + 56))(v176, 0, 1, v179);
}

void sub_244402978(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, _BYTE *a9)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  os_log_type_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  os_log_type_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v9 = a3[2];
  if (v9)
  {
    v11 = a3[4];
    if ((v11 & 0x8000000000000000) == 0)
    {
      v12 = *(_QWORD *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
      v13 = *(_QWORD *)(v12 + 16);
      if (v11 < v13)
      {
        v16 = a1;
        v17 = a3[5];
        v47 = v12 + 32;
        v44 = a2 - a1;
        v45 = *(_QWORD *)(a4 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
        swift_bridgeObjectRetain();
        v18 = 0;
        v19 = (char)(a7 - 1);
        v20 = a3 + 7;
        v46 = v16;
        while (1)
        {
          if (v11 >= v13)
          {
            __break(1u);
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            __break(1u);
            goto LABEL_52;
          }
          if (v17 < 0 || (v21 = v47 + 40 * v11, v22 = *(_QWORD *)(v21 + 8), v17 >= *(_QWORD *)(v22 + 16)))
          {
LABEL_25:
            swift_bridgeObjectRelease();
            break;
          }
          if (v19 > 9)
            v23 = 1;
          else
            v23 = qword_244408E38[v19];
          v24 = a8 * v23;
          if ((unsigned __int128)(a8 * (__int128)v23) >> 64 != (a8 * v23) >> 63)
            goto LABEL_48;
          v25 = *(_QWORD *)(v21 + 32);
          if ((unsigned __int128)(v24 * (__int128)v25) >> 64 != (v24 * v25) >> 63)
            goto LABEL_49;
          v26 = *(_QWORD *)(v22 + (v17 << 6) + 56);
          if (v26 != v24 * v25)
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            if (qword_25735DB50 == -1)
              goto LABEL_31;
            goto LABEL_54;
          }
          v27 = __OFADD__(v18, v26);
          v28 = v18 + v26;
          if (v27)
            goto LABEL_50;
          if (v16)
          {
            if (v44 < v28)
              goto LABEL_33;
            if (v28 < v18)
              goto LABEL_51;
          }
          else
          {
            if (v28 > 0)
            {
LABEL_33:
              swift_bridgeObjectRelease();
              if (qword_25735DB50 != -1)
                swift_once();
              v39 = sub_244406D38();
              __swift_project_value_buffer(v39, (uint64_t)qword_2573610D0);
              v32 = sub_244406D20();
              v40 = sub_244406FB4();
              if (os_log_type_enabled(v32, v40))
              {
                v37 = swift_slowAlloc();
                *(_DWORD *)v37 = 134218240;
                sub_244406FE4();
                *(_WORD *)(v37 + 12) = 2048;
                sub_244406FE4();
                v38 = "Failed at computing chunk offset: %ld vs %ld ";
                v41 = v32;
                v42 = v40;
                goto LABEL_42;
              }
              goto LABEL_29;
            }
            if (v28 < v18)
            {
              __break(1u);
LABEL_54:
              swift_once();
LABEL_31:
              v35 = sub_244406D38();
              __swift_project_value_buffer(v35, (uint64_t)qword_2573610D0);
              swift_bridgeObjectRetain();
              v32 = sub_244406D20();
              v36 = sub_244406FB4();
              if (os_log_type_enabled(v32, v36))
              {
                v37 = swift_slowAlloc();
                *(_DWORD *)v37 = 134218240;
                swift_bridgeObjectRelease();
                sub_244406FE4();
                swift_bridgeObjectRelease();
                *(_WORD *)(v37 + 12) = 2048;
                sub_244406FE4();
                v38 = "Found invalid chunk: %lld vs %ld";
                goto LABEL_41;
              }
LABEL_43:

              swift_bridgeObjectRelease_n();
              return;
            }
          }
          swift_bridgeObjectRetain();
          sub_244406D50();
          if ((v29 & 1) != 0)
          {
            sub_2443DAC74();
            swift_willThrowTypedImpl();
            swift_bridgeObjectRelease();
            if (qword_25735DB50 != -1)
              swift_once();
            v43 = sub_244406D38();
            __swift_project_value_buffer(v43, (uint64_t)qword_2573610D0);
            swift_bridgeObjectRetain();
            v32 = sub_244406D20();
            v36 = sub_244406FB4();
            if (os_log_type_enabled(v32, v36))
            {
              v37 = swift_slowAlloc();
              *(_DWORD *)v37 = 134218240;
              swift_bridgeObjectRelease();
              sub_244406FE4();
              swift_bridgeObjectRelease();
              *(_WORD *)(v37 + 12) = 2048;
              sub_244406FE4();
              v38 = "Failed at reading chunk at %lld for %ld bytes.";
LABEL_41:
              v41 = v32;
              v42 = v36;
LABEL_42:
              _os_log_impl(&dword_2443D2000, v41, v42, v38, (uint8_t *)v37, 0x16u);
              MEMORY[0x24950E6FC](v37, -1, -1);

              return;
            }
            goto LABEL_43;
          }
          swift_bridgeObjectRelease();
          if (!--v9)
          {
            swift_bridgeObjectRelease();
            goto LABEL_45;
          }
          v11 = *(v20 - 1);
          v19 = (char)(a7 - 1);
          v16 = v46;
          if ((v11 & 0x8000000000000000) == 0)
          {
            v30 = *v20;
            v20 += 2;
            v17 = v30;
            v13 = *(_QWORD *)(v45 + 16);
            v18 = v28;
            if (v11 < v13)
              continue;
          }
          goto LABEL_25;
        }
      }
    }
    if (qword_25735DB50 != -1)
LABEL_52:
      swift_once();
    v31 = sub_244406D38();
    __swift_project_value_buffer(v31, (uint64_t)qword_2573610D0);
    v32 = sub_244406D20();
    v33 = sub_244406FB4();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2443D2000, v32, v33, "Invalid index", v34, 2u);
      MEMORY[0x24950E6FC](v34, -1, -1);
    }
LABEL_29:

  }
  else
  {
LABEL_45:
    *a9 = 1;
  }
}

uint64_t PlanksReader.readBatch<A, B>(label:as:quantization:batchIndex:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;

  swift_bridgeObjectRetain();
  v22 = sub_2443D8A88();
  if (*(_QWORD *)(v22 + 16) && (v23 = sub_2443DC1EC(a1, a2), (v24 & 1) != 0))
  {
    v37 = a7;
    v25 = *(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26 = *(_QWORD *)(v25 + 16);
    if (v26 && (a5 & 0x8000000000000000) == 0 && v26 > a5)
    {
      v27 = v25 + 16 * a5;
      v28 = *(_QWORD *)(v27 + 32);
      v36 = *(_QWORD *)(v27 + 40);
      swift_bridgeObjectRelease();
      return sub_244403278(a1, a2, v28, v36, a3, a4, a6, v37, a9, a8, a10, a11, a12, a13, a14);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (qword_25735DB50 != -1)
    swift_once();
  v30 = sub_244406D38();
  __swift_project_value_buffer(v30, (uint64_t)qword_2573610D0);
  swift_bridgeObjectRetain_n();
  v31 = sub_244406D20();
  v32 = sub_244406FB4();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v39 = v34;
    *(_DWORD *)v33 = 136315138;
    swift_bridgeObjectRetain();
    sub_2443DABA4(a1, a2, &v39);
    sub_244406FE4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2443D2000, v31, v32, "Found no valid indices for label: %s", v33, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v34, -1, -1);
    MEMORY[0x24950E6FC](v33, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v35 = sub_244406D14();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(a9, 1, 1, v35);
}

uint64_t sub_244403278@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _BYTE *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  unint64_t v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  _BOOL4 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  _BYTE *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE v113[12];
  int v114;
  _BYTE *v115;
  uint64_t v116;
  unsigned int v117;
  uint64_t v118;
  _BYTE *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _BYTE *v123;
  _BYTE *v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135[2];
  char v136;
  char v137;
  uint64_t v138;

  v132 = a6;
  v126 = a1;
  v127 = a2;
  v130 = a14;
  v131 = a8;
  v125 = a13;
  v121 = a12;
  v122 = a15;
  v128 = a11;
  v129 = a7;
  v120 = a10;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE50);
  MEMORY[0x24BDAC7A8](v19);
  v119 = &v113[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = sub_244406C3C();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v124 = &v113[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = sub_244406C48();
  MEMORY[0x24BDAC7A8](v24);
  v123 = &v113[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
  MEMORY[0x24BDAC7A8](v26);
  v28 = &v113[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735E5B8);
  MEMORY[0x24BDAC7A8](v29);
  v31 = &v113[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v134 = sub_244406D14();
  v32 = *(_QWORD *)(v134 - 8);
  MEMORY[0x24BDAC7A8](v134);
  v34 = &v113[-((v33 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((a3 & 0x8000000000000000) == 0)
  {
    v35 = *(_QWORD *)(v133 + OBJC_IVAR____TtC6Planks12PlanksReader_metadata + 16);
    if (*(_QWORD *)(v35 + 16) > a3 && (a4 & 0x8000000000000000) == 0)
    {
      v36 = *(_QWORD *)(v35 + 40 * a3 + 40);
      if (*(_QWORD *)(v36 + 16) > a4)
      {
        v37 = v36 + (a4 << 6);
        v38 = *(unsigned __int16 *)(v37 + 88);
        if (*(_WORD *)(v37 + 88) != 12)
        {
          v114 = *(_WORD *)(v37 + 88);
          v115 = v34;
          v116 = a5;
          v118 = a9;
          v46 = v37 + 32;
          v48 = *(_QWORD *)(v46 + 40);
          v47 = *(_QWORD *)(v46 + 48);
          v117 = v38 >> 8;
          (*(void (**)(uint64_t *__return_ptr, uint64_t))(v130 + 8))(v135, v131);
          LOBYTE(v138) = v38;
          v49 = FieldType.rawValue.getter();
          v51 = v50;
          if (v49 == FieldType.rawValue.getter() && v51 == v52)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            v53 = sub_244407224();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v53 & 1) == 0)
              goto LABEL_24;
          }
          (*(void (**)(uint64_t *__return_ptr, uint64_t))(v128 + 8))(v135, v129);
          LOBYTE(v138) = v117;
          v54 = FieldType.rawValue.getter();
          v56 = v55;
          if (v54 == FieldType.rawValue.getter() && v56 == v57)
          {
            swift_bridgeObjectRelease_n();
LABEL_19:
            (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v28, 1, 1, v21);
            v60 = v126;
            v59 = v127;
            sub_2443FFA8C(v126, v127, a3, (void (*)(_QWORD, _QWORD, _QWORD))a4, (uint64_t)v28, (uint64_t)v31);
            sub_244404D38((uint64_t)v28, &qword_25735DE18);
            v61 = v134;
            if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v32 + 48))(v31, 1, v134) == 1)
            {
              sub_244404D38((uint64_t)v31, &qword_25735E5B8);
              v62 = v118;
              if (qword_25735DB50 != -1)
                swift_once();
              v63 = sub_244406D38();
              __swift_project_value_buffer(v63, (uint64_t)qword_2573610D0);
              swift_bridgeObjectRetain_n();
              v64 = sub_244406D20();
              v65 = v59;
              v66 = sub_244406FB4();
              if (os_log_type_enabled(v64, v66))
              {
                v67 = (uint8_t *)swift_slowAlloc();
                v68 = swift_slowAlloc();
                v135[0] = v68;
                *(_DWORD *)v67 = 136315138;
                swift_bridgeObjectRetain();
                v138 = sub_2443DABA4(v60, v65, v135);
                v62 = v118;
                sub_244406FE4();
                swift_bridgeObjectRelease_n();
                _os_log_impl(&dword_2443D2000, v64, v66, "Failed reading batch: %s.", v67, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x24950E6FC](v68, -1, -1);
                MEMORY[0x24950E6FC](v67, -1, -1);

              }
              else
              {

                swift_bridgeObjectRelease_n();
              }
              v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
              v81 = v62;
            }
            else
            {
              v83 = v115;
              (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v32 + 32))(v115, v31, v61);
              v84 = v131;
              v138 = sub_244406D08();
              v135[0] = v48;
              v135[1] = v47;
              v136 = v114;
              v137 = v117;
              v85 = sub_244406F0C();
              v112 = MEMORY[0x24950E66C](MEMORY[0x24BEE12C8], v85);
              v133 = v32;
              v86 = v122;
              v111 = v122;
              v88 = v128;
              v87 = v129;
              v89 = v121;
              v90 = v130;
              v91 = rebuildArray<A, B, C>(_:parameters:)((uint64_t)&v138, v135, v129, v84, v85, v128, v121, v130);
              swift_bridgeObjectRelease();
              if (v91)
              {
                sub_244406CF0();
                v92 = v120;
                sub_244406C6C();
                v93 = v119;
                sub_244406C78();
                v94 = sub_244406C84();
                v95 = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v94 - 8) + 56))(v93, 0, 1, v94);
                v132 = v113;
                MEMORY[0x24BDAC7A8](v95);
                *(_QWORD *)&v113[-80] = v87;
                *(_QWORD *)&v113[-72] = v84;
                *(_QWORD *)&v113[-64] = v92;
                *(_QWORD *)&v113[-56] = v88;
                v96 = v125;
                *(_QWORD *)&v113[-48] = v89;
                *(_QWORD *)&v113[-40] = v96;
                *(_QWORD *)&v113[-32] = v90;
                *(_QWORD *)&v113[-24] = v86;
                v111 = v91;
                v97 = v118;
                sub_244406CC0();
                v98 = v133;
                v99 = v134;
                (*(void (**)(_BYTE *, uint64_t))(v133 + 8))(v83, v134);
                swift_bridgeObjectRelease();
                return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v98 + 56))(v97, 0, 1, v99);
              }
              v100 = v118;
              v101 = v133;
              v61 = v134;
              if (qword_25735DB50 != -1)
                swift_once();
              v102 = sub_244406D38();
              __swift_project_value_buffer(v102, (uint64_t)qword_2573610D0);
              v103 = sub_244406D20();
              v104 = sub_244406FB4();
              if (os_log_type_enabled(v103, v104))
              {
                v105 = swift_slowAlloc();
                v106 = swift_slowAlloc();
                v135[0] = v106;
                *(_DWORD *)v105 = 136315394;
                v107 = sub_2444072F0();
                v138 = sub_2443DABA4(v107, v108, v135);
                sub_244406FE4();
                swift_bridgeObjectRelease();
                *(_WORD *)(v105 + 12) = 2080;
                v109 = sub_2444072F0();
                v138 = sub_2443DABA4(v109, v110, v135);
                sub_244406FE4();
                v100 = v118;
                swift_bridgeObjectRelease();
                _os_log_impl(&dword_2443D2000, v103, v104, "Failed rebuilding of array of type %s into type %s.", (uint8_t *)v105, 0x16u);
                swift_arrayDestroy();
                MEMORY[0x24950E6FC](v106, -1, -1);
                MEMORY[0x24950E6FC](v105, -1, -1);
              }

              (*(void (**)(_BYTE *, uint64_t))(v101 + 8))(v115, v61);
              v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v101 + 56);
              v81 = v100;
            }
            v82 = 1;
            return v80(v81, v82, 1, v61);
          }
          v58 = sub_244407224();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v58 & 1) != 0)
            goto LABEL_19;
LABEL_24:
          if (qword_25735DB50 != -1)
            swift_once();
          v69 = sub_244406D38();
          __swift_project_value_buffer(v69, (uint64_t)qword_2573610D0);
          v70 = sub_244406D20();
          v71 = sub_244406FB4();
          v72 = os_log_type_enabled(v70, v71);
          v61 = v134;
          if (v72)
          {
            v73 = swift_slowAlloc();
            v74 = swift_slowAlloc();
            v135[0] = v74;
            *(_DWORD *)v73 = 136315394;
            v75 = sub_2444072F0();
            v138 = sub_2443DABA4(v75, v76, v135);
            sub_244406FE4();
            swift_bridgeObjectRelease();
            *(_WORD *)(v73 + 12) = 2080;
            LOBYTE(v138) = v117;
            v77 = FieldType.description.getter();
            v138 = sub_2443DABA4(v77, v78, v135);
            sub_244406FE4();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2443D2000, v70, v71, "Invalid requested type %s for tensor of type: %s", (uint8_t *)v73, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x24950E6FC](v74, -1, -1);
            MEMORY[0x24950E6FC](v73, -1, -1);
          }

          v79 = v118;
          sub_244406CA8();
          v80 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56);
          v81 = v79;
          v82 = 0;
          return v80(v81, v82, 1, v61);
        }
      }
    }
  }
  if (qword_25735DB50 != -1)
    swift_once();
  v39 = sub_244406D38();
  __swift_project_value_buffer(v39, (uint64_t)qword_2573610D0);
  v40 = sub_244406D20();
  v41 = sub_244406FB4();
  v42 = os_log_type_enabled(v40, v41);
  v43 = v134;
  if (v42)
  {
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl(&dword_2443D2000, v40, v41, "Invalid index.", v44, 2u);
    MEMORY[0x24950E6FC](v44, -1, -1);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v32 + 56))(a9, 1, 1, v43);
}

void sub_244403E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _BYTE *a10)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  uint64_t v22;

  if ((a5 - 1) > 9u)
    v11 = 1;
  else
    v11 = qword_244408E38[(char)(a5 - 1)];
  v12 = a6 * v11;
  if ((unsigned __int128)(a6 * (__int128)v11) >> 64 != (a6 * v11) >> 63)
  {
    __break(1u);
    goto LABEL_20;
  }
  v13 = *(_QWORD *)(a7 + 32);
  if ((unsigned __int128)(v12 * (__int128)v13) >> 64 != (v12 * v13) >> 63)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    swift_once();
    goto LABEL_10;
  }
  if (*(_QWORD *)(a8 + 24) == v12 * v13)
  {
    sub_244406D50();
    if ((v14 & 1) == 0)
    {
      *a10 = 1;
      return;
    }
    sub_2443DAC74();
    swift_willThrowTypedImpl();
    if (qword_25735DB50 != -1)
      swift_once();
    v20 = sub_244406D38();
    __swift_project_value_buffer(v20, (uint64_t)qword_2573610D0);
    sub_2443DDBAC(a8);
    v16 = sub_244406D20();
    v21 = sub_244406FB4();
    if (os_log_type_enabled(v16, v21))
    {
      v22 = swift_slowAlloc();
      *(_DWORD *)v22 = 134218240;
      sub_244406FE4();
      sub_2443E6EA8(a8);
      *(_WORD *)(v22 + 12) = 2048;
      sub_244406FE4();
      _os_log_impl(&dword_2443D2000, v16, v21, "Failed at reading chunk at %lld for %ld bytes.", (uint8_t *)v22, 0x16u);
      v19 = v22;
      goto LABEL_16;
    }
LABEL_17:
    sub_2443E6EA8(a8);
    goto LABEL_18;
  }
  if (qword_25735DB50 != -1)
    goto LABEL_21;
LABEL_10:
  v15 = sub_244406D38();
  __swift_project_value_buffer(v15, (uint64_t)qword_2573610D0);
  sub_2443DDBAC(a8);
  v16 = sub_244406D20();
  v17 = sub_244406FB4();
  if (!os_log_type_enabled(v16, v17))
    goto LABEL_17;
  v18 = swift_slowAlloc();
  *(_DWORD *)v18 = 134218240;
  sub_244406FE4();
  sub_2443E6EA8(a8);
  *(_WORD *)(v18 + 12) = 2048;
  sub_244406FE4();
  _os_log_impl(&dword_2443D2000, v16, v17, "Found invalid chunk: %lld vs %ld", (uint8_t *)v18, 0x16u);
  v19 = v18;
LABEL_16:
  MEMORY[0x24950E6FC](v19, -1, -1);
LABEL_18:

}

uint64_t AsyncTensorSequence.maxBatchSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t AsyncTensorSequence.makeAsyncIterator()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_244404414(v1, a1);
}

uint64_t AsyncTensorSequence.next()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_244404168()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void (*v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  uint64_t v11;

  if ((sub_244406F30() & 1) != 0
    || (v1 = *(_QWORD *)(v0 + 24),
        v2 = (int *)type metadata accessor for AsyncTensorSequence(),
        v3 = v2[9],
        v4 = *(_QWORD *)(v1 + v3),
        v5 = *(_QWORD *)(v1 + v2[8]),
        v4 >= *(_QWORD *)(v5 + 16)))
  {
    v10 = *(_QWORD *)(v0 + 16);
    v11 = sub_244406D14();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 16);
    v7 = v5 + 16 * v4;
    v8 = *(NSObject **)(v7 + 32);
    v9 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 40);
    *(_QWORD *)(v1 + v3) = v4 + 1;
    sub_2443FFA8C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v8, v9, v1 + v2[7], v6);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244404214@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_244404CF4(v1, a1);
}

uint64_t sub_244404220(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_244404280;
  v4[2] = a1;
  v4[3] = v1;
  return swift_task_switch();
}

uint64_t sub_244404280()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2444042CC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_25735E5B0 + dword_25735E5B0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v3;
  *v3 = v1;
  v3[1] = sub_244404358;
  return v5(a1);
}

uint64_t sub_244404358()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for AsyncTensorSequence()
{
  uint64_t result;

  result = qword_25735E560;
  if (!qword_25735E560)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2444043E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_244402978(a1, a2, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_BYTE *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_BYTE **)(v2 + 64));
}

uint64_t sub_244404414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AsyncTensorSequence();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244404458()
{
  return sub_2443E2B34(qword_25735E4F0, (uint64_t (*)(uint64_t))type metadata accessor for AsyncTensorSequence, (uint64_t)&protocol conformance descriptor for AsyncTensorSequence);
}

uint64_t *initializeBufferWithCopyOfBuffer for AsyncTensorSequence(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
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
    v9 = a3[7];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_244406C3C();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_retain();
    swift_bridgeObjectRetain();
    if (v14(v11, 1, v12))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(uint64_t *)((char *)v4 + v17) = *(uint64_t *)((char *)a2 + v17);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AsyncTensorSequence(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_244406C3C();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AsyncTensorSequence(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[7];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_244406C3C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  if (v13(v10, 1, v11))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AsyncTensorSequence(_QWORD *a1, _QWORD *a2, int *a3)
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

  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[7];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_244406C3C();
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
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t initializeWithTake for AsyncTensorSequence(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_244406C3C();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  return a1;
}

_QWORD *assignWithTake for AsyncTensorSequence(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a3[7];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_244406C3C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncTensorSequence()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_244404AFC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for AsyncTensorSequence()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_244404B88(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25735DE18);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_244404C00()
{
  unint64_t v0;

  sub_244404CA0();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_244404CA0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25735E570)
  {
    sub_244406C3C();
    v0 = sub_244406FC0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25735E570);
  }
}

uint64_t sub_244404CF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AsyncTensorSequence();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244404D38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_244404D74()
{
  return sub_244406EA0();
}

uint64_t sub_244404DB4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_244404E1C();
  result = sub_244406AE0();
  *a1 = result;
  return result;
}

unint64_t sub_244404E1C()
{
  unint64_t result;

  result = qword_25735E5C0;
  if (!qword_25735E5C0)
  {
    result = MEMORY[0x24950E66C](MEMORY[0x24BDCFB88], MEMORY[0x24BEE0F88]);
    atomic_store(result, (unint64_t *)&qword_25735E5C0);
  }
  return result;
}

uint64_t sub_244404E60(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AsyncTensorSequence();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_244404E9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_244403E20(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_BYTE *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(_BYTE **)(v2 + 72));
}

uint64_t sub_244404ED0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = FieldType.rawValue.getter();
  v2 = v1;
  if (v0 == FieldType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_244407224();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_244404F64(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 1635017060;
    else
      v3 = 0x7865646E69;
    if (v2 == 1)
      v4 = 0xE400000000000000;
    else
      v4 = 0xE500000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 1635017060;
      else
        v6 = 0x7865646E69;
      if (v5 == 1)
        v7 = 0xE400000000000000;
      else
        v7 = 0xE500000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE600000000000000;
    v3 = 0x656C706D6973;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE600000000000000;
  if (v3 != 0x656C706D6973)
  {
LABEL_21:
    v8 = sub_244407224();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_24440505C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x657A69746E617571;
  else
    v3 = 0x6572706D6F636E75;
  if (v2)
    v4 = 0xEC00000064657373;
  else
    v4 = 0xE900000000000064;
  if ((a2 & 1) != 0)
    v5 = 0x657A69746E617571;
  else
    v5 = 0x6572706D6F636E75;
  if ((a2 & 1) != 0)
    v6 = 0xE900000000000064;
  else
    v6 = 0xEC00000064657373;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_244407224();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_24440510C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x614D6E6D756C6F63;
  else
    v3 = 0x726F6A614D776F72;
  if (v2)
    v4 = 0xE800000000000000;
  else
    v4 = 0xEB00000000726F6ALL;
  if ((a2 & 1) != 0)
    v5 = 0x614D6E6D756C6F63;
  else
    v5 = 0x726F6A614D776F72;
  if ((a2 & 1) != 0)
    v6 = 0xEB00000000726F6ALL;
  else
    v6 = 0xE800000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_244407224();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t computeQuantizationParameters<A, B, C>(_:upperbound:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, double *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  double v41;
  char v42;
  uint64_t v43;
  char *v44;
  double v45;
  double v46;
  char v47;
  void (*v48)(char *, uint64_t);
  uint64_t result;
  char v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double *v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  double v74[2];

  v68 = a8;
  v69 = a6;
  v71 = a1;
  v72 = a5;
  v70 = a9;
  v59 = a10;
  v60 = a2;
  v57 = a4;
  v63 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v62 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = *(_QWORD *)(v14 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v54 = sub_244406FC0();
  v53 = *(_QWORD *)(v54 - 8);
  v16 = MEMORY[0x24BDAC7A8](v54);
  v18 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v52 - v20;
  v22 = *(_QWORD *)(a3 - 8);
  v23 = MEMORY[0x24BDAC7A8](v19);
  v61 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v65 = (char *)&v52 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v52 - v27;
  v67 = a7;
  v58 = *(_QWORD *)(a7 + 16);
  v56 = a11;
  sub_244406E40();
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v30 = v29(v21, 1, a3);
  v66 = v22;
  v64 = v28;
  v52 = AssociatedTypeWitness;
  if (v30 == 1)
  {
    swift_getAssociatedConformanceWitness();
    sub_244407230();
    sub_244407200();
    v31 = v53;
    v32 = v21;
    v33 = v54;
    (*(void (**)(char *, uint64_t))(v53 + 8))(v32, v54);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v28, v21, a3);
    v33 = v54;
    v31 = v53;
  }
  sub_244406E4C();
  v34 = v29(v18, 1, a3);
  v35 = v65;
  if (v34 == 1)
  {
    swift_getAssociatedConformanceWitness();
    sub_244407230();
    sub_244407200();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v18, v33);
    v36 = v66;
  }
  else
  {
    v36 = v66;
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v65, v18, a3);
  }
  v38 = v63;
  v37 = v64;
  v39 = v62;
  v40 = v57;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v62, v60, v57);
  if (sub_244407008() < 65)
  {
    v42 = sub_244407014();
    v43 = sub_244406FFC();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
    if ((v42 & 1) != 0)
      v41 = (double)v43;
    else
      v41 = (double)(unint64_t)v43;
  }
  else
  {
    sub_2443DE4B0();
    sub_244406128();
    sub_244406DC8();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
    v41 = v74[0];
  }
  v44 = v61;
  sub_244407104();
  sub_2443DE4B0();
  sub_244406DBC();
  v45 = v41 / v74[0];
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v44, v35, a3);
  sub_244406DBC();
  v46 = -(v74[0] * v45);
  (*(void (**)(double *__return_ptr, uint64_t))(v68 + 8))(v74, v40);
  v47 = LOBYTE(v74[0]);
  (*(void (**)(char *__return_ptr, uint64_t))(v69 + 8))(&v73, a3);
  v48 = *(void (**)(char *, uint64_t))(v36 + 8);
  v48(v35, a3);
  result = ((uint64_t (*)(char *, uint64_t))v48)(v37, a3);
  v50 = v73;
  v51 = v70;
  *v70 = v46;
  v51[1] = v45;
  *((_BYTE *)v51 + 16) = v47;
  *((_BYTE *)v51 + 17) = v50;
  return result;
}

uint64_t quantizeArray<A, B, C>(_:parameters:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  char v15;
  void (*v16)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD v51[12];
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;

  v54 = a7;
  v55 = a1;
  v13 = *a2;
  v14 = a2[1];
  v56 = *((unsigned __int8 *)a2 + 16);
  v15 = *((_BYTE *)a2 + 17);
  v16 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a6 + 8);
  v16(&v58, a3, a6);
  LOBYTE(v57) = v15;
  v17 = FieldType.rawValue.getter();
  v19 = v18;
  if (v17 == FieldType.rawValue.getter() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v33 = sub_244406D38();
      __swift_project_value_buffer(v33, (uint64_t)qword_2573610D0);
      v34 = sub_244406D20();
      v35 = sub_244406FB4();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = swift_slowAlloc();
        v37 = swift_slowAlloc();
        v58 = v37;
        *(_DWORD *)v36 = 136315394;
        v16(&v57, a3, a6);
        v38 = FieldType.description.getter();
        v57 = sub_2443DABA4(v38, v39, &v58);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        LOBYTE(v57) = v15;
        v40 = FieldType.description.getter();
        v57 = sub_2443DABA4(v40, v41, &v58);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v34, v35, "Invalid input type %s for quantization logical type: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v37, -1, -1);
        MEMORY[0x24950E6FC](v36, -1, -1);
      }

      return 0;
    }
  }
  v22 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a8 + 8);
  v22(&v58, a4, a8);
  LOBYTE(v57) = v56;
  v23 = FieldType.rawValue.getter();
  v25 = v24;
  if (v23 == FieldType.rawValue.getter() && v25 == v26)
  {
    v27 = swift_bridgeObjectRelease_n();
LABEL_9:
    MEMORY[0x24BDAC7A8](v27);
    v51[2] = a3;
    v51[3] = a4;
    v51[4] = a5;
    v51[5] = a6;
    v51[6] = v54;
    v51[7] = a8;
    v51[8] = v30;
    v51[9] = v29;
    v51[10] = v13;
    v51[11] = v14;
    v52 = v56;
    v53 = v15;
    return sub_244406368((void (*)(char *, char *))sub_244406A04, (uint64_t)v51, a5, a4, MEMORY[0x24BEE4078], v29, MEMORY[0x24BEE40A8], v31);
  }
  v28 = sub_244407224();
  swift_bridgeObjectRelease();
  v27 = swift_bridgeObjectRelease();
  if ((v28 & 1) != 0)
    goto LABEL_9;
  if (qword_25735DB50 != -1)
    swift_once();
  v42 = sub_244406D38();
  __swift_project_value_buffer(v42, (uint64_t)qword_2573610D0);
  v43 = sub_244406D20();
  v44 = sub_244406FB4();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    v58 = v46;
    *(_DWORD *)v45 = 136315394;
    v22(&v57, a4, a8);
    v47 = FieldType.description.getter();
    v57 = sub_2443DABA4(v47, v48, &v58);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    LOBYTE(v57) = v56;
    v49 = FieldType.description.getter();
    v57 = sub_2443DABA4(v49, v50, &v58);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2443D2000, v43, v44, "Invalid output type %s for quantization physical type: %s", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v46, -1, -1);
    MEMORY[0x24950E6FC](v45, -1, -1);
  }

  return 0;
}

uint64_t rebuildArray<A, B, C>(_:parameters:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  char v15;
  void (*v16)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  _QWORD v51[12];
  char v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;

  v54 = a7;
  v55 = a1;
  v13 = *a2;
  v14 = a2[1];
  v56 = *((unsigned __int8 *)a2 + 16);
  v15 = *((_BYTE *)a2 + 17);
  v16 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a6 + 8);
  v16(&v58, a3, a6);
  LOBYTE(v57) = v15;
  v17 = FieldType.rawValue.getter();
  v19 = v18;
  if (v17 == FieldType.rawValue.getter() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v21 = sub_244407224();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0)
    {
      if (qword_25735DB50 != -1)
        swift_once();
      v33 = sub_244406D38();
      __swift_project_value_buffer(v33, (uint64_t)qword_2573610D0);
      v34 = sub_244406D20();
      v35 = sub_244406FB4();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = swift_slowAlloc();
        v37 = swift_slowAlloc();
        v58 = v37;
        *(_DWORD *)v36 = 136315394;
        v16(&v57, a3, a6);
        v38 = FieldType.description.getter();
        v57 = sub_2443DABA4(v38, v39, &v58);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v36 + 12) = 2080;
        LOBYTE(v57) = v15;
        v40 = FieldType.description.getter();
        v57 = sub_2443DABA4(v40, v41, &v58);
        sub_244406FE4();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2443D2000, v34, v35, "Invalid input type %s for quantization logical type: %s", (uint8_t *)v36, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24950E6FC](v37, -1, -1);
        MEMORY[0x24950E6FC](v36, -1, -1);
      }

      return 0;
    }
  }
  v22 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a8 + 8);
  v22(&v58, a4, a8);
  LOBYTE(v57) = v56;
  v23 = FieldType.rawValue.getter();
  v25 = v24;
  if (v23 == FieldType.rawValue.getter() && v25 == v26)
  {
    v27 = swift_bridgeObjectRelease_n();
LABEL_9:
    MEMORY[0x24BDAC7A8](v27);
    v51[2] = a3;
    v51[3] = a4;
    v51[4] = a5;
    v51[5] = a6;
    v51[6] = v54;
    v51[7] = a8;
    v51[8] = v30;
    v51[9] = v29;
    v51[10] = v13;
    v51[11] = v14;
    v52 = v56;
    v53 = v15;
    return sub_244406368((void (*)(char *, char *))sub_244406A20, (uint64_t)v51, a5, a3, MEMORY[0x24BEE4078], v29, MEMORY[0x24BEE40A8], v31);
  }
  v28 = sub_244407224();
  swift_bridgeObjectRelease();
  v27 = swift_bridgeObjectRelease();
  if ((v28 & 1) != 0)
    goto LABEL_9;
  if (qword_25735DB50 != -1)
    swift_once();
  v42 = sub_244406D38();
  __swift_project_value_buffer(v42, (uint64_t)qword_2573610D0);
  v43 = sub_244406D20();
  v44 = sub_244406FB4();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    v58 = v46;
    *(_DWORD *)v45 = 136315394;
    v22(&v57, a4, a8);
    v47 = FieldType.description.getter();
    v57 = sub_2443DABA4(v47, v48, &v58);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 12) = 2080;
    LOBYTE(v57) = v56;
    v49 = FieldType.description.getter();
    v57 = sub_2443DABA4(v49, v50, &v58);
    sub_244406FE4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2443D2000, v43, v44, "Invalid output type %s for quantization physical type: %s", (uint8_t *)v45, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24950E6FC](v46, -1, -1);
    MEMORY[0x24950E6FC](v45, -1, -1);
  }

  return 0;
}

unint64_t sub_244406128()
{
  unint64_t result;

  result = qword_25735E5C8;
  if (!qword_25735E5C8)
  {
    result = MEMORY[0x24950E66C](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_25735E5C8);
  }
  return result;
}

uint64_t sub_24440616C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X6>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;

  v26 = a4;
  v24 = a3;
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v24 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v24 - v19;
  (*(void (**)(char *))(v21 + 16))(v11);
  sub_2443DE4B0();
  sub_244406DBC();
  v27 = v27 * a6 + a5;
  sub_244407020();
  sub_2444070E0();
  sub_24440723C();
  v22 = *(void (**)(char *, uint64_t))(v25 + 8);
  v22(v15, a2);
  sub_2444070D4();
  sub_244407248();
  v22(v15, a2);
  v22(v18, a2);
  return ((uint64_t (*)(char *, uint64_t))v22)(v20, a2);
}

uint64_t sub_244406368(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  v10 = MEMORY[0x24BDAC7A8](a1);
  v52 = (char *)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)v37 - v12;
  v45 = v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v38 = (char *)v37 - v18;
  v19 = sub_244406FC0();
  v42 = *(_QWORD *)(v19 - 8);
  v43 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v49 = (char *)v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v37 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v37[1] = (char *)v37 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v48 = *((_QWORD *)v15 - 1);
  MEMORY[0x24BDAC7A8](v27);
  v47 = (char *)v37 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = swift_getAssociatedTypeWitness();
  v44 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v46 = (char *)v37 - v29;
  v30 = v15;
  v31 = sub_244406E28();
  v57 = sub_2444070A4();
  v53 = sub_2444070B0();
  sub_24440708C();
  (*(void (**)(char *, _QWORD, _QWORD *))(v48 + 16))(v47, v50, v15);
  v32 = v46;
  v50 = v30;
  result = sub_244406E1C();
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
      sub_244406FD8();
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
      sub_244407098();
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
  sub_244406FD8();
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
      sub_244407098();
      sub_244406FD8();
      if (((unsigned int (*)(char *, uint64_t, uint64_t))v52)(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v36, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v56);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v39 + 32))(v40, v51, v41);
  }
}

uint64_t sub_244406874@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  if (sub_244407008() < 65)
  {
    v9[1] = a3;
    sub_244407014();
    sub_244406FFC();
  }
  else
  {
    sub_2443DE4B0();
    sub_244406128();
    sub_244406DC8();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, a2);
  return sub_244406DD4();
}

uint64_t sub_244406A04(uint64_t a1, uint64_t a2)
{
  return sub_244406A3C(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double, _QWORD, _QWORD, uint64_t))sub_24440616C);
}

uint64_t sub_244406A20(uint64_t a1, uint64_t a2)
{
  return sub_244406A3C(a1, a2, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double, _QWORD, _QWORD, uint64_t))sub_244406874);
}

uint64_t sub_244406A3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, double, double, _QWORD, _QWORD, uint64_t))
{
  uint64_t v3;

  return a3(a1, *(unsigned __int16 *)(v3 + 96), *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), *(double *)(v3 + 80), *(double *)(v3 + 88), *(_QWORD *)(v3 + 64), *(_QWORD *)(v3 + 72), a2);
}

uint64_t sub_244406A80()
{
  return MEMORY[0x24BDCB1E0]();
}

uint64_t sub_244406A8C()
{
  return MEMORY[0x24BDCB1F0]();
}

uint64_t sub_244406A98()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_244406AA4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_244406AB0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_244406ABC()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_244406AC8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_244406AD4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_244406AE0()
{
  return MEMORY[0x24BDCB7E0]();
}

uint64_t sub_244406AEC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_244406AF8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_244406B04()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_244406B10()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_244406B1C()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_244406B28()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_244406B34()
{
  return MEMORY[0x24BDCE2F0]();
}

uint64_t sub_244406B40()
{
  return MEMORY[0x24BDCE350]();
}

uint64_t sub_244406B4C()
{
  return MEMORY[0x24BDCE378]();
}

uint64_t sub_244406B58()
{
  return MEMORY[0x24BDCE3A0]();
}

uint64_t sub_244406B64()
{
  return MEMORY[0x24BDCE3B8]();
}

uint64_t sub_244406B70()
{
  return MEMORY[0x24BDCE3E8]();
}

uint64_t sub_244406B7C()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_244406B88()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_244406B94()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_244406BA0()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_244406BAC()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_244406BB8()
{
  return MEMORY[0x24BDF5D78]();
}

uint64_t sub_244406BC4()
{
  return MEMORY[0x24BDF5D90]();
}

uint64_t sub_244406BD0()
{
  return MEMORY[0x24BDF5DE8]();
}

uint64_t sub_244406BDC()
{
  return MEMORY[0x24BDF5DF0]();
}

uint64_t sub_244406BE8()
{
  return MEMORY[0x24BDF5E18]();
}

uint64_t sub_244406BF4()
{
  return MEMORY[0x24BDF5E60]();
}

uint64_t sub_244406C00()
{
  return MEMORY[0x24BDF5E78]();
}

uint64_t sub_244406C0C()
{
  return MEMORY[0x24BDF5ED0]();
}

uint64_t sub_244406C18()
{
  return MEMORY[0x24BDF5F20]();
}

uint64_t sub_244406C24()
{
  return MEMORY[0x24BDF6048]();
}

uint64_t sub_244406C30()
{
  return MEMORY[0x24BE6B850]();
}

uint64_t sub_244406C3C()
{
  return MEMORY[0x24BE6B8D0]();
}

uint64_t sub_244406C48()
{
  return MEMORY[0x24BE6B8F8]();
}

uint64_t sub_244406C54()
{
  return MEMORY[0x24BE6B920]();
}

uint64_t sub_244406C60()
{
  return MEMORY[0x24BE6B928]();
}

uint64_t sub_244406C6C()
{
  return MEMORY[0x24BE6B938]();
}

uint64_t sub_244406C78()
{
  return MEMORY[0x24BE6B970]();
}

uint64_t sub_244406C84()
{
  return MEMORY[0x24BE6B988]();
}

uint64_t sub_244406C90()
{
  return MEMORY[0x24BE6BE98]();
}

uint64_t sub_244406C9C()
{
  return MEMORY[0x24BE6BEA0]();
}

uint64_t sub_244406CA8()
{
  return MEMORY[0x24BE6BED0]();
}

uint64_t sub_244406CB4()
{
  return MEMORY[0x24BE6BEF8]();
}

uint64_t sub_244406CC0()
{
  return MEMORY[0x24BE6BF28]();
}

uint64_t sub_244406CCC()
{
  return MEMORY[0x24BE6BF60]();
}

uint64_t sub_244406CD8()
{
  return MEMORY[0x24BE6BF70]();
}

uint64_t sub_244406CE4()
{
  return MEMORY[0x24BE6BF88]();
}

uint64_t sub_244406CF0()
{
  return MEMORY[0x24BE6BF98]();
}

uint64_t sub_244406CFC()
{
  return MEMORY[0x24BE6BFB0]();
}

uint64_t sub_244406D08()
{
  return MEMORY[0x24BE6BFF8]();
}

uint64_t sub_244406D14()
{
  return MEMORY[0x24BE6C048]();
}

uint64_t sub_244406D20()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244406D2C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_244406D38()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244406D44()
{
  return MEMORY[0x24BEE5F78]();
}

uint64_t sub_244406D50()
{
  return MEMORY[0x24BEE5F80]();
}

uint64_t sub_244406D5C()
{
  return MEMORY[0x24BEE5F88]();
}

uint64_t sub_244406D68()
{
  return MEMORY[0x24BEE5F90]();
}

uint64_t sub_244406D74()
{
  return MEMORY[0x24BEE5F98]();
}

uint64_t sub_244406D80()
{
  return MEMORY[0x24BEE5FA0]();
}

uint64_t sub_244406D8C()
{
  return MEMORY[0x24BEE5FA8]();
}

uint64_t sub_244406D98()
{
  return MEMORY[0x24BEE6010]();
}

uint64_t sub_244406DA4()
{
  return MEMORY[0x24BEE60D8]();
}

uint64_t sub_244406DB0()
{
  return MEMORY[0x24BEE6100]();
}

uint64_t sub_244406DBC()
{
  return MEMORY[0x24BEE0228]();
}

uint64_t sub_244406DC8()
{
  return MEMORY[0x24BEE0240]();
}

uint64_t sub_244406DD4()
{
  return MEMORY[0x24BEE0250]();
}

uint64_t sub_244406DE0()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_244406DEC()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_244406DF8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244406E04()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244406E10()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244406E1C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_244406E28()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_244406E34()
{
  return MEMORY[0x24BEE0E00]();
}

uint64_t sub_244406E40()
{
  return MEMORY[0x24BEE0F08]();
}

uint64_t sub_244406E4C()
{
  return MEMORY[0x24BEE0F10]();
}

uint64_t sub_244406E58()
{
  return MEMORY[0x24BEE0F18]();
}

uint64_t sub_244406E64()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_244406E70()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_244406E7C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_244406E88()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_244406E94()
{
  return MEMORY[0x24BEE1150]();
}

uint64_t sub_244406EA0()
{
  return MEMORY[0x24BEE1158]();
}

uint64_t sub_244406EAC()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_244406EB8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_244406EC4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_244406ED0()
{
  return MEMORY[0x24BEE1198]();
}

uint64_t sub_244406EDC()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_244406EE8()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_244406EF4()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_244406F00()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_244406F0C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_244406F18()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_244406F24()
{
  return MEMORY[0x24BEE6908]();
}

uint64_t sub_244406F30()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_244406F3C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_244406F48()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_244406F54()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_244406F60()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_244406F6C()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_244406F78()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_244406F84()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_244406F90()
{
  return MEMORY[0x24BEE1A20]();
}

uint64_t sub_244406F9C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_244406FA8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_244406FB4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244406FC0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244406FCC()
{
  return MEMORY[0x24BEE1CB0]();
}

uint64_t sub_244406FD8()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_244406FE4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244406FF0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_244406FFC()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_244407008()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_244407014()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_244407020()
{
  return MEMORY[0x24BEE2098]();
}

uint64_t sub_24440702C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_244407038()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_244407044()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_244407050()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24440705C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_244407068()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_244407074()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_244407080()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24440708C()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_244407098()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2444070A4()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2444070B0()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2444070BC()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_2444070C8()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_2444070D4()
{
  return MEMORY[0x24BEE2D80]();
}

uint64_t sub_2444070E0()
{
  return MEMORY[0x24BEE2D88]();
}

uint64_t sub_2444070EC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2444070F8()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_244407104()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_244407110()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24440711C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244407128()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_244407134()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244407140()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_24440714C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_244407158()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_244407164()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_244407170()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_24440717C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_244407188()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_244407194()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_2444071A0()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2444071AC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2444071B8()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2444071C4()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2444071D0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2444071DC()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_2444071E8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2444071F4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_244407200()
{
  return MEMORY[0x24BEE38A0]();
}

uint64_t sub_24440720C()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t sub_244407218()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_244407224()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_244407230()
{
  return MEMORY[0x24BEE3DC0]();
}

uint64_t sub_24440723C()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t sub_244407248()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t sub_244407254()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_244407260()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24440726C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_244407278()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244407284()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_244407290()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24440729C()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_2444072A8()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_2444072B4()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_2444072C0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2444072CC()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2444072D8()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2444072E4()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2444072F0()
{
  return MEMORY[0x24BEE4A98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

