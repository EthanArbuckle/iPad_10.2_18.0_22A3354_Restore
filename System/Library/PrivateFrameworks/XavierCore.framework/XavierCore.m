__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E31BA90]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

BOOL sub_22D8FF3FC(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_22D8FF40C()
{
  return sub_22D906B50();
}

uint64_t sub_22D8FF430(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6465646461 && a2 == 0xE500000000000000;
  if (v2 || (sub_22D906B08() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465766F6D6572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22D906B08();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_22D8FF518()
{
  sub_22D906B44();
  sub_22D906B50();
  return sub_22D906B5C();
}

uint64_t sub_22D8FF55C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6465766F6D6572;
  else
    return 0x6465646461;
}

BOOL sub_22D8FF590(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22D8FF3FC(*a1, *a2);
}

uint64_t sub_22D8FF59C()
{
  return sub_22D8FF518();
}

uint64_t sub_22D8FF5A4()
{
  return sub_22D8FF40C();
}

uint64_t sub_22D8FF5AC()
{
  sub_22D906B44();
  sub_22D8FF40C();
  return sub_22D906B5C();
}

uint64_t sub_22D8FF5E8()
{
  char *v0;

  return sub_22D8FF55C(*v0);
}

uint64_t sub_22D8FF5F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D8FF430(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D8FF614()
{
  return 0;
}

uint64_t sub_22D8FF620@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_22D8FFDEC(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_22D902334, a2);
}

uint64_t sub_22D8FF62C(uint64_t a1)
{
  MEMORY[0x22E31BA9C](&unk_22D9071C8, a1);
  return sub_22D906B80();
}

uint64_t sub_22D8FF660(uint64_t a1)
{
  MEMORY[0x22E31BA9C](&unk_22D9071C8, a1);
  return sub_22D906B8C();
}

uint64_t sub_22D8FF694()
{
  return 1;
}

uint64_t sub_22D8FF69C()
{
  sub_22D906B44();
  sub_22D906B50();
  return sub_22D906B5C();
}

uint64_t sub_22D8FF6DC()
{
  return sub_22D906B50();
}

uint64_t sub_22D8FF700()
{
  sub_22D906B44();
  sub_22D906B50();
  return sub_22D906B5C();
}

void sub_22D8FF74C()
{
  _s4DiffV4TailO10CodingKeysOMa();
}

_QWORD *sub_22D8FF790(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  MEMORY[0x22E31BA9C](&unk_22D9071C8, a1);
  v4 = sub_22D906AC0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - v6;
  v8 = __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_22D906B68();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  }
  else
  {
    *(_QWORD *)(v3 - 160) = v1;
    v9 = sub_22D9069A0();
    *(_BYTE *)(v3 - 65) = 0;
    *(_QWORD *)(v3 - 120) = *(_QWORD *)(v3 - 128);
    MEMORY[0x22E31BA9C](MEMORY[0x24BEE12D0], v9, v3 - 120);
    sub_22D906AB4();
    v8 = *(_QWORD **)(v3 - 112);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v3 - 160));
  }
  return v8;
}

void sub_22D8FF998()
{
  _s4DiffV4TailO10CodingKeysOMa();
}

uint64_t sub_22D8FF9E0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  MEMORY[0x22E31BA9C](&unk_22D9071C8, a1);
  v3 = sub_22D906AE4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v9 - v5;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_22D906B74();
  if ((*(_DWORD *)(v2 - 72) & 1) != 0)
  {
    *(_BYTE *)(v2 - 112) = 1;
    sub_22D906ACC();
  }
  else
  {
    *(_QWORD *)(v2 - 112) = *(_QWORD *)(v2 - 136);
    *(_BYTE *)(v2 - 65) = 0;
    v7 = sub_22D9069A0();
    *(_QWORD *)(v2 - 120) = *(_QWORD *)(v2 - 144);
    MEMORY[0x22E31BA9C](MEMORY[0x24BEE12A0], v7, v2 - 120);
    sub_22D906AD8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

BOOL sub_22D8FFB1C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_22D8FFB2C()
{
  return sub_22D906B50();
}

uint64_t sub_22D8FFB50(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x64657461647075 && a2 == 0xE700000000000000;
  if (v2 || (sub_22D906B08() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1818845556 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22D906B08();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_22D8FFC30()
{
  sub_22D906B44();
  sub_22D906B50();
  return sub_22D906B5C();
}

uint64_t sub_22D8FFC74(char a1)
{
  if ((a1 & 1) != 0)
    return 1818845556;
  else
    return 0x64657461647075;
}

void sub_22D8FFCA4()
{
  sub_22D8FF74C();
}

uint64_t sub_22D8FFCC4(uint64_t result, char a2)
{
  uint64_t v2;
  uint64_t v3;

  if (!v3)
  {
    *(_QWORD *)v2 = result;
    *(_BYTE *)(v2 + 8) = a2 & 1;
  }
  return result;
}

void sub_22D8FFCE0()
{
  sub_22D8FF998();
}

BOOL sub_22D8FFD08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22D8FFB1C(*a1, *a2);
}

uint64_t sub_22D8FFD20()
{
  return sub_22D8FFC30();
}

uint64_t sub_22D8FFD34()
{
  return sub_22D8FFB2C();
}

uint64_t sub_22D8FFD48()
{
  sub_22D906B44();
  sub_22D8FFB2C();
  return sub_22D906B5C();
}

uint64_t sub_22D8FFD90()
{
  char *v0;

  return sub_22D8FFC74(*v0);
}

uint64_t sub_22D8FFDA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D8FFB50(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D8FFDD4()
{
  return 0;
}

uint64_t sub_22D8FFDE0@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_22D8FFDEC(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))sub_22D90233C, a2);
}

uint64_t sub_22D8FFDEC@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5]);
  *a3 = result;
  return result;
}

uint64_t sub_22D8FFE20(uint64_t a1)
{
  MEMORY[0x22E31BA9C](&unk_22D906FF8, a1);
  return sub_22D906B80();
}

uint64_t sub_22D8FFE54(uint64_t a1)
{
  MEMORY[0x22E31BA9C](&unk_22D906FF8, a1);
  return sub_22D906B8C();
}

void Array<A>.Diff.encode(to:)()
{
  _s4DiffV10CodingKeysOMa();
}

uint64_t sub_22D8FFED4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t AssociatedConformanceWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  MEMORY[0x22E31BA9C](&unk_22D906FF8, a1);
  v5 = sub_22D906AE4();
  *(_QWORD *)(v4 - 160) = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = *v1;
  *(_QWORD *)(v4 - 192) = v1[1];
  *(_DWORD *)(v4 - 72) = *((unsigned __int8 *)v1 + 16);
  v7 = v3[3];
  v8 = v3;
  v9 = v2;
  v11 = (char *)&v18 - v10;
  __swift_project_boxed_opaque_existential_1(v8, v7);
  v12 = *(_QWORD *)(v4 - 168);
  sub_22D906B74();
  *(_QWORD *)(v4 - 112) = v6;
  *(_BYTE *)(v4 - 144) = 0;
  swift_getAssociatedTypeWitness();
  v13 = sub_22D9068D4();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v4 - 128) = MEMORY[0x24BEE1770];
  *(_QWORD *)(v4 - 120) = AssociatedConformanceWitness;
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE04C0], v13, v4 - 128);
  v15 = *(_QWORD *)(v4 - 152);
  sub_22D906AD8();
  if (!v15)
  {
    *(_QWORD *)(v4 - 144) = *(_QWORD *)(v4 - 192);
    *(_BYTE *)(v4 - 136) = *(_DWORD *)(v4 - 72);
    *(_BYTE *)(v4 - 65) = 1;
    v16 = *(_QWORD *)(v4 - 176);
    *(_QWORD *)(v4 - 112) = v9;
    *(_QWORD *)(v4 - 104) = v16;
    *(_QWORD *)(v4 - 96) = *(_QWORD *)(v4 - 184);
    *(_QWORD *)(v4 - 88) = v12;
    _s4DiffV4TailOMa();
  }
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v4 - 160) + 8))(v11, v5);
}

