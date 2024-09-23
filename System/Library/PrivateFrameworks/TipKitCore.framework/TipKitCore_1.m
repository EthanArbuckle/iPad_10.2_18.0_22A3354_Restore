uint64_t sub_248A34BFC@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v19[1] = a1;
  v3 = sub_2489C330C(&qword_254464400);
  v21 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2489C330C(&qword_254463B18);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2489C330C(&qword_254462E40);
  v20 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2489F5DEC(&qword_254463B10, &qword_254463B18);
  sub_248A44DC0();
  v22 = type metadata accessor for CoreDonationRecord();
  sub_248A36454(&qword_254464638, 255, (void (*)(uint64_t))type metadata accessor for CoreDonationRecord);
  v23 = v16;
  swift_getKeyPath();
  sub_248A44D00();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  sub_248A452AC();
  v17 = (void (*)(uint64_t))MEMORY[0x24BDEAAB0];
  sub_248A44DB4();
  a2[3] = sub_2489C330C(&qword_254462E28);
  a2[4] = sub_248A35F98();
  sub_2489BE690(a2);
  sub_2489F5DEC(&qword_254462E38, &qword_254462E40);
  sub_2489F5DEC(&qword_2544643F8, &qword_254464400);
  sub_248A36454(&qword_254464410, 255, v17);
  sub_248A44CF4();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v15, v12);
}

uint64_t sub_248A34E9C()
{
  return sub_248A45180();
}

uint64_t sub_248A34EC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t *v5;
  uint64_t *v8;
  unint64_t v12;
  char v13;
  char v14;
  uint64_t result;
  uint64_t v16;

  v8 = v5;
  sub_248A453F0();
  v12 = sub_2489C28D0(a1, a2);
  v14 = v13;
  result = sub_2489BA820();
  if ((v14 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v16 = *v8;
    *v8 = 0x8000000000000000;
    sub_2489C330C(a3);
    sub_248A45BD0();
    sub_248A368C0();
    sub_2489C625C(*(_QWORD *)(v16 + 56) + 8 * v12, a5, a4);
    sub_2489C330C(a4);
    sub_248A45BE8();
    *v8 = v16;
    result = swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)a5 = 0;
  }
  *(_BYTE *)(a5 + 8) = (v14 & 1) == 0;
  return result;
}

uint64_t sub_248A34FF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = v3;
  sub_248A453F0();
  v8 = sub_2489C28D0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v14 = *v4;
    *v4 = 0x8000000000000000;
    sub_2489C330C(&qword_254464338);
    sub_248A45BD0();
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v14 + 56);
    v11 = sub_248A452AC();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v8, v11);
    sub_248A45BE8();
    *v4 = v14;
    swift_bridgeObjectRelease();
    return sub_2489BE7E0(a3, 0, 1, v11);
  }
  else
  {
    v13 = sub_248A452AC();
    return sub_2489BE7E0(a3, 1, 1, v13);
  }
}

double sub_248A3513C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  double result;
  uint64_t v11;

  v4 = v3;
  sub_248A453F0();
  v8 = sub_2489C28D0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    *v4 = 0x8000000000000000;
    sub_2489C330C(&qword_254464340);
    sub_248A45BD0();
    swift_bridgeObjectRelease();
    sub_2489C3288((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_2489C330C(&qword_2544643C0);
    sub_248A45BE8();
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_248A35264(uint64_t a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  unint64_t v8;
  char v9;
  uint64_t v10;

  v4 = v3;
  sub_2489BEC8C();
  v8 = sub_2489C28D0(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    sub_248A36868();
    sub_2489C330C(&qword_254464550);
    sub_248A45BD0();
    sub_248A368C0();
    *a3 = *(_WORD *)(*(_QWORD *)(v10 + 56) + 2 * v8);
    sub_248A45BE8();
    *v4 = v10;
    swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 4;
  }
  sub_2489BA868();
}

uint64_t sub_248A3534C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  uint64_t result;
  uint64_t v11;

  v4 = v3;
  sub_248A453F0();
  v8 = sub_2489C28D0(a1, a2);
  LOBYTE(a2) = v9;
  result = swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    *v4 = 0x8000000000000000;
    sub_2489C330C(&qword_254462E60);
    sub_248A45BD0();
    swift_bridgeObjectRelease();
    *a3 = *(_BYTE *)(*(_QWORD *)(v11 + 56) + v8);
    sub_248A45BE8();
    *v4 = v11;
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 3;
  }
  return result;
}

uint64_t sub_248A35458(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  sub_2489BBC94();
  v6 = sub_2489C28D0(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 26;
  swift_isUniquelyReferenced_nonNull_native();
  sub_248A36868();
  sub_2489C330C(&qword_2577A5840);
  sub_248A45BD0();
  sub_248A368C0();
  v8 = *(unsigned __int8 *)(*(_QWORD *)(v10 + 56) + v6);
  sub_248A45BE8();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_248A35548()
{
  uint64_t *v0;
  uint64_t v2;

  swift_isUniquelyReferenced_nonNull_native();
  v2 = *v0;
  *v0 = 0x8000000000000000;
  sub_248A36838();
  sub_248A357C8();
  *v0 = v2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A355D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_248A358EC(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A35654(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_248A35A14(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A356D0(__int16 a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_248A35B30(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A3574C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_248A35C3C(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_248A357C8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  uint64_t v19;

  sub_2489BECFC();
  v2 = v1;
  v4 = v3;
  v5 = v0;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = *v0;
  v13 = sub_2489C28D0(v8, v6);
  if (__OFADD__(*(_QWORD *)(v12 + 16), (v14 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v15 = v13;
  v16 = v14;
  sub_2489C330C(v4);
  if ((sub_248A45BD0() & 1) == 0)
    goto LABEL_5;
  v17 = sub_2489C28D0(v9, v7);
  if ((v16 & 1) != (v18 & 1))
  {
LABEL_9:
    sub_248A45F30();
    __break(1u);
    return;
  }
  v15 = v17;
LABEL_5:
  v19 = *v5;
  if ((v16 & 1) != 0)
  {
    sub_2489BA270(v11, *(_QWORD *)(v19 + 56) + 8 * v15, v2);
  }
  else
  {
    sub_248A35D70(v15, v9, v7, v11, v19);
    sub_248A453F0();
  }
}

uint64_t sub_248A358EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2489C28D0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  sub_2489C330C(&qword_254464338);
  if ((sub_248A45BD0() & 1) == 0)
    goto LABEL_5;
  v13 = sub_2489C28D0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_248A45F30();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    v17 = sub_248A452AC();
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v16 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v11, a1, v17);
  }
  else
  {
    sub_248A35DB4(v11, a2, a3, a1, v15);
    return sub_248A453F0();
  }
}

_OWORD *sub_248A35A14(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2489C28D0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  sub_2489C330C(&qword_254464340);
  if ((sub_248A45BD0() & 1) == 0)
    goto LABEL_5;
  v13 = sub_2489C28D0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_248A45F30();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = (_OWORD *)(v15[7] + 32 * v11);
    sub_2489BCE44((uint64_t)v16);
    return sub_2489C3288(a1, v16);
  }
  else
  {
    sub_248A35E44(v11, a2, a3, a1, v15);
    return (_OWORD *)sub_248A453F0();
  }
}

uint64_t sub_248A35B30(__int16 a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t result;
  char v14;
  _QWORD *v15;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2489C28D0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  sub_2489C330C(&qword_254464550);
  result = sub_248A45BD0();
  if ((result & 1) == 0)
    goto LABEL_5;
  result = sub_2489C28D0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_248A45F30();
    __break(1u);
    return result;
  }
  v11 = result;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    *(_WORD *)(v15[7] + 2 * v11) = a1;
  }
  else
  {
    sub_248A35EAC(v11, a2, a3, a1, v15);
    return sub_248A453F0();
  }
  return result;
}

uint64_t sub_248A35C3C(char a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  uint64_t result;
  char v14;
  _QWORD *v15;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2489C28D0(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  sub_2489C330C(&qword_254462E60);
  result = sub_248A45BD0();
  if ((result & 1) == 0)
    goto LABEL_5;
  result = sub_2489C28D0(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_248A45F30();
    __break(1u);
    return result;
  }
  v11 = result;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    *(_BYTE *)(v15[7] + v11) = a1;
  }
  else
  {
    sub_248A35EF4(v11, a2, a3, a1, v15);
    return sub_248A453F0();
  }
  return result;
}

unint64_t sub_248A35D48(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  result = sub_248A36540(a1, a2, a3, a4, a5);
  *(_QWORD *)(v8 + 8 * result) = v7;
  v9 = *(_QWORD *)(v6 + 16);
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    *(_QWORD *)(v6 + 16) = v11;
  return result;
}

void sub_248A35D70(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v6 = sub_248A36540(a1, a2, a3, a4, a5);
  sub_2489C625C(v8, v7 + 8 * v6, v9);
  v10 = *(_QWORD *)(a5 + 16);
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    *(_QWORD *)(a5 + 16) = v12;
}

uint64_t sub_248A35DB4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = sub_248A452AC();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

_OWORD *sub_248A35E44(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_2489C3288(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_248A35EAC(unint64_t result, uint64_t a2, uint64_t a3, __int16 a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_WORD *)(a5[7] + 2 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_248A35EF4(unint64_t result, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_BYTE *)(a5[7] + result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t sub_248A35F3C(uint64_t a1, uint64_t *a2, __int16 *a3)
{
  return sub_248A2F524(a1, *a2, a2[1], *a3);
}

uint64_t sub_248A35F60(uint64_t a1, uint64_t *a2, char *a3)
{
  return sub_248A2F5AC(a1, *a2, a2[1], *a3);
}

uint64_t sub_248A35F84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_248A34BFC(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_248A35F98()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254462E20;
  if (!qword_254462E20)
  {
    v1 = sub_2489BCD7C(&qword_254462E28);
    v2[0] = sub_248A36024(&qword_254462E30, &qword_254462E40, &qword_254463B08, &qword_254463B18);
    v2[1] = sub_248A3609C();
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD0E8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254462E20);
  }
  return result;
}

uint64_t sub_248A36024(unint64_t *a1, uint64_t *a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v8 = sub_2489BCD7C(a2);
    sub_2489F5DEC(a3, a4);
    v10 = v9;
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD1B8], v8, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_248A3609C()
{
  unint64_t result;
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  result = qword_2544643F0;
  if (!qword_2544643F0)
  {
    v1 = sub_2489BCD7C(&qword_254464400);
    v2 = (void (*)(uint64_t))MEMORY[0x24BDEAAB0];
    sub_248A36454(&qword_254464418, 255, (void (*)(uint64_t))MEMORY[0x24BDEAAB0]);
    v4 = v3;
    sub_248A36454(&qword_254464408, 255, v2);
    v6[0] = v4;
    v6[1] = v5;
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD128], v1, v6);
    atomic_store(result, (unint64_t *)&qword_2544643F0);
  }
  return result;
}

uint64_t sub_248A36148@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_248A33A6C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_248A36150@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_248A3441C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_248A36158()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254463760;
  if (!qword_254463760)
  {
    v1 = sub_2489BCD7C(&qword_254463768);
    v2[0] = sub_248A36024(&qword_254463770, &qword_254463780, &qword_254463AF0, &qword_254463B00);
    v2[1] = sub_248A3609C();
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD0E8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254463760);
  }
  return result;
}

uint64_t sub_248A361E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_248A332E8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_248A361FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_248A346BC(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_248A36204()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254463960;
  if (!qword_254463960)
  {
    v1 = sub_2489BCD7C(&qword_254463968);
    v2[0] = sub_248A36024(&qword_254463970, &qword_254463980, &qword_254463B20, &qword_254463B30);
    v2[1] = sub_248A3609C();
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD0E8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254463960);
  }
  return result;
}

uint64_t sub_248A36290@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_248A32BAC(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_248A362A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_248A3495C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_248A362B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254463EB8;
  if (!qword_254463EB8)
  {
    v1 = sub_2489BCD7C(&qword_254463EC0);
    v2[0] = sub_248A36024(&qword_254463EF8, &qword_254463F08, &qword_2544640C0, &qword_2544640D0);
    v2[1] = sub_248A3609C();
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD0E8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254463EB8);
  }
  return result;
}

uint64_t sub_248A3633C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_248A36360()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_248A36884();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_248A363D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = *(unsigned __int8 *)(*(_QWORD *)(sub_248A36884() - 8) + 80);
  v7 = *(_QWORD *)(v2 + 16);
  v8 = v2 + ((v6 + 24) & ~v6);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_2489F26C0;
  return sub_248A32048(a1, a2, v7, v8);
}

void sub_248A36454(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t))
{
  if (!*a1)
  {
    a3(a2);
    sub_2489BEDA0();
  }
  sub_2489BA7D0();
}

uint64_t sub_248A364A0()
{
  return swift_beginAccess();
}

void sub_248A364B4()
{
  sub_2489BE9AC();
}

uint64_t sub_248A364C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v2, v3, v1);
}

uint64_t sub_248A364D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v2, v3, v0);
}

void sub_248A364E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 - 104) = a4;
  *(_DWORD *)(v4 - 108) = a3;
}

uint64_t sub_248A36500()
{
  return sub_248A44FAC();
}

void sub_248A36508(_QWORD *a1, uint64_t a2, void (*a3)(uint64_t))
{
  sub_248A36454(a1, 255, a3);
}

void sub_248A36510()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = v0;
}

void sub_248A36528()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = v0;
}

unint64_t sub_248A36540(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  *(_QWORD *)(a5 + 8 * (result >> 6) + 64) |= 1 << result;
  v5 = (_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  return result;
}

void sub_248A36570()
{
  uint64_t v0;
  uint64_t *v1;

  sub_2489C3298(v0, v1);
}

uint64_t sub_248A36580(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v2, v1, a1);
}

uint64_t sub_248A3659C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 - 192))(a1, *(_QWORD *)(v1 - 136));
}

uint64_t sub_248A365A8()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 104) = *(_DWORD *)(v0 - 228);
  return swift_setAtWritableKeyPath();
}

uint64_t sub_248A365C4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A365D4()
{
  return sub_248A44C7C();
}

uint64_t sub_248A365E0()
{
  return sub_248A45060();
}

uint64_t sub_248A365F0()
{
  return sub_248A45060();
}

uint64_t sub_248A36600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 72) + 8))(v1, v0);
}

void sub_248A3661C()
{
  uint64_t v0;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(v0 + 16) + 24));
}

uint64_t sub_248A36634()
{
  uint64_t v0;

  return v0;
}

void sub_248A36664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 - 104) = a4;
}

void sub_248A36678()
{
  sub_2489F1D28();
}

void sub_248A3668C()
{
  sub_2489F1F28();
}

void sub_248A366A0()
{
  sub_2489F1AD8();
}

uint64_t sub_248A366B4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_248A366BC()
{
  uint64_t v0;

  return sub_2489BE7E0(*(_QWORD *)(v0 + 176), 1, 1, *(_QWORD *)(v0 + 128));
}

uint64_t sub_248A366D0()
{
  return sub_248A450C0();
}

uint64_t sub_248A366E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 264) = a1;
  *(_QWORD *)(a1 + 16) = v3;
  return a1 + v1;
}

uint64_t sub_248A36700()
{
  return sub_248A45168();
}

uint64_t sub_248A36714()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2489D08D4(v0, *(_QWORD *)(v1 + 40));
}

uint64_t sub_248A36734()
{
  return swift_release();
}

uint64_t sub_248A3673C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_248A36748()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_248A36758()
{
  return sub_248A452A0();
}

uint64_t sub_248A36768()
{
  return swift_weakInit();
}

uint64_t sub_248A36778()
{
  return swift_task_alloc();
}

uint64_t sub_248A36788(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_248A453F0();
}

uint64_t sub_248A36790()
{
  return swift_setAtWritableKeyPath();
}

uint64_t sub_248A36798()
{
  uint64_t v0;

  return v0;
}

void sub_248A367A8()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 120) = 0;
  *(_QWORD *)(v0 - 112) = 0xE000000000000000;
}

void sub_248A367B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  *(_QWORD *)(v9 - 112) = &a9;
}

uint64_t sub_248A367D8()
{
  return 0;
}

uint64_t sub_248A36804()
{
  return sub_248A4557C();
}

uint64_t sub_248A36810(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = result;
  return result;
}

uint64_t sub_248A3681C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 184);
}

void sub_248A36830()
{
  sub_2489BE9AC();
}

uint64_t sub_248A36838()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_248A36844()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, *(_QWORD *)(v2 - 144));
}

uint64_t sub_248A36850()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  return v1(v0, *(_QWORD *)(v2 - 120));
}

uint64_t sub_248A3685C()
{
  return sub_248A45BAC();
}

void sub_248A36868()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

uint64_t sub_248A3687C()
{
  uint64_t *v0;

  return sub_2489C330C(v0);
}

uint64_t sub_248A36884()
{
  return sub_248A452E8();
}

uint64_t sub_248A368B4()
{
  return sub_248A4557C();
}

uint64_t sub_248A368C0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A368D4()
{
  return sub_248A4557C();
}

void sub_248A368E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 96);
  *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 104);
  *(_QWORD *)(v0 - 96) = v1;
}

void sub_248A368F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 240) = (char *)&a9 - v9;
}

void sub_248A3690C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_248A2F4AC(a1, a2, v2);
}

void sub_248A36918(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_2489C3298(v2, a2);
}

void sub_248A36920(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_2489C3298(v2, a2);
}

uint64_t sub_248A3693C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 160));
}

uint64_t MiniTipsDatastore.performAndWait<A>(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];
  _QWORD v13[2];

  if (!*(_QWORD *)(v4 + OBJC_IVAR____TtC10TipKitCore17MiniTipsDatastore_modelContainer))
    return sub_2489BE7E0(a4, 1, 1, a3);
  sub_2489C6124();
  if (pthread_main_np() == 1 && _CFRunLoopCurrentIsMain())
  {
    v8 = sub_248A45768();
    v13[1] = v13;
    MEMORY[0x24BDAC7A8](v8, v9);
    v12[2] = a3;
    v12[3] = v4;
    v12[4] = a1;
    v12[5] = a2;
    v10 = sub_248A45924();
    sub_248A36DE0((void (*)(void))sub_248A36F74, (uint64_t)v12, (uint64_t)"TipKitCore/MiniTipsDatastore+DatastoreTasks.swift", 49, 2, 19, v10);
    return sub_2489BEDD4();
  }
  else
  {
    sub_248A45108();
    sub_2489C6124();
    sub_248A453F0();
    sub_248A3A52C();
    sub_248A3A608(a1);
    sub_2489BEDD4();
    return swift_release();
  }
}

uint64_t sub_248A36AC4()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for DatastoreActor();
  v0 = swift_allocObject();
  result = swift_defaultActor_initialize();
  qword_254464718 = v0;
  return result;
}

uint64_t static DatastoreActor.shared.getter()
{
  if (qword_254464558 != -1)
    swift_once();
  return swift_retain();
}

uint64_t DatastoreActor.deinit()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return v0;
}

uint64_t DatastoreActor.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t DatastoreActor.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_248A36B80()
{
  return DatastoreActor.unownedExecutor.getter();
}

uint64_t sub_248A36B98()
{
  return static DatastoreActor.shared.getter();
}

uint64_t sub_248A36BAC()
{
  type metadata accessor for DatastoreActor();
  return sub_248A45A50();
}

uint64_t sub_248A36BD0@<X0>(void (*a1)(uint64_t)@<X1>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  sub_248A45768();
  sub_248A4575C();
  sub_248A45738();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_248A36CA8(a1, a2, a3);
  return swift_release();
}

uint64_t sub_248A36CA8@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;

  sub_248A45768();
  sub_248A4575C();
  sub_248A45738();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  if (*(_QWORD *)(v3 + OBJC_IVAR____TtC10TipKitCore17MiniTipsDatastore_modelContainer))
  {
    swift_retain();
    sub_248A4512C();
    swift_release();
    if ((sub_248A45090() & 1) != 0)
      sub_248A4509C();
    sub_248A3A608(a1);
    swift_release();
  }
  else
  {
    sub_2489BE7E0(a3, 1, 1, a2);
  }
  return swift_release();
}

uint64_t sub_248A36DE0(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v11;
  uint64_t result;
  int isEscapingClosureAtFileLocation;

  sub_248A4575C();
  swift_release();
  swift_task_getMainExecutor();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    goto LABEL_6;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a7;
  v11[3] = a1;
  v11[4] = a2;
  a1();
  if (v7)
    return swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
LABEL_6:
    sub_248A45A74();
    sub_248A4557C();
    sub_248A46098();
    sub_248A4557C();
    swift_bridgeObjectRelease();
    sub_248A4557C();
    result = sub_248A45C00();
    __break(1u);
  }
  return result;
}

uint64_t sub_248A36F74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_248A36BD0(*(void (**)(uint64_t))(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_248A36F90()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_2489C330C(&qword_254464DF0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  sub_2489B6B34();
  v15 = sub_2489C330C(&qword_254464DF8);
  v6 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2489C330C(&qword_254464E08);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  sub_2489BA838();
  swift_defaultActor_initialize();
  sub_2489C330C(&qword_254464E18);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v1, *MEMORY[0x24BEE6A10], v3);
  sub_248A4578C();
  sub_2489C33F4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v0 + OBJC_IVAR____TtCC10TipKitCore17MiniTipsDatastore14DatastoreQueue_continuations, v9, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v0 + OBJC_IVAR____TtCC10TipKitCore17MiniTipsDatastore14DatastoreQueue_stream, v2, v10);
  return v0;
}

uint64_t sub_248A370F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[7] = a3;
  v4[8] = v3;
  v4[5] = a1;
  v4[6] = a2;
  v5 = sub_2489C330C(&qword_254464830);
  v4[9] = v5;
  v4[10] = *(_QWORD *)(v5 - 8);
  v4[11] = swift_task_alloc();
  return sub_2489BF788();
}

uint64_t sub_248A37158()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  sub_248A45108();
  swift_retain();
  sub_248A453F0();
  v0[12] = sub_248A3A52C();
  sub_2489C330C(&qword_254464E08);
  sub_248A457B0();
  v0[13] = sub_2489C50CC((unint64_t *)&qword_254464868, v1, (uint64_t (*)(uint64_t))type metadata accessor for MiniTipsDatastore.DatastoreQueue, (uint64_t)&protocol conformance descriptor for MiniTipsDatastore.DatastoreQueue);
  v2 = (_QWORD *)swift_task_alloc();
  v0[14] = v2;
  *v2 = v0;
  v2[1] = sub_248A37260;
  return sub_248A457BC();
}

uint64_t sub_248A37260()
{
  sub_2489C0354();
  sub_2489BFA2C();
  return sub_2489BF788();
}

uint64_t sub_248A3729C()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void);

  v1 = *(int **)(v0 + 16);
  *(_QWORD *)(v0 + 120) = v1;
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 96);
    *(_QWORD *)(v0 + 128) = *(_QWORD *)(v0 + 24);
    *(_QWORD *)(v0 + 32) = v2;
    v7 = (uint64_t (*)(void))((char *)v1 + *v1);
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v3;
    *v3 = v0;
    v3[1] = sub_248A37344;
    return v7();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 80);
    swift_release();
    sub_2489C33F4(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_2489C33EC();
    return sub_2489C1CDC(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_248A37344()
{
  sub_2489C0354();
  sub_2489BFA2C();
  sub_2489BD87C();
  return sub_2489BF788();
}

uint64_t sub_248A37378()
{
  sub_248A450CC();
  return sub_2489C1540();
}

uint64_t sub_248A373B0()
{
  uint64_t v0;
  _QWORD *v1;

  sub_248A38744(*(_QWORD *)(v0 + 120));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v1;
  *v1 = v0;
  v1[1] = sub_248A37260;
  return sub_248A457BC();
}

uint64_t sub_248A3742C(uint64_t a1, uint64_t a2)
{
  return sub_248A37878(a1, a2);
}

uint64_t sub_248A37440(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *a2;
  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_2489F3B7C;
  return v7(v4);
}

uint64_t sub_248A374A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248A374C4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  v1 = swift_task_alloc();
  v2 = (_QWORD *)sub_2489C5EBC(v1);
  *v2 = v0;
  v2[1] = sub_2489F3B7C;
  v3 = sub_2489C51B4();
  return v4(v3);
}

uint64_t sub_248A37530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return sub_2489C0784();
}

