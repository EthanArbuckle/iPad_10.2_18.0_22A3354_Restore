uint64_t sub_247901984()
{
  return sub_247921388(1, 0, &xmmword_2576D0570);
}

__int128 *sub_247901998()
{
  if (qword_2576C8A40 != -1)
    swift_once();
  return &xmmword_2576D0570;
}

double sub_2479019D8@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_2576C8A40 != -1)
    swift_once();
  swift_beginAccess();
  result = *(double *)&xmmword_2576D0570;
  *a1 = xmmword_2576D0570;
  return result;
}

uint64_t sub_247901A48(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *a1;
  v2 = a1[1];
  if (qword_2576C8A40 != -1)
    swift_once();
  result = swift_beginAccess();
  *(_QWORD *)&xmmword_2576D0570 = v1;
  *((_QWORD *)&xmmword_2576D0570 + 1) = v2;
  return result;
}

uint64_t (*sub_247901ABC())()
{
  if (qword_2576C8A40 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_247901B2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_247929320();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_247901B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 20);
  v2 = *(_QWORD *)v1;
  sub_247901BE0(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for SpatialInspectorDataV1()
{
  uint64_t result;

  result = qword_2576C8BD0;
  if (!qword_2576C8BD0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247901BE0(uint64_t a1, unint64_t a2)
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

uint64_t sub_247901C24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 24);
  v2 = *(_QWORD *)v1;
  sub_247901BE0(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_247901C64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 28);
  v2 = *(_QWORD *)v1;
  sub_247901CA4(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_247901CA4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_247901BE0(a1, a2);
  return a1;
}

uint64_t sub_247901CB8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 32));
}

uint64_t sub_247901CE0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SpatialInspectorDataV1() + 36));
}

int *sub_247901D08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14)
{
  uint64_t v21;
  int *result;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;

  v21 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(a9, a1, v21);
  result = (int *)type metadata accessor for SpatialInspectorDataV1();
  v23 = (_QWORD *)(a9 + result[5]);
  *v23 = a2;
  v23[1] = a3;
  v24 = (_QWORD *)(a9 + result[6]);
  *v24 = a4;
  v24[1] = a5;
  v25 = (_QWORD *)(a9 + result[7]);
  *v25 = a6;
  v25[1] = a7;
  v26 = a9 + result[8];
  *(_QWORD *)v26 = a8;
  *(_QWORD *)(v26 + 8) = a10;
  *(_BYTE *)(v26 + 16) = a11 & 1;
  v27 = a9 + result[9];
  *(_QWORD *)v27 = a12;
  *(_QWORD *)(v27 + 8) = a13;
  *(_BYTE *)(v27 + 16) = a14 & 1;
  return result;
}

uint64_t sub_247901E0C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247901E44 + 4 * byte_247929FF0[a1]))(0xD000000000000010, 0x8000000247930C60);
}

uint64_t sub_247901E44()
{
  return 0x536465646F636E65;
}

uint64_t sub_247901E64(uint64_t a1)
{
  return a1 + 8;
}

uint64_t sub_247901E8C()
{
  return 0x7A6953656E656373;
}

uint64_t sub_247901EA8()
{
  return 0x6E6543656E656373;
}

BOOL sub_247901EC8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247901EDC()
{
  sub_247929AAC();
  sub_247929AB8();
  return sub_247929AE8();
}

uint64_t sub_247901F20()
{
  return sub_247929AB8();
}

uint64_t sub_247901F48()
{
  sub_247929AAC();
  sub_247929AB8();
  return sub_247929AE8();
}

uint64_t sub_247901F88()
{
  unsigned __int8 *v0;

  return sub_247901E0C(*v0);
}

uint64_t sub_247901F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790349C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247901FB4()
{
  return 0;
}

void sub_247901FC0(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_247901FCC()
{
  sub_247902330();
  return sub_247929B54();
}

uint64_t sub_247901FF4()
{
  sub_247902330();
  return sub_247929B60();
}

uint64_t sub_24790201C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  __int128 *v10;
  char v11;
  __int128 *v12;
  char v13;
  __int128 v15;
  char v16;
  char v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7760);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247902330();
  sub_247929B00();
  LOBYTE(v15) = 0;
  sub_247929320();
  sub_247902A20(&qword_2576C7768, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_2479299C8();
  if (!v2)
  {
    v9 = (int *)type metadata accessor for SpatialInspectorDataV1();
    v15 = *(_OWORD *)(v3 + v9[5]);
    v17 = 1;
    sub_247902374();
    sub_2479299C8();
    v15 = *(_OWORD *)(v3 + v9[6]);
    v17 = 2;
    sub_2479299C8();
    v15 = *(_OWORD *)(v3 + v9[7]);
    v17 = 3;
    sub_247929974();
    v10 = (__int128 *)(v3 + v9[8]);
    v11 = *((_BYTE *)v10 + 16);
    v15 = *v10;
    v16 = v11;
    v17 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7778);
    sub_247902900(&qword_2576C7780, MEMORY[0x24BEE4108]);
    sub_247929974();
    v12 = (__int128 *)(v3 + v9[9]);
    v13 = *((_BYTE *)v12 + 16);
    v15 = *v12;
    v16 = v13;
    v17 = 5;
    sub_247929974();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24958474C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_247902330()
{
  unint64_t result;

  result = qword_2576C8A48[0];
  if (!qword_2576C8A48[0])
  {
    result = MEMORY[0x249584764](&unk_24792A1B4, &type metadata for SpatialInspectorDataV1.CodingKeys);
    atomic_store(result, qword_2576C8A48);
  }
  return result;
}

unint64_t sub_247902374()
{
  unint64_t result;

  result = qword_2576C7770;
  if (!qword_2576C7770)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2576C7770);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249584758](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2479023FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  __int128 v27;
  char v28;
  char v29;

  v21 = a2;
  v22 = sub_247929320();
  v3 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7788);
  v5 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for SpatialInspectorDataV1();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247902330();
  v24 = v7;
  v11 = (uint64_t)v26;
  sub_247929AF4();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v12 = v5;
  v26 = a1;
  v13 = (uint64_t)v10;
  LOBYTE(v27) = 0;
  sub_247902A20(&qword_2576C7790, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v14 = v22;
  v15 = v23;
  sub_247929914();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v13, v15, v14);
  v29 = 1;
  sub_2479028BC();
  sub_247929914();
  *(_OWORD *)(v13 + v8[5]) = v27;
  v29 = 2;
  sub_247929914();
  *(_OWORD *)(v13 + v8[6]) = v27;
  v29 = 3;
  sub_2479298C0();
  v23 = 0;
  *(_OWORD *)(v13 + v8[7]) = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7778);
  v29 = 4;
  sub_247902900(&qword_2576C77A0, MEMORY[0x24BEE4118]);
  sub_2479298C0();
  v16 = v28;
  v17 = v13 + v8[8];
  *(_OWORD *)v17 = v27;
  *(_BYTE *)(v17 + 16) = v16;
  v29 = 5;
  sub_2479298C0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v24, v25);
  v18 = v28;
  v19 = v13 + v8[9];
  *(_OWORD *)v19 = v27;
  *(_BYTE *)(v19 + 16) = v18;
  sub_247902944(v13, v21);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return sub_247902988(v13);
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

uint64_t sub_247902864(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_247902878(a1, a2);
  return a1;
}

uint64_t sub_247902878(uint64_t a1, unint64_t a2)
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

unint64_t sub_2479028BC()
{
  unint64_t result;

  result = qword_2576C7798;
  if (!qword_2576C7798)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2576C7798);
  }
  return result;
}

uint64_t sub_247902900(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7778);
    result = MEMORY[0x249584764](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247902944(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SpatialInspectorDataV1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247902988(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SpatialInspectorDataV1();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2479029C4(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_247902A20(&qword_2576C77A8, (uint64_t (*)(uint64_t))type metadata accessor for SpatialInspectorDataV1, (uint64_t)&unk_24792A01C);
  result = sub_247902A20(qword_2576C77B0, (uint64_t (*)(uint64_t))type metadata accessor for SpatialInspectorDataV1, (uint64_t)&unk_24792A044);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_247902A20(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249584764](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247902A60@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2479023FC(a1, a2);
}

uint64_t sub_247902A74(_QWORD *a1)
{
  return sub_24790201C(a1);
}

uint64_t *sub_247902A88(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247929320();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = *v10;
    v12 = v10[1];
    sub_247901BE0(*v10, v12);
    *v9 = v11;
    v9[1] = v12;
    v13 = a3[6];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = *v15;
    v17 = v15[1];
    sub_247901BE0(*v15, v17);
    *v14 = v16;
    v14[1] = v17;
    v18 = a3[7];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    v21 = *((_QWORD *)v20 + 1);
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)v19 = *(_OWORD *)v20;
    }
    else
    {
      v23 = *(_QWORD *)v20;
      sub_247901BE0(*(_QWORD *)v20, *((_QWORD *)v20 + 1));
      *(_QWORD *)v19 = v23;
      *((_QWORD *)v19 + 1) = v21;
    }
    v24 = a3[8];
    v25 = a3[9];
    v26 = (char *)a1 + v24;
    v27 = (char *)a2 + v24;
    *(_OWORD *)v26 = *(_OWORD *)v27;
    v26[16] = v27[16];
    v28 = (char *)a1 + v25;
    v29 = (char *)a2 + v25;
    *(_OWORD *)v28 = *(_OWORD *)v29;
    v28[16] = v29[16];
  }
  return a1;
}

uint64_t sub_247902BBC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  unint64_t v7;

  v4 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_247902878(*(_QWORD *)(a1 + a2[5]), *(_QWORD *)(a1 + a2[5] + 8));
  result = sub_247902878(*(_QWORD *)(a1 + a2[6]), *(_QWORD *)(a1 + a2[6] + 8));
  v6 = (uint64_t *)(a1 + a2[7]);
  v7 = v6[1];
  if (v7 >> 60 != 15)
    return sub_247902878(*v6, v7);
  return result;
}

uint64_t sub_247902C40(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_247901BE0(*v9, v11);
  *v8 = v10;
  v8[1] = v11;
  v12 = a3[6];
  v13 = (uint64_t *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  v16 = v14[1];
  sub_247901BE0(*v14, v16);
  *v13 = v15;
  v13[1] = v16;
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = (uint64_t *)(a2 + v17);
  v20 = v19[1];
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  else
  {
    v21 = *v19;
    sub_247901BE0(*v19, v19[1]);
    *(_QWORD *)v18 = v21;
    *(_QWORD *)(v18 + 8) = v20;
  }
  v22 = a3[8];
  v23 = a3[9];
  v24 = a1 + v22;
  v25 = a2 + v22;
  *(_OWORD *)v24 = *(_OWORD *)v25;
  *(_BYTE *)(v24 + 16) = *(_BYTE *)(v25 + 16);
  v26 = a1 + v23;
  v27 = a2 + v23;
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *(_BYTE *)(v26 + 16) = *(_BYTE *)(v27 + 16);
  return a1;
}

uint64_t sub_247902D48(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int128 *v35;
  __int128 v36;

  v6 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_247901BE0(*v9, v11);
  v12 = *v8;
  v13 = v8[1];
  *v8 = v10;
  v8[1] = v11;
  sub_247902878(v12, v13);
  v14 = a3[6];
  v15 = (uint64_t *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = *v16;
  v18 = v16[1];
  sub_247901BE0(*v16, v18);
  v19 = *v15;
  v20 = v15[1];
  *v15 = v17;
  v15[1] = v18;
  sub_247902878(v19, v20);
  v21 = a3[7];
  v22 = (uint64_t *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v24 = *(_QWORD *)(a2 + v21 + 8);
  if (*(_QWORD *)(a1 + v21 + 8) >> 60 != 15)
  {
    if (v24 >> 60 != 15)
    {
      v26 = *v23;
      sub_247901BE0(v26, v24);
      v27 = *v22;
      v28 = v22[1];
      *v22 = v26;
      v22[1] = v24;
      sub_247902878(v27, v28);
      goto LABEL_8;
    }
    sub_247902EA8((uint64_t)v22);
    goto LABEL_6;
  }
  if (v24 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)v22 = *(_OWORD *)v23;
    goto LABEL_8;
  }
  v25 = *v23;
  sub_247901BE0(v25, v24);
  *v22 = v25;
  v22[1] = v24;
LABEL_8:
  v29 = a3[8];
  v30 = a1 + v29;
  v31 = (__int128 *)(a2 + v29);
  v32 = *v31;
  *(_BYTE *)(v30 + 16) = *((_BYTE *)v31 + 16);
  *(_OWORD *)v30 = v32;
  v33 = a3[9];
  v34 = a1 + v33;
  v35 = (__int128 *)(a2 + v33);
  v36 = *v35;
  *(_BYTE *)(v34 + 16) = *((_BYTE *)v35 + 16);
  *(_OWORD *)v34 = v36;
  return a1;
}

uint64_t sub_247902EA8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t sub_247902EDC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_BYTE *)(v9 + 16) = *(_BYTE *)(v10 + 16);
  v11 = a3[9];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *(_BYTE *)(v12 + 16) = *(_BYTE *)(v13 + 16);
  return a1;
}

uint64_t sub_247902F80(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(_QWORD *)(a1 + v7);
  v9 = *(_QWORD *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_247902878(v8, v9);
  v10 = a3[6];
  v11 = *(_QWORD *)(a1 + v10);
  v12 = *(_QWORD *)(a1 + v10 + 8);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  sub_247902878(v11, v12);
  v13 = a3[7];
  v14 = (uint64_t *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v16 = *(_QWORD *)(a1 + v13 + 8);
  if (v16 >> 60 != 15)
  {
    v17 = v15[1];
    if (v17 >> 60 != 15)
    {
      v18 = *v14;
      *v14 = *v15;
      v14[1] = v17;
      sub_247902878(v18, v16);
      goto LABEL_6;
    }
    sub_247902EA8((uint64_t)v14);
  }
  *(_OWORD *)v14 = *(_OWORD *)v15;
LABEL_6:
  v19 = a3[8];
  v20 = a3[9];
  v21 = a1 + v19;
  v22 = a2 + v19;
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *(_BYTE *)(v21 + 16) = *(_BYTE *)(v22 + 16);
  v23 = a1 + v20;
  v24 = a2 + v20;
  *(_OWORD *)v23 = *(_OWORD *)v24;
  *(_BYTE *)(v23 + 16) = *(_BYTE *)(v24 + 16);
  return a1;
}

uint64_t sub_24790308C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247903098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v6 = sub_247929320();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
  if (((4 * (_DWORD)v9) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v9) & 0xC | (v9 >> 2));
  else
    return 0;
}

uint64_t sub_247903128()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247903134(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;

  result = sub_247929320();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  v10 = (_QWORD *)(a1 + *(int *)(a4 + 20));
  *v10 = 0;
  v10[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

uint64_t sub_2479031BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247929320();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpatialInspectorDataV1.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SpatialInspectorDataV1.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247903330 + 4 * byte_247929FFB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_247903364 + 4 * byte_247929FF6[v4]))();
}

uint64_t sub_247903364(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24790336C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247903374);
  return result;
}

uint64_t sub_247903380(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247903388);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24790338C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247903394(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2479033A0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2479033AC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SpatialInspectorDataV1.CodingKeys()
{
  return &type metadata for SpatialInspectorDataV1.CodingKeys;
}

unint64_t sub_2479033C8()
{
  unint64_t result;

  result = qword_2576C8CE0[0];
  if (!qword_2576C8CE0[0])
  {
    result = MEMORY[0x249584764](&unk_24792A18C, &type metadata for SpatialInspectorDataV1.CodingKeys);
    atomic_store(result, qword_2576C8CE0);
  }
  return result;
}

unint64_t sub_247903410()
{
  unint64_t result;

  result = qword_2576C8DF0;
  if (!qword_2576C8DF0)
  {
    result = MEMORY[0x249584764](&unk_24792A0FC, &type metadata for SpatialInspectorDataV1.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C8DF0);
  }
  return result;
}

unint64_t sub_247903458()
{
  unint64_t result;

  result = qword_2576C8DF8[0];
  if (!qword_2576C8DF8[0])
  {
    result = MEMORY[0x249584764](&unk_24792A124, &type metadata for SpatialInspectorDataV1.CodingKeys);
    atomic_store(result, qword_2576C8DF8);
  }
  return result;
}

uint64_t sub_24790349C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000247930C60 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536465646F636E65 && a2 == 0xEC000000656E6563 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000247930C80 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000247930CA0 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7A6953656E656373 && a2 == 0xE900000000000065 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E6543656E656373 && a2 == 0xEB00000000726574)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v5 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_247903744(char *a1, char *a2)
{
  return sub_247903750(*a1, *a2);
}

uint64_t sub_247903750(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6C616E7265746E69;
  else
    v3 = 0x7372655661746164;
  if (v2)
    v4 = 0xEB000000006E6F69;
  else
    v4 = 0xE900000000000073;
  if ((a2 & 1) != 0)
    v5 = 0x6C616E7265746E69;
  else
    v5 = 0x7372655661746164;
  if ((a2 & 1) != 0)
    v6 = 0xE900000000000073;
  else
    v6 = 0xEB000000006E6F69;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_247929A28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_247903800()
{
  sub_247929AAC();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  return sub_247929AE8();
}

uint64_t sub_24790388C()
{
  sub_2479294E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2479038F4()
{
  sub_247929AAC();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  return sub_247929AE8();
}

uint64_t sub_24790397C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_247929890();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_2479039D8(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x7372655661746164;
  if (*v1)
    v2 = 0x6C616E7265746E69;
  v3 = 0xEB000000006E6F69;
  if (*v1)
    v3 = 0xE900000000000073;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_247903A24()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C616E7265746E69;
  else
    return 0x7372655661746164;
}

uint64_t sub_247903A6C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_247929890();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_247903ACC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_247903AD8()
{
  sub_247904B24();
  return sub_247929B54();
}

uint64_t sub_247903B00()
{
  sub_247904B24();
  return sub_247929B60();
}

__n128 sub_247903B28@<Q0>(__int128 *a1@<X8>)
{
  __int128 *v2;
  __n128 result;

  v2 = sub_247916D04();
  swift_beginAccess();
  result = (__n128)*v2;
  *a1 = *v2;
  return result;
}

uint64_t sub_247903B6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  return sub_247903BBC(v3, a1);
}

uint64_t sub_247903BBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247903C00(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_247903C60(a1, v3);
  return swift_endAccess();
}

uint64_t sub_247903C60(__int128 *a1, uint64_t a2)
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

uint64_t (*sub_247903C78())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id SpatialSceneDebugRepresentation.__allocating_init(encodedSceneUUID:encodedScene:sceneDebugRepresentation:sceneStatisticsRepresentation:sceneConfiguration:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  objc_class *v9;
  id v18;
  id v19;

  v18 = objc_allocWithZone(v9);
  v19 = sub_247904938(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  sub_247902864(a8, a9);
  sub_247902864(a6, a7);
  sub_247902878(a4, a5);
  sub_247902878(a2, a3);
  return v19;
}

id SpatialSceneDebugRepresentation.init(encodedSceneUUID:encodedScene:sceneDebugRepresentation:sceneStatisticsRepresentation:sceneConfiguration:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  id v16;

  v16 = sub_247904938(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  sub_247902864(a8, a9);
  sub_247902864(a6, a7);
  sub_247902878(a4, a5);
  sub_247902878(a2, a3);
  return v16;
}

uint64_t SpatialSceneDebugRepresentation.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD v16[2];
  __int128 v17;
  char v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7850);
  v6 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247904B24();
  sub_247929B00();
  v17 = *(_OWORD *)(v3 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_dataVersion);
  v18 = 0;
  sub_247904B68();
  sub_2479299C8();
  if (!v2)
  {
    v10 = (_QWORD *)(v3 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals);
    swift_beginAccess();
    v11 = v10[3];
    v12 = __swift_project_boxed_opaque_existential_1(v10, v11);
    v16[1] = v16;
    v13 = *(_QWORD *)(v11 - 8);
    MEMORY[0x24BDAC7A8](v12, v12);
    v15 = (char *)v16 - v14;
    (*(void (**)(char *))(v13 + 16))((char *)v16 - v14);
    v18 = 1;
    sub_2479299C8();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id SpatialSceneDebugRepresentation.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SpatialSceneDebugRepresentation.init(from:)(a1);
}

id SpatialSceneDebugRepresentation.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)();
  unint64_t *v17;
  void *v18;
  uint64_t v19;
  __int128 *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  objc_class *ObjectType;
  objc_super v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v3 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7868);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v23 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v9);
  sub_247904B24();
  v10 = v3;
  sub_247929AF4();
  if (!v2)
  {
    v29 = 0;
    sub_247904BAC();
    sub_247929914();
    v13 = v26;
    *(_OWORD *)&v10[OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_dataVersion] = v26;
    v14 = v13;
    if (v13 == 2)
    {
      v19 = type metadata accessor for SpatialInspectorDataV2();
      v16 = type metadata accessor for SpatialInspectorDataV2;
      v29 = 1;
      v27 = v19;
      v28 = sub_247902A20(&qword_2576C7880, (uint64_t (*)(uint64_t))type metadata accessor for SpatialInspectorDataV2, (uint64_t)&unk_24792BBC0);
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
      v17 = (unint64_t *)&unk_2576C7888;
      v18 = &unk_24792BBDC;
    }
    else
    {
      if (v13 != 1)
      {
        v20 = sub_247916D04();
        swift_beginAccess();
        v21 = *(_QWORD *)v20;
        sub_247904BF0();
        swift_allocError();
        *v22 = v14;
        v22[1] = v21;
        swift_willThrow();

        (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
        goto LABEL_4;
      }
      v15 = type metadata accessor for SpatialInspectorDataV1();
      v16 = type metadata accessor for SpatialInspectorDataV1;
      v29 = 1;
      v27 = v15;
      v28 = sub_247902A20(&qword_2576C7890, (uint64_t (*)(uint64_t))type metadata accessor for SpatialInspectorDataV1, (uint64_t)&unk_24792A000);
      __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
      v17 = &qword_2576C77A8;
      v18 = &unk_24792A01C;
    }
    sub_247902A20(v17, (uint64_t (*)(uint64_t))v16, (uint64_t)v18);
    sub_247929914();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_247903C60(&v26, (uint64_t)&v10[OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals]);

    v25.receiver = v10;
    v25.super_class = ObjectType;
    v11 = objc_msgSendSuper2(&v25, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    return v11;
  }

LABEL_4:
  v11 = ObjectType;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  swift_deallocPartialClassInstance();
  return v11;
}

id SpatialSceneDebugRepresentation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SpatialSceneDebugRepresentation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SpatialSceneDebugRepresentation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_247904438@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  objc_class *v2;
  uint64_t v3;
  id v6;
  id result;

  v6 = objc_allocWithZone(v2);
  result = SpatialSceneDebugRepresentation.init(from:)(a1);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_247904484(_QWORD *a1)
{
  return SpatialSceneDebugRepresentation.encode(to:)(a1);
}

__n128 SpatialSceneDebugRepresentation.version.getter@<Q0>(__int128 *a1@<X8>)
{
  __int128 *v2;
  __n128 result;

  v2 = sub_247916D04();
  swift_beginAccess();
  result = (__n128)*v2;
  *a1 = *v2;
  return result;
}

uint64_t SpatialSceneDebugRepresentation.encodedSceneUUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[24];
  _BYTE v11[40];

  v3 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = v1 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_247903BBC(v7, (uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7898);
  swift_dynamicCast();
  v8 = sub_247929320();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, v6, v8);
  return sub_247904CA4((uint64_t)v6);
}

uint64_t SpatialSceneDebugRepresentation.encodedScene.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[24];
  char v10[40];

  v1 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_247903BBC(v5, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7898);
  swift_dynamicCast();
  v6 = &v4[*(int *)(v1 + 20)];
  v7 = *(_QWORD *)v6;
  sub_247901BE0(*(_QWORD *)v6, *((_QWORD *)v6 + 1));
  sub_247904CA4((uint64_t)v4);
  return v7;
}

uint64_t SpatialSceneDebugRepresentation.sceneDebugRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[24];
  char v10[40];

  v1 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_247903BBC(v5, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7898);
  swift_dynamicCast();
  v6 = &v4[*(int *)(v1 + 24)];
  v7 = *(_QWORD *)v6;
  sub_247901BE0(*(_QWORD *)v6, *((_QWORD *)v6 + 1));
  sub_247904CA4((uint64_t)v4);
  return v7;
}

uint64_t SpatialSceneDebugRepresentation.sceneStatisticsRepresentation.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[24];
  char v10[40];

  v1 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_247903BBC(v5, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7898);
  swift_dynamicCast();
  v6 = &v4[*(int *)(v1 + 28)];
  v7 = *(_QWORD *)v6;
  sub_247901CA4(*(_QWORD *)v6, *((_QWORD *)v6 + 1));
  sub_247904CA4((uint64_t)v4);
  return v7;
}

uint64_t SpatialSceneDebugRepresentation.sceneConfiguration.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[24];
  char v10[40];

  v1 = type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals;
  swift_beginAccess();
  sub_247903BBC(v5, (uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7898);
  swift_dynamicCast();
  v6 = &v4[*(int *)(v1 + 32)];
  v7 = *(_QWORD *)v6;
  sub_247901CA4(*(_QWORD *)v6, *((_QWORD *)v6 + 1));
  sub_247904CA4((uint64_t)v4);
  return v7;
}

__n128 sub_247904924(__n128 *a1)
{
  uint64_t v1;
  __n128 result;

  result = *a1;
  *(__n128 *)(v1 + OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_dataVersion) = *a1;
  return result;
}

id sub_247904938(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unint64_t a9)
{
  void *v9;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 *v31;
  id v32;
  uint64_t *boxed_opaque_existential_1;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_class *ObjectType;
  objc_super v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;

  v39 = a1;
  v35 = a9;
  v36 = a8;
  ObjectType = (objc_class *)swift_getObjectType();
  v17 = sub_247929320();
  v37 = *(_QWORD *)(v17 - 8);
  v38 = v17;
  MEMORY[0x24BDAC7A8]();
  v19 = (char *)&boxed_opaque_existential_1 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v20 + 16))(v19, a1);
  v43 = type metadata accessor for SpatialInspectorDataV2();
  v44 = sub_247902A20(&qword_2576C7880, (uint64_t (*)(uint64_t))type metadata accessor for SpatialInspectorDataV2, (uint64_t)&unk_24792BBC0);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
  v21 = v9;
  v22 = a3;
  sub_247901BE0(a2, a3);
  v23 = a4;
  v24 = a4;
  v25 = a5;
  sub_247901BE0(v23, a5);
  v26 = a6;
  v27 = a6;
  v28 = a7;
  sub_247901CA4(v27, a7);
  v29 = v35;
  v30 = v36;
  sub_247901CA4(v36, v35);
  sub_247916FD0((uint64_t)v19, a2, v22, v24, v25, v26, v28, v30, (uint64_t)boxed_opaque_existential_1, v29);
  sub_247903C60(&v42, (uint64_t)&v21[OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_internals]);
  v31 = sub_247916D04();
  swift_beginAccess();
  *(_OWORD *)&v21[OBJC_IVAR____TtC26SpatialInspectorFoundation31SpatialSceneDebugRepresentation_dataVersion] = *v31;

  v41.receiver = v21;
  v41.super_class = ObjectType;
  v32 = objc_msgSendSuper2(&v41, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v39, v38);
  return v32;
}

unint64_t sub_247904B24()
{
  unint64_t result;

  result = qword_2576C8E80[0];
  if (!qword_2576C8E80[0])
  {
    result = MEMORY[0x249584764](&unk_24792A3E0, &type metadata for SpatialSceneDebugRepresentation.CodingKeys);
    atomic_store(result, qword_2576C8E80);
  }
  return result;
}

unint64_t sub_247904B68()
{
  unint64_t result;

  result = qword_2576C7860;
  if (!qword_2576C7860)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for SpatialInspectorVersion, &type metadata for SpatialInspectorVersion);
    atomic_store(result, (unint64_t *)&qword_2576C7860);
  }
  return result;
}

unint64_t sub_247904BAC()
{
  unint64_t result;

  result = qword_2576C7870;
  if (!qword_2576C7870)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for SpatialInspectorVersion, &type metadata for SpatialInspectorVersion);
    atomic_store(result, (unint64_t *)&qword_2576C7870);
  }
  return result;
}

unint64_t sub_247904BF0()
{
  unint64_t result;

  result = qword_2576C7878;
  if (!qword_2576C7878)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for SpatialInspectorVersioningError, &type metadata for SpatialInspectorVersioningError);
    atomic_store(result, (unint64_t *)&qword_2576C7878);
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

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x2495847F4);
  return result;
}

uint64_t sub_247904CA4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SpatialInspectorDataV2();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SpatialSceneDebugRepresentation()
{
  return objc_opt_self();
}

uint64_t method lookup function for SpatialSceneDebugRepresentation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SpatialSceneDebugRepresentation.__allocating_init(encodedSceneUUID:encodedScene:sceneDebugRepresentation:sceneStatisticsRepresentation:sceneConfiguration:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of SpatialSceneDebugRepresentation.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_247904D34(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t getEnumTagSinglePayload for SpatialSceneDebugRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SpatialSceneDebugRepresentation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247904E18 + 4 * byte_24792A215[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247904E4C + 4 * byte_24792A210[v4]))();
}

uint64_t sub_247904E4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247904E54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247904E5CLL);
  return result;
}

uint64_t sub_247904E68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247904E70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247904E74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247904E7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_247904E88(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpatialSceneDebugRepresentation.CodingKeys()
{
  return &type metadata for SpatialSceneDebugRepresentation.CodingKeys;
}

unint64_t sub_247904EA8()
{
  unint64_t result;

  result = qword_2576C9110[0];
  if (!qword_2576C9110[0])
  {
    result = MEMORY[0x249584764](&unk_24792A3B8, &type metadata for SpatialSceneDebugRepresentation.CodingKeys);
    atomic_store(result, qword_2576C9110);
  }
  return result;
}

unint64_t sub_247904EF0()
{
  unint64_t result;

  result = qword_2576C9220;
  if (!qword_2576C9220)
  {
    result = MEMORY[0x249584764](&unk_24792A2F0, &type metadata for SpatialSceneDebugRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C9220);
  }
  return result;
}

unint64_t sub_247904F38()
{
  unint64_t result;

  result = qword_2576C9228[0];
  if (!qword_2576C9228[0])
  {
    result = MEMORY[0x249584764](&unk_24792A318, &type metadata for SpatialSceneDebugRepresentation.CodingKeys);
    atomic_store(result, qword_2576C9228);
  }
  return result;
}

uint64_t SceneConfiguration.sceneSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SceneConfiguration.contentOrigin.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t SceneConfiguration.bundleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

__n128 SceneConfiguration.cameraTransform.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  __int128 v3;
  __n128 result;

  v2 = *(_BYTE *)(v1 + 128);
  v3 = *(_OWORD *)(v1 + 96);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(a1 + 16) = v3;
  result = *(__n128 *)(v1 + 112);
  *(__n128 *)(a1 + 32) = result;
  *(_BYTE *)(a1 + 48) = v2;
  return result;
}

double SceneConfiguration.init(sceneSize:contentOrigin:bundleID:cameraTransform:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  char v19;
  __int128 v20;
  double result;
  _OWORD v22[2];
  __int128 v23;
  char v24;

  sub_247905080(a10, (uint64_t)v22);
  v19 = v24;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 16) = a3 & 1;
  *(_QWORD *)(a9 + 32) = a4;
  *(_QWORD *)(a9 + 40) = a5;
  *(_BYTE *)(a9 + 48) = a6 & 1;
  *(_QWORD *)(a9 + 56) = a7;
  *(_QWORD *)(a9 + 64) = a8;
  v20 = v22[1];
  *(_OWORD *)(a9 + 80) = v22[0];
  *(_OWORD *)(a9 + 96) = v20;
  result = *(double *)&v23;
  *(_OWORD *)(a9 + 112) = v23;
  *(_BYTE *)(a9 + 128) = v19;
  return result;
}

uint64_t sub_247905080(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C78C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2479050C8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2479050FC + 4 * byte_24792A440[*v0]))(0x7A6953656E656373, 0xE900000000000065);
}

uint64_t sub_2479050FC()
{
  return 0x4F746E65746E6F63;
}

uint64_t sub_247905120()
{
  return 0x4449656C646E7562;
}

uint64_t sub_247905138()
{
  return 0x72546172656D6163;
}

uint64_t sub_24790515C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247905CA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_247905180(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24790518C()
{
  sub_247905440();
  return sub_247929B54();
}

uint64_t sub_2479051B4()
{
  sub_247905440();
  return sub_247929B60();
}

uint64_t SceneConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
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
  char v38;
  int v39;
  char v40;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C78D0);
  v30 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v9 = *((_BYTE *)v1 + 16);
  v10 = v1[4];
  v28 = v1[5];
  v29 = v10;
  v39 = *((unsigned __int8 *)v1 + 48);
  v11 = v1[7];
  v26 = v1[8];
  v27 = v11;
  v12 = v1[11];
  v19 = v1[10];
  v20 = v12;
  v13 = v1[12];
  v24 = v1[13];
  v25 = v13;
  v14 = v1[14];
  v22 = v1[15];
  v23 = v14;
  v21 = *((unsigned __int8 *)v1 + 128);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247905440();
  sub_247929B00();
  v32 = v8;
  v33 = v7;
  LOBYTE(v34) = v9;
  v40 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7778);
  sub_247902900(&qword_2576C7780, MEMORY[0x24BEE4108]);
  v15 = v31;
  sub_247929974();
  if (v15)
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v6, v3);
  v17 = v30;
  v32 = v29;
  v33 = v28;
  LOBYTE(v34) = v39;
  v40 = 1;
  sub_247929974();
  LOBYTE(v32) = 2;
  sub_247929968();
  v32 = v19;
  v33 = v20;
  v34 = v25;
  v35 = v24;
  v36 = v23;
  v37 = v22;
  v38 = v21;
  v40 = 3;
  sub_247905484();
  sub_247929974();
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v6, v3);
}

unint64_t sub_247905440()
{
  unint64_t result;

  result = qword_2576C92B0[0];
  if (!qword_2576C92B0[0])
  {
    result = MEMORY[0x249584764](&unk_24792A5A8, &type metadata for SceneConfiguration.CodingKeys);
    atomic_store(result, qword_2576C92B0);
  }
  return result;
}

unint64_t sub_247905484()
{
  unint64_t result;

  result = qword_2576C78D8;
  if (!qword_2576C78D8)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BDE72F8], MEMORY[0x24BDE72F0]);
    atomic_store(result, (unint64_t *)&qword_2576C78D8);
  }
  return result;
}

uint64_t SceneConfiguration.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  int v32;
  char v33;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C78E0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247905440();
  sub_247929AF4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7778);
  v33 = 0;
  sub_247902900(&qword_2576C77A0, MEMORY[0x24BEE4118]);
  sub_2479298C0();
  v26 = *((_QWORD *)&v28 + 1);
  v27 = v28;
  v32 = v29;
  v33 = 1;
  sub_2479298C0();
  v10 = *((_QWORD *)&v28 + 1);
  v25 = v28;
  v11 = v29;
  LOBYTE(v28) = 2;
  v12 = sub_2479298B4();
  v14 = v13;
  v22 = v12;
  v23 = v11;
  v24 = v10;
  v33 = 3;
  sub_24790575C();
  swift_bridgeObjectRetain();
  sub_2479298C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v15 = v31;
  v16 = v28;
  v17 = v29;
  v18 = v30;
  v19 = v26;
  *(_QWORD *)a2 = v27;
  *(_QWORD *)(a2 + 8) = v19;
  *(_BYTE *)(a2 + 16) = v32;
  v20 = v24;
  *(_QWORD *)(a2 + 32) = v25;
  *(_QWORD *)(a2 + 40) = v20;
  *(_BYTE *)(a2 + 48) = v23;
  *(_QWORD *)(a2 + 56) = v22;
  *(_QWORD *)(a2 + 64) = v14;
  *(_OWORD *)(a2 + 80) = v16;
  *(_OWORD *)(a2 + 96) = v17;
  *(_OWORD *)(a2 + 112) = v18;
  *(_BYTE *)(a2 + 128) = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_24790575C()
{
  unint64_t result;

  result = qword_2576C78E8;
  if (!qword_2576C78E8)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BDE7300], MEMORY[0x24BDE72F0]);
    atomic_store(result, (unint64_t *)&qword_2576C78E8);
  }
  return result;
}

uint64_t sub_2479057A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SceneConfiguration.init(from:)(a1, a2);
}

uint64_t sub_2479057B4(_QWORD *a1)
{
  return SceneConfiguration.encode(to:)(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for SceneConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SceneConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SceneConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v3 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v3;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v4 = *(_OWORD *)(a2 + 112);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v4;
  *(_OWORD *)(a1 + 80) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SceneConfiguration(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v4 = *a2;
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_OWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 7);
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a2[5];
  v7 = a2[6];
  v8 = a2[7];
  *(_BYTE *)(a1 + 128) = *((_BYTE *)a2 + 128);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 112) = v8;
  *(_OWORD *)(a1 + 80) = v6;
  return a1;
}

__n128 __swift_memcpy129_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for SceneConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneConfiguration(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 129))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 64);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 128) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 129) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 129) = 0;
    if (a2)
      *(_QWORD *)(result + 64) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneConfiguration()
{
  return &type metadata for SceneConfiguration;
}

uint64_t getEnumTagSinglePayload for SceneConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SceneConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247905B48 + 4 * byte_24792A449[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_247905B7C + 4 * byte_24792A444[v4]))();
}

uint64_t sub_247905B7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247905B84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247905B8CLL);
  return result;
}

uint64_t sub_247905B98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247905BA0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_247905BA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247905BAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SceneConfiguration.CodingKeys()
{
  return &type metadata for SceneConfiguration.CodingKeys;
}

unint64_t sub_247905BCC()
{
  unint64_t result;

  result = qword_2576C94C0[0];
  if (!qword_2576C94C0[0])
  {
    result = MEMORY[0x249584764](&unk_24792A580, &type metadata for SceneConfiguration.CodingKeys);
    atomic_store(result, qword_2576C94C0);
  }
  return result;
}

unint64_t sub_247905C14()
{
  unint64_t result;

  result = qword_2576C95D0;
  if (!qword_2576C95D0)
  {
    result = MEMORY[0x249584764](&unk_24792A4F0, &type metadata for SceneConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C95D0);
  }
  return result;
}

unint64_t sub_247905C5C()
{
  unint64_t result;

  result = qword_2576C95D8[0];
  if (!qword_2576C95D8[0])
  {
    result = MEMORY[0x249584764](&unk_24792A518, &type metadata for SceneConfiguration.CodingKeys);
    atomic_store(result, qword_2576C95D8);
  }
  return result;
}

uint64_t sub_247905CA0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7A6953656E656373 && a2 == 0xE900000000000065;
  if (v2 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4F746E65746E6F63 && a2 == 0xED00006E69676972 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4449656C646E7562 && a2 == 0xE800000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x72546172656D6163 && a2 == 0xEF6D726F66736E61)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

unint64_t InspectorStatisticsBase.Geometry.meshTriangleCount.getter()
{
  unsigned int *v0;

  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

unint64_t InspectorStatisticsBase.Geometry.meshVertexCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8) | ((unint64_t)*(unsigned __int8 *)(v0 + 12) << 32);
}

unint64_t InspectorStatisticsBase.Geometry.meshCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

uint64_t InspectorStatisticsBase.Geometry.meshMemory.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t InspectorStatisticsBase.Geometry.init(meshTriangleCount:meshVertexCount:meshCount:meshMemory:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(_BYTE *)(a6 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a6 + 16) = a3;
  *(_BYTE *)(a6 + 20) = BYTE4(a3) & 1;
  *(_QWORD *)(a6 + 24) = a4;
  *(_BYTE *)(a6 + 32) = a5 & 1;
  return result;
}

uint64_t sub_247905F4C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247905F84 + 4 * byte_24792A600[a1]))(0xD000000000000011, 0x8000000247930F20);
}

uint64_t sub_247905F84()
{
  return 0x747265566873656DLL;
}

uint64_t sub_247905FA8()
{
  return 0x6E756F436873656DLL;
}

uint64_t sub_247905FC4()
{
  return 0x6F6D654D6873656DLL;
}

uint64_t sub_247905FE8()
{
  unsigned __int8 *v0;

  return sub_247905F4C(*v0);
}

uint64_t sub_247905FF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790A1FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247906014()
{
  sub_247906238();
  return sub_247929B54();
}

uint64_t sub_24790603C()
{
  sub_247906238();
  return sub_247929B60();
}

uint64_t InspectorStatisticsBase.Geometry.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  char v10;
  _DWORD v12[2];
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C78F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_BYTE *)(v1 + 4);
  v17 = *(unsigned int *)(v1 + 8);
  v16 = *(unsigned __int8 *)(v1 + 12);
  v15 = *(unsigned int *)(v1 + 16);
  v14 = *(unsigned __int8 *)(v1 + 20);
  v13 = *(_QWORD *)(v1 + 24);
  v12[1] = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247906238();
  sub_247929B00();
  v25 = 0;
  v22 = v8;
  v9 = v18;
  sub_247929980();
  if (!v9)
  {
    v10 = v14;
    v24 = 1;
    v20 = v16;
    sub_247929980();
    v23 = 2;
    v19 = v10;
    sub_247929980();
    v21 = 3;
    sub_24792998C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_247906238()
{
  unint64_t result;

  result = qword_2576C9660;
  if (!qword_2576C9660)
  {
    result = MEMORY[0x249584764](&unk_24792B200, &type metadata for InspectorStatisticsBase.Geometry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C9660);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Geometry.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char *v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C78F8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247906238();
  sub_247929AF4();
  if (!v2)
  {
    v23 = 0;
    v10 = sub_2479298CC();
    v22 = 1;
    v11 = sub_2479298CC();
    v21 = 2;
    v19 = sub_2479298CC();
    v20 = 3;
    v13 = sub_2479298D8();
    v14 = v9;
    v16 = v15;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v5);
    *(_DWORD *)a2 = v10;
    *(_BYTE *)(a2 + 4) = BYTE4(v10) & 1;
    *(_DWORD *)(a2 + 8) = v11;
    *(_BYTE *)(a2 + 12) = BYTE4(v11) & 1;
    v17 = BYTE4(v19);
    *(_DWORD *)(a2 + 16) = v19;
    *(_BYTE *)(a2 + 20) = v17 & 1;
    *(_QWORD *)(a2 + 24) = v13;
    *(_BYTE *)(a2 + 32) = v16 & 1;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24790644C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Geometry.init(from:)(a1, a2);
}

uint64_t sub_247906460(_QWORD *a1)
{
  return InspectorStatisticsBase.Geometry.encode(to:)(a1);
}

void InspectorStatisticsBase.geometry.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  int v3;
  char v4;
  int v5;
  char v6;
  uint64_t v7;
  char v8;

  v2 = *(_BYTE *)(v1 + 20);
  v3 = *(_DWORD *)(v1 + 24);
  v4 = *(_BYTE *)(v1 + 28);
  v5 = *(_DWORD *)(v1 + 32);
  v6 = *(_BYTE *)(v1 + 36);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 16);
  *(_BYTE *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
}

unint64_t InspectorStatisticsBase.Lighting.ambientLightCount.getter()
{
  unsigned int *v0;

  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.directionalLightCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8) | ((unint64_t)*(unsigned __int8 *)(v0 + 12) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.pointLightCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.spotLightCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.rectangularLightCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32);
}

uint64_t InspectorStatisticsBase.Lighting.shadowClusterIDs.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t InspectorStatisticsBase.Lighting.shadowCasterCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 48) | ((unint64_t)*(unsigned __int8 *)(v0 + 52) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.shadowReceiverCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 56) | ((unint64_t)*(unsigned __int8 *)(v0 + 60) << 32);
}

unint64_t InspectorStatisticsBase.Lighting.castingGroundshadowCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 64) | ((unint64_t)*(unsigned __int8 *)(v0 + 68) << 32);
}

uint64_t InspectorStatisticsBase.Lighting.init(ambientLightCount:directionalLightCount:pointLightCount:spotLightCount:rectangularLightCount:shadowClusterIDs:shadowCasterCount:shadowReceiverCount:castingGroundshadowCount:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, int a10, char a11)
{
  *(_DWORD *)a9 = result;
  *(_BYTE *)(a9 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a9 + 16) = a3;
  *(_BYTE *)(a9 + 20) = BYTE4(a3) & 1;
  *(_DWORD *)(a9 + 24) = a4;
  *(_BYTE *)(a9 + 28) = BYTE4(a4) & 1;
  *(_DWORD *)(a9 + 32) = a5;
  *(_BYTE *)(a9 + 36) = BYTE4(a5) & 1;
  *(_QWORD *)(a9 + 40) = a6;
  *(_DWORD *)(a9 + 48) = a7;
  *(_BYTE *)(a9 + 52) = BYTE4(a7) & 1;
  *(_DWORD *)(a9 + 56) = a8;
  *(_BYTE *)(a9 + 60) = BYTE4(a8) & 1;
  *(_DWORD *)(a9 + 64) = a10;
  *(_BYTE *)(a9 + 68) = a11 & 1;
  return result;
}

uint64_t sub_24790662C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247906664 + 4 * byte_24792A604[a1]))(0xD000000000000011, 0x8000000247930F40);
}

uint64_t sub_247906664(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_247906710()
{
  unsigned __int8 *v0;

  return sub_24790662C(*v0);
}

uint64_t sub_247906718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790A3C8(a1, a2);
  *a3 = result;
  return result;
}

void sub_24790673C(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_247906748()
{
  sub_247906AE0();
  return sub_247929B54();
}

uint64_t sub_247906770()
{
  sub_247906AE0();
  return sub_247929B60();
}

uint64_t InspectorStatisticsBase.Lighting.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7900);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_BYTE *)(v1 + 4);
  v27 = *(unsigned int *)(v1 + 8);
  v30 = *(unsigned __int8 *)(v1 + 12);
  v26 = *(unsigned int *)(v1 + 16);
  v25 = *(unsigned __int8 *)(v1 + 20);
  v24 = *(unsigned int *)(v1 + 24);
  v23 = *(unsigned __int8 *)(v1 + 28);
  v22 = *(unsigned int *)(v1 + 32);
  v21 = *(unsigned __int8 *)(v1 + 36);
  v9 = *(_QWORD *)(v1 + 40);
  v19 = *(unsigned int *)(v1 + 48);
  v20 = v9;
  v18 = *(unsigned __int8 *)(v1 + 52);
  v17 = *(unsigned int *)(v1 + 56);
  v16 = *(unsigned __int8 *)(v1 + 60);
  v15 = *(unsigned int *)(v1 + 64);
  HIDWORD(v14) = *(unsigned __int8 *)(v1 + 68);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247906AE0();
  sub_247929B00();
  LOBYTE(v29) = 0;
  v31 = v8;
  v10 = v28;
  sub_247929980();
  if (!v10)
  {
    v11 = v25;
    v12 = v23;
    LOBYTE(v29) = 1;
    v31 = v30;
    sub_247929980();
    LOBYTE(v29) = 2;
    v31 = v11;
    sub_247929980();
    LOBYTE(v29) = 3;
    v31 = v12;
    sub_247929980();
    LOBYTE(v29) = 4;
    v31 = v21;
    sub_247929980();
    v29 = v20;
    v31 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7908);
    sub_247906B24();
    sub_247929974();
    LOBYTE(v29) = 6;
    v31 = v18;
    sub_247929980();
    LOBYTE(v29) = 7;
    v31 = v16;
    sub_247929980();
    LOBYTE(v29) = 8;
    v31 = BYTE4(v14);
    sub_247929980();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_247906AE0()
{
  unint64_t result;

  result = qword_2576C9668;
  if (!qword_2576C9668)
  {
    result = MEMORY[0x249584764](&unk_24792B1B0, &type metadata for InspectorStatisticsBase.Lighting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C9668);
  }
  return result;
}

unint64_t sub_247906B24()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2576C7910;
  if (!qword_2576C7910)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7908);
    v2 = sub_247906FB0(&qword_2576C7918, (uint64_t (*)(void))sub_247906BA8, MEMORY[0x24BEE12A0]);
    v3[0] = MEMORY[0x24BEE3F90];
    v3[1] = v2;
    result = MEMORY[0x249584764](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2576C7910);
  }
  return result;
}

unint64_t sub_247906BA8()
{
  unint64_t result;

  result = qword_2576C7928;
  if (!qword_2576C7928)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for EntityID, &type metadata for EntityID);
    atomic_store(result, (unint64_t *)&qword_2576C7928);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Lighting.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7930);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247906AE0();
  sub_247929AF4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v29) = 0;
  v10 = sub_2479298CC();
  LOBYTE(v29) = 1;
  v11 = sub_2479298CC();
  LOBYTE(v29) = 2;
  v27 = sub_2479298CC();
  LOBYTE(v29) = 3;
  v26 = sub_2479298CC();
  LOBYTE(v29) = 4;
  v25 = sub_2479298CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7908);
  v28 = 5;
  sub_247906F2C();
  sub_2479298C0();
  v12 = v29;
  LOBYTE(v29) = 6;
  v24 = v12;
  swift_bridgeObjectRetain();
  v23 = sub_2479298CC();
  LOBYTE(v29) = 7;
  v22 = sub_2479298CC();
  LOBYTE(v29) = 8;
  v14 = sub_2479298CC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(_DWORD *)a2 = v10;
  *(_BYTE *)(a2 + 4) = BYTE4(v10) & 1;
  *(_DWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 12) = BYTE4(v11) & 1;
  v15 = BYTE4(v27);
  *(_DWORD *)(a2 + 16) = v27;
  *(_BYTE *)(a2 + 20) = v15 & 1;
  v16 = BYTE4(v26);
  *(_DWORD *)(a2 + 24) = v26;
  *(_BYTE *)(a2 + 28) = v16 & 1;
  v18 = v24;
  v17 = BYTE4(v25);
  *(_DWORD *)(a2 + 32) = v25;
  *(_BYTE *)(a2 + 36) = v17 & 1;
  *(_QWORD *)(a2 + 40) = v18;
  v19 = BYTE4(v23);
  *(_DWORD *)(a2 + 48) = v23;
  *(_BYTE *)(a2 + 52) = v19 & 1;
  v20 = BYTE4(v22);
  *(_DWORD *)(a2 + 56) = v22;
  *(_BYTE *)(a2 + 60) = v20 & 1;
  *(_DWORD *)(a2 + 64) = v14;
  *(_BYTE *)(a2 + 68) = BYTE4(v14) & 1;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

unint64_t sub_247906F2C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2576C7938;
  if (!qword_2576C7938)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7908);
    v2 = sub_247906FB0(&qword_2576C7940, (uint64_t (*)(void))sub_247907018, MEMORY[0x24BEE12D0]);
    v3[0] = MEMORY[0x24BEE3FB8];
    v3[1] = v2;
    result = MEMORY[0x249584764](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2576C7938);
  }
  return result;
}

uint64_t sub_247906FB0(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7920);
    v8 = a2();
    result = MEMORY[0x249584764](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247907018()
{
  unint64_t result;

  result = qword_2576C7948;
  if (!qword_2576C7948)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for EntityID, &type metadata for EntityID);
    atomic_store(result, (unint64_t *)&qword_2576C7948);
  }
  return result;
}

uint64_t sub_24790705C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Lighting.init(from:)(a1, a2);
}

uint64_t sub_247907070(_QWORD *a1)
{
  return InspectorStatisticsBase.Lighting.encode(to:)(a1);
}

uint64_t InspectorStatisticsBase.lighting.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  int v3;
  char v4;
  int v5;
  char v6;
  int v7;
  char v8;
  int v9;
  char v10;
  uint64_t v11;
  int v12;
  char v13;
  int v14;
  char v15;
  int v16;
  char v17;

  v2 = *(_BYTE *)(v1 + 60);
  v3 = *(_DWORD *)(v1 + 64);
  v4 = *(_BYTE *)(v1 + 68);
  v5 = *(_DWORD *)(v1 + 72);
  v6 = *(_BYTE *)(v1 + 76);
  v7 = *(_DWORD *)(v1 + 80);
  v8 = *(_BYTE *)(v1 + 84);
  v9 = *(_DWORD *)(v1 + 88);
  v10 = *(_BYTE *)(v1 + 92);
  v11 = *(_QWORD *)(v1 + 96);
  v12 = *(_DWORD *)(v1 + 104);
  v13 = *(_BYTE *)(v1 + 108);
  v14 = *(_DWORD *)(v1 + 112);
  v15 = *(_BYTE *)(v1 + 116);
  v16 = *(_DWORD *)(v1 + 120);
  v17 = *(_BYTE *)(v1 + 124);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 56);
  *(_BYTE *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  *(_DWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 28) = v8;
  *(_DWORD *)(a1 + 32) = v9;
  *(_BYTE *)(a1 + 36) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_DWORD *)(a1 + 48) = v12;
  *(_BYTE *)(a1 + 52) = v13;
  *(_DWORD *)(a1 + 56) = v14;
  *(_BYTE *)(a1 + 60) = v15;
  *(_DWORD *)(a1 + 64) = v16;
  *(_BYTE *)(a1 + 68) = v17;
  return swift_bridgeObjectRetain();
}

unint64_t InspectorStatisticsBase.Material.materialAssignmentCount.getter()
{
  unsigned int *v0;

  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

uint64_t InspectorStatisticsBase.Material.materialUseCounts.getter()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_247907138()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  if (!v1)
    goto LABEL_4;
  v2 = *(_QWORD *)(v1 + 16);
  if (v2 >> 31)
  {
    __break(1u);
LABEL_4:
    v2 = 0;
  }
  return v2 | ((unint64_t)(v1 == 0) << 32);
}

uint64_t InspectorStatisticsBase.Material.init(materialAssignmentCount:materialUseCounts:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)a3 = result;
  *(_BYTE *)(a3 + 4) = BYTE4(result) & 1;
  *(_QWORD *)(a3 + 8) = a2;
  return result;
}

BOOL sub_247907188(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_2479071A0()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000011;
  else
    return 0xD000000000000017;
}

uint64_t sub_2479071E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790A740(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247907204()
{
  sub_2479073C8();
  return sub_247929B54();
}

uint64_t sub_24790722C()
{
  sub_2479073C8();
  return sub_247929B60();
}

uint64_t InspectorStatisticsBase.Material.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7950);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_BYTE *)(v1 + 4);
  v12 = *(_QWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479073C8();
  sub_247929B00();
  v17 = 0;
  v15 = v8;
  v9 = v13;
  sub_247929980();
  if (!v9)
  {
    v14 = v12;
    v16 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7958);
    sub_2479075A8(&qword_2576C7960, MEMORY[0x24BEE4570], MEMORY[0x24BEE3F90], MEMORY[0x24BEE04C0]);
    sub_247929974();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_2479073C8()
{
  unint64_t result;

  result = qword_2576C9670;
  if (!qword_2576C9670)
  {
    result = MEMORY[0x249584764](&unk_24792B160, &type metadata for InspectorStatisticsBase.Material.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C9670);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Material.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  char v14;
  char v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7968);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479073C8();
  sub_247929AF4();
  if (!v2)
  {
    v15 = 0;
    v10 = sub_2479298CC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7958);
    v14 = 1;
    sub_2479075A8(&qword_2576C7970, MEMORY[0x24BEE4598], MEMORY[0x24BEE3FB8], MEMORY[0x24BEE04E0]);
    sub_2479298C0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v11 = v13[1];
    *(_DWORD *)a2 = v10;
    *(_BYTE *)(a2 + 4) = BYTE4(v10) & 1;
    *(_QWORD *)(a2 + 8) = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2479075A8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7958);
    v10[0] = a2;
    v10[1] = a3;
    result = MEMORY[0x249584764](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24790760C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Material.init(from:)(a1, a2);
}

uint64_t sub_247907620(_QWORD *a1)
{
  return InspectorStatisticsBase.Material.encode(to:)(a1);
}

uint64_t InspectorStatisticsBase.material.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;

  v2 = *(_BYTE *)(v1 + 132);
  v3 = *(_QWORD *)(v1 + 136);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 128);
  *(_BYTE *)(a1 + 4) = v2;
  *(_QWORD *)(a1 + 8) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t InspectorStatisticsBase.Texture.TextureData.assetID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorStatisticsBase.Texture.TextureData.memorySize.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t InspectorStatisticsBase.Texture.TextureData.width.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 24);
}

uint64_t InspectorStatisticsBase.Texture.TextureData.height.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 28);
}

uint64_t InspectorStatisticsBase.Texture.TextureData.init(assetID:memorySize:width:height:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_DWORD *)(a6 + 24) = a4;
  *(_DWORD *)(a6 + 28) = a5;
  return result;
}

uint64_t sub_2479076A4(char a1)
{
  return *(_QWORD *)&aAssetid_0[8 * a1];
}

uint64_t sub_2479076C4()
{
  char *v0;

  return sub_2479076A4(*v0);
}

uint64_t sub_2479076CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790A828(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2479076F0()
{
  sub_2479078D0();
  return sub_247929B54();
}

uint64_t sub_247907718()
{
  sub_2479078D0();
  return sub_247929B60();
}

uint64_t InspectorStatisticsBase.Texture.TextureData.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _DWORD v10[4];
  uint64_t v11;
  uint64_t v12;
  int v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7978);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v1 + 16);
  v13 = *(_DWORD *)(v1 + 24);
  v10[3] = *(_DWORD *)(v1 + 28);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479078D0();
  sub_247929B00();
  v17 = 0;
  v8 = v12;
  sub_247929998();
  if (!v8)
  {
    v16 = 1;
    sub_2479299EC();
    v15 = 2;
    sub_2479299D4();
    v14 = 3;
    sub_2479299D4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_2479078D0()
{
  unint64_t result;

  result = qword_2576C9678;
  if (!qword_2576C9678)
  {
    result = MEMORY[0x249584764](&unk_24792B110, &type metadata for InspectorStatisticsBase.Texture.TextureData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C9678);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Texture.TextureData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;
  char v19;
  char v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7980);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479078D0();
  sub_247929AF4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v21 = 0;
  v10 = sub_2479298E4();
  v12 = v11;
  v20 = 1;
  swift_bridgeObjectRetain();
  v16 = sub_247929938();
  v19 = 2;
  v17 = sub_247929920();
  v18 = 3;
  v14 = sub_247929920();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(_QWORD *)a2 = v10;
  *(_QWORD *)(a2 + 8) = v12;
  *(_QWORD *)(a2 + 16) = v16;
  *(_DWORD *)(a2 + 24) = v17;
  *(_DWORD *)(a2 + 28) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247907AF8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Texture.TextureData.init(from:)(a1, a2);
}

uint64_t sub_247907B0C(_QWORD *a1)
{
  return InspectorStatisticsBase.Texture.TextureData.encode(to:)(a1);
}

unint64_t InspectorStatisticsBase.Texture.count.getter()
{
  unsigned int *v0;

  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

uint64_t InspectorStatisticsBase.Texture.memory.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t InspectorStatisticsBase.Texture.textures.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InspectorStatisticsBase.Texture.entityTextures.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InspectorStatisticsBase.Texture.init(count:memory:textures:entityTextures:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(_BYTE *)(a6 + 4) = BYTE4(result) & 1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3 & 1;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_247907B7C(char a1)
{
  return *(_QWORD *)&aCount_0[8 * a1];
}

uint64_t sub_247907B9C()
{
  char *v0;

  return sub_247907B7C(*v0);
}

uint64_t sub_247907BA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790A9C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247907BC8()
{
  sub_247907E14();
  return sub_247929B54();
}

uint64_t sub_247907BF0()
{
  sub_247907E14();
  return sub_247929B60();
}

uint64_t InspectorStatisticsBase.Texture.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7988);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_BYTE *)(v1 + 4);
  v9 = *(_QWORD *)(v1 + 8);
  v20 = *(unsigned __int8 *)(v1 + 16);
  v16 = *(_QWORD *)(v1 + 24);
  v17 = v9;
  v15 = *(_QWORD *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247907E14();
  sub_247929B00();
  LOBYTE(v19) = 0;
  v21 = v8;
  v10 = v18;
  sub_247929980();
  if (!v10)
  {
    v11 = v15;
    v12 = v16;
    LOBYTE(v19) = 1;
    sub_24792998C();
    v19 = v12;
    v21 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7990);
    sub_247907E58(&qword_2576C7998, (uint64_t (*)(void))sub_247907ECC, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
    sub_247929974();
    v19 = v11;
    v21 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C79A8);
    sub_247907F10();
    sub_247929974();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_247907E14()
{
  unint64_t result;

  result = qword_2576C9680;
  if (!qword_2576C9680)
  {
    result = MEMORY[0x249584764](&unk_24792B0C0, &type metadata for InspectorStatisticsBase.Texture.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C9680);
  }
  return result;
}

uint64_t sub_247907E58(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7990);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x249584764](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247907ECC()
{
  unint64_t result;

  result = qword_2576C79A0;
  if (!qword_2576C79A0)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Texture.TextureData, &type metadata for InspectorStatisticsBase.Texture.TextureData);
    atomic_store(result, (unint64_t *)&qword_2576C79A0);
  }
  return result;
}

unint64_t sub_247907F10()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576C79B0;
  if (!qword_2576C79B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C79A8);
    v2[0] = sub_247906BA8();
    v2[1] = sub_2479082D4(&qword_2576C79B8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    result = MEMORY[0x249584764](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576C79B0);
  }
  return result;
}

uint64_t InspectorStatisticsBase.Texture.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  uint64_t v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C79C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247907E14();
  sub_247929AF4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v22) = 0;
  v10 = sub_2479298CC();
  LOBYTE(v22) = 1;
  v11 = sub_2479298D8();
  v20 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7990);
  v21 = 2;
  sub_247907E58(&qword_2576C79D0, (uint64_t (*)(void))sub_24790820C, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
  sub_2479298C0();
  v18 = v11;
  v13 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C79A8);
  v21 = 3;
  sub_247908250();
  v19 = v13;
  swift_bridgeObjectRetain();
  sub_2479298C0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v14 = v22;
  *(_DWORD *)a2 = v10;
  *(_BYTE *)(a2 + 4) = BYTE4(v10) & 1;
  v15 = v19;
  *(_QWORD *)(a2 + 8) = v18;
  *(_BYTE *)(a2 + 16) = v20 & 1;
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)(a2 + 32) = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_24790820C()
{
  unint64_t result;

  result = qword_2576C79D8;
  if (!qword_2576C79D8)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Texture.TextureData, &type metadata for InspectorStatisticsBase.Texture.TextureData);
    atomic_store(result, (unint64_t *)&qword_2576C79D8);
  }
  return result;
}

unint64_t sub_247908250()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576C79E0;
  if (!qword_2576C79E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C79A8);
    v2[0] = sub_247907018();
    v2[1] = sub_2479082D4(&qword_2576C79E8, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    result = MEMORY[0x249584764](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576C79E0);
  }
  return result;
}

uint64_t sub_2479082D4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C79C0);
    v8 = a2;
    result = MEMORY[0x249584764](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247908334@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return InspectorStatisticsBase.Texture.init(from:)(a1, a2);
}

uint64_t sub_247908348(_QWORD *a1)
{
  return InspectorStatisticsBase.Texture.encode(to:)(a1);
}

uint64_t InspectorStatisticsBase.texture.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_BYTE *)(v1 + 148);
  v3 = *(_QWORD *)(v1 + 152);
  v4 = *(_BYTE *)(v1 + 160);
  v6 = *(_QWORD *)(v1 + 168);
  v5 = *(_QWORD *)(v1 + 176);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 144);
  *(_BYTE *)(a1 + 4) = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 InspectorStatisticsBase.__allocating_init(geometry:lighting:material:texture:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  __n128 result;

  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 16) = *(_DWORD *)a1;
  *(_BYTE *)(v8 + 20) = *(_BYTE *)(a1 + 4);
  *(_DWORD *)(v8 + 24) = *(_DWORD *)(a1 + 8);
  *(_BYTE *)(v8 + 28) = *(_BYTE *)(a1 + 12);
  *(_DWORD *)(v8 + 32) = *(_DWORD *)(a1 + 16);
  *(_BYTE *)(v8 + 36) = *(_BYTE *)(a1 + 20);
  *(_QWORD *)(v8 + 40) = *(_QWORD *)(a1 + 24);
  *(_BYTE *)(v8 + 48) = *(_BYTE *)(a1 + 32);
  *(_DWORD *)(v8 + 56) = *(_DWORD *)a2;
  *(_BYTE *)(v8 + 60) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(v8 + 64) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(v8 + 68) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(v8 + 72) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(v8 + 76) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(v8 + 80) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(v8 + 84) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(v8 + 88) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(v8 + 92) = *(_BYTE *)(a2 + 36);
  *(_QWORD *)(v8 + 96) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(v8 + 104) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(v8 + 108) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(v8 + 112) = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(v8 + 116) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(v8 + 120) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(v8 + 124) = *(_BYTE *)(a2 + 68);
  *(_DWORD *)(v8 + 128) = *(_DWORD *)a3;
  *(_BYTE *)(v8 + 132) = *(_BYTE *)(a3 + 4);
  *(_QWORD *)(v8 + 136) = *(_QWORD *)(a3 + 8);
  *(_DWORD *)(v8 + 144) = *(_DWORD *)a4;
  *(_BYTE *)(v8 + 148) = *(_BYTE *)(a4 + 4);
  *(_QWORD *)(v8 + 152) = *(_QWORD *)(a4 + 8);
  *(_BYTE *)(v8 + 160) = *(_BYTE *)(a4 + 16);
  result = *(__n128 *)(a4 + 24);
  *(__n128 *)(v8 + 168) = result;
  return result;
}

uint64_t InspectorStatisticsBase.init(geometry:lighting:material:texture:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_DWORD *)(v4 + 16) = *(_DWORD *)a1;
  *(_BYTE *)(v4 + 20) = *(_BYTE *)(a1 + 4);
  *(_DWORD *)(v4 + 24) = *(_DWORD *)(a1 + 8);
  *(_BYTE *)(v4 + 28) = *(_BYTE *)(a1 + 12);
  *(_DWORD *)(v4 + 32) = *(_DWORD *)(a1 + 16);
  *(_BYTE *)(v4 + 36) = *(_BYTE *)(a1 + 20);
  *(_QWORD *)(v4 + 40) = *(_QWORD *)(a1 + 24);
  *(_BYTE *)(v4 + 48) = *(_BYTE *)(a1 + 32);
  *(_DWORD *)(v4 + 56) = *(_DWORD *)a2;
  *(_BYTE *)(v4 + 60) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(v4 + 64) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(v4 + 68) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(v4 + 72) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(v4 + 76) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(v4 + 80) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(v4 + 84) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(v4 + 88) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(v4 + 92) = *(_BYTE *)(a2 + 36);
  *(_QWORD *)(v4 + 96) = *(_QWORD *)(a2 + 40);
  *(_DWORD *)(v4 + 104) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(v4 + 108) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(v4 + 112) = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(v4 + 116) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(v4 + 120) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(v4 + 124) = *(_BYTE *)(a2 + 68);
  *(_DWORD *)(v4 + 128) = *(_DWORD *)a3;
  *(_BYTE *)(v4 + 132) = *(_BYTE *)(a3 + 4);
  *(_QWORD *)(v4 + 136) = *(_QWORD *)(a3 + 8);
  *(_DWORD *)(v4 + 144) = *(_DWORD *)a4;
  *(_BYTE *)(v4 + 148) = *(_BYTE *)(a4 + 4);
  *(_QWORD *)(v4 + 152) = *(_QWORD *)(a4 + 8);
  *(_BYTE *)(v4 + 160) = *(_BYTE *)(a4 + 16);
  *(_OWORD *)(v4 + 168) = *(_OWORD *)(a4 + 24);
  return v4;
}

uint64_t sub_247908600(char a1)
{
  return *(_QWORD *)&aGeometrylighti[8 * a1];
}

uint64_t sub_247908620()
{
  char *v0;

  return sub_247908600(*v0);
}

uint64_t sub_247908628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790AB68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24790864C()
{
  sub_2479089C8();
  return sub_247929B54();
}

uint64_t sub_247908674()
{
  sub_2479089C8();
  return sub_247929B60();
}

uint64_t InspectorStatisticsBase.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorStatisticsBase.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24790871C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  int v11;
  char v12;
  int v13;
  char v14;
  uint64_t v15;
  char v16;
  char v17;
  int v18;
  char v19;
  int v20;
  char v21;
  int v22;
  char v23;
  int v24;
  char v25;
  uint64_t v26;
  int v27;
  char v28;
  int v29;
  char v30;
  int v31;
  char v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v39;
  int v40;
  char v41;
  uint64_t v42;
  int v43;
  char v44;
  __int128 v45;
  uint64_t v46;
  int v47;
  char v48;
  int v49;
  char v50;
  int v51;
  char v52;
  char v53;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C79F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479089C8();
  sub_247929B00();
  v10 = *(_BYTE *)(v3 + 20);
  v11 = *(_DWORD *)(v3 + 24);
  v12 = *(_BYTE *)(v3 + 28);
  v13 = *(_DWORD *)(v3 + 32);
  v14 = *(_BYTE *)(v3 + 36);
  v15 = *(_QWORD *)(v3 + 40);
  v16 = *(_BYTE *)(v3 + 48);
  v40 = *(_DWORD *)(v3 + 16);
  v41 = v10;
  LODWORD(v42) = v11;
  BYTE4(v42) = v12;
  v43 = v13;
  v44 = v14;
  *(_QWORD *)&v45 = v15;
  BYTE8(v45) = v16;
  v53 = 0;
  sub_247908A0C();
  sub_2479299C8();
  if (!v2)
  {
    v17 = *(_BYTE *)(v3 + 60);
    v18 = *(_DWORD *)(v3 + 64);
    v19 = *(_BYTE *)(v3 + 68);
    v20 = *(_DWORD *)(v3 + 72);
    v21 = *(_BYTE *)(v3 + 76);
    v22 = *(_DWORD *)(v3 + 80);
    v23 = *(_BYTE *)(v3 + 84);
    v24 = *(_DWORD *)(v3 + 88);
    v25 = *(_BYTE *)(v3 + 92);
    v26 = *(_QWORD *)(v3 + 96);
    v27 = *(_DWORD *)(v3 + 104);
    v28 = *(_BYTE *)(v3 + 108);
    v29 = *(_DWORD *)(v3 + 112);
    v30 = *(_BYTE *)(v3 + 116);
    v31 = *(_DWORD *)(v3 + 120);
    v32 = *(_BYTE *)(v3 + 124);
    v40 = *(_DWORD *)(v3 + 56);
    v41 = v17;
    LODWORD(v42) = v18;
    BYTE4(v42) = v19;
    v43 = v20;
    v44 = v21;
    LODWORD(v45) = v22;
    BYTE4(v45) = v23;
    DWORD2(v45) = v24;
    BYTE12(v45) = v25;
    v46 = v26;
    v47 = v27;
    v48 = v28;
    v49 = v29;
    v50 = v30;
    v51 = v31;
    v52 = v32;
    v53 = 1;
    sub_247908A50();
    sub_2479299C8();
    v33 = *(_BYTE *)(v3 + 132);
    v34 = *(_QWORD *)(v3 + 136);
    v40 = *(_DWORD *)(v3 + 128);
    v41 = v33;
    v42 = v34;
    v53 = 2;
    sub_247908A94();
    sub_2479299C8();
    v35 = *(_BYTE *)(v3 + 148);
    v36 = *(_QWORD *)(v3 + 152);
    v37 = *(_BYTE *)(v3 + 160);
    v40 = *(_DWORD *)(v3 + 144);
    v41 = v35;
    v42 = v36;
    LOBYTE(v43) = v37;
    v45 = *(_OWORD *)(v3 + 168);
    v53 = 3;
    sub_247908AD8();
    sub_2479299C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_2479089C8()
{
  unint64_t result;

  result = qword_2576C9688[0];
  if (!qword_2576C9688[0])
  {
    result = MEMORY[0x249584764](&unk_24792B070, &type metadata for InspectorStatisticsBase.CodingKeys);
    atomic_store(result, qword_2576C9688);
  }
  return result;
}

unint64_t sub_247908A0C()
{
  unint64_t result;

  result = qword_2576C79F8;
  if (!qword_2576C79F8)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Geometry, &type metadata for InspectorStatisticsBase.Geometry);
    atomic_store(result, (unint64_t *)&qword_2576C79F8);
  }
  return result;
}

unint64_t sub_247908A50()
{
  unint64_t result;

  result = qword_2576C7A00;
  if (!qword_2576C7A00)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Lighting, &type metadata for InspectorStatisticsBase.Lighting);
    atomic_store(result, (unint64_t *)&qword_2576C7A00);
  }
  return result;
}

unint64_t sub_247908A94()
{
  unint64_t result;

  result = qword_2576C7A08;
  if (!qword_2576C7A08)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Material, &type metadata for InspectorStatisticsBase.Material);
    atomic_store(result, (unint64_t *)&qword_2576C7A08);
  }
  return result;
}

unint64_t sub_247908AD8()
{
  unint64_t result;

  result = qword_2576C7A10;
  if (!qword_2576C7A10)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Texture, &type metadata for InspectorStatisticsBase.Texture);
    atomic_store(result, (unint64_t *)&qword_2576C7A10);
  }
  return result;
}

uint64_t InspectorStatisticsBase.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  InspectorStatisticsBase.init(from:)(a1);
  return v2;
}

uint64_t InspectorStatisticsBase.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  int v10;
  char v11;
  int v12;
  char v13;
  uint64_t v14;
  char v15;
  char v17;
  int v18;
  char v19;
  int v20;
  char v21;
  int v22;
  char v23;
  int v24;
  char v25;
  uint64_t v26;
  int v27;
  char v28;
  int v29;
  char v30;
  int v31;
  char v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  int v39;
  char v40;
  uint64_t v41;
  int v42;
  char v43;
  __int128 v44;
  uint64_t v45;
  int v46;
  char v47;
  int v48;
  char v49;
  int v50;
  char v51;
  char v52;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7A18);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479089C8();
  sub_247929AF4();
  if (v2)
  {
    type metadata accessor for InspectorStatisticsBase();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v52 = 0;
    sub_247908ED0();
    sub_247929914();
    v9 = v40;
    v10 = v41;
    v11 = BYTE4(v41);
    v12 = v42;
    v13 = v43;
    v14 = v44;
    v15 = BYTE8(v44);
    *(_DWORD *)(v1 + 16) = v39;
    *(_BYTE *)(v1 + 20) = v9;
    *(_DWORD *)(v1 + 24) = v10;
    *(_BYTE *)(v1 + 28) = v11;
    *(_DWORD *)(v1 + 32) = v12;
    *(_BYTE *)(v1 + 36) = v13;
    *(_QWORD *)(v1 + 40) = v14;
    *(_BYTE *)(v1 + 48) = v15;
    v52 = 1;
    sub_247908F14();
    sub_247929914();
    v17 = v40;
    v18 = v41;
    v19 = BYTE4(v41);
    v20 = v42;
    v21 = v43;
    v22 = v44;
    v23 = BYTE4(v44);
    v24 = DWORD2(v44);
    v25 = BYTE12(v44);
    v26 = v45;
    v27 = v46;
    v28 = v47;
    v29 = v48;
    v30 = v49;
    v31 = v50;
    v32 = v51;
    *(_DWORD *)(v1 + 56) = v39;
    *(_BYTE *)(v1 + 60) = v17;
    *(_DWORD *)(v1 + 64) = v18;
    *(_BYTE *)(v1 + 68) = v19;
    *(_DWORD *)(v1 + 72) = v20;
    *(_BYTE *)(v1 + 76) = v21;
    *(_DWORD *)(v1 + 80) = v22;
    *(_BYTE *)(v1 + 84) = v23;
    *(_DWORD *)(v1 + 88) = v24;
    *(_BYTE *)(v1 + 92) = v25;
    *(_QWORD *)(v1 + 96) = v26;
    *(_DWORD *)(v1 + 104) = v27;
    *(_BYTE *)(v1 + 108) = v28;
    *(_DWORD *)(v1 + 112) = v29;
    *(_BYTE *)(v1 + 116) = v30;
    *(_DWORD *)(v1 + 120) = v31;
    *(_BYTE *)(v1 + 124) = v32;
    v52 = 2;
    sub_247908F58();
    sub_247929914();
    v33 = v40;
    v34 = v41;
    *(_DWORD *)(v1 + 128) = v39;
    *(_BYTE *)(v1 + 132) = v33;
    *(_QWORD *)(v1 + 136) = v34;
    v52 = 3;
    sub_247908F9C();
    sub_247929914();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v35 = v40;
    v36 = v41;
    v37 = v42;
    *(_DWORD *)(v1 + 144) = v39;
    *(_BYTE *)(v1 + 148) = v35;
    *(_QWORD *)(v1 + 152) = v36;
    *(_BYTE *)(v1 + 160) = v37;
    *(_OWORD *)(v1 + 168) = v44;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t type metadata accessor for InspectorStatisticsBase()
{
  return objc_opt_self();
}

unint64_t sub_247908ED0()
{
  unint64_t result;

  result = qword_2576C7A20;
  if (!qword_2576C7A20)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Geometry, &type metadata for InspectorStatisticsBase.Geometry);
    atomic_store(result, (unint64_t *)&qword_2576C7A20);
  }
  return result;
}

unint64_t sub_247908F14()
{
  unint64_t result;

  result = qword_2576C7A28;
  if (!qword_2576C7A28)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Lighting, &type metadata for InspectorStatisticsBase.Lighting);
    atomic_store(result, (unint64_t *)&qword_2576C7A28);
  }
  return result;
}

unint64_t sub_247908F58()
{
  unint64_t result;

  result = qword_2576C7A30;
  if (!qword_2576C7A30)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Material, &type metadata for InspectorStatisticsBase.Material);
    atomic_store(result, (unint64_t *)&qword_2576C7A30);
  }
  return result;
}

unint64_t sub_247908F9C()
{
  unint64_t result;

  result = qword_2576C7A38;
  if (!qword_2576C7A38)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorStatisticsBase.Texture, &type metadata for InspectorStatisticsBase.Texture);
    atomic_store(result, (unint64_t *)&qword_2576C7A38);
  }
  return result;
}

uint64_t sub_247908FE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_24790900C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

void InspectorEntityStatistics.entityID.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 184);
}

uint64_t InspectorEntityStatistics.descendantCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 192);
}

uint64_t sub_24790904C()
{
  return 2;
}

uint64_t sub_247909058(char a1)
{
  if ((a1 & 1) != 0)
    return 0x61646E6563736564;
  else
    return 0x4449797469746E65;
}

uint64_t sub_24790909C()
{
  char *v0;

  return sub_247909058(*v0);
}

uint64_t sub_2479090A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790AD08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2479090C8()
{
  sub_24790AE08();
  return sub_247929B54();
}

uint64_t sub_2479090F0()
{
  sub_24790AE08();
  return sub_247929B60();
}

__n128 InspectorEntityStatistics.__allocating_init(entityID:descendantCount:geometry:lighting:material:texture:)(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  __n128 result;

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 184) = *a1;
  *(_DWORD *)(v12 + 192) = a2;
  *(_DWORD *)(v12 + 16) = *(_DWORD *)a3;
  *(_BYTE *)(v12 + 20) = *(_BYTE *)(a3 + 4);
  *(_DWORD *)(v12 + 24) = *(_DWORD *)(a3 + 8);
  *(_BYTE *)(v12 + 28) = *(_BYTE *)(a3 + 12);
  *(_DWORD *)(v12 + 32) = *(_DWORD *)(a3 + 16);
  *(_BYTE *)(v12 + 36) = *(_BYTE *)(a3 + 20);
  *(_QWORD *)(v12 + 40) = *(_QWORD *)(a3 + 24);
  *(_BYTE *)(v12 + 48) = *(_BYTE *)(a3 + 32);
  *(_DWORD *)(v12 + 56) = *(_DWORD *)a4;
  *(_BYTE *)(v12 + 60) = *(_BYTE *)(a4 + 4);
  *(_DWORD *)(v12 + 64) = *(_DWORD *)(a4 + 8);
  *(_BYTE *)(v12 + 68) = *(_BYTE *)(a4 + 12);
  *(_DWORD *)(v12 + 72) = *(_DWORD *)(a4 + 16);
  *(_BYTE *)(v12 + 76) = *(_BYTE *)(a4 + 20);
  *(_DWORD *)(v12 + 80) = *(_DWORD *)(a4 + 24);
  *(_BYTE *)(v12 + 84) = *(_BYTE *)(a4 + 28);
  *(_DWORD *)(v12 + 88) = *(_DWORD *)(a4 + 32);
  *(_BYTE *)(v12 + 92) = *(_BYTE *)(a4 + 36);
  *(_QWORD *)(v12 + 96) = *(_QWORD *)(a4 + 40);
  *(_DWORD *)(v12 + 104) = *(_DWORD *)(a4 + 48);
  *(_BYTE *)(v12 + 108) = *(_BYTE *)(a4 + 52);
  *(_DWORD *)(v12 + 112) = *(_DWORD *)(a4 + 56);
  *(_BYTE *)(v12 + 116) = *(_BYTE *)(a4 + 60);
  *(_DWORD *)(v12 + 120) = *(_DWORD *)(a4 + 64);
  *(_BYTE *)(v12 + 124) = *(_BYTE *)(a4 + 68);
  *(_DWORD *)(v12 + 128) = *(_DWORD *)a5;
  *(_BYTE *)(v12 + 132) = *(_BYTE *)(a5 + 4);
  *(_QWORD *)(v12 + 136) = *(_QWORD *)(a5 + 8);
  *(_DWORD *)(v12 + 144) = *(_DWORD *)a6;
  *(_BYTE *)(v12 + 148) = *(_BYTE *)(a6 + 4);
  *(_QWORD *)(v12 + 152) = *(_QWORD *)(a6 + 8);
  *(_BYTE *)(v12 + 160) = *(_BYTE *)(a6 + 16);
  result = *(__n128 *)(a6 + 24);
  *(__n128 *)(v12 + 168) = result;
  return result;
}

uint64_t InspectorEntityStatistics.init(entityID:descendantCount:geometry:lighting:material:texture:)(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 184) = *a1;
  *(_DWORD *)(v6 + 192) = a2;
  *(_DWORD *)(v6 + 16) = *(_DWORD *)a3;
  *(_BYTE *)(v6 + 20) = *(_BYTE *)(a3 + 4);
  *(_DWORD *)(v6 + 24) = *(_DWORD *)(a3 + 8);
  *(_BYTE *)(v6 + 28) = *(_BYTE *)(a3 + 12);
  *(_DWORD *)(v6 + 32) = *(_DWORD *)(a3 + 16);
  *(_BYTE *)(v6 + 36) = *(_BYTE *)(a3 + 20);
  *(_QWORD *)(v6 + 40) = *(_QWORD *)(a3 + 24);
  *(_BYTE *)(v6 + 48) = *(_BYTE *)(a3 + 32);
  *(_DWORD *)(v6 + 56) = *(_DWORD *)a4;
  *(_BYTE *)(v6 + 60) = *(_BYTE *)(a4 + 4);
  *(_DWORD *)(v6 + 64) = *(_DWORD *)(a4 + 8);
  *(_BYTE *)(v6 + 68) = *(_BYTE *)(a4 + 12);
  *(_DWORD *)(v6 + 72) = *(_DWORD *)(a4 + 16);
  *(_BYTE *)(v6 + 76) = *(_BYTE *)(a4 + 20);
  *(_DWORD *)(v6 + 80) = *(_DWORD *)(a4 + 24);
  *(_BYTE *)(v6 + 84) = *(_BYTE *)(a4 + 28);
  *(_DWORD *)(v6 + 88) = *(_DWORD *)(a4 + 32);
  *(_BYTE *)(v6 + 92) = *(_BYTE *)(a4 + 36);
  *(_QWORD *)(v6 + 96) = *(_QWORD *)(a4 + 40);
  *(_DWORD *)(v6 + 104) = *(_DWORD *)(a4 + 48);
  *(_BYTE *)(v6 + 108) = *(_BYTE *)(a4 + 52);
  *(_DWORD *)(v6 + 112) = *(_DWORD *)(a4 + 56);
  *(_BYTE *)(v6 + 116) = *(_BYTE *)(a4 + 60);
  *(_DWORD *)(v6 + 120) = *(_DWORD *)(a4 + 64);
  *(_BYTE *)(v6 + 124) = *(_BYTE *)(a4 + 68);
  *(_DWORD *)(v6 + 128) = *(_DWORD *)a5;
  *(_BYTE *)(v6 + 132) = *(_BYTE *)(a5 + 4);
  *(_QWORD *)(v6 + 136) = *(_QWORD *)(a5 + 8);
  *(_DWORD *)(v6 + 144) = *(_DWORD *)a6;
  *(_BYTE *)(v6 + 148) = *(_BYTE *)(a6 + 4);
  *(_QWORD *)(v6 + 152) = *(_QWORD *)(a6 + 8);
  *(_BYTE *)(v6 + 160) = *(_BYTE *)(a6 + 16);
  *(_OWORD *)(v6 + 168) = *(_OWORD *)(a6 + 24);
  return v6;
}

uint64_t InspectorEntityStatistics.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  InspectorEntityStatistics.init(from:)(a1);
  return v2;
}

uint64_t InspectorEntityStatistics.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v11[5];
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7A40);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v11[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24790AE08();
  swift_retain();
  sub_247929AF4();
  if (v2)
  {
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for InspectorEntityStatistics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v12 = 0;
    sub_247907018();
    sub_247929914();
    *(_QWORD *)(v1 + 184) = v11[0];
    LOBYTE(v11[0]) = 1;
    *(_DWORD *)(v1 + 192) = sub_247929920();
    swift_release();
    sub_247903BBC((uint64_t)a1, (uint64_t)v11);
    InspectorStatisticsBase.init(from:)(v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v1;
}

uint64_t sub_2479095B8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7A50);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24790AE08();
  sub_247929B00();
  v11 = *(_QWORD *)(v1 + 184);
  v10[15] = 0;
  sub_247906BA8();
  sub_2479299C8();
  if (!v2)
  {
    v10[14] = 1;
    sub_2479299D4();
    sub_24790871C(a1);
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v8, v4);
}

void InspectorEntityStatistics.__allocating_init(geometry:lighting:material:texture:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void InspectorEntityStatistics.init(geometry:lighting:material:texture:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t InspectorEntityStatistics.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorEntityStatistics.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t InspectorSceneStatistics.entityCount.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16);
}

uint64_t InspectorSceneStatistics.entityStatistics.getter()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_2479097EC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2479097FC()
{
  return sub_247929AB8();
}

uint64_t sub_247909824()
{
  sub_247929AAC();
  sub_247929AB8();
  return sub_247929AE8();
}

uint64_t sub_247909868(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000010;
  else
    return 0x6F43797469746E65;
}

uint64_t sub_2479098AC()
{
  char *v0;

  return sub_247909868(*v0);
}

uint64_t sub_2479098B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24790AE6C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2479098D8()
{
  sub_24790AF80();
  return sub_247929B54();
}

uint64_t sub_247909900()
{
  sub_24790AF80();
  return sub_247929B60();
}

uint64_t InspectorSceneStatistics.__allocating_init(entityCount:entityStatistics:)(int a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_DWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t InspectorSceneStatistics.init(entityCount:entityStatistics:)(int a1, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t static InspectorSceneStatistics.from(json:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  v0 = sub_247929368();
  MEMORY[0x24BDAC7A8](v0, v1);
  sub_2479292A8();
  swift_allocObject();
  sub_24792929C();
  sub_24790B0CC(&qword_2576C7A58, type metadata accessor for InspectorSceneStatistics, (uint64_t)&protocol conformance descriptor for InspectorSceneStatistics);
  sub_247929290();
  swift_release();
  return v3;
}

uint64_t sub_247909BF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_247929368();
  MEMORY[0x24BDAC7A8](v0, v1);
  sub_2479292CC();
  swift_allocObject();
  sub_2479292C0();
  type metadata accessor for InspectorSceneStatistics();
  sub_24790B0CC(&qword_2576C7A68, type metadata accessor for InspectorSceneStatistics, (uint64_t)&protocol conformance descriptor for InspectorSceneStatistics);
  v2 = sub_2479292B4();
  swift_release();
  return v2;
}

uint64_t InspectorSceneStatistics.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  InspectorSceneStatistics.init(from:)(a1);
  return v2;
}

uint64_t InspectorSceneStatistics.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7A70);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24790AF80();
  sub_247929AF4();
  if (v2)
  {
    type metadata accessor for InspectorSceneStatistics();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v12 = 0;
    *(_DWORD *)(v1 + 16) = sub_247929920();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7A80);
    v11 = 1;
    sub_24790AFC4();
    sub_247929914();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    *(_QWORD *)(v1 + 24) = v10[1];
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_24790A058(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7A98);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24790AF80();
  sub_247929B00();
  v13 = 0;
  sub_2479299D4();
  if (!v2)
  {
    v12 = *(_QWORD *)(v3 + 24);
    v11[15] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7A80);
    sub_24790B048();
    sub_2479299C8();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t InspectorSceneStatistics.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorSceneStatistics.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24790A1D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_24790A1FC(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000247930F20 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x747265566873656DLL && a2 == 0xEF746E756F437865 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E756F436873656DLL && a2 == 0xE900000000000074 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6F6D654D6873656DLL && a2 == 0xEA00000000007972)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_24790A3C8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x8000000247930F40 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000247930F60 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x67694C746E696F70 && a2 == 0xEF746E756F437468 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6867694C746F7073 && a2 == 0xEE00746E756F4374 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000247930F80 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000247930FA0 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000247930FC0 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000247930FE0 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000247931000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v5 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_24790A740(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000017 && a2 == 0x8000000247931020 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000247931040)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24790A828(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x44497465737361 && a2 == 0xE700000000000000;
  if (v3 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x695379726F6D656DLL && a2 == 0xEA0000000000657ALL || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6874646977 && a2 == 0xE500000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746867696568 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_24790A9C0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x746E756F63 && a2 == 0xE500000000000000;
  if (v3 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x79726F6D656DLL && a2 == 0xE600000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7365727574786574 && a2 == 0xE800000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6554797469746E65 && a2 == 0xEE00736572757478)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_24790AB68(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x797274656D6F6567 && a2 == 0xE800000000000000;
  if (v3 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E69746867696CLL && a2 == 0xE800000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6169726574616DLL && a2 == 0xE800000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x65727574786574 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_24790AD08(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4449797469746E65 && a2 == 0xE800000000000000;
  if (v3 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x61646E6563736564 && a2 == 0xEF746E756F43746ELL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_24790AE08()
{
  unint64_t result;

  result = qword_2576C7A48;
  if (!qword_2576C7A48)
  {
    result = MEMORY[0x249584764](&unk_24792A874, &type metadata for InspectorEntityStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C7A48);
  }
  return result;
}

uint64_t type metadata accessor for InspectorEntityStatistics()
{
  return objc_opt_self();
}

uint64_t sub_24790AE6C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6F43797469746E65 && a2 == 0xEB00000000746E75;
  if (v3 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000247930E20)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t type metadata accessor for InspectorSceneStatistics()
{
  return objc_opt_self();
}

unint64_t sub_24790AF80()
{
  unint64_t result;

  result = qword_2576C7A78;
  if (!qword_2576C7A78)
  {
    result = MEMORY[0x249584764](&unk_24792A97C, &type metadata for InspectorSceneStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C7A78);
  }
  return result;
}

unint64_t sub_24790AFC4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576C7A88;
  if (!qword_2576C7A88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7A80);
    v2[0] = sub_247907018();
    v2[1] = sub_24790B0CC(&qword_2576C7A90, type metadata accessor for InspectorEntityStatistics, (uint64_t)&protocol conformance descriptor for InspectorStatisticsBase);
    result = MEMORY[0x249584764](MEMORY[0x24BEE04E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576C7A88);
  }
  return result;
}

unint64_t sub_24790B048()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576C7AA0;
  if (!qword_2576C7AA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7A80);
    v2[0] = sub_247906BA8();
    v2[1] = sub_24790B0CC(&qword_2576C7AA8, type metadata accessor for InspectorEntityStatistics, (uint64_t)&protocol conformance descriptor for InspectorStatisticsBase);
    result = MEMORY[0x249584764](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576C7AA0);
  }
  return result;
}

uint64_t sub_24790B0CC(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x249584764](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24790B10C()
{
  unint64_t result;

  result = qword_2576C7AB0;
  if (!qword_2576C7AB0)
  {
    result = MEMORY[0x249584764](&unk_24792A80C, &type metadata for InspectorEntityStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C7AB0);
  }
  return result;
}

unint64_t sub_24790B154()
{
  unint64_t result;

  result = qword_2576C7AB8;
  if (!qword_2576C7AB8)
  {
    result = MEMORY[0x249584764](&unk_24792A8EC, &type metadata for InspectorEntityStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C7AB8);
  }
  return result;
}

unint64_t sub_24790B19C()
{
  unint64_t result;

  result = qword_2576C7AC0;
  if (!qword_2576C7AC0)
  {
    result = MEMORY[0x249584764](&unk_24792A8C4, &type metadata for InspectorEntityStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C7AC0);
  }
  return result;
}

unint64_t sub_24790B1E4()
{
  unint64_t result;

  result = qword_2576C7AC8;
  if (!qword_2576C7AC8)
  {
    result = MEMORY[0x249584764](&unk_24792A914, &type metadata for InspectorSceneStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C7AC8);
  }
  return result;
}

unint64_t sub_24790B22C()
{
  unint64_t result;

  result = qword_2576C7AD0;
  if (!qword_2576C7AD0)
  {
    result = MEMORY[0x249584764](&unk_24792A9F4, &type metadata for InspectorSceneStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C7AD0);
  }
  return result;
}

unint64_t sub_24790B274()
{
  unint64_t result;

  result = qword_2576C7AD8;
  if (!qword_2576C7AD8)
  {
    result = MEMORY[0x249584764](&unk_24792A9CC, &type metadata for InspectorSceneStatistics.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576C7AD8);
  }
  return result;
}

uint64_t method lookup function for InspectorStatisticsBase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InspectorStatisticsBase.__allocating_init(geometry:lighting:material:texture:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of InspectorStatisticsBase.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of InspectorStatisticsBase.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Geometry(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Geometry(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
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
  *(_BYTE *)(result + 33) = v3;
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Geometry()
{
  return &type metadata for InspectorStatisticsBase.Geometry;
}

uint64_t destroy for InspectorStatisticsBase.Lighting()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InspectorStatisticsBase.Lighting(uint64_t a1, uint64_t a2)
{
  int v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v3 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v3;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InspectorStatisticsBase.Lighting(uint64_t a1, int *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 12) = *((_BYTE *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  v6 = a2[4];
  *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v6;
  v7 = a2[6];
  *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v7;
  v8 = a2[8];
  *(_BYTE *)(a1 + 36) = *((_BYTE *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = a2[12];
  *(_BYTE *)(a1 + 52) = *((_BYTE *)a2 + 52);
  *(_DWORD *)(a1 + 48) = v9;
  v10 = a2[14];
  *(_BYTE *)(a1 + 60) = *((_BYTE *)a2 + 60);
  *(_DWORD *)(a1 + 56) = v10;
  v11 = a2[16];
  *(_BYTE *)(a1 + 68) = *((_BYTE *)a2 + 68);
  *(_DWORD *)(a1 + 64) = v11;
  return a1;
}

__n128 __swift_memcpy69_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 61) = *(_QWORD *)(a2 + 61);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for InspectorStatisticsBase.Lighting(uint64_t a1, uint64_t a2)
{
  int v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v4 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Lighting(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 69))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Lighting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 68) = 0;
    *(_DWORD *)(result + 64) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 69) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 69) = 0;
    if (a2)
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Lighting()
{
  return &type metadata for InspectorStatisticsBase.Lighting;
}

uint64_t initializeBufferWithCopyOfBuffer for InspectorStatisticsBase.Material(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InspectorStatisticsBase.Material(uint64_t a1, int *a2)
{
  int v3;

  v3 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
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

uint64_t assignWithTake for InspectorStatisticsBase.Material(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Material(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Material(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Material()
{
  return &type metadata for InspectorStatisticsBase.Material;
}

uint64_t destroy for InspectorStatisticsBase.Texture()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InspectorStatisticsBase.Texture(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InspectorStatisticsBase.Texture(uint64_t a1, int *a2)
{
  int v4;
  uint64_t v5;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  v5 = *((_QWORD *)a2 + 1);
  *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for InspectorStatisticsBase.Texture(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Texture(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Texture(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Texture()
{
  return &type metadata for InspectorStatisticsBase.Texture;
}

uint64_t destroy for InspectorStatisticsBase.Texture.TextureData()
{
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for InspectorStatisticsBase.Texture.TextureData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InspectorStatisticsBase.Texture.TextureData(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
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

_QWORD *assignWithTake for InspectorStatisticsBase.Texture.TextureData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Texture.TextureData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Texture.TextureData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Texture.TextureData()
{
  return &type metadata for InspectorStatisticsBase.Texture.TextureData;
}

uint64_t method lookup function for InspectorEntityStatistics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InspectorEntityStatistics.__allocating_init(entityID:descendantCount:geometry:lighting:material:texture:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

ValueMetadata *type metadata accessor for InspectorEntityStatistics.CodingKeys()
{
  return &type metadata for InspectorEntityStatistics.CodingKeys;
}

uint64_t method lookup function for InspectorSceneStatistics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InspectorSceneStatistics.__allocating_init(entityCount:entityStatistics:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of InspectorSceneStatistics.toJSONData()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of InspectorSceneStatistics.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

ValueMetadata *type metadata accessor for InspectorSceneStatistics.CodingKeys()
{
  return &type metadata for InspectorSceneStatistics.CodingKeys;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.CodingKeys;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Texture.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Texture.CodingKeys;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Texture.TextureData.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Texture.TextureData.CodingKeys;
}

uint64_t _s26SpatialInspectorFoundation25InspectorEntityStatisticsC10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24790BCE0 + 4 * byte_24792A612[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24790BD14 + 4 * byte_24792A60D[v4]))();
}

uint64_t sub_24790BD14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24790BD1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24790BD24);
  return result;
}

uint64_t sub_24790BD30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24790BD38);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24790BD3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24790BD44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Material.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Material.CodingKeys;
}

uint64_t getEnumTagSinglePayload for InspectorStatisticsBase.Lighting.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorStatisticsBase.Lighting.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24790BE3C + 4 * byte_24792A61C[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_24790BE70 + 4 * byte_24792A617[v4]))();
}

uint64_t sub_24790BE70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24790BE78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24790BE80);
  return result;
}

uint64_t sub_24790BE8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24790BE94);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_24790BE98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24790BEA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Lighting.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Lighting.CodingKeys;
}

uint64_t _s26SpatialInspectorFoundation23InspectorStatisticsBaseC10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24790BF08 + 4 * byte_24792A626[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24790BF3C + 4 * byte_24792A621[v4]))();
}

uint64_t sub_24790BF3C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24790BF44(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24790BF4CLL);
  return result;
}

uint64_t sub_24790BF58(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24790BF60);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24790BF64(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24790BF6C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InspectorStatisticsBase.Geometry.CodingKeys()
{
  return &type metadata for InspectorStatisticsBase.Geometry.CodingKeys;
}

unint64_t sub_24790BF8C()
{
  unint64_t result;

  result = qword_2576CA390[0];
  if (!qword_2576CA390[0])
  {
    result = MEMORY[0x249584764](&unk_24792ACB0, &type metadata for InspectorStatisticsBase.Geometry.CodingKeys);
    atomic_store(result, qword_2576CA390);
  }
  return result;
}

unint64_t sub_24790BFD4()
{
  unint64_t result;

  result = qword_2576CA5A0[0];
  if (!qword_2576CA5A0[0])
  {
    result = MEMORY[0x249584764](&unk_24792AD68, &type metadata for InspectorStatisticsBase.Lighting.CodingKeys);
    atomic_store(result, qword_2576CA5A0);
  }
  return result;
}

unint64_t sub_24790C01C()
{
  unint64_t result;

  result = qword_2576CA7B0[0];
  if (!qword_2576CA7B0[0])
  {
    result = MEMORY[0x249584764](&unk_24792AE20, &type metadata for InspectorStatisticsBase.Material.CodingKeys);
    atomic_store(result, qword_2576CA7B0);
  }
  return result;
}

unint64_t sub_24790C064()
{
  unint64_t result;

  result = qword_2576CA9C0[0];
  if (!qword_2576CA9C0[0])
  {
    result = MEMORY[0x249584764](&unk_24792AED8, &type metadata for InspectorStatisticsBase.Texture.TextureData.CodingKeys);
    atomic_store(result, qword_2576CA9C0);
  }
  return result;
}

unint64_t sub_24790C0AC()
{
  unint64_t result;

  result = qword_2576CABD0[0];
  if (!qword_2576CABD0[0])
  {
    result = MEMORY[0x249584764](&unk_24792AF90, &type metadata for InspectorStatisticsBase.Texture.CodingKeys);
    atomic_store(result, qword_2576CABD0);
  }
  return result;
}

unint64_t sub_24790C0F4()
{
  unint64_t result;

  result = qword_2576CADE0[0];
  if (!qword_2576CADE0[0])
  {
    result = MEMORY[0x249584764](&unk_24792B048, &type metadata for InspectorStatisticsBase.CodingKeys);
    atomic_store(result, qword_2576CADE0);
  }
  return result;
}

unint64_t sub_24790C13C()
{
  unint64_t result;

  result = qword_2576CAEF0;
  if (!qword_2576CAEF0)
  {
    result = MEMORY[0x249584764](&unk_24792AFB8, &type metadata for InspectorStatisticsBase.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CAEF0);
  }
  return result;
}

unint64_t sub_24790C184()
{
  unint64_t result;

  result = qword_2576CAEF8[0];
  if (!qword_2576CAEF8[0])
  {
    result = MEMORY[0x249584764](&unk_24792AFE0, &type metadata for InspectorStatisticsBase.CodingKeys);
    atomic_store(result, qword_2576CAEF8);
  }
  return result;
}

unint64_t sub_24790C1CC()
{
  unint64_t result;

  result = qword_2576CAF80;
  if (!qword_2576CAF80)
  {
    result = MEMORY[0x249584764](&unk_24792AF00, &type metadata for InspectorStatisticsBase.Texture.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CAF80);
  }
  return result;
}

unint64_t sub_24790C214()
{
  unint64_t result;

  result = qword_2576CAF88[0];
  if (!qword_2576CAF88[0])
  {
    result = MEMORY[0x249584764](&unk_24792AF28, &type metadata for InspectorStatisticsBase.Texture.CodingKeys);
    atomic_store(result, qword_2576CAF88);
  }
  return result;
}

unint64_t sub_24790C25C()
{
  unint64_t result;

  result = qword_2576CB010;
  if (!qword_2576CB010)
  {
    result = MEMORY[0x249584764](&unk_24792AE48, &type metadata for InspectorStatisticsBase.Texture.TextureData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CB010);
  }
  return result;
}

unint64_t sub_24790C2A4()
{
  unint64_t result;

  result = qword_2576CB018[0];
  if (!qword_2576CB018[0])
  {
    result = MEMORY[0x249584764](&unk_24792AE70, &type metadata for InspectorStatisticsBase.Texture.TextureData.CodingKeys);
    atomic_store(result, qword_2576CB018);
  }
  return result;
}

unint64_t sub_24790C2EC()
{
  unint64_t result;

  result = qword_2576CB0A0;
  if (!qword_2576CB0A0)
  {
    result = MEMORY[0x249584764](&unk_24792AD90, &type metadata for InspectorStatisticsBase.Material.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CB0A0);
  }
  return result;
}

unint64_t sub_24790C334()
{
  unint64_t result;

  result = qword_2576CB0A8[0];
  if (!qword_2576CB0A8[0])
  {
    result = MEMORY[0x249584764](&unk_24792ADB8, &type metadata for InspectorStatisticsBase.Material.CodingKeys);
    atomic_store(result, qword_2576CB0A8);
  }
  return result;
}

unint64_t sub_24790C37C()
{
  unint64_t result;

  result = qword_2576CB130;
  if (!qword_2576CB130)
  {
    result = MEMORY[0x249584764](&unk_24792ACD8, &type metadata for InspectorStatisticsBase.Lighting.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CB130);
  }
  return result;
}

unint64_t sub_24790C3C4()
{
  unint64_t result;

  result = qword_2576CB138[0];
  if (!qword_2576CB138[0])
  {
    result = MEMORY[0x249584764](&unk_24792AD00, &type metadata for InspectorStatisticsBase.Lighting.CodingKeys);
    atomic_store(result, qword_2576CB138);
  }
  return result;
}

unint64_t sub_24790C40C()
{
  unint64_t result;

  result = qword_2576CB1C0;
  if (!qword_2576CB1C0)
  {
    result = MEMORY[0x249584764](&unk_24792AC20, &type metadata for InspectorStatisticsBase.Geometry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CB1C0);
  }
  return result;
}

unint64_t sub_24790C454()
{
  unint64_t result;

  result = qword_2576CB1C8[0];
  if (!qword_2576CB1C8[0])
  {
    result = MEMORY[0x249584764](&unk_24792AC48, &type metadata for InspectorStatisticsBase.Geometry.CodingKeys);
    atomic_store(result, qword_2576CB1C8);
  }
  return result;
}

uint64_t dispatch thunk of InspectorSceneStatistics.encode(to:)()
{
  return dispatch thunk of InspectorStatisticsBase.encode(to:)();
}

uint64_t sub_24790C4B4()
{
  return sub_24790900C();
}

uint64_t *sub_24790C4EC()
{
  return &qword_2576C7D48;
}

uint64_t static OS_os_log.spatialInspectorSubsystem.getter()
{
  uint64_t v0;

  swift_beginAccess();
  v0 = qword_2576C7D48;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static OS_os_log.spatialInspectorSubsystem.setter(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  qword_2576C7D48 = a1;
  qword_2576C7D50 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static OS_os_log.spatialInspectorSubsystem.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_24790C5E0(uint64_t a1)
{
  return sub_24790C9A0(a1, 0x6C6172656E6547, 0xE700000000000000, &qword_2576D0580);
}

uint64_t *sub_24790C600()
{
  if (qword_2576CB250 != -1)
    swift_once();
  return &qword_2576D0580;
}

id sub_24790C640()
{
  return sub_24790C6D4(&qword_2576CB250, (id *)&qword_2576D0580);
}

uint64_t sub_24790C65C(uint64_t a1)
{
  return sub_24790C9A0(a1, 0x6C65646F4DLL, 0xE500000000000000, &qword_2576D0588);
}

uint64_t *sub_24790C678()
{
  if (qword_2576CB258 != -1)
    swift_once();
  return &qword_2576D0588;
}

id sub_24790C6B8()
{
  return sub_24790C6D4(&qword_2576CB258, (id *)&qword_2576D0588);
}

id sub_24790C6D4(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t sub_24790C70C(uint64_t a1)
{
  return sub_24790C9A0(a1, 0x467974696C616552, 0xEB00000000656C69, &qword_2576D0590);
}

uint64_t *sub_24790C734()
{
  if (qword_2576CB260 != -1)
    swift_once();
  return &qword_2576D0590;
}

id sub_24790C774()
{
  return sub_24790C6D4(&qword_2576CB260, (id *)&qword_2576D0590);
}

uint64_t sub_24790C790(uint64_t a1)
{
  return sub_24790C9A0(a1, 0x726F74696445, 0xE600000000000000, &qword_2576D0598);
}

uint64_t *sub_24790C7AC()
{
  if (qword_2576CB268 != -1)
    swift_once();
  return &qword_2576D0598;
}

id sub_24790C7EC()
{
  return sub_24790C6D4(&qword_2576CB268, (id *)&qword_2576D0598);
}

uint64_t sub_24790C808(uint64_t a1)
{
  return sub_24790C9A0(a1, 0x6F74636570736E49, 0xEA00000000007372, &qword_2576D05A0);
}

uint64_t *sub_24790C82C()
{
  if (qword_2576CB270 != -1)
    swift_once();
  return &qword_2576D05A0;
}

id sub_24790C86C()
{
  return sub_24790C6D4(&qword_2576CB270, (id *)&qword_2576D05A0);
}

uint64_t sub_24790C888(uint64_t a1)
{
  return sub_24790C9A0(a1, 0x74726F7077656956, 0xE800000000000000, &qword_2576D05A8);
}

uint64_t *sub_24790C8A8()
{
  if (qword_2576CB278 != -1)
    swift_once();
  return &qword_2576D05A8;
}

id sub_24790C8E8()
{
  return sub_24790C6D4(&qword_2576CB278, (id *)&qword_2576D05A8);
}

uint64_t sub_24790C904(uint64_t a1)
{
  return sub_24790C9A0(a1, 0x7562654477656956, 0xEC00000072656767, &qword_2576D05B0);
}

uint64_t *sub_24790C92C()
{
  if (qword_2576CB280 != -1)
    swift_once();
  return &qword_2576D05B0;
}

id sub_24790C96C()
{
  return sub_24790C6D4(&qword_2576CB280, (id *)&qword_2576D05B0);
}

uint64_t sub_24790C988(uint64_t a1)
{
  return sub_24790C9A0(a1, 3062931440, 0xA400000000000000, &qword_2576D05B8);
}

uint64_t sub_24790C9A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;

  sub_24790CF00();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  result = sub_247929710();
  *a4 = result;
  return result;
}

uint64_t *sub_24790CA2C()
{
  if (qword_2576CB288 != -1)
    swift_once();
  return &qword_2576D05B8;
}

id sub_24790CA6C()
{
  return sub_24790C6D4(&qword_2576CB288, (id *)&qword_2576D05B8);
}

uint64_t sub_24790CA88(uint64_t a1)
{
  return sub_24790CB20(a1, qword_2576CB298, &qword_2576CB250, (id *)&qword_2576D0580);
}

uint64_t sub_24790CAAC()
{
  return sub_24790CDEC(&qword_2576CB290, (uint64_t)qword_2576CB298);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Log.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24790CE48(&qword_2576CB290, (uint64_t)qword_2576CB298, a1);
}

uint64_t sub_24790CAFC(uint64_t a1)
{
  return sub_24790CB20(a1, qword_2576CB2B8, &qword_2576CB258, (id *)&qword_2576D0588);
}

uint64_t sub_24790CB20(uint64_t a1, uint64_t *a2, _QWORD *a3, id *a4)
{
  uint64_t v7;
  id v8;

  v7 = sub_247929368();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v8 = *a4;
  return sub_247929374();
}

uint64_t sub_24790CBA8()
{
  return sub_24790CDEC(&qword_2576CB2B0, (uint64_t)qword_2576CB2B8);
}

uint64_t static Log.model.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24790CE48(&qword_2576CB2B0, (uint64_t)qword_2576CB2B8, a1);
}

uint64_t sub_24790CBE0(uint64_t a1)
{
  return sub_24790CB20(a1, qword_2576CB2D8, &qword_2576CB260, (id *)&qword_2576D0590);
}

uint64_t sub_24790CC04()
{
  return sub_24790CDEC(&qword_2576CB2D0, (uint64_t)qword_2576CB2D8);
}

uint64_t static Log.realityFile.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24790CE48(&qword_2576CB2D0, (uint64_t)qword_2576CB2D8, a1);
}

uint64_t sub_24790CC3C(uint64_t a1)
{
  return sub_24790CB20(a1, qword_2576CB2F8, &qword_2576CB268, (id *)&qword_2576D0598);
}

uint64_t sub_24790CC60()
{
  return sub_24790CDEC(&qword_2576CB2F0, (uint64_t)qword_2576CB2F8);
}

uint64_t static Log.editor.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24790CE48(&qword_2576CB2F0, (uint64_t)qword_2576CB2F8, a1);
}

uint64_t sub_24790CC98(uint64_t a1)
{
  return sub_24790CB20(a1, qword_2576CB318, &qword_2576CB270, (id *)&qword_2576D05A0);
}

uint64_t sub_24790CCBC()
{
  return sub_24790CDEC(&qword_2576CB310, (uint64_t)qword_2576CB318);
}

uint64_t static Log.inspectors.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24790CE48(&qword_2576CB310, (uint64_t)qword_2576CB318, a1);
}

uint64_t sub_24790CCF4(uint64_t a1)
{
  return sub_24790CB20(a1, qword_2576CB338, &qword_2576CB278, (id *)&qword_2576D05A8);
}

uint64_t sub_24790CD18()
{
  return sub_24790CDEC(&qword_2576CB330, (uint64_t)qword_2576CB338);
}

uint64_t static Log.viewport.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24790CE48(&qword_2576CB330, (uint64_t)qword_2576CB338, a1);
}

uint64_t sub_24790CD50(uint64_t a1)
{
  return sub_24790CB20(a1, qword_2576CB358, &qword_2576CB280, (id *)&qword_2576D05B0);
}

uint64_t sub_24790CD74()
{
  return sub_24790CDEC(&qword_2576CB350, (uint64_t)qword_2576CB358);
}

uint64_t static Log.viewDebugger.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24790CE48(&qword_2576CB350, (uint64_t)qword_2576CB358, a1);
}

uint64_t sub_24790CDAC(uint64_t a1)
{
  return sub_24790CB20(a1, qword_2576CB378, &qword_2576CB288, (id *)&qword_2576D05B8);
}

uint64_t sub_24790CDD0()
{
  return sub_24790CDEC(&qword_2576CB370, (uint64_t)qword_2576CB378);
}

uint64_t sub_24790CDEC(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_247929368();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Log.temp.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24790CE48(&qword_2576CB370, (uint64_t)qword_2576CB378, a1);
}

uint64_t sub_24790CE48@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_247929368();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
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

unint64_t sub_24790CF00()
{
  unint64_t result;

  result = qword_2576C7D58;
  if (!qword_2576C7D58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576C7D58);
  }
  return result;
}

float sub_24790CF3C(double a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  float v7;
  _QWORD *v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _DWORD v15[2];
  _QWORD v16[3];
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20;
  double v21;

  v21 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7FC8);
  v1 = MEMORY[0x24BEE13C8];
  if (swift_dynamicCast())
  {
    sub_247903C60(&v18, (uint64_t)v16);
    v2 = v17;
    v3 = __swift_project_boxed_opaque_existential_1(v16, v17);
    v4 = *(_QWORD *)(v2 - 8);
    MEMORY[0x24BDAC7A8](v3, v3);
    v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    if (sub_247929770() < 65)
    {
      v12 = sub_24792977C();
      v13 = sub_247929764();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
      if ((v12 & 1) != 0)
        v7 = (float)v13;
      else
        v7 = (float)(unint64_t)v13;
    }
    else
    {
      sub_247914EF4();
      sub_247914F38();
      sub_2479293A4();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
      v7 = *(float *)&v15[1];
    }
  }
  else
  {
    v19 = v1;
    v20 = sub_247912A6C();
    *(double *)&v18 = v21;
    sub_247903C60(&v18, (uint64_t)v16);
    v8 = __swift_project_boxed_opaque_existential_1(v16, v17);
    MEMORY[0x24BDAC7A8](v8, v8);
    v10 = (double *)((char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(double *))(v11 + 16))(v10);
    v7 = *v10;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v7;
}

float sub_24790D150(int a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  float v7;
  _QWORD v9[3];
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;

  v12 = MEMORY[0x24BEE44F0];
  v13 = sub_247914EB0();
  LODWORD(v11) = a1;
  sub_247903C60(&v11, (uint64_t)v9);
  v2 = v10;
  v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v3, v3);
  v6 = (unsigned int *)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(unsigned int *))(v4 + 16))(v6);
  if ((sub_24792977C() & 1) != 0)
    v7 = (float)sub_247929764();
  else
    v7 = (float)*v6;
  (*(void (**)(unsigned int *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

float sub_24790D250(__int16 a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  unsigned int v7;
  float v8;
  _QWORD v10[3];
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;

  v13 = MEMORY[0x24BEE4478];
  v14 = sub_247914E6C();
  LOWORD(v12) = a1;
  sub_247903C60(&v12, (uint64_t)v10);
  v2 = v11;
  v3 = __swift_project_boxed_opaque_existential_1(v10, v11);
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v3, v3);
  v6 = (_WORD *)((char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(_WORD *))(v4 + 16))(v6);
  if ((sub_24792977C() & 1) != 0)
  {
    v8 = (float)sub_247929764();
  }
  else
  {
    LOWORD(v7) = *v6;
    v8 = (float)v7;
  }
  (*(void (**)(_WORD *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

float sub_24790D350(char a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  unsigned int v7;
  float v8;
  _QWORD v10[3];
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;

  v13 = MEMORY[0x24BEE4260];
  v14 = sub_247914E28();
  LOBYTE(v12) = a1;
  sub_247903C60(&v12, (uint64_t)v10);
  v2 = v11;
  v3 = __swift_project_boxed_opaque_existential_1(v10, v11);
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v3, v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(_BYTE *))(v4 + 16))(v6);
  if ((sub_24792977C() & 1) != 0)
  {
    v8 = (float)sub_247929764();
  }
  else
  {
    LOBYTE(v7) = *v6;
    v8 = (float)v7;
  }
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v8;
}

float sub_24790D450(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  float v9;
  _QWORD v11[3];
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v14 = a2;
  v15 = a3();
  *(_QWORD *)&v13 = a1;
  sub_247903C60(&v13, (uint64_t)v11);
  v4 = v12;
  v5 = __swift_project_boxed_opaque_existential_1(v11, v12);
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v5, v5);
  v8 = (_QWORD *)((char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(unint64_t *))(v6 + 16))(v8);
  if ((sub_24792977C() & 1) != 0)
    v9 = (float)sub_247929764();
  else
    v9 = (float)*v8;
  (*(void (**)(unint64_t *, uint64_t))(v6 + 8))(v8, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v9;
}

float sub_24790D548(int a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  float v7;
  _QWORD v9[3];
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;

  v12 = MEMORY[0x24BEE3F88];
  v13 = sub_247914DA0();
  LODWORD(v11) = a1;
  sub_247903C60(&v11, (uint64_t)v9);
  v2 = v10;
  v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v3, v3);
  v6 = (int *)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(int *))(v4 + 16))(v6);
  if ((sub_24792977C() & 1) != 0)
    v7 = (float)sub_247929764();
  else
    v7 = (float)(unint64_t)*v6;
  (*(void (**)(int *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

float sub_24790D648(__int16 a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  __int16 *v6;
  float v7;
  _QWORD v9[3];
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;

  v12 = MEMORY[0x24BEE3F30];
  v13 = sub_247914D5C();
  LOWORD(v11) = a1;
  sub_247903C60(&v11, (uint64_t)v9);
  v2 = v10;
  v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v3, v3);
  v6 = (__int16 *)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(__int16 *))(v4 + 16))(v6);
  if ((sub_24792977C() & 1) != 0)
    v7 = (float)sub_247929764();
  else
    v7 = (float)(unint64_t)*v6;
  (*(void (**)(__int16 *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

float sub_24790D748(char a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  float v7;
  _QWORD v9[3];
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;

  v12 = MEMORY[0x24BEE3E50];
  v13 = sub_247914D18();
  LOBYTE(v11) = a1;
  sub_247903C60(&v11, (uint64_t)v9);
  v2 = v10;
  v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v3, v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v4 + 16))(v6);
  if ((sub_24792977C() & 1) != 0)
    v7 = (float)sub_247929764();
  else
    v7 = (float)(unint64_t)*v6;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v7;
}

id InspectorPropertyValue.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(void **)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(a1 + 32) = v6;
  return sub_24790D864(v2, v3, v4, v5, v6);
}

id sub_24790D864(id result, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 4:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
    case 18:
    case 21:
    case 25:
    case 26:
    case 27:
      goto LABEL_3;
    case 14:
      result = result;
      break;
    case 15:
      result = (id)sub_247901BE0((uint64_t)result, a2);
      break;
    case 22:
    case 23:
    case 24:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_3:
      result = (id)swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t InspectorPropertyValue.init(anyValue:)@<X0>(char *a1@<X0>, uint16x8_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint16x8_t v32;
  char v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t AssociatedTypeWitness;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char v45;
  char *v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *);
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint16x8_t v54;
  void (*v55)(char *, char *);
  uint16x8_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t (*v63)(int64_t, char *);
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  float v69;
  uint64_t v70;
  uint64_t result;
  uint16x8_t *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t (*v75)();
  uint16x8_t v76;
  uint16x8_t v77;
  uint16x8_t v78;
  uint16x8_t v79;
  uint16x8_t v80;
  uint16x8_t v81;
  uint16x8_t v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t (*v88)();
  uint16x8_t v89;
  uint8x8_t v90;
  uint16x8_t v91;
  uint8x8_t v92;
  uint16x8_t v93;
  uint64_t v94;
  uint16x8_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t (*v99)();
  uint16x8_t v100;
  uint8x8_t v101;
  uint64_t v102;
  float v103;
  uint16x8_t v104;
  uint16x8_t v105;
  uint8x8_t v106;
  uint16x8_t v107;
  uint64_t v108;
  uint64_t v109;
  uint16x8_t v110;
  uint16x8_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint16x8_t *v114;
  char v115;
  __int128 v116;
  uint64_t v117;
  _OWORD *v118;
  uint16x8_t v119;
  __int128 v120;
  _OWORD *v121;
  uint16x8_t v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  uint64_t v128;
  __int128 v129;
  uint64_t v130;
  uint16x8_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t DynamicType;
  uint64_t v151;
  uint64_t v152;
  _QWORD *v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  const void *v157;
  CFTypeID v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  _QWORD *v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  uint64_t v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  char *v178;
  uint16x8_t v179;
  uint16x8_t *v180;
  unint64_t v181;
  _QWORD v182[3];
  char *v183;
  uint64_t v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  char v193[8];

  v180 = a2;
  v179.i64[0] = sub_247929320();
  *(_QWORD *)&v177 = *(_QWORD *)(v179.i64[0] - 8);
  v4 = MEMORY[0x24BDAC7A8](v179.i64[0], v3);
  *(_QWORD *)&v176 = (char *)&v170 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v6);
  *(_QWORD *)&v174 = (char *)&v170 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D60);
  MEMORY[0x24BDAC7A8](v8, v9);
  *(_QWORD *)&v175 = (char *)&v170 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_247929278();
  v12 = *(void (***)(char *, uint64_t))(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v170 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (char *)sub_2479292D8();
  v17 = *((_QWORD *)v16 - 1);
  v19 = MEMORY[0x24BDAC7A8](v16, v18);
  v21 = (char *)&v170 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x24BDAC7A8](v19, v22);
  v25 = (__int128 *)((char *)&v170 - v24);
  MEMORY[0x24BDAC7A8](v23, v26);
  v28 = (char *)&v170 - v27;
  sub_2479104F4((uint64_t)a1, (uint64_t)v193);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D68);
  if (swift_dynamicCast())
  {
    sub_247903C60(&v185, (uint64_t)v182);
    v29 = __swift_project_boxed_opaque_existential_1(v182, (uint64_t)v183);
    MEMORY[0x24BDAC7A8](v29, v29);
    (*(void (**)(char *))(v31 + 16))((char *)&v170 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0));
    sub_247912AF4();
    sub_24792983C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    v32.i64[0] = v181;
    v179 = v32;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v182);
    v33 = 0;
LABEL_31:
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v72 = v180;
    *v180 = v179;
    v72[1].i64[0] = 0;
    v72[1].i64[1] = 0;
    v72[2].i8[0] = v33;
    return result;
  }
  v178 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D70);
  if (!swift_dynamicCast())
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D78);
    if (swift_dynamicCast())
    {
      sub_247903C60(&v185, (uint64_t)v182);
      v51 = __swift_project_boxed_opaque_existential_1(v182, (uint64_t)v183);
      MEMORY[0x24BDAC7A8](v51, v51);
      (*(void (**)(char *))(v53 + 16))((char *)&v170 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0));
      sub_247912A6C();
      sub_247929398();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
      v54.i64[0] = v181;
      v179 = v54;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v182);
      v33 = 2;
      goto LABEL_31;
    }
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
      v179 = (uint16x8_t)v185;
      v33 = 3;
      goto LABEL_31;
    }
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
      v179 = (uint16x8_t)v185;
      v33 = 4;
      goto LABEL_31;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D80);
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
      v56.i64[0] = v185;
      v179 = v56;
      v33 = 5;
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  sub_247903C60(&v185, (uint64_t)v182);
  v28 = v183;
  v34 = v184;
  v35 = __swift_project_boxed_opaque_existential_1(v182, (uint64_t)v183);
  v25 = &v170;
  v36 = *((_QWORD *)v28 - 1);
  v12 = *(void (***)(char *, uint64_t))(v36 + 64);
  MEMORY[0x24BDAC7A8](v35, v35);
  v21 = (char *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (char *)((char *)&v170 - v21);
  *(_QWORD *)&v176 = *(_QWORD *)(v36 + 16);
  ((void (*)(int64_t))v176)((char *)&v170 - v21);
  v11 = *(_QWORD *)(v34 + 8);
  if ((sub_24792977C() & 1) != 0)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v179.i64[0] = v11;
    *(_QWORD *)&v175 = &v170;
    MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v38);
    v15 = (char *)&v170 - v39;
    swift_getAssociatedConformanceWitness();
    v40 = sub_247929A58();
    *(_QWORD *)&v177 = &v170;
    MEMORY[0x24BDAC7A8](v40, v41);
    sub_247929A10();
    v17 = sub_247929470();
    v11 = v179.i64[0];
    (*(void (**)(int64_t, char *))(v36 + 8))((char *)&v170 - v21, v28);
    v25 = (__int128 *)v177;
    if ((v17 & 1) == 0)
    {
      __break(1u);
      goto LABEL_51;
    }
  }
  v42 = sub_247929770();
  v15 = v178;
  if (v42 < 64)
    goto LABEL_30;
  *(_QWORD *)&v175 = &v170;
  MEMORY[0x24BDAC7A8](v42, v43);
  v44 = (char *)&v170 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  ((void (*)(char *, int64_t, char *))v176)(v44, (char *)&v170 - v21, v28);
  v181 = -1;
  v45 = sub_24792977C();
  v46 = (char *)v11;
  v47 = v45;
  v21 = v46;
  v48 = sub_247929770();
  if ((v47 & 1) != 0)
  {
    *(_QWORD *)&v177 = v25;
    if (v48 <= 64)
    {
      *(_QWORD *)&v176 = v16;
      v57 = v21;
      v58 = swift_getAssociatedTypeWitness();
      *(_QWORD *)&v174 = &v170;
      MEMORY[0x24BDAC7A8](v58, v59);
      swift_getAssociatedConformanceWitness();
      v60 = sub_247929A58();
      *(_QWORD *)&v173 = &v170;
      MEMORY[0x24BDAC7A8](v60, v61);
      v21 = (char *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_247929A10();
      v179.i64[0] = (uint64_t)v57;
      v62 = sub_247929458();
      v63 = *(uint64_t (**)(int64_t, char *))(v36 + 8);
      v64 = v63((char *)&v170 - v21, v28);
      v65 = v181;
      MEMORY[0x24BDAC7A8](v64, v66);
      v17 = (char *)&v170 - v21;
      (*(void (**)(int64_t, int64_t, char *))(v36 + 32))((char *)&v170 - v21, (char *)&v170 - v21, v28);
      if ((v62 & 1) != 0)
      {
        v11 = v179.i64[0];
        v12 = (void (**)(char *, uint64_t))sub_247929764();
        v63((char *)&v170 - v21, v28);
        v67 = v65 >= (unint64_t)v12;
        v15 = v178;
        v25 = (__int128 *)v177;
        v16 = (char *)v176;
        if (!v67)
          goto LABEL_26;
      }
      else
      {
        v63((char *)&v170 - v21, v28);
        v15 = v178;
        v16 = (char *)v176;
      }
    }
    else
    {
      MEMORY[0x24BDAC7A8](v48, v49);
      v12 = (void (**)(char *, uint64_t))((char *)&v170 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      sub_247912AB0();
      sub_247929758();
      v17 = sub_247929464();
      v50 = *(void (**)(char *, char *))(v36 + 8);
      v50((char *)v12, v28);
      v50(v44, v28);
      v11 = (uint64_t)v21;
      v25 = (__int128 *)v177;
      if ((v17 & 1) != 0)
        goto LABEL_26;
    }
LABEL_30:
    v70 = sub_247929764();
    (*(void (**)(char *, char *))(v36 + 8))(v16, v28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v182);
    v179 = (uint16x8_t)(unint64_t)v70;
    v33 = 1;
    goto LABEL_31;
  }
  if (v48 >= 65)
  {
    *(_QWORD *)&v176 = v16;
    MEMORY[0x24BDAC7A8](v48, v49);
    v12 = (void (**)(char *, uint64_t))((char *)&v170 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0));
    sub_247912AB0();
    sub_247929758();
    v17 = sub_247929464();
    v55 = *(void (**)(char *, char *))(v36 + 8);
    v55((char *)v12, v28);
    v55(v44, v28);
    v11 = (uint64_t)v21;
    v16 = (char *)v176;
    if ((v17 & 1) != 0)
      goto LABEL_26;
    goto LABEL_30;
  }
  v11 = (uint64_t)v21;
  v17 = sub_247929764();
  (*(void (**)(char *, char *))(v36 + 8))((char *)&v170 - (((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF0), v28);
  if (v181 >= v17)
    goto LABEL_30;
LABEL_26:
  __break(1u);
LABEL_27:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D88);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    *(float *)(v68 + 32) = sub_24790CF3C(*(double *)v179.i64);
    v69 = sub_24790CF3C(*(double *)&v179.i64[1]);
LABEL_41:
    *(float *)(v68 + 36) = v69;
LABEL_42:
    sub_24791298C(v68);
    v179 = v79;
    swift_setDeallocating();
LABEL_43:
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    v33 = 6;
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D90);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    v73 = v179.i64[0];
    v74 = MEMORY[0x24BEE1768];
    v75 = sub_247914CD4;
LABEL_34:
    *(float *)(v68 + 32) = sub_24790D450(v73, v74, (uint64_t (*)(void))v75);
    v69 = sub_24790D450(v179.i64[1], v74, (uint64_t (*)(void))v75);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D98);
  if (swift_dynamicCast())
  {
    v76.i8[4] = BYTE1(v185);
    v76.i8[0] = v185;
    v179 = v76;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    *(float *)(v68 + 32) = sub_24790D748(v179.i8[0]);
    v69 = sub_24790D748(v179.i8[4]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DA0);
  if (swift_dynamicCast())
  {
    v77.i16[2] = WORD1(v185);
    v77.i16[0] = v185;
    v179 = v77;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    *(float *)(v68 + 32) = sub_24790D648(v179.i16[0]);
    v69 = sub_24790D648(v179.i16[2]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DA8);
  if (swift_dynamicCast())
  {
    v78.i64[0] = v185;
    v179 = v78;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    *(float *)(v68 + 32) = sub_24790D548(v179.i32[0]);
    v69 = sub_24790D548(v179.i32[1]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DB0);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    v73 = v179.i64[0];
    v74 = MEMORY[0x24BEE4008];
    v75 = sub_247914DE4;
    goto LABEL_34;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DB8);
  if (swift_dynamicCast())
  {
    v80.i8[4] = BYTE1(v185);
    v80.i8[0] = v185;
    v179 = v80;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    *(float *)(v68 + 32) = sub_24790D350(v179.i8[0]);
    v69 = sub_24790D350(v179.i8[4]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DC0);
  if (swift_dynamicCast())
  {
    v81.i16[2] = WORD1(v185);
    v81.i16[0] = v185;
    v179 = v81;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    *(float *)(v68 + 32) = sub_24790D250(v179.i16[0]);
    v69 = sub_24790D250(v179.i16[2]);
    goto LABEL_41;
  }
LABEL_51:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DC8);
  if (swift_dynamicCast())
  {
    v82.i64[0] = v185;
    v179 = v82;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    *(float *)(v68 + 32) = sub_24790D150(v179.i32[0]);
    v69 = sub_24790D150(v179.i32[1]);
    goto LABEL_41;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DD0);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B900;
    v73 = v179.i64[0];
    v74 = MEMORY[0x24BEE4568];
    v75 = sub_247912AB0;
    goto LABEL_34;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7778);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    v179 = (uint16x8_t)v185;
    v33 = 6;
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DD8);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    v83 = *(double *)&v186;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B8F0;
    *(float *)(v68 + 32) = sub_24790CF3C(*(double *)v179.i64);
    *(float *)(v68 + 36) = sub_24790CF3C(*(double *)&v179.i64[1]);
    *(float *)(v68 + 40) = sub_24790CF3C(v83);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DE0);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    v84 = v186;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_24792B8F0;
    v86 = v179.i64[0];
    v87 = MEMORY[0x24BEE1768];
    v88 = sub_247914CD4;
LABEL_61:
    *(float *)(v85 + 32) = sub_24790D450(v86, v87, (uint64_t (*)(void))v88);
    *(float *)(v85 + 36) = sub_24790D450(v179.i64[1], v87, (uint64_t (*)(void))v88);
    *(float *)(v85 + 40) = sub_24790D450(v84, v87, (uint64_t (*)(void))v88);
    sub_24791298C(v85);
    v179 = v89;
    swift_setDeallocating();
    goto LABEL_43;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DE8);
  if (swift_dynamicCast())
  {
    v90.i32[0] = v185;
    v179 = vmovl_u8(v90);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B8F0;
    *(float *)(v68 + 32) = sub_24790D748(v179.i8[0]);
    *(float *)(v68 + 36) = sub_24790D748(v179.i8[2]);
    *(float *)(v68 + 40) = sub_24790D748(v179.i8[4]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DF0);
  if (swift_dynamicCast())
  {
    v91.i64[0] = v185;
    v179 = v91;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B8F0;
    *(float *)(v68 + 32) = sub_24790D648(v179.i16[0]);
    *(float *)(v68 + 36) = sub_24790D648(v179.i16[1]);
    *(float *)(v68 + 40) = sub_24790D648(v179.i16[2]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7DF8);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B8F0;
    *(float *)(v68 + 32) = sub_24790D548(v179.i32[0]);
    *(float *)(v68 + 36) = sub_24790D548(v179.i32[1]);
    *(float *)(v68 + 40) = sub_24790D548(v179.i32[2]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E00);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    v84 = v186;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_24792B8F0;
    v86 = v179.i64[0];
    v87 = MEMORY[0x24BEE4008];
    v88 = sub_247914DE4;
    goto LABEL_61;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E08);
  if (swift_dynamicCast())
  {
    v92.i32[0] = v185;
    v179 = vmovl_u8(v92);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B8F0;
    *(float *)(v68 + 32) = sub_24790D350(v179.i8[0]);
    *(float *)(v68 + 36) = sub_24790D350(v179.i8[2]);
    *(float *)(v68 + 40) = sub_24790D350(v179.i8[4]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E10);
  if (swift_dynamicCast())
  {
    v93.i64[0] = v185;
    v179 = v93;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B8F0;
    *(float *)(v68 + 32) = sub_24790D250(v179.i16[0]);
    *(float *)(v68 + 36) = sub_24790D250(v179.i16[1]);
    *(float *)(v68 + 40) = sub_24790D250(v179.i16[2]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E18);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v68 = swift_allocObject();
    *(_OWORD *)(v68 + 16) = xmmword_24792B8F0;
    *(float *)(v68 + 32) = sub_24790D150(v179.i32[0]);
    *(float *)(v68 + 36) = sub_24790D150(v179.i32[1]);
    *(float *)(v68 + 40) = sub_24790D150(v179.i32[2]);
    goto LABEL_42;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E20);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    v84 = v186;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v85 = swift_allocObject();
    *(_OWORD *)(v85 + 16) = xmmword_24792B8F0;
    v86 = v179.i64[0];
    v87 = MEMORY[0x24BEE4568];
    v88 = sub_247912AB0;
    goto LABEL_61;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E28);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    v179 = (uint16x8_t)v185;
    v33 = 7;
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E30);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v186;
    v177 = v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v33 = 7;
    v94 = swift_allocObject();
    *(_OWORD *)(v94 + 16) = xmmword_24792B8E0;
    *(float *)(v94 + 32) = sub_24790CF3C(*(double *)&v177);
    *(float *)(v94 + 36) = sub_24790CF3C(*((double *)&v177 + 1));
    *(float *)(v94 + 40) = sub_24790CF3C(*(double *)v179.i64);
    *(float *)(v94 + 44) = sub_24790CF3C(*(double *)&v179.i64[1]);
    sub_2479129FC(v94);
    v179 = v95;
    swift_setDeallocating();
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E38);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v186;
    v177 = v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = xmmword_24792B8E0;
    v97 = v177;
    v98 = MEMORY[0x24BEE1768];
    v99 = sub_247914CD4;
LABEL_84:
    *(float *)(v96 + 32) = sub_24790D450(v97, v98, (uint64_t (*)(void))v99);
    *(float *)(v96 + 36) = sub_24790D450(*((uint64_t *)&v177 + 1), v98, (uint64_t (*)(void))v99);
    *(float *)(v96 + 40) = sub_24790D450(v179.i64[0], v98, (uint64_t (*)(void))v99);
    *(float *)(v96 + 44) = sub_24790D450(v179.i64[1], v98, (uint64_t (*)(void))v99);
    sub_2479129FC(v96);
    v179 = v100;
    swift_setDeallocating();
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    v33 = 7;
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E40);
  if (swift_dynamicCast())
  {
    v101.i32[0] = v185;
    v179 = vmovl_u8(v101);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v33 = 7;
    v102 = swift_allocObject();
    *(_OWORD *)(v102 + 16) = xmmword_24792B8E0;
    *(float *)(v102 + 32) = sub_24790D748(v179.i8[0]);
    *(float *)(v102 + 36) = sub_24790D748(v179.i8[2]);
    *(float *)(v102 + 40) = sub_24790D748(v179.i8[4]);
    v103 = sub_24790D748(v179.i8[6]);
LABEL_91:
    *(float *)(v102 + 44) = v103;
    sub_2479129FC(v102);
    v179 = v105;
    swift_setDeallocating();
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    goto LABEL_31;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E48);
  if (swift_dynamicCast())
  {
    v104.i64[0] = v185;
    v179 = v104;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v33 = 7;
    v102 = swift_allocObject();
    *(_OWORD *)(v102 + 16) = xmmword_24792B8E0;
    *(float *)(v102 + 32) = sub_24790D648(v179.i16[0]);
    *(float *)(v102 + 36) = sub_24790D648(v179.i16[1]);
    *(float *)(v102 + 40) = sub_24790D648(v179.i16[2]);
    v103 = sub_24790D648(v179.i16[3]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E50);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v33 = 7;
    v102 = swift_allocObject();
    *(_OWORD *)(v102 + 16) = xmmword_24792B8E0;
    *(float *)(v102 + 32) = sub_24790D548(v179.i32[0]);
    *(float *)(v102 + 36) = sub_24790D548(v179.i32[1]);
    *(float *)(v102 + 40) = sub_24790D548(v179.i32[2]);
    v103 = sub_24790D548(v179.i32[3]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E58);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v186;
    v177 = v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = xmmword_24792B8E0;
    v97 = v177;
    v98 = MEMORY[0x24BEE4008];
    v99 = sub_247914DE4;
    goto LABEL_84;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E60);
  if (swift_dynamicCast())
  {
    v106.i32[0] = v185;
    v179 = vmovl_u8(v106);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v33 = 7;
    v102 = swift_allocObject();
    *(_OWORD *)(v102 + 16) = xmmword_24792B8E0;
    *(float *)(v102 + 32) = sub_24790D350(v179.i8[0]);
    *(float *)(v102 + 36) = sub_24790D350(v179.i8[2]);
    *(float *)(v102 + 40) = sub_24790D350(v179.i8[4]);
    v103 = sub_24790D350(v179.i8[6]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E68);
  if (swift_dynamicCast())
  {
    v107.i64[0] = v185;
    v179 = v107;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v33 = 7;
    v102 = swift_allocObject();
    *(_OWORD *)(v102 + 16) = xmmword_24792B8E0;
    *(float *)(v102 + 32) = sub_24790D250(v179.i16[0]);
    *(float *)(v102 + 36) = sub_24790D250(v179.i16[1]);
    *(float *)(v102 + 40) = sub_24790D250(v179.i16[2]);
    v103 = sub_24790D250(v179.i16[3]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E70);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v33 = 7;
    v102 = swift_allocObject();
    *(_OWORD *)(v102 + 16) = xmmword_24792B8E0;
    *(float *)(v102 + 32) = sub_24790D150(v179.i32[0]);
    *(float *)(v102 + 36) = sub_24790D150(v179.i32[1]);
    *(float *)(v102 + 40) = sub_24790D150(v179.i32[2]);
    v103 = sub_24790D150(v179.i32[3]);
    goto LABEL_91;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E78);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v186;
    v177 = v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v108 = swift_allocObject();
    *(_OWORD *)(v108 + 16) = xmmword_24792B8E0;
    v109 = MEMORY[0x24BEE4568];
    *(float *)(v108 + 32) = sub_24790D450(v177, MEMORY[0x24BEE4568], (uint64_t (*)(void))sub_247912AB0);
    *(float *)(v108 + 36) = sub_24790D450(*((uint64_t *)&v177 + 1), v109, (uint64_t (*)(void))sub_247912AB0);
    *(float *)(v108 + 40) = sub_24790D450(v179.i64[0], v109, (uint64_t (*)(void))sub_247912AB0);
    *(float *)(v108 + 44) = sub_24790D450(v179.i64[1], v109, (uint64_t (*)(void))sub_247912AB0);
    sub_2479129FC(v108);
    v179 = v110;
    swift_setDeallocating();
    swift_deallocClassInstance();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v111 = v180;
    *v180 = v179;
    v111[1].i64[0] = 0;
    v111[1].i64[1] = 0;
    v111[2].i8[0] = 7;
    return result;
  }
  type metadata accessor for simd_quatf(0);
  if (swift_dynamicCast())
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    v112 = *((_QWORD *)&v185 + 1);
    v113 = v185;
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v114 = v180;
    v180->i64[0] = v113;
    v114->i64[1] = v112;
    v114[1].i64[0] = 0;
    v114[1].i64[1] = 0;
    v115 = 8;
    goto LABEL_118;
  }
  type metadata accessor for simd_float2x2(0);
  if (swift_dynamicCast())
  {
    v116 = v185;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EA0);
    v117 = swift_allocObject();
    *(_OWORD *)(v117 + 16) = xmmword_24792B900;
    *(_OWORD *)(v117 + 32) = v116;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v114 = v180;
    v180->i64[0] = v117;
    v114->i64[1] = 0;
    v114[1].i64[0] = 0;
    v114[1].i64[1] = 0;
    v115 = 9;
    goto LABEL_118;
  }
  type metadata accessor for simd_float3x3(0);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    v177 = v186;
    v176 = v187;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E98);
    v118 = (_OWORD *)swift_allocObject();
    v119 = v179;
    v118[1] = xmmword_24792B8F0;
    v118[2] = v119;
    v120 = v176;
    v118[3] = v177;
    v118[4] = v120;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v114 = v180;
    v180->i64[0] = (uint64_t)v118;
    v114->i64[1] = 0;
    v114[1].i64[0] = 0;
    v114[1].i64[1] = 0;
    v115 = 10;
    goto LABEL_118;
  }
  type metadata accessor for simd_float4x4(0);
  if (swift_dynamicCast())
  {
    v179 = (uint16x8_t)v185;
    v177 = v186;
    v176 = v187;
    v175 = v188;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E88);
    v121 = (_OWORD *)swift_allocObject();
    v122 = v179;
    v121[1] = xmmword_24792B8E0;
    v121[2] = v122;
    v123 = v176;
    v121[3] = v177;
    v121[4] = v123;
    v121[5] = v175;
LABEL_112:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v114 = v180;
    v180->i64[0] = (uint64_t)v121;
    v114->i64[1] = 0;
    v114[1].i64[0] = 0;
    v114[1].i64[1] = 0;
    v115 = 11;
    goto LABEL_118;
  }
  type metadata accessor for simd_double4x4(0);
  if (swift_dynamicCast())
  {
    v171 = v186;
    v170 = v185;
    v173 = v188;
    v172 = v187;
    v175 = v190;
    v174 = v189;
    v177 = v192;
    v176 = v191;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E88);
    v121 = (_OWORD *)swift_allocObject();
    v179 = (uint16x8_t)xmmword_24792B8E0;
    v121[1] = xmmword_24792B8E0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
    v124 = swift_allocObject();
    *(uint16x8_t *)(v124 + 16) = v179;
    *(float *)(v124 + 32) = sub_24790CF3C(*(double *)&v170);
    *(float *)(v124 + 36) = sub_24790CF3C(*((double *)&v170 + 1));
    *(float *)(v124 + 40) = sub_24790CF3C(*(double *)&v171);
    *(float *)(v124 + 44) = sub_24790CF3C(*((double *)&v171 + 1));
    sub_2479129FC(v124);
    v171 = v125;
    swift_setDeallocating();
    swift_deallocClassInstance();
    v121[2] = v171;
    v126 = swift_allocObject();
    *(uint16x8_t *)(v126 + 16) = v179;
    *(float *)(v126 + 32) = sub_24790CF3C(*(double *)&v172);
    *(float *)(v126 + 36) = sub_24790CF3C(*((double *)&v172 + 1));
    *(float *)(v126 + 40) = sub_24790CF3C(*(double *)&v173);
    *(float *)(v126 + 44) = sub_24790CF3C(*((double *)&v173 + 1));
    sub_2479129FC(v126);
    v173 = v127;
    swift_setDeallocating();
    swift_deallocClassInstance();
    v121[3] = v173;
    v128 = swift_allocObject();
    *(uint16x8_t *)(v128 + 16) = v179;
    *(float *)(v128 + 32) = sub_24790CF3C(*(double *)&v174);
    *(float *)(v128 + 36) = sub_24790CF3C(*((double *)&v174 + 1));
    *(float *)(v128 + 40) = sub_24790CF3C(*(double *)&v175);
    *(float *)(v128 + 44) = sub_24790CF3C(*((double *)&v175 + 1));
    sub_2479129FC(v128);
    v175 = v129;
    swift_setDeallocating();
    swift_deallocClassInstance();
    v121[4] = v175;
    v130 = swift_allocObject();
    *(uint16x8_t *)(v130 + 16) = v179;
    *(float *)(v130 + 32) = sub_24790CF3C(*(double *)&v176);
    *(float *)(v130 + 36) = sub_24790CF3C(*((double *)&v176 + 1));
    *(float *)(v130 + 40) = sub_24790CF3C(*(double *)&v177);
    *(float *)(v130 + 44) = sub_24790CF3C(*((double *)&v177 + 1));
    sub_2479129FC(v130);
    v179 = v131;
    swift_setDeallocating();
    swift_deallocClassInstance();
    v121[5] = v179;
    goto LABEL_112;
  }
  if (swift_dynamicCast())
  {
    (*(void (**)(__int128 *, char *, char *))(v17 + 32))(v25, v28, v16);
    (*(void (**)(char *, __int128 *, char *))(v17 + 16))(v21, v25, v16);
    v132 = sub_2479294AC();
    v134 = v133;
    (*(void (**)(__int128 *, char *))(v17 + 8))(v25, v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v114 = v180;
    v180->i64[0] = v132;
    v114->i64[1] = v134;
LABEL_117:
    v114[1].i64[0] = 0;
    v114[1].i64[1] = 0;
    v115 = 4;
    goto LABEL_118;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E80);
  if (swift_dynamicCast())
  {
    sub_247903C60(&v185, (uint64_t)v182);
    __swift_project_boxed_opaque_existential_1(v182, (uint64_t)v183);
    sub_2479292E4();
    sub_2479105C0(v175);
    v12[1](v15, v11);
    v135 = sub_2479294B8();
    v137 = v136;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v182);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v114 = v180;
    v180->i64[0] = v135;
    v114->i64[1] = v137;
    goto LABEL_117;
  }
  if (!swift_dynamicCast())
  {
    if (swift_dynamicCast())
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
      v145 = *((_QWORD *)&v185 + 1);
      v144 = v185;
    }
    else
    {
      if (swift_dynamicCast())
      {
        v146 = v178;
        sub_2479104F4((uint64_t)v178, (uint64_t)&v185);
        v147 = sub_2479294C4();
        v149 = v148;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v146);
        result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
        v114 = v180;
        v180->i64[0] = v147;
        v114->i64[1] = v149;
        v114[1].i64[0] = 0;
        v114[1].i64[1] = 0;
        v115 = 18;
        goto LABEL_118;
      }
      __swift_project_boxed_opaque_existential_1(v178, *((_QWORD *)v178 + 3));
      DynamicType = swift_getDynamicType();
      if (swift_isClassType())
        v151 = DynamicType;
      else
        v151 = 0;
      if (v151)
      {
        v152 = *((_QWORD *)v178 + 3);
        v153 = __swift_project_boxed_opaque_existential_1(v178, v152);
        v154 = *(_QWORD *)(v152 - 8);
        MEMORY[0x24BDAC7A8](v153, v153);
        v156 = (char *)&v170 - ((v155 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v154 + 16))(v156);
        v157 = (const void *)sub_247929A1C();
        (*(void (**)(char *, uint64_t))(v154 + 8))(v156, v152);
        v158 = CFGetTypeID(v157);
        swift_unknownObjectRelease();
        if (v158 == CGColorGetTypeID())
        {
          sub_2479109C8(v178, &v185);
          type metadata accessor for CGColor(0);
          swift_dynamicCast();
          v159 = v182[0];
          result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
          v114 = v180;
          v180->i64[0] = v159;
          v114->i64[1] = 0;
          v114[1].i64[0] = 0;
          v114[1].i64[1] = 0;
          v115 = 14;
          goto LABEL_118;
        }
      }
      else
      {
        CGColorGetTypeID();
        v158 = 0;
      }
      type metadata accessor for CMClock(0);
      v160 = MEMORY[0x249583F90]();
      if (!v151 || v158 != v160)
      {
        type metadata accessor for CMTimebase(0);
        v161 = MEMORY[0x249583FA8]();
        if (!v151 || v158 != v161)
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
          result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
          v114 = v180;
          *v180 = 0u;
          v114[1] = 0u;
          v115 = -1;
          goto LABEL_118;
        }
      }
      v162 = v178;
      v163 = *((_QWORD *)v178 + 3);
      v164 = __swift_project_boxed_opaque_existential_1(v178, v163);
      v165 = *(_QWORD *)(v163 - 8);
      MEMORY[0x24BDAC7A8](v164, v164);
      v167 = (char *)&v170 - ((v166 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v165 + 16))(v167);
      v168 = sub_247929A1C();
      (*(void (**)(char *, uint64_t))(v165 + 8))(v167, v163);
      swift_unknownObjectRelease();
      *(_QWORD *)&v185 = v168;
      v144 = sub_247929B48();
      v145 = v169;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v162);
    }
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
    v114 = v180;
    v180->i64[0] = v144;
    v114->i64[1] = v145;
    v114[1].i64[0] = 0;
    v114[1].i64[1] = 0;
    v115 = 13;
    goto LABEL_118;
  }
  v138 = v177;
  v139 = v176;
  v140 = v179.i64[0];
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v177 + 32))(v176, v174, v179.i64[0]);
  v141 = sub_247929314();
  v143 = v142;
  (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v139, v140);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v178);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v193);
  v114 = v180;
  v180->i64[0] = v141;
  v114->i64[1] = v143;
  v114[1].i64[0] = 0;
  v114[1].i64[1] = 0;
  v115 = 12;
LABEL_118:
  v114[2].i8[0] = v115;
  return result;
}

uint64_t sub_2479104F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for simd_quatf(uint64_t a1)
{
  sub_2479109EC(a1, &qword_2576C7F60);
}

void type metadata accessor for simd_float2x2(uint64_t a1)
{
  sub_2479109EC(a1, &qword_2576C7F58);
}

void type metadata accessor for simd_float3x3(uint64_t a1)
{
  sub_2479109EC(a1, &qword_2576C7F50);
}

void type metadata accessor for simd_float4x4(uint64_t a1)
{
  sub_2479109EC(a1, &qword_2576C7F48);
}

void type metadata accessor for simd_double4x4(uint64_t a1)
{
  sub_2479109EC(a1, &qword_2576C7F40);
}

void type metadata accessor for CMClock(uint64_t a1)
{
  sub_2479109EC(a1, &qword_2576C7F38);
}

void type metadata accessor for CMTimebase(uint64_t a1)
{
  sub_2479109EC(a1, &qword_2576C7F30);
}

uint64_t sub_2479105C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  void (*v46)(char *, char *, uint64_t);
  char *v47;
  char *v48;
  uint64_t v49;
  _QWORD v50[2];
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7FE0);
  v4 = MEMORY[0x24BDAC7A8](v55, v3);
  v53 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v50 - v7;
  v9 = sub_247929284();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0];
  v59 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v12, v15);
  v18 = (char *)v50 - v17;
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v56 = (char *)v50 - v21;
  MEMORY[0x24BDAC7A8](v20, v22);
  v24 = (char *)v50 - v23;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7FE8);
  v26 = MEMORY[0x24BDAC7A8](v54, v25);
  v52 = (char *)v50 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26, v28);
  v51 = (uint64_t)v50 - v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7FF0);
  MEMORY[0x24BDAC7A8](v30, v31);
  v33 = (char *)v50 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_247929278();
  v35 = sub_247902A20(&qword_2576C7FF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC290], MEMORY[0x24BDCC2B0]);
  v60 = v1;
  v57 = v35;
  v58 = v34;
  sub_24792968C();
  sub_247902A20(&qword_2576C8000, v10, MEMORY[0x24BDCC508]);
  result = sub_247929488();
  if ((result & 1) != 0)
  {
    v50[1] = a1;
    v37 = v59;
    v38 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
    v38(v24, v33, v9);
    v39 = v56;
    sub_247929698();
    v50[0] = v24;
    v38(v18, v24, v9);
    v38(v14, v39, v9);
    sub_247914FC4((uint64_t)v33, &qword_2576C7FF0);
    sub_247902A20(&qword_2576C8008, (uint64_t (*)(uint64_t))MEMORY[0x24BDCC4F0], MEMORY[0x24BDCC500]);
    v40 = sub_24792947C();
    v41 = *(void (**)(char *, uint64_t))(v37 + 8);
    v41(v14, v9);
    result = ((uint64_t (*)(char *, uint64_t))v41)(v18, v9);
    if ((v40 & 1) != 0)
    {
      v42 = (uint64_t)v52;
      v43 = v53;
      v44 = v55;
      v45 = &v8[*(int *)(v55 + 48)];
      v46 = *(void (**)(char *, char *, uint64_t))(v59 + 32);
      v46(v8, (char *)v50[0], v9);
      v46(v45, v56, v9);
      v47 = &v43[*(int *)(v44 + 48)];
      v38(v43, v8, v9);
      v38(v47, v45, v9);
      v46((char *)v42, v43, v9);
      v41(v47, v9);
      v48 = &v43[*(int *)(v44 + 48)];
      v46(v43, v8, v9);
      v46(v48, v45, v9);
      v46((char *)(v42 + *(int *)(v54 + 36)), v48, v9);
      v41(v43, v9);
      v49 = v51;
      sub_247914F7C(v42, v51);
      sub_2479296BC();
      return sub_247914FC4(v49, &qword_2576C7FE8);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

_OWORD *sub_2479109C8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_2479109EC(a1, &qword_2576C7F28);
}

void sub_2479109EC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_247910A34(float32x2_t *a1, float32x2_t *a2)
{
  float32x2_t v2;
  float32x2_t *v3;
  float32x2_t *v4;
  uint64_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  int32x2_t v9;
  BOOL v11;

  v2 = a1[2];
  if (*(_QWORD *)&v2 != *(_QWORD *)&a2[2])
    return 0;
  if (!*(_QWORD *)&v2 || a1 == a2)
    return 1;
  v3 = a1 + 4;
  v4 = a2 + 4;
  v5 = *(_QWORD *)&v2 - 1;
  do
  {
    v6 = *v3++;
    v7 = v6;
    v8 = *v4++;
    v9 = vceq_f32(v7, v8);
    v11 = v5-- != 0;
  }
  while ((v9.i8[0] & v9.i8[4] & 1) != 0 && v11);
  return v9.i8[0] & v9.i8[4] & 1;
}

BOOL sub_247910AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  _BOOL8 result;
  float v10;
  float v11;
  __int128 v13;
  __int128 v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = 0;
  v4 = a1 + 32;
  do
  {
    v5 = 0;
    v6 = 16 * v3++;
    v7 = *(_OWORD *)(v4 + v6);
    v8 = *(_OWORD *)(a2 + 32 + v6);
    while (1)
    {
      v13 = v7;
      v10 = *(float *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      v14 = v8;
      v11 = *(float *)((unint64_t)&v14 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      result = v10 == v11;
      if (v5 == 2)
        break;
      while (1)
      {
        ++v5;
        if (result)
          break;
        result = 0;
        if (v5 == 2)
          return result;
      }
    }
  }
  while (v10 == v11 && v3 != v2);
  return result;
}

BOOL sub_247910B60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  _BOOL8 result;
  float v10;
  float v11;
  __int128 v13;
  __int128 v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = 0;
  v4 = a1 + 32;
  do
  {
    v5 = 0;
    v6 = 16 * v3++;
    v7 = *(_OWORD *)(v4 + v6);
    v8 = *(_OWORD *)(a2 + 32 + v6);
    while (1)
    {
      v13 = v7;
      v10 = *(float *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      v14 = v8;
      v11 = *(float *)((unint64_t)&v14 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      result = v10 == v11;
      if (v5 == 3)
        break;
      while (1)
      {
        ++v5;
        if (result)
          break;
        result = 0;
        if (v5 == 3)
          return result;
      }
    }
  }
  while (v10 == v11 && v3 != v2);
  return result;
}

uint64_t sub_247910C20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  char v6;
  __int128 v7;
  char v8;
  BOOL v10;
  _OWORD v12[2];
  char v13;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      v8 = 1;
    }
    else
    {
      v3 = v2 - 1;
      v4 = a2 + 64;
      v5 = (_BYTE *)(a1 + 64);
      do
      {
        v6 = *v5;
        v7 = *((_OWORD *)v5 - 1);
        v12[0] = *((_OWORD *)v5 - 2);
        v12[1] = v7;
        v13 = v6;
        _s26SpatialInspectorFoundation0B13PropertyValueO2eeoiySbAC_ACtFZ_0((uint64_t)v12);
        v10 = v3-- != 0;
        if ((v8 & 1) == 0)
          break;
        v4 += 48;
        v5 += 48;
      }
      while (v10);
    }
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_247910CC8(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  char v28;
  char v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  _OWORD v34[2];
  char v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v30 = result + 64;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 64);
  v31 = (unint64_t)(v4 + 63) >> 6;
  if (!v6)
    goto LABEL_7;
LABEL_6:
  v32 = (v6 - 1) & v6;
  v33 = v3;
  for (i = __clz(__rbit64(v6)) | (v3 << 6); ; i = __clz(__rbit64(v9)) + (v10 << 6))
  {
    v12 = result;
    v13 = (uint64_t *)(*(_QWORD *)(result + 48) + 24 * i);
    v14 = *v13;
    v15 = v13[1];
    v16 = v13[2];
    v17 = *(_QWORD *)(result + 56) + 48 * i;
    v18 = *(_QWORD *)(v17 + 8);
    v20 = *(_QWORD *)(v17 + 16);
    v21 = *(_QWORD *)(v17 + 24);
    v22 = *(_BYTE *)(v17 + 32);
    v36 = *(void **)v17;
    v19 = v36;
    v37 = v18;
    v38 = v20;
    v39 = v21;
    v40 = v22;
    swift_bridgeObjectRetain();
    sub_24790D864(v19, v18, v20, v21, v22);
    v23 = sub_24791239C(v14, v15, v16);
    LOBYTE(v16) = v24;
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
    {
      sub_247914250(v19, v18, v20, v21, v22);
      return 0;
    }
    v25 = *(_QWORD *)(a2 + 56) + 48 * v23;
    v26 = *(_BYTE *)(v25 + 32);
    v27 = *(_OWORD *)(v25 + 16);
    v34[0] = *(_OWORD *)v25;
    v34[1] = v27;
    v35 = v26;
    _s26SpatialInspectorFoundation0B13PropertyValueO2eeoiySbAC_ACtFZ_0((uint64_t)v34);
    v29 = v28;
    sub_247914250(v19, v18, v20, v21, v22);
    if ((v29 & 1) == 0)
      return 0;
    result = v12;
    v6 = v32;
    v3 = v33;
    if (v32)
      goto LABEL_6;
LABEL_7:
    v8 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v8 >= v31)
      return 1;
    v9 = *(_QWORD *)(v30 + 8 * v8);
    v10 = v3 + 1;
    if (!v9)
    {
      v10 = v3 + 2;
      if (v3 + 2 >= v31)
        return 1;
      v9 = *(_QWORD *)(v30 + 8 * v10);
      if (!v9)
      {
        v10 = v3 + 3;
        if (v3 + 3 >= v31)
          return 1;
        v9 = *(_QWORD *)(v30 + 8 * v10);
        if (!v9)
        {
          v10 = v3 + 4;
          if (v3 + 4 >= v31)
            return 1;
          v9 = *(_QWORD *)(v30 + 8 * v10);
          if (!v9)
            break;
        }
      }
    }
LABEL_22:
    v32 = (v9 - 1) & v9;
    v33 = v10;
  }
  v11 = v3 + 5;
  if (v3 + 5 >= v31)
    return 1;
  v9 = *(_QWORD *)(v30 + 8 * v11);
  if (v9)
  {
    v10 = v3 + 5;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v10 >= v31)
      return 1;
    v9 = *(_QWORD *)(v30 + 8 * v10);
    ++v11;
    if (v9)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

void InspectorPropertyValue.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_247910FA0()
{
  sub_247929AB8();
  return sub_247929ADC();
}

void sub_2479112E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_247929AB8();
  v1 = *(_QWORD *)(v0 + 16);
  sub_247929AB8();
  if (v1)
  {
    v2 = v0 + 64;
    do
    {
      InspectorPropertyValue.hash(into:)();
      v2 += 48;
      --v1;
    }
    while (v1);
  }
  JUMPOUT(0x2479112CCLL);
}

uint64_t sub_24791133C()
{
  uint64_t v0;
  uint64_t v1;

  sub_247929AB8();
  return sub_2479124FC(v0, v1);
}

void sub_24791136C()
{
  uint64_t v0;

  sub_247929AB8();
  if (v0)
  {
    sub_247929AC4();
    swift_bridgeObjectRetain();
    sub_2479294E8();
    JUMPOUT(0x2479113B4);
  }
  sub_247929AC4();
  JUMPOUT(0x2479112CCLL);
}

uint64_t InspectorPropertyValue.hashValue.getter()
{
  sub_247929AAC();
  InspectorPropertyValue.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_247911434()
{
  sub_247929AAC();
  InspectorPropertyValue.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_247911488()
{
  sub_247929AAC();
  InspectorPropertyValue.hash(into:)();
  return sub_247929AE8();
}

id sub_2479114D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = *(void **)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(a1 + 32) = v6;
  return sub_24790D864(v2, v3, v4, v5, v6);
}

void InspectorPropertyValue.description.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_247911528()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_247911794()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2479117C0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.init(any:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_247929794();
  v6 = v5;
  v7 = sub_2479297A0();
  result = sub_24791435C(a1);
  *a2 = v4;
  a2[1] = v6;
  a2[2] = v7;
  return result;
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  return sub_247929AB8();
}

BOOL static InspectorPropertyValue.WrappedDictionaryKey.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1])
    return v2 == v3;
  v5 = sub_247929A28();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t sub_2479118CC()
{
  _BYTE *v0;

  if (*v0)
    return 1752392040;
  else
    return 1701667182;
}

uint64_t sub_2479118F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247914BC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247911914()
{
  sub_247914390();
  return sub_247929B54();
}

uint64_t sub_24791193C()
{
  sub_247914390();
  return sub_247929B60();
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7F00);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247914390();
  sub_247929B00();
  v12 = 0;
  sub_247929998();
  if (!v2)
  {
    v11 = 1;
    sub_2479299BC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v7, v4);
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.hashValue.getter()
{
  sub_247929AAC();
  sub_2479294E8();
  sub_247929AB8();
  return sub_247929AE8();
}

uint64_t InspectorPropertyValue.WrappedDictionaryKey.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  char v16;
  char v17;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7F08);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247914390();
  sub_247929AF4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v17 = 0;
  v10 = sub_2479298E4();
  v12 = v11;
  v16 = 1;
  swift_bridgeObjectRetain();
  v13 = sub_247929908();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *a2 = v10;
  a2[1] = v12;
  a2[2] = v13;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247911C78()
{
  sub_247929AAC();
  sub_2479294E8();
  sub_247929AB8();
  return sub_247929AE8();
}

uint64_t sub_247911CD8()
{
  sub_2479294E8();
  return sub_247929AB8();
}

uint64_t sub_247911D0C()
{
  sub_247929AAC();
  sub_2479294E8();
  sub_247929AB8();
  return sub_247929AE8();
}

uint64_t sub_247911D68@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return InspectorPropertyValue.WrappedDictionaryKey.init(from:)(a1, a2);
}

uint64_t sub_247911D7C(_QWORD *a1)
{
  return InspectorPropertyValue.WrappedDictionaryKey.encode(to:)(a1);
}

BOOL sub_247911D90(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1])
    return v2 == v3;
  v5 = sub_247929A28();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t sub_247911DE8(uint64_t a1)
{
  MEMORY[0x249584764](&unk_24792B8A8, a1);
  return sub_247929350();
}

uint64_t sub_247911E24()
{
  MEMORY[0x249584764](&unk_24792B8A8);
  return sub_247929344();
}

uint64_t sub_247911E6C(uint64_t a1, uint64_t a2)
{
  sub_247929AAC();
  MEMORY[0x249584764](&unk_24792B8A8, a2);
  sub_247929344();
  return sub_247929AE8();
}

uint64_t sub_247911EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x249584764](&unk_24792B8A8, a3);
  return sub_247929338();
}

void sub_247911F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_247911F70(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
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
    JUMPOUT(0x247912154);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_247912178(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2479121D4()
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
  sub_247911F10((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_247902878(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

unint64_t sub_24791239C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_247929AAC();
  sub_2479294E8();
  sub_247929AB8();
  v6 = sub_247929AE8();
  return sub_24791241C(a1, a2, a3, v6);
}

unint64_t sub_24791241C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
      if ((v15 || (sub_247929A28() & 1) != 0) && v14 == a3)
        break;
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

uint64_t sub_2479124FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;

  v20 = a2 + 64;
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v19 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v8 = __clz(__rbit64(v4));
      v4 &= v4 - 1;
      v9 = v8 | (v7 << 6);
      goto LABEL_5;
    }
    v16 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v16 >= v19)
      goto LABEL_19;
    v17 = *(_QWORD *)(v20 + 8 * v16);
    ++v7;
    if (!v17)
    {
      v7 = v16 + 1;
      if (v16 + 1 >= v19)
        goto LABEL_19;
      v17 = *(_QWORD *)(v20 + 8 * v7);
      if (!v17)
        break;
    }
LABEL_18:
    v4 = (v17 - 1) & v17;
    v9 = __clz(__rbit64(v17)) + (v7 << 6);
LABEL_5:
    v10 = *(_QWORD *)(a2 + 56) + 48 * v9;
    v11 = *(void **)v10;
    v12 = *(_QWORD *)(v10 + 8);
    v13 = *(_QWORD *)(v10 + 16);
    v14 = *(_QWORD *)(v10 + 24);
    v15 = *(_BYTE *)(v10 + 32);
    swift_bridgeObjectRetain();
    sub_24790D864(v11, v12, v13, v14, v15);
    sub_2479294E8();
    sub_247929AB8();
    swift_bridgeObjectRelease();
    InspectorPropertyValue.hash(into:)();
    sub_247914250(v11, v12, v13, v14, v15);
    result = sub_247929AE8();
    v6 ^= result;
  }
  v18 = v16 + 2;
  if (v18 >= v19)
  {
LABEL_19:
    swift_release();
    return sub_247929AB8();
  }
  v17 = *(_QWORD *)(v20 + 8 * v18);
  if (v17)
  {
    v7 = v18;
    goto LABEL_18;
  }
  while (1)
  {
    v7 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v7 >= v19)
      goto LABEL_19;
    v17 = *(_QWORD *)(v20 + 8 * v7);
    ++v18;
    if (v17)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_247912714(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_247929AB8();
  if (v3)
  {
    v5 = a2 + 32;
    do
    {
      v5 += 16;
      sub_247929AD0();
      sub_247929AD0();
      sub_247929AD0();
      result = sub_247929AD0();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_2479127B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_247929AB8();
  if (v3)
  {
    v5 = a2 + 32;
    do
    {
      v5 += 16;
      sub_247929AD0();
      sub_247929AD0();
      result = sub_247929AD0();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_247912840(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_247929AB8();
  if (v3)
  {
    v5 = a2 + 32;
    do
    {
      v5 += 8;
      sub_247929AD0();
      result = sub_247929AD0();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_2479128B8()
{
  sub_247929AD0();
  sub_247929AD0();
  sub_247929AD0();
  return sub_247929AD0();
}

uint64_t sub_24791292C()
{
  sub_247929AD0();
  sub_247929AD0();
  return sub_247929AD0();
}

uint64_t sub_24791298C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  __int128 v4;
  int v5;
  __int128 v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = 0;
    v3 = 3;
    if ((unint64_t)(v1 - 1) < 3)
      v3 = v1 - 1;
    v4 = 0uLL;
    do
    {
      if ((unint64_t)(v1 - 1) > 2)
      {
        __break(1u);
        goto LABEL_10;
      }
      v5 = *(_DWORD *)(result + 32 + 4 * v2);
      v6 = v4;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v5;
      v4 = v6;
      ++v2;
    }
    while (v1 != v2);
    if (v3 < 2)
      goto LABEL_10;
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  return result;
}

uint64_t sub_2479129FC(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  __int128 v4;
  int v5;
  __int128 v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = 0;
    v3 = 4;
    if ((unint64_t)(v1 - 1) < 4)
      v3 = v1 - 1;
    v4 = 0uLL;
    do
    {
      if ((unint64_t)(v1 - 1) > 3)
      {
        __break(1u);
        goto LABEL_10;
      }
      v5 = *(_DWORD *)(result + 32 + 4 * v2);
      v6 = v4;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v5;
      v4 = v6;
      ++v2;
    }
    while (v1 != v2);
    if (v3 < 3)
      goto LABEL_10;
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  return result;
}

unint64_t sub_247912A6C()
{
  unint64_t result;

  result = qword_2576C7EA8;
  if (!qword_2576C7EA8)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_2576C7EA8);
  }
  return result;
}

unint64_t sub_247912AB0()
{
  unint64_t result;

  result = qword_2576C7EB0;
  if (!qword_2576C7EB0)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_2576C7EB0);
  }
  return result;
}

unint64_t sub_247912AF4()
{
  unint64_t result;

  result = qword_2576C7EB8;
  if (!qword_2576C7EB8)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE4048], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_2576C7EB8);
  }
  return result;
}

uint64_t sub_247912B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

  result = sub_247929254();
  v11 = result;
  if (result)
  {
    result = sub_24792926C();
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
  v14 = sub_247929260();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_247911F10(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void _s26SpatialInspectorFoundation0B13PropertyValueO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

BOOL sub_247912C44()
{
  unint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;

  if (v6)
  {
    v12 = v0;
    sub_24790D864(v4, v0, v5, v7, v6);
    sub_247914250(v8, v9, v3, v1, v2);
    sub_247914250(v4, v12, v5, v7, v6);
    return 0;
  }
  else
  {
    v10 = v0;
    sub_247914250(v8, v9, v3, v1, 0);
    sub_247914250(v4, v10, v5, v7, 0);
    return v8 == v4;
  }
}

void sub_247913D1C(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  char v12;

  if (a1 == BYTE6(v1))
  {
    if (a1 >= 1)
    {
      v9 = v6;
      v10 = v1;
      sub_24790D864(v4, v1, v5, v9, 15);
      sub_24790D864(v4, v10, v5, v9, 15);
      sub_24790D864(v7, v8, v3, v2, 15);
      sub_247912178((uint64_t)v7, v8);
      v12 = v11;
      sub_247914250(v7, v8, v3, v2, 15);
      sub_247914250(v4, v10, v5, v9, 15);
      if ((v12 & 1) != 0)
        JUMPOUT(0x247914138);
      JUMPOUT(0x247913930);
    }
    sub_24790D864(v4, v1, v5, v6, 15);
    sub_24790D864(v7, v8, v3, v2, 15);
    sub_247914250(v7, v8, v3, v2, 15);
    JUMPOUT(0x24791404CLL);
  }
  sub_24790D864(v4, v1, v5, v6, 15);
  sub_24790D864(v7, v8, v3, v2, 15);
  sub_247914250(v7, v8, v3, v2, 15);
  JUMPOUT(0x24791392CLL);
}

void sub_247913F20(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1)
    JUMPOUT(0x247913F24);
  sub_24790D864(v4, v1, v5, v6, 15);
  sub_24790D864(v7, v8, v3, v2, 15);
  sub_247914250(v7, v8, v3, v2, 15);
  JUMPOUT(0x24791404CLL);
}

void sub_247914250(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  switch(a5)
  {
    case 4:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 16:
    case 17:
    case 18:
    case 21:
    case 25:
    case 26:
    case 27:
      goto LABEL_3;
    case 14:

      break;
    case 15:
      sub_247902878((uint64_t)a1, a2);
      break;
    case 22:
    case 23:
    case 24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_3:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

unint64_t sub_2479142D8()
{
  unint64_t result;

  result = qword_2576C7EE0;
  if (!qword_2576C7EE0)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue.WrappedDictionaryKey, &type metadata for InspectorPropertyValue.WrappedDictionaryKey);
    atomic_store(result, (unint64_t *)&qword_2576C7EE0);
  }
  return result;
}

uint64_t sub_24791431C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249584764](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24791435C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_247914390()
{
  unint64_t result;

  result = qword_2576CB390[0];
  if (!qword_2576CB390[0])
  {
    result = MEMORY[0x249584764](&unk_24792B858, &type metadata for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys);
    atomic_store(result, qword_2576CB390);
  }
  return result;
}

unint64_t sub_2479143D8()
{
  unint64_t result;

  result = qword_2576C7F10;
  if (!qword_2576C7F10)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue, &type metadata for InspectorPropertyValue);
    atomic_store(result, (unint64_t *)&qword_2576C7F10);
  }
  return result;
}

unint64_t sub_247914420()
{
  unint64_t result;

  result = qword_2576C7F18;
  if (!qword_2576C7F18)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue, &type metadata for InspectorPropertyValue);
    atomic_store(result, (unint64_t *)&qword_2576C7F18);
  }
  return result;
}

unint64_t sub_247914468()
{
  unint64_t result;

  result = qword_2576C7F20;
  if (!qword_2576C7F20)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue.WrappedDictionaryKey, &type metadata for InspectorPropertyValue.WrappedDictionaryKey);
    atomic_store(result, (unint64_t *)&qword_2576C7F20);
  }
  return result;
}

void destroy for InspectorPropertyValue(uint64_t a1)
{
  sub_247914250(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for InspectorPropertyValue(uint64_t a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_24790D864(*(id *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for InspectorPropertyValue(uint64_t a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_24790D864(*(id *)a2, v4, v5, v6, v7);
  v8 = *(void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v12 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_247914250(v8, v9, v10, v11, v12);
  return a1;
}

__n128 __swift_memcpy33_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for InspectorPropertyValue(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v3 = *(_BYTE *)(a2 + 32);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  v9 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v3;
  sub_247914250(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorPropertyValue(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xE5 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 229);
  v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 0x1B)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorPropertyValue(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE4)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 229;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xE5)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0xE5)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_BYTE *)(result + 32) = -(char)a2;
  }
  return result;
}

uint64_t sub_24791467C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t sub_247914684(uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2;
  return result;
}

ValueMetadata *type metadata accessor for InspectorPropertyValue()
{
  return &type metadata for InspectorPropertyValue;
}

_QWORD *sub_2479146A0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for InspectorPropertyValue.WrappedDictionaryKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

_QWORD *assignWithTake for InspectorPropertyValue.WrappedDictionaryKey(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorPropertyValue.WrappedDictionaryKey(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for InspectorPropertyValue.WrappedDictionaryKey(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InspectorPropertyValue.WrappedDictionaryKey()
{
  return &type metadata for InspectorPropertyValue.WrappedDictionaryKey;
}

uint64_t storeEnumTagSinglePayload for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24791485C + 4 * byte_24792B3C9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247914890 + 4 * byte_24792B3C4[v4]))();
}

uint64_t sub_247914890(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247914898(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2479148A0);
  return result;
}

uint64_t sub_2479148AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2479148B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2479148B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2479148C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys()
{
  return &type metadata for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys;
}

__n128 __swift_memcpy128_16(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_247914900(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 128))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_247914920(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
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
  *(_BYTE *)(result + 128) = v3;
  return result;
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
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

uint64_t sub_247914980(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2479149A0(uint64_t result, int a2, int a3)
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

__n128 __swift_memcpy48_16(uint64_t a1, uint64_t a2)
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

uint64_t sub_2479149F0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_247914A10(uint64_t result, int a2, int a3)
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

uint64_t getEnumTagSinglePayload for SpatialInspectorVersioningError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SpatialInspectorVersioningError(uint64_t result, int a2, int a3)
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

uint64_t sub_247914A90()
{
  return sub_247902A20(&qword_2576C7F68, (uint64_t (*)(uint64_t))type metadata accessor for CGColor, (uint64_t)&unk_24792B730);
}

unint64_t sub_247914AC0()
{
  unint64_t result;

  result = qword_2576CB9A0[0];
  if (!qword_2576CB9A0[0])
  {
    result = MEMORY[0x249584764](&unk_24792B830, &type metadata for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys);
    atomic_store(result, qword_2576CB9A0);
  }
  return result;
}

unint64_t sub_247914B08()
{
  unint64_t result;

  result = qword_2576CBAB0;
  if (!qword_2576CBAB0)
  {
    result = MEMORY[0x249584764](&unk_24792B7A0, &type metadata for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CBAB0);
  }
  return result;
}

unint64_t sub_247914B50()
{
  unint64_t result;

  result = qword_2576CBAB8[0];
  if (!qword_2576CBAB8[0])
  {
    result = MEMORY[0x249584764](&unk_24792B7C8, &type metadata for InspectorPropertyValue.WrappedDictionaryKey.CodingKeys);
    atomic_store(result, qword_2576CBAB8);
  }
  return result;
}

uint64_t sub_247914B94()
{
  return sub_247902A20(&qword_2576C7F70, (uint64_t (*)(uint64_t))type metadata accessor for CGColor, (uint64_t)&unk_24792B75C);
}

uint64_t sub_247914BC0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1752392040 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_247914C90()
{
  unint64_t result;

  result = qword_2576C7F78;
  if (!qword_2576C7F78)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyID, &type metadata for InspectorPropertyID);
    atomic_store(result, (unint64_t *)&qword_2576C7F78);
  }
  return result;
}

unint64_t sub_247914CD4()
{
  unint64_t result;

  result = qword_2576C7F88;
  if (!qword_2576C7F88)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2576C7F88);
  }
  return result;
}

unint64_t sub_247914D18()
{
  unint64_t result;

  result = qword_2576C7F90;
  if (!qword_2576C7F90)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE3E78], MEMORY[0x24BEE3E50]);
    atomic_store(result, (unint64_t *)&qword_2576C7F90);
  }
  return result;
}

unint64_t sub_247914D5C()
{
  unint64_t result;

  result = qword_2576C7F98;
  if (!qword_2576C7F98)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE3F58], MEMORY[0x24BEE3F30]);
    atomic_store(result, (unint64_t *)&qword_2576C7F98);
  }
  return result;
}

unint64_t sub_247914DA0()
{
  unint64_t result;

  result = qword_2576C7FA0;
  if (!qword_2576C7FA0)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE3FC8], MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_2576C7FA0);
  }
  return result;
}

unint64_t sub_247914DE4()
{
  unint64_t result;

  result = qword_2576C7FA8;
  if (!qword_2576C7FA8)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE4040], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_2576C7FA8);
  }
  return result;
}

unint64_t sub_247914E28()
{
  unint64_t result;

  result = qword_2576C7FB0;
  if (!qword_2576C7FB0)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE4298], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_2576C7FB0);
  }
  return result;
}

unint64_t sub_247914E6C()
{
  unint64_t result;

  result = qword_2576C7FB8;
  if (!qword_2576C7FB8)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE44B8], MEMORY[0x24BEE4478]);
    atomic_store(result, (unint64_t *)&qword_2576C7FB8);
  }
  return result;
}

unint64_t sub_247914EB0()
{
  unint64_t result;

  result = qword_2576C7FC0;
  if (!qword_2576C7FC0)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE4538], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_2576C7FC0);
  }
  return result;
}

unint64_t sub_247914EF4()
{
  unint64_t result;

  result = qword_2576C7FD0;
  if (!qword_2576C7FD0)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE14F0], MEMORY[0x24BEE14E8]);
    atomic_store(result, (unint64_t *)&qword_2576C7FD0);
  }
  return result;
}

unint64_t sub_247914F38()
{
  unint64_t result;

  result = qword_2576C7FD8;
  if (!qword_2576C7FD8)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_2576C7FD8);
  }
  return result;
}

uint64_t sub_247914F7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7FE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247914FC4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t EntityID.id.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t EntityID.id.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*EntityID.id.modify())()
{
  return nullsub_1;
}

uint64_t EntityID.init(id:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t EntityID.description.getter()
{
  return sub_247929A04();
}

uint64_t EntityID.init(extractedFrom:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  __int16 v23;
  unsigned __int8 *v24;
  char v25;
  uint64_t result;
  char v27;
  char v28;
  char v29;
  _QWORD v30[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8010);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30[4] = a1;
  v30[5] = a2;
  v30[2] = 0x3D44495026;
  v30[3] = 0xE500000000000000;
  v10 = sub_24792932C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  sub_247915254();
  sub_24792974C();
  v12 = v11;
  v14 = v13;
  sub_247915298((uint64_t)v9);
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0
    || (v15 = sub_247916504(v12, a1, a2),
        v17 = v16,
        v19 = v18,
        v21 = v20,
        swift_bridgeObjectRelease(),
        sub_247929728() < 1)
    || (v15 ^ v17) < 0x4000)
  {
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v22 = sub_247916434(v15, v17, v19, v21, 10);
    if ((v23 & 0x100) != 0)
    {
      v24 = sub_247915B30(v15, v17, v19, v21, 10);
      v29 = v28;
      result = swift_bridgeObjectRelease();
      if ((v29 & 1) == 0)
      {
LABEL_11:
        v27 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v24 = (unsigned __int8 *)v22;
      v25 = v23;
      result = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
        goto LABEL_11;
    }
  }
  v24 = 0;
  v27 = 1;
LABEL_9:
  *(_QWORD *)a3 = v24;
  *(_BYTE *)(a3 + 8) = v27;
  return result;
}

unint64_t sub_247915254()
{
  unint64_t result;

  result = qword_2576C8018;
  if (!qword_2576C8018)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576C8018);
  }
  return result;
}

uint64_t sub_247915298(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static EntityID.appendID(to:id:)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  sub_247929530();
  sub_247929A04();
  swift_bridgeObjectRetain();
  sub_247929530();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t static EntityID.removeID(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8010);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[2] = a1;
  v20[3] = a2;
  v20[0] = 0x3D44495026;
  v20[1] = 0xE500000000000000;
  v8 = sub_24792932C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_247915254();
  sub_24792974C();
  v10 = v9;
  sub_247915298((uint64_t)v7);
  swift_bridgeObjectRelease();
  v11 = 0;
  if ((v10 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    v12 = sub_2479295A8();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x249583D8C](v12, v14, v16, v18);
    swift_bridgeObjectRelease();
  }
  return v11;
}

BOOL static EntityID.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t EntityID.hash(into:)()
{
  return sub_247929ADC();
}

uint64_t sub_24791552C()
{
  return 1;
}

uint64_t sub_247915534()
{
  sub_247929AAC();
  sub_247929AB8();
  return sub_247929AE8();
}

uint64_t sub_247915574()
{
  return sub_247929AB8();
}

uint64_t sub_247915598()
{
  sub_247929AAC();
  sub_247929AB8();
  return sub_247929AE8();
}

uint64_t sub_2479155D4()
{
  return 25705;
}

uint64_t sub_2479155E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 25705 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_247929A28();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_24791565C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_247915668()
{
  sub_247916550();
  return sub_247929B54();
}

uint64_t sub_247915690()
{
  sub_247916550();
  return sub_247929B60();
}

uint64_t EntityID.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8020);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247916550();
  sub_247929B00();
  sub_2479299EC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t EntityID.hashValue.getter()
{
  sub_247929AAC();
  sub_247929ADC();
  return sub_247929AE8();
}

uint64_t EntityID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8028);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247916550();
  sub_247929AF4();
  if (!v2)
  {
    v10 = sub_247929938();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2479158E8()
{
  sub_247929530();
  sub_247929A04();
  sub_247929530();
  swift_bridgeObjectRelease();
  sub_247929530();
  return 0;
}

uint64_t sub_247915968@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return EntityID.init(from:)(a1, a2);
}

uint64_t sub_24791597C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8020);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247916550();
  sub_247929B00();
  sub_2479299EC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

BOOL sub_247915A64(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247915A78()
{
  sub_247929AAC();
  sub_247929ADC();
  return sub_247929AE8();
}

uint64_t sub_247915ABC()
{
  return sub_247929ADC();
}

uint64_t sub_247915AE4()
{
  sub_247929AAC();
  sub_247929ADC();
  return sub_247929AE8();
}

void sub_247915B24(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unsigned __int8 *sub_247915B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5)
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
  sub_24791688C();
  swift_bridgeObjectRetain();
  v7 = sub_24792959C();
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
  v7 = sub_247915E9C();
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
    v9 = (unsigned __int8 *)sub_247929818();
  }
LABEL_7:
  v13 = sub_247915C20(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_247915C20(unsigned __int8 *result, uint64_t a2, int64_t a3)
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

uint64_t sub_247915E9C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2479295A8();
  v4 = sub_247915F18(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_247915F18(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_24791605C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_247916148(v9, 0);
      v12 = sub_2479161AC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x249583D98](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x249583D98);
LABEL_9:
      sub_247929818();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x249583D98]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_24791605C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_2479163BC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_2479163BC(a2, a3, a4);
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
    return sub_24792956C();
  }
  __break(1u);
  return result;
}

_QWORD *sub_247916148(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8050);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_2479161AC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
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
      result = sub_2479163BC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_247929578();
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
          result = sub_247929818();
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
    result = sub_2479163BC(v12, a6, a7);
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
    v12 = sub_247929554();
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

uint64_t sub_2479163BC(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_247929584();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x249583E1C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_247916434(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int64_t a5)
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
    v11 = (_QWORD *)sub_247929818();
  }
  result = sub_2479168D4((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

unint64_t sub_247916504(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_2479295A8();
  __break(1u);
  return result;
}

unint64_t sub_247916550()
{
  unint64_t result;

  result = qword_2576CBBC0[0];
  if (!qword_2576CBBC0[0])
  {
    result = MEMORY[0x249584764](&unk_24792BB58, &type metadata for EntityID.CodingKeys);
    atomic_store(result, qword_2576CBBC0);
  }
  return result;
}

unint64_t sub_247916594(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_247907018();
  a1[2] = sub_247906BA8();
  a1[3] = sub_2479165D0();
  result = sub_247916614();
  a1[4] = result;
  return result;
}

unint64_t sub_2479165D0()
{
  unint64_t result;

  result = qword_2576C8030;
  if (!qword_2576C8030)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for EntityID, &type metadata for EntityID);
    atomic_store(result, (unint64_t *)&qword_2576C8030);
  }
  return result;
}

unint64_t sub_247916614()
{
  unint64_t result;

  result = qword_2576C8038;
  if (!qword_2576C8038)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for EntityID, &type metadata for EntityID);
    atomic_store(result, (unint64_t *)&qword_2576C8038);
  }
  return result;
}

unint64_t sub_24791665C()
{
  unint64_t result;

  result = qword_2576C8040;
  if (!qword_2576C8040)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for EntityID, &type metadata for EntityID);
    atomic_store(result, (unint64_t *)&qword_2576C8040);
  }
  return result;
}

uint64_t sub_2479166A0()
{
  return MEMORY[0x24BEE4578];
}

ValueMetadata *type metadata accessor for EntityID()
{
  return &type metadata for EntityID;
}

uint64_t getEnumTagSinglePayload for EntityID.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EntityID.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247916750 + 4 * byte_24792B920[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247916770 + 4 * byte_24792B925[v4]))();
}

_BYTE *sub_247916750(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247916770(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247916778(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247916780(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247916788(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247916790(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24791679C()
{
  return 0;
}

ValueMetadata *type metadata accessor for EntityID.CodingKeys()
{
  return &type metadata for EntityID.CodingKeys;
}

unint64_t sub_2479167B8()
{
  unint64_t result;

  result = qword_2576CC050[0];
  if (!qword_2576CC050[0])
  {
    result = MEMORY[0x249584764](&unk_24792BB30, &type metadata for EntityID.CodingKeys);
    atomic_store(result, qword_2576CC050);
  }
  return result;
}

unint64_t sub_247916800()
{
  unint64_t result;

  result = qword_2576CC160;
  if (!qword_2576CC160)
  {
    result = MEMORY[0x249584764](&unk_24792BAA0, &type metadata for EntityID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CC160);
  }
  return result;
}

unint64_t sub_247916848()
{
  unint64_t result;

  result = qword_2576CC168[0];
  if (!qword_2576CC168[0])
  {
    result = MEMORY[0x249584764](&unk_24792BAC8, &type metadata for EntityID.CodingKeys);
    atomic_store(result, qword_2576CC168);
  }
  return result;
}

unint64_t sub_24791688C()
{
  unint64_t result;

  result = qword_2576C8048;
  if (!qword_2576C8048)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_2576C8048);
  }
  return result;
}

uint64_t sub_2479168D4(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int64_t a6)
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
    result = sub_2479163BC(a2, a4, a5);
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
  result = sub_24792956C();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_2479163BC(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_2479163BC(a3, a4, a5);
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
  result = sub_24792956C();
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

uint64_t sub_247916CF0()
{
  return sub_247921388(2, 0, &xmmword_2576D05C0);
}

__int128 *sub_247916D04()
{
  if (qword_2576CC1F0 != -1)
    swift_once();
  return &xmmword_2576D05C0;
}

double sub_247916D44@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_2576CC1F0 != -1)
    swift_once();
  swift_beginAccess();
  result = *(double *)&xmmword_2576D05C0;
  *a1 = xmmword_2576D05C0;
  return result;
}

uint64_t sub_247916DB4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *a1;
  v2 = a1[1];
  if (qword_2576CC1F0 != -1)
    swift_once();
  result = swift_beginAccess();
  *(_QWORD *)&xmmword_2576D05C0 = v1;
  *((_QWORD *)&xmmword_2576D05C0 + 1) = v2;
  return result;
}

uint64_t (*sub_247916E28())()
{
  if (qword_2576CC1F0 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_247916E94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV2() + 20);
  v2 = *(_QWORD *)v1;
  sub_247901BE0(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t type metadata accessor for SpatialInspectorDataV2()
{
  uint64_t result;

  result = qword_2576CC380;
  if (!qword_2576CC380)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247916F10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV2() + 24);
  v2 = *(_QWORD *)v1;
  sub_247901BE0(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_247916F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV2() + 28);
  v2 = *(_QWORD *)v1;
  sub_247901CA4(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

uint64_t sub_247916F90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(int *)(type metadata accessor for SpatialInspectorDataV2() + 32);
  v2 = *(_QWORD *)v1;
  sub_247901CA4(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  return v2;
}

int *sub_247916FD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v19;
  int *result;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;

  v19 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(a9, a1, v19);
  result = (int *)type metadata accessor for SpatialInspectorDataV2();
  v21 = (_QWORD *)(a9 + result[5]);
  *v21 = a2;
  v21[1] = a3;
  v22 = (_QWORD *)(a9 + result[6]);
  *v22 = a4;
  v22[1] = a5;
  v23 = (_QWORD *)(a9 + result[7]);
  *v23 = a6;
  v23[1] = a7;
  v24 = (_QWORD *)(a9 + result[8]);
  *v24 = a8;
  v24[1] = a10;
  return result;
}

uint64_t sub_247917088(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2479170C0 + 4 * byte_24792BBB0[a1]))(0xD000000000000010, 0x8000000247930C60);
}

uint64_t sub_2479170C0()
{
  return 0x536465646F636E65;
}

uint64_t sub_2479170E0(uint64_t a1)
{
  return a1 + 8;
}

uint64_t sub_247917118()
{
  unsigned __int8 *v0;

  return sub_247917088(*v0);
}

uint64_t sub_247917120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24791830C(a1, a2);
  *a3 = result;
  return result;
}

void sub_247917144(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_247917150()
{
  sub_2479173D0();
  return sub_247929B54();
}

uint64_t sub_247917178()
{
  sub_2479173D0();
  return sub_247929B60();
}

uint64_t sub_2479171A0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v12;
  char v13;
  __int128 v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8058);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479173D0();
  sub_247929B00();
  LOBYTE(v14) = 0;
  sub_247929320();
  sub_247902A20(&qword_2576C7768, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_2479299C8();
  if (!v2)
  {
    v10 = (int *)type metadata accessor for SpatialInspectorDataV2();
    v14 = *(_OWORD *)(v3 + v10[5]);
    v13 = 1;
    sub_247902374();
    sub_2479299C8();
    v14 = *(_OWORD *)(v3 + v10[6]);
    v13 = 2;
    sub_2479299C8();
    v14 = *(_OWORD *)(v3 + v10[7]);
    v13 = 3;
    sub_247929974();
    v14 = *(_OWORD *)(v3 + v10[8]);
    v13 = 4;
    sub_247929974();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_2479173D0()
{
  unint64_t result;

  result = qword_2576CC1F8[0];
  if (!qword_2576CC1F8[0])
  {
    result = MEMORY[0x249584764](&unk_24792BD5C, &type metadata for SpatialInspectorDataV2.CodingKeys);
    atomic_store(result, qword_2576CC1F8);
  }
  return result;
}

uint64_t sub_247917414@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  _QWORD *v25;
  __int128 v26;
  char v27;

  v20 = a2;
  v21 = sub_247929320();
  v3 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21, v4);
  v22 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8060);
  v6 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (int *)type metadata accessor for SpatialInspectorDataV2();
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479173D0();
  v24 = v9;
  v14 = (uint64_t)v25;
  sub_247929AF4();
  if (v14)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v19 = v6;
  v25 = a1;
  LOBYTE(v26) = 0;
  sub_247902A20(&qword_2576C7790, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v16 = v21;
  v15 = v22;
  sub_247929914();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v13, v15, v16);
  v27 = 1;
  sub_2479028BC();
  sub_247929914();
  *(_OWORD *)&v13[v10[5]] = v26;
  v27 = 2;
  sub_247929914();
  *(_OWORD *)&v13[v10[6]] = v26;
  v27 = 3;
  sub_2479298C0();
  *(_OWORD *)&v13[v10[7]] = v26;
  v27 = 4;
  sub_2479298C0();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v24, v23);
  *(_OWORD *)&v13[v10[8]] = v26;
  sub_247917828((uint64_t)v13, v20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return sub_247904CA4((uint64_t)v13);
}

uint64_t sub_247917828(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SpatialInspectorDataV2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24791786C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_247902A20(&qword_2576C7888, (uint64_t (*)(uint64_t))type metadata accessor for SpatialInspectorDataV2, (uint64_t)&unk_24792BBDC);
  result = sub_247902A20(qword_2576C8068, (uint64_t (*)(uint64_t))type metadata accessor for SpatialInspectorDataV2, (uint64_t)&unk_24792BC04);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2479178C8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_247917414(a1, a2);
}

uint64_t sub_2479178DC(_QWORD *a1)
{
  return sub_2479171A0(a1);
}

uint64_t *sub_2479178F0(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247929320();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = *v10;
    v12 = v10[1];
    sub_247901BE0(*v10, v12);
    *v9 = v11;
    v9[1] = v12;
    v13 = a3[6];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = *v15;
    v17 = v15[1];
    sub_247901BE0(*v15, v17);
    *v14 = v16;
    v14[1] = v17;
    v18 = a3[7];
    v19 = (char *)a1 + v18;
    v20 = (char *)a2 + v18;
    v21 = *((_QWORD *)v20 + 1);
    if (v21 >> 60 == 15)
    {
      *(_OWORD *)v19 = *(_OWORD *)v20;
    }
    else
    {
      v23 = *(_QWORD *)v20;
      sub_247901BE0(*(_QWORD *)v20, *((_QWORD *)v20 + 1));
      *(_QWORD *)v19 = v23;
      *((_QWORD *)v19 + 1) = v21;
    }
    v24 = a3[8];
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
      sub_247901BE0(*(_QWORD *)v26, *((_QWORD *)v26 + 1));
      *(_QWORD *)v25 = v28;
      *((_QWORD *)v25 + 1) = v27;
    }
  }
  return a1;
}

uint64_t sub_247917A2C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;

  v4 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_247902878(*(_QWORD *)(a1 + a2[5]), *(_QWORD *)(a1 + a2[5] + 8));
  result = sub_247902878(*(_QWORD *)(a1 + a2[6]), *(_QWORD *)(a1 + a2[6] + 8));
  v6 = (uint64_t *)(a1 + a2[7]);
  v7 = v6[1];
  if (v7 >> 60 != 15)
    result = sub_247902878(*v6, v7);
  v8 = (uint64_t *)(a1 + a2[8]);
  v9 = v8[1];
  if (v9 >> 60 != 15)
    return sub_247902878(*v8, v9);
  return result;
}

uint64_t sub_247917AD0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  unint64_t v25;
  uint64_t v26;

  v6 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_247901BE0(*v9, v11);
  *v8 = v10;
  v8[1] = v11;
  v12 = a3[6];
  v13 = (uint64_t *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v15 = *v14;
  v16 = v14[1];
  sub_247901BE0(*v14, v16);
  *v13 = v15;
  v13[1] = v16;
  v17 = a3[7];
  v18 = a1 + v17;
  v19 = (uint64_t *)(a2 + v17);
  v20 = v19[1];
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  else
  {
    v21 = *v19;
    sub_247901BE0(*v19, v19[1]);
    *(_QWORD *)v18 = v21;
    *(_QWORD *)(v18 + 8) = v20;
  }
  v22 = a3[8];
  v23 = a1 + v22;
  v24 = (uint64_t *)(a2 + v22);
  v25 = v24[1];
  if (v25 >> 60 == 15)
  {
    *(_OWORD *)v23 = *(_OWORD *)v24;
  }
  else
  {
    v26 = *v24;
    sub_247901BE0(*v24, v24[1]);
    *(_QWORD *)v23 = v26;
    *(_QWORD *)(v23 + 8) = v25;
  }
  return a1;
}

uint64_t sub_247917BE0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v6 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (uint64_t *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  v11 = v9[1];
  sub_247901BE0(*v9, v11);
  v12 = *v8;
  v13 = v8[1];
  *v8 = v10;
  v8[1] = v11;
  sub_247902878(v12, v13);
  v14 = a3[6];
  v15 = (uint64_t *)(a1 + v14);
  v16 = (uint64_t *)(a2 + v14);
  v17 = *v16;
  v18 = v16[1];
  sub_247901BE0(*v16, v18);
  v19 = *v15;
  v20 = v15[1];
  *v15 = v17;
  v15[1] = v18;
  sub_247902878(v19, v20);
  v21 = a3[7];
  v22 = (uint64_t *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v24 = *(_QWORD *)(a2 + v21 + 8);
  if (*(_QWORD *)(a1 + v21 + 8) >> 60 == 15)
  {
    if (v24 >> 60 != 15)
    {
      v25 = *v23;
      sub_247901BE0(v25, v24);
      *v22 = v25;
      v22[1] = v24;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (v24 >> 60 == 15)
  {
    sub_247902EA8((uint64_t)v22);
LABEL_6:
    *(_OWORD *)v22 = *(_OWORD *)v23;
    goto LABEL_8;
  }
  v26 = *v23;
  sub_247901BE0(v26, v24);
  v27 = *v22;
  v28 = v22[1];
  *v22 = v26;
  v22[1] = v24;
  sub_247902878(v27, v28);
LABEL_8:
  v29 = a3[8];
  v30 = (uint64_t *)(a1 + v29);
  v31 = (uint64_t *)(a2 + v29);
  v32 = *(_QWORD *)(a2 + v29 + 8);
  if (*(_QWORD *)(a1 + v29 + 8) >> 60 != 15)
  {
    if (v32 >> 60 != 15)
    {
      v34 = *v31;
      sub_247901BE0(v34, v32);
      v35 = *v30;
      v36 = v30[1];
      *v30 = v34;
      v30[1] = v32;
      sub_247902878(v35, v36);
      return a1;
    }
    sub_247902EA8((uint64_t)v30);
    goto LABEL_13;
  }
  if (v32 >> 60 == 15)
  {
LABEL_13:
    *(_OWORD *)v30 = *(_OWORD *)v31;
    return a1;
  }
  v33 = *v31;
  sub_247901BE0(v33, v32);
  *v30 = v33;
  v30[1] = v32;
  return a1;
}

uint64_t sub_247917D88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_247917E00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v6 = sub_247929320();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = *(_QWORD *)(a1 + v7);
  v9 = *(_QWORD *)(a1 + v7 + 8);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  sub_247902878(v8, v9);
  v10 = a3[6];
  v11 = *(_QWORD *)(a1 + v10);
  v12 = *(_QWORD *)(a1 + v10 + 8);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  sub_247902878(v11, v12);
  v13 = a3[7];
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = *(_QWORD *)(a1 + v13 + 8);
  if (v16 >> 60 == 15)
    goto LABEL_4;
  v17 = *(_QWORD *)(v15 + 8);
  if (v17 >> 60 == 15)
  {
    sub_247902EA8(v14);
LABEL_4:
    *(_OWORD *)v14 = *(_OWORD *)v15;
    goto LABEL_6;
  }
  v18 = *(_QWORD *)v14;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  *(_QWORD *)(v14 + 8) = v17;
  sub_247902878(v18, v16);
LABEL_6:
  v19 = a3[8];
  v20 = (uint64_t *)(a1 + v19);
  v21 = (uint64_t *)(a2 + v19);
  v22 = *(_QWORD *)(a1 + v19 + 8);
  if (v22 >> 60 != 15)
  {
    v23 = v21[1];
    if (v23 >> 60 != 15)
    {
      v24 = *v20;
      *v20 = *v21;
      v20[1] = v23;
      sub_247902878(v24, v22);
      return a1;
    }
    sub_247902EA8((uint64_t)v20);
  }
  *(_OWORD *)v20 = *(_OWORD *)v21;
  return a1;
}

uint64_t sub_247917F28()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247917F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v6 = sub_247929320();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8) >> 60;
  if (((4 * (_DWORD)v9) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v9) & 0xC | (v9 >> 2));
  else
    return 0;
}

uint64_t sub_247917FC4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247917FD0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD *v10;

  result = sub_247929320();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  v10 = (_QWORD *)(a1 + *(int *)(a4 + 20));
  *v10 = 0;
  v10[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  return result;
}

uint64_t sub_247918058()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247929320();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SpatialInspectorDataV2.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SpatialInspectorDataV2.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2479181B4 + 4 * byte_24792BBBA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2479181E8 + 4 * byte_24792BBB5[v4]))();
}

uint64_t sub_2479181E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2479181F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2479181F8);
  return result;
}

uint64_t sub_247918204(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24791820CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_247918210(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247918218(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SpatialInspectorDataV2.CodingKeys()
{
  return &type metadata for SpatialInspectorDataV2.CodingKeys;
}

unint64_t sub_247918238()
{
  unint64_t result;

  result = qword_2576CC490[0];
  if (!qword_2576CC490[0])
  {
    result = MEMORY[0x249584764](&unk_24792BD34, &type metadata for SpatialInspectorDataV2.CodingKeys);
    atomic_store(result, qword_2576CC490);
  }
  return result;
}

unint64_t sub_247918280()
{
  unint64_t result;

  result = qword_2576CC5A0;
  if (!qword_2576CC5A0)
  {
    result = MEMORY[0x249584764](&unk_24792BCA4, &type metadata for SpatialInspectorDataV2.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CC5A0);
  }
  return result;
}

unint64_t sub_2479182C8()
{
  unint64_t result;

  result = qword_2576CC5A8[0];
  if (!qword_2576CC5A8[0])
  {
    result = MEMORY[0x249584764](&unk_24792BCCC, &type metadata for SpatialInspectorDataV2.CodingKeys);
    atomic_store(result, qword_2576CC5A8);
  }
  return result;
}

uint64_t sub_24791830C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000247930C60 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x536465646F636E65 && a2 == 0xEC000000656E6563 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x8000000247930C80 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000247930CA0 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000247931080)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v5 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_247918520(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x746169636F737361;
  else
    v3 = 0x696D697263736964;
  if (v2)
    v4 = 0xEC0000006574616ELL;
  else
    v4 = 0xEF65756C61566465;
  if ((a2 & 1) != 0)
    v5 = 0x746169636F737361;
  else
    v5 = 0x696D697263736964;
  if ((a2 & 1) != 0)
    v6 = 0xEF65756C61566465;
  else
    v6 = 0xEC0000006574616ELL;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_247929A28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2479185D4()
{
  sub_247929AAC();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  return sub_247929AE8();
}

uint64_t sub_247918668()
{
  sub_2479294E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2479186D4()
{
  sub_247929AAC();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  return sub_247929AE8();
}

uint64_t sub_247918764(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746169636F737361;
  else
    return 0x696D697263736964;
}

uint64_t sub_2479187B0(char *a1, char *a2)
{
  return sub_247918520(*a1, *a2);
}

uint64_t sub_2479187BC()
{
  return sub_2479185D4();
}

uint64_t sub_2479187C4()
{
  return sub_247918668();
}

uint64_t sub_2479187CC()
{
  return sub_2479186D4();
}

uint64_t sub_2479187D4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_247929890();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_247918830@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_247918764(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_247918858()
{
  char *v0;

  return sub_247918764(*v0);
}

uint64_t sub_247918860@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_247929890();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_2479188C0()
{
  sub_247919E58();
  return sub_247929B54();
}

uint64_t sub_2479188E8()
{
  sub_247919E58();
  return sub_247929B60();
}

uint64_t sub_247918910(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65756C6176;
  else
    return 0x6C6562616CLL;
}

uint64_t sub_247918938(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8210);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_OWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791BF88();
  sub_247929B00();
  LOBYTE(v11) = 0;
  sub_247929998();
  if (!v2)
  {
    v11 = v9;
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EC0);
    sub_24791431C(&qword_2576C8218, &qword_2576C7EC0, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_2479299C8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v7, v4);
}

uint64_t sub_247918AA4@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t *v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8220);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791BF88();
  sub_247929AF4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v19) = 0;
  v10 = sub_2479298E4();
  v12 = v11;
  v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EC0);
  v21 = 1;
  sub_24791431C(&qword_2576C8228, &qword_2576C7EC0, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
  swift_bridgeObjectRetain();
  sub_247929914();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v13 = v19;
  v14 = v20;
  v15 = v18;
  *v18 = v10;
  v15[1] = v12;
  v15[2] = v13;
  v15[3] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247918C9C()
{
  char *v0;

  return sub_247918910(*v0);
}

uint64_t sub_247918CA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24791C170(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247918CC8()
{
  sub_24791BF88();
  return sub_247929B54();
}

uint64_t sub_247918CF0()
{
  sub_24791BF88();
  return sub_247929B60();
}

uint64_t sub_247918D18@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_247918AA4(a1, a2);
}

uint64_t sub_247918D2C(_QWORD *a1)
{
  return sub_247918938(a1);
}

void InspectorPropertyValue.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[10];
  uint64_t v12;
  char *v13;

  v3 = sub_247929368();
  v11[9] = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v4);
  v11[8] = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8100);
  v11[6] = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 8);
  v11[4] = *(_QWORD *)(v1 + 16);
  v11[5] = v9;
  v11[7] = *(_QWORD *)(v1 + 24);
  v10 = *(unsigned __int8 *)(v1 + 32);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247919E58();
  v13 = v8;
  sub_247929B00();
  __asm { BR              X9 }
}

uint64_t sub_247918E54()
{
  uint64_t v0;
  void *v1;
  void *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v5 = v0;
  *(_BYTE *)(v4 - 128) = 0;
  sub_247929998();
  if (v1)
  {
    v6 = v2;
    v7 = v1;
    *(_QWORD *)(v4 - 200) = 0;
    v9 = *(_QWORD *)(v4 - 160);
    v8 = *(_QWORD *)(v4 - 152);
    v10 = *(_QWORD *)(v4 - 192);
    v11 = *(_QWORD *)(v4 - 184);
    v12 = *(_QWORD *)(v4 - 168);
    v13 = sub_24790CBA8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v13, v5);
    sub_24790D864(v6, v11, v10, v12, v3);
    v14 = v7;
    sub_24790D864(v6, v11, v10, v12, v3);
    v15 = v7;
    v16 = v11;
    v17 = sub_24792935C();
    v18 = sub_2479296F8();
    *(_QWORD *)(v4 - 168) = v17;
    *(_DWORD *)(v4 - 184) = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      *(_QWORD *)(v4 - 208) = v5;
      v20 = v19;
      *(_QWORD *)(v4 - 216) = swift_slowAlloc();
      v21 = swift_slowAlloc();
      *(_QWORD *)(v4 - 192) = v21;
      *(_QWORD *)(v4 - 72) = v21;
      *(_DWORD *)v20 = 136315394;
      *(_QWORD *)(v4 - 224) = v20 + 4;
      *(_QWORD *)(v4 - 128) = v6;
      *(_QWORD *)(v4 - 120) = v16;
      *(_QWORD *)(v4 - 112) = v10;
      *(_QWORD *)(v4 - 104) = v12;
      *(_BYTE *)(v4 - 96) = v3;
      sub_24791B694();
      v22 = sub_247929A04();
      *(_QWORD *)(v4 - 128) = sub_24791B0B8(v22, v23, (uint64_t *)(v4 - 72));
      sub_247929734();
      swift_bridgeObjectRelease();
      sub_247914250(v6, v16, v10, v12, v3);
      sub_247914250(v6, v16, v10, v12, v3);
      *(_WORD *)(v20 + 12) = 2112;
      v24 = v7;
      v25 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v4 - 128) = v25;
      sub_247929734();
      v26 = *(uint64_t **)(v4 - 216);
      *v26 = v25;

      v27 = *(NSObject **)(v4 - 168);
      _os_log_impl(&dword_247900000, v27, (os_log_type_t)*(_DWORD *)(v4 - 184), "Failed to encode InspectorPropertyValue: %s, because: %@", (uint8_t *)v20, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7A60);
      swift_arrayDestroy();
      MEMORY[0x2495847F4](v26, -1, -1);
      v28 = *(_QWORD *)(v4 - 192);
      swift_arrayDestroy();
      MEMORY[0x2495847F4](v28, -1, -1);
      MEMORY[0x2495847F4](v20, -1, -1);

      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v4 - 152) + 8))(*(_QWORD *)(v4 - 160), *(_QWORD *)(v4 - 208));
    }
    else
    {

      sub_247914250(v6, v16, v10, v12, v3);
      sub_247914250(v6, v16, v10, v12, v3);

      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 152) + 8))(v9, v5);
    }
    v29 = *(_QWORD *)(v4 - 176);
    v30 = *(_QWORD *)(v4 - 200);
    *(_BYTE *)(v4 - 128) = 0;
    sub_247929998();
    if (!v30)
    {
      *(_BYTE *)(v4 - 128) = 1;
      sub_247929998();
    }
    return (*(uint64_t (**)(_QWORD, _QWORD))(v29 + 8))(*(_QWORD *)(v4 - 136), *(_QWORD *)(v4 - 144));
  }
  else
  {
    *(_BYTE *)(v4 - 128) = 1;
    sub_2479299E0();
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v4 - 176) + 8))(*(_QWORD *)(v4 - 136), *(_QWORD *)(v4 - 144));
  }
}

unint64_t sub_247919E58()
{
  unint64_t result;

  result = qword_2576CC640;
  if (!qword_2576CC640)
  {
    result = MEMORY[0x249584764](&unk_24792C018, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2576CC640);
  }
  return result;
}

uint64_t InspectorPropertyValue.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t SRGB;
  uint64_t v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  NSObject *v34;
  unint64_t v35;
  os_log_type_t v36;
  uint64_t v37;
  uint8_t *v38;
  double *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t *v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint8_t *v72;
  double *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  _QWORD *v77;
  double *v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;

  v75 = a2;
  v76 = sub_247929368();
  v74 = *(_QWORD *)(v76 - 8);
  v4 = MEMORY[0x24BDAC7A8](v76, v3);
  v6 = (double *)((char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4, v7);
  v9 = (char *)&v68 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C81B0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v68 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247919E58();
  v15 = v77;
  sub_247929AF4();
  if (v15)
  {
    v19 = (uint64_t)a1;
  }
  else
  {
    v16 = v9;
    v73 = v6;
    v77 = a1;
    v17 = v11;
    LOBYTE(v78) = 0;
    v18 = v10;
    v21 = sub_2479298E4();
    v23 = v22;
    swift_bridgeObjectRetain();
    v71 = v21;
    v24 = sub_247929A4C();
    swift_bridgeObjectRelease();
    switch(v24)
    {
      case 0:
        LOBYTE(v78) = 1;
        SRGB = sub_24792992C();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v27 = 0;
        v28 = 0uLL;
        goto LABEL_38;
      case 1:
        LOBYTE(v78) = 1;
        SRGB = sub_247929938();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = 0uLL;
        v27 = 1;
        goto LABEL_38;
      case 2:
        LOBYTE(v78) = 1;
        sub_2479298FC();
        v42 = v41;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        SRGB = v42;
        v28 = 0uLL;
        v27 = 2;
        goto LABEL_38;
      case 3:
        LOBYTE(v78) = 1;
        v43 = sub_2479298F0();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        SRGB = v43 & 1;
        v28 = 0uLL;
        v27 = 3;
        goto LABEL_38;
      case 4:
        LOBYTE(v78) = 1;
        SRGB = sub_2479298E4();
        v45 = v44;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v18);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = v45;
        v27 = 4;
        goto LABEL_38;
      case 5:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7D80);
        LOBYTE(v81) = 1;
        sub_24791431C(&qword_2576C8208, &qword_2576C7D80, MEMORY[0x24BEE40E8]);
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        v28 = 0uLL;
        v27 = 5;
        break;
      case 6:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7778);
        LOBYTE(v81) = 1;
        sub_24791431C(&qword_2576C77A0, &qword_2576C7778, MEMORY[0x24BEE4118]);
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        *(_QWORD *)&v28 = v79;
        v27 = 6;
        break;
      case 7:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E28);
        LOBYTE(v81) = 1;
        sub_24791431C(&qword_2576C81F0, &qword_2576C7E28, MEMORY[0x24BEE4178]);
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        *(_QWORD *)&v28 = v79;
        v27 = 7;
        break;
      case 8:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E28);
        LOBYTE(v81) = 1;
        sub_24791431C(&qword_2576C81F0, &qword_2576C7E28, MEMORY[0x24BEE4178]);
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        *(_QWORD *)&v28 = v79;
        v27 = 8;
        break;
      case 9:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8198);
        LOBYTE(v81) = 1;
        sub_24791BCC4();
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        v28 = 0uLL;
        v27 = 9;
        break;
      case 10:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8188);
        LOBYTE(v81) = 1;
        sub_24791BC48();
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        v28 = 0uLL;
        v27 = 10;
        break;
      case 11:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8170);
        LOBYTE(v81) = 1;
        sub_24791BBCC();
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        v28 = 0uLL;
        v27 = 11;
        break;
      case 12:
        LOBYTE(v78) = 1;
        SRGB = sub_2479298E4();
        v48 = v47;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v18);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = v48;
        v27 = 17;
        goto LABEL_38;
      case 13:
        LOBYTE(v78) = 1;
        SRGB = sub_2479298E4();
        v50 = v49;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v18);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = v50;
        v27 = 16;
        goto LABEL_38;
      case 14:
        LOBYTE(v78) = 1;
        SRGB = sub_2479298E4();
        v52 = v51;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v18);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = v52;
        v27 = 18;
        goto LABEL_38;
      case 15:
        LOBYTE(v78) = 1;
        SRGB = sub_2479298E4();
        v54 = v53;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v18);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = v54;
        v27 = 12;
        goto LABEL_38;
      case 16:
        LOBYTE(v78) = 1;
        SRGB = sub_2479298E4();
        v56 = v55;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v18);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = v56;
        v27 = 13;
        goto LABEL_38;
      case 17:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8160);
        LOBYTE(v81) = 1;
        sub_24791BB24(&qword_2576C81D8, &qword_2576C8160, (uint64_t (*)(void))sub_24791BB88, MEMORY[0x24BEE12D0]);
        sub_247929914();
        swift_bridgeObjectRelease();
        v46 = (uint64_t)v77;
        if (*((_QWORD *)v78 + 2) < 4uLL)
        {
          (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
          swift_bridgeObjectRelease();
          SRGB = 0;
          v26 = 0;
          v28 = 0uLL;
LABEL_42:
          v27 = 27;
        }
        else
        {
          v57 = v78[4];
          v58 = v78[5];
          v59 = v78[6];
          v60 = v78[7];
          swift_bridgeObjectRelease();
          SRGB = (uint64_t)CGColorCreateSRGB(v57, v58, v59, v60);
          (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
          v26 = 0;
          v28 = 0uLL;
          v27 = 14;
        }
        break;
      case 18:
        LOBYTE(v81) = 1;
        sub_2479028BC();
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        *(_QWORD *)&v28 = v79;
        v27 = 15;
        break;
      case 19:
        LOBYTE(v78) = 1;
        SRGB = sub_2479298E4();
        v62 = v61;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v18);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = v62;
        v27 = 21;
        goto LABEL_38;
      case 20:
        LOBYTE(v81) = 1;
        sub_24791BAE0();
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        SRGB = (uint64_t)v78;
        v28 = v79;
        v27 = 22;
        goto LABEL_32;
      case 21:
        LOBYTE(v81) = 1;
        sub_24791BAE0();
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        SRGB = (uint64_t)v78;
        v28 = v79;
        v27 = 23;
        goto LABEL_32;
      case 22:
        LOBYTE(v81) = 1;
        sub_24791BAE0();
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        SRGB = (uint64_t)v78;
        v28 = v79;
        v27 = 24;
LABEL_32:
        v26 = v80;
        goto LABEL_38;
      case 23:
        LOBYTE(v78) = 1;
        SRGB = sub_247929938();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = 0uLL;
        v27 = 19;
        goto LABEL_38;
      case 24:
        LOBYTE(v78) = 1;
        SRGB = sub_247929938();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v28 = 0uLL;
        v27 = 20;
        goto LABEL_38;
      case 25:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8138);
        LOBYTE(v81) = 1;
        sub_24791BB24(&qword_2576C81D0, &qword_2576C8138, (uint64_t (*)(void))sub_24791BA9C, MEMORY[0x24BEE12D0]);
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        v28 = 0uLL;
        v27 = 25;
        break;
      case 26:
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8118);
        LOBYTE(v81) = 1;
        sub_24791B9DC(&qword_2576C81B8, (uint64_t (*)(void))sub_24791BA58, (uint64_t (*)(void))sub_24791BA9C, MEMORY[0x24BEE04E0]);
        sub_247929914();
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v10);
        swift_bridgeObjectRelease();
        v26 = 0;
        v46 = (uint64_t)v77;
        SRGB = (uint64_t)v78;
        v28 = 0uLL;
        v27 = 26;
        break;
      case 27:
        swift_bridgeObjectRelease();
        LOBYTE(v78) = 1;
        SRGB = sub_2479298E4();
        v67 = v66;
        v46 = (uint64_t)v77;
        (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v18);
        v26 = 0;
        v28 = v67;
        goto LABEL_42;
      default:
        v70 = v14;
        v29 = sub_24790CBA8();
        v30 = v74;
        v31 = v16;
        v32 = v16;
        v33 = v76;
        (*(void (**)(char *, uint64_t, uint64_t))(v74 + 16))(v32, v29, v76);
        swift_bridgeObjectRetain();
        v34 = sub_24792935C();
        v35 = v23;
        v36 = sub_2479296F8();
        if (os_log_type_enabled(v34, v36))
        {
          v37 = swift_slowAlloc();
          v69 = v18;
          v38 = (uint8_t *)v37;
          v73 = (double *)swift_slowAlloc();
          v78 = v73;
          *(_DWORD *)v38 = 136315138;
          v72 = v38 + 4;
          swift_bridgeObjectRetain();
          v81 = sub_24791B0B8(v71, v35, (uint64_t *)&v78);
          sub_247929734();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_247900000, v34, v36, "Failed to identify discriminate of: %s when decoding InspectorPropertyValue", v38, 0xCu);
          v39 = v73;
          swift_arrayDestroy();
          MEMORY[0x2495847F4](v39, -1, -1);
          MEMORY[0x2495847F4](v38, -1, -1);

          (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v76);
          v40 = *(void (**)(char *, uint64_t))(v17 + 8);
          v63 = v70;
          v64 = v69;
        }
        else
        {
          swift_bridgeObjectRelease_n();

          (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v33);
          v40 = *(void (**)(char *, uint64_t))(v17 + 8);
          v63 = v70;
          v64 = v18;
        }
        v40(v63, v64);
        SRGB = 0;
        v26 = 0;
        v28 = 0uLL;
        v27 = 27;
LABEL_38:
        v46 = (uint64_t)v77;
        break;
    }
    v65 = v75;
    *v75 = SRGB;
    *(_OWORD *)(v65 + 1) = v28;
    v65[3] = v26;
    *((_BYTE *)v65 + 32) = v27;
    v19 = v46;
  }
  return __swift_destroy_boxed_opaque_existential_1(v19);
}

uint64_t sub_24791B090@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return InspectorPropertyValue.init(from:)(a1, a2);
}

void sub_24791B0A4(_QWORD *a1)
{
  InspectorPropertyValue.encode(to:)(a1);
}

uint64_t sub_24791B0B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24791B188(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2479104F4((uint64_t)v12, *a3);
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
      sub_2479104F4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24791B188(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247929740();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24791B340(a5, a6);
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
  v8 = sub_247929818();
  if (!v8)
  {
    sub_247929848();
    __break(1u);
LABEL_17:
    result = sub_247929884();
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

uint64_t sub_24791B340(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24791B3D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24791B548(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24791B548(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24791B3D4(uint64_t a1, unint64_t a2)
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
      v3 = sub_247916148(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2479297D0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_247929848();
      __break(1u);
LABEL_10:
      v2 = sub_247929548();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_247929884();
    __break(1u);
LABEL_14:
    result = sub_247929848();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_24791B548(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8050);
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
  result = sub_247929884();
  __break(1u);
  return result;
}

unint64_t sub_24791B694()
{
  unint64_t result;

  result = qword_2576C8108;
  if (!qword_2576C8108)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue, &type metadata for InspectorPropertyValue);
    atomic_store(result, (unint64_t *)&qword_2576C8108);
  }
  return result;
}

unint64_t sub_24791B6D8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2576C8110;
  if (!qword_2576C8110)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7ED8);
    v2 = MEMORY[0x24BEE0D08];
    result = MEMORY[0x249584764](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576C8110);
  }
  return result;
}

unint64_t sub_24791B734()
{
  unint64_t result;

  result = qword_2576C8128;
  if (!qword_2576C8128)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue.WrappedDictionaryKey, &type metadata for InspectorPropertyValue.WrappedDictionaryKey);
    atomic_store(result, (unint64_t *)&qword_2576C8128);
  }
  return result;
}

unint64_t sub_24791B778()
{
  unint64_t result;

  result = qword_2576C8130;
  if (!qword_2576C8130)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue, &type metadata for InspectorPropertyValue);
    atomic_store(result, (unint64_t *)&qword_2576C8130);
  }
  return result;
}

unint64_t sub_24791B7BC()
{
  unint64_t result;

  result = qword_2576CC648;
  if (!qword_2576CC648)
  {
    result = MEMORY[0x249584764](&unk_24792BFF0, &_s15NestedValueTypeVN);
    atomic_store(result, (unint64_t *)&qword_2576CC648);
  }
  return result;
}

uint64_t sub_24791B800()
{
  return sub_24791BB24(&qword_2576C8158, &qword_2576C8160, (uint64_t (*)(void))sub_24791B824, MEMORY[0x24BEE12A0]);
}

unint64_t sub_24791B824()
{
  unint64_t result;

  result = qword_2576C8168;
  if (!qword_2576C8168)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2576C8168);
  }
  return result;
}

unint64_t sub_24791B868()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2576C8178;
  if (!qword_2576C8178)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C8170);
    v2 = sub_24791431C(&qword_2576C8180, &qword_2576C7E28, MEMORY[0x24BEE4168]);
    result = MEMORY[0x249584764](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576C8178);
  }
  return result;
}

unint64_t sub_24791B8E4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2576C8190;
  if (!qword_2576C8190)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C8188);
    v2 = sub_24791431C(&qword_2576C7780, &qword_2576C7778, MEMORY[0x24BEE4108]);
    result = MEMORY[0x249584764](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576C8190);
  }
  return result;
}

unint64_t sub_24791B960()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2576C81A0;
  if (!qword_2576C81A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C8198);
    v2 = sub_24791431C(&qword_2576C81A8, &qword_2576C7D80, MEMORY[0x24BEE40D8]);
    result = MEMORY[0x249584764](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576C81A0);
  }
  return result;
}

uint64_t sub_24791B9DC(unint64_t *a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C8118);
    v10[0] = a2();
    v10[1] = a3();
    result = MEMORY[0x249584764](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24791BA58()
{
  unint64_t result;

  result = qword_2576C81C0;
  if (!qword_2576C81C0)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue.WrappedDictionaryKey, &type metadata for InspectorPropertyValue.WrappedDictionaryKey);
    atomic_store(result, (unint64_t *)&qword_2576C81C0);
  }
  return result;
}

unint64_t sub_24791BA9C()
{
  unint64_t result;

  result = qword_2576C81C8;
  if (!qword_2576C81C8)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyValue, &type metadata for InspectorPropertyValue);
    atomic_store(result, (unint64_t *)&qword_2576C81C8);
  }
  return result;
}

unint64_t sub_24791BAE0()
{
  unint64_t result;

  result = qword_2576CC650[0];
  if (!qword_2576CC650[0])
  {
    result = MEMORY[0x249584764](&unk_24792BFC8, &_s15NestedValueTypeVN);
    atomic_store(result, qword_2576CC650);
  }
  return result;
}

uint64_t sub_24791BB24(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x249584764](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24791BB88()
{
  unint64_t result;

  result = qword_2576C81E0;
  if (!qword_2576C81E0)
  {
    result = MEMORY[0x249584764](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_2576C81E0);
  }
  return result;
}

unint64_t sub_24791BBCC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2576C81E8;
  if (!qword_2576C81E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C8170);
    v2 = sub_24791431C(&qword_2576C81F0, &qword_2576C7E28, MEMORY[0x24BEE4178]);
    result = MEMORY[0x249584764](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576C81E8);
  }
  return result;
}

unint64_t sub_24791BC48()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2576C81F8;
  if (!qword_2576C81F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C8188);
    v2 = sub_24791431C(&qword_2576C77A0, &qword_2576C7778, MEMORY[0x24BEE4118]);
    result = MEMORY[0x249584764](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576C81F8);
  }
  return result;
}

unint64_t sub_24791BCC4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2576C8200;
  if (!qword_2576C8200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C8198);
    v2 = sub_24791431C(&qword_2576C8208, &qword_2576C7D80, MEMORY[0x24BEE40E8]);
    result = MEMORY[0x249584764](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576C8200);
  }
  return result;
}

uint64_t _s15NestedValueTypeVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s15NestedValueTypeVwcp(_QWORD *a1, _QWORD *a2)
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

_QWORD *_s15NestedValueTypeVwca(_QWORD *a1, _QWORD *a2)
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

uint64_t _s15NestedValueTypeVwta(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *_s15NestedValueTypeVMa()
{
  return &_s15NestedValueTypeVN;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

unint64_t sub_24791BEB4()
{
  unint64_t result;

  result = qword_2576CC8E0[0];
  if (!qword_2576CC8E0[0])
  {
    result = MEMORY[0x249584764](&unk_24792BFA0, &_s10CodingKeysON);
    atomic_store(result, qword_2576CC8E0);
  }
  return result;
}

unint64_t sub_24791BEFC()
{
  unint64_t result;

  result = qword_2576CCAF0;
  if (!qword_2576CCAF0)
  {
    result = MEMORY[0x249584764](&unk_24792BED8, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2576CCAF0);
  }
  return result;
}

unint64_t sub_24791BF44()
{
  unint64_t result;

  result = qword_2576CCAF8[0];
  if (!qword_2576CCAF8[0])
  {
    result = MEMORY[0x249584764](&unk_24792BF00, &_s10CodingKeysON);
    atomic_store(result, qword_2576CCAF8);
  }
  return result;
}

unint64_t sub_24791BF88()
{
  unint64_t result;

  result = qword_2576CCB80[0];
  if (!qword_2576CCB80[0])
  {
    result = MEMORY[0x249584764](&unk_24792C120, &_s15NestedValueTypeV10CodingKeysON);
    atomic_store(result, qword_2576CCB80);
  }
  return result;
}

uint64_t _s10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24791C018 + 4 * byte_24792BE65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24791C04C + 4 * byte_24792BE60[v4]))();
}

uint64_t sub_24791C04C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24791C054(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24791C05CLL);
  return result;
}

uint64_t sub_24791C068(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24791C070);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24791C074(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24791C07C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s15NestedValueTypeV10CodingKeysOMa()
{
  return &_s15NestedValueTypeV10CodingKeysON;
}

unint64_t sub_24791C09C()
{
  unint64_t result;

  result = qword_2576CCC90[0];
  if (!qword_2576CCC90[0])
  {
    result = MEMORY[0x249584764](&unk_24792C0F8, &_s15NestedValueTypeV10CodingKeysON);
    atomic_store(result, qword_2576CCC90);
  }
  return result;
}

unint64_t sub_24791C0E4()
{
  unint64_t result;

  result = qword_2576CCDA0;
  if (!qword_2576CCDA0)
  {
    result = MEMORY[0x249584764](&unk_24792C068, &_s15NestedValueTypeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2576CCDA0);
  }
  return result;
}

unint64_t sub_24791C12C()
{
  unint64_t result;

  result = qword_2576CCDA8[0];
  if (!qword_2576CCDA8[0])
  {
    result = MEMORY[0x249584764](&unk_24792C090, &_s15NestedValueTypeV10CodingKeysON);
    atomic_store(result, qword_2576CCDA8);
  }
  return result;
}

uint64_t sub_24791C170(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C6562616CLL && a2 == 0xE500000000000000;
  if (v3 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t InspectorHierarchyRepresentation.rootEntityID.getter@<X0>(_QWORD *a1@<X8>)
{
  return EntityID.init(id:)(1, a1);
}

uint64_t sub_24791C250@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorEntityRepresentation();
  sub_24791C2A8();
  sub_24791C2EC();
  return InspectorCollection.init()(a1);
}

unint64_t sub_24791C2A8()
{
  unint64_t result;

  result = qword_2576C8230;
  if (!qword_2576C8230)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for EntityID, &type metadata for EntityID);
    atomic_store(result, (unint64_t *)&qword_2576C8230);
  }
  return result;
}

unint64_t sub_24791C2EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576C8238;
  if (!qword_2576C8238)
  {
    v1 = type metadata accessor for InspectorEntityRepresentation();
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorEntityRepresentation, v1);
    atomic_store(result, (unint64_t *)&qword_2576C8238);
  }
  return result;
}

uint64_t InspectorHierarchyRepresentation.entities.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 InspectorHierarchyRepresentation.entities.setter(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = *a1;
  *v1 = *a1;
  return result;
}

uint64_t (*InspectorHierarchyRepresentation.entities.modify())()
{
  return nullsub_1;
}

uint64_t InspectorHierarchyRepresentation.init()@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorEntityRepresentation();
  sub_24791C2A8();
  sub_24791C2EC();
  return InspectorCollection.init()(a1);
}

uint64_t sub_24791C400()
{
  return 0x7365697469746E65;
}

uint64_t sub_24791C418@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x7365697469746E65 && a2 == 0xE800000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_247929A28();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24791C4AC()
{
  sub_24791C614();
  return sub_247929B54();
}

uint64_t sub_24791C4D4()
{
  sub_24791C614();
  return sub_247929B60();
}

uint64_t InspectorHierarchyRepresentation.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v10;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8240);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791C614();
  sub_247929B00();
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8248);
  sub_24791C810(&qword_2576C8250, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
  sub_2479299C8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_24791C614()
{
  unint64_t result;

  result = qword_2576CCE30[0];
  if (!qword_2576CCE30[0])
  {
    result = MEMORY[0x249584764](&unk_24792C2E4, &type metadata for InspectorHierarchyRepresentation.CodingKeys);
    atomic_store(result, qword_2576CCE30);
  }
  return result;
}

uint64_t InspectorHierarchyRepresentation.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8258);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InspectorEntityRepresentation();
  sub_24791C2A8();
  sub_24791C2EC();
  InspectorCollection.init()(&v14);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791C614();
  sub_247929AF4();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8248);
    sub_24791C810(&qword_2576C8260, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_247929914();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v11 = v13[0];
    v12 = v13[1];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *a2 = v11;
    a2[1] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24791C810(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C8248);
    result = MEMORY[0x249584764](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24791C854@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return InspectorHierarchyRepresentation.init(from:)(a1, a2);
}

uint64_t sub_24791C868(_QWORD *a1)
{
  return InspectorHierarchyRepresentation.encode(to:)(a1);
}

uint64_t destroy for InspectorHierarchyRepresentation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s26SpatialInspectorFoundation32InspectorHierarchyRepresentationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for InspectorHierarchyRepresentation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for InspectorHierarchyRepresentation(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InspectorHierarchyRepresentation(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorHierarchyRepresentation(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InspectorHierarchyRepresentation()
{
  return &type metadata for InspectorHierarchyRepresentation;
}

uint64_t storeEnumTagSinglePayload for InspectorHierarchyRepresentation.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24791CA48 + 4 * byte_24792C170[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24791CA68 + 4 * byte_24792C175[v4]))();
}

_BYTE *sub_24791CA48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24791CA68(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24791CA70(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24791CA78(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24791CA80(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24791CA88(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for InspectorHierarchyRepresentation.CodingKeys()
{
  return &type metadata for InspectorHierarchyRepresentation.CodingKeys;
}

unint64_t sub_24791CAA8()
{
  unint64_t result;

  result = qword_2576CD040[0];
  if (!qword_2576CD040[0])
  {
    result = MEMORY[0x249584764](&unk_24792C2BC, &type metadata for InspectorHierarchyRepresentation.CodingKeys);
    atomic_store(result, qword_2576CD040);
  }
  return result;
}

unint64_t sub_24791CAF0()
{
  unint64_t result;

  result = qword_2576CD150;
  if (!qword_2576CD150)
  {
    result = MEMORY[0x249584764](&unk_24792C22C, &type metadata for InspectorHierarchyRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CD150);
  }
  return result;
}

unint64_t sub_24791CB38()
{
  unint64_t result;

  result = qword_2576CD158[0];
  if (!qword_2576CD158[0])
  {
    result = MEMORY[0x249584764](&unk_24792C254, &type metadata for InspectorHierarchyRepresentation.CodingKeys);
    atomic_store(result, qword_2576CD158);
  }
  return result;
}

uint64_t sub_24791CB7C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRetain();
  sub_24791D9BC(1);
  swift_bridgeObjectRelease();
  v4 = sub_24792971C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24791DA44(1uLL, a1, a2);
  swift_bridgeObjectRelease();
  sub_24791688C();
  swift_bridgeObjectRetain();
  sub_247929518();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

unint64_t sub_24791CC88(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t result;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  _QWORD v19[4];
  uint64_t v20;
  unint64_t v21;

  v4 = sub_247929B30();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = 0;
  v21 = 0xE000000000000000;
  v9 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v9 = a1 & 0xFFFFFFFFFFFFLL;
  v19[0] = a1;
  v19[1] = a2;
  v19[2] = 0;
  v19[3] = v9;
  swift_bridgeObjectRetain();
  result = sub_24792953C();
  if (!v11)
  {
    v18 = 0;
LABEL_24:
    swift_bridgeObjectRelease();
    return v18;
  }
  v12 = result;
  v13 = v11;
  v14 = 0;
  while (!__OFADD__(v14, 1))
  {
    if ((sub_24792944C() & 1) != 0)
    {
      result = sub_24791D6C8(v12, v13);
      if ((result & 0x100000000) != 0)
        goto LABEL_26;
      sub_247929B3C();
      v16 = sub_247929B18();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      if ((v16 & 1) != 0)
        goto LABEL_17;
    }
    if ((sub_247929440() & 1) != 0)
    {
      if ((sub_24792944C() & 1) != 0)
      {
        result = sub_24791D6C8(v12, v13);
        if ((result & 0x100000000) != 0)
          goto LABEL_27;
        sub_247929B3C();
        v17 = sub_247929B24();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        if ((v17 & 1) != 0)
          goto LABEL_17;
      }
      if ((sub_247929440() & 1) == 0 || (sub_247929434() & 1) == 0)
      {
LABEL_17:
        if (v14 != sub_2479294F4())
        {
          if (!v14)
            goto LABEL_5;
          sub_247929530();
        }
      }
    }
    if (v14)
    {
      MEMORY[0x249583DE0](v12, v13);
      goto LABEL_6;
    }
LABEL_5:
    sub_247929428();
    swift_bridgeObjectRelease();
    sub_247929530();
LABEL_6:
    swift_bridgeObjectRelease();
    result = sub_24792953C();
    v12 = result;
    v13 = v15;
    ++v14;
    if (!v15)
    {
      v18 = v20;
      goto LABEL_24;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

unint64_t sub_24791CECC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t result;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  char v28;
  _QWORD v29[8];
  uint64_t v30;
  unint64_t v31;

  v4 = sub_247929B30();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_2479294F4() < 1)
  {
    swift_bridgeObjectRetain();
    return a1;
  }
  v30 = 0;
  v31 = 0xE000000000000000;
  if ((a2 & 0x2000000000000000) != 0)
    v9 = HIBYTE(a2) & 0xF;
  else
    v9 = a1 & 0xFFFFFFFFFFFFLL;
  v29[1] = sub_247929500();
  v29[4] = a1;
  v29[5] = a2;
  v29[6] = 0;
  v29[7] = v9;
  swift_bridgeObjectRetain();
  result = sub_24792953C();
  if (!v11)
  {
    a1 = 0;
LABEL_53:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return a1;
  }
  v29[2] = a2;
  v29[3] = a1;
  v12 = 0;
  v13 = 0xE100000000000000;
  v14 = 32;
  while (!__OFADD__(v12, 1))
  {
    v15 = result;
    v16 = v11;
    if ((sub_24792944C() & 1) == 0)
      goto LABEL_19;
    result = sub_24791D6C8(v15, v16);
    if ((result & 0x100000000) != 0)
      goto LABEL_56;
    sub_247929B3C();
    v17 = sub_247929B18();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    if ((v17 & 1) == 0)
    {
LABEL_19:
      if ((sub_247929440() & 1) == 0)
        goto LABEL_20;
      if ((sub_24792944C() & 1) == 0)
        goto LABEL_64;
      result = sub_24791D6C8(v15, v16);
      if ((result & 0x100000000) != 0)
        goto LABEL_58;
      sub_247929B3C();
      v18 = sub_247929B24();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      if ((v18 & 1) == 0)
      {
LABEL_64:
        if ((sub_247929440() & 1) != 0 && (sub_247929434() & 1) != 0)
        {
LABEL_20:
          swift_bridgeObjectRelease();
          goto LABEL_34;
        }
      }
    }
    if (!v12)
    {
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    if ((sub_24792944C() & 1) != 0)
    {
      result = sub_24791D6C8(v14, v13);
      if ((result & 0x100000000) != 0)
        goto LABEL_57;
      sub_247929B3C();
      v19 = sub_247929B0C();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      if ((v19 & 1) != 0)
      {
LABEL_32:
        swift_bridgeObjectRelease();
LABEL_33:
        sub_247929530();
        goto LABEL_34;
      }
    }
    if ((sub_247929434() & 1) != 0)
    {
      if ((sub_24792944C() & 1) != 0)
      {
        result = sub_24791D6C8(v14, v13);
        if ((result & 0x100000000) != 0)
          goto LABEL_59;
        sub_247929B3C();
        v20 = sub_247929B24();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        if ((v20 & 1) != 0)
          goto LABEL_32;
      }
      if ((sub_247929440() & 1) == 0)
        goto LABEL_32;
      v21 = sub_247929434();
      swift_bridgeObjectRelease();
      if ((v21 & 1) == 0)
        goto LABEL_33;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_24792950C();
    if ((v22 & 1) == 0)
    {
      v23 = sub_247929590();
      v25 = v24;
      if ((sub_24792944C() & 1) != 0)
      {
        result = sub_24791D6C8(v23, v25);
        if ((result & 0x100000000) != 0)
          goto LABEL_60;
        sub_247929B3C();
        v26 = sub_247929B0C();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        if ((v26 & 1) != 0)
          goto LABEL_32;
      }
      if ((sub_247929434() & 1) == 0)
        goto LABEL_20;
      if ((sub_24792944C() & 1) != 0)
      {
        result = sub_24791D6C8(v23, v25);
        if ((result & 0x100000000) != 0)
          goto LABEL_61;
        sub_247929B3C();
        v27 = sub_247929B24();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
        if ((v27 & 1) != 0)
          goto LABEL_32;
      }
      if ((sub_247929440() & 1) == 0)
        goto LABEL_32;
      v28 = sub_247929434();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0)
        goto LABEL_33;
    }
LABEL_34:
    if (v12)
    {
      MEMORY[0x249583DE0](v15, v16);
      goto LABEL_9;
    }
LABEL_8:
    sub_247929428();
    sub_247929530();
    swift_bridgeObjectRelease();
LABEL_9:
    result = sub_24792953C();
    ++v12;
    v13 = v16;
    v14 = v15;
    if (!v11)
    {
      a1 = v30;
      goto LABEL_53;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
LABEL_59:
  __break(1u);
LABEL_60:
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

uint64_t sub_24791D354(float a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  id v7;
  id v8;
  uint64_t v9;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16F0]), sel_init);
  objc_msgSend(v2, sel_setNumberStyle_, 1);
  objc_msgSend(v2, sel_setMaximumFractionDigits_, 3);
  v3 = (void *)sub_247929494();
  objc_msgSend(v2, sel_setDecimalSeparator_, v3);

  v4 = (void *)sub_247929494();
  objc_msgSend(v2, sel_setGroupingSeparator_, v4);

  v5 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  *(float *)&v6 = a1;
  v7 = objc_msgSend(v5, sel_initWithFloat_, v6);
  v8 = objc_msgSend(v2, sel_stringFromNumber_, v7);

  if (v8)
  {
    v9 = sub_2479294A0();

  }
  else
  {
    sub_247929680();

    return 0;
  }
  return v9;
}

uint64_t sub_24791D4B0(double a1)
{
  float v1;

  v1 = a1;
  return sub_24791D354(v1);
}

uint64_t sub_24791D4B8()
{
  CGColor *v0;
  uint64_t result;
  uint64_t inited;
  float v3;
  float v4;
  double v5;
  double v6;
  float v7;
  float v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;

  if (CGColorGetNumberOfComponents(v0) != 4)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24792B8E0;
  result = sub_2479296C8();
  v3 = 0.0;
  v4 = 0.0;
  if (result)
  {
    if (!*(_QWORD *)(result + 16))
    {
      __break(1u);
      goto LABEL_17;
    }
    v5 = *(double *)(result + 32);
    swift_bridgeObjectRelease();
    v4 = v5;
  }
  *(float *)(inited + 32) = v4;
  result = sub_2479296C8();
  if (!result)
    goto LABEL_9;
  if (*(_QWORD *)(result + 16) < 2uLL)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v6 = *(double *)(result + 40);
  swift_bridgeObjectRelease();
  v3 = v6;
LABEL_9:
  *(float *)(inited + 36) = v3;
  result = sub_2479296C8();
  v7 = 0.0;
  v8 = 0.0;
  if (result)
  {
    if (*(_QWORD *)(result + 16) >= 3uLL)
    {
      v9 = *(double *)(result + 48);
      swift_bridgeObjectRelease();
      v8 = v9;
      goto LABEL_12;
    }
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
LABEL_12:
  *(float *)(inited + 40) = v8;
  result = sub_2479296C8();
  if (!result)
  {
LABEL_15:
    *(float *)(inited + 44) = v7;
    sub_2479129FC(inited);
    v12 = v11;
    swift_setDeallocating();
    return v12;
  }
  if (*(_QWORD *)(result + 16) >= 4uLL)
  {
    v10 = *(double *)(result + 56);
    swift_bridgeObjectRelease();
    v7 = v10;
    goto LABEL_15;
  }
LABEL_19:
  __break(1u);
  return result;
}

__n128 sub_24791D600()
{
  __int128 v0;
  __int128 v1;
  int v2;
  double v3;
  uint64_t inited;
  float v5;
  __int128 v6;
  __int128 v8;
  __int128 v9;
  float64x2_t v10;
  __int128 v11;
  float64x2_t v12;
  double v13;
  _OWORD v14[2];
  SPRotation3D v15;

  sub_2479296E0();
  v8 = v1;
  v9 = v0;
  v2 = sub_247929704();
  *(_OWORD *)v15.vector.f64 = v8;
  v14[0] = v9;
  v14[1] = v8;
  SPRotation3DGetEulerAngles(v15, (uint64_t)v14, v2, (uint64_t)&v12);
  v10 = v12;
  v3 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7E90);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24792B8F0;
  *(float32x2_t *)(inited + 32) = vmul_f32(vcvt_f32_f64(v10), (float32x2_t)vdup_n_s32(0x42652EE2u));
  v5 = v3;
  *(float *)(inited + 40) = v5 * 57.296;
  sub_24791298C(inited);
  v11 = v6;
  swift_setDeallocating();
  return (__n128)v11;
}

unint64_t sub_24791D6C8(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unsigned int v5;

  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    sub_24791D7A4(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      v5 = sub_2479297B8();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0)
        sub_247929818();
      v5 = sub_247929824();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_24791D7A4(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_24791D840(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_24791D8AC(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_24791D840(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_2479163BC(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_24791D8AC(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v7 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL))
          goto LABEL_14;
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_247929818();
        v5 = v12;
        if (v12 == v10)
          goto LABEL_14;
      }
      if ((*(_BYTE *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          v7 = v5 - 1;
          v8 = *(_BYTE *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      v7 = v5;
      return v7 << 16;
    }
    v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v9 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v9)
      return sub_2479297AC();
  }
  return result;
}

uint64_t sub_24791D9BC(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24792950C();
    return sub_2479295A8();
  }
  return result;
}

unint64_t sub_24791DA44(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_24792950C();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_2479295A8();
  }
  __break(1u);
  return result;
}

void SPRotation3DGetEulerAngles(SPRotation3D a1@<0:Q0, 16:Q1>, uint64_t a2@<X0>, int a3@<W1>, uint64_t a4@<X8>)
{
  float64x2_t v8;
  double v10;
  double v18;
  __int128 v22;
  int64x2_t v23;
  long double v24;
  __int128 v25;
  __int128 v26;
  float64_t v27;

  _Q2 = *(int8x16_t *)a2;
  _Q1 = *(_OWORD *)(a2 + 16);
  if (a3 == 2)
  {
    v8 = (float64x2_t)vextq_s8(_Q2, _Q2, 8uLL);
    _Q2.i64[0] = *(_QWORD *)(a2 + 16);
  }
  else if (a3 == 1)
  {
    v8.f64[0] = *(float64_t *)(a2 + 16);
    v8.f64[1] = *(float64_t *)(a2 + 8);
  }
  else
  {
    v8 = 0uLL;
    _Q2.i64[0] = 0;
  }
  v26 = *(_OWORD *)(a2 + 16);
  _D8 = v8.f64[1];
  v10 = vmuld_lane_f64(v8.f64[1], v8, 1);
  v27 = v8.f64[0];
  __asm { FMLA            D0, D2, V1.D[1] }
  *(double *)&_Q0 = atan2(_D0 + _D0, (v10 + *(double *)_Q2.i64 * *(double *)_Q2.i64) * -2.0 + 1.0);
  v25 = _Q0;
  _V1.D[1] = *((_QWORD *)&v26 + 1);
  __asm { FMLA            D0, D8, V1.D[1] }
  v18 = *(double *)&_Q0 + *(double *)&_Q0;
  if (v18 > 1.0)
    v18 = 1.0;
  if (v18 < -1.0)
    v18 = -1.0;
  v24 = asin(v18);
  _V2.D[1] = *((_QWORD *)&v26 + 1);
  _D1 = v27;
  __asm { FMLA            D0, D1, V2.D[1] }
  *(float *)&_D0 = _D0 + _D0;
  *(float *)&_D1 = vmlad_n_f64(v10, _D1, _D1) * -2.0 + 1.0;
  *(double *)&v22 = atan2f(*(float *)&_D0, *(float *)&_D1);
  if (a3 == 2)
  {
    *(long double *)v23.i64 = v24;
    v23.i64[1] = v22;
    v22 = v25;
  }
  else if (a3 == 1)
  {
    v23.i64[0] = v25;
    *(long double *)&v23.i64[1] = v24;
  }
  else
  {
    v23 = vdupq_n_s64(0x7FF8000000000000uLL);
    *(_QWORD *)&v22 = 0x7FF8000000000000;
  }
  *(int64x2_t *)a4 = v23;
  *(_OWORD *)(a4 + 16) = v22;
  *(_DWORD *)(a4 + 32) = a3;
}

uint64_t InspectorPropertyID.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorPropertyID.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*InspectorPropertyID.id.modify())()
{
  return nullsub_1;
}

SpatialInspectorFoundation::InspectorPropertyID __swiftcall InspectorPropertyID.init(id:)(SpatialInspectorFoundation::InspectorPropertyID id)
{
  SpatialInspectorFoundation::InspectorPropertyID *v1;

  *v1 = id;
  return id;
}

uint64_t static InspectorPropertyID.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_247929A28();
}

uint64_t InspectorPropertyID.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2479294E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24791DD0C()
{
  sub_24791DE48();
  return sub_247929B54();
}

uint64_t sub_24791DD34()
{
  sub_24791DE48();
  return sub_247929B60();
}

uint64_t InspectorPropertyID.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8268);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791DE48();
  sub_247929B00();
  sub_247929998();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_24791DE48()
{
  unint64_t result;

  result = qword_2576CD1E0;
  if (!qword_2576CD1E0)
  {
    result = MEMORY[0x249584764](&unk_24792C824, &type metadata for InspectorPropertyID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CD1E0);
  }
  return result;
}

uint64_t InspectorPropertyID.hashValue.getter()
{
  sub_247929AAC();
  sub_2479294E8();
  return sub_247929AE8();
}

uint64_t InspectorPropertyID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8270);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791DE48();
  sub_247929AF4();
  if (!v2)
  {
    v10 = sub_2479298E4();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_24791DFF0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return InspectorPropertyID.init(from:)(a1, a2);
}

uint64_t sub_24791E004(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8268);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791DE48();
  sub_247929B00();
  sub_247929998();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_24791E0F0(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_247929A28();
}

uint64_t sub_24791E120()
{
  sub_247929AAC();
  sub_2479294E8();
  return sub_247929AE8();
}

uint64_t sub_24791E168()
{
  return sub_2479294E8();
}

uint64_t sub_24791E170()
{
  sub_247929AAC();
  sub_2479294E8();
  return sub_247929AE8();
}

uint64_t sub_24791E1B4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t (*sub_24791E1C0())()
{
  return nullsub_1;
}

uint64_t InspectorPropertyPointer.init(_:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_247929B48();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t InspectorProperty.id.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24791E220@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 112))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_24791E250(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 120);
  swift_bridgeObjectRetain();
  return v4(v2, v3);
}

uint64_t sub_24791E294()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24791E2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24791E32C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_24791E368@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  double result;
  __int128 v5;
  _OWORD v6[2];
  char v7;

  (*(void (**)(_OWORD *__return_ptr))(**(_QWORD **)a1 + 136))(v6);
  v3 = v7;
  result = *(double *)v6;
  v5 = v6[1];
  *(_OWORD *)a2 = v6[0];
  *(_OWORD *)(a2 + 16) = v5;
  *(_BYTE *)(a2 + 32) = v3;
  return result;
}

uint64_t sub_24791E3B0(uint64_t a1, uint64_t *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t (*v7)(id *);
  id v9[4];
  char v10;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  v4 = *(void **)(a1 + 24);
  v5 = *a2;
  v6 = *(_BYTE *)(a1 + 32);
  v9[0] = *(id *)a1;
  v9[1] = v2;
  v9[2] = v3;
  v9[3] = v4;
  v10 = v6;
  v7 = *(uint64_t (**)(id *))(*(_QWORD *)v5 + 144);
  sub_24790D864(v9[0], (unint64_t)v2, (uint64_t)v3, (uint64_t)v4, v6);
  return v7(v9);
}

id sub_24791E408@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  swift_beginAccess();
  v3 = *(void **)(v1 + 48);
  v4 = *(_QWORD *)(v1 + 56);
  v5 = *(_QWORD *)(v1 + 64);
  v6 = *(_QWORD *)(v1 + 72);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_BYTE *)(v1 + 80);
  *(_BYTE *)(a1 + 32) = v7;
  return sub_24790D864(v3, v4, v5, v6, v7);
}

__n128 sub_24791E45C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  __n128 result;
  __int128 v11;

  v2 = *a1;
  v11 = *(_OWORD *)(a1 + 1);
  v3 = a1[3];
  v4 = *((_BYTE *)a1 + 32);
  swift_beginAccess();
  v5 = *(void **)(v1 + 48);
  v6 = *(_QWORD *)(v1 + 56);
  v7 = *(_QWORD *)(v1 + 64);
  v8 = *(_QWORD *)(v1 + 72);
  *(_QWORD *)(v1 + 48) = v2;
  *(_OWORD *)(v1 + 56) = v11;
  *(_QWORD *)(v1 + 72) = v3;
  v9 = *(_BYTE *)(v1 + 80);
  *(_BYTE *)(v1 + 80) = v4;
  sub_247914250(v5, v6, v7, v8, v9);
  return result;
}

uint64_t (*sub_24791E4D0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24791E50C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 160))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_24791E540(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 168))(*a1);
}

uint64_t sub_24791E56C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 81);
}

uint64_t sub_24791E59C(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 81) = a1;
  return result;
}

uint64_t (*sub_24791E5D8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t sub_24791E614()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
  v3 = sub_24791CECC(v1, v2);
  swift_bridgeObjectRelease();
  return v3;
}

__n128 InspectorProperty.__allocating_init(id:name:value:isInternal:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  char v12;
  __n128 result;
  __int128 v14;

  v10 = swift_allocObject();
  v11 = a1[1];
  v12 = *(_BYTE *)(a4 + 32);
  *(_QWORD *)(v10 + 16) = *a1;
  *(_QWORD *)(v10 + 24) = v11;
  *(_QWORD *)(v10 + 32) = a2;
  *(_QWORD *)(v10 + 40) = a3;
  result = *(__n128 *)a4;
  v14 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)a4;
  *(_OWORD *)(v10 + 64) = v14;
  *(_BYTE *)(v10 + 80) = v12;
  *(_BYTE *)(v10 + 81) = a5;
  return result;
}

uint64_t InspectorProperty.init(id:name:value:isInternal:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  __int128 v8;

  v6 = a1[1];
  v7 = *(_BYTE *)(a4 + 32);
  *(_QWORD *)(v5 + 16) = *a1;
  *(_QWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 40) = a3;
  v8 = *(_OWORD *)(a4 + 16);
  *(_OWORD *)(v5 + 48) = *(_OWORD *)a4;
  *(_OWORD *)(v5 + 64) = v8;
  *(_BYTE *)(v5 + 80) = v7;
  *(_BYTE *)(v5 + 81) = a5;
  return v5;
}

uint64_t sub_24791E6F4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24791E718 + 4 * byte_24792C370[*v0]))(25705, 0xE200000000000000);
}

uint64_t sub_24791E718()
{
  return 1701667182;
}

uint64_t sub_24791E728()
{
  return 0x65756C6176;
}

uint64_t sub_24791E73C()
{
  return 0x6E7265746E497369;
}

uint64_t sub_24791E760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24791F0D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24791E784()
{
  sub_24791EA6C();
  return sub_247929B54();
}

uint64_t sub_24791E7AC()
{
  sub_24791EA6C();
  return sub_247929B60();
}

uint64_t InspectorProperty.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247914250(*(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  return v0;
}

uint64_t InspectorProperty.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247914250(*(void **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_BYTE *)(v0 + 80));
  return swift_deallocClassInstance();
}

uint64_t sub_24791E844(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  int v29;
  char v30;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8278);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791EA6C();
  sub_247929B00();
  v10 = v3[3];
  v24 = (void *)v3[2];
  v25 = v10;
  LOBYTE(v19) = 0;
  sub_24791EAB0();
  v11 = sub_2479299C8();
  if (!v2)
  {
    (*(void (**)(uint64_t))(*v3 + 112))(v11);
    LOBYTE(v24) = 1;
    sub_247929998();
    v13 = swift_bridgeObjectRelease();
    (*(void (**)(void **__return_ptr, uint64_t))(*v3 + 136))(&v24, v13);
    v14 = v24;
    v15 = v25;
    v16 = v27;
    v18 = v26;
    v19 = v24;
    v29 = v28;
    v20 = v25;
    v21 = v26;
    v22 = v27;
    v23 = v28;
    v30 = 2;
    sub_24791B778();
    sub_2479299C8();
    sub_247914250(v14, v15, v18, v16, v29);
    (*(void (**)(void))(*v3 + 160))();
    LOBYTE(v24) = 3;
    sub_2479299A4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_24791EA6C()
{
  unint64_t result;

  result = qword_2576CD1E8[0];
  if (!qword_2576CD1E8[0])
  {
    result = MEMORY[0x249584764](&unk_24792C7D4, &type metadata for InspectorProperty.CodingKeys);
    atomic_store(result, qword_2576CD1E8);
  }
  return result;
}

unint64_t sub_24791EAB0()
{
  unint64_t result;

  result = qword_2576C8280;
  if (!qword_2576C8280)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyID, &type metadata for InspectorPropertyID);
    atomic_store(result, (unint64_t *)&qword_2576C8280);
  }
  return result;
}

uint64_t InspectorProperty.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  InspectorProperty.init(from:)(a1);
  return v2;
}

uint64_t InspectorProperty.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int128 v13;
  char v15;
  _OWORD v16[2];
  char v17;
  char v18;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8288);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24791EA6C();
  sub_247929AF4();
  if (v2)
  {
    type metadata accessor for InspectorProperty();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v18 = 0;
    sub_24791EDC8();
    sub_247929914();
    v10 = *((_QWORD *)&v16[0] + 1);
    *(_QWORD *)(v1 + 16) = *(_QWORD *)&v16[0];
    *(_QWORD *)(v1 + 24) = v10;
    LOBYTE(v16[0]) = 1;
    *(_QWORD *)(v1 + 32) = sub_2479298E4();
    *(_QWORD *)(v1 + 40) = v11;
    v18 = 2;
    sub_24791BA9C();
    sub_247929914();
    v12 = v17;
    v13 = v16[1];
    *(_OWORD *)(v1 + 48) = v16[0];
    *(_OWORD *)(v1 + 64) = v13;
    *(_BYTE *)(v1 + 80) = v12;
    LOBYTE(v16[0]) = 3;
    v15 = sub_2479298F0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *(_BYTE *)(v3 + 81) = v15 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t type metadata accessor for InspectorProperty()
{
  return objc_opt_self();
}

unint64_t sub_24791EDC8()
{
  unint64_t result;

  result = qword_2576C8290;
  if (!qword_2576C8290)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyID, &type metadata for InspectorPropertyID);
    atomic_store(result, (unint64_t *)&qword_2576C8290);
  }
  return result;
}

uint64_t sub_24791EE0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 208))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_24791EE38()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 200))();
}

uint64_t sub_24791EE60@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24791EE74(_QWORD **a1, _QWORD **a2)
{
  return _s26SpatialInspectorFoundation0B8PropertyC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

void InspectorProperty.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD v8[4];
  char v9;

  swift_bridgeObjectRetain();
  sub_2479294E8();
  v1 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 112))(v1);
  sub_2479294E8();
  v2 = swift_bridgeObjectRelease();
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)v0 + 136))(v8, v2);
  v3 = (void *)v8[0];
  v4 = v8[1];
  v5 = v8[2];
  v6 = v8[3];
  v7 = v9;
  sub_247914420();
  sub_24792941C();
  sub_247914250(v3, v4, v5, v6, v7);
}

uint64_t InspectorProperty.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD v9[4];
  char v10;

  sub_247929AAC();
  swift_bridgeObjectRetain();
  sub_2479294E8();
  v1 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v0 + 112))(v1);
  sub_2479294E8();
  v2 = swift_bridgeObjectRelease();
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)v0 + 136))(v9, v2);
  v3 = (void *)v9[0];
  v4 = v9[1];
  v5 = v9[2];
  v6 = v9[3];
  v7 = v10;
  sub_247914420();
  sub_24792941C();
  sub_247914250(v3, v4, v5, v6, v7);
  return sub_247929AE8();
}

uint64_t sub_24791F058()
{
  return InspectorProperty.hashValue.getter();
}

void sub_24791F078()
{
  InspectorProperty.hash(into:)();
}

uint64_t sub_24791F098()
{
  sub_247929AAC();
  InspectorProperty.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_24791F0D4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEE00657079546C61)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t _s26SpatialInspectorFoundation0B8PropertyC2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  void *v25;
  _QWORD v26[4];
  char v27;
  _QWORD v28[4];
  char v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  v4 = a1[2] == a2[2] && a1[3] == a2[3];
  if (v4 || (v5 = 0, (sub_247929A28() & 1) != 0))
  {
    v6 = (*(uint64_t (**)(void))(*a1 + 112))();
    v8 = v7;
    if (v6 == (*(uint64_t (**)(void))(*a2 + 112))() && v8 == v9)
    {
      v12 = swift_bridgeObjectRelease_n();
    }
    else
    {
      v11 = sub_247929A28();
      swift_bridgeObjectRelease();
      v12 = swift_bridgeObjectRelease();
      v5 = 0;
      if ((v11 & 1) == 0)
        return v5 & 1;
    }
    v13 = (*(_QWORD *(**)(void **__return_ptr, uint64_t))(*a1 + 136))(&v30, v12);
    v14 = v31;
    v25 = v30;
    v15 = v32;
    v16 = v33;
    v17 = v34;
    v28[0] = v30;
    v28[1] = v31;
    v28[2] = v32;
    v28[3] = v33;
    v29 = v34;
    (*(void (**)(_QWORD *__return_ptr, _QWORD *))(*a2 + 136))(v26, v13);
    v18 = (void *)v26[0];
    v19 = v26[1];
    v20 = v26[2];
    v21 = v26[3];
    v22 = v27;
    static InspectorPropertyValue.== infix(_:_:)((uint64_t)v28);
    v5 = v23;
    sub_247914250(v18, v19, v20, v21, v22);
    sub_247914250(v25, v14, v15, v16, v17);
  }
  return v5 & 1;
}

unint64_t sub_24791F40C(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_24791EDC8();
  a1[2] = sub_24791EAB0();
  a1[3] = sub_24791F448();
  result = sub_24791F48C();
  a1[4] = result;
  return result;
}

unint64_t sub_24791F448()
{
  unint64_t result;

  result = qword_2576C8298;
  if (!qword_2576C8298)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyID, &type metadata for InspectorPropertyID);
    atomic_store(result, (unint64_t *)&qword_2576C8298);
  }
  return result;
}

unint64_t sub_24791F48C()
{
  unint64_t result;

  result = qword_2576C82A0;
  if (!qword_2576C82A0)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyID, &type metadata for InspectorPropertyID);
    atomic_store(result, (unint64_t *)&qword_2576C82A0);
  }
  return result;
}

unint64_t sub_24791F4D4()
{
  unint64_t result;

  result = qword_2576C82A8;
  if (!qword_2576C82A8)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorPropertyID, &type metadata for InspectorPropertyID);
    atomic_store(result, (unint64_t *)&qword_2576C82A8);
  }
  return result;
}

uint64_t sub_24791F518()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_24791F528(_QWORD *a1)
{
  uint64_t result;

  a1[1] = sub_24791F5CC(&qword_2576C82E0, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  a1[2] = sub_24791F5CC(&qword_2576C82E8, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  a1[3] = sub_24791F5CC(&qword_2576C82F0, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  result = sub_24791F5CC(&qword_2576C82F8, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  a1[4] = result;
  return result;
}

uint64_t sub_24791F5A8()
{
  return sub_24791F5CC(&qword_2576C8300, (uint64_t)&protocol conformance descriptor for InspectorProperty);
}

uint64_t sub_24791F5CC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for InspectorProperty();
    result = MEMORY[0x249584764](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for InspectorPropertyID(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithTake for InspectorPropertyID(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for InspectorPropertyID()
{
  return &type metadata for InspectorPropertyID;
}

_QWORD *assignWithCopy for ComponentID(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentID(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ComponentID(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InspectorPropertyPointer()
{
  return &type metadata for InspectorPropertyPointer;
}

uint64_t method lookup function for InspectorProperty()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InspectorProperty.name.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of InspectorProperty.name.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of InspectorProperty.name.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of InspectorProperty.value.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of InspectorProperty.value.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of InspectorProperty.value.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of InspectorProperty.isInternalType.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of InspectorProperty.isInternalType.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of InspectorProperty.isInternalType.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of InspectorProperty.humanReadableName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of InspectorProperty.__allocating_init(id:name:value:isInternal:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of InspectorProperty.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of InspectorProperty.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t storeEnumTagSinglePayload for InspectorProperty.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24791F860 + 4 * byte_24792C379[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24791F894 + 4 * byte_24792C374[v4]))();
}

uint64_t sub_24791F894(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24791F89C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24791F8A4);
  return result;
}

uint64_t sub_24791F8B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24791F8B8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24791F8BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24791F8C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InspectorProperty.CodingKeys()
{
  return &type metadata for InspectorProperty.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for InspectorPropertyID.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24791F920 + 4 * byte_24792C37E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24791F940 + 4 * byte_24792C383[v4]))();
}

_BYTE *sub_24791F920(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24791F940(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24791F948(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24791F950(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24791F958(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24791F960(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for InspectorPropertyID.CodingKeys()
{
  return &type metadata for InspectorPropertyID.CodingKeys;
}

unint64_t sub_24791F980()
{
  unint64_t result;

  result = qword_2576CD8F0[0];
  if (!qword_2576CD8F0[0])
  {
    result = MEMORY[0x249584764](&unk_24792C6F4, &type metadata for InspectorPropertyID.CodingKeys);
    atomic_store(result, qword_2576CD8F0);
  }
  return result;
}

unint64_t sub_24791F9C8()
{
  unint64_t result;

  result = qword_2576CDB00[0];
  if (!qword_2576CDB00[0])
  {
    result = MEMORY[0x249584764](&unk_24792C7AC, &type metadata for InspectorProperty.CodingKeys);
    atomic_store(result, qword_2576CDB00);
  }
  return result;
}

unint64_t sub_24791FA10()
{
  unint64_t result;

  result = qword_2576CDC10;
  if (!qword_2576CDC10)
  {
    result = MEMORY[0x249584764](&unk_24792C71C, &type metadata for InspectorProperty.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CDC10);
  }
  return result;
}

unint64_t sub_24791FA58()
{
  unint64_t result;

  result = qword_2576CDC18[0];
  if (!qword_2576CDC18[0])
  {
    result = MEMORY[0x249584764](&unk_24792C744, &type metadata for InspectorProperty.CodingKeys);
    atomic_store(result, qword_2576CDC18);
  }
  return result;
}

unint64_t sub_24791FAA0()
{
  unint64_t result;

  result = qword_2576CDCA0;
  if (!qword_2576CDCA0)
  {
    result = MEMORY[0x249584764](&unk_24792C664, &type metadata for InspectorPropertyID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CDCA0);
  }
  return result;
}

unint64_t sub_24791FAE8()
{
  unint64_t result;

  result = qword_2576CDCA8[0];
  if (!qword_2576CDCA8[0])
  {
    result = MEMORY[0x249584764](&unk_24792C68C, &type metadata for InspectorPropertyID.CodingKeys);
    atomic_store(result, qword_2576CDCA8);
  }
  return result;
}

uint64_t sub_24791FB40()
{
  _BYTE *v0;

  if (*v0)
    return 0x65746F6D6572;
  else
    return 0x6C61636F6CLL;
}

uint64_t sub_24791FB74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247920EA0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24791FB98()
{
  sub_247920098();
  return sub_247929B54();
}

uint64_t sub_24791FBC0()
{
  sub_247920098();
  return sub_247929B60();
}

uint64_t sub_24791FBF0()
{
  return 12383;
}

uint64_t sub_24791FC00()
{
  sub_247920164();
  return sub_247929B54();
}

uint64_t sub_24791FC28()
{
  sub_247920164();
  return sub_247929B60();
}

uint64_t sub_24791FC50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_247929A28();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24791FCCC()
{
  sub_247920120();
  return sub_247929B54();
}

uint64_t sub_24791FCF4()
{
  sub_247920120();
  return sub_247929B60();
}

uint64_t RealityFileResource.encode(to:)(_QWORD *a1)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int EnumCaseMultiPayload;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char v43;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8420);
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  v36 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8428);
  v34 = *(_QWORD *)(v5 - 8);
  v35 = v5;
  MEMORY[0x24BDAC7A8](v5, v6);
  v33 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2479292F0();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v32 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v31 - v14;
  v16 = type metadata accessor for RealityFileResource();
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8430);
  v39 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41, v20);
  v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247920098();
  v23 = v9;
  sub_247929B00();
  sub_2479200DC(v40, (uint64_t)v19);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v25 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  if (EnumCaseMultiPayload == 1)
  {
    v15 = v32;
    v25(v32, v19, v8);
    v43 = 1;
    sub_247920120();
    v26 = v36;
    v27 = v41;
    sub_24792995C();
    sub_247920650(&qword_2576C8438, MEMORY[0x24BDCDAE0]);
    v28 = v38;
    sub_2479299C8();
    v29 = v37;
  }
  else
  {
    v25(v15, v19, v8);
    v42 = 0;
    sub_247920164();
    v26 = v33;
    v27 = v41;
    sub_24792995C();
    sub_247920650(&qword_2576C8438, MEMORY[0x24BDCDAE0]);
    v28 = v35;
    sub_2479299C8();
    v29 = v34;
  }
  (*(void (**)(char *, uint64_t))(v29 + 8))(v26, v28);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v15, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v22, v27);
}

uint64_t type metadata accessor for RealityFileResource()
{
  uint64_t result;

  result = qword_2576CDE50;
  if (!qword_2576CDE50)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_247920098()
{
  unint64_t result;

  result = qword_2576CDD30;
  if (!qword_2576CDD30)
  {
    result = MEMORY[0x249584764](&unk_24792CC2C, &type metadata for RealityFileResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CDD30);
  }
  return result;
}

uint64_t sub_2479200DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RealityFileResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_247920120()
{
  unint64_t result;

  result = qword_2576CDD38;
  if (!qword_2576CDD38)
  {
    result = MEMORY[0x249584764](&unk_24792CBDC, &type metadata for RealityFileResource.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CDD38);
  }
  return result;
}

unint64_t sub_247920164()
{
  unint64_t result;

  result = qword_2576CDD40[0];
  if (!qword_2576CDD40[0])
  {
    result = MEMORY[0x249584764](&unk_24792CB8C, &type metadata for RealityFileResource.LocalCodingKeys);
    atomic_store(result, qword_2576CDD40);
  }
  return result;
}

uint64_t RealityFileResource.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  char v52;

  v49 = a2;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8440);
  v45 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42, v3);
  v48 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8448);
  v43 = *(_QWORD *)(v5 - 8);
  v44 = v5;
  MEMORY[0x24BDAC7A8](v5, v6);
  v47 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8450);
  v46 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for RealityFileResource();
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v20 = (char *)&v38 - v19;
  MEMORY[0x24BDAC7A8](v18, v21);
  v23 = (char *)&v38 - v22;
  v24 = a1[3];
  v50 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_247920098();
  v25 = v51;
  sub_247929AF4();
  if (v25)
    goto LABEL_5;
  v40 = v16;
  v41 = v20;
  v26 = v48;
  v39 = v23;
  v51 = v12;
  v27 = v49;
  v28 = v11;
  if (*(_QWORD *)(sub_247929944() + 16) != 1)
  {
    v33 = sub_24792980C();
    swift_allocError();
    v35 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8458);
    *v35 = v51;
    sub_2479298A8();
    sub_247929800();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, *MEMORY[0x24BEE26D0], v33);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v11, v8);
LABEL_5:
    v32 = (uint64_t)v50;
    return __swift_destroy_boxed_opaque_existential_1(v32);
  }
  v52 = 1;
  sub_247920120();
  v29 = v26;
  sub_24792989C();
  sub_2479292F0();
  sub_247920650(&qword_2576C8460, MEMORY[0x24BDCDB10]);
  v30 = (uint64_t)v40;
  v31 = v42;
  sub_247929914();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v31);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v28, v8);
  v32 = (uint64_t)v50;
  swift_storeEnumTagMultiPayload();
  v37 = (uint64_t)v39;
  sub_247920690(v30, (uint64_t)v39);
  sub_247920690(v37, v27);
  return __swift_destroy_boxed_opaque_existential_1(v32);
}

uint64_t sub_247920650(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2479292F0();
    result = MEMORY[0x249584764](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247920690(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RealityFileResource();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2479206D4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return RealityFileResource.init(from:)(a1, a2);
}

uint64_t sub_2479206E8(_QWORD *a1)
{
  return RealityFileResource.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for RealityFileResource(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v6 = sub_2479292F0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for RealityFileResource(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2479292F0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for RealityFileResource(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_2479292F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for RealityFileResource(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_2479208D4(a1);
    swift_getEnumCaseMultiPayload();
    v4 = sub_2479292F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2479208D4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RealityFileResource();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for RealityFileResource(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_2479292F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for RealityFileResource(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_2479208D4(a1);
    swift_getEnumCaseMultiPayload();
    v4 = sub_2479292F0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for RealityFileResource(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for RealityFileResource(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_247920A24()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_247920A34()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2479292F0();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for RealityFileResource.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247920AE4 + 4 * byte_24792C885[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247920B18 + 4 * byte_24792C880[v4]))();
}

uint64_t sub_247920B18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247920B20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247920B28);
  return result;
}

uint64_t sub_247920B34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247920B3CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247920B40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247920B48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RealityFileResource.CodingKeys()
{
  return &type metadata for RealityFileResource.CodingKeys;
}

ValueMetadata *type metadata accessor for RealityFileResource.LocalCodingKeys()
{
  return &type metadata for RealityFileResource.LocalCodingKeys;
}

uint64_t _s26SpatialInspectorFoundation19RealityFileResourceO15LocalCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247920BBC + 4 * byte_24792C88A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247920BDC + 4 * byte_24792C88F[v4]))();
}

_BYTE *sub_247920BBC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247920BDC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247920BE4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247920BEC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247920BF4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247920BFC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RealityFileResource.RemoteCodingKeys()
{
  return &type metadata for RealityFileResource.RemoteCodingKeys;
}

unint64_t sub_247920C1C()
{
  unint64_t result;

  result = qword_2576CDF60[0];
  if (!qword_2576CDF60[0])
  {
    result = MEMORY[0x249584764](&unk_24792C9F4, &type metadata for RealityFileResource.RemoteCodingKeys);
    atomic_store(result, qword_2576CDF60);
  }
  return result;
}

unint64_t sub_247920C64()
{
  unint64_t result;

  result = qword_2576CE170[0];
  if (!qword_2576CE170[0])
  {
    result = MEMORY[0x249584764](&unk_24792CAAC, &type metadata for RealityFileResource.LocalCodingKeys);
    atomic_store(result, qword_2576CE170);
  }
  return result;
}

unint64_t sub_247920CAC()
{
  unint64_t result;

  result = qword_2576CE380[0];
  if (!qword_2576CE380[0])
  {
    result = MEMORY[0x249584764](&unk_24792CB64, &type metadata for RealityFileResource.CodingKeys);
    atomic_store(result, qword_2576CE380);
  }
  return result;
}

unint64_t sub_247920CF4()
{
  unint64_t result;

  result = qword_2576CE490;
  if (!qword_2576CE490)
  {
    result = MEMORY[0x249584764](&unk_24792CA1C, &type metadata for RealityFileResource.LocalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CE490);
  }
  return result;
}

unint64_t sub_247920D3C()
{
  unint64_t result;

  result = qword_2576CE498[0];
  if (!qword_2576CE498[0])
  {
    result = MEMORY[0x249584764](&unk_24792CA44, &type metadata for RealityFileResource.LocalCodingKeys);
    atomic_store(result, qword_2576CE498);
  }
  return result;
}

unint64_t sub_247920D84()
{
  unint64_t result;

  result = qword_2576CE520;
  if (!qword_2576CE520)
  {
    result = MEMORY[0x249584764](&unk_24792C964, &type metadata for RealityFileResource.RemoteCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CE520);
  }
  return result;
}

unint64_t sub_247920DCC()
{
  unint64_t result;

  result = qword_2576CE528[0];
  if (!qword_2576CE528[0])
  {
    result = MEMORY[0x249584764](&unk_24792C98C, &type metadata for RealityFileResource.RemoteCodingKeys);
    atomic_store(result, qword_2576CE528);
  }
  return result;
}

unint64_t sub_247920E14()
{
  unint64_t result;

  result = qword_2576CE5B0;
  if (!qword_2576CE5B0)
  {
    result = MEMORY[0x249584764](&unk_24792CAD4, &type metadata for RealityFileResource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CE5B0);
  }
  return result;
}

unint64_t sub_247920E5C()
{
  unint64_t result;

  result = qword_2576CE5B8[0];
  if (!qword_2576CE5B8[0])
  {
    result = MEMORY[0x249584764](&unk_24792CAFC, &type metadata for RealityFileResource.CodingKeys);
    atomic_store(result, qword_2576CE5B8);
  }
  return result;
}

uint64_t sub_247920EA0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746F6D6572 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t SpatialInspectorVersion.major.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SpatialInspectorVersion.minor.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t SpatialInspectorVersion.debugDescription.getter()
{
  uint64_t v1;

  v1 = sub_247929A04();
  sub_247929530();
  sub_247929A04();
  sub_247929530();
  swift_bridgeObjectRelease();
  return v1;
}

BOOL static SpatialInspectorVersion.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_24792103C()
{
  _BYTE *v0;

  if (*v0)
    return 0x726F6E696DLL;
  else
    return 0x726F6A616DLL;
}

uint64_t sub_247921068@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2479216A4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24792108C()
{
  sub_2479211FC();
  return sub_247929B54();
}

uint64_t sub_2479210B4()
{
  sub_2479211FC();
  return sub_247929B60();
}

uint64_t SpatialInspectorVersion.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];
  char v11;
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8500);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = *(_QWORD *)(v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479211FC();
  sub_247929B00();
  v12 = 0;
  sub_2479299BC();
  if (!v2)
  {
    v11 = 1;
    sub_2479299BC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

unint64_t sub_2479211FC()
{
  unint64_t result;

  result = qword_2576CE640[0];
  if (!qword_2576CE640[0])
  {
    result = MEMORY[0x249584764](&unk_24792CEC8, &type metadata for SpatialInspectorVersion.CodingKeys);
    atomic_store(result, qword_2576CE640);
  }
  return result;
}

uint64_t SpatialInspectorVersion.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  char v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8508);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479211FC();
  sub_247929AF4();
  if (!v2)
  {
    v15 = 0;
    v10 = sub_247929908();
    v14 = 1;
    v11 = sub_247929908();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_247921388@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_247921390@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return SpatialInspectorVersion.init(from:)(a1, a2);
}

uint64_t sub_2479213A4(_QWORD *a1)
{
  return SpatialInspectorVersion.encode(to:)(a1);
}

BOOL sub_2479213B8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t SpatialInspectorVersioningError.description.getter()
{
  sub_2479297C4();
  sub_247929530();
  sub_247929A04();
  sub_247929530();
  swift_bridgeObjectRelease();
  sub_247929530();
  sub_247929A04();
  sub_247929530();
  swift_bridgeObjectRelease();
  return 0;
}

ValueMetadata *type metadata accessor for SpatialInspectorVersion()
{
  return &type metadata for SpatialInspectorVersion;
}

ValueMetadata *type metadata accessor for SpatialInspectorVersioningError()
{
  return &type metadata for SpatialInspectorVersioningError;
}

uint64_t storeEnumTagSinglePayload for SpatialInspectorVersion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24792154C + 4 * byte_24792CC85[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247921580 + 4 * byte_24792CC80[v4]))();
}

uint64_t sub_247921580(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247921588(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247921590);
  return result;
}

uint64_t sub_24792159C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2479215A4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2479215A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2479215B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SpatialInspectorVersion.CodingKeys()
{
  return &type metadata for SpatialInspectorVersion.CodingKeys;
}

unint64_t sub_2479215D0()
{
  unint64_t result;

  result = qword_2576CEA50[0];
  if (!qword_2576CEA50[0])
  {
    result = MEMORY[0x249584764](&unk_24792CEA0, &type metadata for SpatialInspectorVersion.CodingKeys);
    atomic_store(result, qword_2576CEA50);
  }
  return result;
}

unint64_t sub_247921618()
{
  unint64_t result;

  result = qword_2576CEB60;
  if (!qword_2576CEB60)
  {
    result = MEMORY[0x249584764](&unk_24792CE10, &type metadata for SpatialInspectorVersion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CEB60);
  }
  return result;
}

unint64_t sub_247921660()
{
  unint64_t result;

  result = qword_2576CEB68[0];
  if (!qword_2576CEB68[0])
  {
    result = MEMORY[0x249584764](&unk_24792CE38, &type metadata for SpatialInspectorVersion.CodingKeys);
    atomic_store(result, qword_2576CEB68);
  }
  return result;
}

uint64_t sub_2479216A4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x726F6A616DLL && a2 == 0xE500000000000000;
  if (v2 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726F6E696DLL && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

SpatialInspectorFoundation::InspectorEntityRepresentation::Icon_optional __swiftcall InspectorEntityRepresentation.Icon.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  SpatialInspectorFoundation::InspectorEntityRepresentation::Icon_optional result;
  char v5;

  v2 = v1;
  v3 = sub_247929890();
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

uint64_t InspectorEntityRepresentation.Icon.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000010;
  else
    return 0x64332E65766F6DLL;
}

uint64_t sub_24792182C(char *a1, char *a2)
{
  return sub_247921838(*a1, *a2);
}

uint64_t sub_247921838(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000010;
  else
    v3 = 0x64332E65766F6DLL;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0x80000002479315B0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000010;
  else
    v5 = 0x64332E65766F6DLL;
  if ((a2 & 1) != 0)
    v6 = 0x80000002479315B0;
  else
    v6 = 0xE700000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_247929A28();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2479218E0()
{
  sub_247929AAC();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  return sub_247929AE8();
}

uint64_t sub_247921964()
{
  sub_2479294E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2479219C4()
{
  sub_247929AAC();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  return sub_247929AE8();
}

SpatialInspectorFoundation::InspectorEntityRepresentation::Icon_optional sub_247921A44(Swift::String *a1)
{
  return InspectorEntityRepresentation.Icon.init(rawValue:)(*a1);
}

void sub_247921A50(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0x64332E65766F6DLL;
  if (*v1)
    v2 = 0xD000000000000010;
  v3 = 0x80000002479315B0;
  if (!*v1)
    v3 = 0xE700000000000000;
  *a1 = v2;
  a1[1] = v3;
}

void InspectorEntityRepresentation.id.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
}

uint64_t InspectorEntityRepresentation.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorEntityRepresentation.pointer.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorEntityRepresentation.type.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorEntityRepresentation.wasActive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 72);
}

uint64_t InspectorEntityRepresentation.wasAnchored.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 73);
}

uint64_t InspectorEntityRepresentation.wasEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 74);
}

uint64_t InspectorEntityRepresentation.wasEnabledInHierarchy.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 75);
}

uint64_t sub_247921B44@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 200))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_247921B78(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 208))(*a1);
}

uint64_t sub_247921BA4()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 76);
}

uint64_t sub_247921BD4(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 76) = a1;
  return result;
}

uint64_t (*sub_247921C10())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_247921C4C@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 224))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_247921C80(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 232))(*a1);
}

uint64_t sub_247921CAC(char a1)
{
  uint64_t v1;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v1 + 320))(&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8248);
  v3 = InspectorCollection.makeIterator()();
  v5 = v4;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_247929854();
    result = swift_bridgeObjectRelease();
    v8 = v5 < v7;
    if (v5 == v7)
      goto LABEL_3;
  }
  else
  {
    v7 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    v8 = v5 < v7;
    if (v5 == v7)
    {
LABEL_3:
      swift_bridgeObjectRelease();
      type metadata accessor for InspectorEntityRepresentation();
      sub_2479252B8(&qword_2576C87A0, v9, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
      sub_247929380();
      sub_24792938C();
      return swift_release();
    }
  }
  if (v8)
  {
    if ((v3 & 0xC000000000000001) != 0)
      goto LABEL_14;
    if ((v5 & 0x8000000000000000) == 0)
    {
      v10 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v5 < v10 && v7 - 1 < v10)
        goto LABEL_14;
      __break(1u);
LABEL_12:
      v11 = MEMORY[0x2495840B0](v5, v3);
      while (1)
      {
        ++v5;
        (*(void (**)(_QWORD))(*(_QWORD *)v11 + 256))(a1 & 1);
        swift_release();
        if (v7 == v5)
          goto LABEL_3;
LABEL_14:
        if ((v3 & 0xC000000000000001) != 0)
          goto LABEL_12;
        v11 = *(_QWORD *)(v3 + 8 * v5 + 32);
        swift_retain();
      }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_247921E44()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 77);
}

uint64_t sub_247921E74(char a1)
{
  uint64_t v1;
  uint64_t result;

  sub_247921CAC(a1);
  result = swift_beginAccess();
  *(_BYTE *)(v1 + 77) = a1;
  return result;
}

void (*sub_247921EB4(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_beginAccess();
  *((_BYTE *)v3 + 32) = *(_BYTE *)(v1 + 77);
  return sub_247921F14;
}

void sub_247921F14(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  char v3;

  v1 = *(void **)a1;
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v3 = *(_BYTE *)(*(_QWORD *)a1 + 32);
  sub_247921CAC(v3);
  *(_BYTE *)(v2 + 77) = v3;
  free(v1);
}

uint64_t sub_247921F50@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 248))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_247921F84(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 256))(*a1);
}

uint64_t sub_247921FB0()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 78);
}

uint64_t sub_247921FE0(char a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = v1;
  if (((*(uint64_t (**)(void))(*(_QWORD *)v1 + 224))() & 1) == 0)
    goto LABEL_5;
  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v1 + 320))(&v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8248);
  v4 = InspectorCollection.makeIterator()();
  v6 = v5;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_247929854();
    result = swift_bridgeObjectRelease();
    v9 = v6 < v8;
    if (v6 == v8)
      goto LABEL_4;
  }
  else
  {
    v8 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = v6 < v8;
    if (v6 == v8)
    {
LABEL_4:
      swift_bridgeObjectRelease();
LABEL_5:
      result = swift_beginAccess();
      *(_BYTE *)(v2 + 78) = a1 & 1;
      return result;
    }
  }
  if (v9)
  {
    if ((v4 & 0xC000000000000001) != 0)
      goto LABEL_16;
    if ((v6 & 0x8000000000000000) == 0)
    {
      v10 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v6 < v10 && v8 - 1 < v10)
        goto LABEL_16;
      __break(1u);
LABEL_14:
      v11 = MEMORY[0x2495840B0](v6, v4);
      while (1)
      {
        ++v6;
        (*(void (**)(_QWORD))(*(_QWORD *)v11 + 256))(a1 & 1);
        swift_release();
        if (v8 == v6)
          goto LABEL_4;
LABEL_16:
        if ((v4 & 0xC000000000000001) != 0)
          goto LABEL_14;
        v11 = *(_QWORD *)(v4 + 8 * v6 + 32);
        swift_retain();
      }
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_247922168(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  swift_beginAccess();
  *((_BYTE *)v3 + 32) = *(_BYTE *)(v1 + 78);
  return sub_2479221C8;
}

void sub_2479221C8(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  sub_247921FE0(*(_BYTE *)(*(_QWORD *)a1 + 32));
  free(v1);
}

void sub_2479221F4(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

_QWORD *sub_247922204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *result;
  char v4;
  uint64_t v5;
  char v6;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(**(_QWORD **)a1 + 272))(&v5);
  v4 = v6;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_24792224C(uint64_t *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v5;
  char v6;

  v2 = *((_BYTE *)a1 + 8);
  v3 = *a2;
  v5 = *a1;
  v6 = v2;
  return (*(uint64_t (**)(uint64_t *))(*(_QWORD *)v3 + 280))(&v5);
}

uint64_t sub_247922290@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  char v4;

  result = swift_beginAccess();
  v4 = *(_BYTE *)(v1 + 88);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 80);
  *(_BYTE *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_2479222D8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 80) = v2;
  *(_BYTE *)(v1 + 88) = v3;
  return result;
}

uint64_t (*sub_247922324())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_247922360@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorProperty();
  sub_247914C90();
  sub_2479252B8(&qword_2576C7F80, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorProperty, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  return InspectorCollection.init()(a1);
}

double sub_2479223D8@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)a1 + 296))(&v4);
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_247922418(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD *);
  _QWORD v6[2];

  v2 = a1[1];
  v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  v4 = *(uint64_t (**)(_QWORD *))(*(_QWORD *)v3 + 304);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(v6);
}

uint64_t sub_24792246C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 96);
  v4 = *(_QWORD *)(v1 + 104);
  *a1 = v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2479224B8(_OWORD *a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_OWORD *)(v1 + 96) = *a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_247922510())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24792254C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;

  type metadata accessor for InspectorEntityRepresentation();
  sub_24791C2A8();
  sub_2479252B8((unint64_t *)&qword_2576C8238, v2, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
  return InspectorCollection.init()(a1);
}

uint64_t type metadata accessor for InspectorEntityRepresentation()
{
  return objc_opt_self();
}

double sub_2479225DC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)a1 + 320))(&v4);
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_24792261C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD *);
  _QWORD v6[2];

  v2 = a1[1];
  v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  v4 = *(uint64_t (**)(_QWORD *))(*(_QWORD *)v3 + 328);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(v6);
}

uint64_t sub_247922670@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 112);
  v4 = *(_QWORD *)(v1 + 120);
  *a1 = v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2479226BC(_OWORD *a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_OWORD *)(v1 + 112) = *a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_247922714())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_247922750@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for InspectorComponentRepresentation();
  sub_2479227C8();
  sub_2479252B8(&qword_2576C8518, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
  return InspectorCollection.init()(a1);
}

unint64_t sub_2479227C8()
{
  unint64_t result;

  result = qword_2576C8510;
  if (!qword_2576C8510)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for ComponentID, &type metadata for ComponentID);
    atomic_store(result, (unint64_t *)&qword_2576C8510);
  }
  return result;
}

double sub_24792280C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)a1 + 344))(&v4);
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_24792284C(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD *);
  _QWORD v6[2];

  v2 = a1[1];
  v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  v4 = *(uint64_t (**)(_QWORD *))(*(_QWORD *)v3 + 352);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(v6);
}

uint64_t sub_2479228A0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 128);
  v4 = *(_QWORD *)(v1 + 136);
  *a1 = v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2479228EC(_OWORD *a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_OWORD *)(v1 + 128) = *a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_247922944())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_247922980()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)v0 + 344))(&v17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8520);
  sub_24791431C(&qword_2576C8528, &qword_2576C8520, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
  result = sub_2479295B4();
  v2 = v16;
  v3 = v15 >> 62;
  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_247929854();
    result = swift_bridgeObjectRelease();
    if (v16 == v4)
      goto LABEL_3;
  }
  else if (v16 == *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((v15 & 0xC000000000000001) != 0)
    goto LABEL_38;
  if ((v16 & 0x8000000000000000) != 0)
    goto LABEL_41;
  if (v16 >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    return result;
  }
  v5 = *(_QWORD *)(v15 + 8 * v16 + 32);
  result = swift_retain();
  v6 = v16 + 1;
  if (__OFADD__(v16, 1))
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  while (1)
  {
    if (*(_QWORD *)(v5 + 32) == 0x6D6F436C65646F4DLL && *(_QWORD *)(v5 + 40) == 0xEE00746E656E6F70)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_release();
      return 1;
    }
    v7 = sub_247929A28();
    result = swift_release();
    if ((v7 & 1) != 0)
      break;
    if (v3)
    {
      swift_bridgeObjectRetain();
      v8 = sub_247929854();
      result = swift_bridgeObjectRelease();
      if (v6 == v8)
        goto LABEL_3;
    }
    else if (v6 == *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_3;
    }
    v9 = v2 + 5;
    while (1)
    {
      v11 = v9 - 4;
      if ((v15 & 0xC000000000000001) == 0)
        break;
      v2 = MEMORY[0x2495840B0](v9 - 4);
      v12 = v9 - 3;
      if (__OFADD__(v11, 1))
        goto LABEL_37;
LABEL_29:
      if (*(_QWORD *)(v2 + 32) == 0x6D6F436C65646F4DLL && *(_QWORD *)(v2 + 40) == 0xEE00746E656E6F70)
        goto LABEL_11;
      v14 = sub_247929A28();
      result = swift_release();
      if ((v14 & 1) != 0)
        goto LABEL_13;
      if (v3)
      {
        swift_bridgeObjectRetain();
        v10 = sub_247929854();
        result = swift_bridgeObjectRelease();
      }
      else
      {
        v10 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      ++v9;
      if (v12 == v10)
        goto LABEL_3;
    }
    if ((v11 & 0x8000000000000000) != 0)
      goto LABEL_43;
    if (v11 >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_44;
    v2 = *(_QWORD *)(v15 + 8 * v9);
    swift_retain();
    v12 = v9 - 3;
    if (!__OFADD__(v11, 1))
      goto LABEL_29;
LABEL_37:
    __break(1u);
LABEL_38:
    result = MEMORY[0x2495840B0](v2);
    v5 = result;
    v6 = v2 + 1;
    if (__OFADD__(v2, 1))
      goto LABEL_40;
  }
LABEL_13:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

unint64_t sub_247922D08()
{
  uint64_t v0;

  return sub_24791CECC(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_247922D10@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 368))();
  *a1 = result & 1;
  return result;
}

uint64_t InspectorEntityRepresentation.__allocating_init(id:name:pointer:type:parent:wasActive:wasAnchored:wasEnabled:wasEnabledInHierarchy:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10, char a11, char a12)
{
  uint64_t v17;

  v17 = swift_allocObject();
  InspectorEntityRepresentation.init(id:name:pointer:type:parent:wasActive:wasAnchored:wasEnabled:wasEnabledInHierarchy:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
  return v17;
}

uint64_t InspectorEntityRepresentation.init(id:name:pointer:type:parent:wasActive:wasAnchored:wasEnabled:wasEnabledInHierarchy:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, char a10, char a11, char a12)
{
  uint64_t v12;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  *(_QWORD *)(v12 + 80) = 0;
  *(_BYTE *)(v12 + 76) = 1;
  *(_BYTE *)(v12 + 78) = 1;
  *(_BYTE *)(v12 + 88) = 1;
  v16 = *a1;
  type metadata accessor for InspectorProperty();
  sub_247914C90();
  sub_2479252B8(&qword_2576C7F80, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorProperty, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  InspectorCollection.init()((uint64_t *)(v12 + 96));
  type metadata accessor for InspectorEntityRepresentation();
  sub_24791C2A8();
  sub_2479252B8((unint64_t *)&qword_2576C8238, v17, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
  InspectorCollection.init()((uint64_t *)(v12 + 112));
  type metadata accessor for InspectorComponentRepresentation();
  sub_2479227C8();
  sub_2479252B8(&qword_2576C8518, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
  InspectorCollection.init()((uint64_t *)(v12 + 128));
  *(_QWORD *)(v12 + 16) = v16;
  *(_QWORD *)(v12 + 24) = a2;
  *(_QWORD *)(v12 + 32) = a3;
  *(_QWORD *)(v12 + 40) = a4;
  *(_QWORD *)(v12 + 48) = a5;
  *(_QWORD *)(v12 + 56) = a6;
  *(_QWORD *)(v12 + 64) = a7;
  if (a8)
  {
    v18 = *(_QWORD *)(a8 + 16);
    swift_release();
  }
  else
  {
    v18 = 0;
  }
  swift_beginAccess();
  *(_QWORD *)(v12 + 80) = v18;
  *(_BYTE *)(v12 + 88) = a8 == 0;
  *(_BYTE *)(v12 + 72) = a9 & 1;
  *(_BYTE *)(v12 + 73) = a10 & 1;
  *(_BYTE *)(v12 + 74) = a11 & 1;
  *(_BYTE *)(v12 + 75) = a12 & 1;
  *(_BYTE *)(v12 + 77) = a9 & 1;
  return v12;
}

uint64_t sub_247923014(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24792303C + 4 * byte_24792CF20[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_24792303C()
{
  return 1701667182;
}

uint64_t sub_24792304C()
{
  return 0x7265746E696F70;
}

uint64_t sub_247923064()
{
  return 1701869940;
}

uint64_t sub_247923074()
{
  return 0x7669746341736177;
}

uint64_t sub_24792311C()
{
  return 0x746E657261507369;
}

uint64_t sub_247923140()
{
  return 0x4449746E65726170;
}

uint64_t sub_247923158()
{
  return 0x69747265706F7270;
}

uint64_t sub_247923178()
{
  return 0x6E6572646C696863;
}

uint64_t sub_247923190()
{
  return 0x6E656E6F706D6F63;
}

uint64_t sub_2479231B0()
{
  unsigned __int8 *v0;

  return sub_247923014(*v0);
}

uint64_t sub_2479231B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247924440(a1, a2);
  *a3 = result;
  return result;
}

void sub_2479231DC(_BYTE *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_2479231E8()
{
  sub_2479237D8();
  return sub_247929B54();
}

uint64_t sub_247923210()
{
  sub_2479237D8();
  return sub_247929B60();
}

uint64_t InspectorEntityRepresentation.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorEntityRepresentation.__deallocating_deinit()
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
  return swift_deallocClassInstance();
}

uint64_t sub_247923308(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8530);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2479237D8();
  sub_247929B00();
  v20 = v3[2];
  LOBYTE(v18) = 0;
  sub_247906BA8();
  sub_2479299C8();
  if (!v2)
  {
    LOBYTE(v20) = 1;
    sub_247929998();
    LOBYTE(v20) = 2;
    sub_247929998();
    LOBYTE(v20) = 3;
    sub_247929998();
    LOBYTE(v20) = 4;
    sub_2479299A4();
    LOBYTE(v20) = 5;
    sub_2479299A4();
    LOBYTE(v20) = 6;
    sub_2479299A4();
    LOBYTE(v20) = 7;
    v10 = sub_2479299A4();
    (*(void (**)(uint64_t))(*v3 + 200))(v10);
    LOBYTE(v20) = 8;
    v11 = sub_2479299A4();
    (*(void (**)(uint64_t))(*v3 + 224))(v11);
    LOBYTE(v20) = 9;
    v12 = sub_2479299A4();
    (*(void (**)(uint64_t))(*v3 + 248))(v12);
    LOBYTE(v20) = 10;
    v13 = sub_2479299A4();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 272))(&v20, v13);
    v18 = v20;
    LOBYTE(v19) = v21;
    v22 = 11;
    v14 = sub_247929974();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 296))(&v20, v14);
    v18 = v20;
    v19 = v21;
    v22 = 12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EC0);
    sub_24791431C(&qword_2576C8218, &qword_2576C7EC0, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_2479299C8();
    swift_bridgeObjectRelease();
    v15 = swift_bridgeObjectRelease();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 320))(&v20, v15);
    v18 = v20;
    v19 = v21;
    v22 = 13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8248);
    sub_24791431C(&qword_2576C8250, &qword_2576C8248, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_2479299C8();
    swift_bridgeObjectRelease();
    v16 = swift_bridgeObjectRelease();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 344))(&v20, v16);
    v18 = v20;
    v19 = v21;
    v22 = 14;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8520);
    sub_24791431C(&qword_2576C8538, &qword_2576C8520, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_2479299C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_2479237D8()
{
  unint64_t result;

  result = qword_2576CEBF0[0];
  if (!qword_2576CEBF0[0])
  {
    result = MEMORY[0x249584764](&unk_24792D2F4, &type metadata for InspectorEntityRepresentation.CodingKeys);
    atomic_store(result, qword_2576CEBF0);
  }
  return result;
}

uint64_t InspectorEntityRepresentation.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  InspectorEntityRepresentation.init(from:)(a1);
  return v2;
}

uint64_t InspectorEntityRepresentation.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[6];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;

  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8540);
  v30 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31, v3);
  v5 = (char *)v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = v1;
  *(_QWORD *)(v1 + 80) = 0;
  v6 = v1 + 80;
  *(_BYTE *)(v1 + 76) = 1;
  v7 = (_BYTE *)(v1 + 76);
  *(_BYTE *)(v1 + 78) = 1;
  *(_BYTE *)(v1 + 88) = 1;
  type metadata accessor for InspectorProperty();
  sub_247914C90();
  sub_2479252B8(&qword_2576C7F80, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorProperty, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  v29[5] = v1 + 96;
  InspectorCollection.init()((uint64_t *)(v1 + 96));
  v8 = type metadata accessor for InspectorEntityRepresentation();
  sub_24791C2A8();
  sub_2479252B8((unint64_t *)&qword_2576C8238, v9, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
  v29[4] = v1 + 112;
  v32 = v8;
  InspectorCollection.init()((uint64_t *)(v1 + 112));
  type metadata accessor for InspectorComponentRepresentation();
  sub_2479227C8();
  sub_2479252B8(&qword_2576C8518, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
  InspectorCollection.init()((uint64_t *)(v1 + 128));
  v10 = a1[3];
  v33 = (uint64_t)a1;
  v11 = a1;
  v12 = v5;
  __swift_project_boxed_opaque_existential_1(v11, v10);
  sub_2479237D8();
  v13 = v34;
  sub_247929AF4();
  if (v13)
  {
    v16 = v33;
    v27 = v43;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    v28 = v16;
  }
  else
  {
    *(_QWORD *)&v34 = v1 + 80;
    v29[3] = v1 + 128;
    v14 = v30;
    v41 = 0;
    v15 = sub_247907018();
    sub_247929914();
    v29[2] = v15;
    v18 = v43;
    *(_QWORD *)(v43 + 16) = v42;
    LOBYTE(v42) = 1;
    *(_QWORD *)(v18 + 24) = sub_2479298E4();
    *(_QWORD *)(v18 + 32) = v19;
    LOBYTE(v42) = 2;
    *(_QWORD *)(v18 + 40) = sub_2479298E4();
    *(_QWORD *)(v18 + 48) = v20;
    LOBYTE(v42) = 3;
    *(_QWORD *)(v18 + 56) = sub_2479298E4();
    *(_QWORD *)(v18 + 64) = v21;
    LOBYTE(v42) = 4;
    v29[1] = 0;
    *(_BYTE *)(v18 + 72) = sub_2479298F0() & 1;
    LOBYTE(v42) = 5;
    *(_BYTE *)(v18 + 73) = sub_2479298F0() & 1;
    LOBYTE(v42) = 6;
    *(_BYTE *)(v18 + 74) = sub_2479298F0() & 1;
    LOBYTE(v42) = 7;
    *(_BYTE *)(v18 + 75) = sub_2479298F0() & 1;
    LOBYTE(v42) = 8;
    v22 = sub_2479298F0();
    swift_beginAccess();
    *v7 = v22 & 1;
    v41 = 9;
    *(_BYTE *)(v43 + 77) = sub_2479298F0() & 1;
    v41 = 10;
    v23 = sub_2479298F0();
    swift_beginAccess();
    *(_BYTE *)(v6 - 2) = v23 & 1;
    v40 = 11;
    sub_2479298C0();
    v24 = v38;
    v25 = v39;
    swift_beginAccess();
    v26 = v43;
    *(_QWORD *)(v43 + 80) = v24;
    *(_BYTE *)(v26 + 88) = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EC0);
    LOBYTE(v38) = 12;
    sub_24791431C(&qword_2576C8228, &qword_2576C7EC0, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_247929914();
    v34 = v37;
    swift_beginAccess();
    *(_OWORD *)(v43 + 96) = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8248);
    LOBYTE(v37) = 13;
    sub_24791431C(&qword_2576C8260, &qword_2576C8248, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_247929914();
    v34 = v35;
    swift_beginAccess();
    *(_OWORD *)(v43 + 112) = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8520);
    LOBYTE(v35) = 14;
    sub_24791431C(&qword_2576C8548, &qword_2576C8520, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_247929914();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v31);
    v34 = v36;
    swift_beginAccess();
    v27 = v43;
    *(_OWORD *)(v43 + 128) = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v28 = v33;
  }
  __swift_destroy_boxed_opaque_existential_1(v28);
  return v27;
}

uint64_t sub_2479240F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for InspectorEntityRepresentation();
  result = sub_247929380();
  *a1 = result;
  return result;
}

uint64_t sub_24792412C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 408))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_247924158()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 400))();
}

void sub_247924180(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16);
}

uint64_t sub_247924194(_QWORD **a1, _QWORD **a2)
{
  return _s26SpatialInspectorFoundation0B20EntityRepresentationC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t InspectorEntityRepresentation.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v5 = v0[2];
  sub_2479165D0();
  sub_24792941C();
  swift_bridgeObjectRetain();
  sub_2479294E8();
  v1 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v0 + 296))(&v5, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EC0);
  sub_24791431C(&qword_2576C7EC8, &qword_2576C7EC0, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
  sub_24792941C();
  swift_bridgeObjectRelease();
  v2 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v0 + 320))(&v5, v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8248);
  sub_24791431C(&qword_2576C8550, &qword_2576C8248, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
  sub_24792941C();
  swift_bridgeObjectRelease();
  v3 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v0 + 344))(&v5, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8520);
  sub_24791431C(&qword_2576C8558, &qword_2576C8520, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
  sub_24792941C();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t InspectorEntityRepresentation.hashValue.getter()
{
  sub_247929AAC();
  InspectorEntityRepresentation.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_2479243A4()
{
  sub_247929AAC();
  InspectorEntityRepresentation.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_2479243E4()
{
  return InspectorEntityRepresentation.hash(into:)();
}

uint64_t sub_247924404()
{
  sub_247929AAC();
  InspectorEntityRepresentation.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_247924440(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7265746E696F70 && a2 == 0xE700000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x7669746341736177 && a2 == 0xE900000000000065 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6F68636E41736177 && a2 == 0xEB00000000646572 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C62616E45736177 && a2 == 0xEA00000000006465 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000247931650 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x8000000247931670 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x6C62697369567369 && a2 == 0xE900000000000065 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x746E657261507369 && a2 == 0xEF656C6269736956 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x4449746E65726170 && a2 == 0xE800000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x69747265706F7270 && a2 == 0xEA00000000007365 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x6E6572646C696863 && a2 == 0xE800000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 0x6E656E6F706D6F63 && a2 == 0xEA00000000007374)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 14;
    else
      return 15;
  }
}

uint64_t _s26SpatialInspectorFoundation0B20EntityRepresentationC2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  _QWORD *v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = a1[2];
  v16 = a2[2];
  if (!static EntityID.== infix(_:_:)(&v18, &v16))
    goto LABEL_10;
  v4 = a1[3] == a2[3] && a1[4] == a2[4];
  if (v4 || (v5 = 0, (sub_247929A28() & 1) != 0))
  {
    v6 = (*(_QWORD *(**)(uint64_t *__return_ptr))(*a1 + 296))(&v18);
    v16 = v18;
    v17 = v19;
    (*(void (**)(uint64_t *__return_ptr, _QWORD *))(*a2 + 296))(&v15, v6);
    type metadata accessor for InspectorProperty();
    sub_247914C90();
    sub_2479252B8(&qword_2576C7F80, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorProperty, (uint64_t)&protocol conformance descriptor for InspectorProperty);
    v7 = static InspectorCollection.== infix(_:_:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v8 = swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
    {
      v9 = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t))(*a1 + 320))(&v18, v8);
      v16 = v18;
      v17 = v19;
      (*(void (**)(uint64_t *__return_ptr, _QWORD *))(*a2 + 320))(&v15, v9);
      type metadata accessor for InspectorEntityRepresentation();
      sub_24791C2A8();
      sub_2479252B8((unint64_t *)&qword_2576C8238, v10, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
      v11 = static InspectorCollection.== infix(_:_:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
      {
        v13 = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t))(*a1 + 344))(&v18, v12);
        v16 = v18;
        v17 = v19;
        (*(void (**)(uint64_t *__return_ptr, _QWORD *))(*a2 + 344))(&v15, v13);
        type metadata accessor for InspectorComponentRepresentation();
        sub_2479227C8();
        sub_2479252B8(&qword_2576C8518, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
        v5 = static InspectorCollection.== infix(_:_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v5 & 1;
      }
    }
LABEL_10:
    v5 = 0;
  }
  return v5 & 1;
}

unint64_t sub_247924D18()
{
  unint64_t result;

  result = qword_2576C8560;
  if (!qword_2576C8560)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for InspectorEntityRepresentation.Icon, &type metadata for InspectorEntityRepresentation.Icon);
    atomic_store(result, (unint64_t *)&qword_2576C8560);
  }
  return result;
}

uint64_t sub_247924D60(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  a1[1] = sub_2479252B8(&qword_2576C8598, a2, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
  a1[2] = sub_2479252B8(&qword_2576C85A0, v3, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
  a1[3] = sub_2479252B8(&qword_2576C85A8, v4, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
  result = sub_2479252B8(&qword_2576C85B0, v5, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
  a1[4] = result;
  return result;
}

uint64_t sub_247924DF4()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_247924E04(uint64_t a1, uint64_t a2)
{
  return sub_2479252B8(&qword_2576C85B8, a2, (uint64_t (*)(uint64_t))type metadata accessor for InspectorEntityRepresentation, (uint64_t)&protocol conformance descriptor for InspectorEntityRepresentation);
}

uint64_t method lookup function for InspectorEntityRepresentation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isIncludedInFilter.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isIncludedInFilter.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isIncludedInFilter.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isVisible.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isVisible.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isVisible.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isParentVisible.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isParentVisible.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.isParentVisible.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.parentID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.parentID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.parentID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.properties.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.properties.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.properties.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.children.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.children.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.children.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.components.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.components.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.components.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.hasModelComponent.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.humanReadableName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.icon.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.__allocating_init(id:name:pointer:type:parent:wasActive:wasAnchored:wasEnabled:wasEnabledInHierarchy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of InspectorEntityRepresentation.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 408))();
}

uint64_t storeEnumTagSinglePayload for InspectorEntityRepresentation.Icon(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247925004 + 4 * byte_24792CF34[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_247925038 + 4 * byte_24792CF2F[v4]))();
}

uint64_t sub_247925038(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247925040(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247925048);
  return result;
}

uint64_t sub_247925054(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24792505CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_247925060(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247925068(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InspectorEntityRepresentation.Icon()
{
  return &type metadata for InspectorEntityRepresentation.Icon;
}

uint64_t getEnumTagSinglePayload for InspectorEntityRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
  if (a2 + 14 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 14) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for InspectorEntityRepresentation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_247925160 + 4 * byte_24792CF3E[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_247925194 + 4 * byte_24792CF39[v4]))();
}

uint64_t sub_247925194(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24792519C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2479251A4);
  return result;
}

uint64_t sub_2479251B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2479251B8);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_2479251BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2479251C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InspectorEntityRepresentation.CodingKeys()
{
  return &type metadata for InspectorEntityRepresentation.CodingKeys;
}

unint64_t sub_2479251E4()
{
  unint64_t result;

  result = qword_2576CF200[0];
  if (!qword_2576CF200[0])
  {
    result = MEMORY[0x249584764](&unk_24792D2CC, &type metadata for InspectorEntityRepresentation.CodingKeys);
    atomic_store(result, qword_2576CF200);
  }
  return result;
}

unint64_t sub_24792522C()
{
  unint64_t result;

  result = qword_2576CF310;
  if (!qword_2576CF310)
  {
    result = MEMORY[0x249584764](&unk_24792D23C, &type metadata for InspectorEntityRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CF310);
  }
  return result;
}

unint64_t sub_247925274()
{
  unint64_t result;

  result = qword_2576CF318[0];
  if (!qword_2576CF318[0])
  {
    result = MEMORY[0x249584764](&unk_24792D264, &type metadata for InspectorEntityRepresentation.CodingKeys);
    atomic_store(result, qword_2576CF318);
  }
  return result;
}

uint64_t sub_2479252B8(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x249584764](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ComponentID.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComponentID.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ComponentID.id.modify())()
{
  return nullsub_1;
}

SpatialInspectorFoundation::ComponentID __swiftcall ComponentID.init(id:)(SpatialInspectorFoundation::ComponentID id)
{
  SpatialInspectorFoundation::ComponentID *v1;

  *v1 = id;
  return id;
}

uint64_t static ComponentID.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_247929A28();
}

uint64_t ComponentID.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2479294E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2479253E4()
{
  sub_247925520();
  return sub_247929B54();
}

uint64_t sub_24792540C()
{
  sub_247925520();
  return sub_247929B60();
}

uint64_t ComponentID.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C87A8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247925520();
  sub_247929B00();
  sub_247929998();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_247925520()
{
  unint64_t result;

  result = qword_2576CF3A0;
  if (!qword_2576CF3A0)
  {
    result = MEMORY[0x249584764](&unk_24792D7F4, &type metadata for ComponentID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CF3A0);
  }
  return result;
}

uint64_t ComponentID.hashValue.getter()
{
  sub_247929AAC();
  sub_2479294E8();
  return sub_247929AE8();
}

uint64_t ComponentID.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C87B0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247925520();
  sub_247929AF4();
  if (!v2)
  {
    v10 = sub_2479298E4();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    *a2 = v10;
    a2[1] = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2479256C8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return ComponentID.init(from:)(a1, a2);
}

uint64_t sub_2479256DC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C87A8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247925520();
  sub_247929B00();
  sub_247929998();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t InspectorComponentRepresentation.id.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t InspectorComponentRepresentation.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InspectorComponentRepresentation.isInternal.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

void sub_247925808(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 56);
}

double sub_247925814@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  double result;
  __int128 v4;

  (*(void (**)(__int128 *__return_ptr))(**(_QWORD **)a1 + 120))(&v4);
  result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_247925854(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD *);
  _QWORD v6[2];

  v2 = a1[1];
  v3 = *a2;
  v6[0] = *a1;
  v6[1] = v2;
  v4 = *(uint64_t (**)(_QWORD *))(*(_QWORD *)v3 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v4(v6);
}

uint64_t sub_2479258A8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(v1 + 72);
  *a1 = v3;
  a1[1] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2479258F4(_OWORD *a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_OWORD *)(v1 + 64) = *a1;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_24792594C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

unint64_t sub_247925988()
{
  uint64_t v0;

  return sub_24791CECC(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t InspectorComponentRepresentation.__allocating_init(id:name:entityID:isInternal:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v9 = swift_allocObject();
  v10 = *a1;
  v11 = a1[1];
  v12 = *a4;
  type metadata accessor for InspectorProperty();
  sub_247914C90();
  sub_2479252B8(&qword_2576C7F80, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorProperty, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  InspectorCollection.init()((uint64_t *)(v9 + 64));
  *(_QWORD *)(v9 + 16) = v10;
  *(_QWORD *)(v9 + 24) = v11;
  *(_QWORD *)(v9 + 32) = a2;
  *(_QWORD *)(v9 + 40) = a3;
  *(_QWORD *)(v9 + 56) = v12;
  *(_BYTE *)(v9 + 48) = a5;
  return v9;
}

uint64_t InspectorComponentRepresentation.init(id:name:entityID:isInternal:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v9 = *a1;
  v10 = a1[1];
  v11 = *a4;
  type metadata accessor for InspectorProperty();
  sub_247914C90();
  sub_2479252B8(&qword_2576C7F80, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorProperty, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  InspectorCollection.init()((uint64_t *)(v5 + 64));
  *(_QWORD *)(v5 + 16) = v9;
  *(_QWORD *)(v5 + 24) = v10;
  *(_QWORD *)(v5 + 32) = a2;
  *(_QWORD *)(v5 + 40) = a3;
  *(_QWORD *)(v5 + 56) = v11;
  *(_BYTE *)(v5 + 48) = a5;
  return v5;
}

uint64_t sub_247925B24()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_247925B48 + 4 * byte_24792D350[*v0]))(25705, 0xE200000000000000);
}

uint64_t sub_247925B48()
{
  return 1701667182;
}

uint64_t sub_247925B58()
{
  return 0x6E7265746E497369;
}

uint64_t sub_247925B74()
{
  return 0x4449797469746E65;
}

uint64_t sub_247925B8C()
{
  return 0x69747265706F7270;
}

uint64_t sub_247925BAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247926584(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247925BD0()
{
  sub_247925EB4();
  return sub_247929B54();
}

uint64_t sub_247925BF8()
{
  sub_247925EB4();
  return sub_247929B60();
}

uint64_t InspectorComponentRepresentation.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t InspectorComponentRepresentation.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_247925CA0(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C87B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247925EB4();
  sub_247929B00();
  v10 = v3[3];
  v16 = v3[2];
  v17 = v10;
  LOBYTE(v14) = 0;
  sub_247925EF8();
  sub_2479299C8();
  if (!v2)
  {
    LOBYTE(v16) = 1;
    sub_247929998();
    LOBYTE(v16) = 2;
    sub_2479299A4();
    v16 = v3[7];
    LOBYTE(v14) = 3;
    sub_247906BA8();
    v11 = sub_2479299C8();
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v3 + 120))(&v16, v11);
    v14 = v16;
    v15 = v17;
    v13[15] = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EC0);
    sub_247926900(&qword_2576C8218, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_2479299C8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
}

unint64_t sub_247925EB4()
{
  unint64_t result;

  result = qword_2576CF3A8[0];
  if (!qword_2576CF3A8[0])
  {
    result = MEMORY[0x249584764](&unk_24792D7A4, &type metadata for InspectorComponentRepresentation.CodingKeys);
    atomic_store(result, qword_2576CF3A8);
  }
  return result;
}

unint64_t sub_247925EF8()
{
  unint64_t result;

  result = qword_2576C87C0;
  if (!qword_2576C87C0)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for ComponentID, &type metadata for ComponentID);
    atomic_store(result, (unint64_t *)&qword_2576C87C0);
  }
  return result;
}

uint64_t InspectorComponentRepresentation.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  InspectorComponentRepresentation.init(from:)(a1);
  return v2;
}

uint64_t InspectorComponentRepresentation.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;

  *(_QWORD *)&v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576C87C8);
  v4 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for InspectorProperty();
  sub_247914C90();
  sub_2479252B8(&qword_2576C7F80, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorProperty, (uint64_t)&protocol conformance descriptor for InspectorProperty);
  InspectorCollection.init()((uint64_t *)(v1 + 64));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247925EB4();
  sub_247929AF4();
  if (v2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for InspectorComponentRepresentation();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v15) = 0;
    sub_2479262EC();
    v8 = v12;
    sub_247929914();
    v9 = v14;
    *(_QWORD *)(v1 + 16) = v13;
    *(_QWORD *)(v1 + 24) = v9;
    LOBYTE(v13) = 1;
    *(_QWORD *)(v1 + 32) = sub_2479298E4();
    *(_QWORD *)(v1 + 40) = v10;
    LOBYTE(v13) = 2;
    *(_BYTE *)(v1 + 48) = sub_2479298F0() & 1;
    LOBYTE(v15) = 3;
    sub_247907018();
    sub_247929914();
    *(_QWORD *)(v1 + 56) = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EC0);
    LOBYTE(v13) = 4;
    sub_247926900(&qword_2576C8228, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
    sub_247929914();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v8);
    v12 = v15;
    swift_beginAccess();
    *(_OWORD *)(v1 + 64) = v12;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t type metadata accessor for InspectorComponentRepresentation()
{
  return objc_opt_self();
}

unint64_t sub_2479262EC()
{
  unint64_t result;

  result = qword_2576C87D0;
  if (!qword_2576C87D0)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for ComponentID, &type metadata for ComponentID);
    atomic_store(result, (unint64_t *)&qword_2576C87D0);
  }
  return result;
}

uint64_t sub_247926330@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 168))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_24792635C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 160))();
}

uint64_t sub_247926388(uint64_t *a1, uint64_t *a2)
{
  return _s26SpatialInspectorFoundation0B23ComponentRepresentationC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t InspectorComponentRepresentation.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v3;

  swift_bridgeObjectRetain();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2479294E8();
  swift_bridgeObjectRelease();
  v3 = v0[7];
  sub_2479165D0();
  sub_24792941C();
  v1 = sub_247929AC4();
  (*(void (**)(uint64_t *__return_ptr, uint64_t))(*v0 + 120))(&v3, v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C7EC0);
  sub_247926900(&qword_2576C7EC8, (uint64_t)&protocol conformance descriptor for InspectorCollection<A, B>);
  sub_24792941C();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t InspectorComponentRepresentation.hashValue.getter()
{
  sub_247929AAC();
  InspectorComponentRepresentation.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_2479264E8()
{
  sub_247929AAC();
  InspectorComponentRepresentation.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_247926528()
{
  return InspectorComponentRepresentation.hash(into:)();
}

uint64_t sub_247926548()
{
  sub_247929AAC();
  InspectorComponentRepresentation.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_247926584(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E7265746E497369 && a2 == 0xEA00000000006C61 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x4449797469746E65 && a2 == 0xE800000000000000 || (sub_247929A28() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x69747265706F7270 && a2 == 0xEA00000000007365)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_247929A28();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t _s26SpatialInspectorFoundation0B23ComponentRepresentationC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  BOOL v6;
  _QWORD *v7;
  uint64_t v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v4 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
  if (v4 || (v5 = 0, (sub_247929A28() & 1) != 0))
  {
    v6 = *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32) && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40);
    if (v6 || (v5 = 0, (sub_247929A28() & 1) != 0))
    {
      v11[0] = *(_QWORD *)(a1 + 56);
      v10[0] = *(_QWORD *)(a2 + 56);
      if (static EntityID.== infix(_:_:)(v11, v10) && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48))
      {
        v7 = (*(_QWORD *(**)(_QWORD *__return_ptr))(*(_QWORD *)a1 + 120))(v11);
        v10[0] = v11[0];
        v10[1] = v11[1];
        (*(void (**)(uint64_t *__return_ptr, _QWORD *))(*(_QWORD *)a2 + 120))(&v9, v7);
        type metadata accessor for InspectorProperty();
        sub_247914C90();
        sub_2479252B8(&qword_2576C7F80, 255, (uint64_t (*)(uint64_t))type metadata accessor for InspectorProperty, (uint64_t)&protocol conformance descriptor for InspectorProperty);
        v5 = static InspectorCollection.== infix(_:_:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v5 = 0;
      }
    }
  }
  return v5 & 1;
}

uint64_t sub_247926900(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576C7EC0);
    result = MEMORY[0x249584764](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247926944(_QWORD *a1)
{
  unint64_t result;

  a1[1] = sub_2479262EC();
  a1[2] = sub_247925EF8();
  a1[3] = sub_247926980();
  result = sub_2479269C4();
  a1[4] = result;
  return result;
}

unint64_t sub_247926980()
{
  unint64_t result;

  result = qword_2576C87D8;
  if (!qword_2576C87D8)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for ComponentID, &type metadata for ComponentID);
    atomic_store(result, (unint64_t *)&qword_2576C87D8);
  }
  return result;
}

unint64_t sub_2479269C4()
{
  unint64_t result;

  result = qword_2576C87E0;
  if (!qword_2576C87E0)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for ComponentID, &type metadata for ComponentID);
    atomic_store(result, (unint64_t *)&qword_2576C87E0);
  }
  return result;
}

unint64_t sub_247926A0C()
{
  unint64_t result;

  result = qword_2576C87E8;
  if (!qword_2576C87E8)
  {
    result = MEMORY[0x249584764](&protocol conformance descriptor for ComponentID, &type metadata for ComponentID);
    atomic_store(result, (unint64_t *)&qword_2576C87E8);
  }
  return result;
}

uint64_t sub_247926A54(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  a1[1] = sub_2479252B8(&qword_2576C8820, a2, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
  a1[2] = sub_2479252B8(&qword_2576C8828, v3, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
  a1[3] = sub_2479252B8(&qword_2576C8830, v4, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
  result = sub_2479252B8(&qword_2576C8838, v5, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
  a1[4] = result;
  return result;
}

uint64_t sub_247926AEC(uint64_t a1, uint64_t a2)
{
  return sub_2479252B8(&qword_2576C8840, a2, (uint64_t (*)(uint64_t))type metadata accessor for InspectorComponentRepresentation, (uint64_t)&protocol conformance descriptor for InspectorComponentRepresentation);
}

ValueMetadata *type metadata accessor for ComponentID()
{
  return &type metadata for ComponentID;
}

uint64_t method lookup function for InspectorComponentRepresentation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.properties.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.properties.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.properties.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.humanReadableName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.__allocating_init(id:name:entityID:isInternal:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of InspectorComponentRepresentation.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t storeEnumTagSinglePayload for InspectorComponentRepresentation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_247926BEC + 4 * byte_24792D35A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_247926C20 + 4 * byte_24792D355[v4]))();
}

uint64_t sub_247926C20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247926C28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247926C30);
  return result;
}

uint64_t sub_247926C3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247926C44);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_247926C48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247926C50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InspectorComponentRepresentation.CodingKeys()
{
  return &type metadata for InspectorComponentRepresentation.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ComponentID.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247926CAC + 4 * byte_24792D35F[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247926CCC + 4 * byte_24792D364[v4]))();
}

_BYTE *sub_247926CAC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247926CCC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247926CD4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247926CDC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247926CE4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247926CEC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ComponentID.CodingKeys()
{
  return &type metadata for ComponentID.CodingKeys;
}

unint64_t sub_247926D0C()
{
  unint64_t result;

  result = qword_2576CFAB0[0];
  if (!qword_2576CFAB0[0])
  {
    result = MEMORY[0x249584764](&unk_24792D6C4, &type metadata for ComponentID.CodingKeys);
    atomic_store(result, qword_2576CFAB0);
  }
  return result;
}

unint64_t sub_247926D54()
{
  unint64_t result;

  result = qword_2576CFCC0[0];
  if (!qword_2576CFCC0[0])
  {
    result = MEMORY[0x249584764](&unk_24792D77C, &type metadata for InspectorComponentRepresentation.CodingKeys);
    atomic_store(result, qword_2576CFCC0);
  }
  return result;
}

unint64_t sub_247926D9C()
{
  unint64_t result;

  result = qword_2576CFDD0;
  if (!qword_2576CFDD0)
  {
    result = MEMORY[0x249584764](&unk_24792D6EC, &type metadata for InspectorComponentRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CFDD0);
  }
  return result;
}

unint64_t sub_247926DE4()
{
  unint64_t result;

  result = qword_2576CFDD8[0];
  if (!qword_2576CFDD8[0])
  {
    result = MEMORY[0x249584764](&unk_24792D714, &type metadata for InspectorComponentRepresentation.CodingKeys);
    atomic_store(result, qword_2576CFDD8);
  }
  return result;
}

unint64_t sub_247926E2C()
{
  unint64_t result;

  result = qword_2576CFE60;
  if (!qword_2576CFE60)
  {
    result = MEMORY[0x249584764](&unk_24792D634, &type metadata for ComponentID.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576CFE60);
  }
  return result;
}

unint64_t sub_247926E74()
{
  unint64_t result;

  result = qword_2576CFE68[0];
  if (!qword_2576CFE68[0])
  {
    result = MEMORY[0x249584764](&unk_24792D65C, &type metadata for ComponentID.CodingKeys);
    atomic_store(result, qword_2576CFE68);
  }
  return result;
}

uint64_t EntityIDMap.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 16) = sub_247926F50(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 24) = sub_247926F50(v1);
  return v0;
}

uint64_t EntityIDMap.init()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 16) = sub_247926F50(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 24) = sub_247926F50(v1);
  return v0;
}

unint64_t sub_247926F44()
{
  return sub_247926F50(MEMORY[0x24BEE4AF8]);
}

unint64_t sub_247926F50(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8A38);
  v2 = (_QWORD *)sub_247929878();
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
    v5 = *(v4 - 1);
    v6 = *v4;
    result = sub_2479275F8(v5);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v5;
    *(_QWORD *)(v2[7] + v9) = v6;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v12;
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

uint64_t sub_247927048@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 104))();
  *a2 = result;
  return result;
}

uint64_t sub_247927078(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 16) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2479270D4()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_247927108(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24792714C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 128))();
  *a2 = result;
  return result;
}

uint64_t sub_24792717C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2479271D8()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24792720C(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_247927250(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  char v6;
  uint64_t v8;
  uint64_t v9;

  v3 = *a1;
  v4 = *a2;
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0x8000000000000000;
  sub_247927CAC(v3, v4, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 16) = v8;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_beginAccess();
  v6 = swift_isUniquelyReferenced_nonNull_native();
  v9 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0x8000000000000000;
  sub_247927CAC(v4, v3, v6);
  *(_QWORD *)(v2 + 24) = v9;
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t sub_247927338@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t v9;

  v4 = *a1;
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 128))();
  if (*(_QWORD *)(v5 + 16) && (v6 = sub_2479275F8(v4), (v7 & 1) != 0))
  {
    v8 = 0;
    v9 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
  }
  else
  {
    v9 = 0;
    v8 = 1;
  }
  *(_QWORD *)a2 = v9;
  *(_BYTE *)(a2 + 8) = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_2479273A8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t v9;

  v4 = *a1;
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 104))();
  if (*(_QWORD *)(v5 + 16) && (v6 = sub_2479275F8(v4), (v7 & 1) != 0))
  {
    v8 = 0;
    v9 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v6);
  }
  else
  {
    v9 = 0;
    v8 = 1;
  }
  *(_QWORD *)a2 = v9;
  *(_BYTE *)(a2 + 8) = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_247927418(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  _BYTE v8[16];

  v2 = *a1;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 128))();
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_2479275F8(v2), (v5 & 1) != 0))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v4);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_247927724(v6, (uint64_t)v8);
    swift_endAccess();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_247927724(v2, (uint64_t)v8);
  return swift_endAccess();
}

uint64_t sub_2479274E0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  _BYTE v8[16];

  v2 = *a1;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 128))();
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_2479275F8(v2), (v5 & 1) != 0))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v4);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    sub_247927724(v6, (uint64_t)v8);
    swift_endAccess();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  sub_247927724(v2, (uint64_t)v8);
  return swift_endAccess();
}

uint64_t EntityIDMap.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EntityIDMap.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_2479275F8(uint64_t a1)
{
  uint64_t v2;

  sub_2479165D0();
  v2 = sub_247929410();
  return sub_247927660(a1, v2);
}

unint64_t sub_247927660(uint64_t a1, uint64_t a2)
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
    sub_24791665C();
    do
    {
      if ((sub_247929488() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_247927724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t result;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2479275F8(a1);
  v8 = v7;
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v3;
    v12 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_247927E60();
      v11 = v12;
    }
    *(_QWORD *)a2 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v6);
    sub_247927AE4(v6, v11);
    *v3 = v11;
    result = swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)a2 = 0;
  }
  *(_BYTE *)(a2 + 8) = (v8 & 1) == 0;
  return result;
}

uint64_t sub_2479277F0(uint64_t a1, char a2)
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8A38);
  v6 = sub_24792986C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v33 = a2;
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
LABEL_39:
      __break(1u);
LABEL_40:
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
        goto LABEL_31;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_31:
          swift_release();
          v3 = v34;
          if ((v33 & 1) == 0)
            goto LABEL_38;
          goto LABEL_34;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_40;
            if (v13 >= v35)
              goto LABEL_31;
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
    v22 = 8 * v17;
    v23 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v22);
    v24 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v22);
    sub_2479165D0();
    result = sub_247929410();
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
          goto LABEL_39;
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
    v15 = 8 * v14;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v15) = v23;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v15) = v24;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v33 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_247927AE4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
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
    result = sub_247929788();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      sub_2479165D0();
      do
      {
        result = sub_247929410();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 >= v8 && v3 >= (uint64_t)v9)
          {
LABEL_16:
            v12 = *(_QWORD *)(a2 + 48);
            v13 = (_QWORD *)(v12 + 8 * v3);
            v14 = (_QWORD *)(v12 + 8 * v6);
            if (v3 != v6 || v13 >= v14 + 1)
              *v13 = *v14;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v9 >= v8 || v3 >= (uint64_t)v9)
        {
          goto LABEL_16;
        }
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

uint64_t sub_247927CAC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_2479275F8(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_247927E60();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v18 = 8 * v10;
    *(_QWORD *)(v16[6] + v18) = a2;
    *(_QWORD *)(v16[7] + v18) = a1;
    v19 = v16[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_2479277F0(result, a3 & 1);
  result = sub_2479275F8(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_247929A70();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for EntityIDMap()
{
  return objc_opt_self();
}

uint64_t method lookup function for EntityIDMap()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EntityIDMap.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of EntityIDMap.persistentToLocalID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of EntityIDMap.localToPersistentID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of EntityIDMap.add(localID:persistentID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of EntityIDMap.persistentIDFrom(localID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of EntityIDMap.localIDFrom(persistentID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of EntityIDMap.remove(localID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of EntityIDMap.remove(persistentID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

void *sub_247927E60()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576C8A38);
  v2 = *v0;
  v3 = sub_247929860();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v21 = __clz(__rbit64(v19));
    v12 = (v19 - 1) & v19;
    v15 = v21 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_247927FEC()
{
  swift_deletedMethodError();
  __break(1u);
}

BOOL sub_247927FFC()
{
  uint64_t v0;

  v0 = sub_247929890();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_247928040()
{
  return sub_24791552C() & 1;
}

uint64_t sub_247928068()
{
  return 0x73746E656D656C65;
}

uint64_t sub_247928080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x249584764](&unk_24792D914, a3);
  return sub_247929A34();
}

uint64_t sub_2479280D4(uint64_t a1)
{
  MEMORY[0x249584764](&unk_24792D914, a1);
  return sub_2479295E4();
}

uint64_t sub_247928120()
{
  MEMORY[0x249584764](&unk_24792D914);
  return sub_2479295FC();
}

uint64_t sub_247928170()
{
  MEMORY[0x249584764](&unk_24792D914);
  return sub_2479295F0();
}

BOOL sub_2479281C0@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_247927FFC();
  *a1 = result;
  return result;
}

void sub_2479281F4(_QWORD *a1@<X8>)
{
  *a1 = 0x73746E656D656C65;
  a1[1] = 0xE800000000000000;
}

BOOL sub_247928210@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_247927FFC();
  *a1 = result;
  return result;
}

uint64_t sub_24792823C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24791552C();
  *a1 = result & 1;
  return result;
}

uint64_t sub_247928270(uint64_t a1)
{
  MEMORY[0x249584764](&unk_24792D94C, a1);
  return sub_247929B54();
}

uint64_t sub_2479282A4(uint64_t a1)
{
  MEMORY[0x249584764](&unk_24792D94C, a1);
  return sub_247929B60();
}

uint64_t sub_2479282D8()
{
  return sub_247929620();
}

uint64_t sub_2479282E0()
{
  swift_getTupleTypeMetadata2();
  sub_247929620();
  return sub_2479293BC();
}

uint64_t sub_24792833C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_247928344(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 8) = a1;
  return result;
}

uint64_t InspectorCollection.all.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InspectorCollection.isEmpty.getter()
{
  uint64_t v0;

  v0 = sub_24792965C();
  MEMORY[0x249584764](MEMORY[0x24BEE12E0], v0);
  return sub_2479296A4() & 1;
}

uint64_t InspectorCollection.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_247929620();
  swift_getTupleTypeMetadata2();
  sub_247929620();
  result = sub_2479293BC();
  *a1 = v2;
  a1[1] = result;
  return result;
}

void InspectorCollection.init(from:)()
{
  type metadata accessor for InspectorCollection.CodingKeys();
}

uint64_t sub_24792849C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  MEMORY[0x249584764](&unk_24792D94C, a1);
  v6 = sub_247929950();
  *(_QWORD *)(v5 - 144) = v6;
  *(_QWORD *)(v5 - 176) = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v15 - v8;
  *(_QWORD *)(v5 - 128) = sub_247929620();
  swift_getTupleTypeMetadata2();
  sub_247929620();
  *(_QWORD *)(v5 - 168) = v1;
  *(_QWORD *)(v5 - 120) = sub_2479293BC();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  *(_QWORD *)(v5 - 152) = v9;
  v10 = *(_QWORD *)(v5 - 136);
  sub_247929AF4();
  if (!v10)
  {
    v11 = *(_QWORD *)(v5 - 168);
    v12 = sub_24792965C();
    v13 = *(_QWORD *)(v5 - 160);
    *(_QWORD *)(v5 - 72) = *(_QWORD *)(v13 + 8);
    MEMORY[0x249584764](MEMORY[0x24BEE12D0], v12, v5 - 72);
    sub_247929914();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 - 128) = *(_QWORD *)(v5 - 112);
    *(_QWORD *)(v5 - 112) = v2;
    *(_QWORD *)(v5 - 104) = v3;
    *(_QWORD *)(v5 - 96) = v11;
    *(_QWORD *)(v5 - 88) = v13;
    type metadata accessor for InspectorCollection();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_24792864C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  sub_247928694();
  (*(void (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v2 - 152), *(_QWORD *)(v2 - 144));
  v3 = *(_QWORD *)(v2 - 120);
  v4 = *(_QWORD **)(v2 - 184);
  *v4 = *(_QWORD *)(v2 - 128);
  v4[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1(v1);
  swift_bridgeObjectRelease();
  JUMPOUT(0x247928600);
}

uint64_t sub_247928694()
{
  uint64_t v0;

  sub_2479293D4();
  sub_2479293C8();
  v0 = sub_24792965C();
  swift_bridgeObjectRetain();
  MEMORY[0x249584764](MEMORY[0x24BEE12C8], v0);
  sub_2479295D8();
  return swift_bridgeObjectRelease();
}

uint64_t InspectorCollection.append(_:keepExisting:)(uint64_t a1, int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
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
  char *v20;
  uint64_t *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  LODWORD(v34) = a2;
  v33 = a3[5];
  v5 = a3[3];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v7);
  v9 = a3[2];
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v8, v11);
  v36 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v17 = (char *)&v31 - v16;
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v31 - v19;
  v37 = a1;
  v41 = a1;
  sub_2479297DC();
  v21 = v38;
  swift_dynamicCast();
  v22 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v22(v17, v20, v9);
  v23 = v21[1];
  v35 = v21 + 1;
  MEMORY[0x249583CB4](&v41, v17, v23, v9, v5, *(_QWORD *)(a3[4] + 24));
  v24 = *(void (**)(char *, uint64_t))(v10 + 8);
  v24(v17, v9);
  if (!v41)
  {
    v34 = v24;
    v25 = v36;
    v26 = v22;
LABEL_8:
    v29 = v37;
    v41 = v37;
    sub_24792965C();
    swift_unknownObjectRetain();
    sub_247929638();
    v26(v25, v20, v9);
    v41 = v29;
    sub_2479293D4();
    swift_unknownObjectRetain();
    sub_247929404();
    v24 = v34;
    return ((uint64_t (*)(char *, uint64_t))v24)(v20, v9);
  }
  if ((v34 & 1) == 0)
  {
    v32 = v22;
    v34 = v24;
    v27 = *v21;
    v39 = v41;
    v40 = v27;
    v28 = sub_24792965C();
    MEMORY[0x249584764](MEMORY[0x24BEE12E0], v28);
    sub_2479296B0();
    if (v42 != 1)
    {
      sub_247929644();
      swift_unknownObjectRelease();
    }
    v25 = v36;
    v26 = v32;
    v32(v36, v20, v9);
    v41 = 0;
    sub_2479293D4();
    sub_247929404();
    swift_unknownObjectRelease();
    goto LABEL_8;
  }
  swift_unknownObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v24)(v20, v9);
}

uint64_t InspectorCollection.merge(_:)(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v3 = *a1;
  v4 = a2[3];
  v5 = swift_bridgeObjectRetain();
  if (MEMORY[0x249583F0C](v5, v4))
  {
    v6 = 4;
    do
    {
      v7 = v6 - 4;
      v8 = sub_24792962C();
      sub_247929614();
      if ((v8 & 1) != 0)
      {
        v9 = *(_QWORD *)(v3 + 8 * v6);
        swift_unknownObjectRetain();
        v10 = __OFADD__(v7, 1);
        v11 = v6 - 3;
        if (v10)
          goto LABEL_9;
      }
      else
      {
        v9 = sub_2479297E8();
        v10 = __OFADD__(v7, 1);
        v11 = v6 - 3;
        if (v10)
        {
LABEL_9:
          __break(1u);
          return swift_bridgeObjectRelease();
        }
      }
      InspectorCollection.append(_:keepExisting:)(v9, 1, a2);
      swift_unknownObjectRelease();
      ++v6;
    }
    while (v11 != MEMORY[0x249583F0C](v3, v4));
  }
  return swift_bridgeObjectRelease();
}

uint64_t InspectorCollection.makeIterator()()
{
  sub_247929154();
  return swift_bridgeObjectRetain();
}

uint64_t sub_247928B9C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;

  MEMORY[0x24BDAC7A8](a1, a2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v3);
  sub_2479297DC();
  swift_dynamicCast();
  sub_2479293D4();
  swift_unknownObjectRetain();
  return sub_247929404();
}

uint64_t static InspectorCollection.== infix(_:_:)()
{
  if ((sub_247929674() & 1) != 0)
    return sub_2479293EC();
  else
    return 0;
}

uint64_t InspectorCollection.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_247929668();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2479293E0();
  return swift_bridgeObjectRelease();
}

void InspectorCollection.encode(to:)()
{
  type metadata accessor for InspectorCollection.CodingKeys();
}

uint64_t sub_247928E4C(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  MEMORY[0x249584764](&unk_24792D94C, a1);
  v4 = sub_2479299F8();
  *(_QWORD *)(v3 - 128) = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v11 - v6;
  v8 = *v1;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_247929B00();
  *(_QWORD *)(v3 - 112) = v8;
  v9 = sub_24792965C();
  *(_QWORD *)(v3 - 72) = *(_QWORD *)(*(_QWORD *)(v3 - 136) + 16);
  MEMORY[0x249584764](MEMORY[0x24BEE12A0], v9, v3 - 72);
  sub_2479299C8();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v3 - 128) + 8))(v7, v4);
}

uint64_t InspectorCollection.hashValue.getter()
{
  sub_247929AAC();
  InspectorCollection.hash(into:)();
  return sub_247929AE8();
}

void sub_247928FB8()
{
  InspectorCollection.init(from:)();
}

void sub_247928FD8()
{
  InspectorCollection.encode(to:)();
}

uint64_t sub_247928FEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = sub_247929154();
  v4 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_247929040()
{
  return 0;
}

uint64_t sub_247929048()
{
  uint64_t v0;

  v0 = sub_24792924C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_247929094()
{
  return sub_2479295CC();
}

uint64_t sub_2479290BC()
{
  sub_247929AAC();
  InspectorCollection.hash(into:)();
  return sub_247929AE8();
}

uint64_t sub_2479290FC()
{
  return static InspectorCollection.== infix(_:_:)();
}

void type metadata accessor for InspectorCollection.CodingKeys()
{
  JUMPOUT(0x249584710);
}

void type metadata accessor for InspectorCollection()
{
  JUMPOUT(0x249584710);
}

uint64_t sub_247929124(uint64_t a1)
{
  uint64_t v1;

  return sub_247928B9C(a1, *(_QWORD *)(v1 + 48));
}

uint64_t sub_247929154()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_247929160()
{
  JUMPOUT(0x249584764);
}

void sub_247929170()
{
  JUMPOUT(0x249584764);
}

void sub_247929180()
{
  JUMPOUT(0x249584764);
}

void sub_247929190()
{
  JUMPOUT(0x249584764);
}

void sub_2479291A0()
{
  JUMPOUT(0x249584764);
}

uint64_t sub_2479291B0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2479291B8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2479291C0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247929200 + 4 * byte_24792D8A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247929220 + 4 * byte_24792D8A5[v4]))();
}

_BYTE *sub_247929200(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247929220(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247929228(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247929230(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247929238(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247929240(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_247929254()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_247929260()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_24792926C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_247929278()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_247929284()
{
  return MEMORY[0x24BDCC4F0]();
}

uint64_t sub_247929290()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_24792929C()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_2479292A8()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_2479292B4()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_2479292C0()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_2479292CC()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_2479292D8()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2479292E4()
{
  return MEMORY[0x24BDCD3C0]();
}

uint64_t sub_2479292F0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2479292FC()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_247929308()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_247929314()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_247929320()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24792932C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_247929338()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_247929344()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_247929350()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_24792935C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_247929368()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_247929374()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_247929380()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_24792938C()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_247929398()
{
  return MEMORY[0x24BEE0228]();
}

uint64_t sub_2479293A4()
{
  return MEMORY[0x24BEE0240]();
}

uint64_t sub_2479293B0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2479293BC()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2479293C8()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_2479293D4()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_2479293E0()
{
  return MEMORY[0x24BEE0480]();
}

uint64_t sub_2479293EC()
{
  return MEMORY[0x24BEE0490]();
}

uint64_t sub_2479293F8()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_247929404()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_247929410()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24792941C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_247929428()
{
  return MEMORY[0x24BEE0688]();
}

uint64_t sub_247929434()
{
  return MEMORY[0x24BEE06A8]();
}

uint64_t sub_247929440()
{
  return MEMORY[0x24BEE06B0]();
}

uint64_t sub_24792944C()
{
  return MEMORY[0x24BEE06C8]();
}

uint64_t sub_247929458()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_247929464()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_247929470()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_24792947C()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_247929488()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_247929494()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2479294A0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2479294AC()
{
  return MEMORY[0x24BDCFB28]();
}

uint64_t sub_2479294B8()
{
  return MEMORY[0x24BDCFB38]();
}

uint64_t sub_2479294C4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2479294D0()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2479294DC()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2479294E8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2479294F4()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_247929500()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_24792950C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_247929518()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_247929524()
{
  return MEMORY[0x24BEE0BB8]();
}

uint64_t sub_247929530()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24792953C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_247929548()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247929554()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_247929560()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_24792956C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_247929578()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_247929584()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_247929590()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_24792959C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2479295A8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2479295B4()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2479295C0()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_2479295CC()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_2479295D8()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_2479295E4()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_2479295F0()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_2479295FC()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_247929608()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_247929614()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_247929620()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_24792962C()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_247929638()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_247929644()
{
  return MEMORY[0x24BEE1208]();
}

uint64_t sub_247929650()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_24792965C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_247929668()
{
  return MEMORY[0x24BEE1268]();
}

uint64_t sub_247929674()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_247929680()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_24792968C()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_247929698()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_2479296A4()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_2479296B0()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_2479296BC()
{
  return MEMORY[0x24BEE1A20]();
}

uint64_t sub_2479296C8()
{
  return MEMORY[0x24BDBD758]();
}

uint64_t sub_2479296D4()
{
  return MEMORY[0x24BEE5208]();
}

uint64_t sub_2479296E0()
{
  return MEMORY[0x24BEE5EB0]();
}

uint64_t sub_2479296EC()
{
  return MEMORY[0x24BEE5268]();
}

uint64_t sub_2479296F8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_247929704()
{
  return MEMORY[0x24BEE5EB8]();
}

uint64_t sub_247929710()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_24792971C()
{
  return MEMORY[0x24BEE1D60]();
}

uint64_t sub_247929728()
{
  return MEMORY[0x24BEE1DF0]();
}

uint64_t sub_247929734()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_247929740()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24792974C()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_247929758()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_247929764()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_247929770()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_24792977C()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_247929788()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_247929794()
{
  return MEMORY[0x24BEE2398]();
}

uint64_t sub_2479297A0()
{
  return MEMORY[0x24BEE23C0]();
}

uint64_t sub_2479297AC()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_2479297B8()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_2479297C4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2479297D0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2479297DC()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_2479297E8()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_2479297F4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247929800()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_24792980C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_247929818()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_247929824()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_247929830()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24792983C()
{
  return MEMORY[0x24BEE2DE8]();
}

uint64_t sub_247929848()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_247929854()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247929860()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24792986C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_247929878()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_247929884()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_247929890()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24792989C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2479298A8()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2479298B4()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2479298C0()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2479298CC()
{
  return MEMORY[0x24BEE3320]();
}

uint64_t sub_2479298D8()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_2479298E4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2479298F0()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2479298FC()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_247929908()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_247929914()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_247929920()
{
  return MEMORY[0x24BEE3398]();
}

uint64_t sub_24792992C()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_247929938()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_247929944()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_247929950()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_24792995C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_247929968()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_247929974()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_247929980()
{
  return MEMORY[0x24BEE3468]();
}

uint64_t sub_24792998C()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_247929998()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2479299A4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2479299B0()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2479299BC()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2479299C8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2479299D4()
{
  return MEMORY[0x24BEE34E8]();
}

uint64_t sub_2479299E0()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_2479299EC()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_2479299F8()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_247929A04()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247929A10()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_247929A1C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_247929A28()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247929A34()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_247929A40()
{
  return MEMORY[0x24BEE3D38]();
}

uint64_t sub_247929A4C()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_247929A58()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_247929A64()
{
  return MEMORY[0x24BEE3E90]();
}

uint64_t sub_247929A70()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_247929A7C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_247929A88()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247929A94()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_247929AA0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_247929AAC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247929AB8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247929AC4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_247929AD0()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_247929ADC()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_247929AE8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_247929AF4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_247929B00()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_247929B0C()
{
  return MEMORY[0x24BEE4770]();
}

uint64_t sub_247929B18()
{
  return MEMORY[0x24BEE4778]();
}

uint64_t sub_247929B24()
{
  return MEMORY[0x24BEE47C0]();
}

uint64_t sub_247929B30()
{
  return MEMORY[0x24BEE47D0]();
}

uint64_t sub_247929B3C()
{
  return MEMORY[0x24BEE47E0]();
}

uint64_t sub_247929B48()
{
  return MEMORY[0x24BEE49D0]();
}

uint64_t sub_247929B54()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_247929B60()
{
  return MEMORY[0x24BEE4A10]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x24BDBDA88](a1, *(_QWORD *)&intent, color, options);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDAB0](red, green, blue, alpha);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x24BDBDB20]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
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

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
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

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