void _s4DiffV10CodingKeysOMa()
{
  JUMPOUT(0x22E31BA6CLL);
}

void _s4DiffV4TailOMa()
{
  JUMPOUT(0x22E31BA6CLL);
}

void Array<A>.Diff.init(from:)()
{
  _s4DiffV10CodingKeysOMa();
}

uint64_t sub_22D900140(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedConformanceWitness;
  uint64_t v13;

  MEMORY[0x22E31BA9C](&unk_22D906FF8, a1);
  *(_QWORD *)(v4 - 152) = sub_22D906AC0();
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - v5;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  *(_QWORD *)(v4 - 168) = v6;
  v7 = *(_QWORD *)(v4 - 72);
  sub_22D906B68();
  if (!v7)
  {
    *(_QWORD *)(v4 - 72) = v3;
    v8 = *(_QWORD *)(v4 - 160);
    v9 = *(_QWORD *)(v4 - 176);
    swift_getAssociatedTypeWitness();
    v10 = sub_22D9068D4();
    *(_BYTE *)(v4 - 144) = 0;
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    *(_QWORD *)(v4 - 128) = MEMORY[0x24BEE1798];
    *(_QWORD *)(v4 - 120) = AssociatedConformanceWitness;
    MEMORY[0x22E31BA9C](MEMORY[0x24BEE04E0], v10, v4 - 128);
    sub_22D906AB4();
    *(_QWORD *)(v4 - 112) = v9;
    *(_QWORD *)(v4 - 104) = v1;
    *(_QWORD *)(v4 - 96) = v2;
    *(_QWORD *)(v4 - 88) = v8;
    _s4DiffV4TailOMa();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

void sub_22D9002F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  uint64_t v10;

  *(_BYTE *)(v6 - 112) = 1;
  swift_bridgeObjectRetain();
  MEMORY[0x22E31BA9C](&unk_22D906FA8, a1);
  sub_22D906AB4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  if (v2)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v6 - 72));
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)(v6 - 144);
    v9 = *(_BYTE *)(v6 - 136);
    swift_bridgeObjectRetain();
    sub_22D9003D0(v8, v9);
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v6 - 184);
    *(_QWORD *)v10 = v4;
    *(_QWORD *)(v10 + 8) = v8;
    *(_BYTE *)(v10 + 16) = v9;
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v6 - 72));
    swift_bridgeObjectRelease();
    sub_22D9003DC(v8, v9);
  }
  JUMPOUT(0x22D9002BCLL);
}

uint64_t sub_22D9003D0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_22D9003DC(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_22D9003E8()
{
  Array<A>.Diff.init(from:)();
}

void sub_22D900408()
{
  Array<A>.Diff.encode(to:)();
}

uint64_t Array<A>.diff(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = sub_22D9069A0();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE12C8], v7);
  sub_22D90691C();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = MEMORY[0x24BEE1768];
  v10 = MEMORY[0x24BEE1778];
  sub_22D906898();
  v11 = sub_22D906A9C();
  sub_22D9068D4();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE2FC0], v11);
  sub_22D906934();
  swift_bridgeObjectRelease();
  if ((MEMORY[0x22E31B6C4](a2, v9, AssociatedTypeWitness, v10) & 1) != 0
    && (v12 = MEMORY[0x22E31B778](a2, a3), v12 == MEMORY[0x22E31B778](a1, a3)))
  {
    result = swift_bridgeObjectRelease();
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    *(_BYTE *)(a4 + 16) = 0;
  }
  else
  {
    v14 = MEMORY[0x22E31B778](a2, a3);
    v15 = MEMORY[0x22E31B778](a1, a3);
    if (v15 < v14)
    {
      sub_22D9069B8();
      v16 = sub_22D906A54();
      MEMORY[0x22E31BA9C](MEMORY[0x24BEE2180], v16);
      result = sub_22D9069AC();
    }
    else
    {
      result = v14;
    }
    *(_QWORD *)a4 = a2;
    *(_QWORD *)(a4 + 8) = result;
    *(_BYTE *)(a4 + 16) = v15 >= v14;
  }
  return result;
}

uint64_t sub_22D900674(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t TupleTypeMetadata2;
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
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;

  v47 = a3;
  v44 = a1;
  v45 = a7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = sub_22D906A3C();
  v42 = *(_QWORD *)(v10 - 8);
  v43 = v10;
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v48 = (char *)&v40 - v15;
  v46 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v40 - v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v19 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v20 = *(_QWORD *)(a4 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v40 - v25;
  v27 = *(int *)(v24 + 48);
  v29 = v28 + v27;
  v30 = (char *)a2 + v27;
  v31 = *a2;
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v28 + v27, v30, a4);
  v32 = v29;
  v33 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v26, v32, a4);
  if (v31 >= MEMORY[0x22E31B778](v33, a4))
    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v26, a4);
  v41 = v13;
  sub_22D9069C4();
  v34 = v48;
  (*(void (**)(char *, uint64_t))(v45 + 40))(v23, a4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v34, 1, AssociatedTypeWitness) == 1)
  {
    v35 = *(void (**)(char *, uint64_t))(v20 + 8);
    v35(v23, a4);
    v35(v26, a4);
    return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v48, v43);
  }
  else
  {
    v37 = v46;
    (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v17, v48, AssociatedTypeWitness);
    v38 = v41;
    (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v41, v17, AssociatedTypeWitness);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v38, 0, 1, AssociatedTypeWitness);
    v49 = v31;
    sub_22D9068D4();
    sub_22D9068EC();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v17, AssociatedTypeWitness);
    v39 = *(void (**)(char *, uint64_t))(v20 + 8);
    v39(v23, a4);
    return ((uint64_t (*)(char *, uint64_t))v39)(v26, a4);
  }
}

uint64_t sub_22D9009A8(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;

  return sub_22D900674(a1, a2, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

_QWORD *Array<A>.apply(diff:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  _QWORD v21[6];
  uint64_t v22;

  v12 = *a1;
  v13 = a1[1];
  v20 = *((_BYTE *)a1 + 16);
  v22 = a2;
  v21[0] = v12;
  swift_getAssociatedTypeWitness();
  v14 = sub_22D9068D4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE04D8], v14);
  v15 = v21;
  sub_22D906940();
  swift_bridgeObjectRelease();
  if (v6)
  {
    swift_bridgeObjectRelease();
  }
  else if ((v20 & 1) != 0)
  {
    if (MEMORY[0x22E31B778](a2, a3) < v13)
    {
      v21[0] = a3;
      v21[1] = a4;
      v21[2] = a5;
      v21[3] = a6;
      _s6ErrorsOMa();
    }
    v18 = sub_22D9069A0();
    swift_bridgeObjectRetain();
    MEMORY[0x22E31BA9C](MEMORY[0x24BEE12E0], v18);
    sub_22D906A18();
    v19 = sub_22D906A54();
    MEMORY[0x22E31BA9C](MEMORY[0x24BEE2180], v19);
    v15 = (_QWORD *)sub_22D9069AC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v21[0] = v13;
    v17 = sub_22D9069A0();
    swift_bridgeObjectRetain();
    MEMORY[0x22E31BA9C](MEMORY[0x24BEE12C8], v17);
    sub_22D906988();
    return (_QWORD *)v22;
  }
  return v15;
}

uint64_t sub_22D900D14(int64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  unint64_t v22;
  char isClassOrObjCExistentialType;
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

  v26 = a6;
  v25 = a5;
  v28 = a2;
  v11 = *(_QWORD *)(a4 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v25 - v15;
  v17 = swift_bridgeObjectRetain();
  v18 = MEMORY[0x22E31B778](v17, a4);
  swift_bridgeObjectRelease();
  v33 = a1;
  if (v18 <= a1)
  {
    v29 = a4;
    v30 = v25;
    v31 = v26;
    v32 = a7;
    _s6ErrorsOMa();
  }
  sub_22D9069C4();
  v19 = v27;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a7 + 48))(v28, a4, a7);
  result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, a4);
  if (!v19)
  {
    sub_22D9069A0();
    sub_22D906964();
    v21 = *a3;
    v22 = v33;
    sub_22D9022E4(v33, *a3);
    isClassOrObjCExistentialType = _swift_isClassOrObjCExistentialType();
    v24 = v21 & 0xFFFFFFFFFFFFFF8;
    if ((isClassOrObjCExistentialType & 1) == 0)
      v24 = v21;
    return (*(uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 40))(v24+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v22, v16, a4);
  }
  return result;
}