uint64_t sub_248A37548(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __n128 *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);

  sub_2489C50CC((unint64_t *)&qword_254464868, a2, (uint64_t (*)(uint64_t))type metadata accessor for MiniTipsDatastore.DatastoreQueue, (uint64_t)&protocol conformance descriptor for MiniTipsDatastore.DatastoreQueue);
  v3 = (__n128 *)sub_2489BEF00();
  sub_2489C7048(v3);
  v4 = (_QWORD *)sub_2489C5F80();
  *(_QWORD *)(v2 + 64) = v4;
  *v4 = v2;
  v4[1] = sub_248A375C8;
  sub_2489BA568();
  return sub_2489BF70C(v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_248A375C8()
{
  uint64_t v0;

  sub_2489C0354();
  sub_2489BFA2C();
  sub_2489C33EC();
  return sub_2489BA7F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t type metadata accessor for MiniTipsDatastore.DatastoreQueue()
{
  uint64_t result;

  result = qword_254464D60;
  if (!qword_254464D60)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_248A37630(uint64_t a1)
{
  uint64_t *v1;

  return sub_248A37C60(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_248A37660(uint64_t a1, uint64_t *a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t);

  v6[2] = a3;
  v6[3] = a6;
  v9 = swift_task_alloc();
  v6[4] = v9;
  v10 = *a2;
  v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  v11 = (_QWORD *)swift_task_alloc();
  v6[5] = v11;
  *v11 = v6;
  v11[1] = sub_248A376F8;
  return v13(v9, v10);
}

uint64_t sub_248A376F8()
{
  sub_2489C0354();
  sub_2489BFA2C();
  sub_2489BD87C();
  return sub_2489BF788();
}

uint64_t sub_248A3772C()
{
  uint64_t v0;

  sub_248A37760(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  sub_2489C33EC();
  return sub_2489BA7F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248A37760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(*(_QWORD *)(*(_QWORD *)(a2 + 64) + 40), a1);
  return swift_continuation_resume();
}

uint64_t sub_248A37798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    swift_getObjectType();
    sub_248A45738();
  }
  return swift_task_switch();
}

uint64_t sub_248A37800()
{
  void (*v0)(uint64_t);
  uint64_t v1;
  uint64_t v2;

  sub_2489BDA2C();
  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = sub_248A37844;
  v2 = swift_continuation_init();
  v0(v2);
  return sub_2489C0AE0();
}

uint64_t sub_248A37844()
{
  uint64_t (*v0)(void);

  v0 = (uint64_t (*)(void))sub_2489C0920();
  return sub_2489BA7F4(v0);
}

uint64_t sub_248A37864(uint64_t a1, uint64_t a2)
{
  return sub_248A37878(a1, a2);
}

uint64_t sub_248A37878(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = sub_2489C330C(qword_254464C08);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  sub_2489BA838();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  sub_2489C6124();
  sub_2489C330C(&qword_254464DF8);
  sub_248A45798();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
}

uint64_t sub_248A37940(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *a2;
  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 48) = v5;
  *v5 = v3;
  v5[1] = sub_248A379A0;
  return v7(v4);
}

uint64_t sub_248A379A0()
{
  uint64_t v0;
  uint64_t v1;

  sub_2489C05E0();
  if (!v0)
    return sub_2489BA7F4(*(uint64_t (**)(void))(v1 + 8));
  sub_2489BD87C();
  return sub_2489BF788();
}

uint64_t sub_248A379DC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  if (qword_254462F70 != -1)
    swift_once();
  v1 = *(void **)(v0 + 56);
  v2 = type metadata accessor for logger();
  sub_2489C401C(v2, (uint64_t)&unk_254462F58);
  sub_248A45A74();
  sub_248A4557C();
  swift_getErrorValue();
  sub_248A45D8C();
  sub_2489BE9AC();
  swift_bridgeObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248A37AD8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  int *v5;

  v1 = swift_task_alloc();
  v2 = (_QWORD *)sub_2489C5EBC(v1);
  *v2 = v0;
  v2[1] = sub_2489F3B7C;
  v3 = sub_2489C51B4();
  return sub_248A37940(v3, v4, v5);
}

uint64_t sub_248A37B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return sub_2489C0784();
}

uint64_t sub_248A37B48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __n128 *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void);

  sub_2489C50CC((unint64_t *)&qword_254464868, a2, (uint64_t (*)(uint64_t))type metadata accessor for MiniTipsDatastore.DatastoreQueue, (uint64_t)&protocol conformance descriptor for MiniTipsDatastore.DatastoreQueue);
  v3 = (__n128 *)sub_2489BEF00();
  sub_2489C7048(v3);
  v4 = (_QWORD *)sub_2489C5F80();
  *(_QWORD *)(v2 + 64) = v4;
  *v4 = v2;
  v4[1] = sub_248A37BC8;
  sub_2489BA568();
  return sub_2489BF70C(v5, v6, v7, v8, v9, v10, v11);
}

uint64_t sub_248A37BC8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return sub_2489C1540();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_248A37C34()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_2489BA7F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248A37C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v10 = sub_2489C330C(qword_254464C08);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  sub_2489B6B34();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a5;
  v13[3] = a1;
  v13[4] = a3;
  v13[5] = a4;
  swift_retain();
  sub_2489C330C(&qword_254464DF8);
  sub_248A45798();
  return sub_2489C33F4(v5, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
}

uint64_t sub_248A37D78(uint64_t a1)
{
  uint64_t *v1;

  return sub_248A37C60(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_248A37DA8(uint64_t a1, uint64_t *a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t);

  v6[3] = a3;
  v6[4] = a6;
  v9 = swift_task_alloc();
  v6[5] = v9;
  v10 = *a2;
  v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)a4 + *a4);
  v11 = (_QWORD *)swift_task_alloc();
  v6[6] = v11;
  *v11 = v6;
  v11[1] = sub_248A37E40;
  return v13(v9, v10);
}

uint64_t sub_248A37E40()
{
  sub_2489C05E0();
  sub_2489BD87C();
  return sub_2489BF788();
}

uint64_t sub_248A37E7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  sub_2489C330C(&qword_254464C00);
  sub_248A37F3C(v2, v3, v1);
  swift_task_dealloc();
  return sub_2489C1CDC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248A37ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 56);
  v3 = sub_2489C330C(&qword_254464C00);
  sub_248A37F74(v0 + 16, v1, v2, v3);
  swift_task_dealloc();
  return sub_2489C1CDC(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248A37F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(*(_QWORD *)(*(_QWORD *)(a2 + 64) + 40), a1);
  return swift_continuation_throwingResume();
}

uint64_t sub_248A37F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v6, a1, a4);
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_248A37FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    swift_getObjectType();
    sub_248A45738();
  }
  return swift_task_switch();
}

uint64_t sub_248A38040()
{
  void (*v0)(uint64_t);
  uint64_t v1;
  uint64_t v2;

  sub_2489BDA2C();
  *(_QWORD *)(v1 + 16) = v1;
  *(_QWORD *)(v1 + 24) = sub_248A38084;
  v2 = swift_continuation_init();
  v0(v2);
  return sub_2489C0AE0();
}

uint64_t sub_248A38084()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 48))
    swift_willThrow();
  return sub_2489BA9B0(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_248A380CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 80) = v2;
  sub_2489C50CC((unint64_t *)&qword_254464868, a2, (uint64_t (*)(uint64_t))type metadata accessor for MiniTipsDatastore.DatastoreQueue, (uint64_t)&protocol conformance descriptor for MiniTipsDatastore.DatastoreQueue);
  if (v2)
  {
    swift_getObjectType();
    sub_248A45738();
  }
  return sub_2489C1540();
}

uint64_t sub_248A38140()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_248A37844;
  v1 = swift_continuation_init();
  sub_248A38190(v1);
  return swift_continuation_await();
}

uint64_t sub_248A38190(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v2 = sub_2489C330C(qword_254464C08);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  v9[0] = &unk_2577A58D0;
  v9[1] = v7;
  sub_2489C330C(&qword_254464DF8);
  sub_248A45798();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_248A38290(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a3;
  return swift_task_switch();
}

uint64_t sub_248A382A8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  *(_QWORD *)(v1 + 16) = v0;
  v2 = (_QWORD *)sub_2489C2598();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_248A38300;
  return v4();
}

uint64_t sub_248A38300()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  sub_2489C0354();
  *v2 = *v1;
  *(_QWORD *)(v3 + 32) = v0;
  swift_task_dealloc();
  return sub_2489C1540();
}

uint64_t sub_248A38354()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248A38360(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a2;
  return swift_task_switch();
}

uint64_t sub_248A38378()
{
  uint64_t v0;

  if ((sub_248A45078() & 1) != 0)
    sub_248A450B4();
  return sub_2489BA9B0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t MiniTipsDatastore.DatastoreQueue.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtCC10TipKitCore17MiniTipsDatastore14DatastoreQueue_continuations;
  v3 = sub_2489C330C(&qword_254464DF8);
  sub_248A457A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  v4 = v1 + OBJC_IVAR____TtCC10TipKitCore17MiniTipsDatastore14DatastoreQueue_stream;
  v5 = sub_2489C330C(&qword_254464E08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_defaultActor_destroy();
  return v1;
}

uint64_t MiniTipsDatastore.DatastoreQueue.__deallocating_deinit()
{
  MiniTipsDatastore.DatastoreQueue.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t sub_248A38470(uint64_t a1, uint64_t a2)
{
  return sub_248A3849C(&qword_254462B10, a2, (uint64_t (*)(uint64_t))type metadata accessor for DatastoreActor, (uint64_t)&protocol conformance descriptor for DatastoreActor);
}

uint64_t sub_248A3849C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2495A2D34](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for DatastoreActor()
{
  return objc_opt_self();
}

uint64_t method lookup function for DatastoreActor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_248A38508()
{
  return type metadata accessor for MiniTipsDatastore.DatastoreQueue();
}

void sub_248A38510()
{
  unint64_t v0;
  unint64_t v1;

  sub_248A386E8(319, &qword_254464E00, MEMORY[0x24BEE6A40]);
  if (v0 <= 0x3F)
  {
    sub_248A386E8(319, &qword_254464E10, MEMORY[0x24BEE6A98]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for MiniTipsDatastore.DatastoreQueue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MiniTipsDatastore.DatastoreQueue.addTask(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of MiniTipsDatastore.DatastoreQueue.addTask<A>(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  sub_2489C59A8();
  v0 = sub_2489C2598();
  v1 = (_QWORD *)sub_2489C5EBC(v0);
  v2 = sub_2489C6DA4(v1);
  return sub_2489BFBDC(v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  sub_2489C59A8();
  v0 = sub_2489C2598();
  v1 = (_QWORD *)sub_2489C5EBC(v0);
  v2 = sub_2489C6DA4(v1);
  return sub_2489BFBDC(v2, v3, v4, v5, v6);
}

uint64_t dispatch thunk of MiniTipsDatastore.DatastoreQueue.barrier()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)sub_2489C2598();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2489F3B7C;
  return sub_2489BA7F4(v3);
}

uint64_t dispatch thunk of MiniTipsDatastore.DatastoreQueue.saveChanges()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)sub_2489C2598();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2489F2ED4;
  return sub_2489BA7F4(v3);
}

void sub_248A386E8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_2489BCD7C(&qword_254464E18);
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_248A38744(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_248A38754()
{
  return sub_2489C0C34();
}

uint64_t sub_248A38760(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = *(_QWORD *)(v2 + 16);
  v7 = swift_task_alloc();
  v8 = (_QWORD *)sub_2489C5EBC(v7);
  *v8 = v3;
  v8[1] = sub_2489F3B7C;
  return sub_248A38290(a1, a2, v6);
}

uint64_t sub_248A387C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248A387E8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_2489C4FF4();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_2489C5EBC(v0);
  v2 = sub_2489BF8F4(v1);
  return sub_248A37DA8(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_248A3883C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  sub_2489C4FF4();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)sub_2489C5EBC(v0);
  v2 = sub_2489BF8F4(v1);
  return sub_248A37660(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_248A38890()
{
  return sub_2489C0C34();
}

uint64_t sub_248A388AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  _WORD v44[8];
  uint64_t v45;

  v40 = a4;
  v41 = a5;
  v38 = a1;
  v39 = a3;
  v36 = a2;
  v34 = a6;
  v37 = sub_248A45258();
  v35 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37, v6);
  sub_2489BFA18();
  v33 = v7;
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v32 - v10;
  v12 = sub_248A44DFC();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = sub_248A44EB0();
  v42 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45, v17);
  sub_2489BFA18();
  v32 = v18;
  MEMORY[0x24BDAC7A8](v19, v20);
  v22 = (char *)&v32 - v21;
  v23 = sub_248A38B54();
  v24 = *(_QWORD *)(v23 + 16);
  if (v24)
  {
    v25 = v23 + 32;
    do
    {
      v25 += 8;
      sub_248A448E0();
      --v24;
    }
    while (v24);
  }
  swift_bridgeObjectRelease();
  strcpy((char *)v44, "tips-store.db");
  v44[7] = -4864;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v16, *MEMORY[0x24BDCD7A0], v12);
  sub_2489C9788();
  sub_248A44E98();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  swift_bridgeObjectRelease();
  v26 = v43;
  sub_248A39CF4(v39, v40, v41);
  if (v26)
    return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v22, v45);
  v28 = v42;
  v29 = v45;
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 16))(v32, v22, v45);
  v30 = v35;
  v31 = v37;
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 16))(v33, v11, v37);
  swift_retain();
  sub_248A4527C();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v11, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v22, v29);
}

uint64_t sub_248A38B54()
{
  uint64_t v0;

  sub_2489C94B4();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_248A47460;
  *(_QWORD *)(v0 + 32) = sub_2489C330C(&qword_2544647A8);
  *(_QWORD *)(v0 + 40) = sub_2489C330C(&qword_2544647A0);
  *(_QWORD *)(v0 + 48) = type metadata accessor for RawDictionaryTransformer();
  return v0;
}

unint64_t sub_248A38BCC(uint64_t a1, unint64_t a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;

  v4 = sub_248A44EB0();
  MEMORY[0x24BDAC7A8](v4, v5);
  sub_2489BBC7C();
  v6 = sub_2489C330C(&qword_254464560);
  MEMORY[0x24BDAC7A8](v6, v7);
  sub_2489BBC7C();
  v10 = v9 - v8;
  v11 = sub_248A45270();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  sub_2489BBC7C();
  v16 = v15 - v14;
  sub_248A38EAC(a2, v10);
  if (sub_2489BE834(v10, 1, v11) == 1)
  {
    sub_248A38EF4(v10);
    sub_2489C9824();
    sub_2489BF740();
    *v17 = 0xD00000000000001FLL;
    v17[1] = 0x8000000248A52040;
    swift_willThrow();
  }
  else
  {
    v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v16, v10, v11);
    MEMORY[0x2495A19D8](v18);
    v19 = sub_248A44E08();
    a2 = v20;
    swift_bridgeObjectRelease();
    v21 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0)
      v21 = v19 & 0xFFFFFFFFFFFFLL;
    if (v21)
    {
      if (qword_254464910 != -1)
        swift_once();
      v22 = type metadata accessor for logger();
      sub_2489C401C(v22, (uint64_t)&unk_254464980);
      sub_2489BE9AC();
      sub_248A45144();
      sub_2489C330C(&qword_2544647F0);
      v23 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      a2 = swift_allocObject();
      *(_OWORD *)(a2 + 16) = xmmword_248A47480;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 16))(a2 + v23, v16, v11);
      swift_retain();
      v24 = sub_248A45138();
      if (!v2)
      {
        a2 = v24;
        sub_2489C3D24();
        sub_2489C1750();
        return a2;
      }
      sub_2489C3D24();
    }
    else
    {
      sub_2489C3D24();
      sub_2489C9824();
      sub_2489BF740();
      *v25 = 0xD00000000000001ELL;
      v25[1] = 0x8000000248A52090;
      swift_willThrow();
    }
    sub_2489C1750();
  }
  return a2;
}

uint64_t sub_248A38EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2489C330C(&qword_254464560);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A38EF4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2489C330C(&qword_254464560);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248A38F34()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_248A45348();
  MEMORY[0x24BDAC7A8](v0, v1);
  sub_248A38FD8();
  sub_248A45354();
  sub_248A45390();
  swift_allocObject();
  return sub_248A4539C();
}

uint64_t sub_248A38FD8()
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

  sub_2489C330C(&qword_2544647E8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_248A496D0;
  v1 = type metadata accessor for CoreTipRecord();
  v2 = sub_2489C962C((unint64_t *)&qword_2544646D0, (uint64_t (*)(uint64_t))type metadata accessor for CoreTipRecord, (uint64_t)&protocol conformance descriptor for CoreTipRecord);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 40) = v2;
  v3 = type metadata accessor for CoreRuleRecord();
  v4 = sub_2489C962C((unint64_t *)&qword_2544645B8, (uint64_t (*)(uint64_t))type metadata accessor for CoreRuleRecord, (uint64_t)&protocol conformance descriptor for CoreRuleRecord);
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v0 + 56) = v4;
  v5 = type metadata accessor for CoreParameterRecord();
  v6 = sub_2489C962C(&qword_254464678, (uint64_t (*)(uint64_t))type metadata accessor for CoreParameterRecord, (uint64_t)&protocol conformance descriptor for CoreParameterRecord);
  *(_QWORD *)(v0 + 64) = v5;
  *(_QWORD *)(v0 + 72) = v6;
  v7 = type metadata accessor for CoreEventRecord();
  v8 = sub_2489C962C(&qword_2544645F8, (uint64_t (*)(uint64_t))type metadata accessor for CoreEventRecord, (uint64_t)&protocol conformance descriptor for CoreEventRecord);
  *(_QWORD *)(v0 + 80) = v7;
  *(_QWORD *)(v0 + 88) = v8;
  v9 = type metadata accessor for CoreDonationRecord();
  v10 = sub_2489C962C(&qword_254464638, (uint64_t (*)(uint64_t))type metadata accessor for CoreDonationRecord, (uint64_t)&protocol conformance descriptor for CoreDonationRecord);
  *(_QWORD *)(v0 + 96) = v9;
  *(_QWORD *)(v0 + 104) = v10;
  return v0;
}

uint64_t sub_248A390F8(uint64_t a1, uint64_t a2)
{
  return sub_248A39104(a1, a2, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, _QWORD *))sub_248A39CC4);
}

uint64_t sub_248A39104(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, os_unfair_lock_s *, _QWORD *))
{
  uint64_t v3;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[0] = a1;
  v10[1] = a2;
  v5 = *(os_unfair_lock_s **)(v3 + 16);
  v6 = v5 + 4;
  v7 = v5 + 6;
  os_unfair_lock_lock(v5 + 6);
  a3(&v9, v6, v10);
  os_unfair_lock_unlock(v7);
  return v9;
}

uint64_t sub_248A39168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_248A39210(a2, a3, (_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t, _QWORD))sub_2489D9324, (uint64_t)&qword_254462EA8, (uint64_t)&qword_254464D50, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_248A2F1CC);
}

uint64_t sub_248A391BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_248A39210(a2, a3, (_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t, _QWORD))sub_2489D9330, (uint64_t)&qword_254463FD8, (uint64_t)&qword_254464AA0, (uint64_t (*)(uint64_t *, uint64_t, uint64_t))sub_248A2F1E8);
}

uint64_t sub_248A39210(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t, _QWORD), uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *, uint64_t, uint64_t))
{
  _QWORD *v6;
  _QWORD *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t Strong;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char v27;

  v10 = a3(&v26, a1, a2, *v6);
  v11 = v27;
  v13 = sub_2489C3D34((uint64_t)v10, v12);
  if ((v11 & 1) != 0)
    goto LABEL_7;
  v15 = sub_2489C1760(v13, v14);
  if ((v27 & 1) != 0)
  {
    sub_2489C3D34((uint64_t)v15, v16);
  }
  else
  {
    v17 = sub_2489C0248((uint64_t)v15);
    sub_2489C3D34(v17, v18);
    Strong = swift_weakLoadStrong();
    sub_2489C19E4(Strong);
    if (Strong)
    {
      v13 = swift_release();
      goto LABEL_7;
    }
  }
  v26 = 0;
  v27 = 1;
  sub_248A453F0();
  v13 = a6(&v26, a1, a2);
LABEL_7:
  v20 = sub_2489C1760(v13, v14);
  if ((v27 & 1) != 0)
  {
    sub_2489C3D34((uint64_t)v20, v21);
    return 0;
  }
  else
  {
    v23 = sub_2489C0248((uint64_t)v20);
    sub_2489C3D34(v23, v24);
    v22 = swift_weakLoadStrong();
    sub_2489C19E4(v22);
  }
  return v22;
}

uint64_t static MiniTipsDatastore.resetModelManagers()()
{
  if (qword_254464558 != -1)
    swift_once();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  type metadata accessor for CoreTip();
  sub_248A15588();
  type metadata accessor for CoreParameter();
  sub_2489F85B8();
  type metadata accessor for CoreEvent();
  return sub_2489F405C();
}

uint64_t static MiniTipsDatastore.datastore(appleBundleID:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  v4 = sub_248A44DFC();
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v5 = sub_248A44EB0();
  v3[13] = v5;
  v3[14] = *(_QWORD *)(v5 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  if (qword_254464558 != -1)
    swift_once();
  v3[17] = qword_254464718;
  return swift_task_switch();
}

uint64_t sub_248A39488()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (qword_254464E68 != -1)
    swift_once();
  if (byte_254464E60 != 1)
  {
    sub_2489C9824();
    swift_allocError();
    *v5 = 0xD000000000000043;
    v5[1] = 0x8000000248A520E0;
    swift_willThrow();
    sub_2489C25AC();
    sub_2489BBD28();
    sub_2489C08FC();
    sub_2489BFCAC();
    __asm { BR              X0 }
  }
  if (qword_254464D48 != -1)
    swift_once();
  v2 = v0[7];
  v1 = v0[8];
  sub_2489BFA10();
  swift_retain();
  sub_248A453F0();
  v3 = sub_248A39104(v2, v1, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *, _QWORD *))sub_248A39C94);
  swift_release();
  swift_bridgeObjectRelease();
  if (v3)
  {
    sub_2489C25AC();
    sub_2489BBD28();
    sub_2489C08FC();
    sub_2489BFCAC();
    __asm { BR              X1 }
  }
  if (qword_254464910 != -1)
    swift_once();
  v7 = type metadata accessor for logger();
  sub_2489C401C(v7, (uint64_t)&unk_254464980);
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v8 = v0[15];
  v9 = v0[8];
  v10 = v0[7];
  sub_248A45A74();
  sub_248A4557C();
  sub_248A4557C();
  sub_2489BE9AC();
  swift_bridgeObjectRelease();
  swift_allocObject();
  swift_bridgeObjectRetain_n();
  v0[18] = MiniTipsDatastore.init(id:bundleID:)(v10, v9, v10, v9);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager, 0, 0xE000000000000000);
  URL.init(groupIdentifier:fileManager:)(v11, v8);
  v12 = v0[15];
  v13 = v0[13];
  v14 = v0[14];
  v16 = v0[11];
  v15 = v0[12];
  v17 = v0[8];
  v0[5] = v0[7];
  v18 = v0[10];
  v0[6] = v17;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v15, *MEMORY[0x24BDCD790], v18);
  sub_2489C9788();
  sub_248A44EA4();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v18);
  v19 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v0[19] = v19;
  v19(v12, v13);
  v20 = (_QWORD *)swift_task_alloc();
  v0[20] = v20;
  *v20 = v0;
  v20[1] = sub_248A39860;
  sub_2489BFCAC();
  return MiniTipsDatastore.configure(url:monitorChanges:cloudKitContainer:)(v21, v22, v23, v24, v25);
}

