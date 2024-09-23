void sub_1CF70A838(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_68_5(a1);
}

uint64_t sub_1CF70A840(unsigned int a1, int a2)
{
  return a2 | a1;
}

void sub_1CF70A848(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_68_5(a1);
}

uint64_t sub_1CF70A850(unsigned int a1, int a2)
{
  return a2 ^ a1;
}

BOOL sub_1CF70A858(unsigned __int8 *a1, unsigned __int8 a2)
{
  _BYTE *v2;
  int v3;

  v3 = (*v2 & a2);
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

BOOL sub_1CF70A888(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

void sub_1CF70A8B4(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  _QWORD *v2;

  if ((*v2 & a2) != 0)
    *v2 &= ~a2;
  OUTLINED_FUNCTION_67_4(a1);
}

uint64_t sub_1CF70A8D4(unsigned __int8 a1)
{
  char *v1;
  char v2;

  v2 = *v1;
  if ((*v1 & a1) != 0)
    *v1 = v2 & ~a1;
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

void sub_1CF70A904(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  _QWORD *v2;

  *v2 |= a2;
  OUTLINED_FUNCTION_67_4(a1);
}

uint64_t sub_1CF70A91C(char a1)
{
  char *v1;
  char v2;

  v2 = *v1;
  *v1 |= a1;
  return (v2 & a1) | (((v2 & a1) == 0) << 8);
}

uint64_t sub_1CF70A944(uint64_t result)
{
  _BYTE *v1;

  *v1 |= result;
  return result;
}

void sub_1CF70A954(uint64_t a1)
{
  _QWORD *v1;

  OUTLINED_FUNCTION_88_1(*v1 | a1);
}

uint64_t sub_1CF70A960(uint64_t result)
{
  _BYTE *v1;

  *v1 ^= result;
  return result;
}

void sub_1CF70A970(uint64_t a1)
{
  _QWORD *v1;

  OUTLINED_FUNCTION_88_1(*v1 ^ a1);
}

void sub_1CF70A97C(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_68_5(a1);
}

uint64_t sub_1CF70A984(int a1, int a2)
{
  return a2 & ~a1;
}

BOOL sub_1CF70A98C(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1CF70A998(unsigned __int8 a1, unsigned __int8 a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1CF70A9A8(char a1)
{
  return a1 == 0;
}

BOOL sub_1CF70A9B4(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1CF70A9C0(uint64_t result)
{
  _BYTE *v1;

  *v1 &= ~(_BYTE)result;
  return result;
}

void sub_1CF70A9D0(uint64_t a1)
{
  _QWORD *v1;

  OUTLINED_FUNCTION_88_1(*v1 & ~a1);
}

uint64_t sub_1CF70A9DC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t sub_1CF70AA30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 *v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    LODWORD(v2) = 0;
    v3 = (unsigned __int8 *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~(_DWORD)v2) == 0)
        v4 = 0;
      v2 = v4 | v2;
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

uint64_t TunnelInterfaceParameters.init(address:netmask:mtu:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t result;

  v8 = OUTLINED_FUNCTION_148_0();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32);
  v9(a4, a1, v8);
  v10 = type metadata accessor for TunnelInterfaceParameters();
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v9)(a4 + *(int *)(v10 + 20), a2, v8);
  *(_WORD *)(a4 + *(int *)(v10 + 24)) = a3;
  return result;
}

uint64_t sub_1CF70AB00(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_0;
  void (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v22[5];
  uint64_t v23[5];

  v10 = OUTLINED_FUNCTION_148_0();
  v11 = MEMORY[0x1E0CCE330];
  v23[3] = v10;
  v23[4] = MEMORY[0x1E0CCE330];
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v23);
  v13 = *(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v13(boxed_opaque_existential_0, a2, v10);
  v14 = OUTLINED_FUNCTION_149_0();
  v15 = a2 + *(int *)(v14 + 20);
  v22[3] = v10;
  v22[4] = v11;
  v16 = __swift_allocate_boxed_opaque_existential_0(v22);
  v13(v16, v15, v10);
  (*(void (**)(uint64_t, uint64_t *, uint64_t *, _QWORD, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a7 + 56))(a1, v23, v22, *(unsigned __int16 *)(a2 + *(int *)(v14 + 24)), a3 | ((HIDWORD(a3) & 1) << 32), a4, a5, a6, a7);
  return sub_1CF70D870(a2);
}

uint64_t sub_1CF70ABFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2048);
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_99();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA2050);
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_16_7();
  type metadata accessor for TunnelInterfaceParameters();
  v6 = sub_1CF73E994();
  v7 = sub_1CF73E994();
  v14 = v8;
  sub_1CF6934BC(v7, v8);
  v9 = sub_1CF73E5C8();
  if (v9 != OUTLINED_FUNCTION_81_2())
  {
    __break(1u);
    goto LABEL_8;
  }
  v10 = OUTLINED_FUNCTION_81_2();
  OUTLINED_FUNCTION_55_3(v7);
  if (v10 < 0)
  {
LABEL_8:
    __break(1u);
    JUMPOUT(0x1CF70B094);
  }
  if (v10)
    __asm { BR              X11 }
  v11 = sub_1CF73EA00();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v11);
  OUTLINED_FUNCTION_54_7(v7);
  sub_1CF73E9B8();
  v12 = OUTLINED_FUNCTION_148_0();
  if (__swift_getEnumTagSinglePayload(v1, 1, v12) == 1)
  {
    sub_1CF693ED8(v1, (uint64_t *)&unk_1EFBA2050);
    sub_1CF73F450();
    __break(1u);
    JUMPOUT(0x1CF70B114);
  }
  OUTLINED_FUNCTION_79_3(v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(a1, v1, v12);
  return OUTLINED_FUNCTION_55_3(v7);
}

uint64_t sub_1CF70B134()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  uint64_t result;

  if (qword_1EFBA0810 != -1)
    swift_once();
  swift_beginAccess();
  v0 = qword_1EFBA1088;
  v1 = unk_1EFBA1090;
  v2 = byte_1EFBA1098;
  swift_bridgeObjectRetain();
  sub_1CF68DC58(v0, v1, v2);
  v4 = v3;
  result = OUTLINED_FUNCTION_11();
  byte_1EFBB2020 = v4 & 1;
  return result;
}

uint64_t sub_1CF70B1E8()
{
  sub_1CF73EF58();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7_14();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_7_14();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_7_14();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_7_14();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_7_14();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_7_14();
  OUTLINED_FUNCTION_4_17();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_7_14();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_11();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1CF73EF58();
  swift_bridgeObjectRelease();
  return 91;
}

_BYTE *sub_1CF70B390@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1CF70B39C()
{
  return sub_1CF70B1E8();
}

uint64_t sub_1CF70B3A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_64_1();
  *a1 = result;
  return result;
}

uint64_t sub_1CF70B3C8(unsigned __int8 *a1)
{
  unsigned __int8 *v1;

  return sub_1CF739FE4(*a1, *v1);
}

uint64_t sub_1CF70B3D4@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t result;

  result = sub_1CF70A840(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1CF70B400@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t result;

  result = sub_1CF737B4C(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1CF70B42C@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t result;

  result = sub_1CF70A850(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1CF70B458(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1CF70A858(a1, *a2);
}

uint64_t sub_1CF70B460@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1CF70A8D4(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_1CF70B490@<X0>(char *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1CF70A91C(*a1);
  *a2 = result;
  a2[1] = BYTE1(result) & 1;
  return result;
}

uint64_t sub_1CF70B4C0(unsigned __int8 *a1)
{
  return sub_1CF70A944(*a1);
}

uint64_t sub_1CF70B4C8(unsigned __int8 *a1)
{
  return sub_1CF737B60(*a1);
}

uint64_t sub_1CF70B4D0(unsigned __int8 *a1)
{
  return sub_1CF70A960(*a1);
}

uint64_t sub_1CF70B4D8@<X0>(unsigned __int8 *a1@<X0>, _BYTE *a2@<X8>)
{
  unsigned __int8 *v2;
  uint64_t result;

  result = sub_1CF70A984(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_1CF70B504(char *a1)
{
  unsigned __int8 *v1;

  return sub_1CF737B80(*a1, *v1);
}

BOOL sub_1CF70B510(unsigned __int8 *a1)
{
  unsigned __int8 *v1;

  return sub_1CF70A998(*a1, *v1);
}

BOOL sub_1CF70B51C(unsigned __int8 *a1)
{
  char *v1;

  return sub_1CF737B9C(*a1, *v1);
}

BOOL sub_1CF70B528()
{
  char *v0;

  return sub_1CF70A9A8(*v0);
}

uint64_t sub_1CF70B530(unsigned __int8 *a1)
{
  return sub_1CF70A9C0(*a1);
}

unsigned __int8 *sub_1CF70B538@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1CF70B548(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_1CF70B554@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1CF70AA30(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1CF70B578()
{
  if (OUTLINED_FUNCTION_48_6() >= 20)
    __asm { BR              X9 }
  sub_1CF6AA5E0();
  OUTLINED_FUNCTION_25_8();
  sub_1CF73F348();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_44_6();
  OUTLINED_FUNCTION_11_9();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_178();
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_11_9();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_5_1();
  sub_1CF6ABB3C();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_12_10();
  sub_1CF73F780();
  OUTLINED_FUNCTION_72_4();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_1CF70B818@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  if (a1 < 0 || (a1 < v7 ? (v15 = a7 < v7) : (v15 = 1), v15))
    JUMPOUT(0x1CF70B6E8);
  v26 = v8;
  if (v14)
  {
    if (v14 == 1)
    {
      if (v13 < (int)v9)
      {
        __break(1u);
        JUMPOUT(0x1CF70BDFCLL);
      }
      OUTLINED_FUNCTION_1_19();
      OUTLINED_FUNCTION_19_11(v12, v13, v10, 2);
      if (v10)
      {
        OUTLINED_FUNCTION_2_2();
        __break(1u);
        JUMPOUT(0x1CF70BE24);
      }
      v16 = OUTLINED_FUNCTION_2_2();
      v17 = v12;
    }
    else
    {
      OUTLINED_FUNCTION_84_0();
      v25 = v21;
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_350();
      OUTLINED_FUNCTION_19_11(v10, v25, v11, 2);
      if (v10)
        JUMPOUT(0x1CF70BE30);
      OUTLINED_FUNCTION_15_13();
      v16 = OUTLINED_FUNCTION_96();
      v17 = *(_QWORD *)(v9 + 16);
    }
  }
  else
  {
    v18 = OUTLINED_FUNCTION_9_11();
    OUTLINED_FUNCTION_49_3(v18, v19, v20, 2);
    OUTLINED_FUNCTION_18_13();
  }
  v22 = __OFADD__(v17, 4);
  v23 = v17 + 4;
  if (v22)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v23, 4))
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x1CF70BDF0);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_1CF70B940 + dword_1CF70BE5C[v26]))(v16);
}

uint64_t sub_1CF70B950@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  if (a1 < 0 || (a1 < v7 ? (v15 = a7 < v7) : (v15 = 1), v15))
    JUMPOUT(0x1CF70B6E8);
  v26 = v8;
  if (v14)
  {
    if (v14 == 1)
    {
      if (v13 < (int)v9)
      {
        __break(1u);
        JUMPOUT(0x1CF70BE08);
      }
      OUTLINED_FUNCTION_1_19();
      OUTLINED_FUNCTION_62_3(v12, v13, v10, 4);
      if (v10)
      {
        OUTLINED_FUNCTION_2_2();
        __break(1u);
        JUMPOUT(0x1CF70BE24);
      }
      v16 = OUTLINED_FUNCTION_2_2();
      v17 = v12;
    }
    else
    {
      OUTLINED_FUNCTION_84_0();
      v25 = v21;
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_350();
      OUTLINED_FUNCTION_62_3(v10, v25, v11, 4);
      if (v10)
        JUMPOUT(0x1CF70BE30);
      OUTLINED_FUNCTION_15_13();
      v16 = OUTLINED_FUNCTION_96();
      v17 = *(_QWORD *)(v9 + 16);
    }
  }
  else
  {
    v18 = OUTLINED_FUNCTION_9_11();
    sub_1CF70E9C8(v18, v19, v20, 4);
    OUTLINED_FUNCTION_18_13();
  }
  v22 = __OFADD__(v17, 8);
  v23 = v17 + 8;
  if (v22)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v23, 4))
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x1CF70BDF8);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_1CF70BA6C + dword_1CF70BE6C[v26]))(v16);
}

uint64_t sub_1CF70BA7C@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  if (a1 < 0 || (a1 < v7 ? (v15 = a7 < v7) : (v15 = 1), v15))
    JUMPOUT(0x1CF70B6E8);
  v29 = v8;
  if (v14)
  {
    if (v14 == 1)
    {
      if (v13 < (int)v9)
      {
        __break(1u);
        JUMPOUT(0x1CF70BE14);
      }
      OUTLINED_FUNCTION_1_19();
      v16 = OUTLINED_FUNCTION_38_5();
      OUTLINED_FUNCTION_62_3(v16, v17, v18, 8);
      if (v10)
      {
        OUTLINED_FUNCTION_2_2();
        __break(1u);
        JUMPOUT(0x1CF70BE24);
      }
      v19 = OUTLINED_FUNCTION_2_2();
      v20 = v12;
    }
    else
    {
      OUTLINED_FUNCTION_84_0();
      v28 = v24;
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_350();
      OUTLINED_FUNCTION_62_3(v10, v28, v11, 8);
      if (v10)
        JUMPOUT(0x1CF70BE30);
      OUTLINED_FUNCTION_15_13();
      v19 = OUTLINED_FUNCTION_96();
      v20 = *(_QWORD *)(v9 + 16);
    }
  }
  else
  {
    v21 = OUTLINED_FUNCTION_9_11();
    sub_1CF70E9C8(v21, v22, v23, 8);
    OUTLINED_FUNCTION_18_13();
  }
  v25 = __OFADD__(v20, 13);
  v26 = v20 + 13;
  if (v25)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v26, 1))
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x1CF70BE04);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_1CF70BB90 + dword_1CF70BE7C[v29]))(v19);
}

uint64_t sub_1CF70BBA0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  if (a1 < 0 || (a1 < v7 ? (v15 = a7 < v7) : (v15 = 1), v15))
    JUMPOUT(0x1CF70B6E8);
  v29 = v8;
  if (v14)
  {
    if (v14 == 1)
    {
      if (v13 < (int)v9)
      {
        __break(1u);
        JUMPOUT(0x1CF70BE18);
      }
      OUTLINED_FUNCTION_1_19();
      v16 = OUTLINED_FUNCTION_38_5();
      OUTLINED_FUNCTION_63_5(v16, v17, v18, 13);
      if (v10)
      {
        OUTLINED_FUNCTION_2_2();
        __break(1u);
        JUMPOUT(0x1CF70BE24);
      }
      v19 = OUTLINED_FUNCTION_2_2();
      v20 = v12;
    }
    else
    {
      OUTLINED_FUNCTION_84_0();
      v28 = v24;
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_350();
      OUTLINED_FUNCTION_63_5(v10, v28, v11, 13);
      if (v10)
        JUMPOUT(0x1CF70BE30);
      OUTLINED_FUNCTION_15_13();
      v19 = OUTLINED_FUNCTION_96();
      v20 = *(_QWORD *)(v9 + 16);
    }
  }
  else
  {
    v21 = OUTLINED_FUNCTION_9_11();
    sub_1CF70E914(v21, v22, v23, 13);
    OUTLINED_FUNCTION_18_13();
  }
  v25 = __OFADD__(v20, 14);
  v26 = v20 + 14;
  if (v25)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v26, 2))
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x1CF70BE10);
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_1CF70BCB4 + dword_1CF70BE8C[v29]))(v19);
}

void sub_1CF70BCC4(uint64_t a1@<X8>, char a2, int a3, int a4, int a5, int a6, int a7, __int16 a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  __int16 v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (a1 < 0 || (a1 < v10 ? (v18 = a10 < v10) : (v18 = 1), v18))
    JUMPOUT(0x1CF70B6E8);
  if (!v16)
  {
    v24 = OUTLINED_FUNCTION_9_11();
    LOWORD(v23) = OUTLINED_FUNCTION_49_3(v24, v25, v26, 14);
    OUTLINED_FUNCTION_2_2();
LABEL_15:
    *(_WORD *)v12 = v17;
    *(_WORD *)(v12 + 2) = a8;
    *(_DWORD *)(v12 + 4) = a6;
    *(_DWORD *)(v12 + 8) = a4;
    *(_WORD *)(v12 + 12) = v23;
    *(_BYTE *)(v12 + 14) = a2;
    JUMPOUT(0x1CF70B744);
  }
  if (v16 == 1)
  {
    if (v15 < (int)v11)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_1_19();
      v19 = OUTLINED_FUNCTION_38_5();
      v22 = OUTLINED_FUNCTION_19_11(v19, v20, v21, 14);
      if (!v13)
      {
        LOWORD(v23) = v22;
        OUTLINED_FUNCTION_2_2();
LABEL_14:
        OUTLINED_FUNCTION_2_2();
        goto LABEL_15;
      }
    }
    OUTLINED_FUNCTION_2_2();
    __break(1u);
    JUMPOUT(0x1CF70BE24);
  }
  v27 = *(_QWORD *)(v11 + 16);
  v23 = *(_QWORD *)(v11 + 24);
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_350();
  OUTLINED_FUNCTION_19_11(v27, v23, v14 & 0x3FFFFFFFFFFFFFFFLL, 14);
  if (v27)
    JUMPOUT(0x1CF70BE30);
  OUTLINED_FUNCTION_57_7();
  OUTLINED_FUNCTION_96();
  goto LABEL_14;
}

uint64_t sub_1CF70BE9C()
{
  if (OUTLINED_FUNCTION_48_6() >= 16)
    __asm { BR              X9 }
  sub_1CF6AA5E0();
  OUTLINED_FUNCTION_25_8();
  sub_1CF73F348();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_44_6();
  OUTLINED_FUNCTION_11_9();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_178();
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_11_9();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_5_1();
  sub_1CF6ABB3C();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_12_10();
  sub_1CF73F780();
  OUTLINED_FUNCTION_72_4();
  return OUTLINED_FUNCTION_2_2();
}

uint64_t sub_1CF70C158@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  if (a1 < 0 || (a1 < v1 ? (v10 = v3 < v1) : (v10 = 1), v10))
    JUMPOUT(0x1CF70C010);
  if (v8)
  {
    if (v8 == 1)
    {
      if (v7 < (int)v2)
      {
LABEL_19:
        __break(1u);
        JUMPOUT(0x1CF70C3C8);
      }
      OUTLINED_FUNCTION_1_19();
      OUTLINED_FUNCTION_19_11(v6, v7, v4, 2);
      if (v4)
      {
        OUTLINED_FUNCTION_2_2();
        __break(1u);
        JUMPOUT(0x1CF70C3D4);
      }
      v11 = OUTLINED_FUNCTION_2_2();
      v12 = v6;
    }
    else
    {
      v16 = *(_QWORD *)(v2 + 16);
      v15 = *(_QWORD *)(v2 + 24);
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_350();
      OUTLINED_FUNCTION_19_11(v16, v15, v5 & 0x3FFFFFFFFFFFFFFFLL, 2);
      if (v16)
        JUMPOUT(0x1CF70C3E0);
      OUTLINED_FUNCTION_15_13();
      v11 = OUTLINED_FUNCTION_96();
      v12 = *(_QWORD *)(v2 + 16);
    }
  }
  else
  {
    v13 = OUTLINED_FUNCTION_9_11();
    OUTLINED_FUNCTION_49_3(v13, v14, v3, 2);
    OUTLINED_FUNCTION_18_13();
  }
  v17 = __OFADD__(v12, 4);
  v18 = v12 + 4;
  if (v17)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v18, 2))
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_1CF70C270 + dword_1CF70C40C[v9]))(v11);
}

void sub_1CF70C280(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, _WORD *a5)
{
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  __int16 v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a1 < 0 || (a1 < v5 ? (v14 = a3 < v5) : (v14 = 1), v14))
    JUMPOUT(0x1CF70C010);
  v15 = v6;
  if (!v13)
  {
    v18 = OUTLINED_FUNCTION_9_11();
    LOWORD(v17) = OUTLINED_FUNCTION_49_3(v18, v19, v20, 4);
    OUTLINED_FUNCTION_2_2();
LABEL_15:
    *a5 = v15;
    a5[1] = v8;
    a5[2] = v17;
    JUMPOUT(0x1CF70C06CLL);
  }
  if (v13 == 1)
  {
    if (v12 < (int)v7)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_1_19();
      v16 = OUTLINED_FUNCTION_19_11(v11, v12, v9, 4);
      if (!v9)
      {
        LOWORD(v17) = v16;
        OUTLINED_FUNCTION_2_2();
LABEL_14:
        OUTLINED_FUNCTION_2_2();
        goto LABEL_15;
      }
    }
    OUTLINED_FUNCTION_2_2();
    __break(1u);
    JUMPOUT(0x1CF70C3D4);
  }
  v21 = *(_QWORD *)(v7 + 16);
  v17 = *(_QWORD *)(v7 + 24);
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_350();
  OUTLINED_FUNCTION_19_11(v21, v17, v10 & 0x3FFFFFFFFFFFFFFFLL, 4);
  if (v21)
    JUMPOUT(0x1CF70C3E0);
  OUTLINED_FUNCTION_57_7();
  OUTLINED_FUNCTION_96();
  goto LABEL_14;
}

uint64_t sub_1CF70C41C(uint64_t a1, uint64_t a2)
{
  if (sub_1CF73E5C8() >= 16)
    __asm { BR              X9 }
  sub_1CF6AA5E0();
  OUTLINED_FUNCTION_25_8();
  sub_1CF73F348();
  OUTLINED_FUNCTION_64_7();
  OUTLINED_FUNCTION_44_6();
  OUTLINED_FUNCTION_11_9();
  OUTLINED_FUNCTION_64_7();
  OUTLINED_FUNCTION_178();
  OUTLINED_FUNCTION_0_19();
  OUTLINED_FUNCTION_11_9();
  OUTLINED_FUNCTION_64_7();
  OUTLINED_FUNCTION_107();
  OUTLINED_FUNCTION_5_1();
  sub_1CF6ABB3C();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_12_10();
  sub_1CF73F780();
  OUTLINED_FUNCTION_72_4();
  return OUTLINED_FUNCTION_2_2();
}

void sub_1CF70C6C8(uint64_t a1@<X8>, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _BYTE *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  if (a1 < 0 || (a1 < v3 ? (v11 = a3 < v3) : (v11 = 1), v11))
    JUMPOUT(0x1CF70C594);
  if (!v5)
  {
    v16 = sub_1CF70E914(v4, v7 & 0xFFFFFFFFFFFFLL, a3, 1);
    OUTLINED_FUNCTION_2_2();
LABEL_15:
    *v10 = v8;
    v10[1] = v16;
    JUMPOUT(0x1CF70C5F0);
  }
  if (v5 == 1)
  {
    if (v9 < (int)v4)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_1_19();
      v12 = OUTLINED_FUNCTION_38_5();
      v15 = OUTLINED_FUNCTION_63_5(v12, v13, v14, 1);
      if (!v6)
      {
        v16 = v15;
        OUTLINED_FUNCTION_2_2();
LABEL_14:
        OUTLINED_FUNCTION_2_2();
        goto LABEL_15;
      }
    }
    OUTLINED_FUNCTION_2_2();
    __break(1u);
    JUMPOUT(0x1CF70C804);
  }
  v17 = *(_QWORD *)(v4 + 16);
  v18 = *(_QWORD *)(v4 + 24);
  OUTLINED_FUNCTION_121();
  swift_retain();
  v19 = OUTLINED_FUNCTION_63_5(v17, v18, v7 & 0x3FFFFFFFFFFFFFFFLL, 1);
  if (v17)
  {
    while (1)
    {
      swift_release();
      OUTLINED_FUNCTION_96();
      __break(1u);
    }
  }
  v16 = v19;
  swift_release();
  OUTLINED_FUNCTION_96();
  goto LABEL_14;
}

uint64_t sub_1CF70C83C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v7 = *(unsigned __int8 *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  sub_1CF6934BC(a2, a3);
  sub_1CF6E7F0C(40, a2, a3);
  if ((_DWORD)v7 == 6)
  {
    OUTLINED_FUNCTION_35_5();
    sub_1CF70B578();
    OUTLINED_FUNCTION_67_2();
    OUTLINED_FUNCTION_22_6(v8);
    result = OUTLINED_FUNCTION_26_8();
    if (!v14)
    {
      v7 = v13;
      v10 = 0;
      goto LABEL_12;
    }
LABEL_9:
    v10 = v14 | 0x6000000000000000;
    goto LABEL_12;
  }
  if ((_DWORD)v7 == 58)
  {
    v11 = OUTLINED_FUNCTION_35_5();
    sub_1CF70C41C(v11, v12);
    OUTLINED_FUNCTION_67_2();
    OUTLINED_FUNCTION_22_6(v8);
    result = OUTLINED_FUNCTION_26_8();
    if (!v14)
    {
      v7 = (unsigned __int16)v13;
      v10 = 0x4000000000000000;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if ((_DWORD)v7 != 17)
  {
    OUTLINED_FUNCTION_67_2();
    sub_1CF6933C0(v13, v14);
    OUTLINED_FUNCTION_22_6(v8);
    result = OUTLINED_FUNCTION_26_8();
    v10 = 0x8000000000000000;
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_35_5();
  sub_1CF70BE9C();
  OUTLINED_FUNCTION_67_2();
  OUTLINED_FUNCTION_22_6(v8);
  result = OUTLINED_FUNCTION_26_8();
  if (v14)
    goto LABEL_9;
  v7 = v13 | ((unint64_t)WORD2(v13) << 32);
  v10 = 0x2000000000000000;
LABEL_12:
  *a4 = v7;
  a4[1] = v10;
  return result;
}

uint64_t type metadata accessor for TunnelInterfaceParameters()
{
  uint64_t result;

  result = qword_1EFBA3368;
  if (!qword_1EFBA3368)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TunnelPacket.protocolFamily.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t TunnelPacket.length.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(_QWORD))((char *)&loc_1CF70C9E0 + dword_1CF70CA24[*(_QWORD *)(v0 + 88) >> 62]))(0);
}

uint64_t sub_1CF70C9F0()
{
  uint64_t v0;

  return BYTE6(v0);
}

uint64_t TunnelPacket.ipHeader.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *(_BYTE *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 48);
  v6 = *(_QWORD *)(v1 + 56);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 8);
  *(_BYTE *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  sub_1CF6934BC(v3, v4);
  return sub_1CF6934BC(v5, v6);
}

uint64_t TunnelPacket.transportProtocolHeader.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 64);
  v3 = *(_QWORD *)(v1 + 72);
  *a1 = v2;
  a1[1] = v3;
  return sub_1CF6D233C(v2, v3);
}

uint64_t TunnelPacket.packetData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  sub_1CF6934BC(v1, *(_QWORD *)(v0 + 88));
  return v1;
}

uint64_t TunnelPacket.packetData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1CF6933C0(*(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 88));
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = a2;
  return result;
}

uint64_t (*TunnelPacket.packetData.modify())()
{
  return nullsub_1;
}

uint64_t TunnelPacket.init(data:ipHeader:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  __int128 v15;
  _QWORD v16[2];
  char v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;

  v7 = *a3;
  v8 = a3[1];
  v9 = *((_BYTE *)a3 + 16);
  v10 = a3[3];
  v11 = a3[4];
  v12 = a3[5];
  v13 = a3[6];
  sub_1CF6934BC(a1, a2);
  sub_1CF6934BC(v10, v11);
  OUTLINED_FUNCTION_70_4(v12);
  if (qword_1EFBA0998 != -1)
    swift_once();
  if (byte_1EFBB2020 == 1)
  {
    v16[0] = v7;
    v16[1] = v8;
    v17 = v9;
    v18 = v10;
    v19 = v11;
    v20 = v12;
    v21 = v13;
    result = sub_1CF70C83C((uint64_t)v16, a1, a2, (unint64_t *)&v22);
    v15 = v22;
  }
  else
  {
    sub_1CF6933C0(a1, a2);
    OUTLINED_FUNCTION_22_6(v10);
    result = OUTLINED_FUNCTION_23_9(v12);
    v15 = xmmword_1CF743C90;
  }
  *(_DWORD *)a4 = 30;
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)(a4 + 16) = v8;
  *(_BYTE *)(a4 + 24) = v9;
  *(_QWORD *)(a4 + 32) = v10;
  *(_QWORD *)(a4 + 40) = v11;
  *(_QWORD *)(a4 + 48) = v12;
  *(_QWORD *)(a4 + 56) = v13;
  *(_OWORD *)(a4 + 64) = v15;
  *(_QWORD *)(a4 + 80) = a1;
  *(_QWORD *)(a4 + 88) = a2;
  return result;
}

uint64_t TunnelPacket.isValidPacket.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1CF70CC34 + dword_1CF70CC94[*(_QWORD *)(v0 + 88) >> 62]))();
}

BOOL sub_1CF70CC44@<W0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v3 = BYTE6(v1);
  v4 = *(_QWORD *)(v2 + 8);
  v5 = *(_QWORD *)(v2 + 16);
  v6 = __OFADD__(v4, v5);
  v7 = v4 + v5;
  if (v6)
  {
    __break(1u);
    JUMPOUT(0x1CF70CC8CLL);
  }
  return a1 == 30 && v3 == v7;
}

void TunnelPacket.isValidInboundPacket(localInterface:remoteAddress:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(_QWORD *__return_ptr, uint64_t, uint64_t);
  _QWORD v53[4];
  _QWORD v54[3];
  uint64_t v55;
  uint64_t v56;

  v3 = v2;
  v6 = OUTLINED_FUNCTION_148_0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_34();
  v10 = v9 - v8;
  v11 = *(_DWORD *)v2;
  v12 = TunnelPacket.length.getter();
  v13 = v2[1];
  v14 = v2[2];
  v15 = __OFADD__(v13, v14);
  v16 = v13 + v14;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    v51 = a1;
    v46 = v11;
    v17 = v2[4];
    v18 = v2[5];
    v19 = v2[6];
    v20 = v3[7];
    v44 = v12;
    v45 = v16;
    v21 = v7;
    v22 = v6;
    v24 = v3[8];
    v23 = v3[9];
    v25 = v3[10];
    v47 = v21;
    v48 = v22;
    (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v10, a2);
    OUTLINED_FUNCTION_70_4(v17);
    v49 = v19;
    OUTLINED_FUNCTION_44_3(v19);
    sub_1CF6D233C(v24, v23);
    v50 = v25;
    OUTLINED_FUNCTION_54_7(v25);
    if (v46 == 30 && v44 == v45)
    {
      OUTLINED_FUNCTION_70_4(v17);
      v28 = sub_1CF73E994();
      v30 = v29;
      v27 = MEMORY[0x1D17D21A8](v17, v18, v28, v29);
      sub_1CF6933C0(v28, v30);
      OUTLINED_FUNCTION_23_9(v17);
    }
    else
    {
      v27 = 0;
    }
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v10, v48);
    OUTLINED_FUNCTION_23_9(v17);
    sub_1CF6933C0(v49, v20);
    sub_1CF6D2368(v24, v23);
    OUTLINED_FUNCTION_79_3(v50);
    v31 = v3[4];
    v32 = v3[5];
    v33 = v3[6];
    v34 = v3[7];
    v35 = v3[8];
    v36 = v3[9];
    v37 = v3[10];
    v38 = v3[11];
    sub_1CF6ABBB4(v51, (uint64_t)v54);
    if ((v27 & 1) != 0)
    {
      v40 = v55;
      v39 = v56;
      __swift_project_boxed_opaque_existential_0Tm(v54, v55);
      v52 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v39 + 48);
      OUTLINED_FUNCTION_44_3(v31);
      OUTLINED_FUNCTION_54_7(v33);
      sub_1CF6D233C(v35, v36);
      sub_1CF6934BC(v37, v38);
      OUTLINED_FUNCTION_54_7(v33);
      v52(v53, v40, v39);
      __swift_project_boxed_opaque_existential_0Tm(v53, v53[3]);
      v41 = sub_1CF73ECA0();
      v43 = v42;
      MEMORY[0x1D17D21A8](v33, v34, v41, v42);
      OUTLINED_FUNCTION_55_3(v33);
      sub_1CF6933C0(v41, v43);
      sub_1CF6933C0(v31, v32);
      OUTLINED_FUNCTION_55_3(v33);
      sub_1CF6D2368(v35, v36);
      OUTLINED_FUNCTION_22_6(v37);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v53);
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v54);
    OUTLINED_FUNCTION_17();
  }
}

void TunnelPacket.isValidOutboundPacket(localInterface:remoteAddress:)(uint64_t a1)
{
  int *v1;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD v26[4];
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;

  v3 = OUTLINED_FUNCTION_148_0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_16_7();
  v5 = *v1;
  v6 = TunnelPacket.length.getter();
  v7 = *((_QWORD *)v1 + 1);
  v8 = *((_QWORD *)v1 + 2);
  v9 = v7 + v8;
  if (!__OFADD__(v7, v8))
  {
    v10 = v6;
    v12 = *((_QWORD *)v1 + 4);
    v11 = *((_QWORD *)v1 + 5);
    v23 = *((_QWORD *)v1 + 7);
    v22 = *((_QWORD *)v1 + 8);
    v13 = *((_QWORD *)v1 + 10);
    v24 = *((_QWORD *)v1 + 6);
    v25 = *((_QWORD *)v1 + 11);
    sub_1CF6ABBB4(a1, (uint64_t)v27);
    if (v5 == 30 && v10 == v9)
    {
      v15 = v28;
      v16 = v29;
      __swift_project_boxed_opaque_existential_0Tm(v27, v28);
      v17 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v16 + 48);
      OUTLINED_FUNCTION_41_7();
      sub_1CF6934BC(v24, v23);
      OUTLINED_FUNCTION_87_3(v22);
      sub_1CF6934BC(v13, v25);
      OUTLINED_FUNCTION_41_7();
      v17(v26, v15, v16);
      __swift_project_boxed_opaque_existential_0Tm(v26, v26[3]);
      v18 = sub_1CF73ECA0();
      LOBYTE(v16) = MEMORY[0x1D17D21A8](v12, v11, v18, v19);
      OUTLINED_FUNCTION_42_7();
      OUTLINED_FUNCTION_22_6(v18);
      OUTLINED_FUNCTION_42_7();
      sub_1CF6933C0(v24, v23);
      sub_1CF6D2368(v22, v4);
      sub_1CF6933C0(v13, v25);
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v26);
      OUTLINED_FUNCTION_32_5();
      if ((v16 & 1) != 0)
      {
        OUTLINED_FUNCTION_41_7();
        OUTLINED_FUNCTION_44_3(v24);
        OUTLINED_FUNCTION_87_3(v22);
        sub_1CF6934BC(v13, v25);
        OUTLINED_FUNCTION_44_3(v24);
        v20 = sub_1CF73E994();
        MEMORY[0x1D17D21A8](v24, v23, v20, v21);
        OUTLINED_FUNCTION_79_3(v20);
        OUTLINED_FUNCTION_65_3();
        OUTLINED_FUNCTION_93(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
        OUTLINED_FUNCTION_42_7();
        OUTLINED_FUNCTION_65_3();
        sub_1CF6D2368(v22, v4);
        sub_1CF6933C0(v13, v25);
LABEL_10:
        OUTLINED_FUNCTION_17();
        return;
      }
    }
    else
    {
      OUTLINED_FUNCTION_32_5();
    }
    OUTLINED_FUNCTION_93(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t ReadPacketGroup.packets.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ReadPacketGroup.finalize.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_retain();
  return v1;
}

uint64_t sub_1CF70D1D8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x73736572646461 && a2 == 0xE700000000000000;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6B73616D74656ELL && a2 == 0xE700000000000000;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 7697517 && a2 == 0xE300000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_1CF73F690();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1CF70D31C(char a1)
{
  if (!a1)
    return 0x73736572646461;
  if (a1 == 1)
    return 0x6B73616D74656ELL;
  return 7697517;
}

uint64_t sub_1CF70D36C()
{
  char *v0;

  return sub_1CF70D31C(*v0);
}

uint64_t sub_1CF70D374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF70D1D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF70D398()
{
  sub_1CF70D51C();
  return sub_1CF73F864();
}

uint64_t sub_1CF70D3C0()
{
  sub_1CF70D51C();
  return sub_1CF73F870();
}

void TunnelInterfaceParameters.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA32F8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_99();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1CF70D51C();
  sub_1CF73F858();
  OUTLINED_FUNCTION_148_0();
  sub_1CF70D7F0(&qword_1EFBA2520, (uint64_t)&protocol conformance descriptor for IPv6Address);
  OUTLINED_FUNCTION_31_5();
  if (!v1)
  {
    OUTLINED_FUNCTION_149_0();
    OUTLINED_FUNCTION_31_5();
    sub_1CF73F618();
  }
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF70D51C()
{
  unint64_t result;

  result = qword_1EFBA3300;
  if (!qword_1EFBA3300)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7474CC, &type metadata for TunnelInterfaceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3300);
  }
  return result;
}

void TunnelInterfaceParameters.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  void (*v20)(uint64_t, char *, uint64_t);
  char *v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char v34;
  char v35;
  char v36;

  v27 = a2;
  v30 = OUTLINED_FUNCTION_148_0();
  v28 = *(_QWORD *)(v30 - 8);
  v3 = MEMORY[0x1E0C80A78](v30);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v29 = (char *)&v24 - v6;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3308);
  v7 = *(_QWORD *)(v31 - 8);
  MEMORY[0x1E0C80A78](v31);
  OUTLINED_FUNCTION_34();
  v10 = v9 - v8;
  v11 = OUTLINED_FUNCTION_149_0();
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_34();
  v15 = v14 - v13;
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1CF70D51C();
  v32 = v10;
  v16 = (uint64_t)v33;
  sub_1CF73F840();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  else
  {
    v25 = v5;
    v26 = v7;
    v33 = a1;
    v24 = v11;
    v17 = v15;
    v36 = 0;
    sub_1CF70D7F0(&qword_1EFBA24F0, (uint64_t)&protocol conformance descriptor for IPv6Address);
    v18 = v29;
    v19 = v30;
    OUTLINED_FUNCTION_43_7();
    v20 = *(void (**)(uint64_t, char *, uint64_t))(v28 + 32);
    v20(v17, v18, v19);
    v35 = 1;
    v21 = v25;
    OUTLINED_FUNCTION_43_7();
    v22 = v24;
    v20(v17 + *(int *)(v24 + 20), v21, v19);
    v34 = 2;
    v23 = sub_1CF73F54C();
    OUTLINED_FUNCTION_14_10();
    *(_WORD *)(v17 + *(int *)(v22 + 24)) = v23;
    sub_1CF70D82C(v17, v27);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v33);
    sub_1CF70D870(v17);
  }
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF70D7F0(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = sub_1CF73E9AC();
    atomic_store(MEMORY[0x1D17D3DEC](a2, v4), a1);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF70D82C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TunnelInterfaceParameters();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CF70D870(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TunnelInterfaceParameters();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1CF70D8AC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  TunnelInterfaceParameters.init(from:)(a1, a2);
}

void sub_1CF70D8C0(_QWORD *a1)
{
  TunnelInterfaceParameters.encode(to:)(a1);
}

uint64_t destroy for TunnelPacket(_QWORD *a1)
{
  unint64_t v2;

  sub_1CF6933C0(a1[4], a1[5]);
  sub_1CF6933C0(a1[6], a1[7]);
  v2 = a1[9];
  if (v2 >> 60 != 15)
    sub_1CF6D237C(a1[8], v2);
  return sub_1CF6933C0(a1[10], a1[11]);
}

uint64_t initializeWithCopy for TunnelPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  sub_1CF6934BC(v4, v5);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 56);
  sub_1CF6934BC(v6, v7);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  v8 = (uint64_t *)(a2 + 64);
  v9 = *(_QWORD *)(a2 + 72);
  if (v9 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 64) = *(_OWORD *)v8;
  }
  else
  {
    v10 = *v8;
    sub_1CF6D2350(*v8, *(_QWORD *)(a2 + 72));
    *(_QWORD *)(a1 + 64) = v10;
    *(_QWORD *)(a1 + 72) = v9;
  }
  v12 = *(_QWORD *)(a2 + 80);
  v11 = *(_QWORD *)(a2 + 88);
  sub_1CF6934BC(v12, v11);
  *(_QWORD *)(a1 + 80) = v12;
  *(_QWORD *)(a1 + 88) = v11;
  return a1;
}

uint64_t assignWithCopy for TunnelPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  sub_1CF6934BC(v4, v5);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = v5;
  sub_1CF6933C0(v6, v7);
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a2 + 56);
  sub_1CF6934BC(v8, v9);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  sub_1CF6933C0(v10, v11);
  v12 = (uint64_t *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  if (*(_QWORD *)(a1 + 72) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      v15 = *v12;
      sub_1CF6D2350(*v12, *(_QWORD *)(a2 + 72));
      v16 = *(_QWORD *)(a1 + 64);
      v17 = *(_QWORD *)(a1 + 72);
      *(_QWORD *)(a1 + 64) = v15;
      *(_QWORD *)(a1 + 72) = v13;
      sub_1CF6D237C(v16, v17);
      goto LABEL_8;
    }
    sub_1CF70DAFC(a1 + 64);
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 64) = *(_OWORD *)v12;
    goto LABEL_8;
  }
  v14 = *v12;
  sub_1CF6D2350(*v12, *(_QWORD *)(a2 + 72));
  *(_QWORD *)(a1 + 64) = v14;
  *(_QWORD *)(a1 + 72) = v13;
LABEL_8:
  v19 = *(_QWORD *)(a2 + 80);
  v18 = *(_QWORD *)(a2 + 88);
  sub_1CF6934BC(v19, v18);
  v20 = *(_QWORD *)(a1 + 80);
  v21 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 80) = v19;
  *(_QWORD *)(a1 + 88) = v18;
  sub_1CF6933C0(v20, v21);
  return a1;
}

uint64_t sub_1CF70DAFC(uint64_t a1)
{
  destroy for TunnelPacket.TransportProtocolHeader(a1);
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t assignWithTake for TunnelPacket(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  sub_1CF6933C0(v4, v5);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_1CF6933C0(v6, v7);
  v8 = (_QWORD *)(a2 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  if (v9 >> 60 != 15)
  {
    v10 = *(_QWORD *)(a2 + 72);
    if (v10 >> 60 != 15)
    {
      v11 = *(_QWORD *)(a1 + 64);
      *(_QWORD *)(a1 + 64) = *v8;
      *(_QWORD *)(a1 + 72) = v10;
      sub_1CF6D237C(v11, v9);
      goto LABEL_6;
    }
    sub_1CF70DAFC(a1 + 64);
  }
  *(_OWORD *)(a1 + 64) = *(_OWORD *)v8;
LABEL_6:
  v12 = *(_QWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 88);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  sub_1CF6933C0(v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelPacket(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 96))
    {
      v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      v2 = (((*(_QWORD *)(a1 + 40) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 40) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 96) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 96) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 40) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for TunnelPacket()
{
  OUTLINED_FUNCTION_31();
}

_QWORD *__swift_memcpy15_4(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)((char *)result + 7) = *(uint64_t *)((char *)a2 + 7);
  *result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.TCPSegmentHeader(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 15))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.TCPSegmentHeader(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 14) = 0;
    *(_WORD *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 15) = v3;
  return result;
}

void type metadata accessor for TunnelPacket.TCPSegmentHeader()
{
  OUTLINED_FUNCTION_31();
}

uint64_t __swift_memcpy6_2(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_WORD *)(result + 4) = *((_WORD *)a2 + 2);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.UDPDatagramHeader(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 6))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.UDPDatagramHeader(uint64_t result, int a2, int a3)
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

void type metadata accessor for TunnelPacket.UDPDatagramHeader()
{
  OUTLINED_FUNCTION_31();
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.ICMPv6Header(unsigned __int16 *a1, int a2)
{
  int v2;
  int v3;
  int v4;

  if (!a2)
    return 0;
  if ((a2 + 0xFFFF) <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if ((a2 + 0xFFFF) < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 0xFFFF;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        return 0;
      return (*a1 | (v4 << 16)) - 0xFFFF;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 0xFFFF;
  }
  return 0;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.ICMPv6Header(_WORD *a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 0xFFFF) <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if ((a3 + 0xFFFF) < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (!a2)
    return ((uint64_t (*)(void))((char *)sub_1CF70DE88 + 4 * byte_1CF7470B5[v4]))();
  *a1 = a2 - 1;
  return ((uint64_t (*)(void))((char *)sub_1CF70DE68 + 4 * asc_1CF7470B0[v4]))();
}

uint64_t sub_1CF70DE68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1CF70DE88(uint64_t result)
{
  *(_BYTE *)(result + 2) = 0;
  return result;
}

uint64_t sub_1CF70DE90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1CF70DE98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1CF70DEA0(uint64_t result)
{
  *(_WORD *)(result + 2) = 0;
  return result;
}

uint64_t sub_1CF70DEA8(uint64_t result)
{
  *(_DWORD *)(result + 2) = 0;
  return result;
}

void type metadata accessor for TunnelPacket.ICMPv6Header()
{
  OUTLINED_FUNCTION_31();
}

uint64_t *initializeBufferWithCopyOfBuffer for TunnelPacket.TransportProtocolHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_1CF6D2350(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

void destroy for TunnelPacket.TransportProtocolHeader(uint64_t a1)
{
  sub_1CF6D237C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *assignWithCopy for TunnelPacket.TransportProtocolHeader(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_1CF6D2350(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1CF6D237C(v5, v6);
  return a1;
}

uint64_t *assignWithTake for TunnelPacket.TransportProtocolHeader(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1CF6D237C(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelPacket.TransportProtocolHeader(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xC && *(_BYTE *)(a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 11;
    }
    else
    {
      v2 = (((*(_QWORD *)(a1 + 8) >> 60) >> 1) & 0xFFFFFFF7 | (8
                                                                           * ((*(_QWORD *)(a1 + 8) & 0x1000000000000000) != 0))) ^ 0xF;
      if (v2 >= 0xB)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for TunnelPacket.TransportProtocolHeader(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)result = a2 - 12;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 3) & 1) - 2 * a2) << 60;
    }
  }
  return result;
}

uint64_t sub_1CF70E01C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) >> 61;
}

uint64_t sub_1CF70E028(uint64_t result)
{
  *(_QWORD *)(result + 8) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_1CF70E038(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 8) = *(_QWORD *)(result + 8) & 0xFFFFFFFFFFFFFFFLL | (a2 << 61);
  return result;
}

void type metadata accessor for TunnelPacket.TransportProtocolHeader()
{
  OUTLINED_FUNCTION_31();
}

uint64_t destroy for ReadPacketGroup()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

void type metadata accessor for ReadPacketGroup()
{
  OUTLINED_FUNCTION_31();
}

void _s19RemotePairingDevice15ReadPacketGroupVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_1();
}

_QWORD *_s19RemotePairingDevice15ReadPacketGroupVwca_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_11();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_retain();
  swift_release();
  return a1;
}

void _s19RemotePairingDevice15ReadPacketGroupVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v4;
  swift_release();
  OUTLINED_FUNCTION_1();
}

void type metadata accessor for ReadPacketDataGroup()
{
  OUTLINED_FUNCTION_31();
}

void *__swift_memcpy89_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x59uLL);
}

uint64_t getEnumTagSinglePayload for TunnelInterfaceStatistics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 89))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TunnelInterfaceStatistics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
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
  *(_BYTE *)(result + 89) = v3;
  return result;
}

void type metadata accessor for TunnelInterfaceStatistics()
{
  OUTLINED_FUNCTION_31();
}

uint64_t dispatch thunk of static TunnelInterface.defaultMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static TunnelInterface.minSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static TunnelInterface.maxSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static TunnelInterface.maxSupportedPendingPackets.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TunnelInterface.interfaceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TunnelInterface.address.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TunnelInterface.init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t))(a9 + 56))(a1, a2, a3, a4 & 0x1FFFF, a5 | ((HIDWORD(a5) & 1) << 32));
}

uint64_t dispatch thunk of TunnelInterface.writePackets(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of TunnelInterface.readPackets(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of TunnelInterface.getInterfaceStatistics()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t *initializeBufferWithCopyOfBuffer for TunnelInterfaceParameters(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF73E9AC();
    v8 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, a2, v7);
    v8((uint64_t *)((char *)a1 + *(int *)(a3 + 20)), (uint64_t *)((char *)a2 + *(int *)(a3 + 20)), v7);
    *(_WORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_WORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);

  v4 = sub_1CF73E9AC();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v6(a1, v4);
  return ((uint64_t (*)(uint64_t, uint64_t))v6)(a1 + *(int *)(a2 + 20), v4);
}

uint64_t initializeWithCopy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1CF73E9AC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1CF73E9AC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1CF73E9AC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for TunnelInterfaceParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v6 = sub_1CF73E9AC();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v7(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20), v6);
  *(_WORD *)(a1 + *(int *)(a3 + 24)) = *(_WORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for TunnelInterfaceParameters()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF70E594(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_148_0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for TunnelInterfaceParameters()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF70E5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_148_0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_1CF70E604()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CF73E9AC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void type metadata accessor for TunnelPacket.TCPSegmentHeader.Flags()
{
  OUTLINED_FUNCTION_31();
}

uint64_t storeEnumTagSinglePayload for TunnelInterfaceParameters.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF70E6D4 + 4 * byte_1CF7470BF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1CF70E708 + 4 * byte_1CF7470BA[v4]))();
}

uint64_t sub_1CF70E708(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF70E710(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF70E718);
  return result;
}

uint64_t sub_1CF70E724(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF70E72CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1CF70E730(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF70E738(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TunnelInterfaceParameters.CodingKeys()
{
  return &type metadata for TunnelInterfaceParameters.CodingKeys;
}

unint64_t sub_1CF70E758()
{
  unint64_t result;

  result = qword_1EFBA33A8;
  if (!qword_1EFBA33A8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7472EC, &type metadata for TunnelInterfaceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA33A8);
  }
  return result;
}

unint64_t sub_1CF70E798()
{
  unint64_t result;

  result = qword_1EFBA33B0;
  if (!qword_1EFBA33B0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF747344, &unk_1E8CA08E8);
    atomic_store(result, (unint64_t *)&qword_1EFBA33B0);
  }
  return result;
}

unint64_t sub_1CF70E7D8()
{
  unint64_t result;

  result = qword_1EFBA33B8;
  if (!qword_1EFBA33B8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF747314, &unk_1E8CA08E8);
    atomic_store(result, (unint64_t *)&qword_1EFBA33B8);
  }
  return result;
}

unint64_t sub_1CF70E818()
{
  unint64_t result;

  result = qword_1EFBA33C0;
  if (!qword_1EFBA33C0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74736C, &unk_1E8CA08E8);
    atomic_store(result, (unint64_t *)&qword_1EFBA33C0);
  }
  return result;
}

unint64_t sub_1CF70E858()
{
  unint64_t result;

  result = qword_1EFBA33C8;
  if (!qword_1EFBA33C8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7473A4, &unk_1E8CA08E8);
    atomic_store(result, (unint64_t *)&qword_1EFBA33C8);
  }
  return result;
}

unint64_t sub_1CF70E898()
{
  unint64_t result;

  result = qword_1EFBA33D0;
  if (!qword_1EFBA33D0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74725C, &type metadata for TunnelInterfaceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA33D0);
  }
  return result;
}

unint64_t sub_1CF70E8D8()
{
  unint64_t result;

  result = qword_1EFBA33D8;
  if (!qword_1EFBA33D8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF747284, &type metadata for TunnelInterfaceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA33D8);
  }
  return result;
}

uint64_t sub_1CF70E914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  __int16 v6;
  char v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = BYTE2(a2);
  v8 = BYTE3(a2);
  v9 = BYTE4(a2);
  v10 = BYTE5(a2);
  return *((unsigned __int8 *)&v5 + a4);
}

uint64_t sub_1CF70E9C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  __int16 v6;
  char v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = BYTE2(a2);
  v8 = BYTE3(a2);
  v9 = BYTE4(a2);
  v10 = BYTE5(a2);
  return bswap32(*(_DWORD *)((char *)&v5 + a4));
}

uint64_t sub_1CF70EA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v6 = sub_1CF73E430();
  if (v6)
  {
    v7 = v6;
    result = sub_1CF73E454();
    if (__OFSUB__(a1, result))
    {
      __break(1u);
      goto LABEL_8;
    }
    v9 = v7 + a1 - result;
  }
  else
  {
    v9 = 0;
  }
  result = sub_1CF73E448();
  if (v9)
    return *(unsigned __int8 *)(v9 + a4);
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_1CF70EAF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v6 = sub_1CF73E430();
  if (v6)
  {
    v7 = v6;
    result = sub_1CF73E454();
    if (__OFSUB__(a1, result))
    {
      __break(1u);
      goto LABEL_8;
    }
    v9 = v7 + a1 - result;
  }
  else
  {
    v9 = 0;
  }
  result = sub_1CF73E448();
  if (v9)
    return bswap32(*(_DWORD *)(v9 + a4));
LABEL_8:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_19_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CF6E1C78(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_21_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_22_6(uint64_t a1)
{
  unint64_t v1;

  return sub_1CF6933C0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_25_8()
{
  return sub_1CF73F738();
}

uint64_t OUTLINED_FUNCTION_26_8()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6933C0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_27_9()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6933C0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_31_5()
{
  return sub_1CF73F5F4();
}

uint64_t OUTLINED_FUNCTION_35_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_38_5()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_39_5(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1CF6AF714(v1, a1);
}

uint64_t OUTLINED_FUNCTION_41_7()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6934BC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_42_7()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6933C0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_45_8()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6934BC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_47_7()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6934BC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_48_6()
{
  return sub_1CF73E5C8();
}

uint64_t OUTLINED_FUNCTION_53_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_54_7(uint64_t a1)
{
  unint64_t v1;

  return sub_1CF6934BC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_55_3(uint64_t a1)
{
  unint64_t v1;

  return sub_1CF6933C0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_57_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_62_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CF70EAF4(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_63_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CF70EA80(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_64_7()
{
  return sub_1CF73EF58();
}

void OUTLINED_FUNCTION_67_4(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2;
}

void OUTLINED_FUNCTION_68_5(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_70_4(uint64_t a1)
{
  unint64_t v1;

  return sub_1CF6934BC(a1, v1);
}

uint64_t OUTLINED_FUNCTION_71_5()
{
  return sub_1CF73E454();
}

uint64_t OUTLINED_FUNCTION_75_3()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1CF6934BC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_77_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF70EA80(a1, a2, a3, 0);
}

uint64_t OUTLINED_FUNCTION_79_3(uint64_t a1)
{
  unint64_t v1;

  return sub_1CF6933C0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_81_2()
{
  return sub_1CF73E5C8();
}

uint64_t OUTLINED_FUNCTION_85_2()
{
  return 0x73726F727245;
}

uint64_t OUTLINED_FUNCTION_86_2()
{
  return 0x74656B636150;
}

void OUTLINED_FUNCTION_88_1(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
}

uint64_t sub_1CF70ED8C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v10 = MEMORY[0x1E0DEE9D8];
    sub_1CF6A2F98();
    v2 = v10;
    v4 = (unint64_t *)(a1 + 120);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      sub_1CF6934BC(v5, *v4);
      v7 = *(_QWORD *)(v10 + 16);
      if (v7 >= *(_QWORD *)(v10 + 24) >> 1)
        sub_1CF6A2F98();
      v4 += 12;
      *(_QWORD *)(v10 + 16) = v7 + 1;
      v8 = v10 + 16 * v7;
      *(_QWORD *)(v8 + 32) = v5;
      *(_QWORD *)(v8 + 40) = v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1CF70EE64()
{
  uint64_t result;

  sub_1CF6B3208(0, (unint64_t *)&qword_1ED8F7A60);
  result = sub_1CF73F270();
  qword_1EFBA33E0 = result;
  return result;
}

uint64_t sub_1CF70EEDC()
{
  uint64_t result;
  __int16 v1;

  if (qword_1EFBA09B0 != -1)
    swift_once();
  result = swift_beginAccess();
  if (byte_1EFBA33EA)
    v1 = 16032;
  else
    v1 = 4096;
  word_1EFBA33E8 = v1;
  return result;
}

uint64_t sub_1CF70EF5C()
{
  uint64_t result;

  result = sub_1CF70EF7C();
  byte_1EFBA33EA = result & 1;
  return result;
}

uint64_t sub_1CF70EF7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_1CF73ED60();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SkywalkChannelVirtualInterface();
  sub_1CF6B3208(0, (unint64_t *)&qword_1ED8F7A30);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF540], v0);
  v4 = (void *)sub_1CF73F198();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v5 = sub_1CF70F1B4();

  if (!v5)
  {
    sub_1CF73F0E4();
    if (qword_1EFBA09A0 != -1)
      swift_once();
    sub_1CF73E694();
    return 0;
  }
  if (!NEVirtualInterfaceSetMTU())
  {
    sub_1CF73F0E4();
    if (qword_1EFBA09A0 != -1)
      swift_once();
    sub_1CF73E694();
    swift_release();
    return 0;
  }
  NEVirtualInterfaceInvalidate();
  sub_1CF73F0E4();
  if (qword_1EFBA09A0 != -1)
    swift_once();
  sub_1CF73E694();
  swift_release();
  return 1;
}

uint64_t sub_1CF70F1B4()
{
  void *v0;
  uint64_t NexusExtendedWithOptions;
  uint64_t result;

  sub_1CF73EE44();
  sub_1CF6AEB58();
  sub_1CF6AEB58();
  v0 = (void *)sub_1CF73EE14();
  swift_bridgeObjectRelease();
  NexusExtendedWithOptions = NEVirtualInterfaceCreateNexusExtendedWithOptions();

  result = 0;
  if (NexusExtendedWithOptions)
  {
    type metadata accessor for _ManagedOpaqueCFTypeWrapper();
    swift_allocObject();
    return _ManagedOpaqueCFTypeWrapper.init(retainedValue:)(NexusExtendedWithOptions);
  }
  return result;
}

uint64_t static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.getter()
{
  if (qword_1EFBA09B0 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_4();
  return byte_1EFBA33EA;
}

uint64_t static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.setter(char a1)
{
  uint64_t result;

  if (qword_1EFBA09B0 != -1)
    swift_once();
  result = swift_beginAccess();
  byte_1EFBA33EA = a1 & 1;
  return result;
}

void static SkywalkChannelVirtualInterface.wideSkywalkChannelSupported.modify()
{
  if (qword_1EFBA09B0 != -1)
    swift_once();
  swift_beginAccess();
  OUTLINED_FUNCTION_1();
}

uint64_t static SkywalkChannelVirtualInterface.minSupportedMTU.getter()
{
  return 1280;
}

uint64_t sub_1CF70F450()
{
  uint64_t result;

  if (qword_1EFBA09A8 != -1)
    result = swift_once();
  if ((((unsigned __int16)word_1EFBA33E8 - 32) & 0xFFFF0000) != 0)
    __break(1u);
  else
    word_1EFBA33EC = word_1EFBA33E8 - 32;
  return result;
}

uint64_t static SkywalkChannelVirtualInterface.maxSupportedMTU.getter()
{
  if (qword_1EFBA09B8 != -1)
    swift_once();
  return (unsigned __int16)word_1EFBA33EC;
}

void static SkywalkChannelVirtualInterface.maxSupportedPendingPackets.getter()
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
  __int128 v16;
  __int128 v17;
  char v18;

  if (qword_1EFBA0800 != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_13_3(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, v14, v15, v16, v17, v18);
  v8 = sub_1CF695A1C();
  OUTLINED_FUNCTION_53_0(v8, v9, v10, v11);
  OUTLINED_FUNCTION_24();
}

void static SkywalkChannelVirtualInterface.defaultMTU.getter()
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
  __int128 v16[2];
  char v17;

  if (qword_1EFBA0808 != -1)
    swift_once();
  v0 = OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_13_3(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, v14, v15, v16[0], v16[1], v17);
  v8 = sub_1CF695A1C();
  OUTLINED_FUNCTION_53_0(v8, v9, v10, v11);
  if ((v16 & 1) == 0 && !((unint64_t)&qword_1EFBA1060 >> 16))
  {
    if (qword_1EFBA09B8 == -1)
      goto LABEL_8;
    goto LABEL_9;
  }
  if (qword_1EFBA09B8 != -1)
LABEL_9:
    swift_once();
LABEL_8:
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1CF70F658()
{
  uint64_t v0;
  uint64_t result;

  v0 = nw_context_create();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_scheduling_mode();
  result = nw_context_activate();
  qword_1EFBA33F0 = v0;
  return result;
}

void SkywalkChannelVirtualInterface.interfaceName.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1();
}

uint64_t SkywalkChannelVirtualInterface.address.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CF6ABBB4(v1 + 32, a1);
}

void SkywalkChannelVirtualInterface.__allocating_init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(void *a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  swift_allocObject();
  SkywalkChannelVirtualInterface.init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(a1, a2, a3, a4 & 0x1FFFF, a5 | ((HIDWORD(a5) & 1) << 32), a6, a7);
  OUTLINED_FUNCTION_0_0();
}

void SkywalkChannelVirtualInterface.init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char v19;
  char v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  os_log_type_t v28;
  NSObject *v29;
  uint8_t *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  ValueMetadata *v40;
  uint64_t v41;
  os_log_type_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  ValueMetadata *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v64;
  ValueMetadata *v65;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  int v72;
  char v73;

  v9 = v7;
  v13 = *(_QWORD *)v7;
  v14 = sub_1CF73ED48();
  v61 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_99();
  *(_QWORD *)(v7 + 152) = 0;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 104) = 0u;
  *(_QWORD *)(v7 + 120) = 0;
  if (qword_1EFBA0810 != -1)
    swift_once();
  swift_beginAccess();
  v16 = qword_1EFBA1088;
  v17 = unk_1EFBA1090;
  v18 = byte_1EFBA1098;
  OUTLINED_FUNCTION_296();
  sub_1CF68DC58(v16, v17, v18);
  v20 = v19;
  OUTLINED_FUNCTION_150();
  if ((v20 & 1) != 0)
  {
    sub_1CF710380(a2, a1);
    v21 = *(void **)(v9 + 152);
    *(_QWORD *)(v9 + 152) = v22;

  }
  if ((a4 & 0x10000) != 0)
  {
    static SkywalkChannelVirtualInterface.defaultMTU.getter();
    a4 = v23;
  }
  if ((((unsigned __int16)a4 + 32) & 0x10000) != 0)
  {
    __break(1u);
LABEL_52:
    swift_once();
LABEL_11:
    *(_QWORD *)(v9 + 144) = qword_1EFBA33F0;
    v73 = 0;
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_296();
    sub_1CF73F348();
    swift_bridgeObjectRelease();
    v68 = 0xD000000000000029;
    v69 = 0x80000001CF752B40;
    sub_1CF73EF58();
    sub_1CF73EF1C();
    swift_bridgeObjectRelease();
    v27 = os_transaction_create();
    swift_release();
    if (v27)
    {
      v59 = v17;
      v58 = v27;
      if (a7)
      {
        v28 = sub_1CF73F0E4();
        if (qword_1EFBA09A0 != -1)
          swift_once();
        v29 = qword_1EFBA33E0;
        if (os_log_type_enabled((os_log_t)qword_1EFBA33E0, v28))
        {
          swift_bridgeObjectRetain_n();
          v30 = (uint8_t *)OUTLINED_FUNCTION_4_7();
          v68 = OUTLINED_FUNCTION_4_7();
          *(_DWORD *)v30 = 136446210;
          OUTLINED_FUNCTION_54_0();
          OUTLINED_FUNCTION_23_10();
          v70 = v31;
          sub_1CF73F2A0();
          OUTLINED_FUNCTION_31_0();
          _os_log_impl(&dword_1CF67E000, v29, v28, "Physical interface name is:%{public}s", v30, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0_1();
        }
        v32 = (void *)sub_1CF73EEB0();
        v33 = NEVirtualInterfaceSetDelegateInterface();

        if ((_DWORD)v33)
        {
          v34 = sub_1CF73F0E4();
          if (OUTLINED_FUNCTION_33_7(v34))
          {
            OUTLINED_FUNCTION_54_0();
            v35 = (uint8_t *)OUTLINED_FUNCTION_4_7();
            v68 = OUTLINED_FUNCTION_4_7();
            *(_DWORD *)v35 = 136315138;
            OUTLINED_FUNCTION_54_0();
            OUTLINED_FUNCTION_23_10();
            OUTLINED_FUNCTION_22_7(v36);
            OUTLINED_FUNCTION_31_0();
            v37 = "Assigned %s as the delegate interface on virtual interface successfully";
            goto LABEL_29;
          }
        }
        else
        {
          v42 = sub_1CF73F0D8();
          if (OUTLINED_FUNCTION_33_7(v42))
          {
            OUTLINED_FUNCTION_54_0();
            v35 = (uint8_t *)OUTLINED_FUNCTION_4_7();
            v68 = OUTLINED_FUNCTION_4_7();
            *(_DWORD *)v35 = 136315138;
            OUTLINED_FUNCTION_54_0();
            OUTLINED_FUNCTION_23_10();
            OUTLINED_FUNCTION_22_7(v43);
            OUTLINED_FUNCTION_31_0();
            v37 = "Failed to set %s as the delegate interface on virtual interface";
LABEL_29:
            _os_log_impl(&dword_1CF67E000, v33, v28, v37, v35, 0xCu);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_0_1();
          }
        }
        OUTLINED_FUNCTION_40_0();
      }
      else
      {
        sub_1CF73F0E4();
        if (qword_1EFBA09A0 != -1)
          swift_once();
        sub_1CF73E694();
      }
      sub_1CF6ABBB4(a2, (uint64_t)&v68);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1F38);
      OUTLINED_FUNCTION_53_6();
      sub_1CF6ABBB4(a3, (uint64_t)&v68);
      OUTLINED_FUNCTION_53_6();
      v44 = (void *)sub_1CF73EEB0();
      v45 = v14;
      v46 = (void *)sub_1CF73EEB0();
      v47 = NEVirtualInterfaceAddAddress();

      if (!v47)
      {
        OUTLINED_FUNCTION_150();
        sub_1CF6AA5E0();
        OUTLINED_FUNCTION_3_0();
        sub_1CF73F774();
        v70 = v68;
        v71 = v69;
        sub_1CF73F348();
        OUTLINED_FUNCTION_129_0();
        sub_1CF73EF58();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_129_0();
        sub_1CF73EF58();
        OUTLINED_FUNCTION_40_0();
        OUTLINED_FUNCTION_39_3(0x6F742027u);
        sub_1CF73EF58();
        sub_1CF6ABB3C();
        OUTLINED_FUNCTION_105();
        v40 = &type metadata for RemotePairingError;
        sub_1CF73F780();
        OUTLINED_FUNCTION_30_6();
        OUTLINED_FUNCTION_18_14();
        sub_1CF710A88(&v73, v13, v59);
        OUTLINED_FUNCTION_150();
        swift_release();
        OUTLINED_FUNCTION_57_5();
        OUTLINED_FUNCTION_55_4();
        v14 = v45;
        goto LABEL_42;
      }
      OUTLINED_FUNCTION_40_0();
      swift_bridgeObjectRelease();
      v14 = v45;
      v17 = v59;
      if (NEVirtualInterfaceSetRankNever())
      {
        if (NEVirtualInterfaceUpdateAdHocService() && NEVirtualInterfaceSetMTU())
        {
          if ((a5 & 0x100000000) != 0 || NEVirtualInterfaceSetMaxPendingPackets())
          {
            *(_QWORD *)(v9 + 16) = v13;
            *(_QWORD *)(v9 + 24) = v59;
            v48 = OUTLINED_FUNCTION_73();
            sub_1CF6ABBB4(v48, v49);
            *(_QWORD *)(v9 + 72) = v45;
            *(_QWORD *)(v9 + 80) = v64;
            *(_QWORD *)(v9 + 128) = v58;
            OUTLINED_FUNCTION_296();
            swift_retain();
            v40 = v64;
            swift_unknownObjectRetain();
            swift_unknownObjectRetain();
            v50 = sub_1CF710C40();
            if (!v62)
            {
              v51 = (uint64_t)v50;
              swift_unknownObjectRelease();
              v52 = *(_QWORD *)(v9 + 144);
              *v57 = 10;
              (*(void (**)(_QWORD *, _QWORD, uint64_t))(v61 + 104))(v57, *MEMORY[0x1E0DEF4A0], v60);
              type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol();
              swift_allocObject();
              v65 = v40;
              swift_unknownObjectRetain();
              v53 = sub_1CF73AA40(v51, v65, v13, v59, v52, (uint64_t)v57);
              swift_unknownObjectRelease();
              *(_QWORD *)(v9 + 136) = v53;
              OUTLINED_FUNCTION_42_8();
              OUTLINED_FUNCTION_37_7();
              v54 = *(_QWORD *)(v53 + 16);
              *(_QWORD *)(v53 + 16) = sub_1CF712AFC;
              *(_QWORD *)(v53 + 24) = v65;
              sub_1CF693EC8(v54);
              v55 = *(_QWORD *)(v9 + 136);
              OUTLINED_FUNCTION_42_8();
              OUTLINED_FUNCTION_37_7();
              v56 = *(_QWORD *)(v55 + 32);
              *(_QWORD *)(v55 + 32) = sub_1CF712B04;
              *(_QWORD *)(v55 + 40) = v65;
              sub_1CF693EC8(v56);
              swift_bridgeObjectRelease();
              swift_release();

              __swift_destroy_boxed_opaque_existential_0Tm(a3);
              __swift_destroy_boxed_opaque_existential_0Tm(a2);
LABEL_47:
              OUTLINED_FUNCTION_0_0();
              return;
            }
            OUTLINED_FUNCTION_150();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            sub_1CF710A88(&v73, v13, v59);
            OUTLINED_FUNCTION_150();
            swift_release();

            __swift_destroy_boxed_opaque_existential_0Tm(a3);
            __swift_destroy_boxed_opaque_existential_0Tm(a2);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_0Tm(v9 + 32);
            swift_release();

            LODWORD(v40) = 1;
LABEL_42:
            sub_1CF693EC8(*(_QWORD *)(v9 + 88));
            sub_1CF710350(*(_QWORD *)(v9 + 104));
            if ((_DWORD)v40)
              swift_unknownObjectRelease();
            if (v14)
              swift_unknownObjectRelease();

            swift_deallocPartialClassInstance();
            goto LABEL_47;
          }
          OUTLINED_FUNCTION_150();
          sub_1CF6AA5E0();
          OUTLINED_FUNCTION_3_0();
          OUTLINED_FUNCTION_0_24();
          OUTLINED_FUNCTION_8_14();
          OUTLINED_FUNCTION_3_9();
          OUTLINED_FUNCTION_1_20();
          OUTLINED_FUNCTION_30_6();
          OUTLINED_FUNCTION_18_14();
          OUTLINED_FUNCTION_34_7();
          OUTLINED_FUNCTION_150();
          OUTLINED_FUNCTION_44_5();
          OUTLINED_FUNCTION_57_5();
          __swift_destroy_boxed_opaque_existential_0Tm(a3);
          v39 = a2;
LABEL_22:
          __swift_destroy_boxed_opaque_existential_0Tm(v39);
          LODWORD(v40) = 0;
          goto LABEL_42;
        }
        OUTLINED_FUNCTION_150();
        sub_1CF6AA5E0();
        OUTLINED_FUNCTION_3_0();
        OUTLINED_FUNCTION_0_24();
        OUTLINED_FUNCTION_8_14();
        OUTLINED_FUNCTION_3_9();
        OUTLINED_FUNCTION_1_20();
        OUTLINED_FUNCTION_30_6();
        OUTLINED_FUNCTION_18_14();
        OUTLINED_FUNCTION_34_7();
        OUTLINED_FUNCTION_150();
        OUTLINED_FUNCTION_44_5();
        OUTLINED_FUNCTION_57_5();
        v38 = a3;
LABEL_21:
        __swift_destroy_boxed_opaque_existential_0Tm(v38);
        v39 = a2;
        goto LABEL_22;
      }
      OUTLINED_FUNCTION_150();
      sub_1CF6AA5E0();
      OUTLINED_FUNCTION_3_0();
      v40 = &type metadata for RemotePairingError;
      OUTLINED_FUNCTION_0_24();
      OUTLINED_FUNCTION_8_14();
      OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_30_6();
      OUTLINED_FUNCTION_18_14();
      v41 = v13;
    }
    else
    {
      OUTLINED_FUNCTION_150();
      OUTLINED_FUNCTION_40_0();
      sub_1CF6AA5E0();
      OUTLINED_FUNCTION_3_0();
      v40 = &type metadata for RemotePairingError;
      OUTLINED_FUNCTION_0_24();
      OUTLINED_FUNCTION_8_14();
      OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_1_20();
      OUTLINED_FUNCTION_30_6();
      v41 = v13;
    }
    sub_1CF710A88(&v73, v41, v17);
    OUTLINED_FUNCTION_150();
    OUTLINED_FUNCTION_44_5();
    OUTLINED_FUNCTION_57_5();
    OUTLINED_FUNCTION_55_4();
    goto LABEL_42;
  }
  v60 = v14;
  v14 = sub_1CF70F1B4();
  if (!v14)
  {
    OUTLINED_FUNCTION_40_0();
    sub_1CF6AA5E0();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_0_24();
    OUTLINED_FUNCTION_8_14();
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_1_20();
    OUTLINED_FUNCTION_30_6();

    v38 = a3;
    goto LABEL_21;
  }
  v72 = a4;
  v24 = NEVirtualInterfaceCopyName();
  if (v24)
  {
    v25 = (void *)v24;
    v57 = v8;
    v64 = a1;
    v13 = sub_1CF73EED4();
    v17 = v26;

    if (qword_1EFBA09C0 == -1)
      goto LABEL_11;
    goto LABEL_52;
  }
  __break(1u);
}

uint64_t sub_1CF710350(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1CF710380(uint64_t a1, void *a2)
{
  uint64_t v2;
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
  char *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint8_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  _DWORD *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  void (*v55)(char *, char *, uint64_t);
  char *v56;
  char *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;

  v58 = a2;
  v59 = a1;
  v2 = sub_1CF73EF04();
  v63 = *(_QWORD *)(v2 - 8);
  v64 = v2;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_14();
  v62 = v4;
  v5 = sub_1CF73F0FC();
  v60 = *(_QWORD *)(v5 - 8);
  v61 = v5;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14();
  v65 = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA2060);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OUTLINED_FUNCTION_68_2();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x1E0C80A78](v11);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v53 - v16;
  v18 = MEMORY[0x1E0C80A78](v15);
  v57 = (char *)&v53 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v53 - v21;
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v53 - v23;
  v25 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v26 = objc_msgSend(v25, sel_URLsForDirectory_inDomains_, 13, 1);

  v27 = sub_1CF73F048();
  sub_1CF6E09B8(v27, (uint64_t)v10);
  OUTLINED_FUNCTION_19();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_1CF693ED8((uint64_t)v10, (uint64_t *)&unk_1EFBA2060);
    sub_1CF73F0CC();
    if (qword_1EFBA09A0 != -1)
      swift_once();
    sub_1CF73E694();
LABEL_17:
    OUTLINED_FUNCTION_17();
    return;
  }
  v53 = (uint64_t)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = v17;
  v55 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v55(v24, v10, v11);
  v70 = 0;
  v71 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1F38);
  sub_1CF73F408();
  sub_1CF73EF58();
  v28 = v12;
  v68 = 58;
  v69 = 0xE100000000000000;
  v66 = 45;
  v67 = 0xE100000000000000;
  sub_1CF6D24C0();
  sub_1CF73F2B8();
  swift_bridgeObjectRelease();
  v56 = v24;
  sub_1CF73E49C();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v60 + 104))(v65, *MEMORY[0x1E0DEF798], v61);
  v70 = sub_1CF73E4A8();
  v71 = v29;
  v30 = v62;
  sub_1CF73EEF8();
  v31 = sub_1CF73F2C4();
  (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v30, v64);
  swift_bridgeObjectRelease();
  if (v31)
  {
    sub_1CF6B3208(0, (unint64_t *)&unk_1EFBA2070);
    v32 = v57;
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v57, v22, v11);
    v64 = v28;
    v33 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
    v34 = swift_allocObject();
    v55((char *)(v34 + v33), v32, v11);
    v35 = v58;
    v36 = sub_1CF73F120();
    OUTLINED_FUNCTION_150();
    v37 = sub_1CF73F0CC();
    v38 = (uint64_t)v22;
    if (v36)
    {
      v39 = (uint64_t)v56;
      if (qword_1EFBA09A0 != -1)
        swift_once();
      v40 = qword_1EFBA33E0;
      v41 = (uint64_t)v54;
      OUTLINED_FUNCTION_51_5((uint64_t)v54);
      if (os_log_type_enabled(v40, v37))
      {
        v42 = (uint8_t *)OUTLINED_FUNCTION_4_7();
        v70 = OUTLINED_FUNCTION_4_7();
        v65 = v38;
        *(_DWORD *)v42 = 136315138;
        sub_1CF6935F8((unint64_t *)&unk_1EFBA3550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
        v43 = sub_1CF73F648();
        OUTLINED_FUNCTION_59(v43, v44);
        OUTLINED_FUNCTION_20_4(v45);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_7_5(v41);
        _os_log_impl(&dword_1CF67E000, v40, v37, "Successfully created packet tracing logger at %s", v42, 0xCu);
        OUTLINED_FUNCTION_42_4();
        OUTLINED_FUNCTION_0_1();
      }
      OUTLINED_FUNCTION_7_5(v41);
      OUTLINED_FUNCTION_7_5(v38);
      OUTLINED_FUNCTION_7_5(v39);
    }
    else
    {
      if (qword_1EFBA09A0 != -1)
        swift_once();
      v46 = qword_1EFBA33E0;
      v47 = v53;
      OUTLINED_FUNCTION_51_5(v53);
      if (os_log_type_enabled(v46, v37))
      {
        v48 = (_DWORD *)OUTLINED_FUNCTION_4_7();
        v70 = OUTLINED_FUNCTION_4_7();
        *v48 = 136315138;
        sub_1CF6935F8((unint64_t *)&unk_1EFBA3550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
        v49 = sub_1CF73F648();
        OUTLINED_FUNCTION_59(v49, v50);
        OUTLINED_FUNCTION_20_4(v51);
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_7_5(v47);
        OUTLINED_FUNCTION_43_4(&dword_1CF67E000, v46, v52, "Failed to create packet tracing logger at %s");
        OUTLINED_FUNCTION_42_4();
        OUTLINED_FUNCTION_0_1();
      }
      OUTLINED_FUNCTION_7_5(v47);
      OUTLINED_FUNCTION_7_5((uint64_t)v22);
      OUTLINED_FUNCTION_7_5((uint64_t)v56);
    }
    goto LABEL_17;
  }
  __break(1u);
}

_BYTE *sub_1CF710A88(_BYTE *result, uint64_t a2, unint64_t a3)
{
  os_log_type_t v5;
  NSObject *v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if ((*result & 1) == 0)
  {
    v5 = sub_1CF73F0CC();
    if (qword_1EFBA09A0 != -1)
      swift_once();
    v6 = qword_1EFBA33E0;
    if (os_log_type_enabled((os_log_t)qword_1EFBA33E0, v5))
    {
      swift_bridgeObjectRetain_n();
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v10 = v8;
      *(_DWORD *)v7 = 136446210;
      if (a3)
      {
        v9 = a3;
      }
      else
      {
        a2 = 0x6E776F6E6B6E753CLL;
        v9 = 0xE90000000000003ELL;
      }
      swift_bridgeObjectRetain();
      sub_1CF68F110(a2, v9, &v10);
      sub_1CF73F2A0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF67E000, v6, v5, "Cleaning up virtual interface %{public}s due to throwing init", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v8, -1, -1);
      MEMORY[0x1D17D3ED0](v7, -1, -1);
    }
    return (_BYTE *)NEVirtualInterfaceInvalidate();
  }
  return result;
}

ValueMetadata *sub_1CF710C40()
{
  uint64_t v0;
  void *v1;

  v0 = NEVirtualInterfaceCopyNexusInstances();
  if (!v0)
    __break(1u);
  v1 = (void *)v0;
  type metadata accessor for CFUUID(0);
  sub_1CF73F03C();

  sub_1CF6AA5E0();
  OUTLINED_FUNCTION_3_0();
  sub_1CF73F774();
  sub_1CF6ABB3C();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_3_0();
  sub_1CF73F780();
  swift_willThrow();
  return &type metadata for RemotePairingError;
}

uint64_t sub_1CF710E84()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = *(_QWORD *)(result + 88);
    if (v1)
    {
      v2 = *(_QWORD *)(result + 96);
      *(_QWORD *)(result + 88) = 0;
      *(_QWORD *)(result + 96) = 0;
      swift_retain();
      sub_1CF693EC8(v1);
      SkywalkChannelVirtualInterface.readPackets(completion:)(v1, v2);
      sub_1CF693EC8(v1);
    }
    return swift_release();
  }
  return result;
}

void SkywalkChannelVirtualInterface.readPackets(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (_QWORD *)swift_allocObject();
  v5[2] = v2;
  v5[3] = a1;
  v5[4] = a2;
  v6 = OUTLINED_FUNCTION_1_9((uint64_t)sub_1CF6F79AC, MEMORY[0x1E0C809B0], 1107296256, v7, v8);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_121();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v6);
  OUTLINED_FUNCTION_35_6();
}

_QWORD *sub_1CF710FC8()
{
  _QWORD *result;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD aBlock[6];

  swift_beginAccess();
  result = (_QWORD *)swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = result[13];
    if (v2)
    {
      v4 = result[14];
      v3 = result[15];
      result[13] = 0;
      result[14] = 0;
      result[15] = 0;
      sub_1CF713304(v2);
      swift_bridgeObjectRetain();
      swift_retain();
      sub_1CF710350(v2);
      v5 = (_QWORD *)swift_allocObject();
      v5[2] = v1;
      v5[3] = v3;
      v5[4] = v2;
      v5[5] = v4;
      aBlock[4] = sub_1CF71336C;
      aBlock[5] = v5;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1CF6F79AC;
      aBlock[3] = &block_descriptor_28_0;
      v6 = _Block_copy(aBlock);
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      swift_release();
      nw_queue_context_async_if_needed();
      _Block_release(v6);
      swift_release();
      swift_unknownObjectRelease();
      sub_1CF710350(v2);
    }
    return (_QWORD *)swift_release();
  }
  return result;
}

void SkywalkChannelVirtualInterface.writePackets(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  v8 = OUTLINED_FUNCTION_1_9((uint64_t)sub_1CF6F79AC, MEMORY[0x1E0C809B0], 1107296256, v9, v10);
  OUTLINED_FUNCTION_2_4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_121();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v8);
  OUTLINED_FUNCTION_35_6();
}

void SkywalkChannelVirtualInterface.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  NSObject *v6;
  _DWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t aBlock[6];

  v2 = v0;
  v3 = sub_1CF73F0F0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_99();
  v5 = sub_1CF73F0E4();
  if (qword_1EFBA09A0 != -1)
    swift_once();
  v6 = qword_1EFBA33E0;
  if (os_log_type_enabled((os_log_t)qword_1EFBA33E0, v5))
  {
    OUTLINED_FUNCTION_121();
    v7 = (_DWORD *)OUTLINED_FUNCTION_4_7();
    aBlock[0] = OUTLINED_FUNCTION_4_7();
    *v7 = 136446210;
    v9 = *(_QWORD *)(v2 + 16);
    v8 = *(_QWORD *)(v2 + 24);
    swift_bridgeObjectRetain();
    sub_1CF68F110(v9, v8, aBlock);
    sub_1CF73F2A0();
    swift_release();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_43_4(&dword_1CF67E000, v6, v10, "Invalidating virtual interface ref for interface %{public}s");
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_1();
  }
  NEVirtualInterfaceInvalidate();
  v11 = *(void **)(v2 + 152);
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1CF6935F8((unint64_t *)&unk_1EFBA1F40, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF780], MEMORY[0x1E0DEF790]);
    v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA35B0);
    sub_1CF6D23E4((unint64_t *)&unk_1EFBA1F50, (uint64_t *)&unk_1EFBA35B0);
    sub_1CF73F2F4();
    sub_1CF73F12C();

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  }
  v13 = *(_QWORD *)(v2 + 136);
  aBlock[4] = (uint64_t)sub_1CF713088;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1CF6F79AC;
  aBlock[3] = (uint64_t)&block_descriptor_13_0;
  v14 = _Block_copy(aBlock);
  OUTLINED_FUNCTION_2_4();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v14);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v2 + 32);
  swift_release();

  sub_1CF693EC8(*(_QWORD *)(v2 + 88));
  sub_1CF710350(*(_QWORD *)(v2 + 104));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_17();
}

uint64_t sub_1CF7114D8()
{
  return sub_1CF73B81C(0);
}

uint64_t SkywalkChannelVirtualInterface.__deallocating_deinit()
{
  SkywalkChannelVirtualInterface.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1CF71151C(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_1CF70ED8C(a2);
  v9 = sub_1CF73B300(v8);
  result = swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(a2 + 16);
  if (v9 >= v11)
    return a3(0);
  if (v9 < 0)
  {
    __break(1u);
  }
  else
  {
    v12 = (2 * v11) | 1;
    swift_retain();
    v13 = swift_bridgeObjectRetain();
    v14 = sub_1CF7115F4(v13, a2 + 32, v9, v12);
    v15 = a1[13];
    a1[13] = a3;
    a1[14] = a4;
    a1[15] = v14;
    return sub_1CF710350(v15);
  }
  return result;
}

uint64_t sub_1CF7115F4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((a4 & 1) == 0)
    goto LABEL_2;
  sub_1CF73F6CC();
  swift_unknownObjectRetain_n();
  v10 = swift_dynamicCastClass();
  if (!v10)
  {
    swift_unknownObjectRelease();
    v10 = MEMORY[0x1E0DEE9D8];
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
    sub_1CF70402C(a1, a2, a3, a4);
    v9 = v8;
    goto LABEL_9;
  }
  v9 = swift_dynamicCastClass();
  if (!v9)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x1E0DEE9D8];
  }
LABEL_9:
  swift_unknownObjectRelease();
  return v9;
}

uint64_t sub_1CF7116D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 aBlock;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t (*v27)();
  uint64_t v28;

  v6 = sub_1CF73ED54();
  v21 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CF73ED84();
  v19 = *(_QWORD *)(v9 - 8);
  v20 = v9;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF73AB6C((uint64_t *)&aBlock);
  v12 = v25;
  v22 = aBlock;
  v13 = *(void **)(a1 + 80);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = v22;
  *(_QWORD *)(v14 + 32) = v12;
  *(_QWORD *)(v14 + 40) = a1;
  *(_QWORD *)(v14 + 48) = a2;
  *(_QWORD *)(v14 + 56) = a3;
  v27 = sub_1CF713260;
  v28 = v14;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v25 = sub_1CF6CC068;
  v26 = &block_descriptor_19;
  v15 = _Block_copy(&aBlock);
  v16 = v13;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1CF73ED6C();
  v23 = MEMORY[0x1E0DEE9D8];
  sub_1CF6935F8((unint64_t *)&qword_1ED8F79B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8F7A00);
  sub_1CF6D23E4((unint64_t *)&qword_1ED8F7A10, (uint64_t *)&unk_1ED8F7A00);
  sub_1CF73F2F4();
  MEMORY[0x1D17D2D90](0, v11, v8, v15);
  _Block_release(v15);
  swift_release();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v11, v20);
  return swift_release();
}

uint64_t sub_1CF711924(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t a3, _QWORD *a4, void (*a5)(_QWORD), uint64_t a6)
{
  void (*v6)(_QWORD);
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD);
  uint64_t (*v31)(_QWORD);
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;

  v6 = a5;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    v12 = sub_1CF712B0C(v10, a1);
    v13 = v12;
    v14 = (void *)a4[19];
    if (v14)
    {
      v15 = *(_QWORD *)(v12 + 16);
      if (v15)
      {
        v30 = v6;
        v31 = a2;
        v32 = a3;
        v33 = v14;
        swift_bridgeObjectRetain();
        v29 = v13;
        v16 = (uint64_t *)(v13 + 64);
        do
        {
          v34 = v15;
          v17 = *((_BYTE *)v16 - 8);
          v18 = *v16;
          v19 = v16[1];
          v21 = v16[2];
          v20 = v16[3];
          v23 = v16[4];
          v22 = v16[5];
          v24 = v16[6];
          v25 = v16[7];
          LODWORD(v35) = *((_DWORD *)v16 - 8);
          v36 = *(_OWORD *)(v16 - 3);
          v37 = v17;
          v38 = v18;
          v39 = v19;
          v40 = v21;
          v41 = v20;
          v42 = v23;
          v43 = v22;
          v44 = v24;
          v45 = v25;
          sub_1CF6934BC(v18, v19);
          sub_1CF6934BC(v21, v20);
          sub_1CF6D233C(v23, v22);
          sub_1CF6934BC(v24, v25);
          sub_1CF711B04(&v35, (uint64_t)v33);
          sub_1CF6933C0(v18, v19);
          sub_1CF6933C0(v21, v20);
          sub_1CF6D2368(v23, v22);
          sub_1CF6933C0(v24, v25);
          v16 += 12;
          v15 = v34 - 1;
        }
        while (v34 != 1);

        v13 = v29;
        swift_bridgeObjectRelease();
        a3 = v32;
        v6 = v30;
        a2 = v31;
      }
    }
    v35 = v13;
    *(_QWORD *)&v36 = a2;
    *((_QWORD *)&v36 + 1) = a3;
    swift_retain();
    v6(&v35);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v27 = a4[11];
    a4[11] = a5;
    a4[12] = a6;
    sub_1CF693EC8(v27);
    v28 = swift_retain();
    return a2(v28);
  }
}

void sub_1CF711B04(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  char *v30;
  _QWORD v31[5];
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;

  v4 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2048);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_99();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA2050);
  OUTLINED_FUNCTION_3();
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v31 - v12;
  v14 = sub_1CF73E9AC();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  MEMORY[0x1E0C80A78](v16);
  v19 = a1[9];
  if (v19 >> 60 != 15)
  {
    v36 = v4;
    v37 = a2;
    v40 = v11;
    v41 = (char *)v31 - v17;
    v38 = v18;
    v21 = a1[4];
    v20 = a1[5];
    v22 = a1[6];
    v23 = a1[7];
    v24 = a1[8];
    v39 = sub_1CF73EA00();
    __swift_storeEnumTagSinglePayload(v3, 1, 1, v39);
    sub_1CF6D233C(v24, v19);
    OUTLINED_FUNCTION_50_5();
    OUTLINED_FUNCTION_70_5();
    OUTLINED_FUNCTION_50_5();
    sub_1CF73E9B8();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
    {
      sub_1CF6D2368(v24, v19);
      sub_1CF6933C0(v21, v20);
      OUTLINED_FUNCTION_69_6();
      v25 = (uint64_t)v13;
    }
    else
    {
      v32 = v24;
      v33 = v19;
      v34 = v21;
      v35 = v20;
      v26 = v15;
      v27 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
      v28 = v41;
      v27(v41, v13, v14);
      __swift_storeEnumTagSinglePayload(v3, 1, 1, v39);
      OUTLINED_FUNCTION_70_5();
      v29 = (uint64_t)v40;
      sub_1CF73E9B8();
      if (__swift_getEnumTagSinglePayload(v29, 1, v14) != 1)
      {
        v39 = v26;
        v27(v38, (char *)v29, v14);
        v30 = (char *)&loc_1CF711D8C + 4 * byte_1CF747520[v33 >> 61];
        v31[3] = v22;
        v31[4] = v23;
        __asm { BR              X10 }
      }
      (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v14);
      sub_1CF6D2368(v32, v33);
      sub_1CF6933C0(v34, v35);
      OUTLINED_FUNCTION_69_6();
      v25 = v29;
    }
    sub_1CF693ED8(v25, (uint64_t *)&unk_1EFBA2050);
  }
}

uint64_t sub_1CF7122B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
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
  char *v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  os_log_type_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  os_log_type_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  _QWORD v44[2];
  int v45;
  int v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = sub_1CF73E4B4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v44 - v9;
  v11 = sub_1CF73E3C4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](a1);
  v15 = (char *)v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)v44 - v17;
  if (v16)
  {
    v19 = v5;
    v20 = a2;
    v46 = v16;
    v21 = sub_1CF73E6A0();
    if ((v21 & 0x100000000) != 0)
      v22 = 5;
    else
      v22 = v21;
    LODWORD(v49) = v22;
    sub_1CF6ABA2C(MEMORY[0x1E0DEE9D8]);
    sub_1CF6935F8(qword_1EFBA2080, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE90], MEMORY[0x1E0CADE88]);
    sub_1CF73E478();
    v23 = sub_1CF73F0CC();
    if (qword_1EFBA09A0 != -1)
      swift_once();
    v24 = qword_1EFBA33E0;
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v20, v4);
    v25 = v12;
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v18, v11);
    v47 = v24;
    if (os_log_type_enabled(v24, v23))
    {
      v26 = swift_slowAlloc();
      v27 = swift_slowAlloc();
      v49 = v27;
      *(_DWORD *)v26 = 136446722;
      v44[0] = v26 + 4;
      sub_1CF6935F8((unint64_t *)&unk_1EFBA3550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      v45 = v23;
      v28 = sub_1CF73F648();
      sub_1CF68F110(v28, v29, &v49);
      v48 = v30;
      v44[1] = &v49;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v4);
      *(_WORD *)(v26 + 12) = 1024;
      LODWORD(v48) = v46;
      sub_1CF73F2A0();
      *(_WORD *)(v26 + 18) = 2080;
      sub_1CF6935F8((unint64_t *)&unk_1EFBA3560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE90], MEMORY[0x1E0CADEA0]);
      v31 = sub_1CF73F720();
      sub_1CF68F110(v31, v32, &v49);
      v48 = v33;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      v34 = *(void (**)(char *, uint64_t))(v25 + 8);
      v34(v15, v11);
      _os_log_impl(&dword_1CF67E000, v47, (os_log_type_t)v45, "%{public}s: IO cleanup error: %d, %s", (uint8_t *)v26, 0x1Cu);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v27, -1, -1);
      MEMORY[0x1D17D3ED0](v26, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v4);
      v34 = *(void (**)(char *, uint64_t))(v12 + 8);
      v34(v15, v11);
    }
    return ((uint64_t (*)(char *, uint64_t))v34)(v18, v11);
  }
  else
  {
    v35 = sub_1CF73F0B4();
    if (qword_1EFBA09A0 != -1)
      swift_once();
    v36 = qword_1EFBA33E0;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a2, v4);
    v37 = v35;
    if (os_log_type_enabled(v36, v35))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      v39 = swift_slowAlloc();
      v49 = v39;
      *(_DWORD *)v38 = 136446210;
      sub_1CF6935F8((unint64_t *)&unk_1EFBA3550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      v40 = sub_1CF73F648();
      sub_1CF68F110(v40, v41, &v49);
      v48 = v42;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      _os_log_impl(&dword_1CF67E000, v36, v37, "%{public}s: IO cleanup complete", v38, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v39, -1, -1);
      return MEMORY[0x1D17D3ED0](v38, -1, -1);
    }
    else
    {
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
  }
}

void SkywalkChannelVirtualInterface.getInterfaceStatistics()()
{
  void *v0;
  id v1;
  id v2;

  v0 = (void *)NEVirtualInterfaceCopyStatistics();
  if (v0)
  {
    v1 = v0;
    sub_1CF73EE20();

    sub_1CF6AA5E0();
    OUTLINED_FUNCTION_3_0();
    sub_1CF73F774();
    sub_1CF73F348();
    sub_1CF73EF58();
    type metadata accessor for CFDictionary(0);
    v2 = v1;
    sub_1CF73EF10();
    sub_1CF73EF58();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_39_3(0x726F6620u);
    sub_1CF73EF58();
    swift_bridgeObjectRetain();
    sub_1CF73EF58();
    swift_bridgeObjectRelease();
    sub_1CF6ABB3C();
    OUTLINED_FUNCTION_105();
    sub_1CF73F780();
    swift_willThrow();

  }
  else
  {
    __break(1u);
  }
}

void sub_1CF7129C4()
{
  static SkywalkChannelVirtualInterface.defaultMTU.getter();
}

uint64_t sub_1CF7129D8()
{
  return static SkywalkChannelVirtualInterface.maxSupportedMTU.getter();
}

void sub_1CF7129EC()
{
  static SkywalkChannelVirtualInterface.maxSupportedPendingPackets.getter();
}

void sub_1CF712A00()
{
  SkywalkChannelVirtualInterface.interfaceName.getter();
}

uint64_t sub_1CF712A20@<X0>(uint64_t a1@<X8>)
{
  return SkywalkChannelVirtualInterface.address.getter(a1);
}

void sub_1CF712A40(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, unint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v8;
  uint64_t v10;

  SkywalkChannelVirtualInterface.__allocating_init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(a1, a2, a3, a4 & 0x1FFFF, a5 | ((HIDWORD(a5) & 1) << 32), a6, a7);
  if (!v8)
    *a8 = v10;
}

void sub_1CF712A78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SkywalkChannelVirtualInterface.writePackets(_:completion:)(a1, a2, a3);
}

void sub_1CF712A98(uint64_t a1, uint64_t a2)
{
  SkywalkChannelVirtualInterface.readPackets(completion:)(a1, a2);
}

void sub_1CF712AB8()
{
  SkywalkChannelVirtualInterface.getInterfaceStatistics()();
}

uint64_t sub_1CF712AD8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CF712AFC()
{
  return sub_1CF710E84();
}

_QWORD *sub_1CF712B04()
{
  return sub_1CF710FC8();
}

uint64_t sub_1CF712B0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1CF6E0904(a1);
  v5 = v4;
  if (*(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    __asm { BR              X9 }
  }
  if (a1 < 0)
  {
    __break(1u);
    JUMPOUT(0x1CF713018);
  }
  *(_QWORD *)(v4 + 16) = 0;
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1CF713028()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF713054()
{
  uint64_t *v0;

  return sub_1CF7116D8(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_11()
{
  return swift_release();
}

uint64_t sub_1CF71307C()
{
  uint64_t v0;

  return sub_1CF71151C(*(_QWORD **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(_QWORD))(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_1CF713088()
{
  return sub_1CF7114D8();
}

uint64_t type metadata accessor for SkywalkChannelVirtualInterface()
{
  return objc_opt_self();
}

uint64_t method lookup function for SkywalkChannelVirtualInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SkywalkChannelVirtualInterface.__allocating_init(queue:address:netmask:mtu:maxPendingPackets:physicalInterfaceName:)(uint64_t a1, uint64_t a2, uint64_t a3, int a4, unint64_t a5)
{
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t))(v5 + 160))(a1, a2, a3, a4 & 0x1FFFF, a5 | ((HIDWORD(a5) & 1) << 32));
}

uint64_t destroy for PendingPacketWrite()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

void _s19RemotePairingDevice18PendingPacketWriteVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1();
}

_QWORD *assignWithCopy for PendingPacketWrite(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PendingPacketWrite(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for PendingPacketWrite()
{
  return &type metadata for PendingPacketWrite;
}

unint64_t sub_1CF713200(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1CF713224()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF713260()
{
  uint64_t v0;

  return sub_1CF711924(*(_QWORD *)(v0 + 16), *(uint64_t (**)(_QWORD))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD **)(v0 + 40), *(void (**)(_QWORD))(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_1CF713270()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_68_2();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1CF7132CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_68_2() - 8) + 80);
  return sub_1CF7122B8(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_1CF713304(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t objectdestroy_6Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_1CF71336C()
{
  uint64_t *v0;

  SkywalkChannelVirtualInterface.writePackets(_:completion:)(v0[3], v0[4], v0[5]);
}

uint64_t OUTLINED_FUNCTION_18_14()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_22_7(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = a1;
  return sub_1CF73F2A0();
}

uint64_t OUTLINED_FUNCTION_30_6()
{
  return swift_willThrow();
}

BOOL OUTLINED_FUNCTION_33_7(os_log_type_t a1)
{
  uint64_t v1;

  return os_log_type_enabled(*(os_log_t *)(v1 + 992), a1);
}

uint64_t OUTLINED_FUNCTION_37_7()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_38_6()
{
  return sub_1CF73F648();
}

uint64_t OUTLINED_FUNCTION_42_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_47_8()
{
  return sub_1CF73F348();
}

uint64_t OUTLINED_FUNCTION_51_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_53_6()
{
  return sub_1CF73EF10();
}

uint64_t OUTLINED_FUNCTION_55_4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(*(_QWORD *)(v0 - 200));
  return __swift_destroy_boxed_opaque_existential_0Tm(*(_QWORD *)(v0 - 192));
}

uint64_t OUTLINED_FUNCTION_60_4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 136);
}

uint64_t OUTLINED_FUNCTION_61_6()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 112);
}

void OUTLINED_FUNCTION_63_6()
{
  unint64_t v0;
  uint64_t v1;

  sub_1CF6D2368(v1, v0);
}

uint64_t OUTLINED_FUNCTION_69_6()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1CF6933C0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_70_5()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1CF6934BC(v0, v1);
}

uint64_t sub_1CF7134CC(uint64_t a1, unint64_t a2)
{
  return ((uint64_t (*)(void))((char *)sub_1CF7134F0 + 4 * byte_1CF747610[a2 >> 62]))();
}

BOOL sub_1CF7134F0(uint64_t a1, uint64_t a2)
{
  return BYTE6(a2) == 0;
}

void sub_1CF713518(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;

  if (*a2 < a3)
  {
    if (((unint64_t)", device supports >=" & 0x2000000000000000) == 0
      || (((unint64_t)", device supports >=" >> 56) & 0xF) != 0)
    {
      v3 = sub_1CF73EF40();
      if (v3 < 0)
      {
        __break(1u);
      }
      else if (v3)
      {
        OUTLINED_FUNCTION_38_7();
      }
      __break(1u);
    }
    sub_1CF73F348();
    swift_bridgeObjectRelease();
    sub_1CF73F450();
    __break(1u);
  }
}

uint64_t NWConnection.receive(minLength:maxLength:completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_12_11();
  v3 = (_QWORD *)OUTLINED_FUNCTION_16();
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0;
  OUTLINED_FUNCTION_121();
  sub_1CF73EAF0();
  return OUTLINED_FUNCTION_11_10();
}

uint64_t sub_1CF713708()
{
  uint64_t result;

  sub_1CF6B3208(0, (unint64_t *)&qword_1ED8F7A60);
  result = sub_1CF73F270();
  qword_1EFBA3570 = result;
  return result;
}

id powerLog.getter()
{
  if (qword_1EFBA09C8 != -1)
    swift_once();
  return (id)qword_1EFBA3570;
}

uint64_t sub_1CF7137B4()
{
  uint64_t result;

  sub_1CF6B3208(0, (unint64_t *)&qword_1ED8F7A60);
  result = sub_1CF73F270();
  qword_1EFBA3578 = result;
  return result;
}

RemotePairingDevice::TransportProtocolType_optional __swiftcall TransportProtocolType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  RemotePairingDevice::TransportProtocolType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CF73F498();
  result.value = OUTLINED_FUNCTION_3_7();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t TransportProtocolType.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 7365492;
  if (*v0 != 1)
    v1 = 7365749;
  if (*v0)
    return v1;
  else
    return 1667855729;
}

void sub_1CF7138C8(char *a1, char *a2)
{
  sub_1CF6B34B8(*a1, *a2);
}

void sub_1CF7138D4()
{
  sub_1CF6B3DA4();
}

uint64_t sub_1CF7138DC()
{
  return sub_1CF6B3E98();
}

void sub_1CF7138E4()
{
  sub_1CF6B43F8();
}

RemotePairingDevice::TransportProtocolType_optional sub_1CF7138EC(Swift::String *a1)
{
  return TransportProtocolType.init(rawValue:)(*a1);
}

void sub_1CF7138F8(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = TransportProtocolType.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF713918()
{
  sub_1CF717858();
  return sub_1CF73F018();
}

uint64_t sub_1CF713974()
{
  sub_1CF717858();
  return sub_1CF73F000();
}

BOOL static TunnelConnectionState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void TunnelConnectionState.hash(into:)()
{
  sub_1CF73F7F8();
  OUTLINED_FUNCTION_1();
}

void TunnelConnectionState.hashValue.getter()
{
  sub_1CF73F7EC();
  OUTLINED_FUNCTION_102();
  sub_1CF73F810();
  OUTLINED_FUNCTION_24();
}

void PeerConnectionInfo.description.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_23_4();
  sub_1CF73F648();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_26();
}

uint64_t PeerConnectionInfo.init(owningPID:owningProcessName:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_DWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_1CF713ABC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4950676E696E776FLL && a2 == 0xE900000000000044;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001CF755030)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1CF713BB4(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000011;
  else
    return 0x4950676E696E776FLL;
}

void sub_1CF713BF4()
{
  sub_1CF73F7EC();
  OUTLINED_FUNCTION_102();
  sub_1CF73F810();
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1CF713C24()
{
  char *v0;

  return sub_1CF713BB4(*v0);
}

uint64_t sub_1CF713C2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF713ABC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF713C50()
{
  sub_1CF715BE4();
  return sub_1CF73F864();
}

uint64_t sub_1CF713C78()
{
  sub_1CF715BE4();
  return sub_1CF73F870();
}

void PeerConnectionInfo.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3590);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_99();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1CF715BE4();
  sub_1CF73F858();
  sub_1CF73F600();
  if (!v1)
    sub_1CF73F5C4();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  OUTLINED_FUNCTION_0_0();
}

void PeerConnectionInfo.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA35A0);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_15();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1CF715BE4();
  sub_1CF73F840();
  if (!v2)
  {
    v6 = sub_1CF73F534();
    v7 = sub_1CF73F4F8();
    v9 = v8;
    OUTLINED_FUNCTION_8();
    *(_DWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v7;
    *(_QWORD *)(a2 + 16) = v9;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF713EB8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  PeerConnectionInfo.init(from:)(a1, a2);
}

void sub_1CF713ECC(_QWORD *a1)
{
  PeerConnectionInfo.encode(to:)(a1);
}

uint64_t static TunnelConnectionIdentifierCategory.numberOfCharacters.getter()
{
  return 8;
}

uint64_t static TunnelConnectionIdentifierCategory.prefix.getter()
{
  return 1852793716;
}

uint64_t sub_1CF713EFC()
{
  return 1852793716;
}

uint64_t sub_1CF713F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;

  v0 = sub_1CF73EF04();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_99();
  sub_1CF73EEF8();
  v2 = sub_1CF73EEE0();
  v4 = v3;
  result = OUTLINED_FUNCTION_61_7(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  if (v4 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    qword_1EFBA3580 = v2;
    *(_QWORD *)algn_1EFBA3588 = v4;
  }
  return result;
}

uint64_t StreamBasedTunnelConnection.send(packets:completion:)(uint64_t a1, void (*a2)(_QWORD), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void (*v6)(_QWORD);
  uint64_t v7;
  unint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v5 = a5;
  v6 = a2;
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v8 = (unint64_t *)(swift_bridgeObjectRetain() + 120);
    do
    {
      v9 = *(v8 - 7);
      v10 = *(v8 - 6);
      v12 = *(v8 - 5);
      v11 = *(v8 - 4);
      v14 = *(v8 - 3);
      v13 = *(v8 - 2);
      v15 = *(v8 - 1);
      v16 = *v8;
      sub_1CF6934BC(v9, v10);
      sub_1CF6934BC(v12, v11);
      sub_1CF6D233C(v14, v13);
      sub_1CF6934BC(v15, v16);
      sub_1CF73E5D4();
      sub_1CF6933C0(v9, v10);
      sub_1CF6933C0(v12, v11);
      sub_1CF6D2368(v14, v13);
      sub_1CF6933C0(v15, v16);
      v8 += 12;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
    v5 = a5;
    v6 = a2;
  }
  v17 = OUTLINED_FUNCTION_266();
  if ((sub_1CF7134CC(v17, v18) & 1) != 0)
  {
    v6(0);
  }
  else
  {
    v19 = *(void (**)(uint64_t))(v5 + 88);
    v20 = OUTLINED_FUNCTION_266();
    sub_1CF6934BC(v20, v21);
    v22 = OUTLINED_FUNCTION_266();
    v19(v22);
    v23 = OUTLINED_FUNCTION_266();
    sub_1CF6933C0(v23, v24);
  }
  v25 = OUTLINED_FUNCTION_266();
  return sub_1CF6933C0(v25, v26);
}

uint64_t StreamBasedTunnelConnection.receivePackets(completion:)()
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
  _QWORD *v9;

  OUTLINED_FUNCTION_12_11();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 40))(v6, v5);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 64))(v2, v0);
  v9 = (_QWORD *)OUTLINED_FUNCTION_16();
  v9[2] = v2;
  v9[3] = v0;
  v9[4] = v1;
  v9[5] = v4;
  v9[6] = v3;
  swift_unknownObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_57_8(v7, v8, (uint64_t)sub_1CF715C4C, (uint64_t)v9);
  return swift_release();
}

void sub_1CF7141D8(id a1, unint64_t a2, char a3, uint64_t a4, void (*a5)(id, uint64_t))
{
  id v6;
  uint64_t v8;
  id v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a1;
  if ((a3 & 1) != 0)
  {
    v9 = a1;
    v8 = 1;
  }
  else
  {
    sub_1CF6934BC((uint64_t)a1, a2);
    sub_1CF714290((uint64_t)&v10);
    sub_1CF6CE874(v6, a2, 0);
    v6 = v10;
    v8 = v11;
  }
  a5(v6, v8);
  sub_1CF6A736C(v6, v8);
}

uint64_t sub_1CF714290@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_1CF714570((void (*)(uint64_t *__return_ptr, uint64_t *))sub_1CF717A1C);
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

void sub_1CF7142E0(uint64_t a1@<X1>, unint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X5>, _QWORD *a6@<X8>)
{
  uint64_t v6;
  uint64_t v9;

  sub_1CF714334(a1, a2, a3, a4);
  if (v6)
    *a5 = v6;
  else
    *a6 = v9;
}

void sub_1CF714334(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  if (v7 >> 60 == 15)
  {
    v8 = sub_1CF6934BC(a1, a2);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v11 = v7;
    sub_1CF6A7B18(v6, v7);
    sub_1CF6934BC(a1, a2);
    sub_1CF714DC0(a1, a2);
    sub_1CF6933C0(a1, a2);
    v8 = sub_1CF693FE0(v9, v10);
    a2 = v11;
  }
  MEMORY[0x1E0C80A78](v8);
  __asm { BR              X10 }
}

uint64_t sub_1CF714434()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1CF7150C8(v2, v0 & 0xFFFFFFFFFFFFLL, (uint64_t (*)(uint64_t *, char *))sub_1CF717A40, v1, BYTE6(v0));
  sub_1CF6933C0(v2, v0);
  if (v3)
    return swift_bridgeObjectRelease();
  else
    return *(_QWORD *)(v4 - 96);
}

uint64_t sub_1CF714570(void (*a1)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v2;
  uint64_t v3;

  a1(&v3, &v2);
  return v3;
}

uint64_t sub_1CF7145C8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t result;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  char *v22;
  _QWORD *v23;
  __int128 *v24;
  __int128 v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  unint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;

  v7 = v6;
  if (!a1)
  {
LABEL_35:
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 48))(40, a5, a6);
    return (*(uint64_t (**)(_QWORD, unint64_t, uint64_t, uint64_t))(a6 + 24))(0, 0xF000000000000000, a5, a6);
  }
  v9 = a1;
  while (1)
  {
    v10 = a2 - v9;
    if (a2 - v9 < 40)
    {
      if (a2 == v9)
        goto LABEL_35;
      result = 40 - v10;
      if (__OFSUB__(40, v10))
        goto LABEL_41;
      v36 = a5;
      v35 = a6;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 48))(result, a5, a6);
      v37 = v9;
LABEL_38:
      v38 = sub_1CF6E6838(v37, a2);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v35 + 24))(v38, v39, v36, v35);
    }
    v11 = sub_1CF717A5C(0, a2 - v9, v9, a2);
    v49 = a2 - v9;
    if ((unint64_t)v11 >= 0x28)
      v12 = 40;
    else
      v12 = a2 - v9;
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3758);
    *((_QWORD *)&v55 + 1) = v13;
    v14 = sub_1CF717A90();
    v56 = v14;
    v15 = (_QWORD *)swift_allocObject();
    *(_QWORD *)&v54 = v15;
    v15[2] = 0;
    v15[3] = v12;
    v15[4] = v9;
    v15[5] = a2;
    v51 = *(_OWORD *)__swift_project_boxed_opaque_existential_0Tm(&v54, v13);
    sub_1CF73F7C8();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v54);
    result = IPv6Header.init(_:)(v52, v53);
    if (v7)
      return result;
    v46 = v58;
    v47 = v57;
    v17 = (unint64_t)v57 + v58;
    if (__OFADD__(v57, v58))
      break;
    v48 = v9;
    v19 = v60;
    v18 = v61;
    v50 = v62;
    v64 = v63;
    if ((uint64_t)v17 > v49)
    {
      sub_1CF6933C0(v60, v61);
      sub_1CF6933C0(v50, v64);
      if (a2 == v48)
        goto LABEL_35;
      v36 = a5;
      v35 = a6;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(a6 + 48))(v17 - v49, a5, a6);
      v37 = v48;
      goto LABEL_38;
    }
    if ((v17 & 0x8000000000000000) != 0)
      goto LABEL_40;
    v45 = v59;
    if (v11 >= v17)
      v20 = (char *)v57 + v58;
    else
      v20 = (char *)v49;
    if (v11 < 0 || v17 == 0)
      v22 = (char *)v57 + v58;
    else
      v22 = v20;
    v60 = v13;
    v61 = v14;
    v23 = (_QWORD *)swift_allocObject();
    v57 = v23;
    v23[2] = 0;
    v23[3] = v22;
    v23[4] = v48;
    v23[5] = a2;
    v24 = (__int128 *)__swift_project_boxed_opaque_existential_0Tm(&v57, v13);
    v25 = v24[1];
    v54 = *v24;
    v55 = v25;
    sub_1CF73F7C8();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v57);
    sub_1CF6934BC(v19, v18);
    v26 = v64;
    sub_1CF6934BC(v50, v64);
    sub_1CF6934BC(v19, v18);
    sub_1CF6934BC(v50, v26);
    sub_1CF6934BC(v51, *((unint64_t *)&v51 + 1));
    if (qword_1EFBA0998 != -1)
      swift_once();
    if (byte_1EFBB2020 == 1)
    {
      v57 = v47;
      v58 = v46;
      v59 = v45;
      v60 = v19;
      v61 = v18;
      v62 = v50;
      v63 = v64;
      sub_1CF70C83C((uint64_t)&v57, v51, *((unint64_t *)&v51 + 1), (unint64_t *)&v54);
      v27 = *((_QWORD *)&v54 + 1);
      v44 = v54;
    }
    else
    {
      sub_1CF6933C0(v51, *((unint64_t *)&v51 + 1));
      sub_1CF6933C0(v19, v18);
      sub_1CF6933C0(v50, v64);
      v44 = 0;
      v27 = 0xF000000000000000;
    }
    v43 = v27;
    v28 = *a3;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *a3 = v28;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1CF6C6FE4();
      v28 = v33;
      *a3 = v33;
    }
    v30 = *(_QWORD *)(v28 + 16);
    if (v30 >= *(_QWORD *)(v28 + 24) >> 1)
    {
      sub_1CF6C6FE4();
      v28 = v34;
    }
    *(_QWORD *)(v28 + 16) = v30 + 1;
    v31 = v28 + 96 * v30;
    *(_DWORD *)(v31 + 32) = 30;
    *(_QWORD *)(v31 + 40) = v47;
    *(_QWORD *)(v31 + 48) = v46;
    *(_BYTE *)(v31 + 56) = v45;
    *(_QWORD *)(v31 + 64) = v19;
    *(_QWORD *)(v31 + 72) = v18;
    v32 = v64;
    *(_QWORD *)(v31 + 80) = v50;
    *(_QWORD *)(v31 + 88) = v32;
    *(_QWORD *)(v31 + 96) = v44;
    *(_QWORD *)(v31 + 104) = v43;
    *(_OWORD *)(v31 + 112) = v51;
    *a3 = v28;
    sub_1CF6933C0(v19, v18);
    sub_1CF6933C0(v50, v32);
    v9 = v48 + v17;
    a2 = v48 + v49;
    v7 = 0;
    if (!v48)
      goto LABEL_35;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void StreamBasedTunnelConnection.send(controlMessage:completion:)()
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
  unint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void (*v19)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  OUTLINED_FUNCTION_167();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  type metadata accessor for TunnelMessage();
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_34();
  v13 = v12 - v11;
  sub_1CF6DBF50(v9, v12 - v11);
  sub_1CF73E40C();
  OUTLINED_FUNCTION_21();
  sub_1CF73E400();
  sub_1CF6935F8(&qword_1EFBA35A8, (uint64_t (*)(uint64_t))type metadata accessor for TunnelMessage, (uint64_t)&protocol conformance descriptor for TunnelMessage);
  v14 = sub_1CF73E3F4();
  v16 = v15;
  swift_release();
  sub_1CF6934BC(v14, v16);
  if (OUTLINED_FUNCTION_23_11() >= 0x10000)
  {
    sub_1CF73F348();
    OUTLINED_FUNCTION_39_6();
    OUTLINED_FUNCTION_23_11();
    OUTLINED_FUNCTION_10_13();
    sub_1CF73F648();
    OUTLINED_FUNCTION_50_6();
    OUTLINED_FUNCTION_11();
    sub_1CF73EF58();
    sub_1CF6AA5E0();
    sub_1CF73F738();
    sub_1CF6ABB3C();
    v17 = (void *)OUTLINED_FUNCTION_3_9();
    sub_1CF73F780();
    OUTLINED_FUNCTION_22_8();

    OUTLINED_FUNCTION_10_13();
    sub_1CF715C58(v13);
LABEL_3:
    OUTLINED_FUNCTION_17();
    return;
  }
  if (qword_1EFBA09D8 != -1)
    swift_once();
  v21 = qword_1EFBA3580;
  v22 = *(_QWORD *)algn_1EFBA3588;
  sub_1CF6934BC(qword_1EFBA3580, *(unint64_t *)algn_1EFBA3588);
  v18 = OUTLINED_FUNCTION_23_11();
  if ((v18 & 0x8000000000000000) == 0 && v18 < 0x10000)
  {
    v20 = v3;
    sub_1CF714F60(bswap32(v18) >> 16);
    if (sub_1CF73E5C8() == 10)
    {
      sub_1CF73E5D4();
      OUTLINED_FUNCTION_10_13();
      v19 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 88);
      sub_1CF6934BC(v21, v22);
      v19(v21, v22, v7, v5, v20, v1);
      OUTLINED_FUNCTION_47_9();
      OUTLINED_FUNCTION_10_13();
      sub_1CF715C58(v13);
      OUTLINED_FUNCTION_47_9();
      goto LABEL_3;
    }
    __break(1u);
  }
  OUTLINED_FUNCTION_3_1();
  sub_1CF73F444();
  __break(1u);
}

void sub_1CF714DC0(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[5];

  v3[3] = MEMORY[0x1E0CB0338];
  v3[4] = MEMORY[0x1E0CB0318];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_1CF714E14
     + *((int *)qword_1CF714F50 + (__swift_project_boxed_opaque_existential_0Tm(v3, MEMORY[0x1E0CB0338])[1] >> 62));
  __asm { BR              X10 }
}

uint64_t sub_1CF714E24()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v3;

  sub_1CF6934BC(v1, v0);
  sub_1CF714FF8();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v3);
}

uint64_t sub_1CF714F60(__int16 a1)
{
  __int16 v2;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2 = a1;
  v3[3] = MEMORY[0x1E0DEAC20];
  v3[4] = MEMORY[0x1E0CB1AA8];
  v3[0] = &v2;
  v3[1] = v3;
  __swift_project_boxed_opaque_existential_0Tm(v3, MEMORY[0x1E0DEAC20]);
  sub_1CF73E550();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
}

uint64_t sub_1CF714FF8()
{
  return sub_1CF73E550();
}

uint64_t sub_1CF7150C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t *, char *), uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  __int16 v7;
  char v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a2;
  v8 = BYTE2(a2);
  v9 = BYTE3(a2);
  v10 = BYTE4(a2);
  v11 = BYTE5(a2);
  return a3(&v6, (char *)&v6 + a5);
}

uint64_t StreamBasedTunnelConnection.receiveControlMessage(completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_12_11();
  v5 = (_QWORD *)OUTLINED_FUNCTION_16();
  v5[2] = v2;
  v5[3] = v0;
  v5[4] = v4;
  v5[5] = v3;
  v5[6] = v1;
  swift_retain();
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_57_8(10, 10, (uint64_t)sub_1CF715CC0, (uint64_t)v5);
  return OUTLINED_FUNCTION_11_10();
}

void sub_1CF715200(void *a1, unint64_t a2, char a3, void (*a4)(_QWORD *), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[8];

  v15 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFBA3180);
  MEMORY[0x1E0C80A78](v15);
  v17 = (_QWORD *)((char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((a3 & 1) != 0)
  {
    v21 = a1;
    swift_willThrow();
    v22 = a1;
  }
  else
  {
    v24[0] = a6;
    v24[1] = a7;
    v24[2] = a8;
    sub_1CF6934BC((uint64_t)a1, a2);
    if (qword_1EFBA09D8 != -1)
      swift_once();
    v18 = qword_1EFBA3580;
    v19 = *(_QWORD *)algn_1EFBA3588;
    sub_1CF6934BC(qword_1EFBA3580, *(unint64_t *)algn_1EFBA3588);
    v20 = sub_1CF69323C();
    sub_1CF6933C0(v18, v19);
    if ((v20 & 1) != 0)
    {
      sub_1CF73E5C8();
      __asm { BR              X11 }
    }
    sub_1CF6AA5E0();
    sub_1CF73F738();
    v24[4] = v24[6];
    v24[5] = v24[7];
    sub_1CF6ABB3C();
    v22 = (void *)swift_allocError();
    sub_1CF73F780();
    swift_willThrow();
    sub_1CF6CE874(a1, a2, 0);
  }
  *v17 = v22;
  swift_storeEnumTagMultiPayload();
  v23 = v22;
  a4(v17);

  sub_1CF693ED8((uint64_t)v17, qword_1EFBA3180);
}

void sub_1CF7156BC()
{
  _QWORD *v0;
  uint64_t v1;
  char v2;
  char v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  OUTLINED_FUNCTION_167();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  type metadata accessor for TunnelMessage();
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_98();
  __swift_instantiateConcreteTypeFromMangledName(qword_1EFBA3180);
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_15();
  if ((v3 & 1) != 0)
  {
    *v0 = v7;
    OUTLINED_FUNCTION_43_8();
    v10 = v7;
    OUTLINED_FUNCTION_22_8();
    sub_1CF693ED8((uint64_t)v0, qword_1EFBA3180);
  }
  else
  {
    sub_1CF73E3E8();
    OUTLINED_FUNCTION_21();
    sub_1CF6934BC((uint64_t)v7, v5);
    sub_1CF73E3DC();
    sub_1CF6935F8((unint64_t *)&unk_1EFBA3748, (uint64_t (*)(uint64_t))type metadata accessor for TunnelMessage, (uint64_t)&protocol conformance descriptor for TunnelMessage);
    sub_1CF73E3D0();
    sub_1CF6DBF50(v1, (uint64_t)v0);
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_22_8();
    swift_release();
    OUTLINED_FUNCTION_26_9();
    sub_1CF693ED8((uint64_t)v0, qword_1EFBA3180);
    sub_1CF715C58(v1);
  }
  OUTLINED_FUNCTION_17();
}

void sub_1CF715844()
{
  uint64_t v0;
  void (*v1)(void *, unint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(void *, unint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(void *, unint64_t, uint64_t);

  OUTLINED_FUNCTION_167();
  v26 = v1;
  v25 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2EB8);
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_34();
  v16 = v15 - v14;
  v17 = sub_1CF73EC88();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_98();
  if ((v6 & 1) != 0 && v8)
    sub_1CF73EA54();
  sub_1CF717AFC(v4, v16);
  if (__swift_getEnumTagSinglePayload(v16, 1, v17) != 1)
  {
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 32);
    v20(v0, v16, v17);
    sub_1CF6935F8((unint64_t *)&unk_1EFBA3770, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
    v19 = (void *)swift_allocError();
    v20(v21, v0, v17);
    goto LABEL_10;
  }
  sub_1CF693ED8(v16, &qword_1EFBA2EB8);
  if (v10 >> 60 == 15)
  {
    sub_1CF6AA5E0();
    OUTLINED_FUNCTION_30_7();
    OUTLINED_FUNCTION_21_7();
    v19 = (void *)OUTLINED_FUNCTION_3_9();
    sub_1CF73F780();
LABEL_10:
    v10 = 0;
    v24 = 1;
LABEL_11:
    v22 = v26;
    goto LABEL_12;
  }
  v19 = (void *)v12;
  sub_1CF6934BC(v12, v10);
  if (sub_1CF73E5C8() >= v25)
  {
    v24 = 0;
    goto LABEL_11;
  }
  v22 = v26;
  sub_1CF73F348();
  sub_1CF73EF58();
  sub_1CF73E5C8();
  OUTLINED_FUNCTION_41_8();
  sub_1CF73EF58();
  swift_bridgeObjectRelease();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_41_8();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_3_7();
  OUTLINED_FUNCTION_39_6();
  sub_1CF6AA5E0();
  sub_1CF73F738();
  OUTLINED_FUNCTION_21_7();
  v23 = OUTLINED_FUNCTION_3_9();
  sub_1CF73F780();
  sub_1CF693FE0(v12, v10);
  v10 = 0;
  v24 = 1;
  v19 = (void *)v23;
LABEL_12:
  v22(v19, v10, v24);
  sub_1CF6CE874(v19, v10, v24);
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1CF715BC0()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1CF715BE4()
{
  unint64_t result;

  result = qword_1EFBA3598;
  if (!qword_1EFBA3598)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF747A8C, &type metadata for PeerConnectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3598);
  }
  return result;
}

uint64_t sub_1CF715C20()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF715C4C(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1CF715CCC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1CF7141D8);
}

uint64_t sub_1CF715C58(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TunnelMessage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CF715C94()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CF715CC0(uint64_t a1, uint64_t a2, char a3)
{
  return sub_1CF715CCC(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1CF715200);
}

uint64_t sub_1CF715CCC(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v4;

  return a4(a1, a2, a3 & 1, v4[4], v4[5], v4[6], v4[2], v4[3]);
}

uint64_t sub_1CF715CE4()
{
  return 0x10000;
}

void sub_1CF715CF4()
{
  OUTLINED_FUNCTION_31();
}

uint64_t SocketTunnelConnection.identifier.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CF715D08(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_1CF6A7B18(*a1, v2);
  return sub_1CF715D88(v1, v2);
}

void sub_1CF715D48()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10();
  sub_1CF6A7B18(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  OUTLINED_FUNCTION_26();
}

uint64_t sub_1CF715D88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  OUTLINED_FUNCTION_10();
  v5 = *(_QWORD *)(v2 + 64);
  v6 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return sub_1CF693FE0(v5, v6);
}

void sub_1CF715DD4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF715E08()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10();
  return *(_QWORD *)(v0 + 80);
}

void sub_1CF715E34(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_10();
  *(_QWORD *)(v1 + 80) = a1;
  OUTLINED_FUNCTION_26();
}

void sub_1CF715E64()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF715E98()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10();
  return *(_QWORD *)(v0 + 88);
}

void sub_1CF715EC4(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_10();
  *(_QWORD *)(v1 + 88) = a1;
  OUTLINED_FUNCTION_26();
}

void sub_1CF715EF4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

uint64_t SocketTunnelConnection.__allocating_init(socket:queue:logPrefix:)()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_16();
  SocketTunnelConnection.init(socket:queue:logPrefix:)();
  return v0;
}

void SocketTunnelConnection.init(socket:queue:logPrefix:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_167();
  v2 = (_QWORD *)v0;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = sub_1CF73F0FC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_15();
  *(_OWORD *)(v0 + 64) = xmmword_1CF743C90;
  *(_OWORD *)(v0 + 80) = xmmword_1CF747AE0;
  v11 = sub_1CF73F060();
  *(_QWORD *)(v11 + 16) = 8;
  v20 = 8;
  v21 = 0;
  v19 = v11 + 32;
  sub_1CF713518((uint64_t)&v19, &v21, 8);
  v12 = v21;
  if (v21 <= 8)
  {
    *(_QWORD *)(v11 + 16) = v21;
    v19 = v11;
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_17_0((unint64_t *)&qword_1EFBA1EC8);
    v2[2] = sub_1CF73EFB8();
    v2[3] = v13;
    if (!v4)
    {
      v19 = 0x2074656B636F73;
      v20 = 0xE700000000000000;
      LODWORD(v21) = v8;
      sub_1CF73F648();
      OUTLINED_FUNCTION_50_6();
      OUTLINED_FUNCTION_11();
    }
    v19 = 0xD000000000000018;
    v20 = 0x80000001CF754EC0;
    sub_1CF73EF58();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_23_4();
    OUTLINED_FUNCTION_11();
    v15 = v19;
    v14 = v20;
    sub_1CF6B3208(0, (unint64_t *)&unk_1EFBA2070);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 104))(v1, *MEMORY[0x1E0DEF798], v9);
    v16 = OUTLINED_FUNCTION_16();
    *(_QWORD *)(v16 + 16) = v15;
    *(_QWORD *)(v16 + 24) = v14;
    *(_DWORD *)(v16 + 32) = v8;
    v17 = v6;
    swift_bridgeObjectRetain();
    v18 = sub_1CF73F114();
    v2[4] = v18;
    dispatch_io_set_low_water(v18, 1uLL);
    v2[5] = v17;
    v2[6] = v15;
    v2[7] = v14;
    OUTLINED_FUNCTION_17();
  }
  else
  {
    __break(1u);
    __break(1u);
    *(_QWORD *)(v11 + 16) = v12;
    OUTLINED_FUNCTION_11_3();
    __break(1u);
  }
}

uint64_t sub_1CF7161C8(int a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  os_log_type_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  os_log_type_t v27;
  NSObject *v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  os_log_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;

  v8 = sub_1CF73E3C4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v34 - v13;
  if (a1)
  {
    v15 = sub_1CF73E6A0();
    if ((v15 & 0x100000000) != 0)
      v16 = 5;
    else
      v16 = v15;
    LODWORD(v39) = v16;
    sub_1CF6ABA2C(MEMORY[0x1E0DEE9D8]);
    sub_1CF6935F8(qword_1EFBA2080, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE90], MEMORY[0x1E0CADE88]);
    sub_1CF73E478();
    v17 = sub_1CF73F0CC();
    if (qword_1EFBA09D0 != -1)
      swift_once();
    v18 = qword_1EFBA3578;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    if (os_log_type_enabled(v18, v17))
    {
      swift_bridgeObjectRetain_n();
      v19 = swift_slowAlloc();
      v37 = v17;
      v20 = v19;
      v36 = swift_slowAlloc();
      v39 = v36;
      *(_DWORD *)v20 = 136315650;
      v35 = v18;
      swift_bridgeObjectRetain();
      sub_1CF68F110(a2, a3, &v39);
      v38 = v21;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 12) = 1024;
      LODWORD(v38) = a1;
      sub_1CF73F2A0();
      *(_WORD *)(v20 + 18) = 2080;
      sub_1CF6935F8((unint64_t *)&unk_1EFBA3560, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE90], MEMORY[0x1E0CADEA0]);
      v22 = sub_1CF73F720();
      sub_1CF68F110(v22, v23, &v39);
      v38 = v24;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      v25 = *(void (**)(char *, uint64_t))(v9 + 8);
      v25(v12, v8);
      _os_log_impl(&dword_1CF67E000, v35, (os_log_type_t)v37, "%s: IO cleanup error: %d, %s", (uint8_t *)v20, 0x1Cu);
      v26 = v36;
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v26, -1, -1);
      MEMORY[0x1D17D3ED0](v20, -1, -1);
      v25(v14, v8);
    }
    else
    {
      v32 = *(void (**)(char *, uint64_t))(v9 + 8);
      v32(v12, v8);
      v32(v14, v8);
    }
  }
  else
  {
    v27 = sub_1CF73F0B4();
    if (qword_1EFBA09D0 != -1)
      swift_once();
    v28 = qword_1EFBA3578;
    if (os_log_type_enabled((os_log_t)qword_1EFBA3578, v27))
    {
      swift_bridgeObjectRetain_n();
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v39 = v30;
      *(_DWORD *)v29 = 136315138;
      swift_bridgeObjectRetain();
      sub_1CF68F110(a2, a3, &v39);
      v38 = v31;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CF67E000, v28, v27, "%s: IO cleanup done", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v30, -1, -1);
      MEMORY[0x1D17D3ED0](v29, -1, -1);
    }
  }
  return close(a4);
}

void sub_1CF716620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1CF716638(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))OS_dispatch_io.write(content:completingOn:completion:));
}

void sub_1CF71662C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1CF716638(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))OS_dispatch_io.read(minLength:maxLength:competingOn:completion:));
}

void sub_1CF716638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))
{
  uint64_t v5;

  a5(a1, a2, *(_QWORD *)(v5 + 40), a3, a4);
  OUTLINED_FUNCTION_1();
}

void sub_1CF716664()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1CF73F0CC();
  if (qword_1EFBA09D0 != -1)
    swift_once();
  if (OUTLINED_FUNCTION_40_7())
  {
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_4_7();
    v4 = OUTLINED_FUNCTION_4_7();
    OUTLINED_FUNCTION_15_14(4.8149e-34);
    OUTLINED_FUNCTION_27_10(v0, v1, &v4);
    OUTLINED_FUNCTION_9_12();
    OUTLINED_FUNCTION_96();
    OUTLINED_FUNCTION_178();
    OUTLINED_FUNCTION_19_12(&dword_1CF67E000, v2, v3, "%s: receiving a datagram socket connection");
    OUTLINED_FUNCTION_34_8();
    OUTLINED_FUNCTION_0_1();
  }
  sub_1CF73F348();
  OUTLINED_FUNCTION_32_6();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_39_6();
  OUTLINED_FUNCTION_20_10();
  __break(1u);
}

void sub_1CF7167A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_167();
  v1 = sub_1CF73F0F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_34();
  v5 = v4 - v3;
  v6 = sub_1CF73F0E4();
  if (qword_1EFBA09D0 != -1)
    swift_once();
  v7 = qword_1EFBA3578;
  if (os_log_type_enabled((os_log_t)qword_1EFBA3578, v6))
  {
    swift_retain();
    OUTLINED_FUNCTION_4_7();
    v12 = OUTLINED_FUNCTION_4_7();
    OUTLINED_FUNCTION_52_5(4.8149e-34);
    v8 = *(_QWORD *)(v0 + 48);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_27_10(v8, v9, &v12);
    OUTLINED_FUNCTION_372_0(v10);
    sub_1CF73F2A0();
    swift_release();
    OUTLINED_FUNCTION_178();
    OUTLINED_FUNCTION_43_4(&dword_1CF67E000, v7, v11, "%s: closing IO on cancel()");
    OUTLINED_FUNCTION_41_4();
    OUTLINED_FUNCTION_0_1();
  }
  v12 = MEMORY[0x1E0DEE9D8];
  sub_1CF6935F8((unint64_t *)&unk_1EFBA1F40, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF780], MEMORY[0x1E0DEF790]);
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_17_0((unint64_t *)&unk_1EFBA1F50);
  sub_1CF73F2F4();
  sub_1CF73F12C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
  OUTLINED_FUNCTION_17();
}

void sub_1CF71696C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1CF73F0CC();
  if (qword_1EFBA09D0 != -1)
    swift_once();
  if (OUTLINED_FUNCTION_40_7())
  {
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_4_7();
    v4 = OUTLINED_FUNCTION_4_7();
    OUTLINED_FUNCTION_15_14(4.8149e-34);
    OUTLINED_FUNCTION_27_10(v0, v1, &v4);
    OUTLINED_FUNCTION_9_12();
    OUTLINED_FUNCTION_96();
    OUTLINED_FUNCTION_178();
    OUTLINED_FUNCTION_19_12(&dword_1CF67E000, v2, v3, "%s: starting a QUIC based socket connection");
    OUTLINED_FUNCTION_34_8();
    OUTLINED_FUNCTION_0_1();
  }
  sub_1CF73F348();
  OUTLINED_FUNCTION_32_6();
  OUTLINED_FUNCTION_11_3();
  OUTLINED_FUNCTION_39_6();
  OUTLINED_FUNCTION_20_10();
  __break(1u);
}

void SocketTunnelConnection.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_167();
  v1 = v0;
  v2 = sub_1CF73F0F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_99();
  v4 = sub_1CF73F0E4();
  if (qword_1EFBA09D0 != -1)
    swift_once();
  v5 = qword_1EFBA3578;
  if (os_log_type_enabled((os_log_t)qword_1EFBA3578, v4))
  {
    OUTLINED_FUNCTION_121();
    OUTLINED_FUNCTION_4_7();
    v10 = OUTLINED_FUNCTION_4_7();
    OUTLINED_FUNCTION_52_5(4.8149e-34);
    v6 = *(_QWORD *)(v1 + 48);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_27_10(v6, v7, &v10);
    OUTLINED_FUNCTION_372_0(v8);
    sub_1CF73F2A0();
    OUTLINED_FUNCTION_96();
    OUTLINED_FUNCTION_178();
    OUTLINED_FUNCTION_43_4(&dword_1CF67E000, v5, v9, "%s: closing IO on deinit");
    OUTLINED_FUNCTION_41_4();
    OUTLINED_FUNCTION_0_1();
  }
  v10 = MEMORY[0x1E0DEE9D8];
  sub_1CF6935F8((unint64_t *)&unk_1EFBA1F40, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF780], MEMORY[0x1E0DEF790]);
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_17_0((unint64_t *)&unk_1EFBA1F50);
  sub_1CF73F2F4();
  sub_1CF73F12C();
  OUTLINED_FUNCTION_61_7(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  sub_1CF693FE0(*(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72));
  OUTLINED_FUNCTION_17();
}

uint64_t SocketTunnelConnection.__deallocating_deinit()
{
  SocketTunnelConnection.deinit();
  return swift_deallocClassInstance();
}

uint64_t (*sub_1CF716CB0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_1CF716CF4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_1CF716D38())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CF716D7C@<X0>(_QWORD *a1@<X8>)
{
  return SocketTunnelConnection.identifier.getter(a1);
}

uint64_t sub_1CF716D9C(uint64_t a1, void (*a2)(_QWORD), uint64_t a3, uint64_t a4)
{
  return StreamBasedTunnelConnection.send(packets:completion:)(a1, a2, a3, a4, (uint64_t)&protocol witness table for SocketTunnelConnection);
}

void sub_1CF716DC4()
{
  StreamBasedTunnelConnection.send(controlMessage:completion:)();
}

uint64_t sub_1CF716DEC()
{
  return StreamBasedTunnelConnection.receivePackets(completion:)();
}

uint64_t sub_1CF716E14()
{
  return StreamBasedTunnelConnection.receiveControlMessage(completion:)();
}

void sub_1CF716E3C()
{
  sub_1CF7167A0();
}

void sub_1CF716E5C()
{
  sub_1CF71696C();
}

uint64_t sub_1CF716E70()
{
  return sub_1CF715CE4() & 0x1FFFF;
}

void sub_1CF716E90(uint64_t a1, void (*a2)(_QWORD), uint64_t a3, uint64_t a4)
{
  StreamBasedTunnelConnection.send(packets:completion:)(a1, a2, a3, a4, (uint64_t)&protocol witness table for TCPTunnelConnection);
  OUTLINED_FUNCTION_1();
}

void sub_1CF716EB4()
{
  StreamBasedTunnelConnection.send(controlMessage:completion:)();
  OUTLINED_FUNCTION_1();
}

void sub_1CF716ED8()
{
  StreamBasedTunnelConnection.receivePackets(completion:)();
  OUTLINED_FUNCTION_1();
}

void sub_1CF716EFC()
{
  StreamBasedTunnelConnection.receiveControlMessage(completion:)();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF716F20()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CF716F44(int a1)
{
  uint64_t v1;

  return sub_1CF7161C8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_DWORD *)(v1 + 32));
}

unint64_t sub_1CF716F54()
{
  unint64_t result;

  result = qword_1EFBA35C0;
  if (!qword_1EFBA35C0)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for TransportProtocolType, &type metadata for TransportProtocolType);
    atomic_store(result, (unint64_t *)&qword_1EFBA35C0);
  }
  return result;
}

unint64_t sub_1CF716F94()
{
  unint64_t result;

  result = qword_1EFBA35C8;
  if (!qword_1EFBA35C8)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for TunnelConnectionState, &type metadata for TunnelConnectionState);
    atomic_store(result, (unint64_t *)&qword_1EFBA35C8);
  }
  return result;
}

void sub_1CF716FD0(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_1CF715D48();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_1();
}

void sub_1CF716FF8(uint64_t *a1@<X8>)
{
  *a1 = sub_1CF715E08();
  OUTLINED_FUNCTION_1();
}

void sub_1CF71701C(uint64_t *a1)
{
  sub_1CF715E34(*a1);
  OUTLINED_FUNCTION_1();
}

void sub_1CF71703C(uint64_t *a1@<X8>)
{
  *a1 = sub_1CF715E98();
  OUTLINED_FUNCTION_1();
}

void sub_1CF717060(uint64_t *a1)
{
  sub_1CF715EC4(*a1);
  OUTLINED_FUNCTION_1();
}

uint64_t storeEnumTagSinglePayload for TransportProtocolType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF7170CC + 4 * byte_1CF747619[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1CF717100 + 4 * byte_1CF747614[v4]))();
}

uint64_t sub_1CF717100(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF717108(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF717110);
  return result;
}

uint64_t sub_1CF71711C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF717124);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1CF717128(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF717130(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TransportProtocolType()
{
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1CF717148(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 0x2000000000000000) != 0)
    return sub_1CF6934BC(a1, a2);
  sub_1CF6934BC(a1, a2);
  sub_1CF6934BC(a3, a4);
  return swift_unknownObjectRetain();
}

uint64_t destroy for NetworkParamsType(uint64_t a1)
{
  return sub_1CF7171A4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_1CF7171A4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a4 & 0x2000000000000000) != 0)
    return sub_1CF6933C0(a1, a2);
  sub_1CF6933C0(a1, a2);
  sub_1CF6933C0(a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t *initializeWithCopy for NetworkParamsType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  sub_1CF717148(*a2, v4, v5, v6);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  return a1;
}

uint64_t *assignWithCopy for NetworkParamsType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  sub_1CF717148(*a2, v4, v5, v6);
  v8 = *a1;
  v9 = a1[1];
  v10 = a1[2];
  v11 = a1[3];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  sub_1CF7171A4(v8, v9, v10, v11);
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

uint64_t *assignWithTake for NetworkParamsType(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *a1;
  v6 = a1[1];
  v5 = a1[2];
  v7 = a1[3];
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v8;
  a1[4] = v3;
  sub_1CF7171A4(v4, v6, v5, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for NetworkParamsType(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xF && *(_BYTE *)(a1 + 40))
    {
      v2 = *(_DWORD *)a1 + 14;
    }
    else
    {
      v2 = (((*(_QWORD *)(a1 + 24) >> 58) >> 3) & 1 | (2
                                                                   * ((*(_QWORD *)(a1 + 24) >> 58) & 4 | (*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xE)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for NetworkParamsType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 15;
    if (a3 >= 0xF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0xF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((-a2 >> 1) & 3) << 60;
      *(_QWORD *)(result + 16) = 0;
      *(_QWORD *)(result + 24) = ((unint64_t)((-a2 >> 1) & 7 | (8 * (-a2 & 0xF))) << 58) & 0x3000000000000000;
      *(_QWORD *)(result + 32) = 0;
    }
  }
  return result;
}

uint64_t sub_1CF7173D8(uint64_t a1)
{
  return (*(_QWORD *)(a1 + 24) >> 61) & 1;
}

uint64_t sub_1CF7173E4(uint64_t result)
{
  *(_QWORD *)(result + 24) &= ~0x2000000000000000uLL;
  return result;
}

uint64_t sub_1CF7173F4(uint64_t result, char a2)
{
  unint64_t v2;

  v2 = *(_QWORD *)(result + 24) & 0xCFFFFFFFFFFFFFFFLL | ((unint64_t)(a2 & 1) << 61);
  *(_QWORD *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  *(_QWORD *)(result + 24) = v2;
  return result;
}

void type metadata accessor for NetworkParamsType()
{
  OUTLINED_FUNCTION_31();
}

void type metadata accessor for TunnelConnectionState()
{
  OUTLINED_FUNCTION_31();
}

void sub_1CF717438(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1();
}

uint64_t assignWithCopy for PeerConnectionInfo(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PeerConnectionInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for PeerConnectionInfo()
{
  OUTLINED_FUNCTION_31();
}

void type metadata accessor for TunnelConnectionIdentifierCategory()
{
  OUTLINED_FUNCTION_31();
}

uint64_t dispatch thunk of TunnelConnection.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TunnelConnection.send(packets:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t dispatch thunk of TunnelConnection.send(controlMessage:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of TunnelConnection.receivePackets(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of TunnelConnection.receiveControlMessage(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of TunnelConnection.cancel()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TunnelConnection.start(on:reportingTunnelStateChangesWith:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of TunnelConnection.maxSupportedMTU.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))() & 0x1FFFF;
}

uint64_t dispatch thunk of TunnelConnection.physicalInterfaceName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._partialReceivedPacket.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._nextMinReceiveLength.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection._maxReceiveLength.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection.send(content:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 88))();
}

uint64_t dispatch thunk of StreamBasedTunnelConnection.receive(minLength:maxLength:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 96))();
}

uint64_t type metadata accessor for SocketTunnelConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for SocketTunnelConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SocketTunnelConnection.maxSupportedMTU.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))() & 0x1FFFF;
}

uint64_t dispatch thunk of SocketTunnelConnection.physicalInterfaceName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SocketTunnelConnection._partialReceivedPacket.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SocketTunnelConnection._nextMinReceiveLength.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of SocketTunnelConnection._maxReceiveLength.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SocketTunnelConnection.__allocating_init(socket:queue:logPrefix:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SocketTunnelConnection.send(content:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of SocketTunnelConnection.receive(minLength:maxLength:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of SocketTunnelConnection.receive(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of SocketTunnelConnection.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of SocketTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t _s19RemotePairingDevice21TunnelConnectionStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF717718 + 4 * byte_1CF747623[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CF71774C + 4 * byte_1CF74761E[v4]))();
}

uint64_t sub_1CF71774C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF717754(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF71775CLL);
  return result;
}

uint64_t sub_1CF717768(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF717770);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CF717774(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF71777C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeerConnectionInfo.CodingKeys()
{
  return &type metadata for PeerConnectionInfo.CodingKeys;
}

unint64_t sub_1CF71779C()
{
  unint64_t result;

  result = qword_1EFBA3720;
  if (!qword_1EFBA3720)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF747A64, &type metadata for PeerConnectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3720);
  }
  return result;
}

unint64_t sub_1CF7177DC()
{
  unint64_t result;

  result = qword_1EFBA3728;
  if (!qword_1EFBA3728)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7479D4, &type metadata for PeerConnectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3728);
  }
  return result;
}

unint64_t sub_1CF71781C()
{
  unint64_t result;

  result = qword_1EFBA3730;
  if (!qword_1EFBA3730)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7479FC, &type metadata for PeerConnectionInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3730);
  }
  return result;
}

unint64_t sub_1CF717858()
{
  unint64_t result;

  result = qword_1EFBA3738;
  if (!qword_1EFBA3738)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for TransportProtocolType, &type metadata for TransportProtocolType);
    atomic_store(result, (unint64_t *)&qword_1EFBA3738);
  }
  return result;
}

uint64_t sub_1CF717894(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1CF73E430();
  if (!result || (result = sub_1CF73E454(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1CF73E448();
      return sub_1CF73E550();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1CF717924(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = sub_1CF73E430();
  v7 = result;
  if (result)
  {
    result = sub_1CF73E454();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v7 += a1 - result;
  }
  v8 = __OFSUB__(a2, a1);
  v9 = a2 - a1;
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }
  v10 = sub_1CF73E448();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  v12 = v7 + v11;
  if (v7)
    v13 = v12;
  else
    v13 = 0;
  return a3(v7, v13);
}

uint64_t sub_1CF7179C4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1CF7179E8()
{
  sub_1CF7156BC();
}

uint64_t sub_1CF7179F4()
{
  return sub_1CF73E550();
}

void sub_1CF717A1C(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_1CF7142E0(*(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1, a2);
}

uint64_t sub_1CF717A40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CF7145C8(a1, a2, *(uint64_t **)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_1CF717A5C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
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

unint64_t sub_1CF717A90()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EFBA3760;
  if (!qword_1EFBA3760)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBA3758);
    v2 = MEMORY[0x1E0CB1AA8];
    result = MEMORY[0x1D17D3DEC](MEMORY[0x1E0CB26B0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EFBA3760);
  }
  return result;
}

uint64_t sub_1CF717AEC()
{
  return swift_deallocObject();
}

uint64_t sub_1CF717AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2EB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void OUTLINED_FUNCTION_19_12(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_20_10()
{
  return sub_1CF73F450();
}

unint64_t OUTLINED_FUNCTION_21_7()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 88);
  *(_QWORD *)(v0 - 112) = *(_QWORD *)(v0 - 96);
  *(_QWORD *)(v0 - 104) = v1;
  return sub_1CF6ABB3C();
}

uint64_t OUTLINED_FUNCTION_22_8()
{
  uint64_t (*v0)(void);

  return v0();
}

void OUTLINED_FUNCTION_26_9()
{
  void *v0;
  unint64_t v1;

  sub_1CF6CE874(v0, v1, 0);
}

void OUTLINED_FUNCTION_27_10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  sub_1CF68F110(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_30_7()
{
  return sub_1CF73F738();
}

void OUTLINED_FUNCTION_38_7()
{
  JUMPOUT(0x1D17D3EE8);
}

uint64_t OUTLINED_FUNCTION_39_6()
{
  return sub_1CF73EF58();
}

BOOL OUTLINED_FUNCTION_40_7()
{
  NSObject *v0;
  os_log_type_t v1;

  return os_log_type_enabled(v0, v1);
}

uint64_t OUTLINED_FUNCTION_41_8()
{
  return sub_1CF73F648();
}

uint64_t OUTLINED_FUNCTION_47_9()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1CF6933C0(v0, v1);
}

void OUTLINED_FUNCTION_52_5(float a1)
{
  float *v1;
  uint64_t v2;

  *v1 = a1;
  *(_QWORD *)(v2 - 112) = v1 + 1;
}

uint64_t OUTLINED_FUNCTION_57_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  return v6(a1, a2, a3, a4, v5, v4);
}

uint64_t OUTLINED_FUNCTION_61_7@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_1CF717C2C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  OUTLINED_FUNCTION_2_4();
  v3(a2);
  return swift_release();
}

uint64_t sub_1CF717C64(uint64_t a1, void (*a2)(void *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD v16[2];
  uint64_t v17;
  unint64_t v18;

  v4 = type metadata accessor for TunnelMessage();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF6DBF50(a1, (uint64_t)v6);
  sub_1CF73E40C();
  swift_allocObject();
  sub_1CF73E400();
  sub_1CF6935F8(&qword_1EFBA35A8, (uint64_t (*)(uint64_t))type metadata accessor for TunnelMessage, (uint64_t)&protocol conformance descriptor for TunnelMessage);
  v7 = sub_1CF73E3F4();
  v9 = v8;
  swift_release();
  sub_1CF6934BC(v7, v9);
  if (sub_1CF73E5C8() >= 0x10000)
  {
    v17 = 0;
    v18 = 0xE000000000000000;
    sub_1CF73F348();
    sub_1CF73EF58();
    v10 = sub_1CF73E5C8();
    sub_1CF6933C0(v7, v9);
    v16[0] = v10;
    sub_1CF73F648();
    sub_1CF73EF58();
    swift_bridgeObjectRelease();
    sub_1CF73EF58();
    sub_1CF6AA5E0();
    sub_1CF73F738();
    v16[0] = v17;
    v16[1] = v18;
    sub_1CF6ABB3C();
    v11 = (void *)swift_allocError();
    sub_1CF73F780();
    a2(v11);

    sub_1CF6933C0(v7, v9);
    return sub_1CF715C58((uint64_t)v6);
  }
  if (qword_1EFBA09D8 != -1)
    swift_once();
  v17 = qword_1EFBA3580;
  v18 = *(_QWORD *)algn_1EFBA3588;
  sub_1CF6934BC(qword_1EFBA3580, *(unint64_t *)algn_1EFBA3588);
  v13 = sub_1CF73E5C8();
  if ((v13 & 0x8000000000000000) == 0 && v13 < 0x10000)
  {
    sub_1CF714F60(bswap32(v13) >> 16);
    if (sub_1CF73E5C8() == 10)
    {
      sub_1CF73E5D4();
      sub_1CF6933C0(v7, v9);
      v14 = v17;
      v15 = v18;
      sub_1CF6934BC(v17, v18);
      sub_1CF719068();
      sub_1CF6933C0(v14, v15);
      sub_1CF6933C0(v7, v9);
      sub_1CF715C58((uint64_t)v6);
      return sub_1CF6933C0(v14, v15);
    }
    __break(1u);
  }
  result = sub_1CF73F444();
  __break(1u);
  return result;
}

void sub_1CF71804C(void *a1, unint64_t a2, char a3, void (*a4)(_QWORD *), uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[6];

  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFBA3180);
  MEMORY[0x1E0C80A78](v11);
  v13 = (_QWORD *)((char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((a3 & 1) != 0)
  {
    v17 = a1;
    swift_willThrow();
    v18 = a1;
  }
  else
  {
    v20[0] = a6;
    sub_1CF6934BC((uint64_t)a1, a2);
    if (qword_1EFBA09D8 != -1)
      swift_once();
    v14 = qword_1EFBA3580;
    v15 = *(_QWORD *)algn_1EFBA3588;
    sub_1CF6934BC(qword_1EFBA3580, *(unint64_t *)algn_1EFBA3588);
    v16 = sub_1CF69323C();
    sub_1CF6933C0(v14, v15);
    if ((v16 & 1) != 0)
    {
      sub_1CF73E5C8();
      __asm { BR              X11 }
    }
    sub_1CF6AA5E0();
    sub_1CF73F738();
    v20[2] = v20[4];
    v20[3] = v20[5];
    sub_1CF6ABB3C();
    v18 = (void *)swift_allocError();
    sub_1CF73F780();
    swift_willThrow();
    sub_1CF6CE874(a1, a2, 0);
  }
  *v13 = v18;
  swift_storeEnumTagMultiPayload();
  v19 = v18;
  a4(v13);

  sub_1CF693ED8((uint64_t)v13, qword_1EFBA3180);
}

uint64_t sub_1CF7184F0()
{
  uint64_t result;

  sub_1CF6B3208(0, (unint64_t *)&qword_1ED8F7A60);
  result = sub_1CF73F270();
  qword_1EFBA3780 = result;
  return result;
}

void sub_1CF718568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
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
  void (*v55)(uint64_t, uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  void (*v62)(uint64_t, unint64_t, uint64_t);
  char v63;
  char *v64;
  uint64_t v65;
  void (*v66)(uint64_t, char *, uint64_t);
  char v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
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
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  void (*v108)(char *, _QWORD, uint64_t);
  char *v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  char *v113;
  void (*v114)(uint64_t, char *, uint64_t);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117[2];

  OUTLINED_FUNCTION_167();
  a19 = v25;
  a20 = v26;
  v27 = sub_1CF73E9D0();
  v107 = *(_QWORD *)(v27 - 8);
  OUTLINED_FUNCTION_3();
  v29 = MEMORY[0x1E0C80A78](v28);
  v31 = (char *)&v93 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v29);
  v33 = (char *)&v93 - v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2048);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_24_0();
  v95 = v35;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v36);
  v98 = OUTLINED_FUNCTION_52_6();
  v37 = *(_QWORD *)(v98 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v38);
  OUTLINED_FUNCTION_24_0();
  v109 = v39;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v40);
  v106 = (char *)&v93 - v41;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v42);
  v113 = (char *)&v93 - v43;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2CD8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_13();
  v45 = sub_1CF73EC7C();
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v46);
  OUTLINED_FUNCTION_16_7();
  v96 = v20;
  sub_1CF73EA3C();
  if (__swift_getEnumTagSinglePayload(v22, 1, v45) == 1)
  {
    sub_1CF693ED8(v22, &qword_1EFBA2CD8);
    sub_1CF73F0D8();
    if (qword_1EFBA09E0 != -1)
      goto LABEL_31;
    goto LABEL_3;
  }
  v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32);
  v94 = v45;
  v55(v21, v22, v45);
  v56 = sub_1CF73EC70();
  v57 = v56;
  v115 = MEMORY[0x1E0DEE9D8];
  v58 = *(_QWORD *)(v56 + 16);
  v93 = v21;
  v59 = v37;
  v60 = v98;
  v104 = v58;
  v105 = v24;
  if (!v58)
  {
LABEL_20:
    OUTLINED_FUNCTION_54_8();
LABEL_21:
    OUTLINED_FUNCTION_11_3();
    sub_1CF693ED8(v23, &qword_1EFBA2048);
    OUTLINED_FUNCTION_64_8((uint64_t)&a17);
    OUTLINED_FUNCTION_96();
    if (__swift_getEnumTagSinglePayload(v57, 1, v60) == 1)
    {
      sub_1CF693ED8(v57, &qword_1EFBA2048);
      v78 = 0;
      v79 = 0;
    }
    else
    {
      v78 = sub_1CF73E9DC();
      v79 = v80;
      OUTLINED_FUNCTION_58_0(v57, *(uint64_t (**)(uint64_t, uint64_t))(v59 + 8));
    }
    v81 = v96;
    sub_1CF73F0B4();
    if (qword_1EFBA09E0 != -1)
      swift_once();
    OUTLINED_FUNCTION_20();
    if (OUTLINED_FUNCTION_60_5())
    {
      swift_bridgeObjectRetain_n();
      OUTLINED_FUNCTION_20();
      v82 = OUTLINED_FUNCTION_4_7();
      v114 = (void (*)(uint64_t, char *, uint64_t))OUTLINED_FUNCTION_4_7();
      v117[0] = (uint64_t)v114;
      *(_DWORD *)v82 = 136446722;
      v83 = *(_QWORD *)(v81 + 16);
      OUTLINED_FUNCTION_33_8();
      OUTLINED_FUNCTION_27_10(v83, v84, v117);
      v115 = v85;
      OUTLINED_FUNCTION_243();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_178();
      *(_WORD *)(v82 + 12) = 2080;
      OUTLINED_FUNCTION_68_6();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_84_1();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_20_11(v115, v86, v117);
      v115 = v87;
      sub_1CF73F2A0();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_11_3();
      *(_WORD *)(v82 + 22) = 2080;
      v115 = v78;
      v116 = v79;
      OUTLINED_FUNCTION_211();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA1940);
      v88 = sub_1CF73EF10();
      sub_1CF68F110(v88, v89, v117);
      v115 = v90;
      OUTLINED_FUNCTION_243();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_57_9(&dword_1CF67E000, v91, v92, "%{public}s/%s: Tunnel connection path interface name: %s");
      OUTLINED_FUNCTION_187_0();
      OUTLINED_FUNCTION_0_1();
    }
    OUTLINED_FUNCTION_13_0();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v93, v94);
    goto LABEL_29;
  }
  v61 = 0;
  v101 = *MEMORY[0x1E0CCE378];
  v97 = *MEMORY[0x1E0CCE380];
  v99 = v27;
  v100 = v59;
  v102 = v56;
  v103 = v23;
  while (v61 < *(_QWORD *)(v57 + 16))
  {
    v111 = (*(unsigned __int8 *)(v59 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v59 + 80);
    v110 = *(_QWORD *)(v59 + 72);
    v62 = *(void (**)(uint64_t, unint64_t, uint64_t))(v59 + 16);
    v62(v23, v57 + v111 + v110 * v61, v60);
    OUTLINED_FUNCTION_27_11();
    if (v63)
      goto LABEL_21;
    v112 = v61;
    v64 = v113;
    v65 = OUTLINED_FUNCTION_259();
    v114 = v66;
    ((void (*)(uint64_t))v66)(v65);
    sub_1CF73E9E8();
    v108 = *(void (**)(char *, _QWORD, uint64_t))(v107 + 104);
    v108(v31, v101, v27);
    sub_1CF6935F8(&qword_1EFBA3788, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCE388], MEMORY[0x1E0CCE398]);
    v67 = OUTLINED_FUNCTION_38_8();
    OUTLINED_FUNCTION_71_6((uint64_t)v31);
    OUTLINED_FUNCTION_71_6((uint64_t)v33);
    v68 = (uint64_t)v106;
    v62((uint64_t)v106, (unint64_t)v64, v60);
    if ((v67 & 1) == 0)
    {
      v73 = v100;
      OUTLINED_FUNCTION_58_0(v68, *(uint64_t (**)(uint64_t, uint64_t))(v100 + 8));
      v59 = v73;
LABEL_14:
      v114((uint64_t)v109, v113, v60);
      v74 = v115;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v24 = v105;
      v23 = v103;
      v72 = v112;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        OUTLINED_FUNCTION_81_3(0, *(_QWORD *)(v74 + 16) + 1);
        v74 = v115;
      }
      v27 = v99;
      v77 = *(_QWORD *)(v74 + 16);
      v76 = *(_QWORD *)(v74 + 24);
      if (v77 >= v76 >> 1)
      {
        OUTLINED_FUNCTION_81_3(v76 > 1, v77 + 1);
        v74 = v115;
      }
      *(_QWORD *)(v74 + 16) = v77 + 1;
      v60 = v98;
      v114(v74 + v111 + v77 * v110, v109, v98);
      v115 = v74;
      goto LABEL_19;
    }
    sub_1CF73E9E8();
    v108(v31, v97, v27);
    v69 = OUTLINED_FUNCTION_38_8();
    OUTLINED_FUNCTION_71_6((uint64_t)v31);
    OUTLINED_FUNCTION_71_6((uint64_t)v33);
    v70 = v100;
    v71 = *(void (**)(uint64_t, uint64_t))(v100 + 8);
    v71(v68, v60);
    v59 = v70;
    if ((v69 & 1) == 0)
      goto LABEL_14;
    v71((uint64_t)v113, v60);
    v24 = v105;
    v27 = v99;
    v23 = v103;
    v72 = v112;
LABEL_19:
    v61 = v72 + 1;
    v57 = v102;
    if (v104 == v61)
      goto LABEL_20;
  }
  __break(1u);
LABEL_31:
  swift_once();
LABEL_3:
  if (OUTLINED_FUNCTION_28_6())
  {
    OUTLINED_FUNCTION_20();
    v47 = OUTLINED_FUNCTION_4_7();
    v117[0] = OUTLINED_FUNCTION_4_7();
    *(_DWORD *)v47 = 136446466;
    v48 = OUTLINED_FUNCTION_211();
    OUTLINED_FUNCTION_98_2(v48, v49, v117);
    v115 = v50;
    OUTLINED_FUNCTION_243();
    OUTLINED_FUNCTION_107();
    *(_WORD *)(v47 + 12) = 2080;
    OUTLINED_FUNCTION_68_6();
    OUTLINED_FUNCTION_6_6();
    OUTLINED_FUNCTION_100_1();
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_20_11(v115, v51, v117);
    v115 = v52;
    sub_1CF73F2A0();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_11_3();
    OUTLINED_FUNCTION_47_10(&dword_1CF67E000, v53, v54, "%{public}s/%s: Tunnel connection path is nil");
    OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_0_1();
  }
LABEL_29:
  OUTLINED_FUNCTION_17();
}

void TCPTunnelConnection.tunnelIdentifier.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

uint64_t TCPTunnelConnection.identifier.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_58_6(*(_QWORD *)(v1 + 40), a1);
}

uint64_t TCPTunnelConnection.stream.getter()
{
  return swift_retain();
}

void sub_1CF718D78(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  sub_1CF6A7B18(*a1, v2);
  sub_1CF718DF4(v1, v2);
}

uint64_t sub_1CF718DB8()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_2_0();
  v0 = OUTLINED_FUNCTION_69();
  sub_1CF6A7B18(v0, v1);
  return OUTLINED_FUNCTION_69();
}

void sub_1CF718DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  OUTLINED_FUNCTION_10();
  v5 = *(_QWORD *)(v2 + 56);
  v6 = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  sub_1CF693FE0(v5, v6);
  OUTLINED_FUNCTION_5();
}

void sub_1CF718E34()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

void sub_1CF718E68()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2();
}

void sub_1CF718E8C(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_10();
  *(_QWORD *)(v1 + 72) = a1;
  OUTLINED_FUNCTION_26();
}

void sub_1CF718EBC()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

void sub_1CF718EF0()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2();
}

void sub_1CF718F14()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

uint64_t TCPTunnelConnection.__allocating_init(tunnelIdentifier:stream:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_16();
  TCPTunnelConnection.init(tunnelIdentifier:stream:)(a1, a2, a3);
  return v6;
}

uint64_t TCPTunnelConnection.init(tunnelIdentifier:stream:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_OWORD *)(v3 + 56) = xmmword_1CF743C90;
  *(_OWORD *)(v3 + 72) = xmmword_1CF747AE0;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  v6 = OUTLINED_FUNCTION_87_4();
  OUTLINED_FUNCTION_16_8(v6, v7, v8, v9, v10, v11, v12, v13, v16, v17, v18, v19);
  if (!v4)
  {
    if (v20 <= 8)
    {
      *(_QWORD *)(v6 + 16) = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1EC0);
      sub_1CF6D23E4((unint64_t *)&qword_1EFBA1EC8, &qword_1EFBA1EC0);
      *(_QWORD *)(v3 + 32) = sub_1CF73EFB8();
      *(_QWORD *)(v3 + 40) = v14;
      *(_QWORD *)(v3 + 48) = a3;
      return v3;
    }
    __break(1u);
  }
  if (v20 > 8)
    __break(1u);
  *(_QWORD *)(v6 + 16) = v20;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

void sub_1CF719068()
{
  void (**v0)(uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_167();
  v3 = v2;
  v5 = v4;
  v6 = sub_1CF73EA6C();
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_13();
  v8 = OUTLINED_FUNCTION_16();
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = v3;
  *v0 = sub_1CF6F49E4;
  v0[1] = (void (*)(uint64_t))v8;
  (*(void (**)(void (**)(uint64_t), _QWORD, uint64_t))(v1 + 104))(v0, *MEMORY[0x1E0CCE460], v6);
  sub_1CF73EA60();
  OUTLINED_FUNCTION_190();
  sub_1CF73EA48();
  sub_1CF73EAA8();
  OUTLINED_FUNCTION_298();
  OUTLINED_FUNCTION_37_0((uint64_t)v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1CF71913C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_12_11();
  v3 = (_QWORD *)OUTLINED_FUNCTION_16();
  v3[2] = v2;
  v3[3] = v1;
  v3[4] = v0;
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_52();
  sub_1CF73EAF0();
  return swift_release();
}

void sub_1CF7191A4()
{
  sub_1CF73EAE4();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF7191C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_167();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v6 = (_QWORD *)OUTLINED_FUNCTION_16();
  v6[2] = v5;
  v6[3] = v3;
  v6[4] = v1;
  v7 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_30_8();
  v8 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_346();
  v9 = (_QWORD *)OUTLINED_FUNCTION_16();
  v9[2] = v7;
  v9[3] = v8;
  v9[4] = sub_1CF71F8C0;
  v9[5] = v6;
  v10 = v5;
  OUTLINED_FUNCTION_83();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_121();
  sub_1CF6A3AE0((uint64_t)sub_1CF71F938);
  sub_1CF73EA78();
  swift_release();
  swift_release();
  swift_release();
  v11 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_30_8();
  v12 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_346();
  v13 = OUTLINED_FUNCTION_16();
  *(_QWORD *)(v13 + 16) = v11;
  *(_QWORD *)(v13 + 24) = v12;
  OUTLINED_FUNCTION_350();
  OUTLINED_FUNCTION_112_0();
  sub_1CF6A3AE0((uint64_t)sub_1CF71F948);
  sub_1CF73EA84();
  OUTLINED_FUNCTION_260();
  OUTLINED_FUNCTION_50_3();
  OUTLINED_FUNCTION_298();
  sub_1CF73EACC();
  return swift_release();
}

uint64_t sub_1CF719354(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *), uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t Strong;
  void (*v26)(char *, uint64_t, uint64_t);
  int v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  char *v43;
  os_log_type_t v44;
  NSObject *v45;
  char *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  os_log_type_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  os_log_type_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  os_log_type_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  os_log_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  void (*v102)(uint64_t *);
  uint64_t v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;

  v101 = a5;
  v102 = a4;
  v103 = sub_1CF73EC88();
  v6 = *(_QWORD *)(v103 - 8);
  v7 = MEMORY[0x1E0C80A78](v103);
  v99 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v100 = (char *)&v95 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v95 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v95 - v14;
  v16 = sub_1CF73EAC0();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v95 - v21;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v24 = result;
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (!Strong)
      return swift_release();
    v98 = Strong;
    v26 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
    v26(v22, a1, v16);
    v27 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v22, v16);
    if (v27 == *MEMORY[0x1E0CCE5C8])
    {
      (*(void (**)(char *, uint64_t))(v17 + 96))(v22, v16);
      v28 = v6;
      v29 = v103;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v15, v22, v103);
      v30 = sub_1CF73F0E4();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v31 = qword_1EFBA3780;
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v13, v15, v29);
      v32 = v30;
      if (os_log_type_enabled(v31, v30))
      {
        swift_retain_n();
        v33 = swift_slowAlloc();
        v100 = (char *)swift_slowAlloc();
        v104 = v100;
        *(_DWORD *)v33 = 136446722;
        v97 = v28;
        v34 = *(_QWORD *)(v24 + 16);
        v35 = *(_QWORD *)(v24 + 24);
        swift_bridgeObjectRetain();
        sub_1CF68F110(v34, v35, (uint64_t *)&v104);
        v105 = v36;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v33 + 12) = 2080;
        v105 = 0x5F6E6F6374;
        v106 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1CF73EF58();
        v29 = v103;
        swift_bridgeObjectRelease();
        sub_1CF68F110(v105, v106, (uint64_t *)&v104);
        v105 = v37;
        sub_1CF73F2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v33 + 22) = 2082;
        sub_1CF6935F8((unint64_t *)&unk_1EFBA3770, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
        v38 = sub_1CF73F720();
        sub_1CF68F110(v38, v39, (uint64_t *)&v104);
        v105 = v40;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        v41 = *(void (**)(char *, uint64_t))(v97 + 8);
        v41(v13, v29);
        _os_log_impl(&dword_1CF67E000, v31, v32, "%{public}s/%s: Tunnel connection waiting, error: %{public}s", (uint8_t *)v33, 0x20u);
        v42 = v100;
        swift_arrayDestroy();
        MEMORY[0x1D17D3ED0](v42, -1, -1);
        MEMORY[0x1D17D3ED0](v33, -1, -1);
      }
      else
      {
        v41 = *(void (**)(char *, uint64_t))(v28 + 8);
        v41(v13, v29);
      }
      sub_1CF73EAE4();
      LOBYTE(v105) = 1;
      v102(&v105);
      swift_release();
      swift_release();
      v59 = v15;
      return ((uint64_t (*)(char *, uint64_t))v41)(v59, v29);
    }
    if (v27 == *MEMORY[0x1E0CCE5C0])
    {
      (*(void (**)(char *, uint64_t))(v17 + 96))(v22, v16);
      v43 = v100;
      v29 = v103;
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v100, v22, v103);
      v44 = sub_1CF73F0CC();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v45 = qword_1EFBA3780;
      v46 = v99;
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v99, v43, v29);
      v47 = v44;
      if (os_log_type_enabled(v45, v44))
      {
        swift_retain_n();
        v48 = swift_slowAlloc();
        v49 = swift_slowAlloc();
        v104 = (char *)v49;
        *(_DWORD *)v48 = 136446722;
        v96 = v45;
        v97 = v6;
        v50 = v46;
        v51 = *(_QWORD *)(v24 + 16);
        v52 = *(_QWORD *)(v24 + 24);
        swift_bridgeObjectRetain();
        sub_1CF68F110(v51, v52, (uint64_t *)&v104);
        v105 = v53;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v48 + 12) = 2080;
        v105 = 0x5F6E6F6374;
        v106 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1CF73EF58();
        v29 = v103;
        swift_bridgeObjectRelease();
        sub_1CF68F110(v105, v106, (uint64_t *)&v104);
        v105 = v54;
        sub_1CF73F2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v48 + 22) = 2082;
        sub_1CF6935F8((unint64_t *)&unk_1EFBA3770, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
        v55 = sub_1CF73F720();
        sub_1CF68F110(v55, v56, (uint64_t *)&v104);
        v105 = v57;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        v41 = *(void (**)(char *, uint64_t))(v97 + 8);
        v41(v50, v29);
        _os_log_impl(&dword_1CF67E000, v96, v47, "%{public}s/%s: Tunnel connection failed, error: %{public}s", (uint8_t *)v48, 0x20u);
        swift_arrayDestroy();
        v58 = v49;
        v43 = v100;
        MEMORY[0x1D17D3ED0](v58, -1, -1);
        MEMORY[0x1D17D3ED0](v48, -1, -1);
      }
      else
      {
        v41 = *(void (**)(char *, uint64_t))(v6 + 8);
        v41(v46, v29);
      }
      sub_1CF73EAE4();
      LOBYTE(v105) = 1;
      v102(&v105);
      swift_release();
      swift_release();
      v59 = v43;
      return ((uint64_t (*)(char *, uint64_t))v41)(v59, v29);
    }
    if (v27 == *MEMORY[0x1E0CCE5B8])
    {
      v60 = sub_1CF73F0E4();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v61 = qword_1EFBA3780;
      swift_retain();
      v62 = v60;
      if (os_log_type_enabled(v61, v60))
      {
        swift_retain();
        v63 = v24;
        v64 = swift_slowAlloc();
        v65 = swift_slowAlloc();
        v104 = (char *)v65;
        *(_DWORD *)v64 = 136446466;
        v66 = *(_QWORD *)(v63 + 16);
        v67 = *(_QWORD *)(v63 + 24);
        swift_bridgeObjectRetain();
        sub_1CF68F110(v66, v67, (uint64_t *)&v104);
        v105 = v68;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v64 + 12) = 2080;
        v105 = 0x5F6E6F6374;
        v106 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1CF73EF58();
        swift_bridgeObjectRelease();
        sub_1CF68F110(v105, v106, (uint64_t *)&v104);
        v105 = v69;
        sub_1CF73F2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        v70 = "%{public}s/%s: Tunnel connection setup";
LABEL_28:
        _os_log_impl(&dword_1CF67E000, v61, v62, v70, (uint8_t *)v64, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D17D3ED0](v65, -1, -1);
        MEMORY[0x1D17D3ED0](v64, -1, -1);
        swift_release();
        return swift_release();
      }
    }
    else
    {
      if (v27 != *MEMORY[0x1E0CCE5D8])
      {
        if (v27 == *MEMORY[0x1E0CCE5B0])
        {
          v77 = sub_1CF73F0E4();
          if (qword_1EFBA09E0 != -1)
            swift_once();
          v78 = qword_1EFBA3780;
          if (os_log_type_enabled((os_log_t)qword_1EFBA3780, v77))
          {
            swift_retain_n();
            v79 = v24;
            v80 = swift_slowAlloc();
            v81 = swift_slowAlloc();
            v104 = (char *)v81;
            *(_DWORD *)v80 = 136446466;
            v82 = *(_QWORD *)(v79 + 16);
            v83 = *(_QWORD *)(v79 + 24);
            swift_bridgeObjectRetain();
            sub_1CF68F110(v82, v83, (uint64_t *)&v104);
            v105 = v84;
            sub_1CF73F2A0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v80 + 12) = 2080;
            v105 = 0x5F6E6F6374;
            v106 = 0xE500000000000000;
            swift_bridgeObjectRetain();
            sub_1CF73EF58();
            swift_bridgeObjectRelease();
            sub_1CF68F110(v105, v106, (uint64_t *)&v104);
            v105 = v85;
            sub_1CF73F2A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1CF67E000, v78, v77, "%{public}s/%s: Tunnel connection established", (uint8_t *)v80, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1D17D3ED0](v81, -1, -1);
            MEMORY[0x1D17D3ED0](v80, -1, -1);
          }
          LOBYTE(v105) = 0;
          v102(&v105);
        }
        else
        {
          if (v27 != *MEMORY[0x1E0CCE5D0])
          {
            v26(v20, a1, v16);
            v105 = 0;
            v106 = 0xE000000000000000;
            sub_1CF73F348();
            sub_1CF73EF58();
            sub_1CF73F408();
            result = sub_1CF73F450();
            __break(1u);
            return result;
          }
          v86 = sub_1CF73F0E4();
          if (qword_1EFBA09E0 != -1)
            swift_once();
          v87 = qword_1EFBA3780;
          if (os_log_type_enabled((os_log_t)qword_1EFBA3780, v86))
          {
            swift_retain_n();
            v88 = v24;
            v89 = swift_slowAlloc();
            v90 = swift_slowAlloc();
            v104 = (char *)v90;
            *(_DWORD *)v89 = 136446466;
            v91 = *(_QWORD *)(v88 + 16);
            v92 = *(_QWORD *)(v88 + 24);
            swift_bridgeObjectRetain();
            sub_1CF68F110(v91, v92, (uint64_t *)&v104);
            v105 = v93;
            sub_1CF73F2A0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v89 + 12) = 2080;
            v105 = 0x5F6E6F6374;
            v106 = 0xE500000000000000;
            swift_bridgeObjectRetain();
            sub_1CF73EF58();
            swift_bridgeObjectRelease();
            sub_1CF68F110(v105, v106, (uint64_t *)&v104);
            v105 = v94;
            sub_1CF73F2A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1CF67E000, v87, v86, "%{public}s/%s: Tunnel connection cancelled", (uint8_t *)v89, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1D17D3ED0](v90, -1, -1);
            MEMORY[0x1D17D3ED0](v89, -1, -1);
          }
          sub_1CF73EAE4();
          LOBYTE(v105) = 1;
          v102(&v105);
        }
        swift_release();
        return swift_release();
      }
      v71 = sub_1CF73F0E4();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v61 = qword_1EFBA3780;
      swift_retain();
      v62 = v71;
      if (os_log_type_enabled(v61, v71))
      {
        swift_retain();
        v72 = v24;
        v64 = swift_slowAlloc();
        v65 = swift_slowAlloc();
        v104 = (char *)v65;
        *(_DWORD *)v64 = 136446466;
        v73 = *(_QWORD *)(v72 + 16);
        v74 = *(_QWORD *)(v72 + 24);
        swift_bridgeObjectRetain();
        sub_1CF68F110(v73, v74, (uint64_t *)&v104);
        v105 = v75;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v64 + 12) = 2080;
        v105 = 0x5F6E6F6374;
        v106 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1CF73EF58();
        swift_bridgeObjectRelease();
        sub_1CF68F110(v105, v106, (uint64_t *)&v104);
        v105 = v76;
        sub_1CF73F2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        v70 = "%{public}s/%s: Tunnel connection preparing";
        goto LABEL_28;
      }
    }
    swift_release_n();
    return swift_release();
  }
  return result;
}

uint64_t sub_1CF71A2C0(char a1)
{
  uint64_t result;
  uint64_t v3;
  os_log_type_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = result;
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      if ((a1 & 1) == 0)
      {
        v4 = sub_1CF73F0CC();
        if (qword_1EFBA09E0 != -1)
          swift_once();
        v5 = qword_1EFBA3780;
        if (os_log_type_enabled((os_log_t)qword_1EFBA3780, v4))
        {
          swift_retain_n();
          v6 = swift_slowAlloc();
          v7 = swift_slowAlloc();
          v10 = v7;
          *(_DWORD *)v6 = 136446466;
          v8 = *(_QWORD *)(v3 + 16);
          v9 = *(_QWORD *)(v3 + 24);
          swift_bridgeObjectRetain();
          sub_1CF68F110(v8, v9, &v10);
          sub_1CF73F2A0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v6 + 12) = 2080;
          swift_bridgeObjectRetain();
          sub_1CF73EF58();
          swift_bridgeObjectRelease();
          sub_1CF68F110(0x5F6E6F6374, 0xE500000000000000, &v10);
          sub_1CF73F2A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CF67E000, v5, v4, "%{public}s/%s: Cancelling tunnel connection as it is no longer viable", (uint8_t *)v6, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1D17D3ED0](v7, -1, -1);
          MEMORY[0x1D17D3ED0](v6, -1, -1);
        }
        sub_1CF73EAE4();
        sub_1CF73EAE4();
      }
      swift_release();
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1CF71A530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = sub_1CF73E970();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_16_7();
  sub_1CF73F348();
  sub_1CF73EF58();
  swift_getMetatypeMetadata();
  sub_1CF73EF10();
  sub_1CF73EF58();
  swift_bridgeObjectRelease();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_7_15();
  OUTLINED_FUNCTION_296();
  OUTLINED_FUNCTION_259();
  sub_1CF73EF58();
  sub_1CF73EF58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CF73EF58();
  sub_1CF73EAFC();
  sub_1CF73F408();
  OUTLINED_FUNCTION_37_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  sub_1CF73EF58();
  return 0;
}

uint64_t TCPTunnelConnection.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1CF693FE0(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64));
  return v0;
}

uint64_t TCPTunnelConnection.__deallocating_deinit()
{
  TCPTunnelConnection.deinit();
  return swift_deallocClassInstance();
}

uint64_t (*sub_1CF71A6F4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_1CF71A738())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CF71A780()
{
  return sub_1CF71A530();
}

uint64_t sub_1CF71A7A0@<X0>(_QWORD *a1@<X8>)
{
  return TCPTunnelConnection.identifier.getter(a1);
}

void sub_1CF71A7C0()
{
  sub_1CF7191A4();
}

uint64_t sub_1CF71A7E0()
{
  return sub_1CF7191C0();
}

#error "1CF71A810: call analysis failed (funcsize=8)"

uint64_t sub_1CF71A820(__int16 a1, __int16 a2)
{
  if (a1 == 2)
    return a2 == 2;
  if (a1 == 3)
    return a2 == 3;
  if ((a2 & 0xFE) == 2)
    return 0;
  if (((a1 & 1) == 0) == (a2 & 1))
    return 0;
  else
    return ((a1 & 0x100) == 0) ^ ((unsigned __int16)(a2 & 0x100) >> 8);
}

uint64_t sub_1CF71A898(__int16 *a1, __int16 *a2)
{
  return sub_1CF71A820(*a1, *a2);
}

uint64_t sub_1CF71A8A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  nw_protocol_metadata_t v5;
  uint64_t result;
  unsigned int v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16[2];

  v1 = v0;
  OUTLINED_FUNCTION_2_0();
  if (!*(_QWORD *)(v0 + 48))
    return 1280;
  v2 = OUTLINED_FUNCTION_121();
  v3 = MEMORY[0x1D17D26A0](v2);
  v4 = nw_protocol_copy_quic_definition();
  v5 = nw_connection_copy_protocol_metadata(v3, v4);
  swift_unknownObjectRelease();
  result = swift_unknownObjectRelease();
  if (v5)
  {
    v7 = MEMORY[0x1D17D3924](v5);
    v8 = sub_1CF73F0E4();
    if (qword_1EFBA09E0 != -1)
      swift_once();
    v9 = qword_1EFBA3780;
    OUTLINED_FUNCTION_20();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = OUTLINED_FUNCTION_4_7();
      v16[0] = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)v10 = 136446722;
      v11 = *(_QWORD *)(v1 + 56);
      OUTLINED_FUNCTION_33_8();
      OUTLINED_FUNCTION_27_10(v11, v12, v16);
      OUTLINED_FUNCTION_243();
      OUTLINED_FUNCTION_178();
      *(_WORD *)(v10 + 12) = 2080;
      OUTLINED_FUNCTION_7_15();
      v15 = v13;
      swift_bridgeObjectRetain();
      sub_1CF73EF58();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_20_11(v15, v14, v16);
      sub_1CF73F2A0();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_11_3();
      *(_WORD *)(v10 + 22) = 2048;
      sub_1CF73F2A0();
      _os_log_impl(&dword_1CF67E000, v9, v8, "%{public}s/%s: Tunnel MTU datagaram = %ld", (uint8_t *)v10, 0x20u);
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_0_1();
    }
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_96();
    swift_unknownObjectRelease();
    if (v7)
      return v7;
    else
      return 1280;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1CF71AB0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
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
  unint64_t v62;
  void (*v63)(uint64_t, unint64_t, uint64_t);
  char v64;
  char *v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t);
  uint64_t v73;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
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
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD v94[2];
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  void (*v111)(uint64_t, _QWORD, uint64_t);
  uint64_t v112;
  uint64_t v113;
  char *v114;
  unint64_t v115;
  char *v116;
  void (*v117)(char *, uint64_t, uint64_t);
  uint64_t v118[2];
  uint64_t v119[5];

  OUTLINED_FUNCTION_167();
  a19 = v24;
  a20 = v25;
  v26 = v20;
  v27 = sub_1CF73E9D0();
  v109 = *(_QWORD *)(v27 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_24_0();
  v110 = v29;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v30);
  v32 = (char *)v94 - v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2048);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_3_10();
  MEMORY[0x1E0C80A78](v34);
  v107 = OUTLINED_FUNCTION_52_6();
  v35 = *(_QWORD *)(v107 - 8);
  MEMORY[0x1E0C80A78](v107);
  OUTLINED_FUNCTION_24_0();
  v114 = v36;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v37);
  v108 = (char *)v94 - v38;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v39);
  v116 = (char *)v94 - v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2CD8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_16_7();
  v42 = sub_1CF73EC7C();
  v43 = *(_QWORD *)(v42 - 8);
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_34();
  v99 = v45 - v44;
  OUTLINED_FUNCTION_2_0();
  v46 = *(_QWORD *)(v26 + 48);
  if (!v46)
  {
    sub_1CF73F0D8();
    if (qword_1EFBA09E0 != -1)
      goto LABEL_35;
    goto LABEL_8;
  }
  v97 = v43;
  swift_retain();
  v98 = v42;
  sub_1CF73EA3C();
  v47 = v98;
  if (__swift_getEnumTagSinglePayload(v21, 1, v98) == 1)
  {
    sub_1CF693ED8(v21, &qword_1EFBA2CD8);
    sub_1CF73F0D8();
    if (qword_1EFBA09E0 != -1)
      swift_once();
    if (OUTLINED_FUNCTION_28_6())
    {
      OUTLINED_FUNCTION_20();
      v48 = OUTLINED_FUNCTION_4_7();
      v49 = OUTLINED_FUNCTION_4_7();
      v96 = v46;
      v119[0] = v49;
      *(_DWORD *)v48 = 136446466;
      v50 = OUTLINED_FUNCTION_211();
      OUTLINED_FUNCTION_98_2(v50, v51, v119);
      v118[0] = v52;
      OUTLINED_FUNCTION_243();
      OUTLINED_FUNCTION_107();
      *(_WORD *)(v48 + 12) = 2080;
      OUTLINED_FUNCTION_67_5();
      OUTLINED_FUNCTION_6_6();
      OUTLINED_FUNCTION_100_1();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_20_11(v118[0], v53, v119);
      v118[0] = v54;
      sub_1CF73F2A0();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_47_10(&dword_1CF67E000, v55, v56, "%{public}s/%s: Tunnel connection path is nil");
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_0_1();
    }
    swift_release();
    goto LABEL_33;
  }
  v94[1] = v22;
  v95 = v26;
  v96 = v46;
  v57 = v99;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v97 + 32))(v99, v21, v47);
  v58 = sub_1CF73EC70();
  v59 = v58;
  v118[0] = MEMORY[0x1E0DEE9D8];
  v60 = v107;
  v61 = v110;
  v106 = *(_QWORD *)(v58 + 16);
  if (!v106)
  {
LABEL_23:
    OUTLINED_FUNCTION_54_8();
LABEL_24:
    OUTLINED_FUNCTION_107();
    sub_1CF693ED8(v23, &qword_1EFBA2048);
    OUTLINED_FUNCTION_64_8((uint64_t)&a10);
    OUTLINED_FUNCTION_96();
    if (__swift_getEnumTagSinglePayload(v57, 1, v60) == 1)
    {
      sub_1CF693ED8(v57, &qword_1EFBA2048);
      v79 = 0;
      v80 = 0;
    }
    else
    {
      v79 = sub_1CF73E9DC();
      v80 = v81;
      OUTLINED_FUNCTION_58_0(v57, *(uint64_t (**)(uint64_t, uint64_t))(v35 + 8));
    }
    v82 = v95;
    sub_1CF73F0E4();
    if (qword_1EFBA09E0 != -1)
      swift_once();
    OUTLINED_FUNCTION_20();
    if (OUTLINED_FUNCTION_60_5())
    {
      swift_bridgeObjectRetain_n();
      OUTLINED_FUNCTION_20();
      v83 = OUTLINED_FUNCTION_4_7();
      v117 = (void (*)(char *, uint64_t, uint64_t))OUTLINED_FUNCTION_4_7();
      v119[0] = (uint64_t)v117;
      *(_DWORD *)v83 = 136446722;
      v84 = *(_QWORD *)(v82 + 56);
      OUTLINED_FUNCTION_33_8();
      OUTLINED_FUNCTION_27_10(v84, v85, v119);
      v118[0] = v86;
      OUTLINED_FUNCTION_243();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_178();
      *(_WORD *)(v83 + 12) = 2080;
      OUTLINED_FUNCTION_67_5();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_84_1();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_20_11(v118[0], v87, v119);
      v118[0] = v88;
      sub_1CF73F2A0();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_11_3();
      *(_WORD *)(v83 + 22) = 2080;
      v118[0] = v79;
      v118[1] = v80;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA1940);
      v89 = sub_1CF73EF10();
      sub_1CF68F110(v89, v90, v119);
      v118[0] = v91;
      OUTLINED_FUNCTION_243();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_57();
      OUTLINED_FUNCTION_57_9(&dword_1CF67E000, v92, v93, "%{public}s/%s: Tunnel connection path interface name: %s");
      OUTLINED_FUNCTION_187_0();
      OUTLINED_FUNCTION_0_1();
    }
    OUTLINED_FUNCTION_95_2();
    OUTLINED_FUNCTION_13_0();
    (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v99, v98);
    goto LABEL_33;
  }
  v62 = 0;
  v103 = *MEMORY[0x1E0CCE378];
  v100 = *MEMORY[0x1E0CCE380];
  v101 = v27;
  v104 = v58;
  v105 = v23;
  v102 = v35;
  while (v62 < *(_QWORD *)(v59 + 16))
  {
    v57 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    v113 = *(_QWORD *)(v35 + 72);
    v63 = *(void (**)(uint64_t, unint64_t, uint64_t))(v35 + 16);
    v63(v23, v59 + v57 + v113 * v62, v60);
    OUTLINED_FUNCTION_27_11();
    if (v64)
      goto LABEL_24;
    v112 = v57;
    v115 = v62;
    v65 = v116;
    v117 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 32);
    v117(v116, v23, v60);
    sub_1CF73E9E8();
    v111 = *(void (**)(uint64_t, _QWORD, uint64_t))(v109 + 104);
    v111(v61, v103, v27);
    sub_1CF6935F8(&qword_1EFBA3788, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCE388], MEMORY[0x1E0CCE398]);
    v57 = OUTLINED_FUNCTION_32_7();
    OUTLINED_FUNCTION_65_4(v61);
    OUTLINED_FUNCTION_65_4((uint64_t)v32);
    v63((uint64_t)v108, (unint64_t)v65, v60);
    if ((v57 & 1) == 0)
    {
      v70 = v102;
      v71 = OUTLINED_FUNCTION_52();
      v72(v71);
      v35 = v70;
LABEL_17:
      v117(v114, (uint64_t)v116, v60);
      v73 = v118[0];
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v59 = v104;
      v23 = v105;
      v69 = v115;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v57 = (uint64_t)v118;
        OUTLINED_FUNCTION_81_3(0, *(_QWORD *)(v73 + 16) + 1);
        v73 = v118[0];
      }
      v27 = v101;
      v75 = v112;
      v77 = *(_QWORD *)(v73 + 16);
      v76 = *(_QWORD *)(v73 + 24);
      if (v77 >= v76 >> 1)
      {
        v57 = (uint64_t)v118;
        OUTLINED_FUNCTION_81_3(v76 > 1, v77 + 1);
        v75 = v112;
        v73 = v118[0];
      }
      *(_QWORD *)(v73 + 16) = v77 + 1;
      v78 = v73 + v75 + v77 * v113;
      v60 = v107;
      v117((char *)v78, (uint64_t)v114, v107);
      v118[0] = v73;
      goto LABEL_22;
    }
    sub_1CF73E9E8();
    v111(v61, v100, v27);
    v66 = OUTLINED_FUNCTION_32_7();
    OUTLINED_FUNCTION_65_4(v61);
    OUTLINED_FUNCTION_65_4((uint64_t)v32);
    v67 = v102;
    v57 = *(_QWORD *)(v102 + 8);
    v68 = OUTLINED_FUNCTION_52();
    ((void (*)(uint64_t))v57)(v68);
    v35 = v67;
    if ((v66 & 1) == 0)
      goto LABEL_17;
    ((void (*)(char *, uint64_t))v57)(v116, v60);
    v27 = v101;
    v59 = v104;
    v23 = v105;
    v69 = v115;
LABEL_22:
    v62 = v69 + 1;
    v61 = v110;
    if (v106 == v62)
      goto LABEL_23;
  }
  __break(1u);
LABEL_35:
  swift_once();
LABEL_8:
  sub_1CF73E694();
LABEL_33:
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1CF71B3D4()
{
  uint64_t v0;
  int v1;
  void (*v2)(char *);
  uint64_t result;
  void (*v4)(char *);
  char v5;
  char v6;

  v1 = *(unsigned __int8 *)(v0 + 16);
  if (v1 == 3)
  {
    v4 = *(void (**)(char *))(v0 + 88);
    if (v4)
    {
      v6 = 1;
      swift_retain();
      v4(&v6);
      sub_1CF693EC8((uint64_t)v4);
    }
    return sub_1CF71B714(0, 0);
  }
  else if (v1 == 2)
  {
    v2 = *(void (**)(char *))(v0 + 88);
    if (v2)
    {
      v5 = 0;
      swift_retain();
      v2(&v5);
      return sub_1CF693EC8((uint64_t)v2);
    }
  }
  return result;
}

void sub_1CF71B48C()
{
  uint64_t v0;

  v0 = swift_retain();
  sub_1CF71B4DC(v0);
}

void sub_1CF71B4B4()
{
  OUTLINED_FUNCTION_2_0();
  swift_retain();
  OUTLINED_FUNCTION_3_2();
}

void sub_1CF71B4DC(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_10();
  *(_QWORD *)(v1 + 24) = a1;
  swift_release();
  OUTLINED_FUNCTION_26();
}

void sub_1CF71B514()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

void sub_1CF71B548()
{
  OUTLINED_FUNCTION_2_0();
  swift_retain();
  OUTLINED_FUNCTION_3_2();
}

void sub_1CF71B570()
{
  uint64_t v0;

  v0 = swift_retain();
  sub_1CF71B5C0(v0);
}

void sub_1CF71B598()
{
  OUTLINED_FUNCTION_2_0();
  swift_retain();
  OUTLINED_FUNCTION_3_2();
}

void sub_1CF71B5C0(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_10();
  *(_QWORD *)(v1 + 40) = a1;
  swift_release();
  OUTLINED_FUNCTION_26();
}

void sub_1CF71B5F8()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

void sub_1CF71B62C()
{
  uint64_t v0;

  v0 = swift_retain();
  sub_1CF71B67C(v0);
}

void sub_1CF71B654()
{
  OUTLINED_FUNCTION_2_0();
  swift_retain();
  OUTLINED_FUNCTION_3_2();
}

void sub_1CF71B67C(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_10();
  *(_QWORD *)(v1 + 48) = a1;
  swift_release();
  OUTLINED_FUNCTION_26();
}

void sub_1CF71B6B4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

void QUICTunnelConnection.tunnelIdentifier.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

uint64_t QUICTunnelConnection.identifier.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return OUTLINED_FUNCTION_58_6(*(_QWORD *)(v1 + 80), a1);
}

uint64_t sub_1CF71B714(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return sub_1CF693EC8(v3);
}

uint64_t QUICTunnelConnection.__allocating_init(tunnelIdentifier:group:options:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12_11();
  v2 = OUTLINED_FUNCTION_16();
  v3 = OUTLINED_FUNCTION_52();
  QUICTunnelConnection.init(tunnelIdentifier:group:options:)(v3, v4, v1, v0);
  return v2;
}

uint64_t QUICTunnelConnection.init(tunnelIdentifier:group:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v24;

  *(_WORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 48) = 0;
  *(_QWORD *)(v4 + 88) = 0;
  *(_QWORD *)(v4 + 96) = 0;
  v10 = OUTLINED_FUNCTION_87_4();
  OUTLINED_FUNCTION_16_8(v10, v11, v12, v13, v14, v15, v16, v17, v20, v21, v22, v23);
  if (!v5)
  {
    if (v24 <= 8)
    {
      *(_QWORD *)(v10 + 16) = v24;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1EC0);
      sub_1CF6D23E4((unint64_t *)&qword_1EFBA1EC8, &qword_1EFBA1EC0);
      *(_QWORD *)(v4 + 72) = sub_1CF73EFB8();
      *(_QWORD *)(v4 + 80) = v18;
      *(_QWORD *)(v4 + 56) = a1;
      *(_QWORD *)(v4 + 64) = a2;
      *(_QWORD *)(v4 + 24) = a3;
      *(_QWORD *)(v4 + 32) = a4;
      return v4;
    }
    __break(1u);
  }
  if (v24 > 8)
    __break(1u);
  *(_QWORD *)(v10 + 16) = v24;
  result = OUTLINED_FUNCTION_107();
  __break(1u);
  return result;
}

uint64_t sub_1CF71B854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  void *v23;
  uint64_t result;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t *v40;
  uint64_t aBlock;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void *v44;
  void (*v45)(int);
  _QWORD *v46;
  uint64_t v47;

  OUTLINED_FUNCTION_2_0();
  v7 = *(_QWORD *)(v3 + 48);
  if (!v7)
  {
    sub_1CF73F0CC();
    if (qword_1EFBA09E0 == -1)
      goto LABEL_11;
    goto LABEL_15;
  }
  v8 = *(_QWORD *)(a1 + 16);
  if (v8 >> 60)
  {
    __break(1u);
LABEL_15:
    swift_once();
LABEL_11:
    v25 = qword_1EFBA3780;
    result = OUTLINED_FUNCTION_28_6();
    if ((_DWORD)result)
    {
      OUTLINED_FUNCTION_20();
      v26 = OUTLINED_FUNCTION_4_7();
      v47 = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)v26 = 136446466;
      v27 = OUTLINED_FUNCTION_6_6();
      OUTLINED_FUNCTION_55_5(v27, v28, &v47);
      OUTLINED_FUNCTION_243();
      OUTLINED_FUNCTION_57();
      *(_WORD *)(v26 + 12) = 2080;
      OUTLINED_FUNCTION_7_15();
      aBlock = v29;
      v42 = v30;
      OUTLINED_FUNCTION_33_8();
      OUTLINED_FUNCTION_50_7();
      OUTLINED_FUNCTION_178();
      OUTLINED_FUNCTION_20_11(aBlock, v31, &v47);
      aBlock = v32;
      OUTLINED_FUNCTION_103_0();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_46_6(&dword_1CF67E000, v25, (os_log_type_t)v7, "%{public}s/%s: Tunnel stream trying to send packets on a nil datagram stream");
      OUTLINED_FUNCTION_24_9();
      OUTLINED_FUNCTION_0_1();
    }
    return result;
  }
  OUTLINED_FUNCTION_20();
  v9 = OUTLINED_FUNCTION_4_7();
  if (v8)
  {
    v34 = a2;
    v37 = a3;
    OUTLINED_FUNCTION_296();
    v35 = v8;
    v36 = a1;
    v10 = (unint64_t *)(a1 + 120);
    v33 = v9;
    v11 = (uint64_t *)v9;
    while (1)
    {
      v39 = v8;
      v40 = v11;
      v13 = *(v10 - 7);
      v12 = *(v10 - 6);
      v15 = *(v10 - 5);
      v14 = *(v10 - 4);
      v16 = *(v10 - 3);
      v17 = *(v10 - 2);
      v18 = *(v10 - 1);
      v19 = *v10;
      sub_1CF6934BC(v13, v12);
      sub_1CF6934BC(v15, v14);
      v38 = v16;
      sub_1CF6D233C(v16, v17);
      sub_1CF6934BC(v18, v19);
      v20 = (void *)sub_1CF73E58C();
      v21 = NWCreateDispatchDataFromNSData();

      if (!v21)
        break;
      v10 += 12;
      *v40 = v21;
      v11 = v40 + 1;
      sub_1CF6933C0(v13, v12);
      sub_1CF6933C0(v15, v14);
      sub_1CF6D2368(v38, v17);
      sub_1CF6933C0(v18, v19);
      v8 = v39 - 1;
      if (v39 == 1)
      {
        a1 = v36;
        swift_bridgeObjectRelease();
        a3 = v37;
        a2 = v34;
        v8 = v35;
        v9 = v33;
        goto LABEL_8;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_8:
    MEMORY[0x1D17D26A0]();
    OUTLINED_FUNCTION_50_3();
    if (!HIDWORD(v8))
    {
      v22 = (_QWORD *)OUTLINED_FUNCTION_16();
      v22[2] = v9;
      v22[3] = a1;
      v22[4] = a2;
      v22[5] = a3;
      v45 = sub_1CF71F970;
      v46 = v22;
      aBlock = MEMORY[0x1E0C809B0];
      v42 = 1107296256;
      v43 = sub_1CF717C2C;
      v44 = &block_descriptor_12;
      v23 = _Block_copy(&aBlock);
      OUTLINED_FUNCTION_296();
      OUTLINED_FUNCTION_350();
      OUTLINED_FUNCTION_16_0();
      nw_connection_write_multiple();
      OUTLINED_FUNCTION_50_3();
      _Block_release(v23);
      return swift_unknownObjectRelease();
    }
  }
  result = sub_1CF73F444();
  __break(1u);
  return result;
}

void sub_1CF71BBF4(int a1, uint64_t a2, uint64_t a3, void (*a4)(void *))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;

  v7 = sub_1CF73E3C4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF6B3208(0, &qword_1EFBA3A98);
  swift_arrayDestroy();
  MEMORY[0x1D17D3ED0](a2, -1, -1);
  if (a1)
  {
    sub_1CF73EE44();
    sub_1CF73E3A0();
    v11 = (void *)sub_1CF73E3B8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v11 = 0;
  }
  a4(v11);

}

uint64_t sub_1CF71BD24(uint64_t a1, void (*a2)(void *))
{
  uint64_t v2;
  uint64_t result;

  result = OUTLINED_FUNCTION_2_0();
  if (*(_QWORD *)(v2 + 40))
  {
    OUTLINED_FUNCTION_232();
    sub_1CF717C64(a1, a2);
    return OUTLINED_FUNCTION_305();
  }
  return result;
}

uint64_t sub_1CF71BD90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  uint64_t result;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, uint64_t, uint64_t);
  void *v22;
  uint64_t (*v23)(uint64_t, uint64_t, char, uint64_t);
  _QWORD *v24;
  uint64_t v25;

  OUTLINED_FUNCTION_2_0();
  if (*(_QWORD *)(v2 + 48))
  {
    v5 = OUTLINED_FUNCTION_16();
    *(_QWORD *)(v5 + 16) = MEMORY[0x1E0DEE9D8];
    v6 = OUTLINED_FUNCTION_2_4();
    MEMORY[0x1D17D26A0](v6);
    v7 = OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_345_0();
    v8 = (_QWORD *)OUTLINED_FUNCTION_16();
    v8[2] = v7;
    v8[3] = a1;
    v8[4] = a2;
    v8[5] = v5;
    v23 = sub_1CF71F9D8;
    v24 = v8;
    v19 = MEMORY[0x1E0C809B0];
    v20 = 1107296256;
    v21 = sub_1CF71C6D0;
    v22 = &block_descriptor_35;
    v9 = _Block_copy(&v19);
    OUTLINED_FUNCTION_232();
    OUTLINED_FUNCTION_112_0();
    OUTLINED_FUNCTION_298();
    nw_connection_receive_multiple();
    OUTLINED_FUNCTION_16_0();
    _Block_release(v9);
    OUTLINED_FUNCTION_50_3();
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_1CF73F0CC();
    if (qword_1EFBA09E0 != -1)
      swift_once();
    v11 = qword_1EFBA3780;
    result = OUTLINED_FUNCTION_70_6();
    if ((_DWORD)result)
    {
      OUTLINED_FUNCTION_20();
      v12 = OUTLINED_FUNCTION_4_7();
      v25 = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)v12 = 136446466;
      v13 = OUTLINED_FUNCTION_6_6();
      OUTLINED_FUNCTION_55_5(v13, v14, &v25);
      OUTLINED_FUNCTION_243();
      OUTLINED_FUNCTION_57();
      *(_WORD *)(v12 + 12) = 2080;
      OUTLINED_FUNCTION_7_15();
      v19 = v15;
      v20 = v16;
      OUTLINED_FUNCTION_33_8();
      OUTLINED_FUNCTION_50_7();
      OUTLINED_FUNCTION_178();
      OUTLINED_FUNCTION_20_11(v19, v17, &v25);
      v19 = v18;
      OUTLINED_FUNCTION_103_0();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_46_6(&dword_1CF67E000, v11, (os_log_type_t)a2, "%{public}s/%s: Tunnel stream trying to receive packets on a nil datagram stream");
      OUTLINED_FUNCTION_24_9();
      OUTLINED_FUNCTION_0_1();
    }
  }
  return result;
}

uint64_t sub_1CF71C000(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(void *, uint64_t), uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[2];
  void (*v48)(void *, uint64_t);
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned __int8 v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v13 = sub_1CF73EC88();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (a4)
    {
      swift_unknownObjectRetain();
      sub_1CF73EC94();
      sub_1CF6935F8((unint64_t *)&unk_1EFBA3770, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
      v18 = (void *)swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v19, v16, v13);
      a6(v18, 1);

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
    else
    {
      v20 = NWCreateNSDataFromDispatchData();
      if (v20)
      {
        v21 = (void *)v20;
        v22 = sub_1CF73E5A4();
        v24 = v23;

        sub_1CF6934BC(v22, v24);
        TunnelPacket.init(data:)(v22, v24, (uint64_t)&v61);
        v47[1] = a7;
        v48 = a6;
        v59 = v22;
        v60 = v24;
        v26 = (uint64_t *)(a8 + 16);
        v57 = v61;
        v56 = v62;
        v55 = v63;
        v54 = v64;
        v28 = v65;
        v27 = v66;
        v52 = v65;
        v53 = v66;
        v30 = v67;
        v29 = v68;
        v51 = v67;
        v31 = v69;
        v58 = v69;
        v49 = v70;
        v32 = v71;
        v33 = v72;
        v50 = v71;
        swift_beginAccess();
        sub_1CF6934BC(v28, v27);
        v34 = v29;
        sub_1CF6934BC(v30, v29);
        v35 = v31;
        v36 = v49;
        sub_1CF6D233C(v35, v49);
        v37 = v33;
        sub_1CF6934BC(v32, v33);
        sub_1CF709CC0();
        v38 = *(_QWORD *)(*v26 + 16);
        sub_1CF709D94(v38);
        v39 = *v26;
        *(_QWORD *)(v39 + 16) = v38 + 1;
        v40 = v39 + 96 * v38;
        *(_DWORD *)(v40 + 32) = v57;
        v41 = v55;
        *(_QWORD *)(v40 + 40) = v56;
        *(_QWORD *)(v40 + 48) = v41;
        *(_BYTE *)(v40 + 56) = v54;
        v42 = v52;
        v43 = v53;
        *(_QWORD *)(v40 + 64) = v52;
        *(_QWORD *)(v40 + 72) = v43;
        v44 = v51;
        *(_QWORD *)(v40 + 80) = v51;
        *(_QWORD *)(v40 + 88) = v34;
        *(_QWORD *)(v40 + 96) = v58;
        *(_QWORD *)(v40 + 104) = v36;
        v45 = v50;
        *(_QWORD *)(v40 + 112) = v50;
        *(_QWORD *)(v40 + 120) = v37;
        swift_endAccess();
        sub_1CF6933C0(v42, v43);
        sub_1CF6933C0(v44, v34);
        sub_1CF6D2368(v58, v36);
        sub_1CF6933C0(v45, v37);
        if ((a3 & 1) != 0)
        {
          swift_beginAccess();
          v46 = swift_bridgeObjectRetain();
          v48((void *)v46, 0);
          swift_release();
          sub_1CF6933C0(v59, v60);
          return swift_bridgeObjectRelease();
        }
        else
        {
          swift_release();
          return sub_1CF6933C0(v59, v60);
        }
      }
      else
      {
        sub_1CF6AA5E0();
        sub_1CF73F738();
        v73 = v61;
        v74 = v62;
        sub_1CF6ABB3C();
        v25 = (void *)swift_allocError();
        sub_1CF73F780();
        a6(v25, 1);

        return swift_release();
      }
    }
  }
  return result;
}

void sub_1CF71C6D0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(void *, uint64_t, uint64_t, uint64_t);
  id v10;

  v9 = *(void (**)(void *, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v10 = a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9(a2, a3, a4, a5);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

void sub_1CF71C768(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  _QWORD *v6;

  OUTLINED_FUNCTION_2_0();
  v5 = *(_QWORD *)(v2 + 40);
  if (v5)
  {
    v6 = (_QWORD *)OUTLINED_FUNCTION_16();
    v6[2] = a1;
    v6[3] = a2;
    v6[4] = v5;
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_121();
    sub_1CF71913C();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_305();
  }
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1CF71C7E8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_4();
  sub_1CF73EC40();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_2_0();
  if (*(_QWORD *)(v0 + 40))
  {
    OUTLINED_FUNCTION_112_0();
    sub_1CF73EAE4();
    OUTLINED_FUNCTION_50_3();
  }
  OUTLINED_FUNCTION_2_0();
  if (*(_QWORD *)(v0 + 48))
  {
    OUTLINED_FUNCTION_2_4();
    sub_1CF73EAE4();
    OUTLINED_FUNCTION_16_0();
  }
  sub_1CF71B5C0(0);
  sub_1CF71B67C(0);
  *(_WORD *)(v0 + 16) = 3;
  return sub_1CF71B3D4();
}

uint64_t sub_1CF71C894(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v6 = (_QWORD *)OUTLINED_FUNCTION_16();
  v6[2] = a1;
  v6[3] = a2;
  v6[4] = a3;
  v7 = a1;
  OUTLINED_FUNCTION_2_4();
  sub_1CF71B714((uint64_t)sub_1CF71FA34, (uint64_t)v6);
  OUTLINED_FUNCTION_2_0();
  v8 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_345_0();
  v9 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_346();
  v10 = (_QWORD *)OUTLINED_FUNCTION_16();
  v10[2] = v8;
  v10[3] = v9;
  v10[4] = v7;
  v11 = v7;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_350();
  OUTLINED_FUNCTION_190();
  v12 = OUTLINED_FUNCTION_72_5();
  sub_1CF6A3AE0(v12);
  OUTLINED_FUNCTION_72_5();
  sub_1CF73EC10();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_260();
  OUTLINED_FUNCTION_298();
  OUTLINED_FUNCTION_357();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_345_0();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_232();
  v13 = OUTLINED_FUNCTION_52();
  sub_1CF6A3AE0(v13);
  OUTLINED_FUNCTION_52();
  sub_1CF73EC1C();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_2_4();
  sub_1CF73EC34();
  return OUTLINED_FUNCTION_16_0();
}

void sub_1CF71CA0C()
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
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];

  OUTLINED_FUNCTION_167();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v19 = *(_QWORD *)(sub_1CF73ED54() - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_99();
  v18 = sub_1CF73ED84();
  v12 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_34();
  v15 = v14 - v13;
  LOBYTE(v10) = *v10;
  v16 = OUTLINED_FUNCTION_16();
  *(_QWORD *)(v16 + 16) = v8;
  *(_QWORD *)(v16 + 24) = v6;
  *(_BYTE *)(v16 + 32) = (_BYTE)v10;
  v20[4] = v4;
  v20[5] = v16;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 1107296256;
  v20[2] = sub_1CF6CC068;
  v20[3] = v2;
  v17 = _Block_copy(v20);
  OUTLINED_FUNCTION_83();
  sub_1CF73ED6C();
  sub_1CF6935F8((unint64_t *)&qword_1ED8F79B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8F7A00);
  sub_1CF6D23E4((unint64_t *)&qword_1ED8F7A10, (uint64_t *)&unk_1ED8F7A00);
  sub_1CF73F2F4();
  MEMORY[0x1D17D2D90](0, v15, v0, v17);
  _Block_release(v17);
  OUTLINED_FUNCTION_37_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v18);
  swift_release();
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1CF71CBB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t result;
  uint64_t Strong;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  int v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  NSObject *v30;
  uint64_t v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  char *v43;
  uint64_t v44;
  os_log_type_t v45;
  NSObject *v46;
  os_log_t v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  os_log_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  os_log_type_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  os_log_type_t v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  os_log_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;

  v83 = a4;
  v87 = sub_1CF73EC88();
  v5 = *(_QWORD *)(v87 - 8);
  v6 = MEMORY[0x1E0C80A78](v87);
  v84 = (os_log_t)((char *)&v82 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x1E0C80A78](v6);
  v85 = (char *)&v82 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v82 - v11;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v82 - v13;
  v15 = sub_1CF73EC28();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v82 - v20;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v86 = result;
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v24 = Strong;
      v25 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
      v25(v21, a1, v15);
      v26 = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v21, v15);
      if (v26 == *MEMORY[0x1E0CCE968])
      {
        v83 = v24;
        (*(void (**)(char *, uint64_t))(v16 + 96))(v21, v15);
        v27 = v5;
        v28 = v87;
        (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v14, v21, v87);
        v29 = sub_1CF73F0E4();
        if (qword_1EFBA09E0 != -1)
          swift_once();
        v30 = qword_1EFBA3780;
        (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v12, v14, v28);
        v31 = v86;
        swift_retain();
        v32 = v29;
        if (os_log_type_enabled(v30, v29))
        {
          swift_retain();
          v33 = swift_slowAlloc();
          v85 = (char *)swift_slowAlloc();
          v90 = v85;
          *(_DWORD *)v33 = 136446722;
          v82 = v27;
          v84 = v30;
          v34 = *(_QWORD *)(v31 + 56);
          v35 = *(_QWORD *)(v31 + 64);
          swift_bridgeObjectRetain();
          sub_1CF68F110(v34, v35, (uint64_t *)&v90);
          v88 = v36;
          sub_1CF73F2A0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v33 + 12) = 2080;
          v88 = 0x5F6E6F6374;
          v89 = 0xE500000000000000;
          swift_bridgeObjectRetain();
          sub_1CF73EF58();
          swift_bridgeObjectRelease();
          sub_1CF68F110(v88, v89, (uint64_t *)&v90);
          v88 = v37;
          sub_1CF73F2A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v33 + 22) = 2080;
          sub_1CF6935F8((unint64_t *)&unk_1EFBA3770, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
          v38 = sub_1CF73F720();
          sub_1CF68F110(v38, v39, (uint64_t *)&v90);
          v88 = v40;
          sub_1CF73F2A0();
          swift_bridgeObjectRelease();
          v41 = *(void (**)(char *, uint64_t))(v82 + 8);
          v41(v12, v28);
          _os_log_impl(&dword_1CF67E000, v84, v32, "%{public}s/%s: Group tunnel connection waiting, error: %s", (uint8_t *)v33, 0x20u);
          v42 = v85;
          swift_arrayDestroy();
          MEMORY[0x1D17D3ED0](v42, -1, -1);
          MEMORY[0x1D17D3ED0](v33, -1, -1);
          swift_release();
          swift_release();
        }
        else
        {
          swift_release_n();
          swift_release();
          v41 = *(void (**)(char *, uint64_t))(v5 + 8);
          v41(v12, v28);
        }
        v62 = v14;
        v63 = v28;
        return ((uint64_t (*)(char *, uint64_t))v41)(v62, v63);
      }
      if (v26 == *MEMORY[0x1E0CCE960])
      {
        (*(void (**)(char *, uint64_t))(v16 + 96))(v21, v15);
        v43 = v85;
        v44 = v87;
        (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v85, v21, v87);
        v45 = sub_1CF73F0CC();
        if (qword_1EFBA09E0 != -1)
          swift_once();
        v46 = qword_1EFBA3780;
        v47 = v84;
        (*(void (**)(os_log_t, char *, uint64_t))(v5 + 16))(v84, v43, v44);
        v48 = v45;
        if (os_log_type_enabled(v46, v45))
        {
          v49 = v86;
          swift_retain_n();
          v50 = swift_slowAlloc();
          v83 = v24;
          v51 = v50;
          v52 = swift_slowAlloc();
          v90 = (char *)v52;
          *(_DWORD *)v51 = 136446722;
          v82 = v5;
          v53 = v47;
          v54 = *(_QWORD *)(v49 + 56);
          v55 = *(_QWORD *)(v49 + 64);
          swift_bridgeObjectRetain();
          sub_1CF68F110(v54, v55, (uint64_t *)&v90);
          v88 = v56;
          sub_1CF73F2A0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v51 + 12) = 2080;
          v88 = 0x5F6E6F6374;
          v89 = 0xE500000000000000;
          swift_bridgeObjectRetain();
          sub_1CF73EF58();
          v44 = v87;
          swift_bridgeObjectRelease();
          sub_1CF68F110(v88, v89, (uint64_t *)&v90);
          v88 = v57;
          sub_1CF73F2A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v51 + 22) = 2080;
          sub_1CF6935F8((unint64_t *)&unk_1EFBA3770, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
          v58 = sub_1CF73F720();
          sub_1CF68F110(v58, v59, (uint64_t *)&v90);
          v88 = v60;
          sub_1CF73F2A0();
          swift_bridgeObjectRelease();
          v41 = *(void (**)(char *, uint64_t))(v82 + 8);
          v41((char *)v53, v44);
          _os_log_impl(&dword_1CF67E000, v46, v48, "%{public}s/%s: Group tunnel connection failed, error: %s", (uint8_t *)v51, 0x20u);
          swift_arrayDestroy();
          v61 = v52;
          v43 = v85;
          MEMORY[0x1D17D3ED0](v61, -1, -1);
          MEMORY[0x1D17D3ED0](v51, -1, -1);
        }
        else
        {
          v41 = *(void (**)(char *, uint64_t))(v5 + 8);
          v41((char *)v47, v44);
        }
        sub_1CF71C7E8();
        swift_release();
        swift_release();
        v62 = v43;
        v63 = v44;
        return ((uint64_t (*)(char *, uint64_t))v41)(v62, v63);
      }
      if (v26 == *MEMORY[0x1E0CCE958])
      {
        v64 = sub_1CF73F0E4();
        if (qword_1EFBA09E0 != -1)
          swift_once();
        v65 = qword_1EFBA3780;
        v66 = v86;
        swift_retain_n();
        if (os_log_type_enabled(v65, v64))
        {
          v67 = swift_slowAlloc();
          v68 = swift_slowAlloc();
          v90 = (char *)v68;
          *(_DWORD *)v67 = 136446466;
          v69 = *(_QWORD *)(v66 + 56);
          v70 = *(_QWORD *)(v66 + 64);
          swift_bridgeObjectRetain();
          sub_1CF68F110(v69, v70, (uint64_t *)&v90);
          v88 = v71;
          sub_1CF73F2A0();
          swift_bridgeObjectRelease();
          *(_WORD *)(v67 + 12) = 2080;
          v88 = 0x5F6E6F6374;
          v89 = 0xE500000000000000;
          swift_bridgeObjectRetain();
          v83 = v24;
          sub_1CF73EF58();
          swift_bridgeObjectRelease();
          sub_1CF68F110(v88, v89, (uint64_t *)&v90);
          v88 = v72;
          sub_1CF73F2A0();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CF67E000, v65, v64, "%{public}s/%s: Group tunnel connection setup", (uint8_t *)v67, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1D17D3ED0](v68, -1, -1);
          MEMORY[0x1D17D3ED0](v67, -1, -1);
          swift_release();
        }
        else
        {
          swift_release_n();
        }
      }
      else
      {
        if (v26 == *MEMORY[0x1E0CCE950])
        {
          swift_beginAccess();
          swift_retain();
          sub_1CF71DA40();
          swift_release();
          swift_retain();
          sub_1CF71DA40();
          swift_release();
        }
        else
        {
          if (v26 != *MEMORY[0x1E0CCE970])
          {
            v25(v19, a1, v15);
            v88 = 0;
            v89 = 0xE000000000000000;
            sub_1CF73F348();
            sub_1CF73EF58();
            sub_1CF73F408();
            result = sub_1CF73F450();
            __break(1u);
            return result;
          }
          v73 = sub_1CF73F0E4();
          if (qword_1EFBA09E0 != -1)
            swift_once();
          v74 = qword_1EFBA3780;
          if (os_log_type_enabled((os_log_t)qword_1EFBA3780, v73))
          {
            v75 = v86;
            swift_retain_n();
            v76 = swift_slowAlloc();
            v87 = swift_slowAlloc();
            v90 = (char *)v87;
            *(_DWORD *)v76 = 136446466;
            v77 = *(_QWORD *)(v75 + 56);
            v78 = *(_QWORD *)(v75 + 64);
            swift_bridgeObjectRetain();
            sub_1CF68F110(v77, v78, (uint64_t *)&v90);
            v88 = v79;
            sub_1CF73F2A0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v76 + 12) = 2080;
            v88 = 0x5F6E6F6374;
            v89 = 0xE500000000000000;
            swift_bridgeObjectRetain();
            sub_1CF73EF58();
            swift_bridgeObjectRelease();
            sub_1CF68F110(v88, v89, (uint64_t *)&v90);
            v88 = v80;
            sub_1CF73F2A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1CF67E000, v74, v73, "%{public}s/%s: Group tunnel connection cancelled", (uint8_t *)v76, 0x16u);
            v81 = v87;
            swift_arrayDestroy();
            MEMORY[0x1D17D3ED0](v81, -1, -1);
            MEMORY[0x1D17D3ED0](v76, -1, -1);
          }
          sub_1CF71C7E8();
        }
        swift_release();
      }
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1CF71D824()
{
  uint64_t result;
  uint64_t v1;
  os_log_type_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = sub_1CF73F0CC();
    if (qword_1EFBA09E0 != -1)
      swift_once();
    v3 = qword_1EFBA3780;
    if (os_log_type_enabled((os_log_t)qword_1EFBA3780, v2))
    {
      swift_retain_n();
      v4 = swift_slowAlloc();
      v5 = swift_slowAlloc();
      v8 = v5;
      *(_DWORD *)v4 = 136446466;
      v6 = *(_QWORD *)(v1 + 56);
      v7 = *(_QWORD *)(v1 + 64);
      swift_bridgeObjectRetain();
      sub_1CF68F110(v6, v7, &v8);
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v4 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1CF73EF58();
      swift_bridgeObjectRelease();
      sub_1CF68F110(0x5F6E6F6374, 0xE500000000000000, &v8);
      sub_1CF73F2A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF67E000, v3, v2, "%{public}s/%s: Unexpected stream received", (uint8_t *)v4, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v5, -1, -1);
      MEMORY[0x1D17D3ED0](v4, -1, -1);
    }
    return swift_release();
  }
  return result;
}

void sub_1CF71DA40()
{
  os_log_type_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_167();
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2CE0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_34();
  v5 = v4 - v3;
  sub_1CF73EBD4();
  v6 = sub_1CF73E970();
  __swift_storeEnumTagSinglePayload(v5, 1, 1, v6);
  v7 = sub_1CF73EC4C();
  sub_1CF693ED8(v5, &qword_1EFBA2CE0);
  if (v7)
  {
    sub_1CF71DC44(v7, v1 & 1);
    OUTLINED_FUNCTION_260();
  }
  else
  {
    sub_1CF73F0CC();
    if (qword_1EFBA09E0 != -1)
      swift_once();
    v8 = qword_1EFBA3780;
    if (OUTLINED_FUNCTION_70_6())
    {
      OUTLINED_FUNCTION_20();
      v9 = OUTLINED_FUNCTION_4_7();
      v15 = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)v9 = 136446466;
      v10 = OUTLINED_FUNCTION_6_6();
      OUTLINED_FUNCTION_55_5(v10, v11, &v15);
      OUTLINED_FUNCTION_243();
      OUTLINED_FUNCTION_57();
      *(_WORD *)(v9 + 12) = 2080;
      OUTLINED_FUNCTION_7_15();
      v14 = v12;
      OUTLINED_FUNCTION_33_8();
      OUTLINED_FUNCTION_50_7();
      OUTLINED_FUNCTION_178();
      OUTLINED_FUNCTION_20_11(v14, v13, &v15);
      OUTLINED_FUNCTION_103_0();
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_46_6(&dword_1CF67E000, v8, v1, "%{public}s/%s: Can't extract a stream from the group connection");
      OUTLINED_FUNCTION_24_9();
      OUTLINED_FUNCTION_0_1();
    }
    sub_1CF71C7E8();
  }
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1CF71DC44(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_30_8();
  v5 = OUTLINED_FUNCTION_16();
  *(_QWORD *)(v5 + 16) = v4;
  *(_BYTE *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a1;
  OUTLINED_FUNCTION_190();
  OUTLINED_FUNCTION_2_4();
  sub_1CF6A3AE0((uint64_t)sub_1CF71FFE8);
  sub_1CF73EA78();
  OUTLINED_FUNCTION_298();
  OUTLINED_FUNCTION_357();
  v6 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_30_8();
  v7 = OUTLINED_FUNCTION_16();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = a1;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_232();
  sub_1CF6A3AE0((uint64_t)sub_1CF720020);
  sub_1CF73EA84();
  OUTLINED_FUNCTION_305();
  OUTLINED_FUNCTION_50_3();
  return sub_1CF73EACC();
}

uint64_t sub_1CF71DD54(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
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
  char *v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  Class isa;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t result;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  os_log_type_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  os_log_type_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  os_log_type_t v58;
  NSObject *v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  os_log_type_t v68;
  _BOOL4 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  os_log_type_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  __int16 v86;
  os_log_type_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  int v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;

  v107 = a4;
  v105 = a3;
  v5 = sub_1CF73EBE0();
  v102 = *(_QWORD *)(v5 - 8);
  v103 = v5;
  MEMORY[0x1E0C80A78](v5);
  v101 = (char *)&v100 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = sub_1CF73EC88();
  v7 = *(_QWORD *)(v108 - 8);
  v8 = MEMORY[0x1E0C80A78](v108);
  v10 = (char *)&v100 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v104 = (char *)&v100 - v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v100 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v100 - v16;
  v18 = sub_1CF73EAC0();
  isa = v18[-1].isa;
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v100 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v100 - v23;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v106 = result;
    v26 = *((_QWORD *)isa + 2);
    ((void (*)(char *, uint64_t, NSObject *))v26)(v24, a1, v18);
    v27 = (*((uint64_t (**)(char *, NSObject *))isa + 11))(v24, v18);
    if (v27 == *MEMORY[0x1E0CCE5C8])
    {
      (*((void (**)(char *, NSObject *))isa + 12))(v24, v18);
      v28 = v7;
      v29 = v108;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v17, v24, v108);
      v30 = sub_1CF73F0E4();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v31 = qword_1EFBA3780;
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v15, v17, v29);
      v32 = v30;
      if (!os_log_type_enabled(v31, v30))
      {
        v42 = *(void (**)(char *, uint64_t))(v7 + 8);
        v42(v15, v29);
        goto LABEL_22;
      }
      v33 = v106;
      swift_retain_n();
      v34 = swift_slowAlloc();
      v104 = (char *)swift_slowAlloc();
      v111 = v104;
      *(_DWORD *)v34 = 136446978;
      v103 = v28;
      v35 = *(_QWORD *)(v33 + 56);
      v36 = *(_QWORD *)(v33 + 64);
      swift_bridgeObjectRetain();
      sub_1CF68F110(v35, v36, (uint64_t *)&v111);
      v109 = v37;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 12) = 2080;
      v109 = 0x5F6E6F6374;
      v110 = 0xE500000000000000;
      swift_bridgeObjectRetain();
      sub_1CF73EF58();
      swift_bridgeObjectRelease();
      sub_1CF68F110(v109, v110, (uint64_t *)&v111);
      v109 = v38;
      sub_1CF73F2A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v34 + 22) = 1024;
      LODWORD(v109) = v105 & 1;
      sub_1CF73F2A0();
      *(_WORD *)(v34 + 28) = 2080;
      sub_1CF6935F8((unint64_t *)&unk_1EFBA3770, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
      v39 = sub_1CF73F720();
      sub_1CF68F110(v39, v40, (uint64_t *)&v111);
      v109 = v41;
      v29 = v108;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      v42 = *(void (**)(char *, uint64_t))(v103 + 8);
      v42(v15, v29);
      _os_log_impl(&dword_1CF67E000, v31, v32, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection waiting, error: %s", (uint8_t *)v34, 0x26u);
      v43 = v104;
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v43, -1, -1);
      v44 = v34;
LABEL_12:
      MEMORY[0x1D17D3ED0](v44, -1, -1);
LABEL_22:
      sub_1CF73EAE4();
      sub_1CF71C7E8();
      swift_release();
      return ((uint64_t (*)(char *, uint64_t))v42)(v17, v29);
    }
    if (v27 == *MEMORY[0x1E0CCE5C0])
    {
      (*((void (**)(char *, NSObject *))isa + 12))(v24, v18);
      v17 = v104;
      v29 = v108;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v104, v24, v108);
      v45 = sub_1CF73F0CC();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v46 = qword_1EFBA3780;
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v17, v29);
      v47 = v45;
      if (!os_log_type_enabled(v46, v45))
      {
        v42 = *(void (**)(char *, uint64_t))(v7 + 8);
        v42(v10, v29);
        goto LABEL_22;
      }
      v48 = v106;
      swift_retain_n();
      v49 = swift_slowAlloc();
      v102 = swift_slowAlloc();
      v111 = (char *)v102;
      *(_DWORD *)v49 = 136446978;
      v103 = v7;
      v50 = *(_QWORD *)(v48 + 56);
      v51 = *(_QWORD *)(v48 + 64);
      swift_bridgeObjectRetain();
      sub_1CF68F110(v50, v51, (uint64_t *)&v111);
      v109 = v52;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2080;
      v109 = 0x5F6E6F6374;
      v110 = 0xE500000000000000;
      swift_bridgeObjectRetain();
      sub_1CF73EF58();
      v17 = v104;
      swift_bridgeObjectRelease();
      sub_1CF68F110(v109, v110, (uint64_t *)&v111);
      v109 = v53;
      sub_1CF73F2A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 22) = 1024;
      LODWORD(v109) = v105 & 1;
      sub_1CF73F2A0();
      *(_WORD *)(v49 + 28) = 2080;
      sub_1CF6935F8((unint64_t *)&unk_1EFBA3770, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEB10], MEMORY[0x1E0CCEB28]);
      v54 = sub_1CF73F720();
      sub_1CF68F110(v54, v55, (uint64_t *)&v111);
      v109 = v56;
      v29 = v108;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      v42 = *(void (**)(char *, uint64_t))(v103 + 8);
      v42(v10, v29);
      _os_log_impl(&dword_1CF67E000, v46, v47, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection failed, error: %s", (uint8_t *)v49, 0x26u);
      v57 = v102;
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v57, -1, -1);
      v44 = v49;
      goto LABEL_12;
    }
    if (v27 == *MEMORY[0x1E0CCE5B8] || v27 == *MEMORY[0x1E0CCE5D8])
    {
      v58 = sub_1CF73F0E4();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v59 = qword_1EFBA3780;
      v60 = os_log_type_enabled((os_log_t)qword_1EFBA3780, v58);
      v61 = v106;
      if (v60)
      {
        swift_retain_n();
        v62 = swift_slowAlloc();
        v63 = swift_slowAlloc();
        v111 = (char *)v63;
        *(_DWORD *)v62 = 136446722;
        v64 = *(_QWORD *)(v61 + 56);
        v65 = *(_QWORD *)(v61 + 64);
        swift_bridgeObjectRetain();
        sub_1CF68F110(v64, v65, (uint64_t *)&v111);
        v109 = v66;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v62 + 12) = 2080;
        v109 = 0x5F6E6F6374;
        v110 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1CF73EF58();
        swift_bridgeObjectRelease();
        sub_1CF68F110(v109, v110, (uint64_t *)&v111);
        v109 = v67;
        sub_1CF73F2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v62 + 22) = 1024;
        LODWORD(v109) = v105 & 1;
        sub_1CF73F2A0();
        _os_log_impl(&dword_1CF67E000, v59, v58, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection setup", (uint8_t *)v62, 0x1Cu);
        swift_arrayDestroy();
        MEMORY[0x1D17D3ED0](v63, -1, -1);
        MEMORY[0x1D17D3ED0](v62, -1, -1);
      }
      return swift_release();
    }
    if (v27 == *MEMORY[0x1E0CCE5B0])
    {
      v68 = sub_1CF73F0E4();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v18 = qword_1EFBA3780;
      v69 = os_log_type_enabled((os_log_t)qword_1EFBA3780, v68);
      v26 = v106;
      if (v69)
      {
        swift_retain_n();
        v70 = swift_slowAlloc();
        v71 = swift_slowAlloc();
        v111 = (char *)v71;
        *(_DWORD *)v70 = 136446722;
        v72 = *(_QWORD *)(v26 + 56);
        v73 = *(_QWORD *)(v106 + 64);
        swift_bridgeObjectRetain();
        sub_1CF68F110(v72, v73, (uint64_t *)&v111);
        v109 = v74;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v70 + 12) = 2080;
        v109 = 0x5F6E6F6374;
        v110 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        v26 = v106;
        sub_1CF73EF58();
        swift_bridgeObjectRelease();
        sub_1CF68F110(v109, v110, (uint64_t *)&v111);
        v109 = v75;
        sub_1CF73F2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v70 + 22) = 1024;
        LODWORD(v109) = v105 & 1;
        sub_1CF73F2A0();
        _os_log_impl(&dword_1CF67E000, v18, v68, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection established", (uint8_t *)v70, 0x1Cu);
        swift_arrayDestroy();
        MEMORY[0x1D17D3ED0](v71, -1, -1);
        MEMORY[0x1D17D3ED0](v70, -1, -1);
      }
      sub_1CF73EC04();
      sub_1CF73EBC8();
      v76 = sub_1CF73EB08();
      swift_release();
      if (v76)
      {
        sub_1CF73EBF8();
        if (swift_dynamicCastClass())
        {
          v77 = sub_1CF73F0E4();
          v18 = qword_1EFBA3780;
          v78 = v77;
          if (os_log_type_enabled((os_log_t)qword_1EFBA3780, v77))
          {
            swift_retain_n();
            v79 = swift_slowAlloc();
            v80 = swift_slowAlloc();
            v111 = (char *)v80;
            *(_DWORD *)v79 = 136446466;
            v81 = *(_QWORD *)(v106 + 56);
            v82 = *(_QWORD *)(v106 + 64);
            swift_bridgeObjectRetain();
            sub_1CF68F110(v81, v82, (uint64_t *)&v111);
            v109 = v83;
            sub_1CF73F2A0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v79 + 12) = 2080;
            v109 = 0x5F6E6F6374;
            v110 = 0xE500000000000000;
            swift_bridgeObjectRetain();
            sub_1CF73EF58();
            swift_bridgeObjectRelease();
            sub_1CF68F110(v109, v110, (uint64_t *)&v111);
            v109 = v84;
            v26 = v106;
            sub_1CF73F2A0();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1CF67E000, v18, v78, "%{public}s/%s: Tunnel stream setting keepalive on", (uint8_t *)v79, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1D17D3ED0](v80, -1, -1);
            MEMORY[0x1D17D3ED0](v79, -1, -1);
          }
          (*(void (**)(char *, _QWORD, uint64_t))(v102 + 104))(v101, *MEMORY[0x1E0CCE7E0], v103);
          sub_1CF73EBEC();
        }
        swift_release();
      }
      if ((v105 & 1) == 0)
      {
        v95 = *(_QWORD *)(v26 + 56);
        v96 = *(_QWORD *)(v26 + 64);
        type metadata accessor for TCPTunnelConnection();
        v97 = swift_allocObject();
        v98 = v107;
        swift_retain();
        swift_bridgeObjectRetain();
        TCPTunnelConnection.init(tunnelIdentifier:stream:)(v95, v96, v98);
        sub_1CF71B5C0(v97);
        v99 = *(_WORD *)(v26 + 16);
        if ((v99 & 0xFE) != 2)
        {
          if ((v99 & 1) != 0)
            v86 = 2;
          else
            v86 = 256;
          goto LABEL_51;
        }
LABEL_52:
        sub_1CF71B3D4();
        return swift_release();
      }
      v85 = swift_retain();
      a1 = v26;
      sub_1CF71B67C(v85);
      swift_beginAccess();
      v22 = *(char **)(v26 + 48);
      if (v22)
      {
        swift_retain();
        sub_1CF71F0D8();
        swift_release();
        if ((*(_WORD *)(v26 + 16) & 0xFE) != 2)
        {
          if ((*(_WORD *)(v26 + 16) & 0x100) != 0)
            v86 = 2;
          else
            v86 = 1;
LABEL_51:
          *(_WORD *)(v26 + 16) = v86;
          goto LABEL_52;
        }
        goto LABEL_52;
      }
      __break(1u);
    }
    else if (v27 == *MEMORY[0x1E0CCE5D0])
    {
      v87 = sub_1CF73F0E4();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v88 = qword_1EFBA3780;
      if (os_log_type_enabled((os_log_t)qword_1EFBA3780, v87))
      {
        swift_retain_n();
        v89 = swift_slowAlloc();
        v90 = swift_slowAlloc();
        v111 = (char *)v90;
        *(_DWORD *)v89 = 136446722;
        v91 = *(_QWORD *)(v106 + 56);
        v92 = *(_QWORD *)(v106 + 64);
        swift_bridgeObjectRetain();
        sub_1CF68F110(v91, v92, (uint64_t *)&v111);
        v109 = v93;
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v89 + 12) = 2080;
        v109 = 0x5F6E6F6374;
        v110 = 0xE500000000000000;
        swift_bridgeObjectRetain();
        sub_1CF73EF58();
        swift_bridgeObjectRelease();
        sub_1CF68F110(v109, v110, (uint64_t *)&v111);
        v109 = v94;
        sub_1CF73F2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v89 + 22) = 1024;
        LODWORD(v109) = v105 & 1;
        sub_1CF73F2A0();
        _os_log_impl(&dword_1CF67E000, v88, v87, "%{public}s/%s: Tunnel stream (datagram=%{BOOL}d) connection cancelled", (uint8_t *)v89, 0x1Cu);
        swift_arrayDestroy();
        MEMORY[0x1D17D3ED0](v90, -1, -1);
        MEMORY[0x1D17D3ED0](v89, -1, -1);
      }
      sub_1CF73EAE4();
      sub_1CF71C7E8();
      return swift_release();
    }
    ((void (*)(char *, uint64_t, NSObject *))v26)(v22, a1, v18);
    v109 = 0;
    v110 = 0xE000000000000000;
    sub_1CF73F348();
    sub_1CF73EF58();
    sub_1CF73F408();
    result = sub_1CF73F450();
    __break(1u);
  }
  return result;
}

uint64_t sub_1CF71EEA4(uint64_t result)
{
  uint64_t v1;
  os_log_type_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if ((result & 1) == 0)
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      v1 = result;
      v2 = sub_1CF73F0CC();
      if (qword_1EFBA09E0 != -1)
        swift_once();
      v3 = qword_1EFBA3780;
      if (os_log_type_enabled((os_log_t)qword_1EFBA3780, v2))
      {
        swift_retain_n();
        v4 = swift_slowAlloc();
        v5 = swift_slowAlloc();
        v8 = v5;
        *(_DWORD *)v4 = 136446466;
        v6 = *(_QWORD *)(v1 + 56);
        v7 = *(_QWORD *)(v1 + 64);
        swift_bridgeObjectRetain();
        sub_1CF68F110(v6, v7, &v8);
        sub_1CF73F2A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v4 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_1CF73EF58();
        swift_bridgeObjectRelease();
        sub_1CF68F110(0x5F6E6F6374, 0xE500000000000000, &v8);
        sub_1CF73F2A0();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1CF67E000, v3, v2, "%{public}s/%s: Cancelling tunnel connection as it is no longer viable", (uint8_t *)v4, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D17D3ED0](v5, -1, -1);
        MEMORY[0x1D17D3ED0](v4, -1, -1);
      }
      sub_1CF73EAE4();
      sub_1CF71C7E8();
      return swift_release();
    }
  }
  return result;
}

void sub_1CF71F0D8()
{
  void (**v0)(uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  OUTLINED_FUNCTION_167();
  v2 = sub_1CF73EA6C();
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_99();
  static Data.randomBytes(ofLength:)();
  v4 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_346();
  *v0 = sub_1CF71FFC4;
  v0[1] = (void (*)(uint64_t))v4;
  (*(void (**)(void (**)(uint64_t), _QWORD, uint64_t))(v1 + 104))(v0, *MEMORY[0x1E0CCE460], v2);
  sub_1CF73EA60();
  OUTLINED_FUNCTION_83();
  sub_1CF73EA48();
  OUTLINED_FUNCTION_259();
  sub_1CF73EAA8();
  swift_release();
  v5 = OUTLINED_FUNCTION_259();
  sub_1CF6933C0(v5, v6);
  OUTLINED_FUNCTION_37_0((uint64_t)v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_357();
  OUTLINED_FUNCTION_17();
}

void sub_1CF71F1BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t Strong;
  uint64_t v9;
  os_log_type_t v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2EB8);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v21 - v6;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v9 = Strong;
    v10 = sub_1CF73F0E4();
    if (qword_1EFBA09E0 != -1)
      swift_once();
    v11 = qword_1EFBA3780;
    sub_1CF717AFC(a1, (uint64_t)v7);
    if (os_log_type_enabled(v11, v10))
    {
      swift_retain_n();
      v12 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v25 = v22;
      *(_DWORD *)v12 = 136446722;
      v14 = *(_QWORD *)(v9 + 56);
      v13 = *(_QWORD *)(v9 + 64);
      swift_bridgeObjectRetain();
      sub_1CF68F110(v14, v13, &v25);
      v23 = v15;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2080;
      v21 = v11;
      v23 = 0x5F6E6F6374;
      v24 = 0xE500000000000000;
      swift_bridgeObjectRetain();
      sub_1CF73EF58();
      swift_bridgeObjectRelease();
      sub_1CF68F110(v23, v24, &v25);
      v23 = v16;
      sub_1CF73F2A0();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 22) = 2080;
      sub_1CF717AFC((uint64_t)v7, (uint64_t)v5);
      v17 = sub_1CF73EF10();
      sub_1CF68F110(v17, v18, &v25);
      v23 = v19;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      sub_1CF693ED8((uint64_t)v7, &qword_1EFBA2EB8);
      _os_log_impl(&dword_1CF67E000, v21, v10, "%{public}s/%s: Tunnel datagram stream initial send completed with error %s", (uint8_t *)v12, 0x20u);
      v20 = v22;
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v20, -1, -1);
      MEMORY[0x1D17D3ED0](v12, -1, -1);
      swift_release();
    }
    else
    {
      swift_release();
      sub_1CF693ED8((uint64_t)v7, &qword_1EFBA2EB8);
    }
  }
}

uint64_t QUICTunnelConnection.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_34_6();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CF693EC8(*(_QWORD *)(v0 + 88));
  return v0;
}

uint64_t QUICTunnelConnection.__deallocating_deinit()
{
  QUICTunnelConnection.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1CF71F52C@<X0>(_QWORD *a1@<X8>)
{
  return QUICTunnelConnection.identifier.getter(a1);
}

uint64_t sub_1CF71F54C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF71B854(a1, a2, a3);
}

uint64_t sub_1CF71F56C(uint64_t a1, void (*a2)(void *))
{
  return sub_1CF71BD24(a1, a2);
}

uint64_t sub_1CF71F58C(uint64_t a1, uint64_t a2)
{
  return sub_1CF71BD90(a1, a2);
}

void sub_1CF71F5AC(uint64_t a1, uint64_t a2)
{
  sub_1CF71C768(a1, a2);
}

uint64_t sub_1CF71F5CC()
{
  return sub_1CF71C7E8();
}

uint64_t sub_1CF71F5EC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF71C894(a1, a2, a3);
}

uint64_t sub_1CF71F60C()
{
  return sub_1CF71A8A4() & 0x1FFFF;
}

#error "1CF71F648: call analysis failed (funcsize=8)"

uint64_t sub_1CF71F658(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_105_2(a1);
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_1CF71F674(uint64_t (*a1)(void))
{
  OUTLINED_FUNCTION_105_2(a1);
  OUTLINED_FUNCTION_1();
}

void sub_1CF71F68C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5;

  OUTLINED_FUNCTION_94_0((uint64_t)a1, a2, a3, a4);
  v5 = *a1 + 8;
  OUTLINED_FUNCTION_90_2();
  *a1 = v5;
  OUTLINED_FUNCTION_13_13();
}

void sub_1CF71F6D8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5;

  OUTLINED_FUNCTION_94_0((uint64_t)a1, a2, a3, a4);
  v5 = *a1 + 2;
  OUTLINED_FUNCTION_90_2();
  *a1 = v5;
  OUTLINED_FUNCTION_13_13();
}

void sub_1CF71F724(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5;

  OUTLINED_FUNCTION_94_0((uint64_t)a1, a2, a3, a4);
  v5 = *a1 + 4;
  OUTLINED_FUNCTION_90_2();
  *a1 = v5;
  OUTLINED_FUNCTION_13_13();
}

uint64_t sub_1CF71F770()
{
  return sub_1CF73F2A0();
}

void sub_1CF71F794(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_1CF73F2A0();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
  OUTLINED_FUNCTION_13_13();
}

void sub_1CF71F840(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  *a2 = a1();
  OUTLINED_FUNCTION_1();
}

void sub_1CF71F864(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  *a2 = OUTLINED_FUNCTION_105_2(a1);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF71F884()
{
  OUTLINED_FUNCTION_58();
  return swift_deallocObject();
}

uint64_t sub_1CF71F8A4()
{
  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_54();
  return swift_deallocObject();
}

void sub_1CF71F8C0()
{
  sub_1CF71CA0C();
}

uint64_t sub_1CF71F8F4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CF71F918()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_34_6();
  OUTLINED_FUNCTION_9_7();
  return swift_deallocObject();
}

uint64_t sub_1CF71F938(uint64_t a1)
{
  uint64_t v1;

  return sub_1CF719354(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(uint64_t *))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_1CF71F948(char a1)
{
  return sub_1CF71A2C0(a1);
}

uint64_t sub_1CF71F950()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_34_6();
  OUTLINED_FUNCTION_9_7();
  return swift_deallocObject();
}

void sub_1CF71F970(int a1)
{
  uint64_t v1;

  sub_1CF71BBF4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(void *))(v1 + 32));
}

uint64_t block_copy_helper_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_12()
{
  return swift_release();
}

uint64_t sub_1CF71F994()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CF71F9B8()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_34_6();
  OUTLINED_FUNCTION_9_7();
  return swift_deallocObject();
}

uint64_t sub_1CF71F9D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1CF71C000(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(void (**)(void *, uint64_t))(v4 + 24), *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40));
}

uint64_t sub_1CF71F9E4()
{
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_54();
  return swift_deallocObject();
}

void sub_1CF71FA00(void *a1, unint64_t a2, char a3)
{
  uint64_t v3;

  sub_1CF71804C(a1, a2, a3 & 1, *(void (**)(_QWORD *))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_54();
  return swift_deallocObject();
}

void sub_1CF71FA34()
{
  sub_1CF71CA0C();
}

uint64_t sub_1CF71FA68()
{
  uint64_t v0;

  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_58();

  OUTLINED_FUNCTION_54();
  return swift_deallocObject();
}

uint64_t sub_1CF71FA8C(uint64_t a1)
{
  uint64_t *v1;

  return sub_1CF71CBB4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1CF71FA98()
{
  return sub_1CF71D824();
}

void sub_1CF71FAA0()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_239();
  *v0 = sub_1CF718DB8();
  v0[1] = v1;
  OUTLINED_FUNCTION_1();
}

void sub_1CF71FAC4()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_239();
  sub_1CF718E68();
  *v0 = v1;
  OUTLINED_FUNCTION_1();
}

void sub_1CF71FAE4(uint64_t *a1)
{
  sub_1CF718E8C(*a1);
  OUTLINED_FUNCTION_1();
}

void sub_1CF71FB04()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_239();
  sub_1CF718EF0();
  *v0 = v1;
  OUTLINED_FUNCTION_1();
}

void sub_1CF71FB24(uint64_t *a1)
{
  sub_1CF715E34(*a1);
  OUTLINED_FUNCTION_1();
}

void sub_1CF71FB44()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_239();
  sub_1CF71B4B4();
  *v0 = v1;
  OUTLINED_FUNCTION_1();
}

void sub_1CF71FB68()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_239();
  sub_1CF71B548();
  *v0 = v1;
  OUTLINED_FUNCTION_1();
}

void sub_1CF71FB8C()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_239();
  sub_1CF71B598();
  *v0 = v1;
  OUTLINED_FUNCTION_1();
}

void sub_1CF71FBB0()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_239();
  sub_1CF71B654();
  *v0 = v1;
  OUTLINED_FUNCTION_1();
}

uint64_t type metadata accessor for TCPTunnelConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for TCPTunnelConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TCPTunnelConnection.maxSupportedMTU.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))() & 0x1FFFF;
}

uint64_t dispatch thunk of TCPTunnelConnection.physicalInterfaceName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of TCPTunnelConnection._partialReceivedPacket.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of TCPTunnelConnection._nextMinReceiveLength.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of TCPTunnelConnection._maxReceiveLength.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of TCPTunnelConnection._maxReceiveLength.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of TCPTunnelConnection.__allocating_init(tunnelIdentifier:stream:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of TCPTunnelConnection.send(content:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of TCPTunnelConnection.receive(minLength:maxLength:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of TCPTunnelConnection.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of TCPTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t type metadata accessor for QUICTunnelConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for QUICTunnelConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QUICTunnelConnection.maxSupportedMTU.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))() & 0x1FFFF;
}

uint64_t dispatch thunk of QUICTunnelConnection.physicalInterfaceName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of QUICTunnelConnection.group.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of QUICTunnelConnection.group.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of QUICTunnelConnection.options.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of QUICTunnelConnection.nonDatagramStream.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of QUICTunnelConnection.datagramStream.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of QUICTunnelConnection.datagramStream.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of QUICTunnelConnection.__allocating_init(tunnelIdentifier:group:options:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 304))();
}

uint64_t dispatch thunk of QUICTunnelConnection.send(packets:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of QUICTunnelConnection.send(controlMessage:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of QUICTunnelConnection.receivePackets(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of QUICTunnelConnection.receiveControlMessage(completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of QUICTunnelConnection.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of QUICTunnelConnection.start(on:reportingTunnelStateChangesWith:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t getEnumTagSinglePayload for QUICTunnelConnection.State(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t result;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
  {
    v6 = *a1;
    if (v6 >= 2)
    {
      v7 = (v6 + 2147483646) & 0x7FFFFFFF;
      result = v7 - 1;
      if (v7 > 1)
        return result;
    }
    return 0;
  }
  v2 = a2 + 65283;
  if (a2 + 65283 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (v2 < 0xFF0000)
    v3 = 1;
  if (v2 >= 0x10000)
    v4 = v3;
  else
    v4 = 0;
  return ((uint64_t (*)(void))((char *)&loc_1CF71FE54 + 4 * byte_1CF747B00[v4]))();
}

uint64_t storeEnumTagSinglePayload for QUICTunnelConnection.State(_WORD *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 65283;
  if (a3 + 65283 <= 0xFFFEFFFF)
    v4 = 2;
  else
    v4 = 4;
  if (v3 < 0xFF0000)
    v4 = 1;
  if (v3 >= 0x10000)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFD)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1CF71FF04 + 4 * byte_1CF747B0A[v5]))();
  *a1 = a2 - 253;
  return ((uint64_t (*)(void))((char *)sub_1CF71FF38 + 4 * byte_1CF747B05[v5]))();
}

uint64_t sub_1CF71FF38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_1CF71FF40(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x1CF71FF48);
  return result;
}

uint64_t sub_1CF71FF54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x1CF71FF5CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1CF71FF60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1CF71FF68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_1CF71FF74(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_WORD *sub_1CF71FF90(_WORD *result, unsigned int a2)
{
  if (a2 > 0xFE)
  {
    *result = a2 - 255;
  }
  else if (a2)
  {
    *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for QUICTunnelConnection.State()
{
  return &type metadata for QUICTunnelConnection.State;
}

void sub_1CF71FFC4(uint64_t a1)
{
  sub_1CF71F1BC(a1);
}

uint64_t sub_1CF71FFCC()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_49_1();
  OUTLINED_FUNCTION_54();
  return swift_deallocObject();
}

uint64_t sub_1CF71FFE8(uint64_t a1)
{
  uint64_t v1;

  return sub_1CF71DD54(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t objectdestroy_19Tm()
{
  OUTLINED_FUNCTION_176();
  OUTLINED_FUNCTION_58();
  return swift_deallocObject();
}

uint64_t sub_1CF720020(uint64_t result)
{
  return sub_1CF71EEA4(result);
}

uint64_t sub_1CF720028()
{
  OUTLINED_FUNCTION_58();
  return swift_deallocObject();
}

uint64_t sub_1CF72004C()
{
  uint64_t v0;
  uint64_t (*v1)(char *);
  char v3;

  v1 = *(uint64_t (**)(char *))(v0 + 16);
  v3 = *(_BYTE *)(v0 + 32);
  return v1(&v3);
}

void OUTLINED_FUNCTION_20_11(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  sub_1CF68F110(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_27_11()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_30_8()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_33_8()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_38_8()
{
  return sub_1CF73EEA4();
}

uint64_t OUTLINED_FUNCTION_42_9()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

void OUTLINED_FUNCTION_47_10(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0x16u);
}

uint64_t OUTLINED_FUNCTION_48_7()
{
  return sub_1CF73F294();
}

uint64_t OUTLINED_FUNCTION_52_6()
{
  return sub_1CF73EA00();
}

uint64_t OUTLINED_FUNCTION_54_8()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, v0);
}

void OUTLINED_FUNCTION_55_5(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  sub_1CF68F110(v3, v4, a3);
}

void OUTLINED_FUNCTION_57_9(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0x20u);
}

uint64_t OUTLINED_FUNCTION_58_6@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  *a2 = v2;
  a2[1] = a1;
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_60_5()
{
  os_log_type_t v0;
  NSObject *v1;

  return os_log_type_enabled(v1, v0);
}

uint64_t OUTLINED_FUNCTION_64_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CF6E0B08(v1, *(_QWORD *)(a1 - 256));
}

void OUTLINED_FUNCTION_67_5()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 136) = 0x5F6E6F6374;
  *(_QWORD *)(v0 - 128) = 0xE500000000000000;
}

void OUTLINED_FUNCTION_68_6()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 112) = 0x5F6E6F6374;
  *(_QWORD *)(v0 - 104) = 0xE500000000000000;
}

BOOL OUTLINED_FUNCTION_70_6()
{
  os_log_type_t v0;
  NSObject *v1;

  return os_log_type_enabled(v1, v0);
}

uint64_t OUTLINED_FUNCTION_71_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

size_t OUTLINED_FUNCTION_81_3(size_t a1, int64_t a2)
{
  return sub_1CF6A2F60(a1, a2, 1);
}

uint64_t OUTLINED_FUNCTION_84_1()
{
  return sub_1CF73EF58();
}

uint64_t OUTLINED_FUNCTION_90_2()
{
  return sub_1CF73F2A0();
}

uint64_t OUTLINED_FUNCTION_94_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

void OUTLINED_FUNCTION_98_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unint64_t v4;

  sub_1CF68F110(v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_100_1()
{
  return sub_1CF73EF58();
}

uint64_t OUTLINED_FUNCTION_103_0()
{
  return sub_1CF73F2A0();
}

uint64_t OUTLINED_FUNCTION_105_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t AtomicCounter.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AtomicCounter.init()();
  return v0;
}

uint64_t AtomicCounter.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), sel_init);
  return v0;
}

uint64_t AtomicCounter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t AtomicCounter.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AtomicCounter()
{
  return objc_opt_self();
}

uint64_t method lookup function for AtomicCounter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AtomicCounter.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_1CF720324()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v3;

  if ((*v0 & 1) != 0)
    v1 = 0x2D656369766544;
  else
    v1 = 0x2D74736F48;
  v3 = v1;
  sub_1CF73F648();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_3_7();
  return v3;
}

id sub_1CF7203AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v12;
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
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  _BYTE v30[24];
  __int128 v31;
  uint64_t v32;

  if (*(uint64_t *)(a2 + OBJC_IVAR____TtC19RemotePairingDevice43ControlChannelConnectionWireProtocolVersion_rawValue) >= 12)
  {
    *(_QWORD *)&v29 = a1;
    v3 = sub_1CF72C820((uint64_t)&v29);
    OUTLINED_FUNCTION_154_1(v3, v4, v5, v6, v7, v8, v9, v10, v21, v22);
    return OUTLINED_FUNCTION_41();
  }
  else
  {
    v28 = a1;
    OUTLINED_FUNCTION_41();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C70);
    if (swift_dynamicCast())
    {
      LOBYTE(v29) = v22;
      *((_QWORD *)&v29 + 1) = v23;
      *(_QWORD *)v30 = v24;
      *(_OWORD *)&v30[8] = v25;
      v31 = v26;
      v32 = v27;
    }
    else
    {
      v29 = 0u;
      *(_OWORD *)v30 = 0u;
      v30[16] = 2;
      HIBYTE(v21) = 4;
      OUTLINED_FUNCTION_41();
      v12 = ControlChannelConnectionError.Message.format(code:)((RemotePairingDevice::ControlChannelConnectionError::Code)((char *)&v21 + 7));
      sub_1CF692EA4((uint64_t)&v29);
      LOBYTE(v29) = 4;
      *((_QWORD *)&v29 + 1) = v12._countAndFlagsBits;
      *(_QWORD *)v30 = v12._object;
      *(_OWORD *)&v30[8] = 0u;
      v31 = 0u;
      v32 = a1;
    }
    v13 = sub_1CF6C8CA0((uint64_t)&v29);
    return OUTLINED_FUNCTION_154_1(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  }
}

uint64_t PeerDeviceInfo.init(name:model:udid:ecid:deviceKVSData:deviceKVSIncludesSensitiveInfo:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, char a12)
{
  *(_QWORD *)a9 = a5;
  *(_QWORD *)(a9 + 8) = a6;
  *(_QWORD *)(a9 + 16) = a1;
  *(_QWORD *)(a9 + 24) = a2;
  *(_QWORD *)(a9 + 32) = a3;
  *(_QWORD *)(a9 + 40) = a4;
  *(_QWORD *)(a9 + 48) = a5;
  *(_QWORD *)(a9 + 56) = a6;
  *(_QWORD *)(a9 + 64) = a7;
  *(_BYTE *)(a9 + 72) = a8 & 1;
  *(_QWORD *)(a9 + 80) = a10;
  *(_QWORD *)(a9 + 88) = a11;
  *(_BYTE *)(a9 + 96) = a12;
  return swift_bridgeObjectRetain();
}

char *PairingData.init(kind:data:startNewSession:)@<X0>(char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  char v5;

  v5 = *result;
  *(_BYTE *)a5 = a4;
  *(_BYTE *)(a5 + 1) = v5;
  *(_QWORD *)(a5 + 8) = a2;
  *(_QWORD *)(a5 + 16) = a3;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  return result;
}

uint64_t PropertyListCodable.init(wrappedValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t sub_1CF720544(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x6E456D6165727473 && a2 == 0xEF64657470797263;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E69616C70 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1CF72064C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E69616C70;
  else
    return 0x6E456D6165727473;
}

void sub_1CF72068C()
{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[34];
  _BYTE v23[136];
  _BYTE v24[144];

  OUTLINED_FUNCTION_2();
  v3 = v0;
  v5 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C28);
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_98();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C30);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_12();
  v21 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C20) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_15();
  sub_1CF6C8C64(v3, v23);
  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  sub_1CF72C3A4();
  sub_1CF73F858();
  sub_1CF6C8C64(v23, v24);
  if (sub_1CF6CA6B4((uint64_t)v24) == 1)
  {
    v10 = (const void *)sub_1CF6CA6C0((uint64_t)v24);
    LOBYTE(v22[0]) = 1;
    v11 = OUTLINED_FUNCTION_137_0();
    sub_1CF72C684(v11);
    sub_1CF72C3E0();
    OUTLINED_FUNCTION_40_8();
    sub_1CF6C8C64(v10, v22);
    sub_1CF6CAC58();
    OUTLINED_FUNCTION_132_1();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v2, v20);
  }
  else
  {
    v12 = (uint64_t *)sub_1CF6CA6C0((uint64_t)v24);
    v13 = *v12;
    v14 = v12[1];
    v15 = OUTLINED_FUNCTION_137_0();
    OUTLINED_FUNCTION_127_1(v15);
    sub_1CF72C4A4();
    OUTLINED_FUNCTION_40_8();
    v22[0] = v13;
    v22[1] = v14;
    sub_1CF6D5DAC();
    OUTLINED_FUNCTION_132_1();
    v16 = OUTLINED_FUNCTION_365();
    v18(v16, v17);
  }
  OUTLINED_FUNCTION_26_1(v1, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  sub_1CF72C41C((uint64_t)v23);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF7208C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _OWORD *v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD v29[9];
  _OWORD v30[8];
  _BYTE v31[152];
  uint64_t v32;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  v24 = v5;
  v26 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B40) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_90_3(v7, v23);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B48);
  v8 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_13();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B38);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_28();
  v27 = (uint64_t)v4;
  __swift_project_boxed_opaque_existential_0Tm(v4, v4[3]);
  sub_1CF72C3A4();
  OUTLINED_FUNCTION_122_1();
  sub_1CF73F840();
  if (v0)
    goto LABEL_9;
  v32 = v2;
  v10 = sub_1CF73F564();
  v11 = *(_QWORD *)(v10 + 16);
  if (!v11)
  {
    v17 = v1;
LABEL_8:
    v18 = OUTLINED_FUNCTION_93_1();
    OUTLINED_FUNCTION_105();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1470);
    *v20 = &unk_1E8CA2010;
    sub_1CF73F4B0();
    OUTLINED_FUNCTION_75();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x1E0DEC450], v18);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_47_1(v17, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
LABEL_9:
    __swift_destroy_boxed_opaque_existential_0Tm(v27);
    goto LABEL_10;
  }
  v12 = *(_BYTE *)(v10 + 32);
  sub_1CF6A6F50(1, v11, v10, v10 + 32, 0, (2 * v11) | 1);
  v14 = v13;
  v16 = v15;
  OUTLINED_FUNCTION_150();
  if (v14 != v16 >> 1)
  {
    v17 = v1;
    goto LABEL_8;
  }
  if ((v12 & 1) != 0)
  {
    LOBYTE(v30[0]) = 1;
    sub_1CF72C3E0();
    OUTLINED_FUNCTION_65_5();
    sub_1CF6CA7B8();
    OUTLINED_FUNCTION_43_10();
    OUTLINED_FUNCTION_21_8(v26);
    OUTLINED_FUNCTION_18_15();
    OUTLINED_FUNCTION_58_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
    sub_1CF6C8C64(v30, &v28);
    sub_1CF6C8C64(&v28, v29);
    sub_1CF6CABF8((uint64_t)v29);
    v21 = v29;
  }
  else
  {
    LOBYTE(v30[0]) = 0;
    sub_1CF72C4A4();
    OUTLINED_FUNCTION_65_5();
    sub_1CF6D8794();
    OUTLINED_FUNCTION_43_10();
    OUTLINED_FUNCTION_21_8(v8);
    OUTLINED_FUNCTION_18_15();
    OUTLINED_FUNCTION_198_0();
    OUTLINED_FUNCTION_58_0(v1, v22);
    v30[0] = v29[0];
    sub_1CF6CAC48((uint64_t)v30);
    v21 = v30;
  }
  sub_1CF6C8C64(v21, v31);
  sub_1CF6C8C64(v31, v24);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v4);
LABEL_10:
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1CF720C68(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x74616E696769726FLL && a2 == 0xEC00000079426465;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x65636E6575716573 && a2 == 0xEE007265626D754ELL;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_1CF73F690();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1CF720DF0(char a1)
{
  if (!a1)
    return 0x74616E696769726FLL;
  if (a1 == 1)
    return 0x65636E6575716573;
  return 0x6567617373656DLL;
}

uint64_t sub_1CF720E60()
{
  char *v0;

  return sub_1CF72064C(*v0);
}

uint64_t sub_1CF720E68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF720544(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF720E8C()
{
  sub_1CF72C3A4();
  return sub_1CF73F864();
}

uint64_t sub_1CF720EB4()
{
  sub_1CF72C3A4();
  return sub_1CF73F870();
}

uint64_t sub_1CF720EE0()
{
  sub_1CF72C3E0();
  return sub_1CF73F864();
}

uint64_t sub_1CF720F08()
{
  sub_1CF72C3E0();
  return sub_1CF73F870();
}

uint64_t sub_1CF720F30()
{
  sub_1CF72C4A4();
  return sub_1CF73F864();
}

uint64_t sub_1CF720F58()
{
  sub_1CF72C4A4();
  return sub_1CF73F870();
}

void sub_1CF720F80()
{
  sub_1CF7208C8();
}

void sub_1CF720F94()
{
  sub_1CF72068C();
}

uint64_t sub_1CF720FA8()
{
  char *v0;

  return sub_1CF720DF0(*v0);
}

uint64_t sub_1CF720FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF720C68(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF720FD4()
{
  sub_1CF721158();
  return sub_1CF73F864();
}

uint64_t sub_1CF720FFC()
{
  sub_1CF721158();
  return sub_1CF73F870();
}

void ControlChannelMessageEnvelope.encode(to:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  char v7;
  char v8[56];
  _BYTE v9[144];

  OUTLINED_FUNCTION_2();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C38);
  OUTLINED_FUNCTION_70_7();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_13();
  v7 = *v0;
  sub_1CF6C8C64(v0 + 16, v9);
  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  sub_1CF721158();
  sub_1CF73F858();
  v8[0] = v7;
  sub_1CF721194();
  OUTLINED_FUNCTION_145_0();
  sub_1CF73F5F4();
  if (!v1)
  {
    v8[0] = 1;
    sub_1CF73F624();
    sub_1CF6C8C64(v9, v8);
    OUTLINED_FUNCTION_63_7();
    sub_1CF7211D0();
    OUTLINED_FUNCTION_145_0();
    sub_1CF73F5F4();
  }
  OUTLINED_FUNCTION_30_3(v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_143_0();
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF721158()
{
  unint64_t result;

  result = qword_1ED8F7838;
  if (!qword_1ED8F7838)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7487E8, &type metadata for ControlChannelMessageEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7838);
  }
  return result;
}

unint64_t sub_1CF721194()
{
  unint64_t result;

  result = qword_1ED8F7178;
  if (!qword_1ED8F7178)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF743B98, &unk_1E8C9AA60);
    atomic_store(result, (unint64_t *)&qword_1ED8F7178);
  }
  return result;
}

unint64_t sub_1CF7211D0()
{
  unint64_t result;

  result = qword_1ED8F7828;
  if (!qword_1ED8F7828)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7487C0, &unk_1E8CA2010);
    atomic_store(result, (unint64_t *)&qword_1ED8F7828);
  }
  return result;
}

void ControlChannelMessageEnvelope.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[19];
  _BYTE v12[136];
  _BYTE v13[8];
  uint64_t v14;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v5 = v4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B50);
  v6 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_98();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1CF721158();
  sub_1CF73F840();
  if (!v0)
  {
    v12[0] = 0;
    sub_1CF721394();
    OUTLINED_FUNCTION_92_0();
    v7 = v11[0];
    v13[0] = v11[0];
    LOBYTE(v11[0]) = 1;
    v8 = sub_1CF73F558();
    v14 = v8;
    OUTLINED_FUNCTION_63_7();
    sub_1CF7213D0();
    OUTLINED_FUNCTION_92_0();
    OUTLINED_FUNCTION_30_3(v1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_1CF6C8C64(v12, &v10);
    OUTLINED_FUNCTION_138_1((uint64_t)v13);
    LOBYTE(v11[0]) = v7;
    v11[1] = v8;
    OUTLINED_FUNCTION_138_1((uint64_t)v11);
    memcpy(v5, v11, 0x92uLL);
  }
  OUTLINED_FUNCTION_112_1();
  OUTLINED_FUNCTION_143_0();
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF721394()
{
  unint64_t result;

  result = qword_1ED8F7190;
  if (!qword_1ED8F7190)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF743B70, &unk_1E8C9AA60);
    atomic_store(result, (unint64_t *)&qword_1ED8F7190);
  }
  return result;
}

unint64_t sub_1CF7213D0()
{
  unint64_t result;

  result = qword_1ED8F7830;
  if (!qword_1ED8F7830)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748798, &unk_1E8CA2010);
    atomic_store(result, (unint64_t *)&qword_1ED8F7830);
  }
  return result;
}

uint64_t sub_1CF72140C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v9;

  v2 = a1 == 0x44676E6972696170 && a2 == 0xEB00000000617461;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x52676E6972696170 && a2 == 0xEF64657463656A65;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000010 && a2 == 0x80000001CF7554F0 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 1735289200 && a2 == 0xE400000000000000;
      if (v7 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0xD000000000000013 && a2 == 0x80000001CF74FAD0 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else if (a1 == 0xD000000000000018 && a2 == 0x80000001CF755510 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 5;
      }
      else
      {
        v8 = a1 == 0x726961706E75 && a2 == 0xE600000000000000;
        if (v8 || (sub_1CF73F690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 6;
        }
        else if (a1 == 0xD000000000000011 && a2 == 0x80000001CF755530)
        {
          swift_bridgeObjectRelease();
          return 7;
        }
        else
        {
          v9 = sub_1CF73F690();
          swift_bridgeObjectRelease();
          if ((v9 & 1) != 0)
            return 7;
          else
            return 8;
        }
      }
    }
  }
}

uint64_t sub_1CF721748(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CF721784 + 4 * byte_1CF747CF0[a1]))(0x44676E6972696170, 0xEB00000000617461);
}

uint64_t sub_1CF721784()
{
  return 0x52676E6972696170;
}

unint64_t sub_1CF7217A8()
{
  return 0xD000000000000010;
}

uint64_t sub_1CF7217C4()
{
  return 1735289200;
}

unint64_t sub_1CF7217D4()
{
  return 0xD000000000000013;
}

uint64_t sub_1CF721838(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x4564657070617277 && a2 == 0xEC000000726F7272)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1CF7218D4()
{
  return 0x4564657070617277;
}

void sub_1CF7218F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
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
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  OUTLINED_FUNCTION_2();
  a19 = v21;
  a20 = v22;
  v24 = v23;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7CD8);
  OUTLINED_FUNCTION_375_0(v25, (uint64_t)&a11);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v27);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BB8);
  OUTLINED_FUNCTION_375_0(v28, (uint64_t)&v51);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v30);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BA0);
  OUTLINED_FUNCTION_375_0(v31, (uint64_t)&v55);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v32);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v33);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BC8);
  OUTLINED_FUNCTION_375_0(v34, (uint64_t)v50);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v35);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v36);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BB0);
  OUTLINED_FUNCTION_375_0(v37, (uint64_t)&v52);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v38);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v39);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BC0);
  OUTLINED_FUNCTION_375_0(v40, (uint64_t)&v53);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v42);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B98);
  OUTLINED_FUNCTION_375_0(v43, (uint64_t)&v54);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B90);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v46);
  OUTLINED_FUNCTION_98();
  v50[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BA8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v47);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_126_2();
  v48 = v20[7];
  v50[0] = v20[6];
  v50[1] = v48;
  v49 = v20[9];
  __swift_project_boxed_opaque_existential_0Tm(v24, v24[3]);
  sub_1CF72E770();
  OUTLINED_FUNCTION_122_1();
  sub_1CF73F858();
  __asm { BR              X10 }
}

void sub_1CF721BB4()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  *(_QWORD *)(v2 - 320) = v0 >> 8;
  *(_BYTE *)(v2 - 192) = 0;
  v3 = *(_QWORD *)(v2 - 72);
  v4 = *(_QWORD *)(v2 - 248);
  sub_1CF6934BC(v3, v4);
  sub_1CF72E950();
  v5 = *(_QWORD *)(v2 - 232);
  swift_bridgeObjectRetain();
  v6 = *(_QWORD *)(v2 - 224);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_67_6();
  *(_BYTE *)(v2 - 192) = v0 & 1;
  *(_BYTE *)(v2 - 191) = *(_QWORD *)(v2 - 320);
  *(_QWORD *)(v2 - 184) = v3;
  *(_QWORD *)(v2 - 176) = v4;
  v7 = *(_QWORD *)(v2 - 240);
  *(_QWORD *)(v2 - 168) = v7;
  *(_QWORD *)(v2 - 160) = v5;
  *(_QWORD *)(v2 - 152) = v6;
  sub_1CF72EAE0();
  OUTLINED_FUNCTION_85_3();
  OUTLINED_FUNCTION_47_1(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 368) + 8));
  OUTLINED_FUNCTION_76_3();
  v8 = (void *)OUTLINED_FUNCTION_28_7();
  sub_1CF6C9E3C(v8, *(_QWORD *)(v2 - 72), v4, v7, v5, v6, *(_QWORD *)(v2 - 216), *(_QWORD *)(v2 - 208), v9, v10, v11, v12);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF7220E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
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
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  uint64_t v74[17];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  OUTLINED_FUNCTION_2();
  a19 = v23;
  a20 = v24;
  a10 = v20;
  v26 = v25;
  v79 = v27;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7CD0);
  OUTLINED_FUNCTION_375_0(v28, (uint64_t)&a11);
  v74[13] = v29;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_91_2(v31, v74[0]);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AE0);
  OUTLINED_FUNCTION_375_0(v32, (uint64_t)&a14);
  v74[14] = v33;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_14();
  v77 = v35;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AC8);
  v74[16] = *(_QWORD *)(v75 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_14();
  v78 = v37;
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AF0);
  OUTLINED_FUNCTION_375_0(v38, (uint64_t)&v85);
  v81 = v39;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v40);
  OUTLINED_FUNCTION_14();
  v76 = v41;
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AD8);
  OUTLINED_FUNCTION_375_0(v42, (uint64_t)&a10);
  v74[10] = v43;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_14();
  v80 = v45;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AE8);
  OUTLINED_FUNCTION_375_0(v46, (uint64_t)&v84);
  v74[7] = v47;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v48);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v49);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AC0);
  OUTLINED_FUNCTION_375_0(v50, (uint64_t)&v83);
  v74[5] = v51;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v52);
  OUTLINED_FUNCTION_44_7((uint64_t)v74 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0));
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AB8);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v55);
  OUTLINED_FUNCTION_99();
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AD0);
  v57 = *(_QWORD *)(v56 - 8);
  MEMORY[0x1E0C80A78](v56);
  v59 = (char *)v74 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = v26[3];
  v82 = v26;
  __swift_project_boxed_opaque_existential_0Tm(v26, v60);
  sub_1CF72E770();
  v61 = a10;
  sub_1CF73F840();
  if (!v61)
  {
    v74[3] = v21;
    v74[1] = v22;
    v74[2] = v54;
    a10 = v57;
    v62 = sub_1CF73F564();
    v63 = *(_QWORD *)(v62 + 16);
    if (v63)
    {
      v74[4] = (uint64_t)v59;
      v74[0] = 0;
      v64 = *(unsigned __int8 *)(v62 + 32);
      sub_1CF6A6F50(1, v63, v62, v62 + 32, 0, (2 * v63) | 1);
      v66 = v65;
      v68 = v67;
      OUTLINED_FUNCTION_150();
      if (v66 == v68 >> 1)
        __asm { BR              X9 }
    }
    v69 = OUTLINED_FUNCTION_93_1();
    OUTLINED_FUNCTION_105();
    v71 = v70;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1470);
    *v71 = &unk_1E8CA2B00;
    sub_1CF73F4B0();
    OUTLINED_FUNCTION_75();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v69 - 8) + 104))(v71, *MEMORY[0x1E0DEC450], v69);
    swift_willThrow();
    OUTLINED_FUNCTION_18_15();
    v72 = OUTLINED_FUNCTION_130_1();
    OUTLINED_FUNCTION_47_1(v72, v73);
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v82);
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF72255C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, _QWORD);
  uint64_t v4;

  OUTLINED_FUNCTION_135_1();
  OUTLINED_FUNCTION_6_16();
  if (!v0)
  {
    v2 = OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_28_4(v2, v3);
    OUTLINED_FUNCTION_18_15();
    OUTLINED_FUNCTION_8_15(*(_QWORD *)(v1 - 72));
    v4 = *(_QWORD *)(v1 - 232);
    *(_QWORD *)v4 = 0;
    *(_OWORD *)(v4 + 8) = 0u;
    *(_QWORD *)(v4 + 24) = 0;
    *(_QWORD *)(v4 + 32) = 0;
    *(_QWORD *)(v4 + 40) = 0;
    *(_QWORD *)(v4 + 48) = 0;
    *(_QWORD *)(v4 + 56) = 0;
    *(_QWORD *)(v4 + 64) = 0;
    *(_QWORD *)(v4 + 72) = 0xC000000000000000;
    *(_OWORD *)(v4 + 80) = 0u;
    *(_BYTE *)(v4 + 96) = 0;
    JUMPOUT(0x1CF72254CLL);
  }
  JUMPOUT(0x1CF722538);
}

void sub_1CF7225D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, _QWORD);
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  char v14;

  OUTLINED_FUNCTION_152_1();
  OUTLINED_FUNCTION_6_16();
  if (!v0)
  {
    v2 = OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_28_4(v2, v3);
    OUTLINED_FUNCTION_18_15();
    OUTLINED_FUNCTION_8_15(*(_QWORD *)(v1 - 72));
    *(double *)&v4 = OUTLINED_FUNCTION_5_13();
    v5 = *(_QWORD *)(v1 - 232);
    *(_QWORD *)v5 = 1;
    *(_OWORD *)(v5 + 8) = v4;
    *(_QWORD *)(v5 + 24) = v6;
    *(_QWORD *)(v5 + 32) = v7;
    *(_QWORD *)(v5 + 40) = v9;
    *(_QWORD *)(v5 + 48) = v8;
    *(_QWORD *)(v5 + 56) = v10;
    *(_QWORD *)(v5 + 64) = v11;
    *(_QWORD *)(v5 + 72) = v12;
    *(_OWORD *)(v5 + 80) = v13;
    *(_BYTE *)(v5 + 96) = v14;
    JUMPOUT(0x1CF72254CLL);
  }
  JUMPOUT(0x1CF722538);
}

void sub_1CF722628()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, _QWORD);
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  char v14;

  OUTLINED_FUNCTION_147_1();
  OUTLINED_FUNCTION_6_16();
  if (!v0)
  {
    v2 = OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_28_4(v2, v3);
    OUTLINED_FUNCTION_18_15();
    OUTLINED_FUNCTION_8_15(*(_QWORD *)(v1 - 72));
    *(double *)&v4 = OUTLINED_FUNCTION_5_13();
    v5 = *(_QWORD *)(v1 - 232);
    *(_QWORD *)v5 = 2;
    *(_OWORD *)(v5 + 8) = v4;
    *(_QWORD *)(v5 + 24) = v6;
    *(_QWORD *)(v5 + 32) = v7;
    *(_QWORD *)(v5 + 40) = v9;
    *(_QWORD *)(v5 + 48) = v8;
    *(_QWORD *)(v5 + 56) = v10;
    *(_QWORD *)(v5 + 64) = v11;
    *(_QWORD *)(v5 + 72) = v12;
    *(_OWORD *)(v5 + 80) = v13;
    *(_BYTE *)(v5 + 96) = v14;
    JUMPOUT(0x1CF72254CLL);
  }
  JUMPOUT(0x1CF722538);
}

void sub_1CF722674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  char v14;

  OUTLINED_FUNCTION_146_0();
  v3 = *(_QWORD *)(v2 - 256);
  OUTLINED_FUNCTION_6_16();
  if (!v0)
  {
    OUTLINED_FUNCTION_28_4(v3, *(uint64_t (**)(uint64_t, _QWORD))(v1 + 8));
    OUTLINED_FUNCTION_18_15();
    OUTLINED_FUNCTION_8_15(*(_QWORD *)(v2 - 72));
    *(double *)&v4 = OUTLINED_FUNCTION_5_13();
    v5 = *(_QWORD *)(v2 - 232);
    *(_QWORD *)v5 = 3;
    *(_OWORD *)(v5 + 8) = v4;
    *(_QWORD *)(v5 + 24) = v6;
    *(_QWORD *)(v5 + 32) = v7;
    *(_QWORD *)(v5 + 40) = v9;
    *(_QWORD *)(v5 + 48) = v8;
    *(_QWORD *)(v5 + 56) = v10;
    *(_QWORD *)(v5 + 64) = v11;
    *(_QWORD *)(v5 + 72) = v12;
    *(_OWORD *)(v5 + 80) = v13;
    *(_BYTE *)(v5 + 96) = v14;
    JUMPOUT(0x1CF72254CLL);
  }
  JUMPOUT(0x1CF722538);
}

void sub_1CF7226C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v1 - 192) = 5;
  sub_1CF72E824();
  v2 = *(_QWORD *)(v1 - 240);
  v3 = *(_QWORD *)(v1 - 384);
  OUTLINED_FUNCTION_25_9();
  if (v0)
    JUMPOUT(0x1CF722708);
  sub_1CF6ABC84();
  OUTLINED_FUNCTION_22_9();
  v4 = *(_QWORD *)(v1 - 72);
  OUTLINED_FUNCTION_30_3(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 288) + 8));
  OUTLINED_FUNCTION_18_15();
  OUTLINED_FUNCTION_47_1(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  v5 = *(_QWORD *)(v1 - 232);
  *(_QWORD *)v5 = *(_QWORD *)(v1 - 192);
  *(_OWORD *)(v5 + 8) = 0u;
  *(_QWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 32) = 0;
  *(_QWORD *)(v5 + 40) = 0;
  *(_QWORD *)(v5 + 48) = 0;
  *(_QWORD *)(v5 + 56) = 0;
  *(_QWORD *)(v5 + 64) = 0;
  *(_QWORD *)(v5 + 72) = 0x4000000000000000;
  *(_OWORD *)(v5 + 80) = 0u;
  *(_BYTE *)(v5 + 96) = 0;
  JUMPOUT(0x1CF72254CLL);
}

void sub_1CF722714()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, _QWORD);
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  char v14;

  OUTLINED_FUNCTION_144_1();
  OUTLINED_FUNCTION_6_16();
  if (!v0)
  {
    v2 = OUTLINED_FUNCTION_38_9();
    OUTLINED_FUNCTION_28_4(v2, v3);
    OUTLINED_FUNCTION_18_15();
    OUTLINED_FUNCTION_8_15(*(_QWORD *)(v1 - 72));
    *(double *)&v4 = OUTLINED_FUNCTION_5_13();
    v5 = *(_QWORD *)(v1 - 232);
    *(_QWORD *)v5 = 4;
    *(_OWORD *)(v5 + 8) = v4;
    *(_QWORD *)(v5 + 24) = v6;
    *(_QWORD *)(v5 + 32) = v7;
    *(_QWORD *)(v5 + 40) = v9;
    *(_QWORD *)(v5 + 48) = v8;
    *(_QWORD *)(v5 + 56) = v10;
    *(_QWORD *)(v5 + 64) = v11;
    *(_QWORD *)(v5 + 72) = v12;
    *(_OWORD *)(v5 + 80) = v13;
    *(_BYTE *)(v5 + 96) = v14;
    JUMPOUT(0x1CF72254CLL);
  }
  JUMPOUT(0x1CF722538);
}

void sub_1CF722764()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)(v2 - 192) = 7;
  sub_1CF72E7AC();
  v3 = *(_QWORD *)(v2 - 384);
  OUTLINED_FUNCTION_25_9();
  if (v0)
  {
    OUTLINED_FUNCTION_18_15();
    OUTLINED_FUNCTION_198_0();
    JUMPOUT(0x1CF722544);
  }
  sub_1CF72C9D0();
  OUTLINED_FUNCTION_43_10();
  v4 = *(_QWORD *)(v2 - 72);
  OUTLINED_FUNCTION_58_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 312) + 8));
  OUTLINED_FUNCTION_18_15();
  OUTLINED_FUNCTION_47_1(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  JUMPOUT(0x1CF7228F4);
}

uint64_t sub_1CF722920(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 0x6B616873646E6168 && a2 == 0xE900000000000065;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6F666E4972656570 && a2 == 0xE800000000000000;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x694C657461657263 && a2 == 0xEE0072656E657473;
      if (v7 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x61506C65636E6163 && a2 == 0xEF70757465537269;
        if (v8 || (sub_1CF73F690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0xD000000000000015 && a2 == 0x80000001CF755490 || (sub_1CF73F690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0x6E5565746F6D6572 && a2 == 0xEC0000006B636F6CLL)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v10 = sub_1CF73F690();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 5;
          else
            return 6;
        }
      }
    }
  }
}

uint64_t sub_1CF722BF4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CF722C2C + 4 * byte_1CF747D04[a1]))(0x6B616873646E6168, 0xE900000000000065);
}

uint64_t sub_1CF722C2C()
{
  return 0x6F666E4972656570;
}

uint64_t sub_1CF722C44()
{
  return 0x694C657461657263;
}

uint64_t sub_1CF722C68()
{
  return 0x61506C65636E6163;
}

unint64_t sub_1CF722C8C()
{
  return 0xD000000000000015;
}

uint64_t sub_1CF722CA8()
{
  return 0x6E5565746F6D6572;
}

uint64_t sub_1CF722CC8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001CF7554B0 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001CF7554D0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_1CF722E04(char a1)
{
  if (!a1)
    return 7955819;
  if (a1 == 1)
    return 0xD000000000000015;
  return 0xD000000000000013;
}

uint64_t sub_1CF722E60(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 7955819 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1CF722ED4()
{
  return 7955819;
}

void sub_1CF722EE4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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
  uint64_t v21[3];
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

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3CC8);
  v29 = *(_QWORD *)(v3 - 8);
  v30 = v3;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_89_2(v5, v21[0]);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3CD0);
  v23 = *(_QWORD *)(v24 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_44_7((uint64_t)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3CD8);
  v21[2] = *(_QWORD *)(v22 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_44_7(v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3CE0);
  v31 = *(_QWORD *)(v10 - 8);
  v32 = v10;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_87_5(v12, v21[0]);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3CE8);
  v25 = *(_QWORD *)(v13 - 8);
  v26 = v13;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_13();
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3CF0);
  v27 = *(_QWORD *)(v15 - 8);
  v28 = v15;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_12();
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3CF8);
  v36 = *(_QWORD *)(v35 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_99();
  v18 = *(_QWORD *)(v0 + 8);
  OUTLINED_FUNCTION_126_2();
  v33 = v19;
  v34 = v20;
  OUTLINED_FUNCTION_55_6(v2);
  sub_1CF72E518();
  OUTLINED_FUNCTION_23();
  __asm { BR              X10 }
}

void sub_1CF7230A0()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v3 - 120) = 0;
  sub_1CF72E6F8();
  *(_QWORD *)(v3 - 304) = v0;
  v4 = v0;
  v5 = *(_QWORD *)(v3 - 168);
  swift_bridgeObjectRetain();
  v6 = *(_QWORD *)(v3 - 152);
  sub_1CF73F57C();
  *(_QWORD *)(v3 - 120) = v4;
  *(_BYTE *)(v3 - 112) = v1 & 1;
  *(_QWORD *)(v3 - 104) = *(_QWORD *)(v3 - 160);
  *(_QWORD *)(v3 - 96) = v5;
  sub_1CF72EAA4();
  OUTLINED_FUNCTION_165_1();
  OUTLINED_FUNCTION_58_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 232) + 8));
  OUTLINED_FUNCTION_30_3(v6, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 128) + 8));
  sub_1CF6C8BA8(*(void **)(v3 - 304), v1);
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF72343C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B00);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_87_5(v5, v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AF8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B28);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_91_2(v8, v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B20);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B10);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_89_2(v11, v28);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B18);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_13();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B08);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_28();
  v29 = (uint64_t)v3;
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1CF72E518();
  OUTLINED_FUNCTION_122_1();
  sub_1CF73F840();
  if (!v0)
  {
    v15 = sub_1CF73F564();
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
    {
      v17 = *(unsigned __int8 *)(v15 + 32);
      sub_1CF6A6F50(1, v16, v15, v15 + 32, 0, (2 * v16) | 1);
      v19 = v18;
      v21 = v20;
      swift_bridgeObjectRelease();
      if (v19 == v21 >> 1)
        __asm { BR              X9 }
    }
    v22 = OUTLINED_FUNCTION_93_1();
    OUTLINED_FUNCTION_105();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1470);
    *v24 = &unk_1E8CA2A70;
    sub_1CF73F4B0();
    OUTLINED_FUNCTION_75();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x1E0DEC450], v22);
    swift_willThrow();
    OUTLINED_FUNCTION_30_9();
    OUTLINED_FUNCTION_80_2();
    v25(v1, v13);
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v29);
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF723968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 - 128) = 5;
  sub_1CF72E554();
  v4 = *(_QWORD *)(v3 - 192);
  sub_1CF73F4A4();
  if (v0)
  {
    OUTLINED_FUNCTION_30_9();
    OUTLINED_FUNCTION_80_2();
    JUMPOUT(0x1CF723950);
  }
  sub_1CF6D8794();
  OUTLINED_FUNCTION_97_2();
  OUTLINED_FUNCTION_12_0();
  v5 = *(_QWORD *)(v3 - 280);
  OUTLINED_FUNCTION_1_6(v4, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_30_9();
  OUTLINED_FUNCTION_45_9(v2, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  JUMPOUT(0x1CF723AFCLL);
}

uint64_t sub_1CF723BD8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  char v12;

  v2 = a1 == 0x6B616873646E6168 && a2 == 0xE900000000000065;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6F666E4972656570 && a2 == 0xE800000000000000;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x694C657461657263 && a2 == 0xEE0072656E657473;
      if (v7 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000015 && a2 == 0x80000001CF755490 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 0x6E5565746F6D6572 && a2 == 0xEC0000006B636F6CLL;
        if (v8 || (sub_1CF73F690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v9 = a1 == 0x726F727265 && a2 == 0xE500000000000000;
          if (v9 || (sub_1CF73F690() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v10 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
            if (v10 || (sub_1CF73F690() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else if (a1 == 0x747845726F727265 && a2 == 0xED00006465646E65)
            {
              swift_bridgeObjectRelease();
              return 7;
            }
            else
            {
              v12 = sub_1CF73F690();
              swift_bridgeObjectRelease();
              if ((v12 & 1) != 0)
                return 7;
              else
                return 8;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1CF723F64(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CF723F9C + 4 * byte_1CF747D14[a1]))(0x6B616873646E6168, 0xE900000000000065);
}

uint64_t sub_1CF723F9C()
{
  return 0x6F666E4972656570;
}

uint64_t sub_1CF723FB4()
{
  return 0x694C657461657263;
}

unint64_t sub_1CF723FD8()
{
  return 0xD000000000000015;
}

uint64_t sub_1CF723FF4()
{
  return 0x6E5565746F6D6572;
}

uint64_t sub_1CF724014()
{
  return 0x726F727265;
}

uint64_t sub_1CF724028()
{
  return 0x73736563637573;
}

uint64_t sub_1CF724040()
{
  return 0x747845726F727265;
}

uint64_t sub_1CF724064(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 1953656688 && a2 == 0xE400000000000000;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7550656369766564 && a2 == 0xEF79654B63696C62)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1CF724164(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7550656369766564;
  else
    return 1953656688;
}

uint64_t sub_1CF7241A0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x79654B74736F68 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1CF724224()
{
  return 0x79654B74736F68;
}

void sub_1CF72423C()
{
  const void *v0;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[128];
  _BYTE v16[136];

  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C08);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BF0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_88_2(v3, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BE8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_14();
  v14 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BD8) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_99();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BD0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C10);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_90_3(v8, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BF8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_14();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C00);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7BE0);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_13();
  sub_1CF6C8CAC(v0, v15);
  OUTLINED_FUNCTION_141_0();
  sub_1CF73F858();
  sub_1CF6C8CAC(v15, v16);
  v12 = (char *)sub_1CF724470 + 4 * word_1CF747D1C[sub_1CF6C9F7C((uint64_t)v16)];
  __asm { BR              X10 }
}

void sub_1CF724470()
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);

  v1 = (const void *)OUTLINED_FUNCTION_69_7();
  *(_BYTE *)(v0 + 232) = 0;
  sub_1CF6C8CAC((const void *)(v0 + 488), (void *)(v0 + 360));
  v2 = nullsub_1(v0 + 360);
  sub_1CF6CA90C(v2);
  sub_1CF72CA0C();
  v4 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  OUTLINED_FUNCTION_40_8();
  OUTLINED_FUNCTION_142_0((void *)(v0 + 232), v1);
  sub_1CF72CB5C();
  sub_1CF73F5F4();
  v5 = OUTLINED_FUNCTION_365();
  v6(v5);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 224) + 8))(v4, v3);
  sub_1CF72CA84(v0 + 488);
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF724990()
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
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B40);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B48);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B50);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B58);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B60);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B68);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B70);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B78);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_15();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3B80);
  OUTLINED_FUNCTION_70_7();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_141_0();
  sub_1CF73F840();
  if (!v0)
  {
    v26 = v1;
    v15 = v13;
    v16 = sub_1CF73F564();
    v17 = *(_QWORD *)(v16 + 16);
    if (v17)
    {
      v18 = *(unsigned __int8 *)(v16 + 32);
      sub_1CF6A6F50(1, v17, v16, v16 + 32, 0, (2 * v17) | 1);
      v20 = v19;
      v22 = v21;
      OUTLINED_FUNCTION_270();
      if (v20 == v22 >> 1)
        __asm { BR              X9 }
    }
    v23 = OUTLINED_FUNCTION_93_1();
    OUTLINED_FUNCTION_105();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1470);
    *v25 = &unk_1E8CA21C0;
    sub_1CF73F4B0();
    OUTLINED_FUNCTION_75();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x1E0DEC450], v23);
    swift_willThrow();
    OUTLINED_FUNCTION_13_2();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v2, v15);
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v4);
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1CF7252DC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 0x746E657665 && a2 == 0xE500000000000000;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x74736575716572 && a2 == 0xE700000000000000;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x65736E6F70736572 && a2 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_1CF73F690();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1CF725420(char a1)
{
  if (!a1)
    return 0x746E657665;
  if (a1 == 1)
    return 0x74736575716572;
  return 0x65736E6F70736572;
}

uint64_t sub_1CF725474(uint64_t a1, uint64_t a2)
{
  char v6;

  if (a1 == 0xD000000000000014 && a2 == 0x80000001CF755470 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1CF725544(char a1)
{
  if ((a1 & 1) != 0)
    return 12639;
  else
    return 0xD000000000000014;
}

void sub_1CF725574()
{
  const void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  _BYTE v50[136];
  _BYTE v51[136];
  _BYTE v52[144];

  OUTLINED_FUNCTION_2();
  v4 = v0;
  v6 = v5;
  v35 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B88) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_88_2(v8, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B80);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_28();
  v32 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B78) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_99();
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B70);
  v39 = *(_QWORD *)(v41 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_98();
  sub_1CF6C8C64(v4, v51);
  __swift_project_boxed_opaque_existential_0Tm(v6, v6[3]);
  sub_1CF72C4E0();
  v40 = v3;
  sub_1CF73F858();
  sub_1CF6C8C64(v51, v52);
  v12 = sub_1CF6CA6D0((uint64_t)v52);
  if (!v12)
  {
    v22 = OUTLINED_FUNCTION_136_1();
    v36 = *(_OWORD *)(v22 + 16);
    v38 = *(_OWORD *)v22;
    v34 = *(_OWORD *)(v22 + 32);
    v30 = *(_OWORD *)(v22 + 64);
    v31 = *(_OWORD *)(v22 + 48);
    v23 = *(_QWORD *)(v22 + 80);
    v24 = *(_QWORD *)(v22 + 88);
    v25 = *(_BYTE *)(v22 + 96);
    LOBYTE(v42) = 0;
    sub_1CF6C8C64(v51, v50);
    v26 = sub_1CF6CA7A8((uint64_t)v50);
    sub_1CF6CA4D0(*(id *)v26, *(_QWORD *)(v26 + 8), *(_QWORD *)(v26 + 16), *(_QWORD *)(v26 + 24), *(_QWORD *)(v26 + 32), *(_QWORD *)(v26 + 40), *(_QWORD *)(v26 + 48), *(_QWORD *)(v26 + 56), *(_QWORD *)(v26 + 64), *(_QWORD *)(v26 + 72), *(_QWORD *)(v26 + 80), *(_QWORD *)(v26 + 88));
    sub_1CF72C60C();
    v17 = v41;
    sub_1CF73F57C();
    v42 = v38;
    v43 = v36;
    v44 = v34;
    v45 = v31;
    v46 = v30;
    v47 = v23;
    v48 = v24;
    v49 = v25;
    sub_1CF72C76C();
    sub_1CF73F5F4();
    OUTLINED_FUNCTION_7_11(v2, *(uint64_t (**)(uint64_t, uint64_t))(v32 + 8));
    v20 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v21 = v40;
    goto LABEL_5;
  }
  if (v12 == 1)
  {
    v13 = OUTLINED_FUNCTION_136_1();
    v37 = *(_OWORD *)v13;
    v14 = *(_QWORD *)(v13 + 16);
    v15 = *(_QWORD *)(v13 + 24);
    v16 = OUTLINED_FUNCTION_111_1(1);
    sub_1CF6CA5A4(*(id *)v16, *(_QWORD *)(v16 + 8));
    sub_1CF72C594();
    v17 = v41;
    OUTLINED_FUNCTION_133_0();
    v42 = v37;
    *(_QWORD *)&v43 = v14;
    *((_QWORD *)&v43 + 1) = v15;
    sub_1CF72C730();
    sub_1CF73F5F4();
    v18 = OUTLINED_FUNCTION_68_7();
    OUTLINED_FUNCTION_47_1(v18, v19);
    v20 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v21 = v40;
LABEL_5:
    v20(v21, v17);
    goto LABEL_6;
  }
  v27 = OUTLINED_FUNCTION_136_1();
  v28 = OUTLINED_FUNCTION_111_1(2);
  sub_1CF6CA744(v28);
  sub_1CF72C51C();
  OUTLINED_FUNCTION_133_0();
  LOBYTE(v42) = 0;
  sub_1CF73F624();
  if (v1)
  {
    sub_1CF72C684((uint64_t)v51);
    OUTLINED_FUNCTION_26_1(v33, *(uint64_t (**)(uint64_t, uint64_t))(v35 + 8));
    OUTLINED_FUNCTION_30_3(v3, *(uint64_t (**)(uint64_t, uint64_t))(v39 + 8));
    goto LABEL_9;
  }
  sub_1CF6C8CAC((const void *)(v27 + 8), &v42);
  OUTLINED_FUNCTION_54_9();
  sub_1CF72C6F4();
  sub_1CF73F5F4();
  OUTLINED_FUNCTION_26_1(v33, *(uint64_t (**)(uint64_t, uint64_t))(v35 + 8));
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v3, v41);
LABEL_6:
  sub_1CF72C684((uint64_t)v51);
LABEL_9:
  OUTLINED_FUNCTION_143_0();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF7259A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  _OWORD v33[9];
  _OWORD v34[9];
  uint64_t v35;
  _BYTE v36[144];

  OUTLINED_FUNCTION_2();
  v7 = v6;
  v27 = v8;
  v29 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AB0) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_14();
  v28 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AA8) - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_14();
  v30 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7AA0);
  OUTLINED_FUNCTION_70_7();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7A98);
  OUTLINED_FUNCTION_160_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_100();
  OUTLINED_FUNCTION_55_6(v7);
  sub_1CF72C4E0();
  OUTLINED_FUNCTION_81_4();
  if (v0)
    goto LABEL_9;
  v26 = v5;
  v31 = v2;
  v14 = sub_1CF73F564();
  v15 = *(_QWORD *)(v14 + 16);
  v16 = v3;
  if (!v15)
  {
LABEL_8:
    v22 = OUTLINED_FUNCTION_93_1();
    OUTLINED_FUNCTION_105();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1470);
    *v24 = &unk_1E8CA2130;
    sub_1CF73F4B0();
    OUTLINED_FUNCTION_75();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x1E0DEC450], v22);
    swift_willThrow();
    OUTLINED_FUNCTION_13_2();
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v4, v16);
    goto LABEL_9;
  }
  v17 = *(unsigned __int8 *)(v14 + 32);
  sub_1CF6A6F50(1, v15, v14, v14 + 32, 0, (2 * v15) | 1);
  v19 = v18;
  v21 = v20;
  OUTLINED_FUNCTION_40_0();
  if (v19 != v21 >> 1)
  {
    v16 = v3;
    goto LABEL_8;
  }
  if (v17)
  {
    if (v17 == 1)
    {
      LOBYTE(v34[0]) = 1;
      sub_1CF72C594();
      OUTLINED_FUNCTION_96_2();
      sub_1CF72C5D0();
      OUTLINED_FUNCTION_109_2();
      OUTLINED_FUNCTION_1_6(v30, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
      OUTLINED_FUNCTION_9_4();
      OUTLINED_FUNCTION_58_0(v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      v34[0] = v33[0];
      v34[1] = v33[1];
      sub_1CF6CAC94((uint64_t)v34);
    }
    else
    {
      sub_1CF72C51C();
      OUTLINED_FUNCTION_97_2();
      OUTLINED_FUNCTION_96_2();
      LOBYTE(v34[0]) = 0;
      v25 = sub_1CF73F558();
      OUTLINED_FUNCTION_54_9();
      sub_1CF72C558();
      OUTLINED_FUNCTION_109_2();
      OUTLINED_FUNCTION_9_13(v29);
      OUTLINED_FUNCTION_9_4();
      OUTLINED_FUNCTION_45_9(v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      sub_1CF6C8CAC(&v35, v32);
      *(_QWORD *)&v33[0] = v25;
      sub_1CF6C8CAC(v32, (char *)v33 + 8);
      memcpy(v34, v33, 0x82uLL);
      sub_1CF6CA7F4((uint64_t)v34);
    }
  }
  else
  {
    LOBYTE(v34[0]) = 0;
    sub_1CF72C60C();
    OUTLINED_FUNCTION_96_2();
    sub_1CF72C648();
    OUTLINED_FUNCTION_109_2();
    OUTLINED_FUNCTION_58_0(v26, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_9_4();
    OUTLINED_FUNCTION_1_6(v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    v34[0] = v33[0];
    v34[1] = v33[1];
    v34[2] = v33[2];
    v34[3] = v33[3];
    v34[4] = v33[4];
    v34[5] = v33[5];
    LOBYTE(v34[6]) = v33[6];
    sub_1CF6C8C54((uint64_t)v34);
  }
  sub_1CF6C8C64(v34, v36);
  sub_1CF6C8C64(v36, v27);
LABEL_9:
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v7);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF725EC0()
{
  ControlChannelMessageEnvelope.init(from:)();
}

void sub_1CF725ED4()
{
  ControlChannelMessageEnvelope.encode(to:)();
}

uint64_t sub_1CF725EE8()
{
  sub_1CF72E860();
  return sub_1CF73F864();
}

uint64_t sub_1CF725F10()
{
  sub_1CF72E860();
  return sub_1CF73F870();
}

uint64_t sub_1CF725F38()
{
  unsigned __int8 *v0;

  return sub_1CF721748(*v0);
}

uint64_t sub_1CF725F40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF72140C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF725F64()
{
  sub_1CF72E770();
  return sub_1CF73F864();
}

uint64_t sub_1CF725F8C()
{
  sub_1CF72E770();
  return sub_1CF73F870();
}

uint64_t sub_1CF725FB4()
{
  sub_1CF72E7AC();
  return sub_1CF73F864();
}

uint64_t sub_1CF725FDC()
{
  sub_1CF72E7AC();
  return sub_1CF73F870();
}

uint64_t sub_1CF726004()
{
  sub_1CF72E8D8();
  return sub_1CF73F864();
}

uint64_t sub_1CF72602C()
{
  sub_1CF72E8D8();
  return sub_1CF73F870();
}

uint64_t sub_1CF726054()
{
  sub_1CF72E950();
  return sub_1CF73F864();
}

uint64_t sub_1CF72607C()
{
  sub_1CF72E950();
  return sub_1CF73F870();
}

uint64_t sub_1CF7260A4()
{
  sub_1CF72E914();
  return sub_1CF73F864();
}

uint64_t sub_1CF7260CC()
{
  sub_1CF72E914();
  return sub_1CF73F870();
}

uint64_t sub_1CF7260F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF721838(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CF726120()
{
  sub_1CF72E824();
  return sub_1CF73F864();
}

uint64_t sub_1CF726148()
{
  sub_1CF72E824();
  return sub_1CF73F870();
}

uint64_t sub_1CF726170()
{
  sub_1CF72E89C();
  return sub_1CF73F864();
}

uint64_t sub_1CF726198()
{
  sub_1CF72E89C();
  return sub_1CF73F870();
}

uint64_t sub_1CF7261C0()
{
  sub_1CF72E7E8();
  return sub_1CF73F864();
}

uint64_t sub_1CF7261E8()
{
  sub_1CF72E7E8();
  return sub_1CF73F870();
}

#error "1CF726218: call analysis failed (funcsize=5)"

#error "1CF72622C: call analysis failed (funcsize=5)"

uint64_t sub_1CF726238()
{
  sub_1CF72E5CC();
  return sub_1CF73F864();
}

uint64_t sub_1CF726260()
{
  sub_1CF72E5CC();
  return sub_1CF73F870();
}

uint64_t sub_1CF726288()
{
  unsigned __int8 *v0;

  return sub_1CF722BF4(*v0);
}

uint64_t sub_1CF726290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF722920(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF7262B4()
{
  sub_1CF72E518();
  return sub_1CF73F864();
}

uint64_t sub_1CF7262DC()
{
  sub_1CF72E518();
  return sub_1CF73F870();
}

uint64_t sub_1CF726304()
{
  char *v0;

  return sub_1CF722E04(*v0);
}

uint64_t sub_1CF72630C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF722CC8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF726330()
{
  sub_1CF72E608();
  return sub_1CF73F864();
}

uint64_t sub_1CF726358()
{
  sub_1CF72E608();
  return sub_1CF73F870();
}

uint64_t sub_1CF726380()
{
  sub_1CF72E590();
  return sub_1CF73F864();
}

uint64_t sub_1CF7263A8()
{
  sub_1CF72E590();
  return sub_1CF73F870();
}

uint64_t sub_1CF7263D0()
{
  sub_1CF72E6F8();
  return sub_1CF73F864();
}

uint64_t sub_1CF7263F8()
{
  sub_1CF72E6F8();
  return sub_1CF73F870();
}

uint64_t sub_1CF726420()
{
  sub_1CF72E6BC();
  return sub_1CF73F864();
}

uint64_t sub_1CF726448()
{
  sub_1CF72E6BC();
  return sub_1CF73F870();
}

uint64_t sub_1CF726474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF722E60(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CF72649C()
{
  sub_1CF72E554();
  return sub_1CF73F864();
}

uint64_t sub_1CF7264C4()
{
  sub_1CF72E554();
  return sub_1CF73F870();
}

void sub_1CF7264EC()
{
  sub_1CF72343C();
}

void sub_1CF726500()
{
  sub_1CF722EE4();
}

uint64_t sub_1CF726514()
{
  unsigned __int8 *v0;

  return sub_1CF723F64(*v0);
}

uint64_t sub_1CF72651C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF723BD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF726540()
{
  sub_1CF72C7A8();
  return sub_1CF73F864();
}

uint64_t sub_1CF726568()
{
  sub_1CF72C7A8();
  return sub_1CF73F870();
}

uint64_t sub_1CF726590()
{
  char *v0;

  return sub_1CF724164(*v0);
}

uint64_t sub_1CF726598@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF724064(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF7265BC()
{
  sub_1CF72C958();
  return sub_1CF73F864();
}

uint64_t sub_1CF7265E4()
{
  sub_1CF72C958();
  return sub_1CF73F870();
}

uint64_t sub_1CF726610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF7241A0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CF726638()
{
  sub_1CF72C91C();
  return sub_1CF73F864();
}

uint64_t sub_1CF726660()
{
  sub_1CF72C91C();
  return sub_1CF73F870();
}

uint64_t sub_1CF726688()
{
  sub_1CF72C868();
  return sub_1CF73F864();
}

uint64_t sub_1CF7266B0()
{
  sub_1CF72C868();
  return sub_1CF73F870();
}

uint64_t sub_1CF7266D8()
{
  sub_1CF72C7E4();
  return sub_1CF73F864();
}

uint64_t sub_1CF726700()
{
  sub_1CF72C7E4();
  return sub_1CF73F870();
}

uint64_t sub_1CF726728()
{
  sub_1CF72CA0C();
  return sub_1CF73F864();
}

uint64_t sub_1CF726750()
{
  sub_1CF72CA0C();
  return sub_1CF73F870();
}

uint64_t sub_1CF726778()
{
  sub_1CF72C994();
  return sub_1CF73F864();
}

uint64_t sub_1CF7267A0()
{
  sub_1CF72C994();
  return sub_1CF73F870();
}

uint64_t sub_1CF7267C8()
{
  sub_1CF72C8E0();
  return sub_1CF73F864();
}

uint64_t sub_1CF7267F0()
{
  sub_1CF72C8E0();
  return sub_1CF73F870();
}

uint64_t sub_1CF726818()
{
  sub_1CF72C82C();
  return sub_1CF73F864();
}

uint64_t sub_1CF726840()
{
  sub_1CF72C82C();
  return sub_1CF73F870();
}

void sub_1CF726868()
{
  sub_1CF724990();
}

void sub_1CF72687C()
{
  sub_1CF72423C();
}

uint64_t sub_1CF726890()
{
  char *v0;

  return sub_1CF725420(*v0);
}

uint64_t sub_1CF726898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF7252DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF7268BC()
{
  sub_1CF72C4E0();
  return sub_1CF73F864();
}

uint64_t sub_1CF7268E4()
{
  sub_1CF72C4E0();
  return sub_1CF73F870();
}

uint64_t sub_1CF72690C()
{
  sub_1CF72C60C();
  return sub_1CF73F864();
}

uint64_t sub_1CF726934()
{
  sub_1CF72C60C();
  return sub_1CF73F870();
}

uint64_t sub_1CF72695C()
{
  sub_1CF72C594();
  return sub_1CF73F864();
}

uint64_t sub_1CF726984()
{
  sub_1CF72C594();
  return sub_1CF73F870();
}

uint64_t sub_1CF7269AC()
{
  char *v0;

  return sub_1CF725544(*v0);
}

uint64_t sub_1CF7269B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF725474(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF7269D8()
{
  sub_1CF72C51C();
  return sub_1CF73F864();
}

uint64_t sub_1CF726A00()
{
  sub_1CF72C51C();
  return sub_1CF73F870();
}

void sub_1CF726A28()
{
  sub_1CF7259A4();
}

void sub_1CF726A3C()
{
  sub_1CF725574();
}

uint64_t static ControlChannelConnectionIdentifierCategory.numberOfCharacters.getter()
{
  return 6;
}

uint64_t static ControlChannelConnectionIdentifierCategory.prefix.getter()
{
  return 1852793699;
}

uint64_t sub_1CF726A68()
{
  return 1852793699;
}

uint64_t sub_1CF726A78(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  char v6;

  if (a1 == 0xD000000000000013 && a2 == 0x80000001CF755550 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v5 = a1 == 0x6974704F74736F68 && a2 == 0xEB00000000736E6FLL;
    if (v5 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000015 && a2 == 0x80000001CF7517E0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v6 = sub_1CF73F690();
      swift_bridgeObjectRelease();
      if ((v6 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1CF726BD8(char a1)
{
  uint64_t result;

  result = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1)
      return 0x6974704F74736F68;
    else
      return 0xD000000000000015;
  }
  return result;
}

void sub_1CF726C40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3D78);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_126_2();
  OUTLINED_FUNCTION_55_6(v4);
  sub_1CF72FD28();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_116_2();
  sub_1CF72EB94((uint64_t)&unk_1ED8F7918);
  OUTLINED_FUNCTION_134_1();
  OUTLINED_FUNCTION_13_1();
  if (!v0)
  {
    OUTLINED_FUNCTION_54_9();
    sub_1CF72FDA0();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_63_7();
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_151_1((uint64_t)&unk_1EFBA3D88);
    OUTLINED_FUNCTION_134_1();
    OUTLINED_FUNCTION_60_6();
  }
  OUTLINED_FUNCTION_37_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF726D80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];
  char v12;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7A90);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_42_0();
  sub_1CF72FD28();
  OUTLINED_FUNCTION_122_1();
  OUTLINED_FUNCTION_300();
  if (v0)
  {
    OUTLINED_FUNCTION_71_2();
    OUTLINED_FUNCTION_115_2();
  }
  else
  {
    OUTLINED_FUNCTION_116_2();
    sub_1CF72EB94((uint64_t)&unk_1ED8F7920);
    OUTLINED_FUNCTION_121_2();
    OUTLINED_FUNCTION_12_0();
    v7 = (void *)v11[0];
    OUTLINED_FUNCTION_54_9();
    sub_1CF72FD64();
    v8 = v7;
    OUTLINED_FUNCTION_97_2();
    OUTLINED_FUNCTION_12_0();
    v12 = v11[0];
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_63_7();
    OUTLINED_FUNCTION_151_1((uint64_t)&unk_1ED8F7D98);
    sub_1CF73F4E0();
    OUTLINED_FUNCTION_1_6((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    v10 = v11[0];
    v9 = v11[1];
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_115_2();
    *(_QWORD *)v3 = v8;
    *(_BYTE *)(v3 + 8) = v12;
    *(_QWORD *)(v3 + 16) = v10;
    *(_QWORD *)(v3 + 24) = v9;
    OUTLINED_FUNCTION_71_2();
    swift_bridgeObjectRelease();

  }
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1CF726F4C()
{
  char *v0;

  return sub_1CF726BD8(*v0);
}

uint64_t sub_1CF726F54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF726A78(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF726F78()
{
  sub_1CF72FD28();
  return sub_1CF73F864();
}

uint64_t sub_1CF726FA0()
{
  sub_1CF72FD28();
  return sub_1CF73F870();
}

void sub_1CF726FC8()
{
  sub_1CF726D80();
}

void sub_1CF726FDC()
{
  sub_1CF726C40();
}

uint64_t sub_1CF726FF0(uint64_t a1, uint64_t a2)
{
  BOOL v5;
  char v7;

  if (a1 == 0xD000000000000013 && a2 == 0x80000001CF755550 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000023 && a2 == 0x80000001CF755570 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = a1 == 0x704F656369766564 && a2 == 0xED0000736E6F6974;
    if (v5 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x6976654472656570 && a2 == 0xEE006F666E496563)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v7 = sub_1CF73F690();
      swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_1CF7271E0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1CF727218 + 4 * byte_1CF747D34[a1]))(0xD000000000000013, 0x80000001CF755550);
}

uint64_t sub_1CF727218(uint64_t a1)
{
  return a1 + 16;
}

uint64_t sub_1CF727230()
{
  return 0x704F656369766564;
}

uint64_t sub_1CF727254()
{
  return 0x6976654472656570;
}

void sub_1CF727278()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B68);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_99();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1CF72EB1C();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_116_2();
  sub_1CF72EB94((uint64_t)&unk_1ED8F7918);
  OUTLINED_FUNCTION_13_1();
  if (!v0)
  {
    OUTLINED_FUNCTION_54_9();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_63_7();
    sub_1CF72EBC8();
    OUTLINED_FUNCTION_13_1();
    sub_1CF72CB20();
    OUTLINED_FUNCTION_60_6();
  }
  OUTLINED_FUNCTION_7_11(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF727514()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  void *v55;
  uint64_t v56;
  _QWORD v57[2];
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
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
  unint64_t v74;
  char v75;
  id v76[2];
  char v77;
  char v78;
  char v79;
  char v80;
  char v81;
  __int16 v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char v110;
  __int16 v111;
  char v112;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3D20);
  OUTLINED_FUNCTION_70_7();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_12();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1CF72EB1C();
  OUTLINED_FUNCTION_81_4();
  if (v0)
  {
    v7 = OUTLINED_FUNCTION_157_1();
    OUTLINED_FUNCTION_34_9(v7, v8, v9, v10, v11, v12, v13, v14, v32, v34, v36, v38);
  }
  else
  {
    v55 = v5;
    OUTLINED_FUNCTION_116_2();
    sub_1CF72EB94((uint64_t)&unk_1ED8F7920);
    OUTLINED_FUNCTION_43_10();
    v15 = v76[0];
    OUTLINED_FUNCTION_43_10();
    LOBYTE(v57[0]) = 2;
    sub_1CF72EB58();
    v16 = v76[0];
    sub_1CF73F528();
    v53 = BYTE2(v76[0]);
    v54 = (char)v76[0];
    v52 = BYTE3(v76[0]);
    v50 = BYTE1(v76[0]);
    v51 = BYTE4(v76[0]);
    v97 = 3;
    sub_1CF72C9D0();
    sub_1CF73F4E0();
    OUTLINED_FUNCTION_9_13(v1);
    v42 = v16;
    v43 = v99;
    v17 = v100;
    v18 = v101;
    v56 = v102;
    v40 = v103;
    v41 = v15;
    v19 = v104;
    v20 = v15;
    v45 = v106;
    v46 = v107;
    v21 = v16;
    v47 = v108;
    v48 = v109;
    v49 = v110;
    v22 = v98;
    v35 = v104;
    v37 = v98;
    v33 = v100;
    v44 = v101;
    v23 = v105;
    v39 = v105;
    v24 = sub_1CF6B56D0(v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109);
    OUTLINED_FUNCTION_34_9(v24, v25, v26, v27, v28, v29, v30, v31, v33, v35, v37, v39);
    v57[0] = v20;
    v57[1] = v21;
    v58 = v54;
    v59 = v50;
    v60 = v53;
    v61 = v52;
    v62 = v51;
    v63 = v22;
    v64 = v43;
    v65 = v17;
    v66 = v18;
    v67 = v56;
    v68 = v40;
    v69 = v19;
    v70 = v23;
    v71 = v45;
    v72 = v46;
    v73 = v47;
    v74 = v48;
    v75 = v49;
    sub_1CF6CA90C((uint64_t)v57);
    sub_1CF694020(v47, v43, v45, v44, v56, v40, v46, v48, v45, v46, v47, v48);

    OUTLINED_FUNCTION_142_0(v55, v57);
    OUTLINED_FUNCTION_157_1();
    v76[0] = v41;
    v76[1] = v42;
    v77 = v54;
    v78 = v50;
    v79 = v53;
    v80 = v52;
    v81 = v51;
    v82 = v111;
    v83 = v112;
    v84 = v47;
    v85 = v43;
    v86 = v45;
    v87 = v44;
    v88 = v56;
    v89 = v40;
    v90 = v46;
    v91 = v48;
    v92 = v45;
    v93 = v46;
    v94 = v47;
    v95 = v48;
    v96 = v49;
    sub_1CF6CA9BC((uint64_t)v76);
  }
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1CF727908()
{
  unsigned __int8 *v0;

  return sub_1CF7271E0(*v0);
}

uint64_t sub_1CF727910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF726FF0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF727934@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1CF6AC804();
  *a1 = result;
  return result;
}

uint64_t sub_1CF727958()
{
  sub_1CF72EB1C();
  return sub_1CF73F864();
}

uint64_t sub_1CF727980()
{
  sub_1CF72EB1C();
  return sub_1CF73F870();
}

void sub_1CF7279A8()
{
  sub_1CF727514();
}

void sub_1CF7279BC()
{
  sub_1CF727278();
}

void PeerDeviceInfo.identifier.getter()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void PeerDeviceInfo.identifier.setter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  OUTLINED_FUNCTION_121_0();
  swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.identifier.modify())()
{
  return nullsub_1;
}

void PeerDeviceInfo.name.getter()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void PeerDeviceInfo.name.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_121_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)(v1 + 24) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.name.modify())()
{
  return nullsub_1;
}

void PeerDeviceInfo.model.getter()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void PeerDeviceInfo.model.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_121_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.model.modify())()
{
  return nullsub_1;
}

void PeerDeviceInfo.udid.getter()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void PeerDeviceInfo.udid.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_121_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = v2;
  *(_QWORD *)(v1 + 56) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.udid.modify())()
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.ecid.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t PeerDeviceInfo.ecid.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = result;
  *(_BYTE *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*PeerDeviceInfo.ecid.modify())()
{
  return nullsub_1;
}

void PeerDeviceInfo.deviceKVSData.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_69();
  sub_1CF6A7B18(v0, v1);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void PeerDeviceInfo.deviceKVSData.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_121_0();
  sub_1CF693FE0(*(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88));
  *(_QWORD *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PeerDeviceInfo.deviceKVSData.modify())()
{
  return nullsub_1;
}

uint64_t PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 96) = result;
  return result;
}

uint64_t (*PeerDeviceInfo.deviceKVSIncludesSensitiveInfo.modify())()
{
  return nullsub_1;
}

uint64_t sub_1CF727BD8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  char v11;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 1701667182 && a2 == 0xE400000000000000;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000;
      if (v7 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 1684628597 && a2 == 0xE400000000000000;
        if (v8 || (sub_1CF73F690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 1684628325 && a2 == 0xE400000000000000;
          if (v9 || (sub_1CF73F690() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x564B656369766564 && a2 == 0xED00006174614453;
            if (v10 || (sub_1CF73F690() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else if (a1 == 0xD00000000000001ELL && a2 == 0x80000001CF755430)
            {
              swift_bridgeObjectRelease();
              return 6;
            }
            else
            {
              v11 = sub_1CF73F690();
              swift_bridgeObjectRelease();
              if ((v11 & 1) != 0)
                return 6;
              else
                return 7;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_1CF727E98(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CF727ED0 + 4 * byte_1CF747D38[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_1CF727ED0()
{
  return 1701667182;
}

uint64_t sub_1CF727EE0()
{
  return 0x6C65646F6DLL;
}

uint64_t sub_1CF727EF4()
{
  return 1684628597;
}

uint64_t sub_1CF727F08()
{
  return 1684628325;
}

uint64_t sub_1CF727F18()
{
  return 0x564B656369766564;
}

unint64_t sub_1CF727F3C()
{
  return 0xD00000000000001ELL;
}

uint64_t sub_1CF727F58()
{
  unsigned __int8 *v0;

  return sub_1CF727E98(*v0);
}

uint64_t sub_1CF727F60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF727BD8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF727F84()
{
  sub_1CF7281B0();
  return sub_1CF73F864();
}

uint64_t sub_1CF727FAC()
{
  sub_1CF7281B0();
  return sub_1CF73F870();
}

void PeerDeviceInfo.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B58);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_126_2();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1CF7281B0();
  sub_1CF73F858();
  sub_1CF73F588();
  if (!v0)
  {
    OUTLINED_FUNCTION_118_1(1);
    OUTLINED_FUNCTION_59_7();
    OUTLINED_FUNCTION_118_1(2);
    OUTLINED_FUNCTION_59_7();
    OUTLINED_FUNCTION_118_1(3);
    OUTLINED_FUNCTION_365();
    OUTLINED_FUNCTION_59_7();
    OUTLINED_FUNCTION_118_1(4);
    OUTLINED_FUNCTION_110_2();
    sub_1CF73F5B8();
    OUTLINED_FUNCTION_114_2(5);
    OUTLINED_FUNCTION_60_6();
    OUTLINED_FUNCTION_110_2();
    sub_1CF73F594();
  }
  OUTLINED_FUNCTION_30_3(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF7281B0()
{
  unint64_t result;

  result = qword_1ED8F6AC0;
  if (!qword_1ED8F6AC0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748748, &type metadata for PeerDeviceInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6AC0);
  }
  return result;
}

void PeerDeviceInfo.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
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
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3AA0);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_15();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1CF7281B0();
  sub_1CF73F840();
  if (v0)
  {
    v12 = 0;
    v11 = 0xF000000000000000;
    OUTLINED_FUNCTION_71_2();
    OUTLINED_FUNCTION_40_0();
  }
  else
  {
    OUTLINED_FUNCTION_74_3();
    v6 = sub_1CF73F4BC();
    v8 = v7;
    LOBYTE(v23) = 1;
    swift_bridgeObjectRetain();
    v18 = OUTLINED_FUNCTION_52_7();
    v19 = v6;
    OUTLINED_FUNCTION_62_4(2);
    v22 = v6;
    v17 = OUTLINED_FUNCTION_52_7();
    OUTLINED_FUNCTION_62_4(3);
    v21 = v6;
    v16 = OUTLINED_FUNCTION_52_7();
    OUTLINED_FUNCTION_62_4(4);
    OUTLINED_FUNCTION_74_3();
    v20 = v6;
    v9 = sub_1CF73F4EC();
    v25 = v10;
    v15 = v9;
    sub_1CF6D8794();
    sub_1CF73F4E0();
    v14 = v4;
    v12 = v23;
    v11 = v24;
    OUTLINED_FUNCTION_155_0();
    OUTLINED_FUNCTION_74_3();
    v13 = sub_1CF73F4C8();
    OUTLINED_FUNCTION_10_14();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_124_0();
    OUTLINED_FUNCTION_155_0();
    sub_1CF693FE0(v23, v24);
    OUTLINED_FUNCTION_40_0();
    OUTLINED_FUNCTION_150();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_270();
    *(_QWORD *)v14 = v19;
    *(_QWORD *)(v14 + 8) = v8;
    *(_QWORD *)(v14 + 16) = v18;
    *(_QWORD *)(v14 + 24) = v22;
    *(_QWORD *)(v14 + 32) = v17;
    *(_QWORD *)(v14 + 40) = v21;
    *(_QWORD *)(v14 + 48) = v16;
    *(_QWORD *)(v14 + 56) = v20;
    *(_QWORD *)(v14 + 64) = v15;
    *(_BYTE *)(v14 + 72) = v25 & 1;
    *(_QWORD *)(v14 + 80) = v23;
    *(_QWORD *)(v14 + 88) = v24;
    *(_BYTE *)(v14 + 96) = v13;
    OUTLINED_FUNCTION_71_2();
    OUTLINED_FUNCTION_270();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_150();
    swift_bridgeObjectRelease();
  }
  sub_1CF693FE0(v12, v11);
  OUTLINED_FUNCTION_119_2();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF728558()
{
  PeerDeviceInfo.init(from:)();
}

void sub_1CF72856C()
{
  PeerDeviceInfo.encode(to:)();
}

uint64_t ListenerStartedResponse.port.getter()
{
  unsigned __int16 *v0;

  return *v0;
}

void ListenerStartedResponse.deviceRawPublicKey.getter()
{
  OUTLINED_FUNCTION_21_4();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

uint64_t ListenerStartedResponse.init(port:deviceRawPublicKey:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_WORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  return result;
}

uint64_t sub_1CF7285B4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1953656688 && a2 == 0xE400000000000000;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001CF755450)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1CF728690(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000012;
  else
    return 1953656688;
}

void sub_1CF7286C4()
{
  OUTLINED_FUNCTION_139_0();
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1CF7286E8()
{
  char *v0;

  return sub_1CF728690(*v0);
}

uint64_t sub_1CF7286F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF7285B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF728714()
{
  sub_1CF728848();
  return sub_1CF73F864();
}

uint64_t sub_1CF72873C()
{
  sub_1CF728848();
  return sub_1CF73F870();
}

void ListenerStartedResponse.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3AA8);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_99();
  OUTLINED_FUNCTION_55_6(v4);
  sub_1CF728848();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_110_2();
  sub_1CF73F618();
  if (!v0)
  {
    OUTLINED_FUNCTION_114_2(1);
    OUTLINED_FUNCTION_13_1();
  }
  OUTLINED_FUNCTION_37_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF728848()
{
  unint64_t result;

  result = qword_1EFBA3AB0;
  if (!qword_1EFBA3AB0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7486F8, &type metadata for ListenerStartedResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3AB0);
  }
  return result;
}

void ListenerStartedResponse.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  __int16 v7;
  __int128 v8;
  __int128 v9;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3AB8);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_42_0();
  sub_1CF728848();
  OUTLINED_FUNCTION_122_1();
  OUTLINED_FUNCTION_300();
  if (!v0)
  {
    LOBYTE(v9) = 0;
    v7 = sub_1CF73F54C();
    OUTLINED_FUNCTION_54_9();
    sub_1CF6D8794();
    sub_1CF73F528();
    OUTLINED_FUNCTION_26_1((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    v8 = v9;
    *(_WORD *)v3 = v7;
    *(_OWORD *)(v3 + 8) = v8;
  }
  OUTLINED_FUNCTION_71_2();
  OUTLINED_FUNCTION_143_0();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF728998()
{
  ListenerStartedResponse.init(from:)();
}

void sub_1CF7289AC()
{
  ListenerStartedResponse.encode(to:)();
}

void StreamEncryptedMessage.encryptedData.getter()
{
  OUTLINED_FUNCTION_21_4();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF7289E0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6574707972636E65 && a2 == 0xED00006174614464)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1CF728A88()
{
  return 0x6574707972636E65;
}

void sub_1CF728AAC()
{
  sub_1CF73F7EC();
  OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1CF728AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF7289E0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CF728B00()
{
  sub_1CF728C00();
  return sub_1CF73F864();
}

uint64_t sub_1CF728B28()
{
  sub_1CF728C00();
  return sub_1CF73F870();
}

void StreamEncryptedMessage.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3AC0);
  OUTLINED_FUNCTION_27_1();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_55_6(v3);
  sub_1CF728C00();
  OUTLINED_FUNCTION_23();
  sub_1CF6D5DAC();
  OUTLINED_FUNCTION_132_1();
  OUTLINED_FUNCTION_58_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF728C00()
{
  unint64_t result;

  result = qword_1EFBA3AC8;
  if (!qword_1EFBA3AC8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7486A8, &type metadata for StreamEncryptedMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3AC8);
  }
  return result;
}

void StreamEncryptedMessage.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;
  _OWORD *v4;
  uint64_t v5;
  __int128 v6;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA3AD0);
  OUTLINED_FUNCTION_11_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_42_0();
  sub_1CF728C00();
  OUTLINED_FUNCTION_300();
  if (!v0)
  {
    sub_1CF6D8794();
    OUTLINED_FUNCTION_109_2();
    OUTLINED_FUNCTION_26_1(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    *v4 = v6;
  }
  OUTLINED_FUNCTION_71_2();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF728D04()
{
  StreamEncryptedMessage.init(from:)();
}

void sub_1CF728D18()
{
  StreamEncryptedMessage.encode(to:)();
}

uint64_t PropertyListCodable.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t PropertyListCodable.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 40))(v2, a1);
}

uint64_t (*PropertyListCodable.wrappedValue.modify())()
{
  return nullsub_1;
}

void PropertyListCodable.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
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
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  id v40;
  _QWORD v41[6];

  OUTLINED_FUNCTION_2();
  v39 = v0;
  v3 = v2;
  v5 = v4;
  v37 = v6;
  v41[5] = *MEMORY[0x1E0C80C00];
  v7 = sub_1CF73F288();
  v35 = *(_QWORD *)(v7 - 8);
  v36 = v7;
  MEMORY[0x1E0C80A78](v7);
  v38 = (char *)&v30 - v8;
  v34 = *(_QWORD *)(v3 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_15();
  v12 = type metadata accessor for PropertyListCodable(0, v3, v10, v11);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v30 - v14;
  __swift_project_boxed_opaque_existential_0Tm(v5, v5[3]);
  v16 = v39;
  sub_1CF73F834();
  if (v16)
    goto LABEL_10;
  v31 = v15;
  v32 = v13;
  v33 = v1;
  v39 = v12;
  __swift_project_boxed_opaque_existential_0Tm(v41, v41[3]);
  sub_1CF6D8794();
  sub_1CF73F6A8();
  v17 = (void *)objc_opt_self();
  v18 = (void *)sub_1CF73E58C();
  v40 = 0;
  v19 = objc_msgSend(v17, sel_propertyListWithData_options_format_error_, v18, 0, 0, &v40);

  if (!v19)
  {
    v27 = v40;
    sub_1CF73E490();

    goto LABEL_8;
  }
  v20 = v5;
  v21 = v40;
  sub_1CF73F2DC();
  swift_unknownObjectRelease();
  v22 = (uint64_t)v38;
  if ((swift_dynamicCast() & 1) == 0)
  {
    OUTLINED_FUNCTION_166_0(v22, 1);
    v28 = OUTLINED_FUNCTION_68_7();
    v29(v28);
    sub_1CF6ABB3C();
    OUTLINED_FUNCTION_105();
    sub_1CF6AA5E0();
    sub_1CF73F738();
LABEL_8:
    swift_willThrow();
    OUTLINED_FUNCTION_125_2();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v41);
LABEL_10:
    v26 = (uint64_t)v5;
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_166_0(v22, 0);
  OUTLINED_FUNCTION_125_2();
  v23 = v33;
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32);
  v24(v33, v22, v3);
  v25 = v31;
  v24((uint64_t)v31, v23, v3);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v41);
  (*(void (**)(uint64_t, char *, uint64_t))(v32 + 32))(v37, v25, v39);
  v26 = (uint64_t)v20;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0Tm(v26);
  OUTLINED_FUNCTION_0_0();
}

uint64_t type metadata accessor for PropertyListCodable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PropertyListCodable);
}

uint64_t PropertyListCodable.encode(to:)(_QWORD *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9[2];
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1CF73F84C();
  v1 = (void *)objc_opt_self();
  v9[0] = 0;
  v2 = objc_msgSend(v1, sel_dataWithPropertyList_format_options_error_, sub_1CF73F684(), 200, 0, v9);
  swift_unknownObjectRelease();
  v3 = v9[0];
  if (v2)
  {
    v4 = (void *)sub_1CF73E5A4();
    v6 = v5;

    v9[0] = v4;
    v9[1] = v6;
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    sub_1CF6D5DAC();
    sub_1CF73F6C0();
    sub_1CF6933C0((uint64_t)v4, (unint64_t)v6);
  }
  else
  {
    v7 = v3;
    sub_1CF73E490();

    swift_willThrow();
  }
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
}

void sub_1CF7291EC()
{
  PropertyListCodable.init(from:)();
}

uint64_t sub_1CF729204(_QWORD *a1)
{
  return PropertyListCodable.encode(to:)(a1);
}

RemotePairingDevice::PairingData::Kind_optional __swiftcall PairingData.Kind.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  RemotePairingDevice::PairingData::Kind_optional result;

  v2 = v1;
  v3 = sub_1CF73F498();
  OUTLINED_FUNCTION_3_7();
  v4 = 4;
  if (v3 < 4)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_40();
  return result;
}

uint64_t PairingData.Kind.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1CF72929C + 4 * byte_1CF747D3F[*v0]))(0xD000000000000013, 0x80000001CF74F9F0);
}

unint64_t sub_1CF72929C()
{
  return 0xD000000000000012;
}

uint64_t sub_1CF7292B8@<X0>(uint64_t a1@<X8>)
{
  return a1 + 17;
}

void sub_1CF7292E0(char *a1)
{
  sub_1CF6B3BD8(*a1);
}

void sub_1CF7292EC()
{
  sub_1CF6B3DB0();
}

void sub_1CF7292F4(uint64_t a1)
{
  char *v1;

  sub_1CF6B424C(a1, *v1);
}

void sub_1CF7292FC()
{
  sub_1CF6B42DC();
}

RemotePairingDevice::PairingData::Kind_optional sub_1CF729304(Swift::String *a1)
{
  return PairingData.Kind.init(rawValue:)(*a1);
}

uint64_t sub_1CF729310@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PairingData.Kind.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1CF729334()
{
  sub_1CF72CB98();
  return sub_1CF73F018();
}

uint64_t sub_1CF729390()
{
  sub_1CF72CB98();
  return sub_1CF73F000();
}

uint64_t PairingData.startNewSession.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PairingData.startNewSession.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*PairingData.startNewSession.modify())()
{
  return nullsub_1;
}

void PairingData.kind.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 1);
}

_BYTE *PairingData.kind.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = *result;
  return result;
}

uint64_t (*PairingData.kind.modify())()
{
  return nullsub_1;
}

void PairingData.data.getter()
{
  OUTLINED_FUNCTION_21_4();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void PairingData.data.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_121_0();
  sub_1CF6933C0(*(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16));
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PairingData.data.modify())()
{
  return nullsub_1;
}

void PairingData.sendingHost.getter()
{
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void PairingData.sendingHost.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_121_0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v0;
  OUTLINED_FUNCTION_40();
}

uint64_t (*PairingData.sendingHost.modify())()
{
  return nullsub_1;
}

uint64_t PairingData.pairingOptions.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 40);
  return swift_bridgeObjectRetain();
}

uint64_t PairingData.pairingOptions.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = v2;
  return result;
}

uint64_t (*PairingData.pairingOptions.modify())()
{
  return nullsub_1;
}

uint64_t sub_1CF729518(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v2 = a1 == 0x77654E7472617473 && a2 == 0xEF6E6F6973736553;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 1684957547 && a2 == 0xE400000000000000;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 1635017060 && a2 == 0xE400000000000000;
      if (v7 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x48676E69646E6573 && a2 == 0xEB0000000074736FLL;
        if (v8 || (sub_1CF73F690() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else if (a1 == 0x4F676E6972696170 && a2 == 0xEE00736E6F697470)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v10 = sub_1CF73F690();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

uint64_t sub_1CF72976C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CF7297AC + 4 * byte_1CF747D43[a1]))(0x77654E7472617473, 0xEF6E6F6973736553);
}

uint64_t sub_1CF7297AC()
{
  return 1684957547;
}

uint64_t sub_1CF7297BC()
{
  return 1635017060;
}

uint64_t sub_1CF7297CC()
{
  return 0x48676E69646E6573;
}

uint64_t sub_1CF7297EC()
{
  return 0x4F676E6972696170;
}

uint64_t sub_1CF729810()
{
  unsigned __int8 *v0;

  return sub_1CF72976C(*v0);
}

uint64_t sub_1CF729818@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF729518(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF72983C()
{
  sub_1CF729CA8();
  return sub_1CF73F864();
}

uint64_t sub_1CF729864()
{
  sub_1CF729CA8();
  return sub_1CF73F870();
}

void PairingData.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7B60);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_99();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1CF729CA8();
  sub_1CF73F858();
  OUTLINED_FUNCTION_110_2();
  sub_1CF73F5D0();
  if (!v0)
  {
    OUTLINED_FUNCTION_54_9();
    sub_1CF729CE4();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_63_7();
    sub_1CF6D5DAC();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_118_1(3);
    OUTLINED_FUNCTION_110_2();
    sub_1CF73F588();
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_151_1((uint64_t)&unk_1ED8F6EB8);
    OUTLINED_FUNCTION_60_6();
  }
  OUTLINED_FUNCTION_7_11(v1, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_58_7();
  OUTLINED_FUNCTION_0_0();
}

void PairingData.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_2();
  v4 = v3;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7A88);
  OUTLINED_FUNCTION_160_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_100();
  OUTLINED_FUNCTION_55_6(v4);
  sub_1CF729CA8();
  OUTLINED_FUNCTION_81_4();
  if (v0)
  {
    OUTLINED_FUNCTION_112_1();
    OUTLINED_FUNCTION_115_2();
  }
  else
  {
    LOBYTE(v15) = 0;
    OUTLINED_FUNCTION_153_0();
    v8 = sub_1CF73F504();
    OUTLINED_FUNCTION_54_9();
    sub_1CF729D20();
    OUTLINED_FUNCTION_64_9();
    OUTLINED_FUNCTION_63_7();
    sub_1CF6D8794();
    OUTLINED_FUNCTION_64_9();
    v14 = v6;
    v9 = v15;
    LOBYTE(v15) = 3;
    OUTLINED_FUNCTION_36_4();
    OUTLINED_FUNCTION_153_0();
    v10 = sub_1CF73F4BC();
    v12 = v11;
    v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F6EC8);
    sub_1CF72FDDC((uint64_t)&unk_1ED8F6EC0);
    OUTLINED_FUNCTION_124_0();
    OUTLINED_FUNCTION_121_2();
    sub_1CF73F4E0();
    OUTLINED_FUNCTION_1_6(v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_115_2();
    OUTLINED_FUNCTION_36_4();
    OUTLINED_FUNCTION_67_2();
    *(_BYTE *)v14 = v8 & 1;
    *(_BYTE *)(v14 + 1) = 0;
    *(_QWORD *)(v14 + 8) = v9;
    *(_QWORD *)(v14 + 16) = v16;
    *(_QWORD *)(v14 + 24) = v13;
    *(_QWORD *)(v14 + 32) = v12;
    *(_QWORD *)(v14 + 40) = v15;
    OUTLINED_FUNCTION_112_1();
    OUTLINED_FUNCTION_67_2();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF729C80()
{
  PairingData.init(from:)();
}

void sub_1CF729C94()
{
  PairingData.encode(to:)();
}

unint64_t sub_1CF729CA8()
{
  unint64_t result;

  result = qword_1ED8F6C30;
  if (!qword_1ED8F6C30)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748658, &type metadata for PairingData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6C30);
  }
  return result;
}

unint64_t sub_1CF729CE4()
{
  unint64_t result;

  result = qword_1ED8F6C48;
  if (!qword_1ED8F6C48)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PairingData.Kind, &type metadata for PairingData.Kind);
    atomic_store(result, (unint64_t *)&qword_1ED8F6C48);
  }
  return result;
}

unint64_t sub_1CF729D20()
{
  unint64_t result;

  result = qword_1ED8F6C58;
  if (!qword_1ED8F6C58)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PairingData.Kind, &type metadata for PairingData.Kind);
    atomic_store(result, (unint64_t *)&qword_1ED8F6C58);
  }
  return result;
}

unint64_t sub_1CF729D60()
{
  unint64_t result;

  result = qword_1EFBA3AD8;
  if (!qword_1EFBA3AD8)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PairingData.Kind, &type metadata for PairingData.Kind);
    atomic_store(result, (unint64_t *)&qword_1EFBA3AD8);
  }
  return result;
}

uint64_t destroy for ControlChannelMessageEnvelope(uint64_t a1)
{
  return sub_1CF6CA3C4(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_WORD *)(a1 + 144), (uint64_t (*)(void))sub_1CF6933C0, (uint64_t (*)(void))sub_1CF6C9E3C,
           (uint64_t (*)(void))sub_1CF6C8BA8,
           (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
}

uint64_t initializeWithCopy for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a2 + 72);
  v13 = *(_QWORD *)(a2 + 88);
  v14 = *(_QWORD *)(a2 + 96);
  v15 = *(_QWORD *)(a2 + 104);
  v16 = *(_QWORD *)(a2 + 112);
  v17 = *(_QWORD *)(a2 + 120);
  v18 = *(_QWORD *)(a2 + 128);
  v19 = *(_QWORD *)(a2 + 136);
  v20 = *(_WORD *)(a2 + 144);
  v11 = *(_QWORD *)(a2 + 80);
  sub_1CF6CA3C4(v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t (*)(void))sub_1CF6934BC, (uint64_t (*)(void))sub_1CF6CA4D0,
    (uint64_t (*)(void))sub_1CF6CA5A4,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6C9F94);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v10;
  *(_QWORD *)(a1 + 80) = v11;
  *(_QWORD *)(a1 + 88) = v13;
  *(_QWORD *)(a1 + 96) = v14;
  *(_QWORD *)(a1 + 104) = v15;
  *(_QWORD *)(a1 + 112) = v16;
  *(_QWORD *)(a1 + 120) = v17;
  *(_QWORD *)(a1 + 128) = v18;
  *(_QWORD *)(a1 + 136) = v19;
  *(_WORD *)(a1 + 144) = v20;
  return a1;
}

uint64_t assignWithCopy for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int16 v34;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a2 + 72);
  v11 = *(_QWORD *)(a2 + 80);
  v27 = *(_QWORD *)(a2 + 88);
  v28 = *(_QWORD *)(a2 + 96);
  v29 = *(_QWORD *)(a2 + 104);
  v30 = *(_QWORD *)(a2 + 112);
  v31 = *(_QWORD *)(a2 + 120);
  v32 = *(_QWORD *)(a2 + 128);
  v33 = *(_QWORD *)(a2 + 136);
  v34 = *(_WORD *)(a2 + 144);
  sub_1CF6CA3C4(v3, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t (*)(void))sub_1CF6934BC, (uint64_t (*)(void))sub_1CF6CA4D0,
    (uint64_t (*)(void))sub_1CF6CA5A4,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6C9F94);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 72);
  v20 = *(_OWORD *)(a1 + 80);
  v21 = *(_OWORD *)(a1 + 96);
  v22 = *(_OWORD *)(a1 + 112);
  v23 = *(_QWORD *)(a1 + 128);
  v24 = *(_QWORD *)(a1 + 136);
  v25 = *(_WORD *)(a1 + 144);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v10;
  *(_QWORD *)(a1 + 80) = v11;
  *(_QWORD *)(a1 + 88) = v27;
  *(_QWORD *)(a1 + 96) = v28;
  *(_QWORD *)(a1 + 104) = v29;
  *(_QWORD *)(a1 + 112) = v30;
  *(_QWORD *)(a1 + 120) = v31;
  *(_QWORD *)(a1 + 128) = v32;
  *(_QWORD *)(a1 + 136) = v33;
  *(_WORD *)(a1 + 144) = v34;
  sub_1CF6CA3C4(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25, (uint64_t (*)(void))sub_1CF6933C0, (uint64_t (*)(void))sub_1CF6C9E3C,
    (uint64_t (*)(void))sub_1CF6C8BA8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
  return a1;
}

uint64_t assignWithTake for ControlChannelMessageEnvelope(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 136);
  v4 = *(_WORD *)(a2 + 144);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = *(_QWORD *)(a1 + 72);
  v13 = *(_OWORD *)(a1 + 80);
  v14 = *(_OWORD *)(a1 + 96);
  v15 = *(_OWORD *)(a1 + 112);
  v16 = *(_QWORD *)(a1 + 128);
  v17 = *(_QWORD *)(a1 + 136);
  v18 = *(_WORD *)(a1 + 144);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 136) = v3;
  *(_WORD *)(a1 + 144) = v4;
  sub_1CF6CA3C4(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, v17, v18, (uint64_t (*)(void))sub_1CF6933C0, (uint64_t (*)(void))sub_1CF6C9E3C,
    (uint64_t (*)(void))sub_1CF6C8BA8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
  return a1;
}

uint64_t getEnumTagSinglePayload for ControlChannelMessageEnvelope(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && a1[146])
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *a1;
      v4 = v3 >= 2;
      v2 = v3 - 2;
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

uint64_t storeEnumTagSinglePayload for ControlChannelMessageEnvelope(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 144) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 146) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 146) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

void type metadata accessor for ControlChannelMessageEnvelope()
{
  OUTLINED_FUNCTION_31();
}

void type metadata accessor for ControlChannelConnectionIdentifierCategory()
{
  OUTLINED_FUNCTION_31();
}

uint64_t destroy for PeerDeviceInfo(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(a1 + 88);
  if (v3 >> 60 != 15)
    return sub_1CF6933C0(*(_QWORD *)(a1 + 80), v3);
  return result;
}

uint64_t initializeWithCopy for PeerDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  v8 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v8;
  v9 = (uint64_t *)(a2 + 80);
  v10 = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v10 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v9;
  }
  else
  {
    v11 = *v9;
    sub_1CF6934BC(*v9, v10);
    *(_QWORD *)(a1 + 80) = v11;
    *(_QWORD *)(a1 + 88) = v10;
  }
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t assignWithCopy for PeerDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v4;
  v5 = (uint64_t *)(a2 + 80);
  v6 = *(_QWORD *)(a2 + 88);
  if (*(_QWORD *)(a1 + 88) >> 60 != 15)
  {
    if (v6 >> 60 != 15)
    {
      v8 = *v5;
      sub_1CF6934BC(*v5, *(_QWORD *)(a2 + 88));
      v9 = *(_QWORD *)(a1 + 80);
      v10 = *(_QWORD *)(a1 + 88);
      *(_QWORD *)(a1 + 80) = v8;
      *(_QWORD *)(a1 + 88) = v6;
      sub_1CF6933C0(v9, v10);
      goto LABEL_8;
    }
    sub_1CF72A4F8(a1 + 80);
    goto LABEL_6;
  }
  if (v6 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 80) = *(_OWORD *)v5;
    goto LABEL_8;
  }
  v7 = *v5;
  sub_1CF6934BC(*v5, *(_QWORD *)(a2 + 88));
  *(_QWORD *)(a1 + 80) = v7;
  *(_QWORD *)(a1 + 88) = v6;
LABEL_8:
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t sub_1CF72A4F8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0CB0338] - 8) + 8))();
  return a1;
}

void *__swift_memcpy97_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t assignWithTake for PeerDeviceInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v8 = (_QWORD *)(a2 + 80);
  v9 = *(_QWORD *)(a1 + 88);
  if (v9 >> 60 != 15)
  {
    v10 = *(_QWORD *)(a2 + 88);
    if (v10 >> 60 != 15)
    {
      v11 = *(_QWORD *)(a1 + 80);
      *(_QWORD *)(a1 + 80) = *v8;
      *(_QWORD *)(a1 + 88) = v10;
      sub_1CF6933C0(v11, v9);
      goto LABEL_6;
    }
    sub_1CF72A4F8(a1 + 80);
  }
  *(_OWORD *)(a1 + 80) = *(_OWORD *)v8;
LABEL_6:
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeerDeviceInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 97))
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

uint64_t storeEnumTagSinglePayload for PeerDeviceInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 97) = 1;
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
    *(_BYTE *)(result + 97) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for PeerDeviceInfo()
{
  OUTLINED_FUNCTION_31();
}

uint64_t destroy for ListenerStartedResponse(uint64_t a1)
{
  return sub_1CF6933C0(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t _s19RemotePairingDevice23ListenerStartedResponseVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_1CF6934BC(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for ListenerStartedResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_1CF6934BC(v3, v4);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  sub_1CF6933C0(v5, v6);
  return a1;
}

uint64_t assignWithTake for ListenerStartedResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1CF6933C0(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ListenerStartedResponse(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    {
      v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      v2 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for ListenerStartedResponse(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for ListenerStartedResponse()
{
  OUTLINED_FUNCTION_31();
}

uint64_t *initializeBufferWithCopyOfBuffer for StreamEncryptedMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_1CF6934BC(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for StreamEncryptedMessage(uint64_t a1)
{
  return sub_1CF6933C0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *assignWithCopy for StreamEncryptedMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_1CF6934BC(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1CF6933C0(v5, v6);
  return a1;
}

uint64_t *assignWithTake for StreamEncryptedMessage(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1CF6933C0(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for StreamEncryptedMessage(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0xD && *(_BYTE *)(a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 12;
    }
    else
    {
      v2 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
      if (v2 >= 0xC)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for StreamEncryptedMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

void type metadata accessor for StreamEncryptedMessage()
{
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1CF72A99C()
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

uint64_t *sub_1CF72AA08(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

uint64_t sub_1CF72AA78(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_1CF72AA88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_1CF72AAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_1CF72AAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_1CF72AB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_1CF72AB48(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_18;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v8);
      if (!v10)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return __swift_getEnumTagSinglePayload(a1, v6, v4);
      return 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8))
    goto LABEL_18;
LABEL_11:
  v12 = (v10 - 1) << v9;
  if (v8 > 3)
    v12 = 0;
  if (!(_DWORD)v8)
    return (v6 + v12 + 1);
  if (v8 > 3)
    LODWORD(v8) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1CF72ABF8 + 4 * byte_1CF747D54[(v8 - 1)]))();
}

void sub_1CF72AC44(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  v10 = a3 >= v7;
  v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      v14 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else if (v14 >= 0x100)
      {
        v12 = 2;
      }
      else
      {
        v12 = v14 > 1;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0u;
  }
  if (v7 < a2)
  {
    v13 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v15 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

uint64_t destroy for PairingData(uint64_t a1)
{
  sub_1CF6933C0(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PairingData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  *(_WORD *)a1 = *(_WORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  sub_1CF6934BC(v4, v5);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PairingData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  sub_1CF6934BC(v4, v5);
  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  sub_1CF6933C0(v6, v7);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PairingData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1CF6933C0(v4, v5);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PairingData(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 48))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 32);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PairingData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

void type metadata accessor for PairingData()
{
  OUTLINED_FUNCTION_31();
}

void type metadata accessor for PairingData.Kind()
{
  OUTLINED_FUNCTION_31();
}

uint64_t storeEnumTagSinglePayload for PairingData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF72B09C + 4 * byte_1CF747D67[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1CF72B0D0 + 4 * byte_1CF747D62[v4]))();
}

uint64_t sub_1CF72B0D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF72B0D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF72B0E0);
  return result;
}

uint64_t sub_1CF72B0EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF72B0F4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1CF72B0F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF72B100(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PairingData.CodingKeys()
{
  return &type metadata for PairingData.CodingKeys;
}

ValueMetadata *type metadata accessor for StreamEncryptedMessage.CodingKeys()
{
  return &type metadata for StreamEncryptedMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for ListenerStartedResponse.CodingKeys()
{
  return &type metadata for ListenerStartedResponse.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for PeerDeviceInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1CF72B194 + 4 * byte_1CF747D71[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1CF72B1C8 + 4 * byte_1CF747D6C[v4]))();
}

uint64_t sub_1CF72B1C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF72B1D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF72B1D8);
  return result;
}

uint64_t sub_1CF72B1E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF72B1ECLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1CF72B1F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF72B1F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeerDeviceInfo.CodingKeys()
{
  return &type metadata for PeerDeviceInfo.CodingKeys;
}

uint64_t sub_1CF72B214(uint64_t a1)
{
  return sub_1CF6CA3C4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_WORD *)(a1 + 128), (uint64_t (*)(void))sub_1CF6933C0, (uint64_t (*)(void))sub_1CF6C9E3C,
           (uint64_t (*)(void))sub_1CF6C8BA8,
           (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
}

uint64_t sub_1CF72B28C(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a2 + 112);
  v19 = *(_QWORD *)(a2 + 120);
  v20 = *(_WORD *)(a2 + 128);
  v11 = *(_QWORD *)(a2 + 64);
  sub_1CF6CA3C4(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t (*)(void))sub_1CF6934BC, (uint64_t (*)(void))sub_1CF6CA4D0,
    (uint64_t (*)(void))sub_1CF6CA5A4,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6C9F94);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_QWORD *)(a1 + 120) = v19;
  *(_WORD *)(a1 + 128) = v20;
  return a1;
}

uint64_t sub_1CF72B3B4(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int16 v34;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v27 = *(_QWORD *)(a2 + 72);
  v28 = *(_QWORD *)(a2 + 80);
  v29 = *(_QWORD *)(a2 + 88);
  v30 = *(_QWORD *)(a2 + 96);
  v31 = *(_QWORD *)(a2 + 104);
  v32 = *(_QWORD *)(a2 + 112);
  v33 = *(_QWORD *)(a2 + 120);
  v34 = *(_WORD *)(a2 + 128);
  sub_1CF6CA3C4(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t (*)(void))sub_1CF6934BC, (uint64_t (*)(void))sub_1CF6CA4D0,
    (uint64_t (*)(void))sub_1CF6CA5A4,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6C9F94);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_OWORD *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 96);
  v23 = *(_QWORD *)(a1 + 112);
  v24 = *(_QWORD *)(a1 + 120);
  v25 = *(_WORD *)(a1 + 128);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v27;
  *(_QWORD *)(a1 + 80) = v28;
  *(_QWORD *)(a1 + 88) = v29;
  *(_QWORD *)(a1 + 96) = v30;
  *(_QWORD *)(a1 + 104) = v31;
  *(_QWORD *)(a1 + 112) = v32;
  *(_QWORD *)(a1 + 120) = v33;
  *(_WORD *)(a1 + 128) = v34;
  sub_1CF6CA3C4(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25, (uint64_t (*)(void))sub_1CF6933C0, (uint64_t (*)(void))sub_1CF6C9E3C,
    (uint64_t (*)(void))sub_1CF6C8BA8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
  return a1;
}

void *__swift_memcpy130_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x82uLL);
}

uint64_t sub_1CF72B548(uint64_t a1, uint64_t a2)
{
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v3 = *(_WORD *)(a2 + 128);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 80);
  v14 = *(_OWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 112);
  v16 = *(_QWORD *)(a1 + 120);
  v17 = *(_WORD *)(a1 + 128);
  v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(_WORD *)(a1 + 128) = v3;
  sub_1CF6CA3C4(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, v16, v17, (uint64_t (*)(void))sub_1CF6933C0, (uint64_t (*)(void))sub_1CF6C9E3C,
    (uint64_t (*)(void))sub_1CF6C8BA8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
  return a1;
}

uint64_t sub_1CF72B5FC(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 7 && *(_BYTE *)(a1 + 130))
    {
      v2 = *(_DWORD *)a1 + 6;
    }
    else
    {
      v2 = ((*(unsigned __int16 *)(a1 + 128) >> 10) & 6 | (*(unsigned __int16 *)(a1 + 128) >> 13) & 1) ^ 7;
      if (v2 >= 6)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1CF72B648(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 6)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 128) = 0;
    *(_QWORD *)result = a2 - 7;
    if (a3 >= 7)
      *(_BYTE *)(result + 130) = 1;
  }
  else
  {
    if (a3 >= 7)
      *(_BYTE *)(result + 130) = 0;
    if (a2)
    {
      *(_OWORD *)(result + 96) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 80) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_WORD *)(result + 128) = ((((-a2 >> 1) & 3) - 4 * (_BYTE)a2) & 7) << 11;
    }
  }
  return result;
}

uint64_t sub_1CF72B6D0(uint64_t result, char a2)
{
  *(_WORD *)(result + 128) = *(_WORD *)(result + 128) & 0xC7FF | ((a2 & 1) << 13);
  return result;
}

void type metadata accessor for ControlChannelMessageEnvelope.Message()
{
  OUTLINED_FUNCTION_31();
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.CodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.CodingKeys;
}

uint64_t sub_1CF72B70C(uint64_t a1)
{
  return sub_1CF6CA43C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_WORD *)(a1 + 128), (uint64_t (*)(void))sub_1CF6C9E3C, (uint64_t (*)(void))sub_1CF6C8BA8,
           (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
}

uint64_t sub_1CF72B77C(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 v20;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a2 + 112);
  v19 = *(_QWORD *)(a2 + 120);
  v20 = *(_WORD *)(a2 + 128);
  v11 = *(_QWORD *)(a2 + 64);
  sub_1CF6CA43C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20, (uint64_t (*)(void))sub_1CF6CA4D0, (uint64_t (*)(void))sub_1CF6CA5A4,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6C9F94);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_QWORD *)(a1 + 120) = v19;
  *(_WORD *)(a1 + 128) = v20;
  return a1;
}

uint64_t sub_1CF72B89C(uint64_t a1, uint64_t a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int16 v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int16 v34;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v27 = *(_QWORD *)(a2 + 72);
  v28 = *(_QWORD *)(a2 + 80);
  v29 = *(_QWORD *)(a2 + 88);
  v30 = *(_QWORD *)(a2 + 96);
  v31 = *(_QWORD *)(a2 + 104);
  v32 = *(_QWORD *)(a2 + 112);
  v33 = *(_QWORD *)(a2 + 120);
  v34 = *(_WORD *)(a2 + 128);
  sub_1CF6CA43C(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v31, v32, v33, v34, (uint64_t (*)(void))sub_1CF6CA4D0, (uint64_t (*)(void))sub_1CF6CA5A4,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6C9F94);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_OWORD *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 96);
  v23 = *(_QWORD *)(a1 + 112);
  v24 = *(_QWORD *)(a1 + 120);
  v25 = *(_WORD *)(a1 + 128);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v27;
  *(_QWORD *)(a1 + 80) = v28;
  *(_QWORD *)(a1 + 88) = v29;
  *(_QWORD *)(a1 + 96) = v30;
  *(_QWORD *)(a1 + 104) = v31;
  *(_QWORD *)(a1 + 112) = v32;
  *(_QWORD *)(a1 + 120) = v33;
  *(_WORD *)(a1 + 128) = v34;
  sub_1CF6CA43C(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, v25, (uint64_t (*)(void))sub_1CF6C9E3C, (uint64_t (*)(void))sub_1CF6C8BA8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
  return a1;
}

uint64_t sub_1CF72BA18(uint64_t a1, uint64_t a2)
{
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v3 = *(_WORD *)(a2 + 128);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = *(_OWORD *)(a1 + 80);
  v14 = *(_OWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 112);
  v16 = *(_QWORD *)(a1 + 120);
  v17 = *(_WORD *)(a1 + 128);
  v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  v21 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v21;
  *(_WORD *)(a1 + 128) = v3;
  sub_1CF6CA43C(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, v16, v17, (uint64_t (*)(void))sub_1CF6C9E3C, (uint64_t (*)(void))sub_1CF6C8BA8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
  return a1;
}

uint64_t sub_1CF72BAC4(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x1E && *(_BYTE *)(a1 + 130))
    {
      v2 = *(_DWORD *)a1 + 29;
    }
    else
    {
      v2 = ((*(unsigned __int16 *)(a1 + 128) >> 9) & 0x1C | (*(unsigned __int16 *)(a1 + 128) >> 14)) ^ 0x1F;
      if (v2 >= 0x1D)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1CF72BB10(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1D)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 128) = 0;
    *(_QWORD *)result = a2 - 30;
    if (a3 >= 0x1E)
      *(_BYTE *)(result + 130) = 1;
  }
  else
  {
    if (a3 >= 0x1E)
      *(_BYTE *)(result + 130) = 0;
    if (a2)
    {
      *(_OWORD *)(result + 96) = 0u;
      *(_OWORD *)(result + 112) = 0u;
      *(_OWORD *)(result + 64) = 0u;
      *(_OWORD *)(result + 80) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)(result + 48) = 0u;
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_WORD *)(result + 128) = (((-a2 >> 2) & 7) - 8 * (_WORD)a2) << 11;
    }
  }
  return result;
}

uint64_t sub_1CF72BB98(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 128) = *(_WORD *)(result + 128) & 0x7FF | (a2 << 14);
  return result;
}

void type metadata accessor for ControlChannelMessage()
{
  OUTLINED_FUNCTION_31();
}

void sub_1CF72BBB8(uint64_t a1)
{
  sub_1CF6CA1A0(*(void **)a1, *(void **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
}

uint64_t sub_1CF72BC08(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  v18 = *(_QWORD *)(a2 + 112);
  v19 = *(_BYTE *)(a2 + 120);
  v20 = *(_BYTE *)(a2 + 121);
  sub_1CF6C9F94(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19, v20);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = v16;
  *(_QWORD *)(a1 + 104) = v17;
  *(_QWORD *)(a1 + 112) = v18;
  *(_BYTE *)(a1 + 120) = v19;
  *(_BYTE *)(a1 + 121) = v20;
  return a1;
}

uint64_t sub_1CF72BD18(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  __int16 v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v26 = *(_QWORD *)(a2 + 72);
  v27 = *(_QWORD *)(a2 + 80);
  v28 = *(_QWORD *)(a2 + 88);
  v29 = *(_QWORD *)(a2 + 96);
  v30 = *(_QWORD *)(a2 + 104);
  v31 = *(_QWORD *)(a2 + 112);
  v32 = *(_BYTE *)(a2 + 120);
  v33 = *(_BYTE *)(a2 + 121);
  sub_1CF6C9F94(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27, v28, v29, v30, v31, v32, v33);
  v12 = *(void **)a1;
  v13 = *(void **)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_OWORD *)(a1 + 80);
  v22 = *(_OWORD *)(a1 + 96);
  v23 = *(_QWORD *)(a1 + 112);
  v24 = *(_WORD *)(a1 + 120);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v26;
  *(_QWORD *)(a1 + 80) = v27;
  *(_QWORD *)(a1 + 88) = v28;
  *(_QWORD *)(a1 + 96) = v29;
  *(_QWORD *)(a1 + 104) = v30;
  *(_QWORD *)(a1 + 112) = v31;
  *(_BYTE *)(a1 + 120) = v32;
  *(_BYTE *)(a1 + 121) = v33;
  sub_1CF6CA1A0(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, v24, SHIBYTE(v24));
  return a1;
}

void *__swift_memcpy122_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x7AuLL);
}

uint64_t sub_1CF72BE64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int16 v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16;
  __int16 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v3 = *(_QWORD *)(a2 + 112);
  v4 = *(_WORD *)(a2 + 120);
  v5 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = *(_OWORD *)(a1 + 80);
  v15 = *(_OWORD *)(a1 + 96);
  v16 = *(_QWORD *)(a1 + 112);
  v17 = *(_WORD *)(a1 + 120);
  v18 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v18;
  v19 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v19;
  v20 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v20;
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 112) = v3;
  *(_WORD *)(a1 + 120) = v4;
  sub_1CF6CA1A0(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, *((uint64_t *)&v14 + 1), v15, *((uint64_t *)&v15 + 1), v16, v17, SHIBYTE(v17));
  return a1;
}

uint64_t sub_1CF72BEF8(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFA && *(_BYTE *)(a1 + 122))
    {
      v2 = *(_DWORD *)a1 + 249;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 121);
      if (v3 <= 6)
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

uint64_t sub_1CF72BF38(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 120) = 0;
    *(_QWORD *)result = a2 - 250;
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 122) = 1;
  }
  else
  {
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 122) = 0;
    if (a2)
      *(_BYTE *)(result + 121) = -(char)a2;
  }
  return result;
}

uint64_t sub_1CF72BF9C(uint64_t result, unsigned int a2)
{
  if (a2 >= 6)
  {
    *(_QWORD *)result = a2 - 6;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    LOBYTE(a2) = 6;
    *(_BYTE *)(result + 120) = 0;
  }
  *(_BYTE *)(result + 121) = a2;
  return result;
}

void type metadata accessor for ControlChannelMessage.Response()
{
  OUTLINED_FUNCTION_31();
}

unint64_t sub_1CF72BFE8()
{
  unint64_t result;

  result = qword_1EFBA3AE0;
  if (!qword_1EFBA3AE0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748350, &type metadata for ControlChannelMessageEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3AE0);
  }
  return result;
}

unint64_t sub_1CF72C028()
{
  unint64_t result;

  result = qword_1EFBA3AE8;
  if (!qword_1EFBA3AE8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748408, &type metadata for PeerDeviceInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3AE8);
  }
  return result;
}

unint64_t sub_1CF72C068()
{
  unint64_t result;

  result = qword_1EFBA3AF0;
  if (!qword_1EFBA3AF0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7484C0, &type metadata for ListenerStartedResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3AF0);
  }
  return result;
}

unint64_t sub_1CF72C0A8()
{
  unint64_t result;

  result = qword_1EFBA3AF8;
  if (!qword_1EFBA3AF8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748578, &type metadata for StreamEncryptedMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3AF8);
  }
  return result;
}

unint64_t sub_1CF72C0E8()
{
  unint64_t result;

  result = qword_1EFBA3B00;
  if (!qword_1EFBA3B00)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748630, &type metadata for PairingData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B00);
  }
  return result;
}

unint64_t sub_1CF72C128()
{
  unint64_t result;

  result = qword_1ED8F6C40;
  if (!qword_1ED8F6C40)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7485A0, &type metadata for PairingData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6C40);
  }
  return result;
}

unint64_t sub_1CF72C168()
{
  unint64_t result;

  result = qword_1ED8F6C38;
  if (!qword_1ED8F6C38)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7485C8, &type metadata for PairingData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6C38);
  }
  return result;
}

unint64_t sub_1CF72C1A8()
{
  unint64_t result;

  result = qword_1EFBA3B08;
  if (!qword_1EFBA3B08)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7484E8, &type metadata for StreamEncryptedMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B08);
  }
  return result;
}

unint64_t sub_1CF72C1E8()
{
  unint64_t result;

  result = qword_1EFBA3B10;
  if (!qword_1EFBA3B10)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748510, &type metadata for StreamEncryptedMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B10);
  }
  return result;
}

unint64_t sub_1CF72C228()
{
  unint64_t result;

  result = qword_1EFBA3B18;
  if (!qword_1EFBA3B18)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748430, &type metadata for ListenerStartedResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B18);
  }
  return result;
}

unint64_t sub_1CF72C268()
{
  unint64_t result;

  result = qword_1EFBA3B20;
  if (!qword_1EFBA3B20)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748458, &type metadata for ListenerStartedResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B20);
  }
  return result;
}

unint64_t sub_1CF72C2A8()
{
  unint64_t result;

  result = qword_1ED8F6AD0;
  if (!qword_1ED8F6AD0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748378, &type metadata for PeerDeviceInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6AD0);
  }
  return result;
}

unint64_t sub_1CF72C2E8()
{
  unint64_t result;

  result = qword_1ED8F6AC8;
  if (!qword_1ED8F6AC8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7483A0, &type metadata for PeerDeviceInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6AC8);
  }
  return result;
}

unint64_t sub_1CF72C328()
{
  unint64_t result;

  result = qword_1ED8F7848;
  if (!qword_1ED8F7848)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7482C0, &type metadata for ControlChannelMessageEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7848);
  }
  return result;
}

unint64_t sub_1CF72C368()
{
  unint64_t result;

  result = qword_1ED8F7840;
  if (!qword_1ED8F7840)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7482E8, &type metadata for ControlChannelMessageEnvelope.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7840);
  }
  return result;
}

unint64_t sub_1CF72C3A4()
{
  unint64_t result;

  result = qword_1ED8F77E8;
  if (!qword_1ED8F77E8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749A24, &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F77E8);
  }
  return result;
}

unint64_t sub_1CF72C3E0()
{
  unint64_t result;

  result = qword_1ED8F7800;
  if (!qword_1ED8F7800)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7499D4, &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7800);
  }
  return result;
}

uint64_t sub_1CF72C41C(uint64_t a1)
{
  sub_1CF6CA3C4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_WORD *)(a1 + 128), (uint64_t (*)(void))sub_1CF6933C0, (uint64_t (*)(void))sub_1CF6C9E3C,
    (uint64_t (*)(void))sub_1CF6C8BA8,
    (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6CA1A0);
  return a1;
}

unint64_t sub_1CF72C4A4()
{
  unint64_t result;

  result = qword_1EFBA3B28;
  if (!qword_1EFBA3B28)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749984, &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B28);
  }
  return result;
}

unint64_t sub_1CF72C4E0()
{
  unint64_t result;

  result = qword_1ED8F6ED0;
  if (!qword_1ED8F6ED0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749934, &type metadata for ControlChannelMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6ED0);
  }
  return result;
}

unint64_t sub_1CF72C51C()
{
  unint64_t result;

  result = qword_1ED8F6F18;
  if (!qword_1ED8F6F18)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7498E4, &type metadata for ControlChannelMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F18);
  }
  return result;
}

unint64_t sub_1CF72C558()
{
  unint64_t result;

  result = qword_1EFBA3B30;
  if (!qword_1EFBA3B30)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748248, &unk_1E8CA21C0);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B30);
  }
  return result;
}

unint64_t sub_1CF72C594()
{
  unint64_t result;

  result = qword_1ED8F6F00;
  if (!qword_1ED8F6F00)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749894, &type metadata for ControlChannelMessage.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F00);
  }
  return result;
}

unint64_t sub_1CF72C5D0()
{
  unint64_t result;

  result = qword_1ED8F7050;
  if (!qword_1ED8F7050)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74986C, &unk_1E8CA2A70);
    atomic_store(result, (unint64_t *)&qword_1ED8F7050);
  }
  return result;
}

unint64_t sub_1CF72C60C()
{
  unint64_t result;

  result = qword_1ED8F6EE8;
  if (!qword_1ED8F6EE8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74981C, &type metadata for ControlChannelMessage.EventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6EE8);
  }
  return result;
}

unint64_t sub_1CF72C648()
{
  unint64_t result;

  result = qword_1ED8F6FC8;
  if (!qword_1ED8F6FC8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7497F4, &unk_1E8CA2B00);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FC8);
  }
  return result;
}

uint64_t sub_1CF72C684(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t (*v4)(void);
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = OUTLINED_FUNCTION_156_1(a1);
  sub_1CF6CA43C(v2, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120), *(_WORD *)(v1 + 128), v3, v4,
    v5);
  return v1;
}

unint64_t sub_1CF72C6F4()
{
  unint64_t result;

  result = qword_1ED8F70F8;
  if (!qword_1ED8F70F8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748220, &unk_1E8CA21C0);
    atomic_store(result, (unint64_t *)&qword_1ED8F70F8);
  }
  return result;
}

unint64_t sub_1CF72C730()
{
  unint64_t result;

  result = qword_1EFBA3B38;
  if (!qword_1EFBA3B38)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7497CC, &unk_1E8CA2A70);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B38);
  }
  return result;
}

unint64_t sub_1CF72C76C()
{
  unint64_t result;

  result = qword_1ED8F6FC0;
  if (!qword_1ED8F6FC0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7497A4, &unk_1E8CA2B00);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FC0);
  }
  return result;
}

unint64_t sub_1CF72C7A8()
{
  unint64_t result;

  result = qword_1ED8F7078;
  if (!qword_1ED8F7078)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749754, &type metadata for ControlChannelMessage.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7078);
  }
  return result;
}

unint64_t sub_1CF72C7E4()
{
  unint64_t result;

  result = qword_1EFBA3B88;
  if (!qword_1EFBA3B88)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749704, &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B88);
  }
  return result;
}

uint64_t sub_1CF72C820(uint64_t result)
{
  *(_BYTE *)(result + 121) = 5;
  return result;
}

unint64_t sub_1CF72C82C()
{
  unint64_t result;

  result = qword_1EFBA3B90;
  if (!qword_1EFBA3B90)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7496B4, &type metadata for ControlChannelMessage.Response.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B90);
  }
  return result;
}

unint64_t sub_1CF72C868()
{
  unint64_t result;

  result = qword_1EFBA3B98;
  if (!qword_1EFBA3B98)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749664, &type metadata for ControlChannelMessage.Response.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3B98);
  }
  return result;
}

unint64_t sub_1CF72C8A4()
{
  unint64_t result;

  result = qword_1EFBA3BA0;
  if (!qword_1EFBA3BA0)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for ControlChannelConnectionError, &type metadata for ControlChannelConnectionError);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BA0);
  }
  return result;
}

unint64_t sub_1CF72C8E0()
{
  unint64_t result;

  result = qword_1EFBA3BA8;
  if (!qword_1EFBA3BA8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749614, &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BA8);
  }
  return result;
}

unint64_t sub_1CF72C91C()
{
  unint64_t result;

  result = qword_1EFBA3BB0;
  if (!qword_1EFBA3BB0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7495C4, &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BB0);
  }
  return result;
}

unint64_t sub_1CF72C958()
{
  unint64_t result;

  result = qword_1EFBA3BB8;
  if (!qword_1EFBA3BB8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749574, &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BB8);
  }
  return result;
}

unint64_t sub_1CF72C994()
{
  unint64_t result;

  result = qword_1EFBA3BC0;
  if (!qword_1EFBA3BC0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749524, &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BC0);
  }
  return result;
}

unint64_t sub_1CF72C9D0()
{
  unint64_t result;

  result = qword_1EFBA3BC8;
  if (!qword_1EFBA3BC8)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PeerDeviceInfo, &type metadata for PeerDeviceInfo);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BC8);
  }
  return result;
}

unint64_t sub_1CF72CA0C()
{
  unint64_t result;

  result = qword_1ED8F70C0;
  if (!qword_1ED8F70C0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7494D4, &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70C0);
  }
  return result;
}

unint64_t sub_1CF72CA48()
{
  unint64_t result;

  result = qword_1EFBA3BD0;
  if (!qword_1EFBA3BD0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7494AC, &unk_1E8CA2B78);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BD0);
  }
  return result;
}

uint64_t sub_1CF72CA84(uint64_t a1)
{
  sub_1CF6CA1A0(*(void **)a1, *(void **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_WORD *)(a1 + 120), HIBYTE(*(_WORD *)(a1 + 120)));
  return a1;
}

unint64_t sub_1CF72CAE4()
{
  unint64_t result;

  result = qword_1EFBA3BD8;
  if (!qword_1EFBA3BD8)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for ControlChannelConnectionError, &type metadata for ControlChannelConnectionError);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BD8);
  }
  return result;
}

unint64_t sub_1CF72CB20()
{
  unint64_t result;

  result = qword_1ED8F6AD8;
  if (!qword_1ED8F6AD8)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PeerDeviceInfo, &type metadata for PeerDeviceInfo);
    atomic_store(result, (unint64_t *)&qword_1ED8F6AD8);
  }
  return result;
}

unint64_t sub_1CF72CB5C()
{
  unint64_t result;

  result = qword_1ED8F6DB0;
  if (!qword_1ED8F6DB0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749484, &unk_1E8CA2B78);
    atomic_store(result, (unint64_t *)&qword_1ED8F6DB0);
  }
  return result;
}

unint64_t sub_1CF72CB98()
{
  unint64_t result;

  result = qword_1ED8F6C50;
  if (!qword_1ED8F6C50)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PairingData.Kind, &type metadata for PairingData.Kind);
    atomic_store(result, (unint64_t *)&qword_1ED8F6C50);
  }
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.HandshakeCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.PeerInfoCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CreateListenerCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.RemoteUnlockCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.ErrorCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.ErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.SuccessCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Response.ErrorExtendedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.CodingKeys()
{
  return &type metadata for ControlChannelMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.EventCodingKeys()
{
  return &type metadata for ControlChannelMessage.EventCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.RequestCodingKeys()
{
  return &type metadata for ControlChannelMessage.RequestCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.ResponseCodingKeys()
{
  return &type metadata for ControlChannelMessage.ResponseCodingKeys;
}

uint64_t _s19RemotePairingDevice23ListenerStartedResponseV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_106_2(-1);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 2);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 2);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 2);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_106_2(v8);
}

uint64_t _s19RemotePairingDevice23ListenerStartedResponseV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF72CD7C + 4 * byte_1CF747D7B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_104_1 + 4 * byte_1CF747D76[v4]))();
}

uint64_t sub_1CF72CDB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF72CDBCLL);
  return result;
}

uint64_t sub_1CF72CDC4(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF72CDCCLL);
  return OUTLINED_FUNCTION_103_1();
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.CodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessageEnvelope.Message.PlainCodingKeys()
{
  return &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys;
}

void *sub_1CF72CE0C(uint64_t a1)
{
  return sub_1CF6C8BA8(*(void **)a1, *(_QWORD *)(a1 + 8));
}

_QWORD *sub_1CF72CE1C(_QWORD *a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  sub_1CF6CA5A4(*(id *)a2, v4);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return a1;
}

uint64_t sub_1CF72CE70(uint64_t a1, uint64_t a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  sub_1CF6CA5A4(*(id *)a2, v4);
  v7 = *(void **)a1;
  v8 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  sub_1CF6C8BA8(v7, v8);
  return a1;
}

uint64_t sub_1CF72CED0(uint64_t a1, _OWORD *a2)
{
  void *v3;
  unint64_t v4;
  __int128 v5;

  v3 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v5;
  sub_1CF6C8BA8(v3, v4);
  return a1;
}

uint64_t sub_1CF72CF0C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1CF72CF2C(uint64_t result, int a2, int a3)
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

uint64_t sub_1CF72CF58(uint64_t a1)
{
  if (((*(_QWORD *)(a1 + 8) >> 60) & 3) == 3)
    return (*(_DWORD *)a1 + 3);
  else
    return (*(_QWORD *)(a1 + 8) >> 60) & 3;
}

uint64_t sub_1CF72CF74(uint64_t result)
{
  *(_QWORD *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

_QWORD *sub_1CF72CF84(_QWORD *result, uint64_t a2)
{
  if (a2 < 3)
  {
    result[1] = result[1] & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }
  else
  {
    *result = (a2 - 3);
    result[1] = 0x3000000000000000;
    result[2] = 0;
    result[3] = 0;
  }
  return result;
}

void type metadata accessor for ControlChannelMessage.Request()
{
  OUTLINED_FUNCTION_31();
}

void sub_1CF72CFBC(uint64_t a1)
{
  sub_1CF6C9E3C(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

uint64_t sub_1CF72D004(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_QWORD *)(a2 + 88);
  v16 = *(_BYTE *)(a2 + 96);
  sub_1CF6CA4D0(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_BYTE *)(a1 + 96) = v16;
  return a1;
}

uint64_t sub_1CF72D0D0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_QWORD *)(a2 + 80);
  v26 = *(_QWORD *)(a2 + 88);
  v27 = *(_BYTE *)(a2 + 96);
  sub_1CF6CA4D0(*(id *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 80);
  v22 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_QWORD *)(a1 + 80) = v25;
  *(_QWORD *)(a1 + 88) = v26;
  *(_BYTE *)(a1 + 96) = v27;
  sub_1CF6C9E3C(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((unint64_t *)&v20 + 1), v21, v22);
  return a1;
}

uint64_t sub_1CF72D1CC(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v3 = *(_BYTE *)(a2 + 96);
  v4 = *(void **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_OWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 88);
  v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  v17 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v17;
  *(_BYTE *)(a1 + 96) = v3;
  sub_1CF6C9E3C(v4, v6, v5, v7, v8, v9, v10, v11, v12, *((unint64_t *)&v12 + 1), v13, v14);
  return a1;
}

uint64_t sub_1CF72D248(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 97))
    {
      v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 72) >> 1;
      if (v2 > 0x80000000)
        v3 = ~(_DWORD)v2;
      else
        v3 = -1;
    }
  }
  else
  {
    v3 = -1;
  }
  return (v3 + 1);
}

double sub_1CF72D290(uint64_t a1, int a2, int a3)
{
  double result;

  if (a2 < 0)
  {
    *(_QWORD *)(a1 + 88) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 56) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_BYTE *)(a1 + 96) = 0;
    *(_QWORD *)a1 = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(a1 + 97) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      result = 0.0;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      *(_OWORD *)a1 = 0u;
      *(_OWORD *)(a1 + 16) = 0u;
      *(_QWORD *)(a1 + 64) = 0;
      *(_QWORD *)(a1 + 72) = 2 * -a2;
      *(_QWORD *)(a1 + 80) = 0;
      *(_QWORD *)(a1 + 88) = 0;
      *(_BYTE *)(a1 + 96) = 0;
      return result;
    }
    *(_BYTE *)(a1 + 97) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_1CF72D304(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 72) >> 62;
  if ((_DWORD)v1 == 3)
    return (*(_DWORD *)a1 + 3);
  else
    return v1;
}

uint64_t sub_1CF72D320(uint64_t result)
{
  *(_QWORD *)(result + 72) &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_1CF72D330(uint64_t result, uint64_t a2)
{
  if (a2 < 3)
  {
    *(_QWORD *)(result + 72) = *(_QWORD *)(result + 72) & 1 | (a2 << 62);
  }
  else
  {
    *(_QWORD *)result = (a2 - 3);
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)(result + 80) = 0;
    *(_QWORD *)(result + 88) = 0;
    *(_QWORD *)(result + 72) = 0xC000000000000000;
    *(_BYTE *)(result + 96) = 0;
  }
  return result;
}

void type metadata accessor for ControlChannelMessage.Event()
{
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1CF72D384(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;

  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v3 = *(_QWORD *)(a1 + 112);
    if (v3 >> 60 != 15)
      return sub_1CF6933C0(*(_QWORD *)(a1 + 104), v3);
  }
  return result;
}

uint64_t sub_1CF72D3F8(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;

  v4 = *(void **)a2;
  v5 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v6 = *(_QWORD *)(a2 + 48);
  v7 = v4;
  v8 = v5;
  if (v6)
  {
    v9 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = v6;
    v10 = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = v10;
    v11 = *(_QWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = v11;
    *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
    *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
    v12 = (uint64_t *)(a2 + 104);
    v13 = *(_QWORD *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 104) = *(_OWORD *)v12;
    }
    else
    {
      v14 = *v12;
      sub_1CF6934BC(*v12, v13);
      *(_QWORD *)(a1 + 104) = v14;
      *(_QWORD *)(a1 + 112) = v13;
    }
    *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  }
  else
  {
    memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  }
  return a1;
}

uint64_t sub_1CF72D4FC(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_BYTE *)(a1 + 19) = *(_BYTE *)(a2 + 19);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  v10 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(a1 + 48))
  {
    if (v10)
    {
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
      *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v11 = *(_QWORD *)(a2 + 88);
      *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
      *(_QWORD *)(a1 + 88) = v11;
      v12 = (uint64_t *)(a2 + 104);
      v13 = *(_QWORD *)(a2 + 112);
      if (*(_QWORD *)(a1 + 112) >> 60 == 15)
      {
        if (v13 >> 60 != 15)
        {
          v14 = *v12;
LABEL_15:
          sub_1CF6934BC(v14, v13);
          *(_QWORD *)(a1 + 104) = v14;
          *(_QWORD *)(a1 + 112) = v13;
          goto LABEL_17;
        }
      }
      else
      {
        if (v13 >> 60 != 15)
        {
          v17 = *v12;
          sub_1CF6934BC(*v12, *(_QWORD *)(a2 + 112));
          v18 = *(_QWORD *)(a1 + 104);
          v19 = *(_QWORD *)(a1 + 112);
          *(_QWORD *)(a1 + 104) = v17;
          *(_QWORD *)(a1 + 112) = v13;
          sub_1CF6933C0(v18, v19);
          goto LABEL_17;
        }
        sub_1CF72A4F8(a1 + 104);
      }
      *(_OWORD *)(a1 + 104) = *(_OWORD *)v12;
      goto LABEL_17;
    }
    sub_1CF72D76C(a1 + 24);
  }
  else if (v10)
  {
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
    *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
    v15 = *(_QWORD *)(a2 + 88);
    *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
    *(_QWORD *)(a1 + 88) = v15;
    v16 = (uint64_t *)(a2 + 104);
    v13 = *(_QWORD *)(a2 + 112);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13 >> 60 != 15)
    {
      v14 = *v16;
      goto LABEL_15;
    }
    *(_OWORD *)(a1 + 104) = *(_OWORD *)v16;
LABEL_17:
    *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
    return a1;
  }
  memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  return a1;
}

uint64_t sub_1CF72D76C(uint64_t a1)
{
  destroy for PeerDeviceInfo(a1);
  return a1;
}

void *__swift_memcpy121_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x79uLL);
}

uint64_t sub_1CF72D7A0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  *(_WORD *)(a1 + 19) = *(_WORD *)(a2 + 19);
  if (*(_QWORD *)(a1 + 48))
  {
    v6 = *(_QWORD *)(a2 + 48);
    if (v6)
    {
      v7 = *(_QWORD *)(a2 + 32);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = v7;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 48) = v6;
      swift_bridgeObjectRelease();
      v8 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 64) = v8;
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(a2 + 80);
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
      *(_QWORD *)(a1 + 80) = v9;
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
      *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
      v10 = (_QWORD *)(a2 + 104);
      v11 = *(_QWORD *)(a1 + 112);
      if (v11 >> 60 != 15)
      {
        v12 = *(_QWORD *)(a2 + 112);
        if (v12 >> 60 != 15)
        {
          v13 = *(_QWORD *)(a1 + 104);
          *(_QWORD *)(a1 + 104) = *v10;
          *(_QWORD *)(a1 + 112) = v12;
          sub_1CF6933C0(v13, v11);
          goto LABEL_10;
        }
        sub_1CF72A4F8(a1 + 104);
      }
      *(_OWORD *)(a1 + 104) = *(_OWORD *)v10;
LABEL_10:
      *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
      return a1;
    }
    sub_1CF72D76C(a1 + 24);
  }
  memcpy((void *)(a1 + 24), (const void *)(a2 + 24), 0x61uLL);
  return a1;
}

uint64_t sub_1CF72D8EC(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 121))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1CF72D92C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 120) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 121) = 1;
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
    *(_BYTE *)(result + 121) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for HandshakeResponse()
{
  OUTLINED_FUNCTION_31();
}

unint64_t sub_1CF72D99C()
{
  unint64_t result;

  result = qword_1EFBA3BE0;
  if (!qword_1EFBA3BE0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748A64, &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BE0);
  }
  return result;
}

unint64_t sub_1CF72D9DC()
{
  unint64_t result;

  result = qword_1EFBA3BE8;
  if (!qword_1EFBA3BE8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748B1C, &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BE8);
  }
  return result;
}

unint64_t sub_1CF72DA1C()
{
  unint64_t result;

  result = qword_1EFBA3BF0;
  if (!qword_1EFBA3BF0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748BD4, &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BF0);
  }
  return result;
}

unint64_t sub_1CF72DA5C()
{
  unint64_t result;

  result = qword_1EFBA3BF8;
  if (!qword_1EFBA3BF8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748C8C, &type metadata for ControlChannelMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3BF8);
  }
  return result;
}

unint64_t sub_1CF72DA9C()
{
  unint64_t result;

  result = qword_1EFBA3C00;
  if (!qword_1EFBA3C00)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748D44, &type metadata for ControlChannelMessage.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C00);
  }
  return result;
}

unint64_t sub_1CF72DADC()
{
  unint64_t result;

  result = qword_1EFBA3C08;
  if (!qword_1EFBA3C08)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748DFC, &type metadata for ControlChannelMessage.EventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C08);
  }
  return result;
}

unint64_t sub_1CF72DB1C()
{
  unint64_t result;

  result = qword_1EFBA3C10;
  if (!qword_1EFBA3C10)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748EB4, &type metadata for ControlChannelMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C10);
  }
  return result;
}

unint64_t sub_1CF72DB5C()
{
  unint64_t result;

  result = qword_1EFBA3C18;
  if (!qword_1EFBA3C18)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748F6C, &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C18);
  }
  return result;
}

unint64_t sub_1CF72DB9C()
{
  unint64_t result;

  result = qword_1EFBA3C20;
  if (!qword_1EFBA3C20)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749074, &type metadata for ControlChannelMessage.Response.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C20);
  }
  return result;
}

unint64_t sub_1CF72DBDC()
{
  unint64_t result;

  result = qword_1EFBA3C28;
  if (!qword_1EFBA3C28)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74917C, &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C28);
  }
  return result;
}

unint64_t sub_1CF72DC1C()
{
  unint64_t result;

  result = qword_1EFBA3C30;
  if (!qword_1EFBA3C30)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749234, &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C30);
  }
  return result;
}

unint64_t sub_1CF72DC5C()
{
  unint64_t result;

  result = qword_1EFBA3C38;
  if (!qword_1EFBA3C38)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7492EC, &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C38);
  }
  return result;
}

unint64_t sub_1CF72DC9C()
{
  unint64_t result;

  result = qword_1EFBA3C40;
  if (!qword_1EFBA3C40)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7493A4, &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C40);
  }
  return result;
}

unint64_t sub_1CF72DCDC()
{
  unint64_t result;

  result = qword_1EFBA3C48;
  if (!qword_1EFBA3C48)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74945C, &type metadata for ControlChannelMessage.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C48);
  }
  return result;
}

unint64_t sub_1CF72DD1C()
{
  unint64_t result;

  result = qword_1ED8F70D0;
  if (!qword_1ED8F70D0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749314, &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70D0);
  }
  return result;
}

unint64_t sub_1CF72DD5C()
{
  unint64_t result;

  result = qword_1ED8F70C8;
  if (!qword_1ED8F70C8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74933C, &type metadata for ControlChannelMessage.Response.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70C8);
  }
  return result;
}

unint64_t sub_1CF72DD9C()
{
  unint64_t result;

  result = qword_1ED8F70B8;
  if (!qword_1ED8F70B8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74925C, &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70B8);
  }
  return result;
}

unint64_t sub_1CF72DDDC()
{
  unint64_t result;

  result = qword_1ED8F70B0;
  if (!qword_1ED8F70B0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749284, &type metadata for ControlChannelMessage.Response.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70B0);
  }
  return result;
}

unint64_t sub_1CF72DE1C()
{
  unint64_t result;

  result = qword_1ED8F70F0;
  if (!qword_1ED8F70F0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7491A4, &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70F0);
  }
  return result;
}

unint64_t sub_1CF72DE5C()
{
  unint64_t result;

  result = qword_1ED8F70E8;
  if (!qword_1ED8F70E8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7491CC, &type metadata for ControlChannelMessage.Response.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70E8);
  }
  return result;
}

unint64_t sub_1CF72DE9C()
{
  unint64_t result;

  result = qword_1ED8F7060;
  if (!qword_1ED8F7060)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7490EC, &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7060);
  }
  return result;
}

unint64_t sub_1CF72DEDC()
{
  unint64_t result;

  result = qword_1ED8F7058;
  if (!qword_1ED8F7058)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749114, &type metadata for ControlChannelMessage.Response.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7058);
  }
  return result;
}

unint64_t sub_1CF72DF1C()
{
  unint64_t result;

  result = qword_1ED8F7070;
  if (!qword_1ED8F7070)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74909C, &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7070);
  }
  return result;
}

unint64_t sub_1CF72DF5C()
{
  unint64_t result;

  result = qword_1ED8F7068;
  if (!qword_1ED8F7068)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7490C4, &type metadata for ControlChannelMessage.Response.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7068);
  }
  return result;
}

unint64_t sub_1CF72DF9C()
{
  unint64_t result;

  result = qword_1ED8F7098;
  if (!qword_1ED8F7098)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748FE4, &type metadata for ControlChannelMessage.Response.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7098);
  }
  return result;
}

unint64_t sub_1CF72DFDC()
{
  unint64_t result;

  result = qword_1ED8F7090;
  if (!qword_1ED8F7090)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74900C, &type metadata for ControlChannelMessage.Response.ErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7090);
  }
  return result;
}

unint64_t sub_1CF72E01C()
{
  unint64_t result;

  result = qword_1ED8F70A8;
  if (!qword_1ED8F70A8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748F94, &type metadata for ControlChannelMessage.Response.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70A8);
  }
  return result;
}

unint64_t sub_1CF72E05C()
{
  unint64_t result;

  result = qword_1ED8F70A0;
  if (!qword_1ED8F70A0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748FBC, &type metadata for ControlChannelMessage.Response.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70A0);
  }
  return result;
}

unint64_t sub_1CF72E09C()
{
  unint64_t result;

  result = qword_1ED8F70E0;
  if (!qword_1ED8F70E0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748EDC, &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70E0);
  }
  return result;
}

unint64_t sub_1CF72E0DC()
{
  unint64_t result;

  result = qword_1ED8F70D8;
  if (!qword_1ED8F70D8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748F04, &type metadata for ControlChannelMessage.Response.ErrorExtendedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F70D8);
  }
  return result;
}

unint64_t sub_1CF72E11C()
{
  unint64_t result;

  result = qword_1ED8F7088;
  if (!qword_1ED8F7088)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7493CC, &type metadata for ControlChannelMessage.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7088);
  }
  return result;
}

unint64_t sub_1CF72E15C()
{
  unint64_t result;

  result = qword_1ED8F7080;
  if (!qword_1ED8F7080)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7493F4, &type metadata for ControlChannelMessage.Response.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7080);
  }
  return result;
}

unint64_t sub_1CF72E19C()
{
  unint64_t result;

  result = qword_1ED8F6EF8;
  if (!qword_1ED8F6EF8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748D6C, &type metadata for ControlChannelMessage.EventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6EF8);
  }
  return result;
}

unint64_t sub_1CF72E1DC()
{
  unint64_t result;

  result = qword_1ED8F6EF0;
  if (!qword_1ED8F6EF0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748D94, &type metadata for ControlChannelMessage.EventCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6EF0);
  }
  return result;
}

unint64_t sub_1CF72E21C()
{
  unint64_t result;

  result = qword_1ED8F6F10;
  if (!qword_1ED8F6F10)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748CB4, &type metadata for ControlChannelMessage.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F10);
  }
  return result;
}

unint64_t sub_1CF72E25C()
{
  unint64_t result;

  result = qword_1ED8F6F08;
  if (!qword_1ED8F6F08)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748CDC, &type metadata for ControlChannelMessage.RequestCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F08);
  }
  return result;
}

unint64_t sub_1CF72E29C()
{
  unint64_t result;

  result = qword_1ED8F6F28;
  if (!qword_1ED8F6F28)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748BFC, &type metadata for ControlChannelMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F28);
  }
  return result;
}

unint64_t sub_1CF72E2DC()
{
  unint64_t result;

  result = qword_1ED8F6F20;
  if (!qword_1ED8F6F20)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748C24, &type metadata for ControlChannelMessage.ResponseCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F20);
  }
  return result;
}

unint64_t sub_1CF72E31C()
{
  unint64_t result;

  result = qword_1ED8F6EE0;
  if (!qword_1ED8F6EE0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748E24, &type metadata for ControlChannelMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6EE0);
  }
  return result;
}

unint64_t sub_1CF72E35C()
{
  unint64_t result;

  result = qword_1ED8F6ED8;
  if (!qword_1ED8F6ED8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748E4C, &type metadata for ControlChannelMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6ED8);
  }
  return result;
}

unint64_t sub_1CF72E39C()
{
  unint64_t result;

  result = qword_1ED8F7820;
  if (!qword_1ED8F7820)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748A8C, &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7820);
  }
  return result;
}

unint64_t sub_1CF72E3DC()
{
  unint64_t result;

  result = qword_1ED8F7818;
  if (!qword_1ED8F7818)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748AB4, &type metadata for ControlChannelMessageEnvelope.Message.StreamEncryptedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7818);
  }
  return result;
}

unint64_t sub_1CF72E41C()
{
  unint64_t result;

  result = qword_1ED8F7810;
  if (!qword_1ED8F7810)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7489D4, &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7810);
  }
  return result;
}

unint64_t sub_1CF72E45C()
{
  unint64_t result;

  result = qword_1ED8F7808;
  if (!qword_1ED8F7808)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF7489FC, &type metadata for ControlChannelMessageEnvelope.Message.PlainCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7808);
  }
  return result;
}

unint64_t sub_1CF72E49C()
{
  unint64_t result;

  result = qword_1ED8F77F8;
  if (!qword_1ED8F77F8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748B44, &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F77F8);
  }
  return result;
}

unint64_t sub_1CF72E4DC()
{
  unint64_t result;

  result = qword_1ED8F77F0;
  if (!qword_1ED8F77F0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF748B6C, &type metadata for ControlChannelMessageEnvelope.Message.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F77F0);
  }
  return result;
}

unint64_t sub_1CF72E518()
{
  unint64_t result;

  result = qword_1ED8F6FF0;
  if (!qword_1ED8F6FF0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A9FC, &type metadata for ControlChannelMessage.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FF0);
  }
  return result;
}

unint64_t sub_1CF72E554()
{
  unint64_t result;

  result = qword_1EFBA3C50;
  if (!qword_1EFBA3C50)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A9AC, &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C50);
  }
  return result;
}

unint64_t sub_1CF72E590()
{
  unint64_t result;

  result = qword_1EFBA3C58;
  if (!qword_1EFBA3C58)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A95C, &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C58);
  }
  return result;
}

unint64_t sub_1CF72E5CC()
{
  unint64_t result;

  result = qword_1EFBA3C60;
  if (!qword_1EFBA3C60)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A90C, &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C60);
  }
  return result;
}

unint64_t sub_1CF72E608()
{
  unint64_t result;

  result = qword_1EFBA3C68;
  if (!qword_1EFBA3C68)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A8BC, &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C68);
  }
  return result;
}

unint64_t sub_1CF72E644()
{
  unint64_t result;

  result = qword_1EFBA3C70;
  if (!qword_1EFBA3C70)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for TransportProtocolType, &type metadata for TransportProtocolType);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C70);
  }
  return result;
}

unint64_t sub_1CF72E680()
{
  unint64_t result;

  result = qword_1EFBA3C88;
  if (!qword_1EFBA3C88)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PeerConnectionInfo, &type metadata for PeerConnectionInfo);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C88);
  }
  return result;
}

unint64_t sub_1CF72E6BC()
{
  unint64_t result;

  result = qword_1EFBA3C90;
  if (!qword_1EFBA3C90)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A86C, &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C90);
  }
  return result;
}

unint64_t sub_1CF72E6F8()
{
  unint64_t result;

  result = qword_1ED8F7018;
  if (!qword_1ED8F7018)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A81C, &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7018);
  }
  return result;
}

unint64_t sub_1CF72E734()
{
  unint64_t result;

  result = qword_1ED8F6D90;
  if (!qword_1ED8F6D90)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A7F4, &unk_1E8CA3210);
    atomic_store(result, (unint64_t *)&qword_1ED8F6D90);
  }
  return result;
}

unint64_t sub_1CF72E770()
{
  unint64_t result;

  result = qword_1ED8F6F68;
  if (!qword_1ED8F6F68)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A7A4, &type metadata for ControlChannelMessage.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F68);
  }
  return result;
}

unint64_t sub_1CF72E7AC()
{
  unint64_t result;

  result = qword_1EFBA3C98;
  if (!qword_1EFBA3C98)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A754, &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3C98);
  }
  return result;
}

unint64_t sub_1CF72E7E8()
{
  unint64_t result;

  result = qword_1EFBA3CA0;
  if (!qword_1EFBA3CA0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A704, &type metadata for ControlChannelMessage.Event.UnpairCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3CA0);
  }
  return result;
}

unint64_t sub_1CF72E824()
{
  unint64_t result;

  result = qword_1EFBA3CA8;
  if (!qword_1EFBA3CA8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A6B4, &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3CA8);
  }
  return result;
}

unint64_t sub_1CF72E860()
{
  unint64_t result;

  result = qword_1EFBA3CB0;
  if (!qword_1EFBA3CB0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A664, &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3CB0);
  }
  return result;
}

unint64_t sub_1CF72E89C()
{
  unint64_t result;

  result = qword_1EFBA3CB8;
  if (!qword_1EFBA3CB8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A614, &type metadata for ControlChannelMessage.Event.PingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3CB8);
  }
  return result;
}

unint64_t sub_1CF72E8D8()
{
  unint64_t result;

  result = qword_1ED8F7CE0;
  if (!qword_1ED8F7CE0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A5C4, &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7CE0);
  }
  return result;
}

unint64_t sub_1CF72E914()
{
  unint64_t result;

  result = qword_1EFBA3CC0;
  if (!qword_1EFBA3CC0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A574, &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3CC0);
  }
  return result;
}

unint64_t sub_1CF72E950()
{
  unint64_t result;

  result = qword_1ED8F6F30;
  if (!qword_1ED8F6F30)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A524, &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F30);
  }
  return result;
}

unint64_t sub_1CF72E98C()
{
  unint64_t result;

  result = qword_1ED8F6C68;
  if (!qword_1ED8F6C68)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PairingData, &type metadata for PairingData);
    atomic_store(result, (unint64_t *)&qword_1ED8F6C68);
  }
  return result;
}

unint64_t sub_1CF72E9C8()
{
  unint64_t result;

  result = qword_1EFBA3D00;
  if (!qword_1EFBA3D00)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for TransportProtocolType, &type metadata for TransportProtocolType);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D00);
  }
  return result;
}

unint64_t sub_1CF72EA04(uint64_t a1)
{
  unint64_t *v1;
  unint64_t result;
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  uint64_t v8;

  result = OUTLINED_FUNCTION_156_1(a1);
  if (!result)
  {
    v5 = v4;
    v6 = v3;
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBA3C78);
    v8 = v6();
    result = MEMORY[0x1D17D3DEC](v5, v7, &v8);
    atomic_store(result, v1);
  }
  return result;
}

unint64_t sub_1CF72EA68()
{
  unint64_t result;

  result = qword_1EFBA3D10;
  if (!qword_1EFBA3D10)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PeerConnectionInfo, &type metadata for PeerConnectionInfo);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D10);
  }
  return result;
}

unint64_t sub_1CF72EAA4()
{
  unint64_t result;

  result = qword_1EFBA3D18;
  if (!qword_1EFBA3D18)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A4FC, &unk_1E8CA3210);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D18);
  }
  return result;
}

unint64_t sub_1CF72EAE0()
{
  unint64_t result;

  result = qword_1ED8F6C60;
  if (!qword_1ED8F6C60)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for PairingData, &type metadata for PairingData);
    atomic_store(result, (unint64_t *)&qword_1ED8F6C60);
  }
  return result;
}

unint64_t sub_1CF72EB1C()
{
  unint64_t result;

  result = qword_1ED8F6D98;
  if (!qword_1ED8F6D98)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A4AC, &type metadata for HandshakeResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6D98);
  }
  return result;
}

unint64_t sub_1CF72EB58()
{
  unint64_t result;

  result = qword_1EFBA3D28;
  if (!qword_1EFBA3D28)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for ControlChannelConnection.Options.Device, &type metadata for ControlChannelConnection.Options.Device);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D28);
  }
  return result;
}

uint64_t sub_1CF72EB94(uint64_t a1)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_156_1(a1);
  if (!result)
  {
    type metadata accessor for ControlChannelConnectionWireProtocolVersion();
    OUTLINED_FUNCTION_15_2();
  }
  return result;
}

unint64_t sub_1CF72EBC8()
{
  unint64_t result;

  result = qword_1ED8F7150;
  if (!qword_1ED8F7150)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for ControlChannelConnection.Options.Device, &type metadata for ControlChannelConnection.Options.Device);
    atomic_store(result, (unint64_t *)&qword_1ED8F7150);
  }
  return result;
}

uint64_t _s19RemotePairingDevice11PairingDataV4KindOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_106_2(-1);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 4);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 4);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 4);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_106_2(v8);
}

uint64_t _s19RemotePairingDevice11PairingDataV4KindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF72ECD4 + 4 * byte_1CF747D85[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_104_1_0 + 4 * byte_1CF747D80[v4]))();
}

uint64_t sub_1CF72ED0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF72ED14);
  return result;
}

uint64_t sub_1CF72ED1C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF72ED24);
  return OUTLINED_FUNCTION_103_1();
}

ValueMetadata *type metadata accessor for HandshakeResponse.CodingKeys()
{
  return &type metadata for HandshakeResponse.CodingKeys;
}

uint64_t _s19RemotePairingDevice21ControlChannelMessageO8ResponseO10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_106_2(-1);
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 8);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 8);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 8);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_106_2(v8);
}

uint64_t _s19RemotePairingDevice21ControlChannelMessageO8ResponseO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_1CF72EE14 + 4 * byte_1CF747D8F[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_104_1_1 + 4 * byte_1CF747D8A[v4]))();
}

uint64_t sub_1CF72EE4C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF72EE54);
  return result;
}

uint64_t sub_1CF72EE5C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF72EE64);
  return OUTLINED_FUNCTION_103_1();
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingDataCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingRejectedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairVerifyFailedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PingCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PingCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.UnpairCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.UnpairCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys()
{
  return &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys;
}

uint64_t storeEnumTagSinglePayload for ControlChannelMessage.Request.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF72EF50 + 4 * byte_1CF747D99[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1CF72EF84 + 4 * byte_1CF747D94[v4]))();
}

uint64_t sub_1CF72EF84(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF72EF8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF72EF94);
  return result;
}

uint64_t sub_1CF72EFA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF72EFA8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1CF72EFAC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF72EFB4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.HandshakeCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.PeerInfoCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CreateListenerCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CancelPairSetupCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys;
}

uint64_t _s19RemotePairingDevice22StreamEncryptedMessageV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1CF72F060 + 4 * byte_1CF747D9E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CF72F080 + 4 * byte_1CF747DA3[v4]))();
}

_BYTE *sub_1CF72F060(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CF72F080(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CF72F088(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CF72F090(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CF72F098(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CF72F0A0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ControlChannelMessage.Request.RemoteUnlockCodingKeys()
{
  return &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys;
}

uint64_t sub_1CF72F0BC(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t sub_1CF72F0E4(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CF72F128(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1CF72F190(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1CF72F1DC(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1CF72F21C(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for HandshakeRequest()
{
  OUTLINED_FUNCTION_31();
}

unint64_t sub_1CF72F26C()
{
  unint64_t result;

  result = qword_1EFBA3D30;
  if (!qword_1EFBA3D30)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749C44, &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D30);
  }
  return result;
}

unint64_t sub_1CF72F2AC()
{
  unint64_t result;

  result = qword_1EFBA3D38;
  if (!qword_1EFBA3D38)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749D9C, &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D38);
  }
  return result;
}

unint64_t sub_1CF72F2EC()
{
  unint64_t result;

  result = qword_1EFBA3D40;
  if (!qword_1EFBA3D40)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749EA4, &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D40);
  }
  return result;
}

unint64_t sub_1CF72F32C()
{
  unint64_t result;

  result = qword_1EFBA3D48;
  if (!qword_1EFBA3D48)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749F5C, &type metadata for ControlChannelMessage.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D48);
  }
  return result;
}

unint64_t sub_1CF72F36C()
{
  unint64_t result;

  result = qword_1EFBA3D50;
  if (!qword_1EFBA3D50)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A014, &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D50);
  }
  return result;
}

unint64_t sub_1CF72F3AC()
{
  unint64_t result;

  result = qword_1EFBA3D58;
  if (!qword_1EFBA3D58)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A11C, &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D58);
  }
  return result;
}

unint64_t sub_1CF72F3EC()
{
  unint64_t result;

  result = qword_1EFBA3D60;
  if (!qword_1EFBA3D60)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A314, &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D60);
  }
  return result;
}

unint64_t sub_1CF72F42C()
{
  unint64_t result;

  result = qword_1EFBA3D68;
  if (!qword_1EFBA3D68)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A3CC, &type metadata for ControlChannelMessage.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D68);
  }
  return result;
}

unint64_t sub_1CF72F46C()
{
  unint64_t result;

  result = qword_1EFBA3D70;
  if (!qword_1EFBA3D70)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A484, &type metadata for HandshakeResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D70);
  }
  return result;
}

unint64_t sub_1CF72F4AC()
{
  unint64_t result;

  result = qword_1ED8F6DA8;
  if (!qword_1ED8F6DA8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A3F4, &type metadata for HandshakeResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6DA8);
  }
  return result;
}

unint64_t sub_1CF72F4EC()
{
  unint64_t result;

  result = qword_1ED8F6DA0;
  if (!qword_1ED8F6DA0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A41C, &type metadata for HandshakeResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6DA0);
  }
  return result;
}

unint64_t sub_1CF72F52C()
{
  unint64_t result;

  result = qword_1ED8F6F40;
  if (!qword_1ED8F6F40)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A284, &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F40);
  }
  return result;
}

unint64_t sub_1CF72F56C()
{
  unint64_t result;

  result = qword_1ED8F6F38;
  if (!qword_1ED8F6F38)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A2AC, &type metadata for ControlChannelMessage.Event.PairingDataCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F38);
  }
  return result;
}

unint64_t sub_1CF72F5AC()
{
  unint64_t result;

  result = qword_1ED8F6F50;
  if (!qword_1ED8F6F50)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A234, &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F50);
  }
  return result;
}

unint64_t sub_1CF72F5EC()
{
  unint64_t result;

  result = qword_1ED8F6F48;
  if (!qword_1ED8F6F48)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A25C, &type metadata for ControlChannelMessage.Event.PairingRejectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F48);
  }
  return result;
}

unint64_t sub_1CF72F62C()
{
  unint64_t result;

  result = qword_1ED8F6FA8;
  if (!qword_1ED8F6FA8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A1E4, &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FA8);
  }
  return result;
}

unint64_t sub_1CF72F66C()
{
  unint64_t result;

  result = qword_1ED8F6FA0;
  if (!qword_1ED8F6FA0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A20C, &type metadata for ControlChannelMessage.Event.PairVerifyFailedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FA0);
  }
  return result;
}

unint64_t sub_1CF72F6AC()
{
  unint64_t result;

  result = qword_1ED8F6F88;
  if (!qword_1ED8F6F88)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A194, &type metadata for ControlChannelMessage.Event.PingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F88);
  }
  return result;
}

unint64_t sub_1CF72F6EC()
{
  unint64_t result;

  result = qword_1ED8F6F80;
  if (!qword_1ED8F6F80)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A1BC, &type metadata for ControlChannelMessage.Event.PingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F80);
  }
  return result;
}

unint64_t sub_1CF72F72C()
{
  unint64_t result;

  result = qword_1ED8F6FB8;
  if (!qword_1ED8F6FB8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A144, &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FB8);
  }
  return result;
}

unint64_t sub_1CF72F76C()
{
  unint64_t result;

  result = qword_1ED8F6FB0;
  if (!qword_1ED8F6FB0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A16C, &type metadata for ControlChannelMessage.Event.AwaitingUserConsentCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FB0);
  }
  return result;
}

unint64_t sub_1CF72F7AC()
{
  unint64_t result;

  result = qword_1ED8F6F60;
  if (!qword_1ED8F6F60)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A08C, &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F60);
  }
  return result;
}

unint64_t sub_1CF72F7EC()
{
  unint64_t result;

  result = qword_1ED8F6F58;
  if (!qword_1ED8F6F58)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A0B4, &type metadata for ControlChannelMessage.Event.PairingRejectedWithErrorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F58);
  }
  return result;
}

unint64_t sub_1CF72F82C()
{
  unint64_t result;

  result = qword_1ED8F6F98;
  if (!qword_1ED8F6F98)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A03C, &type metadata for ControlChannelMessage.Event.UnpairCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F98);
  }
  return result;
}

unint64_t sub_1CF72F86C()
{
  unint64_t result;

  result = qword_1ED8F6F90;
  if (!qword_1ED8F6F90)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A064, &type metadata for ControlChannelMessage.Event.UnpairCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F90);
  }
  return result;
}

unint64_t sub_1CF72F8AC()
{
  unint64_t result;

  result = qword_1ED8F7CC8;
  if (!qword_1ED8F7CC8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749F84, &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7CC8);
  }
  return result;
}

unint64_t sub_1CF72F8EC()
{
  unint64_t result;

  result = qword_1ED8F7CC0;
  if (!qword_1ED8F7CC0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749FAC, &type metadata for ControlChannelMessage.Event.DeviceInfoUpdatedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7CC0);
  }
  return result;
}

unint64_t sub_1CF72F92C()
{
  unint64_t result;

  result = qword_1ED8F6F78;
  if (!qword_1ED8F6F78)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A33C, &type metadata for ControlChannelMessage.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F78);
  }
  return result;
}

unint64_t sub_1CF72F96C()
{
  unint64_t result;

  result = qword_1ED8F6F70;
  if (!qword_1ED8F6F70)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74A364, &type metadata for ControlChannelMessage.Event.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6F70);
  }
  return result;
}

unint64_t sub_1CF72F9AC()
{
  unint64_t result;

  result = qword_1ED8F7028;
  if (!qword_1ED8F7028)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749E14, &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7028);
  }
  return result;
}

unint64_t sub_1CF72F9EC()
{
  unint64_t result;

  result = qword_1ED8F7020;
  if (!qword_1ED8F7020)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749E3C, &type metadata for ControlChannelMessage.Request.HandshakeCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7020);
  }
  return result;
}

unint64_t sub_1CF72FA2C()
{
  unint64_t result;

  result = qword_1ED8F7010;
  if (!qword_1ED8F7010)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749DC4, &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7010);
  }
  return result;
}

unint64_t sub_1CF72FA6C()
{
  unint64_t result;

  result = qword_1ED8F7008;
  if (!qword_1ED8F7008)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749DEC, &type metadata for ControlChannelMessage.Request.PeerInfoCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7008);
  }
  return result;
}

unint64_t sub_1CF72FAAC()
{
  unint64_t result;

  result = qword_1ED8F7038;
  if (!qword_1ED8F7038)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749D0C, &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7038);
  }
  return result;
}

unint64_t sub_1CF72FAEC()
{
  unint64_t result;

  result = qword_1ED8F7030;
  if (!qword_1ED8F7030)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749D34, &type metadata for ControlChannelMessage.Request.CreateListenerCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7030);
  }
  return result;
}

unint64_t sub_1CF72FB2C()
{
  unint64_t result;

  result = qword_1ED8F7048;
  if (!qword_1ED8F7048)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749CBC, &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7048);
  }
  return result;
}

unint64_t sub_1CF72FB6C()
{
  unint64_t result;

  result = qword_1ED8F7040;
  if (!qword_1ED8F7040)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749CE4, &type metadata for ControlChannelMessage.Request.CancelPairSetupCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7040);
  }
  return result;
}

unint64_t sub_1CF72FBAC()
{
  unint64_t result;

  result = qword_1ED8F6FD8;
  if (!qword_1ED8F6FD8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749C6C, &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FD8);
  }
  return result;
}

unint64_t sub_1CF72FBEC()
{
  unint64_t result;

  result = qword_1ED8F6FD0;
  if (!qword_1ED8F6FD0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749C94, &type metadata for ControlChannelMessage.Request.CreateRemoteUnlockKeyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FD0);
  }
  return result;
}

unint64_t sub_1CF72FC2C()
{
  unint64_t result;

  result = qword_1ED8F6FE8;
  if (!qword_1ED8F6FE8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749BB4, &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FE8);
  }
  return result;
}

unint64_t sub_1CF72FC6C()
{
  unint64_t result;

  result = qword_1ED8F6FE0;
  if (!qword_1ED8F6FE0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749BDC, &type metadata for ControlChannelMessage.Request.RemoteUnlockCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FE0);
  }
  return result;
}

unint64_t sub_1CF72FCAC()
{
  unint64_t result;

  result = qword_1ED8F7000;
  if (!qword_1ED8F7000)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749ECC, &type metadata for ControlChannelMessage.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F7000);
  }
  return result;
}

unint64_t sub_1CF72FCEC()
{
  unint64_t result;

  result = qword_1ED8F6FF8;
  if (!qword_1ED8F6FF8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF749EF4, &type metadata for ControlChannelMessage.Request.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6FF8);
  }
  return result;
}

unint64_t sub_1CF72FD28()
{
  unint64_t result;

  result = qword_1ED8F6D78;
  if (!qword_1ED8F6D78)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74AB04, &type metadata for HandshakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6D78);
  }
  return result;
}

unint64_t sub_1CF72FD64()
{
  unint64_t result;

  result = qword_1ED8F7170;
  if (!qword_1ED8F7170)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for ControlChannelConnection.Options.Host, &type metadata for ControlChannelConnection.Options.Host);
    atomic_store(result, (unint64_t *)&qword_1ED8F7170);
  }
  return result;
}

unint64_t sub_1CF72FDA0()
{
  unint64_t result;

  result = qword_1EFBA3D80;
  if (!qword_1EFBA3D80)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for ControlChannelConnection.Options.Host, &type metadata for ControlChannelConnection.Options.Host);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D80);
  }
  return result;
}

uint64_t sub_1CF72FDDC(uint64_t a1)
{
  uint64_t result;
  uint64_t *v2;

  result = OUTLINED_FUNCTION_156_1(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v2);
    OUTLINED_FUNCTION_15_2();
  }
  return result;
}

uint64_t _s19RemotePairingDevice29ControlChannelMessageEnvelopeV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_106_2(-1);
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
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 3);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 3);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_106_2((*a1 | (v4 << 8)) - 3);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_106_2(v8);
}

uint64_t _s19RemotePairingDevice29ControlChannelMessageEnvelopeV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF72FEE0 + 4 * byte_1CF747DAD[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_104_1_2 + 4 * byte_1CF747DA8[v4]))();
}

uint64_t sub_1CF72FF18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF72FF20);
  return result;
}

uint64_t sub_1CF72FF28(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF72FF30);
  return OUTLINED_FUNCTION_103_1();
}

ValueMetadata *type metadata accessor for HandshakeRequest.CodingKeys()
{
  return &type metadata for HandshakeRequest.CodingKeys;
}

unint64_t sub_1CF72FF54()
{
  unint64_t result;

  result = qword_1EFBA3D90;
  if (!qword_1EFBA3D90)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74AADC, &type metadata for HandshakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA3D90);
  }
  return result;
}

unint64_t sub_1CF72FF94()
{
  unint64_t result;

  result = qword_1ED8F6D88;
  if (!qword_1ED8F6D88)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74AA4C, &type metadata for HandshakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6D88);
  }
  return result;
}

unint64_t sub_1CF72FFD4()
{
  unint64_t result;

  result = qword_1ED8F6D80;
  if (!qword_1ED8F6D80)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74AA74, &type metadata for HandshakeRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1ED8F6D80);
  }
  return result;
}

double OUTLINED_FUNCTION_5_13()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_18_15()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_22_9()
{
  return sub_1CF73F528();
}

uint64_t OUTLINED_FUNCTION_25_9()
{
  return sub_1CF73F4A4();
}

uint64_t OUTLINED_FUNCTION_30_9()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_31_6()
{
  return sub_1CF73F4A4();
}

uint64_t OUTLINED_FUNCTION_38_9()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  return sub_1CF73F57C();
}

uint64_t OUTLINED_FUNCTION_45_9@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_52_7()
{
  return sub_1CF73F4F8();
}

void OUTLINED_FUNCTION_54_9()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
}

_QWORD *OUTLINED_FUNCTION_55_6(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_0Tm(a1, v1);
}

uint64_t OUTLINED_FUNCTION_57_10()
{
  return sub_1CF73F4A4();
}

uint64_t OUTLINED_FUNCTION_59_7()
{
  return sub_1CF73F5C4();
}

uint64_t OUTLINED_FUNCTION_60_6()
{
  return sub_1CF73F5AC();
}

uint64_t OUTLINED_FUNCTION_62_4@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_63_7()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 2;
}

uint64_t OUTLINED_FUNCTION_64_9()
{
  return sub_1CF73F528();
}

uint64_t OUTLINED_FUNCTION_67_6()
{
  return sub_1CF73F57C();
}

uint64_t OUTLINED_FUNCTION_68_7()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_69_7()
{
  uint64_t v0;

  return nullsub_1(v0 - 216);
}

void *OUTLINED_FUNCTION_71_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1CF6C8CAC((const void *)(v0 + 352), (void *)(v1 - 224));
}

uint64_t OUTLINED_FUNCTION_74_3()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_76_3()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 288) + 8))(v0, *(_QWORD *)(v1 - 200));
}

uint64_t OUTLINED_FUNCTION_77_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_81_4()
{
  return sub_1CF73F840();
}

uint64_t OUTLINED_FUNCTION_82_3()
{
  return sub_1CF73F57C();
}

uint64_t OUTLINED_FUNCTION_83_3()
{
  return sub_1CF73F5F4();
}

uint64_t OUTLINED_FUNCTION_84_2()
{
  return sub_1CF73F57C();
}

uint64_t OUTLINED_FUNCTION_85_3()
{
  return sub_1CF73F5F4();
}

void OUTLINED_FUNCTION_88_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_89_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 216) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_90_3(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_91_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 208) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_93_1()
{
  return sub_1CF73F384();
}

uint64_t OUTLINED_FUNCTION_96_2()
{
  return sub_1CF73F4A4();
}

uint64_t OUTLINED_FUNCTION_99_0@<X0>(char a1@<W8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 - 120) = a1;
  return sub_1CF6934BC(v2, v1);
}

uint64_t OUTLINED_FUNCTION_100_2(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_101_2(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

_BYTE *OUTLINED_FUNCTION_103_1@<X0>(_BYTE *result@<X0>, char a2@<W8>)
{
  *result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_104_1(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_106_2@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_107_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_109_2()
{
  return sub_1CF73F528();
}

uint64_t OUTLINED_FUNCTION_111_1@<X0>(char a1@<W8>)
{
  _BYTE *v1;

  v1[128] = a1;
  sub_1CF6C8C64(v1 + 392, v1 + 256);
  return sub_1CF6CA7A8((uint64_t)(v1 + 256));
}

uint64_t OUTLINED_FUNCTION_112_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0Tm(v0);
}

unint64_t OUTLINED_FUNCTION_114_2@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = a1;
  return sub_1CF6D5DAC();
}

uint64_t OUTLINED_FUNCTION_115_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_116_2()
{
  return type metadata accessor for ControlChannelConnectionWireProtocolVersion();
}

uint64_t OUTLINED_FUNCTION_117_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_121_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_124_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_125_2()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6933C0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_127_1(uint64_t a1)
{
  return sub_1CF6934BC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t OUTLINED_FUNCTION_130_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_132_1()
{
  return sub_1CF73F5F4();
}

uint64_t OUTLINED_FUNCTION_133_0()
{
  return sub_1CF73F57C();
}

uint64_t OUTLINED_FUNCTION_134_1()
{
  uint64_t v0;

  return v0 - 96;
}

unint64_t OUTLINED_FUNCTION_135_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 1;
  return sub_1CF72E914();
}

uint64_t OUTLINED_FUNCTION_136_1()
{
  uint64_t v0;

  return sub_1CF6CA7A8(v0 - 224);
}

uint64_t OUTLINED_FUNCTION_137_0()
{
  uint64_t v0;

  sub_1CF6C8C64((const void *)(v0 + 312), (void *)(v0 + 176));
  return sub_1CF6CA6C0(v0 + 176);
}

void *OUTLINED_FUNCTION_138_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CF6C8C64((const void *)(v1 + 24), (void *)(a1 + 16));
}

uint64_t OUTLINED_FUNCTION_139_0()
{
  return sub_1CF73F7EC();
}

unint64_t OUTLINED_FUNCTION_141_0()
{
  _QWORD *v0;
  uint64_t v1;

  __swift_project_boxed_opaque_existential_0Tm(v0, v1);
  return sub_1CF72C7A8();
}

void *OUTLINED_FUNCTION_142_0(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x79uLL);
}

uint64_t OUTLINED_FUNCTION_145_0()
{
  uint64_t v0;

  return v0 + 24;
}

unint64_t OUTLINED_FUNCTION_146_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 4;
  return sub_1CF72E860();
}

unint64_t OUTLINED_FUNCTION_147_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 3;
  return sub_1CF72E89C();
}

uint64_t OUTLINED_FUNCTION_150_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6933C0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_151_1(uint64_t a1)
{
  return sub_1CF72FDDC(a1);
}

unint64_t OUTLINED_FUNCTION_152_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 192) = 2;
  return sub_1CF72E8D8();
}

uint64_t OUTLINED_FUNCTION_153_0()
{
  uint64_t v0;

  return v0 - 96;
}

void *OUTLINED_FUNCTION_154_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  va_list va;

  va_start(va, a10);
  return sub_1CF6C8CAC(va, v10);
}

uint64_t OUTLINED_FUNCTION_155_0()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1CF6A7B18(v1, v0);
}

uint64_t OUTLINED_FUNCTION_156_1(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_157_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0Tm(*(_QWORD *)(v0 - 72));
}

uint64_t OUTLINED_FUNCTION_158_1()
{
  return sub_1CF73F5AC();
}

uint64_t OUTLINED_FUNCTION_165_1()
{
  return sub_1CF73F5F4();
}

uint64_t OUTLINED_FUNCTION_166_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t sub_1CF730544(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  type metadata accessor for RemoteUnlockKeypair();
  v4 = swift_allocObject();
  sub_1CF730D08();
  OUTLINED_FUNCTION_10();
  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  sub_1CF693FE0(v5, v6);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_21_9();
  swift_release();
  return v4;
}

uint64_t sub_1CF7305F0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int Escrow;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v0 = (void *)swift_slowAlloc();
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, v0))
  {
    sub_1CF6AA5E0();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_21();
    OUTLINED_FUNCTION_9_14();
    v1 = OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_5_14(v1, v2, v3, v4, v5, v6, v7, v8, v30, v31);
    sub_1CF73F780();
    OUTLINED_FUNCTION_28_0();
  }
  else
  {
    MEMORY[0x1D17D21C0](v0, 32);
    v9 = (void *)sub_1CF73E58C();
    Escrow = MKBKeyBagCreateEscrow();

    if (!Escrow && !MKBKeyBagCopyData())
    {
      sub_1CF6AA5E0();
      OUTLINED_FUNCTION_3_0();
      sub_1CF73F774();
      OUTLINED_FUNCTION_9_14();
      v22 = OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_5_14(v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
      sub_1CF73F780();
      OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_13_15();
    }
    sub_1CF6AA5E0();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_1_21();
    OUTLINED_FUNCTION_9_14();
    v11 = OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_5_14(v11, v12, v13, v14, v15, v16, v17, v18, v30, v31);
    sub_1CF73F780();
    OUTLINED_FUNCTION_28_0();
    v19 = OUTLINED_FUNCTION_304();
    sub_1CF6933C0(v19, v20);
  }
  return OUTLINED_FUNCTION_304();
}

void sub_1CF730890()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = (void *)sub_1CF73E58C();
  MKBKeyBagCreateWithData();

  sub_1CF6AA5E0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6_17();
  OUTLINED_FUNCTION_18_16();
  v1 = OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_1_18(v1, v2, v3, v4, v5, v6, v7, v8, v9);
  sub_1CF73F780();
  swift_willThrow();
}

uint64_t sub_1CF7309E4()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_1CF7305F0();
  if (v0)
    return v2;
  return result;
}

void sub_1CF730A0C()
{
  sub_1CF730890();
}

uint64_t sub_1CF730A20()
{
  sub_1CF6AA5E0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_21();
  OUTLINED_FUNCTION_15_15();
  OUTLINED_FUNCTION_15_15();
  sub_1CF6ABB3C();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_7_16();
  return swift_willThrow();
}

uint64_t sub_1CF730AB4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1CF730AC4()
{
  return sub_1CF730A20();
}

void sub_1CF730AD8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10();
  sub_1CF6A7B18(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  OUTLINED_FUNCTION_26();
}

void sub_1CF730B18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  OUTLINED_FUNCTION_10();
  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  sub_1CF693FE0(v5, v6);
  OUTLINED_FUNCTION_5();
}

uint64_t sub_1CF730B58(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  unint64_t v6;
  uint64_t v7;

  v7 = *a1;
  v6 = a1[1];
  sub_1CF6A7B18(*a1, v6);
  return a5(v7, v6);
}

void sub_1CF730B9C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10();
  sub_1CF6A7B18(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_26();
}

void sub_1CF730BDC()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_21_9();
  OUTLINED_FUNCTION_5();
}

void sub_1CF730C14(uint64_t a1)
{
  __int128 v1[2];

  sub_1CF6ABBB4(a1, (uint64_t)v1);
  sub_1CF730C88(v1);
}

void sub_1CF730C4C(uint64_t a1@<X8>)
{
  uint64_t v1;

  OUTLINED_FUNCTION_10();
  sub_1CF6ABBB4(v1 + 48, a1);
  OUTLINED_FUNCTION_26();
}

void sub_1CF730C88(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 48;
  OUTLINED_FUNCTION_10();
  __swift_destroy_boxed_opaque_existential_0Tm(v3);
  sub_1CF68C850(a1, v3);
  swift_endAccess();
  OUTLINED_FUNCTION_26();
}

void sub_1CF730CD4()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1();
}

_QWORD *sub_1CF730D08()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *((_OWORD *)v0 + 1) = xmmword_1CF743C90;
  *((_OWORD *)v0 + 2) = xmmword_1CF743C90;
  OUTLINED_FUNCTION_10();
  v1 = v0[2];
  v2 = v0[3];
  *((_OWORD *)v0 + 1) = xmmword_1CF743C90;
  sub_1CF693FE0(v1, v2);
  OUTLINED_FUNCTION_10();
  v3 = v0[4];
  v4 = v0[5];
  *((_OWORD *)v0 + 2) = xmmword_1CF743C90;
  sub_1CF693FE0(v3, v4);
  v5 = type metadata accessor for MobileKeybagProvider();
  v6 = swift_allocObject();
  v0[9] = v5;
  v0[10] = &off_1E8CA33E0;
  v0[6] = v6;
  return v0;
}

void sub_1CF730DBC()
{
  uint64_t v0;
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (uint64_t *)(v0 + 16);
  OUTLINED_FUNCTION_10();
  v2 = *(_QWORD *)(v0 + 24);
  if (v2 >> 60 == 15)
    goto LABEL_4;
  v3 = *v1;
  v5 = *v1;
  OUTLINED_FUNCTION_302();
  OUTLINED_FUNCTION_302();
  v4 = sub_1CF73E5C8();
  sub_1CF693FE0(v3, v2);
  if ((v4 & 0x8000000000000000) == 0)
  {
    sub_1CF73E52C();
    sub_1CF6933C0(v5, v2);
LABEL_4:
    sub_1CF730B18(0, 0xF000000000000000);
    return;
  }
  __break(1u);
}

uint64_t sub_1CF730E68()
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
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v1 = OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_27_12(v1, v2, v3);
  v4 = v13;
  v5 = v14;
  __swift_project_boxed_opaque_existential_0Tm(v12, v13);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  if (v0)
    return OUTLINED_FUNCTION_24_10(v6, v7, v8);
  v10 = v6;
  v11 = v7;
  OUTLINED_FUNCTION_24_10(v6, v7, v8);
  OUTLINED_FUNCTION_75_3();
  OUTLINED_FUNCTION_25_10();
  OUTLINED_FUNCTION_26_10();
  sub_1CF730B18(v10, v11);
  OUTLINED_FUNCTION_75_3();
  OUTLINED_FUNCTION_25_10();
  OUTLINED_FUNCTION_20_12();
  sub_1CF730BDC();
  OUTLINED_FUNCTION_20_12();
  return OUTLINED_FUNCTION_26_10();
}

uint64_t sub_1CF730F48()
{
  _QWORD *v0;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
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
  void (*v18)(uint64_t);
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[8];

  OUTLINED_FUNCTION_2_0();
  if (v0[3] >> 60 == 15)
  {
    sub_1CF6AA5E0();
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_3_21();
    v26[5] = v26[0];
    v26[6] = v26[1];
    sub_1CF6ABB3C();
    OUTLINED_FUNCTION_3_9();
    OUTLINED_FUNCTION_3_0();
    sub_1CF73F780();
    return OUTLINED_FUNCTION_28_0();
  }
  else
  {
    OUTLINED_FUNCTION_2_0();
    v2 = v0[5];
    if (v2 >> 60 == 15)
    {
      v3 = OUTLINED_FUNCTION_304();
      sub_1CF6934BC(v3, v4);
      sub_1CF6AA5E0();
      OUTLINED_FUNCTION_3_0();
      OUTLINED_FUNCTION_1_21();
      OUTLINED_FUNCTION_18_16();
      v5 = OUTLINED_FUNCTION_3_9();
      OUTLINED_FUNCTION_1_18(v5, v6, v7, v8, v9, v10, v11, v12, v25);
      sub_1CF73F780();
      OUTLINED_FUNCTION_28_0();
      return OUTLINED_FUNCTION_29_9();
    }
    else
    {
      v13 = v0[4];
      v14 = OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_27_12(v14, v15, v16);
      v17 = v26[4];
      __swift_project_boxed_opaque_existential_0Tm(v26, v26[3]);
      v18 = *(void (**)(uint64_t))(v17 + 16);
      v19 = OUTLINED_FUNCTION_304();
      sub_1CF6A7B18(v19, v20);
      sub_1CF6A7B18(v13, v2);
      v21 = OUTLINED_FUNCTION_304();
      v18(v21);
      sub_1CF693FE0(v13, v2);
      v22 = OUTLINED_FUNCTION_29_9();
      return OUTLINED_FUNCTION_24_10(v22, v23, v24);
    }
  }
}

uint64_t sub_1CF731118(uint64_t a1)
{
  uint64_t v1;
  __int128 v3[2];

  sub_1CF6ABBB4(a1, (uint64_t)v3);
  OUTLINED_FUNCTION_10();
  __swift_destroy_boxed_opaque_existential_0Tm(v1 + 48);
  sub_1CF68C850(v3, v1 + 48);
  return swift_endAccess();
}

uint64_t RemoteUnlockKeypair.deinit()
{
  uint64_t v0;

  sub_1CF693FE0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  sub_1CF693FE0(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 48);
  return v0;
}

uint64_t RemoteUnlockKeypair.__deallocating_deinit()
{
  RemoteUnlockKeypair.deinit();
  return swift_deallocClassInstance();
}

void sub_1CF7311BC(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_1CF730AD8();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF7311E0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CF730B58(a1, a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t))sub_1CF730B18);
}

void sub_1CF7311FC(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  sub_1CF730B9C();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1CF731220(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CF730B58(a1, a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t))sub_1CF730BDC);
}

void sub_1CF73123C(uint64_t a1@<X8>)
{
  sub_1CF730C4C(a1);
  OUTLINED_FUNCTION_1();
}

uint64_t dispatch thunk of KeybagProvider.newKeypair()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of KeybagProvider.unlock(hostKey:deviceKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t type metadata accessor for MobileKeybagProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for KeybagUnsupportedKeybagProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for RemoteUnlockKeypair()
{
  return objc_opt_self();
}

uint64_t method lookup function for RemoteUnlockKeypair()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.hostKey.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.deviceKey.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.keybagProvider.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.populateWithNewKeypair()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.unlockDevice()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of RemoteUnlockKeypair.configure(newKeybagProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

char *OUTLINED_FUNCTION_5_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  return &a10;
}

unint64_t OUTLINED_FUNCTION_18_16()
{
  return sub_1CF6ABB3C();
}

uint64_t OUTLINED_FUNCTION_20_12()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1CF6933C0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_21_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v0;
  return sub_1CF693FE0(v3, v4);
}

uint64_t OUTLINED_FUNCTION_25_10()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1CF6934BC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_26_10()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1CF6933C0(v0, v1);
}

uint64_t OUTLINED_FUNCTION_27_12(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  return sub_1CF6ABBB4(v3, (uint64_t)va);
}

uint64_t sub_1CF73140C()
{
  uint64_t result;

  sub_1CF6CACDC();
  result = sub_1CF73F270();
  qword_1EFBA4000 = result;
  return result;
}

BOOL static BonjourBrowser.Mode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void BonjourBrowser.Mode.hash(into:)()
{
  sub_1CF73F7F8();
  OUTLINED_FUNCTION_1();
}

void _s19RemotePairingDevice14BonjourBrowserC4ModeO9hashValueSivg_0()
{
  sub_1CF73F7EC();
  OUTLINED_FUNCTION_102();
  sub_1CF73F810();
  OUTLINED_FUNCTION_24();
}

void BonjourBrowser.Change.kind.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t BonjourBrowser.Change.advert.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_42_10() + 20);
  return sub_1CF73155C(v3, a1);
}

uint64_t type metadata accessor for BonjourBrowser.Change()
{
  uint64_t result;

  result = qword_1EFBA4170;
  if (!qword_1EFBA4170)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CF73155C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void BonjourBrowser.Change.resolvedPairing.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_42_10() + 24));
  OUTLINED_FUNCTION_1();
}

uint64_t BonjourBrowser.__allocating_init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)(unsigned __int8 *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  BonjourBrowser.init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)(a1);
  return v2;
}

void BonjourBrowser.init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)(unsigned __int8 *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1CF73ECAC();
  MEMORY[0x1E0C80A78](v3);
  v4 = *a1;
  sub_1CF73EB68();
  *(_QWORD *)(v1 + 88) = 0;
  *(_QWORD *)(v1 + 96) = 0;
  sub_1CF73EB44();
  sub_1CF73EB20();
  __asm { BR              X11 }
}

uint64_t sub_1CF731704()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  *v3 = 0xD000000000000013;
  v3[1] = 0x80000001CF74FBF0;
  v3[2] = 0;
  v3[3] = 0;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CCEB48], v4);
  sub_1CF73ED3C();
  swift_allocObject();
  swift_retain();
  *(_QWORD *)(v0 + 16) = sub_1CF73ECC4();
  *(_BYTE *)(v0 + 24) = v6;
  *(_QWORD *)(v0 + 32) = v2;
  v8 = *(_QWORD *)(v7 - 88);
  sub_1CF6ABBB4(v8, v0 + 40);
  *(_BYTE *)(v0 + 80) = v5;
  swift_allocObject();
  swift_weakInit();
  v9 = v2;
  swift_retain();
  v10 = OUTLINED_FUNCTION_17_12();
  sub_1CF6A3AE0(v10);
  OUTLINED_FUNCTION_17_12();
  sub_1CF73ECB8();
  swift_release();

  __swift_destroy_boxed_opaque_existential_0Tm(v8);
  OUTLINED_FUNCTION_13_0();
  return v0;
}

uint64_t sub_1CF731868()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CF73188C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1CF731AB8(a1, a2);
    return swift_release();
  }
  return result;
}

uint64_t sub_1CF7318FC(uint64_t a1, uint64_t a2)
{
  return sub_1CF73188C(a1, a2);
}

uint64_t sub_1CF731904@<X0>(void (**a1)()@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)();

  result = sub_1CF7319E8();
  if (result)
  {
    v4 = result;
    v5 = v3;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v4;
    *(_QWORD *)(result + 24) = v5;
    v6 = sub_1CF6A3AF8;
  }
  else
  {
    v6 = 0;
  }
  *a1 = v6;
  a1[1] = (void (*)())result;
  return result;
}

uint64_t sub_1CF731968(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)();

  v1 = *a1;
  v2 = a1[1];
  if (*a1)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    v4 = sub_1CF6A3AF8;
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }
  sub_1CF6A3AE0(v1);
  return sub_1CF731A2C((uint64_t)v4, v3);
}

uint64_t sub_1CF7319E8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_2_0();
  v1 = *(_QWORD *)(v0 + 88);
  sub_1CF6A3AE0(v1);
  return v1;
}

uint64_t sub_1CF731A2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return sub_1CF693EC8(v5);
}

uint64_t (*sub_1CF731A7C())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1CF731AB8(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t));
  int64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;

  v5 = sub_1CF73ECF4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (uint64_t (*)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t)))((char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  LODWORD(v9) = sub_1CF73F0C0();
  if (qword_1EFBA09E8 == -1)
    goto LABEL_2;
LABEL_27:
  swift_once();
LABEL_2:
  if (os_log_type_enabled((os_log_t)qword_1EFBA4000, (os_log_type_t)v9))
  {
    v22 = v9;
    swift_retain_n();
    v10 = (_DWORD *)OUTLINED_FUNCTION_4_7();
    v21 = OUTLINED_FUNCTION_4_7();
    v23 = v21;
    *v10 = 136446210;
    __asm { BR              X10 }
  }
  v11 = a2 + 56;
  v12 = 1 << *(_BYTE *)(a2 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(a2 + 56);
  v9 = (unint64_t)(v12 + 63) >> 6;
  OUTLINED_FUNCTION_8_2();
  v15 = 0;
  if (v14)
  {
LABEL_7:
    v16 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    v17 = v16 | (v15 << 6);
    goto LABEL_22;
  }
  while (1)
  {
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    if (v18 >= v9)
      goto LABEL_24;
    v19 = *(_QWORD *)(v11 + 8 * v18);
    ++v15;
    if (!v19)
    {
      v15 = v18 + 1;
      if (v18 + 1 >= v9)
        goto LABEL_24;
      v19 = *(_QWORD *)(v11 + 8 * v15);
      if (!v19)
      {
        v15 = v18 + 2;
        if (v18 + 2 >= v9)
          goto LABEL_24;
        v19 = *(_QWORD *)(v11 + 8 * v15);
        if (!v19)
          break;
      }
    }
LABEL_21:
    v14 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v15 << 6);
LABEL_22:
    (*(void (**)(uint64_t (*)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t)), unint64_t, uint64_t))(v6 + 16))(v8, *(_QWORD *)(a2 + 48) + *(_QWORD *)(v6 + 72) * v17, v5);
    sub_1CF731DF4(a1, v8);
    (*(void (**)(uint64_t (*)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t)), uint64_t))(v6 + 8))(v8, v5);
    if (v14)
      goto LABEL_7;
  }
  v20 = v18 + 3;
  if (v20 < v9)
  {
    v19 = *(_QWORD *)(v11 + 8 * v20);
    if (!v19)
    {
      while (1)
      {
        v15 = v20 + 1;
        if (__OFADD__(v20, 1))
          goto LABEL_26;
        if (v15 >= v9)
          goto LABEL_24;
        v19 = *(_QWORD *)(v11 + 8 * v15);
        ++v20;
        if (v19)
          goto LABEL_21;
      }
    }
    v15 = v20;
    goto LABEL_21;
  }
LABEL_24:
  swift_release();
  OUTLINED_FUNCTION_17();
}

void sub_1CF731DF4(uint64_t a1, uint64_t (*a2)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t)))
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  os_log_type_t v36;
  NSObject *v37;
  void (*v38)(uint64_t, char *, uint64_t (*)(uint64_t, uint64_t, uint64_t));
  _BOOL4 v39;
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, char *, uint64_t (*)(uint64_t, uint64_t, uint64_t));
  char v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  uint8_t *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t, uint64_t);
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t));
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t));
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  os_log_type_t v86;
  _DWORD *v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t));
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  os_log_type_t v112;
  NSObject *v113;
  _BOOL8 v114;
  char *v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  void (*v123)(char *, uint64_t (*)(uint64_t, uint64_t, uint64_t));
  char *v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t (*v134)(uint64_t, uint64_t, uint64_t);
  _BYTE *v135;
  uint64_t v136;
  void (*v137)(uint64_t);
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void (*v141)(uint64_t);
  uint64_t v142;
  uint64_t v143;
  os_log_type_t v144;
  NSObject *v145;
  uint8_t *v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  _QWORD v152[4];
  _BYTE *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  uint64_t v168;
  void (*v169)(char *, uint64_t (*)(uint64_t, uint64_t, uint64_t));
  uint64_t v170;
  uint64_t v171;
  uint64_t (*v172)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t));
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t (*v176)(uint64_t, uint64_t, uint64_t);
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;

  v168 = a1;
  v152[1] = OUTLINED_FUNCTION_42_10();
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_14();
  v152[2] = v4;
  OUTLINED_FUNCTION_29_6();
  v156 = sub_1CF73EF04();
  v155 = *(_QWORD *)(v156 - 8);
  MEMORY[0x1E0C80A78](v156);
  OUTLINED_FUNCTION_14();
  v154 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA41B0);
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14();
  v161 = v7;
  OUTLINED_FUNCTION_29_6();
  v165 = type metadata accessor for DiscoveredBonjourAdvert();
  OUTLINED_FUNCTION_0_17();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_47_6();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_47_6();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_47_6();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v12);
  v162 = (char *)v152 - v13;
  OUTLINED_FUNCTION_29_6();
  v173 = sub_1CF73ED24();
  v14 = *(_QWORD *)(v173 - 8);
  MEMORY[0x1E0C80A78](v173);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_47_6();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_47_6();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_47_6();
  v166 = v18;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_47_6();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_47_6();
  v174 = v21;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v22);
  v164 = (uint64_t)v152 - v23;
  OUTLINED_FUNCTION_29_6();
  v24 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1CF73ECF4();
  v25 = *((_QWORD *)v24 - 1);
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_47_6();
  v176 = v27;
  OUTLINED_FUNCTION_62();
  v29 = MEMORY[0x1E0C80A78](v28);
  v31 = (char *)v152 - v30;
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_47_6();
  v163 = v32;
  OUTLINED_FUNCTION_62();
  MEMORY[0x1E0C80A78](v33);
  v35 = (char *)v152 - v34;
  v36 = sub_1CF73F0C0();
  if (qword_1EFBA09E8 != -1)
    swift_once();
  v37 = qword_1EFBA4000;
  v38 = *(void (**)(uint64_t, char *, uint64_t (*)(uint64_t, uint64_t, uint64_t)))(v25 + 16);
  v172 = (uint64_t (*)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t)))a2;
  OUTLINED_FUNCTION_37_8((uint64_t)v35, (uint64_t)a2);
  v39 = os_log_type_enabled(v37, v36);
  v171 = v14;
  v175 = v25;
  if (v39)
  {
    v167 = v31;
    v40 = (uint8_t *)OUTLINED_FUNCTION_4_7();
    v177 = OUTLINED_FUNCTION_4_7();
    *(_DWORD *)v40 = 136315138;
    v38(v163, v35, v24);
    v41 = sub_1CF73EF10();
    OUTLINED_FUNCTION_32_8(v41, v42);
    OUTLINED_FUNCTION_26_11(v43);
    sub_1CF73F2A0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_21_10(*(uint64_t (**)(uint64_t, uint64_t))(v175 + 8));
    OUTLINED_FUNCTION_33(&dword_1CF67E000, v37, v36, "Handling result change from bonjour browser: %s", v40);
    OUTLINED_FUNCTION_32_3();
    OUTLINED_FUNCTION_0_1();
  }
  OUTLINED_FUNCTION_21_10(*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
  OUTLINED_FUNCTION_37_8((uint64_t)v31, (uint64_t)v172);
  v44 = v176;
  OUTLINED_FUNCTION_37_8((uint64_t)v176, (uint64_t)v31);
  v172 = *(uint64_t (**)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t)))(v25 + 88);
  v45 = v172(v44, v24);
  v46 = *MEMORY[0x1E0CCEB88];
  v47 = v173;
  v48 = (uint64_t)v174;
  v49 = (void (*)(_QWORD, _QWORD, _QWORD))v38;
  if (v45 == (_DWORD)v46)
  {
    OUTLINED_FUNCTION_1_6((uint64_t)v44, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 96));
    OUTLINED_FUNCTION_69_3(v48, (uint64_t)v44);
    v50 = sub_1CF732F88(v48, v168);
    v51 = v170;
    if ((v50 & 1) != 0)
    {
      v52 = v24;
      v53 = v164;
      OUTLINED_FUNCTION_69_3(v164, v48);
      goto LABEL_17;
    }
    sub_1CF73F0E4();
    v64 = qword_1EFBA4000;
    v65 = v159;
    OUTLINED_FUNCTION_13_16(v159, v48);
    if (OUTLINED_FUNCTION_28_6())
    {
      v176 = v24;
      v66 = (uint8_t *)OUTLINED_FUNCTION_4_7();
      v67 = OUTLINED_FUNCTION_4_7();
      v167 = v31;
      v177 = v67;
      *(_DWORD *)v66 = 136315138;
      OUTLINED_FUNCTION_13_16(v166, v65);
      v68 = OUTLINED_FUNCTION_43_11();
      OUTLINED_FUNCTION_32_8(v68, v69);
      OUTLINED_FUNCTION_7_17(v70);
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v65, v47);
      OUTLINED_FUNCTION_33(&dword_1CF67E000, v64, (os_log_type_t)v51, "Received bonjour notification to add result %s, but result is not present in full results set. Ignoring", v66);
      OUTLINED_FUNCTION_32_3();
      OUTLINED_FUNCTION_0_1();
    }
    OUTLINED_FUNCTION_16_10(v65);
    v92 = v48;
LABEL_35:
    OUTLINED_FUNCTION_16_10(v92);
    v169(v31, v24);
    goto LABEL_55;
  }
  v54 = v14;
  v55 = *MEMORY[0x1E0CCEB98];
  if (v45 != (_DWORD)v55)
  {
    if (v45 == *MEMORY[0x1E0CCEB90])
    {
      v71 = v176;
      OUTLINED_FUNCTION_1_6((uint64_t)v176, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 96));
      v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA41C0);
      v73 = v24;
      v74 = (uint64_t)v71 + *(int *)(v72 + 48);
      v174 = (char *)v71 + *(int *)(v72 + 64);
      OUTLINED_FUNCTION_13_16(v166, (uint64_t)v71);
      OUTLINED_FUNCTION_13_16(v158, v74);
      v176 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v54 + 16);
      v75 = v163;
      OUTLINED_FUNCTION_45_10(v163, v176);
      v76 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t)))(v175 + 104);
      v76(v75, v55, v73);
      v77 = v168;
      sub_1CF731DF4(v168, v75);
      v78 = (void (*)(uint64_t, uint64_t (*)(uint64_t, uint64_t, uint64_t)))v169;
      v169((char *)v75, v73);
      v79 = v158;
      v176(v75, v158, v47);
      v76(v75, v46, v73);
      sub_1CF731DF4(v77, v75);
      v78(v75, v73);
      OUTLINED_FUNCTION_16_10(v79);
      OUTLINED_FUNCTION_16_10(v166);
      v78((uint64_t)v31, v73);
      v80 = sub_1CF73ECE8();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v80 - 8) + 8))(v174, v80);
    }
    else
    {
      v93 = (void (*)(uint64_t (*)(uint64_t, uint64_t, uint64_t), uint64_t (*)(uint64_t, uint64_t, uint64_t)))v169;
      v169(v31, v24);
      v93(v176, v24);
    }
    goto LABEL_55;
  }
  v56 = v176;
  OUTLINED_FUNCTION_1_6((uint64_t)v176, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 96));
  v14 = v54;
  v57 = v160;
  OUTLINED_FUNCTION_69_3(v160, (uint64_t)v56);
  if ((sub_1CF732F88(v57, v168) & 1) != 0)
  {
    sub_1CF73F0E4();
    v58 = qword_1EFBA4000;
    v59 = v157;
    OUTLINED_FUNCTION_13_16(v157, v57);
    if (OUTLINED_FUNCTION_28_6())
    {
      v176 = v24;
      v60 = (uint8_t *)OUTLINED_FUNCTION_4_7();
      v177 = OUTLINED_FUNCTION_4_7();
      v167 = v31;
      *(_DWORD *)v60 = 136315138;
      OUTLINED_FUNCTION_13_16(v166, v59);
      v61 = OUTLINED_FUNCTION_43_11();
      OUTLINED_FUNCTION_32_8(v61, v62);
      OUTLINED_FUNCTION_7_17(v63);
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v59, v47);
      OUTLINED_FUNCTION_33(&dword_1CF67E000, v58, (os_log_type_t)v57, "Received bonjour notification to remove result %s, but result is still present in full results set. Ignoring", v60);
      OUTLINED_FUNCTION_32_3();
      OUTLINED_FUNCTION_0_1();
    }
    OUTLINED_FUNCTION_16_10(v59);
    v92 = v57;
    goto LABEL_35;
  }
  v52 = v24;
  v53 = v164;
  OUTLINED_FUNCTION_69_3(v164, v57);
  v51 = v170;
LABEL_17:
  v81 = v166;
  OUTLINED_FUNCTION_45_10(v166, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16));
  v82 = *(unsigned __int8 *)(v51 + 24);
  LOBYTE(v177) = *(_BYTE *)(v51 + 24);
  v83 = *(id *)(v51 + 32);
  v84 = v81;
  v85 = v161;
  sub_1CF737E14(v84, (unsigned __int8 *)&v177, (uint64_t)v83, v161);
  if (__swift_getEnumTagSinglePayload(v85, 1, v165) != 1)
  {
    v88 = (uint64_t)v162;
    sub_1CF733EA8(v85, (uint64_t)v162);
    v89 = *(unsigned __int8 *)(v51 + 80);
    OUTLINED_FUNCTION_47_11(v88, (uint64_t)&v183);
    if (v89 == 1)
    {
      v90 = v53;
      v53 = *(_QWORD *)(v53 + *(int *)(v165 + 48));
      sub_1CF6DC3F0(v90, (uint64_t (*)(_QWORD))type metadata accessor for DiscoveredBonjourAdvert);
      v91 = OUTLINED_FUNCTION_15_16();
      if ((v53 & 1) != 0)
      {
        OUTLINED_FUNCTION_44_8(v91, (uint64_t (*)(_QWORD))type metadata accessor for DiscoveredBonjourAdvert);
LABEL_30:
        sub_1CF73F0CC();
        sub_1CF73E694();
        sub_1CF6DC3F0(v88, (uint64_t (*)(_QWORD))type metadata accessor for DiscoveredBonjourAdvert);
        OUTLINED_FUNCTION_14_11((uint64_t)v31);
LABEL_54:
        (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v164, v47);
        goto LABEL_55;
      }
    }
    else
    {
      sub_1CF6DC3F0(v53, (uint64_t (*)(_QWORD))type metadata accessor for DiscoveredBonjourAdvert);
      OUTLINED_FUNCTION_15_16();
    }
    v152[0] = v49;
    OUTLINED_FUNCTION_47_11(v48, (uint64_t)&v182);
    if ((v89 & 1) != 0)
    {
      OUTLINED_FUNCTION_20_13(v53);
      OUTLINED_FUNCTION_20_13(v48);
      v94 = v165;
    }
    else
    {
      v94 = v165;
      v95 = v53;
      v96 = *(_QWORD *)(v53 + *(int *)(v165 + 48));
      OUTLINED_FUNCTION_20_13(v95);
      OUTLINED_FUNCTION_20_13(v48);
      if ((v96 & 1) == 0)
        goto LABEL_30;
    }
    v167 = v31;
    v176 = v52;
    sub_1CF6ABBB4(v51 + 40, (uint64_t)&v177);
    v97 = v179;
    v98 = v180;
    __swift_project_boxed_opaque_existential_0Tm(&v177, v179);
    v99 = (uint64_t *)(v88 + *(int *)(v94 + 28));
    v101 = *v99;
    v100 = v99[1];
    sub_1CF6934BC(*v99, v100);
    sub_1CF73E634();
    v102 = v154;
    sub_1CF73EEF8();
    v103 = sub_1CF73EEE0();
    v105 = v104;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v155 + 8))(v102, v156);
    if (v105 >> 60 == 15)
    {
      __break(1u);
      JUMPOUT(0x1CF732F74);
    }
    v106 = (char *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(v98 + 32))(v101, v100, v103, v105, 1, v97, v98);
    sub_1CF693FE0(v103, v105);
    sub_1CF6933C0(v101, v100);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v177);
    v107 = v152[3];
    if (v106)
    {
      v108 = v106;
      v109 = CUPairedPeer.udid.getter();
      v111 = v110;

    }
    else
    {
      v109 = 0;
      v111 = 0;
    }
    v112 = sub_1CF73F0E4();
    v113 = qword_1EFBA4000;
    sub_1CF73155C((uint64_t)v162, v107);
    v114 = os_log_type_enabled(v113, v112);
    v174 = v106;
    if (v114)
    {
      swift_bridgeObjectRetain_n();
      v115 = v106;
      v169 = (void (*)(char *, uint64_t (*)(uint64_t, uint64_t, uint64_t)))v109;
      v116 = v115;
      v117 = OUTLINED_FUNCTION_4_7();
      v168 = OUTLINED_FUNCTION_4_7();
      v181 = v168;
      *(_DWORD *)v117 = 136446722;
      sub_1CF73E664();
      sub_1CF6935F8((unint64_t *)&qword_1ED8F7D08, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v118 = sub_1CF73F648();
      OUTLINED_FUNCTION_22_10(v118, v119);
      v177 = v120;
      sub_1CF73F2A0();
      v121 = swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_44_8(v121, (uint64_t (*)(_QWORD))type metadata accessor for DiscoveredBonjourAdvert);
      *(_WORD *)(v117 + 12) = 2082;
      v177 = (uint64_t)v106;
      v122 = v116;
      v123 = (void (*)(_QWORD, _QWORD))v169;
      v124 = v122;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA41B8);
      v125 = OUTLINED_FUNCTION_35_7();
      OUTLINED_FUNCTION_22_10(v125, v126);
      v177 = v127;
      OUTLINED_FUNCTION_36_8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v117 + 22) = 2082;
      v177 = (uint64_t)v123;
      v178 = v111;
      OUTLINED_FUNCTION_8_2();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA1940);
      v128 = OUTLINED_FUNCTION_35_7();
      OUTLINED_FUNCTION_22_10(v128, v129);
      v177 = v130;
      OUTLINED_FUNCTION_36_8();
      OUTLINED_FUNCTION_40_9();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF67E000, v113, v112, "Resolved bonjour advert %{public}s to identity %{public}s, udid %{public}s", (uint8_t *)v117, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_1();
    }
    OUTLINED_FUNCTION_44_8(v114, (uint64_t (*)(_QWORD))type metadata accessor for DiscoveredBonjourAdvert);
    v47 = v173;
    v131 = v167;
    v132 = v170;
    v14 = v171;
    v133 = (_QWORD *)v175;
    v134 = v176;
    v135 = v153;
    ((void (*)(_BYTE *, char *, uint64_t (*)(uint64_t, uint64_t, uint64_t)))v152[0])(v153, v167, v176);
    v136 = OUTLINED_FUNCTION_17_12();
    if (((unsigned int (*)(uint64_t))v172)(v136) == *MEMORY[0x1E0CCEB98])
    {
      OUTLINED_FUNCTION_3_7();
      v137 = (void (*)(uint64_t))v133[1];
      v138 = OUTLINED_FUNCTION_17_12();
      v137(v138);
      OUTLINED_FUNCTION_2_0();
      v139 = *(_QWORD *)(v132 + 88);
      if (v139)
      {
        OUTLINED_FUNCTION_1_22();
        *v135 = 1;
        OUTLINED_FUNCTION_30_10();
        OUTLINED_FUNCTION_25_11();
        sub_1CF693EC8(v139);

        sub_1CF6DC3F0((uint64_t)v135, (uint64_t (*)(_QWORD))type metadata accessor for BonjourBrowser.Change);
        v140 = &loc_1CF740000;
      }
      else
      {

        v140 = v162;
      }
      sub_1CF6DC3F0((uint64_t)v140, (uint64_t (*)(_QWORD))type metadata accessor for DiscoveredBonjourAdvert);
      ((void (*)(char *, uint64_t (*)(uint64_t, uint64_t, uint64_t)))v137)(v131, v134);
      (*(void (**)(uint64_t, uint64_t))(v171 + 8))(v164, v47);
      goto LABEL_55;
    }
    v141 = (void (*)(uint64_t))v133[1];
    v142 = OUTLINED_FUNCTION_17_12();
    v141(v142);
    if (*(_QWORD *)(*(_QWORD *)&v162[*(int *)(v165 + 52)] + 16))
    {
      OUTLINED_FUNCTION_3_7();
      OUTLINED_FUNCTION_2_0();
      v143 = *(_QWORD *)(v132 + 88);
      if (v143)
      {
        OUTLINED_FUNCTION_1_22();
        *v135 = 0;
LABEL_51:
        OUTLINED_FUNCTION_30_10();
        OUTLINED_FUNCTION_25_11();
        sub_1CF693EC8(v143);

        sub_1CF6DC3F0((uint64_t)v135, (uint64_t (*)(_QWORD))type metadata accessor for BonjourBrowser.Change);
        v151 = &loc_1CF740000;
LABEL_53:
        sub_1CF6DC3F0((uint64_t)v151, (uint64_t (*)(_QWORD))type metadata accessor for DiscoveredBonjourAdvert);
        ((void (*)(char *, uint64_t (*)(uint64_t, uint64_t, uint64_t)))v141)(v167, v134);
        goto LABEL_54;
      }
    }
    else
    {
      v144 = sub_1CF73F0E4();
      v145 = qword_1EFBA4000;
      v133 = (_QWORD *)v144;
      if (os_log_type_enabled((os_log_t)qword_1EFBA4000, v144))
      {
        OUTLINED_FUNCTION_8_2();
        v146 = (uint8_t *)OUTLINED_FUNCTION_4_7();
        v181 = OUTLINED_FUNCTION_4_7();
        *(_DWORD *)v146 = 136315138;
        v177 = v109;
        v178 = v111;
        OUTLINED_FUNCTION_8_2();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBA1940);
        v147 = OUTLINED_FUNCTION_35_7();
        OUTLINED_FUNCTION_22_10(v147, v148);
        v177 = v149;
        sub_1CF73F2A0();
        OUTLINED_FUNCTION_40_9();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_33(&dword_1CF67E000, v145, (os_log_type_t)v133, "Discovered bonjour advert for device %s but it is not visible through any valid interface. Treating as lost event.", v146);
        OUTLINED_FUNCTION_32_3();
        OUTLINED_FUNCTION_0_1();
      }
      OUTLINED_FUNCTION_3_7();
      v150 = v170;
      OUTLINED_FUNCTION_2_0();
      v143 = *(_QWORD *)(v150 + 88);
      if (v143)
      {
        OUTLINED_FUNCTION_1_22();
        *v135 = 1;
        goto LABEL_51;
      }
    }

    v151 = v162;
    goto LABEL_53;
  }
  sub_1CF733E68(v85);
  v86 = sub_1CF73F0CC();
  if (os_log_type_enabled((os_log_t)qword_1EFBA4000, v86))
  {
    v167 = v31;
    swift_retain_n();
    v87 = (_DWORD *)OUTLINED_FUNCTION_4_7();
    v177 = OUTLINED_FUNCTION_4_7();
    *v87 = 136315138;
    __asm { BR              X9 }
  }
  OUTLINED_FUNCTION_14_11((uint64_t)v31);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v53, v47);
LABEL_55:
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1CF732F88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_1CF73ED24();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_1CF6935F8(&qword_1EFBA41C8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEBC8], MEMORY[0x1E0CCEBD8]),
        v6 = sub_1CF73EE5C(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_1CF6935F8(&qword_1EFBA41D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEBC8], MEMORY[0x1E0CCEBE0]);
      v12 = sub_1CF73EEA4();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_1CF73310C()
{
  uint64_t v0;
  uint64_t result;

  OUTLINED_FUNCTION_2_0();
  if (*(_QWORD *)(v0 + 88))
    return sub_1CF73ECD0();
  result = sub_1CF73F450();
  __break(1u);
  return result;
}

void sub_1CF73319C()
{
  sub_1CF73ED30();
  OUTLINED_FUNCTION_1();
}

void BonjourBrowser.deinit()
{
  uint64_t v0;

  sub_1CF73ED30();
  swift_release();

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 40);
  sub_1CF693EC8(*(_QWORD *)(v0 + 88));
  OUTLINED_FUNCTION_1();
}

uint64_t BonjourBrowser.__deallocating_deinit()
{
  BonjourBrowser.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_1CF733220()
{
  unint64_t result;

  result = qword_1EFBA4008;
  if (!qword_1EFBA4008)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for BonjourBrowser.Mode, &type metadata for BonjourBrowser.Mode);
    atomic_store(result, (unint64_t *)&qword_1EFBA4008);
  }
  return result;
}

unint64_t sub_1CF733260()
{
  unint64_t result;

  result = qword_1EFBA4010;
  if (!qword_1EFBA4010)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for BonjourBrowser.Change.Kind, &type metadata for BonjourBrowser.Change.Kind);
    atomic_store(result, (unint64_t *)&qword_1EFBA4010);
  }
  return result;
}

uint64_t type metadata accessor for BonjourBrowser()
{
  return objc_opt_self();
}

uint64_t method lookup function for BonjourBrowser()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BonjourBrowser.__allocating_init(service:includePeerToPeer:netLinkManager:pairingManager:mode:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of BonjourBrowser.resultsChangedHandler.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of BonjourBrowser.start(queue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of BonjourBrowser.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

ValueMetadata *type metadata accessor for BonjourBrowser.Mode()
{
  return &type metadata for BonjourBrowser.Mode;
}

uint64_t *initializeBufferWithCopyOfBuffer for BonjourBrowser.Change(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _BYTE *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v42;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v40 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v40 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_1CF73E970();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
    v8[v11[5]] = v9[v11[5]];
    v12 = v11[6];
    v13 = &v8[v12];
    v14 = &v9[v12];
    v15 = sub_1CF73E664();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = v11[7];
    v17 = (uint64_t *)&v8[v16];
    v18 = (uint64_t *)&v9[v16];
    v19 = *v18;
    v20 = v18[1];
    sub_1CF6934BC(*v18, v20);
    *v17 = v19;
    v17[1] = v20;
    v21 = v11[8];
    v22 = *(void **)&v9[v21];
    *(_QWORD *)&v8[v21] = v22;
    v23 = v11[9];
    v42 = *(void **)&v9[v23];
    *(_QWORD *)&v8[v23] = v42;
    v24 = v11[10];
    v25 = &v8[v24];
    v26 = &v9[v24];
    v27 = *((_QWORD *)v26 + 1);
    *v25 = *(_QWORD *)v26;
    v25[1] = v27;
    v28 = v11[11];
    v29 = &v8[v28];
    v30 = &v9[v28];
    v31 = *((_QWORD *)v30 + 1);
    *v29 = *(_QWORD *)v30;
    v29[1] = v31;
    *(_QWORD *)&v8[v11[12]] = *(_QWORD *)&v9[v11[12]];
    *(_QWORD *)&v8[v11[13]] = *(_QWORD *)&v9[v11[13]];
    v32 = v11[14];
    v33 = *(void **)&v9[v32];
    *(_QWORD *)&v8[v32] = v33;
    *(_QWORD *)&v8[v11[15]] = *(_QWORD *)&v9[v11[15]];
    v34 = *(int *)(a3 + 24);
    v35 = *(void **)((char *)a2 + v34);
    *(uint64_t *)((char *)v4 + v34) = (uint64_t)v35;
    v36 = v22;
    v37 = v42;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v38 = v33;
    swift_bridgeObjectRetain();
    v39 = v35;
  }
  return v4;
}

void destroy for BonjourBrowser.Change(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1CF73E970();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7 = v4 + v6[6];
  v8 = sub_1CF73E664();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  sub_1CF6933C0(*(_QWORD *)(v4 + v6[7]), *(_QWORD *)(v4 + v6[7] + 8));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

_BYTE *initializeWithCopy for BonjourBrowser.Change(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;

  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = &a1[v5];
  v7 = &a2[v5];
  v8 = sub_1CF73E970();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  v9 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v6[v9[5]] = v7[v9[5]];
  v10 = v9[6];
  v11 = &v6[v10];
  v12 = &v7[v10];
  v13 = sub_1CF73E664();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = v9[7];
  v15 = (uint64_t *)&v6[v14];
  v16 = (uint64_t *)&v7[v14];
  v17 = *v16;
  v18 = v16[1];
  sub_1CF6934BC(*v16, v18);
  *v15 = v17;
  v15[1] = v18;
  v19 = v9[8];
  v20 = *(void **)&v7[v19];
  *(_QWORD *)&v6[v19] = v20;
  v21 = v9[9];
  v22 = *(void **)&v7[v21];
  *(_QWORD *)&v6[v21] = v22;
  v23 = v9[10];
  v24 = &v6[v23];
  v25 = &v7[v23];
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = v9[11];
  v28 = &v6[v27];
  v29 = &v7[v27];
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  *(_QWORD *)&v6[v9[12]] = *(_QWORD *)&v7[v9[12]];
  *(_QWORD *)&v6[v9[13]] = *(_QWORD *)&v7[v9[13]];
  v31 = v9[14];
  v32 = *(void **)&v7[v31];
  *(_QWORD *)&v6[v31] = v32;
  *(_QWORD *)&v6[v9[15]] = *(_QWORD *)&v7[v9[15]];
  v33 = *(int *)(a3 + 24);
  v34 = *(void **)&a2[v33];
  *(_QWORD *)&a1[v33] = v34;
  v35 = v20;
  v36 = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37 = v32;
  swift_bridgeObjectRetain();
  v38 = v34;
  return a1;
}

_BYTE *assignWithCopy for BonjourBrowser.Change(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CF73E970();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  v11 = v10[6];
  v12 = &v7[v11];
  v13 = &v8[v11];
  v14 = sub_1CF73E664();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = v10[7];
  v16 = (uint64_t *)&v7[v15];
  v17 = (uint64_t *)&v8[v15];
  v18 = *v17;
  v19 = v17[1];
  sub_1CF6934BC(*v17, v19);
  v20 = *v16;
  v21 = v16[1];
  *v16 = v18;
  v16[1] = v19;
  sub_1CF6933C0(v20, v21);
  v22 = v10[8];
  v23 = *(void **)&v7[v22];
  v24 = *(void **)&v8[v22];
  *(_QWORD *)&v7[v22] = v24;
  v25 = v24;

  v26 = v10[9];
  v27 = *(void **)&v7[v26];
  v28 = *(void **)&v8[v26];
  *(_QWORD *)&v7[v26] = v28;
  v29 = v28;

  v30 = v10[10];
  v31 = &v7[v30];
  v32 = &v8[v30];
  *v31 = *v32;
  v31[1] = v32[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v33 = v10[11];
  v34 = &v7[v33];
  v35 = &v8[v33];
  *v34 = *v35;
  v34[1] = v35[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v10[12]] = *(_QWORD *)&v8[v10[12]];
  *(_QWORD *)&v7[v10[13]] = *(_QWORD *)&v8[v10[13]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v36 = v10[14];
  v37 = *(void **)&v8[v36];
  v38 = *(void **)&v7[v36];
  *(_QWORD *)&v7[v36] = v37;
  v39 = v37;

  *(_QWORD *)&v7[v10[15]] = *(_QWORD *)&v8[v10[15]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = *(int *)(a3 + 24);
  v41 = *(void **)&a1[v40];
  v42 = *(void **)&a2[v40];
  *(_QWORD *)&a1[v40] = v42;
  v43 = v42;

  return a1;
}

_BYTE *initializeWithTake for BonjourBrowser.Change(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CF73E970();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  v11 = v10[6];
  v12 = &v7[v11];
  v13 = &v8[v11];
  v14 = sub_1CF73E664();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  *(_OWORD *)&v7[v10[7]] = *(_OWORD *)&v8[v10[7]];
  *(_QWORD *)&v7[v10[8]] = *(_QWORD *)&v8[v10[8]];
  *(_QWORD *)&v7[v10[9]] = *(_QWORD *)&v8[v10[9]];
  *(_OWORD *)&v7[v10[10]] = *(_OWORD *)&v8[v10[10]];
  *(_OWORD *)&v7[v10[11]] = *(_OWORD *)&v8[v10[11]];
  *(_QWORD *)&v7[v10[12]] = *(_QWORD *)&v8[v10[12]];
  *(_QWORD *)&v7[v10[13]] = *(_QWORD *)&v8[v10[13]];
  *(_QWORD *)&v7[v10[14]] = *(_QWORD *)&v8[v10[14]];
  *(_QWORD *)&v7[v10[15]] = *(_QWORD *)&v8[v10[15]];
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

_BYTE *assignWithTake for BonjourBrowser.Change(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CF73E970();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = (int *)type metadata accessor for DiscoveredBonjourAdvert();
  v7[v10[5]] = v8[v10[5]];
  v11 = v10[6];
  v12 = &v7[v11];
  v13 = &v8[v11];
  v14 = sub_1CF73E664();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = v10[7];
  v16 = *(_QWORD *)&v7[v15];
  v17 = *(_QWORD *)&v7[v15 + 8];
  *(_OWORD *)&v7[v15] = *(_OWORD *)&v8[v15];
  sub_1CF6933C0(v16, v17);
  v18 = v10[8];
  v19 = *(void **)&v7[v18];
  *(_QWORD *)&v7[v18] = *(_QWORD *)&v8[v18];

  v20 = v10[9];
  v21 = *(void **)&v7[v20];
  *(_QWORD *)&v7[v20] = *(_QWORD *)&v8[v20];

  v22 = v10[10];
  v23 = &v7[v22];
  v24 = (uint64_t *)&v8[v22];
  v26 = *v24;
  v25 = v24[1];
  *v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  v27 = v10[11];
  v28 = &v7[v27];
  v29 = (uint64_t *)&v8[v27];
  v31 = *v29;
  v30 = v29[1];
  *v28 = v31;
  v28[1] = v30;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v10[12]] = *(_QWORD *)&v8[v10[12]];
  *(_QWORD *)&v7[v10[13]] = *(_QWORD *)&v8[v10[13]];
  swift_bridgeObjectRelease();
  v32 = v10[14];
  v33 = *(void **)&v7[v32];
  *(_QWORD *)&v7[v32] = *(_QWORD *)&v8[v32];

  *(_QWORD *)&v7[v10[15]] = *(_QWORD *)&v8[v10[15]];
  swift_bridgeObjectRelease();
  v34 = *(int *)(a3 + 24);
  v35 = *(void **)&a1[v34];
  *(_QWORD *)&a1[v34] = *(_QWORD *)&a2[v34];

  return a1;
}

uint64_t getEnumTagSinglePayload for BonjourBrowser.Change()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF733C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  unint64_t v8;
  int v9;

  v6 = OUTLINED_FUNCTION_24_11();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v3)
    return __swift_getEnumTagSinglePayload(v4 + *(int *)(a3 + 20), v3, v6);
  v8 = *(_QWORD *)(v4 + *(int *)(a3 + 24));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  v9 = v8 - 1;
  if (v9 < 0)
    v9 = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for BonjourBrowser.Change()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF733CB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  result = OUTLINED_FUNCTION_24_11();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 20), v4, v4, result);
  *(_QWORD *)(v5 + *(int *)(a4 + 24)) = v4;
  return result;
}

uint64_t sub_1CF733D20()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for DiscoveredBonjourAdvert();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t _s19RemotePairingDevice14BonjourBrowserC4ModeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF733DE8 + 4 * byte_1CF74AC4A[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CF733E1C + 4 * byte_1CF74AC45[v4]))();
}

uint64_t sub_1CF733E1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF733E24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF733E2CLL);
  return result;
}

uint64_t sub_1CF733E38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF733E40);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CF733E44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF733E4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BonjourBrowser.Change.Kind()
{
  return &type metadata for BonjourBrowser.Change.Kind;
}

uint64_t sub_1CF733E68(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA41B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CF733EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CF733EEC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_17_12()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_20_13(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);

  sub_1CF6DC3F0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_21_10@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 200) = a1;
  return a1(v1, v2);
}

void OUTLINED_FUNCTION_22_10(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_1CF68F110(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_25_11()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;

  sub_1CF6A3AE0((uint64_t)v0);
  return v0(v1);
}

uint64_t OUTLINED_FUNCTION_26_11(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

id OUTLINED_FUNCTION_30_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 - 160);
  *(_QWORD *)(v1 + *(int *)(v0 + 24)) = v3;
  return v3;
}

uint64_t OUTLINED_FUNCTION_35_7()
{
  return sub_1CF73EF10();
}

uint64_t OUTLINED_FUNCTION_37_8(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_40_9()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_42_10()
{
  return type metadata accessor for BonjourBrowser.Change();
}

uint64_t OUTLINED_FUNCTION_45_10@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_47_11@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CF73155C(a1, *(_QWORD *)(a2 - 256));
}

uint64_t sub_1CF733FCC()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  sub_1CF73F150();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_34();
  sub_1CF73ED84();
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_34();
  v4 = sub_1CF73F174();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_13();
  sub_1CF68F3BC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v0, *MEMORY[0x1E0DEF8D8], v4);
  sub_1CF73ED6C();
  sub_1CF6CE26C(&qword_1ED8F7D00, v1, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7CF0);
  sub_1CF6D96C4();
  sub_1CF73F2F4();
  result = sub_1CF73F18C();
  qword_1EFBA41D8 = result;
  return result;
}

id defaultPairingOperationQ.getter()
{
  if (qword_1EFBA09F0 != -1)
    swift_once();
  return (id)qword_1EFBA41D8;
}

uint64_t AttemptPairingPinCommand.pinAttempt.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1CF7341B4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6D657474416E6970 && a2 == 0xEA00000000007470)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1CF734244()
{
  return 0x6D657474416E6970;
}

uint64_t sub_1CF734264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF7341B4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CF73428C()
{
  sub_1CF734394();
  return sub_1CF73F864();
}

uint64_t sub_1CF7342B4()
{
  sub_1CF734394();
  return sub_1CF73F870();
}

void AttemptPairingPinCommand.encode(to:)()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_2();
  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA41E0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_15();
  __swift_project_boxed_opaque_existential_0Tm(v1, v1[3]);
  sub_1CF734394();
  sub_1CF73F858();
  sub_1CF73F5C4();
  OUTLINED_FUNCTION_10_15(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF734394()
{
  unint64_t result;

  result = qword_1EFBA41E8;
  if (!qword_1EFBA41E8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B80C, &type metadata for AttemptPairingPinCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA41E8);
  }
  return result;
}

void AttemptPairingPinCommand.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA41F0);
  OUTLINED_FUNCTION_152();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_15();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1CF734394();
  OUTLINED_FUNCTION_300();
  if (!v0)
  {
    v7 = sub_1CF73F4F8();
    v9 = v8;
    OUTLINED_FUNCTION_10_15(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    *v5 = v7;
    v5[1] = v9;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v3);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF73449C()
{
  AttemptPairingPinCommand.init(from:)();
}

void sub_1CF7344B0()
{
  AttemptPairingPinCommand.encode(to:)();
}

uint64_t PairingChallengeEvent.lastAttemptIncorrect.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PairingChallengeEvent.throttleSeconds.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

RemotePairingDevice::PairingChallengeEvent __swiftcall PairingChallengeEvent.init(lastAttemptIncorrect:throttleSeconds:)(Swift::Bool lastAttemptIncorrect, Swift::Int_optional throttleSeconds)
{
  uint64_t v2;
  RemotePairingDevice::PairingChallengeEvent result;

  *(_BYTE *)v2 = lastAttemptIncorrect;
  *(_QWORD *)(v2 + 8) = throttleSeconds.value;
  *(_BYTE *)(v2 + 16) = throttleSeconds.is_nil;
  result.throttleSeconds = throttleSeconds;
  result.lastAttemptIncorrect = lastAttemptIncorrect;
  return result;
}

uint64_t sub_1CF7344EC(uint64_t a1, uint64_t a2)
{
  char v6;

  if (a1 == 0xD000000000000014 && a2 == 0x80000001CF74FA90 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C74746F726874 && a2 == 0xEF73646E6F636553)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1CF7345F8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656C74746F726874;
  else
    return 0xD000000000000014;
}

uint64_t sub_1CF734644()
{
  char *v0;

  return sub_1CF7345F8(*v0);
}

uint64_t sub_1CF73464C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF7344EC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF734670()
{
  sub_1CF7347C4();
  return sub_1CF73F864();
}

uint64_t sub_1CF734698()
{
  sub_1CF7347C4();
  return sub_1CF73F870();
}

void PairingChallengeEvent.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA41F8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_99();
  __swift_project_boxed_opaque_existential_0Tm(v3, v3[3]);
  sub_1CF7347C4();
  sub_1CF73F858();
  sub_1CF73F5D0();
  if (!v0)
    sub_1CF73F5A0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v4);
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF7347C4()
{
  unint64_t result;

  result = qword_1EFBA4200;
  if (!qword_1EFBA4200)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B7BC, &type metadata for PairingChallengeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4200);
  }
  return result;
}

void PairingChallengeEvent.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  char v9;

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4208);
  OUTLINED_FUNCTION_152();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_34();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1CF7347C4();
  OUTLINED_FUNCTION_300();
  if (!v0)
  {
    v6 = sub_1CF73F504();
    v7 = sub_1CF73F4D4();
    v9 = v8;
    OUTLINED_FUNCTION_15_17();
    *(_BYTE *)v4 = v6 & 1;
    *(_QWORD *)(v4 + 8) = v7;
    *(_BYTE *)(v4 + 16) = v9 & 1;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF73490C()
{
  PairingChallengeEvent.init(from:)();
}

void sub_1CF734920()
{
  PairingChallengeEvent.encode(to:)();
}

uint64_t sub_1CF734934()
{
  sub_1CF734A38();
  return sub_1CF73F864();
}

uint64_t sub_1CF73495C()
{
  sub_1CF734A38();
  return sub_1CF73F870();
}

uint64_t CancelPairingCommand.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4210);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_13();
  __swift_project_boxed_opaque_existential_0Tm(a1, a1[3]);
  sub_1CF734A38();
  sub_1CF73F858();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
}

unint64_t sub_1CF734A38()
{
  unint64_t result;

  result = qword_1EFBA4218;
  if (!qword_1EFBA4218)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B76C, &type metadata for CancelPairingCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4218);
  }
  return result;
}

uint64_t CancelPairingCommand.init(from:)(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t sub_1CF734A98(uint64_t a1)
{
  return CancelPairingCommand.init(from:)(a1);
}

uint64_t sub_1CF734AAC(_QWORD *a1)
{
  return CancelPairingCommand.encode(to:)(a1);
}

uint64_t sub_1CF734AC0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 0x7974706D65 && a2 == 0xE500000000000000;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 2003789939 && a2 == 0xE400000000000000;
    if (v6 || (sub_1CF73F690() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x73736563637573 && a2 == 0xE700000000000000;
      if (v7 || (sub_1CF73F690() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6572756C696166 && a2 == 0xE700000000000000)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_1CF73F690();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_1CF734C5C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CF734C8C + 4 * byte_1CF74AE00[a1]))(0x7974706D65, 0xE500000000000000);
}

uint64_t sub_1CF734C8C()
{
  return 2003789939;
}

uint64_t sub_1CF734C9C()
{
  return 0x73736563637573;
}

uint64_t sub_1CF734CB4()
{
  return 0x6572756C696166;
}

uint64_t sub_1CF734CCC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1CF734D48()
{
  return 0x726F727265;
}

uint64_t sub_1CF734D5C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 7235952 && a2 == 0xE300000000000000;
  if (v2 || (sub_1CF73F690() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x44676E69646E6573 && a2 == 0xED00006563697665)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1CF734E5C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x44676E69646E6573;
  else
    return 7235952;
}

uint64_t sub_1CF734E98()
{
  unsigned __int8 *v0;

  return sub_1CF734C5C(*v0);
}

uint64_t sub_1CF734EA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF734AC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF734EC4()
{
  sub_1CF7354E0();
  return sub_1CF73F864();
}

uint64_t sub_1CF734EEC()
{
  sub_1CF7354E0();
  return sub_1CF73F870();
}

uint64_t sub_1CF734F14()
{
  sub_1CF735614();
  return sub_1CF73F864();
}

uint64_t sub_1CF734F3C()
{
  sub_1CF735614();
  return sub_1CF73F870();
}

uint64_t sub_1CF734F68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF734CCC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CF734F90()
{
  sub_1CF735560();
  return sub_1CF73F864();
}

uint64_t sub_1CF734FB8()
{
  sub_1CF735560();
  return sub_1CF73F870();
}

void sub_1CF734FE0()
{
  sub_1CF73F7EC();
  sub_1CF73F7F8();
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_24();
}

uint64_t sub_1CF735014()
{
  char *v0;

  return sub_1CF734E5C(*v0);
}

uint64_t sub_1CF73501C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF734D5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CF735040()
{
  sub_1CF7355D8();
  return sub_1CF73F864();
}

uint64_t sub_1CF735068()
{
  sub_1CF7355D8();
  return sub_1CF73F870();
}

uint64_t sub_1CF735090()
{
  sub_1CF73559C();
  return sub_1CF73F864();
}

uint64_t sub_1CF7350B8()
{
  sub_1CF73559C();
  return sub_1CF73F870();
}

void CodableDeviceInitiatedPairingBeaconingSessionEvent.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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

  OUTLINED_FUNCTION_2();
  v16 = v0;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4220);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_13_17(v4, v15);
  sub_1CF73E79C();
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4228);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4230);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_14();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4238);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_34();
  type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_34();
  v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4240);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_13();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1CF7354E0();
  sub_1CF73F858();
  sub_1CF73551C(v16, v12);
  v14 = (char *)sub_1CF7352AC + 4 * byte_1CF74AE04[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_1CF7352AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_25_12();
  v1 = *(_QWORD *)(v0 - 184);
  v2 = *(_QWORD *)(v0 - 104);
  OUTLINED_FUNCTION_9_15();
  *(_BYTE *)(v0 - 68) = 0;
  v3 = *(_QWORD *)(v0 - 168);
  v4 = *(_QWORD *)(v0 - 96);
  sub_1CF73F5C4();
  swift_bridgeObjectRelease();
  if (!v4)
  {
    *(_BYTE *)(v0 - 69) = 1;
    sub_1CF73F588();
  }
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 176) + 8))(v1, v3);
  v5 = OUTLINED_FUNCTION_18_17();
  v6(v5, v2);
  OUTLINED_FUNCTION_0_0();
}

uint64_t type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent()
{
  uint64_t result;

  result = qword_1EFBA4318;
  if (!qword_1EFBA4318)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1CF7354E0()
{
  unint64_t result;

  result = qword_1EFBA4248;
  if (!qword_1EFBA4248)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B71C, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4248);
  }
  return result;
}

uint64_t sub_1CF73551C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1CF735560()
{
  unint64_t result;

  result = qword_1EFBA4250;
  if (!qword_1EFBA4250)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B6CC, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4250);
  }
  return result;
}

unint64_t sub_1CF73559C()
{
  unint64_t result;

  result = qword_1EFBA4260;
  if (!qword_1EFBA4260)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B67C, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4260);
  }
  return result;
}

unint64_t sub_1CF7355D8()
{
  unint64_t result;

  result = qword_1EFBA4268;
  if (!qword_1EFBA4268)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B62C, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4268);
  }
  return result;
}

unint64_t sub_1CF735614()
{
  unint64_t result;

  result = qword_1EFBA4270;
  if (!qword_1EFBA4270)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B5DC, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4270);
  }
  return result;
}

void CodableDeviceInitiatedPairingBeaconingSessionEvent.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  char *v25;
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
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42[9];
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
  uint64_t v53;

  OUTLINED_FUNCTION_2();
  v53 = v0;
  v3 = v2;
  v46 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4278);
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_14();
  v48 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4280);
  v42[7] = *(_QWORD *)(v8 - 8);
  v42[8] = v8;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_13_17(v10, v42[0]);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4288);
  v49 = *(_QWORD *)(v43 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_14();
  v51 = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4290);
  v42[5] = *(_QWORD *)(v13 - 8);
  v42[6] = v13;
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_14();
  v47 = v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4298);
  v50 = *(_QWORD *)(v16 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_99();
  v18 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  OUTLINED_FUNCTION_3();
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0C80A78](v20);
  v25 = (char *)v42 - v24;
  MEMORY[0x1E0C80A78](v23);
  v27 = (char *)v42 - v26;
  v28 = v3[3];
  v52 = v3;
  __swift_project_boxed_opaque_existential_0Tm(v3, v28);
  sub_1CF7354E0();
  v29 = v53;
  sub_1CF73F840();
  if (!v29)
  {
    v42[2] = (uint64_t)v25;
    v42[3] = (uint64_t)v22;
    v42[4] = (uint64_t)v27;
    v30 = v1;
    v31 = sub_1CF73F564();
    v32 = *(_QWORD *)(v31 + 16);
    if (v32)
    {
      v53 = v1;
      v42[1] = 0;
      v33 = *(unsigned __int8 *)(v31 + 32);
      sub_1CF6A6F50(1, v32, v31, v31 + 32, 0, (2 * v32) | 1);
      v35 = v34;
      v37 = v36;
      swift_bridgeObjectRelease();
      v38 = v18;
      if (v35 == v37 >> 1)
        __asm { BR              X9 }
      v30 = v53;
    }
    else
    {
      v38 = v18;
    }
    v39 = sub_1CF73F384();
    swift_allocError();
    v41 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA1470);
    *v41 = v38;
    sub_1CF73F4B0();
    sub_1CF73F378();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v41, *MEMORY[0x1E0DEC450], v39);
    swift_willThrow();
    OUTLINED_FUNCTION_13_2();
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v30, v16);
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v52);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF7359C8()
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
  uint64_t *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_25_12();
  OUTLINED_FUNCTION_4_19();
  if (v0)
  {
    OUTLINED_FUNCTION_13_2();
    JUMPOUT(0x1CF7359ACLL);
  }
  *(_BYTE *)(v2 - 68) = 0;
  v3 = sub_1CF73F4F8();
  v5 = v4;
  *(_BYTE *)(v2 - 69) = 1;
  v6 = sub_1CF73F4BC();
  *(_QWORD *)(v2 - 144) = v7;
  *(_QWORD *)(v2 - 136) = v6;
  v8 = *(_QWORD *)(v2 - 120);
  OUTLINED_FUNCTION_3_22(*(_QWORD *)(v2 - 128));
  OUTLINED_FUNCTION_13_2();
  (*(void (**)(_QWORD, uint64_t))(v8 + 8))(*(_QWORD *)(v2 - 96), v1);
  v9 = *(uint64_t **)(v2 - 240);
  *v9 = v3;
  v9[1] = v5;
  v10 = *(_QWORD *)(v2 - 144);
  v9[2] = *(_QWORD *)(v2 - 136);
  v9[3] = v10;
  swift_storeEnumTagMultiPayload();
  sub_1CF735C6C((uint64_t)v9, *(_QWORD *)(v2 - 224));
  JUMPOUT(0x1CF735C2CLL);
}

void sub_1CF735A08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_22_11();
  v2 = *(_QWORD *)(v1 - 144);
  OUTLINED_FUNCTION_4_19();
  if (!v0)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 200) + 8))(v2, *(_QWORD *)(v1 - 192));
    OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_3_22(*(_QWORD *)(v1 - 120));
    JUMPOUT(0x1CF735A5CLL);
  }
  JUMPOUT(0x1CF735998);
}

void sub_1CF735A64()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_24_12();
  v1 = *(_QWORD *)(v0 - 248);
  sub_1CF73F4A4();
  if (!v1)
  {
    sub_1CF73E79C();
    sub_1CF6CE26C(&qword_1EFBA42A0, (uint64_t (*)(uint64_t))MEMORY[0x1E0D4D250], MEMORY[0x1E0D4D268]);
    sub_1CF73F528();
    OUTLINED_FUNCTION_14_12();
    OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_10_15(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 120) + 8));
    swift_storeEnumTagMultiPayload();
    JUMPOUT(0x1CF735C20);
  }
  OUTLINED_FUNCTION_13_2();
  JUMPOUT(0x1CF7359ACLL);
}

void sub_1CF735C44()
{
  CodableDeviceInitiatedPairingBeaconingSessionEvent.init(from:)();
}

void sub_1CF735C58()
{
  CodableDeviceInitiatedPairingBeaconingSessionEvent.encode(to:)();
}

uint64_t sub_1CF735C6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CF735CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF735CD8(a1, a2, a3, (uint64_t (*)(void))sub_1CF6A7170, (uint64_t (*)(void))sub_1CF6A71AC);
}

uint64_t sub_1CF735CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF735CD8(a1, a2, a3, (uint64_t (*)(void))sub_1CF6A70F8, (uint64_t (*)(void))sub_1CF6A7134);
}

uint64_t sub_1CF735CD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

id sub_1CF735D0C(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 0x3Fu)
    return result;
  return result;
}

void destroy for PairingOutcome(uint64_t a1)
{
  sub_1CF6ACEC8(*(id *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s19RemotePairingDevice14PairingOutcomeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1CF735D0C(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PairingOutcome(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1CF735D0C(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1CF6ACEC8(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for PairingOutcome(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1CF6ACEC8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PairingOutcome(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >> 1 >= 0xFFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 8189;
    }
    else
    {
      v2 = ((*(unsigned __int8 *)(a1 + 16) >> 6) | (4
                                                  * ((*(_QWORD *)a1 >> 58) & 0x3C | (*(_QWORD *)a1 >> 1) & 3 | (((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1F) << 6)))) ^ 0x1FFF;
      if (v2 >= 0x1FFD)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for PairingOutcome(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 >> 1 > 0xFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 8190;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >> 1 >= 0xFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >> 1 >= 0xFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x7FF | ((-a2 & 0x1FFF) << 11);
      *(_QWORD *)result = ((v3 << 58) | (2 * v3)) & 0xF000000000000007;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = (v3 >> 5) & 0xFE;
    }
  }
  return result;
}

uint64_t sub_1CF735EF0(uint64_t a1)
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  v1 = *(unsigned __int8 *)(a1 + 16);
  v2 = (char)v1;
  v3 = v1 >> 6;
  if (v2 >= 0)
    return v3;
  else
    return ((*(_QWORD *)a1 >> 2) & 0xFFFFFFFE | *(_QWORD *)a1 & 1) + 2;
}

uint64_t sub_1CF735F18(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_1CF735F28(uint64_t result, unsigned int a2)
{
  char v2;

  if (a2 < 2)
  {
    v2 = *(_BYTE *)(result + 16) & 1 | ((_BYTE)a2 << 6);
    *(_QWORD *)result &= 0xFFFFFFFFFFFFFF9uLL;
    *(_BYTE *)(result + 16) = v2;
  }
  else
  {
    *(_QWORD *)result = (a2 - 2) & 1 | (8 * ((a2 - 2) >> 1));
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0x80;
  }
  return result;
}

void type metadata accessor for PairingOutcome()
{
  OUTLINED_FUNCTION_31();
}

void type metadata accessor for AttemptPairingPinCommand()
{
  OUTLINED_FUNCTION_31();
}

uint64_t getEnumTagSinglePayload for PairingChallengeEvent(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFF && a1[17])
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *a1;
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

uint64_t storeEnumTagSinglePayload for PairingChallengeEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

void type metadata accessor for PairingChallengeEvent()
{
  OUTLINED_FUNCTION_31();
}

void type metadata accessor for CancelPairingCommand()
{
  OUTLINED_FUNCTION_31();
}

id sub_1CF736030(id result, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
    return result;
  if (!a5)
  {
    swift_bridgeObjectRetain();
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

void destroy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1)
{
  sub_1CF736084(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
}

void sub_1CF736084(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  if (a5 == 1)
  {

  }
  else if (!a5)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t initializeWithCopy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1CF736030(*(id *)a2, v4, v5, v6, v7);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_BYTE *)(a2 + 32);
  sub_1CF736030(*(id *)a2, v4, v5, v6, v7);
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
  sub_1CF736084(v8, v9, v10, v11, v12);
  return a1;
}

uint64_t assignWithTake for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
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
  sub_1CF736084(v4, v6, v5, v7, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 33))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for DeviceInitiatedPairingBeaconingSessionEvent(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1CF736264(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 32) <= 1u)
    return *(unsigned __int8 *)(a1 + 32);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1CF73627C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
  }
  *(_BYTE *)(result + 32) = a2;
  return result;
}

void type metadata accessor for DeviceInitiatedPairingBeaconingSessionEvent()
{
  OUTLINED_FUNCTION_31();
}

uint64_t *initializeBufferWithCopyOfBuffer for CodableDeviceInitiatedPairingBeaconingSessionEvent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v12 = sub_1CF73E79C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        return a1;
      }
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      v9 = a2[2];
      v10 = a2[3];
      a1[2] = v9;
      a1[3] = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for CodableDeviceInitiatedPairingBeaconingSessionEvent(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v3 = sub_1CF73E79C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  else if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *initializeWithCopy for CodableDeviceInitiatedPairingBeaconingSessionEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    v10 = sub_1CF73E79C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
  }
  else
  {
    if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
    }
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[2];
    v9 = a2[3];
    a1[2] = v8;
    a1[3] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for CodableDeviceInitiatedPairingBeaconingSessionEvent(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_1CF736588((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      v7 = sub_1CF73E79C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      if (EnumCaseMultiPayload)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
      }
      *a1 = *a2;
      a1[1] = a2[1];
      a1[2] = a2[2];
      a1[3] = a2[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_1CF736588(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *initializeWithTake for CodableDeviceInitiatedPairingBeaconingSessionEvent(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_1CF73E79C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for CodableDeviceInitiatedPairingBeaconingSessionEvent(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1CF736588((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_1CF73E79C();
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

uint64_t sub_1CF7366EC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CF73E79C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF7367A8 + 4 * byte_1CF74AE11[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1CF7367DC + 4 * byte_1CF74AE0C[v4]))();
}

uint64_t sub_1CF7367DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF7367E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF7367ECLL);
  return result;
}

uint64_t sub_1CF7367F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF736800);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1CF736804(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF73680C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys;
}

ValueMetadata *type metadata accessor for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys()
{
  return &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys;
}

ValueMetadata *type metadata accessor for CancelPairingCommand.CodingKeys()
{
  return &type metadata for CancelPairingCommand.CodingKeys;
}

uint64_t _s19RemotePairingDevice50CodableDeviceInitiatedPairingBeaconingSessionEventO14ShowCodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1CF7368CC + 4 * byte_1CF74AE1B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CF736900 + 4 * byte_1CF74AE16[v4]))();
}

uint64_t sub_1CF736900(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF736908(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF736910);
  return result;
}

uint64_t sub_1CF73691C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF736924);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CF736928(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF736930(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PairingChallengeEvent.CodingKeys()
{
  return &type metadata for PairingChallengeEvent.CodingKeys;
}

uint64_t _s19RemotePairingDevice50CodableDeviceInitiatedPairingBeaconingSessionEventO17FailureCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1CF73698C + 4 * byte_1CF74AE20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CF7369AC + 4 * byte_1CF74AE25[v4]))();
}

_BYTE *sub_1CF73698C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CF7369AC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CF7369B4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CF7369BC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CF7369C4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CF7369CC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AttemptPairingPinCommand.CodingKeys()
{
  return &type metadata for AttemptPairingPinCommand.CodingKeys;
}

unint64_t sub_1CF7369EC()
{
  unint64_t result;

  result = qword_1EFBA4350;
  if (!qword_1EFBA4350)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B1E4, &type metadata for AttemptPairingPinCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4350);
  }
  return result;
}

unint64_t sub_1CF736A2C()
{
  unint64_t result;

  result = qword_1EFBA4358;
  if (!qword_1EFBA4358)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B29C, &type metadata for PairingChallengeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4358);
  }
  return result;
}

unint64_t sub_1CF736A6C()
{
  unint64_t result;

  result = qword_1EFBA4360;
  if (!qword_1EFBA4360)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B3A4, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4360);
  }
  return result;
}

unint64_t sub_1CF736AAC()
{
  unint64_t result;

  result = qword_1EFBA4368;
  if (!qword_1EFBA4368)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B4AC, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4368);
  }
  return result;
}

unint64_t sub_1CF736AEC()
{
  unint64_t result;

  result = qword_1EFBA4370;
  if (!qword_1EFBA4370)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B5B4, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4370);
  }
  return result;
}

unint64_t sub_1CF736B2C()
{
  unint64_t result;

  result = qword_1EFBA4378;
  if (!qword_1EFBA4378)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B4D4, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4378);
  }
  return result;
}

unint64_t sub_1CF736B6C()
{
  unint64_t result;

  result = qword_1EFBA4380;
  if (!qword_1EFBA4380)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B4FC, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.EmptyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4380);
  }
  return result;
}

unint64_t sub_1CF736BAC()
{
  unint64_t result;

  result = qword_1EFBA4388;
  if (!qword_1EFBA4388)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B41C, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4388);
  }
  return result;
}

unint64_t sub_1CF736BEC()
{
  unint64_t result;

  result = qword_1EFBA4390;
  if (!qword_1EFBA4390)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B444, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.ShowCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4390);
  }
  return result;
}

unint64_t sub_1CF736C2C()
{
  unint64_t result;

  result = qword_1EFBA4398;
  if (!qword_1EFBA4398)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B3CC, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4398);
  }
  return result;
}

unint64_t sub_1CF736C6C()
{
  unint64_t result;

  result = qword_1EFBA43A0;
  if (!qword_1EFBA43A0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B3F4, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.SuccessCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43A0);
  }
  return result;
}

unint64_t sub_1CF736CAC()
{
  unint64_t result;

  result = qword_1EFBA43A8;
  if (!qword_1EFBA43A8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B314, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43A8);
  }
  return result;
}

unint64_t sub_1CF736CEC()
{
  unint64_t result;

  result = qword_1EFBA43B0;
  if (!qword_1EFBA43B0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B33C, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.FailureCodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43B0);
  }
  return result;
}

unint64_t sub_1CF736D2C()
{
  unint64_t result;

  result = qword_1EFBA43B8;
  if (!qword_1EFBA43B8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B524, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43B8);
  }
  return result;
}

unint64_t sub_1CF736D6C()
{
  unint64_t result;

  result = qword_1EFBA43C0;
  if (!qword_1EFBA43C0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B54C, &type metadata for CodableDeviceInitiatedPairingBeaconingSessionEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43C0);
  }
  return result;
}

unint64_t sub_1CF736DAC()
{
  unint64_t result;

  result = qword_1EFBA43C8;
  if (!qword_1EFBA43C8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B2C4, &type metadata for CancelPairingCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43C8);
  }
  return result;
}

unint64_t sub_1CF736DEC()
{
  unint64_t result;

  result = qword_1EFBA43D0;
  if (!qword_1EFBA43D0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B2EC, &type metadata for CancelPairingCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43D0);
  }
  return result;
}

unint64_t sub_1CF736E2C()
{
  unint64_t result;

  result = qword_1EFBA43D8;
  if (!qword_1EFBA43D8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B20C, &type metadata for PairingChallengeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43D8);
  }
  return result;
}

unint64_t sub_1CF736E6C()
{
  unint64_t result;

  result = qword_1EFBA43E0;
  if (!qword_1EFBA43E0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B234, &type metadata for PairingChallengeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43E0);
  }
  return result;
}

unint64_t sub_1CF736EAC()
{
  unint64_t result;

  result = qword_1EFBA43E8;
  if (!qword_1EFBA43E8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B154, &type metadata for AttemptPairingPinCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43E8);
  }
  return result;
}

unint64_t sub_1CF736EEC()
{
  unint64_t result;

  result = qword_1EFBA43F0;
  if (!qword_1EFBA43F0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74B17C, &type metadata for AttemptPairingPinCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA43F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_18_17()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_22_11()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 2;
  return sub_1CF73559C();
}

unint64_t OUTLINED_FUNCTION_25_12()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 1;
  return sub_1CF7355D8();
}

uint64_t sub_1CF736F50()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1CF736F74(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  JSONDataBasedControlChannelTransport.send(message:invokingCompletionHandlerOn:completion:)(a1, a2, a3, a4, a5, (uint64_t)&protocol witness table for SecureSocketDataTransport);
  OUTLINED_FUNCTION_1();
}

void JSONDataBasedControlChannelTransport.send(message:invokingCompletionHandlerOn:completion:)(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  void (*v24)(uint64_t, unint64_t, uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t);
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;

  sub_1CF73E40C();
  OUTLINED_FUNCTION_21();
  sub_1CF73E400();
  OUTLINED_FUNCTION_168(&v28, a1);
  sub_1CF6F4860();
  v12 = sub_1CF73E3F4();
  v14 = v13;
  swift_release();
  sub_1CF6934BC(v12, v14);
  if (OUTLINED_FUNCTION_5_15() >= 0x10000)
  {
    v28 = 0;
    v29 = 0xE000000000000000;
    sub_1CF73F348();
    swift_bridgeObjectRelease();
    v28 = 0xD000000000000026;
    v29 = 0x80000001CF755920;
    v15 = OUTLINED_FUNCTION_5_15();
    OUTLINED_FUNCTION_297();
    v27 = v15;
    sub_1CF73F648();
    sub_1CF73EF58();
    swift_bridgeObjectRelease();
    sub_1CF73EF58();
    v30 = MEMORY[0x1E0DEA968];
    v31 = 1;
    sub_1CF692E68();
    swift_allocError();
    v17 = v16;
    LOBYTE(v27) = 3;
    v18 = ControlChannelConnectionError.Message.format(code:)((RemotePairingDevice::ControlChannelConnectionError::Code)&v27);
    sub_1CF692EA4((uint64_t)&v28);
    *(_BYTE *)v17 = 3;
    *(Swift::String *)(v17 + 8) = v18;
    *(_OWORD *)(v17 + 24) = 0u;
    *(_OWORD *)(v17 + 40) = 0u;
    *(_QWORD *)(v17 + 56) = 0;
    OUTLINED_FUNCTION_14_13();
    OUTLINED_FUNCTION_297();
    OUTLINED_FUNCTION_44_0();
    return;
  }
  if (qword_1ED8F7938 != -1)
    swift_once();
  v28 = qword_1ED8FF0F8;
  v29 = qword_1ED8FF100;
  sub_1CF6934BC(qword_1ED8FF0F8, qword_1ED8FF100);
  v19 = OUTLINED_FUNCTION_5_15();
  if ((v19 & 0x8000000000000000) == 0 && v19 < 0x10000)
  {
    sub_1CF714F60(bswap32(v19) >> 16);
    v20 = sub_1CF73E5C8();
    if (qword_1ED8F7930 != -1)
      swift_once();
    v26 = a5;
    if (v20 == qword_1ED8FF0F0)
    {
      sub_1CF73E5D4();
      OUTLINED_FUNCTION_297();
      v21 = v28;
      v22 = v29;
      v23 = (_QWORD *)OUTLINED_FUNCTION_16();
      v23[2] = a2;
      v23[3] = a3;
      v23[4] = a4;
      v24 = *(void (**)(uint64_t, unint64_t, uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t))(a6 + 24);
      sub_1CF6934BC(v21, v22);
      v25 = a2;
      swift_retain();
      v24(v21, v22, sub_1CF7378F0, v23, v26, a6);
      OUTLINED_FUNCTION_297();
      swift_release();
      OUTLINED_FUNCTION_15_18();
      OUTLINED_FUNCTION_15_18();
      return;
    }
    __break(1u);
  }
  OUTLINED_FUNCTION_3_1();
  sub_1CF73F444();
  __break(1u);
}

void sub_1CF737328(const void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  JSONDataBasedControlChannelTransport.send(message:invokingCompletionHandlerOn:completion:)(a1, a2, a3, a4, a5, (uint64_t)&protocol witness table for NWConnectionControlChannelTransport);
  OUTLINED_FUNCTION_1();
}

void sub_1CF73734C()
{
  sub_1CF6CACDC();
  qword_1ED8F78E0 = sub_1CF73F270();
  OUTLINED_FUNCTION_1();
}

void sub_1CF7373AC()
{
  if (qword_1ED8F7938 != -1)
    swift_once();
  __asm { BR              X13 }
}

uint64_t sub_1CF737464()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;

  v0 = sub_1CF73EF04();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF73EEF8();
  v4 = sub_1CF73EEE0();
  v6 = v5;
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    qword_1ED8FF0F8 = v4;
    unk_1ED8FF100 = v6;
  }
  return result;
}

uint64_t sub_1CF737528(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  _QWORD v19[2];
  _QWORD aBlock[6];

  v7 = sub_1CF73ED54();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CF73ED84();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a1;
  aBlock[4] = sub_1CF6DFE8C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CF6CC068;
  aBlock[3] = &block_descriptor_13;
  v16 = _Block_copy(aBlock);
  swift_retain();
  v17 = a1;
  sub_1CF73ED6C();
  v19[1] = MEMORY[0x1E0DEE9D8];
  sub_1CF6AA11C();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8F7A00);
  sub_1CF6A72FC();
  sub_1CF73F2F4();
  MEMORY[0x1D17D2D90](0, v14, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

void sub_1CF737710(void *a1, unint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
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
  char v61;
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
  uint64_t v78;
  uint64_t v79;
  char v80[160];
  _BYTE v81[152];

  if ((a3 & 1) != 0)
  {
    *(_QWORD *)v80 = a1;
    v5 = sub_1CF6F5484((uint64_t)v80);
    OUTLINED_FUNCTION_4_20(v5, v6, v7, v8, v9, v10, v11, v12, v39, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51,
      v52,
      v53,
      v54,
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
      v75,
      v76,
      v77,
      v78,
      v79,
      v80[0]);
    v13 = a1;
    OUTLINED_FUNCTION_3_23((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20, v40, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51,
      v52,
      v53,
      v54,
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      v61);
    sub_1CF6CE874(a1, a2, 1);
  }
  else
  {
    sub_1CF73E3E8();
    OUTLINED_FUNCTION_21();
    sub_1CF6934BC((uint64_t)a1, a2);
    sub_1CF73E3DC();
    sub_1CF6F4824();
    sub_1CF73E3D0();
    OUTLINED_FUNCTION_168(&v42, v81);
    OUTLINED_FUNCTION_168(v80, v81);
    v21 = sub_1CF73790C((uint64_t)v80);
    OUTLINED_FUNCTION_4_20(v21, v22, v23, v24, v25, v26, v27, v28, v39, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51,
      v52,
      v53,
      v54,
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      v61,
      v62,
      v63,
      v64,
      v65,
      v66,
      v67,
      v68,
      v69,
      v70,
      v71,
      v72,
      v73,
      v74,
      v75,
      v76,
      v77,
      v78,
      v79,
      v80[0]);
    v29 = sub_1CF737914((uint64_t)&v42, (uint64_t (*)(void))sub_1CF6934BC, (uint64_t (*)(void))sub_1CF6CA4D0, (uint64_t (*)(void))sub_1CF6CA5A4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1CF6C9F94);
    OUTLINED_FUNCTION_3_23(v29, v30, v31, v32, v33, v34, v35, v36, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51,
      v52,
      v53,
      v54,
      v55,
      v56,
      v57,
      v58,
      v59,
      v60,
      v61);
    swift_release();
    OUTLINED_FUNCTION_8_16();
    v38 = OUTLINED_FUNCTION_2_18(v37);
    OUTLINED_FUNCTION_2_18(v38);
  }
}

uint64_t sub_1CF737898()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF7378C4()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF7378F0(void *a1)
{
  uint64_t *v1;

  return sub_1CF737528(a1, v1[2], v1[3], v1[4]);
}

uint64_t dispatch thunk of JSONDataBasedControlChannelTransport.receive(minLength:maxLength:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of JSONDataBasedControlChannelTransport.send(content:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t sub_1CF73790C(uint64_t result)
{
  *(_BYTE *)(result + 146) = 0;
  return result;
}

uint64_t sub_1CF737914(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t (*a4)(void), uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  sub_1CF6CA3C4(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_WORD *)(a1 + 144), a2, a3,
    a4,
    a5);
  return a1;
}

uint64_t sub_1CF73798C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t block_copy_helper_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_13()
{
  return swift_release();
}

uint64_t sub_1CF7379D0()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CF7379FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_5_15()
{
  return sub_1CF73E5C8();
}

uint64_t sub_1CF737A2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1CF737A94(a1, MEMORY[0x1E0DEB418], a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1CF737A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_33_9(a1, a2, a3, a4, a5, a6, a7, a8, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C80);
  if (OUTLINED_FUNCTION_53())
    return v10;
  else
    return 0;
}

uint64_t sub_1CF737A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1CF737A94(a1, MEMORY[0x1E0DEB070], a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1CF737A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_33_9(a1, a2, a3, a4, a5, a6, a7, a8, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C80);
  v8 = OUTLINED_FUNCTION_53();
  v9 = v12;
  if (!v8)
    return 0;
  return v9;
}

double sub_1CF737AF0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _OWORD *a9@<X8>)
{
  double result;
  uint64_t v11;

  OUTLINED_FUNCTION_33_9(a1, a2, a3, a4, a5, a6, a7, a8, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C80);
  if ((OUTLINED_FUNCTION_53() & 1) == 0)
  {
    result = 0.0;
    *a9 = xmmword_1CF743C90;
  }
  return result;
}

uint64_t sub_1CF737B4C(unsigned int a1, int a2)
{
  return a2 & a1;
}

uint64_t sub_1CF737B54@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_1CF737B60(uint64_t result)
{
  _BYTE *v1;

  *v1 &= result;
  return result;
}

uint64_t sub_1CF737B70(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

BOOL sub_1CF737B80(char a1, unsigned __int8 a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1CF737B90(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1CF737B9C(unsigned __int8 a1, char a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1CF737BAC(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

unint64_t sub_1CF737BB8(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  BOOL v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  _QWORD v23[3];

  v4 = HIBYTE(a2) & 0xF;
  v5 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  if ((a2 & 0x1000000000000000) != 0)
  {
    v8 = sub_1CF6EDD1C(a1, a2, 10);
    v10 = v22;
    goto LABEL_39;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
      v7 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v7 = (unsigned __int8 *)sub_1CF73F390();
    v8 = (unint64_t)sub_1CF6EDB1C(v7, v5);
    v10 = v9 & 1;
    goto LABEL_39;
  }
  v23[0] = a1;
  v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (a1 == 43)
  {
    if (!v4)
      goto LABEL_52;
    if (v4 == 1 || (BYTE1(a1) - 48) > 9u)
      goto LABEL_36;
    v8 = (BYTE1(a1) - 48);
    v15 = v4 - 2;
    if (v15)
    {
      v16 = (unsigned __int8 *)v23 + 2;
      while (1)
      {
        v17 = *v16 - 48;
        if (v17 > 9)
          goto LABEL_36;
        if (!is_mul_ok(v8, 0xAuLL))
          goto LABEL_36;
        v14 = __CFADD__(10 * v8, v17);
        v8 = 10 * v8 + v17;
        if (v14)
          goto LABEL_36;
        v10 = 0;
        ++v16;
        if (!--v15)
          goto LABEL_39;
      }
    }
LABEL_38:
    v10 = 0;
    goto LABEL_39;
  }
  if (a1 != 45)
  {
    if (!v4 || (a1 - 48) > 9u)
      goto LABEL_36;
    v8 = (a1 - 48);
    v18 = v4 - 1;
    if (v18)
    {
      v20 = (unsigned __int8 *)v23 + 1;
      while (1)
      {
        v21 = *v20 - 48;
        if (v21 > 9)
          goto LABEL_36;
        if (!is_mul_ok(v8, 0xAuLL))
          goto LABEL_36;
        v14 = __CFADD__(10 * v8, v21);
        v8 = 10 * v8 + v21;
        if (v14)
          goto LABEL_36;
        v10 = 0;
        ++v20;
        if (!--v18)
          goto LABEL_39;
      }
    }
    goto LABEL_38;
  }
  if (v4)
  {
    if (v4 != 1 && (BYTE1(a1) - 48) <= 9u)
    {
      v2 = 0;
      v8 = -(uint64_t)(BYTE1(a1) - 48);
      if (BYTE1(a1) == 48)
      {
        v11 = v4 - 2;
        if (v11)
        {
          v12 = (unsigned __int8 *)v23 + 2;
          while (1)
          {
            v13 = *v12 - 48;
            if (v13 > 9)
              goto LABEL_36;
            if (!is_mul_ok(v8, 0xAuLL))
              goto LABEL_36;
            v14 = 10 * v8 >= v13;
            v8 = 10 * v8 - v13;
            if (!v14)
              goto LABEL_36;
            v10 = 0;
            ++v12;
            if (!--v11)
              goto LABEL_39;
          }
        }
        goto LABEL_38;
      }
      goto LABEL_53;
    }
LABEL_36:
    v8 = 0;
    v10 = 1;
    goto LABEL_39;
  }
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  v10 = 1;
  v8 = v2;
LABEL_39:
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
    return 0;
  else
    return v8;
}

void sub_1CF737E14(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void (*v43)(char *, uint64_t);
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
  unint64_t v54;
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
  os_log_type_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int *v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t);
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  char v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(uint64_t, uint64_t, uint64_t);
  char v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  id v110;
  void *v111;
  id v112;
  char v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int *v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  void (*v137)(uint64_t, uint64_t, uint64_t);
  void (*v138)(char *, uint64_t);
  char *v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161[4];
  char v162;
  _OWORD v163[2];

  v152 = a4;
  v153 = a3;
  v156 = sub_1CF73EA00();
  v160 = *(_QWORD *)(v156 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_101();
  v159 = v7 - v8;
  v10 = MEMORY[0x1E0C80A78](v9);
  v149 = (uint64_t)&v132 - v11;
  MEMORY[0x1E0C80A78](v10);
  v155 = (char *)&v132 - v12;
  v145 = OUTLINED_FUNCTION_45_6();
  v144 = *(_QWORD *)(v145 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_14();
  v143 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2048);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_14();
  v154 = v16;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED8F7D10);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_14();
  v151 = v18;
  v150 = OUTLINED_FUNCTION_27();
  v146 = *(_QWORD *)(v150 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_14();
  v148 = v20;
  v21 = sub_1CF73ED00();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_34();
  v25 = v24 - v23;
  v26 = sub_1CF73EA18();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_101();
  v30 = v28 - v29;
  v32 = MEMORY[0x1E0C80A78](v31);
  v34 = (char *)&v132 - v33;
  MEMORY[0x1E0C80A78](v32);
  v36 = (char *)&v132 - v35;
  v157 = OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_14();
  v147 = v38;
  v39 = *a2;
  v158 = a1;
  sub_1CF73ED18();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 88))(v25, v21) != *MEMORY[0x1E0CCEBA8])
  {
    OUTLINED_FUNCTION_32_9(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
    sub_1CF73F0CC();
    if (qword_1EFBA0A00 != -1)
      swift_once();
    OUTLINED_FUNCTION_39_7();
    OUTLINED_FUNCTION_17_13();
    v44 = OUTLINED_FUNCTION_7_18();
    OUTLINED_FUNCTION_1_23(v44);
    goto LABEL_7;
  }
  v140 = v39;
  OUTLINED_FUNCTION_32_9(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 96));
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v36, v25, v26);
  OUTLINED_FUNCTION_10_2();
  v40 = OUTLINED_FUNCTION_6_18();
  v42 = v41;
  OUTLINED_FUNCTION_28_8((uint64_t)v34);
  if (v42)
  {
    v43 = *(void (**)(char *, uint64_t))(v27 + 8);
    OUTLINED_FUNCTION_18_18((uint64_t)v34);
  }
  else
  {
    v50 = sub_1CF73EA0C();
    v51 = OUTLINED_FUNCTION_10_2();
    sub_1CF6AF7E4(v51, v52, v50);
    v40 = v53;
    v42 = v54;
    OUTLINED_FUNCTION_11_3();
    v43 = *(void (**)(char *, uint64_t))(v27 + 8);
    OUTLINED_FUNCTION_18_18((uint64_t)v34);
    if (!v42)
    {
      v82 = v43;
      v83 = v36;
      v84 = v26;
LABEL_28:
      v45 = v152;
      sub_1CF73F0CC();
      v46 = v157;
      if (qword_1EFBA0A00 != -1)
        swift_once();
      OUTLINED_FUNCTION_39_7();
      OUTLINED_FUNCTION_17_13();
      v85 = OUTLINED_FUNCTION_7_18();
      OUTLINED_FUNCTION_1_23(v85);
      v82(v83, v84);
      goto LABEL_8;
    }
  }
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_6_18();
  v56 = v55;
  OUTLINED_FUNCTION_28_8(v30);
  if (v56)
  {
    OUTLINED_FUNCTION_18_18(v30);
    v57 = v151;
    goto LABEL_14;
  }
  v58 = sub_1CF73EA0C();
  v59 = OUTLINED_FUNCTION_19_13();
  sub_1CF6AF7E4(v59, v60, v58);
  v62 = v61;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_18_18(v30);
  v57 = v151;
  if (!v62)
  {
    v82 = v43;
    v83 = v36;
    v84 = v26;
    OUTLINED_FUNCTION_57();
    goto LABEL_28;
  }
LABEL_14:
  sub_1CF73E628();
  v63 = v150;
  v64 = v26;
  if (__swift_getEnumTagSinglePayload(v57, 1, v150) == 1)
  {
    OUTLINED_FUNCTION_11_3();
    sub_1CF693ED8(v57, qword_1ED8F7D10);
    v65 = sub_1CF73F0CC();
    if (qword_1EFBA0A00 != -1)
      swift_once();
    v66 = qword_1EFBA43F8;
    v67 = v65;
    if (os_log_type_enabled((os_log_t)qword_1EFBA43F8, v65))
    {
      swift_bridgeObjectRetain();
      v68 = (uint8_t *)OUTLINED_FUNCTION_4_7();
      v69 = OUTLINED_FUNCTION_4_7();
      v139 = v36;
      *(_QWORD *)&v163[0] = v69;
      *(_DWORD *)v68 = 136446210;
      swift_bridgeObjectRetain();
      sub_1CF68F110(v40, v42, (uint64_t *)v163);
      v161[0] = v70;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CF67E000, v66, v67, "Unable to turn identifier %{public}s into UUID object", v68, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_1();
    }
    OUTLINED_FUNCTION_57();
    OUTLINED_FUNCTION_17_13();
    v78 = OUTLINED_FUNCTION_7_18();
    OUTLINED_FUNCTION_1_23(v78);
    OUTLINED_FUNCTION_31_7();
LABEL_7:
    v45 = v152;
    v46 = v157;
LABEL_8:
    v47 = v45;
    v48 = 1;
    v49 = v46;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_57();
  v71 = v57;
  v72 = v146;
  v73 = *(void (**)(uint64_t, uint64_t, uint64_t))(v146 + 32);
  v73(v148, v71, v63);
  v74 = sub_1CF73E514();
  v76 = v75;
  OUTLINED_FUNCTION_11_3();
  if (v76 >> 60 == 15)
  {
    sub_1CF73F0CC();
    v46 = v157;
    if (qword_1EFBA0A00 != -1)
      swift_once();
    OUTLINED_FUNCTION_39_7();
    OUTLINED_FUNCTION_17_13();
    v77 = OUTLINED_FUNCTION_7_18();
    OUTLINED_FUNCTION_1_23(v77);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v148, v63);
    OUTLINED_FUNCTION_31_7();
    v45 = v152;
    goto LABEL_8;
  }
  v135 = v76;
  v136 = v74;
  v137 = v73;
  OUTLINED_FUNCTION_6_18();
  v79 = (int *)v157;
  if (v80)
  {
    OUTLINED_FUNCTION_25_13();
    v81 = OUTLINED_FUNCTION_16_11();
  }
  else
  {
    v81 = 0;
  }
  v87 = v154;
  v86 = (uint64_t)v155;
  v88 = v147;
  *(_QWORD *)(v147 + v79[8]) = v81;
  OUTLINED_FUNCTION_6_18();
  if (v89)
  {
    OUTLINED_FUNCTION_25_13();
    v90 = OUTLINED_FUNCTION_16_11();
  }
  else
  {
    v90 = 0;
  }
  *(_QWORD *)(v88 + v79[9]) = v90;
  v91 = OUTLINED_FUNCTION_6_18();
  if (v92)
  {
    v93 = sub_1CF737BB8(v91, v92);
    if ((v94 & 1) != 0)
      v95 = 0;
    else
      v95 = v93;
  }
  else
  {
    v95 = 0;
  }
  v138 = v43;
  *(_QWORD *)(v88 + v79[12]) = v95;
  v96 = OUTLINED_FUNCTION_6_18();
  v97 = (uint64_t *)(v88 + v79[11]);
  *v97 = v96;
  v97[1] = v98;
  v139 = v36;
  v99 = sub_1CF73EA24();
  v100 = (uint64_t *)(v88 + v79[10]);
  *v100 = v99;
  v100[1] = v101;
  v102 = sub_1CF73ECDC();
  v103 = *(_QWORD *)(v102 + 16);
  v134 = v102;
  v133 = v64;
  if (v103)
  {
    v146 = (*(unsigned __int8 *)(v160 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v160 + 80);
    v104 = v102 + v146;
    v142 = *(_QWORD *)(v160 + 72);
    v151 = *(_QWORD *)(v160 + 16);
    OUTLINED_FUNCTION_38_10(MEMORY[0x1E0DEE9D8]);
    while (1)
    {
      OUTLINED_FUNCTION_4_21(v87, v104);
      OUTLINED_FUNCTION_35_8(v87, 0);
      if (__swift_getEnumTagSinglePayload(v87, 1, v64) == 1)
        goto LABEL_77;
      v105 = *(void (**)(uint64_t, uint64_t, uint64_t))(v160 + 32);
      v105(v86, v87, v64);
      if (qword_1EFBA0858 != -1)
        swift_once();
      OUTLINED_FUNCTION_2_0();
      v106 = byte_1EFBA1169;
      if ((byte_1EFBA1168 & 1) != 0)
      {
        v107 = qword_1EFBA08D0;
        swift_bridgeObjectRetain();
        v108 = &qword_1EFBA1300;
        if (v107 != -1)
        {
          swift_once();
          v108 = &qword_1EFBA1300;
        }
      }
      else
      {
        v109 = qword_1ED8F6AE8;
        swift_bridgeObjectRetain();
        v108 = &qword_1ED8F6AE0;
        if (v109 != -1)
        {
          swift_once();
          v108 = &qword_1ED8F6AE0;
        }
      }
      v110 = (id)*v108;
      v111 = (void *)sub_1CF73EEB0();
      v112 = objc_msgSend(v110, sel_valueForKey_, v111);

      if (v112)
      {
        sub_1CF73F2DC();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v163, 0, sizeof(v163));
      }
      v64 = v156;
      sub_1CF691028((uint64_t)v163, (uint64_t)v161);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F7C80);
      if (OUTLINED_FUNCTION_53())
        v113 = v162;
      else
        v113 = 2;
      sub_1CF693ED8((uint64_t)v163, &qword_1ED8F7C80);
      swift_bridgeObjectRelease();
      if (v113 == 2)
      {
        v86 = (uint64_t)v155;
        if ((v106 & 1) != 0)
          goto LABEL_65;
      }
      else
      {
        v86 = (uint64_t)v155;
        if ((v113 & 1) != 0)
          goto LABEL_65;
      }
      v114 = sub_1CF73E9F4();
      if (InterfaceIndexCorrespondsToAppleNCMInterface(v114))
      {
        OUTLINED_FUNCTION_4_21(v149, v86);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        {
          v87 = v154;
          v115 = v141;
        }
        else
        {
          v115 = sub_1CF6C7250(0, *(_QWORD *)(v141 + 16) + 1, 1, v141);
          v87 = v154;
        }
        v117 = *(_QWORD *)(v115 + 16);
        v116 = *(_QWORD *)(v115 + 24);
        v118 = v117 + 1;
        if (v117 >= v116 >> 1)
        {
          v119 = OUTLINED_FUNCTION_13_18(v115, v116);
          v120 = v149;
          v141 = v119;
        }
        else
        {
          v141 = v115;
          v119 = v115;
          v120 = v149;
        }
        goto LABEL_69;
      }
LABEL_65:
      OUTLINED_FUNCTION_4_21(v159, v86);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
        v87 = v154;
        v121 = (uint64_t)v36;
      }
      else
      {
        v121 = sub_1CF6C7250(0, *((_QWORD *)v36 + 2) + 1, 1, (uint64_t)v36);
        v87 = v154;
      }
      v117 = *(_QWORD *)(v121 + 16);
      v122 = *(_QWORD *)(v121 + 24);
      v118 = v117 + 1;
      if (v117 >= v122 >> 1)
      {
        v119 = OUTLINED_FUNCTION_13_18(v121, v122);
        v120 = v159;
        v36 = (char *)v119;
      }
      else
      {
        v36 = (char *)v121;
        v119 = v121;
        v120 = v159;
      }
LABEL_69:
      *(_QWORD *)(v119 + 16) = v118;
      v123 = v142;
      v105(v119 + v146 + v117 * v142, v120, v64);
      (*(void (**)(uint64_t, uint64_t))(v160 + 8))(v86, v64);
      v104 += v123;
      if (!--v103)
        goto LABEL_76;
    }
  }
  OUTLINED_FUNCTION_38_10(MEMORY[0x1E0DEE9D8]);
LABEL_76:
  OUTLINED_FUNCTION_35_8(v87, 1);
LABEL_77:
  swift_bridgeObjectRelease();
  v124 = v143;
  v125 = v158;
  sub_1CF73ED0C();
  v126 = OUTLINED_FUNCTION_7_18();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v126 - 8) + 8))(v125, v126);
  v138(v139, v133);
  v127 = v147;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v144 + 32))(v147, v124, v145);
  v128 = (int *)v157;
  *(_BYTE *)(v127 + *(int *)(v157 + 20)) = v140;
  v137(v127 + v128[6], v148, v150);
  v129 = (uint64_t *)(v127 + v128[7]);
  v130 = v135;
  *v129 = v136;
  v129[1] = v130;
  *(_QWORD *)(v127 + v128[13]) = v36;
  *(_QWORD *)(v127 + v128[15]) = v141;
  v131 = v152;
  *(_QWORD *)(v127 + v128[14]) = v153;
  sub_1CF733EA8(v127, v131);
  v47 = v131;
  v48 = 0;
  v49 = (uint64_t)v128;
LABEL_9:
  __swift_storeEnumTagSinglePayload(v47, v48, 1, v49);
  OUTLINED_FUNCTION_17();
}

BOOL DiscoveredBonjourAdvert.isValid.getter()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_0_25() + 52)) + 16) != 0;
}

uint64_t type metadata accessor for DiscoveredBonjourAdvert()
{
  uint64_t result;

  result = qword_1EFBA4458;
  if (!qword_1EFBA4458)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CF738B68()
{
  uint64_t result;

  sub_1CF6CACDC();
  result = sub_1CF73F270();
  qword_1EFBA43F8 = result;
  return result;
}

uint64_t DiscoveredBonjourAdvert.endpoint.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_45_6();
  v0 = OUTLINED_FUNCTION_69();
  return OUTLINED_FUNCTION_65(v0, v1, v2, v3);
}

uint64_t DiscoveredBonjourAdvert.service.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = OUTLINED_FUNCTION_0_25();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t DiscoveredBonjourAdvert.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_27();
  v0 = OUTLINED_FUNCTION_69();
  return OUTLINED_FUNCTION_65(v0, v1, v2, v3);
}

void DiscoveredBonjourAdvert.authTag.getter()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_0_25();
  v0 = OUTLINED_FUNCTION_69();
  sub_1CF6934BC(v0, v1);
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void DiscoveredBonjourAdvert.wireProtocolVersion.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_0_25() + 32));
  OUTLINED_FUNCTION_1();
}

void DiscoveredBonjourAdvert.minimumSupportedWireProtocolVersion.getter()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_0_25() + 36));
  OUTLINED_FUNCTION_1();
}

void DiscoveredBonjourAdvert.userAssignedName.getter()
{
  OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

void DiscoveredBonjourAdvert.model.getter()
{
  OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_1();
}

uint64_t DiscoveredBonjourAdvert.flags.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = OUTLINED_FUNCTION_0_25();
  *a1 = *(_QWORD *)(v1 + *(int *)(result + 48));
  return result;
}

uint64_t DiscoveredBonjourAdvert.validInterfaces.getter()
{
  OUTLINED_FUNCTION_0_25();
  return swift_bridgeObjectRetain();
}

id DiscoveredBonjourAdvert.netLinkManager.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(OUTLINED_FUNCTION_0_25() + 56));
}

uint64_t DiscoveredBonjourAdvert.prohibitedInterfaces.getter()
{
  OUTLINED_FUNCTION_0_25();
  return swift_bridgeObjectRetain();
}

void DiscoveredBonjourAdvert.prohibitedInterfaces.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(OUTLINED_FUNCTION_0_25() + 60);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  OUTLINED_FUNCTION_40();
}

uint64_t (*DiscoveredBonjourAdvert.prohibitedInterfaces.modify())(_QWORD)
{
  OUTLINED_FUNCTION_0_25();
  return nullsub_1;
}

void DiscoveredBonjourAdvert.createTransport(withTargetQueue:)(uint64_t *a1@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
  void (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  char v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  void (*v43)(uint64_t, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  os_log_type_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72[5];

  v2 = v1;
  v68 = OUTLINED_FUNCTION_45_6();
  v61 = *(_QWORD *)(v68 - 8);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_14();
  v67 = v5;
  v6 = sub_1CF73EA00();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_34();
  v10 = v9 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA2048);
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_34();
  v14 = v13 - v12;
  v15 = OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_3();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_101();
  v19 = v17 - v18;
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v59 - v21;
  sub_1CF73EBBC();
  OUTLINED_FUNCTION_21();
  v23 = sub_1CF73EBB0();
  v69 = (int *)v15;
  v24 = *(unsigned __int8 *)(v2 + *(int *)(v15 + 20));
  v65 = a1;
  if (!v24 || v24 == 4)
    goto LABEL_6;
  if (v24 != 1)
  {
    sub_1CF73155C(v2, (uint64_t)v22);
    v72[0] = 0;
    v72[1] = 0xE000000000000000;
    sub_1CF73F348();
    sub_1CF73EF58();
    LOBYTE(v71) = v22[v69[5]];
    sub_1CF73F408();
    sub_1CF73F450();
    __break(1u);
    return;
  }
  if ((*(_BYTE *)(v2 + v69[12]) & 1) != 0)
  {
LABEL_6:
    sub_1CF73EB74();
    sub_1CF73EB80();
    sub_1CF73EB8C();
    sub_1CF73EB98();
    v60 = 0;
  }
  else
  {
    v60 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + v69[14]);
    v25 = v60;
  }
  v63 = v19;
  sub_1CF73EBA4();
  sub_1CF73EB68();
  swift_retain();
  v64 = v23;
  v26 = sub_1CF73EB50();
  v27 = v69;
  swift_bridgeObjectRetain();
  sub_1CF73EB38();
  v66 = v26;
  sub_1CF73EB5C();
  v28 = v27[13];
  v62 = v2;
  v29 = *(_QWORD *)(v2 + v28);
  v30 = *(_QWORD *)(v29 + 16);
  v59 = v29;
  if (v30)
  {
    v31 = v29 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v32 = *(_QWORD *)(v7 + 72);
    v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    swift_bridgeObjectRetain();
    while (1)
    {
      v33(v14, v31, v6);
      OUTLINED_FUNCTION_34_10(v14, 0);
      if (__swift_getEnumTagSinglePayload(v14, 1, v6) == 1)
        break;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v10, v14, v6);
      if (sub_1CF73E9DC() == 0x306C647761 && v34 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_24_13();
LABEL_21:
        swift_bridgeObjectRelease();
        sub_1CF73EB20();
        goto LABEL_22;
      }
      v36 = sub_1CF73F690();
      OUTLINED_FUNCTION_11_3();
      OUTLINED_FUNCTION_24_13();
      if ((v36 & 1) != 0)
        goto LABEL_21;
      v31 += v32;
      if (!--v30)
        goto LABEL_18;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_18:
    OUTLINED_FUNCTION_34_10(v14, 1);
  }
  swift_bridgeObjectRelease();
LABEL_22:
  v37 = v62;
  v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v61 + 16);
  v38(v67, v62, v68);
  sub_1CF73EB14();
  OUTLINED_FUNCTION_21();
  swift_retain();
  v39 = sub_1CF73EA9C();
  v72[3] = (uint64_t)v69;
  v72[4] = (uint64_t)&protocol witness table for DiscoveredBonjourAdvert;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v72);
  sub_1CF73155C(v37, (uint64_t)boxed_opaque_existential_0);
  v41 = type metadata accessor for NWConnectionControlChannelTransport();
  swift_allocObject();
  v42 = v60;
  v43 = v60;
  v44 = swift_retain();
  v45 = NWConnectionControlChannelTransport.init(connection:endpoint:netLinkManager:)(v44, (uint64_t)v72, v42);
  sub_1CF6F11C8((uint64_t)sub_1CF73946C, 0);
  v46 = sub_1CF73F0E4();
  v47 = v63;
  if (qword_1EFBA0A00 != -1)
    swift_once();
  v48 = qword_1EFBA43F8;
  sub_1CF73155C(v37, v47);
  if (os_log_type_enabled(v48, v46))
  {
    swift_retain();
    v49 = OUTLINED_FUNCTION_4_7();
    v69 = (int *)v39;
    v50 = v49;
    v51 = OUTLINED_FUNCTION_4_7();
    v60 = v38;
    v71 = v51;
    *(_DWORD *)v50 = 136446466;
    v62 = (uint64_t)v43;
    OUTLINED_FUNCTION_2_0();
    v61 = v41;
    v52 = *(_QWORD *)(v45 + 16);
    v53 = *(_QWORD *)(v45 + 24);
    swift_bridgeObjectRetain();
    sub_1CF68F110(v52, v53, &v71);
    v70 = v54;
    sub_1CF73F2A0();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v50 + 12) = 2080;
    v60(v67, v47, v68);
    v55 = sub_1CF73EF10();
    sub_1CF68F110(v55, v56, &v71);
    v70 = v57;
    sub_1CF73F2A0();
    swift_bridgeObjectRelease();
    sub_1CF73952C(v47);
    _os_log_impl(&dword_1CF67E000, v48, v46, "Created control channel transport %{public}s from bonjour advert: %s", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_1();
  }
  sub_1CF73952C(v47);
  v58 = v65;
  v65[3] = v41;
  v58[4] = (uint64_t)&protocol witness table for NWConnectionControlChannelTransport;
  swift_release();
  swift_release();
  swift_release();

  *v58 = v45;
  OUTLINED_FUNCTION_17();
}

BOOL sub_1CF73946C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  _BOOL8 result;
  uint64_t v6;

  if (qword_1EFBA0858 != -1)
    swift_once();
  swift_beginAccess();
  v0 = qword_1EFBA1158;
  v1 = unk_1EFBA1160;
  v2 = byte_1EFBA1168;
  swift_bridgeObjectRetain();
  sub_1CF68DC58(v0, v1, v2);
  v4 = v3;
  swift_bridgeObjectRelease();
  result = 0;
  if ((v4 & 1) == 0)
  {
    v6 = sub_1CF73E9F4();
    return InterfaceIndexCorrespondsToAppleNCMInterface(v6);
  }
  return result;
}

uint64_t sub_1CF73952C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DiscoveredBonjourAdvert();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t DiscoveredBonjourAdvert.endpointIdentifier.getter()
{
  uint64_t v0;
  __int128 v2;

  BYTE8(v2) = 0;
  *(_QWORD *)&v2 = *(unsigned __int8 *)(v0 + *(int *)(OUTLINED_FUNCTION_0_25() + 20));
  sub_1CF73F408();
  sub_1CF73EF58();
  OUTLINED_FUNCTION_27();
  sub_1CF739648();
  sub_1CF73F648();
  sub_1CF73EF58();
  swift_bridgeObjectRelease();
  return *(_QWORD *)((char *)&v2 + 1);
}

void sub_1CF73961C(uint64_t *a1@<X8>)
{
  DiscoveredBonjourAdvert.createTransport(withTargetQueue:)(a1);
}

unint64_t sub_1CF739648()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED8F7D08;
  if (!qword_1ED8F7D08)
  {
    v1 = sub_1CF73E664();
    result = MEMORY[0x1D17D3DEC](MEMORY[0x1E0CB09F0], v1);
    atomic_store(result, (unint64_t *)&qword_1ED8F7D08);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for DiscoveredBonjourAdvert(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v36 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v36 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF73E970();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1CF73E664();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[7];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    v15 = *v14;
    v16 = v14[1];
    sub_1CF6934BC(*v14, v16);
    *v13 = v15;
    v13[1] = v16;
    v17 = a3[8];
    v18 = a3[9];
    v19 = *(void **)((char *)a2 + v17);
    *(_QWORD *)((char *)a1 + v17) = v19;
    v20 = *(void **)((char *)a2 + v18);
    *(_QWORD *)((char *)a1 + v18) = v20;
    v21 = a3[10];
    v22 = a3[11];
    v23 = (_QWORD *)((char *)a1 + v21);
    v24 = (_QWORD *)((char *)a2 + v21);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    v26 = (_QWORD *)((char *)a1 + v22);
    v27 = (_QWORD *)((char *)a2 + v22);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    v29 = a3[13];
    *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
    *(_QWORD *)((char *)a1 + v29) = *(_QWORD *)((char *)a2 + v29);
    v30 = a3[14];
    v31 = a3[15];
    v32 = *(void **)((char *)a2 + v30);
    *(_QWORD *)((char *)a1 + v30) = v32;
    *(_QWORD *)((char *)a1 + v31) = *(_QWORD *)((char *)a2 + v31);
    v33 = v19;
    v34 = v20;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v35 = v32;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DiscoveredBonjourAdvert(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1CF73E970();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[6];
  v6 = sub_1CF73E664();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_1CF6933C0(*(_QWORD *)(a1 + a2[7]), *(_QWORD *)(a1 + a2[7] + 8));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;

  v6 = sub_1CF73E970();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF73E664();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[7];
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  v15 = v13[1];
  sub_1CF6934BC(*v13, v15);
  *v12 = v14;
  v12[1] = v15;
  v16 = a3[8];
  v17 = a3[9];
  v18 = *(void **)(a2 + v16);
  *(_QWORD *)(a1 + v16) = v18;
  v19 = *(void **)(a2 + v17);
  *(_QWORD *)(a1 + v17) = v19;
  v20 = a3[10];
  v21 = a3[11];
  v22 = (_QWORD *)(a1 + v20);
  v23 = (_QWORD *)(a2 + v20);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = (_QWORD *)(a1 + v21);
  v26 = (_QWORD *)(a2 + v21);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  v28 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + v28) = *(_QWORD *)(a2 + v28);
  v29 = a3[14];
  v30 = a3[15];
  v31 = *(void **)(a2 + v29);
  *(_QWORD *)(a1 + v29) = v31;
  *(_QWORD *)(a1 + v30) = *(_QWORD *)(a2 + v30);
  v32 = v18;
  v33 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v34 = v31;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;

  v6 = sub_1CF73E970();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF73E664();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[7];
  v12 = (uint64_t *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v14 = *v13;
  v15 = v13[1];
  sub_1CF6934BC(*v13, v15);
  v16 = *v12;
  v17 = v12[1];
  *v12 = v14;
  v12[1] = v15;
  sub_1CF6933C0(v16, v17);
  v18 = a3[8];
  v19 = *(void **)(a1 + v18);
  v20 = *(void **)(a2 + v18);
  *(_QWORD *)(a1 + v18) = v20;
  v21 = v20;

  v22 = a3[9];
  v23 = *(void **)(a1 + v22);
  v24 = *(void **)(a2 + v22);
  *(_QWORD *)(a1 + v22) = v24;
  v25 = v24;

  v26 = a3[10];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  *v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = a3[11];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  *v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32 = a3[14];
  v33 = *(void **)(a2 + v32);
  v34 = *(void **)(a1 + v32);
  *(_QWORD *)(a1 + v32) = v33;
  v35 = v33;

  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_1CF73E970();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF73E664();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  v12 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  v13 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);
  v14 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for DiscoveredBonjourAdvert(uint64_t a1, uint64_t a2, int *a3)
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
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v6 = sub_1CF73E970();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF73E664();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[7];
  v12 = *(_QWORD *)(a1 + v11);
  v13 = *(_QWORD *)(a1 + v11 + 8);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  sub_1CF6933C0(v12, v13);
  v14 = a3[8];
  v15 = *(void **)(a1 + v14);
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);

  v16 = a3[9];
  v17 = *(void **)(a1 + v16);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);

  v18 = a3[10];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = a3[11];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (uint64_t *)(a2 + v23);
  v27 = *v25;
  v26 = v25[1];
  *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  v28 = a3[13];
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  *(_QWORD *)(a1 + v28) = *(_QWORD *)(a2 + v28);
  swift_bridgeObjectRelease();
  v29 = a3[14];
  v30 = *(void **)(a1 + v29);
  *(_QWORD *)(a1 + v29) = *(_QWORD *)(a2 + v29);

  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DiscoveredBonjourAdvert()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF739DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;

  v6 = OUTLINED_FUNCTION_45_6();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v9 = OUTLINED_FUNCTION_27();
  if (*(_DWORD *)(*(_QWORD *)(v9 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v9;
    v8 = a1 + *(int *)(a3 + 24);
    return __swift_getEnumTagSinglePayload(v8, a2, v7);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 52));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for DiscoveredBonjourAdvert()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1CF739E80(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = OUTLINED_FUNCTION_45_6();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
LABEL_5:
    __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
    return;
  }
  v11 = OUTLINED_FUNCTION_27();
  if (*(_DWORD *)(*(_QWORD *)(v11 - 8) + 84) == a3)
  {
    v9 = v11;
    v10 = a1 + *(int *)(a4 + 24);
    goto LABEL_5;
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 52)) = (a2 - 1);
  OUTLINED_FUNCTION_40();
}

uint64_t sub_1CF739F0C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1CF73E970();
  if (v1 <= 0x3F)
  {
    result = sub_1CF73E664();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_17_13()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_18_18(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_19_13()
{
  return 0x67615468747561;
}

uint64_t OUTLINED_FUNCTION_25_13()
{
  return type metadata accessor for ControlChannelConnectionWireProtocolVersion();
}

uint64_t OUTLINED_FUNCTION_31_7()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_33_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1CF691028(a1, (uint64_t)&a9);
}

uint64_t OUTLINED_FUNCTION_35_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_38_10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 344) = a1;
}

uint64_t OUTLINED_FUNCTION_39_7()
{
  return sub_1CF73E694();
}

uint64_t sub_1CF73A060()
{
  uint64_t result;

  sub_1CF6CACDC();
  result = sub_1CF73F270();
  qword_1EFBA44C0 = result;
  return result;
}

id sub_1CF73A0BC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3740]), sel_init);
  qword_1EFBA44D8 = (uint64_t)result;
  return result;
}

uint64_t sub_1CF73A0EC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  if (qword_1EFBA0A10 != -1)
    swift_once();
  v0 = (void *)qword_1EFBA44D8;
  objc_msgSend((id)qword_1EFBA44D8, sel_lock);
  v1 = qword_1EFBA44C8;
  if (qword_1EFBA44C8)
  {
    v2 = qword_1EFBA44D0;
    v3 = swift_slowAlloc();
    *(_QWORD *)v3 = 0;
    *(_QWORD *)(v3 + 8) = 0;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_QWORD *)(v3 + 16) = v1;
    *(_QWORD *)(v3 + 24) = v2;
    objc_msgSend(v0, sel_unlock);
    return v3;
  }
  else
  {
    sub_1CF73F348();
    swift_bridgeObjectRelease();
    result = sub_1CF73F450();
    __break(1u);
  }
  return result;
}

uint64_t sub_1CF73A204()
{
  void *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char __source[8];
  uint64_t v8;

  if (qword_1EFBA0A10 != -1)
    swift_once();
  v0 = (void *)qword_1EFBA44D8;
  objc_msgSend((id)qword_1EFBA44D8, sel_lock);
  v1 = qword_1EFBA44C8;
  if (qword_1EFBA44C8)
  {
    objc_msgSend(v0, sel_unlock);
  }
  else
  {
    v1 = swift_slowAlloc();
    *(_OWORD *)v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    *(_QWORD *)(v1 + 32) = 0;
    v2 = (_QWORD *)swift_slowAlloc();
    bzero(v2, 0x110uLL);
    v4 = MEMORY[0x1E0C80A78](v3);
    if (((unint64_t)" to fit packet of size " & 0x1000000000000000) != 0)
    {
      sub_1CF73F33C();
    }
    else
    {
      MEMORY[0x1E0C80A78](v4);
      if ((v5 & 0x2000000000000000) != 0)
      {
        *(_QWORD *)__source = 0xD000000000000016;
        v8 = v5 & 0xFFFFFFFFFFFFFFLL;
        strlcpy((char *)v1, __source, 0x20uLL);
      }
      else
      {
        sub_1CF73C3A0((v5 & 0xFFFFFFFFFFFFFFFLL) + 32, 22, (uint64_t (*)(void))sub_1CF73C3D8);
      }
    }
    *(_QWORD *)(v1 + 32) = 0x100000002;
    v2[8] = sub_1CF73A3EC;
    v2[9] = sub_1CF73A61C;
    qword_1EFBA44C8 = v1;
    qword_1EFBA44D0 = (uint64_t)v2;
    nw_protocol_register();
    objc_msgSend((id)qword_1EFBA44D8, sel_unlock);
  }
  return v1;
}

uint64_t sub_1CF73A3F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v2 = sub_1CF73ED54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CF73ED84();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_8;
  }
  v11 = *(_QWORD **)(a1 + 40);
  if (!v11)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v12 = v11[2];
  swift_retain();
  if (v12)
  {
    v17 = v3;
    v13 = v11[3];
    v16[1] = v11[14];
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v12;
    *(_QWORD *)(v14 + 24) = v13;
    aBlock[4] = sub_1CF6D24A0;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CF6CC068;
    aBlock[3] = &block_descriptor_46;
    v15 = _Block_copy(aBlock);
    swift_retain_n();
    sub_1CF73ED6C();
    v18 = MEMORY[0x1E0DEE9D8];
    sub_1CF6AA11C();
    v16[0] = v6;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8F7A00);
    sub_1CF6A72FC();
    sub_1CF73F2F4();
    MEMORY[0x1D17D2D90](0, v10, v5, v15);
    _Block_release(v15);
    sub_1CF693EC8(v12);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v2);
    (*(void (**)(char *, _QWORD))(v7 + 8))(v10, v16[0]);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1CF73A620(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v2 = sub_1CF73ED54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CF73ED84();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_8;
  }
  v11 = *(_QWORD **)(a1 + 40);
  if (!v11)
  {
LABEL_8:
    __break(1u);
    return result;
  }
  v12 = v11[4];
  swift_retain();
  if (v12)
  {
    v17 = v3;
    v13 = v11[5];
    v16[1] = v11[14];
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v12;
    *(_QWORD *)(v14 + 24) = v13;
    aBlock[4] = sub_1CF73C478;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CF6CC068;
    aBlock[3] = &block_descriptor_40;
    v15 = _Block_copy(aBlock);
    swift_retain_n();
    sub_1CF73ED6C();
    v18 = MEMORY[0x1E0DEE9D8];
    sub_1CF6AA11C();
    v16[0] = v6;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8F7A00);
    sub_1CF6A72FC();
    sub_1CF73F2F4();
    MEMORY[0x1D17D2D90](0, v10, v5, v15);
    _Block_release(v15);
    sub_1CF693EC8(v12);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v5, v2);
    (*(void (**)(char *, _QWORD))(v7 + 8))(v10, v16[0]);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_1CF73A850()
{
  uint64_t result;
  uint64_t v1;
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2 = 30;
  result = MEMORY[0x1D17D21C0](&v2, 4);
  qword_1EFBB2028 = result;
  unk_1EFBB2030 = v1;
  return result;
}

void sub_1CF73A8B4()
{
  if (qword_1EFBA0A18 != -1)
    swift_once();
  __asm { BR              X13 }
}

uint64_t sub_1CF73A960()
{
  uint64_t result;

  if (qword_1EFBA0A20 != -1)
    result = swift_once();
  if (qword_1EFBB2038 < 0 || HIDWORD(qword_1EFBB2038))
  {
    result = sub_1CF73F444();
    __break(1u);
  }
  else
  {
    dword_1EFBB2040 = qword_1EFBB2038;
  }
  return result;
}

uint64_t sub_1CF73AA40(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t result;
  void (**v16)(void);
  void (*v17)(void);

  *(_QWORD *)(v6 + 64) = 0;
  *(_BYTE *)(v6 + 72) = 0;
  *(_QWORD *)(v6 + 80) = 0;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_QWORD *)(v6 + 104) = a4;
  *(_QWORD *)(v6 + 112) = a2;
  *(_QWORD *)(v6 + 96) = a3;
  v11 = v6
      + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval;
  v12 = sub_1CF73ED48();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, a6, v12);
  *(_QWORD *)(v6 + 56) = a1;
  v14 = a2;
  swift_unknownObjectRetain();
  sub_1CF73A204();
  result = nw_protocol_create();
  if (!result)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(_QWORD *)(v6 + 48) = result;
  *(_QWORD *)(v6 + 88) = a5;
  *(_QWORD *)(result + 40) = v6;
  swift_unknownObjectRetain();
  swift_retain();
  result = nw_channel_get_protocol_handler();
  if (!result)
  {
LABEL_6:

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(a6, v12);
    return v6;
  }
  v16 = *(void (***)(void))(result + 24);
  if (!v16)
    goto LABEL_8;
  v17 = *v16;
  if (v17)
  {
    v17();
    goto LABEL_6;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1CF73AB6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  int v17;
  uint64_t v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = *v1;
  v5 = OUTLINED_FUNCTION_9();
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  nw_frame_array_init();
  v10 = *(_QWORD *)(v1[6] + 32);
  if (!v10)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v9 = *(_QWORD *)(v10 + 24);
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(v9 + 80);
  if (v9)
  {
    v11 = ((unsigned int (*)(void))v9)();
    v17 = 0;
    v2 = sub_1CF6E091C(v11);
    v16 = 0;
    v18[0] = v12;
    v18[1] = v11;
    sub_1CF73ACD8(v18, (uint64_t)&v16, v5 + 16, (uint64_t)&v17, v4);
    v9 = v16;
    v8 = __OFSUB__(v16, v11);
    v6 = v16 == v11;
    v7 = v16 - v11 < 0;
    if (v16 <= v11)
    {
      *(_QWORD *)(v2 + 16) = v16;
      v13 = OUTLINED_FUNCTION_9();
      *(_QWORD *)(v13 + 16) = v1;
      *(_QWORD *)(v13 + 24) = v5;
      v14 = v1[8];
      v8 = __OFADD__(v14, 1);
      v9 = v14 + 1;
      v6 = v9 == 0;
      v7 = v9 < 0;
      if (!v8)
      {
        v1[8] = v9;
        *a1 = v2;
        a1[1] = (uint64_t)sub_1CF73C304;
        a1[2] = v13;
        return swift_retain();
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
LABEL_11:
  __break(1u);
  if (!(v7 ^ v8 | v6))
    __break(1u);
  *(_QWORD *)(v2 + 16) = v9;
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t *sub_1CF73ACD8(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];
  uint64_t v12;

  if (*result)
  {
    v12 = *result;
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = a4;
    v8[3] = &v12;
    v8[4] = a2;
    v8[5] = a5;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_1CF73C350;
    *(_QWORD *)(v9 + 24) = v8;
    aBlock[4] = sub_1CF73C474;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CF73AF68;
    aBlock[3] = &block_descriptor_34_0;
    v10 = _Block_copy(aBlock);
    swift_release();
    nw_frame_array_foreach();
    _Block_release(v10);
    return (uint64_t *)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1CF73ADE0(uint64_t a1, unsigned int *a2, uint64_t **a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_1CF73E4E4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = nw_frame_unclaimed_bytes();
  v12 = result;
  v13 = *a2;
  if (qword_1EFBA0A28 != -1)
    result = swift_once();
  if (v13 < dword_1EFBB2040)
    return 1;
  v14 = *a2;
  v15 = *a2 - dword_1EFBB2040;
  if (v14 < dword_1EFBB2040)
  {
    __break(1u);
LABEL_11:
    swift_once();
    goto LABEL_7;
  }
  if (!v12)
    goto LABEL_13;
  if (qword_1EFBA0A20 != -1)
    goto LABEL_11;
LABEL_7:
  v16 = v12 + qword_1EFBB2038;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E0CB00C8], v7);
  result = MEMORY[0x1D17D210C](v16, v15, v10);
  v17 = *a3;
  *v17 = result;
  v17[1] = v18;
  *a3 += 2;
  if (!__OFADD__(*a4, 1))
  {
    ++*a4;
    return 1;
  }
  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_1CF73AF4C()
{
  nw_frame_finalize();
  return 1;
}

uint64_t sub_1CF73AF68(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);
  char v4;

  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v4 = v3(a2);
  swift_unknownObjectRelease();
  return v4 & 1;
}

void sub_1CF73AFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v6[4] = sub_1CF73C33C;
  v6[5] = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1CF6F79AC;
  v6[3] = &block_descriptor_21_0;
  v5 = _Block_copy(v6);
  swift_retain();
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v5);
}

uint64_t sub_1CF73B078(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t aBlock[6];

  aBlock[4] = (uint64_t)sub_1CF73AF4C;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1CF73AF68;
  aBlock[3] = (uint64_t)&block_descriptor_24_0;
  v2 = _Block_copy(aBlock);
  swift_release();
  swift_beginAccess();
  nw_frame_array_foreach();
  swift_endAccess();
  _Block_release(v2);
  v3 = *(_QWORD *)(a1 + 64);
  v4 = __OFSUB__(v3, 1);
  v5 = v3 - 1;
  if (v4)
  {
    __break(1u);
    goto LABEL_13;
  }
  *(_QWORD *)(a1 + 64) = v5;
  if (*(_BYTE *)(a1 + 72) != 1 || v5)
    goto LABEL_10;
  LOBYTE(v2) = sub_1CF73F0E4();
  if (qword_1EFBA0A08 != -1)
    goto LABEL_14;
  while (1)
  {
    v6 = qword_1EFBA44C0;
    v7 = v2;
    if (os_log_type_enabled((os_log_t)qword_1EFBA44C0, (os_log_type_t)v2))
    {
      swift_retain();
      v2 = (_DWORD *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      aBlock[0] = v8;
      *v2 = 136446210;
      v9 = *(_QWORD *)(a1 + 96);
      v10 = *(_QWORD *)(a1 + 104);
      swift_bridgeObjectRetain();
      sub_1CF68F110(v9, v10, aBlock);
      sub_1CF73F2A0();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF67E000, v6, v7, "Executing deferred destroyProtocol for interface %{public}s as last outstanding frames are cleaned up", (uint8_t *)v2, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v8, -1, -1);
      MEMORY[0x1D17D3ED0](v2, -1, -1);
    }
    *(_BYTE *)(a1 + 72) = 0;
    if (*(_QWORD *)(a1 + 80))
    {
      swift_retain();
      sub_1CF73EDD8();
      swift_release();
    }
    *(_QWORD *)(a1 + 80) = 0;
    swift_release();
    sub_1CF73B81C(0);
LABEL_10:
    result = swift_isEscapingClosureAtFileLocation();
    if ((result & 1) == 0)
      break;
LABEL_13:
    __break(1u);
LABEL_14:
    swift_once();
  }
  return result;
}

uint64_t sub_1CF73B300(uint64_t a1)
{
  uint64_t *v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(void);
  uint64_t v15;
  uint64_t result;
  _QWORD aBlock[6];
  int v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v4 = *v1;
  v19[1] = 0;
  v19[2] = 0;
  nw_frame_array_init();
  v5 = v1[6];
  v6 = *(_QWORD *)(v5 + 32);
  if (!v6)
  {
LABEL_7:
    v19[0] = 0;
    v18 = 0;
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = a1;
    v9[3] = v19;
    v9[4] = &v18;
    v9[5] = v1;
    v9[6] = v4;
    v10 = OUTLINED_FUNCTION_9();
    *(_QWORD *)(v10 + 16) = sub_1CF73C2B4;
    *(_QWORD *)(v10 + 24) = v9;
    aBlock[4] = sub_1CF73C2D0;
    aBlock[5] = v10;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CF73AF68;
    aBlock[3] = &block_descriptor_9_1;
    v11 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    nw_frame_array_foreach();
    _Block_release(v11);
    if ((nw_frame_array_is_empty() & 1) != 0)
    {
LABEL_12:
      v15 = v19[0];
      swift_release();
      return v15;
    }
    v12 = *(_QWORD *)(v5 + 32);
    if (v12)
    {
      v13 = *(_QWORD *)(v12 + 24);
      if (v13)
      {
        v14 = *(void (**)(void))(v13 + 96);
        if (v14)
        {
          v14();
          goto LABEL_12;
        }
        goto LABEL_19;
      }
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v7 = *(_QWORD *)(v6 + 24);
  if (!v7)
  {
    __break(1u);
    goto LABEL_16;
  }
  v8 = *(void (**)(void))(v7 + 88);
  if (!v8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (!HIDWORD(v2))
  {
    v8();
    goto LABEL_7;
  }
LABEL_20:
  result = sub_1CF73F444();
  __break(1u);
  return result;
}

uint64_t sub_1CF73B518(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned int *a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v9 = *a3;
  if (*a3 < 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  v10 = *(_QWORD *)(a2 + 16);
  if (v9 >= v10)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    swift_once();
    goto LABEL_5;
  }
  v8 = a4;
  v4 = a3;
  v11 = a2 + 16 * v9;
  v6 = *(_QWORD *)(v11 + 32);
  v7 = *(_QWORD *)(v11 + 40);
  sub_1CF6934BC(v6, v7);
  if (!nw_frame_unclaimed_bytes())
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v16 = v10;
  v5 = sub_1CF73E5C8();
  if (qword_1EFBA0A20 != -1)
    goto LABEL_13;
LABEL_5:
  v12 = __OFADD__(v5, qword_1EFBB2038);
  v13 = v5 + qword_1EFBB2038;
  if (v12)
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_8;
  }
  if (v13 > *v8)
  {
LABEL_18:
    sub_1CF73F348();
    sub_1CF73EF58();
    sub_1CF73F648();
    sub_1CF73EF58();
    swift_bridgeObjectRelease();
    sub_1CF73EF58();
    sub_1CF73F648();
    sub_1CF73EF58();
    swift_bridgeObjectRelease();
    sub_1CF73F450();
    __break(1u);
    goto LABEL_19;
  }
  if (qword_1EFBA0A18 != -1)
    goto LABEL_15;
LABEL_8:
  sub_1CF73E5EC();
  sub_1CF73E5C8();
  sub_1CF73E5EC();
  if ((v13 & 0x8000000000000000) == 0)
  {
    nw_frame_claim();
    nw_frame_collapse();
    nw_frame_unclaim();
    sub_1CF6933C0(v6, v7);
    v14 = *v4 + 1;
    if (!__OFADD__(*v4, 1))
    {
      *v4 = v14;
      return v14 < v16;
    }
    __break(1u);
    goto LABEL_17;
  }
LABEL_19:
  result = sub_1CF73F444();
  __break(1u);
  return result;
}

uint64_t sub_1CF73B81C(char a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t result;
  os_log_type_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(void);
  _QWORD v32[2];
  os_log_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t aBlock[6];

  v2 = (_QWORD *)v1;
  v4 = sub_1CF73EDC0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v32 - v9;
  v11 = sub_1CF73ED54();
  MEMORY[0x1E0C80A78](v11);
  if ((a1 & 1) != 0 || !*(_QWORD *)(v1 + 64))
  {
    v22 = sub_1CF73F0E4();
    if (qword_1EFBA0A08 != -1)
      swift_once();
    v23 = qword_1EFBA44C0;
    v24 = v22;
    if (os_log_type_enabled((os_log_t)qword_1EFBA44C0, v22))
    {
      OUTLINED_FUNCTION_121();
      v25 = (uint8_t *)OUTLINED_FUNCTION_4_7();
      aBlock[0] = OUTLINED_FUNCTION_4_7();
      *(_DWORD *)v25 = 136446210;
      v26 = v2[12];
      v27 = v2[13];
      swift_bridgeObjectRetain();
      sub_1CF68F110(v26, v27, aBlock);
      v36 = v28;
      sub_1CF73F2A0();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CF67E000, v23, v24, "destroyProtocol invoked for interface %{public}s", v25, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_1();
    }
    v29 = v2[6];
    result = *(_QWORD *)(v29 + 32);
    if (result)
    {
      v30 = *(_QWORD *)(result + 24);
      if (v30)
      {
        v31 = *(void (**)(void))(v30 + 8);
        if (v31)
        {
          v31();
          nw_channel_close();
          result = *(_QWORD *)(v29 + 40);
          if (result)
          {
            swift_release();
            OUTLINED_FUNCTION_0_1();
          }
          goto LABEL_20;
        }
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_19;
  }
  v12 = sub_1CF73F0E4();
  if (qword_1EFBA0A08 != -1)
    swift_once();
  v13 = qword_1EFBA44C0;
  v14 = v12;
  if (os_log_type_enabled((os_log_t)qword_1EFBA44C0, v12))
  {
    OUTLINED_FUNCTION_121();
    v15 = OUTLINED_FUNCTION_4_7();
    v34 = OUTLINED_FUNCTION_4_7();
    aBlock[0] = v34;
    *(_DWORD *)v15 = 136446466;
    v32[1] = v15 + 4;
    v33 = v13;
    v35 = v5;
    v17 = *(_QWORD *)(v1 + 96);
    v16 = *(_QWORD *)(v1 + 104);
    swift_bridgeObjectRetain();
    sub_1CF68F110(v17, v16, aBlock);
    v36 = v18;
    sub_1CF73F2A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2048;
    v36 = *(_QWORD *)(v1 + 64);
    sub_1CF73F2A0();
    swift_release();
    _os_log_impl(&dword_1CF67E000, v33, v14, "Deferring destroyProtocol for interface %{public}s until %ld packet groups are cleaned up", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_1();
  }
  *(_BYTE *)(v1 + 72) = 1;
  aBlock[4] = (uint64_t)sub_1CF73C260;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1CF6F79AC;
  aBlock[3] = (uint64_t)&block_descriptor_14;
  _Block_copy(aBlock);
  v36 = MEMORY[0x1E0DEE9D8];
  sub_1CF6AA11C();
  OUTLINED_FUNCTION_121();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED8F7A00);
  sub_1CF6A72FC();
  sub_1CF73F2F4();
  sub_1CF73EDE4();
  swift_allocObject();
  v19 = sub_1CF73EDCC();
  swift_release();
  *(_QWORD *)(v1 + 80) = v19;
  swift_retain();
  swift_release();
  sub_1CF73EDB4();
  MEMORY[0x1D17D2A0C](v8, v1 + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval);
  v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v8, v4);
  sub_1CF73F168();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v20)(v10, v4);
}

void sub_1CF73BCE4(uint64_t a1)
{
  void *v1;
  _QWORD v2[6];

  v2[4] = sub_1CF73C280;
  v2[5] = a1;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 1107296256;
  v2[2] = sub_1CF6F79AC;
  v2[3] = &block_descriptor_3_0;
  v1 = _Block_copy(v2);
  swift_retain();
  swift_release();
  nw_queue_context_async_if_needed();
  _Block_release(v1);
}

uint64_t sub_1CF73BD80(uint64_t result)
{
  uint64_t v1;
  os_log_type_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (*(_BYTE *)(result + 72) == 1)
  {
    v1 = result;
    v2 = sub_1CF73F0D8();
    if (qword_1EFBA0A08 != -1)
      swift_once();
    v3 = qword_1EFBA44C0;
    v4 = v2;
    if (os_log_type_enabled((os_log_t)qword_1EFBA44C0, v2))
    {
      swift_retain();
      v5 = swift_slowAlloc();
      v6 = swift_slowAlloc();
      v9 = v6;
      *(_DWORD *)v5 = 136446466;
      v7 = *(_QWORD *)(v1 + 96);
      v8 = *(_QWORD *)(v1 + 104);
      swift_bridgeObjectRetain();
      sub_1CF68F110(v7, v8, &v9);
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v5 + 12) = 2048;
      sub_1CF73F2A0();
      swift_release();
      _os_log_impl(&dword_1CF67E000, v3, v4, "Forcibly executing destroyProtocol for interface %{public}s since %ld packet groups were not cleaned up by timeout", (uint8_t *)v5, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v6, -1, -1);
      MEMORY[0x1D17D3ED0](v5, -1, -1);
    }
    return sub_1CF73B81C(1);
  }
  return result;
}

uint64_t sub_1CF73BF24()
{
  uint64_t v0;
  os_log_type_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = sub_1CF73F0E4();
  if (qword_1EFBA0A08 != -1)
    swift_once();
  v2 = qword_1EFBA44C0;
  if (os_log_type_enabled((os_log_t)qword_1EFBA44C0, v1))
  {
    swift_retain_n();
    v3 = OUTLINED_FUNCTION_4_7();
    v11 = OUTLINED_FUNCTION_4_7();
    *(_DWORD *)v3 = 136315394;
    v4 = sub_1CF73F87C();
    sub_1CF68F110(v4, v5, &v11);
    sub_1CF73F2A0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v3 + 12) = 2082;
    v6 = *(_QWORD *)(v0 + 96);
    v7 = *(_QWORD *)(v0 + 104);
    swift_bridgeObjectRetain();
    sub_1CF68F110(v6, v7, &v11);
    sub_1CF73F2A0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CF67E000, v2, v1, "%s.deinit invoked for interface %{public}s", (uint8_t *)v3, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_1();
  }
  sub_1CF693EC8(*(_QWORD *)(v0 + 16));
  sub_1CF693EC8(*(_QWORD *)(v0 + 32));
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  v8 = v0 + OBJC_IVAR____TtC19RemotePairingDevice38SkywalkVirtualInterfaceNetworkProtocol_deferredCleanupTimeoutInterval;
  v9 = sub_1CF73ED48();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  return v0;
}

uint64_t sub_1CF73C130()
{
  sub_1CF73BF24();
  return swift_deallocClassInstance();
}

uint64_t sub_1CF73C154()
{
  return type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol();
}

uint64_t type metadata accessor for SkywalkVirtualInterfaceNetworkProtocol()
{
  uint64_t result;

  result = qword_1EFBA4508;
  if (!qword_1EFBA4508)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CF73C194()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CF73ED48();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1CF73C260()
{
  uint64_t v0;

  sub_1CF73BCE4(v0);
}

uint64_t block_copy_helper_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_14()
{
  return swift_release();
}

uint64_t sub_1CF73C280()
{
  uint64_t v0;

  return sub_1CF73BD80(v0);
}

uint64_t sub_1CF73C288()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF73C2B4(uint64_t a1)
{
  uint64_t v1;

  return sub_1CF73B518(a1, *(_QWORD *)(v1 + 16), *(uint64_t **)(v1 + 24), *(unsigned int **)(v1 + 32));
}

uint64_t sub_1CF73C2C4()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t sub_1CF73C2D0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1CF73C2F4()
{
  return OUTLINED_FUNCTION_2_1();
}

void sub_1CF73C304()
{
  uint64_t v0;

  sub_1CF73AFB0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t objectdestroy_14Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF73C33C()
{
  uint64_t v0;

  return sub_1CF73B078(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1CF73C344()
{
  return OUTLINED_FUNCTION_2_1();
}

uint64_t sub_1CF73C350(uint64_t a1)
{
  uint64_t v1;

  return sub_1CF73ADE0(a1, *(unsigned int **)(v1 + 16), *(uint64_t ***)(v1 + 24), *(_QWORD **)(v1 + 32));
}

uint64_t sub_1CF73C35C()
{
  return OUTLINED_FUNCTION_2_1();
}

size_t sub_1CF73C368@<X0>(char *__source@<X0>, size_t *a2@<X8>)
{
  uint64_t v2;
  size_t result;

  result = strlcpy(*(char **)(v2 + 16), __source, 0x20uLL);
  *a2 = result;
  return result;
}

uint64_t sub_1CF73C3A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = a3();
  if (!v3)
    return v5;
  return result;
}

_QWORD *sub_1CF73C3D8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2)
    *a1 = v5;
  return result;
}

uint64_t sub_1CF73C414()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t RemoteUnlockDeviceKeyForTunnelRequest.tunnelDeviceName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1CF73C4A8(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000010 && a2 == 0x80000001CF755D70)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_1CF73C52C()
{
  return 0xD000000000000010;
}

uint64_t sub_1CF73C54C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF73C4A8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CF73C574()
{
  sub_1CF73C684();
  return sub_1CF73F864();
}

uint64_t sub_1CF73C59C()
{
  sub_1CF73C684();
  return sub_1CF73F870();
}

void RemoteUnlockDeviceKeyForTunnelRequest.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4740);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_15();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1CF73C684();
  sub_1CF73F858();
  sub_1CF73F5C4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v3);
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF73C684()
{
  unint64_t result;

  result = qword_1EFBA4748;
  if (!qword_1EFBA4748)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74BE8C, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4748);
  }
  return result;
}

void RemoteUnlockDeviceKeyForTunnelRequest.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4750);
  OUTLINED_FUNCTION_152();
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1CF73C684();
  OUTLINED_FUNCTION_18();
  if (!v0)
  {
    v6 = sub_1CF73F4F8();
    v8 = v7;
    OUTLINED_FUNCTION_8();
    *v4 = v6;
    v4[1] = v8;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF73C788()
{
  RemoteUnlockDeviceKeyForTunnelRequest.init(from:)();
}

void sub_1CF73C79C()
{
  RemoteUnlockDeviceKeyForTunnelRequest.encode(to:)();
}

uint64_t RemoteUnlockDeviceKeyForTunnelResponse.deviceKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_1CF6934BC(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t RemoteUnlockDeviceKeyForTunnelResponse.init(deviceKey:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_1CF73C7E8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x654B656369766564 && a2 == 0xE900000000000079)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1CF73F690();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1CF73C878()
{
  return 0x654B656369766564;
}

uint64_t sub_1CF73C898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF73C7E8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1CF73C8C0()
{
  sub_1CF73C9E4();
  return sub_1CF73F864();
}

uint64_t sub_1CF73C8E8()
{
  sub_1CF73C9E4();
  return sub_1CF73F870();
}

void RemoteUnlockDeviceKeyForTunnelResponse.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4758);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_15();
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1CF73C9E4();
  sub_1CF73F858();
  sub_1CF6D5DAC();
  sub_1CF73F5F4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v3);
  OUTLINED_FUNCTION_0_0();
}

unint64_t sub_1CF73C9E4()
{
  unint64_t result;

  result = qword_1EFBA4760;
  if (!qword_1EFBA4760)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74BE3C, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA4760);
  }
  return result;
}

void RemoteUnlockDeviceKeyForTunnelResponse.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  _OWORD *v3;
  _OWORD *v4;
  uint64_t v5;
  __int128 v6;

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA4768);
  OUTLINED_FUNCTION_152();
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  sub_1CF73C9E4();
  OUTLINED_FUNCTION_18();
  if (!v0)
  {
    sub_1CF6D8794();
    sub_1CF73F528();
    OUTLINED_FUNCTION_8();
    *v4 = v6;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
  OUTLINED_FUNCTION_0_0();
}

void sub_1CF73CAF8()
{
  RemoteUnlockDeviceKeyForTunnelResponse.init(from:)();
}

void sub_1CF73CB0C()
{
  RemoteUnlockDeviceKeyForTunnelResponse.encode(to:)();
}

id RemotePairingDeviceTunnelServiceConnection.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id RemotePairingDeviceTunnelServiceConnection.init()()
{
  void *v0;
  objc_class *ObjectType;
  char *v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1CF73E850();
  v2 = v0;
  sub_1CF73E838();
  sub_1CF73E868();
  *(_QWORD *)&v2[OBJC_IVAR____TtC19RemotePairingDevice42RemotePairingDeviceTunnelServiceConnection_connection] = swift_dynamicCastClassUnconditional();
  swift_retain();
  sub_1CF73E724();
  swift_release();

  v4.receiver = v2;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t RemotePairingDeviceTunnelServiceConnection.copyRemoteUnlockDeviceKeyForTunnel(tunnelName:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  sub_1CF73CD08();
  sub_1CF73CD44();
  sub_1CF73CD80();
  sub_1CF73CDBC();
  sub_1CF6A38B4();
  swift_bridgeObjectRetain();
  sub_1CF73E730();
  result = swift_bridgeObjectRelease();
  if (!v0)
    return v2;
  return result;
}

unint64_t sub_1CF73CD08()
{
  unint64_t result;

  result = qword_1EFBA4778;
  if (!qword_1EFBA4778)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for RemoteUnlockDeviceKeyForTunnelRequest, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest);
    atomic_store(result, (unint64_t *)&qword_1EFBA4778);
  }
  return result;
}

unint64_t sub_1CF73CD44()
{
  unint64_t result;

  result = qword_1EFBA4780;
  if (!qword_1EFBA4780)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for RemoteUnlockDeviceKeyForTunnelRequest, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest);
    atomic_store(result, (unint64_t *)&qword_1EFBA4780);
  }
  return result;
}

unint64_t sub_1CF73CD80()
{
  unint64_t result;

  result = qword_1EFBA4788;
  if (!qword_1EFBA4788)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for RemoteUnlockDeviceKeyForTunnelResponse, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse);
    atomic_store(result, (unint64_t *)&qword_1EFBA4788);
  }
  return result;
}

unint64_t sub_1CF73CDBC()
{
  unint64_t result;

  result = qword_1EFBA4790;
  if (!qword_1EFBA4790)
  {
    result = MEMORY[0x1D17D3DEC](&protocol conformance descriptor for RemoteUnlockDeviceKeyForTunnelResponse, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse);
    atomic_store(result, (unint64_t *)&qword_1EFBA4790);
  }
  return result;
}

id RemotePairingDeviceTunnelServiceConnection.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CF73CF00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF735CD8(a1, a2, a3, (uint64_t (*)(void))sub_1CF73CD08, (uint64_t (*)(void))sub_1CF73CD44);
}

uint64_t sub_1CF73CF14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF735CD8(a1, a2, a3, (uint64_t (*)(void))sub_1CF73CD80, (uint64_t (*)(void))sub_1CF73CDBC);
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelRequest()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelRequest;
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelResponse()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelResponse;
}

uint64_t type metadata accessor for RemotePairingDeviceTunnelServiceConnection()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys;
}

uint64_t _s19RemotePairingDevice38RemoteUnlockDeviceKeyForTunnelResponseV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1CF73CFCC + 4 * byte_1CF74BB10[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CF73CFEC + 4 * byte_1CF74BB15[v4]))();
}

_BYTE *sub_1CF73CFCC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CF73CFEC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CF73CFF4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CF73CFFC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CF73D004(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CF73D00C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys()
{
  return &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys;
}

unint64_t sub_1CF73D02C()
{
  unint64_t result;

  result = qword_1EFBA47C0;
  if (!qword_1EFBA47C0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74BD5C, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA47C0);
  }
  return result;
}

unint64_t sub_1CF73D06C()
{
  unint64_t result;

  result = qword_1EFBA47C8;
  if (!qword_1EFBA47C8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74BE14, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA47C8);
  }
  return result;
}

unint64_t sub_1CF73D0AC()
{
  unint64_t result;

  result = qword_1EFBA47D0;
  if (!qword_1EFBA47D0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74BD84, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA47D0);
  }
  return result;
}

unint64_t sub_1CF73D0EC()
{
  unint64_t result;

  result = qword_1EFBA47D8;
  if (!qword_1EFBA47D8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74BDAC, &type metadata for RemoteUnlockDeviceKeyForTunnelResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA47D8);
  }
  return result;
}

unint64_t sub_1CF73D12C()
{
  unint64_t result;

  result = qword_1EFBA47E0;
  if (!qword_1EFBA47E0)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74BCCC, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA47E0);
  }
  return result;
}

unint64_t sub_1CF73D16C()
{
  unint64_t result;

  result = qword_1EFBA47E8;
  if (!qword_1EFBA47E8)
  {
    result = MEMORY[0x1D17D3DEC](&unk_1CF74BCF4, &type metadata for RemoteUnlockDeviceKeyForTunnelRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFBA47E8);
  }
  return result;
}

void OS_dispatch_io.write(content:completingOn:completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_1CF73EDA8();
  MEMORY[0x1E0C80A78](v3);
  __asm { BR              X10 }
}

uint64_t sub_1CF73D240()
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

  *(_QWORD *)(v7 - 112) = v5;
  *(_WORD *)(v7 - 104) = v6;
  *(_BYTE *)(v7 - 102) = BYTE2(v6);
  *(_BYTE *)(v7 - 101) = BYTE3(v6);
  *(_BYTE *)(v7 - 100) = BYTE4(v6);
  *(_BYTE *)(v7 - 99) = BYTE5(v6);
  sub_1CF73ED90();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v1;
  *(_QWORD *)(v8 + 24) = v2;
  swift_retain();
  sub_1CF73F138();
  swift_release();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v0);
}

uint64_t OS_dispatch_io.read(minLength:maxLength:competingOn:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA47F8);
  v7 = swift_allocBox();
  v9 = v8;
  v10 = sub_1CF73EDA8();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v7;
  v11[3] = a4;
  v11[4] = a5;
  swift_retain();
  swift_retain();
  sub_1CF73F108();
  swift_release();
  return swift_release();
}

uint64_t sub_1CF73D4D0()
{
  uint64_t result;

  sub_1CF6CACDC();
  result = sub_1CF73F270();
  qword_1EFBA47F0 = result;
  return result;
}

void sub_1CF73D530(int a1, uint64_t a2, int a3, uint64_t a4, void (*a5)(void *, unint64_t, uint64_t), uint64_t a6)
{
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  int EnumTagSinglePayload;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  int v36;
  uint64_t v37;
  int v38;
  os_log_type_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  void *v54;
  char *v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  void (*v59)(void *, unint64_t, uint64_t);
  int v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67[4];

  v58 = a6;
  v59 = a5;
  v60 = a3;
  v57 = a1;
  v7 = sub_1CF73E3C4();
  v8 = *(_QWORD *)(v7 - 8);
  v62 = v7;
  v63 = v8;
  v9 = MEMORY[0x1E0C80A78](v7);
  v55 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v61 = (char *)&v55 - v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v55 - v13;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA47F8);
  v15 = MEMORY[0x1E0C80A78](v56);
  v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v15);
  v20 = (char *)&v55 - v19;
  v21 = MEMORY[0x1E0C80A78](v18);
  v23 = (char *)&v55 - v22;
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v55 - v24;
  v26 = sub_1CF73EDA8();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v29 = (char *)&v55 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = swift_projectBox();
  sub_1CF73DF88(a2, (uint64_t)v25);
  if (__swift_getEnumTagSinglePayload((uint64_t)v25, 1, v26) == 1)
  {
    sub_1CF73DFD0((uint64_t)v25);
  }
  else
  {
    v31 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v31(v29, v25, v26);
    swift_beginAccess();
    sub_1CF73DF88(v30, (uint64_t)v23);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, v26);
    sub_1CF73DFD0((uint64_t)v23);
    if (EnumTagSinglePayload != 1)
    {
      swift_beginAccess();
      v48 = __swift_getEnumTagSinglePayload(v30, 1, v26);
      v33 = v63;
      v35 = v61;
      v36 = v60;
      if (!v48)
        sub_1CF73ED9C();
      swift_endAccess();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
      v34 = v62;
      if (v36)
        goto LABEL_6;
      goto LABEL_18;
    }
    v31(v20, v29, v26);
    __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v26);
    swift_beginAccess();
    sub_1CF73E050((uint64_t)v20, v30);
  }
  v34 = v62;
  v33 = v63;
  v35 = v61;
  v36 = v60;
  if (v60)
  {
LABEL_6:
    v37 = sub_1CF73E6A0();
    if ((v37 & 0x100000000) != 0)
      v38 = 5;
    else
      v38 = v37;
    LODWORD(v67[0]) = v38;
    sub_1CF6ABA2C(MEMORY[0x1E0DEE9D8]);
    sub_1CF73E010(qword_1EFBA2080, MEMORY[0x1E0CADE88]);
    sub_1CF73E478();
    v39 = sub_1CF73F0CC();
    if (qword_1EFBA0A30 != -1)
      swift_once();
    v40 = qword_1EFBA47F0;
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v35, v14, v34);
    if (os_log_type_enabled(v40, v39))
    {
      v41 = swift_slowAlloc();
      v42 = swift_slowAlloc();
      v67[0] = v42;
      *(_DWORD *)v41 = 67109378;
      LODWORD(v64) = v36;
      sub_1CF73F2A0();
      *(_WORD *)(v41 + 8) = 2082;
      sub_1CF73E010((unint64_t *)&unk_1EFBA3560, MEMORY[0x1E0CADEA0]);
      v43 = sub_1CF73F720();
      sub_1CF68F110(v43, v44, v67);
      v64 = v45;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      v46 = *(void (**)(char *, uint64_t))(v63 + 8);
      v46(v35, v34);
      _os_log_impl(&dword_1CF67E000, v40, v39, "Read error: %d, %{public}s", (uint8_t *)v41, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v42, -1, -1);
      MEMORY[0x1D17D3ED0](v41, -1, -1);
    }
    else
    {
      v46 = *(void (**)(char *, uint64_t))(v33 + 8);
      v46(v35, v34);
    }
    v47 = (void *)sub_1CF73E3B8();
    v59(v47, 0, 1);

    v46(v14, v34);
    return;
  }
LABEL_18:
  if ((v57 & 1) == 0)
    return;
  swift_beginAccess();
  sub_1CF73DF88(v30, (uint64_t)v17);
  v49 = sub_1CF73F27C();
  sub_1CF73DFD0((uint64_t)v17);
  v66 = v49;
  if ((swift_dynamicCast() & 1) != 0)
  {
    v50 = v64;
    v51 = v65;
    if (sub_1CF73E5C8() >= 1)
    {
      sub_1CF6934BC(v50, v51);
      v59((void *)v50, v51, 0);
      sub_1CF6933C0(v50, v51);
      sub_1CF6933C0(v50, v51);
      return;
    }
    sub_1CF6933C0(v50, v51);
  }
  sub_1CF73F0CC();
  if (qword_1EFBA0A30 != -1)
    swift_once();
  v52 = MEMORY[0x1E0DEE9D8];
  sub_1CF73E694();
  LODWORD(v64) = 32;
  sub_1CF6ABA2C(v52);
  sub_1CF73E010(qword_1EFBA2080, MEMORY[0x1E0CADE88]);
  v53 = v55;
  sub_1CF73E478();
  v54 = (void *)sub_1CF73E3B8();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v53, v34);
  v59(v54, 0, 1);

}

uint64_t sub_1CF73DBC8(char a1, uint64_t a2, int a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void *v30;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;

  v9 = sub_1CF73E3C4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)v31 - v15;
  if (a3)
  {
    v31[1] = a5;
    v17 = sub_1CF73E6A0();
    if ((v17 & 0x100000000) != 0)
      v18 = 5;
    else
      v18 = v17;
    LODWORD(v33) = v18;
    sub_1CF6ABA2C(MEMORY[0x1E0DEE9D8]);
    sub_1CF73E010(qword_1EFBA2080, MEMORY[0x1E0CADE88]);
    sub_1CF73E478();
    v19 = sub_1CF73F0CC();
    if (qword_1EFBA0A30 != -1)
      swift_once();
    v20 = qword_1EFBA47F0;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v16, v9);
    v21 = v19;
    if (os_log_type_enabled(v20, v19))
    {
      v22 = swift_slowAlloc();
      v31[0] = a4;
      v23 = v22;
      v24 = swift_slowAlloc();
      v33 = v24;
      *(_DWORD *)v23 = 67109378;
      LODWORD(v32) = a3;
      sub_1CF73F2A0();
      *(_WORD *)(v23 + 8) = 2082;
      sub_1CF73E010((unint64_t *)&unk_1EFBA3560, MEMORY[0x1E0CADEA0]);
      v25 = sub_1CF73F720();
      sub_1CF68F110(v25, v26, &v33);
      v32 = v27;
      sub_1CF73F2A0();
      swift_bridgeObjectRelease();
      v28 = *(void (**)(char *, uint64_t))(v10 + 8);
      v28(v13, v9);
      _os_log_impl(&dword_1CF67E000, v20, v21, "Write error: %d, %{public}s", (uint8_t *)v23, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x1D17D3ED0](v24, -1, -1);
      v29 = v23;
      a4 = (void (*)(void))v31[0];
      MEMORY[0x1D17D3ED0](v29, -1, -1);
    }
    else
    {
      v28 = *(void (**)(char *, uint64_t))(v10 + 8);
      v28(v13, v9);
    }
    v30 = (void *)sub_1CF73E3B8();
    a4();

    return ((uint64_t (*)(char *, uint64_t))v28)(v16, v9);
  }
  else if ((a1 & 1) != 0)
  {
    return ((uint64_t (*)(_QWORD))a4)(0);
  }
  return result;
}

uint64_t sub_1CF73DE94(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1CF73E430();
  if (!result || (result = sub_1CF73E454(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1CF73E448();
      return sub_1CF73ED90();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1CF73DF24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF73DF48(char a1, uint64_t a2, int a3)
{
  uint64_t v3;

  return sub_1CF73DBC8(a1, a2, a3, *(void (**)(void))(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_1CF73DF50()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1CF73DF7C(int a1, uint64_t a2, int a3)
{
  uint64_t v3;

  sub_1CF73D530(a1, a2, a3, *(_QWORD *)(v3 + 16), *(void (**)(void *, unint64_t, uint64_t))(v3 + 24), *(_QWORD *)(v3 + 32));
}

uint64_t sub_1CF73DF88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA47F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CF73DFD0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA47F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CF73E010(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1CF73E3C4();
    result = MEMORY[0x1D17D3DEC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CF73E050(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBA47F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_1(&dword_1CF67E000, v0, v1, "%s Invalid interface index %ld.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_2();
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_1_1(&dword_1CF67E000, v0, v1, "%s Unable to look up name for interface index %ld.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_2();
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1CF67E000, v0, v1, "%s IOBSDNameMatching returned nil for inteface name %s.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3_2();
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_4(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_0_2(&dword_1CF67E000, (int)a2, a3, "%s interface parent does not conform to AppleUSBNCMData", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_5(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_0_2(&dword_1CF67E000, (int)a2, a3, "%s interface parent does have valid USB vendor ID property", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_6(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ServiceHasAppleNCMParent";
  OUTLINED_FUNCTION_0_2(&dword_1CF67E000, (int)a2, a3, "%s Figuring out if service has NCM as parent.", a1);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_7()
{
  int v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_4();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1CF67E000, v1, OS_LOG_TYPE_ERROR, "%s IOServiceGetMatchingServices failed for inteface name %s. Result: %d", (uint8_t *)v2, 0x1Cu);
}

void InterfaceIndexCorrespondsToAppleNCMInterface_cold_8()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_5();
  _os_log_debug_impl(&dword_1CF67E000, v0, OS_LOG_TYPE_DEBUG, "%s Trying to determine whether interface index %ld comes from NCM.", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_3_2();
}

uint64_t sub_1CF73E3A0()
{
  return MEMORY[0x1E0D4D188]();
}

uint64_t sub_1CF73E3AC()
{
  return MEMORY[0x1E0D4D190]();
}

uint64_t sub_1CF73E3B8()
{
  return MEMORY[0x1E0CADE70]();
}

uint64_t sub_1CF73E3C4()
{
  return MEMORY[0x1E0CADE90]();
}

uint64_t sub_1CF73E3D0()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1CF73E3DC()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1CF73E3E8()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1CF73E3F4()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1CF73E400()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1CF73E40C()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1CF73E418()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1CF73E424()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1CF73E430()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1CF73E43C()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1CF73E448()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1CF73E454()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1CF73E460()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1CF73E46C()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1CF73E478()
{
  return MEMORY[0x1E0CAF940]();
}

uint64_t sub_1CF73E484()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1CF73E490()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CF73E49C()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1CF73E4A8()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1CF73E4B4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1CF73E4C0()
{
  return MEMORY[0x1E0CB0080]();
}

uint64_t sub_1CF73E4CC()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1CF73E4D8()
{
  return MEMORY[0x1E0CB0098]();
}

uint64_t sub_1CF73E4E4()
{
  return MEMORY[0x1E0CB00E8]();
}

uint64_t sub_1CF73E4F0()
{
  return MEMORY[0x1E0CB00F8]();
}

uint64_t sub_1CF73E4FC()
{
  return MEMORY[0x1E0CB0108]();
}

uint64_t sub_1CF73E508()
{
  return MEMORY[0x1E0CB0120]();
}

uint64_t sub_1CF73E514()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_1CF73E520()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1CF73E52C()
{
  return MEMORY[0x1E0CB0158]();
}

uint64_t sub_1CF73E538()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1CF73E544()
{
  return MEMORY[0x1E0CB0178]();
}

uint64_t sub_1CF73E550()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_1CF73E55C()
{
  return MEMORY[0x1E0CB01B0]();
}

uint64_t sub_1CF73E568()
{
  return MEMORY[0x1E0CB01B8]();
}

uint64_t sub_1CF73E574()
{
  return MEMORY[0x1E0CB01C0]();
}

uint64_t sub_1CF73E580()
{
  return MEMORY[0x1E0CB01D0]();
}

uint64_t sub_1CF73E58C()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CF73E598()
{
  return MEMORY[0x1E0CB0218]();
}

uint64_t sub_1CF73E5A4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1CF73E5B0()
{
  return MEMORY[0x1E0CB0248]();
}

uint64_t sub_1CF73E5BC()
{
  return MEMORY[0x1E0CB0258]();
}

uint64_t sub_1CF73E5C8()
{
  return MEMORY[0x1E0CB0260]();
}

uint64_t sub_1CF73E5D4()
{
  return MEMORY[0x1E0CB0298]();
}

uint64_t sub_1CF73E5E0()
{
  return MEMORY[0x1E0CB02C0]();
}

uint64_t sub_1CF73E5EC()
{
  return MEMORY[0x1E0CB02F8]();
}

uint64_t sub_1CF73E5F8()
{
  return MEMORY[0x1E0CB03A8]();
}

uint64_t sub_1CF73E604()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1CF73E610()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1CF73E61C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1CF73E628()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1CF73E634()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1CF73E640()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1CF73E64C()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1CF73E658()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1CF73E664()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CF73E670()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_1CF73E67C()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_1CF73E688()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_1CF73E694()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1CF73E6A0()
{
  return MEMORY[0x1E0DF2010]();
}

uint64_t sub_1CF73E6AC()
{
  return MEMORY[0x1E0D4D198]();
}

uint64_t _s7Mercury12RemoteDeviceC0b7PairingC0E18endpointIdentifierSSvg_0()
{
  return MEMORY[0x1E0D4D1A0]();
}

uint64_t sub_1CF73E6C4()
{
  return MEMORY[0x1E0D4D1A8]();
}

uint64_t sub_1CF73E6D0()
{
  return MEMORY[0x1E0D4D1B0]();
}

uint64_t sub_1CF73E6DC()
{
  return MEMORY[0x1E0D4D1B8]();
}

uint64_t sub_1CF73E6E8()
{
  return MEMORY[0x1E0D4D1C8]();
}

uint64_t sub_1CF73E6F4()
{
  return MEMORY[0x1E0D4D1D0]();
}

uint64_t sub_1CF73E700()
{
  return MEMORY[0x1E0D4D1D8]();
}

uint64_t sub_1CF73E70C()
{
  return MEMORY[0x1E0D4D1E0]();
}

uint64_t sub_1CF73E718()
{
  return MEMORY[0x1E0D4D1E8]();
}

uint64_t sub_1CF73E724()
{
  return MEMORY[0x1E0D4D1F0]();
}

uint64_t sub_1CF73E730()
{
  return MEMORY[0x1E0D4D1F8]();
}

uint64_t sub_1CF73E73C()
{
  return MEMORY[0x1E0D4D200]();
}

uint64_t sub_1CF73E748()
{
  return MEMORY[0x1E0D4D208]();
}

uint64_t sub_1CF73E754()
{
  return MEMORY[0x1E0D4D218]();
}

uint64_t sub_1CF73E760()
{
  return MEMORY[0x1E0D4D220]();
}

uint64_t sub_1CF73E76C()
{
  return MEMORY[0x1E0D4D228]();
}

uint64_t sub_1CF73E778()
{
  return MEMORY[0x1E0D4D238]();
}

uint64_t sub_1CF73E784()
{
  return MEMORY[0x1E0D4D240]();
}

uint64_t sub_1CF73E790()
{
  return MEMORY[0x1E0D4D248]();
}

uint64_t sub_1CF73E79C()
{
  return MEMORY[0x1E0D4D250]();
}

uint64_t sub_1CF73E7A8()
{
  return MEMORY[0x1E0D4D270]();
}

uint64_t sub_1CF73E7B4()
{
  return MEMORY[0x1E0D4D278]();
}

uint64_t sub_1CF73E7C0()
{
  return MEMORY[0x1E0D4D288]();
}

uint64_t sub_1CF73E7CC()
{
  return MEMORY[0x1E0D4D290]();
}

uint64_t sub_1CF73E7D8()
{
  return MEMORY[0x1E0D4D2A8]();
}

uint64_t sub_1CF73E7E4()
{
  return MEMORY[0x1E0D4D2B0]();
}

uint64_t sub_1CF73E7F0()
{
  return MEMORY[0x1E0D4D2B8]();
}

uint64_t _s19RemotePairingDevice014CreateWirelessB14SessionRequestV8endpointSo13OS_xpc_object_pvg_0()
{
  return MEMORY[0x1E0D4D2C0]();
}

uint64_t _s19RemotePairingDevice014CreateWirelessB14SessionRequestV8endpointSo13OS_xpc_object_pvs_0()
{
  return MEMORY[0x1E0D4D2C8]();
}

uint64_t sub_1CF73E814()
{
  return MEMORY[0x1E0D4D2D0]();
}

uint64_t sub_1CF73E820()
{
  return MEMORY[0x1E0D4D2F0]();
}

uint64_t sub_1CF73E82C()
{
  return MEMORY[0x1E0D4D2F8]();
}

uint64_t sub_1CF73E838()
{
  return MEMORY[0x1E0D4D300]();
}

uint64_t sub_1CF73E844()
{
  return MEMORY[0x1E0D4D308]();
}

uint64_t sub_1CF73E850()
{
  return MEMORY[0x1E0D4D310]();
}

uint64_t sub_1CF73E85C()
{
  return MEMORY[0x1E0D4D320]();
}

uint64_t sub_1CF73E868()
{
  return MEMORY[0x1E0D4D338]();
}

uint64_t sub_1CF73E874()
{
  return MEMORY[0x1E0D4D348]();
}

uint64_t sub_1CF73E880()
{
  return MEMORY[0x1E0D4D350]();
}

uint64_t sub_1CF73E88C()
{
  return MEMORY[0x1E0D4D360]();
}

uint64_t sub_1CF73E898()
{
  return MEMORY[0x1E0D4D368]();
}

uint64_t sub_1CF73E8A4()
{
  return MEMORY[0x1E0D4D370]();
}

uint64_t sub_1CF73E8B0()
{
  return MEMORY[0x1E0D4D378]();
}

uint64_t sub_1CF73E8BC()
{
  return MEMORY[0x1E0D4D380]();
}

uint64_t sub_1CF73E8C8()
{
  return MEMORY[0x1E0D4D388]();
}

uint64_t sub_1CF73E8D4()
{
  return MEMORY[0x1E0D4D390]();
}

uint64_t sub_1CF73E8E0()
{
  return MEMORY[0x1E0D4D398]();
}

uint64_t sub_1CF73E8EC()
{
  return MEMORY[0x1E0D4D3A0]();
}

uint64_t sub_1CF73E8F8()
{
  return MEMORY[0x1E0D4D3A8]();
}

uint64_t sub_1CF73E904()
{
  return MEMORY[0x1E0D4D3B0]();
}

uint64_t sub_1CF73E910()
{
  return MEMORY[0x1E0D4D3B8]();
}

uint64_t sub_1CF73E91C()
{
  return MEMORY[0x1E0D4D3C0]();
}

uint64_t sub_1CF73E928()
{
  return MEMORY[0x1E0D4D3C8]();
}

uint64_t sub_1CF73E934()
{
  return MEMORY[0x1E0D4D3D0]();
}

uint64_t sub_1CF73E940()
{
  return MEMORY[0x1E0D4D3E0]();
}

uint64_t sub_1CF73E94C()
{
  return MEMORY[0x1E0CCE230]();
}

uint64_t sub_1CF73E958()
{
  return MEMORY[0x1E0CCE270]();
}

uint64_t sub_1CF73E964()
{
  return MEMORY[0x1E0CCE298]();
}

uint64_t sub_1CF73E970()
{
  return MEMORY[0x1E0CCE2A0]();
}

uint64_t sub_1CF73E97C()
{
  return MEMORY[0x1E0CCE310]();
}

uint64_t sub_1CF73E988()
{
  return MEMORY[0x1E0CCE318]();
}

uint64_t sub_1CF73E994()
{
  return MEMORY[0x1E0CCE320]();
}

uint64_t sub_1CF73E9A0()
{
  return MEMORY[0x1E0CCE328]();
}

uint64_t sub_1CF73E9AC()
{
  return MEMORY[0x1E0CCE338]();
}

uint64_t sub_1CF73E9B8()
{
  return MEMORY[0x1E0CCE350]();
}

uint64_t sub_1CF73E9C4()
{
  return MEMORY[0x1E0CCE358]();
}

uint64_t sub_1CF73E9D0()
{
  return MEMORY[0x1E0CCE388]();
}

uint64_t sub_1CF73E9DC()
{
  return MEMORY[0x1E0CCE3A8]();
}

uint64_t sub_1CF73E9E8()
{
  return MEMORY[0x1E0CCE3B0]();
}

uint64_t sub_1CF73E9F4()
{
  return MEMORY[0x1E0CCE3B8]();
}

uint64_t sub_1CF73EA00()
{
  return MEMORY[0x1E0CCE3C0]();
}

uint64_t sub_1CF73EA0C()
{
  return MEMORY[0x1E0CCE3D8]();
}

uint64_t sub_1CF73EA18()
{
  return MEMORY[0x1E0CCE3E0]();
}

uint64_t sub_1CF73EA24()
{
  return MEMORY[0x1E0CCE3E8]();
}

uint64_t sub_1CF73EA30()
{
  return MEMORY[0x1E0CCE400]();
}

uint64_t sub_1CF73EA3C()
{
  return MEMORY[0x1E0CCE408]();
}

uint64_t sub_1CF73EA48()
{
  return MEMORY[0x1E0CCE428]();
}

uint64_t sub_1CF73EA54()
{
  return MEMORY[0x1E0CCE440]();
}

uint64_t sub_1CF73EA60()
{
  return MEMORY[0x1E0CCE448]();
}

uint64_t sub_1CF73EA6C()
{
  return MEMORY[0x1E0CCE468]();
}

uint64_t sub_1CF73EA78()
{
  return MEMORY[0x1E0CCE4E8]();
}

uint64_t sub_1CF73EA84()
{
  return MEMORY[0x1E0CCE548]();
}

uint64_t sub_1CF73EA90()
{
  return MEMORY[0x1E0CCE578]();
}

uint64_t sub_1CF73EA9C()
{
  return MEMORY[0x1E0CCE588]();
}

uint64_t sub_1CF73EAA8()
{
  return MEMORY[0x1E0CCE5A0]();
}

uint64_t sub_1CF73EAB4()
{
  return MEMORY[0x1E0CCE5A8]();
}

uint64_t sub_1CF73EAC0()
{
  return MEMORY[0x1E0CCE5E0]();
}

uint64_t sub_1CF73EACC()
{
  return MEMORY[0x1E0CCE5F0]();
}

uint64_t sub_1CF73EAD8()
{
  return MEMORY[0x1E0CCE5F8]();
}

uint64_t sub_1CF73EAE4()
{
  return MEMORY[0x1E0CCE600]();
}

uint64_t sub_1CF73EAF0()
{
  return MEMORY[0x1E0CCE608]();
}

uint64_t sub_1CF73EAFC()
{
  return MEMORY[0x1E0CCE610]();
}

uint64_t sub_1CF73EB08()
{
  return MEMORY[0x1E0CCE618]();
}

uint64_t sub_1CF73EB14()
{
  return MEMORY[0x1E0CCE620]();
}

uint64_t sub_1CF73EB20()
{
  return MEMORY[0x1E0CCE630]();
}

uint64_t sub_1CF73EB2C()
{
  return MEMORY[0x1E0CCE670]();
}

uint64_t sub_1CF73EB38()
{
  return MEMORY[0x1E0CCE678]();
}

uint64_t sub_1CF73EB44()
{
  return MEMORY[0x1E0CCE6A0]();
}

uint64_t sub_1CF73EB50()
{
  return MEMORY[0x1E0CCE6A8]();
}

uint64_t sub_1CF73EB5C()
{
  return MEMORY[0x1E0CCE6C0]();
}

uint64_t sub_1CF73EB68()
{
  return MEMORY[0x1E0CCE6C8]();
}

uint64_t sub_1CF73EB74()
{
  return MEMORY[0x1E0CCE740]();
}

uint64_t sub_1CF73EB80()
{
  return MEMORY[0x1E0CCE748]();
}

uint64_t sub_1CF73EB8C()
{
  return MEMORY[0x1E0CCE750]();
}

uint64_t sub_1CF73EB98()
{
  return MEMORY[0x1E0CCE760]();
}

uint64_t sub_1CF73EBA4()
{
  return MEMORY[0x1E0CCE768]();
}

uint64_t sub_1CF73EBB0()
{
  return MEMORY[0x1E0CCE778]();
}

uint64_t sub_1CF73EBBC()
{
  return MEMORY[0x1E0CCE780]();
}

uint64_t sub_1CF73EBC8()
{
  return MEMORY[0x1E0CCE7C0]();
}

uint64_t sub_1CF73EBD4()
{
  return MEMORY[0x1E0CCE7C8]();
}

uint64_t sub_1CF73EBE0()
{
  return MEMORY[0x1E0CCE7F0]();
}

uint64_t sub_1CF73EBEC()
{
  return MEMORY[0x1E0CCE7F8]();
}

uint64_t sub_1CF73EBF8()
{
  return MEMORY[0x1E0CCE800]();
}

uint64_t sub_1CF73EC04()
{
  return MEMORY[0x1E0CCE808]();
}

uint64_t sub_1CF73EC10()
{
  return MEMORY[0x1E0CCE930]();
}

uint64_t sub_1CF73EC1C()
{
  return MEMORY[0x1E0CCE938]();
}

uint64_t sub_1CF73EC28()
{
  return MEMORY[0x1E0CCE978]();
}

uint64_t sub_1CF73EC34()
{
  return MEMORY[0x1E0CCE988]();
}

uint64_t sub_1CF73EC40()
{
  return MEMORY[0x1E0CCE990]();
}

uint64_t sub_1CF73EC4C()
{
  return MEMORY[0x1E0CCE9B8]();
}

uint64_t sub_1CF73EC58()
{
  return MEMORY[0x1E0CCEA50]();
}

uint64_t sub_1CF73EC64()
{
  return MEMORY[0x1E0CCEA58]();
}

uint64_t sub_1CF73EC70()
{
  return MEMORY[0x1E0CCEA90]();
}

uint64_t sub_1CF73EC7C()
{
  return MEMORY[0x1E0CCEAD8]();
}

uint64_t sub_1CF73EC88()
{
  return MEMORY[0x1E0CCEB10]();
}

uint64_t sub_1CF73EC94()
{
  return MEMORY[0x1E0CCEB30]();
}

uint64_t sub_1CF73ECA0()
{
  return MEMORY[0x1E0CCEB40]();
}

uint64_t sub_1CF73ECAC()
{
  return MEMORY[0x1E0CCEB50]();
}

uint64_t sub_1CF73ECB8()
{
  return MEMORY[0x1E0CCEB58]();
}

uint64_t sub_1CF73ECC4()
{
  return MEMORY[0x1E0CCEB60]();
}

uint64_t sub_1CF73ECD0()
{
  return MEMORY[0x1E0CCEB68]();
}

uint64_t sub_1CF73ECDC()
{
  return MEMORY[0x1E0CCEB70]();
}

uint64_t sub_1CF73ECE8()
{
  return MEMORY[0x1E0CCEB78]();
}

uint64_t sub_1CF73ECF4()
{
  return MEMORY[0x1E0CCEBA0]();
}

uint64_t sub_1CF73ED00()
{
  return MEMORY[0x1E0CCEBB0]();
}

uint64_t sub_1CF73ED0C()
{
  return MEMORY[0x1E0CCEBB8]();
}

uint64_t sub_1CF73ED18()
{
  return MEMORY[0x1E0CCEBC0]();
}

uint64_t sub_1CF73ED24()
{
  return MEMORY[0x1E0CCEBC8]();
}

uint64_t sub_1CF73ED30()
{
  return MEMORY[0x1E0CCEBE8]();
}

uint64_t sub_1CF73ED3C()
{
  return MEMORY[0x1E0CCEBF0]();
}

uint64_t sub_1CF73ED48()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1CF73ED54()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CF73ED60()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1CF73ED6C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CF73ED78()
{
  return MEMORY[0x1E0DEF588]();
}

uint64_t sub_1CF73ED84()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CF73ED90()
{
  return MEMORY[0x1E0DEF610]();
}

uint64_t sub_1CF73ED9C()
{
  return MEMORY[0x1E0DEF628]();
}

uint64_t sub_1CF73EDA8()
{
  return MEMORY[0x1E0DEF648]();
}

uint64_t sub_1CF73EDB4()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1CF73EDC0()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1CF73EDCC()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1CF73EDD8()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1CF73EDE4()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1CF73EDF0()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1CF73EDFC()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1CF73EE08()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1CF73EE14()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CF73EE20()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1CF73EE2C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CF73EE38()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1CF73EE44()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1CF73EE50()
{
  return MEMORY[0x1E0DE9FF8]();
}

uint64_t sub_1CF73EE5C()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1CF73EE68()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1CF73EE74()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1CF73EE80()
{
  return MEMORY[0x1E0DEA3E0]();
}

uint64_t sub_1CF73EE8C()
{
  return MEMORY[0x1E0DEA3E8]();
}

uint64_t sub_1CF73EE98()
{
  return MEMORY[0x1E0DEA3F0]();
}

uint64_t sub_1CF73EEA4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CF73EEB0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CF73EEBC()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1CF73EEC8()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1CF73EED4()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CF73EEE0()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1CF73EEEC()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1CF73EEF8()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1CF73EF04()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1CF73EF10()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1CF73EF1C()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1CF73EF28()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1CF73EF34()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CF73EF40()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1CF73EF4C()
{
  return MEMORY[0x1E0DEA7D8]();
}

uint64_t sub_1CF73EF58()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CF73EF64()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CF73EF70()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1CF73EF7C()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1CF73EF88()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1CF73EF94()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1CF73EFA0()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1CF73EFAC()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1CF73EFB8()
{
  return MEMORY[0x1E0DEAA38]();
}

uint64_t sub_1CF73EFC4()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1CF73EFD0()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1CF73EFDC()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1CF73EFE8()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1CF73EFF4()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t sub_1CF73F000()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1CF73F00C()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1CF73F018()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1CF73F024()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1CF73F030()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CF73F03C()
{
  return MEMORY[0x1E0CB1AE0]();
}

uint64_t sub_1CF73F048()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CF73F054()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1CF73F060()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1CF73F06C()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1CF73F078()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1CF73F084()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1CF73F090()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1CF73F09C()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1CF73F0A8()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1CF73F0B4()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1CF73F0C0()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CF73F0CC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CF73F0D8()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1CF73F0E4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CF73F0F0()
{
  return MEMORY[0x1E0DEF780]();
}

uint64_t sub_1CF73F0FC()
{
  return MEMORY[0x1E0DEF7A0]();
}

uint64_t sub_1CF73F108()
{
  return MEMORY[0x1E0DEF7A8]();
}

uint64_t sub_1CF73F114()
{
  return MEMORY[0x1E0DEF7B0]();
}

uint64_t sub_1CF73F120()
{
  return MEMORY[0x1E0DEF7B8]();
}

uint64_t sub_1CF73F12C()
{
  return MEMORY[0x1E0DEF7C0]();
}

uint64_t sub_1CF73F138()
{
  return MEMORY[0x1E0DEF7C8]();
}

uint64_t sub_1CF73F144()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1CF73F150()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CF73F15C()
{
  return MEMORY[0x1E0DEF840]();
}

uint64_t sub_1CF73F168()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1CF73F174()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CF73F180()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CF73F18C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CF73F198()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1CF73F1A4()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1CF73F1B0()
{
  return MEMORY[0x1E0DEF950]();
}

uint64_t sub_1CF73F1BC()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1CF73F1C8()
{
  return MEMORY[0x1E0DEF980]();
}

uint64_t sub_1CF73F1D4()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1CF73F1E0()
{
  return MEMORY[0x1E0DEFA00]();
}

uint64_t sub_1CF73F1EC()
{
  return MEMORY[0x1E0DEFA10]();
}

uint64_t sub_1CF73F1F8()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1CF73F204()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1CF73F210()
{
  return MEMORY[0x1E0DEFA28]();
}

uint64_t sub_1CF73F21C()
{
  return MEMORY[0x1E0D4D3F0]();
}

uint64_t sub_1CF73F228()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1CF73F234()
{
  return MEMORY[0x1E0D4D3F8]();
}

uint64_t sub_1CF73F240()
{
  return MEMORY[0x1E0D4D400]();
}

uint64_t sub_1CF73F24C()
{
  return MEMORY[0x1E0D4D408]();
}

uint64_t sub_1CF73F258()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CF73F264()
{
  return MEMORY[0x1E0D4D410]();
}

uint64_t sub_1CF73F270()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1CF73F27C()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1CF73F288()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CF73F294()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1CF73F2A0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CF73F2AC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CF73F2B8()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1CF73F2C4()
{
  return MEMORY[0x1E0CB2558]();
}

uint64_t sub_1CF73F2D0()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1CF73F2DC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CF73F2E8()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1CF73F2F4()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CF73F300()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1CF73F30C()
{
  return MEMORY[0x1E0DEC130]();
}

uint64_t sub_1CF73F318()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1CF73F324()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1CF73F330()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1CF73F33C()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1CF73F348()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1CF73F354()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CF73F360()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CF73F36C()
{
  return MEMORY[0x1E0DEC430]();
}

uint64_t sub_1CF73F378()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1CF73F384()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1CF73F390()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CF73F39C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1CF73F3A8()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1CF73F3B4()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1CF73F3C0()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1CF73F3CC()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1CF73F3D8()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1CF73F3E4()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1CF73F3F0()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1CF73F3FC()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1CF73F408()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1CF73F414()
{
  return MEMORY[0x1E0DECA50]();
}

uint64_t sub_1CF73F420()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1CF73F42C()
{
  return MEMORY[0x1E0DECAF8]();
}

uint64_t sub_1CF73F438()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1CF73F444()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CF73F450()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CF73F45C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CF73F468()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CF73F474()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CF73F480()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CF73F48C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1CF73F498()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1CF73F4A4()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1CF73F4B0()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1CF73F4BC()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1CF73F4C8()
{
  return MEMORY[0x1E0DECF60]();
}

uint64_t sub_1CF73F4D4()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_1CF73F4E0()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1CF73F4EC()
{
  return MEMORY[0x1E0DECFB8]();
}

uint64_t sub_1CF73F4F8()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1CF73F504()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1CF73F510()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1CF73F51C()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1CF73F528()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1CF73F534()
{
  return MEMORY[0x1E0DED008]();
}

uint64_t sub_1CF73F540()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1CF73F54C()
{
  return MEMORY[0x1E0DED020]();
}

uint64_t sub_1CF73F558()
{
  return MEMORY[0x1E0DED030]();
}

uint64_t sub_1CF73F564()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1CF73F570()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1CF73F57C()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1CF73F588()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1CF73F594()
{
  return MEMORY[0x1E0DED098]();
}

uint64_t sub_1CF73F5A0()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_1CF73F5AC()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1CF73F5B8()
{
  return MEMORY[0x1E0DED0E8]();
}

uint64_t sub_1CF73F5C4()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1CF73F5D0()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1CF73F5DC()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1CF73F5E8()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1CF73F5F4()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1CF73F600()
{
  return MEMORY[0x1E0DED138]();
}

uint64_t sub_1CF73F60C()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1CF73F618()
{
  return MEMORY[0x1E0DED150]();
}

uint64_t sub_1CF73F624()
{
  return MEMORY[0x1E0DED160]();
}

uint64_t sub_1CF73F630()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1CF73F63C()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1CF73F648()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CF73F654()
{
  return MEMORY[0x1E0DED1E0]();
}

uint64_t sub_1CF73F660()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1CF73F66C()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1CF73F678()
{
  return MEMORY[0x1E0DED568]();
}

uint64_t sub_1CF73F684()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1CF73F690()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CF73F69C()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1CF73F6A8()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_1CF73F6B4()
{
  return MEMORY[0x1E0DED6C8]();
}

uint64_t sub_1CF73F6C0()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1CF73F6CC()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1CF73F6D8()
{
  return MEMORY[0x1E0D4D418]();
}

uint64_t sub_1CF73F6E4()
{
  return MEMORY[0x1E0D4D420]();
}

uint64_t sub_1CF73F6F0()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1CF73F6FC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CF73F708()
{
  return MEMORY[0x1E0CB2628]();
}

uint64_t sub_1CF73F714()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1CF73F720()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1CF73F72C()
{
  return MEMORY[0x1E0D4D428]();
}

uint64_t sub_1CF73F738()
{
  return MEMORY[0x1E0D4D430]();
}

uint64_t sub_1CF73F744()
{
  return MEMORY[0x1E0D4D438]();
}

uint64_t sub_1CF73F750()
{
  return MEMORY[0x1E0D4D440]();
}

uint64_t sub_1CF73F75C()
{
  return MEMORY[0x1E0D4D448]();
}

uint64_t sub_1CF73F768()
{
  return MEMORY[0x1E0D4D450]();
}

uint64_t sub_1CF73F774()
{
  return MEMORY[0x1E0D4D458]();
}

uint64_t sub_1CF73F780()
{
  return MEMORY[0x1E0D4D460]();
}

uint64_t sub_1CF73F78C()
{
  return MEMORY[0x1E0D4D468]();
}

uint64_t sub_1CF73F798()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CF73F7A4()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CF73F7B0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CF73F7BC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CF73F7C8()
{
  return MEMORY[0x1E0CB26A0]();
}

uint64_t sub_1CF73F7D4()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1CF73F7E0()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1CF73F7EC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CF73F7F8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CF73F804()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_1CF73F810()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1CF73F81C()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_1CF73F828()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1CF73F834()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1CF73F840()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1CF73F84C()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1CF73F858()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1CF73F864()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1CF73F870()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1CF73F87C()
{
  return MEMORY[0x1E0DEE978]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x1E0D1ACE8]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBAD28](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1E0CBB6C8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1E0CBB958](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBKeyBagCopyData()
{
  return MEMORY[0x1E0D4E4E0]();
}

uint64_t MKBKeyBagCreateEscrow()
{
  return MEMORY[0x1E0D4E4E8]();
}

uint64_t MKBKeyBagCreateWithData()
{
  return MEMORY[0x1E0D4E4F8]();
}

uint64_t MKBKeyBagUnlock()
{
  return MEMORY[0x1E0D4E540]();
}

uint64_t NEVirtualInterfaceAddAddress()
{
  return MEMORY[0x1E0CD0760]();
}

uint64_t NEVirtualInterfaceCopyName()
{
  return MEMORY[0x1E0CD0768]();
}

uint64_t NEVirtualInterfaceCopyNexusInstances()
{
  return MEMORY[0x1E0CD0770]();
}

uint64_t NEVirtualInterfaceCopyStatistics()
{
  return MEMORY[0x1E0CD0778]();
}

uint64_t NEVirtualInterfaceCreateNexusExtendedWithOptions()
{
  return MEMORY[0x1E0CD0780]();
}

uint64_t NEVirtualInterfaceCreateWithOptions()
{
  return MEMORY[0x1E0CD0788]();
}

uint64_t NEVirtualInterfaceInvalidate()
{
  return MEMORY[0x1E0CD0790]();
}

uint64_t NEVirtualInterfaceReadyToReadMultiple()
{
  return MEMORY[0x1E0CD0798]();
}

uint64_t NEVirtualInterfaceSetDelegateInterface()
{
  return MEMORY[0x1E0CD07A0]();
}

uint64_t NEVirtualInterfaceSetMTU()
{
  return MEMORY[0x1E0CD07A8]();
}

uint64_t NEVirtualInterfaceSetMaxPendingPackets()
{
  return MEMORY[0x1E0CD07B0]();
}

uint64_t NEVirtualInterfaceSetRankNever()
{
  return MEMORY[0x1E0CD07B8]();
}

uint64_t NEVirtualInterfaceSetReadAutomatically()
{
  return MEMORY[0x1E0CD07C0]();
}

uint64_t NEVirtualInterfaceSetReadMultipleIPPacketsHandler()
{
  return MEMORY[0x1E0CD07C8]();
}

uint64_t NEVirtualInterfaceUpdateAdHocService()
{
  return MEMORY[0x1E0CD07D0]();
}

uint64_t NEVirtualInterfaceWriteMultipleIPPackets()
{
  return MEMORY[0x1E0CD07D8]();
}

uint64_t NWCreateDispatchDataFromNSData()
{
  return MEMORY[0x1E0CCEC10]();
}

uint64_t NWCreateNSDataFromDispatchData()
{
  return MEMORY[0x1E0CCEC18]();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x1E0CE8738](store, nameEncoding);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x1E0CD6268]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1E0CD6280]();
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1E0CD6318](key);
}

uint64_t SecKeyCopySubjectPublicKeyInfo()
{
  return MEMORY[0x1E0CD6328]();
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1E0D1B798]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t cced25519_make_key_pair()
{
  return MEMORY[0x1E0C81E70]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C823F8]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
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

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
  MEMORY[0x1E0C82D98](channel, low_water);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1E0C83900](*(_QWORD *)&a1, a2);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t nw_channel_close()
{
  return MEMORY[0x1E0CCEF68]();
}

uint64_t nw_channel_create_with_attributes()
{
  return MEMORY[0x1E0CCEF70]();
}

uint64_t nw_channel_get_protocol_handler()
{
  return MEMORY[0x1E0CCEF90]();
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x1E0CCF020](connection, definition);
}

uint64_t nw_connection_receive_multiple()
{
  return MEMORY[0x1E0CCF138]();
}

uint64_t nw_connection_write_multiple()
{
  return MEMORY[0x1E0CCF210]();
}

uint64_t nw_context_activate()
{
  return MEMORY[0x1E0CCF268]();
}

uint64_t nw_context_create()
{
  return MEMORY[0x1E0CCF290]();
}

uint64_t nw_context_set_isolate_protocol_stack()
{
  return MEMORY[0x1E0CCF2C8]();
}

uint64_t nw_context_set_scheduling_mode()
{
  return MEMORY[0x1E0CCF2D8]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x1E0CCF4F0]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x1E0CCF4F8]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x1E0CCF508]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1E0CCF538]();
}

uint64_t nw_frame_collapse()
{
  return MEMORY[0x1E0CCF540]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1E0CCF558]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x1E0CCF5B0]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x1E0CCF5B8]();
}

nw_protocol_definition_t nw_protocol_copy_quic_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCFEB8]();
}

uint64_t nw_protocol_create()
{
  return MEMORY[0x1E0CCFEF0]();
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x1E0CCFF90]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x1E0CD0100]();
}

uint16_t nw_quic_get_stream_usable_datagram_frame_size(nw_protocol_metadata_t metadata)
{
  return MEMORY[0x1E0CD0200](metadata);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x1E0CD7148](identity);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
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

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1E0DEEB70]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
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

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return MEMORY[0x1E0DEEDB8]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x1E0DEEF28]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x1E0DEEF30]();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x1E0DEEF50]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x1E0DEEF58]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

uint64_t xpc_remote_connection_get_remote_service_version()
{
  return MEMORY[0x1E0D873A8]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