uint64_t sub_22D900F68(int64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22D900D14(a1, a2, *(uint64_t **)(v2 + 48), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_22D900F88(char *a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, char *);
  uint64_t v4;
  uint64_t TupleTypeMetadata2;

  v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 48);
  v4 = *(_QWORD *)a1;
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(v4, &a1[*(int *)(TupleTypeMetadata2 + 48)]);
}

void _s6ErrorsOMa()
{
  JUMPOUT(0x22E31BA6CLL);
}

void sub_22D901020()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D901030()
{
  JUMPOUT(0x22E31BA9CLL);
}

uint64_t sub_22D901040@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = static Array<A>.zero.getter(*(_QWORD *)(a1 + 16));
  *a2 = result;
  return result;
}

uint64_t sub_22D901068@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;

  return Array<A>.diff(from:)(*a1, *v3, *(_QWORD *)(a2 + 16), a3);
}

_QWORD *sub_22D901084@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t *v4;
  uint64_t v5;
  _QWORD *result;

  result = Array<A>.apply(diff:)(a1, *v4, *(_QWORD *)(a2 + 16), *(_QWORD *)(a3 - 8), *(_QWORD *)(a3 - 16), *(_QWORD *)(a3 - 24));
  if (!v5)
    *a4 = result;
  return result;
}

uint64_t sub_22D9010C0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D9010CC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_22D9003DC(*(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_22D9010FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  sub_22D9003D0(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return a1;
}

uint64_t sub_22D901148(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = v2[1];
  LOBYTE(v2) = *((_BYTE *)v2 + 16);
  sub_22D9003D0(v4, (char)v2);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = (_BYTE)v2;
  sub_22D9003DC(v5, v6);
  return a1;
}

uint64_t sub_22D9011B4(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = v4;
  sub_22D9003DC(v5, v6);
  return a1;
}

uint64_t sub_22D901204(uint64_t *a1, int a2)
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

uint64_t sub_22D90124C(uint64_t result, int a2, int a3)
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

void type metadata accessor for Array<A>.Diff()
{
  JUMPOUT(0x22E31BA6CLL);
}

uint64_t sub_22D901298()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D9012A0()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  v2[4] = &unk_22D906E50;
  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_22D901340(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  if (((v7 + 8) & (unint64_t)~v7) + *(_QWORD *)(v5 + 64) <= 0x10)
    v8 = 16;
  else
    v8 = ((v6 + 8) & ~(unint64_t)v6) + *(_QWORD *)(v5 + 64);
  v9 = v6 & 0x100000;
  if (v7 > 7 || v9 != 0 || v8 + 1 > 0x18)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    v13 = *((unsigned __int8 *)a2 + v8);
    if (v13 >= 2)
    {
      if (v8 <= 3)
        v14 = v8;
      else
        v14 = 4;
      __asm { BR              X14 }
    }
    *a1 = *a2;
    if (v13 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(((unint64_t)a1 + v7 + 8) & ~v7, ((unint64_t)a2 + v7 + 8) & ~v7, AssociatedTypeWitness);
      *((_BYTE *)a1 + v8) = 1;
    }
    else
    {
      a1[1] = a2[1];
      *((_BYTE *)a1 + v8) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

uint64_t sub_22D9014B4(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = ((v4 + 8) & ~v4) + *(_QWORD *)(v3 + 64);
  if (v5 <= 0x10)
    v5 = 16;
  v6 = *(unsigned __int8 *)(a1 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X15 }
  }
  if (v6 == 1)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))((a1 + v4 + 8) & ~v4, AssociatedTypeWitness);
  else
    return swift_bridgeObjectRelease();
}

_QWORD *sub_22D9015B8(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  char v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  if (((v6 + 8) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) <= 0x10)
    v7 = 16;
  else
    v7 = ((v6 + 8) & ~v6) + *(_QWORD *)(v5 + 64);
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v9 = v7;
    else
      v9 = 4;
    __asm { BR              X14 }
  }
  *a1 = *a2;
  if (v8 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(((unint64_t)a1 + v6 + 8) & ~v6, ((unint64_t)a2 + v6 + 8) & ~v6, AssociatedTypeWitness);
    v10 = 1;
  }
  else
  {
    a1[1] = a2[1];
    swift_bridgeObjectRetain();
    v10 = 0;
  }
  *((_BYTE *)a1 + v7) = v10;
  return a1;
}

_QWORD *sub_22D9016EC(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(unsigned __int8 *)(v5 + 80);
    if (((v6 + 8) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) <= 0x10)
      v7 = 16;
    else
      v7 = ((v6 + 8) & ~v6) + *(_QWORD *)(v5 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    v10 = ~v6;
    if (v8 == 1)
      (*(void (**)(unint64_t, uint64_t))(v5 + 8))(((unint64_t)a1 + v6 + 8) & v10, AssociatedTypeWitness);
    else
      swift_bridgeObjectRelease();
    v11 = *((unsigned __int8 *)a2 + v7);
    if (v11 >= 2)
    {
      if (v7 <= 3)
        v12 = v7;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    *a1 = *a2;
    if (v11 == 1)
    {
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(((unint64_t)a1 + v6 + 8) & v10, ((unint64_t)a2 + v6 + 8) & v10, AssociatedTypeWitness);
      *((_BYTE *)a1 + v7) = 1;
    }
    else
    {
      a1[1] = a2[1];
      *((_BYTE *)a1 + v7) = 0;
      swift_bridgeObjectRetain();
    }
  }
  return a1;
}

_QWORD *sub_22D9018D8(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  char v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  if (((v6 + 8) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) <= 0x10)
    v7 = 16;
  else
    v7 = ((v6 + 8) & ~v6) + *(_QWORD *)(v5 + 64);
  v8 = *((unsigned __int8 *)a2 + v7);
  if (v8 >= 2)
  {
    if (v7 <= 3)
      v9 = v7;
    else
      v9 = 4;
    __asm { BR              X14 }
  }
  if (v8 == 1)
  {
    *a1 = *a2;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))(((unint64_t)a1 + v6 + 8) & ~v6, ((unint64_t)a2 + v6 + 8) & ~v6, AssociatedTypeWitness);
    v10 = 1;
  }
  else
  {
    v10 = 0;
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  *((_BYTE *)a1 + v7) = v10;
  return a1;
}

_QWORD *sub_22D901A08(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(unsigned __int8 *)(v5 + 80);
    if (((v6 + 8) & (unint64_t)~v6) + *(_QWORD *)(v5 + 64) <= 0x10)
      v7 = 16;
    else
      v7 = ((v6 + 8) & ~v6) + *(_QWORD *)(v5 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    v10 = ~v6;
    if (v8 == 1)
      (*(void (**)(unint64_t, uint64_t))(v5 + 8))(((unint64_t)a1 + v6 + 8) & v10, AssociatedTypeWitness);
    else
      swift_bridgeObjectRelease();
    v11 = *((unsigned __int8 *)a2 + v7);
    if (v11 >= 2)
    {
      if (v7 <= 3)
        v12 = v7;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    if (v11 == 1)
    {
      *a1 = *a2;
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 32))(((unint64_t)a1 + v6 + 8) & v10, ((unint64_t)a2 + v6 + 8) & v10, AssociatedTypeWitness);
      v13 = 1;
    }
    else
    {
      v13 = 0;
      *(_OWORD *)a1 = *(_OWORD *)a2;
    }
    *((_BYTE *)a1 + v7) = v13;
  }
  return a1;
}