uint64_t sub_248A39860()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 168) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2 + 152))(*(_QWORD *)(v2 + 128), *(_QWORD *)(v2 + 104));
  if (v0)
    return swift_task_switch();
  v4 = *(_QWORD *)(v2 + 144);
  swift_task_dealloc();
  sub_2489BBD28();
  sub_2489C08FC();
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_248A39914()
{
  uint64_t v0;

  swift_release();
  sub_2489C25AC();
  sub_2489BBD28();
  sub_2489C08FC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_248A3995C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;

  if (qword_254464E70 != -1)
    swift_once();
  swift_beginAccess();
  if (qword_254464F38)
  {
    v0 = qword_254464F30;
    v1 = qword_254464F38;
  }
  else
  {
    if (qword_254464F80 != -1)
      swift_once();
    if (qword_25446C6D8)
    {
      v0 = qword_25446C6D0;
      v1 = qword_25446C6D8;
    }
    else
    {
      type metadata accessor for CFBundle(0);
      v2 = sub_2489D7B5C();
      if (v3)
        v0 = v2;
      else
        v0 = 0;
      if (v3)
        v1 = v3;
      else
        v1 = 0xE000000000000000;
    }
    sub_248A453F0();
  }
  type metadata accessor for MiniTipsDatastore();
  swift_allocObject();
  sub_248A453F0();
  result = MiniTipsDatastore.init(id:bundleID:)(0xD000000000000017, 0x8000000248A52170, v0, v1);
  qword_254464B78 = (uint64_t)result;
  return result;
}

uint64_t static MiniTipsDatastore.shared.getter()
{
  if (qword_254464B70 != -1)
    swift_once();
  return swift_retain();
}

void sub_248A39AE0()
{
  uint64_t v0;
  uint64_t v1;

  sub_2489C330C(&qword_254464D50);
  v0 = sub_248A453C0();
  sub_2489C330C(&qword_254464D58);
  swift_allocObject();
  sub_248A14710(v0);
  qword_254464E20 = v1;
}

uint64_t static MiniTipsDatastore.activeStores.getter()
{
  if (qword_254464D48 != -1)
    swift_once();
  sub_2489BFA10();
  return swift_retain();
}

uint64_t static MiniTipsDatastore.activeStores.setter(uint64_t a1)
{
  if (qword_254464D48 != -1)
    swift_once();
  sub_2489BFA10();
  qword_254464E20 = a1;
  return swift_release();
}

uint64_t (*static MiniTipsDatastore.activeStores.modify())()
{
  if (qword_254464D48 != -1)
    swift_once();
  sub_2489BFA10();
  return j__swift_endAccess;
}

uint64_t sub_248A39C94@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_248A39168(a1, *a2, a2[1]);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_248A39CC4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_248A391BC(a1, *a2, a2[1]);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_248A39CF4(char a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  if (a3 == 1)
    return sub_248A45240();
  if (a3)
  {
    v7 = (_QWORD *)sub_248A2A7C0();
    v8 = sub_2489B482C(a2, a3, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
      return MEMORY[0x2495A19C0](a2, a3);
    if ((a1 & 1) == 0)
      goto LABEL_19;
  }
  else if ((a1 & 1) == 0)
  {
    return sub_248A45240();
  }
  v9 = sub_248A2A7C0();
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    sub_248A453F0();
    v11 = (uint64_t *)(v9 + 40);
    while (1)
    {
      v13 = *(v11 - 1);
      v12 = *v11;
      sub_248A453F0();
      if ((sub_248A455AC() & 1) != 0)
        break;
      v11 += 2;
      swift_bridgeObjectRelease();
      if (!--v10)
      {
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    swift_bridgeObjectRelease_n();
    MEMORY[0x2495A19C0](v13, v12);
    return swift_bridgeObjectRelease();
  }
LABEL_14:
  swift_bridgeObjectRelease();
  v14 = (_QWORD *)sub_248A2A7C0();
  if (v14[2])
  {
    v15 = v14[4];
    v16 = v14[5];
    sub_248A453F0();
    swift_bridgeObjectRelease();
    MEMORY[0x2495A19C0](v15, v16);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_19:
  sub_2489C9824();
  swift_allocError();
  *v17 = 0xD000000000000027;
  v17[1] = 0x8000000248A52190;
  return swift_willThrow();
}

uint64_t sub_248A39EC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_248A45294();
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
  return sub_2489BE7E0(a2, v7, 1, v6);
}

uint64_t sub_248A39F38@<X0>(uint64_t *a1@<X8>)
{
  sub_248A39FD8();
  a1[3] = sub_2489C330C(&qword_2577A5908);
  a1[4] = sub_248A3A240();
  sub_2489BE690(a1);
  sub_248A45900();
  sub_2489C330C(&qword_254464548);
  sub_248A3A284();
  return sub_248A45D5C();
}

uint64_t sub_248A39FD8()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = (void *)sub_248A454BC();
  v2 = sub_248A4590C();

  return v2;
}

uint64_t sub_248A3A058(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[14] = a1;
  v2[15] = a2;
  sub_2489C330C(&qword_2577A5918);
  v2[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_248A3A0B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v10;

  v1 = sub_248A44BEC();
  if (!v1)
  {
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    goto LABEL_7;
  }
  v2 = v1;
  strcpy((char *)(v0 + 88), "HistoryTokens");
  *(_WORD *)(v0 + 102) = -4864;
  sub_248A45A44();
  sub_2489D9404(v0 + 16, v2, (_OWORD *)(v0 + 56));
  swift_bridgeObjectRelease();
  sub_2489D139C(v0 + 16);
  if (!*(_QWORD *)(v0 + 80))
  {
LABEL_7:
    v7 = &qword_254464AF0;
    v8 = v0 + 56;
LABEL_8:
    sub_2489C32D0(v8, v7);
    goto LABEL_9;
  }
  sub_2489C330C(&qword_2577A5920);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 128);
    sub_248A39EC0(*(_QWORD *)(v0 + 104), v3);
    swift_bridgeObjectRelease();
    v4 = sub_248A45294();
    v5 = sub_2489BE834(v3, 1, v4);
    v6 = *(_QWORD *)(v0 + 128);
    if (v5 != 1)
    {
      v10 = *(uint64_t **)(v0 + 112);
      *v10 = sub_248A45288();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v6, v4);
      goto LABEL_10;
    }
    v7 = (uint64_t *)&unk_2577A5918;
    v8 = *(_QWORD *)(v0 + 128);
    goto LABEL_8;
  }
LABEL_9:
  **(_QWORD **)(v0 + 112) = 0;
LABEL_10:
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_248A3A240()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577A5910;
  if (!qword_2577A5910)
  {
    v1 = sub_2489BCD7C(&qword_2577A5908);
    result = MEMORY[0x2495A2D34](MEMORY[0x24BEE7030], v1);
    atomic_store(result, (unint64_t *)&qword_2577A5910);
  }
  return result;
}

unint64_t sub_248A3A284()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254464308;
  if (!qword_254464308)
  {
    v1 = sub_248A45900();
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDD0050], v1);
    atomic_store(result, (unint64_t *)&qword_254464308);
  }
  return result;
}

uint64_t sub_248A3A2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = v4;
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v8 = a1;
    v25 = MEMORY[0x24BEE4AF8];
    sub_248A02A0C(0, v7, 0);
    v9 = v25;
    result = sub_248A3AFA0(v8);
    if ((result & 0x8000000000000000) == 0)
    {
      v12 = result;
      if (result < 1 << *(_BYTE *)(v8 + 32))
      {
        v13 = v11;
        v24 = v8 + 64;
        v20 = a2;
        while ((*(_QWORD *)(v24 + 8 * (v12 >> 6)) & (1 << v12)) != 0)
        {
          if (v13 != *(_DWORD *)(v8 + 36))
            goto LABEL_23;
          v23 = v7;
          v14 = v8;
          v15 = v9;
          v16 = v14;
          v9 = a2;
          result = sub_248A3A64C(*(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v12), a3, a4);
          if (v5)
          {
            swift_bridgeObjectRelease();
            swift_release();
            swift_release();
            return v9;
          }
          v17 = result;
          v9 = v15;
          v26 = v15;
          v18 = *(_QWORD *)(v15 + 16);
          v19 = *(_QWORD *)(v9 + 24);
          if (v18 >= v19 >> 1)
          {
            result = (uint64_t)sub_248A02A0C((char *)(v19 > 1), v18 + 1, 1);
            v9 = v26;
          }
          *(_QWORD *)(v9 + 16) = v18 + 1;
          *(_QWORD *)(v9 + 8 * v18 + 32) = v17;
          if ((uint64_t)v12 >= -(-1 << *(_BYTE *)(v16 + 32)))
            goto LABEL_24;
          if ((*(_QWORD *)(v24 + 8 * (v12 >> 6)) & (1 << v12)) == 0)
            goto LABEL_25;
          v8 = v16;
          if (v13 != *(_DWORD *)(v16 + 36))
            goto LABEL_26;
          result = sub_248A459FC();
          v7 = v23 - 1;
          if (v23 == 1)
          {
            swift_release();
            goto LABEL_20;
          }
          v12 = result;
          v5 = 0;
          a2 = v20;
          if ((result & 0x8000000000000000) == 0)
          {
            v13 = *(_DWORD *)(v8 + 36);
            if (result < 1 << *(_BYTE *)(v8 + 32))
              continue;
          }
          goto LABEL_27;
        }
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
      }
    }
LABEL_27:
    __break(1u);
  }
  else
  {
    swift_release();
    v9 = MEMORY[0x24BEE4AF8];
LABEL_20:
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

uint64_t sub_248A3A500(uint64_t a1)
{
  if (a1)
    return sub_248A3A52C();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_248A3A52C()
{
  uint64_t v0;

  swift_retain();
  v0 = sub_248A45114();
  swift_retain();
  sub_248A4509C();
  sub_248A450D8();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_248A3A59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  swift_retain();
  sub_248A453F0();
  v6 = sub_248A453F0();
  v7 = sub_248A3A2C4(v6, v3, a2, a3);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_248A3A608(void (*a1)(uint64_t))
{
  uint64_t v1;

  a1(v1);
  return sub_248A450CC();
}

uint64_t sub_248A3A64C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[16];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = sub_2489C330C(&qword_254463F90);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_2489C330C(&qword_254463FB0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = &v18[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = a1;
  v20 = a2;
  v21 = a3;
  v22 = sub_248A452E8();
  sub_248A44FAC();
  v15 = sub_2489C330C(&qword_254463F88);
  sub_2489BE7E0((uint64_t)v9, 0, 1, v15);
  sub_248A3B02C();
  sub_248A45234();
  v16 = sub_248A45084();
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v14, v10);
  return v16;
}

uint64_t sub_248A3A7B4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;

  v83 = a4;
  v81 = a3;
  v74 = a2;
  v93 = a5;
  v6 = sub_2489C330C(&qword_254463E88);
  v7 = *(_QWORD *)(v6 - 8);
  v91 = v6;
  v92 = v7;
  MEMORY[0x24BDAC7A8](v6, v8);
  v90 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2489C330C(&qword_254463F50);
  v11 = *(_QWORD *)(v10 - 8);
  v94 = v10;
  v95 = v11;
  MEMORY[0x24BDAC7A8](v10, v12);
  v89 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_2489C330C(&qword_254464078);
  v84 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82, v14);
  v78 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2489C330C(&qword_254463F20);
  v17 = *(_QWORD *)(v16 - 8);
  v79 = v16;
  v80 = v17;
  MEMORY[0x24BDAC7A8](v16, v18);
  v73 = (char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2489C330C(&qword_254463F68);
  v21 = *(_QWORD *)(v20 - 8);
  v85 = v20;
  v86 = v21;
  MEMORY[0x24BDAC7A8](v20, v22);
  v77 = (char *)&v66 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = sub_2489C330C(&qword_254463EF0);
  v72 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71, v24);
  v26 = (char *)&v66 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_2489C330C(&qword_254463F80);
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27, v29);
  v31 = (char *)&v66 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_2489C330C(&qword_254463F38);
  v67 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32, v33);
  v35 = (char *)&v66 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_2489C330C(&qword_254463ED8);
  v76 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75, v36);
  v70 = (char *)&v66 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = sub_2489C330C(&qword_254463EA0);
  v39 = *(_QWORD *)(v38 - 8);
  v87 = v38;
  v88 = v39;
  MEMORY[0x24BDAC7A8](v38, v40);
  v96 = (char *)&v66 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = *a1;
  v43 = sub_248A3B3E4((uint64_t)&unk_254463F78);
  v69 = v42;
  sub_248A44DC0();
  swift_getKeyPath();
  sub_248A44D00();
  swift_release();
  v44 = *(void (**)(char *, uint64_t))(v28 + 8);
  v44(v31, v27);
  v68 = v44;
  v97 = v74;
  sub_248A44DB4();
  sub_248A3B3E4((uint64_t)&unk_254463F30);
  sub_248A3B3E4((uint64_t)&unk_254463EE8);
  v45 = v71;
  sub_248A44CF4();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v26, v45);
  (*(void (**)(char *, uint64_t))(v67 + 8))(v35, v32);
  v66 = v43;
  sub_248A44DC0();
  swift_getKeyPath();
  v46 = v73;
  sub_248A44D00();
  swift_release();
  v44(v31, v27);
  v97 = v81;
  v98 = v83;
  sub_2489C330C(&qword_254464278);
  v47 = v78;
  sub_248A44DB4();
  v83 = sub_248A3B3E4((uint64_t)&unk_254463F18);
  sub_248A3B3E4((uint64_t)&qword_254464070);
  sub_248A3B300((uint64_t)&qword_254464288);
  v81 = v48;
  v49 = v77;
  v50 = v79;
  v51 = v82;
  sub_248A44D18();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v47, v51);
  v84 = *(_QWORD *)(v80 + 8);
  ((void (*)(char *, uint64_t))v84)(v46, v50);
  sub_248A3B3E4((uint64_t)&unk_254463ED0);
  sub_248A3B3E4((uint64_t)&unk_254463F60);
  v52 = v70;
  v53 = v75;
  v54 = v85;
  sub_248A44D48();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v49, v54);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v52, v53);
  sub_248A44DC0();
  swift_getKeyPath();
  sub_248A44D00();
  swift_release();
  v68(v31, v27);
  v55 = v90;
  sub_248A44D3C();
  sub_248A3B3E4((uint64_t)&unk_254463E80);
  v56 = v89;
  v57 = v55;
  v58 = v91;
  sub_248A44D18();
  (*(void (**)(char *, uint64_t))(v92 + 8))(v57, v58);
  ((void (*)(char *, uint64_t))v84)(v46, v50);
  v59 = sub_2489C330C(&qword_254463EB0);
  v60 = v93;
  v93[3] = v59;
  sub_248A3B0E0((uint64_t)&unk_254463EA8);
  v60[4] = v61;
  sub_2489BE690(v60);
  sub_248A3B3E4((uint64_t)&unk_254463E98);
  sub_248A3B3E4((uint64_t)&unk_254463F48);
  v62 = v96;
  v63 = v87;
  v64 = v94;
  sub_248A44D48();
  (*(void (**)(char *, uint64_t))(v95 + 8))(v56, v64);
  return (*(uint64_t (**)(char *, uint64_t))(v88 + 8))(v62, v63);
}

uint64_t sub_248A3AFA0(uint64_t a1)
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

uint64_t sub_248A3B020@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_248A3A7B4(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

unint64_t sub_248A3B02C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254463FB8;
  if (!qword_254463FB8)
  {
    v1 = sub_248A452E8();
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDEAB08], v1);
    atomic_store(result, (unint64_t *)&qword_254463FB8);
  }
  return result;
}

uint64_t sub_248A3B06C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_248A452C4();
  *a1 = result;
  return result;
}

uint64_t sub_248A3B094@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_248A452D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_248A3B0BC()
{
  sub_248A3B0E0((uint64_t)&unk_254463E90);
}

void sub_248A3B0E0(uint64_t a1)
{
  unint64_t *v1;
  uint64_t *v2;
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t (*v5)(void);
  uint64_t (*v6)(void);
  uint64_t v7;
  _QWORD v8[2];

  if (!sub_2489C1774(a1))
  {
    v5 = v4;
    v6 = v3;
    v7 = sub_2489C25B8(0, v2);
    v8[0] = v6();
    v8[1] = v5();
    atomic_store(MEMORY[0x2495A2D34](MEMORY[0x24BDCCDB0], v7, v8), v1);
  }
  sub_2489BA428();
}

unint64_t sub_248A3B13C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254463EC8;
  if (!qword_254463EC8)
  {
    v1 = sub_2489BCD7C(&qword_254463ED8);
    v2[0] = sub_248A3B298((uint64_t)&unk_254463F28);
    v2[1] = sub_248A3B1B8();
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD0E8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254463EC8);
  }
  return result;
}

unint64_t sub_248A3B1B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254463EE0;
  if (!qword_254463EE0)
  {
    v1 = sub_2489BCD7C(&qword_254463EF0);
    v2[0] = MEMORY[0x24BEE4038];
    v2[1] = MEMORY[0x24BEE4010];
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD128], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254463EE0);
  }
  return result;
}

unint64_t sub_248A3B21C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254463F58;
  if (!qword_254463F58)
  {
    v1 = sub_2489BCD7C(&qword_254463F68);
    v2[0] = sub_248A3B298((uint64_t)&unk_254463F10);
    v2[1] = sub_2489EFDB8();
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD1F8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254463F58);
  }
  return result;
}

unint64_t sub_248A3B298(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  result = sub_2489C1774(a1);
  if (!result)
  {
    v4 = sub_2489C25B8(0, v3);
    v5 = sub_248A3B3E4((uint64_t)&unk_254463F70);
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD1B8], v4, &v5);
    atomic_store(result, v1);
  }
  return result;
}

void sub_248A3B300(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (!sub_2489C1774(a1))
  {
    v4 = v3;
    v5 = v2;
    v6 = sub_2489BCD7C(&qword_254464278);
    v7 = v5;
    atomic_store(MEMORY[0x2495A2D34](v4, v6, &v7), v1);
  }
  sub_2489BA428();
}

unint64_t sub_248A3B350()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254463F40;
  if (!qword_254463F40)
  {
    v1 = sub_2489BCD7C(&qword_254463F50);
    v2[0] = sub_248A3B298((uint64_t)&unk_254463F10);
    v2[1] = sub_248A3B3E4((uint64_t)&unk_254463E78);
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD1F8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254463F40);
  }
  return result;
}

unint64_t sub_248A3B3E4(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_2489C1774(a1);
  if (!result)
  {
    v5 = v4;
    v6 = sub_2489C25B8(0, v3);
    result = MEMORY[0x2495A2D34](v5, v6);
    atomic_store(result, v1);
  }
  return result;
}

void Mutex<A>.currentValue.getter(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  os_unfair_lock_s *v2;
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 16);
  os_unfair_lock_lock(v2);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, (char *)v2 + *(int *)(a1 + 28), v5);
  os_unfair_lock_unlock(v2);
}

uint64_t Mutex<A>.currentValue.setter(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v9)(char *, uint64_t);

  v5 = *(_QWORD *)(a2 + 16);
  os_unfair_lock_lock(v2);
  v6 = (char *)v2 + *(int *)(a2 + 28);
  v7 = *(_QWORD *)(v5 - 8);
  v9 = *(void (**)(char *, uint64_t))(v7 + 8);
  v9(v6, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v6, a1, v5);
  os_unfair_lock_unlock(v2);
  return ((uint64_t (*)(uint64_t, uint64_t))v9)(a1, v5);
}

void (*Mutex<A>.currentValue.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *v9;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = *(_QWORD *)(a2 + 16);
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v9 = malloc(v8);
  v5[5] = v9;
  Mutex<A>.currentValue.getter(a2, (uint64_t)v9);
  return sub_248A3B584;
}

void sub_248A3B584(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = (void *)(*a1)[4];
  v4 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    v5 = v2[2];
    v6 = v2[3];
    v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    Mutex<A>.currentValue.setter((uint64_t)v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    Mutex<A>.currentValue.setter((*a1)[5], *v2);
  }
  free(v4);
  free(v3);
  free(v2);
}

void sub_248A3B61C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1570]), sel_init);
  sub_248A3B69C(a1, a2, a3, a4);

}

void sub_248A3B69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16[6];
  id v17[2];

  v5 = v4;
  v17[1] = *(id *)MEMORY[0x24BDAC8D0];
  v17[0] = 0;
  v9 = (void *)sub_248A44E2C();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = v17;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = sub_248A3B8E8;
  v11[3] = v10;
  v16[4] = sub_2489CB6E0;
  v16[5] = v11;
  v16[0] = (id)MEMORY[0x24BDAC760];
  v16[1] = (id)1107296256;
  v16[2] = sub_2489B5E44;
  v16[3] = &unk_2519BAA68;
  v12 = _Block_copy(v16);
  swift_retain();
  swift_release();
  v16[0] = 0;
  objc_msgSend(v5, sel_coordinateWritingItemAtURL_options_error_byAccessor_, v9, a2, v16, v12);
  _Block_release(v12);

  v13 = v16[0];
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((a2 & 1) != 0)
    __break(1u);
  if (v13)
    goto LABEL_5;
  if (v17[0])
  {
    v14 = v17[0];
LABEL_5:
    v15 = v13;
    swift_willThrow();

    swift_release();
    return;
  }
  swift_release();
}

uint64_t sub_248A3B884(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_248A3B8DC()
{
  return sub_2489C0C34();
}

uint64_t sub_248A3B8E8(uint64_t a1)
{
  uint64_t v1;

  return sub_248A3B884(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_248A3B8F4()
{
  return sub_2489C0C34();
}

uint64_t sub_248A3B900()
{
  uint64_t result;
  uint64_t v1;

  result = sub_248A41EF4((uint64_t)&unk_2519BA890);
  qword_2577AC3F0 = result;
  *(_QWORD *)algn_2577AC3F8 = v1;
  return result;
}

uint64_t sub_248A3B928(void (*a1)(char *, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  char *v29;
  char *v30;
  void (*v31)(char *, _QWORD);
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53[40];
  uint64_t v54;

  v41 = a5;
  v42 = a8;
  v48 = a1;
  v49 = a2;
  v40 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  sub_2489C0054();
  v50 = v10;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v13);
  v45 = (char *)&v36 - v15;
  MEMORY[0x24BDAC7A8](v14, v16);
  sub_2489C0054();
  v44 = v17;
  v18 = swift_getAssociatedTypeWitness();
  v43 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  v39 = (char *)&v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v22);
  v24 = (char *)&v36 - v23;
  v46 = v8;
  v25 = a6;
  v26 = sub_248A45864();
  if (!v26)
    return sub_248A456D8();
  v27 = v26;
  v37 = v18;
  v54 = sub_248A45B64();
  v47 = sub_248A45B70();
  sub_248A45B28();
  v38 = v24;
  result = sub_248A45858();
  if (v27 < 0)
  {
    __break(1u);
  }
  else
  {
    v51 = v25;
    v29 = v45;
    v30 = v38;
    while (1)
    {
      v31 = (void (*)(char *, _QWORD))sub_248A45888();
      (*(void (**)(char *))(v12 + 16))(v29);
      v31(v53, 0);
      v32 = v52;
      v48(v29, v50);
      if (v32)
        break;
      v52 = 0;
      sub_2489C3D40();
      sub_248A45B58();
      sub_248A45870();
      if (!--v27)
      {
        v33 = v43;
        v34 = v39;
        v35 = v37;
        (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v39, v30, v37);
        sub_248A45A08();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v35);
        return v54;
      }
    }
    sub_2489C3D40();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v30, v37);
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 32))(v42, v50, v41);
  }
  return result;
}