uint64_t sub_22D901BF0(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v5;
  unint64_t v6;
  char v7;
  int v8;
  unsigned int v10;
  int v11;
  unsigned int v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = 16;
  if (((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64) > 0x10)
    v5 = ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if ((v5 + 1) <= 3)
  {
    v10 = ((a2 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = *(_DWORD *)(a1 + v6);
      if (!v8)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v10 > 0xFF)
    {
      v8 = *(unsigned __int16 *)(a1 + v6);
      if (!*(_WORD *)(a1 + v6))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v10 < 2)
    {
LABEL_21:
      v12 = *(unsigned __int8 *)(a1 + v5);
      if (v12 >= 2)
        return (v12 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v8 = *(unsigned __int8 *)(a1 + v6);
  if (!*(_BYTE *)(a1 + v6))
    goto LABEL_21;
LABEL_14:
  v11 = (v8 - 1) << v7;
  if (v6 > 3)
    v11 = 0;
  if ((_DWORD)v6)
  {
    if (v6 > 3)
      LODWORD(v6) = 4;
    __asm { BR              X11 }
  }
  return (v11 + 255);
}

void sub_22D901D48(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v7;
  size_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
  if (v7 <= 0x10)
    v7 = 16;
  v8 = v7 + 1;
  if (a3 < 0xFF)
  {
    v9 = 0;
  }
  else if (v8 <= 3)
  {
    v11 = ((a3 + ~(-1 << (8 * v8)) - 254) >> (8 * v8)) + 1;
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
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v10 = a2 - 255;
  if (v8 < 4)
  {
    if ((_DWORD)v7 != -1)
    {
      v12 = v10 & ~(-1 << (8 * v8));
      bzero(a1, v8);
      if ((_DWORD)v8 == 3)
      {
        *(_WORD *)a1 = v12;
        a1[2] = BYTE2(v12);
      }
      else if ((_DWORD)v8 == 2)
      {
        *(_WORD *)a1 = v12;
      }
      else
      {
        *a1 = v12;
      }
    }
  }
  else
  {
    bzero(a1, v7 + 1);
    *(_DWORD *)a1 = v10;
  }
  __asm { BR              X10 }
}

uint64_t sub_22D901F24(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
  if (v3 <= 0x10)
    v3 = 16;
  result = *(unsigned __int8 *)(a1 + v3);
  if (result >= 2)
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    __asm { BR              X12 }
  }
  return result;
}

void sub_22D901FFC(_BYTE *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
  if (a2 > 1)
  {
    if (v5 <= 0x10)
      v6 = 16;
    else
      v6 = ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))
         + *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
    v7 = a2 - 2;
    if (v6 < 4)
    {
      v8 = v7 >> (8 * v6);
      v9 = v7 & ~(-1 << (8 * v6));
      a1[v6] = v8 + 2;
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *(_WORD *)a1 = v9;
        a1[2] = BYTE2(v9);
      }
      else if ((_DWORD)v6 == 2)
      {
        *(_WORD *)a1 = v9;
      }
      else
      {
        *a1 = v9;
      }
    }
    else
    {
      a1[v6] = 2;
      bzero(a1, v6);
      *(_DWORD *)a1 = v7;
    }
  }
  else
  {
    if (v5 <= 0x10)
      v5 = 16;
    a1[v5] = a2;
  }
}

uint64_t sub_22D902100()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D902108(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_22D9003D0(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_22D90214C(uint64_t a1)
{
  return sub_22D9003DC(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_22D90215C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_22D9003D0(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_22D9003DC(v5, v6);
  return a1;
}

uint64_t sub_22D9021AC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_22D9003DC(v5, v6);
  return a1;
}

uint64_t sub_22D9021E8(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t sub_22D902230(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_22D902274(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_22D902280(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

uint64_t sub_22D90228C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D90229C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22D9022A8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void sub_22D9022B4()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D9022C4()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D9022D4()
{
  JUMPOUT(0x22E31BA9CLL);
}

uint64_t sub_22D9022E4(unint64_t a1, uint64_t a2)
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

uint64_t sub_22D902334()
{
  return 2;
}

uint64_t sub_22D90233C()
{
  return 2;
}

void _s4DiffV4TailO10CodingKeysOMa()
{
  JUMPOUT(0x22E31BA6CLL);
}

void _s4DiffV4TailO6ErrorsOMa()
{
  JUMPOUT(0x22E31BA6CLL);
}

uint64_t sub_22D90235C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D902364(unsigned int *a1, int a2)
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

uint64_t sub_22D9023B4(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22D9023F4 + 4 * byte_22D906D73[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22D902414 + 4 * byte_22D906D78[v4]))();
}

_BYTE *sub_22D9023F4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22D902414(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D90241C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D902424(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D90242C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D902434(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_22D902440()
{
  return 0;
}

uint64_t sub_22D902450()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D90245C(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_22D9024F0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D90253C + 4 * byte_22D906D82[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D902570 + 4 * byte_22D906D7D[v4]))();
}

uint64_t sub_22D902570(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D902578(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D902580);
  return result;
}

uint64_t sub_22D90258C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D902594);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D902598(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D9025A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_22D9025B0()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D9025C0()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D9025D0()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D9025E0()
{
  JUMPOUT(0x22E31BA9CLL);
}

uint64_t sub_22D902600()
{
  return sub_22D902648(&qword_255DA31C8, MEMORY[0x24BDCE960]);
}

uint64_t sub_22D902624()
{
  return sub_22D902648(&qword_255DA31D0, MEMORY[0x24BDCE920]);
}

uint64_t sub_22D902648(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_22D906880();
    result = MEMORY[0x22E31BA9C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_22D90268C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_22D90269C()
{
  return sub_22D906B50();
}

uint64_t sub_22D9026C0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6465766F6D6572 && a2 == 0xE700000000000000;
  if (v2 || (sub_22D906B08() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465747265736E69 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22D906B08();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_22D9027B0()
{
  sub_22D906B44();
  sub_22D906B50();
  return sub_22D906B5C();
}

uint64_t sub_22D9027F4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6465747265736E69;
  else
    return 0x6465766F6D6572;
}

BOOL sub_22D90282C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22D90268C(*a1, *a2);
}

uint64_t sub_22D90286C()
{
  return sub_22D9027B0();
}

uint64_t sub_22D9028A4()
{
  return sub_22D90269C();
}

uint64_t sub_22D9028DC()
{
  sub_22D906B44();
  sub_22D90269C();
  return sub_22D906B5C();
}

uint64_t sub_22D902930()
{
  char *v0;

  return sub_22D9027F4(*v0);
}

uint64_t sub_22D902968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D9026C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D9029AC()
{
  return 0;
}

uint64_t sub_22D9029B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22D904284();
  *a1 = result;
  return result;
}

uint64_t sub_22D9029F0(uint64_t a1)
{
  MEMORY[0x22E31BA9C](&unk_22D9073F0, a1);
  return sub_22D906B80();
}

uint64_t sub_22D902A24(uint64_t a1)
{
  MEMORY[0x22E31BA9C](&unk_22D9073F0, a1);
  return sub_22D906B8C();
}

void Dictionary<>.Diff.encode(to:)()
{
  _s4DiffV10CodingKeysOMa_0();
}

uint64_t sub_22D902AC0(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v14;

  MEMORY[0x22E31BA9C](&unk_22D9073F0, a1);
  v4 = sub_22D906AE4();
  *(_QWORD *)(v3 - 184) = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - v5;
  v7 = *v1;
  *(_QWORD *)(v3 - 264) = v1[1];
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  v8 = *(_QWORD *)(v3 - 232);
  sub_22D906B74();
  *(_QWORD *)(v3 - 152) = v7;
  *(_BYTE *)(v3 - 65) = 0;
  v9 = sub_22D906A00();
  *(_QWORD *)(v3 - 160) = v8;
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE1700], v9, v3 - 160);
  v10 = *(_QWORD *)(v3 - 192);
  sub_22D906AD8();
  if (!v10)
  {
    *(_QWORD *)(v3 - 152) = *(_QWORD *)(v3 - 264);
    *(_BYTE *)(v3 - 65) = 1;
    swift_getAssociatedTypeWitness();
    v11 = sub_22D9068D4();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    *(_QWORD *)(v3 - 176) = v8;
    *(_QWORD *)(v3 - 168) = AssociatedConformanceWitness;
    MEMORY[0x22E31BA9C](MEMORY[0x24BEE04C0], v11, v3 - 176);
    sub_22D906AD8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v3 - 184) + 8))(v6, v4);
}

void _s4DiffV10CodingKeysOMa_0()
{
  JUMPOUT(0x22E31BA6CLL);
}

void Dictionary<>.Diff.init(from:)()
{
  _s4DiffV10CodingKeysOMa_0();
}

uint64_t sub_22D902D10(uint64_t a1)
{
  _QWORD *v1;
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
  uint64_t AssociatedConformanceWitness;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;

  MEMORY[0x22E31BA9C](&unk_22D9073F0, a1);
  v3 = sub_22D906AC0();
  *(_QWORD *)(v2 - 200) = v3;
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - v5;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v7 = *(_QWORD *)(v2 - 176);
  sub_22D906B68();
  if (v7)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  *(_QWORD *)(v2 - 176) = v1;
  v8 = v4;
  v9 = sub_22D906A00();
  *(_BYTE *)(v2 - 65) = 0;
  *(_QWORD *)(v2 - 152) = *(_QWORD *)(v2 - 184);
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE1720], v9, v2 - 152);
  v10 = *(_QWORD *)(v2 - 200);
  sub_22D906AB4();
  v11 = *(_QWORD *)(v2 - 144);
  swift_getAssociatedTypeWitness();
  v12 = sub_22D9068D4();
  *(_BYTE *)(v2 - 65) = 1;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(v2 - 168) = *(_QWORD *)(v2 - 184);
  *(_QWORD *)(v2 - 160) = AssociatedConformanceWitness;
  swift_bridgeObjectRetain();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE04E0], v12, v2 - 168);
  sub_22D906AB4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v10);
  v14 = *(_QWORD *)(v2 - 144);
  v15 = *(_QWORD **)(v2 - 216);
  *v15 = v11;
  v15[1] = v14;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v2 - 176));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_22D902F78()
{
  Dictionary<>.Diff.init(from:)();
}

void sub_22D902FAC()
{
  Dictionary<>.Diff.encode(to:)();
}

uint64_t static Dictionary<>.zero.getter()
{
  return sub_22D906898();
}

uint64_t Dictionary<>.diff(from:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X6>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_22D906898();
  v5 = sub_22D9068D4();
  sub_22D9068D4();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE04D8], v5);
  sub_22D906934();
  v6 = sub_22D9068BC();
  swift_bridgeObjectRetain();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE0310], v6);
  sub_22D906928();
  v7 = sub_22D9069A0();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE12C8], v7);
  v8 = sub_22D906A0C();
  result = MEMORY[0x22E31B6C4](v12, a1, AssociatedTypeWitness, a2);
  if ((result & 1) != 0 && (result = sub_22D9069E8(), (result & 1) != 0))
  {
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *a3 = 0;
    a3[1] = 0;
  }
  else
  {
    *a3 = v8;
    a3[1] = v12;
  }
  return result;
}