uint64_t OptionSet<>.components.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[16];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v8);
  v10 = &v17[-v9];
  sub_248A4563C();
  v11 = sub_248A29D50(AssociatedTypeWitness, a3);
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v10, AssociatedTypeWitness);
  v22 = v11;
  v18 = a1;
  v19 = a2;
  v20 = a3;
  v21 = a1;
  v12 = sub_248A45708();
  v13 = MEMORY[0x2495A2D34](MEMORY[0x24BEE12E0], v12);
  v15 = sub_248A3B928((void (*)(char *, uint64_t))sub_248A3BE28, (uint64_t)v17, v12, a1, MEMORY[0x24BEE4078], v13, MEMORY[0x24BEE40A8], v14);
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_248A3BD6C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v3);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v7 - v5, a1);
  return sub_248A45DA4();
}

uint64_t sub_248A3BE28(uint64_t a1)
{
  return sub_248A3BD6C(a1);
}

uint64_t sub_248A3BE48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v19;

  sub_2489C330C(&qword_254464970);
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v5, v6);
  sub_248A3EFBC();
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  v12 = sub_2489C03E4();
  v13 = v12;
  if (!v11)
  {
    sub_248A3EEE0(v2, 1);
    goto LABEL_5;
  }
  v14 = *(_QWORD *)(v12 - 8);
  (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 16))(v2, a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80)), v12);
  sub_248A3EEE0(v2, 0);
  if (sub_2489BE834(v2, 1, v13) == 1)
  {
LABEL_5:
    sub_2489C03E4();
    v15 = (uint64_t)v10;
    v16 = 1;
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 32))(v10, v2, v13);
  v15 = (uint64_t)v10;
  v16 = 0;
LABEL_6:
  sub_248A3EEE0(v15, v16);
  sub_2489C03E4();
  v17 = swift_dynamicCast();
  return sub_248A3EEE0(a2, v17 ^ 1u);
}

uint64_t sub_248A3BF88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_248A3F0E0(a1, a2, a3, a4, a5, a6, a7, a8, &qword_254463A90);
}

uint64_t sub_248A3BFC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_248A3F0E0(a1, a2, a3, a4, a5, a6, a7, a8, &qword_254464028);
}

uint64_t sub_248A3BFF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, uint64_t *a10, uint64_t (*a11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  sub_248A3F088();
  sub_2489C330C(a9);
  v16 = sub_2489C330C(a10);
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_248A47480;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v17 + 16))(v19 + v18, v11, v16);
  sub_248A453F0();
  v20 = a11(v14, v13, v12, v19, a5, a6, a7, a8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t static PersistentModel.getOrCreate(in:includePendingChanges:relationshipPaths:sortBy:_:_:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v22[9];

  HIDWORD(v19) = a2;
  sub_248A44C70();
  sub_248A3EF7C();
  sub_2489C0790();
  v14 = sub_248A3EF64();
  sub_248A3EF14(v14, v15);
  sub_248A3F058();
  static PersistentModel.getOrCreate(in:includePendingChanges:relationshipPaths:sortBy:_:_:)(a1, HIDWORD(v19), a3, v9, a5, (uint64_t)sub_248A3ED2C, (uint64_t)v22, a8, a9, v19, a3, a5, v22[0], v22[1], a8, a9, a6, a7, v22[6],
    v22[7],
    v22[8]);
  v17 = v16;
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t static PersistentModel.get(id:in:includePendingChanges:relationshipPaths:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  v29 = a4;
  v28 = a3;
  v30 = a5;
  v27 = sub_248A44FA0();
  MEMORY[0x24BDAC7A8](v27, v9);
  sub_2489C330C(&qword_254464970);
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v10, v11);
  sub_2489BBC7C();
  v14 = v13 - v12;
  v15 = sub_2489C03E4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v17);
  sub_2489BBC7C();
  v20 = v19 - v18;
  sub_248A1D7C4(a1, v14);
  if (sub_2489BE834(v14, 1, v15) == 1)
  {
    sub_2489EE974(v14);
    return 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v20, v14, v15);
  v21 = sub_248A45060();
  if (v21)
  {
    v23 = v21;
    sub_2489C33BC();
  }
  else
  {
    v26 = (uint64_t)&v26;
    MEMORY[0x24BDAC7A8](0, v22);
    *(&v26 - 4) = a5;
    *(&v26 - 3) = a6;
    *(&v26 - 2) = v20;
    sub_248A44FAC();
    default argument 3 of static PersistentModel.get(in:includePendingChanges:relationshipPaths:sortBy:_:)();
    static PersistentModel.get(in:includePendingChanges:relationshipPaths:sortBy:_:)();
    v23 = v25;
    sub_248A3EFCC();
    swift_bridgeObjectRelease();
    sub_2489C33BC();
    if (!v23)
      return 0;
  }
  return v23;
}

void static PersistentModel.fetch(in:fetchLimit:fetchOffset:includePendingChanges:relationshipPaths:sortBy:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
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
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  char *v58;
  uint64_t v59;
  int v60;
  int v61;
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
  char v77;

  sub_2489BED74();
  v63 = v24;
  v64 = v25;
  v60 = v26;
  v61 = v27;
  v59 = v28;
  v57 = v29;
  v56 = v30;
  v65 = v31;
  v55 = a21;
  sub_2489BFBF0();
  sub_248A3F014();
  sub_2489C0600();
  MEMORY[0x24BDAC7A8](v32, v33);
  v35 = (char *)&v54 - v34;
  v62 = sub_248A3EF8C();
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v36, v37);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v38, v39);
  sub_2489C5044();
  MEMORY[0x24BDAC7A8](v40, v41);
  sub_248A3EFBC();
  MEMORY[0x24BDAC7A8](v42, v43);
  sub_248A3EFDC();
  MEMORY[0x24BDAC7A8](v44, v45);
  sub_2489B7224();
  MEMORY[0x24BDAC7A8](v46, v47);
  v58 = (char *)&v54 - v48;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v35, v55, v23);
  sub_248A3EF54((uint64_t)v35);
  sub_248A3F024();
  sub_248A3F0BC();
  v74 = a22;
  v75 = a23;
  v49 = (uint64_t *)sub_2489C618C();
  v76 = v56;
  v77 = v57 & 1;
  KeyPathAccessible.with<A>(_:_:)(v49);
  sub_2489B6B20();
  v72 = a22;
  v73 = a23;
  v50 = (uint64_t *)sub_2489B721C();
  v76 = v59;
  v77 = v60 & 1;
  KeyPathAccessible.with<A>(_:_:)(v50);
  sub_2489B6B20();
  v70 = a22;
  v71 = a23;
  v51 = (uint64_t *)sub_2489C9420();
  LOBYTE(v76) = v61;
  sub_248A3F0D4(v51);
  sub_2489B6B20();
  v68 = a22;
  v69 = a23;
  sub_248A3F030();
  sub_248A3EF34(v63);
  sub_248A3F0EC(v52);
  sub_2489B6B20();
  v66 = a22;
  v67 = a23;
  swift_getKeyPath();
  sub_248A3EF34(v64);
  sub_248A3F0C8(v53);
  sub_2489B6B20();
  sub_248A2996C(v65, v62);
  sub_2489BA808();
}

void static PersistentModel.count(in:includePendingChanges:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
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
  uint64_t *v19;
  uint64_t v20[5];
  char v21;

  sub_2489BED74();
  v20[0] = v0;
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = sub_2489BFBF0();
  sub_248A45924();
  sub_2489C0600();
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)v20 - v12;
  v14 = sub_248A3EF9C();
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v15, v16);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v17, v18);
  sub_248A3EFAC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v13, v6, v9);
  sub_2489BE7E0((uint64_t)v13, 0, 1, v9);
  sub_248A3F038();
  sub_248A3F04C();
  v20[2] = v4;
  v20[3] = v2;
  v19 = (uint64_t *)sub_2489B7214();
  v21 = v8;
  KeyPathAccessible.with<A>(_:_:)(v19);
  sub_2489B6B20();
  sub_248A29934(v20[0], v14);
  sub_2489BA808();
}

uint64_t static PersistentModel.get(in:includePendingChanges:relationshipPaths:sortBy:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_248A3F088();
  v1 = sub_248A44C70();
  sub_248A3F070();
  sub_248A45D74();
  v2 = *(_QWORD *)(v1 - 8);
  sub_2489C0790();
  sub_248A3EF64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v0, v1);
  sub_248A3F07C();
  static PersistentModel.get(in:includePendingChanges:relationshipPaths:sortBy:_:)();
  v5 = v4;
  sub_2489BBC60();
  return v5;
}

void static PersistentModel.identifier(in:includePendingChanges:sortBy:_:)()
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
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
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
  char v44;

  sub_2489BED74();
  v36 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v35 = v8;
  v33 = v9;
  v32 = v10;
  v11 = sub_2489BFBF0();
  sub_248A45924();
  sub_2489C0600();
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v32 - v14;
  v34 = sub_248A45174();
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v16, v17);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v18, v19);
  sub_248A368A0();
  v22 = MEMORY[0x24BDAC7A8](v20, v21);
  MEMORY[0x24BDAC7A8](v22, v23);
  sub_248A3EFAC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v15, v7, v11);
  sub_2489BE7E0((uint64_t)v15, 0, 1, v11);
  sub_248A3D03C();
  sub_248A45168();
  v41 = v5;
  v42 = v3;
  v24 = (uint64_t *)sub_2489B7214();
  v43 = 1;
  v44 = 0;
  KeyPathAccessible.with<A>(_:_:)(v24);
  sub_2489BA87C();
  v39 = v5;
  v40 = v3;
  v25 = (uint64_t *)sub_2489C618C();
  LOBYTE(v43) = v33;
  sub_248A3F0B4(v25);
  sub_2489BA87C();
  v37 = v5;
  v38 = v3;
  v26 = (uint64_t *)sub_2489B721C();
  v27 = sub_248A44C70();
  sub_248A45D74();
  v28 = *(_QWORD *)(v27 - 8);
  sub_2489C0790();
  v29 = sub_248A3EF64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v30, v35, v27);
  sub_248A3F064();
  v43 = v29;
  KeyPathAccessible.with<A>(_:_:)(v26);
  sub_2489BBC60();
  sub_2489BA87C();
  v31 = sub_248A29950(v36, v34);
  if (!v0)
  {
    sub_248A3BE48(v31, v32);
    sub_2489BBC58();
  }
  sub_2489BA808();
}

void static PersistentModel.get(id:in:includePendingChanges:relationshipPaths:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  sub_2489BED74();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  sub_2489C330C(&qword_254464970);
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v12, v13);
  sub_2489BBC7C();
  v16 = v15 - v14;
  if (!static PersistentModel.get(id:in:includePendingChanges:relationshipPaths:)(v11, v9, v7, v5, v3, v1))
  {
    sub_248A45A74();
    swift_bridgeObjectRelease();
    sub_248A1D7C4(v11, v16);
    sub_248A454F8();
    sub_248A4557C();
    swift_bridgeObjectRelease();
    sub_2489C9824();
    sub_2489BF740();
    *v17 = 0xD000000000000026;
    v17[1] = 0x8000000248A50E70;
    swift_willThrow();
  }
  sub_2489BA808();
}

uint64_t PersistentModel.set<A>(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x24BDAC7A8](a1, a2);
  (*(void (**)(char *))(v3 + 16))((char *)&v6 - v4);
  v7 = v2;
  sub_248A3EF6C();
  swift_setAtReferenceWritableKeyPath();
  swift_unknownObjectRelease();
  return sub_248A3EF6C();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PersistentModel.delete()()
{
  _QWORD *v0;

  if (sub_248A45198())
  {
    if ((sub_248A45228() & 1) == 0)
      sub_248A450F0();
    sub_2489BA87C();
  }
  else
  {
    sub_2489C9824();
    sub_2489BF740();
    sub_248A3EF40(v0, 0xD00000000000002DLL);
  }
}

uint64_t PersistentModel.update<A>(keyPath:value:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD v11[2];

  v4 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE35B8] + 8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = (char *)v11 - v6;
  v8 = sub_248A45198();
  swift_release();
  if (v8)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    v11[1] = v2;
    sub_248A3EF6C();
    swift_setAtReferenceWritableKeyPath();
    swift_unknownObjectRelease();
    sub_248A3EF6C();
  }
  else
  {
    sub_2489C9824();
    sub_2489BF740();
    sub_248A3EF40(v9, 0xD000000000000036);
  }
  return v2;
}

uint64_t static PersistentModel.delete(in:fetchLimit:fetchOffset:includePendingChanges:sortBy:_:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, char a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v12 = a3 & 1;
  v13 = a5 & 1;
  sub_248A44C70();
  sub_248A3EF7C();
  sub_2489C0790();
  v14 = sub_248A3EF64();
  sub_248A3EF14(v14, v15);
  sub_248A3F058();
  static PersistentModel.delete(in:fetchLimit:fetchOffset:includePendingChanges:sortBy:_:)(a1, a2, v12, a4, v13, a6, v10, a8, a9, a10);
  return swift_bridgeObjectRelease();
}

uint64_t static PersistentModel.entityName.getter()
{
  swift_getMetatypeMetadata();
  return sub_248A454F8();
}

uint64_t static PersistentModel.create(in:_:)(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2;

  v2 = a2();
  sub_248A450FC();
  return v2;
}

void static PersistentModel.count(in:includePendingChanges:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
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
  uint64_t v16;
  uint64_t *v17;
  _QWORD v18[5];
  char v19;

  sub_2489BED74();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  sub_2489BFBF0();
  sub_248A3EFEC();
  sub_2489C0600();
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)v18 - v10;
  v12 = sub_248A3EF9C();
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v13, v14);
  sub_248A3EFDC();
  MEMORY[0x24BDAC7A8](v15, v16);
  sub_248A367C8();
  sub_2489C3D50((uint64_t)v11, 1);
  sub_248A3F038();
  sub_248A3F04C();
  v18[2] = v3;
  v18[3] = v1;
  v17 = (uint64_t *)sub_2489B7214();
  v19 = v5;
  sub_248A3F0EC(v17);
  swift_release();
  sub_248A29934(v7, v12);
  sub_2489BA808();
}

uint64_t sub_248A3D03C()
{
  sub_248A44C70();
  return sub_248A456D8();
}

uint64_t sub_248A3D060@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  sub_248A3EF2C();
  result = sub_248A45150();
  *a1 = result & 1;
  return result;
}

uint64_t sub_248A3D098()
{
  sub_248A3EF2C();
  return sub_248A4515C();
}

#error "248A3D148: call analysis failed (funcsize=68)"

void static PersistentModel.all(in:includePendingChanges:relationshipPaths:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  sub_2489BED74();
  v24 = v0;
  v2 = v1;
  v4 = v3;
  v23 = v5;
  v7 = v6;
  v8 = sub_2489BFBF0();
  sub_248A3F070();
  sub_248A45924();
  sub_2489C0600();
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v22 - v11;
  v13 = sub_248A3EF8C();
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v14, v15);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v16, v17);
  sub_248A3EFDC();
  MEMORY[0x24BDAC7A8](v18, v19);
  sub_248A3EFAC();
  sub_2489BE7E0((uint64_t)v12, 1, 1, v8);
  sub_248A3F024();
  sub_248A3F0BC();
  v27 = v4;
  v28 = v2;
  v20 = (uint64_t *)sub_2489B7214();
  LOBYTE(v29) = v7;
  KeyPathAccessible.with<A>(_:_:)(v20);
  sub_2489B6B20();
  v25 = v4;
  v26 = v2;
  v21 = (uint64_t *)sub_2489C618C();
  v29 = v23;
  sub_248A3F0EC(v21);
  sub_2489B6B20();
  sub_248A2996C(v24, v13);
  sub_2489BA808();
}

void sub_248A3D328()
{
  sub_248A3D3DC();
}

void sub_248A3D334()
{
  sub_248A3D40C();
}

void sub_248A3D340()
{
  sub_248A3D364();
}

void sub_248A3D34C()
{
  sub_248A3D39C();
}

void sub_248A3D358()
{
  sub_248A3D364();
}

void sub_248A3D364()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = sub_248A3EEF8();
  *(_QWORD *)v1 = v0(v2);
  *(_BYTE *)(v1 + 8) = v3 & 1;
  sub_2489B6AF4();
}

void sub_248A3D390()
{
  sub_248A3D39C();
}

void sub_248A3D39C()
{
  void (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_248A3EFFC();
  v3 = *(unsigned __int8 *)(v2 + 8);
  v4 = sub_248A3EF2C();
  v0(v1, v3, v4);
  sub_2489B6AF4();
}

void sub_248A3D3D0()
{
  sub_248A3D3DC();
}

void sub_248A3D3DC()
{
  uint64_t (*v0)(uint64_t);
  _QWORD *v1;
  uint64_t v2;

  v2 = sub_248A3EEF8();
  *v1 = v0(v2);
  sub_2489B6AF4();
}

void sub_248A3D400()
{
  sub_248A3D40C();
}

void sub_248A3D40C()
{
  void (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  sub_248A3EFFC();
  v1 = sub_248A3EF2C();
  v2 = sub_248A453F0();
  v0(v2, v1);
  sub_2489B6AF4();
}

uint64_t sub_248A3D440@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[6];

  v26[0] = a3;
  v26[1] = a1;
  v29 = a4;
  v27 = sub_2489C330C(&qword_254464400);
  v30 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27, v5);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_248A44DA8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)v26 - v11;
  sub_248A452AC();
  MEMORY[0x2495A2D34](MEMORY[0x24BDCD230], v8);
  v13 = sub_248A44D9C();
  v28 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)v26 - v15;
  sub_248A44DC0();
  v31 = a2;
  v32 = v26[0];
  swift_getKeyPath();
  sub_248A44D00();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  sub_248A44DB4();
  v17 = MEMORY[0x2495A2D34](MEMORY[0x24BDCD1C0], v13);
  v18 = sub_248A3EE9C();
  v19 = sub_2489C962C(&qword_254464410, (uint64_t (*)(uint64_t))MEMORY[0x24BDEAAB0], MEMORY[0x24BDEAAD8]);
  v20 = v27;
  v34[1] = v13;
  v34[2] = v27;
  v34[3] = v17;
  v34[4] = v18;
  v34[5] = v19;
  v21 = sub_248A44D78();
  v22 = v29;
  v29[3] = v21;
  v34[0] = MEMORY[0x2495A2D34](MEMORY[0x24BDCD228], v8);
  v23 = MEMORY[0x2495A2D34](MEMORY[0x24BDCD1B8], v13, v34);
  v24 = sub_248A3609C();
  v33[0] = v23;
  v33[1] = v24;
  v22[4] = MEMORY[0x2495A2D34](MEMORY[0x24BDCD0E8], v21, v33);
  sub_2489BE690(v22);
  sub_248A44CF4();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v20);
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v16, v13);
}

void static PersistentModel.get(in:includePendingChanges:relationshipPaths:sortBy:_:)()
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
  int v10;
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
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
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
  char v45;
  uint64_t v46;

  sub_2489BED74();
  v35 = v2;
  v4 = v3;
  v6 = v5;
  v30 = v7;
  v33 = v8;
  v34 = v9;
  v31 = v10;
  sub_2489BFBF0();
  sub_248A3F014();
  sub_2489C0600();
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v29 - v13;
  sub_248A3F070();
  v32 = sub_248A45174();
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v15, v16);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v17, v18);
  sub_2489B7224();
  MEMORY[0x24BDAC7A8](v19, v20);
  sub_248A368A0();
  MEMORY[0x24BDAC7A8](v21, v22);
  sub_248A3EFBC();
  MEMORY[0x24BDAC7A8](v23, v24);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v14, v30, v1);
  sub_248A3EF54((uint64_t)v14);
  sub_248A3D03C();
  sub_248A45168();
  v42 = v6;
  v43 = v4;
  v25 = (uint64_t *)sub_2489C618C();
  v44 = 1;
  v45 = 0;
  KeyPathAccessible.with<A>(_:_:)(v25);
  swift_release();
  v40 = v6;
  v41 = v4;
  v26 = (uint64_t *)sub_2489B721C();
  LOBYTE(v44) = v31;
  sub_248A3F0C8(v26);
  swift_release();
  v38 = v6;
  v39 = v4;
  sub_2489C9420();
  sub_248A3EF34(v33);
  sub_248A3F0B4(v27);
  swift_release();
  v36 = v6;
  v37 = v4;
  sub_248A3F030();
  sub_248A3EF34(v34);
  sub_248A3F0D4(v28);
  swift_release();
  sub_248A2996C(v35, v32);
  if (!v0)
  {
    Array.first<A>(of:)(v6, (uint64_t)&v46);
    swift_bridgeObjectRelease();
  }
  sub_2489BA808();
}

void sub_248A3D90C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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

  sub_2489BED74();
  v35 = v5;
  sub_2489BEE3C(v6, v7, v8, v9);
  sub_2489C330C(&qword_254464588);
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v10, v11);
  sub_2489BA474();
  sub_2489C330C(&qword_254463C00);
  sub_2489B6BAC();
  MEMORY[0x24BDAC7A8](v12, v13);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v14, v15);
  sub_2489C5044();
  MEMORY[0x24BDAC7A8](v16, v17);
  sub_2489B7224();
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  sub_2489BBD6C(v20, v21, v22, v23, v24, v25, v26, v27, v35);
  MEMORY[0x24BDAC7A8](v28, v29);
  sub_248A367C8();
  v30 = sub_2489C330C(&qword_254463B58);
  sub_2489C19F0(v30);
  sub_2489C0940();
  type metadata accessor for CoreEventRecord();
  sub_2489C962C(&qword_2544645F8, (uint64_t (*)(uint64_t))type metadata accessor for CoreEventRecord, (uint64_t)&protocol conformance descriptor for CoreEventRecord);
  sub_2489C0C6C();
  sub_2489B7214();
  sub_2489C0258();
  sub_2489BF71C(v2, v0);
  sub_2489BEF0C();
  v31 = sub_2489C618C();
  sub_2489C287C();
  sub_2489BF71C(v4, v2);
  sub_2489BF7F0();
  sub_2489B721C();
  sub_2489C33FC();
  sub_2489C59C0();
  sub_2489BF71C(v36, v4);
  sub_2489BF7F0();
  sub_2489C9420();
  sub_2489C6164();
  sub_2489C287C();
  sub_2489BF71C(v3, v36);
  sub_2489BF7F0();
  sub_2489BF918();
  if (v1)
  {
    sub_2489C5F94();
LABEL_11:
    sub_2489BDA40();
    sub_2489BA808();
    return;
  }
  sub_2489BED2C();
  if (!v32)
  {
    sub_248A3F09C();
    if (v3)
      goto LABEL_5;
LABEL_9:
    sub_2489BBC58();
    sub_248A3EF74();
    sub_2489C7060();
    goto LABEL_10;
  }
  sub_2489BF5DC();
  v34 = sub_2489C9428();
  sub_2489BBC58();
  if (!v34)
    goto LABEL_9;
LABEL_5:
  if ((v31 & 0xC000000000000001) != 0)
    sub_2489BD8C8();
  sub_248A3F0A8();
  if (v33)
  {
    sub_248A3EEEC();
    sub_2489BBC58();
LABEL_10:
    sub_2489BA9C0();
    goto LABEL_11;
  }
  __break(1u);
}