uint64_t sub_22D903200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t TupleTypeMetadata2;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *);
  void (**v38)(char *, uint64_t);
  uint64_t v39;
  void (**v40)(char *, uint64_t);
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v47;
  char *v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char *v56;
  void (*v57)(char *, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void (**v61)(char *, uint64_t);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v75 = a8;
  v70 = a3;
  v67 = a1;
  v72 = a11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v64 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v60 = (char *)&v57 - v15;
  v73 = v16;
  v17 = sub_22D906A3C();
  v58 = *(_QWORD *)(v17 - 8);
  v59 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v63 = (char *)&v57 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v66 = (char *)&v57 - v20;
  v21 = sub_22D906A3C();
  v61 = *(void (***)(char *, uint64_t))(v21 - 8);
  v62 = v21;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v57 - v22;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v25 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v69 = (char *)&v57 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v57 - v28;
  v30 = *(_QWORD *)(a5 - 8);
  v31 = MEMORY[0x24BDAC7A8](v27);
  v71 = (char *)&v57 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = *(int *)(v31 + 48);
  v34 = &v29[v33];
  v35 = a2;
  v36 = a2 + v33;
  v68 = *(_QWORD *)(a4 - 8);
  v37 = *(void (**)(char *))(v68 + 16);
  v65 = v35;
  v37(v29);
  v38 = *(void (***)(char *, uint64_t))(v30 + 16);
  v74 = v36;
  v39 = v36;
  v40 = v38;
  ((void (*)(char *, uint64_t, uint64_t))v38)(v34, v39, a5);
  v41 = v70;
  v70 = a4;
  MEMORY[0x22E31B6DC](v29, v41, a4, a5, v75);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v23, 1, a5) == 1)
  {
    v61[1](v23, v62);
    v42 = *(void (**)(char *, uint64_t))(v30 + 8);
    v42(v34, a5);
    v43 = v70;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v29, v70);
    v44 = &v69[*(int *)(TupleTypeMetadata2 + 48)];
    ((void (*)(char *, uint64_t, uint64_t))v37)(v69, v65, v43);
    v45 = v74;
    ((void (*)(char *, uint64_t, uint64_t))v40)(v44, v74, a5);
    static Diffable.diff(from:)(v45, a5, v72);
    sub_22D9068D4();
    sub_22D9068EC();
    return ((uint64_t (*)(char *, uint64_t))v42)(v44, a5);
  }
  else
  {
    v57 = (void (*)(char *, uint64_t, uint64_t))v37;
    v61 = v40;
    v62 = TupleTypeMetadata2;
    v47 = v69;
    v48 = v71;
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v71, v23, a5);
    v49 = *(void (**)(char *, uint64_t))(v30 + 8);
    v49(v34, a5);
    v50 = v70;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v29, v70);
    v51 = v63;
    (*(void (**)(char *, uint64_t))(v72 + 40))(v48, a5);
    v52 = v64;
    v53 = v73;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v51, 1, v73) == 1)
    {
      v49(v71, a5);
      return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v51, v59);
    }
    else
    {
      v54 = v60;
      (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v60, v51, v53);
      v55 = &v47[*(int *)(v62 + 48)];
      v57(v47, v65, v50);
      ((void (*)(char *, uint64_t, uint64_t))v61)(v55, v74, a5);
      v56 = v66;
      (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v66, v54, v53);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v56, 0, 1, v53);
      sub_22D9068D4();
      sub_22D9068EC();
      (*(void (**)(char *, uint64_t))(v52 + 8))(v54, v53);
      v49(v71, a5);
      return ((uint64_t (*)(char *, uint64_t))v49)(v55, a5);
    }
  }
}

uint64_t sub_22D90369C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_22D903200(a1, a2, v2[10], v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9]);
}

BOOL sub_22D9036D4()
{
  uint64_t v0;

  v0 = sub_22D9068BC();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE0310], v0);
  return (sub_22D90694C() & 1) == 0;
}

uint64_t Dictionary<>.apply(diff:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = sub_22D906A00();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE1718], v2);
  sub_22D906940();
  swift_bridgeObjectRelease();
  swift_getAssociatedTypeWitness();
  v3 = sub_22D9068D4();
  swift_bridgeObjectRetain();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE04D8], v3);
  sub_22D906940();
  swift_bridgeObjectRelease();
  if (v5)
    swift_bridgeObjectRelease();
  return a2;
}

uint64_t sub_22D903918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v7 = sub_22D906A3C();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - v9;
  MEMORY[0x24BDAC7A8](v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(v10, 1, 1, a4);
  sub_22D9068D4();
  return sub_22D9068EC();
}

uint64_t sub_22D903A1C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  char *v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;

  v31 = a7;
  v29 = a2;
  v30 = a6;
  v33 = a3;
  v28 = a9;
  v14 = sub_22D906A3C();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v26 - v16;
  v18 = *(_QWORD *)(a4 - 8);
  v19 = MEMORY[0x24BDAC7A8](v15);
  v27 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = v32;
  v31 = a8;
  result = sub_22D903BDC(v33, a1, v29, a4, a5, a8, (uint64_t)v23, v28, *((uint64_t *)&v28 + 1), a10);
  if (!v24)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v27, a1, a4);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v17, v23, a5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v17, 0, 1, a5);
    sub_22D9068D4();
    sub_22D9068EC();
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v23, a5);
  }
  return result;
}

uint64_t sub_22D903BDC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = a6;
  v23 = a7;
  v24 = a3;
  v25 = a10;
  v14 = sub_22D906A3C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v23 - v17;
  v19 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x22E31B6DC](a2, *a1, a4, a5, v26);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, a5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    return static Diffable.value(from:)(v24, a5, v25);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v21, v18, a5);
    (*(void (**)(uint64_t, uint64_t))(v25 + 48))(v24, a5);
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, a5);
  }
}

uint64_t sub_22D903D4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Dictionary<>.zero.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22D903D7C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  return Dictionary<>.diff(from:)(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 32), a2);
}

uint64_t sub_22D903DBC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;

  result = Dictionary<>.apply(diff:)(a1, *v2);
  if (!v3)
    *a2 = result;
  return result;
}

BOOL sub_22D903E0C()
{
  return sub_22D9036D4();
}

uint64_t sub_22D903E44(uint64_t a1)
{
  uint64_t *v1;

  return sub_22D903918(a1, v1[10], v1[2], v1[3]);
}

uint64_t sub_22D903E78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_22D903A1C(a1, a2, *(_QWORD **)(v2 + 80), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_OWORD *)(v2 + 56), *(_QWORD *)(v2 + 72));
}

uint64_t sub_22D903EB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t TupleTypeMetadata2;

  v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 80);
  swift_getAssociatedTypeWitness();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  return v3(a1, a1 + *(int *)(TupleTypeMetadata2 + 48));
}

void sub_22D903F34()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D903F44()
{
  JUMPOUT(0x22E31BA9CLL);
}

uint64_t sub_22D903F54()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D903F60()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_22D903F8C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_22D903FC0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_22D90401C(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22D904058(uint64_t *a1, int a2)
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

uint64_t sub_22D9040A0(uint64_t result, int a2, int a3)
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

void type metadata accessor for Dictionary<>.Diff()
{
  JUMPOUT(0x22E31BA6CLL);
}

uint64_t sub_22D9040E8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D9040F0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_22D904180(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D9041CC + 4 * byte_22D90723D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D904200 + 4 * byte_22D907238[v4]))();
}

uint64_t sub_22D904200(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D904208(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D904210);
  return result;
}

uint64_t sub_22D90421C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D904224);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D904228(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D904230(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D90423C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22D904248(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void sub_22D904254()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D904264()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D904274()
{
  JUMPOUT(0x22E31BA9CLL);
}

uint64_t sub_22D904284()
{
  return 2;
}

uint64_t sub_22D90428C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v4 = v2;
  sub_22D9046DC();
  v6 = sub_22D9068F8();
  v7 = *(_QWORD *)(a1 - 8);
  if ((v6 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, v4, a1);
    v8 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v8, 1, a1);
}

uint64_t Diffable<>.diff(from:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v3 = v2;
  v6 = sub_22D9068F8();
  v7 = *(_QWORD *)(a1 - 8);
  if ((v6 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, v3, a1);
    v8 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v8, 1, a1);
}

uint64_t sub_22D904388@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t Diffable<>.apply(diff:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t static Diffable.diff(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v9, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(a3 + 40))(v7, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t static Diffable.value(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v10, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a3 + 48))(a1, a2, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t Diffable<>.update(work:)(void (*a1)(void *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  void *v10;

  objc_msgSend(v4, sel_copyWithZone_, 0);
  sub_22D906A48();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  a1(v4);
  v10 = v4;
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(a4 + 40))(&v9, a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t dispatch thunk of static Diffable.zero.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Diffable.diff(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Diffable.apply(diff:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t sub_22D90465C@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v5 = *v2;
  v4 = v2[1];
  v6 = *v2 == *(_QWORD *)result && v4 == *(_QWORD *)(result + 8);
  if (v6 || (result = sub_22D906B08(), (result & 1) != 0))
  {
    v5 = 0;
    v4 = 0;
  }
  else
  {
    result = swift_bridgeObjectRetain();
  }
  *a2 = v5;
  a2[1] = v4;
  return result;
}

uint64_t sub_22D9046C0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_22D9046DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA3348;
  if (!qword_255DA3348)
  {
    v1 = sub_22D906880();
    result = MEMORY[0x22E31BA9C](MEMORY[0x24BDCE958], v1);
    atomic_store(result, (unint64_t *)&qword_255DA3348);
  }
  return result;
}

Swift::Double_optional __swiftcall Double.diff(from:)(Swift::Double from)
{
  double v1;
  double v2;
  Swift::Bool v3;
  Swift::Double_optional result;

  v2 = v1 - from;
  if (v2 == 0.0)
    v3 = 0;
  else
    v3 = LOBYTE(v2);
  result.value = v2;
  result.is_nil = v3;
  return result;
}

Swift::Double __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Double.apply(diff:)(Swift::Double diff)
{
  double v1;

  return diff + v1;
}

uint64_t sub_22D904744()
{
  return MEMORY[0x24BEE1400];
}

uint64_t sub_22D904750()
{
  return MEMORY[0x24BEE13D8];
}

void sub_22D90475C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

double *sub_22D904764@<X0>(double *result@<X0>, uint64_t a2@<X8>)
{
  double *v2;
  double v3;
  double v4;

  v3 = *v2 - *result;
  v4 = v3;
  if (v3 == 0.0)
    v4 = 0.0;
  *(double *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v3 == 0.0;
  return result;
}

double sub_22D90478C@<D0>(double *a1@<X0>, double *a2@<X8>)
{
  double *v2;
  double result;

  result = *a1 + *v2;
  *a2 = result;
  return result;
}

Swift::Float __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Float.apply(diff:)(Swift::Float diff)
{
  float v1;

  return diff + v1;
}

uint64_t sub_22D9047D4()
{
  return MEMORY[0x24BEE1520];
}

uint64_t sub_22D9047E0()
{
  return MEMORY[0x24BEE14F8];
}

void sub_22D9047EC(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

float *sub_22D9047F4@<X0>(float *result@<X0>, uint64_t a2@<X8>)
{
  float *v2;
  float v3;
  float v4;

  v3 = *v2 - *result;
  v4 = v3;
  if (v3 == 0.0)
    v4 = 0.0;
  *(float *)a2 = v4;
  *(_BYTE *)(a2 + 4) = v3 == 0.0;
  return result;
}

float sub_22D90481C@<S0>(float *a1@<X0>, float *a2@<X8>)
{
  float *v2;
  float result;

  result = *a1 + *v2;
  *a2 = result;
  return result;
}

Swift::Int_optional __swiftcall Int.diff(from:)(Swift::Int from)
{
  _BOOL8 v1;
  BOOL v2;
  Swift::Int v3;
  Swift::Int_optional result;

  v2 = __OFSUB__(v1, from);
  v3 = v1 - from;
  if (v2)
    __break(1u);
  else
    LOBYTE(v1) = v3 == 0;
  result.is_nil = v1;
  result.value = v3;
  return result;
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Int.apply(diff:)(Swift::Int diff)
{
  uint64_t v1;
  BOOL v2;
  Swift::Int result;

  v2 = __OFADD__(v1, diff);
  result = v1 + diff;
  if (v2)
    __break(1u);
  return result;
}

uint64_t sub_22D904858()
{
  return MEMORY[0x24BEE1798];
}

uint64_t sub_22D904864()
{
  return MEMORY[0x24BEE1770];
}

void sub_22D904870(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_22D904878@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  BOOL v3;

  if (__OFSUB__(*v2, *result))
  {
    __break(1u);
  }
  else
  {
    v3 = *v2 == *result;
    *(_QWORD *)a2 = *v2 - *result;
    *(_BYTE *)(a2 + 8) = v3;
  }
  return result;
}

_QWORD *sub_22D9048A0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  if (__OFADD__(*v2, *result))
    __break(1u);
  else
    *a2 = *v2 + *result;
  return result;
}

uint64_t sub_22D9048BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  uint64_t v15;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - v9;
  sub_22D906A84();
  sub_22D906A90();
  v11 = sub_22D9068F8();
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  if ((v11 & 1) != 0)
  {
    v12(v10, v4);
    v13 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v10, v4);
    v13 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a3, v13, 1, v4);
}

uint64_t sub_22D9049E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D906A78();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v5 + 32))(a3, v7, v4);
}

uint64_t sub_22D904A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D906A90();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a2, v6, a1);
}

uint64_t sub_22D904AF0()
{
  return sub_22D9068F8() & 1;
}

uint64_t sub_22D904B18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22D904A7C(*(_QWORD *)(a1 + 16), a2);
}