unint64_t sub_248A3DB34(uint64_t *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t result;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  int v48;
  char *v49;
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
  char v63;
  uint64_t v64;

  v64 = a8;
  v46 = a7;
  v47 = a1;
  v50 = a3;
  v51 = a4;
  v48 = a2;
  v9 = sub_2489C330C(&qword_254464588);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2489C330C(&qword_254463C00);
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)&v46 - v21;
  v24 = MEMORY[0x24BDAC7A8](v20, v23);
  v26 = (char *)&v46 - v25;
  v28 = MEMORY[0x24BDAC7A8](v24, v27);
  v30 = (char *)&v46 - v29;
  MEMORY[0x24BDAC7A8](v28, v31);
  v49 = (char *)&v46 - v32;
  v33 = sub_2489C330C(&qword_254463B58);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v12, a5, v33);
  sub_2489BE7E0((uint64_t)v12, 0, 1, v33);
  v34 = type metadata accessor for CoreEventRecord();
  v35 = sub_2489C962C(&qword_2544645F8, (uint64_t (*)(uint64_t))type metadata accessor for CoreEventRecord, (uint64_t)&protocol conformance descriptor for CoreEventRecord);
  sub_248A453F0();
  sub_248A45168();
  v60 = v34;
  v61 = v35;
  swift_getKeyPath();
  v62 = 1;
  v63 = 0;
  swift_setAtWritableKeyPath();
  v52 = v14;
  v36 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v36(v22, v18, v13);
  v37 = v47;
  swift_release();
  v58 = v34;
  v59 = v35;
  swift_getKeyPath();
  LOBYTE(v62) = v48;
  swift_setAtWritableKeyPath();
  v38 = v22;
  v39 = v13;
  v36(v26, v38, v13);
  swift_release();
  v56 = v34;
  v57 = v35;
  swift_getKeyPath();
  v62 = v50;
  sub_248A453F0();
  swift_setAtWritableKeyPath();
  v36(v30, v26, v13);
  swift_release();
  v54 = v34;
  v55 = v35;
  swift_getKeyPath();
  v62 = v51;
  sub_248A453F0();
  swift_setAtWritableKeyPath();
  v40 = v49;
  v36(v49, v30, v39);
  swift_release();
  v41 = v53;
  result = sub_248A450C0();
  if (v41)
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v40, v39);
    swift_bridgeObjectRelease_n();
    return (unint64_t)v37;
  }
  v43 = result;
  v53 = v39;
  v44 = v52;
  if (!(result >> 62))
  {
    if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_10:
    swift_bridgeObjectRelease();
    swift_allocObject();
    sub_248A453F0();
    v37 = CoreEventRecord.init(id:)();
    sub_248A450FC();
    goto LABEL_11;
  }
  sub_248A453F0();
  v45 = sub_248A45C18();
  result = swift_bridgeObjectRelease();
  if (!v45)
    goto LABEL_10;
LABEL_5:
  if ((v43 & 0xC000000000000001) != 0)
  {
    v37 = (uint64_t *)MEMORY[0x2495A2200](0, v43);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v37 = *(uint64_t **)(v43 + 32);
    swift_retain();
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_11:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v40, v53);
    swift_bridgeObjectRelease_n();
    return (unint64_t)v37;
  }
  __break(1u);
  return result;
}

void sub_248A3DF8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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

  sub_2489BED74();
  v35 = v5;
  sub_2489BEE3C(v6, v7, v8, v9);
  sub_2489C330C(&qword_254464598);
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v10, v11);
  sub_2489BA474();
  sub_2489C330C(&qword_254463C10);
  sub_2489B6BAC();
  MEMORY[0x24BDAC7A8](v12, v13);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v14, v15);
  sub_2489C5044();
  MEMORY[0x24BDAC7A8](v16, v17);
  sub_2489B7224();
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  sub_2489BBD6C(v20, v21, v22, v23, v24, v25, v26, v27, v35);
  MEMORY[0x24BDAC7A8](v28, v29);
  sub_248A367C8();
  v30 = sub_2489C330C(&qword_254463B68);
  sub_2489C19F0(v30);
  sub_2489C0940();
  type metadata accessor for CoreParameterRecord();
  sub_2489C962C(&qword_254464678, (uint64_t (*)(uint64_t))type metadata accessor for CoreParameterRecord, (uint64_t)&protocol conformance descriptor for CoreParameterRecord);
  sub_2489C0C6C();
  sub_2489B7214();
  sub_2489C0258();
  sub_2489BF71C(v2, v0);
  sub_2489BEF0C();
  v31 = sub_2489C618C();
  sub_2489C287C();
  sub_2489BF71C(v4, v2);
  sub_2489BF7F0();
  sub_2489B721C();
  sub_2489C33FC();
  sub_2489C59C0();
  sub_2489BF71C(v36, v4);
  sub_2489BF7F0();
  sub_2489C9420();
  sub_2489C6164();
  sub_2489C287C();
  sub_2489BF71C(v3, v36);
  sub_2489BF7F0();
  sub_2489BF918();
  if (v1)
  {
    sub_2489C5F94();
LABEL_11:
    sub_2489BDA40();
    sub_2489BA808();
    return;
  }
  sub_2489BED2C();
  if (!v32)
  {
    sub_248A3F09C();
    if (v3)
      goto LABEL_5;
LABEL_9:
    sub_2489BBC58();
    sub_248A3EF74();
    sub_2489C7060();
    goto LABEL_10;
  }
  sub_2489BF5DC();
  v34 = sub_2489C9428();
  sub_2489BBC58();
  if (!v34)
    goto LABEL_9;
LABEL_5:
  if ((v31 & 0xC000000000000001) != 0)
    sub_2489BD8C8();
  sub_248A3F0A8();
  if (v33)
  {
    sub_248A3EEEC();
    sub_2489BBC58();
LABEL_10:
    sub_2489BA9C0();
    goto LABEL_11;
  }
  __break(1u);
}

void sub_248A3E1B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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

  sub_2489BED74();
  v35 = v5;
  sub_2489BEE3C(v6, v7, v8, v9);
  sub_2489C330C(&qword_254464580);
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v10, v11);
  sub_2489BA474();
  sub_2489C330C(&qword_254464248);
  sub_2489B6BAC();
  MEMORY[0x24BDAC7A8](v12, v13);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v14, v15);
  sub_2489C5044();
  MEMORY[0x24BDAC7A8](v16, v17);
  sub_2489B7224();
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  sub_2489BBD6C(v20, v21, v22, v23, v24, v25, v26, v27, v35);
  MEMORY[0x24BDAC7A8](v28, v29);
  sub_248A367C8();
  v30 = sub_2489C330C(&qword_254464110);
  sub_2489C19F0(v30);
  sub_2489C0940();
  type metadata accessor for CoreRuleRecord();
  sub_2489C962C((unint64_t *)&qword_2544645B8, (uint64_t (*)(uint64_t))type metadata accessor for CoreRuleRecord, (uint64_t)&protocol conformance descriptor for CoreRuleRecord);
  sub_2489C0C6C();
  sub_2489B7214();
  sub_2489C0258();
  sub_2489BF71C(v2, v0);
  sub_2489BEF0C();
  v31 = sub_2489C618C();
  sub_2489C287C();
  sub_2489BF71C(v4, v2);
  sub_2489BF7F0();
  sub_2489B721C();
  sub_2489C33FC();
  sub_2489C59C0();
  sub_2489BF71C(v36, v4);
  sub_2489BF7F0();
  sub_2489C9420();
  sub_2489C6164();
  sub_2489C287C();
  sub_2489BF71C(v3, v36);
  sub_2489BF7F0();
  sub_2489BF918();
  if (v1)
  {
    sub_2489C5F94();
LABEL_11:
    sub_2489BDA40();
    sub_2489BA808();
    return;
  }
  sub_2489BED2C();
  if (!v32)
  {
    sub_248A3F09C();
    if (v3)
      goto LABEL_5;
LABEL_9:
    sub_2489BBC58();
    sub_248A3EF74();
    sub_2489C7060();
    goto LABEL_10;
  }
  sub_2489BF5DC();
  v34 = sub_2489C9428();
  sub_2489BBC58();
  if (!v34)
    goto LABEL_9;
LABEL_5:
  if ((v31 & 0xC000000000000001) != 0)
    sub_2489BD8C8();
  sub_248A3F0A8();
  if (v33)
  {
    sub_248A3EEEC();
    sub_2489BBC58();
LABEL_10:
    sub_2489BA9C0();
    goto LABEL_11;
  }
  __break(1u);
}

unint64_t sub_248A3E3DC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t result;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  char *v50;
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
  char v64;
  uint64_t v65;

  v65 = a8;
  v47 = a7;
  v48 = a1;
  v51 = a3;
  v52 = a4;
  v49 = a2;
  v9 = sub_2489C330C(&qword_2544645A0);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2489C330C(&qword_254464250);
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v16, v19);
  v22 = (char *)&v47 - v21;
  v24 = MEMORY[0x24BDAC7A8](v20, v23);
  v26 = (char *)&v47 - v25;
  v28 = MEMORY[0x24BDAC7A8](v24, v27);
  v30 = (char *)&v47 - v29;
  MEMORY[0x24BDAC7A8](v28, v31);
  v50 = (char *)&v47 - v32;
  v33 = sub_2489C330C(&qword_254464118);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v12, a5, v33);
  sub_2489BE7E0((uint64_t)v12, 0, 1, v33);
  v34 = type metadata accessor for CoreTipRecord();
  v35 = sub_2489C962C((unint64_t *)&qword_2544646D0, (uint64_t (*)(uint64_t))type metadata accessor for CoreTipRecord, (uint64_t)&protocol conformance descriptor for CoreTipRecord);
  sub_248A453F0();
  sub_248A45168();
  v61 = v34;
  v62 = v35;
  swift_getKeyPath();
  v63 = 1;
  v64 = 0;
  swift_setAtWritableKeyPath();
  v53 = v14;
  v36 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v36(v22, v18, v13);
  v37 = v48;
  swift_release();
  v59 = v34;
  v60 = v35;
  swift_getKeyPath();
  LOBYTE(v63) = v49;
  swift_setAtWritableKeyPath();
  v38 = v22;
  v39 = v13;
  v36(v26, v38, v13);
  swift_release();
  v57 = v34;
  v58 = v35;
  swift_getKeyPath();
  v63 = v51;
  sub_248A453F0();
  swift_setAtWritableKeyPath();
  v36(v30, v26, v13);
  swift_release();
  v55 = v34;
  v56 = v35;
  swift_getKeyPath();
  v63 = v52;
  sub_248A453F0();
  swift_setAtWritableKeyPath();
  v40 = v50;
  v36(v50, v30, v39);
  swift_release();
  v41 = v54;
  result = sub_248A450C0();
  if (v41)
  {
    (*(void (**)(char *, uint64_t))(v53 + 8))(v40, v39);
    swift_bridgeObjectRelease_n();
    return v37;
  }
  v43 = result;
  v54 = v39;
  v44 = v53;
  if (!(result >> 62))
  {
    if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_10:
    swift_bridgeObjectRelease();
    swift_allocObject();
    sub_248A453F0();
    CoreTipRecord.init(id:)();
    v37 = v46;
    sub_248A450FC();
    goto LABEL_11;
  }
  sub_248A453F0();
  v45 = sub_248A45C18();
  result = swift_bridgeObjectRelease();
  if (!v45)
    goto LABEL_10;
LABEL_5:
  if ((v43 & 0xC000000000000001) != 0)
  {
    v37 = MEMORY[0x2495A2200](0, v43);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v37 = *(_QWORD *)(v43 + 32);
    swift_retain();
LABEL_8:
    swift_bridgeObjectRelease();
LABEL_11:
    (*(void (**)(char *, uint64_t))(v44 + 8))(v40, v54);
    swift_bridgeObjectRelease_n();
    return v37;
  }
  __break(1u);
  return result;
}

void sub_248A3E834()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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

  sub_2489BED74();
  v35 = v5;
  sub_2489BEE3C(v6, v7, v8, v9);
  sub_2489C330C(&qword_2544645A0);
  sub_2489C14E0();
  MEMORY[0x24BDAC7A8](v10, v11);
  sub_2489BA474();
  sub_2489C330C(&qword_254464250);
  sub_2489B6BAC();
  MEMORY[0x24BDAC7A8](v12, v13);
  sub_2489C3A0C();
  MEMORY[0x24BDAC7A8](v14, v15);
  sub_2489C5044();
  MEMORY[0x24BDAC7A8](v16, v17);
  sub_2489B7224();
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  sub_2489BBD6C(v20, v21, v22, v23, v24, v25, v26, v27, v35);
  MEMORY[0x24BDAC7A8](v28, v29);
  sub_248A367C8();
  v30 = sub_2489C330C(&qword_254464118);
  sub_2489C19F0(v30);
  sub_2489C0940();
  type metadata accessor for CoreTipRecord();
  sub_2489C962C((unint64_t *)&qword_2544646D0, (uint64_t (*)(uint64_t))type metadata accessor for CoreTipRecord, (uint64_t)&protocol conformance descriptor for CoreTipRecord);
  sub_2489C0C6C();
  sub_2489B7214();
  sub_2489C0258();
  sub_2489BF71C(v2, v0);
  sub_2489BEF0C();
  v31 = sub_2489C618C();
  sub_2489C287C();
  sub_2489BF71C(v4, v2);
  sub_2489BF7F0();
  sub_2489B721C();
  sub_2489C33FC();
  sub_2489C59C0();
  sub_2489BF71C(v36, v4);
  sub_2489BF7F0();
  sub_2489C9420();
  sub_2489C6164();
  sub_2489C287C();
  sub_2489BF71C(v3, v36);
  sub_2489BF7F0();
  sub_2489BF918();
  if (v1)
  {
    sub_2489C5F94();
LABEL_11:
    sub_2489BDA40();
    sub_2489BA808();
    return;
  }
  sub_2489BED2C();
  if (!v32)
  {
    sub_248A3F09C();
    if (v3)
      goto LABEL_5;
LABEL_9:
    sub_2489BBC58();
    sub_248A3EF74();
    sub_2489C7060();
    goto LABEL_10;
  }
  sub_2489BF5DC();
  v34 = sub_2489C9428();
  sub_2489BBC58();
  if (!v34)
    goto LABEL_9;
LABEL_5:
  if ((v31 & 0xC000000000000001) != 0)
    sub_2489BD8C8();
  sub_248A3F0A8();
  if (v33)
  {
    sub_248A3EEEC();
    sub_2489BBC58();
LABEL_10:
    sub_2489BA9C0();
    goto LABEL_11;
  }
  __break(1u);
}

void static PersistentModel.getOrCreate(in:includePendingChanges:relationshipPaths:sortBy:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  uint64_t v55;
  int v56;
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
  char v72;

  sub_2489BED74();
  v60 = v23;
  v25 = v24;
  v53 = v27;
  v54 = v26;
  v55 = v28;
  v57 = v29;
  v58 = v30;
  v56 = v31;
  sub_2489BFBF0();
  sub_248A3EFEC();
  sub_2489C0600();
  MEMORY[0x24BDAC7A8](v32, v33);
  v35 = (char *)&v53 - v34;
  sub_248A3F070();
  v61 = sub_248A45174();
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61, v36);
  sub_2489C3A0C();
  v39 = MEMORY[0x24BDAC7A8](v37, v38);
  MEMORY[0x24BDAC7A8](v39, v40);
  sub_248A368A0();
  v43 = MEMORY[0x24BDAC7A8](v41, v42);
  MEMORY[0x24BDAC7A8](v43, v44);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v35, v55, v22);
  sub_2489C3D50((uint64_t)v35, 0);
  sub_248A3F038();
  sub_248A45168();
  v68 = v25;
  v69 = a21;
  v45 = (uint64_t *)sub_2489C618C();
  v71 = 1;
  v72 = 0;
  KeyPathAccessible.with<A>(_:_:)(v45);
  swift_release();
  v66 = v25;
  v67 = a21;
  v46 = (uint64_t *)sub_2489B721C();
  LOBYTE(v71) = v56;
  KeyPathAccessible.with<A>(_:_:)(v46);
  swift_release();
  v64 = v25;
  v65 = a21;
  sub_2489C9420();
  sub_248A3EF34(v58);
  sub_248A3F0B4(v47);
  swift_release();
  v62 = v25;
  v63 = a21;
  sub_248A3F030();
  sub_248A3EF34(v60);
  KeyPathAccessible.with<A>(_:_:)(v48);
  swift_release();
  v49 = sub_248A450C0();
  if (v21)
  {
    sub_248A3F040(*(uint64_t (**)(uint64_t, _QWORD))(v59 + 8));
  }
  else
  {
    v50 = v59;
    v70 = v49;
    v51 = sub_248A3F07C();
    MEMORY[0x2495A2D34](MEMORY[0x24BEE12E0], v51);
    sub_248A4587C();
    v52 = sub_2489BBC60();
    if (!v71)
    {
      v54(v52);
      sub_248A450FC();
    }
    sub_248A3F040(*(uint64_t (**)(uint64_t, _QWORD))(v50 + 8));
  }
  sub_2489BA808();
}

uint64_t sub_248A3ED2C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_248A3ED4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return sub_248A3D440(v1[4], v1[2], v1[3], a1);
}

void sub_248A3ED58()
{
  sub_248A3D364();
}

void sub_248A3ED74()
{
  sub_248A3D39C();
}

void sub_248A3ED98()
{
  sub_248A3D364();
}

void sub_248A3EDB4()
{
  sub_248A3D39C();
}

void sub_248A3EDE8()
{
  sub_248A3D3DC();
}

void sub_248A3EE04()
{
  sub_248A3D40C();
}

void sub_248A3EE28()
{
  sub_248A3D3DC();
}

void sub_248A3EE44()
{
  sub_248A3D40C();
}

void sub_248A3EE68()
{
  PersistentModel.delete()();
}

unint64_t sub_248A3EE9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2544643F8;
  if (!qword_2544643F8)
  {
    v1 = sub_2489BCD7C(&qword_254464400);
    result = MEMORY[0x2495A2D34](MEMORY[0x24BDCD130], v1);
    atomic_store(result, (unint64_t *)&qword_2544643F8);
  }
  return result;
}

uint64_t sub_248A3EEE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2489BE7E0(a1, a2, 1, v2);
}

uint64_t sub_248A3EEEC()
{
  return swift_retain();
}

uint64_t sub_248A3EEF8()
{
  return sub_248A45174();
}

uint64_t sub_248A3EF14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, v2, v3);
}

uint64_t sub_248A3EF2C()
{
  return sub_248A45174();
}

void sub_248A3EF34(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
}

uint64_t sub_248A3EF40@<X0>(_QWORD *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = a2;
  a1[1] = (v2 - 32) | 0x8000000000000000;
  return swift_willThrow();
}

uint64_t sub_248A3EF54(uint64_t a1)
{
  uint64_t v1;

  return sub_2489BE7E0(a1, 0, 1, v1);
}

uint64_t sub_248A3EF64()
{
  return sub_248A456B4();
}

uint64_t sub_248A3EF6C()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_248A3EF74()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t sub_248A3EF7C()
{
  return sub_248A45D74();
}

uint64_t sub_248A3EF8C()
{
  return sub_248A45174();
}

uint64_t sub_248A3EF9C()
{
  return sub_248A45174();
}

uint64_t sub_248A3EFCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 8))(v0, *(_QWORD *)(v2 - 120));
}

uint64_t sub_248A3EFEC()
{
  return sub_248A45924();
}

uint64_t sub_248A3F014()
{
  return sub_248A45924();
}

uint64_t sub_248A3F024()
{
  return sub_248A3D03C();
}

uint64_t sub_248A3F030()
{
  return swift_getKeyPath();
}

uint64_t sub_248A3F038()
{
  return sub_248A3D03C();
}

uint64_t sub_248A3F040@<X0>(uint64_t (*a1)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, *(_QWORD *)(v2 - 184));
}

uint64_t sub_248A3F04C()
{
  return sub_248A45168();
}

uint64_t sub_248A3F058()
{
  return sub_248A45708();
}

uint64_t sub_248A3F064()
{
  return sub_248A45708();
}

uint64_t sub_248A3F070()
{
  return 0;
}

uint64_t sub_248A3F07C()
{
  return sub_248A45708();
}

void sub_248A3F0B4(uint64_t *a1)
{
  KeyPathAccessible.with<A>(_:_:)(a1);
}

uint64_t sub_248A3F0BC()
{
  return sub_248A45168();
}

void sub_248A3F0C8(uint64_t *a1)
{
  KeyPathAccessible.with<A>(_:_:)(a1);
}

void sub_248A3F0D4(uint64_t *a1)
{
  KeyPathAccessible.with<A>(_:_:)(a1);
}

uint64_t sub_248A3F0E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  uint64_t *v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  return sub_248A3BFF8(a1, a2, a3, a4, a5, a6, a7, a8, v9, a9, v10);
}

void sub_248A3F0EC(uint64_t *a1)
{
  KeyPathAccessible.with<A>(_:_:)(a1);
}

BOOL static Platform.System.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Platform.System.name.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_248A3F130 + 4 * byte_248A4E810[*v0]))(5459817, 0xE300000000000000);
}

uint64_t sub_248A3F130()
{
  return 0x534F63616DLL;
}

uint64_t sub_248A3F144()
{
  return 0x6C6174614363616DLL;
}

uint64_t sub_248A3F164()
{
  return 1397716596;
}

uint64_t sub_248A3F174()
{
  return 0x534F6E6F69736976;
}

uint64_t sub_248A3F18C()
{
  return 0x534F6863746177;
}

void Platform.os.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t Platform.isDebugging.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t Platform.isExtension.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t Platform.isInternal.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 3);
}

uint64_t Platform.isSimulator.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 4);
}

TipKitCore::Platform::System __swiftcall Platform.System.init()()
{
  _BYTE *v0;
  TipKitCore::Platform::System result;

  *v0 = 0;
  return result;
}

uint64_t Platform.System.hash(into:)()
{
  return sub_248A45F9C();
}

uint64_t Platform.System.hashValue.getter()
{
  sub_248A45F90();
  sub_248A45F9C();
  return sub_248A45FD8();
}

uint64_t static Platform.current.getter@<X0>(_BYTE *a1@<X8>)
{
  char v2;
  char v3;
  char v4;
  char v5;
  uint64_t result;

  if (qword_2544649A0 != -1)
    result = swift_once();
  v2 = HIBYTE(word_254464998);
  v3 = byte_25446499A;
  v4 = byte_25446499B;
  v5 = byte_25446499C;
  *a1 = word_254464998;
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  a1[4] = v5;
  return result;
}

unint64_t sub_248A3F2C8()
{
  unint64_t result;

  result = qword_2577A5928;
  if (!qword_2577A5928)
  {
    result = MEMORY[0x2495A2D34](&protocol conformance descriptor for Platform.System, &type metadata for Platform.System);
    atomic_store(result, (unint64_t *)&qword_2577A5928);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Platform(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Platform(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 5))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 1);
      v4 = v3 >= 2;
      v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Platform(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 1) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for Platform()
{
  return &type metadata for Platform;
}

uint64_t storeEnumTagSinglePayload for Platform.System(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_248A3F404 + 4 * byte_248A4E81B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_248A3F438 + 4 * byte_248A4E816[v4]))();
}

uint64_t sub_248A3F438(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A3F440(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248A3F448);
  return result;
}