uint64_t sub_22D904B28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22D9049E0(a1, a2, a3);
}

uint64_t sub_22D904B3C()
{
  return sub_22D904AF0();
}

uint64_t sub_22D904B48()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D904B50()
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

uint64_t *sub_22D904BBC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_22D904C2C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_22D904C3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_22D904C6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_22D904C9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_22D904CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_22D904CFC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_22D904DAC + 4 * byte_22D907480[(v7 - 1)]))();
}

void sub_22D904DFC(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

void type metadata accessor for NumberDiffable()
{
  JUMPOUT(0x22E31BA6CLL);
}

uint64_t sub_22D904FB8(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 32);
}

uint64_t sub_22D904FC0(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 40);
}

BOOL sub_22D904FC8(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_22D904FD8()
{
  return sub_22D906B50();
}

uint64_t sub_22D904FFC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6465747265736E69 && a2 == 0xE800000000000000;
  if (v2 || (sub_22D906B08() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465766F6D6572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22D906B08();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_22D9050EC()
{
  sub_22D906B44();
  sub_22D906B50();
  return sub_22D906B5C();
}

uint64_t sub_22D905130(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6465766F6D6572;
  else
    return 0x6465747265736E69;
}

BOOL sub_22D905168(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22D904FC8(*a1, *a2);
}

uint64_t sub_22D905180()
{
  return sub_22D9050EC();
}

uint64_t sub_22D905194()
{
  return sub_22D904FD8();
}

uint64_t sub_22D9051A8()
{
  sub_22D906B44();
  sub_22D904FD8();
  return sub_22D906B5C();
}

uint64_t sub_22D9051F0()
{
  char *v0;

  return sub_22D905130(*v0);
}

uint64_t sub_22D905204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D904FFC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D905234()
{
  return 0;
}

uint64_t sub_22D905240@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22D905FCC();
  *a1 = result;
  return result;
}

uint64_t sub_22D905270(uint64_t a1)
{
  MEMORY[0x22E31BA9C](&unk_22D907690, a1);
  return sub_22D906B80();
}

uint64_t sub_22D9052A4(uint64_t a1)
{
  MEMORY[0x22E31BA9C](&unk_22D907690, a1);
  return sub_22D906B8C();
}

void Set<>.Diff.encode(to:)()
{
  _s4DiffV10CodingKeysOMa_1();
}

uint64_t sub_22D905318(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  MEMORY[0x22E31BA9C](&unk_22D907690, a1);
  v4 = sub_22D906AE4();
  *(_QWORD *)(v3 - 136) = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - v5;
  v7 = *v1;
  *(_QWORD *)(v3 - 184) = v1[1];
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_22D906B74();
  *(_QWORD *)(v3 - 112) = v7;
  *(_BYTE *)(v3 - 65) = 0;
  v8 = sub_22D9069A0();
  *(_QWORD *)(v3 - 120) = *(_QWORD *)(v3 - 160);
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE12A0], v8, v3 - 120);
  v9 = *(_QWORD *)(v3 - 128);
  sub_22D906AD8();
  if (v9)
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v3 - 136) + 8))(v6, v4);
  v11 = *(_QWORD *)(v3 - 136);
  *(_QWORD *)(v3 - 112) = *(_QWORD *)(v3 - 184);
  *(_BYTE *)(v3 - 65) = 1;
  sub_22D906AD8();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v6, v4);
}

void _s4DiffV10CodingKeysOMa_1()
{
  JUMPOUT(0x22E31BA6CLL);
}

void Set<>.Diff.init(from:)()
{
  _s4DiffV10CodingKeysOMa_1();
}

uint64_t sub_22D9054D4(uint64_t a1)
{
  _QWORD *v1;
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
  _QWORD *v13;
  uint64_t v15;

  MEMORY[0x22E31BA9C](&unk_22D907690, a1);
  v4 = sub_22D906AC0();
  *(_QWORD *)(v3 - 128) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - v6;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_22D906B68();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  v8 = v5;
  v9 = sub_22D9069A0();
  *(_BYTE *)(v3 - 65) = 0;
  *(_QWORD *)(v3 - 120) = *(_QWORD *)(v3 - 136);
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE12D0], v9, v3 - 120);
  v10 = *(_QWORD *)(v3 - 128);
  sub_22D906AB4();
  v11 = *(_QWORD *)(v3 - 112);
  *(_BYTE *)(v3 - 65) = 1;
  swift_bridgeObjectRetain();
  sub_22D906AB4();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v7, v10);
  v12 = *(_QWORD *)(v3 - 112);
  v13 = *(_QWORD **)(v3 - 144);
  *v13 = v11;
  v13[1] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_22D9056B0()
{
  Set<>.Diff.init(from:)();
}

void sub_22D9056D0()
{
  Set<>.Diff.encode(to:)();
}

uint64_t static Set<>.zero.getter()
{
  return sub_22D9068B0();
}

uint64_t Set<>.apply(diff:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = sub_22D9069A0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE12C8], v2);
  sub_22D906940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22D906940();
  swift_bridgeObjectRelease();
  return a2;
}

uint64_t sub_22D90580C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_22D906A3C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - v2;
  sub_22D906A00();
  sub_22D9069DC();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_22D9058C4(uint64_t a1)
{
  return sub_22D9059D0(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22D90580C);
}

uint64_t sub_22D9058E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD v11[2];

  v4 = *(_QWORD *)(a3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v11 - v8;
  (*(void (**)(char *))(v4 + 16))(v7);
  sub_22D906A00();
  sub_22D9069D0();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, a3);
}

uint64_t sub_22D9059B4(uint64_t a1)
{
  return sub_22D9059D0(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22D9058E0);
}

uint64_t sub_22D9059D0(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[6], v2[2], v2[3], v2[4], v2[5]);
}

uint64_t Set<>.diff(from:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v1 = sub_22D906A00();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE1718], v1);
  v2 = sub_22D906910();
  v3 = sub_22D906910();
  v4 = sub_22D9069A0();
  MEMORY[0x22E31BA9C](MEMORY[0x24BEE12E0], v4);
  result = sub_22D906A24();
  if ((result & 1) != 0 && (result = sub_22D906A24(), (result & 1) != 0))
  {
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *a1 = 0;
    a1[1] = 0;
  }
  else
  {
    *a1 = v2;
    a1[1] = v3;
  }
  return result;
}

uint64_t sub_22D905B54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22D905B7C(a1, a2);
}

uint64_t sub_22D905B68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22D905B7C(a1, a2);
}

uint64_t sub_22D905B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = sub_22D9069F4();
  v7 = *(_QWORD *)(v5 - 8);
  if ((v6 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a2, a1, v5);
    v8 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v8, 1, v5);
}

void sub_22D905C00()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D905C10()
{
  JUMPOUT(0x22E31BA9CLL);
}

uint64_t sub_22D905C20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Set<>.zero.getter();
  *a1 = result;
  return result;
}

uint64_t sub_22D905C4C@<X0>(uint64_t *a1@<X8>)
{
  return Set<>.diff(from:)(a1);
}

uint64_t sub_22D905C64@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;

  result = Set<>.apply(diff:)(a1, *v2);
  if (!v3)
    *a2 = result;
  return result;
}