uint64_t sub_248A3F454(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248A3F45CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_248A3F460(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A3F468(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Platform.System()
{
  return &type metadata for Platform.System;
}

uint64_t static PredicateCodableConfiguration.standardConfigurationWithKeyPaths<A>(for:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];
  uint64_t v9;

  v2 = sub_248A45BC4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_248A44DD8();
  v9 = a1;
  sub_248A3F5D0();
  sub_248A45D80();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_248A3F538()
{
  swift_getMetatypeMetadata();
  swift_retain();
  sub_248A45510();
  sub_248A44DE4();
  swift_release();
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_248A3F5C8()
{
  return sub_248A3F538();
}

uint64_t sub_248A3F5D0()
{
  sub_248A45BC4();
  sub_2489C330C(&qword_2577A5930);
  sub_248A3F648();
  return sub_248A459E4();
}

unint64_t sub_248A3F648()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577A5938;
  if (!qword_2577A5938)
  {
    v1 = sub_2489BCD7C(&qword_2577A5930);
    result = MEMORY[0x2495A2D34](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2577A5938);
  }
  return result;
}

ValueMetadata *type metadata accessor for PredicateCoder()
{
  return &type metadata for PredicateCoder;
}

uint64_t sub_248A3F6A4()
{
  return sub_2489B5D40(0, &qword_2544647D0);
}

double sub_248A3F6E0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_2489BE648(a1, (uint64_t)&v14);
  if (v15)
  {
    sub_2489C3288(&v14, v16);
    sub_2489C81EC((uint64_t)v16, (uint64_t)&v14);
    sub_2489C330C(&qword_2544643D8);
    if (!sub_2489BF7AC())
    {
      sub_2489C330C(&qword_2544643C0);
      sub_248A453C0();
    }
    v3 = (void *)objc_opt_self();
    sub_2489C330C(&qword_2544643C0);
    v4 = (void *)sub_248A453B4();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v14 = 0;
    v5 = objc_msgSend(v3, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v4, 1, &v14);

    v6 = (id)v14;
    if (v5)
    {
      v7 = sub_248A44ED4();
      v9 = v8;

      *(_QWORD *)(a2 + 24) = MEMORY[0x24BDCDDE8];
      *(_QWORD *)a2 = v7;
      *(_QWORD *)(a2 + 8) = v9;
      sub_2489BCE44((uint64_t)v16);
      return result;
    }
    v11 = v6;
    v12 = (void *)sub_248A44DCC();

    swift_willThrow();
    if (qword_254464240 != -1)
      swift_once();
    v13 = type metadata accessor for logger();
    sub_2489C401C(v13, (uint64_t)&unk_254464228);
    *(_QWORD *)&v14 = 0;
    *((_QWORD *)&v14 + 1) = 0xE000000000000000;
    sub_248A45A74();
    sub_248A4557C();
    swift_getErrorValue();
    sub_248A45D8C();
    sub_2489BE9AC();
    swift_bridgeObjectRelease();
    sub_2489BCE44((uint64_t)v16);

  }
  else
  {
    sub_2489BE124((uint64_t)&v14);
  }
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

double sub_248A3F974@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  double result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_2489BE648(a1, (uint64_t)&v7);
  if (!v8)
    goto LABEL_7;
  if ((sub_2489BF7AC() & 1) == 0)
    goto LABEL_8;
  sub_2489B5D40(0, &qword_2544642F8);
  v3 = objc_msgSend((id)objc_opt_self(), sel_allowedTopLevelClasses);
  sub_2489C330C(&qword_2544643C8);
  sub_248A4569C();

  sub_248A458DC();
  swift_bridgeObjectRelease();
  if (!v8)
  {
    sub_2489C2510();
LABEL_7:
    sub_2489BE124((uint64_t)&v7);
    goto LABEL_8;
  }
  v4 = sub_2489C330C(&qword_2544643D8);
  if ((sub_2489BF7AC() & 1) != 0)
  {
    *(_QWORD *)(a2 + 24) = v4;
    sub_2489C2510();
    *(_QWORD *)a2 = v6;
    return result;
  }
  sub_2489C2510();
LABEL_8:
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

id sub_248A3FB9C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD *__return_ptr, _OWORD *))
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _OWORD v15[2];
  _QWORD v16[3];
  uint64_t v17;

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_248A459C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v7 = a1;
  }
  a4(v16, v15);

  sub_2489BE124((uint64_t)v15);
  v8 = v17;
  if (!v17)
    return 0;
  v9 = sub_2489BE100(v16, v17);
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v9, v9);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)sub_248A45DB0();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  sub_2489BCE44((uint64_t)v16);
  return v13;
}

uint64_t type metadata accessor for RawDictionaryTransformer()
{
  return objc_opt_self();
}

uint64_t RawRepresentable.init(raw:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t AssociatedTypeWitness;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34[32];

  v33 = a4;
  v7 = sub_248A45924();
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v29 - v9;
  v31 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = sub_248A45924();
  v13 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v17 = (char *)&v29 - v16;
  v18 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v20 = MEMORY[0x24BDAC7A8](v15, v19);
  v22 = (char *)&v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20, v23);
  v25 = (char *)&v29 - v24;
  v32 = a1;
  sub_2489BE648(a1, (uint64_t)v34);
  sub_2489C330C(&qword_254464AF0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_2489C3D50((uint64_t)v17, 0);
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v25, v17, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v22, v25, AssociatedTypeWitness);
    sub_248A45648();
    sub_2489BE124(v32);
    (*(void (**)(char *, uint64_t))(v18 + 8))(v25, AssociatedTypeWitness);
    if (!sub_2489BE834((uint64_t)v10, 1, a2))
    {
      v27 = v33;
      (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(v33, v10, a2);
      v26 = 0;
      return sub_2489BE7E0(v27, v26, 1, a2);
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v30);
    v26 = 1;
  }
  else
  {
    v26 = 1;
    sub_2489C3D50((uint64_t)v17, 1);
    sub_2489BE124(v32);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  }
  v27 = v33;
  return sub_2489BE7E0(v27, v26, 1, a2);
}

uint64_t sub_248A3FF50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[174] = a3;
  v3[173] = a2;
  v3[172] = a1;
  sub_2489BD87C();
  return swift_task_switch();
}

uint64_t sub_248A3FF74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  const void *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 1376);
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 1400) = v2;
  if (!v2)
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  v3 = *(int **)(v0 + 1384);
  v4 = (const void *)(v1 + 32);
  sub_248A453F0();
  sub_2489C6DC4((void *)(v0 + 16), v4);
  *(_QWORD *)(v0 + 1416) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 1408) = 1;
  sub_2489C6DC4((void *)(v0 + 336), (const void *)(v0 + 16));
  sub_248A41A74((_QWORD *)(v0 + 16));
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v3 + *v3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 1424) = v5;
  *v5 = v0;
  v5[1] = sub_248A4006C;
  return v7(v0 + 1296, v0 + 336, v0 + 568);
}

uint64_t sub_248A4006C()
{
  swift_task_dealloc();
  sub_2489BD87C();
  return swift_task_switch();
}

uint64_t sub_248A400BC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64x2_t v9;
  int16x8_t v10;
  uint64_t v11;
  int *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 1304);
  if (v1)
  {
    v17 = *(_QWORD *)(v0 + 1296);
    v18 = *(_OWORD *)(v0 + 1312);
    v19 = *(_OWORD *)(v0 + 1344);
    v20 = *(_QWORD *)(v0 + 1368);
    v2 = *(_QWORD *)(v0 + 1360);
    v3 = *(_QWORD *)(v0 + 1336);
    v4 = *(_QWORD *)(v0 + 1328);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v6 = *(_QWORD *)(v0 + 1416);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_2489C6174();
      v6 = v15;
    }
    v7 = *(_QWORD *)(v6 + 16);
    if (v7 >= *(_QWORD *)(v6 + 24) >> 1)
    {
      sub_2489C6174();
      v6 = v16;
    }
    *(_QWORD *)(v6 + 16) = v7 + 1;
    v8 = v6 + 80 * v7;
    *(_QWORD *)(v8 + 32) = v17;
    *(_QWORD *)(v8 + 40) = v1;
    *(_OWORD *)(v8 + 48) = v18;
    *(_QWORD *)(v8 + 64) = v4;
    *(_BYTE *)(v8 + 72) = v3 & 1;
    *(_BYTE *)(v8 + 73) = BYTE1(v3) & 1;
    *(_OWORD *)(v8 + 80) = v19;
    *(_BYTE *)(v8 + 96) = v2 & 1;
    v9 = (uint64x2_t)vdupq_n_s64(v2);
    v10 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_248A4E910), (int32x4_t)vshlq_u64(v9, (uint64x2_t)xmmword_248A4E900));
    *(int8x8_t *)v10.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v10), (int8x8_t)0x1000100010001);
    *(_DWORD *)(v8 + 97) = vmovn_s16(v10).u32[0];
    *(_QWORD *)(v8 + 104) = v20;
    sub_2489C6DC4((void *)(v0 + 976), (const void *)(v0 + 336));
    sub_248A41BD4((_QWORD *)(v0 + 976));
  }
  else
  {
    sub_2489C6DC4((void *)(v0 + 656), (const void *)(v0 + 336));
    sub_248A41BD4((_QWORD *)(v0 + 656));
    v6 = *(_QWORD *)(v0 + 1416);
  }
  v11 = *(_QWORD *)(v0 + 1408);
  if (v11 == *(_QWORD *)(v0 + 1400))
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
  }
  else
  {
    sub_2489C6DC4((void *)(v0 + 16), (const void *)(*(_QWORD *)(v0 + 1376) + 320 * v11 + 32));
    *(_QWORD *)(v0 + 1416) = v6;
    *(_QWORD *)(v0 + 1408) = v11 + 1;
    v13 = *(int **)(v0 + 1384);
    sub_2489C6DC4((void *)(v0 + 336), (const void *)(v0 + 16));
    sub_248A41A74((_QWORD *)(v0 + 16));
    v21 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v13 + *v13);
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 1424) = v14;
    *v14 = v0;
    v14[1] = sub_248A4006C;
    return v21(v0 + 1296, v0 + 336, v0 + 568);
  }
}

uint64_t Sequence.asyncCompactMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_2489B72A4(a1, a2, a3, a4, a5);
  v8 = sub_248A45924();
  v6[9] = v8;
  v6[10] = *(_QWORD *)(v8 - 8);
  v6[11] = sub_2489C3D5C();
  v6[12] = *(_QWORD *)(a4 - 8);
  v6[13] = swift_task_alloc();
  v6[14] = swift_task_alloc();
  v9 = sub_2489C25D0();
  v6[15] = v9;
  v6[16] = *(_QWORD *)(v9 - 8);
  v6[17] = sub_2489C3D5C();
  sub_2489C6318();
  v6[18] = sub_2489C3D5C();
  v6[19] = *(_QWORD *)(v5 - 8);
  v6[20] = sub_2489C3D5C();
  v10 = sub_2489C25D0();
  v6[21] = v10;
  v6[22] = *(_QWORD *)(v10 - 8);
  v6[23] = sub_2489C3D5C();
  sub_2489BD87C();
  return sub_2489BA850();
}

uint64_t sub_248A403F4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v8)(void);

  v1 = sub_2489BED44();
  sub_2489C1CEC(v1);
  sub_2489C50D4();
  sub_248A41D4C();
  sub_2489BEF1C();
  sub_2489BFF34();
  sub_2489C0288();
  if (v2)
  {
    sub_2489C288C();
    v3 = *(_QWORD *)(v0 + 16);
    sub_2489C33EC();
    sub_2489BBD28();
    sub_2489C08FC();
    sub_2489C0AF0();
    sub_2489C077C();
    sub_2489BD978();
    sub_2489BDA54();
    return sub_2489BA9D8(v3, *(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    sub_2489BFC00(*(_QWORD *)(v0 + 128));
    v4 = (_QWORD *)sub_2489C51CC();
    v5 = sub_2489C59C8(v4);
    return sub_2489BF930(v5, v6, v8);
  }
}

uint64_t sub_248A404E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  sub_2489BD87C();
  return sub_2489BA850();
}

uint64_t sub_248A40544()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v18)(void);

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = sub_2489BE834(v1, 1, v2);
  v5 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  v6 = *(_QWORD *)(v0 + 120);
  if (v3 == 1)
  {
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    (*(void (**)(_QWORD, _QWORD))(v5 + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v7);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 104);
    v9 = *(_QWORD *)(v0 + 112);
    v11 = *(_QWORD *)(v0 + 96);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v9, v1, v2);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v9, v2);
    sub_248A45708();
    sub_248A456FC();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v2);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  }
  sub_248A41D4C();
  sub_2489BEF1C();
  sub_2489BFF34();
  sub_2489C0288();
  if (v12)
  {
    sub_2489C288C();
    v13 = *(_QWORD *)(v0 + 16);
    sub_2489C33EC();
    sub_2489BBD28();
    sub_2489C08FC();
    sub_2489C0AF0();
    sub_2489C077C();
    sub_2489BD978();
    sub_2489BDA54();
    return sub_2489BA9D8(v13, *(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    sub_2489BFC00(*(_QWORD *)(v0 + 128));
    v14 = (_QWORD *)sub_2489C7074();
    v15 = sub_2489C59C8(v14);
    return sub_2489BF930(v15, v16, v18);
  }
}

uint64_t sub_248A406D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 176);
  v1 = *(_QWORD *)(v0 + 184);
  sub_2489BDAE0(*(_QWORD *)(v0 + 128));
  sub_2489C33F4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_2489C33EC();
  sub_2489C08FC();
  sub_2489C0AF0();
  sub_2489C077C();
  sub_2489BD978();
  sub_2489BDA54();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Sequence.removeNil<A>()()
{
  return sub_248A45600();
}

void Sequence.mapEnumerated<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v10 = sub_248A45C0C();
  MEMORY[0x24BDAC7A8](v10, v11);
  sub_248A4560C();
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a1;
  v19 = a2;
  v12 = sub_2489C330C(&qword_254464C00);
  v13 = MEMORY[0x2495A2D34](MEMORY[0x24BEE2FC0], v10);
  sub_248A41234((void (*)(char *, char *))sub_248A419BC, (uint64_t)v14, v10, a4, v12, v13, MEMORY[0x24BEE3F20], (uint64_t)&v20);
  sub_2489C5008();
  sub_2489BA808();
}

void Sequence.largestSubset<A>(by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_248A40910(a1, a2, a3, a4, a5, a6, (uint64_t)sub_248A419E0, MEMORY[0x24BEE0E78]);
}

void Sequence.smallestSubset<A>(by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  sub_248A40910(a1, a2, a3, a4, a5, a6, (uint64_t)sub_248A41D34, MEMORY[0x24BEE0E80]);
}

void sub_248A40910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void (*a8)(uint64_t *__return_ptr, uint64_t, uint64_t *, uint64_t, uint64_t))
{
  uint64_t v8;
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
  void (*v26)(uint64_t *__return_ptr, uint64_t, uint64_t *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v25 = a7;
  v26 = a8;
  MEMORY[0x24BDAC7A8](a1, a2);
  (*(void (**)(char *, uint64_t))(v14 + 16))((char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
  v16 = sub_248A45924();
  v24 = a6;
  v28 = a6;
  MEMORY[0x2495A2D34](MEMORY[0x24BEE4AB0], v16, &v28);
  sub_248A45438();
  if (!v8)
  {
    swift_getAssociatedTypeWitness();
    sub_248A45708();
    v17 = sub_248A291C4();
    v18 = swift_bridgeObjectRelease();
    v27 = v17;
    MEMORY[0x24BDAC7A8](v18, v19);
    *(&v23 - 4) = a3;
    *(&v23 - 3) = a4;
    v20 = v24;
    *(&v23 - 2) = a5;
    *(&v23 - 1) = v20;
    v21 = sub_248A45708();
    v22 = MEMORY[0x2495A2D34](MEMORY[0x24BEE12C8], v21);
    v26(&v29, v25, &v23 - 6, v21, v22);
    swift_bridgeObjectRelease();
  }
  sub_2489BA808();
}

uint64_t Sequence.mapSet<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[9];
  uint64_t v18;

  v7 = a6;
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = a1;
  v17[7] = a2;
  v11 = sub_2489C330C(&qword_254464C00);
  v12 = sub_248A41234((void (*)(char *, char *))sub_248A41A00, (uint64_t)v17, a3, a4, v11, a5, MEMORY[0x24BEE3F20], (uint64_t)&v18);
  if (!v6)
  {
    v18 = v12;
    v13 = sub_248A45708();
    v14 = MEMORY[0x2495A2D34](MEMORY[0x24BEE12C8], v13);
    Sequence.asSet<>()(v13, v14);
    v7 = v15;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t Sequence.forEach(filter:perform:)()
{
  return sub_248A45624();
}

void Sequence.asSet<>()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  int v14;
  uint64_t v15;
  _QWORD v16[2];

  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1, a2);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v5, v8);
  v11 = (char *)v16 - v10;
  MEMORY[0x24BDAC7A8](v9, v12);
  sub_2489B6BC0((uint64_t)v16 - v13, v2);
  v16[0] = a2;
  swift_getAssociatedTypeWitness();
  sub_248A45828();
  v14 = sub_2489C6218();
  v15 = v16[1];
  sub_2489B6BC0((uint64_t)v11, v2);
  if (!v14 || !v15)
  {
    sub_2489B6BC0((uint64_t)v7, (uint64_t)v11);
    sub_248A45834();
  }
  sub_2489C33F4((uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  sub_2489B71E4();
}

void Sequence.asArray<>()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  int v14;
  uint64_t v15;
  _QWORD v16[2];

  v3 = *(_QWORD *)(a1 - 8);
  v4 = MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v4, v7);
  v10 = (char *)v16 - v9;
  MEMORY[0x24BDAC7A8](v8, v11);
  v12 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  sub_2489BEE50((uint64_t)v16 - v13);
  swift_getAssociatedTypeWitness();
  sub_248A45708();
  v14 = sub_2489C6218();
  v15 = v16[1];
  sub_2489BEE50((uint64_t)v10);
  if (!v14 || !v15)
  {
    v12(v6, v10, a1);
    sub_248A45714();
  }
  sub_2489C33F4((uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_2489B71E4();
}

uint64_t Sequence.asyncMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  sub_2489B72A4(a1, a2, a3, a4, a5);
  v6[9] = sub_2489C3D5C();
  v7 = sub_2489C25D0();
  v6[10] = v7;
  v6[11] = *(_QWORD *)(v7 - 8);
  v6[12] = sub_2489C3D5C();
  sub_2489C6318();
  v6[13] = sub_2489C3D5C();
  v6[14] = *(_QWORD *)(v5 - 8);
  v6[15] = sub_2489C3D5C();
  v8 = sub_2489C25D0();
  v6[16] = v8;
  v6[17] = *(_QWORD *)(v8 - 8);
  v6[18] = sub_2489C3D5C();
  sub_2489BD87C();
  return sub_2489BA850();
}

uint64_t sub_248A40F38()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v8)(void);

  v1 = sub_2489BED44();
  sub_2489C1CEC(v1);
  sub_2489C50D4();
  sub_248A41D4C();
  sub_2489BEF1C();
  sub_2489BFF34();
  sub_2489C0288();
  if (v2)
  {
    sub_2489C1A0C();
    v3 = *(_QWORD *)(v0 + 16);
    sub_2489C33EC();
    sub_2489BBD28();
    sub_2489C08FC();
    sub_2489C0AF0();
    sub_2489C077C();
    return sub_2489BF724(v3, *(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    sub_2489BFC00(*(_QWORD *)(v0 + 88));
    v4 = (_QWORD *)sub_2489C7074();
    v5 = sub_2489BA580(v4);
    return sub_2489C0614(v5, v6, v8);
  }
}

uint64_t sub_248A41014()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  sub_2489BD87C();
  return sub_2489BA850();
}

uint64_t sub_248A41078()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v10)(void);

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  sub_248A45708();
  sub_248A456FC();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_248A41D4C();
  sub_2489BEF1C();
  sub_2489BFF34();
  sub_2489C0288();
  if (v4)
  {
    sub_2489C1A0C();
    v5 = *(_QWORD *)(v0 + 16);
    sub_2489C33EC();
    sub_2489BBD28();
    sub_2489C08FC();
    sub_2489C0AF0();
    sub_2489C077C();
    return sub_2489BF724(v5, *(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    sub_2489BFC00(*(_QWORD *)(v0 + 88));
    v6 = (_QWORD *)sub_2489C51CC();
    v7 = sub_2489BA580(v6);
    return sub_2489C0614(v7, v8, v10);
  }
}

uint64_t sub_248A41170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  sub_2489BDAE0(*(_QWORD *)(v0 + 88));
  sub_2489C33F4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_2489C33EC();
  sub_2489C08FC();
  sub_2489C0AF0();
  sub_2489C077C();
  sub_2489BD978();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_248A411EC(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v4;
  uint64_t result;

  result = a2();
  if (!v4 && (result & 1) != 0)
    return a4(a1);
  return result;
}

uint64_t sub_248A41234(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t AssociatedTypeWitness;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  char *v39;
  uint64_t v40;
  int v41;
  char *v42;
  uint64_t v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  void (*v60)(char *, char *);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v46 = a8;
  v47 = a5;
  v9 = v8;
  v60 = a1;
  v61 = a2;
  v45 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1, a2);
  v59 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v13);
  v58 = (char *)v44 - v14;
  v16 = v15;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v62 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v18);
  v50 = (char *)v44 - v19;
  v20 = sub_248A45924();
  v48 = *(_QWORD *)(v20 - 8);
  v49 = v20;
  v22 = MEMORY[0x24BDAC7A8](v20, v21);
  v56 = (char *)v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22, v24);
  v27 = (char *)v44 - v26;
  v29 = MEMORY[0x24BDAC7A8](v25, v28);
  v44[1] = (char *)v44 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = MEMORY[0x24BDAC7A8](v29, v31);
  v55 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v32, v33);
  v54 = (char *)v44 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = a6;
  v63 = swift_getAssociatedTypeWitness();
  v51 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63, v35);
  v57 = (char *)v44 - v36;
  v37 = sub_248A455F4();
  v64 = sub_248A45B64();
  sub_248A45B70();
  sub_248A45B28();
  (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v54, v52, v16);
  v55 = v16;
  result = sub_248A455E8();
  if (v37 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v37)
  {
    swift_getAssociatedConformanceWitness();
    v39 = v57;
    while (1)
    {
      sub_248A45948();
      result = sub_2489BE834((uint64_t)v27, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v60(v27, v59);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v63);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v45 + 32))(v46, v59, v47);
        return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v27, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v27, AssociatedTypeWitness);
      sub_248A45B58();
      if (!--v37)
      {
        v40 = (uint64_t)v56;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v40 = (uint64_t)v56;
  v39 = v57;
LABEL_9:
  sub_248A45948();
  v41 = sub_2489BE834(v40, 1, AssociatedTypeWitness);
  v42 = v50;
  if (v41 == 1)
  {
    v43 = (uint64_t)v56;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v63);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v43, v49);
    return v64;
  }
  else
  {
    v59 = *(char **)(v62 + 32);
    v43 = (uint64_t)v56;
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v59)(v42, v43, AssociatedTypeWitness);
      v60(v42, v58);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v62 + 8))(v42, AssociatedTypeWitness);
      sub_248A45B58();
      sub_248A45948();
      if (sub_2489BE834(v43, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v62 + 8))(v42, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v39, v63);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v45 + 32))(v46, v58, v47);
  }
}

uint64_t Sequence.compactMap<A>(filter:map:)()
{
  return sub_248A45600();
}

uint64_t sub_248A41788@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void (*a3)(uint64_t)@<X3>, uint64_t a4@<X6>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  result = a2();
  if (!v5)
  {
    if ((result & 1) != 0)
    {
      a3(a1);
      v11 = a5;
      v12 = 0;
    }
    else
    {
      v11 = a5;
      v12 = 1;
    }
    return sub_2489BE7E0(v11, v12, 1, a4);
  }
  return result;
}

uint64_t sub_248A41820(char *a1, uint64_t (*a2)(uint64_t, char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v7;
  uint64_t v11;
  uint64_t TupleTypeMetadata2;
  uint64_t result;

  v11 = *(_QWORD *)a1;
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  result = a2(v11, &a1[*(int *)(TupleTypeMetadata2 + 48)]);
  if (v7)
    *a7 = v7;
  return result;
}

uint64_t sub_248A418D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_248A45924();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

BOOL sub_248A41928(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;

  v2 = *a1;
  v3 = *a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = MEMORY[0x2495A1E64](v2, AssociatedTypeWitness);
  return v5 < MEMORY[0x2495A1E64](v3, AssociatedTypeWitness);
}

uint64_t sub_248A419A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_248A418D4(a1, a2);
}

uint64_t sub_248A419BC(char *a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_248A41820(a1, *(uint64_t (**)(uint64_t, char *))(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2);
}

BOOL sub_248A419E0(uint64_t *a1, uint64_t *a2)
{
  return sub_248A41928(a1, a2);
}

uint64_t sub_248A41A00(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v2 + 48))();
  if (v3)
    *a2 = v3;
  return result;
}

uint64_t sub_248A41A30(uint64_t a1)
{
  uint64_t v1;

  return sub_248A411EC(a1, *(uint64_t (**)(void))(v1 + 32), *(_QWORD *)(v1 + 40), *(uint64_t (**)(uint64_t))(v1 + 48));
}

uint64_t sub_248A41A50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_248A41788(a1, *(uint64_t (**)(void))(v2 + 40), *(void (**)(uint64_t))(v2 + 56), *(_QWORD *)(v2 + 24), a2);
}

_QWORD *sub_248A41A74(_QWORD *a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1[14];
  v6 = a1[13];
  v4 = a1[15];
  v3 = a1[16];
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  sub_2489DAE44(v6, v5, v4, v3);
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  sub_248A453F0();
  return a1;
}

_QWORD *sub_248A41BD4(_QWORD *a1)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1[14];
  v6 = a1[13];
  v4 = a1[15];
  v3 = a1[16];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2489DB01C(v6, v5, v4, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

BOOL sub_248A41D34(uint64_t *a1, uint64_t *a2)
{
  return sub_248A419E0(a1, a2);
}

uint64_t sub_248A41D4C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t StandardPredicateExpression<>.join(_:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = a1[3];
  v9 = a1[4];
  v10 = sub_2489BE100(a1, v8);
  return StandardPredicateExpression<>.buildConjunction<A, B>(lhs:rhs:)(v4, (uint64_t)v10, a2, v8, a3, v9, a4);
}

uint64_t StandardPredicateExpression<>.buildConjunction<A, B>(lhs:rhs:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t *a7@<X8>)
{
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
  _QWORD v24[6];

  v13 = *(_QWORD *)(a4 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1, a1);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17);
  (*(void (**)(char *))(v19 + 16))((char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a2, a4);
  v20 = *(_QWORD *)(a5 + 8);
  v21 = *(_QWORD *)(a6 + 8);
  v24[2] = a3;
  v24[3] = a4;
  v24[4] = v20;
  v24[5] = v21;
  v22 = sub_248A44CE8();
  a7[3] = v22;
  v24[0] = a5;
  v24[1] = a6;
  a7[4] = MEMORY[0x2495A2D34](MEMORY[0x24BDCCDB0], v22, v24);
  sub_2489BE690(a7);
  return sub_248A44CDC();
}

uint64_t sub_248A41EF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_248A029D8();
    v3 = 0;
    do
    {
      v4 = *(unsigned __int8 *)(a1 + v3 + 32);
      if (*(char *)(a1 + v3 + 32) >= 0)
        v5 = v4 + 1;
      else
        v5 = ((v4 >> 6) & 0xFFFFC0FF | ((v4 & 0x3F) << 8)) + 33217;
      v13 = (v5 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v5) >> 3)) & 7)));
      v6 = MEMORY[0x2495A1CA8](&v13);
      v8 = v7;
      v9 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_248A029D8();
        v9 = v14;
      }
      v10 = *(_QWORD *)(v9 + 16);
      if (v10 >= *(_QWORD *)(v9 + 24) >> 1)
      {
        sub_248A029D8();
        v9 = v14;
      }
      ++v3;
      *(_QWORD *)(v9 + 16) = v10 + 1;
      v11 = v9 + 16 * v10;
      *(_QWORD *)(v11 + 32) = v6;
      *(_QWORD *)(v11 + 40) = v8;
    }
    while (v2 != v3);
    sub_2489BDA70();
  }
  else
  {
    sub_2489BDA70();
    v9 = MEMORY[0x24BEE4AF8];
  }
  v14 = v9;
  sub_2489C330C(&qword_2577A5978);
  sub_2489C5D3C(&qword_2577A5980, &qword_2577A5978, MEMORY[0x24BEE12C8]);
  return sub_248A455C4();
}

unint64_t sub_248A4209C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;

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
    result = sub_248A45564();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
    {
      v7 = sub_248A455DC();
      sub_2489BDA70();
      return v7;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_248A42168()
{
  unint64_t result;

  result = qword_2577A5960;
  if (!qword_2577A5960)
  {
    result = MEMORY[0x2495A2D34](MEMORY[0x24BEE0D48], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2577A5960);
  }
  return result;
}

unint64_t sub_248A421A4()
{
  unint64_t result;

  result = qword_2577A5968;
  if (!qword_2577A5968)
  {
    result = MEMORY[0x2495A2D34](MEMORY[0x24BEE0D40], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2577A5968);
  }
  return result;
}

uint64_t Task.finish()()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2489F26C0;
  return sub_248A457D4();
}

uint64_t static Task.sleep<>(for:)(double a1)
{
  uint64_t v1;
  uint64_t v2;

  *(double *)(v1 + 16) = a1;
  v2 = sub_248A45B94();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(v2 - 8);
  *(_QWORD *)(v1 + 40) = swift_task_alloc();
  sub_2489BD87C();
  return swift_task_switch();
}

uint64_t sub_248A422C0()
{
  uint64_t v0;
  long double v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = *(double *)(v0 + 16);
  v2 = Double.seconds.getter(v1);
  sub_2489D9080(v2);
  fmod(v1, 1.0);
  sub_248A4602C();
  v3 = sub_2489C0138();
  MEMORY[0x2495A27B8](v3);
  sub_248A45B88();
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2577A5998 + dword_2577A5998);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  *v4 = v0;
  v4[1] = sub_248A42394;
  v5 = sub_2489C0138();
  return v8(v5, v6, 0, 0, 1);
}

uint64_t sub_248A42394()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  v3 = sub_2489C0138();
  v4(v3);
  if (v0)
  {
    sub_2489BD87C();
    return sub_2489C1794();
  }
  else
  {
    swift_task_dealloc();
    return sub_2489BF5F0(*(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_248A4240C()
{
  uint64_t v0;

  swift_task_dealloc();
  return sub_2489BA7F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_248A42438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_248A45B7C();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  sub_2489BD87C();
  return swift_task_switch();
}

uint64_t sub_248A424D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_248A45B94();
  sub_2489C962C(&qword_254463C88, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_248A45F3C();
  sub_2489C962C(&qword_254463C80, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_248A45BA0();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_248A425F0;
  return sub_248A45F48();
}

uint64_t sub_248A425F0()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))(*v1 + 96);
  v3 = *v1;
  *(_QWORD *)(v3 + 112) = v0;
  swift_task_dealloc();
  v4 = sub_2489C0138();
  v2(v4);
  if (v0)
  {
    sub_2489BD87C();
    return sub_2489C1794();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return sub_2489BF5F0(*(uint64_t (**)(void))(v3 + 8));
  }
}

uint64_t sub_248A42674()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return sub_2489BA7F4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t Double.seconds.getter(double a1)
{
  double v1;
  uint64_t result;

  v1 = trunc(a1);
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v1 < 9.22337204e18)
    return (uint64_t)v1;
LABEL_7:
  __break(1u);
  return result;
}

long double Double.milliseconds.getter(long double a1)
{
  return fmod(a1, 1.0) * 1000.0;
}

void static Double.minutes<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2489C02A8();
  MEMORY[0x24BDAC7A8](v0, v1);
  sub_2489C3D6C(v2, v3, v4);
  if (sub_2489C1D08() < 65)
  {
    sub_2489BFC0C();
    sub_2489BFF44();
  }
  else
  {
    sub_248A427A8();
    sub_2489C1A28();
    sub_2489C25E4();
  }
  sub_2489C17A8();
  sub_2489BA828();
}

unint64_t sub_248A427A8()
{
  unint64_t result;

  result = qword_2577A59A0;
  if (!qword_2577A59A0)
  {
    result = MEMORY[0x2495A2D34](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, (unint64_t *)&qword_2577A59A0);
  }
  return result;
}

unint64_t sub_248A427E4()
{
  unint64_t result;

  result = qword_2577A59A8;
  if (!qword_2577A59A8)
  {
    result = MEMORY[0x2495A2D34](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_2577A59A8);
  }
  return result;
}

void static Double.hours<A>(_:)()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  sub_2489C02A8();
  MEMORY[0x24BDAC7A8](v1, v2);
  sub_2489C3D6C(v3, v4, v7);
  if (sub_2489C1D08() < 65)
  {
    sub_2489BFC0C();
    v6 = sub_2489BFF44();
    sub_2489C17A8();
    if ((v0 & 1) != 0)
      v5 = (double)v6;
    else
      v5 = (double)(unint64_t)v6;
  }
  else
  {
    sub_248A427A8();
    sub_2489C1A28();
    sub_2489C25E4();
    sub_2489C17A8();
    v5 = v8;
  }
  sub_2489C0620(v5);
  sub_2489BA828();
}

void static Double.days<A>(_:)()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  sub_2489C02A8();
  MEMORY[0x24BDAC7A8](v1, v2);
  sub_2489C3D6C(v3, v4, v7);
  if (sub_2489C1D08() < 65)
  {
    sub_2489BFC0C();
    v6 = sub_2489BFF44();
    sub_2489C17A8();
    if ((v0 & 1) != 0)
      v5 = (double)v6;
    else
      v5 = (double)(unint64_t)v6;
  }
  else
  {
    sub_248A427A8();
    sub_2489C1A28();
    sub_2489C25E4();
    sub_2489C17A8();
    v5 = v8;
  }
  sub_2489C0620(v5);
  sub_2489BA828();
}

double static Double.unixTimestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  double v5;
  double v6;
  uint64_t v8;

  v0 = sub_248A44F58();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s10TipKitCore0cA0C13viewDidAppear4datey10Foundation4DateV_tFfA__0();
  sub_248A44F28();
  v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return v6;
}

TipKitCore::TipDisplayType_optional __swiftcall TipDisplayType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (TipKitCore::TipDisplayType_optional)rawValue;
}

uint64_t TipDisplayType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t sub_248A429E8()
{
  unint64_t result;

  result = qword_2577A59B0;
  if (!qword_2577A59B0)
  {
    result = MEMORY[0x2495A2D34](&protocol conformance descriptor for TipDisplayType, &type metadata for TipDisplayType);
    atomic_store(result, (unint64_t *)&qword_2577A59B0);
  }
  return result;
}

TipKitCore::TipDisplayType_optional sub_248A42A24(Swift::Int *a1)
{
  return TipDisplayType.init(rawValue:)(*a1);
}

uint64_t sub_248A42A2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = TipDisplayType.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t storeEnumTagSinglePayload for TipDisplayType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_248A42A9C + 4 * byte_248A4E931[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_248A42AD0 + 4 * byte_248A4E92C[v4]))();
}

uint64_t sub_248A42AD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A42AD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248A42AE0);
  return result;
}

uint64_t sub_248A42AEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248A42AF4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_248A42AF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A42B00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TipDisplayType()
{
  return &type metadata for TipDisplayType;
}

TipKitCore::TipUsageState_optional __swiftcall TipUsageState.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 9;
  if ((unint64_t)rawValue < 9)
    v2 = rawValue;
  *v1 = v2;
  return (TipKitCore::TipUsageState_optional)rawValue;
}

uint64_t TipUsageState.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

unint64_t sub_248A42B3C()
{
  unint64_t result;

  result = qword_2577A59B8;
  if (!qword_2577A59B8)
  {
    result = MEMORY[0x2495A2D34](&protocol conformance descriptor for TipUsageState, &type metadata for TipUsageState);
    atomic_store(result, (unint64_t *)&qword_2577A59B8);
  }
  return result;
}

TipKitCore::TipUsageState_optional sub_248A42B78(Swift::Int *a1)
{
  return TipUsageState.init(rawValue:)(*a1);
}

uint64_t sub_248A42B80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = TipUsageState.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t storeEnumTagSinglePayload for TipUsageState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_248A42BF0 + 4 * byte_248A4EA05[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_248A42C24 + 4 * byte_248A4EA00[v4]))();
}

uint64_t sub_248A42C24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A42C2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248A42C34);
  return result;
}

uint64_t sub_248A42C40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248A42C48);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_248A42C4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A42C54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TipUsageState()
{
  return &type metadata for TipUsageState;
}

uint64_t TipsError.description.getter()
{
  uint64_t v0;

  sub_2489C3D90();
  return v0;
}

uint64_t sub_248A42CA4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_2489C48C4();
  sub_2489C17B8(v1);
  v3 = v2;
  result = sub_2489BEE88();
  if ((v3 & 1) == 0)
  {
    sub_2489C48C4();
    v5 = sub_2489C1D18();
    v8 = sub_248A42ED0(v5, v6, v7);
    sub_2489BEE88();
    sub_248A43268(v8);
    objc_msgSend(*(id *)(v0 + 16), sel_synchronize);
    if (qword_254464240 != -1)
      swift_once();
    v9 = type metadata accessor for logger();
    sub_2489C401C(v9, (uint64_t)&unk_254464228);
    sub_248A45A74();
    swift_bridgeObjectRelease();
    sub_248A4557C();
    sub_248A4557C();
    sub_2489BE9AC();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_248A42DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;

  if (qword_254464E70 != -1)
    swift_once();
  swift_beginAccess();
  if (HIBYTE(word_254464F60) == 1)
  {
    v5 = sub_2489C48C4();
    sub_2489C17B8(v5);
    v7 = v6;
    sub_2489BEE88();
    if ((v7 & 1) != 0)
    {
      sub_2489C48C4();
      v8 = sub_2489C1D18();
      v11 = sub_248A42F50(v8, v9, v10);
      sub_2489BEE88();
      sub_248A43268(v11);
      objc_msgSend(*(id *)(v2 + 16), sel_synchronize);
    }
  }
  v12 = sub_2489C48C4();
  sub_2489C7E2C(a1, a2, v12);
  v14 = v13;
  swift_bridgeObjectRelease();
  return v14 & 1;
}

uint64_t sub_248A42ED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v6;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  sub_2489C7E2C(a1, a2, a3);
  if ((v6 & 1) != 0)
  {
    sub_248A453F0();
  }
  else
  {
    v9 = v3;
    sub_248A453F0();
    sub_248A453F0();
    sub_2489BA64C(&v8, a1, a2);
    swift_bridgeObjectRelease();
    return v9;
  }
  return v3;
}

uint64_t sub_248A42F50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;

  sub_2489C7E2C(a1, a2, a3);
  if ((v6 & 1) != 0)
  {
    sub_248A453F0();
    sub_248A43380(a1, a2);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_248A453F0();
  }
  return a3;
}

void sub_248A42FC4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    sub_2489C48C4();
    sub_248A43B50();
    swift_bridgeObjectRelease();
    v2 = (void *)sub_248A45690();
    swift_release();
    v3 = (id)sub_248A454BC();
    objc_msgSend(v1, sel_setObject_forKey_, v2, v3);

  }
}

uint64_t sub_248A4307C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[32];
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  sub_2489BFF58();
  v3 = v11;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_2489C81EC(i, (uint64_t)v10);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2489C28AC();
        v3 = v11;
      }
      v5 = *(_QWORD *)(v3 + 16);
      if (v5 >= *(_QWORD *)(v3 + 24) >> 1)
      {
        sub_2489C28AC();
        v3 = v11;
      }
      *(_QWORD *)(v3 + 16) = v5 + 1;
      v6 = v3 + 16 * v5;
      *(_QWORD *)(v6 + 32) = v8;
      *(_QWORD *)(v6 + 40) = v9;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_248A431AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  sub_2489BFF58();
  if (v2)
  {
    v3 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v3 - 1);
      v4 = *v3;
      v6 = *(_QWORD *)(v10 + 16);
      v7 = *(_QWORD *)(v10 + 24);
      sub_248A453F0();
      if (v6 >= v7 >> 1)
        sub_2489C28AC();
      v3 += 2;
      *(_QWORD *)(v10 + 16) = v6 + 1;
      v8 = v10 + 16 * v6;
      *(_QWORD *)(v8 + 32) = v5;
      *(_QWORD *)(v8 + 40) = v4;
      --v2;
    }
    while (v2);
  }
  return v10;
}

void sub_248A43268(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  swift_bridgeObjectRelease();
  sub_248A42FC4();
}

id sub_248A43288(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_248A454BC();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithStoreIdentifier_type_, v5, a3);

  return v6;
}

uint64_t sub_248A43300()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_248A43324()
{
  sub_248A43300();
  return swift_deallocClassInstance();
}

unint64_t sub_248A43344()
{
  unint64_t result;

  result = qword_254463C78;
  if (!qword_254463C78)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254463C78);
  }
  return result;
}

uint64_t sub_248A43380(uint64_t a1, uint64_t a2)
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
  sub_248A45F90();
  sub_248A453F0();
  sub_248A45540();
  v6 = sub_248A45FD8();
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
  if (!v11 && (sub_248A45DBC() & 1) == 0)
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
    while (!v17 && (sub_248A45DBC() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_248A43E98();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_248A4350C(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_248A4350C(unint64_t result)
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
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  BOOL v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_248A459F0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_248A45F90();
        sub_248A453F0();
        sub_248A45540();
        v10 = sub_248A45FD8();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 >= v9 && v2 >= (uint64_t)v11)
          {
LABEL_15:
            v14 = *(_QWORD *)(v3 + 48);
            v15 = (_OWORD *)(v14 + 16 * v2);
            v16 = (_OWORD *)(v14 + 16 * v6);
            v17 = v2 != v6 || v15 >= v16 + 1;
            v2 = v6;
            if (v17)
            {
              *v15 = *v16;
              v2 = v6;
            }
          }
        }
        else if (v11 >= v9 || v2 >= (uint64_t)v11)
        {
          goto LABEL_15;
        }
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
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t static URL.cachesDirectoryForCurrentUser.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2489CB7AC(a1);
}

Swift::Void __swiftcall URL.removeFile(fileManager:)(NSFileManager fileManager)
{
  sub_248A299EC();
}

Swift::Void __swiftcall URL.removeFolder(fileManager:)(NSFileManager fileManager)
{
  sub_2489B9114();
}

uint64_t sub_248A43720(uint64_t a1, uint64_t a2)
{
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
  unint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  uint64_t v18;
  char v20;
  uint64_t v21;
  _QWORD v23[2];
  char *v24;
  uint64_t v25;

  v4 = sub_248A44C1C();
  v25 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2489C330C(&qword_254463A88);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_248A44C28();
  v13 = v12;
  if (v12)
  {
    v14 = *(_QWORD *)(v12 + 16);
    if (v14)
    {
      v23[1] = v12;
      v24 = v11;
      v15 = v12 + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80));
      v16 = *(_QWORD *)(v25 + 72);
      v17 = *(void (**)(char *, unint64_t, uint64_t))(v25 + 16);
      sub_248A453F0();
      while (1)
      {
        v17(v7, v15, v4);
        if (sub_248A44C04() == a1 && v18 == a2)
          break;
        v20 = sub_248A45DBC();
        sub_2489BBC58();
        if ((v20 & 1) != 0)
          goto LABEL_13;
        (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v4);
        v15 += v16;
        if (!--v14)
        {
          sub_2489BBC58();
          v21 = 1;
          v11 = v24;
          goto LABEL_14;
        }
      }
      sub_2489BBC58();
LABEL_13:
      swift_bridgeObjectRelease();
      v11 = v24;
      (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v24, v7, v4);
      v21 = 0;
    }
    else
    {
      v21 = 1;
    }
LABEL_14:
    sub_2489BE7E0((uint64_t)v11, v21, 1, v4);
    sub_2489BBC58();
    if (sub_2489BE834((uint64_t)v11, 1, v4) == 1)
    {
      sub_248A4393C((uint64_t)v11);
      return 0;
    }
    else
    {
      v13 = sub_248A44C10();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v4);
    }
  }
  return v13;
}

uint64_t sub_248A4393C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2489C330C(&qword_254463A88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_248A4397C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9[3];

  v4 = sub_2489BC23C();
  if (!v4)
    v4 = sub_2489BA59C(MEMORY[0x24BEE4AF8]);
  v9[2] = v4;
  v5 = CoreTipRecord.id.getter();
  sub_2489BA64C(v9, v5, v6);
  swift_bridgeObjectRelease();
  sub_248A43B50();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_248A45690();
  swift_release();
  v8 = (id)sub_248A454BC();
  objc_msgSend(a3, sel_setObject_forKey_, v7, v8);
  swift_release();

}

void sub_248A43A70()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_2489C28B4();
  if (*(_QWORD *)(v0 + 16))
  {
    sub_2489C330C(&qword_254464808);
    v1 = (const void *)sub_2489BFE1C();
    v2 = j__malloc_size(v1);
    sub_2489C17CC(v2 - 32);
    sub_248A442F0(v3, v4, v5, v6);
    sub_2489C2610();
    sub_2489C02D0();
    if (!v7)
      __break(1u);
  }
  sub_2489C3D9C();
}

void sub_248A43AE0()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_2489C28B4();
  if (*(_QWORD *)(v0 + 16))
  {
    sub_2489C330C(&qword_2577A59C8);
    v1 = (const void *)sub_2489BFE1C();
    v2 = j__malloc_size(v1);
    sub_2489C17CC(v2 - 32);
    sub_248A444EC(v3, v4, v5, v6);
    sub_2489C2610();
    sub_2489C02D0();
    if (!v7)
      __break(1u);
  }
  sub_2489C3D9C();
}

void sub_248A43B50()
{
  uint64_t v0;
  const void *v1;
  size_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  sub_2489C28B4();
  if (*(_QWORD *)(v0 + 16))
  {
    sub_2489C330C(&qword_254464808);
    v1 = (const void *)sub_2489BFE1C();
    v2 = j__malloc_size(v1);
    sub_2489C17CC(v2 - 32);
    sub_248A446E4(v3, v4, v5, v6);
    sub_2489C2610();
    sub_2489C02D0();
    if (!v7)
      __break(1u);
  }
  sub_2489C3D9C();
}

uint64_t sub_248A43BC0()
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
  sub_2489C330C(&qword_2577A59C0);
  v3 = sub_248A45A68();
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
      sub_248A45F90();
      sub_248A45540();
      result = sub_248A45FD8();
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
                sub_2489D00AC(0, (unint64_t)(v29 + 63) >> 6, v30);
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

void *sub_248A43E98()
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
  sub_2489C330C(&qword_2577A59C0);
  v2 = *v0;
  v3 = sub_248A45A5C();
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
    result = (void *)sub_248A453F0();
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

uint64_t sub_248A44048()
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
  sub_2489C330C(&qword_2577A59C0);
  v3 = sub_248A45A68();
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
    sub_248A45F90();
    sub_248A453F0();
    sub_248A45540();
    result = sub_248A45FD8();
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

uint64_t sub_248A442F0(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
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
      sub_248A453F0();
      goto LABEL_38;
    }
    v11 += 2;
    result = sub_248A453F0();
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

uint64_t sub_248A444EC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
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
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      sub_248A453F0();
      goto LABEL_38;
    }
    ++v11;
    result = sub_248A453F0();
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

uint64_t sub_248A446E4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
      sub_248A453F0();
      goto LABEL_38;
    }
    v11 += 2;
    result = sub_248A453F0();
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

void sub_248A448E0()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  id v6;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_valueTransformerNames);
  type metadata accessor for NSValueTransformerName(0);
  v2 = sub_248A4569C();

  v3 = (void *)sub_2489BD044();
  v4 = sub_2489BD0AC((uint64_t)v3, v2);
  swift_bridgeObjectRelease();

  if ((v4 & 1) == 0)
  {
    v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    v6 = (id)sub_2489BD044();
    objc_msgSend(v0, sel_setValueTransformer_forName_, v5, v6);

  }
}