uint64_t sub_22D905C9C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D905CA8()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_22D905CD4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_22D905D08(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_22D905D64(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22D905DA0(uint64_t *a1, int a2)
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

uint64_t sub_22D905DE8(uint64_t result, int a2, int a3)
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

void type metadata accessor for Set<>.Diff()
{
  JUMPOUT(0x22E31BA6CLL);
}

uint64_t sub_22D905E30()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D905E38(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_22D905EC8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D905F14 + 4 * byte_22D907505[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D905F48 + 4 * byte_22D907500[v4]))();
}

uint64_t sub_22D905F48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D905F50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D905F58);
  return result;
}

uint64_t sub_22D905F64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D905F6CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D905F70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D905F78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D905F84(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22D905F90(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void sub_22D905F9C()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D905FAC()
{
  JUMPOUT(0x22E31BA9CLL);
}

void sub_22D905FBC()
{
  JUMPOUT(0x22E31BA9CLL);
}

uint64_t sub_22D905FCC()
{
  return 2;
}

uint64_t static String.zero.getter()
{
  return 0;
}

uint64_t sub_22D905FE0()
{
  return MEMORY[0x24BEE0D38];
}

uint64_t sub_22D905FEC()
{
  return MEMORY[0x24BEE0D08];
}

void sub_22D905FF8(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t (*combine<A, B, C>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v8;

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a4;
  v8[5] = a1;
  swift_bridgeObjectRetain();
  return sub_22D9061C0;
}

uint64_t sub_22D906074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t FunctionTypeMetadata3;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  BOOL v14;
  uint64_t result;

  FunctionTypeMetadata3 = swift_getFunctionTypeMetadata3();
  v8 = swift_bridgeObjectRetain();
  if (!MEMORY[0x22E31B790](v8, FunctionTypeMetadata3))
    return swift_bridgeObjectRelease();
  v9 = 0;
  for (i = a4 + 40; ; i += 16)
  {
    v11 = sub_22D906970();
    sub_22D906958();
    if ((v11 & 1) == 0)
      break;
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(i - 8);
    v13 = v9 + 1;
    v14 = __OFADD__(v9, 1);
    result = swift_retain();
    if (v14)
      goto LABEL_11;
    v12(a1, a2, a3);
    swift_release();
    ++v9;
    if (v13 == MEMORY[0x22E31B790](a4, FunctionTypeMetadata3))
      return swift_bridgeObjectRelease();
  }
  result = sub_22D906A6C();
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22D90619C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D9061C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_22D906074(a1, a2, a3, *(_QWORD *)(v3 + 40));
}

uint64_t (*pullback<A, B, C, D, E, F, G, H>(_:action:featureConfiguration:generalConfiguration:localConfiguration:topicConfigurations:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v16;

  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a8;
  v16[3] = a3;
  v16[4] = a1;
  v16[5] = a2;
  v16[6] = a4;
  v16[7] = a5;
  v16[8] = a6;
  v16[9] = a7;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return sub_22D906590;
}

uint64_t sub_22D90628C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, char *, char *, char *, char *, char *), uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, _QWORD *a10)
{
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
  char *v21;
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
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, char *, char *, char *, char *, char *);

  v53 = a6;
  v54 = a5;
  v50 = a3;
  v51 = a1;
  v41 = a7;
  v46 = a8;
  v43 = a9;
  v48 = a10;
  v52 = *(_QWORD *)(*a10 + *MEMORY[0x24BEE46A8] + 8);
  v49 = *(_QWORD *)(v52 - 8);
  v10 = MEMORY[0x24BDAC7A8]((*(_QWORD *)(v49 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (char *)&v39 - v10;
  v47 = *(_QWORD *)(v12 + v13);
  v45 = *(_QWORD *)(v47 - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v39 - v15;
  v44 = *(_QWORD *)(v17 + v18);
  v42 = *(_QWORD *)(v44 - 8);
  v19 = MEMORY[0x24BDAC7A8](v14);
  v21 = (char *)&v39 - v20;
  v40 = *(_QWORD *)(v22 + v23);
  v39 = *(_QWORD *)(v40 - 8);
  v24 = MEMORY[0x24BDAC7A8](v19);
  v26 = (char *)&v39 - v25;
  v29 = *(_QWORD *)(v27 + v28);
  v30 = *(_QWORD *)(v29 - 8);
  v31 = MEMORY[0x24BDAC7A8](v24);
  v33 = (char *)&v39 - v32;
  v34 = *(_QWORD *)(v29 + 16);
  v35 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v37 = (char *)&v39 - v36;
  swift_getAtKeyPath();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v33, v29);
  (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v37, v33, v34);
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  v54(v51, v37, v26, v21, v16, v11);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v11, v52);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v16, v47);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v21, v44);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v37, v34);
}

uint64_t sub_22D906544()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D906590(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_22D90628C(a1, a2, a3, *(_QWORD *)(v3 + 24), *(void (**)(uint64_t, char *, char *, char *, char *, char *))(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 64), *(_QWORD **)(v3 + 72));
}

uint64_t (*(*logging<A, B, C>(log:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v8;
  id v9;

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = a4;
  v8[5] = a1;
  v9 = a1;
  return sub_22D9066DC;
}

uint64_t (*sub_22D906630(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v12;
  id v13;

  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a5;
  v12[4] = a6;
  v12[5] = a1;
  v12[6] = a2;
  v12[7] = a3;
  swift_retain();
  v13 = a3;
  return sub_22D906804;
}

uint64_t sub_22D9066B8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t (*sub_22D9066DC(uint64_t a1, uint64_t a2))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v2;

  return sub_22D906630(a1, a2, *(void **)(v2 + 40), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_22D9066E8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v4;

  a4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253E88CC8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22D9076F0;
  sub_22D906AFC();
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 64) = sub_22D906830();
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0xE000000000000000;
  sub_22D906A30();
  sub_22D90688C();
  return swift_bridgeObjectRelease();
}

uint64_t with<A, B>(_:_:)(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_22D9067D8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_22D906804(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_22D9066E8(a1, a2, a3, *(void (**)(void))(v3 + 40));
}

unint64_t sub_22D906830()
{
  unint64_t result;

  result = qword_253E88CD0;
  if (!qword_253E88CD0)
  {
    result = MEMORY[0x22E31BA9C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253E88CD0);
  }
  return result;
}

uint64_t _s10Foundation4DateV10XavierCoreE4zeroACvgZ_0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_22D906880()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_22D90688C()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_22D906898()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t _sSa10XavierCoreSeRzSERzAA8DiffableRzlE4zeroSayxGvgZ_0()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_22D9068B0()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_22D9068BC()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_22D9068C8()
{
  return MEMORY[0x24BEE03E8]();
}

uint64_t sub_22D9068D4()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_22D9068E0()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_22D9068EC()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_22D9068F8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22D906904()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22D906910()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_22D90691C()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_22D906928()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_22D906934()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_22D906940()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_22D90694C()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_22D906958()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_22D906964()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_22D906970()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_22D90697C()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_22D906988()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_22D906994()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_22D9069A0()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_22D9069AC()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_22D9069B8()
{
  return MEMORY[0x24BEE1290]();
}

uint64_t sub_22D9069C4()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_22D9069D0()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_22D9069DC()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_22D9069E8()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_22D9069F4()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_22D906A00()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_22D906A0C()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_22D906A18()
{
  return MEMORY[0x24BEE19A8]();
}

uint64_t sub_22D906A24()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_22D906A30()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22D906A3C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22D906A48()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22D906A54()
{
  return MEMORY[0x24BEE2150]();
}

uint64_t sub_22D906A60()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22D906A6C()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_22D906A78()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_22D906A84()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_22D906A90()
{
  return MEMORY[0x24BEE2F88]();
}

uint64_t sub_22D906A9C()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_22D906AA8()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_22D906AB4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22D906AC0()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_22D906ACC()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_22D906AD8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22D906AE4()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_22D906AF0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22D906AFC()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_22D906B08()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22D906B14()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22D906B20()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22D906B2C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22D906B38()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22D906B44()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22D906B50()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22D906B5C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22D906B68()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22D906B74()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22D906B80()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22D906B8C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_getFunctionTypeMetadata3()
{
  return MEMORY[0x24BEE4D70]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