uint64_t WeakReference.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t result;
  uint64_t v14;
  _BYTE v15[8];

  v4 = swift_unknownObjectWeakInit();
  if (a1)
  {
    swift_unknownObjectWeakAssign();
    v8 = swift_unknownObjectRelease();
    v12 = sub_2489C3DB8(v8, v9, v10, v11);
    result = (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a2, v15, v12);
  }
  else
  {
    v14 = sub_2489C3DB8(v4, v5, v6, v7);
    result = (*(uint64_t (**)(_BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v15, v14);
    *(_QWORD *)a2 = 0;
  }
  *(_BYTE *)(a2 + 8) = a1 == 0;
  return result;
}

uint64_t type metadata accessor for WeakReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2489BD200(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakReference);
}

uint64_t sub_248A44A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[8];

  v7 = type metadata accessor for WeakReference(0, *(_QWORD *)(a3 + a2 - 8), a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v9 = MEMORY[0x2495A2ED8](v11);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  *a5 = v9;
  return result;
}

void WeakReference.value.getter()
{
  JUMPOUT(0x2495A2ED8);
}

uint64_t sub_248A44B08()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_248A44B18()
{
  return 8;
}

_QWORD *sub_248A44B24(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_248A44B44(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_248A44B64(uint64_t result, int a2, int a3)
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

uint64_t sub_248A44B8C()
{
  return MEMORY[0x24BDCB210]();
}

uint64_t sub_248A44B98()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_248A44BA4()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_248A44BB0()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_248A44BBC()
{
  return MEMORY[0x24BDCB3A8]();
}

uint64_t sub_248A44BC8()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_248A44BD4()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_248A44BE0()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_248A44BEC()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_248A44BF8()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_248A44C04()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_248A44C10()
{
  return MEMORY[0x24BDCB980]();
}

uint64_t sub_248A44C1C()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_248A44C28()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_248A44C34()
{
  return MEMORY[0x24BDCBB30]();
}

uint64_t sub_248A44C40()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_248A44C4C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_248A44C58()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_248A44C64()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_248A44C70()
{
  return MEMORY[0x24BDCBEC0]();
}

uint64_t sub_248A44C7C()
{
  return MEMORY[0x24BDCBF10]();
}

uint64_t sub_248A44C88()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_248A44C94()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_248A44CA0()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_248A44CAC()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_248A44CB8()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_248A44CC4()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_248A44CD0()
{
  return MEMORY[0x24BDCCCB8]();
}

uint64_t sub_248A44CDC()
{
  return MEMORY[0x24BDCCD88]();
}

uint64_t sub_248A44CE8()
{
  return MEMORY[0x24BDCCDA0]();
}

uint64_t sub_248A44CF4()
{
  return MEMORY[0x24BDCCE08]();
}

uint64_t sub_248A44D00()
{
  return MEMORY[0x24BDCCE30]();
}

uint64_t sub_248A44D0C()
{
  return MEMORY[0x24BDCCE38]();
}

uint64_t sub_248A44D18()
{
  return MEMORY[0x24BDCCE40]();
}

uint64_t sub_248A44D24()
{
  return MEMORY[0x24BDCCE90]();
}

uint64_t sub_248A44D30()
{
  return MEMORY[0x24BDCCF00]();
}

uint64_t sub_248A44D3C()
{
  return MEMORY[0x24BDCCF08]();
}

uint64_t sub_248A44D48()
{
  return MEMORY[0x24BDCCF18]();
}

uint64_t sub_248A44D54()
{
  return MEMORY[0x24BDCCF20]();
}

uint64_t sub_248A44D60()
{
  return MEMORY[0x24BDCCF68]();
}

uint64_t sub_248A44D6C()
{
  return MEMORY[0x24BDCD0C0]();
}

uint64_t sub_248A44D78()
{
  return MEMORY[0x24BDCD0D8]();
}

uint64_t sub_248A44D84()
{
  return MEMORY[0x24BDCD120]();
}

uint64_t sub_248A44D90()
{
  return MEMORY[0x24BDCD198]();
}

uint64_t sub_248A44D9C()
{
  return MEMORY[0x24BDCD1A8]();
}

uint64_t sub_248A44DA8()
{
  return MEMORY[0x24BDCD218]();
}

uint64_t sub_248A44DB4()
{
  return MEMORY[0x24BDCD238]();
}

uint64_t sub_248A44DC0()
{
  return MEMORY[0x24BDCD240]();
}

uint64_t sub_248A44DCC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_248A44DD8()
{
  return MEMORY[0x24BDCD5C0]();
}

uint64_t sub_248A44DE4()
{
  return MEMORY[0x24BDCD5C8]();
}

uint64_t sub_248A44DF0()
{
  return MEMORY[0x24BDCD5D0]();
}

uint64_t sub_248A44DFC()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_248A44E08()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_248A44E14()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_248A44E20()
{
  return MEMORY[0x24BDCD850]();
}

uint64_t sub_248A44E2C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_248A44E38()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_248A44E44()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_248A44E50()
{
  return MEMORY[0x24BDCD978]();
}

uint64_t sub_248A44E5C()
{
  return MEMORY[0x24BDCD9A8]();
}

uint64_t sub_248A44E68()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_248A44E74()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_248A44E80()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_248A44E8C()
{
  return MEMORY[0x24BDCDA88]();
}

uint64_t sub_248A44E98()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_248A44EA4()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_248A44EB0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_248A44EBC()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_248A44EC8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_248A44ED4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_248A44EE0()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_248A44EEC()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_248A44EF8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_248A44F04()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_248A44F10()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_248A44F1C()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_248A44F28()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_248A44F34()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t _s10TipKitCore0cA0C13viewDidAppear4datey10Foundation4DateV_tFfA__0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_248A44F4C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_248A44F58()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_248A44F64()
{
  return MEMORY[0x24BDCEC88]();
}

uint64_t sub_248A44F70()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_248A44F7C()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_248A44F88()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_248A44F94()
{
  return MEMORY[0x24BDCF6C8]();
}

uint64_t sub_248A44FA0()
{
  return MEMORY[0x24BDCF6D8]();
}

uint64_t sub_248A44FAC()
{
  return MEMORY[0x24BDCF6E8]();
}

uint64_t sub_248A44FB8()
{
  return MEMORY[0x24BEE5BF0]();
}

uint64_t sub_248A44FC4()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_248A44FD0()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_248A44FDC()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_248A44FE8()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_248A44FF4()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_248A45000()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_248A4500C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_248A45018()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_248A45024()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_248A45030()
{
  return MEMORY[0x24BDEA790]();
}

uint64_t sub_248A4503C()
{
  return MEMORY[0x24BDEA798]();
}

uint64_t sub_248A45048()
{
  return MEMORY[0x24BDEA7A0]();
}

uint64_t sub_248A45054()
{
  return MEMORY[0x24BDEA7A8]();
}

uint64_t sub_248A45060()
{
  return MEMORY[0x24BDEA7D8]();
}

uint64_t sub_248A4506C()
{
  return MEMORY[0x24BDEA7E0]();
}

uint64_t sub_248A45078()
{
  return MEMORY[0x24BDEA7E8]();
}

uint64_t sub_248A45084()
{
  return MEMORY[0x24BDEA800]();
}

uint64_t sub_248A45090()
{
  return MEMORY[0x24BDEA808]();
}

uint64_t sub_248A4509C()
{
  return MEMORY[0x24BDEA810]();
}

uint64_t sub_248A450A8()
{
  return MEMORY[0x24BDEA818]();
}

uint64_t sub_248A450B4()
{
  return MEMORY[0x24BDEA820]();
}

uint64_t sub_248A450C0()
{
  return MEMORY[0x24BDEA828]();
}

uint64_t sub_248A450CC()
{
  return MEMORY[0x24BDEA830]();
}

uint64_t sub_248A450D8()
{
  return MEMORY[0x24BDEA838]();
}

uint64_t sub_248A450E4()
{
  return MEMORY[0x24BDEA840]();
}

uint64_t sub_248A450F0()
{
  return MEMORY[0x24BDEA848]();
}

uint64_t sub_248A450FC()
{
  return MEMORY[0x24BDEA850]();
}

uint64_t sub_248A45108()
{
  return MEMORY[0x24BDEA868]();
}

uint64_t sub_248A45114()
{
  return MEMORY[0x24BDEA880]();
}

uint64_t sub_248A45120()
{
  return MEMORY[0x24BDEA8A8]();
}

uint64_t sub_248A4512C()
{
  return MEMORY[0x24BDEA8C0]();
}

uint64_t sub_248A45138()
{
  return MEMORY[0x24BDEA8D0]();
}

uint64_t sub_248A45144()
{
  return MEMORY[0x24BDEA8F0]();
}

uint64_t sub_248A45150()
{
  return MEMORY[0x24BDEA928]();
}

uint64_t sub_248A4515C()
{
  return MEMORY[0x24BDEA930]();
}

uint64_t sub_248A45168()
{
  return MEMORY[0x24BDEA960]();
}

uint64_t sub_248A45174()
{
  return MEMORY[0x24BDEA968]();
}

uint64_t sub_248A45180()
{
  return MEMORY[0x24BDEA980]();
}

uint64_t sub_248A4518C()
{
  return MEMORY[0x24BDEA988]();
}

uint64_t sub_248A45198()
{
  return MEMORY[0x24BDEA998]();
}

uint64_t sub_248A451A4()
{
  return MEMORY[0x24BDEA9A0]();
}

uint64_t sub_248A451B0()
{
  return MEMORY[0x24BDEA9A8]();
}

uint64_t sub_248A451BC()
{
  return MEMORY[0x24BDEA9B0]();
}

uint64_t sub_248A451C8()
{
  return MEMORY[0x24BDEA9B8]();
}

uint64_t sub_248A451D4()
{
  return MEMORY[0x24BDEA9C0]();
}

uint64_t sub_248A451E0()
{
  return MEMORY[0x24BDEA9C8]();
}

uint64_t sub_248A451EC()
{
  return MEMORY[0x24BDEA9D0]();
}

uint64_t sub_248A451F8()
{
  return MEMORY[0x24BDEA9D8]();
}

uint64_t sub_248A45204()
{
  return MEMORY[0x24BDEA9E0]();
}

uint64_t sub_248A45210()
{
  return MEMORY[0x24BDEA9E8]();
}

uint64_t sub_248A4521C()
{
  return MEMORY[0x24BDEA9F0]();
}

uint64_t sub_248A45228()
{
  return MEMORY[0x24BDEA9F8]();
}

uint64_t sub_248A45234()
{
  return MEMORY[0x24BDEAA08]();
}

uint64_t sub_248A45240()
{
  return MEMORY[0x24BDEAA28]();
}

uint64_t sub_248A4524C()
{
  return MEMORY[0x24BDEAA30]();
}

uint64_t sub_248A45258()
{
  return MEMORY[0x24BDEAA38]();
}

uint64_t sub_248A45264()
{
  return MEMORY[0x24BDEAA48]();
}

uint64_t sub_248A45270()
{
  return MEMORY[0x24BDEAA50]();
}

uint64_t sub_248A4527C()
{
  return MEMORY[0x24BDEAA70]();
}

uint64_t sub_248A45288()
{
  return MEMORY[0x24BDEAA78]();
}

uint64_t sub_248A45294()
{
  return MEMORY[0x24BDEAA80]();
}

uint64_t sub_248A452A0()
{
  return MEMORY[0x24BDEAAA0]();
}

uint64_t sub_248A452AC()
{
  return MEMORY[0x24BDEAAB0]();
}

uint64_t sub_248A452B8()
{
  return MEMORY[0x24BDEAAE8]();
}

uint64_t sub_248A452C4()
{
  return MEMORY[0x24BDEAAF0]();
}

uint64_t sub_248A452D0()
{
  return MEMORY[0x24BDEAAF8]();
}

uint64_t sub_248A452DC()
{
  return MEMORY[0x24BDEAB00]();
}

uint64_t sub_248A452E8()
{
  return MEMORY[0x24BDEAB10]();
}

uint64_t sub_248A452F4()
{
  return MEMORY[0x24BDEAB60]();
}

uint64_t sub_248A45300()
{
  return MEMORY[0x24BDEAB70]();
}

uint64_t sub_248A4530C()
{
  return MEMORY[0x24BDEAB78]();
}

uint64_t sub_248A45318()
{
  return MEMORY[0x24BDEAB80]();
}

uint64_t sub_248A45324()
{
  return MEMORY[0x24BDEAB88]();
}

uint64_t sub_248A45330()
{
  return MEMORY[0x24BDEAB90]();
}

uint64_t sub_248A4533C()
{
  return MEMORY[0x24BDEABB8]();
}

uint64_t sub_248A45348()
{
  return MEMORY[0x24BDEABC8]();
}

uint64_t sub_248A45354()
{
  return MEMORY[0x24BDEABD8]();
}

uint64_t sub_248A45360()
{
  return MEMORY[0x24BDEABE8]();
}

uint64_t sub_248A4536C()
{
  return MEMORY[0x24BDEABF0]();
}

uint64_t sub_248A45378()
{
  return MEMORY[0x24BDEAC08]();
}

uint64_t sub_248A45384()
{
  return MEMORY[0x24BDEAC10]();
}

uint64_t sub_248A45390()
{
  return MEMORY[0x24BDEAC20]();
}

uint64_t sub_248A4539C()
{
  return MEMORY[0x24BDEAC30]();
}

uint64_t sub_248A453A8()
{
  return MEMORY[0x24BEE0240]();
}

uint64_t sub_248A453B4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_248A453C0()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_248A453CC()
{
  return MEMORY[0x24BEE02B8]();
}

uint64_t sub_248A453D8()
{
  return MEMORY[0x24BEE02E0]();
}

uint64_t sub_248A453E4()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_248A453F0()
{
  return MEMORY[0x24BEE0328]();
}

uint64_t sub_248A453FC()
{
  return MEMORY[0x24BEE03B0]();
}

uint64_t sub_248A45408()
{
  return MEMORY[0x24BEE03D0]();
}

uint64_t sub_248A45414()
{
  return MEMORY[0x24BEE03E0]();
}

uint64_t sub_248A45420()
{
  return MEMORY[0x24BEE03E8]();
}

uint64_t sub_248A4542C()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_248A45438()
{
  return MEMORY[0x24BEE0440]();
}

uint64_t sub_248A45444()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_248A45450()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_248A4545C()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_248A45468()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_248A45474()
{
  return MEMORY[0x24BEE0500]();
}

uint64_t sub_248A45480()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_248A4548C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_248A45498()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_248A454A4()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_248A454B0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_248A454BC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_248A454C8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_248A454D4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_248A454E0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_248A454EC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_248A454F8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_248A45504()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_248A45510()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_248A4551C()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_248A45528()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_248A45534()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_248A45540()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_248A4554C()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_248A45558()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_248A45564()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_248A45570()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_248A4557C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_248A45588()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_248A45594()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_248A455A0()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_248A455AC()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_248A455B8()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_248A455C4()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_248A455D0()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_248A455DC()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_248A455E8()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_248A455F4()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_248A45600()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_248A4560C()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_248A45618()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_248A45624()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_248A45630()
{
  return MEMORY[0x24BEE0F40]();
}

uint64_t sub_248A4563C()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_248A45648()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_248A45654()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_248A45660()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_248A4566C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_248A45678()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_248A45684()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_248A45690()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_248A4569C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_248A456A8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_248A456B4()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_248A456C0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_248A456CC()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_248A456D8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_248A456E4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_248A456F0()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_248A456FC()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_248A45708()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_248A45714()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_248A45720()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_248A4572C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_248A45738()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_248A45744()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_248A45750()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_248A4575C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_248A45768()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_248A45774()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_248A45780()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_248A4578C()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_248A45798()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_248A457A4()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_248A457B0()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_248A457BC()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_248A457C8()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_248A457D4()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_248A457E0()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_248A457EC()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_248A457F8()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_248A45804()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_248A45810()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_248A4581C()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_248A45828()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_248A45834()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_248A45840()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_248A4584C()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_248A45858()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_248A45864()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_248A45870()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_248A4587C()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_248A45888()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_248A45894()
{
  return MEMORY[0x24BEE7668]();
}

uint64_t sub_248A458A0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_248A458AC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_248A458B8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_248A458C4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t _s10TipKitCore3logyyAA6loggerV_So03os_D7_type_tanSSyXKtFfA0__0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_248A458DC()
{
  return MEMORY[0x24BDCFFB8]();
}

uint64_t sub_248A458E8()
{
  return MEMORY[0x24BDD0010]();
}

uint64_t sub_248A458F4()
{
  return MEMORY[0x24BDD0028]();
}

uint64_t sub_248A45900()
{
  return MEMORY[0x24BDD0040]();
}

uint64_t sub_248A4590C()
{
  return MEMORY[0x24BDD0058]();
}

uint64_t sub_248A45918()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_248A45924()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_248A45930()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_248A4593C()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_248A45948()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_248A45954()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_248A45960()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_248A4596C()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_248A45978()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_248A45984()
{
  return MEMORY[0x24BEE1FD8]();
}

uint64_t sub_248A45990()
{
  return MEMORY[0x24BEE2028]();
}

uint64_t sub_248A4599C()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_248A459A8()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_248A459B4()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_248A459C0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_248A459CC()
{
  return MEMORY[0x24BEE20B8]();
}

uint64_t sub_248A459D8()
{
  return MEMORY[0x24BEE20E8]();
}

uint64_t sub_248A459E4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_248A459F0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_248A459FC()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_248A45A08()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_248A45A14()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_248A45A20()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_248A45A2C()
{
  return MEMORY[0x24BEE23B0]();
}

uint64_t sub_248A45A38()
{
  return MEMORY[0x24BEE23B8]();
}

uint64_t sub_248A45A44()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_248A45A50()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_248A45A5C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_248A45A68()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_248A45A74()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_248A45A80()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_248A45A8C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_248A45A98()
{
  return MEMORY[0x24BEE26B0]();
}

uint64_t sub_248A45AA4()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_248A45AB0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_248A45ABC()
{
  return MEMORY[0x24BEE2730]();
}

uint64_t sub_248A45AC8()
{
  return MEMORY[0x24BEE2750]();
}

uint64_t sub_248A45AD4()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_248A45AE0()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_248A45AEC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_248A45AF8()
{
  return MEMORY[0x24BEE2868]();
}

uint64_t sub_248A45B04()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_248A45B10()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_248A45B1C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_248A45B28()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_248A45B34()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_248A45B40()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_248A45B4C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_248A45B58()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_248A45B64()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_248A45B70()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_248A45B7C()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_248A45B88()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_248A45B94()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_248A45BA0()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_248A45BAC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_248A45BB8()
{
  return MEMORY[0x24BEE2D18]();
}

uint64_t sub_248A45BC4()
{
  return MEMORY[0x24BEE2E40]();
}

uint64_t sub_248A45BD0()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_248A45BDC()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_248A45BE8()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_248A45BF4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_248A45C00()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_248A45C0C()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_248A45C18()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_248A45C24()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_248A45C30()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_248A45C3C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_248A45C48()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_248A45C54()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_248A45C60()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_248A45C6C()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_248A45C78()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_248A45C84()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_248A45C90()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_248A45C9C()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_248A45CA8()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_248A45CB4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_248A45CC0()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_248A45CCC()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_248A45CD8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_248A45CE4()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_248A45CF0()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_248A45CFC()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_248A45D08()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_248A45D14()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_248A45D20()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_248A45D2C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_248A45D38()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_248A45D44()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_248A45D50()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_248A45D5C()
{
  return MEMORY[0x24BEE7028]();
}

uint64_t sub_248A45D68()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_248A45D74()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_248A45D80()
{
  return MEMORY[0x24BEE3878]();
}

uint64_t sub_248A45D8C()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_248A45D98()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_248A45DA4()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_248A45DB0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_248A45DBC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_248A45DC8()
{
  return MEMORY[0x24BEE3A40]();
}

uint64_t sub_248A45DD4()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_248A45DE0()
{
  return MEMORY[0x24BEE3A60]();
}

uint64_t sub_248A45DEC()
{
  return MEMORY[0x24BEE3A68]();
}

uint64_t sub_248A45DF8()
{
  return MEMORY[0x24BEE3A78]();
}

uint64_t sub_248A45E04()
{
  return MEMORY[0x24BEE3A80]();
}

uint64_t sub_248A45E10()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_248A45E1C()
{
  return MEMORY[0x24BEE3AC8]();
}

uint64_t sub_248A45E28()
{
  return MEMORY[0x24BEE3AE8]();
}

uint64_t sub_248A45E34()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t sub_248A45E40()
{
  return MEMORY[0x24BEE3AF8]();
}

uint64_t sub_248A45E4C()
{
  return MEMORY[0x24BEE3B00]();
}

uint64_t sub_248A45E58()
{
  return MEMORY[0x24BEE3B08]();
}

uint64_t sub_248A45E64()
{
  return MEMORY[0x24BEE3B10]();
}

uint64_t sub_248A45E70()
{
  return MEMORY[0x24BEE3B18]();
}

uint64_t sub_248A45E7C()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_248A45E88()
{
  return MEMORY[0x24BEE3B28]();
}

uint64_t sub_248A45E94()
{
  return MEMORY[0x24BEE3B30]();
}

uint64_t sub_248A45EA0()
{
  return MEMORY[0x24BEE3B38]();
}

uint64_t sub_248A45EAC()
{
  return MEMORY[0x24BEE3B40]();
}

uint64_t sub_248A45EB8()
{
  return MEMORY[0x24BEE3B48]();
}

uint64_t sub_248A45EC4()
{
  return MEMORY[0x24BEE3B50]();
}

uint64_t sub_248A45ED0()
{
  return MEMORY[0x24BEE3B58]();
}

uint64_t sub_248A45EDC()
{
  return MEMORY[0x24BEE3B60]();
}

uint64_t sub_248A45EE8()
{
  return MEMORY[0x24BEE3B68]();
}

uint64_t sub_248A45EF4()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_248A45F00()
{
  return MEMORY[0x24BEE3D80]();
}

uint64_t sub_248A45F0C()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_248A45F18()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_248A45F24()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_248A45F30()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_248A45F3C()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_248A45F48()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_248A45F54()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_248A45F60()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_248A45F6C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_248A45F78()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_248A45F84()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_248A45F90()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_248A45F9C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_248A45FA8()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_248A45FB4()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_248A45FC0()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_248A45FCC()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_248A45FD8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_248A45FE4()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_248A45FF0()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_248A45FFC()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_248A46008()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t _ss8DurationV10TipKitCoreE7secondsSivg_0()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_248A46020()
{
  return MEMORY[0x24BEE4830]();
}

uint64_t sub_248A4602C()
{
  return MEMORY[0x24BEE4838]();
}

uint64_t sub_248A46038()
{
  return MEMORY[0x24BEE4860]();
}

uint64_t sub_248A46044()
{
  return MEMORY[0x24BEE4870]();
}

uint64_t sub_248A46050()
{
  return MEMORY[0x24BEE4880]();
}

uint64_t sub_248A4605C()
{
  return MEMORY[0x24BEE4898]();
}

uint64_t sub_248A46068()
{
  return MEMORY[0x24BEE48A8]();
}

uint64_t sub_248A46074()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_248A46080()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_248A4608C()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t sub_248A46098()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDBBAE0](bundle, key);
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRunLoopCurrentIsMain()
{
  return MEMORY[0x24BDBD0A0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x24BDAE720](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

int pthread_main_np(void)
{
  return MEMORY[0x24BDAF8B0]();
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x24BEE7198]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x24BEE71A0]();
}

uint64_t swift_asyncLet_get()
{
  return MEMORY[0x24BEE71A8]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4F20]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
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

uint64_t swift_task_getMainExecutor()
{
  return MEMORY[0x24BEE7240]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x24BEE7270]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x24BEE4FF0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

